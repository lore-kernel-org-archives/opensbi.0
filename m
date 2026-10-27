Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD84606A323
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HiIsTuQ2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E/L+BwZG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HzFsAtQnMdvLF4impPZIOQ8w5fFbs4roMYKerMJ2zAk=; b=HiIsTuQ2XcqxXEg5K9S9vBLFTr
	V4nFFSbhOi04RbKJ1zC/uTI235QNrbN8RAHokwoebgqzHLBtsOTZFvtbC0EQIJAb1EXLrjdnxzOtn
	+6GpU8c13JUUcO6wKCb7XVuCwXSLIkPNVtEqdGYVUMbw787CyDpz4lfKf0zrvpTu16BngwJAYSgeB
	7vUCa2zX8UEr+ajE1W4umzMjS7FXiKZ4xchTPc0BFDYMmKlGnlL9RyO3zaq3jfnUjTr9y/bS399tv
	OEq6l1xvBFSgi0p3xDW9qTx2e8xQnbzCsWjOERqiWuMiDJE9gCOR2ckAb08dpJ/fmpwP2bBVvIXVV
	H0Okd49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmGm-00000005b9u-2Fmu;
	Tue, 27 Oct 2026 18:51:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmGj-00000005b8f-2161;
	Tue, 27 Oct 2026 18:51:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIIDrt3486476;
	Tue, 27 Oct 2026 18:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=tDrrxIPfyesk7ZXaU2wPY/VjWMiD6EcaV9OfKJwTBcg=; b=E/
	L+BwZGt3zvTUz1cmJ0Ii4X7iuFXExk5Dfn4wqAB6G7Cby2NdXhG2fYj0iThyNMqu
	mXShPBuqw0Tk48HCW1Qt7Bsf1GsVnbYG1kahwpJeIsY5q/ldW1KQKuFch9UCvpxJ
	XekYKcG0Kwj0V5ydv+YPlkN6WiiYxc8MbuEgs1kKssQCX2zRuQ5huqWOW8FAhUbd
	ZeS3oJQ3FAOJFbiLV9ipdI/mEyp5/+ROBZ3aFgVxiXaS/Ev48jcAkL/BfGYyurHg
	TzxcNmVf4Z+YeJ9Gijer+WVBInvSUOmPM/Lh05rWtSgKsekX0V6kiVBdO7lNCYZ5
	/gLgoJS2oA/5IpLWMNzQ==
Received: from cy3pr08cu001.outbound.protection.outlook.com (mail-cy3pr08cu00100.outbound.protection.outlook.com [40.93.6.104])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtbxvv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 18:51:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqQNHPt0pbzweMUYNRbNJCFypjDuJUbNoU6xM0+IhRtust9XNJJKzCSTaTpWYHFjsNFaerFTR9KCChUsP1tqRYXt51kjV6yCPzigBVfWGXjWKl4kheUbsEwgb5zpLuT8MO1nbt7Z5F/26V8ieYN33rXe8CShV/rH2IpIhBnUomg+pmx35E2OK0GG3PsVt9QNRCUV0RdbjUnyiNLbYo96S4GaSR2AWbjMM+IEMUAUmGRypnvV8DdNz73VkgONmkkNIYLYoRP/tiJrpwYEw588am6QpR+Vdi/lrgjVpkFS6q50zHCwSQV+ZTt1Rhxg5Kuza19aSTsKlqXxw3g7rAeX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDrrxIPfyesk7ZXaU2wPY/VjWMiD6EcaV9OfKJwTBcg=;
 b=i/bm8gIaaYdWflU+j3qgegz0kg8ltfcx/Xyys5GyOjAvpWncOFlE2O9Ea97rs0PdsWEqUgiE/3w/M30ra3BeO4pvMzIG4y49mpJbnGbPi26rI9QZ9IW24mfc0AGFL99+RT6z0YMBSNo6G6GdPwMRGDzKbqhteIoFsGEtp9S9SO+B1xJWRzES46+FyP/KeBUIgQbpVQ7JG1Jspy96Ht4oF0+2Za8iP3fA/rMKtYnaJY078xwVKtixWvRmId9A8Q700v9yZxdvKjhhKStmSs3h7ZgkCN4+XoHjn/DoPOj+HTP1i84BTMItGo2fh8lZ/cyO927pepZXG6E/JVldfyGGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by IA3PR02MB526348.namprd02.prod.outlook.com (2603:10b6:208:60d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 18:51:28 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 18:51:28 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>,
        "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [RFC PATCH v2 6/8] lib: sbi: Preserve supervisor AIA interrupt
 priorities
Thread-Topic: [RFC PATCH v2 6/8] lib: sbi: Preserve supervisor AIA interrupt
 priorities
Thread-Index: AQHdZkQsQw2YAbR0YUW3qe7dGFuipA==
Date: Tue, 27 Oct 2026 18:51:28 +0000
Message-ID: <DMFUI43WQAMF.145H1SIVORHEL@qti.qualcomm.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261023070925.241680-7-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261023070925.241680-7-theodoruswensanfebruanto025@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|IA3PR02MB526348:EE_
x-ms-office365-filtering-correlation-id: af1cc439-b227-4b1a-fde7-08df345b4f57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|261026121527099003|22082099003|18002099003|38070700021|56012099006|4143699003|11063799006|10067099003|261009223027099003|261021121427099003|261022105027099003|261026140227099003;
x-microsoft-antispam-message-info: rLAz1/Q7CMZV0OrUXfRELrYo5GBiZWVj+qjY8ahf8KV4qWZ2FF5C9s8l8cNWr2+D7tl8VigGQHN17IZwi7rvNQORHebXSjIFSypYRFze1WA5zUxVshijZMoIlB4XEY6mFeJ6DcVL7HhapDG8zvJ5bkHvIMbJIJ45XmRhQkVznFhvZXFgd8E1Rq5Ij7F40SemXaR1yoygdqyynMD8EmkQ82kLGC1SR9PtWkucFWN0WLbqQm7m/TfDSoOG9pjKttCkJMHLdpu2ImB03o12NjIf7c0CQ9lr5GLBc/agYMt3Bi3Dl/PbyrenDmw/ptg+7xkkWHfSbOCWeKB+uPriLxLmbyo8CG4dNZsG37mjNPaX1xzlY4bl6RqmMGk88Lu+DXwYIs7tECdNZ8b3eS1ZfmCIa4F+sSJ6H68dLaeWZS7iSUPYlxnMqf6uJfvgAOGUB0+9NulghgAPc+GhD4GnjhOH1PsNGJGG35kuUbDscxVG+z860ZwGMTrwiuvinIMtUDrq9bsbeyRO8NdUqwcJ4kobJtExKr+p+mLMMRPvCDTa1Q/XJY+bk0raFHtljUoEtmH/wlxPQwG2DiXlH/wHEd1mACskEwJlMQB2/wFEG9/2BG4KdNu71jeoEED0iiTzjZE0gwMrAtU2ROV8/fDWWJCcHvu2cM1oiGetQPtS+sP6GvZ++zYItChw+9j5eGy9zVyaP9INz50wMMQRyt3hLoIIXKten5SdC0Pnew4iSmd7PWo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(261026121527099003)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFFxbFp6Tk9TSWRsWTM4dUdRVDB2c2FNNnZkaDlUdXlRQUNmTVp0WXZxV29z?=
 =?utf-8?B?dXRUSnd3RWxoSGYrR1d3d0pkNnFYMkVtMkZMUElNZEdtRVIyQnpBQWdkaFFO?=
 =?utf-8?B?UVB6amtLVEhiNXh4LzBUWi8xUTd5LzU2QlNsby9jMmN2YTFJNUlrZVI4OFFN?=
 =?utf-8?B?NkhVNVJYSlpxQ2l0aFBIWTFlWmVXRldDVTZaaVZIYnhXVnUyQ0EwOXBsQ082?=
 =?utf-8?B?VUlKTVBLQ0RPaHIxK3dyaGozMWw3RGF4OGpKblYyaDFhTGNOUVVJVWN3a3RL?=
 =?utf-8?B?a3U2N0lEYUNZWkFOcjN6QXNFMEMxWHg0aXZzMkovT0V2ODRjZzlrY2JyUzdy?=
 =?utf-8?B?MmU1WXZDWXJEc0cyVnBPbGtubjkvR1R5UmljNmt0K3dhaWpYRm4rYXRtVTF5?=
 =?utf-8?B?aWJ2V3dmTkFFY0Jtd05STE95QWl5c1V0RVR4OGRNYW9sa1ZqN0V4Q2tGSXhQ?=
 =?utf-8?B?Uk13bGRMS0VmcnVHRXVBUzM3dzFtYmxMTjhoblpJdUFxdmNJWWp4dzRESWtn?=
 =?utf-8?B?aVNaNnBrazgvSXpEQ05xQU90RzdIN3VtNW54UlMzbER0N05pWVpwNWtWdTZR?=
 =?utf-8?B?YlFOMzdwYzhBWFZkMWJUOFlZZGVPcW1mSk1rdWROWWtLRXdleW11RlN0dFJU?=
 =?utf-8?B?QlhMMmVJZE9qNWM4UkV6ZDJlQzYvR2tMNzNTM3JYa0V1bkFlaXdtZmZUc0JF?=
 =?utf-8?B?OGZYQjhrUEdXSjlMRE9LaEpYeFRGZlBxVEJsd1BGNkJVVDc3bnJhdlBqazR1?=
 =?utf-8?B?S3VwSUNFMmFCQmsydTRBNTdpZGZCL01KcFk2K2t1d1BKcHVaUVFpd0htb1hi?=
 =?utf-8?B?QlRKTzJuWTVnOW9CRzdtVEJXcEkvNDZLV3RjenhUVVp1bEswMUs3Q0dMV24z?=
 =?utf-8?B?bjNxMEVHZU5DcVZlK1o2U2VYeG96SDNobVdtZk13dGw3SFgrOE5QenVhWTJF?=
 =?utf-8?B?UUUwNU8yK01NbGx5MHZpa2pCWnk3a3dYbjMrelhXQ3duZmplNklqZWt6WVVO?=
 =?utf-8?B?SHJ1RGY1Qi9FNnArME1vaVlDMExUQWNWbmVhOHJNZWNiWDc1QmYwa2I1djBK?=
 =?utf-8?B?ZVFTRDVhWVdJbVdyajRlcUlIeG4vWGZRTHB2ZWZ4MGxYeE1ZS2JoUkxXb21a?=
 =?utf-8?B?bmFyOFo1eVhta21raWdiOUdIUUtzSktHNGZ6S3R1WkZocTVwekJvQVNhQ2NW?=
 =?utf-8?B?UUZQRzVpMER0LzRselRXeUdJWmtZWnRCKzhvZVVGWlpoU3RDcjVwVWxkbURs?=
 =?utf-8?B?Z09GYzZ6MkNPNnYwaDJGWEF1STFCQ0NKdklWdWNWdGxnaTV6c3lKemlqbW1j?=
 =?utf-8?B?ams3U3V4ZjByaWdpZGpFMHZZb0x5UU1zaHFjck9CYXdGRkY1VjRlb04rcVhk?=
 =?utf-8?B?NGpJek1WczY2ZDBRZXR6Rjlxb1oxNU95T2c4dDBvMlF2WGJEaFRxc0JvcjhM?=
 =?utf-8?B?OWZWaGlFbjNYdUtrMEtzSkFjaXVhZjJLN3B4VUVPaExqclZYK00yYTFSU09Y?=
 =?utf-8?B?Y2VMOGg3RWI5Y2ppbUtEU05hSGlyMURrdlREbktKZW4vOUt4c3o0WEQrMzRy?=
 =?utf-8?B?TFBkdXoxQmZpNloyL1g3UFNJTUVzYlMzSzdiODdSSXY3NUJmZ1NXSDk1QUdw?=
 =?utf-8?B?TmpuZnpWalpuQXFiMlpwSld5ek8rN3d6NnRCT1VZL0lnOFZRb25SMVRsb2Zs?=
 =?utf-8?B?RGdpQVcwSGdpcGNOa1ViNFpxSDR6OVVMdjlhbEpJNnBFeFk3cUJZZ25EQ1Ra?=
 =?utf-8?B?YUQvclhEelpOZS9HWkcwWU8zVjNvOUkrZTArOHo5RVhiWEpNVGFyVkdITk5W?=
 =?utf-8?B?TkdxdzBXOERBc0hNems5dGF2Z0hYTjJoWXdJODVUNlk1VkRmR1hqRGp0SVdI?=
 =?utf-8?B?dU5EOWNIbXdqN0ErOXI0RDBhNHQ0YzBmdnorMmxGUGpLSkhiQXVJNFc1djFV?=
 =?utf-8?B?ZFdHSFgwdWJPeWdQTm0ydW5OcHpKNzkvUjZTV0llZVRKWEJPSzk1WDVYR3Aw?=
 =?utf-8?B?eXF4UHZXLzNqNCtvK1hCbmFBekgyMVhjVm1oVXlCbkllU29pRE5VYnNLVFVU?=
 =?utf-8?B?SFArVHZtclhRQm5HOWQxRSt6MVc3MTlzMmErMHRuNmM0MGZUSFR3cnoxd2or?=
 =?utf-8?B?ck81dWpWOFJWemQzUTBFVGFhR2gya2VaNHh1U3c2d1dMUFBIVytiOHNvYXF6?=
 =?utf-8?B?WjFweTVnc2x3WGo1ZElOYno2YS9zcFBnM21VVDBQY1R6MlRQU0FreFVJd2JC?=
 =?utf-8?B?bmt6MmpPYTNtWXlrNzM5M05EM3dXR0pTdHMzaU9tZVpwbW5kQkY5NkdmM0Qv?=
 =?utf-8?B?T2NPQk5uRnRERTQ0S1RJbVdZdUZlQ0VOVmlWVHhlcXA2Q1E0ekZJWkRkTVRz?=
 =?utf-8?Q?RwgHOUo52BOZHdJQ=3D?=
Content-ID: <423436037548DC42AC5EBAA3A68B9576@namprd02.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: L8A5FImzzrL+FX54YbTKsnmZYEFchY1czqCLe6V7DcSmhkUyKmkSRPvGwACYb1FJveW1n/cGqolD84pz3jkBc8H/ocjJOXO3T3NbdphB1nxQYll+diKOZ603NStQaLJdiZ4Gb1cPa7nsIRkA98uC27x/DFI+Lvgu8VhxY/P8wux5yn5igaMlfCf9fV2d+1AxNI4bcwJii4LPMKSwaCzwPZdWBvgaBInUMTcugIxgY4/2X1AU+j40Vzir6wXpql9+a8lyjmwlM0qXyXgtpohrdu8JoO2c7zci8kd6Lka+o36b2myTjhsiKZeyIrbQR7TgOPXkQpCwR5tzgXf4QM1Emg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qEcRHAjN7rxsDJhQWruscypb2LjuPFC2Kr9S6GdCrqAc32aztQ0Gdv8RsSvuJ07OzicWHFdjDaluvj2eAzK0nINn9l2AxN3XXDLxTkMExOpdScIt3I42yE6fPfkSFcuMMzCFWdBA53AegoJIhj/f6acoTN4MPMiNSr8TxvWnPwXg6UyOmqjW6HysN3adgtsJ4ssvc6suqOeuTqmWihjigdw68ozopebkVZwoht18RzweTheTbu9acMB/IYR612baMfuLqNuzjpy0/jX/zilDIbMsOUHWpbxd+EhQv1EM6inCGcExsrEANMrRxKZ2grDrazepGRLHAnw46ieP3U/RHe0kz1AMYS6oKofwBpDFGWGql1pg6QsdkIMA3v+ZeLRSxmaDB/zEf05UW2D34EdFzGUAmi88foajEl2QfUHdoYxXdXBVpzWO5DF5qDw13lcaa8emXAeKVdL88aHavUrpHhNcfdFVemUb8OecWT8hQhZgQjE+qlbg5Aq9zXJp01HyVQkjOSRaMErNkp/Djt6YerCTeP68GW2lP0+HaMsiH9JNQcRM3FUzZZc4dj+VY0Wm7P+StX9CIlF5IDJJbtvdb5LdgQQvlPrUhlso7fHFkGO9940JBxfC1yQCkjTxzVyd
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1cc439-b227-4b1a-fde7-08df345b4f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 18:51:28.7130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNT5KsLFNvdYzh8j9n4+T/mJTXdvRqA96ARi0sKgWrp21UUuOvNUVEPA+rpT03+QWJM+ZzGSLqRjMDZ+ugk7/eS/6iSGcmO+Uf00MUFKT6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR02MB526348
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX0zuW9jEvnGbs
 1lO+qLeQ6VRkjxmLCf702Kmg6nn7Ki9gXjzuAhUjtAqQNfmANOJzFzypr+rYAm3S70pej3Fj26a
 vDqSThHaqpJ8XKehRK4joqLYBtyUK+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX9N29XCzehVhT
 JBlu7N5oV/gGui7aGKK12sYD2fJt5/t+0P8nNsa1Pivh1OEnI7d0uGhOadaraw+oEgE2We3qmAX
 iQeZHzvuSnOmehETg80CHBzns3HjdY14g07MSZPY6CI7LWJM0IFvGSLhuYMxEzbifOdC4Uk7BzV
 KqRQXULY6fPZCxtPeIeukmppwUX3/4tbP/E8+CoRpTBOEBxWDyH7UwoXjrzuU5TQFUMhwulTLN/
 LOE72FwjemTX6Lul1A+txzOgp+m/v95vc6MarIA3AvsGco+5QOe3ukEOBdV2gOujxQyqtGIO38m
 8PH5p2Gtprs+HmiA3Xtaf+Lp1EbOGL0IWOcmGNVWaFTHtrrdbADctIFWNqQzYhTMrfBtrewOfAt
 j/5xIpiwMlqKKr3mD8ok7sNxSrZDzTg9eLpYYAvAu9RINz0Y8BdDS7aLLTKhqvGyKoGa9ZnqYNS
 ST0YkV4IRhEgiWZYF7g==
X-Proofpoint-ORIG-GUID: NKilIFm7cUQpf-BByewvh447TdVAusz5
X-Proofpoint-GUID: NKilIFm7cUQpf-BByewvh447TdVAusz5
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0f2b3 cx=c_pps
 a=ETN6ulabYCoNbUlQWP244g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=xiR_f2nkifXs3fIpKyUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_115133_640325_7BA28C98 
X-CRM114-Status: GOOD (  12.69  )
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

2026-10-23T00:09:23-07:00, Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>:
> The siselect/sireg window exposes supervisor interrupt priority state
> at selector values 0x30 through 0x3f.  Save and restore the implemented
> bank across domain switches when Smaia is available.
>
> Only sireg is accessed in this selector range.  The other sireg windows
> can trap and must not be read.  IMSIC indirect registers at 0x70-0xff
> are not handled in this change.

Simply context switching IMSIC files through 0x70-0xff wouldn't bring us
much closer to implementing AIA for domains.

In systems without Smsdia, I think it would be better to give AIA only
to a single domain on each hart and prevent access from other domains,
because it's not like concurent domains can sanely share AIA anyway.

To prevent other domains from accessing AIA, we'd need machinery to
define the set of available features for each domain, and manipulate
mstateen.

> Link: https://github.com/riscv-software-src/opensbi/issues/433
> Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
> ---
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> @@ -93,6 +93,8 @@ struct hart_context {
> +	/** AIA supervisor interrupt priority register bank */
> +	unsigned long siprio[16];

The priorities are u32[16] or u64[8], although the code wastes memory to
look very clean, so I'm not sure we want to optimize...

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
