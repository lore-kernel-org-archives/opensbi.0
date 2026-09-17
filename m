Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454BFC982C1
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 02:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApxPM+LQrlmH1yj4wSfHfqirAjR3saV6fZe6U33le2Q=; b=jbmYGau8NVhorh
	ky6ESxiaOXFMMOWjZWuMC5hEpn+EeqOZ93H1YxROJgPSBe6kye+q9MkdRarmmdkiEypf46maivxYR
	LOxHwgrVNuato4YEiQtpyJhdTNqHtr6t2I8knlKdCgJeNqCYBuVzIs8+S1H8SN8KM6DLh7ylnnL2R
	qqr12T+9nvn7BfMgiGppBJv8XCJbjjMsA9XztdyG3Ff78gub2VMPQM+ZVSvaLN0qyJ+lAlgh4f5Tq
	gZDX2GJEUGeipExFNgMoXQBY8sIAHbSspSWQcyslopuWahqKaGuugIfEAe82CQC6am11747Pf6sNL
	Bl+LCshgL6Hug944kSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72HX-0000000AUxN-0Nae;
	Thu, 17 Sep 2026 02:55:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72HU-0000000AUwP-1yuj
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 02:55:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1hlWv3559773
	for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 02:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twT/3GUMM0wzWokLoPW2rpDtzm2PCAJkXLy0xy18x/I=; b=cq/O4r28kN/9QKNl
	PXWDu/K+qfyrR5kgOGdSEq7lHCTF/2ULHVNdfF4f8yE0LXVVANUauZEg+E/lB61+
	WEmoC25RLd2h2uYF0LQmozYqMMGOSPbUftDoDvO6HBmSPjgFRn6EXG/d4RS7De13
	2qf+ORgwd7SbsGJQT/yhN04TZ74WqO33M5nHyHifTN3PPqTFKXnPWkwGrCikXnun
	o3aY1DruhI35pdg1lw48nrA4AcO6FvUIfwvd5d3cqotn9K32TDYTPbeahYwWdQEx
	izia4s3yXzgQop+osyoeLAc7Q+2ORTQztGsrUNCb2gTCtFTlmsfLdsw4QhnCWax2
	a9bVEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7ha1gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 02:55:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91051512080so5965336d6.3
        for <opensbi@lists.infradead.org>; Wed, 16 Sep 2026 19:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789613721; cv=none;
        d=google.com; s=arc-20260327;
        b=Jgx+SZ8AHp28kkRHpeBAp+dmwdcpKX1FDIGJWDu2dg4rHmDrTNwcxCHapqOs0aWEVj
         1hJfVx/oQKuNJaE5njwNienW5XWOPDMzis+Y54pp1PqyHktnqBCxSwI1ouX4pF+HXjjw
         KYrtS1zziAvscG2cyXklh6tD1vYR+csCACV5jrmtHw2jowFY8dijxa/rLbbQ8jtZdcXz
         9Gy1IFMry5NmO4G1EepyKsCKA36UxUeLi9OBq5bgrhJRloAL+JENFvbACBFkNW/jlPKj
         T0S+PLFfmVkfgfb2yS4PNCweSj9eqDiyb8I/OfbbCg141utJEDgU8+HNu8DHtlH8yi36
         /yfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=twT/3GUMM0wzWokLoPW2rpDtzm2PCAJkXLy0xy18x/I=;
        fh=Ck9X1cQ6zEXteMjVk79ib6BKr+LbI80fo5ky5B2JXhI=;
        b=CcJ4xLJqMhECHKRZDeIQ03ftd/na0+XoogyNOnM42+dCwU1CehWSccsBkO8hz6V2Xi
         yu6C4NP3z2c7yLEwPqQsX7wXnO0vpFHcIS3DbxDnepsM3tC6fPiUnHV07ueB+jpH54yU
         Kyuuh53NC46dn9e13yyaKqw6rocu3Ff3QMIY/4DERNa2pHI8eMdFNycxskFKdE1uceFa
         wj4GfM7bZZ2zUcmu6eMcFjDmxqe9hGoI5I57QrVCLa/s/gS2w7gWAiuQuyv1no/nhcBV
         w62B5oCPM+RagM3akJaEqIdvQKW6evAG5oYW6mRvWEVSAmP6VscFTICzbWLxfpQ1fJ3V
         3TvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789613721; x=1790218521; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twT/3GUMM0wzWokLoPW2rpDtzm2PCAJkXLy0xy18x/I=;
        b=Px+P9NEKo37FbE2da9c+iVOo2MWiy0BbXgcBbVqAnLPMoT13NikGlbL+FUl7hQwRr0
         EDQq5HPlyf0FgWbretCTfVf1S0Jzoh9yYmDXmspS31CbkuEfoqMSQR9F2OmenbRD4aUx
         DnRoU9YDxbj8Z0pH1qA1s2X002NtDFbbo+nDMdQSU2r6co7CSJ1DF6aeGnryxOL0EM67
         NkBKaWV2bhLMHfXluXapJHv4X9arYL/E1uRmF+ahUh/asTbDgx6BX9GwXS2Uyx3Dk3nU
         8cHF53saewRf2aJcg3QQmw7TcvU0inKvN6NLYy0amgrL7E8CfR3MMjWhJQxw56BBBxnb
         lTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789613721; x=1790218521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twT/3GUMM0wzWokLoPW2rpDtzm2PCAJkXLy0xy18x/I=;
        b=tQTQD0sMbIG8hIoscUBQPMfEsncnqeKAQuQOhUU1E8p7I4ke1/T5jXe0XCnL+UK4TG
         kHwtU1G/rqgsNVg9jIPXiVmRjK4IgoQwByrDgNdRbxIGvAvPTmekoNA6t0l/fBK/aSd5
         vzxlA32Y7agc6z9S88+1c/COzvBynDSvZHGkFy8BWDC62lVohDJ5K+YrrYxG/YPELBIF
         HyjZ0kCGPKZyb81Ce6MgCTfyuEr5cUeoJMOCdorkOckVTFSN9cvUbtBGJ4+GbWgahHWY
         clIDgsQ34MFD2IHV11l/1GYtv2mHkxt35ZyO6ANcdIUdkBCDFvLS0HkDHDg4GdHCSnAe
         qvyQ==
X-Gm-Message-State: AFuF++nN3DMoRD0ptHNd33XVfJ8G4Or69U4r5b4yFdVYGxMOGhV3Ew3u
	OHRXJvcM3oQi+dHuYVfpiADwuYWky4a7ZjyF/i1c/WFgkLHV0XSmsA6CJLmAUZ/1iaScBH4VGRw
	RVMm/JpawGKcNgenVLQTMlIwfQvWesNIDetVz2Ca6oZNUeLaGqKw7hXDzFNcCZ8FhOx+rAhnVoD
	gauzpW2b6gzNINXcAj5vLO4vm2YhmeJnsQmgAVYrygzAks2gH1
X-Gm-Gg: AYBFou3THrpWu87/Urby2Y1hj19F7Vv25g5eVLUKuDYVygUmy/J5svwpI4tbcZFTZE0
	zi3h9R46JChAKCYEAEqVMo9tXTWEKdpsAIIiMPOkNwIGurpCbJXCZtuq1h2EeYzriJq8K+QKQY9
	x4UIoxC3+zhXSUKZ6yw2bx5oGcrh9UcaN1Dg9Lq94oSV5tk2/JRiKQWFkH3w==
X-Received: by 2002:a05:620a:2815:b0:939:b94c:3e85 with SMTP id af79cd13be357-93bb78803ffmr924091485a.24.1789613721183;
        Wed, 16 Sep 2026 19:55:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:939:b94c:3e85 with SMTP id
 af79cd13be357-93bb78803ffmr924087885a.24.1789613720761; Wed, 16 Sep 2026
 19:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com> <20260910210819.525538-2-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260910210819.525538-2-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 08:25:09 +0530
X-Gm-Features: AcwNN1VPwf3CUMUNL08Fwm3Ci-aqmmmUTKSHsX13SI5LYS-Z2TPd7p3W7U9ZcOY
Message-ID: <CAFR3w36W3hqtVMKNUyF0Fj2DyOy3XG7QjJ2X4d-A6fGirjzUiw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib: sbi: domain: add domain registration notifier infrastructure
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzNiBTYWx0ZWRfX4XDHzfQYC3dP
 Y6nArgMTJUexoiSM+pjvFnx05XCuZ04SXKZTijS+fXZw2yRACFEOHQFxAUH4LkiIvLoBWlYB/3e
 O8o7sAJ39J82oDOZsUW7pnvDeE5vKr8m/TnqsEcyUur6bUEiCT8Q3Qp1ZS2c+gd/gJMaRyE0gnt
 p1iBHCs4WzpSXJAxzTF8MzZ5yd9TrlxF/5M8HxMob6fq6YyC48z+3Kef69HIl+jxzWY7duAT6MB
 EFvnoCHBqm9urxdNGuS5NgXqdqsHe7lZTVlnRjOSgCK7PyGONgU4M2eDI34Qb1OgoQGu34kodrV
 L1ZwpJhvVmM+sot5bkzSrpJafcK2TKRCJamOcxqJRfoIt1w7jyHhSGopOa5x6d8/LTD9tYPy3gO
 sgmv5A85KLxkdRmFqeCARh+B/LsvDDYp2xHB4isp3j4JdH4h1JViRD3cMHLpHvH5JuJI0+ZmfSN
 MEHwsfTYOLZ41F0bEPA==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab5699 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=KL_hXg2APzEVhUBVGEAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: Dab53LO90dvdjflo0bu3L9VV1YKIigER
X-Proofpoint-ORIG-GUID: Dab53LO90dvdjflo0bu3L9VV1YKIigER
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzNiBTYWx0ZWRfX17EvPOvPoJch
 ovENvBIXXCNxcU7/xIrZIct0uE+OkxURbcUfVJcbp7qotUDg+XNOEXDG661yX1ombjOvKI646MS
 bGfLeDnljkJSWo7u5UR/ENOxt1WVegc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_195524_636412_5EDD5574 
X-CRM114-Status: GOOD (  18.65  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjozOeKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBJbnRyb2R1Y2UgYSBub3RpZmllciBj
YWxsYmFjayBtZWNoYW5pc20gdGhhdCBhbGxvd3Mgc3Vic3lzdGVtcyB0bwo+IHJlZ2lzdGVyIGlu
dGVyZXN0IGluIGRvbWFpbiByZWdpc3RyYXRpb24gZXZlbnRzLiBXaGVuIGEgbmV3IGRvbWFpbgo+
IGlzIHJlZ2lzdGVyZWQgdmlhIHNiaV9kb21haW5fcmVnaXN0ZXIoKSwgYWxsIHJlZ2lzdGVyZWQg
bm90aWZpZXJzCj4gYXJlIGludm9rZWQgYmVmb3JlIGRvbWFpbiBzYW5pdGl6YXRpb24uCj4KPiBU
aGUgZm9sbG93aW5nIHB1YmxpYyBpbnRlcmZhY2VzIGFyZSBhZGRlZCB0byBzYmlfZG9tYWluLmg6
Cj4KPiAgIC0gc2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmllcigpOiByZWdpc3RlcnMgYSBub3Rp
ZmllciBjYWxsYmFjay4KPiAgICAgRHVwbGljYXRlIChmbiwgcHJpdikgcGFpcnMgYXJlIHNpbGVu
dGx5IGlnbm9yZWQuCj4KPiAgIC0gc2JpX2RvbWFpbl91bnJlZ2lzdGVyX25vdGlmaWVyKCk6IHJl
bW92ZXMgYSBwcmV2aW91c2x5IHJlZ2lzdGVyZWQKPiAgICAgbm90aWZpZXIgY2FsbGJhY2suCj4K
PiBTaWduZWQtb2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29t
bS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCB8IDEwICsrKysrKysKPiAg
bGliL3NiaS9zYmlfZG9tYWluLmMgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykKPgo+ICt2
b2lkIHNiaV9kb21haW5fbm90aWZ5X2FsbChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+
ICt7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9ub3RpZmllcl9lbnRyeSAqZW50cnk7Cj4g
Kwo+ICsgICAgICAgc2JpX2xpc3RfZm9yX2VhY2hfZW50cnkoZW50cnksICZkb21haW5fbm90aWZp
ZXJfbGlzdCwgbm9kZSkgewo+ICsgICAgICAgICAgICAgICBpZiAoZW50cnktPmZuKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGVudHJ5LT5mbihkb20sIGVudHJ5LT5wcml2KTsKPiArICAgICAg
IH0KPiArfQo+Cj4gIHN0cnVjdCBzYmlfZG9tYWluICpzYmlfaGFydGluZGV4X3RvX2RvbWFpbih1
MzIgaGFydGluZGV4KQo+ICB7Cj4gQEAgLTY1MCw2ICs3MDgsNyBAQCBpbnQgc2JpX2RvbWFpbl9y
ZWdpc3RlcihzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiBTQklfRUFMUkVBRFk7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIHNiaV9kb21haW5f
bm90aWZ5X2FsbChkb20pOwoKQm90aCBzYW5pdGl6ZV9kb21haW4gYW5kIHRoZSBzYmlfZG9tYWlu
X3NldHVwX3N0YXRlIGZ1bmN0aW9ucwpjYW4gZmFpbC4gSWYgdGhlIGludGVudGlvbiBvZiBub3Rp
ZmljYXRpb24gaXMgZm9yIHN1Y2Nlc3NmdWwgZG9tYWluCnJlZ2lzdHJhdGlvbiB0aGVuIHRoZSBz
YmlfZG9tYWluX25vdGlmeV9hbGwgc2hvdWxkIGJlIGNhbGxlZCBpbiB0aGUgZW5kLgoKPiAgICAg
ICAgIC8qIFNhbml0aXplIGRpc2NvdmVyZWQgZG9tYWluICovCj4gICAgICAgICByYyA9IHNhbml0
aXplX2RvbWFpbihkb20pOwo+ICAgICAgICAgaWYgKHJjKSB7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4g
LS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
