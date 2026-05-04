Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C76ECD3430
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYkS+VfxLD4FUvcu6ycmSFnJ7AYUmooRwRORaGw+xsI=; b=mzDrkkk2pLovYh
	dtH2OHUIbXbrtLQMTjsbNk6m0P/lduXdrhUNjBwEKOuOhzXMVDsqCqT6cnwfTUZQ1/7uy5SFf7vDU
	WQSlWzZDGASE1FG6p7tjxDsMeWbdrX+S6zSUUM3Pu41bT7JfV8xeUnBOkmACoI6XM5ZJqpMuvfbLm
	drtZDy3hNjPAeS2aTzPjQAXkNScmEamXeQ9Bt3ag5FKT9RJQuL8R3teU6Swi4KfbGW7kvnjdm+ukB
	HVxoDw/U1sc/FTM96jpuHOxFseSTpB+xGmWV2TgdJ+89glhh9Js7VBYuTvLxZNt0cIoCCSTwHYpad
	Sv3RByQybvwawjug9fLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJv8p-0000000DaqJ-0HNc;
	Mon, 04 May 2026 15:23:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJv8n-0000000Dapf-1h6l
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 15:23:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Dwb6K3467600
	for <opensbi@lists.infradead.org>; Mon, 4 May 2026 15:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sSni3xcIfk3Ln0ptmn61hnDg
	eHhl1IIrcDXZoV+nGM4=; b=Bg7UoVXRhqimzMgk/5ZBnbgTy59lN+Q0Ljl6mIkq
	x3sRPlfqYxc6jsWfaTsPT1QFUmMFTr4lcevKT6IDFdAbugz2NrTryWhrkhggLgnW
	H3lCgDdtDOS3FUzNDFS1RxUtEQ828BkE/xrFnuaOeEmPcOoHcaetRqktHBdtFi4R
	qMU9kVvCeibb54UQ501R6exc7n+D7RMgH3bEDWVYmYo9TG4qo+AWcBg9vjA16Gs8
	tSsoKzSD5TT57Lax2OoN90ExaIRTDoWwHZc1HeQaphB4AfL96xwsTeLWT23HujIH
	7Myii/bsUG7gEncHtDxW3YZW5JhidtcYs+U9L306r5zAgQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjrbyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 04 May 2026 15:23:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83565161a6eso558768b3a.1
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777908204; x=1778513004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSni3xcIfk3Ln0ptmn61hnDgeHhl1IIrcDXZoV+nGM4=;
        b=gO41M6NYNf4r3LrMdP5cAfTFo8xgMjfLSY1lOhSN7z4fqbZhigayP/HKRutPhRLfyO
         0Gtvvi0Bf/ps8R0ZZq7tMz1RpGL4hC04PH0q9cPd+bPYrgBGJkNBQ4iPL43QySewmBPZ
         Rk5gz7Mc/AYTJfc6l9uaizhYGFiE3UbxLzY1iX+4P0mmuLkbNJTlvbLOQGkwOdsIiJ9S
         Er8MfedmC8Um2pOWPEJTMrkXdK1Vj4AU0s+wVuORKSEyM5tmbJ9jeMBDRUG1e3jCkb1H
         7UHP98aHUS21YHJg4KOHeNLGWDdj0IYo42ulxAJy2ISIlnnTns3ckX37XsavedifPIRf
         I0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777908204; x=1778513004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSni3xcIfk3Ln0ptmn61hnDgeHhl1IIrcDXZoV+nGM4=;
        b=FWqz3hu9vReLSjCOQnxDAS1UhayFNEGe1QKLZWouuwG+CkzF0GfZwVf/eGEFV3+Jpj
         YDzt6YfrD2lmYtN3tsoGrJ8xtv7BDYXimvRSQJkpiDzl9r3zjx2YNPu0eUyyGoJ68xTu
         w1N70wCe5VXDYAZUWHwr4okfHY0aCQLmGC46PP6aUj5nf3WIUbFcJbBrqLaz80V99wvv
         jzmKylQt26DdZMj06jC8EwktxAmkeI5sGADvTYWgDTLoCiYZIxcvJ5M4j4buGdDQlC0g
         i6jg4Qp9xo8QsweLaYWEPpem9blOxnGgN1Eyfv8mItCLi2vMk5Xp000wblejWOvnb/fm
         16ww==
X-Gm-Message-State: AOJu0Yy3x2Taj15wzRiN25zFw3gFqrBQNH01JeXCL0c2GJJn2RFr3qqs
	ecWd0wlQ2msUEcFsBT+2OII26aN/j4xh3rG3lrZB9BYV45JoRH3eKAgp+OfMCY1NLH8MGIL3RjF
	quMc0OYVGipd8ES/Jf++eWr3rf4lUPwO1CtEb64FSSW2cQjG/gIuD5E0DNQqOxBxu0A==
X-Gm-Gg: AeBDiesdzi9TRbHEWrbNh9AI5inhcacJtmcpsM/+/I8ddejDl/rsRRqhCqAeYGoEcqZ
	953smsIq9M/02psPeKD0xcF54PjXkVoeDlQPszVgkj0ioczcTUaSJCw8pdAG6pj5ahGhtumOnvb
	ZOUV2mo97Vaw03oM1UegqQQtM8jzBaxiLv+B9TyQEWUOi15Jpdp8t9RIWApH1u/fWjj8/7ZJNrA
	qq09VmRpesAqpAMrJ/ZiHYjte2YVrvFhXO9vY6v8PHa+uAoWkWVw7GAUmlZ5a1wWFGGGi8sSftM
	Cmp0JM6PXe53lSrUAjvJaSvSVK7dY5oz/bCKbXLP1ENZUVa2SS/M/m2Q8fTUE0c+CKGJl6b9bDw
	f1BpjaG1bvx99YCChDxsypbbDxuVeIA155gYGbRg/io8NDvLf1q7reegE6dYt8kSVZrwWDl2Bll
	b5h8UsbI1AdsFipuOFhM7WONPR/6Hs7YieBKD+ZM1Nthg/OrTg+7yPm11D
X-Received: by 2002:a05:6a00:ab0d:b0:829:6e8c:bcf4 with SMTP id d2e1a72fcca58-838f91cb179mr42988b3a.0.1777908203542;
        Mon, 04 May 2026 08:23:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab0d:b0:829:6e8c:bcf4 with SMTP id d2e1a72fcca58-838f91cb179mr42948b3a.0.1777908202965;
        Mon, 04 May 2026 08:23:22 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351587db67sm12106327b3a.13.2026.05.04.08.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:23:22 -0700 (PDT)
Date: Mon, 4 May 2026 20:53:18 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 06/18] dbtr: Improve trigger update error checking
Message-ID: <afi55pkq49uS6KAx@hu-himchau-blr.qualcomm.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-7-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313051948.4017134-7-npiggin@gmail.com>
X-Proofpoint-GUID: Y_dkph7PElxxruaC5EoHxDwXRHiY_f0j
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f8b9ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=FMuNmeIWY9h5isAileMA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX7Lo7MyVVpc8C
 a9eR3+zkCfyeo/kuTORNvomNWvLHYYP4EGaayDFkiQaGgW89+ejXJ2e0Swz9thVJn8RO7JF2FGf
 sz8yl+Vl/RrA1haBVcjF8/dS8bmMEcSxjEDoSglKXvu0HZIg3y8opj6q30HWnnMHnPTwSaHmBIZ
 xReX+6qEeSEu4Kytq0XkIegpIsE7S4ywPhGGh1NSkG496xZ+lB1tTKpyhjVVxGwr2BeSNB4pNfv
 LxTlGFdXq+PMJA/t2TPFif2yxO4VxquQStlzpnmuJILIvLHdOeWyETNbraLp1NDO2tDVYAGhiEl
 y0LekOamWVDUgZHbZARzdB00SsmF+/+oyHMlqc+7qaxAY5mZ9IIQA8OJjvIO1OeYIiPZHesXS7r
 U6nns2ZeN8OIEThEOPboPeNpSmulMVNE15YII1XOHHIO12IusPWQFkuMKHGn65OMyTHhTFYZ5oD
 hmiuNfvAU6VLtgyYNKw==
X-Proofpoint-ORIG-GUID: Y_dkph7PElxxruaC5EoHxDwXRHiY_f0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_082325_443612_5BC154CF 
X-CRM114-Status: GOOD (  22.12  )
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

On Fri, Mar 13, 2026 at 03:19:35PM +1000, Nicholas Piggin wrote:
> Trigger updates should ensure all triggers can be upated without failure
> before making any changes. Updates that change the trigger type must
> also be disallowed according to SBI specification.
> 
> Change the style of shmem access and checking to match the trigger
> install code and perform all checks first. Add the missing check to
> prevent type change.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  lib/sbi/sbi_dbtr.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 224f2350..d2845fec 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -727,9 +727,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
>  int sbi_dbtr_update_trig(unsigned long smode,
>  			 unsigned long trig_count, unsigned long *out)
>  {
> -	unsigned long trig_idx;
>  	struct sbi_dbtr_trigger *trig;
>  	union sbi_dbtr_shmem_entry *entry;
> +	struct sbi_dbtr_data_msg *recv;
>  	void *shmem_base = NULL;
>  	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>  
> @@ -744,30 +744,49 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  		return SBI_ERR_NO_SHMEM;
>  
>  	shmem_base = hart_shmem_base(hs);
> +	sbi_hart_protection_map_range((unsigned long)shmem_base,
> +				      trig_count * sizeof(*entry));
Hi Nicholas,

I would suggest to verify the value of trig_count before making a large map entry.
It would also help in the two loops below.

>  
> +	/* Check requested triggers configuration */
>  	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> -		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
> -		trig_idx = entry->id.idx;
> +		unsigned long trig_idx, tdata1;
>  
> +		trig_idx = entry->id.idx;
>  		if (trig_idx >= hs->total_trigs) {
> -			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
>  			*out = _idx;
> +			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> +							trig_count * sizeof(*entry));

A forward goto to bailout in success/error condition would be better.

Thanks
Regards
Himanshu

>  			return SBI_ERR_INVALID_PARAM;
>  		}
>  
>  		trig = INDEX_TO_TRIGGER(trig_idx);
> -
>  		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
> -			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
>  			*out = _idx;
> +			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> +							trig_count * sizeof(*entry));
>  			return SBI_ERR_FAILED;
>  		}
>  
> +		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
> +		tdata1 = lle_to_cpu(recv->tdata1);
> +		if (TDATA1_GET_TYPE(tdata1) != TDATA1_GET_TYPE(trig->tdata1)) {
> +			*out = _idx;
> +			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> +							trig_count * sizeof(*entry));
> +			return SBI_ERR_INVALID_PARAM;
> +		}
> +	}
> +
> +	/* Update triggers */
> +	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> +		trig = INDEX_TO_TRIGGER(entry->id.idx);
>  		dbtr_trigger_setup(trig, &entry->data);
> -		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
>  		dbtr_trigger_enable(trig);
>  	}
>  
> +	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
> +					trig_count * sizeof(*entry));
> +
>  	return SBI_SUCCESS;
>  }
>  
> -- 
> 2.51.0
> 
> 
> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
