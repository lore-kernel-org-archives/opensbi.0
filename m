Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F7E9A77D
	for <opensbi@archiver.kernel.org>; Tue, 24 Mar 2026 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWMsVNrvxjrL2n6hRpajp3SSowoqIiTuD+DONt0ZSAU=; b=LnOwNlowSwFzfz
	q5WOMY8lYeTnoV2c9fSMOvhoixXxU5SRdHHqRpq+DAAgoimk6RLRTbWeLEjviSz5WbsKvZHZV6vR6
	x0rTflId1Jx4zsI49AGfkqExyXmxKVzFHwdA9DBJBPA2gZ7wWOU5YSnH80z2KK0Mqztu4EKQ0fmuX
	1XTXl0Dkcf9QCBKYyez2nTQJiW8zcy9sx8cRSfd4Ziwao8KcHgkx6ySz78+9hhTlSmnLrC8pCDZmS
	NJX4OZJseTqHO5fKrV/4QEcnCFrHRGh4jK/vYL4VBje8+9jP8idEeDXG0QUsB0vstgqxASgCoNyjt
	5bVoqQaXLoIgVuNRDvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50t5-00000001NSv-3dVd;
	Tue, 24 Mar 2026 12:29:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50t3-00000001NSZ-3lwf
	for opensbi@lists.infradead.org;
	Tue, 24 Mar 2026 12:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D63A343B44
	for <opensbi@lists.infradead.org>; Tue, 24 Mar 2026 12:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586E5C19424;
	Tue, 24 Mar 2026 12:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774355372;
	bh=KKlGdHKai4+yhExzJqw8hv128K7JLXzmnoypwOm80Oc=;
	h=From:Date:Subject:To:Cc:From;
	b=CW4v1+3XVj0moj7OkutyFQh98MURTQ5/jmP0U068NdYv1zRyupB5wRbje9708Qwy5
	 1QKgavpY9MbAn0MJ3nV3C1ZxP2aKgrgsPD+H4HxBNhBlVfh8aVxveRO1aYaK1Ldrzl
	 2/m1W++EYlNG2tZeQlI239viIdfWdlkzbnNrrmIFAW9oaKpEHMs7sjp5QuXjYnKDRu
	 K8t6dI8nCNv+zQGdAK5IGbPYLAgWqh3FTp8SgbtMgx3BXX0CWcTux1cTYfmwlZ6ZR+
	 OJnEI/Nzk6i7lfbiI0tB4e7wYhv0vyfpax8ModmhPhmRtNvmum93i6DU/N4/RD0WJV
	 e7/wk9d0TkfLg==
From: Michael Ellerman <mpe@kernel.org>
Date: Tue, 24 Mar 2026 23:29:20 +1100
Subject: [PATCH] lib/sbi_pmu: Don't fallback to fixed counters when
 sscofpmf && !smcntrpmf
MIME-Version: 1.0
Message-Id: <20260324-mcycle-fix-v1-1-1444e9fe5c32@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ+DwmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMT3dzkyuScVN20zApd47RkUzMLo9TUVMtkJaCGgqJUoDDYsOjY2lo
 AzaE0R1wAAAA=
X-Change-ID: 20260324-mcycle-fix-3fc5682eee9c
To: opensbi@lists.infradead.org
Cc: Michael Ellerman <mpe@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_052933_999752_61611C24 
X-CRM114-Status: GOOD (  15.61  )
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

Currently when searching for a hardware counter for an event, if no
programmable counter is available, the code falls back to using a fixed
counter (mcycle/minstret) if one matches the event.

However the fallback is incorrect when sscofpmf is present but
smcntrpmf is not. That's because with sscofpmf, programmable counters
support mode filtering, but the fixed counters do not (without
smcntrpmf). Even if the caller didn't configure mode filtering, by
default programmable counters don't count M mode when sscofpmf is
present, whereas mcycle/minstret do.

Fix the logic to not fallback to a fixed counter if sscofpmf is present
but smcntrpmf is not.

Signed-off-by: Michael Ellerman <mpe@kernel.org>
---
Hi folks,

I noticed this while testing Linux perf with more events than
programmable counters.

Sometimes cycles gets counted using a mhpmcounter, and sometimes with
mcycle, and the cycle count differs between the two.

The count differs because mcycle doesn't support filtering when
smcntrpmf is not present.

It can be reproduced by running perf stat and specifying `cycles:u` N+1
times where N is the number of mhpmcounters, eg:

    $ perf stat -e cycles:u,cycles:u,... 
    ...
                392860      cycles:u
              61101120      cycles:u

The first cycles got an mhpmcounter and only counted userspace cycles.
The second used mcycle and counted everything.

cheers
---
 lib/sbi/sbi_pmu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index ae00ad5844b1fe92a8eebfb618902a5eef218a9e..8a9021e2e5bac2d71a0f07d3f81600ff370ee2fc 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -830,13 +830,20 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
 
 	if (ctr_idx == SBI_ENOTSUPP) {
 		/**
-		 * We can't find any programmable counters for cycle/instret.
-		 * Return the fixed counter as they are mandatory anyways.
+		 * We can't find a programmable counter, see if we can use a
+		 * fixed counter instead if one was found for this event.
+		 *
+		 * If sscofpmf is present but smcntrpmf is not, we can't
+		 * fallback to a fixed counter, because the fixed counter
+		 * doesn't support filtering whereas a programmable counter
+		 * would.
 		 */
-		if (fixed_ctr >= 0)
-			return pmu_fixed_ctr_update_inhibit_bits(fixed_ctr, flags);
-		else
+		if (fixed_ctr < 0 ||
+		    ((sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF) &&
+		      !sbi_hart_has_extension(scratch, SBI_HART_EXT_SMCNTRPMF))))
 			return SBI_EFAIL;
+
+		return pmu_fixed_ctr_update_inhibit_bits(fixed_ctr, flags);
 	}
 	ret = pmu_update_hw_mhpmevent(temp, ctr_idx, flags, event_idx, data);
 

---
base-commit: 4813a2042096b7860655761aad973723293a552e
change-id: 20260324-mcycle-fix-3fc5682eee9c


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
