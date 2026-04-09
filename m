Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF438F31E25
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MN8nRUJUsTyZBpsAyJl6aB3U8/iE6rzmRRcMGRMRhSc=; b=vQaTKRlJAJz3LT
	myUzxk9RdAPr2oTB/DJzY+Kck2EPRpO6oiR6wzjH4T9wz908+JEP2s2E641mDJnqv0bWP5dhM86Fu
	cIcwmO7ml/2VQkJpMVVOoaWr6A2WG/5jlHgqGylatdQDY8viXHxD5o7QlsMX5o42WW9aESxdPpniK
	hliCKVJM4wKJknXYCTRWTiCKXLMMfeOUzeMxwFU23M2BDpxBh45uygJ/dKrgeBDOGfFTyJtq0FDpd
	DZkWC8M9ocNBSGQfCjtfKW2H3gGWni28tG8bptxokJOVgCA+SlDCLKPC74I5UjaC7Wyd2s+izKsCG
	jXxX7uvS0aoPJcm4VtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqp9-0000000AkNN-3hU2;
	Thu, 09 Apr 2026 14:57:39 +0000
Received: from mail-southcentralusazon11023113.outbound.protection.outlook.com ([40.93.196.113] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqp6-0000000AkMS-3mmo
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 14:57:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYa9OgHtO7745Qa9In26ZhmMf9LGgzlpoX9WDPWnblIdZDddhXJPJuzK2M09ms4OHrmTGjLBsR8OIyunYrfQ0FDoS4j4bJKnXdonCmSdya95NCCor/KHK8T44mK8GSun0V5V0MMBl9W3O0K9afZvnWTM9QLCK8h7U7A/KIhfTz4cuYcWKABBh68oTkAUey6YzWk3IScxlSyZnJ8bAFWe4VZ7AYKPmQgcrgoi/zM90Zz97a/nqq1BmDXqkI3IKVt6qR6eSoOxYL2B1cc6rdVWUEsFqQrBQ65BkCxIbTc7Pb6JLJAwfG4+jO/MsmlYfWPkjFwjDHkiZ/DgyZRXqy+HcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDQDKl5mKLR011sh5CQtdgrwx3COHb4FBwfyPx4uipY=;
 b=NmGYRUDX0tUhzU+q9eh/2bGJZ3pI7to8VXUAhhMIvuYowbN+tHKJESG5yPBv8LnqHEXinMU9ovGOAW8vVUgBun46+qrAU0QdduAtTLFOlDhZookLukSxHqzx67phSe1l6G9RY+wxcIC29sHq4Nu1/lsP40TNRM8oL8bR2mtY8Zh1B6sBEN1Zt1EgC0QHoG6Ps9LrmtFhj6pNt1R9Lwh2pXU8J8VQziIW7zHQnSaatT6dBDmeKB0yI+nWhBwL0Y5rj2EmZThWEVRnq9fZeg3RAWQhbNMtV3s4Gs/5GqQeqdce57Hs6Gh9SlKGLVQ8XwVgMKDmYstGWesIhCKs9NoAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDQDKl5mKLR011sh5CQtdgrwx3COHb4FBwfyPx4uipY=;
 b=z9UDtBOTtcvXv6rrShGEqmky0BNUJngmOiJgBcYQ9dMsZk3RzujDFW2Qn1VgawyFUqB4pMBKY9wJb8gjjOBGbiiPp7Wr2aNBwoDy5YutdQecXQRkcadATwGZQnF61+JWMSvAwkuxmZy5jjL+RX4qkrB4myG4UoAqBsF91hJp59rjmVYEvAx5GP1Q2SnbZMaygh/cUWN3ZOvgBfCGh107uwUAWsdaajDaQVNLjB+m6aD0FnNaAZxIsAU36JLqnrlrHZiT5oiaGRUaXQiI/CWRT2W9t3txU5cOf5dlAMrnWsCW0mQ3mw769m0q5iIT9EFQMS6F1lgNPTfQyalnkawEZA==
Received: from BYAPR07CA0104.namprd07.prod.outlook.com (2603:10b6:a03:12b::45)
 by SA1PR22MB942330.namprd22.prod.outlook.com (2603:10b6:806:4c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 14:57:29 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:12b:cafe::ba) by BYAPR07CA0104.outlook.office365.com
 (2603:10b6:a03:12b::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 14:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 9 Apr 2026 14:57:28 +0000
Received: from davidAhead.lan (unknown [10.8.0.20])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 8478380FD6;
	Thu,  9 Apr 2026 07:57:27 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 2/2] include: mailbox: Update RPMI notification structs and add Performance event definitions
Date: Thu,  9 Apr 2026 08:57:16 -0600
Message-ID: <20260409145716.2611852-3-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409145716.2611852-1-david.garcia@aheadcomputing.com>
References: <20260409145716.2611852-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|SA1PR22MB942330:EE_
X-MS-Office365-Filtering-Correlation-Id: d3055d3c-d0ed-44aa-4e3d-08de964851c5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|55112099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4lEQvSMD3SG+VxkulONpADqBVAcxuZ8s2G116NZnZTMEAiXl06YoYyh4J6dzQ3V90QcaclfaI8uHiq2cGrizpCLuRi3kLh54W+Rps6BQAx4284FCsjpMHRXpQl2Do5PZKvVRIa0MQpm4T3qSRdnNEb9TRqjs5XWrMt9ktcovGTzJvnRhXB1BorJmPRp93J+ZfmmVxJ4qq3erzu6ed0usJLHatFeevk7WhB3pd06lT7Ue22919q7dqdzFN8/QMpCXJtsPu64/GCGWfw5OVmblJjiL/APCED7MK2xKyOTxT8+rRAqGQu7RABWWl+1fkdF92vnrQujVLkxUbOfkEWCt/rrzU+kuWB1ozw2YpaahB/1WNlc5on4nhp/m+7tqrPZYEyKBYuUYWyVyDB1uHHksFkIGkSqmHKhFn4ypPiqmwposbQGggBOsduTX7BSiFKdTS01S+xJOGfOMvh6v6fvdZQqgTe7X1sD19CvrFYzis+kMk3YLQQHP1Ncskc3v67LduKXHJRK11XJCOoCHelmbLsy8GPa3LwMMZDelPa0b1PMJoPhIF7LbJ1aPiNZLTLPQulbC2EqP7UwJzSi2JiegvEYKXpHthdwonYHjeNqWKWJBWLYHLx7KWgyLcLzIqVJ8a/Jf1qxhr7aOfLqQRsglg0OO05jY/6OX9V4pMYaZL9TAfXgDTYfoIuPS3UxOaXy9nHW6elF5c5Ia0qLmAjQEduNEC4rjf14G2dXyjca5Niph34KkXUdgavjtHsS4+PIa91Xkh0wnf3bID39Hnu4xnw==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(55112099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nBrJ74tIyJNYNM6B5457GdiGVbAZFQhwmzAF7fS8GeXuJKxoZTgtQQCaV9kPtxh33BlZEuZ9QN3olpZKqMl6YKqkHbWUDcfJyu6Jtm3LHwaeELYUMbxIkWaApBM+zDiLY2Ju4IHjdBaCmUESCng9X1Lq1inyRj3k8+9K2v+PaWXDd7s5R4eMZ8WP45W+CPjFesstIkAakgwkhA+Cua6g96JggGqgHSxNkpdTlLMqSlMaO5gTEEBuziHlU1qkxBn6jpvH2hhtqlmRPzGajwNOHe01r8ImWm5Q59mJZQ2F3GM0b6wCwkr1QjRvq44HehX9+tDQYq8FgaPxhgQNpUNYoTzZD7hyrCqBhDeBnZKCe6rCEkKrpgyk9g7G7SSHduBL94dTHUG1AlIIjZiRQxPGeFU6cMdGmKG1osxn4c8NVuCiUzrIHnMcEA3Fled8rauc
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:57:28.6190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3055d3c-d0ed-44aa-4e3d-08de964851c5
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB942330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_075736_943464_507DE0E3 
X-CRM114-Status: UNSURE (   8.87  )
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

Add RPMI notification header size and offset macros, and event header
composition macro. Add rpmi_event_notification_state enum with disable,
enable, and return current state IDs. Add req_state field to
rpmi_enable_notification_req and current_state field to
rpmi_enable_notification_resp for RPMI spec compliance.

Add notification event ID enum and data structures for RPMI Performance
service group events: power change, limit change, and level change.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 49 ++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index c35788f0..8526ace3 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -87,6 +87,18 @@
 #define RPMI_DEF_TX_TIMEOUT			20
 #define RPMI_DEF_RX_TIMEOUT			20
 
+/** RPMI Notification header size */
+#define RPMI_NOTIF_HDR_SIZE 16
+
+/** RPMI Notification header offsets */
+#define RPMI_NOTIF_HDR_REMAINING_OFFSET 0x00
+#define RPMI_NOTIF_HDR_RETURNED_OFFSET 0x04
+#define RPMI_NOTIF_HDR_LOST_OFFSET 0x08
+#define RPMI_NOTIF_HDR_RESERVED_OFFSET 0x0C
+
+/** RPMI Notification event header constructor */
+#define RPMI_NOTIF_EVENT_HDR(eid, dlen) ((u32)(eid) << 16) | ((u32)(dlen) & 0xFFFF)
+
 /**
  * Common macro to generate composite version from major
  * and minor version numbers.
@@ -232,14 +244,24 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_VENDOR_END = 0xFFFF,
 };
 
+/** RPMI event notification state IDs */
+enum rpmi_event_notification_state {
+	RPMI_EVENT_NOTIF_DISABLE_STATE = 0,
+	RPMI_EVENT_NOTIF_ENABLE_STATE = 1,
+	RPMI_EVENT_NOTIF_RET_CURR_STATE = 2,
+	RPMI_EVENT_NOTIF_MAX_COUNT = 3,
+};
+
 /** RPMI enable notification request */
 struct rpmi_enable_notification_req {
 	u32 eventid;
+	u32 req_state;
 };
 
 /** RPMI enable notification response */
 struct rpmi_enable_notification_resp {
 	s32 status;
+	u32 current_state;
 };
 
 /** RPMI Base ServiceGroup Service IDs */
@@ -846,6 +868,33 @@ enum rpmi_performance_service_id {
 	RPMI_PERF_SRV_MAX_COUNT,
 };
 
+/** RPMI Performance ServiceGroup Notification Event IDs */
+enum rpmi_performance_event_id {
+	RPMI_PERF_EVENT_POWER_CHANGE = 0x01,
+	RPMI_PERF_EVENT_LIMIT_CHANGE = 0x02,
+	RPMI_PERF_EVENT_LEVEL_CHANGE = 0x03,
+	RPMI_PERF_EVENT_MAX_COUNT,
+};
+
+/** RPMI Performance power change notification data */
+struct rpmi_perf_event_power_change {
+	u32 domain_id;
+	u32 power_uw;
+};
+
+/** RPMI Performance limit change notification data */
+struct rpmi_perf_event_limit_change {
+	u32 domain_id;
+	u32 max_level;
+	u32 min_level;
+};
+
+/** RPMI Performance level change notification data */
+struct rpmi_perf_event_level_change {
+	u32 domain_id;
+	u32 level;
+};
+
 struct rpmi_perf_get_num_domain_resp {
 	s32 status;
 	u32 num_domains;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
