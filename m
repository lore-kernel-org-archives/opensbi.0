Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E799F106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oW32wo3ENOrCwEOaIWO5Cq1R2Hy4Ir7EU/tsu16nFM=; b=Q02/iLDywSjgTf
	d+bnfLIdX2uDLpyIW2PWzpNpX5PPgarDY+FQsv9QQ1dQlUsdbULFqTkobUHHah+SnhYFlLayUjQHS
	vnXSmbvfbZF4fFIG+wgzS4Vwtq1cozcc2Bd35beWDzcPp8Nar2VN5W0N4Q33lcgL8a8a3e5URa+fs
	nx627AdPFKhdVZu97kQbEG/awlIQZhYSaKJyroIz3gARRUCGZio7M82tB53k9tSVFUjLpaWJ+F2zz
	DDWOuMZSLi2o9TpfEWbEZYupiZNpF37f6ZmyC7Sq4yOEVx9vGrIv+egq8CR0GO8ED9qonF33s6MP9
	i4pouot+IW7vmnc1uo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwv-0000000Gc8z-2mLv;
	Fri, 13 Mar 2026 05:20:37 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uws-0000000Gc6X-4BGx
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:36 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so911820a91.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379234; x=1773984034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0MSoDTh5gPZoM6IGPTYvF+jIDWcQpBUBOk/HUmqfFs=;
        b=agy1GJlExIsuL0IUN22SSkDSkqvYHxThapoQcejLGjsj/fnPCUkGazT7wwC8ADVLvm
         SKUNDnUaOrBnZimDY4UMGKQSWM1kmxKqeBdx/968XakONwy7R86W1Lckgaud6az/QGMG
         LU9DLKwya4PI8uE6XOaM0Pzvcfk7F1aOGbMP6U6DWuee/BNxtW7/BxkyZbEsQS/Wuoxl
         HmaGeNuixbhHwzD0/zhls3mAX2q3xu/TucibxjSFsshy5NTdpSIvFd5j17XNEHS/Hsvi
         U2zqiet4pwWjkwbiS4VV16w+kauThns2Qu0lE7WSTQsWCkzhrPjWqBQWNJSS1rMObtjL
         ohTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379234; x=1773984034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0MSoDTh5gPZoM6IGPTYvF+jIDWcQpBUBOk/HUmqfFs=;
        b=Gc+7yAMKnZBzAH5lG1evloeXr7uSIk4Cr9CZbtPUihOanZGPXjT3g3DoEwqjFEeo74
         UojDZO40p6sgrOGzkEs56orXhb2UDfozZtE71o6N+eZ8zhpT2B8xwmkYVsfe3Zj2oQuZ
         r+clphJt+P4zMXiuG5JdMDNvmtXrrGXQ1S2bJ0AO+xZS+IaJs2VOdF860eto7hqW6O0p
         DU5ix8Waumij8vOxKPL4yWo1ElcQ+U/O/WlQF8DCiWH5Ci6vtnQLtfQnnzL3dTvFE3oA
         V4B5gVB+F+ebaqnTP+OoZY7B7cfSScVcpb7zBa/4lKO+QKixxJSuVES5sneAIfFrn61d
         fYXw==
X-Gm-Message-State: AOJu0YyE/1fuqOV2nVgDTbusbEF3zUJfv+ApzVQi6SfhZnmdpfZWwOKn
	NAMUyjrfuNPO03GPe10xQud/7VQ3Z/xwjh+wVAyMB5x749GuEpJTIRm01BeAOQ==
X-Gm-Gg: ATEYQzyETsx4wL5hu8bAkm5dHGM1JkQVgGdJBhWSfRyLugstY5eJ6UWse/duYuLQggH
	yUZHk4FZQbu7fLsbocozjBffsSfpVddo4CSL810uClpPi7wU1fjAT/UqYdkwzaGQ56TZdqOCnJO
	gMiQh2fFvcVYTXU8gd7FtFzp81WF/2J97VNweH6gYwJM+/Ru1lORbbctXO+Z0uEBK1jfZ73MFwJ
	r71I43IhxMinrwDi/PVysAeH7eXQWLfI0bjmNb4e2L370nxzy9eu687BVU+iJEKeTupCliVI26I
	onDN4qq7ypinlVjF8K4dBTewaO+bI/bHdLFAaTRT4mJfgmF7rz3elQV5eM0C9WcTPuNyeue+A4+
	rv6aPfHPOMVWsc0TIWmVSGbAEgDNVOPZcywyQ2M+jwNYu6S9KAP4RpyYGsKtGfxVALQ0dQOCjmM
	SqObp7ul7l0e9b864A/nbL/ga34RdYSCoiEW+lIjxa5fLl9WGpHMs1HCi2TRXt9Nyd3VzvCfSHh
	SCG3JA=
X-Received: by 2002:a17:90b:48d0:b0:356:2fc5:30f5 with SMTP id 98e67ed59e1d1-35a21ebb0b2mr1815807a91.13.1773379233655;
        Thu, 12 Mar 2026 22:20:33 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 06/18] dbtr: Improve trigger update error checking
Date: Fri, 13 Mar 2026 15:19:35 +1000
Message-ID: <20260313051948.4017134-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222035_037658_2162885F 
X-CRM114-Status: GOOD (  11.73  )
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

Trigger updates should ensure all triggers can be upated without failure
before making any changes. Updates that change the trigger type must
also be disallowed according to SBI specification.

Change the style of shmem access and checking to match the trigger
install code and perform all checks first. Add the missing check to
prevent type change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 224f2350..d2845fec 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -727,9 +727,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 int sbi_dbtr_update_trig(unsigned long smode,
 			 unsigned long trig_count, unsigned long *out)
 {
-	unsigned long trig_idx;
 	struct sbi_dbtr_trigger *trig;
 	union sbi_dbtr_shmem_entry *entry;
+	struct sbi_dbtr_data_msg *recv;
 	void *shmem_base = NULL;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 
@@ -744,30 +744,49 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
+	sbi_hart_protection_map_range((unsigned long)shmem_base,
+				      trig_count * sizeof(*entry));
 
+	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
-		trig_idx = entry->id.idx;
+		unsigned long trig_idx, tdata1;
 
+		trig_idx = entry->id.idx;
 		if (trig_idx >= hs->total_trigs) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
 			return SBI_ERR_INVALID_PARAM;
 		}
 
 		trig = INDEX_TO_TRIGGER(trig_idx);
-
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
+		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
+		tdata1 = lle_to_cpu(recv->tdata1);
+		if (TDATA1_GET_TYPE(tdata1) != TDATA1_GET_TYPE(trig->tdata1)) {
+			*out = _idx;
+			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+							trig_count * sizeof(*entry));
+			return SBI_ERR_INVALID_PARAM;
+		}
+	}
+
+	/* Update triggers */
+	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		trig = INDEX_TO_TRIGGER(entry->id.idx);
 		dbtr_trigger_setup(trig, &entry->data);
-		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
 		dbtr_trigger_enable(trig);
 	}
 
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
+
 	return SBI_SUCCESS;
 }
 
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
