From: Samuel Holland <samuel.holland@sifive.com>
Date: Tue, 10 Dec 2024 12:45:34 -0600
Subject: [PATCH v2 3/4] lib: sbi: sse: add a is_supported_cb() callback
In-Reply-To: <20241210170553.1034872-4-cleger@rivosinc.com>
References: <20241210170553.1034872-1-cleger@rivosinc.com>
 <20241210170553.1034872-4-cleger@rivosinc.com>
Message-ID: <0754e304-2f4d-4370-b70b-f15210934a6c@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Cl?ment,

On 2024-12-10 11:05 AM, Cl?ment L?ger wrote:
> This callback will be used to expose the availability of events based on
> the presence of the dependencies (PMU Overflow IRQ for the PMU Overflow
> SSE event for instance). Drivers that want to handle an SSE event will
> need to register callbacks for the SSE event with at least the
> is_supported_cb() callback implemented. Now that this callback is
> implemented, set all non software events as not supported by default.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  include/sbi/sbi_sse.h |  5 +++++
>  lib/sbi/sbi_sse.c     | 11 +++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi/sbi_sse.h b/include/sbi/sbi_sse.h
> index 7419698a..1eab4f8b 100644
> --- a/include/sbi/sbi_sse.h
> +++ b/include/sbi/sbi_sse.h
> @@ -52,6 +52,11 @@ struct sbi_sse_cb_ops {
>  	 * Called when the SBI_EXT_SSE_DISABLE is invoked on the event.
>  	 */
>  	void (*disable_cb)(uint32_t event_id);
> +
> +	/**
> +	 * Called at init to check if an event is supported.
> +	 */
> +	bool (*is_supported_cb)(uint32_t event_id);
>  };
>  
>  /* Set the callback operations for an event
> diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
> index 4c186a22..31002a7d 100644
> --- a/lib/sbi/sbi_sse.c
> +++ b/lib/sbi/sbi_sse.c
> @@ -46,10 +46,10 @@ struct sse_event_info {
>  };
>  
>  static struct sse_event_info valid_events[] = {
> -	{.event_id = SBI_SSE_EVENT_LOCAL_RAS, .supported = true},
> -	{.event_id = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, .supported = true},
> -	{.event_id = SBI_SSE_EVENT_GLOBAL_RAS, .supported = true},
> -	{.event_id = SBI_SSE_EVENT_LOCAL_PMU, .supported = true},
> +	{.event_id = SBI_SSE_EVENT_LOCAL_RAS, .supported = false},
> +	{.event_id = SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, .supported = false},
> +	{.event_id = SBI_SSE_EVENT_GLOBAL_RAS, .supported = false},
> +	{.event_id = SBI_SSE_EVENT_LOCAL_PMU, .supported = false},

This change breaks bisectability, because the PMU callback isn't added until the
next commit. So I would suggest moving this hunk to a separate final commit. The
commit looks good otherwise.

Regards,
Samuel

>  	{.event_id = SBI_SSE_EVENT_LOCAL_SOFTWARE, .supported = true},
>  	{.event_id = SBI_SSE_EVENT_GLOBAL_SOFTWARE, .supported = true},
>  };
> @@ -1106,6 +1106,9 @@ static void sse_event_info_init(void)
>  
>  	for (i = 0; i < EVENT_COUNT; i++) {
>  		info = &valid_events[i];
> +		if (info->cb_ops && info->cb_ops->is_supported_cb)
> +			info->supported = info->cb_ops->is_supported_cb(info->event_id);
> +
>  		if (!info->supported)
>  			continue;
>  


