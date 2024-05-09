From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Thu, 9 May 2024 16:11:38 +0530
Subject: [PATCH] lib: sbi: Put event after use in sbi_sse_exit() loop
In-Reply-To: <20240509071228.1401289-1-apatel@ventanamicro.com>
References: <20240509071228.1401289-1-apatel@ventanamicro.com>
Message-ID: <5697a19f-089d-4bbe-b93f-cea00c24f287@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 09/05/24 12:42, Anup Patel wrote:
> Currently, the sbi_sse_exit() gets event in a loop but does not put
> it back after use. This results in global events remaining locked
> causing hangs on sub-sequent calls to sse_event_get() for global
> events.
> 
> Fixes: c8cdf01d8f3a ("lib: sbi: Add support for Supervisor Software Events extension")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   lib/sbi/sbi_sse.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index 18dfdb6..0cd6ba6 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -1121,13 +1121,18 @@ void sbi_sse_exit(struct sbi_scratch *scratch)
>   
>   	for (i = 0; i < EVENT_COUNT; i++) {
>   		e = sse_event_get(supported_events[i]);
> -
> -		if (!e || e->attrs.hartid != current_hartid())
> +		if (!e)
>   			continue;
>   
> +		if (e->attrs.hartid != current_hartid())
> +			goto skip;
> +
>   		if (sse_event_state(e) > SBI_SSE_STATE_REGISTERED) {
>   			sbi_printf("Event %d in invalid state at exit", i);
>   			sse_event_set_state(e, SBI_SSE_STATE_UNUSED);
>   		}
> +
> +skip:
> +		sse_event_put(e);
>   	}
>   }

LGTM.

Reviewed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Regards
Himanshu

