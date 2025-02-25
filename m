From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 25 Feb 2025 15:41:39 -0600
Subject: [PATCH v3] lib: utils: Make sure that hartid and the scratch are
 aligned
In-Reply-To: <20250225211614.858474-1-Raj.Vishwanathan@gmail.com>
References: <20250213195211.15587-1-Raj.Vishwanathan@gmail.com>
 <20250225211614.858474-1-Raj.Vishwanathan@gmail.com>
Message-ID: <283aea6a-1a13-42a6-b894-361dfc139a17@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2025-02-25 3:16 PM, Raj Vishwanathan wrote:
> Harts associated with an ACLINT_MSWI need not have sequential hartids.
> It is insufficient to use first_hartid and hart_count. To account for
> non-sequential hart ids, include the empty hart-ids' generate hart-count.
> 
> Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
> ---
> hart_count = last_hart_id - first_hart_id +1
> count = number of harts
> For sequential hart_id's, count = hart_count
> For non-sequential hart_id's, count  < hart_count
> ---
>  lib/utils/fdt/fdt_helper.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..ccf2d5f 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -986,7 +986,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
>  {
>  	const fdt32_t *val;
>  	int i, rc, count, cpu_offset, cpu_intc_offset;
> -	u32 phandle, hwirq, hartid, first_hartid, last_hartid, hart_count;
> +	u32 phandle, hwirq, hartid, first_hartid, last_hartid;
>  	u32 match_hwirq = (for_timer) ? IRQ_M_TIMER : IRQ_M_SOFT;
>  
>  	if (nodeoffset < 0 || !fdt ||
> @@ -1015,7 +1015,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
>  	count = count / sizeof(fdt32_t);
>  
>  	first_hartid = -1U;
> -	hart_count = last_hartid = 0;
> +	last_hartid = 0;
>  	for (i = 0; i < (count / 2); i++) {
>  		phandle = fdt32_to_cpu(val[2 * i]);
>  		hwirq = fdt32_to_cpu(val[(2 * i) + 1]);
> @@ -1040,16 +1040,13 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
>  				first_hartid = hartid;
>  			if (hartid > last_hartid)
>  				last_hartid = hartid;
> -			hart_count++;
>  		}
>  	}
>  
>  	if ((last_hartid >= first_hartid) && first_hartid != -1U) {
>  		*out_first_hartid = first_hartid;
> -		count = last_hartid - first_hartid + 1;
> -		*out_hart_count = (hart_count < count) ? hart_count : count;
> +		*out_hart_count  = last_hartid - first_hartid + 1;

You still have an extra space before the assignment here.

>  	}
> -

Unrelated change.

With those style issues fixed:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  	return 0;
>  }
>  


