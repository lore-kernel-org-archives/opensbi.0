Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B514EA4FD1
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 15:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7BzbDVXA6gm4l+6/rGXz0PLAmOksCNUh038AT8U5Q3s=; b=t4Fp30FcY5w+UU82VJ0UiTSPlD
	Xdyrsq/qG52+0b//7xHl5YhqmmgrgNqevCwHXd3SyxN/9Sw8FMM5i/usDAYHskpzjl8q28pc0kSAs
	FyTISmD3b2Y7zad6aaIjCvU/pZUaiWelAcbtJtSZkAXBVj1Rqpx3/715v/pvr6EH14vHaBnQ5TUIx
	NE5RMqqfoLRDVkDmkH3KHuRw9SMcp9SWzEpe21PxcfjcREuSVIUpqhVPQWWmauf31daSEGMB+uBqS
	13kolznTf8GznvG9kTYsIjFBDkVBKUqfffbAZ21d6xJYWmEeIyzlAwpNrDrWi3bTuGjXPfh6Iy84d
	sTkh0nQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXWv-00000000Y32-2l2e;
	Mon, 23 Feb 2026 15:07:25 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXWt-00000000Y2h-08LE
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 15:07:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRBxDI00VarlglQDVM56d7Cbt5YtdmyKbR2bnw8PGogm/I8jHK5KBVBas+QawEezWmTsgPhd1ffDwxxQPSPCvUhJ2ZEoqGdoUrjq1V3dcPidixcn7Qb7UBR4T5IIGcoh1rzw5dzLp11vnols6Ll8DANNU4351/NKVII7OcRs8wx1stQmYH1zy1JNiB6Qn3gwHZQchF5MKFgns4+uQqqKyUTxKdnbjvtZTIsPkjoY1s4JwPEzpe+QnCPt8gcYhdWpBKwZcY/agyenofUd5ZlF4VoxKUGXKo7gb9lkKcvdXLJBXwZo3Q2tSWbusFdzz/s2w5VdP+RWSwr1HXSAdWpCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy9Ol3Z0UuI7IRc5tu95vi475gg83t4aNf1DpyRRi9o=;
 b=RtCk1D6Jb5GeIB2h04Gf68C+7WJchMuTdAFnMc8R8fXCA5vW/49UirbVlE+nfLWQARou4eDdcumrgHO/R5ViS5bsUTYn1MWbELqN2AUDdkEEFiU5itFFUM2IOPyqULZw4hoIV7EJU9uYngRKDtabVSTXOenEOAs9FXk3qkSueY3LC7550jKJgYirLbJU2BWePln9bj3BdTYLtBT2cwaMuojmrohrg5hypRcBxQpTANioJVcJiNDx7YysoN6HBgPpSTslJ7Us2yrUKFbVNPL2evEQKAvZILu9T2hkY47fBSTcHQXAtalS93s7CmrNuWORx6YCNG3Stqje/trvn/eHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy9Ol3Z0UuI7IRc5tu95vi475gg83t4aNf1DpyRRi9o=;
 b=pwUxRwg9Q/ffj8OYj/fQnw9AtdLrMDGMA3zCv0QpLQtpftky/84U5iXLLolLTe+fmcpHy6ch7pKGFcJUPTOBiy091bhK1qRbpTARaWP6E+WtlZWqTOiqo4qIWrKErACeBg64xFTg9HNA4JgBOiqDoIAVESq2ysFW/dpqJUcSeck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by PA1PR09MB8642.eurprd09.prod.outlook.com (2603:10a6:102:55f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 15:07:19 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 15:07:19 +0000
Message-ID: <8994c9d9-b278-4803-9709-69094fe3bbb0@mobileye.com>
Date: Mon, 23 Feb 2026 17:06:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] Introduce MIPS p8700 based "eyeq7h" and "boston"
To: anup@brainfault.org
Cc: benoit.monin@bootlin.com, cfu@mips.com, opensbi@lists.infradead.org,
 cc=cfu@mips.com
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com>
 <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To AS2PR09MB6296.eurprd09.prod.outlook.com
 (2603:10a6:20b:578::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR09MB6296:EE_|PA1PR09MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: ba658f4b-7594-4efe-6bd1-08de72ed3d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTBPQWg0QUNkWHQ3R0gxTHFXUkZGS1ZkbHFFWnZ6cWF6SnRIZUV1ZU81Y082?=
 =?utf-8?B?ZXlZU2hhRGhSeHl1aTNYRUdIWUE2aGpoeFFTdlRib3Y2OFB1VGdYUytXcGFR?=
 =?utf-8?B?ZlNoUlFpeUF5SFJWYVhSM052QkRmVU13RHVOb2pxK1VNSktQWjEraVNVRThh?=
 =?utf-8?B?S1BCajEvb3lXaWVhNWpvSnhLcTZyMHRGTHZweXFwWFlsZG5mejd5QnR5byto?=
 =?utf-8?B?V3p4WUNsNC94TzhKVWtlb1lPaEdYVGoyeU5rcVdCRkN6a3ZJR0dqZFhvOHl1?=
 =?utf-8?B?em9jUkhZdHovUGxteElxbmY2Z1QrbGpwSkc1amVqMXA3ajhXdGhySVRscUNP?=
 =?utf-8?B?MTJyNis2KzJ5MjluN2tZSU81Tjd1QnlnMGFmbGFyMU92STdjaUVsSXBZTTVu?=
 =?utf-8?B?eW5LcE81Y3BxUm1KazBzdFlHSGplbGFhY2pZVVJOWnkzQlYxT3Q0TWg2TG9P?=
 =?utf-8?B?eXVCeDRLb2lWekpjRTVFdEt4dTNxWlZZTlVxOU5qSUVOSnZSMFIrSFVvTW5v?=
 =?utf-8?B?c3k4dURLc0hheVE5N1Rqdm05dHZUenZGOFhlK0JGZlNiejhFWk9BSUhYK0FW?=
 =?utf-8?B?Q25ZaE1tTUZadUp6Y1ZBZTVLNFV4cW82V1kxMHY4Sll1angvK3ZQbVp2UytD?=
 =?utf-8?B?WG1KeXBIRFBnRzIyaDRWTVpZbmdrRmVjUlMrRVZDUHRmYXZJbHRTMk5LUjVF?=
 =?utf-8?B?Z0JxUjQ1dGQyZmVnRDJndXJoT3hHd3dCK2lrYjdqeVcrWURsNkVoQy9kZ0Vi?=
 =?utf-8?B?eWxBWXlkTHVHdXpjejZIajVMY1dncmFCTllkZ1ZSelBrdDVWN1JkbjJjNVZu?=
 =?utf-8?B?Q3RpTTM4dWZrUlBrUGN4Z1o3MUhqdHh1aHRlVW9Fd1B0eGxWSGxqckd1ZEox?=
 =?utf-8?B?RDcrMGNDRXBVcEFqbFlFWlNmN1VZbGlrS3hXQUFFMXlQZXYxc1FYeHVSQjNq?=
 =?utf-8?B?Q2lpR0RKcVltQnRpendwNElKRDFuR1NBYVpuNEZRclc3MzgvWjR1czZHM1FW?=
 =?utf-8?B?d3NnMFhyVzdIYkxKQlliUVIwSEdDSGhlejYzMExvS0YzODNTKzVod3FxaUxB?=
 =?utf-8?B?VFpDQzNRWUtJcXBxVEFuY3dJbzVjVkhOdmRjUEQyWmRVVm1XL3lOTEhGYjNr?=
 =?utf-8?B?NEFTaGJ6V0pTbHR1WklYaVhiV2F2M0Z4eVo1dzEwUk9yWm96blhncHd4M2lz?=
 =?utf-8?B?ZDZHZ092VlY0M3ljZ3BvQVJGQXVtSjhnekNGSjRyWTVSbldqZis3dWtEbWtL?=
 =?utf-8?B?eU9aa3JwYXpCR01IdWF1ZGpWMk4rNHBGOXh3bzFvVVF1ODF5T3lMcklHZExC?=
 =?utf-8?B?T2xsRTRtZklkRE9FUkdYZjZMbVhudXFNS0VzLzhIei9pT3QvdHYwN29aS3d2?=
 =?utf-8?B?d0RDeUM4cHptWXZOalZ5NUVUWnBMcldveEdZbXRDVVoyQUNUcVBlQmdmYmdr?=
 =?utf-8?B?Mm55NHc3RWhZZ2w5ZXMwNVFRVCtaZVFlcUo5ODlsMmJDaHRSa0wyWTFQaHRI?=
 =?utf-8?B?UmpaY1o1RG00SFl3TTVydU9aaitTNUxYcnl5ci8wTnFZYUdVS2pJdWRQQnJm?=
 =?utf-8?B?cXRoQTZRUjZJc012QVNmdVVETEFqelY4YTFjK1JEQmZiNzhUeFk5ZW8rcG1r?=
 =?utf-8?B?NlFBNnBlNSsvVTJKU1h1d3FhWXFYY2YvSENWZGI2TWRGTW5JVi8rVXRSeklw?=
 =?utf-8?B?V280aFROTnpZNWFXSFNzamx6SW13RHh2aEVtS25PWUgrdGJNRWN5STdOb1VD?=
 =?utf-8?B?Ky9IcUxZRWZKbTFBT2dxM3dOTFFvM0JWSHNXZFJMalpmcEJneE4rS3l3NTFx?=
 =?utf-8?B?bjVZWTZqbFFWY1JnM2JQaHNMek1rNGY4NXIzZjFJTWZmUlFtdVV5TVVQUnhK?=
 =?utf-8?B?K0EyYVAycjIvTTJudEFmaTFCSWp1ZkpQaGQ5cnNQdGEzQ1JaaHgvMEF4QnBK?=
 =?utf-8?B?Uk5NYUFFa3pWZjFhRlZtVkpsWGZIM3ZMaU5xSndmVlVHY1dQR2ZCbEUzVU9R?=
 =?utf-8?B?UmFjRUlUa29lUWpPTmEwWDN0bjBkczdPZGo4R0dZaExpalhFUW9yZnpFYWIv?=
 =?utf-8?B?U3V5RGFmYWVjVU1BblFsZEpXeWMyTlY3dzEyOFQyOUQ3RlZsM0FFSzFvRktI?=
 =?utf-8?Q?dCGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXllb3FIMmZkRkNkeVFFcFFxVnpBRjJFam5qYnBrRndpam5vQnkxM2FXUW0w?=
 =?utf-8?B?c1gzMU9KOUtYL2Z0UXN4WkVTVjY3blhVeE9hQWd0azQwMkJMNkM0Z2ZJcUhq?=
 =?utf-8?B?eGdzNFBEaDZqZU9HK080bWdRbEhpYXBCMEFMZ0QrakNjaXdWbW5rUHFHYUkw?=
 =?utf-8?B?a2k1K2h6UXhxeFB1UHRDcW1Qc0JvNnRjbFlSUDU0QTlpNmdPeXJKYm5HWHB0?=
 =?utf-8?B?RzJ4SFF6VmduRDF4Y21LSWtzUkV5QWdsSi8ycmJFS3VYQks3enRlcXc0bS9Z?=
 =?utf-8?B?d3hDY05RL2prTzArZVkxOVlPWmI2cElUOUE5cXJMeUE3cVZUeHg0d0JNeGVW?=
 =?utf-8?B?Vllzd2Z0d2xzN3luSWgwNEc3RU52b0RYY1FKWXZURHpKNXBWRUpycS9YR2Ux?=
 =?utf-8?B?K1VEUlE2VzgrU2hPY3ljR25YOHJWalpmQ0t4VTA5RnE1aGZXbmZrN04wcWtH?=
 =?utf-8?B?VFV0SnZOak9tcGMwVnpqeTlyZzd3VG5VUFQ2NzJhdW1xdEJsY216TGlGNlFh?=
 =?utf-8?B?TkpDSlBZeGRjMW9OYUtTdC82R1BhWEhIZWJRWno4Sy90WU5QQjZMZG96Zjg2?=
 =?utf-8?B?MHNsK0IvL1RlcTJCbCt4ZEh6ZE1JbXU4RUY4d1BWRkhnNzIyamVhNXJRd1Rv?=
 =?utf-8?B?RFpBeTljSWUrQUd4bWovbUFWQ0xPaENWMHVtTUc1WWJ2K3htSTJicTVHSElr?=
 =?utf-8?B?dVFiRE02d2pxcHhCTkZtcW9HSHozVFJmY3I4d2pnT1RpSWtHdUc2R3V2eWhK?=
 =?utf-8?B?SmdSRmJqUlhkWEdabjZxYlZRSWxtaVI0VFBsZEJ6VFJNVnZCVmhLZUdpVHZv?=
 =?utf-8?B?M3dRNnZKeWRsQUZQTjk3RUg3R1VVRjMxd0g3Vk8yeHZJOER2QllCMFgvRGs1?=
 =?utf-8?B?ZlZ4YWRtNmhPOUFLTVJxaHdRY0R1K2NabUl3NzkrRjNlbHRhd1BRcXJOd0pY?=
 =?utf-8?B?V0JETHZqTUtaODQramhWOFN3RXFJaXUrVzd6SlczSENMQVF0QnJ2dnpUL3kx?=
 =?utf-8?B?WWowSHZIQWduaFY1VUppazdsYW5mR2xhMjJqRE1xRDVJZjBpNWpXV0l3YlRX?=
 =?utf-8?B?M1JNNG5TVFFWSEl6L3gxelFtdmNtMUdzdGxhdUR0VmJzamlsVlF0di83bldP?=
 =?utf-8?B?cnBFVE9DTWk0dmJXNmRWOUZnQW9oNXhNeDBRSVgrYnBvTVBVSXR3WlJkWjJN?=
 =?utf-8?B?bFlDc2tuNy9XVm4yeUlUUERNakh5ZnJzekozUVhzalhweGI1eEUwem1WWjdl?=
 =?utf-8?B?WEN6QkJPNzVBZmxkWGExUitMSDM3R0prSmV0dEtxWUo4QmljWWtreTdFZmxo?=
 =?utf-8?B?OVdXR3IxdFFieXpoUmdVWWowZXU3dW1ya3J3eS96TjRVeFdWeFlTZHg1TU1L?=
 =?utf-8?B?Nkl2aGc3cmVGT0tMQ2w5N1NJSzd6bm9xUXFFQlJJUXJZcUtQOWUzeXF0NW8r?=
 =?utf-8?B?bGFKc3c1ZXpBT1BCb3dIWmdmWDU2M3dFRnlqZTRKQVNVRWRyZG5lRjNoM2ZM?=
 =?utf-8?B?c25XSEJQS0UrVFdzdGlVQ0NObCt6SEFNbFZ2VDZ2am1FUHpqb1dha0JGa3Iy?=
 =?utf-8?B?bHNGNHQ0bGZWeDZqRjMwM21rOGxOL3ZtZXFxdUloR3FpZXN1enh2bHdXV2xP?=
 =?utf-8?B?VVMwNmxnbWNTcFkxY2kydlNNTmlLcDBoTTlZSlkzaklIMGtkaHNJWldQYTE5?=
 =?utf-8?B?TTh4aFpWRUZ5Y2NkSnlCRWtzcXBqMlQ5UE9xMDVVOFFleUMyVVA5VWJSVlRq?=
 =?utf-8?B?SkFvL2l6WGFMR1UrRS8zbm1MQlhEekpNcHIzOThPM1VZNjVPZjBhd3J2d3N4?=
 =?utf-8?B?UFZUK29UM2x0dkNFeFVZTDlPZkRkYUcxb2hKNERveHBacCtib0d3cS8yc2RY?=
 =?utf-8?B?bkZRQmRkdFVsRjZ2eHVkdXplTW5UMDFHMXZVWXdZZFhRcGV6TC9oU1NoZ3Vw?=
 =?utf-8?B?a1l3M3loSkhZZEtVQWVJenkzcHRzM0N1ZlRZWWQwSTNUaVdWb040SHVCaVFq?=
 =?utf-8?B?RmlVUGpHN3pCWnA2VkpCVTZiVmZZSGU3Q1h6VjM1WU12NzR1ZFVGNDBKQnRh?=
 =?utf-8?B?S0pib1o5ZTA5ZkR2Nk41Y3V0UTM3T3FmSWVmVE9Ud0FtSXFnTW9qUG1mczlz?=
 =?utf-8?B?eFdBek5hVUNjRmlZZzlsUE5ETDI2a1dneDB3ZEtxRXVhTnFPWmFiQUxkL0dV?=
 =?utf-8?B?aVorUWJ6UDA3MGNHY3RFcHRGU2NtNXNzNFlndEhwanY5TWJqZmgxNGNFNjN3?=
 =?utf-8?B?ODlQd3RPMUhyM3N0OFMyRHA0NUdPYnpraytVR3NTbzRjUlNwcVZxNGMzaU1W?=
 =?utf-8?B?K1M3YUZVaUpHTGs3YkZNNUx5TXdzV2dBUDZaeFNJL2lWdUE3ZitWdz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba658f4b-7594-4efe-6bd1-08de72ed3d39
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:07:19.4480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCql/jRQtaqRmOXPeBZbLpvI/8DwM+eMb87qj9BKKKH9mfPmJdMbZa7c1Jd1CJsTJ2kFd2A5ZqbqYIgiOUCshQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR09MB8642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_070723_234582_0F74FA8C 
X-CRM114-Status: UNSURE (   2.71  )
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

I submitted V3 patches, by mistake set wrong "in-reply-to:". V3 is here
https://lore.kernel.org/all/20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com/

Shall I re-submit it with fixed "in-reply-to:"?

Thanks, Vladimir

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
