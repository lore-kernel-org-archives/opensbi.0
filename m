Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6599606A31A
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HZn/fT3t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSdc3H2k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TdMgtye/1Nz2/SrYD2brxk9UsKothvWHYoV77FlDcuE=; b=HZn/fT3tmOviCEPxKSpypEIvEm
	b3g9ev8ZDyT2ocB9N5+LOOjIN46RbuyDdmNDbifM4VAEvN+7WoJZpiZK/WwIxUVwU/rum6LjTvHRS
	P6fmab0TvmEyhiMoNo2ufw2ipG5XlF6A4ZD5CKgP+NASd+uV6XdWjQK6sn+nQNj/56fwsmP1LBCif
	b138wchKeJbCj86PGpkXMrJRfP8iug6B7FCMpJhd6mKL3FlqFocayj7Gru96fNt2JEIOezHwWVN2B
	yrZwfTC1dLNZW7My39iItRzpGBLMqVWdtsGUxcD59U3Hf2XrcFXDzzJQgRU9JwgYyxbyN8ynqlo1P
	UkFaWlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlnB-00000005Xpz-1Ufc;
	Tue, 27 Oct 2026 18:21:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLln8-00000005XpL-0ncU;
	Tue, 27 Oct 2026 18:21:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHnB64035960;
	Tue, 27 Oct 2026 18:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=nyTgIVhChSYNrsTeIKK9un3Dswl3fqVgD91ZTEpCK5M=; b=kS
	dc3H2kg1VfRMbPrZPB6fG9nW3JbtrZY8wc5mSAz23yz2hVaHojAPoXkLOZn/V8lV
	Z+Y/BCa3263f+5IFt47spAAJWjB2JB7QoOOeMwLtY0kL7KXubW+uHjZU59nFnkdS
	IB8wi1G6mmAWw4UbQY0USr1JgNvhvZ2YBk2xFRxPJP4cvOD5JzUAswMACFZPmlAK
	xzoafu00VJVlrVYr9qh54ZvO8XpvaV6sd9w5QAALRKUvk7FZwt69lx1zmSgF8SOF
	Y4naV9Kzh1pCsGr290LItg1DBk+yv7h0CRLIUv1BMxioycEdy+RMEf/cHrFMInuT
	e4kQ+ERUC1qyhjNv8UuA==
Received: from bl0pr07cu001.outbound.protection.outlook.com (mail-bl0pr07cu00101.outbound.protection.outlook.com [40.93.4.1])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjprfun-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 18:20:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwTNCijnpEcuqbyYv8sY0fkEs3DIszdJS1HFB6xxk5W6Ls0fowb7dL7H/d7rkx1RLdK9tdhJZ72uUzz1AbdPD1/z1YLU0TApcQ/CghmmAzyP0gkyovTa4pb7ngQIGCQYhbLf1lG1CqUHnRUDPX9IevbBVwEv0yA3oA74bIhpLuKKc0vb7mvffUf1SUxMyOmTRRCqpL/KqWwa9bmorJUkiWKluSNkr32gZGV4UnKOTYctWbRQX2j7I4tq7N5PhD8oI58kSVnD2Dr+NVfhNP9lrfiNRUWbKkbs6lfo8pSHaxPqI6ypMZTmFfOw72Zh09G8PyxC6myUfP7Vdb307yFtGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyTgIVhChSYNrsTeIKK9un3Dswl3fqVgD91ZTEpCK5M=;
 b=H51n7rlVlUMffwGmvRKm5tH2C22fec5qIv+bwKwKaovaHAHEgqMjPz87TIxT4X9i0x5399S+Vqe9yVfK9tynBC9Z31xx/I7BAohN7X5ozjVdFGseQ8bOJiAcuc/H9hmuCchmI1oStoTswkCfDji2VDq6WZN4s4mZVfaXqWK0SlTRk0GTHMEm8ljJJSOa9f7IbbTr8OOakP4853PWjWv6636NIY2Cu5icRBBhkYZylnAtp3stTYkq8CC5tu2iYuTcKCDqtrMqjSoZHhGqjhjKfQ9/h8+dtILuwu/CFs4lBLUUHXJxoreIhFHM3IU4Vr00JVYw90OtaSiM5al+kBUj9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by MW4PR02MB7106.namprd02.prod.outlook.com (2603:10b6:303:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 18:20:49 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 18:20:48 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>,
        "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [RFC PATCH v2 1/8] lib: sbi: Preserve hypervisor state across
 domain switches
Thread-Topic: [RFC PATCH v2 1/8] lib: sbi: Preserve hypervisor state across
 domain switches
Thread-Index: AQHdZj/jsGg46NHQZEiIFfpB84fbYg==
Date: Tue, 27 Oct 2026 18:20:48 +0000
Message-ID: <DMFTUM3CN9U5.10WU2ZEHH2D20@qti.qualcomm.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261023070925.241680-2-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261023070925.241680-2-theodoruswensanfebruanto025@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|MW4PR02MB7106:EE_
x-ms-office365-filtering-correlation-id: fc469d54-4dae-4b96-25c4-08df3457066d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|38070700021|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|261026140227099003;
x-microsoft-antispam-message-info: DDPRGOkkQKQG0DQHgBli+9m2R1Fhss9V1AwoDyRYlKQgLr3izNWTCBzKT0COouqgFkamyWh4WXGwPZMyS8iiWDJOqFav4Wd5naF3+kMxUt+wanCtUXR/pPxhJXWz+JrVLPZKbQs/k0XtKX2gGLx49lrO/GmMsLScjA71zjqAq4ff/x9Yh39gsIOPDvvQSAIIARfR5XkT6L9fTxcAJPIbRdqoxY2gFRBq+Pm5IkURjFB7HxhUDgW19oQMp877R7cFfkV2H4gpEqt1H9cupWWLZUV4H2Tng1McfoeBi7ZGpaaZyz40RA09iGezAvjcqMRauS5zbLbWoh4HBNM91hAWrk5yOUU9UCKdehiu5P9PoQR9nq5wmqfU8I84aNqiXA1KQkMmknCPciHK7nD40VCqtv0iIZrUWkSvuIm25k7isARaUbmynNt9nzt36qwS7MKnUZps5yAPUKG6NGRrncItzgPSZAsiOrYP4vDKjRZO0Irf64fJJSAyxF3tcwTPrNmKwUbPzTT3j2fdYJ+grFkly0GUt5k+M1Gi3vg6XCaSTfkcSVqrQCOLbK+bPRi37HMUIqbNFwONHkq5DHXJByOsj5kjRMhAYA4hOQKIakdgvlS3Du7iShA/9sIz8DW+XJ120xE/f0JbqWhQhQfNXMdl3lEYGIqx1yDcqZytnETnLgHIlOhiaMMsSBDRC1yFrNzf/xSNtYzfV85dvFOY6yxMEnCfTCE6Wkdbk7BY434Dans=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(38070700021)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0F3bTRRL2JEKzBNY1prbWc5am4vR2dPYWR4REE2N0huNE1yOUdxZlU0eHpW?=
 =?utf-8?B?dUtOdDBmTUFrd2lqSGZXcWMrYWU2RGVlTmw3R3h2MnQ1Y0I5dHlMWHJHWHFJ?=
 =?utf-8?B?YXIxc2lNWkorMEtsWjhXVEVaeGJjd2pBWUpSTjUydTRyU1dVSzFPbjY1eHN4?=
 =?utf-8?B?S1NxeVJFRWlKNWgxWlRyNEhmOEZsTHdXUEZaTXp6amlPc3AyY1RoM1c4Q2Nu?=
 =?utf-8?B?blJpMk5DWEFtTzVrcjJtb3ZjVFV4bStpN1dVYXl6QzMyQnh2bllSeTd5RG1p?=
 =?utf-8?B?Znk4YllzYVBHNThmVzZPeFdWajlIRG1GbUxmQnUveGQyNXY5Y3laa0FSTi9t?=
 =?utf-8?B?azlXd0ZYS0I3eEJjbVVLMm9Dd1ltcnByNmUreVBKNTFmN1RXTG1GdzYvb3pr?=
 =?utf-8?B?QnRoS1FkMy81Q3NFZ25ZdDFvQzFHc1hONVZLRzFOOGgvVmhvaG9oOHFyWlFC?=
 =?utf-8?B?dlRMekdUNDdWN2N0dWRjMFhvSHhrU0tVcE9DVno1eURkQ2FkMXpXSWF1VUZ2?=
 =?utf-8?B?WCs2VWYzYnhFTndwUU11U3NNYVoybWp4SWlpMlhTSlh3Qk5WY253WTJkVFlS?=
 =?utf-8?B?QzRET0Q3NVVGMlBZRGhuYW5UdUJvMTJjUENsaEdIT1pZZnFVNHZKZkpocldP?=
 =?utf-8?B?cU94L0JkN0dTeVVRY2dKWWJpdlR2eUxhNnZNTmJ3KzFpbzRud1BDVFV3dUQ1?=
 =?utf-8?B?a3BPSEdpL2pOREc0OVFZZTdQV2taWDJwcHZmSGtpR1JxcTQxSzN1dElLd0Y3?=
 =?utf-8?B?S3drbE1mZTJ5N3RDRVJpTitPZGFNc1BHQ01ONHBLZm9hK1dsSXp5TWhFRUV2?=
 =?utf-8?B?SGMxZmxMdjF0NTh0dTdRcXFMWGtYeE83RHFNbW0zb3JadUExVHdtYVdsQXU4?=
 =?utf-8?B?dTBqOTFaL1N0Q3I3TU5Da3lIdWxnWWVwNlQxQjFaYU9iamFrQWQ5U01Vd0VG?=
 =?utf-8?B?RDJDNW1oeUM0Tk1US3Fob2dqT2d4YmdRK2wraFNiTCt4R09FVzJQelBZSDdv?=
 =?utf-8?B?cGN0cTUxYTI1T0xFSmlmK2pwbmpwMUVYRXNybHR3YzQzbUJmcm1XbE5HcE9V?=
 =?utf-8?B?akRDTmVNT21NbUQvck9ualhBVEMweXBFWkpiNTRibnlMSDFJd3dYbmE1TTl5?=
 =?utf-8?B?UWNERk5MOWxuTjdBVEp4V0pNcmNNSHBBMTdzSzVYWGRpaVZ6aUxHZnUydXMv?=
 =?utf-8?B?ejg1K01nQk1ROFRGcVY0VU1pdGNCNnhOcVB4aDdHMDl2WktrWlJhRUFodTg1?=
 =?utf-8?B?RHo4bUIzUmpzYjdCejFvcjJ2cysxWDc2Y3ZvWVNnVHZYdnNiOXhvS01TbmNH?=
 =?utf-8?B?OXRoNC9hazAya2VtMzRZVU8xRzZVN1FlMm85TmpVSENMamRzTXpmMWNBeml3?=
 =?utf-8?B?V0dLNm5GM0lQckRabXFnL0w1NU82S25KQ0FJSUFOajlDK2t6WnY3WWVudStt?=
 =?utf-8?B?QkNKdVBuN0RlWC9aWHIxK2FvQ0h5M01lVkJEQ2oyL2Nwd1lsVDlBcGpnWDBz?=
 =?utf-8?B?b0F0QnVwbi8xUG8xdXRnVTRRVGR0d2NEZmwvYjRBYnNZQ1Rucm44cGNIdkFY?=
 =?utf-8?B?T01uaklZMXdQWWM3VXVlSVZtTCtvR1c3cFVXZVlUQVJyenRnUXFvTWtyd3lj?=
 =?utf-8?B?aUk5MkcxQURZc2ZGdjlxVVIwMlUxR2VZMm9abXpYN2RTcUR3OURKcEk5MzNr?=
 =?utf-8?B?ekorSVpySStzcHlIV25UR1czdlpQdDJ5WVdEMmxIdGpZWmh2cVNjWk9LTVB6?=
 =?utf-8?B?WHErWFJVTlZXQm1VYTZpRTZYaXZ0bWU1VVU2MW5wd3BweHFQOGN2K0YzNHVh?=
 =?utf-8?B?MVlESjhjZG96SStQay96bXNrV1NoKzdwVnNvUTVPSHZEZ1VxK2YyckJzNmt5?=
 =?utf-8?B?N0ttQkVHTzNHdWljcTZXdkdScXU1RGFWLzJ2dGtRbVFoR1hCemxLWUtaMHdN?=
 =?utf-8?B?RU1CdlgxZFB6bVQzRzM4VXFUbW84OTREcUN4bmNKSjBKMVViakRuSWNGQVFs?=
 =?utf-8?B?ZWlFYlpZK0t1UlI0bUgrUDNoaFhqMW5UOWI5N1F5L0FMTmJSUVNUUGRIUGJU?=
 =?utf-8?B?NFpxV1dXTU5VeDBJNmcvZE9wZlhyZFJWQ3RzK0RXTGZjWjNya2MrRE8xZnZo?=
 =?utf-8?B?MWpZcStJVEtQNi9hOFd3dFlnTTg5Wjk4Lzd3eVk1QnRONDZuNkc1Z1gvaWVh?=
 =?utf-8?B?bURQbmYwVGZiZGJlN2l3Wno0UTQxc3lTTmpiN1JYL3BPMWZ3R0RZL1Z0VmJU?=
 =?utf-8?B?Z1pqS1ExenVvb1pnVjd0M0IxQUtvVHZjendYQmg0S1FkRnFFQXRrT3Nib2Jo?=
 =?utf-8?B?TW95R3ZMcmNlaXRZM0dnL0tXeGJzVFpna0RpQWZTbWZacGtFV0IwdmRiUnVV?=
 =?utf-8?Q?n2j+b31tNDBTxOz0=3D?=
Content-ID: <DC7DA9DA0277E24581DACA4CCE6CE7AC@namprd02.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wzcO3thy7nu8Kdba4bfc/GwTNE25bO7csbkjSUyABBq/NanPD7QrHE/Dg3F8vYOj65no/f9n76J4IJd1ystw+o8Yw/1xLYiWyDrvP5sq/0U2Rw+hXFmeWzZHvxkhfVKJ0JOYKdROQjOa+IKX+ekhSVvbNJzhMBhdk88brPOxUNrMqABKd8J+e4Gt+3ypA1a5Z400RXLac5mwQJEeEvVBkdLSpcav55AhWV8s4nerPQTV75XMIQu26/AfOxrcQa0YNS+XEl/+iv7+ffC6PHpzMtTX87xddaN3fpqXbOOWD3STVfSzo091PawPfa0KkrMV7Amr4OOSnFd7ev5JeEB8Xw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Y76favqEW0bH1BQCrJqu/XDngpEVy78HNTDFSZHQM2WJMFetfyQHseWVFTDQ8nPIQbVxuva9fpeAnKq92ymBby18pjqpWWIFEPQArgoFZPks2uCvPpiTGNhUdAe4SHamwbfti+F6jbRWCpbWkq/8DouLonSkOGBaYXGpmL0m/BSonhFHf2Uto0WoVB1O1Hd0i1Xw0HawNkX7DSZfVBD1QguRou2flxoWAqzIU5SrJa0a1XY7MbPRfTAq+emQ5YK1j+nHYuQbNpsiMg6CAM+QGP2FLOh1wleeivQQItfXtqc2OexrE6eVW5s8WmLEmoOZuchyc15zEborXXzw4OBOdkqSvRDcz/XreTnq6r4CZJzE4U9/eVphagWEW01gBAfF+LLawfdx2Mps73DZHe5A+RUroGJGulk8S1BI1xO7nixOud0+/K02d4LYbYEyyvJqYrApQ2k4hNvjlPOJt9JVFhndi2wZwJKFAymLPJDX2TT+RMs3/MGLnEor//yQVtBFplvMHng7QQANcIUuj9U4eZOZvrCyHiRf2UFHJSAL6iwvZfcJ7SewrbzUSN6HJMl03YjtLAN1KgpJ7PRSBLeloOK6wbCQfqoyT59qJ3y0CEkzYpuQw0rV99XTOSXS8lsR
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc469d54-4dae-4b96-25c4-08df3457066d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 18:20:48.4146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFH9xvx7rg5mdRW6+JEbG8sm60+6bHUeRCEfSpaygseH2G8Bl4SG8RP6iYMM+vm0IjxxjIuA9tZqPOKz5Z1QwwV6qemTXAPDFkWEitvpOp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX6FlitmXQkr5R
 WDrgxCy9aE0iwJtf4O2l7kZT7z/myH3uwN0dsYE0wBjZXt2ooX3zxyjdpQtDtE27VZY2jZC3cYM
 IrJGR3k8ubDYdiLBIRQjL8XmRtkVM5UrRPQjqEncuY4q6voiqkJuRS73tip/2Oai+TAmdc3zLC5
 /ewJCzBdNZ2pxr9R4+Sa83F3W3mFz7Lgjq7fnHcUDL7BTvu5Ge69q02pfw326fOuhbXkohtYufl
 9bck/SX5BcuLVVY9xykOPg5IaOW8mg0qINYa+QEFAKR18vinG6lvteNmVKxf5u3HVLgpE1YSjeU
 tGxPS1BZ4jkUffbIMem5rCjRIw4Pw4F97Jio9tYsxsSJpRJyqvM96R/2f43NB98Tj8n3PWQXGcM
 5N/pLBR2bty+8Dmen4fxZMpmFnFwtYKtaKxk9Ov6BHHinFOqUlJqK2fVclPVbOV6xFGEk9aEuVi
 J7oJ8W/jbWN9+IFAGhA==
X-Proofpoint-ORIG-GUID: JnycH6B9bxFpdCZX-NLtVMEylWH8oCxC
X-Proofpoint-GUID: JnycH6B9bxFpdCZX-NLtVMEylWH8oCxC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX4Bs82SN7m0yf
 3a9zCX6aGKYI1uHz/H31zaPkOBrekph9maGHuia4f3oXpCk9xuMsa97Vjo5WwLer1N1cY2AWbPv
 8eiAOBgLYpY5bE36HMUNEteTCjrrehQ=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae0eb87 cx=c_pps
 a=bIbXKPR1jM9XdZLceGeTKg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=iWfw4yvrA8-lUVQ4mD0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112058_246605_1085C24B 
X-CRM114-Status: GOOD (  11.55  )
X-Spam-Score: -0.6 (/)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-10-23T00:09:18-07:00, Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>:
> The domain context switch saves several supervisor CSRs but leaves
> hypervisor trap, delegation, interrupt, and translation state shared
> between domains.
>
> Exchange core writable H-extension CSRs when H is available. Use a
> 64-bit exchange for henvcfg and check Smaia before accessing RV32
> high-half AIA registers.
>
> The domain protection reconfiguration performs SFENCE/HFENCE after
> the CSR exchange.
>
> Link: https://github.com/riscv-software-src/opensbi/issues/433
> Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
> ---
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> @@ -139,6 +169,46 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
> +	if (misa_extension('H')) {
> +		ctx->hext.hideleg = csr_swap(CSR_HIDELEG, dom_ctx->hext.hideleg);
> +		ctx->hext.hie = csr_swap(CSR_HIE, dom_ctx->hext.hie);
> +		ctx->hext.hgeie = csr_swap(CSR_HGEIE, dom_ctx->hext.hgeie);
> +		ctx->hext.hvip = csr_swap(CSR_HVIP, dom_ctx->hext.hvip);
> +		ctx->hext.vsie = csr_swap(CSR_VSIE,
> +					 dom_ctx->hext.vsie);
> +		ctx->hext.vsip = csr_swap(CSR_VSIP,
> +					 dom_ctx->hext.vsip);
> +#if __riscv_xlen == 32
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA)) {
> +			ctx->hext.hidelegh = csr_swap(CSR_HIDELEGH,
> +						dom_ctx->hext.hidelegh);
> +			ctx->hext.hviph = csr_swap(CSR_HVIPH, dom_ctx->hext.hviph);
> +		}
> +#endif

The state of hie, hideleg, hvip, vsie, and vsip is connected, so the
context switch needs to take that into account;
the order should first save vs*, then swap h*, and finally restore vs*.

(Also, vsieh and vsiph are missing on RV32.)

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
