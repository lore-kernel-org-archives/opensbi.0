Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1484CA5FDD
	for <opensbi@archiver.kernel.org>; Sat,  3 Oct 2026 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-ID:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v85BXBxD0Qr8tbb4d9lb18GoCKrnnaMzTT5MbMFc/rA=; b=WNuE9YMexzHsXE
	xsM60anPPwuS1R4IQ1dikMCDWZfSoQ9aZJ/2h4InSuFITWsnykZYE1dqgUdQNpndB6JONekrHyJZ0
	8b6vI0XTf9HVMHkdJdsheWaUeXapoMHW/14aVj+xj1igkhYyiEul6z9RCRKDzYxnhBHCun7kgER2m
	izj+E4ucjPcziHsgNEc2DW54EQ6kWkdyS2PaQeNH6EUCH73kP4TLmivWkGxY69H4IUi5POdWxEKJN
	JCBAhe+MQsAjHRGdGMwpdX5Afsdz2w8dVk8jkSc3jWcKBKbjOFztBkZn7JDcnHzmr/9qTfHTFdeir
	/EQiLt9kwfMffTKY10Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Vb-0000000Dg1C-3Saw;
	Sat, 03 Oct 2026 15:18:43 +0000
Received: from mail-australiaeastazolkn19012065.outbound.protection.outlook.com ([52.103.72.65] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1VY-0000000Dg0X-49cz
	for opensbi@lists.infradead.org;
	Sat, 03 Oct 2026 15:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+r5iM+2dejGQqhbxASZw8ALRSNlmxceqz98T+0ta8JhGkdJumwqGiRt2zV4RMiL3PutF6c6QVpZHkkzhRwC9HasNg2OJFJXLIRmV+rZuSKFB6P1K8ONGHOzZPfBIq+mUeib/i8n2UcYMQhSnNhmdL3apID9FYq3mjSW3OE+7t/AqgE8Asccq6pu1lYNCNapDXmOyUi/ortsWaXr9fylohy0DEiibTxnqIH54U6yPkaBeVzkYNDw5ckebOXsLOpqvnMw4bVMNyJh41co9jSZo/Y99+ReywulPNFStV1oOjFqucNjfwwb67dJVr6tLQ810Wna98xclj9y07f4W85wQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOz2wMLnVUtvovevH06vKd9Nmk5vl0Yt9eg7+OWke9I=;
 b=RVhS+0Ef4UtHzPEC/H8RpPElxG92HN/FdVuJxwWjVLS1ert26mZo83SaUL55rBufS1SDYuAJvUHoU+iNIqQDpPunU5ppcIhjW/Oq95hxgz7cS5PvzJ0e112c8zM+kdR2C9HMfGGNoCzHN3c+k9l08H17vR845hQvOkiWtdXDeNm/Rp8I8xS+Maf4t/z+YtE9bOAUDev4LGhakBP+opRWFtmMPIOu4fSfxmlasGKUK2AKWL75Tjxw8p30O/y2aHUi2+QeceG5V4lv1A9bbwmhArvqd63HuTA6RRmr5UPXDXYiI1fidutqIS0DS3o13PgKWfYblN2N5z/9D7MGwoedqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOz2wMLnVUtvovevH06vKd9Nmk5vl0Yt9eg7+OWke9I=;
 b=ryxvNOcHv87ROGF818GnEEmadgXotQeUjqvz31/dZWluIppLS8B1Kv6r3UvafpyH9VXA8SJsdz7zpOns6MRYzD4BpA6PM6yQtKrFhA3UwFpeSfmzzFmyEySkhltaop7GpGjNn39FI7mxvjhyPVt5ewzuhzPp9coAmmlCcqD9BpVkcqErCotKnGWV5AoPXKewYfoWhXFS/GloziTF4b1TZR5Uf7T2htOse6C9J8UaADE+WpILWOt8Mj9hDTsDaZn7srmC5OLV2CY88cPE06NVGfJLHIrEsfN10lOyOxcxYFVK/N6WFP7vPEKVbCLWYps0DV+uujQLXcfvbzqT0npVBA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0687.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:289::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.20; Sat, 3 Oct 2026 15:18:17 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 15:18:17 +0000
From: Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 03 Oct 2026 23:18:06 +0800
Subject: [PATCH] lib: sbi_pmu: fix mapping reset for already stopped
 counters
Message-ID: <SY8P300MB00410B44E7D55CB5CF7B276AB5882@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-B4-Tracking: v=1; b=H4sIAK0cwWoC/yXMQQrCMBBG4auUWTuQprQBryIu2uSvjmhaJokIp
 Xdv1OUHj7dRggoSnZuNFG9JssSK9tSQv4/xBpZQTdbYoTWm41k+vL4K+6XEDGVFQuZ5lCcCO+f
 Qh8GGPoDqYlXU/re/XP9OZXrA5++T9v0AViNfe4AAAAA=
X-Change-ID: 20261003-fix-pmu-counter-reset-failed-777e5d62d5de
To: opensbi@lists.infradead.org
Cc: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>, 
 Anup Patel <anup@brainfault.org>, Fengwei Tan <tfx2001@outlook.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; i=tfx2001@outlook.com;
 h=from:subject:message-id; bh=dCkO/NaZ1C+FSWzTZe6mw3EUg8zUweLBF0/f6ruccWA=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBqwRy3k2JUFCN8wAChdBOer6bHI9siPR0nwpx0K
 /YSE5JvQp+JAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCasEctwAKCRAcD62l0/wL
 2ihkEACDMGry+L0BSYZfC9yIavXAJ84LY2Qx5nWZjgHSQSOc+bdYaEIl788KHjS2W4TzFjATnKd
 W4boRDpSNAhS/yARep0TegPjknqsiDe7o+pY5UQO7Eyt5YG+OmQbzYs5JqwvNTbkf4lutkxCIjz
 KXWnWHEtfxMvUnaowsjA5nknZG4CfGd1pVMh/6swNe4+IcsbY8bHS8AFRVI43swIo2/25cAB6o4
 nB9Vs0awLZfknVVWkO9mM6DR+/v+2176FEezce+r2z42mH7/fPoGoSHRDuMB7uFQdpC9GkFA5fK
 XXgKMBXUvlHXerYE/b84+HCrbz4MQEE6W3+HEhSeKuRyaaL3Sb6XsU92015mgbvzMjaZjxWEcu9
 Eht137Vd9LQMMB0Ujfv3K4zggnq43dnAVRx4oPSJJ+FdXzk+sERrqtH6jwL2d4FPuv75Bw5D9NT
 bieP4CTSldjL2ljb5tO5RuhDu0Xba1ipfsSSst2f3QP4X64hZRXmxTut1PGr1RxtjnNSWmdWkM7
 7PfPv1a7GO9J0ptTsHS4ZFihd0qhcPQ4A22kIQT5EVHjtqs4UouXts3qsDWcy9f5d4lHgpWHW+L
 33AiqODMik9Bo8oy0ruzMlmEBmaHn/hk2bXfrxmd4jM+2IlBoup+ndNszqIGCX/wSBjsxUWmVn+
 0imt1kKYGQYKUHQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: SI3PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:295::8) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261003-fix-pmu-counter-reset-failed-v1-1-40b62101af5e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0687:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c8b0b4-5782-435c-4b9f-08df21618d28
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|5072599009|260925184616899003|25010399006|19110799012|8060799015|6090799003|5062599005|23021999003|15080799012|21061999006|41001999006|24021099003|2607281247196008|4302099013|440099028|3412199025|26104999009|1602099012|40105399003|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFkxdTJYc3dEbm5NTktmNFVJWFhsTGdvUHFRRDJZWTBXMWwxdDhmNTdDVGpv?=
 =?utf-8?B?d0F6WEZHNmlJL2I3azFFWVl1c29POE1TYzBNQm1xRlJvakt1Y1ZwQ3p2R0pa?=
 =?utf-8?B?TzFzKzJpQ2hTVUYrWVRjckJIYTV0bmxOUURaazE2REZHenJybzFLSXF6TmNo?=
 =?utf-8?B?Y29WRHJjYWFod1FmUWJTRVVuVk1wSlE3b1VOcENGS2NKdjlNdUJ6ZTFyZ2Rs?=
 =?utf-8?B?YWtTSkcxVnk4akRPeWNMc2FHZmk3S1V2Rmk1dGFaM0N0aCtPczl2b01RN3lv?=
 =?utf-8?B?ZkFlWnROcmZ3NXlSRzJGdmZ4TG16NERLeUhxbFFjdG05dGRieVFXSmpGTmty?=
 =?utf-8?B?QUxrSFlCVStyTUJIdUh3M01KazlxNjdseVo3cGc1TXk4bmx1TEhsS1NNcUlo?=
 =?utf-8?B?cEZIRlhWeU5zdGFWbnpubWlURml1a0JFaWZhN1dPaXZmWkNUMHhvWExSK2Qy?=
 =?utf-8?B?S2xTUk9lalFFdkJqblFydkRuNVU1M1FrbFdTWFRRR2V3alRXWmh0b2ZoMmZG?=
 =?utf-8?B?Z1V0UWZSRkw0UXVHMk81M3dEMnR0RCtkenJuMU5GdW53bVdXd2xSUHV5YTlW?=
 =?utf-8?B?c1h3Q1liWWk1MllnWHRocmVEUTRTQkRneE9KRmk3bkkxNmZNWU5uYzZyYWoy?=
 =?utf-8?B?aU10ajN3aUszNXQ2WmlBcWs3Tm9DODFsQmFCS0h2V2pKdENQdFJoVXVseUdw?=
 =?utf-8?B?Y0xiOVNZL1lCeGIxeCtaSU9adm5FQmJiMUh6WDNTOVJNbWhxWXRDL2s2L2Nz?=
 =?utf-8?B?SGZQS3VWOFgvZlhhL1YyWFhvWEhaMzhVY3lDYXgvMDVoODRXZnd1NXJZT3ZK?=
 =?utf-8?B?bmd5Z09iTzBMZVRVWlpncG04My9LSFI3QUJxemR3UkIxS0NiejRtbVdNUnZt?=
 =?utf-8?B?R05xcW1QL0JuWi9GWFJTM0tBRDJiYnhIS2pQY244TWhncm1KQlBuK01yL1Nm?=
 =?utf-8?B?SlhZbTEwVDRoMW9DZUJoRkQwZUFjd25TZSt6cldRMGl4QXVZUWtFdTdHNEpR?=
 =?utf-8?B?UkxZY29RUW11NSsrek5kVlEzREFpMW9NWlZMV3VSMldhUXZDWjNDeXdQaE9D?=
 =?utf-8?B?M0ptdWg3VEpYKysyVGphUTZ4eUNGd2Zmaml6b1dtdm5YdExLWll2TTU4NnVR?=
 =?utf-8?B?UVlyVmRxYlhHSUo4TEhvN3pCMEhlTFRzN3JPbHdQek5IS01Ma0VOeFQ0TE1p?=
 =?utf-8?B?aDdRWnpEUGk5QkpTRXd3WW9wc2Znd1doMG1IYTVmZGU2RnVDbms1VkswdWNt?=
 =?utf-8?B?TGtBeDFRREZ6RWVRcTQ3Y1dTYTJDdGpYNEo0bXJ1M2JmdEN4WFM2S2N3OE1H?=
 =?utf-8?B?Q2h4NjFoRkVnVUVJM3d4Tk1TS1ErbktJaHFVc3I4cCtuTmZBMitzTnU0UFcv?=
 =?utf-8?B?QUt0RnExSjhjOHlqTTNFVVpqK1BPZW1jWXNaM1pITzlpKy94V2VuV1Y4R3Bj?=
 =?utf-8?B?ZlUrZ25sbWVhMEx1VTVjc3g1dlNXNktlVk9DYzJCTUQrS2ltY254VElrcW1V?=
 =?utf-8?B?dERtaTdZR3U1MjN0OTIzMk9yYUE5aUljQ1BvUTVaZVI3dlBtakxxbUZHWXgr?=
 =?utf-8?Q?SAKmanLGfzYNwig0Qguoz7e3Toh5CeRgM/Oo5eiJ39Mu95?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlwdE50YnBOVzMwbEE3YndqSGZCWTFiWWtIN1k0ZDRpaVJoQVdYSlFteWh3?=
 =?utf-8?B?RmRiVEtibU1VUlg5WnY3RzhJWi9TWjAwMzVCUXM4UXE4Z2dVYTdiQmd2NEgz?=
 =?utf-8?B?Y0hHQW5OZ0Y1dXRhRGY1dnlpVEhjcFAxMXVvRFJqTFhlaXdyRU95YlZOTlJP?=
 =?utf-8?B?OFpGRnpmSjdqSHNBMjVYZ3QwTTEvZjBXbWN4d1pRWnhEeW1XbVhYeXMrSVd1?=
 =?utf-8?B?NUY0RWJvZHJUcFl3ekJmOFh6MXV1ZWFhUzVIck5EblFGdVlYejdxOFY5NXFO?=
 =?utf-8?B?TDZiMUxCZ0lKMXoxRTBVczhucGhmaWhpY3AxK0ZnOHZsYXhZYzZ5K3BpdnNa?=
 =?utf-8?B?YXcxc1pYTHlHNm5KVzdWUHBIMTZtSnVEdTRLWVRya01tRW1KbzVIaklpbnNm?=
 =?utf-8?B?YURWZm5qTjREQURrVkRZSHhCU2pEZ2t6WFNEeHNkUWZ1WlM4RzdpcE9LWHF6?=
 =?utf-8?B?VFNPOVZ2b3czeWN6RnlDVGQzU0l6cG1qNHdtbTQvS1o0OEN0eGxvQ1g3VUdp?=
 =?utf-8?B?TTgvZkc5ODIxdm92TXNUMkU4bzVSMkpobUN6eVlWMmx5ZE1UNHhyRlk2d0dE?=
 =?utf-8?B?aml2NERidGZ5Z2YwTUZ2aFM3MTVocEZ1UlNwVlE5akl5K2JqajZyMTFlZXRS?=
 =?utf-8?B?Y1NPRlFLOURLVklxaHNkTEJQcWloUGxDUlBHdEh1TytvWXNIQmsvZzViZTN1?=
 =?utf-8?B?T0xvTzR4UE1KbnNSV2J1cUl2N2ZhUisvaGIvcDFWRUJ6OVltSE12UGo2V1V0?=
 =?utf-8?B?ZHBEblF1QklJdlVWd2t6UnJvaENYT1RBR0dkdnZST0cydlJ5alNlbG5jL3p5?=
 =?utf-8?B?eENEcUJhOVcySTVhWmh5NzllMjkzczFtZjhxWUNmamZtM0JidGEycys4VThu?=
 =?utf-8?B?UktKclhVdG5zYXlzSm10UXRKOWlWRzlPNndzcElVckN6R2RZY01JTUdmMjRO?=
 =?utf-8?B?dlFKSGJUZE5vK1NENE9CWXVnazBRRkNBQW9TQ2RPVkJ3TUc1Sk1LYnZaR2FV?=
 =?utf-8?B?YUZTdVFsZHZubzdSNHl2d3EwYXhGdHYycjBSaXZZR0JvRFZveVBwMWltdmFq?=
 =?utf-8?B?WGVoZU5Ud3RocjZkS3ozRE1QbW9OUHBYUllwQVI1Zlh0UTJCamxjc2RFT2F2?=
 =?utf-8?B?eGQrMTdaUFFTUzl5dThUNjBnVVFqWnNiMUNaVDdyZ0ZVZ2RYcWpzWTNjTWI3?=
 =?utf-8?B?MWZjbjU3ejRUSjlYUUVyVVFNeXFSUFpRamRmME9vbHJBQnZWZXRvbGxoSFhO?=
 =?utf-8?B?eHpBTmp0YzR5U0JrNlNWZGJZL3pGZVJjbHZVMGxDQnVQTzRRaFp2TWpjVm5n?=
 =?utf-8?B?Q2lieStxWEZRNDhFU3BPV1R3WGY0QkIzTUJWbzQvZUFoQkpRd1REOFlRRVhR?=
 =?utf-8?B?T2QxUExEY3ZOdytmZElFRU9qekd0b045b2lSMWxkZVZZYklyTFNOTjhWTTI5?=
 =?utf-8?B?SVVUSkU5Vlg4NW5kM1hFYVlZZGo2L29WV0FJNWx4Qll0QUpscGVtSTZhWGRT?=
 =?utf-8?B?bzNOR3VwMFR6Q0JZQzE3V0ZSelRCWUFjS20rK3YwMGEwWGFtMGJqR3RVM1Ev?=
 =?utf-8?B?dmRlTmJYMXhERDFzdEt4dlJFeFJodVRXbElFbzErM09DZCt4YzZBTXFGTS9y?=
 =?utf-8?B?eHlRYmpjc1VVb2VjSEtubjhvZmpPMmhjYnJaVm5HUFV1bkhNL0Q0WitCM0hK?=
 =?utf-8?B?eExFay9xVFR3b0hMN3lkOWFyY0FielROQlV0NXZmenhabC9scko2QmozeTRM?=
 =?utf-8?B?RlpXZzQ5aVJRTG1VMGE5VFJQMkJwWXR4ZE9ZUEdScWY3L1AyS09OVDFveDIv?=
 =?utf-8?B?UmtyTmlDWVV2djRYRENMR0hGYS84VXlTYXRmL3BNcmNzb09ZcXJZUTlPWExG?=
 =?utf-8?Q?w1zz/KR0X+3aq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c8b0b4-5782-435c-4b9f-08df21618d28
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 15:18:17.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_081841_047195_D83EC13D 
X-CRM114-Status: GOOD (  13.11  )
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

Linux stops a counter before issuing another stop with RESET flag when
deleting an event [1]. Returning early on SBI_EALREADY_STOPPED skips
counter-to-event mapping reset, eventually exhausting the hardware
counters.

Continue the stop and reset process for the remaining counters when a
counter in the set is already stopped. Preserve SBI_EALREADY_STOPPED in
the final result, while still returning immediately on other errors.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/perf/riscv_pmu.c?id=72d3fcf802c45d00b300f25b848a93c3a2bd7c7e#n318

Fixes: c5077d497d0f ("lib: sbi_pmu: Fix counter and event info error codes as per SBI v3.0 spec")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
This patch fixes a regression introduced by c5077d497d0f ("lib: sbi_pmu:
Fix counter and event info error codes as per SBI v3.0 spec"), where the
counter-to-event mapping reset is skipped if a counter in the set is
already stopped. This eventually exhausts the hardware counters.

The sbi_pmu_ctr_start() path is left unchanged as it doesn't seem to hit
any issue, but please let me know if I missed anything and I will follow
up with a v2.
---
 lib/sbi/sbi_pmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index b4abfa1e..fbc66e2b 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -696,6 +696,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	int event_idx_type;
 	uint32_t event_code;
 	int i, cidx;
+	bool any_already_stopped = false;
 
 	if (!pmu_ctr_idx_validate(cbase, cmask))
 		return ret;
@@ -718,8 +719,11 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 		else
 			ret = pmu_ctr_stop_hw(cidx);
 
-		if(ret)
+		if (ret == SBI_EALREADY_STOPPED) {
+			any_already_stopped = true;
+		} else if (ret) {
 			return ret;
+		}
 
 		if (cidx > (CSR_INSTRET - CSR_CYCLE) && flag & SBI_PMU_STOP_FLAG_RESET) {
 			phs->active_events[cidx] = SBI_PMU_EVENT_IDX_INVALID;
@@ -731,6 +735,10 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	if (phs->sse_enabled)
 		csr_clear(CSR_MIP, sbi_pmu_irq_mask());
 
+	if (!ret && any_already_stopped) {
+		ret = SBI_EALREADY_STOPPED;
+	}
+
 	return ret;
 }
 

---
base-commit: a50211e908af9017f316361f89a04ad9446cb330
change-id: 20261003-fix-pmu-counter-reset-failed-777e5d62d5de

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
