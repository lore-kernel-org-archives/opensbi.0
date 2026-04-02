Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BB1D3942B
	for <opensbi@archiver.kernel.org>; Thu,  2 Apr 2026 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bduMheKj5UrFSRODiecocRjVGCtZWcjGN7FefyAloFw=; b=RkLAHfa3qcHbYd
	OEVohk/s18+41u9z8hwCTe5suLx9kWO3uJRRgAdnaYRnF1CchNAMaBUVARn6OseKia3Bz4hOSmK7t
	0MjKuA3RwaVUe1WgzWAg/6dFZAkm7V5DQxsMKrc/fvAcnpk79QgsXrMGZyPaNEWI3G2pOKVG6ffQP
	q12O4fOJognFBqBrDHanLov2/0ekrv3GE9z90BJeRhM51XjfUa1kAzjvsrs04t2wkudeKZW/x0JMb
	NdwpcmtEhyjNDNtdG+D4+nzOkFEQuFiMQ6uScUeIvRUqLU42ZRq0MOMLpe07YAGiSlwSt4p/ZrQoC
	fAqXDBB2J/VzqVgZ5b0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IV8-00000000Das-29MX;
	Thu, 02 Apr 2026 13:54:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IV5-00000000DaB-3Whl
	for opensbi@lists.infradead.org;
	Thu, 02 Apr 2026 13:54:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328d7RZ1249334
	for <opensbi@lists.infradead.org>; Thu, 2 Apr 2026 13:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oo9e9ASlXbLUZXci+/egFzpXj2thuJQXgyBTZAIpAM4=; b=fvA+uQYknl3qpbh+
	DnO/BgH8jlIp9iWZuo+aqKXOCuMYq0uVHB/uAa6vWSlvyALSZZK+FsjyYZCIYUp6
	UW8QJmPaKofjj3a80oPy3G02h5vtzxDyBLOWPZkk8BcJnzW30E5XbgY5UQbLu4ws
	8pARWS0+xVzFDWL0i1e7f/guVRAogPWes6ofxAh82kisnsmxWNckvmQPWZmVBcAR
	+9jFHCOYcD7wW496+vruLPlxNAZHoHexWx+IRRMqDVdKQbC/rsPYJFl6vuplwogG
	aY7f+DgvnH8LwFiVRlkKilckY0sS/xA2IHzjLbQOZuoy6hIoMEAEJgBSLzurSax+
	Xgf+RA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t18vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 13:54:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so23342701cf.3
        for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775138061; x=1775742861; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo9e9ASlXbLUZXci+/egFzpXj2thuJQXgyBTZAIpAM4=;
        b=V/Avpau/s1uGHhcQ4ZikPQl6SPS4yJb977E+lorYuaGakY0k+wb5FjxQ7jKRMQQUQY
         GEUYa5bMlZ7q0hkjvquAH9T3cTHR8UTSa4VKJ2vhF/1RmpKQojAzJPy+h+wgWRlwQBrh
         FQQsdjmU1O+N8aOesPJKoeb7+brPMyXlOZtQEWhoT1F5fNgpGATQPXgAHlU+CI3SgE1r
         O8GEx5PnQGdJj5BuLgp3RjKJRp44WN5Pxurx7GI3yqRC0oyXgAo1wmiy9sEtEIXmaYpT
         GiENg2i7ziw9DvNISyV3sZUZ2J8WOchwEdMMduG1aYPMqnNsmMpHirEDh8CpRkFPGxp/
         nP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138061; x=1775742861;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oo9e9ASlXbLUZXci+/egFzpXj2thuJQXgyBTZAIpAM4=;
        b=AqOfYGKRACfXWIolLfn9N2/2BIVkLCmFfjlR47et1mD1f9e1Iv/6y67iom3pEa9Utk
         mo2/XC+Dxe2hnJ74nyNTovyExh04ru50O3wDBKaE7jR7ZoBXoY4ua4Bv6iVxNrKZxydn
         fGv1uDfGf8++DJGbKOmiWeBcRpHTGxQLcco1uVWC5r5UEQcPHXn4gzMpp4MFsVIrDOLL
         FeUZSywiDN8kcN8FU3tTvu2abn1AlLyNcrp0b6oUddQR3UxQkxiBGdnzBEtSRyNDvq+3
         AhCj458rS0F32C4jFsvglN4opGk4ygpKgbUhFm0Kc+mRZNFOWT2vfZt83eGI7q/SEk/H
         w/3w==
X-Forwarded-Encrypted: i=1; AJvYcCVvTBpD/a8QoqBjOlrS1vjbcasAglNrvUVs86TXcl0mYzECKGKQ+2DkOeAzR2YXBRzmnD8VRvuS@lists.infradead.org
X-Gm-Message-State: AOJu0YzpM32QJKb9zHLDRS9ROyLp3hr+uckQuqA2LYTluKZxuo3IekBT
	DTTSCDcjWFL1fFS0s9pAors95syEM7+avB5hMei+tt0YgGGS02KEvKP7JUvpi1aPK83/+IbmkXD
	nTvU3+k1zIfUo0pIRc39KatLLuh3gEEIPdAeWr7O40HHxO9cSh9qtegMyljen5CrW33oE1kmo9w
	==
X-Gm-Gg: ATEYQzxvQTBONx5s9IuBtp0CL9KteSxkUoZGTfNTxfOfBYCpW+3vMS3I/D743PKqHvR
	vDBGkLiOB4ENDivdAthVf+BxVZqOnguF0GgEV6g6/rVFF9d0BoOLABmWr9HxKl5MyBNY/Tfr+cm
	ob1gV7qyTtzWS9H4rbE6DmoqtHbhgM6WGS6BsOTchBgMwzZRiOZHmcKaOYBxr0vm59oddn65JjV
	lKv7Ndghxr8iGiFoFMeQXiOCsdJrRfXRYKpGxLCyDGlnYfDa/V9nbJ7Gz+J6ASNCHoUSsdn0Rr2
	FX+6c3d8i7uGb7/QS4QTThYl3MhVXMrIdhAn4dzcVN2ZWdl8c6o/mTOEEauI9uir0tUhIiuy8/R
	IF8UY/rE2zAccJvtFtEPqvn/n0JgulYLGWKov7/f5vKnx7N8dSbla6iNUTJtf
X-Received: by 2002:a05:622a:4d99:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50d4c024361mr50513701cf.31.1775138061302;
        Thu, 02 Apr 2026 06:54:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4d99:b0:50b:51eb:c353 with SMTP id d75a77b69052e-50d4c024361mr50513231cf.31.1775138060714;
        Thu, 02 Apr 2026 06:54:20 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6693sm87309866b.36.2026.04.02.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:54:19 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 15:54:18 +0200
Message-Id: <DHIPX9YUMY2L.2M8SIQJDJ6Q4U@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] lib: sbi: domain FP/Vector context support for
 context switch
Cc: "Scott Bambrough" <scott@riscstar.com>,
        "Robin Randhawa"
 <robin.randhawa@sifive.com>,
        "Anup Patel" <anup.patel@qti.qualcomm.com>,
        "Ray Mao" <raymond.mao@riscstar.com>,
        "Anup Patel"
 <anuppate@qti.qualcomm.com>,
        "Dhaval" <dhaval@rivosinc.com>, "Peter Lin"
 <peter.lin@sifive.com>,
        <opensbi@lists.infradead.org>,
        "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: <dave.patel@riscstar.com>, "Samuel Holland" <samuel.holland@sifive.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260331055858.305207-1-dave.patel@riscstar.com>
 <20260331055858.305207-4-dave.patel@riscstar.com>
In-Reply-To: <20260331055858.305207-4-dave.patel@riscstar.com>
X-Proofpoint-ORIG-GUID: uAuEiARXuciJk3IT3Vft73lLEJfUz9y1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyNSBTYWx0ZWRfX943E505zlFyg
 GY6p2rZn6X5kvd8PzDg8CBol1M51Hmdam8DAkUHFsQbJqoZmSBDTFYvpGuXAPBgT67jHfL05r+w
 ekOHDXyguICT2zNszEXzSToLmADU3wfSAJ8ovA4uzu01JS8ZqALH47KE9aTOWc9YeEz5SWUMvL8
 UnGFiYe1M5tV1hgcpPxO0i/9xddE2tsN89j2xtPHMBa4whuKZFGIcgzFEPBBXkgnUXWfSWlBFRG
 D6xc+Q5c+AW6f4MLTi/QxHdj3w5iYg2cHWrgfHMAOa85rPw5tgth2Rm1wvZNxdMdICRJeyVAb8U
 qxfYJTFX7euN1CoQlNQDxPhV7x8OA+kywCJaL+WdhTv5bjSAm0mYQcoWKti5lZRnm4bZOiS3gsB
 43LZMRYXNMOIOGHZtpxm7RvJ9nkkVMLz9/XIe0D3Bn37lClmV0Zrx0rew56VqJ7hCxZUZYeErSQ
 gSMM+mihu0lkjlsO5Sg==
X-Proofpoint-GUID: uAuEiARXuciJk3IT3Vft73lLEJfUz9y1
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce750e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ee_2aqc6AAAA:8 a=8tbHuwcQrc0N5vFZea0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_065423_903837_26E855A4 
X-CRM114-Status: GOOD (  17.78  )
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

2026-03-31T06:58:57+01:00, <dave.patel@riscstar.com>:
> From: Dave Patel <dave.patel@riscstar.com>
>
> This patch adds proper support for per-domain floating-point (FP) and
> vector (V) contexts in the domain context switch logic. Each domain
> now maintains its own FP and vector state, which is saved and restored
> during domain switches.
>
> Changes include:
>
> - Added `fp_ctx` and `vec_ctx` members to `struct sbi_domain`.
> - Introduced `sbi_vector_domain_init` for vlen check
>   to allocate and free per-domain FP and vector context.
> - Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
> - Updated `switch_to_next_domain_context()` to save/restore FP and vector
>   contexts safely:
>     - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
>     - Restores original FS/VS bits after context switch.
>     - Adds NULL checks to handle domains without FP or Vector extensions.
> - Updated domain context deinit to free FP and vector contexts per domain.
> - Added runtime checks for FP and vector extensions where needed.
> - Corrected handling of MSTATUS FS/VS bits to avoid unsafe full-bit writes.
>
> This improves support for multi-domain systems with FP and Vector
> extensions, and prevents corruption of FP/Vector state during domain
> switches.
>
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---
> diff --git a/include/sbi/sbi_fp.h b/include/sbi/sbi_fp.h
> @@ -8,13 +8,8 @@
>  #ifndef __SBI_FP_H__
>  #define __SBI_FP_H__
>
> -#include <sbi/riscv_encoding.h>
>  #include <sbi/sbi_types.h>
>
> -#if defined(__riscv_f) || defined(__riscv_d)
> -
> -#include <stdint.h>
> -
>  struct sbi_fp_context {
>  #if __riscv_d
>  	uint64_t f[32];
> @@ -22,13 +17,7 @@ struct sbi_fp_context {
>  	uint32_t f[32];
>  #endif
>  	uint32_t fcsr;
> -} __aligned(16);
> -
> -#else /* No FP (e.g., Zve32x) */
> -
> -struct sbi_fp_context { };
> -
> -#endif //defined(__riscv_f) || defined(__riscv_d)
> +};

Similar comment as to [2/3]: these should have been introduced earlier.

(There is a lot of other random artifacts in the patch.)

> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> @@ -143,6 +146,15 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
> +	/* Make sure FS and VS is on before context switch */
> +	csr_set(CSR_MSTATUS, MSTATUS_FS | MSTATUS_VS);

Where is the ctx->sstatus restored to CSR_SSTATUS?

Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
