Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D9FC61DCB
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uclPAWhZ8hoUCvKbBh9E25O4bCgdhiQ1RxGrH2FytA0=; b=oqUMWyGSXOvAU1
	AjpTugInQzKcLEArj1yZVcPW8WIWmTWu7BEBrIqgFNENTvRvGPNCC2Pq8rIFJZKT5uYgBFuuK+AY6
	mlp+oWQHxA2ujhGOi0TsVhj+19Sxb6yoRRV2YM+Mie4Zcdty+nlBouaU0kOxrlIYv8CYgKQ4OC0CX
	BZ0NUsE6/fO9bXmVViAY1awLb1sH51j5lyOKBgleJx2uVUsY80mA4/+lofDJC0yveJXDzqeoy6amc
	FixuzGMxV5OYl8cJRKEwG3ftbzM9Zyt+4jGY4J1bZpw94Z4uk33FZJi/lIrZqqnYTnYqRgT0qeUPa
	6XPYh+ByDlPpUNmhN8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHi-00000003jEk-36te;
	Thu, 27 Aug 2026 09:20:34 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWHg-00000003j9j-0TWX
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 09:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787822394;
	bh=NQ8ZpCQCkawJpw387kJiozla274KmChfA8c0DFepuzc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=rZSIWxBc69PH8ozQPaX8irH/WquMTewXIja7Ns6BbKyr4RkEKWqP4DvQBKVtePIfy
	 hpxkDEE+f+Ce1TJZhL3SWGjplhTVzhZBAhNcDJG3MaZJXppOLkAVCgGdk2G3vlJe86
	 qnnhIJN0c0G9vZkBBExOsStTp0IhhKvs0RDqxIt8=
X-QQ-mid: zesmtpgz9t1787822389tb0f877f0
X-QQ-Originating-IP: xFkEMdyi44h8NNyRJzc5ewI5fnXOiIY/mySFW3JuEqs=
Received: from = ( [183.48.244.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 17:19:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6630494701391274169
EX-QQ-RecipientCnt: 7
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 27 Aug 2026 17:19:20 +0800
Subject: [PATCH v3 2/5] platform: generic: spacemit: k1: rename cache flush
 operation
MIME-Version: 1.0
Message-Id: <20260827-spacemit-k3-v3-2-5d8dbb68539d@linux.spacemit.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
In-Reply-To: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=KKnxI5IvZqgL1LXOJO7MwhdWO7ZF545ykdO4TY3wRTk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkTGJX8Z+xWYpcLtdC1kn6a65kRKJLRfFRlsdwfl/etq
 StP/97UUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBGzu4wMOxrn33qSmzmrZdkS
 14vL92YX3GurbOza8MrlyIRzO0J3bGb4H6dzXumZv/bsnEfZrW+yl9ins55ymRmxRNMpLWGP/EI
 VLgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NBq/fWjOSzI9T45ao2WH2Rwq1tMIWOWEfXbrVGqEas9ztQbS+iuoIUUn
	xPe1mvge5UN0VEHRvgpIM6fmkw7tL7urEYM2ExZ/s9+5l76Ve926K2mp2ETx/BpX4Jgt/wi
	c/KrdBn1xz5J3XveNYWkWzEQ69PZC4FwJzNnV7MH78WrHLIfB4QN8q/wpphvr4NRBAMzwBU
	kp0gwh5kHsZdbDfDa+hR0OPKGbnniugeoMfEVesJVH702ntkLU3HvyJ2+cAJwuGlSC/dGmV
	RbUIaJydKjSm1P3fee1h5Nby3+CAmPDZIHCsLoZ6xLyD+paxtHsQiMidMgQvv9eUkTkwgMK
	22V0QRXFNo66CV0IVikQHlXxBUQXK2Nutsg8SkknQlvgq8ke1HoNURrzC8XI3E1tqN00fm7
	iz1M8VyxqPjeQ9ex3/fq35PR8JVvwkf8/+bs32nEdStdR/LyT1EasdD8A+SQa6IVdISlxVU
	H/y1lz2VLPAhCS0HrCzcc3yCvsIW66JNLJNkTlOJW3Ko7m4Wkdvl2SfD/5eReP/ZNtd1jUN
	7JeFNBZYUbyEWk6bf33ozParWku1lilKuzKEuSlVPhk6fStR4t92FIF7RG/HppBTQPEfnfC
	PNwNU5WYcUtKGuBs2Kqmi4hnqfsautHMbbRJAif26o5qSNS9rk//EijmCKp2vMHRO/EdCTr
	2eqm60WljXwq4rDIvRhwg1RoA3K0lNyPsBu/S6dK9B8vqd5SsJkPgrgDnS29HItZTlhmrfV
	70Hemf1vivw6gsXELabpaIiGTKPpw8RvGZkj0jbE8OSQn/7p42LQgozY8EImELnreOAt1d4
	zg8NCx5aBNqpRW2KANjSv6WPiwZzHfp0SPsOr+8goAWeOmLtJGcewpzOWMMW15QRPD1XFqX
	o+OM8UAqY9DKqBZek7Devqnem6yyaErCJdkjx6CTiGFjazKyHT9GPiHY/7j0iLl4cY/Yqje
	aECF5vbgy+sF8GK3BUu2yrsKM2OvyUinmKLynw+YqKrPjJ8oq3oCHTnt5gP1lHj8O2NBkET
	uz2v4BtD6bdzNJcTUhMTCaMbYQgw6emcCCCKFzKSpGNEXBeLlusajB1p1phCP+qphCT0e14
	wWsxZohLFtr7Y7x7f3B3aceKKAgMVKYmZ/etL3LVeQr/z6XIpiix5A=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_022032_580396_006A04E4 
X-CRM114-Status: UNSURE (   8.97  )
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
