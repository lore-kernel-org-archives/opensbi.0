Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B740C606A334
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 13:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DmwU0qfI;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tyzPN9Gm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ZFD88+4zOlJPm5UUAY8iBikqoNDKtk4Rd/jK1VCRKo=; b=DmwU0qfIB4CLU1gsUCkcaXyH7y
	9P5SvbAVveVRfHMA+F2C7XQrRZcq8PWX3TMuSmMUHfnIuacOCbff69/AncXUU94/XeSz38nxPn7mT
	LUaHlswL/6dDPTi56DHOhcxKXrKn0iLuurDk+Rz/7d9NgWsPShqbr45Uhgq2QvrS2S8h40XiUMll3
	WdlR0Xkx1sCOTM+MRs2SiUBFDgbRN4LMZBKbjtD7qFSolIamQ83LNECEs+IY72CnV7+LlrLAtuNxd
	C4T3DrVd9d+TZ7dkStd/2vAdqlH0IAgOCWVM1bjmQkm9M9s5fBPIk3PbdAjwDUtyvE0uZSR/FIxTM
	lmJOEp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4AK-000000078fv-0NEK;
	Wed, 28 Oct 2026 13:58:08 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4AH-000000078dU-0fLs
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 13:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793195840;
	bh=r+gjaUkKDAszRWtH+24VoEOQL3HSE9kLpNTktpbBbJY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=tyzPN9GmxjwaaYXw+hHvT1XDioRXqTqUZ3cQfwWXz21ngPdhO5qRE9T7kkZoYrNHA
	 GFucs+WfqQRgICRsUbUgPtjmfDLOha1mHtJwFncKaE+GM3s7jfOhUEAJP+RGYA+V28
	 mEIlf+ZCPHmMq3TPZoZjgm+/KPoLnVFni1iaUo8c=
X-QQ-mid: zesmtpgz9t1793195834tb904ed5b
X-QQ-Originating-IP: 4DJjA3nVfU9AcFcU5lxB6GIQfJm6JOCCwEJ+1ijjAC0=
Received: from = ( [183.48.246.227])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Oct 2026 21:57:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17115873732341199429
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 28 Oct 2026 21:43:35 +0800
Subject: [PATCH v6 6/6] platform: generic: spacemit: k3: override
 cold_boot_allowed for hart 0 only
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261028-spacemit-k3-v6-6-01d984f60941@linux.spacemit.com>
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 E Shattow <e@freeshell.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=oVHBMm2u+CuQmpHfPbc2E7T0iW+kWHJ0IYkxBFADY1I=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkP/9hxz40UfGCduMkpYy2LZ2ZqTceeP5+Ud7lP1rq+6
 My9M5PLO0pZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACZio87IsNrb2kngOfcP1ZIJ
 /qKO8xYUTLM9lF78Tq655emmNuvXxxj+x6z4mbSJSULEN3/6S17hScVhlrOu/J8UbHD3j90fveJ
 5bAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nj5kRNzaiqTLvBxu0zo60D362a7odLPZDRE/D3zLFjsR31EUgivSMTmC
	Qqv0boHRM8KMlyRDmcgwzv5YBrXmYqSjyjjJOtgS0BQeBZ8GPMHg9FsyVb5nimscIQ5VHRH
	KLqTC+pbVWpSoQzFaG7f+IkHpIZRAVJWi7zOwoi0A0NS0Kwp0sRbWoi2LRar6Xq63HEIaZc
	y7Qf3+Q8Jfbrsl9W8JLWsqdX74PndGz5Gdfc5qilvGZq/muciXjtS0urc1rQDqDbF2gFdMK
	cpynL4BUCzPccJOOTXnwLYXSwbjQnYEWeH+ybPUQYOer0O4Oy7wSwN3BB8zHctworyb935R
	wHZBWgEIufPZywhjS9jWTQqEHKeXelTbPLyyBiQuD5RqM2dXTLAPhdDUJOuVnkzmeCDRLEd
	xTQZz/IFfiK24PrHw+k6c8uSEHE+E3BOfLEqMBXmLHm5yUpEF4UXgmNIyofumqUNCO2U1bH
	NKilRZ/n4Q/CvAM9F5gwF28WoTQa6QFo8SRqEEXHXtk+dslC+ufaVj1Hqpd0OqDMRyGbnax
	jXTDSc5f+5nOhwFXTly8V/TSMqUizJ0m5rMeR8I1jwsYIJM0sVhLDJJlUWe66nCTFgUDSAf
	blFE9EEaUnRHizhAXqU0MT45v13/R8oPAf+f6OZTtmES1qPg92hqmgwHR1wWYmedn4gBP7l
	UV0ubDlVHX4DpDjiuoW1R5i1Pdh3s1w+bgescHQhdxGccJWoBqFoQWW5i9Ak5RLcLIhlZUT
	mNIwa0sSqPBo9B5vCvNjfZ66QYfc7nszkyEn5vgWt3yViDzo36VAx+6/H6ZuOd9GtZtAzK8
	A073HhoikHUBFs32JEunXq14jEO8nW8kUnOGB8Fs0rl06JIZagjwXAFm/5G9nCdi/YqXp02
	KG6m2WtTnMr4CCj+kPgoVhVAa7tmSXAqUcmayOJPsYwQpBJOfCcCnsK0TZqosjRE5DTB0ma
	RLterRiOXUMcUufy/2MiZ/3OnX2t75g0KWqZaXP/tl0S5bAvAylABCFA8EauqQZLdIICSm9
	UWhjzwUcEhWOyRgtd+fBhwXeq6QZaMhO8EqYS5Dq+EyW+LZf17zlTGg/EXGykbUuyEJbgR4
	woBVvKkpIrinStQm+GYlR//lJK5WKEBBMapgFJroy/pV0gSZxtVhsnaBjmTmWQzSQ2eFIOR
	Kz/Z
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065805_691229_6AC5839D 
X-CRM114-Status: UNSURE (   7.36  )
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

From: Valentin Haudiquet <valentin.haudiquet@canonical.com>

Only hart 0 is powered at reset on K3; secondary harts are started later
through HSM. Restrict cold-boot eligibility to hart 0 instead of using
the generic DT-configured hart mask, matching K1.

Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 platform/generic/spacemit/k3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
index 967d09bf..7922ab11 100644
--- a/platform/generic/spacemit/k3.c
+++ b/platform/generic/spacemit/k3.c
@@ -102,11 +102,17 @@ static int spacemit_k3_early_init(bool cold_boot)
 	return generic_early_init(cold_boot);
 }
 
+static bool spacemit_k3_cold_boot_allowed(u32 hartid)
+{
+	return !hartid;
+}
+
 static int spacemit_k3_platform_init(const void *fdt, int nodeoff,
 				     const struct fdt_match *match)
 {
 	spacemit_k3_hart_init(current_hartid());
 	generic_platform_ops.early_init = spacemit_k3_early_init;
+	generic_platform_ops.cold_boot_allowed = spacemit_k3_cold_boot_allowed;
 
 	return 0;
 }

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
