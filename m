Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BBF106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOUV2lwYlAb7AORNlhC15rQIXVkB4F0w623U4C+636s=; b=0ixoH3jnhDfCVB
	srcrDuHi/RnMo7wV+t7vm3BLDiiWn5H5p/oAo1PGMEecFnrpW8bhxbsqtHTy3MEXyHrkLfIQKqOSK
	lyCPl21jqIUR+eD4MoV8FyInIM7lDXpp+5IngDvQRGN6xgxtFsw9sTAGsGJ/OyLVTXEkg3g+2Gf4Z
	MpsVmYIwIQ/oZvBoPpKsB6O8bTQFwII6cxMbN7VKESa4XIFimTUTAdrENIuGTdQEUlN/yhgyKVXtV
	Yo3585t5Vx3RAAL5EPwIPR+jvgQdmIedvmfU+OFCIzmKri+pJXcNp2tblmIJGUu28ZZgm5e2r4O1N
	b7lxAxUQawyLYk4xpxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxW-0000000GcjD-1uen;
	Fri, 13 Mar 2026 05:21:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxT-0000000Gcf3-04Bj
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:21:13 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so912159a91.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379269; x=1773984069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxhlaUkuJmyYXeP7XLloNVZD38DyRSI47MsFskJiS74=;
        b=EKKutxiVFregzWyPn4evJhOspyraU/SKTMIFrSqormULdxKz1HB5IdooemEzTULYLk
         LxlozZoZqHJ6/XrZeEPr/GePcqxkXcRIzBbKnc6OpzIZ4DahsKrn63xPKiBEVtzK4FHZ
         Rre1iqnBlN8Ky1sLWWEyV6OFTSNDV/cOXxlnAc8n5YOs+edNoh2zx1WznnFsVbbn0gu7
         ThIe5HjQQ/ws+l+P7rlzePyNEE2mOwmbKk0vCfwwaJETpxNUBrZ+SRAw/YAa5oQbkc/i
         rTNqUtJCnXpAZPHRDA1svuUg2Z/yk+UV8zGZS+KE8tRbiQ9kWdztn0Zf5arKlH3CLMrf
         +XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379269; x=1773984069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZxhlaUkuJmyYXeP7XLloNVZD38DyRSI47MsFskJiS74=;
        b=sx+b24oBphFat++fpgvsvoEsABxz1etbHocJubRa998LlGPrzOw2Avs6loPu3NyFCm
         uIyo+Cwyy4hufEMut0de+YyoKfxxQYJHD+20XQG1yCMDGDMoP8W1qfXmPJ3h03ekKACm
         OQE79We1dnhl1Afg2rG5lQEeb1iTrtN27thxyWewKH/HSUEIlkuNrV5YYxgZ5aEo6Tpc
         3p66UJMSANa7R/c/mx4deQhVPjIjprOcfVvrXjHQhnfF3gd08Et7wE2MJhIR2waB6Qzb
         OFChpwVgRsD4h6QlIzZA0Bn1mrC6mcw8MH3+FGAWnxdI6jCheKqBS4QTqGWFUC8uUMA5
         OXAw==
X-Gm-Message-State: AOJu0Yyy274bz9LtGzU1jtQ0BdaM4maLycKSUgP4q6SPYoiUIG8GFgsg
	SXDUGZuFw5ipILk1GNY4bDwB5opyzpkpp+VXW2n3MUjMtUFAozrhWTLf4QpB1w==
X-Gm-Gg: ATEYQzzFpsV4uS10xTwGvfnRqVoKnTWQgsF9FwwGkAmoLjEvmTwrF6I3amA479s5CAK
	Amqol/5HAfxp4GAixJIiKQfnD46TnWyehbf4Tfv29JbAxRFo/bzyYOiZSvxPoMALPZ43svCLpDe
	CrSjf0qXdGgQmcAGUeG7Ldt0O8YSCv5RA6MD+VsV17wGGl5Oi23S97YF/YtYPS874jeYNZHBDAO
	oYfjdYEEkEUYMiO499UWyv49XswfUNMiTp9vv9LXkHY2YLNr8ZWDJF53ngNA06Go9v6Q5iAGqW7
	OL2pWHgdFp3Kw7IxpP7GW36188r1vmbnGFVpiToaEIHVA0ysZeQj6gREUWi1sqcdsPw79AENuuL
	Kh2ob6RaxjM5T643DMAqtsDxg5VKjFt9bcfAeX63PFi3X1hI3Qa/61tw/0I5iiyqybhd8N/Ul79
	6cCL3DZ2QN2+FkvG5RQNHjhq0l3Fgg3gxle7nK++Yt8f+rFhk+JkddSna5SuL0xtjjj5tvHEFIn
	tUgOYA=
X-Received: by 2002:a17:90b:278d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-35a21e37f1dmr1979198a91.6.1773379269549;
        Thu, 12 Mar 2026 22:21:09 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:21:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 16/18] dbtr: Heterogeneous trigger type support
Date: Fri, 13 Mar 2026 15:19:45 +1000
Message-ID: <20260313051948.4017134-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222111_065591_B30DDD4D 
X-CRM114-Status: GOOD (  17.24  )
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

The Tenstorrent Ascalon core has 8 triggers that support the mcontrol6
type and another that supports the icount type.

When installing SBI triggers, allocate HW triggers to them that satisfy
their type requirement. A first pass is made over the requested SBI
triggers which checks that all can be satisfied with available hardware
triggers. If yes, then a second pass allocates each HW trigger and maps
the corresponding SBI trigger to it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 104 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 30 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 77162efe..f91a2b0d 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -93,6 +93,31 @@ static bool sbi_hw_trigger_supports(struct sbi_hw_trigger *hw_trig,
 	return true;
 }
 
+static struct sbi_hw_trigger *sbi_alloc_hw_trigger(
+				unsigned long type, unsigned long tdata1)
+{
+	int i;
+	struct sbi_dbtr_hart_triggers_state *hart_state;
+
+	hart_state = dbtr_thishart_state_ptr();
+	if (!hart_state)
+		return NULL;
+
+	for (i = 0; i < hart_state->total_trigs; i++) {
+		struct sbi_hw_trigger *hw_trig = INDEX_TO_HW_TRIGGER(i);
+
+		if (hw_trig->inuse)
+			continue;
+		if (!sbi_hw_trigger_supports(hw_trig, type, tdata1))
+			continue;
+		hw_trig->inuse = true;
+
+		return hw_trig;
+	}
+
+	return NULL;
+}
+
 static inline struct sbi_dbtr_trigger *sbi_alloc_trigger(void)
 {
 	int i;
@@ -357,8 +382,6 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 
 	SET_TRIG_HW_INDEX(trig->state, hw_trig->index);
 
-	hw_trig->inuse = true;
-
 	switch (TDATA1_GET_TYPE(tdata1)) {
 	case RISCV_DBTR_TRIG_MCONTROL:
 		if (__test_bit(RV_DBTR_BIT(MC, U), &tdata1))
@@ -654,8 +677,10 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	struct sbi_dbtr_data_msg *recv;
 	struct sbi_dbtr_id_msg *xmit;
 	struct sbi_dbtr_trigger *trig;
+	struct sbi_hw_trigger *hw_trig;
+	struct sbi_hw_trigger **hw_trigs;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
-	int err;
+	int err, i;
 
 	hs = dbtr_thishart_state_ptr();
 	if (!hs)
@@ -671,64 +696,83 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	sbi_hart_protection_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 
-	/* Check requested triggers configuration */
+	/*
+	 * The first pass checks requested triggers configuration and allocates
+	 * HW triggers, putting them into an array indexed by the recv'ed
+	 * triggers. The second pass allocates DBTR triggers and maps them to
+	 * the HW triggers.
+	 */
+	hw_trigs = sbi_zalloc(sizeof(hw_trigs[0]) * trig_count);
+	i = 0;
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		unsigned long tdata1;
+		unsigned long tdata1, type;
 
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		tdata1 = lle_to_cpu(recv->tdata1);
+		type = TDATA1_GET_TYPE(tdata1);
 
-		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1), tdata1)) {
+		if (!dbtr_trigger_supported(type, tdata1)) {
 			*out = _idx;
 			err = SBI_ERR_NOT_SUPPORTED;
-			goto out_unmap;
+			goto out_free_hw;
+		}
+
+		if (!dbtr_trigger_valid(type, tdata1)) {
+			*out = _idx;
+			err = SBI_ERR_INVALID_PARAM;
+			goto out_free_hw;
 		}
 
-		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
+		hw_trig = sbi_alloc_hw_trigger(type, tdata1);
+		if (!hw_trig) {
 			*out = _idx;
 			err = SBI_ERR_FAILED;
-			goto out_unmap;
+			goto out_free_hw;
 		}
-	}
 
-	if (hs->available_trigs < trig_count) {
-		*out = hs->available_trigs;
-		err = SBI_ERR_FAILED;
-		goto out_unmap;
+		hw_trigs[i] = hw_trig;
+		i++;
 	}
 
 	/* Install triggers */
+	i = 0;
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		struct sbi_hw_trigger *hw_trig;
-		/*
-		 * Since we have already checked if enough triggers are
-		 * available, trigger allocation must succeed.
-		 */
-		trig = sbi_alloc_trigger();
-
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
 
-		hw_trig = INDEX_TO_HW_TRIGGER(trig->index); /* 1:1 trig / HW idx */
-		if (hw_trig->inuse) {
-			*out = hs->available_trigs;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
-					trig_count * sizeof(*entry));
-			sbi_printf("DBTR error: Hardware trigger already inuse\n");
-			return SBI_ERR_FAILED;
-		}
+		/*
+		 * HW triggers were all allocated in the previous pass. Now
+		 * allocate and map dbtr triggers to them.
+		 */
+		hw_trig = hw_trigs[i++];
+
+		/*
+		 * Since we have already checked if enough HW triggers are
+		 * available, dbtr trig allocation must succeed here.
+		 */
+		trig = sbi_alloc_trigger();
 
 		dbtr_trigger_setup(trig, hw_trig, recv);
 		dbtr_trigger_enable(trig);
 		xmit->idx = cpu_to_lle(trig->index);
 	}
 
+	sbi_free(hw_trigs);
 	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
 
-out_unmap:
+out_free_hw:
+	/* Free unused HW allocations */
+	for (i = 0; i < trig_count; i++) {
+		hw_trig = hw_trigs[i];
+		if (!hw_trig)
+			break;
+		hw_trig->inuse = false;
+	}
+
+	sbi_free(hw_trigs);
 	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
