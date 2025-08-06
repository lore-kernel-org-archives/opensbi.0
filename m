Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962E5C87FD1
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 03:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5x99RyUVGoGA1iRL5Dq4Fm3/dANugcz5+TBLzvaKlw8=; b=i5WTbMQtjnfjGS
	1rPIfOK9xEt2t0VGevtrnBmL8cDx0rSvnmcDQLqNpszPn2WoaCbFUH/CWfQxlimH/7jHqBXZHehLP
	4mcBaMbBFcTD81cB4IOwkY+6XG4qmddv/gJbEopqsdQk0SNcXPqeXImvJ/yj25n9gX19AiXeHVrJp
	Mpe7pRFkULZ01V1sVhMH14cNtZ6YiNP3WpDawd8hoW/gNz7CiSTax8XoJ7y4SclF5HPYsC6u2+HAa
	r7lcClOfsqTMtQcYDnY0W2THPcdwvkBYNc+n6YQ+wZxhtEGNsMGrvQ59uMy+U0IXH8VoMs5CHKocZ
	IVWSqBd+XdB43pThIw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujV2I-0000000EFHR-28iK;
	Wed, 06 Aug 2025 03:41:54 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujV2F-0000000EFGl-4202
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 03:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sj
	ILpcUxzZkf4bWZqx13Od4vy1NuIgRMeGa3X/8YuQc=; b=clkdwOFv80C9f8AQAO
	D2DYeZWKXaTD3ix+F3TJgPhODZBUG/fNmE60yITUfT7vQg42n77xwJJ4Gt3lx2Pu
	NR3gUeb5fY1vQkfYRMNQ8EcSCL9yZbNuPuDBEqVi08M3H1IR2zgmWiT0mD0uen4N
	/FVRAnkGXxBPCal2wlZIBGlS0=
Received: from vcore-181.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHf_f2zpJohwgoAg--.9472S2;
	Wed, 06 Aug 2025 11:41:43 +0800 (CST)
From: Yang Jialong <z_bajeer@yeah.net>
To: opensbi@lists.infradead.org
Cc: yangjialong@rvcore.com,
	Yang Jialong <z_bajeer@yeah.net>
Subject: [PATCH] aplic: fix lock machanism in xmsiaddrcfg(h)
Date: Wed,  6 Aug 2025 11:29:24 +0800
Message-Id: <20250806032924.3532975-1-z_bajeer@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: Ms8vCgBHf_f2zpJohwgoAg--.9472S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4xtw1DCrWkGF1DXr1UKFg_yoW8ZFyDpF
	sxGr1UKr47Gry0ga1fAFsFgr17Gry7Cr9rCr17W34Syr4DGrs09ryDt3ykWry3GFyfJw43
	AwsYgFyUZFs8AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR8gA7UUUUU=
X-Originating-IP: [49.7.252.142]
X-CM-SenderInfo: p2betyxhhuq5hhdkh0dhw/1tbiEhqhI2iSnY+QiQABs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_204152_313685_845D555E 
X-CRM114-Status: UNSURE (   8.51  )
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

4.5.4. Supervisor MSI address configuration (smsiaddrcfg and smsiaddrcfgh)
If register mmsiaddrcfgh of the domain has bit L set to one, then
smsiaddrcfg and smsiaddrcfgh are locked as read-only alongside
mmsiaddrcfg and mmsiaddrcfgh.

Signed-off-by: Yang Jialong <z_bajeer@yeah.net>
---
 lib/utils/irqchip/aplic.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 72906d5..e4a29ae 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -121,10 +121,6 @@ static void aplic_writel_msicfg(struct aplic_msicfg_data *msicfg,
 	u32 val;
 	unsigned long base_ppn;
 
-	/* Check if MSI config is already locked */
-	if (readl(msicfgaddrH) & APLIC_xMSICFGADDRH_L)
-		return;
-
 	/* Compute the MSI base PPN */
 	base_ppn = msicfg->base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
 	base_ppn &= ~APLIC_xMSICFGADDR_PPN_HART(msicfg->lhxs);
@@ -167,7 +163,7 @@ static int aplic_check_msicfg(struct aplic_msicfg_data *msicfg)
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
-	int rc;
+	int rc, locked;
 	u32 i, j, tmp;
 	struct aplic_delegate_data *deleg;
 	u32 first_deleg_irq, last_deleg_irq;
@@ -247,12 +243,13 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	}
 
 	/* MSI configuration */
-	if (aplic->targets_mmode && aplic->has_msicfg_mmode) {
+	locked = readl((void *)(aplic->addr + APLIC_MMSICFGADDRH)) & APLIC_xMSICFGADDRH_L;
+	if (aplic->targets_mmode && aplic->has_msicfg_mmode && !locked) {
 		aplic_writel_msicfg(&aplic->msicfg_mmode,
 				(void *)(aplic->addr + APLIC_MMSICFGADDR),
 				(void *)(aplic->addr + APLIC_MMSICFGADDRH));
 	}
-	if (aplic->targets_mmode && aplic->has_msicfg_smode) {
+	if (aplic->targets_mmode && aplic->has_msicfg_smode && !locked) {
 		aplic_writel_msicfg(&aplic->msicfg_smode,
 				(void *)(aplic->addr + APLIC_SMSICFGADDR),
 				(void *)(aplic->addr + APLIC_SMSICFGADDRH));
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
