From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 24 Mar 2025 18:01:39 +0100
Subject: [PATCH 3/6] lib: sbi: sse: Return SBI_EDENIED for read only
 parameters.
In-Reply-To: <20250317105426.631243-4-cleger@rivosinc.com>
References: <20250317105426.631243-1-cleger@rivosinc.com>
 <20250317105426.631243-4-cleger@rivosinc.com>
Message-ID: <20250324-38c2a7772fb7bbe8a15e2d6a@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025 at 11:54:21AM +0100, Cl?ment L?ger wrote:
> The SSE specification did specified that read only parameters should
> return SBI_EBADRANGE but was modified recently to return SBI_EDENIED.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/sbi/sbi_sse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index a30fad54..ac714b8a 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -388,7 +388,7 @@ static int sse_event_set_hart_id_check(struct sbi_sse_event *e,
>  	struct sbi_domain *hd = sbi_domain_thishart_ptr();
>  
>  	if (!sse_event_is_global(e))
> -		return SBI_EBAD_RANGE;
> +		return SBI_EDENIED;
>  
>  	if (!sbi_domain_is_assigned_hart(hd, sbi_hartid_to_hartindex(hartid)))
>  		return SBI_EINVAL;
> @@ -444,7 +444,7 @@ static int sse_event_set_attr_check(struct sbi_sse_event *e, uint32_t attr_id,
>  
>  		return SBI_OK;
>  	default:
> -		return SBI_EBAD_RANGE;
> +		return SBI_EDENIED;

This confused me at first. Maybe a comment pointing out that
sbi_sse_attr_check() already confirmed we're in range and
this switch default just catches read-only attributes would
be helpful.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

>  	}
>  }
>  
> -- 
> 2.47.2
> 

