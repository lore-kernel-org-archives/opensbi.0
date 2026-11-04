Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C19606A336
	for <opensbi@archiver.kernel.org>; Wed,  4 Nov 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nbABECVK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MkwMGUtG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eR2pQszukALUWgzEAEzT6oMkdDV64nixwvyayCxtEus=; b=nbABECVKLemJMjxcy34I159dbz
	gQkYfPn45PwcIe4lh01CaKV6zqQfG7LqcaGeXsoQpdjI9JGqbmi5aJeIkcAZNEdrZ9SYiJMgZu7hT
	Umo2zCoavGqmauS7MMuphrrbN71jfwtXk6E0bRnJtUPqIbMz0Ec3sGalql39BHLyEP8IXrJZLb+w5
	0u3smHOXxpMzk9GhXJKz0zWcHSWp0ggHtlZfJKo6zwb5U7AEkvvNzt/ZuJ8EjukfnsH3FC/FGmOuh
	x88N13VTcAFRE9hjlou1h9iOMR6IgSn2cMeEy/+aVHVq39U83gH+6YE9tF9hqmO7cJyM+a5ao/Xif
	4n7Ipztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdYa-00000005tqT-0Z77;
	Wed, 04 Nov 2026 16:09:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdYX-00000005tpc-1E4T
	for opensbi@lists.infradead.org;
	Wed, 04 Nov 2026 16:09:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so8406005e9.0
        for <opensbi@lists.infradead.org>; Wed, 04 Nov 2026 08:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793808583; x=1794413383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ybr5fXnOAA6wnbk8uXuORAGLUcOmz5/+marIMwiBbqA=;
        b=MkwMGUtGKjx3pztb0zJUD1MSJC0W4h+aBEcLsp0BAfBEeD8rjEjzPS1WkiYiaY63gG
         cp2hbQIudtIH6t8l/3UAsheLxcxtfiEHKtNZLVqbNYu7qTcKn+7Sstk8p6S7cG9eAAEm
         hRqxyuFMTZ+MiaRlAAB6qRtE+8Mr9wf5DCuYmMH32fiNerAAbJVbm7QfZ23ICPICqEVT
         aSvppiiftWv6OcWZvZzvz4h+Gs3/ey4Z7TiBbmFtmE+Bj74Mi+OZBQhdBCgZlrHE7O2z
         1w2LrHa7+WHKziLSydAna+tMLFPD53JV+54pzX7oPIe5DIJnqUOu4Mdof1OmjGtN0og3
         Rh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808583; x=1794413383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ybr5fXnOAA6wnbk8uXuORAGLUcOmz5/+marIMwiBbqA=;
        b=b2RjnAHYRmF4Rj9XcwQxdGzpZd/bRxK/cfZch0Ml0sJpPBYFnYEKZXfJdFTVW1zUj4
         9fo2nzwjWEybpX0TQP3t2/c1AwoKmp9w1iT6cLGNkvtdvc0rXyZqEe/oWdIli3oaYkA7
         N7OvlGHK5o/r9lyGs3+3hzorutIGBQhum7qMsfCidSJuMT+3QGwM5vMNVERlzym6FUKJ
         EyKrKqUve66h/1jqT1jehKExJES93dK8NKPwODlwgCh5EDIC+lNovsUfuOfUC68dAsVP
         IQ4eWyzy2Sv5GgYUoMZ6EZf04aER1D0mt08J92b75WZC4B1R9amrcDqPcyNU4WoLVt7U
         YqJg==
X-Gm-Message-State: APuU4Z/ygnvQMY04MKMFPo8XKbqQ9evoWPfmtcBYpCLZQlp0f8fgf/+b
	OGPm4LjprbNQjmm265L61ER8H8xR43EuNiB8bKruZMrscIO5BiV7ikwJQyAMhyCQ
X-Gm-Gg: AYBFou0mTuSedjkrV6tfqHM4BO8WF6TpELhWf9YWa9DtiZZSyBUa2AB6w1ku5+EYqI4
	disK+yq8Grtr7HWGLidS/1LvAFIuEZuRSz/5OSreVhpzGv+/WWEnoMDXqoMvIoHY7asS96w5Dnp
	q93rciHMx/IW8lP84XYpW66aLrVLCyeDKSxQe4ZwusgcrrKDJxKadj7+kK7Yfw47jP14ImbB0KP
	jY4xMneSfzqSpHJJtmhRYE/DhJ6T4odftjAR2zbm+iwZyJ51KC57hvW4718GsdiE6oSgQEr/my6
	bw7AlQkZyLhS+SeIeuyYKKADQLZ5rI6P8CF4merQ4TY1ER7OajVjYIAW54eFc0oNzCfewJA+h4T
	dXcEFJpYlHefGoLyE4a/AwOgpwLv1HDok94wCfBRtWWpTe/4qE6plUv61PvTMCmcwAS5zC5/XSJ
	fJyCpGL+gv6/77cZvbuJx8sYCnAL989Y5I8BgUJwF8Te8Ju01/TNJ3szrHwaNDJUeSAVfHNyMLz
	btMVSHpK01Af5DQxUWi2RXZNI3Qqba5uVEm0obf/DhuvMoeRv4WBykCjFXLf1HShVRL7OXnn7jJ
	7tWqQVOnf0d2lLSjHCsRoX8Tf4uVpmpjHslNoFUz+aQ=
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ac1793e81cmr390807605e9.13.1793808582793;
        Wed, 04 Nov 2026 08:09:42 -0800 (PST)
Received: from ThinkBook16p-G6 ([2001:999:3401:b544:ec98:6ed2:549e:44d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d7b0727sm58907725e9.14.2026.11.04.08.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:41 -0800 (PST)
From: Ahmed Fardi <ahmedfardi93@gmail.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ahmed Fardi <ahmedfardi93@gmail.com>
Subject: [PATCH] lib: utils/hsm: spacemit: wait for the PMU to take a wakeup request
Date: Wed,  4 Nov 2026 18:09:37 +0200
Message-ID: <20261104160937.54613-1-ahmedfardi93@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_080945_357777_C0F92DBB 
X-CRM114-Status: GOOD (  14.62  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PMU clears a hart's wakeup bit about 17 us after it is written. A
second write before that replaces the pending request, so harts started
back to back may never wake up (on a BPI-F3, harts 4-6 stayed off).

Poll for the bit to clear, with a 1 ms timeout.

Signed-off-by: Ahmed Fardi <ahmedfardi93@gmail.com>
---
Tested on a Banana Pi BPI-F3 (K1) with OP-TEE starting harts 1-7 back to
back: 5 of 8 harts came up before, 8 of 8 with this change. That test ran
on OpenSBI 1.8; this patch is the same change applied to current master.

 lib/utils/hsm/fdt_hsm_spacemit.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/lib/utils/hsm/fdt_hsm_spacemit.c b/lib/utils/hsm/fdt_hsm_spacemit.c
index 4f76b99e..3ccb17db 100644
--- a/lib/utils/hsm/fdt_hsm_spacemit.c
+++ b/lib/utils/hsm/fdt_hsm_spacemit.c
@@ -11,6 +11,7 @@
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hsm.h>
+#include <sbi/sbi_timer.h>
 #include <spacemit/common.h>
 #include <spacemit/k1.h>
 #include <spacemit/k3.h>
@@ -53,15 +54,27 @@ static inline void spacemit_k1_set_cpu_power(u32 hartid, bool enable)
 	writel(value, cpu_idle_base);
 }
 
-static void spacemit_k1_wakeup_cpu(u32 mpidr)
+#define SPACEMIT_K1_WAKEUP_TIMEOUT_US	1000
+
+static int spacemit_k1_wakeup_cpu(u32 mpidr)
 {
 	unsigned int *cpu_reset_base;
 	unsigned int cur_hartid = current_hartid();
+	unsigned int us;
 
 	cpu_reset_base =
 		(unsigned int *)(unsigned long)k1_cpu_wakeup_reg[cur_hartid];
 
 	writel(1 << mpidr, cpu_reset_base);
+
+	/* Wait for the PMU to take the request: a new write would replace it */
+	for (us = 0; us < SPACEMIT_K1_WAKEUP_TIMEOUT_US; us++) {
+		if (!(readl(cpu_reset_base) & (1 << mpidr)))
+			return 0;
+		sbi_timer_udelay(1);
+	}
+
+	return SBI_ETIMEDOUT;
 }
 
 static void spacemit_k1_assert_cpu(void)
@@ -78,9 +91,8 @@ static void spacemit_k1_deassert_cpu(unsigned int hartid)
 static int spacemit_k1_hart_start(unsigned int hartid, unsigned long saddr)
 {
 	spacemit_k1_deassert_cpu(hartid);
-	spacemit_k1_wakeup_cpu(hartid);
 
-	return 0;
+	return spacemit_k1_wakeup_cpu(hartid);
 }
 
 /*
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
