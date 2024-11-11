From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Nov 2024 18:28:20 +0530
Subject: [PATCH v2 2/3] lib: sbi_ipi: Move initial IPI clear to sbi_ipi_init()
In-Reply-To: <20241025185950.1371610-3-samuel.holland@sifive.com>
References: <20241025185950.1371610-1-samuel.holland@sifive.com> <20241025185950.1371610-3-samuel.holland@sifive.com>
Message-ID: <CAAhSdy2KxwtihtpNxJ5HX=E609iJMisOfSy90KBkLXc47zMVfA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 26, 2024 at 12:45?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> sbi_ipi_init() expects the platform warm init function to clear IPIs
> on the local hart, but there is already a generic function to do this.
> After this change, none of the existing drivers need a warm init
> callback.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> (no changes since v1)
>
>  include/sbi_utils/ipi/aclint_mswi.h  | 2 --
>  include/sbi_utils/ipi/andes_plicsw.h | 2 --
>  lib/sbi/sbi_hsm.c                    | 2 +-
>  lib/sbi/sbi_ipi.c                    | 8 ++++----
>  lib/utils/ipi/aclint_mswi.c          | 8 --------
>  lib/utils/ipi/andes_plicsw.c         | 8 --------
>  lib/utils/ipi/fdt_ipi_mswi.c         | 2 +-
>  lib/utils/ipi/fdt_ipi_plicsw.c       | 2 +-
>  platform/fpga/ariane/platform.c      | 2 +-
>  platform/fpga/openpiton/platform.c   | 2 +-
>  platform/kendryte/k210/platform.c    | 2 +-
>  platform/nuclei/ux600/platform.c     | 2 +-
>  platform/template/platform.c         | 2 +-
>  13 files changed, 12 insertions(+), 32 deletions(-)
>
> diff --git a/include/sbi_utils/ipi/aclint_mswi.h b/include/sbi_utils/ipi/aclint_mswi.h
> index e373a8cb..4b8249f2 100644
> --- a/include/sbi_utils/ipi/aclint_mswi.h
> +++ b/include/sbi_utils/ipi/aclint_mswi.h
> @@ -26,8 +26,6 @@ struct aclint_mswi_data {
>         u32 hart_count;
>  };
>
> -int aclint_mswi_warm_init(void);
> -
>  int aclint_mswi_cold_init(struct aclint_mswi_data *mswi);
>
>  #endif
> diff --git a/include/sbi_utils/ipi/andes_plicsw.h b/include/sbi_utils/ipi/andes_plicsw.h
> index 0d184449..f6e1cae5 100644
> --- a/include/sbi_utils/ipi/andes_plicsw.h
> +++ b/include/sbi_utils/ipi/andes_plicsw.h
> @@ -32,8 +32,6 @@ struct plicsw_data {
>         uint32_t hart_count;
>  };
>
> -int plicsw_warm_ipi_init(void);
> -
>  int plicsw_cold_ipi_init(struct plicsw_data *plicsw);
>
>  #endif /* _IPI_ANDES_PLICSW_H_ */
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 58a33798..a3d6947a 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -178,7 +178,7 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
>
>         /*
>          * No need to clear IPI here because the sbi_ipi_init() will
> -        * clear it for current HART via sbi_platform_ipi_init().
> +        * clear it for current HART.
>          */
>  }
>
> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> index 33b4d9b3..b39f03e0 100644
> --- a/lib/sbi/sbi_ipi.c
> +++ b/lib/sbi/sbi_ipi.c
> @@ -332,14 +332,14 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
>         ipi_data = sbi_scratch_offset_ptr(scratch, ipi_data_off);
>         ipi_data->ipi_type = 0x00;
>
> -       /*
> -        * Initialize platform IPI support. This will also clear any
> -        * pending IPIs for current/calling HART.
> -        */
> +       /* Initialize platform IPI support */
>         ret = sbi_platform_ipi_init(sbi_platform_ptr(scratch), cold_boot);
>         if (ret)
>                 return ret;
>
> +       /* Clear any pending IPIs for the current hart */
> +       sbi_ipi_raw_clear();
> +
>         /* Enable software interrupts */
>         csr_set(CSR_MIE, MIP_MSIP);
>
> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
> index 2cd7a530..9e55078a 100644
> --- a/lib/utils/ipi/aclint_mswi.c
> +++ b/lib/utils/ipi/aclint_mswi.c
> @@ -66,14 +66,6 @@ static struct sbi_ipi_device aclint_mswi = {
>         .ipi_clear = mswi_ipi_clear
>  };
>
> -int aclint_mswi_warm_init(void)
> -{
> -       /* Clear IPI for current HART */
> -       mswi_ipi_clear();
> -
> -       return 0;
> -}
> -
>  int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
>  {
>         u32 i;
> diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
> index 626699f9..5d085d85 100644
> --- a/lib/utils/ipi/andes_plicsw.c
> +++ b/lib/utils/ipi/andes_plicsw.c
> @@ -65,14 +65,6 @@ static struct sbi_ipi_device plicsw_ipi = {
>         .ipi_clear = plicsw_ipi_clear
>  };
>
> -int plicsw_warm_ipi_init(void)
> -{
> -       /* Clear PLICSW IPI */
> -       plicsw_ipi_clear();
> -
> -       return 0;
> -}
> -
>  int plicsw_cold_ipi_init(struct plicsw_data *plicsw)
>  {
>         int rc;
> diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
> index c78dead1..01331970 100644
> --- a/lib/utils/ipi/fdt_ipi_mswi.c
> +++ b/lib/utils/ipi/fdt_ipi_mswi.c
> @@ -64,6 +64,6 @@ static const struct fdt_match ipi_mswi_match[] = {
>  struct fdt_ipi fdt_ipi_mswi = {
>         .match_table = ipi_mswi_match,
>         .cold_init = ipi_mswi_cold_init,
> -       .warm_init = aclint_mswi_warm_init,
> +       .warm_init = NULL,
>         .exit = NULL,
>  };
> diff --git a/lib/utils/ipi/fdt_ipi_plicsw.c b/lib/utils/ipi/fdt_ipi_plicsw.c
> index 32885745..1fd6ba1d 100644
> --- a/lib/utils/ipi/fdt_ipi_plicsw.c
> +++ b/lib/utils/ipi/fdt_ipi_plicsw.c
> @@ -42,6 +42,6 @@ static const struct fdt_match ipi_plicsw_match[] = {
>  struct fdt_ipi fdt_ipi_plicsw = {
>         .match_table = ipi_plicsw_match,
>         .cold_init   = fdt_plicsw_cold_ipi_init,
> -       .warm_init   = plicsw_warm_ipi_init,
> +       .warm_init   = NULL,
>         .exit        = NULL,
>  };
> diff --git a/platform/fpga/ariane/platform.c b/platform/fpga/ariane/platform.c
> index ec0584ab..6d901271 100644
> --- a/platform/fpga/ariane/platform.c
> +++ b/platform/fpga/ariane/platform.c
> @@ -143,7 +143,7 @@ static int ariane_ipi_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return aclint_mswi_warm_init();
> +       return 0;
>  }
>
>  /*
> diff --git a/platform/fpga/openpiton/platform.c b/platform/fpga/openpiton/platform.c
> index 81cc48f4..eb6087f9 100644
> --- a/platform/fpga/openpiton/platform.c
> +++ b/platform/fpga/openpiton/platform.c
> @@ -174,7 +174,7 @@ static int openpiton_ipi_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return aclint_mswi_warm_init();
> +       return 0;
>  }
>
>  /*
> diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
> index 2f3f7079..c67d3f83 100644
> --- a/platform/kendryte/k210/platform.c
> +++ b/platform/kendryte/k210/platform.c
> @@ -156,7 +156,7 @@ static int k210_ipi_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return aclint_mswi_warm_init();
> +       return 0;
>  }
>
>  static int k210_timer_init(bool cold_boot)
> diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
> index 5610e7c7..07a1a1a4 100644
> --- a/platform/nuclei/ux600/platform.c
> +++ b/platform/nuclei/ux600/platform.c
> @@ -212,7 +212,7 @@ static int ux600_ipi_init(bool cold_boot)
>                         return rc;
>         }
>
> -       return aclint_mswi_warm_init();
> +       return 0;
>  }
>
>  static int ux600_timer_init(bool cold_boot)
> diff --git a/platform/template/platform.c b/platform/template/platform.c
> index b4d30a57..39a2ac87 100644
> --- a/platform/template/platform.c
> +++ b/platform/template/platform.c
> @@ -112,7 +112,7 @@ static int platform_ipi_init(bool cold_boot)
>                         return ret;
>         }
>
> -       return aclint_mswi_warm_init();
> +       return 0;
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

