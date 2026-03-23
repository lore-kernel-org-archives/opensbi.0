Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF98ED58CD0
	for <opensbi@archiver.kernel.org>; Mon, 23 Mar 2026 04:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdsjjZneGRja+h1Ls/l8AQlAZV2n/ANBI38axJzC2Iw=; b=aONiFdXO/kKOHa
	UtnuYFntxFjbH5STQovvbXILcu7QbcIq26NB1NK8Se09FvDDrh9JaEX2AEJ3Bk5AEf3x+IbwWU4Wb
	VLVTUDV7F9C/vtF4BQ5K7kp46I9H6vyZ1ggUAUdgYBOrWKGl0TsN9BIbnwVWoenlqApDRjsIDGg88
	x95IHQndv/HG06ztAicJ8V+OP/nt2SQUe5MNNt74jRleDv3GFAjRfdUlOJ6QSfbI7OrsRs2mAgs9P
	vxJp/13JeNSJMSRwl+T15PwdaUzRG8zIPNA6Gg93DJZgg3n7HUxl+QyXBc99zD2YdT37y5v9p/9+6
	oVSX/2te06AHag8v33wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X7A-0000000G1v8-0stM;
	Mon, 23 Mar 2026 04:42:08 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X77-0000000G1tz-04BB
	for opensbi@lists.infradead.org;
	Mon, 23 Mar 2026 04:42:06 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7991db3dc98so41483657b3.0
        for <opensbi@lists.infradead.org>; Sun, 22 Mar 2026 21:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774240924; x=1774845724; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wlrjCAHiEZCOAJcIY5hceY2xYd5zs4eRd1ymemz2Vg=;
        b=He7jQYMXT8oTzG4N6BClTIjrqv7zsZQCTNMT/rz76/GF8GH715bzU+jke9Q9Q7TcRg
         FEWxbRap7IMihQWukKF9+4GBE+GS1N9ZX+M6EiWh+ESGoe+vVmyO+kpK4D8v+GUAjC3q
         ZiBjDngTM0PNgAbN3RAtf9LJLo/SUlkAzDHOuDIW7vCHVUPvGyLK2+JFIUReghhTZYdE
         BuxIQQHf13j7KEE9ndvLx/7wb0A01Hb6E8N9K7/cQDHoAu9VNbOon8hnLigrPEWhtWAC
         ugGbf91xYlPrxOzPxfFZGTuGl1mvBUFUZcDNZ4ZaZBpzV664foHozC+zqftdIdd5XSvY
         BwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240924; x=1774845724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wlrjCAHiEZCOAJcIY5hceY2xYd5zs4eRd1ymemz2Vg=;
        b=ONcnJNtUq5bGfTGlmlJZZ1jvmokm8n2tyqyJWjve3ali25O8xxrs5yCKMamSU1q/wX
         wO7rIUAxCXsFI/w6+5o213kI5e9JOE5gNP5IITGXlcufritFvIoHgo5wtFjY6t1Y/o0f
         nz4muAIDVoQILGNn4X64dFGMPBDYM5O9E2XmCN9hZ/ehK5QOc3XacW1f0h9ooyCuJNlI
         Da6gJdbtAr0ykb2BlMFES7prWxYlS54b5EE9iCWMQLRtk5ShoemvYzojacEz3C4wv18G
         Qrwvlg2AZrKHHY5be2ftVku1RIVVF7VBqGbYjKgAe+N3G48jsNnuQDZoxulsjaNzTCuo
         pKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYj7VNpf8OgWJRW43YsFrHIozCedpupR6VAxl5z7FS/TljLzIsR46vigFMqVyirDxdc8q35/Cs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvhok9i4RCy8lw/XlAZP3d8QHYD1xf+0PPYDRfiWMQSkxLpNk5
	BYJuhZ+h6FvCg2iSLdja1jiT5ifmWDSWzoUte+Uv46drjGV/6tlV8LaOsOSq7JmmJdA=
X-Gm-Gg: ATEYQzxcoIbtz2teZ63ZMCKNBkIGSsld8c00bVtAXRLpblvYJbanWe18MUz+A0SyUSS
	HofU9djg6z5q3S+30dIk55PIJgdLJn/Kie2y9QOCTyjr7WzQuGc+9oIlgnsJyHVEHQTGX6TDjYM
	11M5H1r+45WL3Og05rB1cPMc/TvW8JMq8XTETPjXqrwLpMlqEi3DwTxdU9c0BWq4/8YeZKTVf6Z
	XzD3Am7XJGu4ksbKVijl1y2v2x6mIig+O7ZRyM0+ouIEIPyWRle7/MepshTOy0qrIrFzSwSz7AP
	qg3tpblbOWuTxrTMiBXKdj8TuSrbifB4IvSQqTVLKkRxUGv+7tme63LRLc93Ui1QrE2C1VMRvuj
	mtcyMp4w/BbDfPJOiScLAOl+nXK3bjpAxZHaMlAhq5XguI8Gdu1QWw1Ab2HTYkAyTfl+9BIUpGs
	x35ZW/QiLiMLtAxM+o+ct8FMwe+w==
X-Received: by 2002:a05:690c:c4e8:b0:79a:440c:fbed with SMTP id 00721157ae682-79a90a92a80mr128292527b3.13.1774240923912;
        Sun, 22 Mar 2026 21:42:03 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.102.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a905bf186sm51884687b3.48.2026.03.22.21.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:42:03 -0700 (PDT)
Message-ID: <0ca5f219-ebf3-4a2a-b7f6-84a748278afd@sifive.com>
Date: Sun, 22 Mar 2026 23:42:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] lib: sbi: trap: Save/restore FP and vector state on
 trap entry/exit
To: dave.patel@riscstar.com, opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
References: <20260320143018.74191-1-dave.patel@riscstar.com>
 <20260320143018.74191-5-dave.patel@riscstar.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260320143018.74191-5-dave.patel@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_214205_095220_5746CB39 
X-CRM114-Status: GOOD (  20.33  )
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

Hi Dave,

On 2026-03-20 9:30 AM, dave.patel@riscstar.com wrote:
> From: Dave Patel <dave.patel@riscstar.com>
> 
> Add eager floating-point and vector context save/restore in the OpenSBI trap
> handler. The FP and vector state of the current hart is saved on trap entry
> and restored before returning from the trap.
> 
> This ensures that machine-mode trap handling does not clobber floating-point
> or vector state belonging to lower privilege software (e.g. supervisor mode),
> providing correct isolation across trap boundaries.
> 
> The implementation leverages sbi_fp_save/restore() and sbi_vector_save/restore()
> helpers and uses per-hart context pointers stored in sbi_scratch.
> 
> This follows an eager context switching model where the full FP and vector state
> is preserved unconditionally on every trap, avoiding the need for lazy
> enable/disable or trap-on-first-use mechanisms.
> 
> Notes:
> - Assumes FP and vector units are enabled when trap handling occurs
>   (mstatus.FS/VS != Off).
> - Context pointers (fp_ctx, vec_ctx) must be valid when used.
> - This may introduce additional trap latency due to full state save/restore.
> 
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---
>  lib/sbi/sbi_fp.c   |  2 +-
>  lib/sbi/sbi_trap.c | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_fp.c b/lib/sbi/sbi_fp.c
> index 4d5e0f68..24d97937 100644
> --- a/lib/sbi/sbi_fp.c
> +++ b/lib/sbi/sbi_fp.c
> @@ -72,7 +72,7 @@ void sbi_fp_save(struct sbi_fp_context *dst)
>  
>  void sbi_fp_restore(const struct sbi_fp_context *src)
>  {
> -    if (!src)
> +	if (!src)
>          return;
>  
>  	asm volatile(
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index f41db4d1..6a182216 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -24,6 +24,8 @@
>  #include <sbi/sbi_sse.h>
>  #include <sbi/sbi_timer.h>
>  #include <sbi/sbi_trap.h>
> +#include <sbi/sbi_fp.h>
> +#include <sbi/sbi_vector.h>
>  
>  static void sbi_trap_error_one(const struct sbi_trap_context *tcntx,
>  			       const char *prefix, u32 hartid, u32 depth)
> @@ -310,6 +312,14 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
>  	struct sbi_trap_regs *regs = &tcntx->regs;
>  	ulong mcause = tcntx->trap.cause;
>  
> +	/* save floating context */
> +	struct sbi_fp_context *fpctx = scratch->fp_ctx;
> +	sbi_fp_save(fpctx);
> +
> +	/* save vector context */
> +	struct sbi_vector_context *vecctx = scratch->vec_ctx;
> +	sbi_vector_save(vecctx);
> +
>  	/* Update trap context pointer */
>  	tcntx->prev_context = sbi_trap_get_context(scratch);
>  	sbi_trap_set_context(scratch, tcntx);
> @@ -373,5 +383,13 @@ trap_done:
>  		sbi_sse_process_pending_events(regs);
>  
>  	sbi_trap_set_context(scratch, tcntx->prev_context);
> +
> +
> +	/* restore floating context */
> +	sbi_fp_restore(fpctx);
> +
> +	/* restore vector context */
> +	sbi_vector_restore(vecctx);
> +

As referenced in patch 1, these calls should go inside
switch_to_next_domain_context(), not the top-level trap handling. In fact,
restoring the context here is broken because it will undo any changes to the
register file made by the misaligned access handlers.

Regards,
Samuel

>  	return tcntx;
>  }


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
