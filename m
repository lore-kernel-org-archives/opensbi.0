Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0716FC54F51
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vRwQ2cUOohx6O0iEmFF50K8LEHzzEh6OvUzkGcUx770=; b=y8P5wpmXyfmdKb
	SrG5jCBVfxDkav2y5wq8Ya9sENdhRDFTeI6LIehx3oJTR98eMYVjQa/iUUoya3vUCwqZoM5tx0oUe
	W3/JvNHoFhmqIL11zF92maWxroslJYngphgLr3bOMYrIdFB8vrnm8+xNNoDKTwgOAngqnncJLeBBa
	IO+3zUqESFchH0TxxcRSGt699fGYrvYqT3OeZebG13r+0Tsa3HdHHmMbwYrosjOnY3y982WsDzcxd
	Ml6F1Dme3bwjiSRiiYdMFifAtKtVyRf2so+BgxCnaaEiBoPvtjmeq3NHjpjP/55le71pz7Dp0WHhs
	uPpCqbvW4vOTw6UaTBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Vm-00000007MEj-2Vb5;
	Wed, 29 Jul 2026 09:23:38 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Vj-00000007MD7-1nfg
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 09:23:36 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 66T9NOS5065477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 17:23:24 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Jul
 2026 17:23:24 +0800
From: Randolph <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
CC: Randolph <randolph@andestech.com>
Subject: [PATCH] platform: generic/andes: fix 32-bit shift overflow in decode_pmaaddrx()
Date: Wed, 29 Jul 2026 17:23:17 +0800
Message-ID: <20260729092317.2848665-1-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 66T9NOS5065477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_022335_803309_AE6DCB35 
X-CRM114-Status: GOOD (  10.97  )
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

decode_pmaaddrx() reconstructs the NAPOT region start and size from a
pmaaddr CSR value using "1 << (k + 3)" and "1 << k". The integer
literal 1 has type int, so these shifts are performed in 32-bit
precision. Shifting a 32-bit value by 32 or more bits is undefined
behavior, and on RV64 the compiler emits sllw, which truncates the
shift amount modulo 32.

As a result, any PMA region with size >= 4 GiB (k >= 29) is decoded
incorrectly. For example, on the Andes QiLai SoC the PCIe region
0x1000000000 - 0x17ffffffff (pmaaddr = 0x4ffffffff, k = 32) is decoded
as an 8-byte region at 0x13fffffffc.

This is not merely cosmetic: decode_pmaaddrx() is used by
has_pma_region_overlap() and andes_sbi_free_pma(), so overlap checks
are performed against bogus ranges and freeing such an entry by its
physical address always fails.

Promote the shifts to unsigned long so they are performed in the
native register width.

Fixes: aa56084c4dfb ("platform: generic: andes: add a new Andes SBI call to set up a PMA entry")
Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 platform/generic/andes/andes_pma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/platform/generic/andes/andes_pma.c b/platform/generic/andes/andes_pma.c
index ba9a35bb..28d33a2f 100644
--- a/platform/generic/andes/andes_pma.c
+++ b/platform/generic/andes/andes_pma.c
@@ -82,8 +82,8 @@ static void decode_pmaaddrx(int entry_id, unsigned long *start,
 	 */
 	pmaaddr = csr_read_num(CSR_PMAADDR0 + entry_id);
 	k = sbi_ffz(pmaaddr);
-	*size = 1 << (k + 3);
-	*start = (pmaaddr - (1 << k) + 1) << 2;
+	*size = 1UL << (k + 3);
+	*start = (pmaaddr - (1UL << k) + 1) << 2;
 }
 
 static bool has_pma_region_overlap(unsigned long start, unsigned long size)
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
