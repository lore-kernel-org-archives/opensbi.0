Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92E5109878A
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQgOvZxb4BessGkvAYDMKmjPU1jIIYPGN6eKTsD5JrE=; b=imjwNR/Bag5W8I
	fxnmuAkmBj9y91I7wJb/48WwS0pTCXXZAWRT++1pi5qXS12LBAN5zJNiXwSXf9mJIBuUhSeKP98B2
	SJJtFIUHtw9amMZE5yV5j8qBeTkGwjWr8YKAYj08Fe28R40TRcQ6m5LG8nu6i+n9PNwTO6sPDheF2
	fHIs8xYjSB8BAEi6HgZ/DoNACb6cD6iuAkg1DhkXW6XY1lS1uXhOd8Myj/gWz5OyDu/jBUwG756b/
	bR57mYzUNoXVOKILSvq4+Q2Bi2AUWzOlJ3Fb6cOa/f9Qz12yNbmrVAZd1FpmiH7Pnlf9NKG/6xrch
	qfj9+/gxX82pPqbkOfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alf-0000000CvrY-19cd;
	Fri, 20 Mar 2026 14:24:03 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alb-0000000Cvp1-16hu
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:24:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1318608f8f.2
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774016637; x=1774621437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmhlxrC8zXzL0syZ8DQgn8HFpppTE38pUOThscOg20c=;
        b=Eaq8FKJNlMVvmp4fbInMz0U36LLyjM5xWBbD0BkfiNXsvCQLxIqujR+zFrZBD0A/Tm
         3eQMtl9b4Ic1nwNJXIH9OvIvQ+OGcge8myVfr2j0+4U69EmuhfK9KiekzAPlFdQjfJiW
         XrxUtsdNYdWuTaudUbxU6/K4p+FS6Guv6pgNiJ5lJ8ASZLx/DVC7ZFXvRPZ6ysTZiMon
         uOBd+spChygDcJf4VmsN1kk3XHkaDf91wthrA4JLNdTTdslH+ITLVGj+06HRV8LwY1Hy
         ojLN1JW28Zd1x48s1T9WopdZVS8IBku+6TXycr7IwrN+SzQRWUzQpB02/ElMqtH7Z1F/
         de2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016637; x=1774621437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmhlxrC8zXzL0syZ8DQgn8HFpppTE38pUOThscOg20c=;
        b=Y6fOX9hngN57wq01aDtU0G9ciQOYw1GL9lX+gmTS8pw+WlwscrQ8eIIXmKiksMT0DZ
         X++bWjksev2ixPUndBfzCItmRqLCxfdwpwN5dKukXGJFqNmey/RWGBgjHLuLRjJb84+L
         II/587YpZnPsGZjV9a1nWwCzr3lrlrenILkPVAecYJt3YuOSfzr3ZMzQsaTJRdo7jws3
         nglLKZl8ON/XX4WtKv7qdlIkVJ1gf42v4e7jkqpQfJcj726laMbFCq003x2u0ZNmQcBE
         iD3xYXhKiDMvD8HwMwYBa3hD0C8VZzQiVQYI/H+Svsg3mhf61gn6zhWj36M7L3YHLmw7
         1Wmw==
X-Gm-Message-State: AOJu0YyfZRwxsC1OtyVlYhN7pOZBuazJDuq10Q6gEGyimZ4qSOiAEiym
	iBHLtCu4Ag7InN9W8WyXOuTEl05zYhQUKdIE9+M5QUV+cieLSn0GYAiKNLRxX4NPyxADFgK688N
	pa0RYUk8=
X-Gm-Gg: ATEYQzxmZMVZRF6l25ihqGFSSzPdpLhgTQTexo0lV4vXg6RwZ8uVkFxOtdtFUkrBfno
	oq4vvNgg3GtynQZVnw1NUPBVzbCWs8R6cs5QcTdoTHeg4ZOzKkebNyGKbC4FpohSIaf6gK19o7S
	1qZY6Gg3ik3BaPV4pQpFlYCMXzLRBTzwcSDpnZTXkniOjplfU3rTnnjwtTE7x0Ax/MVHhWt/onH
	1bukdE9ZfdxDJisUqTNKqm8Xeg0YPI3Mjbf9NJMrWx+oqKsEyfkYcII0PTcBxv6fa9POTIgdMSq
	2y571d/ZyODLFK8hJb2zNs0AUNikAdlYIV5QNdc2wlxWzkxjQ1gwJb4cZzOK4i+zAn7jIuigRvN
	G2ypnjMYuPro2S5erga2h47NI+gawQ8yAjHFUN8k5zsFC2rlsAu2Kj/Xeu6ot5C3+fsDFJR6CIe
	8mWbetchiOLS2uqAv72dfwS3VsCIOC/D4VEh7UgMXtDs5BZkp/dk3200AUw+Pxen8Z7Hc=
X-Received: by 2002:a05:600c:3486:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-486fee1ab98mr54965385e9.25.1774016637179;
        Fri, 20 Mar 2026 07:23:57 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm108445265e9.1.2026.03.20.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:23:56 -0700 (PDT)
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
Subject: [PATCH 4/4] include: sbi: scratch: Add per-hart FP and vector context pointers in scratch
Date: Fri, 20 Mar 2026 14:23:49 +0000
Message-ID: <20260320142349.72980-5-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320142349.72980-1-dave.patel@riscstar.com>
References: <20260320142349.72980-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_072359_343318_DA147C80 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Dave Patel <dave.patel@riscstar.com>

Extend the per-hart sbi_scratch structure to include pointers to floating-point
and vector context storage.

This enables tracking of the currently active FP and vector context on a per-hart
basis, which is required for eager context switching during trap handling.
The scratch structure serves as the central per-hart storage area, making these
pointers readily accessible in low-level trap and context switch paths.

The FP and vector context pointers are used by the corresponding save/restore
routines to preserve architectural state across traps, ensuring correct isolation
between privilege levels.

This change lays the foundation for eager FP and vector context management in OpenSBI.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 include/sbi/sbi_scratch.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 58d54628..13e4a294 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -54,6 +54,8 @@
 #ifndef __ASSEMBLER__
 
 #include <sbi/sbi_types.h>
+#include <sbi/sbi_fp.h>
+#include <sbi/sbi_vector.h>
 
 /** Representation of per-HART scratch space */
 struct sbi_scratch {
@@ -87,6 +89,9 @@ struct sbi_scratch {
 	unsigned long options;
 	/** Index of the hart */
 	unsigned long hartindex;
+    /* Current FP/Vector context owner per hart */
+    struct sbi_fp_context     *fp_ctx;
+    struct sbi_vector_context *vec_ctx;
 };
 
 /**
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
