Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB90C88E40
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UMsyDJ8iZxZb29/UddKcXyqtAtj7nu3M64AlOeSsOI=; b=i1pYqb5JwkpAgx
	g4R4kZ1a0ExsVRKUMgLWyB4wem9yfnSHCmU2F3hHYRHeoXnR7uhaujLVfwI1kbe5cb6MPy52KBhqM
	ZVO4fFbwiftpYXiRvsLGqFbmTGpy/De0jRjj8MT221PbwhOiMkYRl3ORVL2PmngZm15dVEDfcMmeD
	BqQrLizfl5QwwybP03vQZPXlL7iqn826pmpIqxFDukCKg/Ce+wBISWEU5X1BUohLw8F4ldPd9A7kU
	vG/92cMA7bYNFwlpD9ypbo1g3p2sBQgUXfsWkQ//VdM+7Qw6vBuLK9e97WPd6ciRMXLeU4hk6S2v5
	SnYgJOaCaUYh7VSutkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJ9-0000000DRHE-1zKN;
	Thu, 10 Sep 2026 05:26:47 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJ5-0000000DRFQ-2YH2
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:26:46 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjyOP6Jq6atPBw--.40145S4;
	Thu, 10 Sep 2026 13:26:39 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 2/4] lib: sbi_pmu: fix integer overflow and zero-address in event_get_info
Date: Thu, 10 Sep 2026 05:26:27 +0000
Message-Id: <20260910052629.3359493-3-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910052629.3359493-1-liutong@iscas.ac.cn>
References: <20260910052629.3359493-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHTjyOP6Jq6atPBw--.40145S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW5Kr4ruw18Jw45GF47twb_yoW8uF1UpF
	4rKas8tw40q342gasrXw1xXas8Ja18G3WDKFW7tryFyF4fWr1fXFs8t3s0yrW5Ar95u3W2
	yayjkF47CFy5ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUuOJ5UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222644_030538_BBED3FBB 
X-CRM114-Status: GOOD (  11.51  )
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

sbi_pmu_event_get_info() computes the shared memory size as
num_events * sizeof(struct sbi_pmu_event_info) before num_events is
validated. The product can wrap, in which case the domain check runs
against a truncated size while the loop below still iterates over the
original count, that is, past the region that was checked.

A shmem_phys_lo of zero is also accepted, which leaves the loop writing
at address 0.

Check num_events against the largest value that cannot wrap, and reject
a zero address, both before the multiplication.

Fixes: e4345842168b ("lib: sbi_pmu: Implement SBI PMU event info function")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
Previously sent as [PATCH v2 4/6].

Changes in v3:
- Rebased onto current master
- Commit message reworded; the code is unchanged from v2
- Split into this series

 lib/sbi/sbi_pmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e79f6b60..54da5c24 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1074,7 +1074,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
 			   unsigned long num_events, unsigned long flags)
 {
-	unsigned long shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
+	unsigned long shmem_size;
 	int i, j, event_type;
 	struct sbi_pmu_event_info *einfo;
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
@@ -1089,6 +1089,14 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 	if (!num_events || (shmem_phys_lo & 0xF))
 		return SBI_ERR_INVALID_PARAM;
 
+	if (!shmem_phys_lo)
+		return SBI_ERR_INVALID_ADDRESS;
+
+	if (num_events > ((unsigned long)-1) / sizeof(struct sbi_pmu_event_info))
+		return SBI_ERR_INVALID_PARAM;
+
+	shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
+
 	/*
 	 * On RV32, the M-mode can only access the first 4GB of
 	 * the physical address space because M-mode does not have
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
