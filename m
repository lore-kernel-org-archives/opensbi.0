Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74780CD98F2
	for <opensbi@archiver.kernel.org>; Thu, 18 Jun 2026 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qFHRqqpbn9Un0Ht9stcAq198tqSOMgr6D9qg66qDYjk=; b=oToSrbbXwPXJT2
	Y91ZIR0uUO7kNlNGS27e5Cwl12UfHr6TesIRnqBB82djy7PFYT415OhDXY1YpCUd+oYhfy6W2TThB
	Juk1B6WVGClyxxNlpqCt4YLn8Yd7E4AZgHqZ5a+mIgsLEiFIW9HXSMDw1xw3oMCJz4tSn2UQhAc40
	+Oy4Z+iZ2uGPs+sZAHTPePP2+WJvfwz8D8Yk/6pcw5ABrctuZaQc8FwqT6xTXbxlPZLcLldA5z/gM
	8wrL2YixltGn/gwBisuVU7PCw3tPBxtIBnp6lc9ZJXL8bcP1UhPJr+98wQ7BOJedCStnzNHyb4U+O
	C/ID3QWc5Ta6b+7NpEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBkA-00000001Fwh-43Cz;
	Thu, 18 Jun 2026 12:21:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBk6-00000001FvX-1pg7
	for opensbi@lists.infradead.org;
	Thu, 18 Jun 2026 12:21:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B4D5C06CCE;
	Thu, 18 Jun 2026 12:21:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE1D05FF03;
	Thu, 18 Jun 2026 12:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CD95106C80A8;
	Thu, 18 Jun 2026 14:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781785265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lI8lvS5JPrCyGZE1hWBV5c99UibMfvEO0C5lhMc0rQE=;
	b=VZ8lmyD3xYUcrttD6dPwVN7f+ACFBuKGynOSUH2a0w9qKGxF6BqyzVWqhmhvMWfSvoTLsv
	4odxP1wG+U02w0/m2AHWkcP457LUEK+nHK39sYbLBaIIVNIbXtojt5IaMrzXd5+7MFZUWN
	/YU/68Q1gr8ieDOTEgkPt3XGUjM7PlhyG9mgftf6xdhAGwoFD8a3SovPzRfSAiuAVAkaQZ
	634UJU/gyCAaxRVbx93PZC/DdJ6a9WZ9R24TTPFM3K22zQmyUx8D14zC5OpefHvfY49E0/
	EG0Q7lU7ybzcd0+HniclUMB7wteyD9om56sjRgs+u3FGOWovKuJpTh90GfszJg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH 0/2] Introduce Metanoia MT5824 SoC support
Date: Thu, 18 Jun 2026 14:20:31 +0200
Message-Id: <20260618-mt5824-v1-0-c99263cc6df4@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI/iM2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNT3dwSUwsjE11Tc0sDC0OLtCRz0zQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0ALNv652oAAAA=
X-Change-ID: 20260525-mt5824-5790818fb75f
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 Jun Chang <jun.chang@metanoia-comm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_052110_645383_A8DBCF41 
X-CRM114-Status: UNSURE (   4.49  )
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

VGhpcyBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBNZXRhbm9pYSBNVDU4MjQgU29DWzFdLiBU
aGUgTVQ1ODI0IGlzCmEgaGlnaGx5IGludGVncmF0ZWQgNUcgU3lzdGVtLW9uLUNoaXAgYWltZWQg
YXQgT+KAkVJBTiBSYWRpbyBVbml0cyBhbmQKc21hbGwgY2VsbHMuIEl0IGZlYXR1cmVzOgoqIENQ
VTogVHdvIEFuZGVzQ29yZSBBWDQ1TVAgUklTQy1WIDY0IGNvcmVzCiogRFNQL1BIWTogRGVkaWNh
dGVkIERTUCBjb3JlcyBhbmQgZGlnaXRhbCBmcm9udC1lbmQgZm9yIFBIWSBwcm9jZXNzaW5nCiog
TWVtb3J5OiBMUEREUjQgc3VwcG9ydCB3aXRoIGlubGluZSBFQ0MKKiBFdGhlcm5ldDogRHVhbCAx
MEcvMjVHIFNlckRlcwoqIFNQSTogT25lIFF1YWQtU1BJIGFuZCA4IFNQSSBjb250cm9sbGVycwoq
IDMgSTJDIGNvbnRyb2xsZXJzCiogU0QvTU1DIGNvbnRyb2xsZXIKKiAzIFVBUlRzCiogSGFyZHdh
cmUgd2F0Y2hkb2cKKiAzMiBHUElPcwoqIFVTQiBob3N0IGNvbnRyb2xsZXIKClsxXTogaHR0cHM6
Ly9tZXRhbm9pYS1jb21tLmNvbS9wcm9kdWN0cy81Zy9tdDU4MjQvCgpTaWduZWQtb2ZmLWJ5OiBC
ZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Ci0tLQpCZW5vw650IE1vbmlu
ICgyKToKICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IEFkZCBNZXRhbm9pYSBNVDU4MjQgaW5pdGlh
bCBzdXBwb3J0CiAgICAgIGxpYjogdXRpbHMvcmVzZXQ6IEFkZCBNZXRhbm9pYSBNVDU4MjQgc3lz
dGVtIHJlc2V0IGRyaXZlcgoKIGRvY3MvcGxhdGZvcm0vZ2VuZXJpYy5tZCAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgKwogZG9jcy9wbGF0Zm9ybS9tZXRhbm9pYS1tdDU4MjQubWQgICAgICAgICAg
ICB8IDE0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBsaWIvdXRpbHMvcmVzZXQvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsKIGxpYi91dGlscy9yZXNldC9mZHRfcmVz
ZXRfbWV0YW5vaWEuYyAgICAgICAgfCAgNzIgKysrKysrKysrKysrKysKIGxpYi91dGlscy9yZXNl
dC9vYmplY3RzLm1rICAgICAgICAgICAgICAgICAgfCAgIDMgKwogcGxhdGZvcm0vZ2VuZXJpYy9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgNyArKwogcGxhdGZvcm0vZ2VuZXJpYy9jb25m
aWdzL2RlZmNvbmZpZyAgICAgICAgICB8ICAgMiArCiBwbGF0Zm9ybS9nZW5lcmljL21ldGFub2lh
L210NTgyNC9tdDU4MjQuYyAgIHwgIDMxICsrKysrKwogcGxhdGZvcm0vZ2VuZXJpYy9tZXRhbm9p
YS9tdDU4MjQvb2JqZWN0cy5tayB8ICAxMCArKwogOSBmaWxlcyBjaGFuZ2VkLCAyNzcgaW5zZXJ0
aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IGE4YmU1ZTk0NzhiZTA4ZjA5YTcyMGY3MDEzZWMzMGQ2
ZTJiZDlmY2MKY2hhbmdlLWlkOiAyMDI2MDUyNS1tdDU4MjQtNTc5MDgxOGZiNzVmCgpCZXN0IHJl
Z2FyZHMsCi0tICAKQmVub8OudCBNb25pbiwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
