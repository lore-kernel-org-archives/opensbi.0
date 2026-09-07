Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FC2C79F89
	for <opensbi@archiver.kernel.org>; Mon,  7 Sep 2026 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RbKEz0bOz12bl0AmI+qfwloypfgZ2pxAI+eZj6WoTU=; b=kJT3nseMH2WqiA
	YtNBU5sPSBntTju/lQZPK51jfRmI4Qj+S6w+FZSQFZY13KEF2gE+XDx0LcbbsS21LpDgJZtHsEKcI
	slFKmx+6v4nNR93hhPtvZtpjgQmGp7LgOOGbx/Yf8YWaibSypnp6y2E8Vv2NwMjDre6U+zr8ul5w9
	VX03oB1sQhdLR9GE65TszUo1inTbvFv6i+86dnu2qyKXP0pY6jMdCWWVhGuF+RQsk2gdmytWImeEb
	FmVu7OIo5+085T482YDAL1kB4wzn7/mMcUskBBfDvhIW2J4im2eStb8RpSdJlnb+zChBzZS/dcn2I
	NecyNQMMDDEYCvOTQ50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Xnb-00000006hcm-1ZlW;
	Mon, 07 Sep 2026 11:46:07 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnY-00000006hY7-2yFZ
	for opensbi@lists.infradead.org;
	Mon, 07 Sep 2026 11:46:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIL2CVwKRTfIRk4d5Bt5+JPQF8d9WwPHLZUk+yNu4fYKET8zxpA1HvEuxZNIH+XFvIOuyv4ggQN04yQHhw4RVAfHi10TRF0KvlMDd+rLM2yT1EubAmWV+kXkRvowpOglfLMEt3iQ5egKVv1jK/HfyUhwKu/glzH3q+2zKhXL9nk/mnBLVkYfoZQn8oTaEBi87781ZPtkJHf5sQm1NxVB3ZXVIrqV2/l83JG6td2tnPWvAnOexxz4cEGuWFAu5t/742276FBYKLB8jM4oZjylxCHy4/NgFliUxS3mJI+yhhVrZu1h/fxzCbY6LSMzM7eSCC/JGdLy0dOiOgcFv0F+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TP8XBnkeGPIVBxrwfk4oKbUQ8ZYhC2tG0t3SihTicYs=;
 b=SEugET27NkK1CyIIo/NuBZR9K+7l991M/zz1nRNtDZIq+3QCYqdeukmD7iuD5TJXDZAoTJGgZn+urTkyzab0m9rfTwpa1QfQMUf0Ib1p8ajA58XWuif8GQk4k9mmcKVtr4Sy9NLmCyUDVfGUNt1GVEC8zQWYv8OzEsJdJJ1lhtWXn21TTDQsGcukOO8TFDIZltwoWFEJPMQv1SVlrJTa7NQqVdHuL9xXHYL+krCPq3wn1dhB21sRmicdjNn22jwzRCBJ+dVlwoOOQSly+Fw7R5acgoQPrIUPlddtxriWO0McFdCbPh61sFm4NkHo48EA0MNIEQDFflUDAv5SGLquOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TP8XBnkeGPIVBxrwfk4oKbUQ8ZYhC2tG0t3SihTicYs=;
 b=Sg7e9yyp7tYuJt7VT95VPl+nttSbBjMc1aK4gDicj1J9u/oX9EM4qNwSxsnw1AYdMRAuT4vHtV2i2qeb668iQnW4zdJ2Zx9D/1y0okZ8mJBnmbxrE09jr53XdnJ2vuPrlaCyb4Sa/IuoejfBU1mo7G7BmRyKh+DnKTApTSJUYMc0Tu82LFSRVhNyHqMET/DwGieJCzK9MPwVnQZkxXcX2agELhmJGDpSkxZTMQuoTLtsiTKw/mgH7TT+tP4iiVFb4aGUcO4f7/VHMyXgl2abafkhkaTqtnQfHHBrKeZH2pzsu7tZVtyNUJl+vqJt+ZdOMNMvr/lmWRAlbrJpwfW0bg==
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
 11:45:56 +0000
From: marouene.boubakri@oss.nxp.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	ranbir.singh@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	maroueneboubakri@gmail.com,
	Marouene Boubakri <marouene.boubakri@nxp.com>
Subject: [PATCH 5/5] lib: utils/mpxy: Add RPMI MANAGEMENT_MODE channel over request forward
Date: Mon,  7 Sep 2026 13:59:13 +0200
Message-Id: <20260907115913.101752-6-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
References: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: AS4P191CA0031.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::13) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DUZPR04MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4f8a0d-c674-4711-c26a-08df0cd59400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: pFP/2ZXieG3IACZ5a9v47hhncDXSO+RUZDyQo+mBRf/m8RdsXKVE55Iy8uJ6tUGjQ8eb7/PwjpSBpMGUuoy8oxIZzrQNRiYgj38n34mlpz3a74+5+Veq11lnDxEc7DVmKS7/nH+UgU1STKjmUMmue9tZpK6B+VlOPH//JWS/NcC0B9xpVnkh2zqwmLfZWfKbXfh74Ze5PWvKTiPHPBnJMy8wSe0FbVFGZmAj4Uhb77MfAZDl9EYaoXLNXQEJYiAp5YrmcoB9Kxg3HaVfg04MQz5n+bTVmsmbiJZLlanvpiM/66lniz4BZhCS2E9KANstPLWJZcJIPw4IzUl7N5Ba6IGiSCoxxoCyRXAxzJNwZZjPB/591HcVK4VW3VGZJ+RE5p+z3TEpuU8rbU3zuS8Px3twQgElwZOwpk2qWeqEn8QJ5nc0gXNhtqEdadZVOGUPdlvBb22M568AamBNo894jfI36Ms5Z+vx3Q+g6oiaSNVd/Ik+MNzBQOu6tp/szmA9hKgbciAC120+Xnn1QLssgg9xEsAhIFVIkR9BAG69r39jFFJv7j91IXl6bag84foFb8kYEDBUmK70q51J46kKYWlTD3b2W0dNdEPDjfZ8fJtWczyVNdlNf++sdNqIgIpJVBOcuqK/Ao55hnGpAG0gPJJYESvaJcMw6XU9ED2ACsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQlR1SS0HrYSlQToDBtgKessX7QVLnGsDUbA7sK26ZbVuhfZBUCc8HjB783T?=
 =?us-ascii?Q?WWmDWBjDXVo/pohFDYog053QCr/8vOO/rtp9ZuxFZ6t0Xpo9wCtyKE+Zr7hj?=
 =?us-ascii?Q?baMFQQF2BdYOepSIh0UJIF5Brj94ZtZMNQQsODRfqYEud3XiS8qglZusYavl?=
 =?us-ascii?Q?aN1cQR+da+rhfIaZADg14O8VKVB3XOwp0vS/s0/MvEzNpgdToDz2mk5PFGXV?=
 =?us-ascii?Q?7+qhdHlfZJbqMZYXogvddq+4S3kfAA9jE1MyTY10Qg934TuMSIbgzYJ4N+Gj?=
 =?us-ascii?Q?odONWunK8b90YGcAQci7os8nQTTg7WTGT/YqMckDavBQQzJY4nTrtIs20ryM?=
 =?us-ascii?Q?Q9OviFFY9XuL55jzGGsdnXOcAnErV1FAVpm5+IHK16qd2ydTPwuUi+mhq7C3?=
 =?us-ascii?Q?f6YvbRyquav3Wf6a52CuEMnfWyGzWq1CTsQLiDot+HRYE41Oej4crclc1E2o?=
 =?us-ascii?Q?gUraZVp00k8e+BdoeGThI3IzwNHlGyCcrkEKYVoh/7c1/j1zDCBsDeSF8R+K?=
 =?us-ascii?Q?N0hnXJgFfckMrSNVYRUaWDILw+CBG7KEvMrucZwirTp+GqpX7n0enFI3/iJu?=
 =?us-ascii?Q?I2CJBo6IE0YYq5wDC1sJ8RfJn0gcFG3/CMa9I49cJited3/TH/h9W0HEKP7J?=
 =?us-ascii?Q?8RO8uQNyFfDeZ5g5KCkxg3bzrnYFtSUsQrQ9MjafIVyuq6agLqV4HUYhTlFx?=
 =?us-ascii?Q?N4hGzra+FJ+NlQgWuNkfSu3mSwVJx2my4HMpi0kUuEx+RNAhE0h2Usf3n153?=
 =?us-ascii?Q?QsP7D/1zluvZIU0eaxccIRz89FcasFUYHoaBhXo6EyL8eYx4dIiuKAskWiLh?=
 =?us-ascii?Q?oZBJgl1U6qeRR/XJNwu41ubq8KY3SPPRYNmps4GL1kNVUdSAdOU4inNrIiUp?=
 =?us-ascii?Q?TF00LweUiGBSEku7p4/6YQpepQZCTaWHuuEF5BR6hToG9Ui1XFJ5+7jXo28t?=
 =?us-ascii?Q?AlfYf62aZeyQMsOUcDxAszhakQeIzCmAPd19+Ja+7QgEMGKzGKmlIBekWOnB?=
 =?us-ascii?Q?rGGrsuG84n16PuWj/Fwrhi9xaCCm3LhSPvmeCW25hkQ+hYiAU0va69KnnUBP?=
 =?us-ascii?Q?fb+cdw4jUqNOlgW81JgKmWMdIZ/KB+85TYhIE4/XVNKrV8Tl4/eFKny84NoV?=
 =?us-ascii?Q?VQ05PT0CGEOFV8L1YEy2bwZz63imZx/yVXDJxyBV9jotifugLfldBqOeA/yT?=
 =?us-ascii?Q?IRHeUyjNs7eM/oOrA8lb/FFM4hlOsK33JxbnvHVFN8IIhIHgeqkm5dDgR0sH?=
 =?us-ascii?Q?cRcHCmO6e7uG3ko4XIwU8auJza4ZhlH6q3zVfIVi32IzEU86hlKWTIhxVwhC?=
 =?us-ascii?Q?Vgj/wbpFhFmLa+F7ktI15flD6d7CmgT3Z34ghXFjHgq33cumcI4pZKfaEeA0?=
 =?us-ascii?Q?eMIreeDAfUdxB7iB4P9k0lBB9AvkB/TVkvibgiay6XIwukwEibJAvSQDctBy?=
 =?us-ascii?Q?E9iNvOYUbEp1xGmzbNlIEwKv8hRkDjr5qiGYLaV2o4eiw+4X7Twp0TJIKpA3?=
 =?us-ascii?Q?7pkuBQgmEGw/m9eLSJtyIE6dAOLVbkZysB2JIeN6FvN0jv5Hu6vF5sXEh3Xh?=
 =?us-ascii?Q?9Wh6nL+jny54/UamQPY1jfZ62OYD0CL5f7XvjjfdStkGlDvIc0VSiiwEZ2tT?=
 =?us-ascii?Q?AS3eL63wlru48UFf+hl6zhSs/IUiSUghLMCdZ7xSABzzVww+ahAU3WOBtFK5?=
 =?us-ascii?Q?7jztYG7e+wACJRk2TQ2TscbE3R8/2PgJOhcrwfMLtEyi3W+ogcaAYdhsqw3E?=
 =?us-ascii?Q?x+rnoywkNwHbEY1njuqXS2Wd83SSCpqXgiCU7Qg5ArLNjYgxXwR92vaDgDQV?=
X-MS-Exchange-AntiSpam-MessageData-1: 5EEY6joVuP598w==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4f8a0d-c674-4711-c26a-08df0cd59400
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:45:56.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8blaEmGC+0P6zyq1+54AKXRYJCOlEMdpT3Pm/LOV9xXHBhS8fHnovTOJ4RmtYWHSMvO1vmEsn1YIVSh3elSJ2+MfCmnJhRqXqiBoNx1Tl+UcIehSn46MxRZS175onRTKp0OsASLjXd348WOw3FCe2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044604_767698_63ED34B6 
X-CRM114-Status: GOOD (  24.01  )
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

The RPMI MANAGEMENT_MODE service group is served today by
fdt_mpxy_rpmi_mm.c, which passes MM_COMMUNICATE to a platform
microcontroller over an RPMI mailbox. Management Mode can also run in
software on the application processor, in which case there is no
mailbox and no microcontroller to talk to.

Add a MANAGEMENT_MODE channel which serves such a setup. MM_COMMUNICATE
becomes a complete RPMI request message appended to the forwarded
message queue of a REQUEST_FORWARD channel; the software owning that
channel retrieves it, does the work and completes it, and its response
data is returned as the response of MM_COMMUNICATE. MM_GET_ATTRIBUTES
is answered from the device tree, because the MM shared memory is
described there rather than by a microcontroller.

The MM agent reports how many bytes it wrote and the RPMI client reads
that many at MM_COMM_OUTPUT_DATA_OFFSET, so a response claiming more than
the output area the request gave out is refused with RPMI_ERR_IO instead
of being passed on.

The RPMI client and the MM agent run on different HARTs, so the request
and its response are bounced through firmware memory. Both buffers live
on the stack frame of the call, which outlives the wait, so calls from
several HARTs can be in flight at once.

Device tree properties of the channel node:

  compatible                   "riscv,rpmi-mpxy-mm-forward"
  riscv,sbi-mpxy-channel-id    MPXY channel ID, required
  opensbi-reqfwd-channel       phandle of the REQUEST_FORWARD channel
                               node serving the MM agent, required
  riscv,rpmi-mm-shmem          address and size of the MM shared memory
                               as <addr_hi addr_lo size_hi size_lo>,
                               required
  riscv,rpmi-mm-version        MM version reported by MM_GET_ATTRIBUTES,
                               optional, 1.0 by default
  riscv,sbi-mpxy-completion-timeout-us
                               how long MM_COMMUNICATE waits for the MM
                               agent, optional, 1 second by default

Signed-off-by: Marouene Boubakri <marouene.boubakri@nxp.com>
---
 lib/utils/mpxy/Kconfig                    |   5 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c | 391 ++++++++++++++++++++++
 lib/utils/mpxy/objects.mk                 |   3 +
 platform/generic/configs/defconfig        |   1 +
 4 files changed, 400 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c

diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index 3d715e0..c5d5b68 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -50,6 +50,11 @@ config FDT_MPXY_RPMI_REQUEST_FORWARD
 	select MPXY_REQFWD_QUEUE
 	default n
 
+config FDT_MPXY_RPMI_MM_FORWARD
+	bool "MPXY driver for RPMI MM service group over request forward"
+	depends on FDT_MPXY_RPMI_REQUEST_FORWARD
+	default n
+
 config MPXY_REQFWD_QUEUE
 	bool "Queue of RPMI messages forwarded to a software agent"
 	default n
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c
new file mode 100644
index 0000000..e91af9d
--- /dev/null
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c
@@ -0,0 +1,391 @@
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
+#include <sbi/riscv_atomic.h>
+#include <sbi/sbi_byteorder.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_string.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/mailbox/rpmi_msgprot.h>
+#include <sbi_utils/mpxy/fdt_mpxy.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
+#include <sbi_utils/mpxy/reqfwd_queue.h>
+
+/** Implementation ID and version reported for this service group */
+#define MPXY_MM_IMPL_ID			0
+#define MPXY_MM_IMPL_VERSION		RPMI_VERSION(1, 0)
+
+/** Service group version implemented here */
+#define MPXY_MM_SRVGRP_VERSION		RPMI_VERSION(1, 0)
+
+/** Management Mode version reported when the DT does not give one */
+#define MPXY_MM_VERSION_DEFAULT		RPMI_VERSION(1, 0)
+
+/** How long MM_COMMUNICATE waits for the MM agent, in microseconds */
+#define MPXY_MM_COMPLETION_TIMEOUT_US	1000000
+
+/** MM_COMMUNICATE reaches the MM agent, MM_GET_ATTRIBUTES does not */
+#define MPXY_MM_SEND_TIMEOUT_US		10
+
+/** Longest service message of this service group */
+#define MPXY_MM_MSG_MAX_LEN		sizeof(struct rpmi_mm_get_attributes_rsp)
+
+/** The forwarded MM_COMMUNICATE request message */
+struct mpxy_mm_forwarded_request {
+	struct rpmi_message_header header;
+	struct rpmi_mm_communicate_req data;
+} __packed;
+
+/**
+ * An MPXY channel serving the RPMI MANAGEMENT_MODE service group where
+ * Management Mode runs in software served by an RPMI REQUEST_FORWARD
+ * channel rather than behind an RPMI mailbox.
+ */
+struct mpxy_mm_forward {
+	struct mpxy_rpmi_channel_attrs msgprot_attrs;
+	struct sbi_mpxy_channel channel;
+	/** Queue the MM requests are forwarded to */
+	struct reqfwd_queue *queue;
+	/** ID the queue is registered under */
+	u32 queue_id;
+	/** Management Mode attributes answered from the device tree */
+	struct rpmi_mm_attributes mma;
+	/** Token of the next forwarded RPMI request message */
+	atomic_t token;
+};
+
+static int mpxy_mm_read_attributes(struct sbi_mpxy_channel *channel,
+				   u32 *outmem, u32 base_attr_id,
+				   u32 attr_count)
+{
+	struct mpxy_mm_forward *mm =
+		container_of(channel, struct mpxy_mm_forward, channel);
+
+	return mpxy_rpmi_read_attrs(&mm->msgprot_attrs, outmem,
+				    base_attr_id, attr_count);
+}
+
+/** The MANAGEMENT_MODE service group defines no notification event */
+static int mpxy_mm_enable_notification(struct mpxy_mm_forward *mm,
+				       void *tx, u32 tx_len,
+				       void *rx, u32 rx_max_len,
+				       unsigned long *ack_len)
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
+static int mpxy_mm_get_attributes(struct mpxy_mm_forward *mm,
+				  void *rx, u32 rx_max_len,
+				  unsigned long *ack_len)
+{
+	struct rpmi_mm_get_attributes_rsp *rsp = rx;
+
+	if (rx_max_len < sizeof(*rsp))
+		return SBI_EINVAL;
+
+	rsp->status = cpu_to_le32(RPMI_SUCCESS);
+	rsp->mma.mm_version = cpu_to_le32(mm->mma.mm_version);
+	rsp->mma.shmem_addr_lo = cpu_to_le32(mm->mma.shmem_addr_lo);
+	rsp->mma.shmem_addr_hi = cpu_to_le32(mm->mma.shmem_addr_hi);
+	rsp->mma.shmem_size = cpu_to_le32(mm->mma.shmem_size);
+	*ack_len = sizeof(*rsp);
+
+	return SBI_OK;
+}
+
+/** Both data areas must lie inside the MM shared memory */
+static bool mpxy_mm_range_ok(struct mpxy_mm_forward *mm, u32 off, u32 size)
+{
+	if (off > mm->mma.shmem_size)
+		return false;
+
+	/* Written this way so that off + size cannot wrap */
+	return size <= (mm->mma.shmem_size - off);
+}
+
+static int mpxy_mm_communicate(struct mpxy_mm_forward *mm,
+			       void *tx, u32 tx_len,
+			       void *rx, u32 rx_max_len,
+			       unsigned long *ack_len)
+{
+	const struct rpmi_mm_communicate_req *req = tx;
+	struct rpmi_mm_communicate_rsp *rsp = rx;
+	u32 ipoff, ipsize, opoff, opsize;
+	unsigned long rsp_len = 0;
+	struct reqfwd_message fmsg;
+	s32 status;
+	int ret;
+
+	/*
+	 * The forwarded message queue never touches the memory of the RPMI
+	 * client, so the forwarded request and its response are bounced
+	 * through firmware memory. They live on this stack frame, which
+	 * outlives the wait, so several HARTs can be in flight at once.
+	 */
+	struct mpxy_mm_forwarded_request fwd;
+	struct rpmi_mm_communicate_rsp fwd_rsp;
+
+	if (tx_len < sizeof(*req) || rx_max_len < sizeof(*rsp))
+		return SBI_EINVAL;
+
+	/*
+	 * The REQUEST_FORWARD channel may well have been probed after this
+	 * one, so its queue is looked up on first use rather than at probe
+	 * time.
+	 */
+	if (!mm->queue) {
+		mm->queue = reqfwd_queue_find(mm->queue_id);
+		if (!mm->queue)
+			return SBI_ENODEV;
+	}
+
+	ipoff = le32_to_cpu(req->mm_comm_ipdata_off);
+	ipsize = le32_to_cpu(req->mm_comm_ipdata_size);
+	opoff = le32_to_cpu(req->mm_comm_opdata_off);
+	opsize = le32_to_cpu(req->mm_comm_opdata_size);
+
+	if (!mpxy_mm_range_ok(mm, ipoff, ipsize) ||
+	    !mpxy_mm_range_ok(mm, opoff, opsize)) {
+		status = RPMI_ERR_INVALID_ADDR;
+		goto out;
+	}
+
+	/*
+	 * REQUEST_FORWARD forwards a complete RPMI message, so build the
+	 * message header the RPMI client would have sent to a platform
+	 * microcontroller and put the service request data behind it.
+	 */
+	fwd.header.servicegroup_id = cpu_to_le16(RPMI_SRVGRP_MANAGEMENT_MODE);
+	fwd.header.service_id = RPMI_MM_SRV_COMMUNICATE;
+	fwd.header.flags = RPMI_MSG_NORMAL_REQUEST;
+	fwd.header.datalen = cpu_to_le16(sizeof(fwd.data));
+	fwd.header.token = cpu_to_le16(atomic_add_return(&mm->token, 1));
+	sbi_memcpy(&fwd.data, req, sizeof(fwd.data));
+
+	ret = reqfwd_queue_send(mm->queue, &fmsg, &fwd, sizeof(fwd),
+				&fwd_rsp, sizeof(fwd_rsp), &rsp_len,
+				mm->channel.attrs.msg_completion_timeout);
+	if (ret == SBI_ETIMEDOUT) {
+		status = RPMI_ERR_TIMEOUT;
+		goto out;
+	}
+	if (ret)
+		return ret;
+
+	/*
+	 * The MM agent answers with the response data of the RPMI message
+	 * it was given, which is what this service must return.
+	 */
+	if (rsp_len != sizeof(fwd_rsp)) {
+		status = RPMI_ERR_IO;
+		goto out;
+	}
+
+	/*
+	 * The RPMI client reads MM_COMM_RETURN_DATA_SIZE bytes at
+	 * MM_COMM_OUTPUT_DATA_OFFSET, so an agent claiming more than the
+	 * output area it was given would send the client reading past that
+	 * area and possibly past the MM shared memory. Only the offsets of
+	 * the request were checked on the way in, so check this on the way
+	 * out.
+	 */
+	if (le32_to_cpu(fwd_rsp.mm_comm_retdata_size) > opsize) {
+		status = RPMI_ERR_IO;
+		goto out;
+	}
+
+	/*
+	 * Both the forwarded response and the response of this service are
+	 * little-endian RPMI message data, so the words are passed through
+	 * without a conversion.
+	 */
+	rsp->status = fwd_rsp.status;
+	rsp->mm_comm_retdata_size = fwd_rsp.mm_comm_retdata_size;
+	*ack_len = sizeof(*rsp);
+
+	return SBI_OK;
+
+out:
+	rsp->status = cpu_to_le32(status);
+	rsp->mm_comm_retdata_size = cpu_to_le32(0);
+	*ack_len = sizeof(*rsp);
+
+	return SBI_OK;
+}
+
+static int mpxy_mm_send_message(struct sbi_mpxy_channel *channel,
+				u32 message_id, void *tx, u32 tx_len,
+				void *rx, u32 rx_max_len,
+				unsigned long *ack_len)
+{
+	struct mpxy_mm_forward *mm =
+		container_of(channel, struct mpxy_mm_forward, channel);
+
+	if (!rx || !ack_len)
+		return SBI_EINVAL;
+
+	switch (message_id) {
+	case RPMI_MM_SRV_ENABLE_NOTIFICATION:
+		return mpxy_mm_enable_notification(mm, tx, tx_len, rx,
+						   rx_max_len, ack_len);
+	case RPMI_MM_SRV_GET_ATTRIBUTES:
+		return mpxy_mm_get_attributes(mm, rx, rx_max_len, ack_len);
+	case RPMI_MM_SRV_COMMUNICATE:
+		return mpxy_mm_communicate(mm, tx, tx_len, rx, rx_max_len,
+					   ack_len);
+	default:
+		break;
+	}
+
+	return SBI_ENOTSUPP;
+}
+
+/** Read the MM shared memory reported by MM_GET_ATTRIBUTES */
+static int mpxy_mm_parse_shmem(const void *fdt, int nodeoff,
+			       struct rpmi_mm_attributes *mma)
+{
+	const fdt32_t *val;
+	u64 base, size;
+	int len;
+
+	val = fdt_getprop(fdt, nodeoff, "riscv,rpmi-mm-shmem", &len);
+	if (!val || len < 16)
+		return SBI_ENODEV;
+
+	base = ((u64)fdt32_to_cpu(val[0]) << 32) | fdt32_to_cpu(val[1]);
+	size = ((u64)fdt32_to_cpu(val[2]) << 32) | fdt32_to_cpu(val[3]);
+
+	/* The RPMI attribute reporting the size is 32-bit */
+	if (!size || size > 0xffffffffULL)
+		return SBI_EINVAL;
+
+	mma->shmem_addr_lo = (u32)base;
+	mma->shmem_addr_hi = (u32)(base >> 32);
+	mma->shmem_size = (u32)size;
+
+	return SBI_OK;
+}
+
+/** Read the MPXY channel ID of the REQUEST_FORWARD channel to forward to */
+static int mpxy_mm_parse_queue_id(const void *fdt, int nodeoff, u32 *queue_id)
+{
+	const fdt32_t *val;
+	int coff, len;
+
+	val = fdt_getprop(fdt, nodeoff, "opensbi-reqfwd-channel", &len);
+	if (!val || len < 4)
+		return SBI_ENODEV;
+
+	coff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+	if (coff < 0)
+		return SBI_EINVAL;
+
+	if (fdt_node_check_compatible(fdt, coff,
+				      "riscv,rpmi-mpxy-request-forward"))
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, coff, "riscv,sbi-mpxy-channel-id", &len);
+	if (!val || len < 4)
+		return SBI_EINVAL;
+
+	*queue_id = fdt32_to_cpu(*val);
+
+	return SBI_OK;
+}
+
+static int mpxy_mm_init(const void *fdt, int nodeoff,
+			const struct fdt_match *match)
+{
+	struct mpxy_mm_forward *mm;
+	const fdt32_t *val;
+	int rc, len;
+
+	val = fdt_getprop(fdt, nodeoff, "riscv,sbi-mpxy-channel-id", &len);
+	if (!val || len < 4)
+		return SBI_ENODEV;
+
+	mm = sbi_zalloc(sizeof(*mm));
+	if (!mm)
+		return SBI_ENOMEM;
+
+	mm->channel.channel_id = fdt32_to_cpu(*val);
+	mm->channel.owner_domain = &root;
+
+	rc = mpxy_mm_parse_queue_id(fdt, nodeoff, &mm->queue_id);
+	if (rc)
+		goto fail_free;
+
+	if (mm->queue_id == mm->channel.channel_id) {
+		rc = SBI_EINVAL;
+		goto fail_free;
+	}
+
+	rc = mpxy_mm_parse_shmem(fdt, nodeoff, &mm->mma);
+	if (rc)
+		goto fail_free;
+
+	mm->mma.mm_version = MPXY_MM_VERSION_DEFAULT;
+	val = fdt_getprop(fdt, nodeoff, "riscv,rpmi-mm-version", &len);
+	if (val && len >= 4)
+		mm->mma.mm_version = fdt32_to_cpu(*val);
+
+	mm->channel.attrs.msg_completion_timeout =
+		MPXY_MM_COMPLETION_TIMEOUT_US;
+	val = fdt_getprop(fdt, nodeoff,
+			  "riscv,sbi-mpxy-completion-timeout-us", &len);
+	if (val && len >= 4)
+		mm->channel.attrs.msg_completion_timeout = fdt32_to_cpu(*val);
+
+	mm->channel.read_attributes = mpxy_mm_read_attributes;
+	mm->channel.send_message_with_response = mpxy_mm_send_message;
+
+	mm->channel.attrs.msg_proto_id = SBI_MPXY_MSGPROTO_RPMI_ID;
+	mm->channel.attrs.msg_proto_version = RPMI_VERSION(1, 0);
+	mm->channel.attrs.msg_data_maxlen = MPXY_MM_MSG_MAX_LEN;
+	mm->channel.attrs.msg_send_timeout = MPXY_MM_SEND_TIMEOUT_US;
+
+	mm->msgprot_attrs.servicegrp_id = RPMI_SRVGRP_MANAGEMENT_MODE;
+	mm->msgprot_attrs.servicegrp_ver = MPXY_MM_SRVGRP_VERSION;
+	mm->msgprot_attrs.impl_id = MPXY_MM_IMPL_ID;
+	mm->msgprot_attrs.impl_ver = MPXY_MM_IMPL_VERSION;
+
+	rc = sbi_mpxy_register_channel(&mm->channel);
+	if (rc)
+		goto fail_free;
+
+	return SBI_OK;
+
+fail_free:
+	sbi_free(mm);
+	return rc;
+}
+
+static const struct fdt_match mpxy_mm_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-mm-forward" },
+	{},
+};
+
+const struct fdt_driver fdt_mpxy_rpmi_mm_forward = {
+	.experimental = true,
+	.match_table = mpxy_mm_match,
+	.init = mpxy_mm_init,
+};
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 6ff4a62..d8a692a 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -18,6 +18,9 @@ libsbiutils-objs-$(CONFIG_MPXY_REQFWD_QUEUE) += mpxy/reqfwd_queue.o
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_REQUEST_FORWARD) += fdt_mpxy_rpmi_reqfwd
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_REQUEST_FORWARD) += mpxy/fdt_mpxy_rpmi_reqfwd.o
 
+carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_MM_FORWARD) += fdt_mpxy_rpmi_mm_forward
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MM_FORWARD) += mpxy/fdt_mpxy_rpmi_mm_forward.o
+
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += fdt_mpxy_rpmi_clock
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
 
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 8400850..7bb9034 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -79,6 +79,7 @@ CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
 CONFIG_FDT_MPXY=y
 CONFIG_FDT_MPXY_RPMI_REQUEST_FORWARD=y
+CONFIG_FDT_MPXY_RPMI_MM_FORWARD=y
 CONFIG_FDT_MPXY_RPMI_MBOX=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
 CONFIG_FDT_MPXY_RPMI_VOLTAGE=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
