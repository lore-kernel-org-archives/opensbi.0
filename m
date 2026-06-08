Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC52CD8CAC
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XxeyVvm71Iw1qPIK0YfVhdFAblgITmp6SxG5YTveTk=; b=TKFnrusllfRMoN
	QUVS+Qx9+OKmLHb/5ZS11JJdgSk+mW/UZrYFpXJB8LKy7sQzYtgaOBHOSeKXxph0En9caPR243DBw
	kK2K+E5EFGhX2EXTwnb6AodSFI6cciLiKblfhLVMPbvAOPAf6ZbQG44BVdojv6fYceEmNLcYfE9wM
	zqJMZlNv857BtPgSLd2v75Ve+zC+m16SC6exHxrhB/BFz7YJErbJU93qevMIV0IhalQdn8j57qT4S
	XGyodSeDygqytSVGLwRbqG2sGlppTNd8xkyvE1Cycr3uiZRhse+XK1LngMhVf1iVhSWNoBPM/C1RV
	P2ZETFItwArdtTNhoYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNa-00000004Q5o-3OEg;
	Mon, 08 Jun 2026 21:19:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhNY-00000004Q4T-3jkq
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 21:19:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2bf125989f2so34799635ad.3
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780953568; x=1781558368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmL2v6DJfgNnJoxSs3D7A28vZIBKZO+3dxuojmE0Ye4=;
        b=GjFcXIfCPz4ftU/qI7tbZO9t6b9SIt9PBG9kcom5PVzRFsY5XNajXImxe02O5oAfqr
         L2+ZhvfY6LPnYjitBZ902mbc8gizj5PuPE2LNUzCZq3Mls6YCpK0pfIboTSUw2cbgREG
         WalmQGCp/zpW1Y+HaXl9L9XE4zt04+x4v+FQstC5abtk457ZGV6pXeqgy+TY0Oo0Ttmr
         Afv9h4HNunfN2ouhSibZJqLJ58+tgBg7DwodEwj/h3nibxkKYIu/txsGtoRp33srmbIq
         FiTIw5bO/yOxQ4btx9q/5glqS5sr+KaqtnU93oEr2XkUcT8JeCxLLyw8JkhE17Tksht6
         orMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953568; x=1781558368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmL2v6DJfgNnJoxSs3D7A28vZIBKZO+3dxuojmE0Ye4=;
        b=On5XO4FRPfhMQaHBysfEx1L02/TQbw3mG/MGiSvD+tNs+a0EhHkWMuq6B65KkzGewg
         buJnMW6mqVSyW0ka9HYQj4E4vCPb4A+vKlSfDDNEIOgfC/g3/ugPMu0ZmgTLygQVphlq
         scdZRyaT5EVgdVuu0BfAj5DAXAW7MgNc5q4A68VMrNa/ZWmtwJJ0akaOzyXRj3uFdy4C
         lhgDxRHfecWTEBPonVGJNR0O+CDF8QufX1FwsmbdW6QUpqD6mtG8FAxhRCLXnt4kCr71
         XAkpg8LKpq0H5BtJnQr0SobADaknHJt+KrWzsPhquggKDPOApt4ecjojTcdItg9GLyHa
         7x/g==
X-Gm-Message-State: AOJu0Yx6DdbnCQIEa4MmAR7eDpeSGMhsuDaAMPcUs1JTU99UvTPj2Jy7
	gI7wqdirJ79Q/aLJMCdux/hR6FoLuLQxBwxXJccB1eNwEwKWxaWutwlCvCegjg==
X-Gm-Gg: Acq92OGVaVz2wUX1EyPE3KcNLlCW9wUUpOmtRMgg0ShsOvwlzcjQ6MSlllfMNQLb2aX
	CqzQJbd85dy8MDMkjNkVwFg9EzaTq9tOJKi/oSoujMSs1I24WNqL9ljVxwczsDxxTmY7MQo7q6x
	wi1pPUYCI+oB4WrR6mTzBOPwbpmDMDPgukNsuSrRwoIhMH5sJMLX2j3B/YrrGW1wmtqXJO6oDaQ
	kBiH8o6sL8ffScO1EHGFx1SWpzHGD3JymuZ4zxd2/1SuGXBMaNqkKJGp492wui8fCzbsvHi7ZKV
	6kxQRIgOHCunuOF9bHbv0dm8F27ZcZyzX++nzkNb3ZJGupqULIvx7yzJEMRM9zzvmPUONkRxYi2
	1t0A7DZWpodMsqjKGr82vdfzQS5oMiPGF8zSq8tkFlMAEP3/D8u4U82MluJv9eNaEG69/4iulbW
	3eBdjEEI9xBplMdZ7HV3H0hJqjrk3B6RgeXyE=
X-Received: by 2002:a17:903:2342:b0:2bf:160f:7038 with SMTP id d9443c01a7336-2c1e7b13129mr179216975ad.12.1780953568103;
        Mon, 08 Jun 2026 14:19:28 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm182789005ad.32.2026.06.08.14.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:19:27 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH 1/4] lib: sbi: cosmetic changes to reduce indentation
Date: Mon,  8 Jun 2026 14:17:00 -0700
Message-Id: <20260608211703.571-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608211703.571-1-ganboing@gmail.com>
References: <20260608211703.571-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_141928_932643_8E5E60CA 
X-CRM114-Status: GOOD (  12.56  )
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
