From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Feb 2024 18:04:05 +0530
Subject: [PATCH v3] lib: sbi: Add initial domain context management support
In-Reply-To: <63c27eb1e50752f499414ab37bd9e51d2364fbbc.1705028699.git.2931013282@sjtu.edu.cn>
References: <63c27eb1e50752f499414ab37bd9e51d2364fbbc.1705028699.git.2931013282@sjtu.edu.cn>
Message-ID: <CAAhSdy0G-7y-qzO2bft+XLTNebDhcCq=8yBFMYiqco8SMuWboA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 12, 2024 at 8:36?AM Qingyu Shang <2931013282@sjtu.edu.cn> wrote:
>
> The domain context management component in OpenSBI provides basic CPU
> context management routines for existing OpenSBI domain. As domain
> extension, it was initially designed to facilitate the suspension
> and resumption of domains, enabling secure domains to efficiently
> share CPU resources.
>
> The patch also provides an addition to the OpenSBI domain to provide
> updates on hart-domain assignment and declarations of contexts within
> the domain.
>
> Signed-off-by: Qingyu Shang <2931013282@sjtu.edu.cn>
> ---
>  docs/domain_support.md           |   2 +
>  include/sbi/sbi_domain.h         |   6 ++
>  include/sbi/sbi_domain_context.h |  80 ++++++++++++++++
>  lib/sbi/objects.mk               |   1 +
>  lib/sbi/sbi_domain.c             |  11 ++-
>  lib/sbi/sbi_domain_context.c     | 152 +++++++++++++++++++++++++++++++
>  6 files changed, 250 insertions(+), 2 deletions(-)
>  create mode 100755 include/sbi/sbi_domain_context.h
>  create mode 100755 lib/sbi/sbi_domain_context.c
>
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index b285d65ae..c98b83211 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -41,6 +41,7 @@ has following details:
>  * **name** - Name of this domain
>  * **assigned_harts** - HARTs assigned to this domain
>  * **possible_harts** - HARTs possible in this domain
> +* **hartindex_to_context_table** - Contexts corresponding to possible HARTs
>  * **regions** - Array of memory regions terminated by a memory region
>    with order zero
>  * **boot_hartid** - HART id of the HART booting this domain. The domain
> @@ -80,6 +81,7 @@ following manner:
>    platform support
>  * **possible_harts** - All valid HARTs of a RISC-V platform are possible
>    HARTs of the ROOT domain
> +* **hartindex_to_context_table** - Contexts corresponding to ROOT domain's possible HARTs
>  * **regions** - Two memory regions available to the ROOT domain:
>    **A)** A memory region to protect OpenSBI firmware from S-mode and U-mode
>    **B)** A memory region of **order=__riscv_xlen** allowing S-mode and
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index c88dbac63..4706cfca7 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -12,6 +12,7 @@
>
>  #include <sbi/sbi_types.h>
>  #include <sbi/sbi_hartmask.h>
> +#include <sbi/sbi_domain_context.h>
>
>  struct sbi_scratch;
>
> @@ -176,6 +177,8 @@ struct sbi_domain {
>         char name[64];
>         /** Possible HARTs in this domain */
>         const struct sbi_hartmask *possible_harts;
> +       /** Contexts for possible HARTs indexed by hartindex */
> +       struct sbi_context *hartindex_to_context_table[SBI_HARTMASK_MAX_BITS];
>         /** Array of memory regions terminated by a region with order zero */
>         struct sbi_domain_memregion *regions;
>         /** HART id of the HART booting this domain */
> @@ -200,6 +203,9 @@ extern struct sbi_domain root;
>  /** Get pointer to sbi_domain from HART index */
>  struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex);
>
> +/** Update HART local pointer to point to specified domain */
> +void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom);
> +
>  /** Get pointer to sbi_domain for current HART */
>  #define sbi_domain_thishart_ptr() \
>         sbi_hartindex_to_domain(sbi_hartid_to_hartindex(current_hartid()))
> diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
> new file mode 100755
> index 000000000..89f779195
> --- /dev/null
> +++ b/include/sbi/sbi_domain_context.h
> @@ -0,0 +1,80 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) IPADS at SJTU 2023. All rights reserved.
> + */
> +
> +#ifndef __SBI_DOMAIN_CONTEXT_H__
> +#define __SBI_DOMAIN_CONTEXT_H__
> +
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_trap.h>
> +#include <sbi/sbi_domain.h>
> +
> +/** Context representation for a hart within a domain */
> +struct sbi_context {
> +       /** Trap-related states such as GPRs, mepc, and mstatus */
> +       struct sbi_trap_regs regs;
> +
> +       /** Supervisor status register */
> +       unsigned long sstatus;
> +       /** Supervisor interrupt enable register */
> +       unsigned long sie;
> +       /** Supervisor trap vector base address register */
> +       unsigned long stvec;
> +       /** Supervisor scratch register for temporary storage */
> +       unsigned long sscratch;
> +       /** Supervisor exception program counter register */
> +       unsigned long sepc;
> +       /** Supervisor cause register */
> +       unsigned long scause;
> +       /** Supervisor trap value register */
> +       unsigned long stval;
> +       /** Supervisor interrupt pending register */
> +       unsigned long sip;
> +       /** Supervisor address translation and protection register */
> +       unsigned long satp;
> +       /** Counter-enable register */
> +       unsigned long scounteren;
> +       /** Supervisor environment configuration register */
> +       unsigned long senvcfg;
> +
> +       /** Reference to the owning domain */
> +       struct sbi_domain *dom;
> +       /** Previous context (caller) to jump to during context exits */
> +       struct sbi_context *prev_ctx;
> +       /** Is context initialized and runnable */
> +       bool initialized;
> +};
> +
> +/** Get the context pointer for a given hart index and domain */
> +#define sbi_hartindex_to_domain_context(__hartindex, __d) \
> +       (__d)->hartindex_to_context_table[__hartindex]
> +
> +/** Macro to obtain the current hart's context pointer */
> +#define sbi_domain_context_thishart_ptr()                  \
> +       sbi_hartindex_to_domain_context(                   \
> +               sbi_hartid_to_hartindex(current_hartid()), \
> +               sbi_domain_thishart_ptr())
> +
> +/**
> + * Enter a specific domain context synchronously
> + * @param dom pointer to domain
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_domain_context_enter(struct sbi_domain *dom);
> +
> +/**
> + * Exit the current domain context, and then return to the caller
> + * of sbi_domain_context_enter or attempt to start the next domain
> + * context to be initialized
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_domain_context_exit(void);
> +
> +/** Initialize contexts for all domains */
> +int sbi_domain_context_init(struct sbi_scratch *scratch);
> +
> +#endif // __SBI_DOMAIN_CONTEXT_H__
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 0a50e95c3..138be96fd 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -58,6 +58,7 @@ libsbi-objs-$(CONFIG_SBI_ECALL_DBTR) += sbi_ecall_dbtr.o
>  libsbi-objs-y += sbi_bitmap.o
>  libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
> +libsbi-objs-y += sbi_domain_context.o
>  libsbi-objs-y += sbi_domain.o
>  libsbi-objs-y += sbi_emulate_csr.o
>  libsbi-objs-y += sbi_fifo.o
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 4e9f7428a..217116198 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -51,7 +51,7 @@ struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
>         return sbi_scratch_read_type(scratch, void *, domain_hart_ptr_offset);
>  }
>
> -static void update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
> +void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
>  {
>         struct sbi_scratch *scratch;
>
> @@ -567,7 +567,7 @@ int sbi_domain_register(struct sbi_domain *dom,
>                 if (tdom)
>                         sbi_hartmask_clear_hartindex(i,
>                                         &tdom->assigned_harts);
> -               update_hartindex_to_domain(i, dom);
> +               sbi_update_hartindex_to_domain(i, dom);
>                 sbi_hartmask_set_hartindex(i, &dom->assigned_harts);
>
>                 /*
> @@ -725,6 +725,13 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
>                 }
>         }
>
> +       rc = sbi_domain_context_init(scratch);
> +       if (rc) {
> +               sbi_printf("%s: domain context init failed (error %d)\n",
> +                          __func__, rc);
> +               return rc;
> +       }
> +
>         /*
>          * Set the finalized flag so that the root domain
>          * regions can't be changed.
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> new file mode 100755
> index 000000000..db7281862
> --- /dev/null
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -0,0 +1,152 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) IPADS at SJTU 2023. All rights reserved.
> + */
> +
> +#include <sbi/sbi_error.h>
> +#include <sbi/riscv_locks.h>
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_hsm.h>
> +#include <sbi/sbi_hart.h>
> +#include <sbi/sbi_heap.h>
> +#include <sbi/sbi_scratch.h>
> +#include <sbi/sbi_string.h>
> +#include <sbi/sbi_domain_context.h>
> +
> +/**
> + * Switches the HART context from the current domain to the target domain.
> + * This includes changing domain assignments and reconfiguring PMP, as well
> + * as saving and restoring CSRs and trap states.
> + *
> + * @param ctx pointer to the current HART context
> + * @param dom_ctx pointer to the target domain context
> + */
> +static void switch_to_next_domain_context(struct sbi_context *ctx,
> +                                         struct sbi_context *dom_ctx)
> +{
> +       u32 hartindex;
> +       struct sbi_trap_regs *trap_regs;
> +       struct sbi_domain *dom      = dom_ctx->dom;
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       unsigned int pmp_count      = sbi_hart_pmp_count(scratch);
> +
> +       /* Assign current hart to target domain */
> +       hartindex = sbi_hartid_to_hartindex(current_hartid());
> +       sbi_hartmask_clear_hartindex(
> +               hartindex, &sbi_domain_thishart_ptr()->assigned_harts);
> +       sbi_update_hartindex_to_domain(hartindex, dom);
> +       sbi_hartmask_set_hartindex(hartindex, &dom->assigned_harts);
> +
> +       /* Reconfigure PMP settings for the new domain */
> +       for (int i = 0; i < pmp_count; i++) {
> +               pmp_disable(i);
> +       }
> +       sbi_hart_pmp_configure(scratch);
> +
> +       /* Save current CSR context and restore target domain's CSR context */
> +       ctx->sstatus    = csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
> +       ctx->sie        = csr_swap(CSR_SIE, dom_ctx->sie);
> +       ctx->stvec      = csr_swap(CSR_STVEC, dom_ctx->stvec);
> +       ctx->sscratch   = csr_swap(CSR_SSCRATCH, dom_ctx->sscratch);
> +       ctx->sepc       = csr_swap(CSR_SEPC, dom_ctx->sepc);
> +       ctx->scause     = csr_swap(CSR_SCAUSE, dom_ctx->scause);
> +       ctx->stval      = csr_swap(CSR_STVAL, dom_ctx->stval);
> +       ctx->sip        = csr_swap(CSR_SIP, dom_ctx->sip);
> +       ctx->satp       = csr_swap(CSR_SATP, dom_ctx->satp);
> +       ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
> +       ctx->senvcfg    = csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
> +
> +       /* Save current trap state and restore target domain's trap state */
> +       trap_regs = (struct sbi_trap_regs *)(csr_read(CSR_MSCRATCH) -
> +                                            SBI_TRAP_REGS_SIZE);
> +       sbi_memcpy(&ctx->regs, trap_regs, sizeof(*trap_regs));
> +       sbi_memcpy(trap_regs, &dom_ctx->regs, sizeof(*trap_regs));
> +
> +       /* Mark current context structure initialized because context saved */
> +       ctx->initialized = true;
> +
> +       /* If target domain context is not initialized or runnable */
> +       if (!dom_ctx->initialized) {
> +               /* Startup boot HART of target domain */
> +               if (current_hartid() == dom->boot_hartid)
> +                       sbi_hart_switch_mode(dom->boot_hartid, dom->next_arg1,
> +                                            dom->next_addr, dom->next_mode,
> +                                            false);
> +               else
> +                       sbi_hsm_hart_stop(scratch, true);
> +       }
> +}
> +
> +int sbi_domain_context_enter(struct sbi_domain *dom)
> +{
> +       struct sbi_context *ctx     = sbi_domain_context_thishart_ptr();
> +       struct sbi_context *dom_ctx = sbi_hartindex_to_domain_context(
> +               sbi_hartid_to_hartindex(current_hartid()), dom);
> +
> +       /* Validate the domain context existence */
> +       if (!dom_ctx)
> +               return SBI_EINVAL;
> +
> +       /* Update target context's previous context to indicate the caller */
> +       dom_ctx->prev_ctx = ctx;
> +
> +       switch_to_next_domain_context(ctx, dom_ctx);
> +
> +       return 0;
> +}
> +
> +int sbi_domain_context_exit(void)
> +{
> +       u32 i, hartindex = sbi_hartid_to_hartindex(current_hartid());
> +       struct sbi_domain *dom;
> +       struct sbi_context *ctx     = sbi_domain_context_thishart_ptr();
> +       struct sbi_context *dom_ctx = ctx->prev_ctx, *tmp;
> +
> +       /* If no previous caller context */
> +       if (!dom_ctx) {
> +               /* Try to find next uninitialized user-defined domain's context */
> +               sbi_domain_for_each(i, dom) {
> +                       if (dom == &root || dom == sbi_domain_thishart_ptr())
> +                               continue;
> +
> +                       tmp = sbi_hartindex_to_domain_context(hartindex, dom);
> +                       if (tmp && !tmp->initialized) {
> +                               dom_ctx = tmp;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       /* Take the root domain context if fail to find */
> +       if (!dom_ctx)
> +               dom_ctx = sbi_hartindex_to_domain_context(hartindex, &root);
> +
> +       switch_to_next_domain_context(ctx, dom_ctx);
> +
> +       return 0;
> +}
> +
> +int sbi_domain_context_init(struct sbi_scratch *scratch)
> +{
> +       u32 i, j;
> +       struct sbi_domain *dom;
> +       struct sbi_context *dom_ctx;
> +
> +       /* Loop through each domain to configure its contexts */
> +       sbi_domain_for_each(i, dom) {
> +               /* Iterate over all possible HARTs and allocate context structure */
> +               sbi_hartmask_for_each_hartindex(j, dom->possible_harts) {
> +                       dom_ctx = sbi_zalloc(sizeof(struct sbi_context));
> +                       if (!dom_ctx)
> +                               return SBI_ENOMEM;
> +
> +                       /* Bind context and domain */
> +                       dom_ctx->dom                       = dom;
> +                       dom->hartindex_to_context_table[j] = dom_ctx;

Pre-allocating context for all domains will simply increase
the memory consumption even for users who don't
intend to use domain switching at runtime.

Once this is addressed, I think we are ready to merge
this patch.

How about allocating sbi_context on-demain in
sbi_domain_context_enter() ?

Regards,
Anup

> +               }
> +       }
> +
> +       return 0;
> +}
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

