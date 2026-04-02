Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE66D39422
	for <opensbi@archiver.kernel.org>; Thu,  2 Apr 2026 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzyzSxoWU8zwEoOTYCIj6GFcacByd6/iPjIVYJTm2OI=; b=U9dIaZBaL/z0G8
	ygMQGrWDxxZNc+J9YBLFHhlZWvPkn7qOGLDFyJB37mAsDAlUPFqqGvMhtm2Nq/LMmQOxy5yLITEiW
	rEfEIAe6ahQkdeOKl6LkCbM42IGO2CGH24gqiUxmwiAYA8lhZ6iDQcZJ6tGne0z3o+6bCXuFXTstH
	vUCxd3QNQQA6QBd4ufpKpCLDJuEtXlaPm+XA3lzsd1lDmW0grSUVFJ417wzba9NPpXOaOJhZBfKMF
	J3KcrT4GrGmswu8dSV8SbpzGvMseZPamBmb+1qQY7cYx/HvUBLGcFTPiIgdDDqSZnRJTUPsrWqYlu
	CQkPr8Bf09HScssC1okQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ICd-00000000BnV-0hZf;
	Thu, 02 Apr 2026 13:35:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ICc-00000000BnF-2stM
	for opensbi@bombadil.infradead.org;
	Thu, 02 Apr 2026 13:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6f8Nq3+hw3HyosYAwM4ahlMK6gIwtIvVaPMiORAQipw=; b=Iy4rOQPH6rSyJ/KiNUN0uB8lAP
	hQ2uJbc+jmp7jmVEytC4hrDJz1AAJp3ea7LJw1GC/RvMk67S1ApHndWNgR8TghLmUfy1ij6cdnWiM
	WMnfsuBuvYooyhwf/BZs/YlSqIMCXCNKkBSEGR3oKnkySd7dAFAz5Zal453K1pi+n6YzovQ75/Bza
	GdYD9DQuQ7+SlVDCeQ13xO7fjP2L+oirliFGTwu70vj4dzXsSmB7jefqgljwvpNFV3kNL6fd0LBkP
	mUo2gqk57m/WXewVXzBtIE4u4761gO9AvCSW9cTtzAmXfmhYgmU0RFnwJix5e8vBQRParQKpYJmJ7
	uU6njQ/Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ICY-00000002YoO-29BL
	for opensbi@lists.infradead.org;
	Thu, 02 Apr 2026 13:35:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BW0aX948718
	for <opensbi@lists.infradead.org>; Thu, 2 Apr 2026 13:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6f8Nq3+hw3HyosYAwM4ahlMK6gIwtIvVaPMiORAQipw=; b=LF0q+XuzcERl5nxd
	V42x/j68MxZ1b4H9NcnvXne3S2s+xw18D6RegYtlzpbliuBvL4eXA1nvfxuQ04L6
	PKVNxvr8/XoeGbUJlX8FDI7fZN4ueMCfNpHeeVpGf4SYyNQ5q1YNMQ9dgfsvslQP
	mayr4YyCwM0DDqwhYD3A6ioa+79trjOBsP4t6Xv44X9wEc0pdKtrCis0OA55HFqj
	uXvoqGTccISG66cx6G8m4Rh4dYI99V+LsPWax7nj4eiJNZXkCHTVjqvUo0ZdDcaz
	hi9DfhPicOAfbR76VtWx4CelJsAtVEH+54K/GMvrnA3M/3olAY1t7Mn8Qdl2duiE
	ZH5XVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qnu0haw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 13:35:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093025ffecso21374111cf.0
        for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775136908; x=1775741708; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f8Nq3+hw3HyosYAwM4ahlMK6gIwtIvVaPMiORAQipw=;
        b=YsAL3jo5mcMBDRnWYAVYlc6MXRMuvT/z7joiBQ5d5aNVbTMePzJ+2k6/JeBWKLnG+0
         W0gVXMO0UAN5HbpDifRh+A/XqrP+9ogteVVtzHSdXQj41ZjxCBKzvdRiiAUr/wZN9/t3
         Tzu9QAuQqIpoxRG4ri9x6ta4OmoFAIbMzMZGn1H+TItVyVCcfZD1wH+2H6h97ps7jpq3
         /cOTCWbGRO4V7reO8A3DSIcMvLn+KjW1KEScqWheXYuC24ReNxjQ52fU2pQIfOPclhmJ
         dONVoslwfrdG7fjJF+seAkIQa59nDYWnNwF1pvaolwsFxkrgrcDGD7f2rMHmzUtJyQpt
         SAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136908; x=1775741708;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6f8Nq3+hw3HyosYAwM4ahlMK6gIwtIvVaPMiORAQipw=;
        b=YdRsu8Z6qmJJza1vrs4F7fDkXHxId4AAhrL3EPe2mC/Ee5w7w8rLDUJvWmxsEZBYuf
         CN1jOTHEtVqPv0nczrBxXoZPh1A9vWjm9OVNOc8uq2oqm+N3ICpSn/D4dncnnzU6qCZw
         vK5Pu6xydEfzgWxbRLd5pgBeZHePeOgItgmG1NdpYxntH0WA9K8wkkjmHUpb8jfIcmSV
         0jJRyWnppPYtEjewvgRRjrKh3j1GfUzCS7L1THkcsDfM2u8ljc2MYgT+yQO91yDsKFIa
         Sdg7swIESwOeFVg+gDRPKagEzzHkdlRCmaJMGLrUT4Jojd/7x797hZXTAorcUDlK+dc+
         WITw==
X-Forwarded-Encrypted: i=1; AJvYcCVoiNqgnB/eozP0jtrOccUZnv5ZPw104eQeXne2wMmN6Ue+lYjHI76nWIpFEmG8b4ScPy/gxa5l@lists.infradead.org
X-Gm-Message-State: AOJu0YxMSjp1j9QmiGjrmpkSMHZHztyWnipPBYc9zbHvgOAJ5A64qQKw
	Bvc7dhMY5QrCDrAw6eFgLTsXTrQMEf122wgZenNaTvq2Zj3v+4KHctL7Pq6dR/nEh6KjtAjm/At
	793GYxnnUrmyLt9FPgDaWSNys3J933/mXMPRBy244YLh4c5XgDBiVkO8nIT+h57YAQyutDQzgLQ
	==
X-Gm-Gg: ATEYQzyV00XPqCbetvooEZalQuDsyvlHeAKG7+vpPmVfOuNcKo4zCnXJqT+S3S8FgEU
	lPXChBCOUsRkJ24suVoqb1zQD68Lg1PWrL4K5dnIs6z24hDTuPpR2e9P4Up7tiJ23lBBF+iqWJr
	WSlezDDZMeU+yP98KI8IT056Cx6aU4WG4Km4slTCB8t6POtToQIQGMqYeaGOaBvK0LwsGxuTehw
	7sJigp0P/l25KxOfW4cdVnYSDZmBG5LnXV0sxGzCp6BMG8PNAOEWKQiuQIEdw0Yl288DCBQrzf1
	6EEWYsNn9Al83zfr3LXP2W26PpftVIDhz6GHBvz4GL7bvdSYCRMnhW6i8nhEI86LTKcTRrMewOy
	c4UB3SEhxm4Y/hfK31sWxZkPYjjWZZiaQy4BUsHQd5Tf10wI/GgtnNY8ysbbf
X-Received: by 2002:ac8:6906:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d3bd3526cmr111479711cf.47.1775136908467;
        Thu, 02 Apr 2026 06:35:08 -0700 (PDT)
X-Received: by 2002:ac8:6906:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50d3bd3526cmr111479041cf.47.1775136907917;
        Thu, 02 Apr 2026 06:35:07 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99fc09sm92146666b.17.2026.04.02.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:35:07 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 15:35:05 +0200
Message-Id: <DHIPIKMRJ56H.UTR2JQR6X23E@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] lib: sbi: Add RISC-V vector context save/restore
 support
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
 <20260331055858.305207-2-dave.patel@riscstar.com>
In-Reply-To: <20260331055858.305207-2-dave.patel@riscstar.com>
X-Proofpoint-ORIG-GUID: 8-y8GHXMI-NOR34fNG8op_vVpe1sczK8
X-Proofpoint-GUID: 8-y8GHXMI-NOR34fNG8op_vVpe1sczK8
X-Authority-Analysis: v=2.4 cv=RoLI7SmK c=1 sm=1 tr=0 ts=69ce708f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=4dUiZ8GAKDosNzctChQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyMCBTYWx0ZWRfXzlzCfwxICCXx
 ACanlDS99uzOCml6p5+a+4AigmRlxiQ5jBaNtcBBw5JnlaDAtPuNc+C3XY8aNZYwTIYSsIhcyqA
 vmrlssdflyIm9DPAS76BG1XlQUAir/zlSVBDKz1//s6p5VHHdYmy4QRNi4uDhMDerF3tmPuJJVL
 NkVmiRYnQi3dj1tDVQdDTAvcACgWY6C68p90cpl5IfBdSfJdqT4kZRfuPIU58lyb60L/r7dKLvr
 dlxO1Q/RG7kZE7hAmL5dQxCM6pdUXLVwk3UcdQqUMPHOFnKLAH+92oc932rnw7XvfBIAfL9apBB
 XdrYvyv2sK1yLTuPNpc3zX1owGQ5mR90jlBU5PnxkyI0Mfrb7x7dV9jBgxU1v5pjjH7jkA8N41H
 KTL9mG5e3/48mV/raweSDw3T3J7ofPBDZrTfs3ogwiJ1H535N2KLUaZQ53pcZ5NGYip5USUfDJ2
 xQMXpnq5i4dELW1QlCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_143514_965036_871D3FD7 
X-CRM114-Status: GOOD (  10.92  )
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

2026-03-31T06:58:55+01:00, <dave.patel@riscstar.com>:
> From: Dave Patel <dave.patel@riscstar.com>
>
> Eager context switch: Add support for saving and restoring RISC-V vector
> extension state in OpenSBI. This introduces a per-hart vector context
> structure and helper routines to perform full context save and restore.
>
> The vector context includes vl, vtype, vcsr CSRs along with storage for all
> 32 vector registers. The register state is saved and restored using byte-wise
> vector load/store instructions (vse8.v/vle8.v), making the implementation
> independent of current SEW/LMUL configuration.
>
> The implementation follows an eager context switching model where the entire
> vector state is saved and restored on every context switch. This provides a
> simple and deterministic mechanism without requiring lazy trap-based
> management.
>
> Notes:
> - The SBI_MAX_VLENB is configured using CONFIG_SBI_MAX_VLENB.
>
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---

You missed my comment on [v2 1/3]:
https://lore.kernel.org/opensbi/DHG4IUERGFUV.3TT9CFPZ9YEDG@qti.qualcomm.com/

The two points are:
1. Possible cross-domain data access.
2. Writes to read-only CSRs.

Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
