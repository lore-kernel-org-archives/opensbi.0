Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A494C98302
	for <opensbi@archiver.kernel.org>; Tue, 22 Sep 2026 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6WEphjQkHytyDzc2T3XCAfqFxeKNWsII5o6l1cnOuc=; b=MSbrDzcLTpykgY
	aMEq6FdXfvhk3v6/xK6jeHan41aXEq5vqE726av9oNh6diEjM0zAa5GPBLlwOO9EZQ/B8Zg9Tif/o
	trA/ZJcqEjiJ3CDZSTq0VHKbTLukfX23SgR7FBnBuaBZ8DO3eEIJYWjihRyqp8v8gqh07jCCW93kG
	QdWL/QwNX5uuve46DredrygZFFBzF9h6YUhmVUGwP0xD67RxvyZ9fwVQte0v+QoT6kAMpYSMc/ATR
	8lD7oxcYtCTjlOXlBa+stZn9451FsckCoSJvhOAT1OFn83YvhvzKW9MjmOK69DKMwOjD/10VAaEvZ
	Yw+9rafoIVRev9L7uszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93pr-000000067xY-2yK8;
	Tue, 22 Sep 2026 16:59:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93pp-000000067wW-1Mxu
	for opensbi@lists.infradead.org;
	Tue, 22 Sep 2026 16:59:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjNLF3307561
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 16:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+7AGW704XueLP/y0bvsUYRlT8QQF2x6t/46LcA3O7E=; b=U928gVeOWrVq32Zg
	sGf4SDTpZ6/1eaGZjQM2rooRfHSu/3d9rtRUSizlcfw2aA8QGlEwOqM1VN80OcV+
	82VFaQIO8H1rd38uVuJToU3WM4SKAVTQVTcvK3164aZI9a9SgGO3M6B3jLIPpCRB
	wvfGBEhGFH+9UJAGcFSHPZhog6/ScNi95bmgmoTg0ogryj+GPAOPj+aC4sooPp9V
	W3GVtxkFJBEXGRqgrtFJ84FmdZPoYmL0A34oZPjum10QVutFc3VcbupqC+73NJ4R
	HMlkuaQfaGGxdZz9Ptyo7h5v97UzuV9rnjETEGleDKsxVBOdTrAkn+rKWWv/cTG3
	BkccHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113atv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 16:59:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a6937513so15243385a.3
        for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 09:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790096352; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhzYwTTS7syzkeGJ75GyXOVJ842ruFqAoZ8INTwoXB5rr39UYS3Cxhgow+hQxF+5zH
         UQfyv4McUPZ3asVOtLcTMTAN4KE024TMbuAZ8aehqahtLWValCPzipepCCVHR0QD3Kd1
         fRNJUa8vacu00tzeLotS4tpOSA57DkEgPCJkZdLEZ11xkvKDxPHCze3z8td8nxDAdlPH
         EmasqxSIq2Mf3k8nsLW7RJihEqQgRs8/6hBrAnxqdLU0qFksL5gIfU4DdFmG2+SMlXiW
         Ya+/EqQ24kzkoC/DGSR02B9v1Q/oXYXj4g9Y5wU/1YYXsogh4qqXRmSYhAN/4oHy3o34
         zJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x+7AGW704XueLP/y0bvsUYRlT8QQF2x6t/46LcA3O7E=;
        fh=kf02OFgIvpj+bZsfoOZUo7LSGMjGV4JR4Y3S6k/7fIE=;
        b=U+4tknCcnDAb+6xecPQ0aJEdiW43Y9XZePtfl3oMi7mxr2O3ROQc7LavFU4an32fnO
         PPF/O6idrXZHxuVh94z61hmkMkj4cObbxVwnMDZg8vHNhkboIq/lJbnKX6dsIccxWwB8
         X5nhtLnQ7x/MlaEgCVqofPkmFi21JmmJ/R9VoWH1FKXyVHcmQ4qQNpeASbLMxoBLI7q8
         k7hqfwLj7wPyVBHtN+846orFXCjA6/lNc200QteFZUq04hnxN/FmydXR7KE9SPCXjdxt
         y3zdlhvvH6RrvG+UPthWRLeVicm6c/RogpzsspobWzkp4wH/V1oNvL6VpyE3vgDYsfWV
         pAXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096352; x=1790701152; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x+7AGW704XueLP/y0bvsUYRlT8QQF2x6t/46LcA3O7E=;
        b=bonUFy+cm+s1Kw0+MWwjPUfJHVVPON0Q0yKcjdJxUW98bajfGSgOs+1Fs0f6JIvolS
         kxrYAGpOVqOcJ4RpC1j6bYeSwkd5ZCwzGQLNvEzlcfn0K1/zwEhWrQPUAtrYL5rhK9Jl
         MGhoLfxtXLJdLs97iEEJcER+VKdh0UHkJP5jG3H/0mqV2DA1Nra59Aw3tdS6KwMB6kL3
         80OG+1A6PZeBsJRco3XW7cp08dq1vAa2TB8srn8TUuJnF07U3NotE6zJE7bT1GJa0I18
         BGgvtKWO5WS9bDatRh/3/01pekNFrhzp+s6Mws430r6JgtOs7kHjJV5IwYPz7i7QIjUg
         7YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096352; x=1790701152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+7AGW704XueLP/y0bvsUYRlT8QQF2x6t/46LcA3O7E=;
        b=unxkQ6M8mYPD6t40Z27/HKg4hK+7CjHfKHBVSsmKJcTtOEZKGR+uwxy+gnrF4yuJmI
         IpQYpkjBv/NtpJ06UQYKBUBlGTTwnTl9KkGZ2uJSzwUPYP/Ho6qTbgFnkWA860mMVUlO
         6RHAtneiLEn6VQZQxPAVUCOrb/8BfgTFc0Lziy6PJF9eQ5wbteTpONZKyOCOPh+Yblg0
         OL4K0ugKgnyBaLgFzEfn0DR3YcunvyO9ACFMwaBCa9SylVMXbws6Qrj4b3Pnm3cXB7iE
         GXEo2b9XLJ+tCC3UfltLnD12blhySfrBbGRFfc2DCpoXHLyBNVt70FOkPyZuQhLKwq/W
         jINg==
X-Gm-Message-State: AFuF++ld/c/dD/LwgSvesDxNGVuy5Sw3JcA0yKTiVZGjMBO1+myOHCgB
	56GDTWWCbXpLguA2SSB4VWr/BgOQHfag1y7Hl7wQLY/aTARSfSK9385nTUJAv9tcrL1Mb2HojFp
	/s/fguwV2UMynl/wtsryhaGH4YUc+UFamBpK0/JtRTPMr0QSiE8uFIPZH62Js1K86rMtnSfxb6l
	3QP37izpT/LwGbOKrbFY/OmZJ5E7a6BOI9oYZdHgfo
X-Gm-Gg: AYBFou3TL7tkQpyJtBziLqaST2VXEKPjO4pvT/zctRuLDFqUr1d5DcBN48P7EVjygm0
	EwlbhKtf3+ZOuerY637yYc/lw2wg73cayAO38qOZ6RpOA3pGgJOKsX0LSCzA3xizUTOwkXZjlPA
	CPTqiEZZChysiAYqvosvRrZydtQCxPzjvCOPelrplqaI4Z6fkewFMy3cqwAhizPWgB9pGY3vlV0
	M7FtVMr3OwTtV6GiQ==
X-Received: by 2002:a05:620a:2b8c:b0:939:b43f:341e with SMTP id af79cd13be357-93c250ee872mr3406885a.22.1790096351759;
        Tue, 22 Sep 2026 09:59:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:939:b43f:341e with SMTP id
 af79cd13be357-93c250ee872mr3404185a.22.1790096351308; Tue, 22 Sep 2026
 09:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
 <20260918030955.3902993-2-rahul.pathak@oss.qualcomm.com> <CABBgwmvkdGoiZSWVhXqwzsWTLy4veQUn1xLYC_tthx6BTEsC=w@mail.gmail.com>
 <CAFR3w35ayB=drzsAt8NtHizYwXMw9GYfs6ebWOg6RVBUBWC_ow@mail.gmail.com> <CABBgwmujv0mJ5LVo5WYUcjS69actoZjs_24dbYW43kWHzpinPA@mail.gmail.com>
In-Reply-To: <CABBgwmujv0mJ5LVo5WYUcjS69actoZjs_24dbYW43kWHzpinPA@mail.gmail.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:29:00 +0530
X-Gm-Features: AcwNN1VC_yfwrExohzEWaotFruO2QP8oA27SNnlQtAjqSFzwC7y1PY4Lc14UIm0
Message-ID: <CAFR3w36tLPLMfp2LQUYq+RTK3Kg0U9Rmb5Fgnrmaz0_g0bbLow@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/4] lib: sbi_domain: Add domain register finalize notifier
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
X-Proofpoint-GUID: rD7SL45_FMtSEP3Mtw_gdg70q6hzYsCr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0OSBTYWx0ZWRfX/5WjG1mf34V0
 4X/Y47w44oQHuSpVxu6vOKt+mH4qctJr4PTC0wWXNHJQ62Ov0Rs6zgdZ3mIerhMRTxY5dByyZit
 tgwhdFL41m906G2+zyaTnwMKCSTP+I4=
X-Proofpoint-ORIG-GUID: rD7SL45_FMtSEP3Mtw_gdg70q6hzYsCr
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2b3e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=gKGB39VMmCEkrpKh_2sA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0OSBTYWx0ZWRfX9OCKl4g6ZETe
 yuygvu0kAvQotzCOCjcPUbj8B5ATbEOvUW6w3Yqq41pLoG2sJDr/iPD6g3CR2UKDg4cCgdDUH9Z
 rHm10RisKurIIkkmZ6i/+jB89JN+gw9EKvSQYYpW1wdy+tjxZJs605wtWUt0ilH+eDhPeiHGYIq
 zrwOPr7ja21HEsQJ5Vs0e2V0x12HsrFvArKQDrfJanasfFcVNBx+dZZ0Sdvvdk1yd70efo0tEH1
 gtAd/3ZG0AufHuBJkHHam14bdKNBhPp0kp2ZW7gf8JhZwl0+PXCwh8y4THWAJOgeiucp4chvB/H
 0XPtJeh9lLqFtn7hqf0VvEVELpJM12ROe/5gpzQd74mqNNqmcJltKDAufZa/fh/T1M49OnMzgCS
 MCu4t053ykUwOQfonmwj0Re8td7m2otzDDZanUHDCXkkCeHqhWuzUMUKuGApp7y+Y1YBhmq1/Os
 KJcs9HWwsDKB6dWZsUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_095913_369384_F4F4F46A 
X-CRM114-Status: GOOD (  23.96  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTA6MjTigK9QTSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVs
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTA6
MTPigK9QTSBSYWh1bCBQYXRoYWsKPiA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+IHdy
b3RlOgo+ID4KPiA+IE9uIFR1ZSwgU2VwIDIyLCAyMDI2IGF0IDE6MzPigK9QTSBBbnVwIFBhdGVs
IDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmks
IFNlcCAxOCwgMjAyNiBhdCA5OjA44oCvQU0gUmFodWwgUGF0aGFrCj4gPiA+IDxyYWh1bC5wYXRo
YWtAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBzYmkgZG9tYWluIHJl
Z2lzdGVyYXRpb24gbm90aWZpZXIgaXMgaW52b2tlZCB3aGVuCj4gPiA+ID4gbWVtb3J5IHJlZ2lv
bnMgb2YgdGhlIGRvbWFpbnMgYXJlIG5vdCBmaW5hbGl6ZWQuIFRoZSByb290Cj4gPiA+ID4gZG9t
YWluIGlzIHJlZ2lzdGVyZWQgZWFybHkgYW5kIHRoZSBkcml2ZXJzIGtlZXAgYWRkaW5nCj4gPiA+
ID4gdGhlIHJlZ2lvbnMgdW50aWwgc2JpX2RvbWFpbl9maW5hbGl6ZSgpIGlzIGNhbGxlZC4gU3Vj
aCByZWdpb25zCj4gPiA+ID4gYXJlIGFkZGVkIHRvIHRoZSByb290IGFmdGVyIHJvb3QgZG9tYWlu
IGlzIGFscmVhZHkgcmVnaXN0ZXJlZAo+ID4gPiA+IGFuZCBub3RpZmljYXRpb24gZm9yIHRoYXQg
aGFzIGFscmVhZHkgYmVlbiBzZW50Lgo+ID4gPiA+Cj4gPiA+ID4gUGVyLWRvbWFpbiBjb25maWd1
cmF0aW9uIHdoaWNoIGlzIGJhc2VkIG9uIHRoZSBmaW5hbCBtZW1vcnkKPiA+ID4gPiByZWdpb25z
IG9mIHRoZSBkb21haW5zIGVzcGVjaWFsbHkgdGhlIHJvb3QgZG9tYWluIGlzIG5vdAo+ID4gPiA+
IHBvc3NpYmxlIG9ubHkgd2l0aCBhIGRvbWFpbiByZWdpc3RlciBub3RpZmllci4KPiA+ID4gPgo+
ID4gPiA+IEFkZCBhIGRvbWFpbiBmaW5hbGl6ZSBub3RpZmllciBmb3Igc3VjaCBjYXNlIHdoaWNo
IGlzIGNhbGxlZAo+ID4gPiA+IGZvciBldmVyeSBkb21haW4gb25jZSBhbGwgdGhlIGRvbWFpbnMg
YXJlIGFscmVhZHkgcmVnaXN0ZXJlZCBhbmQKPiA+ID4gPiB0aGVpciBtZW1vcnkgcmVnaW9ucyBh
cmUgZmluYWxpemVkLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFodWwgUGF0aGFr
IDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4KPiA+ID4KPiA+ID4gQ2xlYXJseSwgTVBU
IHRhYmxlIGlzIHBlci1kb21haW4gc3RhdGUgc28gd2h5IG5vdCB1c2Ugc2JpX2RvbWFpbl9zdGF0
ZQo+ID4gPiBmb3IgdGhpcyA/Pwo+ID4gPgo+ID4KPiA+IFRoZSB2NCBoYWQgdXNlZCBzYmlfZG9t
YWluX3N0YXRlIG9ubHkgZm9yIHRoaXMKPiA+IGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9w
aXBlcm1haWwvb3BlbnNiaS8yMDI2LUF1Z3VzdC8wMTA0NDYuaHRtbAo+ID4KPiA+IGJ1dCBhcyBz
dWdnZXN0ZWQgYnkgUGF3YW5kZWVwIHRvIHJldXNlIHRoZSBpbmZsaWdodCBub3RpZmllciBzdXBw
b3J0Cj4gPiBmb3IgZG9tYWluIGV2ZW50cywgSSBkcm9wcGVkIHRoYXQgdG8gdXNlIGEgbm90aWZp
ZXIgZXZlbnQuCj4gPgo+ID4gaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9v
cGVuc2JpLzIwMjYtQXVndXN0LzAxMDQ1NC5odG1sCj4KPiBBY3R1YWxseSwgYm90aCBub3RpZmll
ciBhbmQgc2JpX2RvbWFpbl9zdGF0ZSB3aWxsIHdvcmsgaW4gdGhpcwo+IGNhc2UgYnV0IHNiaV9k
b21haW5fc3RhdGUgc2hvdWxkIGJlIHByZWZlcnJlZCBiZWNhdXNlCj4gc21tcHQgZG9lcyBjcmVh
dGUgYSBwZXItZG9tYWluIHN0YXRlIHdoaWNoIGlzIHRoZSBNUFQKPiB0YWJsZS4KPgoKU3VyZSwg
d2lsbCByZXZlcnQgdG8gdGhlIHNiaV9kb21haW5fc3RhdGUgd2F5IGZyb20gdjQKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
