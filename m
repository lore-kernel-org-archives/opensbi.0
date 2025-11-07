Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8697BCCF9F8
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=szulCONpOpxaveG29irvoxWcjjX8W6ePwIvGAbpvLwo=; b=ruYAPMLVAz81sf
	A5URAm1u5ULa5RA8FkugY+CBJxdCmcagFIHmfhdvRoPSB8F1GnF7o0d+Y5g+deefyFLUav2LOXc8E
	d5V25MbOF6o+9EWZkorKHhx95RiVznDCFbT2p2RZOYPJdDCVQ6VPwFngYA32Fz4mEeovWBxxoFvKt
	SP4oHFro61SSxrz9V4e7yOohmz7i6gMR4+VFhnnlqjDNWBwlFwI5SiAXj+V6NOmBpsNFeLTYXYaVn
	pq/bVt1dIfaP6B3JjSyczkilQy7La5O3SkNrfhVsNE3py9RXrJTezMqgj4b0ieKJwoVc44Pxf2oTK
	nhIaxihFetWHSQGqEPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHIk-0000000GoqD-0nNJ;
	Fri, 07 Nov 2025 07:54:30 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHIg-0000000Gop1-3EB4
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 07:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsfjcNnJjpNf0wpm4fxLBkT/CEVjWIKfkhZdfingjXnDL6ODiBs5X1KUE4xAWx9ki7u/qsornLsP3TNePs8QZ6AqvOSgPA25mKbcxgGVvzn+YvkevWnkJqfhigMFQcHcmyozbCZko5CXaDao0ST/dtHIknf9/YnhL9kTam9IGLcBln/OVUoavHxQku9j7SAsBc+PB39SblRKzfRA0DClXFyU+1YOgFncvaV16TU9x5QLMBbnA38uxXbCk0VJVd4EZwLlhKtxGboEknN6DfJ9QLedNv1/EoJAvGK6+bn2AeP2w1FeiM2aej0OnUvzAdfIBP8vr2ghS/GrHe+I4N2SJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy1go7AEsF4myU6u9xoIK66fFOdQv8J3GgmzPG1TGV4=;
 b=xQIcv4V9m29fHvv4MLsA6Xs2rVk3mRAI+Mh3i16HC28lvkHBOpK3kKGGzbclN6imWucz8epEz4QpYEXsmJKZMQDRHuCscRf37oZLm1K5HH5HeQGzl53WP233pM6zBsbH8eFUefen4+xtT4h5dvAjh3KoYwKOcnsPu6TwY5nLyaka6lANUbQJOCR0cB6DgObyrHb8cgwKX3M8JOy2Zh/Z5mQ3xzRDCgerYkr/6zH1U4T250l8tkiHCHom25Iq7BHqp8sFkCgSkSdHSARi/xMYtB3F99BHA7Ln9updD2MrdbbkkWor30IirabyWhuzbn2VFFBkLry1FA2q+CYQH8CVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openchip.com; dmarc=pass action=none header.from=openchip.com;
 dkim=pass header.d=openchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy1go7AEsF4myU6u9xoIK66fFOdQv8J3GgmzPG1TGV4=;
 b=aEnZOnkqqTXlnQEj9RgaAUBoLMOCrWeNSJPgrA1bnQH8466ufgBe5kwFUN1A0x+YZwgMHXnLOONuGJ1gVfEEy1KxFHp3+37aIPF/tRPzDryUCywMaV2XftNNvQP/gGMNBp93nqvzY2io3tPLaTKfmJrHx3vrP+1FHDbNKYn4iS2zS+0PUYN04c2rsziOEBtltRd16bUKqQS5qg2HWaFnE3IrCjh+is5g1JDwt0sDXA+trJIPG69Lql9vF3NJATeHZio72vno3iidVPckSPLkk9itGzb6Tk3HLr3uETDlqb32+sMrS/UZezgz7sSb8HjGdWDu0GyA9r8jtsN6fmx0FA==
Received: from AM4P192MB3105.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::18)
 by AM9P192MB0949.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 07:54:17 +0000
Received: from AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
 ([fe80::b8b9:5b3b:827d:eed0]) by AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
 ([fe80::b8b9:5b3b:827d:eed0%5]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 07:54:17 +0000
From: =?utf-8?B?TWFudWVsIEhlcm7DoW5kZXogfCBPUEVOQ0hJUA==?=
	<manuel.hernandez@openchip.com>
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: =?utf-8?B?TWFudWVsIEhlcm7DoW5kZXogfCBPUEVOQ0hJUA==?=
	<manuel.hernandez@openchip.com>
Subject: [PATCH] platform: ariane: parse dtb for getting some initial
 parameters
Thread-Topic: [PATCH] platform: ariane: parse dtb for getting some initial
 parameters
Thread-Index: AQHcT7u3XU2mmBeqSk2Imbmitdlwjw==
Date: Fri, 7 Nov 2025 07:54:17 +0000
Message-ID: <20251107075412.1350-1-manuel.hernandez@openchip.com>
Accept-Language: en-US, es-ES
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=openchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4P192MB3105:EE_|AM9P192MB0949:EE_
x-ms-office365-filtering-correlation-id: d8dc3e40-9db4-410e-62a0-08de1dd2da7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aVprTUQ4NksvR09uQm1HV3dxeGlJMEVFMXZiTWs3YjRjbVdnWWpzUGU1aFRq?=
 =?utf-8?B?R2l3TnAvQlJqekNIb3ZHVWVRdnJCMGlHRWZPYkEwZzMySGthZjdJVDNZT2di?=
 =?utf-8?B?VjZ2SklZQnpJZkhyZEgrZDVWZGhoNXFCa1BzM293MGw5bkdIUlEvWittOWxS?=
 =?utf-8?B?dERpYng3U2prZDRTUkJsRmFHbWkyMUNybVl6UHRWejhDTWN6VXd3dmx6T09z?=
 =?utf-8?B?WFJvdCtEVzZrRUdEOGVSTGFvc28vY2RLQmhUWTFKTjBHR3RXY2dIV0ZrcStO?=
 =?utf-8?B?WkVSODRnQ1VsQXFDNmx4T2FYb2E4RVhuamFLanBiOC9jeGhPbHY2WFA1ZnBK?=
 =?utf-8?B?TW1DbkwwQ2tRNnhUWEI0MlQ3Vk5MYTFwY3pTWjlxZE5RUFlBUG5mWFYvdlls?=
 =?utf-8?B?ajlsK1FEK3dIRjV4MFZ5bit0Y2g3VXpseGw5dTVVc3F5UDdicVJSREQ2NmpI?=
 =?utf-8?B?MVgxZU9PUGxrU1hmWEYrNmlFdDFxWUp0L1UvMWk1OGpuUUhBaGxQTENVMTl1?=
 =?utf-8?B?bGczTTg0V0tITmlFeENXYmRTVDdmY2lMd3RKWFFHaHhLYUtyNEhJdFZHL1FX?=
 =?utf-8?B?czQyOG13dWQvTXRScGFIeEFXVnIvdi96MG1YKzA0VVRWa3o5cFhOZVA1VWJI?=
 =?utf-8?B?NzNNazBvTXBUd3hicDFxNVR6ZkVmL0pRV1EyTmpOay83dzJMWjdxYm9xdTFz?=
 =?utf-8?B?TVNXZlR2NnhJaGJtQXFSamZ2d1JaTEU3cUdMc1pxQUxGZlk0ZkZuOFdMNEY2?=
 =?utf-8?B?ZzFZVTZnaWJSU09jVUJqemJHbGVsK3FBUUw4RFFqTUlsWm1MdEdQRmx6NHdU?=
 =?utf-8?B?WjNHRzhrU2l1RlN5b0Mzck9GKzV1MnYwVmN5Ym1lS204YVNudWNTT2dXQlVJ?=
 =?utf-8?B?bjc1eFkxTTM3WjJZZmxnY0t5WVBSazlDakJ5VGRzZGhtTmxaNFN5LzVpMzZR?=
 =?utf-8?B?Zi9VRnVXd2Z5dlZpSVRPK0JtQTQ3N01ZYXlGWkpzVzI5YVMyQktFaHA5TkJw?=
 =?utf-8?B?L0JXb2UweDk0SjEzNko4dkRPR0FLbGVmRWRlQXhrMkZNNHY2VGxmU3BZcFJn?=
 =?utf-8?B?SmlpbTlzb3dJV1hEb25lSUZzNlBTaDQ3eGo3eWVSTjhER01CeVRpd3BYR2Zv?=
 =?utf-8?B?bFlXSGozWXFad3hGQ1Q4QVZGcVBTTHA1NHYrMTJES1ZJU20rOTJtS01PazhS?=
 =?utf-8?B?RUxmWnlIcGVoSVRsZlRPdmRrcy9sMWhzQkNGYVJOYjYvdisrQStSK2FEZjFz?=
 =?utf-8?B?NFZUb3Vqelo1ajBqbDNSbHZWMmx5bEtlQXI4Qnk1eDZGVTV2N1o1TVRBYVlw?=
 =?utf-8?B?bHRxSVcrUTdSMTg2bmYrVmRsL1ZBYlNtb0x6Y0Q3elhtYTBvRmZtVUxpaFhV?=
 =?utf-8?B?KzVzUWJEQk1KSXFDTU5JV0tDdTZvaldJdW5CQVNCdUNuMGxBMmtDRjFwMGVZ?=
 =?utf-8?B?WUoxVEZyTXk0bTIyR2RvNWRidkJNYldaRUtQSWhrNGdHbGNWMzFGTmc3RzAr?=
 =?utf-8?B?aHNidm90c0MxTjlNSWVVRHBwT0s2RjZGWFRBQXpyc2duZ1hwVGxhVi9iNTFB?=
 =?utf-8?B?bElBTEFTcmFZb3dwRGlnazVkY0wxUzFMN0lyZ1dLZE5HaFBlVmxYVFZ3UVAy?=
 =?utf-8?B?eW9leDBUcEdMeUtHSmh2RzBrRzBjMGdlNExRcGp6Wml6d3FTa1hHekwxUklO?=
 =?utf-8?B?K3BidlZJYmtGRmNUOTg5eVc5TngrRG9zelYwQ0JzUWwzN2VMc2hrZGZETkFi?=
 =?utf-8?B?Y0lKdFoydk52K24xR2FXbThVSE9iRUNNWG9pUi93M0c0dzJMWEh2bHBnK2lR?=
 =?utf-8?B?dXByTWRFWTdXK1pueE40dUFxTWV5c01TYUpuSWc2RVE2MFkrMklnWE53S2FZ?=
 =?utf-8?B?QnZSZ0pHU2Fuem5xM1BKT0l0eUlSOHZISkJab05GMndEMW9qaDB6Tmd6d3FG?=
 =?utf-8?B?OWxueFZQU1ZCZGhxMVNPeUtJWWxZYi9kTWhiSC9uVS90YUZsQ2R0a1N4N2Qw?=
 =?utf-8?B?TitHenI1N1BrOS9RWUQ1VXZ2eFhyYlUwN3Z0YjJib3FiZjZqcGJFanBpeEFG?=
 =?utf-8?Q?0nj87L?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4P192MB3105.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejNIeFBneWtvQlJJWVB4bTVzeVdiOWxZaEoyeTJlc052d1lWNERTaldBMHdn?=
 =?utf-8?B?Y1Njc2ZKR3pld1FQb2lRb2tyb0F3OEhOZThrbHh2Z2hyNVRwY3d6YUN5WEFX?=
 =?utf-8?B?NDJBbjNDMXpDcmZVVTVyQmhzU1VubDZPY3EvbFpjbHViSDhwcnpBU2N3emRx?=
 =?utf-8?B?NzRxYjg4LytIZTB4WjczN3dwd0hqd3RSQzRRdkhsVTBIeG4wTjQ2Vk1xajE4?=
 =?utf-8?B?bG5VdUxnV1QyZFFXMU1VMThYbzhDSWZoMWV0RHRvcEJ5d2xZcUc2cElSbmtE?=
 =?utf-8?B?ZVMzYjhLdko0cnMyM3JaaVBVYUpQdVlGT1FIb0ttSlo3MWhTV1JJc0cybm92?=
 =?utf-8?B?MEdrTG5GVmpmV2lpc01ZTHl0L2NlR04xV1g2L0plaHNGUlYxRitDei85dEoy?=
 =?utf-8?B?aVNVZHVTemhMNzA1ZWdpb1ArSjhid1h6aitqcFduTC9aZU94a3kzTHp1TFV5?=
 =?utf-8?B?K2phL2Y5a2pvMjYrS1BDOFdhQzR1cEJpRTY2ZlJ3TW02UWlrZkVuZmh3aTVm?=
 =?utf-8?B?a2hTb0RnV1N4cDFqamtkVEtLY25VVjNEd3FHY0VLeXZlZ0ttOXBJZFZQKzhI?=
 =?utf-8?B?c2dodzdNdzBWLyt0ODBwMmFhSWR2aFVCZitkaFhPa0FJVXFpQTM0Y0sxSzlV?=
 =?utf-8?B?YXZkNGt2OWpodFI3RzVHaEZjbE5TbWhLRUcvcWtmaDZrWm03UzFyWHBldjlB?=
 =?utf-8?B?QURCSWdmbS9QZnBRYjc0bDE4UzNZUTRjZzVqdVhsanB2enE4UTVlYk9XRkxV?=
 =?utf-8?B?alJvdkhOcjFXQUtBTXlDd3JITU5LTy9sOGtIWnRXbERyWHpycVk1ZUNXdTlw?=
 =?utf-8?B?WVJtdDVvcXJqZ2w4aEhsaDI1N20vNU04aDB2ZnpZVzRiTnZlTjY2SVR3cWVW?=
 =?utf-8?B?bVJoWjl2SEJSNmgxR0JWM2tNcFB6dmxaWTF5TzNSNWtSaENpTEE0NXRvbTNP?=
 =?utf-8?B?VkNDTkJhaXp5Q2U5d0dsajUvZHFzRkpPYXFrekdBR2lkMHpScGxSTVp0Szk0?=
 =?utf-8?B?dXk4aUZPS2FzdnY4cEVwRkRkMzZlTjc5MHdlUGQ4UXB5d3FwdXM4YzQvSUhX?=
 =?utf-8?B?UVBuVDZqMEdxZDhSQ1Exa2FHaHp2UU9La2lYWldLY0g5QkpPQ2hNOGIrQ2Zh?=
 =?utf-8?B?VGxnTEp5N1ZicUt5ckpkMFZLWVlqVjRWYU5rRmpNVStCZGk1TU9pR3IzNVVY?=
 =?utf-8?B?WFJmYTNjT0JvMWVTMk5QOVZFQkxoblBSdm9CR3FWSlg0d0NRS0tSVTJ2Mko2?=
 =?utf-8?B?QlpJUnYydVBQR1BzajdYQkNRQWFwNmVyREtyWDZacVltUDhPT1dvUHR4ZW1E?=
 =?utf-8?B?ZGFzdFRjQXEycFBwMlJTdVl3RExaaklab2lydWgvSDBPUjRvUERIRzZud3dO?=
 =?utf-8?B?Q0p2OUE2dDBqRU4xZnJPcUNhbnN5RTg3ZkxyYllzQ2htNEZBSkVYSnVVRjlu?=
 =?utf-8?B?WmJYd1I1MVVSVEp0aXRqSlBZRksreUhlaDNBSGZqZkQzbXM0cnhXYTNyM0Nu?=
 =?utf-8?B?NzhqOWJqTGdYZmVmbVJVS0Z5bUxjUnd5cVlQZGFYLzZCVTR3cEJMZ0xIdlpa?=
 =?utf-8?B?MEhrYm5MbzJ6c1BZaGJzR3g3eWJzVWF3cjdET3F0clFocnJBNDh5cUx4V1I4?=
 =?utf-8?B?am0wM3NRamRMWitPcG5hSzJMU2tUNStyWEp3VE9Sb1ErZ2YzR1RzMUcwSTBJ?=
 =?utf-8?B?YTBtYk1TZGpodDNNMXhsZmtQQUFpS3hKK0crM3Rqamxua0txL25YWTBMeW0z?=
 =?utf-8?B?TWdkdW1CdFlSUUpHYnBVNkdJYkg2QmRqWHhtd2FjTzlLQjdCSmltbEl4c2Iv?=
 =?utf-8?B?aVVGVzF6K1VGdlg3RDlYRlhIanppWmRqdmRFMlpwalJJYkFRdVUvRGJHbnZ3?=
 =?utf-8?B?c1llZ21oUlZDQzUrRS9CdTFuTzRhSHVGakpudW96TEJSUHdHRWU1TVZQM1dY?=
 =?utf-8?B?Tm9CeU5xeU5JdzJYRXVPdkdRR1lDSkVMSitUYzZxSGY5cENydUlDeDFTVDl3?=
 =?utf-8?B?T2R5MVhWV21vWHRnUVorTXN3T21MQXNHM251UzcyNmlZNFU4bWFaaUduS1My?=
 =?utf-8?B?QitINWgycWt1UFpBcHVsTEFiY3YxRzNHQ1QwZi9zVXZVM0M3alVzUm5PSTNp?=
 =?utf-8?B?SHFTYW5CWUZRRnZyWDhSdW01MXVqczdxbldYOFQ1a05OY0crNnU2ZERlcis4?=
 =?utf-8?B?VEE9PQ==?=
Content-ID: <72961CA808C4854BA46ABC58B2C12292@EURP192.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: openchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dc3e40-9db4-410e-62a0-08de1dd2da7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 07:54:17.8587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dfdd4aff-e2c9-4e1a-8642-7f6cc6bbbe6d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5gHRIYFTEx0IXKz5XKOcRNyvnjxBe+zjquprmAidqtsUknKpdC9e0tHykCRJBhjC923jExPMS700dSfzWgD81wVB429IzMMhPd0ApiraXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB0949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_235426_834940_D81EB6B0 
X-CRM114-Status: GOOD (  11.93  )
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

RnJvbTogTWFudWVsIEhlcm7DoW5kZXogTcOpbmRleiA8bWFudWVsLmhlcm5hbmRlekBvcGVuY2hp
cC5jb20+CgpBZGQgY29kZSBmb3IgZ2V0dGluZyBzb21lIHVhcnQsIGNsaW50IGFuZCBwbGljIHBh
cmFtZXRlcnMgZnJvbQpkZXZpY2UgdHJlZS4KClNpZ25lZC1vZmYtYnk6IE1hbnVlbCBIZXJuw6Fu
ZGV6IE3DqW5kZXogPG1hbnVlbC5oZXJuYW5kZXpAb3BlbmNoaXAuY29tPgotLS0KIHBsYXRmb3Jt
L2dlbmVyaWMvb3Blbmh3Z3JvdXAvYXJpYW5lLmMgfCAzOSArKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL29wZW5od2dyb3VwL2FyaWFuZS5jIGIvcGxh
dGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91cC9hcmlhbmUuYwppbmRleCA2OTMxZTNmMC4uNzBhOTdm
MzggMTAwNjQ0Ci0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvb3Blbmh3Z3JvdXAvYXJpYW5lLmMKKysr
IGIvcGxhdGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91cC9hcmlhbmUuYwpAQCAtOSwxNiArOSw4IEBA
CiAjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfZml4dXAuaD4KICNpbmNsdWRlIDxzYmlfdXRp
bHMvaXBpL2FjbGludF9tc3dpLmg+CiAjaW5jbHVkZSA8c2JpX3V0aWxzL2lycWNoaXAvcGxpYy5o
PgotI2luY2x1ZGUgPHNiaV91dGlscy9zZXJpYWwvdWFydDgyNTAuaD4KICNpbmNsdWRlIDxzYmlf
dXRpbHMvdGltZXIvYWNsaW50X210aW1lci5oPgogCi0jZGVmaW5lIEFSSUFORV9VQVJUX0FERFIJ
CQkweDEwMDAwMDAwCi0jZGVmaW5lIEFSSUFORV9VQVJUX0ZSRVEJCQk1MDAwMDAwMAotI2RlZmlu
ZSBBUklBTkVfVUFSVF9CQVVEUkFURQkJCTExNTIwMAotI2RlZmluZSBBUklBTkVfVUFSVF9SRUdf
U0hJRlQJCQkyCi0jZGVmaW5lIEFSSUFORV9VQVJUX1JFR19XSURUSAkJCTQKLSNkZWZpbmUgQVJJ
QU5FX1VBUlRfUkVHX09GRlNFVAkJCTAKLSNkZWZpbmUgQVJJQU5FX1VBUlRfQ0FQUwkJCTAKICNk
ZWZpbmUgQVJJQU5FX1BMSUNfQUREUgkJCTB4YzAwMDAwMAogI2RlZmluZSBBUklBTkVfUExJQ19T
SVpFCQkJKDB4MjAwMDAwICsgXAogCQkJCQkJIChBUklBTkVfSEFSVF9DT1VOVCAqIDB4MTAwMCkp
CkBAIC02NiwyMSArNTgsMzggQEAgc3RhdGljIHN0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEgbXRp
bWVyID0gewogICovCiBzdGF0aWMgaW50IGFyaWFuZV9lYXJseV9pbml0KGJvb2wgY29sZF9ib290
KQogeworCWNvbnN0IHZvaWQgKmZkdDsKKwlzdHJ1Y3QgcGxpY19kYXRhIHBsaWNfZGF0YSA9IHBs
aWM7CisJdW5zaWduZWQgbG9uZyBhY2xpbnRfZnJlcTsKKwl1aW50NjRfdCBjbGludF9hZGRyOwog
CWludCByYzsKIAogCWlmICghY29sZF9ib290KQogCQlyZXR1cm4gMDsKIAotCXJjID0gdWFydDgy
NTBfaW5pdChBUklBTkVfVUFSVF9BRERSLAotCQkJICAgQVJJQU5FX1VBUlRfRlJFUSwKLQkJCSAg
IEFSSUFORV9VQVJUX0JBVURSQVRFLAotCQkJICAgQVJJQU5FX1VBUlRfUkVHX1NISUZULAotCQkJ
ICAgQVJJQU5FX1VBUlRfUkVHX1dJRFRILAotCQkJICAgQVJJQU5FX1VBUlRfUkVHX09GRlNFVCwK
LQkJCSAgIEFSSUFORV9VQVJUX0NBUFMpOworCXJjID0gZ2VuZXJpY19lYXJseV9pbml0KGNvbGRf
Ym9vdCk7CiAJaWYgKHJjKQogCQlyZXR1cm4gcmM7CiAKKwlmZHQgPSBmZHRfZ2V0X2FkZHJlc3Mo
KTsKKworCXJjID0gZmR0X3BhcnNlX3RpbWViYXNlX2ZyZXF1ZW5jeShmZHQsICZhY2xpbnRfZnJl
cSk7CisJaWYgKCFyYykKKwkJbXRpbWVyLm10aW1lX2ZyZXEgPSBhY2xpbnRfZnJlcTsKKworCXJj
ID0gZmR0X3BhcnNlX2NvbXBhdF9hZGRyKGZkdCwgJmNsaW50X2FkZHIsICJyaXNjdixjbGludDAi
KTsKKwlpZiAoIXJjKSB7CisJCW1zd2kuYWRkciA9IGNsaW50X2FkZHI7CisJCW10aW1lci5tdGlt
ZV9hZGRyID0gY2xpbnRfYWRkciArIENMSU5UX01USU1FUl9PRkZTRVQgKworCQkJCSAgICBBQ0xJ
TlRfREVGQVVMVF9NVElNRV9PRkZTRVQ7CisJCW10aW1lci5tdGltZWNtcF9hZGRyID0gY2xpbnRf
YWRkciArIENMSU5UX01USU1FUl9PRkZTRVQgKworCQkJCSAgICAgICBBQ0xJTlRfREVGQVVMVF9N
VElNRUNNUF9PRkZTRVQ7CisJfQorCisJcmMgPSBmZHRfcGFyc2VfcGxpYyhmZHQsICZwbGljX2Rh
dGEsICJyaXNjdixwbGljMCIpOworCWlmICghcmMpCisJCXBsaWMgPSBwbGljX2RhdGE7CisKIAly
ZXR1cm4gYWNsaW50X21zd2lfY29sZF9pbml0KCZtc3dpKTsKIH0KIAotLSAKMi4zNC4xCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
