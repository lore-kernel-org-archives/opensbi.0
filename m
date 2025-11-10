Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207D1CCF9E3
	for <opensbi@archiver.kernel.org>; Mon, 10 Nov 2025 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BD0bOlbWiPV3v+MR+s7RiTwEvCW0ACFi6SZ1R13nZk=; b=2ElgqBk8dnoxae
	n8HGN7onEAoGw6xk8RsGED6AfictWTPaP60DxBl1wJenO6MhWW6QwjVz5fKIDDdcPEcqfGwVbCiB0
	CmFH50h2NsVvT67bNlQLi/U2LmMz9SnaBKBCLxUfJMznGMFB3/qvPWF2N3ig0vKwNAHTrjDMjmw0r
	pZNOiia83Q6dZvUoYYuLS4cOypKuyvE6RfakE88oE0JYTId4NXExfMeVwBS3OnQnenPmXuAVeXnpi
	I9X4KAuUWnoAwrPvYKPteyqDO36Vslunxr2empBYbf4tMdGjhrcx3CP3LFodIGnHdOAoW3dDUEmky
	cqsot96eyhUi5FINDXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIV00-00000005qiE-211q;
	Mon, 10 Nov 2025 16:44:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUzw-00000005qhR-34Dk
	for opensbi@lists.infradead.org;
	Mon, 10 Nov 2025 16:44:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-297f8c26dc7so15335905ad.2
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762793047; x=1763397847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GSnVz4tmvsbcin9HusWHCciOA4ubFtl+zArMc2HjW88=;
        b=M4ayCE9rQJEyTDZsR6CQBLEVVjR4PQzcd4KnTeautxa3GrkP2iw4rrAD76t5B48im3
         FnZYRFie8wUffVfN8PjukdKKdCuCevZCf2ZtNBm6XalYBuNmbQnTh6VxuV4puR2xEvDd
         bh1lJMg47Dwr3I0iuETWhhJwZpHyOyXyfJcyZe1B2AJ8sgmEwcMXA2jRV1TjKjg+/fAE
         NfLzmHh61YKOuEfsVPVjoUrT1oOzHpXwTcV3DBgTlrXtmaefvrLb274WTqYLKakGJAXC
         LVuTzHyopQnr9xfnQSbo1/j4Ms1jIDxR5oJ11nNPyhi8VzaerW9LuSEqrigW+eXbgrKs
         Zg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793047; x=1763397847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSnVz4tmvsbcin9HusWHCciOA4ubFtl+zArMc2HjW88=;
        b=u8AHBeddpttJIOAp5jkXN2g970k1x9GHBsYH0Dhv0kLzZfpHC7qvVs75NQlhfWvmn2
         zQCM31gddLzlWwqnqlbK0je9GBE8rDXt+a7RXETcqNyR9EocmAUPjqSaheVGx+02c6aa
         coBhcy1P8z7hjQwL1uDPsMvLrCuTzKsUtRq4pS1/aXo2isCMyF7B6Hdk8MxujbehLmGc
         M0vKkLtcITaLCNHe3NH9vgIRR8ludJpHExB5m4s2yQkm0UB/XRQ2ddmGRt9WPQxcvO/s
         FrGGDm81KfpvkAQ6Y2CvD4Qj6S+px9Ds2qSSygE5VcoklCRMSujHvq14rXPJXZWife30
         PGoQ==
X-Gm-Message-State: AOJu0YwS1Ppt4cR2cD1I+abMO4BnnGoKKf2fLGzSzImlFD8vQFvDFxIr
	0SKwE7RvgOGmFGi+54qe1N4oKmqlUIRGAk9YbdbaHKR7TcwbCBrobsfKPhKW1dMw9Gt/cwkJtQ+
	0Zrg7y/c=
X-Gm-Gg: ASbGncv5rGzHxLbi8OoUy0VLelR/oFXB5NOr/mfIe4mu3Ij+DCL9jDMq0BwpIV9K3p2
	KdtSV9SYf3MaKp7aNJoqh021RCTgWVen5XM5cV++8s9y2aSDikrRHfgPgl06ippLfvccTyfjKIj
	npZS6io9FAPgJOkFxgoF3rY1SJ4OJdeAY3nV2IGPz3qplKhuFBWFby7R6vf8pN0dDgNRy9Ud76O
	OitawSE4u89INFKXw47FMAiQFoJmz+c405RufFCLwdlJAh66phNROK/DZ0PqU4dCQBZLBXdsjyS
	rutyjokYuVDzNEEnBJVwD4dAct59wLbbfkkIdcxhRi8Ry/nfduhivJooRmFFpML7HJiOEnQpStu
	xDsfrSRwT3kJas2oD9fUjzHt4uw8N6cfnKFec2GPEaCPkKEdTg3tkBglRbw5BklZzdYL3pBq4Ek
	ihV8ywWcfb9ayhqL0df/DsWpNzcOjG0TMS8WFlVfQXbkgN2bHvXay2qbSnSghyPfQgBNaZFVSW0
	myBk0c/pAtRhFsZzAUG83/U3eLdr2H3omp+uCJj6Ac8EjxCUr+XUIm8
X-Google-Smtp-Source: AGHT+IEq0SYIJCeJj+NOWA9zTHBdCWO75Yv7W7pOjVwh5XI/ZIBa7DPATVx8o4K+YDk9uP6husv2SA==
X-Received: by 2002:a17:903:17c5:b0:295:4d97:84dd with SMTP id d9443c01a7336-297e56f9d37mr108250395ad.51.1762793047391;
        Mon, 10 Nov 2025 08:44:07 -0800 (PST)
Received: from rpathak-ThinkPad-T490.. ([2402:e280:3e81:5eb:fcf7:9bbd:3c34:48ea])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29650c5c72esm150502155ad.33.2025.11.10.08.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:44:07 -0800 (PST)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: rpathak@ventanamicro.com,
	rahul@summations.net
Subject: [PATCH] Makefile: Only enable --print-gc-section for verbose(V=1) build
Date: Mon, 10 Nov 2025 22:13:52 +0530
Message-ID: <20251110164352.163801-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_084408_772795_58AAE632 
X-CRM114-Status: UNSURE (   9.28  )
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

Earlier this option was enabled during
debug build which only prints the linker logs
of removing the unused sections. Instead
enable this for V=1 and keep the debug build
clean.

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 398eabe8c964..da7976d5efbb 100644
--- a/Makefile
+++ b/Makefile
@@ -444,11 +444,14 @@ DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assemble
 
 ifneq ($(DEBUG),)
 CFLAGS		+=	-O0
-ELFFLAGS	+=	-Wl,--print-gc-sections
 else
 CFLAGS		+=	-O2
 endif
 
+ifeq ($(V), 1)
+ELFFLAGS	+=	-Wl,--print-gc-sections
+endif
+
 # Setup functions for compilation
 define dynamic_flags
 -I$(shell dirname $(2)) -D__OBJNAME__=$(subst -,_,$(shell basename $(1) .o))
-- 
2.48.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
