Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86864C3600C
	for <opensbi@archiver.kernel.org>; Mon, 31 Mar 2025 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMODnGU+jGRN6EkUr3gHbkRloRfHHl+yn0TC+ujlReI=; b=GEAkLBIYV2iXA31j2w5iVmy9ZA
	M6B3UH/rxy3pvtZ8B9N7yOUYcPYdDLsz1GUlwG3foTXD91qfl0KB7OgU7edG8N0RdPMP9p3ZbCmGx
	fSgOzfO+KYY05Pmq6tw4G0VLHltEv0phtgSLLknMH1thL0ycBVP7njKDyZNQY3a9B2JzAPwXT+ofW
	v9v0sBa5P0v/vRtkdtKmLjSgNF+qA4+iFMHsosLpjpCwL9d0IXnOz/wTdRxJXQMykFlptA0jdpxVd
	RpHVM4F1dAmPW6DyTkEr/sfsMRH4vBrkGCHYZL9M56KG1RFXSy+2oPNuuSqkcQ/gYTTds3uHlIH1m
	B7cfP3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzNt6-00000001XdC-4C4T;
	Mon, 31 Mar 2025 22:45:49 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzNt4-00000001XcY-3EB0
	for opensbi@lists.infradead.org;
	Mon, 31 Mar 2025 22:45:48 +0000
Message-ID: <72a8a391-3cd6-4c0a-a3f2-175127bdc341@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743461131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqN37Hz/P+so5nQFXi7GFqcamWOBP0Ew9k7OnIpt1pc=;
	b=TIuLPeQIZETH2c7UOJydWvxqRJ47C68cAV1aQbqiao6y8HStUE2pUpyBswmi4x4onVRZl/
	XEioFsfsYKT9dadOKGxOzhs3W4VGJyeGizxhLnS/bmFCdgHeF+JN4vxZLTOiglwT8pV1Bq
	VCPE+/Ro4eTEP4iTMAivH8lLFgxBDhg=
Date: Mon, 31 Mar 2025 15:45:22 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] lib: sbi: Allow programmable counters to monitor
 cycle/instret events for Andes PMU
To: Leo Yu-Chi Liang <ycliang@andestech.com>, opensbi@lists.infradead.org
References: <20250328084142.540807-1-ycliang@andestech.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250328084142.540807-1-ycliang@andestech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_154546_956290_FC780C61 
X-CRM114-Status: GOOD (  13.69  )
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

On 3/28/25 1:41 AM, Leo Yu-Chi Liang wrote:
> Referencing commit 0c304b661965
> ("lib: sbi: Allow programmable counters to monitor cycle/instret events")
> to support this functionality for Andes PMU.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> Change since v1:
> 	- Modify the comment
> ---
>   lib/sbi/sbi_pmu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index b9e84543..575799eb 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -719,12 +719,13 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
>   		return SBI_EINVAL;
>   
>   	/**
> -	 * If Sscof is present try to find the programmable counter for
> -	 * cycle/instret as well.
> +	 * If Sscofpmf or Andes PMU is present, try to find
> +	 * the programmable counter for cycle/instret as well.
>   	 */
>   	fixed_ctr = pmu_ctr_find_fixed_hw(event_idx);
>   	if (fixed_ctr >= 0 &&
> -	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
> +	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF) &&
> +	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_XANDESPMU))
>   		return pmu_fixed_ctr_update_inhibit_bits(fixed_ctr, flags);
>   
>   	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
