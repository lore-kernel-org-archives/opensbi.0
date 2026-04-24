Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D54FB44A2
	for <opensbi@archiver.kernel.org>; Fri, 24 Apr 2026 04:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L1PYUOhin7CJWDLjsvJFAizupP5nbkjuliE2+GzWbmE=; b=Z8rpFJPNhG0Za9
	vIgyevALzspuYQwYrkJA5ml9fcIRSSzQDMyuEMrB+IXhdeGYzA7uuU/mQC81p/rRLPefVQDZ9Na63
	Ey5QlYfA8ZaHmnNFNg+7ptliBk/GyhRlo3xUzL76Elz4ESofQzCl5RQqyANSibTnhqfutinvFH9SO
	awJwzaEN4Vx4AQg7zIwAO/gpA6Dl4jjZqfYf9Xj9zISz1BXzTtxqWt17JVKsLlHemTwkUkZd0CKfj
	G1Ry5nW/rgnO1i6C9CBRFgafrWJ7WcJYKh1MaeK9ADDCKeZc/ZmbxVW6ZGD12GHRFEYoweTX+ywNU
	AuDVAWG2/LwtQG2UjI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG7yz-0000000Cd4j-26at;
	Fri, 24 Apr 2026 04:17:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG7yw-0000000Cd4J-466L
	for opensbi@lists.infradead.org;
	Fri, 24 Apr 2026 04:17:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso5169698a91.0
        for <opensbi@lists.infradead.org>; Thu, 23 Apr 2026 21:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777004253; x=1777609053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V3xY9k1WU5UPKc8de7hw1ZmoKbU2NW58RfuCUeqFdZU=;
        b=l785HNbnC3kNp1F0mTgYtTyz6aJN/E5/dlt72IZIDorPRVi3ItrS7ytN6JfX3kPJkm
         VNJfTBmhkctuX4KzJ5jIEKGKQRiukFfsN/4e+fzBvi4QGizlscWseMUQyq/w7JIiam7u
         XlEdaWkxqPR1IQSLZ7lx+Jew6lvn2mvBR5UuZ0BaZvpFmtyqx2vN4IxV3a5iaaF4vxeM
         OaCYH91wFlSF4YQeaHD+KyW/IwMeew9VNb+nFs0n8g+EswADG3IOGADU39dq23TJ1tkG
         X8oTN7ntSeuIkWz9sAYLoJzBqd4mvVipJznGU0WHKUbonnLDndg2wztmVHFMc7pXpw5a
         t2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777004253; x=1777609053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3xY9k1WU5UPKc8de7hw1ZmoKbU2NW58RfuCUeqFdZU=;
        b=DY6jyRaMZjmGp+u5U3+jgPRANDcvwjgqnR6+qxxkmYQ++rrOO5Z/SvOLdJjPvUfRNe
         2hSUlsSxqCzIm1irODBaDM0Dx4IN4Pmd358+BfJP8PPdnjeElJMB07vv5PgXoJrWfBFe
         qQ/pYb7DR3FG3DAixGSlOyS1NDophwTGA9EDAuh+aOdIbc70vFeW+dpRP2R4QPrY8TLT
         pEEWDrqZn9ZzjrAut8s0BdZ2tZrO8QjPZ50MJZm1yqj7CSjwP3MjN7KdQPGeoKJcRcXt
         vEUb6uoX5EGHtgKQmW7Mwhjk9Ou9bD0HRW33GZSXfL8Vk65qVGc+UnWhOUci6JP1Yaoa
         phPg==
X-Gm-Message-State: AOJu0Yyt3AhGol0p1FvJLMqBSwmSYd5GWWuHrPlK3QqFf1sOXoqpa79W
	tfMJZ0FY0rYLMZLGHKmhiyS47Olz043Zc1At2qJIzlwZyuSnQpCvJzosTb9M6A==
X-Gm-Gg: AeBDiesQ+2EwO49nB8R6RUMoUX3Gux5mcw6k5d+C7m9/fdoKLZiQMvl2G5x04EXHncL
	/ljkxT20pEjK5jbp/etvi/eeb3DgWo+3q0+ipE/Tu+wEvvSD1WTuHA82wF/YI6gqqzAJ+StQBDF
	gCeA9VtPdgJI8kWA72RJmNALxmx3ZC9VJuGKfyKxGU2EOHDqrDNbhspwXPqi+jd6DgzG021/nUv
	LMeY48EjN/nEDZzq1cwOD2L02IzHBH1ZCJA1AFwXWPrsdUtc0Ac5sBIhkbmG2zC9jt2bsjCEwcr
	FtQZAj5d3TXo3O7ri8yS93lNioEwh3+uvdYqtrwyztsuASF+LzPTVJJkBpvY6cmnO4T4MvFbiJn
	GRCuBqf0jdz5FdqMej3SEy2DBP5JIYuPBoBlXpFYCBLCzwoEE6IeDUVpUx4nCc3DGQuvB2DB4XW
	r41uUCPLKeQVSllw8yLawOgQc4p7o/EGlPh86SzKAbxRZ/KmLXCHJwHbq1Yl++hqicYsQYFw==
X-Received: by 2002:a17:90b:3f8f:b0:35c:30a8:341 with SMTP id 98e67ed59e1d1-3614046cd3amr31168263a91.13.1777004253247;
        Thu, 23 Apr 2026 21:17:33 -0700 (PDT)
Received: from localhost (193-119-51-209.tpgi.com.au. [193.119.51.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361418c3944sm27416917a91.8.2026.04.23.21.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 21:17:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2] platform: generic: Tenstorrent Atlantis support
Date: Fri, 24 Apr 2026 14:17:25 +1000
Message-ID: <20260424041725.173235-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_211735_045124_CC626C12 
X-CRM114-Status: GOOD (  24.32  )
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

Add the Tenstorrent Atlantis as a generic-platform. This initial support
enables the single_fw_region option, and verifies and prints HART PMA
CSR configuration.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Drop the IOMMU since it depends on core PMP changes. I will work
  on those in parallel.

Note the Atlantis hardware is not yet released, and QEMU models are in
the process of being upstreamed, but at the moment not complete. We
will continue to expand support and improve documentation for QEMU/HW
as we get more pieces in place.

Thanks,
Nick
---
 docs/platform/generic.md                      |   2 +
 docs/platform/tt-atlantis.md                  |  35 +++++
 platform/generic/Kconfig                      |   6 +
 platform/generic/configs/defconfig            |   1 +
 .../generic/include/tenstorrent/ascalon.h     |  12 ++
 platform/generic/include/tenstorrent/pma.h    |  18 +++
 platform/generic/tenstorrent/Kconfig          |   5 +
 platform/generic/tenstorrent/ascalon.c        |  53 +++++++
 platform/generic/tenstorrent/atlantis.c       |  50 +++++++
 platform/generic/tenstorrent/objects.mk       |  10 ++
 platform/generic/tenstorrent/pma.c            | 138 ++++++++++++++++++
 11 files changed, 330 insertions(+)
 create mode 100644 docs/platform/tt-atlantis.md
 create mode 100644 platform/generic/include/tenstorrent/ascalon.h
 create mode 100644 platform/generic/include/tenstorrent/pma.h
 create mode 100644 platform/generic/tenstorrent/Kconfig
 create mode 100644 platform/generic/tenstorrent/ascalon.c
 create mode 100644 platform/generic/tenstorrent/atlantis.c
 create mode 100644 platform/generic/tenstorrent/objects.mk
 create mode 100644 platform/generic/tenstorrent/pma.c

diff --git a/docs/platform/generic.md b/docs/platform/generic.md
index c48d6a9a..0b896ede 100644
--- a/docs/platform/generic.md
+++ b/docs/platform/generic.md
@@ -47,6 +47,7 @@ RISC-V Platforms Using Generic Platform
 * **SiFive HiFive Unleashed** (*[sifive_fu540.md]*)
 * **Spike** (*[spike.md]*)
 * **T-HEAD C9xx series Processors** (*[thead-c9xx.md]*)
+* **Tenstorrent Atlantis Platform** (*[tt-atlantis.md]*)
 * **OpenPiton FPGA SoC** (*[fpga-openpiton.md]*)
 * **Ariane FPGA SoC** (*[fpga-ariane.md]*)
 
@@ -57,5 +58,6 @@ RISC-V Platforms Using Generic Platform
 [sifive_fu540.md]: sifive_fu540.md
 [spike.md]: spike.md
 [thead-c9xx.md]: thead-c9xx.md
+[tt-atlantis.md]: tt-atlantis.md
 [fpga-openpiton.md]: fpga-openpiton.md
 [fpga-ariane.md]: fpga-ariane.md
diff --git a/docs/platform/tt-atlantis.md b/docs/platform/tt-atlantis.md
new file mode 100644
index 00000000..b9bdd238
--- /dev/null
+++ b/docs/platform/tt-atlantis.md
@@ -0,0 +1,35 @@
+Tenstorrent Atlantis Platform
+=============================
+
+The Tenstorrent Atlantis is an SoC and development board from
+Tenstorrent in partnership with CoreLab Technology. It contains 8 RISC-V
+RVA23 compliant Tenstorrent Ascalon cores with RISC-V AIA, RISC-V IOMMU,
+and a range of devices and IO connectivity.
+
+To build the platform-specific library and firmware images, provide the
+*PLATFORM=generic* parameter to the top level `make` command.
+
+Platform Options
+----------------
+
+The *Tenstorrent Atlantis* platform does not have any platform-specific
+options.
+
+Building Tenstorrent Atlantis Platform
+--------------------------------------
+
+The Atlantis Platform is still under development. This section will be
+expanded as firmware and support become available.
+
+QEMU support is currently being developed and initial support has been
+proposed for upstream. To run QEMU that is patched with 'tt-atlantis'
+machine support, run:
+
+```
+qemu-system-riscv64 -M tt-atlantis -nographic \
+	-bios build/platform/generic/firmware/fw_payload.bin \
+    -kernel <linux_build_dir>/Image
+```
+
+Recent (6.18) Linux/riscv 64-bit defconfig kernels should run the QEMU
+tt-atlantis machine.
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 600273d1..d594b140 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -89,6 +89,11 @@ config PLATFORM_STARFIVE_JH7110
 	bool "StarFive JH7110 support"
 	default n
 
+config PLATFORM_TENSTORRENT_ATLANTIS
+	bool "Tenstorrent Atlantis support"
+	select CPU_TENSTORRENT_ASCALON
+	default n
+
 config PLATFORM_THEAD
 	bool "THEAD C9xx support"
 	select THEAD_C9XX_ERRATA
@@ -114,6 +119,7 @@ config PLATFORM_MIPS_P8700_BOSTON
 
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/eswin/Kconfig"
+source "$(OPENSBI_SRC_DIR)/platform/generic/tenstorrent/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
 endif
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 1d3431e7..800f3f14 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -10,6 +10,7 @@ CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
 CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
+CONFIG_PLATFORM_TENSTORRENT_ATLANTIS=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700_EYEQ7H=y
 CONFIG_PLATFORM_MIPS_P8700_BOSTON=y
diff --git a/platform/generic/include/tenstorrent/ascalon.h b/platform/generic/include/tenstorrent/ascalon.h
new file mode 100644
index 00000000..5d7b7635
--- /dev/null
+++ b/platform/generic/include/tenstorrent/ascalon.h
@@ -0,0 +1,12 @@
+/*
+ * SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+ * SPDX-License-Identifier: BSD-2-Clause
+ */
+
+#ifndef __TENSTORRENT_ASCALON_H__
+#define __TENSTORRENT_ASCALON_H__
+
+void tt_ascalon_discover_pmas_from_boot_hart(void);
+void tt_ascalon_verify_pmas_nonboot_hart(void);
+
+#endif
diff --git a/platform/generic/include/tenstorrent/pma.h b/platform/generic/include/tenstorrent/pma.h
new file mode 100644
index 00000000..051764ee
--- /dev/null
+++ b/platform/generic/include/tenstorrent/pma.h
@@ -0,0 +1,18 @@
+/*
+ * SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+ * SPDX-License-Identifier: BSD-2-Clause
+ */
+
+#ifndef __TENSTORRENT_PMA_H__
+#define __TENSTORRENT_PMA_H__
+
+/* Max number of PMAs for devices (CPU, IOMMU) for Tenstorrent platforms. */
+#define TT_MAX_PMAS	32
+
+u64 tt_pma_get(unsigned int n);
+void tt_pma_set(unsigned int n, u64 pma);
+bool tt_pma_validate(unsigned int i, u64 pma);
+void tt_pma_print(unsigned int i, u64 pma);
+
+#endif
+
diff --git a/platform/generic/tenstorrent/Kconfig b/platform/generic/tenstorrent/Kconfig
new file mode 100644
index 00000000..76c7fb32
--- /dev/null
+++ b/platform/generic/tenstorrent/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+# SPDX-License-Identifier: BSD-2-Clause
+
+config CPU_TENSTORRENT_ASCALON
+	bool
diff --git a/platform/generic/tenstorrent/ascalon.c b/platform/generic/tenstorrent/ascalon.c
new file mode 100644
index 00000000..485144cd
--- /dev/null
+++ b/platform/generic/tenstorrent/ascalon.c
@@ -0,0 +1,53 @@
+/*
+ * SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+ * SPDX-License-Identifier: BSD-2-Clause
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_csr_detect.h>
+
+#include <tenstorrent/ascalon.h>
+#include <tenstorrent/pma.h>
+
+#define CSR_PMACFG0	0x7e0
+
+void tt_ascalon_discover_pmas_from_boot_hart(void)
+{
+	struct sbi_trap_info trap = {0};
+
+	/* Whisper virtual platform does not implement PMA */
+	csr_read_allowed(CSR_PMACFG0, &trap);
+	if (trap.cause)
+		return;
+
+	for (unsigned int i = 0; i < TT_MAX_PMAS; i++) {
+		u64 pma = csr_read_num(CSR_PMACFG0 + i);
+		if (!tt_pma_validate(i, pma)) {
+			sbi_printf("HART%d: Bad boot PMA%02d 0x%016lx\n",
+				   current_hartid(), i, pma);
+		}
+		tt_pma_set(i, pma);
+
+		if (pma)
+			tt_pma_print(i, pma);
+	}
+}
+
+void tt_ascalon_verify_pmas_nonboot_hart(void)
+{
+	struct sbi_trap_info trap = {0};
+
+	/* Whisper virtual platform does not implement PMA */
+	csr_read_allowed(CSR_PMACFG0, &trap);
+	if (trap.cause)
+		return;
+
+	for (unsigned int i = 0; i < TT_MAX_PMAS; i++) {
+		u64 pma = csr_read_num(CSR_PMACFG0 + i);
+		if (pma != tt_pma_get(i)) {
+			sbi_printf("HART%d: Bad boot PMA%02d 0x%016lx does not match boot HART\n",
+				   current_hartid(), i, pma);
+		}
+	}
+}
diff --git a/platform/generic/tenstorrent/atlantis.c b/platform/generic/tenstorrent/atlantis.c
new file mode 100644
index 00000000..4c312f7e
--- /dev/null
+++ b/platform/generic/tenstorrent/atlantis.c
@@ -0,0 +1,50 @@
+/*
+ * SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+ * SPDX-License-Identifier: BSD-2-Clause
+ */
+
+#include <platform_override.h>
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_console.h>
+
+#include <tenstorrent/ascalon.h>
+#include <tenstorrent/pma.h>
+
+static int tt_atlantis_final_init(bool cold_boot)
+{
+	if (cold_boot) {
+		/* Boot firmware sets HART PMAs. Read and verify them. */
+		tt_ascalon_discover_pmas_from_boot_hart();
+	} else {
+		/* Verify nonboot HARTs have PMAs matching boot HART */
+		tt_ascalon_verify_pmas_nonboot_hart();
+	}
+
+	return generic_final_init(cold_boot);
+}
+
+static bool tt_atlantis_single_fw_region(void)
+{
+	return true;
+}
+
+static int tt_atlantis_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+{
+	generic_platform_ops.final_init = tt_atlantis_final_init;
+	generic_platform_ops.single_fw_region = tt_atlantis_single_fw_region;
+
+	return 0;
+}
+
+static const struct fdt_match tt_atlantis_match[] = {
+	{ .compatible = "tenstorrent,atlantis" },
+	{ },
+};
+
+const struct fdt_driver tenstorrent_atlantis = {
+	.match_table = tt_atlantis_match,
+	.init = tt_atlantis_platform_init,
+};
diff --git a/platform/generic/tenstorrent/objects.mk b/platform/generic/tenstorrent/objects.mk
new file mode 100644
index 00000000..1e4aeb2d
--- /dev/null
+++ b/platform/generic/tenstorrent/objects.mk
@@ -0,0 +1,10 @@
+#
+# SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+platform-objs-y += tenstorrent/pma.o
+platform-objs-$(CONFIG_CPU_TENSTORRENT_ASCALON) += tenstorrent/ascalon.o
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_TENSTORRENT_ATLANTIS) += tenstorrent_atlantis
+platform-objs-$(CONFIG_PLATFORM_TENSTORRENT_ATLANTIS) += tenstorrent/atlantis.o
diff --git a/platform/generic/tenstorrent/pma.c b/platform/generic/tenstorrent/pma.c
new file mode 100644
index 00000000..daf60192
--- /dev/null
+++ b/platform/generic/tenstorrent/pma.c
@@ -0,0 +1,138 @@
+/*
+ * SPDX-FileCopyrightText: (c) 2025-2026 Tenstorrent USA, Inc.
+ * SPDX-License-Identifier: BSD-2-Clause
+ */
+
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_math.h>
+#include <libfdt.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+#include <tenstorrent/pma.h>
+
+/*
+ * All PMAs in the system should be the same (after boot). The init code
+ * must have set PMAs for all HARTs.
+ */
+
+/*
+ * Ascalon CPU and IOMMU PMA layout:
+ * Field
+ * [2:0]	Permission	[0] Read, [1] Write, [2] Execute
+ * [4:3]	Memory type	00: Main memory, 01: IO memory relaxed,
+ * 				10: IO memory channel 0, 11: IO memory channel 1
+ * [6:5]	AMO type	00: AMONone, 01: AMOSwap,
+ * 				10: AMOLogical, 11: AMOArithmetic
+ * [7]		Cacheability (main memory type)
+ * 				1: Cacheable, 0: Non-cacheable
+ * 		Combining Capability (IO memory type)
+ * 				1: Combining allowed, 0: Combining disallowed
+ * [8]		Routing (coherency)
+ * 				1: Coherent network, 0: Non-coherent network
+ * [11:9]	Reserved
+ * [51:12]	Physical address [51:12] base
+ * [63:58]	Size log 2 (number of address LSB to ignore when matching)
+ * 		0 = invalid entry (no match)
+ */
+
+#define PMA_PERMISSION_R	0x1
+#define PMA_PERMISSION_W	0x2
+#define PMA_PERMISSION_X	0x4
+#define PMA_PERMISSION_MASK	0x7
+
+#define PMA_TYPE_MAIN_MEMORY	0x0
+#define PMA_TYPE_IO_RELAXED	0x8
+#define PMA_TYPE_IO_ORDERED_0	0x10
+#define PMA_TYPE_IO_ORDERED_1	0x18
+#define PMA_TYPE_MASK		0x18
+
+#define PMA_AMO_NONE		0x0
+#define PMA_AMO_SWAP		0x20
+#define PMA_AMO_LOGICAL		0x40
+#define PMA_AMO_ARITHMETIC	0x60
+#define PMA_AMO_MASK		0x60
+
+#define PMA_MEMORY_CACHEABLE	0x80
+#define PMA_IO_COMBINING	0x80
+#define PMA_ROUTING_COHERENT	0x100
+
+#define PMA_FLAGS_MASK		0x00000000000001ffULL
+#define PMA_ADDRESS_MASK	0x000ffffffffff000ULL
+#define PMA_SIZE_MASK		0xfc00000000000000ULL
+#define PMA_RESERVED_MASK	0x0300000000000e00ULL
+
+#define PMA_SIZE_SHIFT		58
+
+static u64 tt_pma_size(u64 pma)
+{
+	if ((pma & PMA_SIZE_MASK) == 0)
+		return 0;
+
+	return 1ULL << ((pma & PMA_SIZE_MASK) >> PMA_SIZE_SHIFT);
+}
+
+static u64 tt_pma_address(u64 pma)
+{
+	return (pma & PMA_ADDRESS_MASK) & ~((tt_pma_size(pma) - 1));
+}
+
+bool tt_pma_validate(unsigned int i, u64 pma)
+{
+	if (!pma)
+		return true;
+
+	if (pma & PMA_RESERVED_MASK) {
+		sbi_printf("PMA%02u 0x%016lx contains reserved bits\n", i, pma);
+		return false;
+	}
+
+	if (tt_pma_size(pma) < 4096) {
+		sbi_printf("PMA%02u 0x%016lx size < 4KB\n", i, pma);
+		return false;
+	}
+
+	if (tt_pma_address(pma) != (pma & PMA_ADDRESS_MASK)) {
+		sbi_printf("PMA%02u 0x%016lx address is not aligned to size\n", i, pma);
+		return false;
+	}
+
+	return true;
+}
+
+void tt_pma_print(unsigned int i, u64 pma)
+{
+	sbi_printf("PMA%02d                       : 0x%016lx-0x%016lx perm:%s%s%s type:%s %s %s amo:%s\n", i,
+			tt_pma_address(pma), tt_pma_address(pma) + tt_pma_size(pma) - 1,
+			pma & PMA_PERMISSION_R ? "R" : " ",
+			pma & PMA_PERMISSION_W ? "W" : " ",
+			pma & PMA_PERMISSION_X ? "X" : " ",
+			(pma & PMA_TYPE_MASK) == PMA_TYPE_MAIN_MEMORY ? "main-memory" :
+			 ((pma & PMA_TYPE_MASK) == PMA_TYPE_IO_RELAXED ? "io-relaxed" :
+			  ((pma & PMA_TYPE_MASK) == PMA_TYPE_IO_ORDERED_0 ? "io-ordered-0" : "io-ordered-1")),
+			(pma & PMA_TYPE_MASK) == PMA_TYPE_MAIN_MEMORY ?
+			 (pma & PMA_MEMORY_CACHEABLE ? "cacheable" : "non-cacheable") :
+			 (pma & PMA_IO_COMBINING ? "combining" : "non-combining"),
+			pma & PMA_ROUTING_COHERENT ? "coherent" : "non-coherent",
+			(pma & PMA_AMO_MASK) == PMA_AMO_NONE ? "none" :
+			 ((pma & PMA_AMO_MASK) == PMA_AMO_SWAP ? "swap" :
+			  ((pma & PMA_AMO_MASK) == PMA_AMO_LOGICAL ? "logical" : "arithmetic")));
+}
+
+static u64 pmas[TT_MAX_PMAS];
+
+void tt_pma_set(unsigned int n, u64 pma)
+{
+	if (n >= TT_MAX_PMAS)
+		sbi_panic("PMA exceeded TT_MAX_PMAS");
+
+	pmas[n] = pma;
+}
+
+u64 tt_pma_get(unsigned int n)
+{
+	if (n >= TT_MAX_PMAS)
+		sbi_panic("PMA exceeded TT_MAX_PMAS");
+
+	return pmas[n];
+}
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
