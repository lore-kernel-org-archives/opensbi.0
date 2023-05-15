From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 May 2023 16:03:17 +0530
Subject: [PATCH v5 4/7] lib: sbi: Only register available extensions
In-Reply-To: <20230515093446.73123-5-ajones@ventanamicro.com>
References: <20230515093446.73123-1-ajones@ventanamicro.com> <20230515093446.73123-5-ajones@ventanamicro.com>
Message-ID: <CAAhSdy08Qt0FOUd7KfH0rhz4-RbEnx39XMgAKvXjdszRwmRiEw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 15, 2023 at 3:04?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When an extension implements a probe function it means there's a
> chance that the extension is not available. Use this function in the
> register_extensions callback to determine if the extension should be
> registered at all. Where the probe implementation is simple, just
> open code the check.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  lib/sbi/sbi_ecall_cppc.c   | 3 +++
>  lib/sbi/sbi_ecall_dbcn.c   | 3 +++
>  lib/sbi/sbi_ecall_srst.c   | 6 ++++++
>  lib/sbi/sbi_ecall_susp.c   | 6 ++++++
>  lib/sbi/sbi_ecall_vendor.c | 3 +++
>  5 files changed, 21 insertions(+)
>
> diff --git a/lib/sbi/sbi_ecall_cppc.c b/lib/sbi/sbi_ecall_cppc.c
> index 42ec744c22ba..a6398ac78226 100644
> --- a/lib/sbi/sbi_ecall_cppc.c
> +++ b/lib/sbi/sbi_ecall_cppc.c
> @@ -59,6 +59,9 @@ struct sbi_ecall_extension ecall_cppc;
>
>  static int sbi_ecall_cppc_register_extensions(void)
>  {
> +       if (!sbi_cppc_get_device())
> +               return 0;
> +
>         return sbi_ecall_register_extension(&ecall_cppc);
>  }
>
> diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
> index 58b19e4468ef..cbb2e802e615 100644
> --- a/lib/sbi/sbi_ecall_dbcn.c
> +++ b/lib/sbi/sbi_ecall_dbcn.c
> @@ -68,6 +68,9 @@ struct sbi_ecall_extension ecall_dbcn;
>
>  static int sbi_ecall_dbcn_register_extensions(void)
>  {
> +       if (!sbi_console_get_device())
> +               return 0;
> +
>         return sbi_ecall_register_extension(&ecall_dbcn);
>  }
>
> diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
> index ad31537604a3..ea0dc73f010d 100644
> --- a/lib/sbi/sbi_ecall_srst.c
> +++ b/lib/sbi/sbi_ecall_srst.c
> @@ -71,6 +71,12 @@ struct sbi_ecall_extension ecall_srst;
>
>  static int sbi_ecall_srst_register_extensions(void)
>  {
> +       unsigned long out_val;
> +
> +       sbi_ecall_srst_probe(SBI_EXT_SRST, &out_val);
> +       if (!out_val)
> +               return 0;
> +
>         return sbi_ecall_register_extension(&ecall_srst);
>  }
>
> diff --git a/lib/sbi/sbi_ecall_susp.c b/lib/sbi/sbi_ecall_susp.c
> index bfbdbe648625..c4124046b929 100644
> --- a/lib/sbi/sbi_ecall_susp.c
> +++ b/lib/sbi/sbi_ecall_susp.c
> @@ -44,6 +44,12 @@ struct sbi_ecall_extension ecall_susp;
>
>  static int sbi_ecall_susp_register_extensions(void)
>  {
> +       unsigned long out_val;
> +
> +       sbi_ecall_susp_probe(SBI_EXT_SUSP, &out_val);
> +       if (!out_val)
> +               return 0;
> +
>         return sbi_ecall_register_extension(&ecall_susp);
>  }
>
> diff --git a/lib/sbi/sbi_ecall_vendor.c b/lib/sbi/sbi_ecall_vendor.c
> index 39c58c8b6fd5..c4a4c1c45b14 100644
> --- a/lib/sbi/sbi_ecall_vendor.c
> +++ b/lib/sbi/sbi_ecall_vendor.c
> @@ -51,6 +51,9 @@ static int sbi_ecall_vendor_register_extensions(void)
>  {
>         unsigned long extid = sbi_ecall_vendor_id();
>
> +       if (!sbi_platform_vendor_ext_check(sbi_platform_thishart_ptr()))
> +               return 0;
> +
>         ecall_vendor.extid_start = extid;
>         ecall_vendor.extid_end = extid;
>
> --
> 2.40.0
>

