From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Tue, 20 Dec 2022 22:12:29 +0000
Subject: [RFC PATCH] platform: generic: renesas: Add support to configure
 the PMA
In-Reply-To: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <Y6IzTcaMxw9JjBW3@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 09:44:21AM +0000, Lad Prabhakar wrote:
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
> +#define CSR_MMSC_CFG		0xfc2

MMSC_CFG is redefined in rzfive.c.

> +
> +#define PMA_MMSC_CFG		(1 << 30)
> +
> +#define PMAADDR_0		0xBD0
> +#define PMAADDR_1		0xBD1
> +#define PMAADDR_2		0xBD2
> +#define PMAADDR_3		0xBD3
> +#define PMAADDR_4		0xBD4
> +#define PMAADDR_5		0xBD5
> +#define PMAADDR_6		0xBD6
> +#define PMAADDR_7		0xBD7
> +#define PMAADDR_8		0xBD8
> +#define PMAADDR_9		0xBD9
> +#define PMAADDR_10		0xBDA
> +#define PMAADDR_11		0xBDB
> +#define PMAADDR_12		0xBDC
> +#define PMAADDR_13		0xBDD
> +#define PMAADDR_14		0xBDE
> +#define PMAADDR_15		0xBDF
> +
> +/* n = 0 - 3 */
> +#define PMACFG_n(n)		(0xbc0 + (n))
> +
> +static inline unsigned long rzfive_read_pmacfg(unsigned int i)
> +{
> +	unsigned long val = 0;
> +
> +	if (!i)
> +		val = csr_read(PMACFG_n(0));
> +	else if (i == 1)
> +		val = csr_read(PMACFG_n(2));
> +
> +	return val;
> +}
> +
> +static inline void rzfive_write_pmacfg(unsigned int i, unsigned long val)
> +{
> +	if (!i)
> +		csr_write(PMACFG_n(0), val);
> +	else if (i == 1)
> +		csr_write(PMACFG_n(2), val);
> +}
> +
> +static inline void rzfive_write_pmaaddr(unsigned int i, unsigned long val)
> +{

> +	if (i == 0)
> +		csr_write(PMAADDR_0, val);
> +	else if (i == 1)
> +		csr_write(PMAADDR_1, val);
> +	else if (i == 2)
> +		csr_write(PMAADDR_2, val);
> +	else if (i == 3)
> +		csr_write(PMAADDR_3, val);
> +	else if (i == 4)
> +		csr_write(PMAADDR_4, val);
> +	else if (i == 5)
> +		csr_write(PMAADDR_5, val);
> +	else if (i == 6)
> +		csr_write(PMAADDR_6, val);
> +	else if (i == 7)
> +		csr_write(PMAADDR_7, val);
> +	else if (i == 8)
> +		csr_write(PMAADDR_8, val);
> +	else if (i == 9)
> +		csr_write(PMAADDR_9, val);
> +	else if (i == 10)
> +		csr_write(PMAADDR_10, val);
> +	else if (i == 11)
> +		csr_write(PMAADDR_11, val);
> +	else if (i == 12)
> +		csr_write(PMAADDR_12, val);
> +	else if (i == 13)
> +		csr_write(PMAADDR_13, val);
> +	else if (i == 14)
> +		csr_write(PMAADDR_14, val);
> +	else if (i == 15)
> +		csr_write(PMAADDR_15, val);
> +}
> +
> +static inline unsigned long rzfive_read_pmaaddr(unsigned int i)
> +{
> +	unsigned long ret = 0;
> +
> +	if (i == 0)
> +		ret = csr_read(PMAADDR_0);
> +	else if (i == 1)
> +		ret = csr_read(PMAADDR_1);
> +	else if (i == 2)
> +		ret = csr_read(PMAADDR_2);
> +	else if (i == 3)
> +		ret = csr_read(PMAADDR_3);
> +	else if (i == 4)
> +		ret = csr_read(PMAADDR_4);
> +	else if (i == 5)
> +		ret = csr_read(PMAADDR_5);
> +	else if (i == 6)
> +		ret =  csr_read(PMAADDR_6);
            ^
            a space added

> +	else if (i == 7)
> +		ret = csr_read(PMAADDR_7);
> +	else if (i == 8)
> +		ret = csr_read(PMAADDR_8);
> +	else if (i == 9)
> +		ret = csr_read(PMAADDR_9);
> +	else if (i == 10)
> +		ret = csr_read(PMAADDR_10);
> +	else if (i == 11)
> +		ret = csr_read(PMAADDR_11);
> +	else if (i == 12)
> +		ret = csr_read(PMAADDR_12);
> +	else if (i == 13)
> +		ret = csr_read(PMAADDR_13);
> +	else if (i == 14)
> +		ret = csr_read(PMAADDR_14);
> +	else if (i == 15)
> +		ret = csr_read(PMAADDR_15);
> +
> +	return ret;
> +}
> +
> +unsigned long rzfive_setup_pma_region(unsigned long addr, unsigned long size,
> +				      int entry_id, u32 flag)
> +{
> +	unsigned long size_tmp, shift = 0, pmacfg_val;
> +	unsigned long mmsc = csr_read(CSR_MMSC_CFG);
> +	unsigned long pa = addr;
> +	char *pmaxcfg;
> +	int power = 0;
> +

The granularity of PMA NAPOT mode is 4KiB, so we should not allow this
case.

if (size < (1 << 12))
  return SBI_EINVAL;

> +	if (flag > 0xff || entry_id > 15)
> +		return SBI_EINVAL;
> +
> +	if ((mmsc & PMA_MMSC_CFG) == 0)
> +		return 0;
             ^
             SBI_ENOTSUPP
Can we rename this field as PPMA_MMCS_CFG, which is the same name
in the datasheet?

> +
> +	size_tmp = size;
> +	if ((pa & (size_tmp - 1)) != 0) {
> +		pa = pa & ~(size_tmp - 1);
> +		size_tmp = size_tmp << 1;

PMA only has NAPOT mode, maybe return SBI_EINVAL here?

> +	}
> +
> +	/* Calculate the NAPOT table for pmaaddr */
> +	size_tmp = size;
> +	while (size_tmp != 0x1) {
> +		size_tmp = size_tmp >> 1;
> +		power++;
> +		if (power > 3)
> +			shift = (shift << 1) | 0x1;
> +	}
> +
> +	pmacfg_val = rzfive_read_pmacfg(entry_id / 8);
> +	pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
> +	*pmaxcfg = 0;
> +	*pmaxcfg = (u8)flag;
> +
> +	rzfive_write_pmacfg(entry_id / 8, pmacfg_val);
> +
> +	pa = pa >> 2;
> +	pa |= shift;
> +	pa = pa & ~(0x1 << (power - 3));
> +

Can we simplify the logic to calculate the value of pmaaddr?

If addr = 0x58000000
   size = 0x08000000

pmaaddr = (addr >> 2) + (size >> 3) - 1 = 0x16ffffff


Best regards,
Peter Lin

