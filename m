Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AECCD8CA8
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tD+vp6lAFzGVBDLOIXYang0RKoBDYSlSMhKFBoNCTdE=; b=a1n5TOCJRfDPcy
	6wNRjtk0p3zlnoSjWFUP4iPT8pHzs+GhbsWM8tervLYCHDbGh8JN+owQbe9nhsq7KLqZ6hsUiPkKo
	BejYHckYwsTFTSvE9BtiEHXDV5g2ag2dl7OAno7bUavy4faomx63PP3QjJSNNty+T5oKwJIquGG3J
	TQY8CG4Zwb/QrMqZCNRCutyazSG0CZ+Gxui91yk8rHWMwrp6fhk0Uk3iw+fOUBB+d1Gop1K0VSU1u
	FQZR6IUOrl+zzttIPbzcFNmA0NddZwgrRv0v2wasIEfpnFYD1+Q6NtGFZrrc2hJqP6J7Q9hMdUq39
	HkiMQC6V9sF7VQnvzT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0R0-0000000ApAd-33jp;
	Fri, 12 Jun 2026 11:52:26 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY0Qx-0000000ApA7-20zu
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 11:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781265139; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=qiVYrhsx+ihizurxGkV2X25MCJhedeOQD+rAF/mWoCs=;
	b=Gmx53YimEhCDsuCNZ9byEgke+TwXvVzyriO5TvRlivJA+J/n++1K/ODvyK/3XhgetvCK5s7Py4QX8YX2xfoR00Zt6MqqzQSNZIYAJrajdNn64TDOKBq+codj2oP6ib66b67w4GMlR6ovG4oMjyyM5msCutMpC9prxW/Lq6NPb8c=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0X4iaeQ0_1781265131;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X4iaeQ0_1781265131 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 12 Jun 2026 19:52:15 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] lib: sbi_ipi: Validate hartids against domain, not HSM state
Date: Fri, 12 Jun 2026 19:52:07 +0800
Message-ID: <20260612115208.118132-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_045224_366637_9BB7D994 
X-CRM114-Status: UNSURE (   9.99  )
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

Q29tbWl0IDM3ZWFjYTRhYjMzZCAoImxpYjogc2JpX2lwaTogUmV0dXJuIGVycm9yIGZvciBpbnZh
bGlkIGhhcnRpZHMiKQphZGRlZCBhIHdlaWdodCBjaGVjayBhZ2FpbnN0IHRoZSBIU00taW50ZXJy
dXB0aWJsZSBtYXNrLCB3aGljaCBleGNsdWRlcwpoYXJ0cyBpbiBTVE9QUEVEIHN0YXRlLiBUaGlz
IGNhdXNlcyBzYmlfaXBpX3NlbmRfbWFueSgpIHRvIHJldHVybgpTQklfRUlOVkFMIHdoZW4gdGhl
IGtlcm5lbCBzZW5kcyBhIHJlbW90ZSBmZW5jZSAoZS5nLiBUTEIgc2hvb3Rkb3duKQp3aG9zZSBo
bWFzayBpbmNsdWRlcyBhIGhhcnQgdGhhdCB3YXMgc3RvcHBlZCBieSBDUFUgaG90cGx1ZzoKCiAg
X19zYmlfcmZlbmNlX3YwMl9jYWxsOiBoYmFzZSA9IFswXSBobWFzayA9IFsweDNdIGZhaWxlZCAo
ZXJyb3IgWy0yMl0pCgpWYWxpZGF0ZSByZXF1ZXN0ZWQgaGFydGlkcyBhZ2FpbnN0IHRoZSBkb21h
aW4ncyBhc3NpZ25lZCBoYXJ0bWFzawppbnN0ZWFkLiBUaGlzIHN0aWxsIHJlamVjdHMgdHJ1bHkg
aW52YWxpZCBvciBjcm9zcy1kb21haW4gaGFydGlkcywgYnV0CmFsbG93cyBIU00tU1RPUFBFRCBo
YXJ0cyB0byBiZSBzaWxlbnRseSBza2lwcGVkIOKAlCB3aGljaCBpcyBzYWZlIGJlY2F1c2UKYSBz
dG9wcGVkIGhhcnQgd2lsbCBkbyBhIGZ1bGwgbG9jYWwgVExCIGZsdXNoIG9uIGl0cyBuZXh0IEhT
TSBzdGFydApiZWZvcmUgcmUtZW50ZXJpbmcgUy1tb2RlLgoKRml4ZXM6IDM3ZWFjYTRhYjMzZCAo
ImxpYjogc2JpX2lwaTogUmV0dXJuIGVycm9yIGZvciBpbnZhbGlkIGhhcnRpZHMiKQpTaWduZWQt
b2ZmLWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgotLS0KIGxpYi9zYmkv
c2JpX2lwaS5jIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaXBpLmMgYi9saWIv
c2JpL3NiaV9pcGkuYwppbmRleCA1YjJkMmY3Mi4uYjA0YTU4NzcgMTAwNjQ0Ci0tLSBhL2xpYi9z
Ymkvc2JpX2lwaS5jCisrKyBiL2xpYi9zYmkvc2JpX2lwaS5jCkBAIC0xMzYsNiArMTM2LDcgQEAg
aW50IHNiaV9pcGlfc2VuZF9tYW55KHVsb25nIGhtYXNrLCB1bG9uZyBoYmFzZSwgdTMyIGV2ZW50
LCB2b2lkICpkYXRhKQogCiAJaWYgKGhiYXNlICE9IC0xVUwpIHsKIAkJc3RydWN0IHNiaV9oYXJ0
bWFzayB0bXBfbWFzayA9IHsgMCB9OworCQlzdHJ1Y3Qgc2JpX2hhcnRtYXNrIGRvbWFpbl9tYXNr
OwogCQlpbnQgY291bnQgPSBzYmlfcG9wY291bnQoaG1hc2spOwogCiAJCWZvciAoaSA9IGhiYXNl
OyBobWFzazsgaSsrLCBobWFzayA+Pj0gMSkgewpAQCAtMTQzLDEwICsxNDQsMTYgQEAgaW50IHNi
aV9pcGlfc2VuZF9tYW55KHVsb25nIGhtYXNrLCB1bG9uZyBoYmFzZSwgdTMyIGV2ZW50LCB2b2lk
ICpkYXRhKQogCQkJCXNiaV9oYXJ0bWFza19zZXRfaGFydGlkKGksICZ0bXBfbWFzayk7CiAJCX0K
IAotCQlzYmlfaGFydG1hc2tfYW5kKCZ0YXJnZXRfbWFzaywgJnRhcmdldF9tYXNrLCAmdG1wX21h
c2spOworCQkvKiBWYWxpZGF0ZSBoYXJ0aWRzIGFnYWluc3QgZG9tYWluIGFzc2lnbm1lbnQsIG5v
dCBIU00gc3RhdGUgKi8KKwkJcmMgPSBzYmlfZG9tYWluX2dldF9hc3NpZ25lZF9oYXJ0bWFzayhk
b20sICZkb21haW5fbWFzayk7CisJCWlmIChyYykKKwkJCXJldHVybiByYzsKIAotCQlpZiAoc2Jp
X2hhcnRtYXNrX3dlaWdodCgmdGFyZ2V0X21hc2spICE9IGNvdW50KQorCQlzYmlfaGFydG1hc2tf
YW5kKCZkb21haW5fbWFzaywgJmRvbWFpbl9tYXNrLCAmdG1wX21hc2spOworCQlpZiAoc2JpX2hh
cnRtYXNrX3dlaWdodCgmZG9tYWluX21hc2spICE9IGNvdW50KQogCQkJcmV0dXJuIFNCSV9FSU5W
QUw7CisKKwkJc2JpX2hhcnRtYXNrX2FuZCgmdGFyZ2V0X21hc2ssICZ0YXJnZXRfbWFzaywgJnRt
cF9tYXNrKTsKIAl9CiAKIAkvKiBTZW5kIElQSXMgKi8KLS0gCjIuNTAuMQoKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
