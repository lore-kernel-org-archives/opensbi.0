Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C600ACC6B1D
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=io1RE/rVOFuzJ8gmUJGsQLsiYsrU1WfqpOfzGnYBGtg=; b=usKnE0G0W/hBhg
	5q3ZFPgaYhgFmCk3MIv7M+GNptOG5g3ABhQJl7gNXSbsASVEvuLxtceP7RMtwRTFOKLyqugOMbGZm
	j99eHxfT5HHYYDsQ2WrumIjSIwf+N3Bhi3vLUiLMik/YDdW/wSRVNv516uVK+TpDpU9AdzMLBuIJV
	qxj7Q1FslzroAes0XCVcGLNW+5TVoQeEndNMA6mz3BcgtMtkclVD9nO1JdtDzyKct7u3/KHjQEvoC
	xxiBHHtOAc3iMUcEDiriHjEW9oJUflHQngTirk8zUT9dHSIeAakWHHKYyNUypsWcp3v/ir/WxhTnW
	Y8O6SGy5+KHcvN3EsYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxJt-0000000FMei-1NIW;
	Wed, 14 Oct 2026 11:38:53 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxJr-0000000FMeK-0OQi
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:38:52 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3535a54bed9so1234537eec.1
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977930; x=1792582730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjTa+gHdDJ3Ki9dwK1WqBmJ7GtS6ByQ75b1yiNcqErk=;
        b=Afx1atv91u7KnuB7kDQ8udDnZXkjhlPNird4bkay+PSsP/CIBZ6+TkvFVI4PC7WAoF
         HBSI4UA84i5FJbJMw5xQOXuhFcNKr3AxJipYrXJsgmWL6kZQQ6mJilFD7VvEqW1zIOr4
         /VDUciOuCd4GVVugW+LxbOSFalBaqeheqoRKTaz5mKpOtL/9bJAjdBs3C9jnloB+Ql7P
         UuKybEKw9jeBv+WoOu7gE+7mbMBK09uEVkLbcg2geN4+wDgS6TIb/5ObM0fG2UbFwVZI
         x+b62IyDmZTLobN61LgMlkByCjwUCMFEfVix7eZjxPT/m/W70qF38XZyyJm8UcOgNDQX
         kpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977930; x=1792582730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjTa+gHdDJ3Ki9dwK1WqBmJ7GtS6ByQ75b1yiNcqErk=;
        b=KGkedffYL56zLIaz7QeuFoFG8E36HzkKaLRGPQT/qMjCrDASqsWHe0PvdlEvS4d3mD
         silflZFKkrhIab5iqUtwaR6hzIAviFiwWt5ZJ5ypEGpftQdsGxyxQPNSMhitf0AYt4rQ
         J3zBektlZrrrwtjvozvy3+hMTsQXE/zoKGhjy9oE3ebsNIklxFq+m839y81HbxoKs6rm
         IMH/fXjOXvl2G6pL4SFaX7hp10nMrUJhio/dwIKyTwiSsnJn/UVkbXpccBXDm2TsVXzB
         6Ye6vCXuH3Z9n06mMsmzqfqKcxs+5jGx3SirtlBHwNhFosVPcZ2pzKAVHZtRX0tM1I4L
         eing==
X-Gm-Message-State: AFq9FYJeE7mRO7VclGsKIf/SItR4p0zJIZqjUXKshwfEgzCL8kdePRtl
	QxZdsOlunWJY3dvOHkb66fA/bKkF/+KFjvok28yiw8sY4dMrfpaEcN/LqpFlG6Fy/YRhDABi9XK
	K617MOiKwMeBBNsDq/tDKwDPLS7EBMxUtW1c3/T0NsLFbX57nhnI2IxW/28SNoxGQUHKO/xJJjR
	2mNsCeCtqIIl+0Ej91tNdf96WZi4CsUtuLtcL6Ash2pxYdbYojQORj944=
X-Gm-Gg: AYBFou2zDnbjcO8y8UP9YrHK2pUaCduThdotJS5XFYfUYG38mYqk0i1wYy/fcY3Fg26
	QA5pftkH8jPnSht9yHVQUqTqbJn5qyXZFaNllAlEu5VVgXETvOtRlno2J31/ktgFcEFTN0woL2h
	0uCdjF+7VBydYhej8Q0icgO9ZtKF8YmRTqRANmdokBal0/pm6mf6Rw6FuQ50dulvENv/5IdowXt
	j5Z1hJvHcY93yBD2tR2B262hoeSEnbgkKPQuvChmyMSVebbra1bRgvGNphUSA5gEJanONpgMVfb
	KVCrktHG0xx+CQnRP4tUmXFsnhYXmsU48Epsh8lklAhzPnQN2ozxotBwrZ2taczzHGPHAWcWAzC
	tv+LwQHTH2ZndkYxlRxlkefH/bCTSQosXA2PIlSZ/EoG677R3VV6I1Df7YrlCZWm9rBS0EFzOxJ
	mTIPwzcQ4gtyNJjrfpbLoD87FIsRqnQxfynqeSfCf/c5aFseBljLdBXWTLwYSTM+m9qC+fCWk84
	akqc3eLy9MMSFDKPgvK
X-Received: by 2002:a05:701b:42c4:10b0:15d:2387:b09a with SMTP id a92af1059eb24-16a6090df74mr23829855c88.31.1791977929858;
        Wed, 14 Oct 2026 04:38:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1dd57d0sm46890470c88.8.2026.10.14.04.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:38:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] Makefile: Enable warnings for excessive stack usage
Date: Wed, 14 Oct 2026 04:36:38 -0700
Message-ID: <20261014113848.2202759-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043851_135825_F7F02046 
X-CRM114-Status: UNSURE (   7.58  )
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

The default OpenSBI per-hart stack size is 4096 bytes
(SBI_PLATFORM_DEFAULT_HART_STACK_SIZE - SBI_SCRATCH_SIZE). Warn for any
function which uses over 25% of the stack, as this increases the risk
of a stack overflow. Currently only four functions have stack frames
larger than 10% of the default stack size when compiled with either gcc
or clang: fdt_parse_aplic_node(), fdt_reserved_memory_fixup(),
sbi_misaligned_v_ld_emulator(), and sbi_misaligned_v_st_emulator().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 90bf7d5d..12e2a837 100644
--- a/Makefile
+++ b/Makefile
@@ -385,6 +385,7 @@ GENFLAGS	+=	$(platform-genflags-y)
 GENFLAGS	+=	$(firmware-genflags-y)
 
 CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
+CFLAGS		+=	-Wframe-larger-than=1024
 CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 CFLAGS		+=	-fno-asynchronous-unwind-tables -fno-unwind-tables
 CFLAGS		+=	-std=gnu11
-- 
2.52.0

base-commit: 6ad246a1494807ee91e36ffcf60e4c30bb309d45
branch: up/stack-size

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
