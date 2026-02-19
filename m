Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E07E9A03B
	for <opensbi@archiver.kernel.org>; Thu, 19 Feb 2026 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xX4+YVpBiNJnWR9kBwaQoFLLma5fOIHb2aQCrOgDvY0=; b=jHLcXZbTF1YHEj
	1XMuHRtrJmz9bmsqUtyKYSu3lrD+X7OrF6j4OEdDeaAFPqO+HWgZouxTUqKvkxHnqj58qpE5edo0b
	U+MxX1tGRv2Xit9fmbrKih7mTgccwszXg/flJev0ozSrELvKoiKP/5pt8Wa3YtGVzw5uxBKDQq1KY
	jjMgnjHTFwXuj/9AOX2RupxKVBPDwwL6MUnYtK9aOb4eUC16ycYfnrhLUaxCUusBH6nf/QzCPvy0F
	mUl5+eopZm1TVwpJiTUwoljxIlqUF6Gkk0G+CntxJNQWMECq4Wwrn6iMOCuNZGRHuCE1dP84rKwJa
	NhuKwIH+PC+OGgWrVdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszUY-0000000B8EW-1woO;
	Thu, 19 Feb 2026 08:34:34 +0000
Received: from mail-norwayeastazon11023082.outbound.protection.outlook.com ([40.107.159.82] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszUW-0000000B8EA-3CEA
	for opensbi@lists.infradead.org;
	Thu, 19 Feb 2026 08:34:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB7iM7XcPEk8eitF7TfRtq/90LDjTiblvuPS96mlwy4oLwITlhjB/ZIuUddusYs6M2fNRudBwFflyjHuuCTG4W9IbiTq9IosNBVAkAozHemhRTrGrqUI/284I+xYObCL6nVvXwgndGUF/Wax10zm4ooHhvcjkR1NuH4Zfp1S2S3HvMMsWXXfSPHNTjlxDnoldVChW+SWxSSvAR1rtW5NYJWoCVm0UYaJoGCxqM/KFLtekhJ9ZnmAFVKZz/WsUEW7TDaJ86OzfZcn3oO30EdQAhKNY5GO3lJ9dmqyfBb6hPWzW0fOF9GPKsEH0ZepJwSqfwRgz/duGN5nyFCHoiO9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4izYzgmkE9EKuNQR5c4oo9R3RuvhAV9SI2dkFGPEdQ=;
 b=ZVZ9hy7lV1A5SqUz5oBcDA2/IQvcNbcL6bKTBnyGCrel/F5hDNX3st90QoXGKULymtqt+TjgJdxr//Ry26MUWjK9VpsG1ofII06+jxLUUk8dct7TV/F8ZONK2GWURIwdbQKwH35VrxPaMUlPb/QAxZnnDmtqzsnKOgkd9uKCJ+nVsjd5ZUELGV3yrR980jCxP6KtzbPXbKR4UXudeTSzozkWQWzUH8SesxK4bVXmXyAVshwX65Gr7a23NoRSrY/ACEzgbo+am71oFxxzBV+gDMoEk+vV/XE6y+rhQ1t6f0WsRbP5mT1YhR+9MShNzJhBBGN6Ux8PePoUUbf/nGjHHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openchip.com; dmarc=pass action=none header.from=openchip.com;
 dkim=pass header.d=openchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4izYzgmkE9EKuNQR5c4oo9R3RuvhAV9SI2dkFGPEdQ=;
 b=XjgqmZ6F5OQvwg9CY+Cni/J7IuKwC73tcIFKrIhkkBW6+gnH/bwBjcLqQDY+mLeIdmyXLGgpgJx32zLwRvLjbzLtqXOaXo5JvQuHbvf6VHuK2SEOVRi/IBb4NRECdgRpE5MsD9MlapscHK8T+f7zbbMRU5g6uhSyIPndyxxGDQ7mwwXW0AXjjJBWOXPxadZX6YCON0jcDlfF303nCmKKZokubAWyVmgom58nTzfV5bnlNbm0kA4QB8uXp/Jjk1RVam7RqXusZUFLBvdcPPYUHcVbdfZzP4a0jGLr5poWXeVQaJliu/uyOvQ60zIdxPFIcpoIOx+IBUF7/qmo7YuT8Q==
Received: from VI0P192MB2806.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2cc::18)
 by AS4P192MB1742.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:512::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 08:34:27 +0000
Received: from VI0P192MB2806.EURP192.PROD.OUTLOOK.COM
 ([fe80::6908:bd76:30af:13cb]) by VI0P192MB2806.EURP192.PROD.OUTLOOK.COM
 ([fe80::6908:bd76:30af:13cb%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 08:34:27 +0000
From: Victoriano Morales | OPENCHIP <victoriano.morales@openchip.com>
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: Victoriano Morales | OPENCHIP <victoriano.morales@openchip.com>
Subject: [PATCH] lib: fdt_helper: Removed unnecessary dt parsing check
Thread-Topic: [PATCH] lib: fdt_helper: Removed unnecessary dt parsing check
Thread-Index: AQHcoXqPLGAYj4XXqECxa9xdO9AjJg==
Date: Thu, 19 Feb 2026 08:34:27 +0000
Message-ID: <20260219083423.30690-1-victoriano.morales@openchip.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=openchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0P192MB2806:EE_|AS4P192MB1742:EE_
x-ms-office365-filtering-correlation-id: 6a973bcc-5231-4015-935b-08de6f91b189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?hhdFknbNnVHXid70TMgkW8RXc4qul+J3FK52f1PYahKVoO+FYjU1ocS12P?=
 =?iso-8859-1?Q?QUJAMXJzb8+rfzP1vtvgPTEOxfWST7+H91Q1zceLGYAoJyedIetLFWbM9G?=
 =?iso-8859-1?Q?6WDDmiHx8lAbphtRg0eMc1lTRKIvt9QX3OxrLLEMQcYto89/msGicAaCOL?=
 =?iso-8859-1?Q?yxJ/r8HLNSdlHJUr8shXmSQ1x6bzuo65b0sJjnF4ncB0G/N8RF/1ATAzGP?=
 =?iso-8859-1?Q?xSoJBoNbBs2l/FUhHEDTboSgwGFOxtj+ysw61weaDYrtXJimx7ADPktxPy?=
 =?iso-8859-1?Q?9QIZ51bMNwsV4vbM+wCSvHRGNU/b3yrU//z42Wx6gf5Xjfu4Lsi18E0EhZ?=
 =?iso-8859-1?Q?JbK4ZxdfhSr9ESJWSScl2+n72F4SiZ+lPEhd/pXwT8MjanzuYIMC97ffMA?=
 =?iso-8859-1?Q?zWCN/Em3uXIhrB6H0f1BwucGsrhpVHXYg1GgRc6ShYmEomUzQfEsQ6lRVf?=
 =?iso-8859-1?Q?vljBfQnCLMj2h2XzHHHm4yc5wKdm1wbirUJvcQKHNctdEoXliB5lej/3N+?=
 =?iso-8859-1?Q?8BUOFKsb0XpvprwiSWVnF4O/2wQ/oU26X6VfNCKtzqqxukU2dy+/yIer49?=
 =?iso-8859-1?Q?q7ndqls3POO0LX82a5Ps+I2TtgRrmnuzEJfqcvtvLBSuginQI+46ZHdsZY?=
 =?iso-8859-1?Q?vtyVd/xOZbtgmPKxusNeP4H/8/DGzfbEbwegAZDFDfQ/IQ9gCzbrwCYXqq?=
 =?iso-8859-1?Q?x1/Ys5gmTOitO5ebRg7a1YQG2yPvxY2Rq4yoWdCkP0NWqlz+kkaIo2nXZr?=
 =?iso-8859-1?Q?znlm70ulRxLhPXGo9CxqQ56uZbcmBEoGYny5dEHWhpzWuDsuR20+5m1AOh?=
 =?iso-8859-1?Q?3rul3hTmvOOkzcjTC5EIbgkkd9x03Q9/yjre06Ri6sC/pFJ6EBRCivWDKq?=
 =?iso-8859-1?Q?i4dAzis5P1jigxX2sM5da0NQ3xmnxdrcgxmMwzKikf2EASKP7vF1DtXy4E?=
 =?iso-8859-1?Q?E8QjuCBAfbd2ZujIBlhaJCC0YMG+MTOLDHs9NfTNpj+BowUgJ2QtYVkx3l?=
 =?iso-8859-1?Q?Fal3NTlb0lPYHm4y29BWKwdKL2naBOBu9TwXOsgiHU1bMyUpzrkhxz+SBB?=
 =?iso-8859-1?Q?aLa+9Pi3fks3YSmCR3YdmfQ8YZX+ZcRQvqg3o9vZy1yU6C2bxQPn6CrOcw?=
 =?iso-8859-1?Q?9Sbx98Rkhlkn68BpVzhDrcQsVfypLAYeAr7/oIE5ESqYUDzSD/jyo9BnYl?=
 =?iso-8859-1?Q?8qu6Bot7drJfENGn2IKN2/bpR/+xfXL4Y+YBen2MPcO+1gRsAZLNGXSPcY?=
 =?iso-8859-1?Q?lLJhUmdaVGkUEfR0SrHttfIM3kCqQ4lvNM1S/BP+//AnWbI+Z19jYqZwvY?=
 =?iso-8859-1?Q?IHGYQoQIYarbfBXgLFMRwxHEHxzp+FSnu+gFfgVIEDDysIulkhz387+ulb?=
 =?iso-8859-1?Q?tiv7Tk/vK7+6pijN+DWId/diaBp1eeZ9e5NLL0mZWawmg8X7QOunjme08X?=
 =?iso-8859-1?Q?rLogmOYHZqhE3NTcx8tZ7kIpltSP2ag6hbQjzNrR/2l+LMwndbCs6Z6kEy?=
 =?iso-8859-1?Q?ijPDw0fylBEQbgkJsIqG6Fyv9Of1EMKG9/v21GCi95FT1SNqXfoVh3LsGv?=
 =?iso-8859-1?Q?JjesiSP0UOeWWBlZ4id1LOv70BzBdTipVUBYZWe/x9c+ShkagMkGEb8YqE?=
 =?iso-8859-1?Q?s09pSAx6p86KpqnecoICFRFfwVpon6b1CQ8bKqLtWY2Fzc1/xsFofdI+lZ?=
 =?iso-8859-1?Q?9ST/PJH0TW2tYSRaIvw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P192MB2806.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iMbU+0Y3hPtvrRAMMFoYw8AuqqSJIsAYBgEIMl9Ry7r24pACtZM+Ngchhr?=
 =?iso-8859-1?Q?0KUqhsEBfZJCBT898xDULpEPu2xQSvfgRPthU5HsbaC5l+CQajdqzuU0sj?=
 =?iso-8859-1?Q?FZVNY1jusxhf+qBZEGGx0rbuVo/Kj0rIU1TSIdRA8Tyn+MkVD9zgDm7fbU?=
 =?iso-8859-1?Q?i0B9jqtNQ0MJfLmBk0vS/l/z91idQrpaQZPuRwsoAB3a/LIRR98SE00NWY?=
 =?iso-8859-1?Q?qt/4UD+VKo9Fv5XBJSttgFRvjlT6y+ykw16fetyLv6bAuhPfc1cYSOMKBN?=
 =?iso-8859-1?Q?Kfg3x0XRWdvJDGvXxvV52+1UxvoGpOGYn3NKtT6xoz4zUgwz54IrDYnAsa?=
 =?iso-8859-1?Q?uWLQcP1dMzli1L2RzJhxmB9SD/isqlZZFHE5nbkAVyQdppOho4i7xF/xGn?=
 =?iso-8859-1?Q?ov8MniiAa4LG4lCAVgV4Z2rgodJjcbL0rHHgY4iVcAWrv3HzlBmjEhyVhA?=
 =?iso-8859-1?Q?Ii2llSQ6SyjphiWIJvx5Rmi2ET5EFy9lLIoYMjIwauZdDDK8rk8gAU7Kgk?=
 =?iso-8859-1?Q?RB5bqj6eDsQPUULv7mgeV15hWTkMqJ/QeIH5ubV41k5cgkzdyhmiEhDtXT?=
 =?iso-8859-1?Q?P2bYgfbwe5vT135PMEq2XyAijd2hEmzdGOaPdUjA6VwVmDEGlbvIbCSxim?=
 =?iso-8859-1?Q?53Gf7w77vSEjKvdxJFnCRxRSfxdE3sgUT/PC1NXSCszj97PLQ/hvxc30Mk?=
 =?iso-8859-1?Q?WGlDXa7oRr2tTkCtAqOfOPxGvV7xO9bvqUmqA2Sr1Kl12d4IAZaBiYfObx?=
 =?iso-8859-1?Q?QKIpd3CnRThkPgMyqNPia+5ljk97Utn0iRLTg+jxiBJq1o3APA3zJFmZhy?=
 =?iso-8859-1?Q?xO8ftQF8fJw5nXywMx0BmRszE+hhxgBx00JLAD4RuZxS0q7lhWk5mxK20+?=
 =?iso-8859-1?Q?uMc1CT8uQhZ+S9xYxqrxphfHP54eE7XvD9A5wLtU1Nu63XxzS2J6dQpgRr?=
 =?iso-8859-1?Q?79wYMuiv6yTUpFZK15msgpa0Lb/cGZyldlkW5dvZibKal5lWXc7fMjHgle?=
 =?iso-8859-1?Q?fI5ftZmv5Q8rmCIwQDDwLYMSOC/Iyi+pGDVtCCr197nl/FBfWMM/nidYO1?=
 =?iso-8859-1?Q?njP7oJMQaNhN+QCLnG1NIonykbGL2E1lt7i8BYZVvEoazUcY5ezE30fjh0?=
 =?iso-8859-1?Q?Q5CnQK8M+LKTiojUjduF57rktoStP2k90fv2w7S+xx3+y/8+CJuRPWFBOT?=
 =?iso-8859-1?Q?b+ma4ZO4opd08m38XMCRToBd+pUU5mBAEH2FVzKdF3IVI9OJcSYbY1BN1q?=
 =?iso-8859-1?Q?EnEHEpV1LPjbIy7Xx7VkZ/+EmKIXE2YwgpuGu6SlXqAqW/Zd76/N3J4xD3?=
 =?iso-8859-1?Q?rgNFqFHSk7vayNoESlGyVqsHJVLX/LI5pzJN7PyvETZS+q/cYLado8NveT?=
 =?iso-8859-1?Q?BRpmn7gofXJHCoUippSZ2xt7jifVinzP9bxeKxmKjaR7G8o4+Q1oX89N69?=
 =?iso-8859-1?Q?JdUQC6ybGu7nPkr8NBoZ5sEmq848haj5qhirQCoOUxsKTot00bWEGP0L5U?=
 =?iso-8859-1?Q?pEl8K7a4vq8Vw/zCOAL9dp6mydaY+bKJAuO/b3YB9CAsUqWIBRGoOyW+TP?=
 =?iso-8859-1?Q?sY3Bp/UcBjEGT4FEHJSOk2Qz9u0BYZx1EAGOTwEu8YfsuHjwWzTfI/ZsbB?=
 =?iso-8859-1?Q?bRi7flHBI1jTTRINpJxKSKeH/htZ8h57adkmXw5qJ5LuVHvVgcuWecigxn?=
 =?iso-8859-1?Q?SBlsCDHya1gp/VCSJEm4cp7NJ9tBHKqGRRaFwp4DGmlnV1spQy7SCuM24Z?=
 =?iso-8859-1?Q?fsLCSFNTTAPMTRfPlTMgemRasEVRTsLtSosMkk2wU2u1sj1sABkcGYblAE?=
 =?iso-8859-1?Q?duEYTwNNNxLvC6mRLcAkAWyCq5f5L9g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: openchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0P192MB2806.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a973bcc-5231-4015-935b-08de6f91b189
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 08:34:27.2246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dfdd4aff-e2c9-4e1a-8642-7f6cc6bbbe6d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jh+We7aUMCvvFeDHf0l+Bo5hUX3iHpNBAFciKgVwm717JeXB1SQNrMPjKwdO+1BvKO+WRKHzmYKCZbBAQrihy5ictr/2d1Yr6CUrzYpl3gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_003432_816992_5CE19A46 
X-CRM114-Status: UNSURE (   6.40  )
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

From: Victoriano Morales <victoriano.morales@openchip.com>

The check for the address being different from 0 for the UART, PLIC,
APLIC and IMSIC dt nodes is unnnecessary and could skip valid nodes.

Signed-off-by: Victoriano Morales <victoriano.morales@openchip.com>
---
 lib/utils/fdt/fdt_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 799fd48d..a8c6e1aa 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -502,7 +502,7 @@ static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 
 	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
 				    &reg_addr, &reg_size);
-	if (rc < 0 || !reg_addr || !reg_size)
+	if (rc < 0 || !reg_size)
 		return SBI_ENODEV;
 	uart->addr = reg_addr;
 
@@ -671,7 +671,7 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
 		return SBI_ENODEV;
 
 	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
-	if (rc < 0 || !reg_addr || !reg_size)
+	if (rc < 0 || !reg_size)
 		return SBI_ENODEV;
 	aplic->addr = reg_addr;
 	aplic->size = reg_size;
@@ -863,7 +863,7 @@ int fdt_parse_imsic_node(const void *fdt, int nodeoff, struct imsic_data *imsic)
 
 		rc = fdt_get_node_addr_size(fdt, nodeoff, i,
 					    &reg_addr, &reg_size);
-		if (rc < 0 || !reg_addr || !reg_size)
+		if (rc < 0 || !reg_size)
 			break;
 		regs->addr = reg_addr;
 		regs->size = reg_size;
@@ -885,7 +885,7 @@ int fdt_parse_plic_node(const void *fdt, int nodeoffset, struct plic_data *plic)
 
 	rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
 				    &reg_addr, &reg_size);
-	if (rc < 0 || !reg_addr || !reg_size)
+	if (rc < 0 || !reg_size)
 		return SBI_ENODEV;
 	plic->addr = reg_addr;
 	plic->size = reg_size;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
