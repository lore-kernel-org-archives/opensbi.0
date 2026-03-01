Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A6FFD0075
	for <opensbi@archiver.kernel.org>; Sun,  1 Mar 2026 20:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SQ9rn1w4H31Cpsi37r8C+PvyHH96CHaj2doxtsPpl34=; b=qj1Vlb7KYboUer
	NU+4HFgs0KcVYO9OosJOhy3IcIDoJpU1qfRD1gUAgW9nXOEngda+wJqu7RKsSLVcpHoFpU99bXTmI
	cDvMNKkzgRF+r45rKKiA3DAQMlIKVBOnSEzB0TR4lNcLzP2mubLYHc+tdEQFb7LjeiJ6F1R1iCLp8
	/jz+HtMC9BqdhCspYKPblSwP/FIXB1zCsYv4zXDFHrO0GgZVHEv3R0dssTYT28Jbu0wVUFUBclzl6
	X8v2n8qQYcTitu/Zdggjtbe+V2oeHWJbhlYmQxY84JtbU9CyNPiTz4XCXMvxyc7wUVWpDCTmbn6Dr
	HctVlr/DCuvuGaDnoikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwnpM-0000000Bsn2-1I2c;
	Sun, 01 Mar 2026 20:55:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwnpI-0000000Bsl0-3v4r
	for opensbi@lists.infradead.org;
	Sun, 01 Mar 2026 20:55:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4837907f535so32218945e9.3
        for <opensbi@lists.infradead.org>; Sun, 01 Mar 2026 12:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772398542; x=1773003342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmWyqdmMt/bUh24aMaElqR0Kb3yULr99OU1oA6h8a/I=;
        b=CI8MJC0fvNs4Ww/qKGl1fZLIQRsqqSudlZzxif7C2W7Sb3g2HtPoVam4zjmaQiBZOQ
         QE5ECP34Euaq9iYqAL7tSwHasQ81IQLofUNRnKzqazrJK41gvCTLQUydsp92A55GG3dx
         q44jAHHI2sgldht1E/XaAcWPnAElNcxuOnRjI7z4kNiPRsg6XsAt5K1VU3OSMGyS5VXv
         ca+utjD2wKhb0cJJuYLd9T1WrvLrubd94Eat/dITpVMeuoalkqDcTG5viZNEhIm4mefo
         CxJgJnc8YmTBhVE7A3cV9w22rjYUjPqzBJVsIC9zKXPKwOEIf+pfMY9hG72EmGzu8IDJ
         m5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772398542; x=1773003342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmWyqdmMt/bUh24aMaElqR0Kb3yULr99OU1oA6h8a/I=;
        b=S97EmrGBAG3Ge75B+NpMaTixUeBkzITi4v5flHOFEB5Oy8dpos/5xWdykSVPUh85FI
         6hzrC5GHWgjDs3OqQ5TcIC8V3Y6aejJGg07DCdEcbgLoLqrfXQWoMCkpPLB8ShqmJ55b
         KdX2lBeRjh2bPuGTJBibeZp5mllvWk/bpPMrtzfJ9oxDzMhYA46AWOx6W2BteMoIT5FP
         RnsDVjaJicUIIrKTvVj4Ek+pHd0W0qr1WELIlSgpIYMmbUvs5BMLSo7BVBM/JUVG7XKy
         HeK2/RFkIeGrmIZJ3MwigQbfksnZ89HNl7lSHjv0vudm1z7fxGSEbw+RIhc/RmOL6rmk
         u17g==
X-Gm-Message-State: AOJu0YzYEmHfXwHTVl3bstWcm7C2WhQRpZIlyfk0Rx7PmhkTeDJreeE9
	o+wGkvh6X7OnY04jp7k+kRPVcPUKphVsXIRL4QhBhevgJ+ev16sCQIi33o8tOA==
X-Gm-Gg: ATEYQzxj7vtnZqYfSWO+z5CbbPhAJNAIisN3OIdSB6TD0nmiwEeAbEU7KaWVVdbKiEf
	WgrTshh+SUbqp4EZvRkHhfeYN7RjkoegOIS9Q+a3vTuqXZAko6+3sdK7jOxaFp5KQZF8TjijfMr
	wMCXUOlqplfRSzSRRFD0rM2q4yN7M7D6UsfMMVBrg14LEu409dn7wLuu9/Fs19Yr7TsDdPsA0pJ
	MvnVDqsW3vi20wBRqZ/WorFfa/L1ckluv1XJkFGDu15IJL5SsUC50Iung42aTuU3IAvyBQbkseZ
	Q9mMhQ5oRh7N1KjFiSnpTQOg4xXJsIEzTWatC7qWjYXasZA7r61A9nQ6Kq3kCFp+MGme16tu+dD
	EPSqhv95MHdNtXeByKQmTYPIbjLSPabnYOkpUO71FmujuhRBSSjEHvYeWCRB7Ed16lJ+FCJzL56
	+q0MEK6d7XkxuWyrJBiBiGHlfy9U7Gwn0LKpSgi0bboouCsoTuglfsEkfi7gQBFHHphj1hyAscB
	2Vg8p+Mcfpd0dkhWm8a9WlPuOLr7Frb8y5poQ==
X-Received: by 2002:a05:600c:3e8e:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-483c9ba2922mr186953555e9.14.1772398541632;
        Sun, 01 Mar 2026 12:55:41 -0800 (PST)
Received: from ubuntu-server.. (75.71.133.37.dynamic.jazztel.es. [37.133.71.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm386291845e9.9.2026.03.01.12.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 12:55:41 -0800 (PST)
From: Marti Alonso <martialonso11@gmail.com>
To: opensbi@lists.infradead.org
Cc: Marti Alonso <martialonso11@gmail.com>
Subject: [PATCH] lib: Use proper add opcode on RV32 with Zalrsc
Date: Sun,  1 Mar 2026 20:54:21 +0000
Message-ID: <20260301205421.2074835-1-martialonso11@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_125544_994050_EFF31D6C 
X-CRM114-Status: UNSURE (   8.87  )
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

The addw opcode is only defined in RV64, which produces 32-bit results.
On RV32, the default add opcode already produces 32-bit results.

Fixes: 995f226f3f33 ("lib: Emit lr and sc instructions based on -march flags")
Signed-off-by: Marti Alonso <martialonso11@gmail.com>
---
 firmware/payloads/test_head.S | 3 ++-
 lib/sbi/riscv_atomic.c        | 2 +-
 lib/sbi/riscv_locks.c         | 4 ++++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
index 9a87e56fcf5d..e4fcaaca92c9 100644
--- a/firmware/payloads/test_head.S
+++ b/firmware/payloads/test_head.S
@@ -22,6 +22,7 @@
 
 #define REG_L		__REG_SEL(ld, lw)
 #define REG_S		__REG_SEL(sd, sw)
+#define REG_ADDW	__REG_SEL(addw, add)
 
 	.section .entry, "ax", %progbits
 	.align 3
@@ -35,7 +36,7 @@ _start:
 #elif defined(__riscv_zalrsc)
 _sc_fail:
 	lr.w	t0, (a3)
-	addw	t1, t0, a2
+	REG_ADDW t1, t0, a2
 	sc.w	t1, t1, (a3)
 	bnez	t1, _sc_fail
 	move	a3, t0
diff --git a/lib/sbi/riscv_atomic.c b/lib/sbi/riscv_atomic.c
index fcf07f273149..d9abe343cb26 100644
--- a/lib/sbi/riscv_atomic.c
+++ b/lib/sbi/riscv_atomic.c
@@ -48,7 +48,7 @@ long atomic_add_return(atomic_t *atom, long value)
 	long ret, temp;
 #if __SIZEOF_LONG__ == 4
 	__asm__ __volatile__("1:lr.w.aqrl	%1,%0\n"
-			     "  addw	%2,%1,%3\n"
+			     "  add	%2,%1,%3\n"
 			     "  sc.w.aqrl	%2,%2,%0\n"
 			     "  bnez	%2,1b"
 			     : "+A"(atom->counter), "=&r"(ret), "=&r"(temp)
diff --git a/lib/sbi/riscv_locks.c b/lib/sbi/riscv_locks.c
index c29a965907bd..e253b1b723ab 100644
--- a/lib/sbi/riscv_locks.c
+++ b/lib/sbi/riscv_locks.c
@@ -57,7 +57,11 @@ void spin_lock(spinlock_t *lock)
 		"	amoadd.w.aqrl	%0, %4, %3\n"
 #elif defined(__riscv_zalrsc)
 		"3:	lr.w.aqrl	%0, %3\n"
+#if __riscv_xlen == 64
 		"	addw	%1, %0, %4\n"
+#elif __riscv_xlen == 32
+		"	add	%1, %0, %4\n"
+#endif
 		"	sc.w.aqrl	%1, %1, %3\n"
 		"	bnez	%1, 3b\n"
 #else
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
