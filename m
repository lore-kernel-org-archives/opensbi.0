Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117C0E7DEF0
	for <opensbi@archiver.kernel.org>; Mon,  2 Feb 2026 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zpoQEAKIjQMbkgiDVkqiICXiT1l6/twh3xmkT/Zt5I=; b=bWUDsWcvJdKzTN
	07lU+iAQrugoVOzJB/tT2+dWSraF1pDvQ1EnOCVj3QkXKz6JLme3j+whB6B7qHjczlG4g7DaPd2ac
	FOrD94F+594y5Lm2fIWEMiv9EJ3UivYJOkiVB/00KiEnzkrGeeyHPIvtdIl+teX7dNyRN9VaM7JBy
	lyoJzIjyBaZZDSEoeo3mSWxb8dMVMClaMksipyxq3BnbaBTgW02Vus2op2m+eMHOpgDTu/iMINuKG
	MQujdmC4rkcdI2XBWDzO2n4PR/QaZdxE1wefb3hix9oDqdrpHPe0lgAAuaF0YOSfI7hBdeqrjanwS
	rtOEjVhsKzhJFwwiXC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvF4-00000005895-1YEZ;
	Mon, 02 Feb 2026 14:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvF1-0000000588Z-2RRn;
	Mon, 02 Feb 2026 14:49:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVU2m2357132;
	Mon, 2 Feb 2026 14:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=gdp+YIAUri6Vrr0aNRu5fd0oQ/YoR5OOX8INHKkqEVM=; b=He
	34GLRjaXmTMsMSvv9EvRx86Tqk+SVN4iXVdfFweT6nbm6+/0fUa9hlCa/XWZlUYF
	L8jYFF3M5Db2QwEn4QDdddmKqroGYRUZ/65YvMiKa3+vRn7APBHezc4qbq6N6aAo
	qgHO0kYCy6PU2gWeHhGz90nnPajMm36qKHBfde/Q10CGC8i+SonzXoW8cKfvzh9C
	kyAXbpAohJ1q+Oi3iZVsvz2Agm7t2o1FPFRiUOkgZpNhpIZdktHz+YMAQiqVUW/V
	uKZ481NKF8FZkBjJGy+C+DEQAmAJ6vex+WuLolr1dTzdcFK9SoOvZpZQm0Q0bQlY
	6ZZ25tBwTbsHNUuXZTkQ==
Received: from bl2pr08cu001.outbound.protection.outlook.com (mail-bl2pr08cu00101.outbound.protection.outlook.com [40.93.4.9])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0m8c1k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:49:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVpIg0ZRPxU0+8GtXiLmlvw1ZmZd7dfpBXR5piXedZqWsJcsx//cevZMDT0Mex3V+U9FveRUgaB3xeUE9JPGFsf6NZToHcn+84oAuzBSg6cxrzK7B6IMB0DdBIk67DfweJIxzeDTG7tnlKpo7WLs7NNkuBIs1su/X9PmsZC9Mqu6UIDQXpdNVzQWYEG5r/RK8FFvSo9/V73QUqWMBrHwDH0Eg8D+zRaZm4AclIJnUdC6ecL4W9jjjkDrKUuOwg57ftII4ddcHTb4nf8PjFOHyPL4yPC30gnl0Oot42XS/knDBTD2e/3uqRh+WtydVq6QXS8GMONj4gO6dUe2Y91+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdp+YIAUri6Vrr0aNRu5fd0oQ/YoR5OOX8INHKkqEVM=;
 b=cXtUHghcm8EeawvGhOG2u8N2RbfHc6enKF8bh+9pBZXhpRtG9V6Eg6kYrwjOxDqU3R4iVPkQpm0xxdiaUIRhgyGjyRixyTMYXfoWQZ06ms3+j+X8d3D1KtuyoR3wcJ+bswi7I9eHFODAxgew9b80VPiO6MQ6/pUzS0II2TFZuLQSZFctQ6VXM8DEdienHm6QHOoCMzNwpEV51Jq78KUQtRhY50dB0MUDdwBQaNtx5761rN2NuSetlQlmUtWGXvZ3yB3HPKzTaH+Y5STaokwYJUdS9p9jLm4vg6SGKim07hC3Tsy4lXaI9G8+mBt2EF6NdImZiUoPTgZnZcntR6fFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by SJ0PR02MB7167.namprd02.prod.outlook.com (2603:10b6:a03:297::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:49:23 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:49:23 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Nylon Chen <nylon.chen@sifive.com>,
        "opensbi@lists.infradead.org"
	<opensbi@lists.infradead.org>
CC: Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>,
        Samuel Holland
	<samuel.holland@sifive.com>,
        Yong-Xuan Wang <yongxuan.wang@sifive.com>,
        opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH 3/3] firmware: fw_base.S: Add common NMI trap handler
Thread-Topic: [PATCH 3/3] firmware: fw_base.S: Add common NMI trap handler
Thread-Index: AQHclFMemyHj5JqGc02zhMHBsCHOuQ==
Date: Mon, 2 Feb 2026 14:49:23 +0000
Message-ID: <DG4K5AOGY1J9.1BWQ6O7XEY7S1@qti.qualcomm.com>
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-3-5d297d3e2027@sifive.com>
In-Reply-To: <20260129-smrnmi-v3-v1-3-5d297d3e2027@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|SJ0PR02MB7167:EE_
x-ms-office365-filtering-correlation-id: cfa90809-c1d8-4386-438d-08de626a4119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TW9lb1lQdGpRN0pSbFg1NkhMZk1PVGk0SmFyVFQySTg4clVYMld6NzhnNzBL?=
 =?utf-8?B?QkNkTkUrYTl2WUw5VkVsd2Y4WVJURkxqcVNGRnBMYU1NUG9LdDJBRXh2TG9w?=
 =?utf-8?B?aHpCUEpHWVZ5U2Y0U1kzU3RHdHFxR2xjQ3VIYlJzb3ZZRFFwb1VlL3E2c1BP?=
 =?utf-8?B?TFRGWVAwZ1lnekNaOTA4NHllTUE1a1V2TFVzbFlRaFpoSTQyS2xiQVNBS2xk?=
 =?utf-8?B?WWViTkgzWURNckJNM3dlTGE4QWs0YW9kdDhyZ24wZkc5czNSUlEzci9RZkJt?=
 =?utf-8?B?SGR6SmJ6V0FjWEVJdUl6cFRZdkEvejBsSVpZdkpEZ0N1SWNvb0x3OTh0bnlO?=
 =?utf-8?B?bXNCTzV4cDE4RElUVldXY1MvU1p5Y2p6MXR1cUFMY21QaUROZFEvZWpHZ2po?=
 =?utf-8?B?SHZNRSszT2cvRU04b3ZnMlVoVFBOd21oSWJZcHBiVG5ocTVkSGwwSURkYVA0?=
 =?utf-8?B?N2hIRE1hRk82ZkNhZHM0NEZCdy8vU1JFcVliTnFITWxrTTZLYU9WUjlhWUg3?=
 =?utf-8?B?QlJPWDVRWmZyRlR1MGwxbVNIVDAyd1VoeTNkU0JqODBFbURGY3l3clVuU3p6?=
 =?utf-8?B?WUNJMVhUWjRZcXBLRWxtdGZRRm9xZHJQMjl0TzU1dmRJdkJlMFdNcUdYVk5Q?=
 =?utf-8?B?aXB6QzcxRUJEbjM5OWNhOVU0YTU5K29zdWZrSFhqMzlQaWJRSXJJVStwN1cz?=
 =?utf-8?B?ZEhUeVVEcUYyUHhkRG5XWFFObnhLa3FZaFJEekhseUl2OVdVLzhuYWJVaEE2?=
 =?utf-8?B?ZTJIN2RSMTdEdWpneEFHSVY4cXdRK2FHL3BuNzJ4SzFKaDE2VUgxT3lpajYx?=
 =?utf-8?B?UUZaeXlLVENVSW9kV2dIbTlIcGdjQUJBUktxZE1iMmlmSmVkTnNUSEJ3UERH?=
 =?utf-8?B?cEtEY0ZhS3hwdlpmWS84eHNlQm5VVEkyeSt1TFMrNE5zYjFra2dIQXphYmpu?=
 =?utf-8?B?eXlTZ3VDNU15czFqRFZxaXRBOEVUQkV5OUx2RUNtNWJBcGJuYWZIWkdacU5W?=
 =?utf-8?B?ZkR0VS80YlVHeGltYzhBeG5TRWwvVEtDTmRTdDJDSHJ6eStwODR5OHZGT2hW?=
 =?utf-8?B?VUYvM1RIdXJiOU50Ukw4d0JRSDBCRFZpbTBVOE5La3dibVpmR2wwOC9ndVpn?=
 =?utf-8?B?QUFTdit6NlhqU00xd21OSmovdVJtQVFGZTl6bjBMWUZ4T1Fqc3hra2VxVmlp?=
 =?utf-8?B?Q0JGV1JiWmNvU3EyM240ZythenVhUG1NVTR1U0hnTmN0a0x2c0gwYlhyckd0?=
 =?utf-8?B?dkhyRks0VmRmZXFBSXRESk52UTYyUU1mOEwyUXJhcFlDRmNMbFNNUDhaeGYz?=
 =?utf-8?B?cGlGclhNMHZYS0ZBVE10NGo5MjJoM0hwU1BMZklwQi9UVjMxWjcwc2I3eXhy?=
 =?utf-8?B?d3RDUmNPWUljMHMrcnFXY3ZFUlNFMXVYdlNJbk9QdEdLVDVQUDVCaDBSZEIy?=
 =?utf-8?B?a3Q2bzlSRmZXK3FmOFVESnhmQXR1OHVMOEZZdXZRdys0NTFQNVdLZndLUWNS?=
 =?utf-8?B?UHNxcW8wYkFBSGJOWDFwSkxrYnRNRkJZK1doVTFQYWZWd2ZHWW9uNjgzOWNN?=
 =?utf-8?B?Qm9OdkpOWmg0SVlydDFjLzVISGx1VGdLd0NoRTFzL3hNeU9KZ2trZzE5bnV6?=
 =?utf-8?B?YkRRa3VCMmNEUG5jK25nWXhQMm9Jd0cwZnhEQ1U1OGN6d1QvSmVLaG10cmw5?=
 =?utf-8?B?VjV3Q2NQM1dBRWpyamxkd3phVEZYNTZZblZRTnRmUTVZWE1KdEZhaVBrRzdU?=
 =?utf-8?B?SS84eW5PYTdPeDNiSUEwaXp0R2trTlh4YVljZFJOZllkNm1MU3QvNXFZcWdj?=
 =?utf-8?B?bG8xclFxb2IxRXlOSkRUK1JTSzRxYmNqWmZwL0p4NHJFZDl0WUUzait6czVq?=
 =?utf-8?B?bkRKb3VFbDgzSzZES2ZLSmpwWWhFQ3F0c2tFUmdQQTQ1UmFYam93c0MvNCto?=
 =?utf-8?B?OWR3b3pMb1hiWmdWV1daNm1DRm5uamxPSFg3UHFWYUt5QS9BeUdYQUsva3po?=
 =?utf-8?B?aUlYb3ZQR0hhb21oMjIxYys5Uk9Ib0hIZDVKRERUTXJud0dvbCtCK2hDZGp1?=
 =?utf-8?B?VU10UHlFLzdncDExZm5jeWVCeDRuM3N5bmlTeGRhcElhSTB1amhGZEMwV3p5?=
 =?utf-8?B?dWdlZERWT2xUc2swUTBpNTJVbm5MWWVwdmNhc2dZS3Fqd2JZRzVKamhVd0lh?=
 =?utf-8?Q?NsUzfAi70x427rguxg+y9Gg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTdQVHNqa3J6T2tZbmMyVDBMdlRPRmhCbHROdmszNEMvQ3lURmRlczIvQ2pY?=
 =?utf-8?B?Sml2YlNmajBUVEJRUE1TUVNFOWkrUFdPZ2ZLYU1OVTlYYk5RSDVxL2o4YzY2?=
 =?utf-8?B?bDJYaVRpdlRkMFAra0YxTVd1eUowbnBvZVNneUxZeGtvOFY3SjFYZzhRbHYx?=
 =?utf-8?B?SzgzMjVneVdZbUtRR2RRQTZZR0NDbDNBdXZ3ZkJrQ3U1TWFJdlZpRU1IMHJO?=
 =?utf-8?B?LzZ1T1JPaEVWRkNpU0M5RTUvbW9tcHZIUmxtcW1xQWlqQlMvbEtESUx6alZS?=
 =?utf-8?B?ZW5GbmdWQlZyNmF1NDZveU0rMnVUNklYWXhiRFdFQVJueFUveVJ3YkxjY3Nx?=
 =?utf-8?B?ODM5L21SaWo1NHhLZEV1Q1ZieDV3NW10SGpaOTNIN0ZNTXNLYlZkcjVsZTNX?=
 =?utf-8?B?MHgvR21hSFgvOWxXMU54UFBWbjNVdzhmWmZUUUlvOW95UUlzaUgzNVBWZS9Z?=
 =?utf-8?B?aElCTnVNN3Q2YmY5T1Jab3NmUmZIT1BEbHZ6RWRyQlRXS0cwSlVuak1xWUZl?=
 =?utf-8?B?RVVsdFE1NDdQemlZa29iTXlXT0htSWMyMkJlNUNEc1llUkh6blYyQ0d0dGRE?=
 =?utf-8?B?Y3BoMExvSWR3MzlGTjJhbkVLNUQ0MTkvZDVidTFLeWkxMkdMSlpJRVZCczRl?=
 =?utf-8?B?TXFZWWNVbnRCNmR4c1JTUUpyVmhUU0R4VGp2dlg3K3FuMEcxbktHZWo3eEtD?=
 =?utf-8?B?M0JqeTZLUDRueEoxRkIydHJjY21WM0lsVHcycjVBdGRSSUZDckhrcS9XdTRh?=
 =?utf-8?B?YURBYmhkNS9OWnMxQnAvalE4ZG5QbEFISStleStnSXFrSmVZVndVNmI1cjdH?=
 =?utf-8?B?Yk9JYW9aKy9NV0k3T1lXYndGZHhJTm5aQ3I4VXU4REZVVXhBU0w5VXNwZ1U4?=
 =?utf-8?B?YXV1WEtUcmNDV0JCNSsvb2xHZG0wNjcyelV4MEx6UXpkd3FaZmJtQ29jQUp6?=
 =?utf-8?B?WkxEWEZ0WE9HSVJFTy8xUWtCOFdHL3dPRmd2YUttYjB0cHpsQXBOclRyZk1P?=
 =?utf-8?B?V2FlclpLQmJiZVk4emU1bW1PeHFPY3VvTnd3MU9ncldCL1hjbEJTaW1aeWdq?=
 =?utf-8?B?alRjMmw4TDFmb0JmUTFiQjZyQk4za24rNFBLVktmN0JpTlFjMUpmSThsSE15?=
 =?utf-8?B?alg5c3FuYXpmRjJoK1B1R1Q1SXR6OGlqSm44V2J1L3UxMGViZmc2REVveGZk?=
 =?utf-8?B?Q081bkZrQnhsdEIyOVZJaDRueFlLU2tMTTZqb1NydzVRbkV0N2tEN0tTNGE1?=
 =?utf-8?B?Y2dJQmhoWDViMjJjTnRuS2dLUlQ3Y0FJNzU5MlVudTJxNmR0ZjNjSUM0MHNZ?=
 =?utf-8?B?V3FwNlpwNm1RazJESnViQk9KVlg0NytNbjhtUFBZUzBYVzNmNU9PeGZsRG54?=
 =?utf-8?B?YW9ETVROcHZVdGdhZGhvYThCZ3JpNTU0a2ZKS3BHSDB0c0ZwUkxmVys2Rzk5?=
 =?utf-8?B?UFRncmw5VXd4MUswYXlxRXMzeVNrMUNoUXdqV3VwSFJiR2VKNXNaUnpEQWwv?=
 =?utf-8?B?OXlCbTR5dDYyNklpOVZQN0pVTUR3Q0ZsL29YWDh1S01EWjlpQ0hrZG5ETkkr?=
 =?utf-8?B?UjBZWnJ2T0RZQ0hqWEd2bVJpVVhaemV6ZHZXRnEzb2FvQS9xY00yM281S1FL?=
 =?utf-8?B?dnlIRWwrQWJlRWQvcEpkdHozWmpSUW4yaldqT1BCbzZIdTJMMUZ1R0ttTTFP?=
 =?utf-8?B?Y2pBSXRTT0RoZ2JPSVpoZ0hhdnhIOHR3ZFR2SGZRWHNodDFkcHZzMnQ1UVk0?=
 =?utf-8?B?VEpQeXVDSVZVL0oxMjNaZzhRNTR4MmVSaW9xaktaY0psTk51dUhwK1M0a3Np?=
 =?utf-8?B?UXpZcTJTYmpuanEzbU9GcWJjamtDc0VlUmdBTjVaWTd3QnVOcVU1L25pc240?=
 =?utf-8?B?RWtuaXFOeDdhQUpyTDV2Y0M3QVV6a0tseGk3TXpWeXA1dHZCR2cwWlF1YXV6?=
 =?utf-8?B?anZJNU5NUzNQeTlCU241UTd2VjNLQjhkVlFUMTZ4cnI0WEpQWnBJbjBPWGZk?=
 =?utf-8?B?SVBYbXVZdXM5cGVNSXBIRklqVWUxOTlmdmJ4T042TjJCSnJtZlBDZ0gxa2U5?=
 =?utf-8?B?YitONklDakk2TnZDVjRzb2J0dWxzK3lsN2NUblo5aSt4bVZFaUUwbThUQnl2?=
 =?utf-8?B?elp1dXNVc01SOFhLUUVWd0hWbzUrbkt3QzJTVW82MWhQRVhiNmxDWDlyNDRT?=
 =?utf-8?B?Y0NuL09pNlhOcVl4Q1JNNnZoclBmUVVSdjVSR1lzV0d6aERUSXpBUmNGZlpK?=
 =?utf-8?B?d0FBUjlBdzZyZmREcVNaOUdzRGtTM2h4MnBhdGR3cHVCcjNuQ3NiM1ZvVXc5?=
 =?utf-8?B?S1BiWURFekJHc05YMElIS0hqeVdZVHJ3UmViVlFaeDdTTDBnaXczY0ZTUEty?=
 =?utf-8?Q?s7CB55RO/rALxDwE=3D?=
Content-ID: <B3405AB02A367A49BFF2DBC0F896AD6C@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rZ3bvRGYBMRT83rCaCMrdN7QCm3aQmRv3048g7Gs4viWgKyJnMl2wQImLhVKWDR7ZPGnzcapz8F+GbT+4uA3r1lDsqqbyA8CQeDthzcmAKHXOz4JcMQFoz7xgC1vdAKsT7mGrJ5b6i+wxzwUaItTY4dHygPenfcytBzjP193Kv2Y8UD7Mej6inQ6fg3mXdn81apC5Wuj6gLaJZdOw9CtXPUw8MeXAb2K/7ozNmGn/0ZjGhHl1x5cWdXxDjmOXPRFdZTVD6dVXA+T4KPkUD5CEWA/jqm9c1JJg/H2oOrgB1DeAZWfUl4RAuZuGJ9J5P1T6JzG6++YBi4FJbLKKDlrnZ8RBF/5IKEuN161nf0M3RLVit6GaPwlyaRo97WZhH36l7wDsbS3PrfVeBYgq+oejEDxQFwWe/Lb6muHejPxQMB2KC7kfHoh4XNzd40wjsrxVediV3fim7qEyEwheuV0W5wvmCMjSoQHuzaFaEy2zzl9DxShsTjWrVk/cytolWumCkDCQBgFjq9rki5cDIaWSF2VVCETXcfA22k6mj4TmKXlqoK6dWpCSoiKo+qwRM8iyerlT9uCZ4uU3FOAwB7rIMxUO4YwGiJZTMxHhkbHHnS6WmrdQQUN1jD9HE4B/nVe
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa90809-c1d8-4386-438d-08de626a4119
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 14:49:23.0876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JTMTukpWtkvYf5sx/8wjjidP7oWwT1oj6cP84CT3ImsSnqXSRqz5oEH+PDW/GWU/LHbRoeNCjRxCG3eEr1mJR/+bIsGYXkij4ogHBX48lpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7167
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=6980b976 cx=c_pps
 a=5IHW8NyYJPBQRrPNZP92dw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pFyQfRViAAAA:8 a=BgNPMZ5_v6906JITTFsA:9 a=QEXdDO2ut3YA:10
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: kNP1FU5ST-D4JDITTjp2Pefy8La-fJVO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDExNiBTYWx0ZWRfX6RanhzO3+hB1
 zXOjhV9GgwbUkxtNrRNPFzV5guiLI2r2kc4ACK/rtylZBHxQUXEIf/ZUQu2zZ7on3CUAzSCAPL9
 /Ul0qCHAzt4br/1gLiRb3gxLmaZfJNtSAMJ9fdUvOoee4pjJ3P78p0BD7O2n5Z5GQxP5qpRuVNb
 oXWuCwX+7jHd0y0wfhKHLhgt+2gS03dmBr5FVw5n03xq7J+PoVF0m/CdQrC1c9t5tlmk80WaNOn
 5BmqcRvFNRjIXI13eMX321PY1s3b6IE5yoEMHf4/b0zGgrvDYXLfHoRsoMp/2MbBL0k9PYtwMkH
 yOtOSdeYVU7iC2IHwJFclb4mrLgZuCnGQ8bE0oR79BuCgP5VtLNzv23TjvJMMrN2BOXrhQaZW9h
 q08wm4kx09U9moYOYheSOo+WVEFHm6mKx7+Ou6RuncCrhrD0aPmdvg/c4iCUF/MrHHihB2QTHl4
 Zn43MCwiYvNQOd9PpzQ==
X-Proofpoint-ORIG-GUID: kNP1FU5ST-D4JDITTjp2Pefy8La-fJVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_064927_760903_E3F7D6BE 
X-CRM114-Status: GOOD (  11.49  )
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

2026-01-29T00:13:43-08:00, Nylon Chen <nylon.chen@sifive.com>:
> Add rnmi_handler assembly wrapper and sbi_rnmi_trap_handler default
> C handler. The default handler prints diagnostics and hangs the hart.
>
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Nick Hu <nick.hu@sifive.com>
> Suggested-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> @@ -643,6 +643,70 @@ memcmp:
> +	.section .entry, "ax", %progbits
> +	.align 4
> +	.globl sbi_rnmi_vector
> +sbi_rnmi_vector:
> +	/* Swap SP with MNSCRATCH */
> +	csrrw	sp, CSR_MNSCRATCH, sp
> +
> +	/* Allocate space for full trap registers structure */
> +	addi	sp, sp, -(SBI_TRAP_REGS_SIZE)

[2/3] did:

  	rnmi_context_offset = sbi_scratch_alloc_offset(SBI_TRAP_REGS_SIZE);
  	rnmi_ctx = sbi_scratch_offset_ptr(scratch, rnmi_context_offset);
  	rnmi_sp  = (unsigned long)rnmi_ctx + SBI_TRAP_REGS_SIZE;
  	csr_write(CSR_MNSCRATCH, rnmi_sp);

We can avoid the add/subtract dance, since it produces rnmi_ctx.
A bigger issue is that it leaves 0 bytes for the stack of the callback.

Is there a reason not to reuse the existing M-mode stack?

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
