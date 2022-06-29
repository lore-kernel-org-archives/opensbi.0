From: Xiang W <wxjstz@126.com>
Date: Wed, 29 Jun 2022 22:57:11 +0800
Subject: [RFC PATCH 1/1] lib: sbi_timer: Added a blocking wait function
 that waits until a certain condition is true or timeout occurs
In-Reply-To: <20220629134257.374341-2-adnan.chowdhury@sifive.com>
References: <20220629134257.374341-1-adnan.chowdhury@sifive.com>
	 <20220629134257.374341-2-adnan.chowdhury@sifive.com>
Message-ID: <c5251783fd9b0ff9039f1b1da56d9164e579590e.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-06-29???? 14:42 +0100?Adnan Rahman Chowdhury???
> Motivation: Suppose a peripheral needs to be configured to transmit data.
> There is an SFR bit which indicates that the peripheral is ready to transmit.
> The firmware should check the bit and will only transmit data when the
> peripheral is ready. When the firmware starts polling the SFR, the peripheral
> could be busy transmitting/receiving other data so the firmware must wait
> till that completes. Assuming that there is no other way, the
> firmware shouldn't wait indefinitely.
> 
> The function sbi_timer_waitms_until() will constantly check whether a certain
> condition is met, or timeout occurs. It can be used for the cases when a
> timeout is required.
> 
> Signed-off-by: Adnan Rahman Chowdhury <adnan.chowdhury@sifive.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?include/sbi/sbi_timer.h |? 3 +++
> ?lib/sbi/sbi_timer.c???? | 18 ++++++++++++++++++
> ?2 files changed, 21 insertions(+)
> 
> diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
> index 63ef1af..ea3dbdd 100644
> --- a/include/sbi/sbi_timer.h
> +++ b/include/sbi/sbi_timer.h
> @@ -48,6 +48,9 @@ static inline void sbi_timer_udelay(ulong usecs)
> ????????sbi_timer_delay_loop(usecs, 1000000, NULL, NULL);
> ?}
> ?
> +bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
> +?????????????????????????? uint64_t timeout_ms);
> +
> ?/** Get timer value for current HART */
> ?u64 sbi_timer_value(void);
> ?
> diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> index acdba92..d93036d 100644
> --- a/lib/sbi/sbi_timer.c
> +++ b/lib/sbi/sbi_timer.c
> @@ -81,6 +81,24 @@ void sbi_timer_delay_loop(ulong units, u64 unit_freq,
> ????????????????delay_fn(opaque);
> ?}
> ?
> +bool sbi_timer_waitms_until(bool(*predicate)(void*), void* arg,
> +?????????????????????????? uint64_t timeout_ms)
> +{
> +???????bool ret = true;
> +???????uint64_t start_time = sbi_timer_value();
> +???????uint64_t ticks =
> +???????????????(sbi_timer_get_device()->timer_freq / 1000) *
> +???????????????(timeout_ms);
> +???????do {
> +???????????????if (predicate(arg))
> +???????????????????????break;
> +???????????????if (sbi_timer_value() - start_time? >= ticks)
> +???????????????????????ret = false;
> +???????} while(ret);
> +
> +???????return ret;
> +}
> +
> ?u64 sbi_timer_value(void)
> ?{
> ????????if (get_time_val)
> -- 
> 2.30.2
> 
> 



