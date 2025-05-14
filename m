Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC867C3ABC9
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 00:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7ED/C0O9bg4Ceww6/6k/mTzixDz+EFJBBSUL7VLKUo=; b=RM2RojPbWA2buv
	qtCeqj0stpc1nmuwtJIf2LPjZYxPeG45F/zg6PfUdMrig8MkUqlFCrZzwji2sMhgW/LTqHCd65XCd
	CFWNVRrddNpjXjS3Qr14yEaiEVh4Yqml41/Ttj0vDH8FjcSwEHi8tjB7KGECu6BgBupgEzA0JPK0K
	coaptH+Qo71KrrW5rzMhUXQmL6gOU/ZntLJ6s6nnKclrRw9R7GauNBlplpEi//PVAY9ZsaIzoeQmt
	l3SFdeJOOI0+J2m14+AQ2eegqRZ/HVxMZB6cMv9wwJSiRO2lQcoCcKWZ8fPsWxHoshfq/1a9UonOD
	ayzxc4qh1fjeJIMxFK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEzuP-0000000DmJu-0k34;
	Wed, 14 May 2025 00:23:41 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEzuM-0000000DmHi-2rWD
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 00:23:40 +0000
Message-ID: <21be2eff-91dd-4bf7-8794-8037012f80e9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747182203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBU34hqU2IPxoLR1oRd91y/C987yo2EwEc0TAO9o9zs=;
	b=qfWsCoqN3wSf9GTCdTmDIypqrp7SoTe//nIumf6B8bj2/Kcfd/EPJpRjZMOujZn7sOgUXY
	zKB1oLSLSFf9fv06j0yeIK216Ko/iwkHmyWkqelT98NZKctFhy35b9wknzdA9IFhHMJyk4
	O5Jzkv/CSj1Y093xvCjdtOLvRtub0HQ=
Date: Tue, 13 May 2025 17:23:14 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0
To: James Raphael Tiovalen <jamestiotio@gmail.com>,
 opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev
References: <20250513134054.80863-1-jamestiotio@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250513134054.80863-1-jamestiotio@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_172339_031441_8B22D1EE 
X-CRM114-Status: GOOD (  24.95  )
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

On 5/13/25 6:40 AM, James Raphael Tiovalen wrote:
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
>   lib/sbi/sbi_pmu.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index 5983a78..353a8f2 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -206,6 +206,12 @@ static int pmu_ctr_validate(struct sbi_pmu_hart_state *phs,
>   	return event_idx_type;
>   }
>   
> +static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
> +{
> +	/* Do a basic sanity check of counter base & mask */
> +	return cmask && ((cbase + sbi_fls(cmask)) < total_ctrs);
> +}
> +
>   int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
>   {
>   	int event_idx_type;
> @@ -472,7 +478,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
>   	int i, cidx;
>   	uint64_t edata;
>   
> -	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
> +	if (!pmu_ctr_idx_validate(cbase, cmask))
>   		return ret;
>   
>   	if (flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
> @@ -577,8 +583,8 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
>   	uint32_t event_code;
>   	int i, cidx;
>   
> -	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
> -		return SBI_EINVAL;
> +	if (!pmu_ctr_idx_validate(cbase, cmask))
> +		return ret;
>   
>   	if (flag & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
>   		return SBI_ENO_SHMEM;
> @@ -839,8 +845,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
>   	int ret, event_type, ctr_idx = SBI_ENOTSUPP;
>   	u32 event_code;
>   
> -	/* Do a basic sanity check of counter base & mask */
> -	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
> +	if (!pmu_ctr_idx_validate(cidx_base, cidx_mask))
>   		return SBI_EINVAL;
>   
>   	event_type = pmu_event_validate(phs, event_idx, event_data);

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
