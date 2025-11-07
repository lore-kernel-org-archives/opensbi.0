Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1024CCF9F8
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pMZS35ejN7+Fe4GU0/N9UIgzoOesrNgocVmh9T9/Yo=; b=Ui2t3Z4gQ1J/7W
	xouX2r1cS6XZcrV6C0mk4cLoQiT5iuBB9kG4mFt/f0VZp0ZVCRR+RQDaonx70Zfz1ZXzV+znriYhd
	N4i/Vw+zH94Hw4qG/vR5QXXcAoWVWAJJa8Y6PDFW7Pt4qpicbDHKNHuPKKfiisqzXFVxmdM0HkPQP
	VTr/N+5TmLGF1ICsRfTnIuQMFEV6aUodJ4C1VF7r1kaJTiJO4IvCLDVJR0ozs1DmKTJw3/sebxjx0
	H2uOcTXq0zvn6iHhuC7RcJCaJb/5O/FhgEQ7WEs38gRzONUyn19ZjEVX/BLw5NWWnaBBhmfz5j0Oe
	n7tLT06tgHNERyTdid6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK03-0000000H8Ix-2cOO;
	Fri, 07 Nov 2025 10:47:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJzz-0000000H8Hq-1FUT
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 10:47:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 58BEA4E41594;
	Fri,  7 Nov 2025 10:47:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 285FC606A6;
	Fri,  7 Nov 2025 10:47:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CD62118522A9;
	Fri,  7 Nov 2025 11:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762512434; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hJM5fwncm2ZhERT9kK2rnflAQKUUOX2kyhnYBqoSOyI=;
	b=YeEeOYmeSSqS3R6sMPsYMaoK056hTA2ZxPq6pqoWUb1dCxoD5kpSUZRO0kxCgvMLbIp/aD
	/d/GtkDvkUqqf1kmuXvZYb+okeUdrxK0o1gfdW35qkGStp8nCB/luaypc3n2VrawKUONfb
	lD2nSabK7Xsu6FmZusywhk7s6JylhrpcQN+zXkyst+WaTSoq2GqVaKNBYXUZgHTFvRVqaM
	Zu2i+debY67cLntdAceQGNh+wK84WU+0WpUYDnyC+kAgqdSZxWU/0rDRsyKaYuUfcaURDe
	LRbbefhjoO8r4w4RXXjTVlGXCtJVvK9Ii7oRNvW66FQM+HnF+dTuKAdaAz2G8Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 07 Nov 2025 11:46:57 +0100
Subject: [PATCH v3 1/2] lib: utils/timer: mtimer: Select the reference
 mtimer from a DT property
MIME-Version: 1.0
Message-Id: <20251107-p8700-aclint-v3-1-93eabb17d54e@bootlin.com>
References: <20251107-p8700-aclint-v3-0-93eabb17d54e@bootlin.com>
In-Reply-To: <20251107-p8700-aclint-v3-0-93eabb17d54e@bootlin.com>
To: opensbi@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_024719_476516_6F125D7D 
X-CRM114-Status: GOOD (  14.46  )
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

VGhlIGN1cnJlbnQgc2VsZWN0aW9uIG9mIHRoZSByZWZlcmVuY2UgTVRJTUVSIG1heSBmYWlsIGlu
IHNvbWUgc2V0dXAuCkluIGEgbXVsdGktY2x1c3RlciBjb25maWd1cmF0aW9uLCB0aGVyZSBpcyBv
bmUgTVRJTUVSIHBlciBjbHVzdGVyLCBlYWNoCmFzc29jaWF0ZWQgd2l0aCB0aGUgSEFSVFMgb2Yg
dGhlIGNsdXN0ZXIuIFNvIHdlIGRvIG5vdCBoYXZlIGEgTVRJTUVSCndpdGggbm8gYXNzb2NpYXRl
ZCBIQVJUcyB0byB1c2UgYXMgb3VyIHJlZmVyZW5jZS4KClRvIGJlIGFibGUgdG8gc2VsZWN0IGEg
cmVmZXJlbmNlIE1USU1FUiBpbiB0aGF0IGNhc2UsIGxvb2sgdXAgYW4gb3B0aW9uYWwKZGV2aWNl
IHRyZWUgcHJvcGVydHkgbmFtZWQgInJpc2N2LHJlZmVyZW5jZS1tdGltZXIiIHRoYXQgaW5kaWNh
dGUgd2hpY2gKTVRJTUVSIGlzIHRoZSByZWZlcmVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650
IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Ci0tLQogbGliL3V0aWxzL3RpbWVyL2Zk
dF90aW1lcl9tdGltZXIuYyB8IDE2ICsrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi91dGlscy90
aW1lci9mZHRfdGltZXJfbXRpbWVyLmMgYi9saWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1l
ci5jCmluZGV4IGUxZmQwNTE5Li4xZjI5ZjNhMiAxMDA2NDQKLS0tIGEvbGliL3V0aWxzL3RpbWVy
L2ZkdF90aW1lcl9tdGltZXIuYworKysgYi9saWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1l
ci5jCkBAIC0zOSw2ICszOSw3IEBAIHN0YXRpYyBpbnQgdGltZXJfbXRpbWVyX2NvbGRfaW5pdChj
b25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAogCXN0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEg
Km10OwogCWNvbnN0IHN0cnVjdCB0aW1lcl9tdGltZXJfcXVpcmtzICpxdWlya3MgPSBtYXRjaC0+
ZGF0YTsKIAlib29sIGlzX2NsaW50ID0gcXVpcmtzICYmIHF1aXJrcy0+aXNfY2xpbnQ7CisJYm9v
bCBpc19yZWYgPSBmYWxzZTsKIAogCW10biA9IHNiaV96YWxsb2Moc2l6ZW9mKCptdG4pKTsKIAlp
ZiAoIW10bikKQEAgLTExMCwxMyArMTExLDE2IEBAIHN0YXRpYyBpbnQgdGltZXJfbXRpbWVyX2Nv
bGRfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAogCX0KIAogCS8qCi0JICogU2Vs
ZWN0IGZpcnN0IE1USU1FUiBkZXZpY2Ugd2l0aCBubyBhc3NvY2lhdGVkIEhBUlRzIGFzIG91cgot
CSAqIHJlZmVyZW5jZSBNVElNRVIgZGV2aWNlLiBUaGlzIGlzIG9ubHkgYSB0ZW1wb3Jhcnkgc3Ry
YXRlZ3kKLQkgKiBvZiBzZWxlY3RpbmcgcmVmZXJlbmNlIE1USU1FUiBkZXZpY2UuIEluIGZ1dHVy
ZSwgd2UgbWlnaHQKLQkgKiBkZWZpbmUgYW4gb3B0aW9uYWwgRFQgcHJvcGVydHkgb3Igc29tZSBv
dGhlciBtZWNoYW5pc20gdG8KLQkgKiBoZWxwIHVzIHNlbGVjdCB0aGUgcmVmZXJlbmNlIE1USU1F
UiBkZXZpY2UuCisJICogSWYgd2UgaGF2ZSBhIERUIHByb3BlcnR5IHRvIGluZGljYXRlIHdoaWNo
IE1USU1FUiBpcyB0aGUgcmVmZXJlbmNlLAorCSAqIHNlbGVjdCB0aGUgZmlyc3QgTVRJTUVSIGRl
dmljZSB0aGF0IGhhcyBpdC4gT3RoZXJ3aXNlLCBzZWxlY3QgdGhlCisJICogZmlyc3QgTVRJTUVS
IGRldmljZSB3aXRoIG5vIGFzc29jaWF0ZWQgSEFSVHMgYXMgb3VyIHJlZmVyZW5jZS4KIAkgKi8K
LQlpZiAoIW10LT5oYXJ0X2NvdW50ICYmICFtdF9yZWZlcmVuY2UpIHsKKwlpZiAoZmR0X2dldHBy
b3AoZmR0LCBub2Rlb2ZmLCAicmlzY3YscmVmZXJlbmNlLW10aW1lciIsIE5VTEwpKQorCQlpc19y
ZWYgPSB0cnVlOworCWVsc2UgaWYgKCFtdC0+aGFydF9jb3VudCkKKwkJaXNfcmVmID0gdHJ1ZTsK
KworCWlmIChpc19yZWYgJiYgIW10X3JlZmVyZW5jZSkgewogCQltdF9yZWZlcmVuY2UgPSBtdDsK
IAkJLyoKIAkJICogU2V0IHJlZmVyZW5jZSBmb3IgYWxyZWFkeSBwcm9wYmVkIE1USU1FUiBkZXZp
Y2VzCgotLSAKMi41MS4xCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
