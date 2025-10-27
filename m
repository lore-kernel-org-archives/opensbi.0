Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55967CCF9EE
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBlI6qZdTP37zIx6/5rEs4cOGn3Tb/jd9Bdqi+wOsb0=; b=LM/HHas8Io7GE6
	57kmynXGCHuwBNgKgRlIk8s/Q0oK20ZhWD9/X7p5h23t0wwfJy7xE7arcXZ0iUx7PMW1szC9KyDX0
	kydSYcMbwO8SXGEiFhW3Ep9qEqqvdki/6HFcuOkPIUvhTNubBOz3c60Kg/SnrhUR9FNm+aapZCEni
	swrWV4zPAHVoRVyTMRY1AbTvs7bvhtLDbcRjltfvb93Loy6YrtVhtTjVUS46jqCt9bnx0aC/IXiZ8
	cu4jFRQg1V2pQjH9r4Rc4opxmTTA7dG+ZZst1hxWXVCtTXjJiDYkncNRRk/3yRR2U+garySTV3d6i
	yEH0TsleD9zFhqhugq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN1k-0000000DzXT-30i8;
	Mon, 27 Oct 2025 13:12:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN1g-0000000DzVQ-31CJ
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 13:12:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38B36C0B887;
	Mon, 27 Oct 2025 13:12:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66A2D6062C;
	Mon, 27 Oct 2025 13:12:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85E8D102F2502;
	Mon, 27 Oct 2025 14:12:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761570760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tXSnMdwuxuJGjT3kWzjMW9h0LO97YeYgINMleK5+Nnw=;
	b=OSu2COxdxCpyjVd/bHEmUZ+qzGyeqoxol7UG5AExzy04ir43e3Oxd68mWbaU8LSaUYJCR+
	mDbInNaknBv+cQycRe25bx4YIcqiLHkPq0nt/P2n64evEhHMVsDW7NNwHDFlyRahWm+WC/
	I2DEot0L+Ad+lQVTiaOappU/NzVda7rHrknjeKp+048+eLvqyOhJgi6ZbWawfDRMLAcPeB
	mvqdMth9vEGLlyQSlmPRpS3YodqUWnV2FBk3IyOww3SAcRJ4IzgP4UOfy1i9HHPBAGmpJY
	iH/z1g8p3qv/A0BGOPgCupTNohS+LZWN9Q9hp0Bb7b/hDzKR8wmL9AsHLjKI6w==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 27 Oct 2025 14:12:18 +0100
Subject: [PATCH v2 2/2] lib: utils/timer: mtimer: add MIPS P8700 compatible
MIME-Version: 1.0
Message-Id: <20251027-p8700-aclint-v2-2-f10cbfb66e92@bootlin.com>
References: <20251027-p8700-aclint-v2-0-f10cbfb66e92@bootlin.com>
In-Reply-To: <20251027-p8700-aclint-v2-0-f10cbfb66e92@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_061244_905917_24A7565D 
X-CRM114-Status: GOOD (  17.27  )
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

VGhlIE1USU1FUiBvZiB0aGUgTUlQUyBQODcwMCBpcyBjb21wbGlhbnQgd2l0aCB0aGUgQUNMSU5U
IHNwZWNpZmljYXRpb24sCnNvIGFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBpdC4KCkluIGEg
bXVsdGktY2x1c3RlciBjb25maWd1cmF0aW9uLCB0aGVyZSBpcyBvbmUgTVRJTUVSIHBlciBjbHVz
dGVyLCBlYWNoCmFzc29jaWF0ZWQgd2l0aCB0aGUgSEFSVFMgb2YgdGhlIGNsdXN0ZXIuIFNvIHdl
IGRvIG5vdCBoYXZlIGEgTVRJTUVSCndpdGggbm8gYXNzb2NpYXRlZCBIQVJUcyB0byB1c2UgYXMg
b3VyIHJlZmVyZW5jZS4KClRvIGJlIGFibGUgdG8gc2VsZWN0IGEgcmVmZXJlbmNlIE1USU1FUiBp
biB0aGF0IGNhc2UsIGFkZCBhIHF1aXJrIHRvIGxvb2sKdXAgYW4gb3B0aW9uYWwgZGV2aWNlIHRy
ZWUgcHJvcGVydHkgdGhhdCBpbmRpY2F0ZSB3aGljaCBNVElNRVIgdG8gdXNlLgpGb3IgdGhlIE1J
UFMgUDg3MDAsIHRoZSBwcm9wZXJ0eSBpcyAibWlwcyxyZWZlcmVuY2UtbXRpbWVyIi4KClNpZ25l
ZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KLS0tCiBs
aWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5jIHwgMjUgKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYyBiL2xpYi91
dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMKaW5kZXggZTFmZDA1MS4uZTk4Yzk5ZiAxMDA2
NDQKLS0tIGEvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYworKysgYi9saWIvdXRp
bHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5jCkBAIC0yMCw2ICsyMCw3IEBAIHN0cnVjdCB0aW1l
cl9tdGltZXJfcXVpcmtzIHsKIAl1bnNpZ25lZCBpbnQJY2xpbnRfbXRpbWVfb2Zmc2V0OwogCWJv
b2wJCWNsaW50X3dpdGhvdXRfbXRpbWU7CiAJYm9vbAkJaGFzXzY0Yml0X21taW87CisJY29uc3Qg
Y2hhcgkqZHRfcmVmX3Byb3A7CiB9OwogCiBzdHJ1Y3QgdGltZXJfbXRpbWVyX25vZGUgewpAQCAt
MzksNiArNDAsNyBAQCBzdGF0aWMgaW50IHRpbWVyX210aW1lcl9jb2xkX2luaXQoY29uc3Qgdm9p
ZCAqZmR0LCBpbnQgbm9kZW9mZiwKIAlzdHJ1Y3QgYWNsaW50X210aW1lcl9kYXRhICptdDsKIAlj
b25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJrcyAqcXVpcmtzID0gbWF0Y2gtPmRhdGE7CiAJ
Ym9vbCBpc19jbGludCA9IHF1aXJrcyAmJiBxdWlya3MtPmlzX2NsaW50OworCWJvb2wgaXNfcmVm
ID0gZmFsc2U7CiAKIAltdG4gPSBzYmlfemFsbG9jKHNpemVvZigqbXRuKSk7CiAJaWYgKCFtdG4p
CkBAIC0xMTAsMTMgKzExMiwxOCBAQCBzdGF0aWMgaW50IHRpbWVyX210aW1lcl9jb2xkX2luaXQo
Y29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwKIAl9CiAKIAkvKgotCSAqIFNlbGVjdCBmaXJz
dCBNVElNRVIgZGV2aWNlIHdpdGggbm8gYXNzb2NpYXRlZCBIQVJUcyBhcyBvdXIKLQkgKiByZWZl
cmVuY2UgTVRJTUVSIGRldmljZS4gVGhpcyBpcyBvbmx5IGEgdGVtcG9yYXJ5IHN0cmF0ZWd5Ci0J
ICogb2Ygc2VsZWN0aW5nIHJlZmVyZW5jZSBNVElNRVIgZGV2aWNlLiBJbiBmdXR1cmUsIHdlIG1p
Z2h0Ci0JICogZGVmaW5lIGFuIG9wdGlvbmFsIERUIHByb3BlcnR5IG9yIHNvbWUgb3RoZXIgbWVj
aGFuaXNtIHRvCi0JICogaGVscCB1cyBzZWxlY3QgdGhlIHJlZmVyZW5jZSBNVElNRVIgZGV2aWNl
LgorCSAqIElmIHdlIGhhdmUgYSBEVCBwcm9wZXJ0eSB0byBpbmRpY2F0ZSB3aGljaCBNVElNRVIg
aXMgdGhlIHJlZmVyZW5jZSwKKwkgKiBzZWxlY3QgdGhlIGZpcnN0IE1USU1FUiBkZXZpY2UgdGhh
dCBoYXMgaXQuIE90aGVyd2lzZSwgc2VsZWN0IHRoZQorCSAqIGZpcnN0IE1USU1FUiBkZXZpY2Ug
d2l0aCBubyBhc3NvY2lhdGVkIEhBUlRzIGFzIG91ciByZWZlcmVuY2UuCiAJICovCi0JaWYgKCFt
dC0+aGFydF9jb3VudCAmJiAhbXRfcmVmZXJlbmNlKSB7CisJaWYgKHF1aXJrcyAmJiBxdWlya3Mt
PmR0X3JlZl9wcm9wKSB7CisJCWlmIChmZHRfZ2V0cHJvcChmZHQsIG5vZGVvZmYsIHF1aXJrcy0+
ZHRfcmVmX3Byb3AsIE5VTEwpKQorCQkJaXNfcmVmID0gdHJ1ZTsKKwl9IGVsc2UgaWYgKCFtdC0+
aGFydF9jb3VudCkgeworCQlpc19yZWYgPSB0cnVlOworCX0KKworCWlmIChpc19yZWYgJiYgIW10
X3JlZmVyZW5jZSkgewogCQltdF9yZWZlcmVuY2UgPSBtdDsKIAkJLyoKIAkJICogU2V0IHJlZmVy
ZW5jZSBmb3IgYWxyZWFkeSBwcm9wYmVkIE1USU1FUiBkZXZpY2VzCkBAIC0xNTIsNiArMTU5LDEw
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJrcyB0aGVhZF9hY2xpbnRf
cXVpcmtzID0gewogCS5oYXNfNjRiaXRfbW1pbwkJPSBmYWxzZSwKIH07CiAKK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJrcyBtaXBzX2FjbGludF9xdWlya3MgPSB7CisJLmR0
X3JlZl9wcm9wCQk9ICJtaXBzLHJlZmVyZW5jZS1tdGltZXIiLAorfTsKKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBmZHRfbWF0Y2ggdGltZXJfbXRpbWVyX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJs
ZSA9ICJyaXNjdixjbGludDAiLCAuZGF0YSA9ICZzaWZpdmVfY2xpbnRfcXVpcmtzIH0sCiAJeyAu
Y29tcGF0aWJsZSA9ICJzaWZpdmUsY2xpbnQwIiwgLmRhdGEgPSAmc2lmaXZlX2NsaW50X3F1aXJr
cyB9LApAQCAtMTU5LDYgKzE3MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoIHRp
bWVyX210aW1lcl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAidGhlYWQsYzkwMC1jbGlu
dCIsIC5kYXRhID0gJnRoZWFkX2NsaW50X3F1aXJrcyB9LAogCXsgLmNvbXBhdGlibGUgPSAidGhl
YWQsYzkwMC1hY2xpbnQtbXRpbWVyIiwKIAkgIC5kYXRhID0gJnRoZWFkX2FjbGludF9xdWlya3Mg
fSwKKwl7IC5jb21wYXRpYmxlID0gIm1pcHMscDg3MDAtYWNsaW50LW10aW1lciIsCisJICAuZGF0
YSA9ICZtaXBzX2FjbGludF9xdWlya3MgfSwKIAl7IC5jb21wYXRpYmxlID0gInJpc2N2LGFjbGlu
dC1tdGltZXIiIH0sCiAJeyB9LAogfTsKCi0tIAoyLjUxLjEKCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
