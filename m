Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAD1CD8CBE
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XxeyVvm71Iw1qPIK0YfVhdFAblgITmp6SxG5YTveTk=; b=4dGyxTnn2LOZR4
	sHpcIq1zJqAHQSRQZj/9au6PuYgIMKXkAume8bDsJCljN0vZCwIqTcxKpKxenVZYUVJxGPoWwd2Ql
	SwGbVW8LgKMm/igOZzrduDwkW/nWcioIcej287IQqCLHlJGPJtXWftOnegtbdupYLyDipBe2L4uXf
	SRk9Ll46osrXoS2Pavxdcf5wh+ykhZrLBUmtQGsKUhwz0UtfwHo0vd0HEE5xLEGxrYsjvYHJGCqG2
	z7RiMx/wq6pleYqxpqu4PBGd4HOFYodCxJiF1jcRDK3h/QYYrwje/LtKdUpVzEZnoo3901bdIFdtK
	AV3IrJVbmcU0I8Qmym9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXx-00000004nS6-2NlM;
	Tue, 09 Jun 2026 06:02:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXt-00000004nKB-3rXu
	for opensbi@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cmL2v6DJfgNnJoxSs3D7A28vZIBKZO+3dxuojmE0Ye4=; b=cVOWUTvAmSRmDlLqLFGDWjQvh3
	17TT1igrm8bTN6z7OHBeLHB5iv8jngKogUmvYw1B+5+y2LqDxArdNhCD6ppIQFS7y8mThYKzVGn6q
	4Sn1QkSZZtEEZrO1yPgo8EyjKzBzCKT+HIWyQbo7BurLfybjCI4UF72ibkxI2jZvkmCcbkM7IwTNx
	X99rAcAFn9GlfPKBqnxZJRtACz3XwQxhBEz38zoi42jfOL1kKJ9F1gQv/ACqDaWq39LHE4zMs+uBn
	YIMb3tP5lIKJVWMkw7IXjimSNaMRei0qvb73kQccr7DGwMe2mCYkCWp7UdOElGFE6NLZmhbnZaODf
	KXMMMgkw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpXn-0000000202T-0dh8
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 06:02:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0c2a68d01so34954635ad.1
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 23:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780984952; x=1781589752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmL2v6DJfgNnJoxSs3D7A28vZIBKZO+3dxuojmE0Ye4=;
        b=pznUc0CVrYhwwrlzGFVjkSriDa3rLu2Zp4sazhAFTC+rEmoRaqO46ztC5bu0KVNzDJ
         DTqljS99NMF0ESEaGMfV2XWkcqhGKLvVXW92uWcyQoX+m166X1EwiVciJoj4V5SruoXa
         9WTvzpPF0I42a4InN3CRYFxb/1AAxLf+TXyu4w9PES8a0EbilXd+t3ms5PxVZg72Ru4D
         HGuTZ+LkyiHcoNjDKlVriqyJ8cAf2ZcbwMom3gd3RtShQSxU8J4tknc8eOtpAdUCdT09
         fQTLXD5xQUO4rPEjZ1dEa95WD4UKziWNzsZjx578/1K2/KcZRwpPxt/M0O9qlTkaMPIz
         6nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984952; x=1781589752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmL2v6DJfgNnJoxSs3D7A28vZIBKZO+3dxuojmE0Ye4=;
        b=bT+ZTjtQPlRtqyI9z+r8xVeABLC3/DXqUmjp1Q84QVXE5O1zwouojckR1yBxawd8zi
         GVcvT94VslVWjgRnYs2iZxsaGDw+ktzF+TalwmgYQQI7D61GNTpCgqi5VVzIMtV0XjOS
         D9OytjYD7kgAAIPQZ4t+bKJ/xPgHR0Xw8IuvSnCCu+JcxOVYc3+tAFQUrbR7hwgWSbBw
         ge5V7x1bXUtrPZKx1zRSXtnwDVhTmT6269Bv6xoLe+cPyMS9a5or3hxD19N/2xIjvWY2
         PG0Y5YG6XlVeswkB+M+Kf7CFh7azsdvCreU80CZ5sy1B2s0NVe8OiMI9Qwzm93AI6LlX
         4haQ==
X-Gm-Message-State: AOJu0Yz1yINDxNxKlQRQsaf5b05HQj0k3UCBUx0EZUjFTHTK2n2lO/T4
	SIpPWpQhlxbTxde8tXmyhI5SiPpugtdsfLdywQGi6wkAqm1aALD0sglqWb9gLw==
X-Gm-Gg: Acq92OEm5zbXhdtnRzxOIdFkAlkwYCY2qvya5iueg0CS8deCJ3w6dNTuRTEUUBDlzTZ
	kMcE57QOQCtRGYjB8KuYn2nYSZz4ZBRYg0CpnoKAbGzpUi7osqn4ccpZ51/cxfSgQrDl5IWsqdE
	A7OkgvgcxA/xM89KJ4XHIePIAEcj6PHGVFRRIb95sXVsptAnNab3rhromn8lKmBUHKauweE4Qyz
	9xkUNuxWpwDh9Xe4jYTcLIpQXjrVBDnmJq3N2QiDJhoadZmEpuD2Fm86MJqbqUM+4yIsltrfKgl
	rm53ryYtR2f8s+YA5BOTxuaf3PmO2e0SGzsxTQPiLhfHuJfnzB+F8a2znXa8LquomRCupjtJDQo
	lKvjj6yhOBy/2R3d9hJx1SUY2REQssrAW8Vi8LmpNua5Fo5JzI7zws7oRkD3AiDw4qLj+RomINv
	kqHYja3t/gBVafRu1VOrrWtOc5wWsSCV1YVrE=
X-Received: by 2002:a17:902:da88:b0:2c0:b5c1:8e21 with SMTP id d9443c01a7336-2c1e7e4ca11mr217111935ad.16.1780984952275;
        Mon, 08 Jun 2026 23:02:32 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f9ed6csm202721105ad.31.2026.06.08.23.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:02:31 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 1/4] lib: sbi: cosmetic changes to reduce indentation
Date: Mon,  8 Jun 2026 23:00:21 -0700
Message-Id: <20260609060024.706-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609060024.706-1-ganboing@gmail.com>
References: <20260609060024.706-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070235_428802_822E3F87 
X-CRM114-Status: GOOD (  12.55  )
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

In preparation for subsequent patches

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 lib/sbi/sbi_trap_v_ldst.c | 117 +++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 57 deletions(-)

diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index 57f12b83..7d2e1409 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -11,6 +11,7 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_encoding.h>
+#include <sbi/sbi_bitops.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_trap_ldst.h>
 #include <sbi/sbi_trap.h>
@@ -189,44 +190,45 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		get_vreg(vlenb, 0, 0, vlenb, mask);
 
 	do {
-		if (!masked || ((mask[vstart / 8] >> (vstart % 8)) & 1)) {
-			/* compute element address */
-			ulong addr = base + vstart * stride;
+		if (masked && (~mask[vstart / 8] & BIT(vstart % 8)))
+			continue;
 
-			if (IS_INDEXED_LOAD(insn)) {
-				ulong offset = 0;
+		/* compute element address */
+		ulong addr = base + vstart * stride;
 
-				get_vreg(vlenb, vs2, vstart << view, 1 << view, (uint8_t *)&offset);
-				addr = base + offset;
-			}
+		if (IS_INDEXED_LOAD(insn)) {
+			ulong offset = 0;
+
+			get_vreg(vlenb, vs2, vstart << view, 1 << view, (uint8_t *)&offset);
+			addr = base + offset;
+		}
 
-			csr_write(CSR_VSTART, vstart);
-
-			/* obtain load data from memory */
-			for (ulong seg = 0; seg < nf; seg++) {
-				for (ulong i = 0; i < len; i++) {
-					bytes[seg * len + i] =
-						sbi_load_u8((void *)(addr + seg * len + i),
-							    &uptrap);
-
-					if (uptrap.cause) {
-						if (IS_FAULT_ONLY_FIRST_LOAD(insn) && vstart != 0) {
-							vl = vstart;
-							break;
-						}
-						vsetvl(vl, vtype);
-						uptrap.tinst = sbi_misaligned_tinst_fixup(
-							orig_trap->tinst, uptrap.tinst, i);
-						return sbi_trap_redirect(regs, &uptrap);
+		csr_write(CSR_VSTART, vstart);
+
+		/* obtain load data from memory */
+		for (ulong seg = 0; seg < nf; seg++) {
+			for (ulong i = 0; i < len; i++) {
+				bytes[seg * len + i] =
+					sbi_load_u8((void *)(addr + seg * len + i),
+						    &uptrap);
+
+				if (uptrap.cause) {
+					if (IS_FAULT_ONLY_FIRST_LOAD(insn) && vstart != 0) {
+						vl = vstart;
+						break;
 					}
+					vsetvl(vl, vtype);
+					uptrap.tinst = sbi_misaligned_tinst_fixup(
+						orig_trap->tinst, uptrap.tinst, i);
+					return sbi_trap_redirect(regs, &uptrap);
 				}
 			}
-
-			/* write load data to regfile */
-			for (ulong seg = 0; seg < nf; seg++)
-				set_vreg(vlenb, vd + seg * emul, vstart * len,
-					 len, &bytes[seg * len]);
 		}
+
+		/* write load data to regfile */
+		for (ulong seg = 0; seg < nf; seg++)
+			set_vreg(vlenb, vd + seg * emul, vstart * len,
+				 len, &bytes[seg * len]);
 	} while (++vstart < vl);
 
 	/* restore clobbered vl/vtype */
@@ -288,35 +290,36 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		get_vreg(vlenb, 0, 0, vlenb, mask);
 
 	do {
-		if (!masked || ((mask[vstart / 8] >> (vstart % 8)) & 1)) {
-			/* compute element address */
-			ulong addr = base + vstart * stride;
+		if (masked && (~mask[vstart / 8] & BIT(vstart % 8)))
+			continue;
 
-			if (IS_INDEXED_STORE(insn)) {
-				ulong offset = 0;
+		/* compute element address */
+		ulong addr = base + vstart * stride;
 
-				get_vreg(vlenb, vs2, vstart << view, 1 << view, (uint8_t *)&offset);
-				addr = base + offset;
-			}
+		if (IS_INDEXED_STORE(insn)) {
+			ulong offset = 0;
 
-			/* obtain store data from regfile */
-			for (ulong seg = 0; seg < nf; seg++)
-				get_vreg(vlenb, vd + seg * emul, vstart * len,
-					 len, &bytes[seg * len]);
-
-			csr_write(CSR_VSTART, vstart);
-
-			/* write store data to memory */
-			for (ulong seg = 0; seg < nf; seg++) {
-				for (ulong i = 0; i < len; i++) {
-					sbi_store_u8((void *)(addr + seg * len + i),
-						     bytes[seg * len + i], &uptrap);
-					if (uptrap.cause) {
-						vsetvl(vl, vtype);
-						uptrap.tinst = sbi_misaligned_tinst_fixup(
-							orig_trap->tinst, uptrap.tinst, i);
-						return sbi_trap_redirect(regs, &uptrap);
-					}
+			get_vreg(vlenb, vs2, vstart << view, 1 << view, (uint8_t *)&offset);
+			addr = base + offset;
+		}
+
+		/* obtain store data from regfile */
+		for (ulong seg = 0; seg < nf; seg++)
+			get_vreg(vlenb, vd + seg * emul, vstart * len,
+				 len, &bytes[seg * len]);
+
+		csr_write(CSR_VSTART, vstart);
+
+		/* write store data to memory */
+		for (ulong seg = 0; seg < nf; seg++) {
+			for (ulong i = 0; i < len; i++) {
+				sbi_store_u8((void *)(addr + seg * len + i),
+					     bytes[seg * len + i], &uptrap);
+				if (uptrap.cause) {
+					vsetvl(vl, vtype);
+					uptrap.tinst = sbi_misaligned_tinst_fixup(
+						orig_trap->tinst, uptrap.tinst, i);
+					return sbi_trap_redirect(regs, &uptrap);
 				}
 			}
 		}
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
