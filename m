Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04226CD3430
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rm/yuWrGB7PZvp5ORz3XB0Z14V1pK04d0kE35rd2qLw=; b=dWsdfcB+wyzKKJ
	m1GH44W3bpTs8LcwOVMulE3Sig2gmIJXtis2hJoCMoHo46Ps+ZWYxT2vsSOR2HTtj85OfdoGWyxv/
	FeKsAUhiIWdfSgZjIjQhRb1zE3kXN1yLvw6SrQUOFA/Q9Z6Plh3T9W/Vc5ugOv6SR1JwDTFNBuZXB
	8/BZctK7nQiS/FRM82oEAuErkfVKKX7srW3arjqbShj3REr0ogSZm35YGoC+UeO1igtK1J3vXt0fV
	w40YWfbKbiOxzIz/H3BIUCB/6v5m3CUIzf3P60b3l1uiHNyJ7At28dB741JJmIX8EGgyA1AVKY4kP
	Js//CUAMY0y/C30CSqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJv12-0000000DZXh-1uXz;
	Mon, 04 May 2026 15:15:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJv10-0000000DZXB-1MWx
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 15:15:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644ELnst1960499
	for <opensbi@lists.infradead.org>; Mon, 4 May 2026 15:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PnkYyZQdAKaasgVZJN2/XMlj
	WKgyrCDqJzs7a3JA/LE=; b=IHHqRWOu8Acb9kkA3LqYBjoD8WRD/pZnImlr+2ak
	RNJ3Qie5m+KrmgAzwL8Xe5yZm4sosyz7EuEYCJgEWieZzEYMy0meDb9j6c8cHKnk
	Q6q2JsK9L2NdWka9YY1u/CPQIHaqzKPNCXILfOWizAPj+7CBEN5jVIVuNQbqD9Lz
	93HLNI75Gr81xT0ZYQK/8fqY0xN0oqoGvlSQNbWX58AulpY4Lv2775nbKJYauftv
	Q9qlpD6av+jL1RaX1cG9ioLFW01al3sx7pL4hBPDCVBlSIwzPBCcE0ZMaYzb6k9L
	8w8dJ4cNJAJNOLdoZilJ4/25b0AL2SGgiinu2A3EfYTa7A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dr80g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 04 May 2026 15:15:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c822ebaa40dso268692a12.0
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777907720; x=1778512520; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnkYyZQdAKaasgVZJN2/XMljWKgyrCDqJzs7a3JA/LE=;
        b=Tm3bGs9jyJH5LGpwk4bkbLHgoGBWYJHL8lLGeyqV4qrHs+EUDQ/8+dxSEqtqhjqar8
         d/LyKY45b8Nvv7IpQUKNjSggaoh8E7dY43DwPdyc0fZRXKxG9mDn2iWJ4LccvOpHHomc
         Br1rBtKG5mKEV3Vj6xp0MTHGGo+0MFeYw6IMVWZyWqHE/+sZiU0x0/tvAtzuVtMqXDPt
         s5P9JNQoZqqV9yFDgGnH5zEM5MYO65aTyhVy/OW9w5nx/SG7fvTL7vZTjkIBJN3tiGSs
         ntESfoEEa6501oOOghKX1SeD0AlM7EdBm1HvRFqc76EDxSoUyQGeaepzYauq1kbh+eQ3
         nqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777907720; x=1778512520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnkYyZQdAKaasgVZJN2/XMljWKgyrCDqJzs7a3JA/LE=;
        b=UeewDnub5A/KqX20MrtVIwGbWwQZH6YIXq/2FO1N5TUv4eNyW5vhuC4g6oQ3+jt5pP
         BsMFjpNxdJwzLF4bzgYZFR/2pQzqCUlosQemQo/tULqD3zr4cTjzSuhmNM+plZHgxh3T
         P9fpyH8soIPnUM//e86gLB+qFa7RbUvuo/YffH4hr2zZrwyrr7uN37fPL4L5E462xOpn
         +vZ2bZX+2xZczBJ0sZAcMW2LJy19sfVKMEhNtRQv/xLIxByiWl9jfC7gV0rOONa4c7yg
         3gLxVGZf9UPi91kJ6OcZAVIz/vXU18NgCAAiUB9lEMdb7Lf7eV+RbjCWFOSdtf7YzrH/
         w+Aw==
X-Gm-Message-State: AOJu0YxmKFagy5vARyqutbSujzXSRKC8kJ2i0u6NKRGzHkpp5Cfi//7/
	cAvy3WHQXRGwNvSViyBvzT4MpR7sduVV83Y+YvNM7vn3ogHAkFwU2xbUsDTliOUpQB42B+B8RXJ
	ENpI3a9BY5ob7/RQ3TlhnIrfoTTLGCSyDhmw7D3VFuaSBCIZFlUG6Ggf+/wPdsgXGDJlNlS8eUQ
	==
X-Gm-Gg: AeBDietNqTcj4NeJvMoSZdgu22z3X0vmf0ymOP+z8PAs/VTbUf0JkGkI3L1/mGII7PI
	nB5wuLv9alrYsDaz7ZERZGmRb/94XMt89VtPgbQ2wZ4D92gy16gvJ6yzj/GWGgEfDQUzVB9A0Zv
	yEwEVeFy5RabU5biHHx3yW/EjE+kklVRFtpZ/ei5wOz4PPU1H49YKnR+91czkT7stYjTSw7ZMU2
	clmOhSVbvq9WxajTFjToZQfZJu8/yxBNDGpePLg8+bGz975p+ljLc+nbeZkCUn0IPvzdq+UN5Np
	BLqMUvvJ8GRGnp0+akHGzJdePjZsPa4bshYDqp0hNCZjR0UbCQ444m0nbG+c40a+wclHiB3L3V/
	7ojXul04DoW8H7rELFrw9kldvXXsnTvXAgUavggRItAusQQR7qeRIxLiMhOPePsheBHSZw7+YUW
	ajY1O68N+uJNOeEuuDez4tB46jyHnW38c0SsCvmALZHJOeLGo+kz3XHBH1
X-Received: by 2002:a05:6a21:e098:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3a7f1c534aemr9871032637.44.1777907720059;
        Mon, 04 May 2026 08:15:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:e098:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3a7f1c534aemr9870962637.44.1777907719383;
        Mon, 04 May 2026 08:15:19 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c80203b451asm5646586a12.8.2026.05.04.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:15:18 -0700 (PDT)
Date: Mon, 4 May 2026 20:45:14 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 05/18] dbtr: Do not support chain bit
Message-ID: <afi4AiIcdJk7fEru@hu-himchau-blr.qualcomm.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-6-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313051948.4017134-6-npiggin@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX6VCXx5aQ/Jzg
 qKpU137YP76Y89aS9hAcI8UlxRU5Q/walbYNv5svSQ2Czy+JbhyHSlfrckPcj/MDkYlQBULF4pw
 9HXPIWFgHYJ9GkavkiQGpU3i9OeiuH60/GOIEiQThOryFbkzyAqaepvHDwlI47Ss4lVwQDa1b1E
 03W7dhT2Fz95Ojs1jWxmIIfF43s9tzMgGTU+1s7/rE/Hv9ibCZ+sD/XZVpoaZTdh+o7Vr4NmNLe
 DCZOLRTFQYh5jORPG0HmcGDZx9MZy4oG6DNJAHMEMqMnkdgvYTsU64wnZGNt0NRjpEggmm3Y2Qq
 ZdiHGAR7eDuvSexbJpkLyuRz0W4rxldUMVLihVHhrt/0SRl35x6v7cGyBBSKlx2GyiOQviZSOug
 5DUnyQMKln/WxbZLV3zQnlDpSSwtMF2iYz+4SADbGrklSieV6RXLTWja5zWGMqMAoqK6O265MD4
 bolSrWXxXCFkJ6HnVFw==
X-Proofpoint-GUID: Xf1WrtZQ4M4tC4G1xh81fl4IACNM0l2-
X-Proofpoint-ORIG-GUID: Xf1WrtZQ4M4tC4G1xh81fl4IACNM0l2-
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f8b809 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=mSbul0BgljmNybdbW0sA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_081522_407938_3AA5D55A 
X-CRM114-Status: GOOD (  22.41  )
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

On Fri, Mar 13, 2026 at 03:19:34PM +1000, Nicholas Piggin wrote:
> There is no chain bit validation in in SBI, so do not support it.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  lib/sbi/sbi_dbtr.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 65c3b2df..224f2350 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -466,11 +466,21 @@ static void dbtr_trigger_clear(struct sbi_dbtr_trigger *trig)
>  	csr_write(CSR_TDATA2, 0x0);
>  }
>  
> -static int dbtr_trigger_supported(unsigned long type)
> +static int dbtr_trigger_supported(unsigned long type, unsigned long tdata)
>  {
>  	switch (type) {
>  	case RISCV_DBTR_TRIG_MCONTROL:
> +		/*
> +		 * SBI currently does not validate chain bit in install/update
> +		 * so we do not support it.
> +		 */
> +		if (tdata & RV_DBTR_BIT_MASK(MC, CHAIN))

Just a minor suggestion. Since it may be supported in future, I would suggest that
we print a warning message that a trigger with chain support was asked for.

> +			return 0;
> +		return 1;
>  	case RISCV_DBTR_TRIG_MCONTROL6:
> +		if (tdata & RV_DBTR_BIT_MASK(MC6, CHAIN))
ditto

Otherwise looks good.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

Thanks
Regards
Himanshu

> +			return 0;
> +		return 1;
>  	case RISCV_DBTR_TRIG_ICOUNT:
>  		return 1;
>  	default:
> @@ -613,7 +623,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
>  		tdata1 = lle_to_cpu(recv->tdata1);
>  
> -		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1))) {
> +		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1), tdata1)) {
>  			*out = _idx;
>  			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
>  							trig_count * sizeof(*entry));
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
