Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD16C79FB9
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 05:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3A48V93mNgFNb0nxYu8x5im5zsGFMSf9+4rjgadc0E=; b=HxxWjCfgPMdbD9
	imvVB2GAwMgashMK/7zWWor/vzZToHrOe9FRXT/aNiYvB79LdrB22UdrxLeVBfHk+Y/c12+cSlIfx
	vE5A1oggoAyic8+TorTIcKtxOGafv1UtSI2B2A9AUygiI006tjkH5mioUuvc4hWIIW4312GOp0JM5
	s4o+lbwv4TAwmibUWpPGSMZvKL+TCBIFrruCR/r0RiAajh1u2bp8pJVEl6Y4bkIylS8pj6nI0nlLL
	T9gTVJn+IZvWPOCAj1OkiuxOPaYD7G3KBsGcfZR43Z22WB44bKc75fgjLoZq/5vx9fmO7A8j7x/LC
	cxErCYO/ENVTGvWJzCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJF-0000000DRJQ-3VHW;
	Thu, 10 Sep 2026 05:26:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4XJE-0000000DRIa-1FgU
	for opensbi@bombadil.infradead.org;
	Thu, 10 Sep 2026 05:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CBpPnEmBmEaVARDWvQP4MASkBmkBmPVQeQOWAiiZAXQ=; b=Jwlj4EsAX1A3IqXYO/d8jByy4M
	FUNmF+Vbv99wqULxHOBsDvXdqIkBk+e6wqYDgOHFAbZxUqURE/1pXmiCoP1kvysVSuSx9xjH/3Eta
	dBSJ3UkwhbvSSz/eWoXW9Kv14RFSahSoKko947LQvdh9ywKsXRRDzsKk4V3MJgwjQsM2QhWwsN1YL
	60uCjxyj0tYVjmFc6bjvihQr+F4bsKw6VXUllun0LOvIzSc37yy8TzHwbEkLQkVctxyeob4GZYtRa
	YIBkCUvkyLnloxNtWB94VC9uyVTYO5CieuTlwiIeMNjYbL1j507U7L4rORxQOBivisZ8NIWPze/O6
	Qx+J7jFg==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4XJ9-000000022Mn-06GM
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 05:26:50 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTjyOP6Jq6atPBw--.40145S5;
	Thu, 10 Sep 2026 13:26:39 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: himanshu.chauhan@oss.qualcomm.com,
	liutong <liutong@iscas.ac.cn>
Subject: [PATCH v3 3/4] lib: sbi_pmu: unmap shared memory on the reserved event_idx path
Date: Thu, 10 Sep 2026 05:26:28 +0000
Message-Id: <20260910052629.3359493-4-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910052629.3359493-1-liutong@iscas.ac.cn>
References: <20260910052629.3359493-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHTjyOP6Jq6atPBw--.40145S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tr48JrW7JF1kJrW5Kw4rXwb_yoW8XF4rpr
	4kGF98trWktryIqasxX3Z7J3W8Ca1rJayDAry5Wr1qyF95Xr4xZF47tw1vvF13CF93Jw12
	qa1UtF4jka45ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFqXdUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_062647_730308_7E6A6950 
X-CRM114-Status: GOOD (  12.65  )
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

sbi_pmu_event_get_info() maps the S-mode shared memory into M-mode
before walking the event array and unmaps it when the walk is done.
The reserved-bit check inside the loop returns directly and skips the
unmap, so a request with a must-be-zero bit set in event_idx leaves the
mapping in place after the ecall returns.

Unmap before returning, as the other error paths in this function do.

Fixes: d97cfb33ae1a ("lib: sbi_pmu: Return invalid param error for reserved event_idx bits")
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
New in v3, not part of the v2 series.

Noticed while rebasing the patch before this one onto the current error
code handling in this function.

 lib/sbi/sbi_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 54da5c24..d8e5ea01 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1120,8 +1120,11 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 	for (i = 0; i < num_events; i++) {
 		event_idx = einfo[i].event_idx;
 		/* Any must-be-zero event_idx bits set should return INVALID_PARAM per-spec */
-		if (event_idx & SBI_PMU_EVENT_IDX_MBZ_MASK)
+		if (event_idx & SBI_PMU_EVENT_IDX_MBZ_MASK) {
+			sbi_hart_protection_temp_unmap_range(shmem_phys_lo,
+							     shmem_size);
 			return SBI_ERR_INVALID_PARAM;
+		}
 		event_type = pmu_event_validate(phs, event_idx, einfo[i].event_data);
 		if (event_type < 0) {
 			einfo[i].output = 0;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
