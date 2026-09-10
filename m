Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364CFC79FB7
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYREooeJuekm63BPDZclJbInVrhMoveao3MnjbMm9UQ=; b=OQ6mVOasZBDSpV
	QBHqeHAYAED1U4S5yP7Y328+Hu1oCICW9ju7pYKg220I8hSu8q37ZSY7EgnpFcGKUA2yc3LZgiVDS
	nllEWTzPIMM/2xWPs4zh1RaEn3VP6E1VyliYkW0dNYxEx8SwElhhWtCpnxNIKQdNib9JatIczvnRl
	gY4ewbTC4DS7eO4ynjt2u1rRSe8ll68fj/uszDPh52beQWdDBlHx4a8mMqD14E/o7OVsB3pRGQBVd
	dQZdMFNAo+r23g27dSBZKxJ+fFRNTCiYaqdoBPqUXWiBcRqner1zIwPPy+W0CmFufxomHJpvh0NO3
	fGJLDd2Ha8+qnamOI9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJA-0000000DRHW-2i57;
	Thu, 10 Sep 2026 05:26:48 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJ5-0000000DRFP-2gRr
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:26:47 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjyOP6Jq6atPBw--.40145S3;
	Thu, 10 Sep 2026 13:26:39 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 1/4] lib: sbi: dbtr: fix integer overflow in read_trig bounds check
Date: Thu, 10 Sep 2026 05:26:26 +0000
Message-Id: <20260910052629.3359493-2-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910052629.3359493-1-liutong@iscas.ac.cn>
References: <20260910052629.3359493-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHTjyOP6Jq6atPBw--.40145S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF17Ar4xZF17Xr4fAF1rtFb_yoW8AF4xpF
	1xG3W3K3y0qryjkayvka1rJFyIga18Cw4UtrZayry8t398JFW8X3sIy3WjqayxZrykZF4a
	vFyUKrW7uF4jvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JURuWdUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_222644_052401_BF6AD488 
X-CRM114-Status: GOOD (  10.11  )
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

In sbi_dbtr_read_trig(), the range check is:

  if (trig_idx_base + trig_count >= hs->total_trigs)

When trig_idx_base and trig_count are both unsigned long values supplied
by S-mode, their sum can wrap past ULONG_MAX to a small value, making
the check pass. For example trig_idx_base=1, trig_count=ULONG_MAX wraps
to 0, which is less than total_trigs.

This allows the subsequent for_each_trig_entry loop to access trigger
entries far beyond the triggers[] array, corrupting M-mode heap memory
via CSR read-back writes and leaking M-mode internal state to S-mode
shared memory.

Rewrite the condition as trig_count >= total_trigs - trig_idx_base. The
subtraction is safe because the preceding check already guarantees
trig_idx_base < total_trigs.

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: liutong <liutong@iscas.ac.cn>
Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
Previously sent as [PATCH v2 1/6].

Changes in v3:
- Rebased onto current master; only the surrounding context moved, the
  changed line is byte-identical to v2
- Subject prefix changed to "lib: sbi: dbtr:"
- Split into this series

 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 7e4ddd98..5f66b641 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -649,7 +649,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		return SBI_ERR_FAILED;
 
 	if (trig_idx_base >= hs->total_trigs ||
-	    trig_idx_base + trig_count >= hs->total_trigs)
+	    trig_count >= hs->total_trigs - trig_idx_base)
 		return SBI_ERR_BAD_RANGE;
 
 	if (sbi_dbtr_shmem_disabled(hs))
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
