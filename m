Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C384EA4FAE
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hAxg/LJMyt9+BdjV2fBdY2BKi8uurn//fzrbRai7gnA=; b=Np2gqFc/eJ0Tjq5YjAp142UEvr
	Kn7pVJVeDMqyFIBF9N1cIwJ/2khz2rBvHLVJDsFnBxD+OPfDvnECzRfv+jURDZ9nJrG/mzTfuZqyh
	NBFWVoEy0pf8MC1wN+Y8BoxJJ1q37YeyV1vHyvE6JWFaMLrnIsSR8nNsAux2+r/DhMBoIF6Q7/497
	NAOE+o3JzcmQ18CioVyiHgnE+GyhrL0aJED4wPFlg/HszTzqVcZZi5tZZSNkkkTe6ut7QYj1vUl54
	e0/UEK8+nqp/Wyg198yOKuVmpjoQ9Hu8UeZQDEokRIyILnd9psViQkRDcPFAa59x9VTIeF4R8XCdg
	W7JqrwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTug-000000008Up-0N9e;
	Mon, 23 Feb 2026 11:15:42 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTub-000000008U4-19LP
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 11:15:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8tDTU2u4S0Jc+Q+n1ZI9CvpvROKW9cFc6iEgTvuuNIy3GHVUqhhW76phVM9epUeiFuMGB7Q2dzJBVrl3cUpqNGP/JJN4pKJ8I3XeKRu7groIgNIq57lAR1YPiC3eVmm0glhYeaziOGA7RMby3vFZlU1QwUvww0XFD3DkQLq1WI3KS9InWhh9dI0YVoK+eK8YR4po4z+nQ5eGYo4xg79had+Hf+39xuB2P9bbdXFLXc3BxV5fHFZ4Q/yzY7t4EBTuMhTOiEyk7dDwkv0KoVk4C/oiOTmff6sGAOQYKc4CscG9lO8120GidwYPFlD/42RASHRW7m30OScwnC/lhXCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiRjWtAQQC3k5CR6ZyVJTPkYqt9FP09nlqrztaqqHF8=;
 b=kHOl8HzEq458gklK8Kt2zx1YgkH3LdFrZAjOpZg2gKFRnktEVnjsBYFi88THw8IhR2L7nZrzyWoxqY6iHGNhacIuohVjLU6w5834M9DfDScdZ+vLChhMttXgXDvctll4O6XrGt+AVwrI2DizDwVvgnON8PZvQry+6wozt+Wv0Ck1TyxMgK/gNR7C4Kf6MIXl0KwF2L65rsr1tlySLvueKXb72yb9wA03g/8kulkAUB2xL5XOdOlK2t12gI6+SiX4hT0HY2/ghDoFqcm7OYxx7JWK3bBtjhInTh9eMj3noIR22xEuLyJoapoakpfg8uFuEoZjIf7EV56TATVT3MYmJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiRjWtAQQC3k5CR6ZyVJTPkYqt9FP09nlqrztaqqHF8=;
 b=H2IPCMOiMeF9ccsaKCyU6PreC6uJ+ttUCORNawtgRdLcQrzhsClCIZPBeVURrT3ob7Er4nCBWXql7ULB9DwRLV6fg6U+74c1XpewmSbdQ0fdM2Udu2e88ztgk7NiUZTcl9vbWyNKgdmgE5eFXseioY2XbhwgNZvrjia+rib5pMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by AM0PR09MB3618.eurprd09.prod.outlook.com (2603:10a6:208:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:15:30 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 11:15:30 +0000
Message-ID: <449ca174-48f4-40c3-ba98-3086238b124e@mobileye.com>
Date: Mon, 23 Feb 2026 13:14:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/20] platform: generic: mips eyeq7h: prohibit
 accessing memory beyond DRAM
To: Anup Patel <anup@brainfault.org>
Cc: benoit.monin@bootlin.com, cfu@mips.com, opensbi@lists.infradead.org,
 cc=cfu@mips.com
References: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
 <20260118-for-upstream-eyeq7h-v2-20-71934a5b9756@mobileye.com>
 <CAAhSdy0F1My_7DUrWmEq7j_mvQkR4T5EeVrL-XjWxCoOuNzbNA@mail.gmail.com>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <CAAhSdy0F1My_7DUrWmEq7j_mvQkR4T5EeVrL-XjWxCoOuNzbNA@mail.gmail.com>
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To AS2PR09MB6296.eurprd09.prod.outlook.com
 (2603:10a6:20b:578::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR09MB6296:EE_|AM0PR09MB3618:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e921d4-7541-461e-5f3b-08de72ccda8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWVCSlRoczBZM2pzQnB0L3gzbHprSVNjWmRYVnVMWWdFT2hmTlJjOHJYMVFV?=
 =?utf-8?B?S3ZlaXNTSHg3ZDVlbGpJVTlySG5wQWJCTitoUEtjRkp1R1hUaVBhS3lHMmJI?=
 =?utf-8?B?ZFpkSEs5TkMvRWdTQzVQR2UvQTFrUnI3YVUxd0J5SjRJR29UNzE2Tm5HVzhP?=
 =?utf-8?B?NVc0V2NyUmw5Sm9wNkhRVjNGcEFjYlAwRFlmdWpFd28zdVZ0QTBiR1NnWXpi?=
 =?utf-8?B?Wk5jbHFzRVhaR3psNTlLd1lid2JRTnBkTENCMkpxb2oxc21YV2dWUHF3VzNW?=
 =?utf-8?B?anJ5NURrcTJ5UjVxRnFubkEvckx1OUpVUDM5VU9laWZjTGtQMytHUzdxZndG?=
 =?utf-8?B?MXBOU1dobjR1Q1lZV0VlRWZDeFZJNkV2cW1XSDV1V05RWkRIYllIajRMdkpk?=
 =?utf-8?B?YWRnVmsraDJnMnkvZ1FHaVN2Y0ljYnRURE82NDJ1ZlQzTmk3VXpmbjE0aENj?=
 =?utf-8?B?SlY4UjYzWEh3UERtUWdXZnlpa0xXMDZlTlNhdnBRZTNtdHJ3dlRsaHBWZ3M3?=
 =?utf-8?B?TTNabjdUOXlyZEkzZ3N2NlFSeCtIWFdKK3AwZFdMSytXVTVibDhNZ2xUQkxx?=
 =?utf-8?B?RlBHWWl1NE0vR1RtdHZFaSt2TlF2aGRwMFB1YUhObWF1TkxheTVWNGplSWdq?=
 =?utf-8?B?ZThWdnFwcWl3Zk8wSWV2L3Q5V0pUeUNzSjJPdUlxM2VJY2t6UHY5SndvVTB2?=
 =?utf-8?B?dXJFWkJMdGdHcVdmUklESGNHK2ExTVJ2aU9jT0ErOGpQQkNsSG1GMnc3b0Vh?=
 =?utf-8?B?d0JmeVd1d2Z3cU1NNGF2MnYyU1NqdFpHV3FYWXR4RDhYanpReDd3bTFOQ0cr?=
 =?utf-8?B?eXl4OGwyZVVlZlhRWkVLUk55N2FMUm03cHlWMzU5cTRieXByczdCYjdwVFhs?=
 =?utf-8?B?TU8wMi9KODNQVWMxNzVETGR6WFBhVzA1V1NBbGJyVjI1dG9KREVlY1hVR0hL?=
 =?utf-8?B?aVZHZ2tKZmdMcmk2T1dnVFRRb1hOY1l0b3dJcUovYzRJT0ViV1gvd1dUVjdG?=
 =?utf-8?B?dkpEemlvS2NOWkZhL3hURUxIOUk2MkhRRHIvWGhqakpnbk5TMUhiUFdlai9G?=
 =?utf-8?B?dlhRL2JpLzBtVW15RDRRZGVzZnhkL0xCY0ZQcFJwS25iN1lEQzhZM1VYZUp1?=
 =?utf-8?B?RWRzb2ZzK1RvU2YyMGlxMkVpSk5DTkJHVVd5aHYyMW0zdVU3VWNveE4zc3RB?=
 =?utf-8?B?aWtLbFpJWVlPVVp5aFBCNlhSTCt6SGYvL2h4dkRrU2FFQkljMWtFVFNnQnBZ?=
 =?utf-8?B?SkJNNXN1Z0hRNlc2WVVNN0MwcmhkMmFLZEtwVDFmQlZObitteFFBM2REaGxV?=
 =?utf-8?B?VXJpcVBEWjE1L0cxWmhPcW81RjVBcjRZZjhpTlYzYXR1MTBjQ24rLy9TSDJk?=
 =?utf-8?B?NFo0dzY0ZzFaUktaK2JicFF0S0tQWDVWZ1BUUktxbGVNZEgrbkdTcTJUV3F1?=
 =?utf-8?B?dElxQ2lpZSt5S2ZxbUtma0NsbHovWXRvQlFkV0NFSXM1RnNraXo3SC9wMzZo?=
 =?utf-8?B?eU0vaEU0eExKWVB4NEtqSSsvemRoWVNUaFltdGpVVU5pVjlGRG9ueVFKVVgx?=
 =?utf-8?B?bGd3UWtnRWs5THNjYmtndE01OWhRSEoySnlvby9xWjdYRGdWZERiaDQwQlJF?=
 =?utf-8?B?QVo2b0hWQnJ5UG5YUjBLMG52WnNaVXRmbGhOUHZIVGRhS1pyOVVGRzRiSXlR?=
 =?utf-8?B?UlFjY1JSS0NxTVFDU2xuQ283cVBtemZwRUxOYjNrcHovQXBhSVhDS1h3TlR2?=
 =?utf-8?B?aDNkb1dvbGhDUHdCQURnSlZiMWNZUjRON3B1dThaVGxYZmdEZW1CRjBvdkpR?=
 =?utf-8?B?VlNBTzJJSDRYZ2twUWp4RWtoczFxdGthWmNnSWpTVDBQMlFEY1BpY0laSlJT?=
 =?utf-8?B?ZllYWlhScGw5UWdaL0ZnU2FhTXdtbDVZOTdhUUx0YVRFV3ZFeTV1ZUdSR2VC?=
 =?utf-8?B?WEY0V2J6VVdLUGkxc0dIK2NkWDYxS3hPYlRkRjFOZitDRnYvNmxiYjR4d2JI?=
 =?utf-8?B?VGhlY2Z0VWlRcWRXbk1iZFhGZ2hJQnJkMldwL0IyaVkwSDV4cDRUSWkySmxw?=
 =?utf-8?B?MVI2QmJKb0x0My9RcXVKajh5aFZhc0trclBoUVdHTk5TTlZyVllRUEJNY0xG?=
 =?utf-8?Q?G3OA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME1DanFGanE1Y2o2OTk4Qk1hRThCRHpJUHNsNXVkdm0rOUhGclM5VEJsTmx2?=
 =?utf-8?B?Rm1oME5ES3JPTzhGSVM0WTBQYkdlanJmQ3hoRGVLbXl3Z0dQR25xRDYycVlX?=
 =?utf-8?B?V2U3T2ZpaFAxeTFRTk5RYTluQmlLWlRKUHh3OEkvUGgvUlYyL2dnUDRXeWpS?=
 =?utf-8?B?QkJoMWt1bzJDdXluRHpnMkg1d2JlNm5RQ21xaTRQdGRadldGUHpwVUNUSUpq?=
 =?utf-8?B?d2NoQUZxZXpvMGROOFVIYmhRZG1LT1pUaWdzaTQ0bWpOK2tqcUhla2NOcXdH?=
 =?utf-8?B?SEZzRlFqeklFeG10bjM3QTFKdTlTRitreHE0UUZGRHM3QmFCSnpmTUFlRHFa?=
 =?utf-8?B?a3FJL3A0djV0YWljN1hSd3RvRGdLOWkrd1hTOU5NSEFKMG0xMi9jY3ZTTTFz?=
 =?utf-8?B?cm9lU0hudzM1NjY4Q0I4ZzNPWTVhWldRd29HNnRnNWJLZHBidE13ckNreHM1?=
 =?utf-8?B?bzB3Z0lRNm9pWkhzdTZLMm8waGNEYVNkLzg2c3JLYWU4MUZ1MVRFUE9oMThL?=
 =?utf-8?B?SU9SV0orWEtjbU5iOVJSR0ZTckVTR3R4VXA4RG44ZXdoZFdtWmJKNVpJdEE4?=
 =?utf-8?B?UkVBczZiQk85SFlhUnRuaXBSRjlwRTFiaUt1b1dUd25JdnVOemVOeXFHQmhP?=
 =?utf-8?B?YWs1SnFrcXR2blk0eTI0Ni83ZVliMmNQVXEvcnJZK0hCelJCYVY1di9XVEZF?=
 =?utf-8?B?S01yenFNVHFzejZrU25GZzhNcjEzc0lLbDdtZ01aUThUSXV5dmVHY3pkOW90?=
 =?utf-8?B?cTJuazErTUNNcloyR05BR2FxR3pQNURLVWpUNFRaSy9YUzhCaEVsZGpRZzky?=
 =?utf-8?B?YlNTdjhBU1U1SityNVNVZjBkNGYrODZWLzArcFRXYzFHcjkxUUNDQVBpWlZY?=
 =?utf-8?B?Y3I3NWNhYytpbEZyamx2Y0lNQnBteDZHV2FXdWZ3cWVUSlUxUTEzQ3dGRXBW?=
 =?utf-8?B?WmE0bUtOTC9sR0Z5bU9PZ0MyWTlZbWJUVkNKcHdQZlljUDQxKzZNeGJNSG55?=
 =?utf-8?B?ZXgrWFZIQlVaQU8xWTVBY3E5RlA0bVVBL0NZbUdTSlg1TlFJYnF5ZTkvdDND?=
 =?utf-8?B?T1lUNXVtWmxBbVRBelVLK2ZIQzlMZGFNMzE4L0R1L01UMjZWbXJyOGI3Y0g5?=
 =?utf-8?B?WjdWbnN3RzVubjRFU2ZucEo3YytTcnJWQXoxODZ6eHpEUU0wT2o3YTlwSGRO?=
 =?utf-8?B?LzBhZTBJQjdXYlFheEZ3U3kwaTVWY0t1cnBuUG9teGVReVNtTDE0VjZ1bUwx?=
 =?utf-8?B?cEEyVkhaR1l4TGpwb3lxRXBnRjd1L0k2c2VhOUJnMTFXeWdyVVJiOFl5cGxZ?=
 =?utf-8?B?M1FNeXpVTWN6bFJicWxTTElHMEZwemhSZ3lad2I1blU0NE12clhBOTBmQllL?=
 =?utf-8?B?Skg5YXU0cnQ5dktjK0d3UHNMaENnZktITkxSSTJiTXhUQ0RsQ3RXRDlRd3pL?=
 =?utf-8?B?Ujd0cmZDU3c5UldheU54R2lVYXFlbVl6ZzBpNmhubFQrd01aaFU3RnBxeVh6?=
 =?utf-8?B?T2xGM25Qa0lGaWpQWjBrQlNZTkNvSXZ0Z2N1bC8xcmF1NkdETEpKSlIyWTNY?=
 =?utf-8?B?RHpHTjJYSlA0aFd4UXlOZ1c4ZGJZZDV0MjVucUFIZXp0bnl5VGF2M3ZHa0Jq?=
 =?utf-8?B?STlRdXJLcnlNQjhBYm4xWENvVGZ3cDh2Sjd4OGxYdTN6QUs1KzhUc3MvNFBh?=
 =?utf-8?B?dlRQeXFLTmM4QnhEN0xBRmhoVnZ0VVl5MFdvYjBxUGJscHdyZXNHb253eTZQ?=
 =?utf-8?B?LzFmbGZlQStveHF4MjFDWXFrdFAvbEhXeU1xakYvSWpmRmhDU3JnRlhkTWZJ?=
 =?utf-8?B?bFF0SjlSVEJweVhndXdvejVBSS8wdSs3dUMxWE0ydzdDRnNvOW5hSnZTZ3Ri?=
 =?utf-8?B?R05JclB4RFJRdXN0bGhmaGtpN2xGUU5IaW53enJvUzI4OGU0aWhnMURHOTdj?=
 =?utf-8?B?KzlBb0Y5Tzd2UitDNnR4WFNlNURqQUVQcXJBenNGYU9DMHlPcGc1a2FtVXkx?=
 =?utf-8?B?eEhwSG9qeVRKdGVZNUZ6TFhDTmwzMFIwVlI2RXRYQXJMMjIxclpyRHI5U0dl?=
 =?utf-8?B?TW81eWx3ZGZRYUMyVnVmUDFvT3h1MG9WU3J3YlRFNkgyaENtZnJ3QmdPa3NC?=
 =?utf-8?B?cnpiWUFyU2xQeFhKQ3dQR1ZvZnhld0pwS1VkaDh5ZVJqVmxBdnFoM2ZKZ05u?=
 =?utf-8?B?QUZZZ0dFNlhxMjNRMXFoTFNiT2drQTljdnBtUmxtQ2VORE0vNWExaHNpc1E3?=
 =?utf-8?B?VWRacDhnREVNcjIrMTQ3ZmhubWpRK0taNENmeUlxMVNld2N5d0oyZjhxNEJF?=
 =?utf-8?B?OWVGa2E4Szk0SitsSmhjVHVrRDB4MUZtUFZaamhVRlhNRDRrUzBUQT09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e921d4-7541-461e-5f3b-08de72ccda8a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:15:30.0543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLC/lvmIqb0jub5a6J7j9UEKKTWmZIqQtZ7qfnsipijNgHWTLFZ4r+TifnItd0GJQqAxhK2d0EJglCYdOhMmKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3618
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031537_508503_3D3283D5 
X-CRM114-Status: GOOD (  14.94  )
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

On 2/22/26 18:03, Anup Patel wrote:
>> SBI code arranges domain PMP regions in a way that last entry is
>> all-inclusive "0..~0 RWX" and the rest of entries are not programmed.
>> This causes 2 problems for the eyeq7h.
>>
>> 1) Remaining entries from the boot loader.
>> When PMP is actually programmed on the later stage, only defined entries
>> get programmed. Therefore, if boot code configured some entries beyond
>> what is set in domain configuration, it will be untouched. Ex: boot code
>> sets entries 14 and 15, leaving others unconfigured. To prevent such
>> left over PMP entries, domain should configure all possible PMP regions.
> Better disable unused PMP entries in generic code itself. Basically,
> sbi_hart_oldpmp_configure() and sbi_hart_smepmp_configure()
> can disable unused PMP entries at the end just before calling
> sbi_hart_pmp_fence().

Agree, this is possible. Question is whether all platforms are OK
with this, meaning no one relies on boot loader configured PMPs.

I will prepare patch that disable non-configured PMP entries instead of not
touching it as it is today.

Thanks, Vladimir.
> 
>> 2) speculative prefetches
>> CPU can issue speculative prefetches to non-existent addresses. If this
>> access goes to the system NOC, it is mis-interpreted as an access
>> violation and error is reported, forcing system reset.
>>
>> To prevent such a speculative transaction to leave a CPU cluster,
>> block it using PMP, by restricting memory region to physically present
>> memory.
> The unused PMP entries are typically used when we have
> multiple domains on a platform (e.g. non-secure domain and
> secure domain). Consuming unused PMP entries to block
> speculative transactions leaves no PMP entries for system-level
> partitioning using domains.
> 
> I assume MIPS does not want to support OpenSBI domain
> on their platforms ??

So far I see only root domain. If multiple domains will be supported by
OpenSBI, no reason why not support it on the p8700 platform.

Thanks, Vladimir

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
