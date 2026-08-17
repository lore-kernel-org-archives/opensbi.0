Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CAEC5DF70
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GED9fyZ+mMokz2tRglyTohY8OWGBm2BQBuvzrU+qbA4=; b=XtD1SIdkGSGVIF
	QKVFTkCxQOGxwQKHcqY78YZRJpl/p+lGl16URWy4s9ZrBV3tu0bxfyrVXBeYbVXFh9CGSczdqGBX5
	0V51b9r8Gy83cBEw9A0H1K7g5cyMHm6+qI7Q6VkK8Z/w5Qu4atMKJ0qU+eBJlDCN/61VlUXLInDZE
	3jKJZ9kW/C6/CoB8ziuqO882oqS/naeQ76alVZADbnORyrnIOCRnfh/O93J+PdG0tOFp4j4u+i1nE
	PTt5FmheDYR1GCNpEqUzDt8ECs9zsKcWmzP1Ib2fy0PA7pZnCmPD8/chRC5JXzlio/PsQk4shpHuS
	HQfpQDUJ0W/J5OrhsaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvswJ-00000005imN-3YcH;
	Mon, 17 Aug 2026 08:43:27 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvswG-00000005il5-1SIX
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 08:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786956200; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4pyhMiTViS4lo+ZUPEchgyYcbRjx/4fuWk++BB7hFzE=;
	b=K4NCwMHCNgyhw/flska9UpruP3IP+7kHfkzOb9oLeCplZ0q72g2yUQVfU/B/KrEE55T8Z+zNEtVq6H05Z1FHZnFhS25qvuJ1a8ygEIQKC8jbYK0sUvOxUsIZQnbtYTsvObuI0mPXs16QgdMKM+ikUHaX/6TQCiQrQoHPhAqb9NM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X95C0Fk_1786956184;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X95C0Fk_1786956184 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Aug 2026 16:43:20 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@rivosinc.com,
	wangxiang@iscas.ac.cn,
	ganboing@gmail.com,
	guoren@kernel.org
Subject: [PATCH v2] lib/utils/fdt: Reserve exactly enough FDT space for fdt_cpu_fixup
Date: Mon, 17 Aug 2026 16:43:03 +0800
Message-ID: <20260817084303.1232-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_014325_090469_FE65936C 
X-CRM114-Status: GOOD (  21.70  )
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

fdt_cpu_fixup() reserves a hardcoded 32 extra bytes, plus 16 more per
HART inside the "zicntr" loop. Those 32 bytes also have to cover every
"status" property rewritten to "disabled", so once more than a handful
of HARTs are disabled the fixups fail with FDT_ERR_NOSPACE (-3).

Bumping the reservation to a fixed worst case is not safe either:
fdt_open_into() cannot know how much space the caller's buffer really
has, it just trusts the requested size. As OpenSBI does not own the
memory following a device tree passed in by the previous booting stage,
over-declaring the blob risks corrupting whatever follows it.

Walk the HART nodes once without modifying them instead, and reserve
exactly what the fixups need. The read-only decision logic is factored
into fdt_cpu_fixup_needed() so the sizing and fixup passes cannot drift
apart, which also makes the per-HART fdt_open_into() redundant. Check
the return values of fdt_setprop_string() and fdt_appendprop_string()
as well, as running out of space used to fail silently.

Fixes: dd9439fbace2 ("lib: utils: Add a fdt_cpu_fixup() helper")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
Changes in v2:
- Scan the HART nodes and reserve only what the fixups need, instead of a
  fixed SBI_HARTMASK_MAX_BITS * 20 bytes: fdt_open_into() just trusts the
  requested size, so over-declaring a device tree owned by the previous
  booting stage may corrupt what follows it.
- Fix the per-HART estimate; a missing "status" counts as enabled, so the
  property may have to be created rather than overwritten.
- Add the read-only helper fdt_cpu_fixup_needed() so the sizing and fixup
  passes cannot drift apart.
- Check the fdt_setprop_string()/fdt_appendprop_string() return values.
- Re-resolve /cpus after fdt_open_into() and skip it when there is nothing
  to fix.
- Drop the dependency on SBI_HARTMASK_MAX_BITS.

 lib/utils/fdt/fdt_fixup.c | 133 +++++++++++++++++++++++++++-----------
 1 file changed, 95 insertions(+), 38 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index b0ed20c8..23899c0e 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -106,14 +106,65 @@ int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state)
 	return 0;
 }
 
-void fdt_cpu_fixup(void *fdt)
+/**
+ * Report which fixups a HART DT node needs. Read-only, so the sizing pass
+ * and the fixup pass below stay in sync by construction.
+ */
+static void fdt_cpu_fixup_needed(const void *fdt, int cpu_offset,
+				 bool emulated_zicntr, bool *disable,
+				 bool *add_zicntr)
 {
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
-	int err, cpu_offset, cpus_offset, len;
 	const char *mmu_type, *extensions;
 	u32 hartid, hartindex;
-	bool emulated_zicntr;
+	int len;
+
+	*disable = false;
+	*add_zicntr = false;
+
+	if (fdt_parse_hart_id(fdt, cpu_offset, &hartid))
+		return;
+
+	if (!fdt_node_is_enabled(fdt, cpu_offset))
+		return;
+
+	/*
+	 * Disable a HART DT node if one of the following is true:
+	 * 1. The HART is not assigned to the current domain
+	 * 2. MMU is not available for the HART
+	 */
+
+	hartindex = sbi_hartid_to_hartindex(hartid);
+	mmu_type = fdt_getprop(fdt, cpu_offset, "mmu-type", &len);
+	if (!sbi_domain_is_assigned_hart(dom, hartindex) || !mmu_type || !len)
+		*disable = true;
+
+	if (!emulated_zicntr)
+		return;
+
+	extensions = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
+	/*
+	 * For legacy devicetrees, don't create riscv,isa-extensions
+	 * property if there hasn't been already one.
+	 */
+	if (extensions && !fdt_stringlist_contains(extensions, len, "zicntr"))
+		*add_zicntr = true;
+}
+
+void fdt_cpu_fixup(void *fdt)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	bool emulated_zicntr, disable, add_zicntr;
+	int err, cpu_offset, cpus_offset;
+	int reserve = 0;
+	/*
+	 * A new "status" property costs a header, its tag-aligned value and its
+	 * name; appending "zicntr" only grows an existing tag-aligned value.
+	 */
+	const int status_size = sizeof(struct fdt_property) +
+				ROUNDUP(sizeof("disabled"), FDT_TAGSIZE) +
+				sizeof("status");
+	const int zicntr_size = ROUNDUP(sizeof("zicntr"), FDT_TAGSIZE);
 
 	/*
 	 * Claim Zicntr extension in riscv,isa-extensions if
@@ -124,52 +175,58 @@ void fdt_cpu_fixup(void *fdt)
 			  sbi_hart_has_csr(scratch, SBI_HART_CSR_CYCLE) &&
 			  sbi_hart_has_csr(scratch, SBI_HART_CSR_INSTRET);
 
-	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
-	if (err < 0)
-		return;
-
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
 	if (cpus_offset < 0)
 		return;
 
+	/*
+	 * fdt_open_into() trusts the size it is given, so reserve only what is
+	 * really needed instead of a fixed worst case for every possible HART.
+	 */
 	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
+		fdt_cpu_fixup_needed(fdt, cpu_offset, emulated_zicntr,
+				     &disable, &add_zicntr);
+		if (disable)
+			reserve += status_size;
+		if (add_zicntr)
+			reserve += zicntr_size;
+	}
 
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
-			continue;
+	if (!reserve)
+		return;
 
-		/*
-		 * Disable a HART DT node if one of the following is true:
-		 * 1. The HART is not assigned to the current domain
-		 * 2. MMU is not available for the HART
-		 */
+	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + reserve);
+	if (err < 0)
+		return;
 
-		hartindex = sbi_hartid_to_hartindex(hartid);
-		mmu_type = fdt_getprop(fdt, cpu_offset, "mmu-type", &len);
-		if (!sbi_domain_is_assigned_hart(dom, hartindex) ||
-		    !mmu_type || !len)
-			fdt_setprop_string(fdt, cpu_offset, "status",
-					   "disabled");
+	/* fdt_open_into() may have reordered the blocks, so look up again. */
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return;
 
-		if (!emulated_zicntr)
-			continue;
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		fdt_cpu_fixup_needed(fdt, cpu_offset, emulated_zicntr,
+				     &disable, &add_zicntr);
 
-		extensions = fdt_getprop(fdt, cpu_offset,
-					 "riscv,isa-extensions", &len);
-		/*
-		 * For legacy devicetrees, don't create riscv,isa-extensions
-		 * property if there hasn't been already one.
-		 */
-		if (extensions &&
-		    !fdt_stringlist_contains(extensions, len, "zicntr")) {
-			err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 16);
+		if (disable) {
+			err = fdt_setprop_string(fdt, cpu_offset, "status",
+						 "disabled");
 			if (err)
-				continue;
+				sbi_printf("%s: failed to disable %s (%d)\n",
+					   __func__,
+					   fdt_get_name(fdt, cpu_offset, NULL),
+					   err);
+		}
 
-			fdt_appendprop_string(fdt, cpu_offset,
-					      "riscv,isa-extensions", "zicntr");
+		if (add_zicntr) {
+			err = fdt_appendprop_string(fdt, cpu_offset,
+						    "riscv,isa-extensions",
+						    "zicntr");
+			if (err)
+				sbi_printf("%s: failed to add zicntr to %s (%d)\n",
+					   __func__,
+					   fdt_get_name(fdt, cpu_offset, NULL),
+					   err);
 		}
 	}
 }
-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
