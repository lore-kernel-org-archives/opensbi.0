Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5294CA9ECF
	for <opensbi@archiver.kernel.org>; Sun, 11 Oct 2026 22:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sJyOTAFtA853vQ6U/xpVOdsYL4CVC7TxVLecYb7yGs8=; b=YmppllgwQDc76x
	jTAxD+lJ/Ggxz3J3xRN8XAy5eloVsjQXzTdaUigjwjAbe/jRHndkAy6YOAXAhIgjekRG/Ad4l5oLn
	BweGTs5vtBbGnNFIEe9PqCRz92yTgXwdkBrAZOBYBhifiiAjS1jKIF9yicVg2VBTOWKR7PpcT/Bhk
	cTztjxCydyve1PAk3kQnfYyG8mnF2k6IP7qlo5OjoqXOUNwxBMW4kz3V5G4xOmRmluVhW6+y5KNtc
	rfx7I+3fQzqzAVQglKUb2Pv+KUhcOXZixeiv7HzbclSPEwXtQEo6uF2SvKlwag8VjWsFHOBcza3xg
	Xe8C4f/zhTIuphyD3BrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1xs-00000009SZD-0o3U;
	Sun, 11 Oct 2026 22:24:20 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1xm-00000009SYn-0rXu
	for opensbi@lists.infradead.org;
	Sun, 11 Oct 2026 22:24:18 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xG1xl-00Bxgn-0s;
	Sun, 11 Oct 2026 18:24:13 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH] lib: sbi_timer: Insert timer event before the later event
Date: Sun, 11 Oct 2026 18:24:12 -0400
Message-ID: <20261011222412.769530-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152414_251557_17B1ECB0 
X-CRM114-Status: GOOD (  18.69  )
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

The per-HART event list is kept sorted by expiry time: the head is the
event programmed into the timer device by __sbi_timer_update_device(),
and sbi_timer_process() stops at the first unexpired entry.

__sbi_timer_event_start() finds the first event that expires after the
new one, but then inserts the new event with sbi_list_add(), i.e. after
that event instead of before it.  Starting an event at time 50 while an
event at time 1000 is pending yields the list [1000, 50]: the device is
programmed for 1000 and the earlier event fires 950 ticks late.

Today each HART only ever has its S-mode timer event on the list, so
the misordering needs a second timer event user to show up.  Once there
is one, on HARTs without Sstc an S-mode timer programmed while a later
M-mode event is pending is delivered only when that later event
expires.

Use sbi_list_add_tail() so the new event goes in front of next_ev.

Fixes: b7fa8a246cba ("lib: sbi_timer: Add support for timer events")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
---
This bug was found in the process of formally verifying the correctness
of OpenSBI on top of the Sail RISC-V semantics using Lean.

__sbi_timer_event_start() walks event_list for the first tev with
next_event < tev->time_stamp and then calls
sbi_list_add(&ev->head, &next_ev->head), which links ev after next_ev
(__sbi_list_add(new, head, head->next)).  Every later consumer assumes
the list is sorted: __sbi_timer_update_device() programs the head's
time_stamp and sbi_timer_process() breaks at the first unexpired head.
With [A@1000] pending, starting B@50 gives [A@1000, B@50], so B fires
at 1000.  Inserting at the tail when no later event exists was already
correct.

In-tree each HART has only smode_ev on its list (and
sbi_timer_event_start() unlinks an event before re-inserting it), so
the list never has two entries today.  The proposed SBI watchdog
extension (Prajwal N, "[PATCH 3/4] lib: sbi: Add SBI watchdog
framework", 2026-10-02) adds two more per-HART events; on a HART
without Sstc, an S-mode timer set while the watchdog event is pending
would then be delayed until the watchdog event expires.

This is independent of Pengpeng Hou's pending "lib: sbi_timer: Restart
events from the restart list" (2026-08-31), which fixes the restart
loop in sbi_timer_process(); the two patches touch different hunks and
apply in either order.  Re-armed events go through the same insertion,
so they need both.

Testing:
- make PLATFORM=generic LLVM=1 PLATFORM_RISCV_XLEN=64: builds, no
  warnings (also with Pengpeng Hou's patch applied on top).
- PLATFORM_RISCV_XLEN=32 (rv32imac_zicsr_zifencei/ilp32): sbi_timer.o
  builds without warnings; the full rv32 build stops in
  lib/sbi/sbi_trap_ldst.c (-Wsometimes-uninitialized on 'val'), which
  fails the same way on unpatched master.
- Userspace harness: include/sbi/sbi_list.h plus copies of
  __sbi_timer_event_start(), __sbi_timer_event_stop() and
  sbi_timer_process() with stubs.  Starting 50 while 1000 is pending:
  master gives [1000, 50], patched gives [50, 1000].  A callback
  re-arming at 110 with an event pending at 1000: with only the
  restart-list fix the result is [1000, 110], with both [110, 1000].
- Not run on QEMU or hardware.  To see it there, start two M-mode timer
  events on one HART, the later one first, e.g. from a platform
  final_init on a non-Sstc CPU (qemu-system-riscv64 -M virt
  -cpu rv64,sstc=off): sbi_timer_event_start(&a, now + 10 * freq);
  sbi_timer_event_start(&b, now + freq); b's callback runs after 10 s
  on master and after 1 s with this patch.

 lib/sbi/sbi_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 78aaa32e..1f13a3b1 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -205,7 +205,7 @@ static void __sbi_timer_event_start(struct timer_state *tstate,
 	ev->hart_index = current_hartindex();
 	ev->time_stamp = next_event;
 	if (next_ev)
-		sbi_list_add(&ev->head, &next_ev->head);
+		sbi_list_add_tail(&ev->head, &next_ev->head);
 	else
 		sbi_list_add_tail(&ev->head, &tstate->event_list);
 }

base-commit: 6ad246a1494807ee91e36ffcf60e4c30bb309d45
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
