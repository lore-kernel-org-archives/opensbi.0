Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B058710F3DD0
	for <opensbi@archiver.kernel.org>; Sat, 28 Mar 2026 05:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8fPDd43F5OCPwDM1b9YNTapeNgyX93/eEDzB2So7E8=; b=YGNs7C/u2ejDNW
	B1u+30WXUN3NbU9YPiZsjeJmpa36OZGzZy6ZxruvCg0A0aFMFTUbYcvk5Dx3T0Ahwl/wvReir6Pel
	EJDG6Dv+K781BHMdWJ0Xf6PAEPsr9WRirqSrrY3Yk6oadeRRjfLwYhYcw6rTSapmL+tPDrdtHcIzB
	LeJABrcYmGzp/ogKrx8B6A0aRdRFL6AanufaSqQ1JfVvRREClNLAuXtuCWYr7/SO67Eant+jmu1AM
	IlaiTuW0jE+FJEJdC7DxpwUke6TDfzp/wSI0rksfXmoMu1FLxRe26rCXcnWqn6i64ShxjfLl9VeVN
	0v7jePlnm9FFLrkuT+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT8-00000008bNd-2gVQ;
	Sat, 28 Mar 2026 05:44:22 +0000
Received: from mail-westcentralusazon11020122.outbound.protection.outlook.com ([40.93.198.122] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6MT6-00000008bMK-18AV
	for opensbi@lists.infradead.org;
	Sat, 28 Mar 2026 05:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ozl/3qrWnyOpUlCfhlCUpBSoPZ5tBOaSn4ZoaCb2BhfhGisFWURtEVNd/vOPqYUk4uQmXl6ldQ+gFgC1SC2cI82NgpUVEDpVJ/oUNvaTpvzYHiXpC9/7mXEkOvW3fwZ8Iwl87lCyO2QV9V4SSCxqZu3WduvLTkKvroVfjGKeYtu9c03TUaOyBpJeJpVar4rUXju8fgtI0217CAxfBwiFtSOqaB9hlDYQ2i2Holiqsi45HGj9vmAJPBlL/oxE+McDQp36GgJgz15sX0A1V8MCePF5hE1++w5zNbtEB7uugZgXx46t70or0plXOkp0LRf7avhTPmq6PdfjAZCi2uXIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULufTU5Agwm5YNUjO6+QXi7QsuMev/ZjIYwX9P/mxYs=;
 b=vU6n56sQloOMNU3nQVQAND841Mmz4zWS3kpT4LwJXfI9MZk3+03uQYI/EaNTl69BqTNdvyFUy/AIPduMVyXezRtOic55bVbd5N55ujypKdw2QHJrLVGRwBHVwqs8msanC52x1Y6JEMrPb7DT3Sft3BrdcQ0QbfRq4kWmpdeTeONxbZQVD/KueCqGCGT83Gg1wnFgEPUH69QgCo7FTWIYvfruIxECzWNEzPH0EgWKOqkCmLWcbjN9W0UidhktAuHBCo9ohWDJ6KOkcW3IQBuJCvE2XmTnVQZYpjwS+j8lIzOzuNn2Xkng0qLdUIsVx+ctG1MgE2zvoUNP3JOK/GPkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.45.236.54) smtp.rcpttodomain=aheadcomputing.com
 smtp.mailfrom=aheadcomputing.com; dmarc=fail (p=none sp=none pct=100)
 action=none header.from=aheadcomputing.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aheadcomputing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULufTU5Agwm5YNUjO6+QXi7QsuMev/ZjIYwX9P/mxYs=;
 b=H39NykCrK57D6DedP2ZDXaicU9vikfzAocv+6uC0zNDYQfKpu1xSqAi6I5NLXfZ+AaY1V9rAiRYMeGPPJm6hTR1REqPjtDiraiz+yd0kwijN0SnIoR68JXZHIndqKLmKLDuqs9G/PZRHQ/I2KHH11fJrJ/m1HHqb770Bdl3/zOJozqBuWykdpyE4wwZ8uwQX8lslC9M4B10EKnKvq1sTEtv+uwtW4hYymHY/KaiXjJKCU7yg7ps7Luq7c44036mpSF/13KN8X/4fPgRw37b8NPwPsVs+gM1r/0xJHbBe7G1cA8LC8GFllf4nM6xwZ78s+EQwkD0oCXJAf1JPVrWQJQ==
Received: from PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::7)
 by DS4PPF3AAF9DBF7.namprd22.prod.outlook.com (2603:10b6:f:fc00::b13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Sat, 28 Mar
 2026 05:44:15 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::b1) by PH8P221CA0031.outlook.office365.com
 (2603:10b6:510:346::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Sat,
 28 Mar 2026 05:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.45.236.54)
 smtp.mailfrom=aheadcomputing.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=aheadcomputing.com;
Received-SPF: Fail (protection.outlook.com: domain of aheadcomputing.com does
 not designate 50.45.236.54 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.45.236.54;
 helo=mail.aheadcomputing.com;
Received: from mail.aheadcomputing.com (50.45.236.54) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Sat, 28 Mar 2026 05:44:14 +0000
Received: from davidAhead.lan (unknown [10.8.0.9])
	by mail.aheadcomputing.com (Postfix) with ESMTP id 69D9780AAF;
	Fri, 27 Mar 2026 22:44:13 -0700 (PDT)
From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH 4/4] include: mailbox: rpmi_msgprot: Add RPMI performance domain flag defines
Date: Fri, 27 Mar 2026 23:43:47 -0600
Message-ID: <20260328054347.3706029-5-david.garcia@aheadcomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
References: <20260328054347.3706029-1-david.garcia@aheadcomputing.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DS4PPF3AAF9DBF7:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a85e42-1de8-49f8-41e8-08de8c8d0b81
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|22082099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: qCgsOu/VOFazh3vfmNcpsYiObxHHv8rXxQwHiIAi42kedqrwIPbb6cEdEGMDv+4f5TKlFYjyUI+3yqnch3z/zpFHxoL7Jdntv+R3n0IC6G3Uhl5VfxS3plcZijCr++e+wwx7o22MwfSXYo3+w/jI2K4ShQWJPqg+DzBBYcq1IM08hzXErXogxgkWG+j4nu5GOWxKUnZGX775osDTtVUZSB47GzoKpk5m2UWx5awkaMkXrZGj/aeV+VCYeYKV9PE0XauKdf9Bw0IVPEZo3/oQCUrX6K5Q6zZ1oc8HvNJGuFVfz0q7OncZLjRB95aiuTieam/nSr4KBNsWot+YjfC7rdQ03E+07rwV1mviI3lNEhWk1LYVlzIDb1ROGwzGld1pOtiWCV4IquDVgUmJXG3kMt6oq+Wue0xz1ryGN8+Xnn1R4L5RdoS89UQ3VSIXuT7MVKD7k+C1Urp7N8dfz5FWQwiK43HHDR08uEnPigCh2/TJmiF+xcMh0MJdPKf5LfKwlJ8UdAlIWf02uYfhUSdtWu0fK47aw9v6tmwgphucDBCRL3IYjnQYjASjhLfXGwoEUAmAQyCY/6Zw9QBqtaiLe6xI1oPDNjY3P9Ne/2ds54AvG0BeGfmqElto83GqMF2sajsQzAECcaS3BxRYrgxE9YzEKdZvz4sjrSdh6dH5rWfChoTv5GDiY7abAjiqb6b5bWP8Hq0hDUDnLQDclI08ch1Geg30cSi+XQE1MxrY4wq9apiZX5MDan+oydOFtyQG8v6bPffqg5q44CpezLzMEg==
X-Forefront-Antispam-Report: CIP:50.45.236.54;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.aheadcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O1yUcfv01jzUm8cjFwFWA1Nx9WzvvefBmL5LWyKuzaK8S6QYz+M6zeLdG7q/Rj8BEQ6EliWk29YCrkyGTM1s2qyCuaJkzPOUAgwVtHqXh4jx9BZttrhja3RVf3wqC8vpfKB12KBFdZAjuv3JIj8ejjQA5q/fBJUTT2NVsJoSuXFI/snJ7by9rnciO8hoPO7n5GgS/ZQiBPlW0QKnbf+q7PAgSBnPbB7oFa3nbxe5SXJ0qw2Hx+jCgndx2tgCKcJMtBHd8XnXcBpP4OzHXFRQFHKD7wr/COLDEByiGEQJI5dSbUoe/glG7eX1PeK8j2gvMf0zO4A2KZ1ZpR6i1tIrMBibnSWYgsnVcI+U9WECgIt8qXbC+rXsOA7K1WIonp1z1kt6KJY3XBXca8UsEIMzAw9vPGaXr/Pz1XOKkpBNagnbvLvTwwrdG1M04UYIODha
X-OriginatorOrg: aheadcomputing.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 05:44:14.3893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a85e42-1de8-49f8-41e8-08de8c8d0b81
X-MS-Exchange-CrossTenant-Id: 53cf747c-7b8f-4d06-8b1e-b22383a3fabf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53cf747c-7b8f-4d06-8b1e-b22383a3fabf;Ip=[50.45.236.54];Helo=[mail.aheadcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3AAF9DBF7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_224420_310684_C9FADACC 
X-CRM114-Status: UNSURE (   6.50  )
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

Add bit-field defines for the RPMI performance domain attributes flags
and fast-channel attributes flags as specified in the RPMI specification.
These are needed by platform implementations that provide RPMI
performance services (e.g. DVFS controllers).

Also add the missing db_write_value field to
rpmi_perf_get_fast_chn_attr_resp to match the RPMI spec layout.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index f8b16753..7ce1ca9f 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -830,6 +830,23 @@ struct rpmi_dpwr_get_state_resp {
 	u32 state;
 };
 
+#define RPMI_PERF_DOMAIN_ATTRS_FLAGS_MASK (7U << 0)
+#define RPMI_PERF_DOMAIN_ATTRS_FLAGS_FASTCHANNEL_SUPP_POS 0
+#define RPMI_PERF_DOMAIN_ATTRS_FLAGS_PERF_LVL_CHG_SUPP_POS 1
+#define RPMI_PERF_DOMAIN_ATTRS_FLAGS_PERF_LIMIT_CHG_SUPP_POS 2
+#define RPMI_PERF_DOMAIN_ATTRS_FLAGS_FASTCHANNEL_SUPP (1U << RPMI_PERF_DOMAIN_ATTRS_FLAGS_FASTCHANNEL_SUPP_POS)
+#define RPMI_PERF_DOMAIN_ATTRS_FLAGS_PERF_LVL_CHG_SUPP (1U << RPMI_PERF_DOMAIN_ATTRS_FLAGS_PERF_LVL_CHG_SUPP_POS)
+#define RPMI_PERF_DOMAIN_ATTRS_FLAGS_PERF_LIMIT_CHG_SUPP (1U << RPMI_PERF_DOMAIN_ATTRS_FLAGS_PERF_LIMIT_CHG_SUPP_POS)
+
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_MASK (7U << 0)
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_SUPP_POS 0
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_POS 1
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_SUPP (1U << RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_SUPP_POS)
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_MASK (3U << RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_POS)
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_8 (0U << RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_POS)
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_16 (1U << RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_POS)
+#define RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_32 (2U << RPMI_PERF_FASTCHAN_ATTRS_FLAGS_DB_WIDTH_POS)
+
 /** RPMI Performance ServiceGroup Service IDs */
 enum rpmi_performance_service_id {
 	RPMI_PERF_SRV_ENABLE_NOTIFICATION = 0x01,
@@ -941,6 +958,7 @@ struct rpmi_perf_get_fast_chn_attr_resp {
 	u32 region_size;
 	u32 db_addr_low;
 	u32 db_addr_high;
+	u32 db_write_value;
 	u32 db_id_low;
 	u32 db_id_high;
 	u32 db_perserved_low;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
