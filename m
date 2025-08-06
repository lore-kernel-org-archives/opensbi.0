Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6705C87FD1
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 06:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksfz+tWy3L/cCv22lCv570WL5tygz7kouOu6jqcbKII=; b=I3YFBpRTnzAu1/
	e03T6cKKEM6WgCvvzIJMdjbHV5YCUUqhG7/uOrTb0eINwJT9ukBgSmhRH4avFTipY6rvyqJY7uYI3
	1acRqeLPhdKjO46++jx/9nFQBDLSV4eQEgtKkROaFYp4tIen1vhljiwoRgkaWXRbF7HJrDZ9p6M+J
	x1jYPSQEEjB50JmAVe+ZpVOdCZAmIl912D1DoBcLuexJ40dmzr/uB8IEIXAEAYejWqVUmWAxtsrVU
	shfGupORfTwD/G33NlLnlXICkchKspEO6y1IBrat6Pqg0RD+7UM+mLdG14CRZRFSlvlQJ8P5Fi4J/
	iPs1eS6WH+qbUtD3jc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXRh-0000000EOMh-2Shz;
	Wed, 06 Aug 2025 06:16:17 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujXRd-0000000EOMF-3kF4
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 06:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=IP7FbEMM//0pv5wOt6yShiqChqfLglqwkFxb7RdS1Hg=;
	b=PpAYXqVkjFfTJrylEUL2GwYZq0L1iziNxngyyyDI8sOSsMsPlDxD4wH16bWA0v
	n4YaacKM/77mSSjMBj7gYLdta+vJbYEVNYyFXL+8DMacuIf1cVeipbIai5/u79yY
	9ZZ2D3VIyO7n/q76l5qDyaAb4CJVlF4fcC5AYyp9kntyY=
Received: from OS3PR01MB7756.jpnprd01.prod.outlook.com (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHzyYl85Joz8EpAg--.36479S2;
	Wed, 06 Aug 2025 14:16:06 +0800 (CST)
From: "z_bajeer@yeah.net" <z_bajeer@yeah.net>
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: "yangjialong@rvcore.com" <yangjialong@rvcore.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGFwbGljOiBmaXggbG9jayBtYWNoYW5pc20gaW4g?=
 =?utf-8?Q?xmsiaddrcfg(h)?=
Thread-Topic: [PATCH] aplic: fix lock machanism in xmsiaddrcfg(h)
Thread-Index: AXJfNy4wRkIBq3fHo3icNdWDhfSy6dNOxBO0
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 6 Aug 2025 06:15:59 +0000
Message-ID: <OS3PR01MB7756B0E03E020CFEB54FCF7EF52DA@OS3PR01MB7756.jpnprd01.prod.outlook.com>
References: <20250806032924.3532975-1-z_bajeer@yeah.net>
In-Reply-To: <20250806032924.3532975-1-z_bajeer@yeah.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
MIME-Version: 1.0
X-CM-TRANSID: Ms8vCgDHzyYl85Joz8EpAg--.36479S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw15Ww4rtF47tr1ruFyUZFb_yoW5ury7pF
	48Jr1UKrWUJry8Gw45Jr1UJry7Gr1UGw17Jr1UG3WxJryUJrs0qr1jqryjgr1UJr4fJr15
	Jw48GFyUZFn8ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRupBsUUUUU=
X-Originating-IP: [2603:1046:c0a:2099::5]
X-CM-SenderInfo: p2betyxhhuq5hhdkh0dhw/1tbiIAbE52iS8yao4QAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_231614_276617_6526D841 
X-CRM114-Status: UNSURE (   9.37  )
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

QW5kIHRoZXJlIGlzIG5vIGZpZWxkIEwgaW4gc21zaWFkZHJjZmdoLiBXZSBzaG91bGQgdXNlIHRo
ZSBMIGZpZWxkIGluIG1tc2lhZGRyY2ZnaCBmb3IgYWxsIHhtc2lhZGRyY2ZnKGgpLgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K5Y+R5Lu25Lq6OiBZYW5nIEppYWxv
bmcgPHpfYmFqZWVyQHllYWgubmV0Pgrlt7Llj5HpgIE6IDIwMjUg5bm0IDgg5pyIIDA2IOaXpSDm
mJ/mnJ/kuIkgMTE6MjkK5pS25Lu25Lq6OiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcgPG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZz4K5oqE6YCBOiB5YW5namlhbG9uZ0BydmNvcmUuY29t
IDx5YW5namlhbG9uZ0BydmNvcmUuY29tPjsgWWFuZyBKaWFsb25nIDx6X2JhamVlckB5ZWFoLm5l
dD4K5Li76aKYOiBbUEFUQ0hdIGFwbGljOiBmaXggbG9jayBtYWNoYW5pc20gaW4geG1zaWFkZHJj
ZmcoaCkKCgo0LjUuNC4gU3VwZXJ2aXNvciBNU0kgYWRkcmVzcyBjb25maWd1cmF0aW9uIChzbXNp
YWRkcmNmZyBhbmQgc21zaWFkZHJjZmdoKQpJZiByZWdpc3RlciBtbXNpYWRkcmNmZ2ggb2YgdGhl
IGRvbWFpbiBoYXMgYml0IEwgc2V0IHRvIG9uZSwgdGhlbgpzbXNpYWRkcmNmZyBhbmQgc21zaWFk
ZHJjZmdoIGFyZSBsb2NrZWQgYXMgcmVhZC1vbmx5IGFsb25nc2lkZQptbXNpYWRkcmNmZyBhbmQg
bW1zaWFkZHJjZmdoLgoKU2lnbmVkLW9mZi1ieTogWWFuZyBKaWFsb25nIDx6X2JhamVlckB5ZWFo
Lm5ldD4KLS0tCsKgbGliL3V0aWxzL2lycWNoaXAvYXBsaWMuYyB8IDExICsrKystLS0tLS0tCsKg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9saWIvdXRpbHMvaXJxY2hpcC9hcGxpYy5jIGIvbGliL3V0aWxzL2lycWNoaXAvYXBsaWMu
YwppbmRleCA3MjkwNmQ1Li5lNGEyOWFlIDEwMDY0NAotLS0gYS9saWIvdXRpbHMvaXJxY2hpcC9h
cGxpYy5jCisrKyBiL2xpYi91dGlscy9pcnFjaGlwL2FwbGljLmMKQEAgLTEyMSwxMCArMTIxLDYg
QEAgc3RhdGljIHZvaWQgYXBsaWNfd3JpdGVsX21zaWNmZyhzdHJ1Y3QgYXBsaWNfbXNpY2ZnX2Rh
dGEgKm1zaWNmZywKwqDCoMKgwqDCoMKgwqDCoCB1MzIgdmFsOwrCoMKgwqDCoMKgwqDCoMKgIHVu
c2lnbmVkIGxvbmcgYmFzZV9wcG47CsKgCi3CoMKgwqDCoMKgwqAgLyogQ2hlY2sgaWYgTVNJIGNv
bmZpZyBpcyBhbHJlYWR5IGxvY2tlZCAqLwotwqDCoMKgwqDCoMKgIGlmIChyZWFkbChtc2ljZmdh
ZGRySCkgJiBBUExJQ194TVNJQ0ZHQUREUkhfTCkKLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuOwotCsKgwqDCoMKgwqDCoMKgwqAgLyogQ29tcHV0ZSB0aGUgTVNJIGJhc2UgUFBO
ICovCsKgwqDCoMKgwqDCoMKgwqAgYmFzZV9wcG4gPSBtc2ljZmctPmJhc2VfYWRkciA+PiBBUExJ
Q194TVNJQ0ZHQUREUl9QUE5fU0hJRlQ7CsKgwqDCoMKgwqDCoMKgwqAgYmFzZV9wcG4gJj0gfkFQ
TElDX3hNU0lDRkdBRERSX1BQTl9IQVJUKG1zaWNmZy0+bGh4cyk7CkBAIC0xNjcsNyArMTYzLDcg
QEAgc3RhdGljIGludCBhcGxpY19jaGVja19tc2ljZmcoc3RydWN0IGFwbGljX21zaWNmZ19kYXRh
ICptc2ljZmcpCsKgCsKgaW50IGFwbGljX2NvbGRfaXJxY2hpcF9pbml0KHN0cnVjdCBhcGxpY19k
YXRhICphcGxpYykKwqB7Ci3CoMKgwqDCoMKgwqAgaW50IHJjOworwqDCoMKgwqDCoMKgIGludCBy
YywgbG9ja2VkOwrCoMKgwqDCoMKgwqDCoMKgIHUzMiBpLCBqLCB0bXA7CsKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGFwbGljX2RlbGVnYXRlX2RhdGEgKmRlbGVnOwrCoMKgwqDCoMKgwqDCoMKgIHUz
MiBmaXJzdF9kZWxlZ19pcnEsIGxhc3RfZGVsZWdfaXJxOwpAQCAtMjQ3LDEyICsyNDMsMTMgQEAg
aW50IGFwbGljX2NvbGRfaXJxY2hpcF9pbml0KHN0cnVjdCBhcGxpY19kYXRhICphcGxpYykKwqDC
oMKgwqDCoMKgwqDCoCB9CsKgCsKgwqDCoMKgwqDCoMKgwqAgLyogTVNJIGNvbmZpZ3VyYXRpb24g
Ki8KLcKgwqDCoMKgwqDCoCBpZiAoYXBsaWMtPnRhcmdldHNfbW1vZGUgJiYgYXBsaWMtPmhhc19t
c2ljZmdfbW1vZGUpIHsKK8KgwqDCoMKgwqDCoCBsb2NrZWQgPSByZWFkbCgodm9pZCAqKShhcGxp
Yy0+YWRkciArIEFQTElDX01NU0lDRkdBRERSSCkpICYgQVBMSUNfeE1TSUNGR0FERFJIX0w7CivC
oMKgwqDCoMKgwqAgaWYgKGFwbGljLT50YXJnZXRzX21tb2RlICYmIGFwbGljLT5oYXNfbXNpY2Zn
X21tb2RlICYmICFsb2NrZWQpIHsKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXBs
aWNfd3JpdGVsX21zaWNmZygmYXBsaWMtPm1zaWNmZ19tbW9kZSwKwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodm9pZCAqKShh
cGxpYy0+YWRkciArIEFQTElDX01NU0lDRkdBRERSKSwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodm9pZCAqKShhcGxpYy0+
YWRkciArIEFQTElDX01NU0lDRkdBRERSSCkpOwrCoMKgwqDCoMKgwqDCoMKgIH0KLcKgwqDCoMKg
wqDCoCBpZiAoYXBsaWMtPnRhcmdldHNfbW1vZGUgJiYgYXBsaWMtPmhhc19tc2ljZmdfc21vZGUp
IHsKK8KgwqDCoMKgwqDCoCBpZiAoYXBsaWMtPnRhcmdldHNfbW1vZGUgJiYgYXBsaWMtPmhhc19t
c2ljZmdfc21vZGUgJiYgIWxvY2tlZCkgewrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhcGxpY193cml0ZWxfbXNpY2ZnKCZhcGxpYy0+bXNpY2ZnX3Ntb2RlLArCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh2b2lk
ICopKGFwbGljLT5hZGRyICsgQVBMSUNfU01TSUNGR0FERFIpLArCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh2b2lkICopKGFw
bGljLT5hZGRyICsgQVBMSUNfU01TSUNGR0FERFJIKSk7Ci0tIAoyLjM0LjEKCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
