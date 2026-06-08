Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D141CD8CA7
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcrCLaASEjwOjClYL95g7R0sCgeCYnomEC++K9SG9FA=; b=2HAzF26vGtyZdn
	UTFTRv1yG9GOJ2S46P8j3UWYD7wIMf+dgXz4EErJxLp22JZcStNGSc62CsqOAVG574qlmczNAx0nj
	pPQBa3QavwoDrNQtXiB92AvlCSKf4Uqt5fjHBFNC986PYfnQSr6z2Dp+HkslaCJ+v8Zsjsn4kLEEM
	4yMs50oxeg5mXVb0okhc6QdK8QXLMXugw9DbErvom9qTycXx6eekVDfPRL9UogW+PrXqYO4jKzuet
	1hHUPnyLTZylhOM9FAj3cvHfkXo8q5rSIWT7LdcHXYZueWQ39lkgqN30Jfwz12TEn7TWZSSy9lYUF
	7LReREYjoH/sHI32/bSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNd-00000004Q7L-1Wag;
	Mon, 08 Jun 2026 21:19:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNa-00000004Q5S-2F89
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 21:19:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so30552875ad.1
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780953570; x=1781558370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfNRnD9x2Yh/qeYUcpw6Nh+xVau8XH0blG8OMUAwD1Y=;
        b=RvgGFftXk2bp6HAyXEdbZXhwhCM6c8rSWT9G/6M+bOes1utmJvZlx9qwqMF1mNy9UP
         Tm4Un3R3AVVM5Iv2xW8BGCLN81ZpdSLv9sy5YYK2vHYLusPZ9h/zJKSl6EEBP9IGkI7E
         on54eMc1DwaRBfEmsyys9G47MRMpJD7COGF3f4Y+ipjxOrA/mAVR3ENXqTmn/1bDXjVT
         jokpy4KJWogAP2flLe8KUnk02sD5BGQmsh3weEdOgxZ/nr0TBnpDBK0WS6N6BtGN/2rZ
         t8SbjBEfab3D4Ibc0bPffIj7ASqQDi1+niTwbwDs8ZJZ5yGFyatqSyXRp7sHDd+9/lAu
         q2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953570; x=1781558370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UfNRnD9x2Yh/qeYUcpw6Nh+xVau8XH0blG8OMUAwD1Y=;
        b=HYLg2hnV0cMM36TC3VXAIi8fTmkNHvvswwl2w38/y+h7tfLFmJqJPSydLoy4lQwfZm
         gJIEctHlh4myoXG2xJTpXVT6wO5ACpHJit4jKPTLqoYFQuABPxuQVcCYMxlwyDz0fFdo
         2doUprD9xBESI9vGRd60S13kITzFbQvRosMn5oBkqkJyF2l0h0bCOHDFKn5MxpXxvKVa
         K6klOURyRLg0SwZmfCgm5hZKUNtJuP88g73MebN54vt5PnR02ij3b2khMda0KEe8xi7z
         y8z2CfaF8bOYhnsluWgkp+tt0pT7x7sjUQW35VS0vpJJmdvmSaK9X2AQi+rChL1SErvP
         iZoA==
X-Gm-Message-State: AOJu0YzmKI32bS1JB4EbFBggx0/7WBUdY3Qox5bgbllb202AerXGuayJ
	mJzH296Y0W4xruDedrj6/iObDOi1PgmRdrC7mCthZZlXerCJDesSgFjPLeGtTw==
X-Gm-Gg: Acq92OEZZXWT60zjpZkRY6m75VtG5Z7ffRE7UpYTPHYvxEXLr2m3NhrY9hQt5c5p1Bs
	z6QUth3/PX+PqKM0USxkTtapFkonC+MJvteZ1GjkWt7Qlh7Y4LYIIoCpwQ8GzkcNkgfqmXtnr7A
	xc6Pwr2d7ZzVgtztRVAf1KbGbYi9xzHuH7/V7JmYgpyLiEAlsFP5z8hWV1zG10LT4I4gKHU0T0r
	MOCUYVMZIWAiAOlXcyWlzPmqNU+srSAoY+zXAk7nbsjiaKMHePYHStcxLkl+o0xR9XgtMoRUQ9E
	9EQSZD9qG5F6OcZYdkwt5uPpLKeqZGJ7e4s3VpKyKy3Tz9hWXk1Oobvhxd+m8zyviFtFIZJqt2M
	zlz3xhkgO+vQhLlMRn6RXed4mzkAfhn4JLCGYkPARhpGjslSYhig15vkav13kxhDl1TnAAEO9Gt
	eyEnPDeP0Z8WktIr+Z8fHPYrrZTrMcBltXnkQ=
X-Received: by 2002:a17:903:990:b0:2bf:1845:baf5 with SMTP id d9443c01a7336-2c1ec918402mr140014615ad.12.1780953569658;
        Mon, 08 Jun 2026 14:19:29 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm182789005ad.32.2026.06.08.14.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:19:29 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH 4/4] lib: sbi: Rework misaligned vector load/store
Date: Mon,  8 Jun 2026 14:17:03 -0700
Message-Id: <20260608211703.571-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608211703.571-1-ganboing@gmail.com>
References: <20260608211703.571-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_141930_585150_7F8CC651 
X-CRM114-Status: GOOD (  19.10  )
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

Fix the following issues with misaligned vector load/store:

a. Stack overflow: the mask[VLEN_MAX / 8] variable consumes 8K stack
space, given VLEN_MAX=65536, overflowing the default-sized stack.
There's no need to fetch the whole mask in one go, instead, make it
on-demand. Use a 128-byte mask as local buffer to hold the sliding
window of mask. For rvv load, this is allowed -- from the spec:

  "The destination vector register group for a masked vector
   instruction cannot overlap the source mask register (v0),
   unless the destination vector register is being written with
   a mask value (e.g., compares) or the scalar result of a reduction"

We don't need to worry about the mask getting overwritten.

b. Maintain the value of vstart upon abort (uptrap) to avoid duplicate
work. After fault resolution, the instruction can restart from the
faulting vstart. For Fault-Only-First loads, reset vstart to 0, as
previously done so, to conform to spec.

c. Explicitly set VS dirty in VSSTATUS with SET_VS_DIRTY() if faulting
from V=1, and if any vector register, including vstart/vl/vtype, gets
changed in the handler. It can add 1 unnecessary op to set VS dirty
in M/SSTATUS (not VSSTATUS), where the HW already did, but for code
simplicity, do it anyway. The overhead should be negligible.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_vector.h  |   6 +++
 lib/sbi/sbi_trap_v_ldst.c | 100 +++++++++++++++++++++++++-------------
 2 files changed, 73 insertions(+), 33 deletions(-)

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
index f00184f0..c14f3174 100644
--- a/include/sbi/sbi_vector.h
+++ b/include/sbi/sbi_vector.h
@@ -20,6 +20,12 @@ struct sbi_vector_context {
 	uint8_t vregs[];
 };
 
+#define SET_VS_DIRTY(regs) do {				\
+	if (sbi_regs_from_virt(regs))			\
+		csr_set(CSR_VSSTATUS, MSTATUS_VS);	\
+	regs->mstatus |= MSTATUS_VS;			\
+} while(0)
+
 #ifdef OPENSBI_CC_SUPPORT_VECTOR
 void sbi_vector_save(struct sbi_vector_context *dst);
 void sbi_vector_restore(const struct sbi_vector_context *src);
diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index 02f7d6cc..8138b0b2 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -20,7 +20,7 @@
 
 #ifdef OPENSBI_CC_SUPPORT_VECTOR
 
-#define VLEN_MAX 65536
+#define MASK_BUFFLEN 1024
 
 static inline void set_vreg(ulong vlenb, ulong which,
 			    ulong pos, ulong size, const uint8_t *bytes)
@@ -168,7 +168,7 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 	ulong vl = csr_read(CSR_VL);
 	ulong vtype = csr_read(CSR_VTYPE);
 	ulong vlenb = csr_read(CSR_VLENB);
-	ulong vstart = csr_read(CSR_VSTART);
+	ulong orig_vstart = vstart = csr_read(CSR_VSTART);
 	ulong base = GET_RS1(insn, regs);
 	ulong stride = GET_RS2(insn, regs);
 	ulong vd = GET_VD(insn);
@@ -178,8 +178,9 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 	ulong vlmul = GET_VLMUL(vtype);
 	bool illegal = GET_MEW(insn);
 	bool masked = IS_MASKED(insn);
-	uint8_t mask[VLEN_MAX / 8];
+	uint8_t mask[MASK_BUFFLEN / 8];
 	uint8_t bytes[8 * sizeof(uint64_t)];
+	ulong mask_len = MASK_BUFFLEN < vlenb * 8 ? MASK_BUFFLEN : vlenb * 8;
 	ulong len = GET_LEN(view);
 	ulong nf = GET_NF(insn);
 	ulong vemul = GET_VEMUL(vlmul, view, vsew);
@@ -200,7 +201,7 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		stride = nf * len;
 	}
 
-	if (illegal || vlenb > VLEN_MAX / 8) {
+	if (illegal) {
 		struct sbi_trap_info trap = {
 			uptrap.cause = CAUSE_ILLEGAL_INSTRUCTION,
 			uptrap.tval = insn,
@@ -208,12 +209,16 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		return sbi_trap_redirect(regs, &trap);
 	}
 
-	if (masked)
-		get_vreg(vlenb, 0, 0, vlenb, mask);
-
 	do {
-		if (masked && (~mask[vstart / 8] & BIT(vstart % 8)))
-			continue;
+		if (masked) {
+			if (vstart == orig_vstart || vstart % mask_len == 0)
+				/* Fetch a mask_len chunk of mask */
+				get_vreg(vlenb, 0, vstart / mask_len * mask_len,
+					 mask_len, mask);
+
+			if (~mask[vstart % mask_len / 8] & BIT(vstart % 8))
+				continue;
+		}
 
 		/* compute element address */
 		ulong addr = base + vstart * stride;
@@ -232,15 +237,21 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 			sbi_load_loop(bytes + seg * len,
 				       addr + seg * len, len, &uptrap);
 
-			if (uptrap.cause) {
-				if (IS_FAULT_ONLY_FIRST_LOAD(insn) && vstart != 0) {
-					vl = vstart;
-					break;
-				}
-				vsetvl(vl, vtype);
-				sbi_misaligned_v_tinst_fixup(&uptrap);
-				return sbi_trap_redirect(regs, &uptrap);
+			if (!uptrap.cause)
+				continue;
+
+			if (IS_FAULT_ONLY_FIRST_LOAD(insn) && vstart != 0) {
+				vl = vstart;
+				goto done;
 			}
+
+			vsetvl(vl, vtype);
+			csr_write(CSR_VSTART, vstart);
+			/* Don't forget to set dirty if vstart has changed */
+			if (vstart != orig_vstart)
+				SET_VS_DIRTY(regs);
+			sbi_misaligned_v_tinst_fixup(&uptrap);
+			return sbi_trap_redirect(regs, &uptrap);
 		}
 
 		/* write load data to regfile */
@@ -249,8 +260,15 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 				 len, &bytes[seg * len]);
 	} while (++vstart < vl);
 
+done:
 	/* restore clobbered vl/vtype */
-	vsetvl(vl, vtype);
+	vsetvl(vl, vtype); // VSTART resets to 0
+
+	/*
+	 * At least 1 element is processed, or vl is changed above in
+	 * the FAULT_ONLY_FIRST_LOAD path, thus set dirty.
+	 */
+	SET_VS_DIRTY(regs);
 
 	/* Return a >0 value for the caller to advance mepc */
 	return 1;
@@ -271,10 +289,12 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 	ulong view = GET_VIEW(insn);
 	ulong vsew = GET_VSEW(vtype);
 	ulong vlmul = GET_VLMUL(vtype);
+	bool first = true;
 	bool illegal = GET_MEW(insn);
 	bool masked = IS_MASKED(insn);
-	uint8_t mask[VLEN_MAX / 8];
+	uint8_t mask[MASK_BUFFLEN / 8];
 	uint8_t bytes[8 * sizeof(uint64_t)];
+	ulong mask_len = MASK_BUFFLEN < vlenb * 8 ? MASK_BUFFLEN : vlenb * 8;
 	ulong len = GET_LEN(view);
 	ulong nf = GET_NF(insn);
 	ulong vemul = GET_VEMUL(vlmul, view, vsew);
@@ -295,7 +315,7 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		stride = nf * len;
 	}
 
-	if (illegal || vlenb > VLEN_MAX / 8) {
+	if (illegal) {
 		struct sbi_trap_info trap = {
 			uptrap.cause = CAUSE_ILLEGAL_INSTRUCTION,
 			uptrap.tval = insn,
@@ -303,12 +323,16 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		return sbi_trap_redirect(regs, &trap);
 	}
 
-	if (masked)
-		get_vreg(vlenb, 0, 0, vlenb, mask);
-
 	do {
-		if (masked && (~mask[vstart / 8] & BIT(vstart % 8)))
-			continue;
+		if (masked) {
+			if (first || vstart % mask_len == 0)
+				/* Fetch a mask_len chunk of mask */
+				get_vreg(vlenb, 0, vstart / mask_len * mask_len,
+					 mask_len, mask);
+
+			if (~mask[vstart % mask_len / 8] & BIT(vstart % 8))
+				continue;
+		}
 
 		/* compute element address */
 		ulong addr = base + vstart * stride;
@@ -325,23 +349,33 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 			get_vreg(vlenb, vd + seg * emul, vstart * len,
 				 len, &bytes[seg * len]);
 
-		csr_write(CSR_VSTART, vstart);
-
 		/* write store data to memory */
 		for (ulong seg = 0; seg < nf; seg++) {
 			sbi_store_loop(bytes + seg * len,
 					addr + seg * len, len, &uptrap);
 
-			if (uptrap.cause) {
-				vsetvl(vl, vtype);
-				sbi_misaligned_v_tinst_fixup(&uptrap);
-				return sbi_trap_redirect(regs, &uptrap);
-			}
+			if (!uptrap.cause)
+				continue;
+
+			vsetvl(vl, vtype);
+			csr_write(CSR_VSTART, vstart);
+			/* Don't forget to set dirty if vstart has changed */
+			if (vstart != orig_vstart)
+				SET_VS_DIRTY(regs);
+			sbi_misaligned_v_tinst_fixup(&uptrap);
+			return sbi_trap_redirect(regs, &uptrap);
 		}
 	} while (++vstart < vl);
 
 	/* restore clobbered vl/vtype */
-	vsetvl(vl, vtype);
+	vsetvl(vl, vtype); // VSTART resets to 0
+
+	/*
+	 * No need to set dirty for memory store, but as VSTART resets to
+	 * 0 above, need to set dirty if it's originally not 0.
+	 */
+	if (orig_vstart != 0)
+		SET_VS_DIRTY(regs);
 
 	/* Return a >0 value for the caller to advance mepc */
 	return 1;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
