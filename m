Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0588E7DEF5
	for <opensbi@archiver.kernel.org>; Mon,  2 Feb 2026 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+Q3EXUNM/AdSQ3YtEqKSw0z7nEEdGEWcj0XCD2yyFE=; b=3lG5I9D7p6Oyem
	1MU/IwGLVJy2zCI9eAXrjhuL0iIH7qDlW5mBcDyyo6EGRa2fp6Q84kds0I0DwvW7RKn8+7siejNEj
	f2W3dI4T0fAJ7UcIViuBKoywOVRC5GNQmOv0+LjyEdKQXrv4A+Nl5FviNHcg/8URfaBf49iPdtTzK
	TNxHNqck7Sqao0FAujN50rgLq0ghfwTDyqlhd/OwlK93mUxL3c886iFWr45eZ1ILB5St/jyMJO1Gy
	3MQP2NHzYR1GneA8zU5kC2wU1SgaDYYkBnjapMymDRXwQ+jmPevDPtTkvKTsQy5ZR8Ibxt4zpufka
	0SqvpNw9wK0ufK2verAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvp2-00000005BfF-26i1;
	Mon, 02 Feb 2026 15:26:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvoz-00000005BeV-3TWw;
	Mon, 02 Feb 2026 15:26:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612BAGF03082684;
	Mon, 2 Feb 2026 15:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=oSQSLHyaJiCrxpTSs3bTXdvdWvyCOanYl0m27KsxSjg=; b=JT
	its1Mc1723dxUt3Leh6y/Azmw+KquDZisDtPx6sRoDh9+60aTxX6RlMf1nJvDcts
	N6VYu42u6PjgeVULNZSrI1koHfR5oUhKeooFEko9RBMtu7wOxFM4rOrKOm+RlC2k
	gKqNQ1wPq9WyCmFdmhXLCyk2uwKa0cMcXH4Ry7KLd4GF5M7sW5qcBfk+PJBjZ4dB
	Tw0UKMs89zHpzpfFQdOMJ7oc2WY2Jlz6MnuzIf8H+iox27Xl2havtTP2TV6Ug5nM
	V9mSmmQFleQ2dX+coC2MPEaLEGgKXzxoQweOb12eC/0EuPt8Ni4HZAdaTUpd+r6X
	BIryuMwvqKMUMrKEbaRA==
Received: from bl2pr08cu001.outbound.protection.outlook.com (mail-bl2pr08cu00107.outbound.protection.outlook.com [40.93.4.15])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2ttn0q7a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 15:26:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3lapjy/erXnqZgBCWv5umU+Leq2GQOTLJBfg23eTaWOdQMSUbhGLqPsu5JGilQduiA5jMATIj583NBIue320RWUXCn8zpog3Mkb545bpx9l9iXPIzbiwRyXE6MeRWvtQpPgFHfOu/rBAEpznMJoINnKoun/IBdtECiGHSOG7AIaq0G/CEGWkjAZk47PD9Gp83fySdTA1AbzmB+hl5Ve4CB0gMvPpp7iT4rMfMxv8iao8POI071sysPg3l39nJm1DzOzo0fpwmQEE+U/N/QeZrWtJ1/SpwxSZ4Wq9NUM5MlYWu4qx9/lFyAvNHUfHa1HoFOXQcutOmoB1M5an++Y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSQSLHyaJiCrxpTSs3bTXdvdWvyCOanYl0m27KsxSjg=;
 b=XuJqxjE0NtNvVPhVxQMdInLb/bdFfMMievomRy/DHaLA6URkW73aqAyEGVL7VA+i+H2Cd1IQP6yX5dHTysSYkxcvqpN+qQAksI5Es9/RUxuenWt7kNlg/LSVqoz5DP8P8ahUMvBBHZaS7kp+cRpirApjbH6l18BV6a0iEdNxT/CdquTj+DqFFvaGwkGOZjFj16ZOHaJvsqNN2QHe8IKOikbI++rVRf21EkRaMR9RIYhKhSMPs+9Fro2GyI9/l/gjXA/YXtDg1IbADyUcgIZeGg61V7AivgCLYvdZxhnFgp5u33ncPJJdhYHrKqaZu7O47tBDsh5lIQIRmPGvPBuFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by CH3PR02MB9784.namprd02.prod.outlook.com (2603:10b6:610:17f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:26:34 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:26:34 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Nylon Chen <nylon.chen@sifive.com>,
        "opensbi@lists.infradead.org"
	<opensbi@lists.infradead.org>
CC: Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>,
        Samuel Holland
	<samuel.holland@sifive.com>,
        Yong-Xuan Wang <yongxuan.wang@sifive.com>,
        opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH 2/3] lib: sbi: Enable Smrnmi extension handler
Thread-Topic: [PATCH 2/3] lib: sbi: Enable Smrnmi extension handler
Thread-Index: AQHclFhQEAHRT+5RC0+HZekgOYpf+w==
Date: Mon, 2 Feb 2026 15:26:33 +0000
Message-ID: <DG4KXRI812NK.1R8OG8O0MZ5A2@qti.qualcomm.com>
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-2-5d297d3e2027@sifive.com>
In-Reply-To: <20260129-smrnmi-v3-v1-2-5d297d3e2027@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|CH3PR02MB9784:EE_
x-ms-office365-filtering-correlation-id: a179c5d7-3479-4cf1-a3e4-08de626f72c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RWVSTnBYcUJMamZZTi9VUkdqR1FLY1Fmd3YrQ0VLTmtNOUEydjR4OGx4ZUwx?=
 =?utf-8?B?WWF1MlZhZy9IbGZ3R093Rjh0b2VzaWZUUTYvNFV1c1BnR2V5S21iMDJTMG5Q?=
 =?utf-8?B?K3JZWDBlemN2WW5UU1hVTDNaZ2VIZ0lhanZqVi9FWDI2L3MwOGgzR1ZrMFVK?=
 =?utf-8?B?UEtHUmliaGtYRENBSHArdUN0eGYwYVJVTSs3MTh1L2pSRG92VWNtZWkydzF3?=
 =?utf-8?B?UENuK2tBWC9wN2g3ZWltOHBqNmRIVW40dEtRRnUwQUdtdU9nb2xsbCtnVTd2?=
 =?utf-8?B?dzlETnkra1diaHMzbzhsbG5Td0xEUFF4elNvYi92TmVjVVBuV1B2ZUVIVSt4?=
 =?utf-8?B?cXZIMWFQdFN6NDBsVytRWjN3MXlCeG1RSHd1bFFwbzYweEVRam5WSzBKbXIr?=
 =?utf-8?B?UGQvT3dYM0ZNT3ZaOGhscE1aZlNDSHIwQUQya0IzM1pJL21QTkZhdFk3SFFk?=
 =?utf-8?B?SGhqRGt5dzlVQnhQdXZrRmM0QTFsZHZ1VW9jUDlOWTNYNWVCcXhWbHM4SEtB?=
 =?utf-8?B?VkpKdGVHWis2U2xISjJ4ZWxncWUxVmY5SlJtWDVlVHA0WWpBMVdFNVp5SlNn?=
 =?utf-8?B?cGxjQUExU0MvclI2c3Z2RUJjTU93RzgwditTRkVpa2J1aWhyUXIxMXc4NW5s?=
 =?utf-8?B?ajBFRC9oYzlFako1WDZhckNrVys3WXJvNGZWWEJjR1cvcE5pZTBwV1lnaEx2?=
 =?utf-8?B?KzdQOFhHREVvSHI2Y2RsV3JNYmxrR2E4ZXFhZkVqZHVqN1JJWXJlTlZtL1Fq?=
 =?utf-8?B?eFk0MWFMZlFFZURlMDFwSExuZ3B2eldKZHlvcEF2Wnd6QXVIUVdnRmlJS2Qz?=
 =?utf-8?B?ckVibTAzNDYyV25mek56bk0yajZIblNSTlkram9GeDVmalg2ZFNEdjl2ZUdF?=
 =?utf-8?B?eEZpeHBOQzNkL2Fnc3AzTk1CU1B6cU9aMk5MQUhoTXNtdDNSdVJLSG4xRkVN?=
 =?utf-8?B?bWxKZzFmYUo4RTNKZDdzSGJLc3ByRHRpeDdLb093Z3d5bExEcmIwOFdrRWtB?=
 =?utf-8?B?UUtDS0Vqci9HSVJaN3hmaTV2d1hMYzNBeTdmSzdhajZBTU0wWjg2R1RNZFdT?=
 =?utf-8?B?cW56ZkJrWmZEejlFL1JQTkhtaS92Q1FMU3FGbjRXSEdNTTZ4bXRaa2EzSmts?=
 =?utf-8?B?dnBkREwwOGdYb0JqczhEOTNyc1NzSFRPTmN0NnVHamhGL1V4bnpOTmR6anQx?=
 =?utf-8?B?K2pTdmswZUp1Zng3MHhzQStpVlcxaEMwckU5MFNieDkrc1ZCM3RYM3V2ZWsv?=
 =?utf-8?B?TE0wNXlEUGdlLzQzT3FQQmR5WlBVbU1Kem1FNzg2VlhuUS9SdEZKMEIzaVRJ?=
 =?utf-8?B?bmk2dFV4c2lyUHQvZ25ydWRYZFF6Tm9NeCtucWlXeVl5UE9ZdGVpNnRRNncw?=
 =?utf-8?B?K212c1FsYWdCWFpaUEhYRm9WVGRJYTNiN3k4cUNmTTJzeGExU1J6L2k5SzNh?=
 =?utf-8?B?WTZlZU5BakwxT25OeGhReG5nL1ZhK0lsYnl5S0dlaFlsWE94ZkpGKytWa1Bq?=
 =?utf-8?B?dzRtRDBkRUxUaXR1MFZlaWF0cWZmOS9tdnZKSXZoNGRHRnJyQzJaU3pqdita?=
 =?utf-8?B?dDNVMSt5M0YxWEVVNUVGRldmZ3lZVnhsYW5UeG9aM0M0ZGJtNkplM0Q4R09C?=
 =?utf-8?B?Q09CczBnVWIwb1BnNnNVSnVtTmZFckhQT1FjZGp4Wm5waytjZ0RRSnozZDl4?=
 =?utf-8?B?ZkhNU3lYZlRpcVJaTHA1RHFQSVpKZG1JVEhrMXprRUpZVlhjV0dRbUdMaVZn?=
 =?utf-8?B?THdjZjBKdmp1RGhNWVZZL1g2QXpZS29KS281MHROYm5ybXdUS0NCVThzR0wx?=
 =?utf-8?B?Vml5bm5QbGlLOXFNUnVvbUNxTktzTVhLZEE3dUFVWXNWTDBoS1JlTVhhS0J5?=
 =?utf-8?B?M3NYdXVCejNvbWNXQ3BkaFhGQWNDaFNLUUNvejNDMzBNNjV0VzAyc3ZFNER2?=
 =?utf-8?B?U0VWRS9FU1Y0Tyt0cWhmRUVNRmcrOFF4M1RZSlg2Y3JIM1duM3YyZFduM0lz?=
 =?utf-8?B?QVE2M0szRWN0NlU4Tm1mcU9CYjhCT2RIazJwbFZXaExNbHVTNWNkcC9GeWRp?=
 =?utf-8?B?VmYvTHNsa0JRS2Z0U28yNDgzaHBLZnhCRUtDdDlGT2VxakpnMEdRUE0vN0ZB?=
 =?utf-8?B?aUQzVmJDSG9BdGhaM0JnQ1h2c0xtUEJnNUdldHB1VHJyRE14dU1mK0FRcHY2?=
 =?utf-8?Q?c+LL/lVntfiuV1Z8RuAOsS4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MURocndFU1lobVlQd0hNdkdFSjhDdmRsWXM5QWpBV0JkMmpUdnBxclBaaUFT?=
 =?utf-8?B?K3RuMURXa1pRSmsxY0xjRVhIYjN6SlRPN3RyZWZOQTdKenRqdk1ndHlUY1R5?=
 =?utf-8?B?YjZqMUlYVzF1MVZGWXV3QXF3MFpBQ3F0OHNNSG9DLzJSTkVGQkVhRnBVWmdO?=
 =?utf-8?B?R3R1Y2ExL21zWUthaUlZZy83bVdXMnRWUnlHMzF0TkxmQk9aV3VhVEgvblNV?=
 =?utf-8?B?SEFLNk1BQVdqY3RmLzRiRTRLeHdRQ3NZNllyaUJrREl3T1gxWFAyS29yODdU?=
 =?utf-8?B?L3JKeWlpb1pJcDFwVFdLdUE1ZnV2bmNTdUNFY1pkQnEzUVVhQk85OGRYbnlL?=
 =?utf-8?B?TnRjRFErUmNzOStxeXdsT0lEaDdPMTA2blVTa0gvWkFpOWpKWWtBR3RRdFVt?=
 =?utf-8?B?bU5KT21hUmRKckdOYUJCOVl1eHpHODhOc3VwQVBkQlhaM2wrVmlHZDhaYUNq?=
 =?utf-8?B?VlVsZHZ4emlrRld0RCt1b1FkaWdIV1NIQVVPUDNsMUFJWGVyeUJ2T2RTQWRK?=
 =?utf-8?B?WURHdjhPaEVLcDhzSHBxUThkakNCMTVqTE5UWXdTNThCNkM3S3J3bWZncjJp?=
 =?utf-8?B?WFltVVJrY2RlWktHcWJXL05YY0xmbmVHSkFOMHFCUGVqU3RPNVhNMEkwczRE?=
 =?utf-8?B?ZVhaZjBkQlFGK1llM29JSzd4VkNOMjVEZ2JwNFlTZGd2bU9TR1N4ejJYcFF4?=
 =?utf-8?B?ZEdIR3RvMnNuN2tlTUtjd2dyTm51ODlzbS9LeHQyQW5mcWY3c0NkMlhSTGpp?=
 =?utf-8?B?OWRMZ091R0M1TTdUanhzWFRSbkRZVHE5WFdlVlBDMXVQUlFDNGVEdHp4clBS?=
 =?utf-8?B?OXNiV1orTDd2YS90cjFXaTJxWlIybmUrZ2ZQRHhLeUE0NktpOE9GdGRRV0lh?=
 =?utf-8?B?NkRyU3VBc29BYkZPMFBTNjdpQkZ3QTFERER0d1pmaHNMRDBIMzIraVlXbnUx?=
 =?utf-8?B?NFQ1MU1RLzdXaGtCS0ExdnlFQ1cxWFJkbVZEMWxtWVpXWWF6bVFIc21idGM1?=
 =?utf-8?B?aHNVTE5kdk9xSk5oYmxsZ0dxUEFDUmlaYW0zbHMxNDBEb0FyMGZhOUlqV3hz?=
 =?utf-8?B?MWJwWkV1TW1EUmdFNlZvbm43UEt3T3RvdTFjbURaSHJ2dGdMWk1QZUZWaDRr?=
 =?utf-8?B?NWVCZmtiNjFMbVZJMWUzcWoyTDhsMWVaYWU5My9BbjlGYzdKeFFrVFROd1Bn?=
 =?utf-8?B?MU9MRWFVVDlXMHpSYWRTL3RXL3c0QUxVUGw3R2VoOGJNbHZUb2lSQmFjbm5y?=
 =?utf-8?B?K0h0S0QvZHJuSWZuUlpRWlJGOXFlZDZHMSt2UHJ4Snlsa2h6NE16aTJhSUVQ?=
 =?utf-8?B?S0xqVFJjcHE4VHh4V1hSSUxvT3NoMlp3dDlkWE9TQThZMlJJN0ZDZmdLRzRZ?=
 =?utf-8?B?KzJ2VmVtOTdIazY1Q0orN0NMbkJ1MDMvakgwZUdoL0VTbHRGUmxSZEJ3TTdN?=
 =?utf-8?B?M1pmdnQ5ZEpORndVSE0yc3hyRFcxMENBSGdwd3A2MklFVVhaVDBYZTVhbVR6?=
 =?utf-8?B?cGxub1hOTXVtWjNDOWppYzY2Q1RTMFl0Y1pNUlRUV01ic2IrWUlqMW5jTDNa?=
 =?utf-8?B?RU5FREtZNndFUyt0NVNlSE43L0RkRFdFL2t4YW5tTUlWZzRpSSszSDRJNFR2?=
 =?utf-8?B?Mm8zK2xLOUQyVUt4dm1LWDBQenBKT2V5eFR2bDdWN0M0enNSWHhPRmxhSSs1?=
 =?utf-8?B?RlVlZ0dDMWNuTDBvbllxL21sZnNVaVlGS2t1c3duZGZJa2tPWFFVcWxVUytP?=
 =?utf-8?B?RjZHMEN1eG9nRzdOTFBMV1puSmlkN0VzRUI3bUJ2U1RlZTVMamlIQjRIR2U1?=
 =?utf-8?B?dGxTTDY2WVNIZnptc2xqb0NQR1RtRkpySXVya0FIL0tENE91V2Y3SjRCd0tl?=
 =?utf-8?B?Q3huSW5lamtOMUtLRllVZXBOdk1pQU03am9EQThsTVpNb3UxMTVqOS9OYVhw?=
 =?utf-8?B?L252SGJ2RDkrbkVUK1YybUhNdzJONitYS05idlRtcUFKdnFhYWFDQmlISEtx?=
 =?utf-8?B?dm80Sldhb0FBcUIvazgraWtYazhmb1R0ZmtNZ0FvQ2dlSVJLdTZzWlpCeUZE?=
 =?utf-8?B?R2p0MitiQmt6c2I0d1VBeS9YYmFoc3UwK210dlB5dlZ6NkJ6cVRJbVBkdUJL?=
 =?utf-8?B?bEt0VFRHQ2lXcEZiazJaczhaOWZ5VjloeTVkKy9mZ1FsV3k0VXlRa2dURVUr?=
 =?utf-8?B?NE5Wcmo0UkdpYkkzcTdCTGJKWU5lNERMQjRPTVlyKzhPQzUwRCsrUTJkMmlC?=
 =?utf-8?B?K1plbjV6TjUwVjB5aDIxcHVTeWJzZ1FEdGJEVHBFZUpHTTQ5cllwOWM2ak1R?=
 =?utf-8?B?Y0E1djRhZU45SFdJaDVOWDZTd0ZBVC9ZbzRNTTE1UUh3QWdDUkdGZzVWLzB2?=
 =?utf-8?Q?Jl44PLAefr3jq57k=3D?=
Content-ID: <2F59013CE0D3D64AB3555CD6C8C047AD@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cLIn7QklESOxU2K/hWXK89AnwewYxoBVLk20PtEuF0laI1BpGCLkQnlodw4iCY5jPrIsQwpxMil5ZBP0FaNX1qFsGdCKV44XlAVCb6UdElnezzFNn5Mg1P+iMszxown188Jci7KtkXl/u9P8mBHmv7N9C8p5LhUrSCnv3kqn5CETnaAsCZaF9inJq92zpkVxo013HbEh+IHHUPpWZQIXlEDba88hTDgP6LVe3Mls5FIU+2NpmsX3D3XeusPbvt48ZlJOuD1OubcRQWjnBkM4GR1AfuTfc/4Bc5E0qpuXWK4yuTfIM3xwCq+bgKoXU5Z7HX0JFW1FrlqyOcFlh0+Gh0y1HFlrEnZQ/ou3BBu7bP+dECBHptQC8OaCOu9CbrUo4qJP580YBfS2B4QfWOi2TZ2N6ptDwk2MnZ8pjCWxlMTXyyHZhgmb8GGvZmbfkM1SwGIY0PFHegeIleIykXgzpWwYZIs+f7US/4VhVoZPBI0QEtakp8IrxgCsP84iOYTSm/8olP4b6/2x79UUwLFRo7uovUhQlhsHkI6E9svOe+3bzveZGSwXPzVq7bwjTQuOAKBZOLr3NJcImSuN0yx3POQ05tChQwbYp96nA7KOXtftw5qanaQR3Z6Wd7YtN6z0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a179c5d7-3479-4cf1-a3e4-08de626f72c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 15:26:33.9419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuxa7soioGOFM6qJEFMlyCeBGTA1o3Zxjhnsh2QyyQ5TcOwb4XOKXWNgFAXKh0tA1gRub3fhI/p2a8bOiikU/23EWBObgo/V9nJ3B8R3JOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB9784
X-Authority-Analysis: v=2.4 cv=ANnNY0ku c=1 sm=1 tr=0 ts=6980c22d cx=c_pps
 a=5UvfrWK94sNWzR0izgyzGg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pFyQfRViAAAA:8 a=8bligQ45wC7JaJjeJrAA:9 a=QEXdDO2ut3YA:10
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMiBTYWx0ZWRfX9mprzeH3k1M6
 tTO13+xZ/UDg359fuJfbB2EbVistEQW5AFUJZLt+TGKIA3mo9Ga6pmQF9pEpPM1t25DueJG1tYP
 3qD0pi3WyZ1v3x+SvsndfUvXMxikVuqdW7EaIwucNCiYHEzwnIgyXUwK0RdUYS3lEdvt7zMiRBj
 7BEjL7fNYR8rSDRO1vvFXD3wSkPxE/Rk0xZzco0/kHoZ2bwrgI0qA9nHg8LaAymZxC1VB50z6hC
 YJLRCkDQTvx84oVzanBPEVEjWT4ssof5YtLE0I+ii5p56nGA53Dmkr087P8EVX27EdyY/EDc3yI
 eyOMeCzbCTMZ5fbOlaoo++mA3HpesGtQ9F/lvXLFsJOJ2qxAkEWGgvszC8i6ywaB9u/SH28m3WZ
 5jhnmNCCKejR6rmNH9cuDKczBL43bLXknJUoeEMPzUMsxmV7R21xf8+aA+nF13598qn6bOyr+e1
 6w1nI8KvQQDDUq1OfLw==
X-Proofpoint-GUID: lSvtuZpJ500WL-tv6AkYji48audVNxxL
X-Proofpoint-ORIG-GUID: lSvtuZpJ500WL-tv6AkYji48audVNxxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_072637_910682_C1442860 
X-CRM114-Status: GOOD (  15.91  )
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

2026-01-29T00:13:42-08:00, Nylon Chen <nylon.chen@sifive.com>:
> Enable the Smrnmi extension by:
> 1. Adding sbi_rnmi_vector_init() to allocate per-HART RNMI context and enable RNMI via MNSTATUS.NMIE
> 2. Saving and restoring CSR_MNSCRATCH and CSR_MNSTATUS across non-retentive suspend/resume
> 3. Calling sbi_rnmi_vector_init() from the cold and warm init paths
>
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Nick Hu <nick.hu@sifive.com>
> Suggested-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> @@ -149,6 +149,15 @@ struct sbi_platform_operations {
>  			unsigned long log2len);
>  	/** platform specific pmp disable on current HART */
>  	void (*pmp_disable)(unsigned int n);
> +	/**
> +	 * Platform-specific helper to program the RNMI trap vector.
> +	 *
> +	 * The core will call this from sbi_rnmi_vector_init() with the
> +	 * firmware RNMI handler entry address (rnmi_handler) and the
> +	 * cold_boot flag. Platforms that support Smrnmi should implement
> +	 * this; others can leave it NULL.
> +	 */

If the hart supports Smrnmi, then it begins with nmstatus.NMIE=0, which
means that any exception is going to enter a critical state.
The platform must somehow support Smrnmi to be useful, and I think it
would be better not to do it behind opensbi's back.

If the platform wants to handle Smrnmi itself, it can hide Smrnmi from
opensbi, so I think the requirement here would be better as MUST.

> +	int (*set_rnmi_trap_vector)(uintptr_t handler_addr, bool cold_boot);
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> @@ -273,6 +273,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
>  	if (rc)
>  		sbi_hart_hang();
>  
> +	rc = sbi_rnmi_vector_init(scratch, true);

Are we sure that earlier opensbi code won't try to trigger a trap before
this point?  OpenSBI would fail to boot if it did...

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
