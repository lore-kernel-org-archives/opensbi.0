Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D6C5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0oZLcjrqbJmAOZl/qnIXO0fmj/HnGv2e1fnZPh33h4=; b=ZzPTkHvUf2Q7pi
	yasEzAPh/W8WOwF3V5du+3FNdnZocW07K5wwJGZ8EoAUWeZBrzLrMJlk5OB+o6fdfSSxtoXLk/pdd
	lv7aT393uNdl65ZT6YjkIAkvuw4GeCBOpHa/uphIawHefUYQPCGZ0hbIu2varZ4N52hSX5CNgtkID
	66n6m183JZ+B1fvVZ4DCZmdFPUBkmBrCTSuq5iW5GaOeDDg16/KNoMMnp87vRGs9qACoRQNitDZTP
	IurL2rUdhedMBo0H25WtrSAfxBS6MsOVhlLIS3vxND5/c8mXiyaXb5h5C8Yo/jFSQCCWyP9mruYud
	bLVCy+Fv4FQrwsunzOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHk-00000005lc4-1d24;
	Mon, 17 Aug 2026 09:05:36 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHh-00000005lZx-35uu
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so2304243b3a.0
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957533; x=1787562333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KFNgh9i65PRvfuEevTI2XJHe3XsSUnjYkzFcs0PJgE=;
        b=dQq1NulpMar/3Zg5631Ygi/ad66Zvw3I6qMjLiEV11gN0GcBCGFuMaGuZ0QvTbokWg
         5zjDt4bfRa9P5zuWEtuUMN5GZkF/0/GIcDUDa1YeWItMe4+VR2x7eJ00zOwSYofRoL+G
         vSwShbARTTPPkTsPUD3lNDyk9mrTPkGbXJkyXENzvqRvcx3rdVo51oVcEbkaGDyWHsz3
         6sMmns4EweSBkGno9+HjREmNg0VO447URlWZHSpQdfJ4PU7iJGHaWMB98FTRdhImQtJc
         +nt6teYuE2m5F3HiFlnlD7vBfcToGfnzy3EcyHDoeBzzxOGwH2XP0FskgF8qVq4caveU
         ztZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957533; x=1787562333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KFNgh9i65PRvfuEevTI2XJHe3XsSUnjYkzFcs0PJgE=;
        b=mEXNN5NO+QtRibEZQMwaeeBkep6JD9EMr7ls5WoMcctJiw8rWSsIaEiSO4w+FtuJ9o
         TL2OnVsa5I4PMmt5sE+qSwq4S9jbmxjr98/uMQg8TDPQB5aeXAqQ+6cfm9i4t/gy4PDj
         c7q7Tia0/lsLYkzj6zSZz6NIKaawRWnhvSVniCGllbksdh1+DgMCX+Gu3yESRrDJroii
         FYAGEpl262XdtGw+bpaclM0Ir71lFLTASeIL5i7mzvGd8UV7UhaysNoFGINr4ZnyXD79
         IpvuB8u+rLuy1lNjKc2z3TFoOilw9hiuWjpY5Tp9AckmPU8XnupQBM4+WmxbX+93Sks6
         l8HA==
X-Gm-Message-State: AOJu0YzS0BLnEUzIoxIZqEQ804bRTucxdTRcg1O4F8gMwmGVmO3L+DQn
	hDHeKCTqHB4eNd/gTjoU78SpI2AjRiHjHhK5S5zC941s9Lie31vEhfq5iymDWjSWglNMdAAS5VG
	Cg9nhOYTMf20uIkW8rEJRZjxAA61Bf5X/xt8XiyYc9fbR6AMNXiGaZeikGcKuBgJLOvqsvn4UDD
	4QNk80NI+5+CtmB9FDMdpeKZ//zTNCpqdNCh5SCiQjTzUfOUmPTAA=
X-Gm-Gg: AR+sD13HykggcRBdQpa4gIDXFcqMVC9M9eC97AzFWGhMafH+CAJdBTsiYiyZkhX9g8o
	P9HTWzjS/Jq0OGZhByDp7YyyXZ2O/rordfoCmxmU9L5/0QWKf+I2gQCUncApEnBdsT9Fa+vwJUb
	gddn6mV8CGBxbMqpLyy3ZmJ0njiPrygflC1J42tidYBdR+bnZTfjcByB72kwHxI/6BAVKmtw/Z8
	QtLq2wWv0t7xAMcwmGnCL6p/78MWX8q8HPBvXaYb7ij63NKuIW6FEycPKBGwRaKJf9RaL/heR+e
	LUSsEokkNz9i96hNQfRuqvMh7lTjKbpTFrLoMSdlPAQ0uZRfSK1MLoaa9Ip5BiLc/d0/3/urA5v
	1+t5+mSSFHW7G5jwVdfUmy+i1knlTPxEaSvPk9BkESbkejpgBKLWgKf4IRoy5aLRC28HlSDtGpI
	5BNmwbYLuQ7mFtcjSHMiohDV/d4EIelEtMcRCdA6y3FJKYeYS3oe9OPg7M1oNlLw0C9qsmfF3ZD
	HUsr3jda67QLLSgRcqsoAw=
X-Received: by 2002:a05:6a00:6c8b:b0:847:8910:ad76 with SMTP id d2e1a72fcca58-84fde3cd21emr25950978b3a.37.1786957532670;
        Mon, 17 Aug 2026 02:05:32 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:32 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
Date: Mon, 17 Aug 2026 17:04:59 +0800
Message-ID: <20260817090503.2104998-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020533_785548_2CB6FDA5 
X-CRM114-Status: GOOD (  18.80  )
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

Register a WID-based hart protection mechanism that
configures mlwid and mwiddeleg CSRs on domain entry.
This enables the protection framework reconfigure WID
isolation whenever domains are switched.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Changes v1 -> v2:
- Validate WID against pmlwidlist before writing mlwid CSR (Oza)
---
 include/sbi/sbi_hart_worlds.h | 24 ++++++++++++
 lib/sbi/objects.mk            |  1 +
 lib/sbi/sbi_hart.c            |  5 +++
 lib/sbi/sbi_hart_worlds.c     | 72 +++++++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 include/sbi/sbi_hart_worlds.h
 create mode 100644 lib/sbi/sbi_hart_worlds.c

diff --git a/include/sbi/sbi_hart_worlds.h b/include/sbi/sbi_hart_worlds.h
new file mode 100644
index 00000000..2bb35a7e
--- /dev/null
+++ b/include/sbi/sbi_hart_worlds.h
@@ -0,0 +1,24 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#ifndef __SBI_HART_WORLDS_H__
+#define __SBI_HART_WORLDS_H__
+
+struct sbi_scratch;
+
+/**
+ * Initialize WID hart protection for current HART
+ *
+ * Registers the WID protection mechanism if Smwid/Smlwid
+ * extensions are present.
+ *
+ * @param scratch pointer to scratch space of current HART
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int sbi_hart_worlds_init(struct sbi_scratch *scratch);
+
+#endif /* __SBI_HART_WORLDS_H__ */
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index c29c888f..ac026dec 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -77,6 +77,7 @@ libsbi-objs-y += sbi_fwft.o
 libsbi-objs-y += sbi_hart.o
 libsbi-objs-y += sbi_hart_pmp.o
 libsbi-objs-y += sbi_hart_protection.o
+libsbi-objs-y += sbi_hart_worlds.o
 libsbi-objs-y += sbi_heap.o
 libsbi-objs-y += sbi_math.o
 libsbi-objs-y += sbi_hfence.o
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 29856c0f..e92f0af3 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
 #include <sbi/sbi_hart_pmp.h>
+#include <sbi/sbi_hart_worlds.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_string.h>
@@ -762,6 +763,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 		rc = sbi_hart_pmp_init(scratch);
 		if (rc)
 			return rc;
+
+		rc = sbi_hart_worlds_init(scratch);
+		if (rc)
+			return rc;
 	}
 
 	return sbi_hart_reinit(scratch);
diff --git a/lib/sbi/sbi_hart_worlds.c b/lib/sbi/sbi_hart_worlds.c
new file mode 100644
index 00000000..d9d69b07
--- /dev/null
+++ b/lib/sbi/sbi_hart_worlds.c
@@ -0,0 +1,72 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_protection.h>
+#include <sbi/sbi_hart_worlds.h>
+#include <sbi/sbi_scratch.h>
+
+static int sbi_hart_worlds_configure(struct sbi_scratch *scratch,
+				     struct sbi_domain *dom)
+{
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
+	bool wid_found = true;
+	u32 wid_val = 0;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
+		return 0;
+
+	if (dom->has_wid) {
+		wid_val = dom->wid;
+	} else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID)) {
+		wid_val = csr_read(CSR_MWID) & ~MWID_LOCK;
+	} else if (hf->has_pmwid) {
+		wid_val = hf->pmwid;
+	} else {
+		/*
+		 * Smlwid present but no WID source. Without writing
+		 * mlwid, the hardware reset value is used which may
+		 * cause a software-check exception on lower-privilege
+		 * mode entry.
+		 */
+		wid_found = false;
+	}
+
+	if (wid_found) {
+		if (hf->has_pmlwidlist &&
+		    !(hf->pmlwidlist & BIT_ULL(wid_val))) {
+			sbi_printf("%s: domain wid %u not in pmlwidlist\n",
+				   __func__, wid_val);
+			return SBI_EINVAL;
+		}
+		csr_write(CSR_MLWID, wid_val);
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
+		csr_write(CSR_MWIDDELEG, dom->widdeleg);
+
+	return 0;
+}
+
+static struct sbi_hart_protection wid_protection = {
+	.name		= "wid",
+	.rating		= 100,
+	.type		= SBI_HART_PROTECTION_TYPE_ID,
+	.configure	= sbi_hart_worlds_configure,
+	.unconfigure	= NULL
+};
+
+int sbi_hart_worlds_init(struct sbi_scratch *scratch)
+{
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
+		return 0;
+
+	return sbi_hart_protection_register(&wid_protection);
+}
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
