Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBDAD2444B
	for <opensbi@archiver.kernel.org>; Thu,  4 Dec 2025 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aXuu4UmO9mcC4V0ErDGY100mbzWkXwR0O0lE3cS+wU=; b=qwvAMC7avq0GTk
	1kpbElPplTjk5gK9Dbp6vlDOq/hIofjhQBu6Fdk1FYmEsSBZakL/MDmc6PglVX/wvqCjc/BilOXJA
	Insb58a47Tn6aRqld1pwo5cAfogQZ913buozxbbqH4zwSG9m3pbAuOKEhFeGBitIWkMaDSSXKe4fv
	IiwuxI2yt4dDaTG7vDJdxM1iO3BTIMA1hP7cOhUWMa3PJqNihEhGop4kgA+CotFvDPoiWqZtZZmcz
	imliIY2/fiWYoE9vOOOJAr2B9JQGVp4ZleW+J5A6qyJQjMmkjJmr1Dc/rZdR5CGH6Vnw+e09yVAOh
	kQLJlFJKgg3Fp9cf5TWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRD9o-00000008NZR-1beP;
	Thu, 04 Dec 2025 17:30:20 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRD9m-00000008NYs-0BVt
	for opensbi@lists.infradead.org;
	Thu, 04 Dec 2025 17:30:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idIW374qEZSKKufNq82oruTwERadFZKk1JC99bPBcHOwV1fXN2rv7jingBym0fgYK8R7mPq7OmQTiakG5VB6MvflDaEbQlq0AYuHqEDtJEANF3A337huAvPkJISaP+lEkSP0U+lKV3XiV3QzBTCMAmjj6FifdAYTWdpooR6dRpVi8nu4P9VeNqBUGINf5sx0JprVpulJIMx1fYHW8xsqsgRsS9MamNKWgPiU21jVvjK46gTyNOWfwFTlybttRyE589WOKLFsveg5OAKapmR+EVBwjGtIt5ijLJFbgUNo8s9FeQMCfpS+kuyxBypWZT0RYiBnXSAN9O7DnMkFae05Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGiNmrh0Fu2U4b/FOR1gvfH3IjEoTK8iP7o5D5SP8Hw=;
 b=FC0laYSMgGj3yI/VfDs5Xxyd9IrlMF/vKy4mu88aBUJsZYRoA+xeki6zOxrAe0HV5qIyspueH2d3OruIcJyQ2vY0lg3QbDRBplsuny7b42BgQHviBhJJxFxhw1sSdJfjYdrxsiqrd48uKeUUihApY3nf3jf3ePwoOJfzHOJLV8pdONQKi+C1OFDQ0eRV1Hg50cJLX+fXWNR8hvD7Q8ps73cggPPc++o8kAnyVsyKX3b00cIf+CBbbE8K6cw6NisHS540g2JCz2FeaZmxU3Wr0DOu6Oa0cFDr2/dRvcz4xbtbcCc5ip0pKSisuyj3QDr+iKKb7Irs4sqa29jA3XFSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openchip.com; dmarc=pass action=none header.from=openchip.com;
 dkim=pass header.d=openchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGiNmrh0Fu2U4b/FOR1gvfH3IjEoTK8iP7o5D5SP8Hw=;
 b=WpdmAc8PkuOA424fq4zE8gbWl4JQoNTi5cef8Hm9J97G27lXao+yKC8+OogVlVxRT+k+dVtKvWMO4lmLMuXLzhWmU/SJph03L/rESL62vfPlgG2qScidgF+vFWrlQorbTUbo8s0+4m2fPIOiLOZHFgXYRiDHwTu/TvUxgk/y+ltcLzUFa+EoQv9clohzlBXdYV9aDQ9Iu3FGcJ1ayhj8OfSrifSJuNUSMm0kMImadckFCYKqhJ+c6DhegP5ErQp7HxO+hTxkiJrURHY3AL/2CdTk8b8bvM1zdNCaKhCmJUcbuTO1xBwf3FgeLov8wq6zEHX0VF/h50aNPXJ04c15Lg==
Received: from AM4P192MB3105.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::18)
 by GV4P192MB3287.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:2b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 17:30:11 +0000
Received: from AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
 ([fe80::b8b9:5b3b:827d:eed0]) by AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
 ([fe80::b8b9:5b3b:827d:eed0%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 17:30:11 +0000
From: =?iso-8859-1?Q?Manuel_Hern=E1ndez_=7C_OPENCHIP?=
	<manuel.hernandez@openchip.com>
To: "jimmy.lerhun@thalesgroup.com" <jimmy.lerhun@thalesgroup.com>
CC: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Subject: platform: generic: add CVA6 platform and support for PMU
Thread-Topic: platform: generic: add CVA6 platform and support for PMU
Thread-Index: AQHcZUOkm+NGjVqdWka1QKAJn0BSFw==
Date: Thu, 4 Dec 2025 17:30:11 +0000
Message-ID: <20251204173011.10815-1-manuel.hernandez@openchip.com>
References: <46f88d260ac64ca7af4e5f5cbefabeb7@thalesgroup.com>
In-Reply-To: <46f88d260ac64ca7af4e5f5cbefabeb7@thalesgroup.com>
Accept-Language: en-US, es-ES
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=openchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4P192MB3105:EE_|GV4P192MB3287:EE_
x-ms-office365-filtering-correlation-id: 507d7041-1c3f-49b3-6509-08de335ac740
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?0m/YGu7B/Ty4qxtqJFJgp683PEEn6W1iWyBo3oEOcISbl1ucOtJtXCZDHq?=
 =?iso-8859-1?Q?miwHYQcThcOL8NgI2jU5cKyuB32Hrxxlln5KZjf5yzy9UR+Xu8Vi+nv7WW?=
 =?iso-8859-1?Q?z9UNgFZ0a7I4ngo0YJN5JXMTz1XjZbL+PF1PuWS2jWgAN2LB/Pm/AUxQ+5?=
 =?iso-8859-1?Q?csjigdwkKbj0gm2J/XcrEyZP/keGaUHsKZ+b7Hj3ovh8VjYwt0hCvuG7TD?=
 =?iso-8859-1?Q?k61NUE7GpSrW2P7+VkGnsW6nREZkxO9JHq9FrVVvOhTDEJQoO7487b/Ed8?=
 =?iso-8859-1?Q?sn7D1xmMCnw63rKom+kK0VycWaUr2hJR6TtxC4kQW7o1FiY1wcejNiEVV2?=
 =?iso-8859-1?Q?BebsEa64oX4sgw8k2VDBcABq1jfwJAoD18YHdBrmDwETM4liHM+QWvJhtr?=
 =?iso-8859-1?Q?KPExDtX05qhbo/+J7qCF4LTbXNmV+kG1+isWax0jpR5XTT/RJQMn2/zMt6?=
 =?iso-8859-1?Q?1aqOaWf0uHVqJ90ofb62br3k7tSr6ZVyU521HHnHOVrgguI96Oz0OA47ri?=
 =?iso-8859-1?Q?3JB6VSATkMhxmPEijsJ0EkfQfvu8g0WC2hb7X8UmOzp9LrgQz7tuKLMbNZ?=
 =?iso-8859-1?Q?QumjaYCgb8lyYNOqY6fUBbZJwvV1noggJQSkgFGEz5OpF8gBNu2qBhtIty?=
 =?iso-8859-1?Q?4kIl0p2c6ENDsGIOLZhHcIzSM1u/Q1HX4CcY3uPnfE3GsgcI5EKUPs/YBH?=
 =?iso-8859-1?Q?dDrNEu+hJ65id8UupBKmC9QpuCE4nY4MyP+rZk3G1CmYlh+8wErY0BTz4i?=
 =?iso-8859-1?Q?OtZsg71Qy14SAQteaB0h7bBnxprkvlMR3/BVLjvqmMdRn2qdunKvNyGtJU?=
 =?iso-8859-1?Q?huJM3hVB6suCWpkDwRQZBXS+MponGTFQQBGqw1IsqhHBqYvpQ5e1+Q2Rep?=
 =?iso-8859-1?Q?POlPDq3YsGjVgrAeK5sF1WOD1ucVlonA+NOnZdbtInYdGziTjIG+Y4+T/x?=
 =?iso-8859-1?Q?vkAw/Psg8RTyYjXFRnVJpupx6nk64WS3JDgYj4uJcbFCVFNjSC+hm1ffV7?=
 =?iso-8859-1?Q?91EOPL3R3VZNDobm3RkeK/kyNREnd5TRxeKpekS6N6/+SJjjoPiV6CBNVO?=
 =?iso-8859-1?Q?iuDSVX6l1fHT70AbXUHXvO886eB9yKdVgCRKriahptUE/+HFaT9UJC150J?=
 =?iso-8859-1?Q?M15AqTggQUhPPhuGeRTztGihws55O2Z+uWfzG9r59EbF18YxVJMarWlXNY?=
 =?iso-8859-1?Q?Kq0GvchBBxMZB3Y4PHschxcbkFRZWyzH2AGbccIK2tuDxiLjdsRZarV07r?=
 =?iso-8859-1?Q?afG+l9AEqX26eoYNQXwI152TPfIe3zHpUDysAATv5Iti0bnVCj2ICyd/Yd?=
 =?iso-8859-1?Q?bWrxlYHBUXjqtuY0nxez9jLecnsvobGhBjFp7hX7/WsoHEH032NbbAS4ZI?=
 =?iso-8859-1?Q?NpSbGks+cwfXeGNzeLFGQoXwkgqMORnnQbacbvaiQUR+ns2e/uI6G89I/k?=
 =?iso-8859-1?Q?aIL4eDMpBX42TdBkzQM0Ulh5nsN+FOo7OFPxmo9BxwWhAobiqhzTl2Tgfc?=
 =?iso-8859-1?Q?KJ8mihmu1Tt1OTXiDsxLVaADfdg4MrMengvP4o2kOEL/S+P86wStmjUSeP?=
 =?iso-8859-1?Q?4G8WMba2z9D5czKFFvK3h9oENdV6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4P192MB3105.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?F77o/H3pXuRY/Nn3RPsrvbHckpTVQnAPAdt0Svsnd3PB+6XcgBYhnopidl?=
 =?iso-8859-1?Q?MaX7v4Ht5hMBdq8oVAXUhbp/4iKw0oNbZjiexbbimq9XAieGYHVo4WsVQ2?=
 =?iso-8859-1?Q?rxOQSC0rfkf0VF9soCT6ZMicbwHe88vp8WLHVaTwZMo5GHSMLIbzL+EZCb?=
 =?iso-8859-1?Q?xISwRbLOyGt5YpMJOI9Mi/UcYtkv4Dkixk5I5bnj5/c3JyVpwIwj/ttCK+?=
 =?iso-8859-1?Q?P05rK8z0j32DiMFYl069CUEIFe30Mst6hWfdy/4KN4PdFwiJvxm39EfxVJ?=
 =?iso-8859-1?Q?EB51IbTqYsoyiCfUtsTiH2z5zWKNQCM1YaKlaXiMgUaTkZHEtPKMoT9IRk?=
 =?iso-8859-1?Q?byfw2OtTrwX9Av53EM3H87jCql1OEh/gS/mzhf4HszyDmX+q/kS36Jfb88?=
 =?iso-8859-1?Q?XW6AyBjfEeGKMO6XAB71lvUgYfT/DiA7CefLpTf/jD9VqLNkKgM6MEQQGt?=
 =?iso-8859-1?Q?2hVysUo25UrbBa4G4gsF8RHFAYaILbkIKjNgFgWf/nTXTW75ufyc+3EfOH?=
 =?iso-8859-1?Q?EtzBan/IqUh40+WEclefCltnIsBylekS8VkSNIjEmwi68/d90RrQ1e2a4X?=
 =?iso-8859-1?Q?YUpcOwF78YZ/cPrMQuev1vga6qP/tcs98xUAiJL/TnopA2I5+WPG44BBv6?=
 =?iso-8859-1?Q?7TqTOLl3zj1SzNYOHRUfP0dnjli60KMPAWv1Ye8N0UAOJoryOrNMA37PBE?=
 =?iso-8859-1?Q?7VxaZZfRm89EDycYk99qs4QI9JaPMCA6VYppWMu64nEIZsNhooJUu05SMX?=
 =?iso-8859-1?Q?rLdJv4A3rcFWOlDczrPW6pNS52rKXQobmWjUg2gQs9o6W0W4iewAY4AF3x?=
 =?iso-8859-1?Q?KsjdyWailiFDhmzgnrT8M+j5OM0Cfzda67lAfvgEAf2OnLqHqYZUg1RcOI?=
 =?iso-8859-1?Q?Q+QsQiUteWgK4/MPy2gf90hJLWifzhMoemvpfGuk3lGa+1UkEdbfsdmuhK?=
 =?iso-8859-1?Q?nb1zXy3pvqo2dBXRLvku/wXdXI03CBa/KLwaZtCfoFvihKULYuzlYOwOuc?=
 =?iso-8859-1?Q?8/S3SH/hxiBJ2w/L6WkCayFC+oKXSdyajtYy6Kwmr0CCeK15Ii3uMwPDje?=
 =?iso-8859-1?Q?fOz97ubOr8m2O7b5PcnaiqziZummoADdyD5ILvGtSXpR2h8pP+/DsvJB2a?=
 =?iso-8859-1?Q?fsTRmh09ye7sYJMFkYCxl3X8dDfiPl6mxflBsMnKf1J/hAd5V4383tF0Vu?=
 =?iso-8859-1?Q?68fr2RoV96kBGkmsoGT3IHlWXCl1fLf0WxHIKG+7YRxvjoTppgGD9+qELc?=
 =?iso-8859-1?Q?2X/h20RmbwL4a33KjNUhvYQDdHiIOn2bCwfGIxtLX6WJ2BGo+eO5j2gBDt?=
 =?iso-8859-1?Q?bJo+r9aV3qR7j4kNYxgeM2FXbSzQTxVk9EwP8Z3XkwyUDdqEEc67kL3E3M?=
 =?iso-8859-1?Q?XQBcSemFTChoB/kYRU10DWpYujKB1cAaHyEa2JBSwr2WRB8peAEnDuqs4C?=
 =?iso-8859-1?Q?HGmLmiOVaDeiqbzmg2/EAs+mv7QKB2QnrvHJ4ERJt0jtYEPg9ukjbqVbFV?=
 =?iso-8859-1?Q?pHR50Mmz2aNz2rNWsw2WZxRID2YTGbvSd+5qmHvO+akRF9wfvFuRCh8OKJ?=
 =?iso-8859-1?Q?p4kLGT9pMri3qrN/lkWak0YdrtM0nDdRWWOqtE8gsw9Izypyko06TRAPEP?=
 =?iso-8859-1?Q?OrqzcMX5r82ePJo1hh61+U8Rjbtbmod7uBHUBAZ673Ocn5EabdETBj/w?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: openchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 507d7041-1c3f-49b3-6509-08de335ac740
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 17:30:11.5797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dfdd4aff-e2c9-4e1a-8642-7f6cc6bbbe6d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmMpJ9XGHIrbQZv0EuThaZXjrV7VR5nGoa+1Ri6TyQBeICLfEw/b4dqvaFpMr9bJF5MEcnI0PZgoYVoncYUhez6poXoUzSmIAXaR5s3Vy+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P192MB3287
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_093018_085980_F94789D6 
X-CRM114-Status: UNSURE (   3.47  )
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

Hi Jimmy,

This functionality has been already merged, you can find it for the
CVA6 in this commit: e8dfa55f3d6ada2e1f71671213bd3a68ec96ea76.

Regards,
Manuel

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
