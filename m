Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A15E7316F
	for <opensbi@archiver.kernel.org>; Mon,  2 Feb 2026 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk7c8L4LZDXvy682nI7ub0nijuJEFatuHmSKeTPzhGE=; b=LzL70LvwmLhQboOECnf2tktXcz
	f5VLW9ZWH/LluEHTF547k9NNQPdvauoizJfjl8UAbsjHGaO5TmTKU6sSNdit+u6sCE7CWD/38+ue2
	Xs2GieLYaRolqEoVuf11mBMOO660jDQnwZgs4Mzo0cULg1np+A97z58AxDqpx8upzpdJCdRoxzDlX
	PHrwWrFgQkYcU1EK44IylVtkyUz5xvKrYCYpS9G3FMMLTZU1uxvf2w9QqZKc4kMe9s+XhZ5vNvgTV
	0XKJHsNC0tc8QHz3qgAQ3UlFbpsFpXPiYbgG2zdUTZ9jSWOhbCvIEk/hqAooVcJ+5bvDQBPWkRPql
	zeE33tCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzdQ-00000005WSL-1PZe;
	Mon, 02 Feb 2026 19:30:56 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzdN-00000005WCP-0reu
	for opensbi@lists.infradead.org;
	Mon, 02 Feb 2026 19:30:55 +0000
Message-ID: <2eed3524-7faa-4311-9f2c-8d790f792f6e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770060522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WM5UeMqsoobOuHoft+yi3i1I/N51KPtYB34ltgbXAZY=;
	b=rTapzKzQC8VQd1SMwutMmqyMlKQGuUuGXU/8Tvdhvv3cSKeWiSHZj0OPD0/S0jVOG/6IEm
	TRJ2HbZehvImL4zjUt2x1iojt6G64vZqs0enTR63oepHNw85jL4C813JLbGiWh3Sl4URDi
	X5qylfBcJhoAt68f33o8RDRMD3U+hCI=
Date: Mon, 2 Feb 2026 11:28:08 -0800
MIME-Version: 1.0
Subject: Re: [PATCH] lib: sbi_pmu: Track SBI_PMU_FW_PLATFORM started counter
To: thecharlesjenkins@gmail.com, opensbi@lists.infradead.org
References: <20260127-pmu_platform_stop-v1-1-b07d1abd1ef2@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260127-pmu_platform_stop-v1-1-b07d1abd1ef2@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_113053_534916_6CCEDF44 
X-CRM114-Status: GOOD (  14.04  )
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

On 1/27/26 3:58 PM, Charlie Jenkins via B4 Relay wrote:
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> When a SBI_PMU_FW_PLATFORM starts, add the counter to the counter array
> instead of returning early. This will cause fw_counter_stop() to be
> called when a SBI_PMU_FW_PLATFORM counter should be stopped.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
>   lib/sbi/sbi_pmu.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index e084005d..3c61079b 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -448,6 +448,8 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
>   			    uint64_t event_data, uint64_t ival,
>   			    bool ival_update)
>   {
> +	int rc = 0;
> +
>   	if ((event_code >= SBI_PMU_FW_MAX &&
>   	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
>   	    event_code > SBI_PMU_FW_PLATFORM)
> @@ -468,9 +470,9 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
>   							cidx - num_hw_ctrs,
>   							ival);
>   
> -		return pmu_dev->fw_counter_start(phs->hartid,
> -						 cidx - num_hw_ctrs,
> -						 event_data);
> +		rc = pmu_dev->fw_counter_start(phs->hartid,
> +					       cidx - num_hw_ctrs,
> +					       event_data);
>   	} else {
>   		if (ival_update)
>   			phs->fw_counters_data[cidx - num_hw_ctrs] = ival;
> @@ -478,7 +480,7 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
>   
>   	phs->fw_counters_started |= BIT(cidx - num_hw_ctrs);
>   
> -	return 0;
> +	return rc;
>   }
>   
>   static void pmu_update_inhibit_flags(unsigned long flags, uint64_t *mhpmevent_val)
> 

Reviewed-by: Atish Patra <atishp@meta.com>

> ---
> base-commit: 74434f255873d74e56cc50aa762d1caf24c099f8
> change-id: 20260127-pmu_platform_stop-febef65abf54
> 
> - Charlie
> 
> 
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
