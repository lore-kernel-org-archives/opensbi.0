Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA44CA1012
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1WN8v3gCgK/zKWICgyEYSlang0tBKcQ23wOANKD2EQ=; b=tij5mLrOJjXrmD
	y8k9tSDz+NFUcAB13q61T1OFb9fwumABpTsWRPa5Um+TqzDbSYn9WGt0XYOZkC1U8rq7kEnCOQmSM
	yVCVN++8eahlpEOZH3p7MCoavvEIWd3pOnxBxVGBCyElGyp3vW01Xvrzgy5LIaOyJXkeneCgk6wZH
	Rcf/0NtueXENjUX83/HHWEkylkf+rEQnL3xUiR1XishfPw8riZFcegMxjqAElLJ9TRvHNEJcMlqvP
	14PWXqIg6oT9uvI6JYwFl16ZkT80oi+OlLu89w49T1WfLwqiFomWIm0IQTUy56pH96saCmWkQSOXo
	ehbutKPy9J8cqJU+JJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7y-0000000G8EI-19Vy;
	Fri, 05 Sep 2025 02:24:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0N-0000000FxjM-2oz1
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:48 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-32b6132e51dso1251913a91.0
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038607; x=1757643407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTzjiNz/RHMGwlCKIjPIueyXsGtUqxUc23gRU3w8Zf8=;
        b=IIXneACaZt4idSwrTPpclm+UJVAIi9xmWXYJYQCKbF+4UqE3khDqnT5lVYcESACXKE
         lBM84HM8rGfxvd6p+6tM+e7jjQOPjwIqiXHhZFvmj0+FQxVvuTRdB8eTtlXyDeETdm+P
         1DvI8ShUlZi7joV8rLAbpCyEisjjLHprYpc9D2HEPi0x38R5AQ9cqYJ/uXApZo/iduTg
         oAV+Q7MGYm5M7ZzKpQq40kkCNUL9tjXv/mrl6cum33kRCMhqtOXjd8fNOtayHcNV5e8T
         RonW5CpO0tY7RDkRBryLnlvkNW0pZ20H5GsEtfozmOwszN3c/06WmApsCb1NaWo2gTAA
         SZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038607; x=1757643407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTzjiNz/RHMGwlCKIjPIueyXsGtUqxUc23gRU3w8Zf8=;
        b=oVDOQVa/pbU6Jjqh0JDJc4Y0XJXsU+XibMi0MLyctAugAaOhx3FVQnDPQIxh3CCVtQ
         AupTeApDkaM6Fqy1Gcp1MVKIqyrDu6s1mvpO1zSaepo2A+r0dP/7rn236JRJLxrb1Bww
         6XBTg7gwgeJEu4i4pRSOgA3uJrxXMKM9xKY97EyF/u8IonJyL+mLVhTuKRbsHMnPFzlf
         G1xwD9L7Qne6MwVuLnsa282y0xDWDhTPWxc0Xk3SGBe9+AE+MpRSTDWtIMXFGjSTxWIo
         WMvGEcAbyTeORGfojBH3cuiHz/9WBHzjDo00PJfFlV4GTKaR4Mbv+r9CCwx6ox5X/5cm
         jS3A==
X-Gm-Message-State: AOJu0Yx4qxAn1Hz6qrEIB4i1KV8JPb/TeEAk8gZlglSksFsJIUMfT3kE
	38lPBhgtI7R+Xh+QWmevxAma4CmLgKsEhQUNrKf3FsBhmOlAqEyyVGh7kcUp1eqibKq7WBqlyYX
	3chc84NKQ2PIBRUY7GflgTW27BCv8Wyc+UkiMVkMKmu6Xxxl0bd90mPvWnXSh0C9Ao6cPB6hLnF
	29V1d7kfZQ+9Ta811bcI11BqzSz22ZsUmIRn1kVeejudGebDzC
X-Gm-Gg: ASbGncsZFrDKRoD8nDZubXaKIUGgwXAKiVgQSRxCRdV1o3CgfKQ2DMFAQ6aJMaN6RAv
	guNvUhhNT7t7hNbl3Zv2EqckNC2AB/t+NTWyz7V8j8CbU2APOYDMEv2n8nUyRlWHDEaOXk7VIsc
	hhJibPkr4kjC0QYxUQsiTbeem/oYyPW63hpZt5pYx/flJgRdhtaaowrrkcwUtyIEmBiwFRj4tIt
	WVT4QDclp5aKqkZ9WuwlJlA81jOAJImxRTAinkLGsEargQwszHrprjuop4mX86IEy6+MDvZu/pc
	LjXi8XHQ2oTqQNCBmIzFkCzw++y/TjktFf84ePGUgCxncDF4wA7nTCK/xeV9szn99dueRa/ekcA
	tpkIJ8vEhCzpGXcJCvS9OzkhEiq5Xl1w=
X-Google-Smtp-Source: AGHT+IFnnxDsrozn8nSPW+gEk0bh9g8p5rwfI5JO6oU4efwjfYsYLu5vA+3PAasVb8jKtx7krVCu1Q==
X-Received: by 2002:a17:90a:c10f:b0:32b:6cf2:a2cf with SMTP id 98e67ed59e1d1-32b6cf2a471mr8561678a91.14.1757038606442;
        Thu, 04 Sep 2025 19:16:46 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:45 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:43 +0800
Subject: [PATCH v6 10/11] lib: utils/timer: Expose timer update function
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-10-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191647_718787_77204B73 
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
