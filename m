Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6720ECFA46B
	for <opensbi@archiver.kernel.org>; Sun, 23 Nov 2025 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBn9xcBCc0er5giy5qzGDpbCwDIB3mNWb2scyhchnps=; b=0HaaTFn3BjyTMk
	fysrCnZnn7wOGVbVIHcttdQAZ9LhbVEbr7aKJGBlgzW6i/IkOnZ6zfBijJ6alnC5IkmGOr6NO1cpW
	4RpjYPBSFDcAN28td8sMN7r69ri+pEoqkDYUYjltHsnuEezK5ZsXv5dPG6KuISXZiurXdf+qjDnea
	9kBwQTekv7v027Xkb9ZGGOV2efTzR/9N4S9TJyLBnCCOjfjs2mCHU2cEW6+aUEbhc8ZViCRFgq4tF
	BX4hR10op4ZNCmt5hhCIbo9uiBSWUJvSfMsGx5cJazuk8kKF1Upz+glqRCk5gY4DrY+xvZFkxbxLG
	dOTlkIkPmT2hgZ75BVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN9iL-0000000AQqT-10Nj;
	Sun, 23 Nov 2025 13:01:13 +0000
Received: from mail-swedencentralazon11013014.outbound.protection.outlook.com ([52.101.83.14] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN9iI-0000000AQq1-1opR
	for opensbi@lists.infradead.org;
	Sun, 23 Nov 2025 13:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzHIDHxG6OkWIMVjb1Xh2cqIO0V9XBtpS4Yus/bvVnXbsjPhpzNxPPWeFeCYeP8SWv3debT6bEv2YIFraAyLgiAYrMKK0vHqsVqIf5tg9zUmHwt6gQ4Euf+VcuntM/TsIxaJX33a1gigAtPNn80vdFBNoHrnYuQndR3DJH4TZ8GbEPSbc1693a5vjH0ECpzj1uf3sfIBqtB/Av6VV79FSyCc8XVQQgkyM2xXVR9AGYd/UCQjjX8FWVJnEEINzEHKIQ6y+RLUb80mWIU8V6xwqSCzrmFv+qU/zFj+cYSsXYZ6WbsUwkD/gDuvuhTCC8W2vswBwI66m0EpC2WJS4/ZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azapmxuleVoDHmUfJ3SdQdu2zj75YN+VKCoxhnM5ZHc=;
 b=meysHMrfmmMNMHtZ9bJ5tJYO6DY/pWUbKaHlAyjYiGRyAS/GooAH2KHpIrhfHQjM0H3E2bgPyq3dQld4WVNCnpMpwdVD9bhMS13D2Bk4XChMD8V/bFzA96gh3TXeMCSWJXK88TI3wWHQQmPePFl4uGJGvyW3bRwsFg8ZYTGm7prw1A4tuXCv/BEcKWumhCIHDEJgSfYEP3gtItmy5cK0dEjVr6YYOIn2wy6yicApbzgYBar2qE2HwpllCKNNzJojXIWTRQaZ6cdOWHFwFxiXzz7RT/ehObmeGD6jkkHAovNquAk/ml4H9IzhtjMGgJcgMoPt9MG1dQ/cPpaYGiTglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azapmxuleVoDHmUfJ3SdQdu2zj75YN+VKCoxhnM5ZHc=;
 b=eIpoPDSYahcOmoBSF20taLxATfMdC7vEWqkoqbl+Lype63c6BRgTpDO9mj7Ji+oJdqkN8ZLIG1+FCL+4IzW0Ae7spUp0CsHaZFkvyce4sFFetqO8hnYWq0DZSRWzd8Y+Wt3MmlLSl7ry74nVleP1RedUrnQ5n4cW+h/ew7LMVck=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by VI2PR09MB7517.eurprd09.prod.outlook.com (2603:10a6:800:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Sun, 23 Nov
 2025 13:00:56 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%3]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 13:00:55 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: "anup@brainfault.org" <anup@brainfault.org>, "inochiama@outlook.com"
	<inochiama@outlook.com>
CC: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] Fix domain memory regions handling
Thread-Topic: [PATCH v2 0/2] Fix domain memory regions handling
Thread-Index: AQHcUvgIpdvSg29K/kS7BNpDn3F6ULUAS1QB
Date: Sun, 23 Nov 2025 13:00:55 +0000
Message-ID: <AS2PR09MB62964380BFCB7DB8363E774994D3A@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20251111092224.825282-1-vladimir.kondratiev@mobileye.com>
 <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251111104327.1170919-1-vladimir.kondratiev@mobileye.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|VI2PR09MB7517:EE_
x-ms-office365-filtering-correlation-id: e587d153-c595-48da-f5b8-08de2a9056d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ji59BMlXj8UtF1/QOsjs+fmYwMfQRvffBc6PCX4TUX+EbUJ3RVi9VUYI4i?=
 =?iso-8859-1?Q?GM+LC2Hn6bFo11I7sYONz3qptTBv0fBNGQcBsVYBj/8yVx591H63E3ihfe?=
 =?iso-8859-1?Q?1/j9Ef8skGRXYjJ0TcQu4g9Syh/oxzYbvI0beu/Cbc6Px+e/4nnHN922RZ?=
 =?iso-8859-1?Q?h/ZPGwXzIoA6ikBajBsHGrTYDwYp2mko2XUfyLCvbo809ayjzAVvLF53RN?=
 =?iso-8859-1?Q?y0/Ry4sMuSP/Iy6hH25LliCe15Ikr3+EjFPrbz/2kdFkr4/sjX5qam1PML?=
 =?iso-8859-1?Q?WUIMBwJMoCrlpZjupF/09TT7pLpxODlWYMPYtdoEWRE/bPVIRpb02wJPzX?=
 =?iso-8859-1?Q?+G6lG0uzxtjXB9yZSFvgR7GX3pTSW2z/hZmZqBDagV+xoLbW110eMsw4+w?=
 =?iso-8859-1?Q?Ap7+m3pU7k35TfRHAh9zBZKsWJhkjJt4FBM4TgJERHP2yMSWSVKbIRaUIB?=
 =?iso-8859-1?Q?x9NeA+2DOe4TUmcaZygpq8nBGlcosVYrsBlH0YYa03jPJ4gXJAHrdvlHhG?=
 =?iso-8859-1?Q?RgHOn1fyik8QN7HVMErf7WtrQPjfIzd8kgJrpMnWKlSWBk8JZ3WIJIC+Ul?=
 =?iso-8859-1?Q?nDIUIQVoDZg0LP4wts2mvOa5SoJY+Y4NAB4brEXNxEjS1hRRfGWRjDVTQw?=
 =?iso-8859-1?Q?z24UVjIpystnzWK3Aqe1P8EbkcGVxKCgjEad/0VWmtXyaL4FAgQTWJ9L0s?=
 =?iso-8859-1?Q?NiN/TtiwgXDtFsgM3de80L2PRgmV/yE19TOnb7Q95XHPPY3BD54GKQE95S?=
 =?iso-8859-1?Q?xWW0f5+jorO4g3LclGdJkyUp2i+lSTFOcQYRZeQrJK48LDc/VAMDDgZ/XR?=
 =?iso-8859-1?Q?CYqrlHSrhACdGWdM3AKOFS1wMlI++kk+PpJDouzqmK2T97kPTCVPkYhjBK?=
 =?iso-8859-1?Q?YNxI/FucABJCfueXdskyTw0lJr+HblhVovOcoBfMoDtspvlBv//Q3m9wHQ?=
 =?iso-8859-1?Q?rVpca/2WKgcXVI1a1ih+eWLKY2+R/d1dYMTmCx05W1TR3o8cTXBJ5TtgxA?=
 =?iso-8859-1?Q?baxGrFB0eEbiOAGrdP9lpyrWDG8peSIMrfOU3mmypwR8tT2UpE/HeUqYmJ?=
 =?iso-8859-1?Q?8J/++g399ZjZQeJx3NJpTbBa5TFlQ8csoxlfelJleYUsY8UPGooxaszdt2?=
 =?iso-8859-1?Q?A8bJ7lcmB2Upo+DU/e+qn2s9I6i1AxtrJQRL7zuRZkGEOov2YhAFsRfgv/?=
 =?iso-8859-1?Q?j+ohFMLZ1uMXsqzzb6m8fm2XCF9VrQlIFN8dIQGpyzrB2XrT9A+GEJJkHj?=
 =?iso-8859-1?Q?ByBl+iytNJRgFnCiGC+mJz2BzY2rTtVsrzXzQfDfZAuETR2rPmIIS6mpCC?=
 =?iso-8859-1?Q?iGY8xY8+e+UydIGV30+NJfyuy0oA47J6d9e1CgdGe/WMr2v6jneeXvdwbZ?=
 =?iso-8859-1?Q?wE08NyDbCoVfCBk44cLXbWTsdprSGvpROjhj1l2QBfn/HwF0Qzhm+m/Xik?=
 =?iso-8859-1?Q?8oMBw7+G427+dODvvzJPO83AOE8GiBLL4NXV9RvRSlZmYjzwg58mb0Ese2?=
 =?iso-8859-1?Q?okhATsO0k8Wc5UIvB16mC+2gNzjOovk8h8qc1hqH6S4VScCkI1ENP7VDid?=
 =?iso-8859-1?Q?1hubiETkkZ3DarGyfIdIZBJVT7mi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?g3I1xMBwQh4xfk4umsNF4//z5C7yRklA97Jl7h2DtwMMzIOwl77my6dbZ2?=
 =?iso-8859-1?Q?8PEksZYWe5wiFYy2gw1P7kw+51iIn4JfqkcD971KeRDQhu/nnTl+onFTDn?=
 =?iso-8859-1?Q?pu7zMYS1+zm6dcIIB4i0UJ8chEQf8lZNlPwBBWBz79rW+vg+MpreI6TlYO?=
 =?iso-8859-1?Q?GgXALyscVmXjSaNoxvqFeYnqI5n1T0qUUbb5ERGgzf0dsoL2s25K1XPJ04?=
 =?iso-8859-1?Q?ILAyzVnr6I2qYwBzlx7TJK21SO/nB0R4Uk02EOGJSxhZBxNYLsLfWyi5D2?=
 =?iso-8859-1?Q?+DH6gpjNVKlSi37JUnlyL4FgtjsEo4AwZv3Ja0RgtpZmqeOBBfgRLoRylE?=
 =?iso-8859-1?Q?o4ezAuNqtnTHJiIa2fn1MwQzWzvRQI2leIjiGTnPEkBGcXqbZ38V3RL+oU?=
 =?iso-8859-1?Q?ulfEEOvIZz66FHvvhJbyoj+fCbkjen3bHasIvi71RgS8jKtu7ESCahloF/?=
 =?iso-8859-1?Q?kioXaFYFKJzWtVbKkst/MXNkRP67tgcjtBmmHhwUxLQgpmJoSb4OFKwGZ/?=
 =?iso-8859-1?Q?mI1jGbKtp/f43G1HJxy28kT4VTSmPH/vlhplwxPnswp7GLhKZ6lz6KETXy?=
 =?iso-8859-1?Q?AkWKLQnLO6IMFU1vI46329WFURczHzuS3vkKLIdppZTnVd08/4LKcoYFd1?=
 =?iso-8859-1?Q?5W6mC4dPfIXtnq5RRNMplYHUr3c7L4HNBa9Jb1DMtXi4XTAbC3uR8efQId?=
 =?iso-8859-1?Q?/WFDguZXT4pDYZ1W4yZheG4l8WTabPlLSl5OdE3iM1HgWFjnY7dHrs2RxY?=
 =?iso-8859-1?Q?qc6TPcHUiZ5aIYHq8nHmOfCKoglyy0kcze9FimA9adsY7EBszvgcyrOhN+?=
 =?iso-8859-1?Q?/yd/f5RiqR9UZ1t4iGDdXf1fpLTrhuTwFapQwA9ZBA2h7TzMe9LCAaSiQO?=
 =?iso-8859-1?Q?8EJFdn3YLShV39h23kgIC1iGg4XNfrE0W6HHYdwcv6MmaJ5pGmPkSCEsJ9?=
 =?iso-8859-1?Q?tvj4dpXDkXOyBVvNLcB1Ka/b+e8g7QC6MvHO51D0rlAEipLSaEow1SOQMl?=
 =?iso-8859-1?Q?7YsSx4Hbqf19EJBcW0BUoUaymIDvNQFKmUSFy3MvPAnJ4HsaYeEQ4cA1Rb?=
 =?iso-8859-1?Q?Izf8Ha836642Ec4rqkAXEE72yMFXsC2YqH7MzfpVi+Yq+gqPKWPUzkechl?=
 =?iso-8859-1?Q?AVUkehGYZnxhhKBfQb59nOlUOGOGfVJpYycZZu/7HjoMIjj+8Z2kqQ8vVl?=
 =?iso-8859-1?Q?HlEkIjHajFfOcJTdJiNTLlzmiW8lFwiSViD4DYZyE1RZNoA/JSEtoRx/Yl?=
 =?iso-8859-1?Q?B8/HH+fmFDZM6MYu4ket8xZjgwt1+Vair3ZoFxG9jnn/Q1YvNKvXsttZvN?=
 =?iso-8859-1?Q?fm3s9KyVflhhUT4tv/E6PejiGNIDUT0XX8tvlr34ssNLPGAppuqF3eHFOI?=
 =?iso-8859-1?Q?u0VfIy8sTcrz0rYc2Y4ciXUT6HqV214mPMhznVxHr3bWtkxmNDQnNdksfN?=
 =?iso-8859-1?Q?gNS7Ec3zVjTbKmaPxPc6OOQnSxLAslFxTfZ1bpF65r3udtLw2XSeYrVuQI?=
 =?iso-8859-1?Q?xfXyNupBZJrCAgBSZcFVEHno4WLuMfJ++M9Q40ZIBQM7as0REor7OoTkeU?=
 =?iso-8859-1?Q?KYHBKlRK2Rw05Ij1VmwpkWujodAxJI1AFNTUUpKEHrtKeesNHtLZSm0mbn?=
 =?iso-8859-1?Q?2TzsScr/q4xRCeAUi+3F2ROcyUmzR19wa4?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e587d153-c595-48da-f5b8-08de2a9056d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2025 13:00:55.3322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iiH7OS8plEKsZk2fr+fjfXBBOYoN1aO4jyPHQZCL3IBkTPiy3cK8fKehKj/pi6v1S8jRIu5KKs96dc/0/HdR3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR09MB7517
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_050110_676831_8A189579 
X-CRM114-Status: UNSURE (   3.86  )
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

Gentle reminder. I need this for the MIPS p8700 platform to save number of PMP entries
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
