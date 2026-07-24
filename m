Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC25C531F9
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uclPAWhZ8hoUCvKbBh9E25O4bCgdhiQ1RxGrH2FytA0=; b=RM78IIwiAC70zR
	oo4EnHEWueTn1wj37Y+igVceu4J89uZoz/lp/u79PvUZJ8yxDNqNtkxZ8PqO6zp2p3wjF/xgalUjC
	1yIAHYbPF6xjZR/IxRdqYB7edpS3y0yWl267QIEoRNuShNyJ9gJGLInfVaZKltZxi3vbKxaXQj3yW
	YPA+cxWXl09F6xM9uBu2WQqY0AEKQc/s+uoRrVhV3nFYBhUo/565CMBrryxQ49QPzCxoWluURUE2/
	AaFVzN3YZUIx+RLmiOnYeLF8cU2L2wFX7iM0tRcBf6q4uBCQ3Qtec83Ky8QIHjEqHqdnr7SqT8ZkZ
	XlSXiRzespMphKORGeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCBy-0000000FxjG-2kUv;
	Fri, 24 Jul 2026 09:27:42 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCBu-0000000FxgW-3l9u
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 09:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784885241;
	bh=NQ8ZpCQCkawJpw387kJiozla274KmChfA8c0DFepuzc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=pCYm1pAPvRgH84XByGiQycNe1uYFPZ7wRlYgJxj2ismBIJdcb1E163i8ZOGIBqLpa
	 5B/69xX5V1Mib1ZPN84m73zUSgcQVDA/9i/sjaHJlF0Bpzs/RpR4kWIkt6YK6IZPlv
	 7J1QIlWLx/2ue/0Yi3Mc+IcUY5Bqy6KoaNpqwj48=
X-QQ-mid: esmtpgz11t1784885236t5fc4c1e9
X-QQ-Originating-IP: 6LXlwmvKwVO14EYVGyDyLeoGfX37dklHOQKvTMdqTdw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Jul 2026 17:27:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3947165837024207464
EX-QQ-RecipientCnt: 4
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 24 Jul 2026 02:27:01 -0700
Subject: [PATCH 1/3] platform: generic: spacemit: k1: rename cache flush
 operation
MIME-Version: 1.0
Message-Id: <20260724-spacemit-k3-v1-1-f0e49329feb8@linux.spacemit.com>
References: <20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com>
In-Reply-To: <20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=KKnxI5IvZqgL1LXOJO7MwhdWO7ZF545ykdO4TY3wRTk=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGpjL+qi2NfNw46E4I4Zy1ZpMHErc9uPhvQ6rqfuIlbaUyaVH
 Yh1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmpjL+oACgkQmAnvgPkzNC80GwEAlEJf
 n3GoEA3wt4uxm8CJNDM3GuvHK9xfeCPonqCJuuQA/01yxjYZZ5Q/K89WgpZLVydcFY/6VofRvr6
 xx2PBFEAD
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MMnP0fEUKo/hF0lVVy9iS96NsHKGTq01b9Ma/C14GpYc8d3GIQvCK5Fx
	rHBzMLSvHzoKJXiosDS8YewfnZiSlE4giBYM0yPdph8HmJrboPla4HPTrciAlPwzuyOFTmH
	PaPECT+f3xsSoWmQX0kYBGHgdZaGdqSaXSnFTxwr4MHjvBs7L/hGd/Z7yj3ipztOq8DRWPZ
	mhWbgCPUJyTepb+vj0vGj0Abq08vaXop/nPH2AFRdjOwMadE2rOQSGGAmKoZLrPIsh93RZt
	+KR/OQezlL8ZmD56onJsJXesarQvi6gLJG6lQcWcFQlaB0sLmSWt5EcCnUltf3wO10TQInH
	gEjLE2lq65oMlM0MSxoIxaujIVRYu0j5veQyDVkc+8GsCenTUcFWZdAbvnfd4tuFBiAsIXF
	aDVlovO96O88q1eIhaMEydnMexz2aS3DLssBU0z7ngqXX6hQeyzKhF7iB9wZu1QJND5sVqD
	IoKnV09BWr69me7lRbpFVuvLAgvNq1PyjVrlkdmlEI/Pj1f10j3rL0DaxnnXsW+vosYbceR
	qf95YZlAr1wu1c85c5mnYU8gLGuLBuSLBgXf0ADZyR8W6v20cH0rDGd7oVgh+ATw0AqqBZv
	6ugUoquVM0bIzIAuRVFsRWtMmL2pxyepERAP+84fq/xNNAgRfl0+KL/1a8anqfJidNreiGb
	WEJ192K+axF9e1hkrrLULmLzUnmiSHK2dGBf9IPWTjUiJmSXmAIt46cXVmnXF0US0BZGYN6
	apL5VLzY6eFBgS1nR4z85+iPfmE+LAXz+MpzutYCkmUlriXhhoDlSOPKHOwezWaCN9MwD7l
	Nzus+CCBnrfoLmmNPelUII9wEFLeNcixf+oAhpvQJW9E4Ncc6Vd53zyaW9HKbQ1u265Vygz
	M7GqZeQHDnIv5HUs5mmbwa+pC+exaFrNrT+LyRdukjKZKI9F4HJygK5vj0X3Qic8MdhK42I
	ZAoxfb3/IlJDu7YyP525+gE+obzUa33nexetpOSWUkESXpBjeJUivyLr2epNZHchrcpinHP
	rmtSMSNYqkqMNqwLyO0h6Hx8I7XbgSDwQZxEbs+EvchasVzZg4ijpCOkb2y3hm/LvvWb77F
	Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_022739_909090_BC5421C2 
X-CRM114-Status: UNSURE (   8.60  )
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
