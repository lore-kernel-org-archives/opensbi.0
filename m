From: Anup Patel <anup@brainfault.org>
Date: Sun, 21 May 2023 21:01:59 +0530
Subject: [PATCH v6 6/7] lib: sbi: Remove 0/1 probe implementations
In-Reply-To: <20230515111240.95059-7-ajones@ventanamicro.com>
References: <20230515111240.95059-1-ajones@ventanamicro.com> <20230515111240.95059-7-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3HmHpypV=YCLWJratjaLwrcM_CwvEhrPTx7abOzbDW3g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 15, 2023 at 4:42?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When a probe implementation just returns zero for not available and
> one for available then we don't need it, as the extension won't be
> registered at all if it would return zero and the Base extension
> probe function will already set out_val to 1 if not probe function
> is implemented. Currently all probe functions only return zero or
> one, so remove them all.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_ecall_cppc.c |  7 -------
>  lib/sbi/sbi_ecall_dbcn.c |  7 -------
>  lib/sbi/sbi_ecall_srst.c | 18 +++++-------------
>  lib/sbi/sbi_ecall_susp.c | 17 +++++------------
>  4 files changed, 10 insertions(+), 39 deletions(-)
>
> diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
> index a6398ac78226..b54d54ec684c 100644
> --- a/lib/sbi/sbi_ecall_cppc.c
> +++ b/lib/sbi/sbi_ecall_cppc.c
> @@ -49,12 +49,6 @@ static int sbi_ecall_cppc_handler(unsigned long extid, unsigned long funcid,
>         return ret;
>  }
>
> -static int sbi_ecall_cppc_probe(unsigned long extid, unsigned long *out_val)
> -{
> -       *out_val = sbi_cppc_get_device() ? 1 : 0;
> -       return 0;
> -}
> -
>  struct sbi_ecall_extension ecall_cppc;
>
>  static int sbi_ecall_cppc_register_extensions(void)
> @@ -69,6 +63,5 @@ struct sbi_ecall_extension ecall_cppc = {
>         .extid_start            = SBI_EXT_CPPC,
>         .extid_end              = SBI_EXT_CPPC,
>         .register_extensions    = sbi_ecall_cppc_register_extensions,
> -       .probe                  = sbi_ecall_cppc_probe,
>         .handle                 = sbi_ecall_cppc_handler,
>  };
> diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
> index cbb2e802e615..e0b892c2ed6b 100644
> --- a/lib/sbi/sbi_ecall_dbcn.c
> +++ b/lib/sbi/sbi_ecall_dbcn.c
> @@ -58,12 +58,6 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
>         return SBI_ENOTSUPP;
>  }
>
> -static int sbi_ecall_dbcn_probe(unsigned long extid, unsigned long *out_val)
> -{
> -       *out_val = sbi_console_get_device() ? 1 : 0;
> -       return 0;
> -}
> -
>  struct sbi_ecall_extension ecall_dbcn;
>
>  static int sbi_ecall_dbcn_register_extensions(void)
> @@ -78,6 +72,5 @@ struct sbi_ecall_extension ecall_dbcn = {
>         .extid_start            = SBI_EXT_DBCN,
>         .extid_end              = SBI_EXT_DBCN,
>         .register_extensions    = sbi_ecall_dbcn_register_extensions,
> -       .probe                  = sbi_ecall_dbcn_probe,
>         .handle                 = sbi_ecall_dbcn_handler,
>  };
> diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
> index fd2dc0d251f3..dcd560d22f9d 100644
> --- a/lib/sbi/sbi_ecall_srst.c
> +++ b/lib/sbi/sbi_ecall_srst.c
> @@ -48,7 +48,7 @@ static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
>         return SBI_ENOTSUPP;
>  }
>
> -static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
> +static bool srst_available(void)
>  {
>         u32 type;
>
> @@ -56,27 +56,20 @@ static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
>          * At least one standard reset types should be supported by
>          * the platform for SBI SRST extension to be usable.
>          */
> -
>         for (type = 0; type <= SBI_SRST_RESET_TYPE_LAST; type++) {
>                 if (sbi_system_reset_supported(type,
> -                                       SBI_SRST_RESET_REASON_NONE)) {
> -                       *out_val = 1;
> -                       return 0;
> -               }
> +                                       SBI_SRST_RESET_REASON_NONE))
> +                       return true;
>         }
>
> -       *out_val = 0;
> -       return 0;
> +       return false;
>  }
>
>  struct sbi_ecall_extension ecall_srst;
>
>  static int sbi_ecall_srst_register_extensions(void)
>  {
> -       unsigned long out_val;
> -
> -       sbi_ecall_srst_probe(SBI_EXT_SRST, &out_val);
> -       if (!out_val)
> +       if (!srst_available())
>                 return 0;
>
>         return sbi_ecall_register_extension(&ecall_srst);
> @@ -86,6 +79,5 @@ struct sbi_ecall_extension ecall_srst = {
>         .extid_start            = SBI_EXT_SRST,
>         .extid_end              = SBI_EXT_SRST,
>         .register_extensions    = sbi_ecall_srst_register_extensions,
> -       .probe                  = sbi_ecall_srst_probe,
>         .handle                 = sbi_ecall_srst_handler,
>  };
> diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
> index 716a6d585af7..2bfd99ae8720 100644
> --- a/lib/sbi/sbi_ecall_susp.c
> +++ b/lib/sbi/sbi_ecall_susp.c
> @@ -23,7 +23,7 @@ static int sbi_ecall_susp_handler(unsigned long extid, unsigned long funcid,
>         return ret;
>  }
>
> -static int sbi_ecall_susp_probe(unsigned long extid, unsigned long *out_val)
> +static bool susp_available(void)
>  {
>         u32 type;
>
> @@ -32,24 +32,18 @@ static int sbi_ecall_susp_probe(unsigned long extid, unsigned long *out_val)
>          * platform for the SBI SUSP extension to be usable.
>          */
>         for (type = 0; type <= SBI_SUSP_SLEEP_TYPE_LAST; type++) {
> -               if (sbi_system_suspend_supported(type)) {
> -                       *out_val = 1;
> -                       return 0;
> -               }
> +               if (sbi_system_suspend_supported(type))
> +                       return true;
>         }
>
> -       *out_val = 0;
> -       return 0;
> +       return false;
>  }
>
>  struct sbi_ecall_extension ecall_susp;
>
>  static int sbi_ecall_susp_register_extensions(void)
>  {
> -       unsigned long out_val;
> -
> -       sbi_ecall_susp_probe(SBI_EXT_SUSP, &out_val);
> -       if (!out_val)
> +       if (!susp_available())
>                 return 0;
>
>         return sbi_ecall_register_extension(&ecall_susp);
> @@ -59,6 +53,5 @@ struct sbi_ecall_extension ecall_susp = {
>         .extid_start            = SBI_EXT_SUSP,
>         .extid_end              = SBI_EXT_SUSP,
>         .register_extensions    = sbi_ecall_susp_register_extensions,
> -       .probe                  = sbi_ecall_susp_probe,
>         .handle                 = sbi_ecall_susp_handler,
>  };
> --
> 2.40.0
>

