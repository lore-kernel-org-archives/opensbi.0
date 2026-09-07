Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80326C79F9E
	for <opensbi@archiver.kernel.org>; Mon,  7 Sep 2026 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mwHBUKEhtsD7iehRYuEMHJczWwXE4BFhojknXHdLPqw=; b=Flc6RkHHK2m87w
	gRUR+2Sn5OMxfoOooT7qCH/glwloo57EqHRczSzHbVGQ4pf00sHu1xQ5vrEGHkKSIyvV4C8x+VUGh
	N31okrLVljfOG7hnSTp74cOP5Dr6fxfWUuMblejN8re/DNvIpRPH0XDfX/DH6kYubn7fydP1tdL7Z
	GcZ3YaiQLNatMlcj6TI9cGgONdlodc83G2KmDD9FPH8EW8nN02TUkhkWiy3ztyG8bHyPvI3NpuqW6
	b65pPyxQq5s6Ak+FbDSZx58Al3/1+ZEmGvj0dcJyV9ukV3VAnu8dDDqU6NGrof9JhpGjm4QXrZaHQ
	xfSyKOaBpdQbYny3V1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnK-00000006hUr-36Pc;
	Mon, 07 Sep 2026 11:45:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XnH-00000006hUL-21xP
	for opensbi@lists.infradead.org;
	Mon, 07 Sep 2026 11:45:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkFZtl9J+uRf+EeYYuCBY467EuVUjkqOCk99Nnv1az62Jry0IdoSzbXtqZ4oi2CmSOiH2qbqOJo96K43gPdPizM+ufnaPH8yfUIeFRJoIbic62bWxViwlH0Vyet+zfBWuV3hCm8XebM2OMJNmgytWtypKwNSKffltfIU206tDDABx2kva0aCsIqpj3agG8BNm6S76sCkVuN4o0/W8vO4CIMcRWuwz9jSf4LgdT10poWp3gSxJqMR2nBfUKwrcwmqhmnfDT85OjuxWQTblIv8G1FPwUB/4jF0CNROlxYvIvxtM74Ej6ce0G25IsXMHO8196B+QPdloCeRDV/qXLVjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8cIcl+sGV7XkKVCY+cbFvFi1VBlX8jBp6Ars14aF84=;
 b=qjt2U06U0bP/ZlwmhggePAZ+IEkR6+q46H0NljSUEDHcLiE/DpVnwqwFHP5QHDu6UrtatgH8rDqfPApnJNWMLXsenHQLIn5UlG+CwVTUQkm5thFpLOAyrJcvbBB/gvvcAvRvJYNH26C4llUjiWX5FGX5pz/dlOvG1nX4qskwu+9Hs0Shwjewd5hOW4qwVEo69bg4+J/3qw0ilz2BrufAIHkDT7hCywKp2sj/oAXd969WuR3Fk/XzmPPpmHEogHHbk9G/giA31o4DkB/tuPLMZuJ5x14rlZKsX/02EkSXk8WHdLSRoZCku+SkZhEJAy6Vqqf7QHV5ABqOweqfJ6Q/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8cIcl+sGV7XkKVCY+cbFvFi1VBlX8jBp6Ars14aF84=;
 b=FzJc2jdGjg5T7jv5j6/6R4i/w/N1TLMsV0/vJxCU2oAVT5i+HMh6D1gauhoUs1dxwZpSgCLI1OIDf8kWLMdDgLR6E0YubewGnzlvnwRz2OUaqF/8sFa8ca7hxRMPJDLscFTVKVyellPk/gxdwDqVrcV0Yjfajz7yUIcmCP537VWwvy5d2RxVggE1pigx2Wy6d+vGnfMgJgxwosxm1bYD892gcU/yza1qFkEq4J2A9JtcjtwFAocMUZZEMCsHnF5ML/0DhZdHa2OyoGCk2pV1EEdJ+K4OIIGGqf5sM9TCioGgBzJ9i1p4xhB8NMoKpzAkpCk36QsHvZMSDaWsp9hNvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DU4PR04MB10575.eurprd04.prod.outlook.com
 (2603:10a6:10:585::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:45:42 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:45:42 +0000
From: marouene.boubakri@oss.nxp.com
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	ranbir.singh@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	maroueneboubakri@gmail.com,
	Marouene Boubakri <marouene.boubakri@nxp.com>
Subject: [PATCH 0/5] RPMI REQUEST_FORWARD service group in OpenSBI
Date: Mon,  7 Sep 2026 13:59:08 +0200
Message-Id: <20260907115913.101752-1-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: AM8P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::35) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DU4PR04MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d398ecd-3b84-4422-d441-08df0cd58ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|366016|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: /F/+qaYC9YtOjNtIAlzKi0XsoLEbGnjnn5nJYKtSCDBFqRKLWGsQNfFGHi+Ca8x6wP3L+F/TDRYZDWC6htUWwsfi4aONaPpZDeaxBwWLub5EgOyskr5F2zHCgKBXCX3hAwZQlXrwpAWz281cZJODLzod4J5oDf5dVv2VVPnt3ylcUMHK67eT4PrjUKydIJVYKrQhp0RR4PwMpw/0blbboD+wNuZXfElDhvdbOGluYejuONj0gm8JZwXps4Xk31xWu8hAs4mIzQQ2SHWXIeLYPBk/YLVt4BsEBo9RPmYyQYQHOVImV4/Idz5c+2p9+iCvUbr8NxgJRfqzQV9qRuSO/mEniQpzZbi8maTzFDwt21MTTUvUH2iltll2M9YYeS/hfv/4yVmckKTuhxEKW94JDCl74NOpA3zeH/aZCl+wq/99Nz4lmiNJ+B+z8vySFrN4rD73xxvbClUm4tOHK2eRAvkK5rBKX1UUTdCUWRXeuhtgAKJiRGxVvZgGUuiWKIE/ovQ+OJ0FedTXE8/tYrieMThHn1cWEIaYrKBQG9yrPXnovBdnehi93QxAOGHSDDhudKMMdP8TsIWgCPi7LRjdkr6AF1OevMjLikfbEWCy8Dauv0HlKDlLzIRBo3sBSP06/3gszSsAbidmCAwcBkPLMdzE384P4AQuYf8CB/qktjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gCXrig6MZauPgIf9F40po4fzWj4qP2MJWIwYMdPiBDgTFo8aZL61UXjp4KaD?=
 =?us-ascii?Q?xg+YjwkmmCaf1wQQ0L4g+fxRFV+WPqOERtLEl+4VVHxJqJ2N3bxskg3Khn1Q?=
 =?us-ascii?Q?M7Zgl2JSzclxkyWQwteen6dGGHrhfr07fv4a/FhyiI6ScSoU5+/lvNeYnIfm?=
 =?us-ascii?Q?E0TNV4ddL1OVL7WSVCe/vQDOg3zrJhbLVIGDiNFiBFITjr3oVXbc/O8/qvvj?=
 =?us-ascii?Q?B8KukPWTePVT8geB7xsYhl607sJC2ZZTkNHN9RN8dWcdhBodHt9FRLGAlyx9?=
 =?us-ascii?Q?EMKttUsodHtywBsmUbvt1JSlGYB87J/GmVLJ0c1H1+Yrdb2yJJkem8Wy4PZq?=
 =?us-ascii?Q?tcAInII8+Pqq/LfUHIm2/B3tFjW/jZxQ1Qn/sXJdDzoRvSBhVTHba8xCel1t?=
 =?us-ascii?Q?u+5+oFm1khyDW3m1uCktPQ0hYW+GvzRf3yxVjOY4ZqWjnrK8V6sNHhHKDhah?=
 =?us-ascii?Q?QySrqQ1spLv2qr8HX7cgRkqm0D+fSH3YP1NxxWwmCgiC3amak26qfRmaNld5?=
 =?us-ascii?Q?vvLSI9KRz2LTzgcr+1txAiq5HavAQ5+/VfxOC5lCzqFOXm//3k2AYTPHeRyd?=
 =?us-ascii?Q?nXCEf2FzBYwO2XKJTvWk3YfZ9wn8ijyF48xDtRllFiDZk5tRt+91bTi364WQ?=
 =?us-ascii?Q?0gswedObcJtCIY2UtRy3ixz2oNttUWEef0kqM7beqZrP476xmzQrbcdeVN4Z?=
 =?us-ascii?Q?j8U3YpqbHfqcokfT6Gb+OISWzWKLKN2G6854KUr0ML32RMn9Jll6+C9YCFlI?=
 =?us-ascii?Q?lGYmVFKeiijhqndWSoNuQREdvjS13w4OfsO2/RBbrPoZav10aB7Jt98g43hn?=
 =?us-ascii?Q?ZhrMqkgf7IkH5mjSlFhAIHOlFoyN3RJUfDVFwX1E6y6ubQd6itpQz9+VnG3b?=
 =?us-ascii?Q?WVocbI60ynycQFplBh8QjM13Zdmcwk4CASmMVMbdaW9jcq3Devlfs6dhh9AX?=
 =?us-ascii?Q?wFZERMdQZJIHF7JxgSlNoTztO457lvqv/0T2QdY4SyH0pEnTMpPzDje2S2DB?=
 =?us-ascii?Q?li8JxY+rVWabGZVXwDD0Ysd7rvf5QZgXX+j/CL6smVBl/e1BWJg6izdHlNXb?=
 =?us-ascii?Q?hEbYApD7WZO5Za6cnjlRjvEsPZFfRoB5hQsv8GDc3d234Pbe46wXlM3HmEKk?=
 =?us-ascii?Q?e4RrJCAZIk+w/qg2vzjCSPhv2Oh4o2ESvRB+z7FWzaYjHnbRy85joexyLeps?=
 =?us-ascii?Q?vJp/OwD8uAupkF4xAQqbubTAz1CiJrqLA4h8WTwayUmyD8yapwPmvCNGVARh?=
 =?us-ascii?Q?nDDT6MIVH1OODTf0uuVGd9zSa3aWxLwp3qX3UAxA2iunAYA/ItX8Ew9Li8XY?=
 =?us-ascii?Q?/FDf5YiEmzVvBa291mx1ajTuAje6ytAKMcY97FNioZb8n65zutXqVmEQbMua?=
 =?us-ascii?Q?vsPFKcIzR7heBJC2w8ooggSWz8Z77KBILXPfIjWQCD4NHVNQo3ttZa9FbcA4?=
 =?us-ascii?Q?2lUeb9aODBkKdvZTl08Z1DEeMB4zdtHeJ6wrjLWt2GH6B+r0W9w3ZdHl6GaZ?=
 =?us-ascii?Q?iVfkG04FdZD9+GHhCNc5phwLIuxu9ktsB7S7bjChe7bcbfci5S1KknVZlsr3?=
 =?us-ascii?Q?GK3SECo2F7SqHoq2CaSC9Rluq6tksOUxSXPrviFlMolLxuFcpEIRl37oIUlJ?=
 =?us-ascii?Q?f3TwWMYJ9lQwHWM5N3SZMhKDKFhn6su7YawyKbXp+2OVIE80KhqFTDOKIhxn?=
 =?us-ascii?Q?uz5EyW1i7hUV8xdVTXqtEQSO5aBREZc0AowfiBmadeO6qd1NLVmwJ0/oLKfZ?=
 =?us-ascii?Q?APHwebUELjTn9mH3wN3sYjTOrkpHw3aeYLDJf+coRKg0IBTd5FZxYWrkw8Oh?=
X-MS-Exchange-AntiSpam-MessageData-1: YuyCbezvJakD/Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d398ecd-3b84-4422-d441-08df0cd58ba2
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:45:42.2168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+a6lrMq08HS51tQ/kyNVOKKXyt4C4kQmoPDBdZQFGbzNc2T3/5C4qhVbQF2cD2Sckoec6ojj50IDg9PTKCphtrIiKyliyB/hDnJmisG7bPJDk0UrLIpELe6DvXtAZgRpydvjgrJ3KKIkSu3fy3vnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_044547_828655_B5ECBBA0 
X-CRM114-Status: GOOD (  21.56  )
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

Hi all,

I maintain the RISC-V port of OP-TEE. We are adding Management Mode
support to it so that a non-secure supervisor can invoke MM services
implemented in OP-TEE, and RPMI already defines the interface for that:
MANAGEMENT_MODE (0x000B) on the calling side, and REQUEST_FORWARD
(0x000D) on the side that serves the calls.

The piece in between is missing. OpenSBI serves MANAGEMENT_MODE today
only by passing MM_COMMUNICATE to a platform microcontroller over an RPMI
mailbox (lib/utils/mpxy/fdt_mpxy_rpmi_mm.c), and there is no
REQUEST_FORWARD support at all. When Management Mode runs in software on
the application processor there is no mailbox and no microcontroller, and
the SBI implementation itself has to be the forwarder. The OP-TEE side
cannot proceed until that exists upstream, which is what this series
adds.

The RPMI v1.0 specification calls out this exact arrangement in the
REQUEST_FORWARD service group: "This service group also allows an SBI
implementation to forward RPMI request messages from one system-level
partition (or domain) to another using the SBI MPXY extension."

How it works: an RPMI request that arrives on one MPXY channel is queued
and handed to software which pulls it off a second MPXY channel serving
REQUEST_FORWARD, answers it, and completes it. The response comes back as
the response of the original request. The queue and the REQUEST_FORWARD
channel know nothing about MM; the MANAGEMENT_MODE channel of patch 5 is
simply their first producer.

The series touches include/sbi_utils/ and lib/utils/mpxy/ only. There is
no change to lib/sbi/.

  1  the RPMI v1.0 REQUEST_FORWARD service group defines
  2  a prep patch moving the RPMI message protocol attributes out of the
     mailbox header, so a channel driver with no mailbox behind it does
     not have to include the mailbox headers. No functional change.
  3  the forwarded message queue
  4  the REQUEST_FORWARD channel driver
  5  the MANAGEMENT_MODE channel that forwards through it

Notes on what is deliberately not here:

* REQFWD_ENABLE_NOTIFICATION reports RPMI_ERR_NOTSUPP. REQFWD_NEW_MESSAGE
  is an RPMI notification message and SBI MPXY delivers those through an
  MSI or an SSE event, neither of which is wired up for these channels, so
  software polls REQFWD_RETRIEVE_CURRENT_MESSAGE.
* Both channels are owned by the root domain, like every other MPXY
  channel today. Making channel ownership follow the device tree needs the
  platform domains to exist when MPXY drivers are probed, which is an init
  order change worth its own discussion; it is not needed for the
  forwarder itself.

Tested on QEMU virt with two bare-metal S-mode payloads on two HARTs: one
calls MM_COMMUNICATE with a buffer in the MM shared memory, the other
serves the REQUEST_FORWARD channel and transforms it. The forwarded
message is retrieved in three chunks (the channel MSG_MAX_LEN is set to 20
bytes on purpose), a request outside the MM shared memory is refused, a
response claiming more output than the request allowed is refused, a
dropped request times out within MSG_COMPLETION_TIMEOUT, the late
completion is refused, and the queue is usable afterwards.

Marouene Boubakri (5):
  lib: utils: Add RPMI REQUEST_FORWARD service group defines
  lib: utils/mpxy: Split RPMI message protocol attributes out of the
    mailbox header
  lib: utils/mpxy: Add queue of forwarded RPMI messages
  lib: utils/mpxy: Add RPMI REQUEST_FORWARD channel driver
  lib: utils/mpxy: Add RPMI MANAGEMENT_MODE channel over request forward

 include/sbi_utils/mailbox/rpmi_msgprot.h    |  50 +++
 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h      |  64 ++++
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  37 +-
 include/sbi_utils/mpxy/reqfwd_queue.h       | 157 ++++++++
 lib/utils/mpxy/Kconfig                      |  15 +
 lib/utils/mpxy/fdt_mpxy_rpmi.c              |  29 ++
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         |  19 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c   | 391 ++++++++++++++++++++
 lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c       | 280 ++++++++++++++
 lib/utils/mpxy/objects.mk                   |   9 +
 lib/utils/mpxy/reqfwd_queue.c               | 198 ++++++++++
 platform/generic/configs/defconfig          |   2 +
 12 files changed, 1198 insertions(+), 53 deletions(-)
 create mode 100644 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
 create mode 100644 include/sbi_utils/mpxy/reqfwd_queue.h
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c
 create mode 100644 lib/utils/mpxy/reqfwd_queue.c

-- 
2.43.0

Marouene Boubakri (5):
  lib: utils: Add RPMI REQUEST_FORWARD service group defines
  lib: utils/mpxy: Split RPMI message protocol attributes out of the
    mailbox header
  lib: utils/mpxy: Add queue of forwarded RPMI messages
  lib: utils/mpxy: Add RPMI REQUEST_FORWARD channel driver
  lib: utils/mpxy: Add RPMI MANAGEMENT_MODE channel over request forward

 include/sbi_utils/mailbox/rpmi_msgprot.h    |  50 +++
 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h      |  64 ++++
 include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h |  37 +-
 include/sbi_utils/mpxy/reqfwd_queue.h       | 157 ++++++++
 lib/utils/mpxy/Kconfig                      |  15 +
 lib/utils/mpxy/fdt_mpxy_rpmi.c              |  29 ++
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c         |  19 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c   | 391 ++++++++++++++++++++
 lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c       | 280 ++++++++++++++
 lib/utils/mpxy/objects.mk                   |   9 +
 lib/utils/mpxy/reqfwd_queue.c               | 198 ++++++++++
 platform/generic/configs/defconfig          |   2 +
 12 files changed, 1198 insertions(+), 53 deletions(-)
 create mode 100644 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
 create mode 100644 include/sbi_utils/mpxy/reqfwd_queue.h
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_mm_forward.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_reqfwd.c
 create mode 100644 lib/utils/mpxy/reqfwd_queue.c

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
