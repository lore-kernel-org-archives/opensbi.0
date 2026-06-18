Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE66DCD98F2
	for <opensbi@archiver.kernel.org>; Thu, 18 Jun 2026 10:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MkxVnvcPLLAmVH+8+uPWytFYoX41nkt//HF88XbsLJw=; b=2E5BJFntKDIlxPYaAvUysUWXGt
	Pt6rClSzw3eaOrzEQIx30tVgcmXWwAU6QAJQdhOxbVhk0rY63j8fOy4lCDetc5UZ2rQMc+v75lDuK
	ZyZUXlAMRFjRpYaoZEE/ay0ymc9ZSh3bawL1uGISe4IIfSrk5U4cUYWXOc2bHtcc/J4oqp76dUs+u
	bPwS1Y6+OsWMF/ZS0m5ACx+0JcNIrXyI4de1FKvrutSzvYHKlEaLpomJyFIWxGCGL1OAQI3TxCisx
	TknoaFmPCwYi41oLooUOzfKhwBWgzioqKqjQbR+Q/MzHfDUHNxNVgx3i0iyxWafQbGfJc1j8dybcJ
	zZXVl3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9wp-000000016G1-1Mc1;
	Thu, 18 Jun 2026 10:26:11 +0000
Received: from mail-westeuropeazon11010045.outbound.protection.outlook.com ([52.101.69.45] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9wm-000000016Ek-3TfG
	for opensbi@lists.infradead.org;
	Thu, 18 Jun 2026 10:26:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPaWuXncvNNE4QZ5wrxaC1sYS2evBHA9G3Cu8+x9tVZnI2YUd2BXaAVmLPiKuBDWYzRaSBwnPyV9ryGn6yyXzUKlKfnF2lMWn15jw5Oc77d5ofgJ8CDbg/pzBXvfVFyGNs0gr+iysnPZVvBtEKkE3GT3zW3L8IDenGmLE39zVTADqfWHod7JQ4FBR2LMKzQj8pC1MBI9GRi6NbDxDzWbn89Vjxh0azh3hgX3QWvVyPGrexbjDUc1SonjlWOUTNxfh/xTSlJVHgln0ky+yoqwdnWc7H6HSr9LAJNE/gofrPPPu77A9UJo6acvTrJhzTCLaTfN2s8aqpgr7kTcTenI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEStSW1qh25bADXsRrU8efhVW6O42BwcultMRbjEtbo=;
 b=PYW5VU2O61kZbpTTnAmHEcjIqN6tbYZzl29seVhiuelaoOBhMCb0TX3KHYMhCjZ+CyUciiuEA4eRtvp1tgRHm3kYwfrzTnCGRt2cYqkLqqijwEjyRwNEWG2bWagyfLFnXtVxBVwT7aIKURIF8opCFmgyZB3ZWgESY6NLMxtatXizs5kla/1LAr4t/3opfUYIvmbQWwwo31cwJmFsyI7I1RhHaty8sAVtozYVAU9dOV1/KK1PFtNPYFYh9QXoPf/j9C45lM5QNkQFhvLQ/6IIzBVfpF0NgHvrivSGM8jjrwjB2HhbeFKz+eIhWZLgdziMN09WSSP72c5vjQZgwsJkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEStSW1qh25bADXsRrU8efhVW6O42BwcultMRbjEtbo=;
 b=hJ6isPTkaxIUVOqI3PBdHu2ZU4tQ18imbvDeZtSoXIqbcJOG21jkfh1UOfVODDtgKcQkL04d03sEnIk5wmNJlCY8QCFXU8JE1TOt1XhzFvHoVqVXL8CDD6yP0FGdqRidL+vZ2Tmp97XC7r8+UiBX1P0LBq4c3aeX8y1fwIF/1+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by AM7PR09MB3909.eurprd09.prod.outlook.com (2603:10a6:20b:121::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Thu, 18 Jun
 2026 10:26:01 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 10:26:00 +0000
Message-ID: <a3ebf138-4988-40ca-9cea-090f53d636ac@mobileye.com>
Date: Thu, 18 Jun 2026 13:25:57 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Upcoming OpenSBI v1.9 release
To: Anup Patel <anup@brainfault.org>, OpenSBI <opensbi@lists.infradead.org>
Cc: Atish Patra <atish.patra@linux.dev>
References: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <CAAhSdy3gbrLYmRPhD-ABXZUW0SjXk5xpQbZ_vrb1hsaJ0N3qTQ@mail.gmail.com>
X-ClientProxiedBy: TLZP290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::10) To AS2PR09MB6296.eurprd09.prod.outlook.com
 (2603:10a6:20b:578::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR09MB6296:EE_|AM7PR09MB3909:EE_
X-MS-Office365-Filtering-Correlation-Id: 348a2f99-11c6-4183-d6c3-08decd23fe16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tQZY1nD9VVsNs3sx4X7I/5mbx1hPoHmluGg1ilFQNSh8dVC62v6GzbrOdN1ibOm9fMpevL0sMsDCV1xU23MkaicRv3I1xjOf9I2xL8QDuDYyQyVINVN0d/N0xmQGKQALEpMeMl8Vc2IJ6t9e73iIh0vVG4vMWxmTynNlUlkh0zxmWMvn6XaNa8R6dztk4Do3qdyc2IQb91hcjLSkpN6E1jqvdTYnUX92g3wDO/GOWGYX+Gf5XIc+oRErAdA1BdxQPJf6uCCjiNKtrm2dCeHqMepQwS+YOzuNw8AUMrVgs4qVolERJCVkWnPceF5Lb6dwaVbhE4/bqi3ObAOP3idvxd7GGraI3pocEH2yiXTww7AraTRl3a7cPryRvkT2UBGPEMrMGZudUG8fQlcq0au6M3dEqJKxyWbtcsaqkzIkPFYkAxFurh68DSlUd4dToZrXBjLmkjRzIrEvYkqyRrqUE6xwR5eeCd1MExzi6h9FvrcvMVX/Fo5vd5MurUoFXMWrxIyqKloNGvyw0YjB85p8CteR6Ufcmc7UC60wMna8+eHqb4owS04zvcsBINxkjrrRSljJ/F0hoY44hf22n94a7KWEdkcEzu826apnDZk7efS4AUcI+PPo/6HjsVHBfb9+XXHkoeEQJIV28VSr/cc5Kxyxb4LomXIbL0ku1DHxjuLoUSUU9B1+7o3475NdYRBg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHFFcVpuanVaK3JqNTNPQnFSQ0p0VXgySEJxR2ozUjZRZHdPQjFuR2tHZmp5?=
 =?utf-8?B?VmluRjNpVUhnNWVnRmZMNngydkphRXN2Q3htZUl4enArczBvLzVZMm1ad1dJ?=
 =?utf-8?B?cFJjeitFVm9BdDB4cStHZnFXVlBSMFVJVUVOWEJaQ2VZalhNaW9sajBWVUtG?=
 =?utf-8?B?a0xJTDJFVGRzME5HdGN6L0J1L3R5Q1kxYW0yKzZ6WWdReWFJNzN3S1pDRDdt?=
 =?utf-8?B?Y2JqTkY1bzhYRHYvZjZ3bkk4a2RVb1FQSG1tSDFnZlVNbytuZzl2OEFlWDNo?=
 =?utf-8?B?c0VUNUZlbittN2ZiNGdaTmE4VWJEN1NLd1ovSTVDSDlpUExpM1dNbnl4dDJU?=
 =?utf-8?B?K3N5dDkzcVhoNE1jR2poZmRKODFZdmpmSTNZS2RTMjkvZWFFN25VL0VydUNT?=
 =?utf-8?B?aVl5SUJxU1ZWTllUdE1VdE8rYVB2VThmVmxEbFlzQ2hxajd2MkpFdVE0RTBw?=
 =?utf-8?B?Q0xVdk11NHI0T1BDR0t4dzVoY2NGSTFsTiszRi9JQU53MFhRNWl3MXNwSmNQ?=
 =?utf-8?B?TGFSTjZYMEREakxyOVZ2T1NDeXFUeDNRM1JiaGF5TXNPdVkyNWNXZTd4QndF?=
 =?utf-8?B?NE9wNW5Lamp6di9scm9PN08zaFlvMjRTRWR0dUVVUnlvaWM3NVlrWTQwT2ZJ?=
 =?utf-8?B?UHV6blErRmltZk1XSWphOFhaNllJOTR3SXFhK1c5ekhHYkJjeTJhd1hMdDdu?=
 =?utf-8?B?K1Z5MytCMTZDNVptSDIzSk5KSWJGM2lQNHRIVEhVK0toc3QzUkdrTzBLUXZS?=
 =?utf-8?B?WUpobnVUcEMzNlBkakZ1blYvVG13Zzg4Vmk0bDBXUURHSmNaYVN2ZDF0Y0w1?=
 =?utf-8?B?c3pSdjlzV21HNDFBL0lsOENuYWpORWwzaFdzY0pudDZQWGxZTDBtdEhZczFz?=
 =?utf-8?B?aHV5U3hRTUJRbzE2bzZGTmpFZysxTGk2azM4WmhseGRCOTgvMDdyYmwvUEc4?=
 =?utf-8?B?MVZlSzVwMjFsZHN1ODROU1BGU3ZoV2wzOFh6N3VLR001aHhvYjNoTUJ1MitL?=
 =?utf-8?B?MWJmdEt5MnFkcWg5K09ZNjBmcHd1ZEZpaDdJSzVsYzBZOU1hNnRyRkxubTlr?=
 =?utf-8?B?c0JoZU03VjkzQkJVMnZtY0dBclVNSzBna2hvUXBUQjRoeG1CcG5vWEwrdHNW?=
 =?utf-8?B?d3lhZjBwVzUxVWxVSE9INGFLYm9TUmlxNjloRTNWZ1hrb3NXYllCcTJ0WHRU?=
 =?utf-8?B?TkhwOWMwRmRFRGE2YXJMYmtQWmRDQXhNVFI2NVMyendkN2N1VW9jd2F2ODcv?=
 =?utf-8?B?L2U3KzN0clNvdHJoWmhtTmtjRG16cXhZeDJKcXI3OEdOVVBNZ1Boa2I2WEMy?=
 =?utf-8?B?UmUyelB6QVBoQ3BjVDI4Z3NsVzZQb1NqdTRlajQrZzNtT3MyM0hrbVMwWlAz?=
 =?utf-8?B?Z2VCN0VldEtpM0w3djFiNWhqcUVmNWl6N2kwUGtmOFYzTzFwVGc1eWgvTkoz?=
 =?utf-8?B?ZGFQUlpGdSt4Q29TSDh1b3lYWkxIZHltcmhaNlIydHpXSkZ3WURYZ3Rkd2wv?=
 =?utf-8?B?ZDFpMjRyN2QzK01iL3kxYVdHWDRya3hBdENjZkZBbUpoQS94bjRPVzhUU3R0?=
 =?utf-8?B?RUpvRHlKaVRNOVk2SzJQcHRkZVZHUG1pejJoMVZPUG9DNnRnT3U5SHNVc2ZO?=
 =?utf-8?B?am5uRHZaQ1dxWURhazNMcm1VV205M1drTlFVL0Y2UHJERFA0VGpIQkJOc1Va?=
 =?utf-8?B?OTFNWVhYNGsyRWxRdzRBREgwTldwYUJCNXRRRjNYRmgraEwvWFZSY2VDcC9y?=
 =?utf-8?B?UHJTRmJjQWlnOHRUMDJLUjMxQXBYbE9WdGNvdXFqNGRmQmlMRG42MnErWjEr?=
 =?utf-8?B?WDZGeUNNbWcrNGhFWWJNMlA5bjFMdG1nTHdGL04rTkV4NjRIc2NDTHh2QVBq?=
 =?utf-8?B?V3hidDFiakZ4TTI2RmV2T2Z5UHYxV0I2bk1JNlBoL2VtL1BmNTB1Z3ZqRTlr?=
 =?utf-8?B?aXpkYnRRVVkxQjBIMmpueVJUUE5OKzlsaC8wVmZOL1drd01kdHU1bUNqWUZl?=
 =?utf-8?B?S3creExsV29lS3UwT09NaXc2TFhwS0xDd1ROUHVhMVo1K2Q3R1pEN3hWQVNx?=
 =?utf-8?B?USs3cEEyQXhDUWkrTVFpNVFNM1ljaEhkV3REUkhWV2t5ZmNTK3l1ekRxY0ZE?=
 =?utf-8?B?LytmVTdIV3c3Zkx6RmFiZXZDL1V4L1czZDVJUmd0VnZZd0l3dmtPL2JBQ3Rt?=
 =?utf-8?B?emxZTjFWQnBzNDNmbk05ak5SSjlkd1BLVFNuZXloYWw4dUY5cHN6bTBlZGVR?=
 =?utf-8?B?ekZIR002RFArSDVpQVZLOEovWldhYmJmVDJETExhTUdINDVpNUYzUlBCRnpi?=
 =?utf-8?B?VTViM2lkQXZ4STF5TXNRc3VEaWMrZ2w5eVVUQnovQ0ZrUU5tTEppQT09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348a2f99-11c6-4183-d6c3-08decd23fe16
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 10:26:00.7011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOr3fUb8NpHArXKsGkCPu+4+zPQ8A/tsPzksIagM2uqGtGxuNVVMVU8frz8uWpG1W/qpPtrzsug9X+Iy2F6ziw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_032609_329480_A7950ACC 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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

On 6/17/26 19:48, Anup Patel wrote:
> Hi All,
> 
> We are close to the OpenSBI v1.9 release. I plan to complete this
> release by the end of June (29th or 30th June 2026).
> 
> This week and next week, I will be mostly merging fixes and
> few of the in-flight patches.
> 
> I request everyone to test the latest OpenSBI on their RISC-V platforms.
> 
> Best Regards,
> Anup
> 
Tested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
commit a8be5e9478be (lib: sbi: Rework misaligned vector load/store, 2026-06-08)
on the platform/generic/mips/eyeq7h

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
