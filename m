Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131FB10F3DD3
	for <opensbi@archiver.kernel.org>; Sat, 28 Mar 2026 05:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+Ll5mTuMoigObcpF1yjOm3fZo2E+NCs4YLbGBV/bT0=; b=XR3C5fGvnq2AqW
	9dwgZ2zxvWr26tDk+uxRSkNpqlZstEs88fN4WF313QYzWmnflQsUNOIYugl7gB4v9apaWWYBNIJ5j
	SBwKyZ1jF5+IAG4QOlJtWZOWxLGN7R7mR2ovDyoGGLysHB6PFsTRDXDD/b7d0/s/8SiRyXaKQYFI+
	8vpfvOvNKynd4qMeEdP0g0zojxeNYluk0ejNT+Zm6UrTa/BX9iIP5TKofD3xLOvXM0Pf3AkRL2zYA
	LApmbmd4Urio8Bg8DmG09T6CMjprOBzZjw4qEdO1QAICb+4KtPOo5M+0P7i8Hc62b9e0J8C1+Or7o
	oH72O3rAT18NsZJNMyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MTA-00000008bOe-1jn0;
	Sat, 28 Mar 2026 05:44:24 +0000
Received: from mail-westus3azon11020097.outbound.protection.outlook.com ([52.101.201.97] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT7-00000008bMe-0SoB
	for opensbi@lists.infradead.org;
	Sat, 28 Mar 2026 05:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIlstxYnThiRjDbb9mlbNtFAqAPKSgd0NS9MHljpt+hq+wFUibo3GE0goNuoApKZVDrTU05Z2wzT1XMkuHx765yoP135FcTyfp1p1nvKQjhlsb1nDUuQikjlvJ4Y0y/D/yg6oDZlUuNnetBygO3Jyu/NuB53DB3Bp4guHPBO9sEPQNV4db9gsBSzyYc3DU5HpzRsep4gDVe//CZKERb8y4efqxN9ta1wrep5Gcbh2Vi+3f/DdZf5uEv4owK4Rlzck9K2VeOeMGkisbCxqByjm01rai1zuHoF625WkVNt+WqsrsQvDtgddtK+8NeyCXdYNafyrAhpEUMO5Eonh/rIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hm0eVFAaxCXXYZXXahIU+DW6NJs+3qpr+V95zLCnyG4=;
 b=wmyIVGMqvTitYVDiSM0ODDFPBhPcoGbNtst2dNR2BbxUDDwi2Wdo8J3BLwIKy8Pm9k4IFzFpbX8dkF00xUOUzocKFAJu4vdFZyJ6KCMVyWeAEljQMeQEoBOgi87uBhYCHXXfktES5mMSgY896iy5UgcWMsRSQx1jp8hlOkG9pZ/Da3pl5HQBTpL9e6zJtoSUDK5fr3u/b3Vx9sVayRoWg8591K2bRhM02iCjhwoHVmJFUu+2OQiWwj+SSuzV5s9DyERiNxh8dTe1akdgAPcmndPfbPTWO3sExkT4162bg+f6WOC2Pvq6hN13u+C8aylz0WX57DdBghvbdZjPaSWWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hm0eVFAaxCXXYZXXahIU+DW6NJs+3qpr+V95zLCnyG4=;
 b=QQh9vR7egqQhduHnUZHF/Xbf5cYbpI6+KLTkY1xr/rEFzub70PMcXMLFkPj21cqmr5JCVBvvo+3C6GqnzjW4vl6T3XyVZRbou+ESSc3EepHsCagp3Rxqqs4Ef4t4EAbvcBsqT62RL4ZdsAvbchHkLsZ/tdZNd03oPHAlMUwoyqZ+zNGdNMqp8SurAg3zTMuhl/4dVhnOQyXnlVhgKPNxt/YUSsw1M/iYb10MbyJw+b0P03F/KEWxn1IWWvdNdzMFk+13A7EAQD/D2yiMw19l/QYAgArLH0eV/ttbYkU6RJgNCQbe9d2Vssh8RdOZZOxRAcLGYyF4CKnV/HuUaBYc0w==
Received: from SA1P222CA0110.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::22)
 by SJ0PR22MB3415.namprd22.prod.outlook.com (2603:10b6:a03:43d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Sat, 28 Mar
 2026 05:44:14 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::55) by SA1P222CA0110.outlook.office365.com
 (2603:10b6:806:3c5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.24 via Frontend Transport; Sat,
 28 Mar 2026 05:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Sat, 28 Mar 2026 05:44:13 +0000
Received: from davidAhead.lan (unknown [10.8.0.9])
	by mail.aheadcomputing.com (Postfix) with ESMTP id B8DA280AAC;
	Fri, 27 Mar 2026 22:44:12 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 3/4] lib: utils: irqchip: imsic: Dispatch non-IPI interrupts via irqchip framework
Date: Fri, 27 Mar 2026 23:43:46 -0600
Message-ID: <20260328054347.3706029-4-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
References: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|SJ0PR22MB3415:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d0651f-f329-47ae-1a3e-08de8c8d0b44
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info: mXMn2Zh3NaPDJgKuJQMu+PrggvwVn3/F8RbB2m1s+lIRmOJpjHZ7T3EnX6vgcDtwcB/ahOwNdgDZIZtIy9MpzajlTDBwRC9TlpvDLv8jte9v0SYn3e4yx1BWqNP+3pdS9eJimABBBj5THFMVlLGiN8A6D9Ki9YCVZddCKlrmsuhcVEphr5MLzT3R1RQoLadbc8eaXLCWKpAzDi6kwM5kPnxhF3wS48Dl4qI1IYbi9RQ9zjcUOLQhxkn6wUVpwLu4wbV9Wz5YE7gsxvB3kvCypdf9N3NdaF6u8SqRHywSHy1v5NyVILhp9LWNSSuRGitqyUUdvFH3Fvn+XEtZHkKvJlpWZ54QUfaxkgxJeULWnr2AYCJpguDlAjKlEUngIfSmXlkn2PJwzujgQB6SSvCRoIHrBNlUpXgMfNpGW7DKGC2LUek9+q18//E367gEqq95rAHyEcjGnS3nVRx38uX/WQwXYL9CrUMIPj5ypF3nTNHpBZT+qjVeSgvfupv8qP9I5eXcTep8pATBmYYMokV8aD5yYgyMUzZN5QJXQU0GLyGQmDJOd51ZhMLTP+fV0odX/pukVBfmdWEE077aWSZNsRCOvxtbIpb5c8sqdFQyQ1gKN8b8TuKMr02hjSl9a0tik8UKttgsk5rmFV/TbOED4uiQgmxDKsBAuVls2c21S7AiWmfjLr1gTw/IXxNGbYSsLF4jfnVS+DAZUdBEJpO8/nL71SfSNYatApajQUqxUydJeASyX94ClnRX8OYTmZa6OhVlLwozRnB1RXLrjR4spA==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iyomaIwmvYtPcY4SnRLl158Ow8NoIAMAN/udxmoTp5L8UWO1Qv+RPmIrnpl0xGUNTTmDYLoPUAPSIBYd8IVK+Q/yHTlErLdEOmODQBCClS6DJs6BiTY2+XcD4t4J1S9eO19JXuNkjZM8icqwJVfiq0kyTnzoHvTpURSRdu/uFPJFquh+0zy0Jh7o4JriAxF6LaVOaZDrRoP6L7A5V64VMAX5+IPWyxwVAf962sgsq0BNipEtIft1q2ecGSAX/rGxal6xUqraPspCijGTgPvOtVv5qDXSl3y79+NuqntE+mLtJiSbqNQnlkgLb8fAIN/4IHYUsXTvcyrIkezUwjHRDfc7y+AQIk5aSgxzfeiw0yU8KMssNUnQN7g3zOm6VzFkwR1KD0iNHRjWGAJvSihr/Z+jb0xsZw6ElhPcPCEh1Ysn4Ux66S9JUKVXn2onf0Fv
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 05:44:13.9529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d0651f-f329-47ae-1a3e-08de8c8d0b44
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB3415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_224421_149179_2C69C2A9 
X-CRM114-Status: UNSURE (   7.36  )
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

Currently imsic_process_hwirqs() only handles the IPI interrupt
(IMSIC_IPI_ID) and logs all other external interrupts as unhandled.
Platforms using IMSIC in MSI delivery mode (APLIC wired to IMSIC)
have no way to handle M-mode external interrupts through the
existing sbi_irqchip handler registration framework.

Route non-IPI interrupts through sbi_irqchip_process_hwirq() so
that handlers registered via sbi_irqchip_register_handler() are
invoked. Also implement hwirq_unmask and hwirq_mask callbacks
using the existing imsic_local_eix_update() helper, enabling
sbi_irqchip_register_handler() to automatically enable interrupt
identities when a handler is registered.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 lib/utils/irqchip/imsic.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 7559a069..6fd82688 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -159,8 +159,7 @@ static int imsic_process_hwirqs(struct sbi_irqchip_device *chip)
 			sbi_ipi_process();
 			break;
 		default:
-			sbi_printf("%s: unhandled IRQ%d\n",
-				   __func__, (u32)mirq);
+			sbi_irqchip_process_hwirq(chip, mirq);
 			break;
 		}
 	}
@@ -353,10 +352,22 @@ static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
 	return 0;
 }
 
+static void imsic_hwirq_unmask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	imsic_local_eix_update(hwirq, 1, false, true);
+}
+
+static void imsic_hwirq_mask(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	imsic_local_eix_update(hwirq, 1, false, false);
+}
+
 static struct sbi_irqchip_device imsic_device = {
 	.warm_init	= imsic_warm_irqchip_init,
 	.process_hwirqs	= imsic_process_hwirqs,
 	.hwirq_setup	= imsic_hwirq_setup,
+	.hwirq_unmask	= imsic_hwirq_unmask,
+	.hwirq_mask	= imsic_hwirq_mask,
 };
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
