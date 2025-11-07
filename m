Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7C7CCFA05
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+47Y0y6Xi1sjvZI7TXUnDjHqIJqlH6oeg744o2xF3k=; b=uMlPgZX6w0b//r
	WCXQw6kcA9PYbmrNfCpeY0Ow28qIB0p3A7DuboeU8Ny0QLN5Xe1ug8eaA++yOXdM+oEhRAvyfVcip
	OqK4sk5lkzStMQmj+Xa0j/qDAv6EmQrhrV6JxlEZScyoK4Vs5+6+w74MAv3UOhXYqiCH6acKJEwdB
	AsXBKIuZhUzQzEP8Lar59n/f2RbfZZFzoluXQHObxYyIOERSYUOCge5xi6umqBvTmdabeWHSsJTnT
	2dAtwWbAvxl3zJCy3iVU2qDcz+dl3I8rj2vQtfGzSNvBVryBeU2XgFXy3vpiGGgA9MT00YZGP2gwW
	G3DhuDulefxGjOxPy88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKPU-0000000HB1r-21Un;
	Fri, 07 Nov 2025 11:13:40 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKPR-0000000HB08-3DsK
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 11:13:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b70acf7fa58so8455766b.0
        for <opensbi@lists.infradead.org>; Fri, 07 Nov 2025 03:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762514015; x=1763118815; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJqdfN0q5rGlCNE5KdbaLJg19w56pYNtm+5w2zcLH98=;
        b=iXBg7fR4WpUktcHvTACF0wvGpr6xMfHRXSd7KG3Zm4Z3rLp1XmRQ+JU+1aAHLFg4x5
         s5T0mqkg+Z9rRcf0jSrcW6loObvyqNaEGKsojzj5DrSOkJ94pf2lEKq2VlcEP+qvaiFX
         NXCrF6AK8BEZ/xnNno9S7mbzr+w6oADcyi4yiiIuPwuDwQHAw89bySR9YXHHSERUm54y
         TvIhAbeXId+5WFu9aXNKDwcJ5pFgAuLiZcqy0/1m+m8xI6kID21KjMMveQMV7ze5U1O6
         qdrm0NjYuY4TaULOiAEd7e3+nvGOTjiCd9HyAler9YuKIOhjXe/cfs8DV1ZUd1qkFTPQ
         QjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514015; x=1763118815;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJqdfN0q5rGlCNE5KdbaLJg19w56pYNtm+5w2zcLH98=;
        b=P7LNAqU8iEYYeVZ7L1uFYjLt0ESJvb7dVqA8tgTh/iRbROe/WEVAlrW2dMoDj5v5Ux
         ZPGnOu1JfQ41nRdJG1Uz8yIzNmMFycaxGxa52AvwfjGCEGtkSWuWVoa6PNVcw4f59055
         dw1ooj/s6dZ/3StNB6iBJW/h8yLwsBZlwGG0doZ/kaI+mjtHxYvUlUzreoYzqTU0BDeU
         7inCQ4dNOv7tEB/xloNxs6HWAFOdarmYDeSnACoD2uOALaVinJVGujr4k8oVNgIWpe12
         pOPjamyCRSVD1oB1sOTPrUftMjNU2USokojXbPQ9NlHcyeXZv8jGPRx0IkiFpYfTMEBw
         /jhw==
X-Forwarded-Encrypted: i=1; AJvYcCUXB7qoNkP5SBeoRVc+Sw69JUBUyHF/0ZHKqySKzSXNbHIVxozuF7J5T7Dz4v1XXnwxfSDZhfnB@lists.infradead.org
X-Gm-Message-State: AOJu0YzfFkNxYIgeaJMc+oXVqvH9E51nVyjxkU5IcHbWo+uLwh1eXfZT
	D6W06y8/PvBK6ogLPylS/l5sNzqjdrSyd49jq50rFBMhvwNHLVBzJIq0Ep0HaIzAFZtiYsHDMhK
	0VFYyxvM=
X-Gm-Gg: ASbGncskWBYOlzUAcvjnKXlDfJWMlmy7GSYDcXJW2aV1nX9V1zqJGwsb5urEIuQAXVJ
	+HoZ5swlcCa0bZK5RsA0NxJ5GKeMzrNSKk31DjZQ3HUop6rumTRINntk9iitIh61xClDo4RUPFq
	QJ6EZhDOm1OS1lsNWmyOoezRkaymw16CvEi5kkvTAnoBxeKpmNzkzCc3fTX3hZ79DTedANWJH07
	YbfOeIuuMYhh++r8hEBKLYm9tPP5DEOuPH0XMGqEEFQoiMo7C62L77Kf9vRVsWlNnnigYPp8KEZ
	9RrxaxhkDJBih2BgVKuClnXjQkEBDazksWcQhH0tfsbW1OJt5gorLc3gFEHI7ohnINIQnLGM5Qo
	kMC8NEu8yxt9lEqcHh/SvhMBZj2/lh8eWAWkJaw6imKqTBsjmWb0QAQglCkscdYb4
X-Google-Smtp-Source: AGHT+IHxppp28oO/lA3Wc0gdsHtZmPK+65/mLK70qG+nv38Qi8jOrcFS2No8KouYyrfFH+oY+R23aw==
X-Received: by 2002:a17:907:9718:b0:b41:873d:e215 with SMTP id a640c23a62f3a-b72c096ab69mr139548166b.1.1762514015495;
        Fri, 07 Nov 2025 03:13:35 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b72bf97d456sm224251166b.39.2025.11.07.03.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:13:35 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 07 Nov 2025 12:13:20 +0100
Message-Id: <DE2F2HVBYSBZ.13JTA8B6XR1W2@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3] lib: sbi: Enable Ssqosid Ext using mstateen0
Cc: <anup@brainfault.org>, <guoren@kernel.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: <cp0613@linux.alibaba.com>, <opensbi@lists.infradead.org>
References: <20251107083200.1940-1-cp0613@linux.alibaba.com>
In-Reply-To: <20251107083200.1940-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_031337_833599_454E52E3 
X-CRM114-Status: GOOD (  13.98  )
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

2025-11-07T16:32:00+08:00, <cp0613@linux.alibaba.com>:
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
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> @@ -79,6 +79,8 @@ enum sbi_hart_extensions {
>  	SBI_HART_EXT_SMCTR,
>  	/** HART has CTR S-mode CSRs */
>  	SBI_HART_EXT_SSCTR,
> +	/** Hart has Ssqosid extension */
> +	SBI_HART_EXT_SSQOSID,

Don't we also need something like

  __check_ext_csr(SBI_HART_PRIV_VER_UNKNOWN,
                  CSR_SRMCFG, SBI_HART_EXT_SSQOSID);

to detect the SSQOSID extension?

> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
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

Why would we want Ssqosid to depend on S >= 1.12?

> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> @@ -112,6 +112,11 @@ static void mstatus_init(struct sbi_scratch *scratch)
>  		else
>  			mstateen_val &= ~SMSTATEEN0_CTR;
>  
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
> +			mstateen_val |= (SMSTATEEN0_SRMCFG);

(Style nit: please remove parentheses arounds SMSTATEEN0_SRMCFG.)

> +		else
> +			mstateen_val &= ~(SMSTATEEN0_SRMCFG);

The else branch is pointless, because the bit is known to be 0.

Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
