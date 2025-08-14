Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DB0CA0EDC
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sz+E3n8yIKF39Uj4FVFEExwAi3S3TVj0fB3x8aLxl+w=; b=MNDpCFQzxkXjde
	BqQOLLDxDwOSW0R1+eIoxvKXgU7Xi4QAo3DG/4xfE/MpCvWibbTDwwSUD0RokxJHlPd2rIVl/+uNx
	f1K/dGKYyeWmbT0lYSv4pG264OrlUJf2E4tM+zb60AyModoKQwkAV0YnG8z+3tRzsPH0dRvltw+xu
	uhYjUgFegtlpkOVjjTvGP71qojM7qbrrSR3oBJLvSi/jafJv91uVun2TSaP01MCpgBPGm4pPmNAbE
	3PJkSU+/txyDLwDUd0DHfCS4DNCHzxGtjrjX/pE1l+EN4T4FMD2+Wp5aoDS/xqiXT968sPGGdNs45
	QPqLoDwLqtq/rHegUnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbnl-00000000DG5-1hPH;
	Thu, 14 Aug 2025 17:31:45 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma3I-0000000HVM8-0jPF
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 15:39:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEsIN7RzkAmNOmvsMl+o/WoIEb22pLfhnj7IMvpdx1z2QsdqXOJLqt24G58sGdqIAollGwgE7azr+YguHbZgbzsuu87z7s+hRxL0RLdjG8YntGbYIITqhZh3sZ4mC/DkkGJeIBN6EVis3RJPrezFuIx1Y8Wm4B6tR21cPBCbguv47/lh/VUC9gpXGt41pV0HGQ/73yp/jLPE979+fLe+CGElBc6F8Vd4BprzVDzSyhQOH5NBAPdyT4/h7nYStrSKq0x4j4MUXc0skS61VOP2t9uQ+oszthfTuBtHJcwD2QW6igC9pjoq8RF74Ma6h3OIv3u1JRmyDRq/DrKg/UtvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXhP1nPAtLizNyJNfBf60lD57wrw18qrD5PP3bevWYc=;
 b=WXqSnDEEV6dElNhvcelo0M+oN6l1Q56+/9AJymhvlBKdo56HyNMYd/FyEX+/AQyxapXwEGhR1PhkySaMCWUnxXq2I5CekCcbJWqxXfObWEnYcoPdX+B6PzsPQdMKC3fAuu/gWTSVQ8aPAhrDstDPIPVjI9M540UQSYCR+MlkEn6Wmi7qABN1rcQekC3jZ65wB4V+b9Tof0tNh6z1QWZ41jTJHZk07bCbzNtVZqgDanzPJ12rWNfTltSNEzgw6yP+9cGDcPWA3msRnn632kgn5T5K7oR0m2xphSLV7xpNqN1Su1TQDfGevX5hi8P6sCrPlQOnsjAHznz0Ktj32sbweg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andestech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXhP1nPAtLizNyJNfBf60lD57wrw18qrD5PP3bevWYc=;
 b=bEfw3Ko/GR00veyy9wjAoQ/MA3MmqUd4/7rjvf4oR0xD9w0ls8T5/bSl8enK8uFfxqYYGc8W1hiugU6YHJCODj97YndVXq5+kbrOJk7NjxwZqR76/7PfocMra+9oSFLeAY1BUEt/FYbKXZPPsvGvOuHA1OdCtzbiaQvV9MhpUQzJbjrUYtyTKvmvkzUls270yncNp3PWU7v/X1ZU+HM0SS54GFyACha8zriLw9CkyjICAsHSVK2+MuCDLZBxfNFoYUkUHJH8eyBtO2QOBpnFLxea9Ffdxr8yrwObCVD3UIt9dsiPnRRHmIfyFsCnU89bo7UqttMDWJSwDByfhkn1hw==
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com (2603:1096:101:69::14)
 by TY0PR03MB6476.apcprd03.prod.outlook.com (2603:1096:400:1bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 14 Aug
 2025 15:39:20 +0000
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::292f:e1ce:7df8:115e]) by SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::292f:e1ce:7df8:115e%7]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 15:39:19 +0000
From: =?big5?B?QWx2aW4gQ2hlLUNoaWEgQ2hhbmcosWmt9bnFKQ==?=
	<alvinga@andestech.com>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>, "opensbi@lists.infradead.org"
	<opensbi@lists.infradead.org>
CC: "zong.li@sifive.com" <zong.li@sifive.com>, "greentime.hu@sifive.com"
	<greentime.hu@sifive.com>
Subject: RE: [PATCH 6/8] lib: sbi_domain: add SBI_DOMAIN_MEMREGION_FW
 memregion flag
Thread-Topic: [PATCH 6/8] lib: sbi_domain: add SBI_DOMAIN_MEMREGION_FW
 memregion flag
Thread-Index: AQHcDQtjZlQo78EzZUujycgiYS+NrLRiR5ow
Date: Thu, 14 Aug 2025 15:39:19 +0000
Message-ID: <SEYPR03MB670099666C0DA844001E3F9BA835A@SEYPR03MB6700.apcprd03.prod.outlook.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
 <20250814110522.18809-7-peter.lin@sifive.com>
In-Reply-To: <20250814110522.18809-7-peter.lin@sifive.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6700:EE_|TY0PR03MB6476:EE_
x-ms-office365-filtering-correlation-id: 92d66766-81e2-4ac8-a4a3-08dddb48bc16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?big5?B?aVdDZTlvTWVGYklrOHJvVXdWYlNTK0FqcVhOZHE5QjhCYURhaTFqSVg3UExvR3BP?=
 =?big5?B?SU1FYTFGSjJncFE3Q2RDSXVpd0RnWVM4RW9vQjRjVXRFUmN4MEN3aFFrUkZEMGFJ?=
 =?big5?B?WFErcWxCU2d3cElUTHV6S0FCbm5ZVXl1TUpLRjNva0hLTUNsYUxidit0LzcyQ2wy?=
 =?big5?B?MFpCL3I1OXBhRDlWMEN5SEZkVitOTStwM253MmRKN0J3S2pTNUY0OVVLeGtDTk9l?=
 =?big5?B?dEZaZXFUS016THEwMVNPdVFzTlNWcXU2TzdWOUYvK0IyTjVVa3NuZklicmF1OG95?=
 =?big5?B?OHU1UTNBN3FieHNnQk9kRSs4U1Exa0ticjVHd1hvVy9FTm00UmdPSHM1cFNyVzFh?=
 =?big5?B?NllXTUZ3M3Q0RjRMVTBwdUMrQlJsV25tK1dpcVZuRHUvVFFTZ0Z6YThaR2JtVWo2?=
 =?big5?B?dEhlN0c2TDRhOEZVdTJGaTdjVXRXb094Unk1eVA5Ui9ieEwrTE5ka1Q3UGZGcFV1?=
 =?big5?B?ejlXOEJ4blN2dXIrY0pRS0wvK0c5ZDE2TmtYNnFRZFYrdlUwQThIdjYra1BBTjBt?=
 =?big5?B?WGY1VUM1cndpNkE5enhDVWJYaDVET1BJeWg0UzNJWWM2ZXZCcGw4TjM0RU1zUEg1?=
 =?big5?B?VnorbGFkVld2cHhXeGNacjUwa2ptdUl0eldIZUx5c0t2bE9nKzJrVWJzL2t3QUZF?=
 =?big5?B?QW5nci82QXJxWCsyaWFXN0I2MjRsN09vK1lkbVoxYnlOaGFNL0k5NUZNWjlvNEFQ?=
 =?big5?B?YXl6VFRNamxic0Y0VHJOUS9rS0hYRUYzd0NCbS9weGVHeXVrZkRzb0lVNFFZMzVY?=
 =?big5?B?ekdEMUNDRDYzVFBBSE5ZWFBmbUVlWmE1MzdaTXBuRWpJS0x0RkpheDlUK080elVJ?=
 =?big5?B?OW1LTW4rbUIwNTd2TFU5aVFGN3lFemRVbzk5ZUljalY1cVZXK3B4OGpVOTRFMmVJ?=
 =?big5?B?Mm9wcmplcFdaVnFaUVB2SkNDdWJ1b09PZmV2aWxiSHJVMi9zQUw2NmtSaEEwQ1g3?=
 =?big5?B?QlUvaWp1Q0hXV1BwMDljZlJuQ05IRmhSbGFxZ2c0UFhabXVUWHoyS25OT3BJQmhx?=
 =?big5?B?RTZZQzJ3bWpRY25iRjVrdUUzTGpkL3FVbGxtTzQvR3l4aUZrbjlKNnViRkUyMS8v?=
 =?big5?B?RVpzblovbFE1aWRJUkNGcWFPZkVaMkx6akh2WTBuYXpzN3NTd05oTmFIQlBCamg4?=
 =?big5?B?UlF1RkhTMUM4Uy9jQ2RDVi9kK1dXc3FrY24vemthMTFEN2U5QlplT0pqZzdtMGhj?=
 =?big5?B?YlFvbDBXYmVNWVpuTFZMSUx0RTJOYUtLaXA5MFRDTENkOE1ZeWVVdWZWSE1lbkFx?=
 =?big5?B?Ty80SXRHUHllaVcyNzNoNFJoRTZ6Z2Qrb251MmFlNG05VXhTd3VwK0drR3NVRk9s?=
 =?big5?B?T09sWVdQa2ZEZDJ1eVdCZGozQks1NG5WZ0NyaVdLZHQ2VnRFRnBzcGxjd0tFWStl?=
 =?big5?B?MTllRjJBTHVKMDFzdXZkRFNEUWxJMVlQOVcyWTdLOHA5ZDdFWDJPbEtCUFIvbjJC?=
 =?big5?B?Ym44U1lZZHhreU52Wm0yZWZrQ3dJeHdnallmNFRnWG82OGs1eDNsQjRtZ3c4TFpU?=
 =?big5?B?RXdTY2NLUitiYldkZGNEQ2diOFQvRmdGT2VlVWs3R1JrbFpLV1pUUzBuZ2IyZldS?=
 =?big5?B?dFpmeGlyNEp4Ny8wL3VtWllYN2NMUHRwdmVFdVJobHFwV3RVdGRDSDVBWXpDR2JG?=
 =?big5?B?Y3BZbDhieDBGTkpEb1N6QW5kZlBVUWVMRThvVkJlMVM1TVNKdlM5Yi8rTkhnVjEr?=
 =?big5?B?RlU2bVpaM2tjTmZ3bEExR0FFVUxWUXRWTlNxek03OTh5ZG1BeWV4QVNtc0RMR3Bx?=
 =?big5?B?b3NCczd0R0xwLzE1ZTAwcm8vNnJ2UndhYTdzUWtzTzdwYnhGaDhmNjFyYm41Q0U3?=
 =?big5?B?aEpQVlVQcEZoNmxWeVF2U1UrZzh6dWExaWJoK0U0ODk4aTY4TE1QOUpmbkxLT0dC?=
 =?big5?B?dCtGeXpRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6700.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?amtRdHUwdjNQTlVjbFhzZkVidy80V1BMMWJTUVZVaExzbnl1UGhEOXNnV1lGWncy?=
 =?big5?B?QlJlQ1EwbVZFeUxhb3Arbk4vR01OTFJmanhrQ242RG1penBTQllId2F2Z1FUQXFC?=
 =?big5?B?bTU1U1BJZVlXREY5ZkJsNU9IQXVvd0NRdFFPTHdQR0V4WTJHQmtzSGNEZlZWdlFT?=
 =?big5?B?QkpaRnNpd3crZ3hWRFdoTW55MkYxblMxYWhRQ1BkWGwyemJmakovWThuK2tmTVRU?=
 =?big5?B?eThZUFdRL0krUnE0eEJnMVpFc25FMVZiUlN4alhoV1psNG5ISHlCMjN0YjRMb1BF?=
 =?big5?B?RUY5Nm1UNFdaM0Fod1A5VmJmZ2dYMjNLdzJESDVQM0dGRUU0VzY0c2YydTJSZHZw?=
 =?big5?B?cWkwNS9oNk1FUWZWZ3IxSTFuV0hEMDFybm9pdWc4UjhYYTJ0WUQrNGhZb0tNN1Nn?=
 =?big5?B?QktFeVpNbjh5c3p4R25LRFQ2UW1pQmZ3ckp5TWNab3MwWm5XZWt6aFNzMVNqTkhs?=
 =?big5?B?UXYzQW1LMnhJdEpMRmNSa21MS21CaXd1aDJPNVdxcjVHU29GUVB4YXJ3bUFPSWFO?=
 =?big5?B?cS9waFdVV0ZKT24vQnkyN1Nkc1VHVTNvaU5EV21LVERUTHQvV0pralZpclVMUUtZ?=
 =?big5?B?d1ZLaDJ6ZHNzYmlpOW8yTFFsd3l0S21hRjBGR3Myd3YvZUJlNSsxZjlDaEI4MEll?=
 =?big5?B?L3VLc0xGMExtMEtIK29EeGN3anhyVkZtcUVGSzFYYUVZc1JTWGF3KzhCZ2hzUFgx?=
 =?big5?B?MHhkd1JUZkNXTko5eFFtV0JxMHMvaDNpWUg4VzB2Z2gwQjV3TFVQUnpBRlZKbGhQ?=
 =?big5?B?MDBxWm51Q3hCbzV6OVROWStobXZkNFZISmJ5SG4zMFNwZjVXYStSV0ZkcGQ1L3hR?=
 =?big5?B?K3NrT1A4a1kvcWtRL25pWDljdTlETXI1Uk1YM3ZKbTdkNjhISFFkOHc5QVVuRlo3?=
 =?big5?B?OTVybzJ2ZUlkV3laU0MzU1pNNldsNlR1WFBkNGljd2xWOHhiaDBobVlVYkUrNXNq?=
 =?big5?B?cC9JdXFIL0xwQnAxWWhqNzhHZ0FnWms0cXRydDNjVzZmeHQ1bmxCM0RxdXBTdGxZ?=
 =?big5?B?RHoxTEhiNkI4R3hmSW50L0d5b3JrK1UwZWJ1Wi9SUnlpcWh0RFZTWXVxWmk2bXZz?=
 =?big5?B?bm9sNWVHQ0JWUnJKbHNGdXgraTJJYnVVNW40VFV0NHV3bDJNWGNDWWg5TzJlTjZY?=
 =?big5?B?b0hqVnJTRjhIeVNKbWk4blNpLzhBemFiQzhDbGVuUGRWWCtaM29mSkxuN2ZtT1Qv?=
 =?big5?B?UjlFZ044L3Z5aUZMRHJsbVIxWktQNDl5RHhjUlhYWFVVa0VBOUtzR2lxMmNjM0lv?=
 =?big5?B?OHVMMXNqSUFpUEdSZFFuYmhQY1ZFSFNWbVQwZGUyTFRwN0ZSWlk5K055QkF4WTV5?=
 =?big5?B?RUh4U3VjUHNiWHBCVkhOYzIyVzJwY1dKY043OVhZT3hpZk9MTFZ4SDQ4YklGZzVC?=
 =?big5?B?NVZ2RCtsYWxubVhSTDFXT3liYkUvbEJVNzJocUsvK1dBL2RJazE0cmRUN3N0dHFv?=
 =?big5?B?dGtHU0RoYW5UcU9TN1JKVGVzQ0VMMG5waEpoTk9keDlrWFVuZzg3c1MwQ3ZZUkdp?=
 =?big5?B?SGtDNG9SeHFWQXNSWEloVFIrcmtHQjE5bm5sZ3pJQk1OYnV3YlJtNE9JMkkrV0Nj?=
 =?big5?B?NGJMOEs1TjYxYzBUdnZBQjAvSDZWSkpFU004Z0R4dElPc3krYzE0Wms2S3RHMzA2?=
 =?big5?B?MUpqbGptWE8vYUpFM253dVZFN01ucDI0R09TL1FQWnM2cERBbDh5YTN2NDZxMVlo?=
 =?big5?B?dllaUytSOU03cEZpekZlRGM4dG1GaTZBY09sT0xyK2thYW5uTEhqa3BYbWJWNXo5?=
 =?big5?B?dHhSYWltTjhieEpldWN0U0dVVjY1YmxncXlpYjgzSkJzeGhWVDhFa2hyR0Qxelo5?=
 =?big5?B?aTJFdW1yWVFId2h3RjF0Njd4eGZQUGhKVjZBS2FaTUhxRUlTVWFMbWo2bFFyRFRR?=
 =?big5?B?WVREcUJ4ZkVrYVR2dUl4Q1RHZ0hqc1dvTk5vNG91UUNVVmwyQnV4cFJPWlBtS01W?=
 =?big5?B?eFRQRjN5RldQemF0YWtFSHlUUE9NUngyWmZjbVRveU1kQVRjRzdYc0ZMTFVlekhX?=
 =?big5?Q?NGeY5HbgWi1cya4y?=
MIME-Version: 1.0
X-OriginatorOrg: andestech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6700.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d66766-81e2-4ac8-a4a3-08dddb48bc16
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 15:39:19.5863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PbiSoflfACLNeffkev+uKtGyDJ2oq/Y3SuV+Q+NIWPvkVqgww/4HXWP9Dz8fxsknmc8pYerPEGWJ8/Hvp64iPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6476
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_083940_610745_125C4598 
X-CRM114-Status: GOOD (  17.81  )
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
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWXUtQ2hp
ZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1
Z3VzdCAxNCwgMjAyNSA3OjA1IFBNDQo+IFRvOiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcN
Cj4gQ2M6IHpvbmcubGlAc2lmaXZlLmNvbTsgZ3JlZW50aW1lLmh1QHNpZml2ZS5jb207IEFsdmlu
IENoZS1DaGlhIENoYW5nKLFprfUNCj4gucUpIDxhbHZpbmdhQGFuZGVzdGVjaC5jb20+OyBZdS1D
aGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
Ni84XSBsaWI6IHNiaV9kb21haW46IGFkZCBTQklfRE9NQUlOX01FTVJFR0lPTl9GVw0KPiBtZW1y
ZWdpb24gZmxhZw0KPg0KPiBbRVhURVJOQUwgTUFJTF0NCj4NCj4gQWRkIGEgbmV3IG1lbXJlZ2lv
biBmbGFnLCBTQklfRE9NQUlOX01FTVJFR0lPTl9GVyBhbmQgbWFyayB0aGUNCj4gY29kZSBhbmQg
ZGF0YSBzZWN0aW9ucyBvZiBmaXJtd2FyZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4g
UGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL3NiaS9z
YmlfZG9tYWluLmggfCAxICsNCj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICB8IDggKysrKysr
LS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkv
c2JpX2RvbWFpbi5oIGluZGV4DQo+IDhhNTFmMjg5Li5kNzEzNTRjNyAxMDA2NDQNCj4gLS0tIGEv
aW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oDQo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4u
aA0KPiBAQCAtMTU3LDYgKzE1Nyw3IEBAIHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lvbiB7DQo+
DQo+IFNCSV9ET01BSU5fTUVNUkVHSU9OX01fRVhFQ1VUQUJMRSkNCj4NCj4gICNkZWZpbmUgU0JJ
X0RPTUFJTl9NRU1SRUdJT05fTU1JTyAgICAgICAgICAgICAgKDFVTCA8PCAzMSkNCj4gKyNkZWZp
bmUgU0JJX0RPTUFJTl9NRU1SRUdJT05fRlcgICAgICAgICAgICAgICAgICAgICAgICAoMVVMIDw8
DQo+IDMyKQ0KDQpUaGlzIGV4Y2VlZHMgInVuc2lnbmVkIGxvbmciIG9mIFJWMzIgd2hpY2ggb25s
eSBoYXMgMzIgYml0cy4NCkJlc2lkZXMsIHdoeSB3ZSBuZWVkIHRoaXMgbmV3IGZsYWc/DQpJc24n
dCBTQklfRE9NQUlOX01FTVJFR0lPTl9NX09OTFlfQUNDRVNTKF9fZmxhZ3MpIGVub3VnaD8NCg0K
PiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICB9Ow0KPg0KPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4uYyBpbmRleA0KPiBkNjU2
NmIxMi4uY2NmY2M3ZjAgMTAwNjQ0DQo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jDQo+ICsr
KyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jDQo+IEBAIC01NDEsNiArNTQxLDggQEAgdm9pZCBzYmlf
ZG9tYWluX2R1bXAoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwNCj4gY29uc3QgY2hhciAq
c3VmZml4KQ0KPiAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiTTogIik7DQo+ICAgICAgICAg
ICAgICAgICBpZiAocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX01NSU8pDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVjSSIsIChrKyspID8gJywnIDogJygn
KTsNCj4gKyAgICAgICAgICAgICAgIGlmIChyZWctPmZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJ
T05fRlcpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVjRiIsIChrKysp
ID8gJywnIDogJygnKTsNCj4gICAgICAgICAgICAgICAgIGlmIChyZWctPmZsYWdzICYNCj4gU0JJ
X0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSkNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
c2JpX3ByaW50ZigiJWNSIiwgKGsrKykgPyAnLCcgOiAnKCcpOw0KPiAgICAgICAgICAgICAgICAg
aWYgKHJlZy0+ZmxhZ3MgJiBTQklfRE9NQUlOX01FTVJFR0lPTl9NX1dSSVRBQkxFKQ0KPiBAQCAt
ODk0LDEzICs4OTYsMTUgQEAgaW50IHNiaV9kb21haW5faW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2gg
KnNjcmF0Y2gsIHUzMg0KPiBjb2xkX2hhcnRpZCkNCj4gICAgICAgICAvKiBSb290IGRvbWFpbiBm
aXJtd2FyZSBtZW1vcnkgcmVnaW9uICovDQo+ICAgICAgICAgc2JpX2RvbWFpbl9tZW1yZWdpb25f
aW5pdChzY3JhdGNoLT5md19zdGFydCwNCj4gc2NyYXRjaC0+Zndfcndfb2Zmc2V0LA0KPg0KPiAo
U0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSB8DQo+IC0NCj4gU0JJX0RPTUFJTl9NRU1S
RUdJT05fTV9FWEVDVVRBQkxFKSwNCj4gKw0KPiBTQklfRE9NQUlOX01FTVJFR0lPTl9NX0VYRUNV
VEFCTEUgfA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9ET01BSU5f
TUVNUkVHSU9OX0ZXKSwNCj4NCj4gJnJvb3RfbWVtcmVnc1tyb290X21lbXJlZ3NfY291bnQrK10p
Ow0KPg0KPiAgICAgICAgIHNiaV9kb21haW5fbWVtcmVnaW9uX2luaXQoKHNjcmF0Y2gtPmZ3X3N0
YXJ0ICsNCj4gc2NyYXRjaC0+Zndfcndfb2Zmc2V0KSwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChzY3JhdGNoLT5md19zaXplIC0NCj4gc2NyYXRjaC0+Zndfcndfb2Zmc2V0
KSwNCj4NCj4gKFNCSV9ET01BSU5fTUVNUkVHSU9OX01fUkVBREFCTEUgfA0KPiAtDQo+IFNCSV9E
T01BSU5fTUVNUkVHSU9OX01fV1JJVEFCTEUpLA0KPiArDQo+IFNCSV9ET01BSU5fTUVNUkVHSU9O
X01fV1JJVEFCTEUgfA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9E
T01BSU5fTUVNUkVHSU9OX0ZXKSwNCj4NCj4gJnJvb3RfbWVtcmVnc1tyb290X21lbXJlZ3NfY291
bnQrK10pOw0KPg0KPiAgICAgICAgIHJvb3QuZndfcmVnaW9uX2luaXRlZCA9IHRydWU7DQo+IC0t
DQo+IDIuMzkuMw0KDQpDT05GSURFTlRJQUxJVFkgTk9USUNFOg0KDQpUaGlzIGUtbWFpbCAoYW5k
IGl0cyBhdHRhY2htZW50cykgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGFuZCBsZWdhbGx5IHBy
aXZpbGVnZWQgaW5mb3JtYXRpb24gb3IgaW5mb3JtYXRpb24gcHJvdGVjdGVkIGZyb20gZGlzY2xv
c3VyZS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBoZXJl
Ynkgbm90aWZpZWQgdGhhdCBhbnkgZGlzY2xvc3VyZSwgY29weWluZywgZGlzdHJpYnV0aW9uLCBv
ciB1c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaXMgc3RyaWN0bHkgcHJv
aGliaXRlZC4gSW4gdGhpcyBjYXNlLCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5k
ZXIgYnkgcmV0dXJuIGUtbWFpbCwgZGVsZXRlIHRoZSBtZXNzYWdlIChhbmQgYW55IGFjY29tcGFu
eWluZyBkb2N1bWVudHMpIGFuZCBkZXN0cm95IGFsbCBwcmludGVkIGhhcmQgY29waWVzLiBUaGFu
ayB5b3UgZm9yIHlvdXIgY29vcGVyYXRpb24uDQoNCkNvcHlyaWdodCBBTkRFUyBURUNITk9MT0dZ
IENPUlBPUkFUSU9OIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZC4NCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
