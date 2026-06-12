Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221F0CD4F2C
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/BxPMG7yAR0LKbnCwHpw3jEGOi9VGAt8YaaU4+sBltE=; b=v6qhK+7sujy6uN
	9I776Or1DMe9s2xe6lOFuGKVmjU8n/FdLJIUjHn1fiRibx3yM5KhZoUrNapERdQrpGsEbX3TFsxOn
	cblbZC/3imV8Ro3wCJ9nIbzr4PjUZz50G8piQ5x309V5KHtKTyAA59BxZTobdSznREM8+77TSj5TM
	7sRrnP/EwWRNRyFZyJJZ8c+sU7cmwhUJVM+sm8su9+0NxdLCt+6OFoc+vuc1dJ9pX+99XyZiavP2G
	kY8B7bIC6Apr+wal9gpSV2gi/5/WEsG/rLotRJFbYm9p3/FDT5QooeeVdBUwLQiIeRbXNtWXSiKkL
	QH2oGu7ooQ1KdKCX+7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwjZ-0000000AWCv-1Trc;
	Fri, 12 Jun 2026 07:55:21 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwjU-0000000AWBn-36CN
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 07:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781250910; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ikk4ugmHsNIeZZBwcNNhi1CgzVDupijh9bYor1sx//E=;
	b=Wsqx5NShqAQ0MkV/Yw0s/3wKYJNu/7kvULEXh+NyAvNt/VIFwqossnEBlsJ0aH0W53sRZfPdFOJtgZqfiQ87TeOgHFSzzzZhAXFyqPfjdvWu67R44DE6ZbyM1oYX1l/DCDLdVmHPAZZXgKaQ6g317KCUFAtTJTFuvronwpOX9oA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0X4i.9Q-_1781250905;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X4i.9Q-_1781250905 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 12 Jun 2026 15:55:08 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	guoren@kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] lib/utils/fdt: Reserve enough FDT space for fdt_cpu_fixup
Date: Fri, 12 Jun 2026 15:55:01 +0800
Message-ID: <20260612075502.76324-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005517_106503_61D7A208 
X-CRM114-Status: UNSURE (   7.68  )
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

The fdt_cpu_fixup() function uses a hardcoded +32 bytes reservation
when calling fdt_open_into() to make room for disabling HART DT nodes
and appending the "zicntr" isa-extension. This is insufficient on
systems where many HARTs are disabled: each disabled HART needs 4
bytes ("okay" -> "disabled"), and each zicntr append needs ~16 bytes.
With the current limit only ~8 HARTs can be disabled before
FDT_ERR_NOSPACE (-3) is returned.

Replace the hardcoded reservation with a dynamic calculation based on
SBI_HARTMASK_MAX_BITS, which defines the maximum number of HARTs
OpenSBI supports. Each HART may need up to ~20 bytes in the worst
case, so reserve SBI_HARTMASK_MAX_BITS * 20 bytes.

Also remove the now-redundant per-HART fdt_open_into() call inside
the zicntr loop since the single upfront reservation is sufficient.

Fixes: dd9439fbace2 ("lib: utils: Add a fdt_cpu_fixup() helper")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 lib/utils/fdt/fdt_fixup.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index b0ed20c8..bace2277 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -124,7 +124,13 @@ void fdt_cpu_fixup(void *fdt)
 			  sbi_hart_has_csr(scratch, SBI_HART_CSR_CYCLE) &&
 			  sbi_hart_has_csr(scratch, SBI_HART_CSR_INSTRET);
 
-	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
+	/*
+	 * Reserve enough FDT space for the worst case:
+	 *  - Each disabled hart: 4 bytes ("okay" -> "disabled")
+	 *  - Each zicntr append: ~16 bytes (property + string)
+	 */
+	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) +
+			    SBI_HARTMASK_MAX_BITS * 20);
 	if (err < 0)
 		return;
 
@@ -163,14 +169,9 @@ void fdt_cpu_fixup(void *fdt)
 		 * property if there hasn't been already one.
 		 */
 		if (extensions &&
-		    !fdt_stringlist_contains(extensions, len, "zicntr")) {
-			err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 16);
-			if (err)
-				continue;
-
+		    !fdt_stringlist_contains(extensions, len, "zicntr"))
 			fdt_appendprop_string(fdt, cpu_offset,
 					      "riscv,isa-extensions", "zicntr");
-		}
 	}
 }
 
-- 
2.50.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
