Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83A606A332
	for <opensbi@archiver.kernel.org>; Tue,  3 Nov 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWc7lDY6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=173zBpFvwsA//aZaqF6aWjy294qI0uGstiUCkYbFxF8=; b=sWc7lDY6XcoeJSW4uAG0YmWJjP
	VBoSItD0WPm72IJ4BwsU9oIwzUeqjCwd7gkB8FIpReCHwQOicqjoxnFDFXGSDbykSToBswZMgONMY
	kmgHXeucOjG9iwkPz/nTcRJqULbYJnf1K6tQjxjCRHCkGEg9eFHEdx1OIn5FR5UasqR/K6ZV2HlMQ
	E0udbssS9x1vq4SppBifP7fJbvnIIU1ynnGF3GSu8Z0sdqEz8H/ShlmCN59riK9XcqzgssHJvPhu1
	mxJa60QYWoaFEvDzqkZAbvxFky/i6RZUzG69kKLacsXuxHVs1vIKA2xnIiw8I9co41WxuD3XGM02U
	nB/9PdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB4C-00000001nFa-38ip;
	Tue, 03 Nov 2026 09:44:32 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOB49-00000001nEE-3HEp
	for opensbi@lists.infradead.org;
	Tue, 03 Nov 2026 09:44:31 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHF5j6rOlq20k7AA--.2641S2;
	Tue, 03 Nov 2026 17:44:27 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com,
	xianbin.zhu@linux.spacemit.com,
	anup@brainfault.org,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH] platform: generic: spacemit: k3: deny S-mode access to the reset vectors
Date: Tue,  3 Nov 2026 09:44:15 +0000
Message-Id: <20261103094415.3007814-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAHF5j6rOlq20k7AA--.2641S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1ftFyrZF43XrW3Gry3urg_yoWrKFy3pF
	4j9Fs3Gw48GrsI9rs7AF4DZayfuws2gr45Zr1DZ3yDAws8WrWagw4kAF1YkFykurZ7X34Y
	qF12qrWUuF4rAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUAEfOUUU
	UU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_014430_201943_E53D68A3 
X-CRM114-Status: GOOD (  18.54  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

spacemit_k3_pre_init() programs the per-cluster reset vector registers
with the warm boot entry point, so a hart that is powered back on
resumes in M-mode at that address. The registers sit in ordinary MMIO
and the K3 support registers no memory region covering them, so they
fall to the root domain's allow-everything region and S-mode can write
them. S-mode can then point a cluster's reset vector at its own code
and have that code run in M-mode the next time the cluster is powered
up.

Add a root domain region over the naturally aligned 1KB block at
0xd4282c00, which contains all four reset vector register pairs, with
M-mode-only permissions. It sorts before the allow-everything region
and so takes a lower PMP entry index. The APMU registers live below
that block and are left alone, so S-mode keeps the access it uses for
core idle and wakeup.

SpaceMit's own k3-br-v1.0.y branch already protects this address range
in spacemit_k3.c, as part of a larger page; the protection was not
carried over when K3 support was upstreamed.

Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Found while auditing the DBTR shared memory paths; the reset vector
registers turned up because they sit in the same MMIO page the SpaceMit
power management code touches.

Why this range and not the whole page. SpaceMit's k3-br-v1.0.y branch
protects 0xd4282000 .. 0xd4282fff in spacemit_k3.c:

  rc = sbi_domain_root_add_memrange(REGISTER_PRESERVATION_BASE,
                                    REGISTER_PRESERVATION_SIZE, PAGE_SIZE,
                                    SBI_DOMAIN_MEMREGION_M_RWX);

That covers the APMU block at 0xd4282800 as well. Taking only the 1KB
block at 0xd4282c00 keeps every reset vector register inside it:

  C0 0xd4282db0/db4   C1 0xd4282eb0/eb4
  C2 0xd4282fe8/fec   C3 0xd4282e60/e64

while the highest APMU register in use here is PMU_AP_BASE + 0x36c =
0xd4282b6c, below the block. S-mode therefore keeps the APMU access it
needs. That seemed worth preserving after
4c5d9d9f ("lib: utils/andes: add the SMU and LLC registers to the root
domain"), where denying S-mode its power management registers broke
suspend and resume.

The block is naturally aligned, so it needs one PMP entry.

Verified by building for generic (RV64 and RV32) and booting qemu virt,
where the K3 early_init does not run and the root region list is
unchanged. I do not have K3 hardware running an upstream build to
confirm the region appears and that idle and wakeup still work; if
someone on the SpaceMit side can check that, I would appreciate it.

Not addressed here: platform/generic/spacemit/k1.c programs
C0/C1_RVBADDR in spacemit_k1_pre_init() the same way, at addresses in
the same window, and registers no region either. It looks like the same
gap, but the K1 vendor branch is not the one I compared against, so I
have left it for someone who knows that part.

 platform/generic/include/spacemit/k3.h |  9 +++++++++
 platform/generic/spacemit/k3.c         | 16 ++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/platform/generic/include/spacemit/k3.h b/platform/generic/include/spacemit/k3.h
index f444d064..e9580ecb 100644
--- a/platform/generic/include/spacemit/k3.h
+++ b/platform/generic/include/spacemit/k3.h
@@ -108,6 +108,15 @@
 						 PMU_CX_IDLE_MP_SCU_SRAM_PWRDWN | \
 						 PMU_CX_IDLE_ACNACTM_HW_CTRL)
 
+/*
+ * All four per-cluster reset vector register pairs fall inside this
+ * naturally aligned 1KB block. The APMU registers sit below it and are
+ * deliberately left out, so S-mode keeps the access it uses for core
+ * idle and wakeup.
+ */
+#define K3_RESET_VECTOR_BASE			0xd4282c00
+#define K3_RESET_VECTOR_SIZE			0x400
+
 /* boot entry for A100 clusters */
 #define C2_RVBADDR_LO_ADDR			(0xd4282c00 + 0x3e8)
 #define C2_RVBADDR_HI_ADDR			(0xd4282c00 + 0x3ec)
diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
index 7922ab11..9048678d 100644
--- a/platform/generic/spacemit/k3.c
+++ b/platform/generic/spacemit/k3.c
@@ -10,6 +10,7 @@
 #include <platform_override.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_hfence.h>
 #include <sbi/sbi_tlb.h>
 #include <spacemit/k3.h>
@@ -96,8 +97,19 @@ static void spacemit_k3_pre_init(void)
 
 static int spacemit_k3_early_init(bool cold_boot)
 {
-	if (cold_boot)
-		spacemit_k3_pre_init();
+	int rc;
+
+	if (!cold_boot)
+		return generic_early_init(cold_boot);
+
+	spacemit_k3_pre_init();
+
+	rc = sbi_domain_root_add_memrange(K3_RESET_VECTOR_BASE,
+					  K3_RESET_VECTOR_SIZE,
+					  K3_RESET_VECTOR_SIZE,
+					  SBI_DOMAIN_MEMREGION_M_RWX);
+	if (rc)
+		return rc;
 
 	return generic_early_init(cold_boot);
 }

base-commit: 2c7788e4c3efa63d670ee90402dac2a9799d0bd7
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
