Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C40CA0FE0
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l4zsMLfjFgQ15WNBv25HUhruNuAEnvr1/UtpTbWcm0Q=; b=vS2uM5i003KktDIMgITp/yUxtN
	4C0Ke28bIjE91SqGViW2xqLrE+DLeT40kzXetm3OHtLDCtanQn+/YnJ/QaGv5/JAKIrbqg6fQgHlW
	DbC1GcmjBnTaUr5lKfws73O9uT/pg/omwTjvWcnv47kcFw234cUFOkqHgY8dQl726y/xfvyYki4IQ
	FRLk4ka+Lv530ciRLOYpLshTazfM+LBck0I0OlI/cjUhuys3FxmmA5G8SiDAbozWscjhvZBAKi8Nt
	6Su3v33lXKMpCNM8bivek47e2TGVUhldiaHIiRWIU85NdNyN8D+k+iB1hxO6pA5OQp61o8xAl4AMW
	hYNq1EPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbM-0000000CHT8-37Yi;
	Wed, 20 Aug 2025 03:35:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZf-0000000CHEt-201e
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:20 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-323267b7dfcso5563677a91.1
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660798; x=1756265598; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1yFhSo7nzd49HB3Q9uUKkz7c1jtcbSi+3K1Vem5C3x8=;
        b=XdpzhUi1I24T0ECuDCSINSfbOMgLFyilH2ILWpHRFAkg87VMIZGfT+9ZsrslovH/CL
         DAgK31fQYG32egtaXnkAxeegliFG2I1eftyPt20vNhZ0Ty3Ga0/IN4i2qflTikEUH45B
         c5RaJURRp5inQUSjtkUyqgaMIjWWgBzZoFd54y04EGqO32HKrxweOAlsIH2hLuXO/4Xd
         numYlkJ4DJIiC7DZLcWx2DaY+JdSWv9GMuqEQN6o9rqvo9Vy0q6xsRE/IJJkIn8LYs1n
         9blQKX5hnyxDoCPFGh/d2/fux31xzzYdNgO0HIMoR9vULHw0zlQObm7VDA2SsOT81CKj
         VLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660798; x=1756265598;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yFhSo7nzd49HB3Q9uUKkz7c1jtcbSi+3K1Vem5C3x8=;
        b=Iw+bfsBEMq5Snxq1vQTT6ENreW1GcUuM9yyThO2TCpWipIuD0nDmlhlHkWiAnh5f1X
         jFpRb9iiMK5brdkQbnT1ZLhHqcN/xbWtT0ctE25NuRAGt/MtZQRojnqgqfhJQJKxaRUQ
         glVTcNJRbQ3oxWNpdzKUgnnccR1j0xYZsmdJJ5jqPM7uGiJEIyFul9Xicyj+nrytkeAc
         oUpDBcxMJcvUYqSxZosdZExkD0VX6RzWlfGLBe3aqyG0J7T0QVL/TasQPbbpWp1+5a9b
         1gRKvisLcP7DT5FK4/byZqeJqYDMmgBfPRjfIEXOC5nQnOXHx4bHnSmMDO6uEd+cZN4t
         r2WA==
X-Gm-Message-State: AOJu0Yz7npxXnUsMMFxfyHb9KPkJwFWXFH5tdtC95VNl0cP4rhsMHu50
	+cAxuhwIXkXgmJ9yElTWvHJwPhFN9sR50QITlVsoLd1QRzWm/s7tgxi+Vr8GxfVYZDVnleHapYl
	C/3iRRm2t+0RHSC2/T8eefjTeeQLpfKDMOhyBDz7tmituRfwp4ALCBY9R41zbf4l5y7fPD1Dwmf
	BkUlouu63VAIYOiW+7zBICJ1D5xyNdc+SQKfeb6MgMRIqPfA==
X-Gm-Gg: ASbGncsIK/F1KMDCot+P1D0yY7vVPhuy0TjT1sClvXW3x+QeJ9HaM3+6HpYQPdtZ/1z
	IDCfeOMev4H6LnOd67OMe6QQiy60gt+9oydFqwiOKeGapFWe0103/tiVdKMJSigek/Nj5W8yFbQ
	moDCySMmG4a5+Q2Ft7HGfvguU583PwnvPGUF5RhW1Ib1aBA2FwjJA3UVXWarQ9h+z5Amu/YmUgw
	B4aAmGsQOPz4yhUupWACJciJ86++emODVDsrvksKj4NFjM9+fI9nJ0twJ7T1C1Frreip44qV3u9
	kla1b2Y0pgLLJF1FTAdMZvfYLt8LaNdbjt5nAa3dmmj7GTurViKGkhnlD8gOQFEgXy4nIulBD6O
	jrtIItlPp5IEmZlG6h5GSQ87QNC7SkcG/hzsphKkrWbwpRd25h32a84M=
X-Google-Smtp-Source: AGHT+IFGCn01ZFhashQrrh3Ps9klrHTXzvd+7ybDahKfxX2VXmhmTFcHIzVIWrjrIUVTppU/vF3qWw==
X-Received: by 2002:a17:90a:e70c:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-324e147375bmr1512706a91.32.1755660798157;
        Tue, 19 Aug 2025 20:33:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:17 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 10/11] lib: utils/timer: Expose timer update function
Date: Wed, 20 Aug 2025 11:32:49 +0800
Message-Id: <20250820033250.544-11-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203319_513298_DBA08B5A 
X-CRM114-Status: GOOD (  12.03  )
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
