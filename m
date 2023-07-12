From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Jul 2023 11:48:06 +0530
Subject: [PATCH v3 09/10] lib: sbi: Add functions to map/unmap shared memory
In-Reply-To: <20230712043436.100548-10-hchauhan@ventanamicro.com>
References: <20230706104928.3391947-1-hchauhan@ventanamicro.com>
 <20230712043436.100548-1-hchauhan@ventanamicro.com> <20230712043436.100548-10-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy0jBnYKhOJBziTwjvBCPGcJ7jvKYkXHK_PPop3tthH=8A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 10:05?AM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> When Smepmp is enabled, M-mode will need to map/unmap the
> shared memory before it can read/write to it. This patch
> adds functions to create dynamic short-lived mappings.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Please carry the Rb tag from the previous version.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  include/sbi/sbi_hart.h |  2 ++
>  lib/sbi/sbi_hart.c     | 42 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 1b78343..c150b7e 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -90,6 +90,8 @@ unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
> +int sbi_hart_map_saddr(unsigned long base, unsigned long size);
> +int sbi_hart_unmap_saddr(void);
>  int sbi_hart_priv_version(struct sbi_scratch *scratch);
>  void sbi_hart_get_priv_version_str(struct sbi_scratch *scratch,
>                                    char *version_str, int nvstr);
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index c816f80..fde06d9 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -347,6 +347,48 @@ unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
>         return pmp_flags;
>  }
>
> +int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
> +{
> +       /* shared R/W access for M and S/U mode */
> +       unsigned int pmp_flags = (PMP_W | PMP_X);
> +       unsigned long order, base = 0;
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +       /* If Smepmp is not supported no special mapping is required */
> +       if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
> +               return SBI_OK;
> +
> +       if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
> +               return SBI_ENOSPC;
> +
> +       for (order = log2roundup(size) ; order <= __riscv_xlen; order++) {
> +               if (order < __riscv_xlen) {
> +                       base = addr & ~((1UL << order) - 1UL);
> +                       if ((base <= addr) &&
> +                           (addr < (base + (1UL << order))) &&
> +                           (base <= (addr + size - 1UL)) &&
> +                           ((addr + size - 1UL) < (base + (1UL << order))))
> +                               break;
> +               } else {
> +                       return SBI_EFAIL;
> +               }
> +       }
> +
> +       pmp_set(SBI_SMEPMP_RESV_ENTRY, pmp_flags, base, order);
> +
> +       return SBI_OK;
> +}
> +
> +int sbi_hart_unmap_saddr(void)
> +{
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +
> +       if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
> +               return SBI_OK;
> +
> +       return pmp_disable(SBI_SMEPMP_RESV_ENTRY);
> +}
> +
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>  {
>         struct sbi_domain_memregion *reg;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

