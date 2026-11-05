Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACF8606A329
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eEu5xASk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=CYiTntKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xuMtu47O0l/Ko63jfuU4VCacHsNnAfRHl+AJ6J31U6Q=; b=eEu5xASkYSw0ZChDdDHqXpRLGJ
	wUmEqBEM+65miS85JQ5mw7CFpJLYqfDJBsW0LBetQDvOufQy5/Y1dP6aIwBg++XwKE+aCd8M/HPJ7
	rCSWEK7foeZTBK5bb8okKQEjhSX48bIx9hK+t9ymqVkds8U6Q2KoPTlITCdosqPPdnDedc8kuh5Qn
	QNpMPRHPoovYnbRXbnHah/YRog66P0RbHhIUSs+zOW/5/6PJSzcI53fHvBLkKO1UxtIsGlGW2WoUR
	ELDKohXrra2mQzDMBByJ2ZyX7vu4Ofyb+82lqBThxVY3yMB8AEuufTjPM1c6lkV7Y3QVhcjA4N30x
	LTKxXPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOykH-00000009KHD-2GSi;
	Thu, 05 Nov 2026 14:47:17 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOykE-00000009KGr-0lYC
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 14:47:15 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-7143451981fso1302807eaf.3
        for <opensbi@lists.infradead.org>; Thu, 05 Nov 2026 06:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793890033; x=1794494833; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnO0lcLkLkw8FKRS0PpaksDKLUP4srxiPnuPtNFv4Cg=;
        b=CYiTntKNVY19/D7bWQfrGjcJ0c2rzNU0MMhTPyVIO6mfHq1ZYpubzrTtT+65N+t/A9
         b6Fs6iHAvg9uEGsfLxtLBXn/D1ntfMGageXckiQcs5AXRBZw7WX1PKNfi8ZvF7YGiXDs
         BCGV2pKLCLf2Kuxql/coNxIgAu/6Tg3h9wNon1RquxjyRq9eVAxk8akD1y2s6B60cnst
         4RptDmpDqghq5MrrYIhn0VC5ympGWDbD9CbwOu6cqArUJX9mx3lwe7pHpUn67gsbSA7L
         gjaEw2oQppph2LeP8+fuf8rYrH56vFQ380Ap8h8fEbUJuKfTIeFlWVZjej6alRd+8Prf
         RTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890033; x=1794494833;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnO0lcLkLkw8FKRS0PpaksDKLUP4srxiPnuPtNFv4Cg=;
        b=kLjwLVarzWKFqbalp56gfZ4OUlTz5D8S9ovVKAD535u5vLacfMI/VFMoo1W7lcZ7Z3
         XVVo2J1Kl8TLncsKrhz3TnSRCNq/wT84pD1NR31CGhPVs2kGc9LGr0zJgnEgsO9j0wq3
         cpXmz6RnueJxSgCp87LqYRp9o5BFsOL2T5gQnWnUOkQ9iy4Y1C3IStN0we8AHJRQdTbX
         f3ue0tSb5ML7IFku/dW64i10OHbj3htC7+aJG2Ux3d1vxso4EfN0P+sN9hUySHsXc6tQ
         hSqxE8+JkPY+ZkA/R2DPVZUHf0TIs7EiZBjsPZf3hL73JvoTHaHCcUzLH2GWQeHcGfAI
         XaxA==
X-Forwarded-Encrypted: i=1; AKwUvBzf8E+kFNT5IGTSCk9sZrjV+cqdlI1XexcRKfB/6wxje+MIVlGTcWjMTDhdaSx3DV5i9hwD98W7@lists.infradead.org
X-Gm-Message-State: APuU4Z8OoVSoLFjGaWxS/MI5LfAmltlQWPhzjqiGaqcHKXA2d2wZ1vAD
	/vLP6CtZXxDFtNKG49s1i6z7XWlGsIea4Tc69jIS3WBATrWWFZTUIdH40Z7+P7WruhYquI6ZNyt
	+kj+v
X-Gm-Gg: AYBFou1xkEO6GQNmWf12kdjlwp6X2YZI5sHkIGhtHt98z9w38B6qROQO/jIY1bb2CbD
	d8oh/sgES5SX6RUfDjpPMXCgSVSk2s4sA0S/Ch6P/DKIKgMhiGrWUzZDY8NEoLosqEh+cD+poyt
	FJEUeTJHAR95boVBUAohcEYXQqzEsXByNmadelObAp06HvQ9OgCfVr5T+/bf7L+L/gEm0A/+EZO
	h1GBL6+gxFr3IAU2oETHyRw0tE3q6RX4vkEvz9ekGm4ZiDSQKNkausm3tKTm127wgKJaGmMLpTI
	a4x1FuBvoJpLLmrOOHDJCuPPxEg8kqIN19JA4NkqJvSJOqOxSHf4Deq7uNoa1tpC3Doxqq0Etxg
	aASf1Ua2zvTTju7sNnzsf7rQkriFzFEDiJFM2OflSqL3k7YtAzlMo1nZ5/XmTqOH/K8oHO88IWb
	lGWqvoAFJ57v4WW3MQh7X7cYhI94G8kl043i7EoHRqSwNJEPRgRKTYXz1hhKMWOJuu5byX3/YmE
	z+yhWePX2+0wiz9Vp72d9SeJMaCcvW0IX2bmipiMYxzFClkQiggjfkYnoPJWr3clDUxC8tvolDC
	DnU6Pzm/0B1sLtmOxC/p52x94MWW9Vk=
X-Received: by 2002:a05:6820:828:b0:6d8:28f1:140e with SMTP id 006d021491bc7-714f290f510mr10366266eaf.24.1793890032824;
        Thu, 05 Nov 2026 06:47:12 -0800 (PST)
Received: from [100.64.0.1] ([136.226.84.194])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1308c96sm4220105eaf.11.2026.11.05.06.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:47:12 -0800 (PST)
Message-ID: <121d52eb-2d73-45b5-9fc1-343cf7151b29@sifive.com>
Date: Thu, 5 Nov 2026 08:47:11 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/6] lib: sbi: Preserve Sstc timer state across
 domain switches
To: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>,
 opensbi@lists.infradead.org
Cc: anup@brainfault.org, rkrcmar@qti.qualcomm.com
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-3-theodoruswensanfebruanto025@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20261105044339.435711-3-theodoruswensanfebruanto025@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_064714_326725_A7FAF127 
X-CRM114-Status: GOOD (  18.20  )
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

(sorry for the duplicate mail -- I didn't see v3 because it was wasn't a
separate thread, since you sent it as a reply to v2)

On 2026-11-04 10:43 PM, Theodorus Wensan Februanto wrote:
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
> index c34d4cbb..d2490483 100644
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -57,6 +57,11 @@ struct hart_context_hext {
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
> @@ -88,6 +93,7 @@ struct hart_context {
>  	unsigned long senvcfg;
>  	/** Supervisor resource management configuration register */
>  	unsigned long srmcfg;
> +	struct hart_context_sstc sstc;
>  
>  	/** Float context state */
>  	struct sbi_fp_context fp_ctx;
> @@ -259,6 +265,12 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
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
> @@ -320,6 +332,9 @@ static int hart_context_init(u32 hartindex)
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
