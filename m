Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353DF10F9318
	for <opensbi@archiver.kernel.org>; Wed,  1 Apr 2026 02:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ue/A6+4aS4EjtF/p6exa8K3Fn5p+oSQGcHobH/KpEM=; b=laZS4inQOKV14D
	HyJqFr7L/8aGV9GeDKOuzqT+M7dSXUw7FVhdK0+Csvl6S9Rrpx2+rYtz7yorA96QQYhmz1Oxy32gI
	KLmgAn7EjmbAne6ZMsDMjo8QKguhRlMoAt684RsX8/Y6nf3zvksPOTZW0Mvz36KH9i+9xrwVhRABP
	+X78HoKymg5VzxSwDZ0RVOLfh7/VpnHv+ZO0e6n/0EQSKxbR0KudFl7Jp0f/voRZbxwhZykbuo3pH
	gGQOG5iVYmT6GobU/pmAF8Na/942Smi4MivSQ77RJHAp8k0HIKd2vA/c+YNtLO/3/30b/oOqhbIBy
	uOcllRgLaE3jsIakT9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7kzv-0000000Dohk-2Ro8;
	Wed, 01 Apr 2026 02:07:59 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7kzs-0000000DohP-3fia
	for opensbi@lists.infradead.org;
	Wed, 01 Apr 2026 02:07:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82c2239140aso2568836b3a.0
        for <opensbi@lists.infradead.org>; Tue, 31 Mar 2026 19:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775009275; x=1775614075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f+YwEzwvwhZey6e1u9NsQOg1DN087/Slr4e0MTzEeo=;
        b=d1k3jUJMCvYaQo3VTCuHVxckeczjS2N8RwQve2E3a4z/UaRIPIN0h6/51a9d+iGpQZ
         3Sm71qKz0uZiXDBEkejif+0ATHcYvc+tZcLBeJYc/GXc+QL60w+Mug279BE52ZiWghaX
         JxD1i07p+IfmkQe8LGhzMV4pppr8Y3zzPg8FkXy+cnTRVtcBzQqSMr8ZB1pC0QR8hfsp
         +JQiGUCSptw4pBi/fWKVbLZ9PHOvxrSTTDTqp0/qD9ZnE3GqS2S0mLPe9C1mzRNDWoTS
         5rMkHypxpoxc9arjcD+h9CzwxPOafv8Jh5a04dlNkreKRI4j6itZmENSbevv9IqgPmTL
         xYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775009275; x=1775614075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1f+YwEzwvwhZey6e1u9NsQOg1DN087/Slr4e0MTzEeo=;
        b=P0SJjBEB6KHzp35TPqfn9OVAf9RRpz01pYBi/ix3rzsRgEgdoYliZEvQs3hmzu6AtP
         uRHq0eHzsIdXmQjoMQDKFGbNB7CcTIt9nVvq3JLYG/EzO3XPTr7DjOoy30heVAUxowt0
         pswiQBRHTD98nH2zCoFf50uKTyQ4wh9qUXNI9gaSEWzUq3Acgqiwv4sBy+cUWJ20hhs5
         uAVPpiFW7vPzsD0bj0PsA70jX/KuZMfCxxcAocOSeWNho/Bnbdd61lOmR6jEr68SqbKa
         U+s9XJACkQwYMdZgDHCBWEl/bcWbLr+cQE97E/wZQGE98eJm6qEvVAZ8A77ipABM1JP3
         UYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPr1TcguFFz8diyU3jAOCQ0tbALmY6TDg5NGRiOGYZsTVsC90I4Kk1ouky8/ueLG0vpkgu1mmb@lists.infradead.org
X-Gm-Message-State: AOJu0YwQAqHYIAjqnFBI59n8hGxEr35sar76430tZ2dD01VUD5Kh4tdt
	El4dwP+RtGe31+G+jGULO/hmvGy7tDuprWa3WCnlWV5U5V+hDnT4dyrwODErDRmNBWYg66ro386
	5+WCRzWg=
X-Gm-Gg: ATEYQzzi9ND46KNj6HSyyW8OcGI5sv3Y9f/6m0gzsCWrtqlTQa///jdv8+EoN7fRHak
	tztLj/fxOUdoa39nBs1pmPJQeXp0AgoAnGsVlQkD/roJPq3SDZTvczGIYoWQWV6blrzZmoct0Xu
	tCd+wfM0Iex7HoW/6ylpJ3bRyEf7Bt2f1ukMLnM6k5BtDNZc3RIq3yiAB0mJMT0WDSKnSWst2qN
	EOBb1CCiW3LxXlO4rQPDXGsQ8SUYFv9qRkOOfako6T2CS80kDITJfsp5ciQHSa+SlZMx89VrUp0
	xozU0jqa0wxB4iMRdaw7XuytNV7juld+RCFuRDLbnepXayNghnOJk/vxdSoeGEbK20Ru06nmTRT
	0cG0tXdgH7Lz02hmk2t7nbRmmWSeamivmGoCbskhE6LDr+WwOlTYF3ZXvdOb5qZBlyQ+hmNV7/h
	Jcd9LblEIoQviNwc4kBGiBUhHDPHPkyAw=
X-Received: by 2002:a05:6a00:a0f:b0:829:7a15:9b96 with SMTP id d2e1a72fcca58-82ce8b48a65mr1728766b3a.54.1775009275509;
        Tue, 31 Mar 2026 19:07:55 -0700 (PDT)
Received: from [192.168.213.10] ([59.102.235.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca84646d3sm11178705b3a.15.2026.03.31.19.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 19:07:55 -0700 (PDT)
Message-ID: <2c87ff34-ea8a-48be-9b05-9f607700dc66@sifive.com>
Date: Wed, 1 Apr 2026 10:07:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: fw_base: make stack guard setup conditional on
 Zkr
To: buenocalvachejoel@gmail.com, opensbi@lists.infradead.org
Cc: anup@brainfault.org
References: <20260331095943.133791-1-buenocalvachejoel@gmail.com>
Content-Language: en-US
From: Yu-Chine Peter Lin <peter.lin@sifive.com>
In-Reply-To: <20260331095943.133791-1-buenocalvachejoel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_190756_954298_29D8E3F2 
X-CRM114-Status: GOOD (  14.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi Joel,

Thanks for the patch,

On 3/31/26 5:59 PM, buenocalvachejoel@gmail.com wrote:
> From: Joel Bueno <buenocalvachejoel@gmail.com>
> 
> Zkr isn't explicitly selected as a mandatory extension to run OpenSBI
> as per: docs/platform_requirements.md
> 
> Since this happens very early on the boot flow of OpenSBI where the
> dynamic extension checks haven't yet happened, we must guard the Zkr
> stack setup behind an ifdef block so that it only gets compiled for
> targets that do actually have the extension.
> 
> Signed-off-by: Joel Bueno <buenocalvachejoel@gmail.com>
> ---
>   firmware/fw_base.S | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index 63bb4473..9ea93907 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -107,6 +107,7 @@ _bss_zero:
>   	add	s4, s4, __SIZEOF_POINTER__
>   	blt	s4, s5, _bss_zero
>   
> +#if defined(__riscv_zkr)
>   	/* Trying to initialize the stack guard via the Zkr extension */
>   	lla	t0, __stack_chk_guard_done
>   	csrw	CSR_MTVEC, t0
> @@ -130,6 +131,7 @@ __stack_chk_guard_loop:
>   	j	__stack_chk_guard_done
>   	.align 3
>   __stack_chk_guard_done:
> +#endif

The current trap-based detection mechanism is intentional and works 
correctly
on systems both with and without Zkr.
Using #ifdef guards would break binary portability, e.g. using single 
binary on
heterogeneous systems (e.g., SMP with mixed Zkr/non-Zkr cores)

Regards,
Peter Lin

>   
>   	/* Setup temporary trap handler */
>   	lla	s4, _start_hang


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
