Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB86AC79FB7
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2vZ4RIeBo73JWq5MxEakBXsoTo5InbknJheCs0qr6E=; b=hsyPIvSPAfTmIf
	8j5ozh7KEJi6zcDKzPAYVTW2eL2LFrbDBbOs/ccdJnez70pDh5t58zp1uyu6lQe022uDuTDwWlUdm
	ja9OkR6zd0U3rZJJqEsS3d4bA1FTHATVQUmww6FOOTTizppZY1Fk+/RNOKbBPVz9hAlRei/Q3Cb3B
	6NNbwsnqtxM5Eky+fTHIH2fZzCnw0A8ICAwviIkGgjoRZyr1PfiLA/YUI7dcOdO0nG/7VA0PEaZlr
	FeEQIeosfr5vEbKLOH2T23RbHz9CKFdqwTbejsAhEfpdS+CzpybUMtwjHuK91bw0m3Ci7C1mUiQZO
	GzMdWbjH0VJkCbpS+M0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMU-0000000DRj8-15QT;
	Thu, 10 Sep 2026 05:30:14 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XMP-0000000DRhQ-49Tv
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:30:13 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHUT9fQKJq9rRPBw--.30051S2;
	Thu, 10 Sep 2026 13:30:07 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	david.garcia@aheadcomputing.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR and SSE
Date: Thu, 10 Sep 2026 05:29:55 +0000
Message-Id: <20260910052958.3365324-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHUT9fQKJq9rRPBw--.30051S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary5AFyrWFWkKr15tw1rtFb_yoW8Kw1rpr
	WfK3W3Kws7tr97trZ3ua1UXa4rWan3XryDJF9Iyr1kC3yYyryxArWSg3Wru34xCr93GF4U
	t3Z0qrZ7ua1DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1SdgJUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_223010_403650_3C17688B 
X-CRM114-Status: GOOD (  12.38  )
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

M-mode validates a request held in S-mode shared memory and then reads
that same memory again in order to act on it. S-mode may rewrite the
memory in between, so the values programmed into M-mode state are not
necessarily the values that were validated.

  - sbi_dbtr_install_trig() re-reads each entry in three passes
  - sbi_dbtr_update_trig() re-reads each entry four times
  - sse_write_attrs() re-reads the attributes in a check pass and again
    in an apply pass

Each is fixed by copying the request once and making every later
decision against that copy.

Himanshu pointed out on v2 that the install_trig patch was written
against a shape of the function that no longer exists upstream: the
per-slot capability matching and the dry-run slot allocation added
since then re-read shared memory independently, so the race was still
open. That patch is reworked here against current master, with the
copy threaded through those paths.

The other half of the previous six patch series, three integer overflow
fixes and one unmap fix, is sent separately as "[PATCH v3 0/4] lib:
sbi: fix integer overflows in shared memory bounds checks". Both halves
apply to master in either order.

Changes in v3:
- Rebased onto current master
- Split out of the previous six patch series
- Subject prefixes changed to "lib: sbi: dbtr:" and "lib: sbi: sse:" to
  match the rest of those files' history
- 1/3: reworked, see the patch for details
- 2/3: new in v3
- 3/3: added a bound check inside sse_write_attrs()
- Dropped the DBTR shared memory range check that was v2 3/6. Pengpeng
  Hou sent the same fix in "lib: sbi: dbtr: validate complete shared
  memory range", which already carries a Reviewed-by. Note that
  Himanshu's remark on v2 3/6, that the "dom &&" guard skips the check
  entirely when dom is NULL, applies to that patch as well and is left
  to its thread.
- Link to v2: https://lore.kernel.org/opensbi/20260731103405.1535818-1-liutong@iscas.ac.cn/

liutong (3):
  lib: sbi: dbtr: fix shared memory double-fetch in install_trig
  lib: sbi: dbtr: fix shared memory double-fetch in update_trig
  lib: sbi: sse: fix shared memory double-fetch in sse_write_attrs

 lib/sbi/sbi_dbtr.c | 226 +++++++++++++++++++++++++++------------------
 lib/sbi/sbi_sse.c  |  26 ++++--
 2 files changed, 158 insertions(+), 94 deletions(-)


base-commit: 3593a5facc4c6938b90429a6973ba9ee21fc5899
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
