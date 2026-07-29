Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C333BC54F51
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 07:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KHpxeICx5+LEtMCv4Snkm2GINPEUzCFV3dMKdvKgykc=; b=fYw2Fm2fDhQtZz
	prKKBKbIZRVDYFK1ZeVWsXixmLPEeG88HZrEfxdZFqKHCAmnrKwOTzv6T5+/Hxq5TFH58YttgeNlQ
	WloXXBn5hYUdVXB/PYYBLuRt9W0Q0046BjybdO4xFVlWvxiZNZukKESr/afDaBmlhq8+xolggPCHI
	/LbS+s0tU0evK+u2e/97AGFWFRErtofWb9U5NvTRjEcFIjBnKqjL0EUW1ifyMjA12Q0CLlnw4V4/M
	O1upcyO8r+MFpnnyttIXagCRVnHm75SSypYmzcp0u4P3b9WFgSLsrvk4GLYw3rzxoaPbWJAZ5BR/S
	NQkZiOYC1Oj/eBRbnePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyhl-000000077dI-3nid;
	Wed, 29 Jul 2026 07:27:53 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyhj-000000077bR-0oTV
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 07:27:52 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3pD5yq2lq+gj1AQ--.20382S2;
	Wed, 29 Jul 2026 15:27:46 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: liutong <liutong@iscas.ac.cn>
Subject: [PATCH] lib: sbi_dbtr: fix integer overflow in read_trig bounds check
Date: Wed, 29 Jul 2026 07:27:36 +0000
Message-Id: <20260729072736.948903-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3pD5yq2lq+gj1AQ--.20382S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF17Ar4xZF17Xr4fAF1rtFb_yoW8Xr1fpF
	1xGa43Kw4IqryjyrW0ka1rJFyIga18Cw4UtrWSkry0y39xZay8u34ak3WUXayxZrykAF4a
	vF1Dtr4UZFs0vF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUBBT5UUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_002751_600665_8E55BA01 
X-CRM114-Status: UNSURE (   9.04  )
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
---
 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..eeab7d3a 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -572,7 +572,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		return SBI_ERR_FAILED;
 
 	if (trig_idx_base >= hs->total_trigs ||
-	    trig_idx_base + trig_count >= hs->total_trigs)
+	    trig_count >= hs->total_trigs - trig_idx_base)
 		return SBI_ERR_INVALID_PARAM;
 
 	if (sbi_dbtr_shmem_disabled(hs))
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
