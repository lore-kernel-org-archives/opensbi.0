Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2B0C982FA
	for <opensbi@archiver.kernel.org>; Tue, 22 Sep 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQQDTl8aM9IBLB00CPWpAgwfi3aliEAjljLKNoxCwzQ=; b=hzgP5ZjcEPZ7ec
	dNQJgjRFkymu5EYHL5G3DBwUS9x0NgBhxcOl79w4gJy7WLsCdInnBckNbbQCN6tAN5/JT02+soMXa
	9e1ok2GOjOSU6ZFAH52A5OtvGbIvSmn60ZdUh+Tq4KxomVF8HeHzB3Xx8C9V10OOfoYxHMe2X+jnt
	HXXmNIej4gAohy5iRwPZB2cFgNsDCkpxN6rbnD30Pef79Vo/zOaJT08zX6FSC92FnijF9sZtt15r5
	LJA1xhPdyFGin09YwIW4eO1Uo5HM7mfz4GL0NVW49OYGPpiIKqjBU1W8axeAjszCCyCcruOdHqole
	2XuH2AyGtzPu7FnyhueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93av-000000065bq-3PDQ;
	Tue, 22 Sep 2026 16:43:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93as-000000065aW-1DWZ
	for opensbi@lists.infradead.org;
	Tue, 22 Sep 2026 16:43:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjVVG1058326
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 16:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jthKu4IaVopReA4eIKKKBqIWLogSFEjXSeyQrLY9NL4=; b=Kyp1NC7/lI2ufwuH
	G3jpH5+koPJMVZKa7Wj16/SNsgHbNeQlE+s/0s8L5MXfYpMhwWg3MdL/jFdp2wLy
	sFwpx7pghcyzttj2C/0V6PxfFUc5NPqx6kXYIOgYafLfvtHFb0nbcG0lQydQyVoO
	S+mMCZdQlbViGq1htOjnrrCnUwTRzhACnOLm5/4WqHYjP2iSEPkyt2z+vgkouwsY
	lK411y0VBNIMU66vlacuDScWTNCf8didpo5iPT78usbsAB7KYvq3IOifeRnrZhfZ
	KCMMYLfBlw7sHn8YbBlyn73A+35TTfzL5U/2YoTQCWlIWWTvVC4RRIewDJGRmWsp
	AV3Yyg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5uf9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 16:43:44 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-837aaa9a3f6so1354597b3.0
        for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 09:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790095424; cv=none;
        d=google.com; s=arc-20260327;
        b=sG2YCU31Tn0LaVH7pj3pDn9Rqlr2uiEu+me13w2uE8dbLYsF1T29jVNLdLOYrdflSp
         sJxFloDtuBJ79Kqqi5Smg5jkPJ/7KWt34RApv4BLDcNV9e44FRzxcYakFGI10x2TISIT
         dMCgd8Luyn9VyE5v/sWqGXPhjfd1rMY5YwuEH1PEEJIVa4utPeyTMWrTETrOWwIJPju6
         /Jc5VDF14z8WSUX+qyB0hlIgaTWxYqbK7DcgNAMAMx19K+MXoc9RuxAxE9Mn3nzvsbAn
         +vMaVmrhP4PmlceO3rXOKqMnlNt3K2PSwc3HDISbFf8P65B2TF0zJcJmLnFqL688w9Tc
         K6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jthKu4IaVopReA4eIKKKBqIWLogSFEjXSeyQrLY9NL4=;
        fh=FeiLAef65TAaS+UBsy3QE52rVJVFoQHA58tY2ves+MA=;
        b=oLPCmOejPW2W/bqYW6oMKUMcsQLAwvpnBjnbgtjTNjfEruW8d4maDacszCPIFqU9Qg
         XFX5tj76rcjA4nJxa+pS0qnD9LM4Mw/RlegtRCtuvij8An9yRHPvv3WHv2SaPoviEYHh
         BMDGhJkbHvZ+jvNi9MJLW5TA8Q6uuWKGMKuTZ4D6w4PJ3huzJaEKdEdLDFFzSRO/uroG
         7RQEni2F+p5nWNFGy7FFuzsCW2f3P/V5dXtRSrLijTekqJIIcYLjkJd4tijFSmPOLIGn
         zq+TMO9Cwv+ug9kYGOIp3MQeWBZrZ2XZNjAfNcORFRxrAsWiRy1a94EZLmv7oDTkUA6X
         x60A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790095424; x=1790700224; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jthKu4IaVopReA4eIKKKBqIWLogSFEjXSeyQrLY9NL4=;
        b=Ty0aVPUi1v+In7pPMaMR+6fqAm10tDGYuFg0wWFL1mlDBwcymLoDvAlY28up/bylmn
         xriRYp+qRKdYQNdzfaCB/3SyGbVgjRV1OVtOGa7wbBh3kd8XpvRCnBd6kP5zS/hIza06
         W2BXbyQDM0dM54C8eX29kJSoyBSbXNPE+g1A2p+rUMo4iBUCxtOOUHcIeQ8jJsJmhlbh
         BbY/vCN6CO2mFghhWPDUi2ud2D1G865Bq5j8UVP21KllVWCARqlncN7o787tFHQk0HpS
         1o8ebycGn7jNCaPYP3imXyS+tpFioTcrm6KfLK6NyqPv+aeBnP0C9vsFs803ey9WxtBo
         +yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095424; x=1790700224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jthKu4IaVopReA4eIKKKBqIWLogSFEjXSeyQrLY9NL4=;
        b=X1Je/M1tVqdbF3yqPBPhdK7ahHDMBrXBdpT2RCt0zhMc9+dPDUzYAqfof09mXm/nqB
         ls2VvbP1A0BRpgvVCL9HP9h9FkXPszVdjHT5d2qP7cUGFotk848UCoOXZ6PIhZkVJN4G
         fvgG+Oi+VXFFt3JHWEGmEzt6HNzpcpBK9bwnkLPNa/bwfilA3ij+nW0m1xtbA28Wwwsk
         BtoKDYa4Ys43ZmI6C6mxA8vJHgwNXDu3Fjcxau03pgiqzQeXGtn6JQuAaQBfrKS/MPrN
         pEA1orCZGnw8eaUUYNyqSae2FgnVeGN5vzMpsfC9nnq5uMnj+ujrf43zkpapBRBYPIjD
         rXeQ==
X-Gm-Message-State: AFuF++mZsy4B7cWBuNeFrlyatWNfmfIKiMCwNa2SZCdrjzlXnUbj/QpP
	v5DiPcv+4q7Bc7WDGFeRxt2LjA9jtGO/TN4OdJ9EVaLwUKc30K4H0gDpfArC7AKBNmLPWAAf5R7
	MpAIdAMVjeBhNCOjgA44j3rEnkj0ZV0OCCo4IsI7LVe98+b9CxFjLovV4+eW3e00yBy+aELOAnV
	HbKVhOkciwkS26wjf/bR/3TgHxfncY9j/1sjBAXaW4
X-Gm-Gg: AYBFou1MjXLoxt4882G2BG4/LZBg5MhdyOLc9zSJQQ5gjothNl/kUM4bqAGVjm7XYRu
	QoHTw6CevELgYU/An3JxfWugxI5f12N7qxWuAzL4NSq5Nm9whmTqdsn1JPjn1BglbE/DN5k8yyH
	4fPRsX3gXBAVrc1mJj/mSwqdwmrF92atbe4nF9B5ehvY6pSr2IDaztnhh7TGNIwue1QE94yn+a0
	RldoCsBrFIXqGG5gw==
X-Received: by 2002:a05:690c:87:b0:873:5c7b:c136 with SMTP id 00721157ae682-8a1f9824b9bmr18706107b3.30.1790095423888;
        Tue, 22 Sep 2026 09:43:43 -0700 (PDT)
X-Received: by 2002:a05:690c:87:b0:873:5c7b:c136 with SMTP id
 00721157ae682-8a1f9824b9bmr18705907b3.30.1790095423451; Tue, 22 Sep 2026
 09:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
 <20260918030955.3902993-2-rahul.pathak@oss.qualcomm.com> <CABBgwmvkdGoiZSWVhXqwzsWTLy4veQUn1xLYC_tthx6BTEsC=w@mail.gmail.com>
In-Reply-To: <CABBgwmvkdGoiZSWVhXqwzsWTLy4veQUn1xLYC_tthx6BTEsC=w@mail.gmail.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:13:32 +0530
X-Gm-Features: AclHuK9JfsnC9aH7yI-N9ryiumSFhVELr9kXvAe2c7YTD4Jq8LabKIQy_sBd-9M
Message-ID: <CAFR3w35ayB=drzsAt8NtHizYwXMw9GYfs6ebWOg6RVBUBWC_ow@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/4] lib: sbi_domain: Add domain register finalize notifier
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul.pathak@oss.qualcomm,
        rahul@summations.net
X-Proofpoint-GUID: 3ZfiZHBgS-49ia-QHxGLZOsq4xPAXF26
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NCBTYWx0ZWRfX1zctzt/fmtC3
 +V4mgJk4pU9rOdcKPtgX0tYb2lHLWzCjBvh/6qBjAnxZtlpVhDgYVBCtH9CDXNH0B2SVbmPv8Y2
 WqAD2j1WVmEux8xbnHVzRNf0d6UL4Cw=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2b040 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=L22Gg67vpYOZMK4AzB4A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 3ZfiZHBgS-49ia-QHxGLZOsq4xPAXF26
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NCBTYWx0ZWRfX4nM5OM2yy5xV
 0gX2e/K7AvOMOroq3UNKrw5nb3DLwjXlCFg3ZPvXvua8tVe9AHP5Ix04C03jUvQXbwQ13Nfabhu
 Z4pLNXHwhTy39Khh6lOicHBMDbVRBiBzyjkD+Nr/MThGJElQt1YyBAwds44MW8bhuCPSba+qliW
 0Xn3c1j4W0uF10V1tbRRrVU6Lc0dKyMyPdVTuWMeFJ9H1M1Teuo8TFff+1fL0rEhdt/pD11a8jl
 pVnIjPxT/QB11X8LvAl0hzUHRDZJBZaiBEnH1EvmEkuR4/nzDHHwFs7SaaBAFZtV1O8uU72LGNq
 qBucYEBVUMQdhgIyRfIk2MGDyCHRWgj1kjZcZmPuTSuohX3vo+Q7fg2SSdPfiLrlL2KIOxCjn5j
 QXCDX3LViVX+aiXmuA/LfNmYabWwaXVNMYH5z4ZNKFPsPZZf/kAImchJtFy9WF9UmOmrsL5kN5X
 Kof87bvWp2kUf/Uvi5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220244
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094346_450626_AF0D947F 
X-CRM114-Status: GOOD (  19.46  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTozM+KAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAxOCwgMjAyNiBhdCA5OjA4
4oCvQU0gUmFodWwgUGF0aGFrCj4gPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29tPiB3cm90
ZToKPiA+Cj4gPiBzYmkgZG9tYWluIHJlZ2lzdGVyYXRpb24gbm90aWZpZXIgaXMgaW52b2tlZCB3
aGVuCj4gPiBtZW1vcnkgcmVnaW9ucyBvZiB0aGUgZG9tYWlucyBhcmUgbm90IGZpbmFsaXplZC4g
VGhlIHJvb3QKPiA+IGRvbWFpbiBpcyByZWdpc3RlcmVkIGVhcmx5IGFuZCB0aGUgZHJpdmVycyBr
ZWVwIGFkZGluZwo+ID4gdGhlIHJlZ2lvbnMgdW50aWwgc2JpX2RvbWFpbl9maW5hbGl6ZSgpIGlz
IGNhbGxlZC4gU3VjaCByZWdpb25zCj4gPiBhcmUgYWRkZWQgdG8gdGhlIHJvb3QgYWZ0ZXIgcm9v
dCBkb21haW4gaXMgYWxyZWFkeSByZWdpc3RlcmVkCj4gPiBhbmQgbm90aWZpY2F0aW9uIGZvciB0
aGF0IGhhcyBhbHJlYWR5IGJlZW4gc2VudC4KPiA+Cj4gPiBQZXItZG9tYWluIGNvbmZpZ3VyYXRp
b24gd2hpY2ggaXMgYmFzZWQgb24gdGhlIGZpbmFsIG1lbW9yeQo+ID4gcmVnaW9ucyBvZiB0aGUg
ZG9tYWlucyBlc3BlY2lhbGx5IHRoZSByb290IGRvbWFpbiBpcyBub3QKPiA+IHBvc3NpYmxlIG9u
bHkgd2l0aCBhIGRvbWFpbiByZWdpc3RlciBub3RpZmllci4KPiA+Cj4gPiBBZGQgYSBkb21haW4g
ZmluYWxpemUgbm90aWZpZXIgZm9yIHN1Y2ggY2FzZSB3aGljaCBpcyBjYWxsZWQKPiA+IGZvciBl
dmVyeSBkb21haW4gb25jZSBhbGwgdGhlIGRvbWFpbnMgYXJlIGFscmVhZHkgcmVnaXN0ZXJlZCBh
bmQKPiA+IHRoZWlyIG1lbW9yeSByZWdpb25zIGFyZSBmaW5hbGl6ZWQuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4KPgo+
IENsZWFybHksIE1QVCB0YWJsZSBpcyBwZXItZG9tYWluIHN0YXRlIHNvIHdoeSBub3QgdXNlIHNi
aV9kb21haW5fc3RhdGUKPiBmb3IgdGhpcyA/Pwo+CgpUaGUgdjQgaGFkIHVzZWQgc2JpX2RvbWFp
bl9zdGF0ZSBvbmx5IGZvciB0aGlzCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1h
aWwvb3BlbnNiaS8yMDI2LUF1Z3VzdC8wMTA0NDYuaHRtbAoKYnV0IGFzIHN1Z2dlc3RlZCBieSBQ
YXdhbmRlZXAgdG8gcmV1c2UgdGhlIGluZmxpZ2h0IG5vdGlmaWVyIHN1cHBvcnQKZm9yIGRvbWFp
biBldmVudHMsIEkgZHJvcHBlZCB0aGF0IHRvIHVzZSBhIG5vdGlmaWVyIGV2ZW50LgoKaHR0cHM6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9vcGVuc2JpLzIwMjYtQXVndXN0LzAxMDQ1
NC5odG1sCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
