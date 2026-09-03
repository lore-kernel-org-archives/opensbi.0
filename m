Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71F4C624A4
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNMXyIkiHBDksACm5AVHu4q99lpSlyNOG+ZwO5LigiY=; b=kAJXty1ZU2Socd
	wLi6XRuNTLPtZVUnDpHADwkNbIKg7fvIMYxNR0EcNnj6pCf+uqP4XOuoX9dpW+q3eFRCKBGkUT5m7
	c8wLHZOjx1tNsiVD1VrwV6R34n0oNayj5zjPv2qCCmN8nRkowzxIhcHTTqqkwsz2/d0hNqa4P58ZD
	zNtBscGhdITdWkQVFJGEx8+VB0JnKGmmHz10RPiiH+vKjvAnGRUSaV6xg3fVcM1CPOfr4rz/U6ZPZ
	7616uYI7cvf+ZF2yztElSkSt0t+reuaaNIkvOnKi40smrTigWQhcYuKa+J22lf/3nTWlZwnSMZfLL
	ycTvY9k/avBr9dcqF2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23KB-0000000Gsp3-1Ab9;
	Thu, 03 Sep 2026 09:01:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23K6-0000000Gsnp-45UV
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 09:01:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68382TnS3549516
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 09:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vk0MhvIs+zLqys4FYNgFgt9Q
	ZYbBK/SIGyNvvcv3FaM=; b=gztMrjS9Ph1mT5MO8Q1QQEQMFz6n61+O+5DiU2MO
	o1qI2iri2vxWL076sJe6WZYMV5IrWcWHjXz5UUFTOqwT+4138acHxaXcpNnMHsQP
	HEpSZeg+RObQzrBVu6aL29tAc6+DuGKeF/OTpDMxR0Lqd2Pg4dUCgciyKQZy03Jx
	ChMfceRqXQT/tnvfHKqT8JZ9dliU1mjGfPWDxbWFMYfqaVu7KohTV4Wiy7ckXTuv
	NHHaZ5GRjyKJKq5BnGv6HIdu+lnrF9g67ibafyKdoNEVFHl/lPP3/TQt7jHQJmAC
	sEPkBXNyis4WAB8yiDLlC6i86KFisEpR0aVKTCCzUitDhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m07vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 09:01:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so3078298a91.0
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426090; x=1789030890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vk0MhvIs+zLqys4FYNgFgt9QZYbBK/SIGyNvvcv3FaM=;
        b=fkBrJtXm5OEEHETfsqHAnTX9yt2teRssiPDaKi6Na2/MHSwvPZShFHlAsST0vP5Ley
         cHSa5jdqVF24kP5YN2asFO6csHjpttA7Qzwsl99b15fQEYl74u3nInP2oU7Ye6kOabMq
         MqToFS/jNjLZcb03eegobxi7ny/S793eRvZ41UEatzgTA+WxRpsbaEa1vtsUgB/PVJAZ
         sEDKv7CClMERlmkCPEevHXG8E4XhgCVoMVSkWsxfBt+YaqjAz0GI3/YkhiGkbw0WIRxd
         5fxA1BuiqSgc/V9m4zzsDvwZq4qAiHLtp8DYiKEAUOJdeK7fbeCvQInAsD12yOSvSASK
         2g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426090; x=1789030890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vk0MhvIs+zLqys4FYNgFgt9QZYbBK/SIGyNvvcv3FaM=;
        b=jEwBwrDKpPFsiOkJKd3qxG8sk5ecJQ4nHOz1Z6h8Ms0YyDS7nZ/6xux1Yd1kmBGQ30
         mlieVznCRC0E36Ps+1UGK5+aOrnzyJlsKfMI+9muNLnKnN7QkkNXin7ds04ZA2B/bHCx
         Y9/fvdIU3Mevthid4LpkwJczE/Ybz0dqxQ4Bihmbl2JumaEykUfeXOYzf0RbvpKKhD73
         r6RG0+werpafO4Kkq3UvJ7efy5HfBEvJIEDVmuK5fuVhZPyTyViHjp/p6o1av31HZg6w
         fq1BNAgO2EBfoC01E65Mja9VhWXxYS4WMb0OKNVMqmL9tpCPV02qgnoyNv7R5QXubwBH
         bqXw==
X-Gm-Message-State: AFuF++mDkL5xbNkTHhpnT2xYiKQVT0+0LVCOcr4XO40SgTOfW8n1qe9q
	OepsA82TJWOwPvP3fOmPnEbSzPMn07VCNAUgrihuL6/OSHnmJ8D9JUoEhdcJRjmIbPDfK6EePOi
	gGHYC3FQ13f69sRKIVOrbagi6kMlRwV/UGOaGK4dZi9jFTEzFuOIT9AHy2xNpvu7hIA==
X-Gm-Gg: AYBFou0UrASWSj0rUnI+qjK+C+FTmgzX9IAj8J2AFU6lz5LnrdED8EjdVi4o6SDck1U
	wljU3FqcdUW11nFECafjJnf9r1R6EEY+DaAOWwQBLG0NKxicmV/GrsURgWBTb4R2p65TKZzP9o/
	pCHjLF1Ubz6iCgb4De6Mmn9IVQAzJqgl6Gj5QJM+QCaO3T9YkJ4tUXiX0QGxV1gQqCMMglu8Ccq
	vyey1CgeuMPnMvpsmEDmtevgaZ2Azktp01I+cdMVdsYFB+6vMaHtQNwCFNk28Mq5Kr21V5zDVAT
	7Fia4FIQBaMbKy/9zNuqy7Y/MI1nimZ6xRkY3455LSH5fKw0WYXNEQC5ndi3340MYYqJ7n7YX8V
	smCuqUVSeLmXS9dDPZnbIfRtE4G7kqMZqymoQRyWT7buXma0bjZsm/SafCe8C9EnoivqXO9X0IB
	QDU9uPM2W0dtWQsfbDi0NlfFoG
X-Received: by 2002:a17:90a:c106:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-39aedf1a98dmr17567147a91.7.1788426089619;
        Thu, 03 Sep 2026 02:01:29 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-39aedf1a98dmr17566988a91.7.1788426088986;
        Thu, 03 Sep 2026 02:01:28 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm6825269eec.0.2026.09.03.02.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:01:28 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:31:24 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rahul@summations.net>
Subject: Re: [PATCH v2 3/6] lib: sbi_dbtr: use range check for shared memory
 domain validation
Message-ID: <apk3ZCJv9cupAzTL@hu-himchau-blr.qualcomm.com>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
 <20260731103405.1535818-4-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260731103405.1535818-4-liutong@iscas.ac.cn>
X-Proofpoint-GUID: JsR6bjfnoJs1gRZEKsLkYLIBijy-ZgJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX4NLwNkxc4nlJ
 /rovbS+yAHBYy8aP+qu6hiEkkgiIpQVS6eTKEjtMk7j9TrbsNvMFMgDhZ61qs6pYivy6qBi/Pcu
 DPVsM4YNXl5H+VhRDLaaQHcPcyWvHq1/uTA1eS4c6b2H14j8NhbLzWiQ5SVaYf6rEtMRlFhr430
 VLnn20z8fvi5NE62DKxRcWKe6fM/Q0u4ZBVw+J9yxPwdIRDQRHtL67URQHspmmzE7UP+enjp32G
 QphtePX37Vl1chM4TQ7CfiHY0rbFSLIBz9gNoy3Cj+ohLsO+aJ18o5TfY8xvE/JfX8H2h70ViIc
 qofBHlisPGiQ9miYgUhI2lYG1EymiFqCrsnuSN7DoXaTl8N4MB6P5KxNjMd/hJG0KIcOGvbjNyK
 dX97lo9WEehZnz7TB3dsFB5Dc7SpySybLRf5euXX83JOj5muLSl6LiEpl4jSUFVsZZSmQpYNHvS
 n5s9McqrYeAIoFYukeQ==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99376a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JfrnYn6hAAAA:8 a=uENH4uCP8t6hC4V70CsA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXz5S6zAu+xSb/
 d4KKDvI/hWDIo7TvqOSG54D0W3lqVOko+zgYQ+F2UjPdK//2LRQeGN9Hr9rbeb92yYzsyu3Ltel
 4oSow1nb5JrhhgoWUjcC26eNcrKORIs=
X-Proofpoint-ORIG-GUID: JsR6bjfnoJs1gRZEKsLkYLIBijy-ZgJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020131_012846_4B4DD4C9 
X-CRM114-Status: GOOD (  24.64  )
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

On Fri, Jul 31, 2026 at 10:34:02AM +0000, liutong wrote:
> sbi_dbtr_setup_shmem() validates the shared memory address using
> sbi_domain_check_addr(), which only checks a single address. However,
> subsequent DBTR operations (install, read, update) access up to
> total_trigs * sizeof(sbi_dbtr_shmem_entry) bytes starting from that
> address.
> 
> If the shared memory region spans a domain boundary, accesses beyond
> the first byte could violate domain isolation, allowing S-mode to
> read or write M-mode memory through DBTR operations.
> 
> Replace the single-address check with sbi_domain_check_addr_range()
> to validate the entire shared memory region that DBTR operations
> will use.
> 
> Fixes: 23b7badeee3c ("lib: sbi: check incoming dbtr shmem address")
> Signed-off-by: liutong <liutong@iscas.ac.cn>
> ---
> 
> Previously sent as [PATCH v2].
> Changes in v2:
> - Added Fixes tag
> - Consolidated into patch series
> 
>  lib/sbi/sbi_dbtr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 5cca0922..b0f1019d 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -304,9 +304,10 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  	if (shmem_phys_hi)
>  		return SBI_EINVALID_ADDR;
>  
> -	if (dom && !sbi_domain_check_addr(dom,
> -		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo), smode,
> -		  SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
> +	if (dom && !sbi_domain_check_addr_range(dom,
> +		  DBTR_SHMEM_MAKE_PHYS(shmem_phys_hi, shmem_phys_lo),
> +		  hart_state->total_trigs * sizeof(union sbi_dbtr_shmem_entry),
> +		  smode, SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
>  		return SBI_ERR_INVALID_ADDRESS;
>
one nit pick: The dom && guard means the range check is skipped entirely if dom is NULL. Since you are
trying to close gaps, I would suggest that you add a check for dom.

Regards
Himanshu
  
>  	hart_state->shmem.phys_lo = shmem_phys_lo;
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
