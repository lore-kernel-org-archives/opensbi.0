Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8116CCF9E0
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ap51iTRfKTZGnxm+aU4qjWctbb71IpuE6PLXVIBl8cs=; b=R/YHJW/qzqfWvo
	0t/OaHf8foI9TNcyFGWEAIsLEJAnU5UDeb2+FDYTZ6OocCApP3oD7ntloCX3VQ1sm+S+JKf4FNB6J
	LvbK1rRvJH9lz/qEkIiisd3m1LPp4ze8wbeM+XZ8M7Gw5o3Dax68scdvr4lcIBBXVmO/qPMqPRnOY
	R85rqS21GCRHCtRVg4K3O5FNGIXpWCcUiBnDZXEw13QHEBucaV06BMQcdeAGdU5tSIOFNAMlr1CCi
	FeP39BLvvvqiaj+nYqBI0O4oH8huHUnF6EcoLLKVEv1zTVha6v/odeleKEUtMr9PddJp9W8sovYgu
	MgRxH/EdVgCKn5/tdXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDP8b-0000000EE0I-2Sfc;
	Mon, 27 Oct 2025 15:28:01 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I5-0000000CiWs-3nlX
	for opensbi@lists.infradead.org;
	Sun, 26 Oct 2025 20:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761510276; x=1762115076; i=b.freisen@gmx.net;
	bh=RH6+OTDaWJH+4me6Aoq970aY8MDWqjev0VL1uEm4nS8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DiFmFl/8w2qobeOAPtYF1fZ52pOOsfU0VJu3diWdK9bKPnfSr+ohgwGMiRi6l2+G
	 Q/FlprVGikJmn2PyxUeDouFRRb+O1Rfs6Li2MleYbnNnyldWE90gqNC5Nwk3fAFuc
	 Xnk+L6+kZQRfpkqkZ2QidLZ7N2lIY7MrWuG7rSysA1CRnmuY1b6pCLefAq4h/coV/
	 Y2nwnXYRSUkiHotNEmUaVKDwSLTpictlIYdi7YEQOOLuGdnV/a1Wyt6/WUVyxMQl2
	 nzbSjJ4xgDiKW987/cboF0FtxXyVMJ1Db5bsuhPU5cdX/OOiV9WcDD7GNd+iHQ3aG
	 OEKOEFMBwOJ2Jmk62A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNt0C-1up0rz2wIa-00Paku; Sun, 26
 Oct 2025 21:24:35 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH 4/5] lib: sbi: ISA extension emulation.
Date: Sun, 26 Oct 2025 21:21:58 +0100
Message-ID: <20251026202416.23550-5-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026202416.23550-1-b.freisen@gmx.net>
References: <20251026202416.23550-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Geh/FOfFBewwYZZYIPh95VkCMlwMb/EhD/WSpdEyxs+l5Kzejp3
 ZTBS8dHFno+Jrj53GVhfMl8q490r8nmjcHcFgxPHfJInxmtmspSYIgFOq8aG7bYaple2XXh
 CNOGIIeo6YK1C+bF1wsHiCpPawb9DgJBbeu19TFFRCtuIwbX/FFt5eLZiUCpznKm6IXVSxA
 KXCcmFsTqjM3pHzdLpqgQ==
UI-OutboundReport: notjunk:1;M01:P0:ZJ8zZAEVs/8=;sev4MDU4BUjIxCWP4+CXPzDclht 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
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:28:00 -0700
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
Zba, Zbb, Zbc, Zbs, Zicbom, Zicboz, Zfhmin, Zicond, Zimop, Zcmop, Zcb, Zfa, Zawrs, Zvbb, Supm

Zicbom uses SiFive and XuanTie vendor extensions to flush data caches.
The Zvbb implementation relies on hardware support for Zbb and RVV 1.0.

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 CONTRIBUTORS.md                        |    2 +
 include/sbi/riscv_encoding.h           |  177 ++++
 include/sbi/riscv_fp.h                 |   47 +
 include/sbi/sbi_hart.h                 |    2 +
 include/sbi/sbi_illegal_insn.h         |    1 +
 include/sbi/sbi_insn_emu.h             |   24 +
 include/sbi/sbi_insn_emu_fp.h          |   19 +
 include/sbi/sbi_insn_emu_v.h           |   21 +
 include/sbi/sbi_platform.h             |   14 +
 include/sbi/sbi_scratch.h              |   12 +-
 include/sbi/sbi_trap.h                 |    2 +
 lib/sbi/objects.mk                     |    3 +
 lib/sbi/sbi_emulate_csr.c              |   14 +
 lib/sbi/sbi_fwft.c                     |   14 +-
 lib/sbi/sbi_hart.c                     |    4 +
 lib/sbi/sbi_illegal_insn.c             |  133 ++-
 lib/sbi/sbi_insn_emu.c                 |  584 ++++++++++++
 lib/sbi/sbi_insn_emu_fp.c              |  962 ++++++++++++++++++++
 lib/sbi/sbi_insn_emu_v.c               | 1128 ++++++++++++++++++++++++
 lib/sbi/sbi_trap.c                     |   52 ++
 lib/sbi/sbi_trap_ldst.c                |   10 +-
 platform/generic/starfive/jh7110.c     |    7 +
 platform/generic/thead/thead-generic.c |    7 +
 23 files changed, 3195 insertions(+), 44 deletions(-)
 create mode 100644 include/sbi/sbi_insn_emu.h
 create mode 100644 include/sbi/sbi_insn_emu_fp.h
 create mode 100644 include/sbi/sbi_insn_emu_v.h
 create mode 100644 lib/sbi/sbi_insn_emu.c
 create mode 100644 lib/sbi/sbi_insn_emu_fp.c
 create mode 100644 lib/sbi/sbi_insn_emu_v.c

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
index c9b3d92..a6cd381 100644
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
index 82b19dc..c858553 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -98,6 +98,8 @@ enum sbi_hart_csrs {
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
index 0000000..298e471
--- /dev/null
+++ b/include/sbi/sbi_insn_emu.h
@@ -0,0 +1,24 @@
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
+int sbi_insn_emu_op_imm(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_op(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_op_32(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_op_imm_32(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_c_reserved(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_c_mop(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_c_misc_alu(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_zicbom_zicboz(ulong insn, struct sbi_trap_regs *regs);
+
+#endif
diff --git a/include/sbi/sbi_insn_emu_fp.h b/include/sbi/sbi_insn_emu_fp.h
new file mode 100644
index 0000000..cfacd27
--- /dev/null
+++ b/include/sbi/sbi_insn_emu_fp.h
@@ -0,0 +1,19 @@
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
+int sbi_insn_emu_load_fp(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_store_fp(ulong insn, struct sbi_trap_regs *regs);
+int sbi_insn_emu_op_fp(ulong insn, struct sbi_trap_regs *regs);
+
+#endif
diff --git a/include/sbi/sbi_insn_emu_v.h b/include/sbi/sbi_insn_emu_v.h
new file mode 100644
index 0000000..3e61dc4
--- /dev/null
+++ b/include/sbi/sbi_insn_emu_v.h
@@ -0,0 +1,21 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#ifndef __SBI_INSN_EMU_V_H__
+#define __SBI_INSN_EMU_V_H__
+
+#include <sbi/sbi_types.h>
+
+#if __riscv_xlen == 64
+int sbi_insn_emu_op_v(ulong insn, struct sbi_trap_regs *regs);
+#else
+#define sbi_insn_emu_op_v truly_illegal_insn
+#endif
+
+#endif
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index d75c12d..6334c7d 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -146,6 +146,9 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+
+	/** Flush at least all non-coherent data caches */
+	void (*flush_data_caches)(void);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -666,6 +669,17 @@ static inline void sbi_platform_pmp_disable(const struct sbi_platform *plat,
 		sbi_platform_ops(plat)->pmp_disable(n);
 }
 
+/**
+ * Ask platform to flush all non-coherent data caches
+ *
+ * @param plat pointer to struct sbi_platform
+ */
+static inline void sbi_platform_flush_data_caches(const struct sbi_platform *plat)
+{
+	if (plat && sbi_platform_ops(plat)->flush_data_caches)
+		sbi_platform_ops(plat)->flush_data_caches();
+}
+
 #endif
 
 #endif
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
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 8abe1e8..0da775c 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -81,6 +81,9 @@ libsbi-objs-y += sbi_hfence.o
 libsbi-objs-y += sbi_hsm.o
 libsbi-objs-y += sbi_illegal_atomic.o
 libsbi-objs-y += sbi_illegal_insn.o
+libsbi-objs-y += sbi_insn_emu.o
+libsbi-objs-y += sbi_insn_emu_fp.o
+libsbi-objs-y += sbi_insn_emu_v.o
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
index a2aefb9..73a5d5b 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -241,11 +241,16 @@ static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
 		return SBI_EINVAL;
 	}
 
+	/* Reset emulated pointer masking */
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	scratch->sw_pm = 0;
+
 	prev = csr_read_clear(CSR_MENVCFG, ENVCFG_PMM);
 	csr_set(CSR_MENVCFG, pmm);
 	if ((csr_read(CSR_MENVCFG) & ENVCFG_PMM) != pmm) {
 		csr_write(CSR_MENVCFG, prev);
-		return SBI_EINVAL;
+		/* Instead of returning SBI_EINVAL, enable emulation */
+		scratch->sw_pm = value;
 	}
 
 	return SBI_OK;
@@ -253,6 +258,13 @@ static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
 
 static int fwft_get_pmlen(struct fwft_config *conf, unsigned long *value)
 {
+	/* Check for emulated pointer masking */
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	if (scratch->sw_pm) {
+		*value = scratch->sw_pm;
+		return SBI_OK;
+	}
+
 	switch (csr_read(CSR_MENVCFG) & ENVCFG_PMM) {
 	case ENVCFG_PMM_PMLEN_0:
 		*value = 0;
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 1b50f67..a7cbf4a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -991,6 +991,10 @@ __pmp_skip:
 	__check_csr_existence(CSR_CYCLE, SBI_HART_CSR_CYCLE);
 	__check_csr_existence(CSR_TIME, SBI_HART_CSR_TIME);
 	__check_csr_existence(CSR_INSTRET, SBI_HART_CSR_INSTRET);
+	__check_csr_existence(CSR_MENVCFG, SBI_HART_CSR_MENVCFG);
+	__check_csr_existence(CSR_SENVCFG, SBI_HART_CSR_SENVCFG);
+	/* Initialize value of emulated SENVCFG CSR */
+	scratch->sw_senvcfg = ENVCFG_CBZE | ENVCFG_CBCFE | ENVCFG_CBIE;
 
 #undef __check_csr_existence
 
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index 4b85450..47f050c 100644
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
@@ -15,6 +19,9 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_illegal_atomic.h>
 #include <sbi/sbi_illegal_insn.h>
+#include <sbi/sbi_insn_emu.h>
+#include <sbi/sbi_insn_emu_fp.h>
+#include <sbi/sbi_insn_emu_v.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
@@ -25,7 +32,7 @@ int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
 	struct sbi_trap_info trap;
 
 	trap.cause = CAUSE_ILLEGAL_INSTRUCTION;
-	trap.tval = insn;
+	trap.tval  = insn;
 	trap.tval2 = 0;
 	trap.tinst = 0;
 	trap.gva   = 0;
@@ -57,7 +64,8 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 		return 0;
 	}
 
-	return truly_illegal_insn(insn, regs);
+	/* Delegate Zicbom and Zicboz emulation */
+	return sbi_insn_emu_zicbom_zicboz(insn, regs);
 }
 
 static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
@@ -70,14 +78,29 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
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
@@ -126,50 +149,77 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
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
+	sbi_insn_emu_op_v,	/* 21 */
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
@@ -183,7 +233,8 @@ int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
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
index 0000000..942ea8c
--- /dev/null
+++ b/lib/sbi/sbi_insn_emu.c
@@ -0,0 +1,584 @@
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
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_trap_ldst.h>
+#include <sbi/sbi_unpriv.h>
+
+#define MASK_SHAMT32 0x1f
+#define MASK_SHAMT (__riscv_xlen - 1)
+#define GET_SHAMT32(insn) ((insn >> 20) & MASK_SHAMT32)
+#define GET_SHAMT(insn) ((insn >> 20) & MASK_SHAMT)
+
+int sbi_insn_emu_op_imm(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
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
+	/* Emulate Zbb immediate instructions */
+	case INSN_MATCH_RORI:
+#if __riscv_xlen == 64
+	case INSN_MATCH_RORI | 0x02000000:
+#endif
+		rd_val = rs1_val >> GET_SHAMT(insn) |
+			 rs1_val << (__riscv_xlen - GET_SHAMT(insn));
+		break;
+	default:
+		switch (insn & INSN_MASK_ITYPE_RD_RS) {
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
+
+int sbi_insn_emu_op(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rs2_val = GET_RS2(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
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
+	/* Emulate Zicond instructions */
+	case INSN_MATCH_CZERO_EQZ:
+		rd_val = rs2_val ? rs1_val : 0;
+		break;
+	case INSN_MATCH_CZERO_NEZ:
+		rd_val = rs2_val ? 0 : rs1_val;
+		break;
+	default:
+		switch (insn & INSN_MASK_ITYPE_RD_RS) {
+#if __riscv_xlen == 32
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
+
+#if __riscv_xlen == 64
+int sbi_insn_emu_op_32(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rs2_val = GET_RS2(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
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
+	default:
+		switch (insn & INSN_MASK_ITYPE_RD_RS) {
+		/* Emulate Zbb register word instructions */
+		case INSN_MATCH_ZEXT_H_RV64:
+			rd_val = (u16)rs1_val;
+			break;
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
+#else
+#define sbi_insn_emu_op_32 sbi_insn_truly_illegal
+#endif
+
+#if __riscv_xlen == 64
+int sbi_insn_emu_op_imm_32(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val = GET_RS1(insn, regs);
+	ulong rd_val;
+
+	switch (insn & INSN_MASK_ITYPE_RD_RS) {
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
+	default:
+		switch (insn & INSN_MASK_SLLI_UW) {
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
+#else
+#define sbi_insn_emu_op_imm_32 sbi_insn_truly_illegal
+#endif
+
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
+
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
+
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
+
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
+		/* Tell the platform to flush all non-coherent data caches */
+		sbi_platform_flush_data_caches(sbi_platform_thishart_ptr());
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
+		/* Tell the platform to flush all non-coherent data caches */
+		sbi_platform_flush_data_caches(sbi_platform_thishart_ptr());
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
diff --git a/lib/sbi/sbi_insn_emu_fp.c b/lib/sbi/sbi_insn_emu_fp.c
new file mode 100644
index 0000000..6a5de1e
--- /dev/null
+++ b/lib/sbi/sbi_insn_emu_fp.c
@@ -0,0 +1,962 @@
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
+
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
+	default:
+		switch (insn & INSN_MASK_RTYPE_RD_RS1_RS2) {
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
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	regs->mepc += 4;
+
+	return 0;
+}
diff --git a/lib/sbi/sbi_insn_emu_v.c b/lib/sbi/sbi_insn_emu_v.c
new file mode 100644
index 0000000..142e9cb
--- /dev/null
+++ b/lib/sbi/sbi_insn_emu_v.c
@@ -0,0 +1,1128 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Benedikt Freisen.
+ *
+ * Authors:
+ *   Benedikt Freisen <b.freisen@gmx.net>
+ */
+
+#if __riscv_xlen == 64
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_illegal_insn.h>
+#include <sbi/sbi_trap.h>
+
+/* TODO: make VLMAX_BYTES configurable */
+#define VLMAX_BYTES (8 * 32)
+
+typedef union {
+	u8 u8[VLMAX_BYTES];
+	u16 u16[VLMAX_BYTES / 2];
+	u32 u32[VLMAX_BYTES / 4];
+	u64 u64[VLMAX_BYTES / 8];
+} sbi_vector_data;
+
+#define INLINE_VSE8(nstr, dest)                    \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse8.v " nstr ", (%0)\n\t"   \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE8(n, nstr, dest) \
+	case n:                           \
+		INLINE_VSE8(nstr, dest);  \
+		break;
+
+#define INLINE_VSE16(nstr, dest)                   \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse16.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE16(n, nstr, dest) \
+	case n:                            \
+		INLINE_VSE16(nstr, dest);  \
+		break;
+
+#define INLINE_VSE32(nstr, dest)                   \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse32.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE32(n, nstr, dest) \
+	case n:                            \
+		INLINE_VSE32(nstr, dest);  \
+		break;
+
+#define INLINE_VSE64(nstr, dest)                   \
+	asm volatile(".option push\n\t"            \
+		     ".option arch, +v\n\t"        \
+		     "vse64.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(dest) \
+		     : "memory");
+
+#define CASE_N_INLINE_VSE64(n, nstr, dest) \
+	case n:                            \
+		INLINE_VSE64(nstr, dest);  \
+		break;
+
+static inline void get_vector_as_array_u8(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE8(0, "v0", dest);
+		CASE_N_INLINE_VSE8(1, "v1", dest);
+		CASE_N_INLINE_VSE8(2, "v2", dest);
+		CASE_N_INLINE_VSE8(3, "v3", dest);
+		CASE_N_INLINE_VSE8(4, "v4", dest);
+		CASE_N_INLINE_VSE8(5, "v5", dest);
+		CASE_N_INLINE_VSE8(6, "v6", dest);
+		CASE_N_INLINE_VSE8(7, "v7", dest);
+		CASE_N_INLINE_VSE8(8, "v8", dest);
+		CASE_N_INLINE_VSE8(9, "v9", dest);
+		CASE_N_INLINE_VSE8(10, "v10", dest);
+		CASE_N_INLINE_VSE8(11, "v11", dest);
+		CASE_N_INLINE_VSE8(12, "v12", dest);
+		CASE_N_INLINE_VSE8(13, "v13", dest);
+		CASE_N_INLINE_VSE8(14, "v14", dest);
+		CASE_N_INLINE_VSE8(15, "v15", dest);
+		CASE_N_INLINE_VSE8(16, "v16", dest);
+		CASE_N_INLINE_VSE8(17, "v17", dest);
+		CASE_N_INLINE_VSE8(18, "v18", dest);
+		CASE_N_INLINE_VSE8(19, "v19", dest);
+		CASE_N_INLINE_VSE8(20, "v20", dest);
+		CASE_N_INLINE_VSE8(21, "v21", dest);
+		CASE_N_INLINE_VSE8(22, "v22", dest);
+		CASE_N_INLINE_VSE8(23, "v23", dest);
+		CASE_N_INLINE_VSE8(24, "v24", dest);
+		CASE_N_INLINE_VSE8(25, "v25", dest);
+		CASE_N_INLINE_VSE8(26, "v26", dest);
+		CASE_N_INLINE_VSE8(27, "v27", dest);
+		CASE_N_INLINE_VSE8(28, "v28", dest);
+		CASE_N_INLINE_VSE8(29, "v29", dest);
+		CASE_N_INLINE_VSE8(30, "v30", dest);
+		CASE_N_INLINE_VSE8(31, "v31", dest);
+	}
+}
+
+static inline void get_vector_as_array_u16(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE16(0, "v0", dest);
+		CASE_N_INLINE_VSE16(1, "v1", dest);
+		CASE_N_INLINE_VSE16(2, "v2", dest);
+		CASE_N_INLINE_VSE16(3, "v3", dest);
+		CASE_N_INLINE_VSE16(4, "v4", dest);
+		CASE_N_INLINE_VSE16(5, "v5", dest);
+		CASE_N_INLINE_VSE16(6, "v6", dest);
+		CASE_N_INLINE_VSE16(7, "v7", dest);
+		CASE_N_INLINE_VSE16(8, "v8", dest);
+		CASE_N_INLINE_VSE16(9, "v9", dest);
+		CASE_N_INLINE_VSE16(10, "v10", dest);
+		CASE_N_INLINE_VSE16(11, "v11", dest);
+		CASE_N_INLINE_VSE16(12, "v12", dest);
+		CASE_N_INLINE_VSE16(13, "v13", dest);
+		CASE_N_INLINE_VSE16(14, "v14", dest);
+		CASE_N_INLINE_VSE16(15, "v15", dest);
+		CASE_N_INLINE_VSE16(16, "v16", dest);
+		CASE_N_INLINE_VSE16(17, "v17", dest);
+		CASE_N_INLINE_VSE16(18, "v18", dest);
+		CASE_N_INLINE_VSE16(19, "v19", dest);
+		CASE_N_INLINE_VSE16(20, "v20", dest);
+		CASE_N_INLINE_VSE16(21, "v21", dest);
+		CASE_N_INLINE_VSE16(22, "v22", dest);
+		CASE_N_INLINE_VSE16(23, "v23", dest);
+		CASE_N_INLINE_VSE16(24, "v24", dest);
+		CASE_N_INLINE_VSE16(25, "v25", dest);
+		CASE_N_INLINE_VSE16(26, "v26", dest);
+		CASE_N_INLINE_VSE16(27, "v27", dest);
+		CASE_N_INLINE_VSE16(28, "v28", dest);
+		CASE_N_INLINE_VSE16(29, "v29", dest);
+		CASE_N_INLINE_VSE16(30, "v30", dest);
+		CASE_N_INLINE_VSE16(31, "v31", dest);
+	}
+}
+
+static inline void get_vector_as_array_u32(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE32(0, "v0", dest);
+		CASE_N_INLINE_VSE32(1, "v1", dest);
+		CASE_N_INLINE_VSE32(2, "v2", dest);
+		CASE_N_INLINE_VSE32(3, "v3", dest);
+		CASE_N_INLINE_VSE32(4, "v4", dest);
+		CASE_N_INLINE_VSE32(5, "v5", dest);
+		CASE_N_INLINE_VSE32(6, "v6", dest);
+		CASE_N_INLINE_VSE32(7, "v7", dest);
+		CASE_N_INLINE_VSE32(8, "v8", dest);
+		CASE_N_INLINE_VSE32(9, "v9", dest);
+		CASE_N_INLINE_VSE32(10, "v10", dest);
+		CASE_N_INLINE_VSE32(11, "v11", dest);
+		CASE_N_INLINE_VSE32(12, "v12", dest);
+		CASE_N_INLINE_VSE32(13, "v13", dest);
+		CASE_N_INLINE_VSE32(14, "v14", dest);
+		CASE_N_INLINE_VSE32(15, "v15", dest);
+		CASE_N_INLINE_VSE32(16, "v16", dest);
+		CASE_N_INLINE_VSE32(17, "v17", dest);
+		CASE_N_INLINE_VSE32(18, "v18", dest);
+		CASE_N_INLINE_VSE32(19, "v19", dest);
+		CASE_N_INLINE_VSE32(20, "v20", dest);
+		CASE_N_INLINE_VSE32(21, "v21", dest);
+		CASE_N_INLINE_VSE32(22, "v22", dest);
+		CASE_N_INLINE_VSE32(23, "v23", dest);
+		CASE_N_INLINE_VSE32(24, "v24", dest);
+		CASE_N_INLINE_VSE32(25, "v25", dest);
+		CASE_N_INLINE_VSE32(26, "v26", dest);
+		CASE_N_INLINE_VSE32(27, "v27", dest);
+		CASE_N_INLINE_VSE32(28, "v28", dest);
+		CASE_N_INLINE_VSE32(29, "v29", dest);
+		CASE_N_INLINE_VSE32(30, "v30", dest);
+		CASE_N_INLINE_VSE32(31, "v31", dest);
+	}
+}
+
+static inline void get_vector_as_array_u64(int n, sbi_vector_data *dest)
+{
+	switch (n) {
+		CASE_N_INLINE_VSE64(0, "v0", dest);
+		CASE_N_INLINE_VSE64(1, "v1", dest);
+		CASE_N_INLINE_VSE64(2, "v2", dest);
+		CASE_N_INLINE_VSE64(3, "v3", dest);
+		CASE_N_INLINE_VSE64(4, "v4", dest);
+		CASE_N_INLINE_VSE64(5, "v5", dest);
+		CASE_N_INLINE_VSE64(6, "v6", dest);
+		CASE_N_INLINE_VSE64(7, "v7", dest);
+		CASE_N_INLINE_VSE64(8, "v8", dest);
+		CASE_N_INLINE_VSE64(9, "v9", dest);
+		CASE_N_INLINE_VSE64(10, "v10", dest);
+		CASE_N_INLINE_VSE64(11, "v11", dest);
+		CASE_N_INLINE_VSE64(12, "v12", dest);
+		CASE_N_INLINE_VSE64(13, "v13", dest);
+		CASE_N_INLINE_VSE64(14, "v14", dest);
+		CASE_N_INLINE_VSE64(15, "v15", dest);
+		CASE_N_INLINE_VSE64(16, "v16", dest);
+		CASE_N_INLINE_VSE64(17, "v17", dest);
+		CASE_N_INLINE_VSE64(18, "v18", dest);
+		CASE_N_INLINE_VSE64(19, "v19", dest);
+		CASE_N_INLINE_VSE64(20, "v20", dest);
+		CASE_N_INLINE_VSE64(21, "v21", dest);
+		CASE_N_INLINE_VSE64(22, "v22", dest);
+		CASE_N_INLINE_VSE64(23, "v23", dest);
+		CASE_N_INLINE_VSE64(24, "v24", dest);
+		CASE_N_INLINE_VSE64(25, "v25", dest);
+		CASE_N_INLINE_VSE64(26, "v26", dest);
+		CASE_N_INLINE_VSE64(27, "v27", dest);
+		CASE_N_INLINE_VSE64(28, "v28", dest);
+		CASE_N_INLINE_VSE64(29, "v29", dest);
+		CASE_N_INLINE_VSE64(30, "v30", dest);
+		CASE_N_INLINE_VSE64(31, "v31", dest);
+	}
+}
+
+#define INLINE_VLE8(nstr, src)                    \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle8.v " nstr ", (%0)\n\t"  \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE8(n, nstr, src) \
+	case n:                          \
+		INLINE_VLE8(nstr, src);  \
+		break;
+
+#define INLINE_VLE16(nstr, src)                   \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle16.v " nstr ", (%0)\n\t" \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE16(n, nstr, src) \
+	case n:                           \
+		INLINE_VLE16(nstr, src);  \
+		break;
+
+#define INLINE_VLE32(nstr, src)                   \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle32.v " nstr ", (%0)\n\t" \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE32(n, nstr, src) \
+	case n:                           \
+		INLINE_VLE32(nstr, src);  \
+		break;
+
+#define INLINE_VLE64(nstr, src)                   \
+	asm volatile(".option push\n\t"           \
+		     ".option arch, +v\n\t"       \
+		     "vle64.v " nstr ", (%0)\n\t" \
+		     ".option pop\n\t" ::"r"(src) \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE64(n, nstr, src) \
+	case n:                           \
+		INLINE_VLE64(nstr, src);  \
+		break;
+
+static inline void set_vector_from_array_u8(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE8(0, "v0", src);
+		CASE_N_INLINE_VLE8(1, "v1", src);
+		CASE_N_INLINE_VLE8(2, "v2", src);
+		CASE_N_INLINE_VLE8(3, "v3", src);
+		CASE_N_INLINE_VLE8(4, "v4", src);
+		CASE_N_INLINE_VLE8(5, "v5", src);
+		CASE_N_INLINE_VLE8(6, "v6", src);
+		CASE_N_INLINE_VLE8(7, "v7", src);
+		CASE_N_INLINE_VLE8(8, "v8", src);
+		CASE_N_INLINE_VLE8(9, "v9", src);
+		CASE_N_INLINE_VLE8(10, "v10", src);
+		CASE_N_INLINE_VLE8(11, "v11", src);
+		CASE_N_INLINE_VLE8(12, "v12", src);
+		CASE_N_INLINE_VLE8(13, "v13", src);
+		CASE_N_INLINE_VLE8(14, "v14", src);
+		CASE_N_INLINE_VLE8(15, "v15", src);
+		CASE_N_INLINE_VLE8(16, "v16", src);
+		CASE_N_INLINE_VLE8(17, "v17", src);
+		CASE_N_INLINE_VLE8(18, "v18", src);
+		CASE_N_INLINE_VLE8(19, "v19", src);
+		CASE_N_INLINE_VLE8(20, "v20", src);
+		CASE_N_INLINE_VLE8(21, "v21", src);
+		CASE_N_INLINE_VLE8(22, "v22", src);
+		CASE_N_INLINE_VLE8(23, "v23", src);
+		CASE_N_INLINE_VLE8(24, "v24", src);
+		CASE_N_INLINE_VLE8(25, "v25", src);
+		CASE_N_INLINE_VLE8(26, "v26", src);
+		CASE_N_INLINE_VLE8(27, "v27", src);
+		CASE_N_INLINE_VLE8(28, "v28", src);
+		CASE_N_INLINE_VLE8(29, "v29", src);
+		CASE_N_INLINE_VLE8(30, "v30", src);
+		CASE_N_INLINE_VLE8(31, "v31", src);
+	}
+}
+
+static inline void set_vector_from_array_u16(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE16(0, "v0", src);
+		CASE_N_INLINE_VLE16(1, "v1", src);
+		CASE_N_INLINE_VLE16(2, "v2", src);
+		CASE_N_INLINE_VLE16(3, "v3", src);
+		CASE_N_INLINE_VLE16(4, "v4", src);
+		CASE_N_INLINE_VLE16(5, "v5", src);
+		CASE_N_INLINE_VLE16(6, "v6", src);
+		CASE_N_INLINE_VLE16(7, "v7", src);
+		CASE_N_INLINE_VLE16(8, "v8", src);
+		CASE_N_INLINE_VLE16(9, "v9", src);
+		CASE_N_INLINE_VLE16(10, "v10", src);
+		CASE_N_INLINE_VLE16(11, "v11", src);
+		CASE_N_INLINE_VLE16(12, "v12", src);
+		CASE_N_INLINE_VLE16(13, "v13", src);
+		CASE_N_INLINE_VLE16(14, "v14", src);
+		CASE_N_INLINE_VLE16(15, "v15", src);
+		CASE_N_INLINE_VLE16(16, "v16", src);
+		CASE_N_INLINE_VLE16(17, "v17", src);
+		CASE_N_INLINE_VLE16(18, "v18", src);
+		CASE_N_INLINE_VLE16(19, "v19", src);
+		CASE_N_INLINE_VLE16(20, "v20", src);
+		CASE_N_INLINE_VLE16(21, "v21", src);
+		CASE_N_INLINE_VLE16(22, "v22", src);
+		CASE_N_INLINE_VLE16(23, "v23", src);
+		CASE_N_INLINE_VLE16(24, "v24", src);
+		CASE_N_INLINE_VLE16(25, "v25", src);
+		CASE_N_INLINE_VLE16(26, "v26", src);
+		CASE_N_INLINE_VLE16(27, "v27", src);
+		CASE_N_INLINE_VLE16(28, "v28", src);
+		CASE_N_INLINE_VLE16(29, "v29", src);
+		CASE_N_INLINE_VLE16(30, "v30", src);
+		CASE_N_INLINE_VLE16(31, "v31", src);
+	}
+}
+
+static inline void set_vector_from_array_u32(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE32(0, "v0", src);
+		CASE_N_INLINE_VLE32(1, "v1", src);
+		CASE_N_INLINE_VLE32(2, "v2", src);
+		CASE_N_INLINE_VLE32(3, "v3", src);
+		CASE_N_INLINE_VLE32(4, "v4", src);
+		CASE_N_INLINE_VLE32(5, "v5", src);
+		CASE_N_INLINE_VLE32(6, "v6", src);
+		CASE_N_INLINE_VLE32(7, "v7", src);
+		CASE_N_INLINE_VLE32(8, "v8", src);
+		CASE_N_INLINE_VLE32(9, "v9", src);
+		CASE_N_INLINE_VLE32(10, "v10", src);
+		CASE_N_INLINE_VLE32(11, "v11", src);
+		CASE_N_INLINE_VLE32(12, "v12", src);
+		CASE_N_INLINE_VLE32(13, "v13", src);
+		CASE_N_INLINE_VLE32(14, "v14", src);
+		CASE_N_INLINE_VLE32(15, "v15", src);
+		CASE_N_INLINE_VLE32(16, "v16", src);
+		CASE_N_INLINE_VLE32(17, "v17", src);
+		CASE_N_INLINE_VLE32(18, "v18", src);
+		CASE_N_INLINE_VLE32(19, "v19", src);
+		CASE_N_INLINE_VLE32(20, "v20", src);
+		CASE_N_INLINE_VLE32(21, "v21", src);
+		CASE_N_INLINE_VLE32(22, "v22", src);
+		CASE_N_INLINE_VLE32(23, "v23", src);
+		CASE_N_INLINE_VLE32(24, "v24", src);
+		CASE_N_INLINE_VLE32(25, "v25", src);
+		CASE_N_INLINE_VLE32(26, "v26", src);
+		CASE_N_INLINE_VLE32(27, "v27", src);
+		CASE_N_INLINE_VLE32(28, "v28", src);
+		CASE_N_INLINE_VLE32(29, "v29", src);
+		CASE_N_INLINE_VLE32(30, "v30", src);
+		CASE_N_INLINE_VLE32(31, "v31", src);
+	}
+}
+
+static inline void set_vector_from_array_u64(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		CASE_N_INLINE_VLE64(0, "v0", src);
+		CASE_N_INLINE_VLE64(1, "v1", src);
+		CASE_N_INLINE_VLE64(2, "v2", src);
+		CASE_N_INLINE_VLE64(3, "v3", src);
+		CASE_N_INLINE_VLE64(4, "v4", src);
+		CASE_N_INLINE_VLE64(5, "v5", src);
+		CASE_N_INLINE_VLE64(6, "v6", src);
+		CASE_N_INLINE_VLE64(7, "v7", src);
+		CASE_N_INLINE_VLE64(8, "v8", src);
+		CASE_N_INLINE_VLE64(9, "v9", src);
+		CASE_N_INLINE_VLE64(10, "v10", src);
+		CASE_N_INLINE_VLE64(11, "v11", src);
+		CASE_N_INLINE_VLE64(12, "v12", src);
+		CASE_N_INLINE_VLE64(13, "v13", src);
+		CASE_N_INLINE_VLE64(14, "v14", src);
+		CASE_N_INLINE_VLE64(15, "v15", src);
+		CASE_N_INLINE_VLE64(16, "v16", src);
+		CASE_N_INLINE_VLE64(17, "v17", src);
+		CASE_N_INLINE_VLE64(18, "v18", src);
+		CASE_N_INLINE_VLE64(19, "v19", src);
+		CASE_N_INLINE_VLE64(20, "v20", src);
+		CASE_N_INLINE_VLE64(21, "v21", src);
+		CASE_N_INLINE_VLE64(22, "v22", src);
+		CASE_N_INLINE_VLE64(23, "v23", src);
+		CASE_N_INLINE_VLE64(24, "v24", src);
+		CASE_N_INLINE_VLE64(25, "v25", src);
+		CASE_N_INLINE_VLE64(26, "v26", src);
+		CASE_N_INLINE_VLE64(27, "v27", src);
+		CASE_N_INLINE_VLE64(28, "v28", src);
+		CASE_N_INLINE_VLE64(29, "v29", src);
+		CASE_N_INLINE_VLE64(30, "v30", src);
+		CASE_N_INLINE_VLE64(31, "v31", src);
+	}
+}
+
+#define INLINE_VLE8_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                \
+		     ".option arch, +v\n\t"            \
+		     "vle8.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)      \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE8_M(n, nstr, src) \
+	case n:                            \
+		INLINE_VLE8_M(nstr, src);  \
+		break;
+
+#define INLINE_VLE16_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                 \
+		     ".option arch, +v\n\t"             \
+		     "vle16.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)       \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE16_M(n, nstr, src) \
+	case n:                             \
+		INLINE_VLE16_M(nstr, src);  \
+		break;
+
+#define INLINE_VLE32_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                 \
+		     ".option arch, +v\n\t"             \
+		     "vle32.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)       \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE32_M(n, nstr, src) \
+	case n:                             \
+		INLINE_VLE32_M(nstr, src);  \
+		break;
+
+#define INLINE_VLE64_M(nstr, src)                       \
+	asm volatile(".option push\n\t"                 \
+		     ".option arch, +v\n\t"             \
+		     "vle64.v " nstr ", (%0), v0.t\n\t" \
+		     ".option pop\n\t" ::"r"(src)       \
+		     : "memory");
+
+#define CASE_N_INLINE_VLE64_M(n, nstr, src) \
+	case n:                             \
+		INLINE_VLE64_M(nstr, src);  \
+		break;
+
+static inline void set_masked_vector_from_array_u8(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		// CASE_N_INLINE_VLE8_M(0, "v0", src);
+		CASE_N_INLINE_VLE8_M(1, "v1", src);
+		CASE_N_INLINE_VLE8_M(2, "v2", src);
+		CASE_N_INLINE_VLE8_M(3, "v3", src);
+		CASE_N_INLINE_VLE8_M(4, "v4", src);
+		CASE_N_INLINE_VLE8_M(5, "v5", src);
+		CASE_N_INLINE_VLE8_M(6, "v6", src);
+		CASE_N_INLINE_VLE8_M(7, "v7", src);
+		CASE_N_INLINE_VLE8_M(8, "v8", src);
+		CASE_N_INLINE_VLE8_M(9, "v9", src);
+		CASE_N_INLINE_VLE8_M(10, "v10", src);
+		CASE_N_INLINE_VLE8_M(11, "v11", src);
+		CASE_N_INLINE_VLE8_M(12, "v12", src);
+		CASE_N_INLINE_VLE8_M(13, "v13", src);
+		CASE_N_INLINE_VLE8_M(14, "v14", src);
+		CASE_N_INLINE_VLE8_M(15, "v15", src);
+		CASE_N_INLINE_VLE8_M(16, "v16", src);
+		CASE_N_INLINE_VLE8_M(17, "v17", src);
+		CASE_N_INLINE_VLE8_M(18, "v18", src);
+		CASE_N_INLINE_VLE8_M(19, "v19", src);
+		CASE_N_INLINE_VLE8_M(20, "v20", src);
+		CASE_N_INLINE_VLE8_M(21, "v21", src);
+		CASE_N_INLINE_VLE8_M(22, "v22", src);
+		CASE_N_INLINE_VLE8_M(23, "v23", src);
+		CASE_N_INLINE_VLE8_M(24, "v24", src);
+		CASE_N_INLINE_VLE8_M(25, "v25", src);
+		CASE_N_INLINE_VLE8_M(26, "v26", src);
+		CASE_N_INLINE_VLE8_M(27, "v27", src);
+		CASE_N_INLINE_VLE8_M(28, "v28", src);
+		CASE_N_INLINE_VLE8_M(29, "v29", src);
+		CASE_N_INLINE_VLE8_M(30, "v30", src);
+		CASE_N_INLINE_VLE8_M(31, "v31", src);
+	}
+}
+
+static inline void set_masked_vector_from_array_u16(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		// CASE_N_INLINE_VLE16_M(0, "v0", src);
+		CASE_N_INLINE_VLE16_M(1, "v1", src);
+		CASE_N_INLINE_VLE16_M(2, "v2", src);
+		CASE_N_INLINE_VLE16_M(3, "v3", src);
+		CASE_N_INLINE_VLE16_M(4, "v4", src);
+		CASE_N_INLINE_VLE16_M(5, "v5", src);
+		CASE_N_INLINE_VLE16_M(6, "v6", src);
+		CASE_N_INLINE_VLE16_M(7, "v7", src);
+		CASE_N_INLINE_VLE16_M(8, "v8", src);
+		CASE_N_INLINE_VLE16_M(9, "v9", src);
+		CASE_N_INLINE_VLE16_M(10, "v10", src);
+		CASE_N_INLINE_VLE16_M(11, "v11", src);
+		CASE_N_INLINE_VLE16_M(12, "v12", src);
+		CASE_N_INLINE_VLE16_M(13, "v13", src);
+		CASE_N_INLINE_VLE16_M(14, "v14", src);
+		CASE_N_INLINE_VLE16_M(15, "v15", src);
+		CASE_N_INLINE_VLE16_M(16, "v16", src);
+		CASE_N_INLINE_VLE16_M(17, "v17", src);
+		CASE_N_INLINE_VLE16_M(18, "v18", src);
+		CASE_N_INLINE_VLE16_M(19, "v19", src);
+		CASE_N_INLINE_VLE16_M(20, "v20", src);
+		CASE_N_INLINE_VLE16_M(21, "v21", src);
+		CASE_N_INLINE_VLE16_M(22, "v22", src);
+		CASE_N_INLINE_VLE16_M(23, "v23", src);
+		CASE_N_INLINE_VLE16_M(24, "v24", src);
+		CASE_N_INLINE_VLE16_M(25, "v25", src);
+		CASE_N_INLINE_VLE16_M(26, "v26", src);
+		CASE_N_INLINE_VLE16_M(27, "v27", src);
+		CASE_N_INLINE_VLE16_M(28, "v28", src);
+		CASE_N_INLINE_VLE16_M(29, "v29", src);
+		CASE_N_INLINE_VLE16_M(30, "v30", src);
+		CASE_N_INLINE_VLE16_M(31, "v31", src);
+	}
+}
+
+static inline void set_masked_vector_from_array_u32(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		// CASE_N_INLINE_VLE32_M(0, "v0", src);
+		CASE_N_INLINE_VLE32_M(1, "v1", src);
+		CASE_N_INLINE_VLE32_M(2, "v2", src);
+		CASE_N_INLINE_VLE32_M(3, "v3", src);
+		CASE_N_INLINE_VLE32_M(4, "v4", src);
+		CASE_N_INLINE_VLE32_M(5, "v5", src);
+		CASE_N_INLINE_VLE32_M(6, "v6", src);
+		CASE_N_INLINE_VLE32_M(7, "v7", src);
+		CASE_N_INLINE_VLE32_M(8, "v8", src);
+		CASE_N_INLINE_VLE32_M(9, "v9", src);
+		CASE_N_INLINE_VLE32_M(10, "v10", src);
+		CASE_N_INLINE_VLE32_M(11, "v11", src);
+		CASE_N_INLINE_VLE32_M(12, "v12", src);
+		CASE_N_INLINE_VLE32_M(13, "v13", src);
+		CASE_N_INLINE_VLE32_M(14, "v14", src);
+		CASE_N_INLINE_VLE32_M(15, "v15", src);
+		CASE_N_INLINE_VLE32_M(16, "v16", src);
+		CASE_N_INLINE_VLE32_M(17, "v17", src);
+		CASE_N_INLINE_VLE32_M(18, "v18", src);
+		CASE_N_INLINE_VLE32_M(19, "v19", src);
+		CASE_N_INLINE_VLE32_M(20, "v20", src);
+		CASE_N_INLINE_VLE32_M(21, "v21", src);
+		CASE_N_INLINE_VLE32_M(22, "v22", src);
+		CASE_N_INLINE_VLE32_M(23, "v23", src);
+		CASE_N_INLINE_VLE32_M(24, "v24", src);
+		CASE_N_INLINE_VLE32_M(25, "v25", src);
+		CASE_N_INLINE_VLE32_M(26, "v26", src);
+		CASE_N_INLINE_VLE32_M(27, "v27", src);
+		CASE_N_INLINE_VLE32_M(28, "v28", src);
+		CASE_N_INLINE_VLE32_M(29, "v29", src);
+		CASE_N_INLINE_VLE32_M(30, "v30", src);
+		CASE_N_INLINE_VLE32_M(31, "v31", src);
+	}
+}
+
+static inline void set_masked_vector_from_array_u64(int n, sbi_vector_data *src)
+{
+	switch (n) {
+		// CASE_N_INLINE_VLE64_M(0, "v0", src);
+		CASE_N_INLINE_VLE64_M(1, "v1", src);
+		CASE_N_INLINE_VLE64_M(2, "v2", src);
+		CASE_N_INLINE_VLE64_M(3, "v3", src);
+		CASE_N_INLINE_VLE64_M(4, "v4", src);
+		CASE_N_INLINE_VLE64_M(5, "v5", src);
+		CASE_N_INLINE_VLE64_M(6, "v6", src);
+		CASE_N_INLINE_VLE64_M(7, "v7", src);
+		CASE_N_INLINE_VLE64_M(8, "v8", src);
+		CASE_N_INLINE_VLE64_M(9, "v9", src);
+		CASE_N_INLINE_VLE64_M(10, "v10", src);
+		CASE_N_INLINE_VLE64_M(11, "v11", src);
+		CASE_N_INLINE_VLE64_M(12, "v12", src);
+		CASE_N_INLINE_VLE64_M(13, "v13", src);
+		CASE_N_INLINE_VLE64_M(14, "v14", src);
+		CASE_N_INLINE_VLE64_M(15, "v15", src);
+		CASE_N_INLINE_VLE64_M(16, "v16", src);
+		CASE_N_INLINE_VLE64_M(17, "v17", src);
+		CASE_N_INLINE_VLE64_M(18, "v18", src);
+		CASE_N_INLINE_VLE64_M(19, "v19", src);
+		CASE_N_INLINE_VLE64_M(20, "v20", src);
+		CASE_N_INLINE_VLE64_M(21, "v21", src);
+		CASE_N_INLINE_VLE64_M(22, "v22", src);
+		CASE_N_INLINE_VLE64_M(23, "v23", src);
+		CASE_N_INLINE_VLE64_M(24, "v24", src);
+		CASE_N_INLINE_VLE64_M(25, "v25", src);
+		CASE_N_INLINE_VLE64_M(26, "v26", src);
+		CASE_N_INLINE_VLE64_M(27, "v27", src);
+		CASE_N_INLINE_VLE64_M(28, "v28", src);
+		CASE_N_INLINE_VLE64_M(29, "v29", src);
+		CASE_N_INLINE_VLE64_M(30, "v30", src);
+		CASE_N_INLINE_VLE64_M(31, "v31", src);
+	}
+}
+
+static inline void foreach_velem_vv(int vl, int sew, bool masked, int vd,
+				    int vs1, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs1_data;
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs1, &vs1_data);
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u8[i] = op(vs1_data.u8[i], vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u8(vd, &vd_data);
+		else
+			set_vector_from_array_u8(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs1, &vs1_data);
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(vs1_data.u16[i], vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs1, &vs1_data);
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(vs1_data.u32[i], vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 3:
+		get_vector_as_array_u64(vs1, &vs1_data);
+		get_vector_as_array_u64(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(vs1_data.u64[i], vs2_data.u64[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+}
+
+static inline void foreach_velem_vi(int vl, int sew, bool masked, int vd,
+				    u64 imm, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u8[i] = op(imm, vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u8(vd, &vd_data);
+		else
+			set_vector_from_array_u8(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(imm, vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(imm, vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 3:
+		get_vector_as_array_u64(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(imm, vs2_data.u64[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+}
+
+static inline void foreach_velem_v(int vl, int sew, bool masked, int vd,
+				   int vs2, u64 op(u64))
+{
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u8[i] = op(vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u8(vd, &vd_data);
+		else
+			set_vector_from_array_u8(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 3:
+		get_vector_as_array_u64(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(vs2_data.u64[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+}
+
+static inline bool foreach_velem_wvv(int vl, int sew, bool masked, int vd,
+				     int vs1, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs1_data;
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return true;
+	/* back out if this VL combined with the widened SEW is too big */
+	if (vl * (2 << sew) > VLMAX_BYTES)
+		return false;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs1, &vs1_data);
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(vs1_data.u8[i], vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs1, &vs1_data);
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(vs1_data.u16[i], vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs1, &vs1_data);
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(vs1_data.u32[i], vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+	return true;
+}
+
+static inline bool foreach_velem_wvi(int vl, int sew, bool masked, int vd,
+				     u64 imm, int vs2, u64 op(u64, u64))
+{
+	sbi_vector_data vs2_data;
+	sbi_vector_data vd_data;
+
+	/* treat as no-op if VL is 0 */
+	if (vl == 0)
+		return true;
+	/* back out if this VL combined with the widened SEW is too big */
+	if (vl * (2 << sew) > VLMAX_BYTES)
+		return false;
+
+	switch (sew) {
+	case 0:
+		get_vector_as_array_u8(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u16[i] = op(imm, vs2_data.u8[i]);
+		if (masked)
+			set_masked_vector_from_array_u16(vd, &vd_data);
+		else
+			set_vector_from_array_u16(vd, &vd_data);
+		break;
+	case 1:
+		get_vector_as_array_u16(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u32[i] = op(imm, vs2_data.u16[i]);
+		if (masked)
+			set_masked_vector_from_array_u32(vd, &vd_data);
+		else
+			set_vector_from_array_u32(vd, &vd_data);
+		break;
+	case 2:
+		get_vector_as_array_u32(vs2, &vs2_data);
+		for (int i = 0; i < vl; i++)
+			vd_data.u64[i] = op(imm, vs2_data.u32[i]);
+		if (masked)
+			set_masked_vector_from_array_u64(vd, &vd_data);
+		else
+			set_vector_from_array_u64(vd, &vd_data);
+		break;
+	}
+	return true;
+}
+
+static inline u64 op_andn(u64 op1, u64 op2)
+{
+	return ~op1 & op2;
+}
+
+static inline u64 op_rol_u8(u64 op1, u64 op2)
+{
+	op2 &= 0xff;
+	op1 &= 7;
+	return ((op2 << op1) | (op2 >> (8 - op1))) & 0xff;
+}
+
+static inline u64 op_rol_u16(u64 op1, u64 op2)
+{
+	op2 &= 0xffff;
+	op1 &= 0xf;
+	return ((op2 << op1) | (op2 >> (16 - op1))) & 0xffff;
+}
+
+static inline u64 op_rol_u32(u64 op1, u64 op2)
+{
+	op2 &= 0xffffffff;
+	op1 &= 0x1f;
+	return ((op2 << op1) | (op2 >> (32 - op1))) & 0xffffffff;
+}
+
+static inline u64 op_rol_u64(u64 op1, u64 op2)
+{
+	op1 &= 0x3f;
+	return (op2 << op1) | (op2 >> (64 - op1));
+}
+
+typeof(u64(u64, u64)) *ops_rol[4] = { op_rol_u8, op_rol_u16, op_rol_u32,
+				      op_rol_u64 };
+
+static inline u64 op_ror_u8(u64 op1, u64 op2)
+{
+	op2 &= 0xff;
+	op1 &= 7;
+	return ((op2 >> op1) | (op2 << (8 - op1))) & 0xff;
+}
+
+static inline u64 op_ror_u16(u64 op1, u64 op2)
+{
+	op2 &= 0xffff;
+	op1 &= 0xf;
+	return ((op2 >> op1) | (op2 << (16 - op1))) & 0xffff;
+}
+
+static inline u64 op_ror_u32(u64 op1, u64 op2)
+{
+	op2 &= 0xffffffff;
+	op1 &= 0x1f;
+	return ((op2 >> op1) | (op2 << (32 - op1))) & 0xffffffff;
+}
+
+static inline u64 op_ror_u64(u64 op1, u64 op2)
+{
+	op1 &= 0x3f;
+	return (op2 >> op1) | (op2 << (64 - op1));
+}
+
+typeof(u64(u64, u64)) *ops_ror[4] = { op_ror_u8, op_ror_u16, op_ror_u32,
+				      op_ror_u64 };
+
+static inline u64 op_wsll_u8(u64 op1, u64 op2)
+{
+	op1 &= 0xf;
+	return (op2 << op1) & 0xffff;
+}
+
+static inline u64 op_wsll_u16(u64 op1, u64 op2)
+{
+	op1 &= 0x1f;
+	return (op2 << op1) & 0xffffffff;
+}
+
+static inline u64 op_wsll_u32(u64 op1, u64 op2)
+{
+	op1 &= 0x3f;
+	return op2 << op1;
+}
+
+typeof(u64(u64, u64)) *ops_wsll[4] = { op_wsll_u8, op_wsll_u16, op_wsll_u32,
+				       op_wsll_u32 };
+
+static inline u64 op_brev8(u64 op)
+{
+	return ((op & 0x8080808080808080) >> 7) |
+	       ((op & 0x4040404040404040) >> 5) |
+	       ((op & 0x2020202020202020) >> 3) |
+	       ((op & 0x1010101010101010) >> 1) |
+	       ((op & 0x0808080808080808) << 1) |
+	       ((op & 0x0404040404040404) << 3) |
+	       ((op & 0x0202020202020202) << 5) |
+	       ((op & 0x0101010101010101) << 7);
+}
+
+static inline u64 op_rev8(u64 op1, u64 op2)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "rev8 %0, %2\n\t"
+		     "srl %0, %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op1), "r"(op2));
+	return result;
+}
+
+static inline u64 op_brev(u64 op1, u64 op2)
+{
+	return op_rev8(op1, op_brev8(op2));
+}
+
+static inline u64 op_clz(u64 op1, u64 op2)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "clz %0, %2\n\t"
+		     "sub %0, %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op1), "r"(op2));
+	return result;
+}
+
+static inline u64 op_ctz(u64 op1, u64 op2)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "ctz %0, %2\n\t"
+		     "minu %0, %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op1), "r"(op2));
+	return result;
+}
+
+static inline u64 op_cpop(u64 op)
+{
+	u64 result;
+	asm volatile(".option push\n\t"
+		     ".option arch, +zbb\n\t"
+		     "cpop %0, %1\n\t"
+		     ".option pop\n\t"
+		     : "=r"(result)
+		     : "r"(op));
+	return result;
+}
+
+int sbi_insn_emu_op_v(ulong insn, struct sbi_trap_regs *regs)
+{
+	/* back out if vector unit is not available */
+	if ((regs->mstatus & MSTATUS_VS) == 0 ||
+	    (sbi_mstatus_prev_mode(regs->mstatus) == PRV_U &&
+	     (csr_read(CSR_SSTATUS) & SSTATUS_VS) == 0))
+		return truly_illegal_insn(insn, regs);
+
+	int vl = csr_read(CSR_VL);
+	int vs1 = GET_VS1(insn);
+	int vs2 = GET_VS2(insn);
+	int vd = GET_VD(insn);
+	u32 vtype = csr_read(CSR_VTYPE);
+	int sew = GET_VSEW(vtype);
+	bool m = IS_MASKED(insn);
+	u64 rs1 = GET_RS1(insn, regs);
+
+	/* back out if this VL combined with this SEW is too big */
+	if (vl * (1 << sew) > VLMAX_BYTES)
+		return truly_illegal_insn(insn, regs);
+
+	switch (insn & INSN_MASK_VXUNARY0) {
+	/* Emulate Zvbb unary operations */
+	case INSN_MATCH_VBREVV:
+		foreach_velem_vi(vl, sew, m, vd, 64 - (8 << sew), vs2, op_brev);
+		break;
+	case INSN_MATCH_VBREV8V:
+		foreach_velem_v(vl, sew, m, vd, vs2, op_brev8);
+		break;
+	case INSN_MATCH_VREV8V:
+		foreach_velem_vi(vl, sew, m, vd, 64 - (8 << sew), vs2, op_rev8);
+		break;
+	case INSN_MATCH_VCLZV:
+		foreach_velem_vi(vl, sew, m, vd, 64 - (8 << sew), vs2, op_clz);
+		break;
+	case INSN_MATCH_VCTZV:
+		foreach_velem_vi(vl, sew, m, vd, 8 << sew, vs2, op_ctz);
+		break;
+	case INSN_MATCH_VCPOPV:
+		foreach_velem_v(vl, sew, m, vd, vs2, op_cpop);
+		break;
+	default:
+		switch (insn & INSN_MASK_VVBINARY0) {
+		/* Emulate Zvbb binary operations */
+		case INSN_MATCH_VANDNVV:
+			foreach_velem_vv(vl, sew, m, vd, vs1, vs2, op_andn);
+			break;
+		case INSN_MATCH_VANDNVX:
+			foreach_velem_vi(vl, sew, m, vd, rs1, vs2, op_andn);
+			break;
+		case INSN_MATCH_VROLVV:
+			foreach_velem_vv(vl, sew, m, vd, vs1, vs2,
+					 ops_rol[sew]);
+			break;
+		case INSN_MATCH_VROLVX:
+			foreach_velem_vi(vl, sew, m, vd, rs1, vs2,
+					 ops_rol[sew]);
+			break;
+		case INSN_MATCH_VRORVV:
+			foreach_velem_vv(vl, sew, m, vd, vs1, vs2,
+					 ops_ror[sew]);
+			break;
+		case INSN_MATCH_VRORVX:
+			foreach_velem_vi(vl, sew, m, vd, rs1, vs2,
+					 ops_ror[sew]);
+			break;
+		case INSN_MATCH_VRORVI:
+		case INSN_MATCH_VRORVI | 0x04000000:
+			foreach_velem_vi(vl, sew, m, vd,
+					 GET_RS1_NUM(insn) |
+						 ((insn & 0x04000000) >> 21),
+					 vs2, ops_ror[sew]);
+			break;
+		case INSN_MATCH_VWSLLVV:
+			if (!foreach_velem_wvv(vl, sew, m, vd, vs1, vs2,
+					       ops_wsll[sew]))
+				return truly_illegal_insn(insn, regs);
+			break;
+		case INSN_MATCH_VWSLLVX:
+			if (!foreach_velem_wvi(vl, sew, m, vd, rs1, vs2,
+					       ops_wsll[sew]))
+				return truly_illegal_insn(insn, regs);
+			break;
+		case INSN_MATCH_VWSLLVI:
+			if (!foreach_velem_wvi(vl, sew, m, vd,
+					       GET_RS1_NUM(insn), vs2,
+					       ops_wsll[sew]))
+				return truly_illegal_insn(insn, regs);
+			break;
+		default:
+			return truly_illegal_insn(insn, regs);
+		}
+	}
+
+	regs->mepc += 4;
+
+	return 0;
+}
+
+#endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d..abe6335 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -285,6 +285,17 @@ static int sbi_trap_aia_irq(void)
 	return 0;
 }
 
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
+
 /**
  * Handle trap/interrupt
  *
@@ -358,6 +369,47 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
 		rc  = sbi_double_trap_handler(tcntx);
 		msg = "double trap handler failed";
 		break;
+#if __riscv_xlen > 32
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
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index c132843..037be2e 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -301,6 +301,12 @@ static bool starfive_jh7110_cold_boot_allowed(u32 hartid)
 	return generic_cold_boot_allowed(hartid);
 }
 
+static void starfive_jh7110_flush_data_caches(void)
+{
+	/* flush L1 data cache via cflush.d.l1 zero */
+	asm volatile(".insn i 0x73, 0, zero, zero, -0x40");
+}
+
 static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
 					 const struct fdt_match *match)
 {
@@ -316,6 +322,7 @@ static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
 
 	generic_platform_ops.cold_boot_allowed = starfive_jh7110_cold_boot_allowed;
 	generic_platform_ops.final_init = starfive_jh7110_final_init;
+	generic_platform_ops.flush_data_caches = starfive_jh7110_flush_data_caches;
 
 	return 0;
 }
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index ddb4f0b..2e6c5a1 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -39,6 +39,12 @@ static int thead_pmu_extensions_init(struct sbi_hart_features *hfeatures)
 	return 0;
 }
 
+static void thead_flush_data_caches(void)
+{
+	/* flush data cache via th.dcache.call */
+	asm volatile(".insn i 0xb, 0, zero, zero, 1");
+}
+
 static int thead_generic_platform_init(const void *fdt, int nodeoff,
 				       const struct fdt_match *match)
 {
@@ -48,6 +54,7 @@ static int thead_generic_platform_init(const void *fdt, int nodeoff,
 		generic_platform_ops.early_init = thead_tlb_flush_early_init;
 	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
 		generic_platform_ops.extensions_init = thead_pmu_extensions_init;
+	generic_platform_ops.flush_data_caches = thead_flush_data_caches;
 
 	return 0;
 }
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
