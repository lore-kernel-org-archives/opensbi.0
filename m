From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Dec 2023 22:39:53 +0530
Subject: [RFC PATCH] lib: sbi_hart: Store PMP granularity as log base 2
In-Reply-To: <20231122194406.229255-1-samuel.holland@sifive.com>
References: <20231122194406.229255-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy0x15dE6k21Rfcia2w3NCia9Pj-m=bDbRYP+xZ6aekhkg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 23, 2023 at 1:14?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This minimizes the need to call log2roundup() to recover the log value.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> This actually ends up with a net increase in code size, so it's probably
> not worth merging. I'm sending the patch for completeness.

I agree there is not much difference with this patch but I think tracking
PMP granularity as power-of-2 (log2) is better because OpenSBI domain
region sizes are also power-of-2.

I rebased this patch on the latest OpenSBI and merged it as well with my
Reviewed-by.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
>  include/sbi/sbi_hart.h |  4 ++--
>  lib/sbi/sbi_hart.c     | 10 +++++-----
>  lib/sbi/sbi_init.c     |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 6ee49ff..cbcac78 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -71,7 +71,7 @@ struct sbi_hart_features {
>         unsigned long extensions[BITS_TO_LONGS(SBI_HART_EXT_MAX)];
>         unsigned int pmp_count;
>         unsigned int pmp_addr_bits;
> -       unsigned long pmp_gran;
> +       unsigned int pmp_gran_log2;
>         unsigned int mhpm_mask;
>         unsigned int mhpm_bits;
>  };
> @@ -91,7 +91,7 @@ unsigned int sbi_hart_mhpm_mask(struct sbi_scratch *scratch);
>  void sbi_hart_delegation_dump(struct sbi_scratch *scratch,
>                               const char *prefix, const char *suffix);
>  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
> -unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch);
> +unsigned int sbi_hart_pmp_gran_log2(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
>  unsigned int sbi_hart_mhpm_bits(struct sbi_scratch *scratch);
>  int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index bf8792a..5141160 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -267,12 +267,12 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
>         return hfeatures->pmp_count;
>  }
>
> -unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch)
> +unsigned int sbi_hart_pmp_gran_log2(struct sbi_scratch *scratch)
>  {
>         struct sbi_hart_features *hfeatures =
>                         sbi_scratch_offset_ptr(scratch, hart_features_offset);
>
> -       return hfeatures->pmp_gran;
> +       return hfeatures->pmp_gran_log2;
>  }
>
>  unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch)
> @@ -508,7 +508,7 @@ int sbi_hart_map_saddr(unsigned long addr, unsigned long size)
>         if (is_pmp_entry_mapped(SBI_SMEPMP_RESV_ENTRY))
>                 return SBI_ENOSPC;
>
> -       for (order = log2roundup(MAX(sbi_hart_pmp_granularity(scratch), size));
> +       for (order = MAX(sbi_hart_pmp_gran_log2(scratch), log2roundup(size));
>              order <= __riscv_xlen; order++) {
>                 if (order < __riscv_xlen) {
>                         base = addr & ~((1UL << order) - 1UL);
> @@ -547,7 +547,7 @@ int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>         if (!pmp_count)
>                 return 0;
>
> -       pmp_gran_log2 = log2roundup(sbi_hart_pmp_granularity(scratch));
> +       pmp_gran_log2 = sbi_hart_pmp_gran_log2(scratch);
>         pmp_bits = sbi_hart_pmp_addrbits(scratch) - 1;
>         pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
>
> @@ -871,7 +871,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>          */
>         val = hart_pmp_get_allowed_addr();
>         if (val) {
> -               hfeatures->pmp_gran =  1 << (sbi_ffs(val) + 2);
> +               hfeatures->pmp_gran_log2 = sbi_ffs(val) + 2;
>                 hfeatures->pmp_addr_bits = sbi_fls(val) + 1;
>                 /* Detect number of PMP regions. At least PMPADDR0 should be implemented*/
>                 __check_csr_64(CSR_PMPADDR0, 0, val, pmp_count, __pmp_skip);
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index e723553..bfb8300 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -177,7 +177,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
>         sbi_printf("Boot HART PMP Count       : %d\n",
>                    sbi_hart_pmp_count(scratch));
>         sbi_printf("Boot HART PMP Granularity : %lu\n",
> -                  sbi_hart_pmp_granularity(scratch));
> +                  1UL << sbi_hart_pmp_gran_log2(scratch));
>         sbi_printf("Boot HART PMP Address Bits: %d\n",
>                    sbi_hart_pmp_addrbits(scratch));
>         sbi_printf("Boot HART MHPM Info       : %lu (0x%08x)\n",
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

