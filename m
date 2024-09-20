From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Sep 2024 21:46:56 +0530
Subject: [PATCH 2/2] lib: sbi: Use a linked list to track domains
In-Reply-To: <20240829194634.3644683-2-samuel.holland@sifive.com>
References: <20240829194634.3644683-1-samuel.holland@sifive.com> <20240829194634.3644683-2-samuel.holland@sifive.com>
Message-ID: <CAAhSdy1VVOdUnqZ4__xeaGrT_q1qSwOvOsb_NcRzeCk0s+gnJg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 30, 2024 at 1:16?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This removes the compile-time limit on the number of domains. It also
> reduces firmware size by about 200 bytes by removing the lookup table.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  include/sbi/sbi_domain.h     | 18 +++++++-----------
>  lib/sbi/sbi_domain.c         | 30 +++++++++---------------------
>  lib/sbi/sbi_domain_context.c |  6 +++---
>  3 files changed, 19 insertions(+), 35 deletions(-)
>
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index 34ebd39d..313ae156 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -11,6 +11,7 @@
>  #define __SBI_DOMAIN_H__
>
>  #include <sbi/riscv_locks.h>
> +#include <sbi/sbi_list.h>
>  #include <sbi/sbi_types.h>
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_domain_context.h>
> @@ -158,11 +159,10 @@ struct sbi_domain_memregion {
>         unsigned long flags;
>  };
>
> -/** Maximum number of domains */
> -#define SBI_DOMAIN_MAX_INDEX                   32
> -
>  /** Representation of OpenSBI domain */
>  struct sbi_domain {
> +       /** Node in linked list of domains */
> +       struct sbi_dlist node;
>         /** Logical index of this domain */
>         u32 index;
>         /** HARTs assigned to this domain */
> @@ -206,16 +206,12 @@ void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom);
>  #define sbi_domain_thishart_ptr() \
>         sbi_hartindex_to_domain(sbi_hartid_to_hartindex(current_hartid()))
>
> -/** Index to domain table */
> -extern struct sbi_domain *domidx_to_domain_table[];
> -
> -/** Get pointer to sbi_domain from index */
> -#define sbi_index_to_domain(__index) \
> -       domidx_to_domain_table[__index]
> +/** Head of linked list of domains */
> +extern struct sbi_dlist domain_list;
>
>  /** Iterate over each domain */
> -#define sbi_domain_for_each(__i, __d) \
> -       for ((__i) = 0; ((__d) = sbi_index_to_domain(__i)); (__i)++)
> +#define sbi_domain_for_each(__d) \
> +       sbi_list_for_each_entry(__d, &domain_list, node)
>
>  /** Iterate over each memory region of a domain */
>  #define sbi_domain_for_each_memregion(__d, __r) \
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 374ac36b..7198e27e 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -13,16 +13,14 @@
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_heap.h>
>  #include <sbi/sbi_hsm.h>
> +#include <sbi/sbi_list.h>
>  #include <sbi/sbi_math.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_string.h>
>
> -/*
> - * We allocate an extra element because sbi_domain_for_each() expects
> - * the array to be null-terminated.
> - */
> -struct sbi_domain *domidx_to_domain_table[SBI_DOMAIN_MAX_INDEX + 1] = { 0 };
> +SBI_LIST_HEAD(domain_list);
> +
>  static u32 domain_count = 0;
>  static bool domain_finalized = false;
>
> @@ -519,10 +517,9 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
>
>  void sbi_domain_dump_all(const char *suffix)
>  {
> -       u32 i;
>         const struct sbi_domain *dom;
>
> -       sbi_domain_for_each(i, dom) {
> +       sbi_domain_for_each(dom) {
>                 sbi_domain_dump(dom, suffix);
>                 sbi_printf("\n");
>         }
> @@ -541,21 +538,11 @@ int sbi_domain_register(struct sbi_domain *dom,
>                 return SBI_EINVAL;
>
>         /* Check if domain already discovered */
> -       sbi_domain_for_each(i, tdom) {
> +       sbi_domain_for_each(tdom) {
>                 if (tdom == dom)
>                         return SBI_EALREADY;
>         }
>
> -       /*
> -        * Ensure that we have room for Domain Index to
> -        * HART ID mapping
> -        */
> -       if (SBI_DOMAIN_MAX_INDEX <= domain_count) {
> -               sbi_printf("%s: No room for %s\n",
> -                          __func__, dom->name);
> -               return SBI_ENOSPC;
> -       }
> -
>         /* Sanitize discovered domain */
>         rc = sanitize_domain(dom);
>         if (rc) {
> @@ -565,9 +552,10 @@ int sbi_domain_register(struct sbi_domain *dom,
>                 return rc;
>         }
>
> +       sbi_list_add_tail(&dom->node, &domain_list);
> +
>         /* Assign index to domain */
>         dom->index = domain_count++;
> -       domidx_to_domain_table[dom->index] = dom;
>
>         /* Initialize spinlock for dom->assigned_harts */
>         SPIN_LOCK_INIT(dom->assigned_harts_lock);
> @@ -692,7 +680,7 @@ int sbi_domain_root_add_memrange(unsigned long addr, unsigned long size,
>  int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
>  {
>         int rc;
> -       u32 i, dhart;
> +       u32 dhart;
>         struct sbi_domain *dom;
>         const struct sbi_platform *plat = sbi_platform_ptr(scratch);
>
> @@ -705,7 +693,7 @@ int sbi_domain_finalize(struct sbi_scratch *scratch, u32 cold_hartid)
>         }
>
>         /* Startup boot HART of domains */
> -       sbi_domain_for_each(i, dom) {
> +       sbi_domain_for_each(dom) {
>                 /* Domain boot HART index */
>                 dhart = sbi_hartid_to_hartindex(dom->boot_hartid);
>
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> index 49a2f769..1432e3a8 100755
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -107,7 +107,7 @@ int sbi_domain_context_enter(struct sbi_domain *dom)
>
>  int sbi_domain_context_exit(void)
>  {
> -       u32 i, hartindex = sbi_hartid_to_hartindex(current_hartid());
> +       u32 hartindex = sbi_hartid_to_hartindex(current_hartid());
>         struct sbi_domain *dom;
>         struct sbi_context *ctx = sbi_domain_context_thishart_ptr();
>         struct sbi_context *dom_ctx, *tmp;
> @@ -118,7 +118,7 @@ int sbi_domain_context_exit(void)
>          * its context on the current hart if valid.
>          */
>         if (!ctx) {
> -               sbi_domain_for_each(i, dom) {
> +               sbi_domain_for_each(dom) {
>                         if (!sbi_hartmask_test_hartindex(hartindex,
>                                                          dom->possible_harts))
>                                 continue;
> @@ -140,7 +140,7 @@ int sbi_domain_context_exit(void)
>         /* If no previous caller context */
>         if (!dom_ctx) {
>                 /* Try to find next uninitialized user-defined domain's context */
> -               sbi_domain_for_each(i, dom) {
> +               sbi_domain_for_each(dom) {
>                         if (dom == &root || dom == sbi_domain_thishart_ptr())
>                                 continue;
>
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

