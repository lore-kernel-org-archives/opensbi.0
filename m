Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755D3CA0ED1
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 05:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2Cgo46onJ5FAJIz1jGOngoAAeUmbR1lVqJCYORYLGw=; b=X+NbWH8d3ifRcl
	Ex4CCD/i99lXb9iaXDDW7olJ4Ef6hw/DyQkRMkwlaOQS9yWROo23dZ2r6lQcBAdGpalz49e+qTzTZ
	ZvX/hw75oPHhnLlZLrGIpE2F2fgrG3uduM62V9g1QnVBYXTgGqLUgKG9GOKJQe+gjn/ceZr1nf6s1
	qQRrZH6qsmL4tzfXYH2M48OlGnOENjDZk+5IcpTwffTjxyj6y3OJRnhuV8th/eubebnAvJgPIu6JJ
	qHOGzPqYe7Zk2fiZugDX7OkGO19dqc3kboVNfUJy+dlGPL96Aa6iPN/iMcqmos/6GAqEdyEvI800E
	Ss7nVFcjzLbgE0EEnERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnOw-00000001YXQ-3w7m;
	Fri, 15 Aug 2025 05:54:54 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnOa-00000001YW4-0F6S
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 05:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbqUwg6wQZvSOlQGAYT3xTxiudu2t8uNy5vdBSnEZ1fd5wJ2MDRpCYTo3aKWSeGdIzl5oAlMkxqskENaD0rGACLlRtmXIyHcYgHF2rHRZ5NBU5hSh0qeUP10Xz8QZkDRz4OHF9Lmm7i7GaEBeu6gunE4fYA7qH7AIU8ybbk80THtmZYPCsfT/x8yAw5AciqWlTJXPJ9BEwNKxJgaYRbIBkUlL2i23RyYdfRzrYvfTX73tlbMVwEm2ubaSOkSUn5qeScnS/BOuL2nvSUqSQc9iJ1B+rKery7jsneISVhSuiGeOcHSkQyY7ZIvi1pAYDHOSv7zM6ceyavDqOwGu8EMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueqMY7aThXI/45AiBXFYBde7ZHZjg4tE/CpZpcgYBxU=;
 b=ZCxqv8DTH4laS4MsxGn9h23O/B9gVsVmDLDlnj9mlqdobkzEz2DldyZM1l4PAj/UMcVzK/v6Shh0WGhscFTjbFQy6jQlpcLtMR1h5nERV/vmnSqxNkgyloOXmlArlMFJsvOQpmRJECO677t/LNBMlwBCyariFwoqREln0SjCSlKgTPD3MH61bfy8R+NoFG4mAXMBRlNaX/yLpJQ1Qo1+xLGfMAhlaugGyI7033l0Vkf0hTq7l39h5qe3vpUvn4wGn3aWc3mtRspIRTH+ceNBjO89sZ5aowrucwJ1bXzNGsY/Eiz8cNAV4fz35IOsBPreUh5qkU+OC1dHIgz6IS25Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andestech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueqMY7aThXI/45AiBXFYBde7ZHZjg4tE/CpZpcgYBxU=;
 b=fYGooUx6+UBfqMYeYaWEF0H2IC5MHbYS2Gl6P1sUvBBeEIwWNjLyDvnNGl0aMioaMiQdXMa2f7gBaEPz/ra9X+O+6VSBuzEWVBRdoY2LdrSxW0WR2XRqZZ6liZWVq1W2lbsPb+whdNaPqhHfFnQZHeA83nsOhDyOwBZ5jsUl30f7o6bqo7Qw2z194cSZWlSabepLk2mzTiggASWwXwCSL2JAcrGKCq99FMmNnHhfTwz1OYxesCzRNdeYWXGXZd2PvPkRDiz4bZ9Ed6SDS4jubR1VR0avRYh75m/wmHwd7VyJK/VwD+nRX6pPQ/AAu5hEOhL51xGcBhFA+JzmW9ShUA==
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com (2603:1096:101:69::14)
 by SEZPR03MB6958.apcprd03.prod.outlook.com (2603:1096:101:9f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 05:54:16 +0000
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::292f:e1ce:7df8:115e]) by SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::292f:e1ce:7df8:115e%7]) with mapi id 15.20.9031.012; Fri, 15 Aug 2025
 05:54:16 +0000
From: =?big5?B?QWx2aW4gQ2hlLUNoaWEgQ2hhbmcosWmt9bnFKQ==?=
	<alvinga@andestech.com>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>, "opensbi@lists.infradead.org"
	<opensbi@lists.infradead.org>
CC: "zong.li@sifive.com" <zong.li@sifive.com>, "greentime.hu@sifive.com"
	<greentime.hu@sifive.com>
Subject: RE: [PATCH 5/8] lib: sbi_domain_context: skip the reserved entry
 during domain context switch
Thread-Topic: [PATCH 5/8] lib: sbi_domain_context: skip the reserved entry
 during domain context switch
Thread-Index: AQHcDQtk3pZqHfeKmkqc2HRmo5Kil7RjM7Hw
Date: Fri, 15 Aug 2025 05:54:16 +0000
Message-ID: <SEYPR03MB670028ED423612A1F943DA92A834A@SEYPR03MB6700.apcprd03.prod.outlook.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
 <20250814110522.18809-6-peter.lin@sifive.com>
In-Reply-To: <20250814110522.18809-6-peter.lin@sifive.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6700:EE_|SEZPR03MB6958:EE_
x-ms-office365-filtering-correlation-id: 10acf50e-cd8f-4e59-5391-08dddbc02b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?big5?B?ejRxcTQyUUF1RUFiZU5XN2hCeFlvZmpJUExoUjl1cFNPdldQZHF1b29uMThoS2NY?=
 =?big5?B?U1Z5RGQ5RVJMQUJ6TDlUSGhUclNxajZBdFNsdVE1aTZ0Ri9QR2lkcGR2NmVPNm1P?=
 =?big5?B?TjE1TVpXNGJoTTZkeEdSSVFpSHlCcitnU2M3NU1IN3hiVXh2ZWFLWU12TkUxT3A3?=
 =?big5?B?a0RsSExHOWowODJOcFZaQ0ZxNmwvTU1XZ2JVSzJ4c3lLaU53MkdLRDNSdG9JMG5D?=
 =?big5?B?bE9IcUN6ZENBRnE1eW9Qcy94U0hLd214bmY0NUd3T0NGR3FxQ3FIbEhRWTd0V25k?=
 =?big5?B?bjNlU2Zic0dRS1ZhdGRTVXpiZmFzOGRWcGJGRFpqWkxRQlp0bThqL1dDeXljWEo4?=
 =?big5?B?Nnc5dlkzWVdyRDM3L2NBTTJFUGlZbUI0emI4Rk03NXJ6UVU4YVR3MjNCeEZ4d2lk?=
 =?big5?B?R3l3SmU2bC9xbU9Ic1dNT2xFVDh3bXZQSnhUZUNUa1o5TFBGd0xIakl1Tjh2TTJx?=
 =?big5?B?dHZzdDVVZ1JlcGdST2lmN2R5NXgvZy90UmVYY0pyR0s3cFJUTEZZVjJXMm9idlVE?=
 =?big5?B?U3ZWNS9KMUxuRy9vMzRyUE5BVENyR0JHN0lLNTFUWnpPdmhZOXFReWJ6OVZIUDdY?=
 =?big5?B?cm5NMnUzSEFJV3BaSzRYWjFRckdUY1RSZnZkTXBTeUROZUtieUJGVk95dURBNXls?=
 =?big5?B?cGxUa1ZRVWVrRGx2RXJpMGRpSDV5ZVczc3JoTjRnWUVObVYxdERZK2hVV2ErdkE4?=
 =?big5?B?M0tNdU5jdVJDU0xmVnNuTDN0UHk1RXowclQybGJPeDU5U2YzMnhNYWZDNnVUSjVH?=
 =?big5?B?Vmx5RHlqaHRkZUdhRmJlME8zM2ZnRm1KSTNERGJiWkZYR2xzUkIvT2NKOVJGSXB2?=
 =?big5?B?ejhTZTJuZVQrMmk4Unp4dVhlaENmNStHTFFNRWN3a1dHRExSbUVWR1VFOVRJQ2l1?=
 =?big5?B?bUl3QzZtYnNQRTdaQ3EvQ0xvbnd1MUFvUmpUSHU2Z2w3Um8zV25lOTZ1ZXhjdldv?=
 =?big5?B?V2FUMFFTUE8yZ2V3cTh2RUtIODROcFIvb09MU1dEYk9wZjF3VmFqckpkb0tqb1lZ?=
 =?big5?B?VHRSOUVIZjB0VFdoVFhHbHJtbStwL0xyRlFwUlVxUnhDbU9wejkrK1orK2swbDNS?=
 =?big5?B?TGpXSHgzVXYzZFl3eVlhMjJXU0V1eU1DelNzM0MrcTRicW0xRXJsemI3VjNVbUs3?=
 =?big5?B?T0pHbGN4TzRQb0t1S3luK0dSdzJrSHZlT1YxL1ZlaDFyb2p4Y09pYU9tck5yNHVQ?=
 =?big5?B?UXQvWk8xaVp1elhZaFpBMkR2RUhaMlVmQy8rVXdTTXRxajBSMzd1VUN0aTlJVkRz?=
 =?big5?B?OEg3N0YyNStsc2FoZXMrYjdtdGRiS1ZncXZvWW9WNXFiTWpodXF5dTljMDBOZU5u?=
 =?big5?B?Y2FMc0J0Zk84Mk5LRHE3UUY2aHRJcFRPRnhyektrUDFWV2VlRkErUzN5d3J2Ymo5?=
 =?big5?B?S051TG02SDRaVWp6Ym85SXBOMGZKVlNyUWZPSnlpNEV4Ym5zTDRtNWY3OS8yVXg4?=
 =?big5?B?QVZ3NFZDY1kwRUE0a1kyZGpoSnhVWHJ5K3p0ek0ySjJtMGRSeGtXajBLNVVqaHFK?=
 =?big5?B?empDQW5ZT2xCMnpZVnhnOXM3SUs0MWFJQjF6dzFnanBuQkVyQUdNc2xEUnpmNjJI?=
 =?big5?B?SHVmdHp3VmlwVHNKMXJKcjZIaE1POGhyKzA4aHpLa1lDNjZFT2Q2QUJuSHo3RjF3?=
 =?big5?B?RllOMWRTQnNpNXhhT2czTDFtZmQ3clpwSnlqOC9YNnoxU3cyOEtOS3hWa0haSDlm?=
 =?big5?B?R1hXdlVzR1pOaEZBWi96emIzLzRra1lmdUNoblRGMk9FdExUWEVYaThhTjV6enB3?=
 =?big5?B?czZMeEpjN3dZS2Q2N0JmVVhDR3FkSmhaVlhXclo5YWdCT1JWdkg4Yk9xRnI4RXhJ?=
 =?big5?B?ekNKYkRTWStBK0ZmUlNVaUZEcmdaT3VKNzRJRlZ3dVFRZTFSTzFzWGRYVWFhMDhk?=
 =?big5?B?V2llcVp3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6700.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?ckh3YWI3eUI5cC9PUFU4U1FNRXRVeGpXVkEyUStXK3owT2tSVzFkUjc3SEVXeDRj?=
 =?big5?B?TW1BSzF0ZFZIbWRaM3pOSVZWYVlkcFpOZ29LNGNHdithaHNzZVpicTNzbXhmT0du?=
 =?big5?B?NGkzUFFkVTNkeHl1clVZZzBjNExwbjl2cHpyc0Q1UXlVNnhMUkVZaWNVYXBxbXBJ?=
 =?big5?B?K3FZQ29hSklwem1JNXo1LzcxbVUrZVliRm9xQmY3M3dYbkQzWGV1WHdxL05iS1lI?=
 =?big5?B?dFBiYkpaUTB5ZlBldmtLOXJEQVpHT1FTN1NqTjdZSU5SV1pHcktOSnFpOVdaSU83?=
 =?big5?B?RDhYQVhnWjhpN0pueUFkeGw4ZjZBamJXUk1BZTZOYXZGYVNadUNNSjE5bmx3REVU?=
 =?big5?B?Y05wbGhXRVkyQ1hQOXRBOUJRYXRldjhHY1lucEhGWFFlSEpZeGc0RTFUeGZlSkl0?=
 =?big5?B?UXZLb0RwK2R6Qm5nMjZpZ2VaWUYyM0szWEpNaWlZUkNEdVpoUHZhTmJyR25naEZ6?=
 =?big5?B?cTZtbWM2ckhHWk5DRXVnKzVyUDZpOVFrK3pjcVFMSnF0UTlLN2tNRGNZeWpCbElu?=
 =?big5?B?OGwwd2Z2RFBFQ0wzRU0zSGpsNVJZQjBUSXJoVWVjcEk3OXJldEwwZXRjN2o1WVI0?=
 =?big5?B?UkpNRThsbWw4elBkN2ZFUW5JZm9qbElXdTFnemdWWmliTnR0ekQ0bWFyc090bXhK?=
 =?big5?B?SWxUMGxVWnVrdEtRR0dXd3hnOXBhdzlLM043V3Z0YUIxNWg0Zm9VNzJXYUdvbXNX?=
 =?big5?B?Q3d0VFFYeDhNbXkwTmFQSkZDZ2tZc0d5cjRNaEUwWE1Ib21XcmQyZUNDdnNBN2ZR?=
 =?big5?B?eGJyOTRjcFgrWmNuTWZlbFZ2bytLT2l4Qjk0V3luOEpDbzVKOHdLU09jdXFzeTRi?=
 =?big5?B?ZCtzMGNnTFlMTHJnL2lQS3ZQajlRQ1dtYkFBektpc2dwK044Q3ZzTDAzZUdwdWIr?=
 =?big5?B?Y3lSU2l1R2JtZndjdldPMmJ3K2pCNjRlWnh3ZmJmVXBZRjgxeXRiaWk1SS9iY2E0?=
 =?big5?B?VGEwZHFjRTBkREQ3M1BXNjJFM1UvVFR3ak92NDFuc05qQTFCK0RPSlNsS3VETkk2?=
 =?big5?B?V3Q5Ym1iZWd5Rk1mRDhvaFdTL0ZzUzlqL3VTVFJJbTlYWXQ2REYyOWY2a2x0Z0lu?=
 =?big5?B?WElsZHBVbURvTW1aZ0RRYmVSZ00yV3hzalF3VzI4ZGpZcXBGS0gwR3dhbC8xenJC?=
 =?big5?B?dElRL29Jc1FmOGdVeUNXaGludGhXNkp3SHp2K3BpdUZCNW1iODQzcWdqWkNnSUJE?=
 =?big5?B?TzgrcWkwR1VxaWl4d0VUVG9ZdkNDQ2ZQSW5RNHBHRGxvUlhjUzJGMEMycHQwSUls?=
 =?big5?B?T1FuZlNPV3c0MnF0VnRVcWplMXRrMFA2dzE5elJ0TFFVVy9TQjRqNTRJSC9zVlBT?=
 =?big5?B?R2JOdkdMM0xxdUxjMGI2RmZBbVp1MkFFbktOSGVDNkx3VCtoM0c0a01NWGxrVVVL?=
 =?big5?B?U0dKN29idk1vbGZlSXVOWldWQkFaMUxMZlFoV3dCMUxjb1JsT21mTWh1VTBCR1g3?=
 =?big5?B?bTJ1MTlSazV6a2NpNWFOaEhxY3F5UE8wNG42N1ZYaGdCdHdEZFNMUW1uVFY4MGFi?=
 =?big5?B?M05lOXU0TTRqOWpKSXd6bk5JUmVBSktoUmRTYjZsWUFFdk9UTS82MTdoSkE5aXNV?=
 =?big5?B?YzBNMnhQUEhqK00wZHNsZWZMVWU2bEZ2WXRBeXV6V09lSHR6bUdJcmdjeUJuRVJN?=
 =?big5?B?LzNraTdFTVJRVEVPZVhCWG84cGhUc01YZ3RLOHpZdFZLeU1YUzIweUhwdnpPeUFQ?=
 =?big5?B?QVdKWVNkeFUwTk0vOHViS0FORVhqRHVPVE91RHJMdmJCeUZ0L1N5STlPNkJkSDVE?=
 =?big5?B?cUdBNXh1OTBpNXpLSXh3bGpXSzkrcWVJVlk1cTV0ZkRDQjJqSVk2MlZRNEgxY1Vp?=
 =?big5?B?b2xUVzZQRVlzWDgzaUxzN0Y5UXNZY2FWZHZ1RDhCQUlUSmRrOFp2YkNQM1l4Q01B?=
 =?big5?B?RGtUaEZKWDNIb2ZRbjFvWlUwWkUza2lqcVhoMGNYNEdsdDFSRFlpclJsT3RVK2ho?=
 =?big5?B?WGJxTFYyVW9tQXQxOFRCZ0xOMGZGS2Z2cUExQ3pjQ3RiOTYwSGFOditFQW50eDVr?=
 =?big5?Q?3PVSNww7MfbH3nbH?=
MIME-Version: 1.0
X-OriginatorOrg: andestech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6700.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10acf50e-cd8f-4e59-5391-08dddbc02b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 05:54:16.0983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pORPlXrC53/TsKz5npEW22zx+9WKLdeEdBoXoobMxPzudFFoLyxKEOS8xnVut8c4ydKtia8shBCQxUJF5YXN+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_225432_648760_ECBAE4C2 
X-CRM114-Status: GOOD (  20.69  )
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
NS84XSBsaWI6IHNiaV9kb21haW5fY29udGV4dDogc2tpcCB0aGUgcmVzZXJ2ZWQgZW50cnkgZHVy
aW5nDQo+IGRvbWFpbiBjb250ZXh0IHN3aXRjaA0KPg0KPiBbRVhURVJOQUwgTUFJTF0NCj4NCj4g
VGhlIHJlc2VydmVkIGVudHJ5IGlzIGFjdGl2YXRlZCB0byBjcmVhdGUgc2hhcmVkIHJlZ2lvbiBi
ZXR3ZWVuIE0tbW9kZSBhbmQNCj4gUy1tb2RlLCBpdCBzaG91bGQgcmVtYWluIHVuY2hhbmdlZCBk
dXJpbmcgZG9tYWluIGNvbnRleHQgc3dpdGNoLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPg0KPiAtLS0NCj4gIGxpYi9zYmkvc2Jp
X2RvbWFpbl9jb250ZXh0LmMgfCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIv
bGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyBpbmRleA0KPiBmYjA0ZDgxZC4uMTgxMmM3Yzkg
MTAwNjQ0DQo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMNCj4gKysrIGIvbGli
L3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYw0KPiBAQCAtMTE2LDYgKzExNiwxMSBAQCBzdGF0aWMg
dm9pZCBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChzdHJ1Y3QNCj4gaGFydF9jb250ZXh0
ICpjdHgsDQo+DQo+ICAgICAgICAgLyogUmVjb25maWd1cmUgUE1QIHNldHRpbmdzIGZvciB0aGUg
bmV3IGRvbWFpbiAqLw0KPiAgICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcG1wX2NvdW50OyBp
KyspIHsNCj4gKyAgICAgICAgICAgICAgIC8qIFNraXAgdGhlIHJlc2VydmVkIGVudHJ5IHdoZW4g
U21lUE1QIGlzIGVuYWJsZWQgKi8NCj4gKyAgICAgICAgICAgICAgIGlmIChzYmlfaGFydF9oYXNf
ZXh0ZW5zaW9uKHNjcmF0Y2gsDQo+IFNCSV9IQVJUX0VYVF9TTUVQTVApICYmDQo+ICsgICAgICAg
ICAgICAgICAgICAgKGkgPT0gU0JJX1NNRVBNUF9SRVNWX0VOVFJZKSkgew0KPiArICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gKyAgICAgICAgICAgICAgIH0NCg0KSXMgdGhpcyBy
ZXNlcnZlZCBlbnRyeSBtYXBwZWQoYWN0aXZhdGVkKSBkdXJpbmcgZG9tYWluIGNvbnRleHQgc3dp
dGNoID8NCklmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgdGhlIG1hcHBlZCByZXNlcnZl
ZCBlbnRyeSBjcmVhdGVzIHNoYXJlZCByZWdpb24gYmV0d2VlbiBNLW1vZGUgYW5kICJjdXJyZW50
IHN1cGVydmlzb3IgZG9tYWluIi4NCk5vdyB3ZSBhcmUgcGVyZm9ybWluZyBkb21haW4gY29udGV4
dCBzd2l0Y2ggdG8gIm5leHQgc3VwZXJ2aXNvciBkb21haW4gd2hpY2ggZG9lcyBub3QgaGF2ZSBw
ZXJtaXNzaW9uIHRvIGFjY2VzcyB0aGF0IHNoYXJlZCByZWdpb24iLg0KSW4gbXkgb3Bpbmlvbiwg
dGhpcyByZXNlcnZlZCBlbnRyeSBzaG91bGQgYmUgZGlzYWJsZWQgZm9yIHNlY3VyaXR5IHJlYXNv
bi4NCg0KTWF5YmUgT3BlblNCSSBzaG91bGQgImNvbnRleHQtc3dpdGNoIiB0aGUgcmVzZXJ2ZWQg
ZW50cnk/DQpJZiB0aGUgcmVzZXJ2ZWQgZW50cnkgaXMgbWFwcGVkIGR1cmluZyB0aGUgZG9tYWlu
IEEsIGFuZCBzeXN0ZW0gc3dpdGNoZXMgdG8gZG9tYWluIEIgd2l0aG91dCB1bm1hcHBpbmcgdGhl
IHJlc2VydmVkIGVudHJ5Lg0KRG9lcyB0aGlzIG1lYW4gdGhhdCBPcGVuU0JJIGNhbm5vdCBjYWxs
IHNiaV9oYXJ0X21hcF9zYWRkcigpIHRvIG1hcCBzaGFyZWQtcmVnaW9uIHdpdGggZG9tYWluIEI/
IEJlY2F1c2UgdGhlIGZ1bmN0aW9uIHdpbGwgcmV0dXJuIFNCSV9FTk9TUEMgaW4gdGhpcyBjYXNl
Lg0KDQoNCkJlc3QgcmVnYXJkcywNCkFsdmluDQoNCg0KPiAgICAgICAgICAgICAgICAgc2JpX3Bs
YXRmb3JtX3BtcF9kaXNhYmxlKHNiaV9wbGF0Zm9ybV90aGlzaGFydF9wdHIoKSwgaSk7DQo+ICAg
ICAgICAgICAgICAgICBwbXBfZGlzYWJsZShpKTsNCj4gICAgICAgICB9DQo+IC0tDQo+IDIuMzku
Mw0KDQpDT05GSURFTlRJQUxJVFkgTk9USUNFOg0KDQpUaGlzIGUtbWFpbCAoYW5kIGl0cyBhdHRh
Y2htZW50cykgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGFuZCBsZWdhbGx5IHByaXZpbGVnZWQg
aW5mb3JtYXRpb24gb3IgaW5mb3JtYXRpb24gcHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gSWYg
eW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBoZXJlYnkgbm90aWZp
ZWQgdGhhdCBhbnkgZGlzY2xvc3VyZSwgY29weWluZywgZGlzdHJpYnV0aW9uLCBvciB1c2Ugb2Yg
dGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4g
SW4gdGhpcyBjYXNlLCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmV0
dXJuIGUtbWFpbCwgZGVsZXRlIHRoZSBtZXNzYWdlIChhbmQgYW55IGFjY29tcGFueWluZyBkb2N1
bWVudHMpIGFuZCBkZXN0cm95IGFsbCBwcmludGVkIGhhcmQgY29waWVzLiBUaGFuayB5b3UgZm9y
IHlvdXIgY29vcGVyYXRpb24uDQoNCkNvcHlyaWdodCBBTkRFUyBURUNITk9MT0dZIENPUlBPUkFU
SU9OIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZC4NCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
