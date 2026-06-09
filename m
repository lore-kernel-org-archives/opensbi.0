Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A8DCD98C3
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MS0A9rautxgsB6rUEcTb+CA5Zb4ee4ZQFrQHiiM44Zk=; b=IaLbXlsQKmPq4M
	1RoztLEeNJDhbkI29EW7lL0YfNwRDpQo9jMmSHazn2aBpz5aqPDhsU9Rp9aLrg29CZDXJpPjougYg
	aiCetiwXjA2jnjUqnq9PJEnoEVFj6Kq089TrWnSuqFUEk5K9EGs9EDEiZwf92RkwhgGuuq7CYqEtp
	UKn/LQQLGC4VX3cvU+IBZQyWngMgwHVwWkKc70EfFT3bttQknr2ity79A8fm6k3tRtlk7D2u+FQ9L
	et8ZFVTnqqJuDHOmZDEm/cRBpyPlyLeOSqlkfxptSgnitC7PvQ+cfEI6DAzo3yhpa6DX4C8XKVTE+
	jt3FLOV15UnZOXVnsnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXx-00000004nRN-1cxH;
	Tue, 09 Jun 2026 06:02:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXt-00000004nKA-3BYB
	for opensbi@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lV9Avn76RrOZmEgzOLlY219AbsDRjXBn/+SIpTsZc74=; b=U1b5oto1npRsrVOOvQuyzRqUIC
	l8QfesnSczkK/MTUfuLXK42+YLEtJWM6Bkr/ySt4cm0/waHw7eNqyXDIaMdqxTbuRpvHDjXMuMLfj
	Um1KaozDX8JKa8gyp7evh4VM7VA6sbgQn2ompABkH2AHGHCtUL0Nm9MfRlUAFDheI8VofoeVwR0jX
	8uI9Y5D4SybTZKh602jetZFXbvhX0e4byDf2QVB7vW2U0qbkGei67Pv9OHcrsnJkwilItdeokaqwq
	PWVK7rvk69DimF21+Csww7gXQeLdtReUB38XMscdCTpi5TAi0Utv+wEvw4D14/88uBKbUfxh2akpr
	4brcGwBg==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpXn-0000000202V-0wYS
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 06:02:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf1f074a12so53149965ad.0
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780984953; x=1781589753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV9Avn76RrOZmEgzOLlY219AbsDRjXBn/+SIpTsZc74=;
        b=Gs0YKicYGTVXZntPGoQ39kQz16+pICENWLJWvpxvNPzBwiKlbe2ud+hxPI/+nZVj8r
         H1j7naRCHxHXA1oiGa8JClCqjgjFrtX38ag9NXp14UrtqUU93GN+6yqRWRf/awdEDGpZ
         bo87nE9qIr6ZBBPdOrwWE1uRcbY8gZaI+zOwskfotof6uydD0sG2SUnvW0ShNYpCoHFx
         W1lvs9tIU7dsWDlftkxvr9m4yQypZ27gdl75r8eMCurU16EbOdyw1Lkth8UkTN9LNXUi
         s2NUEYlUgQVQYMFUQgTqVdiLYVJWtGqujDaxjGr05XzUZNnDBichGWN/gl7YAnVawmoo
         voYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984953; x=1781589753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lV9Avn76RrOZmEgzOLlY219AbsDRjXBn/+SIpTsZc74=;
        b=PcQ1xsfME2Rh2fn/BKN3j/4eXlpJaa7kcal9WsgmUixVLAfdFSL2nsRYfvi0RRKqsY
         QdxYA02TnTNEjo485vymqz4nTIh0UvZtwYlLaw3eTI1I4LWhYIW1oiIbg+e10x897eTH
         zqgwS9idqvW2xyP9WUdlQanPWO5/x+5NHw5PvoYBXhhWBXYWOpMnsfhdEzEFCBr8qHG9
         navUo550GyCF8UCe9atN38iUd0+AfkWxKM1DV12csK1swQCECuLVA/rAtI47MJL9i9/p
         WUiKDSHWAGVyIolqLdz9a+1ELB7TTITRvD282xN5IHPpAPqDtC7UNXDVQxxaxLyItreD
         B4/w==
X-Gm-Message-State: AOJu0YzOcDy72VE1bQzM/Z7PA79Nn9uQn+kKTtZPI7wMA7ktWM/fVTdz
	wSWnEOSYuvbhSNJ1ZxDH9MeemyQN0NX1sAdortccwvClKrR2vxcojS4TMTNMQw==
X-Gm-Gg: Acq92OFtrVHFInhABvuC5oUbNREv6WmPieLONJ+m7HkJNFF4xzC7Ve0TpI+gPKknoYa
	tKyaULgHTnHvAUIukxDsGguANOqRmsWoUlnqEV9X+G2ce1iHeaodLW6s0bBH6StlxZCPnARoPly
	tYu/B1GmDaekXJCa9NJx0+v6HBYcEVbZydnQgQizXoP9T72kVxoiutOQNd4sOXFhqRLP6wLFyVt
	N7fqr8TgcyC71GBi2VTqf2gL/96DSj2fPlAIUBzkKxtGZIa+7dpv7mw1/0GEC7E0s1AiSxdq9mp
	DicL76CwLGWllrXPo7t8C8uMAMVwQ/qsWesDNeP2XclAtcXTFE8tlX+p8S3Q05fFKqAfLTzepV1
	HCTcP1IY/qxwrNgJlIgOOIHTMpo/fet7CnvdyI/0sHMbsJzkNPc3icbJXD10CrsFkiJYj01gTz/
	O+9f5mhhhI8LJLBD3rV0UiC9FJobY/9wHWjaDyr4ld+UCYTA==
X-Received: by 2002:a17:903:b84:b0:2bd:c2ec:eec9 with SMTP id d9443c01a7336-2c1e833a348mr216902885ad.18.1780984953051;
        Mon, 08 Jun 2026 23:02:33 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f9ed6csm202721105ad.31.2026.06.08.23.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:02:32 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 2/4] lib: sbi: Rework and split sbi_misaligned(_v)_tinst_fixup
Date: Mon,  8 Jun 2026 23:00:22 -0700
Message-Id: <20260609060024.706-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609060024.706-1-ganboing@gmail.com>
References: <20260609060024.706-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070235_437881_FDA5CAC1 
X-CRM114-Status: GOOD (  20.14  )
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

The load/store address offset between the uptrap and the orig_trap
can be derived by orig_trap->tval - uptrap->tval, thus refactor
the function prototype for simplicity.

For vector load, sbi_misaligned_v_tinst_fixup is introduced. There's
no transformed instruction for vector load/store, so null out tinst
if the fault is not a guest-page fault.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_trap_ldst.h |  3 ---
 lib/sbi/sbi_trap_ldst.c     | 46 +++++++++++++++++++++++++++----------
 lib/sbi/sbi_trap_v_ldst.c   | 31 ++++++++++++++++++++-----
 3 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index 33c348c5..30228d24 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -28,9 +28,6 @@ int sbi_load_access_handler(struct sbi_trap_context *tcntx);
 
 int sbi_store_access_handler(struct sbi_trap_context *tcntx);
 
-ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
-				 ulong addr_offset);
-
 int sbi_misaligned_v_ld_emulator(ulong insn,
 				 struct sbi_trap_context *tcntx);
 
diff --git a/lib/sbi/sbi_trap_ldst.c b/lib/sbi/sbi_trap_ldst.c
index c1392251..5f7de662 100644
--- a/lib/sbi/sbi_trap_ldst.c
+++ b/lib/sbi/sbi_trap_ldst.c
@@ -32,16 +32,40 @@ typedef int (*sbi_trap_st_emulator)(ulong insn, int wlen, ulong waddr,
 				    union sbi_ldst_data in_val,
 				    struct sbi_trap_context *tcntx);
 
-ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
-					ulong addr_offset)
+/**
+ * Handling of misaligned fault is done by a collection of smaller, but
+ * aligned load/store(s). Another fault (load/store, page fault...) can
+ * arise from any of them, then the handling gets aborted. We must fixup
+ * the tinst to pretend the fault was rised from the original insn.
+ * Specifically, fixup the offset field using the tval diff between the
+ * new trap and the original one (if required).
+ */
+static inline void sbi_misaligned_tinst_fixup(
+			const struct sbi_trap_info *orig_trap,
+			      struct sbi_trap_info *uptrap)
 {
-	if (new_tinst == INSN_PSEUDO_VS_LOAD ||
-	    new_tinst == INSN_PSEUDO_VS_STORE)
-		return new_tinst;
-	else if (orig_tinst == 0)
-		return 0UL;
+	ulong offset = uptrap->tval - orig_trap->tval;
+
+	/*
+	 * The function is called in code path for handling a scalar
+	 * load/store misaligned fault, thus the new uptrap can't have
+	 * custom value of tinst
+	 */
+	if (uptrap->tinst == INSN_PSEUDO_VS_LOAD ||
+	    uptrap->tinst == INSN_PSEUDO_VS_STORE)
+		/* Use uptrap as-is for guest-page faults */
+		return;
+	/*
+	 * Only fixup if orig tinst is valid. Otherwise, discard the
+	 * new tinst to be on the safe side. Never use new tinst as-is!
+	 * It's load/store width surely mismatches the original width.
+	 * For vector, discard it regardless. It doesn't make sense to
+	 * have a transformed tinst
+	 */
+	else if (orig_trap->tinst == 0)
+		uptrap->tinst = 0;
 	else
-		return orig_tinst | (addr_offset << SH_RS1);
+		uptrap->tinst = orig_trap->tinst | (offset << SH_RS1);
 }
 
 static inline bool sbi_trap_tinst_valid(ulong tinst)
@@ -464,8 +488,7 @@ static int sbi_misaligned_ld_emulator(ulong insn, int rlen, ulong addr,
 		out_val->data_bytes[i] =
 			sbi_load_u8((void *)(addr + i), &uptrap);
 		if (uptrap.cause) {
-			uptrap.tinst = sbi_misaligned_tinst_fixup(
-				orig_trap->tinst, uptrap.tinst, i);
+			sbi_misaligned_tinst_fixup(orig_trap, &uptrap);
 			return sbi_trap_redirect(regs, &uptrap);
 		}
 	}
@@ -501,8 +524,7 @@ static int sbi_misaligned_st_emulator(ulong insn, int wlen, ulong addr,
 		sbi_store_u8((void *)(addr + i),
 			     in_val.data_bytes[i], &uptrap);
 		if (uptrap.cause) {
-			uptrap.tinst = sbi_misaligned_tinst_fixup(
-				orig_trap->tinst, uptrap.tinst, i);
+			sbi_misaligned_tinst_fixup(orig_trap, &uptrap);
 			return sbi_trap_redirect(regs, &uptrap);
 		}
 	}
diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index 7d2e1409..e16e3def 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -138,9 +138,31 @@ static inline void vsetvl(ulong vl, ulong vtype)
 			:: "r" (vl), "r" (vtype));
 }
 
+/**
+ * Handling of misaligned fault is done by a collection of smaller, but
+ * aligned load/store(s). Another fault (load/store, page fault...) can
+ * arise from any of them, then the handling gets aborted. We must fixup
+ * the tinst to pretend the fault was rised from the original insn. For
+ * vector insn, simply null out tinst if it's not a guest-page fault, as
+ * there's no transformed insn for vector load/store
+ */
+static inline void sbi_misaligned_v_tinst_fixup(struct sbi_trap_info *uptrap)
+{
+	/*
+	 * The function is called in code path for handling a vector
+	 * load/store misaligned fault, thus the new uptrap can't have
+	 * custom value of tinst
+	 */
+	if (uptrap->tinst == INSN_PSEUDO_VS_LOAD ||
+	    uptrap->tinst == INSN_PSEUDO_VS_STORE)
+		/* Use uptrap as-is for guest-page faults */
+		return;
+
+	uptrap->tinst = 0;
+}
+
 int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
-	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
 	struct sbi_trap_info uptrap;
 	ulong vl = csr_read(CSR_VL);
@@ -218,8 +240,7 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 						break;
 					}
 					vsetvl(vl, vtype);
-					uptrap.tinst = sbi_misaligned_tinst_fixup(
-						orig_trap->tinst, uptrap.tinst, i);
+					sbi_misaligned_v_tinst_fixup(&uptrap);
 					return sbi_trap_redirect(regs, &uptrap);
 				}
 			}
@@ -240,7 +261,6 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 
 int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 {
-	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
 	struct sbi_trap_info uptrap;
 	ulong vl = csr_read(CSR_VL);
@@ -317,8 +337,7 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 					     bytes[seg * len + i], &uptrap);
 				if (uptrap.cause) {
 					vsetvl(vl, vtype);
-					uptrap.tinst = sbi_misaligned_tinst_fixup(
-						orig_trap->tinst, uptrap.tinst, i);
+					sbi_misaligned_v_tinst_fixup(&uptrap);
 					return sbi_trap_redirect(regs, &uptrap);
 				}
 			}
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
