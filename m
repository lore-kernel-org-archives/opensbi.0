Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6B6CE7AA8
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvPwSbh0Dmd4rHLvABAmmoQpfiqnM32Ow8lidivsDQ4=; b=fB8Q6RBZX/jaea
	oIdYS9QdLs0q2Ti7IgQedgQMsTUGVcmQ6TZhUDd03CfQBuZXwZ8X2uTXtM7mlJ2PQ06cns1esfu3O
	lufdwh6SL1MrJoOzmkczgM7HGZUWFWB1mEl6OHlw08u6ZXDKXWafc7LzEUFvim564zw0DGtENYIzK
	D/y/1SMEErfHyuThZ5uVbfjVQ72ZYHo5mIAopmogs7vzjRIi+SKzooklPsjpLrfyriauY9WTRZd1T
	4+GAJc98T4amaLbm0RcbxdvOMFgzD7GgcZY9ilRFMqHSnBuMcPkCsZYUq5kQmvXBEwHW7p9Rc7KRW
	HPvqb3+2hEL4+pfTxP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrCH-0000000C2mB-2Zrw;
	Fri, 14 Nov 2025 10:38:29 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrCD-0000000C2lL-4AkS
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 10:38:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b72e7205953so28959266b.0
        for <opensbi@lists.infradead.org>; Fri, 14 Nov 2025 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763116701; x=1763721501; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08Ww5TRfSISLmiO4W6z2C0wPRnKpXyhAER6wzKM2yRc=;
        b=DhiI9Xl/S4plR27Xcso3ctSF/4XTR3f4yzZFS+g/XKkvA4RwSxx4TDm3e4pcO5ypFl
         KsEEDjYqWUsZEYrYdKdpkHjIHZCPCOuB9uPrvG5rEXZ9XygfQisQbVbrgN2LyLsCqGsJ
         8+y4W2UZJAw7yyLK5B/KWATdKN68w83DhvG9TSCdkn5cQ5vaxY5AaQ4ifm/sjwitGR+n
         is++Z24lnTcTcgM8yDULrb65WS1dScLSMniMocfu/dl63RkY9CL+tDjsq8ewiIecL9Yz
         X9ZLZit+dP9bnDiXbIr4dW38ac/NC6De3krEIHK5Wb4J3KwiG1SwNLJC4blNvTcp08Jm
         Qs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763116701; x=1763721501;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08Ww5TRfSISLmiO4W6z2C0wPRnKpXyhAER6wzKM2yRc=;
        b=Bag4myF20ArMhL/gmjF0qHgol4h44xncYVlrWMKmD0c3OpOArT3v7ghkV9+/Md+KOG
         91QebU+LxdpbepCUhbM3Qb5lKOYO0hQS/raCOWZ/DAJoVfq60kO93/bAShY+d5h9rvYT
         4pDSh9RBSngoDdx4AEDAnLEqaAQqdZOVijnDBcIIb1egX3FjiHPGpqBFaQROFPL8BG96
         Og7bS8t+lHhpB1TM/au9K2A6iEuCIuFf3quryJGCB74ajIr/MqGbD2gAZeVcLNgigRMG
         lQYpDBuA7yGXVyJbQ0RgSEJVL+XQYgtp0r7WZYhorj3X1U9fLQv7gVij8S5PfHKszBBX
         HD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3qY6jF8z39IqTQKq69NptS3NV2pbGgVTsk//tive7/LZMq6auMo1K2QatIrHR+rEFlkNuSfzK@lists.infradead.org
X-Gm-Message-State: AOJu0YynAVj7EI6qVqkugUXj/zrAYjvb3Af1TXlf5ielnnHtSTDG99Wc
	N40YcYfqBUJ7Zdj1/nL5OgFHJnmdb8RpnjNjur2yAA4yWVwcWBltTgLQT8AutQdWTLs=
X-Gm-Gg: ASbGnctlHvYw3whJHrXe3Qelr2zcDZN3MULNAbyWJZqI/qWEaDr2KBKTPETiYKFddle
	860mF/tyIGCM4Fh2hEKjcnQF9FWUaXydYUYSH/YfWMLSSwzUlFZZEVRp4l0YHDhWFKUh3Wphc1B
	ddxwnLH2QOVJoWW5tzmqYZUAomtdbhJvujjzs+1GDVS645ND30mehveuCuZjjxNFYoNex3oHoq6
	xfON0nsPjS2BKOBv/jF1mdUWHm7p7VQWyScZCIjPOCFo3tSFG4a0AzG8uNSsXmtAZV9LZmqow7M
	8PVqbxKRavbFsW5b2If7zx/5ENIi4vKYWGn9IgsRHEjn9vE23jBRxAF+p5r/CMMeu1W8Pj+p5nV
	g7bCLjF2ZiMi+xfzmLegSHiRyT+lk2bN6pDVsWssvkQ+EVeuxmGdGpJmLuOv8mLll
X-Google-Smtp-Source: AGHT+IGSLuLHsKgVY7nvVCQ6A4C+bppOpxOd3JRSqwy6Q8YxWL9gqx5G88fLV6Z5a1oLfmm2jMhwtQ==
X-Received: by 2002:a17:907:97c9:b0:b73:4fbb:37a1 with SMTP id a640c23a62f3a-b7367ead274mr149478466b.1.1763116701219;
        Fri, 14 Nov 2025 02:38:21 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b734fd80a5dsm357339266b.36.2025.11.14.02.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:38:20 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 14 Nov 2025 11:37:56 +0100
Message-Id: <DE8CP7JNU9LK.32K25AJH9SUU8@ventanamicro.com>
To: <cp0613@linux.alibaba.com>, <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v4] lib: sbi: Enable Ssqosid Ext using mstateen0
Cc: <anup@brainfault.org>, <guoren@kernel.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
References: <20251114071359.1492-1-cp0613@linux.alibaba.com>
In-Reply-To: <20251114071359.1492-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023826_037834_377661B6 
X-CRM114-Status: GOOD (  11.80  )
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

2025-11-14T15:13:58+08:00, <cp0613@linux.alibaba.com>:
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> The QoS Identifiers extension (Ssqosid) introduces the srmcfg register,
> which configures a hart with two identifiers: a Resource Control ID
> (RCID) and a Monitoring Counter ID (MCID). These identifiers accompany
> each request issued by the hart to shared resource controllers.
>
> If extension Smstateen is implemented together with Ssqosid, then
> Ssqosid also requires the SRMCFG bit in mstateen0 to be implemented. If
> mstateen0.SRMCFG is 0, attempts to access srmcfg in privilege modes less
> privileged than M-mode raise an illegal-instruction exception. If
> mstateen0.SRMCFG is 1 or if extension Smstateen is not implemented,
> attempts to access srmcfg when V=1 raise a virtual-instruction exception.
>
> This extension can be found in the RISC-V Instruction Set Manual:
> https://github.com/riscv/riscv-isa-manual
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---

v4: remove extraneous parentheses around SMSTATEEN0_SRMCFG

> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> @@ -143,8 +145,11 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
>  	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
>  		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
> -	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
> +	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
>  		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
> +			ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
> +	}

This should be:

 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
 		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
+		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);

Because SBI_HART_EXT_SSQOSID doesn't depend on SBI_HART_PRIV_VER_1_12.

Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
