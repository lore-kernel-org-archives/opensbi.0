Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD95CD13CF
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 03:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsCj1VxG80scDpQENjhsPg5CvODjmVQDpHRUzyD41xQ=; b=iFeOBY3mYfKY/P
	TtYwDhiacjaBxxYAQWxlnUo4mNDwIUHZANF1advYCddOSXDDcoksdvO6mumU9StSYRmohPT7/efT+
	HvDwl1cgCpkOwjYKnNHFDJLXPSumTQjIsi1sESrAoVeBqAEjF8xhNsEi0XKbrbb5gSo/q2uCkKtW8
	fD47dBFBtM+/wBJAaklP3hEVGGPxVLEE3bZq7yJWMwibkUxN7vFkvMcy5KlJ6PBtK2D6ko2HCwCd0
	m2wFufkyGulba8z7cV2WLqpvoiDU9ihV95lSbpXL5lxtAGRWwXEUTiYxyQRYOXUP05ow9d4Tpz7NU
	XyqDP6zLtO/Txt2v/AYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHM-00000006SP2-2340;
	Tue, 11 Nov 2025 03:42:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHJ-00000006SNG-181r
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 03:42:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so2215328a91.1
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 19:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762832564; x=1763437364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEhnv52LJc4C6PCCuil+z8EbEOh//XjrmsT6fdJvXC0=;
        b=d5KP56Jnj3c+6osLtLu3O9hMMZh3s9yeuaMNd3gNLkj0LH2pWpqu7teDmYDsuqRlIy
         k70wsZTut9UNVxzQ+2+++3L8t+sx1iyR3TUTB2tdlVwHZny2cNsAfYGbR461ulsvjz5X
         OcL86GEOc6oEmeRkescgMyjPoclAqlknY60M7fr9cJBb0EzbhrkRwu9A3JOVMyHblqta
         fOxLkIAVKojGkoI5S0BE+zdUUY8NwLj6yCgO1k7L71iRHPKNa7vUpepj01FcjhQOCDfs
         eCO3rF1gsem3jfgemxN/1f0XUVjJuLBnx7AAm9mOpOzCarlGFQ7rmA1G2ZPi9S5i9efg
         EWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762832564; x=1763437364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HEhnv52LJc4C6PCCuil+z8EbEOh//XjrmsT6fdJvXC0=;
        b=qL2KulS96wLFFAA8EItZi9nzYfsi4z4iLD1Bx1J4gdrNEJWsJN0PGmT6WjL0YouxvT
         lom7ZgGQFQIlH/9i82Qq6Ipt+d5dP1j1VMm7/41+VdBg0bNKp32sKSNS3t3/sxo1bE1B
         GaxYXL5Los407f/hFWfwkSN+ZV1VtDH7A1aQArQ/ZM8ondu3BCP+PGbKnyAhALDj9ZpM
         uYGydLSYWTMKfh2CpWKzI7CkrWAj9+AQeZyuogPgx2ne8mSTIeQvRfEo5am1QjmSx/A6
         3LXr3Nz3k2i1ftv38DED+ams4lUiKaooySbKtjPHGLFxDOdqlqjsco6X6YRpPsEh1ee+
         04EQ==
X-Gm-Message-State: AOJu0YyeadpT6axK8T22yWQM5BgyH0zET47PfrQ/C92YNiECPNvSJfL6
	Rdf9uyaaWVa666TXBa6gbYpg84vFtPoW0i7z2RQ3FSvuTrJhda7Vi7X9NGRsgg==
X-Gm-Gg: ASbGnctPuk5lBCcsFgA6wQ49FQR2MNjDNdNCT/ckS4pA0k+PvLVo5aM4yPw5k2eQT3x
	QMHU24nOKj2hFgKxO0fXI+ZJKa3Uk8J3f4X8vr3U/ffmPiLh4sYvkPDOq5EUmpqpYt4TDolSlSD
	S4qmI3fbvZzR6GmrBmN5jvshjXNVTLRxaSq0mY82y6Ky5zRtbU2l8V/jG3fN7A++bnBR6YKPRHz
	1495llibv3rJrHjk4qn0ssmmhuGsAwETEl89bbQFT/YU2zkcssW8x2T+QHJEtumtEHabZ4c/izA
	H5e2SKUpNgPpBM/4EeGU0mS0BhxDcD0JCF1vlQsQeyvgkiIU3wu6fLQhahAHLC7NWiTrpbDuW7E
	06H2gSu1UrtLFXn8sGMX125v6sHgsSHIdy2LK4PUXWAVDmGlyv5md8Kfxqft+VnDC8NhUE1lmEB
	OCTeL6iGFJ6aIY
X-Google-Smtp-Source: AGHT+IHV3FwUafJ0fa278O/SEnVlpF5a3PCq/XSphlHInQMYwKhWWc7KbMvROK3jvz4lt1F8VKEKXA==
X-Received: by 2002:a17:90b:2dc8:b0:32d:dc3e:5575 with SMTP id 98e67ed59e1d1-3436cb1210fmr12527219a91.5.1762832563908;
        Mon, 10 Nov 2025 19:42:43 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm19434060a91.7.2025.11.10.19.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:42:43 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org
Subject: [PATCH 3/3] platform: generic: eswin: add EIC7700
Date: Mon, 10 Nov 2025 19:41:11 -0800
Message-Id: <20251111034111.43973-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111034111.43973-1-ganboing@gmail.com>
References: <20251111034111.43973-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_194245_342954_C8509E4B 
X-CRM114-Status: GOOD (  24.36  )
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

Initial platform support for ESWIN Computing EIC7700 based on public SoC
datasheet[1] and tested on HiFive Premier P550. Vendor U-boot/Linux boots
fine, and I've tested Geekbench 6.5.0 Preview and got scores on par with
the vendor OpenSBI. System shutdown is not implemented due to the lack of
public doc regarding the UART communication protocol between the SoC and
the onboard BMC, which controls ATX power on HiFive P550. [2]

The files and functions are intentionally named as eic770x in many places
for future enhancements to support the 2-cluster/die version of the same
SoC, namely EIC7702, seen on DC-ROMA AI PC FML13V03. (Out of scope)

There're 4 build time tunable parameters added to Kconfig, and the values
are set in custom CSRs during boot:
 - ESWIN_EIC770X_FEAT0_CFG
 - ESWIN_EIC770X_FEAT1_CFG
 - ESWIN_EIC770X_L1_HWPF_CFG
 - ESWIN_EIC770X_L2_HWPF_CFG

The default values are dumped when running SiFive's vendor OpenSBI, and
with my own tuning to address the perf regression reported by drmpeg [3]

To build the firmware+u-boot blob, Use the following, and docs [4] for
testing it with UART boot without flashing:

make FW_TEXT_START=0x80000000 \
     FW_PAYLOAD_OFFSET=0x200000 \
     FW_PAYLOAD_PATH=u-boot-nodtb.bin \
     FW_PAYLOAD_FDT_ADDR=0xf8000000 \
     FW_FDT_PATH=u-boot.dtb

[1] https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual
[2] https://www.sifive.com/boards/hifive-premier-p550#documentation
[3] https://forums.sifive.com/t/low-1-core-stream-bandwidth/7274/15
[4] https://github.com/ganboing/EIC770x-Docs/blob/main/p550/bootchain/UART-Boot.md

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 platform/generic/Kconfig                 |   5 +
 platform/generic/configs/defconfig       |   1 +
 platform/generic/eswin/Kconfig           |  29 ++++
 platform/generic/eswin/eic770x.c         | 165 +++++++++++++++++++++++
 platform/generic/eswin/objects.mk        |  11 ++
 platform/generic/include/eswin/eic770x.h |  49 +++++++
 6 files changed, 260 insertions(+)
 create mode 100644 platform/generic/eswin/Kconfig
 create mode 100644 platform/generic/eswin/eic770x.c
 create mode 100644 platform/generic/eswin/objects.mk
 create mode 100644 platform/generic/include/eswin/eic770x.h

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index aedc59a5..047e13ca 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -88,7 +88,12 @@ config PLATFORM_SPACEMIT_K1
 	select FDT_HSM_SPACEMIT
 	default n
 
+config PLATFORM_ESWIN_EIC770X
+	bool "ESWIN EIC770X support"
+	default n
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
+source "$(OPENSBI_SRC_DIR)/platform/generic/eswin/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
 endif
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 9e040ac3..60c5449e 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -10,6 +10,7 @@ CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
 CONFIG_PLATFORM_SPACEMIT_K1=y
+CONFIG_PLATFORM_ESWIN_EIC770X=y
 CONFIG_FDT_CACHE=y
 CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
 CONFIG_FDT_CPPC=y
diff --git a/platform/generic/eswin/Kconfig b/platform/generic/eswin/Kconfig
new file mode 100644
index 00000000..84d0f43a
--- /dev/null
+++ b/platform/generic/eswin/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: BSD-2-Clause
+
+config ESWIN_EIC770X_FEAT0_CFG
+	int "ESWIN EIC7700X Feature Disable 0 CSR Configuration"
+	default 0x4000
+	help
+	 CSR Value to initialize EIC770X_FEAT0 (0x7c1) with.
+	 Refer to EIC770X SoC TRM for recommendations.
+
+config ESWIN_EIC770X_FEAT1_CFG
+	int "ESWIN EIC7700X Feature Disable 1 CSR Configuration"
+	default 0x80
+	help
+	 CSR Value to initialize EIC770X_FEAT1 (0x7c2) with.
+	 Refer to EIC770X SoC TRM for recommendations.
+
+config ESWIN_EIC770X_L1_HWPF_CFG
+	int "ESWIN EIC7700X L1 HW Prefetcher CSR Configuration"
+	default 0x1005c1be649
+	help
+	 CSR Value to initialize EIC770X_L1_HWPF (0x7c3) with.
+	 Refer to EIC770X SoC TRM for recommendations.
+
+config ESWIN_EIC770X_L2_HWPF_CFG
+	int "ESWIN EIC7700X L2 HW Prefetcher CSR Configuration"
+	default 0x929f
+	help
+	 CSR Value to initialize EIC770X_L2_HWPF (0x7c4) with.
+	 Refer to EIC770X SoC TRM for recommendations.
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
new file mode 100644
index 00000000..a4a11186
--- /dev/null
+++ b/platform/generic/eswin/eic770x.c
@@ -0,0 +1,165 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Bo Gan <ganboing@gmail.com>
+ *
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_math.h>
+#include <eswin/eic770x.h>
+
+static int eic770x_system_reset_check(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		return 1;
+	default:
+		return 0;
+	}
+}
+
+static void eic770x_system_reset(u32 type, u32 reason)
+{
+	switch (type) {
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		writel(EIC770X_SYSCRG_RST_VAL, (void *)EIC770X_SYSCRG_RST);
+	}
+
+	sbi_printf("%s: Unable to reset system\n", __func__);
+	sbi_hart_hang();
+}
+
+static struct sbi_system_reset_device eic770x_reset = {
+	.name = "eic770x_reset",
+	.system_reset_check = eic770x_system_reset_check,
+	.system_reset = eic770x_system_reset
+};
+
+static int eswin_eic770x_early_init(bool cold_boot)
+{
+	if (cold_boot) {
+		/* Enable bus blocker */
+		writel(1, (void*)EIC770X_TL64D2D_OUT);
+		writel(1, (void*)EIC770X_TL256D2D_OUT);
+		writel(1, (void*)EIC770X_TL256D2D_IN);
+		asm volatile ("fence o, rw");
+	}
+
+	return generic_early_init(cold_boot);
+}
+
+static int eswin_eic770x_final_init(bool cold_boot)
+{
+	if (cold_boot)
+		sbi_system_reset_add_device(&eic770x_reset);
+
+	/**
+	 * On EIC770X, we need to use PMP to block Memory Port regions that
+	 * doesn't belong to the current hart's cluster in order to prevent
+	 * speculative accesses or HW prefetcher (perhaps?) from generating
+	 * bus error:
+	 *
+	 * 	bus error of cause event: 9, accrued: 0x220,
+	 *	physical address: 0x24ffffffa0
+	 */
+#define PMP_ENTRY_FW 0
+#define PMP_RESERVED 4
+	if (hart_cluster(current_hartid())) {
+		/* On cluster 1: block entire memory port except for DRAM */
+		pmp_set(1, PMP_R | PMP_W | PMP_X,
+			EIC770X_D1_MEM_BASE, log2roundup(EIC770X_D1_MEM_SIZE));
+		/* Use TOR as MEMPORT_BASE is not aligned with SIZE */
+		pmp_set_tor(3, PMP_L,
+			    EIC770X_MEMPORT_BASE, EIC770X_MEMPORT_SIZE);
+	} else {
+		/* On cluster 0: block entire memory port except for DRAM */
+		_Static_assert(EIC770X_MEMPORT_BASE == EIC770X_D0_MEM_BASE,
+				"Should not assume D0_MEM is at MEMPORT_BASE");
+		/* Use TORs as MEMPORT/D0_MEM_BASE is not aligned with SIZE */
+		pmp_set_tor(2, PMP_R | PMP_W | PMP_X,
+			    EIC770X_MEMPORT_BASE, EIC770X_D0_MEM_SIZE);
+		pmp_set_tor(3, PMP_L,
+			    EIC770X_MEMPORT_BASE + EIC770X_D0_MEM_SIZE,
+			    EIC770X_MEMPORT_SIZE - EIC770X_D0_MEM_SIZE);
+	}
+	/**
+	 * These must come after the setup of PMP, as we are about to
+	 * enable speculation and HW prefetcher bits
+	 */
+	csr_write(EIC770X_CSR_FEAT0, CONFIG_ESWIN_EIC770X_FEAT0_CFG);
+	csr_write(EIC770X_CSR_FEAT1, CONFIG_ESWIN_EIC770X_FEAT1_CFG);
+	csr_write(EIC770X_CSR_L1_HWPF, CONFIG_ESWIN_EIC770X_L1_HWPF_CFG);
+	csr_write(EIC770X_CSR_L2_HWPF, CONFIG_ESWIN_EIC770X_L2_HWPF_CFG);
+
+	return generic_final_init(cold_boot);
+}
+
+static bool eswin_eic770x_pmp_skip(struct sbi_domain_memregion *reg,
+				   void *data)
+{
+	if (SBI_DOMAIN_MEMREGION_IS_FIRMWARE(reg->flags))
+		/* Already handled separately below */
+		return true;
+
+	/**
+	 * If we are still in short of PMP entries, we can skip
+	 * more, such as UART/PLIC for harts in root domain, as
+	 * they are already covered by the defult [0, ~0) memory
+	 * region. Right now we are OK (barely), as we used up
+	 * all PMP entries.
+	 */
+	return false;
+}
+
+static int eswin_eic770x_pmp_configure(unsigned int pmp_count,
+					unsigned int pmp_log2gran,
+					unsigned long pmp_addr_max)
+{
+	struct sbi_domain_memregion temp_memreg;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+
+	/* Use a single memory region to cover opensbi FW */
+	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
+				  (SBI_DOMAIN_MEMREGION_M_READABLE |
+				   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+				   SBI_DOMAIN_MEMREGION_FW),
+				  &temp_memreg);
+	/* This saves 1 PMP entry */
+	pmp_set(PMP_ENTRY_FW, 0, temp_memreg.base, temp_memreg.order);
+
+	return sbi_hart_oldpmp_configure(sbi_scratch_thishart_ptr(),
+					 PMP_RESERVED,
+					 pmp_count,
+					 pmp_log2gran,
+					 pmp_addr_max,
+					 eswin_eic770x_pmp_skip,
+					 NULL);
+}
+
+static int eswin_eic7700_platform_init(const void *fdt, int nodeoff,
+					const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = eswin_eic770x_early_init;
+	generic_platform_ops.final_init = eswin_eic770x_final_init;
+	generic_platform_ops.pmp_configure = eswin_eic770x_pmp_configure;
+
+	return 0;
+}
+
+static const struct fdt_match eswin_eic7700_match[] = {
+	{ .compatible = "eswin,eic7700" },
+	{ },
+};
+
+const struct fdt_driver eswin_eic7700 = {
+	.match_table = eswin_eic7700_match,
+	.init = eswin_eic7700_platform_init,
+};
diff --git a/platform/generic/eswin/objects.mk b/platform/generic/eswin/objects.mk
new file mode 100644
index 00000000..6942a107
--- /dev/null
+++ b/platform/generic/eswin/objects.mk
@@ -0,0 +1,11 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (C) 2025 Bo Gan <ganboing@gmail.com>
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin_eic7700
+platform-objs-$(CONFIG_PLATFORM_ESWIN_EIC770X) += eswin/eic770x.o
+
+FW_PAYLOAD=y
+FW_PAYLOAD_OFFSET=0x200000
diff --git a/platform/generic/include/eswin/eic770x.h b/platform/generic/include/eswin/eic770x.h
new file mode 100644
index 00000000..cec676da
--- /dev/null
+++ b/platform/generic/include/eswin/eic770x.h
@@ -0,0 +1,49 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 Bo Gan <ganboing@gmail.com>
+ *
+ */
+
+#ifndef __EIC770X_H__
+#define __EIC770X_H__
+
+/* CSRs */
+#define EIC770X_CSR_BRPREDICT	0x7c0
+#define EIC770X_CSR_FEAT0	0x7c1
+#define EIC770X_CSR_FEAT1	0x7c2
+#define EIC770X_CSR_L1_HWPF	0x7c3
+#define EIC770X_CSR_L2_HWPF	0x7c4
+
+/* Hart ID to cluster/core conversion */
+#define CPU_CORE_BITS		2
+#define CPU_CORE_MASK		((1 << CPU_CORE_BITS) - 1)
+#define CPU_CLUSTER_SHIFT	CPU_CORE_BITS
+#define CPU_CLUSTER_BITS	1
+#define CPU_CLUSTER_MASK	((1 << CPU_CLUSTER_SHIFT) - 1)
+
+#define hart_core(i)		((i) & CPU_CORE_MASK)
+#define hart_cluster(i)		(((i) >> CPU_CLUSTER_SHIFT) & CPU_CLUSTER_MASK)
+#define current_hart_core()	hart_core(current_hartid())
+#define current_hart_cluster()	hart_cluster(current_hartid())
+
+/* P550 Internal, System Ports and MMIO */
+#define EIC770X_P550_INTERNAL	(0x0 + 0x20000000UL * current_hart_cluster())
+#define EIC770X_TL64D2D_OUT	(EIC770X_P550_INTERNAL + 0x200000)
+#define EIC770X_TL256D2D_OUT	(EIC770X_P550_INTERNAL + 0x202000)
+#define EIC770X_TL256D2D_IN	(EIC770X_P550_INTERNAL + 0x204000)
+
+#define EIC770X_SYSPORT0_BASE	(0x40000000UL + 0x20000000UL * current_hart_cluster())
+#define EIC770X_SYSCRG		(EIC770X_SYSPORT0_BASE + 0x11828000UL)
+#define EIC770X_SYSCRG_RST	(EIC770X_SYSCRG + 0x300UL)
+#define EIC770X_SYSCRG_RST_VAL	0x1AC0FFE6UL
+
+/* Memory Ports */
+#define EIC770X_MEMPORT_BASE	0x0080000000UL // 2G
+#define EIC770X_MEMPORT_SIZE	0x7f80000000UL // +510G
+#define EIC770X_D0_MEM_BASE	0x0080000000UL // 2G
+#define EIC770X_D0_MEM_SIZE	0x0f80000000UL // +62G
+#define EIC770X_D1_MEM_BASE	0x2000000000UL // 128G
+#define EIC770X_D1_MEM_SIZE	0x1000000000UL // +64G
+
+#endif
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
