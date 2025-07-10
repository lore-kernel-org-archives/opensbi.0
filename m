Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72370C83F1A
	for <opensbi@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewnmYYN50xrteshdC5heYK94sWqisEB0HU5aclpoKKQ=; b=Pes3wE76bOme32
	eR+/Mf+eJ2BEx5jSXBWsEVX3hvwNQIkTk3rujDSGN+8qpylPt909Rj77TlmWfYCECdYv0HHL412e1
	mc2srJtAtbR2IUCCSMpEvJ669eOqv7BjWo4JMnNY5HeaZnTfOEF9KScboLpuez7SKv1uBr1dw/DpW
	Wfr4Lzv8czaV76h4HTrY2xlyrK+cTvpJU+6sj7MuVdcYzE2GwAi0nWH+9kFWQe6r2DUV6cb2QUVpl
	lFyOtQKV5AN+GaXfTv4Tvi87BT0cqNpCSXgoy+mInvZuKq/Op7+z1Z7Em8U8q8CRuQUns+BfI/7Qo
	a29VUCgdH3Faj9Mltpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2RL-0000000DRhJ-1AYW;
	Fri, 11 Jul 2025 01:20:39 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0W4-0000000DFdp-0DZZ
	for opensbi@lists.infradead.org;
	Thu, 10 Jul 2025 23:17:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74af4af04fdso2123605b3a.1
        for <opensbi@lists.infradead.org>; Thu, 10 Jul 2025 16:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752189442; x=1752794242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q9TXh9PF719V9U9vx7E+3Rbl0NEjOTEMxRu8mkgNqc=;
        b=YGfnv30PUVzvpEo568HNktvtyrwJGCxhCBJ08aTCs7ey9z6LRySjG3kFIvrLRxAT3Y
         cxa/R/4pUEaa4zw86PGmBecGhMlnjqwwUUE+VzZ7xZ3F3MOI3IMBWl4PJlVU/mbC/yMU
         j3Edw8KnOcl4ToHzXl/i19slmVm9Ujh63S76WuBCyktlK5lCqhBYcJmr3SyZcmLC/Su0
         SGrpq281zj2jD4CLQdjODfhQQn4W2UGa3dNAjVeDy0rL5g7R/4/Z7/CF+8flxaJWlrV3
         69S9BoVqfaADwwbd5XVu0GHdYfqyWbFv9jtRSQSdYTlvLtjI91e4rh1Dx6jMef6V8XoG
         nhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752189442; x=1752794242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q9TXh9PF719V9U9vx7E+3Rbl0NEjOTEMxRu8mkgNqc=;
        b=TCPUvy9TNYmKw8mpE6F3g/IFw6IZgGPpDURbz05cMLeMwnb6Fm9GJpQzUIK+dFVaVb
         rFY5UFYUdlayiLWAOWivRatgVztD67Fqx/apRNI5dIqnEbshdcH1eBJw76vAuxKpdCXf
         bt5IiyjC62Bh6Pw1QPL2Fui9vLnbr7IhGfxw8CMfuakdXLiOmTar+OhahO9EFU57r6z+
         KzuW+ALtHtMwZ31+oZrH3Pd/JRZm7etNC62LtxJc9qVaw3cVtIkWHURthb2yEE2MSvnU
         O8YELE6n8ffb+6oGq6+W5Hd9xKHLgo46CjZMV2ZS+ZVgHFYBLjjp2vPB3d2JTV+llyn6
         zZvw==
X-Gm-Message-State: AOJu0YxuZjWuPPEKoU3ZyzRiJU3pgLhtPGk07OZzgnsc3goor+RN0FLg
	raLNUCsP4mSXg6gs3Tz642L5Nd7easK3+ePZuCdipRDgmRhSMqTPTicfihq/z8p6
X-Gm-Gg: ASbGncsm5i9JWu9PU65vxHZxx8D7Cr1D/dH3v7oOxNPDDm9JwnKy1HQg6wKjoUp+Owt
	mK8oGL2lTugEJfWTv4wt61MHrZjzpDeZMfzRgaVFKX2Psprn8f88VLX+86nly/DQr+hKBKaorov
	Rv2A8/9+MfLHB5gQ8klpMnzsiRsJZkXQ9L9xDraJ4fdxWxJn9xTUkAZZboYuPSquVWnIn53zioy
	rsKx45gSY3jmb6brRJjzhEVIOYl4qqs6HP3n2Ve2J8cyHkRTFcUgpbME5efAyTfYAuKGUhWZUtH
	LmMH6BDRxFMswMyAGDghpwJMaEXq+wWgaCdB9STADSztU9QthhWxr24D0CuCfonwrnIpb+aa5W8
	Yo71C84BLekTjn9ble24aI4gdp34x2ha3ofFuXEbAQ25k1i+VT7WQ6UHetiuyz9KCdOK9DrFTut
	fR0D/aZOpKx/ixRg==
X-Google-Smtp-Source: AGHT+IHd2ZlZ/yoxkHJZy35TAfYYkh6BUsfuQVFM04MpKZvnr7a03zKLcDHJrkoIQAAfYk3LW+DOvw==
X-Received: by 2002:a05:6a20:431a:b0:220:9512:9213 with SMTP id adf61e73a8af0-231278bf673mr1420819637.15.1752189442292;
        Thu, 10 Jul 2025 16:17:22 -0700 (PDT)
Received: from localhost.localdomain (108-199-134-93.lightspeed.sntcca.sbcglobal.net. [108.199.134.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f25269sm3395652b3a.107.2025.07.10.16.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:17:21 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v1] generic: mips: support harts to boot from mips_warm_boot
Date: Thu, 10 Jul 2025 16:17:08 -0700
Message-ID: <20250710231708.4553-1-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_161724_089661_0D7F9E80 
X-CRM114-Status: UNSURE (   9.58  )
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

We program reset base for harts (other than hart 0) to boot at
mips_warm_boot that jumps to _start_warm. This helps to skip some code
sequence to speed up.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/p8700.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 888a45c..687912a 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -140,6 +140,22 @@ static void power_up_other_cluster(u32 hartid)
 }
 #endif
 
+static void __attribute__((naked,no_instrument_function,aligned(4096)))
+mips_warm_boot(void)
+{
+  __asm__ __volatile__(
+	"	j	1f\n"
+	"	.align	2\n"
+	"	j	1f\n"
+	"	.align	2\n"
+	"	j	1f\n"
+	"	.align	2\n"
+	"	j	1f\n"
+	"1:	lla	t0, _start_warm\n"
+	"	jr	t0\n"
+	);
+}
+
 static int mips_hart_start(u32 hartid, ulong saddr)
 {
 	unsigned int stat;
@@ -150,6 +166,9 @@ static int mips_hart_start(u32 hartid, ulong saddr)
 	if (hartid == 0)
 		return SBI_ENOTSUPP;
 
+	/* Change reset base to mips_warm_boot */
+	write_gcr_co_reset_base(hartid, (unsigned long)mips_warm_boot, local_p);
+
 	if (cpu_hart(hartid) == 0) {
 		/* Ensure its coherency is disabled */
 		write_gcr_co_coherence(hartid, 0, local_p);
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
