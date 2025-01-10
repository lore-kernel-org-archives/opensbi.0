From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 10 Jan 2025 00:57:30 +0000
Subject: [PATCH] Work with hartid equal to or greater than
 SBI_HARTMASK_MAX_BITS.
In-Reply-To: <20250109230853.2440-1-cfu@mips.com>
References: <20250109230853.2440-1-cfu@mips.com>
Message-ID: <835E687C-AF11-4AA7-844D-67280CDB4AC0@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Jan 2025, at 23:08, Chao-ying Fu <icebergfu@gmail.com> wrote:
> 
> Some platforms use hartid that is equal to greater than SBI_HARTMASK_MAX_BITS,
> so we should remove the check.

The checks aren?t there for fun, they?re required. From sbi_hartmask.h:

> /**
>  * Maximum number of bits in a hartmask
>  *
>  * The hartmask is indexed using physical HART id so this define
>  * also represents the maximum number of HART ids generic OpenSBI
>  * can handle.
>  */

OpenSBI does not support hart IDs outside this range today, so there is
real work to do if that?s needed, not just deleting checks. Otherwise
you?re going to end up with out-of-bounds memory accesses.

I?m concerned that none of the patches you?ve sent just now seem to
have been thought through properly. Whilst I?m sure you have the best
intentions, I also note that this kind of patch is precisely the kind
of patch one might make were one to want to insert vulnerabilities into
core system components.

Jess

> ---
> lib/utils/fdt/fdt_domain.c  | 3 ---
> lib/utils/fdt/fdt_helper.c  | 9 ---------
> platform/generic/platform.c | 3 ---
> 3 files changed, 15 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 4bc7ed8..6bc63c2 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -471,9 +471,6 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
> if (err)
> continue;
> 
> - if (SBI_HARTMASK_MAX_BITS <= val32)
> - continue;
> -
> if (!fdt_node_is_enabled(fdt, cpu_offset))
> continue;
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..aec08fa 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -1032,9 +1032,6 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
> if (rc)
> continue;
> 
> - if (SBI_HARTMASK_MAX_BITS <= hartid)
> - continue;
> -
> if (match_hwirq == hwirq) {
> if (hartid < first_hartid)
> first_hartid = hartid;
> @@ -1097,9 +1094,6 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
> if (rc)
> continue;
> 
> - if (SBI_HARTMASK_MAX_BITS <= hartid)
> - continue;
> -
> if (hwirq == IRQ_M_TIMER)
> hcount++;
> }
> @@ -1153,9 +1147,6 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
> if (rc)
> continue;
> 
> - if (SBI_HARTMASK_MAX_BITS <= hartid)
> - continue;
> -
> if (hwirq == IRQ_M_SOFT)
> hcount++;
> }
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index c03ed88..331ff8e 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -200,9 +200,6 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> if (rc)
> continue;
> 
> - if (SBI_HARTMASK_MAX_BITS <= hartid)
> - continue;
> -
> if (!fdt_node_is_enabled(fdt, cpu_offset))
> continue;
> 
> -- 
> 2.47.1
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


