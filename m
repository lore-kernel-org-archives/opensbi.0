Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059AE606A32F
	for <opensbi@archiver.kernel.org>; Thu, 19 Nov 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qPYOz97e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i7Z5Hmi/YrBXNbVueGD7GTspm1A1t0MpwUHTsdZK+bw=; b=qPYOz97eKerq40w8kbFy91HGNs
	yi2EacIpu97bs1+A7kKr+8V8Gn5inR+QkVUM9nlJNGk4BkWasqSsDjM0fNaYpTZSz6xMxSlcV+7sT
	IagHrxh48frNIqfuhMrZZ4+X8uXF8rDVRftYRlgDLVW3FqLuG2sExo9BMNz6NGOr0gIevWjD+8hrT
	qC7OWDLHZMFjAuDQCCEPiD3pepgQ3+o27RfPTdv0zs+gTfzS45j44DvscmRpL/7to0uC8ZttLEt3F
	KrvfZjrJRWtR+jOszoy2j/DGG6isoxsCGpKS8b7hAhGRDvpQR/NnfzqPpds7XDk6zVYVzLcTDCI4N
	ZDvD3GAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4U1-0000000CYEC-39jJ;
	Thu, 19 Nov 2026 15:55:33 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Tz-0000000CYBz-1XiN
	for opensbi@lists.infradead.org;
	Thu, 19 Nov 2026 15:55:33 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXtLntG_9qqWB5AQ--.937S4;
	Thu, 19 Nov 2026 23:55:26 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	himanshu.chauhan@oss.qualcomm.com,
	sebasjosue84@gmail.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH 2/2] lib: sbi: pmp: do not grant a NAPOT block outside the caller's range
Date: Thu, 19 Nov 2026 15:55:11 +0000
Message-Id: <20261119155511.1204901-3-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119155511.1204901-1-liutong@iscas.ac.cn>
References: <20261119155511.1204901-1-liutong@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXtLntG_9qqWB5AQ--.937S4
X-Coremail-Antispam: 1UD129KBjvJXoWxur48ArWrtFykKFW5uFykXwb_yoW5Ww1UpF
	W5JFyqyw4v9FWxXa43Jw4kXF1rCa1IqFZrJrW7G34vya15Xr1fCrZxtryj9F12kFyFya4r
	ZF4qyFsru3WqqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUrmiiDUUUU
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_075531_801237_4F66EFE3 
X-CRM114-Status: GOOD (  15.01  )
X-Spam-Score: -1.9 (-)
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

sbi_hart_smepmp_temp_map_range() grows the PMP order until one naturally
aligned block contains the requested range. The block is aligned down,
so it can extend below the range the caller validated, and nothing
checks the result.

The entry has the lowest index, which gives it the highest priority, and
it is programmed with the Smepmp shared-data encoding, which grants
execute permission to no mode. A block that reaches the firmware
therefore takes M-mode's execute permission on its own text away, and
the hart faults on the next instruction fetch. mtvec points into the
same text, so the trap entry faults as well and the hart stops without
a diagnostic.

Both the base and the size come from the caller. A size of zero is a
legal request that makes addr + size - 1 wrap and forces a block below
addr, so return early for it rather than declining it.

Reject a block that is not entirely within what S-mode may access.

Fixes: 6e44ef686a9b ("lib: sbi: Add functions to map/unmap shared memory")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 lib/sbi/sbi_hart_pmp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index c530739f..578b13df 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -23,7 +23,7 @@ static int hart_pmp_read(pmp_t *pmp, unsigned int n)
 
 	/* check parameters */
 	if (n >= PMP_COUNT)
-		return SBI_EINVAL;
+		return SBI_EFAIL;
 
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
@@ -51,7 +51,7 @@ static int hart_pmp_write(pmp_t *pmp, unsigned int n)
 
 	/* check parameters */
 	if (n >= PMP_COUNT)
-		return SBI_EINVAL;
+		return SBI_EFAIL;
 
 	/* calculate PMP register and offset */
 #if __riscv_xlen == 32
@@ -337,6 +337,10 @@ static int sbi_hart_smepmp_temp_map_range(struct sbi_scratch *scratch,
 	if (sbi_hart_is_pmp_enabled(SBI_SMEPMP_RESV_ENTRY))
 		return SBI_ENOSPC;
 
+	/* An empty range needs no entry, and addr + size - 1 would wrap. */
+	if (!size)
+		return SBI_OK;
+
 	for (order = MAX(sbi_hart_pmp_log2gran(scratch), log2roundup(size));
 	     order <= __riscv_xlen; order++) {
 		if (order < __riscv_xlen) {
@@ -351,6 +355,17 @@ static int sbi_hart_smepmp_temp_map_range(struct sbi_scratch *scratch,
 		}
 	}
 
+	/*
+	 * The block is aligned down, so it can reach below the range the
+	 * caller validated. It is programmed into the lowest numbered PMP
+	 * entry and carries no execute permission, so a block that covers
+	 * the firmware revokes M-mode's access to its own text.
+	 */
+	if (!sbi_domain_check_addr_range(sbi_domain_thishart_ptr(), base,
+					 1UL << order, PRV_S,
+					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
+		return SBI_EFAIL;
+
 	sbi_platform_pmp_set(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY,
 			     SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW,
 			     pmp_flags, base, order);
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
