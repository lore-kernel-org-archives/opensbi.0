Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD82FC9832F
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 03:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C+EQDvV4GAXd59DtDgVlifSC3lDmE7rCh/lhhGrjVy0=; b=anZFHxbQeqybeF
	zXPsPOSZpaC+84C+i+ebnvpVifOQCbyOydDV29TdXEMEHbUQWNDTDoWa0NWJAbFsuaBhOYCmTXF+k
	sKJQMRn8e2yY3la4OapvDDFeKqg/CiBJsgbsmZ64Lsi20mOfo0kocZoNMz7T6sLctM6bJl40yY7fM
	E0BhXi4Yt85UFiZx7VKIMCEvJczzgo7oiNXCxPwZH1N4P7wwAsqT5RrNd1mqGPKjdbmIZelPAwtPu
	B/24rYuatIueuHlZlz5wkXZPzpOSDoEJOEuGIyIY6TyB9iFSQkMUiEeTWEDboJ53sVkuAs35+Zbpp
	m5oE/u302HH+z0bup+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1yX-0000000HFkb-2Dnw;
	Mon, 28 Sep 2026 03:24:21 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1yU-0000000HFkC-0xY2
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 03:24:20 +0000
Received: from imini.taila1aac7.ts.net (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXqOze3blqCLs_CQ--.19084S2;
	Mon, 28 Sep 2026 11:24:15 +0800 (CST)
From: Zhongyi Cheng <zhongyicheng241@mails.ucas.ac.cn>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com,
	anup.patel@oss.qualcomm.com,
	minda.chen@starfivetech.com,
	hal.feng@starfivetech.com,
	weiliang.lim@starfivetech.com,
	vulab@iscas.ac.cn
Subject: [PATCH] platform: generic/starfive: deny S-mode access to the JH7110 firmware alias
Date: Mon, 28 Sep 2026 11:24:14 +0800
Message-ID: <20260928032414.4125686-1-zhongyicheng241@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXqOze3blqCLs_CQ--.19084S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw48CFWDuF47uFWrCrW7urg_yoWrGF43pa
	s8CFZxGr4kKFyxWayxKF1qvF4fCw4kA3yUJr129F1vyw1rXwn8XrWkZ3WFgFnrGrWfZw15
	KF42vrWrCF45Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtw
	Av7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48J
	MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjxUyU7aUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kr0wx1lfxvtqjskio6pdxz3voxutnvoduhdfq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_202418_649964_070BED5C 
X-CRM114-Status: GOOD (  13.68  )
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

The JH7110 DDR controller folds physical addresses beyond the 8GB DDR
window back into DRAM: PA (X + 0x200000000) resolves to the same cells
as PA X. PMP entries match the presented address, so an aliased S-mode
access to the firmware region bypasses the entry protecting the
firmware and matches the allow-everything root region, letting root
read and write the firmware through the alias.

Add a root domain memory region covering the alias of the firmware
image (fw_start + 0x200000000 .. fw_start + fw_size) with M-mode-only
permissions, in platform early_init() so that it is in place before
sbi_domain_finalize(). The region sorts before the allow-everything
region, so it gets a lower PMP entry index and denies S/U-mode access
to the firmware alias. The rest of the alias window is left untouched.

This follows the same approach as the RZ/Five ILM/DLM protection.

Verified on QEMU riscv64 (root region list and PMP encodings) and on a
VisionFive 2 board: S/U-mode accesses to both the alias (0x240000000)
and the firmware region (0x40000000) fault as expected after this
patch, while normal boot is unaffected.

Reported-by: Zhongyi Cheng <zhongyicheng241@mails.ucas.ac.cn>
Signed-off-by: Zhongyi Cheng <zhongyicheng241@mails.ucas.ac.cn>
---
 platform/generic/starfive/jh7110.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index 7008386a..07fbed5e 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -10,9 +10,12 @@
 
 #include <libfdt.h>
 #include <platform_override.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_math.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_timer.h>
@@ -69,6 +72,13 @@ static u32 selected_hartid = -1;
 
 #define I2C_APB_CLK_ENABLE_BIT		BIT(31)
 
+/*
+ * Physical addresses beyond the 8GB DDR window fold back into DRAM on
+ * the JH7110 DDR controller: PA (X + JH7110_DRAM_ALIAS_OFFSET) resolves
+ * to the same cells as PA X (for X in the DDR window).
+ */
+#define JH7110_DRAM_ALIAS_OFFSET	0x200000000UL
+
 static int pm_system_reset_check(u32 type, u32 reason)
 {
 	switch (type) {
@@ -283,6 +293,33 @@ err:
 	return rc;
 }
 
+/*
+ * Deny S/U-mode access to the alias of this firmware image.
+ *
+ * PMP entries match the presented address, so without extra protection
+ * an S/U-mode access through the alias window bypasses the entry
+ * protecting the firmware and matches the allow-everything root region.
+ * Add a root domain region covering firmware_alias_base .. fw_end so
+ * that it sorts before the allow-everything region and denies S/U-mode
+ * access to the firmware alias, while leaving the rest of the alias
+ * window untouched.
+ */
+static int starfive_jh7110_early_init(bool cold_boot)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	int rc;
+
+	rc = generic_early_init(cold_boot);
+	if (rc || !cold_boot)
+		return rc;
+
+	return sbi_domain_root_add_memrange(
+			scratch->fw_start + JH7110_DRAM_ALIAS_OFFSET,
+			scratch->fw_size,
+			1UL << log2roundup(scratch->fw_size),
+			SBI_DOMAIN_MEMREGION_M_RWX);
+}
+
 static int starfive_jh7110_final_init(bool cold_boot)
 {
 	if (cold_boot) {
@@ -316,6 +353,7 @@ static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
 	}
 
 	generic_platform_ops.cold_boot_allowed = starfive_jh7110_cold_boot_allowed;
+	generic_platform_ops.early_init = starfive_jh7110_early_init;
 	generic_platform_ops.final_init = starfive_jh7110_final_init;
 
 	return 0;
-- 
2.54.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
