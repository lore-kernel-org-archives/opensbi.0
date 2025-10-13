Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB27CCD183
	for <opensbi@archiver.kernel.org>; Mon, 13 Oct 2025 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/XuKHRgH8tLIV3++aX4janYxRklBMj2Mmo6Kc7rn84U=; b=4pk/ZJH2LS6hpZ
	hPHKg2fcW9/jX2a9BgfdhcVyxWtBDENfVorupmADt0e8knUwh8al/OXQRgvVvM80fWm2X+u94Ho15
	mg+fHxep0hfe3d4T+CzMMWOjDTbgVW1mi2+06Bx7gwBdrvUGga3tp7aykNMEdbdOA+o8J/e3A35fb
	Fib7y7mFaqtQWYbT1bb3NNdbHdRMYbKbs9psLqTQNM2iTZKax7hV4Y33u9chOGie4nSndcq9syTCy
	EwR4ED82azDm6CvD1PdwhXFqOSevfTLVewzaSJBJxNzBA1nDgaVbCkbWzc7cE/+wB3ftZ4YYcJzQW
	/cVcY2dhBE/GQH47DHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXT-0000000Dh0I-1b8j;
	Mon, 13 Oct 2025 15:32:43 +0000
Received: from mail-bjschn02on2100.outbound.protection.partner.outlook.cn ([139.219.17.100] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KXO-0000000Dgyb-0TCV
	for opensbi@lists.infradead.org;
	Mon, 13 Oct 2025 15:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF7bVZQ4LqB4ZuPUf+4u0DszjifL7XCSjA3sagxc1JUX3aroiczXe8FqdmJ8uWLk03OQhXMexTyru4p+ACB6Helr4dKRK3WX7yMonDO45Hu/VEQXaMQJA0KGd6D8K9BmK/HzdXMeF47RbGvuUsB1DmVrO02DblgY7IvggcXieISZ5Y/SJTAHzGYYTq45YlIzkzuvpuyIH4Bvfehs12eMNMGEroEzXHJcp3u+Et7o1rQZ+95pdXHd8i5oJJvvTI3W8rKdNAZ20USU4jfY1WQN8FSY2foiAJZFGvQ9gyCPymZNdPQI2u1vUNsHiDfYt30oluC3fTXgTfcDv9ap3FqBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewFSUI2pTVsOkfB7Rv2sMw/uP1P+kgqrXnA/kVOweP4=;
 b=Ka3tsTiVVdtE9fzbamGzsot8axWqpPIU7ME79buttcSuA85eE3MeAYeIva2K/ggABr/MJSNFtaigk8h1PmMs5oFD3MtRiRVYXrsObrxypV5A2JDpBAXw5vVMmZ1Yi3r0TUE4G92e/ALJLePvzvXh9r/041pk3XQAi9Rkkt/cijki66GH/aSFfmNhgeTQHf8KIfxmkTqf2riwayhUYa9m2T4OqkJOWjIFjNyvxSOb8NpRHOMwufpx8lWO0VLefUeZjTHbpxmm22RcCvzuK0si+/SdugknpeJWlbQuoYsvn8QniI+d2AYXyjviuVMHdnpE0khzrMaVcS9KdcPs9egLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0730.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.23; Mon, 13 Oct
 2025 15:32:05 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%6]) with mapi id 15.20.9182.020; Mon, 13 Oct 2025
 15:32:05 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: atishp@atishpatra.org
Cc: opensbi@lists.infradead.org,
	apatel@ventanamicro.com,
	rpathak@ventanamicro.com,
	leyfoon.tan@starfivetech.com,
	joshua.yeong@starfivetech.com
Subject: [PATCH 0/3] Add RPMI/MPXY voltage, device power and performance service
Date: Mon, 13 Oct 2025 23:31:35 +0800
Message-ID: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: ZQ0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::10) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0730:EE_
X-MS-Office365-Filtering-Correlation-Id: 40268bae-3d0e-4b6d-ccae-08de0a6da9c6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|41320700013|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: sKlzuGylqVO4mSrideXTHfzll3TZlnpZE1MQZ2jDNDv0fEM9tYA7NB62HCCCNLupB1FClBBhcTlbQ/xOG5bGGhMHVkrxXlCW7AmgAqZSh9TiBKLKvonP6emGOeDFGS4l8ZypAy0vfNiByD/aBTjzkjWMwC6SV/dt0ngBADXkKGRITec3qXIOORAUYMqqiM0C8eMi+B1Gv4KU5fzc1pBZtH7y9wTEptvzUVnwm3g5VM6yK1FA/kiRRbfaS+V4qF+4QdeJ0jragOkkIlTqp4ZDm5p37yKV+HY0vDEU/nJnmOe2uVHAXANXJmYTVzCXBRKCJGs8OS6IqQ1ROmQxSm1P8oNsS5RpFQRNGSilSvo+LLzhIoVW7ZppaL92uxA/ZdQqmCQD9we+0toTjiwa97k+s+q57KHOHoFSTZ1HJoWmoz1pNv2Xa9BwQYNqYzI3XYrwjHalTOQzWWyFnspUJW9PDAvAwQe+LsHl1sfBqllVOPrDvsU/PNAkX8xELvgx9zQ1XovARyJXEbuwwq1hoqTAWACGYlriI1OKo05FgMqhbbr6PWOW5fh7q6wQ4gyFaFranO3k3m0Ro2m1oCASnouYqpHm8jl+3yNYfPjVae1l7l0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6C+T1NzUN6DgTLGiZEH8OeqlQGMgOr5Hhzovwt6pkewD2zCqJZohuimfQQXN?=
 =?us-ascii?Q?/VR2S4wbojW5eCyIQ2EcqP4AlIbeKOl8LqzfkHFi/z76lrdhKtz2CDOYMZUE?=
 =?us-ascii?Q?c6prwsdQfjJk8y18mcgOfKceTkYrBJslMICHkJusuQC5RRQg5K9Knlu+a+/u?=
 =?us-ascii?Q?2rDAtVHglsKYXpy+e6z9o48J3w7wdRLmBb1M2fuzAAJNGJJV4CSJf2sI/5mu?=
 =?us-ascii?Q?+lk94F5ssmR0etuKHw79RdEfzWGjIeu/kAwGwbfjlKnvOCbkbpJ4qwTgywHD?=
 =?us-ascii?Q?VQl3Ur6qRCpwat473HYXkDVMKcITulwbf5MEw4SmMyhnY4gVSSEboz4QiZ7p?=
 =?us-ascii?Q?Xew1A7Lo2rJClNUCNaSnQ4wYCubUMVooFQ6otIFileLaWG2QpdYlibClIuHP?=
 =?us-ascii?Q?i/SaDKwj6wccHKPP2+qMBJS2TsBEl7yM9nvYHpNJaQlkKH1IRJF3JI+FuWEO?=
 =?us-ascii?Q?Hc8XAnPOVDNaRujPejuds2ieaBJ/vZTeRXbO3RgD024ju1/BWzmX3rv8+2oL?=
 =?us-ascii?Q?spJhO9nmi5BgrDlEjMYjVrzYeuseRb/+a1vTyEUJTrkm+I0ECIaPswGklWxv?=
 =?us-ascii?Q?r8g1Vf+nx4mF0+Ph3nTjb216jShcbyhEhqVtPaSoFAGBaSfFtUfoLsOluM/8?=
 =?us-ascii?Q?jF5+DW7KPYn5Ge2DSFM1zk3Q1ze/47Yi1flOn04IlBPAhkzcsbY4D0/c3S08?=
 =?us-ascii?Q?vAsS1RuEknnOdK0G0jDBoS+2jV67B9mp+0n/n3HFydFvE0OsHDxqNfVFkMQU?=
 =?us-ascii?Q?tPhsMiPrqSeViLoLzi4f/wvytZEvMucAwkLy7+2/ho9lXbdO+0ephVpPUWC3?=
 =?us-ascii?Q?JWoDqYcN7QeS4dLjM/CoKI1PeJF5gWbRgFcdk1yM4X6HG70QDhGCuak2q3r5?=
 =?us-ascii?Q?1rURbBi1YUjWyIuMw9fYvxRzd2ioCOzzsOpLXqyEKcu4HwxWXiv0ZBH+pZV5?=
 =?us-ascii?Q?3Xi7hxF+6Z28zznBK1JL7hsLIDbs1C2wZ8rL+gHT7T1RWPac+s3eqjkm28d3?=
 =?us-ascii?Q?RTaqRKT2q8BktWzR6o3hBqYBBvIDj6Ib+qstti29o3PcGg0r48W3myz85IF1?=
 =?us-ascii?Q?V+LD86/NngP9MPnsoZAgX+rVJJB95qn5zT79Fxon0Cf101OUghiGJpV/gJeE?=
 =?us-ascii?Q?fcUI0JqFC/bjn5o5O2iE6CPt2V4Nyy4nGFyJ81AOtkFHkzunRQW141iqJznw?=
 =?us-ascii?Q?l9CTy0j+h/Wl3/sfsgARad6ukInoOL+fhYB0hP7aQYCadT/dRO+Hi3enJ26J?=
 =?us-ascii?Q?vLotAW9wC0nEAEX/zeUaX39VdrobJzOmPYeHuGP5UqvVRTlgTn889j5Oby/O?=
 =?us-ascii?Q?DKUc6BAole7EBNFf8eUtS8AHxDFeHu2HT8r3R4wdZtDhd6q3z39Zkkzh0HsW?=
 =?us-ascii?Q?SlkP5USyBaFLhQE0Q1juZzE1VoemGGa2r+frqt0vaFKoWtn+GjZSinlLS0PT?=
 =?us-ascii?Q?CWSnWlrQ8ehDHocW44SV0TH9oqGzyjDVjGECoSH2M5pgu76Em6At4YtoWs1o?=
 =?us-ascii?Q?Mr+3YZ4fXorcQfB+s5FvDB+2pT9Qhl8LvevXGhSQvk0fg3Fo484JnBMJO+i+?=
 =?us-ascii?Q?YOqy7YffHzTn3eTDIKsFnXw3QLlyPar8kTKiZeW1p3gR/32ZJ5o4i7V8Wrkg?=
 =?us-ascii?Q?O6Y4lDysr09GwpldgVjBIm0=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40268bae-3d0e-4b6d-ccae-08de0a6da9c6
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:32:05.2653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsW3svv7844TUTFAFOodS4twiZJCQRgP1tRC8cMwtF+SAlLoa78R5aFzQL25Pl4OnYfRCS01ckmmzVwnQymbYCBzlN74VPQPY0yDYF03t1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083238_148348_0B7983A8 
X-CRM114-Status: UNSURE (   6.87  )
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

Add RPMI/MPXY driver for voltage, device power and performance group based on
RPMI specification v1.0.

https://github.com/riscv-non-isa/riscv-rpmi/releases/download/v1.0/riscv-rpmi.pdf

Joshua Yeong (3):
  lib: utils: Add MPXY RPMI mailbox driver for voltage
  lib: utils: Add MPXY RPMI mailbox driver for device power
  lib: utils: Add MPXY RPMI mailbox driver for performance

 include/sbi_utils/mailbox/rpmi_msgprot.h    | 244 ++++++++++++++++++++
 lib/utils/mpxy/Kconfig                      |  12 +
 lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c |  55 +++++
 lib/utils/mpxy/fdt_mpxy_rpmi_performance.c  |  90 ++++++++
 lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c      |  76 ++++++
 lib/utils/mpxy/objects.mk                   |   9 +
 platform/generic/configs/defconfig          |   3 +
 7 files changed, 489 insertions(+)
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
 create mode 100644 lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c

--
2.43.0

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
