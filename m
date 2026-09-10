Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C5EC79FBF
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FKST8TmOrZeI0uBE4tKyTB9hqL/22IDhos8G8xPBcEs=; b=bHiAr8yTIBw737
	kX5zk9IYDEkRvCNGoJzkDeTk6cun97hHyDIa84q7pVZMA5CaeS8NS/rw1P4Fv5HRdGCt7ku9H+0Pm
	W5uFTUKYn+v8+2K/Yn1u0HJ/wd7v8EWPaYIqob+ieLDzyH39w3EFZ1bLX73EpmX1BaHxl5Fng/4Qd
	LLXQRCpSn9YuoOaikpihOxe8YgN35rERiEG7tqJ21LH0zu7FR3FD/DM1mYHSzG+xpFMHD7iGyk78i
	c38XbYpTYOyNcf/pWNulHZKvkMHu3JNFExd++wi4JR5rZjNn41gJZW0tAKSDOMe8RoGVO1mkwIvej
	wsvuy0LicqkHuurGKiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4j6O-0000000F7Qv-2r2W;
	Thu, 10 Sep 2026 18:02:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4j6M-0000000F7QU-3Dzl
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 18:02:23 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5b4b037a2c1so83235e87.2
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 11:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789063340; x=1789668140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LI+xBRJ1IUD62EjrEU1r3hpCLBOJG+N9r5jqCXaB/Uo=;
        b=I0kSZkMnE/tDov6hur1Ci1pyQ+h+5ubxX3gObA01s0GIhng3g99XmYB+equ701yCB5
         HVVJsaWBRlBXvg2LCiIqEN0s+hmiDDBCfdlsMEIE/l8XNfxWQqhMoWt321jakmueiMlB
         mpOb2AI+fKLCwHPj2efZnFkyGr6NNujLOm3XqZCthreaBXB0YpYrf2AdapGQzjgH8HUn
         9eSBRs28ESZR0+Pcxx852+7lHOA48fbSjJKiB8YafSNWyC7kSFMxfbjVoCSih13nRcD1
         wTiOwXclDRDjkaXP7wiAlN1k29ZW9pDBy6rxXCm/5xSUI8nY0Lt2/vu7kI1iTmsoe7J9
         NVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063340; x=1789668140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LI+xBRJ1IUD62EjrEU1r3hpCLBOJG+N9r5jqCXaB/Uo=;
        b=MO+SZM4idSA/jb/FT+8iBY7x/PzRy4SOl7JtWLq1r+okIh1bAqG72+cj4yZMQZASlr
         x40m7Fh0tM6rBseWUSN+uFJU7qr+MZv2BWkAJG9DYNqObgVks2okHAG82Dq6F+6QQtS0
         r6P4kJiyse8xvslyOctpYLRvWRV6y2IpB/+EvPB/kDO437qA5ex0G4KYSEVBQqsrtycM
         mZnhOccG8w1bkbnNPG/pEhBJA8m6QhTbElC/oP5fKsVtJV01MBSrW1M1DMqiBrR1Dekg
         K6RvzOAeXl6Idi3fFwgu9V8HJWHi8f8IHVrx7/plofHiE4vEyxNPsH1QsTFPKDyVQ2Ub
         U/kg==
X-Gm-Message-State: AFuF++lflCjS3quQrXkqRyiGrgvVSZ07VPNqKIn5wN7LIanjraHlj3e6
	v5dBFIsSQ/C8h+dfWmyPk8u84AfDl7sTMBc0FZFjlxMZRXJYXcOkp/7fogvmB7ts
X-Gm-Gg: AYBFou2Kl8OkAmlzWPiGXS/yrRdn2VsNxrnO1E2+uW4/U/eaQOMaNv+1nmNySabp//H
	8N9TRRLFlbn4yxC5P87W+UqiAzKj3e8R3sHKCFtMT3e02aV0caIB6ZiU9dI/UKiaglvFAe0oHki
	A3xPBcmsB74iMUDAHc/c5k2iIOTmyGEjbCJ8hEcDECFzFgS+tElpNXFVBm+HWHKZH7oBuGIUASo
	7U0rW6iqjoO5qoseuUdFoF3KxniazWJrxdxBubmd4AbGU7aJIClOlDr/k14WUiU2cLwa1/VJ1i6
	fLqZed8bjnR09MkE1rk/SEEOX0aFvsHOkachtL1I95EOB4n5g2Gu1+i+NFXGEw4YV9P7L3h557t
	ImoiBZzSB98/3fBmLFGoalIsqsgJtZJItABuz4a2l4K/UIAZHpOGiW57jHew9vJR8qrZqLd3beY
	u9YWq94lEZ6NQi5X3tCysSq2CYEHhvJ86Cuc3u4RRmbTOsYQi0t4TJLV+8bVdPpqXnPtS2clBwG
	S777ujdq/zsLmZrwlPwqaGxoH0A6nQEMBFmUBJDRmLBs+mLxy+LihNiPyG4mKPZ8Q==
X-Received: by 2002:a05:6512:3b26:b0:5b6:1a7c:33 with SMTP id 2adb3069b0e04-5b8a033ad93mr108145e87.54.1789063339843;
        Thu, 10 Sep 2026 11:02:19 -0700 (PDT)
Received: from localhost.localdomain (46-138-31-164.dynamic.spd-mgts.ru. [46.138.31.164])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04699c3sm42789e87.49.2026.09.10.11.02.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 11:02:19 -0700 (PDT)
From: Evgenii Prokopiev <eestelle0626@gmail.com>
To: opensbi@lists.infradead.org
Cc: Evgenii Prokopiev <eestelle0626@gmail.com>
Subject: [PATCH] lib: sbi_hart: Reset mhpmcounter after probing its bits
Date: Thu, 10 Sep 2026 21:02:17 +0300
Message-ID: <20260910180217.3256-1-eestelle0626@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_110222_816382_D52CFB9B 
X-CRM114-Status: UNSURE (   8.83  )
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

Writting mhpmcounter3 (and 3H) to determine the allowed bit width
has a side effect: the counter starts counting.

Explicitly clear the counter right after the probe so the probing
writes do not leave any persistent hardware side effect.

Signed-off-by: Evgenii Prokopiev <eestelle0626@gmail.com>
---
 lib/sbi/sbi_hart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..a413bfe0 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -448,6 +448,7 @@ static int hart_mhpm_get_allowed_bits(void)
 	csr_write_allowed(CSR_MHPMCOUNTER3, &trap, val);
 	if (!trap.cause) {
 		val = csr_read_allowed(CSR_MHPMCOUNTER3, &trap);
+		csr_write(CSR_MHPMCOUNTER3, 0);
 		if (trap.cause)
 			return 0;
 	}
@@ -456,6 +457,7 @@ static int hart_mhpm_get_allowed_bits(void)
 	csr_write_allowed(CSR_MHPMCOUNTER3H, &trap, val);
 	if (!trap.cause) {
 		val = csr_read_allowed(CSR_MHPMCOUNTER3H, &trap);
+		csr_write(CSR_MHPMCOUNTER3H, 0);
 		if (trap.cause)
 			return num_bits;
 	}
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
