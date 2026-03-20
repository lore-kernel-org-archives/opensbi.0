Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264731098786
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQgOvZxb4BessGkvAYDMKmjPU1jIIYPGN6eKTsD5JrE=; b=GLFCNie0CeAO1y
	rTVPIRPnt6VZoxnEwNWINBE9dh7fdO9JK+w+GyANkuLBqj5rQ1nvfb13+NoP1R6mMHVLVP5wAQuqr
	ZWRlCG/5t1eQGHgkMtD27mzyfstaJAxJILTQLpem+qQsLUJ9ssukB5sa6UGAuv860eashkYMU4uBK
	jCHV8IVLwq1kpp4GdyiPZDNmgOrZ2ZqKEVq9AA5l2glSkTTdNq//r0f98vWzDSwnwRDak37Ob9zsp
	Hkx9XNyfJrjKdtWSrw3BukVfBcsrb4Xktxq+JiGZ+v9s+jKD7BpRFC8zOXjlz6Vaisggr8fkGLjQa
	HRrRxwo9+MJdIjrNfwMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3art-0000000CwYm-0OMN;
	Fri, 20 Mar 2026 14:30:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3arq-0000000CwWM-2m9l
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:30:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-486b9675d36so15415415e9.0
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774017025; x=1774621825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmhlxrC8zXzL0syZ8DQgn8HFpppTE38pUOThscOg20c=;
        b=d+LRtKb/kKw7MwhM0EjnVbOZDeA+okcxhySukFONobR7F6zZ6CUjbKXk+KxgKmaDfw
         SveG05ITTvSOYBbUT05uncj0nHSY/Q8lI2igwQw0NjMbDyxhdoo9ETBRegfzRyYvsZVa
         uJEVfmL85u6UhcKln0Kr8wX8JUD3kQCdJOZmgOs3YXWWH5c4gao+SF7oFYBAZ554pWxl
         SARaOhIw/Le0vd7jv52LC90qIQCbhBThtajGaV7oVQhK+vvqCgqqso/mq0Zh7eABkmvR
         ly0wuWNzWy7W33QUHSF/GmRSd/aoBCJmrVLgOhK+XCBB4Y/O2ImD/oGfrtiREfcopJ1+
         WgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017025; x=1774621825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmhlxrC8zXzL0syZ8DQgn8HFpppTE38pUOThscOg20c=;
        b=UItmlKShZJTqEE0hvynF+D1wjKLLH0AvYAnxoP9awbTH11DK6Xvg88niDLyvfrqvrZ
         Uo0JhHEIN9QgGn/pTTiUD23iPOdm8c8IfZPsKmRxknbYYgyK6OzvnNQBlNgDkXL9gcw8
         I1lEmI/fUnBq37dJleHchhSTsUMFO+yc8qcLRGD54/sNxRUQ3a+WavpsKUiOg5k8q+l9
         1dgDEjoy/IJ1n0RGNJqNqu7qP14uUrG9eHhFnAmTYU24DxsVejxqLRwjmystB1hLkX6N
         eB1DHQ7/VHm1niCzh4fU6UWe3lfsPXiQUyc5UiK4z7a9AHJDuCq3lgeEBdOXxNu2v72y
         nPFg==
X-Gm-Message-State: AOJu0Yzq2dGbY4wPNCSxykKet7o9Ls4tRlVK8s4iA9Vpjxfhrts5a278
	bQiG/gDWZr5oCYjWgSmGoV2WF4A5UYip3WylPPda1SDnsowcp838TcpEWDdMYY0TSabike2VA6l
	Mg48ASc8=
X-Gm-Gg: ATEYQzwx0HebHp60eEtcjaqu2xBA7IZvtEOnjUCyQAtL8mqRavKFAMUh5YPJD8y7mj6
	zrtrn2Ul9LtE+oF7UAA6awytLBI4tqsdxNJgzBcbJomwD+APUdFP4yFlXBLuqbD378ajpEbPi/e
	oqBL7Y5UgUCIDkQQuzsYiayLriYzEYhHN6sXRtxVc9jfmEYHxbCTOZF2KnzuZ/n7x+Gh2FaCeqn
	NMKD3R4Z7a0xG1J58ZN7iag+auei0z3G0XVF/7B1w2dL8E7snWns79NfK3LRcRScagH6GeDrwZm
	shpXJW/ng5CPrJLx8kGqok/sB34e7bHUpvMbqe3KXEzhHJ2Y3MmSVQNrIaPAEcPO/4Z1ThG27qN
	x4Z8UZzb9HBNPEt/wQCaZN4k880jOImxawBnVxGYPl72TlXyi5b/Aqby0MNNx11eV6cGH86rVdl
	WiTWqeu2vQ9jnd6Y1t+PFwZnfQqJtkgURmEyJOeFxHfhMPvYIlJW5wkAT7Kda3Br+4/EU=
X-Received: by 2002:a05:600c:3d97:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-486febb5989mr50217255e9.4.1774017024604;
        Fri, 20 Mar 2026 07:30:24 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1aeafdsm16608435e9.21.2026.03.20.07.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:30:24 -0700 (PDT)
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
Subject: [PATCH 3/4] include: sbi: scratch: Add per-hart FP and vector context pointers in scratch
Date: Fri, 20 Mar 2026 14:30:17 +0000
Message-ID: <20260320143018.74191-4-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320143018.74191-1-dave.patel@riscstar.com>
References: <20260320143018.74191-1-dave.patel@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_073026_713911_BCF49755 
X-CRM114-Status: UNSURE (   9.19  )
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
