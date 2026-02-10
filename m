Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742D1EA3F2F
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjB0Z7xPeCpiksdd83+SzX9w+kwTk+s0kvFwk01TOe0=; b=WKUtLUqCK+oMwE
	JzmUqgym7HG9IB+CVHFZ/CmL4syZwSbCwwrtQg+asSzkCp/JieLPBdjGXpBk2I1t4BonkqQ11lF1N
	BQlhtHk4AcOv9SacJFxoILPrrG1OAG/NEcWs3iDtRTNWMCiGcwUB4tSqXIRW7QwpF4DJV+BSrivF8
	SPjL2KW22W/bmxkIDjfDpwSF437BvbPBz0zk2XQFM7j1shovT2WL3VBvcX4KX9kJy9umgMFej5uB9
	1AWPjVQC0pJUs3sLtrEKYasguiuxe5NlwmQ2n90sHYJm0C1FTsEGel2j+26gtmfIjGSyRDwTk9sYr
	c85wuuLAc+IDEYk/VO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGm-0000000GlaJ-0W3c;
	Tue, 10 Feb 2026 09:42:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGk-0000000GlYP-009t
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 09:42:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a871c8b171so3668605ad.3
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 01:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716573; x=1771321373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IveLlqQqrdBxEMAYR7xGPCBIk2f7ClSdGEvmHTCiODQ=;
        b=aQjxJw4AMhTrgzPsyPcIJixydhRKjXXDUDyDkY8kzhRU6HkxWGgwvBeIQMCLtqq8GK
         K3pzWXvtiXDNU/oLwUThHzfvoOlWxIZX6ipA+5wKl7UIUg3TnSi2Ol8m8xs5dcvpqFKC
         49gu/RlP2xxeHPfMwIvEN581UftriE68COts0RhcuU3j2AlzUWioP6FI0mv84K8Et9aW
         3EiR9IlGScrwJQ/Np2H5+CzQdHAFyKVZ1SpJ/FAcFX26TJagguBPjUBIZLFovJHkr/B5
         7K9Oa7iaSNgPBh7SunDcq1br49mCefyTo9EAMfPkC/neUUmC5MuTuyCUA5yGmW8x8U7+
         tbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716573; x=1771321373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IveLlqQqrdBxEMAYR7xGPCBIk2f7ClSdGEvmHTCiODQ=;
        b=ER0YoUqGK/Oz0J5MqzJgMlZRUeo0Xz/UpC/UKgPmVK7nGV9YMZfJj8vsatebHEUvfV
         HffkO4GN5TBq9/csUhG1OfhEcCifkFF8y005uU8qi5mEr2NOJDXAHZsOuWuHPGZneXZS
         G5dUDq6f/sl869x8ykoGwjhFecsBHNbLLZhXLXo8fBSEZFAH2xOiv6tnM808Ha3OOHV6
         IfVfxkWik90IJGEVVvNGa7QFcaRkqFPLYa1vVAQ6wW5vXp8VXgAbnXDH8qfylPzs/ws8
         /Ug3Bogr33/Yj5T3pUFw3gEvSl4SviaI/sKGVGN7I+kIoWIbG8yfpRgcqxVH81DF/BPw
         D39w==
X-Gm-Message-State: AOJu0YwsvgBh9ihQtnEY1naA//igr1Ka+iEmjA+TaqryTWDQ5XIN8NuO
	dNwHgR0TRjE31IddV/SWx1zD6mcfx+5nEmzWwKMCR+z1dQ6VmJyaD4VIKTENkw==
X-Gm-Gg: AZuq6aITwBpa80IyYEcnmuQnXfsaqAsozR0oDw4201WYmUpHgLn+0BGImDQv1XDZoG0
	Bsdpl6F6M2tobyJ+1tWl3driZWY0icsshr8xsqoSGuWkLJJDt9O55PghHF81btKIExNGnHcAfBO
	oyN8x7xF2YgqYMj2/2g9p3ATks4VfJpY208APknatk5DQXPCibzbfy7QL+rtTXWspSQVf+kokpS
	L4yfk66nf6VuRUUqWbMoCEyMcWFf8JlX2Kidx9DmyvgQaJKmDTQrERkHxy/RnSXS3AZEx7uO3Dc
	MLTt6dC/JnmmrOmNdw/HPHmszNkjIjnwzKYR/28etYWQ/K4OB4QNJS6b/Fvbyz2NrDScPcMSdmP
	q9iCDqyeLLtdBP8QRq7wLvNiGkn1QjhkJFZy/3HoIXZXrx8EVF9YZH4owmRpFTg5O4Gey40CXSK
	A/0bhj4rBs9ApfZZAV5VNa1OoU
X-Received: by 2002:a17:902:e847:b0:2aa:d816:e1a9 with SMTP id d9443c01a7336-2aad816e3e1mr86389525ad.28.1770716572545;
        Tue, 10 Feb 2026 01:42:52 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm133219215ad.61.2026.02.10.01.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:42:51 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	dramforever@live.com,
	anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org,
	cleger@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH 5/7] lib: sbi: Do not override emulator callback for vector load/store
Date: Tue, 10 Feb 2026 01:40:42 -0800
Message-Id: <20260210094044.72591-6-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210094044.72591-1-ganboing@gmail.com>
References: <20260210094044.72591-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014254_072061_E5D63C4D 
X-CRM114-Status: GOOD (  29.49  )
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

- Add the `insn` parameter to the callback. The trapping insn could
  have been fetched by the caller already, thus it saves some time
  in the callback. Also the `tcntx` is added, in case the callback
  needs richer information to properly handle the trap. Specifically,
  the callback can utilize the tinst if it knows how to decode custom
  values.

- Clarify that the read/write length (rlen/wlen) can be 0, in which
  case it could be a vector load/store or some customized instruction.
  The callback is responsible to handle it by parsing the insn (and
  fetch it if not available), and act accordingly.

Also fixes the following issue in the sbi_misaligned_v_ld/st_emulator

a. Not checking if sbi_get_insn has faulted
b. Need to redirect the trap when OPENSBI_CC_SUPPORT_VECTOR is not
   available.

Fixes: c2acc5e5b0d8 ("lib: sbi_misaligned_ldst: Add handling of vector load/store")
Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_platform.h  |  92 ++++++++++++++++++++----------
 include/sbi/sbi_trap_ldst.h |   4 +-
 lib/sbi/sbi_trap_ldst.c     | 111 ++++++++++++++++++++++++------------
 lib/sbi/sbi_trap_v_ldst.c   |  25 ++++----
 4 files changed, 150 insertions(+), 82 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index e65d9877..d3b2f9ad 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -137,11 +137,14 @@ struct sbi_platform_operations {
 				   struct sbi_ecall_return *out);
 
 	/** platform specific handler to fixup load fault */
-	int (*emulate_load)(int rlen, unsigned long addr,
-			    union sbi_ldst_data *out_val);
+	int (*emulate_load)(ulong insn, int rlen, ulong addr,
+			    union sbi_ldst_data *out_val,
+			    struct sbi_trap_context *tcntx);
+
 	/** platform specific handler to fixup store fault */
-	int (*emulate_store)(int wlen, unsigned long addr,
-			     union sbi_ldst_data in_val);
+	int (*emulate_store)(ulong insn, int wlen, ulong addr,
+			     union sbi_ldst_data in_val,
+			     struct sbi_trap_context *tcntx);
 
 	/** platform specific pmp setup on current HART */
 	void (*pmp_set)(unsigned int n, unsigned long flags,
@@ -612,45 +615,74 @@ static inline int sbi_platform_vendor_ext_provider(
 }
 
 /**
- * Ask platform to emulate the trapped load
- *
- * @param plat pointer to struct sbi_platform
- * @param rlen length of the load: 1/2/4/8...
- * @param addr virtual address of the load. Platform needs to page-walk and
- *        find the physical address if necessary
- * @param out_val value loaded
- *
- * @return 0 on success and negative error code on failure
+ * Ask platform to emulate the trapped load:
+ *
+ * @param insn the instruction that caused the load fault (optional)
+ *             If 0, it's not fetched by caller, and the emulator can
+ *             fetch it on a need basis.
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
+ *
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
- *
- * @param plat pointer to struct sbi_platform
- * @param wlen length of the store: 1/2/4/8...
- * @param addr virtual address of the store. Platform needs to page-walk and
- *        find the physical address if necessary
- * @param in_val value to store
- *
- * @return 0 on success and negative error code on failure
+ * Ask platform to emulate the trapped store:
+ *
+ * @param insn the instruction that caused the store fault (optional).
+ *             If 0, it's not fetched by caller, and the emulator can
+ *             fetch it on a need basis.
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
+ *
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
index 448406b1..22c4d5a7 100644
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
@@ -52,13 +52,15 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
 	ulong insn, insn_len;
 	union sbi_ldst_data val = { 0 };
 	struct sbi_trap_info uptrap;
-	int rc, fp = 0, shift = 0, len = 0, vector = 0;
+	int rc, fp = 0, shift = 0, len = 0;
+	bool xform = false;
 
 	if (orig_trap->tinst & 0x1) {
 		/*
 		 * Bit[0] == 1 implies trapped instruction value is
 		 * transformed instruction or custom instruction.
 		 */
+		xform	 = true;
 		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
 		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
 	} else {
@@ -144,27 +146,20 @@ static int sbi_trap_emulate_load(struct sbi_trap_context *tcntx,
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
+	rc = emu(xform ? 0 : insn, len, orig_trap->tval, &val, tcntx);
 	if (rc <= 0)
 		return rc;
 
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
 
 	regs->mepc += insn_len;
 
@@ -180,12 +175,14 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 	union sbi_ldst_data val;
 	struct sbi_trap_info uptrap;
 	int rc, len = 0;
+	bool xform = false;
 
 	if (orig_trap->tinst & 0x1) {
 		/*
 		 * Bit[0] == 1 implies trapped instruction value is
 		 * transformed instruction or custom instruction.
 		 */
+		xform	 = true;
 		insn	 = orig_trap->tinst | INSN_16BIT_MASK;
 		insn_len = (orig_trap->tinst & 0x2) ? INSN_LEN(insn) : 2;
 	} else {
@@ -253,13 +250,9 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
 		len		= 2;
 		val.data_ulong = GET_RS2S(insn, regs);
-	} else if (IS_VECTOR_LOAD_STORE(insn)) {
-		emu = sbi_misaligned_v_st_emulator;
-	} else {
-		return sbi_trap_redirect(regs, orig_trap);
 	}
 
-	rc = emu(len, val, tcntx);
+	rc = emu(xform ? 0 : insn, len, orig_trap->tval, val, tcntx);
 	if (rc <= 0)
 		return rc;
 
@@ -268,7 +261,8 @@ static int sbi_trap_emulate_store(struct sbi_trap_context *tcntx,
 	return 0;
 }
 
-static int sbi_misaligned_ld_emulator(int rlen, union sbi_ldst_data *out_val,
+static int sbi_misaligned_ld_emulator(ulong insn, int rlen, ulong addr,
+				      union sbi_ldst_data *out_val,
 				      struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
@@ -276,9 +270,25 @@ static int sbi_misaligned_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 	struct sbi_trap_info uptrap;
 	int i;
 
+	if (!rlen) {
+		if (!insn) {
+			insn = sbi_get_insn(regs->mepc, &uptrap);
+			if (uptrap.cause)
+				return sbi_trap_redirect(regs, &uptrap);
+		}
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
@@ -293,7 +303,8 @@ int sbi_misaligned_load_handler(struct sbi_trap_context *tcntx)
 	return sbi_trap_emulate_load(tcntx, sbi_misaligned_ld_emulator);
 }
 
-static int sbi_misaligned_st_emulator(int wlen, union sbi_ldst_data in_val,
+static int sbi_misaligned_st_emulator(ulong insn, int wlen, ulong addr,
+				      union sbi_ldst_data in_val,
 				      struct sbi_trap_context *tcntx)
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
@@ -301,8 +312,24 @@ static int sbi_misaligned_st_emulator(int wlen, union sbi_ldst_data in_val,
 	struct sbi_trap_info uptrap;
 	int i;
 
+	if (!wlen) {
+		if (!insn) {
+			insn = sbi_get_insn(regs->mepc, &uptrap);
+			if (uptrap.cause)
+				return sbi_trap_redirect(regs, &uptrap);
+		}
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
@@ -318,22 +345,26 @@ int sbi_misaligned_store_handler(struct sbi_trap_context *tcntx)
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
@@ -341,22 +372,26 @@ int sbi_load_access_handler(struct sbi_trap_context *tcntx)
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
index f4d469dc..f361ce04 100644
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
@@ -237,13 +235,11 @@ int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 	return vl;
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
@@ -331,14 +327,19 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 	return vl;
 }
 #else
-int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
-				 struct sbi_trap_context *tcntx)
+int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
-	return 0;
+	const struct sbi_trap_info *orig_trap = &tcntx->trap;
+	struct sbi_trap_regs *regs = &tcntx->regs;
+
+	return sbi_trap_redirect(regs, orig_trap);
 }
-int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
-				 struct sbi_trap_context *tcntx)
+
+int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
-	return 0;
+	const struct sbi_trap_info *orig_trap = &tcntx->trap;
+	struct sbi_trap_regs *regs = &tcntx->regs;
+
+	return sbi_trap_redirect(regs, orig_trap);
 }
 #endif /* OPENSBI_CC_SUPPORT_VECTOR */
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
