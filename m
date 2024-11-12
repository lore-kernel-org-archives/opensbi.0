From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Nov 2024 09:41:16 +0530
Subject: [PATCH 1/9] lib: utils/irqchip: plic: Allow enabling IRQs by default
In-Reply-To: <20241105041015.2949808-2-samuel.holland@sifive.com>
References: <20241105041015.2949808-1-samuel.holland@sifive.com> <20241105041015.2949808-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3f35aRa7yuH16MssdUi8O=AhK+b+Q40P+N9m0XhS4s_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 5, 2024 at 9:40?AM Samuel Holland <samuel.holland@sifive.com> wrote:
>
> Unlike other platforms, Ariane and OpenPiton enable all IRQs by default.
> This was described in commit b44e844880d0 ("Add support for Ariane FPGA
> SoC") as "due to some issue of the design." Add this workaround behind a
> flag in plic_warm_irqchip_init(), so every platform can use the same
> warm init function.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
>  include/sbi_utils/irqchip/plic.h   |  7 ++++---
>  lib/utils/irqchip/plic.c           | 17 +++++++++++------
>  platform/fpga/ariane/platform.c    | 25 +++----------------------
>  platform/fpga/openpiton/platform.c | 25 +++----------------------
>  4 files changed, 21 insertions(+), 53 deletions(-)
>
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index 2eda6310..5da09055 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -16,8 +16,12 @@ struct plic_data {
>         unsigned long addr;
>         unsigned long size;
>         unsigned long num_src;
> +       unsigned long flags;
>  };
>
> +/** Work around a bug on Ariane that requires enabling interrupts at boot */
> +#define PLIC_FLAG_ARIANE_BUG           BIT(0)
> +
>  /* So far, priorities on all consumers of these functions fit in 8 bits. */
>  void plic_priority_save(const struct plic_data *plic, u8 *priority, u32 num);
>
> @@ -30,9 +34,6 @@ void plic_context_save(const struct plic_data *plic, int context_id,
>  void plic_context_restore(const struct plic_data *plic, int context_id,
>                           const u32 *enable, u32 threshold, u32 num);
>
> -int plic_context_init(const struct plic_data *plic, int context_id,
> -                     bool enable, u32 threshold);
> -
>  int plic_warm_irqchip_init(const struct plic_data *plic,
>                            int m_cntx_id, int s_cntx_id);
>
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 193e3201..c66a6886 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -121,8 +121,8 @@ void plic_context_restore(const struct plic_data *plic, int context_id,
>         plic_set_thresh(plic, context_id, threshold);
>  }
>
> -int plic_context_init(const struct plic_data *plic, int context_id,
> -                     bool enable, u32 threshold)
> +static int plic_context_init(const struct plic_data *plic, int context_id,
> +                            bool enable, u32 threshold)
>  {
>         u32 ie_words, ie_value;
>
> @@ -143,18 +143,23 @@ int plic_context_init(const struct plic_data *plic, int context_id,
>  int plic_warm_irqchip_init(const struct plic_data *plic,
>                            int m_cntx_id, int s_cntx_id)
>  {
> +       bool enable;
>         int ret;
>
> -       /* By default, disable all IRQs for M-mode of target HART */
> +       /*
> +        * By default, disable all IRQs for the target HART. Ariane
> +        * has a bug which requires enabling all interrupts at boot.
> +        */
> +       enable = plic->flags & PLIC_FLAG_ARIANE_BUG;
> +
>         if (m_cntx_id > -1) {
> -               ret = plic_context_init(plic, m_cntx_id, false, 0x7);
> +               ret = plic_context_init(plic, m_cntx_id, enable, 0x7);
>                 if (ret)
>                         return ret;
>         }
>
> -       /* By default, disable all IRQs for S-mode of target HART */
>         if (s_cntx_id > -1) {
> -               ret = plic_context_init(plic, s_cntx_id, false, 0x7);
> +               ret = plic_context_init(plic, s_cntx_id, enable, 0x7);
>                 if (ret)
>                         return ret;
>         }
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index ec0584ab..b21d9ba9 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -39,6 +39,7 @@ static struct plic_data plic = {
>         .addr = ARIANE_PLIC_ADDR,
>         .size = ARIANE_PLIC_SIZE,
>         .num_src = ARIANE_PLIC_NUM_SOURCES,
> +       .flags = PLIC_FLAG_ARIANE_BUG,
>  };
>
>  static struct aclint_mswi_data mswi = {
> @@ -93,27 +94,6 @@ static int ariane_final_init(bool cold_boot)
>         return 0;
>  }
>
> -static int plic_ariane_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
> -{
> -       int ret;
> -
> -       /* By default, enable all IRQs for M-mode of target HART */
> -       if (m_cntx_id > -1) {
> -               ret = plic_context_init(&plic, m_cntx_id, true, 0x1);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       /* Enable all IRQs for S-mode of target HART */
> -       if (s_cntx_id > -1) {
> -               ret = plic_context_init(&plic, s_cntx_id, true, 0x0);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  /*
>   * Initialize the ariane interrupt controller for current HART.
>   */
> @@ -127,7 +107,8 @@ static int ariane_irqchip_init(bool cold_boot)
>                 if (ret)
>                         return ret;
>         }
> -       return plic_ariane_warm_irqchip_init(2 * hartid, 2 * hartid + 1);
> +
> +       return plic_warm_irqchip_init(&plic, 2 * hartid, 2 * hartid + 1);
>  }
>
>  /*
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index 81cc48f4..c1e84b61 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -43,6 +43,7 @@ static struct plic_data plic = {
>         .addr = OPENPITON_DEFAULT_PLIC_ADDR,
>         .size = OPENPITON_DEFAULT_PLIC_SIZE,
>         .num_src = OPENPITON_DEFAULT_PLIC_NUM_SOURCES,
> +       .flags = PLIC_FLAG_ARIANE_BUG,
>  };
>
>  static struct aclint_mswi_data mswi = {
> @@ -124,27 +125,6 @@ static int openpiton_final_init(bool cold_boot)
>         return 0;
>  }
>
> -static int plic_openpiton_warm_irqchip_init(int m_cntx_id, int s_cntx_id)
> -{
> -       int ret;
> -
> -       /* By default, enable all IRQs for M-mode of target HART */
> -       if (m_cntx_id > -1) {
> -               ret = plic_context_init(&plic, m_cntx_id, true, 0x1);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       /* Enable all IRQs for S-mode of target HART */
> -       if (s_cntx_id > -1) {
> -               ret = plic_context_init(&plic, s_cntx_id, true, 0x0);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  /*
>   * Initialize the openpiton interrupt controller for current HART.
>   */
> @@ -158,7 +138,8 @@ static int openpiton_irqchip_init(bool cold_boot)
>                 if (ret)
>                         return ret;
>         }
> -       return plic_openpiton_warm_irqchip_init(2 * hartid, 2 * hartid + 1);
> +
> +       return plic_warm_irqchip_init(&plic, 2 * hartid, 2 * hartid + 1);
>  }
>
>  /*
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

