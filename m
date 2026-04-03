Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B489E85389
	for <opensbi@archiver.kernel.org>; Fri,  3 Apr 2026 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WmpmWqkfgXxSWfjvIJpLUr3CmZpgPn+e/yQ2DJuFG34=; b=L6Oh87ovkUO2uc
	mmM2/syQdUfgc5mLCDeZVxmPwtdfMxDi2aPZU/ykr9/4osyEErS2PBLzbhwHC7TiIoj9cYdhpZyHS
	fmJCoStPn/uxVthsLgX4nWOXIYfYKRh9F0akXrdcd6tYukiK1yAgmR1UYTKyAglFhLUx+0mACfoYX
	pRJncLoHjFalWfm1t0PL5ippOK84vEuvGA6sQVOyPKj5+hOgPNqafxMPDmBX8hPRC8YmuWigrQMTf
	Z8gNM5oc27pfi+fkPgSA7WdZPVRb3m/mDiaimHrHNi8vH2FpNRh7AMocw07F4FpF5+f6ZdM7ot+qY
	qFwx0VD8jPwynhB9NiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8l8o-00000002XCf-0X9v;
	Fri, 03 Apr 2026 20:29:18 +0000
Received: from mail-westusazon11020100.outbound.protection.outlook.com ([52.101.85.100] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8l8l-00000002XC4-32YZ
	for opensbi@lists.infradead.org;
	Fri, 03 Apr 2026 20:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHRrfGropXwGryhrVVzBDJhUOQg502584DlefDrjG2lvZNYHbDwyhq18fQ9TU1pTB7MQKorY2xpG1fZaN6vFWziXTssrYtAZmTCuwr3gGo3Oa9He35y4NFgOO8Mr4scZ7QL6NOf5tpZ1hXZ2exPGxIsuY2EP1uXAxnvE9bTZGikAoaZauDU6TK3aL8cEwt2AWgCr+mI1AquUJMG2NNGU2/k7AgbIinbIJdT+WydW/R4gMngBCN3dA60GeP+XXarEuiL/8RYhmUBbvCM1byg6bH4JVHQJZvzVqsI0jGnPy/sofY5/aFmwDK9a3zro0bOKYvmHf53Aqw5RYm4k983Uqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6X/46RTrRXJTl3cNFZP25l+bb2zaxDJjLb6ApvkFABw=;
 b=be+CsRrZenky/YiF9Cz876J3j3ptZpOMNXibPjIa+V8S3S86uY8Gcyuu6Y4Zun4VeyzvVeCHflRhJQ/xC1CT5XQ4IN8AOSD9nKh3Dcx4xivxr6zuBBvamdTlCjcNm+KOXYkzP3AbAPyHVG6Y6DoDpwJ23y3ldzJLomuemlsImQLPXkuJ873UCmpjbHy81Ty7owu9tQ5Oe3o5Gyq9Xkb/kGLfkXU+shuukVWL2fFJGPP7wuBh+s06oxXvG7x2XOAk85AG9h3Ztgrx29yWHoOb+b5Oot4rkhcKHhgNxdU72j/1t9obH/mZYBfgtpe6XKZuE8hISn3L6DzzndzHJJOQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X/46RTrRXJTl3cNFZP25l+bb2zaxDJjLb6ApvkFABw=;
 b=KpC42Wruxg948/Zy4iwHSzXdWvDFJigOVGUNud4cqmF5ThETygYhrQP2GR3eIqvlytHfWc0b4RAhDCr5dVVFYCp5g5Euh3GBFb8KgRk+6x1P3A+9Eg2Y6lMEVrpyrOIBVix2s7gtZKZ+fZf/8RNv/Pxz+EcoxMtIoECgqhhBJnjAXza18pfrOwN+mX6qZURmGGzxK2IWGLe2q2Owo86h/yhJNtCJY7ZjCwApHhfH384SNpfCjg+InxO1k+xVlbnJRpR+rUePPDKnVmHqCmldPz2F9FuIo6T8v0p/1APtQtbidBP1VMOpLFvqMd8bHr6+1OfM5lWROrmKya5R9M5wlA==
Received: from DS7P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::11) by
 CO6PR22MB2916.namprd22.prod.outlook.com (2603:10b6:303:14f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 20:29:10 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:8:1ca:cafe::f8) by DS7P220CA0004.outlook.office365.com
 (2603:10b6:8:1ca::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.21 via Frontend Transport; Fri,
 3 Apr 2026 20:29:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 3 Apr 2026 20:29:09 +0000
Received: from davidAhead.lan (unknown [10.8.0.10])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 3D39C80FC6;
	Fri,  3 Apr 2026 13:29:08 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH] lib: utils/regmap: Fix reg_stride calculation in syscon regmap
Date: Fri,  3 Apr 2026 14:29:03 -0600
Message-ID: <20260403202903.3407945-1-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|CO6PR22MB2916:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c95d3f-f0b4-4198-bfac-08de91bfa947
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: YEXYg6mqOReHSz1YCOKUuxQJsIps8M9OWjsLFevI0sDowtggGnbXvpRtglWwFM+W6bW+198BEE5tQsGr3f03ZnQ8U40zvTW9pIihvtTsGOPVVj7YI98RT2FF9CxWkGAoqUCGtm6EJhVHcqe5yjjWxLEd7o9EARJ3fjmUuvz2jyN6EbnZZ4sGuglVKnSPNVBdE+68ZKx6sYnc1ZtP5vYPOKmbG5Kn0/OfTOFDNh5fmVLsXdoHczVetczGfZCSJUkxg7ilwXQecUlIn44CmUGMOX0LgHuoffQLngkxjw1MvVNA6wcrs0uk21EYtCqyJnK28iC7nInNcbDJJdAnkPctjfTxNYIov0Hqhv7Bpx4oAbFWWGII4q3zv0jjEU3BHfIHrurZz8HSORLfVkhYsYxwesJ4rVUS1l4Bhh8o8mkv3H91o0YFruKhvRD6DskL0tiKVHZgfqEpRZdfrCcRX1nEhP3RxaFkvM+nbUOFQtvEkHxT1ZEcRUj3bMr57duADPwEuKEM5xtPFNHmFH88we+vCWjr4bE/BIj/TfnFDBCJPNhdVzXuqIhXF+TugDmBt3vevXTxBdSqYxaZROBBDpg17a2L4Hnj1MH+TPqwPnlEjtNsJ74r2YqueI1XBpZJOBInyNaxtsjavs5OwkYLGjlzV1IWAAi1a2JkzqgzyK4ZBAAB/dIHlr5dNrxExlXdVMG3IshxSdxaOPFKUTN+H1kb2MOYupGnqE+isGCr6n9h3VB6vJM95kGSsJuudDJQiHnXIxtmS+MXFobkROuff7CGzw==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C80wdZO2M+15X+v/6BxgsDZgljrGrNFXiFbW/1SQDTTKuuvW046FAakOnMG2XcFTEd9YSuPZtKwByRdg8rdEJDm4hsZCKIY2UqJS7plOdjeBJkbNS5wm50hN8zBrj/4XFixftuHoN6sRhx04mDrArvlfzeLEXDq17PgUvz2oN7q2ocQXP1XhkRUGJN/EgP8fWukr70PJYWlkpvk+oslDYnO45EjN7fq8WQUJkxBPZreVhc1eSN8RKXIplApubwZU4QKrAgd6ydUsswKUBmDV/pkOCXayy/1cwSW+NcPV/TkIET05h4kxzo9QRZDmgJpOcBEFGnTMO0Gte6cV9RlFgtrzrTFU3dcbBdrwI37J8g5e/iiqyyB49CLvYTGEoJMrhulTBnqnuriaBWMQPfs3NOdCdf/OcEgiQBciwXKYyw7PR6UCxKj35cncfXeJetgl
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 20:29:09.6733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c95d3f-f0b4-4198-bfac-08de91bfa947
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR22MB2916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_132915_838221_900A4C49 
X-CRM114-Status: UNSURE (   9.26  )
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

The reg_stride field represents the address stride in bytes between
consecutive registers. The Linux kernel regmap framework validates
register accesses using IS_ALIGNED(reg, map->reg_stride) as an address
alignment check (drivers/base/regmap/regmap.c). The Linux kernel syscon
driver (drivers/mfd/syscon.c) sets reg_stride directly to reg_io_width:

  syscon_config.reg_stride = reg_io_width;

The current OpenSBI code incorrectly multiplies reg_io_width by 8,
converting a byte value to bits. Fix this by using reg_io_width directly
as the stride value, consistent with the Linux kernel.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 lib/utils/regmap/fdt_regmap_syscon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/regmap/fdt_regmap_syscon.c b/lib/utils/regmap/fdt_regmap_syscon.c
index 1309a55c..59cd5ee5 100644
--- a/lib/utils/regmap/fdt_regmap_syscon.c
+++ b/lib/utils/regmap/fdt_regmap_syscon.c
@@ -190,7 +190,7 @@ static int regmap_syscon_init(const void *fdt, int nodeoff,
 
 	srm->rmap.id = nodeoff;
 	srm->rmap.reg_shift = 0;
-	srm->rmap.reg_stride = srm->reg_io_width * 8;
+	srm->rmap.reg_stride = srm->reg_io_width;
 	srm->rmap.reg_base = 0;
 	srm->rmap.reg_max = size / srm->reg_io_width;
 	switch (srm->reg_io_width) {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
