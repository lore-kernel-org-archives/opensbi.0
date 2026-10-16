Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAF8CCF2C2
	for <opensbi@archiver.kernel.org>; Fri, 16 Oct 2026 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/X9tIPF+0MGu+GvATZFXvQ9whtINPSP+F/CYV+Ii60=; b=P7sSEBtezS95uK
	UIvXf19UC9154dbhnZAYD3GihxrUrbrVC/U9xYhlDWjl9UpsZfDSl7C7QOysxK7rH0cw3lNF2M/Ac
	d9OO5xPf2v9iwg9aWgix/RgvvO0VjOO54jWo63FnnykPv67msDKOhbz3HB93WfPhdQwzFP0YUifMQ
	OCuCzLPeNpld9F5SOpHX4P/CF4G+9wITy83dhnGBlJfG7G1zBpmxzpxkR7am6JbJs/MBLSP4MrmYH
	6lviz0c1G/0G+uTNGKcpLqXwWct61LxeMMsxcc4ejsusXk4X6jbU0Sb42akVkrYOIx9+AostoUNB5
	6d1Knpdil/elZjZuin0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmkK-00000003gV7-1njh;
	Fri, 16 Oct 2026 18:33:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmkH-00000003gUQ-45uC;
	Fri, 16 Oct 2026 18:33:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GG3Y6O3260303;
	Fri, 16 Oct 2026 18:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=FxUj5SPjkBfWEne0YkWlg3UyUdiJ/oyvhsBn1dbzy+c=; b=Hn
	IjHjvCpIO/nc56t/hYRaoGfn/ApAgX/hJOA64SDAR0vuXe0X+Y5oIgHChGQkYHbi
	UhCw5rEJEPtEROjCH4Gk94rLORRCa7/cWn58I8s3a2ntP0YkJQPT0GlygGQKzNVW
	0QBKn+SE4wr1Il+Aa6zuVsHonhxC1tMbqwclrcStHxXd5BJkrCcykyTuqXUp0JQ3
	c+W6TlqjbxbTRCqMSaqcOMgOvaluk2y4RiPa/BYC1qQCtx9t2N324FSO5wde+Xv8
	fJ2hUn5RW6hV/8sEpy9pY1gt6g+oVpLZsirIa5DG3Jyrq1sJnGCsEHMAo6B6VbLO
	q2sc70vl6dMfdzipKLBw==
Received: from dm5pr08cu004.outbound.protection.outlook.com (mail-dm5pr08cu00403.outbound.protection.outlook.com [40.93.13.99])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbq450jqj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 18:33:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qX//A8F7XIyZHs8sR0FtmELtyO7Pi5qArAqZUHLg5esYRNQZCE+M1WfYYGWZIKwuogvLNQ3XZwcE0XLiiWWK5qi0V082qFpjDBSJY7Ow8072Nt8k3af8IIy6HB8pKb44w7m7WKRf83nAsgODsenCuiR5sCCyrU42guIZGjDhvgSNtQgAxX40WW7zBjp6obAN+27p+9uikkvhFDCy/xD3emnfHiOzonn3oHdXJRUuiZpK/CMd8Cepjciy162md+7UTnZ+v5520WyQnitnSowK6kUgg62SRP+3iBM0WhqhuHWo2y8kW6eMqARn/Zg1f3VE+8cSmAgTLWX5y5CeWDwIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxUj5SPjkBfWEne0YkWlg3UyUdiJ/oyvhsBn1dbzy+c=;
 b=hNP0GdTs+H6k7OkZSIROGMbJ3oNnsXy4sEmZjDBmJBeTc9ekMkMqB2+DZYoM0g4IMeO1slQA0r0J1mDlBeKSVTNdWLMD11GBynTfe7IF5epFTWNAAabTAM564fqg9IKa/ROnimX62603wWgJjOE0rhD2gPmpQhSXVei0npImsiJU+gXSNwRASTiQTdtudcs9lXHdOqryAuqxEPUPRqq+8KPK80UPqz1Ftv8YgiHFpNlbRzNuehwsXbtnlD7MUI5ljpfbnGVyY+jbag6gIDr5o7hP3dXdaIss02iq0fEe2kN8n/1o23+v4QUBAkbkiHnfG3nzFJpTjN/hC02c74ff/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by BL3PR02MB7857.namprd02.prod.outlook.com (2603:10b6:208:33c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 18:33:17 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:33:17 +0000
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
Subject: Re: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
Thread-Topic: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
Thread-Index: AQHdXZMmsxllxspJoEa/r07q8m2M7LcAfncA
Date: Fri, 16 Oct 2026 18:33:17 +0000
Message-ID: <DM6H86ZBKPDR.MIW2U5VUWC33@qti.qualcomm.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-6-peter.lin@sifive.com>
 <DM6FR879EC0N.1XXM04LPUG5F0@qti.qualcomm.com>
In-Reply-To: <DM6FR879EC0N.1XXM04LPUG5F0@qti.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|BL3PR02MB7857:EE_
x-ms-office365-filtering-correlation-id: 82e8c881-e89d-4959-a5b8-08df2bb3f285
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|4143699003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: MY6eIFvybM1+eOMK5ZMM4q4lVcembpaYfbGM3PsEXtehGvzXVCOkdLGa5/ePzEETNWTJy/AmkKt83ZKgvFXv4LFNdEWW4xxkgm46k8J0MoNydae9iGBHvwqpCQVxyrJc690i20v6VZez7ibbc5AWcZrX2iEqbdx82U/8W4bLQWiqfUXLQkd938p2TX25hMCROWYCX/pNYp93NXNZoForkFGgczSR/GOmtmQ6g4T2Yqr0inssrN75k7cwmGVocBsHtZmjvx/LHmSPiQDbGuhmmSMUABuv8gRHA8KCSMyeSRbVxFQehyXjf7jHqUMACT1ELdgJDLjjJne7YeoxEzxh/1ILd6GuuYd/AYy3uLi9nB4rUCcMx7vcJ5+rJmXQjA8qKi4tVYzdHDQlvH06aJBdXBGQ00KJY9OlpP69Qwu4sRp3Jm+s5dFYORrfj9C7ODuMSCi7tFoFcQoin8lClo57WGpTgBb/+l1dlZ0SUasstwPMlbPhGUkcdDzoBgFLi2lQpQ3cUFz8tGQ9QDCpkAN8vr9KjwTor44Cy51/gkOurZV4kP5WpGs0C4WInIuzn37nHhRtPinRXJ1ygRoFLduRvXt6TJoyBogZYnq5CsPRWHXxMmAqxsoZ7d1l/1Qjl3OAemTzTxNDcKe27wkIoKe5W1Vgu1yquvyNYsUs0Oj6+vg5RtzDZRMf1QvKiKbH1Yy+efjD/O7/1qBIXw3rWe7NYwR4dKieG3jMbonIn67IY0o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(4143699003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUJNOEhWUEF6TjN1MHp2VldkZUd5UDBIeWMyQUphUW1yT05lT3dhNVR6WjQ5?=
 =?utf-8?B?dytRcm5CWjVHdmFWUEQ3R3kwc2tIUHdTYU56emk0V1JzSzJCTHFrQWxyWUdQ?=
 =?utf-8?B?YVNoWG1WUFZQWS9iU29NMTdXSlQzWFRadDRZT3BTS3lNdmZXQzdIamRxY3Vw?=
 =?utf-8?B?bnA1SlRPaFM3RXBvTFc5OC9sWXJqL0VleExMWWpwVk5jNDFtTUVTSVpIcXVz?=
 =?utf-8?B?WEFoMWlqVnZvWGxkaXJjcTZaS2pQVU91RGl3QkRBOUNoNDJiM3gxcEVITDBa?=
 =?utf-8?B?VXBPVVk4OGIwMUI4SitoVkRSTExmWkVOTVIzRnc0dUsrVUNMbnVuWFd1MUFR?=
 =?utf-8?B?UzJFMFgrSU56WFByeVVBRjhjYTIwUlhnTkowRHc1djJ3c0tVL01oQVVwV2lD?=
 =?utf-8?B?K3RaVjhua0hOL05qOUZrVFB0S1VZMlJyUFI3RkdER3F2WnhNeW9JSXRFNHZz?=
 =?utf-8?B?dS9QMGFhaUd6czB0WTdJZkFzTDlEYyszbm5RNEZSNVlVb0h3OUsvelVaeVhh?=
 =?utf-8?B?MExnZW10a3F2bktFd2VGVjA1aGFublRnb2drcVhmQjlvOVdXQXplZm5GcHgx?=
 =?utf-8?B?eVpGa08yWkVQZ2JhNUsyNEVJRzE0anl3UXdxaFlmRkZCQmlPMTU5RnAzbnFo?=
 =?utf-8?B?WmdGU3NFNFBxcU5HWEp4dnB1QUt6eU5ya2cwbnYxZHhvR3BtaHVqbys3OXNW?=
 =?utf-8?B?R2VQcjN1UnpscDRnNS9wOTFlUnpSdWwzWTlrMEJuYWtaT3gwSThqdVErT3dT?=
 =?utf-8?B?NWpUQVVWcmY0b2MvK0ljb1JaS1Z2Z1JKRzc2c0RGL1BYRGRLdVhubkcreWtr?=
 =?utf-8?B?RTJCS1pOeDNpNlpsRlJPZFEzUUZrV1NWUk5xcDhsalc1ckVrN1ZQQUM5cFpL?=
 =?utf-8?B?NGY1T2lvRGtwV2pzSGlzNDN4azdVaUhaT0JudnJwWUdVbjJKMFNHTXMwZkx6?=
 =?utf-8?B?VEE3MndQeTN1UmVPbUc5ZE9yRG1Ca01KaXh5c0Z0U0xRdFMrVUlHQmxIbTZX?=
 =?utf-8?B?VGl4Rzh3VVBzSkVzZWZNOHdoTVlaNkpad2c5TzdQUWczV0cvUmRYWFNEOTVp?=
 =?utf-8?B?N3NMOUlpQkdJcmpDY0ZabUVUY3lhZEdCZGN3VmtlTHB6am14cGtKeGFWcGda?=
 =?utf-8?B?YXZNcVZqSktEQTdzeW9hRjBkVkJXZm1DRlNjSm93c0pNV2Y1clNDMVQvMnAx?=
 =?utf-8?B?aTFiVDRBMjFvMCtPU20zdC9rQTFublpRbEFkMlBjWUk1eGppb2ZuWDRBNHJB?=
 =?utf-8?B?QlVyM2YxbGdhUWh5NENYTGp5UmszS1NLRnVPYVB4dXc4WXRnNkk0VnpwbEsy?=
 =?utf-8?B?ajVHejNYaHpKVzcyM0xWQWxkeGVJVEpEUFNmTXg0blFYUE80eURGWnNxL1hw?=
 =?utf-8?B?WitnaHpQTzAzdnkyc3VoZVljQjRudXlyY2RpUmVZV1VMRlBwZE9yRnVJZmNq?=
 =?utf-8?B?OFYwK3ZheUlGRGl6L1puVUlvWk4wdXFpR05MdVNYck1xaXd5dUZPT2U0Z211?=
 =?utf-8?B?NkNFVmV2QTBsNjUrOWgzd2g5WGphTEV1MHM0Z2ZBL0FtMWlOUk1wUjgwd0k2?=
 =?utf-8?B?d1pMRDVuSnFNcG1LTlVkMFlDSlJpbnEvVTlRaUtJZENTVWFiUU1UTnAvMngr?=
 =?utf-8?B?RGxMTitZOWZMNXdmMytneHJxaVJLU0hsb1YwditqQWREYUxOWnhJZ3VQbWE3?=
 =?utf-8?B?aUdHTWZuRmFqRUovNkcxSzJoOHJZNW5mZkRqWkpBTytZL1N1VEtzTDBoaUpk?=
 =?utf-8?B?ak9TbTE4Qi9rRW1PTUltcjNLRmV2Z3Fsc2dCZWxuN2ZtZjJUOXZXNnVENFB4?=
 =?utf-8?B?OE13aUtvTG5EWEM1Rm5saXdOb2NWMUhEUFc0YldQUE5BczdnT2pJWnNNcHF2?=
 =?utf-8?B?d2k0ZjYxR1J0T3BtZ0xnaWhyMlJhbFZmeEFhb0ZhVlI0RERpQi9pZjRtTWtM?=
 =?utf-8?B?dVJXK3gxSHdzU210R3gzOFRnV01rS0psNCs2ZTlhRlV6aGhnYzBySlFyZXFm?=
 =?utf-8?B?dTFScWpnazFlL2R0VUxSV0NwbGpZYjZzWWxsaXk2YjdFRWUvVnJpV3NzVHBx?=
 =?utf-8?B?clpabStDYjlsQS9MUWZnaVQ4cWovMkxYZDFKT1hpaC9UOHo2d0ZzdWVJNnJr?=
 =?utf-8?B?ZWZ1V0pKSElwRWNuUm9XcDhRZisyaHR4ZEsweExHblJrK3hSNHVuZmZRVnlX?=
 =?utf-8?B?ODNocGdyazc3bWxKSC9SSDJhVG8rV3pTaUo3UTc3WjN2SkY5K3R4UFFVazRo?=
 =?utf-8?B?U3J6Vk9ya3N0Z2dTcU40QVRaNXJ2VDc5SU55QTlseFRmWXRoRkorNnVjaGJN?=
 =?utf-8?B?dzZoSVdTaGZoL3FNNW9jd0pMaXdaOVB5TmNrYTJod0grRFlFOW9UVXh6bEpB?=
 =?utf-8?Q?Y608PeH+uEzemXmE=3D?=
Content-ID: <5F3A3528D48A93409C61F4BB63E8F8BE@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2gIofakFMX/snoT6qpIA91+X6maDqcYrxWQ7MHQsVwpqn9KRurToeURIBBXKnDyZ/98mJyR4oHdLCN5ZoRbnZfsRrWX0HBP7/nskAkcu0ypQ8FgeSxnLU9jADQj7oquvXuQH8Aejl+dAczGhjvFIHpnGUGbAknVa0bQr99oqgEggEejUarj6aIYkizVZddtoWWE6A3QC6uLnhHyBjRk9XhxE6QMh2CKlWq54dfKFdfGKpacGgZlf+gJmVh6sVpMrsQfuBf0k5YzJxAEW07zeS/drBkApuLPpdKhDnbMeXV1o2aJvR754Q4t/gEHI4LsTZv8OFwTCWGdJzeYJ3lDCog==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NPzuScKgxs77lu/AfwXzn+fBQC05C2ilyrdh6y6x/LGqBVkOOEXrcpARU66zlDkO5Sn/BxfqWIcZwl4bBUiKQeU9SFG9vIrk/2cXWdnm2Cuq29Tt3gV3r3eFE9y188ECZ2Y34c32Teb+oa3aF/dEnrg2hIegADhnxJUNZ9OFlJoUFyM9LkTdyK6xSkgDIHAtiCyXeeyplapXP6hwsUKD5xYqbQMiviEGi8/qI0TfohVBdCoqzNvZh0rzTzaCYXxsCGR8EFTq229nMvU4+6dPS1AQar+E33ysArmaw619lyj7dhcJRdTCCk9F4H8VvKiNtqhFzqtOJKT0/2l1Ocsg8TL/jFVfC6m17aR1aRwD0d5dC80Q4OGwGdT6QOkT0jFemiGAF3s5K74HdR55JN24sHtNXvTJiHOu5JjOqYoeFm+Ma4z56gbasB8DIbDWpIStIvSJ9Q9xh9nn/NRFHcMDLC+r2lDBR16JMq1k9YKMShuA7JdDhKLGoBtouXeMqwfc8y2CBVn9gctVm6hPCqo0Pdai3oQbp0EhJ80UMomwMHWuSDID2znYWFiRrMtcK8eUgIVdbDXT0WUvS8nNPtd1oZ44spq23JZiXOkepHVp+cFrVAypt4TkVic22R4Grmcs
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e8c881-e89d-4959-a5b8-08df2bb3f285
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 18:33:17.7569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0JzFxG6yFVBB/IjJTjpa5FsWMl14rcugJJEf6K8SbxpUDSZGPJ77uKDnu0m24eqmNlJA0eT1wZYpbsXeBng+g232nQwdsLZXmGzkf8BY6PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7857
X-Proofpoint-ORIG-GUID: 11DMG4GZ-UN7_08wrv4FlicLBY0RnjDQ
X-Proofpoint-GUID: 11DMG4GZ-UN7_08wrv4FlicLBY0RnjDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfX5nEDN/WM2K7a
 ECW6tKruPLKR+HchFRiGjMCfyvVfPa41xIJuwZAWDF660b65WOebmQIc0B7KTeGB7ArhCo+K4Ut
 qiq5vM/kLbO5AgbwQ0+M+6qrsTTz9hj6+b7bDE/skcdL07tD6sA7vWU6Uky1U2GVqpupAYi0U4F
 MRogxYhsZwOXStdKY80qJnIE1hLTRzi+xaMJbKNKPv4Plf/PBafsGQ0xpzb+JEjo4n4DeTzIMFy
 sdGRifFoMiESGRVfA5fx7zma8jDuZLpSvMcLd0Aw62hIPxX+Qm5yuOVV9MjygBYSGbOOFGS4epp
 T6fNmEKlO3V4CDCy63VQTUoKEfu2KF/istsof+4PLBOxNtaMdMAtJb7HDra+6QqeA/yX4ladbJd
 S4AjYLavRmZyKl7lkkXIQEsaiMWhIoEJvyXKF0589d3ipHZdrdr6ecUQidvu5D/AjB+pbMgEdWn
 5NeAf2EyEP1p2/M76Mw==
X-Authority-Analysis: v=2.4 cv=e4GT2qp/ c=1 sm=1 tr=0 ts=6ad26dfa cx=c_pps
 a=lnBElVBKEKT3wjluJUCtwQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pFyQfRViAAAA:8 a=UK848VDTuPpDU7QjEYgA:9 a=QEXdDO2ut3YA:10
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3MyBTYWx0ZWRfXzSEn8qDIeafX
 e6lTa30x91SO6uaiJ0IUa6R0Vr9bbLwQ0LRGzR/TdNn5UoTUxz5ix1MiBbTAMVjXnDdZkO9iwv3
 B7UUihr25BIOIOJZxnI+hJqLT5JXwlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113334_157969_244B0C06 
X-CRM114-Status: GOOD (  14.18  )
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

2026-10-16T17:24:07+00:00, Radim Krcmar <rkrcmar@qti.qualcomm.com>:
> 2026-08-17T17:04:59+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
>> +static struct sbi_hart_protection wid_protection = {
>> +	.name		= "wid",
>> +	.rating		= 100,
>> +	.type		= SBI_HART_PROTECTION_TYPE_ID,
>> +	.configure	= sbi_hart_worlds_configure,
>> +	.unconfigure	= NULL
>> +};
>> +
>> +int sbi_hart_worlds_init(struct sbi_scratch *scratch)
>> +{
>> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
>> +		return 0;
>> +
>> +	return sbi_hart_protection_register(&wid_protection);
>
> All that I said above applies to domain intialization.
> The actual code during context switch should be much simpler:
>
>   {
>     csr_write(CSR_MLWID, dom->wid);
>     if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
>       csr_write(CSR_MWIDDELEG, dom->widdeleg);
>   }
>
> Or only
>
>   {
>     csr_write(CSR_MLWID, dom->wid);
>   }
>
> since we have to touch mwiddeleg when switching slwid anyway and the
> unconfigure/configure is not good.
> Alternatively, we can add a `switch` function to sbi_hart_protection and
> move the slwid switching here.

Taking a step back, what is actually the benefit of fitting WID into
sbi_hart_protection instead of simple domain state?

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
