Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35778CEACD6
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 20:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OviXqUzno6xS330IJeyKii6E9jYkca2hdyXLw6eFiYM=; b=ZvZsYFnF19jKsL
	vwtCaReAnOJ57N4FBZHIpZlwYogKI8yQmg6ZTurJDFPYK7DP9qnfG55DImJI9UCfh4zf3KMNOXkMZ
	lvK+h12pWZLjL+hPmSNtRVAw7ReI2PpqJ4EETHwUns5eswls/AKbojqEPUSp+WUxGoKmZ6EgfpsLy
	xfaEfV7ESjmQzEIqI8fN0AU572S3b/KScFGCxt5KtUC6W7uJLw6PZYsrwf39NPJhVZMikFC/67CkT
	yVo0wc0cV/fSD7eXZ45baJ6AlmRfJ3CImbYf4TksjCVKixEAP/cf6zVak8Bz2n9Yax6VtL6o7nOKA
	rAzmfj6a87t/yX4tf+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZW-0000000D5mg-34kp;
	Fri, 14 Nov 2025 20:39:06 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZS-0000000D5hs-01pa
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 20:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1763152740; x=1763757540; i=b.freisen@gmx.net;
	bh=yZPE+5SKxk4ShSybY4JTJsjAeI/sc8j2FLJh9krKA8U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ce4QA7rkwgqLP6zA4GIeNz4becB/z8VhD9lkDRKxTTOAoo25adfHVPK+YKwHkb9W
	 XIpU1LZUEpQhxOEHnmo8k1zIiy8GOEDF8JLfFttkH66qCpewgq2nhWhb5cwpTRC47
	 YwEyZPg/pNbWWUqQAdtCO9RboO1MS0olnKU8NmLbSBU+4Id/ZaSJHQU9XPLV9xy8I
	 pFKwAS+UzMNUrZp3xMFPaJeR4dsR36HRSuFn1a8vWHphFR/Us2TcLy5LUzW478s/+
	 Ks5lgPKVXmPz40cs7iYdcoRvD1g6qdCqfhxEwGUd5Kqpvrq+LPfLgNbShkSDvNCGi
	 J6ebIZBxJjgz4uCELQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.138]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowGa-1vy2ws0FIc-00dl6D; Fri, 14
 Nov 2025 21:39:00 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v2 6/7] lib: sbi: ISA extension emulation.
Date: Fri, 14 Nov 2025 21:38:41 +0100
Message-ID: <20251114203842.13396-7-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
References: <20251114203842.13396-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0ALz8HkoRoI6jPmhvSTPELtKV8sPzgP5tSxnNEq40pCuFzGJK9q
 LMxgMMOHtOolkapZyze3qjaHr4+pnFHtIIkHsx8Xd7tW66WLDxJ2H33Hu7FGg5n3M1srGyz
 VML+t6No6QkajlKMB5xveUJ30hEFQmLFIU5GV3m3Ld/RXny+YeS6ltcOT1EYiy1uSJ86QWp
 9qaR8m+hHeEa2iYUe45bQ==
UI-OutboundReport: notjunk:1;M01:P0:05zDi4h+qQI=;sO9HHo/2O9ed10aYPyXJ7ZF+V1c 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_123902_886684_DFBDE32A 
X-CRM114-Status: GOOD (  10.12  )
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

Add trap-based emulation code or compatibility stubs for the following ISA extensions:
Zicbom, Zicboz, Zicond, Zimop, Zawrs, Zfa, Zfhmin, Zcb, Zcmop, Zba, Zbb, Zbc, Zbs, Supm

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 CONTRIBUTORS.md                          |   2 +
 include/sbi/riscv_encoding.h             | 177 ++++
 include/sbi/riscv_fp.h                   |  47 ++
 include/sbi/sbi_hart.h                   |   2 +
 include/sbi/sbi_illegal_insn.h           |   1 +
 include/sbi/sbi_insn_emu.h               |  65 ++
 include/sbi/sbi_insn_emu_fp.h            |  29 +
 include/sbi/sbi_scratch.h                |  12 +-
 include/sbi/sbi_trap.h                   |   2 +
 include/sbi_utils/cache/fdt_cmo_helper.h |   7 +
 lib/sbi/Kconfig                          |   7 +
 lib/sbi/objects.mk                       |   2 +
 lib/sbi/sbi_emulate_csr.c                |  14 +
 lib/sbi/sbi_fwft.c                       |  34 +
 lib/sbi/sbi_hart.c                       |   4 +
 lib/sbi/sbi_illegal_insn.c               | 132 ++-
 lib/sbi/sbi_insn_emu.c                   | 624 +++++++++++++++
 lib/sbi/sbi_insn_emu.conf                | 151 ++++
 lib/sbi/sbi_insn_emu_fp.c                | 974 +++++++++++++++++++++++
 lib/sbi/sbi_trap.c                       |  72 ++
 lib/sbi/sbi_trap_ldst.c                  |  10 +-
 lib/utils/cache/fdt_cmo_helper.c         |  15 +
 22 files changed, 2340 insertions(+), 43 deletions(-)
 create mode 100644 include/sbi/sbi_insn_emu.h
 create mode 100644 include/sbi/sbi_insn_emu_fp.h
 create mode 100644 lib/sbi/sbi_insn_emu.c
 create mode 100644 lib/sbi/sbi_insn_emu.conf
 create mode 100644 lib/sbi/sbi_insn_emu_fp.c

diff --git a/CONTRIBUTORS.md b/CONTRIBUTORS.md
index afae125..a26ffd8 100644
--- a/CONTRIBUTORS.md
+++ b/CONTRIBUTORS.md
@@ -14,6 +14,8 @@ List of OpenSBI Contributors (Alphabetically sorted)
 
 * Atish Patra <atish.patra@wdc.com>
 
+* Benedikt Freisen <b.freisen@gmx.net>
+
 * Bin Meng <bmeng.cn@gmail.com>
 
 * Damien Le Moal <damien.lemoal@wdc.com>
diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index d956ebb..a6709d1 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -887,12 +887,16 @@
 #define INSN_MATCH_SD			0x3023
 #define INSN_MASK_SD			0x707f
 
+#define INSN_MATCH_FLH			0x1007
+#define INSN_MASK_FLH			0x707f
 #define INSN_MATCH_FLW			0x2007
 #define INSN_MASK_FLW			0x707f
 #define INSN_MATCH_FLD			0x3007
 #define INSN_MASK_FLD			0x707f
 #define INSN_MATCH_FLQ			0x4007
 #define INSN_MASK_FLQ			0x707f
+#define INSN_MATCH_FSH			0x1027
+#define INSN_MASK_FSH			0x707f
 #define INSN_MATCH_FSW			0x2027
 #define INSN_MASK_FSW			0x707f
 #define INSN_MATCH_FSD			0x3027
@@ -934,13 +938,29 @@
 #define INSN_MATCH_C_FSWSP		0xe002
 #define INSN_MASK_C_FSWSP		0xe003
 
+#define INSN_MASK_C_GENERIC_RXS_RXS	0xfc63
+#define INSN_MASK_C_GENERIC_RXS		0xfc7f
+
+#define INSN_MATCH_C_LBU		0x8000
+#define INSN_MASK_C_LBU			0xfc43
 #define INSN_MATCH_C_LHU		0x8400
 #define INSN_MASK_C_LHU			0xfc43
 #define INSN_MATCH_C_LH			0x8440
 #define INSN_MASK_C_LH			0xfc43
+#define INSN_MATCH_C_SB			0x8800
+#define INSN_MASK_C_SB			0xfc43
 #define INSN_MATCH_C_SH			0x8c00
 #define INSN_MASK_C_SH			0xfc43
 
+#define INSN_MATCH_C_ZEXT_B		0x9c61
+#define INSN_MATCH_C_SEXT_B		0x9c65
+#define INSN_MATCH_C_ZEXT_H		0x9c69
+#define INSN_MATCH_C_SEXT_H		0x9c6d
+#define INSN_MATCH_C_ZEXT_W		0x9c71
+#define INSN_MATCH_C_NOT		0x9c75
+
+#define INSN_MATCH_C_MUL		0x9c41
+
 #define INSN_MASK_WFI			0xffffff00
 #define INSN_MATCH_WFI			0x10500000
 
@@ -951,6 +971,140 @@
 #define INSN_MASK_FENCE_I		0x0000707f
 #define INSN_MATCH_FENCE_I		0x0000100f
 
+#define INSN_MASK_CBO			0xfff07fff
+#define INSN_MATCH_CBO_CLEAN		0x0010200f
+#define INSN_MATCH_CBO_FLUSH		0x0020200f
+#define INSN_MATCH_CBO_INVAL		0x0000200f
+#define INSN_MATCH_CBO_ZERO		0x0040200f
+
+/* Zawrs (no mask) */
+#define INSN_MATCH_WRS_NTO		0x00d00073
+#define INSN_MATCH_WRS_STO		0x01d00073
+
+/* generic masks for instruction formats R and I */
+#define INSN_MASK_RTYPE_RD_RS1_RS2	0xfe00707f
+#define INSN_MASK_ITYPE_RD_RS		0xfff0707f
+
+/* Zbs single-bit instructions */
+#define INSN_MATCH_BCLR			0x48001033
+#define INSN_MATCH_BCLRI		0x48001013
+#define INSN_MATCH_BEXT			0x48005033
+#define INSN_MATCH_BEXTI		0x48005013
+#define INSN_MATCH_BINV			0x68001033
+#define INSN_MATCH_BINVI		0x68001013
+#define INSN_MATCH_BSET			0x28001033
+#define INSN_MATCH_BSETI		0x28001013
+
+/* Zbb */
+#define INSN_MATCH_ANDN			0x40007033
+#define INSN_MATCH_MAX			0x0a006033
+#define INSN_MATCH_MAXU			0x0a007033
+#define INSN_MATCH_MIN			0x0a004033
+#define INSN_MATCH_MINU			0x0a005033
+#define INSN_MATCH_ORN			0x40006033
+#define INSN_MATCH_ROL			0x60001033
+#define INSN_MATCH_ROR			0x60005033
+#define INSN_MATCH_RORI			0x60005013
+#define INSN_MATCH_XNOR			0x40004033
+#define INSN_MATCH_CLZ			0x60001013
+#define INSN_MATCH_CTZ			0x60101013
+#define INSN_MATCH_CPOP			0x60201013
+#define INSN_MATCH_ORC_B		0x28705013
+#define INSN_MATCH_REV8_RV32		0x69805013
+#define INSN_MATCH_REV8_RV64		0x6b805013
+#define INSN_MATCH_SEXT_B		0x60401013
+#define INSN_MATCH_SEXT_H		0x60501013
+
+/* Zba */
+#define INSN_MATCH_SH1ADD		0x20002033
+#define INSN_MATCH_SH2ADD		0x20004033
+#define INSN_MATCH_SH3ADD		0x20006033
+
+/* Zbc */
+#define INSN_MATCH_CLMUL		0x0a001033
+#define INSN_MATCH_CLMULH		0x0a003033
+#define INSN_MATCH_CLMULR		0x0a002033
+
+/* Zbkb */
+#define INSN_MATCH_PACK			0x08004033
+#define INSN_MATCH_PACKH		0x08007033
+
+/* Zba word instructions */
+#define INSN_MASK_SLLI_UW		0xfc00707f
+
+#define INSN_MATCH_ADD_UW		0x0800003b
+#define INSN_MATCH_SH1ADD_UW		0x2000203b
+#define INSN_MATCH_SH2ADD_UW		0x2000403b
+#define INSN_MATCH_SH3ADD_UW		0x2000603b
+#define INSN_MATCH_SLLI_UW		0x0800101b
+
+/* Zbb word instructions */
+#define INSN_MATCH_ROLW			0x6000103b
+#define INSN_MATCH_RORW			0x6000503b
+
+#define INSN_MATCH_CLZW			0x6000101b
+#define INSN_MATCH_CTZW			0x6010101b
+#define INSN_MATCH_CPOPW		0x6020101b
+#define INSN_MATCH_ZEXT_H_RV32		0x08004033
+#define INSN_MATCH_ZEXT_H_RV64		0x0800403b
+#define INSN_MATCH_RORIW		0x6000501b
+
+/* Zfhmin floating-point FCVT */
+#define INSN_MATCH_FCVT_S_H		0x40200053
+#define INSN_MATCH_FCVT_H_S		0x44000053
+#define INSN_MATCH_FCVT_D_H		0x42200053
+#define INSN_MATCH_FCVT_H_D		0x44100053
+#define INSN_MATCH_FCVT_Q_H		0x46200053
+#define INSN_MATCH_FCVT_H_Q		0x44300053
+/* Zfh floating-point to/from integer FCVT */
+#define INSN_MATCH_FCVT_W_H		0xc4000053
+#define INSN_MATCH_FCVT_WU_H		0xc4100053
+#define INSN_MATCH_FCVT_H_W		0xd4000053
+#define INSN_MATCH_FCVT_H_WU		0xd4100053
+/* Zfhmin FMV */
+#define INSN_MATCH_FMV_X_H		0xe4000053
+#define INSN_MATCH_FMV_H_X		0xf4000053
+/* Zfa */
+#define INSN_MATCH_FLI_S		0xf0100053
+#define INSN_MATCH_FLI_D		0xf2100053
+#define INSN_MATCH_FLI_H		0xf4100053
+
+#define INSN_MATCH_FMINM_S		0x28002053
+#define INSN_MATCH_FMAXM_S		0x28003053
+#define INSN_MATCH_FMINM_D		0x2a002053
+#define INSN_MATCH_FMAXM_D		0x2a003053
+#define INSN_MATCH_FMINM_H		0x2c002053
+#define INSN_MATCH_FMAXM_H		0x2c003053
+
+#define INSN_MATCH_FROUND_S		0x40400053
+#define INSN_MATCH_FROUNDNX_S		0x40500053
+#define INSN_MATCH_FROUND_D		0x42400053
+#define INSN_MATCH_FROUNDNX_D		0x42500053
+#define INSN_MATCH_FROUND_H		0x44400053
+#define INSN_MATCH_FROUNDNX_H		0x44500053
+
+#define INSN_MATCH_FCVTMOD_W_D		0xc2801053
+
+#define INSN_MATCH_FLTQ_S		0xa0005053
+#define INSN_MATCH_FLEQ_S		0xa0004053
+#define INSN_MATCH_FLTQ_D		0xa2005053
+#define INSN_MATCH_FLEQ_D		0xa2004053
+#define INSN_MATCH_FLTQ_H		0xa4005053
+#define INSN_MATCH_FLEQ_H		0xa4004053
+
+/* Zimop */
+#define INSN_MASK_MOP_R_N		0xb3c0707f
+#define INSN_MATCH_MOP_R_N		0x81c04073
+#define INSN_MASK_MOP_RR_N		0xb200707f
+#define INSN_MATCH_MOP_RR_N		0x82004073
+/* Zcmop */
+#define INSN_MASK_C_MOP_N		0xf8ff
+#define INSN_MATCH_C_MOP_N		0x6081
+
+/* Zicond */
+#define INSN_MATCH_CZERO_EQZ		0x0e005033
+#define INSN_MATCH_CZERO_NEZ		0x0e007033
+
 #define INSN_MASK_VECTOR_UNIT_STRIDE		0xfdf0707f
 #define INSN_MASK_VECTOR_FAULT_ONLY_FIRST	0xfdf0707f
 #define INSN_MASK_VECTOR_STRIDE			0xfc00707f
@@ -1024,6 +1178,26 @@
 #define INSN_MATCH_VS4RV		0x62800027
 #define INSN_MATCH_VS8RV		0xe2800027
 
+/* Zvbb */
+#define INSN_MASK_VXUNARY0		0xfc0ff07f
+#define INSN_MASK_VVBINARY0		0xfc00707f
+#define INSN_MATCH_VANDNVV		0X04000057
+#define INSN_MATCH_VANDNVX		0x04004057
+#define INSN_MATCH_VBREVV		0x48052057
+#define INSN_MATCH_VBREV8V		0x48042057
+#define INSN_MATCH_VREV8V		0x4804a057
+#define INSN_MATCH_VCLZV		0x48062057
+#define INSN_MATCH_VCTZV		0x4806a057
+#define INSN_MATCH_VCPOPV		0x48072057
+#define INSN_MATCH_VROLVV		0x54000057
+#define INSN_MATCH_VROLVX		0x54004057
+#define INSN_MATCH_VRORVV		0x50000057
+#define INSN_MATCH_VRORVX		0x50004057
+#define INSN_MATCH_VRORVI		0x50003057
+#define INSN_MATCH_VWSLLVV		0xd4000057
+#define INSN_MATCH_VWSLLVX		0xd4004057
+#define INSN_MATCH_VWSLLVI		0xd4003057
+
 #define INSN_OPCODE_MASK		0x7f
 #define INSN_OPCODE_VECTOR_LOAD		0x07
 #define INSN_OPCODE_VECTOR_STORE	0x27
@@ -1343,6 +1517,7 @@
 #define VSEW_MASK			0x3
 #define VLMUL_MASK			0x7
 #define VD_MASK				0x1f
+#define VS1_MASK			0x1f
 #define VS2_MASK			0x1f
 #define INSN_16BIT_MASK			0x3
 #define INSN_32BIT_MASK			0x1c
@@ -1358,6 +1533,7 @@
 #define SH_VSEW				3
 #define SH_VIEW				12
 #define SH_VD				7
+#define SH_VS1				15
 #define SH_VS2				20
 #define SH_VM				25
 #define SH_MEW				28
@@ -1406,6 +1582,7 @@
 
 #define IS_MASKED(insn)			(((insn >> SH_VM) & VM_MASK) == 0)
 #define GET_VD(insn)			((insn >> SH_VD) & VD_MASK)
+#define GET_VS1(insn)			((insn >> SH_VS1) & VS1_MASK)
 #define GET_VS2(insn)			((insn >> SH_VS2) & VS2_MASK)
 #define GET_VIEW(insn)			(((insn) >> SH_VIEW) & VIEW_MASK)
 #define GET_MEW(insn)			(((insn) >> SH_MEW) & 1)
diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
index f523c56..2a64305 100644
--- a/include/sbi/riscv_fp.h
+++ b/include/sbi/riscv_fp.h
@@ -76,6 +76,30 @@
 			: "r"(value), "r"(offset)                                                           \
 			: "t0");                                                                            \
 	})
+
+#define GET_F16_REG(insn, pos, regs) ((u16)GET_F32_REG(insn, pos, regs))
+
+#define SET_F16_REG(insn, pos, regs, val) \
+	(SET_F32_REG(insn, pos, regs, (val) | 0xffff0000))
+
+#define GET_F16_REG_OR_NAN(insn, pos, regs)                             \
+	({                                                              \
+		u64 value = GET_F64_REG(insn, pos, regs);               \
+		if ((value & 0xffffffffffff0000) != 0xffffffffffff0000) \
+			value = 0x7c00;                                 \
+		(u16) value;                                            \
+	})
+
+#define GET_F32_REG_OR_NAN(insn, pos, regs)                             \
+	({                                                              \
+		u64 value = GET_F64_REG(insn, pos, regs);               \
+		if ((value & 0xffffffff00000000) != 0xffffffff00000000) \
+			value = 0x7fc00000;                             \
+		(u32) value;                                            \
+	})
+
+#define GET_F64_REG_OR_NAN(insn, pos, regs) GET_F64_REG(insn, pos, regs)
+
 #define GET_FCSR() csr_read(CSR_FCSR)
 #define SET_FCSR(value) csr_write(CSR_FCSR, (value))
 #define GET_FRM() csr_read(CSR_FRM)
@@ -91,16 +115,39 @@
 #define GET_F64_RS1(insn, regs) (GET_F64_REG(insn, 15, regs))
 #define GET_F64_RS2(insn, regs) (GET_F64_REG(insn, 20, regs))
 #define GET_F64_RS3(insn, regs) (GET_F64_REG(insn, 27, regs))
+#define GET_F16_RS1(insn, regs) (GET_F16_REG(insn, 15, regs))
+#define GET_F16_RS2(insn, regs) (GET_F16_REG(insn, 20, regs))
+#define GET_F16_RS3(insn, regs) (GET_F16_REG(insn, 27, regs))
+
+#define GET_F32_RS1_OR_NAN(insn, regs) (GET_F32_REG_OR_NAN(insn, 15, regs))
+#define GET_F32_RS2_OR_NAN(insn, regs) (GET_F32_REG_OR_NAN(insn, 20, regs))
+#define GET_F32_RS3_OR_NAN(insn, regs) (GET_F32_REG_OR_NAN(insn, 27, regs))
+#define GET_F64_RS1_OR_NAN(insn, regs) (GET_F64_REG_OR_NAN(insn, 15, regs))
+#define GET_F64_RS2_OR_NAN(insn, regs) (GET_F64_REG_OR_NAN(insn, 20, regs))
+#define GET_F64_RS3_OR_NAN(insn, regs) (GET_F64_REG_OR_NAN(insn, 27, regs))
+#define GET_F16_RS1_OR_NAN(insn, regs) (GET_F16_REG_OR_NAN(insn, 15, regs))
+#define GET_F16_RS2_OR_NAN(insn, regs) (GET_F16_REG_OR_NAN(insn, 20, regs))
+#define GET_F16_RS3_OR_NAN(insn, regs) (GET_F16_REG_OR_NAN(insn, 27, regs))
+
 #define SET_F32_RD(insn, regs, val) \
 	(SET_F32_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
 #define SET_F64_RD(insn, regs, val) \
 	(SET_F64_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
+#define SET_F16_RD(insn, regs, val) \
+	(SET_F16_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
 
 #define GET_F32_RS2C(insn, regs) (GET_F32_REG(insn, 2, regs))
 #define GET_F32_RS2S(insn, regs) (GET_F32_REG(RVC_RS2S(insn), 0, regs))
 #define GET_F64_RS2C(insn, regs) (GET_F64_REG(insn, 2, regs))
 #define GET_F64_RS2S(insn, regs) (GET_F64_REG(RVC_RS2S(insn), 0, regs))
 
+#define GET_F32_RS2C_OR_NAN(insn, regs) (GET_F32_REG_OR_NAN(insn, 2, regs))
+#define GET_F32_RS2S_OR_NAN(insn, regs) \
+	(GET_F32_REG_OR_NAN(RVC_RS2S(insn), 0, regs))
+#define GET_F64_RS2C_OR_NAN(insn, regs) (GET_F64_REG_OR_NAN(insn, 2, regs))
+#define GET_F64_RS2S_OR_NAN(insn, regs) \
+	(GET_F64_REG_OR_NAN(RVC_RS2S(insn), 0, regs))
+
 #endif
 
 #endif
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index e66dd52..fd2c12f 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -102,6 +102,8 @@ enum sbi_hart_csrs {
 	SBI_HART_CSR_CYCLE = 0,
 	SBI_HART_CSR_TIME,
 	SBI_HART_CSR_INSTRET,
+	SBI_HART_CSR_MENVCFG,
+	SBI_HART_CSR_SENVCFG,
 	SBI_HART_CSR_MAX,
 };
 
diff --git a/include/sbi/sbi_illegal_insn.h b/include/sbi/sbi_illegal_insn.h
index 5732e3c..a2b5737 100644
--- a/include/sbi/sbi_illegal_insn.h
+++ b/include/sbi/sbi_illegal_insn.h
@@ -13,6 +13,7 @@
 #include <sbi/sbi_types.h>
 
 struct sbi_trap_context;
+struct sbi_trap_regs;
 
 typedef int (*illegal_insn_func)(ulong insn, struct sbi_trap_regs *regs);
 
diff --git a/include/sbi/sbi_insn_emu.h b/include/sbi/sbi_insn_emu.h
new file mode 100644
index 0000000..3019d6d
--- /dev/null
+++ b/include/sbi/sbi_insn_emu.h
@@ -0,0 +1,65 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#ifndef __SBI_INSN_EMU_H__
+#define __SBI_INSN_EMU_H__
+
+#include <sbi/sbi_types.h>
+
+#if defined(CONFIG_EMU_ZBB) || defined(CONFIG_EMU_ZBS)
+int sbi_insn_emu_op_imm(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_op_imm truly_illegal_insn
+#endif
+
+#if defined(CONFIG_EMU_ZBA) || defined(CONFIG_EMU_ZBB) ||     \
+	defined(CONFIG_EMU_ZBC) || defined(CONFIG_EMU_ZBS) || \
+	defined(CONFIG_EMU_ZICOND)
+int sbi_insn_emu_op(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_op truly_illegal_insn
+#endif
+
+#if __riscv_xlen == 64 && (defined(CONFIG_EMU_ZBA) || defined(CONFIG_EMU_ZBB))
+int sbi_insn_emu_op_32(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_op_32 truly_illegal_insn
+#endif
+
+#if __riscv_xlen == 64 && (defined(CONFIG_EMU_ZBA) || defined(CONFIG_EMU_ZBB))
+int sbi_insn_emu_op_imm_32(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_op_imm_32 truly_illegal_insn
+#endif
+
+#ifdef CONFIG_EMU_ZCB
+int sbi_insn_emu_c_reserved(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_c_reserved truly_illegal_insn
+#endif
+
+#ifdef CONFIG_EMU_ZCB
+int sbi_insn_emu_c_misc_alu(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_c_misc_alu truly_illegal_insn
+#endif
+
+#ifdef CONFIG_EMU_ZCMOP
+int sbi_insn_emu_c_mop(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_c_mop truly_illegal_insn
+#endif
+
+#if defined(CONFIG_EMU_ZICBOM) || defined(CONFIG_EMU_ZICBOZ)
+int sbi_insn_emu_zicbom_zicboz(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_zicbom_zicboz truly_illegal_insn
+#endif
+
+#endif
diff --git a/include/sbi/sbi_insn_emu_fp.h b/include/sbi/sbi_insn_emu_fp.h
new file mode 100644
index 0000000..4f7014b
--- /dev/null
+++ b/include/sbi/sbi_insn_emu_fp.h
@@ -0,0 +1,29 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#ifndef __SBI_INSN_EMU_FP_H__
+#define __SBI_INSN_EMU_FP_H__
+
+#include <sbi/sbi_types.h>
+
+#ifdef CONFIG_EMU_ZFHMIN
+int sbi_insn_emu_load_fp(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_store_fp(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_load_fp truly_illegal_insn
+#define sbi_insn_emu_store_fp truly_illegal_insn
+#endif
+
+#if defined(CONFIG_EMU_ZFHMIN) || defined(CONFIG_EMU_ZFA)
+int sbi_insn_emu_op_fp(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_op_fp truly_illegal_insn
+#endif
+
+#endif
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index f1b4155..f35a897 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -44,8 +44,12 @@
 #define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
 /** Offset of hartindex member in sbi_scratch */
 #define SBI_SCRATCH_HARTINDEX_OFFSET		(14 * __SIZEOF_POINTER__)
+/** Number of masked bits for software-based pointer masking */
+#define SBI_SCRATCH_SW_PM			(15 * __SIZEOF_POINTER__)
+/** Offset of emulated SENVCFG CSR */
+#define SBI_SCRATCH_SW_SENVCFG			(16 * __SIZEOF_POINTER__)
 /** Offset of extra space in sbi_scratch */
-#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(15 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(17 * __SIZEOF_POINTER__)
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -87,6 +91,10 @@ struct sbi_scratch {
 	unsigned long options;
 	/** Index of the hart */
 	unsigned long hartindex;
+	/** Number of masked bits for software-based pointer masking */
+	unsigned long sw_pm;
+	/** Emulated SENVCFG CSR */
+	unsigned long sw_senvcfg;
 };
 
 /**
@@ -108,6 +116,8 @@ assert_member_offset(struct sbi_scratch, trap_context, SBI_SCRATCH_TRAP_CONTEXT_
 assert_member_offset(struct sbi_scratch, tmp0, SBI_SCRATCH_TMP0_OFFSET);
 assert_member_offset(struct sbi_scratch, options, SBI_SCRATCH_OPTIONS_OFFSET);
 assert_member_offset(struct sbi_scratch, hartindex, SBI_SCRATCH_HARTINDEX_OFFSET);
+assert_member_offset(struct sbi_scratch, sw_pm, SBI_SCRATCH_SW_PM);
+assert_member_offset(struct sbi_scratch, sw_senvcfg, SBI_SCRATCH_SW_SENVCFG);
 
 /** Possible options for OpenSBI library */
 enum sbi_scratch_options {
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 731a0c9..08bbeed 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -218,6 +218,8 @@ _Static_assert(
 #define GET_RS2S(insn, regs)		REG_VAL(GET_RS2S_NUM(insn), regs)
 #define GET_RS2C(insn, regs)		REG_VAL(GET_RS2C_NUM(insn), regs)
 #define SET_RD(insn, regs, val)		(REG_VAL(GET_RD_NUM(insn), regs) = (val))
+#define SET_RD1S(insn, regs, val)	(REG_VAL(GET_RS1S_NUM(insn), regs) = (val))
+#define SET_RD2S(insn, regs, val)	(REG_VAL(GET_RS2S_NUM(insn), regs) = (val))
 
 /** Representation of trap details */
 struct sbi_trap_info {
diff --git a/include/sbi_utils/cache/fdt_cmo_helper.h b/include/sbi_utils/cache/fdt_cmo_helper.h
index a6a28db..9257610 100644
--- a/include/sbi_utils/cache/fdt_cmo_helper.h
+++ b/include/sbi_utils/cache/fdt_cmo_helper.h
@@ -22,6 +22,13 @@ int fdt_cmo_private_flc_flush_all(void);
  */
 int fdt_cmo_llc_flush_all(void);
 
+/**
+ * Flush the cache (all levels) of the current hart
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_flush_all(void);
+
 /**
  * Initialize the cache devices for each hart
  *
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04b..59af180 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -69,4 +69,11 @@ config SBI_ECALL_SSE
 config SBI_ECALL_MPXY
 	bool "MPXY extension"
 	default y
+
+config SBI_ISA_EXT_EMU
+	bool "Enable ISA extension emulation"
+	default n
+
+source "$(OPENSBI_SRC_DIR)/lib/sbi/sbi_insn_emu.conf"
+
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 8abe1e8..07cfaa6 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -81,6 +81,8 @@ libsbi-objs-y += sbi_hfence.o
 libsbi-objs-y += sbi_hsm.o
 libsbi-objs-y += sbi_illegal_atomic.o
 libsbi-objs-y += sbi_illegal_insn.o
+libsbi-objs-y += sbi_insn_emu.o
+libsbi-objs-y += sbi_insn_emu_fp.o
 libsbi-objs-y += sbi_init.o
 libsbi-objs-y += sbi_ipi.o
 libsbi-objs-y += sbi_irqchip.o
diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
index c2253c8..e0e2373 100644
--- a/lib/sbi/sbi_emulate_csr.c
+++ b/lib/sbi/sbi_emulate_csr.c
@@ -76,6 +76,12 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
 			return SBI_ENOTSUPP;
 		*csr_val = csr_read(CSR_MINSTRET);
 		break;
+	case CSR_SENVCFG:
+		if (prev_mode == PRV_S && !virt)
+			*csr_val = scratch->sw_senvcfg;
+		else
+			ret = SBI_ENOTSUPP;
+		break;
 
 #if __riscv_xlen == 32
 	case CSR_HTIMEDELTAH:
@@ -162,6 +168,14 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
 		else
 			ret = SBI_ENOTSUPP;
 		break;
+	case CSR_SENVCFG:
+		if (prev_mode == PRV_S && !virt) {
+			struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+			scratch->sw_senvcfg = csr_val;
+		}
+		else
+			ret = SBI_ENOTSUPP;
+		break;
 #if __riscv_xlen == 32
 	case CSR_HTIMEDELTAH:
 		if (prev_mode == PRV_S && !virt)
diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index a2aefb9..92bf77d 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -216,9 +216,11 @@ static int fwft_get_sstack(struct fwft_config *conf, unsigned long *value)
 #if __riscv_xlen > 32
 static int fwft_pmlen_supported(struct fwft_config *conf)
 {
+#ifndef CONFIG_EMU_SUPM
 	if (!sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
 				    SBI_HART_EXT_SMNPM))
 		return SBI_ENOTSUPP;
+#endif
 
 	return SBI_OK;
 }
@@ -241,11 +243,28 @@ static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
 		return SBI_EINVAL;
 	}
 
+#ifdef CONFIG_EMU_SUPM
+	/* Reset emulated pointer masking */
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	scratch->sw_pm = 0;
+
+	/* Don't even try to change MENVCFG if absent */
+	if (!sbi_hart_has_csr(scratch, SBI_HART_CSR_MENVCFG)) {
+		scratch->sw_pm = value;
+		return SBI_OK;
+	}
+#endif
+
 	prev = csr_read_clear(CSR_MENVCFG, ENVCFG_PMM);
 	csr_set(CSR_MENVCFG, pmm);
 	if ((csr_read(CSR_MENVCFG) & ENVCFG_PMM) != pmm) {
 		csr_write(CSR_MENVCFG, prev);
+#ifdef CONFIG_EMU_SUPM
+		/* Instead of returning SBI_EINVAL, enable emulation */
+		scratch->sw_pm = value;
+#else
 		return SBI_EINVAL;
+#endif
 	}
 
 	return SBI_OK;
@@ -253,6 +272,21 @@ static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
 
 static int fwft_get_pmlen(struct fwft_config *conf, unsigned long *value)
 {
+#ifdef CONFIG_EMU_SUPM
+	/* Check for emulated pointer masking */
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	if (scratch->sw_pm) {
+		*value = scratch->sw_pm;
+		return SBI_OK;
+	}
+
+	/* Handle disabled pointer masking in the absence of MENVCFG */
+	if (!sbi_hart_has_csr(scratch, SBI_HART_CSR_MENVCFG)) {
+		*value = 0;
+		return SBI_OK;
+	}
+#endif
+
 	switch (csr_read(CSR_MENVCFG) & ENVCFG_PMM) {
 	case ENVCFG_PMM_PMLEN_0:
 		*value = 0;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index a91703b..113041b 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -964,6 +964,10 @@ __pmp_skip:
 	__check_csr_existence(CSR_CYCLE, SBI_HART_CSR_CYCLE);
 	__check_csr_existence(CSR_TIME, SBI_HART_CSR_TIME);
 	__check_csr_existence(CSR_INSTRET, SBI_HART_CSR_INSTRET);
+	__check_csr_existence(CSR_MENVCFG, SBI_HART_CSR_MENVCFG);
+	__check_csr_existence(CSR_SENVCFG, SBI_HART_CSR_SENVCFG);
+	/* Initialize value of emulated SENVCFG CSR */
+	scratch->sw_senvcfg = ENVCFG_CBZE | ENVCFG_CBCFE | ENVCFG_CBIE;
 
 #undef __check_csr_existence
 
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index ed51f4d..a328f68 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -2,9 +2,13 @@
  * SPDX-License-Identifier: BSD-2-Clause
  *
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2025 Benedikt Freisen*.
  *
  * Authors:
  *   Anup Patel <anup.patel@wdc.com>
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ *
+ * *) ISA extension emulation
  */
 
 #include <sbi/riscv_asm.h>
@@ -15,6 +19,8 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_illegal_atomic.h>
 #include <sbi/sbi_illegal_insn.h>
+#include <sbi/sbi_insn_emu.h>
+#include <sbi/sbi_insn_emu_fp.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
@@ -25,7 +31,7 @@ int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
 	struct sbi_trap_info trap;
 
 	trap.cause = CAUSE_ILLEGAL_INSTRUCTION;
-	trap.tval = insn;
+	trap.tval  = insn;
 	trap.tval2 = 0;
 	trap.tinst = 0;
 	trap.gva   = 0;
@@ -59,7 +65,8 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 	}
 #endif
 
-	return truly_illegal_insn(insn, regs);
+	/* Delegate Zicbom and Zicboz emulation */
+	return sbi_insn_emu_zicbom_zicboz(insn, regs);
 }
 
 static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
@@ -72,14 +79,29 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 	ulong csr_val, new_csr_val;
 
 	if (prev_mode == PRV_M) {
-		sbi_printf("%s: Failed to access CSR %#x from M-mode",
-			__func__, csr_num);
+		sbi_printf("%s: Failed to access CSR %#x from M-mode", __func__,
+			   csr_num);
 		return SBI_EFAIL;
 	}
 
 	/* Ensure that we got CSR read/write instruction */
 	int funct3 = GET_RM(insn);
 	if (funct3 == 0 || funct3 == 4) {
+		/* Handle "Zawrs" Wait-on-Reservation-Set */
+		if (insn == INSN_MATCH_WRS_NTO || insn == INSN_MATCH_WRS_STO) {
+			/* do nothing */
+			regs->mepc += 4;
+			return 0;
+		}
+		/* Handle "Zimop" May-Be-Operations */
+		if ((insn & INSN_MASK_MOP_R_N) == INSN_MATCH_MOP_R_N ||
+		    (insn & INSN_MASK_MOP_RR_N) == INSN_MATCH_MOP_RR_N) {
+			SET_RD(insn, regs, 0);
+			regs->mepc += 4;
+			return 0;
+		}
+
+		/* Otherwise treat this as an error */
 		sbi_printf("%s: Invalid opcode for CSR read/write instruction",
 			   __func__);
 		return truly_illegal_insn(insn, regs);
@@ -128,50 +150,77 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 }
 
 static const illegal_insn_func illegal_insn_table[32] = {
-	truly_illegal_insn, /* 0 */
-	truly_illegal_insn, /* 1 */
-	truly_illegal_insn, /* 2 */
-	misc_mem_opcode_insn, /* 3 */
-	truly_illegal_insn, /* 4 */
-	truly_illegal_insn, /* 5 */
-	truly_illegal_insn, /* 6 */
-	truly_illegal_insn, /* 7 */
-	truly_illegal_insn, /* 8 */
-	truly_illegal_insn, /* 9 */
-	truly_illegal_insn, /* 10 */
-	sbi_illegal_atomic, /* 11 */
-	truly_illegal_insn, /* 12 */
-	truly_illegal_insn, /* 13 */
-	truly_illegal_insn, /* 14 */
-	truly_illegal_insn, /* 15 */
-	truly_illegal_insn, /* 16 */
-	truly_illegal_insn, /* 17 */
-	truly_illegal_insn, /* 18 */
-	truly_illegal_insn, /* 19 */
-	truly_illegal_insn, /* 20 */
-	truly_illegal_insn, /* 21 */
-	truly_illegal_insn, /* 22 */
-	truly_illegal_insn, /* 23 */
-	truly_illegal_insn, /* 24 */
-	truly_illegal_insn, /* 25 */
-	truly_illegal_insn, /* 26 */
-	truly_illegal_insn, /* 27 */
-	system_opcode_insn, /* 28 */
-	truly_illegal_insn, /* 29 */
-	truly_illegal_insn, /* 30 */
-	truly_illegal_insn  /* 31 */
+	truly_illegal_insn,	/* 0 */
+	sbi_insn_emu_load_fp,	/* 1 */
+	truly_illegal_insn,	/* 2 */
+	misc_mem_opcode_insn,	/* 3 */
+	sbi_insn_emu_op_imm,	/* 4 */
+	truly_illegal_insn,	/* 5 */
+	sbi_insn_emu_op_imm_32, /* 6 */
+	truly_illegal_insn,	/* 7 */
+	truly_illegal_insn,	/* 8 */
+	sbi_insn_emu_store_fp,	/* 9 */
+	truly_illegal_insn,	/* 10 */
+	sbi_illegal_atomic,	/* 11 */
+	sbi_insn_emu_op,	/* 12 */
+	truly_illegal_insn,	/* 13 */
+	sbi_insn_emu_op_32,	/* 14 */
+	truly_illegal_insn,	/* 15 */
+	truly_illegal_insn,	/* 16 */
+	truly_illegal_insn,	/* 17 */
+	truly_illegal_insn,	/* 18 */
+	truly_illegal_insn,	/* 19 */
+	sbi_insn_emu_op_fp,	/* 20 */
+	truly_illegal_insn,	/* 21 */
+	truly_illegal_insn,	/* 22 */
+	truly_illegal_insn,	/* 23 */
+	truly_illegal_insn,	/* 24 */
+	truly_illegal_insn,	/* 25 */
+	truly_illegal_insn,	/* 26 */
+	truly_illegal_insn,	/* 27 */
+	system_opcode_insn,	/* 28 */
+	truly_illegal_insn,	/* 29 */
+	truly_illegal_insn,	/* 30 */
+	truly_illegal_insn	/* 31 */
+};
+
+static const illegal_insn_func illegal_insn16_table[24] = {
+	truly_illegal_insn,	 /* 0 */
+	truly_illegal_insn,	 /* 1 */
+	truly_illegal_insn,	 /* 2 */
+	truly_illegal_insn,	 /* 3 */
+	sbi_insn_emu_c_reserved, /* 4 */
+	truly_illegal_insn,	 /* 5 */
+	truly_illegal_insn,	 /* 6 */
+	truly_illegal_insn,	 /* 7 */
+	truly_illegal_insn,	 /* 8 */
+	truly_illegal_insn,	 /* 9 */
+	truly_illegal_insn,	 /* 10 */
+	sbi_insn_emu_c_mop,	 /* 11 */
+	sbi_insn_emu_c_misc_alu, /* 12 */
+	truly_illegal_insn,	 /* 13 */
+	truly_illegal_insn,	 /* 14 */
+	truly_illegal_insn,	 /* 15 */
+	truly_illegal_insn,	 /* 16 */
+	truly_illegal_insn,	 /* 17 */
+	truly_illegal_insn,	 /* 18 */
+	truly_illegal_insn,	 /* 19 */
+	truly_illegal_insn,	 /* 20 */
+	truly_illegal_insn,	 /* 21 */
+	truly_illegal_insn,	 /* 22 */
+	truly_illegal_insn	 /* 23 */
 };
 
 int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
 {
 	struct sbi_trap_regs *regs = &tcntx->regs;
-	ulong insn = tcntx->trap.tval;
+	ulong insn		   = tcntx->trap.tval;
 	struct sbi_trap_info uptrap;
 
 	/*
-	 * We only deal with 32-bit (or longer) illegal instructions. If we
-	 * see instruction is zero OR instruction is 16-bit then we fetch and
-	 * check the instruction encoding using unprivilege access.
+	 * We only deal with 32-bit (or longer) illegal instructions directly.
+	 * If we see instruction is zero OR instruction is 16-bit then we fetch
+	 * and check the instruction encoding using unprivilege access.
 	 *
 	 * The program counter (PC) in RISC-V world is always 2-byte aligned
 	 * so handling only 32-bit (or longer) illegal instructions also help
@@ -185,7 +234,8 @@ int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
 		if (uptrap.cause)
 			return sbi_trap_redirect(regs, &uptrap);
 		if ((insn & 3) != 3)
-			return truly_illegal_insn(insn, regs);
+			return illegal_insn16_table[(insn & 3) << 3 |
+						    insn >> 13](insn, regs);
 	}
 
 	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
diff --git a/lib/sbi/sbi_insn_emu.c b/lib/sbi/sbi_insn_emu.c
new file mode 100644
index 0000000..ffc3bad
--- /dev/null
+++ b/lib/sbi/sbi_insn_emu.c
@@ -0,0 +1,624 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_illegal_insn.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_trap_ldst.h>
+#include <sbi/sbi_unpriv.h>
+#include <sbi_utils/cache/fdt_cmo_helper.h>
+
+#define MASK_SHAMT32 0x1f
+#define MASK_SHAMT (__riscv_xlen - 1)
+#define GET_SHAMT32(insn) ((insn >> 20) & MASK_SHAMT32)
+#define GET_SHAMT(insn) ((insn >> 20) & MASK_SHAMT)
+
+#if defined(CONFIG_EMU_ZBB) || defined(CONFIG_EMU_ZBS)
+int sbi_insn_emu_op_imm(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
+#ifdef CONFIG_EMU_ZBS
+	/* Emulate Zbs immediate instructions */
+	case INSN_MATCH_BCLRI:
+#if __riscv_xlen == 64
+	case INSN_MATCH_BCLRI | 0x02000000:
+#endif
+		rd_val = rs1_val & ~(1ull << GET_SHAMT(insn));
+		break;
+	case INSN_MATCH_BEXTI:
+#if __riscv_xlen == 64
+	case INSN_MATCH_BEXTI | 0x02000000:
+#endif
+		rd_val = (rs1_val >> GET_SHAMT(insn)) & 1;
+		break;
+	case INSN_MATCH_BINVI:
+#if __riscv_xlen == 64
+	case INSN_MATCH_BINVI | 0x02000000:
+#endif
+		rd_val = rs1_val ^ (1ull << GET_SHAMT(insn));
+		break;
+	case INSN_MATCH_BSETI:
+#if __riscv_xlen == 64
+	case INSN_MATCH_BSETI | 0x02000000:
+#endif
+		rd_val = rs1_val | (1ull << GET_SHAMT(insn));
+		break;
+#endif
+#ifdef CONFIG_EMU_ZBB
+	/* Emulate Zbb immediate instructions */
+	case INSN_MATCH_RORI:
+#if __riscv_xlen == 64
+	case INSN_MATCH_RORI | 0x02000000:
+#endif
+		rd_val = rs1_val >> GET_SHAMT(insn) |
+			 rs1_val << (__riscv_xlen - GET_SHAMT(insn));
+		break;
+#endif
+	default:
+		switch (insn & INSN_MASK_ITYPE_RD_RS) {
+#ifdef CONFIG_EMU_ZBB
+		/* Emulate Zbb immediate instructions */
+		case INSN_MATCH_CLZ:
+			for (rd_val = 0; (long)rs1_val >= 0; rd_val++) {
+				rs1_val <<= 1;
+				if (rd_val == __riscv_xlen)
+					break;
+			}
+			break;
+		case INSN_MATCH_CTZ:
+			for (rd_val = 0; (rs1_val & 1) == 0; rd_val++) {
+				rs1_val >>= 1;
+				if (rd_val == __riscv_xlen)
+					break;
+			}
+			break;
+		case INSN_MATCH_CPOP:
+			for (rd_val = 0; rs1_val != 0; rs1_val <<= 1) {
+				if ((long)rs1_val < 0)
+					rd_val++;
+			}
+			break;
+		case INSN_MATCH_ORC_B:
+			rd_val = 0;
+			for (ulong mask = 0xff; mask != 0; mask <<= 8) {
+				if (rs1_val & mask)
+					rd_val |= mask;
+			}
+			break;
+#if __riscv_xlen == 64
+		case INSN_MATCH_REV8_RV64:
+#else
+		case INSN_MATCH_REV8_RV32:
+#endif
+			rd_val = 0;
+			for (int i = sizeof(rs1_val) - 1; i >= 0; i--) {
+				rd_val <<= 8;
+				rd_val |= rs1_val & 0xff;
+				rs1_val >>= 8;
+			}
+			break;
+		case INSN_MATCH_SEXT_B:
+			rd_val = (long)(s8)rs1_val;
+			break;
+		case INSN_MATCH_SEXT_H:
+			rd_val = (long)(s16)rs1_val;
+			break;
+#endif
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	SET_RD(insn, regs, rd_val);
+
+	regs->mepc += 4;
+
+	return 0;
+}
+#endif
+
+#if defined(CONFIG_EMU_ZBA) || defined(CONFIG_EMU_ZBB) ||     \
+	defined(CONFIG_EMU_ZBC) || defined(CONFIG_EMU_ZBS) || \
+	defined(CONFIG_EMU_ZICOND)
+int sbi_insn_emu_op(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rs2_val = GET_RS2(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
+#ifdef CONFIG_EMU_ZBS
+	/* Emulate Zbs register instructions */
+	case INSN_MATCH_BCLR:
+		rd_val = rs1_val & ~(1ull << (rs2_val & MASK_SHAMT));
+		break;
+	case INSN_MATCH_BEXT:
+		rd_val = (rs1_val >> (rs2_val & MASK_SHAMT)) & 1;
+		break;
+	case INSN_MATCH_BINV:
+		rd_val = rs1_val ^ (1ull << (rs2_val & MASK_SHAMT));
+		break;
+	case INSN_MATCH_BSET:
+		rd_val = rs1_val | (1ull << (rs2_val & MASK_SHAMT));
+		break;
+#endif
+#ifdef CONFIG_EMU_ZBB
+	/* Emulate Zbb register instructions */
+	case INSN_MATCH_ANDN:
+		rd_val = rs1_val & ~rs2_val;
+		break;
+	case INSN_MATCH_MAX:
+		rd_val = (long)rs1_val > (long)rs2_val ? rs1_val : rs2_val;
+		break;
+	case INSN_MATCH_MAXU:
+		rd_val = rs1_val > rs2_val ? rs1_val : rs2_val;
+		break;
+	case INSN_MATCH_MIN:
+		rd_val = (long)rs1_val < (long)rs2_val ? rs1_val : rs2_val;
+		break;
+	case INSN_MATCH_MINU:
+		rd_val = rs1_val < rs2_val ? rs1_val : rs2_val;
+		break;
+	case INSN_MATCH_ORN:
+		rd_val = rs1_val | ~rs2_val;
+		break;
+	case INSN_MATCH_ROL:
+		rd_val = rs1_val << (rs2_val & MASK_SHAMT) |
+			 rs1_val >> (__riscv_xlen - (rs2_val & MASK_SHAMT));
+		break;
+	case INSN_MATCH_ROR:
+		rd_val = rs1_val >> (rs2_val & MASK_SHAMT) |
+			 rs1_val << (__riscv_xlen - (rs2_val & MASK_SHAMT));
+		break;
+	case INSN_MATCH_XNOR:
+		rd_val = ~(rs1_val ^ rs2_val);
+		break;
+#endif
+#ifdef CONFIG_EMU_ZBA
+	/* Emulate Zba register instructions */
+	case INSN_MATCH_SH1ADD:
+		rd_val = rs2_val + (rs1_val << 1);
+		break;
+	case INSN_MATCH_SH2ADD:
+		rd_val = rs2_val + (rs1_val << 2);
+		break;
+	case INSN_MATCH_SH3ADD:
+		rd_val = rs2_val + (rs1_val << 3);
+		break;
+#endif
+#ifdef CONFIG_EMU_ZBC
+	/* Emulate Zbc instructions */
+	case INSN_MATCH_CLMUL:
+		rd_val = 0;
+		for (int i = 0; i < __riscv_xlen; i++) {
+			if ((rs2_val >> i) & 1)
+				rd_val ^= rs1_val << i;
+		}
+		break;
+	case INSN_MATCH_CLMULH:
+		rd_val = 0;
+		for (int i = 1; i <= __riscv_xlen; i++) {
+			if ((rs2_val >> i) & 1)
+				rd_val ^= rs1_val >> (__riscv_xlen - i);
+		}
+		break;
+	case INSN_MATCH_CLMULR:
+		rd_val = 0;
+		for (int i = 0; i < __riscv_xlen; i++) {
+			if ((rs2_val >> i) & 1)
+				rd_val ^= rs1_val >> (__riscv_xlen - i - 1);
+		}
+		break;
+#endif
+#ifdef CONFIG_EMU_ZICOND
+	/* Emulate Zicond instructions */
+	case INSN_MATCH_CZERO_EQZ:
+		rd_val = rs2_val ? rs1_val : 0;
+		break;
+	case INSN_MATCH_CZERO_NEZ:
+		rd_val = rs2_val ? 0 : rs1_val;
+		break;
+#endif
+	default:
+		switch (insn & INSN_MASK_ITYPE_RD_RS) {
+#if __riscv_xlen == 32 && defined(CONFIG_EMU_ZBB)
+		/* Emulate Zbb register instructions */
+		case INSN_MATCH_ZEXT_H_RV32:
+			rd_val = (u16)rs1_val;
+			break;
+#endif
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	SET_RD(insn, regs, rd_val);
+
+	regs->mepc += 4;
+
+	return 0;
+}
+#endif
+
+#if __riscv_xlen == 64 && (defined(CONFIG_EMU_ZBA) || defined(CONFIG_EMU_ZBB))
+int sbi_insn_emu_op_32(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rs2_val = GET_RS2(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
+#ifdef CONFIG_EMU_ZBA
+	/* Emulate Zba register word instructions */
+	case INSN_MATCH_ADD_UW:
+		rd_val = (rs1_val & 0xfffffffful) + rs2_val;
+		break;
+	case INSN_MATCH_SH1ADD_UW:
+		rd_val = rs2_val + ((rs1_val & 0xfffffffful) << 1);
+		break;
+	case INSN_MATCH_SH2ADD_UW:
+		rd_val = rs2_val + ((rs1_val & 0xfffffffful) << 2);
+		break;
+	case INSN_MATCH_SH3ADD_UW:
+		rd_val = rs2_val + ((rs1_val & 0xfffffffful) << 3);
+		break;
+#endif
+#ifdef CONFIG_EMU_ZBB
+	/* Emulate Zbb register word instructions */
+	case INSN_MATCH_ROLW:
+		rd_val = (s64)(s32)((u32)rs1_val << (rs2_val & MASK_SHAMT32) |
+				    (u32)rs1_val >>
+					    (32 - (rs2_val & MASK_SHAMT32)));
+		break;
+	case INSN_MATCH_RORW:
+		rd_val = (s64)(s32)((u32)rs1_val >> (rs2_val & MASK_SHAMT32) |
+				    (u32)rs1_val
+					    << (32 - (rs2_val & MASK_SHAMT32)));
+		break;
+#endif
+	default:
+		switch (insn & INSN_MASK_ITYPE_RD_RS) {
+#ifdef CONFIG_EMU_ZBB
+		/* Emulate Zbb register word instructions */
+		case INSN_MATCH_ZEXT_H_RV64:
+			rd_val = (u16)rs1_val;
+			break;
+#endif
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	SET_RD(insn, regs, rd_val);
+
+	regs->mepc += 4;
+
+	return 0;
+}
+#endif
+
+#if __riscv_xlen == 64 && (defined(CONFIG_EMU_ZBA) || defined(CONFIG_EMU_ZBB))
+int sbi_insn_emu_op_imm_32(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_ITYPE_RD_RS) {
+#ifdef CONFIG_EMU_ZBB
+	/* Emulate Zbb immediate word instructions */
+	case INSN_MATCH_CLZW:
+		for (rd_val = 0; (s32)rs1_val >= 0; rd_val++) {
+			rs1_val = (long)(s32)((u32)rs1_val << 1);
+			if (rd_val == 32)
+				break;
+		}
+		break;
+	case INSN_MATCH_CTZW:
+		for (rd_val = 0; (rs1_val & 1) == 0; rd_val++) {
+			rs1_val >>= 1;
+			if (rd_val == 32)
+				break;
+		}
+		break;
+	case INSN_MATCH_CPOPW:
+		for (rd_val  = 0; (s32)rs1_val != 0;
+		     rs1_val = (long)(s32)(rs1_val << 1)) {
+			if ((s32)rs1_val < 0)
+				rd_val++;
+		}
+		break;
+#endif
+	default:
+		switch (insn & INSN_MASK_SLLI_UW) {
+#ifdef CONFIG_EMU_ZBA
+		/* Emulate Zba immediate word instructions */
+		case INSN_MATCH_SLLI_UW:
+			rd_val = (ulong)(u32)rs1_val << GET_SHAMT(insn);
+			break;
+		case INSN_MATCH_RORIW:
+			rd_val =
+				(s64)(s32)((u32)rs1_val >> GET_SHAMT32(insn) |
+					   (u32)rs1_val
+						   << (32 - GET_SHAMT32(insn)));
+			break;
+#endif
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	SET_RD(insn, regs, rd_val);
+
+	regs->mepc += 4;
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_EMU_ZCB
+int sbi_insn_emu_c_reserved(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1S(insn, regs);
+	struct sbi_trap_info uptrap;
+	ulong val;
+
+	switch (insn & INSN_MASK_C_GENERIC_RXS_RXS) {
+	/* Emulate Zcb additional compressed instructions */
+	case INSN_MATCH_C_LBU:
+		val = sbi_load_u8((void *)rs1_val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_LBU + 0x40:
+		val = sbi_load_u8((void *)rs1_val + 1, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_LBU + 0x20:
+		val = sbi_load_u8((void *)rs1_val + 2, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_LBU + 0x60:
+		val = sbi_load_u8((void *)rs1_val + 3, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_LHU:
+		val = sbi_load_u16((void *)rs1_val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_LHU + 0x20:
+		val = sbi_load_u16((void *)rs1_val + 2, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_LH:
+		val = sbi_load_s16((void *)rs1_val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_LH + 0x20:
+		val = sbi_load_s16((void *)rs1_val + 2, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		SET_RD2S(insn, regs, val);
+		break;
+	case INSN_MATCH_C_SB:
+		val = GET_RS2S(insn, regs);
+		sbi_store_u8((void *)rs1_val, val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		break;
+	case INSN_MATCH_C_SB + 0x40:
+		val = GET_RS2S(insn, regs);
+		sbi_store_u8((void *)rs1_val + 1, val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		break;
+	case INSN_MATCH_C_SB + 0x20:
+		val = GET_RS2S(insn, regs);
+		sbi_store_u8((void *)rs1_val + 2, val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		break;
+	case INSN_MATCH_C_SB + 0x60:
+		val = GET_RS2S(insn, regs);
+		sbi_store_u8((void *)rs1_val + 3, val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		break;
+	case INSN_MATCH_C_SH:
+		val = GET_RS2S(insn, regs);
+		sbi_store_u16((void *)rs1_val, val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		break;
+	case INSN_MATCH_C_SH + 0x20:
+		val = GET_RS2S(insn, regs);
+		sbi_store_u16((void *)rs1_val + 2, val, &uptrap);
+		if (uptrap.cause)
+			return sbi_trap_redirect(regs, &uptrap);
+		break;
+	default:
+		return truly_illegal_insn(insn, regs);
+	}
+
+	regs->mepc += 2;
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_EMU_ZCMOP
+int sbi_insn_emu_c_mop(ulong insn, struct sbi_trap_regs *regs)
+{
+	/* Emulate Zcmop compressed may-be operations */
+	if ((insn & INSN_MASK_C_MOP_N) == INSN_MATCH_C_MOP_N) {
+		/* do nothing */
+		regs->mepc += 2;
+		return 0;
+	}
+
+	return truly_illegal_insn(insn, regs);
+}
+#endif
+
+#ifdef CONFIG_EMU_ZCB
+int sbi_insn_emu_c_misc_alu(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1S(insn, regs);
+
+	switch (insn & INSN_MASK_C_GENERIC_RXS) {
+	/* Emulate Zcb additional compressed instructions */
+	case INSN_MATCH_C_ZEXT_B:
+		SET_RD1S(insn, regs, (u8)rs1_val);
+		break;
+	case INSN_MATCH_C_SEXT_B:
+		SET_RD1S(insn, regs, (long)(s8)rs1_val);
+		break;
+	case INSN_MATCH_C_ZEXT_H:
+		SET_RD1S(insn, regs, (u16)rs1_val);
+		break;
+	case INSN_MATCH_C_SEXT_H:
+		SET_RD1S(insn, regs, (long)(s16)rs1_val);
+		break;
+#if __riscv_xlen == 64
+	case INSN_MATCH_C_ZEXT_W:
+		SET_RD1S(insn, regs, (u32)rs1_val);
+		break;
+#endif
+	case INSN_MATCH_C_NOT:
+		SET_RD1S(insn, regs, ~rs1_val);
+		break;
+	default:
+		switch (insn & INSN_MASK_C_GENERIC_RXS_RXS) {
+		case INSN_MATCH_C_MUL:
+			SET_RD1S(insn, regs,
+				 (long)rs1_val * (long)GET_RS2S(insn, regs));
+			break;
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	regs->mepc += 2;
+
+	return 0;
+}
+#endif
+
+#if defined(CONFIG_EMU_ZICBOM) || defined(CONFIG_EMU_ZICBOZ)
+static ulong read_senvcfg_or_emu(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	/* Return actual CSR value or emulation */
+	if (sbi_hart_has_csr(scratch, SBI_HART_CSR_SENVCFG))
+		return csr_read(CSR_SENVCFG);
+	else
+		/* For the time being, assume that the menvcfg value
+		 * for the logical AND is a suitable constant */
+		return scratch->sw_senvcfg &
+		       (ENVCFG_CBZE | ENVCFG_CBCFE | ENVCFG_CBIE);
+}
+
+static ulong read_menvcfg_or_emu(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	/* Return actual CSR value or emulation */
+	if (sbi_hart_has_csr(scratch, SBI_HART_CSR_MENVCFG))
+		return csr_read(CSR_MENVCFG);
+	else
+		/* For the time being, return a suitable constant */
+		return ENVCFG_CBZE | ENVCFG_CBCFE | ENVCFG_CBIE;
+}
+
+int sbi_insn_emu_zicbom_zicboz(ulong insn, struct sbi_trap_regs *regs)
+{
+	/* NOTE: Errata workarounds for fence instructions are handled in
+	 * misc_mem_opcode_insn. */
+
+	/* Emulate Zicbom and Zicboz */
+	switch (insn & INSN_MASK_CBO) {
+	case INSN_MATCH_CBO_ZERO: {
+		/* Check whether the instruction was even allowed */
+		ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
+		if ((prev_mode == PRV_U &&
+		     !(read_senvcfg_or_emu() & ENVCFG_CBZE)) ||
+		    (prev_mode == PRV_S &&
+		     !(read_menvcfg_or_emu() & ENVCFG_CBZE)))
+			return truly_illegal_insn(insn, regs);
+
+		u32 *addr =
+			(u32 *)(GET_RS1S(insn, regs) & 0xffffffffffffffc0ull);
+		struct sbi_trap_info uptrap;
+		/* Zero the 64 byte block */
+		for (int i = 0; i < 16; i++) {
+			sbi_store_u32(addr + i, 0, &uptrap);
+			if (uptrap.cause)
+				return sbi_trap_redirect(regs, &uptrap);
+		}
+		break;
+	}
+	case INSN_MATCH_CBO_CLEAN:
+	case INSN_MATCH_CBO_FLUSH: {
+		/* Check whether the instruction was even allowed */
+		ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
+		if ((prev_mode == PRV_U &&
+		     !(read_senvcfg_or_emu() & ENVCFG_CBCFE)) ||
+		    (prev_mode == PRV_S &&
+		     !(read_menvcfg_or_emu() & ENVCFG_CBCFE)))
+			return truly_illegal_insn(insn, regs);
+
+		/* Simply flush the entire cache */
+		fdt_cmo_flush_all();
+		/* NOTE: Depending on cache architecture and use case,
+		 * fdt_cmo_private_flc_flush_all might be sufficient. */
+
+		break;
+	}
+	case INSN_MATCH_CBO_INVAL: {
+		/* Check whether the instruction was even allowed */
+		ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
+		if ((prev_mode == PRV_U &&
+		     !(read_senvcfg_or_emu() & ENVCFG_CBIE)) ||
+		    (prev_mode == PRV_S &&
+		     !(read_menvcfg_or_emu() & ENVCFG_CBIE)))
+			return truly_illegal_insn(insn, regs);
+
+		/* Simply flush the entire cache */
+		fdt_cmo_flush_all();
+		/* NOTE: Depending on cache architecture and use case,
+		 * fdt_cmo_private_flc_flush_all might be sufficient. */
+
+		break;
+	}
+	default:
+		return truly_illegal_insn(insn, regs);
+	}
+
+	regs->mepc += 4;
+
+	return 0;
+}
+#endif
diff --git a/lib/sbi/sbi_insn_emu.conf b/lib/sbi/sbi_insn_emu.conf
new file mode 100644
index 0000000..3aeaa34
--- /dev/null
+++ b/lib/sbi/sbi_insn_emu.conf
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+if SBI_ISA_EXT_EMU
+
+config EMU_ALL
+	bool "All supported extensions"
+	default y
+	help
+	  Emulates all supported ISA extensions, i.e RVA23U64 and beyond.
+	select EMU_RVA23
+	select EMU_ZBC
+
+config EMU_RVA23
+	bool "All supported mandatory extensions of RVA23U64"
+	default n
+	help
+	  Emulates some ISA extensions required by the RVA23U64 profile, but not e.g. Zvfhmin.
+	  This feature requires RVV 1.0 vector hardware.
+	select EMU_RVB23
+	select EMU_ZVBB
+	select EMU_SUPM
+
+config EMU_RVB23
+	bool "All supported mandatory extensions of RVB23U64"
+	default n
+	help
+	  Emulates all ISA extensions required by the RVA22U64 profile on RVA20 CPUs.
+	select EMU_RVA22
+	select EMU_ZICOND
+	select EMU_ZIMOP
+	select EMU_ZAWRS
+	select EMU_ZFA
+	select EMU_ZCB
+	select EMU_ZCMOP
+
+config EMU_RVA22
+	bool "All supported mandatory extensions of RVA22U64"
+	default n
+	help
+	  Emulates all ISA extensions required by the RVA22U64 profile on RVA20 CPUs.
+	select EMU_ZICBOM
+	select EMU_ZICBOZ
+	select EMU_ZFHMIN
+	select EMU_ZBA
+	select EMU_ZBB
+	select EMU_ZBS
+
+config EMU_ZICBOM
+	bool "Zicbom"
+	default n
+	help
+	  Cache-block management instructions.
+	  Zicbom emulation depends on OpenSBI's FDT CMO helper library.
+	depends on SBI_ISA_EXT_EMU
+	select FDT_CACHE
+
+config EMU_ZICBOZ
+	bool "Zicboz"
+	default n
+	help
+	  Cache-block zero instructions.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZICOND
+	bool "Zicond"
+	default n
+	help
+	  Integer conditional operations.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZIMOP
+	bool "Zimop"
+	default n
+	help
+	  May-be-operations.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZAWRS
+	bool "Zawrs"
+	default n
+	help
+	  Wait-on-reservation-set instructucions.
+	  Loops containing WRS.STO or WRS.NTO will degrade to busy waiting.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZFA
+	bool "Zfa"
+	default n
+	help
+	  Additional floating-point instructions.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZFHMIN
+	bool "Zfhmin"
+	default n
+	help
+	  Half-precision floating-point.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZCB
+	bool "Zcb"
+	default n
+	help
+	  Additional compressed instructions.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZCMOP
+	bool "Zcmop"
+	default n
+	help
+	  Compressed may-be-operations.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZBA
+	bool "Zba"
+	default n
+	help
+	  Address generation.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZBB
+	bool "Zbb"
+	default n
+	help
+	  Basic bit-manipulation.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZBC
+	bool "Zbc"
+	default n
+	help
+	  Carry-less multiplication.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_ZBS
+	bool "Zbs"
+	default n
+	help
+	  Single-bit instructions.
+	depends on SBI_ISA_EXT_EMU
+
+config EMU_SUPM
+	bool "Supm"
+	default n
+	help
+	  Pointer masking, with the execution environment providing a means to
+	  select PMLEN=0 and PMLEN=7 at minimum.
+	  Pointer masking needs to be set up via SBI and relies on page faults.
+	depends on SBI_ISA_EXT_EMU
+
+endif
diff --git a/lib/sbi/sbi_insn_emu_fp.c b/lib/sbi/sbi_insn_emu_fp.c
new file mode 100644
index 0000000..48ee498
--- /dev/null
+++ b/lib/sbi/sbi_insn_emu_fp.c
@@ -0,0 +1,974 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_fp.h>
+#include <sbi/sbi_illegal_insn.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_trap_ldst.h>
+
+#ifdef CONFIG_EMU_ZFHMIN
+int sbi_insn_emu_load_fp(ulong insn, struct sbi_trap_regs *regs)
+{
+	struct sbi_trap_context *tcntx =
+		container_of(regs, struct sbi_trap_context, regs);
+
+	/* If floating point is available and insn is FLH,
+	 * simply use the misaligned load handler */
+	if ((regs->mstatus & MSTATUS_FS) != 0 &&
+	    (sbi_mstatus_prev_mode(regs->mstatus) != PRV_U ||
+	     (csr_read(CSR_SSTATUS) & SSTATUS_FS) != 0) &&
+	    (insn & INSN_MASK_FLH) == INSN_MATCH_FLH) {
+		tcntx->trap.cause = CAUSE_MISALIGNED_LOAD;
+		tcntx->trap.tval  = GET_RS1(insn, regs) + IMM_I(insn);
+		return sbi_misaligned_load_handler(tcntx);
+	}
+
+	return truly_illegal_insn(insn, regs);
+}
+
+int sbi_insn_emu_store_fp(ulong insn, struct sbi_trap_regs *regs)
+{
+	struct sbi_trap_context *tcntx =
+		container_of(regs, struct sbi_trap_context, regs);
+
+	/* If floating point is available and insn is FSH,
+	 * simply use the misaligned store handler */
+	if ((regs->mstatus & MSTATUS_FS) != 0 &&
+	    (sbi_mstatus_prev_mode(regs->mstatus) != PRV_U ||
+	     (csr_read(CSR_SSTATUS) & SSTATUS_FS) != 0) &&
+	    (insn & INSN_MASK_FSH) == INSN_MATCH_FSH) {
+		tcntx->trap.cause = CAUSE_MISALIGNED_LOAD;
+		tcntx->trap.tval  = GET_RS1(insn, regs) + IMM_S(insn);
+		return sbi_misaligned_store_handler(tcntx);
+	}
+
+	return truly_illegal_insn(insn, regs);
+}
+
+#define RM_FIELD_RNE 0
+#define RM_FIELD_RTZ 1
+#define RM_FIELD_RDN 2
+#define RM_FIELD_RUP 3
+#define RM_FIELD_RMM 4
+#define RM_FIELD_DYN 7
+
+#define FFLAG_INEXACT 0x01
+#define FFLAG_UNDERFLOW 0x02
+#define FFLAG_OVERFLOW 0x04
+#define FFLAG_DIVIDE_BY_ZERO 0x08
+#define FFLAG_INVALID_OPERATION 0x10
+
+static u32 convert_f16_to_f32(u16 val, u32 *fcsr)
+{
+	/* special case: +/- zero */
+	if ((val & 0x7fff) == 0)
+		return (u32)val << 16;
+	/* special case: +/- infinity */
+	if ((val & 0x7fff) == 0x7c00)
+		return ((s32)(s16)val << 13) | 0x7f800000;
+	/* special case: NaN => output canonical NaN */
+	if ((val & 0x7c00) == 0x7c00) {
+		/* handle signaling NaN */
+		if ((val & 0x0200) == 0)
+			*fcsr |= FFLAG_INVALID_OPERATION;
+		/* always return canonical NaN */
+		return 0x7fc00000;
+	}
+	/* generic case or denormalized */
+	u32 result = (((s32)(s16)val << 13) & 0x8fffffff) + 0x38000000;
+	/* normalize denormalized */
+	if ((val & 0x7c00) == 0) {
+		u32 signexp = result & 0xff800000;
+		result &= 0x007fffff;
+		while (!(result & 0x00800000)) {
+			signexp -= 0x00800000;
+			result <<= 1;
+		}
+		result = (signexp + 0x00800000) | (result & 0x007fffff);
+	}
+	return result;
+}
+
+static u64 convert_f16_to_f64(u16 val, u32 *fcsr)
+{
+	/* special case: +/- zero */
+	if ((val & 0x7fff) == 0)
+		return (u64)val << 48;
+	/* special case: +/- infinity */
+	if ((val & 0x7fff) == 0x7c00)
+		return ((s64)(s16)val << 42) | 0x7ff0000000000000;
+	/* special case: NaN => output canonical NaN */
+	if ((val & 0x7c00) == 0x7c00) {
+		/* handle signaling NaN */
+		if ((val & 0x0200) == 0)
+			*fcsr |= FFLAG_INVALID_OPERATION;
+		/* always return canonical NaN */
+		return 0x7ff8000000000000;
+	}
+	/* generic case or denormalized */
+	u64 result = (((s64)(s16)val << 42) & 0x81ffffffffffffff) +
+		     0x3f00000000000000;
+	/* normalize denormalized */
+	if ((val & 0x7c00) == 0) {
+		u64 signexp = result & 0xfff0000000000000;
+		result &= 0x000fffffffffffff;
+		while (!(result & 0x0010000000000000)) {
+			signexp -= 0x0010000000000000;
+			result <<= 1;
+		}
+		result = (signexp + 0x0010000000000000) |
+			 (result & 0x000fffffffffffff);
+	}
+	return result;
+}
+
+static u16 convert_f32_to_f16(u32 val, u32 *fcsr, int rm)
+{
+	/* rounding bias to be added below what will be the LSB:
+	 * sign, future LSB, rounding mode */
+	static const u32 rm_bias[2][2][5] = {
+		{ { 0x0fffffff, 0, 0, 0x1fffffff, 0x10000000 },
+		  { 0x10000000, 0, 0, 0x1fffffff, 0x10000000 } },
+		{ { 0x0fffffff, 0, 0x1fffffff, 0, 0x10000000 },
+		  { 0x10000000, 0, 0x1fffffff, 0, 0x10000000 } }
+	};
+
+	/* values above the threshold (with masked sign) become infinity,
+	 * unless the rounding mode says otherwise.
+	 * sign, rounding mode */
+	static const u32 inf_threshold[2][5] = {
+		{ 0x477fefff, 0x477fffff, 0x477fffff, 0x477fe000, 0x477fefff },
+		{ 0x477fefff, 0x477fffff, 0x477fe000, 0x477fffff, 0x477fefff }
+	};
+
+	/* the "infinity" value to be used.
+	 * sign, rounding mode */
+	static const u16 inf_or_max[2][5] = {
+		{ 0x7c00, 0x7bff, 0x7bff, 0x7c00, 0x7c00 },
+		{ 0xfc00, 0xfbff, 0xfc00, 0xfbff, 0xfc00 }
+	};
+
+	/* the "zero" value to be used.
+	 * sign, rounding mode */
+	static const u16 zero_or_one[2][5] = {
+		{ 0x0000, 0x0000, 0x0000, 0x0001, 0x0000 },
+		{ 0x8000, 0x8000, 0x8001, 0x8000, 0x8000 }
+	};
+
+	/* values below the threshold (with masked sign) become denormalized.
+	 * sign, rounding mode */
+	static const u32 subnorm_threshold[2][5] = {
+		{ 0x387fefff, 0x387fffff, 0x387fffff, 0x387fe000, 0x387fefff },
+		{ 0x387fefff, 0x387fffff, 0x387fe000, 0x387fffff, 0x387fefff }
+	};
+
+	int sign = val >> 31;
+
+	/* special case: +/- zero */
+	if ((val & 0x7fffffff) == 0)
+		return val >> 16;
+	/* special case: +/- infinity */
+	if ((val & 0x7fffffff) == 0x7f800000)
+		return (val >> 16) & 0xfc00;
+	/* special case for NaN */
+	if ((val & 0x7f800000) == 0x7f800000) {
+		/* handle signaling NaN */
+		if ((val & 0x00400000) == 0)
+			*fcsr |= FFLAG_INVALID_OPERATION;
+		/* always return canonical NaN */
+		return 0x7e00;
+	}
+	/* replace too small numbers with +/- 0 or +/- 1 */
+	if ((val & 0x7f800000) < 0x31800000) {
+		*fcsr |= FFLAG_UNDERFLOW | FFLAG_INEXACT;
+		return zero_or_one[sign][rm];
+	}
+	/* replace too big numbers with +/- infinity */
+	if ((val & 0x7fffffff) > inf_threshold[sign][rm]) {
+		*fcsr |= FFLAG_OVERFLOW | FFLAG_INEXACT;
+		return inf_or_max[sign][rm];
+	}
+	/* handle numbers that become denormalized */
+	if ((val & 0x7fffffff) <= subnorm_threshold[sign][rm]) {
+		int shiftval = 113 - ((val >> 23) & 0xff);
+		u32 mant     = (val & 0x007fffff) | 0x00800000;
+		/* set inexact flag if needed */
+		if (mant & (0x07ffffff >> (14 - shiftval)))
+			*fcsr |= FFLAG_UNDERFLOW | FFLAG_INEXACT;
+		return (sign << 15) |
+		       ((mant +
+			 (rm_bias[sign][(mant >> (13 + shiftval)) & 1][rm] >>
+			  (16 - shiftval))) >>
+			(13 + shiftval));
+	}
+	/* no special case */
+	if (val & 0x1fff)
+		*fcsr |= FFLAG_INEXACT;
+	return (sign << 15) | ((((val & 0x7f800000) - 0x38000000) >> 13) +
+			       (((val & 0x007fffff) +
+				 (rm_bias[sign][(val >> 13) & 1][rm] >> 16)) >>
+				13));
+}
+
+static u16 convert_f64_to_f16(u64 val, u32 *fcsr, int rm)
+{
+	/* rounding bias to be added below what will be the LSB:
+	 * sign, future LSB, rounding mode */
+	static const u64 rm_bias[2][2][5] = {
+		{ { 0x1ffffffffffffff, 0, 0, 0x3ffffffffffffff,
+		    0x200000000000000 },
+		  { 0x200000000000000, 0, 0, 0x3ffffffffffffff,
+		    0x200000000000000 } },
+		{ { 0x1ffffffffffffff, 0, 0x3ffffffffffffff, 0,
+		    0x200000000000000 },
+		  { 0x200000000000000, 0, 0x3ffffffffffffff, 0,
+		    0x200000000000000 } }
+	};
+
+	/* values above the threshold (with masked sign) become infinity,
+	 * unless the rounding mode says otherwise.
+	 * sign, rounding mode */
+	static const u64 inf_threshold[2][5] = {
+		{ 0x40effdffffffffff, 0x40efffffffffffff, 0x40efffffffffffff,
+		  0x40effc0000000000, 0x40effdffffffffff },
+		{ 0x40effdffffffffff, 0x40efffffffffffff, 0x40effc0000000000,
+		  0x40efffffffffffff, 0x40effdffffffffff }
+	};
+
+	/* the "infinity" value to be used.
+	 * sign, rounding mode */
+	static const u16 inf_or_max[2][5] = {
+		{ 0x7c00, 0x7bff, 0x7bff, 0x7c00, 0x7c00 },
+		{ 0xfc00, 0xfbff, 0xfc00, 0xfbff, 0xfc00 }
+	};
+
+	/* the "zero" value to be used.
+	 * sign, rounding mode */
+	static const u16 zero_or_one[2][5] = {
+		{ 0x0000, 0x0000, 0x0000, 0x0001, 0x0000 },
+		{ 0x8000, 0x8000, 0x8001, 0x8000, 0x8000 }
+	};
+
+	/* values below the threshold (with masked sign) become denormalized.
+	 * sign, rounding mode */
+	static const u64 subnorm_threshold[2][5] = {
+		{ 0x3f0ffdffffffffff, 0x3f0fffffffffffff, 0x3f0fffffffffffff,
+		  0x3f0ffc0000000000, 0x3f0ffdffffffffff },
+		{ 0x3f0ffdffffffffff, 0x3f0fffffffffffff, 0x3f0ffc0000000000,
+		  0x3f0fffffffffffff, 0x3f0ffdffffffffff }
+	};
+
+	int sign = val >> 63;
+
+	/* special case: +/- zero */
+	if ((val & 0x7fffffffffffffff) == 0)
+		return val >> 48;
+	/* special case: +/- infinity */
+	if ((val & 0x7fffffffffffffff) == 0x7ff0000000000000)
+		return (val >> 48) & 0xfc00;
+	/* special case for NaN */
+	if ((val & 0x7ff0000000000000) == 0x7ff0000000000000) {
+		/* handle signaling NaN */
+		if ((val & 0x0008000000000000) == 0)
+			*fcsr |= FFLAG_INVALID_OPERATION;
+		/* always return canonical NaN */
+		return 0x7e00;
+	}
+	/* replace too small numbers with +/- 0 or +/- 1 */
+	if ((val & 0x7ff0000000000000) < 0x3e30000000000000) {
+		*fcsr |= FFLAG_UNDERFLOW | FFLAG_INEXACT;
+		return zero_or_one[sign][rm];
+	}
+	/* replace too big numbers with +/- infinity */
+	if ((val & 0x7fffffffffffffff) > inf_threshold[sign][rm]) {
+		*fcsr |= FFLAG_OVERFLOW | FFLAG_INEXACT;
+		return inf_or_max[sign][rm];
+	}
+	/* handle numbers that become denormalized */
+	if ((val & 0x7fffffffffffffff) <= subnorm_threshold[sign][rm]) {
+		unsigned shiftval = 1009 - ((val >> 52) & 0x7ff);
+		u64 mant = (val & 0x000fffffffffffff) | 0x0010000000000000;
+		/* set inexact flag if needed */
+		if (mant & (0x00ffffffffffffff >> (14 - shiftval)))
+			*fcsr |= FFLAG_UNDERFLOW | FFLAG_INEXACT;
+		return (sign << 15) |
+		       ((mant +
+			 (rm_bias[sign][(mant >> (42 + shiftval)) & 1][rm] >>
+			  (16 - shiftval))) >>
+			(42 + shiftval));
+	}
+	/* no special case */
+	if (val & 0x3ffffffffff)
+		*fcsr |= FFLAG_INEXACT;
+	return (sign << 15) |
+	       ((((val & 0x7ff0000000000000) - 0x3f00000000000000) >> 42) +
+		(((val & 0x000fffffffffffff) +
+		  (rm_bias[sign][(val >> 42) & 1][rm] >> 16)) >>
+		 42));
+}
+#endif
+
+#ifdef CONFIG_EMU_ZFA
+static const u16 f16_imm_lut[32] = {
+	0xbc00, 0x0400, 0x0100, 0x0200, 0x1c00, 0x2000, 0x2c00, 0x3000,
+	0x3400, 0x3500, 0x3600, 0x3700, 0x3800, 0x3900, 0x3a00, 0x3b00,
+	0x3c00, 0x3d00, 0x3e00, 0x3f00, 0x4000, 0x4100, 0x4200, 0x4400,
+	0x4800, 0x4c00, 0x5800, 0x5c00, 0x7800, 0x7c00, 0x7c00, 0x7e00
+};
+
+static const u32 f32_imm_lut[32] = {
+	0xbf800000, 0x00800000, 0x37800000, 0x38000000, 0x3b800000, 0x3c000000,
+	0x3d800000, 0x3e000000, 0x3e800000, 0x3ea00000, 0x3ec00000, 0x3ee00000,
+	0x3f000000, 0x3f200000, 0x3f400000, 0x3f600000, 0x3f800000, 0x3fa00000,
+	0x3fc00000, 0x3fe00000, 0x40000000, 0x40200000, 0x40400000, 0x40800000,
+	0x41000000, 0x41800000, 0x43000000, 0x43800000, 0x47000000, 0x47800000,
+	0x7f800000, 0x7fc00000
+};
+
+static const u64 f64_imm_lut[32] = {
+	0xbc00000000000000, 0x0010000000000000, 0x3ef0000000000000,
+	0x3f00000000000000, 0x3f70000000000000, 0x3f80000000000000,
+	0x3fb0000000000000, 0x3fc0000000000000, 0x3fd0000000000000,
+	0x3fd4000000000000, 0x3fd8000000000000, 0x3fdc000000000000,
+	0x3fe0000000000000, 0x3fe4000000000000, 0x3fe8000000000000,
+	0x3fec000000000000, 0x3ff0000000000000, 0x3ff4000000000000,
+	0x3ff8000000000000, 0x3ffc000000000000, 0x4000000000000000,
+	0x4004000000000000, 0x4008000000000000, 0x4010000000000000,
+	0x4020000000000000, 0x4030000000000000, 0x4060000000000000,
+	0x4070000000000000, 0x40e0000000000000, 0x40f0000000000000,
+	0x7ff0000000000000, 0x7ff8000000000000
+};
+
+static u32 round_f32(u32 val, u32 *fcsr, int rm, bool set_nx)
+{
+	/* rounding bias to be added below what will be the LSB:
+	 * sign, future LSB, rounding mode */
+	static const u32 rm_bias[2][2][5] = {
+		{ { 0x3fffff, 0x000000, 0x000000, 0x7fffff, 0x400000 },
+		  { 0x400000, 0x000000, 0x000000, 0x7fffff, 0x400000 } },
+		{ { 0x3fffff, 0x000000, 0x7fffff, 0x000000, 0x400000 },
+		  { 0x400000, 0x000000, 0x7fffff, 0x000000, 0x400000 } }
+	};
+
+	/* values >= this (with masked sign) become at least +/- 1
+	 * sign, rounding mode */
+	static const u32 one_threshold[2][5] = {
+		{ 0x3effffff, 0x3f800000, 0x3f800000, 1, 0x3f000000 },
+		{ 0x3effffff, 0x3f800000, 1, 0x3f800000, 0x3f000000 }
+	};
+
+	/* handle +/- zero */
+	if ((val & 0x7fffffff) == 0)
+		return val;
+	/* handle NaNs */
+	if ((val & 0x7fffffff) > 0x7f800000) {
+		/* check for signaling NaN */
+		if (!(val & 0x00400000))
+			*fcsr |= FFLAG_INVALID_OPERATION;
+		/* return canonical NaN */
+		return 0x7fc00000;
+	}
+	/* handle values too big to have a fractional part */
+	if ((val & 0x7f800000) >= 0x4b000000)
+		return val;
+	/* handle values that can only yield 0 or 1 */
+	if ((val & 0x7fffffff) < 0x3f800000) {
+		if (set_nx)
+			*fcsr |= FFLAG_INEXACT;
+		if ((val & 0x7f800000) >= one_threshold[val >> 31][rm])
+			return (val & 0x80000000) | 0x3f800000;
+		return val & 0x80000000;
+	}
+	/* handle all other values */
+	unsigned sh = ((val & 0x7f800000) >> 23) - 127;
+	u32 new_val = (val & 0x7fffff) | 0x800000;
+	new_val += rm_bias[val >> 31][(new_val >> (23 - sh)) & 1][rm] >> sh;
+	new_val &= ~(0x7fffff >> sh);
+	if (new_val >= 0x1000000) {
+		new_val >>= 1;
+		new_val &= 0x7fffff;
+		new_val |= (val & 0x7f800000) + 0x00800000;
+	} else {
+		new_val &= 0x7fffff;
+		new_val |= val & 0x7f800000;
+	}
+	new_val |= val & 0x80000000;
+	if (set_nx && new_val != val)
+		*fcsr |= FFLAG_INEXACT;
+	return new_val;
+}
+
+static u64 round_f64(u64 val, u32 *fcsr, int rm, bool set_nx)
+{
+	/* rounding bias to be added below what will be the LSB:
+	 * sign, future LSB, rounding mode */
+	static const u64 rm_bias[2][2][5] = {
+		{ { 0x7ffffffffffff, 0, 0, 0xfffffffffffff, 0x8000000000000 },
+		  { 0x8000000000000, 0, 0, 0xfffffffffffff, 0x8000000000000 } },
+		{ { 0x7ffffffffffff, 0, 0xfffffffffffff, 0, 0x8000000000000 },
+		  { 0x8000000000000, 0, 0xfffffffffffff, 0, 0x8000000000000 } }
+	};
+
+	/* values >= this (with masked sign) become at least +/- 1
+	 * sign, rounding mode */
+	static const u64 one_threshold[2][5] = {
+		{ 0x3fdfffffffffffff, 0x3ff0000000000000, 0x3ff0000000000000, 1,
+		  0x3fe0000000000000 },
+		{ 0x3fdfffffffffffff, 0x3ff0000000000000, 1, 0x3ff0000000000000,
+		  0x3fe0000000000000 }
+	};
+
+	/* handle +/- zero */
+	if ((val & 0x7fffffffffffffff) == 0)
+		return val;
+	/* handle NaNs */
+	if ((val & 0x7fffffffffffffff) > 0x7ff0000000000000) {
+		/* check for signaling NaN */
+		if (!(val & 0x0008000000000000))
+			*fcsr |= FFLAG_INVALID_OPERATION;
+		/* return canonical NaN */
+		return 0x7ff8000000000000;
+	}
+	/* handle values too big to have a fractional part */
+	if ((val & 0x7ff0000000000000) >= 0x4330000000000000)
+		return val;
+	/* handle values that can only yield 0 or 1 */
+	if ((val & 0x7fffffffffffffff) < 0x3ff0000000000000) {
+		if (set_nx)
+			*fcsr |= FFLAG_INEXACT;
+		if ((val & 0x7ff0000000000000) >= one_threshold[val >> 63][rm])
+			return (val & 0x8000000000000000) | 0x3ff0000000000000;
+		return val & 0x8000000000000000;
+	}
+	/* handle all other values */
+	unsigned sh = ((val & 0x7ff0000000000000) >> 52) - 1023;
+	u64 new_val = (val & 0x000fffffffffffff) | 0x0010000000000000;
+	new_val += rm_bias[val >> 63][(new_val >> (52 - sh)) & 1][rm] >> sh;
+	new_val &= ~(0x000fffffffffffff >> sh);
+	if (new_val >= 0x0020000000000000) {
+		new_val >>= 1;
+		new_val &= 0x000fffffffffffff;
+		new_val |= (val & 0x7ff0000000000000) + 0x0010000000000000;
+	} else {
+		new_val &= 0x000fffffffffffff;
+		new_val |= val & 0x7ff0000000000000;
+	}
+	new_val |= val & 0x8000000000000000;
+	if (set_nx && new_val != val)
+		*fcsr |= FFLAG_INEXACT;
+	return new_val;
+}
+
+static u16 round_f16(u16 val, u32 *fcsr, int rm, bool set_nx)
+{
+	/* rounding bias to be added below what will be the LSB:
+	 * sign, future LSB, rounding mode */
+	static const u16 rm_bias[2][2][5] = {
+		{ { 0x1ff, 0x000, 0x000, 0x3ff, 0x200 },
+		  { 0x200, 0x000, 0x000, 0x3ff, 0x200 } },
+		{ { 0x1ff, 0x000, 0x3ff, 0x000, 0x200 },
+		  { 0x200, 0x000, 0x3ff, 0x000, 0x200 } }
+	};
+
+	/* values >= this (with masked sign) become at least +/- 1
+	 * sign, rounding mode */
+	static const u16 one_threshold[2][5] = {
+		{ 0x37ff, 0x3c00, 0x3c00, 0x0001, 0x3800 },
+		{ 0x37ff, 0x3c00, 0x0001, 0x3c00, 0x3800 }
+	};
+
+	/* handle +/- zero */
+	if ((val & 0x7fff) == 0)
+		return val;
+	/* handle NaNs */
+	if ((val & 0x7fff) > 0x7c00) {
+		/* check for signaling NaN */
+		if (!(val & 0x0200))
+			*fcsr |= FFLAG_INVALID_OPERATION;
+		/* return canonical NaN */
+		return 0x7e00;
+	}
+	/* handle values too big to have a fractional part */
+	if ((val & 0x7c00) >= 0x6400)
+		return val;
+	/* handle values that can only yield 0 or 1 */
+	if ((val & 0x7fff) < 0x3c00) {
+		if (set_nx)
+			*fcsr |= FFLAG_INEXACT;
+		if ((val & 0x7fff) >= one_threshold[val >> 15][rm])
+			return (val & 0x8000) | 0x3c00;
+		return val & 0x8000;
+	}
+	/* handle all other values */
+	unsigned sh = ((val & 0x7c00) >> 10) - 15;
+	u16 new_val = (val & 0x3ff) | 0x400;
+	new_val += rm_bias[val >> 15][(new_val >> (10 - sh)) & 1][rm] >> sh;
+	new_val &= ~(0x3ff >> sh);
+	if (new_val >= 0x800) {
+		new_val >>= 1;
+		new_val &= 0x3ff;
+		new_val |= (val & 0x7c00) + 0x0400;
+	} else {
+		new_val &= 0x3ff;
+		new_val |= val & 0x7c00;
+	}
+	new_val |= val & 0x8000;
+	if (set_nx && new_val != val)
+		*fcsr |= FFLAG_INEXACT;
+	return new_val;
+}
+
+static s32 fcvtmod_f64(u64 val, u32 *fcsr)
+{
+	bool sign = val >> 63;
+	val &= 0x7fffffffffffffff;
+
+	/* handle +/- zero */
+	if (val == 0)
+		return 0;
+
+	int exp = ((val >> 52) & 0x7ff) - 1023;
+	/* handle values that become zero */
+	if (exp < 0) {
+		*fcsr |= FFLAG_INEXACT;
+		return 0;
+	}
+	/* handle all bigger values */
+	/* handle overflow */
+	if (exp > 31)
+		*fcsr |= FFLAG_INVALID_OPERATION;
+	/* handle values so big that all relevant lower bits are 0 */
+	if (exp > 52 + 31)
+		return 0;
+
+	u64 mant = (val & 0x000fffffffffffff) | 0x0010000000000000;
+
+	/* handle all other values */
+	if (exp >= 52) {
+		mant = mant << (exp - 52);
+	} else {
+		if ((mant & (0x000fffffffffffff >> exp)) != 0)
+			*fcsr |= FFLAG_INEXACT;
+		mant = mant >> (52 - exp);
+	}
+	mant &= 0x7fffffff;
+	return sign ? -mant : mant;
+}
+
+static u32 f32_handle_and_signal_nans(u32 rs1, u32 rs2)
+{
+	u32 val = 0;
+	/* check first and second operand for NaN */
+	if ((rs1 & 0x7fffffff) > 0x7f800000) {
+		/* set canonical NaN */
+		val = 0x7fc00000;
+		/* check for signaling NaN */
+		if (!(rs1 & 0x00400000))
+			SET_FCSR(GET_FCSR() | FFLAG_INVALID_OPERATION);
+	} else if ((rs2 & 0x7fffffff) > 0x7f800000) {
+		/* set canonical NaN */
+		val = 0x7fc00000;
+		/* check for signaling NaN */
+		if (!(rs2 & 0x00400000))
+			SET_FCSR(GET_FCSR() | FFLAG_INVALID_OPERATION);
+	}
+	return val;
+}
+
+static u64 f64_handle_and_signal_nans(u64 rs1, u64 rs2)
+{
+	u64 val = 0;
+	/* check first and second operand for NaN */
+	if ((rs1 & 0x7fffffffffffffff) > 0x7ff0000000000000) {
+		/* set canonical NaN */
+		val = 0x7ff8000000000000;
+		/* check for signaling NaN */
+		if (!(rs1 & 0x0008000000000000))
+			SET_FCSR(GET_FCSR() | FFLAG_INVALID_OPERATION);
+	} else if ((rs2 & 0x7fffffffffffffff) > 0x7ff0000000000000) {
+		/* set canonical NaN */
+		val = 0x7ff8000000000000;
+		/* check for signaling NaN */
+		if (!(rs2 & 0x0008000000000000))
+			SET_FCSR(GET_FCSR() | FFLAG_INVALID_OPERATION);
+	}
+	return val;
+}
+
+static u16 f16_handle_and_signal_nans(u16 rs1, u16 rs2)
+{
+	u16 val = 0;
+	/* check first and second operand for NaN */
+	if ((rs1 & 0x7fff) > 0x7c00) {
+		/* set canonical NaN */
+		val = 0x7e00;
+		/* check for signaling NaN */
+		if (!(rs1 & 0x0200))
+			SET_FCSR(GET_FCSR() | FFLAG_INVALID_OPERATION);
+	} else if ((rs2 & 0x7fff) > 0x7c00) {
+		/* set canonical NaN */
+		val = 0x7e00;
+		/* check for signaling NaN */
+		if (!(rs2 & 0x0200))
+			SET_FCSR(GET_FCSR() | FFLAG_INVALID_OPERATION);
+	}
+	return val;
+}
+#endif
+
+#if defined(CONFIG_EMU_ZFHMIN) || defined(CONFIG_EMU_ZFA)
+int sbi_insn_emu_op_fp(ulong insn, struct sbi_trap_regs *regs)
+{
+	u64 val;
+	u32 fcsr;
+
+	/* do not emulate floating point instructions when disabled */
+	if ((regs->mstatus & MSTATUS_FS) == 0 ||
+	    (sbi_mstatus_prev_mode(regs->mstatus) == PRV_U &&
+	     (csr_read(CSR_SSTATUS) & SSTATUS_FS) == 0))
+		return truly_illegal_insn(insn, regs);
+
+	switch (insn & INSN_MASK_ITYPE_RD_RS) {
+#ifdef CONFIG_EMU_ZFHMIN
+	/* Emulate Zfhmin instructions */
+	case INSN_MATCH_FCVT_S_H | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FCVT_S_H | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FCVT_S_H | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FCVT_S_H | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FCVT_S_H | (RM_FIELD_RMM << 12):
+	case INSN_MATCH_FCVT_S_H | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		val = GET_F16_RS1_OR_NAN(insn, regs);
+		val = convert_f16_to_f32(val, &fcsr);
+		SET_F32_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FCVT_H_S | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FCVT_H_S | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FCVT_H_S | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FCVT_H_S | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FCVT_H_S | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F32_RS1_OR_NAN(insn, regs);
+		val  = convert_f32_to_f16(val, &fcsr, GET_RM(insn));
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FCVT_H_S | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F32_RS1_OR_NAN(insn, regs);
+		val = convert_f32_to_f16(val, &fcsr, (fcsr >> 5) & 7);
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FCVT_D_H | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FCVT_D_H | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FCVT_D_H | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FCVT_D_H | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FCVT_D_H | (RM_FIELD_RMM << 12):
+	case INSN_MATCH_FCVT_D_H | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		val = GET_F16_RS1_OR_NAN(insn, regs);
+		val = convert_f16_to_f64(val, &fcsr);
+		SET_F64_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FCVT_H_D | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FCVT_H_D | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FCVT_H_D | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FCVT_H_D | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FCVT_H_D | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F64_RS1_OR_NAN(insn, regs);
+		val  = convert_f64_to_f16(val, &fcsr, GET_RM(insn));
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FCVT_H_D | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F64_RS1_OR_NAN(insn, regs);
+		val = convert_f64_to_f16(val, &fcsr, (fcsr >> 5) & 7);
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FMV_X_H:
+		val = GET_F16_RS1(insn, regs);
+		SET_RD(insn, regs, (ulong)(long)(s16)(u16)val);
+		break;
+	case INSN_MATCH_FMV_H_X:
+		val = GET_RS1(insn, regs);
+		SET_F16_RD(insn, regs, val);
+		break;
+#endif
+#ifdef CONFIG_EMU_ZFA
+	/* Emulate Zfa instructions */
+	case INSN_MATCH_FLI_H:
+		val = GET_RS1_NUM(insn);
+		val = f16_imm_lut[val];
+		SET_F16_RD(insn, regs, val);
+		break;
+	case INSN_MATCH_FLI_S:
+		val = GET_RS1_NUM(insn);
+		val = f32_imm_lut[val];
+		SET_F32_RD(insn, regs, val);
+		break;
+	case INSN_MATCH_FLI_D:
+		val = GET_RS1_NUM(insn);
+		val = f64_imm_lut[val];
+		SET_F64_RD(insn, regs, val);
+		break;
+	case INSN_MATCH_FROUND_S | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FROUND_S | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FROUND_S | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FROUND_S | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FROUND_S | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F32_RS1_OR_NAN(insn, regs);
+		val  = round_f32(val, &fcsr, GET_RM(insn), false);
+		SET_F32_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUND_S | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F32_RS1_OR_NAN(insn, regs);
+		val = round_f32(val, &fcsr, (fcsr >> 5) & 7, false);
+		SET_F32_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUNDNX_S | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FROUNDNX_S | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FROUNDNX_S | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FROUNDNX_S | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FROUNDNX_S | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F32_RS1_OR_NAN(insn, regs);
+		val  = round_f32(val, &fcsr, GET_RM(insn), true);
+		SET_F32_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUNDNX_S | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F32_RS1_OR_NAN(insn, regs);
+		val = round_f32(val, &fcsr, (fcsr >> 5) & 7, true);
+		SET_F32_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUND_D | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FROUND_D | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FROUND_D | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FROUND_D | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FROUND_D | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F64_RS1_OR_NAN(insn, regs);
+		val  = round_f64(val, &fcsr, GET_RM(insn), false);
+		SET_F64_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUND_D | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F64_RS1_OR_NAN(insn, regs);
+		val = round_f64(val, &fcsr, (fcsr >> 5) & 7, false);
+		SET_F64_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUNDNX_D | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FROUNDNX_D | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FROUNDNX_D | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FROUNDNX_D | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FROUNDNX_D | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F64_RS1_OR_NAN(insn, regs);
+		val  = round_f64(val, &fcsr, GET_RM(insn), true);
+		SET_F64_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUNDNX_D | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F64_RS1_OR_NAN(insn, regs);
+		val = round_f64(val, &fcsr, (fcsr >> 5) & 7, true);
+		SET_F64_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUND_H | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FROUND_H | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FROUND_H | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FROUND_H | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FROUND_H | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F16_RS1_OR_NAN(insn, regs);
+		val  = round_f16(val, &fcsr, GET_RM(insn), false);
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUND_H | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F16_RS1_OR_NAN(insn, regs);
+		val = round_f16(val, &fcsr, (fcsr >> 5) & 7, false);
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUNDNX_H | (RM_FIELD_RNE << 12):
+	case INSN_MATCH_FROUNDNX_H | (RM_FIELD_RTZ << 12):
+	case INSN_MATCH_FROUNDNX_H | (RM_FIELD_RDN << 12):
+	case INSN_MATCH_FROUNDNX_H | (RM_FIELD_RUP << 12):
+	case INSN_MATCH_FROUNDNX_H | (RM_FIELD_RMM << 12):
+		fcsr = GET_FCSR();
+		val  = GET_F16_RS1_OR_NAN(insn, regs);
+		val  = round_f16(val, &fcsr, GET_RM(insn), true);
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FROUNDNX_H | (RM_FIELD_DYN << 12):
+		fcsr = GET_FCSR();
+		if ((fcsr & 0xe0) == 0xa0 || (fcsr & 0xe0) == 0xc0)
+			return truly_illegal_insn(insn, regs);
+		val = GET_F16_RS1_OR_NAN(insn, regs);
+		val = round_f16(val, &fcsr, (fcsr >> 5) & 7, true);
+		SET_F16_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+	case INSN_MATCH_FCVTMOD_W_D:
+		fcsr = GET_FCSR();
+		val  = GET_F64_RS1_OR_NAN(insn, regs);
+		val  = (s64)fcvtmod_f64(val, &fcsr);
+		SET_RD(insn, regs, val);
+		SET_FCSR(fcsr);
+		break;
+#endif
+	default:
+		switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
+#ifdef CONFIG_EMU_ZFA
+		case INSN_MATCH_FMINM_H: {
+			u16 rs1 = GET_F16_RS1_OR_NAN(insn, regs);
+			u16 rs2 = GET_F16_RS2_OR_NAN(insn, regs);
+			if (!(val = f16_handle_and_signal_nans(rs1, rs2)))
+				val = ((rs1 < rs2) ^ ((rs1 | rs2) >> 15)) ? rs1
+									  : rs2;
+			SET_F16_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FMAXM_H: {
+			u16 rs1 = GET_F16_RS1_OR_NAN(insn, regs);
+			u16 rs2 = GET_F16_RS2_OR_NAN(insn, regs);
+			if (!(val = f16_handle_and_signal_nans(rs1, rs2)))
+				val = ((rs1 > rs2) ^ ((rs1 | rs2) >> 15)) ? rs1
+									  : rs2;
+			SET_F16_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FMINM_S: {
+			u32 rs1 = GET_F32_RS1_OR_NAN(insn, regs);
+			u32 rs2 = GET_F32_RS2_OR_NAN(insn, regs);
+			if (!(val = f32_handle_and_signal_nans(rs1, rs2)))
+				val = ((rs1 < rs2) ^ ((rs1 | rs2) >> 31)) ? rs1
+									  : rs2;
+			SET_F32_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FMAXM_S: {
+			u32 rs1 = GET_F32_RS1_OR_NAN(insn, regs);
+			u32 rs2 = GET_F32_RS2_OR_NAN(insn, regs);
+			if (!(val = f32_handle_and_signal_nans(rs1, rs2)))
+				val = ((rs1 > rs2) ^ ((rs1 | rs2) >> 31)) ? rs1
+									  : rs2;
+			SET_F32_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FMINM_D: {
+			u64 rs1 = GET_F64_RS1_OR_NAN(insn, regs);
+			u64 rs2 = GET_F64_RS2_OR_NAN(insn, regs);
+			if (!(val = f64_handle_and_signal_nans(rs1, rs2)))
+				val = ((rs1 < rs2) ^ ((rs1 | rs2) >> 63)) ? rs1
+									  : rs2;
+			SET_F64_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FMAXM_D: {
+			u64 rs1 = GET_F64_RS1_OR_NAN(insn, regs);
+			u64 rs2 = GET_F64_RS2_OR_NAN(insn, regs);
+			if (!(val = f64_handle_and_signal_nans(rs1, rs2)))
+				val = ((rs1 > rs2) ^ ((rs1 | rs2) >> 63)) ? rs1
+									  : rs2;
+			SET_F64_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FLTQ_H: {
+			u16 rs1 = GET_F16_RS1_OR_NAN(insn, regs);
+			u16 rs2 = GET_F16_RS2_OR_NAN(insn, regs);
+			if ((val = !f16_handle_and_signal_nans(rs1, rs2)))
+				val = (rs1 < rs2) ^ ((rs1 | rs2) >> 15);
+			SET_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FLEQ_H: {
+			u16 rs1 = GET_F16_RS1_OR_NAN(insn, regs);
+			u16 rs2 = GET_F16_RS2_OR_NAN(insn, regs);
+			if ((val = !f16_handle_and_signal_nans(rs1, rs2)))
+				val = !((rs1 > rs2) ^ ((rs1 | rs2) >> 15));
+			SET_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FLTQ_S: {
+			u32 rs1 = GET_F32_RS1_OR_NAN(insn, regs);
+			u32 rs2 = GET_F32_RS2_OR_NAN(insn, regs);
+			if ((val = !f32_handle_and_signal_nans(rs1, rs2)))
+				val = (rs1 < rs2) ^ ((rs1 | rs2) >> 31);
+			SET_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FLEQ_S: {
+			u32 rs1 = GET_F32_RS1_OR_NAN(insn, regs);
+			u32 rs2 = GET_F32_RS2_OR_NAN(insn, regs);
+			if ((val = !f32_handle_and_signal_nans(rs1, rs2)))
+				val = !((rs1 > rs2) ^ ((rs1 | rs2) >> 31));
+			SET_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FLTQ_D: {
+			u64 rs1 = GET_F64_RS1_OR_NAN(insn, regs);
+			u64 rs2 = GET_F64_RS2_OR_NAN(insn, regs);
+			if ((val = !f64_handle_and_signal_nans(rs1, rs2)))
+				val = (rs1 < rs2) ^ ((rs1 | rs2) >> 63);
+			SET_RD(insn, regs, val);
+			break;
+		}
+		case INSN_MATCH_FLEQ_D: {
+			u64 rs1 = GET_F64_RS1_OR_NAN(insn, regs);
+			u64 rs2 = GET_F64_RS2_OR_NAN(insn, regs);
+			if ((val = !f64_handle_and_signal_nans(rs1, rs2)))
+				val = !((rs1 > rs2) ^ ((rs1 | rs2) >> 63));
+			SET_RD(insn, regs, val);
+			break;
+		}
+#endif
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	regs->mepc += 4;
+
+	return 0;
+}
+#endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d..33045b7 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -285,6 +285,19 @@ static int sbi_trap_aia_irq(void)
 	return 0;
 }
 
+#if __riscv_xlen > 32 && defined(CONFIG_EMU_SUPM)
+static inline bool sbi_pm_changes_ptr(ulong ptr, struct sbi_scratch *scratch)
+{
+	return scratch->sw_pm &&
+	       ptr != (ulong)((long)(ptr << scratch->sw_pm) >> scratch->sw_pm);
+}
+
+static inline void sbi_mask_ptr(ulong *pptr, struct sbi_scratch *scratch)
+{
+	*pptr = (long)(*pptr << scratch->sw_pm) >> scratch->sw_pm;
+}
+#endif
+
 /**
  * Handle trap/interrupt
  *
@@ -345,11 +358,29 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
 		msg = "ecall handler failed";
 		break;
 	case CAUSE_LOAD_ACCESS:
+#if __riscv_xlen > 32 && defined(CONFIG_EMU_SUPM)
+		if (sbi_pm_changes_ptr(trap->tval, scratch)) {
+			sbi_mask_ptr(&tcntx->trap.tval, scratch);
+			/* redirect to misaligned load handler */
+			rc  = sbi_misaligned_load_handler(tcntx);
+			msg = "pointer masking load handler failed";
+			break;
+		}
+#endif
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_LOAD);
 		rc  = sbi_load_access_handler(tcntx);
 		msg = "load fault handler failed";
 		break;
 	case CAUSE_STORE_ACCESS:
+#if __riscv_xlen > 32 && defined(CONFIG_EMU_SUPM)
+		if (sbi_pm_changes_ptr(trap->tval, scratch)) {
+			sbi_mask_ptr(&tcntx->trap.tval, scratch);
+			/* redirect to misaligned store handler */
+			rc  = sbi_misaligned_store_handler(tcntx);
+			msg = "pointer masking store handler failed";
+			break;
+		}
+#endif
 		sbi_pmu_ctr_incr_fw(SBI_PMU_FW_ACCESS_STORE);
 		rc  = sbi_store_access_handler(tcntx);
 		msg = "store fault handler failed";
@@ -358,6 +389,47 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
 		rc  = sbi_double_trap_handler(tcntx);
 		msg = "double trap handler failed";
 		break;
+#if __riscv_xlen > 32 && defined(CONFIG_EMU_SUPM)
+	case CAUSE_FETCH_PAGE_FAULT:
+		if (sbi_pm_changes_ptr(regs->mepc, scratch)) {
+			/* mask the program counter and try to continue */
+			sbi_mask_ptr(&regs->mepc, scratch);
+			rc  = 0;
+			msg = "pointer masking fetch handler failed";
+		}
+		else {
+			/* If the trap came from S or U mode, redirect it there */
+			msg = "trap redirect failed (fetch page fault)";
+			rc  = sbi_trap_redirect(regs, trap);
+		}
+		break;
+	case CAUSE_LOAD_PAGE_FAULT:
+		if (sbi_pm_changes_ptr(trap->tval, scratch)) {
+			sbi_mask_ptr(&tcntx->trap.tval, scratch);
+			/* redirect to misaligned load handler */
+			rc  = sbi_misaligned_load_handler(tcntx);
+			msg = "pointer masking load handler failed";
+		}
+		else {
+			/* If the trap came from S or U mode, redirect it there */
+			msg = "trap redirect failed (load page fault)";
+			rc  = sbi_trap_redirect(regs, trap);
+		}
+		break;
+	case CAUSE_STORE_PAGE_FAULT:
+		if (sbi_pm_changes_ptr(trap->tval, scratch)) {
+			sbi_mask_ptr(&tcntx->trap.tval, scratch);
+			/* redirect to misaligned store handler */
+			rc  = sbi_misaligned_store_handler(tcntx);
+			msg = "pointer masking store handler failed";
+		}
+		else {
+			/* If the trap came from S or U mode, redirect it there */
+			msg = "trap redirect failed (store page fault)";
+			rc  = sbi_trap_redirect(regs, trap);
+		}
+		break;
+#endif
 	default:
 		/* If the trap came from S or U mode, redirect it there */
 		msg = "trap redirect failed";
diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index 448406b..9c72963 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -95,6 +95,9 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 	} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
 		fp  = 1;
 		len = 4;
+	} else if ((insn & INSN_MASK_FLH) == INSN_MATCH_FLH) {
+		fp  = 1;
+		len = 2;
 #endif
 	} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
 		len   = 2;
@@ -161,8 +164,10 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 #ifdef __riscv_flen
 		else if (len == 8)
 			SET_F64_RD(insn, regs, val.data_u64);
-		else
+		else if (len == 4)
 			SET_F32_RD(insn, regs, val.data_ulong);
+		else
+			SET_F16_RD(insn, regs, val.data_ulong);
 #endif
 	}
 
@@ -217,6 +222,9 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 	} else if ((insn & INSN_MASK_FSW) == INSN_MATCH_FSW) {
 		len	       = 4;
 		val.data_ulong = GET_F32_RS2(insn, regs);
+	} else if ((insn & INSN_MASK_FSH) == INSN_MATCH_FSH) {
+		len	       = 2;
+		val.data_ulong = GET_F16_RS2(insn, regs);
 #endif
 	} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
 		len = 2;
diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
index d87bab7..bfbfdae 100644
--- a/lib/utils/cache/fdt_cmo_helper.c
+++ b/lib/utils/cache/fdt_cmo_helper.c
@@ -41,6 +41,21 @@ int fdt_cmo_llc_flush_all(void)
 	return cache_flush_all(llc);
 }
 
+int fdt_cmo_flush_all(void)
+{
+	struct cache_device *c = get_hart_flc(sbi_scratch_thishart_ptr());
+	int result	       = SBI_ENODEV;
+
+	while (c) {
+		result = cache_flush_all(c);
+		if (result < 0)
+			return result;
+		c = c->next;
+	}
+
+	return result;
+}
+
 static int fdt_cmo_cold_init(const void *fdt)
 {
 	struct sbi_scratch *scratch;
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
