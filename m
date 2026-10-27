Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B7606A338
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eLkqeay/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqmoZ049
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RpW+9ef9OOKlakvkLPvS3zdNv65u5T39A6mki7GIki8=; b=eLkqeay/ZdIwqfib1qXMV9QTIC
	vbtzGpKOuj+b6y7bb0KWCTu+9CCk7J+TB5SW5xRfETeMZELg2RX+ydqTVZpe7L2m3ZzZwBGOq4VzZ
	6x1IcJHM4unmxub2yrsCygDOuMQjoac5e40fpCFeWwUKW0kNtOgIGCmaESlDAXGtgy63DfJ4aHyTW
	ABycULeECDMRJ4pONRaeBycQWS96N+sEOAV4twQIIZvLfK4PnlnX5nppYyGdSQyQZMOXAvhwGOzLV
	XN7MVrXmebXDxEJEgJ5j64OOZ34+BCRslQ7xmsjHr/WCAUoLngy0BD7WWqhxoY8lAe8FF16p8ALEq
	Igk/iP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlqu-00000005YXX-3AsH;
	Tue, 27 Oct 2026 18:24:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlqs-00000005YWT-1ALj;
	Tue, 27 Oct 2026 18:24:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHYbH1917403;
	Tue, 27 Oct 2026 18:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=o1Y5Mge0OxNNGhbZBPbVi9N2iEkfea8FB2mM8PldXoM=; b=Qq
	moZ049V3d1IA4dHIDkBcyH+G6k+jQG+amXhzncGfjddt1eyBo0ti0eosgvokDdSy
	5cVWTFsKnpN5pE17nBXPwNSzak/Tpu1a+QRIhJIvIFgFCJNTM3O7XIGjUsAMThx0
	2uABez4dPt+0Ag6Z7tiicrJna2SQq4Il/KM0Ro4ULLf5ec3wEV5lw0lu0GYcpYa2
	c6jA26rb+8oz4/jfe4ZslcE4Kg0DVVWELiQvHl2nJvB+vQCYwWFoHWjT9VKyi9L/
	wQ1A6yhO3dN1QSIRW28ibIyXvlw2O2zGv8tRyu8d/NaeXPaFF267qjMenkmcesTw
	+C7pQTwRDl5NaOKaFRpQ==
Received: from dm2pr04cu003.outbound.protection.outlook.com (mail-dm2pr04cu00306.outbound.protection.outlook.com [40.93.13.62])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux99mcm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 18:24:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQT3r9SrUmzpQaUlhR7XFXzWkHInZCcHsAjp/WynXTeQ1RxjwbKYHeb5HQmWURFg7WTL18NSx5Yjja6ozGJbgyJW4SayW1eR5lilxK1r8QnpO/uKgf5k9FmlpDtQ0bnrvaIULocQG2ibukdZnwLUMy7lzM8mTbdOS22RLfXGIddZvDGG39S5HTvEFTWpujP70jP9JB3H3lHrtyb2uK9nrKP2U+jrMydHepgUSPBdTxXVT9/yex5s00DVMkVKrbOAigbYsOwIVv1P2VXqZc7Dl1mn72E+Ptj2U4tKJhg9NyLIg9G47Z7OU5Y+qwgKQa8BnIgZYBzfIaU24vwQvaCiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1Y5Mge0OxNNGhbZBPbVi9N2iEkfea8FB2mM8PldXoM=;
 b=BX4SmCP5XobjUJuRa11a2VENaViX4+95hD9nVbDS98LldUJKQRt5oCghUFoyelhnlMhq1kVc08ZdvKPHhohnNmQWBSmCPqZbhB8hlSFDKtbEO4Q3+13pz7A3NxooqdVsd/bbqjcHpHTGl2N13oU2r3rwtH62+ViC5mn8vpUB4s82uFWw2Vt+qTLSZ3Iq/Jr4ojXY0sN1BNMiDVu2k2keSxoiHZNmWsgK8ZwZCsdsjwoKzPe4qvT/DWGcLvOkRTHhf5xzaNRtG8Zo6oA2hITqWfKBOBFafAGRUTX8i6Tc9YBvIFagp+WwVvbU6CpMcWEUxCrBOSCIOeQElQQdD30inA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by SJ0PR02MB8434.namprd02.prod.outlook.com (2603:10b6:a03:3f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 18:24:46 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 18:24:45 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>,
        "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
CC: opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [RFC PATCH v2 2/8] lib: sbi: Preserve optional H-extension state
 across domain switches
Thread-Topic: [RFC PATCH v2 2/8] lib: sbi: Preserve optional H-extension state
 across domain switches
Thread-Index: AQHdZkBxppLfQKK+r0C+maFO55b7JA==
Date: Tue, 27 Oct 2026 18:24:45 +0000
Message-ID: <DMFTXNON0C5Y.2TEN8YX4SN27W@qti.qualcomm.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
 <20261023070925.241680-3-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261023070925.241680-3-theodoruswensanfebruanto025@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|SJ0PR02MB8434:EE_
x-ms-office365-filtering-correlation-id: cf47035a-1986-4b47-2e8d-08df345793fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|38070700021|4143699003|11063799006|56012099006|261009223027099003|261022105027099003|18002099003|22082099003|10067099003|261026140227099003;
x-microsoft-antispam-message-info: zQi7FKcWAfHJrk1JgYedEY8G8eGe4D2h2IOFUYkLKcqDNZPoHsvRIyiePQqlg1ecf3K7SzTaj5B4FlXUH6yQKu7gpYSV/c/ucytQkMTiPtd/vryZM1eDrIEmEpy/AaECb9TSPCip+7Aoa/L2+wPockvPQ0YBOZCIS3E9TcF5Smu9RZaNQLqDocQZND0earYRFZUzV45Fjtjtld7g8pcImNuTCt6A0WhLcuJWtjMi2oBfikFM7cO1Dl0/GUAkg9F7nRGXnw8KBy2/hQN0RvhELW+EXpHCWxktuv8wCOhOd20T/jxtBQumAYuMu8wuoOuZkngbZ4oRw7z+bPaFBzHJTwaxislruT4GDv9zMsWPIC/cCPbZFlMckE3Ng3Z+Quiq2WHb0nSnX55ScZJlVMA9+M4oOCYuFx6ffsghcTeskmM35+yk8f97d54RRRRVusCO8ahoXZ963KlZ0u9JAyjGwfRh5ZH25RkAPrkGKH1AuwOkH3iEW4ge2UUnrD9QrjqQgJzV9GhRingnfMYTZMMK7Asb/Hy44UsKrKfaqHecBBCS1+/PIkbLKQCojTdLQVgCXILqKu+8Gpqy20nqOaBiPm0IuXzdpSWCt2DrxtOtGqZswcJidHlWVSCXSQ4Gcn0ap6A/frE0ED+av/vOBvUtBHeZnDxc+EIit6vJqY4tM9abT5Ou07SX99oX/dOtVslVDiycO3b6Z/tGk58McGsScFYLIgBdN+b1/ZiXYyddBUI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(18002099003)(22082099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWVaZDVjeCtUMUxESndabldhTVpQVHpuMjJBOGJ0V3B6ZzRzdlgrcTJua2ow?=
 =?utf-8?B?d05ZcnZueHlpMXFTMVJETllabXVad3dTYWFJV0NRUXJBdzJqV0pGc3Y3eHl5?=
 =?utf-8?B?UUh2VmpuWFdzaytmT2J4QWNOV1ZuOUliNURVVU1yQ3B2dC8weVRueGlTdnNY?=
 =?utf-8?B?b292Y1pvd0V2U3crU3I4cXpqRUtlbk9hOWZVOU1QaVBFKzR0R3FrSCtwVk1X?=
 =?utf-8?B?WE5zTGhFMGpZSDc1dURWMExYWmFFQUpoZ1J2M25yZlowZGNTZVI0UU01a2o5?=
 =?utf-8?B?aVRQeTB6dlY2QnpNUi9ySUNlMlhobThFSnVUOWZSdDZZTjJmdlRqN2tiZ0FF?=
 =?utf-8?B?SlpTU3hUMktmRDJrTkZvQ1lHMU1ueDVnd1pFZEhaQlRwY3Y3eUdCZExPY3d6?=
 =?utf-8?B?bjVnODNJTVc0NUpoWUIwekRzVmk1U0hzNGlIRjdqYkVxaUYvRElVYy9GWDdT?=
 =?utf-8?B?dVp6bCswRUxYd2ZFazhDZjRIa1FrZFFvbzJBVHhJbVhRSlo2NkZsQWhKWDM0?=
 =?utf-8?B?Skhob0tyNzl2bmdJN29TYWU1L1hTNXFuSDZ3ZWhibDljTjkxTzg2TGJjVkZy?=
 =?utf-8?B?czBiaUUxdEtFNDJ1WEdyaWVEMGVjNjN6WnhURkFHTUpzSzltQWZSa1lKbjFQ?=
 =?utf-8?B?SzNNeVFVZzUvQkpYUnM5a3V1M09kaC9kTWlQVUtWTlJyZnA4R1cvVmtlblFU?=
 =?utf-8?B?ZDVyVUlMa2FWYzlxT2x0RHR5WkdjSlJJZjdiNnRGQkNLMEtkMHdQU0JqZXNi?=
 =?utf-8?B?K0VLSTRUSHhtaGFjSnlFd3F4QXBneE9TUW5MaWFoZFJ6M08vb2hSUWxOTC80?=
 =?utf-8?B?K0psMUVaS1hGUnNZeVZSWHQ3RWM3V0NLY1liRzI1RTlTQzZoUnpvTFBWU1dl?=
 =?utf-8?B?a3lML1o5OUdRMFVoUjV5SFVlZ1ZVa0F0cnBFVDFoa3gwVUxZakJ0WitOeUZT?=
 =?utf-8?B?ZWVGQ2p2cEZjclFHSDZvMVpHU25DQktLK0czZi8xeFhqM0JKcFcxeUJxT05I?=
 =?utf-8?B?QXZYZVYzc0djNk44Zk4zMGxTYzNKNEp6UHZWNHViRi9XR21mZEpDVWwwUHJD?=
 =?utf-8?B?YU5JMTBDbFFVaWM3SlJuaVcyazBKdWFyaTFXcFZseUFKWUwvNm5zaDBjTENq?=
 =?utf-8?B?aHQzTWNHVjhKM3gwVGZJQlpLcU0vYUxQVGdrKzQ4OXRTaUhBR2hsNFpxRzhq?=
 =?utf-8?B?MVNYbFJ6cFpaODhiUUp1U3dGWTFLQ3daUUVrRk9QNVVOY0lMdGcwLzVpVG9K?=
 =?utf-8?B?VHFkemsxdEFxbHh0dEhYZmRjT29VNnNVK1Y5bUVhV2NTenBmVmF4elAwS3Js?=
 =?utf-8?B?MUhaZUNkbGRyamJ3VCtwelRqKytlamVDR3RwYTlyS05TNmNuWEtLdTJYbkRG?=
 =?utf-8?B?bmtnUUErbkVWZW92USt5QW1zSmxrTjBkbzJISzlNVU92UTVjQlNZQzRJWTVN?=
 =?utf-8?B?SzFsdDFSOXhCaEIxUGsycGlFR21aOVZPcEhPb2lYQk8rOE5RZE5UeGNVYnF6?=
 =?utf-8?B?NlFFMmR5c1Fvb2tJSjdPUXlhRTZuclJMTGk2ajAvaVdSS3R0T2RjaE5UK0FI?=
 =?utf-8?B?Vk0rbTdHUjJJQzFZWTZyVEZ1NnRNTlJqWmFSb05qNW9TTEJLZXB1anBGRHNF?=
 =?utf-8?B?R3hVM04wTlVmWS9QM2dZTDRDVWZEVVRDc2lydlkvbWpWaU5pY2hxZkN6ckhJ?=
 =?utf-8?B?NHBxK0FIM1RXbldEVHFYUVYvZ0p5cWNkQjZiOVZXNHFiMkJzSXFMazVuUDNj?=
 =?utf-8?B?M25XeGtzbDIwOU1zbEdqZWtsS2owb1I0WkpJQmp3Wnc0RDZ6MnlEdjdEZkRS?=
 =?utf-8?B?dGNnYm9wVEJzSXg4N0NoK251dXczemRpWUs4dEZGelF4dTR5MFdNZEtrUnd0?=
 =?utf-8?B?T1g1bDAwYXRTMFJRQXVvZHQwYllDWTdhZmo2VnhYRjJFc0VWTExndFd2V2ti?=
 =?utf-8?B?cnVkanRmYkl1RzlaU1ZjNDY2TlFzK29oa2c0ZG14MXhqeDFybkJaZk1rbjht?=
 =?utf-8?B?TFlFZFBrT3ByVzE5QUNQc09DRnM2ci9GS2V6NklWL3FOaHVyc1c4Tll1T1I3?=
 =?utf-8?B?ZmRNYWZ6K3EvZm9vRkJ2dzJWNGR1ZFhRN2MwODFBRSs5M2RwL1REVDgvSmVM?=
 =?utf-8?B?dGVLSmRxaHBVL1N0R3pLWjBBbi9XU1o0MThIZzZUZ2JBWWpBbFdZVHVmdFo2?=
 =?utf-8?B?V2hxT2FYK1U5VnNnT2kyNEdWZWxZc3o3TERaYkdKb3NYdHVLV3Uxcmgvc2NC?=
 =?utf-8?B?QlUrNjcyR2xubzNxWW9HQ0kwUzh0MVdwZDdadXJrK05RSnlQK2EvdHk4Sm80?=
 =?utf-8?B?WC9WSW80T2c3dFNJaEFtdi82KzZIdzE0aTZyZDRrbkZvNnlpek5DbWM5MlVi?=
 =?utf-8?Q?/dri7UqUUfrVI6Q8=3D?=
Content-ID: <4468BD9A85037844AADACC887F7FF767@namprd02.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZCWbp/NVQvZjV7/jgNfEWf2LXSN0j8lSMlABuQrrCvupJ0BibRio/vBs6MJzgSku6cKRbPattQxNA42S1dN+I4XLP58pokoZsHe6t++lYgSUwKPWwfBbStHcjN9Qh8XkejM2y3yB+AIAsDjucyFOmdgeCb88lcj381ixZB6NfeLlOTuWMfoEZ7jm5s/wkeK1UHLVz3/MiylIpBwzRcwrWsvETaVLxOMaYScae1xTbG8DhCDOGsVBqS4zVOr28Te9URMacB/EnymhwbAiDfmqmRO4+vRPGm10wKzjJXVaQ5bJ2bZbT8uUv13bWfHw0vwLX9zCdRtusmrb2Lrae/WiTQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7j+BQnoWMStuwhhhl6Jihj0Ob8q2IEuvOuWpS0h8g+eeprJwhL1FX1APcapCms7OZZN9tQlWOb57lxs2s5rRPUOXhMBIc4pf0sWY0nuxI/X1xmDKbJC2F+lO6fKylKQaam7RGlVEsBBDeXJjDqP1M1pAnllvnmsTLTNNLZFFjjAWTAmAO9QvAXt4Q2Z+Aw08bcwoerfwOQRXUI3HtFZh5mceUjI1tuUHJe/i17ZFMtov3CheFRnrgcCLLKOFS28otsX7gdlq0jpK6ZA5JwSejcC9yCFI1LWebb3+5VXPfGz+RSTQl36CvSNnf4YSnB8PqsAbYPodp3g5ckLHx7vjEQ+hoLm4fHcS5RE4mbPv7ftCO8J8hhysNnLg6QdLi7Ve798DdKb4LiLH4se4Kn+0JR/OkuZh/0an2wqCsP++N9Rkg+EpHEoJ82ihqrdxpfUsZJp8KK4K9UWf2KgMT5ESaYhZTvH2Mf1JB96Nt43MryHoDSV0RXtPOA0o4VQ37lnz3P3mfEbLMp2EVurBWbdVAtBhUjjSgg+PAy/qI7qgMj1kQ5iwiEZbq7HM+5+kAG5ysu2WbzQxVFpWg8QIx5jLvGB9qLhZCwQTCln6qHVIzGsWrwtLY481D+YNT1J4FMFC
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf47035a-1986-4b47-2e8d-08df345793fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 18:24:45.8845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Numl1Z5VgO+STQ3/UxkcRe5/sdy3GJFdsQtSly8+Jaoj24OQeDCCLra12bvVlw0N6WGe/q8rRCQAqRHhPYxNCxb556Mw7cvUetBldGm9m24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8434
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0ec70 cx=c_pps
 a=ftK1B4U+KuHZUR4f5igEJw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=TKyF5rgGLy48kXDXVT4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DZ67iicBEgfZon4097KzWlnJyMLH4F_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfXwLz0T+Lo4s6b
 6aqJQcGbKy1bzjcZbJFL+J+wzWFL7xs5hc4dzfSK3uGvq6ne3Po4NPKkgD1HcUyUyE232dz3usK
 Z4AWCbKg2U1LCEcP2UoywzBE8VzjYLkhRxcrwldaDWR2zBZGb2eI+0M7OAgYy1DFaUE40SbqeAV
 U0IEPId7pYMwy9fCNTP4kwjdNbXoNSvPGTuVyfKZa3tid1LE0a3qAz6nR10i3j0+IgT6goG5MvT
 zY3QyDXirouW/Ul/piWousWZA+Z6BkPjZ9uhUjAo3i8mTVgIHS+inKN2Z4BXaI++2dZvacZt55V
 5F9qeRPR48uzvG1B0nK+m7ImMYEg7C4FViIJvIZik3WpphhIXGTvlwi5yKOqGBkjgwMC/J6D9pO
 eVrk2tftv1zDGS4/Y0GHxZhp69b3guM01oeLO3z8+/EmtqlEFQfcuz8vs+RT1ilcTB4hiqQfD3o
 rRonaolQFO+fHUVqiqw==
X-Proofpoint-GUID: DZ67iicBEgfZon4097KzWlnJyMLH4F_Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX1uJhZTxdkTOn
 OhkemEQeO64hG2nRvbTPvH1ObYXfMY2fOaRcACZjrb+uCnudTyrcuafQU0wnoKDSteU4Oj8Fpf4
 ypSjFyWLW/S7m661klLaHp75g26Wpps=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112450_433747_A9226F31 
X-CRM114-Status: GOOD (  11.80  )
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

Btw. you're adding optional state in [1/8] as well, so why not squash at
least the interrupt parts?

2026-10-23T00:09:19-07:00, Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>:
> Preserve hypervisor interrupt enable state provided by Smaia and
> hypervisor state-enable CSRs provided by Smstateen.
>
> Use extension checks so systems without these CSRs are unaffected.
> The 64-bit helper preserves the corresponding high-half CSRs on RV32.
>
> Link: https://github.com/riscv-software-src/opensbi/issues/433
> Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
> ---
> diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
> @@ -208,6 +211,19 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
>  			ctx->hext.hviph = csr_swap(CSR_HVIPH, dom_ctx->hext.hviph);
>  		}
>  #endif
> +		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA))
> +			ctx->hext.hvien = csr_swap64(CSR_HVIEN, dom_ctx->hext.hvien);

hvien also needs to be carefully ordered because it has an effect on
vsip and vsie.

(hvictl, hviprio1, and hviprio2 are missing.)

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
