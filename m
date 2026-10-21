Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1863606A321
	for <opensbi@archiver.kernel.org>; Wed, 21 Oct 2026 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Add6/rpH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9Cny130;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kF3p6xmo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnCySEwEIfloUfPA4/kNQP4FmOSwW/Q5XgFkCJhKaFA=; b=Add6/rpHQAuos4
	TWZBS1cfl9NkVNG7gHpxHpiZYQNWwyZ9IhNsbMQXEiJ9ZIrpfFQceqmNQq3T6dAOoy6bOgk3lodtd
	nyrtt4uM6W7qm4zL8yqDY/sexRkK1U59uIEYPI1DKk7F813cmLEt5QJiBoKtuFr/quFugmj+AKtgn
	kQVl32OkFcHSbcacsb+7ecK6iNSEw6AYCP++uMKu1UEim9xUXcb0OmW0ldMQzg8LBPmcvaxlMWzAP
	dDf/9dSmWhUmZsXkN+/b0OUPnJxz+hiK5P9O+Nhmv1b+FHXHuwLH6gXf6ir/FI6GZ00QlFaxxJ1Gz
	HE8gMkc2CIIUPu7XFgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUoM-0000000BkMq-3DzS;
	Wed, 21 Oct 2026 11:48:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUoK-0000000BkLw-0apj
	for opensbi@lists.infradead.org;
	Wed, 21 Oct 2026 11:48:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7Pf3658125
	for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 11:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RWyf0LMF1qrFGtYc/Xc7HvJ6SxB1SEXIsVMeOr4BQRo=; b=F9Cny130V4a7zK30
	4eYMW+GY2w87FIWFvFks7RZZAQSP1IYvk8lZ7SiUHd+oBbnXEBHAJ21uMzs6Gm0Z
	GAgBvDyEqoY1QJlvmKZJ+CxJvt8Bmq8GhPdydJo+tp9xwAL90RPMjEHljXpXzVAl
	SRMLtKj/AQAUFBXqBS6j/SdEnw7Z3oDzZkexjkHeGClprkj+ErjtdyC0bbthORkS
	f33qxK7gnxGUyvonwiZCpl5P4n8UNV8Q1xI463dHULd34rKzGnd1ZHUqXdNGyKeh
	Y8cVwsKaCNqDza+TJYN7HwBpD8adydh57Pk99nNI4RPgSpcoMK8Vgmb+S9vEG2hr
	ppjOoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9bhqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 11:48:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so143912385a.0
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 04:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792583326; cv=none;
        d=google.com; s=arc-20260327;
        b=MVGen7wHvK4yXzV0b5HSaXoVS2CDWXhAwysptVtaJDYiq08J6E0bagBjO0BK/CB41u
         0gQ+HXGqBw9ZrRWEWMZCKH1HsHhq+AINpmYVCJ5inHq03NhLzblHmYk86mxzYnezdnHd
         SeQjJXH2DVXTGjjKidX1r9ym2aNVvbZFWkSpo/QX84y7SRyjebStfKLtivpdtgADjo57
         DBR2EoFIkoRR2Wos6EmvaAA/5h2w19Q10n5GdzXhoLMVIsyFMUp3ntv7dyyrJQA1dl2X
         p0tWLXHAWE3PoyqdaiVoQZkHTB/OPWrUVFQ0BFnMfKimm34AaB9lx60L5/oiSKmob5co
         w+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RWyf0LMF1qrFGtYc/Xc7HvJ6SxB1SEXIsVMeOr4BQRo=;
        fh=xBG9/dk2bDnM3j5INsYwtAuuXRV2IJpLgYj2k6GbpX0=;
        b=ZonrRxXyrfEnFM5rRJOVH8NR2wCHS4zQcqrqZ25D2uGeZ5A9QpA6/53+OsW2ipfWnl
         frE2SYaZyzE0xIhaWkUChHdNQf4d8BMecs9V3LfvyhTOzyYWHEiCAkHz6azmqzCW7myJ
         DJDxDQxAQ8JL6OgzOLdgADLDB35vuluhM9jpr850UROVrsvaa37jl0zv9Yl/RGtPJ1Op
         VggIeEalLKQjJXXKZy12b/W7GArCHbVDSvqbv0Ox9Wolv7qbgNclX/e1GIRvfAtfabZx
         iXNPELWsBdWxMlIS4zxE1HghnGbi4fKfb3SsyeQJSUUcp/hysM8Za2TdhY4qq9kliUXm
         WcsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583326; x=1793188126; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWyf0LMF1qrFGtYc/Xc7HvJ6SxB1SEXIsVMeOr4BQRo=;
        b=kF3p6xmog//UKKD2wVB4YppqfHuXWIPuFUCg6JhqwdYG2HRHQSkNSc6o+dXdGwN41E
         MR1obu8ghKxo2rm1JHFWT/EbCwroPX6v7lx6q81JbMXOYcKjEgq+5kQ7kKoVYdZd7o9e
         4BVdZrp6l1Uky+GqveQgKMN7bk945iuGx3FnLjKp78q6x421LqkWHdSKDo9pJkJfej+3
         OROm5UYmx1qP97bFbV6kSd9bne22DIw33gg3+m1FXePWFO4oJvQA5jUpU0TjpGOy25e2
         4hP+pAS4rCtn3Ay3hNkVKSyLNc1lhN16w6yCTK83r4QV+vWkdnyrcO1nZWOSL2s2R8ax
         qEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583326; x=1793188126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWyf0LMF1qrFGtYc/Xc7HvJ6SxB1SEXIsVMeOr4BQRo=;
        b=UT0uPOrDQrNIWsI/WoDfCHv4akMTzoX3sW3/65FJqfjBRVCyx7v+U+heSK05nt10V2
         lyGP1QMV23jei1u8M7vxybnQLpLUSFK4YjJHAVj9Qfm38wsLRiHT1qufmwhATRsO1cQ9
         KUOnPd7xqlWEJreR84b47UHEN8ivZ7XzD+S9FJ0oHAPKQJr7vlI+U1PU7yQO+QzAozKL
         CD+9JXWJsv1WPvwLasUf6BhD4+sXC6KmXP7eafHTFegQOFUFrVGLPuXvkoOyMGvvWTHj
         mg8QrwshspjSycq4+KW2h/AwfG6eTg8ytJcd4BqvZdsHTk+fAN3MFTtLwR0E0KtQn/WR
         KUYQ==
X-Gm-Message-State: AFq9FYLNZ7WkJt8IBQwf3BXifKfYU7qh4mvUeZoeGwurklcJFAO99Kf2
	suQpOR9mU9f3ByMA62F8RptHYWLBwzW8FmR391qtfQIRGJ9lDjX+amwWsgPqZmP0UWL1i4NdnxN
	Y/BytO0buBWwkJX990dksNfUmdMvgb613EukuEnAa3zTJ0Gmwq7bRPEnFcwIEl8Mj6LPZrEifbX
	b8AKHUaGZ2pddXpbpGoWSi5J96XkCgouKm+tJZRjkC7fpR/teYGaQ=
X-Gm-Gg: AYBFou3sTodciNPnfeWSqhL98/cdzjYQtYEPLmekeLwOR5ZWJvdMtW0yKyz/qgSQcqD
	PIc2Cp+xwQf/NYfCq6NJl7dJ/QuKE1LzryE+EMzuWOvdfxyLPnRNEe5LJDlSonOit5Tz2egJC7k
	8UoYrsSH3MvU2dGkRMMVQzWGyQqyMDhB0vSuEp0WlZv7S/spkmp4Ed7L4NC8qhLOJlFJ/wDAppq
	PqeLvvk5e+zG4xHyw==
X-Received: by 2002:a05:620a:31a9:b0:93e:5fbf:a41c with SMTP id af79cd13be357-93f57f7029bmr340970885a.16.1792583325615;
        Wed, 21 Oct 2026 04:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:31a9:b0:93e:5fbf:a41c with SMTP id
 af79cd13be357-93f57f7029bmr340967285a.16.1792583324901; Wed, 21 Oct 2026
 04:48:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021094243.2395130-1-liwen.wu@spacemit.com>
In-Reply-To: <20261021094243.2395130-1-liwen.wu@spacemit.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:18:33 +0530
X-Gm-Features: AclHuK-TwmK4jvoyJVT6JRG711jqL3BhEvYr0FfG0mIJP74Sa80709mC5xBUysA
Message-ID: <CAFR3w34W-Z=zzxkGdiFP8T2g6JxVPkA==jrjf4mBcx1irq6GMQ@mail.gmail.com>
Subject: Re: [PATCH] include: mailbox: correct RPMI CPPC request field ordering
To: wuliwen <liwen.wu@spacemit.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfXzQCohfCJhxYx
 rY6dYOK5Wkcuv7gpxx4y21/zr/TV0jaNh2jvqZdSDRnNyG8f1EJHEvlFTbqpd9pefj+twXDla+D
 hwHuEufeQ8KARwrmAKB0WxVnP96Vs6U=
X-Proofpoint-GUID: x4bzCNVthJFQrUVgebzqyEiUskY0lYh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX7ba/OGFPDyvS
 bYyJEbTLJnVCMj1hgOFYJedvYGnYvYoZfHSf0JNaMUiuLxGvjXD7aKAGHuYHr9UgLRE9b6BbeGe
 /BFeqrUARE9MUq+8CYx83JdDYerGmBuET01JocviydYy7YdUJI7H8TqtuQ8TPUZ1RWZJiEQYPDm
 IPYspWPYwmz6zrrUyjbj8MQDe3UzL3is/CUuzmDNLRdDXm3dmF9WoVLUhWB/Qz9niC1TlUKdWDH
 2NzRRXezI0EIFo79NenXJUxQGpnV8m5kL1ZMDJ4ZSURS2aOgVS+lTDsqHEzpTHWzImZ91RG7lTh
 ac8sFtey6UleFHT6fa9RIo0qgSd+SLdn7TWP3EYTtq5szbqMtyDQ82TBHYZWVQjPcMrgP5v6sCh
 UON29lFScEzhQU1zdP15hoQG8N6D6jVhcypobKcu3k4vfHRrV/eCC7BTN+Kmxa2kJgQ8BJVUBQo
 C029eNJpxJ0XH+sbqVg==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad8a69e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=FZetjSqRrY8kgIz4vvoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-ORIG-GUID: x4bzCNVthJFQrUVgebzqyEiUskY0lYh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_044848_295292_A4A1B959 
X-CRM114-Status: GOOD (  21.40  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjEsIDIwMjYgYXQgMzoxNOKAr1BNIHd1bGl3ZW4gPGxpd2VuLnd1QHNwYWNl
bWl0LmNvbT4gd3JvdGU6DQo+DQo+IFBlciB0aGUgUlBNSSBzcGVjaWZpY2F0aW9uLCBDUFBDX1BS
T0JFX1JFRywgQ1BQQ19SRUFEX1JFRywgYW5kDQo+IENQUENfV1JJVEVfUkVHIHJlcXVpcmUgUkVH
X0lEIGluIHdvcmQgMCBhbmQgSEFSVF9JRCBpbiB3b3JkIDEuDQo+DQo+IFRoZSBjdXJyZW50IHJl
cXVlc3Qgc3RydWN0dXJlcyBoYXZlIHRoZXNlIGZpZWxkcyBzd2FwcGVkLCBjYXVzaW5nDQo+IGlu
Y29tcGF0aWJpbGl0eSB3aXRoIHNwZWMtY29tcGxpYW50IFJQTUkgc2VydmVycy4NCj4NCj4gU3dh
cCB0aGUgZmllbGRzIHRvIG1hdGNoIHRoZSBzcGVjaWZpY2F0aW9uLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiB3dWxpd2VuIDxsaXdlbi53dUBzcGFjZW1pdC5jb20+DQo+IC0tLQ0KPiAgaW5jbHVkZS9z
YmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaCB8IDYgKysrLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaCBiL2luY2x1ZGUvc2JpX3V0
aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmgNCj4gaW5kZXggN2FlNGFiZTAuLjQ4ZjZhYzYxIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oDQo+
ICsrKyBiL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmgNCj4gQEAgLTUz
OSw4ICs1MzksOCBAQCBlbnVtIHJwbWlfY3BwY19zZXJ2aWNlX2lkIHsNCj4gIH07DQo+DQo+ICBz
dHJ1Y3QgcnBtaV9jcHBjX3Byb2JlX3JlcSB7DQo+IC0gICAgICAgdTMyIGhhcnRfaWQ7DQo+ICAg
ICAgICAgdTMyIHJlZ19pZDsNCj4gKyAgICAgICB1MzIgaGFydF9pZDsNCj4gIH07DQo+DQo+ICBz
dHJ1Y3QgcnBtaV9jcHBjX3Byb2JlX3Jlc3Agew0KPiBAQCAtNTQ5LDggKzU0OSw4IEBAIHN0cnVj
dCBycG1pX2NwcGNfcHJvYmVfcmVzcCB7DQo+ICB9Ow0KPg0KPiAgc3RydWN0IHJwbWlfY3BwY19y
ZWFkX3JlZ19yZXEgew0KPiAtICAgICAgIHUzMiBoYXJ0X2lkOw0KPiAgICAgICAgIHUzMiByZWdf
aWQ7DQo+ICsgICAgICAgdTMyIGhhcnRfaWQ7DQo+ICB9Ow0KPg0KPiAgc3RydWN0IHJwbWlfY3Bw
Y19yZWFkX3JlZ19yZXNwIHsNCj4gQEAgLTU2MCw4ICs1NjAsOCBAQCBzdHJ1Y3QgcnBtaV9jcHBj
X3JlYWRfcmVnX3Jlc3Agew0KPiAgfTsNCj4NCj4gIHN0cnVjdCBycG1pX2NwcGNfd3JpdGVfcmVn
X3JlcSB7DQo+IC0gICAgICAgdTMyIGhhcnRfaWQ7DQo+ICAgICAgICAgdTMyIHJlZ19pZDsNCj4g
KyAgICAgICB1MzIgaGFydF9pZDsNCj4gICAgICAgICB1MzIgZGF0YV9sbzsNCj4gICAgICAgICB1
MzIgZGF0YV9oaTsNCj4gIH07DQo+IC0tDQo+IDIuMzQuMQ0KPg0KPiBUaGlzIG1lc3NhZ2UgYW5k
IGFueSBhdHRhY2htZW50IGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBiZSBwcml2aWxlZ2VkIG9y
IG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBh
bnkgYXR0YWNobWVudCBmcm9tIHlvdXIgc3lzdGVtIGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1l
ZGlhdGVseSBieSByZXBseSBlLW1haWwuIFVuaW50ZW5kZWQgcmVjaXBpZW50cyBzaG91bGQgbm90
IHVzZSwgY29weSwgZGlzY2xvc2Ugb3IgdGFrZSBhbnkgYWN0aW9uIGJhc2VkIG9uIHRoaXMgbWVz
c2FnZSBvciBhbnkgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZS4gRW1haWxz
IGNhbm5vdCBiZSBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvciBmcmVlIGFzIHRoZXkg
Y2FuIGJlIGludGVyY2VwdGVkLCBhbWVuZGVkLCBsb3N0IG9yIGRlc3Ryb3llZCwgYW5kIHlvdSBz
aG91bGQgdGFrZSBmdWxsIHJlc3BvbnNpYmlsaXR5IGZvciBzZWN1cml0eSBjaGVja2luZy4NCj4N
Cj4g5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25YW35pyJ5L+d5a+G5oCn6LSo77yM5bm25Y+v
6IO95Y+X5YW25LuW5L+d5oqk5oiW5LiN5YWB6K646KKr5oqr6Zyy57uZ56ys5LiJ5pa544CC5aaC
6ZiB5LiL6K+v5pS25Yiw5pys6YKu5Lu277yM5pWs6K+356uL5Y2z5Lul5Zue5aSN55S15a2Q6YKu
5Lu255qE5pa55byP6YCa55+l5Y+R5Lu25Lq677yM5bm25bCG5pys6YKu5Lu25Y+K5YW25Lu75L2V
6ZmE5Lu25LuO6ZiB5LiL57O757uf5Lit5LqI5Lul5Yig6Zmk44CC5aaC6ZiB5LiL5bm26Z2e5pys
6YKu5Lu25YaZ5piO5LmL5pS25Lu25Lq677yM5pWs6K+35YiH5Yu/5L2/55So44CB5aSN5Yi244CB
5oqr6Zyy5pys6YKu5Lu25oiW5YW25Lu75L2V5YaF5a6577yM5Lqm6K+35YiH5Yu/5L6d5pys6YKu
5Lu25oiW5YW25Lu75L2V5YaF5a656ICM6YeH5Y+W5Lu75L2V6KGM5Yqo44CC55S15a2Q6YKu5Lu2
5peg5rOV5L+d6K+B5piv5LiA56eN5a6J5YWo5ZKM5LiN5Lya5Ye6546w5Lu75L2V5beu6ZSZ55qE
6YCa5L+h5pa55byP77yM5Y+v6IO95Lya6KKr5oum5oiq44CB5L+u5pS544CB5Lii5aSx5oiW5o2f
5Z2P77yM5pS25Lu25Lq66ZyA6Ieq6KGM6LSf6LSj5YGa5aW95a6J5YWo5qOA5p+l44CCDQo+IC0t
DQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0DQo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZw0K
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkNCg0K
V29ydGggYWRkaW5nIEZpeGVzIHRhZyBhbmQgd2l0aCB0aGF0IC0NCg0KTEdUTQ0KUmV2aWV3ZWQt
Ynk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+DQotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
