Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060FACA5FED
	for <opensbi@archiver.kernel.org>; Tue,  6 Oct 2026 19:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HDANRWiEkvRCzKNwD/++Oaxiq4eAQQiCVl9HVazlBaY=; b=ds3unxv+8yE/ki
	hCVDEySLvlyyc/uaG7TgwT7LZ/6gitcQWmWDMB+rwGBTeZKDyyZxg7oHhD+Z6+RhbTs/VF5UX7rdt
	DrXrnEhoM/Xukmm/BQBXOHin2tbovKJXXoFjVenxeC0u4RqX/I9xyqeOnXuNUPQxOyk/tjj6lkZW3
	NIFkWZY+sfp5RqDNRyfrIIjyd0w/HDVUo6+uJ7WU5GeObW1KJfq60bKvalD4Jsq32kEOf3QyRWMaL
	/MsaIfAud7yQEszLIOpfGlF2SGFhxQU1oCUgQhBtK0i4ecmvjV6e1mU4jJMcMWOzf17ClbMAfKCUz
	8N8+Aoe7+kLIsyXMql+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEAxS-00000001KCS-1ShH;
	Tue, 06 Oct 2026 19:36:14 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEAxO-00000001KBo-2HSn
	for opensbi@lists.infradead.org;
	Tue, 06 Oct 2026 19:36:12 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xEAxN-0070bD-4R;
	Tue, 06 Oct 2026 15:36:09 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: opensbi@lists.infradead.org
Cc: Nickolai Zeldovich <nickolai.zeldovich@gmail.com>
Subject: [PATCH] firmware: fw_base: add an acquire fence after the _boot_status wait loop
Date: Tue,  6 Oct 2026 15:36:08 -0400
Message-ID: <20261006193609.735547-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_123610_644551_2EC5CE7A 
X-CRM114-Status: GOOD (  14.60  )
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

From: Nickolai Zeldovich <nickolai.zeldovich@gmail.com>

Non-boot harts exit _wait_for_boot_hart on a plain load of _boot_status
and go on to read platform.hart_index2id and other data the boot hart
relocated before publishing.  Nothing orders those loads after the
status load, so under RVWMO a hart can read the unrelocated pointer and
fault through it before mtvec is set.

Pair the boot hart's release fence with a "fence r, rw" after the loop.

Signed-off-by: Nickolai Zeldovich <nickolai.zeldovich@gmail.com>
Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
---
This bug was found in the process of formally verifying the correctness
of OpenSBI on top of the Sail RISC-V semantics using Lean.

Summary:

Non-boot harts leave _wait_for_boot_hart on a plain load of _boot_status
and immediately read data the boot hart produced before publishing.
Nothing on the waiting side orders that load before the later loads.
Under RVWMO a waiter can observe the "done" status and still read pre-
relocation values, including the unrelocated platform.hart_index2id
pointer, and fault through it before mtvec is set. One fence r, rw after
the loop closes it.

An execution that triggers it:

Setup: fw_dynamic loaded at an address different from its link address,
so the boot hart runs the self-relocation pass; eight harts; RVWMO
hardware (or any model that lets a plain load be satisfied early, e.g.
the Sail/MachCSL model used to find this).

1. Hart 1 reaches _wait_for_boot_hart while hart 0 is still relocating.
   Hart 1's loop body is ld t1, _boot_status; div; div; div; bne. Its
   load of _boot_status returns the pre-done value, it loops.
2. Hart 1's core speculatively issues the *next* iteration's loads
   early. RVWMO allows a later load to be performed before an earlier
   load to a different address when nothing orders them. In particular
   the loads that follow the loop exit, lwu platform.hart_count, ld
   platform.hart_index2id, may be satisfied now, from memory that hart 0
   has not yet rewritten: platform.hart_index2id still holds its link-
   time value 0x449f8.
3. Hart 0 finishes: it fixes up platform.hart_index2id to 0x800449f8 via
   the R_RISCV_RELATIVE pass, executes fence rw, rw, stores _boot_status
   = BOOT_STATUS_BOOT_HART_DONE.
4. Hart 1's loop load now returns DONE, the bne falls through. The
   already-performed load of platform.hart_index2id is not re-executed:
   s9 = 0x449f8.
5. Hart 1 executes lwu a5, 0(s9): a load from 0x449f8, which is outside
   every PMA region on the virt platform. The access faults.
6. Hart 1 has not yet executed _start_warm's csrw mtvec; mtvec holds its
   reset value. The trap vectors to an undefined address and the hart is
   lost. The system boots with 7 harts, or hangs in smp_init waiting for
   it.

The release on the boot hart (fence rw, rw before the status store) is
correct; the bug is the missing acquire on the waiting side. The fence
added here sits *after* the loop and runs once per hart. A 2019 attempt
placed a fence rw, rw inside the loop before the load (05602e2bf481) and
was reverted (69d794cbcbab) after a warm-reset regression on the HiFive
Unleashed whose root cause was never found; that fence did not provide
the needed ordering anyway.

Verification:

Proved: with the fence, the non-boot harts' path from _start to
_start_warm satisfies its contract against the Sail RISC-V model under
an RVWMO-faithful memory model. Without the fence the stale read is an
allowed execution and the contract is unprovable.

firmware/fw_base.S | 11 +++++++++++ 1 file changed, 11 insertions(+)

FYI, the same change is also filed as GitHub pull request #429:
https://github.com/riscv-software-src/opensbi/pull/429

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index a76ddc1b..294787a2 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -407,6 +407,17 @@ _wait_for_boot_hart:
 	div	t2, t2, zero
 	div	t2, t2, zero
 	bne	t0, t1, _wait_for_boot_hart
+	/*
+	 * Acquire: order the _boot_status load above before every later
+	 * load (platform.hart_count, platform.hart_index2id, the scratch
+	 * space, ...).  The boot hart publishes with "fence rw, rw" before
+	 * its store to _boot_status, but without a matching acquire here
+	 * RVWMO lets a waiting hart that saw BOOT_STATUS_BOOT_HART_DONE
+	 * still read pre-relocation values, e.g. the unrelocated
+	 * platform.hart_index2id pointer, and fault through it before
+	 * mtvec is set.
+	 */
+	fence	r, rw
 
 _start_warm:
 	/* Reset all registers except ra, a0, a1, a2, a3 and a4 for non-boot HART */
-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
