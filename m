Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BADC88E41
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CmsV+/VI5XMgs4CRSVp5Ru9FCfl82Z3s5HSjlQ+ctoI=; b=1Gvb33SigkuIxX
	NbXpKILfggU/euKkHMRZa6ZGu3uok77qzmIC8wSg8iLL0qnCjUu3rvxGgtg2tBGPizBzmI2ytKMh5
	Wp8tCtisf7sqCxVZipmHhlhkAy9nGhiqKU1jhzs/m/ZVV3fZ+CH3F4hz7BU0AJnz1tAWddS5Sk6uB
	kdR3kd46sBvd/Mw1u3I1KAuL8IdVklYwnr0VTYVbTYiAqjeqonIV4IVHBlbJ3bUEOBkA57R9uBfrE
	YhUPA4lCeBOqFQxyWSrZHrBWFZ+UpJhMjRCuprOJ6L2gfDJ3L9QIo089L6s4IoA1tBzEU0HNwJ9Rb
	AoXrPdWQe14hAyN3lRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJ9-0000000DRHJ-2Mdr;
	Thu, 10 Sep 2026 05:26:47 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJ5-0000000DRFO-2bOX
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:26:46 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjyOP6Jq6atPBw--.40145S2;
	Thu, 10 Sep 2026 13:26:38 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 0/4] lib: sbi: fix integer overflows in shared memory bounds checks
Date: Thu, 10 Sep 2026 05:26:25 +0000
Message-Id: <20260910052629.3359493-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHTjyOP6Jq6atPBw--.40145S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWkAr4fAw4xtw15Gw13XFb_yoW8tr13pF
	43Kas8tws7tr97KrZ3ZF1UJ3W8ZayrKrs8GFyIk34Uu3y5JryxZrWrGF4Yq3y0kFykCFW7
	t3WDt397Aa1DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUFZXoUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222644_030606_6AE0B4D3 
X-CRM114-Status: GOOD (  12.37  )
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

Patches 1, 2 and 4 share one root cause: a length or index supplied by
S-mode is combined with another value before being range checked, so the
arithmetic can wrap and the check then accepts a request that is out of
range.

  - sbi_dbtr_read_trig() adds trig_idx_base + trig_count
  - sbi_pmu_event_get_info() multiplies num_events by the entry size
  - sbi_mpxy_read_attrs()/write_attrs() add base_attr_id + attr_count
    as u32

Patch 3 is not an overflow, but it is in the function patch 2 touches:
the reserved-event_idx path added in d97cfb33 returns without unmapping
the shared memory it just mapped.

These were previously sent as part of a single six patch series. They
are split out here because the other three patches address shared
memory double-fetches in DBTR and SSE and need more discussion, while
these are small and independent. The other half is sent separately as
"[PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR and
SSE". Both halves apply to master in either order.

Changes in v3:
- Rebased onto current master
- Split out of the previous six patch series
- 1/4: only the surrounding context changed, the fix itself is
  byte-identical to v2, so the Reviewed-by is carried over. Subject
  prefix changed to "lib: sbi: dbtr:" to match the rest of the file's
  history.
- 2/4: rebased; commit message reworded
- 3/4: new, and unrelated to v2
- 4/4: rebased. Commit message rewritten: v2 described the standard
  attribute range guard, but that one is not reachable with a wrapping
  endpoint. The affected guard is the message protocol one.
- Link to v2: https://lore.kernel.org/opensbi/20260731103405.1535818-1-liutong@iscas.ac.cn/

liutong (4):
  lib: sbi: dbtr: fix integer overflow in read_trig bounds check
  lib: sbi_pmu: fix integer overflow and zero-address in event_get_info
  lib: sbi_pmu: unmap shared memory on the reserved event_idx path
  lib: sbi_mpxy: fix integer overflow in attribute range endpoint

 lib/sbi/sbi_dbtr.c |  2 +-
 lib/sbi/sbi_mpxy.c |  6 ++++--
 lib/sbi/sbi_pmu.c  | 15 +++++++++++++--
 3 files changed, 18 insertions(+), 5 deletions(-)


base-commit: 3593a5facc4c6938b90429a6973ba9ee21fc5899
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
