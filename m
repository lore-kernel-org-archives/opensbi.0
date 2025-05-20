Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9544C3DA6D
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/ibwIIWps2Gmp3ORYd/5cVFdlsC4ISWD9nO7wuK1nc=; b=waowWzwvfXj2B2
	ysxTTnGbA9UY0/0NLOAXTHPhdKD1vnpOdQhZ8w1/Yh5rxppuEShkTEsVaNeJ7SHBjigMl+BqtzH2U
	+vlNQj4K21q6e7kZOwBxOnolGocTYmFlm3BRih85S1XaeaiSPSHupFVmEJbylk95TuANlgSuYZZO9
	/xMpfJLLZrUumjEbpKiLJ+6wRv2Vt6mSTUS4RgE+X9xj/QCSLxwCCvDFD4BhjdHvmLmI59S6eQg1a
	tmPIqrtRrd9/i0w0yeyyXzqr17Vi2JVPCcrW3EHi3W1IRPsihjItMP+16vm++Nh5j4gisGM7ljVhd
	mwmOqwYOw9kKZ062w8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPe7-0000000DUIt-2gaO;
	Tue, 20 May 2025 16:16:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP2M-0000000DNNR-0tA2
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 15:37:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a36e0d22c1so1836023f8f.2
        for <opensbi@lists.infradead.org>; Tue, 20 May 2025 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747755469; x=1748360269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBRusrJyuJyD3Z9JhGKdzC1FaT0H4Nu5+mGQRH2bEAw=;
        b=bB3/nKNALxrYTFxiPjQh+DJPahmyWJOpnQk0K4PIDKXW34/kHiB5mRStU/F2KCwQUD
         JchDCj12A+lizEzvfQV8a2nogC0kk0BYlQT1MTjL+giEQ73nRzfyADinpycfOPtPjcea
         n/DyfFji6T/gCuuUJR2bSyBXmNVxTQd6DzlTtDm8wXqLPakQf89+dFRgb5OV8xqaU1cx
         GGw0cF9xn59X+9sgRZknrP78X73lPh7cGKXo3YjF01eTBIOhSXhcvh1hqpG9BQtRiHqz
         7OWj/TT1eJN81tRcXrbxuN6elaof+RdMk0icGPLFJoSmkLW+BojUwALxLKkcrNXd3Qwh
         VSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755469; x=1748360269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBRusrJyuJyD3Z9JhGKdzC1FaT0H4Nu5+mGQRH2bEAw=;
        b=t+Or0uGXORiDSDWefbmmLIP2UDT4XLwbiWXgcba0eZhp9gnHxkHVMqeRZMxKbC6gaH
         Cxyp0EdcFHc0WZRAOvZF+843Qg6GZgkA6rvMazR/4bv6LXpt69hRlWAwy3D8DK6JNK8x
         aEhgboeutCRR1wJzGYVTp/jXFdnNoKkPES6FwQXWIzV/hhjNoqx4VqWIrcmrQ6yS0pEX
         HLpTG/JJW8tOhFfPuwpUSA58VTMDeAeCu64EQa+/euBfjfE7C1HrmRci4Fb1FkIUYTZQ
         5Rd3rxwberBI+DgcX2K8lSCd8LPzIXDCPFzi5FxVM01A0vYYMBWVe55OOz7/8mNnUVIU
         mVhA==
X-Gm-Message-State: AOJu0YwFrDzdBcVFVFsWH2G5Jo8IeepnNwyyohd7FZtO5cRqLSz9DtK2
	K4GQ5mnQE13HuWGHgFWEji9fzW1PZL0grfR0j8DsYuwDDgM6VEgC9Ugj73XgjEaDbXQ=
X-Gm-Gg: ASbGncsHZdYlWUqUUCyfbJZmOmxckwSOznvCTKc/2PJks0b9DRUOxmJkoSGGP1SLYxW
	XBVWcLPQBy/+mXFp20RnhFp0kU3bcP9PHokOJvkuo5vBqQdqFS+ooUstndEhghBJ4faWZVGCywJ
	Urv6INXb5N3L8evJBSu6HGPOPvmlbNKIutdSDAK/GuGp1tZhL01IYEtzkOF5IYd/o5tpSNPM0My
	flJZArjoC7Xx+hcLUNrDFmbq3IwxhM2OT0+ZA6Quv8IlOv9oJoStuILycnxSptG5WqQMXqpMR71
	UTDIo7bnYvFeRXTyG2EQhKFSjZnbu2Se4VkcEHY=
X-Google-Smtp-Source: AGHT+IF75+8qO0a48v+NkdCJVwe5fJKthrJ1//qpac4eli3BFeJ7wBqByjLFU3xg9zAWLxJRlE5tZw==
X-Received: by 2002:a05:6000:220f:b0:391:253b:4046 with SMTP id ffacd0b85a97d-3a35fe676d6mr13965261f8f.16.1747755468720;
        Tue, 20 May 2025 08:37:48 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1f9sm16582761f8f.1.2025.05.20.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:37:48 -0700 (PDT)
Date: Tue, 20 May 2025 17:37:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: James Raphael Tiovalen <jamestiotio@gmail.com>
Cc: opensbi@lists.infradead.org, andrew.jones@linux.dev, 
	atishp@rivosinc.com
Subject: Re: [PATCH v4] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0
Message-ID: <20250520-ee7cba8dd3e0873b4af0c27f@orel>
References: <20250520132533.30974-1-jamestiotio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250520132533.30974-1-jamestiotio@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083750_253328_8F143F6F 
X-CRM114-Status: GOOD (  29.08  )
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

On Tue, May 20, 2025 at 09:25:33PM +0800, James Raphael Tiovalen wrote:
> Currently, when configuring a matching programmable HPM counter with
> Sscofpmf being present, cidx_base > 2, and cidx_mask == 0 to monitor
> either the CPU_CYCLES or INSTRUCTIONS hardware event,
> sbi_pmu_ctr_cfg_match will succeed but it will configure the
> corresponding fixed counter instead of the counter specified by the
> cidx_base parameter.
> 
> During counter configuration, the following issues may arise:
> - If the SKIP_MATCH flag is set, an out-of-bounds memory read of the
> phs->active_events array would occur, which could lead to undefined
> behavior.
> 
> - If the CLEAR_VALUE flag is set, the corresponding fixed counter will
> be reset, which could be considered unexpected behavior.
> 
> - If the AUTO_START flag is set, pmu_ctr_start_hw will silently start
> the fixed counter, even though it has already started. From the
> supervisor's perspective, nothing has changed, which could be confusing.
> The supervisor will not see the SBI_ERR_ALREADY_STARTED error code since
> sbi_pmu_ctr_cfg_match does not return the error code of
> pmu_ctr_start_hw.
> 
> The only way to detect these issues is to check the ctr_idx return value
> of sbi_pmu_ctr_cfg_match and compare it with cidx_base.
> 
> Fix these issues by returning the SBI_ERR_INVALID_PARAM error code if
> the cidx_mask parameter value being passed in is 0 since an invalid
> parameter should not lead to a successful sbi_pmu_ctr_cfg_match but with
> unexpected side effects.
> 
> Following a similar rationale, add the validation check to
> sbi_pmu_ctr_start and sbi_pmu_ctr_stop as well since sbi_fls is
> undefined when the mask is 0.
> 
> This also aligns OpenSBI's behavior with KVM's.
> 
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---

Need a changelog here. I see the only change from v3 is dropping the (),
though.

Thanks,
drew

>  lib/sbi/sbi_pmu.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 5983a78..6ca4efd 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -206,6 +206,12 @@ static int pmu_ctr_validate(struct sbi_pmu_hart_state *phs,
>  	return event_idx_type;
>  }
>  
> +static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
> +{
> +	/* Do a basic sanity check of counter base & mask */
> +	return cmask && cbase + sbi_fls(cmask) < total_ctrs;
> +}
> +
>  int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
>  {
>  	int event_idx_type;
> @@ -472,7 +478,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>  	int i, cidx;
>  	uint64_t edata;
>  
> -	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
> +	if (!pmu_ctr_idx_validate(cbase, cmask))
>  		return ret;
>  
>  	if (flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
> @@ -577,8 +583,8 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>  	uint32_t event_code;
>  	int i, cidx;
>  
> -	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
> -		return SBI_EINVAL;
> +	if (!pmu_ctr_idx_validate(cbase, cmask))
> +		return ret;
>  
>  	if (flag & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
>  		return SBI_ENO_SHMEM;
> @@ -839,8 +845,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>  	int ret, event_type, ctr_idx = SBI_ENOTSUPP;
>  	u32 event_code;
>  
> -	/* Do a basic sanity check of counter base & mask */
> -	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
> +	if (!pmu_ctr_idx_validate(cidx_base, cidx_mask))
>  		return SBI_EINVAL;
>  
>  	event_type = pmu_event_validate(phs, event_idx, event_data);
> -- 
> 2.43.0
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
