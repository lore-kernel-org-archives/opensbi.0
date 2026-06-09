Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954C4CD8C85
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o8Z9f0Lpx8tvzez4J9MwedMBMW+a9whU31q7nIVjFM0=; b=ReqMc2ZuqiVZDu
	3XQcnsYfqPhHEPpAfkvfxeKgTJhjbCtpZXU6zJ1x8N03l7EMBnHxvddSGmoXnnhqpABC2uYFMq0q7
	KAkxXWjWufUxzs1tFk7D7SF3Ug4CbSu5sC++vYaZeR9lh/OTpdaPV8TJQoTPz+FMTQOaNTDiLYFWk
	rj8r3ePmR4O1ISa2P6BhU+l5hF4C9Z99JF7mQAkrxUhC55IL0hEu4XxycqA+F2jG1iwAjmBvYxH0T
	A8gSB+e9mTU9VEvqmv8Wt1bjFyaxDwthwaqwWaWp4/SfhdMCxdjIdVMbfe5M9yzevdPRnH3EijFtD
	4u5IZybTXkhq7hqpz8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXp-00000004nFL-0q0k;
	Tue, 09 Jun 2026 06:02:37 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXj-00000004n8q-3uLa
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 06:02:36 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2247e38eso53023545ad.3
        for <opensbi@lists.infradead.org>; Mon, 08 Jun 2026 23:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780984951; x=1781589751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dn5rrwzOeyjv+gPo6ZERYOUJAFzGigUiDzwT6jDeNJc=;
        b=VF9RRbh6yrj0xx8/gLbyUBYTTRg9wcyt84Y/aWcvhG7WYXWMKB5ZFtQnGhZw1oxpyD
         Bx1NiFgVpmfcebHCN9vpyI6BT7OGoLBIyIzHkjKJ6VNmfjB2dAgrTtgKtCenl657OsoV
         /L11Zbeo9idFKY1g7zeUJQfsQIBJuMi7hfiPqOY0/e7owGP6bom2RKdCbUA51Pz2mE/1
         oR/+hxxa2mXMKVevJLFWJQqdfdOwpTvqU5183NXhpye9/4EoCxtqVuCvvUThYBthB5Su
         0Vejsz5CHKjch7U7+N442vRmZs6PrHzVKDy6uJw5AcTC7skMGxsrkI3sFT1G5rCeHgYE
         2h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984951; x=1781589751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn5rrwzOeyjv+gPo6ZERYOUJAFzGigUiDzwT6jDeNJc=;
        b=Gk/ay56HS/t4zZAd7Ke6LcN0LBascQ1ss/6w+uGH+8LvUYK/OOt1cd2jFdG+FJ0ziI
         v+jvG7NO2miq+yrmlFUUn83yFHlPnT4cCRIT7bAiDoFQu+BT3ZqVvsqNRjMfhsWFTp3c
         T4xhUZLCCu2mQCcN02HUSs6jZPwwvQqczkRH0KwZA5oBqOFB4ztan+01vNKDI4IXnf8B
         bP5A7wOMRvzqwd9baLHYbhlR7MpvgEEyA+YEqqjt0N0gGLkkKTCGhinhkR2NxfQFSPj0
         JQBolCjwCe8n+sQY1AuaH0mX5JFDC9HnwRiki5vpoVPpNJB2bB8C3xGPfoNHyFha9rBP
         7p/g==
X-Gm-Message-State: AOJu0YyLXNUdGeLvC5mIrUlx55s2sViWIHWVKSiTjiTrJR51Gt97vEr4
	uM/XmAxzNV5BwEot2e1q2VOvvwjse8noGHaQ95qlZKY04dslDzUKbpEexOZw5A==
X-Gm-Gg: Acq92OEmMieeV44Iv8uZ5dhiteeohp3QcvDSaF4rKVz21SikygNJjcgvcvgot8LbFpi
	Ghy5UDJ5AavZ8CpnZaJr0xFc+iROQBGFG9s79nkkY9KnuFXsMsrUZvg7Inuv95Vn0ph8ugpRmpV
	zvAbWX2yyuVWv+2/0odlUxB7i4s7BjqD5cchtmqCc9DGZF8zvZniLIEN+A8u07O8Fe5XDL+Qzi/
	O5smpB1twcPD+/eKK5yUougDOtPV04SnlVKy3sIqTbjM5byuM4nbMPPxW3zRH1ej5OgpM1y2ssE
	UMRWSXocAJlhlnekTqTz7JkqKvs1cPk3JRZJRYdYWBd8CS7iDoOPW8lmSg6vcpyxNMb9sE/2JcE
	tMpZ0JEWLSfe8lODSpkeEb4SW3W6sHmd172K2S8LNDidxjYxdoHvhKiUAGIhh+ju41VhK9aYSjM
	P2k/rE2Kc9aLWeNlC9F3irxgO3TJAE04nW8bA=
X-Received: by 2002:a17:903:15c7:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2c1e78acf24mr216388275ad.0.1780984950859;
        Mon, 08 Jun 2026 23:02:30 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f9ed6csm202721105ad.31.2026.06.08.23.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:02:29 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 0/4] Fixes for vector misaligned load/store handlers
Date: Mon,  8 Jun 2026 23:00:20 -0700
Message-Id: <20260609060024.706-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_230233_095154_454F70E0 
X-CRM114-Status: UNSURE (   7.84  )
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

Re-visit the vector misaligned load/store handlers and fix:

a. Avoid stack overflow by using a small sliding mask[] buffer,
   thus optimizes stack usage *IMPORTANT* (correctness). There's no-
   longer a need to have a pre-defined vlen maximum, and worry about
   whether the stack can hold the mask[] variable.

b. Maintain the value of vstart when redirecting uptrap. (optmization)
   Avoids doing duplicate work when the instruction gets restarted.

c. Explicitly set VS dirty in (V)SSTATUS. (correctness), VS in
   VSSTATUS must be set dirty if coming from V=1.

d. Zero out tinst in uptrap if not guest-page fault (correctness).

This is a follow up patch to [1] and should be applied on top.
[1] https://lore.kernel.org/opensbi/CAEev2e_Vg1mMP4mOKanFX_EGeUzpczRcWW++vBBuN1CfyM0BJw@mail.gmail.com/T/#t
---
v2: Fix the wrong PATCH 4/4 generated in v1.

---
Bo Gan (4):
  lib: sbi: cosmetic changes to reduce indentation
  lib: sbi: Rework and split sbi_misaligned(_v)_tinst_fixup
  lib: sbi: Add variable-length unprivilege access functions
  lib: sbi: Rework misaligned vector load/store

 include/sbi/sbi_trap_ldst.h |   3 -
 include/sbi/sbi_unpriv.h    |  16 +++
 include/sbi/sbi_vector.h    |   6 ++
 lib/sbi/sbi_trap_ldst.c     |  66 +++++++-----
 lib/sbi/sbi_trap_v_ldst.c   | 201 ++++++++++++++++++++++--------------
 lib/sbi/sbi_unpriv.c        |  88 ++++++++++++++--
 6 files changed, 270 insertions(+), 110 deletions(-)

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
