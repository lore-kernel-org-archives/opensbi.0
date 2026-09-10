Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F6DC79FB9
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uclPAWhZ8hoUCvKbBh9E25O4bCgdhiQ1RxGrH2FytA0=; b=mpVf0ZDRCtWhlP
	CpPJ+l9ej71E0x5mmM7uRRFvwOzTMSqjVmoOs3/JmZFON4xrNZ8Ncta08fCqJ0gRYB6yt3lvH3YqN
	X04rh9/8nOeXCGBGJ3thKX35DJNnAddgHrAbUMQtxbLKAhRza4Bs/ciYbCTRxWzPLzzuQSviFUf33
	nukCpX0KWXrVwUUPb95M671SBtSDlSOvTMSIdcL7R0sR/Tp0Lm64D2SsQhGz/Fnfjjv63zjOIZ0Ld
	4slIBMXnQ5KMBfzHjRuotK5aygHfKr1sVFwmNlntEL7HDBLyIai1NRlgrj+OBddlz5m7QBo8S/+Pa
	NzHPfHbd0RddkMR7S+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fLx-0000000EXyi-2JRb;
	Thu, 10 Sep 2026 14:02:13 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fLu-0000000EXx2-0zrf
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789048897;
	bh=NQ8ZpCQCkawJpw387kJiozla274KmChfA8c0DFepuzc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=HL9BiL+/DA689skVxSIxlosDIroM/F9UHGGZTHKVNG7XB+1LvoTmqVZ5ngvNkmhtw
	 Od9Ej0hzbSbuJvlBdKApSEHwYTrW/+AWzvaHLj2oisufbDiV/pGrBr8x31iw2Ij4o5
	 Dd+BTc2JECYl/CxsZ26ZvjCfw/wxAJLi2UbBk0eA=
X-QQ-mid: zesmtpgz7t1789048892t550eb61a
X-QQ-Originating-IP: eRWWPyRvYHfanGvrvk22RZQ2QTgNn5jGmtmL4eQzUZo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 22:01:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1762725510116280717
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 10 Sep 2026 22:00:03 +0800
Subject: [PATCH v4 2/6] platform: generic: spacemit: k1: rename cache flush
 operation
MIME-Version: 1.0
Message-Id: <20260910-spacemit-k3-v4-2-0793b62329f6@linux.spacemit.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
In-Reply-To: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=KKnxI5IvZqgL1LXOJO7MwhdWO7ZF545ykdO4TY3wRTk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmLdmiVaMu8Xan7NLpnptX/iONLc+1iQxiE4lgZE545T
 BRNkInvKGVhEONikBVTZOl+wLOtwCfKtkCg0BdmDisTyBAGLk4BmEiNP8P/infiJ4Mqgj29vW/a
 PW8O3Cy79YoRl2uKw1Qp0c0sE0p+Mvx3itzsobSg2d/bOGeHycF6O3+3jOjnH1IP/LAJrYot2sM
 CAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NXoX7Q9UnYs4wK09vvfanvzgIBwJ0r9W4r9Kna71LkwuDmkLDg+P68Yf
	TXO7ay7L6ax1kU7LN7eR81NPCdIjgFY98lH8YPEKupB2EU2XBOzITrrGLqfLJGBxdvhuF9f
	xE3j0HDRcp9orP6aXq3wJAU6KcvK7FI9ASOnt3m08XAshPWtUKjEaSEGinBmxNSGBRwITHX
	I77AL+m33ofEPbAqdKG50xZJvPZmFHvX85eJyCoU/LAPnj+B5TZ9Kl5/ceed4NsG0vKAiTL
	Xzo6OudNtzzTUUffOPtoFEihkkqaY+r3jU7Sot7gUUE4PKScZRrqP8YjLoyCd34rL2+extr
	6MiX23ymXuJ9lUH07SI5hAPm310HJ8sgvb1LBk+DuCGTsBRqBoNBzkXrTSvPEI1P+fhKsor
	klUlCU/mPVgpo2bKLcFLI82ru5JXg+8voVmPNP4iPlffF5ZFVRatsDqopWcQV0ptjCwyiM+
	g/s/aA0o5DpjjPa19aJj116924kbW8ealwjrp5YPz/iAXUyVvex7aVZQVKpx06lXh47mU/5
	75H4sPjKzE9YsGNm5vxrqC2ZfAmImWxa1dhDLJtAImbdwT4pePHzo5lSgTC7idmHhx6MfhQ
	NCty+GEYDVTmtcRmcCiN/nuLVtEfR5PiyTfau9oi8kEdsAg/6nATGnOO7rwTt9bzCgjvIvS
	EBpOAZ3FM0dYwEOvn/0O9hKwM+VOmT2AM+r9Xe7DZtrraf6CcJXeX0JLXM4bLW86y5A+YOZ
	ZKbxwy0qokxBIMK9iGev/SLPEBkI+y5XzLZjyVtobDKjwqXLmNqJsAchsisLB3wRkYqwQVi
	ejZw5ximK3DXfsFyv7G1tQb4PoMmmCdodrKfAmv2elU+eg0BCF2YhiADWYx1MZELAQyWrVy
	Eg6veVVhQhIig9NBlTsK7DUzAdlTTWP8VrnvC1eCJmqOBRtykGB5G2N0rH5iLzT5cYM2bYT
	ibQJdWe4cxK4T6ScatQm9Ebc8bq8ioY0H8+siBwUGkuUJMtglq3aS+HKxFUe3CIf+IzxZ1Q
	mwhYzbcHEA38nm5RePEXa+VaTXOOkgLBJfos3o+jmdoUT3pYQj5c4dF2xpKgRvHtqcTqBIp
	c0zaYucFmjyRS5oUAuYcDzwY93fbu9VVs7QzRsmkkwpsj4xq6+05ne1jGbx6YflJAreKlJG
	4vV9c9L9s93Kg1uQ+Mvj0j/4sA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_070211_192783_6845D2A2 
X-CRM114-Status: UNSURE (   8.99  )
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
