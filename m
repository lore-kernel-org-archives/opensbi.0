Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7F7C531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HT9Ww8cHdz/zrmCtLvuLUqM0AQZQr3B+Tv6S14y6eFE=; b=uckQ0Cr3OtLsgo
	7/0X/4rCWZnu035rGwZPkamI4zV5e0s/tfBCxPottBP9SeH0SMYvPytBf052NMeUGqiYaxxwUMGKM
	mOw34jdJuGYCdGZadCEUihRh7Ggl6gTrbzpujeKN1FvrpohXEe+qssW/Lmb2X7Gah3xt3+8gBxMFq
	bjtOYtTrwtgeeL2PpOGJcdZzcuYaW0u9rbGAK4heRTxqagIV+VmU1A3fQeR72OogBXEHSmm4TBxWC
	u4+yjmx1JOkSVFsZlo/89qIkGVrCFoQ6r6t34JftgOg3wIGl1NnGO6gKtbLqp0mSyFPr0VPXBnV6I
	sclspuVdTZ3v4NXsl+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6N-00000003fa7-475T;
	Mon, 27 Jul 2026 18:30:59 +0000
Received: from mail-southcentralusazon11021109.outbound.protection.outlook.com ([40.93.194.109] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQ6K-00000003fY5-2SOj
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 18:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCDqRJ9QAycgn6F86UwiJjXKWy6XkfA9qkaguwJXvk2yEEQKPPaDeGzimtFwhbrAK3LylHCN507uLFKCMLXSY9n1UXpPpA4fK5NGlfig7yDPs4wi8o2Ea/GkQLs2vk7KoLh9uezs8PtLMKio5qjdREv0Lky6qgnOV87cT2AJ5M0NHZcGwiYjw42blm/FS73o7GeDkloPYAnTudkwUrzpaxQUnw/87anhJ7I4TiZR1gV9CcbLouhbozO3hhEbUdbiix2wep4XonBz5hQBz8m0ioktwLPQgDNrOpEBxAjSGWlpvPlca5as3sAjJfJaL0l33dxaKtr9KwdmdigmD05dnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uvo3b/0BUMYHQSv9AmuVoWb4LNWIXlSJ6BMNExjORiw=;
 b=qvhho//zia9di74XloRnnNwoU9Updv2oEZFB0gkiOIBMPmJSm1laDac6IZdrVuX1RgZRTAP03s2fKY70HIVQm/6ESe651CbtEgnxTVfa8wnOSbcFFuUcFhCLmKp629qiCniJoWvncbIOwVVBuVnHUaz29OGjEdrgwLF7VqVa/mMwoFkniSKaQwasg2wR6kIsJ+cehxp22UV3QWMjeawa4Y/0NrV/mwav8+wTC7/fWwZjh8A0O+AP+HqQLL6p5ch2d8UvE2AOZb19/X/PbRpbY9z08L6rpE7iK8+aqNqp7jHsyQBAkhZMeWgHfZSgJyIVU3tJqI6cFNDgKBQriPInaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uvo3b/0BUMYHQSv9AmuVoWb4LNWIXlSJ6BMNExjORiw=;
 b=t8VLgjr1ggffxC/ZyFibEajf9G4RmBP1W/XaZzFEhtWZiOVJj+T1IpAi0nBApaw5UlXdvFmn2aBLctGrW1/9QJxXEdBHfjCaUg+NCMphV2qH4eC5aPOHHY0yDxMrlqgeHZ66AYBVp9Ex7Vv8q9yv7NvmDU+Bo7JD/txOsalRIb/VpkFC4E4rDhg71PuVHnm8hBZktMYJ9mn5lgzJsezSTiJ7nMlsQvMDN7xpGI9c7s//+R8ZIbUMwVpJ6BtsETZYS0mLzc/TGUdL/wBJ/CBzcYitxVpDiKYfMAU+9XWbkejUOFOx3V8EYnXLlWwtMcwlbX+yOa14BU9JDNkWiG7P5w==
Received: from MN2PR08CA0020.namprd08.prod.outlook.com (2603:10b6:208:239::25)
 by DSVPR22MB996736.namprd22.prod.outlook.com (2603:10b6:8:45a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 18:30:51 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::91) by MN2PR08CA0020.outlook.office365.com
 (2603:10b6:208:239::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 18:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Mon, 27 Jul 2026 18:30:50 +0000
Received: from davidAhead.lan (unknown [10.8.0.39])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 754EB8000D;
	Mon, 27 Jul 2026 11:30:48 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 2/3] lib: sbi: dbtr: return SBI_ERR_BAD_RANGE for invalid trigger index range
Date: Mon, 27 Jul 2026 12:30:40 -0600
Message-ID: <20260727183041.258377-3-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727183041.258377-1-david.garcia@aheadcomputing.com>
References: <20260727183041.258377-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DSVPR22MB996736:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3a96e0-dcb8-4c1a-a028-08deec0d2f9d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|6133799003|56012099006|11063799006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UDLaSBrGhfTvT3X1ENEW0RWVO+u9x1/i3glTmrnMDiRcK+wE9zXRuHyJZpLTojWCVXLEt7SZ8Xz3uMZ18CFskufCYBqKsZWOEtDRn4yi4I6yZEr/xUiRJAnLfO9R4VohRC5rT4CL8LbtuCb0/0/vODezZN03QvOQdeXXmcLaFtY1yb4L7BkPp1MPT1KQnqVJWilhFomZDd7qOQJh9m/P7Y23k//zEOCIovg0j8JJhHRque8bdxpZkFKaZhhViIOkkybtyRVPM3V9xBoO65DzlnP+pnIj4sFyd5jDc0VhFFo9rwcxuxdp1a5s6v0FFmEshcsjAlhoVu99wsgDt3qfXB7/JlOME/9LMhMnSHIUvid9gGbwOZ7vQa+DBQ7e+Sc8rsGUpD9gVgSz4GRBpkZcCKAG2GppM9OjypQk6zJpKrx31DLI983nvIi2MX41jPlNRUhmnhbmQrD2k7nvqKwutsm4vpyIJYYRfZm9o9nNIIfXkhj9nZt0OiWn22Cw+gMq+sgYTFIqQfYK5UeuiUOnxmBAsvd6LVX0kAsLs0MaRCNW8CezY6DshGFtxc2rxqfcJ1FfiPSq2yd92L0QNqlambToZo4QXiygdwKykicCkehBTtVcob2NNdhTVDVYwLWuQyUZGT92PI5b01pDxiuEi0PDqLY7Z8VSm1arB+00MzTB/+maCIC2FBcoAbQkcFJTsX4eBubclgh5FKIr5RMI6Q==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(6133799003)(56012099006)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: idoaf8M+7WILIR7KzaGch3Klt5wO2cqHUqUxUFvtPPmbku0ul+5hFcO8WPX8WgUZy1+DRBcMs/yiRHCFomvd7ZnUDgBeQ45kLaxJRMiLlxy/LUhHK1MyipA/sehYIm8zL/E2Wyg2YW+oFILPYoYjINqgT+l2bcVG+38iHN4+lWeeWrknoF8sJdEGfa++WbIWKVTZYvc8Udx4eCqbQ0Ivsxd0JgrtOJBDTo7Sw4NhI8UmGS1EhTNv/Y9eVXbyT9/WE3XxKtvSmWEa9xyGhL9CSN5MgF+HdBpBEMxc68ZpmEkld85f9NV2rDuH+t98FML1lWOhe0Cquajs/1gcyT/71l/HtHN9sUdyd1UtzGqYrShyMXF6GD0X8yiD1hMHHfVccj/7p3JeZ37tKJJ/uQmvFEzcc7CQjkPrrzXBOo1RSyjDn2y4NKW4uFm7JCio5fmJ
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 18:30:50.9292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3a96e0-dcb8-4c1a-a028-08deec0d2f9d
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR22MB996736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_113056_624300_984640A4 
X-CRM114-Status: UNSURE (   8.48  )
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

sbi_dbtr_read_trig() returns SBI_ERR_INVALID_PARAM for an out-of-range
trigger index range, where SBI v3.0 section 19.3 defines
SBI_ERR_BAD_RANGE. Return SBI_ERR_BAD_RANGE, matching the equivalent
range check in sbi_dbtr_update_trig().

Fixes: 324021423d06 ("lib: sbi: dbtr: Fix update_triggers to match SBI")
Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a04f367d..d06fcaeb 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -650,7 +650,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 	if (trig_idx_base >= hs->total_trigs ||
 	    trig_idx_base + trig_count >= hs->total_trigs)
-		return SBI_ERR_INVALID_PARAM;
+		return SBI_ERR_BAD_RANGE;
 
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
