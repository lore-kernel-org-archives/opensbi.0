Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3574CCD187
	for <opensbi@archiver.kernel.org>; Thu,  9 Oct 2025 15:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/4HAR4PHWuQ1mlnAhL9H04tkQl4gslZRUcmUcmBPJM=; b=SfsGXVmVbb0N1d
	T0YRxdk1/UrB247VAd3SfTuJxUiPdmfpMeUbyua3Jdk55WR/yOQmyv01ihgogURFaPlZ+s0T9SDwW
	0zjImq1xi2ln89Pt8O5YvCIv555XZEX+6rHxFprYXNDtnw5oz/G6hT4jXziDuEfRDn1l4UbKKZpmx
	Ir08di16bjKja+hFWmjZ1vo4yNbFLY+sw0lk/eIgCvFZbj4VdnE2xyHloWKvnOTR/09j44RKs4tPc
	VumKdJ5h0mer/vkp7eqYoNWWmCP8NaoakbyvHTWk+ceG0w/snGcxp28B/H+j4iRIuZEUtUBCdO1Cz
	JliDzZFPi6ucDglpimAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sHa-00000006RaU-3ck9;
	Thu, 09 Oct 2025 15:10:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sHV-00000006RYj-47rS
	for opensbi@lists.infradead.org;
	Thu, 09 Oct 2025 15:10:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BC381A1244;
	Thu,  9 Oct 2025 15:10:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 022BF6062C;
	Thu,  9 Oct 2025 15:10:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 407C4102F21E8;
	Thu,  9 Oct 2025 17:10:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760022609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xZuuJarUc5sR4uBWhRwwq8qKyUYxjbWo6foVa2etXf0=;
	b=cJ2agjEJcUz8Ndob7wJdHKRaCW7+b1AqN6fE7sG9lzbvGhT1J2Q15MxLfkpBQSZUiOGESF
	oQ+EI+cu26H82u//XBaYnxDJFBJDR9wnTRL1PfFhz0fJ0HX3TLSsDvnm1rrineFwvjjcTj
	goh07EBdgzSRauKN7aD9dQHec9BRPj+nKPKqf8K2Vc3zHhHXBHHFsKgItwPS22WLyTBX34
	FAF+EiowetpXeD7Zg+0xKpZnRL/Ol1GNpWnx6JsemT9RKLKOVMwh6CG5BFUYIFzOacjD0M
	AKL+qJSvveD/DuLqcFVcqJXdNhXmmw/kyvx10neFuTr6yG3gJ3rRGHDqM9aPTw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 09 Oct 2025 17:09:39 +0200
Subject: [PATCH 1/2] lib: utils/ipi: mswi: add MIPS P8700 compatible
MIME-Version: 1.0
Message-Id: <20251009-p8700-aclint-v1-1-18322c64f968@bootlin.com>
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
X-CRM114-CacheID: sfid-20251009_081014_151646_9A238D52 
X-CRM114-Status: UNSURE (   6.71  )
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
dC1tc3dpIiB9LAogCXsgfSwKIH07CgotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
