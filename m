Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A4DCCD199
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCFpjQ8kd1qUeGnetgRjYl2Qf3jnQmNB4s+OOtnINfU=; b=M1u9z7exkOLTG1
	fTU2+ofZ++WKOA/CsW8ZbzLx1krzU1xVrFC23wbKyta8pw0hvZdOA/F/ItET1eQ3AMqi8OvY/WXkB
	ey6oY6DqO08wZmWn/gX4yjgmyLHMssx4HtnXw/mgqjHGMdBBChBTcAbG/wXOwgjxFA52Pi/9TdFM5
	Og+TUl3OqxOAfXzlZjwO6VHW7iDNzidg2f5KNHoo3lYB/e0Lx3x4XKuh4TUcd2vgPP4d4sdqy1b3l
	O8gaQ6qGG5b7HhtTqxipXStC4s+FcnYbr5EZYgjJyoiUiRWHOHHKZR+z4HgGTnuN4WU3U5ba7Q2Iv
	LBjgBjxpeSXjocw6UrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjML-0000000C2CV-2HXu;
	Mon, 20 Oct 2025 06:27:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMH-0000000C264-1gn8
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:27:06 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-782023ca359so3949725b3a.2
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941624; x=1761546424; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLrM1R3xU4gEbfnxdJJT0CGO1yO/ICwZId+oKEBbm3E=;
        b=cut7RxJLLym5upcLvONBmdwtCNakxfjVOxOoeG5hncGYDSFsOrzbVf/wflet9NMof3
         W6Zk9bnB7s5DLVQ3HUoZMS9v7DhztBwEGN0vKMUde0ehSpbhbUBPj3Vjq7c1FekGLGtd
         wcScpYnXLWvTscNXONyOMPqvm4POAlQwq4BQYNIAtwrGM1/1QtZnakQ/nlJYeJ9n5V9u
         y5mzUmGqlyGHmMOH/vjrCPCbPK/hTa3uxEhB1dR188g3bFF5n8uWYLDfVq/k3FrOhCzq
         mrH/qoQP+azUHtCNqnpaRA/8njSvP9IDbrIsLruXS8vlTL1VdnPwJW3fExsQIx/SEFzR
         9YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941624; x=1761546424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLrM1R3xU4gEbfnxdJJT0CGO1yO/ICwZId+oKEBbm3E=;
        b=FhT3Ju1w6yOZ1yPu9N4niRhf0KX4CLD+0gfybP6gJk98wykUS7ALMC/nk13h2m9+DM
         UCgehqHgYTaxGq4IG2/q6I9uApxqC+cjkrzlVPrZyiEqaLO0K5R7KtjVSIjrFnEsV2sI
         vj3u6QTkK4z0vWfqX/M51GwZ4EfSQxuiP4Tfjt/ZNfrPWPjs6Rsu0NWSFvBSTViu8+rQ
         ZRRVoG78aFpGwPIk4xOh/FZYzF7MDUSEfLbEzDYis6BSLimavQ3M1d4NQm4VIY6+ufil
         fwtXgrnXGPBqpSylxaV0fVOq+pL8hdQsF0CZ/wMfFQUw8NlW4XIlep7n4h6ZV3kP37dU
         xJiA==
X-Gm-Message-State: AOJu0YxuTTxTMD0CMGRjMkLkNHbPSPitHABySJTuM5zBpnPzcmLUNmyX
	WA+RpqsfM/kAL1H3mb4Veu6f1vcdjAouhZVqiYQx3OOR/sNGxRAUjbXpAeUiDhgPsVbphHVlXH8
	zOH9u
X-Gm-Gg: ASbGncvDo4Hy3XmvOoCtHYltAdeAcbZxdJs3lsqeqJu7E4QV67oPSEMIP5nxYtJvQ3A
	b2d6cUoqByD98g5YcZMN1x0iupBmmOzOpx2hPdKGxUcx+q2ygwbLuuZ8lBOnA2g2y5ytQoh6rgi
	kETSxwutZSczMQmraiImPDnE/RcZIH95Gf0PkzA7Ua5FgP9nxZJ7A8OHrbhuakmVVQacOjVQy6O
	EhxYTRyv/L/tq3Gy5pWk0SE/KfEw/QQEN7D3meVBxfP/wGyXgjDxASGoZbh3fno1e3PC+6jS/QU
	FLGArnz/CaUdh374u7wiqaILdg5u/UlLRxiq8D5OtcR/IX1zOILB8ev3kaDwHVTY3+NccTu/Xzx
	AJdMzp/TMPiRH4wZL9cb8KTeNgLCLNUhtlxiDRE632SAadNBLazHq0qZjObx7dpvCNyWRpZ+eJA
	==
X-Google-Smtp-Source: AGHT+IFpuxoqrwwQl1wYgAe1BTQC41Yl/f+sUjGLLm7TJdtlD4SGj08yldUYZ3xY+GX37u7smCCcGA==
X-Received: by 2002:a05:6a00:8d3:b0:781:24cb:13f4 with SMTP id d2e1a72fcca58-7a220a95434mr14489674b3a.1.1760941624394;
        Sun, 19 Oct 2025 23:27:04 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:27:04 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:13 +0800
Subject: [PATCH v7 11/12] lib: sbi: Add system_resume callback for
 restoring the system
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-11-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232705_490274_B0543D5F 
X-CRM114-Status: GOOD (  13.33  )
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

The last core who performs the system suspend is responsible for
restoring the system after waking up. Add the system_resume callback for
restoring the system from suspend.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_system.h |  7 +++++++
 lib/sbi/sbi_hsm.c        |  5 ++++-
 lib/sbi/sbi_system.c     | 17 +++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
index 0fdcc98cce5dac43583e68ffa8c98e79fd95dad4..f48a019a06b6957b5ab9cb4b9ef795a899a34ff9 100644
--- a/include/sbi/sbi_system.h
+++ b/include/sbi/sbi_system.h
@@ -69,11 +69,18 @@ struct sbi_system_suspend_device {
 	 *     return from system_suspend() may ignore this parameter.
 	 */
 	int (*system_suspend)(u32 sleep_type, unsigned long mmode_resume_addr);
+
+	/**
+	 * Resume the system from system suspend
+	 */
+	void (*system_resume)(void);
 };
 
 const struct sbi_system_suspend_device *sbi_system_suspend_get_device(void);
 void sbi_system_suspend_set_device(struct sbi_system_suspend_device *dev);
 void sbi_system_suspend_test_enable(void);
+void sbi_system_resume(void);
+bool sbi_system_is_suspended(void);
 bool sbi_system_suspend_supported(u32 sleep_type);
 int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0d97b43e0cd8f7b4fc97407ef01007485e3f5a24..0a355f9c2372075aaf303cba2aa5683993c4c079 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -455,7 +455,10 @@ void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
 					 SBI_HSM_STATE_RESUME_PENDING))
 		sbi_hart_hang();
 
-	hsm_device_hart_resume();
+	if (sbi_system_is_suspended())
+		sbi_system_resume();
+	else
+		hsm_device_hart_resume();
 }
 
 void __noreturn sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
index cd0f4ba42bbe67e606bc821870716f7342eaf0d2..5500b05d22882bd43d84a1b715529cd8a26bee3f 100644
--- a/lib/sbi/sbi_system.c
+++ b/lib/sbi/sbi_system.c
@@ -87,6 +87,7 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
 }
 
 static const struct sbi_system_suspend_device *suspend_dev = NULL;
+static bool system_suspended;
 
 const struct sbi_system_suspend_device *sbi_system_suspend_get_device(void)
 {
@@ -137,6 +138,19 @@ bool sbi_system_suspend_supported(u32 sleep_type)
 	       suspend_dev->system_suspend_check(sleep_type) == 0;
 }
 
+bool sbi_system_is_suspended(void)
+{
+	return system_suspended;
+}
+
+void sbi_system_resume(void)
+{
+	if (suspend_dev && suspend_dev->system_resume)
+		suspend_dev->system_resume();
+
+	system_suspended = false;
+}
+
 int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 {
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
@@ -189,11 +203,14 @@ int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
 	__sbi_hsm_suspend_non_ret_save(scratch);
 
 	/* Suspend */
+	system_suspended = true;
 	ret = suspend_dev->system_suspend(sleep_type, scratch->warmboot_addr);
 	if (ret != SBI_OK) {
 		if (!sbi_hsm_hart_change_state(scratch, SBI_HSM_STATE_SUSPENDED,
 					       SBI_HSM_STATE_STARTED))
 			sbi_hart_hang();
+
+		system_suspended = false;
 		return ret;
 	}
 

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
