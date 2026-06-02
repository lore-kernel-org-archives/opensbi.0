Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEABACD6E57
	for <opensbi@archiver.kernel.org>; Tue,  2 Jun 2026 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kxyEZo9yP6PRs4pv8s5Fc9LCQT3l9DdTyuw9bGQK3f8=; b=3f7bG8PHiDFoH5
	DYZHwHDsNFwEAgAztA/bts7AZmF50mSpKEwEEyHQUse5cu7GCTJNcndKC43NeLh93ZliW8WiPVNeJ
	LulCirnp6fDXEDqmXPePhoQ96hQjPpY+7lZUUS2xbdG4pIiTzIyHMYn2YtHtIJXc2fMBUEBfhk6kU
	ccIp1Omf5eGNQWmGf4OqHIKHrXcCEj0XoiCMC9wcyCjdsNJRRk6FYO9CrVxiU4qrHMFX499yIYC2k
	M/8DT+Ae/YPxruHiOTVOzMiiMRKJge/DVuOClvIUI6sfAKDLAqaEERj2ohSIH7avzT/CtI3yfFO1z
	69+iZYi2lINXb+A0gYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNEk-0000000CrwG-3gY4;
	Tue, 02 Jun 2026 11:24:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNEj-0000000Crw7-11ex
	for opensbi@lists.infradead.org;
	Tue, 02 Jun 2026 11:24:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C06660126
	for <opensbi@lists.infradead.org>; Tue,  2 Jun 2026 11:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF611F00893;
	Tue,  2 Jun 2026 11:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780399484;
	bh=zModBmCiLqIrJPTaqDby/7AHdmsTNqqyCz6Ldlu2PsY=;
	h=From:Date:Subject:To:Cc;
	b=R1O5EREfXrFNaR+wJFIJpLLVRYLlRU4oGVme1TGrKxvex83jgUS/7nPGY+ue8Q384
	 gdbJfx+x+IgCqL4/yshQPZaoSu48EGaD1M5pBQULqQRQMX0ux1SWJVN3rxIl2rLd5Y
	 D0bXUlr/rHDdXE+A+CsGIuEp6O90A50L8awKitn+yna/OB+ua1yb/pWSxpF7MTGRFA
	 ZZ3wpDcDRf7c+uCbME6hLPlQzcrh9qrpt5h7MouYcYHA3I2Cb8+p59ZPnFPTYcr+/m
	 d0mFyyd9Xzp1TrqUnWshLBTCPSiQIUXyUzV8lg1LHuZVFuaZNllLU8x54l8Euw+Qad
	 NaSxIdnJRWRBg==
From: Michael Ellerman <mpe@kernel.org>
Date: Tue, 02 Jun 2026 21:24:37 +1000
Subject: [PATCH] gitignore: Ignore python cache directories
MIME-Version: 1.0
Message-Id: <20260602-fix-gitignore-v1-1-4299e2e40ee4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHS9HmoC/x2MQQqAIBAAvyJ7bkFFhPpKdDDdbC8aGhGIf086D
 sxMg0qFqcIiGhR6uHJOA9QkwJ8uRUIOg0FLbaWVGg9+MfLNMeVCSMY74+adgpIwmqvQEP7fuvX
 +AVe2I7JfAAAA
To: opensbi@lists.infradead.org
Cc: Michael Ellerman <mpe@kernel.org>
X-Mailer: b4 0.13.0
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

Running ./scripts/Kconfiglib/setconfig.py leaves the tree with untracked
files:

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
            scripts/Kconfiglib/__pycache__/

Add __pycache__ to .gitignore to fix it.

Signed-off-by: Michael Ellerman <mpe@kernel.org>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index 94caeb90..fc27e747 100644
--- a/.gitignore
+++ b/.gitignore
@@ -16,6 +16,9 @@
 build/
 install/
 
+# Python bytecode (e.g. from scripts/Kconfiglib)
+__pycache__
+
 # Development friendly files
 tags
 cscope*

---
base-commit: 547a5bbda7c3ec0096a6c87809851f8c2df047d1
change-id: 20260602-fix-gitignore-e4ca4a9bed10


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
