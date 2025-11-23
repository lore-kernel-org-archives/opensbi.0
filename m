Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A3DCFA46B
	for <opensbi@archiver.kernel.org>; Sun, 23 Nov 2025 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIJ1vAmL3JUm4CTzovqO9vLufNGo1XCIKkpUE1wjWAM=; b=kf3XH0h3wF9Dxx
	CPHzejQ2rUYr6fmDvz2dCXxnBD3Q2laxhCfnU+H22ZoTS/0Wy2sxJx0bRVg3LmUsmGh0XHFA/0PmU
	bVJuL3loK50fTgcD2KBNB1LMaGG8UNuoce0N3kbAC1mwJCiu2QRjFYCg2Frf9GNX4XcLpEcoXaX2T
	I6AxaNVwM7gnk27fSuQQNzm6HmYR1oih39o0OcwSTv16UE2FXEK0D4wumTG7AYAr5j2Y4Nl6Avz6l
	bUlvD9lTIf16lqSsWxF4P7pilHguwEJK3Qu/O8wTj99H1ynbTuEYEpgKK49V4E5oiD+sWQKvEspnn
	0e8oSHJ4endz9rPD5ONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN9je-0000000AQvk-2Y8y;
	Sun, 23 Nov 2025 13:02:34 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN9jc-0000000AQvK-1H5g
	for opensbi@lists.infradead.org;
	Sun, 23 Nov 2025 13:02:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0J6CNV3hVImGqOH9/LMDiB20f/3orkmDtGreKKqVwVuRsJHq6klPAGEVdXeKONZRkdqeTxjH8ipwEknT+3rQ18KiwLxOrVfedokRXWk43YoM4z8QEMjcE+7bsesvHvFvfkXBDr7jYgbZACTJyVrqCCCDOE3NkhiumgUDdtExuuhl9OOGkT9xPWUJwS3e7lgRDHt0Sf/H/pG8Dx2Vqm4Uavn/p1Raf0FHAFi8+LfOu63LywWzBU18Pjp3Qy40ARkt3dI5ea4iikhCu6wQ06R2FwPMJdbZB2t0aunPTUQ1FB5yAT/Lqx28nJ/CPMjCJPiW7pTnZPNV4+4bYQYYQlllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQSve1NSZ0hXsfxGGEVsgnn+8h3upEvEJT7Yf1SFqKw=;
 b=c3l54dWccXHaSjx1TUvieiACRP7pIGpyqwkfnbYoqNfhNE8vdpueTbF/hNwsQnmJAYV2GKwM/vrDRkYpjx9ZPCDqEdbxlkYUXNOfyj+wv1a8/aeR9+02XSQJTxJwGZIuRyhzqPtzk9JYFaWF32nJFpbIzPYzajeZBUzhe1oYZI7Doe5yiTsAlcA2EMI5xjl3uVytTp3KJeoWKPt3xa12N3enitKMhCfJbvl4HCigV6RHopPxRkna9PRlgdgTJ4i65hfaWqvIoIk88vYEcAVI17ZRj1ZxLJDwa30LGTQH8oycraKppqVw55W2eKBjEsYpVq4wZUC/HYQu5OsaYAE+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQSve1NSZ0hXsfxGGEVsgnn+8h3upEvEJT7Yf1SFqKw=;
 b=IXaqvyh7DKhfHry1kJMthXSLOSmZlQmlGcoPJdFmPwY7kAghnexiOKcPmo4iMhL9pHp9Onc6aWYSu5VsFgH7/83Zuvkrkw2BM5V+lS+cBbZ0JETWZ+vEx2TftjHFPm7TVLRQSHQz0hj++zyGKB2m4afRwjWrq0Y0jTu5wtnez3g=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by VI2PR09MB7517.eurprd09.prod.outlook.com (2603:10a6:800:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Sun, 23 Nov
 2025 13:02:28 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%3]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 13:02:28 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: "anup@brainfault.org" <anup@brainfault.org>
CC: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
Subject: Re: [PATCH] Makefile: define C language standard to "gnu11"
Thread-Topic: [PATCH] Makefile: define C language standard to "gnu11"
Thread-Index: AQHcVHXhZVJ4pPiQ00ipIQkoFXXgYLUASaog
Date: Sun, 23 Nov 2025 13:02:28 +0000
Message-ID: <AS2PR09MB629622C4DA8237ABDBF9A21A94D3A@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20251113081648.2708990-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251113081648.2708990-1-vladimir.kondratiev@mobileye.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|VI2PR09MB7517:EE_
x-ms-office365-filtering-correlation-id: c895847d-40e0-47f8-65b8-08de2a908e93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ioLPf+qeIYcQnr4ml2EN1+0l9QCKMS5wtGnlpCS2kT+gEubRV3zk0P27ib?=
 =?iso-8859-1?Q?K4NxJtHPCJdzFkFEdvpl5qOo0m5524GzjF9i8WUIRSlWVvOWQpfaPbFvwL?=
 =?iso-8859-1?Q?r13BLYzvPpg35Ch9pD8GOK2Mhe/STbtex3hHjgBvG6l+t3XlT58xSZLxR+?=
 =?iso-8859-1?Q?7obFUYKg5Jdo1NGNLX0noGlJFVT4KY+W5MUQEVEXThYNnm/BRixrzlj3Vb?=
 =?iso-8859-1?Q?1/d5XS3T8x703I7ozEOLhBAw/wMcXUtuZyaReTAIoMdyetiAGY8x4t+GGh?=
 =?iso-8859-1?Q?LeR0C3p3IJdQi73yci7g2Krx0F+Mis32OUk2MNMThpbmKVcsaryfTF6XX1?=
 =?iso-8859-1?Q?vkSVMiYqV+yUHaczHUcZnnwDSwwRpwHDJLOsitIJymgYvSpJZdj7vKHbn4?=
 =?iso-8859-1?Q?CE9ARlCvDNbCawmqBL/QiW+akDNWwMmE7VAVeU5Jru+qn5RqEzibjzoil0?=
 =?iso-8859-1?Q?JrKtx9mMVy1lNvdKPfIK8IQefSTfpQku+ftghhAS1C/vKnRV+fJk7EzoIk?=
 =?iso-8859-1?Q?CebOeBU2WCwedzCslldaHSQ9uxlb3FEq3wALhkrhNVsY3ggIRacPwmn4iz?=
 =?iso-8859-1?Q?h4T9zlvEaOoPZ9lssWbJbGKBenD/tkmKrdc+Yw5CFb8ejReN00SAYXLgyg?=
 =?iso-8859-1?Q?RsvUbdlEKnMkOpRKNTrN8N7TYFKWzcIsc2EEmVoY4nzS1iJijVosG7wydg?=
 =?iso-8859-1?Q?OLVDBuSAMIB8F3CMNmNtbjQeUM17gTjtvMlnExmORdrZCkb9fVippsD9g1?=
 =?iso-8859-1?Q?A5Y9hoIhV8VEqAHxHxoeDf5AvzwSfqO5XAB0chCG7di8px1osx9qkbOBkw?=
 =?iso-8859-1?Q?vTSCBZSl9w2PotoKLiX3nizmyoUFqN/WhVOF9VTZmQtfDFVcwFJLWeluc3?=
 =?iso-8859-1?Q?h+EJkh144dCqFW9UDMsRUZErxUHxDKEXYbBFBEHda4t+Kqbu1QUrsV8r2H?=
 =?iso-8859-1?Q?gcGx2K8jp4CMU/ZDz7ticQUAge+V03Qkum6LLhMvtoxufE7svuKZV4soyT?=
 =?iso-8859-1?Q?Cr3jayc5cuCEycBmT1N3rqW+v1zN2MIV+6EWwFktvD0Rn8NhJ+xF40dTb1?=
 =?iso-8859-1?Q?msv3QYsna9R4rYR+vi0Ibd6vTlTy4usS4AOLRSkziGLhyyCjwqWNj+3716?=
 =?iso-8859-1?Q?z55veTRsLitr0kDNaJW4uuGK7oC7WZs7kXmowuu7XuQiC3qnQVXGiyx+oJ?=
 =?iso-8859-1?Q?YAxvkOKDTQ/3m7YGCRqGY5awyL5Or9UghJ73JL2y0uNgh/tmImq6ULbCha?=
 =?iso-8859-1?Q?esei4DBWt3JLy/KjYACQCCmv3HMUeAASQkqXAOA6Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4iWn5RhY+rRW2K4kAbb/Yi/5PJp27NeUUi6pmxoVaTuthzGQyY1sUWyMSm?=
 =?iso-8859-1?Q?WF+F32T9QzRet4Me04MB8Juuvt3CudXSgpmRvBIM84l2EeGYdUulv1O/Ju?=
 =?iso-8859-1?Q?6wtMWwOPBrgd8QXypNkaP1ID960SteuhTdIO3kLYLTAqjgKUqIbyfQynV2?=
 =?iso-8859-1?Q?TgPvddQMce7ZXHnCS9Ax8k1Icit6VGc/yloHaAzaeRWW/6Um5V6un7dyqt?=
 =?iso-8859-1?Q?ZjfuTTduivQ/TUepdNs1KZr/bk2o+QZ0kKp8X9MJBlv++9UlOtxpimojOQ?=
 =?iso-8859-1?Q?qu/Ajm+iFxU+uAS7DWkBFhooRbSURdDcpPP2oqc5AoUR5ukd2bxOZBa6u3?=
 =?iso-8859-1?Q?+9jYEE6AOl0sTs2cwnRzWfrLIT7pqYng3zOmorteV+a1g5N0DdjjFnJ8kW?=
 =?iso-8859-1?Q?sxvKCIN5Q7i3e+X2lJKEBZTc42JHMehsB/MktzLRCoFx2b8HaqefvxJrPv?=
 =?iso-8859-1?Q?3VKteIQQR5hrlVBpQrMe+vIvFJeax/eqlRWpLpoAI3+eU0W/KXDtia3joF?=
 =?iso-8859-1?Q?QvqJbM67Ih35Rop2guh7Q5Kc9APg0Qy+IPEnK6PyQVAM/xBjUaAjNYqA48?=
 =?iso-8859-1?Q?1/qRB9/hU2dzextLVkBVVlxlymzNTpQZlNMOlFDykjHao4QQ+hxdZbqd2l?=
 =?iso-8859-1?Q?olkaKpjc32gCnrYq25Tm0Jb6NXT7wVjuoO7CHltcAUmixveFMUcP6VDBYj?=
 =?iso-8859-1?Q?2fwaLWZEU9jIb8RmvKpgolxkeU6bvdpQoH2CfeIlkXEDZfnyX9/QIP542Z?=
 =?iso-8859-1?Q?HXyRc4CCZLOIYAaTYdgTmPU+3psNeC+ywJTPLzUq/l5IOmU8Oay/pmW/Ol?=
 =?iso-8859-1?Q?nO9Zl4EbGX7uHOxy6c+eqC8jYUT24JYinY8320EgJj97UKzh45FVBCAKdC?=
 =?iso-8859-1?Q?Bv1Ui75CYRnMLphTzNK0LkdSCeMtAxLTmBmRTy13437DDm13EyumA7Rv/M?=
 =?iso-8859-1?Q?ZHZUTBQkGFsIYlopFzdA4QAmoHbbRP4SX+E06G4yCHT4KsZW8+NqJNQKfS?=
 =?iso-8859-1?Q?yva5Yc8BGZ93ZAyhwlAiU40sNTMv4fcxFoYRoKswxKz2r7wg4uCMPf+q3O?=
 =?iso-8859-1?Q?eBYLJgLaqCUuyyXh1fKSL7twI5Hxm/yi6ZjMmLy9CJIThxCmelM71WcMz+?=
 =?iso-8859-1?Q?sSJwX5kQWuLdhO2LMe6XGr7PnFzPP36JqMNNxKMnca6AABJvaoypIihvBp?=
 =?iso-8859-1?Q?CACCWoycBsRrrKKhBmWL/WWvl4newc5yu0j7r/ClE5libQ2+iMYZ0gDuif?=
 =?iso-8859-1?Q?lOnFmpW5Px6uoIVYDlymeAg1Q4qNtYTNWK6bBYaDoffK29knIFcPmmRfBO?=
 =?iso-8859-1?Q?SIKAKs0pa1Xj88/ugPpobey+6JOsIagYVj3qccKDv3Igx2NtjC4MGb7fbo?=
 =?iso-8859-1?Q?CEOrpfnzLJQMu15I8c8rhuuqkY51oGhr7sWmAZz7eZBXIzHsOiA1Hnh4eG?=
 =?iso-8859-1?Q?8G+7IVmbHMTqk9Xwk69u4vjpwegConv8+Rwt8ZWaqCCW12+3/u9dcvmHX1?=
 =?iso-8859-1?Q?FmGD0CWdeY0qM2HNhoq0uu35hQXfSGAmbaSgALesxjOWqK1CXdb2Hkays9?=
 =?iso-8859-1?Q?YJWX+h+SgggkeMDmwNLJ3AF5Vr6idf6acnH6B36LaW6miTwB3hYlnH9Cfv?=
 =?iso-8859-1?Q?CqoVazTUc5JDEfoG6xzokQe0GpGMjoPAsk?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c895847d-40e0-47f8-65b8-08de2a908e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2025 13:02:28.8797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VgqLqdl4/1hvOKoIdY5990hT36zQXwWzuaDjv7muzYXXwyojBunuEcEa9TjAGXbfFAgRzSa/sqJ4FvvOe4WPqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR09MB7517
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_050232_341715_7D155C07 
X-CRM114-Status: UNSURE (   3.52  )
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

Any comments?
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
