Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827FACCF9E5
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUoD40opFkL+FB4vUZ8s3g3YGwJM8HdOJ0RJgKKpe4U=; b=ijlGAL0SvEYcEc
	9Qp9qBJ1ZmdULgn4AJeE6Yk1AFcb7hIEDykorxtVn04Q0SJx77fi7GEavzg0TJVCN/B97kHw4a8I0
	niMmqI5PeH1YwM1q9u+qwYAsZxQTryRjxb1m4WNE+bH8eu3Di8BBri2z8o3ptINQqH6V4h+hS3cWt
	+W69QoL+hMYYN0WZO4ZykvotMMMmEEl3L05PramVqIARWedFUDJjjwkaXuDX99shj4I8FDv6CnuEd
	KYwHYbnYXmTJQo2pKCNt7jgnWvnxEhlIpeytv+UojOwqPKu+OaVVZ68ChsP7dOOfWDN1dqbJEVbOo
	FPD+fACtBlsg/Fu10n9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN1j-0000000DzWo-0RtN;
	Mon, 27 Oct 2025 13:12:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDN1g-0000000DzVL-0KVl
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 13:12:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C76584E41369;
	Mon, 27 Oct 2025 13:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F6106062C;
	Mon, 27 Oct 2025 13:12:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5A6F102F2500;
	Mon, 27 Oct 2025 14:12:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761570759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eAH38oHvZ3AW56/8tUGbliPXd83XFk4CV3j6bx1kUok=;
	b=c98brw69m8lUJFs8RHHK2171cerQMC3VsSxuZhygulfuFBXSRYm5Tzw6IcmqsygWZL8q9K
	iEsKpbyBm57XxgoL1h3hi6GeVjenw059xPRMZTF1rIbOCDgh/myFWk3kFGVM0W8nTsKNua
	F47CZtg8wm1dboiCVCuTOVkW5bv8Qcspm4vAKFl1AMyQOiFjhNDfRo1YTYorrG7wI0Zk5y
	H8Q/k+s5inMSe4k8Q4YFizi2LyVMBkJAect/V/CP/hOYtFNhF91SXSmftFn75CQr1XXlXz
	isiVAPJRhR3JDj+tiaqzucGMwo9iH2ne1oevMdJBTI1Qq8zEfE7OG0tDBxUQ7g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 27 Oct 2025 14:12:17 +0100
Subject: [PATCH v2 1/2] lib: utils/ipi: mswi: add MIPS P8700 compatible
MIME-Version: 1.0
Message-Id: <20251027-p8700-aclint-v2-1-f10cbfb66e92@bootlin.com>
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
X-CRM114-CacheID: sfid-20251027_061244_247611_32CB95D5 
X-CRM114-Status: UNSURE (   7.79  )
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

VGhlIE1TV0kgcHJlc2VudCBpbiB0aGUgTUlQUyBQODcwMCBpcyBjb21wbGlhbnQgd2l0aCB0aGUg
QUNMSU5UCnNwZWNpZmljYXRpb24sIHNvIGFkZCBhIGRlZGljYXRlZCBjb21wYXRpYmxlIHN0cmlu
ZyBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9v
dGxpbi5jb20+Ci0tLQogbGliL3V0aWxzL2lwaS9mZHRfaXBpX21zd2kuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2lwaS9mZHRf
aXBpX21zd2kuYyBiL2xpYi91dGlscy9pcGkvZmR0X2lwaV9tc3dpLmMKaW5kZXggMjBmNmZiYy4u
NmQ4ZjZiZiAxMDA2NDQKLS0tIGEvbGliL3V0aWxzL2lwaS9mZHRfaXBpX21zd2kuYworKysgYi9s
aWIvdXRpbHMvaXBpL2ZkdF9pcGlfbXN3aS5jCkBAIC01Nyw2ICs1Nyw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmR0X21hdGNoIGlwaV9tc3dpX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9
ICJzaWZpdmUsY2xpbnQwIiwgLmRhdGEgPSAmY2xpbnRfb2Zmc2V0IH0sCiAJeyAuY29tcGF0aWJs
ZSA9ICJ0aGVhZCxjOTAwLWNsaW50IiwgLmRhdGEgPSAmY2xpbnRfb2Zmc2V0IH0sCiAJeyAuY29t
cGF0aWJsZSA9ICJ0aGVhZCxjOTAwLWFjbGludC1tc3dpIiB9LAorCXsgLmNvbXBhdGlibGUgPSAi
bWlwcyxwODcwMC1hY2xpbnQtbXN3aSIgfSwKIAl7IC5jb21wYXRpYmxlID0gInJpc2N2LGFjbGlu
dC1tc3dpIiB9LAogCXsgfSwKIH07CgotLSAKMi41MS4xCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
