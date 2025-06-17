Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DB4C7115B
	for <opensbi@archiver.kernel.org>; Tue, 17 Jun 2025 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ogL1NHBFKnCJTHJHlLE060SCnsb6IESBkO9kung+zY=; b=s5pK2u3PBOfZ7y
	YypiH2H0QRe00yyKxBSmdNWAL0XOHeMEXoY1a8/yYPXYz9XwQo4Fhul3pAIxKDE4MGmoDKTL7VuKA
	+ec/OdzJYVYVWdKwczZq9Hl/fCGT91f40l+fluogV1CJiEGgD1pQRWPAlwXwrxjTjYn9Stpzz8HdB
	WwXUI+4CVxSkpf4H45pDg3ptA4wi3cwXVT8hIodmOzCVQekfcRx0K6Ii0YKa8Q9bjQusSWwBLHxaW
	vJGqCtiDmyoB9d9+YJ+HtM4YrATPM4kEJIaYoajw2apCL6kRuvsPFUnpb+1+00N6VR0pK6I+PH+dX
	Wwx/FibzMNI/taYJhcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYWA-00000007m3t-46DG;
	Tue, 17 Jun 2025 15:46:34 +0000
Received: from mail-bn7nam10on2072b.outbound.protection.outlook.com ([2a01:111:f403:2009::72b] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXaJ-00000007cct-12l5
	for opensbi@lists.infradead.org;
	Tue, 17 Jun 2025 14:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epoVGYlS1OxaNJVFJn9clUKDfiZgOfzPOcDcvBvh26x4RL+ezfCvjGnNScq+kjGGYfxBkR09M1tQaH3aGRHF/9WJGCSeXpG6wR8AykpdBsp9sm27QNtlAtSOxOVEjUhGty9KVOTeK9N4DlYOrGBFvdKTfsNq6Q5TGGdC3q6JwmSk880xdwVpQ3d5h4wvUY9CK7iIzBhhk48Fb0xXukyj0VFwgJxREwPXFlepwimDQtJu9j5FY1XaT/CsBD0jrUB37Yumy646NenSS69k8tRXvvrZtFLBhG5TJNjWpEC7WxzQLW8fC7qvzT+PaBNaXg5fjKONGXlshaNsg57ptgkdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljXBHKEae2XUMrfbmlKafpIvAbX8tB6rjbpCRVPG0RI=;
 b=cnkpz2IY6NEH9KXCZDvp59Cv3tEmQ5EckFlG5KxKyP4I4uOyDPSvFSSP/6N6DrDX8azANm+SJUzCoEz7ulTSgCiAEny1+o6/ykzODqkaCiz0pu7McDhd9hXn9kO0D+XJt8OREV7WYj3z2He58RGItxosOWZCX0V9fF+6Id2G0bvgHMWpsX/MK6G7KGOCIQQ8fxni79dARCYEDJS380vE/OWiadmu/rxxbKZXCEOkuNDYp/CTDbGm1hgCVvAM1Jv4m/25PHZh9jUimXAaNm+g9MWVv+Xg+8Yh7C2m0Ch9Pllz572+qPa1B+Etp2ooA4dNHxxW/TLOguvdY7ny9JxH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mips.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mips.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljXBHKEae2XUMrfbmlKafpIvAbX8tB6rjbpCRVPG0RI=;
 b=YlRMHjL3X99hnEgJMhkguKwWe9bjis3JQr9boH/noahzPtoC4F5Is3jiBblt1R22++g40PYM2/jZJTCg08KFs4FY2bTJeopsXrquZPsN/WHq7BaAq9hKqVAREmMEZergJ7zh6dcGU48dxog5n5/i8AfXAPJxnTIIl7M8sEHthYd9NjeaUjfDxeP3rwaVShOegLoJwtMZjfqTFyEtlnzJ5/KGU6bmjreRlljRAdSYyPDfIc7P2a78/ZDsg5CJbItjpnsPZ3Q97KfF0ZM7FsHsyijjCrYlmXgX+MqiO3ylktGEm7nk/KeOkMDlRoIQgzmGcNk3T7lh/orVdwJiwrLLyA==
Received: from SJ0PR22MB2720.namprd22.prod.outlook.com (2603:10b6:a03:326::22)
 by SA1PR22MB5504.namprd22.prod.outlook.com (2603:10b6:806:3dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 14:46:40 +0000
Received: from SJ0PR22MB2720.namprd22.prod.outlook.com
 ([fe80::4f5d:eb00:9de:5315]) by SJ0PR22MB2720.namprd22.prod.outlook.com
 ([fe80::4f5d:eb00:9de:5315%3]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 14:46:38 +0000
From: Chao-ying Fu <cfu@mips.com>
To: Anup Patel <anup@brainfault.org>
CC: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Anup Patel
	<apatel@ventanamicro.com>
Subject: Re: [EXTERNAL]Re: [PATCH] lib: sbi_platform: Add platform specific
 pmp_set() and pmp_disable()
Thread-Topic: [EXTERNAL]Re: [PATCH] lib: sbi_platform: Add platform specific
 pmp_set() and pmp_disable()
Thread-Index: AQHb3rOVQdTCKiT0xUiLTRbTGY+EzLQF9RXWgADGHQCAAK8R2w==
Date: Tue, 17 Jun 2025 14:46:38 +0000
Message-ID: <SJ0PR22MB2720F058F76CCBF0195C310AC273A@SJ0PR22MB2720.namprd22.prod.outlook.com>
References: <20250614172756.153902-1-apatel@ventanamicro.com>
 <CAAhSdy3axiPX99WS+EbkNk-EQU8r4=NYi98Toe=ucutFieWu4Q@mail.gmail.com>
 <SJ0PR22MB27206BD79B2E8CA385C96125C270A@SJ0PR22MB2720.namprd22.prod.outlook.com>
 <CAAhSdy3017uy6Wj_D5jNNx1_gnNetpH2B5jc2Xnc85Eet-h5Gg@mail.gmail.com>
In-Reply-To: <CAAhSdy3017uy6Wj_D5jNNx1_gnNetpH2B5jc2Xnc85Eet-h5Gg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR22MB2720:EE_|SA1PR22MB5504:EE_
x-ms-office365-filtering-correlation-id: 8e14b188-53e1-4f6a-9d88-08ddadadc3d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TWExSkYrcG4rNzQzL2RMTWRYck8wcm5DZlZxS0dSbXA0SXRGU2VtaVNFZGx1?=
 =?utf-8?B?amdPc1JGdndkMFV6ZU5zQ3Uzemw1ZXJKaTdkdytFaHhscXVWbXhidGFnakpw?=
 =?utf-8?B?OStpVGNFL3dYTTM1Uk81TjhFcXRLNEpXWWdReExTQmhnWEdXa2NtVW1tcDhy?=
 =?utf-8?B?bzRMckp1dEhPcHBEK3VtNWdRajl2N25Vd3F2SGpiZCsvZlFZMjRNYXp4Z1FW?=
 =?utf-8?B?ZG13WkgrNzcwUWc5TVZ4aEh5czcyaEthS2l6VzU3Nk5NRWN1b0tzeU1JaFJm?=
 =?utf-8?B?dW5jSWovRTNDeEV1OURrWkVsUFFpOFFWNUNnc2VNRDN4RUlHQ1RTcGxxYWJC?=
 =?utf-8?B?am5BNTRJNDduY3Z6Y2JpZTVSVEE5U2FNdlNWWkVCQkxUM0U1SDZubEdzcTE2?=
 =?utf-8?B?SHNkdE5NS3E4MStjZmVLZ1RhRis4bk5lY0xOaDVDMURXcjdNUkpQZDlsT3Ey?=
 =?utf-8?B?Sm50QmtTMFFwQmxKT2wwMDY1b0hOOFRMeitwcXNjMld2ZlhrUllXN2FDNWdj?=
 =?utf-8?B?QmtaajNpc1BQUk1kNGRRVnNVOFNrdHB6VlpWTVNWdDZ4dUErWVN1K0VEWTNC?=
 =?utf-8?B?WVBkeTJLckYxcFhhcXgvR1NhUHRJU3lGa1pPeUlHTkluUDBCQkNHWUxvZjRC?=
 =?utf-8?B?b25SVTdFc0YyQXI4d0k5NFJpM0R6Wm1Xbll6RjUrSGVxZ2cwd0x4VkVvbktJ?=
 =?utf-8?B?aWVBRk9OYThVeEdwQmtqNWpnZEpZYjZTdzNadzE3UGtVaDhQQSsrV1pCWCtt?=
 =?utf-8?B?cnZWRTQya2h5YjJNTm1pQjNySjRUMVArQ0VnKzV0UWduUmhqQXdiWWdVRGdu?=
 =?utf-8?B?WDR1WURFQkNMVFhHZUZuMUFMaEFnd3kxVE5INHBGVkNkQzUxOTZrZUhVcnVh?=
 =?utf-8?B?TFFUNmtHYkNSWm1PK1RTaU9vOFgzVGFMTldmZm5XRmV0ckM2ZDgrL1gzZFR0?=
 =?utf-8?B?TmQ3N0loS29RS0ZZWTlscm42UlY3TGpTMnN3bFZ2elhYcWlnOVFod3hEd3Rx?=
 =?utf-8?B?Rm5TalpjMGgzOFN5UVV5MWFSRUZLbmtYWmd0dmZWVFB3QnI2eCt0TUUxRjhy?=
 =?utf-8?B?MWZDZm92VTJXcGFKVDFGV1hEL2xkRjNZaVRvR3RyNHpXKzNQQ0poS1NyZzNh?=
 =?utf-8?B?TVVxaXVpQ1pMUnZENVhDb3VmOE42N1FuWmhGYjV6d1JYSTFoVEtBMTkwanBV?=
 =?utf-8?B?OGFYS0Z5OVoxVExkVVRmM3NJNnBkRjN0RG5lSmVxazN0VmVXaUN3c1FKM0Uw?=
 =?utf-8?B?aElFdFNCaVBDbVhEdW9rZzhyVGFrUGZrN1VDaWpYVFhXTEJidkZVeXllV1BV?=
 =?utf-8?B?VHJGczZzczdHVnFlZytBVkdpNENJbXg2R05PeHRxUDN1SVdobkNORDQ0bGVp?=
 =?utf-8?B?TjNLTXRVUlllUFFIazRCSEYxUXVrOEsrZU9ZdnhVZ1d0M01JU1F1YVBCdyt2?=
 =?utf-8?B?dGkydlRxcDRuZmFLYklhWHNmR0s0NWxvRUFRTXlVVFRTaVpEWjFFYk1tZE1Y?=
 =?utf-8?B?ZXU4Z3oxVVpveEFBRnFlWldPR20zVTRYelF2d2kxcjZ4YlRkTFFJTEVRb282?=
 =?utf-8?B?bDVGdlVBYlk5YzlmU0pDZlRsbWVaeGx4WXR2SFJJc29MRjRLV3VlRG56YTRt?=
 =?utf-8?B?VC9KcXprVm1BRFl5aDhEblE3N2xTd3JMMXZIMVdrdDhKRHJUQndUTy83SExo?=
 =?utf-8?B?OHNQQTBHY1hpZGQ0YjZiYmQ4UFM3Y3R5SWZBMDYzUlB6WUlvUitvYkFwaVNF?=
 =?utf-8?B?NndJN1hoenZiK1V0a3dvOUZuMm85bTBlTHlIbGNCbCs1ajMxRWdzZnlZUzd6?=
 =?utf-8?B?b0xlZEVDTnZaeU9IQjZSV2dldDBZOXY2N0JoL3NSZEtGeHFqSncxUFNzZHJl?=
 =?utf-8?B?M1ErSVBQeURsSDlDQ2EyamJ0Umg2TnF2V003QmkwL2EwdTFWcm9OWTJlajYr?=
 =?utf-8?B?NzFEbmRkYlBaekxSaGRvRVpHTGs4cEkzanFFQmRHb0gxc0pvTStjNnk0SGdF?=
 =?utf-8?B?UVo3WitqZUh3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR22MB2720.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGxxZGxEYjRFQjdRZmlVODN5cElia3BmSEFmdURCNVhWQ1ZOeDBzaThSelh3?=
 =?utf-8?B?M0lIbVhzYjl0S3JQeXVLeXhsMzd1d29TVXU0NjdTWjRiZTUvZGRlcTNjZ2VR?=
 =?utf-8?B?ZHgyMlJYZU8rZ3JjclpPcTBiSHZLNER4YTBROEFyM29RRkFZdmhmd0MrQ0Ex?=
 =?utf-8?B?RFF2c0hxSkxlM0VGdElPazlkT2haODYwQzFsQlV5N1lzcXBXWXFISk41UUY3?=
 =?utf-8?B?MVBZcm03NktzbHl3VzZJSEdZY2VQcHk2Zml1N2VzMGNoNFJPUWF4Z09VQ0xP?=
 =?utf-8?B?WUcvR2h0UVBGRGVWY2dhRk5XZkNQSmkvWVFHTUdNZERhUElUUllEK0gyajlh?=
 =?utf-8?B?UmxTQ1huR0dHcXFldzR0K3M1MVJ0TFljT2c2OWxZcG81eFVmTHA5THBQdmlW?=
 =?utf-8?B?Z3U1L0RFSHdmMFF0NFRkTE9jYzM0Q0ZBUHVMeFhNZ2J0NG93Rm1QRVFTNUR6?=
 =?utf-8?B?SG41bXIxZmgvcGpXWEJNK0Vtemc4aWU5Sjd3czdGc1praHU5bWVHdUxBN2Fn?=
 =?utf-8?B?TDBtOVZPUGhyelFLKzduRzZ6akNPcUpJaHVuSkF4NmJYZXgyaFIxNThWQWhk?=
 =?utf-8?B?MlFLeTdQcXhpSzFjMTlyVElvMFBXb3NyMmtHTXB0bU1QRUkvWTJDRE9kajBm?=
 =?utf-8?B?SVBTZ2tDNHFrTzNLRGdjeVZvUEQvRTk0aHNGaThzMkRCV3EzR3J1MHNnOXZV?=
 =?utf-8?B?WlJHSFFWUXEzT2ZhekExY2dBVU1RMGNLVXJZaEs1YlVvNjF3RlFKaGdJNmtq?=
 =?utf-8?B?TkRkVFgwTnFGSGttMEQ3RFFJODVuSXN3eDNXTmZSRmJ5UCsrMTFBYTRpaEFi?=
 =?utf-8?B?cldvWVRQb0d6aVkxdWJ2K1g3WEZCbmIvKzdtUmxvMGhUdzFrUDUyOU05aDlO?=
 =?utf-8?B?enZjSit1NlVsSTlTaHduQis0NGRtdHUwVVFqbFhoUWtPWHJyRXZkTngveWFL?=
 =?utf-8?B?UkF5c3Irejg3dUdLQVhDbkpoT2xiUWpPNnBmeVVZQURwTzRHVUdCd1FGREpZ?=
 =?utf-8?B?amUrYVNucnMxV1VrQnBQc1dISVBSNmVNeEdod2dvKzJnRk5DaHRWYWhjTVdY?=
 =?utf-8?B?c2h5YUFmanFSZjgyYmFMTSszSWtCQmF6U1ZpRzh3Q2p5dS9LQzhML05GMUUv?=
 =?utf-8?B?czBVSUF1eUJqMGEvek9iYWxqRzIrQ05MNjNYbDBoeFFTaVdWVjZjZG9rSmdz?=
 =?utf-8?B?Z1pTQjJmd1FCa05zaUFDeGh0MTB4ZEJyOGYrY3dmbVQ3TzV1VEF4VmlJV0lR?=
 =?utf-8?B?WWl2U3FTWVZJWkhmL1d2b1F6YmQwNG9kVEZmTERybkJWLy9OeDBwTlBRNHN5?=
 =?utf-8?B?cWFLdEh1bTVsdWoyNTE0TlFZVTZKeFRGNjFXb2JjQlo3eFpXRGZYbUpPZXRr?=
 =?utf-8?B?QU85SVlHMDNZczRxU1JxL2tVMzdINHVUMU9nTnVvdHZuZldFM1BNYnFWdkdO?=
 =?utf-8?B?VUkyY0x3TjJKb2NMRlh4R3ZYcmltRDYxWmhQcGxiZXdsSU1POXBSYVVBZWVt?=
 =?utf-8?B?NU1oakxtTVluQk8wOEUybDdpV014TmRPM3ZUYzZtaWNFS2ZaZElkR1UvQjBn?=
 =?utf-8?B?WUN4ZDE3UDJ2S0FidzJNaGFLbXByS21YZHFVVnhPZThJUjBsMm5rdVpkbERo?=
 =?utf-8?B?a3VIenYzVjZqMERXUE1kYU1hRUs0RHhVdTdMbmIvbUJqd1lrZG5nRGQ3b3VB?=
 =?utf-8?B?MXI1dXM4WHM0UGMrUGVIZFRITjJXbHg1bTVPbFViMSsxWjdDNkl2UWN1Vmor?=
 =?utf-8?B?VzNXR0JqUkZvMjR1djBaNnVIOENKR0J6RG83M2hWUlZBd1Mvd0JkWmlOeTBT?=
 =?utf-8?B?VmxvOHliVlBwQ2RjU1FhcFNtbVJxaGtOWGhYUU4zNkpHbm5nYmpMcmJMeU9k?=
 =?utf-8?B?VnhwNTVWQUxnK0dGbWthMHRrbzJjcHFtbU1yTGdVcENhYlVvRklFMWQzYk5z?=
 =?utf-8?B?ZkFKUVVEK0paSjB5WFFmaWhhVEg5RVQralAvNXAvRDlhbXJBWENjdjdQY1l6?=
 =?utf-8?B?bC9PMEdxakhSOGVBNW9PblVpb2FzajY0SjFQc2tBdGVobVU2SUlnNWlXYnBs?=
 =?utf-8?B?eWJxVDl6Zisrdk44VzlVOFlSM25rc1VEdlBMUT09?=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR22MB2720.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e14b188-53e1-4f6a-9d88-08ddadadc3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 14:46:38.2518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wA8mdOwZkA3+qd66k3HeuzE8Ix7QSqQ0PAKx62Q9RK0j/c7bcT16ONh7SMiJ4Oq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB5504
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_074647_322025_3D60D6D4 
X-CRM114-Status: GOOD (  27.39  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCj4gSGkgQ2hhby15aW5nIEZ1LAo+IAo+IE9uIE1vbiwgSnVuIDE2LCAyMDI1IGF0
IDk6NDfigK9QTSBDaGFvLXlpbmcgRnUgPGNmdUBtaXBzLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkg
QW51cCwKPiA+Cj4gPiA+IEhpIENoYW8teWluZyBGdSwKPiA+Cj4gPgo+ID4gPiBPbiBTYXQsIEp1
biAxNCwgMjAyNSBhdCAxMDo1OOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8u
Y29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEZyb206IENoYW8teWluZyBGdSA8Y2Z1QHdhdmVj
b21wLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEFsbG93IHBsYXRmb3JtcyB0byBpbXBsZW1lbnQgcGxh
dGZvcm0gc3BlY2lmaWMgUE1QIHNldHVwIGFuZAo+ID4gPiA+IFBNUCBkaXNhYmxlIGZ1bmN0aW9u
cyB3aGljaCBhcmUgY2FsbGVkIGJlZm9yZSBhY3R1YWwgUE1QIENTUnMKPiA+ID4gPiBhcmUgY29u
ZmlndXJlZC4KPiA+ID4gPgo+ID4gPiA+IEFsc28sIGltcGxlbWVudCBwbXBfc2V0KCkgYW5kIHBt
cF9kaXNhYmxlKCkgZm9yIE1JUFMgUDg3MDAuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBDaGFvLXlpbmcgRnUgPGNmdUBtaXBzLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVw
IFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+Cj4gPiA+IFBsZWFzZSB0cnkgdGhp
cyBwYXRjaCBhdCB5b3VyIGVuZCBvbiB0b3Agb2YgdGhlIGxhdGVzdCBPcGVuU0JJCj4gPiA+IGFu
ZCBzZWUgaWYgdGhpcyBoZWxwcyBvbiBNSVBTIFA4NzAwLgo+ID4KPiA+ID4gUmVnYXJkcywKPiA+
ID4gQW51cAo+ID4KPiA+wqDCoCBZZXMsIHRoaXMgcGF0Y2ggd29ya3MgZnVuY3Rpb25hbGx5IHRo
ZSBzYW1lIGFzIHdoYXQgdGhlIG9sZCB2ZXJzaW9uIGRvZXMgb24gRlBHQSBhbmQgUUVNVS4KCj4g
VGhhbmtzLCBJIHdpbGwgYXBwbHkgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBv
LgoKPiA+IE5vdGU6IEkgYWRkZWQgdHdvIG1vcmUgcGF0Y2hlcyBmcm9tIFZsYWRpbWlyIHRvIGRl
YWwgd2l0aCBNTUlPIHJlZ2lvbnMgb24gdG9wIG9mIHRoaXMgcGF0YyBoLgoKPiBXaXRoIHRoaXMg
cGF0Y2gsIHdlIGRvbid0IG5lZWQgdGhlIFBNUF9NTUlPIGZsYWcgYWRkZWQgYnkgVmxhZGltaXIn
cyBwYXRjaGVzLgo+IElzIHRoZXJlIGFueSBvdGhlciBwYXRjaCA/CgogIFNvcnJ5LCBJIGRpZG4n
dCBub3RpY2UgdGhhdCB0aGVyZSBpcyBhIHBhcmFtZXRlcjogZmxhZ3MuCldpdGggImZsYWdzIiwg
d2UgY2FuIGNoZWNrIFNCSV9ET01BSU5fTUVNUkVHSU9OX01NSU8gaW4gbWlwc19wODcwMF9wbXBf
c2V0KCkuCldlIGRvbid0IG5lZWQgVmxhZGlybWlyJ3MgcGF0Y2ggdGhhdCBjcmVhdGVzIFBNUF9N
TUlPIGFuZCBwcm9wYWdhdGVzIHRvIHRoZSBwYXJhbWV0ZXI6IHByb3AuCgogIEhvd2V2ZXIsIHdl
IG1heSBzdGlsbCBuZWVkIFZsYWRpbWlyJ3MgcGF0Y2ggZm9yIHRoZSBmZHQgZml4dXAgY29kZSB0
aGF0IHRyaWVzIHRvIGRpc2FibGUgdGhlIGFwbGljIG5vZGUuCldpdGggdGhpcyBwYXRjaCwgd2Ug
Y2FuIGhhdmUgdGhlIE1NSU8gdHlwZSBmb3IgdGhlIHJlZ2lvbiB0aGF0IGNvdmVycyB0aGUgYXBs
aWMgbm9kZSwgYW5kCm1pcHNfcDg3MDBfcG1wX3NldCgpIGNhbiBzZXQgdXAgY29ycmVjdCBjYWNo
ZWFiaWxpdHkgZm9yIHRoZSBNTUlPIG9yIG5vbi1NTUlPIHJlZ2lvbi4KKFRoaXMgcGF0Y2ggbWF5
IGFmZmVjdCB0aGUgZXhpc3RpbmcgZHRzIGZpbGVzIHRoYXQgZG9uJ3QgaGF2ZSB0aGUgTU1JTyB0
eXBlIGZvciB0aGUgcmVnaW9uIHRoYXQgY292ZXJzIHRoZSBhcGxpYyBub2RlLikKLS0KRnJvbTog
VmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldiBhdCBtb2JpbGV5ZS5jb20+
CgpXaGVuIGFwcGx5aW5nIEZEVCBmaXh1cHMsIHJlcXVlc3QgZGV2aWNlIG1lbW9yeSB0byBiZSBv
ZgpNTUlPIHR5cGUKClNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWly
LmtvbmRyYXRpZXYgYXQgbW9iaWxleWUuY29tPgotLS0KIGxpYi91dGlscy9mZHQvZmR0X2ZpeHVw
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jIGIvbGliL3V0aWxzL2ZkdC9m
ZHRfZml4dXAuYwppbmRleCBmM2ZlOGFmLi5iMGVkMjBjIDEwMDY0NAotLS0gYS9saWIvdXRpbHMv
ZmR0L2ZkdF9maXh1cC5jCisrKyBiL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVwLmMKQEAgLTE4NSw3
ICsxODUsNyBAQCBzdGF0aWMgdm9pZCBmZHRfZG9tYWluX2Jhc2VkX2ZpeHVwX29uZSh2b2lkICpm
ZHQsIGludCBub2Rlb2ZmKQogCQlyZXR1cm47CiAKIAlpZiAoIXNiaV9kb21haW5fY2hlY2tfYWRk
cihkb20sIHJlZ19hZGRyLCBkb20tPm5leHRfbW9kZSwKLQkJCQkgICAgU0JJX0RPTUFJTl9SRUFE
IHwgU0JJX0RPTUFJTl9XUklURSkpIHsKKwkJCQkgICAgU0JJX0RPTUFJTl9SRUFEIHwgU0JJX0RP
TUFJTl9XUklURSB8IFNCSV9ET01BSU5fTU1JTykpIHsKIAkJcmMgPSBmZHRfb3Blbl9pbnRvKGZk
dCwgZmR0LCBmZHRfdG90YWxzaXplKGZkdCkgKyAzMik7CiAJCWlmIChyYyA8IDApCiAJCQlyZXR1
cm47Ci0tIAoyLjQ3LjEgCgogIFRoYW5rcyBhIGxvdCEKClJlZ2FyZHMsCkNoYW8teWluZwotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
