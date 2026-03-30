Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99E10D14AD
	for <opensbi@archiver.kernel.org>; Mon, 30 Mar 2026 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wz+5t/zpWLcKdK6GPsb/fyAZKc2cTOitUyITmpo2SrE=; b=g6cBk8sxXqM+Ti
	yxWHYiB6cNaknlz2iWvnYn7nGVKgJtOYJP/X1K8TlZ8TLAqigo3i9nUzPslBdZpPB7s2sedB3XvdJ
	hxBoN7BrEWmgFw0F608mI/h39UzOLkA+4OzLDWZVwRlpD6V04m011wiFywLP6/qigXVU1XZCtUf4h
	Zj11FDCuifHp1wJ8wG3cDgs3rCdT6omjcaYpo15QhnbcouCmK0Ntq6Vlh4cXA93kn1dHyDqSMnj7I
	zQqWouvuBB4EQB85G+BOLceIJTE7tq0sXB7+9wzm3p9MDvcPJt7Uj+OqMFxqZZ8X4aZhIfdWEpFlE
	xzFq5YflPO1ODcLeWQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7C7e-0000000BIBY-32NF;
	Mon, 30 Mar 2026 12:53:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7C7c-0000000BIAu-0gu5;
	Mon, 30 Mar 2026 12:53:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCcVwX3195173;
	Mon, 30 Mar 2026 12:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=Ar9ZcJehPBP6heXnOvAX8L7UprmiwU9e6ZOMhiOra1Y=; b=Nq
	HmirLVSkHuG1TEx6nRTrdOKKWZayDN/cT03iX4BQJ+s9F3f+hD2mW/P6ezVi+uDb
	KIFWD3UiFu6YdwbjFwoaGhl2HI+o8dpQIGfrL0myo0lzFnBwg+6HC6IUqRqNs8n0
	GBBrjx8sE0BD7/s8r/oCele+wzSGZ4+BBz7ITav5ThvcKHjpeoThxGKEMnoCWnno
	f4jU/2+WOMQVd3PSbEwLFcPkCenqJOkm3mnbzyZOs5L+32WHTofU1mFO6rPFFirY
	6MCcodIEUMc39mjJcYSr+K//Od/w8n5KaOc9+IrOBEMFShGh5cuLCWZnNuNuTxLn
	/Z4G3rL0l8yqtApAXs/g==
Received: from bn1pr07cu003.outbound.protection.outlook.com (mail-bn1pr07cu00306.outbound.protection.outlook.com [40.93.12.6])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sbwg1hd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 12:53:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sc96dTYH9NIQvJJZloYVYgwJGt2C8/glLEExQ9ldaBqsUCq5zThPeyYp2GVqbbx0REgKA5R5g2Qnh0DqSPtenDXZ9Q3qglhmRE7E/ai+PKJJZExidf1Z4k42AsSn41knr9bJ14Fsy9+GSFXoMblC68PiaKEVwyYaAkUMessY8H/ywTch5jBVfByU7Zmc8VN2scaHGHUkVEkKbn+AjaINE8ZNy2hs2l2X7OZH0kWKO1H5gluYNfPvSLQBTaxsMnvjU7OKfzK5KNLLOTCy2n1vDn0+xxiO6HxvKsHEKBg8zmWTyQHG1zwmpMNM1t0KC77x7kHKlMGh/c6OYI+65KUlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ar9ZcJehPBP6heXnOvAX8L7UprmiwU9e6ZOMhiOra1Y=;
 b=nSEZcvlDv7HfbNqQ8d9QXsGPZjz1P2Ti0yfLgOUsdDcRI5U+e38tRu6EmaaVwiI1uPHk0H7vq4DMLws1gdIGdkIEdPZlhZcrfoLmlhDJpn8v6ZVjXnD4M5UlteWMYYVbAprQZHRzjJ+wemX6uhPjcsUHrphIN/6uN0m6Rtfkl4k29D+/pR4ObG6WV7yrMRn+dCbvlDymIs+lxFKQp7jTqgZy04rEgtJzEZTvIHRmNWNxIDcU9CbmnhhP/XEEfdfeReEkvb0eaCtx46tZ8xlyp9HHE77zEgFekyQKSgo2+Rhv2bpxOMgNq9RwhYmlXRWzIKrKZdFCbvFGSd6Jn+NkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by LV3PR02MB10761.namprd02.prod.outlook.com (2603:10b6:408:281::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 30 Mar
 2026 12:53:31 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 12:53:31 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: "dave.patel@riscstar.com" <dave.patel@riscstar.com>,
        Samuel Holland
	<samuel.holland@sifive.com>
CC: Scott Bambrough <scott@riscstar.com>,
        Robin Randhawa
	<robin.randhawa@sifive.com>,
        Anup Patel <anuppate@qti.qualcomm.com>,
        Ray Mao
	<raymond.mao@riscstar.com>,
        Anup Patel <anuppate@qti.qualcomm.com>, Dhaval
	<dhaval@rivosinc.com>,
        Peter Lin <peter.lin@sifive.com>,
        "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>,
        opensbi
	<opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] lib: sbi: domain FP/Vector context support for
 context switch
Thread-Topic: [PATCH v3 3/3] lib: sbi: domain FP/Vector context support for
 context switch
Thread-Index: AQHcwEQ2Gs3lb9t5N0++nQ5DNF8nPg==
Date: Mon, 30 Mar 2026 12:53:31 +0000
Message-ID: <DHG4R2Y751XL.23KZT9EJ35ROS@qti.qualcomm.com>
References: <20260327171601.169103-1-dave.patel@riscstar.com>
 <20260327171601.169103-4-dave.patel@riscstar.com>
In-Reply-To: <20260327171601.169103-4-dave.patel@riscstar.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|LV3PR02MB10761:EE_
x-ms-office365-filtering-correlation-id: 593d170f-fc8d-475c-f941-08de8e5b58e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: usRFov9NjaMNEsXlPI25qSskuqe4oTXd+Yd6ajHwVwqsAHKvpY28HUkazasu68gjV+B32uRvgoJFhtI88HXsm2tYOP7HOTRkXaDnpPgYr7LZOcBDvC4ScvW0G9CFRv2hqxLID5PRlCvAU6IbNVEUpq+cTmb6w2fiutYeHAG04foQ9d9zMDLCuyZfs5wDAAWu5d+B0Y0kRfeGmcTxYQsly1dBFrvjUcSjT0LZNU+4saGUKrLmUdAMJpzLQJNkX0lOt3KgH3OqpAJ0/cbk31p4lVM/ihXoJXRr47ww7T5vNejexu/Jv1O3bccLWGjYG1UlmuLJ6Dv8OGyb4jHzkIBQA928Mk0tyyjh48t/DQDsradZ2RzM5oAFzZktJZSR6ySPmvvok96Bc2l7X44VRSbroNDykr93uuLjHDAOpSVIvlseV8oIu473Aqe605ThEY5KhD4duZLKEC6h4ctZiJGdni3YTV1Bj0nK0XR4YH3fBuf35xy4y1uAyxQOEKmoGbTSeVYCKsiRkHfXL2J2Ps/4VtZgA9AJuPOz7Ge5vvMjszJTN0oe9KFmTWZGbXoC/7dnKs9UI8wS1W370k7RDlkj1b5qknE7oV1+ddY2qcSStZVKHUDFErYzxFVALeXW8rw7rGng4ToHL800OsGnOIMlyNHDbS9zShPhE5JdGfud++VQ6uBWkdwVZmNegDaQ4qQeEflhFgG/f8HZdTi865KlBP0ClUEMGNKKehBJHr+6dOYNkICJ/HDKH6PJEmXuo3wi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTdNVzdHNW5TbWFXd2JmaHVYUElGS1RucnZSRWRrdkpWSHB5WXNFRndlODVu?=
 =?utf-8?B?Z3lRVnY1Tkdhdk9EcUZ6dGNSUzNPOHdOUEtZTGNvWGUrb1l4Y1V4NDg5ME9J?=
 =?utf-8?B?cWRtcFY5UGVvNGVkRHNycm1OTG9taVZVblNkNU9NWHptdDVvK05JNXJrdWdy?=
 =?utf-8?B?aDRFSzNRb2hQbnl5dmp1SGlIUCt6U21jNEVWY1ZlbU5uSjBRVktvY0J6T0pD?=
 =?utf-8?B?c2UvcUZ3MVgrOGM5MzlickJPSnZuUy9nZ3p0SFB0NDBmZi9HcDJNUGJNazds?=
 =?utf-8?B?T3RyZkU1cnBRUTF1amplZXpvS3NUalhqNGtvaW1BNmMyZkxER1VrdXFaS3J4?=
 =?utf-8?B?VGZSanhua1MwT2pLVFZnb21YWG9hUTZyc3liK09BMkVEWW1LUXhhdEJFMHZn?=
 =?utf-8?B?YXJUWW5pdDR2S0xlcGd3MEpienlaZDdtK1hsUWREak5saU4yQWkvai91S1ZM?=
 =?utf-8?B?QUNONk02SE14REVTUjZRVUJ4QXZQMjRFaU1GR3VySnV3VTFqZEhZdzRIUldp?=
 =?utf-8?B?TjNMcjY3UjlCWGVGaUh1d2ZxWDlva2lTN2dHK2tUSVVBUkRTN3MzeXI4MkhR?=
 =?utf-8?B?NmtVVXpRVzVlY3dMS1JmNSthbGJWcUFHTHExUVhyNk1JMkRZQ3dNeGhQcEZj?=
 =?utf-8?B?a3JyeFF6NzVDZUp5ODFuS2Z2UmdoOGg4MGxwM3FINTIrZ3ZMWUdTKzJhSDhp?=
 =?utf-8?B?UWlPcUk0bGE1cFljRk95MVp3TXFGUGl4bm9wekZvTkI1Yy9rcys2bG1SYnNC?=
 =?utf-8?B?alhNaUVyUlhGczVDcXBBTk0zR1NsQVN2VDhZYTMwYWJVeW9HWlBSUWs4QWY1?=
 =?utf-8?B?UXUrdXdOSE5HREhWMlRsWFFJUk9XdUFPWlJISXFsMFhWc25KV2ZXYVEycjlW?=
 =?utf-8?B?bzBUeHRaUHdwdkxXOFZYV0pxYU1oRWZ1Tm9jN0NYSUI4bjZZVzdiekNGem9m?=
 =?utf-8?B?NS8xRUJNb05xMHRlTjNMNTRVY0dEZTN2Z20yVkhVdm1KZTIrVk8yQXZCWmVV?=
 =?utf-8?B?blIzK3JGVjNYYmF0My9OcnpRU2RJTCtjSVJyMTJPb2dCbUlGMm5xNmFNc0xN?=
 =?utf-8?B?b3U5MVM5K3hILzYyV2ZtOUJveVNHdUdTeVNFVG1mQjdMbkZsZ21NOENuZVU1?=
 =?utf-8?B?d25sa0I0b2hVRnNCMXJFSU10Z1hzdjZqSzJUOWt2b1dOdkd5YWk2L1Y0bHBp?=
 =?utf-8?B?RnF6U3pJdk9uY0FEOHNFcy9qZkJpZTZrY3pGUE1qZ3hiUmtERTFnUDNrc0tY?=
 =?utf-8?B?SnFaNmc5Zm44QjVzeFZLNGw1d2p4SWFGMCt5bmFTaHNTT2NmSXdXdURCZGlt?=
 =?utf-8?B?M3lTcUpRMHZpbVlqQnJ6UEhGUGJyOFd6a0ZyNDd1RVE0dDN1SXNrRDFQb1cx?=
 =?utf-8?B?Q1lwVGg5ZDZKbmtOSGZKSlBsbFFFVHJTREt5OU1VOU01c0V2ZndTUksrYi9C?=
 =?utf-8?B?cis5QmRsUzZFN2J0aVFqczBMSDR4N0YyM0JhOXJVYUtBK1ZVUDFzZXlScVN2?=
 =?utf-8?B?d1cwMXE1aEhpeE93MjZ3cFU0N3JJWXp6RVIzZVAwQTRxNzdveGdZdjhUeUVM?=
 =?utf-8?B?cGtycjd5Vm9sM2lOY3N0ODhlRDlpNWxrVE5SaWtSb0NJRURpT3V0N0VQTmtN?=
 =?utf-8?B?dFJ6ZGRIWWVmSHlGS3YxSWR1NC9IMGNiZ3JDdVRjNVR0cW16cVluZTBxbVE5?=
 =?utf-8?B?ZXlDSWVva3ZrZDZTUnVMMWVCeDRhZEIwbjFLWXpLV0xJbWF2eDY5NGsrdmhN?=
 =?utf-8?B?a3VzY0dLclRQUy9MaFVaK04vbWZicjNJVS8yTE9Ic05UOWNrTGEwL0NvZTM1?=
 =?utf-8?B?azFzaVJubWNTUkI4SWFOek8rMFg1b0VTWXFldEY3aWdjak1rWUxxRWtUdThI?=
 =?utf-8?B?cTlVUVZYcURET2s5dWE5WWh6MzFXRzB2eDU3Qm9jbXBHV2tXeFlFV3czaTBN?=
 =?utf-8?B?THdtSGFlNXlodHBuT3M2RzhnRnY4a3Z4RTBLK0RYRXR5TFBkTi92ekJkblpT?=
 =?utf-8?B?WFdXRTBjVEU4YWJ0SWppWkIrb2FCZTl2K01vNnN2UHJkWm51Tlh4aHBmWVdB?=
 =?utf-8?B?Y3gvQVd0cFV1R0JOS2FFVTJnL2NIUEFSY2c4dkJXcFBDT1IxSnFHekVRcnRq?=
 =?utf-8?B?QXppc0dYMFdQNm5uRWw1NmFHNGR2OTBITHM2TTBMUVk3Uzk2RmVicUdhYUVW?=
 =?utf-8?B?QmoyVXg1UnRTOWJleE1DTlU2MFhyeVBRL2RBU2wweWZIZGRJbjdXNjk1S2ZD?=
 =?utf-8?B?KytuN08zRjEzK2I2bXlhRlgwVlR5NlgyMlM2SStQQVVaZlIzUDJ4OWdLUVEx?=
 =?utf-8?B?bHk3aWF5RGFNV2dpVHA0RktvUlRBMVZ5N2dJRDl1RFljUkVGeDNxZTBEZldn?=
 =?utf-8?Q?5xAcF+INY8mqhC6A=3D?=
Content-ID: <10C55C34FE816B458618EC5DBBB759EF@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WT0McgtZbsQH9E31GdRY0CPP8JzQJclVP7BWtlfT4LOtPO+jZEwu3SJ2BbD4/a+WVTrqn7viFDCAoJPN7RTjK8IcZtJhkzRpoSOCxdm2BP2/L56HWYeBn5uDoFY/kGV0dsxZH2lRYhNbfCgmpzMsadsQ2DI3NU5Uhu+0QlIGTaW/ARJFz7lI3TeY0SPeuSS7rtsG/HdZRve5LDusa3JXvbh1Eo5H3nRVrSrNTtfMSQGj5JEMSFNj3c19u+4jftJgSNg2W7ffhG6SZtof1OzZLUgogEvCauFIVGl+sH0JOlSu0PIzPVBJZkHH8MynJNCsZLM+agOdr7sm0zo/LAWDIA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wCe+c3yJH9DgmsZrEmUUpYjXCtT1WHmI8TZbjlptvkCYFKZpbs7ULwq/f3u1kIcovfx1RecNS3YC+B65cH3xaAnNv+W3f3zF9fYjjRlc0uUp6VrvTQJdK+oHWTsb+bt4ppE+F1XjEWPtkqiThF5bqpNhNB4KBnGWqZXZwz1bUGhDgY2go+On43275SZhvCZF7XsK80SwlJouV0CIzf1LDH4qbvBice3yl9v0Jwo4uWojmsWlsqy4eRKQa9+Af4sRFBnM4V9tMvmlT5r5H/r/GhkG0vcSbUDmMqhyW3oXE8qsgKis0djQGw4Tfw5Rj1ZCY2PwuYvqGI13wgrTDxCJQOV3a21lAz2X5fFGMvsBzUqDEcTgUxbyqWj3cdUUW+ub9sHHCsjKVhC/Azo5CYtKXulAT89bLjuDbCnNb/HiphNtVb03DcXgUnWdGCqR1LP9qyi5jneLmBgbs1H3c9xMa6scZKXyYnrvH6Bh9iiX3P8sGWhRnJXTnDdTjQJakuowCBMJ/C9DzlCAlki17/CiO84/SfdwU52ScDrgG+idoGulddKwZHrgIKZFuD7o7D09IsipniJI/mH/jTMAUP6bo2awz38sxyGt9HC6Q/KYDKN53Bb9feWQ/ZOx/0SLyhew
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593d170f-fc8d-475c-f941-08de8e5b58e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 12:53:31.7118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7jMiY8I7Wzn34VjnHd7+fuI83ugs0OmRmososkM2nl7SLgDaNGXCE8ufmDXlH/7dSb1xMrc5+hOTiollCzyKxDCoKLFXpigQ6KABnoFkDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10761
X-Proofpoint-ORIG-GUID: xMHNbxq1slc3MKjs5dYHp-pt0N1SBONM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMCBTYWx0ZWRfX8X9/aX1SEH0u
 fVvUhPjHfXKaw/dEIIrX5G8aB89vVJkm51RQtxDkUObpKuFavEmP5GbHCcnkgnlgUYP0obTuMuV
 l0ue5qhEsoP0+VqIS8fUHd+qISd04e3+2MQGCFEyXgnT6pUpggz2vV8dJZSp8BvBivc2aduaETQ
 Udnmr4z1XyVmfTbocxyt/eORn06s9LOp/ZG0f9qseCDPlcmrOBrGeinAcqvs9Js1eL07qoTNWK6
 tj9mr+2mXgXXeSAv24I7+EGumwj0OfbNKBGQgr/0y95LLrYQ4bbj9ss+QuUnfpWWs3OOEneGrUn
 k84pEe78Tlra+iYQMdbg+H4EXULUUjkvOIY4lELsu2wLBvHw/X20vgmflLmY4TEP4yVma3IiyiS
 Cm7fGZ571kyYZuthWYav3g7zCphlqfP+/IU96SVxJjDGraeuyDjRkfZKJfZiwjeC2uNe3CeRKhK
 t1RKvpGvMGlumHVNLBQ==
X-Proofpoint-GUID: xMHNbxq1slc3MKjs5dYHp-pt0N1SBONM
X-Authority-Analysis: v=2.4 cv=TIpIilla c=1 sm=1 tr=0 ts=69ca724f cx=c_pps
 a=vyniI6In/5XBr/U1JZq+ag==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ee_2aqc6AAAA:8
 a=_LeZpq9ciq_9GAX7030A:9 a=QEXdDO2ut3YA:10 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_055336_209165_8988AA5C 
X-CRM114-Status: GOOD (  18.95  )
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

2026-03-27T17:16:01+00:00, <dave.patel@riscstar.com>:
> From: Dave Patel <dave.patel@riscstar.com>
>
> This patch adds proper support for per-domain floating-point (FP) and
> vector (V) contexts in the domain context switch logic. Each domain
> now maintains its own FP and vector state, which is saved and restored
> during domain switches.
>
> Changes include:
>
> - Added `fp_ctx` and `vec_ctx` members to `struct sbi_domain`.
> - Introduced `sbi_fp_domain_init/exit()` and `sbi_vector_domain_init/exit()`
>   to allocate and free per-domain FP and vector context.
> - Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
> - Updated `switch_to_next_domain_context()` to save/restore FP and vector
>   contexts safely:
>     - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
>     - Restores original FS/VS bits after context switch.
>     - Adds NULL checks to handle domains without FP or Vector extensions.
> - Updated domain context deinit to free FP and vector contexts per domain.
> - Added runtime checks for FP and vector extensions where needed.
> - Corrected handling of MSTATUS FS/VS bits to avoid unsafe full-bit writes.
>
> This improves support for multi-domain systems with FP and Vector
> extensions, and prevents corruption of FP/Vector state during domain
> switches.
>
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
> @@ -217,6 +217,10 @@ struct sbi_domain {
>  	bool fw_region_inited;
>  	/** per-domain wired-IRQ courier state */
>  	void *virq_priv;
> +    /** per-domain float context state */
> +	void *fp_ctx;
> +    /** per-domain vector context state */
> +    	void *vec_ctx;

Since the domain creation fails when F/V state cannot be allocated, why
put the structures in sbi_domain directly?

> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> @@ -143,6 +146,37 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
> +    /* Read current mstatus */
> +    unsigned long mstatus = csr_read(CSR_MSTATUS);
> +    unsigned long new_mstatus = mstatus;
> +
> +    /* Ensure FS is enabled (not Off) */
> +    if ((mstatus & MSTATUS_FS) == 0)
> +        new_mstatus |= MSTATUS_FS;
> +
> +#ifdef __riscv_v
> +    /* Ensure VS is enabled (not Off) */
> +    if ((mstatus & MSTATUS_VS) == 0)
> +        new_mstatus |= MSTATUS_VS;
> +#endif
> +
> +    /* Update mstatus only if needed */
> +    if (new_mstatus != mstatus)
> +    csr_write(CSR_MSTATUS, new_mstatus);
> +
> +    /* Save current domain context and restore target domain's F and V context */
> +    sbi_fp_save(current_dom->fp_ctx);
> +    sbi_fp_restore(target_dom->fp_ctx);
> +#ifdef __riscv_v
> +    sbi_vector_save(current_dom->vec_ctx);
> +    sbi_vector_restore(target_dom->vec_ctx);
> +#endif
> +
> +    /* Restore original mstatus if we modified it */
> +    if (new_mstatus != mstatus) {
> +        csr_write(CSR_MSTATUS, mstatus);
> +    }

I would slightly prefer if M-mode entry always set mstatus.FS and VS to
Off, so M-mode couldn't touch the state by mistake.

Here we'd temporarily allow M-mode to manipulate the F/V state.

Before mreting, we would restore the mstatus.FS/VS.

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
