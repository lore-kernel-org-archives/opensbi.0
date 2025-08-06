Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EDAC87FD2
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 01:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	References:In-Reply-To:Date:Message-Id:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=y2b3CliOLHbKTMG8k/bMDv/WWVG47dCtg4IgEGzt2NI=; b=LymxPAY0OGFLRvF5b1ulMMc54J
	ZOmIoyTb8QCd0W1oWmcMmFY/mTAyI4MzYlruaPZ9943pWVaVUpht9+Gd0ZfUwufZ7anN3g1tItrXR
	IFDGJqds1eReV/gV0aVr5mG9Iie18pRTY1VRoZl6uHzFGbZIP/7ShBfhtJFqZwEp/t2c7iWsuJOaF
	gqgsi1V/HDU9LddXX2aUPcx15dz5z/QB5m/13r6TY1nRN7BtzzyBSwYTw8Ewh+sLy14yh4BkBgy4/
	5R+NsoBoObSUOyUWlgMDhpFWy3QhvZyN7xRpML3e15/HDiCAuVtE1EvNwxjz/G2OV3cHhexDIL/iy
	MbwMRl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSeU-0000000E6Cg-3mjR;
	Wed, 06 Aug 2025 01:09:10 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSbx-0000000E62v-1EU0
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 01:06:34 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bxXDj285kz5BNRd
	for <opensbi@lists.infradead.org>; Wed, 06 Aug 2025 09:06:29 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 57616SIn072462
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 09:06:28 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202508060106.57616SIn072462@mse-db.zte.com.cn>
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 5760x1Oi026666
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 09:00:57 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app08[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 6 Aug 2025 09:00:58 +0800 (CST)
Date: Wed, 6 Aug 2025 09:00:58 +0800 (CST)
X-Zmail-TransId: 2b006892a94affffffffc94-95d3a
X-Mailer: Zmail v1.0
In-Reply-To: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn>
References: 20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <opensbi@lists.infradead.org>
Cc: <wu.fei9@sanechips.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDEvM10gbGliOiBzYmk6IFByaW50IGVycm9yIG1lc3NhZ2UgZHVyaW5nIHdhcm0gYm9vdA==?=
X-MAIL: mse-db.zte.com.cn 57616SIn072462
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.131 unknown Wed, 06 Aug 2025 09:06:29 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6892AA95.001/4bxXDj285kz5BNRd
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_180633_638627_7EAB1451 
X-CRM114-Status: UNSURE (   8.06  )
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

It's helpful to print error messages for debugging, here add them in
warm boot path just as those in the cold boot path.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 lib/sbi/sbi_init.c | 65 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 13 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 84a6374..2e1ca66 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -415,60 +415,99 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,

        /* Note: This has to be first thing in warmboot init sequence */
        rc = sbi_hsm_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d hsm init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_platform_early_init(plat, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d platform early init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_hart_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d hart init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_pmu_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d pmu init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_dbtr_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d dbtr init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_irqchip_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d irqchip init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_ipi_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d ipi init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_tlb_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d tlb init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_timer_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d timer init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_fwft_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d fwft init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_platform_final_init(plat, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d platform final init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        rc = sbi_sse_init(scratch, false);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d sse init failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        /*
         * Configure PMP at last because if SMEPMP is detected,
         * M-mode access to the S/U space will be rescinded.
         */
        rc = sbi_hart_pmp_configure(scratch);
-       if (rc)
+       if (rc) {
+               sbi_printf("%s: hart %d PMP configure failed (error %d)\n",
+                          __func__, hartid, rc);
                sbi_hart_hang();
+       }

        count = sbi_scratch_offset_ptr(scratch, init_count_offset);
        (*count)++;
--
2.43.0

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
