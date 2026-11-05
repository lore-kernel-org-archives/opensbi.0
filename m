Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF7C606D806
	for <opensbi@archiver.kernel.org>; Thu,  5 Nov 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rHd1BJWZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=goXY+hwt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+UmNWjng7LAPnYO4z023I44ypAaY0vWtxfDv4++uqas=; b=rHd1BJWZmilvQG28x71aiB2Rl9
	n974FiSkRFQi8V+0bPXx283crSps+nehBUaF/sj3hJkpR09qowqXPu5NrRi0DShOrh9fc5ozQB6B7
	DfMAvLJTQ1warSkryOkJqtQl2pxgBdtvqyzJj+tI9TUabCCBoPU7TWe9gwxswx9susiBbbQyXaFXv
	FJPTtJsCreOYzJLhSyHfEi7r9wg5qe3Ivozl5nRKdzr/OTlKF/4Mvrzli+5RZHhpGuaOstPp/Y5+q
	FqJgp8UXSMV5a4x7gg7hugoNI+h0pWCzjtKyAcv0JZoih2OUeD3G6VxnqNbPR23TUQcMEUiLL8QIc
	VDqjlv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyyg-00000009M06-0UfV;
	Thu, 05 Nov 2026 15:02:10 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyyb-00000009Lzf-3ohQ
	for opensbi@lists.infradead.org;
	Thu, 05 Nov 2026 15:02:08 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6df7f544919so1106881eaf.1
        for <opensbi@lists.infradead.org>; Thu, 05 Nov 2026 07:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793890925; x=1794495725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ooZThoT6EXCriVBh+oJ58QDeJJvvFwIpg9PkEEkJkB4=;
        b=goXY+hwtLSOzsFWeZDAqr9OvJhWYR7LtCr4+HipjcSSQEYvp1tSUEsmHJwDY7KOlGl
         31oPPjTkl/lZIO61cnIQ6Ze0Lx/ZNFibDJAzppR4i+VgLtrc/WzwNq/4kkM4a1eb0EWb
         aSvnNmTcRtLMM8ygTYjLX//0bK2BVk+wvnglDYROb5XB3mwXXTOxy33NIJ6KV0UuBuDS
         qTNawhPoy84NIXGrCE37e0nD0qxSfLYHxMO6PR5X5YvixPLPfOtFzgbbJOtRO7jqLcTB
         wKap7Q9bP/0oc+U92StW2sGszpbqSLKu2MCtNrcnqGJwdAo0skc/Acl86GNaJnrVLKs/
         f/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890925; x=1794495725;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooZThoT6EXCriVBh+oJ58QDeJJvvFwIpg9PkEEkJkB4=;
        b=bzczsjlFYEvLPjVPgEAeF0/M7cIoC8SX/UvhhPY9g3fV0l4HFUqnd2VEgjOtRPf2cQ
         hwk5LTAOFCASNzQw2RsHWJFt1esLw6R8DxTak9TjlUzuk82ntff3a6gdgx6MGFMcYIVQ
         00slEJyVrqo8jOji8lJUTyz3dHGbauB8b+PPL8/h+nLEsVxvwlixj3T0md8fq8KJ7pCE
         6V+Twb1/1LfXoPPgEVPtlxoVuGnOtOMu0v7ZgsFyOt2pHo54DK13dki0kI9a1ZzqJd0u
         488eVUCMmzACkkcsN2Yo23rW5j4Y8JgSgmN3bp9eB7xA3IrbFuyg6zo2X9XkwbEDYxDS
         pMnw==
X-Forwarded-Encrypted: i=1; AKwUvBw+yUnm4DNNFR6RbQDID5VjTCVf0tLapqNAv9cr09g6gp6JUXctW7eBpXDpGTg0aynqpqxkzRnI@lists.infradead.org
X-Gm-Message-State: APuU4Z+Tb60ZWnz6MPEQu3dwts3ZL5/Y5rj8g1Dp4Isu0Om1Jv4C1242
	auRdllmtVyj6T9Xsh8KwlSNvw0b8N0oKo0D0WcguGlQuR/YmgkF4C9J2IjIAnE5ND0s=
X-Gm-Gg: AYBFou2pfv7O4XZPj9w6tS26Q1rG73p1tHLEKIAkSY8d3Ues5//sipCXzyddkeiSQK8
	icPc6Q6MUpxnWKZadTm/efY4yU20uXZub684a6dwdo1Gj8sENmL+Y1Wq2TF2yNpbrShqNlGFUea
	FYD5BYpZcTNyBwWnyBJ/mDsuE0y+WqVLtpBbIow9BQjWU31tVtEFLTJUSYve68SD1bmv4rXFMn3
	hM9wl/PY28q3GSRYrsgmjYwy8YdekQHSzlEW88I1RTfQCgqswcEChGJGSJgu+6uK5iYF+ucyraW
	jSjgw+NhS359AaMEKUzDLDk3X0iF7BhA1X486I2HYYaHmVJHO7832ZxNivhwd+VLLjhNRHAngzF
	6QT0oaZrpVhvwqT15f29Z4XbcQZm++XvysFfbY3ire9B/b0OG4r/jEU9RXucXK+G/g+qiXXfZSc
	9GhJoO2Div5kAM005E2Mt4itXXMrtuSB1C2OIlBglZbe8X+VqMZElx8CjXg/R2N7AkHZUlDRWTZ
	PtfZd3d2Dp01FU6evvx1C19A0+dnvTXvYolr9LowlNVHJxgWu15ct7h3UFjk7MXtotVg7fRf7MC
	WJo1z1okNgCGhy4Gov4cYrokNS2lDU+DNonlMVP1fBuYb01jUcxu
X-Received: by 2002:a05:6820:c3ca:b0:6dd:3534:478f with SMTP id 006d021491bc7-714f29fa946mr7386591eaf.73.1793890924639;
        Thu, 05 Nov 2026 07:02:04 -0800 (PST)
Received: from [100.64.0.1] ([136.226.84.194])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1254321sm4148217eaf.4.2026.11.05.07.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:02:04 -0800 (PST)
Message-ID: <5562950a-e4b3-4fe1-ac7c-a3e5f6e5e7f1@sifive.com>
Date: Thu, 5 Nov 2026 09:02:02 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/6] lib: sbi: Preserve hypervisor and VS state
 across domain switches
To: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>,
 opensbi@lists.infradead.org
Cc: anup@brainfault.org, rkrcmar@qti.qualcomm.com
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-1-theodoruswensanfebruanto025@gmail.com>
 <20261105044339.435711-2-theodoruswensanfebruanto025@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20261105044339.435711-2-theodoruswensanfebruanto025@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_070206_013721_21075BDB 
X-CRM114-Status: GOOD (  16.60  )
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

On 2026-11-04 10:43 PM, Theodorus Wensan Februanto wrote:
> Save outgoing VS state before modifying S/H interrupt configuration,
> then restore incoming VS state after the H state exchange.
> 
> Preserve core H-extension CSRs, optional Smaia hypervisor interrupt
> state, and Smstateen state-enable registers.
> 
> Include hvien, hvictl, hviprio1, hviprio2, and the RV32 VS interrupt
> high-half CSRs.
> 
> Link: https://github.com/riscv-software-src/opensbi/issues/433
> Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
> ---
>  lib/sbi/sbi_domain_context.c | 112 +++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> index 987ac7fa..c34d4cbb 100644
> --- a/lib/sbi/sbi_domain_context.c
> +++ b/lib/sbi/sbi_domain_context.c
> @@ -21,6 +21,42 @@
>  #include <sbi/sbi_vector.h>
>  #include <sbi/sbi_fp.h>
>  
> +struct hart_context_hext {
> +	unsigned long hstatus;
> +	unsigned long hedeleg;
> +	unsigned long hideleg;
> +	unsigned long hie;
> +	unsigned long hgeie;
> +	u64 henvcfg;
> +	unsigned long htval;
> +	unsigned long htinst;
> +	unsigned long hvip;
> +	unsigned long hgatp;
> +	/** Optional hypervisor state */
> +	u64 hvien;
> +	unsigned long hvictl;
> +	u64 hviprio1;
> +	u64 hviprio2;
> +	u64 hstateen[4];
> +#if __riscv_xlen == 32
> +	unsigned long hidelegh;
> +	unsigned long hviph;
> +	unsigned long vsieh;
> +	unsigned long vsiph;
> +#endif
> +	unsigned long hcounteren;
> +	u64 htimedelta;
> +	unsigned long vsstatus;
> +	unsigned long vsie;
> +	unsigned long vstvec;
> +	unsigned long vsscratch;
> +	unsigned long vsepc;
> +	unsigned long vscause;
> +	unsigned long vstval;
> +	unsigned long vsip;
> +	unsigned long vsatp;
> +};
> +
>  /** Context representation for a hart within a domain */
>  struct hart_context {
>  	/** Trap-related states such as GPRs, mepc, and mstatus */
> @@ -44,6 +80,8 @@ struct hart_context {
>  	unsigned long sip;
>  	/** Supervisor address translation and protection register */
>  	unsigned long satp;
> +
> +	struct hart_context_hext hext;
>  	/** Counter-enable register */
>  	unsigned long scounteren;
>  	/** Supervisor environment configuration register */
> @@ -131,6 +169,25 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  	sbi_hartmask_set_hartindex(hartindex, &target_dom->assigned_harts);
>  	spin_unlock(&target_dom->assigned_harts_lock);
>  
> +	/* Save outgoing VS state before modifying S/H interrupt CSRs. */
> +	if (misa_extension('H')) {
> +		ctx->hext.vsstatus = csr_read(CSR_VSSTATUS);
> +		ctx->hext.vsie = csr_read(CSR_VSIE);
> +		ctx->hext.vstvec = csr_read(CSR_VSTVEC);
> +		ctx->hext.vsscratch = csr_read(CSR_VSSCRATCH);
> +		ctx->hext.vsepc = csr_read(CSR_VSEPC);
> +		ctx->hext.vscause = csr_read(CSR_VSCAUSE);
> +		ctx->hext.vstval = csr_read(CSR_VSTVAL);
> +		ctx->hext.vsip = csr_read(CSR_VSIP);
> +		ctx->hext.vsatp = csr_read(CSR_VSATP);
> +#if __riscv_xlen == 32
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
> +			ctx->hext.vsieh = csr_read(CSR_VSIEH);
> +			ctx->hext.vsiph = csr_read(CSR_VSIPH);
> +		}
> +#endif
> +	}
> +
>  	/* Save current CSR context and restore target domain's CSR context */
>  	ctx->sstatus	= csr_swap(CSR_SSTATUS, dom_ctx->sstatus);
>  	ctx->sie	= csr_swap(CSR_SIE, dom_ctx->sie);
> @@ -141,6 +198,61 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  	ctx->stval	= csr_swap(CSR_STVAL, dom_ctx->stval);
>  	ctx->sip	= csr_swap(CSR_SIP, dom_ctx->sip);
>  	ctx->satp	= csr_swap(CSR_SATP, dom_ctx->satp);
> +
> +	if (misa_extension('H')) {
> +		ctx->hext.hstatus = csr_swap(CSR_HSTATUS, dom_ctx->hext.hstatus);
> +		ctx->hext.hedeleg = csr_swap(CSR_HEDELEG, dom_ctx->hext.hedeleg);
> +		ctx->hext.hideleg = csr_swap(CSR_HIDELEG, dom_ctx->hext.hideleg);
> +		ctx->hext.hie = csr_swap(CSR_HIE, dom_ctx->hext.hie);
> +		ctx->hext.hgeie = csr_swap(CSR_HGEIE, dom_ctx->hext.hgeie);
> +		ctx->hext.henvcfg = csr_swap64(CSR_HENVCFG, dom_ctx->hext.henvcfg);

OpenSBI supports hardware with H but not Sm1p12 (e.g. SiFive P550), so this CSR
needs an extension check.

Additionally, since the bits this CSR control if certain bits in senvcfg are
writable or read-only zero, the save/restore of senvcfg needs to be split.

> +		ctx->hext.htval = csr_swap(CSR_HTVAL, dom_ctx->hext.htval);
> +		ctx->hext.htinst = csr_swap(CSR_HTINST, dom_ctx->hext.htinst);
> +		ctx->hext.hvip = csr_swap(CSR_HVIP, dom_ctx->hext.hvip);
> +		ctx->hext.hgatp = csr_swap(CSR_HGATP, dom_ctx->hext.hgatp);
> +		ctx->hext.hcounteren = csr_swap(CSR_HCOUNTEREN, dom_ctx->hext.hcounteren);
> +		ctx->hext.htimedelta = csr_swap64(CSR_HTIMEDELTA, dom_ctx->hext.htimedelta);

Similarly, OpenSBI supports hardware with H but not Zicntr, in which case the
htimedelta CSR is not implemented, and the delta is implemented via
sbi_timer_get/set_delta().

> +#if __riscv_xlen == 32
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
> +			ctx->hext.hidelegh = csr_swap(CSR_HIDELEGH,
> +						dom_ctx->hext.hidelegh);
> +			ctx->hext.hviph = csr_swap(CSR_HVIPH, dom_ctx->hext.hviph);
> +		}
> +#endif
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {

Is it necessary to check for Smaia twice here?

Regards,
Samuel

> +			ctx->hext.hvien = csr_swap64(CSR_HVIEN, dom_ctx->hext.hvien);
> +			ctx->hext.hvictl = csr_swap(CSR_HVICTL, dom_ctx->hext.hvictl);
> +			ctx->hext.hviprio1 = csr_swap64(CSR_HVIPRIO1, dom_ctx->hext.hviprio1);
> +			ctx->hext.hviprio2 = csr_swap64(CSR_HVIPRIO2, dom_ctx->hext.hviprio2);
> +		}
> +
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMSTATEEN)) {
> +			ctx->hext.hstateen[0] = csr_swap64(CSR_HSTATEEN0,
> +						dom_ctx->hext.hstateen[0]);
> +			ctx->hext.hstateen[1] = csr_swap64(CSR_HSTATEEN1,
> +						dom_ctx->hext.hstateen[1]);
> +			ctx->hext.hstateen[2] = csr_swap64(CSR_HSTATEEN2,
> +						dom_ctx->hext.hstateen[2]);
> +			ctx->hext.hstateen[3] = csr_swap64(CSR_HSTATEEN3,
> +						dom_ctx->hext.hstateen[3]);
> +		}
> +		/* Restore incoming VS state after H interrupt configuration. */
> +		csr_write(CSR_VSSTATUS, dom_ctx->hext.vsstatus);
> +		csr_write(CSR_VSIE, dom_ctx->hext.vsie);
> +		csr_write(CSR_VSTVEC, dom_ctx->hext.vstvec);
> +		csr_write(CSR_VSSCRATCH, dom_ctx->hext.vsscratch);
> +		csr_write(CSR_VSEPC, dom_ctx->hext.vsepc);
> +		csr_write(CSR_VSCAUSE, dom_ctx->hext.vscause);
> +		csr_write(CSR_VSTVAL, dom_ctx->hext.vstval);
> +		csr_write(CSR_VSIP, dom_ctx->hext.vsip);
> +		csr_write(CSR_VSATP, dom_ctx->hext.vsatp);
> +#if __riscv_xlen == 32
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
> +			csr_write(CSR_VSIEH, dom_ctx->hext.vsieh);
> +			csr_write(CSR_VSIPH, dom_ctx->hext.vsiph);
> +		}
> +#endif
> +	}
>  	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
>  		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
>  	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
