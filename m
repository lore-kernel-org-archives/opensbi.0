Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79062C982DA
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 04:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcmbOKWmc2nb0UizcF+2jJXMUGAclH2iQqNNdQZsX8s=; b=3ikJiEnDeroqFn
	gCgo1X9iVXufTEbg9t3DdnISCyS8iCiZhydRMjurVJkgeQtZPaYCk8MbstcDDCRZpYQEkSGPSuKAE
	e1PsdsWdIWiI9PmrcKjoLWBsuTEUlQLzIrFm/D9S7f8UFaRtLvZTJEavywpPW1Irep8ijzSLEETr4
	l9lnLXWQbBZC4/uu1kDJ1bR7JK5SgMo9Q0DwB15S+4rKE+H9l3B1/GcTw54DefT6aT4nESQjJ8NsM
	TbMA5HKWz/+hRPdx1bHgon1EV1Z2OTmnSldrOTvfls10bGEwZ9OMcMXnXsQxAfDtw3/GrU5b+ZBRz
	N2HeRTLgbFC5xMyZRpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8W4k-00000000roE-1aO0;
	Mon, 21 Sep 2026 04:56:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8W4h-00000000rnc-2KC8
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 04:56:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4Jsxg002475
	for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 04:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xbDb0qnriXzm0bUpDQUC+tel
	Rxtw4H86YtoVynk2lwc=; b=gcaXKNGthZStQMwkqsMofS7E7gfCIAclzxvZXGUN
	kQyEgugJBtgQfARfZaLX0iIGGnqKS5YYR6LV+ZUegQtXwsVRkYKoAgUYg1JsFsae
	sRsrmIZWak0zW9y3vDYJfd09K0SWfF3brikEIRnvIqWm+lGuZO5diuU/b04V+qXs
	tulZkknrZHnsVNgGU0s/V4YOsh8453Sea/ZcReBmJzHB2z8iraHGmXda/b7zG3Sc
	UIOwOz9dRXBAJcgkgT5dCXdu+WuXs3yJPyd/MXrbdeiwpksfU3+pOUKsNEQud9H9
	R2iVgT0uLWYzJZXjhX10HkrnWfkMycCpQ57MD9w1T9xpWA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5g366-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 04:56:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-85f1f3620bcso3375495b3a.0
        for <opensbi@lists.infradead.org>; Sun, 20 Sep 2026 21:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789966576; x=1790571376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbDb0qnriXzm0bUpDQUC+telRxtw4H86YtoVynk2lwc=;
        b=CB7w831/JNNOio5IcpB2GmrjzqkqMMjrPrNr4cQiUX+bSujPx6RM5D8TAWLlP6pYMC
         2V/0yyLSXU0XAJvyyXIVR/eeI61K81ifjpQnA8pFuuVm5q2/cxfrkAd3igeeQ4IeJmlO
         3rHnzMiSvXczXmGOI6qP75TqGFsfJKpowmmd3vxmToq0XzvpEBqw0ERHVsELwAc2AWz9
         bQ3Lgk5xjdBabx6+V3oxDhSx/5N3VUSuUGoOnw+Yd2/KSz+GBFF3Mqv6UkGIf2qSJ3dn
         geNXzeRtifBYHT4qLZ57digAfZ4rbPgXVXRxVZt+zObrbVewgByWFxX21FVqffQ1sCUd
         g0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789966576; x=1790571376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbDb0qnriXzm0bUpDQUC+telRxtw4H86YtoVynk2lwc=;
        b=ODyXuxO5ZbG4vBco0TkFSaSc5wB2vI5EToNBenadUoPpheyJcLbDHmVu+sb/JJAeyG
         JRYukF9FCHNv7vqnlaLE3MhIRWa5s3Xb4oPyqObIE8UBVsxTOqD2Hx3Tmi4b2ZIglzLF
         26DpmrdV+TUg1T0YDDkxmu0tLjc7ycS5rd/J+vJAU6LYh+W/8DB38d/MchCRKu0scrBM
         XcBDFHAvr31X3oSUO9YoctdY4BbK91zBcjp1UciTPNbVCJrCLhD7lnSOafqnYImUxiyl
         H3wCK/EiM72AkCWgihRAvj/24ixtOQXuqRyx1sv/Hc0PuqJ/dUuT5tvG2Zk9b7zbc4aO
         xfIw==
X-Gm-Message-State: AFuF++nqvz1bY2o2d9RdcBFQDo/hCor4Fmq38zd5RK0uzi8WwyNEQLha
	RtnSPUuMMrEl5AR701m/vuV0HZZBWS68eETY84QaVsvNC3/IQp5RWH9cYbzqVPJt/3y6jWr29KQ
	DZkUg9cWshC6ag58UuFOrnnIMUbDzb2/zmMKR2VmOjZZzFrLwHEgBFV08xO/DlFc5yXEpuAgLXg
	==
X-Gm-Gg: AYBFou0VOcplKPhWSEwINXMGsOMIA0dXFFe14FBHaEdP+tZw+NPBSaMxexmKE6vUXwK
	JLByaClHLrs/IXl7P33PEL2s8Nv8+Yw3H8gqPuIkR/xkz/Jtls8mamcag2NDJnsplvgCjBgfWR6
	NOWtAyM2W9be8DeagesT2OSrPhM1UCyuwyTo9pf+y93PiKerdZprPnguXiofIRJL1YHpVgpSf/N
	cAuUcyAZ7kvRvRKxoq0vgCsQtXYSj4Hs2aLWOGu5oH7JucakKVdWds6kb4EuVdfU8XSTh85pVJi
	hbHhPFO1TARQHEE2+rMzmc2tzl6Ty/68u3LerUoMzG98gDGmf3S8v6A39727H4V7OCYCCkTqPXA
	NbfvPmgFfGtYA5L1jNCtsLC+zlRN47hRdvJKhV+6SzL9am0ebPU5VWFlxnj/aJUemzV4WZO9lvk
	ey7/J5IlqCyVeW3iKmMxM+CvE=
X-Received: by 2002:a05:6a20:6a10:b0:3dd:85ba:acc with SMTP id adf61e73a8af0-3dd85ba2550mr13068290637.31.1789966576224;
        Sun, 20 Sep 2026 21:56:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a10:b0:3dd:85ba:acc with SMTP id adf61e73a8af0-3dd85ba2550mr13068271637.31.1789966575616;
        Sun, 20 Sep 2026 21:56:15 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm13583069eec.28.2026.09.20.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:56:14 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:26:10 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, david.garcia@aheadcomputing.com
Subject: Re: [PATCH v3 1/3] lib: sbi: dbtr: fix shared memory double-fetch in
 install_trig
Message-ID: <arC46lcup9dUBEoc@hu-himchau-blr.qualcomm.com>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn>
 <20260910052958.3365324-2-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910052958.3365324-2-liutong@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0b8f1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QOBcizsE-Ndm2d3Ph2UA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: PR5Wrjt95EAQ5s7tDIjoOGpfi3IXiVhR
X-Proofpoint-ORIG-GUID: PR5Wrjt95EAQ5s7tDIjoOGpfi3IXiVhR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA2OCBTYWx0ZWRfX2NfktgXw//63
 QyMXNjMpH4prCFfOb93qF2SEfvz2xXI9L86IlLTDO1gx1FsvamkzuuFju6b6BSVhX+vPN5GR9cY
 1OBqC1NZHqxjLLfOuWiQv+wI/8dzYsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA2OCBTYWx0ZWRfX4pgxrCza7Mle
 rB7VaSRWvC+DpXjiQBrX2HGThUw7lvRbvCxl9w8uEEjB3d4jgh4bqxD6N6eW6dh2pAMmsVhM0LD
 GH/Gqpr3kQSmqvGwNvObXKkHCYmMgHEhtwg8HTEKd4uDumvfVIm8yVNSEDzeMyqvfLD6QGGStms
 1Rkl6X5YuTabL4GAi2KiAKfCzZMruya7ZIKLIO+Gbk3iXxWTXlTxl+9CH/aHPr27kaS/B3Xsivo
 UJJZmx9X6684rscHG5i6wUUO/W2KhrphPkCog6F2hjV5pt9j/3RP2NtE3JfCcEh3GGsTsX3pBge
 Rp4EnVIxVe/oAQAiMTIKMmNxwiKmNcu0mEVxBMfOCmJPFqu4HclROm1vzEt6gZkPM69qAMUhac5
 0h7e0/r/rCzTuo2P/jfypb5ky53MRp7qd2VdbeVqs0ojIW4lnQQOEQQ3O2oQZMZ39ShJ0CqVeZB
 wZmyq1o45nNN0u9viog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_215619_720678_911A3BEF 
X-CRM114-Status: GOOD (  47.06  )
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

Hi Liutong,

On Thu, Sep 10, 2026 at 05:29:56AM +0000, liutong wrote:
> sbi_dbtr_install_trig() reads each trigger configuration from the
> S-mode shared memory in three passes: the configuration check, the
> dry-run slot allocation, and the install loop. Each pass re-reads
> entry->data, which S-mode may write in between, so the configuration
> that gets programmed is not necessarily the one that was checked.
> dbtr_trigger_valid() does reject the M-mode enable bit, but it can be
> checking a different value than the one installed.
> 
> Copy tdata1/tdata2/tdata3 for the whole request into a local array once
> and run all three passes against that copy. The shared memory is then
> only read while taking the copy, and only written to report the
> allocated trigger indices. dbtr_trigger_setup() takes the decoded
> values directly, which also covers what dbtr_find_free_slot() and
> sbi_alloc_trigger() are given.
> 
> cfg[] is a fixed size array, so trig_count is bounded before anything
> is copied into it. total_trigs cannot exceed RV_MAX_TRIGGERS, so
> rejecting trig_count against total_trigs bounds cfg[] too. Rollback
> records the installed slots in a u32 bitmap rather than an array, so it
> needs no bound of its own.
> 
> The loads that fill one entry are not atomic, so a second hart writing
> the same page can still tear an entry. That does not reintroduce the
> problem here, since all passes then agree on one copy.
> 
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> Signed-off-by: liutong <liutong@iscas.ac.cn>
> ---
> Previously sent as [PATCH v2 2/6].
> 
> Changes in v3:
> - Rebased onto current master. The v2 version predated the per-slot
>   capability matching and the dry-run slot allocation, so it no longer
>   matched the function it was fixing.
> - The copy is threaded through dbtr_trigger_any_hw_supported(),
>   dbtr_find_free_slot() and sbi_alloc_trigger(). dbtr_trigger_setup()
>   now takes the decoded values instead of re-reading the message.
> - Preserved master's SBI_ERR_INVALID_PARAM vs SBI_ERR_FAILED
>   distinction for the invalid configuration case.
> - Rollback state is a u32 slot bitmap rather than an array of installed
>   triggers, so the out-of-bounds write that was a concern with
>   installed[num_installed++] no longer exists.
> - The bound is now "trig_count >= hs->total_trigs" returning
>   SBI_ERR_BAD_RANGE, the same shape as the check in Pengpeng Hou's
>   "lib: sbi: dbtr: validate complete shared memory range" and in the
>   DBTR error code rework, rather than a separate RV_MAX_TRIGGERS test
>   that would have collided with both.
> - Noted in the commit message that the loads are not atomic, and what
>   that does and does not mean for this fix.
> 
>  lib/sbi/sbi_dbtr.c | 169 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 104 insertions(+), 65 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 7e4ddd98..e9135ba5 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -392,18 +392,15 @@ int sbi_dbtr_setup_shmem(const struct sbi_domain *dom, unsigned long smode,
>  }
>  
>  static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
> -			       struct sbi_dbtr_data_msg *recv)
> +			       unsigned long tdata1, unsigned long tdata2,
> +			       unsigned long tdata3)
>  {
> -	unsigned long tdata1;
> -
>  	if (!trig)
>  		return;
>  
> -	trig->tdata1 = lle_to_cpu(recv->tdata1);
> -	trig->tdata2 = lle_to_cpu(recv->tdata2);
> -	trig->tdata3 = lle_to_cpu(recv->tdata3);
> -
> -	tdata1 = lle_to_cpu(recv->tdata1);
> +	trig->tdata1 = tdata1;
> +	trig->tdata2 = tdata2;
> +	trig->tdata3 = tdata3;
>  
>  	trig->state = 0;
>  
> @@ -677,19 +674,30 @@ int sbi_dbtr_read_trig(unsigned long smode,
>  	return SBI_SUCCESS;
>  }
>  
> +/*
> + * Trigger configuration decoded from the shared memory. S-mode can write
> + * the shared memory at any time, so a request is snapshotted once and all
> + * later passes work on the snapshot instead of the shared memory.
> + */
> +struct dbtr_trig_config {
> +	unsigned long tdata1;
> +	unsigned long tdata2;
> +	unsigned long tdata3;
> +};
> +
>  int sbi_dbtr_install_trig(unsigned long smode,
>  			  unsigned long trig_count, unsigned long *out)
>  {
> -	void *shmem_base = NULL;
> +	struct dbtr_trig_config cfg[RV_MAX_TRIGGERS];

I am skeptical to take big structures on stack.

> +	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>  	union sbi_dbtr_shmem_entry *entry;
> -	struct sbi_dbtr_data_msg *recv;
> -	struct sbi_dbtr_id_msg *xmit;
> -	unsigned long ctrl;
> -	u32 claimed = 0;
> -	int slot;
>  	struct sbi_dbtr_trigger *trig;
> -	struct sbi_dbtr_hart_triggers_state *hs = NULL;
> +	struct sbi_dbtr_id_msg *xmit;
>  	bool tdata2_impl, tdata3_impl;
> +	void *shmem_base = NULL;
> +	u32 claimed = 0, installed = 0;
> +	unsigned long i;
> +	int slot, ret;
>  
>  	hs = dbtr_thishart_state_ptr();
>  	if (!hs)
> @@ -698,10 +706,29 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	if (sbi_dbtr_shmem_disabled(hs))
>  		return SBI_ERR_NO_SHMEM;
>  
> +	/*
> +	 * This also bounds cfg[], because total_trigs can never exceed
> +	 * RV_MAX_TRIGGERS.
> +	 */
> +	if (trig_count >= hs->total_trigs)
> +		return SBI_ERR_BAD_RANGE;
> +
>  	shmem_base = hart_shmem_base(hs);
>  	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
>  					   trig_count * sizeof(*entry));
>  
> +	/*
> +	 * Snapshot the whole request before looking at it. These loads are
> +	 * not atomic, so a second hart writing the same page can still tear
> +	 * an entry across two messages it wrote, but it can no longer make
> +	 * M-mode install a configuration that was never validated.
> +	 */
> +	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> +		cfg[_idx].tdata1 = lle_to_cpu(entry->data.tdata1);
> +		cfg[_idx].tdata2 = lle_to_cpu(entry->data.tdata2);
> +		cfg[_idx].tdata3 = lle_to_cpu(entry->data.tdata3);
> +	}
> +

The copy and the basic sanity check can be combined here.

>  	/*
>  	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
>  	 * programs a non-zero value into an unimplemented optional CSR. Only
> @@ -714,48 +741,41 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	tdata3_impl = tdata_implemented(CSR_TDATA3);
>  
>  	/* Check requested triggers configuration */
> -	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> -		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
> -		ctrl = recv->tdata1;
> +	for (i = 0; i < trig_count; i++) {
> +		unsigned long type = TDATA1_GET_TYPE(cfg[i].tdata1);
>

This check can be moved up in the previous loop and fail early.
 
> -		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_FAILED;
> +		if (!dbtr_trigger_supported(type)) {
> +			*out = i;
> +			ret = SBI_ERR_FAILED;
> +			goto out;
>  		}
>  
> -		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_INVALID_PARAM;
> +		if (!dbtr_trigger_valid(type, cfg[i].tdata1)) {
> +			*out = i;
> +			ret = SBI_ERR_INVALID_PARAM;
> +			goto out;
>  		}
ditto.
>  
> -		if ((recv->tdata2 && !tdata2_impl) ||
> -		    (recv->tdata3 && !tdata3_impl)) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_NOT_SUPPORTED;
> +		if ((cfg[i].tdata2 && !tdata2_impl) ||
> +		    (cfg[i].tdata3 && !tdata3_impl)) {
> +			*out = i;
> +			ret = SBI_ERR_NOT_SUPPORTED;
> +			goto out;
ditto.
>  		}
>  
> -		if (!dbtr_trigger_any_hw_supported(hs,
> -						   lle_to_cpu(recv->tdata1),
> -						   lle_to_cpu(recv->tdata2),
> -						   lle_to_cpu(recv->tdata3))) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_NOT_SUPPORTED;
> +		if (!dbtr_trigger_any_hw_supported(hs, cfg[i].tdata1,
> +						   cfg[i].tdata2,
> +						   cfg[i].tdata3)) {
> +			*out = i;
> +			ret = SBI_ERR_NOT_SUPPORTED;
> +			goto out;
>  		}
>  	}
>  
>  	if (hs->available_trigs < trig_count) {
>  		*out = hs->available_trigs;
> -		sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -						     trig_count * sizeof(*entry));
> -		return SBI_ERR_FAILED;
> +		ret = SBI_ERR_FAILED;
> +		goto out;
>  	}
>  
>  	/*
> @@ -763,45 +783,62 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	 * is installed if any of the requested configurations cannot be
>  	 * matched to a free hardware trigger slot.
>  	 */
> -	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> -		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
> -		slot = dbtr_find_free_slot(hs, claimed,
> -					   lle_to_cpu(recv->tdata1),
> -					   lle_to_cpu(recv->tdata2),
> -					   lle_to_cpu(recv->tdata3));
> +	for (i = 0; i < trig_count; i++) {
> +		slot = dbtr_find_free_slot(hs, claimed, cfg[i].tdata1,
> +					   cfg[i].tdata2, cfg[i].tdata3);
>  		if (slot < 0) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_FAILED;
> +			*out = i;
> +			ret = SBI_ERR_FAILED;
> +			goto out;
>  		}
>  		claimed |= BIT(slot);
>  	}
>  
>  	/* Install triggers */
>  	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> -		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
>  		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
>  
>  		/*
>  		 * The dry-run above matched every requested configuration
> -		 * to a free hardware trigger slot, so allocation must
> -		 * succeed.
> +		 * to a free hardware trigger slot, so this cannot fail.
> +		 * Unwind instead of relying on that invariant, so that a
> +		 * later change to the matching logic cannot leave a
> +		 * half-installed batch behind or reach the NULL
> +		 * dereference in the index write-back below.
>  		 */
> -		trig = sbi_alloc_trigger(lle_to_cpu(recv->tdata1),
> -					 lle_to_cpu(recv->tdata2),
> -					 lle_to_cpu(recv->tdata3));
> +		trig = sbi_alloc_trigger(cfg[_idx].tdata1, cfg[_idx].tdata2,
> +					 cfg[_idx].tdata3);
> +		if (!trig) {
> +			*out = _idx;
> +			ret = SBI_ERR_FAILED;
> +			goto rollback;
> +		}
Since the dry-run succeeded, the sbi_alloc_trigger will not fail here.
>  
> -		dbtr_trigger_setup(trig,  recv);
> +		dbtr_trigger_setup(trig, cfg[_idx].tdata1, cfg[_idx].tdata2,
> +				   cfg[_idx].tdata3);
>  		dbtr_trigger_enable(trig);
>  		xmit->idx = cpu_to_lle(trig->index);
> -
> +		installed |= BIT(trig->index);
Not needed as said above.
>  	}
>  
> +	ret = SBI_SUCCESS;
> +	goto out;
> +
> +rollback:
> +	/* Undo the batch in reverse order of installation */
> +	for (i = RV_MAX_TRIGGERS; i-- > 0;) {
> +		if (!(installed & BIT(i)))
> +			continue;
> +
> +		trig = INDEX_TO_TRIGGER(i);
> +		dbtr_trigger_clear(trig);
Rollback doesn't make sense because of dry-run.

The basic premise that the read/write between S/M mode is not atomic and other CPUs can
still overwrite other CPUs' state is still not addressed. The current CPU can't do anything.
So looks like a S-mode problem we are trying to solve in m-mode without much gain.
Looking at the sheer amount of code churn that this patch does is too much.

A new patch series which merges the sanity and just the allocation of triggers in one go and installation
on another would make sense.

I would NAK this patch.

Regards
Himanshu

> +		sbi_free_trigger(trig);
> +	}
> +out:
>  	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
>  					     trig_count * sizeof(*entry));
>  
> -	return SBI_SUCCESS;
> +	return ret;
>  }
>  
>  int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
> @@ -911,7 +948,9 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  			return SBI_ERR_NOT_SUPPORTED;
>  		}
>  
> -		dbtr_trigger_setup(trig, &entry->data);
> +		dbtr_trigger_setup(trig, lle_to_cpu(entry->data.tdata1),
> +				   lle_to_cpu(entry->data.tdata2),
> +				   lle_to_cpu(entry->data.tdata3));
>  		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
>  		dbtr_trigger_enable(trig);
>  	}
> -- 
> 2.34.1
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
