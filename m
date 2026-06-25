Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781DECDB47F
	for <opensbi@archiver.kernel.org>; Thu, 25 Jun 2026 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVFfK92XeIRGODQ+ZJ/tE761GyWa5kl+w9E9x1sZZAA=; b=zdO6oPIb0ILFob
	GN14N8/Ap9mSK0WgRIItUb6XgZmcOxrEEetvyWfwQPZvqUc5qZL5JHGeztsFw4bsLHC15zZmx9BB/
	N79+izFEc//XgLZQQHiSS9znvugjmkR39PA9cesWAsDq6UgWrpUQNtF50FnNhalwl18dA7BjaKg5S
	kObhAlrtIQvtX0eiR4xVJeI13OkSDIWYA0OnOfjxJ7LCQ1T9a+DnI3W8CoGmIRO/quNDUthKWKsbH
	+DjyEfhT2M2hKplC26OWgLmMAwVMxHJjY8b3Dmsb/RI8+0xAk5qgKHsdyndXcPrjoTVPyvIucYD+J
	zgotdlOo1N0uiTJvEkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcevl-00000008nbX-3Yq1;
	Thu, 25 Jun 2026 07:55:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcevi-00000008naR-3Ia7
	for opensbi@lists.infradead.org;
	Thu, 25 Jun 2026 07:55:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 892AE1A098C
	for <opensbi@lists.infradead.org>; Thu, 25 Jun 2026 07:55:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C6ED5FF03;
	Thu, 25 Jun 2026 07:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B054106C8442;
	Thu, 25 Jun 2026 09:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782374116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9cQFyzCOfrgwdcF+0Nt0d39iZWMH4QaEHz0CEZ/lQCw=;
	b=b/oCoutR0eKigbx55wjHVs2zCTQBgNXqMOuCEcvKQCaMttOrAjMQjGCvmdlPPPXcleKItx
	0anrMMwZEZkxo3/WOiCeZa3y4Ev4GnheUmuXhu+SJj0Wh+aSPcCbPoTAI4rErmAGierGV9
	9nr7gWF0QzEIpeWr0YBgekX2DFUzPVHz4Si3IFooNyYm08YghoSPSiv/IeCWmKshJai6uF
	mvrV3KTrnJqbOS3bWJK9rQzdc76GvNDPgj7I3FtGKhfN3Q3+QLPBteeqow6s5mHrI65HZ4
	JHSnCMeukg1zAvkMnCU7ZROrxKsu7TVoyE2Kk8qiwlQraoPxI7DeIBiMg0pgKQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v2 0/2] Introduce Metanoia MT2824 SoC support
Date: Thu, 25 Jun 2026 09:54:53 +0200
Message-Id: <20260625-mt5824-v2-0-48bd438fc2e5@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM3ePGoC/zWNyw7CIBQFf6W5azGAhVJX/ofpwlKw11gwgETT8
 O/2EZeTzJkzQzQBTYRzNUMwGSN6twA/VKDHm7sbgsPCwCmXVHBBpiQUr4loWqqYsn0jLCzyKxi
 Lny107XaO7/5hdFrXqzFiTD58t6fMVm+PSqb+0cwIJbptuTxpLQdbX3rv0xPdUfsJulLKD5b8J
 lWwAAAA
X-Change-ID: 20260525-mt5824-5790818fb75f
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 Jun Chang <jun.chang@metanoia-comm.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_005522_987098_F521386A 
X-CRM114-Status: UNSURE (   6.64  )
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
dCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBG
aXggdGhlIFNvQyBuYW1lIChNVDI4MjQpIGFuZCBjbGFyaWZ5IHRoZSByZWZlcmVuY2UgZGVzaWdu
IG5hbWUgKE1UNTgyNCkKLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAy
NjA2MTgtbXQ1ODI0LXYxLTAtYzk5MjYzY2M2ZGY0QGJvb3RsaW4uY29tCgotLS0KQmVub8OudCBN
b25pbiAoMik6CiAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBBZGQgTWV0YW5vaWEgTVQyODI0IGlu
aXRpYWwgc3VwcG9ydAogICAgICBsaWI6IHV0aWxzL3Jlc2V0OiBBZGQgTWV0YW5vaWEgTVQyODI0
IHN5c3RlbSByZXNldCBkcml2ZXIKCiBkb2NzL3BsYXRmb3JtL2dlbmVyaWMubWQgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKIGRvY3MvcGxhdGZvcm0vbWV0YW5vaWEtbXQyODI0Lm1kICAgICAg
ICAgICAgfCAxNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogbGliL3V0aWxzL3Jlc2V0
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCiBsaWIvdXRpbHMvcmVzZXQvZmR0
X3Jlc2V0X21ldGFub2lhLmMgICAgICAgIHwgIDcyICsrKysrKysrKysrKysrCiBsaWIvdXRpbHMv
cmVzZXQvb2JqZWN0cy5tayAgICAgICAgICAgICAgICAgIHwgICAzICsKIHBsYXRmb3JtL2dlbmVy
aWMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDcgKysKIHBsYXRmb3JtL2dlbmVyaWMv
Y29uZmlncy9kZWZjb25maWcgICAgICAgICAgfCAgIDIgKwogcGxhdGZvcm0vZ2VuZXJpYy9tZXRh
bm9pYS9tdDI4MjQvbXQyODI0LmMgICB8ICAzMSArKysrKysKIHBsYXRmb3JtL2dlbmVyaWMvbWV0
YW5vaWEvbXQyODI0L29iamVjdHMubWsgfCAgMTAgKysKIDkgZmlsZXMgY2hhbmdlZCwgMjc4IGlu
c2VydGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiBhOGJlNWU5NDc4YmUwOGYwOWE3MjBmNzAxM2Vj
MzBkNmUyYmQ5ZmNjCmNoYW5nZS1pZDogMjAyNjA1MjUtbXQ1ODI0LTU3OTA4MThmYjc1ZgoKQmVz
dCByZWdhcmRzLAotLSAgCkJlbm/DrnQgTW9uaW4sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
