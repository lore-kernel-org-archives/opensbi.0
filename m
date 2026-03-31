Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD99FF60FB
	for <opensbi@archiver.kernel.org>; Tue, 31 Mar 2026 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eZUUv4W/Hwz0w4FTP639zp1K776uEjVx4yOXhtDoaqA=; b=kB7EK6Vkom/x70
	rELuuisBmKVALCGUo9itWJFG1f2LDwApyds6LGHIdPJ8rVF3swth6/7HVPykAEd7sHkYYGrQN9kTt
	DfFQnACQX/mVRWlXEOiVbu6vvdcKpxTq6tdfsB3c+1yr9BZvJ3HfEl/ZH8mxFYiRRSSmQGDucQMQP
	ptyPmRfTBihVE7pJxJs4k4w8vY046oeFL9p4jtp6veCUh2QOu97JbAHHrXkmgJq1ZZIHS//Aa0W07
	N03kN2L3tUAuyKub54IKPhWzt4DMNz6kJrlPJ0bqL+oVeJiWMfV7aVflzvbZO6D0/PHQXka0Gyith
	FELUO0S5fpC6RDLUUflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vt4-0000000CjAg-09iz;
	Tue, 31 Mar 2026 09:59:54 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vt1-0000000CjAL-3WvP
	for opensbi@lists.infradead.org;
	Tue, 31 Mar 2026 09:59:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43d0245e24cso115204f8f.3
        for <opensbi@lists.infradead.org>; Tue, 31 Mar 2026 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774951190; x=1775555990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxmY6GBHrjzRgMn8HJoAGab+jgEJ5wnlSK45ova9G5U=;
        b=mhu0lr/ZuUV4u95X5OGrQcGoRkXLWkUeoZ3AXQyxMTNvDM898qh4oJWfOt/w1Rkc4k
         SB75C3V2Z25kH4ZzAzCCBkgjIqT4Z/2x4AWO2Yw7xpLT4eWlgWBE4tz/NuThMdAXYAod
         GUFLED6oPo02FkugYBVTSMNFWyVDOASs/GtCOd+PkKdaBLIJSqUcFwPQRm5XumexiBpW
         Wszr8h0lLGmZQKvPw7sqw5oEjGaduiszwbzwEdvc0JQCvZv8Dgyecz84xeKodBBE3h8y
         KnA1g+7SyqDV9rDzlx3G9Dd0KkgpLFKV0CCGkltp+nAwYJc52eL/QK3dd9+2/lnJBBTx
         lRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951190; x=1775555990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxmY6GBHrjzRgMn8HJoAGab+jgEJ5wnlSK45ova9G5U=;
        b=KBHaKGVSrioh93F0Q6D6IbVyi/8IbYwZPmRvUoNSzkiPJcbd0Ig67G5CnjsevH2JP7
         5vOySxWZFKJXRfCClLWbcrk2V4j7wL3qiVH4tM0m+cHObKpj7r6k4PBh3MZlrYgIgQ+7
         KYyPjQYlrGLoFkHL24lsD2nGAlJPFHN3m82BgkFOboCs1yqYCywaZDYFJUIMC9dI2Xc/
         wJSVVZKbSkJ7CDCAeDVNZkL3UE9IVW2xtSz6eNuPBxvDM37PDPcCfH1cohvyZ9VhKDkG
         KBd9pYSbeHo9v1U4WT11+jvRPrQm9tobqt46cyTHtG88gI5oAXAaBAlo+/L64Q9WLUKn
         jxow==
X-Gm-Message-State: AOJu0YyQvBCXkaAc5l9XYSbGN61WlzIoRIsL/BYhq6XZkOAO0emeyGb0
	/o/2QQtm+NnAg0SlE6vK6qIX3rOg4KLfJoXrowKX4WWiJFicfKeF/yYpp/VWoeGQ4Mw=
X-Gm-Gg: ATEYQzzCCc+WdUGIMzHbJJRpGzXoVeiMLBfIXNBhOZkYIJ8ayfK0mfwJEHMCWksZQuY
	0/kvSQ4ROL/l3/d53HsoLG3cmBkukTNznGmU9B8JM4VpPtT4KCyhjUEj1CmiPdp4rmAauQKFLul
	lRJfBn0TKopkArRZEK3mOHaZyoLuO83XM0/Dc3bdGqITljAIjSjNBmWD0JzAEpCfkun5viFuS9o
	d7eYYJGhotfSV/87KDtS1VcUycMSH6E3yJYFhA88vLiEk9TnNaE5+TQIRypuRwMxsZsPypWaxou
	GOhdm7cseX2Q5fDR948f7hsBRfnntHLtZeuUoale2+ET2iMOPT34MrhlIPjKj0o7SnWRmBjM/Ue
	kthtI3lZhEnr1lsBspvlXj29nbsvMGnmgAhQTCxpYApoi2Y7RFeMpZAvo1tAwpbjQ0MVFLnHUFY
	5oBoaV0DcgskZMHZMT75ZDnl9o5caXD5EwMlm9ywxPJRBZ50sun8nj7fkx0pKAYcHP+o6m+oNFH
	iDQIJiPhoqS58AUILJDf2T7N1L5BmbMbL2grXDBEbFfvJvrpVYcwRo=
X-Received: by 2002:a05:6000:2582:b0:43c:fa7b:6f07 with SMTP id ffacd0b85a97d-43cfa7b7297mr7914883f8f.7.1774951189523;
        Tue, 31 Mar 2026 02:59:49 -0700 (PDT)
Received: from LT-5CD5216TNC.openchip.local ([2a0c:5a87:e304:8b00:15b1:a941:ca1a:2bfa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf247102dsm31608917f8f.27.2026.03.31.02.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:59:49 -0700 (PDT)
From: buenocalvachejoel@gmail.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Joel Bueno <buenocalvachejoel@gmail.com>
Subject: [PATCH] firmware: fw_base: make stack guard setup conditional on Zkr
Date: Tue, 31 Mar 2026 11:59:43 +0200
Message-ID: <20260331095943.133791-1-buenocalvachejoel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_025951_896040_B47B8C31 
X-CRM114-Status: UNSURE (   7.98  )
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

From: Joel Bueno <buenocalvachejoel@gmail.com>

Zkr isn't explicitly selected as a mandatory extension to run OpenSBI
as per: docs/platform_requirements.md

Since this happens very early on the boot flow of OpenSBI where the
dynamic extension checks haven't yet happened, we must guard the Zkr
stack setup behind an ifdef block so that it only gets compiled for
targets that do actually have the extension.

Signed-off-by: Joel Bueno <buenocalvachejoel@gmail.com>
---
 firmware/fw_base.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 63bb4473..9ea93907 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -107,6 +107,7 @@ _bss_zero:
 	add	s4, s4, __SIZEOF_POINTER__
 	blt	s4, s5, _bss_zero
 
+#if defined(__riscv_zkr)
 	/* Trying to initialize the stack guard via the Zkr extension */
 	lla	t0, __stack_chk_guard_done
 	csrw	CSR_MTVEC, t0
@@ -130,6 +131,7 @@ __stack_chk_guard_loop:
 	j	__stack_chk_guard_done
 	.align 3
 __stack_chk_guard_done:
+#endif
 
 	/* Setup temporary trap handler */
 	lla	s4, _start_hang
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
