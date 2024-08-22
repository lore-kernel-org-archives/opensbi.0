From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 21 Aug 2024 23:50:48 -0700
Subject: [PATCH v2 2/3] lib: sbi: Zicfilp/Zicfiss detection and elp cfi state reflect back in status
In-Reply-To: <20240822065049.3923308-1-debug@rivosinc.com>
References: <20240822065049.3923308-1-debug@rivosinc.com>
Message-ID: <20240822065049.3923308-3-debug@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds support for zicfilp / zicfiss detection in sbi_hart.c
Zicfilp records status of hart's ELP state in *status csr. Missing landing pad
sets MPELP in mstatus. When SBI is redirecting back to S/VS/HS, SPELP is
set in sstatus/vsstatus.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/sbi/sbi_hart.h |  3 +++
 lib/sbi/sbi_hart.c     | 18 ++++++++++++++++++
 lib/sbi/sbi_trap.c     | 20 ++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 81ec061..2aa6867 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -67,6 +67,9 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SVADE,
 	/** Hart has Svadu extension */
 	SBI_HART_EXT_SVADU,
+	/** HART has zicfiss & zicfilp extension */
+	SBI_HART_EXT_ZICFILP,
+	SBI_HART_EXT_ZICFISS,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index c366701..0636021 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -680,6 +680,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
 	__SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
 	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
+	__SBI_HART_EXT_DATA(zicfilp, SBI_HART_EXT_ZICFILP),
+	__SBI_HART_EXT_DATA(zicfiss, SBI_HART_EXT_ZICFISS),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
@@ -776,6 +778,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	unsigned long val, oldval;
 	bool has_zicntr = false;
 	int rc;
+	bool ssp_exist, elp_exist;
 
 	/* If hart features already detected then do nothing */
 	if (hfeatures->detected)
@@ -933,6 +936,21 @@ __pmp_skip:
 	/* Save trap based detection of Zicntr */
 	has_zicntr = sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR);
 
+	if (hfeatures->priv_version >= SBI_HART_PRIV_VER_1_12) {
+		val = csr_read_allowed(CSR_SSP, (unsigned long)&trap);
+		ssp_exist = trap.cause == 0;
+		if (ssp_exist)
+			__sbi_hart_update_extension(hfeatures,
+					SBI_HART_EXT_ZICFISS, true);
+
+		csr_set(CSR_MSTATUS, MSTATUS_MPELP);
+		val = csr_read_clear(CSR_MSTATUS, MSTATUS_MPELP);
+		elp_exist = val & MSTATUS_MPELP;
+		if (elp_exist)
+			__sbi_hart_update_extension(hfeatures,
+					SBI_HART_EXT_ZICFILP, true);
+	}
+
 	/* Let platform populate extensions */
 	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
 					  hfeatures);
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index b4f3a17..e2502f2 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -103,6 +103,7 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		      const struct sbi_trap_info *trap)
 {
 	ulong hstatus, vsstatus, prev_mode;
+	bool elp = false;
 #if __riscv_xlen == 32
 	bool prev_virt = (regs->mstatusH & MSTATUSH_MPV) ? true : false;
 #else
@@ -116,6 +117,17 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 	if (prev_mode != PRV_S && prev_mode != PRV_U)
 		return SBI_ENOTSUPP;
 
+	/* If extension has support for CFI, clear MPELP because redirecting to VS or (H)S */
+	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_ZICFILP)) {
+#if __riscv_xlen == 32
+		elp = regs->mstatusH & MSTATUSH_MPELP;
+		regs->mstatusH &= ~MSTATUSH_MPELP;
+#else
+		elp = regs->mstatus & MSTATUS_MPELP;
+		regs->mstatus &= ~MSTATUS_MPELP;
+#endif
+	}
+
 	/* If exceptions came from VS/VU-mode, redirect to VS-mode if
 	 * delegated in hedeleg
 	 */
@@ -169,6 +181,10 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		/* Get VS-mode SSTATUS CSR */
 		vsstatus = csr_read(CSR_VSSTATUS);
 
+		/*if elp was set, set it back in vsstatus */
+		if (elp)
+			vsstatus |= MSTATUS_SPELP;
+
 		/* Set SPP for VS-mode */
 		vsstatus &= ~SSTATUS_SPP;
 		if (prev_mode == PRV_S)
@@ -209,6 +225,10 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
 
 		/* Clear SIE for S-mode */
 		regs->mstatus &= ~MSTATUS_SIE;
+
+		/* if elp was set, set it back in mstatus */
+		if (elp)
+			regs->mstatus |= MSTATUS_SPELP;
 	}
 
 	return 0;
-- 
2.44.0


