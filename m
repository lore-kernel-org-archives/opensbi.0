From: Anup Patel <anup@brainfault.org>
Date: Sun, 21 May 2023 20:56:52 +0530
Subject: [PATCH v6 3/7] lib: sbi: pmu: Remove unnecessary probe function
In-Reply-To: <20230515111240.95059-4-ajones@ventanamicro.com>
References: <20230515111240.95059-1-ajones@ventanamicro.com> <20230515111240.95059-4-ajones@ventanamicro.com>
Message-ID: <CAAhSdy38TBwBSpNJK=LwWPK54tvai8V7VO0SyYJcwqLHR2DsgQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 15, 2023 at 4:42?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> The absence of a probe implementation means that the extension is
> always available. Remove the implementation for the PMU extension,
> which does no checking, and indeed even has a comment saying it's
> always available.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_ecall_pmu.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
> index b0589d0ecfa1..1d5d512eeed7 100644
> --- a/lib/sbi/sbi_ecall_pmu.c
> +++ b/lib/sbi/sbi_ecall_pmu.c
> @@ -81,13 +81,6 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
>         return ret;
>  }
>
> -static int sbi_ecall_pmu_probe(unsigned long extid, unsigned long *out_val)
> -{
> -       /* PMU extension is always enabled */
> -       *out_val = 1;
> -       return 0;
> -}
> -
>  struct sbi_ecall_extension ecall_pmu;
>
>  static int sbi_ecall_pmu_register_extensions(void)
> @@ -99,6 +92,5 @@ struct sbi_ecall_extension ecall_pmu = {
>         .extid_start            = SBI_EXT_PMU,
>         .extid_end              = SBI_EXT_PMU,
>         .register_extensions    = sbi_ecall_pmu_register_extensions,
> -       .probe                  = sbi_ecall_pmu_probe,
>         .handle                 = sbi_ecall_pmu_handler,
>  };
> --
> 2.40.0
>

