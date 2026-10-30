Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01377606A31D
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kSlzsorf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8ZJxYgi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g8z4BLzWLeA8er55JqoJwOEvcFixq/EmbFZDAr1KpuM=; b=kSlzsorfAC2rTD7vmZuRkWF5as
	KEzh8FiVGJwfNivX0VxqToty8C2oH5xSFQg+X+1/H1pKv2EEmbk/z1mk2EMv+NV5dRTCRvNXIqiny
	R089Rcf/SZIkVj1WtGpTNMfQf2XiZ8Vy7T5/pLXupI5fnL3RERJb/ynNhzPFcuI9uf3Z44GiKRvrZ
	4uy0HGmfpx0315oZHCuw0M3bQ/k4qriSa5pqoww7URWtkpFcBusHc6MMsrO3zoWBWDLPaELmn9GAP
	PQiCewKN3NmiSA88rGoWZ8pFp/eMah0hXdHVHZ+QLKzBHRw0SfdprdxnKN2TUrQ+4PZxmipgGUgb1
	sYF294dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMm2p-0000000BhbP-0trD;
	Fri, 30 Oct 2026 12:49:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMm2m-0000000BhZd-19oF;
	Fri, 30 Oct 2026 12:49:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG1mk2071595;
	Fri, 30 Oct 2026 12:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=a9JsmqmjfoZU1OwnuiJZjPiWMOArTpkbdeJ/mY96dEk=; b=l8
	ZJxYgiTYv++ENWX8LjeGM7OcEqfBDF8ce8/Bo8zGMEqjCT91dWadLpkXr41w7AFs
	ZDpnezNVRgG3yiOu9RNGH7kN7jb4qnm5XSzqEbLGA66HNBZW3ODGOkW7VwGq31YI
	9wgBgBCae4ya+VUS24TtRP2U+UUJPqFg0iWtsPnTdblVP09CkzUVPmuk91+A0UUi
	cGEjPtDtcwY/2mHDIRvfwc7/DeLbPUoVjJWmnWw3KxQg5iFGgtnryjnkNKsYztbm
	dXn45UZdDnoBYuHr9jj0fQszTyNj1C8j/Rm8ulDp3WXLZq/DWB7i611ZIo1xX7CP
	FYhW9YJx2je/XjNHcjvw==
Received: from bl0pr07cu001.outbound.protection.outlook.com (mail-bl0pr07cu00105.outbound.protection.outlook.com [40.93.4.5])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3498-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 12:49:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIcYuS5jAKoqBz7y0XE1OOEOI6d8nEaPQnDuVxEdpRtFPjWo8y/UoJHGq5extk0alEtL8MKgTmFkttrKNsyrXOR0EQEv7JmH5YIxMXzZ+SHuOjFZKPysK3yojnjTndPHbCy4Bd+MwSybKzinmhsiESQUk0kTsWRyRJFgVRGXnjel2fspGfM3zMlHWoV9gijuYCh3ks/peMeBPI4SQmKvCHApwVAoGYaNud1wBUBk5Cdd3iGuItn1bRsfEVmoC84krOpEZvziov7ksM67Tmx59qyPtnjGhUzmWZ9uGg9BUFkR8pXwiRJr/7SAJ/rlb/VttSVAkOOlyYUvE2hJiBhxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9JsmqmjfoZU1OwnuiJZjPiWMOArTpkbdeJ/mY96dEk=;
 b=Lo9F4AXGIiTnRflGf/Zghw7ZJXL/dOBGJqwtewZEVV6hkxu99+xtVjUwxpvGbszcPxxtunIVbA+Qzu/Yvn6vwcmxgLiUYQOVvoj841ePw2XszDOdSyOvh41I/bCzS3IytPQagHckgb/wBdyk2xSN5jJC2KPKCeYb+zcUdQTQLTFqAxOwOZtY2tbgSLzXpRRmwkkNMWRJO9b1a02b+1bksprHNo2D4eQCYj0/VdnvSluj6Nd3/8utRpJgwPOdQZhBT/HZx8+NwTnasjaJ9cymw+SY0FfUd8SsP1QhN/VtRFIJsmiKXUMqZJL2gaxhapvuGUR5meDH2KlDP98tlmmqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by CH2PR02MB6727.namprd02.prod.outlook.com (2603:10b6:610:ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 12:49:09 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0546.021; Fri, 30 Oct 2026
 12:49:08 +0000
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
Subject: Re: [PATCH v3 9/9] docs: document WID DT properties
Thread-Topic: [PATCH v3 9/9] docs: document WID DT properties
Thread-Index: AQHdZe48RwyhI1wsLkK+gyvi7HX94LcWDjwA
Date: Fri, 30 Oct 2026 12:49:08 +0000
Message-ID: <DMI6OBB8VVH2.3R7QIDD1FYPO2@qti.qualcomm.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
 <20261027083509.1076577-10-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-10-peter.lin@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|CH2PR02MB6727:EE_
x-ms-office365-filtering-correlation-id: e7bc5fee-20ec-4769-73c4-08df36843047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|56012099006|11063799006|4143699003|6133799003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 9UyL9jyvgj2p7AV/FPxFAPGIOl3Ienvw6ENyG517J2SlNyHYLnr7H6QwcZkmfxcBtgrx8bE/pHGOt2majEslc3VvYLlRT0R3sK1E+uugG3ReFZliBMLV0av6Iidq7cOgpcsPWQj7gCxgDPotjGx9jbs0mrSyYmlipBG48y3foZVBNxtk+JUOUhvYWwERgpAiu01gIg4slHooeAP6BCyiSQ+im1yEJPVl6nultc78/ZmIVch0FKbjpBIa0uusQvngicn/fWNc3Fz8IMHvbotFBR0V0k9BX7gsFUqO1qQ7mV1/IAIbmV+lZPsMgP/XjW7/2/R8GlVzG71+epF3nFxdwVR7NhIimEqxLRTxswzCEgONMKt/sxii3JIQZHftVJuc/ZjCRSMD6VPCzX5mZtxV2UQPXN5SQ5VnLxZcgX+GboOFixmCmwij31TCjp0T84JKPxU6k6X+PVT77Cd3OTX49Ni3aqme3wzD20feAw3HXuvvvWBZvK9yRxxDcaXFLfJ504RlJpKNbc3LOpdpq1riJC0W8WypF4F1z38eBg3K3XYjQis0adp8A/tVoq15zkVQyogV37Bocc8LSPppupHoWNZ8Zzt2fpJfPSe/aT8p0ZZZSjVLERIiHEd9OiompQHepVmd294JOlF5BFChYGM1XtUGG+bqS2DK0gfwFfK2yWX4QF475ebXr4dhDz9PW0yVLotiqjU1XtNARJf7VM1x48j/bWZ5k8WDLIkQ5+Y75Gw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHJiQVdXWU1sU05yWTBpMkVPd1pVZ0l1Q21JRHU5OGZnVXhyTldKcnFPTTJ0?=
 =?utf-8?B?VFpoNDRPVlE5dFpTa0dUS09INzE3cVMvR2JSbzI0S1VNdUpFeW13Q0tmdDZG?=
 =?utf-8?B?SmpESGpyUFFmc3lSTitKM21veEFzY09xcVlLMUowdkw4VDFuVnFtejZ3SnRO?=
 =?utf-8?B?TmpBaGxpaFZ3SzRkOFhiL1k4MWVXVm1pd3pCUm90ZkkySUs2bkk1RWEvelVW?=
 =?utf-8?B?d0dUN1l0TjN4eVBHOG5nOHVjbW1pMFVqT1lENVFyeEZTSWRqZDNwZmpPMlRM?=
 =?utf-8?B?ci9Lc2Y2emljSWdBMzVlS0JQcVhBQVBZeFNsWjI5dGZrVzlndTBibm9aSXR3?=
 =?utf-8?B?K3ZiL28vNDJCenR5YWNXQkdqcUMvem5GNTFBcy85Vkh5eE81NlQwVndldVlw?=
 =?utf-8?B?Y1JRMWR4aStvTStzdXpteWlxbWpJN1gvY01mM2drb3dtOU5EQmlnalRDWFZB?=
 =?utf-8?B?eWJaRVNZYUcvRG83ajRhZGcxTVRvUXk0alpadGp6Q25UU09IQUUvUUdRaFBs?=
 =?utf-8?B?TERQOGtOamNWRUxrRGdYeWUwNTc4M0U3ZGFqb3FndDFXQUIwM2dxdm9YOGZ3?=
 =?utf-8?B?L1lhWGVhQ2M4UXR2Nm5hVnpIaVZDRm10NHcyVGtVcndSblp3b2dtRVlrTnZN?=
 =?utf-8?B?ZUdZQit2ajd4RXVDYnMwMjhxd0Y2Nkl1bFBEWDVvZEdCVGROTWRucHNEZ2xa?=
 =?utf-8?B?OEF1Z2t4TzI1Z0d5dGczQy81ZDZMNGlUQU92cnMrU3JxZzNRMDAvMFczb1V1?=
 =?utf-8?B?WGZlR3RkWDlyODBVSllPM3hmVzYvbURpbzhOS05VcFV4VkFUbCtDam1xLzk1?=
 =?utf-8?B?QWVvUDBvbEVnVFlYNWhUWEtnZ2l2SHBUOVNNMWlRTXdISHNlYVVmdm5rblFV?=
 =?utf-8?B?UmhpMWw1Q1NnOTBwOVBzNmdDdmh1eGR2S2k0eVQ3YVhYN1Zzb1hMVnBXNGdQ?=
 =?utf-8?B?c0lTT3AyQTAwbWY1emlhYzRmRlVHbnBkRWNackdYSUFIYjBjRlU3d01zM0tX?=
 =?utf-8?B?NUw3bzAzcHFlMVBIS1grQis4Z2RyYTdxMDdONlZzOFo5Rm9JK3V2M1cwV0Zl?=
 =?utf-8?B?Z2hNc0dOR0x2VTYrNC9raTlLbDJFVzhPNUxDSHgwa0RaQmZtT1JQUTI0ZGNt?=
 =?utf-8?B?OHptR3lLYTdBNnE1WmJNYkYxUnV4WkozRW9aYnUySW5iWVhNQUJUZTZTYWV2?=
 =?utf-8?B?YmIyS1BUbTJ5OTJpTzZSZVJHR2owcDVBbkRBeXFXMzRzOGppS3BoZWdNU05i?=
 =?utf-8?B?a0FoOFF6WGJrTXhsV2lHamlkclFVMGErRURnb3VZVGxWMDhaZTdFNldOV2ZN?=
 =?utf-8?B?Zy9BeC9YUkRIb1d5YkN5OHhTdjNVMGRnNzIxU0M4c0p2eXoxS2J4MUhJRjhI?=
 =?utf-8?B?ckxleWpTY1QzTjRTaXFYb0EwQmZzU3MycUFCTHBGSEJyRy9pdGc4czdRRisr?=
 =?utf-8?B?OXpYYjRrb254dExveVJ0UDdaZXlKZDB2Z2gxSDhCS0d0dExnblN2azJoNE5C?=
 =?utf-8?B?aGxYTkZvcmZ3aTRuQXVONFpKMXI3aWJUNzJaa1g1Q3A3VnlQQW5FVUlhR3FQ?=
 =?utf-8?B?NXV1OUhNWklrbWN2YTVOZzFka3JxdGhZTzJiYTA2VWpMR2s3Skd3eXdnekRV?=
 =?utf-8?B?clpvYWhuSVpreStOYzJ5ZjY0U000Q0Q3ZzlFaHhZenhtZmZkK3RtSFZPdzdX?=
 =?utf-8?B?TTd2d2p6dFdoVFF4LzQrOWNkM20xeVFwYlJqaDBIdFUwdythb0x5L2VpUmZq?=
 =?utf-8?B?N3pCRDI1WC80djV1Y0prMkIybXY0MnJMMGk4Zmpzc0RtTnZpcFlpQlVWYnhK?=
 =?utf-8?B?SVdBdjNJa0FnTzhRUXp0cDZJWWplNURHWTM2M3BjRlpZaXdGdUhYNWxqVlFN?=
 =?utf-8?B?eEJaUDdJdE9UekQxZVpjRkZzZlEwVXFtM3VXb0JveklUckZwVjNzaUNreUJQ?=
 =?utf-8?B?Vk04UExSY0hRVkZNd28rby9UOWlnSUhBeFJRdE4velV3L3V1QzNmeVhRNStH?=
 =?utf-8?B?bDNYWHRFTnkzRWNheTR6a1lQdUJzejlpYW1mY3BjSlRvbmhkMktKc1FRYTlM?=
 =?utf-8?B?VjN0QjRCS3JVRURNOHJJV0M5TW55dDh2K09iNjlNbXlTWmY1clhmWVk2YmRX?=
 =?utf-8?B?OXBRR1RDUnE1OUNRczc1ek9UM05JYlpSTVBwKzUvb0FvK21md0xjdmV5T3Ba?=
 =?utf-8?B?NmZyZ2dyd0Y0eE9Bb0xwK0x3RDlRcTJRWkR6d2lHZ3VHN2ZyQUxjazd2VFBS?=
 =?utf-8?B?S1dncVl2Skh6UEM2aE0zUGE0bmxaRXAveExqOFNJa2xSZWVETUVKd2RpeXlP?=
 =?utf-8?B?VU5jMXZDblJubG5MQ0FwWVUvUkRtdUVJeE51QlYreDNtKzJqVkNBZXVKL1ZL?=
 =?utf-8?Q?th6UzVgNvL1TY05c=3D?=
Content-ID: <06EFDC6BA0ED294A95D97D0A638CFAD2@namprd02.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pK1LWY03sqz8X5Qff7Q9WlrnkT0dTUdMN0cwGjxXuFsDR2v0COid50r5dIF1t8nZ4A+hmZdzRhtW+9IS6YUFogC1GRv7O2+XT3To3wqJosYzrfeZIQCkU6Np203kDNq4symz3pv4aQBeu6pHRjhWXf412Oq+7EL1vB5dxE2DajaYBkO8m/+NnH79anb3l7smjsnhj9PQgNdClq18YSIeZ58hVFaoIWjarbWzGwZTM2PDfuhowmDwwS3StazAjGB6KoHN1Iw94vSzkhDMk5rVN/fEEzmVXxmLl4XHd+hKkCvdSc8SFEAzuXTId6CsUipjpTYJ7VunSX0UkQi0DDgPHA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ysn/2uiS1s8qWCMsSpqsyVJgmGLwhGRe4dn+o8BHv6SoEyaT1EwINy2UXLzkKCTfjwce/HOGLboJdTIaNvzYjNk2x0zis3wH3UOjFgpnBfR8Rii+SOfyrqM9GA1wN6P0L5RissqxAwisI7gFNIH+YqWCvF0oKTohiiSGmLA5fot0orvI9ybJfRMjIu2Dc0wQudmqqYy0Ek8diUBFtXGmkHai2wxmhZ68RWp7HzO4IgNc5sJy5i7/TYDN803s7tc5NUG0/d3QB/cxLU39Vfv2Qz9V9TWK/ltGi3Z+0K1L9GMvcf1dQbTD1ZdpEKON9u2ghUSbBpGH20es4254fvlEFZAmBpj04lEwSAABvTGSXbevWLGMeUX2cppnfgIO5b90wyEwEsQcKNrZ2qRPinGRfS87LA6Y68jjuRw295lBGEwDMuTE6hMuaZrYNJHHaofcr4fT6zaFHu876ht+HRLkMFeOHCjd4jV8quzE7E98PgLJiVVTkC7/sAeS37RcOHDerQt/vl0sP0veNuqAAH/VRLvl7PvZxigEkIRxRokPk8YRoQyldVa3RojqRkXYpp5xYqy36HY5TcvLJBsEFcTQmGFye8dtOepo7QQPJRlxbus7cX+4LWsZCACE7KqcaCYH
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bc5fee-20ec-4769-73c4-08df36843047
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 12:49:08.3361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MR7+6hsXBMg0oWb59WS0mI4ls6HPlUqUlAMYXLWk5SsO8vkc5/6pfNsoah6uRMIxP3moxzWKOxtJbTQDp/QftGIcRURiGso5N4QcBMIr2tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6727
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX69kr27Dvj3q9
 zuOQ2ofiQraXsbykOreCTaq23tv1tIHzpzQjr39XmkBIC/vgZOnvFKZVGCS5a9fWDpqffFmSIT/
 mrcakVs0FOFtUMfc80YpDC/igL0Sl6alqRBKfK8s476ivzEBTu3qWp3VyhrF4zaWSkskytorEyH
 Fuv5dI4JLfJmw6de8GQ5vxtOWjOU11Xt1wHAXmNONd+d54zb31QuHF/vgQteKzq2epFgYIP8DE9
 Z7nrQdR0qxgMC1dEZDIjQU3YeFvSbiOymDt9HlPjhvxvs47ckT0jk8gUOxS8McNfPLxYNsQkhAz
 MSiQP2y9PVWyuFs6oqRG+mXwY4jTSTZKyo5XVjPSpAlwM+iPUwv7GgvbDXenvIY6I+bCHsO1Gzx
 WnkI55tnsRWl/LJxXnxiD4DLfvZTspP0Aci29z7jfVNwa6UnU2ANffnBAGE3SZW8uEJHJ1k7hqP
 m/9ixIEJp+lSRbnqzbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX9afUVqQMU6xu
 dAKmnJZTVU+XwGd5+7HeStE8zeDTowi0Vqdft+PfK+CnADNSLFoXYV0rSqNGMkK6FcPGbIAtP3u
 QVaxq7zHNJ2YLfJykBDKAcqjn061TWE=
X-Proofpoint-ORIG-GUID: NEeH0rZNXXGg2MpZRLBSrRXaGwesrXQX
X-Proofpoint-GUID: NEeH0rZNXXGg2MpZRLBSrRXaGwesrXQX
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae49249 cx=c_pps
 a=SzPxVFfh7B3C0UVW/03dkw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pFyQfRViAAAA:8
 a=2ObFmKnM440kR3ZBZ5kA:9 a=QEXdDO2ut3YA:10 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_054916_435459_14E8EC21 
X-CRM114-Status: GOOD (  13.64  )
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
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-10-27T16:35:09+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
> Add "wid" and "widdeleg" properties to domain instance node
> documentation and example DT. Add a "Root Domain Node" section
> describing the "root" subnode under the domain configuration
> node for root domain WID configuration
>
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
> Change v2->v3:
> - Mark 'wid' property as mandatory when Smlwid is present for both root
>   and domain instance nodes.
> - Remove mention of M-mode WID fallback when 'wid' is absent.
> ---
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> @@ -205,6 +225,13 @@ The DT properties of a domain instance DT node are as follows:
> +* **wid** (Mandatory if Smlwid is present) - The 32-bit World ID for
> +  lower-privilege modes (S/U-mode) for the domain instance. If the hart
> +  supports the Smlwid extension, this property must be provided.

WID CSR field with Smlwid is log_2(MXLEN)-bit.

> +* **widdeleg** (Optional) - The 64 bit World ID delegation bitmask for

mwiddeleg CSR with Smwiddeleg is MXLEN-bit.

BIT_ULL(dom->wid) in [6/9] is UB because DT parser allows WID above
MXLEN, but it's easy to blame the platform for that...
How much do we want to sanitize the DT?

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
