Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1979606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KWLfGbYe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RTlR0+AF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=dwTKpNaV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ZFD88+4zOlJPm5UUAY8iBikqoNDKtk4Rd/jK1VCRKo=; b=KWLfGbYepqngnmfRbBDrtVV4rY
	eyhNcpGPdnP1phvUmehnjqYKFI0Ox6o33KVmFCzmjEHqtPgceHt/DpzFlM0gFGEpjh0IOuF5iHzON
	0Mm6dkS/ZopWpxSpHDvgYZqXfPYWXW2HpMD20VncJy5h64ywSHGBjMgzof3HEmaw3XKuPtqx4jHsv
	8HlpnkS1aozGLVMmFc7I/90lkbP+ZHVjEmatUup5WQz0OcPf8+X9qchQVN3XaGiOB0CaZxk5WJm0c
	mYJLgx2h43R86QMwbkawpxPWrhwPjoC3JoarNZZyfGQyFbJE3DvzibzBF7/KWzTjD7NMYHIVoX0tn
	/ZWe5lGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6Em-0000000FRmA-1s4j;
	Fri, 23 Oct 2026 03:46:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6El-0000000FRlP-1vc4
	for opensbi@bombadil.infradead.org;
	Fri, 23 Oct 2026 03:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r+gjaUkKDAszRWtH+24VoEOQL3HSE9kLpNTktpbBbJY=; b=RTlR0+AFFz9lilydEA3sPhoUZ+
	TP0M95frMt1vGEcjCuSFfsTqLWqDYBZffzhmjuo3yp3+pu/TvE4JekLws++Sy7rWrM6B+xcpLzBaf
	L5qtE46PEYjwjxNW/XiS6KUxQ2hNFfkQncX0J8amgtlwR+bkQJ1n4VnSfJKZIJLevgVPSRd7hY5UW
	4mprymu3rLNFrMnoi3yQEpRiCT3tpIfhfZVMTtYCePYCbuRJ3JVaNQBt8bEBKnlHTgBeipxkFhPlF
	93dx+RhqwDcB69jqL3Au1ZMGsCP1XN1RSDGvGyLVQDbO455kfKU08bpirVlZ7pgfjfjsOYUd2pJy4
	LEAP4FZQ==;
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6Eg-00000008fbt-1pMX
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792727123;
	bh=r+gjaUkKDAszRWtH+24VoEOQL3HSE9kLpNTktpbBbJY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=dwTKpNaVnJnaTMd6YNd9SoTMow9I/tAGNDxywZ5DoBNGwbS5yDCsGfmiC+120rFor
	 b7N/LhjakzOfCIceBK1haj9mJWgh1DChmC4V6fn9cGISoiu+DO+9Du8w6ywvC/7PLX
	 q4b+0yMsrImrSk9JXx8natc0MmllITHZj1jjl+ls=
X-QQ-mid: esmtpgz15t1792727118t5e0fc7b6
X-QQ-Originating-IP: KXYc5CflsIuQW29uVo7xVsEDlKINWOiDIs3Kxv8EhfU=
Received: from = ( [183.48.246.89])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:45:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4736896486659006462
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 23 Oct 2026 11:44:46 +0800
Subject: [PATCH v5 6/6] platform: generic: spacemit: k3: override
 cold_boot_allowed for hart 0 only
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-spacemit-k3-v5-6-c5ddfc72caa4@linux.spacemit.com>
References: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
In-Reply-To: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
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
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFm3bhhZnYp+JiFx8OicE+0qW5263s76zyaqPW2OaGvB5
 PBblxemdZSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAEzk4g1GhgeaEzS/T/oYYrRV
 rkIxp/5rscx7Xp7mIAP/vULrgm95r2FkmOh93UX0ZuCf/VHn78k2PuQtDXfcJnqPo1I/+36V54Y
 +FgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvjiA+1grXj1IewmUTYZYBn7Va1MBrvToc8IdeCDeYZgJ0ZidIAyPo+R
	wJG828Xn/HMr3XfNXgVwUt01nDeYXyaxZseAAOQEFWR+RmSX/9jTQAlOxtlIW1Yidl2Ih+Y
	5dVUg8NY0+DyA+KEFBeqhP4ZE7tCHdnAD2SQx5QfvUIeut/IoOg4vk573HOT/jd120bjMl6
	ylpNsfeXKjv2Lkq02PlC+OB+i5ju4yDrXW9ngmTaN2lwmFB5XkHheb4e0MnN3aos9kQyQl/
	xKevzmBUaA7n0cRKKse5XvGw7FZ6k7VHZtmWNdGdVOUGUSjoH8D1e8eK+7L57u3xfJAObid
	3/xtXb0kT4uxJvuH8iSXfa9nSH7NbCHAlezVzvmaLyOUvrcUTWPvv9oNBVBkqm0CIqlk6mM
	DPaDjeINWRA8TZaSNBGC73CHVkNp+ch67OzqYOzM9Qdyx/SVY8n6AMe+R1b3uKkgRs1UPa/
	0mgza5h6qb9s4Yr8vcvwkHDF7k64wlQoS9R2zv1JXpQNH98M/8/HNoT71iQ4V4TEgqdfPTe
	/tG6TGqMRheaR9TDwc5c1bP8RsFG6gcrYHZPwIQXLa/NhwJv4ZU7nlkjDrBm6JZP1hj3R+C
	x/bmOKwLV6V+L+qjGW6lW7FZRK64jEDXSOh0Ojje2ns87POBZD4ePI5+16JDKL72ni9Umzs
	cAArHSC6l592tEM/JFqjWd35sxe03/n6rsP5KhOBD+zAMpTLuoboXLl6RP3xwG+urtrVLsR
	+NSyFG2B59StVmG9Fa1Hrd5U5rT73KVd1fHKRKwkWvj9twQLOWytrZH2WyxyBYf2L/qR7TT
	7HImzBfHQGmNtmQIY7XyhiZyh872r5+DKa3Ummcsuy0f0u0TreMa0z+rB/nHjQX+i5TGYrF
	bfyF5+kIGHDgQRcwlFh4HZUPDsKL7fZasx8TDTekmRpp6uEtXtQP2RUF5zbf7xNJm/EGITD
	vELet+1HU6ZTB6uXBZ24mPF8J6XZDj28518tHvdEeMU8E7PKr4PcxKvL2j4xNcGI4gIzjVY
	pEE5o56CTNvZiX1LO6ymUxLEZYzvfIDUmkqdy5/lWgmaQ6s5xTRFUtnItcY6mStbcB1r3w+
	2/XnkHeTT/BU6rrCyAjqSYbd/Sn75YBhdBVGyzh1PInQLiqgWT7Y0mVJrx8sOLhdf5k35aB
	dlj1P5TEJ0eo8YjkCUAdJb1rxaf2WMUS9990BXYSpugB/VWbfcopR9PI8K+drC4NSKCPPax
	mbs9Hi/Xh34bl6L4yIg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_044632_396585_BC95AA1A 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
