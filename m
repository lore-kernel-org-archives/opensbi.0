Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8049BCAC5B0
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 02:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5C7mYQV63Yl1+WejIoFweYqaLx16HejfiXV1O00xjXE=; b=srOM84Ny/7qxkE
	3SOSAP2xw/r/yCLyDFnFtnYX9Ya3G2iC/vzPx07Vrwxh9cMMOKW/dj9J/z33Sxw2V8seJodfA0HJN
	M2YdH81B2SkHys5Li1NswUwXImQ/7TkKYMLvDR7uvh498+lDCjzvoILzi/GZZNNOKL/O/LIb8AT04
	6hXWXnNJB8wZ9IVfakUAEphLDrAKA0oNEkW2tkSG95Z4T3VsNcaKZbVAPqguZkb85CZ/eA+aqfHwv
	/IULwj2xkb789WvpZOE2IPvqy2KhiD+xyG/Gnd7oZqGt23KbvdjTbQutAuFDhoeyT4+Dz/GHxvwMC
	UjE0fXanL2Q0xOibx/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q61-00000003tg6-1uOx;
	Tue, 30 Sep 2025 02:28:05 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Q5q-00000003tJd-2Uas
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 02:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tQ
	P3xGVmXuEgdxR5tgExf6LalPSeal7bc+sT6DeXJ/Q=; b=i3QvCsPUCAPkQlFvt2
	vo7SgtRZ/gWhhAuzq9eNJQkyTHLL5PxapL0s+YgvjIY4gQOacXqOx/ne4et6xHFu
	c4jck7u+LKdTfKdSVpcZBZdEBX0Yv7zlpUtVq87cAD0BhDjPxlmllJTIpWUqE3eu
	WDF13D573UzGniCbmS8RvcHfI=
Received: from T490.lan (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgD3n1YaQNtodJjZAA--.32420S2;
	Tue, 30 Sep 2025 10:27:39 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Xiang W <wxjstz@126.com>
Subject: [PATCH] lib: sbi: Detect support of entropy source
Date: Tue, 30 Sep 2025 10:26:45 +0800
Message-ID: <20250930022728.887069-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: PikvCgD3n1YaQNtodJjZAA--.32420S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4kCw1rXw4kGw1xCryxuFg_yoW8GF1kpF
	Z0kFyDGr1093W7J3sxJrn5JF4fJw4I9as3J39ru3sYk3W7A3WxXrs8Wa1Yvw17WayrZw4S
	9Fn2yw1xua4UWFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEoUDgUUUUU=
X-Originating-IP: [2408:823c:b211:203d:21b2:35cf:5da4:828c]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xPYOmjbJyHQJwABsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_192755_091924_DD4732BB 
X-CRM114-Status: UNSURE (   7.60  )
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

Detect if entropy source, Zkr extension, is supported
by the HART.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/riscv_encoding.h |  3 +++
 lib/sbi/sbi_hart.c           | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 40a854e3..8ca607c0 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -261,6 +261,9 @@
 #define CSR_FRM				0x002
 #define CSR_FCSR			0x003
 
+/* User entropy source */
+#define CSR_SEED			0x015
+
 /* User Counters/Timers */
 #define CSR_CYCLE			0xc00
 #define CSR_TIME			0xc01
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 1b50f671..ee655375 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -983,6 +983,20 @@ __pmp_skip:
 
 #undef __check_ext_csr
 
+#define __check_ext_csr_w(__base_priv, __csr, __val, __ext)		\
+	if (hfeatures->priv_version >= __base_priv) {			\
+		csr_write_allowed(__csr, &trap, __val);			\
+		if (!trap.cause)					\
+			__sbi_hart_update_extension(hfeatures,		\
+						    __ext, true);	\
+	}
+
+	/* Detect if hart supports Zkr (entropy source) */
+	__check_ext_csr_w(SBI_HART_PRIV_VER_UNKNOWN,
+			CSR_SEED, 0, SBI_HART_EXT_ZKR);
+
+#undef __check_ext_csr_w
+
 #define __check_csr_existence(__csr, __csr_id)				\
 	csr_read_allowed(__csr, &trap);					\
 	if (!trap.cause)						\
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
