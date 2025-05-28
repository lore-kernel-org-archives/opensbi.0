Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4794EC5B549
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 05:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b69j+y1K5P1Fwfdi70scJqi+sjEHwHq3FxLLY1q8IKY=; b=Au3KNQy/iwonMQ
	K8+pO85DD/Vc0ygcUXudgLQARGXiNIhR5Ec7bFisHbdWYFt8g0CABdePJGPODmWgB6EcDhf3zvVTC
	uoeqrPZ2Z26qwMs4Qk86PB5d6s8abOOS7/QKtpmSxDjkmSEm2+Iuq1530RPlyq+caYoA/6/WE6K9Z
	8/g9OJSbUf6T2yslxJH3w8Ii+pt1ffxxLFrMg1QcHSMYVV7ME4ORLfOjw0ZfjnMzQSnwC+3fbo3gN
	aaV1ARceBO5hQhXuHaZJCW6Fb7AYdW12DJnHyQS+7RuqKbkUbf0LJQDwTbXQLzwD3XM5URX7dODTB
	62gdFronyXqrHmMEllvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9k1-0000000CEu5-1VPB;
	Wed, 28 May 2025 05:54:17 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9jy-0000000CEsS-0S05
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 05:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zz
	40ZmxFKHokvtX6cxH+G79dQyKqwWhoAZ7g+2z+99U=; b=ZW2WP7Xm5YQO8Lh6mf
	TxUSEjkGTGDVsA/sItmoZZOcGTu8KgEvdyvjCfnMC1NRom+kzr/thdiK5SfqHoCy
	bJw4Cfio4vaKOQGRJ7DfWEoC60zLXNDh2tEV0MwrxnZp3JDB4FHVDZK5s77A2FhD
	4ZQrqvQPfLl9F51JWIZfFXXhU=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX_5j3pDZo96cmAw--.22074S6;
	Wed, 28 May 2025 13:54:02 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 4/4] lib/utils: Add memory-mapped stimecmp support
Date: Wed, 28 May 2025 13:53:53 +0800
Message-ID: <20250528055356.547392-5-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528055356.547392-1-wxjstz@126.com>
References: <20250528055356.547392-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_5j3pDZo96cmAw--.22074S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFyrArW8KryUCryUWrWUXFb_yoWxGFyxpF
	s2kwnaq3y7tFWrGFs2vw4DX3yUAr48Jryjya97A340kFnrWw13GF4UJryUCay3AFWkZF4S
	yF95W3s8Aan8Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEwZ2xUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1x1bOmg2oZU-ewABsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_225414_663243_1D1D7E02 
X-CRM114-Status: GOOD (  14.85  )
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

Some platforms has a memory-mapped stimecmp similar to sstc. This
patch get the address of stimecmp by adding it to the reg-names of
the 'thead,c900-aclint-mtimer' node in the device tree, and triggers
the timer interrupt through the memory-mapped stimecmp in
sbi_timer_event_start if it exists.

Tested on Milk-V melse.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi_utils/fdt/fdt_helper.h      |  1 +
 include/sbi_utils/timer/aclint_mtimer.h |  2 ++
 lib/utils/fdt/fdt_helper.c              | 21 +++++++++++++++++++--
 lib/utils/ipi/fdt_ipi_mswi.c            |  2 +-
 lib/utils/timer/aclint_mtimer.c         |  7 ++++---
 lib/utils/timer/fdt_timer_mtimer.c      |  8 ++++++--
 6 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 04c850cc..2f4ea255 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -98,6 +98,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 			  bool for_timer, bool allow_regname,
 			  unsigned long *out_addr1, unsigned long *out_size1,
 			  unsigned long *out_addr2, unsigned long *out_size2,
+			  unsigned long *out_addr3, unsigned long *out_size3,
 			  u32 *out_first_hartid, u32 *out_hart_count);
 
 int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_base,
diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
index a245e13e..d88ab9ce 100644
--- a/include/sbi_utils/timer/aclint_mtimer.h
+++ b/include/sbi_utils/timer/aclint_mtimer.h
@@ -31,6 +31,8 @@ struct aclint_mtimer_data {
 	unsigned long mtime_size;
 	unsigned long mtimecmp_addr;
 	unsigned long mtimecmp_size;
+	unsigned long stimecmp_addr;
+	unsigned long stimecmp_size;
 	u32 first_hartid;
 	u32 hart_count;
 	bool has_64bit_mmio;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b2d91fdf..bbfbbaea 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -909,7 +909,9 @@ static int fdt_get_aclint_addr_size_by_name(const void *fdt, int nodeoffset,
 					    unsigned long *out_addr1,
 					    unsigned long *out_size1,
 					    unsigned long *out_addr2,
-					    unsigned long *out_size2)
+					    unsigned long *out_size2,
+					    unsigned long *out_addr3,
+					    unsigned long *out_size3)
 {
 	int rc;
 	uint64_t reg_addr, reg_size;
@@ -921,6 +923,15 @@ static int fdt_get_aclint_addr_size_by_name(const void *fdt, int nodeoffset,
 	*out_addr1 = reg_addr;
 	*out_size1 = reg_size;
 
+	if (out_addr3 && out_size3) {
+		rc = fdt_get_node_addr_size_by_name(fdt, nodeoffset, "stimecmp",
+						    &reg_addr, &reg_size);
+		if (rc < 0 || !reg_size)
+			reg_addr = reg_size = 0;
+		*out_addr3 = reg_addr;
+		*out_size3 = reg_size;
+	}
+
 	rc = fdt_get_node_addr_size_by_name(fdt, nodeoffset, "mtimecmp",
 					    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_size)
@@ -963,6 +974,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 			  bool for_timer, bool allow_regname,
 			  unsigned long *out_addr1, unsigned long *out_size1,
 			  unsigned long *out_addr2, unsigned long *out_size2,
+			  unsigned long *out_addr3, unsigned long *out_size3,
 			  u32 *out_first_hartid, u32 *out_hart_count)
 {
 	const fdt32_t *val;
@@ -975,11 +987,16 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 	    !out_first_hartid || !out_hart_count)
 		return SBI_EINVAL;
 
+	if (out_addr3)
+		*out_addr3 = 0;
+	if (out_size3)
+		*out_size3 = 0;
 	if (for_timer && allow_regname && out_addr2 && out_size2 &&
 	    fdt_getprop(fdt, nodeoffset, "reg-names", NULL))
 		rc = fdt_get_aclint_addr_size_by_name(fdt, nodeoffset,
 						      out_addr1, out_size1,
-						      out_addr2, out_size2);
+						      out_addr2, out_size2,
+						      out_addr3, out_size3);
 	else
 		rc = fdt_get_aclint_addr_size(fdt, nodeoffset,
 					      out_addr1, out_size1,
diff --git a/lib/utils/ipi/fdt_ipi_mswi.c b/lib/utils/ipi/fdt_ipi_mswi.c
index aa37d0d0..3a8da253 100644
--- a/lib/utils/ipi/fdt_ipi_mswi.c
+++ b/lib/utils/ipi/fdt_ipi_mswi.c
@@ -25,7 +25,7 @@ static int ipi_mswi_cold_init(const void *fdt, int nodeoff,
 		return SBI_ENOMEM;
 
 	rc = fdt_parse_aclint_node(fdt, nodeoff, false, false,
-				   &ms->addr, &ms->size, NULL, NULL,
+				   &ms->addr, &ms->size, NULL, NULL, NULL, NULL,
 				   &ms->first_hartid, &ms->hart_count);
 	if (rc) {
 		sbi_free(ms);
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index ad4c10b3..ed9be1c0 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -80,10 +80,11 @@ static void mtimer_event_start(u64 next_event)
 	if (!mt)
 		return;
 
-	/* Program MTIMER Time Compare */
-	time_cmp = (void *)mt->mtimecmp_addr;
+	/* Program Time Compare */
+	time_cmp = (void *)(mt->stimecmp_addr ? mt->stimecmp_addr
+					      : mt->mtimecmp_addr);
 	mt->time_wr(true, next_event,
-		    &time_cmp[target_hart - mt->first_hartid]);
+		&time_cmp[target_hart - mt->first_hartid]);
 }
 
 static void mtimer_event_stop(void)
diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
index 224534d8..7af77a70 100644
--- a/lib/utils/timer/fdt_timer_mtimer.c
+++ b/lib/utils/timer/fdt_timer_mtimer.c
@@ -34,7 +34,7 @@ static int timer_mtimer_cold_init(const void *fdt, int nodeoff,
 				  const struct fdt_match *match)
 {
 	int rc;
-	unsigned long addr[2], size[2];
+	unsigned long addr[3], size[3];
 	struct timer_mtimer_node *mtn, *n;
 	struct aclint_mtimer_data *mt;
 	const struct timer_mtimer_quirks *quirks = match->data;
@@ -46,7 +46,9 @@ static int timer_mtimer_cold_init(const void *fdt, int nodeoff,
 	mt = &mtn->data;
 
 	rc = fdt_parse_aclint_node(fdt, nodeoff, true, !is_clint,
-				   &addr[0], &size[0], &addr[1], &size[1],
+				   &addr[0], &size[0],
+				   &addr[1], &size[1],
+				   &addr[2], &size[2],
 				   &mt->first_hartid, &mt->hart_count);
 	if (rc) {
 		sbi_free(mtn);
@@ -81,6 +83,8 @@ static int timer_mtimer_cold_init(const void *fdt, int nodeoff,
 		mt->mtime_size = size[0];
 		mt->mtimecmp_addr = addr[1];
 		mt->mtimecmp_size = size[1];
+		mt->stimecmp_addr = addr[2];
+		mt->stimecmp_size = size[2];
 	}
 
 	/* Apply additional quirks */
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
