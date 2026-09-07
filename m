Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB2BC79F9E
	for <opensbi@archiver.kernel.org>; Mon,  7 Sep 2026 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oyBj/sPcrpWKbgKcrbd5kL/JxqfZIE2xUIh4Ieoob4=; b=L6FpJQ4b1CLixM
	PO4pP/cUE9PGZo0hv5BnQoV1GuKzNVsadVM1coCBQ/I6DlqaCePXeH3ybXxYilPWnwdra+eU5E+Im
	0NNSugQGvDnj4lhfjL0iyM/bzhpZvDdr1G70jZrArcmW+4ilGrjAELuuHYOyDsWmJuoK+KPaRMVqA
	lloMHmxVY0KjChm4xAw/3oK3vdIyUU/TTBMmzw0eBqAw/gbG9a2wn4e2JSyuhT8d+A3/bS53WnJ5n
	1OCfc28f8fMeOBULCMdkC/UUMiVOS1BYoJ37bUDw4sXSq0rfrJviM0nedQn+f3iIstlbFFGhcf6Bw
	Or0x9D2Ow5hM/HNjuIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnX-00000006haM-0oIw;
	Mon, 07 Sep 2026 11:46:03 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnV-00000006hY7-1ZpR
	for opensbi@lists.infradead.org;
	Mon, 07 Sep 2026 11:46:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8w4fXakaj3lZOIITzosR2KadOq12a0kAWhs+rbzrIwrpbwWZBPX2BJ79FcsnVV62pf041TQ/zJSJ+DmeCNpeSM3dCmnq3Poe8uspJKvkaPFYSnPOWfjiVMZekVddbTJ59FWA+LExPlfONzQf+M8psC1MCsFZifTV+fOKv3EJg+Mp1sej2QOd07zA+1ZSBYOJClJKTDYqo/oqLHCYotIjfF8BeeNNtqxr3l0vmFRIV6loV9CcNukyfDXXZ6W3/Z+xO/FiGOeGqGby6NuT4iYznK7JmBwRi4+CJMDCvp2bJaJ52cIjhh3VH7uvT6Qf3JKwnxsBnVNhNtdBa+isjUb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44hW6/w7ulwNM6mTj+9BP5YGEJCHpYvmoyhiY6gjrbg=;
 b=B/bh7RX8cGJfMhHLRwx8PyWc3kLq3QJKi+GCOtnzv+mHDVGGLJ7pgg/xH5K5zYLIT9m2a8xbT9afj9BctXi5f4wJ2BlkkZpHiPDuvVaNsWxYIbN8nx9y5ujmc+0fcSntnMuA7Su70UmLq6xag3UfXi4rQjnVLXgF+lkypuUo7uHFA8vQM8yQxdo1+tgMsuCwsXjDcJWRyodx+XM8OJn+woxWdtaq63xrhPW1PYe8vLvye9iqu8QbKJ0k+0KeLpoef/xvCQuLsDLNSdMDmAzO6LIrCjLae1zry/z1Zy47dM/bo6Ah4h9Q/S2LtYd7MsW/xXqyIviFK7LSFbPvDlOO1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44hW6/w7ulwNM6mTj+9BP5YGEJCHpYvmoyhiY6gjrbg=;
 b=KLwVdTCvB2L7dFBFgiNVo8qGnI2KLNDHImfvtjnZ6KS+ybJEyVXI3+qkfiJ5jWGLbnst/5JbrbbhAaucFls8utog6yqJzFsXXc/FPb8wZW8hqg4Zf3C76QJNadhGhDTqzcWdWP+4I5QTkH5KwWi1w2xiuQlTXm7Ky1TXhuALGvsCDVEaAMjPnjhI+e/fazygGU0OJK5Ax7w51fZKpa8LJQgWJAqAr22MN9/8em6XWcXhHvIcgwLykwfSVvXcJ39xJgxhfuL7hYd+L5XJTToSK3l3oB65k3DoHN7sCw2F652cBkJoFE/qpHQvp/PwTaS8ZdalebXV/V0CQwU9+P3hyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DUZPR04MB9984.eurprd04.prod.outlook.com
 (2603:10a6:10:4dd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:45:56 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:45:54 +0000
From: marouene.boubakri@oss.nxp.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	ranbir.singh@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	maroueneboubakri@gmail.com,
	Marouene Boubakri <marouene.boubakri@nxp.com>
Subject: [PATCH 4/5] lib: utils/mpxy: Add RPMI REQUEST_FORWARD channel driver
Date: Mon,  7 Sep 2026 13:59:12 +0200
Message-Id: <20260907115913.101752-5-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
References: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: AS4PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::18) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DUZPR04MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: b1591274-4fca-4237-83b6-08df0cd59319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ZE3hIuOfHWZV66prmquqrGUjYqTS4QJGaB3qLz+2mEPEXj/+LjtTQBtxDqJ+Q/GxH9f3jqXdAMbuCG59LplUZZjaFoPpzWXgAzh/Dt52mOpXfBS9gYjYnvxoaVq1Xgz2yEXT266Ts/+uYig26GwOrlooceLwULjz4qB3R/wa9p0lzWxDSjPVfJKnMS7wGbT+3BQhMK8XxJCjKMvqhEDUIJanYgN205w2tI98IkpOL3i0IaaTfvzXr9Tm0/i46ww+po/kFoa6s6wuOEEOBIzhTBk141qdNwxV95T20ZGLv4iaY0UQ8uqthsJOjQ6f2eL1x5zkRwlho1mB6RsIMTnEwSz0gKJumlQuq95f+rSBFwbjIJDl/Wn3HWrchpYO0r91mtYKb0zoVefgI1ZXbczlOPeKkfqPIvjUwLy5KHNLZ4mRot4HlC79KHNmC3gc6qFzJqlkAaqxADQ0NULAS//hc+FnXF6DskR4g8zVv8F/WV8EukHvIS+zZ/UiTwZJyc13OWLekPDVSTOfPax4RSYXLhfewJiS6oMv0VlOIsUDRSBKRubD+vF44nGT3V4F/0+827OEUFSXQbAlefXbZ0RKZwkdAmLaskf730Q+eJQsuhijikYrpTJEbWPEpBrJdIbhiotnOrAUAn8XJKuyq5o/2t7N/95eloRu75xwW3hGTKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a6nVRjstpLMz7PRa/8RHfrUU2YNIJbofAhtlUWSA9RZCqy7DKKvp5Ie7sgTx?=
 =?us-ascii?Q?hsw51UmZ0JA3g+cgWB7r9Z0wOsyoVG6knoGheDpQdOfVqO3ifR5biRrwm6jM?=
 =?us-ascii?Q?Mk58SMCEGjjLLzIeJEYus7rosA85Y0WEpCBmePO8v5CofFKtwhOOMwEwYp7w?=
 =?us-ascii?Q?vBtLVr+vT9zM6Wx1dFu6RfoAOabfwhb65k7vHL1xPuHYIr5CiasYIjVW4LbP?=
 =?us-ascii?Q?Zvs9/tGnxPgSwWlZX6Eauyl2EiU4qYsy01vW8c458Qy+7YUr1R8GjPknP18Y?=
 =?us-ascii?Q?a36quCsLszp/Zmaz05vujDKlgxKsmU/W0R4mXdCKm84sYSOV1fiqXde0FxIN?=
 =?us-ascii?Q?aMWSyYEiNjowWTxaSdOBEC/nQoR5aSS8pfq/+CGx6hNCFzNFoTddjNUJw+kY?=
 =?us-ascii?Q?SMk0HsfuHSuyGBFUvRbzIPvx8kVbVBVuX4SPRR9X+xT54xEP3PN6hVXBqlIl?=
 =?us-ascii?Q?XrIosYsl8dL3S95JrChxgRhuJOSZejaKPBoafoXMsvLj1vPYQpLn+IrSAW+6?=
 =?us-ascii?Q?4ugLNIMbZ/orZf++zf4ReC7svU9Gbs855fwMKdqSnosqGHpoKUaZHIfPsjNx?=
 =?us-ascii?Q?3ZhQUHRakWg67UF/7h1yaOAzp8yNpzYEBCPkc4Bwt6wC3wIiok98N+pE2HdG?=
 =?us-ascii?Q?SBu8QRQE0MFsJKvMHjtrpdLNpNkDfD8iCQ4tR5/ybqgMxXVPIliCLXWWa1c6?=
 =?us-ascii?Q?yF0/mqjzb33gPFcN8oeXoGlPabedZDM9Pl3yzZd4DAXVGoKE4n9/vYT32bdw?=
 =?us-ascii?Q?pgE+vbsOH7JIuamnqbNs4nUhzCUlnX7HPynNrGnm7avHifLG5jveo+Bne9Dq?=
 =?us-ascii?Q?/2WwzsYlPRE1NdrnsZ5cBEy4Pn0GDuzpuwJ832hxgYzt27KG+nqn8kaN1FU4?=
 =?us-ascii?Q?7Yy+cFXILUtqIMv8K/LLSBkiwn8jmZ8m6NYxdRZDKNboII2DwNSw0MDNfNk5?=
 =?us-ascii?Q?Vm2ilHAKHOL6HR99VIXJFi9yq3omZDdxnu/WCIXA+XvBz2hiVwz1thvirgPP?=
 =?us-ascii?Q?8Few+DBCrqesRFIMRHabDzAZ7ysSHNvY0PM2ToJdGTHhpOf1KZnALfHyrLDr?=
 =?us-ascii?Q?6vwtX0XAHZ8455KDer7H5wyuTtz6RJpTIqq2a/69+mwRvywdJ5esYYzandVI?=
 =?us-ascii?Q?YsBJnJgAqYUQIMboGf0B5ad4BfXvSX73m0h9G5XNu+bl0ylcEHKJmUrZ6ftE?=
 =?us-ascii?Q?cVXiMxmCcDmVWaFcHpc2Y+covZzqzS+tY11+A7hozgrrhs9lB6lChMgHCxFL?=
 =?us-ascii?Q?/adEvuodiQj6G2FfyK8aB7kdlBIFyMEa3flza4QulHojqofw3DKPqxlLF+p6?=
 =?us-ascii?Q?gRZCxem0gTjfkODI9DMNQCtxL+H7lH0VeAmX4ofu37chCNQx8XOdj7FpyIno?=
 =?us-ascii?Q?e9sKcbQ2aDz4ruPFZzbqmHvu2tdvjQcBS49ZPigfW86IFKfDL1/1tKySnfd4?=
 =?us-ascii?Q?KAXZJKZzTJCHSWtUzvKqJGVp12JjIjvykd+WSV46v78k653P2V0vyA+1WAWm?=
 =?us-ascii?Q?PiYeKrTO4iCueb6Au+wx4C9XkjKq+b50LV4CFb+c/wat6SQ6wUG6VY4usKPn?=
 =?us-ascii?Q?F+SWgthpsqSI9y44on4FZEECZIaNhyYVmOCIMeUD3ZxL4k1PfKtg3ZYpxoly?=
 =?us-ascii?Q?PocYAHHhF4+taBXWh++HQ+ryul4UVm8qXmiDeHeW8xosHwEDrZ899j1tLE9s?=
 =?us-ascii?Q?MqKM3JzsaCwjfPG6PjHvC7+FkRhNNgRJTK+Izl9vZKvjLVnEFBrqDl3Lt7rQ?=
 =?us-ascii?Q?9K/qUe8R234BdHq/le2djdkdyZxRgU9/+JF+ggmUBYm1wjjojPIKeGAoBWk7?=
X-MS-Exchange-AntiSpam-MessageData-1: hLB4myHuycwF1A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1591274-4fca-4237-83b6-08df0cd59319
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:45:54.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kCDEFSbCrxwe+rczJkQPYCpn/26KJqeeqmiNGy+WEPouCdrRJPXqOkIeq33+q1UHpa0HyWiGPVSnFaMK/GTzxmLnYNfC7O6tc9+CoNWb/k5rAzPh4Inggb4yaiYAwu+lqYfFIdnkOOzzM3cHy4TEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044601_581682_8DC4B40E 
X-CRM114-Status: GOOD (  22.62  )
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

Add an MPXY channel which serves the RPMI REQUEST_FORWARD service group
out of a forwarded message queue. Software owning such a channel is the
agent the messages of that queue are forwarded to: it retrieves the
current message of the queue, in as many chunks as the message data
length of the channel requires, and completes it with the response data.
Both services report RPMI_ERR_NO_DATA when the queue is empty.

The queue is registered under the MPXY channel ID of the channel, which
is how a producer of forwarded messages names it.

REQFWD_ENABLE_NOTIFICATION reports RPMI_ERR_NOTSUPP. The
REQFWD_NEW_MESSAGE event is an RPMI notification message and SBI MPXY
delivers those through an MSI or an SSE event, neither of which is
implemented for this channel, so software polls for messages instead.

Device tree properties of the channel node:

  compatible                   "riscv,rpmi-mpxy-request-forward"
  riscv,sbi-mpxy-channel-id    MPXY channel ID, required
  riscv,sbi-mpxy-msg-max-len   MSG_MAX_LEN of the channel in bytes,
                               optional, a multiple of 4 and at least 16,
                               4096 by default

Signed-off-by: Marouene Boubakri <marouene.boubakri@nxp.com>
---
 lib/utils/mpxy/Kconfig                |   6 +
 lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c | 280 ++++++++++++++++++++++++++
 lib/utils/mpxy/objects.mk             |   3 +
 platform/generic/configs/defconfig    |   1 +
 4 files changed, 290 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c

diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index d309735..3d715e0 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -44,6 +44,12 @@ config FDT_MPXY_RPMI_MM
 
 endif
 
+config FDT_MPXY_RPMI_REQUEST_FORWARD
+	bool "MPXY driver for RPMI request forward service group"
+	depends on FDT_MPXY
+	select MPXY_REQFWD_QUEUE
+	default n
+
 config MPXY_REQFWD_QUEUE
 	bool "Queue of RPMI messages forwarded to a software agent"
 	default n
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c b/lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c
new file mode 100644
index 0000000..4753874
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c
@@ -0,0 +1,280 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright 2026 NXP
+ *
+ * Authors:
+ *   Marouene Boubakri <marouene.boubakri@nxp.com>
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/mailbox/rpmi_msgprot.h>
+#include <sbi_utils/mpxy/fdt_mpxy.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
+#include <sbi_utils/mpxy/reqfwd_queue.h>
+
+/** Implementation ID and version reported for this service group */
+#define MPXY_REQFWD_IMPL_ID		0
+#define MPXY_REQFWD_IMPL_VERSION	RPMI_VERSION(1, 0)
+
+/** Service group version implemented here */
+#define MPXY_REQFWD_SRVGRP_VERSION	RPMI_VERSION(1, 0)
+
+/**
+ * Default and minimum message data length of the channel. The minimum
+ * has to hold the fixed part of a retrieve response plus one 4-byte word
+ * of the forwarded message.
+ */
+#define MPXY_REQFWD_MSG_MAX_LEN_DEFAULT	4096
+#define MPXY_REQFWD_MSG_MAX_LEN_MIN	16
+
+/*
+ * M-mode answers a retrieve or a complete without talking to anyone, so
+ * the channel timeouts only need to be non-zero.
+ */
+#define MPXY_REQFWD_SEND_TIMEOUT_US	10
+#define MPXY_REQFWD_COMPLETION_TIMEOUT_US 10
+
+/** Fixed part of a REQFWD_RETRIEVE_CURRENT_MESSAGE response */
+#define MPXY_REQFWD_RETRIEVE_RSP_SIZE	\
+	sizeof(struct rpmi_reqfwd_retrieve_current_message_rsp)
+
+/** An MPXY channel serving the RPMI REQUEST_FORWARD service group */
+struct mpxy_reqfwd {
+	struct mpxy_rpmi_channel_attrs msgprot_attrs;
+	struct sbi_mpxy_channel channel;
+	struct reqfwd_queue queue;
+};
+
+static int mpxy_reqfwd_read_attributes(struct sbi_mpxy_channel *channel,
+				       u32 *outmem, u32 base_attr_id,
+				       u32 attr_count)
+{
+	struct mpxy_reqfwd *rf =
+		container_of(channel, struct mpxy_reqfwd, channel);
+
+	return mpxy_rpmi_read_attrs(&rf->msgprot_attrs, outmem,
+				    base_attr_id, attr_count);
+}
+
+/**
+ * Notifications are not implemented.
+ *
+ * REQFWD_NEW_MESSAGE is an RPMI notification message and SBI MPXY
+ * delivers such messages through an MSI or an SSE event, neither of
+ * which is wired up here. Software waiting for forwarded messages polls
+ * REQFWD_RETRIEVE_CURRENT_MESSAGE instead.
+ */
+static int mpxy_reqfwd_enable_notification(struct mpxy_reqfwd *rf,
+					   void *tx, u32 tx_len,
+					   void *rx, u32 rx_max_len,
+					   unsigned long *ack_len)
+{
+	struct rpmi_enable_notification_resp *rsp = rx;
+
+	if (tx_len < sizeof(struct rpmi_enable_notification_req) ||
+	    rx_max_len < sizeof(*rsp))
+		return SBI_EINVAL;
+
+	rsp->status = cpu_to_le32(RPMI_ERR_NOTSUPP);
+	rsp->current_state = cpu_to_le32(RPMI_EVENT_NOTIF_DISABLE_STATE);
+	*ack_len = sizeof(*rsp);
+
+	return SBI_OK;
+}
+
+static int mpxy_reqfwd_retrieve(struct mpxy_reqfwd *rf,
+				void *tx, u32 tx_len,
+				void *rx, u32 rx_max_len,
+				unsigned long *ack_len)
+{
+	const struct rpmi_reqfwd_retrieve_current_message_req *req = tx;
+	struct rpmi_reqfwd_retrieve_current_message_rsp *rsp = rx;
+	unsigned long returned = 0, remaining = 0;
+	u32 start_index, max_len;
+	s32 status;
+	int ret;
+
+	if (tx_len < sizeof(*req) ||
+	    rx_max_len < MPXY_REQFWD_RETRIEVE_RSP_SIZE)
+		return SBI_EINVAL;
+
+	/* The request and the response share the shared memory */
+	start_index = le32_to_cpu(req->start_index);
+
+	max_len = rx_max_len;
+	if (max_len > rf->channel.attrs.msg_data_maxlen)
+		max_len = rf->channel.attrs.msg_data_maxlen;
+	max_len -= MPXY_REQFWD_RETRIEVE_RSP_SIZE;
+
+	/* An RPMI message data length is always a multiple of 4 bytes */
+	max_len &= ~0x3U;
+
+	ret = reqfwd_queue_retrieve(&rf->queue, start_index,
+				    rsp->request_message, max_len,
+				    &returned, &remaining);
+	switch (ret) {
+	case 0:
+		status = RPMI_SUCCESS;
+		break;
+	case SBI_ENOENT:
+		status = RPMI_ERR_NO_DATA;
+		break;
+	default:
+		status = RPMI_ERR_INVALID_PARAM;
+		break;
+	}
+
+	rsp->status = cpu_to_le32(status);
+	rsp->remaining = cpu_to_le32(remaining);
+	rsp->returned = cpu_to_le32(returned);
+	*ack_len = MPXY_REQFWD_RETRIEVE_RSP_SIZE + returned;
+
+	return SBI_OK;
+}
+
+static int mpxy_reqfwd_complete(struct mpxy_reqfwd *rf,
+				void *tx, u32 tx_len,
+				void *rx, u32 rx_max_len,
+				unsigned long *ack_len)
+{
+	struct rpmi_reqfwd_complete_current_message_rsp *rsp = rx;
+	unsigned long count = 0;
+	s32 status;
+	int ret;
+
+	if (rx_max_len < sizeof(*rsp))
+		return SBI_EINVAL;
+
+	/*
+	 * The response data is copied out of the shared memory before the
+	 * response of this service is written back into it.
+	 */
+	ret = reqfwd_queue_complete(&rf->queue, tx, tx_len, &count);
+	switch (ret) {
+	case 0:
+		status = RPMI_SUCCESS;
+		break;
+	case SBI_EBAD_RANGE:
+		/* The response does not fit the buffer of the producer */
+		status = RPMI_ERR_BAD_RANGE;
+		break;
+	default:
+		status = RPMI_ERR_NO_DATA;
+		break;
+	}
+
+	rsp->status = cpu_to_le32(status);
+	rsp->num_messages = cpu_to_le32(count);
+	*ack_len = sizeof(*rsp);
+
+	return SBI_OK;
+}
+
+static int mpxy_reqfwd_send_message(struct sbi_mpxy_channel *channel,
+				    u32 message_id, void *tx, u32 tx_len,
+				    void *rx, u32 rx_max_len,
+				    unsigned long *ack_len)
+{
+	struct mpxy_reqfwd *rf =
+		container_of(channel, struct mpxy_reqfwd, channel);
+
+	if (!rx || !ack_len)
+		return SBI_EINVAL;
+
+	switch (message_id) {
+	case RPMI_REQFWD_SRV_ENABLE_NOTIFICATION:
+		return mpxy_reqfwd_enable_notification(rf, tx, tx_len, rx,
+						       rx_max_len, ack_len);
+	case RPMI_REQFWD_SRV_RETRIEVE_CURRENT_MESSAGE:
+		return mpxy_reqfwd_retrieve(rf, tx, tx_len, rx,
+					    rx_max_len, ack_len);
+	case RPMI_REQFWD_SRV_COMPLETE_CURRENT_MESSAGE:
+		return mpxy_reqfwd_complete(rf, tx, tx_len, rx,
+					    rx_max_len, ack_len);
+	default:
+		break;
+	}
+
+	return SBI_ENOTSUPP;
+}
+
+static int mpxy_reqfwd_init(const void *fdt, int nodeoff,
+			    const struct fdt_match *match)
+{
+	struct mpxy_reqfwd *rf;
+	const fdt32_t *val;
+	u32 msg_max_len;
+	int rc, len;
+
+	val = fdt_getprop(fdt, nodeoff, "riscv,sbi-mpxy-channel-id", &len);
+	if (!val || len < 4)
+		return SBI_ENODEV;
+
+	rf = sbi_zalloc(sizeof(*rf));
+	if (!rf)
+		return SBI_ENOMEM;
+
+	rf->channel.channel_id = fdt32_to_cpu(*val);
+	rf->channel.owner_domain = &root;
+
+	msg_max_len = MPXY_REQFWD_MSG_MAX_LEN_DEFAULT;
+	val = fdt_getprop(fdt, nodeoff, "riscv,sbi-mpxy-msg-max-len", &len);
+	if (val && len >= 4)
+		msg_max_len = fdt32_to_cpu(*val);
+	if (msg_max_len < MPXY_REQFWD_MSG_MAX_LEN_MIN || (msg_max_len & 0x3)) {
+		rc = SBI_EINVAL;
+		goto fail_free;
+	}
+
+	rf->channel.read_attributes = mpxy_reqfwd_read_attributes;
+	rf->channel.send_message_with_response = mpxy_reqfwd_send_message;
+
+	rf->channel.attrs.msg_proto_id = SBI_MPXY_MSGPROTO_RPMI_ID;
+	rf->channel.attrs.msg_proto_version = RPMI_VERSION(1, 0);
+	rf->channel.attrs.msg_data_maxlen = msg_max_len;
+	rf->channel.attrs.msg_send_timeout = MPXY_REQFWD_SEND_TIMEOUT_US;
+	rf->channel.attrs.msg_completion_timeout =
+		MPXY_REQFWD_COMPLETION_TIMEOUT_US;
+
+	rf->msgprot_attrs.servicegrp_id = RPMI_SRVGRP_REQUEST_FORWARD;
+	rf->msgprot_attrs.servicegrp_ver = MPXY_REQFWD_SRVGRP_VERSION;
+	rf->msgprot_attrs.impl_id = MPXY_REQFWD_IMPL_ID;
+	rf->msgprot_attrs.impl_ver = MPXY_REQFWD_IMPL_VERSION;
+
+	/*
+	 * A producer names the queue it forwards to by the ID of the
+	 * channel the messages are retrieved from.
+	 */
+	rc = reqfwd_queue_register(&rf->queue, rf->channel.channel_id);
+	if (rc)
+		goto fail_free;
+
+	rc = sbi_mpxy_register_channel(&rf->channel);
+	if (rc)
+		goto fail_unregister_queue;
+
+	return SBI_OK;
+
+fail_unregister_queue:
+	reqfwd_queue_unregister(&rf->queue);
+fail_free:
+	sbi_free(rf);
+	return rc;
+}
+
+static const struct fdt_match mpxy_reqfwd_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-request-forward" },
+	{},
+};
+
+const struct fdt_driver fdt_mpxy_rpmi_reqfwd = {
+	.experimental = true,
+	.match_table = mpxy_reqfwd_match,
+	.init = mpxy_reqfwd_init,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 6cdfb6b..6ff4a62 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -15,6 +15,9 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MBOX) += mpxy/fdt_mpxy_rpmi_mbox.o
 
 libsbiutils-objs-$(CONFIG_MPXY_REQFWD_QUEUE) += mpxy/reqfwd_queue.o
 
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_REQUEST_FORWARD) += fdt_mpxy_rpmi_reqfwd
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_REQUEST_FORWARD) += mpxy/fdt_mpxy_rpmi_reqfwd.o
+
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += fdt_mpxy_rpmi_clock
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 9882988..8400850 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -78,6 +78,7 @@ CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
 CONFIG_FDT_MPXY=y
+CONFIG_FDT_MPXY_RPMI_REQUEST_FORWARD=y
 CONFIG_FDT_MPXY_RPMI_MBOX=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
 CONFIG_FDT_MPXY_RPMI_VOLTAGE=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
