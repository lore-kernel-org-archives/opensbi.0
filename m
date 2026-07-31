Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81663C55172
	for <opensbi@archiver.kernel.org>; Fri, 31 Jul 2026 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/n29tUWm7kj1sqXQCL51h9iefsHHbP+BejNnZN+Y0w=; b=D+a164d7UegORc
	taOxzIR5rC1b0Z1SEqWf5T+cggh+k6dgcNU0T2gbfAq3LSXCo9qj+Dx4PndIEKHdYSSi6AF3AsX8Q
	y3PoL1dcASn9FNmwaBpfa9ylamciTYZtYq06pqldUrL9qCJwHRnSpX2Ca5fB9Hw7lQvAmLhaRgaWA
	UywX9JNUWTl4pbjmEXCm+PD9Q8aKPEqtriX/Lg7zBzkvis7S7tpL4BqCbZBrptnXZV7UVaHB0n3QU
	QK3sRNu+M7sqW9doe6/MPBcucN2sDf8ZlIDsOTddD7Hd/sO+xUzOF0enGm3l0Le08vKmeJU2Y3k6j
	CYEPA5giqYjrOhIPM5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZS-0000000CKLz-2hNf;
	Fri, 31 Jul 2026 10:34:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkZR-0000000CKLE-1WGe
	for opensbi@bombadil.infradead.org;
	Fri, 31 Jul 2026 10:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v+ydODw+jaTtDAiGieR6M4bmtdJPM/BYVzmHFkbq+tA=; b=UTwPWIBTo30VLwqE2kTnjtJQzi
	uKTLGfTYBbyCr6IT7+o4taBDJaWbXA+7D2b37uk0ZgkHK+QQ7PhBr/eo8Ypv2buEWQrl8+euN1YvD
	xAbvUtQ8aalKix9gZM6/oP6bKH/rSI12IcISvWzdrnIgPCYSbjZvak7eMHPNZi4EaeQex6XXXAhH7
	2OnItOb/BG032UD52jF+V/mDfOpAtVtHxzwBE/mPMwy/NNyp/acw3M8uH7cntGJWGn9nHucMxTtNP
	a0CsemRaR8SwBKdIf7fG/l6A8r0BNjRQX3a/Dpx3fO4LRGl9teUUVKtxuCw2lK+wzJe2sveYEujnS
	t70wRCHw==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpkZM-00000007Nu4-21n9
	for opensbi@lists.infradead.org;
	Fri, 31 Jul 2026 10:34:28 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADXq+8nemxqJmmDAg--.64576S6;
	Fri, 31 Jul 2026 18:34:16 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Rahul Pathak <rahul@summations.net>,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v2 4/6] lib: sbi_pmu: fix integer overflow and zero-address in event_get_info
Date: Fri, 31 Jul 2026 10:34:03 +0000
Message-Id: <20260731103405.1535818-5-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731103405.1535818-1-liutong@iscas.ac.cn>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXq+8nemxqJmmDAg--.64576S6
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWrJF1kKrWkXw48Zr17Awb_yoW8urWkpF
	4rKa9xtr48t342gasrZw18Xa4rJa18G3WDKFW7try0yF43WFy8ZF4Dt3sIyr4rArykuFy2
	yayjyF4jka45ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
	owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj4xRDUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_113425_143016_4250B010 
X-CRM114-Status: GOOD (  10.49  )
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
num_events * sizeof(struct sbi_pmu_event_info) without checking for
integer overflow. A sufficiently large num_events causes the product to
wrap around, making the domain check pass on a truncated size while the
loop iterates with the original count.

This allows S-mode to trigger out-of-bounds writes in M-mode memory.
A zero physical address is also not rejected, which would cause M-mode
to write to address 0 and hang the hart.

Add bounds checking on num_events before the multiplication and reject
zero shmem addresses early.

Fixes: e4345842168b ("lib: sbi_pmu: Implement SBI PMU event info function")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---

Previously sent as [PATCH v2].
Changes in v2:
- Added Fixes tag
- Consolidated into patch series

 lib/sbi/sbi_pmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a0f6d2fa..3a2321cc 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1061,7 +1061,7 @@ int sbi_pmu_ctr_get_info(uint32_t cidx, unsigned long *ctr_info)
 int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
 			   unsigned long num_events, unsigned long flags)
 {
-	unsigned long shmem_size = num_events * sizeof(struct sbi_pmu_event_info);
+	unsigned long shmem_size;
 	int i, j, event_type;
 	struct sbi_pmu_event_info *einfo;
 	struct sbi_pmu_hart_state *phs = pmu_thishart_state_ptr();
@@ -1076,6 +1076,14 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
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
