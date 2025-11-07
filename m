Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F32CCF9F8
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fDsPejFS4EbnMbmbXHeqcfsUiro+VGseNFnoDEXf4OU=; b=LD6JiP5QIZuKIK
	IIljF53wmEgRJYobgkX9VkjVy0YHIQ2Zwhy9PblL9bZG1EDZSEGLPllC+gHyD/Y/WzwbUSFsTF0I+
	MVeaaVnFL1qqWDuV3pYFDX4IJyAAvC68IZi1w+CEOCFJY8tpeShhTH0bmgDucCb5zdN825pUp9Tzt
	+Cz9KlY/fG1LmQyHHyh0oIlmav1Cb1lxYC4mvgnUppISQRdk+t0kdFy4tfFMaKx7SJWwEynhaqAFf
	isXQoWt4oUsGNAlT3mg3AFxkzdE8vCGUajk5CUhiXSga8YEwW9a8BQJxWK084gF2bifk77GE9B/gC
	0YQaIFYcZmgCUShhlcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK03-0000000H8J5-3kwo;
	Fri, 07 Nov 2025 10:47:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJzz-0000000H8Hp-1FRm
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 10:47:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A95B4E41593;
	Fri,  7 Nov 2025 10:47:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 558A9606A6;
	Fri,  7 Nov 2025 10:47:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21CBF11852224;
	Fri,  7 Nov 2025 11:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762512433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=S06f+1QjML8mHI6nJHEdlkwiKauzjdVAPBtjR2wR9gE=;
	b=QQz6wA5Qa7CpAk48ikq8tC/ab60I1Ka5X8Lpk1BQ9c4Ge6mZoKA38uwgRY3SvNjDEEpIFH
	C76o6+JVvj/+kBwBGY88eFx87gz2dRTBfrP2JeIK/OoLjDOxz9voddSZGpqqvknHJ2LLW+
	sVENVSDq++dKK0T0ylXBdxRzsZBkSCHOQGCD3DnfnPwgM7xxNVSsLn3y+Cm46jrgojfTTF
	FnZG/3ONP96nW2SbzqCkMlLmk0ekrU6KLlV6AyLcTfB41sT1LnILl79Yl/1FWLCa1ab0kD
	cop9T+ha50lrKQCXM47+35MErWK5F/e9XqOkucCGeLJWYItz3UINxcDVC+zy8Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v3 0/2] Add MIPS P8700 compatibles for ACLINT MTIMER
Date: Fri, 07 Nov 2025 11:46:56 +0100
Message-Id: <20251107-p8700-aclint-v3-0-93eabb17d54e@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACDODWkC/12MwQ6CMBAFf4X0bM12gbL15H8YD1BbaaKUtKTRE
 P7dQmIiHue9zMwsmuBMZKdiZsEkF50fMpSHgum+He6Gu1tmhoC1ACA+UgPAW/1ww8SNJZJEpJq
 qZlkZg7HuteUu18y9i5MP762exLp+Q2ofSoIDF1QiallZJenceT/l66j9k62phD86Nn86Zt0K0
 J3tpDQK9/qyLB9JgT9a6QAAAA==
X-Change-ID: 20251008-p8700-aclint-ef8868889745
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_024719_477229_96A4BB75 
X-CRM114-Status: UNSURE (   7.84  )
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

VGhlIEFDTElOVCBmb3VuZCBpbiB0aGUgTUlQUyBQODcwMCBpcyBjb21wbGlhbnQgd2l0aCB0aGUg
bm93IGFyY2hpdmVkClJJU0MtViBBZHZhbmNlZCBDb3JlIExvY2FsIEludGVycnVwdG9yIFNwZWNp
ZmljYXRpb24uIFRoZXJlIGlzIG9uZQpBQ0xJTlQgY29udHJvbGxlciBwZXIgY2x1c3RlciwgYXMg
cGFydCBvZiB3aGF0IE1JUFMgY2FsbHMgdGhlIGNvaGVyZW5jZQptYW5hZ2VyLgoKRm9yIHRoZSBN
VElNRVIsIHRoZXJlIGlzIG5vIGRlZGljYXRlZCBtdGltZSByZWdpc3RlciB0byBhY3QgYSByZWZl
cmVuY2UgaW4KYSBtdWx0aS1jbHVzdGVyIGNvbmZpZ3VyYXRpb24sIGFuZCB0aGVyZSBpcyBubyBN
VElNRVIgd2l0aG91dCBhc3NvY2lhdGVkCkhBUlRzLgoKVG8gaGFuZGxlIHRoYXQsIGEgbmV3IGRl
dmljZSB0cmVlIHByb3BlcnR5IG5hbWVkICJyaXNjdixyZWZlcmVuY2UtbXRpbWVyIgppcyBhZGRl
ZCB0byBpbmRpY2F0ZSB3aGljaCBNVElNRVIgaXMgdXNlZCBhcyB0aGUgcmVmZXJlbmNlLgoKU2ln
bmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0K
Q2hhbmdlcyBpbiB2MzoKLSBEcm9wIG1zd2kgcGF0Y2g6IGFscmVhZHkgbWVyZ2VkLgotIFN3aXRj
aCB0aGUgRFQgcHJvcGVydHkgZm9yIHRoZSBNVElNRVIgcmVmZXJlbmNlIHRvIGEgZ2VuZXJpYyBv
bmUuCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTAyNy1wODcw
MC1hY2xpbnQtdjItMC1mMTBjYmZiNjZlOTJAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4gdjI6Ci0g
U2VsZWN0IHRoZSByZWZlcmVuY2UgTVRJTUVSIGJhc2VkIG9uIGEgRFQgcHJvcGVydHksIG5vdCB0
aGUgZmlyc3Qgb25lCiAgZm91bmQuCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MTAwOS1wODcwMC1hY2xpbnQtdjEtMC0xODMyMmM2NGY5NjhAYm9vdGxpbi5jb20K
Ci0tLQpCZW5vw650IE1vbmluICgyKToKICAgICAgbGliOiB1dGlscy90aW1lcjogbXRpbWVyOiBT
ZWxlY3QgdGhlIHJlZmVyZW5jZSBtdGltZXIgZnJvbSBhIERUIHByb3BlcnR5CiAgICAgIGxpYjog
dXRpbHMvdGltZXI6IG10aW1lcjogYWRkIE1JUFMgUDg3MDAgY29tcGF0aWJsZQoKIGxpYi91dGls
cy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMgfCAxNyArKysrKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1p
dDogMzhhNjEwNmIxMDk5NjQ2ZjI1NjU3YmJhNTNjZWZiODA4ODY3MjFhNwpjaGFuZ2UtaWQ6IDIw
MjUxMDA4LXA4NzAwLWFjbGludC1lZjg4Njg4ODk3NDUKCkJlc3QgcmVnYXJkcywKLS0gCkJlbm/D
rnQgTW9uaW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
