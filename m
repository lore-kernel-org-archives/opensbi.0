Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA44CCA468
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Vtakmz9a3X+qGAQtIPY9wQMgN6OSgScGVrhjpLq46g=; b=f0Y/esWDHUoVn1
	Yr8V5beDJQB+HsK/or2NYtOFUyNzNxjmTO0EjBHA27i4DqOlAvOzOzKIF2qe9v82O1g2l4p1GSTl9
	G2GkBtVMHqO51ExwPOp0S7kcH0wmKxNoSo2Vnb6BYJuUz8xxauABJMyv/QHB+2/CjJcKsNr3+MgQJ
	qyj19BeIHfv60a0q4Xltnfzl4Sp6i7CnCzS+iTJ5So2SBZxS16zb1FUQ9VIQpu0VvgpQ2CanlYqCO
	vTMjuMOhQC7CD8GadF0sNKasGgHvINGqk6WSC1Mk10JDD9ipB8fmHqYyUWv1P2VH3vBUTElV1yk4u
	acCgMzklpTIowfWTLm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cL6-00000005f6X-1rbc;
	Tue, 30 Sep 2025 15:32:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cL4-00000005f5f-05H7
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 15:32:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-27ee41e074dso56806155ad.1
        for <opensbi@lists.infradead.org>; Tue, 30 Sep 2025 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759246345; x=1759851145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1k3LfMKItqJxWdRV2fURJjxKALz5KmG8S9ni0S4h64=;
        b=Xts57MKUbmruxuYcTNJk47deHl3lejfht9CRB4K5ErFx9MUu3Ui4HOcvq6qM8uZyV4
         sykvutiqFHZ1sXW13Tewe2q5hABgRWw3II7jqRG/KsIOeslYMKWLeJ42BNp7gMzxW+Ub
         2HEOUTpYtq5UHWWwM2Sm7DlrY2XKGOk+RY6wWAds7oI6OOC1GD4k0rsxnrqdyjGFP9Mu
         CwAJSC9tospmDjuS29BChH/yHYdXVZ3icEJ7eRErgsHm7LnBuKOc6KaZo8giwk4HFJ4g
         PMHUQwBlvyievye80xD5MIvf7i+LSDU9RX3qMEXQNU+ZHf8eFt4rCPmQRUXUn0gCOD/M
         woVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759246345; x=1759851145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1k3LfMKItqJxWdRV2fURJjxKALz5KmG8S9ni0S4h64=;
        b=l55cn2R0qK6ttpEwLYCD4YRemBQih0fwbsUt9+eHnheqq0mSWYZ7e2suaV6YiLqKMh
         kcKg2UztStVUEw+rt8q+mY9ujIY2qhza8NtdpgMyM0D0JwUjc9A7qZEJ8Aj/gwozKcKz
         w8q8wlNogPmh+GhfGwoxnAmhWZMfsoe9j6DqIW8ZwnXu+poeOtGh4VRXepFX3Fflgafm
         OkWAGHyoq80qKApwQbb5JGePyUsUIE7gs1ZrW2ZVt5fWeRMC3DrQLGtBcVXNDu57zejR
         tSWastSLHRS+YNWQ37d/cKiQnlX5lOt6axYT9sLkv6SEHIVezu1l29IH/MTCgYD20xnk
         M/+w==
X-Forwarded-Encrypted: i=1; AJvYcCUywxZ7ER3U6ZwZKQZU7h7+iv9BrRnLdH6wHIq/odzK25jpksPuHm2K44wR9ry6XOMNfxorqB89@lists.infradead.org
X-Gm-Message-State: AOJu0YyVcZbxQ85qnq1YcJjP1bQ+pZIb3MY3euhYOTEOHvgq5/D6q66o
	xOxUieattXXB/RHfNV+GXa71DCd61wAh+lqe12ahx7xsAa2uUZ4ESvsKOCwd5qDJemk=
X-Gm-Gg: ASbGncsSV5tQ6IDtQidyjn7Qm+iW8e/RO/UWYEDCaAx6c0pUmOx0fVGoEtFqLR+uTHe
	ksgCllgclPz3QpYXo7dFXXUpEUHUnvtLcI2sMedXXPGtblm4Urtd6O+nj7bsRksFxQLdg7UKCOe
	ItLrH2eJNxBmBBlplQXWdEA9mb+v5uWL9twdDklIo5OC47XDMI8wjq7yVJcHvCgyODHgwEnXL8f
	4eRdbgr6xAzXG7Eai6lc8mySOwEbai7ft3oMC5vH4PZ8Jgry1tY4j0a5J0GEEsIUw3kbIHGquoF
	pQDCCrGM2rikt+DT5HU8YPJbwlfeSRYRQxMXa54L7ln6QPTF4zhgg5whBsrTXZYew+qoZM3yvbg
	yFoXZpT2XA0WA8jb1LyFQyBfeacLrrZiGK9pDZwYmgRzuys/SZeXJaFCmqwr2bsqVzeyGPdV91w
	W9X+qe1DJx3kC14w/jFA==
X-Google-Smtp-Source: AGHT+IGimuFw9/ep1yD5epKhwGclmBDcsUU1pEbaZ3p84qiT3ezWzWBL32+SBjuIdyhlZ+PNcpvABg==
X-Received: by 2002:a17:903:1b2c:b0:28c:2db3:b9ab with SMTP id d9443c01a7336-28e7f2a62bbmr2347255ad.26.1759246344499;
        Tue, 30 Sep 2025 08:32:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([27.61.44.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad1fd9sm161496055ad.142.2025.09.30.08.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 08:32:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] lib: Allow custom CSRs in csr_read_num() and csr_write_num()
Date: Tue, 30 Sep 2025 21:02:16 +0530
Message-ID: <20250930153216.89853-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_083226_099412_C1CBFEE1 
X-CRM114-Status: GOOD (  12.54  )
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

Some of the platforms use platform specific CSR access functions for
configuring implementation specific CSRs (such as PMA registers).

Extend the common csr_read_num() and csr_write_num() to allow custom
CSRs so that platform specific CSR access functions are not needed.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/riscv_encoding.h       |  34 ++++++++
 lib/sbi/riscv_asm.c                | 135 ++++++++++++++++++-----------
 platform/generic/andes/andes_pma.c |  90 ++-----------------
 platform/generic/mips/p8700.c      |  76 +---------------
 4 files changed, 127 insertions(+), 208 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 40a854e3..61e4b635 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -783,6 +783,40 @@
 #define CSR_VTYPE			0xc21
 #define CSR_VLENB			0xc22
 
+/* Custom CSR ranges */
+#define CSR_CUSTOM0_U_RW_BASE		0x800
+#define CSR_CUSTOM0_U_RW_COUNT		0x100
+
+#define CSR_CUSTOM1_U_RO_BASE		0xCC0
+#define CSR_CUSTOM1_U_RO_COUNT		0x040
+
+#define CSR_CUSTOM2_S_RW_BASE		0x5C0
+#define CSR_CUSTOM2_S_RW_COUNT		0x040
+
+#define CSR_CUSTOM3_S_RW_BASE		0x9C0
+#define CSR_CUSTOM3_S_RW_COUNT		0x040
+
+#define CSR_CUSTOM4_S_RO_BASE		0xDC0
+#define CSR_CUSTOM4_S_RO_COUNT		0x040
+
+#define CSR_CUSTOM5_HS_RW_BASE		0x6C0
+#define CSR_CUSTOM5_HS_RW_COUNT		0x040
+
+#define CSR_CUSTOM6_HS_RW_BASE		0xAC0
+#define CSR_CUSTOM6_HS_RW_COUNT		0x040
+
+#define CSR_CUSTOM7_HS_RO_BASE		0xEC0
+#define CSR_CUSTOM7_HS_RO_COUNT		0x040
+
+#define CSR_CUSTOM8_M_RW_BASE		0x7C0
+#define CSR_CUSTOM8_M_RW_COUNT		0x040
+
+#define CSR_CUSTOM9_M_RW_BASE		0xBC0
+#define CSR_CUSTOM9_M_RW_COUNT		0x040
+
+#define CSR_CUSTOM10_M_RO_BASE		0xFC0
+#define CSR_CUSTOM10_M_RO_COUNT		0x040
+
 /* ===== Trap/Exception Causes ===== */
 
 #define CAUSE_MISALIGNED_FETCH		0x0
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac0..3e44320f 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -93,77 +93,91 @@ void misa_string(int xlen, char *out, unsigned int out_sz)
 
 unsigned long csr_read_num(int csr_num)
 {
-#define switchcase_csr_read(__csr_num, __val)		\
+#define switchcase_csr_read(__csr_num)			\
 	case __csr_num:					\
-		__val = csr_read(__csr_num);		\
-		break;
-#define switchcase_csr_read_2(__csr_num, __val)	\
-	switchcase_csr_read(__csr_num + 0, __val)	\
-	switchcase_csr_read(__csr_num + 1, __val)
-#define switchcase_csr_read_4(__csr_num, __val)	\
-	switchcase_csr_read_2(__csr_num + 0, __val)	\
-	switchcase_csr_read_2(__csr_num + 2, __val)
-#define switchcase_csr_read_8(__csr_num, __val)	\
-	switchcase_csr_read_4(__csr_num + 0, __val)	\
-	switchcase_csr_read_4(__csr_num + 4, __val)
-#define switchcase_csr_read_16(__csr_num, __val)	\
-	switchcase_csr_read_8(__csr_num + 0, __val)	\
-	switchcase_csr_read_8(__csr_num + 8, __val)
-#define switchcase_csr_read_32(__csr_num, __val)	\
-	switchcase_csr_read_16(__csr_num + 0, __val)	\
-	switchcase_csr_read_16(__csr_num + 16, __val)
-#define switchcase_csr_read_64(__csr_num, __val)	\
-	switchcase_csr_read_32(__csr_num + 0, __val)	\
-	switchcase_csr_read_32(__csr_num + 32, __val)
-
-	unsigned long ret = 0;
+		return csr_read(__csr_num);
+#define switchcase_csr_read_2(__csr_num)		\
+	switchcase_csr_read(__csr_num + 0)		\
+	switchcase_csr_read(__csr_num + 1)
+#define switchcase_csr_read_4(__csr_num)		\
+	switchcase_csr_read_2(__csr_num + 0)		\
+	switchcase_csr_read_2(__csr_num + 2)
+#define switchcase_csr_read_8(__csr_num)		\
+	switchcase_csr_read_4(__csr_num + 0)		\
+	switchcase_csr_read_4(__csr_num + 4)
+#define switchcase_csr_read_16(__csr_num)		\
+	switchcase_csr_read_8(__csr_num + 0)		\
+	switchcase_csr_read_8(__csr_num + 8)
+#define switchcase_csr_read_32(__csr_num)		\
+	switchcase_csr_read_16(__csr_num + 0)		\
+	switchcase_csr_read_16(__csr_num + 16)
+#define switchcase_csr_read_64(__csr_num)		\
+	switchcase_csr_read_32(__csr_num + 0)		\
+	switchcase_csr_read_32(__csr_num + 32)
+#define switchcase_csr_read_128(__csr_num)		\
+	switchcase_csr_read_64(__csr_num + 0)		\
+	switchcase_csr_read_64(__csr_num + 64)
+#define switchcase_csr_read_256(__csr_num)		\
+	switchcase_csr_read_128(__csr_num + 0)		\
+	switchcase_csr_read_128(__csr_num + 128)
 
 	switch (csr_num) {
-	switchcase_csr_read_16(CSR_PMPCFG0, ret)
-	switchcase_csr_read_64(CSR_PMPADDR0, ret)
-	switchcase_csr_read(CSR_MCYCLE, ret)
-	switchcase_csr_read(CSR_MINSTRET, ret)
-	switchcase_csr_read(CSR_MHPMCOUNTER3, ret)
-	switchcase_csr_read_4(CSR_MHPMCOUNTER4, ret)
-	switchcase_csr_read_8(CSR_MHPMCOUNTER8, ret)
-	switchcase_csr_read_16(CSR_MHPMCOUNTER16, ret)
-	switchcase_csr_read(CSR_MCOUNTINHIBIT, ret)
-	switchcase_csr_read(CSR_MCYCLECFG, ret)
-	switchcase_csr_read(CSR_MINSTRETCFG, ret)
-	switchcase_csr_read(CSR_MHPMEVENT3, ret)
-	switchcase_csr_read_4(CSR_MHPMEVENT4, ret)
-	switchcase_csr_read_8(CSR_MHPMEVENT8, ret)
-	switchcase_csr_read_16(CSR_MHPMEVENT16, ret)
+	switchcase_csr_read_16(CSR_PMPCFG0)
+	switchcase_csr_read_64(CSR_PMPADDR0)
+	switchcase_csr_read(CSR_MCYCLE)
+	switchcase_csr_read(CSR_MINSTRET)
+	switchcase_csr_read(CSR_MHPMCOUNTER3)
+	switchcase_csr_read_4(CSR_MHPMCOUNTER4)
+	switchcase_csr_read_8(CSR_MHPMCOUNTER8)
+	switchcase_csr_read_16(CSR_MHPMCOUNTER16)
+	switchcase_csr_read(CSR_MCOUNTINHIBIT)
+	switchcase_csr_read(CSR_MCYCLECFG)
+	switchcase_csr_read(CSR_MINSTRETCFG)
+	switchcase_csr_read(CSR_MHPMEVENT3)
+	switchcase_csr_read_4(CSR_MHPMEVENT4)
+	switchcase_csr_read_8(CSR_MHPMEVENT8)
+	switchcase_csr_read_16(CSR_MHPMEVENT16)
 #if __riscv_xlen == 32
-	switchcase_csr_read(CSR_MCYCLEH, ret)
-	switchcase_csr_read(CSR_MINSTRETH, ret)
-	switchcase_csr_read(CSR_MHPMCOUNTER3H, ret)
-	switchcase_csr_read_4(CSR_MHPMCOUNTER4H, ret)
-	switchcase_csr_read_8(CSR_MHPMCOUNTER8H, ret)
-	switchcase_csr_read_16(CSR_MHPMCOUNTER16H, ret)
+	switchcase_csr_read(CSR_MCYCLEH)
+	switchcase_csr_read(CSR_MINSTRETH)
+	switchcase_csr_read(CSR_MHPMCOUNTER3H)
+	switchcase_csr_read_4(CSR_MHPMCOUNTER4H)
+	switchcase_csr_read_8(CSR_MHPMCOUNTER8H)
+	switchcase_csr_read_16(CSR_MHPMCOUNTER16H)
 	/**
 	 * The CSR range M[CYCLE, INSTRET]CFGH are available only if smcntrpmf
 	 * extension is present. The caller must ensure that.
 	 */
-	switchcase_csr_read(CSR_MCYCLECFGH, ret)
-	switchcase_csr_read(CSR_MINSTRETCFGH, ret)
+	switchcase_csr_read(CSR_MCYCLECFGH)
+	switchcase_csr_read(CSR_MINSTRETCFGH)
 	/**
 	 * The CSR range MHPMEVENT[3-16]H are available only if sscofpmf
 	 * extension is present. The caller must ensure that.
 	 */
-	switchcase_csr_read(CSR_MHPMEVENT3H, ret)
-	switchcase_csr_read_4(CSR_MHPMEVENT4H, ret)
-	switchcase_csr_read_8(CSR_MHPMEVENT8H, ret)
-	switchcase_csr_read_16(CSR_MHPMEVENT16H, ret)
+	switchcase_csr_read(CSR_MHPMEVENT3H)
+	switchcase_csr_read_4(CSR_MHPMEVENT4H)
+	switchcase_csr_read_8(CSR_MHPMEVENT8H)
+	switchcase_csr_read_16(CSR_MHPMEVENT16H)
 #endif
+	switchcase_csr_read_256(CSR_CUSTOM0_U_RW_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM1_U_RO_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM2_S_RW_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM3_S_RW_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM4_S_RO_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM5_HS_RW_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM6_HS_RW_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM7_HS_RO_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM8_M_RW_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM9_M_RW_BASE)
+	switchcase_csr_read_64(CSR_CUSTOM10_M_RO_BASE)
 
 	default:
 		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
-		break;
+		return 0;
 	}
 
-	return ret;
-
+#undef switchcase_csr_read_256
+#undef switchcase_csr_read_128
 #undef switchcase_csr_read_64
 #undef switchcase_csr_read_32
 #undef switchcase_csr_read_16
@@ -197,6 +211,12 @@ void csr_write_num(int csr_num, unsigned long val)
 #define switchcase_csr_write_64(__csr_num, __val)	\
 	switchcase_csr_write_32(__csr_num + 0, __val)	\
 	switchcase_csr_write_32(__csr_num + 32, __val)
+#define switchcase_csr_write_128(__csr_num, __val)	\
+	switchcase_csr_write_64(__csr_num + 0, __val)	\
+	switchcase_csr_write_64(__csr_num + 64, __val)
+#define switchcase_csr_write_256(__csr_num, __val)	\
+	switchcase_csr_write_128(__csr_num + 0, __val)	\
+	switchcase_csr_write_128(__csr_num + 128, __val)
 
 	switch (csr_num) {
 	switchcase_csr_write_16(CSR_PMPCFG0, val)
@@ -228,12 +248,21 @@ void csr_write_num(int csr_num, unsigned long val)
 	switchcase_csr_write_4(CSR_MHPMEVENT4, val)
 	switchcase_csr_write_8(CSR_MHPMEVENT8, val)
 	switchcase_csr_write_16(CSR_MHPMEVENT16, val)
+	switchcase_csr_write_256(CSR_CUSTOM0_U_RW_BASE, val)
+	switchcase_csr_write_64(CSR_CUSTOM2_S_RW_BASE, val)
+	switchcase_csr_write_64(CSR_CUSTOM3_S_RW_BASE, val)
+	switchcase_csr_write_64(CSR_CUSTOM5_HS_RW_BASE, val)
+	switchcase_csr_write_64(CSR_CUSTOM6_HS_RW_BASE, val)
+	switchcase_csr_write_64(CSR_CUSTOM8_M_RW_BASE, val)
+	switchcase_csr_write_64(CSR_CUSTOM9_M_RW_BASE, val)
 
 	default:
 		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
 		break;
 	}
 
+#undef switchcase_csr_write_256
+#undef switchcase_csr_write_128
 #undef switchcase_csr_write_64
 #undef switchcase_csr_write_32
 #undef switchcase_csr_write_16
diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index eeeb110e..ba9a35bb 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -17,78 +17,6 @@
 #include <sbi/sbi_error.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 
-static unsigned long andes_pma_read_num(unsigned int csr_num)
-{
-#define switchcase_csr_read(__csr_num, __val)		\
-	case __csr_num:					\
-		__val = csr_read(__csr_num);		\
-		break;
-#define switchcase_csr_read_2(__csr_num, __val)		\
-	switchcase_csr_read(__csr_num + 0, __val)	\
-	switchcase_csr_read(__csr_num + 1, __val)
-#define switchcase_csr_read_4(__csr_num, __val)		\
-	switchcase_csr_read_2(__csr_num + 0, __val)	\
-	switchcase_csr_read_2(__csr_num + 2, __val)
-#define switchcase_csr_read_8(__csr_num, __val)		\
-	switchcase_csr_read_4(__csr_num + 0, __val)	\
-	switchcase_csr_read_4(__csr_num + 4, __val)
-#define switchcase_csr_read_16(__csr_num, __val)	\
-	switchcase_csr_read_8(__csr_num + 0, __val)	\
-	switchcase_csr_read_8(__csr_num + 8, __val)
-
-	unsigned long ret = 0;
-
-	switch (csr_num) {
-	switchcase_csr_read_4(CSR_PMACFG0, ret)
-	switchcase_csr_read_16(CSR_PMAADDR0, ret)
-	default:
-		sbi_panic("%s: Unknown Andes PMA CSR %#x", __func__, csr_num);
-		break;
-	}
-
-	return ret;
-
-#undef switchcase_csr_read_16
-#undef switchcase_csr_read_8
-#undef switchcase_csr_read_4
-#undef switchcase_csr_read_2
-#undef switchcase_csr_read
-}
-
-static void andes_pma_write_num(unsigned int csr_num, unsigned long val)
-{
-#define switchcase_csr_write(__csr_num, __val)		\
-	case __csr_num:					\
-		csr_write(__csr_num, __val);		\
-		break;
-#define switchcase_csr_write_2(__csr_num, __val)	\
-	switchcase_csr_write(__csr_num + 0, __val)	\
-	switchcase_csr_write(__csr_num + 1, __val)
-#define switchcase_csr_write_4(__csr_num, __val)	\
-	switchcase_csr_write_2(__csr_num + 0, __val)	\
-	switchcase_csr_write_2(__csr_num + 2, __val)
-#define switchcase_csr_write_8(__csr_num, __val)	\
-	switchcase_csr_write_4(__csr_num + 0, __val)	\
-	switchcase_csr_write_4(__csr_num + 4, __val)
-#define switchcase_csr_write_16(__csr_num, __val)	\
-	switchcase_csr_write_8(__csr_num + 0, __val)	\
-	switchcase_csr_write_8(__csr_num + 8, __val)
-
-	switch (csr_num) {
-	switchcase_csr_write_4(CSR_PMACFG0, val)
-	switchcase_csr_write_16(CSR_PMAADDR0, val)
-	default:
-		sbi_panic("%s: Unknown Andes PMA CSR %#x", __func__, csr_num);
-		break;
-	}
-
-#undef switchcase_csr_write_16
-#undef switchcase_csr_write_8
-#undef switchcase_csr_write_4
-#undef switchcase_csr_write_2
-#undef switchcase_csr_write
-}
-
 static inline bool not_napot(unsigned long addr, unsigned long size)
 {
 	return ((size & (size - 1)) || (addr & (size - 1)));
@@ -108,11 +36,11 @@ static char get_pmaxcfg(int entry_id)
 
 #if __riscv_xlen == 64
 	pmacfg_addr = CSR_PMACFG0 + ((entry_id / 8) ? 2 : 0);
-	pmacfg_val = andes_pma_read_num(pmacfg_addr);
+	pmacfg_val = csr_read_num(pmacfg_addr);
 	pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
 #elif __riscv_xlen == 32
 	pmacfg_addr = CSR_PMACFG0 + (entry_id / 4);
-	pmacfg_val = andes_pma_read_num(pmacfg_addr);
+	pmacfg_val = csr_read_num(pmacfg_addr);
 	pmaxcfg = (char *)&pmacfg_val + (entry_id % 4);
 #else
 #error "Unexpected __riscv_xlen"
@@ -128,17 +56,17 @@ static void set_pmaxcfg(int entry_id, char flags)
 
 #if __riscv_xlen == 64
 	pmacfg_addr = CSR_PMACFG0 + ((entry_id / 8) ? 2 : 0);
-	pmacfg_val = andes_pma_read_num(pmacfg_addr);
+	pmacfg_val = csr_read_num(pmacfg_addr);
 	pmaxcfg = (char *)&pmacfg_val + (entry_id % 8);
 #elif __riscv_xlen == 32
 	pmacfg_addr = CSR_PMACFG0 + (entry_id / 4);
-	pmacfg_val = andes_pma_read_num(pmacfg_addr);
+	pmacfg_val = csr_read_num(pmacfg_addr);
 	pmaxcfg = (char *)&pmacfg_val + (entry_id % 4);
 #else
 #error "Unexpected __riscv_xlen"
 #endif
 	*pmaxcfg = flags;
-	andes_pma_write_num(pmacfg_addr, pmacfg_val);
+	csr_write_num(pmacfg_addr, pmacfg_val);
 }
 
 static void decode_pmaaddrx(int entry_id, unsigned long *start,
@@ -152,7 +80,7 @@ static void decode_pmaaddrx(int entry_id, unsigned long *start,
 	 * size = 2 ^ (k + 3)
 	 * start = 4 * ($pmaaddr - (size / 8) + 1)
 	 */
-	pmaaddr = andes_pma_read_num(CSR_PMAADDR0 + entry_id);
+	pmaaddr = csr_read_num(CSR_PMAADDR0 + entry_id);
 	k = sbi_ffz(pmaaddr);
 	*size = 1 << (k + 3);
 	*start = (pmaaddr - (1 << k) + 1) << 2;
@@ -199,9 +127,9 @@ static unsigned long andes_pma_setup(const struct andes_pma_region *pma_region,
 
 	pmaaddr = (addr >> 2) + (size >> 3) - 1;
 
-	andes_pma_write_num(CSR_PMAADDR0 + entry_id, pmaaddr);
+	csr_write_num(CSR_PMAADDR0 + entry_id, pmaaddr);
 
-	return andes_pma_read_num(CSR_PMAADDR0 + entry_id) == pmaaddr ?
+	return csr_read_num(CSR_PMAADDR0 + entry_id) == pmaaddr ?
 	       pmaaddr : SBI_EINVAL;
 }
 
@@ -429,7 +357,7 @@ int andes_sbi_free_pma(unsigned long pa)
 			continue;
 
 		set_pmaxcfg(i, ANDES_PMACFG_ETYP_OFF);
-		andes_pma_write_num(CSR_PMAADDR0 + i, 0);
+		csr_write_num(CSR_PMAADDR0 + i, 0);
 
 		return SBI_SUCCESS;
 	}
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index d3e015ba..a25610a1 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -18,78 +18,6 @@
 
 extern void mips_warm_boot(void);
 
-static unsigned long mips_csr_read_num(int csr_num)
-{
-#define switchcase_csr_read(__csr_num, __val)		\
-	case __csr_num:					\
-		__val = csr_read(__csr_num);		\
-		break;
-#define switchcase_csr_read_2(__csr_num, __val)		\
-	switchcase_csr_read(__csr_num + 0, __val)	\
-	switchcase_csr_read(__csr_num + 1, __val)
-#define switchcase_csr_read_4(__csr_num, __val)		\
-	switchcase_csr_read_2(__csr_num + 0, __val)	\
-	switchcase_csr_read_2(__csr_num + 2, __val)
-#define switchcase_csr_read_8(__csr_num, __val)		\
-	switchcase_csr_read_4(__csr_num + 0, __val)	\
-	switchcase_csr_read_4(__csr_num + 4, __val)
-#define switchcase_csr_read_16(__csr_num, __val)	\
-	switchcase_csr_read_8(__csr_num + 0, __val)	\
-	switchcase_csr_read_8(__csr_num + 8, __val)
-
-	unsigned long ret = 0;
-
-	switch(csr_num) {
-	switchcase_csr_read_16(CSR_MIPSPMACFG0, ret)
-
-	default:
-		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
-		break;
-	}
-
-	return ret;
-
-#undef switchcase_csr_read_16
-#undef switchcase_csr_read_8
-#undef switchcase_csr_read_4
-#undef switchcase_csr_read_2
-#undef switchcase_csr_read
-}
-
-static void mips_csr_write_num(int csr_num, unsigned long val)
-{
-#define switchcase_csr_write(__csr_num, __val)		\
-	case __csr_num:					\
-		csr_write(__csr_num, __val);		\
-		break;
-#define switchcase_csr_write_2(__csr_num, __val)	\
-	switchcase_csr_write(__csr_num + 0, __val)	\
-	switchcase_csr_write(__csr_num + 1, __val)
-#define switchcase_csr_write_4(__csr_num, __val)	\
-	switchcase_csr_write_2(__csr_num + 0, __val)	\
-	switchcase_csr_write_2(__csr_num + 2, __val)
-#define switchcase_csr_write_8(__csr_num, __val)	\
-	switchcase_csr_write_4(__csr_num + 0, __val)	\
-	switchcase_csr_write_4(__csr_num + 4, __val)
-#define switchcase_csr_write_16(__csr_num, __val)	\
-	switchcase_csr_write_8(__csr_num + 0, __val)	\
-	switchcase_csr_write_8(__csr_num + 8, __val)
-
-	switch(csr_num) {
-	switchcase_csr_write_16(CSR_MIPSPMACFG0, val)
-
-	default:
-		sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
-		break;
-	}
-
-#undef switchcase_csr_write_16
-#undef switchcase_csr_write_8
-#undef switchcase_csr_write_4
-#undef switchcase_csr_write_2
-#undef switchcase_csr_write
-}
-
 static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 			       unsigned long prot, unsigned long addr,
 			       unsigned long log2len)
@@ -103,11 +31,11 @@ static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 	cfgmask = ~(0xffUL << pmacfg_shift);
 
 	/* Read pmacfg to change cacheability */
-	pmacfg = (mips_csr_read_num(pmacfg_csr) & cfgmask);
+	pmacfg = (csr_read_num(pmacfg_csr) & cfgmask);
 	cca = (flags & SBI_DOMAIN_MEMREGION_MMIO) ? CCA_CACHE_DISABLE :
 				  CCA_CACHE_ENABLE | PMA_SPECULATION;
 	pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
-	mips_csr_write_num(pmacfg_csr, pmacfg);
+	csr_write_num(pmacfg_csr, pmacfg);
 }
 
 #if CLUSTERS_IN_PLATFORM > 1
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
