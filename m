Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7EDCD8CB9
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdvaDcKZ5rZdt/HpQAe3aWeGyRbEIqWnGPyktoBD5mM=; b=q3NjHO7wWwaDNa
	4v+D17bP5qJSz7pZgCRZ1ppDc0EBfSH8O/GWzHaKEVVps1rZK0dH7DzQZv1o/u3hz+j0yLolh0/t6
	fAU3Ca4dA1ul2uTgh0UzqsonUsn2LD6/WULPpyiQOOKP1Sbfeveu7tHpOT0vkf0xYQ54BbELKQzMv
	CVusgIAvmwcP0O6gfipbMoDFvULLQmg+r5BoRAGjF21MhVLwLmulqS95b+PD2d9yN2T8dGDAsKglR
	09h2r+8oBVYE7Afm1ts0f01TTbV5ISlDRxDKOTteubNIeBG8uQY77QkPZw3bTOmiDCHvYWqZy0o5R
	NFBtF49jKVv+zgAGckfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXv-00000004nOZ-3bdc;
	Tue, 09 Jun 2026 06:02:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXt-00000004nJc-1Q8M
	for opensbi@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ArXdflsMbMAPz9wxUpor3EI3GcJx5CKRyDkJ23fIuYQ=; b=gVQuYE1cXEYeRZ0G89jpjBsbnt
	llRyc/L4ce3u9G+zActnAuoj96bpZo6s6G3xAsFMMkw41dtN+RN5n1/qhAyrhEzzWIuQyzrzd7YMw
	Cu5tXGiNMUnfrEZyiV40ae1E4iF2ElTcySS7GX/cOFZhdPiPoJL/xYB7U0WGAGHVsuwze/D86F1hq
	nfaD3ni4IlZXFt7rENCQzsMzqXuRKOm5NghgNqXAiCYTE6nz5QIpW3Q22+iBLdvcm+Q5aopx4HGEV
	wjgC7ltcnUt1E8zY+nteOv22OcvT82AyxrUB4eoKF5OyVl3/ryc0L6rptlVjJ6HxJ4AWMayWNOoei
	kCNP040Q==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpXp-0000000203C-3fMU
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 06:02:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0bd02d97eso57979205ad.2
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 23:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780984956; x=1781589756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArXdflsMbMAPz9wxUpor3EI3GcJx5CKRyDkJ23fIuYQ=;
        b=CcIW68YRPMs0Wq1iGF08H21XQuBtB2CKa7gc4ggRqlDQKBuucsWP8KXQLsuWJZkA/x
         GHDFfoExGPTtp2w5GY50T9x0dF90WPy/OCadrvJ1yGTHELKF+/ie6vHP8Jn78/vvbCJC
         A7bBl3fUcMT9wKcaLHH65LEuK+99uSu1xK4zljC43TIPTjRpXeak/ZZuHh6PSHIEI9QT
         IscqJsloVMFZCwmo6V7ifDwC90gqHdlu/BbQzM9uf4/9rLkBvTfnsfEj8tnfqutcprPo
         okHtM+fYpt+xv+m4hN9V6lGN7k1J9ErjtQzbQyVMFmYBPxYHsqD/Z0ZHLMJkXe7BLBcb
         3img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984956; x=1781589756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArXdflsMbMAPz9wxUpor3EI3GcJx5CKRyDkJ23fIuYQ=;
        b=KWt6CxPMdJwwCyyNsaYc9yMtUT5P9TCV+u35fMjkemMULtwKydeGZ5jWAYQ1U7GzxU
         rPuyLEszpO9OQ+FAhViGeca48MQNQ5q7IR44+hnapXSDYcYydingODsFIGEKE/Ce+kB0
         4kojxTV7QAYEMUa1KDZSR2EjpH9zdII9q1tUcjn0s4LqKRAmRNUisGT/CnuPFoGF7jCM
         ocra+zTPmScmQWe144tpS3k9QhH/i8ZLqDTiQY3AA/xZIy/O0a0ok9nE1Jp4x00Vb3GZ
         GGFYq9Bv+yV69EiMbywXY9/8KjbLi6BcRH96OpN6XjcJDVhpyUalCx5LR6JZvmogymmZ
         OUTg==
X-Gm-Message-State: AOJu0YzvB/XOIitAPzC5Nf6HlrMN42UuFMUy6iED+hN8AZ/y4HI/WAOg
	eWOvytanDqERqHZA2ZHV3B+9y8jYzKiqFsTtkyQIIOfFsjrnVji7R8Jz4UyFgA==
X-Gm-Gg: Acq92OEsNaw9T/HaYl28Ijn2LJWllbP4jwp6D2UeuMXA2Yo24hjwl+GSRSzxmkt7KMP
	E1+tnMUyRzC8e1hD4AanI3uwmHygFjUinvToEibHKOHhwre41NlB7/z6F+p9XTARPwUeOnXBLje
	T7PJraCdop2iEPwWk/NV9ZLtw+hV2dj950zb/cgx/NOFp9KiWZELaj63wL+zxrK/hhjruy9o2pz
	b3k5AMcAYgIO3mKA5OdqIfLQl3MccpV7wwS6CHZUfz8cUUaq6u/pqwTCAfHUgEOIegwSUWXLm4Z
	Mlh1f+dg/99r2vTnOD3H/ZVMgkuUv4bj6g0D1fB66AoNk9eaDFaBiyPsd73LTYiQ9V8jvz4+Ni3
	7kF4ftbGmETAkfF/+Jox0KkeqCaOUOz9aE5Y9bbX235wnijDf9Yv0t+oe3vQiUnLDxxEpeBf5VZ
	duvThoe2OKHRMysdZarXb+CLXk8cno5+ZvFHA=
X-Received: by 2002:a17:902:ef08:b0:2c1:5135:39f3 with SMTP id d9443c01a7336-2c1e810d9famr230521745ad.11.1780984955539;
        Mon, 08 Jun 2026 23:02:35 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f9ed6csm202721105ad.31.2026.06.08.23.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:02:34 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 4/4] lib: sbi: Rework misaligned vector load/store
Date: Mon,  8 Jun 2026 23:00:24 -0700
Message-Id: <20260609060024.706-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609060024.706-1-ganboing@gmail.com>
References: <20260609060024.706-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070238_320411_7C75CF5E 
X-CRM114-Status: GOOD (  19.91  )
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
 lib/sbi/sbi_trap_v_ldst.c | 103 +++++++++++++++++++++++++-------------
 2 files changed, 74 insertions(+), 35 deletions(-)

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
index 02f7d6cc..0f29dcf9 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -16,11 +16,11 @@
 #include <sbi/sbi_trap_ldst.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
-#include <sbi/sbi_trap.h>
+#include <sbi/sbi_vector.h>
 
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
+	ulong vstart = csr_read(CSR_VSTART), orig_vstart = vstart;
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
@@ -263,7 +281,7 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 	ulong vl = csr_read(CSR_VL);
 	ulong vtype = csr_read(CSR_VTYPE);
 	ulong vlenb = csr_read(CSR_VLENB);
-	ulong vstart = csr_read(CSR_VSTART);
+	ulong vstart = csr_read(CSR_VSTART), orig_vstart = vstart;
 	ulong base = GET_RS1(insn, regs);
 	ulong stride = GET_RS2(insn, regs);
 	ulong vd = GET_VD(insn);
@@ -273,8 +291,9 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
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
@@ -295,7 +314,7 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		stride = nf * len;
 	}
 
-	if (illegal || vlenb > VLEN_MAX / 8) {
+	if (illegal) {
 		struct sbi_trap_info trap = {
 			uptrap.cause = CAUSE_ILLEGAL_INSTRUCTION,
 			uptrap.tval = insn,
@@ -303,12 +322,16 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
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
@@ -325,23 +348,33 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
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
