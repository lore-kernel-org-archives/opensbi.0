Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCC3CEACCE
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19N/FJFr5YCMeh5fTcplbY3sqkBWNm+NfMpTxx1szy4=; b=1MvU65lBVYnzWo
	AZxtkvieBhLNmTNr4K9DnpNhtqBt+luEEV6wiILpO68Wm66ESGv6r/BD4lZ2UgP64bAx/Kc5uPf3S
	7VZRdYiZ3PTTSJ3xmywG1NnjCzgsfy/dqtjrgJSVq/eCvy0hbxCMmm+kVeMG4wE4R2kYnnOoboHox
	73n4/V1++BoXjZXMjtTP57xZQUpjYVatxXafCBC8dmXf8wQZXAhl0XT/5e+rO16mpgIK9bWabYB68
	Os4xXAz+ynisV9bR+TQXLwoO8FyQX6z0JJwCOjgcN+uaQ2u+20O8A1KUOIDIVgysZkitJrnbgrBqM
	zAuQK3Lma2tcxX6WjcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZQ-0000000D5hc-1nbX;
	Fri, 14 Nov 2025 20:39:00 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZN-0000000D5f8-2Dsr
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 20:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1763152736; x=1763757536; i=b.freisen@gmx.net;
	bh=T8058ZsFqepTHS4rkr3Ci+4xU62UREjhzwU3YTNxpQU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D///5DkUVUuUSIsfSuPcXXq0QWhBmDrFvMu0itO/pT+XguiM5u6OUPITIC4kPv6T
	 7nE4YYUWQfpND30dweWxUew1Sgpk5TRvsMUy8i0y6xOT5ba/U/pLUGhNbEZ/k3C4o
	 J2x1iL0vAjN92Fq7jwTtAN3ywcHCRUn3xm4ikWH3TtZ9laRA2MrAEsz7y9bwFfNSu
	 krtskcfhj8N06to1VtOqCCDtpeljw6GETdJI7SFmTJ1I6z1Zb58BCm+BIlar3s+94
	 woZjhTNb7Ogc3u7Y8Ugy5MUw5PxE/dk9hxTpFsep12p9ILcx9OaMIvCIlHzch9K2a
	 NhayEobSU12w1aX7Yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.138]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6mE-1w312B407Q-00ZtDj; Fri, 14
 Nov 2025 21:38:56 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v2 3/7] include: sbi: Fix tab alignment.
Date: Fri, 14 Nov 2025 21:38:38 +0100
Message-ID: <20251114203842.13396-4-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
References: <20251114203842.13396-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:mDcuLbaLT/acq167VYl7uVn4HEuBVkqOTbZHq8G7RyihiypekC5
 43HRMH5kOzJG9LjmfxTzCpaWMhQGy+V8XMBux+fA2PIpxCrox5X1XyPZThIo5fZrw6MzxRv
 lRUmuGLvoKmqpEX1x7Ulkcqbxjq3Ue8IoEaApvZvhyoCeVTW+sUOPvt6Ck+oYzJf66WuseG
 eZoCEiDXVbBvfC659wm2w==
UI-OutboundReport: notjunk:1;M01:P0:AHv+e7JP8fM=;XPqqoBXHEvGYL+wy15KpsV6u9Xm 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_123857_886213_2FD7C1DF 
X-CRM114-Status: UNSURE (   8.32  )
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
