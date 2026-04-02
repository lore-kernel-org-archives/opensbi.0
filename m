Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B1FD3943C
	for <opensbi@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98w/DfIqBG2ocZPZm3tFdrYNp7FfKbsj3a9hqm8bDPs=; b=2VgaRTKZnSCKKS
	QOLTFwt2UMGcM8VBi9HQpAtiZb2tGDaQYwzI9xluZNX6SBxGj54tj+V7i4sNXfVnld1JBfSIdCi2N
	XZ1wwLxkmETymBWEwXp0ZAVGsq4vBvizhlWt6lb1H/28LPfXtat76wStWh1S3UfKPZ/Zk0ZeiZQYO
	yMDnjAe/mrFvP25ZeudfD7VIhvcExtsipL1TzCDPQEsz72FJqmLyYgSf5OQ74cs88bR+aMNbV3n99
	JZtjidD3FD262Em8Ew09gPfZD4EmIkfwCr4In3376ARg/dbV+qJgFERXjT0/LczxtHaMR9ye76NgL
	QjGG0IJECAPrpczrufIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JTW-00000000Oh2-0RQv;
	Thu, 02 Apr 2026 14:56:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JTT-00000000Odk-2fZ0
	for opensbi@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CxKWC2798829
	for <opensbi@lists.infradead.org>; Thu, 2 Apr 2026 14:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCN8bfqvotk4MUW1GlFel23euqN/CnXM0D909AtmnbU=; b=YHYSxiLmPKcTGYA7
	pTfEEQae+NyeJpFUNInXyZBHSf4odHn0I6AfLDHy93Ht/mtA9HExQEVPRURiKMqT
	O/odHRva0PYLIQ+uKJNngenHG/EHa2DN+W7rUyYa0n/+5XAgI4m9ZLZjjrnh7jxa
	K7yqZfyDF3vvbT/OOMcgghAGJXuGxztXSedADszynk/iBX9SJmx+JMzOcmBjLXgT
	SiMMW0GDaEQExtyWavD4Ea9GmS09BIAU5/RgLw1f4l3lxiuS7OHb2JnwlEOlzNPK
	gjcHf/31QZBxk4OnTYfQCxOWIRwb2Ovt3zXZ9aKjaQQ6ms8xU9oUIsedCovUqEoc
	E5j73Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk4pvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 14:56:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so3974961cf.1
        for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141806; x=1775746606; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCN8bfqvotk4MUW1GlFel23euqN/CnXM0D909AtmnbU=;
        b=crJOGQd+xvWtflfc9ze4VB6XznsdPeTHrVKHviSqkkHFKzFD9uZxcOTDkuWopq3jc2
         IZpO1rANFoeLkHgb+1LYh2m7DFptfTWTLCl/GXicJGRUDtctyb0UzQ1YSCaxifKJX4fc
         FSuQI/c2r3wx6oPVbCwYBTAQHAx7sfHxLnW8Q9G6saEWyEAmwkxoBkeS6cIQLo/7DduV
         fJd2r6APOzlrUmh82qeADmuOMPXqUz8Td7WHXfmCcGKJg281ZSCOIljMiLajlidud0OK
         zVrbn2x1fs+c2L6Gn/5mb+nnuMAkJ4dO22mj1/p0cSo9+uOL9br8D+72b0x3TduNuo1I
         I+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141806; x=1775746606;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCN8bfqvotk4MUW1GlFel23euqN/CnXM0D909AtmnbU=;
        b=eb+u3tPQ98ByHuxOaGIl3PPNn55Xx0eK7eU1PPP0crVliYq2ZwZpNwtJQVqJlr2bls
         +PRUoUNLNaYmUc5PHcHh6H3n0CmEb1sZH4G63KiFVpi4/1/12Rmo1r+unUaxp3euneDr
         Tw4cOxi9aeox9jfIOVhqyjvTuHa4UalKejAJS/7qbwtfMRbojIVv+HIhg0LhNB7DwuDA
         jB4IOsuhkktJ3G4fKTij9yzL1RqACE9pQWIggtUjveWdv0/NuaDW5Hzu9euvz9EIoj9h
         2nj3miKWuRQqZMI0qKLvlz6AYMCRHtD0Bt+JCgXss8GjjaD/7+9KRN2GpclhHMYmdaeL
         qbdg==
X-Forwarded-Encrypted: i=1; AJvYcCUQG9GWmIY/VQr9GiVQgMB29/z6sJScLYzKaTwtdrleXrIYF7qJX81VD4KQOd/vBkJJaBH4FxqX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6B05QZMz7KJERTEi/IKgaHoJs0sxgXZKXQdOqV1sHTiPHP0or
	Mlo4r9S0V0uYeCDO8lw6Ibpu21SUezAJ4eSwq4On+v+o66acoDUFX8wzp0oCkr/k5s+G5nuXFpG
	E/389TignAudkV+m14uaprNeNpl3/AxkXZ7rMxCWButfWYhzPZGhVLAL0ED0aOzE48A==
X-Gm-Gg: ATEYQzwYyFzfeV3m5uu496pCJt2fBKixP+1tPWIKYzhN6foVaBlEmyErCGoR52AAkw7
	Mz05d5nlzHSgwASUw6p200Fw/qAJF5fOCO90vO4UOxYgjgCgGL67aVVpUpgxRgmouZYfaZ3pLFG
	u0v21wK27LDOT1fZf5X6EQIKV4nCZtg6eps4Lmg73p2tQ15UzaMdnpMeDWNz3K8CtgaAEWR0u50
	VEET6mneMG6KOAYK4Uz10fOZZuCWN35zAxN/9nc7M5aGVdolau72yRmXj0iAAx8ZkeXbjTLmX+s
	+LRdzqAyA3J5Kt/xPDLnKKKG2N704UmWQpuqEQPV5XxMZXbP6N71aGjF8adzRlOlvZNhGxzHaVv
	KbQE1FUoa6FsgyH4oirQbo5/Yij0q7v7GchXQAibiIO4VJsis31i9QArBg7VZ
X-Received: by 2002:a05:622a:4d3:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50d4fc1776dmr31477071cf.26.1775141805949;
        Thu, 02 Apr 2026 07:56:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4d3:b0:50b:3ef9:7985 with SMTP id d75a77b69052e-50d4fc1776dmr31476691cf.26.1775141805563;
        Thu, 02 Apr 2026 07:56:45 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d4500asm787089a12.10.2026.04.02.07.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:44 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 16:56:43 +0200
Message-Id: <DHIR92KV91LY.2IYTK8T6RQAJC@oss.qualcomm.com>
Subject: Re: [PATCH] lib: sbi: Fix hw a/d updating defaults
Cc: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Atish Patra"
 <atish.patra@linux.dev>,
        "Daniel Henrique Barboza"
 <daniel.barboza@oss.qualcomm.com>,
        "Sunil V L" <sunilvl@oss.qualcomm.com>,
        "opensbi" <opensbi-bounces@lists.infradead.org>
To: "Andrew Jones" <andrew.jones@oss.qualcomm.com>,
        <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260401220845.190680-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260401220845.190680-1-andrew.jones@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfXz4S+jszXUvzK
 0oSo/c8BUnlXsiJChEwkNzsw64I3qop4P0ictil8lSkfVo/aiwCq2Ugwxr4NJeIcbwn3w2k5/Ml
 pT3iEErrsaVY7a2+ZU18mBlwCto7ZVaii+DenyKykyU0Asjpo3r9aW5eaWK8SeWfEfrfxu9XJ56
 qoMZD6/YZC0omMiWl4uVQ8ErsRZJdLZSPKyNUTUU2r7SuRVoe79ar2hSrmaTcI8Plsy9hW8LiK9
 BUNUczh4cj0S94/QYe54zwdlcLVBDYHyZusr9kDMwv5uQjj2iHE1WBd7SRa2NbHwKyNl/gvnekH
 n+lkqv2H0aSiTbckRacCJrWKpFaPvwCsk3qn2+UyrtnAz8zAhwbH65wMp6UXsGPct9zSSsRFbZC
 uXJ+Zg+0S46HIyzT6t85ZINBCOya5gH84uiTNvuhfNj+hfmWmwsmY/rPGi5XyY8QoJMVoHF6pBB
 J2xbj5WttZEr7EmftfQ==
X-Proofpoint-GUID: Z4jLT1jyaEpMh84PQe54i2LARkTBhNUw
X-Proofpoint-ORIG-GUID: Z4jLT1jyaEpMh84PQe54i2LARkTBhNUw
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69ce83ae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=u2P3I8dWKXacYNFLAn4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075647_786880_D8FC5543 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

MjAyNi0wNC0wMVQxNzowODo0NS0wNTowMCwgQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3Nz
LnF1YWxjb21tLmNvbT46Cj4gVGhlIFN2YWRlIGR0LWJpbmRpbmcgZGVzY3JpcHRpb24gc3RhdGVz
IHRoYXQgU3ZhZHUgc2hvdWxkIG9ubHkKPiBiZSBlbmFibGVkIGF0IGJvb3QgdGltZSB3aGVuIG9u
bHkgU3ZhZHUgaXMgcHJlc2VudCBpbiB0aGUgRFQuCj4gRW5zdXJlIHRoYXQncyB0aGUgY2FzZS4g
QWxzbywgd2hlbiBvbmx5IFN2YWR1IGlzIHN1cHBvcnRlZCwKPiBkaXNhYmxlIEZXRlQuUFRFX0FE
X0hXX1VQREFUSU5HLCBhcyB3ZSBuZWVkIGJvdGggdG8gc3VwcG9ydAo+IHRvZ2dsaW5nLgoKRG9l
cyBTdmFkdSB3aXRob3V0IFN2YWRlIG1lYW4gdGhhdCBib3RoIG1lbnZjZmcuQURVRSBvciBoZW52
Y2ZnLkFEVUUgYXJlCnJlYWQtb25seSAxICh0aGUgSVNBIGlzIHZhZ3VlIGVub3VnaCB0byBwZXJt
aXQgdGhpcyksIG9yIGlzIGl0IGp1c3QgYW4KYXdrd2FyZCB3YXkgdG8gY29uZmlndXJlIHRoZSBk
ZWZhdWx0LCBzbyBIUyBtb2RlIG11c3QgYXNzdW1lIHRoYXQKaGVudmNmZy5BRFVFPTAgd2lsbCBi
ZSBTdmFkZT8KClN2YWRlIGlzIG1hbmRhdG9yeSBpbiBSVkEgcHJvZmlsZXMsIHNvIHRoZSBjb3Ju
ZXItY2FzZSBjYXNlIGl0IG5vdAphbnl0aGluZyBJIGV4cGVjdCB0byBzZWUuLi4KClJldmlld2Vk
LWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0uY29tPgoKVGhh
bmtzLgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
