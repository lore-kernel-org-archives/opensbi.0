Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B16E98FAF
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 04:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OQC6QYWwpUsB4u+gKQASBqxDkdFLXnJbTHNxTT/51qI=; b=DF+m+65wYweZs7
	YBxkwEImd+1qoVp4fyii0Jsry/r9PYFOkuar5V9zqYThbfXngM9sdzvEudHRgcz6RBS8jyJ6JApWY
	XRIisgt7u1HELhzwyDjpUbLWrICv2DhDZRdbYHmhAJHZ14krDl0Se6RNe2H5k55IK59VJ7zSzY8zk
	A4ZoRWa2aogU/Qa0A8ZWgMyijHVN+OMlcLmq8MEbqFmjS/AaZnIusXbJgxdAfb3b3aBP/i+qQnakF
	HnYf70tFA4IFlIXbOms7OrJKBTmLpRqEFwMtOAfYUOZZI/RLZR5ThLtrjNsSpkeFpnXHnMnm+LRYI
	V/O5K7TB/P2itGLjeIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhOV-00000009hLV-1KXU;
	Thu, 09 Apr 2026 04:53:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAhOS-00000009hLA-2Z6U
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 04:53:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NbZ22674162;
	Thu, 9 Apr 2026 04:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J3fHEG1LYODC/4EQX2A4HyPRU6vsYetYUPX
	X8Z9GV6E=; b=l19ruIATLlVAp8Gu7j142goFda7+FIAV7i6WI0e4ereXeX4//bo
	9yjqL9TBzrvK5EoI0FOVs755pxxoG48rLxEGL17Z+aR/6SaL4eL8AN7Q/D27ZrtU
	T549bhbrcgBIgf00xkYdVEWS1gr3Sx1Jx30WuBww0VYKLDmsdhkgTfFVJvb2Q4Mr
	R3VuxwFmkooJfaSuvVSlsNb91SFcJ6tCDlqq70PMRmM8iAbjANZA0NOFgOxiaRmx
	ac0P+K8d67vR2TKXOonh5dDePLXUkwQuEDHNvnXcXvhsRm8Yhl4Q/XlJp9LioPwc
	N5uhVGJ6UeEIXbMSuPgHOUm9qhMXNsWHLUw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmtddn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 04:53:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6394rKex004426;
	Thu, 9 Apr 2026 04:53:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4db4jfvw7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 04:53:20 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6394rKki004421;
	Thu, 9 Apr 2026 04:53:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6394rKj8004420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 04:53:20 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D710D22120; Thu,  9 Apr 2026 10:23:19 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] platform: Remove kendryte/k210 platform
Date: Thu,  9 Apr 2026 10:23:10 +0530
Message-ID: <20260409045310.2045739-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: cWszOYejDENpsS0wL8mTuxgRp8OyoZnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA0MCBTYWx0ZWRfX7x8nwYl+OrVT
 AGcyeDiFT1gC9lalFzWhhqqCkUxgN3DZ4bUxU5yaDPZrL/L2TMDuDJb9JcuPKgtD3LrAgomIVk6
 bD6V6NUbjVZUvT4uTfRuZIFbBclq377yIi44DAlimQSkptQWL4A/MGTFzhq8Lp4jEyqgeBKqmfi
 tEKlVeNhL8kRtMg1BV9g2SkZo2i5a8mNHptMG1lxP3adUC+J0f50rhdqj6Daad81luYVG0H3ZHt
 KNjyfJ3vPt0m1AnDo++eF+iOK/uNsTKjK6ItE+WPCCYW+D2hPFmItnrxokfKiFJDKtekQ11UbAe
 W0heWM/BRb8gbLlYwUtpy3sNwyk3bH+b1BobinRPfqApi0Y15l79KaYUMQvngQ/gQJX/5IVcREF
 v3Ew2C5RSdrM7AnKs/SWjS29IaVrsoJLxxx0Lgjmh+z7w9uau5cqramHl4e5USLIzsVtFS3WjkR
 LyT4GgIJKFcix5h3qNg==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d730c4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=w20KmqIKAAAA:8 a=NEAV23lmAAAA:8 a=SsMK-6ewAAAA:8
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=maXEswlannYWNybPpPcA:9
 a=Qf4GdZp0wr9wS1Hk4A6d:22 a=49hUO6naoDravHwzbBTq:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: cWszOYejDENpsS0wL8mTuxgRp8OyoZnO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_215328_790328_ECF7846A 
X-CRM114-Status: GOOD (  20.49  )
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

The kendryte/k210 platform does not have MMU support in S-mode hence
only NOMMU kernel which runs in M-mode can be used on this platform.

As of now, there is no clear use-case of supporting OpenSBI for
kendryte/k210 platform.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 README.md                                |   1 -
 docs/platform/platform.md                |   3 -
 platform/kendryte/k210/Kconfig           |  10 --
 platform/kendryte/k210/configs/defconfig |   0
 platform/kendryte/k210/k210.dts          |  70 ---------
 platform/kendryte/k210/objects.mk        |  25 ----
 platform/kendryte/k210/platform.c        | 176 -----------------------
 platform/kendryte/k210/platform.h        |  50 -------
 scripts/create-binary-archive.sh         |   1 -
 9 files changed, 336 deletions(-)
 delete mode 100644 platform/kendryte/k210/Kconfig
 delete mode 100644 platform/kendryte/k210/configs/defconfig
 delete mode 100644 platform/kendryte/k210/k210.dts
 delete mode 100644 platform/kendryte/k210/objects.mk
 delete mode 100644 platform/kendryte/k210/platform.c
 delete mode 100644 platform/kendryte/k210/platform.h

diff --git a/README.md b/README.md
index fd40be0b..c19bfdde 100644
--- a/README.md
+++ b/README.md
@@ -402,6 +402,5 @@ make I=<install_directory> install_docs
 [Firmware Documentation]: docs/firmware/fw.md
 [Domain Support]: docs/domain_support.md
 [Doxygen manual]: http://www.doxygen.nl/manual/index.html
-[Kendryte standalone SDK]: https://github.com/kendryte/kendryte-standalone-sdk
 [third party notices]: ThirdPartyNotices.md
 [reproducible builds]: https://reproducible-builds.org
diff --git a/docs/platform/platform.md b/docs/platform/platform.md
index b77112ff..9e78dac2 100644
--- a/docs/platform/platform.md
+++ b/docs/platform/platform.md
@@ -18,9 +18,6 @@ OpenSBI currently supports the following virtual and hardware platforms:
   machine. More details on this platform can be found in the file
   *[sifive_fu540.md]*.
 
-* **Kendryte K210 SoC**: Platform support for the Kendryte K210 SoC used on
-  boards such as the Kendryte KD233 or the Sipeed MAIX Dock.
-
 * **Andes AE350 SoC**: Platform support for the Andes's SoC (AE350). More
   details on this platform can be found in the file *[andes-ae350.md]*.
 
diff --git a/platform/kendryte/k210/Kconfig b/platform/kendryte/k210/Kconfig
deleted file mode 100644
index 5bf59731..00000000
--- a/platform/kendryte/k210/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: BSD-2-Clause
-
-config PLATFORM_KENDRYTE_K210
-	bool
-	select FDT
-	select IPI_MSWI
-	select IRQCHIP_PLIC
-	select SERIAL_SIFIVE
-	select TIMER_MTIMER
-	default y
diff --git a/platform/kendryte/k210/configs/defconfig b/platform/kendryte/k210/configs/defconfig
deleted file mode 100644
index e69de29b..00000000
diff --git a/platform/kendryte/k210/k210.dts b/platform/kendryte/k210/k210.dts
deleted file mode 100644
index bcd075bf..00000000
--- a/platform/kendryte/k210/k210.dts
+++ /dev/null
@@ -1,70 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Damien Le Moal <damien.lemoal@wdc.com>
- */
-
-/dts-v1/;
-/ {
-	#address-cells = <2>;
-	#size-cells = <2>;
-	compatible = "kendryte,k210";
-
-	chosen {
-                bootargs = "console=hvc0 earlycon=sbi";
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		cpu0: cpu@0 {
-			device_type = "cpu";
-			clock-frequency = <390000000>;
-			i-cache-size = <32768>;
-			d-cache-size = <32768>;
-			mmu-type = "none";
-			reg = <0>;
-			riscv,isa = "rv64imafdc";
-			status = "okay";
-			cpu0_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-			};
-		};
-		cpu1: cpu@1 {
-			device_type = "cpu";
-			clock-frequency = <390000000>;
-			d-cache-size = <32768>;
-			i-cache-size = <32768>;
-			mmu-type = "none";
-			reg = <1>;
-			riscv,isa = "rv64imafdc";
-			status = "okay";
-			cpu1_intc: interrupt-controller {
-				#interrupt-cells = <1>;
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-			};
-		};
-	};
-
-	memory@80000000 {
-		/* Bank 0: 4 MB, Bank 1: 2 MB, AI chip SRAM: 2MB */
-		device_type = "memory";
-		reg = <0x00000000 0x80000000 0x00000000 0x00800000>;
-	};
-
-	plic0: interrupt-controller@C000000 {
-		#interrupt-cells = <1>;
-		compatible = "riscv,plic0";
-		interrupt-controller;
-		interrupts-extended =
-			<&cpu0_intc 11 &cpu0_intc 9
-			 &cpu1_intc 11 &cpu1_intc 9>;
-		reg = <0x0 0xc000000 0x0 0x4000000>;
-	};
-};
diff --git a/platform/kendryte/k210/objects.mk b/platform/kendryte/k210/objects.mk
deleted file mode 100644
index efac3d2f..00000000
--- a/platform/kendryte/k210/objects.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-#
-# SPDX-License-Identifier: BSD-2-Clause
-#
-# Copyright (c) 2019 Western Digital Corporation or its affiliates.
-#
-# Authors:
-#   Damien Le Moal <damien.lemoal@wdc.com>
-#
-
-# Compiler flags
-platform-cppflags-y =
-platform-cflags-y =
-platform-asflags-y =
-platform-ldflags-y =
-
-# Objects to build
-platform-objs-y += platform.o
-
-platform-objs-y += k210.o
-platform-varprefix-k210.o = dt_k210
-platform-padding-k210.o = 2048
-
-# Blobs to build
-FW_PAYLOAD=y
-FW_PAYLOAD_ALIGN=0x1000
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
deleted file mode 100644
index 0b76104c..00000000
--- a/platform/kendryte/k210/platform.c
+++ /dev/null
@@ -1,176 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Damien Le Moal <damien.lemoal@wdc.com>
- */
-
-#include <sbi/riscv_asm.h>
-#include <sbi/riscv_encoding.h>
-#include <sbi/sbi_const.h>
-#include <sbi/sbi_platform.h>
-#include <sbi/sbi_system.h>
-#include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/fdt/fdt_fixup.h>
-#include <sbi_utils/ipi/aclint_mswi.h>
-#include <sbi_utils/irqchip/plic.h>
-#include <sbi_utils/serial/sifive-uart.h>
-#include <sbi_utils/timer/aclint_mtimer.h>
-#include "platform.h"
-
-extern const char dt_k210_start[];
-
-unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
-				unsigned long arg2, unsigned long arg3,
-				unsigned long arg4)
-{
-	return (unsigned long)&dt_k210_start[0];
-}
-
-static struct plic_data plic = {
-	.unique_id = 0,
-	.addr = K210_PLIC_BASE_ADDR,
-	.size = K210_PLIC_BASE_SIZE,
-	.num_src = K210_PLIC_NUM_SOURCES,
-	.context_map = {
-		[0] = { 0, 1 },
-		[1] = { 2, 3 },
-	},
-};
-
-static struct aclint_mswi_data mswi = {
-	.addr = K210_ACLINT_MSWI_ADDR,
-	.size = ACLINT_MSWI_SIZE,
-	.first_hartid = 0,
-	.hart_count = K210_HART_COUNT,
-};
-
-static struct aclint_mtimer_data mtimer = {
-	.mtime_freq = K210_ACLINT_MTIMER_FREQ,
-	.mtime_addr = K210_ACLINT_MTIMER_ADDR +
-		      ACLINT_DEFAULT_MTIME_OFFSET,
-	.mtime_size = ACLINT_DEFAULT_MTIME_SIZE,
-	.mtimecmp_addr = K210_ACLINT_MTIMER_ADDR +
-			 ACLINT_DEFAULT_MTIMECMP_OFFSET,
-	.mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE,
-	.first_hartid = 0,
-	.hart_count = K210_HART_COUNT,
-	.has_64bit_mmio = true,
-};
-
-static u32 k210_get_clk_freq(void)
-{
-	u32 clksel0, pll0;
-	u64 pll0_freq, clkr0, clkf0, clkod0, div;
-
-	/*
-	 * If the clock selector is not set, use the base frequency.
-	 * Otherwise, use PLL0 frequency with a frequency divisor.
-	 */
-	clksel0 = k210_read_sysreg(K210_CLKSEL0);
-	if (!(clksel0 & 0x1))
-		return K210_CLK0_FREQ;
-
-	/*
-	 * Get PLL0 frequency:
-	 * freq = base frequency * clkf0 / (clkr0 * clkod0)
-	 */
-	pll0 = k210_read_sysreg(K210_PLL0);
-	clkr0 = 1 + (pll0 & 0x0000000f);
-	clkf0 = 1 + ((pll0 & 0x000003f0) >> 4);
-	clkod0 = 1 + ((pll0 & 0x00003c00) >> 10);
-	pll0_freq = clkf0 * K210_CLK0_FREQ / (clkr0 * clkod0);
-
-	/* Get the frequency divisor from the clock selector */
-	div = 2ULL << ((clksel0 & 0x00000006) >> 1);
-
-	return pll0_freq / div;
-}
-
-static int k210_system_reset_check(u32 type, u32 reason)
-{
-	return 1;
-}
-
-static void k210_system_reset(u32 type, u32 reason)
-{
-	u32 val;
-
-	val = k210_read_sysreg(K210_RESET);
-	val |= K210_RESET_MASK;
-	k210_write_sysreg(val, K210_RESET);
-
-	while (1);
-}
-
-static struct sbi_system_reset_device k210_reset = {
-	.name = "kendryte_k210_reset",
-	.system_reset_check = k210_system_reset_check,
-	.system_reset = k210_system_reset
-};
-
-static int k210_early_init(bool cold_boot)
-{
-	int rc;
-
-	if (!cold_boot)
-		return 0;
-
-	sbi_system_reset_add_device(&k210_reset);
-
-	rc = sifive_uart_init(K210_UART_BASE_ADDR, k210_get_clk_freq(),
-			      K210_UART_BAUDRATE);
-	if (rc)
-		return rc;
-
-	return aclint_mswi_cold_init(&mswi);
-}
-
-static int k210_final_init(bool cold_boot)
-{
-	void *fdt;
-
-	if (!cold_boot)
-		return 0;
-
-	fdt = fdt_get_address_rw();
-
-	fdt_cpu_fixup(fdt);
-	fdt_fixups(fdt);
-
-	return 0;
-}
-
-static int k210_irqchip_init(void)
-{
-	return plic_cold_irqchip_init(&plic);
-}
-
-static int k210_timer_init(void)
-{
-	return aclint_mtimer_cold_init(&mtimer, NULL);
-}
-
-const struct sbi_platform_operations platform_ops = {
-	.early_init	= k210_early_init,
-
-	.final_init	= k210_final_init,
-
-	.irqchip_init = k210_irqchip_init,
-
-	.timer_init	   = k210_timer_init,
-};
-
-const struct sbi_platform platform = {
-	.opensbi_version	= OPENSBI_VERSION,
-	.platform_version   	= SBI_PLATFORM_VERSION(0x0, 0x01),
-	.name			= "Kendryte K210",
-	.features		= 0,
-	.hart_count		= K210_HART_COUNT,
-	.hart_stack_size	= SBI_PLATFORM_DEFAULT_HART_STACK_SIZE,
-	.heap_size		=
-			SBI_PLATFORM_DEFAULT_HEAP_SIZE(K210_HART_COUNT),
-	.platform_ops_addr	= (unsigned long)&platform_ops
-};
diff --git a/platform/kendryte/k210/platform.h b/platform/kendryte/k210/platform.h
deleted file mode 100644
index 9417403d..00000000
--- a/platform/kendryte/k210/platform.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2019 Western Digital Corporation or its affiliates.
- *
- * Authors:
- *   Damien Le Moal <damien.lemoal@wdc.com>
- */
-#ifndef _K210_PLATFORM_H_
-#define _K210_PLATFORM_H_
-
-#include <sbi/riscv_io.h>
-
-#define K210_HART_COUNT		2
-
-#define K210_UART_BAUDRATE	115200
-#define K210_ACLINT_MTIMER_FREQ	7800000
-#define K210_CLK0_FREQ		26000000UL
-#define K210_PLIC_NUM_SOURCES	65
-
-/* Registers base address */
-#define K210_SYSCTL_BASE_ADDR	0x50440000ULL
-#define K210_UART_BASE_ADDR	0x38000000ULL
-#define K210_CLINT_BASE_ADDR	0x02000000ULL
-#define K210_ACLINT_MSWI_ADDR	\
-		(K210_CLINT_BASE_ADDR + CLINT_MSWI_OFFSET)
-#define K210_ACLINT_MTIMER_ADDR \
-		(K210_CLINT_BASE_ADDR + CLINT_MTIMER_OFFSET)
-#define K210_PLIC_BASE_ADDR	0x0C000000ULL
-#define K210_PLIC_BASE_SIZE	(0x200000ULL + (K210_HART_COUNT * 0x1000))
-
-/* Registers */
-#define K210_PLL0		0x08
-#define K210_CLKSEL0		0x20
-#define K210_RESET		0x30
-
-/* Register bit masks */
-#define K210_RESET_MASK		0x01
-
-static inline u32 k210_read_sysreg(u32 reg)
-{
-	return readl((volatile void *)(K210_SYSCTL_BASE_ADDR + reg));
-}
-
-static inline void k210_write_sysreg(u32 val, u32 reg)
-{
-	writel(val, (volatile void *)(K210_SYSCTL_BASE_ADDR + reg));
-}
-
-#endif /* _K210_PLATFORM_H_ */
diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
index 6ea4c9c5..7f211788 100755
--- a/scripts/create-binary-archive.sh
+++ b/scripts/create-binary-archive.sh
@@ -100,7 +100,6 @@ build_opensbi() {
 	64)
 		# Setup 64-bit platform list
 		BUILD_PLATFORM_SUBDIR+=("nuclei/ux600")
-		BUILD_PLATFORM_SUBDIR+=("kendryte/k210")
 		BUILD_PLATFORM_SUBDIR+=("generic")
 		;;
 	*)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
