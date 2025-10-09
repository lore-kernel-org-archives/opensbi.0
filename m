Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D1CCD184
	for <opensbi@archiver.kernel.org>; Thu,  9 Oct 2025 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IazRx1LEp/dDAvPbiiSmlG6wKYGyM5GXhfvqr3lvay0=; b=l2Tz89wb93ENf2
	2M5r6ybI11lCoflS/i31AanbFjb5HeXJ12h91miG9Jf1e6IQgW8e6kKnpcgv6XRQ+AgrE1QW7aIcT
	RYqJm5/gQZ9OOIdIo1hcOQlQ00QdvduNZmEb6cxKrQBtH8T/2unv1GGzZsn8rxbjWZsOi+0DPL20M
	KJOntMmMxIC27vJo1g76lXid0Cnr3BFXWCMw6+mCgfG1qy1spxTvDkjlloc+zt/vhs7+mp8vHP2hG
	nIw+ovazkFUJZWeVAPWKSSkk/Knu7V32DAU1gp30I6wgA7P/tkDsHE8lbqFDs7jcgpuJOA1CDWjp+
	qPSCCpp6T6PM88gSSDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sHZ-00000006RZy-1LUJ;
	Thu, 09 Oct 2025 15:10:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sHV-00000006RYq-3PEr
	for opensbi@lists.infradead.org;
	Thu, 09 Oct 2025 15:10:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5C744E40FB5;
	Thu,  9 Oct 2025 15:10:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7D336062C;
	Thu,  9 Oct 2025 15:10:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5E2E102F21EA;
	Thu,  9 Oct 2025 17:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760022610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PyBZKbfhOt2R2mnxFo7hOw07FrPfA5CxN/L6UAYCisg=;
	b=Tphz564fZEvo440RkBITvaN0nJcmko5SkTufWmMdvFsq+dx6A8BSl+WKcQe2Z82/1bgPTb
	3wTzhaC19SpI4WVNxTE2ndAaY3AeqSICbh8B9Mtlw8pi8wWCTKdmheC5i0PREDDBLFW1mD
	FK0SCManU8mZUFnSvFA/eiDSEd6ufIjyTuqxPUfsSWDkVvXc1uMOw478iYa6zflYvdA7GZ
	el9aMqN01+OcihTkT/IDcU/i8WKPy7EPP4y6G8XgHPYocZSlKw00fw3vpSvdIG0k6wk90V
	unP4gcDz9cmq8cQZZljC4ad07lSsup5BsWBVJuwCfkHiaDSlq9b5+9nVkR8ZqQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 09 Oct 2025 17:09:40 +0200
Subject: [PATCH 2/2] lib: utils/timer: mtimer: add MIPS P8700 compatible
MIME-Version: 1.0
Message-Id: <20251009-p8700-aclint-v1-2-18322c64f968@bootlin.com>
References: <20251009-p8700-aclint-v1-0-18322c64f968@bootlin.com>
In-Reply-To: <20251009-p8700-aclint-v1-0-18322c64f968@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_081013_990113_D110AD6F 
X-CRM114-Status: GOOD (  13.31  )
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
dGVyLCBlYWNoCmFzc29jaWF0ZWQgd2l0aCB0aGUgSEFSVFMgb2YgdGhlIGNsdXN0ZXIuIFRvIGJl
IGFibGUgdG8gc2VsZWN0IGEKcmVmZXJlbmNlIE1USU1FUiBpbiB0aGF0IGNhc2UsIGFkZCBhIHF1
aXJrIHRvIHNlbGVjdCBhbnkgTVRJTUVSIGFzIHRoZQpyZWZlcmVuY2UuIFRoZSBmaXJzdCBwYXJz
ZWQgd2lsbCBiZSB1c2VkIGFzIHRoZSByZWZlcmVuY2UgdG8Kc3luY2hyb25pemUgdGhlIG90aGVy
cy4KClNpZ25lZC1vZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNv
bT4KLS0tCiBsaWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5jIHwgMTAgKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMgYi9saWIvdXRpbHMvdGlt
ZXIvZmR0X3RpbWVyX210aW1lci5jCmluZGV4IDIyNDUzNGQuLjkxNzUzNjMgMTAwNjQ0Ci0tLSBh
L2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMKKysrIGIvbGliL3V0aWxzL3RpbWVy
L2ZkdF90aW1lcl9tdGltZXIuYwpAQCAtMjAsNiArMjAsNyBAQCBzdHJ1Y3QgdGltZXJfbXRpbWVy
X3F1aXJrcyB7CiAJdW5zaWduZWQgaW50CWNsaW50X210aW1lX29mZnNldDsKIAlib29sCQljbGlu
dF93aXRob3V0X210aW1lOwogCWJvb2wJCWhhc182NGJpdF9tbWlvOworCWJvb2wJCXVzZV9hbnlf
cmVmOwogfTsKIAogc3RydWN0IHRpbWVyX210aW1lcl9ub2RlIHsKQEAgLTM5LDYgKzQwLDcgQEAg
c3RhdGljIGludCB0aW1lcl9tdGltZXJfY29sZF9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5v
ZGVvZmYsCiAJc3RydWN0IGFjbGludF9tdGltZXJfZGF0YSAqbXQ7CiAJY29uc3Qgc3RydWN0IHRp
bWVyX210aW1lcl9xdWlya3MgKnF1aXJrcyA9IG1hdGNoLT5kYXRhOwogCWJvb2wgaXNfY2xpbnQg
PSBxdWlya3MgJiYgcXVpcmtzLT5pc19jbGludDsKKwlib29sIHVzZV9hbnlfcmVmID0gcXVpcmtz
ICYmIHF1aXJrcy0+dXNlX2FueV9yZWY7CiAKIAltdG4gPSBzYmlfemFsbG9jKHNpemVvZigqbXRu
KSk7CiAJaWYgKCFtdG4pCkBAIC0xMTYsNyArMTE4LDcgQEAgc3RhdGljIGludCB0aW1lcl9tdGlt
ZXJfY29sZF9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCiAJICogZGVmaW5lIGFu
IG9wdGlvbmFsIERUIHByb3BlcnR5IG9yIHNvbWUgb3RoZXIgbWVjaGFuaXNtIHRvCiAJICogaGVs
cCB1cyBzZWxlY3QgdGhlIHJlZmVyZW5jZSBNVElNRVIgZGV2aWNlLgogCSAqLwotCWlmICghbXQt
PmhhcnRfY291bnQgJiYgIW10X3JlZmVyZW5jZSkgeworCWlmICgoIW10LT5oYXJ0X2NvdW50IHx8
IHVzZV9hbnlfcmVmKSAmJiAhbXRfcmVmZXJlbmNlKSB7CiAJCW10X3JlZmVyZW5jZSA9IG10Owog
CQkvKgogCQkgKiBTZXQgcmVmZXJlbmNlIGZvciBhbHJlYWR5IHByb3BiZWQgTVRJTUVSIGRldmlj
ZXMKQEAgLTE1MiwxMiArMTU0LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVy
X3F1aXJrcyB0aGVhZF9hY2xpbnRfcXVpcmtzID0gewogCS5oYXNfNjRiaXRfbW1pbwkJPSBmYWxz
ZSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJrcyBtaXBzX2Fj
bGludF9xdWlya3MgPSB7CisJLnVzZV9hbnlfcmVmCQk9IHRydWUsCit9OworCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGZkdF9tYXRjaCB0aW1lcl9tdGltZXJfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRp
YmxlID0gInJpc2N2LGNsaW50MCIsIC5kYXRhID0gJnNpZml2ZV9jbGludF9xdWlya3MgfSwKIAl7
IC5jb21wYXRpYmxlID0gInNpZml2ZSxjbGludDAiLCAuZGF0YSA9ICZzaWZpdmVfY2xpbnRfcXVp
cmtzIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTAwLWNsaW50IiwgLmRhdGEgPSAmdGhl
YWRfY2xpbnRfcXVpcmtzIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTAwLWFjbGludC1t
dGltZXIiLAogCSAgLmRhdGEgPSAmdGhlYWRfYWNsaW50X3F1aXJrcyB9LAorCXsgLmNvbXBhdGli
bGUgPSAibWlwcyxwODcwMC1hY2xpbnQtbXRpbWVyIiwKKwkgIC5kYXRhID0gJm1pcHNfYWNsaW50
X3F1aXJrcyB9LAogCXsgLmNvbXBhdGlibGUgPSAicmlzY3YsYWNsaW50LW10aW1lciIgfSwKIAl7
IH0sCiB9OwoKLS0gCjIuNTEuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
