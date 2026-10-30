Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C24D606A31A
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V9/5TYTH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtiiJtiY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HeGKx2czwbWhXu+4GBIibYKz8CrvDus/50NaiFHoqTU=; b=V9/5TYTHFbPjVQH75mSjSwGz3S
	8tgH14gjNG7IHs0emgYrplGSLp94s2BnJy0+qj7INsJofUcVNbPCEo2X1ruitF0ash8hDxwLMQ8ek
	G2SMa+0HfKNVdu4eAoS2OIq8+UZbTX4edPuCsvO0h70x+ExAfkoMAmgUl79jo5B+OmQhD4lhnEQ2b
	mcjEqW//AR32LZhnnq9NKZ3qwVQds74G2RfOouCcdHzfRcd0HwkszwHU99WxPuF5ULARJbP2AvIEf
	VnsqKiGFdlltg8Eb23Bdokcl2aRyHM4PWV3qKBxcx8nXlSUtq8vq1R4GS4qPTdrZbH4roTIMFnoVn
	DDLoaS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlgV-0000000Bg2D-00cC;
	Fri, 30 Oct 2026 12:26:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlgT-0000000Bg1a-15Xz;
	Fri, 30 Oct 2026 12:26:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGBCG3089598;
	Fri, 30 Oct 2026 12:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=FDj8yOANcXOZT1+9ZVMC0DIfvLrzf/XW8IuPsiZhw5w=; b=Mt
	iiJtiYhpRohBSU+XCxBZkHFyoWK59ZXIuonPRTN4Y3gZHN1HgHC7Iq0WbFpRF5vc
	ptjwLfLoI6L2CTO2bMEN5BQf2iEBP/0pdS7lRm930ERXlzN8EjyoMYNeixngI/KY
	4gQ7wHLhk7VKxI3B5B/fquQmLrqv3xgj0IIK9tOL7RMCJZtuvMTfuoTzAd4AgRqi
	LjJdW6hVC+OB0+1cy0rOgIMmj8RYrgs1mPrnolbm6+a+aCdC6BlhXv3l0Uxq5yAD
	Ebrtupqbxo4ctYprY1s9huZQdM7uO1MAkBUuJO6+C4FxVnEqaVs9bagXgDTA33NP
	qx1yPyHCYIgFcoU4MNSA==
Received: from dm5pr08cu004.outbound.protection.outlook.com (mail-dm5pr08cu00407.outbound.protection.outlook.com [40.93.13.103])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk154-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 12:26:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxvVVPdEw18umAVTBluL+qqqy9k2MQiJ4rIWTlYSK6E2iBfBShREskfZ+ubHfCrKMKXE5rmUZmeE8omg8bPJym/5TSqzadZ72LF++HmgVd0WSonfHt//5usmhznIUKb15x+twP4X8sR0DwyMOEBpjmGJCQrq9JuF4SsWX323ZNLkIL8Q6PjmoJESjipSE80fZyMvx6epKVveFBygIlQ8pNnl7h6I49X7vvNPnn9BII4nf9LcD1P8RGbDPrA6EqJVQynssrzvJsioh2cN2K9CrPAvNfHZJmZqFcAWZlScrMEgkEjwVgQq6UqD+/x28Y0ZZ5rC2wmOK0KtZjkH+lm34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDj8yOANcXOZT1+9ZVMC0DIfvLrzf/XW8IuPsiZhw5w=;
 b=E7qwxCbkWz/u6uKBP2e5BJReM11sPq10vCqY3+dESHpWyX1I+X+LFje4fcZQ4bCVk/q6Sr0FL9BtEaDY9Eb6iMPQhYnMeakAo3B+7nB9f58ZRtPxuoXb/DBcRtO2JQkxHK6/xJtaBtmi6IDvAeU7LOelsuDvlAFgPGTyBLwm42t4mZ1lH94NJTJ8LincASeaag3HVFoy/GE09t0rgotUvd0H2TL+Pvf5LPgrdjDJOHGRMoxCnnsmctzc1AoRyaEdZ1g+/ZIbqU5QzkjuYQFdOdW2LENy3E4tFBVs4N+3QN9V5BeeFMVBMqmagbmDhniMbEYa1VRM3jqbff/AQIyU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by SA3PR02MB9279.namprd02.prod.outlook.com (2603:10b6:806:31f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 12:26:07 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0546.021; Fri, 30 Oct 2026
 12:26:07 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>,
        "opensbi@lists.infradead.org"
	<opensbi@lists.infradead.org>
CC: "anup@brainfault.org" <anup@brainfault.org>,
        "pawandeep.oza@oss.qualcomm.com" <pawandeep.oza@oss.qualcomm.com>,
        "raymond.mao@riscstar.com" <raymond.mao@riscstar.com>,
        "robin.randhawa@sifive.com" <robin.randhawa@sifive.com>,
        "samuel.holland@sifive.com" <samuel.holland@sifive.com>,
        "zong.li@sifive.com"
	<zong.li@sifive.com>,
        "greentime.hu@sifive.com" <greentime.hu@sifive.com>,
        opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 5/9] lib: sbi_domain_context: propagate error from
 sbi_hart_protection_reconfigure
Thread-Topic: [PATCH v3 5/9] lib: sbi_domain_context: propagate error from
 sbi_hart_protection_reconfigure
Thread-Index: AQHdZe409YfndjTIIUSNuLckSK/vrrcWB8wA
Date: Fri, 30 Oct 2026 12:26:06 +0000
Message-ID: <DMI66OE8ZMLI.1ES7Q0LD438XE@qti.qualcomm.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
 <20261027083509.1076577-6-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-6-peter.lin@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|SA3PR02MB9279:EE_
x-ms-office365-filtering-correlation-id: fecfcea9-73ca-43e2-fe5b-08df3680f8e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|6133799003|56012099006|4143699003|11063799006|10067099003|261028144727099003|261021121427099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: rbuehfWs1CvQeya9vVvGrkfzs2LdvG4wLqJQm3oID0fOxWilsQVtJQzQiG/eOY4LAPYZ/8VfSDIOdWdK0AP9+cszQomrVIYoAY9E9eTbtRw5gayHT3ZEd7WoWWlHrT81gQIbj2iVjtqj4o2y+yg3WrU9AJwrfqGxMQ87GIP+23XTObkxsVqiX4jN48OmvUyb8G0xEx1w4XesiSnqtvoxa0IjkJJnx4zJnnPMkiiuJAwTvGMDU1k3YfLjVkLGGx5yAoCjCFZjnYWiEAq8TKgtDYa5mtr9oOfOEfLnBN8eXh2+dwDZwEFwwAKnLjh3UJlaE2RuSNv1B6y0BpGxineNINxYdPMODxGyYgXCn7WG8QfNGvqQYFUSqxUvaouTIv9JeLdxwNzZ/TSdeZo7Ty+JAc/yRuZBnKv7D7sMY2rLIhLVJ2H/bMT/iyewQU6W44iuJHBeO1Xc9cq44tw+T+CYlFZKnS3CshB+AwfRv2btYERex7DVXi3c9zL7P34y63/bxZauRJQMk6sxdh7zuVQ/g2Blimd1GertqJYLIuyI/5uuNUOvbcETJ8JcclqGa+MB1EkmFzbvn7jO/6FEocwF34t5ZksDgRPtIC1K9pTAvWdRt2j0XA+wjE/4MXwMtSZOw2xv9nu+huSSJ+8+dGwcXWtGWaqs9JoP1YAPt/4iBz3fI0WyhfHqo+mhEAzTorWnWELtpcYsnVg6ZDp/9f5fhwAPT32HjocxQuf2Fw3UIuU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(261028144727099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0dqZUpqZThYK3dkY3doNG5lVUV5STAzVTM5Ykw2dmJLd3hQb25uSUl4OTFY?=
 =?utf-8?B?M0NCREMwWlFaMmxoUXV3d2FzaUFwNmZlWHk5aGxORE5SSDB0YjJsQkJSSnRU?=
 =?utf-8?B?MHRES3U4WVhSdnlxNmsvRlFLTnJ0QnBtR1A3eU9wdzU4dVVsMENnZ2l3MCtH?=
 =?utf-8?B?NXY5RVZjSlduK2ZlOTlxeXZRRGgrd3h3eVl2Y2FwTU4yN1cxZlN4cTdHZTVM?=
 =?utf-8?B?UUs5QVZIazFRU0xoT3g0dTc0UGMzaWFwVjltUGpVZUZWWjFmcXZvQmFXbjhP?=
 =?utf-8?B?UE5qdlVBY0ZyTEQzWmtxeXdicXQyaWxTbE9lZWcrUEV1Zkl6WGhSL3NGRGRM?=
 =?utf-8?B?cy9GbnBrbFU3SExBVnJNRDlSOG1xck9nUDBteEMxSUJyWHRSM1J2VEVITnpE?=
 =?utf-8?B?OHkvSnVOWW1PamxETjZRYkx6a1dSd0lqeVdTRnRLZ091SDU5aDV2NDh3dWFz?=
 =?utf-8?B?TEtNQWxkYnd3NkpRVDVFYWZPR2hZVTVUSnhVVUR4VjBOZEo1a3JnVHBuQ3FX?=
 =?utf-8?B?cFNJS2Foc05BYVJuTWRCWTJydXkyVHpWbjZ4enYwOFNINVNjYmNoZTAxYnZR?=
 =?utf-8?B?UlJRb215NFZQK1ZwaDA1RTBCa1owZ2F4c0o0amVtZXZ6NzMrbFpHNVR5SWR1?=
 =?utf-8?B?UkNvUDNLKytITzJYalYyUEJOQXk1elo2TmFvcHpzaDRSdVlpbmV1Z21lK0p2?=
 =?utf-8?B?ek1JNFlxVVVuOGlQSE0zRm9UQ1hrWWhJMUQ3ZWxNeTFVenRnVE1CUm94aWVx?=
 =?utf-8?B?c2s5VE9ZbXJqQWF2c1BoVU1xa0cxclBCeFRsUmtSUzJKUU5lV2VSdzFRc2NL?=
 =?utf-8?B?blo4Q29zcXgyZ3VFdy84c2VhSmVrd2xJY01qaHRHcnVOZUtsVG5yS1UvUjky?=
 =?utf-8?B?YkpGNTI1YzcrTlNhcTlLcVJ5M3BwVVB1UUhPdFRnTEpJcUs0NlR3SE1EallB?=
 =?utf-8?B?UUVTa204OHNDOFBtQ09XUWhhQUlWbWtiZ3g5TE1YUnJDa1lXTDR5VXl2L2JM?=
 =?utf-8?B?UXduT3NBYzhlVWxDZUt3L05OM2hjM2h2a2RuTXpOWUFRM0g3b3JZdW9kbURI?=
 =?utf-8?B?N3UvYlNqb0laZmRXc0pBMEdRY3hzOVFjVDluQzRNZ3hGeGkxa3VwWmtRcGRl?=
 =?utf-8?B?K0h1TVlYcEU4enM4MDFOdG5oejBLR1F0cG9yUmxwbFUwVFgvN1ozV25JTkth?=
 =?utf-8?B?SXR4RGpBR2dUbkdkVDlmM3hDN2lOUysrRkUwYjRtcjJFQkRnc1NWTVdsM3Y0?=
 =?utf-8?B?Sk8veElWTkpKNFhmMEU4UVBrc1Jjb2JmYzk5UnRLOEVqaEc3dFYzWDF0MGxE?=
 =?utf-8?B?VFdOVmx3M3RsOXBrSnVMNnRMT2RwaDl0VXZSc29FSlBTYVlrL01YaGxzN0ZR?=
 =?utf-8?B?eEFQWXhLaFo1enpUSmcrYWRpWjJ2MkVEL0p6c2hMV09jd1VYYWU1MjNna1Vt?=
 =?utf-8?B?VTFZeXI2dE9pTTlQbXMweUZubUgxb2hsT0h1V3RQWWRVU3NmSDBoWGUxTGFo?=
 =?utf-8?B?c0tYeUpiUDErWkFmd2hLK2VwK3U0MEtDeUFlSHQxdG1JK0dGYWo3Z1grb3c5?=
 =?utf-8?B?cWdmNHp4Wk5SZWh5cjJTY1JnaTdQTU1rQkRIK1BGajhBZ3J6cFhLa2NUN3Fi?=
 =?utf-8?B?V1pmMFF5VHBmUnFtYVZQbFUvTExOajgzK3FyczRMNkpTUXZiRVlTR0cyNUpu?=
 =?utf-8?B?aWN5TjJUbVFTaEU0Mi9XbnpJOHhKRW54ZWkrcG13RDB6VXF3NXlkOW05czBw?=
 =?utf-8?B?RW9mWmdNWGpxWitTT1JDaEl0bnZMbWREQXRpT2JscGpNQytvdnpuOTI4NmJL?=
 =?utf-8?B?cDBWWTJaTVpsb0hBOXBBQmFoZ2l2VDgwMWVWZ1JIZVVKa2NLbWtxSElpMTJB?=
 =?utf-8?B?TzRXRW1SQWIzVFlrNW56Uk94VXVRbHJWSm1hOXU2Z1ZtQTV4Yk5NMmFhZ2Q1?=
 =?utf-8?B?SEw2MWhXVFZJK3E2SXJjcmJybTRycFJ4dDM4Y0hURkZLR2ZhTmZKbDhZRmpo?=
 =?utf-8?B?SGlFZk41OXZidVEyV2Y4Tzl1UjFyOXJZenA4VTZkRkE0aDRuaHhibWlyUGZj?=
 =?utf-8?B?dEM2NkNvZU1kTStkeHA4b29WZlVKcWhhbVoxU1gycTFBWTA5R3NhajF2V3NO?=
 =?utf-8?B?eGx4eERJQ0VSV1NKRlc0dFZYOGtLdGhtUUo0UXd2V2Fyd3NIQkRXWDc0UjBW?=
 =?utf-8?B?b0RNanM1cGVKL0dKSkpqeEM4MUNCYm1VK0lTNEFsNG1GM0twWjYxc2lQWlZX?=
 =?utf-8?B?dEo3NVVxdVVZQlhBOVRGTjI5Y0toVU1oQk4xK2VvUkI4L0h0b3dvVE1GS2NJ?=
 =?utf-8?B?RFhSRk1VdG5IUWdiQVZkd28rUVBMNDU5aVpBQjRNMDI2WXREYUg0U2V1SzQy?=
 =?utf-8?Q?FDuSdjOLkqM+ywZ8=3D?=
Content-ID: <D746DA80AD311D499471236C449F0886@namprd02.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: p25H9+TVgJDK7Qg1kbNbUPkE2fDrlJStpaX6Xorg1X63gVInEiGGW4Dm6CAen2zw5l/LPTKvMcstRpmFfiBzMuY7OyuNhnfvaEoPPw9iAXErOY59cbDv9LnOLExPFqmX+X8WQEB6eIzsAHGhDdwGg8pcDsj8kax8Ub2smfEpNjOUiLHSaFRrOFgUd1SlusfVBffZ8jyRLiMjXVxi8NzDRWiBTowhL3dgvW2abKW9e6/8Z/J5dsEoOJ6PDT5OQile9P0j1UqgOuSjL3Fdkq198BWxFutvHsQSM9lhjTdbY0qd++ZuB/853n8oR9UJCDbQhZELpD99PI9O32tGp3U3XA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Bysx5MeBlkoFgx/Y2kbUTvMym+g2Z8IgC6sRtydARx/feKbgBAm6aYxQ14L6PmukVts+Dy3svVGCX5kmN5vOT8LhuL2GMEB9m1cgtlFz2rOVlEEqxsRAWO3Rekx6N2kRhjzDnWxVdBbWDhc+mYppux1tM+gQIpqBsxcbJLlhkR9Pn/eSFNQp9xlnFxBGupsF7niqcdNRJLxoJOfASPeSLZ9VHPSID7lKhWNnmsX4dtKp3NTr/auhnLa1OqbIz6NzNnCN652WxEWazSjKPBlhBnYg3i9FbmmhU70mHzWEHGk2e+Syeqh7e3KcN3LrmCcJg6RcxcsyXVYq8VcAcCOYXkEEY2+ysMmWn/bzrexlFIqKLHE+rMUg5kirw/l01qWXXCO5elLCaBqKVeBhk+VbF/imaAX1n325Karg8FO3nF/4OII2kze6/ZFZuKHcECteH6zMYhueyRsxGgnjNLU7mcvfgAHVfcIgkP0YHiDf7uoZyPgyu1IUPsBQkrr0DvqA0YYCCVI94i2mN4NkAKatDX8k1o7Y9c6oKz80kH/fUJXrdVtmZGfTGAwVillOmlEirWVGE2E42XbTLB026BV6RYxY4VdvV2145eTStqvfIjKiILRejMrQZOjwWrYvR7qi
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fecfcea9-73ca-43e2-fe5b-08df3680f8e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 12:26:06.9131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/hnWpL0W20GAqbpuL3BgtsLy01VnLk92jRpMGYtmKhOhav39aCpTVdFhsLqmd+KsnQVtxO24jdkYJBpuGMs+ZvEY8VyFXBHG1iKpl0NWxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB9279
X-Proofpoint-GUID: DOpu2-Oz5wB8IWt0srwzz6BS1yuXwfIp
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae48ce3 cx=c_pps
 a=9233HxQhCuv4AHT522PGaw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pFyQfRViAAAA:8
 a=C__9oKFfZ3neAzEzHdEA:9 a=QEXdDO2ut3YA:10 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX1iiDhB28INtf
 2Xiure7P+/rd2b4u+lSkfTz8hxSx/2Hn2Tl1Le0sT6s1tv4/ZRxrU3JjjitLiae94SdnTw8FM02
 G6GoYxd9QlcHgiEIODc/kUga0cu/I1RNFz0Fr3JSm6150vAIhNWBxCDcLQ4cyOahCErPIDRs2Hg
 asFkKZcOSjW8T6qCTabpBunZedbMeZlJ371X+d68CtPyJ3TellZ0tRDx+LQ8LCQld5aMznoKk6b
 85CN+PlJypkvYaGUNR562kxqiYeBv906NpOF1Bv+Fa6RHzsx4nHjS1yKPK+nLNm0FcOyQ/e9+G+
 q52ZYveDYsLOzwCRi0xaR3FA4GF2v+lJ7aWRS3MAVdS7mb8wEubIp4FLjKD+QBpxEN5+Glau/vo
 tJJyH7vjhrpUPqsg0Y2FllhCTCy+j5yl54NY/C2u4hx7YP8naXbx5PIpupQfKkYx2IArXKNJxTl
 xz8937bP7PwChs8G07A==
X-Proofpoint-ORIG-GUID: DOpu2-Oz5wB8IWt0srwzz6BS1yuXwfIp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX4tz46XtGoPov
 NDYfAuycadwRkJJ3TMdHEPqfJpqjnB5STVvxat32Zym/J135/sabpVLGkFHp4CmDxbSYV0s2L2K
 sY5qUItKtm7m11eKqxSW49Ey0yZNbBY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_052613_304615_D6028A00 
X-CRM114-Status: GOOD (  11.25  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-10-27T16:35:05+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
> Propagate the return value of sbi_hart_protection_reconfigure in
> switch_to_next_domain_context to ensure that domain transition
> failures are correctly handled by the caller.

The state is a mess upon a failure here, so I don't think that the
caller could handle it more gracefully than doing a reset.

There is little reason why we should fail the domain transition, because
the failure conditions can be known at domain initialization.

This series is not to blame for the underlying issue, so I'd instead
note that in the future, we will not allow failures in the middle of
switching, because it's needlessly complicated to unwind such errors.

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
