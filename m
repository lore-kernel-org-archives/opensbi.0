Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232B7CA9EC7
	for <opensbi@archiver.kernel.org>; Sun, 11 Oct 2026 22:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DluJtKEbRBrFYkrKBbJBUpMHmc66+zv5GUpP42tpuf4=; b=uo+Xs2Ihh61NmO
	k882svNlL15e8K6wGWRaCJboZq/xVso6KR824s9WkbtHLm4jwho6/tuNIvFRP+eLjrOFNMw7hg/CE
	pwtNu/46H934kHcNggr+OyZRmYxUwdJyMhq7zRe+Y/TXc0x604VLM7OqLFJ02V/DT9FnNrPN3dRYy
	jQE3ID+0O2zB52iFouGBslvxvo6xtTtXSWZ2+B6YiYM5VqQzolCMHW+Un4U+4QBl8CwoBSlODqpkA
	TVwpEfM/dooF0oan16+tFC/+JPrQBtGGzko3BWRPoyzzi7d1LeVvmBTky4a7ynRQtsP2Okaa4GTAh
	+/cnX2j+Ot19IL60GwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1v5-00000009S6w-2Hvl;
	Sun, 11 Oct 2026 22:21:27 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1v0-00000009S6b-1WXg
	for opensbi@lists.infradead.org;
	Sun, 11 Oct 2026 22:21:23 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xG1ut-00BxTP-8Y;
	Sun, 11 Oct 2026 18:21:15 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH] lib: sbi_pmu: Do not return uninitialized stack data on FW read errors
Date: Sun, 11 Oct 2026 18:21:14 -0400
Message-ID: <20261011222115.769450-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152122_405729_6B21E799 
X-CRM114-Status: GOOD (  14.05  )
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

sbi_ecall_pmu_handler() passes the uninitialized local temp to
sbi_pmu_ctr_fw_read() and copies it into out->value unconditionally.
sbi_pmu_ctr_fw_read() only writes *cval on success, so every error
return of SBI_EXT_PMU_COUNTER_FW_READ (e.g. a hardware or inactive
counter index) hands an M-mode stack word to the supervisor in a1.
SBI_EXT_PMU_COUNTER_FW_READ_HI does the same with the upper half of
temp on RV32.

Initialize temp to zero so that the error paths return zero in
sbiret.value; the success paths are unchanged.

Fixes: 1664d0efce0b ("lib: sbi_pmu: Replace sbi_pmu_ctr_read() with sbi_pmu_ctr_fw_read()")
Fixes: 51951d9e9af8 ("lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
---
This bug was found in the process of formally verifying the correctness
of OpenSBI on top of the Sail RISC-V semantics using Lean.

Triggering execution: any S-mode caller,
  a7 = 0x504D55 (PMU), a6 = 5 (COUNTER_FW_READ), a0 = 0 (mcycle).
sbi_pmu_ctr_fw_read() returns SBI_EINVAL at its first range check
without writing *cval, the handler copies the never-written temp into
out->value, and sbi_ecall_handler() returns it in a1 next to
a0 = SBI_ERR_INVALID_PARAM.  temp has its address taken, so it lives
in a stack slot of the M-mode trap stack and a1 receives whatever the
last M-mode code left there.  The same holds for a6 = 6 on RV32
(upper half); the RV64 arm of fid 6 already returns 0.

The same verification pass found that SBI_PMU_CFG_FLAG_SKIP_MATCH lets
a supervisor pair a firmware counter with a hardware event (sbi_panic()
via csr_write_num(0xb20)) or a hardware counter with a firmware event
(an out-of-bounds fw_counters_data[] store); that is fixed by the
pending "lib: sbi: reject PMU skip-match counter class mismatches"
from Pengpeng Hou, so it is not repeated here.

Testing:
- make PLATFORM=generic LLVM=1 PLATFORM_RISCV_XLEN=64: builds, no
  warnings.  PLATFORM_RISCV_XLEN=32 (rv32imac_zicsr_zifencei/ilp32):
  sbi_ecall_pmu.c compiles without warnings; the 32-bit build as a
  whole stops on an unrelated, pre-existing clang
  -Wsometimes-uninitialized error in lib/sbi/sbi_trap_ldst.c that
  origin/master has too.
- A userspace model of the handler (fid 5/6, sbi_pmu_ctr_fw_read()
  stubbed with the real "write *cval only on success" behaviour) shows
  the stale word in a1 on the error path before the patch and 0 after.
- Not run on QEMU (none available here).  Suggested check: from an
  S-mode test payload (or kvm-unit-tests' SBI PMU test), call
  sbi_ecall(0x504D55, 5, 0, ...) right after a successful fw read of
  a firmware counter configured with COUNTER_CFG_MATCH; before the
  patch a1 holds the previous call's counter value (whatever is in
  the stack slot), after it a1 = 0.

 lib/sbi/sbi_ecall_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 41bb1624..0762cce5 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -22,7 +22,7 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 				 struct sbi_ecall_return *out)
 {
 	int ret = 0;
-	uint64_t temp;
+	uint64_t temp = 0;
 
 	switch (funcid) {
 	case SBI_EXT_PMU_NUM_COUNTERS:

base-commit: 6ad246a1494807ee91e36ffcf60e4c30bb309d45
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
