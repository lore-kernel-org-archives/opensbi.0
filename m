From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jan 2024 22:22:29 +0530
Subject: [PATCH v2] lib: sbi: Add initial domain context management support
In-Reply-To: <afe51f54ba1a1e723657f21eba070b84e30e1b90.1703054766.git.2931013282@sjtu.edu.cn>
References: <afe51f54ba1a1e723657f21eba070b84e30e1b90.1703054766.git.2931013282@sjtu.edu.cn>
Message-ID: <CAAhSdy3y_CpwpMCyiDTfTiD4CZXZNH8cyoQFJ9JXv+Fmog2U-Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 20, 2023 at 12:40?PM Qingyu Shang <2931013282@sjtu.edu.cn> wrote:
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
>  include/sbi/sbi_domain.h         |  10 ++
>  include/sbi/sbi_domain_context.h |  80 +++++++++
>  lib/sbi/objects.mk               |   1 +
>  lib/sbi/sbi_domain.c             |  22 +++
>  lib/sbi/sbi_domain_context.c     | 275 +++++++++++++++++++++++++++++++
>  6 files changed, 390 insertions(+)
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
> index c88dbac63..edfecf599 100644
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
> @@ -237,6 +240,13 @@ bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartid);
>  ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
>                                        ulong hbase);
>
> +/**
> + * Assign given HART to specified domain
> + * @param dom pointer to domain
> + * @param hartid the HART ID
> + */
> +void sbi_domain_assign_hart(struct sbi_domain *dom, u32 hartid);
> +
>  /**
>   * Initialize a domain memory region based on it's physical
>   * address and size.
> diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
> new file mode 100755
> index 000000000..5c345ab9a
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
> +       /** Next context to jump to during context exits */
> +       struct sbi_context *next_ctx;

The name "next_ctx" is misleading.
Better to name it "prev_ctx".

> +       /** Is context initialized and idle */
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
> index c69918701..d4e08ca82 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -55,6 +55,7 @@ libsbi-objs-$(CONFIG_SBI_ECALL_VENDOR) += sbi_ecall_vendor.o
>  libsbi-objs-y += sbi_bitmap.o
>  libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
> +libsbi-objs-y += sbi_domain_context.o
>  libsbi-objs-y += sbi_domain.o
>  libsbi-objs-y += sbi_emulate_csr.o
>  libsbi-objs-y += sbi_fifo.o
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 4e9f7428a..9639561b1 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -82,6 +82,21 @@ ulong sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
>         return ret;
>  }
>
> +void sbi_domain_assign_hart(struct sbi_domain *dom, u32 hartid)
> +{
> +       struct sbi_domain *tdom;
> +       u32 hartindex = sbi_hartid_to_hartindex(hartid);
> +
> +       if (!dom || !sbi_hartindex_valid(hartindex))
> +               return;
> +
> +       tdom = sbi_hartindex_to_domain(hartindex);
> +       if (tdom)
> +               sbi_hartmask_clear_hartindex(hartindex, &tdom->assigned_harts);
> +       update_hartindex_to_domain(hartindex, dom);
> +       sbi_hartmask_set_hartindex(hartindex, &dom->assigned_harts);
> +}
> +
>  void sbi_domain_memregion_init(unsigned long addr,
>                                 unsigned long size,
>                                 unsigned long flags,
> @@ -725,6 +740,13 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
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
> index 000000000..90996d91e
> --- /dev/null
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -0,0 +1,275 @@
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
> +static spinlock_t domain_startup_lock = SPIN_LOCK_INITIALIZER;
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
> +       struct sbi_trap_regs *trap_regs;
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       unsigned int pmp_count      = sbi_hart_pmp_count(scratch);
> +
> +       /* Assign the current HART to the domain of the target context */
> +       sbi_domain_assign_hart(dom_ctx->dom, current_hartid());
> +
> +       /* Disable all PMP regions in preparation for re-configuration */
> +       for (int i = 0; i < pmp_count; i++) {
> +               pmp_disable(i);
> +       }
> +       /* Reconfigure PMP settings for the new domain */
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
> +}
> +
> +/**
> + * Starts up the current domain context by booting its boot HART. This
> + * function verifies that all possible HARTs are properly assigned to the
> + * domain prior to its startup, guaranteeing the correct initialization
> + * of contexts. If the assignment is incomplete, the current HART will
> + * be stoped to await.
> + */
> +static void __noreturn startup_domain_context()
> +{
> +       int rc;
> +       u32 i;
> +       struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       struct sbi_context *ctx     = sbi_domain_context_thishart_ptr();
> +       struct sbi_domain *dom      = ctx->dom;
> +
> +       /* Check if possible HARTs are all assigned */
> +       sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
> +               /* If a HART is not assigned, stop the current HART */
> +               if (!sbi_hartmask_test_hartindex(i, &dom->assigned_harts))
> +                       sbi_hsm_hart_stop(scratch, true);
> +       }

Why do all possible HARTs of domain have to be assigned ?

This is very confusing and bloated. Please simplify this.

> +
> +       /* Ensure startup is only executed once by a single executor */
> +       spin_lock(&domain_startup_lock);
> +       if (ctx->initialized) {
> +               spin_unlock(&domain_startup_lock);
> +               sbi_hsm_hart_stop(scratch, true);
> +       }
> +       sbi_hartmask_for_each_hartindex(i, dom->possible_harts)
> +               sbi_hartindex_to_domain_context(i, dom)
> +                       ->initialized = true;
> +       spin_unlock(&domain_startup_lock);
> +
> +       /* Startup boot HART of domain */
> +       if (current_hartid() == dom->boot_hartid) {
> +               sbi_hart_switch_mode(dom->boot_hartid, dom->next_arg1,
> +                                    dom->next_addr, dom->next_mode, false);
> +       } else {
> +               /* Wait boot HART stopped */
> +               while (__sbi_hsm_hart_get_state(dom->boot_hartid) !=
> +                      SBI_HSM_STATE_STOPPED)
> +                       ;
> +
> +               if ((rc = sbi_hsm_hart_start(scratch, dom, dom->boot_hartid,
> +                                            dom->next_addr, dom->next_mode,
> +                                            dom->next_arg1)))
> +                       sbi_printf("%s: failed to start boot HART %d"
> +                                  " for %s (error %d)\n",
> +                                  __func__, dom->boot_hartid, dom->name, rc);
> +               /* Stop current HART, it will be started by boot HART later */
> +               sbi_hsm_hart_stop(scratch, true);
> +       }
> +
> +       __builtin_unreachable();
> +}
> +
> +/**
> + * Allocates and configures context for all possible HARTs within a
> + * given domain. Confirm the validity of boot HART and possible HARTs,
> + * and construct the domain boot-up chain on each HART.
> + *
> + * @param hartindex_to_tail_ctx_table the tail context of boot-up chain
> + * @param dom pointer to the domain being set up
> + * @return 0 on success and negative error code on failure
> + */
> +static int
> +setup_domain_context(struct sbi_context *hartindex_to_tail_ctx_table[],
> +                    struct sbi_domain *dom)
> +{
> +       int rc;
> +       u32 i;
> +       struct sbi_context *dom_ctx;
> +
> +       /* Iterate over all possible HARTs and initialize their context */
> +       sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
> +               dom_ctx = sbi_zalloc(sizeof(struct sbi_context));
> +               if (!dom_ctx) {
> +                       rc = SBI_ENOMEM;
> +                       goto fail_free_all;
> +               }
> +
> +               /* Initialize the domain context and add to domain's context table */
> +               dom_ctx->dom                       = dom;
> +               dom->hartindex_to_context_table[i] = dom_ctx;
> +
> +               /* If assigned, it would be the head of boot-up chain */
> +               if (sbi_hartmask_test_hartindex(i, &dom->assigned_harts)) {
> +                       hartindex_to_tail_ctx_table[i] = dom_ctx;
> +
> +                       /* Mark initialized as it's about to startup */
> +                       dom_ctx->initialized = true;
> +                       continue;
> +               }
> +
> +               /*
> +                * If ROOT doamin, it would be the next context of tail context
> +                * Note: The ROOT domain is the parameter for the last time
> +                * function call, so the tail context must be present.
> +                */
> +               if (dom == &root) {
> +                       hartindex_to_tail_ctx_table[i]->next_ctx = dom_ctx;
> +                       continue;
> +               }
> +
> +               /*
> +                * If not assigned, check that the domain configuration meets the
> +                * criteria for context management, ensuring that each domain
> +                * context is capable of proper initialization.
> +                */
> +               if (sbi_hartmask_test_hartindex(
> +                           sbi_hartid_to_hartindex(dom->boot_hartid),
> +                           &dom->assigned_harts)) {
> +                       sbi_printf(
> +                               "%s: %s possible HART mask has unassigned HART %d at "
> +                               "boot time, whose context can't be initialized\n",
> +                               __func__, dom->name,
> +                               sbi_hartindex_to_hartid(i));
> +                       rc = SBI_EINVAL;
> +                       goto fail_free_all;
> +               }
> +
> +               if (!hartindex_to_tail_ctx_table[i]) {
> +                       sbi_printf(
> +                               "%s: %s possible HART mask has unassignable HART %d, "
> +                               "domain contexts will never be started up\n",
> +                               __func__, dom->name,
> +                               sbi_hartindex_to_hartid(i));
> +                       rc = SBI_EINVAL;
> +                       goto fail_free_all;
> +               }
> +
> +               /* If valid, append it to the boot-up chain */
> +               hartindex_to_tail_ctx_table[i]->next_ctx = dom_ctx;
> +               hartindex_to_tail_ctx_table[i]           = dom_ctx;
> +       }
> +
> +       return 0;
> +
> +fail_free_all:
> +       /* Free any allocated context data in case of failure */
> +       sbi_hartmask_for_each_hartindex(i, dom->possible_harts)
> +               if (dom->hartindex_to_context_table[i])
> +                       sbi_free(dom->hartindex_to_context_table[i]);
> +       return rc;
> +}
> +
> +int sbi_domain_context_enter(struct sbi_domain *dom)
> +{
> +       struct sbi_context *ctx     = sbi_domain_context_thishart_ptr();
> +       struct sbi_context *dom_ctx = sbi_hartindex_to_domain_context(
> +               sbi_hartid_to_hartindex(current_hartid()), dom);
> +
> +       /* Validate the domain context before entering */
> +       if (!dom_ctx || !dom_ctx->initialized)
> +               return SBI_EINVAL;
> +
> +       switch_to_next_domain_context(ctx, dom_ctx);
> +
> +       /* Update target domain context's next context to indicate the caller */
> +       dom_ctx->next_ctx = ctx;
> +
> +       return 0;
> +}
> +
> +int sbi_domain_context_exit(void)
> +{
> +       struct sbi_context *ctx     = sbi_domain_context_thishart_ptr();
> +       struct sbi_context *dom_ctx = ctx->next_ctx;
> +       bool need_startup;
> +
> +       if (!dom_ctx)
> +               return SBI_EINVAL;
> +
> +       /*
> +        * Determine if it needs to be startup before switching
> +        * Note: `initialized` may be updated by another HART after current HART
> +     * assigned to the domain of context in switch_to_next_domain_context().

Indentation is not right here.

> +        */
> +       need_startup = !dom_ctx->initialized;
> +
> +       switch_to_next_domain_context(ctx, dom_ctx);
> +
> +       if (need_startup)
> +               startup_domain_context(dom_ctx);
> +
> +       return 0;
> +}
> +
> +int sbi_domain_context_init(struct sbi_scratch *scratch)
> +{
> +       int rc;
> +       u32 i;
> +       struct sbi_domain *dom;
> +
> +       /* Track tail context for context boot-up chain construction on HARTs */
> +       struct sbi_context
> +               *hartindex_to_tail_ctx_table[SBI_HARTMASK_MAX_BITS] = { 0 };

I don't see any value in setting up all the next_ctx pointer at boot time.
Lets just leave it NULL because the sbi_domain_context_enter() is
anyway setting it when entering a domain.

I think the hartindex_to_tail_ctx_table[] can be dropped.

> +
> +       /* Loop through each user-defined domain to configure its contexts */
> +       sbi_domain_for_each(i, dom) {
> +               if (dom != &root && (rc = setup_domain_context(
> +                                            hartindex_to_tail_ctx_table, dom)))
> +                       return rc;
> +       }
> +
> +       /* Initialize ROOT domain contexts as default contexts */
> +       if ((rc = setup_domain_context(hartindex_to_tail_ctx_table, &root)))
> +               return rc;
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

Regards,
Anup

