Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88728CA1002
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1WN8v3gCgK/zKWICgyEYSlang0tBKcQ23wOANKD2EQ=; b=j1cwfw7jtO5eA+
	4JRFMEuX/fuXoRXswSSyT2z8nUzhTyCjzORKJEgQhnokCN1dnOZ58OMuSVVVse2keZ4+HrPof8GKU
	HddpaAWLKiepnfVYW/ajf8I/B0fiDJ4nE4YlrqDsPE7drHpsGS/JrOo1aipcR/agqhSRLyD792FIg
	dOr3JCfyomshme9LlDalmw9sjXAYR7DZwoUGtAu3IScS6okVpiQzZsjllYoB3f8voF2xWsAqpZZ7u
	QKV3HVkqPDWzOx5mPgZf1ZL9x/FBj2qehQNTmJJnJQsxb+Gsh8AfaX5Koe/Mdq1jr16uwVWukUiC1
	hl9ZSh+GTlRurS5zt/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbz-0000000EphK-3e1x;
	Tue, 02 Sep 2025 02:19:07 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbx-0000000Epec-35Mm
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:19:06 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4f1ee2e250so1288297a12.2
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779545; x=1757384345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTzjiNz/RHMGwlCKIjPIueyXsGtUqxUc23gRU3w8Zf8=;
        b=kd+sHJOKC3FZ1pPAk8kEKjCIQm/2ikhBuBocauDeiNTR7KpJ5EPnwSROik70s3ZxxA
         8HZ0igVSdKtNb9ITzPtG42XMTiOAwoxjPfm4g8GJPs6a8jsYh1TMnie0gCGxCCXtRYUz
         Vw+xBhRydLZP9MTlNL72Hqpk73SC5vMhKQkuB2buq3Bb1dauptOStVg7nPDOjq9idMDO
         Feu29/ek45tRtFwGxct/O7aFYn0EhfkGQbE3JpCKejlZeesjITZb8xGVZgzHldlcDPCm
         v/iTjHrFdFiSjc61ppOxmg1e2NSwA7rJa587FHwuD8rvlUCClCGoRcsGL3GsmZoTELqu
         TEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779545; x=1757384345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTzjiNz/RHMGwlCKIjPIueyXsGtUqxUc23gRU3w8Zf8=;
        b=Q9tjDTlwKMTUjcpY0jUIGBWXLp2v2nhNej9oqypclkcDqrBtbYqJdHdbTu0ZiXkeX7
         xH5IStYZithv3MG+9+H43R5cObSg7X/1IbYPHQ9JGfSlGlkctoitcvlmvWVfEsN9u3Io
         7bV7xPTOAzpH8MSNt+sIvbeAA0e1rTRPdAUgCEmkjIURlYDwkt2SC9dfKHmu3CYjXs+q
         xZ+d2AlytZfczpw3wTic7bUWuaji3bJUQMEVQExG+6piWHm0dDk0ltxuiAEF7aTqC7UL
         dKTZYb8ixuH2HxPNWHUVFNPQi7HnroYBLBNoRJRNEMYTvsxSBijEiMPC1bFAwMFSWSFo
         kj0Q==
X-Gm-Message-State: AOJu0YwGwkBztIEYt0za24XEiWlic55hfeXKITDNr1uqQ6WU6NRB7X18
	5OnUfQVPPGvT6+sYE6noWm5vBWnJ0YJA421c9xhnvFoV3brX1XtHTLWgOv8O2TqrJwOWovaplCw
	er2S5gSoqnUme5ba6iR+oRLcfEkq47HpnGtXq26AcmRbcPo6HREs792KHTfBNDI/TinaZcT9nGI
	/S7wf6/aNvl+bVbbb+JglPYwhPru4bMTB9LnsVdwXh3OK0GA==
X-Gm-Gg: ASbGncslqpNPFfmxY/FH4fDe9q1QzOrpQewdR+7Skfbwn3WhKRyfkoaUAqNQOvwQQCm
	zFdiYBa6PHdsyoU0pAYdlAMo0rSfAymOHfkt43+kSb7X/bQsCa/wutqdRl4zjAvnQnFR2U2/Z7g
	NwpzU1AsKRmai1IIiIcKU0oxGeqEIgNDlXKJz5zxEIBgBshx4hst03/Hs1FqQ1zRQRss6dX8WfB
	IYUkplgzU/KiQ95cr8vjmT2snLN96xSpWUCZGVo9ykXC8IAoBhK78fCyAiSCQOPftU/BcGYrg5Z
	FmfGhanA0T09xNTXO1NWzYXM+4cNkpISIBFffxp1lT4PQtZiBjCdXqI2S+Dn0nlzN6moEK1sv6z
	h3BTJ1tehVXhPNHwoK8XEH2+lQAVn3AQy/z4eb13LBg==
X-Google-Smtp-Source: AGHT+IFfg12X+3+ArrPO6Hz5TRM1JyxIQzXg/uuowt/smCbO/gNFpPI2wpzokFrUYqi1A2mWBq0uYw==
X-Received: by 2002:a17:902:ce8c:b0:249:3eec:15bb with SMTP id d9443c01a7336-249448e1ce7mr114661635ad.14.1756779544592;
        Mon, 01 Sep 2025 19:19:04 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:19:04 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:49 +0800
Subject: [PATCH v5 10/11] lib: utils/timer: Expose timer update function
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-10-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191905_790117_9E76981F 
X-CRM114-Status: GOOD (  12.32  )
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

Exposing the ACLINT timer update APIs so the user can update the mtimer
after waking up from the non-retentive suspend.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi_utils/timer/aclint_mtimer.h |  5 +++++
 lib/utils/timer/aclint_mtimer.c         | 28 +++++++++++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
index a245e13e285f2ad658fce7db6366fe8b7bae8c2a..f8d2e5b4c210164c8a737e82643e5e49807753c4 100644
--- a/include/sbi_utils/timer/aclint_mtimer.h
+++ b/include/sbi_utils/timer/aclint_mtimer.h
@@ -42,6 +42,11 @@ struct aclint_mtimer_data {
 	void (*time_wr)(bool timecmp, u64 value, volatile u64 *addr);
 };
 
+struct aclint_mtimer_data *aclint_get_mtimer_data(void);
+
+void aclint_mtimer_update(struct aclint_mtimer_data *mt,
+			  struct aclint_mtimer_data *ref);
+
 void aclint_mtimer_sync(struct aclint_mtimer_data *mt);
 
 void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,
diff --git a/lib/utils/timer/aclint_mtimer.c b/lib/utils/timer/aclint_mtimer.c
index 3db3c3be2575e4ddd0180c90f254f7733b7c1daa..fd6189aaa52ad92ca28330fcf0f701ac0b8c337f 100644
--- a/lib/utils/timer/aclint_mtimer.c
+++ b/lib/utils/timer/aclint_mtimer.c
@@ -109,28 +109,42 @@ static struct sbi_timer_device mtimer = {
 	.timer_event_stop = mtimer_event_stop
 };
 
-void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
+struct aclint_mtimer_data *aclint_get_mtimer_data(void)
+{
+	return mtimer_get_hart_data_ptr(sbi_scratch_thishart_ptr());
+}
+
+void aclint_mtimer_update(struct aclint_mtimer_data *mt,
+			  struct aclint_mtimer_data *ref)
 {
 	u64 v1, v2, mv, delta;
 	u64 *mt_time_val, *ref_time_val;
-	struct aclint_mtimer_data *reference;
 
-	/* Sync-up non-shared MTIME if reference is available */
-	if (mt->has_shared_mtime || !mt->time_delta_reference)
+	if (!mt || !ref || !mt->time_rd || !mt->time_wr || !ref->time_rd)
 		return;
 
-	reference = mt->time_delta_reference;
 	mt_time_val = (void *)mt->mtime_addr;
-	ref_time_val = (void *)reference->mtime_addr;
+	ref_time_val = (void *)ref->mtime_addr;
 	if (!atomic_raw_xchg_ulong(&mt->time_delta_computed, 1)) {
 		v1 = mt->time_rd(mt_time_val);
-		mv = reference->time_rd(ref_time_val);
+		mv = ref->time_rd(ref_time_val);
 		v2 = mt->time_rd(mt_time_val);
 		delta = mv - ((v1 / 2) + (v2 / 2));
 		mt->time_wr(false, mt->time_rd(mt_time_val) + delta,
 			    mt_time_val);
 	}
+}
 
+void aclint_mtimer_sync(struct aclint_mtimer_data *mt)
+{
+	struct aclint_mtimer_data *reference;
+
+	/* Sync-up non-shared MTIME if reference is available */
+	if (mt->has_shared_mtime || !mt->time_delta_reference)
+		return;
+
+	reference = mt->time_delta_reference;
+	aclint_mtimer_update(mt, reference);
 }
 
 void aclint_mtimer_set_reference(struct aclint_mtimer_data *mt,

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
