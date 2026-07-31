Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5E3C54F54
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 10:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O34CjVppCDI4XOHJ4uchofuXAHSjojRnA9W4vrp6rZY=; b=Ax9jAsrk9VbjkB
	bMYcOE5xpwVOxrAtIyWvV8pjMSoqb2ap+BqSiZ3oG4/rq31B9WzqVa7DWmnvwtbru/wvgbd1FTVpe
	AfrHRZw7KXNMzolwyKUn6Zs58fB1tt9O4+7Z5oPTS3iKZh8FfV1fJhjW/JY1R5D5LychhtskdDyG+
	4Jk/BXskJ9pSS0tJpFAECos4VWMO338ofBqjg6oPS+Qkp/fUfttWSptDKTY6mRXQRvpIv8hM3kEZH
	ByVqryoDFvXRIkjeNkiqkzAUpVtDnhh5/iuFMBqiBTytRg9DIBAXqhhrNnG2dOlU/52f7wotPnSIc
	M5/nbCDe5VDy2xNNzETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZM-0000000CKKP-14wt;
	Fri, 31 Jul 2026 10:34:24 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZH-0000000CKJh-1lK4
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 10:34:21 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8nemxqJmmDAg--.64576S2;
	Fri, 31 Jul 2026 18:34:15 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul@summations.net>,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2 0/6] Fix input validation issues in SBI ecall handlers
Date: Fri, 31 Jul 2026 10:33:59 +0000
Message-Id: <20260731103405.1535818-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXq+8nemxqJmmDAg--.64576S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trW3Jw4xXry7WF45Ar4ktFb_yoW8Ar45pr
	WSgay3G3y8tryxArZ3Aa1rXF1Fqw48WayUJF9xArykAa4fAF1rury0g3yFy34xJryDWr47
	KF1DJF9ruF1Uu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUBBT5UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_033419_826634_BFA1B992 
X-CRM114-Status: UNSURE (   6.44  )
X-CRM114-Notice: Please train this message.
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

This series fixes input validation and shared memory handling issues
found across multiple SBI extension handlers: DBTR, PMU, SSE, and MPXY.

The fixes fall into three categories:

1. Integer overflow in bounds checks (patches 1, 4, 6)
   Arithmetic overflow in endpoint calculations allows out-of-bounds
   access from S-mode via crafted ecall parameters.

2. TOCTOU / double-fetch from shared memory (patches 2, 5)
   S-mode shared memory is read twice --once to validate, once to apply.
   S-mode can modify the memory between reads, bypassing M-mode
   validation.

3. Insufficient address range validation (patch 3)
   Single-address domain check does not cover the full shared memory
   region, allowing cross-domain access.

These patches were previously sent individually. Per reviewer feedback,
they are now consolidated into a single series.

Changes in v2:
- Reorganized as a unified patch series (per Rahul Pathak's suggestion)
- All patches now include Fixes tags
- install_trig: fixed rollback to also cover SBI_ERR_NOT_SUPPORTED path

liutong (6):
  lib: sbi_dbtr: fix integer overflow in read_trig bounds check
  lib: sbi_dbtr: fix shared memory double-fetch in install_trig
  lib: sbi_dbtr: use range check for shared memory domain validation
  lib: sbi_pmu: fix integer overflow and zero-address in event_get_info
  lib: sbi_sse: fix shared memory double-fetch in sse_write_attrs
  lib: sbi_mpxy: fix integer overflow in attribute range endpoint

 lib/sbi/sbi_dbtr.c | 91 +++++++++++++++++++++++-----------------------
 lib/sbi/sbi_mpxy.c |  6 ++-
 lib/sbi/sbi_pmu.c  | 10 ++++-
 lib/sbi/sbi_sse.c  | 14 ++++---
 4 files changed, 66 insertions(+), 55 deletions(-)

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
