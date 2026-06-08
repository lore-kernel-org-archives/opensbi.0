Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6964CD6E79
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 21:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MS0A9rautxgsB6rUEcTb+CA5Zb4ee4ZQFrQHiiM44Zk=; b=VdWUeWqoWztBQC
	ufT3ZCzH9BD07O74hI5sNS4ahYG7Fzy6lgBTz6Ci7iIdbos18Wxq2SqZT3TPwpKQLvYEUpqteWDG6
	6UG23dd/AwGXuY0MsLjICeUfORkci78eFHGHZdmdTwMNZeqBvRCtvdPYufabCc1F1PJBVURmaBS8F
	voYAQZy8enDZ1Fv/udeL+k+0MZGqN8i7fk76ZntvB52H6L87c2Pjs8tMF6ChuDlgnJXpEXchFhnGY
	MqnStckuRB1P1GXkUfI84XOGke3or++fDwfomxiIHzKl2Umgmb02ToYkRR8fhDodDAW33mwWuPoUk
	tORX2Ujt0Vs9o9KaTDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNb-00000004Q6S-45ZN;
	Mon, 08 Jun 2026 21:19:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNZ-00000004Q4u-2eFF
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 21:19:31 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so4959569a91.3
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 14:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780953569; x=1781558369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV9Avn76RrOZmEgzOLlY219AbsDRjXBn/+SIpTsZc74=;
        b=MAbyIik86s8WcLAJIwZKV4g8faCQwEr0OPALb5Sv48KZriyNufHwo/okKNE4Y+eB33
         qWAxbSLe8i7YuSEi80NTs2sdO/x0mbjlg9Ke+XA7oXjpeHMls92eqktkK/FyAeLB+RWT
         IBH2ZXKybZrKG/VRc2myiiqW1Mweug3RuX2oKwD2qxbOq8G6xxtD6H7B/QPyBNOaR+oQ
         s9FirN8xeFI5jTdYYlZ6Bt54QubG7a60bhOB0g5austfVF76n9Q2tNC2uGLCt2Pckfv6
         7z1A+WHvsP7mnJZHmTl5cR2XAFLRbslmnDwwmDL03ynqPN68g02bM5bVKK5szLC/Abnf
         WKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953569; x=1781558369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lV9Avn76RrOZmEgzOLlY219AbsDRjXBn/+SIpTsZc74=;
        b=redraajMAB8yT6xK5Tv7Tovfbr6VZPwoggxZ0i/2L3VdM3l2WqpiNC5Oj98ozUJ5mh
         Ew2AuZAtS9TNAomhHrV61gPvh3+Mt79mvRqeHQclfwl1G9C/FpBssQt9GFhP/Z52FpU2
         QlrUzgK7yQ2NSOjCwCyls4+OF0JsiODWJ4wAOkIyXHy3YQXnJQUL/uVQaIywWNffPCAc
         TTLIYQiNkmSksC3fWK1iRql2anbd7DdrepwvpCtgd6G03HqKGrqbT8Tutch11hUuT+zd
         KlvZlMZV2Dmd339QDdpQhbLPr/5GJ/KZ4sRBe6RhMObgdXkbDQBx4pbMFZdqVDpjImBt
         hzRg==
X-Gm-Message-State: AOJu0Yz/kVAVbnBhrFNWD0AYvu9MPApIlt266lZH/PDR9ndfFwl2fGlZ
	zvlH9hsRyMOulCHDI8eqA+XM841uqWjnv3CLJM7wetbMGrlP70qS78BpTOVGDQ==
X-Gm-Gg: Acq92OF+byPEXtHPGOAxio1ZarmVZySuJggw5o6dI/jc8fRyjzl097IOMYiVuY19fRI
	uRDSCSo9XJlu0OV1GsZi24xe+0Js/LKMiLK4W7qodX/wX4nprZ7MihVtfyHu3FCMbTxXrB/u6Di
	wWx3KYvDx5g4erXug9/XnEyNXnG4DLvbgQK20eJEymElQ2lS+vHjJ92u8LUqvD0FIDLDiCCmdq1
	gVzdhqiNKMRlYqQzIXkB6YCu7HQWcLOgsEnw3u6h0wBT+sH0y9Ek6f8Un7u4dmztyr4PMVmE1lq
	BzR5RI3qJrJjm3aiB7xtqtYbXegtqk0dcSlhTHzseGB7MZkXHXqchOFInxvxhe86c1+8W1d5EAW
	v1hk9JE5f0ngGel3LYSiuYPHn75a3CbhQrnxZ5hlQR1GdjTFtAicFQpUY9Ze2+WBRpvZNTDWSdQ
	uJz9qUsBqbZgGCk1srlxoieVBh1Isqh/Hbqk3bccWRh7YgOg==
X-Received: by 2002:a17:902:ce8b:b0:2c1:11b8:3c80 with SMTP id d9443c01a7336-2c1e833c530mr189155305ad.30.1780953568576;
        Mon, 08 Jun 2026 14:19:28 -0700 (PDT)
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
Subject: [PATCH 2/4] lib: sbi: Rework and split sbi_misaligned(_v)_tinst_fixup
Date: Mon,  8 Jun 2026 14:17:01 -0700
Message-Id: <20260608211703.571-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608211703.571-1-ganboing@gmail.com>
References: <20260608211703.571-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_141929_676875_FA47F683 
X-CRM114-Status: GOOD (  20.26  )
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
