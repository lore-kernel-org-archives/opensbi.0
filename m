From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Oct 2020 11:43:41 +0530
Subject: [PATCH v3 06/16] lib: sbi: Add initial domain support
In-Reply-To: <9ba844047b2e3c399cc1d560106640bb484cf94a.camel@wdc.com>
References: <20201019125453.2460105-1-anup.patel@wdc.com>
 <20201019125453.2460105-7-anup.patel@wdc.com>
 <9ba844047b2e3c399cc1d560106640bb484cf94a.camel@wdc.com>
Message-ID: <CAAhSdy0fOYBq4PyUSG1mA5CDz1OD+crmosdu_teoTUKg_7Pa_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2020 at 11:48 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> On Mon, 2020-10-19 at 18:24 +0530, Anup Patel wrote:
> > An OpenSBI domain is a logical entity representing a set of HARTs
> > and a set of memory regions for these HARTs.
> >
> > The OpenSBI domains support will allow OpenSBI platforms and previous
> > booting stage (i.e. U-Boot SPL, Coreboot, etc) to partition a system
> > into multiple domains where each domain will run it's own software.
> >
> > For inter-domain isolation, OpenSBI will eventually use various HW
> > features such as PMP, ePMP, IOPMP, SiFive shield, etc but initial
> > implementation only use HW PMP support.
> >
> > This patch provides initial implementation of OpenSBI domains where
> > we have a root/default domain and OpenSBI platforms can provide
> > non-root/custom domains using domain_get() callback.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_domain.h   | 147 ++++++++++++++
> >  include/sbi/sbi_platform.h |  20 ++
> >  lib/sbi/objects.mk         |   1 +
> >  lib/sbi/sbi_domain.c       | 380
> > +++++++++++++++++++++++++++++++++++++
> >  lib/sbi/sbi_init.c         |  20 ++
> >  5 files changed, 568 insertions(+)
> >  create mode 100644 include/sbi/sbi_domain.h
> >  create mode 100644 lib/sbi/sbi_domain.c
> >
> > diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> > new file mode 100644
> > index 0000000..4bb08dc
> > --- /dev/null
> > +++ b/include/sbi/sbi_domain.h
> > @@ -0,0 +1,147 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> > + *
> > + * Authors:
> > + *   Anup Patel <anup.patel@wdc.com>
> > + */
> > +
> > +#ifndef __SBI_DOMAIN_H__
> > +#define __SBI_DOMAIN_H__
> > +
> > +#include <sbi/sbi_types.h>
> > +#include <sbi/sbi_hartmask.h>
> > +
> > +struct sbi_scratch;
> > +
> > +/** Domain access types */
> > +enum sbi_domain_access {
> > +     SBI_DOMAIN_READ = (1UL << 0),
> > +     SBI_DOMAIN_WRITE = (1UL << 1),
> > +     SBI_DOMAIN_EXECUTE = (1UL << 2),
> > +     SBI_DOMAIN_MMIO = (1UL << 3)
> > +};
> > +
> > +/** Representation of OpenSBI domain memory region */
> > +struct sbi_domain_memregion {
> > +     /**
> > +      * Size of memory region as power of 2
> > +      * It has to be minimum 3 and maximum __riscv_xlen
> > +      */
> > +     unsigned long order;
> > +     /**
> > +      * Base address of memory region
> > +      * It must be 2^order aligned address
> > +      */
> > +     unsigned long base;
> > +     /** Flags representing memory region attributes */
> > +#define SBI_DOMAIN_MEMREGION_READABLE                (1UL << 0)
> > +#define SBI_DOMAIN_MEMREGION_WRITEABLE               (1UL << 1)
> > +#define SBI_DOMAIN_MEMREGION_EXECUTABLE              (1UL << 2)
> > +#define SBI_DOMAIN_MEMREGION_MMIO            (1UL << 3)
> > +#define SBI_DOMAIN_MEMREGION_MMODE           (1UL << 4)
> > +     unsigned long flags;
> > +};
> > +
> > +/** Maximum number of domains */
> > +#define SBI_DOMAIN_MAX_INDEX                 32
> > +
> > +/** Representation of OpenSBI domain */
> > +struct sbi_domain {
> > +     /**
> > +      * Logical index of this domain
> > +      * Note: This set by sbi_domain_finalize() in the coldboot path
> > +      */
> > +     u32 index;
> > +     /**
> > +      * HARTs assigned to this domain
> > +      * Note: This set by sbi_domain_init() and
> > sbi_domain_finalize()
> > +      * in the coldboot path
> > +      */
> > +     struct sbi_hartmask assigned_harts;
> > +     /** Name of this domain */
> > +     char name[64];
> > +     /** Possible HARTs in this domain */
> > +     const struct sbi_hartmask *possible_harts;
>
> Can you describe how is this different to the assigned harts?

"possible_harts" means the set of HARTs which can be assigned
to this domain whereas "assigned_harts" are the set of HARTs
currently assigned to the domain.

These two hartmasks make it possible to have a HART change
its domain assignment at runtime (not supported currently).

For example, let's say we have two domains but only one HART
possible in both domains. Clearly, the HART can be assigned to
only one domain but the HART domain assignment can change
at runtime when some work is required to be done in another
domain context.

>
> > +     /** Array of memory regions terminated by a region with order
> > zero */
> > +     struct sbi_domain_memregion *regions;
> > +     /** HART id of the HART booting this domain */
> > +     u32 boot_hartid;
> > +     /** Arg1 (or 'a1' register) of next booting stage for this
> > domain */
> > +     unsigned long next_arg1;
> > +     /** Address of next booting stage for this domain */
> > +     unsigned long next_addr;
> > +     /** Privilege mode of next booting stage for this domain */
> > +     unsigned long next_mode;
> > +     /** Is domain allowed to reset the system */
> > +     bool system_reset_allowed;
> > +};
> > +
> > +/** HART id to domain table */
> > +extern struct sbi_domain *hartid_to_domain_table[];
> > +
> > +/** Get pointer to sbi_domain from HART id */
> > +#define sbi_hartid_to_domain(__hartid) \
> > +     hartid_to_domain_table[__hartid]
> > +
> > +/** Get pointer to sbi_domain for current HART */
> > +#define sbi_domain_thishart_ptr() \
> > +     sbi_hartid_to_domain(current_hartid())
> > +
> > +/** Index to domain table */
> > +extern struct sbi_domain *domidx_to_domain_table[];
> > +
> > +/** Get pointer to sbi_domain from index */
> > +#define sbi_index_to_domain(__index) \
> > +     domidx_to_domain_table[__index]
> > +
> > +/** Iterate over each domain */
> > +#define sbi_domain_for_each(__i, __d) \
> > +     for ((__i) = 0; ((__d) = sbi_index_to_domain(__i)); (__i)++)
> > +
> > +/** Iterate over each memory region of a domain */
> > +#define sbi_domain_for_each_memregion(__d, __r) \
> > +     for ((__r) = (__d)->regions; (__r)->order; (__r)++)
> > +
> > +/**
> > + * Check whether given HART is assigned to specified domain
> > + * @param dom pointer to domain
> > + * @param hartid the HART ID
> > + * @return TRUE if HART is assigned to domain otherwise FALSE
> > + */
> > +bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32
> > hartid);
> > +
> > +/**
> > + * Get ulong assigned HART mask for given domain and HART base ID
> > + * @param dom pointer to domain
> > + * @param hbase the HART base ID
> > + * @return ulong possible HART mask
> > + * Note: the return ulong mask will be set to zero on failure.
> > + */
> > +ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> > +                                    ulong hbase);
> > +
> > +/** Initialize a domain memory region as firmware region */
> > +void sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg);
> > +
> > +/**
> > + * Check whether we can access specified address for given mode and
> > + * memory region flags under a domain
> > + * @param dom pointer to domain
> > + * @param addr the address to be checked
> > + * @param mode the privilege mode of access
> > + * @param access_flags bitmask of domain access types (enum
> > sbi_domain_access)
> > + * @return TRUE if access allowed otherwise FALSE
> > + */
> > +bool sbi_domain_check_addr(const struct sbi_domain *dom,
> > +                        unsigned long addr, unsigned long mode,
> > +                        unsigned long access_flags);
> > +
> > +/** Finalize domain tables and startup non-root domains */
> > +int sbi_domain_finalize(struct sbi_scratch *scratch, u32
> > cold_hartid);
> > +
> > +/** Initialize domains */
> > +int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
> > +
> > +#endif
> > diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> > index f2c3237..e1355d8 100644
> > --- a/include/sbi/sbi_platform.h
> > +++ b/include/sbi/sbi_platform.h
> > @@ -44,6 +44,7 @@
> >  #include <sbi/sbi_scratch.h>
> >  #include <sbi/sbi_version.h>
> >
> > +struct sbi_domain;
> >  struct sbi_trap_info;
> >
> >  /** Possible feature flags of a platform */
> > @@ -89,6 +90,9 @@ struct sbi_platform_operations {
> >        */
> >       int (*misa_get_xlen)(void);
> >
> > +     /** Get domain pointer for given HART id */
> > +     struct sbi_domain *(*domain_get)(u32 hartid);
> > +
> >       /** Write a character to the platform console output */
> >       void (*console_putc)(char ch);
> >       /** Read a character from the platform console input */
> > @@ -447,6 +451,22 @@ static inline int sbi_platform_misa_xlen(const
> > struct sbi_platform *plat)
> >       return -1;
> >  }
> >
> > +/**
> > + * Get domain pointer for given HART
> > + *
> > + * @param plat pointer to struct sbi_platform
> > + * @param hartid shorthand letter for CPU extensions
> > + *
> > + * @return non-NULL domain pointer on success and NULL on failure
> > + */
> > +static inline struct sbi_domain *sbi_platform_domain_get(
> > +                             const struct sbi_platform *plat, u32
> > hartid)
> > +{
> > +     if (plat && sbi_platform_ops(plat)->domain_get)
> > +             return sbi_platform_ops(plat)->domain_get(hartid);
> > +     return NULL;
> > +}
> > +
> >  /**
> >   * Write a character to the platform console output
> >   *
> > diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> > index fa808a0..6f2c06f 100644
> > --- a/lib/sbi/objects.mk
> > +++ b/lib/sbi/objects.mk
> > @@ -15,6 +15,7 @@ libsbi-objs-y += riscv_locks.o
> >  libsbi-objs-y += sbi_bitmap.o
> >  libsbi-objs-y += sbi_bitops.o
> >  libsbi-objs-y += sbi_console.o
> > +libsbi-objs-y += sbi_domain.o
> >  libsbi-objs-y += sbi_ecall.o
> >  libsbi-objs-y += sbi_ecall_base.o
> >  libsbi-objs-y += sbi_ecall_hsm.o
> > diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> > new file mode 100644
> > index 0000000..ed0053f
> > --- /dev/null
> > +++ b/lib/sbi/sbi_domain.c
> > @@ -0,0 +1,380 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> > + *
> > + * Authors:
> > + *   Anup Patel <anup.patel@wdc.com>
> > + */
> > +
> > +#include <sbi/riscv_asm.h>
> > +#include <sbi/sbi_domain.h>
> > +#include <sbi/sbi_hartmask.h>
> > +#include <sbi/sbi_hsm.h>
> > +#include <sbi/sbi_math.h>
> > +#include <sbi/sbi_platform.h>
> > +#include <sbi/sbi_scratch.h>
> > +#include <sbi/sbi_string.h>
> > +
> > +struct sbi_domain *hartid_to_domain_table[SBI_HARTMASK_MAX_BITS] = {
> > 0 };
> > +struct sbi_domain *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX] = {
> > 0 };
> > +
> > +static u32 domain_count = 0;
> > +
> > +static struct sbi_hartmask root_hmask = { 0 };
> > +
> > +#define ROOT_FW_REGION               0
> > +#define ROOT_ALL_REGION      1
> > +#define ROOT_END_REGION      2
> > +static struct sbi_domain_memregion root_memregs[ROOT_END_REGION + 1]
> > = { 0 };
> > +
> > +static struct sbi_domain root = {
> > +     .name = "root",
> > +     .possible_harts = &root_hmask,
> > +     .regions = root_memregs,
> > +     .system_reset_allowed = TRUE,
> > +};
> > +
> > +bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32
> > hartid)
> > +{
> > +     if (dom)
> > +             return sbi_hartmask_test_hart(hartid, &dom-
> > >assigned_harts);
> > +
> > +     return FALSE;
> > +}
> > +
> > +ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
> > +                                    ulong hbase)
> > +{
> > +     ulong ret, bword, boff;
> > +
> > +     if (!dom)
> > +             return 0;
> > +
> > +     bword = BIT_WORD(hbase);
> > +     boff = BIT_WORD_OFFSET(hbase);
> > +
> > +     ret = sbi_hartmask_bits(&dom->assigned_harts)[bword++] >> boff;
> > +     if (boff && bword < BIT_WORD(SBI_HARTMASK_MAX_BITS)) {
> > +             ret |= (sbi_hartmask_bits(&dom->assigned_harts)[bword]
> > &
> > +                     (BIT(boff) - 1UL)) << (BITS_PER_LONG - boff);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +void sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg)
> > +{
> > +     if (!reg)
> > +             return;
> > +
> > +     sbi_memcpy(reg, &root_memregs[ROOT_FW_REGION], sizeof(*reg));
> > +}
> > +
> > +bool sbi_domain_check_addr(const struct sbi_domain *dom,
> > +                        unsigned long addr, unsigned long mode,
> > +                        unsigned long access_flags)
> > +{
> > +     bool mmio = FALSE;
> > +     struct sbi_domain_memregion *reg;
> > +     unsigned long rstart, rend, rflags, rwx = 0;
> > +
> > +     if (!dom)
> > +             return FALSE;
> > +
> > +     if (access_flags & SBI_DOMAIN_READ)
> > +             rwx |= SBI_DOMAIN_MEMREGION_READABLE;
> > +     if (access_flags & SBI_DOMAIN_WRITE)
> > +             rwx |= SBI_DOMAIN_MEMREGION_WRITEABLE;
> > +     if (access_flags & SBI_DOMAIN_EXECUTE)
> > +             rwx |= SBI_DOMAIN_MEMREGION_EXECUTABLE;
> > +     if (access_flags & SBI_DOMAIN_MMIO)
> > +             mmio = TRUE;
> > +
> > +     sbi_domain_for_each_memregion(dom, reg) {
> > +             rflags = reg->flags;
> > +             if (mode == PRV_M && !(rflags &
> > SBI_DOMAIN_MEMREGION_MMODE))
> > +                     continue;
> > +
> > +             rstart = reg->base;
> > +             rend = (reg->order < __riscv_xlen) ?
> > +                     rstart + ((1UL << reg->order) - 1) : -1UL;
> > +             if (rstart <= addr && addr <= rend) {
> > +                     if ((mmio && !(rflags &
> > SBI_DOMAIN_MEMREGION_MMIO)) ||
> > +                         (!mmio && (rflags &
> > SBI_DOMAIN_MEMREGION_MMIO)))
> > +                             return FALSE;
> > +                     return ((rflags & rwx) == rwx) ? TRUE : FALSE;
> > +             }
> > +     }
> > +
> > +     return (mode == PRV_M) ? TRUE : FALSE;
> > +}
> > +
> > +/* Check if region comply with constraints */
>
> s/comply/complies/g

Okay, will update.

>
> Otherwsie:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair

Thanks,
Anup

