Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C464CD4F39
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vc3lt02zy61iYwvtonqcw0kP7U/nJkTYgL7lVZ3O1WQ=; b=ANIl1LYFm5PWvk
	Vb2MX1ZBY/jL0+y0+Fx1EHvl85Ja6MD9V1vBgvIH0yOtTpfqAF3bTGwYnyxSYulfSbLgCSOwJQZIP
	1/ENSt/6/PlRbD1Tc5ysD5zJnjuZd4fl7jYJ+EwghmCjxE/M4qeKWcCjFMpNwW4eQWmWL4ZA8lFru
	eVTptx6ofY72T2b1/PLaQfNRPh9OQjGHMcedplPTDVSbzJM5y2/JuYcm8fO4y75yuKcZfhpeTcCal
	myrSy1qUZIEdyKccCgs08BPwE6zsktzPyB3YtLoJ6IIC5ie06I97l/JjRRKL8RJkmXNBf8L4gXEkB
	nZjPy8cgvJ2STOHWSJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0k-00000006m9p-3Ey4;
	Thu, 14 May 2026 22:58:34 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0g-00000006m6P-3gNE
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:31 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8c7154725easo31444076d6.0
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799509; x=1779404309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SC/7MuguqEuTaYNRLtuMXV/zpgpn0hDPcqZfukHMLM=;
        b=fQpQlv2ETOabYij/5O00tLYZiPX79zHqnmg55AegwQiHI0ipC/e5pB4HTdF5sUidpn
         hQktSn7mlU6zlPU+4kwuzcTW1B0NyoLem+6b7vuGxyVMHUec/Z0w1T6iqZHtiJly002n
         3e6kMfWkVm5U9Z0c387GyBZSD/NGVbs8bmagzHVS1fmkZVUJ6xvPl9xhOKgWHGMSd2l8
         /P+Gkagw2Hiqq/VIbYatHEFuGjba7kwHltdY2Y8r4n/Pbnf9GClas5ogIwQvp1x6+4Zr
         mZiQLvvgp/jAtmot7/XQJMQv573jY5K+xPUoV4R3ep6CZlAcQTTVgoqZFiyPG5AyvtoB
         zmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799509; x=1779404309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SC/7MuguqEuTaYNRLtuMXV/zpgpn0hDPcqZfukHMLM=;
        b=p/iy6+PSuDbENsc4QPWQcmexWGD7+JpyQFPIMo1lTwc7FA69FGRqPN4V5Vvai1+AgC
         j+A+D4KDrHtLz/T5UP7D/WK491BNlS+QQmtsH3VgH3mXjbQrVi6E0P6bLPgEZvn8d+7n
         mG+Ds68BMliLQX5sZL+QWTJcT6Q/dVCIABekqxN29mbB9ZoVc5wJ8sCJRdlUwJoGC37P
         2PcLq5PU5XbxoRxigae4Lij3/1MRAGaN61lpZorVaHk26+7M3YzBPjG2BWgGQZmqH+sh
         W7P2oq4HU/tKTVsUgP/WX5BSLjhmHTx8bpbu97t9wC3jPhZGX9dV7tXrJQ3uFjKdud0L
         E9LQ==
X-Gm-Message-State: AOJu0YwVOPYMKjr3UiqI2iX6UrqAOkgM4Vbhk9Ltsyebq/BaKyFFf/wE
	4hklVFBbMGLc7ZTkwGcZD6DCyfKH4AK6xtvqbgnOOj30w1KxxJ2JT3/wBtSNbQ==
X-Gm-Gg: Acq92OEZNj33NcXosclZGGZ2YM1PCqNaf9hUV35Nib5SGXdhTElJixbdgtd3wuQuNr9
	j+3cFzGAzs+joB0uWSthbM1vswjvc+e71pMs5dxyvxT2/5rWIDMTUxkeK0oAYLULSHaRgiHo12M
	zTXpPeDuKLJz7c2JkknZFbxaolgQ7rmrlwG1v/LtBsAHyi5RVuoI5DvtZlC+OQ7Psl1zqFv4l+/
	5ht2NF1O2m8yxSQwCfddiMNldqch2Ze3Ljb9KNaDUYX5J+72HP7TjK7DiGnckOOTLKkEQn5+rGH
	hGId0dm96Oimrc3LhyWIkXyITyYX5QdZpBoB6mXU7AEjTadN3sZQW7enrGvrGx9ar+rVttq2pdx
	b2m/HFo/9JYfgB7vjIotTsv+HbuR1Uu7HWFADen/TnvaEh3qq8V5KpRUHPsMFOdmKUNpN+ObLIH
	Sq+mWVUJJkcRDGd22jB+9sQihZ8qIRqjPGd/vay+jHvfIqaNtvpPwJZRz96djS6JFRy9YyWGlsk
	lZ1QPeFTeNoixRdP5Iqvw==
X-Received: by 2002:a05:6214:4d0a:b0:89f:2fa:a9bb with SMTP id 6a1803df08f44-8ca0f601d65mr25406826d6.9.1778799509205;
        Thu, 14 May 2026 15:58:29 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:29 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 09/10] lib: sbi: domain: ensure boot_hartid is assigned
Date: Thu, 14 May 2026 18:57:55 -0400
Message-Id: <20260514225756.2255758-10-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155830_930975_67CCF737 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

From: Raymond Mao <raymond.mao@riscstar.com>

When boot_hartid points to a hart that is not in the domain's
assigned hartmask (e.g. due to cold boot hart differences),
the domain startup can skip starting the intended boot hart,
leading to intermittent Linux boot failures.
Scan the assigned hartmask and pick the first available hartid
to guarantee a valid boot target.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 lib/sbi/sbi_domain.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index c33f2b3c..ac563615 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -819,6 +819,30 @@ int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 
 	/* Startup boot HART of domains */
 	sbi_domain_for_each(dom) {
+		u32 boot_hartindex = sbi_hartid_to_hartindex(dom->boot_hartid);
+		bool boot_assigned = false;
+
+		if (sbi_hartindex_valid(boot_hartindex)) {
+			spin_lock(&dom->assigned_harts_lock);
+			boot_assigned = sbi_hartmask_test_hartindex(
+				boot_hartindex, &dom->assigned_harts);
+			spin_unlock(&dom->assigned_harts_lock);
+		}
+
+		if (!boot_assigned) {
+			u32 new_hartid = -1U;
+
+			spin_lock(&dom->assigned_harts_lock);
+			sbi_hartmask_for_each_hartindex(dhart, &dom->assigned_harts) {
+				new_hartid = sbi_hartindex_to_hartid(dhart);
+				break;
+			}
+			spin_unlock(&dom->assigned_harts_lock);
+
+			if (new_hartid != -1U)
+				dom->boot_hartid = new_hartid;
+		}
+
 		/* Domain boot HART index */
 		dhart = sbi_hartid_to_hartindex(dom->boot_hartid);
 
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
