Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669D606A31B
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IT7iW5T0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=WlxJyBAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uTU+dP2kwm5VODSCEHGbVibg2pXchk6SCAXOsJjdld0=; b=IT7iW5T0Oba0zT0qKV6Fet2mWF
	uERorU2UOtlhn65LatJFYzAhMpwMtCZ89sOg5qttPvHFqpIyQvmIuR9IB7NchtzkOkAPRstXMMD90
	aPQF3/72mxdGuzaEFojCoMKq04GOKZjiqdCwnBiFbU4kvvWxTUv9BHJ+jFqdR7xSElm8Jj4Kf09mD
	KI2VU5Rgaoa2uDQEQ16tbhCEslRrnsySUow5L2sUsqfoWoYuJ8lasY5VmMoL1u2ieGpba4fr1ZMfy
	e2jzxBVCEYKOEghVjxwVK9o9zvjTgqMDuX6345x51Cvu9Z5hQVhHDem6zzOkdwJphvZ080o2/iFA6
	6TTRbXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyiX-00000009K8u-1Gd2;
	Thu, 05 Nov 2026 14:45:29 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyiU-00000009K8V-1ox5
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 14:45:27 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-854e904005cso532608a34.1
        for <opensbi@lists.infradead.org>; Thu, 05 Nov 2026 06:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793889925; x=1794494725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrF+ItXgRkjLR0BVCJPKzEV3fi+XFhAgm4WCEzaXcwY=;
        b=WlxJyBAEMJRH3z36811K128L/sSPY2cE1jTlXvTCfmMRzqMwTY/XMgZAGY50xAoB5i
         niAgotjwgGEeX9UR26aSmzDqGPXXgwfkuqUrLMk6n3NyC1WD0ChyysGO3s+kKh3Zk+Tc
         sok+aKfzV9sh8AGQKbCt7L5jSEj9z3XUXiy99y1pkvabtyeaUJLq1EcCNa+ERJZCe38G
         LlS80vEDFfUE/LC7/dhSv9X+AZiOLl6x8TTr2jZt1oR3HZEzdCK56UuZDeK9Hbk6uCaK
         UsvPtzvnycQRn/iSZOETlnAVvw5erLd6S9aueozwrh1il5Oholt4Dj5p4UmMfZ9w/Spl
         XeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889925; x=1794494725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrF+ItXgRkjLR0BVCJPKzEV3fi+XFhAgm4WCEzaXcwY=;
        b=H7FYU8YplgoAkej3oOx9mjDr3UO+CZElcvuC5s2AV0mEZ6Gtn3sXuYrHp83rn5IajZ
         LcYelpaYUxhRra1Wd3GyYXTarPNU90ZUUG00C9hM7rRuGtqQxIYUfgIrNM/zTO/au1/H
         N/uRDILKCAmX3XZyzBNPVPFhUtZEQnJxHfcmKyMDBk7Qu42bs9yK+K4jmoKKOARzuoc1
         qiHfQP3s4kAPVjA691hkx63pK5pnOlBY2mtKVa5DdYhFRTe5I80FrH6FJOhXz3Cu7+fu
         S0HK21l/GVsh8nggJjxoLgQaTMYrJy9xfka8uZhvtTEdAxiMeCEokpHOin/i2JtFn6Vt
         /98g==
X-Forwarded-Encrypted: i=1; AKwUvBxn+MQDqkZ1T1piaoaqiwspECKkuAKnVmNrEGpE9FQeSKTO8iRy+WTAJaFHVSupwQ2sZ8oLr+Gy@lists.infradead.org
X-Gm-Message-State: APuU4Z/b2r3ZUd6LM3w+0y3w2bYmXfk+eWg1oZ1/5ff8FzdlMjBSQBBC
	tnKe2IwLNJqb4GKdfNgcV3YmUeeMKs57FvXpRVvlxTASe0zCTbPaibbcsGaKFpcwaieAXg1xzvp
	o85tw
X-Gm-Gg: AYBFou0NiNBGwtOltYlBLrFwtMGgmy7bVAl6uokf/+0VcLIpWT2Xx4Z7cff+iKQQjRC
	WIStr/XnZwCgn6alsxXZpokKpTI92shCn1zNMTW92OJQ0mFz4qaLsWc0Qy83KVhQdYCGaftRkwM
	wpM5FXdCoaD+qPlgS7ky42jvsqMqMybOb7HguvKWRkSm59VmjHzloJdvyQ/wPhDgkCEve21vDO6
	hjYTNHxV2x+HMjadqxRfJCN13Iznziw5tonEk/BFBEPMvyM2s24/noDANeLkujRQzF6XjbOT7zR
	y7vCjyeEYNqYnfO7WFMwbNYAxgJE/gDjvBuko6J+DyTik3L6DBSbom3oJYi4hB1co5Ddnpumieb
	7ttjzBkJq01E19NLCwd2kR/3SAd6LzzZi/kWD/XP6a5O7tcChj1xY8j8GTpk2A3s/2jlZK+NFDm
	Me1ep5LTRrLt0YZEJ9c3MtgZu0oT1wITgfmw6OlEpVWflB2E9r/+/aaQPV4J72/cExLwi6EvPqz
	E3zKc+R5jdpllkGN2c7g8cIFYzKJkp5t7VInQTi66QsqEyGv2QvSl6rUrTCh6r61dWiEIEVz8pZ
	QDs5t4DlojEQOE7pUYRCd2Ok3RekgkiLIjQwlxBOpp29xlrzWyTnRxNbFvfep5bsLGrNKwfjlw=
	=
X-Received: by 2002:a05:6808:1691:b0:4b8:4703:db90 with SMTP id 5614622812f47-567be4a7da3mr1654396b6e.25.1793889924889;
        Thu, 05 Nov 2026 06:45:24 -0800 (PST)
Received: from [100.64.0.1] ([136.226.84.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm4543631b6e.11.2026.11.05.06.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:45:23 -0800 (PST)
Message-ID: <f0e12881-75ac-4899-8225-2937c3191532@sifive.com>
Date: Thu, 5 Nov 2026 08:45:22 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/8] lib: sbi: Preserve Sstc timer state across
 domain switches
To: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>,
 opensbi@lists.infradead.org
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261023070925.241680-4-theodoruswensanfebruanto025@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20261023070925.241680-4-theodoruswensanfebruanto025@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_064526_566564_683460A7 
X-CRM114-Status: GOOD (  17.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-23 2:09 AM, Theodorus Wensan Februanto wrote:
> The Sstc extension provides a supervisor timer comparison register.
> Without preserving this value, another domain can replace the
> previous domain's timer deadline.
> 
> Keep a per-domain timer comparison value and initialize new domains
> to a future deadline to avoid immediate timer interrupts.
> 
> Link: https://github.com/riscv-software-src/opensbi/issues/433
> Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
> ---
>  include/sbi/riscv_encoding.h |  2 ++
>  lib/sbi/sbi_domain_context.c | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index ffe7666c..60a0c39e 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -448,6 +448,8 @@
>  #define CSR_VSCAUSE			0x242
>  #define CSR_VSTVAL			0x243
>  #define CSR_VSIP			0x244
> +#define CSR_VSTIMECMP		0x24D
> +#define CSR_VSTIMECMPH		0x25D
>  #define CSR_VSATP			0x280
>  
>  /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> index 79419edc..33c19d04 100644
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -52,6 +52,11 @@ struct hart_context_hext {
>  	unsigned long vsatp;
>  };
>  
> +struct hart_context_sstc {
> +	u64 stimecmp;
> +	u64 vstimecmp;
> +};
> +
>  /** Context representation for a hart within a domain */
>  struct hart_context {
>  	/** Trap-related states such as GPRs, mepc, and mstatus */
> @@ -83,6 +88,7 @@ struct hart_context {
>  	unsigned long senvcfg;
>  	/** Supervisor resource management configuration register */
>  	unsigned long srmcfg;
> +	struct hart_context_sstc sstc;
>  
>  	/** Float context state */
>  	struct sbi_fp_context fp_ctx;
> @@ -231,6 +237,12 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
>  	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
>  		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSTC)) {
> +		ctx->sstc.stimecmp = csr_swap64(CSR_STIMECMP, dom_ctx->sstc.stimecmp);
> +		if (misa_extension('H'))
> +			ctx->sstc.vstimecmp = csr_swap64(CSR_VSTIMECMP,
> +						 dom_ctx->sstc.vstimecmp);
> +	}

This is not sufficient if the timer interrupt should ever trigger a domain
switch. OpenSBI needs to register a timer event for at least the earlier of the
outgoing domain's stimecmp/vstimecmp+htimedelta so it knows when that domain's
timer interrupt should be pending.

Regards,
Samuel

>  
>  	/* Eager context switch for float */
>  	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
> @@ -292,6 +304,9 @@ static int hart_context_init(u32 hartindex)
>  		if (!ctx)
>  			return SBI_ENOMEM;
>  
> +		ctx->sstc.stimecmp = ~0ULL;
> +		ctx->sstc.vstimecmp = ~0ULL;
> +
>  		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
>  					   SBI_HART_EXT_V)) {
>  			vec_size = sbi_vector_context_size();


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
