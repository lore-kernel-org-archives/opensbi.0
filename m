Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933D3CD3430
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3crMORh9a6/j2QFrpEPKtzy3672FevreJg7AD8GxGU=; b=qHy1fVz+krVo9/
	O6XDShMnLODXXI/ZtuVxcAzHYvbmJtfS0RlH9stS/gMgL7mZvmof2pyJamcOh2JB39yNX1HRmqexw
	Dk0RIa8Q7DfUOAQgU54mm0t6E+RvUchavKP2yjv8l/BbLaZMsqof4w8Bn1knY8SmxWl/ZWwLiHyCq
	d6inTN8pmQMyZn79bTP5GpSW8ltx61bZ2NL6gp/2TmlsMHEive+qQYruk1G1kgEVBBzCJkmyI2EGf
	d5n3O23pnsiPJPMEUyGPOVKOt4YPS7qQGeAgSnM4vYxswfhtNaKizqtunhIywIbCdVp8Qq/NVg6yN
	etsWf83xd/GW8A8mpSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJupn-0000000DYCH-1hq1;
	Mon, 04 May 2026 15:03:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJupk-0000000DYBc-35me
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 15:03:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DlKsk366547
	for <opensbi@lists.infradead.org>; Mon, 4 May 2026 15:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h3pbkS2i5sZwgllpF6fSZ7Cw
	I3P2FhlBjfX4+FtGzJQ=; b=ZNP0RLYAtIG4XY5nZxIT5K58ElSqTegjRS/3EA6f
	ayWTiTgoTt1g6rEZGzJTyyOQx8HPxyOlL+iKiAWQOv1zL1nfAo/pkzT+eJJujKmS
	BkMrKco6Xe+QdjydVLgoxQew8FxB2NS0kpDdv+h0TMIqwnF3R1jqm3/T2OFLK0mD
	FSiwMl15l3tGVjKvNeO9HVWVq/E6bSg01VjROepXHLDA1QmeUqgGrPYOydTABxGs
	asgHURLPSt1rGD9g7sIBbTc0qoBJkDj/XHhNX+5E4MM77dQBxZ/nP9cAc1lUlvbb
	/+HEMuc+o07SFEiJiuG4DsAzedqb7JZhNgn1bBiEC+StxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6r961-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 04 May 2026 15:03:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8375e2df478so421490b3a.1
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777907023; x=1778511823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3pbkS2i5sZwgllpF6fSZ7CwI3P2FhlBjfX4+FtGzJQ=;
        b=cN7n1V9zaaYtlSBQuvKHp1B5mffqSro+83HCKTs+20ENwN/oQXHciH2M2pNWFbVg0i
         GOqr+cDawtnp5cKvGJc+wmq/HEfIJSUX3O3uQECKr5LL2JNGx4J28qQx2La7CPqgmLlj
         cgS852UpKpv00AY/IzXaWIQ1WR0Gsqg/CMHOeqeAapAvM//2p24gSSD2OQJG/wgQJpU7
         vZofEspJ0hCl5bmoUIbPXTEGtzCIYhp5CVlF5LR9VHhTTitU3RMt93oMmnh2uydmPfLW
         aWJV9bGH8y9WbwhG+17CPJFvU80ciyo4dGe8zpp3tevAcuseexTx2iNd6vwwvR8FiInF
         BeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777907023; x=1778511823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3pbkS2i5sZwgllpF6fSZ7CwI3P2FhlBjfX4+FtGzJQ=;
        b=U9VONSZmOfdCDGDPjB+jVE5yK+GeCW1b2XIAACE+8fyi0Sij/8tFk+d+kWWxLFsenN
         E1gBOIjii1DvETRyHiB4YS8BoiIXkbK7krxSxkiWt/1b2iTgFprrVp8dQ+qwlzWHBufL
         +iL7yFZERoQ4tRofjFp4/xlTrsE/6XnBcfdgMtjh6XLJGQ0ov93+7JuMtHKsCzSmriMu
         RYy8SyTyQmNMMufjaTAqbLJy+KO2u5KtBw2UPEm7HkxsVppycPF8ikG3cvaQ2snDQdmw
         L9AsOdHkLTtVn8K9KHQKMhhA2ZfHJJGT81ONMIKeDAocom1W4D5G1nenc8SAnQpaW58/
         pTXA==
X-Gm-Message-State: AOJu0YwI5vb2IJe/2U2QUUYkbzQ7kCAi/UsBSyC9dP7LQztGv7OIUxO9
	3u0rlVIVUXyxSbeGoUseP5TC0uSEXCuI11XoPpnDD7YvSkoNo00xMM1+/PM+r9Cb1vPDSx73fxP
	FCanCSSdrnGNfsiQt5ly43Tv3ZCY8X3jMYWcJSdIufZMEqTK8lUo5xw9Yn66JlMZnEA==
X-Gm-Gg: AeBDietfrYW7x28/1rsudRwTpcTxr8kmKmSTuY3o2Nvvzm2dcYRCW9xqwFFXXpO3Xzl
	TCl+xodgAXRLyirn0TNzVXDN6i64xrRav96/soWbJW/hz0Ex0kboc03nhdUIoDNYzNIGHh1aDR5
	NnsUCtQSLEUG53KGV/Y9sPAVmB8Uf6Bdhx7gKZqKPDf3Z9fImEvdVJViVYU3in2+cNrTLKHi2mF
	P0xeTJCsHYoMvOuDa55qdSz8y2H6I2M4a1odBCzTafS09+f1Be88P6h+pyDcZPj/z2SeNcEyiYQ
	5xoMBDy6L2PWiuqIMoo9gBpvja0EF//dYp8GWMMx0aXoBTI8M6amqfq8LJ3eMNsRWd0vQ3uqa9Y
	xsNYTWpEGH6FUmrgJhnuRjrWAQW1bvwGeTJPJvX3jBQfoSBbIhJ70UWayUPA3RhZctmqIVYNKVK
	PxlBdhw+p1G217GTmP7/hkX/GSUAr72q4SypArUA7ZrXVsxSIPD0xabSxK
X-Received: by 2002:a05:6a00:9088:b0:837:d746:8e1a with SMTP id d2e1a72fcca58-837d746928fmr3131025b3a.22.1777907022340;
        Mon, 04 May 2026 08:03:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:9088:b0:837:d746:8e1a with SMTP id d2e1a72fcca58-837d746928fmr3130932b3a.22.1777907021618;
        Mon, 04 May 2026 08:03:41 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad9045sm11600074b3a.28.2026.05.04.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:03:40 -0700 (PDT)
Date: Mon, 4 May 2026 20:33:35 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 03/18] dbtr: Fix endian conversion in trigger install
 handler
Message-ID: <afi1Rxk7uotH8JJm@hu-himchau-blr.qualcomm.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313051948.4017134-4-npiggin@gmail.com>
X-Proofpoint-ORIG-GUID: ucnG3A3xpQsYTJ6YjIYMGjY5BRFej57c
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f8b54f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xZEW40C7D4GUCHVzt_YA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ucnG3A3xpQsYTJ6YjIYMGjY5BRFej57c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX0IMlr8F2BJAg
 +JGxEH4mtRe+tnjxK3MmzCA9GXgOasv/IjzLkg0ooaU3MmgEVk1QeHQvPzKTU+su4wl3FRVJOfB
 Zh7J0eD6eokU0TjbSO+T9gBK2c5n5bD0wRwwKhdkGcTkVFnrFXNYMYJaqxFwRXr9sX1xWedVdOb
 5/0PCj8SqYMTf2/lIA2Cx5a0zoIkCCHMOySSQIUBYTqa43zGVXkNT5N/cSnW16W1RF3oem78ZkH
 Af1sB2js3TiirTXz3MX1Q9ACaN64Ox7cjZfdwMkRzBhd8YNK9B55WP14T2folx6u+OG3EINaSyC
 +GlhPcb1WhHNM2cTR6oIFaG5sMwR4f+Tf+0nndWEJGT1NL85ILikCGkK/17S2h96tgT5CvhBAgm
 Uqw3p62z4gD8VT+C1hoMgB55zgF3Kvswwj2L9rvtxYR6x/9OhX9yqqEIlKCKma0uGXkK1Hqzu77
 O/IHYEFRPVSyT6ARvZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_080344_931446_6E3ADADE 
X-CRM114-Status: GOOD (  18.54  )
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

On Fri, Mar 13, 2026 at 03:19:32PM +1000, Nicholas Piggin wrote:
> An endian conversion was missed loading tdata1 from shm. Add the
> conversion and change the variable name from ctrl to tdata1 while here.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  lib/sbi/sbi_dbtr.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 8f59e407..10ed6b3e 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -589,7 +589,6 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	union sbi_dbtr_shmem_entry *entry;
>  	struct sbi_dbtr_data_msg *recv;
>  	struct sbi_dbtr_id_msg *xmit;
> -	unsigned long ctrl;
>  	struct sbi_dbtr_trigger *trig;
>  	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>  
> @@ -609,17 +608,19 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  
>  	/* Check requested triggers configuration */
>  	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
> +		unsigned long tdata1;
> +
>  		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
> -		ctrl = recv->tdata1;
> +		tdata1 = lle_to_cpu(recv->tdata1);
>  
> -		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
> +		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1))) {
>  			*out = _idx;
>  			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
>  							trig_count * sizeof(*entry));
>  			return SBI_ERR_FAILED;
>  		}
>  
> -		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
> +		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
>  			*out = _idx;
>  			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
>  							trig_count * sizeof(*entry));

Looks good.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

Thanks
Himanshu

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
