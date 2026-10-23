Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84779606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KlcoOOaf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=QaefA+8B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zYWwDMsE06rZsMXsy3VLyBXgWwZ5MZaP7WMjcr94AAs=; b=KlcoOOaf2wcNWHkKsT5j2TW1Gw
	4nvNcXv6WhY0rYUes+j05xGWoKwItLto3tyUKcZzd/W6rkCZCYbK+qeE1XokTcN9I43yNWz0Hml7K
	MIxBa/Uusgos2RahnGWHtn9QiqQAfTueoNMseNMyiOZ4SvdepZxva4PP3nAELkEI6Rr6Y/8jr3VkJ
	Ln/BJYxBJPiXosnJrkSqV9k84XwHUnyyLRt0C2h0JXj+ocC66KKkTwNAAGwEQtSAVxgMv0x+uSS49
	SgMhSKz1xAkfCBreJ2Vkz+UCS+LR090z4G1ww8OHNxciqEL8TWQWXtzg4XOKfho1xhq0btVr9zurW
	AB8FUP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6EZ-0000000FRfo-1P8x;
	Fri, 23 Oct 2026 03:46:23 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6EW-0000000FRdr-12zy
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792727119;
	bh=2NsbmfuFiQWCx2rcxhqOAgUJEMPuWZ2ZCh7PO1+OG9U=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=QaefA+8BgCQybJXeSUSAg6AC5/l5tVoq7cxg/CBKk/u/cFQo/g8psrVl4Kcc9v4bY
	 N3rrUe+2Tnk2s4Eqkh/F9YC5AQne3PHj+hkQw+juKZPwittOHsHVFphT94XKQNpM7k
	 o0VBcn+TlD3s9MBjrtsiOQUkp3gUC3pucQfsgSKg=
X-QQ-mid: zesmtpgz7t1792727114t357a8deb
X-QQ-Originating-IP: 62LsG9VY1pe5AG5/dlXYA5BCPmEFej4GRb3HxiadnYw=
Received: from = ( [183.48.246.89])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:45:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9811876710432506075
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 23 Oct 2026 11:44:45 +0800
Subject: [PATCH v5 5/6] platform: generic: spacemit: k3: add platform
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-spacemit-k3-v5-5-c5ddfc72caa4@linux.spacemit.com>
References: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
In-Reply-To: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 E Shattow <e@freeshell.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23849;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=bSuuc69gxbg8PEmYtsW+4psp6GRb+AK/fcZaQ9bUHU0=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFm3bhjsEzD687jgN+9D9s13+gK8ppWtnbb30zml8q2fD
 +ra1wvN7ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjI4zeMDLvNzX0ddFNkfJjs
 OYTtPwrG+YctkBDWWOOb/1FEWp0jjJFhbUix/MJd3Ukme+JWZd3Ju5wq/mp52nR9I8vcdrdy80l
 cAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWQ+0+6PGXOhN/z2pAUR2Vzxa6fiIc+XD7ByQBfojRCFuQhK0qVxB3CS
	N7ZigXgGal6gOTLmq9+or3rKQv/Q43xae3+5Sr2TwQYgIGmWRQdLVQONbdYy8THA9OHNHN7
	QmCuIpeAbpIUqIVAXgctW3zerBmK+ZHLXLI4ZOZZiAy8GxX6bkYx7pIUOobxFArYlhuo4Mr
	HS82cRS9mKgZzibR+EsmcBsV9CjWxkOD6BSlv9P77ne4lE5GC9cbaJ4rBBNV0NRMOjd4K1j
	TiAtAXi9luvpmH6BnRolRgNYDkxk8knuglaCxaj5BM7kki6WreyplYCz1TFiK+c+u/ViDAl
	/82qlDNo/TUu9YFinOfPeJZc9HhY21UOcstJc+AEXX3gs0a55NcdGyMDkWo00h/8Bct9dtS
	05gEVnFxq58a7yuHbh8QPmsp/8IYxx1/D5Bs0fEWOYZyaOUxZ3vOQ9J2aVYHjaC28G9/7et
	Nk81+W5IOiYYjA+QEDJTbdRFT+5fo1zZHM31gF0iTxf5vDHr/X++p6OclCIxfOzsyEUXUP5
	zTiezWRq5pBQln9Dsq+6pqHWqGMTu8goxcQzDYYjyc7LYX2vp9efQpfnH7n9GhwcrlYyVba
	koCuh353E+QM34t5oVOpYeNUqy0rTs+vCat7ZlOBpJNEUxVzvl6eaDXNSh2uzADERXLwkiE
	1g45xfRBrK/hkJ07ajhoss7tykZM6CF36vKTESdPc3dxim7aZHcr0VxW7IETEkc0y4bZzQw
	WELNh9q9hDeXR3Vel0AJSL+kH9xzLJ7wDdEGekf/ukb0K9DDPgYKgaAAdZyPrbi6BtU4Jz2
	cz15su81MBly5jXhPGMMX+qmqiQHNVTD81z883PtfugWWys6XWTSn5+qP3DrTQkrEjTmtGv
	v0+Eo0hGY2Jir9Ue0/saSwIzGXbsY8OMT3elGR8kUHfJ1kVS1OReya9C+nDrUMRR5vVtB7X
	cpxw+EeMULhVQO9mODEwNZrZLbtIQy/gkIiGJELmhtKHSNXYaJ6rRqgMwvPkmngMewzX7Ki
	MQHN/jf6yGNhtgsiQv1kyqYSp/Ppqeu7AKLlQn4mO8lSOc/3MDJM5OpiXi2nslcwhlm9Va0
	qTxNCxsLfI4XwuKyP3DPXCw23/uhH0rDb0JxtApa+MQrSx0RJXU83HxeQWOgZC0uIBUMWZE
	K7sT90ObO8xTJK5HQF8TvlxD/C7XyeH0Sau7Xmt4ThabL31lBBxt/zjK9YSZsBsAVzwaTV4
	0JegDMNB2zNRWh31Jcj2n6bgPxD50Hsq+LhIUwP8=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204620_647818_E7951B51 
X-CRM114-Status: GOOD (  24.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>

SpacemiT K3 has 16 harts split across four clusters, with eight X100
harts in C0/C1 and eight A100 harts in C2/C3. Only hart 0 is powered at
reset, so secondary harts cannot reach the OpenSBI warm-boot path until
the platform removes their PMU power-down votes and wakes them.

Add a start-only HSM backend which performs those operations for the
requested hart. This lets the common HSM state machine start secondary
harts on demand instead of waking every hart during cold boot.
Select the HSM backend from the root compatible, preserving K1's
existing start and stop behavior.

The Boot ROM maps the audio buffer region as I/O although later firmware
uses it as normal memory. Restore its cacheable PMA attribute and mark
the XIP region as I/O before enabling caches. The boot hart performs the
per-hart setup during early platform discovery, while secondary harts do
the same in their assembly entry before reaching common warm-boot code.
This also enables MISA.H on X100 before common code selects its trap
entry; A100 does not implement H. Fence the PMA and guest translation
changes before continuing.

Use assembler-safe constants shared by the C and warm-entry assembly
paths. Since K1 and K3 are RV64-only, omit the SpacemiT platform objects
from RV32 generic builds.

Program the four cluster warm-boot vectors once and enable CCI-550 snoop
and DVM requests before any secondary hart is started.

Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Tested-by: E Shattow <e@freeshell.de>
Co-developed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 lib/utils/hsm/fdt_hsm_spacemit.c           | 113 +++++++++++++++++++------
 platform/generic/Kconfig                   |   7 ++
 platform/generic/configs/defconfig         |   1 +
 platform/generic/include/spacemit/common.h |  18 ++--
 platform/generic/include/spacemit/k3.h     | 127 +++++++++++++++++++++++++++++
 platform/generic/include/spacemit/k3_asm.h |  16 ++++
 platform/generic/spacemit/k3.c             | 122 +++++++++++++++++++++++++++
 platform/generic/spacemit/k3_asm.S         |  52 ++++++++++++
 platform/generic/spacemit/objects.mk       |   4 +
 9 files changed, 430 insertions(+), 30 deletions(-)

diff --git a/lib/utils/hsm/fdt_hsm_spacemit.c b/lib/utils/hsm/fdt_hsm_spacemit.c
index 6348f6a3..4f76b99e 100644
--- a/lib/utils/hsm/fdt_hsm_spacemit.c
+++ b/lib/utils/hsm/fdt_hsm_spacemit.c
@@ -9,11 +9,13 @@
 
 #include <platform_override.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_error.h>
 #include <sbi/sbi_hsm.h>
 #include <spacemit/common.h>
 #include <spacemit/k1.h>
+#include <spacemit/k3.h>
 
-static const u64 cpu_wakeup_reg[] = {
+static const u64 k1_cpu_wakeup_reg[] = {
 	PMU_AP_CORE0_WAKEUP,
 	PMU_AP_CORE1_WAKEUP,
 	PMU_AP_CORE2_WAKEUP,
@@ -24,7 +26,7 @@ static const u64 cpu_wakeup_reg[] = {
 	PMU_AP_CORE7_WAKEUP,
 };
 
-static const u64 cpu_idle_reg[] = {
+static const u64 k1_cpu_idle_reg[] = {
 	PMU_AP_CORE0_IDLE_CFG,
 	PMU_AP_CORE1_IDLE_CFG,
 	PMU_AP_CORE2_IDLE_CFG,
@@ -35,10 +37,11 @@ static const u64 cpu_idle_reg[] = {
 	PMU_AP_CORE7_IDLE_CFG,
 };
 
-static inline void spacemit_set_cpu_power(u32 hartid, bool enable)
+static inline void spacemit_k1_set_cpu_power(u32 hartid, bool enable)
 {
 	unsigned int value;
-	unsigned int *cpu_idle_base = (unsigned int *)(unsigned long)cpu_idle_reg[hartid];
+	unsigned int *cpu_idle_base =
+		(unsigned int *)(unsigned long)k1_cpu_idle_reg[hartid];
 
 	value = readl(cpu_idle_base);
 
@@ -50,31 +53,32 @@ static inline void spacemit_set_cpu_power(u32 hartid, bool enable)
 	writel(value, cpu_idle_base);
 }
 
-static void spacemit_wakeup_cpu(u32 mpidr)
+static void spacemit_k1_wakeup_cpu(u32 mpidr)
 {
 	unsigned int *cpu_reset_base;
 	unsigned int cur_hartid = current_hartid();
 
-	cpu_reset_base = (unsigned int *)(unsigned long)cpu_wakeup_reg[cur_hartid];
+	cpu_reset_base =
+		(unsigned int *)(unsigned long)k1_cpu_wakeup_reg[cur_hartid];
 
 	writel(1 << mpidr, cpu_reset_base);
 }
 
-static void spacemit_assert_cpu(void)
+static void spacemit_k1_assert_cpu(void)
 {
-	spacemit_set_cpu_power(current_hartid(), false);
+	spacemit_k1_set_cpu_power(current_hartid(), false);
 }
 
-static void spacemit_deassert_cpu(unsigned int hartid)
+static void spacemit_k1_deassert_cpu(unsigned int hartid)
 {
-	spacemit_set_cpu_power(hartid, true);
+	spacemit_k1_set_cpu_power(hartid, true);
 }
 
 /* Start (or power-up) the given hart */
-static int spacemit_hart_start(unsigned int hartid, unsigned long saddr)
+static int spacemit_k1_hart_start(unsigned int hartid, unsigned long saddr)
 {
-	spacemit_deassert_cpu(hartid);
-	spacemit_wakeup_cpu(hartid);
+	spacemit_k1_deassert_cpu(hartid);
+	spacemit_k1_wakeup_cpu(hartid);
 
 	return 0;
 }
@@ -83,10 +87,11 @@ static int spacemit_hart_start(unsigned int hartid, unsigned long saddr)
  * Stop (or power-down) the current hart from running. This call
  * doesn't expect to return if success.
  */
-static int spacemit_hart_stop(void)
+static int spacemit_k1_hart_stop(void)
 {
 	csr_write(CSR_STIMECMP, GENMASK_ULL(63, 0));
-	csr_clear(CSR_MIE, MIP_SSIP | MIP_MSIP | MIP_STIP | MIP_MTIP | MIP_SEIP | MIP_MEIP);
+	csr_clear(CSR_MIE, MIP_SSIP | MIP_MSIP | MIP_STIP | MIP_MTIP |
+		  MIP_SEIP | MIP_MEIP);
 
 	/* disable data prefetch */
 	csr_clear(CSR_MSETUP, MSETUP_PFE);
@@ -106,31 +111,93 @@ static int spacemit_hart_stop(void)
 	 * Therefore, use modulo with PLATFORM_MAX_CPUS_PER_CLUSTER
 	 * to select the proper bit.
 	 */
-	csr_clear(CSR_ML2SETUP, 1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
+	csr_clear(CSR_ML2SETUP,
+		  1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
 	asm volatile ("fence iorw, iorw");
 
-	spacemit_assert_cpu();
+	spacemit_k1_assert_cpu();
 
 	wfi();
 
 	return SBI_ENOTSUPP;
 }
 
-static const struct sbi_hsm_device spacemit_hsm_ops = {
+static const struct sbi_hsm_device spacemit_k1_hsm_ops = {
 	.name		= "spacemit-hsm",
-	.hart_start	= spacemit_hart_start,
-	.hart_stop	= spacemit_hart_stop,
+	.hart_start	= spacemit_k1_hart_start,
+	.hart_stop	= spacemit_k1_hart_stop,
 };
 
-static int spacemit_hsm_probe(const void *fdt, int nodeoff, const struct fdt_match *match)
+static const unsigned long k3_cluster_idle_reg[] = {
+	PMU_CX_CAPMP_IDLE_CFG0,  PMU_CX_CAPMP_IDLE_CFG1,
+	PMU_CX_CAPMP_IDLE_CFG2,  PMU_CX_CAPMP_IDLE_CFG3,
+	PMU_CX_CAPMP_IDLE_CFG4,  PMU_CX_CAPMP_IDLE_CFG5,
+	PMU_CX_CAPMP_IDLE_CFG6,  PMU_CX_CAPMP_IDLE_CFG7,
+	PMU_CX_CAPMP_IDLE_CFG8,  PMU_CX_CAPMP_IDLE_CFG9,
+	PMU_CX_CAPMP_IDLE_CFG10, PMU_CX_CAPMP_IDLE_CFG11,
+	PMU_CX_CAPMP_IDLE_CFG12, PMU_CX_CAPMP_IDLE_CFG13,
+	PMU_CX_CAPMP_IDLE_CFG14, PMU_CX_CAPMP_IDLE_CFG15,
+};
+
+static const unsigned long k3_core_idle_reg[] = {
+	PMU_AP_CORE0_IDLE_CFG,   PMU_AP_CORE1_IDLE_CFG,
+	PMU_AP_CORE2_IDLE_CFG,   PMU_AP_CORE3_IDLE_CFG,
+	PMU_AP_CORE4_IDLE_CFG,   PMU_AP_CORE5_IDLE_CFG,
+	PMU_AP_CORE6_IDLE_CFG,   PMU_AP_CORE7_IDLE_CFG,
+	PMU_CAP_CORE8_IDLE_CFG,  PMU_CAP_CORE9_IDLE_CFG,
+	PMU_CAP_CORE10_IDLE_CFG, PMU_CAP_CORE11_IDLE_CFG,
+	PMU_CAP_CORE12_IDLE_CFG, PMU_CAP_CORE13_IDLE_CFG,
+	PMU_CAP_CORE14_IDLE_CFG, PMU_CAP_CORE15_IDLE_CFG,
+};
+
+static const unsigned long k3_core_wakeup_reg[] = {
+	PMU_AP_CORE0_WAKEUP,     PMU_AP_CORE1_WAKEUP,
+	PMU_AP_CORE2_WAKEUP,     PMU_AP_CORE3_WAKEUP,
+	PMU_AP_CORE4_WAKEUP,     PMU_AP_CORE5_WAKEUP,
+	PMU_AP_CORE6_WAKEUP,     PMU_AP_CORE7_WAKEUP,
+	PMU_CAP_CORE8_WAKEUP,    PMU_CAP_CORE9_WAKEUP,
+	PMU_CAP_CORE10_WAKEUP,   PMU_CAP_CORE11_WAKEUP,
+	PMU_CAP_CORE12_WAKEUP,   PMU_CAP_CORE13_WAKEUP,
+	PMU_CAP_CORE14_WAKEUP,   PMU_CAP_CORE15_WAKEUP,
+};
+
+static int spacemit_k3_hart_start(u32 hartid, ulong saddr)
+{
+	u32 value;
+
+	if (hartid >= array_size(k3_core_wakeup_reg))
+		return SBI_EINVAL;
+
+	value = readl((void *)k3_cluster_idle_reg[hartid]);
+	value &= ~CLUSTER_PWR_DOWN_VALUE;
+	writel(value, (void *)k3_cluster_idle_reg[hartid]);
+
+	value = readl((void *)k3_core_idle_reg[hartid]);
+	value &= ~PMU_AP_IDLE_PWRDOWN_K3_MASK;
+	writel(value, (void *)k3_core_idle_reg[hartid]);
+
+	writel(BIT(hartid), (void *)k3_core_wakeup_reg[hartid]);
+
+	return 0;
+}
+
+/* K3 uses this only to power on a hart which has not entered OpenSBI yet. */
+static const struct sbi_hsm_device spacemit_k3_hsm_ops = {
+	.name		= "spacemit-k3-hsm",
+	.hart_start	= spacemit_k3_hart_start,
+};
+
+static int spacemit_hsm_probe(const void *fdt, int nodeoff,
+			      const struct fdt_match *match)
 {
-	sbi_hsm_set_device(&spacemit_hsm_ops);
+	sbi_hsm_set_device(match->data);
 
 	return 0;
 }
 
 static const struct fdt_match spacemit_hsm_match[] = {
-	{ .compatible = "spacemit,k1" },
+	{ .compatible = "spacemit,k1", .data = &spacemit_k1_hsm_ops },
+	{ .compatible = "spacemit,k3", .data = &spacemit_k3_hsm_ops },
 	{ },
 };
 
diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 958610d3..a00b4d13 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -109,6 +109,13 @@ config PLATFORM_SPACEMIT_K1
 	select PLATFORM_SPACEMIT
 	default n
 
+config PLATFORM_SPACEMIT_K3
+	bool "Spacemit K3 support"
+	select FDT_HSM
+	select FDT_HSM_SPACEMIT
+	select PLATFORM_SPACEMIT
+	default n
+
 config CPU_MIPS_P8700
 	bool
 	default n
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 341f6b25..58d40898 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -15,6 +15,7 @@ CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700_EYEQ7H=y
 CONFIG_PLATFORM_MIPS_P8700_BOSTON=y
 CONFIG_PLATFORM_SPACEMIT_K1=y
+CONFIG_PLATFORM_SPACEMIT_K3=y
 CONFIG_FDT_CACHE=y
 CONFIG_FDT_CACHE_ANDES_LLCACHE=y
 CONFIG_FDT_CACHE_SIFIVE_CCACHE=y
diff --git a/platform/generic/include/spacemit/common.h b/platform/generic/include/spacemit/common.h
index 317bb3e9..7a75ff3f 100644
--- a/platform/generic/include/spacemit/common.h
+++ b/platform/generic/include/spacemit/common.h
@@ -9,23 +9,27 @@
 #ifndef __RISCV_SPACEMIT_COMMON_H__
 #define __RISCV_SPACEMIT_COMMON_H__
 
+#include <sbi/sbi_const.h>
+
+#ifndef __ASSEMBLY__
 #include <sbi/sbi_bitops.h>
+#endif
 
 #define CSR_MSETUP				0x7c0
 #define CSR_ML2SETUP				0x7f0
 
 /* dcache enable */
-#define MSETUP_DE				BIT(0)
+#define MSETUP_DE				_BITUL(0)
 /* icache enable */
-#define MSETUP_IE				BIT(1)
+#define MSETUP_IE				_BITUL(1)
 /* branch prediction enable */
-#define MSETUP_BPE				BIT(4)
+#define MSETUP_BPE				_BITUL(4)
 /* prefetch functionality enable */
-#define MSETUP_PFE				BIT(5)
+#define MSETUP_PFE				_BITUL(5)
 /* misaligned memory access enable */
-#define MSETUP_MME				BIT(6)
+#define MSETUP_MME				_BITUL(6)
 /* ECC enable */
-#define MSETUP_ECCE				BIT(16)
+#define MSETUP_ECCE				_BITUL(16)
 
 #define PMU_AP_BASE				0xd4282800
 
@@ -74,7 +78,7 @@
 #define PMU_AP_IDLE_CORE_IDLE			BIT(0)
 /* bit 1: CORE_PWRDWN - power off core on WFI (requires CORE_IDLE set) */
 #define PMU_AP_IDLE_CORE_PWRDWN			BIT(1)
-/* bit 2: Core L1 SRAM Power Down - reserved/not used in K1 and K3 */
+/* bit 2: Core L1 SRAM Power Down - reserved in K1, used in K3 */
 #define PMU_AP_IDLE_CORE_L1_SRAM_PWRDWN		BIT(2)
 /* bit 3: MASK_GIC_NIRQ_TO_CORE - mask nIRQ from GIC, auto-cleared by HW on power-down entry */
 #define PMU_AP_IDLE_MASK_GIC_NIRQ		BIT(3)
diff --git a/platform/generic/include/spacemit/k3.h b/platform/generic/include/spacemit/k3.h
new file mode 100644
index 00000000..f444d064
--- /dev/null
+++ b/platform/generic/include/spacemit/k3.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#ifndef __RISCV_SPACEMIT_K3_H__
+#define __RISCV_SPACEMIT_K3_H__
+
+#include <spacemit/common.h>
+
+/* PMA configuration CSR */
+#define CSR_PMACFG0				0x7de
+
+/*
+ * PMACFG0 audio buffer region field: bits [55:48].
+ * The Boot ROM maps this region as I/O. Restore it to a cacheable
+ * attribute so later firmware can use it for data or instructions.
+ */
+#define PMACFG0_AUDIO_BUF_FIELD_MASK		_UL(0xff)
+#define PMACFG0_AUDIO_BUF_FIELD_SHIFT		48
+#define PMACFG0_AUDIO_BUF_ATTR_CACHEABLE	_UL(0x20)
+
+/*
+ * PMACFG0 XIP region field: bits [23:16].
+ * Lower 12 bits are zero so GAS emits a single lui instruction.
+ */
+#define PMACFG0_XIP_FIELD_CLEAR			_UL(0x00ff0000)
+#define PMACFG0_XIP_ATTR_IO			_UL(0x00220000)
+
+#define CSR_ML2HINT				0x7f7
+#define MISA_EXT_H				_BITUL(7)
+
+/* Enable instruction prefetch in L2 cache on miss */
+#define ML2SETUP_IPRF				_BITUL(16)
+/* Enable TLB prefetch in L2 cache */
+#define ML2SETUP_TPRF				_BITUL(18)
+/* Enable top-of-clk of trace */
+#define ML2HINT_TRACE_TOP_ICGEN			_BITUL(26)
+
+#define MSETUP_BOOT_FLAGS			(MSETUP_DE | MSETUP_IE | \
+						 MSETUP_BPE | MSETUP_PFE | \
+						 MSETUP_MME | MSETUP_ECCE)
+
+/* A100 cores: hart 8-11 belong to C2 cluster, hart 12-15 to C3 cluster */
+#define PMU_CAP_CORE8_WAKEUP			(PMU_AP_BASE + 0x360)
+#define PMU_CAP_CORE9_WAKEUP			(PMU_AP_BASE + 0x364)
+#define PMU_CAP_CORE10_WAKEUP			(PMU_AP_BASE + 0x368)
+#define PMU_CAP_CORE11_WAKEUP			(PMU_AP_BASE + 0x36c)
+#define PMU_CAP_CORE12_WAKEUP			(PMU_AP_BASE + 0x22c)
+#define PMU_CAP_CORE13_WAKEUP			(PMU_AP_BASE + 0x230)
+#define PMU_CAP_CORE14_WAKEUP			(PMU_AP_BASE + 0x234)
+#define PMU_CAP_CORE15_WAKEUP			(PMU_AP_BASE + 0x238)
+
+/* A100 per-core idle config registers (harts 8-15) */
+#define PMU_CAP_CORE8_IDLE_CFG			(PMU_AP_BASE + 0x340)
+#define PMU_CAP_CORE9_IDLE_CFG			(PMU_AP_BASE + 0x344)
+#define PMU_CAP_CORE10_IDLE_CFG			(PMU_AP_BASE + 0x348)
+#define PMU_CAP_CORE11_IDLE_CFG			(PMU_AP_BASE + 0x34c)
+#define PMU_CAP_CORE12_IDLE_CFG			(PMU_AP_BASE + 0x20c)
+#define PMU_CAP_CORE13_IDLE_CFG			(PMU_AP_BASE + 0x210)
+#define PMU_CAP_CORE14_IDLE_CFG			(PMU_AP_BASE + 0x214)
+#define PMU_CAP_CORE15_IDLE_CFG			(PMU_AP_BASE + 0x218)
+
+/* CX CAPMP cluster idle config registers */
+#define PMU_CX_CAPMP_IDLE_CFG0		(PMU_AP_BASE + 0x120)
+#define PMU_CX_CAPMP_IDLE_CFG1		(PMU_AP_BASE + 0x0e4)
+#define PMU_CX_CAPMP_IDLE_CFG2		(PMU_AP_BASE + 0x150)
+#define PMU_CX_CAPMP_IDLE_CFG3		(PMU_AP_BASE + 0x154)
+#define PMU_CX_CAPMP_IDLE_CFG4		(PMU_AP_BASE + 0x314)
+#define PMU_CX_CAPMP_IDLE_CFG5		(PMU_AP_BASE + 0x318)
+#define PMU_CX_CAPMP_IDLE_CFG6		(PMU_AP_BASE + 0x31c)
+#define PMU_CX_CAPMP_IDLE_CFG7		(PMU_AP_BASE + 0x320)
+#define PMU_CX_CAPMP_IDLE_CFG8		(PMU_AP_BASE + 0x350)
+#define PMU_CX_CAPMP_IDLE_CFG9		(PMU_AP_BASE + 0x354)
+#define PMU_CX_CAPMP_IDLE_CFG10		(PMU_AP_BASE + 0x358)
+#define PMU_CX_CAPMP_IDLE_CFG11		(PMU_AP_BASE + 0x35c)
+#define PMU_CX_CAPMP_IDLE_CFG12		(PMU_AP_BASE + 0x21c)
+#define PMU_CX_CAPMP_IDLE_CFG13		(PMU_AP_BASE + 0x220)
+#define PMU_CX_CAPMP_IDLE_CFG14		(PMU_AP_BASE + 0x224)
+#define PMU_CX_CAPMP_IDLE_CFG15		(PMU_AP_BASE + 0x228)
+
+#define PMU_AP_IDLE_PWRDOWN_K3_MASK		(PMU_AP_IDLE_CORE_IDLE |		\
+						 PMU_AP_IDLE_CORE_PWRDWN |		\
+						 PMU_AP_IDLE_CORE_L1_SRAM_PWRDWN |	\
+						 PMU_AP_IDLE_MASK_GIC_NIRQ |		\
+						 PMU_AP_IDLE_MASK_GIC_NFIQ)
+
+/*
+ * PMU CX per-cluster idle control bits (PMU_CX_CAPMPn_IDLE_CFG).
+ */
+/* bit 0: MP Idle - gate cluster clocks externally on WFI */
+#define PMU_CX_IDLE_MP_IDLE			BIT(0)
+/* bit 1: MP Power Down - power off cluster logic when idle */
+#define PMU_CX_IDLE_MP_PWRDWN			BIT(1)
+/* bit 2: L2 Cache SRAM Power Down */
+#define PMU_CX_IDLE_L2_SRAM_PWRDWN		BIT(2)
+/* bit 3: SCU SRAM Power Down - not used, SCU SRAM does not support retention */
+#define PMU_CX_IDLE_MP_SCU_SRAM_PWRDWN		BIT(3)
+/* bit 7: ACNACTM Hardware Control - HW controls ACNACTM port on MP low power entry */
+#define PMU_CX_IDLE_ACNACTM_HW_CTRL		BIT(7)
+
+#define CLUSTER_PWR_DOWN_VALUE			(PMU_CX_IDLE_MP_IDLE |		\
+						 PMU_CX_IDLE_MP_PWRDWN |	\
+						 PMU_CX_IDLE_L2_SRAM_PWRDWN |	\
+						 PMU_CX_IDLE_MP_SCU_SRAM_PWRDWN | \
+						 PMU_CX_IDLE_ACNACTM_HW_CTRL)
+
+/* boot entry for A100 clusters */
+#define C2_RVBADDR_LO_ADDR			(0xd4282c00 + 0x3e8)
+#define C2_RVBADDR_HI_ADDR			(0xd4282c00 + 0x3ec)
+#define C3_RVBADDR_LO_ADDR			(0xd4282c00 + 0x260)
+#define C3_RVBADDR_HI_ADDR			(0xd4282c00 + 0x264)
+
+#define PLATFORM_A100_FIRST_ID			8
+
+#define PLAT_CCI_K3_AIDMA_IFACE_IX		0
+#define PLAT_CCI_K3_CLUSTER0_IFACE_IX		1
+#define PLAT_CCI_K3_CLUSTER1_IFACE_IX		2
+#define PLAT_CCI_K3_CLUSTER2_0_IFACE_IX	3
+#define PLAT_CCI_K3_CLUSTER2_1_IFACE_IX	4
+#define PLAT_CCI_K3_CLUSTER3_0_IFACE_IX	5
+#define PLAT_CCI_K3_CLUSTER3_1_IFACE_IX	6
+
+#endif /* __RISCV_SPACEMIT_K3_H__ */
diff --git a/platform/generic/include/spacemit/k3_asm.h b/platform/generic/include/spacemit/k3_asm.h
new file mode 100644
index 00000000..70c00478
--- /dev/null
+++ b/platform/generic/include/spacemit/k3_asm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#ifndef __RISCV_SPACEMIT_K3_ASM_H__
+#define __RISCV_SPACEMIT_K3_ASM_H__
+
+#ifndef __ASSEMBLY__
+void _spacemit_k3_warm_start(void);
+#endif
+
+#endif /* __RISCV_SPACEMIT_K3_ASM_H__ */
diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
new file mode 100644
index 00000000..967d09bf
--- /dev/null
+++ b/platform/generic/spacemit/k3.c
@@ -0,0 +1,122 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#include <platform_override.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_hfence.h>
+#include <sbi/sbi_tlb.h>
+#include <spacemit/k3.h>
+#include <spacemit/k3_asm.h>
+#include <spacemit/spacemit.h>
+
+static const int cci_map[] = {
+	PLAT_CCI_K3_AIDMA_IFACE_IX,
+	PLAT_CCI_K3_CLUSTER0_IFACE_IX,
+	PLAT_CCI_K3_CLUSTER1_IFACE_IX,
+	PLAT_CCI_K3_CLUSTER2_0_IFACE_IX,
+	PLAT_CCI_K3_CLUSTER2_1_IFACE_IX,
+	PLAT_CCI_K3_CLUSTER3_0_IFACE_IX,
+	PLAT_CCI_K3_CLUSTER3_1_IFACE_IX,
+};
+
+/*
+ * The boot hart reaches this function before caches are enabled. Secondary
+ * harts perform the same setup in _spacemit_k3_warm_start before entering
+ * the common warm-boot path.
+ */
+static void spacemit_k3_hart_init(u32 hartid)
+{
+	csr_clear(CSR_PMACFG0,
+		  PMACFG0_AUDIO_BUF_FIELD_MASK <<
+		  PMACFG0_AUDIO_BUF_FIELD_SHIFT);
+	csr_set(CSR_PMACFG0,
+		PMACFG0_AUDIO_BUF_ATTR_CACHEABLE <<
+		PMACFG0_AUDIO_BUF_FIELD_SHIFT);
+	csr_clear(CSR_PMACFG0, PMACFG0_XIP_FIELD_CLEAR);
+	csr_set(CSR_PMACFG0, PMACFG0_XIP_ATTR_IO);
+	__sbi_sfence_vma_all();
+
+	csr_set(CSR_ML2SETUP,
+		_BITUL(hartid % PLATFORM_MAX_CPUS_PER_CLUSTER) |
+		ML2SETUP_IPRF | ML2SETUP_TPRF);
+	csr_set(CSR_ML2HINT, ML2HINT_TRACE_TOP_ICGEN);
+	csr_set(CSR_MSETUP, MSETUP_BOOT_FLAGS);
+
+	if (hartid < PLATFORM_A100_FIRST_ID) {
+		/* MISA.H is writable on X100 and not implemented on A100. */
+		csr_set(CSR_MISA, MISA_EXT_H);
+		__sbi_hfence_gvma_all();
+	}
+}
+
+/* The boot hart is already running, so it is never started by the HSM. */
+static void spacemit_k3_keep_boot_hart_powered(void)
+{
+	u32 value;
+
+	value = readl((void *)(unsigned long)PMU_CX_CAPMP_IDLE_CFG0);
+	value &= ~CLUSTER_PWR_DOWN_VALUE;
+	writel(value, (void *)(unsigned long)PMU_CX_CAPMP_IDLE_CFG0);
+
+	value = readl((void *)(unsigned long)PMU_AP_CORE0_IDLE_CFG);
+	value &= ~PMU_AP_IDLE_PWRDOWN_K3_MASK;
+	writel(value, (void *)(unsigned long)PMU_AP_CORE0_IDLE_CFG);
+}
+
+/* Program global state before the HSM starts any secondary hart. */
+static void spacemit_k3_pre_init(void)
+{
+	unsigned long entry = (unsigned long)&_spacemit_k3_warm_start;
+	int i;
+
+	writel((u32)entry, (void *)(unsigned long)C0_RVBADDR_LO_ADDR);
+	writel((u32)(entry >> 32), (void *)(unsigned long)C0_RVBADDR_HI_ADDR);
+
+	writel((u32)entry, (void *)(unsigned long)C1_RVBADDR_LO_ADDR);
+	writel((u32)(entry >> 32), (void *)(unsigned long)C1_RVBADDR_HI_ADDR);
+
+	writel((u32)entry, (void *)(unsigned long)C2_RVBADDR_LO_ADDR);
+	writel((u32)(entry >> 32), (void *)(unsigned long)C2_RVBADDR_HI_ADDR);
+
+	writel((u32)entry, (void *)(unsigned long)C3_RVBADDR_LO_ADDR);
+	writel((u32)(entry >> 32), (void *)(unsigned long)C3_RVBADDR_HI_ADDR);
+
+	for (i = 0; i < array_size(cci_map); i++)
+		cci_enable_snoop_dvm_reqs(cci_map, i);
+
+	spacemit_k3_keep_boot_hart_powered();
+}
+
+static int spacemit_k3_early_init(bool cold_boot)
+{
+	if (cold_boot)
+		spacemit_k3_pre_init();
+
+	return generic_early_init(cold_boot);
+}
+
+static int spacemit_k3_platform_init(const void *fdt, int nodeoff,
+				     const struct fdt_match *match)
+{
+	spacemit_k3_hart_init(current_hartid());
+	generic_platform_ops.early_init = spacemit_k3_early_init;
+
+	return 0;
+}
+
+static const struct fdt_match spacemit_k3_match[] = {
+	{ .compatible = "spacemit,k3" },
+	{ /* sentinel */ }
+};
+
+const struct fdt_driver spacemit_k3 = {
+	.match_table = spacemit_k3_match,
+	.init = spacemit_k3_platform_init,
+};
diff --git a/platform/generic/spacemit/k3_asm.S b/platform/generic/spacemit/k3_asm.S
new file mode 100644
index 00000000..2da58857
--- /dev/null
+++ b/platform/generic/spacemit/k3_asm.S
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 SpacemiT
+ * Authors:
+ *   Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
+ *   Troy Mitchell <troy.mitchell@linux.spacemit.com>
+ */
+
+#define __ASSEMBLY__
+#include <spacemit/common.h>
+#include <spacemit/k3.h>
+
+	.section .entry, "ax", %progbits
+	.align 3
+	.globl _spacemit_k3_warm_start
+_spacemit_k3_warm_start:
+	/* Program PMA attributes before enabling the caches. */
+	li	t0, (PMACFG0_AUDIO_BUF_FIELD_MASK << \
+		     PMACFG0_AUDIO_BUF_FIELD_SHIFT)
+	csrc	CSR_PMACFG0, t0
+	li	t0, (PMACFG0_AUDIO_BUF_ATTR_CACHEABLE << \
+		     PMACFG0_AUDIO_BUF_FIELD_SHIFT)
+	csrs	CSR_PMACFG0, t0
+	li	t0, PMACFG0_XIP_FIELD_CLEAR
+	csrc	CSR_PMACFG0, t0
+	li	t0, PMACFG0_XIP_ATTR_IO
+	csrs	CSR_PMACFG0, t0
+	sfence.vma
+
+	/* Enable L1 snooping and L2 prefetch for this hart. */
+	csrr	t0, mhartid
+	andi	t0, t0, (PLATFORM_MAX_CPUS_PER_CLUSTER - 1)
+	li	t1, 1
+	sll	t1, t1, t0
+	li	t2, (ML2SETUP_IPRF | ML2SETUP_TPRF)
+	or	t1, t1, t2
+	csrs	CSR_ML2SETUP, t1
+	li	t0, ML2HINT_TRACE_TOP_ICGEN
+	csrs	CSR_ML2HINT, t0
+
+	li	t0, MSETUP_BOOT_FLAGS
+	csrs	CSR_MSETUP, t0
+
+	/* Enable H before common code selects the per-hart trap entry. */
+	csrr	t0, mhartid
+	li	t1, PLATFORM_A100_FIRST_ID
+	bgeu	t0, t1, 1f
+	li	t0, MISA_EXT_H
+	csrs	misa, t0
+	.word	0x62000073	/* hfence.gvma */
+1:
+	j	_start_warm
diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/spacemit/objects.mk
index 8309ad1f..eac3199c 100644
--- a/platform/generic/spacemit/objects.mk
+++ b/platform/generic/spacemit/objects.mk
@@ -2,6 +2,10 @@
 # SPDX-License-Identifier: BSD-2-Clause
 #
 
+ifeq ($(PLATFORM_RISCV_XLEN), 64)
 platform-objs-$(CONFIG_PLATFORM_SPACEMIT) += spacemit/spacemit.o
 carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit_k1
 platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit/k1.o
+carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K3) += spacemit_k3
+platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K3) += spacemit/k3.o spacemit/k3_asm.o
+endif

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
