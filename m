Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430ADC531FA
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgmkdFTvBu2FkFsERB3pod0INq9fELVanS4qommqKy4=; b=Fh4i+TINOOxvl7
	Gq2wnvIeVLWe1Lrz9vKKgxH0JoQYsxojTSevcTCRl8gV8XeLFoq31CL2xnGcZgTed/ZZ+Lc6w+eQB
	Biiu/c0y6n+Z4aRSCgQunl+vkPiuvV2jCaMMQV1Y+KLpZTxmk4N6ZCUA/pdCnZbGrI1qILsMPc8HV
	Sqp8E299IxAhzVRJQjtT4THjJMaRrdaLEJW2rlnofMNfJ3NIq8tP36CuOUc7MDKfU1mtul8dNnFb8
	Jty1mDR8deivl73ULemlBuaBaqCDr/sU82bl9fTvOyUZR8EEES8Quv6rbGJtnreG6tUe7TTvaPzcW
	PpmzW7ZYdymPz9Kn/k+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHHx-0000000GcXC-0hO1;
	Fri, 24 Jul 2026 14:54:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHHu-0000000GcWc-3jKk
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 14:54:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbNJQ3335782
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 14:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0FizlNtfIGL9PSU8NrVwR0RXFKLZe3upW3pb1LXZ14=; b=PtuU9qLXdAzv6Dcv
	+lPePEvVKGkW6B+l88YsDonMP30zw45+jMfYxqZ82Qb7U4Zn3igqhcLq3wvm4PhR
	u+tJfE0FJV+7ytkU4FTI8Z8gqws95kDZYn7Io7f6445YnC5LieUcVyUpnVPGySdB
	VqxyXccBNh2qHNqBHUR6bID41WyoyKZx+Chb6vCYf/8BZhrHJ9muR1pQLGLRANjX
	LxTbab+dp37S0nU3++BDe8DE4NgmoN/r+nde3546F/kxzMS5shU0LW5On5Whms3P
	H4MFn2cIHmKjVpXJ88gBzbuJ21I18Lm5XALSrk7TKEJnyu8EwKmMmZjJXaLSgUxM
	l+/keQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5bys7gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 14:54:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so1048662a12.3
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 07:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784904848; cv=none;
        d=google.com; s=arc-20260327;
        b=k0RRRivt1NLKCIUubVx2vnDVwEKAA/SZ7Kyl7oerBp9Y3qawjMUoea3tIq3KnuHwSK
         XJ4NrZN0Fe5jzH2g1fst76Hdiv8ZIqxUHRXbiGtitAOWwChZZuTwN9mKx3lMlt2nf7A3
         673W0KReASAz1AsbZvjgrzQO104utFijT7Kp7W3IFruvqUqI3fEODQTKMKc11JzQoYoQ
         KR8xfLGbjz+OZFvSJWqO6utE+7AaXcZdnfth8AGU87C4YujNnOYKIwK5q/p7F3+j5Udg
         dCf/9aWTry6NPYoUuHYOALv5sVx2PQMiiQRJBYSwg59vPt2ihmNbrl5dbbpgr3tjW9iX
         O8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0FizlNtfIGL9PSU8NrVwR0RXFKLZe3upW3pb1LXZ14=;
        fh=DBa4WGrV/H0e/OSAigIJpib9dU9XLZ1UNUfbRvHe29w=;
        b=XtN+ZsSe8J+XGCD2erKkAaRh3Go53jCJbBbF85YR+aomkXCb/ZEvy7Y9XgDmA7Ks24
         AlMrkDtcYkLDHukz9VDt63kZFw/H3cwHouLUhz6G5W7M3S2kouHeez6ukNbzRdV/i0df
         5C74ngy+c3e431/3oMryRNyo4edE3Ku8h+3JnoMeGapaG9LuX3wx//xDGdhuexsfMyqV
         lfA1DQRiL7Z2pGvHQVu0n4leaD4TB4Ud5zqBYaAy0BBIzdImAZALdtsApD1I3Nj6p+L1
         +VkGXF+bhvn8u8zFSixDw6nQFdmq5BR1xLIqne1/cueKzkYal1hcKJ7yb6x/taN6/ntY
         0RYQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784904848; x=1785509648; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0FizlNtfIGL9PSU8NrVwR0RXFKLZe3upW3pb1LXZ14=;
        b=KALIFAGAoV/bbrME7oMxHpsi0fVVeIPJsbyD2vVuGQ4h+n+hOj2BbnoeXs11gLhew5
         0qrdEMs6JKSJHj4GZ3GY8fT1Gq5S2IkcSNkSqzTQLq0wX8QughA74XS3WqEiV7pW+yZU
         kvnkqj/RFcdAS242Nvsa6CkMU3jg4LzIXh00m5APJCDJwI10G3eZMbJXD+8iOEFkokCH
         5tT0O5+ozYhT9Z3aija3hJFYfJjlT8UtzqqE+Kcjb8axOnWTOuTZjv3e7A9frdtUCItW
         xilLVJfaOEZLhB8+QiAC/DM93C79N5oLZ49IAitdNXQHTb9QQ7u7MfTLyh7whlGNFvtJ
         AlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784904848; x=1785509648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0FizlNtfIGL9PSU8NrVwR0RXFKLZe3upW3pb1LXZ14=;
        b=ryduz4fGxt6aJjFBv9IYvHqDiWNzQ9I8E5sgNuneeGhyXiEW+fQ05Bfsza9NppSbH8
         hVtMa7JAwQDJmkzNOd7Vh3ZUi0lJ2/7DM3uNnCFMrbi1whp19DIdv0gZkVkhYJgMQOL5
         xf2qUXVMeb9ITwwb5E2aIr77vGauBr5KqYXb0Q0Xjz+TQCwlfGOgddeW36pQSV5A6XGp
         gAhaF5M+iuWZ+Cs57QXvhF/TqSg/XdEAa372ry4szyiBrbBlmWN1PrJOZ7koZhdc2CpZ
         S+H5VgXJgfluWdu75bWFA4DJLGp8WU1A0kqAorhi+pDaTeztodBmjHPie+rnpB3TUjO6
         9Ayw==
X-Forwarded-Encrypted: i=1; AHgh+RrljGXaxpZFoNqRrEdQkNrkFbtwGEtpUjJ6j2t1BOWqxTpCnEQfXpmcwEqwvBE/HrAUyKfqzYFi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9WTXbYRBOIkVUb2IJGw7KCJ/L/sKrPwKXcQlmpqmZQsgkFC5l
	cechYQvZrCh/WCGga9LAoPyeJaRX1duoeIYJRTYWFlleenI0tcvL46+SQpGUdsWAWT6dT78lrtB
	cWxjsx2VuolVDcGpF6mslhAxj+m+m7nfpyLravpLyMLepIPd8NNjZGt3FixiEPVcGcHRfBFAMZm
	ODJbSp+eNUh+H4aQTypa+HyGZRBqiaBbZt3ESsnn4DEaogbc5i
X-Gm-Gg: AR+sD13dUtOOtqYzjJKtnC0R4oM/RGL4wj7YNIpm4gqMFhUIODm3lqs2i40PfUVvf/t
	FrCZZuXSelZYd3AOP3P/T/+EsEOVugStKUhWrrjqOVoNbVnTdkifTk6Z5cu0prrCWpX/ItKxhEu
	B4tXvm4rKXPE4pKlWrln/LLkFIEmiutgKX5FH6744uo4pnwt1CMdD5/3CD1g==
X-Received: by 2002:a05:6a20:9185:b0:3c0:9c1b:d0b3 with SMTP id adf61e73a8af0-3c44b1fc808mr8592089637.62.1784904848132;
        Fri, 24 Jul 2026 07:54:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:9185:b0:3c0:9c1b:d0b3 with SMTP id
 adf61e73a8af0-3c44b1fc808mr8592044637.62.1784904847612; Fri, 24 Jul 2026
 07:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
 <20260717074413.2536416-2-anup.patel@oss.qualcomm.com> <CAFR3w34SPd_5WSsO7vVS2DkP59ckWF9H1aJCDCyYMR_LNaxanw@mail.gmail.com>
In-Reply-To: <CAFR3w34SPd_5WSsO7vVS2DkP59ckWF9H1aJCDCyYMR_LNaxanw@mail.gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 20:23:55 +0530
X-Gm-Features: AUfX_mxnG5WiVTYynfAxNt4Wg8rcWYdUscH-97Uq4erNZk1f3X1wjTiBFwBU27w
Message-ID: <CABBgwmt0yu0ab+tuxTywYTYrEm55FxygtXT31D_enUKPoPJC3w@mail.gmail.com>
Subject: Re: [PATCH 1/5] lib: sbi: Fix typos related to hart protection
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-ORIG-GUID: YOZKuHovqKFLAAPQT2eKaUsUnap8MnM_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNCBTYWx0ZWRfX9jYkA2h37p/J
 i1NIwXIG3hRAVwpa36D7IHxf/W7P+RoEr0//+IvoRNJMzuNsbfHDpffcOw654ssleCHLuYmBkM0
 98JJBdQzqB4hbyeOzHr0aoiad22b+Mw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNCBTYWx0ZWRfXxWrFkibnxKrc
 ksen/fgt+FDkrZUACsPqGRvBuQHAPUbZ6GKY/RQK+sQY3IMr+bYgumcDRbLZDUNlYzwT5XWchBF
 619h0tnwfgYq0P3BBv6vkM8h364fk8CmAWYOPVZDvRCvudmulPUE9ONTS1CpGC0vyx9OalbYFZh
 cZIcomiHx7o9x+mAzEX0cSyb9obstfkssE81oUQBa6D+MvaqTe13P0ZnuCeD3zDY0qta/rmD8Ja
 0Xj+c9sTYbKkP8eNEe4agddGq/lb/1caNwnvN3z8EE9ecqPAQAEVKKknrs6MK4bCixaptW+Q/Oa
 9tcxdkZGZqbvCHugetTOozjHpTMlDDaV5adakmH8Zl3KZKsv77O5KUB0Zt5Yn+YN2Gmg+GuHmqm
 kU5yNKJ+MYg7q5Nma3qaGXd/GbCCx1SGCfj/vzdV6viyv67oIKo/jZZlcvg7kRmTc1yX7v8Amk6
 oGH2GUyUH0jhikShG5g==
X-Proofpoint-GUID: YOZKuHovqKFLAAPQT2eKaUsUnap8MnM_
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a637c91 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=wk1pi8M1uVscwe5w2-QA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_075411_070151_7C5BBECE 
X-CRM114-Status: GOOD (  19.28  )
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

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgNDoyNuKAr1BNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMTcsIDIwMjYgYXQg
MToxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gVGhlIGhhcnQgcHJvdGVjdGlvbiBpcyBpbmNvcnJlY3RseSBtZW50aW9uZWQgYXMg
aGFydCBpc29sYXRpb24KPiA+IGF0IGZldyBwbGFjZXMgaW4gc2JpX2luaXQuYyBoZW5jZSBmaXgg
dGhlc2UgdHlwb3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRl
bEBvc3MucXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgbGliL3NiaS9zYmlfaW5pdC5jIHwgNiAr
KystLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pbml0LmMgYi9saWIvc2JpL3NiaV9p
bml0LmMKPiA+IGluZGV4IDY1OGZlMzdmLi40MjA4ZGIwYiAxMDA2NDQKPiA+IC0tLSBhL2xpYi9z
Ymkvc2JpX2luaXQuYwo+ID4gKysrIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gPiBAQCAtNDI4LDEy
ICs0MjgsMTIgQEAgc3RhdGljIHZvaWQgX19ub3JldHVybiBpbml0X2NvbGRib290KHN0cnVjdCBz
Ymlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIGhhcnRpZCkKPiA+ICAgICAgICAgfQo+ID4KPiA+ICAg
ICAgICAgLyoKPiA+IC0gICAgICAgICogQ29uZmlndXJlIGhhcnQgaXNvbGF0aW9uIGF0IGxhc3Qg
YmVjYXVzZSBpZiBTTUVQTVAgaXMsCj4gPiArICAgICAgICAqIENvbmZpZ3VyZSBoYXJ0IHByb3Rl
Y3Rpb24gYXQgbGFzdCBiZWNhdXNlIGlmIFNNRVBNUCBpcywKPiBzdHJheSBjb21tYSBhZnRlciAi
U01FUE1QIGlzIgoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICAgICAgICAgICogZGV0ZWN0
ZWQsIE0tbW9kZSBhY2Nlc3MgdG8gdGhlIFMvVSBzcGFjZSB3aWxsIGJlIHJlc2NpbmRlZC4KPiA+
ICAgICAgICAgICovCj4gPiAgICAgICAgIHJjID0gc2JpX2hhcnRfcHJvdGVjdGlvbl9jb25maWd1
cmUoc2NyYXRjaCk7Cj4gPiAgICAgICAgIGlmIChyYykgewo+ID4gLSAgICAgICAgICAgICAgIHNi
aV9wcmludGYoIiVzOiBoYXJ0IGlzb2xhdGlvbiBjb25maWd1cmUgZmFpbGVkIChlcnJvciAlZClc
biIsCj4gPiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQgcHJvdGVjdGlvbiBj
b25maWd1cmUgZmFpbGVkIChlcnJvciAlZClcbiIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBfX2Z1bmNfXywgcmMpOwo+ID4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsK
PiA+ICAgICAgICAgfQo+ID4gQEAgLTUwNyw3ICs1MDcsNyBAQCBzdGF0aWMgdm9pZCBfX25vcmV0
dXJuIGluaXRfd2FybV9zdGFydHVwKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiA+ICAg
ICAgICAgICAgICAgICBzYmlfaGFydF9oYW5nKCk7Cj4gPgo+ID4gICAgICAgICAvKgo+ID4gLSAg
ICAgICAgKiBDb25maWd1cmUgaGFydCBpc29sYXRpb24gYXQgbGFzdCBiZWNhdXNlIGlmIFNNRVBN
UCBpcywKPiA+ICsgICAgICAgICogQ29uZmlndXJlIGhhcnQgcHJvdGVjdGlvbiBhdCBsYXN0IGJl
Y2F1c2UgaWYgU01FUE1QIGlzLAo+IHN0cmF5IGNvbW1hIGFmdGVyICJTTUVQTVAgaXMiCgpPa2F5
LCBJIHdpbGwgdXBkYXRlLgoKPgo+ID4gICAgICAgICAgKiBkZXRlY3RlZCwgTS1tb2RlIGFjY2Vz
cyB0byB0aGUgUy9VIHNwYWNlIHdpbGwgYmUgcmVzY2luZGVkLgo+ID4gICAgICAgICAgKi8KPiA+
ICAgICAgICAgcmMgPSBzYmlfaGFydF9wcm90ZWN0aW9uX2NvbmZpZ3VyZShzY3JhdGNoKTsKPiA+
IC0tCj4gPiAyLjQzLjAKPiA+Cj4KPiBPbmx5IG5pdHMsIG90aGVyd2lzZSBsb29rcyBnb29kCj4K
PiBSZXZpZXdlZC1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNv
bT4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
