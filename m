Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD20EC71136
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTNYJUIjYfxGWOQAaA5Fl0kbvu82M3Azi1C8RWc39KE=; b=XJrMg/tt2+/i8q
	UMrhOf+RLEsnIywWOfDsC6HM03jEW1Sdo5WAk40jnxwVh0SvaBz2PBB+jZJMXuh03onkHUNvb/bCB
	W/T0/oalk8zJBH1bOj98GU730hw60KaugcRNf13Q4AqBs/okyZ4LM7c+jMPjCy4O/MkkZgL2kaYf0
	qxknQdtt4+07bpiXzie+ZnPJLWZz+CIpR5KeY/mP41gNEMT0lvme2DOiYu6+xvFe6Vz1ZY09aKlmW
	iCI45guoJSNuVdTVpxfD8CR24JY5/hWm31qMxRI2ZRrTc2b6mDiZIMKrEBGgh1G3wG9UodNfd6hiR
	VKeYhfwTTjXiECDqafQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREa8-00000005DoL-24bZ;
	Mon, 16 Jun 2025 18:29:20 +0000
Received: from mail-dm6nam12on2070e.outbound.protection.outlook.com ([2a01:111:f403:2417::70e] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCWg-00000004ynu-1Bqc
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 16:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umnUFcua2XsKyQ4jaTPxtckxkdXnu+tfAYJCtHFUOJO+ijOEtC2BQEu81BsA4xeqBY67OkMUXWcQfr4QLHwXWTSYo0Ee/1IP9zvZa7scKI9PDxaAHzUmMM5nDrF6IGJFDUsq1cv0eAFd8+HhgCOHIKw0Wwjufy0mxqc8Ensxcb5F21i7DgdzOAub/vhbVOldF+Ja80WJAmIwkAMwGv/jFja1PqDJBAfZVRAgXToJWgNiYg/npG0vy0tRbvOCFL0cjtbaoFwkwEmgxCqZurfe8OTheEDr7JRotMC8wNwtcnzcJKfmoE7u2OL54IPgVjVFJKcgfuiZoGR2GxlC6HmU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F51Yn99dbhPLk6tawaDVxv38/mqpRGqHesIT61BYfM=;
 b=RdDseYMjNE6bfXJDgJYe18qAznxdnqLQOFdpXeGz3ZuOyGlntfwh7IGTf/pUaZduZM9YECmp3ip1L4Xf91TxsNpm2qQnCh9JGO6n8mO+26A9sdNwFd4LeTJAQfgy/X9ZYc4lIxDhqae2808SlRxwKJAqqitAXOtTks2kAQwiFSrFDXC0eTuCPYSsBRUuby7M/3XSXRVk5VVrz1k9ZpcvKBcVbf8TPdeljDwoOTc3xzgNkaiDFOhq+xDFEPYcgyU/u1OEPkpQQE7LZLI+2+UzLGBnisMeaoIzyAud6GFeU0PkGVq38nSSm1F/sgjQidbgfhkcDiZkifPX++9ng2k3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mips.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mips.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F51Yn99dbhPLk6tawaDVxv38/mqpRGqHesIT61BYfM=;
 b=GFntEV/hFmDonoeAHJmK46uzaDJC5HjATpV+uw5GivzBKQDhF7iVDfC/JdT58rFdoKjPMEepFLVGyzyCIxxzhCBQwzJFkoIukM9au9JPw8+PynYru5JLTsZ7OayccBIPulLQVlgsmVqxo4BiAO/j6nRbnaSa+WJ1wKkR4sQGkCA/WUWiXvgtkL/Wa7IjAwReaG2TMxAg0DZj8u866EIT/TwU7/D1KAx4N1WRwM86f6npzvFZaIg+aHwZfk0rsYPdQVuvIXH92MkpNpj4LDHjomLVazLj7XGg7/KgMi9L08wVB3MIU5GXzgmSjvPxey23c95R9HECSTt90vFPBfLVLA==
Received: from SJ0PR22MB2720.namprd22.prod.outlook.com (2603:10b6:a03:326::22)
 by BL4PR22MB6049.namprd22.prod.outlook.com (2603:10b6:208:5a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 16:17:30 +0000
Received: from SJ0PR22MB2720.namprd22.prod.outlook.com
 ([fe80::4f5d:eb00:9de:5315]) by SJ0PR22MB2720.namprd22.prod.outlook.com
 ([fe80::4f5d:eb00:9de:5315%3]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:17:30 +0000
From: Chao-ying Fu <cfu@mips.com>
To: Anup Patel <anup@brainfault.org>
CC: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Anup Patel
	<apatel@ventanamicro.com>
Subject: Re: [EXTERNAL]Re: [PATCH] lib: sbi_platform: Add platform specific
 pmp_set() and pmp_disable()
Thread-Topic: [EXTERNAL]Re: [PATCH] lib: sbi_platform: Add platform specific
 pmp_set() and pmp_disable()
Thread-Index: AQHb3rOVQdTCKiT0xUiLTRbTGY+EzLQF9RXW
Date: Mon, 16 Jun 2025 16:17:30 +0000
Message-ID: <SJ0PR22MB27206BD79B2E8CA385C96125C270A@SJ0PR22MB2720.namprd22.prod.outlook.com>
References: <20250614172756.153902-1-apatel@ventanamicro.com>
 <CAAhSdy3axiPX99WS+EbkNk-EQU8r4=NYi98Toe=ucutFieWu4Q@mail.gmail.com>
In-Reply-To: <CAAhSdy3axiPX99WS+EbkNk-EQU8r4=NYi98Toe=ucutFieWu4Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR22MB2720:EE_|BL4PR22MB6049:EE_
x-ms-office365-filtering-correlation-id: 70ea2f66-c10e-473d-fff7-08ddacf14b35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z2tHMXNqWEZrU3lDOXU1T0ZVUUlvREpvOTFqdVB3YXQ4bjVUa2F5Y2huL1li?=
 =?utf-8?B?d2V3c2pEUXZHdU5uU2lkRnA2YTNveFlvK09SZnZNUkxiZlZpOWd4RDhsQlJq?=
 =?utf-8?B?cEpNZm9aNUdScmxUdEFId1grdERVQ2hMME5kMzBrVkE5QXZPY0ZVajRhOVFo?=
 =?utf-8?B?SHZ4bW1JYnp1djBhdlUyVFlaVUZoNWRiZEFTcG9NOW1TYXBHMEQyemsydm5r?=
 =?utf-8?B?REFINHZiNTA4bmFIL1lMUGVLL1ZvRnRvcWZtYVVTbTIwTGR1NHMzcFhQWGZs?=
 =?utf-8?B?Y085Y3V6YldTVEVPcEdSbmhlQ1F0dkhiMHVLQWxKa0Rra0J1RWk3cnNUeUpW?=
 =?utf-8?B?WVFBeGkxNWhzdFl6V0pITlRjQ05zMWpmV0hqaThQUU5CUlJrL2Q1dThiazNO?=
 =?utf-8?B?amtVYjFVYlhqRE95R200RVhHdm8wZkk2YndRdWVYa3BWVU04MDN1NUhWbWMx?=
 =?utf-8?B?bVBSd01LUEczVjhHV3l3QlUzbWYyWU9vNGdlQWRnRTczc3FLL0JIRXlPNEV6?=
 =?utf-8?B?ekNZd1l1YzZjQkZRbUhDcGxid1V6ejBid3Z6NkEzZ1NvWlVDWHdweE1GaG9S?=
 =?utf-8?B?SXpNR1hiWHE3M2VIa2hveVNLVFo1RnpVNzFLeGJBNTJIbjdEYjZmMzZyTmE4?=
 =?utf-8?B?emV0QzJGTTZSZGEzNzhMV3d6K3VxNjhhd3czTG5sM2FodVd1bVR5dXJPQ2tj?=
 =?utf-8?B?eHBITnpLdDJXbmNrbGlxdlB3MFl4N2tZa2tNeDNvRFNObGtYcmJoa2Ezc0NQ?=
 =?utf-8?B?bnlPSXhzS2wrZmh1U211NkpxcjFWdU56dlI2aFZqZkxNMEZpZDB4NjhaSDIx?=
 =?utf-8?B?NnVaMDB5V0ovZW1GY1QzTmZ0eFpJZGV0SEVHY3N3U05oQW9ZRlpIeXZTd3Bq?=
 =?utf-8?B?Nzd5emQ2d2dDbmVrNk9DclRVdW1FSFprU0RMMWY5RHc3dDRjTEhjNWxnRGVR?=
 =?utf-8?B?SU1yRTBjV2R6d2djQkhRM2U2NTdlMXpoakNmc29vY3VWNVQ1bE9YblN0bi9u?=
 =?utf-8?B?Yng0NXBCOW5IcE84TVErWm9SbGV3ajJNNFl4dHVubVgwT0lmeERxRHNEQmNR?=
 =?utf-8?B?WjhqRnY1OUU4SUt6QzllcUFNTy8xZnpncVdsdjFyakVSU01sMXRDampweHdv?=
 =?utf-8?B?SFBTNjlOaHBxUDEyRm1iWHlCY25kck1pU21lSkhDVk5nZStHZVRSRDNFN0hn?=
 =?utf-8?B?SU1zVDVkdTVVSlRHR1VHdGcyT243bUdwNHAvYlVXSWVKUk1yZXQ3ZHhIeDd0?=
 =?utf-8?B?UUh1L3NpMUg5NDhEMERKeGJYZFFkTHpLcU4zNkxRaHVia1dHbzVSNXpGWE5Q?=
 =?utf-8?B?NnpNWWJBNVN2dW1rN3ZhVmxMSnloVUV1M3JqNm9kSnBYZU5DZjQzbHlodmtM?=
 =?utf-8?B?M3ZxYm5WclIzWjlLa3JIQWh3UzM2Sk01UjJrQmNUSlZBeFVveFRibGFjOFVF?=
 =?utf-8?B?M1BZbU1nWHhQd0NjRXlTWkpodS9WYUd1MlBCOUNod2FSakFGZTh2QnpQOC9q?=
 =?utf-8?B?QlQ2YVZyRjgzWlV1RjJpQ1ZIUGJKc0laSDUrODluVm1iQWp4UHYwdyt5VnFq?=
 =?utf-8?B?Tm9nNmlFQnBJeDNTeWJEaG1RZnVmSjZWT0d4dStLU2IrNExZS1dBajlUTm1L?=
 =?utf-8?B?dHU0bitEdmkzQTJKWXMwZ3FjTDdUSUJCZFR3RXRZY1ZXSE1MUlR0eTd6TkN2?=
 =?utf-8?B?bHE1ZE1pVGJuZ3F5VFZ6VmUxZHk3REtBbGYrZmZUSTUxbTdMRjYrVkFxNFZE?=
 =?utf-8?B?OEcrK0VNYmM5eXBRVEF5SzI4N2pXZzFsUXprSVJwRTJQSUlaTkN4eFpUank1?=
 =?utf-8?B?NEg3WjQ4OWxEQm1SRTVLN0k1MWYyT3Q5Tml3eVU4dXc2emdQUlVUSERIenFB?=
 =?utf-8?B?UmlRa3pZNGR5eFQwcTNlTTNXU0w5VHFvRml5OHUzNElTZDBuUloyQmJiVDlD?=
 =?utf-8?B?Z01pTGhlbHp4MU1tQTdkUFZjd3JwUmlhN1I1L1FWdVZ3UHdpakpZU0h0aXVn?=
 =?utf-8?B?N2psVG5KOVJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR22MB2720.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlVmZGxhOXhGZnFzNE9HVElFaWpha3dHVFVhWDE0YzE0K2dnVVpwaTdjRmtD?=
 =?utf-8?B?NS9sVnJtajVkUkJkTWpPbXYyVURCMlNsVExJaFFKcmkxc0l6bXRxOVdraGEy?=
 =?utf-8?B?bVFUN2xNTWNNc1JIb29WOGFRQWdXNUNnK2pOOW9SU0UyUGdYNTlmNEFmRHdG?=
 =?utf-8?B?cENuS0UzMjRkdU1nWFU4S1RJVkV0ZSs1R2dic2p0WU43VkVzNjVsbWlibnVM?=
 =?utf-8?B?VVArVGc4ZTA2dkFPZkw0QjJ3a20xWXg4QjJ2QXlqSSt6NGlMTnlPeTNEQ21N?=
 =?utf-8?B?VXoySjlZQ05jdk1CbGdHc2pXZlF6R01MV0tJVjRJbDFVaVlXcGR2N2R3SzhD?=
 =?utf-8?B?dm00VmJuOUVDUFlNdHJvOWpjNmtycFBWTVU1aUVRa2t3K2c1eWhHblZDMlJx?=
 =?utf-8?B?SmVUTHRjS0czWWdsYlZLaVpNYUtaQmpKOW45V1RxRHBLdk80bzR0a0EzVUZQ?=
 =?utf-8?B?QmdoQ2hLNXRSaURhVGJQMzdQQkpDT3NYRmVlYWdiZ2g5dWVIelV1K2FQN3E1?=
 =?utf-8?B?Q2FYUHdtTjgwU1NLdFg4RlNWaXFRQjdmdkxjb3dGM0c2SW9iOTArV0tzYi9x?=
 =?utf-8?B?OEtJTktaeUw1RUxGT3EwRWVVMXhyaFN3WGRCek9vY1hFWUJlbHFkenlCVURj?=
 =?utf-8?B?OUxVM0EvMEh4M0JkUStBaDVqaUtzTnpjWU40SmFJcEpONVRDWUw3MzVsOEI1?=
 =?utf-8?B?UjJBUE1teHFqRGVpMXJGanVYclhtbGhVbnpOS2FIUWoyQ2U4elJraHZSdjB4?=
 =?utf-8?B?Mk5RZGh2VEdzL1RTdnVUWTd5ZWhOWTF1cndEWFE0dXlXS0E0SUpQVTNhS1Vx?=
 =?utf-8?B?L1ZVQzFQTVpiV2ZGL2s3UDRWZG9aQlJQOVUxTktmN1VZaVNOeUl4V0Rtc0pw?=
 =?utf-8?B?MytPREF0WitBczUxTFloRURrZGhqWUlEcjR1dXlhajRSbDZBM1hiQWtFdmRh?=
 =?utf-8?B?WjdFUnVrQyttbVBQNGZiYWpvTFpRb3VVT2JnYkZSdDJUY0xtSU5mN0pzOUR5?=
 =?utf-8?B?cHdSNTQvN09Bb2lpbXI0STlsdUtmdTl2S1FpM3c3UWMweDczQUZjNGlOTzBF?=
 =?utf-8?B?V2tPV0JVVk9EUWY0QmRjNjkwYXRGWVFLL0FDVFFRMlFTQWFPVlVrQ3lGUTJx?=
 =?utf-8?B?NUZ3TDE3cThoUW53SVErTnR4ZFUvcXhnbTB2WGlpTklWeGVZQjJPaWJPbmJl?=
 =?utf-8?B?SjFJSVZIaU9qckovMGlVMEFWS0drcXlreGh5Umt4WXQ1ZTYzTmhNNEFVTmw2?=
 =?utf-8?B?UTZySER4cjY5NTlvNzhwNlJwbHU3c3FaUWVuYVJDUTRQU3ZTK0xXQlVXTVlk?=
 =?utf-8?B?blpBUVBscVU4c3huYmltL2hUbUZPdEhUVWNYbzlsN0hmYXB1WmJCTGJnaDIx?=
 =?utf-8?B?d3Vac2RKbSswRG4wM2tncTh0bDhoMnd0YW9qV1NyUE9tWDJBRS8rVnNaSzQ0?=
 =?utf-8?B?NnhlL1J5bTFIWEJHUndNdFo4MWFlWDBRTHJiVG9mL3ZjT0FLNXl5RThoYWRa?=
 =?utf-8?B?Nzk0KzVPSEJNR2xOb2ZBMnJGTGx6dzljbkVYTWo2TTdheFIvakMvVllyTkRT?=
 =?utf-8?B?cG00SzN1Yncrdi9LNjMrZ0JrMDRWaVQvRlJEbjlJVGlpR28vUFBLbGc2MHA0?=
 =?utf-8?B?TDdFMktxVVVYaDZMcWNKT3BiRjJsUmlOWmdQUlJTWWNPMzQzVXhvc0ZGWi9v?=
 =?utf-8?B?MW56aUZCQkpPQTZRRjNrcW9DYVJhSkFzVUxaM0J0cjFweEtheEVDcmxlbDY0?=
 =?utf-8?B?S21hdmxsR0c0NllTcUhjcGQvS3dXejB1Unl0L3F5RVdlNkQzaXVyOStveitu?=
 =?utf-8?B?VHpER0hlREhxLzA5bkp3ZU43NnJIRFduRWNRQzFvWTdNWWVMamlKNFo5SWtO?=
 =?utf-8?B?Mk9BaXFzSjhNa29tbi9iOFdxQTVZNkVEWDBtTFR5TGd0MkVkMDVTNHE5dDlC?=
 =?utf-8?B?TCs5S0hIbkpuSFVtZnpiam1sdE1lVTU0a3VTUC91T2VZNHExWFRxaWI4QXAv?=
 =?utf-8?B?bjQyZVUzTGE5bnhKVGhoNDRUWDVUWHVOT2JiSVVMRWpxdU1pay9Yc1VmcVpE?=
 =?utf-8?B?Q1R1eFZHY0J1TCtTdzF5Q3crWFJrdktSbGJKeXZ4enVQN3A0SFhOOTI2cWlu?=
 =?utf-8?Q?DN2Q=3D?=
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR22MB2720.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ea2f66-c10e-473d-fff7-08ddacf14b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 16:17:30.5067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5bWdkgkuHwmZAedAO9+3HVr78wmmN7eMAqDgA+d7clqbAq34o3rwM/PicgEjeHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR22MB6049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_091738_332699_84623705 
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

SGkgQW51cCwKCj4gSGkgQ2hhby15aW5nIEZ1LAoKCj4gT24gU2F0LCBKdW4gMTQsIDIwMjUgYXQg
MTA6NTjigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gRnJvbTogQ2hhby15aW5nIEZ1IDxjZnVAd2F2ZWNvbXAuY29tPgo+ID4KPiA+IEFsbG93
IHBsYXRmb3JtcyB0byBpbXBsZW1lbnQgcGxhdGZvcm0gc3BlY2lmaWMgUE1QIHNldHVwIGFuZAo+
ID4gUE1QIGRpc2FibGUgZnVuY3Rpb25zIHdoaWNoIGFyZSBjYWxsZWQgYmVmb3JlIGFjdHVhbCBQ
TVAgQ1NScwo+ID4gYXJlIGNvbmZpZ3VyZWQuCj4gPgo+ID4gQWxzbywgaW1wbGVtZW50IHBtcF9z
ZXQoKSBhbmQgcG1wX2Rpc2FibGUoKSBmb3IgTUlQUyBQODcwMC4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaGFvLXlpbmcgRnUgPGNmdUBtaXBzLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgoKPiBQbGVhc2UgdHJ5IHRoaXMgcGF0Y2gg
YXQgeW91ciBlbmQgb24gdG9wIG9mIHRoZSBsYXRlc3QgT3BlblNCSQo+IGFuZCBzZWUgaWYgdGhp
cyBoZWxwcyBvbiBNSVBTIFA4NzAwLgoKPiBSZWdhcmRzLAo+IEFudXAKCiAgWWVzLCB0aGlzIHBh
dGNoIHdvcmtzIGZ1bmN0aW9uYWxseSB0aGUgc2FtZSBhcyB3aGF0IHRoZSBvbGQgdmVyc2lvbiBk
b2VzIG9uIEZQR0EgYW5kIFFFTVUuCk5vdGU6IEkgYWRkZWQgdHdvIG1vcmUgcGF0Y2hlcyBmcm9t
IFZsYWRpbWlyIHRvIGRlYWwgd2l0aCBNTUlPIHJlZ2lvbnMgb24gdG9wIG9mIHRoaXMgcGF0Y2gu
CgogIFRoYW5rcyBhIGxvdCEKClJlZ2FyZHMsCkNoYW8teWluZwotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
