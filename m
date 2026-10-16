Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7F9CC6B38
	for <opensbi@archiver.kernel.org>; Fri, 16 Oct 2026 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i86Rz1RtnpciTg7oKd/jm0XZj+0qr4uy2KI6DQj10Z4=; b=cLHRi+GIK1Bc1R
	10yH6VBm7SSNCTDow1HBDd3Fp/IjPtkjvm4ojlRqmlsF1rT7dml2uL+MYigCVrZiL4ROreCJkSsvZ
	2mPAtvwMYND2GHWECKQHDiA3l1u28bdH2UlMZRc+9P+8+UBL+AinhE/WNgqN51e8KUf28obkrBLYQ
	13+Wp4hLZTjj21DVt2zFdZsf/M6PNTIc6M71Z+wX7hhitb+G8feEXK8+2HTyyq+yKiSaiy0BV5Usx
	mmKq7DpjpqqD1pPzx7J6hYzRP+2eJcsN6mCdkpDzFl23ecscTr1duA07wqUsF6xZd+DeMOsr+Nhyf
	jVllTFQHzR7dqc0IewEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlPw-00000003WQw-3Kx6;
	Fri, 16 Oct 2026 17:08:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlPu-00000003WQT-1zve;
	Fri, 16 Oct 2026 17:08:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5htj3506073;
	Fri, 16 Oct 2026 17:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=Jwsnc7If3zoT9HJtKr1aecCaiqcTdqtpOhF1mqPvkhw=; b=dP
	QHxcQQ++obk7tFK/GNYCeOCr6FoVxg5STJ0wZprGH0LzpiLVbTHRQmcBp1Rk+2Pt
	cH6KLhj+lCxnEIWT4Hsp04HTSUuxePfk1x0ituSHBfw8o//CEwrISiFBjshg2Ro3
	7ku/WvyNNHYLfk6p0sjKdAWcF4Sh30WSWvQ8l182bHwKEPP6YENCowCUnok3ydlh
	wgurmE/y8D8X76eDcYMINKg4dBRO4nYEE8w1jKB8CD2siz916DA1BOyHzsiVcgFi
	EIvv0ibGL37UCrKwt5TYDvyxoDfbJntbUvK1RtAeKDPUiR1QMe34XERsPt/xNiqp
	txWwmj+Qz6whRiS1d9SQ==
Received: from co1pr07cu001.outbound.protection.outlook.com (mail-co1pr07cu00102.outbound.protection.outlook.com [40.93.10.90])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r13n6f-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 17:08:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbTnc0rP/scqRIeq5NNQkW+VUI53u9WKq5pvVA1RIhhur4bJRrVBbDYWbMI6z7aF03NJlBhNeOZtqg+LI1YtrGGX8RI4eM7Fdtfq53/Hkg4hh3HeX4y7HmMBnYBOewcdCvh6xiQ+AWc9aQph1ePUxMoF2b4kkxjI8fCDv+iYcM4I2gUwPHUqAc6gxj3SoGhcUdLk1jln0PcWoJdOBdKViMVfEHOa2hTqd4X8Y8qOPcOqp5NOnX5bobMLHVEuVlE9mdHJfipjjgF6wsSWX0b3ma6M6176b/Bb3eLMe8rGkcEslREcmYUJWVQqYsIiaklzV62HsCCDCUxT+dkV5WU7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jwsnc7If3zoT9HJtKr1aecCaiqcTdqtpOhF1mqPvkhw=;
 b=Wt2xYKkGKENcGTnEQmnuFalGZl1bIPOBFmy88OhbXEShWyVZ/AlQdGvFbY4l7e1W1/xsvoqoK5tWxzpaCv1HU4KR+b4vKS4wMBh92/m3m0awYE5RUwFL5MK7/IPW6AfMWZrMq1RiT4kiB7JGz2c5vLEWH9ZjwVfUCVYSBeMJ9l/MbMUX/hlXHSQuwJzPrIaF6HH7xcan1IGV855FXcGWjwfYIiiwHgMl/gN0dEU89ssw1L4qkPNozHtFIoFD3ePBz09/84uf79bsWnVP7V3+i2rQ8inydIMapzb03iMYOICLs3EokpT1ipF9jCHaiaAiZR57BJy++UBfXuQzi6ziUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by IA1PR02MB8875.namprd02.prod.outlook.com (2603:10b6:208:389::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 16 Oct
 2026 17:08:14 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 17:08:14 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>,
        "opensbi@lists.infradead.org"
	<opensbi@lists.infradead.org>
CC: "zong.li@sifive.com" <zong.li@sifive.com>,
        "greentime.hu@sifive.com"
	<greentime.hu@sifive.com>,
        "anup@brainfault.org" <anup@brainfault.org>,
        "scott@riscstar.com" <scott@riscstar.com>,
        "conor@kernel.org"
	<conor@kernel.org>,
        "dave.patel@riscstar.com" <dave.patel@riscstar.com>,
        "raymond.mao@riscstar.com" <raymond.mao@riscstar.com>,
        "robin.randhawa@sifive.com" <robin.randhawa@sifive.com>,
        "samuel.holland@sifive.com" <samuel.holland@sifive.com>,
        "pawandeep.oza@oss.qualcomm.com" <pawandeep.oza@oss.qualcomm.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        opensbi
	<opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 6/9] lib: sbi_domain_context: add slwid to per-domain
 S-mode context
Thread-Topic: [PATCH v2 6/9] lib: sbi_domain_context: add slwid to per-domain
 S-mode context
Thread-Index: AQHdXZDtKrbzQtvetUCKyNKpiu388w==
Date: Fri, 16 Oct 2026 17:08:14 +0000
Message-ID: <DM6FF21LWS2G.2ROYH5Q2IQWOL@qti.qualcomm.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-7-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-7-peter.lin@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|IA1PR02MB8875:EE_
x-ms-office365-filtering-correlation-id: 1536c19f-d587-4423-d506-08df2ba810a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|11063799006|4143699003|22082099003|18002099003|6133799003|10067099003|261009223027099003;
x-microsoft-antispam-message-info: YJLZKIt4NNpGG02sGKEoWzs0xp7gc/dP7x22t/KPpajI/huDPm9X2Wjqjk7TndUPhGJGf13EONH5iAEfhtf8/grrMS1tniOmdZ+AFoLKxUvPIrIOMk3prA/POabLAlNVZTUcHOgkfZVn02g4mI09MTaWmXT7PysVJAhAGBfaDQ6Js9jjdTu22ahsKovn3hEhNu3bVeK+spdZMsr0rI/Tk4eSx0EQuy560vOw+L0RWKcnJ3CTmbL6KUEDtMA9jWmRjQOBY3vL4v2POOirjd0ERqV3LckfEabgdgPFGImG6LhVVBxgmzGNN9oqruMm4yGgsHoWFAy/bMkKRxw1O9UW8Kuos8eKJ8WQH9WzmplvE+/k+CiflHymwgRfxPZqa5SfuLasPYCp1q9N8LUXWTg97LHGuSCegUL+IWwbB9Q7npAFo2LRk8oR5T/porXQlNLTg34Grz5mn1uwIo4v9aW5fHuFiC92JbbXdLijBsq2uVhycuyBChkGCqqWCj+oOsyi3AChWDuT+nDIGXSqSkxpshwVjlq2jnIZjKzPfAMQEIr+vU3pB1FQCcpi5dcVtM/EE3bcyuOioGUfYO9EcBlM+zJBbBoVJupPmU763MXQ7n2WpJtgIFKTR11xrS6cCw7nIQb0P7ymToSL6GHORioxfJtrLVoW2qs6zcgnvgFtExKAErULMmmoA1pmheVacafvt3TeEdDogLEzGhPVrYVg3MyaP/L/SN9L8LOcczMBPlk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWJRRUxUNExEbm9aRkpuUXFwSVc5Y1VEWTdvSTVUNUl2L2xEa3J2Zm5IUGU0?=
 =?utf-8?B?dzV4K1UvWVVaa3Z4VmN3a1FvTEw2TWN5TTc2dGMwQTlSckVXL0xVZlR3TDBs?=
 =?utf-8?B?MVY0WEhhS0pmQklPNENoMS9PZGcxcU5ob3Via2pRZDBaVmdSZXEzTXRBV1lI?=
 =?utf-8?B?WVFQTi9XcWdtVE8zVEFwUi9zemo2UEVpYlZNc2lHNEROWnpCbmRaUjE0dUZ3?=
 =?utf-8?B?eVhOS3dsMmxrb1dxL2cxZkxoQVpaNUhwNVJsbUFxQUFyVmhqTTcvRUIwUEJ2?=
 =?utf-8?B?QVBmUnlhdHh5bDFKVUVIb08vSzBDYmliVm9sWWU3OTBYMXRhZ0dSbC9iZ3Rn?=
 =?utf-8?B?VUNlQkpxWWVaZHYzdDVTTnM2NU5JUGI3YTdyLzdWQ0I1YlZac3UyNUg1RHBz?=
 =?utf-8?B?djlkTGVObVZrWnlTMVN3NzZlcXlhYW02SDRLOEJpa05VT0FobGFYbHowMjFW?=
 =?utf-8?B?c0RuVGFyMDUvWGFoVUk4ODdnUUlTQ1IzZ2dRT2R6Zm9YRXFEUDhIOERrNXI4?=
 =?utf-8?B?MExkcEZHWm5hVFJnbEJ3UlZpNkpVQUg3K3RxOU9mdElrMDRkUGUxOUZ4b21k?=
 =?utf-8?B?blgxczFoSy90M0JjNG0vQkwzRnY1bDRQWTFreTY2ZUhJa0xUOEM5T2xRcWdY?=
 =?utf-8?B?SnJHcE0wQloxb09YbDZMdWhZWHpYd3d3dElEVUZuN2ZuTHhQRTFkckpGSFJC?=
 =?utf-8?B?QmNTUmpJM2lQUkdQWDRmUjNBUUxlNFJsenR5VE1pZGg4QmNFWnl0ampTNHdm?=
 =?utf-8?B?R0RzZEZiTTFmRUxibnhJamR4UGFSbFF1a1BZSnh2NmhWc0FxSlB5N3NRcnE4?=
 =?utf-8?B?YkZBQlRMemdTNjRhSUtjMUs0SnVUaUVRQTVoWElUT2RZZ0dnUWVUZkwyVytK?=
 =?utf-8?B?bGs1Z1cwMk9DRmZvcTgydmplTTNHZ0c0TVNWQ045R0hCRGtjT2tHVXRMclR4?=
 =?utf-8?B?azVVajZBK2gwN2JMS2dUWnROUTlyRDU4RjVyb0hna250MXNxSitpMWJrZHFX?=
 =?utf-8?B?R1NJUWxxWTJ2RVVKOEVydkxBRE9pVjduZTVwYzB6WnZrNm5RRUZYMU01d1BE?=
 =?utf-8?B?amV5WDByQkEyZUIxQUJha0h4QXlsWDdBYjNSUlE1Y3BWL1BaSjJ6RTlpSzJV?=
 =?utf-8?B?VFRiQ2I4M29vWjZGSHV5OEt4ZnBoTTJFdTY3dFYrSHZrRzBsbUpDOFlvUDVs?=
 =?utf-8?B?dEM1M01JMHBqNkh3QThsWWt5RXJaY2ZyR3VHUVRsME1oV0l5V21qN09IRVo4?=
 =?utf-8?B?dUViS0VSRkl3ditoWkNsZ2pzSTVJNUorSWVrRlRwaGtqMmJ0RDZ0NTh5VDRP?=
 =?utf-8?B?TW5iUVJEbDVWQUVubEdNWG15YmdjVkdXQWpJU3UrSFhBbXV3SThwdHBRNUhh?=
 =?utf-8?B?RVlRblpadGIwV0VJL0tHQTdJc0pxY1UrMmxleFQyaWR0eHZhYVpjTXl4RHlu?=
 =?utf-8?B?M1NLRjhmNTBSSVJOQkpVMlRwM2RsRTRiWCtmR0NpVElVWkVGVGhsWFhoNURi?=
 =?utf-8?B?bXJ6MnpUUXRPbk9WS0U2ZDdSdDhHOXdPOE1ZYnVUUzcydkxsQ09IZUpmUXpu?=
 =?utf-8?B?c3AxV2ZOK2xzODU3R3VRSFNuaStLUHBxcDBCNzZXdjlMRERSSU81U3o2UVZE?=
 =?utf-8?B?ZllXdHZZRnhaM2VpMWFDa05hUW53T21vWEQyUDd0VUpRbFRSZUtEZG9lUGJk?=
 =?utf-8?B?eUdhQ0x5cjlKRnRNOUlSVEVpa1A4TTd5VEFCamd5aHNwOWFTTXhvcWFxWktm?=
 =?utf-8?B?K3g3WUppMWdtcTZleGFLVWw1eVBORkc5N2hxUiswS2VQbkQ0WFd0SlZNZEQ4?=
 =?utf-8?B?OEE0M2RxYXJ6MmRraS9tbWNOcnh0OXIyd3dveXZCbVRYT3hKQkh4cnB6QjVW?=
 =?utf-8?B?TDEyeE02RDFCbklQUWxMRVlaSkVlS3ZXUkUyZTRwemJ0VVVueVhwMDhOelpp?=
 =?utf-8?B?WlVlRThZQXJFbkZyVG5FWU55end5MjNzMzUxbFZZVHVLaHU4S2pta1pOVHBn?=
 =?utf-8?B?MHk5aS9lY0hmaXhKeGZlekFSNzZ1SzZVZTNjSXlzUVhSUVQrWlp3YnlBeThL?=
 =?utf-8?B?UXNTYXhkejVIdUVpY0ZkTWdNZHA3RG04KzVHZk4zOUpIeUtMeFArZ1ZhRnd2?=
 =?utf-8?B?RWJzdWNDWWlCcGZPREdOaHpyMnZQcUtIRzBIWlN1b1M3YVBxRHk1N0wxR1BG?=
 =?utf-8?B?N3BzdWxxTmhmQ2ZVcGJVdHZNYmFtK00yTmJXdmpKY240NnF2cmVMSzNjR1Zj?=
 =?utf-8?B?UFFCZyt4U0pJRzJtcWJpS21TbkpLZ3kzME9mUW1iallsZFVUMFlQejRsaXNn?=
 =?utf-8?B?RGJleFk2cHdUMi9SdTAzVlltTDMyeWNqSDB6UjhrVUt5eVdJcEpaOFRoekVr?=
 =?utf-8?Q?PwVUvFon2msUCV1U=3D?=
Content-ID: <0A3B5020A6BF494E8F917946B4B20957@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0FMaRZzqqJAKJTjjpaAmWb8xmNuM+PzuIQW+oe4v43aPvjEj43ItYMOgJer7dOO9nCmTcEobiyVEa+ErpQjkpzM6nGmRYGVRkkQIY2vL1X6DP/M6ftEh4YClLFT0aG1VZ2e//atmSBxfXb7BZoTq+wNGKqjOfyac4w/vuzOChtnu/hxhHr3WHVpkCIj6zv67VJYZlsk6gyQJIi9LZMwBZ6gWSABTyrWsRCdOX1gor4az/kCYCXBhUCSfc2bu4IeywRC7a6Mi+CCqJsXFoBDhEMvi5zsD1wZc6x510z8mQpujb060uB3ZDkSLaXKOS/SntqJfrkREl+1OfVHbHE/QAA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UEcwICe7bq59f5zk62uPM5+ULVG4EDrTGvjWQzoi6iVUFYw0J9CHZwIj1DAsDFzDaP7/f6NeD1+1JZY4GoVRgNeP/fhIRX6riUq8vVJwDG5hl6KxjA4arIIHSd0euwtm+fsYlh2bRzULu+xDBDOzVFal9V9W8IFSiQJM4jNKKoq0IH1vXTl09ryBfA3/s3eGj9DaDbVxW5h45skdNBMmjpKcfqyDx2qhK6Lv4CZ2Jrd7JyoTrDzbvK7ZUxW3Vnba2csvc1u5J9azmRUBwAIq+bRlT4X0qhd+zG4idvseYkr+Uk1W0+1axAkbvMExxNjz5a5qVSSp5FlqnxN1UICL2znmrSWVUVxxc+KgZoqHuVgGBeSQlS5ZE1SEbSUUbFTkomat0FyUpeNgk2w1qGw44EzhMETpOJzZUVYPLThV9A/p8b28j5q15cLZDmXj80T8Vw3a5mclMmHFkFZcVY1dGlqdOxp7ir1ej+V1LvDx7eR5Nf/2Rif3xz2hIuLcAaPrjU/yV7h78+sDALyFXwGi3a3PaHCl7/FMFqso07QDhBhEbk39d8YUNtaohYSv7tu2xaW4tqNw3qQZFiBgBTqkmVUNbOpnxFJOf6j1vzJzuYcBPsLWUP0BuZslIcCFMOF4
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1536c19f-d587-4423-d506-08df2ba810a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 17:08:14.3429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gb0AMseA5anjRrLSdH2B1NSvaO7tPDNDAr4tT+y7Cvia0W6C5eM0kFvgI7Vmzf0jAs+TexOjYjRkGOxoThVLWby1q2zKurM79ovE/BX0HJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB8875
X-Proofpoint-ORIG-GUID: cR6Itx0ic-nkhX_G-9UzNUNbTZuKWw1A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX0LLLTitq3ItZ
 oojEZLFHMp/J8iCI3rCyJzOwMY8/4o6CG6xcZU6hZknjCeUIuzWALh/acieQ5SpcOKnV2sYlMxi
 gvebrMv28gIDG4sICkLMW8ZzW2pFR0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2OCBTYWx0ZWRfX0YrLi3DqMXoM
 504vjxxXC+OFdAO8pWBtstnMSj0AKAEw6ESHDElmhhsOc+yvCyLfO/UUJTsN1NM2Bn0AUXnXFTi
 Ng3jopvveQKwTxUjUgTiOwksXSQGEXHY/gFN4rL2+DQRJ6jNrz6mF0ws3SAW4wvRfHBbxzbUgcD
 ktwLu12dUzsHFJL5sefx9yh/wLmJBrfCm+rext83TFJpZDidJSGoNiBJPGL+LOGjtKTuZgzFhBL
 GvfC+p9XeG7d8NFo8fXlz28pSkGax05E4zio/tK0cB3xVQM+xrmnJHikFG3sbrWU6KlmYuKLD9h
 P6ZC/Hw13+Pxvb+h2Yh8nlB9+/9wFSoX3/U23UQJ4HJAEEH+vCwYUhbhIwS2se5XkyJfYoSuWUc
 nmFdVcEIa3VJS26x69Eceb/flyNVJDz0Jf95m7UzoO16wdNseW7vpbsswXadIX002mUmkcGbsSw
 BhTQXLpzANAOo05m12w==
X-Proofpoint-GUID: cR6Itx0ic-nkhX_G-9UzNUNbTZuKWw1A
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad25a06 cx=c_pps
 a=s1B6KbOLKPxgfRSf6UFSLw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pFyQfRViAAAA:8
 a=rTUoJusGLEqjF2Q4VYcA:9 a=QEXdDO2ut3YA:10 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_100826_522829_0A2C5FE7 
X-CRM114-Status: GOOD (  14.22  )
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

2026-08-17T17:05:00+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
> slwid is the S-mode CSR that controls U-mode's World ID. Since
> each domain may run different U-mode workloads with different
> WID isolation requirements, slwid must be part of the per-domain
> S-mode context.
>
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> @@ -145,6 +147,17 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  		ctx->senvcfg	= csr_swap(CSR_SENVCFG, dom_ctx->senvcfg);
>  	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
>  		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSWID)) {
> +		/*
> +		 * Temporarily enable Sswid so slwid is accessible for
> +		 * swap. The target domain's mwiddeleg is restored by
> +		 * sbi_hart_protection_reconfigure() below.
> +		 */
> +		csr_write(CSR_MWIDDELEG, ~0UL);
> +		if (csr_read(CSR_MWIDDELEG))

The slow verification isn't necessary on each switch -- either check the
hart capabilities during initialization and mask widdeleg from DT, or
just trust the DT.
We know what we've written to mwiddeleg for the current domain, so we
could just read it from context.

> +			ctx->slwid = csr_swap(CSR_SLWID, dom_ctx->slwid);
> +		csr_write(CSR_MWIDDELEG, 0);

Setting mwiddeleg to 0 is dangerous, because the specification isn't
clear whether zeroing mwiddleg and hence disabling Sslwid preserves
slwid CSR.  In any case, there is no reason to write 0 here, because we
can be writing the correct mwiddeleg.

To optimize a bit, I think we only need 2 CSR accesses to handle
delegation:

  if (ctx->mwiddeleg) {
    ctx->slwid = csr_swap(CSR_SLWID, dom_ctx->slwid);
    csr_write(CSR_MWIDDELEG, dom_ctx->mwiddeleg);
  } else if (dom_ctx->mwiddeleg) {
    csr_write(CSR_MWIDDELEG, dom_ctx->mwiddeleg);
    csr_write(CSR_SLWID, dom_ctx->slwid);
  }

Feel free to keep mwiddeleg write in sbi_hart_protection_reconfigure,
but then please consider moving the slwid logic there as well.
The current split seems suboptimal.

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
