Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2366BC61DD3
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQioiX+hJXpL1ipzsun7jvKSw3O8Sn+wEQEGbER5jfs=; b=nvLvbI/nzZ7KTI
	niM91yeSePctPCwoOixqPdtfB3/ZKyVjaAfvnzYEx4wXiaLcYyfrFpX7bmZmFxYsQG9t7NIS8zU3q
	jdU3io+ViALYHh1ZndpI/vjlXDOR5s3d7IsM03o6krf+k9olGMu8tneT9c7Jvb9m1HuYQWCYW4Ago
	sIU6bOZvYDQkaMxCdqBxSiTUaDkdnalWQjvldI2OMKTvc6/rtV1Sl9hB/n7hGQU6BiXTxIMxxrjYK
	ZsfFmay9CfWGoI2pwMqCZaDWphQMnJKHP9oaACChc9mKhsHIWmd0YchNtOGA0eMakIJ7qUStp+Fkc
	80egvl5MkOqsAsGc3/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22HA-0000000GhoA-0OyV;
	Thu, 03 Sep 2026 07:54:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22H7-0000000Ghka-2ebN
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 07:54:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lKrt721308
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 07:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RG3UlfzkXn6JyduL0crlePmv
	j029pQxk4Z+udWij0ds=; b=oGldbyk9OVKo0fy9u9EggSBSkV77+0Kv0pfTk9Ma
	lWrr0eOePrUkbbqfnClU5mBYJz+bsI836y3OqVcH3dV2SKoNomQaoITO+rahyU8F
	P8ONRuV2tCrbKr8lkk8b/q9sOfxre2zWj+aQEaUkaPbOeTeFEBLUIfQn3+YwwMV3
	QT2LLsi8PunjVd8opWiDky5smNZYbR5NVlStuzH7AGwlQAiX+oTrGuD4NvbyJIcs
	Fr85TFhDb3tLXtkPxkwIroeDQVsyUS3Cfr04Um+cPphMbtB7CsEwOxV93Lc2ebCY
	qm1u5j8Px4lIF/RtKt1EYqHINKJc2cWeL+YIzdReA+R+Fw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnkxnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 07:54:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so715939a12.1
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422050; x=1789026850; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RG3UlfzkXn6JyduL0crlePmvj029pQxk4Z+udWij0ds=;
        b=SxpgEd6Ee2TbIxktdDHv2ZSfXEL93JXuBAGHhUnlfMZToB7fBHC0p+LnppsfGMyH91
         cAo1itYSKRq993qCOzX660qzt02jyPuO7WSa4x6ZxZU0jcc5DWI6bpPPN6Snc5kzllf7
         TwRI1p3w2WXKdT/Il7f6Vhp9xM1TImfitUH+C2/JcURRuH3EgG40OmluHpVfxUy0C5Jz
         bc0timh9OcsW/nWGIowTp6HH2KXIPUKlnvWe7h+Db/E59U2a88VKNPkEdz4T3rhdCUb6
         rh/N+8TH38LX7JuWKqOIeFpQkzwWH2E2z9Eymf9v4cCsIHcL775V90bu3GAvTAssex7b
         g5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422050; x=1789026850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RG3UlfzkXn6JyduL0crlePmvj029pQxk4Z+udWij0ds=;
        b=mileZfRWknl3Ms6+FyxLbZfwhcJkce9LWO4fqIO+uzAZ1nKO5UzEm9//VaDbNFTTRU
         uqMW4tfW742h//KKvFLvlPJJ0yOxeJapGF5rmaRbYO+kvjKTs49/+S7QQVjMlZ9kVeDl
         nx+Nu4DF9sTIx4Z2tFjFnrwZFmID9BdVhFdYmriQqRhIUB/P5vqr5fUDz9bPm+1B4eDr
         Wu/t1MYfuO0QxgP/fBsQbSf6wNvGnOxMXLLgWDhsGrN8w/GoA4GlRhOvZBMUkl1W6Wbq
         mr08qN5DCBF3QtrK+oNqY92BJ9AWey9rXeExnb+MvupVmFEGpVv0tNRCh6eMPxX57Rkh
         6Anw==
X-Gm-Message-State: AFuF++kL92d58OKPxYcC93QybHVekNZeccczuCgP+Z5XWIuGbyxQDIpA
	BcSnvCyi+HvWilCgZ3yOazyG6opRqluOr7GDBxuCddfQOEuv9ZaZOLBIIp32axh7bd6A3QGbNL9
	X3faOpY9Doejby3nqUSr9szNvxURfaDJPlD3W+TlVhHfUG3o7svAzCV6A37xbewp9Tw==
X-Gm-Gg: AYBFou2XkBNc62I3cjDIAGa6nBxrZsBaGt8tYOYcSrk0etBVL+IbQejCt0sR6CtnvyD
	LkvOdhqOqD/NLgRcrWkY7wLkppwuah18XoEl0ZX6GUj4VoIxAKxoQBzbs3ma/tf1weZM3dyrPRI
	QF8T8BeyYwB3HLJ2Ks0G0pZpCOxgvJOc0uNE3dHAyjtFRJFV5gVOVtJI8GmJ6pTzxtWRM4x7e6s
	9HBGeTsbepsIhFeu6ec09RFkfnhPLa9q5HCVJkqbxFHddvEZMWVuWFsA2IOGEmy+Pz5970GU6dK
	fEjS0hKzodlJrl+GwvnAR4e9+mDzOgTjM2DDN5paY/ee4olqpn7dLLE5rbwBdoZWv3HVSkWoNSj
	KwzbKI/3efNcfHeb5/u5wYCQDoczBAu1/0Wlloy/ViZULzHUKfSkCTCLlkIAWJtmxjhREWhRsFm
	F4GgBBChUTeVLnAP4nimWRYdtt
X-Received: by 2002:a05:6a21:2d05:b0:3cc:f9a0:3ada with SMTP id adf61e73a8af0-3da215a6cc6mr4103110637.16.1788422050285;
        Thu, 03 Sep 2026 00:54:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d05:b0:3cc:f9a0:3ada with SMTP id adf61e73a8af0-3da215a6cc6mr4103080637.16.1788422049832;
        Thu, 03 Sep 2026 00:54:09 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256903a21sm4179679eec.30.2026.09.03.00.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:54:09 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:24:05 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rahul@summations.net>
Subject: Re: [PATCH v2 1/6] lib: sbi_dbtr: fix integer overflow in read_trig
 bounds check
Message-ID: <apknnQrrzVcAJySz@hu-himchau-blr.qualcomm.com>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
 <20260731103405.1535818-2-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260731103405.1535818-2-liutong@iscas.ac.cn>
X-Proofpoint-GUID: PuESyy7ExaGbqx2gS-V8uvvltw7nGOqR
X-Proofpoint-ORIG-GUID: PuESyy7ExaGbqx2gS-V8uvvltw7nGOqR
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9927a2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=YkmJc6uqDqkKectSXSEA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXwLLay2XPO4sc
 JN3KtMYa8pAUs3sdRhsFthxQlNw12bpiiVtkzeTjDD5vdcTgnyKD4g/evlWKvj4C3FV77WYOyN+
 ndPLvs01BH5neL5lbqjFlzTVVRITREAa4AHNMR7BNV8benelX3rRv6UQp0ahUbk5zxRGGapzTtc
 OA6Jm82z2ppE/iwIHp6o4xl9IKIQfH4XLHPLzZYDj99arTM7MNO1xVvvlUwcUgnMVM3MarYSABb
 8zoW94gejp25BtZs6jgjJVx004mSVLWej5LFYJQY1bKC7uYcHb9OCnPZARckXwSiNthYFzE8RdW
 fE2BuxZ1HzZXV6LIJfMo/wRcHE2iOHbo841EGxeKFp7glcXtoh8Vjsp9DGTyzH2oui+/FcUQli/
 21r/mCrMeX96L/bwmY+iEdGOdAZUCvyd0Je9jICso93GquHp6Da/ZAxH2EpXWzhXb4stLFm0SFM
 j/eUTAmpTsFaNNGIsmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfXxGSg+svMbSe6
 z0B5SMW+FsCoqjDAWsIOQdttYli1Pk5LqlCLKiDYf5HW8nVuDc9iAfumXutLF0VuqPyLXXU1OPL
 wMV5tDRwd3sNePrtX/5zrmcy5UUlISw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_005421_682566_411C5A22 
X-CRM114-Status: GOOD (  22.09  )
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

On Fri, Jul 31, 2026 at 10:34:00AM +0000, liutong wrote:
> In sbi_dbtr_read_trig(), the range check is:
> 
>   if (trig_idx_base + trig_count >= hs->total_trigs)
> 
> When trig_idx_base and trig_count are both unsigned long values supplied
> by S-mode, their sum can wrap past ULONG_MAX to a small value, making
> the check pass. For example trig_idx_base=1, trig_count=ULONG_MAX wraps
> to 0, which is less than total_trigs.
> 
> This allows the subsequent for_each_trig_entry loop to access trigger
> entries far beyond the triggers[] array, corrupting M-mode heap memory
> via CSR read-back writes and leaking M-mode internal state to S-mode
> shared memory.
> 
> Rewrite the condition as trig_count >= total_trigs - trig_idx_base. The
> subtraction is safe because the preceding check already guarantees
> trig_idx_base < total_trigs.
> 
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> Signed-off-by: liutong <liutong@iscas.ac.cn>
> ---
> 
> Previously sent as [PATCH].
> Changes in v2:
> - Added Fixes tag
> - Consolidated into patch series
> 
>  lib/sbi/sbi_dbtr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 01047969..eeab7d3a 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -572,7 +572,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
>  		return SBI_ERR_FAILED;
>  
>  	if (trig_idx_base >= hs->total_trigs ||
> -	    trig_idx_base + trig_count >= hs->total_trigs)
> +	    trig_count >= hs->total_trigs - trig_idx_base)
>  		return SBI_ERR_INVALID_PARAM;
Looks good to me.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

>  
>  	if (sbi_dbtr_shmem_disabled(hs))
> -- 
> 2.34.1
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
