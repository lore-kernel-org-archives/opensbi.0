Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D0BCCF9F8
	for <opensbi@archiver.kernel.org>; Fri,  7 Nov 2025 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPSheUBhuNNuZtPI4fjpuKy85c7eOOFELvo+Cbm6WGo=; b=RGevfiEiQqUvq6
	DoRNNFqIMTwCqul4GSSZ64KTGV9VFN4U3nlYSs+RzAaEIrQ527THQv9ZS5vfjG4cBwIz906RSVprF
	mk4J/DMoqVxi8q+WYaYkPvrJUpT0BKExCjpqDDqHTHj8ABo+SF35rdSX3+8MJBIbDhuYQoqKvT2eq
	gkDVEkRBDtZXSpKR81zhF/r+3Yo01qP1vVBihgGHK/3EaCzhsJNxvyVhZfIIpJw1X7p/InAxSiXal
	iBTH041wKbHMsjz+H80oBSX7ri/6vYpW1DMJGQvHky+qdbxZLNKRO6GaORwsitNKlR9dxdBpniK4k
	7fTKNNVuGBmrOK4Sq1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHor-0000000Gs5q-2rzG;
	Fri, 07 Nov 2025 08:27:41 +0000
Received: from [2406:e500:4420:2::717] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHoo-0000000Gs58-0CmF
	for opensbi@lists.infradead.org;
	Fri, 07 Nov 2025 08:27:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD/ldDY+2P/wyS4iBxvDlEwf8TZoBAACAOCnb/nf0j3CV7y5VJfbLwxd74ezKvC2Lz+kXCWdrchBThEH5+XKZydhikrchvLtun9nxCypU+eEhGiQ8rAafolwDXaOzfp/9CRk1RAn7guYGbGduyioFHtvcVFsTkU8P/JBV+BVBwrrBwOpf4c0E5eqg4HSsRM2rav3vZEVCnMVUY2qGHLpuMvtgwNwbkAlij9ubc6AF+djhYThAcPtrC1zd+mD37CvjUP/RDT4Wleg4zhPrh4aTi8yFQjQuNcmQBQBGHvFZmi5pNznefwI8OENoxMkoLJXvI4R81cofyt0Yj5Yiy31OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+bpZvbVuv7jl2vA75pbDcL5tgWnHpJZjLVFE4rRVlc=;
 b=GhEDg7X0lDDhMK3RkWluGSdFHeJRIUNMPqg0SoZ2mqMGDBCymYBWNVM1mYsN3RhedCgvkJUrOCDAxcwBET96totFTf6WgNEocmNX8JBu2U+p4A7RJ7G3ooh5KSBCdjUUUkohPUbXxWj3qvqGYmOtmvTxpT2J8WY2DEGpqFXZGhvsD3ayxCaYBHQ91/G5PySWyEPXx+txIh7InBtZe6ZfDCG3uX0TPTjBzdPWfNNc7pP1b2G2MSnLzXDoNeX8PGiTrZg2KuGzTV5KZOEFfnCnSX5wkhN7OkSpRgVjgWG8hWMq4Pky6iFjI0HsJGQesJC9F5OzFSSNvOxpLP0ZV6Hq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0570.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.19; Fri, 7 Nov
 2025 08:27:17 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 08:27:17 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Rahul Pathak <rahul@summations.net>
CC: "atishp@atishpatra.org" <atishp@atishpatra.org>,
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"rpathak@ventanamicro.com" <rpathak@ventanamicro.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH 0/3] Add RPMI/MPXY voltage, device power and performance
 service
Thread-Topic: [PATCH 0/3] Add RPMI/MPXY voltage, device power and performance
 service
Thread-Index: AQHcPFaHMfMJvuBa5E2gp9N/aMU1YrTE5/6AgCIeJtA=
Date: Fri, 7 Nov 2025 08:27:16 +0000
Message-ID: <SH0PR01MB08416C3E0FDA2F2F95595A2FF9C32@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
 <CABdD5x=svn8jtFMpoR1w=xQfc=C_jYmHU=KZmPioWBjaeOXirA@mail.gmail.com>
In-Reply-To: <CABdD5x=svn8jtFMpoR1w=xQfc=C_jYmHU=KZmPioWBjaeOXirA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0570:EE_
x-ms-office365-filtering-correlation-id: 65639b7c-870c-455f-4f4c-08de1dd77616
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|41320700013|10070799003|366016|38070700021;
x-microsoft-antispam-message-info: eQ6jmDIxpe1vuMCnhsXblZoa+lhh1WQ5j8hVBSFxBb/qG3VkbaK29Dg6e49pjA4mltzciPBVk2PrllzIIivGV/XQn2t4z6zjcTfESc1m6FctTq+Xd1b87AstWHQ+ne0qz2ej3k8Epzlj+d5aI5u5+8h7sTyZPYy2YxkYVSII1edOdlBbrl+2WoMSRPG0ubzKjkYd4jedrydQPWbjg701WTdWKGJx6/8UZHEvAJpdgnf0DOfBkZjLNRCtDnur0dwpTxbz+0aR2DlvbUSaOw1+Dpl3KXTmckzQTLYsX7CW4BmBIwiStNnr6c0uioWe6X83hI5eM6s56yLSh2qmg1CyArYCCRStPl9WZYeNUxWCsaPzBM4RkxepDhRwgY/xUgPuUTSSgSh74+LUMbSaXd36MDMP+xWp8huR397dwmWLoC7MRCmhSKxditnAYN0BCwtj1LZdPsP/x46jH+6tw4tFVmcnIQ9Qf3eBZxbEqzWa6ULDb+z+rXc0IVTu/DarC2W9Jj36vhDQ+4IpgTJ+qUQUKqM/nWijzRPL7+2mo/0vdxT4QConViiuUDS0wuBCWplBOhAL6+WlCJjkZhjxGFmdmpI88jQtMUmHaFZXdtyjVEg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(10070799003)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlIvZkdDT3psQVFkcDhEOWdtZFpDOXY0ZGprSHZQR2hnRnpHQmkzb1FFYmNV?=
 =?utf-8?B?NWxRcEoydjRPZXVBSmNOR1h4UU9wTUZ4T0NjRkVEYXJja1VEeTFLeGhMOTlM?=
 =?utf-8?B?bk5ad3c0T1c3K1JyQmFSK3FrdmtyUWt4QjFQMmtsTCszdVNhYlc0cjZaUndh?=
 =?utf-8?B?Y2krK0x3SHFla3ZiWktham93UGJFRndHNnZDY3JsMHZyMzloamp5Wm1JZDlP?=
 =?utf-8?B?d0RWTzl1NnFTenhOZkNJNWFFdEZvL0FKYUdBSFZtRG1ZWmpNOVhNQ2VZb0d1?=
 =?utf-8?B?UXVDZnlzc01hN2ZYdTNnRkdBc21ZNnlqMmNGUjAxdko2OG14b05ZVE9rTWVn?=
 =?utf-8?B?WFluV3ZncmVvcCtOdHBOazVGQ2Vya0RuY3dqTXJUKzNlckNPdy9mSkNhYVhO?=
 =?utf-8?B?ZzE1Y3p1UUh5bXZQOTBZd2N0N1ZIZnRsQ09LNTd2N1VHbTlRamEyMDBFUS8x?=
 =?utf-8?B?VmgyTUJlUG02cGNSczJtR3g0S1FvdHFMeGJTMlRSQ2RjbFVCOEQ3TGZQR21s?=
 =?utf-8?B?QWg3TkliemhrMzBJRnNMWWxGMHJpWUNjYjdOODhsbHZNY0NnRUJudlg2T21k?=
 =?utf-8?B?dkFkWTFZaW5QZUc0d284RmRLQ25idWg3aVBaUWFIUm1BbEowaW8vbzJrVnI5?=
 =?utf-8?B?MlNydWJUVTBCTUp3S1VLUDd2OXJRYXZ4Qlc3RnZLY2l1djZhS01lVG50N2Nv?=
 =?utf-8?B?ZlV1a3N2S0JXeXR4enJXUmNxVDBYbi9WMmFORzVUUzMraVY3RkJPcXlONGM5?=
 =?utf-8?B?aFJoaTRxLzFQWjF6eTZYWitsSC8wRld1SXdPZnh1OE5JMHhmMnBTemdncm9o?=
 =?utf-8?B?dmtsaHExcFA3Rm1YUmczWXl5c0VpV2xrVUxLOThneXVnZG43UmwyS2lyT1Va?=
 =?utf-8?B?d1prR0Z1UzR4QnVuRGtmTC90SkJVUzBIVXlKQ0d0ekY0M2xvVmRDZ3Y0OEFz?=
 =?utf-8?B?aFpiYWc1MkRYS0RCa2lSSG1EbmExUHBtMFZsQ1RFMXJPKytxU3hrZGdvUTdj?=
 =?utf-8?B?Yms4NWYxb20wOERKQUszUnFCNzR3cDU2L2pEUC9RUEtlU3N1WElLV0lDY1Ez?=
 =?utf-8?B?Tnl0YThtcXlDKzhGb1FhV0Y4Z1NBb0J4RG1NUzJzMFBNSUtnbGYxckpxLzBz?=
 =?utf-8?B?RFk4bXVFQlpycjZvWm9SaHluRERoZlk4cDEvZ0ErbE1CYUJ6ZzBsZ2FsS2ZG?=
 =?utf-8?B?enFVMkdUZ2loRWxYTUJ4Y3BMM0tFN0YxUHBTeVI4RUNveDNBelVxWFRRNG4v?=
 =?utf-8?B?dVRHK01WcGk5MStBdmpKWjBnWlVlWnFmSUpMeXZwT2lsYkQyRVB2RldyOVRo?=
 =?utf-8?B?dkxOenRhdFU1ZG9BT0NubU1wNzA4dGV2QTJXWkxPeXNnN3Z1NmJOeGR4UUR3?=
 =?utf-8?B?SlpDSXJ4Y1Fnc0Q4SWtEaW5meTRSQm8vbFJKYy9ieDVGZ0tUc09qdEFXU0Rj?=
 =?utf-8?B?cXlwQWYxYnR3bnByQ0k0akh2T3BLWkRXY1RxaVQzUmpWRkk3TnpXenpKVVl3?=
 =?utf-8?B?ajBPcmRQL3NrYXQ0TmMrWHA1TmtvenVCWndEcTZFc3k2Rndhdy8xRzlOTVAz?=
 =?utf-8?B?U1R6OGhCMm5scmg1bWhlNGlYRE8zYnY4MG05Sk5mSmV1SnJ6SXJmbitoeWpU?=
 =?utf-8?B?TmlJQzRuWlRPY3BxRzFtc0VGVm1zTDROYzBVa2pDbnRwL0xvdGs0aC9nS1FP?=
 =?utf-8?B?Wm02ZDBGNEM0akg4OGNUdE1nYTFmUVNTSUdsWGJUUDVaM3l6QnJ2ak82bmtX?=
 =?utf-8?B?WU9ablo5aW8xdG5TVXlOMGtRUUZ2dUpINjB2UFhtVUpYTmFDNldkVktBUnhq?=
 =?utf-8?B?b1BOdkY2M1Z5TGcxa3JRUlZ0dmFXTnprb3BDTWhSTGpQdnlDbTF0NnVJQnZv?=
 =?utf-8?B?blVkU2k3bk5sRnhGYXNXbFRHYUU2NUliZjJxMWJlbjRTY3R5UE9zV0Nkck1B?=
 =?utf-8?B?S1ZObFRBK2cyeGdQdTJkeVFjVHZOZk0rTUJ4emRJYmJEZjRoeTdJUERuRndG?=
 =?utf-8?B?ZU9ycGl5ZFpHa2cxb2tsMXE1RWVVdzBRT0NvMDlmUjYvU3d0WXczYU9HM0Jx?=
 =?utf-8?B?Q0dLZlV6SDlja0h3MEg0SFVIa0RiUlRiLytQaXk3aTRnNG04ZVgrcUY1dVho?=
 =?utf-8?B?bGVsRVNQaW1jNEdjM2VpbTRWelFDQ1lTOHp4bFhWL3Q1UTNEaUZlT2lwRHVH?=
 =?utf-8?Q?TTPbuTasZJfsqv7VBsARdaQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 65639b7c-870c-455f-4f4c-08de1dd77616
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 08:27:16.9367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EpDen0eGcGp1686FFP+un6IqDYspvxDek1Wgfwa/Y7GQELHRIJm4B+3GFNOB+/QlXqVK3scEZEdzE2KLY/7rrSauP48PsG5HK2SDYAkyBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002738_117136_C442B365 
X-CRM114-Status: GOOD (  16.33  )
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

T24gVGh1cnNkYXksIE9jdG9iZXIgMTYsIDIwMjUgMTE6MjAgUE0sIFJhaHVsIFBhdGhhayA8cmFo
dWxAc3VtbWF0aW9ucy5uZXQ+IHdyb3RlOg0KDQo+IEhpIEpvc2h1YSwNCj4NCj4gSXQgd2lsbCBo
ZWxwIGlmIHlvdSBjYW4gYWxzbyBzaGFyZSB5b3VyIGJyYW5jaGVzIGZvciB0aGUgTGludXggYW5k
IExpYnJwbWkgc2lkZSBjaGFuZ2VzIGZvciBhbnlvbmUgdG8gdGVzdC4gSWYgeW91IGFscmVhZHkg
aGF2ZSBRZW11IGJhc2VkIHN0dWJzIGltcGxlbWVudGVkIGZvciB0aGlzIHRvIHRlc3QgdGhlbiB0
aGF0IHdvdWxkIGJlIGdyZWF0IGFuZCBwbGVhc2Ugc2hhcmUgdGhhdCB0b28uDQo+DQo+IFRoYW5r
cw0KPiBSYWh1bA0KPg0KDQpIaSBSYWh1bCwNCg0KSSByZWJhc2VkIHRoZSBxZW11L29wZW5zYmkv
bGludXggcmVjZW50bHkuIFlvdSBjYW4gdmVyaWZ5IGl0IHVzaW5nIGZvbGxvd2luZyBicmFuY2gN
Cmh0dHBzOi8vZ2l0aHViLmNvbS95ZW9uZ2pvc2h1YS9xZW11L3RyZWUvcnBtaS1kZXYtdXBzdHJl
YW0NCmh0dHBzOi8vZ2l0aHViLmNvbS95ZW9uZ2pvc2h1YS9vcGVuc2JpL3RyZWUvcnBtaQ0KaHR0
cHM6Ly9naXRodWIuY29tL3llb25nam9zaHVhL2xpbnV4L3RyZWUvdjYuMTgtcmMzLXJwbWkNCg0K
DQo+IE9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDk6MDLigK9QTSBKb3NodWEgWWVvbmcgPGpvc2h1
YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToNCj4gPg0KPiA+IEFkZCBSUE1JL01QWFkg
ZHJpdmVyIGZvciB2b2x0YWdlLCBkZXZpY2UgcG93ZXIgYW5kIHBlcmZvcm1hbmNlIGdyb3VwIA0K
PiA+IGJhc2VkIG9uIFJQTUkgc3BlY2lmaWNhdGlvbiB2MS4wLg0KPiA+DQo+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtcnBtaS9yZWxlYXNlcy9kb3dubG9hZC92MS4w
L3Jpcw0KPiA+IGN2LXJwbWkucGRmDQo+ID4NCj4gPiBKb3NodWEgWWVvbmcgKDMpOg0KPiA+ICAg
bGliOiB1dGlsczogQWRkIE1QWFkgUlBNSSBtYWlsYm94IGRyaXZlciBmb3Igdm9sdGFnZQ0KPiA+
ICAgbGliOiB1dGlsczogQWRkIE1QWFkgUlBNSSBtYWlsYm94IGRyaXZlciBmb3IgZGV2aWNlIHBv
d2VyDQo+ID4gICBsaWI6IHV0aWxzOiBBZGQgTVBYWSBSUE1JIG1haWxib3ggZHJpdmVyIGZvciBw
ZXJmb3JtYW5jZQ0KPiA+DQo+ID4gIGluY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dw
cm90LmggICAgfCAyNDQgKysrKysrKysrKysrKysrKysrKysNCj4gPiAgbGliL3V0aWxzL21weHkv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArDQo+ID4gIGxpYi91dGlscy9tcHh5
L2ZkdF9tcHh5X3JwbWlfZGV2aWNlX3Bvd2VyLmMgfCAgNTUgKysrKysgIA0KPiA+IGxpYi91dGls
cy9tcHh5L2ZkdF9tcHh5X3JwbWlfcGVyZm9ybWFuY2UuYyAgfCAgOTAgKysrKysrKysNCj4gPiAg
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV92b2x0YWdlLmMgICAgICB8ICA3NiArKysrKysN
Cj4gPiAgbGliL3V0aWxzL21weHkvb2JqZWN0cy5tayAgICAgICAgICAgICAgICAgICB8ICAgOSAr
DQo+ID4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgfCAgIDMg
Kw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDQ4OSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2RldmljZV9wb3dlci5jDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3BlcmZv
cm1hbmNlLmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5
X3JwbWlfdm9sdGFnZS5jDQo+ID4NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo+ID4gLS0NCj4g
PiBvcGVuc2JpIG1haWxpbmcgbGlzdA0KPiA+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZw0K
PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQ0K
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
