Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5D6CEACD6
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mMY7K59FsZHIlCXJnSNK5H7Ml4i2A4bJtxqEd/8kdI=; b=pddUBzKYFBkWAh
	mZ21eh77Sk/dn3eVNan2mUmCL5xpLG5mYb5j5h9srU9ILqRp7fChMGfU7XG+kvfiKWYei1M2eQX7h
	bCk6yC7oeTsQMNwfawOUogEZAn1BsnCQci8hn2syG5lNPS817GhhTy9rx3gGG3uiQnwq1JwNPACPk
	kkQwjxafV9et0nOCjWFXsLLayNkrxz9uJq9DsIrYDDjGXDldRrYMPJ2nqQy6WnQJohZHnRkcutesQ
	7Zvx2p73qIP0BZVNEAcjBwseDvgD6mUokzPXr+g6KTuiLa2X5/gV+qFmjYJJGQ8i1kVtdWDxs0cc4
	GRVxcrcniCSQS6KHObWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZP-0000000D5hB-3XeZ;
	Fri, 14 Nov 2025 20:38:59 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZM-0000000D5ep-1qNd
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 20:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1763152734; x=1763757534; i=b.freisen@gmx.net;
	bh=E4IxYSfBxRQv30Ahu5EHHe2H3STr4ZnfmDpKPijdto8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=N7FFrvqiMv4r1tNKSP1aODR3L8WduiHGh/vIsloDI8bAqPjyLxdbEt6aF3yCt7MM
	 +Vq9yOMmRvc8Z2YbdxpeBwhKepgefeTreqSTdtYygU7q6yTiny1xOt3kTOk99GUnD
	 dXMF+Sa0H+8eha6DCU5Hk71PWW6VbqolkHk900FY4BQy1GP4DrcHjsfgMZc41Dm/E
	 aIfJxcOSkI6eIAGz78uLm9/Nh3CLiDkv0v27EWu8xGh+Y1ylx7dNEPRpSkc9i/YWo
	 rPF1XIY7aRIzu1TIxMrxD0YieNivenEOq2OjZlu9k858ZRc5UxmIrY97gKKdEKFPU
	 Aa9Q5fl9CRoLPW07Qg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.138]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1vjxPw2YvS-00Kyld; Fri, 14
 Nov 2025 21:38:54 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v2 2/7] Makefile: sensible default value for OPENSBI_CC_XLEN.
Date: Fri, 14 Nov 2025 21:38:37 +0100
Message-ID: <20251114203842.13396-3-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
References: <20251114203842.13396-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1iZbC/mTJStj/A4khZ+aAgmxI1fKCf+gfjoTZqn99YmWMc5I3ab
 D/gRqyNMBjntTRhiVEcKQS79BxXa/2k1fmgVP4kUdXtSs6MRIu922r+XqsR+5h/UVqkRv7Q
 Tm8MeN3Vo18z+wI4Yzy9PI29uY0GvP0FL4selmBeKZTKtBks3suJmkrIQKfPZHJBCUO19xB
 4LEAgPMWRfB9gINvfaNig==
UI-OutboundReport: notjunk:1;M01:P0:RYf9Du26RZI=;LWZceF0R38f//WzU9EMTADeaf7q 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 hdQYVr0dScqxIY9l5p5k2Sxkax1s8Ysz4O0Yn3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_123856_760072_32B9748A 
X-CRM114-Status: UNSURE (   6.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

If guessing the compiler's XLEN fails, use 64 rather than garbage.
The previous behavior could silently break e.g. OPENSBI_CC_SUPPORT_VECTOR
when cross-compiling with a system's native clang.

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 398eabe..afcc544 100644
--- a/Makefile
+++ b/Makefile
@@ -151,6 +151,12 @@ endif
 
 # Guess the compiler's XLEN
 OPENSBI_CC_XLEN := $(shell TMP=`$(CC) $(CLANG_TARGET) -dumpmachine | sed 's/riscv\([0-9][0-9]\).*/\1/'`; echo $${TMP})
+# If guessing XLEN fails, default to 64
+ifneq ($(OPENSBI_CC_XLEN),32)
+  ifneq ($(OPENSBI_CC_XLEN),64)
+    OPENSBI_CC_XLEN = 64
+  endif
+endif
 
 # Guess the compiler's ABI and ISA
 ifneq ($(CC_IS_CLANG),y)
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
