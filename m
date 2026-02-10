Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E77EA3F30
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8H593/Z/aC6i+RiUxsH8bGzqZkFONzMmJyfSpgrgkug=; b=CxviUYpSwwJErD
	BP3nBGYNtyxFocDllqTzxsVlWjAfGLfiJ3YpCA51DY9EabjFsknA1k8u66wapRZdD75hi9Oyq6zbv
	/8klX4GZQm3D7mHWtbqJKoLCQtu65DteyTWVEvFExF9HHYagPb4vGRuwmgZfpzSkTPfWi6DhVgXjA
	khNffFlniJyyYZ7BDTySeijDD3315tduFJhrTpbyD0UmgW2dxCq2T0YRAaWYOBlLo9J5JF9qsTUjE
	O0rYGbLekAqht7LZD2umKd05861xssYbX/llT3tTxfL3QHviZVRk2FvILVeAs5/n2nFKhWbg+cZnV
	itO/fuimvqMs/fq2nRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGk-0000000GlYY-08yk;
	Tue, 10 Feb 2026 09:42:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGh-0000000GlWo-2J2v
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 09:42:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2aaf43014d0so12744775ad.2
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 01:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716570; x=1771321370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bkjdIum4lcMrA2StibKHdYOtNoDEOCiqfZj+LFF2Xs=;
        b=RNARcEE3hn0Iyh13y9szNLbM1kfC/zqOIJ6kXW+0AdJNHI22rbJw3JXzJjj3YP2i35
         INWnsbxCwviFvGX8/o9QQj7cUr9s5TjP8vhvDRPWrxeVOzIrBW2KGQpMio5TbKuDLSoi
         a9JFzyYYOaILOfMwY/CxVkgYkQnRG7koX9oWXFWFI1XuvvtQ/BpUheWOYP6NpwfoI8oK
         JB7FWrAeTPtA3bGE7VV7llUaPRavebhEcii00J8vSZyRxB+OBwubAKbSyWi6RXNGh+nd
         fzmS99k/bBDt9ujv7tcgiIvI1+CJR/vMXa9dwH5+ciUNZOfFO13ktJqnd+GZNUlCfRAi
         lVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716570; x=1771321370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/bkjdIum4lcMrA2StibKHdYOtNoDEOCiqfZj+LFF2Xs=;
        b=UzjwCdkNK/9xSAxtxc/G6x62O9Qwxw0mtv35w8ZIQByNAdw7bA9+EBX67xvnLzl3+K
         WBLeyfVSB/HJnnZly4o+iu7qZspuRYQ9AyQaA+7SqyBSb3lEvEfOylWbslM86S5jKeKT
         z7pr+xByh69CFtwW4yBOF5QT8TGrqS+QVNG7ptRz/szpbe+qEkfaT6FFthTpeBG8Prph
         nr2Sfc6+0tU7z4xqdZlMoOPlhYaBq3f780ILBRQFEv32UdHKRH4w4tDhBb2l2UCV7r5+
         /xo0+Dmvi8MDcmeIfCDCO5y+dTZVP2IYPQwTGS9kjH8QZTwbqWXVTqpZXVeDl6nvBiFm
         xnOg==
X-Gm-Message-State: AOJu0YySSkGW+7YgOvryl/lKw1OUQGnFnWCBXNtsH6cS2zugJsDKs079
	UM9Jl69ZAV8YdK7m2fnFjNEw0LLHvm+fplMPNwbd4wzh+uR26oDMKTxHxxAjAA==
X-Gm-Gg: AZuq6aL967gPAEfrDfsB9lqJ4+dIE5tsAHhiWuq/AyCoFN/j1Sw7/Nex2Kp2rx/l6Yb
	Q4xL4njIHcHTrucmXkQ0CWDmpBpq3hEwkXlNYDGQq3yPng+cREZh5+OOb9DBHdcYu/i7durl8BD
	TGr9pxLdKPGnfjb+1bVc7jhehOFjLujr2FThtmUYvUqbJHNN9W6v75Wre5E/ZbUdfFNh9Ne6mE+
	eQF3gn3UIFXygKPLwKDaghA+tgA6M3cJjBhk/tFVP6yYnNtKsxH0Sde32ilSoatj7u5Q3cwSYPS
	Y6ChZxrQQeGVwRGa3Uy0/s7Vq17yOASogc0RRc2oI0puYemzkQgBIcoKWUEiQS2P5XbqBv3HECb
	tujzSWB3utVGDfeCEsJHNZGVg4GVRBVQgalEDo7SL84EyWels9Tizk9ti2y2NpYOvEpLF7nLqjD
	wSH5iqYyBgy2TdgLgovKDp3org
X-Received: by 2002:a17:903:41c7:b0:2a9:410:23fe with SMTP id d9443c01a7336-2ab10a1a54bmr16974875ad.36.1770716570006;
        Tue, 10 Feb 2026 01:42:50 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm133219215ad.61.2026.02.10.01.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:42:49 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	dramforever@live.com,
	anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org,
	cleger@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH 3/7] include: sbi: Add GET_RDS_NUM/SET(_FP32/_FP64)_RDS macros
Date: Tue, 10 Feb 2026 01:40:40 -0800
Message-Id: <20260210094044.72591-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210094044.72591-1-ganboing@gmail.com>
References: <20260210094044.72591-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014251_587491_C44D3C75 
X-CRM114-Status: GOOD (  10.25  )
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

These macros can be used to decode rd' and set rd' in RVC instructions

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/riscv_encoding.h |  1 +
 include/sbi/riscv_fp.h       | 24 ++++++++++++++++++------
 include/sbi/sbi_trap.h       |  1 +
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 8ab59abe..064ba9d1 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -1414,6 +1414,7 @@
 #define GET_RS2S_NUM(insn)		RVC_RS2S(insn)
 #define GET_RS2C_NUM(insn)		RVC_RS2(insn)
 #define GET_RD_NUM(insn)		((insn & MASK_RD) >> SH_RD)
+#define GET_RDS_NUM(insn)		RVC_RS2S(insn)
 #define GET_CSR_NUM(insn)		((insn & MASK_CSR) >> SHIFT_CSR)
 #define GET_AQRL(insn)			((insn & MASK_AQRL) >> SHIFT_AQRL)
 
diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
index f523c56e..03011af9 100644
--- a/include/sbi/riscv_fp.h
+++ b/include/sbi/riscv_fp.h
@@ -91,15 +91,27 @@
 #define GET_F64_RS1(insn, regs) (GET_F64_REG(insn, 15, regs))
 #define GET_F64_RS2(insn, regs) (GET_F64_REG(insn, 20, regs))
 #define GET_F64_RS3(insn, regs) (GET_F64_REG(insn, 27, regs))
-#define SET_F32_RD(insn, regs, val) \
-	(SET_F32_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
-#define SET_F64_RD(insn, regs, val) \
-	(SET_F64_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
+#define SET_F32_RD(insn, regs, val) do {	\
+	SET_F32_REG(insn, 7, regs, val);	\
+	SET_FS_DIRTY(regs);			\
+} while(0)
+#define SET_F64_RD(insn, regs, val) do {	\
+	SET_F64_REG(insn, 7, regs, val);	\
+	SET_FS_DIRTY(regs);			\
+} while(0)
 
 #define GET_F32_RS2C(insn, regs) (GET_F32_REG(insn, 2, regs))
-#define GET_F32_RS2S(insn, regs) (GET_F32_REG(RVC_RS2S(insn), 0, regs))
+#define GET_F32_RS2S(insn, regs) (GET_F32_REG(GET_RS2S_NUM(insn), 0, regs))
 #define GET_F64_RS2C(insn, regs) (GET_F64_REG(insn, 2, regs))
-#define GET_F64_RS2S(insn, regs) (GET_F64_REG(RVC_RS2S(insn), 0, regs))
+#define GET_F64_RS2S(insn, regs) (GET_F64_REG(GET_RS2S_NUM(insn), 0, regs))
+#define SET_F32_RDS(insn, regs, val) do {		\
+	SET_F32_REG(GET_RDS_NUM(insn), 0, regs, val);	\
+	SET_FS_DIRTY(regs);				\
+} while(0)
+#define SET_F64_RDS(insn, regs, val) do {		\
+	SET_F64_REG(GET_RDS_NUM(insn), 0, regs, val);	\
+	SET_FS_DIRTY(regs);				\
+} while(0)
 
 #endif
 
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 4ef672f4..816e93c8 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -218,6 +218,7 @@ _Static_assert(
 #define GET_RS2S(insn, regs)		REG_VAL(GET_RS2S_NUM(insn), regs)
 #define GET_RS2C(insn, regs)		REG_VAL(GET_RS2C_NUM(insn), regs)
 #define SET_RD(insn, regs, val)		(REG_VAL(GET_RD_NUM(insn), regs) = (val))
+#define SET_RDS(insn, regs, val)	(REG_VAL(GET_RDS_NUM(insn), regs) = (val))
 
 /** Representation of trap details */
 struct sbi_trap_info {
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
