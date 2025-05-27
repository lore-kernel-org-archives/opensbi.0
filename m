Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B6BC54F30
	for <opensbi@archiver.kernel.org>; Tue, 27 May 2025 12:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7RBw1ahMc7Zv6c8s5TQBBUcc2OmQcptuj+wQJe3Rmrw=; b=wbQS5mkx8WfxCn
	nC8To/ZhQbIMETaugALS98m0L9mfsjUoJvwQ2HLroxIM9NhtFt+ouoFFviNecttNCtQwfkcuW3kjc
	AFg9DzsynIUx5Co+2Kv7dsmh0e3R+87FA0eI5ltMu7JN004g1YYr7YZaWGFaq9rlOzz868ul+hnfX
	+KDe4xjXhkKF0ZmOLzp81wyNf+Ii9fRRTj06ecsbuYgvuwnv3qC1rRQo0y2jlQq7k+9a3HSDx7JY8
	zBdBdhUbSNL8p94moB4bUx0Qxc07a2ocg+v72QG759KM2ETpAy0t8qkTqmYBGKQqlQyu05fjYbdAh
	TsAGC5Ni2U4s/BOg/I3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtjP-0000000Ajlp-0APb;
	Tue, 27 May 2025 12:48:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtjL-0000000AjlL-0rm4
	for opensbi@lists.infradead.org;
	Tue, 27 May 2025 12:48:33 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b2c377d8982so1500941a12.3
        for <opensbi@lists.infradead.org>; Tue, 27 May 2025 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748350110; x=1748954910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y2V14K0mJ9RQ1hHSe1gUMdzSRR+BFj8WSvwdG71KtI=;
        b=EQCe+sIpU7LJsV7K8YyS0plz2AcrLZqifmq8Ip6UpqrC4nr8KRUyd/mbUxwlx1uVUc
         kbMZ3gF0nDlDF8wJ2A8hTNOcesM7eTnfVSKueQVlApRenijHX8aqJhlSyo0lccc2ZnL4
         YjrU0PgR0dv7sJaJ9+jgIgrn8iEjGDg7/KInyQllST3QGdDegyFGSS+5wNUY7B961P/A
         NvhSQpOSxQxscYu8DEPPVSs4JzjkqM/g28+rAES5Xz4QCGYlyQpOokHRENkE+6uDKr0j
         iBDV4NLqaUmwqn8vlOpzRdvWf5KMMj/iaZsoSXeMH6YCw7Yq7hUz0H3HYQU43pRCSN1s
         HS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748350110; x=1748954910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Y2V14K0mJ9RQ1hHSe1gUMdzSRR+BFj8WSvwdG71KtI=;
        b=EyOFwIwHcdOqUk39HpSTpoAzh1GH76wivmClOlMMRRIUUegAmXNWP/oe/acvqiDL5V
         vKioGMTTlSX9t/mmWXWqaYbso2bDQRazn3z7Tn/OApLTmIb336CfGGhMlZBmciOVoWtu
         9fQ/GeW5KVFtIB05dBLibihxY9nFKdULqWFAv1EzIbz/NofBf+EqO+oSUEWcRywcFtx8
         yMPfqxJ9njm3htBaAAAXchuiJNrEMRdNE5lBOK8XfHt/9y1SJ9bo73jaKsgys0ntsTOf
         5qn6uiDJtlVmLxnVBSwkdo8ua1zEy4XZtIuImo8ri6TYOMwDLVznKmZW1C6jeAK2sQxB
         Cyww==
X-Forwarded-Encrypted: i=1; AJvYcCXxEA1eMfMXZg4T9iotOtfsJvfiRdpX/1tdFww4slT2tbi5mp0Zw9Q28ZLdGFBBGF+JD6Od0BJX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6xdlqE67EtXLPfFaBcgHnQ2jJ+3GlxlUCHz54/1Ul+f5yHlKc
	u7kC6aghZLS4EUhuJAPoLrekxiy4Z86LqeT8VzH0VDzwFN2ocp7S5R6aBBOTn/5MtiVY3VtrznD
	O/1A0iWI=
X-Gm-Gg: ASbGncsHbJprjiu08USCYv2vCUpViKvrMRW1NVW8JO9NuE1W445Rrj803h9Sk+ql1d8
	SPXIGm7L+Q5T2XiuNG5p4aWyUSmbMxr56V85rw/wUzu5B+4rWDKga4Og4yz8ETbgQE77EoljjxC
	uBn12VshFpMLGEKQE1pb3vDe8bpkzMjJbC7SUHXSvC8ZcoPw/oiWMUhqnGovjgD1QEpbfyTioIn
	d33RIUs79kZpmLb42deFUt3liV/ybKQVybLcZTdfMjMPWTfNxDHHL1R/wuGCqCeKKOmyYkhijKF
	sZ5KsiTGES8JPR5wueW+BLB5fM01Zo7VrEwHqlVCLH2B0bK8MwPAcvBTc13OiTIbyWM8BKUMx1h
	oBKp9Hnl0ioaLlCib8YKd9QmqZQ==
X-Google-Smtp-Source: AGHT+IF0hGELR5nH7L2AbeOzey8Njwj6/Bj6AvGgV5W4O3X2RXOuOV4KepvA9vq2VzOl/H7Yhik03Q==
X-Received: by 2002:a17:90b:19c6:b0:311:9c9a:58e3 with SMTP id 98e67ed59e1d1-3119c9a5d25mr5416925a91.10.1748350109471;
        Tue, 27 May 2025 05:48:29 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31198382e19sm2542417a91.7.2025.05.27.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:48:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Nick Hu <nick.hu@sifive.com>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] lib: sbi: Revert entry_count before doing hsm stop in hsm wait loop
Date: Tue, 27 May 2025 18:18:21 +0530
Message-ID: <20250527124821.2113467-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_054831_248375_33C95404 
X-CRM114-Status: GOOD (  14.19  )
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

Using hsm stop in hsm wait loop causes secondary harts to be stuck
forever in OpenSBI on RISC-V platforms where HSM hart hotplug is
available and all harts come-up at the same time during system
power-on.

For example, lets say we have two harts A and B on a RISC-V platform
with HSM hart hotplug which come-up at the same time during system
power-on. The hart A enters OpenSBI before hart B hence it becomes
the primary (or cold-boot) hart whereas hart B becomes the secondary
(or warm-boot) hart. The hart A follows the OpenSBI cold-boot path
and registers hsm device before hart B enters OpenSBI. The hart B
eventually enters OpenSBI and follows the OpenSBI warm-boot path
so it will increment it's own entry_count before entering hsm wait
loop where it sees hsm device and stops itself. Later as part of
the Linux boot-up sequence, hart A issues SBI HSM start call to
bring-up hart B but OpenSBI sees entry_count != init_count for
hart B in sbi_hsm_hart_start() hence hsm_device_hart_start() is
not called for hart B resulting in hart B stuck forever in OpenSBI.

To fix the above issue, revert entry_count before doing hsm stop
in hsm wait loop.

Fixes: d844deadec94 ("lib: sbi: Use hsm stop for hsm wait")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_init.h |  2 ++
 lib/sbi/sbi_hsm.c      |  4 +++-
 lib/sbi/sbi_init.c     | 13 +++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_init.h b/include/sbi/sbi_init.h
index c9013ea4..ad068674 100644
--- a/include/sbi/sbi_init.h
+++ b/include/sbi/sbi_init.h
@@ -16,6 +16,8 @@ struct sbi_scratch;
 
 void __noreturn sbi_init(struct sbi_scratch *scratch);
 
+void sbi_revert_entry_count(struct sbi_scratch *scratch);
+
 unsigned long sbi_entry_count(u32 hartindex);
 
 unsigned long sbi_init_count(u32 hartindex);
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index e8128a39..557ab131 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -176,8 +176,10 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
 		 * If the hsm_dev is ready and it support the hotplug, we can
 		 * use the hsm stop for more power saving
 		 */
-		if (hsm_device_has_hart_hotplug())
+		if (hsm_device_has_hart_hotplug()) {
+			sbi_revert_entry_count(scratch);
 			hsm_device_hart_stop();
+		}
 
 		wfi();
 	}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 62c32682..84a63748 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -579,6 +579,19 @@ void __noreturn sbi_init(struct sbi_scratch *scratch)
 		init_warmboot(scratch, hartid);
 }
 
+void sbi_revert_entry_count(struct sbi_scratch *scratch)
+{
+	unsigned long *entry_count, *init_count;
+
+	if (!entry_count_offset || !init_count_offset)
+		sbi_hart_hang();
+
+	entry_count = sbi_scratch_offset_ptr(scratch, entry_count_offset);
+	init_count = sbi_scratch_offset_ptr(scratch, init_count_offset);
+
+	*entry_count = *init_count;
+}
+
 unsigned long sbi_entry_count(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
