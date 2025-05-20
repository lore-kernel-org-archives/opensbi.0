Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6FAC3DA6D
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idZhm5VJWge6pxX0vkbdNMi6MWo3sAT+I+5xn8vLh3g=; b=PWyi1PS9ohTGkD
	RUMBVAupdI7wJATSEThklwDd79gGBzq4JjuMlAMoJGSep9N3/pSLbMR+DbYnISfdTQVFJdSc3IYth
	aa1NloyIM/Ck1Xg+a1laaGeG0DFsqJbPWRoAXPxIrn2kt++vH7kmgxokN1yRuDnjuqgPjXLb4kixY
	CKBy+IQjlErlFZ3o2Ludd0sNQ8YUawUUN1xZYfvZJyBL152pxsMQTbAGtob0YggJYQ4IYNAe54HYf
	InBTzKWvw9bqT48xlfK1qIUpJ5Z2VdgMekbuaokZ2L6dbE2RSKJwO78zyDyTtYpsuoq68k3QMzBa9
	wiN3WyeqBG2rHLOB0z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIEx-0000000C0Je-15YG;
	Tue, 20 May 2025 08:22:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIEv-0000000C0JD-159W
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 08:22:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a36748920cso2694716f8f.2
        for <opensbi@lists.infradead.org>; Tue, 20 May 2025 01:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747729339; x=1748334139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8S6Jah05c30Z09Noj4u/lvmPgcbqB3ahR6/vDJCBpbE=;
        b=lyWgAk6g8NBm+KGIai47Fot20kGFpBYOYFO4N/ILAVmd7cv7uiaDgb3nA5C5UBMavn
         /GN+QEN2+xQ8c3WxteHhLjZFHV9oiB3faSZK8KtAAh6qHTtLT2ihW/Y0MJB2wKKihDqn
         tRfZVlh3Jo+xWWCLJ6rpVwRFDQrJrpEDzQxDgyqw0Y6lKije+/QCnBJGzae/61CA3kWS
         k7PjqIOdTDlzbO34RsIqfvQi3hgF8MOKryWHFxsnr4OKP9l0iFCn6Oug683Rh+g9Szr2
         P7/Xtyx/D8XNi0U+qKZJpnB/iylYpQMivIsSOetCD0UxOQk/b92WIVhPhQe2ohSo41MY
         aNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747729339; x=1748334139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S6Jah05c30Z09Noj4u/lvmPgcbqB3ahR6/vDJCBpbE=;
        b=YhkKSLfpLishPwyYMGIPBnLCqsvYzmCLlJCUvLGs0MjzCElRLIUFAQcvHBl17fZ3IX
         Z9bWtajlL9J2Ces7dSqI9gdOAONW8j8j7anKoCzTbwyiQpl5+6KmWUdlvhUThql9o06s
         VWkV6VZWdnBhaqqES3nOiwrO8GyXT1/qVnfyqVDKEtpRuGCqsysLitwoMM5SwGhatHRv
         aRkJ9ns7DtlCuPtuMaLu4BeoVzvgOpPpjs0kQftQxDEF+Y0yogEFl9mFRloZ1UJP/A4l
         8GjXoxPmdyCbMo+HuWHVTq0tLjOB/axI4ATYuoV0KtOa5UMYHSafXK3m7o9/pEJQTliE
         vZyQ==
X-Gm-Message-State: AOJu0YxIt2YnZaxL9PA1g1oQgKjpw/NKuVwJi7wSWJU0tMlqmf7+UfEC
	EF5amKCM6eZk3BLyvsJGUVOKUcdviXtfh96+PEK1QLIuF+zREfeU/5EDkhqywjuLiUU=
X-Gm-Gg: ASbGnctpJPZ3G4byJ1H3GG4qigy5kc3datZMP77tPv90Is/0nNjxCSYQ+SzsmQ/fTXX
	IuKCAIH+Og8b28fIxACKWkmikgolf5+I9yPd9ovXp2qXJwZZDkXu3g18q3/HcKWI8j9Q2PlSNHX
	8vKypLhV40QO6tCAxuLAuEVZbOVmHEZ7yK10pCKk0qIGUuOgm0mKZprNaxTVfEFXX9DV+VlLtv8
	1DU+N/1vsY5P/h5njrKELua4xIfEnQ3zgmDN9Hhd7mPJubIAhI0W8hXqyu3eqwtiA37VMZ4O2Q3
	iqZWJLcxBHNqT1ax7c6iuxNshYaPfLfKnnl+ALXWNi/y/c3aNQ==
X-Google-Smtp-Source: AGHT+IGy9/5zR8WUgFWPylAw5it0DTn/tLnpJelNDhaNq8aBuBygrs7Kwu6AZV+GmIGGLIqqKgFp/Q==
X-Received: by 2002:a05:6000:1a86:b0:39d:8d54:5eac with SMTP id ffacd0b85a97d-3a35fe5bb4emr13208148f8f.11.1747729339345;
        Tue, 20 May 2025 01:22:19 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3648baa6asm13097690f8f.91.2025.05.20.01.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 01:22:18 -0700 (PDT)
Date: Tue, 20 May 2025 10:22:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: James Raphael Tiovalen <jamestiotio@gmail.com>
Cc: opensbi@lists.infradead.org, andrew.jones@linux.dev, 
	atishp@rivosinc.com
Subject: Re: [PATCH v3] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0
Message-ID: <20250520-91a04c0f8c238cb50bc6a0bc@orel>
References: <20250513134054.80863-1-jamestiotio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250513134054.80863-1-jamestiotio@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_012221_297774_83B92DB6 
X-CRM114-Status: GOOD (  28.77  )
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

On Tue, May 13, 2025 at 09:40:54PM +0800, James Raphael Tiovalen wrote:
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
> ---
>  lib/sbi/sbi_pmu.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 5983a78..353a8f2 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -206,6 +206,12 @@ static int pmu_ctr_validate(struct sbi_pmu_hart_state *phs,
>  	return event_idx_type;
>  }
>  
> +static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
> +{
> +	/* Do a basic sanity check of counter base & mask */
> +	return cmask && ((cbase + sbi_fls(cmask)) < total_ctrs);

Unnecessary parenthesis. We can drop both pairs.

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

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
