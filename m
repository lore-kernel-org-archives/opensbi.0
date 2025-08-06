Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB02C87FDA
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 01:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	References:In-Reply-To:Date:Message-Id:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9YXrIpXdUqGWt+tRSMoPWdmr2kyj5brXjzIn3QoMDGE=; b=ra+ubRIZtAiWsLz//Lz8lftHWd
	OJm2Ncb6FmSYIlXE8wAAkY87wEMhYntLtO3KZ4x5ime6DZlv9b171AoSmT1ssTX2uAUWUFoghvZdo
	4V1krBF8IeFFbrTqyZPBcxTkIxsDiCBDJc+haBAcF2t+lyAL/6flH2z0/js6korD97ZHM2ENHdCDW
	jOIz1+yj/0NrEjITIfuSCx50GDpleEiL1Nkxd8wCvMVIkqzfJupmPEb3H5XiqhWRTtGG2n6p08eLF
	5mpTN1kr08RODpKFFIvj6AmLjALbS4yQMcHp13mQk4HvwizU4nGTkw90P/gDxj1LKjLMqXj6c01av
	KERwA3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSeV-0000000E6Cn-1WPz;
	Wed, 06 Aug 2025 01:09:11 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSc7-0000000E63v-3L9W
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 01:06:45 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bxXDr58Txz5B13Y
	for <opensbi@lists.infradead.org>; Wed, 06 Aug 2025 09:06:36 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 57616bhq072530
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 09:06:37 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202508060106.57616bhq072530@mse-db.zte.com.cn>
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl2.zte.com.cn with SMTP id 57612uBJ006275
	for <opensbi@lists.infradead.org>; Wed, 6 Aug 2025 09:02:56 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app04[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 6 Aug 2025 09:02:57 +0800 (CST)
Date: Wed, 6 Aug 2025 09:02:57 +0800 (CST)
X-Zmail-TransId: 2afc6892a9c12e3-a137d
X-Mailer: Zmail v1.0
In-Reply-To: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn>
References: 20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <opensbi@lists.infradead.org>
Cc: <wu.fei9@sanechips.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDIvM10gcGxhdGZvcm06IGdlbmVyaWM6IEV4dHJhIG1lbW9yeSBmb3IgaG91c2VrZWVwaW5n?=
X-MAIL: mse-db.zte.com.cn 57616bhq072530
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.131 unknown Wed, 06 Aug 2025 09:06:36 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6892AA9C.000/4bxXDr58Txz5B13Y
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_180644_010554_7318060C 
X-CRM114-Status: UNSURE (   7.75  )
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

Allocate the extra housekeeping metadata for heap or the expected free
memory size cannot be achieved.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 include/sbi/sbi_heap.h      | 3 +++
 lib/sbi/sbi_heap.c          | 5 +++++
 platform/generic/platform.c | 1 +
 3 files changed, 9 insertions(+)

diff --git a/include/sbi/sbi_heap.h b/include/sbi/sbi_heap.h
index a4b3f0c..3d3feee 100644
--- a/include/sbi/sbi_heap.h
+++ b/include/sbi/sbi_heap.h
@@ -98,4 +98,7 @@ int sbi_heap_init_new(struct sbi_heap_control *hpctrl, unsigned long base,
                       unsigned long size);
 int sbi_heap_alloc_new(struct sbi_heap_control **hpctrl);

+/** Return the total heap size with housekeeping **/
+unsigned long sbi_heap_total_size(unsigned long usable_size);
+
 #endif
diff --git a/lib/sbi/sbi_heap.c b/lib/sbi/sbi_heap.c
index 646c2e0..7aa27b1 100644
--- a/lib/sbi/sbi_heap.c
+++ b/lib/sbi/sbi_heap.c
@@ -279,3 +279,8 @@ int sbi_heap_alloc_new(struct sbi_heap_control **hpctrl)
        *hpctrl = sbi_calloc(1, sizeof(struct sbi_heap_control));
        return 0;
 }
+
+unsigned long sbi_heap_total_size(unsigned long usable_size)
+{
+       return usable_size + usable_size / (HEAP_HOUSEKEEPING_FACTOR - 1);
+}
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 47e771a..442f7d5 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -41,6 +41,7 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)

        /* For TLB fifo */
        heap_size += SBI_TLB_INFO_SIZE * (hart_count) * (hart_count);
+       heap_size = sbi_heap_total_size(heap_size);

        return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
 }
--
2.43.0

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
