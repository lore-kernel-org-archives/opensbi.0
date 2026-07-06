Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCE4C43458
	for <opensbi@archiver.kernel.org>; Mon,  6 Jul 2026 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g3bWfw28aK3yiMUBxizG9m0zlowBr+qgk6L3timVi30=; b=nTUQNoABjM0cMY
	4lafn4BrhN9p4OQ74Hktwcfj5NDw6kEtnZeigSVAvzrhvGnKv1a2kxTQ6HbcocZdMmQfaKz7bWKu0
	9aKQ+c97Bmv/QEWBPUQgWjKqhfXPhcdtYc2bQxLr3Bmzxy1pyGlnVhWgwNqOw9YwO9NsG/yffVBNc
	ltTeYiWAEhOVkqep1JVXC2dNvdgEeCbPRekTYThd+2Ld1JEslCon3R0ADATHpASZdBbR5O4y9Xbke
	SoYDx2IWU1E5dbuXmTUOFEOSgphtdPiLy1JjyDKHbTVinjg8cSZ6SBOKeMkZxtn7u06yYGY8D82lL
	umEKFmqbo0+AiZ7td3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglpS-0000000CzKt-0bRe;
	Mon, 06 Jul 2026 16:05:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglpP-0000000CzKL-0YFf
	for opensbi@lists.infradead.org;
	Mon, 06 Jul 2026 16:05:52 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E5633F290
	for <opensbi@lists.infradead.org>; Mon,  6 Jul 2026 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783353948;
	bh=9xDWb22CPrjpnmuQy53GrtYFsZv9W01Yp+yeycksCno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=WsSJExcNrZ9M2x1keFT8xhDJu/Ma+8+r2Dy57tCLkW/BRs7FaNDyBuwa3vwNR9n9W
	 OKOO7dcHMHfR2f7j1jYHmxWCxCH5+KoWwNtfcEeYbeuQfCZbNAWY9jzBRHDtvsex7b
	 wOKarOVgbCrWRrbqqWrkibfOW/TWiKMMWHScLv0aRQ739prU5TIYKsW1xsyPE+HhkR
	 VnmLA69CYDaGrA/jQKHlZcqrCvsHfw7UIFTCvUI1hZlTCzrQVWyTfsfPJ7VSf35Q/m
	 l5fv7NYU5gMq+KfPcsFBc1ANsqi+76cm5wTS/2zMpz+tzzZCJ6nqn/uCrR8xFmJx3H
	 AneTuWpHmW7wcHX8qCmxNi9A9clktDEczgZlWrnQMJnlqkXH+vWl/egO16VFPbNrav
	 NRe4Z1WPckmoPjrJIHzuLjHM72dhtO1kRin1Qye6cfxffUWvjuMXgNHUmgDl+GaN1X
	 NcUD9PSlOEFjUoQL7sVucKTp0ix6nvwib8am9XGxN9pE0W5B3+5TcyxIjPNRaoi2XY
	 ba/jZv3LGEnCerywkdawtQPEmchU/f/X1MVSMCSugflXhXnijy9AHj+YzZVyx2B/Oc
	 2DQkI3NF8trzjJ0YsbkCZ1vIFCwykgHfI4yED5zLiWIvhR8d7WhV/T6UJcnwDTF8V7
	 Y1XOIORF0lyfdyEmut/GOkd8=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493bd52dae6so20832945e9.0
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 09:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353948; x=1783958748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xDWb22CPrjpnmuQy53GrtYFsZv9W01Yp+yeycksCno=;
        b=naCmnwK7lHwW4jMmh9Wwbh96Wdqs8BenXV6XA5VnJ8gMdiFEHqLpVo6ebuRsquOUGb
         20iOlfnQY7ROYmHun2JcPeG1Lk/5xfgoDuiUCXpL51OaH3xrvx4BqR8/X9MT0Egoxcp0
         tXdLmP+B6stpgrYxSbqIdSHdvycE4LHi40yc4u0xdHOq+zP/8Tqitickin0wbZKGovgl
         DVNj26UUUPtqZf+AHZCxi/Yz1vyoERleFRU7YpQm12IqzvLkr5fOHPS5mDsJ753rHnsj
         LezqU/tE6uYIPtaBhyHK3KD5Crsy6RYj0skV69B5x7qysukLY+jAHQIV+ZqFq9mPeoBZ
         SQ7A==
X-Gm-Message-State: AOJu0YytHLL/aAKna//X05JolHl8WcKoVLIhYuL8zp6srnljzSEEikcV
	6He+0Pw4ydPWeZhal0gzFwUbTS+qap8WD55LGJnqfqQO8OG792soJlXdThO4NT2wnEaMsmgL2Tb
	r9Yt7uVXbVYqEZxN6ueP11PLiadQqupYl+CPJwTJ6ktjruPJqlZF+2FwvMbOTfgp8yBVHISDxzK
	2sK0cV
X-Gm-Gg: AfdE7ckurl3/oURVpUA9c5bmSPQOhUailkRH5L7DRa1YiNVPTWFnqwDEUw+AJKxcnEI
	yhasIvlxPSQ+vOycOuq7mQqzR/F7dL9vjHT3BMON6J6pjd9Pg3+T8tYwqLU6BjK4wJrGIU99see
	SxdDeWTph7OeHpsPa7DdngB1VKiDr7yfW4hfHCycB9nd99xLaURM7XRSaGudwwUwhKmoyh8XeH/
	TWQWgOj1C2hwyNqxehfSbQDCFmVsO0IMLWz/1VZ7VS+twW1ZqwBuXjkTzXKFvvCSgpct2jW/OVS
	biCV4V2SoNMSsbV1AGcjQRKeIoi5aqOP+V2cjU3NxzlW0zVyCmn3/UaS/fCHwG0L1yTFl7GOX7A
	0/MMIXdQfZEIjKcr1/OqgO19uDj2GwPozeShoGssSMn5IeLRMMI276nNx1TcN/Bqx
X-Received: by 2002:a05:600c:4e8e:b0:493:c83b:50d7 with SMTP id 5b1f17b1804b1-493df041398mr13811565e9.6.1783353948107;
        Mon, 06 Jul 2026 09:05:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8e:b0:493:c83b:50d7 with SMTP id 5b1f17b1804b1-493df041398mr13811105e9.6.1783353947730;
        Mon, 06 Jul 2026 09:05:47 -0700 (PDT)
Received: from workstation5 ([2a02:3035:688:b8f3:156:1c3f:21cc:5386])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm369555645e9.12.2026.07.06.09.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:05:47 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] sbi: make SBI_HARTMASK_MAX_BITS customizable, default 256
Date: Mon,  6 Jul 2026 18:05:44 +0200
Message-ID: <20260706160544.697409-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_090551_581539_9604BA10 
X-CRM114-Status: GOOD (  10.80  )
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

Linux has raised the default number of 64bit CPUs to 256 in commit
0fa749771993 ("riscv: Raise default NR_CPUS for 64BIT to 256").
OpenSBI should use a matching value for SBI_HARTMASK_MAX_BITS.

Introduce configuration variable CONFIG_HARTMASK_MAX_BITS with
range 32-512 and default 256.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 include/sbi/sbi_hartmask.h | 2 +-
 lib/sbi/Kconfig            | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index 200ab6e5..339cd40f 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -20,7 +20,7 @@
  * also represents the maximum number of HART ids generic OpenSBI
  * can handle.
  */
-#define SBI_HARTMASK_MAX_BITS		128
+#define SBI_HARTMASK_MAX_BITS		CONFIG_HARTMASK_MAX_BITS
 
 /** Representation of hartmask */
 struct sbi_hartmask {
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index e76aecca..24132eaa 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -2,6 +2,15 @@
 
 menu "Generic SBI Support"
 
+config HARTMASK_MAX_BITS
+	int "Maximum number of hart mask bits (32-512)"
+	range 32 512
+	default 256
+	help
+	  The hartmask is indexed using physical hart IDs so this setting
+	  also represents the maximum number of hart IDs generic OpenSBI
+	  can handle.
+
 config DEFAULT_HART_STACK_SIZE
 	int "Default per-HART stack size (bytes)"
 	range 8192 1048576
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
