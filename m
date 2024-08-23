From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Aug 2024 17:25:29 +0530
Subject: [PATCH 3/4] platform: generic: andes: add a new Andes SBI call to
 set up a PMA entry
In-Reply-To: <20240723075728.587110-4-ben717@andestech.com>
References: <20240723075728.587110-1-ben717@andestech.com> <20240723075728.587110-4-ben717@andestech.com>
Message-ID: <CAAhSdy0YGURwkJeKDmzQ7=Mo_qPnCmY549MehS-Tcpy+Ko75ig@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 23, 2024 at 1:27?PM Ben Zong-You Xie <ben717@andestech.com> wrote:
>
> Implement a new Andes SBI call, which is to set up a NAPOT region
> with given memory attributes.
>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup


> ---
>  platform/generic/andes/andes_pma.c         | 110 +++++++++++++++++++++
>  platform/generic/andes/andes_sbi.c         |   9 +-
>  platform/generic/include/andes/andes_pma.h |  22 ++++-
>  3 files changed, 137 insertions(+), 4 deletions(-)
>
> diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
> index a884bf7..70039ca 100644
> --- a/platform/generic/andes/andes_pma.c
> +++ b/platform/generic/andes/andes_pma.c
> @@ -94,6 +94,74 @@ static inline bool not_napot(unsigned long addr, unsigned long size)
>         return ((size & (size - 1)) || (addr & (size - 1)));
>  }
>
> +static inline bool is_pma_entry_disable(char pmaxcfg)
> +{
> +       return (pmaxcfg & ANDES_PMACFG_ETYP_MASK) == ANDES_PMACFG_ETYP_OFF ?
> +              true : false;
> +}
> +
> +static char get_pmaxcfg(int entry_id)
> +{
> +       unsigned int pmacfg_addr;
> +       unsigned long pmacfg_val;
> +       char *pmaxcfg;
> +
> +#if __riscv_xlen == 64
> +       pmacfg_addr = CSR_PMACFG0 + ((entry_id / 8) ? 2 : 0);
> +       pmacfg_val = andes_pma_read_num(pmacfg_addr);
> +       pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
> +#elif __riscv_xlen == 32
> +       pmacfg_addr = CSR_PMACFG0 + (entry_id / 4);
> +       pmacfg_val = andes_pma_read_num(pmacfg_addr);
> +       pmaxcfg = (char *)&pmacfg_val + (entry_id % 4);
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +       return *pmaxcfg;
> +}
> +
> +static void decode_pmaaddrx(int entry_id, unsigned long *start,
> +                           unsigned long *size)
> +{
> +       unsigned long pmaaddr;
> +       int k;
> +
> +       /**
> +        * Given $pmaaddr, let k = # of trailing 1s of $pmaaddr
> +        * size = 2 ^ (k + 3)
> +        * start = 4 * ($pmaaddr - (size / 8) + 1)
> +        */
> +       pmaaddr = andes_pma_read_num(CSR_PMAADDR0 + entry_id);
> +       k = sbi_ffz(pmaaddr);
> +       *size = 1 << (k + 3);
> +       *start = (pmaaddr - (1 << k) + 1) << 2;
> +}
> +
> +static bool has_pma_region_overlap(unsigned long start, unsigned long size)
> +{
> +       unsigned long _start, _size, _end, end;
> +       char pmaxcfg;
> +
> +       end = start + size - 1;
> +       for (int i = 0; i < ANDES_MAX_PMA_REGIONS; i++) {
> +               pmaxcfg = get_pmaxcfg(i);
> +               if (is_pma_entry_disable(pmaxcfg))
> +                       continue;
> +
> +               decode_pmaaddrx(i, &_start, &_size);
> +               _end = _start + _size - 1;
> +
> +               if (MAX(start, _start) <= MIN(end, _end)) {
> +                       sbi_printf(
> +                               "ERROR %s(): %#lx ~ %#lx overlaps with PMA%d: %#lx ~ %#lx\n",
> +                               __func__, start, end, i, _start, _end);
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  static unsigned long andes_pma_setup(const struct andes_pma_region *pma_region,
>                                      unsigned int entry_id)
>  {
> @@ -294,3 +362,45 @@ bool andes_sbi_probe_pma(void)
>  {
>         return (csr_read(CSR_MMSC_CFG) & MMSC_CFG_PPMA_MASK) ? true : false;
>  }
> +
> +int andes_sbi_set_pma(unsigned long pa, unsigned long size, u8 flags)
> +{
> +       unsigned int entry_id;
> +       unsigned long rc;
> +       char pmaxcfg;
> +       struct andes_pma_region region;
> +
> +       if (!andes_sbi_probe_pma()) {
> +               sbi_printf("ERROR %s(): Platform does not support PPMA.\n",
> +                          __func__);
> +               return SBI_ERR_NOT_SUPPORTED;
> +       }
> +
> +       if (has_pma_region_overlap(pa, size))
> +               return SBI_ERR_INVALID_PARAM;
> +
> +       for (entry_id = 0; entry_id < ANDES_MAX_PMA_REGIONS; entry_id++) {
> +               pmaxcfg = get_pmaxcfg(entry_id);
> +               if (is_pma_entry_disable(pmaxcfg)) {
> +                       region.pa = pa;
> +                       region.size = size;
> +                       region.flags = flags;
> +                       break;
> +               }
> +       }
> +
> +       if (entry_id == ANDES_MAX_PMA_REGIONS) {
> +               sbi_printf("ERROR %s(): All PMA entries have run out\n",
> +                          __func__);
> +               return SBI_ERR_FAILED;
> +       }
> +
> +       rc = andes_pma_setup(&region, entry_id);
> +       if (rc == SBI_EINVAL) {
> +               sbi_printf("ERROR %s(): Failed to set PMAADDR%d\n",
> +                          __func__, entry_id);
> +               return SBI_ERR_FAILED;
> +       }
> +
> +       return SBI_SUCCESS;
> +}
> diff --git a/platform/generic/andes/andes_sbi.c b/platform/generic/andes/andes_sbi.c
> index a7ca4a5..0e4a43d 100644
> --- a/platform/generic/andes/andes_sbi.c
> +++ b/platform/generic/andes/andes_sbi.c
> @@ -13,6 +13,7 @@ enum sbi_ext_andes_fid {
>         SBI_EXT_ANDES_FID0 = 0, /* Reserved for future use */
>         SBI_EXT_ANDES_IOCP_SW_WORKAROUND,
>         SBI_EXT_ANDES_PMA_PROBE,
> +       SBI_EXT_ANDES_PMA_SET,
>  };
>
>  static bool andes_cache_controllable(void)
> @@ -39,6 +40,7 @@ int andes_sbi_vendor_ext_provider(long funcid,
>                                   struct sbi_ecall_return *out,
>                                   const struct fdt_match *match)
>  {
> +       int ret = 0;
>         switch (funcid) {
>         case SBI_EXT_ANDES_IOCP_SW_WORKAROUND:
>                 out->value = andes_apply_iocp_sw_workaround();
> @@ -46,10 +48,13 @@ int andes_sbi_vendor_ext_provider(long funcid,
>         case SBI_EXT_ANDES_PMA_PROBE:
>                 out->value = andes_sbi_probe_pma();
>                 break;
> +       case SBI_EXT_ANDES_PMA_SET:
> +               ret = andes_sbi_set_pma(regs->a0, regs->a1, regs->a2);
> +               break;
>
>         default:
> -               return SBI_EINVAL;
> +               ret = SBI_ENOTSUPP;
>         }
>
> -       return 0;
> +       return ret;
>  }
> diff --git a/platform/generic/include/andes/andes_pma.h b/platform/generic/include/andes/andes_pma.h
> index 147dca1..487d9bf 100644
> --- a/platform/generic/include/andes/andes_pma.h
> +++ b/platform/generic/include/andes/andes_pma.h
> @@ -12,11 +12,15 @@
>
>  #define ANDES_PMA_GRANULARITY                  (1 << 12)
>
> +#define ANDES_PMACFG_ETYP_OFFSET               0
> +#define ANDES_PMACFG_ETYP_MASK                 (3 << ANDES_PMACFG_ETYP_OFFSET)
> +#define ANDES_PMACFG_ETYP_OFF                  (0 << ANDES_PMACFG_ETYP_OFFSET)
>  /* Naturally aligned power of 2 region */
> -#define ANDES_PMACFG_ETYP_NAPOT                        3
> +#define ANDES_PMACFG_ETYP_NAPOT                        (3 << ANDES_PMACFG_ETYP_OFFSET)
>
> +#define ANDES_PMACFG_MTYP_OFFSET               2
>  /* Memory, Non-cacheable, Bufferable */
> -#define ANDES_PMACFG_MTYP_MEM_NON_CACHE_BUF    (3 << 2)
> +#define ANDES_PMACFG_MTYP_MEM_NON_CACHE_BUF    (3 << ANDES_PMACFG_MTYP_OFFSET)
>
>  /**
>   * struct andes_pma_region - Describes PMA regions
> @@ -59,4 +63,18 @@ int andes_pma_setup_regions(const struct andes_pma_region *pma_regions,
>   */
>  bool andes_sbi_probe_pma(void);
>
> +/**
> + * Set a NAPOT region with given memory attributes
> + * @param pa: Start address of the NAPOT region
> + * @param size: Size of the NAPOT region
> + * @param flags: Memory attributes set to the NAPOT region
> + *
> + * @return SBI_SUCCESS on success
> + * @return SBI_ERR_NOT_SUPPORTED if hardware does not support PPMA features
> + * @return SBI_ERR_INVALID_PARAM if the given region is overlapped with the
> + *        region that has been set already
> + * @return SBI_ERR_FAILED if available entries have run out or setup fails
> + */
> +int andes_sbi_set_pma(unsigned long pa, unsigned long size, u8 flags);
> +
>  #endif /* _ANDES_PMA_H_ */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

