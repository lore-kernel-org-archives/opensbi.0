Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AC2FAD41F
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCwc5uXU4GgCzGU8wapgbQPCqF8wNXkDeMZlkr4Eedg=; b=olxaiqNWggFidU
	Ywzfy/gYQX7vwSEuVnH071TnpkwdE6UNzCCOzgi7JlDmAsFkX9QWM9ArWMfE/FJz1sgHFeEmyc3sS
	yjK56UM8IG2gng1kuZNNY1e4QzTVB5BgkDr+XWOYvcjR3AZrD4qgzv+70SD+T2giA+SyJ56cW7kUC
	SBDxVDg+FN5Bcn36MOWQS+95RIPNKNuP+3BH4GNpOPTdHFPRucvFkB6cNd5hyMT7Kcy/2GUD13ANP
	qdfCeI1Abe/PtTcVs0BqRIgaxuOlllInpwLrZIuxzjHQEPHJvxesjzq/FPyzS7qjzW9/ZxQcWi/q7
	vehEmKKX4c3Ez+GnMtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnxa-0000000B7cD-1080;
	Thu, 23 Apr 2026 06:54:50 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnxX-0000000B7bq-3Brf
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 06:54:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-356337f058aso4037683a91.2
        for <opensbi@lists.infradead.org>; Wed, 22 Apr 2026 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927287; x=1777532087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xt0A84XMzhK8I5Vzz0S34iBfGWdhMVO2wc77GyoLPBc=;
        b=WwvxGM1gNUnDUIVHetEGXNBpNn7RM3lc+q4D78SNV/2iH6PYkf34Itir2cYwz0m4yI
         RR4enAEY8E2gHD7ueSHhv0yeeG1xqiaid4OsRUsJd9BqlYcmugyHfb43Oe/xMoRDr+JC
         oNbj31ysubH6TwalpQYOOiap1Je3xtzxBUd4kUvcWV2XiCBcrqm4g/WhvL/JUJWui5sI
         hIKDiN+WS3/rzHYy0iq+Z+kPJJx1+bKsW0Wrp7gPKunN0hk7wLaPmdepN4LjKtE4pq2N
         DbdUXghF/H1M+e45ljdkHZFQq8xf5l973RAmYw0/kKGt9HzFoEuC5GAkcvbBlIW5Fk8r
         FdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927287; x=1777532087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xt0A84XMzhK8I5Vzz0S34iBfGWdhMVO2wc77GyoLPBc=;
        b=UYZz+NN4m3gYMBwMei9f/ypheuYUOLvnROTZoIYsq9qjJRp8nEwBSTIVcfOicL46jT
         moQFnepXWZUQ/eStOd+nVBlIwAPw8toBFIxSEVQMJTNhS1WOfkFgAorYlPc2ykM0XtYY
         vGqzZL0I+8pa0WKTZTdVXlxEIbiWdgAcH4odX1Fp41/FKWzA5KMoPmcRs7WDgVWLtQLF
         uKlGtUvDMz/JC7ldYHbzN9n8db9RJaDBoG4/HXE7VGHhsPoCOiMTQ57T/3lht5p5btPH
         qLAuyOcNjm8YRhVVEbC7AsVOPzB/On71TbiZoDvwqEUZSzYB25zmbm05CSobnsjNj6Fw
         vxDA==
X-Forwarded-Encrypted: i=1; AFNElJ8wa4HSjYTF2nIOPUlSXgido4E8wqPyFgMEmNEmyB9+eZngI8qFbFzkr8xtidTj+kOM6+bMDFwM@lists.infradead.org
X-Gm-Message-State: AOJu0YySRdrxX2M3N6m8F3phtZ3C/ONuhmXwgSiGr2uUXAhOLFjkwu/z
	zVbuuJfTfaECDNO0wWczqMscFs3nyiUhE7ETvPNksuXz3e85B5rmAOe7
X-Gm-Gg: AeBDietiCEmTnORfmwMa3MLgaGxKK3jm3XWjYIROxCBTgslcg80q5cY+z2fNdkxwBLf
	uwO2l2aS6vjbczZhd3Vh/qKn9CYN2gyB5XnSH1F4koUbwm7G2uak1pCYWH8t9FvPgHPl8tynPz/
	+Wh1Hn5tpMo/GGUsRyKfnn7l1VQNPu0BZcKgYWPq3ocHpwNEKkwIXzjIBaLpqatRe61tRIiffkD
	aiBdwge/aa6ku44fObi/sCo5yWGPIlM356l2BFhDGJIRCH3AFI/9KROUSjsl9cHK7HfwlOeMjBk
	h3xoH3AsOETLuLa7j20QqdWlDqUhUhodOQoGzmRQnijSJmLCmWbtDrqLWaozyCDp+AdwHIXxCqe
	BZlfoyWJ10RMo28lYohcbLYfHTmb2efYcInJttjDhz+QKsOtzyI3xMF1feF4Z2sJktaR/fjrZA1
	COKdHrR7q3Xmt6Sk4UZrw3NVJT14jyVybgbpU=
X-Received: by 2002:a17:90a:dfd0:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36140402361mr25893849a91.10.1776927286554;
        Wed, 22 Apr 2026 23:54:46 -0700 (PDT)
Received: from localhost ([203.38.38.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140ff2e1esm18344282a91.8.2026.04.22.23.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:54:45 -0700 (PDT)
Date: Thu, 23 Apr 2026 16:54:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH 3/3] lib: sbi_timer: Add support for timer events
Message-ID: <aemm95GM7bZOpgxO@lima-default>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
 <20260415110002.2610929-4-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415110002.2610929-4-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_235447_817565_6065C96E 
X-CRM114-Status: GOOD (  34.91  )
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

On Wed, Apr 15, 2026 at 04:30:02PM +0530, Anup Patel wrote:
> Currently, the sbi_timer only supports timer events configured via
> SBI calls. Introduce struct sbi_timer_event and related functions
> to allow configuring timer events from any part of OpenSBI.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  include/sbi/sbi_timer.h    |  43 ++++++++-
>  lib/sbi/sbi_ecall_legacy.c |   4 +-
>  lib/sbi/sbi_ecall_time.c   |   4 +-
>  lib/sbi/sbi_timer.c        | 177 +++++++++++++++++++++++++++++++++----
>  4 files changed, 205 insertions(+), 23 deletions(-)
> 
> diff --git a/include/sbi/sbi_timer.h b/include/sbi/sbi_timer.h
> index 2e1a7879..f23d72db 100644
> --- a/include/sbi/sbi_timer.h
> +++ b/include/sbi/sbi_timer.h
> @@ -10,7 +10,38 @@
>  #ifndef __SBI_TIMER_H__
>  #define __SBI_TIMER_H__
>  
> -#include <sbi/sbi_types.h>
> +#include <sbi/sbi_list.h>
> +
> +/** Timer event abstraction */
> +struct sbi_timer_event {
> +	/** List head for per-HART event list (Internal) */
> +	struct sbi_dlist head;
> +
> +	/** Hart on which the event is started / running (Internal) */
> +	int hart_index;
> +
> +	/** Time stamp when the event expires (Internal) */
> +	u64 time_stamp;
> +
> +	/** Event callback to be called upon expiry */
> +	void (*callback)(struct sbi_timer_event *ev);
> +
> +	/** Event cleanup to be called upon sbi_hart_exit() */
                                            ^ sbi_timer_exit()

Minor typo.

> +	void (*cleanup)(struct sbi_timer_event *ev);
> +
> +	/** Event specific private data */
> +	void *priv;
> +};
> +
> +#define SBI_INIT_TIMER_EVENT(__ptr, __callback, __cleanup, __priv)	\
> +do {									\
> +	SBI_INIT_LIST_HEAD(&(__ptr)->head);				\
> +	(__ptr)->hart_index = -1;					\
> +	(__ptr)->time_stamp = 0;					\
> +	(__ptr)->callback = (__callback); 				\
> +	(__ptr)->cleanup = (__cleanup); 				\
> +	(__ptr)->priv = (__priv); 					\
> +} while (0)
>  
>  /** Timer hardware device */
>  struct sbi_timer_device {
> @@ -86,8 +117,14 @@ void sbi_timer_set_delta(ulong delta);
>  void sbi_timer_set_delta_upper(ulong delta_upper);
>  #endif
>  
> -/** Start timer event for current HART */
> -void sbi_timer_event_start(u64 next_event);
> +/** Start timer event on current HART */
> +void sbi_timer_event_start(struct sbi_timer_event *ev, u64 next_event);
> +
> +/** Stop timer event on current HART */
> +void sbi_timer_event_stop(struct sbi_timer_event *ev);
> +
> +/** Start supervisor timer event on current HART */
> +void sbi_timer_smode_event_start(u64 next_event);
>  
>  /** Process timer event for current HART */
>  void sbi_timer_process(void);
> diff --git a/lib/sbi/sbi_ecall_legacy.c b/lib/sbi/sbi_ecall_legacy.c
> index 50a7660d..4501c4ad 100644
> --- a/lib/sbi/sbi_ecall_legacy.c
> +++ b/lib/sbi/sbi_ecall_legacy.c
> @@ -54,9 +54,9 @@ static int sbi_ecall_legacy_handler(unsigned long extid, unsigned long funcid,
>  	switch (extid) {
>  	case SBI_EXT_0_1_SET_TIMER:
>  #if __riscv_xlen == 32
> -		sbi_timer_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
> +		sbi_timer_smode_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
>  #else
> -		sbi_timer_event_start((u64)regs->a0);
> +		sbi_timer_smode_event_start((u64)regs->a0);
>  #endif
>  		break;
>  	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> diff --git a/lib/sbi/sbi_ecall_time.c b/lib/sbi/sbi_ecall_time.c
> index 6ea6f054..a0aa580d 100644
> --- a/lib/sbi/sbi_ecall_time.c
> +++ b/lib/sbi/sbi_ecall_time.c
> @@ -22,9 +22,9 @@ static int sbi_ecall_time_handler(unsigned long extid, unsigned long funcid,
>  
>  	if (funcid == SBI_EXT_TIME_SET_TIMER) {
>  #if __riscv_xlen == 32
> -		sbi_timer_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
> +		sbi_timer_smode_event_start((((u64)regs->a1 << 32) | (u64)regs->a0));
>  #else
> -		sbi_timer_event_start((u64)regs->a0);
> +		sbi_timer_smode_event_start((u64)regs->a0);
>  #endif
>  	} else
>  		ret = SBI_ENOTSUPP;
> diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
> index 9806c033..539157fa 100644
> --- a/lib/sbi/sbi_timer.c
> +++ b/lib/sbi/sbi_timer.c
> @@ -10,9 +10,11 @@
>  #include <sbi/riscv_asm.h>
>  #include <sbi/riscv_barrier.h>
>  #include <sbi/riscv_encoding.h>
> +#include <sbi/riscv_locks.h>
>  #include <sbi/sbi_console.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
> +#include <sbi/sbi_hartmask.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_scratch.h>
> @@ -20,6 +22,9 @@
>  
>  struct timer_state {
>  	u64 time_delta;
> +	spinlock_t event_list_lock;
> +	struct sbi_dlist event_list;
> +	struct sbi_timer_event smode_ev;
>  };
>  
>  static unsigned long timer_state_off;
> @@ -136,8 +141,119 @@ void sbi_timer_set_delta_upper(ulong delta_upper)
>  }
>  #endif
>  
> -void sbi_timer_event_start(u64 next_event)
> +static void __sbi_timer_update_device(struct timer_state *tstate)
>  {
> +	struct sbi_timer_event *ev;
> +
> +	if (!timer_dev)
> +		return;
> +
> +	if (sbi_list_empty(&tstate->event_list)) {
> +		if (timer_dev->timer_event_stop)
> +			timer_dev->timer_event_stop();
> +		csr_clear(CSR_MIE, MIP_MTIP);
> +	} else {
> +		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
> +		if (timer_dev->timer_event_start)
> +			timer_dev->timer_event_start(ev->time_stamp);
> +		csr_set(CSR_MIE, MIP_MTIP);
> +	}
> +}
> +
> +static void __sbi_timer_event_stop(struct sbi_timer_event *ev)
> +{
> +	if (ev->hart_index > -1) {
> +		sbi_list_del(&ev->head);
> +		ev->hart_index = -1;
> +	}
> +}
> +
> +void sbi_timer_event_start(struct sbi_timer_event *ev, u64 next_event)
> +{
> +	struct sbi_timer_event *tev, *next_ev = NULL;
> +	struct timer_state *tstate;
> +
> +	if (!ev)
> +		return;
> +
> +	/* Ensure that event is not on the per-HART event list */
> +	if (ev->hart_index > -1) {

It is a bit worrying to permit sbi_timer_event_start() if the timer is
already on a list. Is that necessary, or could you return an error in
this case?

I'm thinking problems like this -

HART0                         HART1
sbi_timer_event_start()       sbi_timer_process()

  if (hart_index > -1) {
                                __sbi_timer_event_stop(ev)
				if (ev->callback) {
				  spin_unlock();
    spin_lock();
    __sbi_timer_event_stop(ev)
    spin_unlock();
    				  callback_fn()
				    sbi_timer_event_start(); /* re-add periodic timer */

> +		tstate = sbi_scratch_offset_ptr(sbi_hartindex_to_scratch(ev->hart_index),
> +						timer_state_off);
> +		spin_lock(&tstate->event_list_lock);
> +		__sbi_timer_event_stop(ev);
> +		spin_unlock(&tstate->event_list_lock);
> +	}
> +
> +	tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
> +	spin_lock(&tstate->event_list_lock);
> +
> +	/* Find where to insert the event in per-HART event list */
> +	sbi_list_for_each_entry(tev, &tstate->event_list, head) {
> +		if (next_event < tev->time_stamp) {
> +			next_ev = tev;
> +			break;
> +		}
> +	}
> +
> +	/* Insert the event in per-HART event list */
> +	ev->hart_index = current_hartindex();
> +	ev->time_stamp = next_event;
> +	if (next_ev)
> +		sbi_list_add(&ev->head, &next_ev->head);
> +	else
> +		sbi_list_add_tail(&ev->head, &tstate->event_list);
> +
> +	__sbi_timer_update_device(tstate);
> +
> +	spin_unlock(&tstate->event_list_lock);
> +}
> +
> +void sbi_timer_event_stop(struct sbi_timer_event *ev)
> +{
> +	struct timer_state *tstate;
> +
> +	if (!ev)
> +		return;
> +
> +	/* Ensure that event is not on the per-HART event list */
> +	if (ev->hart_index > -1) {
> +		tstate = sbi_scratch_offset_ptr(sbi_hartindex_to_scratch(ev->hart_index),
> +						timer_state_off);
> +		spin_lock(&tstate->event_list_lock);
> +		__sbi_timer_event_stop(ev);
> +		spin_unlock(&tstate->event_list_lock);

Similar concern here, timer could be in the middle of running. Maybe it
is benign. I think it would be nice to make this a "sync" stop though,
so it can wait for potential running timers.

timer event could have a 'running' state which is updated inside the
lock, then sbi_timer_event_stop() (and sbi_timer_exit()) could wait for
it to clear.

> +	}
> +
> +	/* Re-program timer device on the current HART */
> +	tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
> +	spin_lock(&tstate->event_list_lock);
> +	__sbi_timer_update_device(tstate);
> +	spin_unlock(&tstate->event_list_lock);

This could be skipped if ev->hart_index != current_hartid()

> +}
> +
> +static void sbi_timer_smode_event_callback(struct sbi_timer_event *ev)
> +{
> +	/*
> +	 * If sstc extension is available, supervisor can receive the timer
> +	 * directly without M-mode come in between. This function should
> +	 * only invoked if M-mode programs the timer for its own purpose.
> +	 */
> +	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC))
> +		csr_set(CSR_MIP, MIP_STIP);
> +}
> +
> +static void sbi_timer_smode_event_cleanup(struct sbi_timer_event *ev)
> +{
> +	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC))
> +		csr_clear(CSR_MIP, MIP_STIP);
> +}
> +
> +void sbi_timer_smode_event_start(u64 next_event)
> +{
> +	struct timer_state *tstate = sbi_scratch_offset_ptr(sbi_scratch_thishart_ptr(),
> +							    timer_state_off);
> +
>  	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
>  
>  	/**
> @@ -146,23 +262,34 @@ void sbi_timer_event_start(u64 next_event)
>  	 */
>  	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC)) {
>  		csr_write64(CSR_STIMECMP, next_event);
> -	} else if (timer_dev && timer_dev->timer_event_start) {
> -		timer_dev->timer_event_start(next_event);
> +	} else {
>  		csr_clear(CSR_MIP, MIP_STIP);
> +		sbi_timer_event_start(&tstate->smode_ev, next_event);
>  	}
> -	csr_set(CSR_MIE, MIP_MTIP);
>  }
>  
>  void sbi_timer_process(void)
>  {
> -	csr_clear(CSR_MIE, MIP_MTIP);
> -	/*
> -	 * If sstc extension is available, supervisor can receive the timer
> -	 * directly without M-mode come in between. This function should
> -	 * only invoked if M-mode programs the timer for its own purpose.
> -	 */
> -	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC))
> -		csr_set(CSR_MIP, MIP_STIP);
> +	struct timer_state *tstate = sbi_scratch_thishart_offset_ptr(timer_state_off);
> +	struct sbi_timer_event *ev;
> +
> +	spin_lock(&tstate->event_list_lock);
> +
> +	while (!sbi_list_empty(&tstate->event_list)) {
> +		ev = sbi_list_first_entry(&tstate->event_list, struct sbi_timer_event, head);
> +		if (ev->time_stamp <= sbi_timer_value()) {

Since the list is sorted this could break if time_stamp >
sbi_timer_value()?

> +			__sbi_timer_event_stop(ev);
> +			if (ev->callback) {
> +				spin_unlock(&tstate->event_list_lock);
> +				ev->callback(ev);
> +				spin_lock(&tstate->event_list_lock);
> +			}
> +		}
> +	}
> +
> +	__sbi_timer_update_device(tstate);
> +
> +	spin_unlock(&tstate->event_list_lock);
>  }
>  
>  const struct sbi_timer_device *sbi_timer_get_device(void)

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
