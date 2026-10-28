Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECE6606A31D
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Opzokf1r;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=eVCASUrJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D08i00tqOgYUvyIRCGfVnoxScBcILrh85cv5wIK1KJ8=; b=Opzokf1rAfFpipJjuaaLe8VvHi
	Vyl675/2uSvKYy37iKNkoR/Zwujft5URMVEWkpKa1lUy3g8k8RyPN7IOI2nLwD4pqq+bcGjB/2Oga
	qkY0wdqdDWJjyUF2pZEsFqx5nQB5KiTgAwkdsB/4XYUq3zMdLqgXaOVw2hVHcQuqXsyvVNZVFrBkC
	TmNw5dxS3fXCoaWlDOOiOgiMOaarcCodXunxJWUIWRZ41aHweDTN3+Pm5zkKwCoGjG9ybMOUgnzIY
	JyQOE7Py/Cuavtmmi8HCdlbTnYZQaqjwXUxxhQKohP60qrRBLYt2yJT1hlSJVRCn1cP5OW9O2X4IS
	x2SrKgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Dn-00000006zfG-1kHs;
	Wed, 28 Oct 2026 12:57:39 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Dg-00000006zcR-3ldi
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 12:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793192196;
	bh=bvCfKNH5l4UI5MUWwIY2/JfBa2vEKkV28T0CwjWNPRc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=eVCASUrJokbXJdjYLSp900ozK3yHAnXRrKYPVC4BYQrHnEBiC6Zo3fh0Rz9m0CgoC
	 mpdBepp+OgMgxhTKB6rZ5II7SnH1oqtc8HQS0sanVohSQghdJkpDqYq9RtBL/lWRQq
	 trlVUBhu3dWCYVNb47C9O9Wa+/UkKJvZVxqxTcOU=
X-QQ-mid: esmtpgz11t1793192195ta58290f7
X-QQ-Originating-IP: /hqjzrZiee/wzrwaeo9zCkilK39JnPDzvrzPpzUChvQ=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Oct 2026 20:56:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4451687473773340268
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 28 Oct 2026 20:56:05 +0800
Subject: [PATCH v6 2/6] platform: generic: spacemit: k1: rename cache flush
 operation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261028-spacemit-k3-v6-2-01d984f60941@linux.spacemit.com>
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
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
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkPP3w4qLPi5LP70aLfPNL831VufVizqnZPhZU3d4m58
 8rO/dzqHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABMJvcTwk3Ha3LPXMp+vD571
 6P8ynYuTuyTKD1xduMzW44eMwTST2C5GhonH9KaxXOPeF3aS1TZxgsh/ea+7V37ti5z37dykmbm
 HJ/MDAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MqOOKpgvgHgnj7IEksj2HIdKVgivQeOFucFjl6ZyCeks2WCP1NPo4kjU
	8r4L1+KsGJcy8gmi0YVT50bJ4MMzKRjWwpj1ltq7UmncnncUl+G5GVg5Df2iLXdsMDKKMD6
	PEDjaXZEVezkTVP1BgMxess+nW2kal2BqF6zgk01LTElhc4X6xzXBN7L2ATR05BRSdjhKZB
	KxO5Exn/Emo7SzZxhP9+v0Md4Cf3wbEKU6JBipEb+nnXvnbW19aE1wRp6j0DBTSStuPnx2B
	F6w9noKAzfufyShwqOzB0AvnIkmTOykhOXGd05RB3+99TdCIvXoonHTo3ygKI32IlUomFut
	a6uZuj3ViSy/bkoBC7GeClfJgVNEuHlNDI7USVEfs+lcglFb7g/a15LaUpYnAqRux7zaXIW
	nocBO2Y9G4GAz7ZzfxAvzWow8TDVC27/OtiVQUs3r2TIO4p5nvfQ1yWTGajLsmL9CbE0vTR
	2OQS7wLixUDnkzaCx/dyHHCs9lNIyK3LB5aQS1qH0IMDc4z2Af1T/iJ01H0K/q+75CcJNN6
	eqfh70x0TFQOYa7BMdk58dCVxbVsWuOw8YNiWI0Bu3AoJYYCxRO6/IMPsf0JZZ9L0RRDBCf
	GEbXOHtIFrAze97NGyDiKp+MGAq3VWpA6aqH/3NhEWnrBQCltNPs3xOvc0C22km/PX/8Wzl
	aSBJNGOkYN1WXohoY6mW2OyUw7q7fdDT0Yh/ieI8BJ9DREZbCoY0kQ4+fmUyHsHCH7Gcu8e
	hMIHE6eF03nstMgy5uZjuTenl+iJDUKzAZOLgmZVPfc75ykeQWgmn7ncmFDy1WrNmpdSRcH
	Rm8LupVwXUPODX9L6MP4eOU4i2A7befYJhseglwV9p6W9pf/oE4maQN5EFh7v/eHG+7XA63
	I3aKb8k1Bi/9vySItULDTzarsDgz+NrGmxGuCDDr9uUELmIsE+jnvxjq62sEkTaIwtaTGZr
	HrKjHKsU2lHuy4US7Cv952KKoZ4tDkN6DOI7rjjT4f6ydT8B6FWRainzHv0TU+grQMUHj2z
	R7dokU2BlVIVIFSf2iB3BJeKg1866aeMMtlt+NkH1LqecnQTEY4XZaXF1d1+dum/ee8iNKI
	mbkt1yuY6hOAS1quKsiBVyN/oz5faCpWVTG5ewJ/xEmpMxYlV/pkv/UPb3MaBHMEYFB0/rq
	pZht
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_055733_439104_ACC21B34 
X-CRM114-Status: UNSURE (   8.61  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
