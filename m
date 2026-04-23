Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D656FAD41B
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SvZqmrWVDrqK2RaTVecJxvOeeOmE7JscBsFRgbgRHY=; b=yca+7oLeK4Q8iB
	1AwvSim4H1PP/q9ekSmGPaXLxFJpCu6vrY2XChTyP1aR1a8ixNVlrWLOGyF9QcCmC3W5+qr+AklFc
	bwx3YUbNmOF52krrr0IatKykpVQYOnA7yISjn85ywP2Y2bu80HTjMWX+1+fe2LflH7NNiFIamC4dm
	YDMWe4jgTb71+Juk3Fzyro7Zm/JZpmmWCpQOvHsDaj/gOsJPHThmY3Bps50Qhh47VErYbRxG4e3o6
	HTExEqTxcJqpMyzkOtwDE9XxO8/twK44AvMdHM8lTOUi/4S2FoqK/c+4sJgtX4uBOTQsNmkd22XgK
	ztNQyr2fuGt+gg3lKQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnyY-0000000B7i2-3VQL;
	Thu, 23 Apr 2026 06:55:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnyW-0000000B7hY-2qo0
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 06:55:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-824c9da9928so3199351b3a.3
        for <opensbi@lists.infradead.org>; Wed, 22 Apr 2026 23:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927348; x=1777532148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEutVVijvLfOI1vbHJ2tZq/v3N+NJ8MU4G0o3FeH9hg=;
        b=e9fx7kVlx7S+MGvER2yhOLMho0P/vU2XFeDD8lnXu6cZXFwxx8EgrNz8mWWRkZCxtP
         HjRGsI/9QvYZL7BYE4zRFS12/89TDmxUV/mogXvlbgYQ8We402k1cHQnPCf5N73NE5v6
         AzQtH28LzWzOAe1QEt5SWVV+nOcqz1+7rBpkrNYy6rXAOAOP4HRXmz1rDO/rLhGqIZCc
         5Ww4VjCsSVTcdTHXATCwO8rBeC3EebWOOWR6Luewnyn6mTG0QyWYyuv3lcCAKLzIm5xm
         CyaacsokvcJqYyTIrGo7llRi/qxtOVIEgQP352rgt/KI3SX9tSdU+bA32ZCGXO8UDj1x
         ZFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927348; x=1777532148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEutVVijvLfOI1vbHJ2tZq/v3N+NJ8MU4G0o3FeH9hg=;
        b=A2KdStCL2Jrmj4hgLHFVPLlywswU4F+q+vp2cp7ElNLRyyaATFsZbqeER3RfvBkkPC
         SwxwgSPoQOpb3ObYdqoO2OirhhyPEQT3BGvHrs7J2EL0YFY03/bf8xfxT/vR2iUQMH6V
         /+pu/3PaK3WY4hrPwf/wfLn2nzwJAx9fASYuG4YZMDmHFS4gJQWJAev78ZjIgvJ9maX9
         Cs5yR+dI1kF0NjbMTJqsYAopYsz8ucqmMSh2YFIoRgjdB8MT3zjPYw1xjDJkCyJ+1MsU
         2ISEfyFiJaYESqkMBlkZArpKV9HjvJOw9wRf3ZHbf/cMRFJyEZHdbtWp5SsjRF8fnP4x
         kaKw==
X-Forwarded-Encrypted: i=1; AFNElJ//R1bsYJtdNDPKSIT5bKAqqYxUSVBh12ldAPxUgD1tGWSLOovb0rMBg/Ucw2GR57fCFKuGMrVz@lists.infradead.org
X-Gm-Message-State: AOJu0YyrlHkxlfRTWPzk2f6qmYrYqo8HcvLUdgkrSgBD8u/EfhaY+dih
	1rn2LI6GvBH72vP8ZN3wmd89i6Usj9XhugvMVoCQQQR++zPZo2bSPznM
X-Gm-Gg: AeBDieu9CfUc6zQDTwXqHJQ8KwlRQrwhxR+95qAEosH/bRlzerUlrNFetYCxT5Um0s+
	YLSkwcNrWJv/koRETCMW1F9QNKTUGP9/OPakqkC/lvSYt3n6EdgzvooP4j5EbqbgrHKs9FtEng3
	+uG85lhluj7Ojvff/dnPuQriZxyhJCmCYD79t8uzntgKTJR1/HfYpnkiZHhcLpugos+9KNmWUip
	RvGjBP5MipzRYPWN7dLg2xX6XiPVOG0YHKwm/RzDW46EJR8SVpbmQwMQkEJFbYfjEmk6EtiiwMU
	jr1B6IVGJvXrWbrv9sIBxspohprD3abzoRRf1OSJ/JQUR7x4Z9U3sGX4FzHbH6xnaFWZI/K8AHT
	xHm971phJmvKslj55It1ys8LvVOkJg8u6eh7ODu/YbQBJhUOtxWcGXb+92QsaMBNaJQvPvRZtwO
	jL8YwKcIp6ZHXAQE0fC3rw9vQ/EWhpHrZCt/nJ5TEQskGbBw==
X-Received: by 2002:a05:6a00:c8f:b0:82c:26a4:df02 with SMTP id d2e1a72fcca58-82f8c9bad60mr28262149b3a.42.1776927347793;
        Wed, 22 Apr 2026 23:55:47 -0700 (PDT)
Received: from localhost ([203.38.38.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea09914sm18845838b3a.26.2026.04.22.23.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:55:47 -0700 (PDT)
Date: Thu, 23 Apr 2026 16:55:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH 2/3] lib: sbi_timer: Introduce per-HART timer state
Message-ID: <aenCUVNpjI_JJl9_@lima-default>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
 <20260415110002.2610929-3-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415110002.2610929-3-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_235548_719144_836B73C5 
X-CRM114-Status: GOOD (  17.94  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

On Wed, Apr 15, 2026 at 04:30:01PM +0530, Anup Patel wrote:
> Currently, only time_delta is per-HART so introduce per-HART timer
> state for having more per-HART timer information.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  lib/sbi/sbi_timer.c | 44 +++++++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> index 4088a597..9806c033 100644
> --- a/lib/sbi/sbi_timer.c
> +++ b/lib/sbi/sbi_timer.c
> @@ -18,7 +18,11 @@
>  #include <sbi/sbi_scratch.h>
>  #include <sbi/sbi_timer.h>
>  
> -static unsigned long time_delta_off;
> +struct timer_state {
> +	u64 time_delta;
> +};
> +
> +static unsigned long timer_state_off;
>  static u64 (*get_time_val)(void);
>  static const struct sbi_timer_device *timer_dev = NULL;
>  
> @@ -98,35 +102,37 @@ u64 sbi_timer_value(void)
>  
>  u64 sbi_timer_virt_value(void)
>  {
> -	u64 *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
> -						 time_delta_off);
> +	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
>  
> -	return sbi_timer_value() + *time_delta;
> +	return sbi_timer_value() + tstate->time_delta;
>  }
>  
>  u64 sbi_timer_get_delta(void)
>  {
> -	u64 *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
> -						 time_delta_off);
> +	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
>  
> -	return *time_delta;
> +	return tstate->time_delta;
>  }
>  
>  void sbi_timer_set_delta(ulong delta)
>  {
> -	ulong *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
> -						   time_delta_off);
> +	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
>  
> -	*time_delta = delta;
> +#if __riscv_xlen == 32
> +	tstate->time_delta &= ~0xffffffffUL;
> +	tstate->time_delta |= (u32)delta;
> +#else
> +	tstate->time_delta = delta;
> +#endif
>  }
>  
>  #if __riscv_xlen == 32
>  void sbi_timer_set_delta_upper(ulong delta_upper)
>  {
> -	ulong *time_delta = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
> -						   time_delta_off);
> +	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
>  
> -	*(time_delta + 1) = delta_upper;
> +	tstate->time_delta &= 0xffffffffUL;
> +	tstate->time_delta |= (u64)delta << 32;
>  }
>  #endif
>  
> @@ -176,13 +182,13 @@ void sbi_timer_set_device(const struct sbi_timer_device *dev)
>  
>  int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
>  {
> -	u64 *time_delta;
>  	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> +	struct timer_state *tstate;
>  	int ret;
>  
>  	if (cold_boot) {
> -		time_delta_off = sbi_scratch_alloc_offset(sizeof(*time_delta));
> -		if (!time_delta_off)
> +		timer_state_off = sbi_scratch_alloc_offset(sizeof(*tstate));
> +		if (!timer_state_off)
>  			return SBI_ENOMEM;
>  
>  		if (sbi_hart_has_csr(scratch, SBI_HART_CSR_TIME))
> @@ -192,12 +198,12 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
>  		if (ret)
>  			return ret;
>  	} else {
> -		if (!time_delta_off)
> +		if (!timer_state_off)
>  			return SBI_ENOMEM;
>  	}
>  
> -	time_delta = sbi_scratch_offset_ptr(scratch, time_delta_off);
> -	*time_delta = 0;
> +	tstate = sbi_scratch_offset_ptr(scratch, timer_state_off);
> +	tstate->time_delta = 0;
>  
>  	if (timer_dev && timer_dev->warm_init) {
>  		ret = timer_dev->warm_init();
> -- 
> 2.43.0
> 
> 
> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
