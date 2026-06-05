Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B8CD6E7D
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4P4kLSu6gCznvEPbDz1ynzvdyzA/0IOYOLSE5jIWzGo=; b=fVAylyhf8u85U/
	/oPhD3jEGEQAMSsoCnPFIfmnZPFClfNKhPhPD21JGCnC6oomBi/oKtJECmCGF+Kswi2MlpDKNnmsi
	HyvFlEO2mfO93zSkV+1x2954I38hP7LPTLDM5D0fypH5fE4B2d5rEAqdDgCcJb9euIlfnvc1pcdha
	VXbm/VAsr3RU74FNWJHt7yLHGbXepvYiBRxw1sXD/QF54j0Xu1s8lKGgyCoHaq0OhFvFa1kBTmo/P
	F+Ccrlydh0inKJt6T0wtLRM/K7LU+fTFqFXAUrsuPUq3H4IZhbAxEznv2WbE0ce71Dj19hVbENeRs
	K8m4aEjHR2qeALKBiVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSos-00000000Xou-2EbS;
	Fri, 05 Jun 2026 11:34:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSol-00000000Xlt-3xxz
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8422c327755so994264b3a.2
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659267; x=1781264067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp0mpe7gXdjg41asH+dwmm7Y6o2zI8PVHz5fo7rrV8w=;
        b=qAMrJPaBXpIkuVfJjEFGkUTUJspUCSchVIKC0uNMUKVXQ19Hg85xwG2uvCYM9J06Y/
         TPI04vgJ4fV3hZC2unSFfQ0o9W6UcY09uPW3BWA4fIQ2L5azs6CbtJZwkxIxplm3uDd9
         FFG7C6+E5fTz/2O9DwOBIblU6h4SkoNjmUx71l3S5e4+3Ja00QyI5cdfLGpi6W2jxxlO
         sBxhjNv5CDcyp8znUFTMzUt4m+6fViPy0QQhOWAXxddaoEAcj1ZhRbpMYxN2nDIWMNUF
         fel71FA7G0ne0bL/1IOKzXeq3tPYZ/CcyexqiRqyb1Lz2HEaGhalhmBq03UnFi1m2MkA
         hCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659267; x=1781264067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hp0mpe7gXdjg41asH+dwmm7Y6o2zI8PVHz5fo7rrV8w=;
        b=b5xijQmyj4oAAf7CeDOR+HpPXHELM4IspBk773tpbDjvND4uPjfPGE1LSQnnpjwidw
         J57Euddknl5FxOEcebKuxTHmtk241zYEqEetkJlVm25Lpa0kg0l6t+6A07gvfle1dHzG
         4d8D8EL3/v2FoU/W4hU/haEBqtzQIZeIdTTtLGKnNCdVerUix9/tX6ZAtyNXR7iPljIQ
         iD6xomYpk7zbowWgju3rL6m+ouSyNFQM28Wa+Td5QpZBmj38dNXDzs1nTJpAxstKll89
         4HKzoKZgktg3YOk6/M0bvb+10BEfWJ/sCLmRZPrShjgWJ3QMHbkfyoyM0ivRvYEJItAp
         6emw==
X-Gm-Message-State: AOJu0YxiSHvp1dnNc+oO9MptqCPvdnzh+fmlj/MUhodcfTD5HT1NYIbL
	gzXqM+Rsp9LoJjqQl6Kl6RFCVcXryYH2WxSee3P/+LJ/GXgX5509KI5VOOlHSQ==
X-Gm-Gg: Acq92OGdW5Hk5fA2NeiMxquiQxBy21tob1SbN2nnek4JaspfCevkgA8qDVCFkTn3Nzr
	RRRr0tQIJkKzZiEFIkd6MJMJGfecUfJQlIb9NW58h77ojFRgOVoJr+R/MwAht/YzylB7xht7tdC
	br7pmkElxIo2hFhRNCFDaojkjbFrdPb/SE1lebYUlZL3wTG9vH5MSz5wqA+7QvVA0RZtFi+uCYk
	7oHWSPqIfVFDs913mBGTUFsmqIhv58a9/e9TNYa0p59WXHOHlcp+x4jJnF+ID3wXZsNaX5+sVHh
	1JLgKs3mZPZrItIj+hMhVLI/J9lb/9x5ino+j/nj/mN4yo8uwvkobQ7F0wZpCV4bB87VOR6EVhW
	dRBL78O/BvYHBA2beOt+Xu6W6V4VjiWYEoFqs/iL4ann6503X+V4Ix9c0yL8vzRrX9idGBpExjp
	Yx+1e7FpNaAZqkHd4eGxHw/dytCTLyVtdMP0g=
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr3315027b3a.4.1780659266949;
        Fri, 05 Jun 2026 04:34:26 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:26 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 5/8] lib: sbi: Do not override emulator callback for vector load/store
Date: Fri,  5 Jun 2026 04:32:11 -0700
Message-Id: <20260605113214.242-6-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043428_607376_D717051D 
X-CRM114-Status: GOOD (  29.00  )
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

It's wrong to override the emulator callback in sbi_trap_emulate_load/
store. The function must respect the callback function passed in the
parameter. Hence, let the misaligned emulator callback decide when to
use sbi_misaligned_v_ld/st_emulator. To clean up things, also make the
following changes:

- Add the `insn` parameter to the callback. The trapping insn has been
  fetched by the caller already, whether transformed or directly loaded,
  thus saving the trouble in the callback. Note that you must not rely
  on the length of the `insn`, as it can be a transformed one from tinst

- Also the `tcntx` is added, providing the callback with register values
  to handle vector insn or other customized insns.

- Clarify that the read/write length (rlen/wlen) can be 0, in which
  case it could be a vector load/store or some customized instruction.
  The callback is responsible to handle it accordingly.

Also fixed issues in the sbi_misaligned_v_ld/st_emulator:
a. Redirect the trap when OPENSBI_CC_SUPPORT_VECTOR is not available.
b. Ensure the return code is >0 when no faults are redirected.

Fixes: c2acc5e5b0d8 ("lib: sbi_misaligned_ldst: Add handling of vector load/store")
Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_platform.h  |  92 +++++++++++++++++++++++----------
 include/sbi/sbi_trap_ldst.h |   4 +-
 lib/sbi/sbi_trap_ldst.c     | 100 ++++++++++++++++++++++--------------
 lib/sbi/sbi_trap_v_ldst.c   |  25 ++++-----
 4 files changed, 139 insertions(+), 82 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index fe382b56..525cde51 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -136,12 +136,17 @@ struct sbi_platform_operations {
 				   struct sbi_trap_regs *regs,
 				   struct sbi_ecall_return *out);
 
-	/** platform specific handler to fixup load fault */
-	int (*emulate_load)(int rlen, unsigned long addr,
-			    union sbi_ldst_data *out_val);
-	/** platform specific handler to fixup store fault */
-	int (*emulate_store)(int wlen, unsigned long addr,
-			     union sbi_ldst_data in_val);
+	/** platform specific handler to fixup load fault
+	 *  Refer to comments below at sbi_platform_emulate_load */
+	int (*emulate_load)(ulong insn, int rlen, ulong addr,
+			    union sbi_ldst_data *out_val,
+			    struct sbi_trap_context *tcntx);
+
+	/** platform specific handler to fixup store fault
+	 *  Refer to comments below at sbi_platform_emulate_store */
+	int (*emulate_store)(ulong insn, int wlen, ulong addr,
+			     union sbi_ldst_data in_val,
+			     struct sbi_trap_context *tcntx);
 
 	/** platform specific pmp setup on current HART */
 	void (*pmp_set)(unsigned int n, unsigned long flags,
@@ -620,45 +625,76 @@ static inline int sbi_platform_vendor_ext_provider(
 }
 
 /**
- * Ask platform to emulate the trapped load
+ * Ask platform to emulate the trapped load:
  *
- * @param plat pointer to struct sbi_platform
- * @param rlen length of the load: 1/2/4/8...
- * @param addr virtual address of the load. Platform needs to page-walk and
- *        find the physical address if necessary
- * @param out_val value loaded
+ * @param insn the instruction that caused the load fault.
+ *             It could be a transformed instruction from tinst, thus do
+ *             not rely on the length of insn, and use appropriate return
+ *             code, so the caller can advance mepc properly.
+ * @param rlen read length in [0, 1, 2, 4, 8]. If 0, it's a special load.
+ *             In that case, it could be a vector load or customized insn,
+ *             which may read/gather a block of memory. The emulator should
+ *             further parse the @insn (fetch if 0), and act accordingly.
+ * @param raddr read address. If @rlen is not 0, it's the base address of
+ *              the load. It doesn't necessarily match tcntx->trap->tval,
+ *              in case of unaligned load triggering access fault.
+ *              If @rlen is 0, @raddr should be ignored.
+ * @param out_val the buffer to hold data loaded by the emulator.
+ *                If @rlen == 0, @out_val is ignored by caller.
+ * @param tcntx trap context saved on load fault entry.
  *
- * @return 0 on success and negative error code on failure
+ * @return >0 success: register will be updated by caller if @rlen != 0,
+ *            and mepc will be advanced by caller.
+ *         0  success: no register modification; no mepc advancement.
+ *         <0 failure
+ *
+ * It's expected that if @rlen != 0, and the emulator returns >0, the
+ * caller will set the corresponding registers with @out_val to simplify
+ * things. Otherwise, no register manipulation is done by the caller.
  */
 static inline int sbi_platform_emulate_load(const struct sbi_platform *plat,
-					    int rlen, unsigned long addr,
-					    union sbi_ldst_data *out_val)
+					    ulong insn, int rlen, ulong raddr,
+					    union sbi_ldst_data *out_val,
+					    struct sbi_trap_context *tcntx)
 {
 	if (plat && sbi_platform_ops(plat)->emulate_load) {
-		return sbi_platform_ops(plat)->emulate_load(rlen, addr,
-							    out_val);
+		return sbi_platform_ops(plat)->emulate_load(insn, rlen, raddr,
+							    out_val, tcntx);
 	}
 	return SBI_ENOTSUPP;
 }
 
 /**
- * Ask platform to emulate the trapped store
+ * Ask platform to emulate the trapped store:
  *
- * @param plat pointer to struct sbi_platform
- * @param wlen length of the store: 1/2/4/8...
- * @param addr virtual address of the store. Platform needs to page-walk and
- *        find the physical address if necessary
- * @param in_val value to store
+ * @param insn the instruction that caused the store fault.
+ *             It could be a transformed instruction from tinst, thus do
+ *             not rely on the length of insn, and use appropriate return
+ *             code, so the caller can advance mepc properly.
+ * @param wlen write length in [0, 1, 2, 4, 8]. If 0, it's a special store.
+ *             In that case, it could be a vector store or customized insn,
+ *             which may write/scatter a block of memory. The emulator should
+ *             further parse the @insn (fetch if 0), and act accordingly.
+ * @param waddr write address. If @wlen is not 0, it's the base address of
+ *              the store. It doesn't necessarily match tcntx->trap->tval,
+ *              in case of unaligned store triggering access fault.
+ *              If @wlen is 0, @waddr should be ignored.
+ * @param in_val the buffer to hold data about to be stored by the emulator.
+ *               If @wlen == 0, @in_val should be ignored.
+ * @param tcntx trap context saved on store fault entry.
  *
- * @return 0 on success and negative error code on failure
+ * @return >0 success: mepc will be advanced by caller.
+ *         0  success: no mepc advancement.
+ *         <0 failure
  */
 static inline int sbi_platform_emulate_store(const struct sbi_platform *plat,
-					     int wlen, unsigned long addr,
-					     union sbi_ldst_data in_val)
+					     ulong insn, int wlen, ulong waddr,
+					     union sbi_ldst_data in_val,
+					     struct sbi_trap_context *tcntx)
 {
 	if (plat && sbi_platform_ops(plat)->emulate_store) {
-		return sbi_platform_ops(plat)->emulate_store(wlen, addr,
-							     in_val);
+		return sbi_platform_ops(plat)->emulate_store(insn, wlen, waddr,
+							     in_val, tcntx);
 	}
 	return SBI_ENOTSUPP;
 }
diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index a6a6c75b..33c348c5 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -31,10 +31,10 @@ int sbi_store_access_handler(struct sbi_trap_context *tcntx);
 ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
 				 ulong addr_offset);
 
-int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
+int sbi_misaligned_v_ld_emulator(ulong insn,
 				 struct sbi_trap_context *tcntx);
 
-int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
+int sbi_misaligned_v_st_emulator(ulong insn,
 				 struct sbi_trap_context *tcntx);
 
 #endif
diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index 448406b1..ad19926a 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -18,18 +18,18 @@
 
 /**
  * Load emulator callback:
- *
- * @return rlen=success, 0=success w/o regs modification, or negative error
+ *   Refer to comments of `sbi_platform_emulate_load`.
  */
-typedef int (*sbi_trap_ld_emulator)(int rlen, union sbi_ldst_data *out_val,
+typedef int (*sbi_trap_ld_emulator)(ulong insn, int rlen, ulong raddr,
+				    union sbi_ldst_data *out_val,
 				    struct sbi_trap_context *tcntx);
 
 /**
  * Store emulator callback:
- *
- * @return wlen=success, 0=success w/o regs modification, or negative error
+ *   Refer to comments of `sbi_platform_emulate_store`.
  */
-typedef int (*sbi_trap_st_emulator)(int wlen, union sbi_ldst_data in_val,
+typedef int (*sbi_trap_st_emulator)(ulong insn, int wlen, ulong waddr,
+				    union sbi_ldst_data in_val,
 				    struct sbi_trap_context *tcntx);
 
 ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
@@ -52,7 +52,7 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 	ulong insn, insn_len;
 	union sbi_ldst_data val = { 0 };
 	struct sbi_trap_info uptrap;
-	int rc, fp = 0, shift = 0, len = 0, vector = 0;
+	int rc, fp = 0, shift = 0, len = 0;
 
 	if (orig_trap->tinst & 0x1) {
 		/*
@@ -144,28 +144,24 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 		len = 2;
 		shift = 8 * (sizeof(ulong) - len);
 		insn = RVC_RS2S(insn) << SH_RD;
-	} else if (IS_VECTOR_LOAD_STORE(insn)) {
-		vector = 1;
-		emu = sbi_misaligned_v_ld_emulator;
-	} else {
-		return sbi_trap_redirect(regs, orig_trap);
 	}
 
-	rc = emu(len, &val, tcntx);
+	rc = emu(insn, len, orig_trap->tval, &val, tcntx);
 	if (rc <= 0)
 		return rc;
+	if (!len)
+		goto epc_fixup;
 
-	if (!vector) {
-		if (!fp)
-			SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
+	if (!fp)
+		SET_RD(insn, regs, ((long)(val.data_ulong << shift)) >> shift);
 #ifdef __riscv_flen
-		else if (len == 8)
-			SET_F64_RD(insn, regs, val.data_u64);
-		else
-			SET_F32_RD(insn, regs, val.data_ulong);
+	else if (len == 8)
+		SET_F64_RD(insn, regs, val.data_u64);
+	else
+		SET_F32_RD(insn, regs, val.data_ulong);
 #endif
-	}
 
+epc_fixup:
 	regs->mepc += insn_len;
 
 	return 0;
@@ -253,13 +249,9 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
 		len		= 2;
 		val.data_ulong = GET_RS2S(insn, regs);
-	} else if (IS_VECTOR_LOAD_STORE(insn)) {
-		emu = sbi_misaligned_v_st_emulator;
-	} else {
-		return sbi_trap_redirect(regs, orig_trap);
 	}
 
-	rc = emu(len, val, tcntx);
+	rc = emu(insn, len, orig_trap->tval, val, tcntx);
 	if (rc <= 0)
 		return rc;
 
@@ -268,7 +260,8 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 	return 0;
 }
 
-static int sbi_misaligned_ld_emulator(int rlen, union sbi_ldst_data *out_val,
+static int sbi_misaligned_ld_emulator(ulong insn, int rlen, ulong addr,
+				      union sbi_ldst_data *out_val,
 				      struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
@@ -276,9 +269,20 @@ static int sbi_misaligned_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 	struct sbi_trap_info uptrap;
 	int i;
 
+	if (!rlen) {
+		if (IS_VECTOR_LOAD_STORE(insn))
+			return sbi_misaligned_v_ld_emulator(insn, tcntx);
+		else
+			/* Unrecognized instruction. Can't emulate it. */
+			return sbi_trap_redirect(regs, orig_trap);
+	}
+	/* For misaligned fault, addr must be the same as orig_trap->tval */
+	if (addr != orig_trap->tval)
+		return SBI_EFAIL;
+
 	for (i = 0; i < rlen; i++) {
 		out_val->data_bytes[i] =
-			sbi_load_u8((void *)(orig_trap->tval + i), &uptrap);
+			sbi_load_u8((void *)(addr + i), &uptrap);
 		if (uptrap.cause) {
 			uptrap.tinst = sbi_misaligned_tinst_fixup(
 				orig_trap->tinst, uptrap.tinst, i);
@@ -293,7 +297,8 @@ int sbi_misaligned_load_handler(struct sbi_trap_context *tcntx)
 	return sbi_trap_emulate_load(tcntx, sbi_misaligned_ld_emulator);
 }
 
-static int sbi_misaligned_st_emulator(int wlen, union sbi_ldst_data in_val,
+static int sbi_misaligned_st_emulator(ulong insn, int wlen, ulong addr,
+				      union sbi_ldst_data in_val,
 				      struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
@@ -301,8 +306,19 @@ static int sbi_misaligned_st_emulator(int wlen, union sbi_ldst_data in_val,
 	struct sbi_trap_info uptrap;
 	int i;
 
+	if (!wlen) {
+		if (IS_VECTOR_LOAD_STORE(insn))
+			return sbi_misaligned_v_st_emulator(insn, tcntx);
+		else
+			/* Unrecognized instruction. Can't emulate it. */
+			return sbi_trap_redirect(regs, orig_trap);
+	}
+	/* For misaligned fault, addr must be the same as orig_trap->tval */
+	if (addr != orig_trap->tval)
+		return SBI_EFAIL;
+
 	for (i = 0; i < wlen; i++) {
-		sbi_store_u8((void *)(orig_trap->tval + i),
+		sbi_store_u8((void *)(addr + i),
 			     in_val.data_bytes[i], &uptrap);
 		if (uptrap.cause) {
 			uptrap.tinst = sbi_misaligned_tinst_fixup(
@@ -318,22 +334,26 @@ int sbi_misaligned_store_handler(struct sbi_trap_context *tcntx)
 	return sbi_trap_emulate_store(tcntx, sbi_misaligned_st_emulator);
 }
 
-static int sbi_ld_access_emulator(int rlen, union sbi_ldst_data *out_val,
+static int sbi_ld_access_emulator(ulong insn, int rlen, ulong addr,
+				  union sbi_ldst_data *out_val,
 				  struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
+	int rc;
 
 	/* If fault came from M mode, just fail */
 	if (sbi_mstatus_prev_mode(regs->mstatus) == PRV_M)
 		return SBI_EINVAL;
 
+	rc = sbi_platform_emulate_load(sbi_platform_thishart_ptr(),
+				       insn, rlen, addr, out_val, tcntx);
+
 	/* If platform emulator failed, we redirect instead of fail */
-	if (sbi_platform_emulate_load(sbi_platform_thishart_ptr(), rlen,
-				      orig_trap->tval, out_val))
+	if (rc < 0)
 		return sbi_trap_redirect(regs, orig_trap);
 
-	return rlen;
+	return rc;
 }
 
 int sbi_load_access_handler(struct sbi_trap_context *tcntx)
@@ -341,22 +361,26 @@ int sbi_load_access_handler(struct sbi_trap_context *tcntx)
 	return sbi_trap_emulate_load(tcntx, sbi_ld_access_emulator);
 }
 
-static int sbi_st_access_emulator(int wlen, union sbi_ldst_data in_val,
+static int sbi_st_access_emulator(ulong insn, int wlen, ulong addr,
+				  union sbi_ldst_data in_val,
 				  struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
+	int rc;
 
 	/* If fault came from M mode, just fail */
 	if (sbi_mstatus_prev_mode(regs->mstatus) == PRV_M)
 		return SBI_EINVAL;
 
+	rc = sbi_platform_emulate_store(sbi_platform_thishart_ptr(),
+					insn, wlen, addr, in_val, tcntx);
+
 	/* If platform emulator failed, we redirect instead of fail */
-	if (sbi_platform_emulate_store(sbi_platform_thishart_ptr(), wlen,
-				       orig_trap->tval, in_val))
+	if (rc < 0)
 		return sbi_trap_redirect(regs, orig_trap);
 
-	return wlen;
+	return rc;
 }
 
 int sbi_store_access_handler(struct sbi_trap_context *tcntx)
diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index f4d469dc..57f12b83 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -137,13 +137,11 @@ static inline void vsetvl(ulong vl, ulong vtype)
 			:: "r" (vl), "r" (vtype));
 }
 
-int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
-				 struct sbi_trap_context *tcntx)
+int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
 	struct sbi_trap_info uptrap;
-	ulong insn = sbi_get_insn(regs->mepc, &uptrap);
 	ulong vl = csr_read(CSR_VL);
 	ulong vtype = csr_read(CSR_VTYPE);
 	ulong vlenb = csr_read(CSR_VLENB);
@@ -234,16 +232,15 @@ int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 	/* restore clobbered vl/vtype */
 	vsetvl(vl, vtype);
 
-	return vl;
+	/* Return a >0 value for the caller to advance mepc */
+	return 1;
 }
 
-int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
-				 struct sbi_trap_context *tcntx)
+int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
 	struct sbi_trap_info uptrap;
-	ulong insn = sbi_get_insn(regs->mepc, &uptrap);
 	ulong vl = csr_read(CSR_VL);
 	ulong vtype = csr_read(CSR_VTYPE);
 	ulong vlenb = csr_read(CSR_VLENB);
@@ -328,17 +325,17 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 	/* restore clobbered vl/vtype */
 	vsetvl(vl, vtype);
 
-	return vl;
+	/* Return a >0 value for the caller to advance mepc */
+	return 1;
 }
 #else
-int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
-				 struct sbi_trap_context *tcntx)
+int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
-	return 0;
+	return sbi_trap_redirect(&tcntx->regs, &tcntx->trap);
 }
-int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
-				 struct sbi_trap_context *tcntx)
+
+int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
-	return 0;
+	return sbi_trap_redirect(&tcntx->regs, &tcntx->trap);
 }
 #endif /* OPENSBI_CC_SUPPORT_VECTOR */
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
