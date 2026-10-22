Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592B606A319
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 02:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qMJzmbfE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=spacemit.com header.i=@spacemit.com header.a=rsa-sha256 header.s=feishu2303021642 header.b=hg3z4ZH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:To:In-Reply-To:Mime-Version:
	Message-Id:Subject:Cc:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmFINDYJjBxLwpvrVWnUQtx9X1IMHdZw3RBzAF63+xs=; b=qMJzmbfE4QDKSg
	T1SRvmuC4rPA2zU0S8ftvjte9J3/rFxKvUR0cKk7hkg6dX63GGBJHzVUjEJs00wt8r+6cX3mYekXu
	/4G9Uyl/bYPTBXiNQFULrbh0ED+QGUJBV9rSzzhUt9QrRXuGX3jdQRs96VMAezFZcOiUgXVliZ1FC
	CGV96kRfyht/464U07DP74plPh2O6fZKqtkfwH6pD2rCsnnvijxvavPuCdrQXd/dC5n8rQGa+KA7X
	WHhbOqlVqN6/NbfAlCtUVHj/stD0gXVV3ETi4XmW5uLfZah8tY07G2tF1glEnaXnBDGn63rwDIPKr
	AT5g2Kb/1/jNVNTVAlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiBY-0000000DB4z-3Tqh;
	Thu, 22 Oct 2026 02:05:40 +0000
Received: from va-2-18.ptr.blmpb.com ([209.127.231.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiBW-0000000DB4c-2GHB
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 02:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1792634731; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=7fRTCNJge1I3UGjLFLVzccVX6JFQ2WxMPJxG/kJIexw=;
 b=hg3z4ZH2sbHyANnxqdxrgx9DVrCRWlScXewcx88Wlpbs6ziiPK7npihJ0fEaz1mbGrI47b
 WPmSpv/PlvUxpqKcpS5g7s4PSpdEDIu4yKDPomBplIe3BVy+R/Iru9ukWpdc+pqs8aQVxw
 8WaVeCdHpJ9jQi7pKsZ1yntwV2/VLb2Ki7fuVr6PijBMlMQJ3bebXbkIqEqPfrcVR451m3
 eH7nI0V0k4Nkn6IQ9IFsWAbQ8zCMlLd5i95yoYQB3GgIha15GkkTbi2thKON7D0KjUV+8R
 zLj5XlGDm92PXKNANPmESRF8ng57uUAs9ZBKAetyrCE8Rh/5K+tNAn21c/XYzg==
References: <20261021094243.2395130-1-liwen.wu@spacemit.com>
X-Original-From: wuliwen <liwen.wu@spacemit.com>
X-Lms-Return-Path: <lba+26ad96f69+a953ab+lists.infradead.org+liwen.wu@spacemit.com>
Cc: "wuliwen" <liwen.wu@spacemit.com>
Subject: [PATCH v2] include: mailbox: correct RPMI CPPC request field ordering
Message-Id: <20261022020525.1503945-1-liwen.wu@spacemit.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Received: from snode5.. ([120.237.158.181]) by smtp.feishu.cn with ESMTPS; Thu, 22 Oct 2026 10:05:28 +0800
In-Reply-To: <20261021094243.2395130-1-liwen.wu@spacemit.com>
To: <opensbi@lists.infradead.org>
From: "wuliwen" <liwen.wu@spacemit.com>
Date: Thu, 22 Oct 2026 10:05:25 +0800
X-Mailer: git-send-email 2.34.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_190538_842100_A7B388DA 
X-CRM114-Status: GOOD (  11.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UGVyIHRoZSBSUE1JIHNwZWNpZmljYXRpb24sIENQUENfUFJPQkVfUkVHLCBDUFBDX1JFQURfUkVH
LCBhbmQKQ1BQQ19XUklURV9SRUcgcmVxdWlyZSBSRUdfSUQgaW4gd29yZCAwIGFuZCBIQVJUX0lE
IGluIHdvcmQgMS4KClRoZSBjdXJyZW50IHJlcXVlc3Qgc3RydWN0dXJlcyBoYXZlIHRoZXNlIGZp
ZWxkcyBzd2FwcGVkLCBjYXVzaW5nCmluY29tcGF0aWJpbGl0eSB3aXRoIHNwZWMtY29tcGxpYW50
IFJQTUkgc2VydmVycy4KClN3YXAgdGhlIGZpZWxkcyB0byBtYXRjaCB0aGUgc3BlY2lmaWNhdGlv
biBhbmQgcmVvcmRlciB0aGUKY29ycmVzcG9uZGluZyBmaWVsZCBhc3NpZ25tZW50cyBpbiBsaWIg
Zm9yIGNvbnNpc3RlbmN5LgoKU2lnbmVkLW9mZi1ieTogd3VsaXdlbiA8bGl3ZW4ud3VAc3BhY2Vt
aXQuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBBbGlnbiB0aGUgY29ycmVzcG9uZGluZyBmaWVs
ZCBhc3NpZ25tZW50cyBpbiBsaWIgZm9yIGNvbnNpc3RlbmN5LgoKIGluY2x1ZGUvc2JpX3V0aWxz
L21haWxib3gvcnBtaV9tc2dwcm90LmggfCA2ICsrKy0tLQogbGliL3V0aWxzL2NwcGMvZmR0X2Nw
cGNfcnBtaS5jICAgICAgICAgICB8IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaV91dGlscy9t
YWlsYm94L3JwbWlfbXNncHJvdC5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21z
Z3Byb3QuaAppbmRleCA3YWU0YWJlMC4uNDhmNmFjNjEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc2Jp
X3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmgKKysrIGIvaW5jbHVkZS9zYmlfdXRpbHMvbWFp
bGJveC9ycG1pX21zZ3Byb3QuaApAQCAtNTM5LDggKzUzOSw4IEBAIGVudW0gcnBtaV9jcHBjX3Nl
cnZpY2VfaWQgewogfTsKIAogc3RydWN0IHJwbWlfY3BwY19wcm9iZV9yZXEgewotCXUzMiBoYXJ0
X2lkOwogCXUzMiByZWdfaWQ7CisJdTMyIGhhcnRfaWQ7CiB9OwogCiBzdHJ1Y3QgcnBtaV9jcHBj
X3Byb2JlX3Jlc3AgewpAQCAtNTQ5LDggKzU0OSw4IEBAIHN0cnVjdCBycG1pX2NwcGNfcHJvYmVf
cmVzcCB7CiB9OwogCiBzdHJ1Y3QgcnBtaV9jcHBjX3JlYWRfcmVnX3JlcSB7Ci0JdTMyIGhhcnRf
aWQ7CiAJdTMyIHJlZ19pZDsKKwl1MzIgaGFydF9pZDsKIH07CiAKIHN0cnVjdCBycG1pX2NwcGNf
cmVhZF9yZWdfcmVzcCB7CkBAIC01NjAsOCArNTYwLDggQEAgc3RydWN0IHJwbWlfY3BwY19yZWFk
X3JlZ19yZXNwIHsKIH07CiAKIHN0cnVjdCBycG1pX2NwcGNfd3JpdGVfcmVnX3JlcSB7Ci0JdTMy
IGhhcnRfaWQ7CiAJdTMyIHJlZ19pZDsKKwl1MzIgaGFydF9pZDsKIAl1MzIgZGF0YV9sbzsKIAl1
MzIgZGF0YV9oaTsKIH07CmRpZmYgLS1naXQgYS9saWIvdXRpbHMvY3BwYy9mZHRfY3BwY19ycG1p
LmMgYi9saWIvdXRpbHMvY3BwYy9mZHRfY3BwY19ycG1pLmMKaW5kZXggMTVjODkzNTEuLmVmNjll
YzE3IDEwMDY0NAotLS0gYS9saWIvdXRpbHMvY3BwYy9mZHRfY3BwY19ycG1pLmMKKysrIGIvbGli
L3V0aWxzL2NwcGMvZmR0X2NwcGNfcnBtaS5jCkBAIC0xMTYsOCArMTE2LDggQEAgc3RhdGljIGlu
dCBycG1pX2NwcGNfcmVhZCh1bnNpZ25lZCBsb25nIHJlZywgdTY0ICp2YWwpCiAJc3RydWN0IHJw
bWlfY3BwY19yZWFkX3JlZ19yZXNwIHJlc3A7CiAJc3RydWN0IHJwbWlfY3BwYyAqY3BwYzsKIAot
CXJlcS5oYXJ0X2lkID0gY3VycmVudF9oYXJ0aWQoKTsKIAlyZXEucmVnX2lkID0gcmVnOworCXJl
cS5oYXJ0X2lkID0gY3VycmVudF9oYXJ0aWQoKTsKIAljcHBjID0gcnBtaV9jcHBjX2dldF9wb2lu
dGVyKHJlcS5oYXJ0X2lkKTsKIAogCWlmICgocmVnID09IFNCSV9DUFBDX0RFTElWRVJFRF9DVFIp
ICYmIGNwcGMtPmZjX3N1cHBvcnRlZCkgewpAQCAtMTcwLDggKzE3MCw4IEBAIHN0YXRpYyBpbnQg
cnBtaV9jcHBjX3dyaXRlKHVuc2lnbmVkIGxvbmcgcmVnLCB1NjQgdmFsKQogCXN0cnVjdCBycG1p
X2NwcGMgKmNwcGMgPSBycG1pX2NwcGNfZ2V0X3BvaW50ZXIoaGFydF9pZCk7CiAKIAlpZiAocmVn
ICE9IFNCSV9DUFBDX0RFU0lSRURfUEVSRiB8fCAhY3BwYy0+ZmNfc3VwcG9ydGVkKSB7Ci0JCXJl
cS5oYXJ0X2lkID0gaGFydF9pZDsKIAkJcmVxLnJlZ19pZCA9IHJlZzsKKwkJcmVxLmhhcnRfaWQg
PSBoYXJ0X2lkOwogCQlyZXEuZGF0YV9sbyA9IHZhbCAmIDB4RkZGRkZGRkY7CiAJCXJlcS5kYXRh
X2hpID0gdmFsID4+IDMyOwogCkBAIC0xOTcsOCArMTk3LDggQEAgc3RhdGljIGludCBycG1pX2Nw
cGNfcHJvYmUodW5zaWduZWQgbG9uZyByZWcpCiAJc3RydWN0IHJwbWlfY3BwY19wcm9iZV9yZXNw
IHJlc3A7CiAJc3RydWN0IHJwbWlfY3BwY19wcm9iZV9yZXEgcmVxOwogCi0JcmVxLmhhcnRfaWQg
PSBjdXJyZW50X2hhcnRpZCgpOwogCXJlcS5yZWdfaWQgPSByZWc7CisJcmVxLmhhcnRfaWQgPSBj
dXJyZW50X2hhcnRpZCgpOwogCiAJY3BwYyA9IHJwbWlfY3BwY19nZXRfcG9pbnRlcihyZXEuaGFy
dF9pZCk7CiAJaWYgKCFjcHBjKQotLSAKMi4zNC4xCgpUaGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRh
Y2htZW50IGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBiZSBwcml2aWxlZ2VkIG9yIG90aGVyd2lz
ZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCBy
ZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2UgZGVsZXRlIGl0IGFuZCBhbnkgYXR0YWNo
bWVudCBmcm9tIHlvdXIgc3lzdGVtIGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBi
eSByZXBseSBlLW1haWwuIFVuaW50ZW5kZWQgcmVjaXBpZW50cyBzaG91bGQgbm90IHVzZSwgY29w
eSwgZGlzY2xvc2Ugb3IgdGFrZSBhbnkgYWN0aW9uIGJhc2VkIG9uIHRoaXMgbWVzc2FnZSBvciBh
bnkgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZS4gRW1haWxzIGNhbm5vdCBi
ZSBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvciBmcmVlIGFzIHRoZXkgY2FuIGJlIGlu
dGVyY2VwdGVkLCBhbWVuZGVkLCBsb3N0IG9yIGRlc3Ryb3llZCwgYW5kIHlvdSBzaG91bGQgdGFr
ZSBmdWxsIHJlc3BvbnNpYmlsaXR5IGZvciBzZWN1cml0eSBjaGVja2luZy4gCiAK5pys6YKu5Lu2
5Y+K5YW25Lu75L2V6ZmE5Lu25YW35pyJ5L+d5a+G5oCn6LSo77yM5bm25Y+v6IO95Y+X5YW25LuW
5L+d5oqk5oiW5LiN5YWB6K646KKr5oqr6Zyy57uZ56ys5LiJ5pa544CC5aaC6ZiB5LiL6K+v5pS2
5Yiw5pys6YKu5Lu277yM5pWs6K+356uL5Y2z5Lul5Zue5aSN55S15a2Q6YKu5Lu255qE5pa55byP
6YCa55+l5Y+R5Lu25Lq677yM5bm25bCG5pys6YKu5Lu25Y+K5YW25Lu75L2V6ZmE5Lu25LuO6ZiB
5LiL57O757uf5Lit5LqI5Lul5Yig6Zmk44CC5aaC6ZiB5LiL5bm26Z2e5pys6YKu5Lu25YaZ5piO
5LmL5pS25Lu25Lq677yM5pWs6K+35YiH5Yu/5L2/55So44CB5aSN5Yi244CB5oqr6Zyy5pys6YKu
5Lu25oiW5YW25Lu75L2V5YaF5a6577yM5Lqm6K+35YiH5Yu/5L6d5pys6YKu5Lu25oiW5YW25Lu7
5L2V5YaF5a656ICM6YeH5Y+W5Lu75L2V6KGM5Yqo44CC55S15a2Q6YKu5Lu25peg5rOV5L+d6K+B
5piv5LiA56eN5a6J5YWo5ZKM5LiN5Lya5Ye6546w5Lu75L2V5beu6ZSZ55qE6YCa5L+h5pa55byP
77yM5Y+v6IO95Lya6KKr5oum5oiq44CB5L+u5pS544CB5Lii5aSx5oiW5o2f5Z2P77yM5pS25Lu2
5Lq66ZyA6Ieq6KGM6LSf6LSj5YGa5aW95a6J5YWo5qOA5p+l44CCCgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
