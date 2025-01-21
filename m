From: Xiang W <wxjstz@126.com>
Date: Tue, 21 Jan 2025 11:29:31 +0800
Subject: [PATCH v3] Work with hartid equal to or greater than
 SBI_HARTMASK_MAX_BITS
In-Reply-To: <20250121011234.717311-1-Raj.Vishwanathan@gmail.com>
References: <20250115234607.410148-1-Raj.Vishwanathan@gmail.com>
	 <20250121011234.717311-1-Raj.Vishwanathan@gmail.com>
Message-ID: <d2c3929bd5db0bc9a44047e7e3390d6ec5c1cc6e.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-01-20?? 17:12 -0800?Raj Vishwanathan???
> Some platforms use hartid that is equal to greater than SBI_HARTMASK_MAX_BITS,
> so we should remove the original check. Instead we check the hart index
> against SBI_HARTMASK_MAX_BITS.
> 
missing your Signed-off-by
> Update: Make hart_count > SBI_HARTMASK_MAX_BITS a catastrophic failure. The reviewer suggested continue, immediate failure quickly will
> localize the issue.
The previous line need move after '---'
> ---
> ?lib/utils/fdt/fdt_domain.c? | 2 +-
> ?lib/utils/fdt/fdt_helper.c? | 6 +++---
> ?platform/generic/platform.c | 4 ++--
> ?3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 4bc7ed8..7d10d10 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -471,7 +471,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
> ?		if (err)
> ?			continue;
> ?
> -		if (SBI_HARTMASK_MAX_BITS <= val32)
> +		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(val32))
> ?			continue;
> ?
> ?		if (!fdt_node_is_enabled(fdt, cpu_offset))
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..4673921 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -1032,7 +1032,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
> ?		if (rc)
> ?			continue;
> ?
> -		if (SBI_HARTMASK_MAX_BITS <= hartid)
> +		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
> ?			continue;
> ?
> ?		if (match_hwirq == hwirq) {
> @@ -1097,7 +1097,7 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
> ?		if (rc)
> ?			continue;
> ?
> -		if (SBI_HARTMASK_MAX_BITS <= hartid)
> +		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
> ?			continue;
> ?
> ?		if (hwirq == IRQ_M_TIMER)
> @@ -1153,7 +1153,7 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
> ?		if (rc)
> ?			continue;
> ?
> -		if (SBI_HARTMASK_MAX_BITS <= hartid)
> +		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
> ?			continue;
> ?
> ?		if (hwirq == IRQ_M_SOFT)
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index c03ed88..c8a7a59 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -200,8 +200,8 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> ?		if (rc)
> ?			continue;
> ?
> -		if (SBI_HARTMASK_MAX_BITS <= hartid)
> -			continue;
> +		if (SBI_HARTMASK_MAX_BITS <= hart_count)
> +			goto fail;
It can be ignored.

Regards,
Xiang W
> ?
> ?		if (!fdt_node_is_enabled(fdt, cpu_offset))
> ?			continue;
> -- 
> 2.43.0
> 
> 


