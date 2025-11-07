Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E359CCF9F8
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w7BRyd7bkNq7bSRW1SX/jhgnDwpBnEaOfL3g8HdKE/w=; b=s0BOiesdyQZD9H
	ty8q758B+04O0TGoF4gRU5n033Rn1itrsnjJ3bgBW/FSb9vIh6uQ8BF2QRlLsShV6I8Ms16vmcvta
	VDx8zheZzGpMe7tNGCUfddCBXj1fxdZr2ksy9Rqqxx1mpc3WJZcT0Y/z2fxvQASDXNW+/vON4MqMI
	Xuf+iQ7VIIs+shZr33vv9F8xLhae+Td4RL9udUMMesdyAQfrWFThTOz83MBfIS8yFbm6v+M9z2PDq
	w9SjzeZjLUUUMtIF9F9dutw9ctVDxDKMAtM9G36HnYnwwHep9kt1CKIfEEMUzbFYaZiPsp57fIg0C
	G53MYVKySeTL2Gehqb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHJ1-0000000Gow0-3DsT;
	Fri, 07 Nov 2025 07:54:47 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHIz-0000000Gout-3o7Q
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 07:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfUTUTBSVzQ4ANyzJOIZT+XWxsZs1oIy6vlcws5utPWqIkC0pZDnMiCfxlW+hbp9nXuKF6i11Hx/qNyuzwQYXIzKld7NtvB0DzRRYpcT6G1qzycrzY54wriSBdgVV+tBce4G7NyFr3vwzqCmWTQBxp82tYn+1ZD6foUV2D6O37ML0cgrJBYVnYoTeg2ZRVO2C+61zK4Ul6IiHTUpejmHqz9lEotDkSQcF6NqX3qg+uGZiP+JLW/QueBKfqeknbAaOxo3LXcHTkk5Gld5YkOknNZY93PDmq+zit4sSDUwd0BAv90TA6mSKF9dTkMTpptiB43yrG2cQlIYKwG7YIZwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFtFN8cPvRZAV+C3yshoJgGnaiG2sP3hlwbUSj6Dtfg=;
 b=QcZf+00iBwotuDXqaZe3UsYMWl0PmFUTDxxx8YKiR0KwrMPJBJNzmBEKkUOBZJBk7Dd67SMxf5Ix48hgteSPEH4dKNNDXon4DM5dVsalYGK2/SSlUnvlqHuliH7j+0IKe32uNQcym/fyaubnA30lQC7zewcWK/rEvv7T3AvDs6tXzTufZYht+diVqV4ukB/cPcKhPOfg3rVfGIW1gl26/HYMv7mBZ/lT0fFUXVUSDIYFj+dGyIKo8se/D4IqFAWnBtcKPtVIkqor4xp/vVtxruL2rCr3JoiyqudzEIL2JIFNe78O03A7meflDjGI+3Z7SEgZ3NdUfKz0MhU8emQOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openchip.com; dmarc=pass action=none header.from=openchip.com;
 dkim=pass header.d=openchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFtFN8cPvRZAV+C3yshoJgGnaiG2sP3hlwbUSj6Dtfg=;
 b=uHvSPH1wk5GR1/Xl7mlZkkQnKc2O113U+7wCkvafz4WxNHkDupX5mV916ooBwkOLA5sfq3lZhOXsNWbzPzxbxv47/oCSNOtlE/ejXHbR8NHejGVCxf+bxRTnKfaC63EZyuXPmE7RG28OiSHRmwAzdvVGK9wMUC52f/NDI9U1jIvZ0TGihdn2aC/OwWGE+SOhDaAfbL5aHQlT5GdmFlIVk3CzpRlhZD8Rz70NyprLHbBke0blyRiE6VTVxLZwigsacXv0ntGekm7TlngShxFoTzxoq6TkxG8xnaYfziguder+Uwpu5oIjxDg3cIi4inFIOR8deYbMJEHzv5r6RY/CAw==
Received: from AM4P192MB3105.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::18)
 by AM9P192MB0949.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 07:54:42 +0000
Received: from AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
 ([fe80::b8b9:5b3b:827d:eed0]) by AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
 ([fe80::b8b9:5b3b:827d:eed0%5]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 07:54:42 +0000
From: =?utf-8?B?TWFudWVsIEhlcm7DoW5kZXogfCBPUEVOQ0hJUA==?=
	<manuel.hernandez@openchip.com>
To: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: =?utf-8?B?TWFudWVsIEhlcm7DoW5kZXogfCBPUEVOQ0hJUA==?=
	<manuel.hernandez@openchip.com>
Subject: [PATCH] platform: openpiton: use generic early init
Thread-Topic: [PATCH] platform: openpiton: use generic early init
Thread-Index: AQHcT7vGCua0PJShgkOneQ/xeB7S4w==
Date: Fri, 7 Nov 2025 07:54:42 +0000
Message-ID: <20251107075429.1382-1-manuel.hernandez@openchip.com>
Accept-Language: en-US, es-ES
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=openchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4P192MB3105:EE_|AM9P192MB0949:EE_
x-ms-office365-filtering-correlation-id: 9874a301-a427-4dec-0ece-08de1dd2e900
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VjNaTEw1OUJTTGc1bFlma005aEtPS1JoWjJKYWRRaHpMYldaSHUrR2t0NElm?=
 =?utf-8?B?YU9SVGdsSkZwV2IyU1cwOC9VVU9iZnZkUHRHY0paMGJXVk5ERWpTZ1E4VWhE?=
 =?utf-8?B?ZzFPcG12ZkJsWjl2aHdjbElyMktzaUwxWWsrNk5lM1F6K3czZTF6aERuZi9u?=
 =?utf-8?B?NEFpZVlUL25lR3Vya3hhU205ZkhvdG0vN2JuekwwTDdkbzJpbmpEYklkNUNw?=
 =?utf-8?B?cld4aTRCcVN5UUE4VU92OVZYWUdDeXg4cmZlaHRVRXYxeTgzalQ4b29BRTZp?=
 =?utf-8?B?N284STR6bzRpdjVUWGU4c0wva2xnVlR2VDhRZmpxS0Fib2trYW1NdEU1YXFJ?=
 =?utf-8?B?Q1g3ejllcU5Bb3RQejQxQUdPMjFVVE8yelFZL1ZtcWJYRzcvQnAvMG01QWl3?=
 =?utf-8?B?aVdzZFR6V3pKdkd4bFJ6SzdYWGRiMXU0QUM3NFQzYkI0ajlWbTFnYTFTb1lE?=
 =?utf-8?B?aUNTYjNCYkJZTmFGSGk5WCtBMjVtWWpHT0lzci9NL1NxRDJaMWU2VXFsTmth?=
 =?utf-8?B?aGhpWllDSUUwSjVQK0J2ZFhUSmFJV0NoblREOWJXZUp1ODNuZnBub2lVaUtI?=
 =?utf-8?B?anNKQmt5ZU1CM29udk9tY2FJeEVicmZpU2ZqT1BVZHZlaXpGUmUzQ2podzQ5?=
 =?utf-8?B?bWN6Rll3MlEwdE41b3oyNVlPeU5GeWY0OUQzb3RZQ3RmKzdXRXd4N016MWkz?=
 =?utf-8?B?N3c5dmJrNUQ5NC9KUUE2c002UzZhMkIvc1ZPVCt2Y3Rhc1dYVUtZMUVVdVFM?=
 =?utf-8?B?NlF1V1o1TmtNQ3lJN3pWRGNnR2UvTEhjWHhIY2VacUdWUjJKTVJPSWNGOGFi?=
 =?utf-8?B?TTJZYnIvTW9rNVBVVFhlQ0hqeWFnbk0yejk1QXN6YW02Z0dHQk1uZmRzeWh5?=
 =?utf-8?B?b3VuUUNzYStkUktxTFBVdWpCRzVMVzFpVlBvMndaQjNsUU1VYU5rNit2bTVs?=
 =?utf-8?B?TGY3d3BuQWkzb0xFNjQ1bCszY2x1MUVBU1FTM1h0RVBXNWNJcDBKc2VVLzZj?=
 =?utf-8?B?eEVyRXFBZ3pWZ3B2Y3grNndJa1R1MlE5ekd2KyswTHVWUDdSS1VLRUljVUxo?=
 =?utf-8?B?eEtTa3BpMEJ2NUVGQ3FkdUkrdmdtVS9mZE4xVk5naFNPY1gyRGczVlBGRTNK?=
 =?utf-8?B?TFZ5UXRDeUtjT2VUb0x6aWloVzBMSk1rb2lHeHdLWVUzWHoxMERWNzBrTUlB?=
 =?utf-8?B?TGJzUHhSbEZxTTBxWDV6b3VyRm5aNzQ4R2Y0ZTVjQjExR1JDanVvcDE5OHBy?=
 =?utf-8?B?NVJNV0xud3B5VUdpN1JId2tNWEUzQTd2cGovWm5KK3kxNmlJVStaWWhoZWY1?=
 =?utf-8?B?Q2hKYk5KU0hxZ01PWU05MlFZcFRSS0pVeWIvOTJVRVlBTWUxbmJZMXc4T1pZ?=
 =?utf-8?B?WG1waUJKenlUMnFqNERGRUljek1la2M2UmZZclV3VFFxdVZTU2I4NFVqeVVQ?=
 =?utf-8?B?Q1VFaHNpaHg5Y1NKQzJCVndiWEpwY0NncUdwd3pLWUxENFBBR2syaDVYazhX?=
 =?utf-8?B?SHB5V2lwVjdGaTFScU4rYURrODZNUCtiV01tUUcyYVk5U3RjbDIrM0R1b3dy?=
 =?utf-8?B?U3dLaEVuUWlPRWkxSXlwckZvenNhWEU1dUVQYVRLc2hsUllpWEtsNVdKMXE2?=
 =?utf-8?B?czVobEFBVm5OemF3REJuTHB3cmVmdjBKSGJLemdOU1QxTkhDQlhKRHFuajB6?=
 =?utf-8?B?T0VXTWNBQlJPQW1NNVJRVjFnU2F1TGtORmRMK2JCcXhQdVV1b2t0NW9DdDBG?=
 =?utf-8?B?ZWJEL2xwenNXbnhicDNVMEJ6NGNVa1kzMkgxSDFWZEk5QjAzOXVrOTVPMnM0?=
 =?utf-8?B?bzFEQjFaVzJMaUo5Tk04WE1QQUtkendoM2FyTEtpN0pGdlE5WUYwYW1sOGRj?=
 =?utf-8?B?YjFhSk13TlpseGZXRnVCRWxqbWx5dll4bC9EbHZUdHU4czBZNElUWTkxaTJJ?=
 =?utf-8?B?NjdDZ0JBM1FwZ2xyOHNqZWROaHZPeFl3TFJkMS9pUmM5NnY3K0NFYkJsYWdC?=
 =?utf-8?B?bzlwUGFRMWhrWlJTdE9jYzlaRUhpc0lscklnekNzUWFxbWZFL255NytTUmpx?=
 =?utf-8?Q?VIxYXk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4P192MB3105.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2lKbHlwdEFXUUtpMkEzTFY0b3NQU3F5cFB0Y3hKdlJLSThIcDlmamJaMU1p?=
 =?utf-8?B?cWU1VGRXdkVCNnJxQ2FhbnpocWtpbU4zWktuSUtmbWE2dkJoZE52aDk2SFBp?=
 =?utf-8?B?WkhWOFduSXdBaE5rR3d3Ukc3YnYyNkJ1ZHY5UjNGenVuUENqeEMySjc4dU5P?=
 =?utf-8?B?Vkk5N1c4amlqQ010R01YQWpYNUZNMytiNDZFeFhuSUxIN2pmK0xjUUJ3SXp1?=
 =?utf-8?B?UXRnSnMzY21XaDJ0dk1uUUpsaXNhcTltcjVMamdjNi9jaGQ0UFRUUEVpZ2tr?=
 =?utf-8?B?cXdxeWdZeFdLbXRINk9IME1PWGoxdERXNmJBOUhSZWUwTzNaamlhSjIvTHZo?=
 =?utf-8?B?c04rcUtJSkNkbTlLbTZzc1NWbWpRN29kWGJ1alhmTys2aExaVVhDRWRlODNu?=
 =?utf-8?B?dnQ0Y0E1dlEvY01Jd0tIU0FoMzVleUF5aFNlWEI0aysraDRGUEw4c1dCY3Z2?=
 =?utf-8?B?Z05lSDdyMytuN1Nzb1hlRm9MZjhkZ3JiVjhGRElPUG96UEpvT0VpWmVXcEli?=
 =?utf-8?B?K21OM2g2Q1g1a1J3NE5IaWladTlzUUQ3QnZaMEpyY0I5dGNMeDVMZ1VGMnRN?=
 =?utf-8?B?c3FqRzFva3dkQmN2TEZCaUN4WEFtS1l5d1c0QkZJWUFtNUJESWZ2dk5mYm95?=
 =?utf-8?B?eUtmbVhFTjhOaUhVeXJwaEFya3pnejhnbFh6R2FrMEE2emk0WUJHSGJPWkF4?=
 =?utf-8?B?Y0o4dm1vNU0rNE9OMFkxSkxwM0l2Z0xSbHJ1dWY0SzV0KzRMTHJJelY3b0FI?=
 =?utf-8?B?VjdYVlpadnZVUjBreFZyeTVHQW9tOGRZT1BkbGZzdFlXMTVjUjFnRmpzeHJG?=
 =?utf-8?B?dmlqZ3NSYWNqQWczeHJOY3ZCeGcvUGNPNjAxaEpRQnBnOUNMNWd4MUZ3OWx2?=
 =?utf-8?B?Qi83VHRaSUxNanl4ZFJHbUFwVXpiSmEzZmNTVENDcXpTQzRJYk1iZFdscDVn?=
 =?utf-8?B?OVVERFVYQ3ljRGhSTFMzQnJwYnBlV2ZtSWQzUDlHZlBRSkJBdENzTzVZNld6?=
 =?utf-8?B?V2FQNmhkUzFpc3gveENLZ0RNN3QyMkR2QkJLNkpGZ3Rob3VuOVE2MlBYVDhJ?=
 =?utf-8?B?bkNZSS9iNkNrZmlEMjVweGo0YnJOcDEva2grVHVLaEZIeUt5MlM1dWNhZjZw?=
 =?utf-8?B?L2VwdHdzUk5BemRWVHZEcXFqcFhROUNCaDFLL1ppbnBhMVYwSzJNaDAvVmo2?=
 =?utf-8?B?bzdCcGNTVHVWdTJ1L1Brak40UGFYc0hNSHp1TjdoRXpzOE8xUGNUZzMyTE9Y?=
 =?utf-8?B?YmtZVkUrYWRhcHRkRWZlUEtacmIwSkozNXg4MUFGT1VhNkMzT2lxUjFQM21M?=
 =?utf-8?B?TkEwNjBxQVFPcjlZR0x3WEx3Wm4vUlZ2blBSNEIrNEdIQ0Fpck44NjI5R2lY?=
 =?utf-8?B?cWtQZms4K2o0WW1XVTk4TzZ4dU5pRWM4c3JTN29rZHFXeTNIb0JNbUdtdkNo?=
 =?utf-8?B?MXRVaGRiSmZtamc4aW80VWpMMWRKbFZXYldwdEI5UDFwYzJhVTVsWWxiU2JH?=
 =?utf-8?B?dS85WjRQbDhmVkxSQmlLT2hnbENDQ2FqZ0FjWlI3cnEvaitpTm5EY3dLYTgz?=
 =?utf-8?B?ZlduSDJJRVVLcnRZa0RIdkQ5bHlJaDR3akhhSlVCTHk0TUFtbFZrd1dyT1Vs?=
 =?utf-8?B?c2tWU0NEaWpBL1FtQXZ2UGFmbGZCWG92NHArUG1GT2JtQnhCSjF3ejRLcEty?=
 =?utf-8?B?V3ZmdWZSMVhwU0M5STdTT3VwcGZuZm9XbEJmRUYyS0Npa2dha3NYUDA0MEMr?=
 =?utf-8?B?SktDR1RXUUJVdnNpdWRFTEJ6QVBpRENQWXg0cXZVcnl0TnorWk5SaG9ZTk1w?=
 =?utf-8?B?MjF3NFNieU1mRzVUWVVyVGR4U3p5NEIrcW4rTzVJaEJlN1FsbW9pMnNUSUt6?=
 =?utf-8?B?UlZHblE3QUhnNjhnem16ZHdYN3FPRHVxMy9zRk9UMkpocTdsYWFuNjJmZnNJ?=
 =?utf-8?B?RERUZkNMQXZmelFPaWtyNlBvc2tyWG04QTFRSlcwRlI4OEJLVjhyQ3l5MDVr?=
 =?utf-8?B?RHRJeC9LSDA5QzJER1A4dkRnMnJFcW5yVHk5NVRNU2p6ckdLVFo4RVhDa0Fi?=
 =?utf-8?B?bjVpUWRZd2p0WjhYMFprZFp4U0RKVW9ENG9TV085aVNoaDBNZmxNK2FaM21Q?=
 =?utf-8?B?Q3RwNlNWVURzbXlKNEdEWTl3WUZVNmRaOVFPYXkwWkNpZlFWMFJxMk5icE9P?=
 =?utf-8?B?WEE9PQ==?=
Content-ID: <FB5C6B7DE0D9F44EB8B9035CB3504B9E@EURP192.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: openchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4P192MB3105.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9874a301-a427-4dec-0ece-08de1dd2e900
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 07:54:42.2452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dfdd4aff-e2c9-4e1a-8642-7f6cc6bbbe6d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjYhK4UmJxCeAJcIv+PtJzHJhzZnvMGooI1Gg8W4zr6U5SRBG2MQo2Wc1vF9So9I/3Oc00MAZi6VvXbni4BIy7mdMwvs2aVZmTtPURuNiwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB0949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_235445_951388_810751FE 
X-CRM114-Status: GOOD (  12.84  )
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
cC5jb20+CgpBZGQgY29kZSBmb3IgdXNpbmcgZ2VuZXJpY19lYXJseV9pbml0LApzbyB0aGUgdWFy
dCBwYXJhbWV0ZXJzIGFyZSBwYXJzZWQgZnJvbSBkdGIuCgpTaWduZWQtb2ZmLWJ5OiBNYW51ZWwg
SGVybsOhbmRleiBNw6luZGV6IDxtYW51ZWwuaGVybmFuZGV6QG9wZW5jaGlwLmNvbT4KLS0tCiBw
bGF0Zm9ybS9nZW5lcmljL29wZW5od2dyb3VwL29wZW5waXRvbi5jIHwgMjUgKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL29wZW5od2dyb3VwL29wZW5waXRv
bi5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91cC9vcGVucGl0b24uYwppbmRleCAzYmU2
NmRlNi4uNjBkNzE5ZTEgMTAwNjQ0Ci0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvb3Blbmh3Z3JvdXAv
b3BlbnBpdG9uLmMKKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9vcGVuaHdncm91cC9vcGVucGl0b24u
YwpAQCAtOCwxNiArOCw4IEBACiAjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfZml4dXAuaD4K
ICNpbmNsdWRlIDxzYmlfdXRpbHMvaXBpL2FjbGludF9tc3dpLmg+CiAjaW5jbHVkZSA8c2JpX3V0
aWxzL2lycWNoaXAvcGxpYy5oPgotI2luY2x1ZGUgPHNiaV91dGlscy9zZXJpYWwvdWFydDgyNTAu
aD4KICNpbmNsdWRlIDxzYmlfdXRpbHMvdGltZXIvYWNsaW50X210aW1lci5oPgogCi0jZGVmaW5l
IE9QRU5QSVRPTl9ERUZBVUxUX1VBUlRfQUREUgkJMHhmZmYwYzJjMDAwVUxMCi0jZGVmaW5lIE9Q
RU5QSVRPTl9ERUZBVUxUX1VBUlRfRlJFUQkJNjAwMDAwMDAKLSNkZWZpbmUgT1BFTlBJVE9OX0RF
RkFVTFRfVUFSVF9CQVVEUkFURQkJMTE1MjAwCi0jZGVmaW5lIE9QRU5QSVRPTl9ERUZBVUxUX1VB
UlRfUkVHX1NISUZUCTAKLSNkZWZpbmUgT1BFTlBJVE9OX0RFRkFVTFRfVUFSVF9SRUdfV0lEVEgJ
MQotI2RlZmluZSBPUEVOUElUT05fREVGQVVMVF9VQVJUX1JFR19PRkZTRVQJMAotI2RlZmluZSBP
UEVOUElUT05fREVGQVVMVF9VQVJUX0NBUFMJCTAKICNkZWZpbmUgT1BFTlBJVE9OX0RFRkFVTFRf
UExJQ19BRERSCQkweGZmZjExMDAwMDBVTEwKICNkZWZpbmUgT1BFTlBJVE9OX0RFRkFVTFRfUExJ
Q19TSVpFCQkoMHgyMDAwMDAgKyBcCiAJCQkJKE9QRU5QSVRPTl9ERUZBVUxUX0hBUlRfQ09VTlQg
KiAweDEwMDApKQpAQCAtMzAsMTEgKzIyLDYgQEAKICNkZWZpbmUgT1BFTlBJVE9OX0RFRkFVTFRf
QUNMSU5UX01USU1FUl9BRERSCVwKIAkJKE9QRU5QSVRPTl9ERUZBVUxUX0NMSU5UX0FERFIgKyBD
TElOVF9NVElNRVJfT0ZGU0VUKQogCi1zdGF0aWMgc3RydWN0IHBsYXRmb3JtX3VhcnRfZGF0YSB1
YXJ0ID0gewotCSh1bnNpZ25lZCBsb25nKU9QRU5QSVRPTl9ERUZBVUxUX1VBUlRfQUREUiwKLQlP
UEVOUElUT05fREVGQVVMVF9VQVJUX0ZSRVEsCi0JT1BFTlBJVE9OX0RFRkFVTFRfVUFSVF9CQVVE
UkFURSwKLX07CiBzdGF0aWMgc3RydWN0IHBsaWNfZGF0YSBwbGljID0gewogCS5hZGRyID0gKHVu
c2lnbmVkIGxvbmcpT1BFTlBJVE9OX0RFRkFVTFRfUExJQ19BRERSLAogCS5zaXplID0gT1BFTlBJ
VE9OX0RFRkFVTFRfUExJQ19TSVpFLApAQCAtNzMsNyArNjAsNiBAQCBzdGF0aWMgc3RydWN0IGFj
bGludF9tdGltZXJfZGF0YSBtdGltZXIgPSB7CiBzdGF0aWMgaW50IG9wZW5waXRvbl9lYXJseV9p
bml0KGJvb2wgY29sZF9ib290KQogewogCWNvbnN0IHZvaWQgKmZkdDsKLQlzdHJ1Y3QgcGxhdGZv
cm1fdWFydF9kYXRhIHVhcnRfZGF0YSA9IHsgMCB9OwogCXN0cnVjdCBwbGljX2RhdGEgcGxpY19k
YXRhID0gcGxpYzsKIAl1bnNpZ25lZCBsb25nIGFjbGludF9mcmVxOwogCXVpbnQ2NF90IGNsaW50
X2FkZHI7CkBAIC04Myw5ICs2OSw5IEBAIHN0YXRpYyBpbnQgb3BlbnBpdG9uX2Vhcmx5X2luaXQo
Ym9vbCBjb2xkX2Jvb3QpCiAJCXJldHVybiAwOwogCWZkdCA9IGZkdF9nZXRfYWRkcmVzcygpOwog
Ci0JcmMgPSBmZHRfcGFyc2VfdWFydDgyNTAoZmR0LCAmdWFydF9kYXRhLCAibnMxNjU1MCIpOwot
CWlmICghcmMpCi0JCXVhcnQgPSB1YXJ0X2RhdGE7CisJcmMgPSBnZW5lcmljX2Vhcmx5X2luaXQo
Y29sZF9ib290KTsKKwlpZiAocmMpCisJCXJldHVybiByYzsKIAogCXJjID0gZmR0X3BhcnNlX3Bs
aWMoZmR0LCAmcGxpY19kYXRhLCAicmlzY3YscGxpYzAiKTsKIAlpZiAoIXJjKQpAQCAtMTA0LDEx
ICs5MCw2IEBAIHN0YXRpYyBpbnQgb3BlbnBpdG9uX2Vhcmx5X2luaXQoYm9vbCBjb2xkX2Jvb3Qp
CiAJCQkJICAgIEFDTElOVF9ERUZBVUxUX01USU1FQ01QX09GRlNFVDsKIAl9CiAKLQlyYyA9IHVh
cnQ4MjUwX2luaXQodWFydC5hZGRyLCB1YXJ0LmZyZXEsIHVhcnQuYmF1ZCwKLQkJCSAgIE9QRU5Q
SVRPTl9ERUZBVUxUX1VBUlRfUkVHX1NISUZULAotCQkJICAgT1BFTlBJVE9OX0RFRkFVTFRfVUFS
VF9SRUdfV0lEVEgsCi0JCQkgICBPUEVOUElUT05fREVGQVVMVF9VQVJUX1JFR19PRkZTRVQsCi0J
CQkgICBPUEVOUElUT05fREVGQVVMVF9VQVJUX0NBUFMpOwogCWlmIChyYykKIAkJcmV0dXJuIHJj
OwogCi0tIAoyLjM0LjEKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
