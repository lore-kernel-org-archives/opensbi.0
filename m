From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 09:23:21 +0800
Subject: [RFC PATCH] platform: generic: renesas: Add support to configure
 the PMA
In-Reply-To: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAEUhbmW5WmNSPNNe4UWq6o7ZtOgT=9N5f2=F6L+ScLSzW_K8dQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 5:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Add support to configure the PMA regions and create a corresponding
> reserve memory node and propagate it to the higher boot stack.
>
> &L2 {
>        andestech,pma-regions = <0x0 0x58000000 0x0 0x08000000
>                                 (AX45MP_PMACFG_ETYP_NAPOT |
>                                  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
> };
>
> PMA regions are passed as part of L2 cache node to OpenSBI, these regions
> are parsed and configured in the OpenSBI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi All,
>
> This patch is based on the discussion [0] so sending this as an RFC
> patch so that we get the Linux side of things accepeted first and once its
> finalized I'll send a non RFC patch for this.
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221124172207.153718-8-prabhakar.mahadev-lad.rj at bp.renesas.com/
>
> Cheers,
> Prabhakar
> ---
>  platform/generic/renesas/rzfive/objects.mk   |   1 +
>  platform/generic/renesas/rzfive/rzfive-pma.c | 181 +++++++++++++++
>  platform/generic/renesas/rzfive/rzfive-pma.h |  12 +

I feel we should name this to something like ax45mp-pma instead of
rzfive-pma, as this is at the core configuration level not SoC's, no?

>  platform/generic/renesas/rzfive/rzfive.c     | 227 +++++++++++++++++++
>  4 files changed, 421 insertions(+)
>  create mode 100644 platform/generic/renesas/rzfive/rzfive-pma.c
>  create mode 100644 platform/generic/renesas/rzfive/rzfive-pma.h
>
> diff --git a/platform/generic/renesas/rzfive/objects.mk b/platform/generic/renesas/rzfive/objects.mk
> index 2e7e37f..d666417 100644
> --- a/platform/generic/renesas/rzfive/objects.mk
> +++ b/platform/generic/renesas/rzfive/objects.mk
> @@ -6,3 +6,4 @@
>
>  carray-platform_override_modules-$(CONFIG_PLATFORM_RENESAS_RZFIVE) += renesas_rzfive
>  platform-objs-$(CONFIG_PLATFORM_RENESAS_RZFIVE) += renesas/rzfive/rzfive.o
> +platform-objs-$(CONFIG_PLATFORM_RENESAS_RZFIVE) += renesas/rzfive/rzfive-pma.o
> diff --git a/platform/generic/renesas/rzfive/rzfive-pma.c b/platform/generic/renesas/rzfive/rzfive-pma.c
> new file mode 100644
> index 0000000..a3c0126
> --- /dev/null
> +++ b/platform/generic/renesas/rzfive/rzfive-pma.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + *
> + * Copyright (c) 2020 Andes Technology Corporation
> + *
> + * Authors:
> + *      Nick Hu <nickhu@andestech.com>
> + *      Nylon Chen <nylon7@andestech.com>
> + */
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/riscv_io.h>
> +#include <sbi/sbi_error.h>
> +
> +/* Configuration Registers */
> +#define CSR_MMSC_CFG           0xfc2
> +
> +#define PMA_MMSC_CFG           (1 << 30)
> +
> +#define PMAADDR_0              0xBD0
> +#define PMAADDR_1              0xBD1
> +#define PMAADDR_2              0xBD2
> +#define PMAADDR_3              0xBD3
> +#define PMAADDR_4              0xBD4
> +#define PMAADDR_5              0xBD5
> +#define PMAADDR_6              0xBD6
> +#define PMAADDR_7              0xBD7
> +#define PMAADDR_8              0xBD8
> +#define PMAADDR_9              0xBD9
> +#define PMAADDR_10             0xBDA
> +#define PMAADDR_11             0xBDB
> +#define PMAADDR_12             0xBDC
> +#define PMAADDR_13             0xBDD
> +#define PMAADDR_14             0xBDE
> +#define PMAADDR_15             0xBDF
> +
> +/* n = 0 - 3 */
> +#define PMACFG_n(n)            (0xbc0 + (n))
> +
> +static inline unsigned long rzfive_read_pmacfg(unsigned int i)
> +{
> +       unsigned long val = 0;
> +
> +       if (!i)
> +               val = csr_read(PMACFG_n(0));
> +       else if (i == 1)
> +               val = csr_read(PMACFG_n(2));
> +
> +       return val;
> +}
> +
> +static inline void rzfive_write_pmacfg(unsigned int i, unsigned long val)
> +{
> +       if (!i)
> +               csr_write(PMACFG_n(0), val);
> +       else if (i == 1)
> +               csr_write(PMACFG_n(2), val);
> +}
> +
> +static inline void rzfive_write_pmaaddr(unsigned int i, unsigned long val)
> +{
> +       if (i == 0)
> +               csr_write(PMAADDR_0, val);
> +       else if (i == 1)
> +               csr_write(PMAADDR_1, val);
> +       else if (i == 2)
> +               csr_write(PMAADDR_2, val);
> +       else if (i == 3)
> +               csr_write(PMAADDR_3, val);
> +       else if (i == 4)
> +               csr_write(PMAADDR_4, val);
> +       else if (i == 5)
> +               csr_write(PMAADDR_5, val);
> +       else if (i == 6)
> +               csr_write(PMAADDR_6, val);
> +       else if (i == 7)
> +               csr_write(PMAADDR_7, val);
> +       else if (i == 8)
> +               csr_write(PMAADDR_8, val);
> +       else if (i == 9)
> +               csr_write(PMAADDR_9, val);
> +       else if (i == 10)
> +               csr_write(PMAADDR_10, val);
> +       else if (i == 11)
> +               csr_write(PMAADDR_11, val);
> +       else if (i == 12)
> +               csr_write(PMAADDR_12, val);
> +       else if (i == 13)
> +               csr_write(PMAADDR_13, val);
> +       else if (i == 14)
> +               csr_write(PMAADDR_14, val);
> +       else if (i == 15)
> +               csr_write(PMAADDR_15, val);
> +}
> +
> +static inline unsigned long rzfive_read_pmaaddr(unsigned int i)
> +{
> +       unsigned long ret = 0;
> +
> +       if (i == 0)
> +               ret = csr_read(PMAADDR_0);
> +       else if (i == 1)
> +               ret = csr_read(PMAADDR_1);
> +       else if (i == 2)
> +               ret = csr_read(PMAADDR_2);
> +       else if (i == 3)
> +               ret = csr_read(PMAADDR_3);
> +       else if (i == 4)
> +               ret = csr_read(PMAADDR_4);
> +       else if (i == 5)
> +               ret = csr_read(PMAADDR_5);
> +       else if (i == 6)
> +               ret =  csr_read(PMAADDR_6);
> +       else if (i == 7)
> +               ret = csr_read(PMAADDR_7);
> +       else if (i == 8)
> +               ret = csr_read(PMAADDR_8);
> +       else if (i == 9)
> +               ret = csr_read(PMAADDR_9);
> +       else if (i == 10)
> +               ret = csr_read(PMAADDR_10);
> +       else if (i == 11)
> +               ret = csr_read(PMAADDR_11);
> +       else if (i == 12)
> +               ret = csr_read(PMAADDR_12);
> +       else if (i == 13)
> +               ret = csr_read(PMAADDR_13);
> +       else if (i == 14)
> +               ret = csr_read(PMAADDR_14);
> +       else if (i == 15)
> +               ret = csr_read(PMAADDR_15);
> +
> +       return ret;
> +}
> +
> +unsigned long rzfive_setup_pma_region(unsigned long addr, unsigned long size,
> +                                     int entry_id, u32 flag)
> +{
> +       unsigned long size_tmp, shift = 0, pmacfg_val;
> +       unsigned long mmsc = csr_read(CSR_MMSC_CFG);
> +       unsigned long pa = addr;
> +       char *pmaxcfg;
> +       int power = 0;
> +
> +       if (flag > 0xff || entry_id > 15)
> +               return SBI_EINVAL;
> +
> +       if ((mmsc & PMA_MMSC_CFG) == 0)
> +               return 0;
> +
> +       size_tmp = size;
> +       if ((pa & (size_tmp - 1)) != 0) {
> +               pa = pa & ~(size_tmp - 1);
> +               size_tmp = size_tmp << 1;
> +       }
> +
> +       /* Calculate the NAPOT table for pmaaddr */
> +       size_tmp = size;
> +       while (size_tmp != 0x1) {
> +               size_tmp = size_tmp >> 1;
> +               power++;
> +               if (power > 3)
> +                       shift = (shift << 1) | 0x1;
> +       }
> +
> +       pmacfg_val = rzfive_read_pmacfg(entry_id / 8);
> +       pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
> +       *pmaxcfg = 0;
> +       *pmaxcfg = (u8)flag;
> +
> +       rzfive_write_pmacfg(entry_id / 8, pmacfg_val);
> +
> +       pa = pa >> 2;
> +       pa |= shift;
> +       pa = pa & ~(0x1 << (power - 3));
> +
> +       rzfive_write_pmaaddr(entry_id, pa);
> +
> +       return rzfive_read_pmaaddr(entry_id) == pa ? pa : SBI_EINVAL;
> +}
> diff --git a/platform/generic/renesas/rzfive/rzfive-pma.h b/platform/generic/renesas/rzfive/rzfive-pma.h
> new file mode 100644
> index 0000000..0ae3b79
> --- /dev/null
> +++ b/platform/generic/renesas/rzfive/rzfive-pma.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#ifndef _RZFIVE_PMA_H_
> +#define _RZFIVE_PMA_H_
> +
> +unsigned long rzfive_setup_pma_region(unsigned long pa, unsigned long size,
> +                                     int entry_id, u32 flag);
> +
> +#endif /* _RZFIVE_PMA_H_ */
> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
> index ca182e3..356df07 100644
> --- a/platform/generic/renesas/rzfive/rzfive.c
> +++ b/platform/generic/renesas/rzfive/rzfive.c
> @@ -4,9 +4,234 @@
>   *
>   */
>
> +#include <libfdt.h>
>  #include <platform_override.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_console.h>
>  #include <sbi_utils/fdt/fdt_helper.h>
>
> +#include "rzfive-pma.h"
> +
> +/* AX45MP registers */
> +#define AX45MP_CSR_MISA_CFG                    0x301
> +#define AX45MP_CSR_MICM_CFG                    0xfc0
> +#define AX45MP_CSR_MDCM_CFG                    0xfc1
> +#define AX45MP_CSR_MMSC_CFG                    0xfc2
> +#define AX45MP_CSR_MCACHE_CTL                  0x7ca
> +
> +/* AX45MP register bit offsets and masks */
> +#define AX45MP_MISA_20_OFFSET                  20
> +#define AX45MP_MISA_20_MASK                    (0x1 << AX45MP_MISA_20_OFFSET)
> +
> +#define AX45MP_MICM_CFG_ISZ_OFFSET             6
> +#define AX45MP_MICM_CFG_ISZ_MASK               (0x7  << AX45MP_MICM_CFG_ISZ_OFFSET)
> +
> +#define AX45MP_MDCM_CFG_DSZ_OFFSET             6
> +#define AX45MP_MDCM_CFG_DSZ_MASK               (0x7  << AX45MP_MDCM_CFG_DSZ_OFFSET)
> +
> +#define AX45MP_MMSC_CFG_CCTLCSR_OFFSET         16
> +#define AX45MP_MMSC_CFG_CCTLCSR_MASK           (0x1 << AX45MP_MMSC_CFG_CCTLCSR_OFFSET)
> +#define AX45MP_MMSC_IOCP_OFFSET                        47
> +#define AX45MP_MMSC_IOCP_MASK                  (0x1ULL << AX45MP_MMSC_IOCP_OFFSET)
> +
> +#define AX45MP_MCACHE_CTL_CCTL_SUEN_OFFSET     8
> +#define AX45MP_MCACHE_CTL_CCTL_SUEN_MASK       (0x1 << AX45MP_MCACHE_CTL_CCTL_SUEN_OFFSET)
> +
> +#define AX45MP_MAX_PMA_REGIONS                 16
> +
> +enum rzfive_sbi_ext_fid {
> +       RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND = 0,
> +};
> +
> +static bool rzfive_cpu_cache_controlable(void)
> +{
> +       return (((csr_read(AX45MP_CSR_MICM_CFG) & AX45MP_MICM_CFG_ISZ_MASK) ||
> +                (csr_read(AX45MP_CSR_MDCM_CFG) & AX45MP_MDCM_CFG_DSZ_MASK)) &&
> +               (csr_read(AX45MP_CSR_MISA_CFG) & AX45MP_MISA_20_MASK) &&
> +               (csr_read(AX45MP_CSR_MMSC_CFG) & AX45MP_MMSC_CFG_CCTLCSR_MASK) &&
> +               (csr_read(AX45MP_CSR_MCACHE_CTL) & AX45MP_MCACHE_CTL_CCTL_SUEN_MASK));
> +}
> +
> +static bool rzfive_cpu_iocp_disabled(void)
> +{
> +       return (csr_read(AX45MP_CSR_MMSC_CFG) & AX45MP_MMSC_IOCP_MASK) ? false : true;
> +}
> +
> +static bool rzfive_apply_iocp_sw_workaround(void)
> +{
> +       return rzfive_cpu_cache_controlable() & rzfive_cpu_iocp_disabled();
> +}
> +
> +static int fdt_resv_memory_update_node(void *fdt, unsigned long addr,
> +                                      unsigned long size, int index,
> +                                      int parent)
> +{
> +       int na = fdt_address_cells(fdt, 0);
> +       int ns = fdt_size_cells(fdt, 0);
> +       fdt32_t addr_high, addr_low;
> +       fdt32_t size_high, size_low;
> +       int subnode, err;
> +       fdt32_t reg[4];
> +       fdt32_t *val;
> +       char name[32];
> +
> +       addr_high = (u64)addr >> 32;
> +       addr_low = addr;
> +       size_high = (u64)size >> 32;
> +       size_low = size;
> +
> +       if (na > 1 && addr_high)
> +               sbi_snprintf(name, sizeof(name),
> +                            "pma_resv%d@%x,%x", index,
> +                            addr_high, addr_low);
> +       else
> +               sbi_snprintf(name, sizeof(name),
> +                            "pma_resv%d@%x", index,
> +                            addr_low);
> +
> +       subnode = fdt_add_subnode(fdt, parent, name);
> +       if (subnode < 0)
> +               return subnode;
> +
> +       err = fdt_setprop_string(fdt, subnode, "compatible", "shared-dma-pool");
> +       if (err < 0)
> +               return err;
> +
> +       err = fdt_setprop_empty(fdt, subnode, "no-map");
> +       if (err < 0)
> +               return err;
> +
> +       /*
> +        * Linux allows single linux,dma-default region so lets mark
> +        * the first pma region as linux,dma-default
> +        */
> +       if (!index) {
> +               err = fdt_setprop_empty(fdt, subnode, "linux,dma-default");
> +               if (err < 0)
> +                       return err;
> +       }
> +
> +       /* encode the <reg> property value */
> +       val = reg;
> +       if (na > 1)
> +               *val++ = cpu_to_fdt32(addr_high);
> +       *val++ = cpu_to_fdt32(addr_low);
> +       if (ns > 1)
> +               *val++ = cpu_to_fdt32(size_high);
> +       *val++ = cpu_to_fdt32(size_low);
> +
> +       err = fdt_setprop(fdt, subnode, "reg", reg,
> +                         (na + ns) * sizeof(fdt32_t));
> +       if (err < 0)
> +               return err;
> +
> +       return 0;
> +}
> +
> +static int fdt_reserved_memory_fixup(void *fdt, unsigned long addr,
> +                                    unsigned long size, int entry)
> +{
> +       int na = fdt_address_cells(fdt, 0);
> +       int ns = fdt_size_cells(fdt, 0);
> +       int err, parent;
> +
> +       /* try to locate the reserved memory node */
> +       parent = fdt_path_offset(fdt, "/reserved-memory");
> +       if (parent < 0) {
> +               /* if such node does not exist, create one */
> +               parent = fdt_add_subnode(fdt, 0, "reserved-memory");
> +               if (parent < 0)
> +                       return parent;
> +
> +               err = fdt_setprop_empty(fdt, parent, "ranges");
> +               if (err < 0)
> +                       return err;
> +
> +               err = fdt_setprop_u32(fdt, parent, "#size-cells", ns);
> +               if (err < 0)
> +                       return err;
> +
> +               err = fdt_setprop_u32(fdt, parent, "#address-cells", na);
> +               if (err < 0)
> +                       return err;
> +       }
> +
> +       return fdt_resv_memory_update_node(fdt, addr, size, entry, parent);
> +}
> +
> +static int rzfive_configure_pma_regions(void)
> +{
> +       void *fdt = fdt_get_address();
> +       unsigned long start[16], size[16];
> +       unsigned long pma_addr;
> +       unsigned int i, j;
> +       int cells_count;
> +       u32 flags[16];
> +       int l2c_off;
> +       u32 *cells;
> +       int ret;
> +
> +       l2c_off = fdt_node_offset_by_compatible(fdt, 0, "v5l2cache");
> +       if (l2c_off < 0)
> +               return 0;
> +
> +       cells = (u32 *)fdt_getprop(fdt, l2c_off,
> +                                  "andestech,pma-regions", &cells_count);
> +       if (!cells)
> +               return 0;
> +
> +       cells_count = cells_count / sizeof(u32);
> +       if (!cells_count)
> +               return 0;
> +
> +       if (cells_count % 5 || (cells_count / 5) > AX45MP_MAX_PMA_REGIONS)
> +               return SBI_EINVAL;
> +
> +       for (i = 0, j = 0; i < cells_count; i += 5, j++) {
> +               start[j] = ((u64)fdt32_to_cpu(cells[i]) << 32) | fdt32_to_cpu(cells[i + 1]);
> +               size[j] = ((u64)fdt32_to_cpu(cells[i + 2]) << 32) | fdt32_to_cpu(cells[i + 3]);
> +               flags[j] = fdt32_to_cpu(cells[i + 4]);
> +               pma_addr = rzfive_setup_pma_region(start[j], size[j], j, flags[j]);
> +               if (pma_addr == SBI_EINVAL)
> +                       return SBI_EINVAL;
> +       }
> +
> +       ret = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + (64 * j));
> +       if (ret < 0)
> +               return ret;
> +
> +       for (i = 0; i < j; i++) {
> +               ret = fdt_reserved_memory_fixup(fdt, start[i], size[i], i);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int rzf_final_init(bool cold_boot, const struct fdt_match *match)
> +{
> +       return rzfive_configure_pma_regions();
> +}
> +
> +static int rzfive_vendor_ext_provider(long extid, long funcid,
> +                                     const struct sbi_trap_regs *regs,
> +                                     unsigned long *out_value,
> +                                     struct sbi_trap_info *out_trap,
> +                                     const struct fdt_match *match)
> +{
> +       switch (funcid) {
> +       case RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND:
> +               *out_value = rzfive_apply_iocp_sw_workaround();
> +               break;
> +
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct fdt_match renesas_rzfive_match[] = {
>         { .compatible = "renesas,r9a07g043f01" },
>         { /* sentinel */ }
> @@ -14,4 +239,6 @@ static const struct fdt_match renesas_rzfive_match[] = {
>
>  const struct platform_override renesas_rzfive = {
>         .match_table = renesas_rzfive_match,
> +       .final_init = rzf_final_init,
> +       .vendor_ext_provider = rzfive_vendor_ext_provider,
>  };

Regards,
Bin

