Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFACC79FA0
	for <opensbi@archiver.kernel.org>; Mon,  7 Sep 2026 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2VKChqZS3LQNa0koDyG003x5gqIwHHm/5Dyh45F7dc=; b=bPPhUmFicnKxNj
	IxafaiguMrk+94d/umjDQ8Kw/t5aHWm4/IYDfeqnv4BzyjVj6hFtBymahGFmu5EzxB4IU1ttQHuLw
	ZR8yDp39wzRw5Hqoio8SYbEM0yVR41pXAr7D0ZawVfxSqbHCPIAuk10Cs/cMQpUvWiXgXhIcdmigH
	uK+O+VGZf99vZuBrwAbLEGu6PoQRSICuJQrfevMKECoGsIeIxnbl9d+IcUr9hVuhk7/1IIH8UGgg2
	MGzNTwk/XPxsgPdy73UMMBmIgUVT1NZoAbLCbQS2/lFgaCZs2PxU00UPK93WtoibgjEngqec3SGZU
	UjB8M95G5oYisrOovvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnV-00000006hYr-0Q9C;
	Mon, 07 Sep 2026 11:46:01 +0000
Received: from mail-francecentralazon11013040.outbound.protection.outlook.com ([40.107.162.40] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnT-00000006hVS-0ekZ
	for opensbi@lists.infradead.org;
	Mon, 07 Sep 2026 11:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQqe/Qv4ebI5D/D/XVhVakIMCKKetB7NytR5iHiBSQ1BvZTshkpl0RVp2dzDe1LEF6h4wfLf52WZYje243xvi/q3Dh2Shj6oYhFIZcC8hooakBxD6PG+FOCEiOineq4KpVP/NtnVuTQytyLlXw/F4BRGiC8vIfuiCYdKi6qW5gfvzpPtzH4RGY1M8xXALr0Pv+9GeyCFIPeHjiW2cMfAYbEl5VBlZCzt1I0+gFAarSxALOJ4RCAuXWO7vHaYqTB6o33KlksNIwBtnT4m5dWbuuKNGn9+BMV5rfAMz+TvtUy6TSdcn+D1K1vCypfMwjbD9Tpq5ZxfQZmGKhRBhUQc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYfuOWG+5eU51+Rvl1s7ScVEQeS6PakSXqwMejuY+94=;
 b=yKnCY2Q8iZDv0y7hWucDJBDxQq+CL4VWCGOShUSgP2r+cwRhDPNGuGWAayb7dKRjb14E4A6Xag8UFgMGfG1xzMY3dgMiYCZXmFYYYn8tzPm1x9juqWBPKJ+jJoKMhOPC7HWWzIpmD98fpXSYR9kqKcnL/iQtCDq5uYtiXWp6SyKFs2yjNr+QkrbekpVmYDyLgjNDS9zPjMuXGKcoN87YNjS19++yPWSanPlp5pvGMXOCSgBi8q2Ib1iM59KSFI+zqKF5dWz03brOLAcml0OKd6virm60X7pP2tB/c6csTDGrrXOZMysOFdnqpkYKvzhfxvWi9lwi5HdyKOOxnuZ6gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYfuOWG+5eU51+Rvl1s7ScVEQeS6PakSXqwMejuY+94=;
 b=W+QXMdf6Id4zshrf2GwVwfgmQiKdLAXYWRulBwr5ZYU7KP/9qBzXD77WWCgLyPLE2TV7zbNX9K6jYyZ5+rpbEIE7DZ6QqJmUHkuFJqJSn6pkPKakWX0PhKecxBgA8Wre60+NoRvFc+z4oznWaeh/H4+lvgyEGIAAy0vdzquCIji57CGMl5VHuk7sEGW+v8GKt4Mcctp3DS9fUjFFE1O7hPrOO8ah1U/jBpJ7cOhNwcFMxczLnKYYHOO2dGBsntXun3a9BmavMIPexT/OyyBB+j+o+ditlbp5ZutmfbvY3BvniTvGCoeRzWmpeONB1Xoe0rtD9tT6rgtiuTM/KqKzIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DU4PR04MB10575.eurprd04.prod.outlook.com
 (2603:10a6:10:585::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:45:53 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:45:53 +0000
From: marouene.boubakri@oss.nxp.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	ranbir.singh@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	maroueneboubakri@gmail.com,
	Marouene Boubakri <marouene.boubakri@nxp.com>
Subject: [PATCH 3/5] lib: utils/mpxy: Add queue of forwarded RPMI messages
Date: Mon,  7 Sep 2026 13:59:11 +0200
Message-Id: <20260907115913.101752-4-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
References: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: AS4P191CA0042.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::19) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DU4PR04MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: c65fa3b6-456b-4315-9990-08df0cd5920f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2SCzuTEUJv0cttgq+1bOPRQalJ3HgBVoUTFZ4UYySV3f9wXjcbW8QRS69oZXMVj8ZbdOvdyx/vtKtxoPdUzwK3S1wTlVr6Yy2rm+rkJXgBUfvun+pxkgeXa5j1zzvEeJdEF6R6RagX4/g1j+PdO3DyxXNGXxnuz/6B4Oxfxb+zqm916rip8NOoQFsBy8AqGGlphOGGZYBLx9+z/5AHTlO4D0gx/mHz1p5m1aGMedURZrZNQNHYlLDn7I5gUgdqee1GA5+qYMm5Q2zhDD1cgw6MNIA79eBJZfS7Xk63KaHPtF2jMyHrMAEb73TpMOcbRu1ZM5AycbfJZUhhWYWS38GvVcPxsLmyFlkbeKOasN7Y+Ieg40RqjTB2sPs2UlhpXqVirlpt2MxRDxplzncUAXiR3pcDQRa2weHBWDDFCgYyF84FvXxleWms9D6V26lngLsaq1Fs1ifOUMN1KoG+3PFZ4wH3y9nmqJ7IIUu50PJ2suCPMB5C6M39iDc83m4Tu0KaEl+nK0yET69hAtz40SaekwOYJcUo03QGOWh2SpmahUFrHXRIP7eHKk4McETepTLcNcFCyAiRNHkc6Eb5417kYv4anQJczOTbY//GI6Y5Qlx5m1pq95OknL6/cFlYPnRL/caQM8QsTfylNGRYjglauV098qMPVOxEaNyNwf6oY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DFP+9Z/k6G5yIyxFTglTxv+DyHqu4lU9jNfnUXyuU2Qa1pNEcwYLqcUETUjG?=
 =?us-ascii?Q?tvAh+QLePCkkdW5gyZ6QK1ZfslPnlPmUx/wiw2XM3LQWE328mSY2q/YHigQG?=
 =?us-ascii?Q?C0oG9hEUzoxNxC1EsBmWRrF0bQ5W6hseKrJn3QcgXS0IinKXuEyiCXZdSMo8?=
 =?us-ascii?Q?1+hQUyVRSboPFL6mM4TJ5cEi9MMgoS9RF3ChNFszOzqKG9Q22Gg6l3O6BC2s?=
 =?us-ascii?Q?+CokqiqXvsk+bdXWvLKXUJscfUTP0sVvrAdLZTmUg+f1if93HG9P/SKYNc0X?=
 =?us-ascii?Q?2N8Dpq5znJXhNY0DXthoYIJFowtFU6m33n9/FxR8vhpRGyOfcsbW+43H8h2k?=
 =?us-ascii?Q?aBKpkt5Mw2jbcPcKkU6C4LmioBqnEkEDxlNmyOVSrlMhhn5D/FZoGP0NokeX?=
 =?us-ascii?Q?ZlcCIcObI4dv2ivwL+xqy323Z1G4k7I/Ri2RadUK8EDGhEVUAqaWnIYMZHzl?=
 =?us-ascii?Q?wRXBNWNfgnfPUaRCN0GzTTKY54lmcTuHXTQz4YWL2pVkhTcGCBXNRGCHbfLF?=
 =?us-ascii?Q?MgZmxwKAgLjZ0hfTjSVbl4zeRMV8OgLeTrT8daNcs1Hz7iwgSqL98rWPNebM?=
 =?us-ascii?Q?lB6yZDKsCl1+HKlSXGahwbjUpWbN1B7uciPz3d4l5t8mabBAJiVpcGsgtzYA?=
 =?us-ascii?Q?EOdQsXxfxkkzAULlEBe3PfXlAQqZc8k0sGxvOAM8WsbyZPIIKbFZRn5QzQ4q?=
 =?us-ascii?Q?XHTQ3VeM9wQTwKz86a0ZhiwZ7ZGCrLYn8Dff00r9Tt8Sd9weR8AGja+j4mat?=
 =?us-ascii?Q?cG+KkSGRtxox0smuQe20PQISlYfVBdnFgPb78/seb0lwzP5EQx9NJ7WX2Pb0?=
 =?us-ascii?Q?jbFPwhoGNjTHIwcfDd8OsmY81LxS1Jjuzlh7MYERnX8YTp9UcTHOR+7dxPIX?=
 =?us-ascii?Q?zpZB+umMWuOpBAHuHoHDdtlaRhbreDGOxis7Qoh43JEVNUV7Zj4kvUUc4x5i?=
 =?us-ascii?Q?mkayxNoKq1wQS5C/wRJNL16Xx6Cc7WQp0CZxnAZEj1Jz5xQw0+svuCTyhqUP?=
 =?us-ascii?Q?hnoSpevUOmldV7HkoEVRLpie9swJpdZyLKxC00rDjwPae9sYl7Y2eup17OQD?=
 =?us-ascii?Q?Czbed1iyXuiBk5MG25yN5pKURjfEm9chqZ2oZjqIG2ifp3g3dZvRXSMoraHD?=
 =?us-ascii?Q?agP0TPcQyXixTuJkrA3zo+cqiXfAH0Q8YN3ryeciKQIRf8LfrWSRo/ZVLkRb?=
 =?us-ascii?Q?KU8F/ww2XQjTdV0ddaxUK16nE3ISbThs1N7jTo7KawXt0o6VRlIrUFFF4yka?=
 =?us-ascii?Q?C6Sic7uHlC56s5yzdaLplDyBfB0t7jIW/RRB0Ya0lvncp0jOF9xx/mdQW4ga?=
 =?us-ascii?Q?bcVRYkg7YJ/x4qx8iN2cRsOpxlBQ9fhS6rMo39kVFuidvNkzRxrE5sHeW83d?=
 =?us-ascii?Q?HNK5CJmmEaqsHRneO2EK8QUgo8P6guw3u2AkvjUd7bm31zsKn5eyUfubt4iK?=
 =?us-ascii?Q?7R+BKi9zxzDXomsBIT1eLhABwk7NhAVGxoNCRgLU0ofuT+e5uraCaeOblYZK?=
 =?us-ascii?Q?zMNp+yR6HuZ8nf14718glXGyEM8SS42ZjSKAVZpe+zkeGzf2ZxrwYd35Ms/p?=
 =?us-ascii?Q?OXCnWWy+q7/PIPwq08hJnaU05iCeij7Ev28q9moq6Zf3ynwwCWVJti/myOfk?=
 =?us-ascii?Q?4Bs7VJiiGnGjOk23s5cfVw1y4JAcA7tD0yPPpY3wmOcDGCCMRQp3vseWHThi?=
 =?us-ascii?Q?m+rOoHqU8TQ2+SB0prExs+K4h34plDJAPXCTwZb4m/zoghycARpa0z4MIDVc?=
 =?us-ascii?Q?MI3EvJbOafj47KYUAXHVm/l4P5N7l8TB5hgjG3FswtH/rUJv1cECX0WN84np?=
X-MS-Exchange-AntiSpam-MessageData-1: Rdx04k6F/mpmbg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65fa3b6-456b-4315-9990-08df0cd5920f
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:45:53.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jW81UQeJr6I1lvwUHomSKdpa+nRf32hydM7IDAkUwLXSbjIyjlMhjnD39Z9uqiS11kgFa7fVJg3AJnV7KtWG86Rre0Q+K1t6HSGxKWj9ocrkHgy3z+Ua9o82ZcsJy1pqrJ1E5Asy6plymULYzxJMoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044559_208801_965C065A 
X-CRM114-Status: GOOD (  26.48  )
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

The RPMI REQUEST_FORWARD service group lets a software agent pull RPMI
messages out of the SBI implementation and answer them, which makes the
SBI implementation a forwarder between an RPMI client and that agent.

Add the queue sitting between the two. A producer appends a complete
RPMI message to a queue and waits for the agent to complete it, while
the agent retrieves the oldest message of the queue, possibly in several
chunks, and completes it with the response data. Nothing in here knows
which RPMI service group a forwarded message belongs to.

The producer and the agent run on different HARTs, so a message and its
response buffer must be reachable from M-mode on any HART. This is why
the queue holds references to firmware memory rather than to the memory
of the RPMI client.

Signed-off-by: Marouene Boubakri <marouene.boubakri@nxp.com>
---
 include/sbi_utils/mpxy/reqfwd_queue.h | 157 ++++++++++++++++++++
 lib/utils/mpxy/Kconfig                |   4 +
 lib/utils/mpxy/objects.mk             |   2 +
 lib/utils/mpxy/reqfwd_queue.c         | 198 ++++++++++++++++++++++++++
 4 files changed, 361 insertions(+)
 create mode 100644 include/sbi_utils/mpxy/reqfwd_queue.h
 create mode 100644 lib/utils/mpxy/reqfwd_queue.c

diff --git a/include/sbi_utils/mpxy/reqfwd_queue.h b/include/sbi_utils/mpxy/reqfwd_queue.h
new file mode 100644
index 0000000..cb703c4
--- /dev/null
+++ b/include/sbi_utils/mpxy/reqfwd_queue.h
@@ -0,0 +1,157 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright 2026 NXP
+ *
+ * Authors:
+ *   Marouene Boubakri <marouene.boubakri@nxp.com>
+ */
+
+#ifndef __REQFWD_QUEUE_H__
+#define __REQFWD_QUEUE_H__
+
+#include <sbi/riscv_locks.h>
+#include <sbi/sbi_list.h>
+#include <sbi/sbi_types.h>
+
+/**
+ * Queue of RPMI messages forwarded to a software agent which serves the
+ * RPMI REQUEST_FORWARD service group.
+ *
+ * A producer forwards a message to a queue and waits for the agent to
+ * complete it. The oldest message of a queue is its current message and
+ * it is the only one which can be retrieved and completed.
+ *
+ * The producer and the agent run on different HARTs, so the message and
+ * response buffers must be reachable from M-mode on any HART of the
+ * system. In other words they must be in firmware memory.
+ */
+
+/** State of a forwarded message */
+enum reqfwd_state {
+	/** Queued and not retrieved yet */
+	REQFWD_STATE_QUEUED = 0,
+	/** At least partly retrieved by the agent */
+	REQFWD_STATE_RETRIEVED,
+	/** Completed by the agent, the response is available */
+	REQFWD_STATE_COMPLETED,
+};
+
+/** A forwarded message */
+struct reqfwd_message {
+	/** Node in the message list of a queue */
+	struct sbi_dlist node;
+	/** State of this message */
+	enum reqfwd_state state;
+	/** Message bytes */
+	const void *msg;
+	/** Number of message bytes */
+	unsigned long msg_len;
+	/** Buffer receiving the response */
+	void *rsp;
+	/** Size of the response buffer */
+	unsigned long rsp_max_len;
+	/** Number of response bytes written by the agent */
+	unsigned long rsp_len;
+};
+
+/** Queue of messages forwarded to one agent */
+struct reqfwd_queue {
+	/** Node in the list of registered queues */
+	struct sbi_dlist node;
+	/** Identifier of this queue, unique across registered queues */
+	u32 id;
+	/** Lock protecting the message list */
+	spinlock_t lock;
+	/** Forwarded messages, oldest first */
+	struct sbi_dlist messages;
+	/** Number of messages in the list */
+	unsigned long count;
+};
+
+/**
+ * Register a forwarded message queue
+ *
+ * @param queue message queue to register
+ * @param id identifier producers use to find the queue, in practice the
+ * MPXY channel ID of the REQUEST_FORWARD channel serving it
+ *
+ * @return 0 on success and negative error code on failure
+ */
+int reqfwd_queue_register(struct reqfwd_queue *queue, u32 id);
+
+/**
+ * Unregister a forwarded message queue
+ *
+ * The queue must be empty.
+ *
+ * @param queue message queue to unregister
+ */
+void reqfwd_queue_unregister(struct reqfwd_queue *queue);
+
+/**
+ * Find a registered forwarded message queue
+ *
+ * @param id identifier the queue was registered with
+ *
+ * @return pointer to the queue or NULL if there is no such queue
+ */
+struct reqfwd_queue *reqfwd_queue_find(u32 id);
+
+/**
+ * Forward a message and wait for the agent to complete it
+ *
+ * @param queue message queue to forward to
+ * @param fmsg caller provided state tracking the forwarded message
+ * @param msg message bytes, must stay valid until this function returns
+ * @param msg_len number of message bytes
+ * @param rsp buffer receiving the response, may be NULL
+ * @param rsp_max_len size of the response buffer
+ * @param rsp_len place to store the number of response bytes, may be NULL
+ * @param timeout_us how long to wait for completion in microseconds
+ *
+ * @return 0 on success, SBI_ETIMEDOUT if the agent did not complete the
+ * message in time, and a negative error code on failure
+ */
+int reqfwd_queue_send(struct reqfwd_queue *queue,
+		      struct reqfwd_message *fmsg,
+		      const void *msg, unsigned long msg_len,
+		      void *rsp, unsigned long rsp_max_len,
+		      unsigned long *rsp_len, unsigned long timeout_us);
+
+/**
+ * Copy a part of the current forwarded message of a queue
+ *
+ * The current message is marked as retrieved even if only a part of it
+ * was copied, because the agent may not need the whole message.
+ *
+ * @param queue message queue to retrieve from
+ * @param offset index of the first byte to copy
+ * @param buf buffer receiving the copied bytes
+ * @param buf_len size of the buffer
+ * @param returned place to store the number of bytes copied
+ * @param remaining place to store the number of bytes left after this call
+ *
+ * @return 0 on success, SBI_ENOENT if the queue has no current message,
+ * and a negative error code on failure
+ */
+int reqfwd_queue_retrieve(struct reqfwd_queue *queue, unsigned long offset,
+			  void *buf, unsigned long buf_len,
+			  unsigned long *returned, unsigned long *remaining);
+
+/**
+ * Complete the current forwarded message of a queue
+ *
+ * @param queue message queue to complete in
+ * @param rsp response bytes
+ * @param rsp_len number of response bytes
+ * @param count place to store the number of messages left behind
+ *
+ * @return 0 on success, SBI_ENOENT if the queue has no current message or
+ * the current message was not retrieved, and a negative error code on
+ * failure
+ */
+int reqfwd_queue_complete(struct reqfwd_queue *queue, const void *rsp,
+			  unsigned long rsp_len, unsigned long *count);
+
+#endif /* __REQFWD_QUEUE_H__ */
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index a3ed1c2..d309735 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -44,4 +44,8 @@ config FDT_MPXY_RPMI_MM
 
 endif
 
+config MPXY_REQFWD_QUEUE
+	bool "Queue of RPMI messages forwarded to a software agent"
+	default n
+
 endmenu
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index c406c12..6cdfb6b 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -13,6 +13,8 @@ libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy_drivers.carray.o
 
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MBOX) += mpxy/fdt_mpxy_rpmi_mbox.o
 
+libsbiutils-objs-$(CONFIG_MPXY_REQFWD_QUEUE) += mpxy/reqfwd_queue.o
+
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += fdt_mpxy_rpmi_clock
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
 
diff --git a/lib/utils/mpxy/reqfwd_queue.c b/lib/utils/mpxy/reqfwd_queue.c
new file mode 100644
index 0000000..b49c004
--- /dev/null
+++ b/lib/utils/mpxy/reqfwd_queue.c
@@ -0,0 +1,198 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright 2026 NXP
+ *
+ * Authors:
+ *   Marouene Boubakri <marouene.boubakri@nxp.com>
+ */
+
+#include <sbi/riscv_barrier.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_timer.h>
+#include <sbi_utils/mpxy/reqfwd_queue.h>
+
+/** List of registered forwarded message queues */
+static SBI_LIST_HEAD(reqfwd_queue_list);
+
+/** Current message of a queue, called with the queue lock held */
+static struct reqfwd_message *reqfwd_current(struct reqfwd_queue *queue)
+{
+	if (sbi_list_empty(&queue->messages))
+		return NULL;
+
+	return sbi_list_first_entry(&queue->messages,
+				    struct reqfwd_message, node);
+}
+
+int reqfwd_queue_register(struct reqfwd_queue *queue, u32 id)
+{
+	if (!queue)
+		return SBI_EINVAL;
+
+	if (reqfwd_queue_find(id))
+		return SBI_EALREADY;
+
+	queue->id = id;
+	SPIN_LOCK_INIT(queue->lock);
+	SBI_INIT_LIST_HEAD(&queue->messages);
+	queue->count = 0;
+
+	sbi_list_add_tail(&queue->node, &reqfwd_queue_list);
+
+	return 0;
+}
+
+void reqfwd_queue_unregister(struct reqfwd_queue *queue)
+{
+	if (!queue)
+		return;
+
+	sbi_list_del(&queue->node);
+}
+
+struct reqfwd_queue *reqfwd_queue_find(u32 id)
+{
+	struct reqfwd_queue *queue;
+
+	sbi_list_for_each_entry(queue, &reqfwd_queue_list, node) {
+		if (queue->id == id)
+			return queue;
+	}
+
+	return NULL;
+}
+
+int reqfwd_queue_send(struct reqfwd_queue *queue,
+		      struct reqfwd_message *fmsg,
+		      const void *msg, unsigned long msg_len,
+		      void *rsp, unsigned long rsp_max_len,
+		      unsigned long *rsp_len, unsigned long timeout_us)
+{
+	u64 start, ticks;
+
+	if (!queue || !fmsg || !msg || !msg_len || !timeout_us)
+		return SBI_EINVAL;
+
+	fmsg->state = REQFWD_STATE_QUEUED;
+	fmsg->msg = msg;
+	fmsg->msg_len = msg_len;
+	fmsg->rsp = rsp;
+	fmsg->rsp_max_len = rsp ? rsp_max_len : 0;
+	fmsg->rsp_len = 0;
+
+	spin_lock(&queue->lock);
+	sbi_list_add_tail(&fmsg->node, &queue->messages);
+	queue->count++;
+	spin_unlock(&queue->lock);
+
+	start = sbi_timer_value();
+	ticks = sbi_timer_compute_udelta(timeout_us);
+
+	while (1) {
+		spin_lock(&queue->lock);
+
+		/*
+		 * reqfwd_queue_complete() removes the message from the list
+		 * before releasing the lock, so once it is completed the
+		 * agent no longer refers to it.
+		 */
+		if (fmsg->state == REQFWD_STATE_COMPLETED) {
+			spin_unlock(&queue->lock);
+			if (rsp_len)
+				*rsp_len = fmsg->rsp_len;
+			return 0;
+		}
+
+		if ((sbi_timer_value() - start) >= ticks) {
+			sbi_list_del(&fmsg->node);
+			queue->count--;
+			spin_unlock(&queue->lock);
+			return SBI_ETIMEDOUT;
+		}
+
+		spin_unlock(&queue->lock);
+		cpu_relax();
+	}
+}
+
+int reqfwd_queue_retrieve(struct reqfwd_queue *queue, unsigned long offset,
+			  void *buf, unsigned long buf_len,
+			  unsigned long *returned, unsigned long *remaining)
+{
+	struct reqfwd_message *fmsg;
+	unsigned long len;
+	int ret = 0;
+
+	if (!queue || (buf_len && !buf))
+		return SBI_EINVAL;
+
+	spin_lock(&queue->lock);
+
+	fmsg = reqfwd_current(queue);
+	if (!fmsg) {
+		ret = SBI_ENOENT;
+		goto out;
+	}
+
+	if (offset > fmsg->msg_len) {
+		ret = SBI_EINVAL;
+		goto out;
+	}
+
+	len = fmsg->msg_len - offset;
+	if (len > buf_len)
+		len = buf_len;
+
+	if (len)
+		sbi_memcpy(buf, (const char *)fmsg->msg + offset, len);
+	fmsg->state = REQFWD_STATE_RETRIEVED;
+
+	if (returned)
+		*returned = len;
+	if (remaining)
+		*remaining = fmsg->msg_len - offset - len;
+
+out:
+	spin_unlock(&queue->lock);
+	return ret;
+}
+
+int reqfwd_queue_complete(struct reqfwd_queue *queue, const void *rsp,
+			  unsigned long rsp_len, unsigned long *count)
+{
+	struct reqfwd_message *fmsg;
+	int ret = 0;
+
+	if (!queue || (rsp_len && !rsp))
+		return SBI_EINVAL;
+
+	spin_lock(&queue->lock);
+
+	fmsg = reqfwd_current(queue);
+	if (!fmsg || fmsg->state != REQFWD_STATE_RETRIEVED) {
+		ret = SBI_ENOENT;
+		goto out;
+	}
+
+	if (rsp_len > fmsg->rsp_max_len) {
+		ret = SBI_EBAD_RANGE;
+		goto out;
+	}
+
+	if (rsp_len)
+		sbi_memcpy(fmsg->rsp, rsp, rsp_len);
+	fmsg->rsp_len = rsp_len;
+	fmsg->state = REQFWD_STATE_COMPLETED;
+
+	sbi_list_del(&fmsg->node);
+	queue->count--;
+
+out:
+	if (count)
+		*count = queue->count;
+	spin_unlock(&queue->lock);
+
+	return ret;
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
