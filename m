Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF4CC531C9
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FmsUDb36opb0h2xZD57Q1fXzoOcckzbQPXVSTS4An64=; b=ZpRMdcVLMwLdv7
	5GjGY9l4H1N4r5uqj6izZyZmz+Jpl7N7BYNk9LjpfQuNb5kcNjGyQD2jjh7zIvTLPMHeDaQNYR2rn
	pkEDjChJFo1eAy6bRfyLMFQj8V/iEVbYec5tQxD7IxMpYL9SmZRW9ZgY0jGBsXV5131MLiuIRFKfq
	KBeyCJkuVw3JyVlAYCYve1SZKaERuZt2hZSIoDReOUoFv79jJmYiDmtlEPnksRaq1Jf6VVJ76Ac0l
	LmJBqk+RITw29PkZVy8iq0F7dd5LS16mq+i94K9edoKlXQpn86TlLxE5WG1lBMv4VjZg5pPtEWArq
	cMht37M2RRsArYXFlgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHvs-0000000GjET-2qvU;
	Fri, 24 Jul 2026 15:35:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHvo-0000000GjDZ-3zsP
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 15:35:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F32901A11EC
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 15:35:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7E4060395;
	Fri, 24 Jul 2026 15:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1070711C10872;
	Fri, 24 Jul 2026 17:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784907319; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xYD7DFT4d98134tE1jQYPoKmtdjHciy6GHBq8wYHGCE=;
	b=zsgqyOXfouIPGkoqYyaTJsW6HB//GFT72QiHgMSgFR+fLjW9wSN5xcuJUfwuPiA6HkD7Bb
	9W6RxoRDhu4IrALgPSV/wiChJPkf1R6v9tHm2BqEcjkUv+DviBbz2DjSuqBxFhqRRnWY2t
	3VXLHgttVFeOZE0wgyojYotabGbjlzNMUG8VClbs9h1ugPTe1bh1vNLpPHp8Y0MMh148eS
	Lg+kgHxH+Z9nSwijiNcP0+/kwkR4xSUHUTZzprdplgzNZ72L3K6BfEJ3r25lSfWic2efpp
	zQ1ROroHRLE82ay4xMQNbxSd3SF739bmfoN2gQEQLkkAmwFidTqqcbR1Tw+hEw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v3 0/2] Introduce Metanoia MT2824 SoC support
Date: Fri, 24 Jul 2026 17:35:06 +0200
Message-Id: <20260724-mt5824-v3-0-9a7d17d69974@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACqGY2oC/1WOwQ7CIBAFf6XhLIZugVJP/ofxIBQsRosBJJqm/
 y60MerxJTOzO6GgvdUB7aoJeZ1ssG7Mo9lUSA2n8ayx7fNGQIATBgzfIhNAMWs7ImphZMsMyvD
 da2OfS+hwXHd4yItWsdiFGGyIzr+WS6ku3BrltfhEU40JVl0HvFGK94bupXPxasetcjdUsgl+x
 O83CbJIhexpI4wCzf7FeZ7forOVUekAAAA=
X-Change-ID: 20260525-mt5824-5790818fb75f
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 Jun Chang <jun.chang@metanoia-comm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_083525_140741_90CFDA4B 
X-CRM114-Status: UNSURE (   7.18  )
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

VGhpcyBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBNZXRhbm9pYSBNVDI4MjQgU29DLiBUaGUg
TVQyODI0IGlzCmEgaGlnaGx5IGludGVncmF0ZWQgNUcgU3lzdGVtLW9uLUNoaXAgYWltZWQgYXQg
T+KAkVJBTiBSYWRpbyBVbml0cwphbmQgc21hbGwgY2VsbHMuIFRoaXMgU29DIGlzIHVzZWQgaW4g
Y29uanVuY3Rpb24gd2l0aCB0d28gTVQzODEyIDVHCnRyYW5zY2VpdmVycyB0byBmb3JtIHRoZSBN
VDU4MjQgcmVmZXJlbmNlIGRlc2lnblsxXS4KVGhlIE1UMjgyNCBmZWF0dXJlczoKKiBDUFU6IFR3
byBBbmRlc0NvcmUgQVg0NU1QIFJJU0MtViA2NCBjb3JlcwoqIERTUC9QSFk6IERlZGljYXRlZCBE
U1AgY29yZXMgYW5kIGRpZ2l0YWwgZnJvbnQtZW5kIGZvciBQSFkgcHJvY2Vzc2luZwoqIE1lbW9y
eTogTFBERFI0IHN1cHBvcnQgd2l0aCBpbmxpbmUgRUNDCiogRXRoZXJuZXQ6IER1YWwgMTBHLzI1
RyBTZXJEZXMKKiBTUEk6IE9uZSBRdWFkLVNQSSBhbmQgOCBTUEkgY29udHJvbGxlcnMKKiAzIEky
QyBjb250cm9sbGVycwoqIFNEL01NQyBjb250cm9sbGVyCiogMyBVQVJUcwoqIEhhcmR3YXJlIHdh
dGNoZG9nCiogMzIgR1BJT3MKKiBVU0IgaG9zdCBjb250cm9sbGVyCgpbMV06IGh0dHBzOi8vbWV0
YW5vaWEtY29tbS5jb20vcHJvZHVjdHMvNWcvbXQ1ODI0LwoKU2lnbmVkLW9mZi1ieTogQmVub8Ou
dCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBS
ZWJhc2VkIG9uIHYxLjkuCi0gQ2hhbmdlIHRoZSBzeXN0ZW1fcmVzZXQgZGV2aWNlIG5hbWUgdG8g
Im1ldGFub2lhLW10MjgyNC1yZWJvb3QiIHRvCiAgbWF0Y2ggdGhlIERUIGNvbXBhdGlibGUgIm1l
dGFub2lhLG10MjgyNC1yZWJvb3QiIGFuZCBhdm9pZCBjb25mdXNpb24KICB3aXRoICJtZXRhbm9p
YSxtdDI4MjQtcmVzZXQiLgotIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8y
MDI2MDYyNS1tdDU4MjQtdjItMC00OGJkNDM4ZmMyZTVAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4g
djI6Ci0gRml4IHRoZSBTb0MgbmFtZSAoTVQyODI0KSBhbmQgY2xhcmlmeSB0aGUgcmVmZXJlbmNl
IGRlc2lnbiBuYW1lIChNVDU4MjQpCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5s
aW5rLzIwMjYwNjE4LW10NTgyNC12MS0wLWM5OTI2M2NjNmRmNEBib290bGluLmNvbQoKLS0tCkJl
bm/DrnQgTW9uaW4gKDIpOgogICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogQWRkIE1ldGFub2lhIE1U
MjgyNCBpbml0aWFsIHN1cHBvcnQKICAgICAgbGliOiB1dGlscy9yZXNldDogQWRkIE1ldGFub2lh
IE1UMjgyNCBzeXN0ZW0gcmVzZXQgZHJpdmVyCgogZG9jcy9wbGF0Zm9ybS9nZW5lcmljLm1kICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArCiBkb2NzL3BsYXRmb3JtL21ldGFub2lhLW10MjgyNC5t
ZCAgICAgICAgICAgIHwgMTQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGxpYi91dGls
cy9yZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogbGliL3V0aWxzL3Jl
c2V0L2ZkdF9yZXNldF9tZXRhbm9pYS5jICAgICAgICB8ICA3MiArKysrKysrKysrKysrKwogbGli
L3V0aWxzL3Jlc2V0L29iamVjdHMubWsgICAgICAgICAgICAgICAgICB8ICAgMyArCiBwbGF0Zm9y
bS9nZW5lcmljL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgICA3ICsrCiBwbGF0Zm9ybS9n
ZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgIHwgICAyICsKIHBsYXRmb3JtL2dlbmVy
aWMvbWV0YW5vaWEvbXQyODI0L210MjgyNC5jICAgfCAgMzEgKysrKysrCiBwbGF0Zm9ybS9nZW5l
cmljL21ldGFub2lhL210MjgyNC9vYmplY3RzLm1rIHwgIDEwICsrCiA5IGZpbGVzIGNoYW5nZWQs
IDI3OCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogY2JmOWY2NzM0ZGQ4NWE5ODJjNjNl
M2NiNWRiN2ZmZTA5ZGE4MzljYQpjaGFuZ2UtaWQ6IDIwMjYwNTI1LW10NTgyNC01NzkwODE4ZmI3
NWYKCkJlc3QgcmVnYXJkcywKLS0gIApCZW5vw650IE1vbmluLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
