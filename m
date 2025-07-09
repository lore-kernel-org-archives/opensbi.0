Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E0BC83F10
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 23:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fswOfIvRwwU3+m1QNbvNdi+qhgocpGcmsF8ff+gjcfw=; b=eRXKmQC7/pjliB
	B0JNbn0qi8/Yc3hW2SS2PCBIdUgD7cC8GAXg9VE+yJrS9eTS8VITTZVmMCyHRsSfQvT7eubG4fwZ/
	0EoMGOdwmqZS1fmpWNjQIxUc3wI2ydaPaVuLHrJCVvRF7UHsOTlcwBmm2w/wVguT+v2PlCLWIQAs/
	m3KZQ9+ianQjgVbRSqsN+iz8X4ERzzUiZwj6qHJ6U/hEQc9ihyF82QbdoTlZ+DnBiJQ3acERFfw0i
	nh6JC8C96K/XaMSxJf53rNmmdJ0QEVLVNpNi64heKDrN/hfCdjX6/g/4B3Y4xykPAUKiMCUeNbU9V
	0gfnqKuTuZGZ2dlPm4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeEW-0000000AFlA-0FFx;
	Wed, 09 Jul 2025 23:29:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeET-0000000AFk4-2rQL
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 23:29:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a522224582so205066f8f.3
        for <opensbi@lists.infradead.org>; Wed, 09 Jul 2025 16:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1752103784; x=1752708584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZb5i1oVtdWT2hDK07ItvW/eexLfD8+JD69V4tTuETg=;
        b=XedePTCJSK6e0d85uacNZlKMaXVkykY61SkZF8MWKHhLHlQN9970mTA9cMpE4EAns9
         3w+osNElgUGy6M+x7vXTwpDyf5zopkN1PB8viYX1A6ZgfjxVJK0aRmliORvDPXT/m/Tk
         RPnWLxoTiYWmf8gAoAlZHjFe9OgBuvv480XaA9yWHKxrhvb4LxXkXYN44dXSLAjhSjHt
         4jFnDRu2SJ0ri6TtFjp2QuM0N6Oz5SpF8qqvHNF1w0vXIsiH+zfVF6FSrxthAAURN4Dx
         cgf4HDFZRjH0d+MuSpnRm9qscoGXInIWGRRgfuGv/1N7iJlJm7wtwZkGJ0bC+Wl9rVwT
         lAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752103784; x=1752708584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZb5i1oVtdWT2hDK07ItvW/eexLfD8+JD69V4tTuETg=;
        b=u7UpFBGdGk7DOGxSrNiEezRrXKRhof6O2SoIlwZj5Dey8KkkOR+MGRJdSIKvhrvFit
         DWSR15TeNYkTyFc0yK0IJ4SZVlJCK/qiyRvHFkM+WjYKIUOjnAmOL2p138UT7xhaiGbp
         bclUmwzXv0cP1wt05DV8pLIN7L/FgZtsohKqCP5A5INU2znH4RZgZ59rCVE3mV6A4ih0
         H6zQZRPWMr2mN0xFGyxK5R8wXr++Bcv4QRsg7kEaapPsPW/Tl1FEDBXzuGAu2KxZh7Hf
         vRg8kafU9iN2i6WkU7SHt+mQzqn5erGO32rUQ2HXjWtykUQvFyzewUCJeZERdtnuRpnG
         LcbQ==
X-Gm-Message-State: AOJu0Yw+5Ot2dp5pGCQKESRZP7Nb0AImisg7rlcA5MTRakVIcB4HLEjB
	/5FM75nqE89k3nIzJ8AA83JL5qbk7YPHzhoMK6rz37M0pZsVRjtO5YArHGEbVe2m5J+ROdJpyTu
	s1Dyu
X-Gm-Gg: ASbGncs0F5kNLdkGz2PN6nxawFceFyiBNo9uiKbY4uOQP/LmN7OWKRK4LfVqTthvafT
	PNmcpqYWRprl3tC5H/rJ5fUAVfGh2S1KDuiyubN5Df5/0LLluclMRirMq9wxYnULkRxQFIIdf5n
	GneBVlqdx7vMW7HHAZpnO3Q+9NehH0pCO+8cEseB0hRfvo1XReB/EJnOC6fruy/d1mepcm6yqgH
	M79a/ewUiAHDwAGd26xGnY1UWYMU2YKA+0DR5w3pAhMg5fgjdzAhWcnQSrTyM4zcTIHG30WMzRJ
	LtsGYu9ZUnlWy+iR7iSCF2+qvIOpJW5HERiE7GAacYpzm12QChkaOua0KRzgRMD1Q9netpIW3tN
	iC2fAgznZYK5CltJZ9ysb6+1mG7Dl96HwJ6RtxrYL7OOpcOM=
X-Google-Smtp-Source: AGHT+IE9evNrgJ+EMR/Km9bn6TepRKWOwsWaCfyHGDjPvIuFgjiMfO9CocuADcZr3K/O6vThoQwhrA==
X-Received: by 2002:a05:6000:230b:b0:3a5:8a68:b82d with SMTP id ffacd0b85a97d-3b5e452ed33mr4037539f8f.43.1752103784082;
        Wed, 09 Jul 2025 16:29:44 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.localdomain ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d872sm220660f8f.60.2025.07.09.16.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Jul 2025 16:29:43 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id D02DBE7BE920; Thu, 10 Jul 2025 00:29:41 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: opensbi@lists.infradead.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH 1/3] include: sbi: Use array for struct sbi_trap_regs and GET/SET macros
Date: Thu, 10 Jul 2025 00:29:28 +0100
Message-ID: <20250709232932.37622-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_162945_726589_F7B89704 
X-CRM114-Status: GOOD (  12.12  )
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

Rather than hand-rolling scaled pointer arithmetic with casts and
shifts, let the compiler do so by indexing an array of GPRs, taking
advantage of the language's type system to scale based on whatever type
the register happens to be. This makes it easier to support CHERI where
the registers are capabilities, not plain integers, and so this pointer
arithmetic would need to change (and currently REGBYTES is both the size
of a register and the size of an integer word upstream).

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 include/sbi/riscv_encoding.h |  25 ++----
 include/sbi/sbi_trap.h       | 148 ++++++++++++++++++++---------------
 2 files changed, 92 insertions(+), 81 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index e1256e3..f4df1ae 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -1291,6 +1291,8 @@
 #define SHIFT_FUNCT3			12
 
 #define MASK_RS1			0xf8000
+#define MASK_RS2			0x1f00000
+#define MASK_RD				0xf80
 
 #define MASK_CSR			0xfff00000
 #define SHIFT_CSR			20
@@ -1356,28 +1358,17 @@
 #define SHIFT_RIGHT(x, y)		\
 	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
 
-#define REG_MASK			\
-	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
-
-#define REG_OFFSET(insn, pos)		\
-	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
-
-#define REG_PTR(insn, pos, regs)	\
-	(ulong *)((ulong)(regs) + REG_OFFSET(insn, pos))
-
 #define GET_FUNC3(insn)			((insn & MASK_FUNCT3) >> SHIFT_FUNCT3)
 #define GET_RM(insn)			GET_FUNC3(insn)
-#define GET_RS1_NUM(insn)		((insn & MASK_RS1) >> 15)
+#define GET_RS1_NUM(insn)		((insn & MASK_RS1) >> SH_RS1)
+#define GET_RS2_NUM(insn)		((insn & MASK_RS2) >> SH_RS2)
+#define GET_RS1S_NUM(insn)		RVC_RS1S(insn)
+#define GET_RS2S_NUM(insn)		RVC_RS2S(insn)
+#define GET_RS2C_NUM(insn)		RVC_RS2(insn)
+#define GET_RD_NUM(insn)		((insn & MASK_RD) >> SH_RD)
 #define GET_CSR_NUM(insn)		((insn & MASK_CSR) >> SHIFT_CSR)
 #define GET_AQRL(insn)			((insn & MASK_AQRL) >> SHIFT_AQRL)
 
-#define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
-#define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
-#define GET_RS1S(insn, regs)		(*REG_PTR(RVC_RS1S(insn), 0, regs))
-#define GET_RS2S(insn, regs)		(*REG_PTR(RVC_RS2S(insn), 0, regs))
-#define GET_RS2C(insn, regs)		(*REG_PTR(insn, SH_RS2C, regs))
-#define GET_SP(regs)			(*REG_PTR(2, 0, regs))
-#define SET_RD(insn, regs, val)		(*REG_PTR(insn, SH_RD, regs) = (val))
 #define IMM_I(insn)			((s32)(insn) >> 20)
 #define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
 					 (s32)(((insn) >> 7) & 0x1f))
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 5eec4da..731a0c9 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -127,70 +127,75 @@
 
 /** Representation of register state at time of trap/interrupt */
 struct sbi_trap_regs {
-	/** zero register state */
-	unsigned long zero;
-	/** ra register state */
-	unsigned long ra;
-	/** sp register state */
-	unsigned long sp;
-	/** gp register state */
-	unsigned long gp;
-	/** tp register state */
-	unsigned long tp;
-	/** t0 register state */
-	unsigned long t0;
-	/** t1 register state */
-	unsigned long t1;
-	/** t2 register state */
-	unsigned long t2;
-	/** s0 register state */
-	unsigned long s0;
-	/** s1 register state */
-	unsigned long s1;
-	/** a0 register state */
-	unsigned long a0;
-	/** a1 register state */
-	unsigned long a1;
-	/** a2 register state */
-	unsigned long a2;
-	/** a3 register state */
-	unsigned long a3;
-	/** a4 register state */
-	unsigned long a4;
-	/** a5 register state */
-	unsigned long a5;
-	/** a6 register state */
-	unsigned long a6;
-	/** a7 register state */
-	unsigned long a7;
-	/** s2 register state */
-	unsigned long s2;
-	/** s3 register state */
-	unsigned long s3;
-	/** s4 register state */
-	unsigned long s4;
-	/** s5 register state */
-	unsigned long s5;
-	/** s6 register state */
-	unsigned long s6;
-	/** s7 register state */
-	unsigned long s7;
-	/** s8 register state */
-	unsigned long s8;
-	/** s9 register state */
-	unsigned long s9;
-	/** s10 register state */
-	unsigned long s10;
-	/** s11 register state */
-	unsigned long s11;
-	/** t3 register state */
-	unsigned long t3;
-	/** t4 register state */
-	unsigned long t4;
-	/** t5 register state */
-	unsigned long t5;
-	/** t6 register state */
-	unsigned long t6;
+	union {
+		unsigned long gprs[32];
+		struct {
+			/** zero register state */
+			unsigned long zero;
+			/** ra register state */
+			unsigned long ra;
+			/** sp register state */
+			unsigned long sp;
+			/** gp register state */
+			unsigned long gp;
+			/** tp register state */
+			unsigned long tp;
+			/** t0 register state */
+			unsigned long t0;
+			/** t1 register state */
+			unsigned long t1;
+			/** t2 register state */
+			unsigned long t2;
+			/** s0 register state */
+			unsigned long s0;
+			/** s1 register state */
+			unsigned long s1;
+			/** a0 register state */
+			unsigned long a0;
+			/** a1 register state */
+			unsigned long a1;
+			/** a2 register state */
+			unsigned long a2;
+			/** a3 register state */
+			unsigned long a3;
+			/** a4 register state */
+			unsigned long a4;
+			/** a5 register state */
+			unsigned long a5;
+			/** a6 register state */
+			unsigned long a6;
+			/** a7 register state */
+			unsigned long a7;
+			/** s2 register state */
+			unsigned long s2;
+			/** s3 register state */
+			unsigned long s3;
+			/** s4 register state */
+			unsigned long s4;
+			/** s5 register state */
+			unsigned long s5;
+			/** s6 register state */
+			unsigned long s6;
+			/** s7 register state */
+			unsigned long s7;
+			/** s8 register state */
+			unsigned long s8;
+			/** s9 register state */
+			unsigned long s9;
+			/** s10 register state */
+			unsigned long s10;
+			/** s11 register state */
+			unsigned long s11;
+			/** t3 register state */
+			unsigned long t3;
+			/** t4 register state */
+			unsigned long t4;
+			/** t5 register state */
+			unsigned long t5;
+			/** t6 register state */
+			unsigned long t6;
+		};
+	};
 	/** mepc register state */
 	unsigned long mepc;
 	/** mstatus register state */
@@ -199,6 +204,21 @@ struct sbi_trap_regs {
 	unsigned long mstatusH;
 };
 
+_Static_assert(
+	sizeof(((struct sbi_trap_regs *)0)->gprs) ==
+	offsetof(struct sbi_trap_regs, t6) +
+	sizeof(((struct sbi_trap_regs *)0)->t6),
+	"struct sbi_trap_regs's layout differs between gprs and named members");
+
+#define REG_VAL(idx, regs)		((regs)->gprs[(idx)])
+
+#define GET_RS1(insn, regs)		REG_VAL(GET_RS1_NUM(insn), regs)
+#define GET_RS2(insn, regs)		REG_VAL(GET_RS2_NUM(insn), regs)
+#define GET_RS1S(insn, regs)		REG_VAL(GET_RS1S_NUM(insn), regs)
+#define GET_RS2S(insn, regs)		REG_VAL(GET_RS2S_NUM(insn), regs)
+#define GET_RS2C(insn, regs)		REG_VAL(GET_RS2C_NUM(insn), regs)
+#define SET_RD(insn, regs, val)		(REG_VAL(GET_RD_NUM(insn), regs) = (val))
+
 /** Representation of trap details */
 struct sbi_trap_info {
 	/** cause Trap exception cause */
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
