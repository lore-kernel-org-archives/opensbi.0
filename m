Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B149CC624D9
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t4k+45aCcKhNuePICpGYz7FT6KkldFQ6reqg2YRaebE=; b=gMacEDP7o2/xS1
	s0axLWwJzJfCbyt5CbBIQEfMuFcF4WbsL7AW9mmlvVGmrxjpX524xehIplheTOEUdpKBm1SpgLHeZ
	FNUTZN9kmC6ByIrdOIR8PJONH9huXPAM88lBDKwHF3UAv0OQLa6E5xXzHxdNnCi97TnPKGdHKHlxl
	6ktkc+T31KfyQSAdZTn38a0O5BU6P1fRzKBjpkM1pnGpK/UAiYD7RFNG7XgafhbR2a3k+UGv5L1oZ
	1CN1aZ5DfitubUUESpd51FgHfOakAET4pAmMwPorhZrR9Gf15kdn2hSrMN1xU5K4T6vyFOrLPifY9
	buWvkiSxCkIm13s8oTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mVx-0000000F2iJ-4BGN;
	Wed, 02 Sep 2026 15:04:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mVu-0000000F2hu-1CXH
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 15:04:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 060594E414CD;
	Wed,  2 Sep 2026 15:04:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4D186053C;
	Wed,  2 Sep 2026 15:04:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E53E11C7931C;
	Wed,  2 Sep 2026 17:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788361465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iKKlNpVLjkMLT4C+bDyVGRSn9JyU716Ofq+8tgAtUDA=;
	b=TvcJQFgrBIyJaiu82TvIPS8l6VBagd9gCMqzohFOCaY6aVQxBok+YN/pp6tV0qElf1x/1C
	s69WTNzOBSufGuOhfBIZlsmIC+PlfprPvy8+jmfwfbeMrHyT6u1W6ciCRqYD5fdWOWWet6
	Jvm5jNR3KsISu99Hk/QBSkNyyznNYy8E5VYdnhzEuVf2rkcagEFJEtgZ0AelLWdurOjqqP
	JJBkdZV53kmUspJH3sweeanNYVQLQcqdAYLS7qvVJgl5gUqOfv1zp3w4iaOJ6KYJaoGunm
	z2m4vKoZyGumEtIcFUWOrWJBFZzIST7wDlrnl+I1AiJGil8dcGfKgQd9EcnhAg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 02 Sep 2026 17:04:07 +0200
Subject: [PATCH] platform: generic: metanoia/mt2824: configure PMA for DSP
 memory regions
MIME-Version: 1.0
Message-Id: <20260902-mt2824-pma-v1-1-ada8f836365d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOY6mGoC/yXMQQ5AMBBA0avIrDWpSTXqKmJBDUZSpEUk4u6K5
 Vv8f0EgzxSgTC7wdHDgZY7I0gTs2MwDCe6iASVqaSQKt2GBSqyuEb00VhmdW0UGYrB66vn8ZlX
 9O+ztRHZ7D3DfD8/xXSJuAAAA
X-Change-ID: 20260902-mt2824-pma-f09c4965c4e9
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 Jun Chang <jun.chang@metanoia-comm.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_080434_491118_8EAD69EF 
X-CRM114-Status: UNSURE (   9.17  )
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

U2V0IHVwIHRoZSBtZW1vcnkgYXR0cmlidXRlIGZvciB0aGUgWE9SIFJBTSwgTVJBUyBtZW1vcnks
IGFuZCBSU0MgdGFibGUKdXNlZCBieSB0aGUgRFNQcyBhcyBub24tY2FjaGVhYmxlIGFuZCBidWZm
ZXJhYmxlIGR1cmluZyBmaW5hbCBpbml0LgoKU2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8
YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KIHBsYXRmb3JtL2dlbmVyaWMvbWV0YW5vaWEv
bXQyODI0L210MjgyNC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5l
cmljL21ldGFub2lhL210MjgyNC9tdDI4MjQuYyBiL3BsYXRmb3JtL2dlbmVyaWMvbWV0YW5vaWEv
bXQyODI0L210MjgyNC5jCmluZGV4IGEzNDMwNGI5Li45NzBlMTVlNyAxMDA2NDQKLS0tIGEvcGxh
dGZvcm0vZ2VuZXJpYy9tZXRhbm9pYS9tdDI4MjQvbXQyODI0LmMKKysrIGIvcGxhdGZvcm0vZ2Vu
ZXJpYy9tZXRhbm9pYS9tdDI4MjQvbXQyODI0LmMKQEAgLTYsMTMgKzYsNjAgQEAKICAqICAgICAg
SnVuIENoYW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+CiAgKi8KIAorI2luY2x1ZGUg
PGFuZGVzL2FuZGVzX3BtYS5oPgogI2luY2x1ZGUgPGFuZGVzL2FuZGVzX3BtdS5oPgogI2luY2x1
ZGUgPGFuZGVzL2FuZGVzX3NiaS5oPgogI2luY2x1ZGUgPHBsYXRmb3JtX292ZXJyaWRlLmg+Cisj
aW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmg+CisKKyNkZWZpbmUgTVQyODI0X1hP
Ul9SQU1fQkFTRQkJMHgwMDEwMDAwMFVMTAorI2RlZmluZSBNVDI4MjRfWE9SX1JBTV9TSVpFCQkw
eDAwMDQwMDAwVUxMCisKKyNkZWZpbmUgTVQyODI0X01SQVNfTUVNX0JBU0UJCTB4NjAwMDAwMDBV
TEwKKyNkZWZpbmUgTVQyODI0X01SQVNfTUVNX1NJWkUJCTB4MjAwMDAwMDBVTEwKKworI2RlZmlu
ZSBNVDI4MjRfUlNDVEFCTEVfQkFTRQkJMHg4MTAwMDAwMFVMTAorI2RlZmluZSBNVDI4MjRfUlND
VEFCTEVfU0laRQkJMHgwMDAxMDAwMFVMTAorCitzdGF0aWMgY29uc3Qgc3RydWN0IGFuZGVzX3Bt
YV9yZWdpb24gbWV0YW5vaWFfbXQyODI0X3BtYV9yZWdpb25zW10gPSB7CisJeworCQkucGEgPSBN
VDI4MjRfWE9SX1JBTV9CQVNFLAorCQkuc2l6ZSA9IE1UMjgyNF9YT1JfUkFNX1NJWkUsCisJCS5m
bGFncyA9IEFOREVTX1BNQUNGR19FVFlQX05BUE9UIHwKKwkJCSBBTkRFU19QTUFDRkdfTVRZUF9N
RU1fTk9OX0NBQ0hFX0JVRiwKKwl9LAorCXsKKwkJLnBhID0gTVQyODI0X01SQVNfTUVNX0JBU0Us
CisJCS5zaXplID0gTVQyODI0X01SQVNfTUVNX1NJWkUsCisJCS5mbGFncyA9IEFOREVTX1BNQUNG
R19FVFlQX05BUE9UIHwKKwkJCSBBTkRFU19QTUFDRkdfTVRZUF9NRU1fTk9OX0NBQ0hFX0JVRiwK
Kwl9LAorICAgICAgICB7CisJCS5wYSA9IE1UMjgyNF9SU0NUQUJMRV9CQVNFLAorCQkuc2l6ZSA9
IE1UMjgyNF9SU0NUQUJMRV9TSVpFLAorCQkuZmxhZ3MgPSBBTkRFU19QTUFDRkdfRVRZUF9OQVBP
VCB8CisJCQkgQU5ERVNfUE1BQ0ZHX01UWVBfTUVNX05PTl9DQUNIRV9CVUYsCisgICAgICAgIH0s
Cit9OworCitzdGF0aWMgaW50IG1ldGFub2lhX210MjgyNF9maW5hbF9pbml0KGJvb2wgY29sZF9i
b290KQoreworCXZvaWQgKmZkdCA9IGZkdF9nZXRfYWRkcmVzc19ydygpOworCWludCByYzsKKwor
CS8qIFNldCB0aGUgRFNQIG1lbW9yeSByZWdpb25zIGF0dHJpYnV0ZXMgKi8KKwlyYyA9IGFuZGVz
X3BtYV9zZXR1cF9yZWdpb25zKGZkdCwgbWV0YW5vaWFfbXQyODI0X3BtYV9yZWdpb25zLAorCQkJ
CSAgICAgYXJyYXlfc2l6ZShtZXRhbm9pYV9tdDI4MjRfcG1hX3JlZ2lvbnMpKTsKKwlpZiAocmMp
CisJCXJldHVybiByYzsKKworCXJldHVybiBnZW5lcmljX2ZpbmFsX2luaXQoY29sZF9ib290KTsK
K30KIAogc3RhdGljIGludCBtZXRhbm9pYV9tdDI4MjRfcGxhdGZvcm1faW5pdChjb25zdCB2b2lk
ICpmZHQsIGludCBub2Rlb2ZmLAogCQkJCQljb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCkK
IHsKKwlnZW5lcmljX3BsYXRmb3JtX29wcy5maW5hbF9pbml0ID0gbWV0YW5vaWFfbXQyODI0X2Zp
bmFsX2luaXQ7CiAJZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZXh0ZW5zaW9uc19pbml0ID0gYW5kZXNf
cG11X2V4dGVuc2lvbnNfaW5pdDsKIAlnZW5lcmljX3BsYXRmb3JtX29wcy5wbXVfaW5pdCA9IGFu
ZGVzX3BtdV9pbml0OwogCWdlbmVyaWNfcGxhdGZvcm1fb3BzLnZlbmRvcl9leHRfcHJvdmlkZXIg
PSBhbmRlc19zYmlfdmVuZG9yX2V4dF9wcm92aWRlcjsKCi0tLQpiYXNlLWNvbW1pdDogMzU1MTFi
YzZlZTFjOWMxN2I2YTg5YjQ0YzUyZTIwNDRiYjUxYjk3OQpjaGFuZ2UtaWQ6IDIwMjYwOTAyLW10
MjgyNC1wbWEtZjA5YzQ5NjVjNGU5CgpCZXN0IHJlZ2FyZHMsCi0tICAKQmVub8OudCBNb25pbiwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
