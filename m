Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B4FC5DF74
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 01:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uclPAWhZ8hoUCvKbBh9E25O4bCgdhiQ1RxGrH2FytA0=; b=hVo6rw833R6vLk
	iPifKHWH8c/TDSH1n5PsWrvB3scsZ7uGRtSYana1VhWYUWOLDamBek0md6j23b3oKPeqBicgka7YQ
	OtiOIiABOvxVVDpJ02+uDo8ZU09Mt9yin0Kx6V5fmQhbny5rzwt+poJlTknwczlT38vGo/pok1V6k
	4bg8Dq8HKDNEMpT+WTd6griCJwCNDAeEz6LEUhsqbtg+KbnzA9Rj4xmddEHpLMOir1gHgTbNDoRRR
	5cqvI8Pl6FpiwXAx4kB5pfS3Ivy+I0nrdyU45YpH9rdLWneG0uWcIZ15OjbBMKq8/K2fjXGV/GtFQ
	/Ud2EYLk5zTmLggmi5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pn-000000072ho-0u4G;
	Tue, 18 Aug 2026 01:14:55 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pk-000000072fv-2GcN
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 01:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787015667;
	bh=NQ8ZpCQCkawJpw387kJiozla274KmChfA8c0DFepuzc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=lFlPsZmp0R9lNjNPu6jOwG1F+5bnYVzExV4GSaxfW/DNO7Y1CYPNvjCCUCSTLCMr7
	 zjpgU7G8nSoaWY2O9H4GQjNrX32rw1dShH8EaskuLiFobDCbNbhkDkwlzGYP6eMuNA
	 Kx1cyhRHDzAaGfhsuX7NIVvMzeEvsoMPlTPS43yg=
X-QQ-mid: zesmtpsz4t1787015666td52ff2b6
X-QQ-Originating-IP: b09atUt1xawx2f2oEeui+SOULHCDB+RJWnKw9dwB2Q0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 09:14:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12449527478323028731
EX-QQ-RecipientCnt: 5
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Aug 2026 09:14:05 +0800
Subject: [PATCH v2 2/5] platform: generic: spacemit: k1: rename cache flush
 operation
MIME-Version: 1.0
Message-Id: <20260818-spacemit-k3-v2-2-84cb7773a481@linux.spacemit.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
In-Reply-To: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=KKnxI5IvZqgL1LXOJO7MwhdWO7ZF545ykdO4TY3wRTk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnNGx9NrTh497xR2XQ9lfdZeleTPz+MKClnrt+64ZGaX
 dliVYfcjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIl8kGBkWKqard2fui522rnJ
 t9furuvK0jRp/eNy/ZywfU3+7xVWfgz/HX//LHt1Y7bxnI7XTw5VrOh/2bPz141rSUvFTDh3rV5
 /mAsA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MVl+CvPS0+rmkU9XzLBVMqyrLuQ9WqaYzoNluYRN2KpJlcveqkwsdyfb
	2bkzPUfp9jMIiQoC9rYH5m3SPfWTOGGqKdJefW//QEBJCoBGhOF7MYgjyQnKCfYmyKg4Y04
	d7RPqdcUahl0pI8xeKiYxDc/QZaJkwYyFOvcAJ4qj1j89yDRLSDKnOmGW8vfLwu7y9bq/bB
	+AQcgXgMSoD8aOPhvASwOayBVB/naNOIDxzyTyqfV5efpQj+e+eL7D595ShYr7Vbec6Kzs/
	BKFiCp6LIlX4Ozk2BVSE6MhtGKJtGHVQUP/EvhWBKcAMVm5zJvGIhZqli8CFetZ/eZXfAIs
	nxYg+fDQfTgVXY6GnKuwXV20/on97BOwQE08MlNBKygp803MR7enjWPc9xLUlsgRsqw1aao
	lrwCqCfjdnNR8Pfo+HygAZe0RxwF9/hVamiHBkqQ1ALHoVOted9gDpkwO3NSkyZ/Ja5hhN6
	2i+QRQW0bK8tJERIDtnzn/PeixtJrLv7gamnjV4cOfk0hxzcwhAODfPmoiS4lZeIQF7NJay
	ErdLoWMNzQsO2AOA5EvhGq/zWXXOyCtnhfiXfVZ4o3R11VpOHy3MOIz8mR30qiREdbbDlso
	iuFO/YfajvXAxGIGhBQix74k/kSNFngw4vBED7wXyvyIgPTUwknhpjXCECfV83McrY3C1GK
	M4NXjd602TH57fV3GCsuNTeFKBh0fv9ogdHYphNkpKaz4vFFaqUS+QBG17G/COtYiEQQuc8
	ACyVxpEeHYWuSJfeDaWyXgZmgBn/qlkmCZucfFkuZqctrRYa3yI1RDTNlRR3+1n9VfGRCo0
	/WmitqFWE8tRnEnOeZIUb4jS9LUvw/HhW9hyblHRAZ5mAuYUjGhrElYRJ/cfkhWHxsOD5LA
	Q97MtTIXYC9UuO8nW9FmV0atK7WmGlee+Hh3V2wQVYXun4re5s/eDYmMgU7UJoseviQ9Cwy
	F6WwX1CcCNL5Qvp4gqLLg+jJImMCGx91ZEPs4BkgOJxOf5/Yl6111aXXiEMS5XeRKKzPJoN
	nJh2JAkao2WnpRLbL4PN0kKK9sa5rsRlMHUG/e7kRqe5AyBjLjY2DTAym+7KWounwccN5Tn
	I9Qa+nSrHybf2MD9HdTQGeGKnSOQH72Ep/4beCvWBbtOZZRYKWEIQc=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_181453_082425_B9807742 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>

MRAOP_ICACHE_INVALID is used to flush the local D-cache before a hart
stops, so the name incorrectly describes I-cache invalidation. Rename
it to MRAOP_CACHE_FLUSH without changing its encoded value.

Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Co-developed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 lib/utils/hsm/fdt_hsm_spacemit.c       | 2 +-
 platform/generic/include/spacemit/k1.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/utils/hsm/fdt_hsm_spacemit.c b/lib/utils/hsm/fdt_hsm_spacemit.c
index 868e49bf..99c52335 100644
--- a/lib/utils/hsm/fdt_hsm_spacemit.c
+++ b/lib/utils/hsm/fdt_hsm_spacemit.c
@@ -92,7 +92,7 @@ static int spacemit_hart_stop(void)
 	asm volatile ("fence iorw, iorw");
 
 	/* flush local dcache */
-	csr_write(CSR_MRAOP, MRAOP_ICACHE_INVALID);
+	csr_write(CSR_MRAOP, MRAOP_CACHE_FLUSH);
 	asm volatile ("fence iorw, iorw");
 
 	/* disable dcache */
diff --git a/platform/generic/include/spacemit/k1.h b/platform/generic/include/spacemit/k1.h
index 7095bc08..ac727b04 100644
--- a/platform/generic/include/spacemit/k1.h
+++ b/platform/generic/include/spacemit/k1.h
@@ -20,8 +20,8 @@
 /* ECC enable */
 #define MSETUP_ECCE				BIT(16)
 
-/* icache invalidation */
-#define MRAOP_ICACHE_INVALID			GENMASK(1, 0)
+/* cache flush */
+#define MRAOP_CACHE_FLUSH			GENMASK(1, 0)
 
 #define PMU_AP_BASE				0xd4282800
 

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
