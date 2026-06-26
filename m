Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674B9CD4F26
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8JWXxBCbVLoz+Ed6GfTjbr02fHjVAhFWvjCpX6wQkY=; b=3eTjaY1CM5Pc6l
	gygB4h7hBDEl/HCeVq0nmmD6h9fje0FZ1LyaqorQD2MTp3AA9AmymgKFZq/k2pNn8qxb5GqAKAeQm
	OZCVBHZ3WVHD7bOPisnyiALpr+IAS7NCPm1yHmrXobHDJgKsL6+z5q/6cfzRFER8W51u+PuH8SvKx
	jebO+EWfIc5gh81w+XD8XTzSSN6G7tTQhjOTeJ2CVuCqMAQnKFO0gF5/q6Tajx/v7eSFaiomvuoO4
	uQPhTxHCfmhmKtSzzMs343iNLfyhjpDqRZIB0J375JEyqo0uYCjCVE3pub8tSJNS3LMawPcLPELQD
	HxP4fbGwLCnxSMuM3GRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cc-0000000B4pd-2ygR;
	Fri, 26 Jun 2026 10:17:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cW-0000000B4iN-3zpf
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:17:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84540eb70b2so395980b3a.2
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469032; x=1783073832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obhctmPPYiLSNZXi1nCalzmlEG/UenqFInAxk2wx/mw=;
        b=LSeXmrz48WNtlUnB3mxFMXFiuQ0T5nU82wKAC6PhB5yRenrTJyWmdCQdcFVXEZU3Pd
         H4EbZUMfiAPqD55ejw0sPfqqqySvna/63j9zXPtpYzcYuqWUfvcWeFuG1kYFbPxean66
         Ugb+jl79CjFu9V75TMVR4T9Ep+Y1kw7YAJtCPTlAAuSvKqy8z/H+6nGlCdagEcfcCmA2
         fecJLwmtftKAfCwZXLk0GaUkGP/fUpcykZYULNDbLbdC2v7DRoz0dBZjTP6FiH2ZSOIe
         B34fS7hVhJU0793IoDaQA4tWBFWa5uWHs7L0+A7n8NCnDCdzeTBBUnL7Fe38LlldhVZV
         p8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469032; x=1783073832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=obhctmPPYiLSNZXi1nCalzmlEG/UenqFInAxk2wx/mw=;
        b=OwJbvy7y+f9w1Lzo3jQArQ9E9pf4xRHT2TCtXKDGqfJPVaUZDmLkEpBphmnMb13ZbN
         K53WrH31ttujnIDiSTr0pUk+5QeqopsuR7neTKyEk0RFlfD5U0D59AVirwVhiP05VehJ
         NijTfK8gMFWYZVwhVdDRQjkF1KkhXoDGTPzUwJwH5l57zxiKZnqVELzn7qaA77dYdA+m
         RuonULQS/4nb2g5FXOueqE0s9DpsauDbuEPLKVFLwWVVs3qYhVNWIzfPgUw+KMS/KCtj
         /9djpRYcoP45dZ36OLcagBlEBDvi2vahRZEdZucFfLA3U02hCygcx3VQPlLecyjrN0SI
         +zeQ==
X-Gm-Message-State: AOJu0YxsUdmnydlgOgiR8FiWniQ8c5WDHdYHZ1bumZMUmP4jysA67mvJ
	gy51wJycnyV+oh0Zn9dsEvenGdC5emQtAbzSvnAAkXqoQAA9TRmie6XHYKLQ18n5jc6I4jBtWtA
	dK8THF6puf4qI4Y6zfQvUPiUNVSq4KHZmJxa3EqaMY/hWWM595OUtnf3NLHdAT2o4fdDcA7Tiq3
	6ZXtNhoUS4H+CbCcCreEGxH6a71JWQTdv+bXwsFaDbTcVmgMUhDvI=
X-Gm-Gg: AfdE7clI+XSOUHQIUa0FhCjZu5HWdjeREpm8kyUr6V1wl5LeRqpwvuC8/niIwQ28Sqz
	kxvL5MkSlNMqWwg+sBF8MRDhj8spGHCElWqIUmfMGdz3WjZNTUPFl3SydiguAhbAadJDckSgFb0
	HDgz6Go/TCNNOvoqlIuchFmLMDP+sdQmBAHT4vS7Law+NE9JeaX2u0Cw47WUho6TByWP7S/kQaq
	wcu+TaqNT6o9IrMsCoCuuuyq2B5PMCOGDaaGT5Q1rB913qtwZi6KwP2JFRIwMIsN2Ql/nyCnlHy
	ibCIYbnMRmvQ9Yj5YsL8acZy1/fkpWHjf2pIBgn67Ls/v1odAZ36x8vT9J14WjgxstdMXf5K/2C
	z5ehy0+EZSH4YHWhNulXuyNo54U4Iix6uqOCgjpwXmhoAknGJMXfoMC9Vp0FoPlay7k4Z477Mn1
	77n85wo+qBdPFq+DgN1PCR5C1GAEPeMut9oHdveQWHfIBsHxw=
X-Received: by 2002:a05:6a00:2301:b0:842:6004:3fd4 with SMTP id d2e1a72fcca58-845b3aaf053mr7435735b3a.24.1782469032181;
        Fri, 26 Jun 2026 03:17:12 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:17:11 -0700 (PDT)
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
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 12/12] docs: add RISC-V Worlds next-wid/next-widlist DT properties
Date: Fri, 26 Jun 2026 18:14:33 +0800
Message-ID: <20260626101433.3133466-13-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031713_022181_B7F735E5 
X-CRM114-Status: GOOD (  13.70  )
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

Add device tree bindings for RISC-V Worlds support in OpenSBI
domains. These properties enable per-domain world isolation.

Per-domain properties:
  * next-wid - Sets mlwid CSR (requires Smlwid extension)
  * next-widlist - Sets mwiddeleg CSR (requires Smwiddeleg extension)

ROOT domain properties (in /chosen/opensbi-config):
  * root-domain-next-wid - mlwid for ROOT domain
  * root-domain-next-widlist - mwiddeleg for ROOT domain

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 docs/domain_support.md | 13 +++++++++++++
 docs/opensbi_config.md | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index e267a9f7..164d87e6 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -91,6 +91,8 @@ following manner:
   is the next arg1 for the ROOT domain
 * **next_mode** - Next booting stage mode in coldboot HART scratch space
   is the next mode for the ROOT domain
+* **next_wid** - Next booting stage World ID
+* **next_widlist** - Next booting stage World ID delegation bitmask
 * **system_reset_allowed** - The ROOT domain is allowed to reset the system
 * **system_suspend_allowed** - The ROOT domain is allowed to suspend the system
 
@@ -200,6 +202,17 @@ The DT properties of a domain instance DT node are as follows:
   is used as default value. If this DT property is not available and
   coldboot HART is assigned to the domain instance then **next booting
   stage mode of coldboot HART** is used as default value.
+* **next-wid** (Optional) - The 32 bit World ID for lower-privilege modes
+  (S/U-mode) for the domain instance. If present, OpenSBI writes this value
+  to **mlwid** on context switch into this domain (requires Smlwid extension).
+  If absent, OpenSBI uses the platform M-mode WID from the **riscv,pmwid** DT
+  property as fallback, in which case the value must be identical across all
+  HARTs assigned to the domain. In either case, the value written to **mlwid**
+  must be permitted by **pmlwidlist** on every HART assigned to the domain.
+* **next-widlist** (Optional) - The 64 bit World ID delegation bitmask for
+  the domain instance. If present, OpenSBI writes this value to **mwiddeleg**
+  on context switch into this domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
 * **system-reset-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
diff --git a/docs/opensbi_config.md b/docs/opensbi_config.md
index 104d82c9..b7210dfc 100644
--- a/docs/opensbi_config.md
+++ b/docs/opensbi_config.md
@@ -29,6 +29,19 @@ The DT properties of a domain configuration DT node are as follows:
 * **system-suspend-test** (Optional) - When present, enable a system
   suspend test implementation which simply waits five seconds and issues a WFI.
 
+* **root-domain-next-wid** (Optional) - The 32 bit World ID for lower-privilege
+  modes (S/U-mode) for the ROOT domain. If present, OpenSBI writes this value
+  to **mlwid** when entering the ROOT domain (requires Smlwid extension). If not
+  set, OpenSBI uses the platform M-mode WID from the **riscv,pmwid** DT property
+  as fallback, in which case the value must be identical across all HARTs assigned
+  to the ROOT domain. In either case, the value written to **mlwid** must be
+  permitted by **pmlwidlist** on every HART assigned to the ROOT domain.
+
+* **root-domain-next-widlist** (Optional) - The 64 bit World ID delegation bitmask
+  for the ROOT domain. If present, OpenSBI writes this value to **mwiddeleg** when
+  entering the ROOT domain (requires Smwiddeleg extension). If not set, clears
+  **mwiddeleg** to disable S-mode WID delegation.
+
 The OpenSBI Configuration Node will be deleted at the end of cold boot
 (replace the node (subtree) with nop tags).
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
