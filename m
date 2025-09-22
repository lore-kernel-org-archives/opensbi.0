Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66603CAC59A
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QbH9/Z7S19nBwnyvARzE6JYam373wZU7JV5ivGVFFsw=; b=f8n0WsQ7MVU8ZB
	7c2E3ICdoHfvS5EGIfYIR2SvSqBye83YOIBlHVdT69eKcNKaXOR95mWJL3sDii+PWzf2so9Lv87AR
	wy0Wnw0wLLQzgNJID559E1+CGIy9GJn3WIMtad/6fsPGUPHtSoP6H3tlZWHWCtAwXTiYFPCeaTvuy
	3//liXb6uoM3oWHuBjY4ppcyug0HvLjZ5bGHeb+hnLxniNkMswWXnOAioLNgYltHptBEFKpGl7Zk5
	JXVmjoUPboQtrfYxx1syQ0HT6X+GOuifMqMfwQ12MAfeEvOkbooOYAqa4wO4G9DJCM0F8gcDasQl6
	bnlij1YChhDM1o/1uPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VAR-00000008U99-26iO;
	Mon, 22 Sep 2025 01:16:35 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VAK-00000008U5k-2c7h
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 01:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758503762;
	bh=qC73X4fmlVBZ04hCHaLMZgLm4+UXfuUxYQIQAWfq8/A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=EVMNiZiYkEn6asatMdcFvU9j0ziPhZvqJZGQqnm+Ib+Z1c5AjDonUtlEdogt9wZLq
	 Ay5UNJQ2q/S4Zsvob8qemAuJyEDn0hMqgBw23RDDW2iH5ZRmNoSsqHGg1LVnf0HRB6
	 XkCNyQRfm00YbG3CnePG5tCbLtpcOuRRFwl3oFXM=
X-QQ-mid: zesmtpsz2t1758503761tbb8eeee6
X-QQ-Originating-IP: t51B3RxsNXwdWn/dAnqdE0eAs/VQ+tBvanLMa6mozgE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 09:15:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 357119960668881082
EX-QQ-RecipientCnt: 3
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 22 Sep 2025 09:15:57 +0800
Subject: [PATCH v2] platform: generic: spacemit: add K1
MIME-Version: 1.0
Message-Id: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAEyj0GgC/13MwQ6CMAzG8VchPVuyLg7Bk+9hOOAo0iiMbJNgC
 O/uJPHipcm/yfdbIbAXDnDOVvA8SxA3ptCHDGzfjHdGaVODVtqoigjDEPFBWKJ1ngOWVWms6Y4
 qHUijyXMnyw5e69S9hOj8e/dn+n5/VPFPzYSE5nYqWBUt6ba5PGV8LXmYGsuDxNy6Aept2z7dT
 z4itQAAAA==
X-Change-ID: 20250911-smt-k1-8-cores-8985c5f40c5f
To: opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758503759; l=13464;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=dD92FuXhLatcxAABsd1KdN33nvaU5O+4rCMiXfIites=;
 b=+F6lR8kjrskhIyRtYQiFcq6WslvxKX5T11n8Q4RB0nYP7QG7JhTi02FvQTaKAMAObkbq95z7N
 WtqTe6vhb1MA9RiJyuCui8kKt24M8TuEkHGx8r1vl/hXcRaqTwS69Sr
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NP3iUBCWMtGbpJhXjg950DjuopOI0SsxV0vRMohiGFQyWhYG1uvs/A0u
	X3h504d4uJBDgd3gQELrLh5BmdR/F0f7Yc9mlUKwxcxJo9As7mx3xe5svcZQ4pHB2TDt9XG
	AbYG0m+Z/QY5rypslWsfCfsayJ+DhmTsy9v0L7QKrFt0VUtaQTAr6X3cVVBryOQEI3c9StN
	ychliH5PLzgyusBn0xPoO1c1LYlXr3TiIEAThLbO944haxooiEQWtdXGOprGAGt2i7n7qya
	KrSfDHTCo2ByfhGvjkyMB9Pe4LTV7VwJpSIJ1uGWvvIVe62u00JvGaJuN3dJEnP00xVyVky
	gSAraMWIGmPNxmFv8Veq5LTclHait4QeQqCC3LN56jF0ikelcYp3cacu+d/DC7aFfEorYPK
	S4xEMSJNulvr0updTwJkTY+9svxEfVuM4e0krTGIogwNCFJphTNEI7MxDZGiax/14nQUpZN
	ecoj2HFrO386sevNsdFGTwKTdXVkPewsknmngILwPoUuRqQT9ad5McS0E5cs7wT7CQeVlV/
	npEU4lk4uQYZAOd7fGygRP7TM4Y3olJwv3/7wuAorMRLAiUwDct5F+IMUcRZu2qeaLp+im1
	t0Bf4MCScXxCai3Un98IKix0prZFM3p6cqyB+V6fUDKi6g9IvAELsf+EkTMfM8iEAyFED3P
	IVIpPXqXVPgDZMTDiWdIQqV7xDcWWxlKx4+4kNXWFqIOp+wHlaKMPJLcRqyLy9oU9WpIu7i
	8dVF4Vw48z2x5MDckx95tjhQQC85xiLhIU8V/WSpxViDPciRS3sMKT8YC49WeH+X/1uRxtu
	SnL/U6/Y/aJAM39jSMKcbQf9VHvdAppwPnsk/7RwtuEe/rpXghca5JyvRCWZc30NU6kO9af
	AX8AmCZNiQsGfk7jAPcEMzzCr5KgrNmPPKlF+mutWQpEQDC40aMAZt4F/j//Qberz0r1xXX
	0wAS0KS0eupJEOTGOJgprBNa5td/f6mOemUct3RZmO1F6bsEo83pHEPF0/C3XbOEpBmFbjY
	jxzMuDXqe+eFDce5clvy7FGOrU80Cz6sKXuHS4SV+Gqn4GBxv1AffibWMP83ftOBa2CnGIr
	nxhk7/P0nadaL7WmTpJ7RyNWas11kIBaA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_181630_037982_3B98561D 
X-CRM114-Status: GOOD (  25.23  )
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

From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>

Extend generic platform to support SpacemiT K1.

On K1, the BROM only brings up the primary core and leaves the
other cores in a disabled state. This prevents Linux from booting
SMP and only one core is available.

Add code to bring up all 8 cores during OpenSBI initialization so
that the Linux kernel can detect and use all cores properly.

Co-authored-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
---
Changes in v2:
- remove __sbi_hsm_hart_get_state() in spacemit_cold_boot_allowed()
- plus PMU_AP_BASE in PMU_AP_CORE(0|4)_(WAKEUP|IDLE)_OFFSET
- Link to v1: https://lore.kernel.org/r/20250916-smt-k1-8-cores-v1-1-5b76e06d12da@linux.spacemit.com
---
 platform/generic/Kconfig             |   4 +
 platform/generic/configs/defconfig   |   5 +-
 platform/generic/spacemit/k1.c       | 329 +++++++++++++++++++++++++++++++++++
 platform/generic/spacemit/objects.mk |   7 +
 4 files changed, 343 insertions(+), 2 deletions(-)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 7559a4bd8ccfcf7e0e7366141f632f5f5e13bd98..d0835126287ef080a44e30140b49c022695efd17 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -76,6 +76,10 @@ config PLATFORM_MIPS_P8700
 	bool "MIPS P8700 support"
 	default n
 
+config PLATFORM_SPACEMIT_K1
+	bool "Spacemit K1 support"
+	default n
+
 source "$(OPENSBI_SRC_DIR)/platform/generic/andes/Kconfig"
 source "$(OPENSBI_SRC_DIR)/platform/generic/thead/Kconfig"
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 4b93d0bc55233f83a907ff81234c78540e33d828..86e7bb9e3d859dcf72e7775fae0844ff066be0f8 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,5 +1,6 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
 CONFIG_PLATFORM_ANDES_AE350=y
+CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
@@ -7,7 +8,7 @@ CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
-CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
+CONFIG_PLATFORM_SPACEMIT_K1=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
@@ -36,8 +37,8 @@ CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
 CONFIG_FDT_RESET_RPMI=y
-CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SG2042_HWMON_MCU=y
+CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SYSCON=y
 CONFIG_FDT_SERIAL=y
 CONFIG_FDT_SERIAL_CADENCE=y
diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
new file mode 100644
index 0000000000000000000000000000000000000000..1a0576c94ca98b13a970a56459cf6ac3b75e879c
--- /dev/null
+++ b/platform/generic/spacemit/k1.c
@@ -0,0 +1,329 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_hsm.h>
+
+#define CSR_MSETUP				0x7c0
+#define CSR_MHCR				0x7c1
+#define CSR_MRAOP				0x7c2
+#define CSR_MHINT				0x7c5
+#define CSR_ML2SETUP				0x7f0
+
+/* decache enable */
+#define MSETUP_DE				BIT(0)
+/* icache enable */
+#define MSETUP_IE				BIT(1)
+/* branch prediction enable */
+#define MSETUP_BPE				BIT(4)
+/* prefetch functionality enable */
+#define MSETUP_PFE				BIT(5)
+/* misaligned memory access enable */
+#define MSETUP_MME				BIT(6)
+/* ECC enable */
+#define MSETUP_ECCE				BIT(16)
+
+/* icache invalidation */
+#define MRAOP_ICACHE_INVALID			GENMASK(1, 0)
+
+#define PMU_AP_BASE				0xd4282800
+
+#define PMU_AP_CORE0_WAKEUP_OFFSET		(PMU_AP_BASE + 0x12c)
+#define PMU_AP_CORE4_WAKEUP_OFFSET		(PMU_AP_BASE + 0x324)
+#define PMU_AP_CLUSTER0_WAKEUP_OFFSET(index)	(PMU_AP_CORE0_WAKEUP_OFFSET + index * 4)
+#define PMU_AP_CLUSTER1_WAKEUP_OFFSET(index)	(PMU_AP_CORE4_WAKEUP_OFFSET + index * 4)
+
+#define PMU_AP_CORE0_IDLE_CFG_OFFSET		(PMU_AP_BASE + 0x124)
+#define PMU_AP_CORE4_IDLE_CFG_OFFSET		(PMU_AP_BASE + 0x304)
+#define PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(index)	(PMU_AP_CORE0_IDLE_CFG_OFFSET + index * 4)
+#define PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(index)	(PMU_AP_CORE4_IDLE_CFG_OFFSET + index * 4)
+
+#define PMU_AP_CORE0_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(0)
+#define PMU_AP_CORE1_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(1)
+#define PMU_AP_CORE2_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(2)
+#define PMU_AP_CORE3_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(3)
+#define PMU_AP_CORE4_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(0)
+#define PMU_AP_CORE5_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(1)
+#define PMU_AP_CORE6_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(2)
+#define PMU_AP_CORE7_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(3)
+
+#define PMU_AP_CORE0_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(0)
+#define PMU_AP_CORE1_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(1)
+#define PMU_AP_CORE2_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(2)
+#define PMU_AP_CORE3_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(3)
+#define PMU_AP_CORE4_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(0)
+#define PMU_AP_CORE5_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(1)
+#define PMU_AP_CORE6_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(2)
+#define PMU_AP_CORE7_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(3)
+
+/* power down */
+#define PMU_AP_IDLE_PWRDWN			BIT(0)
+/* sram power down */
+#define PMU_AP_IDLE_SRAM_PWRDWN			BIT(1)
+/* enable wake up the memory controller */
+#define PMU_AP_IDLE_WAKE_MCE			BIT(3)
+/* disable memory controller software req */
+#define PMU_AP_IDLE_MC_SW_REQ			BIT(4)
+
+#define PMU_AP_IDLE_PWRDOWN_MASK		(PMU_AP_IDLE_PWRDWN | PMU_AP_IDLE_SRAM_PWRDWN | \
+						 PMU_AP_IDLE_WAKE_MCE | PMU_AP_IDLE_MC_SW_REQ)
+/* cci */
+#define C0_RVBADDR_LO_ADDR			0xd4282db0
+#define C0_RVBADDR_HI_ADDR			0xd4282db4
+#define C1_RVBADDR_LO_ADDR			0xd4282eb0
+#define C1_RVBADDR_HI_ADDR			0xd4282c04
+
+#define CCI_550_PLATFORM_CCI_ADDR		0xd8500000
+
+/* relative to cci base */
+#define CCI_550_STATUS				0x000c
+/* status register bits */
+#define CCI_550_STATUS_CHANGE_PENDING		BIT(0)
+
+/* slave interface registers */
+#define CCI_550_SLAVE_IFACE0_OFFSET		0x1000
+#define CCI_550_SLAVE_IFACE_OFFSET(idx)		(CCI_550_SLAVE_IFACE0_OFFSET + ((0x1000) * (idx)))
+
+/* relative to slave interface base */
+#define CCI_550_SNOOP_CTRL			0x0000
+/* snoop control register bits */
+#define CCI_550_SNOOP_CTRL_ENABLE_SNOOPS	BIT(0)
+#define CCI_550_SNOOP_CTRL_ENABLE_DVMS		BIT(1)
+
+/* clusters and CPU mapping */
+#define PLATFORM_MAX_CPUS_PER_CLUSTER		4
+#define CPU_TO_CLUSTER(cpu)			((cpu) / PLATFORM_MAX_CPUS_PER_CLUSTER)
+
+#define PLAT_CCI_CLUSTER0_IFACE_IX		0
+#define PLAT_CCI_CLUSTER1_IFACE_IX		1
+
+static const u64 cpu_wakeup_reg[] = {
+	PMU_AP_CORE0_WAKEUP,
+	PMU_AP_CORE1_WAKEUP,
+	PMU_AP_CORE2_WAKEUP,
+	PMU_AP_CORE3_WAKEUP,
+	PMU_AP_CORE4_WAKEUP,
+	PMU_AP_CORE5_WAKEUP,
+	PMU_AP_CORE6_WAKEUP,
+	PMU_AP_CORE7_WAKEUP,
+};
+
+static const u64 cpu_idle_reg[] = {
+	PMU_AP_CORE0_IDLE_CFG,
+	PMU_AP_CORE1_IDLE_CFG,
+	PMU_AP_CORE2_IDLE_CFG,
+	PMU_AP_CORE3_IDLE_CFG,
+	PMU_AP_CORE4_IDLE_CFG,
+	PMU_AP_CORE5_IDLE_CFG,
+	PMU_AP_CORE6_IDLE_CFG,
+	PMU_AP_CORE7_IDLE_CFG,
+};
+
+/* only use 0-1 cluster in SpacemiT K1 */
+static const int cci_map[] = {
+	PLAT_CCI_CLUSTER0_IFACE_IX,
+	PLAT_CCI_CLUSTER1_IFACE_IX,
+};
+
+extern struct sbi_platform platform;
+
+static void cci_enable_snoop_dvm_reqs(unsigned int master_id)
+{
+	int slave_if_id = cci_map[master_id];
+
+	/*
+	 * Enable Snoops and DVM messages, no need for Read/Modify/Write as
+	 * rest of bits are write ignore
+	 */
+	writel(CCI_550_SNOOP_CTRL_ENABLE_DVMS | CCI_550_SNOOP_CTRL_ENABLE_SNOOPS,
+	       (void *)(u64)CCI_550_PLATFORM_CCI_ADDR +
+	       CCI_550_SLAVE_IFACE_OFFSET(slave_if_id) + CCI_550_SNOOP_CTRL);
+
+	/*
+	 * Wait for the completion of the write to the Snoop Control Register
+	 * before testing the change_pending bit
+	 */
+	mb();
+
+	/* Wait for the dust to settle down */
+	while (!(readl((void *)(u64)CCI_550_PLATFORM_CCI_ADDR + CCI_550_STATUS) &
+	       CCI_550_STATUS_CHANGE_PENDING))
+		;
+}
+
+static inline void spacemit_set_cpu_power(u32 hartid, bool enable)
+{
+	unsigned int value;
+	unsigned int *cpu_idle_base = (unsigned int *)cpu_idle_reg[hartid];
+
+	value = readl(cpu_idle_base);
+
+	if (enable)
+		value &= ~PMU_AP_IDLE_PWRDOWN_MASK;
+	else
+		value |= PMU_AP_IDLE_PWRDOWN_MASK;
+
+	writel(value, cpu_idle_base);
+}
+
+static void spacemit_wakeup_cpu(u32 mpidr)
+{
+	unsigned int *cpu_reset_base;
+	unsigned int cur_hartid = current_hartid();
+
+	cpu_reset_base = (unsigned int *)cpu_wakeup_reg[cur_hartid];
+
+	writel(1 << mpidr, cpu_reset_base);
+}
+
+static void spacemit_assert_cpu(void)
+{
+	spacemit_set_cpu_power(current_hartid(), false);
+}
+
+static void spacemit_deassert_cpu(void)
+{
+	spacemit_set_cpu_power(current_hartid(), true);
+}
+
+static void spacemit_k1_pre_init(void)
+{
+	unsigned int hartid, clusterid, cluster_enabled = 0;
+	unsigned int cur_hartid = current_hartid();
+	struct sbi_scratch *scratch;
+	int i;
+
+	scratch = sbi_hartid_to_scratch(cur_hartid);
+
+	writel(scratch->warmboot_addr, (unsigned int *)C0_RVBADDR_LO_ADDR);
+	writel(scratch->warmboot_addr >> 32, (unsigned int *)C0_RVBADDR_HI_ADDR);
+
+	writel(scratch->warmboot_addr, (unsigned int *)C1_RVBADDR_LO_ADDR);
+	writel(scratch->warmboot_addr >> 32, (unsigned int *)C1_RVBADDR_HI_ADDR);
+
+	for (i = 0; i < platform.hart_count; i++) {
+		hartid = platform.hart_index2id[i];
+		clusterid = CPU_TO_CLUSTER(hartid);
+
+		if (!(cluster_enabled & (1 << clusterid))) {
+			cluster_enabled |= 1 << clusterid;
+			cci_enable_snoop_dvm_reqs(clusterid);
+		}
+	}
+}
+
+/* Start (or power-up) the given hart */
+static int spacemit_hart_start(unsigned int hartid, unsigned long saddr)
+{
+	spacemit_wakeup_cpu(hartid);
+
+	return 0;
+}
+
+/*
+ * Stop (or power-down) the current hart from running. This call
+ * doesn't expect to return if success.
+ */
+static int spacemit_hart_stop(void)
+{
+	csr_write(CSR_STIMECMP, GENMASK_ULL(63, 0));
+	csr_clear(CSR_MIE, MIP_SSIP | MIP_MSIP | MIP_STIP | MIP_MTIP | MIP_SEIP | MIP_MEIP);
+
+	/* disable data preftch */
+	csr_clear(CSR_MSETUP, MSETUP_PFE);
+	asm volatile ("fence iorw, iorw");
+
+	/* flush local dcache */
+	csr_write(CSR_MRAOP, MRAOP_ICACHE_INVALID);
+	asm volatile ("fence iorw, iorw");
+
+	/* disable dcache */
+	csr_clear(CSR_MSETUP, MSETUP_DE);
+	asm volatile ("fence iorw, iorw");
+
+	/*
+	 * Core4-7 do not have dedicated bits in ML2SETUP;
+	 * instead, they reuse the same bits as core0-3.
+	 *
+	 * Therefore, use modulo with PLATFORM_MAX_CPUS_PER_CLUSTER
+	 * to select the proper bit.
+	 */
+	csr_clear(CSR_ML2SETUP, 1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
+	asm volatile ("fence iorw, iorw");
+
+	spacemit_assert_cpu();
+
+	wfi();
+
+	return SBI_ENOTSUPP;
+}
+
+static const struct sbi_hsm_device spacemit_hsm_ops = {
+	.name		= "spacemit-hsm",
+	.hart_start	= spacemit_hart_start,
+	.hart_stop	= spacemit_hart_stop,
+};
+
+/*
+ * Platform early initialization.
+ */
+static int spacemit_k1_early_init(bool cold_boot)
+{
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc)
+		return rc;
+
+	csr_set(CSR_MSETUP, MSETUP_DE | MSETUP_IE | MSETUP_BPE |
+		MSETUP_PFE | MSETUP_MME | MSETUP_ECCE);
+
+	if (cold_boot)
+		spacemit_k1_pre_init();
+	else
+		spacemit_deassert_cpu();
+
+	return 0;
+}
+
+static int spacemit_k1_final_init(bool cold_boot)
+{
+	if (cold_boot)
+		sbi_hsm_set_device(&spacemit_hsm_ops);
+
+	return generic_final_init(cold_boot);
+}
+
+static bool spacemit_cold_boot_allowed(u32 hartid)
+{
+	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
+
+	return !hartid;
+}
+
+static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
+				     const struct fdt_match *match)
+{
+	generic_platform_ops.early_init = spacemit_k1_early_init;
+	generic_platform_ops.final_init = spacemit_k1_final_init;
+	generic_platform_ops.cold_boot_allowed = spacemit_cold_boot_allowed;
+
+	return 0;
+}
+
+static const struct fdt_match spacemit_k1_match[] = {
+	{ .compatible = "spacemit,k1" },
+	{ /* sentinel */ }
+};
+
+const struct fdt_driver spacemit_k1 = {
+	.match_table = spacemit_k1_match,
+	.init = spacemit_k1_platform_init,
+};
diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/spacemit/objects.mk
new file mode 100644
index 0000000000000000000000000000000000000000..4bf973aab1ba749b59cfdc14a572226d54c3ff15
--- /dev/null
+++ b/platform/generic/spacemit/objects.mk
@@ -0,0 +1,7 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+# Copyright (c) 2025 SpacemiT
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit_k1
+platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit/k1.o

---
base-commit: 153cdeea5350837c1206a2d2b6189fd0ba06d1f2
change-id: 20250911-smt-k1-8-cores-8985c5f40c5f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
