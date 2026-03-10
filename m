Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5C0FD4F17
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KUh+DfpAo64txbjS71Dk3pIEMOVypc33O2fetD3/gI=; b=Sow8aRQRo4XZ6E
	HiDDoSkPF3fGYdbs8xpZipdp2vItKy8BZYXoPHptxlhHIxZo0hvrAlmUM6PQyqupddkv1pdxF0EQN
	evI1Mc6u+1vDm0Z+uxeBLejvnLwm0fk1B3FyMNlbeu27FGil5Sv4xUfv+2i7R3mpToW4z9VtjK+kV
	8g+7gi7uwPhO/B5S2kfDnx6Rd4kNEQsQyGLdF9HrO+kz0upjZdT8u5LVFv+5RnlTs42hvuyWCXvEd
	vbHB1AmwTvqEaTLGxYe6IVh1KZHABj+famUKsLPGGCS5EkN/+/L5GoJfaaxyjXXp6MuP6/2Vefom8
	FMg2+wPJTVRWshKxfstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01ta-0000000A58v-4Bme;
	Tue, 10 Mar 2026 18:33:31 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tY-0000000A56f-47lH
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:30 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2be0629f76eso384138eec.3
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167608; x=1773772408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gQhalQZSc0Joa3xjdRbCLWGKTwRX1iOOAU6PeTDAt0=;
        b=AR2+MIxjmiNjtb7/b8C2ydw149A9lMQJJRfv7usNA7FEyYzL3JBRWA7cKuldL9+O/c
         rHK0AiEVOCko3tDBRjN3gSg3sYdFLThfzXEcb3wT8lLB/iAdAgw9jj9dx0cY0AfLEbJL
         L/8Q4ejOennLbPyh7ojFIuVILIeDejhAJLCyD7hI+SUi6RW0wPttyC+Izx/YR9Db0lwg
         9HM3EP0XgschTUrCd7mt9yMrqNTAN1CE9BOHaosOSfKC5zJevSdvekH5B4H1yB93DANl
         MQ9MF/6JrGfE62MbC2Yh5YxJ4CmmWUG1BHG7VvB7lniybds7OIivrYWEkOupDQy2IB2A
         YS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167608; x=1773772408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1gQhalQZSc0Joa3xjdRbCLWGKTwRX1iOOAU6PeTDAt0=;
        b=ImPMiqb3hXAGcLjqExdW4svtcRvSK8WDyCg97szgFfjFQv36W8eExSwYEKGIrg/19G
         DCfxF0a97Ql+8rNj5LF2us7/STnX3/qclm/LL+2QMpz5PuOPooY16rBU69gSC5F7FWl/
         LoHxfrceEGZMD14Zf8PTCMvn54ggrZeVRCtNmXYkieQHMULINHeJFDti9Qt6eDclnkta
         89fTfoSDuOZT6B7aGrplPjzww9qbxoP631bMj5BrMfi5LthpyAnVwZLXJsd8CoVVb9P9
         eCCF5/zF4ug7YXjPw/fwfdA+MBSl6gJpt6Dd8RNeqwBm2bDsbsLAmLKCPwghmTQOXUVN
         IH7g==
X-Gm-Message-State: AOJu0Yy7JePpLkYcYywZ4nsVdlZYy8qSb8VimypuN85mXyhJ4ibMd79a
	ZlSlGzfWFvJSalUuFA62Pl9O/2ID2q1yYNCzjUhBKoJjUJjtiuwx6GU82xz/5pKd9y4mzAfaRh/
	IUopPnao=
X-Gm-Gg: ATEYQzxrudbJ+Epe1UbkR/0N6TlaPRlKU4Ppew03xwcgSFmSUYhqRBiq3j0S09dxXfr
	EDy0v6S5sGgquihKHQcnrE7a+Lu7pZtR14hVmBPXEALxYp/tm2+PW/ZO+OkYOITnh4y7KPiKX31
	LJo0ls/euoHxJ7Jjzm+TrWuMgZwF1q4Pro8jUcbNNUDoEU1MR0gnm6ljoJee7gyMzoy4uiYFE2q
	OCPuWT35/26anAXx2Z2vMgHPTE81zJnjivNxDoR//3LgDh+RLRLvJY5J8JN7pTCXDxVZxc2W8//
	u3Y5fzOCj+FwvadjFlDsPrwv07+F4JhtsmUaJRR+TYrZ6Tea4ow1u9jx5kWNXKR9jaOCWHaFysI
	eBYcRTjZDnOJ/N2Ce+I9qweUnChSrgodCAeqomrKdkNdW6w8dsWHAPNEtXH7TkxD824A5xm+wOW
	Rup0/BJspYhXSRRHpEpRAQxFx4dpU=
X-Received: by 2002:a05:7301:fa13:b0:2be:80c4:2c60 with SMTP id 5a478bee46e88-2be80c43508mr606223eec.8.1773167607762;
        Tue, 10 Mar 2026 11:33:27 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948390sm14088765eec.22.2026.03.10.11.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:27 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 4/7] lib: sbi: Introduce smrnmi_handlers_init() callback for platform code
Date: Tue, 10 Mar 2026 18:31:52 +0000
Message-ID: <20260310183155.2186463-5-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113329_038756_F11DEB71 
X-CRM114-Status: GOOD (  11.11  )
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

From: Evgeny Voevodin <evvoevod@tenstorrent.com>

Per the definition of Smrnmi extension, location of RNMI/E vectors is
implementation defined. This commit introduces a method for platforms to
initialize location of _rnmi_handler and _rnme_handler in a custom way
before Smrnmi extension will be detected (in following commits). On
Smrnmi enabled platforms this is required to have RNMI/E handlers
installed prior to probing of any extension/feature by utilizing expected traps.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 include/sbi/sbi_platform.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index b67a5647..ec398200 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -150,6 +150,10 @@ struct sbi_platform_operations {
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
 
+	/** platform specific Smrnmi handlers init on current HART */
+	void (*smrnmi_handlers_init)(void (*rnmi_handler)(void),
+			void (*rnme_handler)(void));
+
 	/** platform specific Smrnmi exception handler.
 	 *  Returns SBI_SUCCESS on success, error code if exception cannot be
 	 *  handled. */
@@ -405,6 +409,11 @@ static inline int sbi_platform_nascent_init(const struct sbi_platform *plat)
 static inline int sbi_platform_early_init(const struct sbi_platform *plat,
 					  bool cold_boot)
 {
+	extern void _rnmi_handler(void);
+	extern void _rnme_handler(void);
+	if (plat && sbi_platform_ops(plat)->smrnmi_handlers_init)
+		sbi_platform_ops(plat)->smrnmi_handlers_init(_rnmi_handler, _rnme_handler);
+
 	if (plat && sbi_platform_ops(plat)->early_init)
 		return sbi_platform_ops(plat)->early_init(cold_boot);
 	return 0;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
