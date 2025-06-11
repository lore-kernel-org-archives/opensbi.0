Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5DBC71137
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8LaSK4e9o/nCuqCKHXTt7VLegTItYIHiPtHIQaR7kc=; b=yuJJ6gjmvc9r+e
	Aaz6giFmX8W9SLOuMOYBpLg33Ccl7SWfKBcLs50ULV+t4qKeGiKVxlaqq8eZAz4Z5hwD7SgTuQRiv
	bvoBzxb6BKcVqwiZJWtyemYFrwtgXQYYlg/ZIEyTTFYhiEtQcTGYLwinMWVmc6rulRSZPfe0JQYWV
	hDjcFNNfrTdKUp5JfZB2r4x0uXrEs8pZ7KJBNI6JMcCgofhU3zzn+1s9u6sStE+9PLSzVDweNiRG/
	W8AwC9OgrNkfq/rmPMJmQy7nzA9l+YjtqXT6cMFJOvQyfWT1IBdDMNfTGBoWbYN7Gd29rV2Vzv6M/
	fqYdetWGSmcdnKmhG1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL7-0000000ANnU-3RAf;
	Wed, 11 Jun 2025 15:26:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKI-00000009p26-08Ix
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M8pUdfUnYrtX1cwAXN0Trp6y1Rr06Dxzp5scVLYviE4=; b=DVYFKYeM+j6doXbQn6vE47AliV
	S3RnXZHGUPNFPlxDL6kN0fHnDbnzl+R6SllCdwIAE9ayiAdPYCcHaU6l8NUjIKufvLTPExXaz79xc
	uCaS83MEt9Rp9sqiKiunadtyLNoaygfOH57+NURm5gUscRDg/nnz8oiKzwtkdbmfDkgOjFxWZvj1K
	AvfVr9f7z+7+dj3LTZzCLOb947gHpaYW1M74snXoLnKb+s7bniuDrENV2+b/jZEPm56L01LLKtXmB
	5GWOZ0shy0RZWMUnFegIRxUxQKhtz1Kl6tRg0BcuHjuuOrOhr/LyNK/q5YD8n2KTAIvkXWPkYZnxw
	P0Tmyj6A==;
Received: from m16.mail.126.com ([220.197.31.9])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKF-00000002Neb-0L8K
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=M8
	pUdfUnYrtX1cwAXN0Trp6y1Rr06Dxzp5scVLYviE4=; b=LPGV7MvCMtIA44r39I
	6XMK4xpIWT4HztqUGRXZn8nGIV2MBDcxUdERznlEvUKxvZzsbFnNC2lnR9ophXWv
	e0+SKXQyNByBGNzw/IBhhCFFch6xZ5VC5zRVtcopehIXeDKWsegFGfPNyvSdcxIz
	dEtRDlwQtACOxr4Kt11tEB0kU=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S10;
	Wed, 11 Jun 2025 20:12:43 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 08/12] lib: sbi: Remove cold_boot from sbi_hsm_init
Date: Wed, 11 Jun 2025 20:12:25 +0800
Message-ID: <20250611121236.937455-9-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1kWr4UKr1ktw47ZrW5KFg_yoWrXFyrpF
	9xKF9Iyr4v9r97K3srWa1UuF1fGayvgw13Gry7Gr9Yqr40yF1rXrWIkw1Fqas8KFZYya45
	Z3yvvryxWF1UXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piqg4-UUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1wtpOmhJZ0iZIwAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131303_627317_CE9D5539 
X-CRM114-Status: GOOD (  10.93  )
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

Currently sbi_hsm_init only needs to be executed on coldboot hart,
so the parameter cold_boot can be removed.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_hsm.h |  2 +-
 lib/sbi/sbi_hsm.c     | 38 ++++++++++++++++++--------------------
 lib/sbi/sbi_init.c    | 25 +++++++++++++------------
 3 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index f7a6497c..05b512d7 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -63,7 +63,7 @@ const struct sbi_hsm_device *sbi_hsm_get_device(void);
 
 void sbi_hsm_set_device(const struct sbi_hsm_device *dev);
 
-int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot);
+int sbi_hsm_init(struct sbi_scratch *scratch);
 
 void sbi_hsm_hart_wait(struct sbi_scratch *scratch, bool cold_boot);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index b5f3194e..b75d9e43 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -244,30 +244,28 @@ static void hsm_device_hart_resume(void)
 		hsm_dev->hart_resume();
 }
 
-int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
+int sbi_hsm_init(struct sbi_scratch *scratch)
 {
 	struct sbi_scratch *rscratch;
 	struct sbi_hsm_data *hdata;
 
-	if (cold_boot) {
-		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata));
-		if (!hart_data_offset)
-			return SBI_ENOMEM;
-
-		/* Initialize hart state data for every hart */
-		sbi_for_each_hartindex(i) {
-			rscratch = sbi_hartindex_to_scratch(i);
-			if (!rscratch)
-				continue;
-
-			hdata = sbi_scratch_offset_ptr(rscratch,
-						       hart_data_offset);
-			ATOMIC_INIT(&hdata->state,
-				    (i == current_hartindex()) ?
-				    SBI_HSM_STATE_START_PENDING :
-				    SBI_HSM_STATE_STOPPED);
-			ATOMIC_INIT(&hdata->start_ticket, 0);
-		}
+	hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata));
+	if (!hart_data_offset)
+		return SBI_ENOMEM;
+
+	/* Initialize hart state data for every hart */
+	sbi_for_each_hartindex(i) {
+		rscratch = sbi_hartindex_to_scratch(i);
+		if (!rscratch)
+			continue;
+
+		hdata = sbi_scratch_offset_ptr(rscratch,
+					       hart_data_offset);
+		ATOMIC_INIT(&hdata->state,
+			    (i == current_hartindex()) ?
+			    SBI_HSM_STATE_START_PENDING :
+			    SBI_HSM_STATE_STOPPED);
+		ATOMIC_INIT(&hdata->start_ticket, 0);
 	}
 
 	return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 47802d54..73d35933 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -242,6 +242,10 @@ static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, boo
 		if (rc)
 			sbi_hart_hang();
 
+		rc = sbi_hsm_init(scratch);
+		if (rc)
+			sbi_hart_hang();
+
 		entry_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
 		init_count_offset = sbi_scratch_alloc_offset(__SIZEOF_POINTER__);
 	} else {
@@ -256,21 +260,18 @@ static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, boo
 	if (!entry_count_offset || !init_count_offset)
 		sbi_hart_hang();
 
-	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
-	(*count)++;
-
-	rc = sbi_hsm_init(scratch, cold_boot);
-	if (rc)
-		sbi_hart_hang();
-
-	/*
-	 * All non-coldboot HARTs do HSM initialization (i.e. enter HSM state
-	 * machine) at the start of the warmboot path so it is wasteful to
-	 * have these HARTs busy spin in wait_for_coldboot() until coldboot
-	 * path is completed.
+	/**
+	 * All non-coldboot HARTs will wait for the coldboot HART to
+	 * initialize the HSM (i.e. enter the HSM state machine), so
+	 * it is wasteful to have these HARTs busy spin in
+	 * sbi_wait_for_boot_hart_first() until the coldboot HART is
+	 * complete.
 	 */
 	sbi_signal_boot_hart_first_done(cold_boot, &sync_a);
 
+	count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
+	(*count)++;
+
 	rc = sbi_platform_early_init(plat, cold_boot);
 	if (rc)
 		sbi_hart_hang();
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
