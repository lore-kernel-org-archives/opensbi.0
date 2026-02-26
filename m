Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3E7FD8FC1
	for <opensbi@archiver.kernel.org>; Thu, 26 Feb 2026 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhPWQpxfPPvuW6cr5zn6jyq3dr8Vg+hCit5/gn9bNSg=; b=sbirwXU87iwNjV
	LfGpu5/8z0LqBZVtKTVYVS5V27+qEGbakP3kdE8gupcIZVZoU62pI/4PCoxjjIKpcRo5MSirvaSzS
	VWrswFAcJAKDUxA2BabygOdb/Cr98JUYcMrI89Ny7D+0vfOxXpRd0D1fcn5xcdnZ14oDAHRXyrRhI
	L5jBNvot2RBxx5TlvARy4bogzoW/mM7ojw8GqU3dN/2SuHLfsTdnGv3R6JGsxWi2HB7USP54b4RIc
	6EVel7WP6WW1DJsV9X2YOPMKRSY4TeuPjTc9y6WqDNv1yJ/oa/p1mi8SCayRouYhAORVNBFXB7yKB
	aeefz+Q/vVWIoak6Ofug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvckD-00000006O0p-0baw;
	Thu, 26 Feb 2026 14:53:37 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvckA-00000006Nzy-1qtY
	for opensbi@lists.infradead.org;
	Thu, 26 Feb 2026 14:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJCehdw/dTTo5N4go1+B3f8gB2u5FtNyFnpEMXrTgmFZVmiDsi8E0HnR3r7PJRI4H5h8y8R83qwbLDKt0g0B4bW4+a0SW4Zi7D6XCxCMQu0v6i+wAZp49oHk490H0JkxEmFXMXd5jZ1Su9WMtMPb7GUCdm6w8O8v/3NlCtCfhNlpTwZshnJfO1C3wxTDQ8CGLA4cd4uFvoQhDqIzEwLyXLe7Oy9C7LKKiwa4amRU9TW/JggxalyB01agtBaU4kn6pf8qhrhWbfrhTd0OgfMe5WNuiolLdOaBd0pZsg4Bd/4MOUTdiFmjGPXR0WgFcAu+DmWJrUUU+Jj9qPqovfgo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1Y3cSrtf6Ortwz/ZqsLBRn/OsIncvlB3yh2zk4thcI=;
 b=HtYWBK4uv1Be+1kYQY9UnCKRHmNr12cs+JBa1h5CWFp8dBYRx312aOOrkDdGJvRtDIJyQBJW/Fnq8NvITAt+thL7MOPG79nrwUE5qp7Wz8RctdVZCsL6KI6XKnTuDWAsMQN1lD0qlqVki5rIUvlRjDDqLOL8GjvFcdsCunOSh3F0wqJPDGXIkCydNU/x1OBa4gQeQBTqJWOY4+unKXqMUP8tkQUGQv9W7uj41G+ceXGGI1z2e4XWAXjqEVa8cBBdg8R0jgnX8Eg/MxHadeGEBquDWETqMJ1mEHhAUCjHFkut7RCS1FNN08Gkt0ZRG1yjptfaiu9FhhIoeB4180rYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1Y3cSrtf6Ortwz/ZqsLBRn/OsIncvlB3yh2zk4thcI=;
 b=npjuMVWldhYPlNVaVPStVp6SIgv8yX3/bHxYT/ITRQU0O3JsA3WTvYfEzh3lGx1an5gx2u0hXawROkR1miRqOySNFYJREy4aj0TyzVnDKL1gLeqnxXdBAi9fJ7VLPgvkubVp8E/FzYpZpew6czYkJgPpszjv/KMeopVfbBWcEUw=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by AS4PR09MB6520.eurprd09.prod.outlook.com (2603:10a6:20b:4f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 14:53:24 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 14:53:24 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Conor Dooley <conor@kernel.org>
CC: "anup@brainfault.org" <anup@brainfault.org>, "benoit.monin@bootlin.com"
	<benoit.monin@bootlin.com>, "cc=cfu@mips.com" <cc=cfu@mips.com>,
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
	"chao-ying.fu@globalfoundries.com" <chao-ying.fu@globalfoundries.com>
Subject: Re: [PATCH v3 10/23] platform: generic: mips: add P8700 based
 "eyeq7h" and "boston"
Thread-Topic: [PATCH v3 10/23] platform: generic: mips: add P8700 based
 "eyeq7h" and "boston"
Thread-Index: AQHcpNR4XWa8hn4y2EOzdlfzsK0rf7WTmN6AgAF0VgA=
Date: Thu, 26 Feb 2026 14:53:24 +0000
Message-ID: <f6770d14-a3f7-4668-8bdc-9826fedd912a@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
 <20260223-for-upstream-eyeq7h-v3-10-621d004d1a21@mobileye.com>
 <20260225-untying-tapeless-5652a2b62925@spud>
In-Reply-To: <20260225-untying-tapeless-5652a2b62925@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-imapappendstamp: AS2PR09MB6296.eurprd09.prod.outlook.com
 (15.20.9632.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|AS4PR09MB6520:EE_
x-ms-office365-filtering-correlation-id: 040d6b55-e3cc-4e7b-7c6b-08de7546caad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: EW/QHyBvUwPxUpBDjS2FrnZcBtenexSrgl/l9K+nVqG1jwUf7dlQmYWXBS0c9AgQUvzBeWqFB44MFqKiMvmkmohSVEodr52F+oiDIBShmPfyvH4usbHVB6rTbD84xUc6Bmewq/9ZcDefe6rb4ONyoDf6RSAkIC5SbhAgtU2yi3nS9qWd5rKiDtNHUeg6iOUPvONT7PcHcBnCNig3z1gJk0BmbuybXB1m6/Df2UiNoS853Omd2df/Mke0VKSQAUBjNLvAf2LRvUetgseBFTXXDhbwLn16wIYAFx5Gq9ozZccI2d52qxo9ChR3qGETjQlrbobx7lIugNarOe1mMrnRz/V/0ekAME/q/CodBjI8FklzhKz4e3sWgfBNiYOowIc61ejfDIMOuCf1tTKuA5/1Mms0v3iDOQcL0Wx4ESb5iS5Nz+4e7Tt24ak+0wZ1Iu2PivnlACDfYEk1dD8Ukq7EbW7NZKMJxM1mFg9KuiKCdbQi+zwld0sTgKd/uo6NQEbOLiu8OxS2uQAmsScCRk3HnVJS0kf6XWMOxA0XZVlhF/GumoYNgCEvywQ+4plFtsMMcFIgH1HXKbkHy7uzs+H1vFtZZJhIou03eRt11QavCTUQsu0vjTLdHLSr9GmYUs6WoLOLEhSeBx/zcoDIbbL2d9U2Wc0IwdnfVFSZMeod607sSNfYAR0FUcSd+KPvA5RGuLGDqn7FlLjVokDf3yYI9HV503L8JjlgUxf1pTA8XlNTE4WuIdZjKjydg/lgNMFTR+5pxHTYvPV2WoxcZyuGE46YF4A7DSVMfRU59Xkg39s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?4I3pa8iEHVtkaHTnWCJ0VSqCw/FnObiYMFqsFcWK5jFQnDSp26Xhw2LsTb?=
 =?iso-8859-1?Q?vKr9WxucTnbV73pdbFWQ1sdjooeyGuImS7VVP540UzhSLqMiDrbm4+XLKU?=
 =?iso-8859-1?Q?et7qGs2fXYhz6bHcEjz4T4zeeZLpIpVEO2vxcFjcuGY5J+qcSQZKpYXpGt?=
 =?iso-8859-1?Q?hIyhihSPHqoru473L51KKxHQ4q4+Y8sRJXKp1q63dyTALDqIlA4MQhcAc5?=
 =?iso-8859-1?Q?sfvt8Xf6dBJAfQvXeIjUlmpcRdCy1zay1HZ98zIw4NGSZp4FpwzP6ig+9r?=
 =?iso-8859-1?Q?5gHA9/FuNZgjeRW41xDwCajBTyW4GnTpTGHs03TDKn08Zq7F/gsY+ilZkX?=
 =?iso-8859-1?Q?FIOFUp/aJBz0kprcxYMh8NFs+BKlRpPGm51mAvEAMeT9SldHKlTgJkjkAm?=
 =?iso-8859-1?Q?AwAkRmMK2kTXGWtYD6y/ojTK0oYXCn6WKPhpBYsZYoRqcBavknmYC6HeAQ?=
 =?iso-8859-1?Q?iK6KSd1a4yl6f9SLdL6xCKoO6UzUeQHwHhAwz07Ja7A13TCs9p9OpeI1Be?=
 =?iso-8859-1?Q?CAGP+3TC7OmdQX2umi1q9FPc9DKEWWIUVtCWhLTxrlOf5h79JYMzdo9v8V?=
 =?iso-8859-1?Q?B9CgoSj+lFgaIHYL2fdfZKJVen+xLASQmNxIRH0svGxULtDaHbtqCDVYtC?=
 =?iso-8859-1?Q?lAh2T6tpwOrtHhZeQPaflKdhwBfH7lFOI6maectAoWUHYwLPYPHjARFXNJ?=
 =?iso-8859-1?Q?WpHwJPMJ/xmsPuOfnoa6HVv7wsH3ERjKmv3zr0bT49IvrQ4ThSsQdfl6o0?=
 =?iso-8859-1?Q?OTn99VUyU2ViQOcXxRFEwDjZAssqE/I/hsqs5f+OyWRuMQqgk4sv5Tp1ed?=
 =?iso-8859-1?Q?aZb8zsBCH1Q6HhF7oAq60MGiuRN8OGu5pngdjKIRXuhs+UoKzQ0xwOb1dF?=
 =?iso-8859-1?Q?ixfY/WUBJ4q/oIUiG+rciDWu9zjQ3ax6W6eAGM2bovi4NNNDlZu5sqxEHj?=
 =?iso-8859-1?Q?YPvqCwdVGgOfeAiFLh2KIp5YTobzfoHGs6sbd0+pAAR+DmGU9nEMGHHTxT?=
 =?iso-8859-1?Q?g9pDkQ1rFwY5DCikTlsTslQSHG3UmNWgwM4kWFkRGzYD0r2mDMcsDoPT3/?=
 =?iso-8859-1?Q?oxQZx15HzfZsEe5ee4q1VtZS2j4uEA2GqMlA3GpvaXszfuvr+OsYuuiDRC?=
 =?iso-8859-1?Q?EkqULL0dPN1OHKF4qtozPWHkpBzu3l7Trmyu/5/zee8iZazUr/ZtLrLJH5?=
 =?iso-8859-1?Q?sajMQZ5sl13qK6dQOHw8GekNzrmEGgNisaVIDT0scwEaM5sxtNSqe1TZq/?=
 =?iso-8859-1?Q?2dh/3cGX7/UbqW9gv6GK17eE/xiZOpL+KASBmHxiizwWQ1MB7m1hdcBIBc?=
 =?iso-8859-1?Q?G2EHKhcV9QpKSFnxeEydsFhuuVGhWKtcQWLd0LzjG1tSUsccxJ6IixvYXp?=
 =?iso-8859-1?Q?kXELQC6kfq7BAF0FWinz2rdlEp9tN0IcUr4iVWJrE72mktOfKAp7FVWkdf?=
 =?iso-8859-1?Q?QHd5M+abinfPsxCKxwB7ff6+8Eqj84DNtEIA0mex438KQAte6Tym6Sl1T1?=
 =?iso-8859-1?Q?m1xaXlAy1X0NZKl8ib5ghX1alM+B3P7s+GdE4ONf9Qywl9qcu6T1EgnatS?=
 =?iso-8859-1?Q?GZq2M5iirPjM3poCDr/926IU+x8mMM+yHMURf17iVWzjPPy5TRDqSZrCpJ?=
 =?iso-8859-1?Q?Tlu9ld0RZS0yNvH98CaLkV7RMYLLd90PlK6vBpyTVM5YEWiGIN9FTgfYKJ?=
 =?iso-8859-1?Q?99Irly3bS1/R77VJkEAwro60C9BEf9MJz37wZJrh8WRPWtm4V/v/o41Xvc?=
 =?iso-8859-1?Q?FCfiQHyEO/712l5Mr1DCTii3EVHm1U+G0bbi5V5CwF5okCYgI4TZywiX7u?=
 =?iso-8859-1?Q?0fMcmXgDng=3D=3D?=
Content-ID: <702E996F060B424E9DCC844B30890527@Mobileye.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040d6b55-e3cc-4e7b-7c6b-08de7546caad
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 14:53:24.1540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWbpPF3bALpZhA/bNQwuRqbO5OFEFwgm8Vy4/b80HR3umFAIwKKoMagqU6KhHWe14h+cCJ79T1hNHKVSS3dMpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR09MB6520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_065334_666616_3DB8DF11 
X-CRM114-Status: UNSURE (   7.51  )
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

On 2/25/26 18:10, Conor Dooley wrote:
>> +static const struct fdt_match boston_match[] = {
>> +	{ .compatible = "mips,p8700", .data = &boston_cm_info },
> I'm not really too familiar with OpenSBI internals, but this looks wrong
> to me. Why is a soc being matched on a cpu compatible? Shouldn't this be
> something like "mips,boston"?

I see your point. I will consult with MIPS that is the vendor of this board
about proper compatible.

Thanks, Vladimir

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
