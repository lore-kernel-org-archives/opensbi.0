Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6950CCD183
	for <opensbi@archiver.kernel.org>; Thu,  9 Oct 2025 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FVfrPng8EZw0G/s0U5VxeGPCVdwJMJR3nhBIAmhvs5M=; b=BIq7cw+Y3ynkzd
	Gubg4HVJ+gcznc4xnMDaag9YY6XgF1lNLQ0O5/vUwXLdph6Pq6ylNmEbJhNhYEB0LTu0xIq1d2RUV
	YZ9nTY2vROLbW1YCC1yw7KN87pjjjKEnfNR++sIdHSIawZbKSb3UgSQc3VRGs+SC2zF1hqIc+bKW1
	XA53POZiY4+/iOrzDnCECnj+F41gdTl6GOqmgZb/eKsEBTEZWntMj3UDFkYUrMq5u93JUc9oQQtEL
	Z+XTn31FDaZ3d7eFs5sb3ARbh5kJKTgjWO2Y4XSzCzapgZloi6DRHcRYII0GPOoKJmUThVcyy6/zu
	Mf/imFWnEyatiogfFgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sHZ-00000006Ra5-2To1;
	Thu, 09 Oct 2025 15:10:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sHV-00000006RYi-3PAR
	for opensbi@lists.infradead.org;
	Thu, 09 Oct 2025 15:10:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A9B84E40FB4;
	Thu,  9 Oct 2025 15:10:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 623F96062C;
	Thu,  9 Oct 2025 15:10:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BFD3102F21E6;
	Thu,  9 Oct 2025 17:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760022609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dDDyN10ojbKajUr7NWIl2M8EWsYHyu3kGc17AukzedE=;
	b=CmJkhdWfjohWr9y7X1KPUaZUg1qjVB+eAXY+Qr8znQBzV02/6WC4lGLNPKL6XyGbTDTRNh
	LuKWAOPO8ZgqF2ZMbpU6FoAOPe8Y6mY4kSu8DyUY7ytX2+Bo7fhaQSeIKdikMHrmiRi/+g
	AI8qpk92qLyQYgKn0rsJoJln4ZqMMcs5jKHlsz11FH1Lr9VRCfCIHtTdZPDD9QsehhGUZS
	6QVW710EcUWmaUYJfHZMw2S2jY1X1can3uE5b1UaSjM/hMjqh7vX4VL/N6g3qEoniR9A7T
	uO9hNnLfA0GlwKkHTXz+JGFtPBkGeILzSRqMDBcdh9t9TbJjHyoWsd0Xk/TCMQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH 0/2] Add MIPS P8700 compatibles for ACLINT MSWI and MTIMER
Date: Thu, 09 Oct 2025 17:09:38 +0200
Message-Id: <20251009-p8700-aclint-v1-0-18322c64f968@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADLQ52gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwML3QILcwMD3cTknMy8Et3UNAsLMwsLC0tzE1MloJaCotS0zAqwcdG
 xtbUAvUKSS14AAAA=
X-Change-ID: 20251008-p8700-aclint-ef8868889745
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_081013_988761_8F544D5E 
X-CRM114-Status: UNSURE (   5.61  )
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
cGFydCBvZiB3aGF0IE1JUFMgY2FsbHMgdGhlIGNvaGVyZW5jZQptYW5hZ2VyLgoKVGhlIE1TV0kg
ZG9lcyBub3QgcmVxdWlyZSBhbnkgY2hhbmdlcyBpbiB0aGUgY29kZSwgc28gb25seSBhIGNvbXBh
dGlibGUKc3RyaW5nIGlzIGFkZGVkLgoKRm9yIHRoZSBNVElNRVIsIHRoZXJlIGlzIG5vIGRlZGlj
YXRlZCBtdGltZSByZWdpc3RlciB0byBhY3QgYSByZWZlcmVuY2UKaW4gYSBtdWx0aS1jbHVzdGVy
IGNvbmZpZ3VyYXRpb24sIGFuZCB0aGVyZSBpcyBubyBNVElNRVIgd2l0aG91dAphc3NvY2lhdGVk
IEhBUlRzLiBBIHF1aXJrIGlzIGFkZGVkIHRvIHNlbGVjdCB0aGUgZmlyc3QgTVRJTUVSIHRvIGFj
dCBhcwp0aGUgcmVmZXJlbmNlLgoKU2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0
Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KQmVub8OudCBNb25pbiAoMik6CiAgICAgIGxpYjogdXRp
bHMvaXBpOiBtc3dpOiBhZGQgTUlQUyBQODcwMCBjb21wYXRpYmxlCiAgICAgIGxpYjogdXRpbHMv
dGltZXI6IG10aW1lcjogYWRkIE1JUFMgUDg3MDAgY29tcGF0aWJsZQoKIGxpYi91dGlscy9pcGkv
ZmR0X2lwaV9tc3dpLmMgICAgICAgfCAgMSArCiBsaWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210
aW1lci5jIHwgMTAgKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCi0tLQpiYXNlLWNvbW1pdDogZTNlYjU5YTM5NmFjNTU5NzVlM2RlYmVj
ZmM1YjcxNDE4ZWI2MjI0OApjaGFuZ2UtaWQ6IDIwMjUxMDA4LXA4NzAwLWFjbGludC1lZjg4Njg4
ODk3NDUKCkJlc3QgcmVnYXJkcywKLS0gCkJlbm/DrnQgTW9uaW4sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
