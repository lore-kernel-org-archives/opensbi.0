From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Nov 2021 10:45:31 +0530
Subject: [PATCH] lib: sbi: Refine addr format in sbi_printf
In-Reply-To: <20211025080615.4881-1-Dd_nirvana@sjtu.edu.cn>
References: <20211025080615.4881-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <CAAhSdy0_iScA3d3WzwZeWHC3qYNQd5TwLn3MzeHYStHPwtSv6g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 25, 2021 at 1:38 PM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>
> Although we have PRILX to help us print unsigned long without
> considering the 32bit/64bit differences, there are still some
> places using 08lx and 016lx manually --- leading to redundant code.
>
> This commit fixes the issue by using PRILX all the time.
>
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 18 +++---------------
>  lib/sbi/sbi_hart.c   | 11 ++---------
>  2 files changed, 5 insertions(+), 24 deletions(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 3096af0..33d7ad5 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -328,11 +328,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
>                 rend = (reg->order < __riscv_xlen) ?
>                         rstart + ((1UL << reg->order) - 1) : -1UL;
>
> -#if __riscv_xlen == 32
> -               sbi_printf("Domain%d Region%02d    %s: 0x%08lx-0x%08lx ",
> -#else
> -               sbi_printf("Domain%d Region%02d    %s: 0x%016lx-0x%016lx ",
> -#endif
> +               sbi_printf("Domain%d Region%02d    %s: 0x%" PRILX "-0x%" PRILX " ",
>                            dom->index, i, suffix, rstart, rend);
>
>                 k = 0;
> @@ -351,18 +347,10 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
>                 i++;
>         }
>
> -#if __riscv_xlen == 32
> -       sbi_printf("Domain%d Next Address%s: 0x%08lx\n",
> -#else
> -       sbi_printf("Domain%d Next Address%s: 0x%016lx\n",
> -#endif
> +       sbi_printf("Domain%d Next Address%s: 0x%" PRILX "\n",
>                    dom->index, suffix, dom->next_addr);
>
> -#if __riscv_xlen == 32
> -       sbi_printf("Domain%d Next Arg1   %s: 0x%08lx\n",
> -#else
> -       sbi_printf("Domain%d Next Arg1   %s: 0x%016lx\n",
> -#endif
> +       sbi_printf("Domain%d Next Arg1   %s: 0x%" PRILX "\n",
>                    dom->index, suffix, dom->next_arg1);
>
>         sbi_printf("Domain%d Next Mode   %s: ", dom->index, suffix);
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 6254452..8eb0c38 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -150,17 +150,10 @@ void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>                 /* No delegation possible as mideleg does not exist*/
>                 return;
>
> -#if __riscv_xlen == 32
> -       sbi_printf("%sMIDELEG%s: 0x%08lx\n",
> +       sbi_printf("%sMIDELEG%s: 0x%" PRILX "\n",
>                    prefix, suffix, csr_read(CSR_MIDELEG));
> -       sbi_printf("%sMEDELEG%s: 0x%08lx\n",
> +       sbi_printf("%sMEDELEG%s: 0x%" PRILX "\n",
>                    prefix, suffix, csr_read(CSR_MEDELEG));
> -#else
> -       sbi_printf("%sMIDELEG%s: 0x%016lx\n",
> -                  prefix, suffix, csr_read(CSR_MIDELEG));
> -       sbi_printf("%sMEDELEG%s: 0x%016lx\n",
> -                  prefix, suffix, csr_read(CSR_MEDELEG));
> -#endif
>  }
>
>  unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch)
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

