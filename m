From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jun 2022 17:47:32 +0530
Subject: [RFC PATCH v2 3/9] lib: irqchip/plic: Constify plic_data pointers
In-Reply-To: <20220530033738.27127-4-samuel@sholland.org>
References: <20220530033738.27127-1-samuel@sholland.org> <20220530033738.27127-4-samuel@sholland.org>
Message-ID: <CAAhSdy2AiQAKBUBQUrNwTobJ+jTfL00i+Qbx=AOZkQK+SMa2Lw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 9:07 AM Samuel Holland <samuel@sholland.org> wrote:
>
> None of the functions modify the passed-in plic_data, so mark it const.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v2:
>  - New patch for v2
>
>  include/sbi_utils/irqchip/plic.h |  9 +++++----
>  lib/utils/irqchip/plic.c         | 11 ++++++-----
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
> index 0e56d80..50be5df 100644
> --- a/include/sbi_utils/irqchip/plic.h
> +++ b/include/sbi_utils/irqchip/plic.h
> @@ -17,13 +17,14 @@ struct plic_data {
>         unsigned long num_src;
>  };
>
> -int plic_warm_irqchip_init(struct plic_data *plic,
> +int plic_warm_irqchip_init(const struct plic_data *plic,
>                            int m_cntx_id, int s_cntx_id);
>
> -int plic_cold_irqchip_init(struct plic_data *plic);
> +int plic_cold_irqchip_init(const struct plic_data *plic);
>
> -void plic_set_thresh(struct plic_data *plic, u32 cntxid, u32 val);
> +void plic_set_thresh(const struct plic_data *plic, u32 cntxid, u32 val);
>
> -void plic_set_ie(struct plic_data *plic, u32 cntxid, u32 word_index, u32 val);
> +void plic_set_ie(const struct plic_data *plic, u32 cntxid,
> +                u32 word_index, u32 val);
>
>  #endif
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 0f58f3e..4c334ec 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -21,14 +21,14 @@
>  #define PLIC_CONTEXT_BASE 0x200000
>  #define PLIC_CONTEXT_STRIDE 0x1000
>
> -static void plic_set_priority(struct plic_data *plic, u32 source, u32 val)
> +static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>  {
>         volatile void *plic_priority = (char *)plic->addr +
>                         PLIC_PRIORITY_BASE + 4 * source;
>         writel(val, plic_priority);
>  }
>
> -void plic_set_thresh(struct plic_data *plic, u32 cntxid, u32 val)
> +void plic_set_thresh(const struct plic_data *plic, u32 cntxid, u32 val)
>  {
>         volatile void *plic_thresh;
>
> @@ -40,7 +40,8 @@ void plic_set_thresh(struct plic_data *plic, u32 cntxid, u32 val)
>         writel(val, plic_thresh);
>  }
>
> -void plic_set_ie(struct plic_data *plic, u32 cntxid, u32 word_index, u32 val)
> +void plic_set_ie(const struct plic_data *plic, u32 cntxid,
> +                u32 word_index, u32 val)
>  {
>         volatile char *plic_ie;
>
> @@ -52,7 +53,7 @@ void plic_set_ie(struct plic_data *plic, u32 cntxid, u32 word_index, u32 val)
>         writel(val, plic_ie + word_index * 4);
>  }
>
> -int plic_warm_irqchip_init(struct plic_data *plic,
> +int plic_warm_irqchip_init(const struct plic_data *plic,
>                            int m_cntx_id, int s_cntx_id)
>  {
>         size_t i, ie_words;
> @@ -85,7 +86,7 @@ int plic_warm_irqchip_init(struct plic_data *plic,
>         return 0;
>  }
>
> -int plic_cold_irqchip_init(struct plic_data *plic)
> +int plic_cold_irqchip_init(const struct plic_data *plic)
>  {
>         int i;
>
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

