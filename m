Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16891C83F17
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l4zsMLfjFgQ15WNBv25HUhruNuAEnvr1/UtpTbWcm0Q=; b=pR1zUNBo8hsuNffcoc0tnu7fZ9
	O3dumjjHAHGxnKcQMs7dy5peA68Qo+G+aEL/c1QYZkCKfs8TGxk420M+7cgxp/62kgxyx5D9a9oeF
	5KY7WqjzeY+v84ea5jO8KTAn1C8eh92Z0aI11lWpOR6mBo5b+E3gp2y/qESG85Hs5Oq1685jGIYAJ
	dzEJdSL60lrfiXSy0eKyMpZZzZo+r2EGWOhuq5Ejf7s/mUQoPt4nVBzrLBJR4xOKsP77AHuI62LDl
	+SiwNbk3slFICd/RlY/YykA7/hyvTti4Yd2PyJhRkdjkwBOtxl3PBzhnK2PBFe+1rK2uHJHTQFOaC
	WikV/drg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Ec-00000004fUh-45Wr;
	Tue, 08 Jul 2025 07:59:26 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35n-00000004dT9-3gjJ
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:22 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso40175516d6.3
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961018; x=1752565818; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1yFhSo7nzd49HB3Q9uUKkz7c1jtcbSi+3K1Vem5C3x8=;
        b=cluOYB+qgJmrfoQuypQ7fkUgw5zCKaRfUhGa49+IIEvVqtE26cgoUIXSCm+kErIILx
         EyTF1MzQ+3OdE9656lsrAZNcvsIRZo0qrgGfn+srGpGynMrCO7aJDwwTveqQQhvPL7Cc
         G4LpQ/vN1aLLGUnT0KUfwOVAOWPBUehTP6J7Ghl6B7K4I1xBRSBw99AOLQW1B8Onk0t/
         cIjy+7IzUidUqGHNITHaPwk/uRgD5iSC+8eP+EuUoJUZjSvGt63BSPKuAIwv58H0x1Ak
         O0J/Vosle5n65Ede3o1539p49nJNSAM7DzI8VPE8BDYI93WxbmgZY7gNIGWNzQ6q7qfv
         ZnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961018; x=1752565818;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yFhSo7nzd49HB3Q9uUKkz7c1jtcbSi+3K1Vem5C3x8=;
        b=fjNaKWwZLfo5sWg7UvFHR0bALMIu5s8Fk6NCKUrhF6OFqhTyyVUcLpP21dh2yGVR6j
         zPT/stYbS4v49nr8ktxpA0DJmK8ICEytpMoRQfooChH5SDEYOuHHXm0ZH6UbqL3pHz+0
         fC2B/4KwBt0u93WD6awiq3OYpWWeALegtPiDmCxd7bCOmmZqffSkOp6fbJglR6ObAIoh
         HwPUd9snBenByKAuYr5NLerBblsj1Zznh05JIeV0RRHFsA6Ln+st7KqcduYoOq71i3Y1
         ZcuT1ff31mZIDc2IjT/Lp2HfjdrE44Tja3Lm6519qGmwDZhm4jZ5I+1TJDlZHH8eGEAg
         aCYQ==
X-Gm-Message-State: AOJu0YwbbvqnxHENUpCHHnwKrYOePRXjMdet6FiP1EbuLB1HaVGxUlfP
	2ZNslcI3nu616/ce89kdelq9KSHqK/SazoLIjLo4kxmWc/WU4FwTTG+bCGIEWtOLLJMCOwBTViI
	WDEhWeSztRhqxstMWg4ciZjgj2ewFeBCbDtxeTrkIognl3pohbtR0XtYZIocCBuDjOcwaU/4goq
	tZ84Yi1UK+c2ALl47gxl7+4PRPO+9NKU7qyb8v3bVUwnyJWQ==
X-Gm-Gg: ASbGncuafN7fPaipQ7adTpNYYzixGqQByoT4CwuiZW8Kum9L20IBso3HVSPMy2UaIyW
	blo7hiMrVSXFfh706p0QJRC3LUNmv4VDWrQddYFuETNlEXwZM0Tk6vDmibRPLVSuxVxXHEvH+Wh
	7+QpxwHId6MPEesgYZYH1aZsYbtoB1LG05Gajwr34yx2ch3JPG3fwk89S/Sy0tgP/vldxnn+Ob2
	xSWpC1oRLAusUlP12Ji0k+At5TU9UxKVpmdx7P5OtjwXUBup0Zr3lWNKC6HI2Z/SckWyudRLGR3
	UDGUB8AjgttUDfU62lfSncq56tzpGBijptD/J7e5d9JJfHvWZ3CT8GDZCKzJL/XIKGZUiHx8ggU
	cD1n4RO3O
X-Google-Smtp-Source: AGHT+IHyAn92t+KmxPr9jYef3hpruSZJ/Jx3IDJuNSzCHamaBgLr4kMSR/52+Uw4V8kZBlGoxNby9Q==
X-Received: by 2002:a05:6214:468c:b0:6fd:5cf4:cbb0 with SMTP id 6a1803df08f44-7047dada2b7mr32995366d6.25.1751961018529;
        Tue, 08 Jul 2025 00:50:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:18 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 11/12] lib: utils/timer: Expose timer update function
Date: Tue,  8 Jul 2025 15:49:39 +0800
Message-Id: <20250708074940.10904-12-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005020_973986_CBDBC4D8 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
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
 lib/utils/timer/aclint_mtimer.c         | 28 ++++++++++++++++++-------
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/sbi_utils/timer/aclint_mtimer.h b/include/sbi_utils/timer/aclint_mtimer.h
index a245e13e..f8d2e5b4 100644
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
index 3db3c3be..fd6189aa 100644
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
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
