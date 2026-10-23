Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512B606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fmHrO+oS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KOTh/2hk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D08i00tqOgYUvyIRCGfVnoxScBcILrh85cv5wIK1KJ8=; b=fmHrO+oSmfeh/E7CJIQITXeS/e
	Vj6oMVas/uwXI5OshBMxdikfg8t3Lz974QK5odV6NGCy2jF56E9+votF2FZq7EzmkaUKRUZk7FLwV
	p0eaEHNcTXWWeNlLSpAP7YQMJcM5IQEW/FoTRyC9iXXRQcXlOlsLCb4GT/1ckr1zkEu4LViK6Pv0o
	MjqV9i1F/XM9stjCQb2cVYHO9XSH62sgoZmwq+etfPU9bVrMfeYEl95hcnNkzaDNeK8lSSDtqv2dz
	R2tyI9mzJ4u07tP/YrovbjVPhFAipsCQJvV/ExbMr3T625NOhjFPc7jd8prTlzYtXfQONiF//a6hr
	C8B7ABPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6ES-0000000FRbN-0Ajb;
	Fri, 23 Oct 2026 03:46:16 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6EO-0000000FRa6-2AEq
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792727107;
	bh=bvCfKNH5l4UI5MUWwIY2/JfBa2vEKkV28T0CwjWNPRc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=KOTh/2hkHj4xdISxHAH6XTHsyZNN2LHh7vGfacEB8hL4EMtj8hW91zacaf0F2LX1j
	 HNRfbC5Sc/DnmxqTP4EUY9GWfWk/QpUW9wy9IFLs+7YYzIYAZfdZshiUT8BJY4BN8p
	 1N8tH7saN6zjpTVyedM/PqaQza8ytSIjMn/CYut4=
X-QQ-mid: zesmtpgz4t1792727103t7258650a
X-QQ-Originating-IP: GDGkhjxAxEBjlAJSXlO5LcH0j1nBTzOmauE89TqMs7A=
Received: from = ( [183.48.246.89])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:45:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7317693929660469112
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 23 Oct 2026 11:44:42 +0800
Subject: [PATCH v5 2/6] platform: generic: spacemit: k1: rename cache flush
 operation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-spacemit-k3-v5-2-c5ddfc72caa4@linux.spacemit.com>
References: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
In-Reply-To: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 E Shattow <e@freeshell.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=91n/Hs9CYTGAuXcCvbACDGxu7KbMG20wtd7LBIf4XWs=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFm3buhI3i7M2V+z6pb31XXN7Gt/ubk9u264/HoOz4aob
 +kdp7YEdpSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAExkHicjw41VSR67i5dofbGe
 vp2/aaWg07rsqx4dR7W/bZmRFCRuepyRYV7HT39T1jV6b7+dk4rv97h+7mmzgRPLvpqEa7ek56/
 w4wYA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MrxzxuB8TPptYJCGWS4Axnh/RrYaYEGAGeeWlj9lSnY5I2/td85L4yra
	0lpQL7L+M0nxCCBiC+0hi77uP9DTwrO2rISM4R6GL1GqeFsaOLLzSEN7H+o3KrK38wEberN
	OfRLNkakauXUgkxnj9I2ypXZ0DdYmxMXwQBVwtls//t9f5DHeM+KzOfc+RUVYfF8rpcVVJ1
	u6iNnzRI4iAMWXquGcr1ALM8JXIIQMhNGpi/OafN6uSW+jk4NNicOzzvevfvuyBYy3Q1X3Y
	elSf2jZiV+cvYJ3OVP8tMjGoOYJvmLE7F0rB6kTr8NdhU4V/pwtRAjIc1WeCaGp5sUEn+74
	I0iil2r8KpxAWyyVfrVUHTeUcQZMwRjRMudijxCP5DvAWOEgCK3nzvAsttQyJIFh4psIlRS
	tGgIidDkDH2OCRf5vpRNxXhNfWcmDg6jwwi+K43LVlHq9jhDYiFUYy7B1EULnaI99sqOW+n
	BxTaRZ/XZpTGYFUTv0SV1NaGj8xfDFIRTcUEB8Nxohg7J+8joNLRSoCeedS/HLof6dWSzaf
	Gu8sJVZJ3PF+BG6B4e41HAJZrcuM6U3jmDMoP75vl3rW2xQSrrKZpJuhtIsYhoOwL3tWgHk
	InHBs5bHYSiW0xAV6mnehFsQcopyYWqYo3UyqMJSQBfvY3UJeRmuaEjDyGLzg/2rvgUgc0j
	m13r3AKWa2+IdyT2JakCjeDZ6X4olJgqoIkmTYRekpJubADYm2wRiyPMl3uoxSBri0XyG4j
	g4wVdFV0pwzaavHNSzZUpfy5hd6dKn8TuXRAP0V4rKZZrXpkUuax4R/5L153GvjpT/OQc4B
	357wnRNOu6SaQNjrvZlYZ4BfgzkPYBtozAa51b9ReEDV/Kmy3pQxAN12fNDjqrVNJNONnY6
	DxGzV6StdyuXYH0olTckOlxLBX5gcuzBE0ijxBmIEtsaJqP70G30BLfzdSGwZF5Jef70Nk/
	ld/gwyQqGRnqnToULMfAEd8McGy4D4YLj4qtdNbcORTi6PxDcsnh0iz5dtxfAPJr//K00uu
	ijrPzyBovpDDpSSVD/vSwTHi5E8RD5IiUhze1hRwozDp32hLyITYN3F2Gw+bTm95cPTMBe7
	eNeOxmXX7CEc3/MrD0DC/Mxe/H3uj0vS1U9u/12sfLzoXZ0k+mAdzKs4/9boOjxg+9hvDZE
	on5XmvAay2aryRCuU0ZCdK6r731K18PtQJCe3m0bzf3sGBE=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_204612_876604_A2E07EAD 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>

MRAOP_ICACHE_INVALID is used to flush the local D-cache before a hart
stops, so the name incorrectly describes I-cache invalidation. Rename
it to MRAOP_CACHE_FLUSH without changing its encoded value.

Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Reviewed-by: E Shattow <e@freeshell.de>
Co-developed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 lib/utils/hsm/fdt_hsm_spacemit.c       | 2 +-
 platform/generic/include/spacemit/k1.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

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
index 7095bc08..8d4f5344 100644
--- a/platform/generic/include/spacemit/k1.h
+++ b/platform/generic/include/spacemit/k1.h
@@ -20,8 +20,7 @@
 /* ECC enable */
 #define MSETUP_ECCE				BIT(16)
 
-/* icache invalidation */
-#define MRAOP_ICACHE_INVALID			GENMASK(1, 0)
+#define MRAOP_CACHE_FLUSH			GENMASK(1, 0)
 
 #define PMU_AP_BASE				0xd4282800
 

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
