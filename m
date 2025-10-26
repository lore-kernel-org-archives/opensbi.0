Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0F4CCF9E9
	for <opensbi@archiver.kernel.org>; Sun, 26 Oct 2025 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19N/FJFr5YCMeh5fTcplbY3sqkBWNm+NfMpTxx1szy4=; b=qdmer6wpt/P7qW
	aHGqEfVWOm7kSq4d8iRuKR41ipWF99VKbmQ5Y+GSCCGp2Cp6IvJO/w5am0Xz3cnbDy+29xgoztt+h
	rILmcLQjkEHGmxhv1wD8Gi0tQ94VIzv3x8QLzxmAQ/6uuXmWWRKzumqtnS1Krv9RtSYpTUE0rcE9i
	nr7WUXFFmRb2ce1B/8bPC2P6QyTtHK9KggKcPQuoN2q/e5q8bMLU63zvpNM8SW1n2Xlf1iw2u8BfI
	Bc6T3s8H0oxjea7ngrK/6ekZZX+WElY4/BMfONGT8VmVcJl2idLA+0v1fptAFNFmPD23VxJVbIbvD
	NoC5S6YDLIPwvspm13TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I5-0000000CiX2-1nYp;
	Sun, 26 Oct 2025 20:24:37 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I2-0000000CiVX-402U
	for opensbi@lists.infradead.org;
	Sun, 26 Oct 2025 20:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761510271; x=1762115071; i=b.freisen@gmx.net;
	bh=T8058ZsFqepTHS4rkr3Ci+4xU62UREjhzwU3YTNxpQU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VYjPl/nW8FtoIsBpCSSm30KocB7FH8wc2Zx9te0jRvrz4JSZ8/8ECuPUCVXH5dQ6
	 LzUh42gvyA4ODvddW/vXA9is4n4ZulguDIOKSRzsAejsF2d86WxwZQP5fD3JmDJj6
	 mItm4rqplaKWINtW0ke3/ggHfyMDkjvPdr2rjZ/aLTdeKGWpc01f/glCAdY4iLZ61
	 84+N9oTb9hR2SvzXSRytEVciPzUk7Rm+l+LdLe8pbCt5zeLtWMXf1ibbJv9o3I8Zy
	 wqJ/mFVkGku2fPCwCUyKzgAnz0lhEUryKSq86Z9O8RCHxZ1ZeqXIo0dbCK+C0HLm/
	 DPqavaJoQI0KYBHi7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUnp-1uFx3O1S1p-00yeaj; Sun, 26
 Oct 2025 21:24:31 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH 1/5] include: sbi: Fix tab alignment.
Date: Sun, 26 Oct 2025 21:21:55 +0100
Message-ID: <20251026202416.23550-2-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026202416.23550-1-b.freisen@gmx.net>
References: <20251026202416.23550-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uZQW3sIFrXQ2CwE3JnsMXU/7YUfi+/NmEIUpqXpdyySyK/wOOK6
 pOz8FEdpSt4qxvPI2XcLImI526dGkRVBxykI/4JTpBmjkE/JRJPmW93ER02S5d40gBtBKt2
 R2AKSClOahAilevivcO3fes4WL4/mX29YlmJN1y+a3ObuPSUMjkXLd/F0gn6QmTC4Kx6rre
 80zDgbr26+3k3emq0uS4w==
UI-OutboundReport: notjunk:1;M01:P0:XgZVkA6a63E=;Faxn/1jtJBPIyqBP6d4NJA0gNb0 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 aJ8pkb8lwgPONJCkJjsjvOHhzJMv/Bu2rgk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_132435_274538_F24652C5 
X-CRM114-Status: UNSURE (   8.59  )
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

A previous editor or formatter script appears to have been confused by a
diff view, where the prepended + or - changes the way tabs are displayed.
Since it is the file itself that matters, adjust that accordingly.

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 include/sbi/riscv_encoding.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 61e4b63..92cbc27 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -189,7 +189,7 @@
 
 #define TOPI_IID_SHIFT			16
 #define TOPI_IID_MASK			0xfff
-#define TOPI_IPRIO_MASK		0xff
+#define TOPI_IPRIO_MASK			0xff
 
 #if __riscv_xlen == 64
 #define MHPMEVENT_OF			(_UL(1) << 63)
@@ -935,10 +935,10 @@
 #define INSN_MASK_C_FSWSP		0xe003
 
 #define INSN_MATCH_C_LHU		0x8400
-#define INSN_MASK_C_LHU		0xfc43
-#define INSN_MATCH_C_LH		0x8440
+#define INSN_MASK_C_LHU			0xfc43
+#define INSN_MATCH_C_LH			0x8440
 #define INSN_MASK_C_LH			0xfc43
-#define INSN_MATCH_C_SH		0x8c00
+#define INSN_MATCH_C_SH			0x8c00
 #define INSN_MASK_C_SH			0xfc43
 
 #define INSN_MASK_WFI			0xffffff00
@@ -1307,7 +1307,7 @@
 /* 64-bit read for VS-stage address translation (RV64) */
 #define INSN_PSEUDO_VS_LOAD		0x00003000
 /* 64-bit write for VS-stage address translation (RV64) */
-#define INSN_PSEUDO_VS_STORE	0x00003020
+#define INSN_PSEUDO_VS_STORE		0x00003020
 
 #elif __riscv_xlen == 32
 
@@ -1315,7 +1315,7 @@
 #define INSN_PSEUDO_VS_LOAD		0x00002000
 
 /* 32-bit write for VS-stage address translation (RV32) */
-#define INSN_PSEUDO_VS_STORE	0x00002020
+#define INSN_PSEUDO_VS_STORE		0x00002020
 
 #else
 #error "Unexpected __riscv_xlen"
@@ -1335,11 +1335,11 @@
 #define SHIFT_AQRL			25
 
 #define VM_MASK				0x1
-#define VIEW_MASK				0x3
-#define VSEW_MASK				0x3
-#define VLMUL_MASK				0x7
+#define VIEW_MASK			0x3
+#define VSEW_MASK			0x3
+#define VLMUL_MASK			0x7
 #define VD_MASK				0x1f
-#define VS2_MASK				0x1f
+#define VS2_MASK			0x1f
 #define INSN_16BIT_MASK			0x3
 #define INSN_32BIT_MASK			0x1c
 
@@ -1351,8 +1351,8 @@
 
 #define INSN_LEN(insn)			(INSN_IS_16BIT(insn) ? 2 : 4)
 
-#define SH_VSEW			3
-#define SH_VIEW			12
+#define SH_VSEW				3
+#define SH_VIEW				12
 #define SH_VD				7
 #define SH_VS2				20
 #define SH_VM				25
@@ -1400,17 +1400,17 @@
 #define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
 					 (s32)(((insn) >> 7) & 0x1f))
 
-#define IS_MASKED(insn)		(((insn >> SH_VM) & VM_MASK) == 0)
+#define IS_MASKED(insn)			(((insn >> SH_VM) & VM_MASK) == 0)
 #define GET_VD(insn)			((insn >> SH_VD) & VD_MASK)
 #define GET_VS2(insn)			((insn >> SH_VS2) & VS2_MASK)
 #define GET_VIEW(insn)			(((insn) >> SH_VIEW) & VIEW_MASK)
 #define GET_MEW(insn)			(((insn) >> SH_MEW) & 1)
-#define GET_VSEW(vtype)		(((vtype) >> SH_VSEW) & VSEW_MASK)
+#define GET_VSEW(vtype)			(((vtype) >> SH_VSEW) & VSEW_MASK)
 #define GET_VLMUL(vtype)		((vtype) & VLMUL_MASK)
 #define GET_LEN(view)			(1UL << (view))
 #define GET_NF(insn)			(1 + ((insn >> 29) & 7))
 #define GET_VEMUL(vlmul, view, vsew)	((vlmul + view - vsew) & 7)
-#define GET_EMUL(vemul)		(1UL << ((vemul) >= 4 ? 0 : (vemul)))
+#define GET_EMUL(vemul)			(1UL << ((vemul) >= 4 ? 0 : (vemul)))
 
 #define CSRRW 1
 #define CSRRS 2
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
