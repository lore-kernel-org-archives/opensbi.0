Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C0109878C
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYI2miNalmOdiSK6C4/PMIxUF5FySzS6DO7bLeaZu3Y=; b=GB1lT+IPe6BQck
	baOecUW+vNCubzqFnefusKFBgvv9/l4pNOBHCAGZLnMmIgx0AjGYzuqjxf49o9nwWIJPFpV5l6U0T
	pII4PKDZCjL3iqdbCueXz18ugnwOkP0IchqKe9Vzdk1lGOZgqFBpNp8Y/KN7PJ8TPnEJBqixLyJaF
	A8UgQ4Ct6WRFBMduqykHKJpvawR18krhwc52+7ZHMaVyOgwZEzIGavWSCQoFsW95Aq1WqKg2YvxEG
	nI5za2XaEhc7CEDQVVl9aBCcmRDkasmi2taVe0paWGhXbCoRzRpDiU+HPxuXn+N70jdVoNOoZtzcC
	6rLCeS4glMVembIiAZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3art-0000000CwZB-1WXp;
	Fri, 20 Mar 2026 14:30:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3arr-0000000CwWu-28wG
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:30:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-486507134e4so24909095e9.0
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774017025; x=1774621825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qr/krHBHcfRCDjqGZ7U7gAQp36r8CFuoHHYB+q8Li/g=;
        b=HxgM6wmox7Ex2saqzcEiCs8DJPgUY2TlMXWlxpyizc5LDY0+5z93j5OJ7Z1zs++kiW
         iouOQ3+8E8ykhST8SXlMvzdYLrqYzHPTBKEZ43mNDomZmODdUDpmPEgxEeafEUig2QH/
         9NDZJnSTHrh6LWp/xDAEHEBnlYukDmx3sa0iXwNTVw6z9ZpQ3SE0I3Q/ga08gGtxedEM
         tnIPX/+ij4XvmvnpMsbBP2/oofaqhZV/mSLjjrT7GtXkQbci4pjKfvyR8IKiatqLb31e
         FlqxrM5pQclfofKpYYkvwXDyTEZBRp2Yu3qKRLYtRHzkIU8OqMGqUe2DZEb44sqMOk1Q
         7fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017025; x=1774621825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qr/krHBHcfRCDjqGZ7U7gAQp36r8CFuoHHYB+q8Li/g=;
        b=hT613O1BV38xmMaBxZRgzOmRXZPuxMdPI2Qqfy0i+QlsCYx+F69l/b41CcAOyxalJp
         slJsaQKE0CXJK7snOt+l2BZBj0oqKkwNmUJUshft4VfiavTnze3tisz3J/APgAARvxd1
         cHZv0qWQu2wty4pEkQl6JILcVH5deNkmWYcz/1qAP+L98o0LLaXx1l4aKUzVNjRXa8pN
         HMkSqeIKjQccU6QvatiVLWuMGSSEecIsZ3m4vYMPFnJj8jenRYUX+Tjrby2Hq2CFftRF
         WcN8uEMUGIthhoRf/NapBuhV8CO5qBJH/Vz9UDdRZXQLn2T3CqbppBcBEx+RroK7VsNj
         +eog==
X-Gm-Message-State: AOJu0Ywmb6izfLLtk4WDMC1QAvczSnQSgElaDsFcGyRQ5aIjs37PKlfJ
	rqURCTl50UT93RGyttnE0kAuEanffX748D3hWVEvn3ye/VvSJq6+eiFbmPgrR4k04TcJXqxWjA4
	taMUD5ro=
X-Gm-Gg: ATEYQzw9yBNBuje7HGbDGdeykIekA/lDRjTEDcwE5BMx4Bhi546QaE1eM8iuu66s3KF
	jn62ZK/GifPmz16toez4qOPDAX0GiSUa67MSBnEFZmXtPaZPvRpRHSmE0/REj1f8sFYUbveViwv
	FVaUAmPKUAoA+Kls9En8uHbwNOVMNdkUvQq/Xw1CL5EvkQ0IAIHKenVPkP3T1WuqwOThIr7J9/W
	yooKzs6uQRnGUhwKt1LkuiqZ31Wf8f9xD1VwbiLu8sX80viatGNrHEgeTJjuXZ4p7g/aJwbTUOY
	CmHqyh9mv5XGPA+pzJfkzQITGShLo6Fm9up5PNYwBeJp64zs6xazSuSFZvlEcua3jIZEkF9E0Wq
	cuGarabnuI/x8r40PKaaPJVjLvTqbZqD6vr+HVdgQhLI/wmYZDmasC1hUN9u29pVQG/C1b2fLeu
	xTrUKvoTQf+KgR8u3pVMUzoP9bjf79aTFHj/wSB0JNOfCOzWH3MMdHowxpdHDrLD3Qblw=
X-Received: by 2002:a05:600c:548e:b0:485:40c6:f51a with SMTP id 5b1f17b1804b1-486ff028ff2mr50737115e9.31.1774017025460;
        Fri, 20 Mar 2026 07:30:25 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1aeafdsm16608435e9.21.2026.03.20.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:30:25 -0700 (PDT)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 4/4] lib: sbi: trap: Save/restore FP and vector state on trap entry/exit
Date: Fri, 20 Mar 2026 14:30:18 +0000
Message-ID: <20260320143018.74191-5-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320143018.74191-1-dave.patel@riscstar.com>
References: <20260320143018.74191-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_073027_577274_FCD06A93 
X-CRM114-Status: GOOD (  12.25  )
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

From: Dave Patel <dave.patel@riscstar.com>

Add eager floating-point and vector context save/restore in the OpenSBI trap
handler. The FP and vector state of the current hart is saved on trap entry
and restored before returning from the trap.

This ensures that machine-mode trap handling does not clobber floating-point
or vector state belonging to lower privilege software (e.g. supervisor mode),
providing correct isolation across trap boundaries.

The implementation leverages sbi_fp_save/restore() and sbi_vector_save/restore()
helpers and uses per-hart context pointers stored in sbi_scratch.

This follows an eager context switching model where the full FP and vector state
is preserved unconditionally on every trap, avoiding the need for lazy
enable/disable or trap-on-first-use mechanisms.

Notes:
- Assumes FP and vector units are enabled when trap handling occurs
  (mstatus.FS/VS != Off).
- Context pointers (fp_ctx, vec_ctx) must be valid when used.
- This may introduce additional trap latency due to full state save/restore.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 lib/sbi/sbi_fp.c   |  2 +-
 lib/sbi/sbi_trap.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_fp.c b/lib/sbi/sbi_fp.c
index 4d5e0f68..24d97937 100644
--- a/lib/sbi/sbi_fp.c
+++ b/lib/sbi/sbi_fp.c
@@ -72,7 +72,7 @@ void sbi_fp_save(struct sbi_fp_context *dst)
 
 void sbi_fp_restore(const struct sbi_fp_context *src)
 {
-    if (!src)
+	if (!src)
         return;
 
 	asm volatile(
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index f41db4d1..6a182216 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -24,6 +24,8 @@
 #include <sbi/sbi_sse.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_fp.h>
+#include <sbi/sbi_vector.h>
 
 static void sbi_trap_error_one(const struct sbi_trap_context *tcntx,
 			       const char *prefix, u32 hartid, u32 depth)
@@ -310,6 +312,14 @@ struct sbi_trap_context *sbi_trap_handler(struct sbi_trap_context *tcntx)
 	struct sbi_trap_regs *regs = &tcntx->regs;
 	ulong mcause = tcntx->trap.cause;
 
+	/* save floating context */
+	struct sbi_fp_context *fpctx = scratch->fp_ctx;
+	sbi_fp_save(fpctx);
+
+	/* save vector context */
+	struct sbi_vector_context *vecctx = scratch->vec_ctx;
+	sbi_vector_save(vecctx);
+
 	/* Update trap context pointer */
 	tcntx->prev_context = sbi_trap_get_context(scratch);
 	sbi_trap_set_context(scratch, tcntx);
@@ -373,5 +383,13 @@ trap_done:
 		sbi_sse_process_pending_events(regs);
 
 	sbi_trap_set_context(scratch, tcntx->prev_context);
+
+
+	/* restore floating context */
+	sbi_fp_restore(fpctx);
+
+	/* restore vector context */
+	sbi_vector_restore(vecctx);
+
 	return tcntx;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
