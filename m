Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB29C79F89
	for <opensbi@archiver.kernel.org>; Mon,  7 Sep 2026 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQBl4AHcQcRfVKe7rXpMiAfgXNZ+Lfih72ROMY8STV0=; b=Xg89AwaYu1UT7K
	nTQL5cXje4mkMiaWuDfU3R6swkeG+4olJ2hCoMsqiMhjN5Wn+SRU1dm0thnNlSghbCTGsqWn3KShP
	UbuQLSEedfsHzUwP/5II7FKGILYNiDmMxIpSBaG1JZ207NHGeRdj9h4O/Efzbof7hjdSdWKam/50i
	cP3AG5ruCn/lU/ur5sFdbcADO4t8+vo6NubBsxtOkgCEXqaHz9EKPHgOrB/G5IdZb1hs8WcpD/8f2
	R0gLGwMxHU3deiv1GBh5DFAKgY1FWDWCKRVSdnXhAfxhIYCTt9NEUSFoFSZ2g8lstBMAvBJl0V3LG
	d6mp/3TiaIBVdROKFVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnS-00000006hXI-3lkM;
	Mon, 07 Sep 2026 11:45:58 +0000
Received: from mail-francecentralazon11013040.outbound.protection.outlook.com ([40.107.162.40] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnR-00000006hVS-1rrK
	for opensbi@lists.infradead.org;
	Mon, 07 Sep 2026 11:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ra/T9Uh5P/Ru3S1vk21sbEAeQyNc4wrqidB0uZAJrcWlMYOermoxYjVJeykxXz+r6Uqv75ON3b9wWAI880A7aFawSfEelZeQDdqu65d0vf8aDF1fHvABJjo1Eyr+d1XE5wTwEfYZWMzl0sc3zLwRCQ455/II4lskx+sMtgdcp6zpvcBK5LKAXPxjywJtxd0mqknTS0xL2QqqLZHeXYQIT7yO2WUqzYBqZawIJamRNeGqD53dMNWA7ed7h0swzejSINWp9XFzxQ+Y+exthecGCMTXk7KUKu8bY9mG/0YvYo12xvJNCXZy8GeTzEkB4BUHjRyyhcg0WgSPxtJzm6ZMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMdTdn4rhp/3DxCCA7t48nT4482ig8lalxhRqk5ShAk=;
 b=NdVxNT8muCnCijTW78ztRuxQgi1TUsFdRUUL6aOPYm1880y+9gcjxtd9yJ1lAUkv+Qo33+1Oz8/8ZscAiDddEsyyDAySs72s9TGwczP5mW4/6/J/EeUXl2tEWuSyjZ5RmjHFwxAWiQEV4fXVBwhDj803B/asSWLRn9qnG5wjP8/jkIyCALoYXPqJoZ4bl8QVvUSdkgAzVx+epoJEt7IGDLv4vtGxZCrcJm/44lOXCNdhvF+cf8GcVub87l2ojiI7bM42euz1KOsups3WA0G6VD4xIo+Vfi4uLep8awn2myd3EA2HhcrmHNGVppfv44j0HO5HWKRWTy1f2SoQqS1b9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMdTdn4rhp/3DxCCA7t48nT4482ig8lalxhRqk5ShAk=;
 b=iuwRRXMPapGLLiUHTHJOCEumx2n/Pju3g4RNGVhoTOf5qNQyr+uqhJLtIQezkpqmsBYujaPguVTWsl49e/zKD/zYkqsW2MVHWhKu3sgc4tgMjj8hhkNtrhJ69J1QdL4ftodNYKkS3B2XzTPxmgHl4+/KP6wpHa0Y8NW7jckCGm6fR7ftvq+hG1rrbQ3j9NG8bKeD28W9r2n1IJydvoljVy9KpIWACihL2FiU/ZvnKJnSVUYE/wjuUMuO0IplXRlWPiu2amSYC6yn/QSZnlLfcxsHq3qGPGmYeNDW9Yiauk+zaMIRBRyN+euC6YGnziItE4XzYIAae66yHNWwuhwSeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DU4PR04MB10575.eurprd04.prod.outlook.com
 (2603:10a6:10:585::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:45:51 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:45:51 +0000
From: marouene.boubakri@oss.nxp.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	ranbir.singh@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	maroueneboubakri@gmail.com,
	Marouene Boubakri <marouene.boubakri@nxp.com>
Subject: [PATCH 2/5] lib: utils/mpxy: Split RPMI message protocol attributes out of the mailbox header
Date: Mon,  7 Sep 2026 13:59:10 +0200
Message-Id: <20260907115913.101752-3-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
References: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: AS4P191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::14) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DU4PR04MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 110b2ba6-2a41-4ca5-66c2-08df0cd590fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|3023799007|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jI3P5enQ9efPrnUn2K5HEbVMUxxBOBbdTD4dugksYzL0mUeXOwSOsPDNWdckvuPyP7xJudD87lRy0Ol+kRSWsXCH7X5r0DCVIT2/RHV915+VjqnPn9CLR+xDGBbqB7oueanr/s9mh9UOBeMkhKuuSJiDemV6ZpSmcF1uubPDVQIGPnjiUPKTRTi2MrL6C8HeYypy4YnTat16S2h0KWuJWgpNjfprpMZOlrp4lU0qYVW2530SMzfd9X3LhqydQrm7COabElrNa/SwoOqoxKCvu1BI6RiZry+RHI0eOR8mhr+tRGVwy5vMfHgQsQhgUajm+sMUkGvfykvSG2qWxbMJvMZiRb6eAYQHddUkMS1lpHKI5UNBt3xKHmuWT53X2yzA8qVJGh0jfLREv2QcqDgXVZw10eaFO1pjPr/O4nKrE5mXQAdNR3eiobK5A65t7ooUfIj9hGePcj0E8BXnYfQCzlzgbXu5L2Dx+UPJCg0KCwvXVQ4WO1unC25MApKcLr4vqds6HiN+wQOJqhjwWkhAMEyhizWu49XU1OSaur/hHsVT4z9k6VOB0dKQmYBI9IIQQLwsVoDZVQrai1NTTE8Z2Khat7hWGBp/uiyo4QrZyW4Vv+Qb4aRRtJhM6MkEc5VzhKR2AZVMfJiv3jOeRV9hXKx6PmtuZMkJcNKVj8XR7Ok=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P4hcIO1wMtW8lJYPtnXw68M7Jyatp3jAJylkB4TgCRbH3FgncMVBYxtiQ4a5?=
 =?us-ascii?Q?nLpT6JLmR4Vv5zQBXFyqaPeApn7KqgGfNFkg5tAYs7bvNbgAUx2pJBgZJIzj?=
 =?us-ascii?Q?eel7h4hXuwek3BcFameOjqntaLaRuf8npTOGnRrLQrUhRYP/9qjwdzAZtzx5?=
 =?us-ascii?Q?PNadm6AeDZNkS73g42J3mW+2qwx5q6VKxL2J9vAJTxpwpCJtVV9O91/WEaHX?=
 =?us-ascii?Q?hjLBzkndbCEnLGuVqpdn/wSf83r5TiAz2wOl+rIYvD9Z8xaqt0sq28Bb8kSE?=
 =?us-ascii?Q?utbjM4Uz27+Xa/DKe8l5MJjEQeV780rNSpFrqkGr6qowz9bLCdwTUmVnjx/y?=
 =?us-ascii?Q?OdOF+6wFj5ETA1Cl6TD1rhRIQkSgXlAuVk8lI1prCAJd1R/QfI6fntScGL++?=
 =?us-ascii?Q?GH7In0KpVDRga4RniyZL1tAVd6Cw4R0GID+0pLCWgVlp7ApOpNCF81fqatjk?=
 =?us-ascii?Q?1wBHVf58hPMrWlfaYUBcU8pkxBT3awYHz9yqbtzCAaANPK6uuHAJrg4Zxmjp?=
 =?us-ascii?Q?kSmuhcOQeC3TbTxbBu2W/NawyS6B6ipu8/BZBLFv9uW4cCwnEe6jogw98VUJ?=
 =?us-ascii?Q?3ohn9sVB0Hu0q31SUda6G0sVvSsQKE4ODo+PcMVCsO6JO6ngRDyyajzJrSJ6?=
 =?us-ascii?Q?PRyH9TqOvxI3Vlc1g3vvW7q9SFSX3a+IYXSPUFwIxEPCz4oWLfiUFiLQj17j?=
 =?us-ascii?Q?XjfLMLztIx0hxepGjoJ2h6Ak3mHO3CA1R38urgknMXZUrB7urh3WxrWR/oS5?=
 =?us-ascii?Q?j1upnJE4Owcy4L9nOREGukaC7MpSmNbuTepABF3KOo/V+QP7CM7E1tAHZ1ki?=
 =?us-ascii?Q?zoC6OsYwLKZJxO12D7aFjRX75m1CprHesAIDjPWT5y45NWbtnp+59lsv0Pz9?=
 =?us-ascii?Q?X8OyCeFbgLe/s62vf6piPRH5k9OKu1GrayXq5UrE5ax7JBRrp/U8R4khIkbn?=
 =?us-ascii?Q?l1MvMfiXav0Tc7KXQUzARg1x03QGjQgc9XybHpPuSp16dkcL3Z41tzEnnEuo?=
 =?us-ascii?Q?1vMmImzOrOYX0WOLCCbTyp5hhePbebTrUBwditpToWJBOztoiCkPD64SbZpF?=
 =?us-ascii?Q?1NIJqnt9heh+yMGTYwSIBnq0WnCyfFtrL/xebqRGsBJHLV8UbhR4kR1WC2mw?=
 =?us-ascii?Q?OG7XzoIYWp3KCA6aDnlS8wwo7CG9MfpVm003v9PqTGamCuAtXPGWD1Q6Dnkj?=
 =?us-ascii?Q?VQ422QVXiN2houWkG/cnyQgiVHh48b9OhlpdizAPNHsmBY3SBsgxImbKkzoh?=
 =?us-ascii?Q?TFTfpUXvOVSutFpMXtd8VbiA+WIixeuNC4kir9ZbFBSh1xDVBXkm64jsF8rL?=
 =?us-ascii?Q?4WeQKT4K5qzPgtsxnDcgsvqwF8AQKsZmk+s5KdmzhOsivNulhU4CgktBnk+q?=
 =?us-ascii?Q?F5K57TgWsjNc9mgU0XShrVDP3sbWzZFy2721uX7zH0wfSCXP2GvOg+FbXi7F?=
 =?us-ascii?Q?ALCKkTYhOYajt4EH8iUFZuBmEDh8kugpKOIq26AFsN3j65fhD1nb2WYrKlcK?=
 =?us-ascii?Q?qZyJZGoXVs3PyHO9+2nW+IV0HUaAxWz/pTnef3bSUtKjjr7z4k/DGt2Ro/CI?=
 =?us-ascii?Q?zGenYGJl6NBch/wYsomi2Pa6WHz4FZ6GT5Izrs/TKHaILr3yr2cwKY8S6jY1?=
 =?us-ascii?Q?t8TRyTsV2CInWkzeBUHglP3JIPwdvGNYCUmEBEN5ih6pVVgYDyUcjVKAvpO8?=
 =?us-ascii?Q?E2ziOS1vlkotm5lUAtrEqZ85lM0gwEMCQanZ4RXfxK6R0yH/IoNrNYHugr5O?=
 =?us-ascii?Q?rBknvcBDC2M0lebKd/pjZ/+uaYk8MNhoizt/fODBZtvImm4/xn37SWXCfS+1?=
X-MS-Exchange-AntiSpam-MessageData-1: vzKFc+bDPTzM4Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110b2ba6-2a41-4ca5-66c2-08df0cd590fc
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:45:51.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+0/WcYwcpL3c223zTXV7ozwzlCluCBkwEVNqmRdDNw2SZ45kSYwAZ9hCCspEwzxjLyZ+V9hqBFB+z8tRngfJZmV71wVcsXyFan2eryHnIuNfKLbQGqGm6RdaLZ5mhS52cPfRVmw32AHLRJNedK5nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044557_493321_6BC978D2 
X-CRM114-Status: GOOD (  21.08  )
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

From: Marouene Boubakri <marouene.boubakri@nxp.com>

The RPMI message protocol attributes of an MPXY channel and the helper
reading them have nothing to do with the RPMI mailbox client. Move them
to their own header and source file so that an MPXY channel driver which
is not backed by an RPMI mailbox does not have to include the mailbox
headers to describe its channel.

No functional change.

Signed-off-by: Marouene Boubakri <marouene.boubakri@nxp.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h      | 64 +++++++++++++++++++++
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h | 37 +-----------
 lib/utils/mpxy/fdt_mpxy_rpmi.c              | 29 ++++++++++
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         | 19 +-----
 lib/utils/mpxy/objects.mk                   |  1 +
 5 files changed, 97 insertions(+), 53 deletions(-)
 create mode 100644 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi.c

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
new file mode 100644
index 0000000..747936f
--- /dev/null
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
@@ -0,0 +1,64 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __FDT_MPXY_RPMI_H__
+#define __FDT_MPXY_RPMI_H__
+
+#include <sbi/sbi_mpxy.h>
+#include <sbi/sbi_types.h>
+
+/** Convert the mpxy attribute ID to attribute array index */
+#define attr_id2index(attr_id)	((attr_id) - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
+
+enum mpxy_msgprot_rpmi_attr_id {
+	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
+	MPXY_MSGPROT_RPMI_ATTR_IMPL_ID,
+	MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION,
+	MPXY_MSGPROT_RPMI_ATTR_MAX_ID
+};
+
+/**
+ * MPXY message protocol attributes for RPMI
+ * Order of attribute fields must follow the
+ * attribute IDs in `enum mpxy_msgprot_rpmi_attr_id`
+ */
+struct mpxy_rpmi_channel_attrs {
+	u32 servicegrp_id;
+	u32 servicegrp_ver;
+	u32 impl_id;
+	u32 impl_ver;
+};
+
+/** Make sure all attributes are packed for direct memcpy */
+#define assert_field_offset(field, attr_offset)				\
+	_Static_assert((offsetof(struct mpxy_rpmi_channel_attrs, field) /\
+			sizeof(u32)) == attr_id2index(attr_offset),	\
+		       "field " #field " of struct "			\
+		       "mpxy_rpmi_channel_attrs is not at " #attr_offset)
+
+assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);
+assert_field_offset(servicegrp_ver, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION);
+assert_field_offset(impl_id, MPXY_MSGPROT_RPMI_ATTR_IMPL_ID);
+assert_field_offset(impl_ver, MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION);
+
+/**
+ * Read RPMI message protocol attributes of an MPXY channel
+ *
+ * @param attrs RPMI message protocol attributes of the channel
+ * @param outmem little-endian output memory
+ * @param base_attr_id first attribute ID to read
+ * @param attr_count number of attributes to read
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int mpxy_rpmi_read_attrs(const struct mpxy_rpmi_channel_attrs *attrs,
+			 u32 *outmem, u32 base_attr_id, u32 attr_count);
+
+#endif
diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
index 3a1c117..12daaae 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
@@ -15,42 +15,7 @@
 #include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi_utils/mailbox/rpmi_msgprot.h>
 #include <sbi_utils/mpxy/fdt_mpxy.h>
-
-/** Convert the mpxy attribute ID to attribute array index */
-#define attr_id2index(attr_id)	(attr_id - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
-
-enum mpxy_msgprot_rpmi_attr_id {
-	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
-	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
-	MPXY_MSGPROT_RPMI_ATTR_IMPL_ID,
-	MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION,
-	MPXY_MSGPROT_RPMI_ATTR_MAX_ID
-};
-
-/**
- * MPXY message protocol attributes for RPMI
- * Order of attribute fields must follow the
- * attribute IDs in `enum mpxy_msgprot_rpmi_attr_id`
- */
-struct mpxy_rpmi_channel_attrs {
-	u32 servicegrp_id;
-	u32 servicegrp_ver;
-	u32 impl_id;
-	u32 impl_ver;
-};
-
-/** Make sure all attributes are packed for direct memcpy */
-#define assert_field_offset(field, attr_offset)				\
-	_Static_assert(							\
-		((offsetof(struct mpxy_rpmi_channel_attrs, field)) /	\
-		 sizeof(u32)) == (attr_offset - SBI_MPXY_ATTR_MSGPROTO_ATTR_START),\
-		"field " #field						\
-		" from struct mpxy_rpmi_channel_attrs invalid offset, expected " #attr_offset)
-
-assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);
-assert_field_offset(servicegrp_ver, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION);
-assert_field_offset(impl_id, MPXY_MSGPROT_RPMI_ATTR_IMPL_ID);
-assert_field_offset(impl_ver, MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION);
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 /** MPXY RPMI service data for each service group */
 struct mpxy_rpmi_service_data {
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
new file mode 100644
index 0000000..e5b15dc
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -0,0 +1,29 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *   Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
+
+int mpxy_rpmi_read_attrs(const struct mpxy_rpmi_channel_attrs *attrs,
+			 u32 *outmem, u32 base_attr_id, u32 attr_count)
+{
+	const u32 *attr_array = (const u32 *)attrs;
+	u32 end_id = base_attr_id + attr_count - 1;
+	u32 idx;
+
+	if (end_id >= MPXY_MSGPROT_RPMI_ATTR_MAX_ID)
+		return SBI_EBAD_RANGE;
+
+	attr_array += attr_id2index(base_attr_id);
+	for (idx = 0; idx < attr_count; idx++)
+		outmem[idx] = cpu_to_le32(attr_array[idx]);
+
+	return SBI_OK;
+}
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 825ac9b..02320a6 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -45,30 +45,15 @@ static const struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
 	return NULL;
 }
 
-/** Copy attributes word size */
-static void mpxy_copy_attrs(u32 *outmem, u32 *inmem, u32 count)
-{
-	u32 idx;
-	for (idx = 0; idx < count; idx++)
-		outmem[idx] = cpu_to_le32(inmem[idx]);
-}
-
 static int mpxy_mbox_read_attributes(struct sbi_mpxy_channel *channel,
 				     u32 *outmem, u32 base_attr_id,
 				     u32 attr_count)
 {
 	struct mpxy_rpmi_mbox *rmb =
 		container_of(channel, struct mpxy_rpmi_mbox, channel);
-	u32 *attr_array = (u32 *)&rmb->msgprot_attrs;
-	u32 end_id = base_attr_id + attr_count - 1;
 
-	if (end_id >= MPXY_MSGPROT_RPMI_ATTR_MAX_ID)
-		return SBI_EBAD_RANGE;
-
-	mpxy_copy_attrs(outmem, &attr_array[attr_id2index(base_attr_id)],
-			attr_count);
-
-	return SBI_OK;
+	return mpxy_rpmi_read_attrs(&rmb->msgprot_attrs, outmem,
+				    base_attr_id, attr_count);
 }
 
 /**
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 1f1bf0a..c406c12 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -8,6 +8,7 @@
 #
 
 libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy.o
+libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy_rpmi.o
 libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy_drivers.carray.o
 
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MBOX) += mpxy/fdt_mpxy_rpmi_mbox.o
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
