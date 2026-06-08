Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FBACD8CA8
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 21:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O445o4ESkIUUbAh3NEe9EeNDpRYYGHMWnSZOZMJZQEs=; b=xkHFSMCZdPdbFL
	diYBcIBPv9JKa+LZc2pCZISkkfZwtyoWVV0ZGfyrhkn5iaA+czgl9TCEIXQbNj8VWxB9O08ThdVHx
	P/5b36Un9W624ArJXzLo90Y2MFpzUbFHZIsbeXGVeUX6i59o8GwJnndZ0GuAQ1biQP9yC1Tc6spc0
	IN+g0vKPz52qNnUN93fL/8XpGJTi+kbWXqPUv8AJotJ/Dh0nq/nu/llLZqYlJCwFBisQWus5HAJJA
	juNgaZKcSmu3/7bSKAuJA8bmZbdoEBJ3PLpKJABF/7aLB9ZqFpfrX8cI3capgNwr/qJ7151V76498
	nEcFHAxVTe18yLs2y4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNd-00000004Q72-13RI;
	Mon, 08 Jun 2026 21:19:33 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNZ-00000004Q4v-3zaF
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 21:19:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0bd02d97eso54968255ad.2
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 14:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780953569; x=1781558369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsxkDcWxP78dEk+nguc5R9RaH/KLwo0iNr9638RVVnc=;
        b=met01zzyJ3Qt84uhmdnsh68ekNWAjkrthRS1/fDu/d7qY0dvhstMeT4jWkoiCkzXLG
         KE7+YK68fErCr6Abe6hXBsyAEHwj1f1poToAF6ojkIIdsPC1XZUhSUrcIOw8qiLyO5RN
         53ONSUIUXPX1xrVKSOJRkeAH/Z+Ujm7JsSV5xbHNXKBDkjko4U1d9kQVAy4C5o4XGMKO
         Qz/kyJVMl+/pKPpqRMm97MIfjMH31JJsrRuTwWCADEfOxu7iepRaurjQd1yFyAnSUTqM
         68p3WIrymiAf32Q29A+z+FwSy8+Sd556knCxt7nvPT1jiVb5ArcZ3ufgxxRli6/Vgk7o
         2ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953569; x=1781558369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gsxkDcWxP78dEk+nguc5R9RaH/KLwo0iNr9638RVVnc=;
        b=U97Zr+KXE7rNqvNwq/+8I4gwOZF/tD3+q7eqH/ifGYHWCmS6hVxIvwyq6dHsdwbGwr
         arKOfkca4SYhgxr0/afTDxE1OWEORbMrQup38LWAhuV6vgA5/qAS1CAYtwKqr4ihnNMU
         P5VW3VS9DOn04WRmr2/CK+ob5ZjaiQCHZnMe8wwGr5BPzqpAM5chzoRmb5lHxCFADLBR
         EUuZQ/BTLV84zSoVPqd2lrzzU9bpXrWSxS7OpjiICwT8tn5lcU8F96UnGTpph1cBq6fv
         TCHd3PfFWndUbMXoS8YzsCgUteKaG2lWV2qqV5+kYyHxDLmd41HiluGB7MbzKj6GfYqR
         EWjA==
X-Gm-Message-State: AOJu0YyTTy/9Eao5wmGvUe4+v7dIY5Ih2K07yC2LDiEi+KuIR13/JgIn
	ku0RrTzV2Wvv3X8sTMS5BsFOER6W/E1kbhJMbxRZaQi0WFhEV2Gj9NUEpiTTxg==
X-Gm-Gg: Acq92OGgk+VZPKqlt8wPPbek7FXHfgT7T8UAq8i5UoTbcs5E1omPibiQFSJCwsw0UeT
	0Wmmd3hU0K5rKgvaSEsLYfWzxhzfT5wpMHJp175H/xvUdAh68eYIu3NUpHg/Rhr7hAUmci09Zlb
	O9Rjtwu1rSBfJothV9XdnDtai6H5LGixi82i1i9wU5fkYN53d55VBQ2HYB7HShNT5Y+1fnLKIzT
	xA3F/cLnWRUlx+LPJdka/enpAgtsawo+GS1Evey/LeqhHVUkmenQyjsTR3HZqaAWIOktq36yG6J
	QSLab04GPOV0cyhhflM4LlqxMsrkyKfaAcoVne4XPdWT3m/DRyLB02mOrK93EIRKT0CuBs4sAfG
	AjJLVWsoDyx/DZxJtEh+9KJXd3yxwV6zW0XXpTjZivMnIHzp6L32MrC0cTw60V1yE8LBadh2lYw
	78YFrI0cN5p65o5eD01ZbaZIIGsAutvo2gIWE=
X-Received: by 2002:a17:902:da4b:b0:2c1:f262:495f with SMTP id d9443c01a7336-2c1f2624bcemr170489815ad.26.1780953569143;
        Mon, 08 Jun 2026 14:19:29 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm182789005ad.32.2026.06.08.14.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:19:28 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH 3/4] lib: sbi: Add variable-length unprivilege access functions
Date: Mon,  8 Jun 2026 14:17:02 -0700
Message-Id: <20260608211703.571-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608211703.571-1-ganboing@gmail.com>
References: <20260608211703.571-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_141929_999029_2781D3B3 
X-CRM114-Status: GOOD (  17.11  )
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

sbi_load/store_loop read/write variable-length buffer unprivileged.
Both function use the widest aligned 8/4/2/1 byte load/stores in each
loop to reduce the total number of iterations.

Also switch the scalar/vector misaligned handlers to make use of such
functions to simplify code.

Miscellaneous: remove the unnecessary [taddr] in inline assembly

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_unpriv.h  | 16 +++++++
 lib/sbi/sbi_trap_ldst.c   | 24 ++++-------
 lib/sbi/sbi_trap_v_ldst.c | 38 ++++++++---------
 lib/sbi/sbi_unpriv.c      | 88 ++++++++++++++++++++++++++++++++++++---
 4 files changed, 123 insertions(+), 43 deletions(-)

diff --git a/include/sbi/sbi_unpriv.h b/include/sbi/sbi_unpriv.h
index 8cbd3de0..226cf175 100644
--- a/include/sbi/sbi_unpriv.h
+++ b/include/sbi/sbi_unpriv.h
@@ -15,6 +15,16 @@
 struct sbi_scratch;
 struct sbi_trap_info;
 
+union sbi_unpriv_data {
+	u8 b;
+	u16 h;
+	u32 w;
+#if __riscv_xlen == 64
+	u64 d;
+#endif
+	u8 bytes[__riscv_xlen / 8];
+};
+
 #define DECLARE_UNPRIVILEGED_LOAD_FUNCTION(type)           \
 	type sbi_load_##type(const type *addr,             \
 			     struct sbi_trap_info *trap);
@@ -36,6 +46,12 @@ DECLARE_UNPRIVILEGED_LOAD_FUNCTION(u64)
 DECLARE_UNPRIVILEGED_STORE_FUNCTION(u64)
 DECLARE_UNPRIVILEGED_LOAD_FUNCTION(ulong)
 
+void sbi_load_loop(u8 *buffer, ulong addr, ulong len,
+		   struct sbi_trap_info *trap);
+
+void sbi_store_loop(u8 *buffer, ulong addr, ulong len,
+		    struct sbi_trap_info *trap);
+
 ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap);
 
 #endif
diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index 5f7de662..e726520f 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -471,7 +471,6 @@ static int sbi_misaligned_ld_emulator(ulong insn, int rlen, ulong addr,
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
 	struct sbi_trap_info uptrap;
-	int i;
 
 	if (!rlen) {
 		if (IS_VECTOR_LOAD_STORE(insn))
@@ -484,13 +483,10 @@ static int sbi_misaligned_ld_emulator(ulong insn, int rlen, ulong addr,
 	if (addr != orig_trap->tval)
 		return SBI_EFAIL;
 
-	for (i = 0; i < rlen; i++) {
-		out_val->data_bytes[i] =
-			sbi_load_u8((void *)(addr + i), &uptrap);
-		if (uptrap.cause) {
-			sbi_misaligned_tinst_fixup(orig_trap, &uptrap);
-			return sbi_trap_redirect(regs, &uptrap);
-		}
+	sbi_load_loop(out_val->data_bytes, addr, rlen, &uptrap);
+	if (uptrap.cause) {
+		sbi_misaligned_tinst_fixup(orig_trap, &uptrap);
+		return sbi_trap_redirect(regs, &uptrap);
 	}
 	return rlen;
 }
@@ -507,7 +503,6 @@ static int sbi_misaligned_st_emulator(ulong insn, int wlen, ulong addr,
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
 	struct sbi_trap_info uptrap;
-	int i;
 
 	if (!wlen) {
 		if (IS_VECTOR_LOAD_STORE(insn))
@@ -520,13 +515,10 @@ static int sbi_misaligned_st_emulator(ulong insn, int wlen, ulong addr,
 	if (addr != orig_trap->tval)
 		return SBI_EFAIL;
 
-	for (i = 0; i < wlen; i++) {
-		sbi_store_u8((void *)(addr + i),
-			     in_val.data_bytes[i], &uptrap);
-		if (uptrap.cause) {
-			sbi_misaligned_tinst_fixup(orig_trap, &uptrap);
-			return sbi_trap_redirect(regs, &uptrap);
-		}
+	sbi_store_loop(in_val.data_bytes, addr, wlen, &uptrap);
+	if (uptrap.cause) {
+		sbi_misaligned_tinst_fixup(orig_trap, &uptrap);
+		return sbi_trap_redirect(regs, &uptrap);
 	}
 	return wlen;
 }
diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index e16e3def..02f7d6cc 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -229,20 +229,17 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 
 		/* obtain load data from memory */
 		for (ulong seg = 0; seg < nf; seg++) {
-			for (ulong i = 0; i < len; i++) {
-				bytes[seg * len + i] =
-					sbi_load_u8((void *)(addr + seg * len + i),
-						    &uptrap);
-
-				if (uptrap.cause) {
-					if (IS_FAULT_ONLY_FIRST_LOAD(insn) && vstart != 0) {
-						vl = vstart;
-						break;
-					}
-					vsetvl(vl, vtype);
-					sbi_misaligned_v_tinst_fixup(&uptrap);
-					return sbi_trap_redirect(regs, &uptrap);
+			sbi_load_loop(bytes + seg * len,
+				       addr + seg * len, len, &uptrap);
+
+			if (uptrap.cause) {
+				if (IS_FAULT_ONLY_FIRST_LOAD(insn) && vstart != 0) {
+					vl = vstart;
+					break;
 				}
+				vsetvl(vl, vtype);
+				sbi_misaligned_v_tinst_fixup(&uptrap);
+				return sbi_trap_redirect(regs, &uptrap);
 			}
 		}
 
@@ -332,14 +329,13 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 
 		/* write store data to memory */
 		for (ulong seg = 0; seg < nf; seg++) {
-			for (ulong i = 0; i < len; i++) {
-				sbi_store_u8((void *)(addr + seg * len + i),
-					     bytes[seg * len + i], &uptrap);
-				if (uptrap.cause) {
-					vsetvl(vl, vtype);
-					sbi_misaligned_v_tinst_fixup(&uptrap);
-					return sbi_trap_redirect(regs, &uptrap);
-				}
+			sbi_store_loop(bytes + seg * len,
+					addr + seg * len, len, &uptrap);
+
+			if (uptrap.cause) {
+				vsetvl(vl, vtype);
+				sbi_misaligned_v_tinst_fixup(&uptrap);
+				return sbi_trap_redirect(regs, &uptrap);
 			}
 		}
 	} while (++vstart < vl);
diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
index f9bbec59..14b8f3cb 100644
--- a/lib/sbi/sbi_unpriv.c
+++ b/lib/sbi/sbi_unpriv.c
@@ -11,6 +11,7 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
 
@@ -22,13 +23,12 @@
 	type sbi_load_##type(const type *addr,                                \
 			     struct sbi_trap_info *trap)                      \
 	{                                                                     \
-		register ulong tinfo asm("a3");                               \
+		register ulong tinfo asm("a3") = (ulong)trap;                 \
 		register ulong mstatus = 0;                                   \
 		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
 		type ret = 0;                                                 \
 		trap->cause = 0;                                              \
 		asm volatile(                                                 \
-			"add %[tinfo], %[taddr], zero\n"                      \
 			"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"      \
 			"csrrs %[mstatus], " STR(CSR_MSTATUS) ", %[mprv]\n"   \
 			".option push\n"                                      \
@@ -39,8 +39,7 @@
 			"csrw " STR(CSR_MTVEC) ", %[mtvec]"                   \
 		    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),         \
 		      [tinfo] "+&r"(tinfo), [ret] "=&r"(ret)                  \
-		    : [addr] "m"(*addr), [mprv] "r"(MSTATUS_MPRV),            \
-		      [taddr] "r"((ulong)trap)                                \
+		    : [addr] "m"(*addr), [mprv] "r"(MSTATUS_MPRV)             \
 		    : "a4", "memory");                                        \
 		return ret;                                                   \
 	}
@@ -54,7 +53,6 @@
 		register ulong mtvec = (ulong)sbi_hart_expected_trap;         \
 		trap->cause = 0;                                              \
 		asm volatile(                                                 \
-			"add %[tinfo], %[taddr], zero\n"                      \
 			"csrrw %[mtvec], " STR(CSR_MTVEC) ", %[mtvec]\n"      \
 			"csrrs %[mstatus], " STR(CSR_MSTATUS) ", %[mprv]\n"   \
 			".option push\n"                                      \
@@ -66,7 +64,7 @@
 		    : [mstatus] "+&r"(mstatus), [mtvec] "+&r"(mtvec),         \
 		      [tinfo] "+&r"(tinfo)                                    \
 		    : [addr] "m"(*addr), [mprv] "r"(MSTATUS_MPRV),            \
-		      [val] "r"(val), [taddr] "r"((ulong)trap)                \
+		      [val] "r"(val)                                          \
 		    : "a4", "memory");                                        \
 	}
 
@@ -116,6 +114,84 @@ void sbi_store_u64(u64 *addr, u64 val,
 # error "Unexpected __riscv_xlen"
 #endif
 
+void sbi_load_loop(u8 *buffer, ulong addr, ulong len,
+		   struct sbi_trap_info *trap)
+{
+	union sbi_unpriv_data data;
+
+	trap->cause = 0;
+	while (len) {
+		unsigned int width = __riscv_xlen / 8;
+		void *ptr = (void*)addr;
+
+		while (len < width || (addr & (width - 1)))
+			width /= 2;
+
+		switch (width) {
+		case 1:
+			data.b = sbi_load_u8(ptr, trap);
+			break;
+		case 2:
+			data.h = sbi_load_u16(ptr, trap);
+			break;
+		case 4:
+			data.w = sbi_load_u32(ptr, trap);
+			break;
+#if __riscv_xlen == 64
+		case 8:
+			data.d = sbi_load_u64(ptr, trap);
+			break;
+#endif
+		}
+		if (trap->cause)
+			return;
+
+		sbi_memcpy(buffer, data.bytes, width);
+		len -= width;
+		addr += width;
+		buffer += width;
+	}
+}
+
+void sbi_store_loop(u8 *buffer, ulong addr, ulong len,
+		    struct sbi_trap_info *trap)
+{
+	union sbi_unpriv_data data;
+
+	trap->cause = 0;
+	while (len) {
+		unsigned int width = __riscv_xlen / 8;
+		void *ptr = (void*)addr;
+
+		while (len < width || (addr & (width - 1)))
+			width /= 2;
+
+		sbi_memcpy(data.bytes, buffer, width);
+		switch (width) {
+		case 1:
+			sbi_store_u8(ptr, data.b, trap);
+			break;
+		case 2:
+			sbi_store_u16(ptr, data.h, trap);
+			break;
+		case 4:
+			sbi_store_u32(ptr, data.w, trap);
+			break;
+#if __riscv_xlen == 64
+		case 8:
+			sbi_store_u64(ptr, data.d, trap);
+			break;
+#endif
+		}
+		if (trap->cause)
+			return;
+
+		len -= width;
+		addr += width;
+		buffer += width;
+	}
+}
+
 ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
 {
 	register ulong tinfo asm("a3");
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
