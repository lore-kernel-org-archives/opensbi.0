Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ADFC79F9E
	for <opensbi@archiver.kernel.org>; Mon,  7 Sep 2026 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wM1IgnHFhdqRp0g9mbm0vUl45aXjVlMvN+tWyZR5Oc=; b=xFa1b/fyO1AqRS
	bMozZN3XBpD1Zf8sfXq1kXDzZq8FUMwFBr/nAwjAzczyDNvN/GiyyW4E8pheCRjH2n6W5icO+hhrn
	hjE1qU0dQCi8JVfJHr5YXZI/YX5Sr4/ZnAGEX9TK0/X4WBweCNY4SeuQQK18pMo9PUT+U73/hLTKp
	b5KmkgOGDQ/8nqpSCtERCDxxcr9tR7LclkvID7HKP+zPYMIeufA7/L0byRe7lYIgqDrrbpu5DyLMU
	rftPx88UoJrbxcY/NWoaw3LiZ6wi/3+BYJQpgsohvTmtNHZ3ZjB3+kryt+LYR83a/pBp1A9JqqR/U
	EqgXVO52x33eMgxs5Q/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnR-00000006hWq-3Rzt;
	Mon, 07 Sep 2026 11:45:57 +0000
Received: from mail-francecentralazon11013040.outbound.protection.outlook.com ([40.107.162.40] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnP-00000006hVS-0IR6
	for opensbi@lists.infradead.org;
	Mon, 07 Sep 2026 11:45:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBNtidIbL1PWLXQL6IVwz3nOErOm3GtGLccs+u8OR9HEwFRWmXKY68Zmmwj4E1Vg5pI75VBZ7hTIGAGFkd4+Y8L40iKzhfyb7Y2U6wM7VwjKcAZIyC5/rcGSqMkBPNRNWLgmvhHazWRxc2iIdkQ22cmn+y6lDbVvZdhSfVtUAiGf0PSvG+5YTgE+gULhvM+M4dpZZ4NYe4AG845cIK5bVDMfQ1zOAWnSCCdpWa69KNMQbosXD9fx7st8YR5JtUpfWxG02YG1gof8bs+mojFoqN4neX9AOiuTkC24lgsN2LkjuZc/tfy4lh9Y4mgC01qIGLVeUBphYyF2qufRcLon3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBGg85BlzTrQTqwGAdfYRGLRIKM5Ub1fI81Fdv5ic0s=;
 b=W2vwDrcpAQLj/G0zb8p6G+0zFH4To6lP+SogGafHbX5sLrVI6S089XhlLyRxAG7NncP7LYdKnS1Q+TfXtYfSc564dudaejSWZUsWxKvxVHHiJwMzzs9GkqyDPdSjltgbJV0Ngmm4pTpHpPAtCsjDMNyT5Eqm936ig+m7GKxLhcEqzPryio3CHhVhmNCJ7QM+o63xRuzCf/MfJJmT5cZlreUUo41xi3pzHtw/fOoLJ9tcT9U/ew1D+/skEsl4R9llmiTZ82sh83Cn0eQO5WNW0PLOwLJXPftD1+poZ4/K8/qK60stNL3tjGDc0W+4JJjhNtkqfRJXWX2TEreKIYGhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBGg85BlzTrQTqwGAdfYRGLRIKM5Ub1fI81Fdv5ic0s=;
 b=Oq9F+YKQrqlL0fWptcK6w2Qs90U3+zbj+rftDM+G0PnusDvMqG8tN9No0CVkGnl0WC2zXVCV/8IlebbVoAcNFXGkFKOehABxfwg3wZQTcI7Yk1CnO4VBQqPwSn34plrUuhtfr5t9sxaRB2l116toS9siAvJQXvxhu4caxMXWJ4JVTNn2E0I6mqth4ZsMLUcwGMdmSS4I1KpcTxbBnjKPnN36CxRwwC9xRxDtur3Bkbv3HjHEjsMpnwYzXvBC3SI4/7ihnKP1U+yM7WE1sx7/4ey7K5E5qfWQNZMCO1nAd7GwV+IGMe7Z8SxLwBuD07b7/D9e61wLLTsUGgux5gy5xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DU4PR04MB10575.eurprd04.prod.outlook.com
 (2603:10a6:10:585::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:45:50 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:45:48 +0000
From: marouene.boubakri@oss.nxp.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	ranbir.singh@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	maroueneboubakri@gmail.com,
	Marouene Boubakri <marouene.boubakri@nxp.com>
Subject: [PATCH 1/5] lib: utils: Add RPMI REQUEST_FORWARD service group defines
Date: Mon,  7 Sep 2026 13:59:09 +0200
Message-Id: <20260907115913.101752-2-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
References: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: AM8P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::27) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DU4PR04MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 2092d512-738c-4bfd-86c4-08df0cd58f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: oS8MutCVjPQf56C4W1Zzo6XrPSd3Hc32qio83+hQs6ZBW0c6ogQCUg4y67105bgvRfRv5Mp3FYd9AfxclK1+tlFDAvWlmDVNVnw2qmnH+6XkJ4SR6hdve7Izi7GeUhuaspNj7P3OE5Uw9lNVbEnBn2c96oytV4kW56oeD6w6YiK5JaktK9/9Ty7fdCICqAnNTc1FGI35Gz5GgoOUV7+AINV8sX+SPcUv6kw4ciOKmcPh69FXPbDUbhps09uY1/+wRXVZy1iEfsPqMgIOafBkAIWV1R2HSXkxxPSDxEViDAiSSHFAEm/qMXllf2Taq0gdUphCpd+9AJgL5AUVTvGl/iJ1mitsHHr4we1m56ygUQtK4dF8lfApdEEgXSECLc1mr9WKcb+ndywP/LDG6bvW/wo/WD3BZey6T0dAuNhFQg9OkymrUk4WW6zIcOdgiK6716ZWi+ZsNfTHIsH0EmPzdxYalHlGfFnVAJMIASSZfdEEmB5BKkItBqYgu8ZvVB7pbLp+wvOakEBX5KNE6ATaaRurDP+1ReXVBpt+FQoPZAJKR51u/oKxNHHN/FKcTJRB6dDynYM1nwsi6LIVS0JXHHKhV547Vs7la9yxuni1kmBiQFaLK5G/D3WX5FuRT+bOVXfXCmZ2Iv2n6M8bYQAZGMQHLEudwfge/JJ1CKxzmfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GFsw1Ni3vaB2/2l3FxiB20ASh/OrLzCVjq0wGOYGnfF2ili6KJll+HSdAsny?=
 =?us-ascii?Q?/DlbnryNinnzuyxRfeJUA07WLbIpFK3kuQOAbbnVUyKFoK/mMbX4IHUe0kz/?=
 =?us-ascii?Q?RZ0NLKNdZj9BDwYjedtBiQ2J0jV/puOziBQ/cS7L183Tpl4jxN9PiX+PkVTZ?=
 =?us-ascii?Q?CKoWpFdWHIYAkIIoKbNXKk7aSHVeARWyCFhWo4KBEXneFNgEBjFOadwWSTds?=
 =?us-ascii?Q?66oSle3PAznr219jwtb/quvHcxM6edcstZD28sxcE98kNdxFpJXOKTpuu7x3?=
 =?us-ascii?Q?BXM3kvbRiqlNqhErWl48CCw3TqYjb3Qo5dlWFt46vvSQHavDTzIFRGew0oyc?=
 =?us-ascii?Q?h2uIknnhmhnXfOe6Auq/InluJR8ywkPvJwG0QXJUy+gt+8CK1oTFI/nmPx+7?=
 =?us-ascii?Q?aN9qISYsDQ0/vLZi058Q0g4WtKtea6KmhUY1HYgCjqqHcXGmNUZxhz+b4rHu?=
 =?us-ascii?Q?fAiBgNoTAICquS5reeJwL8H9KI44K+byRsDEDW7jwxcaepKv24SoAgOm9Wus?=
 =?us-ascii?Q?poEAYT/dTz16N9bqpRW7U9fvXneb5+fl0QwITv5hkD3vWfu0G1REPknAgHoD?=
 =?us-ascii?Q?/QJ+Pwmfo3WkRL5JCq8wyPCtlTWFYwqU4fxU/k+13DvaKgg/MbjlU2GFahpP?=
 =?us-ascii?Q?G2ZQgIrOGtXMnodSfQtdpDiIsXb1ywDhoFmMYDfJc1PlPO9cueEkTD4gZBdp?=
 =?us-ascii?Q?gcwOEKTOTSEr8/b2oL66zHfkkPU7/Z+BouLaFBxEn7fFLcpYgnnoUnZz+yJ1?=
 =?us-ascii?Q?F3Q7ToApnVSlivhENLfUMkmF9ttaAhwYO5NkQt/vzBY22oY1OLS1JmuYZ0du?=
 =?us-ascii?Q?bQWyxQK8nmfTZF0fPeGdnP0ebZp5VAAGFLOyf8BQPngZfU02S4iHd4e0ARDY?=
 =?us-ascii?Q?9eF4Supwzi7JakHRMgoYmVs8A8MlGz8we/BpSxqsfjpGRydndXfPtrYaIJc6?=
 =?us-ascii?Q?7v0bSEcZt8jU50w9jLyxU0Pf8lntM5+QdJ+1+1RW6sPhCzUsIxX6Eti5sykV?=
 =?us-ascii?Q?Uw1kT08itSWObZd8K0EhWH/9l+ZQ/zbKEuruMrENv+fU8SAHvgjRIJyqPsiB?=
 =?us-ascii?Q?tMplPiPN10uVAvnoIiJ0bw2cCGd6QIfOwWxgzC65D6iixMrmkLooZJsGc+k6?=
 =?us-ascii?Q?9IoZFdwPOCjsSIbJXIMcYP3slWgkVdZgPPpqy6uJXLQm+LRxNcadhv2E7d43?=
 =?us-ascii?Q?T9h6hBNsI4ubKSJmmKuVf21KuTjSI3uNOLb5uST5QHvQcFcheYWBofFaFAaQ?=
 =?us-ascii?Q?Wr9VebFR39av0jrpj0s1aSFiw0M7ao9zTEXzYxQLmyF+mZC7byOjCbbAFIg/?=
 =?us-ascii?Q?G/HbqqsWgQ3wAD1rzPHx8oKO7QrZR1B0VJDUJy2MJ+zYlPO++xSXfUg1cADK?=
 =?us-ascii?Q?ORxyaGHHJ22HwVOG5CUIS1Bnt3YXdBrwxHUEp1SuxI05xDRf3rxbspayiwDS?=
 =?us-ascii?Q?SeGwQ3FZoxFtvyYE2mnuEeNQicNOhTFORCTjyVg8NA4HQk1vsONittmrthwb?=
 =?us-ascii?Q?99mvlYWuygqvcQ6ro2HpAHw2AzSAAUgApJWcGJvvfnk5pghEIQcjIFp6dEa4?=
 =?us-ascii?Q?btpdTS4yf81/50A0djHH9OR34i84zOzoPhioRRXDOW7rM5DpReEl1D9MPTnh?=
 =?us-ascii?Q?Ay0fql1n7Vv9UwbyK4TiAbZ11xvkWqI73h2wK+S3cMN0KVB8S85p72zYpXPi?=
 =?us-ascii?Q?URYzXmXtMxX0oNiHsxw9u+PGyYZymkVVWTo6mL0x1V7H9p/xs9SEJTrDwECV?=
 =?us-ascii?Q?junsWr0ADMBsf4fL1C5mYW7qcLAMqxgxuPnPUsSkxZYOYTPoywgkCkoCJwOb?=
X-MS-Exchange-AntiSpam-MessageData-1: uvhqRABqX8Celg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2092d512-738c-4bfd-86c4-08df0cd58f77
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:45:48.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTe5Hnb0if4EuG0J3/7+CYjQhySNQkq7oENUhHQXMdtLr1orvt19+8AJ35DPLw820jf0g/vVdT7OizTUtyFWDGai8MOkEqIZp0xW4eU6FUPECvOHLCkfWCLLn3v7ksHwDlnTnpWm+egW6nXnppDWpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044555_115936_6A9B2991 
X-CRM114-Status: GOOD (  10.75  )
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

Add the service group ID, service IDs, notification event ID and the
request and response data layouts of the RPMI REQUEST_FORWARD service
group (SERVICEGROUP_ID 0x000D) defined by RPMI v1.0.

The forwarded request message carried by REQFWD_RETRIEVE_CURRENT_MESSAGE
is a complete RPMI message including its 8-byte message header, unlike
the message data exchanged over an SBI MPXY channel.

Signed-off-by: Marouene Boubakri <marouene.boubakri@nxp.com>
---
 include/sbi_utils/mailbox/rpmi_msgprot.h | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/sbi_utils/mailbox/rpmi_msgprot.h b/include/sbi_utils/mailbox/rpmi_msgprot.h
index 7ae4abe..a479f07 100644
--- a/include/sbi_utils/mailbox/rpmi_msgprot.h
+++ b/include/sbi_utils/mailbox/rpmi_msgprot.h
@@ -225,6 +225,7 @@ enum rpmi_servicegroup_id {
 	RPMI_SRVGRP_DEVICE_POWER = 0x0009,
 	RPMI_SRVGRP_PERFORMANCE = 0x0000A,
 	RPMI_SRVGRP_MANAGEMENT_MODE = 0x000B,
+	RPMI_SRVGRP_REQUEST_FORWARD = 0x000D,
 	RPMI_SRVGRP_LOGGING = 0x000E,
 	RPMI_SRVGRP_ID_MAX_COUNT,
 
@@ -1046,6 +1047,55 @@ struct rpmi_mm_communicate_rsp {
 	u32 mm_comm_retdata_size;
 };
 
+/** RPMI REQUEST_FORWARD ServiceGroup Service IDs */
+enum rpmi_reqfwd_service_id {
+	RPMI_REQFWD_SRV_ENABLE_NOTIFICATION = 0x01,
+	RPMI_REQFWD_SRV_RETRIEVE_CURRENT_MESSAGE = 0x02,
+	RPMI_REQFWD_SRV_COMPLETE_CURRENT_MESSAGE = 0x03,
+	RPMI_REQFWD_SRV_MAX_COUNT,
+};
+
+/** RPMI REQUEST_FORWARD ServiceGroup notification event IDs */
+enum rpmi_reqfwd_event_id {
+	RPMI_REQFWD_EVENT_NEW_MESSAGE = 0x01,
+};
+
+/** RPMI REQUEST_FORWARD retrieve current message request struct */
+struct rpmi_reqfwd_retrieve_current_message_req {
+	u32 start_index;
+};
+
+/**
+ * RPMI REQUEST_FORWARD retrieve current message response struct
+ *
+ * The request_message array carries the returned part of the current
+ * forwarded RPMI request message, which is a complete RPMI message
+ * including its message header.
+ */
+struct rpmi_reqfwd_retrieve_current_message_rsp {
+	s32 status;
+	u32 remaining;
+	u32 returned;
+	u8 request_message[];
+};
+
+/**
+ * RPMI REQUEST_FORWARD complete current message request struct
+ *
+ * The response_data array carries the RPMI message data to be sent as
+ * the response of the current forwarded RPMI request message. Its length
+ * is inferred from the length of the service message.
+ */
+struct rpmi_reqfwd_complete_current_message_req {
+	u8 response_data[];
+};
+
+/** RPMI REQUEST_FORWARD complete current message response struct */
+struct rpmi_reqfwd_complete_current_message_rsp {
+	s32 status;
+	u32 num_messages;
+};
+
 /** RPMI LOGGING ServiceGroup Service IDs */
 enum rpmi_logging_service_id {
 	RPMI_LOGGING_SRV_ENABLE_NOTIFICATION = 0x01,
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
