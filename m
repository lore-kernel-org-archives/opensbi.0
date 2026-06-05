Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159FBCD6E7C
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7RU0064q6BoetA/RjzpcaZTrONk/ACKx+idR2IPUEw=; b=yR/kOeR9jSvOQW
	YeQ7MApu7lxULdDJoZ8Cg/OiCUMwCVEkpy2Y24vlrR65xoMffxWfIci1Yd0axgNOvAWb6isnRD8rp
	9ydha2MklZroviWAHj8VCaB34NqDzj4WNP7Ma8gPJPM++uNpLCetpW6JLRqD4acj8Uxk90tKICmKC
	O+QvnEMME1CHAu8WzCgMnFluJ47qb7rJ2BDyYTc0SuuGCClVGOX7EP36RvSZPUhcKpU0YSazQTjjo
	/HdYu4t173kUQWu5Kbitz+QP1eLCmt4r0V7XUIdsqJIZHn9e8XAAtvMKr1SR7rCFOkEO8LXlwS+w3
	Vf4ad5vWuRlE7Kvc5TYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSot-00000000XrT-39ml;
	Fri, 05 Jun 2026 11:34:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSop-00000000Xna-0ETw
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so924333a91.2
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659270; x=1781264070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO1khYE3NNgsrO9wMpPw9EvnUAHgta/8jauRsZZVwKA=;
        b=IMcC8652eQdt3lDh6RxsjO8JvdTybEMWunCNUHRuWl/Mil1EwkKjRZUCT5DDEmFbdw
         AOlFe61aaDUA0xw+ehkg3FSRJCRAQ3uL9kysh4fnScVlzs5veSw0tvCfUKpBS57JzNSI
         gPSqrSBt1usoZLEbcCypgK0UWeiq+gIiR7GydvEBFFY+wU63ElfC3nOMO4DYvcKtEDlk
         TVrPwUU1zvexY1QqSuAK9RnmMdPQ/T4vQ/mROBGVsBN/Ha5tP5Gd/JqP4ZcOk/wWpVTF
         A3ha12KB/aAXJiPZvCyLCeKbJYc0Pcaqp0Bfr0HN99bvJxWUJGe7qsdZ/DE/fnAxy/Oe
         X4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659270; x=1781264070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OO1khYE3NNgsrO9wMpPw9EvnUAHgta/8jauRsZZVwKA=;
        b=IttB0PTG2z9+cQVZnVmz4fIiFzC6Yz8SWHwRnJW8NjIuKLwmAyY6DjXA7yrIo+0KQ9
         AmzFY3IPGsxF3HInvBJUmcnmX7leNQAHZnGvpUyvzIidg0AToUE9uBnonw4gfxrSDuhC
         vpvworfIVI2ZTiA4OuRjtOMorBYuiBYmd80ZZaw5H3T/QtBx2GnCYsXaEfjwbOcWxd6E
         6/+xPQtTLMrlg2BMRaZfibeG+tQx8TBAB1EVKILExPi5VeRMha3FvC7jCF0+yLymKSl/
         zpwX9+bQM41Ja6vR6nJMxQF3AU0lUIVebfmnQFC2f279ibqrY2STcYDgEeGHIOqVLEyb
         YwAQ==
X-Gm-Message-State: AOJu0YwrpeOWZRR5uJpudNGnu486YSC1X4/Axj3tqnrPegDl8fxIlP/N
	VOcVD76MKWKL0OXfCH2Lftqhu4rEYjtroY/6MWHmt0P1HRg4KKFULXNUKtWwxw==
X-Gm-Gg: Acq92OH0WWC8a9f4SpIBAgoR5sNKNgbEBzHaQfzMLPwQFjvyClZUSJye2MPo1xwEjVr
	93pqAfjfzmtj8SGbDsaZ4nv+VUPH0DnNuqk1rVNG4FRPwrVn1VTrZQs5srFWfqb7OgQskrMKmve
	nqT1P6djG4B/ELDoa5hsnkA2/B/Kf/za6BCU/e5wVjD+N1Tn9dqPN+ItAdeqnimWu2POay7+T/l
	w1PSx4ivsqMBmIiQYy5DA+kOF6gtcF8xUtiHu5FZS0J45YgrGG42z1LvcO5bQs9G2u+l1L1LMnf
	yrQrTwnXYpYB+OL2HzCcsIcCOBFY6KU9ltBhrJebe+uf/hhiKx0SPnlFDR5bmPpxjIZ8vsuqGAy
	c6LO9Sgg0RCPODNM5GEVkilQ22ZoNqU4n9Ifx26YJlpC9pTv2EGCnUQbBz1eW3q7AI01iwMfDZX
	tWaijpW4AIV2sSq49m/vcGFvqaV+g8prk+02k=
X-Received: by 2002:a17:90b:5787:b0:368:147f:bd27 with SMTP id 98e67ed59e1d1-370f0d52f5cmr3610881a91.23.1780659269915;
        Fri, 05 Jun 2026 04:34:29 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:29 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 7/8] lib: sbi: Rework load/store emulator instruction decoding
Date: Fri,  5 Jun 2026 04:32:13 -0700
Message-Id: <20260605113214.242-8-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043431_164180_0EDAD5D5 
X-CRM114-Status: GOOD (  29.63  )
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

Rehaul instruction decoding to fix the following issues:

- We assume the XLEN of previous mode is the same as MXLEN. However,
  RVC instructions decodes differently in RV32 and RV64, so shouldn't
  have assumed that.
- We assume it's a misaligned fault and the load/store offset is 0,
  i.e., base address == fault address, but access faults can have
  non-0 offset (on HW supporting misaligned accesses), so platform
  specific load/store fault handler gets the wrong base address.
- No checking of [63:32] of tinst in RV64, which is explicitly
  required by Privileged ISA 19.6.3. Must reject tinst with non-0
  high 32 bits.

Thus, fix all the above. For misaligned load/store fault, the address
offset should be 0, but we'll validate that on a DEBUG build. On an
optmized build, we kill the use of base address, and use trap address
instead (same as before), which lets the compiler optimize out imm
parsing and other calculations.

I also analyzed the behavior of misaligned fault handler before fix.
With the following conditions met, it can trigger data corruption:

- HW doesn't transform instruction into tinst.
- HW doesn't support misaligned load/store, and OS doesn't enable
  misaligned delegation, thus OpenSBI handler is in effect
- HW supports mixed XLEN, and M mode is running RV64, and the trapping
  mode (U/VS/VU) is running RV32.
- The trapping instruction is c.f{l|s}w(sp).

Due to the incorrect insn decoding, the trapping instruction would
mistakenly be decoded as c.{l|s}d(sp). With this fix, c.f{l|s}w(sp)
in RV32 is now emulated correctly.

Validation:
The patch is validated to have fixed the issue with test cases running
on a modified version of QEMU that exposes misaligned faults [1], and
a further modified version that removes tinst transformation [2]. The
S-mode OS is a local build of Debian Trixie 6.12 kernel that enables
COMPAT (RV32), and the U-mode test application exercises all integer
and floating-point load/store (RVIFD64/32+RVC64/32) instructions with
all possible imm values. The patch is also tested on real HW (Sifive
P550/ESWIN EIC7700), which only supports RV64. On P550, the same test
was validated both in U mode and VU mode, where the host runs a 6.12
ESWIN vendor kernel that has some ESWIN SoC device driver patches [3]
applied, and the guest runs the exact same Debian Trixie 6.12 kernel
mentioned above.

[1] https://github.com/ganboing/qemu/tree/ganboing-misalign
[2] https://github.com/ganboing/qemu/tree/ganboing-misalign-no-tinst
[3] https://github.com/sifiveinc/riscv-linux/tree/rel/kernel-6.12/hifive-premier-p550

Fixes: 7219477f7b40 ("lib: Use MTINST CSR in misaligned load/store emulation")
Fixes: b5ae8e8a650d ("lib: Add misaligned load/store trap handling")
Fixes: 4c112650bbb0 ("lib: sbi: abstract out insn decoding to unify mem fault handlers")
Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 lib/sbi/sbi_trap_ldst.c | 436 ++++++++++++++++++++++++++++------------
 1 file changed, 308 insertions(+), 128 deletions(-)

diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index ad19926a..c1392251 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -44,28 +44,34 @@ ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
 		return orig_tinst | (addr_offset << SH_RS1);
 }
 
+static inline bool sbi_trap_tinst_valid(ulong tinst)
+{
+	/*
+	 * Bit[0] == 1 implies trapped instruction value is
+	 * transformed instruction or custom instruction.
+	 * Also do proper checking per Privileged ISA 19.6.3,
+	 * and make sure high 32 bits of tinst is 0
+	 */
+	return tinst == (uint32_t)tinst && (tinst & 0x1);
+}
+
 static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 				 sbi_trap_ld_emulator emu)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
-	ulong insn, insn_len;
+	ulong insn, insn_len, imm = 0, shift = 0, off = 0;
 	union sbi_ldst_data val = { 0 };
 	struct sbi_trap_info uptrap;
-	int rc, fp = 0, shift = 0, len = 0;
+	bool xform = false, fp = false, c_load = false, c_ldsp = false;
+	int rc, len = 0, prev_xlen = 0;
 
-	if (orig_trap->tinst & 0x1) {
-		/*
-		 * Bit[0] == 1 implies trapped instruction value is
-		 * transformed instruction or custom instruction.
-		 */
+	if (sbi_trap_tinst_valid(orig_trap->tinst)) {
+		xform	 = true;
 		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
 		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
 	} else {
-		/*
-		 * Bit[0] == 0 implies trapped instruction value is
-		 * zero or special value.
-		 */
+		/* trapped instruction value is zero or special value */
 		insn = sbi_get_insn(regs->mepc, &uptrap);
 		if (uptrap.cause) {
 			return sbi_trap_redirect(regs, &uptrap);
@@ -73,93 +79,176 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 		insn_len = INSN_LEN(insn);
 	}
 
+	/**
+	 * Common for RV32/RV64:
+	 *    lb, lbu, lh, lhu, lw, flw, flw
+	 *    c.lbu, c.lh, c.lhu, c.lw, c.lwsp, c.fld, c.fldsp
+	 */
 	if ((insn & INSN_MASK_LB) == INSN_MATCH_LB) {
-		len   = 1;
-		shift = 8 * (sizeof(ulong) - len);
+		len = -1;
 	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
 		len = 1;
-	} else if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
-		len   = 4;
-		shift = 8 * (sizeof(ulong) - len);
-#if __riscv_xlen == 64
-	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
-		len   = 8;
-		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
-		len = 4;
-#endif
-#ifdef __riscv_flen
-	} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
-		fp  = 1;
-		len = 8;
-	} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
-		fp  = 1;
-		len = 4;
-#endif
+	} else if ((insn & INSN_MASK_C_LBU) == INSN_MATCH_C_LBU) {
+		/* Zcb */
+		len = 1;
+		imm = RVC_LB_IMM(insn);
+		c_load = true;
 	} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
-		len   = 2;
-		shift = 8 * (sizeof(ulong) - len);
+		len = -2;
+	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
+		/* Zcb */
+		len = -2;
+		imm = RVC_LH_IMM(insn);
+		c_load = true;
 	} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
 		len = 2;
-#if __riscv_xlen >= 64
-	} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
-		len   = 8;
-		shift = 8 * (sizeof(ulong) - len);
-		insn  = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
-		len   = 8;
-		shift = 8 * (sizeof(ulong) - len);
-#endif
+	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
+		/* Zcb */
+		len = 2;
+		imm = RVC_LH_IMM(insn);
+		c_load = true;
+	} else if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
+		len = -4;
 	} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
-		len   = 4;
-		shift = 8 * (sizeof(ulong) - len);
-		insn  = RVC_RS2S(insn) << SH_RD;
+		/* Zca */
+		len = -4;
+		imm = RVC_LW_IMM(insn);
+		c_load = true;
 	} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
-		len   = 4;
-		shift = 8 * (sizeof(ulong) - len);
+		GET_RD_NUM(insn)) {
+		/* Zca */
+		len = -4;
+		imm = RVC_LWSP_IMM(insn);
+		c_ldsp = true;
 #ifdef __riscv_flen
+	} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
+		len = 4;
+		fp = true;
+	} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
+		len = 8;
+		fp = true;
 	} else if ((insn & INSN_MASK_C_FLD) == INSN_MATCH_C_FLD) {
-		fp   = 1;
-		len  = 8;
-		insn = RVC_RS2S(insn) << SH_RD;
+		/* Zcd */
+		len = 8;
+		imm = RVC_LD_IMM(insn);
+		c_load = true;
+		fp = true;
 	} else if ((insn & INSN_MASK_C_FLDSP) == INSN_MATCH_C_FLDSP) {
-		fp  = 1;
+		/* Zcd */
 		len = 8;
-#if __riscv_xlen == 32
-	} else if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
-		fp   = 1;
-		len  = 4;
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
-		fp  = 1;
-		len = 4;
+		imm = RVC_LDSP_IMM(insn);
+		c_ldsp = true;
+		fp = true;
 #endif
+	} else {
+		prev_xlen = sbi_regs_prev_xlen(regs);
+	}
+
+	/**
+	 * Must distinguish between rv64 and rv32, RVC instructions have
+	 * overlapping encoding:
+	 *     c.ld in rv64 == c.flw in rv32
+	 *     c.ldsp in rv64 == c.flwsp in rv32
+	 */
+	if (prev_xlen == 64) {
+		/* RV64 Only: lwu, ld, c.ld, c.ldsp  */
+		if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
+			len = 4;
+		} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
+			len = 8;
+		} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
+			/* Zca */
+			len = 8;
+			imm = RVC_LD_IMM(insn);
+			c_load = true;
+		} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
+			GET_RD_NUM(insn)) {
+			/* Zca */
+			len = 8;
+			imm = RVC_LDSP_IMM(insn);
+			c_ldsp = true;
+		}
+#ifdef __riscv_flen
+	} else if (prev_xlen == 32) {
+		/* RV32 Only: c.flw, c.flwsp */
+		if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
+			/* Zcf */
+			len = 4;
+			imm = RVC_LW_IMM(insn);
+			c_load = true;
+			fp = true;
+		} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
+			/* Zcf */
+			len = 4;
+			imm = RVC_LWSP_IMM(insn);
+			c_ldsp = true;
+			fp = true;
+		}
 #endif
-	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
-		len = 2;
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
-		len = 2;
+	}
+
+	if (len < 0) {
+		len = -len;
 		shift = 8 * (sizeof(ulong) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
 	}
 
-	rc = emu(insn, len, orig_trap->tval, &val, tcntx);
+	if (!len) // Unknown instruction
+		goto do_emu;
+
+#if !defined(OPENSBI_DEBUG)
+	/**
+	 * For misaligned faults. Skip offset calculation unless DEBUG
+	 * builds. It helps validating OpenSBI and HW.
+	 */
+	if (orig_trap->cause == CAUSE_MISALIGNED_LOAD)
+		goto do_emu;
+#endif
+
+	if (xform)
+		/* Transformed insn */
+		off = GET_RS1_NUM(insn);
+	else if (c_load)
+		/* non SP-based compressed load */
+		off = orig_trap->tval - GET_RS1S(insn, regs) - imm;
+	else if (c_ldsp)
+		/* SP-based compressed load */
+		off = orig_trap->tval - REG_VAL(2, regs) - imm;
+	else
+		/* I-type non-compressed load */
+		off = orig_trap->tval - GET_RS1(insn, regs) - (ulong)IMM_I(insn);
+	/**
+	 * Normalize offset, in case the XLEN of unpriv mode is smaller,
+	 * and/or pointer masking is in effect
+	 */
+	off &= (len - 1);
+
+do_emu:
+	rc = emu(insn, len, orig_trap->tval - off, &val, tcntx);
 	if (rc <= 0)
 		return rc;
 	if (!len)
 		goto epc_fixup;
 
-	if (!fp)
-		SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
+	if (!fp) {
+		ulong v = ((long)(val.data_ulong << shift)) >> shift;
+
+		if (c_load)
+			SET_RDS(insn, regs, v);
+		else
+			SET_RD(insn, regs, v);
 #ifdef __riscv_flen
-	else if (len == 8)
-		SET_F64_RD(insn, regs, val.data_u64);
-	else
-		SET_F32_RD(insn, regs, val.data_ulong);
+	} else if (len == 8) {
+		if (c_load)
+			SET_F64_RDS(insn, regs, val.data_u64);
+		else
+			SET_F64_RD(insn, regs, val.data_u64);
+	} else {
+		if (c_load)
+			SET_F32_RDS(insn, regs, val.data_ulong);
+		else
+			SET_F32_RD(insn, regs, val.data_ulong);
 #endif
+	}
 
 epc_fixup:
 	regs->mepc += insn_len;
@@ -172,23 +261,18 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
-	ulong insn, insn_len;
+	ulong insn, insn_len, imm = 0, off = 0;
 	union sbi_ldst_data val;
 	struct sbi_trap_info uptrap;
-	int rc, len = 0;
+	bool xform = false, fp = false, c_store = false, c_stsp = false;
+	int rc, len = 0, prev_xlen = 0;
 
-	if (orig_trap->tinst & 0x1) {
-		/*
-		 * Bit[0] == 1 implies trapped instruction value is
-		 * transformed instruction or custom instruction.
-		 */
+	if (sbi_trap_tinst_valid(orig_trap->tinst)) {
+		xform	 = true;
 		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
 		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
 	} else {
-		/*
-		 * Bit[0] == 0 implies trapped instruction value is
-		 * zero or special value.
-		 */
+		/* trapped instruction value is zero or special value */
 		insn = sbi_get_insn(regs->mepc, &uptrap);
 		if (uptrap.cause) {
 			return sbi_trap_redirect(regs, &uptrap);
@@ -196,62 +280,158 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 		insn_len = INSN_LEN(insn);
 	}
 
-	val.data_ulong = GET_RS2(insn, regs);
-
+	/**
+	 * Common for RV32/RV64:
+	 *    sb, sh, sw, fsw, fsd
+	 *    c.sb, c.sh, c.sw, c.swsp, c.fsd, c.fsdsp
+	 */
 	if ((insn & INSN_MASK_SB) == INSN_MATCH_SB) {
 		len = 1;
-	} else if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
-		len = 4;
-#if __riscv_xlen == 64
-	} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
-		len = 8;
-#endif
-#ifdef __riscv_flen
-	} else if ((insn & INSN_MASK_FSD) == INSN_MATCH_FSD) {
-		len	     = 8;
-		val.data_u64 = GET_F64_RS2(insn, regs);
-	} else if ((insn & INSN_MASK_FSW) == INSN_MATCH_FSW) {
-		len	       = 4;
-		val.data_ulong = GET_F32_RS2(insn, regs);
-#endif
+	} else if ((insn & INSN_MASK_C_SB) == INSN_MATCH_C_SB) {
+		/* Zcb */
+		len = 1;
+		imm = RVC_SB_IMM(insn);
+		c_store = true;
 	} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
 		len = 2;
-#if __riscv_xlen >= 64
-	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
-		len	       = 8;
-		val.data_ulong = GET_RS2S(insn, regs);
-	} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP) {
-		len	       = 8;
-		val.data_ulong = GET_RS2C(insn, regs);
-#endif
+	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
+		/* Zcb */
+		len = 2;
+		imm = RVC_SH_IMM(insn);
+		c_store = true;
+	} else if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
+		len = 4;
 	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
-		len	       = 4;
-		val.data_ulong = GET_RS2S(insn, regs);
+		/* Zca */
+		len = 4;
+		imm = RVC_SW_IMM(insn);
+		c_store = true;
 	} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP) {
-		len	       = 4;
-		val.data_ulong = GET_RS2C(insn, regs);
+		/* Zca */
+		len = 4;
+		imm = RVC_SWSP_IMM(insn);
+		c_stsp = true;
 #ifdef __riscv_flen
+	} else if ((insn & INSN_MASK_FSW) == INSN_MATCH_FSW) {
+		len = 4;
+		fp = true;
+	} else if ((insn & INSN_MASK_FSD) == INSN_MATCH_FSD) {
+		len = 8;
+		fp = true;
 	} else if ((insn & INSN_MASK_C_FSD) == INSN_MATCH_C_FSD) {
-		len	     = 8;
-		val.data_u64 = GET_F64_RS2S(insn, regs);
+		/* Zcd */
+		len = 8;
+		imm = RVC_SD_IMM(insn);
+		c_store = true;
+		fp = true;
 	} else if ((insn & INSN_MASK_C_FSDSP) == INSN_MATCH_C_FSDSP) {
-		len	     = 8;
-		val.data_u64 = GET_F64_RS2C(insn, regs);
-#if __riscv_xlen == 32
-	} else if ((insn & INSN_MASK_C_FSW) == INSN_MATCH_C_FSW) {
-		len	       = 4;
-		val.data_ulong = GET_F32_RS2S(insn, regs);
-	} else if ((insn & INSN_MASK_C_FSWSP) == INSN_MATCH_C_FSWSP) {
-		len	       = 4;
-		val.data_ulong = GET_F32_RS2C(insn, regs);
+		/* Zcd */
+		len = 8;
+		imm = RVC_SDSP_IMM(insn);
+		c_stsp = true;
+		fp = true;
 #endif
+	} else {
+		prev_xlen = sbi_regs_prev_xlen(regs);
+	}
+
+	/**
+	 * Must distinguish between rv64 and rv32, RVC instructions have
+	 * overlapping encoding:
+	 *     c.sd in rv64 == c.fsw in rv32
+	 *     c.sdsp in rv64 == c.fswsp in rv32
+	 */
+	if (prev_xlen == 64) {
+		/* RV64 Only: sd, c.sd, c.sdsp */
+		if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
+			len = 8;
+		} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
+			/* Zca */
+			len = 8;
+			imm = RVC_SD_IMM(insn);
+			c_store = true;
+		} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP) {
+			/* Zca */
+			len = 8;
+			imm = RVC_SDSP_IMM(insn);
+			c_stsp = true;
+		}
+#ifdef __riscv_flen
+	} else if (prev_xlen == 32) {
+		/* RV32 Only: c.fsw, c.fswsp */
+		if ((insn & INSN_MASK_C_FSW) == INSN_MATCH_C_FSW) {
+			/* Zcf */
+			len = 4;
+			imm = RVC_SW_IMM(insn);
+			c_store = true;
+			fp = true;
+		} else if ((insn & INSN_MASK_C_FSWSP) == INSN_MATCH_C_FSWSP) {
+			/* Zcf */
+			len = 4;
+			imm = RVC_SWSP_IMM(insn);
+			c_stsp = true;
+			fp = true;
+		}
+#endif
+	}
+
+	if (!fp) {
+		if (c_store)
+			val.data_ulong = GET_RS2S(insn, regs);
+		else if (c_stsp)
+			val.data_ulong = GET_RS2C(insn, regs);
+		else
+			val.data_ulong = GET_RS2(insn, regs);
+#ifdef __riscv_flen
+	} else if (len == 8) {
+		if (c_store)
+			val.data_u64 = GET_F64_RS2S(insn, regs);
+		else if (c_stsp)
+			val.data_u64 = GET_F64_RS2C(insn, regs);
+		else
+			val.data_u64 = GET_F64_RS2(insn, regs);
+	} else {
+		if (c_store)
+			val.data_ulong = GET_F32_RS2S(insn, regs);
+		else if (c_stsp)
+			val.data_ulong = GET_F32_RS2C(insn, regs);
+		else
+			val.data_ulong = GET_F32_RS2(insn, regs);
 #endif
-	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
-		len		= 2;
-		val.data_ulong = GET_RS2S(insn, regs);
 	}
 
-	rc = emu(insn, len, orig_trap->tval, val, tcntx);
+	if (!len) // Unknown instruction
+		goto do_emu;
+
+#if !defined(OPENSBI_DEBUG)
+	/**
+	 * For misaligned faults. Skip offset calculation unless DEBUG
+	 * builds. It helps validating OpenSBI and HW.
+	 */
+	if (orig_trap->cause == CAUSE_MISALIGNED_STORE)
+		goto do_emu;
+#endif
+
+	if (xform)
+		/* Transformed insn */
+		off = GET_RS1_NUM(insn);
+	else if (c_store)
+		/* non SP-based compressed store */
+		off = orig_trap->tval - GET_RS1S(insn, regs) - imm;
+	else if (c_stsp)
+		/* SP-based compressed store */
+		off = orig_trap->tval - REG_VAL(2, regs) - imm;
+	else
+		/* S-type non-compressed store */
+		off = orig_trap->tval - GET_RS1(insn, regs) - (ulong)IMM_S(insn);
+	/**
+	 * Normalize offset, in case the XLEN of unpriv mode is smaller,
+	 * and/or pointer masking is in effect
+	 */
+	off &= (len - 1);
+
+do_emu:
+	rc = emu(insn, len, orig_trap->tval - off, val, tcntx);
 	if (rc <= 0)
 		return rc;
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
