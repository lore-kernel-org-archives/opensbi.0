From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Mar 2025 09:48:23 +0530
Subject: [PATCH v2 2/4] lib: sbi_domain: Introduce per-domain MPXY state data
In-Reply-To: <20250225011640.949660-3-alvinga@andestech.com>
References: <20250225011640.949660-1-alvinga@andestech.com> <20250225011640.949660-3-alvinga@andestech.com>
Message-ID: <CAAhSdy2qB9baH5bhq+sSYbDRhsGdSFrwc_xhbjeZnJqG2wbPxA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025 at 6:47?AM Alvin Chang <alvinga@andestech.com> wrote:
>
> When multiple supervisor domains need to communicate with OpenSBI
> through MPXY channel, they will allocate shared memory from their
> own memory region (e.g. using alloc_pages() in Linux; memalign()
> in OP-TEE OS), thus the MPXY state need to be per-domain and
> per-hart data.
>
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Co-developed-by: Yong Li <yong.li@intel.com>
> Signed-off-by: Yong Li <yong.li@intel.com>
> Reviewed-by: Alvin Chang <alvinga@andestech.com>
> ---
>  include/sbi/sbi_domain.h            |  1 +
>  include/sbi/sbi_domain_mpxy_state.h | 50 +++++++++++++++++++++++++++++
>  lib/sbi/objects.mk                  |  1 +
>  lib/sbi/sbi_domain.c                |  9 +++++-
>  lib/sbi/sbi_domain_mpxy_state.c     | 47 +++++++++++++++++++++++++++

No need for a separate sbi_domain_mpxy_state.c and sbi_domain_mpxy_state.h

The sbi_mpxy_init() can do sbi_domain_register_data() instead of doing it
very early in sbi_domain_init. This means we can squash this change into
your PATCH3 and drop PATCH1.

Regards,
Anup




>  5 files changed, 107 insertions(+), 1 deletion(-)
>  create mode 100644 include/sbi/sbi_domain_mpxy_state.h
>  create mode 100644 lib/sbi/sbi_domain_mpxy_state.c
>
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> index e9cff0b..9d88234 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -16,6 +16,7 @@
>  #include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_domain_context.h>
>  #include <sbi/sbi_domain_data.h>
> +#include <sbi/sbi_domain_mpxy_state.h>
>
>  struct sbi_scratch;
>
> diff --git a/include/sbi/sbi_domain_mpxy_state.h b/include/sbi/sbi_domain_mpxy_state.h
> new file mode 100644
> index 0000000..c5e3cdc
> --- /dev/null
> +++ b/include/sbi/sbi_domain_mpxy_state.h
> @@ -0,0 +1,50 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Intel Corporation.
> + * Copyright (c) 2024-2025 Andes Technology Corporation.
> + */
> +
> +#ifndef __SBI_DOMAIN_MPXY_STATE_H__
> +#define __SBI_DOMAIN_MPXY_STATE_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +struct sbi_domain;
> +struct mpxy_state;
> +
> +/**
> + * Get per-domain MPXY state pointer for a given domain and HART index
> + * @param dom pointer to domain
> + * @param hartindex the HART index
> + *
> + * @return per-domain MPXY state pointer for given HART index
> + */
> +struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain *dom,
> +                                            u32 hartindex);
> +
> +/**
> + * Set per-domain MPXY state pointer for a given domain and HART index
> + * @param dom pointer to domain
> + * @param hartindex the HART index
> + * @param ms pointer to MPXY state
> + */
> +void sbi_domain_set_mpxy_state(struct sbi_domain *dom, u32 hartindex,
> +                              struct mpxy_state *ms);
> +
> +/** Macro to obtain the current hart's MPXY state pointer */
> +#define sbi_domain_mpxy_state_thishart_ptr()                   \
> +       sbi_domain_get_mpxy_state(sbi_domain_thishart_ptr(),    \
> +                                 current_hartindex())
> +
> +/**
> + * Initialize domain MPXY state support
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_domain_mpxy_state_init(void);
> +
> +/* Deinitialize domain MPXY state support */
> +void sbi_domain_mpxy_state_deinit(void);
> +
> +#endif
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 9cb2842..a728e9b 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -69,6 +69,7 @@ libsbi-objs-y += sbi_bitops.o
>  libsbi-objs-y += sbi_console.o
>  libsbi-objs-y += sbi_domain_context.o
>  libsbi-objs-y += sbi_domain_data.o
> +libsbi-objs-y += sbi_domain_mpxy_state.o
>  libsbi-objs-y += sbi_domain.o
>  libsbi-objs-y += sbi_double_trap.o
>  libsbi-objs-y += sbi_emulate_csr.o
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index 51c82a7..bd5d0ef 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -800,11 +800,16 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
>         if (rc)
>                 goto fail_free_domain_hart_ptr_offset;
>
> +       /* Initialize domain MPXY state support */
> +       rc = sbi_domain_mpxy_state_init();
> +       if (rc)
> +               goto fail_deinit_context;
> +
>         root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
>         if (!root_memregs) {
>                 sbi_printf("%s: no memory for root regions\n", __func__);
>                 rc = SBI_ENOMEM;
> -               goto fail_deinit_context;
> +               goto fail_deinit_mpxy_state;
>         }
>         root.regions = root_memregs;
>
> @@ -869,6 +874,8 @@ fail_free_root_hmask:
>         sbi_free(root_hmask);
>  fail_free_root_memregs:
>         sbi_free(root_memregs);
> +fail_deinit_mpxy_state:
> +       sbi_domain_mpxy_state_deinit();
>  fail_deinit_context:
>         sbi_domain_context_deinit();
>  fail_free_domain_hart_ptr_offset:
> diff --git a/lib/sbi/sbi_domain_mpxy_state.c b/lib/sbi/sbi_domain_mpxy_state.c
> new file mode 100644
> index 0000000..45f63a9
> --- /dev/null
> +++ b/lib/sbi/sbi_domain_mpxy_state.c
> @@ -0,0 +1,47 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Intel Corporation.
> + * Copyright (c) 2024-2025 Andes Technology Corporation.
> + */
> +
> +#include <sbi/sbi_domain.h>
> +
> +struct domain_mpxy_state_priv {
> +       /** MPXY state for possible HARTs indexed by hartindex */
> +       struct mpxy_state *hartindex_to_mpxy_state_table[SBI_HARTMASK_MAX_BITS];
> +};
> +
> +static struct sbi_domain_data dmspriv = {
> +       .data_size = sizeof(struct domain_mpxy_state_priv),
> +};
> +
> +struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain *dom,
> +                                            u32 hartindex)
> +{
> +       struct domain_mpxy_state_priv *dmsp =
> +               sbi_domain_data_ptr(dom, &dmspriv);
> +
> +       return (dmsp && hartindex < SBI_HARTMASK_MAX_BITS) ?
> +               dmsp->hartindex_to_mpxy_state_table[hartindex] : NULL;
> +}
> +
> +void sbi_domain_set_mpxy_state(struct sbi_domain *dom, u32 hartindex,
> +                              struct mpxy_state *ms)
> +{
> +       struct domain_mpxy_state_priv *dmsp =
> +               sbi_domain_data_ptr(dom, &dmspriv);
> +
> +       if (dmsp && hartindex < SBI_HARTMASK_MAX_BITS)
> +               dmsp->hartindex_to_mpxy_state_table[hartindex] = ms;
> +}
> +
> +int sbi_domain_mpxy_state_init(void)
> +{
> +       return sbi_domain_register_data(&dmspriv);
> +}
> +
> +void sbi_domain_mpxy_state_deinit(void)
> +{
> +       sbi_domain_unregister_data(&dmspriv);
> +}
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

