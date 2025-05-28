Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EB9C5AD49
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wpt+muXvUAbpHlRX626XsqB+PWpvIyR4ozHoT7qwFSg=; b=Mtqz0HdWR8fc5y
	q+c7IY8TpCarB8ai2eBBMPqTXzusTbhLr5claH9PnY6suiHtsgiyE2vF3Gu0KtamhVsSaNr88WNKr
	Hg9NpZYNCijdwG893YQc2PA5+/65HEy591TAgPkF7oTsqwwtbAIvOBn6mEKqyVN9Eu3vrrRmR8KAv
	iTi3W6EIH6CU/y1tKMAveGW5HLMaOFAawh4Thv4I0lRgCq0t9iieD5zNd8L3a7LSiGSp5riWRJJDz
	4j7Gl+qrqWBriM2OmkGiIh7uyg9590EMtgqlFHlS87wUBbeMgXEWviPFUmsiJUmxG6nuNQjODKPvV
	bOX0dLEeNCZPuxKSwSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdk-0000000DfRI-0F0f;
	Wed, 28 May 2025 16:28:28 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIyl-0000000Dab2-0MOH
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 15:46:10 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6faa4f176bdso29004266d6.3
        for <opensbi@lists.infradead.org>; Wed, 28 May 2025 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748447165; x=1749051965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K98Q27i7ZyrNTg8b9OM8sCAVqVasCyEMqr19izqsiqo=;
        b=UDP0dunKXmmwcMOhUNk4RM1V09xqdgAadlxOqPt0XIUlHJzR0QrqllhL2RBTpigVam
         I/V9i4PrVWniOXZIlyVjEo2X08hhoUCIFEiE6rcoGMFqo3EjwxFRqQZ5ZrUl8+SzGfFS
         xH9KRmSWhT3s697KLApRAVwpFMUcmU/ne46KjPA/k59Hz7mxfnV2fXeSf4RwDrh1jSpL
         gW8Jrd1d4yQA55w+JlyOvKDWHCqayBJyy5rwPwgQTm7IMg2uHpe/vfe5KB2+mI8kJYsl
         UjKT19fwovAe5mzZr7jUM48dNUY+vCVCeTSKAhedvjIHl977FUhpwPCWkX1b+9jN5C82
         sqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748447165; x=1749051965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K98Q27i7ZyrNTg8b9OM8sCAVqVasCyEMqr19izqsiqo=;
        b=S63OFfcHu7AxtCsQuSHJx4TCGcfoAipNXfY2fiaBquVcuRI3k3K+mAU60GRnLaqAip
         bHVJxVtcDIwysCwvH8Cvw8DM5oacTjQqPGC3yz+Uw41+YH0JJukjXnMzUtfGg6jQ7wXQ
         RqXMy0LfeX9SmKA8mH1LJVbA8w0YE47u1NaJ47Sz/GKHvihVffXua2IGQXi81S1C2kUX
         u+R3CaqPdAr4QA8RHTB8Noqg7lALqKUldWNF4Qomsu3pdTloBWuKng/zum5N70l4Znu4
         wrAYv1S1br9N/MHvptTdogblr9QfXIbD1kbW1ImZDceYpPfYbtlXGxf6ICsQ9Dv5YooX
         2CdA==
X-Gm-Message-State: AOJu0YxIdvmjFe5XB3pYF2C19umrhvz6Bb2NxYevZF2s0sYwyJNarZK2
	bVBe0Fml9PVSzLxH0oEhvzTpmKKsYBlzyu1PuvxmjtuQDyYtPWLuTodQvBL84LlIrttBkBWhF/f
	XBb7e
X-Gm-Gg: ASbGncsrlKlvTnIla3SQ2IaC3WtYTTzFvnqEos9PFcf+G8g+24rYuAoXjBashKbhYgI
	ZinmorMc2zvFnpJn/HBS2voOB6h0Kf6bxbYkpZxBd8Sr0cc0SlPwLIeMRaW5AEu59t3AddFmD7q
	lxGA4yOAlUmmX22H/mhumL+SHMTl/dOcnUGaFV15gwP2taOLU/R8OpVKYX5hBJmN0D9swFaAz4c
	kkLd8ynlbom0ZI7xSEQWqlxtCAkRCq4l5fIrGvy5QgIpQecOeNs3JerSe2OUtZH02WorU0dAzW7
	KLevlpoj1cVZ77/aUL0P80lhULuO5HkktHLzOXTV0FTDaYVxpmO7JCSmtAyVvJHT3IXIiCaCTSc
	q6l5t3zXxVpxfmPvC+H5huHqm5iyh+xoUm7QZ/QX/mKkQWe6z
X-Google-Smtp-Source: AGHT+IGyKPG99Oex+XyykBqYUvJBQl56/DkQZb4bQrs2DR/eePdrgyWbKYiAsCasPd0sTVLh1Hjt1g==
X-Received: by 2002:a05:6214:2482:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fa9cff2f5emr233942976d6.1.1748447165107;
        Wed, 28 May 2025 08:46:05 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-224-24.bstnma.fios.verizon.net. [108.26.224.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac0bb9d36sm7685406d6.79.2025.05.28.08.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:46:04 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>
Subject: [PATCH] lib: sbi: dbtr: Fix update_triggers to match SBI
Date: Wed, 28 May 2025 08:46:04 -0700
Message-ID: <20250528154604.571815-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_084607_321890_08A89C33 
X-CRM114-Status: GOOD (  11.75  )
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

OpenSBI implements sbi_dbtr_update_trig as
`sbi_dbtr_update_trig(unsigned long trig_idx_base,
                      unsigned long trig_idx_mask)`
yet SBI v3.0-rc7 Chapter 19. Debug Triggers Extension [0] declares it as
`sbi_debug_update_triggers(unsigned long trig_count)`

Change update_triggers to match SBI.

[0] https://github.com/riscv-non-isa/riscv-sbi-doc/tree/v3.0-rc7/src/ext-debug-triggers.adoc

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 include/sbi/sbi_dbtr.h   |  3 +--
 lib/sbi/sbi_dbtr.c       | 33 ++++++++++++++++++++-------------
 lib/sbi/sbi_ecall_dbtr.c |  2 +-
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index 8cb776c..b1cfb5b 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -117,8 +117,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 			 unsigned long trig_idx_mask);
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_idx_base,
-			 unsigned long trig_idx_mask);
+			 unsigned long trig_count);
 int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 			  unsigned long trig_idx_mask);
 
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f0e9128..1248634 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -651,13 +651,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 }
 
 int sbi_dbtr_update_trig(unsigned long smode,
-			 unsigned long trig_idx_base,
-			 unsigned long trig_idx_mask)
+			 unsigned long trig_count)
 {
-	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
-	unsigned long idx = trig_idx_base;
-	struct sbi_dbtr_data_msg *recv;
-	unsigned long uidx = 0;
+	unsigned long trig_idx;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_shmem_entry *entry;
 	void *shmem_base = NULL;
@@ -672,18 +668,29 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
-	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
-		trig = INDEX_TO_TRIGGER(idx);
 
-		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
+	if (trig_count >= hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
+
+	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
+		trig_idx = entry->id.idx;
+
+		if (trig_idx >= hs->total_trigs) {
+			sbi_hart_unmap_saddr();
 			return SBI_ERR_INVALID_PARAM;
+		}
 
-		entry = (shmem_base + uidx * sizeof(*entry));
-		recv = &entry->data;
+		trig = INDEX_TO_TRIGGER(trig_idx);
 
-		trig->tdata2 = lle_to_cpu(recv->tdata2);
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
+			sbi_hart_unmap_saddr();
+			return SBI_ERR_FAILED;
+		}
+
+		dbtr_trigger_setup(trig, &entry->data);
+		sbi_hart_unmap_saddr();
 		dbtr_trigger_enable(trig);
-		uidx++;
 	}
 
 	return SBI_SUCCESS;
diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
index 9c496c4..40a437e 100644
--- a/lib/sbi/sbi_ecall_dbtr.c
+++ b/lib/sbi/sbi_ecall_dbtr.c
@@ -43,7 +43,7 @@ static int sbi_ecall_dbtr_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_dbtr_enable_trig(regs->a0, regs->a1);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_UPDATE:
-		ret = sbi_dbtr_update_trig(smode, regs->a0, regs->a1);
+		ret = sbi_dbtr_update_trig(smode, regs->a0);
 		break;
 	case SBI_EXT_DBTR_TRIGGER_DISABLE:
 		ret = sbi_dbtr_disable_trig(regs->a0, regs->a1);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
