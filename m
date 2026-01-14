Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F371ED31A35
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzl1CDnzFQPf9RlYuK4TwpDVLYe/IltSn5HK0+mxCTo=; b=05DYiO5870xONo
	CLXqM0AEEjrTU196LwWpgVEYHayvFdkfnrKHFYgvgDNh2vccf4WqhZvNmg0JUmptKPOi7dGlrzZpw
	0XcdKRNpW6qsEeEg5THE8eA1WGwtwE8qNllh4u7/XhYqJDB76cUo5XPa/11l/lIFPqZr0pBd6FsYK
	59VPrccGn3i02LZXMCtrvUtWpdX/POLFWXAP6MNIKxRxAPZmQZejWlIzIkzGlX/6ae5ofhssEHnmA
	1mR+Ckri15VZmxN4alZN7IjXuFmTOudO/Pyh6Yw8Q/uJfN8SFNLeV1Tb9UPFZ4L12B/u2QCxyDIJA
	y4kqWaT7iTQGHJ51jmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBI-00000008YPY-0q82;
	Wed, 14 Jan 2026 09:28:48 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxBF-00000008YMh-0Yr4
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768382925; x=1799918925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KdC1czV+kxKLrU5NF0qUvfhaZkXPQY3UuyTd8T1xOIc=;
  b=jTitjTxA58u56UNVLCvuB8KEqqU7MiLA/lkJPHBZNqU+8BBMO2pzvGPy
   k+xkyPumReRy6JJF9ykSLVJiBzsc0WaKhMIR6PvQGGqggYkmm89jLt9JU
   zXQLMqGQDfzc6C8oTiZi6v1TSyLuarSZUqoxlf8ct73hB2hojqZYhb59o
   3XbSyUMVvaEijcoOtNngGNt5U+C0e16QpQIZ7IkCAdfDUjPrgmbF+QCO1
   XKHltKDR96axCrZXS3vDnqeBk6NfGLXeEefy6ha/gBpq7u1ZJ9EGzkKPD
   kO4SqxG63/OvNN20lkLXNnJsLTMsv8iwHy5eDczOSRb4od5cDHgayMCiN
   Q==;
X-CSE-ConnectionGUID: IKWDQWRxSOa9djxPvOgmbg==
X-CSE-MsgGUID: UH4umkj6Rs2GypxKzanaDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:21:30 +0200
X-CSE-ConnectionGUID: EWo1+aVSQzmRuKrg5qG5dw==
X-CSE-MsgGUID: CjJ2/SFcRi66HqaRHI5QCw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces01_data.me-corp.lan with SMTP; 14 Jan 2026 11:23:17 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 14 Jan 2026 11:21:29 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: cfu@mips.com,
	opensbi@lists.infradead.org,
	benoit.monin@bootlin.com,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 08/22] platform: generic: mips p8700: use global CM addresses
Date: Wed, 14 Jan 2026 11:21:04 +0200
Message-ID: <20260114092118.1315581-9-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012845_463037_66B32126 
X-CRM114-Status: GOOD (  22.61  )
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

In the multi-cluster system each cluster has its own CM (Coherency Manager).
Every CM has its "global" memory address where it is accessible from
any bus master.
Initially, all CMs accessible from the local cluster using same "local"
address. Transactions by local address are not routed through system bus
and thus are faster.

Remap CM in every cluster to the local address matching its global address.
Then, every CM is always accessed using same address, but when transaction
initiated from the local cluster it is routed internally.

This removes need for 2 PMP regions covering local address access.
CM accessor functions simplified because there's no need to detect whether
transaction is local or global

Access timer always in cluster 0

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/mips-cm.h | 46 ++++++++-----------
 platform/generic/include/mips/p8700.h   |  4 +-
 platform/generic/mips/p8700.c           | 59 ++++++++++---------------
 3 files changed, 45 insertions(+), 64 deletions(-)

diff --git a/platform/generic/include/mips/mips-cm.h b/platform/generic/include/mips/mips-cm.h
index 6985e42b217f..624298f373ac 100644
--- a/platform/generic/include/mips/mips-cm.h
+++ b/platform/generic/include/mips/mips-cm.h
@@ -14,22 +14,16 @@
 /* Define 1 to print out CM read and write info */
 #define DEBUG_CM 0
 
-#if CLUSTERS_IN_PLATFORM > 1
-static long GLOBAL_CM_BASE[CLUSTERS_IN_PLATFORM] = {GLOBAL_CM_BASE0, GLOBAL_CM_BASE1, GLOBAL_CM_BASE2};
-#else
-static long GLOBAL_CM_BASE[CLUSTERS_IN_PLATFORM] = {CM_BASE};
-#endif
+extern long GLOBAL_CM_BASE[];
+
 
-#define CPS_ACCESSOR_R(unit, sz, base, off, name)			\
-static inline u##sz read_##unit##_##name(u32 hartid, bool local_p)	\
+#define CPS_ACCESSOR_R(unit, sz, off, name)				\
+static inline u##sz read_##unit##_##name(u32 hartid)			\
 {									\
 	u##sz value;							\
-	long cmd_reg;							\
-	int cl, co;							\
-	cl = cpu_cluster(hartid);					\
-	co = cpu_core(hartid);						\
-	cmd_reg = (local_p ? (base) : ((base) - CM_BASE + GLOBAL_CM_BASE[cl]))	\
-		  + (co << CM_BASE_CORE_SHIFT)				\
+	int cl = cpu_cluster(hartid);					\
+	int co = cpu_core(hartid);					\
+	long cmd_reg = GLOBAL_CM_BASE[cl] + (co << CM_BASE_CORE_SHIFT)	\
 		  + off;						\
 	if (DEBUG_CM)							\
 		sbi_printf("CM_READ%d(0x%lx) ...\n", sz, cmd_reg);	\
@@ -43,15 +37,12 @@ static inline u##sz read_##unit##_##name(u32 hartid, bool local_p)	\
 	return value;							\
 }
 
-#define CPS_ACCESSOR_W(unit, sz, base, off, name)			\
-static inline void write_##unit##_##name(u32 hartid, u##sz value, bool local_p)	\
+#define CPS_ACCESSOR_W(unit, sz, off, name)				\
+static inline void write_##unit##_##name(u32 hartid, u##sz value)	\
 {									\
-	long cmd_reg;							\
-	int cl, co;							\
-	cl = cpu_cluster(hartid);					\
-	co = cpu_core(hartid);						\
-	cmd_reg = (local_p ? (base) : ((base) - CM_BASE +  GLOBAL_CM_BASE[cl]))	\
-		  + (co << CM_BASE_CORE_SHIFT)				\
+	int cl = cpu_cluster(hartid);					\
+	int co = cpu_core(hartid);					\
+	long cmd_reg = GLOBAL_CM_BASE[cl] + (co << CM_BASE_CORE_SHIFT)	\
 		  + off;						\
 	if (DEBUG_CM)							\
 		sbi_printf("CM_WRITE%d(0x%lx, 0x%lx)\n", sz, 	\
@@ -63,18 +54,19 @@ static inline void write_##unit##_##name(u32 hartid, u##sz value, bool local_p)
 	asm volatile("fence");						\
 }
 
-#define CPS_ACCESSOR_RW(unit, sz, base, off, name)			\
-	CPS_ACCESSOR_R(unit, sz, base, off, name)			\
-	CPS_ACCESSOR_W(unit, sz, base, off, name)
+#define CPS_ACCESSOR_RW(unit, sz, off, name)			\
+	CPS_ACCESSOR_R(unit, sz, off, name)			\
+	CPS_ACCESSOR_W(unit, sz, off, name)
 
 #define CPC_CX_ACCESSOR_RW(sz, off, name)				\
-	CPS_ACCESSOR_RW(cpc, sz, CPC_BASE, CPC_OFF_LOCAL + (off), co_##name)
+	CPS_ACCESSOR_RW(cpc, sz, CPC_OFFSET + CPC_OFF_LOCAL + (off), co_##name)
 
 #define GCR_CX_ACCESSOR_RW(sz, off, name)				\
-	CPS_ACCESSOR_RW(gcr, sz, CM_BASE, GCR_OFF_LOCAL + (off), co_##name)
+	CPS_ACCESSOR_RW(gcr, sz, GCR_OFF_LOCAL + (off), co_##name)
 
 GCR_CX_ACCESSOR_RW(64, cpu_hart(hartid) << CM_BASE_HART_SHIFT, reset_base)
 GCR_CX_ACCESSOR_RW(32, GCR_CORE_COH_EN, coherence)
+GCR_CX_ACCESSOR_RW(64, GCR_BASE_OFFSET, base)
 
 CPC_CX_ACCESSOR_RW(32, CPC_Cx_VP_RUN, vp_run)
 CPC_CX_ACCESSOR_RW(32, CPC_Cx_VP_STOP, vp_stop)
@@ -82,7 +74,7 @@ CPC_CX_ACCESSOR_RW(32, CPC_Cx_CMD, cmd)
 CPC_CX_ACCESSOR_RW(32, CPC_Cx_STAT_CONF, stat_conf)
 
 #define CPC_ACCESSOR_RW(sz, off, name)					\
-	CPS_ACCESSOR_RW(cpc, sz, CPC_BASE, off, name)
+	CPS_ACCESSOR_RW(cpc, sz, CPC_OFFSET + (off), name)
 
 CPC_ACCESSOR_RW(32, CPC_PWRUP_CTL, pwrup_ctl)
 CPC_ACCESSOR_RW(32, CPC_CM_STAT_CONF, cm_stat_conf)
diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index b02aaed4b816..6644e91dd42d 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -71,10 +71,10 @@
 #define cpu_core(i)		(((i) >> NEW_CORE_SHIFT) & NEW_CORE_MASK)
 #define cpu_hart(i)		((i) & NEW_HART_MASK)
 
-#define CPC_BASE		(CM_BASE + 0x8000)
+#define CPC_OFFSET		(0x8000)
 
 #define SIZE_FOR_CPC_MTIME	0x10000	/* The size must be 2^order */
-#define AIA_BASE		(CM_BASE + 0x40000)
+#define AIA_OFFSET		(0x40000)
 #define SIZE_FOR_AIA_M_MODE	0x20000	/* The size must be 2^order */
 #define P8700_ALIGN		0x10000
 
diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 329a84b4ddec..94cba1631666 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -13,7 +13,7 @@
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_hart_pmp.h>
-#include <sbi/riscv_barrier.h>
+#include <sbi/riscv_io.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <mips/p8700.h>
 #include <mips/mips-cm.h>
@@ -22,6 +22,9 @@ extern void mips_warm_boot(void);
 #define MMIO_BASE 0x00000000
 #define MMIO_SIZE 0x80000000
 
+/* FIXME! Please change GLOBAL_CM_BASE for your platform */
+long GLOBAL_CM_BASE[CLUSTERS_IN_PLATFORM] = {CM_BASE};
+
 static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 			       unsigned long prot, unsigned long addr,
 			       unsigned long log2len)
@@ -45,14 +48,16 @@ static void mips_p8700_pmp_set(unsigned int n, unsigned long flags,
 static void power_up_other_cluster(u32 hartid)
 {
 	unsigned int cl = cpu_cluster(hartid);
-	bool local_p = (cpu_cluster(current_hartid()) == cl);
 
+	/* remap local cluster address to its global address */
+	writeq(GLOBAL_CM_BASE[cl], (void*)GLOBAL_CM_BASE[cl] + GCR_BASE_OFFSET);
+	wmb();
 	/* Power up CM in cluster */
-	write_cpc_pwrup_ctl(hartid, 1, local_p);
+	write_cpc_pwrup_ctl(hartid, 1);
 
 	/* Wait for the CM to start up */
 	for (int i = 100; i > 0; i--) {
-		u32 stat = read_cpc_cm_stat_conf(hartid, local_p);
+		u32 stat = read_cpc_cm_stat_conf(hartid);
 
 		stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
 		if (stat == CPC_Cx_STAT_CONF_SEQ_STATE_U5)
@@ -65,14 +70,13 @@ static void power_up_other_cluster(u32 hartid)
 
 struct mips_boot_params {
 	u32 hartid;
-	bool local_p;
 	u32 target_state;
 };
 
 static bool mips_hart_reached_state(void *arg)
 {
 	struct mips_boot_params *p = arg;
-	u32 stat = read_cpc_co_stat_conf(p->hartid, p->local_p);
+	u32 stat = read_cpc_co_stat_conf(p->hartid);
 
 	stat = EXT(stat, CPC_Cx_STAT_CONF_SEQ_STATE);
 	return stat == p->target_state;
@@ -80,32 +84,29 @@ static bool mips_hart_reached_state(void *arg)
 
 static int mips_hart_start(u32 hartid, ulong saddr)
 {
-	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
-
 	/* Hart 0 is the boot hart, and we don't use the CPC cmd to start.  */
 	if (hartid == 0)
 		return SBI_ENOTSUPP;
 
 	/* Change reset base to mips_warm_boot */
-	write_gcr_co_reset_base(hartid, (unsigned long)mips_warm_boot, local_p);
+	write_gcr_co_reset_base(hartid, (unsigned long)mips_warm_boot);
 
 	if (cpu_hart(hartid) == 0) {
 		unsigned int const timeout_ms = 10;
 		bool booted;
 		struct mips_boot_params p = {
 			.hartid = hartid,
-			.local_p = local_p,
 			.target_state = CPC_Cx_STAT_CONF_SEQ_STATE_U6,
 		};
 
 		/* Ensure its coherency is disabled */
-		write_gcr_co_coherence(hartid, 0, local_p);
+		write_gcr_co_coherence(hartid, 0);
 
 		/* Start cluster cl core co hart 0 */
-		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid), local_p);
+		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid));
 
 		/* Reset cluster cl core co hart 0 */
-		write_cpc_co_cmd(hartid, CPC_Cx_CMD_RESET, local_p);
+		write_cpc_co_cmd(hartid, CPC_Cx_CMD_RESET);
 
 		booted = sbi_timer_waitms_until(mips_hart_reached_state, &p, timeout_ms);
 		if (!booted) {
@@ -114,7 +115,7 @@ static int mips_hart_start(u32 hartid, ulong saddr)
 			return -SBI_ETIMEDOUT;
 		}
 	} else {
-		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid), local_p);
+		write_cpc_co_vp_run(hartid, 1 << cpu_hart(hartid));
 	}
 
 	return 0;
@@ -123,13 +124,12 @@ static int mips_hart_start(u32 hartid, ulong saddr)
 static int mips_hart_stop()
 {
 	u32 hartid = current_hartid();
-	bool local_p = (cpu_cluster(current_hartid()) == cpu_cluster(hartid));
 
 	/* Hart 0 is the boot hart, and we don't use the CPC cmd to stop.  */
 	if (hartid == 0)
 		return SBI_ENOTSUPP;
 
-	write_cpc_co_vp_stop(hartid, 1 << cpu_hart(hartid), local_p);
+	write_cpc_co_vp_stop(hartid, 1 << cpu_hart(hartid));
 
 	return 0;
 }
@@ -203,6 +203,11 @@ static int mips_p8700_early_init(bool cold_boot)
 	if (!cold_boot)
 		return 0;
 
+	sbi_dprintf("Remap Cluster %d CM 0x%lx -> 0x%lx\n", 0,
+		    readq((void*)GLOBAL_CM_BASE[0] + GCR_BASE_OFFSET),
+		    GLOBAL_CM_BASE[0]);
+	writeq(GLOBAL_CM_BASE[0], (void*)GLOBAL_CM_BASE[0] + GCR_BASE_OFFSET);
+	wmb();
 	/* Power up other clusters in the platform. */
 	for (i = 1; i < CLUSTERS_IN_PLATFORM; i++) {
 		power_up_other_cluster(i << NEW_CLUSTER_SHIFT);
@@ -221,23 +226,6 @@ static int mips_p8700_early_init(bool cold_boot)
  * 0x08_00000000  0x10_00000000   M:---- S:-RWX DDR64
  * 0x10_00000000  0x20_00000000   M:---- S:IRW- PCI64 BARs
  */
-	/* CM and MTIMER */
-	rc = sbi_domain_root_add_memrange(CM_BASE, SIZE_FOR_CPC_MTIME,
-					  SIZE_FOR_CPC_MTIME,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-	if (rc)
-		return rc;
-
-	/* M-mode APLIC and ACLINT */
-	rc = sbi_domain_root_add_memrange(AIA_BASE, SIZE_FOR_AIA_M_MODE,
-					  SIZE_FOR_AIA_M_MODE,
-					  (SBI_DOMAIN_MEMREGION_MMIO |
-					   SBI_DOMAIN_MEMREGION_M_READABLE |
-					   SBI_DOMAIN_MEMREGION_M_WRITABLE));
-	if (rc)
-		return rc;
 
 	for (i = 0; i < CLUSTERS_IN_PLATFORM; i++) {
 		unsigned long cm_base = GLOBAL_CM_BASE[i];
@@ -252,7 +240,7 @@ static int mips_p8700_early_init(bool cold_boot)
 			return rc;
 
 		/* For the APLIC and ACLINT m-mode region */
-		rc = sbi_domain_root_add_memrange(cm_base + AIA_BASE - CM_BASE, SIZE_FOR_AIA_M_MODE,
+		rc = sbi_domain_root_add_memrange(cm_base + AIA_OFFSET, SIZE_FOR_AIA_M_MODE,
 						  SIZE_FOR_AIA_M_MODE,
 						  (SBI_DOMAIN_MEMREGION_MMIO |
 						   SBI_DOMAIN_MEMREGION_M_READABLE |
@@ -278,7 +266,8 @@ static int mips_p8700_early_init(bool cold_boot)
 static int mips_p8700_nascent_init(void)
 {
 	u64 hartid = current_hartid();
-	u64 cm_base = CM_BASE;
+	int cl = cpu_cluster(hartid);
+	u64 cm_base = GLOBAL_CM_BASE[cl];
 	int i;
 
 	/* Coherence enable for every core */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
