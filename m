Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C010DC5B572
	for <opensbi@archiver.kernel.org>; Sat, 22 Aug 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yw0n85yJ+CCBmq7SToUsnNRkZnfrG9gPRGJ3KhFoE4k=; b=sfCYFAMwgLX9gJ
	9pf6Uvs0ojbdkCK1rvFJRNk1J89oAJiTl82ziQVTGsit7BO9H8S2dh0B3rHD7cGsjD//Xvg7aypWJ
	uf94yZv55omuABKlEKd9SgDw7/34sZhIwcaX0vgNcQ5W8uUhAzlNvdFkVZpaEc9nMFwruoHSjAVGY
	5VcpLYA4Tigl7bmn41vPf4MQkr46lHi7c4OjvN6tFfAKtKg4b6gAH3ZF/aSiZTwI5pMdWQWqWDpPQ
	2VLKaH1mhwluNyBsETiBAK+tenU2DgtGBNzPFKrGUL22yLuIx13j6gJiCcl167+aw+9XDeGHZNwFJ
	zNHM4LfWt/lHNbY8bWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkiy-0000000EVuk-2jv2;
	Sat, 22 Aug 2026 12:21:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkiu-0000000EVtx-1VT2
	for opensbi@lists.infradead.org;
	Sat, 22 Aug 2026 12:21:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67MB6vS91401601
	for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 12:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdBDy17PuXNBZsQubGPzzpn0AIuMqekLigLmkJTDMu4=; b=lYRHDSLHnuePm/Rl
	PjKmFThXnMtz29lhDldwPIg81D67VanTmsi455+O/5E2A2MB7xZTSBmywPZ/2HZj
	icW/qbTMrJZhwDoQOmnhYylJ9d25PiwEP/0UuNZ/gNCFNbHDgXbGiqaErNMbReOJ
	MWZY1KfEu/x2qcnHEoQd9Zv0y60/6riSfhZhoEmHv7K/VjuYSnYhxtcJV45ekpPA
	ASf3P0ZQJRlpatXrgE5INPEMuyZWVIfovEBvQyzqvGpkTArWbKwZOABhqkN0x0PS
	oUia48RqOA9eM3ps8zufBmXZy1/Wjw2JRQEiBDhKexBiIq6r87E/a7Mn1h1P4/hP
	djriGg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740a165q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 12:21:17 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6abfca68so54803757b3.1
        for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 05:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787401277; cv=none;
        d=google.com; s=arc-20260327;
        b=a/A1/qtzGYmJ68t/vZwB5yVUqWuBORbMeQBv6eKJevg8hXkkfbv43smWzK/6ClT6uV
         m0JL0Pjgqe7wUPp5+8xq1ljyw3gYWmRgpLlLpC7R00z/IYiXP4xVfQ8jSyzlBJqrKszr
         InS/MSkXDaQA9NGaC4x1a7kfgCTFnuR3umM+AwtYVrwMQi5eURYgpglN2aKhxseNGRpn
         aQh4FfZBJxbcmY62qEVeflWJnRg36AYogMBNumpmnxKnWpuKoRL045ug5vLi/z0VsVWQ
         z4wtHQlUzBGJSwx6kF8Mz5+ko5R0kGzPscgrpP5Mb6Y96nhoecLhLLiKcdD2lUX/xEa6
         OKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YdBDy17PuXNBZsQubGPzzpn0AIuMqekLigLmkJTDMu4=;
        fh=jsCfxR4rjiXuH8wp5t/ZUPpQDjIYd9Sx0AzGEcvb5wA=;
        b=Q/5NvtX8pGXyFH1EeWaB3ddpDaWa0Z3GTZZOZhMZ463K8gqfCDr558niSCtmg1lLfM
         YdlBY7qSb52Y5IgR/9ngUfdSQ1LIsO8LmUuRju8f14XC68aH+xIbV5Buko/2sOp61sYp
         JMTbtA/XKC4059KWah54CuIdcxAVzC2y3OWnrhHEEoQ0q7DllVAdPMlCn8wouZTeEx3O
         ARxrBMzFsUiOrCzHozSf7uBuLoVATjIdlZwumq5pdxUKPCnb12LBbKpZrBZ0wWfOJb/Y
         ieN4Ko1lJ6ZUJQ+VqgahLnJ4jm8woPhTaNt/6W6dAyOznqNQ2lpast905ezLXKhFwqM8
         Caiw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787401277; x=1788006077; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdBDy17PuXNBZsQubGPzzpn0AIuMqekLigLmkJTDMu4=;
        b=VBTf3dTsIL5B0yegD4nN+M6lVOEw7vPNiQ2thoUJTNG6zKu1Gz24oKG0u5WyiU3jwO
         3Noqqagw4U9JePYT8JySJhaE0LrEvP6iJMDziRU3VMWErfBLMtj2KizFRIrkZeSgYgqy
         vIrt2sE98/IsHUfoWBbaIZel8ddv6F4posQGHYbMfrF7orE0W+0H9i0L716IkloYXPIk
         +GpmZkm12Z2r5DkG2ZL5S0gZFnBPcU0vdiWp3l8I1l9yYCuRTU21J7h59JWy6fSZ0QvL
         1sWBSVhjGzUtfyLxdrC0YSegNDkinUKHqFFoWYUVlwwTYv4rWdEQ8CuIgAlqMxzIkMh9
         ND3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401277; x=1788006077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdBDy17PuXNBZsQubGPzzpn0AIuMqekLigLmkJTDMu4=;
        b=gdjJzqV094HC4jW1EtrF3J05UdiuJaDJOVntMWdwyUXquuSC6J0dEPBRAWOiYoprWe
         iG2KGnXa4M+I/bcahdrhNyBh1zjWppShY5n0GtxWwddGW+Gud+yiU1VJlyLC0Y2Tr5s6
         aX23NE5xT7wunRJJvgkiR7DwrLWzRbyHhZB+aK3nw63PipN/qaYyOQUmPLXyNOYtohtK
         xTFA1lzHLoefeY/RTt4Wa5Lq/BoS2pj0cmjz9mp22Vjhlh6SZryd7QXWIZQROgNTr44k
         iKyVQ4JqvfU0wn0GggOBZwKF0uCgUK3VHSy3QB3DpZeAQRIHbHxL2/erz3ikMYMpILyJ
         MevQ==
X-Gm-Message-State: AFuF++luJso+z6kKVFKeL+jN0rypBAGwXrn7g4gxTSkHPliwxPJ+GpV/
	oMwS8Qvl7GBlmQ3NbcSI1XOMv7/MGf0FVUPNKVtqoxlDtqhSHTXxD2N0Nvm5JuwN7z26Wija91u
	PGcuI/gCjSN2/d6o5N7jaWKsRJaDuPDJBCj09p570bvXWwJHRhxN2A3FU9N734QK7sYA2vAFgR8
	pBehaxBJh82eHX1KQDAR4li8GUAg/M6kYeH4YJ7za+
X-Gm-Gg: AR+sD10M38nukWT8JEVcnrfWWgrN4FSHj8Pw0phSu5fpEbdrYjOkkTlUPCQujZ9u6DY
	PjGR1mOdc17D6ZCgThwuEkTJ7Mwcgmz2MIMMfEgkos/dGcNT6IER7p1HHQwakT7Gej9miC5AnZn
	gw6lE5Tx/qWSF7QxsYXlIZu3d2xo2HszhigPh7Ec9TMkfs4eXu+ehCSBAKt0k=
X-Received: by 2002:a05:690c:389:b0:81e:d792:a019 with SMTP id 00721157ae682-84c93848f54mr19271297b3.6.1787401277094;
        Sat, 22 Aug 2026 05:21:17 -0700 (PDT)
X-Received: by 2002:a05:690c:389:b0:81e:d792:a019 with SMTP id
 00721157ae682-84c93848f54mr19271157b3.6.1787401276707; Sat, 22 Aug 2026
 05:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
 <20260805183839.2576691-5-rahul.pathak@oss.qualcomm.com> <CABBgwmup0JLOpMDph7wLCuifrtNv9B0ByWYKN4bbYMqpyCRr4A@mail.gmail.com>
In-Reply-To: <CABBgwmup0JLOpMDph7wLCuifrtNv9B0ByWYKN4bbYMqpyCRr4A@mail.gmail.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 17:51:04 +0530
X-Gm-Features: AcwNN1X6Eef0E3s4pa5JO_KFu5AkKOepefkrDPjuOKp_AnAHZvZuUGbqwW7mdv8
Message-ID: <CAFR3w36cqnMM0WeNVeobaxQn0G0YjBJUuVmYjmRYbbdyo9J1fA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] platform/generic: Initialise MPT at boot
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDEwMSBTYWx0ZWRfX0tk5n9kHiCRM
 /fjzHwR7AjM/wngd0xHXfxZzxQfXjLFfxyJa7ZcGl2FsyMVsxmUzBUnVWh2rn4pBxrf7hS0r602
 7GSjG765/shJb20ZHaMaZEBPLRQ2ewf5Q1D2dSM/tboFSNWIF/XSvKv48f0pfTiHRA1HWGFEavx
 eCnsGpxkneH2OGS50mi1Cdfo6HrhJkEREmS7FvnS3lSsVNt+pzni0bN+iSTgtacWx1cnP0q6ofn
 LYsLjjiFTGUsuTxLl9ZEXuaxno07JDwuBdN1hkjCpLrEVESubbV3Qps5SMNEcoHFCdsqSGxZCYD
 F57mRCDB9FIVejHwjDMjA0TvcxMTfzE8eCvZGFJL9VMc/nagQOjScg9hYoR9CBVJlhc2t6UfsIU
 iuvqJR4vkZcYOKVS9b3V9cZtKZGK5nB/NDmF1TEB3yNZyyaShYJ4P+AFYoHxADGycsf475Fp3w4
 gCJBH5FuEWnS8eO02zw==
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a89943d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=YPpVoDUYTjM6ubEL5oUA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: vY77RYKT5T1YbWQYJrt1_QTpIAJhEuir
X-Proofpoint-GUID: vY77RYKT5T1YbWQYJrt1_QTpIAJhEuir
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDEwMSBTYWx0ZWRfX0SuKlgjkYI4Q
 ZON1qZHtHIYJ1s8dDBl8DTRx9wiNepGeuOkFPHTzKRPOwWSOt+CTLJs3J+9mEwfH1lX0GOVoVlt
 ZDsy8dYUX3paT5+1LnGamqHUG2DvxEg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_052122_085461_3DAFA9A8 
X-CRM114-Status: GOOD (  15.57  )
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

T24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgNToxNOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyA2LCAyMDI2IGF0IDEyOjA5
4oCvQU0gUmFodWwgUGF0aGFrCj4gPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29tPiB3cm90
ZToKPiA+Cj4gPiBJbnRlZ3JhdGVzIE1QVCBpbml0aWFsaXNhdGlvbiBpbnRvIHRoZSBnZW5lcmlj
IHBsYXRmb3JtIGJvb3QgZmxvdy4KPiA+Cj4gPiBtcHRfZWFybHlfaW5pdCgpIHByb2JlcyBmb3Ig
U01NUFQgZHVyaW5nIGNvbGQtYm9vdCBlYXJseSBpbml0IGFuZAo+ID4gaW5pdGlhbGlzZXMgdGhl
IHN0cnVjdHVyZXMgcmVxdWlyZWQgdG8gYnVpbGQgTVBUIHRhYmxlcy4KPiA+Cj4gPiBtcHRfZmlu
YWxfaW5pdCgpIGNyZWF0ZXMgdGhlIHJvb3Qgc3VwZXJ2aXNvciBkb21haW4gd2hpY2ggaXMgbWFw
cGluZyBhbGwKPiA+IHBoeXNpY2FsIG1lbW9yeSB3aXRoIHRoZSBmaXJtd2FyZSByZWdpb24gZXhw
bGNpdGx5IGRlbmllZCB0byBTLW1vZGUgYW5kCj4gPiBhZGRzIHN1cHBvcnQgZm9yIGFuIE1QVCBk
b21haW4gZm9yIGVhY2ggYWRkaXRpb25hbCByZWdpc3RlcmVkIFNCSSBkb21haW4uCj4gPgo+ID4g
VGhlIGhlYXAgYnVkZ2V0IGlzIGV4dGVuZGVkIHRvIHJlc2VydmUgc3BhY2UgZm9yIE1QVCB0YWJs
ZXMuCj4gPgo+ID4gV2l0aCB0aGlzIHBhdGNoIE1QVCB0YWJsZXMgYXJlIGJ1aWx0IGF0IGJvb3Qu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1
YWxjb21tLmNvbT4KPgo+IEluaXRpYWxpemluZyBNUFQgZnJvbSB0aGUgZ2VuZXJpYyBwbGF0Zm9y
bSBpcyBub3QgdGhlIHJpZ2h0IHdheS4KPgo+IE15IHN1Z2dlc3Rpb24gaXMgdGhlIGZvbGxvd2lu
ZzoKPiAxKSBDYWxsIHNiaV9tcHRfaW5pdCgpIGZyb20gc2JpX2hhcnRfaW5pdCgpIG9ubHkgd2hl
biBjb2xkX2Jvb3QgPT0gdHJ1ZQo+ICAgICByaWdodCBhZnRlciBzYmlfaGFydF9wbXBfaW5pdCgp
IGlzIGNhbGxlZC4KPiAyKSBJbnN0ZWFkIG9mIG1wdF9maW5hbF9pbml0KCksIHRoZSBzYmlfbXB0
X2luaXQoKSB3aWxsIHJlZ2lzdGVyIHNiaV9kb21haW5fZGF0YQo+ICAgICB3aXRoIGRpc3RpbmN0
IHNldHVwKCkgYW5kIGNsZWFudXAoKSBjYWxsYmFja3Mgd2hpY2ggYXJlIGNhbGxlZCBmb3IgZWFj
aAo+ICAgICBkb21haW4uCj4KQWdyZWUsIHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0IHZlcnNpb24K
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
