Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D00CCA462
	for <opensbi@archiver.kernel.org>; Fri, 16 Oct 2026 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPySrz1QV3Dn5S7zXz/Y6Rvclk8bFyH9b0KIczoSW18=; b=HXTpl2qJNKPYRx
	90HwffLtCcziqqHAJElEoWTPZ6K5gQ+6jeTjCYTHMXN5DpuYvlwzmHLiHXXWwmkQXXI24f+suBkvn
	Uf/TxooKNP7t3kq8dUW2CHF8y+t0wM37m+9tRhyPHBIYpqaZvv76pf+BXYGzyUAc793piXiQRs/zl
	9qQYF0iXxOR3i0GYLhxbSFBg6YIouss1nCxF4R8tcKrwNvpl6VSxU805S2t0+hWvoOtrXgeTo6yU3
	p/0Dte2DjD8pdwCZ4aME11fODSxYPSJwOHDGFja/WWb1QZMSgEb1zQjv56xF8HoYKQiyQqOS34Y/Z
	fTSfLlJEiDLFizW8spUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlfG-00000003YGO-3VjR;
	Fri, 16 Oct 2026 17:24:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlfD-00000003YFv-1ghQ;
	Fri, 16 Oct 2026 17:24:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5apg1613241;
	Fri, 16 Oct 2026 17:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=gEULQ4R9Yn9DQSy2SPHLrHQLwk/qAxLExBbqJ3588RI=; b=bI
	ctbJVw57ZDS0x3pB/HokGLj7S7NXAGegx3/rMt5yd66qmMRXsZSt4hdftQlSShIS
	0/L2B6dwfnxAZUqYsO0GCMporbE+gUNUmaioi+qyVuOTtws7KJELGTytCl9Q1d8r
	KYx50vsKmn4+uFac1jinyDJEZfsEVJGB4wuAL33V5+UOyngat2QtOnS02nRVWA4Q
	m5fzClUF116yNkL7dgc+VMXjx3Q/FYFWgiUDEPZed8iF1kmlNjk8xclb/5avecEg
	1Ye8RfObOk0xJcEBC3z1jiwqfh/MMdWJEFyd/bh2iTbxhfjf9gTPDmM1BYcO4gOE
	tlDgJLs8uc5DILYlzDhA==
Received: from byapr08cu003.outbound.protection.outlook.com (mail-byapr08cu00307.outbound.protection.outlook.com [40.93.1.111])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v1bpa-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 17:24:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsTaRSuqR+QJLvPZ8U0V5/By7XkzrjmrMwxnZcH+6SRh+lcJkFvHdeoPvwftlG+BoLgFuQnVHbI6p/s7RjRiZhIhbXsvZL4k41uCm2DOxuyODEvQXNHw9X9nUT6h1X94me9yHTuvq2JWlwcCmtEda7ljeDWl/nCn4z1azvrK4M7YNZAySx4h39hfOmptdpAEuTWvKp3vqenAFe5MQl/Z0t2o8T3erkcUOZI1NPLiqG8y8Mj2fEhJS/mB29ddk34llEo19zCTyLvoqRuWsGBH9415M8VyaKAyBR+9fWWpMm11X53GIPUHNNSH0qSCsrAgkux0hI8MsBd5SJAHlnDlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEULQ4R9Yn9DQSy2SPHLrHQLwk/qAxLExBbqJ3588RI=;
 b=oUGwieiuiAb6bQKskTmp8m+xFTKP+Rzow1EFsYtLgb6f22DtIvHiQ0D0QOPF79b4/sds5myRnONS53HCdrRNCmcFFDnZQPSTaQxGPUXc3xNLdaX3sICstDOz6orZKtDWOPV1yeex/Mg9WKQ8hG9DTyjl05tckCP9cB4hJywOKB0c4GtQH4cwG7GEQc9cha8GR5qRp9Vj4dvUbdOX0smy+v/nD0AkgM/WpyMJZ26lGjpmUdTQuPe/qpBcrccLbPDfyrHshTzq+EpV+XKqd+/gk6nY0Xz6w7YKrY4AdbR4HYv8QzC86ky5i1+P6CIUzRO4JgrFyo7tllF6ZUx/1CO6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by CHAPR02MB11359.namprd02.prod.outlook.com (2603:10b6:610:301::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 17:24:07 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 17:24:07 +0000
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
Thread-Index: AQHdXZMmsxllxspJoEa/r07q8m2M7A==
Date: Fri, 16 Oct 2026 17:24:07 +0000
Message-ID: <DM6FR879EC0N.1XXM04LPUG5F0@qti.qualcomm.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-6-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-6-peter.lin@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|CHAPR02MB11359:EE_
x-ms-office365-filtering-correlation-id: 7030c785-6217-48bf-d5dc-08df2baa489c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: sJ6fNdUacLLFKYPgxdkvYSVcLzdSGqlurtg4dhP1PMACsDcV5eqZs0wlY4mnefNmRoepvFCGT3Cf7By2cgCbmmym2glQhlCxCPfzfwNQ1DAOR5YR1E+0EMQolD5xJR9hZ4TudhvAF3Dr5vOII24qHa1gxujT1jzPXaBrEb4AbAq1BBCONWmoGYHKOMcTNyA82aCFV/Faqdt5S2fn2uSSbGqbbbXzBV6MYWJPcCjLBaiaB4lGsNWnezqcbnIV/H1+ZY5l74Y0M8F+6xzO4RptuW/2Nf+/ga5GOxs5WBr0oucAUUBHhMhPo4jovkMUauQB4I9JYUiS6o5lHmFnDgfJ8ZxRgQLo0eal5SD9tgzF9lxZwHOcXcB0p7vQAyvm16e+S61A7WlrQPZkCL6h0AuyyiR5c+tfOt8YW8QDZqNx2EbfnxePNcMHsMHnHjVW0apBBwSeaFMuDGasH1+aIwaVNANCRSHEQ5P5xAWXR1F53K2beQa8EatrxgvGQMfuhWT6nmxX5DV6oQIaBRNPjbiJbKaaibkbgs/lJnKulJNESaFTsVJedw41hwA5bsCQzfPl44dWiPXt1h19QiBn5wyWMGA4ZMd+VDdQNA9E0MvTi77XsymTmckoFBYfoJ2rF57oa82mHpOO1Z8sbjZWEboZLmdq07qNijUvXIwYDnpEJTZR6xSu1h7NkSzYGAP+oUhPkZDB2gOSn6HyodIBd4EfSCv8YPRjdNGS6x/58VI5UFA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVp3cnIwT0RucVQ1b1FvOWhDZE4zcVZXTURJRnpSZUxuMVZ4SmVIaXhrUElO?=
 =?utf-8?B?K25LZ0lseDVDK2RIUk9TU1hJeFYyLzRuS1JJcWExYWxxdVFVUlhjRy83SVVs?=
 =?utf-8?B?dzkxZ0xiZHJpWUJjRVJsQXpmZFVFZ3V3N3ZVaU5QSE9XU3o3dXZyek82L01o?=
 =?utf-8?B?ZTVVVWk3ejB6QmJBV2szc3B5emtOU05OVEljVy9NcXlMRnBJUGRvUWVLaGZ2?=
 =?utf-8?B?cUxzTnMrL25uZnR0Nm5aRnZ3aDBxNW9tUGhGUXFFZlIza0tEelVVWk43REFy?=
 =?utf-8?B?MGNoa1kwUEpYRkZURVgrVG5FSE91dnlReWNuQ1ZwQVJjdG43WFdhZUtrSTli?=
 =?utf-8?B?VzlyN1BjNDNqMWxHb0tmMXpyMnFVa0VEUkt1eXBNcDlSOHFVbEIyN1VSSFhw?=
 =?utf-8?B?SkVIcFpaRlNuSkJmN0N5UkYvMFdUVGxDOFZ2VlJhc2ZhU0pXVE8zcTFIVTUx?=
 =?utf-8?B?UUlqWUZTNSt1S0dxeU5oTnJxLzFNOS9QSGNaeTUySjlIeWViTTV2VHA3UnY3?=
 =?utf-8?B?MXhpODgva3Zkalc0SFN3cUF3bHlVSWdjOWdCQVRxQk9BMEhXMlNJeWFqK3Vr?=
 =?utf-8?B?YnA0UEM4K2xzZUYveEFENHpPYUhNTjZSK1ppa0JpZFdzemgxa1ZjMkNKL0NV?=
 =?utf-8?B?SE55YWovUWFST20rRnI2L2piT1BjbnNPVG5oRFJ0OHgzbVZ4eUdTL1RndzY3?=
 =?utf-8?B?RzNKMXJTTHl1WHVLcmlpVkx0cVNpS09EN0p2cmhiSWtRSTd5SEp3S1RWNldV?=
 =?utf-8?B?VVJ0Tk5QU2pMODQ0L2FMNXNMTUxaOHJaY2ppUHNKZGp3c2gzRGk0STQ2a1lK?=
 =?utf-8?B?MXFSczB6OG8yY3dtNUp1cHZsWlhJUlJEb3lzdGlTR1YzaGtIT2hXZVFFa2dz?=
 =?utf-8?B?SDZ1UmJ0dFJYSHJCdWFWb2dBWW5EaFYrLzU4SW1aSS9BU0lEMVdIUkhDamxm?=
 =?utf-8?B?ckNEbGhRWEpadWhPa0hXYXdHa0xXOWJTTmtVVWNGRTdFazZKYWkvaGhpbHlR?=
 =?utf-8?B?K1RUeTdud05hSnpOaCtEb0hNK05GRy9JcWxidnFqVkNaNXEwU0tQTWg1QWdy?=
 =?utf-8?B?QTdiM045azNrbHozYWE1M3cvS3lsb2ZWWjJFWmVrQ2xFQnpwMkVFRWtFUXBS?=
 =?utf-8?B?bUdaUG1kbTdpcnhQMzZGNDFOV1BCdVhxVXB6QS92TUtDYU1iVUJ1VXB5VWdG?=
 =?utf-8?B?YzdzKzRFN2s0Z0M1bElhZkVEbTNkeHlMK29iclh4N1ZlbGkzT3lFVW5GVWVU?=
 =?utf-8?B?aG8vUW05bmpGNkZmT2QzZ0JzWHVSS2dqNGs4QXF1em5zdHdCSUNrU0dkYlpN?=
 =?utf-8?B?ajlWazNnK2tsTUkrZnJJMDJjdjh4YysxNE9WWmphbHo4eGlTdDI1YTZ5ckNN?=
 =?utf-8?B?d1hGcndkMnlRcWl6TGhOdDI4d2RqamxOV0V3S00xOGdmZzAxb0ZTRlY0RFVa?=
 =?utf-8?B?RldEUk92YThpQ016VWh0c2o4dTRMR3hOVkZTU3VwU1I5TzhuQllGdGpUSkht?=
 =?utf-8?B?KzZDaDY0QWZkc3N1VDlxTFpKcjQ0K0NUL3ZwcnU0Kyt2aVE4ZHViTGlQTm5O?=
 =?utf-8?B?RXM2ODFzc2wvaWtmQ0dycHYvSGVwRHprVTlhT2lCd3lIdUFGdTRKL1M3eWVC?=
 =?utf-8?B?UTIzcStLa2ZOWWJhSDRSajZCZVI4Y1VSdlZPbERlRlhXL2hMY0MzR01NNTJQ?=
 =?utf-8?B?U0o3S3BkWTgxaWpvdTJ2Vm55QkNzUEpJZmxNZjFWMGJWYmlxei8yUFZMcTNq?=
 =?utf-8?B?YlU1VjdGbXpEc3BoZG1pL2YzaGhLVVdjeG94eHQ0eXlyZWxqTkZ1UGFWYTZM?=
 =?utf-8?B?VFNkcG5VT1EzY2tDWDlFaitOa3UwVFJpV3ZMek5lRVVJRjRnVkhMNmIxWnlJ?=
 =?utf-8?B?NGtIVnFmamU2T2tnc0pYWEk5U3l6YnVzYmdZTjFiOEVqY3pqZTVXaTZHNVRG?=
 =?utf-8?B?R05jTlEwOEFPS0kvUlBYbnpFcFVHWk94dnUyU1ZIWit4ZzgyZ0U4cDIwZ0NJ?=
 =?utf-8?B?L3FyMGpabFJHbVRBQWY4eDNqQWVPNEhFUTdMeVY0cHp4QktJeldlU0xxYTl2?=
 =?utf-8?B?RVJMcjZFOENLOFNzb3VDM2FBaFhsTkxLNytQVndic1hqVFUzSGt2UURpOTB3?=
 =?utf-8?B?S0I1OE5uWjh6WGNObFBTQUVPRzdQd2RvSno4Qk1KYjFPQWNzMmNybkFzbWtY?=
 =?utf-8?B?dTBiRE1WdkY0cGFLWllJM05pWWRua2JXdk9YMC9rL2hYcUM2OFVYVGUvYjRl?=
 =?utf-8?B?Mi9mV2hkRFpkWTBLWHFwTFJaZWJ4bldXTGRKWVJucXBrUnkxSjNxS0ZTZk5L?=
 =?utf-8?B?bWwrZGN1N2hwUjAzeldxMzhIMlEvODUzMGZQaW8yazdUZDVjSmozcjkycEtX?=
 =?utf-8?Q?TTQ2tidXeZtqpuEY=3D?=
Content-ID: <637DBCBF0CEFDF40AFAA48E96CCC26BF@namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4t/g2Wp0bOZ0C3HLRQSysgQl+MM4kO8P4DjqYdeLHKCaxtlJ2FenRMnlXt79mI7eaiGkr4/+rLZdQAmKRf+prIadsEg4u7BqSwsfYqPPZ8sqIl5XN2heIxSJQHqTuYwblgiQZryu++43cJ68kBormBi+IFhnHsfCRA/hWh16UxciB7uillx4yOlECCd/ivZYzZ3u+APS/KrL7pAQvBCviroUpW2/xa+oGdVi7I+cPyVl97BhX8q1QvIxdmzvjMl6KaFknEv/7LA9e7+3/mWU5DfGEpzdIAhT6mVERH8KDZKiFRv6pCvoRUi1Bj61dbaZmBAOVBXgGlOS1veBOWvvTA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: v28U64zot5Q4UcMTONVf6l07cIEWaE6GS3aiea9M8hIAR2Ylv19JpKnMzDOGb68lKu2qo0Pb/63Fm9+Tefgm0Nd1EvQ9sJi8FML8izLPGqu9ja4RzG2xzd3xsOokTL8dnnPdV3WW7npowJJbEeryY4dnozPmfqob+CFXC+kHuhmpBfll/XnbaHXzwds0aRN1pC/maOZmJnLE09UasTAMno6PUhVHFEglNfqNvu9WR+CJuaQQibSJDRFk/WLz6wJfAC8FnbkJBBZox2i4mEnGc0nYtXktnJM8bkNxu2dXtPXbpOX0dePru8cAsxwL53mV+BDD/B+ejDc2G9n2jRF4XIBfbS0y7h9iuEnYykD2SGXL9gJ/jQ2XxEy48pcOVQsHrf3bc4/JU1X454iYlQBvtznzP8qhxyo5Jhsoq/MwR5nMypmVQfMAD87EjkRtfVvyjjV8t/lpbo/I0ILmr0hHeXd2fMlQJynJibna8P8TrVWHNTuxJlk81Jq8Et89fQcY0UWTed+e+0IrQxY3Nm8luZ+E/92CJuGNi3lFYAUYgKoxf9U3ms0WWwxVbx7ffgDE3agaacEANuoj72IwjC6c30ZImJnpxZKEMP3uZz20To0EIAAwSMQ2iKmL9GzGjYVd
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7030c785-6217-48bf-d5dc-08df2baa489c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 17:24:07.2399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWCE3X+SIHieF9noftde2ZJr97GjpL8lOPLUXHe+SeYok3v73mutRlorqYbZqfsmw2FxiaY+xeKW3WhzRnxe52Vg8iJ8Gr+E3UshwOszEgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR02MB11359
X-Proofpoint-GUID: l-NrBAlD1G_KAl54goQZoskw8yercJVC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA2OSBTYWx0ZWRfX3pPWWJRzYiSC
 Nc9OfdjgK/0J5GQfEV7993Et70B6ZfcF2Yl0+oy0PPGG4oj9MKVX/ar18A8o8C/byrL+kv1sQtR
 fZtGKqUQK4s4ZJomIc7DqyRFm+8k54s=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad25dbb cx=c_pps
 a=FkaiYsdaSJ2J0TbLpd2qeg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pFyQfRViAAAA:8
 a=S2Y8ebtQMP-Szf1EVAEA:9 a=QEXdDO2ut3YA:10 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA2OSBTYWx0ZWRfX+bIu9JVQeh9V
 sw/wb2CWQmBQvOPkiACLXBFyH8cf8629ErTKw2Clk3fQnZsd2Sy02+nrggKsUNOmi0Cp1giXoBv
 NTA8S0SClr6TDc/hUAeBD/ndN+IYN7hEDvCn6YrMUqppVKYnHbNY3K8EhLuMk7lxzNhiYI1JdQ3
 Ks7YknRrSmaurpuCuFmo3WB9G/iqzQL6pVB2yCJ0gHR9eXQvDqTZmkBKBhZEacC/oSpomTW6F6o
 JuqowmysLohxLWaVIgN7KMQoCvyeldnZkSzx7MyF1IAyTROmye/g6gP4lhRXEGQnSH1JalCwiTP
 gFECiQRrRtI/fEYa1SWMjcvK45KfpDj2zyGqacDqSCza2FNmsp7ymAVj6xeW0nchzHlT7aLK9Xn
 pdXPEjhsu7XWy/ghR7+qf6etieTH8WWvVMJ0WtUMUeZVaau1pRw8l9qX3CADV9nrgT9EM6wJ4ke
 MlI1gMRchFYDhXjQK8Q==
X-Proofpoint-ORIG-GUID: l-NrBAlD1G_KAl54goQZoskw8yercJVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_102415_446014_95A5D406 
X-CRM114-Status: GOOD (  18.08  )
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

2026-08-17T17:04:59+08:00, Yu-Chien Peter Lin <peter.lin@sifive.com>:
> Register a WID-based hart protection mechanism that
> configures mlwid and mwiddeleg CSRs on domain entry.
> This enables the protection framework reconfigure WID
> isolation whenever domains are switched.
>
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
> Changes v1 -> v2:
> - Validate WID against pmlwidlist before writing mlwid CSR (Oza)
> ---
> diff --git a/lib/sbi/sbi_hart_worlds.c b/lib/sbi/sbi_hart_worlds.c
> +++ b/lib/sbi/sbi_hart_worlds.c
> @@ -0,0 +1,72 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 SiFive Inc.
> + */
> +
> +#include <sbi/riscv_encoding.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_hart.h>
> +#include <sbi/sbi_hart_protection.h>
> +#include <sbi/sbi_hart_worlds.h>
> +#include <sbi/sbi_scratch.h>
> +
> +static int sbi_hart_worlds_configure(struct sbi_scratch *scratch,
> +				     struct sbi_domain *dom)
> +{
> +	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
> +	bool wid_found = true;
> +	u32 wid_val = 0;
> +
> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
> +		return 0;
> +	if (dom->has_wid) {
> +		wid_val = dom->wid;

I would prefer to fail domain creation if we have mlwid and the domain
doesn't specify its wid.

The rest are security issues waiting to happen.

> +	} else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID)) {
> +		wid_val = csr_read(CSR_MWID) & ~MWID_LOCK;
> +	} else if (hf->has_pmwid) {
> +		wid_val = hf->pmwid;
> +	} else {
> +		/*
> +		 * Smlwid present but no WID source. Without writing
> +		 * mlwid, the hardware reset value is used which may
> +		 * cause a software-check exception on lower-privilege
> +		 * mode entry.
> +		 */
> +		wid_found = false;
> +	}

mlwid CSR is a WID source by itself -- the domain will use the current
value...  Failing initialization seems better than reusing whatever the
last domain left there.

> +
> +	if (wid_found) {
> +		if (hf->has_pmlwidlist &&
> +		    !(hf->pmlwidlist & BIT_ULL(wid_val))) {
> +			sbi_printf("%s: domain wid %u not in pmlwidlist\n",
> +				   __func__, wid_val);
> +			return SBI_EINVAL;
> +		}
> +		csr_write(CSR_MLWID, wid_val);
> +	}
> +
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
> +		csr_write(CSR_MWIDDELEG, dom->widdeleg);

I would be a happier if we added a little bit of widdeleg verification,
so DT mistakes wouldn't shoot us in the head.

> +
> +	return 0;
> +}
> +
> +static struct sbi_hart_protection wid_protection = {
> +	.name		= "wid",
> +	.rating		= 100,
> +	.type		= SBI_HART_PROTECTION_TYPE_ID,
> +	.configure	= sbi_hart_worlds_configure,
> +	.unconfigure	= NULL
> +};
> +
> +int sbi_hart_worlds_init(struct sbi_scratch *scratch)
> +{
> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
> +		return 0;
> +
> +	return sbi_hart_protection_register(&wid_protection);

All that I said above applies to domain intialization.
The actual code during context switch should be much simpler:

  {
    csr_write(CSR_MLWID, dom->wid);
    if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG))
      csr_write(CSR_MWIDDELEG, dom->widdeleg);
  }

Or only

  {
    csr_write(CSR_MLWID, dom->wid);
  }

since we have to touch mwiddeleg when switching slwid anyway and the
unconfigure/configure is not good.
Alternatively, we can add a `switch` function to sbi_hart_protection and
move the slwid switching here.

Thanks.
-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
