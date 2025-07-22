Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BD5C83F1A
	for <opensbi@archiver.kernel.org>; Tue, 22 Jul 2025 23:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uL56VR27XA3HcZQe4KGdv8r3vywO2NMFo91X2bK+6BI=; b=HMt1V8gG7aODqq
	cZNz8cWkwuY43r0xlWazpDeLTikp51JuMn0HncrOxf62uNNH81IG5ukQWDPFC3chO+nVEO81MemDT
	8cxSC5blfFRQAoW6DDHQrSwotZfkGX2osyyJtn4Ou6cnKxWRZF3TRiuDmodJ/ntVXANSwzcJav8wK
	hlxfP6w7w3+N7ffcILWM5AtfDsRYgwvGXKZbKLl336ERvWDDrchzEQnGPg3A91IDTFfmnREnjNMgB
	vcT3lOz4HYb3Nex39Hd3XkxD2fbeSuLGZYior8CQwVuHaJsMo/8jtNhA1HN2nTzKV48sdwIMMtI7p
	ym3NPHQSfZAuVyxVMIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueM28-00000003dy0-3Rwz;
	Tue, 22 Jul 2025 23:04:28 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueM26-00000003dxT-3Q6u
	for opensbi@lists.infradead.org;
	Tue, 22 Jul 2025 23:04:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-75bd436d970so1757377b3a.3
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 16:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753225465; x=1753830265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IOkOrBtyBg1kHV6+rmo6U558AtrE58I4XjTn0VYETE=;
        b=PTz7xjQYJDhqle+GlSblIJWU+h9/dA+jcpXfDvalhinvgixfNzW/dVqcI6zeWpqOCr
         1+GxddswH2hpCjfjJ0IIiQU/AhTBhtsCoSFE55zP2Eo1NdJRV7dT4RbtoCtFJrTpXWD0
         rSy9ULXrLRMHLEpYlEeo38ZwR8HJi2BGYCyqxKWXCwZHhWWlyIQWf4evR5tICiPVoEV7
         JEeuHfLqQ9J7BtfSXiNBWk46YCpZS5yYADjjPElhQts0IlTjxfumIfIAl917HjN5FlNZ
         gMT5HfUJvXmRnSDiMVnNdfKiyLT/2Kjl54hppacvOfTnX6oW2CqVmmLR496bhUtrYZY4
         ZB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753225465; x=1753830265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IOkOrBtyBg1kHV6+rmo6U558AtrE58I4XjTn0VYETE=;
        b=nM/ve+u2uYlMtfIvL6jgLChHqUW9DxyiKzpKOUpkZYEMEcz5ktdw/Au6UzJ3ewLPso
         /QIlBY+7La6icTX/Az68z15/vhAOvfsXnxlEV9D8iwRu0ezcdKHeNN/98d8eltyc3I/B
         HVlRrI7FkNI+CVX1pHf0sT6ElhcrR6PHueq58QPf/yHpcgq3U0VtlJRInluuFDxjLSvF
         Ekf8ICBccfv6VNS8+mRtVJDeLquC/z95TQVomSbuQ4J4LgT+2KIoSKl26LSPtiPgSCtW
         SPrewvxlp+KiPLZIwcgB2jvV7mIopMFAsykly4YR/Bmu1oExI+0P9wbDsKXUzLuQZrKo
         fchA==
X-Gm-Message-State: AOJu0YylqxoyF8zRYmcER7qi11eC+GaYF8JqmAVJC/FOgDYKOXsqDUYw
	fyEWigVaGv7UJHDVRMV97mHpNHhi1oCcEtEwEXNJIXy/WCE1zqmOUGaBV14XfxcE
X-Gm-Gg: ASbGncshZ4fwaaVMciFCrpOmHxti/amfv1noCUFM3vd0+NYkkEX+cZ15aYfroj9B7cl
	rBypoysoE3MrrS40zzpOVl6Is48Gq7ez7Wkzf45hk9IGMg09B9sfV6fYwmkKYByV+UnK0WJimqP
	RzhqEwP1ljXxZD4sSRpGTldt4kLrqQaVhUtvapThsQ6afDw+DUDimxkjkME0zTXV8c+HKDUMz+U
	IQAkTyy4vs2ZxYoA+QKOsTe2ht0odh4IuPQ0Hl5rLxTbsoLx9vm7wRVKjLWSZyagkCMdhA6r3aB
	Al8VnQXVfouVJ4h/5OUte+y98WDjAJcn+04rCdcWsq1Mcn3jZaz5tVHzMI0I6+jxsdkXJbaCtWh
	tRMojB4COt4UzkNbKDbHoQasw2ddHz975nFIn
X-Google-Smtp-Source: AGHT+IHJC2ej6ME0U25t+lVxCme2IJk6JK0XBCfuOIPXsscMXf/CgPnyD8vDkAK5+da0m/pL7j7qBg==
X-Received: by 2002:a05:6a00:4b02:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-760365deb0dmr1347793b3a.20.1753225465314;
        Tue, 22 Jul 2025 16:04:25 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc680a0sm8401813b3a.141.2025.07.22.16.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 16:04:24 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v2] generic: mips: support harts to boot from mips_warm_boot
Date: Tue, 22 Jul 2025 16:04:14 -0700
Message-ID: <20250722230414.6815-1-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_160426_854553_FE146D3A 
X-CRM114-Status: UNSURE (   9.95  )
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
 platform/generic/mips/p8700.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/platform/generic/mips/p8700.c b/platform/generic/mips/p8700.c
index 888a45c..8c93ebf 100644
--- a/platform/generic/mips/p8700.c
+++ b/platform/generic/mips/p8700.c
@@ -140,6 +140,20 @@ static void power_up_other_cluster(u32 hartid)
 }
 #endif
 
+static void __attribute__((naked,no_instrument_function,aligned(4096)))
+mips_warm_boot(void)
+{
+  __asm__ __volatile__(
+	"	j	_start_warm\n"
+	"	.align	2\n"
+	"	j	_start_warm\n"
+	"	.align	2\n"
+	"	j	_start_warm\n"
+	"	.align	2\n"
+	"	j	_start_warm\n"
+	);
+}
+
 static int mips_hart_start(u32 hartid, ulong saddr)
 {
 	unsigned int stat;
@@ -150,6 +164,9 @@ static int mips_hart_start(u32 hartid, ulong saddr)
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
