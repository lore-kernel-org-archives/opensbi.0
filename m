Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D312B106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPFK0kJAtAI+KanZFFBluVlkQUHXYPYHU+mHlDVJNCY=; b=JWi/mKMD077w6C
	U8O3+aGUJOnZFIEZW3e7ilCYPmGIu1pKWRyhkHGjv5MSofZNNEKd9a0+2uj1na22TXJFVRl7Y2u5f
	aGArabZ0iWJnF78A7v/5ccPMvZEtAkWTLcb4Z2S4PJLkbisuhaawZKb13dL36IxTEoI4njf1OotHV
	Q0J0TU1GDTHJV6QwzxsdBS4xYG9UwjBriRN5rvLpnvhf5vIo6OcQhooJk6//Iik4s7p8ARptbvAy9
	XcZtQwkuqyaRm6Yj1RoBECGrODxi/gP1ythPO/5tdtgg213OA1C8UoAOOyIIOC0bko7sURt51nG/n
	q+GICoPynq8KLFLtNlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxL-0000000GcVD-348a;
	Fri, 13 Mar 2026 05:21:03 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxH-0000000GcQa-3zT4
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:21:02 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c73d251b93bso748985a12.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379258; x=1773984058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GrCNHbiOo1NSy/wyTNSkkgv7XzmNK2H0zXJMblh/6c=;
        b=SoNrtan5O1RYNDggmHBV+6UYpi++p9eNgyRLE4QFk5oG7fXrRS52qBYSASRL1SKHCg
         O8s2M9wCHjMPfJ4zX8W0D7U/btS24AV+rShYWSJxU6mN/VUYUJfM1930NPUNd4KjFaV5
         r1OzrtNsByR/juO/olQNqIZpXFXobhn6sH9lMBeSs+nplZ9MKNrCE32WkjLelR1eIks3
         OM/rtipHj/JY761KdfVJwd6NMuUpTxLSghmC18Df5lezrXPjX3ck22VjOD7Osbx7Yjrl
         C6C4An9aO8/OcgX6UnilGHtSFqozSt4O6H4SU6E0cPbY/Ac3oeHRQz1qgXToH2EGAOvB
         UuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379258; x=1773984058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GrCNHbiOo1NSy/wyTNSkkgv7XzmNK2H0zXJMblh/6c=;
        b=eAAQ2dWf07iQAQQD7agUQkKdX+UVjGQ6ckdc3jZZzkflDkAeI6tsu9Ga3GycDzt59E
         C6ffZO94kzgeopMMtx40qLvzR8DzJyLxxN6x27I/MX2UdQblS+UvvuwURa2U9vy16VDZ
         iWXfXbPw2eFAtV3O9yEZa6ngYwATmLQA47t5TRwLp8NKzrpEzB5IIQmVFCodhH+rsPDG
         hVje7LK09jeiNVfSfzWI6qJ/0KtwDG/tOYbLVMsafwXZ4KyZP1xF3VLExvCNaU+GErPS
         anyYi2Jhene1oLrSVfyvOfpg7G9EQZ7GshsIDtFHkIaiqX9O4/I6g07o8w2pFa72hr8O
         kVHw==
X-Gm-Message-State: AOJu0Yy9KTd7B3+AdnzJ9HDfiaqXy5pGMuCK4pSl0YrtoGUKGJx7U75K
	THPM8WJaa2r7O++eRF8bU6HSmw5Pq2lDX0iokvPN0FKEvxCl5qE7i/S/Goi3nw==
X-Gm-Gg: ATEYQzxiT6v0MpH5hFm9ImU0Eyb5DxNEmBSHvTmXAkO1BDGLLj29gPfoccYy4IKRq8q
	oDNmAe3VnIRmIvYsia/Q+fNTAzF1zi0u5MlDnhtKS/GU8XBuZOMw0HlvR/i32g6xrfCJXwnuS+c
	mfpIgqvvVOQCU1MgAsmIKZTJ/pGfue92hi+25MLYxYDLEjnVyy6lXByEQvqXNoLrMIOzA/4Q4Oa
	zVBrmWDj2UApmD0ktqHjXSQvvFtFKBWr1XSkQn9m0XmUzSgkoHdCgqpTpv2QyGitJfhWmYSCcs3
	z2k6OCKwTQWFFsiBp0EZrpp+rt7tEOHmj0n13LI7T+HsZLnTUuleFkUtj9BoLnUffUgLpAe6YNW
	iEC/2UPvd+4Ir88DMiz2IJRnRQtNH+fYbKLnuPxCj0C75aeWdAwj4Dr6/XJCjL0RvNi5W+BNZv/
	KWAkC7pCjUBmt8Suz56aOGx39YbIwp1zMRHam7pftR262Sl/yddhYePiJNzmiAQWrZ5gee
X-Received: by 2002:a17:90b:4ace:b0:359:8ca0:308d with SMTP id 98e67ed59e1d1-35a22053554mr1578884a91.14.1773379258544;
        Thu, 12 Mar 2026 22:20:58 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 13/18] dbtr: Rework install and update error handling
Date: Fri, 13 Mar 2026 15:19:42 +1000
Message-ID: <20260313051948.4017134-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222101_566416_DA985EB0 
X-CRM114-Status: GOOD (  10.05  )
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

Move the unmap error path to an error handling label rather
than duplicate it several times.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 54 +++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index cfcd728f..3aea486e 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -622,6 +622,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	struct sbi_dbtr_id_msg *xmit;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
+	int err;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -646,24 +647,21 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1), tdata1)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
+			err = SBI_ERR_NOT_SUPPORTED;
+			goto out_unmap;
 		}
 
 		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+			err = SBI_ERR_FAILED;
+			goto out_unmap;
 		}
 	}
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
-		sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-					       trig_count * sizeof(*entry));
-		return SBI_ERR_FAILED;
+		err = SBI_ERR_FAILED;
+		goto out_unmap;
 	}
 
 	/* Install triggers */
@@ -687,6 +685,12 @@ int sbi_dbtr_install_trig(unsigned long smode,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
+
+out_unmap:
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
+
+	return err;
 }
 
 int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
@@ -771,6 +775,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	struct sbi_dbtr_data_msg *recv;
 	void *shmem_base = NULL;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
+	int err;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -793,17 +798,15 @@ int sbi_dbtr_update_trig(unsigned long smode,
 		trig_idx = entry->id.idx;
 		if (trig_idx >= hs->total_trigs) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_INVALID_PARAM;
+			err = SBI_ERR_INVALID_PARAM;
+			goto out_unmap;
 		}
 
 		trig = INDEX_TO_TRIGGER(trig_idx);
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+			err = SBI_ERR_FAILED;
+			goto out_unmap;
 		}
 
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
@@ -812,23 +815,20 @@ int sbi_dbtr_update_trig(unsigned long smode,
 
 		if (!dbtr_trigger_supported(type, tdata1)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_NOT_SUPPORTED;
+			err = SBI_ERR_NOT_SUPPORTED;
+			goto out_unmap;
 		}
 
 		if (!dbtr_trigger_valid(type, tdata1)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_INVALID_PARAM;
+			err = SBI_ERR_INVALID_PARAM;
+			goto out_unmap;
 		}
 
 		if (type != TDATA1_GET_TYPE(trig->tdata1)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-							trig_count * sizeof(*entry));
-			return SBI_ERR_INVALID_PARAM;
+			err = SBI_ERR_INVALID_PARAM;
+			goto out_unmap;
 		}
 	}
 
@@ -843,6 +843,12 @@ int sbi_dbtr_update_trig(unsigned long smode,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
+
+out_unmap:
+	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+					trig_count * sizeof(*entry));
+
+	return err;
 }
 
 int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
