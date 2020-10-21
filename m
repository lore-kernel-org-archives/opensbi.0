From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 21 Oct 2020 07:05:36 +0000
Subject: [PATCH v4 06/16] lib: sbi: Add initial domain support
In-Reply-To: <20201020093930.2551352-7-anup.patel@wdc.com>
References: <20201020093930.2551352-1-anup.patel@wdc.com>
 <20201020093930.2551352-7-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201FB3534A9CB1959A8CB7C8D1C0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 20 October 2020 15:09
> To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org; Anup
> Patel <Anup.Patel@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>
> Subject: [PATCH v4 06/16] lib: sbi: Add initial domain support
> 
> An OpenSBI domain is a logical entity representing a set of HARTs and a set of
> memory regions for these HARTs.
> 
> The OpenSBI domains support will allow OpenSBI platforms and previous
> booting stage (i.e. U-Boot SPL, Coreboot, etc) to partition a system into
> multiple domains where each domain will run it's own software.
> 
> For inter-domain isolation, OpenSBI will eventually use various HW features
> such as PMP, ePMP, IOPMP, SiFive shield, etc but initial implementation only
> use HW PMP support.
> 
> This patch provides initial implementation of OpenSBI domains where we
> have a root/default domain and OpenSBI platforms can provide non-
> root/custom domains using domain_get() callback.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  include/sbi/sbi_domain.h   | 147 ++++++++++++++
>  include/sbi/sbi_platform.h |  20 ++
>  lib/sbi/objects.mk         |   1 +
>  lib/sbi/sbi_domain.c       | 380
> +++++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_init.c         |  20 ++
>  5 files changed, 568 insertions(+)
>  create mode 100644 include/sbi/sbi_domain.h  create mode 100644
> lib/sbi/sbi_domain.c
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h new file
> mode 100644 index 0000000..4bb08dc
> --- /dev/null
> +++ b/include/sbi/sbi_domain.h
> @@ -0,0 +1,147 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#ifndef __SBI_DOMAIN_H__
> +#define __SBI_DOMAIN_H__
> +
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_hartmask.h>
> +
> +struct sbi_scratch;
> +
> +/** Domain access types */
> +enum sbi_domain_access {
> +	SBI_DOMAIN_READ = (1UL << 0),
> +	SBI_DOMAIN_WRITE = (1UL << 1),
> +	SBI_DOMAIN_EXECUTE = (1UL << 2),
> +	SBI_DOMAIN_MMIO = (1UL << 3)
> +};
> +
> +/** Representation of OpenSBI domain memory region */ struct
> +sbi_domain_memregion {
> +	/**
> +	 * Size of memory region as power of 2
> +	 * It has to be minimum 3 and maximum __riscv_xlen
> +	 */
> +	unsigned long order;
> +	/**
> +	 * Base address of memory region
> +	 * It must be 2^order aligned address
> +	 */
> +	unsigned long base;
> +	/** Flags representing memory region attributes */
> +#define SBI_DOMAIN_MEMREGION_READABLE		(1UL << 0)
> +#define SBI_DOMAIN_MEMREGION_WRITEABLE		(1UL << 1)
> +#define SBI_DOMAIN_MEMREGION_EXECUTABLE		(1UL << 2)
> +#define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 3)
> +#define SBI_DOMAIN_MEMREGION_MMODE		(1UL << 4)
> +	unsigned long flags;
> +};
> +
> +/** Maximum number of domains */
> +#define SBI_DOMAIN_MAX_INDEX			32
> +
> +/** Representation of OpenSBI domain */ struct sbi_domain {
> +	/**
> +	 * Logical index of this domain
> +	 * Note: This set by sbi_domain_finalize() in the coldboot path
> +	 */
> +	u32 index;
> +	/**
> +	 * HARTs assigned to this domain
> +	 * Note: This set by sbi_domain_init() and sbi_domain_finalize()
> +	 * in the coldboot path
> +	 */
> +	struct sbi_hartmask assigned_harts;
> +	/** Name of this domain */
> +	char name[64];
> +	/** Possible HARTs in this domain */
> +	const struct sbi_hartmask *possible_harts;
> +	/** Array of memory regions terminated by a region with order zero
> */
> +	struct sbi_domain_memregion *regions;
> +	/** HART id of the HART booting this domain */
> +	u32 boot_hartid;
> +	/** Arg1 (or 'a1' register) of next booting stage for this domain */
> +	unsigned long next_arg1;
> +	/** Address of next booting stage for this domain */
> +	unsigned long next_addr;
> +	/** Privilege mode of next booting stage for this domain */
> +	unsigned long next_mode;
> +	/** Is domain allowed to reset the system */
> +	bool system_reset_allowed;
> +};
> +
> +/** HART id to domain table */
> +extern struct sbi_domain *hartid_to_domain_table[];
> +
> +/** Get pointer to sbi_domain from HART id */ #define
> +sbi_hartid_to_domain(__hartid) \
> +	hartid_to_domain_table[__hartid]
> +
> +/** Get pointer to sbi_domain for current HART */ #define
> +sbi_domain_thishart_ptr() \
> +	sbi_hartid_to_domain(current_hartid())
> +
> +/** Index to domain table */
> +extern struct sbi_domain *domidx_to_domain_table[];
> +
> +/** Get pointer to sbi_domain from index */ #define
> +sbi_index_to_domain(__index) \
> +	domidx_to_domain_table[__index]
> +
> +/** Iterate over each domain */
> +#define sbi_domain_for_each(__i, __d) \
> +	for ((__i) = 0; ((__d) = sbi_index_to_domain(__i)); (__i)++)
> +
> +/** Iterate over each memory region of a domain */ #define
> +sbi_domain_for_each_memregion(__d, __r) \
> +	for ((__r) = (__d)->regions; (__r)->order; (__r)++)
> +
> +/**
> + * Check whether given HART is assigned to specified domain
> + * @param dom pointer to domain
> + * @param hartid the HART ID
> + * @return TRUE if HART is assigned to domain otherwise FALSE  */ bool
> +sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid);
> +
> +/**
> + * Get ulong assigned HART mask for given domain and HART base ID
> + * @param dom pointer to domain
> + * @param hbase the HART base ID
> + * @return ulong possible HART mask
> + * Note: the return ulong mask will be set to zero on failure.
> + */
> +ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> +				       ulong hbase);
> +
> +/** Initialize a domain memory region as firmware region */ void
> +sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg);
> +
> +/**
> + * Check whether we can access specified address for given mode and
> + * memory region flags under a domain
> + * @param dom pointer to domain
> + * @param addr the address to be checked
> + * @param mode the privilege mode of access
> + * @param access_flags bitmask of domain access types (enum
> +sbi_domain_access)
> + * @return TRUE if access allowed otherwise FALSE  */ bool
> +sbi_domain_check_addr(const struct sbi_domain *dom,
> +			   unsigned long addr, unsigned long mode,
> +			   unsigned long access_flags);
> +
> +/** Finalize domain tables and startup non-root domains */ int
> +sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid);
> +
> +/** Initialize domains */
> +int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
> +
> +#endif
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h index
> f2c3237..e1355d8 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -44,6 +44,7 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_version.h>
> 
> +struct sbi_domain;
>  struct sbi_trap_info;
> 
>  /** Possible feature flags of a platform */ @@ -89,6 +90,9 @@ struct
> sbi_platform_operations {
>  	 */
>  	int (*misa_get_xlen)(void);
> 
> +	/** Get domain pointer for given HART id */
> +	struct sbi_domain *(*domain_get)(u32 hartid);
> +
>  	/** Write a character to the platform console output */
>  	void (*console_putc)(char ch);
>  	/** Read a character from the platform console input */ @@ -447,6
> +451,22 @@ static inline int sbi_platform_misa_xlen(const struct
> sbi_platform *plat)
>  	return -1;
>  }
> 
> +/**
> + * Get domain pointer for given HART
> + *
> + * @param plat pointer to struct sbi_platform
> + * @param hartid shorthand letter for CPU extensions
> + *
> + * @return non-NULL domain pointer on success and NULL on failure  */
> +static inline struct sbi_domain *sbi_platform_domain_get(
> +				const struct sbi_platform *plat, u32 hartid) {
> +	if (plat && sbi_platform_ops(plat)->domain_get)
> +		return sbi_platform_ops(plat)->domain_get(hartid);
> +	return NULL;
> +}
> +
>  /**
>   * Write a character to the platform console output
>   *
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk index fa808a0..6f2c06f
> 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -15,6 +15,7 @@ libsbi-objs-y += riscv_locks.o  libsbi-objs-y +=
> sbi_bitmap.o  libsbi-objs-y += sbi_bitops.o  libsbi-objs-y += sbi_console.o
> +libsbi-objs-y += sbi_domain.o
>  libsbi-objs-y += sbi_ecall.o
>  libsbi-objs-y += sbi_ecall_base.o
>  libsbi-objs-y += sbi_ecall_hsm.o
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c new file mode 100644
> index 0000000..86dfefd
> --- /dev/null
> +++ b/lib/sbi/sbi_domain.c
> @@ -0,0 +1,380 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_hartmask.h>
> +#include <sbi/sbi_hsm.h>
> +#include <sbi/sbi_math.h>
> +#include <sbi/sbi_platform.h>
> +#include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_string.h>
> +
> +struct sbi_domain *hartid_to_domain_table[SBI_HARTMASK_MAX_BITS] =
> { 0
> +}; struct sbi_domain
> *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX] = {
> +0 };
> +
> +static u32 domain_count = 0;
> +
> +static struct sbi_hartmask root_hmask = { 0 };
> +
> +#define ROOT_FW_REGION		0
> +#define ROOT_ALL_REGION	1
> +#define ROOT_END_REGION	2
> +static struct sbi_domain_memregion root_memregs[ROOT_END_REGION +
> 1] =
> +{ 0 };
> +
> +static struct sbi_domain root = {
> +	.name = "root",
> +	.possible_harts = &root_hmask,
> +	.regions = root_memregs,
> +	.system_reset_allowed = TRUE,
> +};
> +
> +bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32
> +hartid) {
> +	if (dom)
> +		return sbi_hartmask_test_hart(hartid, &dom-
> >assigned_harts);
> +
> +	return FALSE;
> +}
> +
> +ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> +				       ulong hbase)
> +{
> +	ulong ret, bword, boff;
> +
> +	if (!dom)
> +		return 0;
> +
> +	bword = BIT_WORD(hbase);
> +	boff = BIT_WORD_OFFSET(hbase);
> +
> +	ret = sbi_hartmask_bits(&dom->assigned_harts)[bword++] >> boff;
> +	if (boff && bword < BIT_WORD(SBI_HARTMASK_MAX_BITS)) {
> +		ret |= (sbi_hartmask_bits(&dom->assigned_harts)[bword] &
> +			(BIT(boff) - 1UL)) << (BITS_PER_LONG - boff);
> +	}
> +
> +	return ret;
> +}
> +
> +void sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg) {
> +	if (!reg)
> +		return;
> +
> +	sbi_memcpy(reg, &root_memregs[ROOT_FW_REGION],
> sizeof(*reg)); }
> +
> +bool sbi_domain_check_addr(const struct sbi_domain *dom,
> +			   unsigned long addr, unsigned long mode,
> +			   unsigned long access_flags)
> +{
> +	bool mmio = FALSE;
> +	struct sbi_domain_memregion *reg;
> +	unsigned long rstart, rend, rflags, rwx = 0;
> +
> +	if (!dom)
> +		return FALSE;
> +
> +	if (access_flags & SBI_DOMAIN_READ)
> +		rwx |= SBI_DOMAIN_MEMREGION_READABLE;
> +	if (access_flags & SBI_DOMAIN_WRITE)
> +		rwx |= SBI_DOMAIN_MEMREGION_WRITEABLE;
> +	if (access_flags & SBI_DOMAIN_EXECUTE)
> +		rwx |= SBI_DOMAIN_MEMREGION_EXECUTABLE;
> +	if (access_flags & SBI_DOMAIN_MMIO)
> +		mmio = TRUE;
> +
> +	sbi_domain_for_each_memregion(dom, reg) {
> +		rflags = reg->flags;
> +		if (mode == PRV_M && !(rflags &
> SBI_DOMAIN_MEMREGION_MMODE))
> +			continue;
> +
> +		rstart = reg->base;
> +		rend = (reg->order < __riscv_xlen) ?
> +			rstart + ((1UL << reg->order) - 1) : -1UL;
> +		if (rstart <= addr && addr <= rend) {
> +			if ((mmio && !(rflags &
> SBI_DOMAIN_MEMREGION_MMIO)) ||
> +			    (!mmio && (rflags &
> SBI_DOMAIN_MEMREGION_MMIO)))
> +				return FALSE;
> +			return ((rflags & rwx) == rwx) ? TRUE : FALSE;
> +		}
> +	}
> +
> +	return (mode == PRV_M) ? TRUE : FALSE; }
> +
> +/* Check if region complies with constraints */ static bool
> +is_region_valid(const struct sbi_domain_memregion *reg) {
> +	if (reg->order < 3 || __riscv_xlen < reg->order)
> +		return FALSE;
> +
> +	if (reg->base & (BIT(reg->order) - 1))
> +		return FALSE;
> +
> +	return TRUE;
> +}
> +
> +/** Check if regionA is sub-region of regionB */ static bool
> +is_region_subset(const struct sbi_domain_memregion *regA,
> +			     const struct sbi_domain_memregion *regB) {
> +	ulong regA_start = regA->base;
> +	ulong regA_end = regA->base + (BIT(regA->order) - 1);
> +	ulong regB_start = regB->base;
> +	ulong regB_end = regB->base + (BIT(regA->order) - 1);
> +
> +	if ((regB_start <= regA_start) &&
> +	    (regA_start < regB_end) &&
> +	    (regB_start < regA_end) &&
> +	    (regA_end <= regB_end))
> +		return TRUE;
> +
> +	return FALSE;
> +}
> +
> +/** Check if regionA conflicts regionB */ static bool
> +is_region_conflict(const struct sbi_domain_memregion *regA,
> +				const struct sbi_domain_memregion *regB) {
> +	if ((is_region_subset(regA, regB) || is_region_subset(regB, regA))
> &&
> +	    regA->flags == regB->flags)
> +		return TRUE;
> +
> +	return FALSE;
> +}
> +
> +/** Check if regionA should be placed before regionB */ static bool
> +is_region_before(const struct sbi_domain_memregion *regA,
> +			     const struct sbi_domain_memregion *regB) {
> +	if (regA->order < regB->order)
> +		return TRUE;
> +
> +	if ((regA->order == regB->order) &&
> +	    (regA->base < regB->base))
> +		return TRUE;
> +
> +	return FALSE;
> +}
> +
> +static int sanitize_domain(const struct sbi_platform *plat,
> +			   struct sbi_domain *dom)
> +{
> +	u32 i, j, count;
> +	bool have_fw_reg;
> +	struct sbi_domain_memregion treg, *reg, *reg1;
> +
> +	/* Check possible HARTs */
> +	if (!dom->possible_harts)
> +		return SBI_EINVAL;
> +	sbi_hartmask_for_each_hart(i, dom->possible_harts) {
> +		if (sbi_platform_hart_invalid(plat, i))
> +			return SBI_EINVAL;
> +	};
> +
> +	/* Check memory regions */
> +	if (!dom->regions)
> +		return SBI_EINVAL;
> +	sbi_domain_for_each_memregion(dom, reg) {
> +		if (!is_region_valid(reg))
> +			return SBI_EINVAL;
> +	}
> +
> +	/* Count memory regions and check presence of firmware region */
> +	count = 0;
> +	have_fw_reg = FALSE;
> +	sbi_domain_for_each_memregion(dom, reg) {
> +		if (reg->order == root_memregs[ROOT_FW_REGION].order
> &&
> +		    reg->base == root_memregs[ROOT_FW_REGION].base &&
> +		    reg->flags == root_memregs[ROOT_FW_REGION].flags)
> +			have_fw_reg = TRUE;
> +		count++;
> +	}
> +	if (!have_fw_reg)
> +		return SBI_EINVAL;
> +
> +	/* Sort the memory regions */
> +	for (i = 0; i < (count - 1); i++) {
> +		reg = &dom->regions[i];
> +		for (j = i + 1; j < count; j++) {
> +			reg1 = &dom->regions[j];
> +
> +			if (is_region_conflict(reg1, reg))
> +				return SBI_EINVAL;
> +
> +			if (!is_region_before(reg1, reg))
> +				continue;
> +
> +			sbi_memcpy(&treg, reg1, sizeof(treg));
> +			sbi_memcpy(reg1, reg, sizeof(treg));
> +			sbi_memcpy(reg, &treg, sizeof(treg));
> +		}
> +	}
> +
> +	/*
> +	 * We don't need to check boot HART id of domain because if boot
> +	 * HART id is not possible/assigned to this domain then it won't
> +	 * be started at boot-time by sbi_domain_finalize().
> +	 */
> +
> +	/*
> +	 * Check next mode
> +	 *
> +	 * We only allow next mode to be S-mode or U-mode.so that we can
> +	 * protect M-mode context and enforce checks on memory accesses.
> +	 */
> +	if (dom->next_mode != PRV_S &&
> +	    dom->next_mode != PRV_U)
> +		return SBI_EINVAL;
> +
> +	/* Check next address and next mode*/
> +	if (!sbi_domain_check_addr(dom, dom->next_addr, dom-
> >next_mode,
> +				   SBI_DOMAIN_EXECUTE))
> +		return SBI_EINVAL;
> +
> +	return 0;
> +}
> +
> +int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid) {
> +	int rc;
> +	u32 i, j, dhart;
> +	bool dom_exists;
> +	struct sbi_domain *dom, *tdom;
> +	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> +
> +	/* Discover domains */
> +	for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
> +		/* Ignore invalid HART */
> +		if (sbi_platform_hart_invalid(plat, i))
> +			continue;
> +
> +		/* Get domain assigned to HART */
> +		dom = sbi_platform_domain_get(plat, i);
> +		if (!dom)
> +			continue;
> +
> +		/* Check if domain already discovered */
> +		dom_exists = FALSE;
> +		sbi_domain_for_each(j, tdom) {
> +			if (tdom == dom) {
> +				dom_exists = TRUE;
> +				break;
> +			}
> +		}
> +
> +		/* Newly discovered domain */
> +		if (!dom_exists) {
> +			/*
> +			 * Ensure that we have room for Domain Index to
> +			 * HART ID mapping
> +			 */
> +			if (domain_count <= SBI_DOMAIN_MAX_INDEX)
> +				return SBI_ENOSPC;
> +
> +			/* Sanitize discovered domain */
> +			rc = sanitize_domain(plat, dom);
> +			if (rc)
> +				return rc;
> +
> +			/* Assign index to domain */
> +			dom->index = domain_count++;
> +			domidx_to_domain_table[dom->index] = dom;
> +
> +			/* Clear assigned HARTs of domain */
> +			sbi_hartmask_clear_all(&dom->assigned_harts);
> +		}
> +
> +		/* Assign domain to HART if HART is a possible HART */
> +		if (sbi_hartmask_test_hart(i, dom->possible_harts)) {
> +			tdom = hartid_to_domain_table[i];
> +			if (tdom)
> +				sbi_hartmask_clear_hart(i,
> +						&tdom->assigned_harts);
> +			hartid_to_domain_table[i] = dom;
> +			sbi_hartmask_set_hart(i, &dom->assigned_harts);
> +		}
> +	}
> +
> +	/* Startup boot HART of domains */
> +	sbi_domain_for_each(i, dom) {
> +		/* Domain boot HART */
> +		dhart = dom->boot_hartid;
> +
> +		/* Ignore if boot HART not possible for this domain */
> +		if (!sbi_hartmask_test_hart(i, dom->possible_harts))
> +			continue;
> +
> +		/* Ignore if boot HART assigned different domain */
> +		if (sbi_hartid_to_domain(dhart) != dom ||
> +		    !sbi_hartmask_test_hart(i, &dom->assigned_harts))
> +			continue;
> +
> +		/* Startup boot HART of domain */
> +		if (dhart == cold_hartid) {
> +			scratch->next_addr = dom->next_addr;
> +			scratch->next_mode = dom->next_mode;
> +			scratch->next_arg1 = dom->next_arg1;
> +		} else {
> +			rc = sbi_hsm_hart_start(scratch, dhart, dom-
> >next_addr,
> +					dom->next_mode, dom-
> >next_arg1);
> +			if (rc)
> +				return rc;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid) {
> +	u32 i;
> +	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> +
> +	/* Root domain firmware memory region */
> +	root_memregs[ROOT_FW_REGION].order = log2roundup(scratch-
> >fw_size);
> +	root_memregs[ROOT_FW_REGION].base = scratch->fw_start &
> +				~((1UL << root_memregs[0].order) - 1UL);
> +	root_memregs[ROOT_FW_REGION].flags = 0;
> +
> +	/* Root domain allow everything memory region */
> +	root_memregs[ROOT_ALL_REGION].order = __riscv_xlen;
> +	root_memregs[ROOT_ALL_REGION].base = 0;
> +	root_memregs[ROOT_ALL_REGION].flags =
> (SBI_DOMAIN_MEMREGION_READABLE |
> +
> 	SBI_DOMAIN_MEMREGION_WRITEABLE |
> +
> 	SBI_DOMAIN_MEMREGION_EXECUTABLE);
> +
> +	/* Root domain memory region end */
> +	root_memregs[ROOT_END_REGION].order = 0;
> +
> +	/* Root domain boot HART id is same as coldboot HART id */
> +	root.boot_hartid = cold_hartid;
> +
> +	/* Root domain next booting stage details */
> +	root.next_arg1 = scratch->next_arg1;
> +	root.next_addr = scratch->next_addr;
> +	root.next_mode = scratch->next_mode;
> +
> +	/* Select root domain for all valid HARTs */
> +	for (i = 0; i < SBI_HARTMASK_MAX_BITS; i++) {
> +		if (sbi_platform_hart_invalid(plat, i))
> +			continue;
> +		sbi_hartmask_set_hart(i, &root_hmask);
> +		hartid_to_domain_table[i] = &root;
> +		sbi_hartmask_set_hart(i, &root.assigned_harts);
> +	}
> +
> +	/* Set root domain index */
> +	root.index = domain_count++;
> +	domidx_to_domain_table[root.index] = &root;
> +
> +	return 0;
> +}
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index 5cedb15..406cb3f 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -12,6 +12,7 @@
>  #include <sbi/riscv_barrier.h>
>  #include <sbi/riscv_locks.h>
>  #include <sbi/sbi_console.h>
> +#include <sbi/sbi_domain.h>
>  #include <sbi/sbi_ecall.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_hartmask.h>
> @@ -169,6 +170,11 @@ static void __noreturn init_coldboot(struct
> sbi_scratch *scratch, u32 hartid)
>  	if (rc)
>  		sbi_hart_hang();
> 
> +	/* Note: This has to be second thing in coldboot init sequence */
> +	rc = sbi_domain_init(scratch, hartid);
> +	if (rc)
> +		sbi_hart_hang();
> +
>  	init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__,
>  						     "INIT_COUNT");
>  	if (!init_count_offset)
> @@ -210,10 +216,24 @@ static void __noreturn init_coldboot(struct
> sbi_scratch *scratch, u32 hartid)
>  	if (rc)
>  		sbi_hart_hang();
> 
> +	/*
> +	 * Note: Finalize domains after HSM initialization so that we
> +	 * can startup non-root domains.
> +	 * Note: Finalize domains before HART PMP configuration so
> +	 * that we use correct domain for configuring PMP.
> +	 */
> +	rc = sbi_domain_finalize(scratch, hartid);
> +	if (rc)
> +		sbi_hart_hang();
> +
>  	rc = sbi_hart_pmp_configure(scratch);
>  	if (rc)
>  		sbi_hart_hang();
> 
> +	/*
> +	 * Note: Platform final initialization should be last so that
> +	 * it sees correct domain assignment and PMP configuration.
> +	 */
>  	rc = sbi_platform_final_init(plat, TRUE);
>  	if (rc)
>  		sbi_hart_hang();
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo

Regards,
Anup

