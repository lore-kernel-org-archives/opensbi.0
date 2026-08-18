Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46292C5DF70
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 01:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YMK7RoE09JY6GB6r9LVWtO2wuT8hAyfxz3cEO2gv+s=; b=e/kGj27+T+dh9g
	Bi4IThz0Ggsqr/qPHu+SJA03SHAvyu4YCqsMK1PW1sa1Wkmf+C3tVF4VMSiiptxeoH8szGWxBIEEh
	zSPgEcY3vHEoGgEB3YhXK17UeL6pIUxkYCGjEB+MtTWtaIl1fr+u79wdfNmzrF3Cc7OrjOOiXkq+c
	Oi4dCk6iz7fsFnFDpGYd/mVWS2lmm1Wz0OuPSxf7MP3KWsNYWnBeO7seMy5srnSNHfEyB1r9s+iSb
	IiOh9I2BebxKKA0U1TQgcoU3D0uMINwjPTjQyXZvlZ3dN0ByT27CiiwRTHyA7E5WCIkhrEtjQGfV+
	Mo6VuIhJTlVCOd2Oc4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Pv-000000072lg-1rgv;
	Tue, 18 Aug 2026 01:15:03 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww8Ps-000000072gT-1c3d
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 01:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787015671;
	bh=67R7b9OnoJYTmEbsmXs9iUPlgMOZmFZqRyy0jCO8c7I=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=sYo3PoLINyfD6HmgHKxfq59HbVr1LobRNHBVBZs3+Ai18nJmqM84wDuii7L1GrU4r
	 PBqorWrrY1sX7BURfDF98tordbGAc/YyWoJLI2Q+3W4P6/tP1+mjuq5tbz51kDUCcL
	 qoYu/olyeDgEIkaTWs/Nh1hQ64b++4vNakXZz7a8=
X-QQ-mid: esmtpsz19t1787015670ta7b74591
X-QQ-Originating-IP: LaU5v14V767S8pI/NxrKc39Xb5RdJe2niBmtB0iDFt0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 09:14:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7041759820581396873
EX-QQ-RecipientCnt: 5
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Aug 2026 09:14:06 +0800
Subject: [PATCH v2 3/5] platform: generic: spacemit: k1: move hart init to
 nascent hook
MIME-Version: 1.0
Message-Id: <20260818-spacemit-k3-v2-3-84cb7773a481@linux.spacemit.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
In-Reply-To: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=I08PW7SIUUSbWgytHfkidBmOhSz27FiV5321ns6UIII=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnNG5+0zGHivh6dbXRtuovfbt1tQaIiu7Yy72N949Osd
 fPhhdNTO0pZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACZy7SLD/yCVhPf7nf6LeOj6
 iqhs0fW17d/RuvPxJb3/bL8n2tx8aMrwP+dP4Rkxm5PO+1Lu2NhPYS0PrJgRWuUpe3iKXPauvKJ
 AJgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MUZVN6GmaGOtk7ciPECjQz9vuj9cLGpfCtY/uykkfIMzVvFutF7B7OVl
	+9v7aDgyXc0C4+3Nv90LgSEkUmGLT92kt9ALQ3dFnFWcJkFrQepXvdxmwmskADeGK4iIebM
	zw+2XAJsK55KyPWrG9Fo/k5UgGAiTaSVt7hfr+hv9wkvMsk0XwcyzgsyAuzxhNFz69s5FHT
	hNpdzovW/HJcP1kY2mqQXQDYFVLQk5KfYSyKTT0nSFAaZK9/w0ViiQfP2LjPXxUhNOou0aH
	aabI+OUfais8/VGWUGkSHOD6rNe9wgmQtRtDQEriu5vp+Resh9NWG1tLqeBlFt+7fr9wSBg
	Vjsf9d+XybGdHRDT0KHW5YTzCaeEUCaCTYJoMqXZSNlIvBv/7wMqDNFsY9Ev7PMgdLs3F8T
	mqIDmZ4O5Hma3xwtI5jf61Yg6kRiL8PBt5+uOOB1+eXmYvfOH7FSOSXFdM5+6CANBe7f2L7
	wzec99/haNGncNxmbcH+F8nx+vViQ8rw2fbXKrf+YSgrMLPMe8lmCNiOzFYn61dQiFJzT2h
	pCUN0NkHRxPRpURrLPsqI/1UYDLaRoIs2wVc7P7VFIkMqeDVhVMqbaIX+tb/8WtQC31x5OD
	TM49Q4yqLi4z3WxiXSZfrCEnhJZn/IaCFd3chBQj1nmUsyVreEF0HdGk0GWPfHwfN2BDBjR
	//loOkUebSckAW0Cqy2hVOy1GBQCGLYa0UY1KVJjjppZv9iAgv4cLkziFaViRbcLytppQLk
	h8LZ7EjkIFoZAgsMEUC7/tY6rhGv7ZoSyDMCT+bRgCqE4vWgnj4UIK87X2QGDCMj36ddT25
	niacD6haJdpdq5zocyEuBXlYMPeqF0zYPZUZiB73ESNoY42a0FLeQbXdzrAc/SUu9l/0Vix
	7N67lIJWU6awbNKcacOOzyBW14Y0e4RFL6eIROH/PkdlZ+jdjGzJlT3BU3uf8Jr+CfUQWRR
	90sqn3rC7lV8hz9AEuxBrGsz3b0WITwcxjaSiPbxn0gWzI2l030kIs24o5i5NoFtR9c0AxM
	gpdfqLgWnI1eKJ4utxfQ7WdR4cYrZialONfbv2ofTWofES32h1e2xRx1lqh+/3j2g2WwFWn
	uIXc/KIw7TiI5A2wNgrXM995xQOPefw2yvn19zbdjjEODyfPzwj8o9e0GKdkvCOuY7POa/S
	9ob7
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_181500_977496_DEA261BA 
X-CRM114-Status: UNSURE (   9.57  )
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

cold_boot_allowed() is a policy query and should not modify per-hart
state. The K1 callback currently programs ML2SETUP as a side effect.

Move the ML2SETUP programming to nascent_init(), which runs on every
hart before common initialization. Chain generic_nascent_init() to keep
the generic per-hart setup intact.

Fixes: 1f84ec2ac22e ("platform: generic: spacemit: add K1")
Reported-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/56220293-88e3-451f-833e-8251656a83d9@gmail.com
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 platform/generic/spacemit/k1.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
index 7ee5f17a..19a9b27c 100644
--- a/platform/generic/spacemit/k1.c
+++ b/platform/generic/spacemit/k1.c
@@ -8,6 +8,7 @@
  */
 
 #include <platform_override.h>
+#include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_hsm.h>
 #include <spacemit/k1.h>
@@ -86,16 +87,23 @@ static int spacemit_k1_early_init(bool cold_boot)
 	return 0;
 }
 
-static bool spacemit_cold_boot_allowed(u32 hartid)
+static int spacemit_k1_nascent_init(void)
 {
-	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
+	csr_set(CSR_ML2SETUP,
+		1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
+
+	return generic_nascent_init();
+}
 
+static bool spacemit_cold_boot_allowed(u32 hartid)
+{
 	return !hartid;
 }
 
 static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
 				     const struct fdt_match *match)
 {
+	generic_platform_ops.nascent_init = spacemit_k1_nascent_init;
 	generic_platform_ops.early_init = spacemit_k1_early_init;
 	generic_platform_ops.cold_boot_allowed = spacemit_cold_boot_allowed;
 

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
