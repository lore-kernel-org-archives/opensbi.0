Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8178FC98324
	for <opensbi@archiver.kernel.org>; Sun, 27 Sep 2026 05:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V8edYiekJnWEctSfme75NIHfKvCnOVp0hl6GIEDGdiA=; b=rPpNXX8/wzpQN7
	IzQ1A/PgBHY5svoJ2h6HlXJ7ymCPrzp4m4sMoAGlUiXUQOadtg4okI+hW0Mn5Rg6kiVdhVQrD7EZv
	SXjMYnStEc+e/AslECQN7XlJp7mvFQRY3wviLvQiTSXLkv76QWLAO8on7w+5XDyBEfS12Lm5hrjGA
	wiX9V3eS9dPzYckW5flFK0q5e8kxnOyt8w/cIDv8qpuhDJcU97r0DH8bCfsu6JbfQtPLN754fumNt
	cRU/InvOcTJNXqSK46cm2nucWa6WhtfT1FlCHIcMJCEB8xCg+S0MF/rLkQvhezMH7bBQVwAxAv6Te
	CBvKHHREWQf96oyjm/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAhqq-0000000G2gu-1UzW;
	Sun, 27 Sep 2026 05:55:04 +0000
Received: from mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d40e::] helo=MEUPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAhqo-0000000G2gG-1DLP
	for opensbi@lists.infradead.org;
	Sun, 27 Sep 2026 05:55:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/ynS+h7XUlaO6QEafaGZLYaf5Sd8KgTveVrUN/LqiE34ndDlt5agXCt71mIps0KjJvM4NLV3B99vyMGejg5jSeB85/YPJ1TwXrSU7DQ1H2R2q9n+iY7A1vvpB2Wz7zF4MsOX4vdA8cVmhCYtftN2bNECaFPkW/S7n6t4Mqxoflo355DstfLoqgrI81cHbLCj+E3v2bHX5+21SwJPMwY5J6cBkuSPzjkXNFT6iZ+uMT1sD3hKwC4c2bEe+OUM9uLxxbXr/hmmNciQEJASQrvIm0zpNOW5aAxM5eH94zRq7T6GRpjWTYcjxIKMHQvNO7niKLbGny7Y4sQI2W3FEhMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Djbzxrz+itMGmK4I9cJ2jkM28dWNs/VXl5Xs03NalRw=;
 b=Dx9QCmYam1PnZaQIhF46pUc6r86e5+6p80uurjRCkjP1J6/2WxUszVquYFUJSXLqdzjgyv5D4WiAFNT8hslWJw5EBZ/nBaxV5XeaLcL8oRXYjzpMvXGFzF6oTWrtnOaIN6JwyOTbHHHu+sebr6D0YbCEduE/72NLGt8p1WkGQ0++CMU+V/KhJqXkpPgOQqEYZX24txeV3INHDuCRlb5ZFIcstbkPEdaZjz+q5mJA9+y269qc5fDXpoVsy2dOEbS4oSZg3/4MD9937NUREvfshbSdV+g74IIv9OInA2MJxDeXJMBzhPHSa+batl3KOveZRTDvOMVo4URuPUfHU1FzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Djbzxrz+itMGmK4I9cJ2jkM28dWNs/VXl5Xs03NalRw=;
 b=Fzkon0e7FKdgz3VVN5ulWZTIvQMyySblTinrXDCiSRBaZO/2KpIoRQ45yJCv8RozZhlseYGF74e1IpRX1S/2y93rxfnaHLabvXu+9DLtQOja0eptuXtNT9RVkklNUW7jz8uT5N10fuCoYqz2ERleaBJDSWa5C+2tQiqk3QW16yMCi0kMiEBs4+YYV58no1YG8gzE80yuEEVK6++tU39ObamnxMoHzjkHsnVM9a23zCTBueKU33nxL9mAkTNwZ2fntgkY/xdKyQ1oiuJcmje0RIjNYehcLLXv8zwQdjIDgUeFx2DbvMug8QkVuQU6LN+i58eveHuMTp5FtCr+jponcw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY7P300MB0290.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:235::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.23; Sun, 27 Sep 2026 05:54:19 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0451.014; Sun, 27 Sep 2026
 05:54:19 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: opensbi@lists.infradead.org
Cc: Fengwei Tan <tfx2001@outlook.com>
Subject: [PATCH] lib: sbi_pmu: Fix fixed-counter events reported as unsupported
Date: Sun, 27 Sep 2026 13:53:27 +0800
Message-ID: <SY8P300MB0041D04649621E79FE950B43B58E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
X-Change-ID: 20260927-fix-pmu-event-get-info-c4a6e2c5717b
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20260927-fix-pmu-event-get-info-v1-1-3d100d753b5f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY7P300MB0290:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec47663-217b-43e0-7840-08df1c5bc55e
X-Microsoft-Antispam: BCL:0;ARA:14566002|25010399006|4140399003|23021999003|8060799015|19110799012|12121999013|260925184616899003|6090799003|5072599009|15080799012|24021099003|5062599005|52005399003|40105399003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YllUQ0FkVmZlSTE0US9rRWF1QWNVcUwyNi90bkt3dkMxQVZ3dkdpcjJzLzNh?=
 =?utf-8?B?b2FBZEdaVmpmUUI5QXVQYldoMVhrdlBCSngybzhpaUhKdXQ4NDFWUE5haXRx?=
 =?utf-8?B?OTBOaFIwWVlsS2NTVTBJMlBoUGY5dWhUSXVyVWpWQk10c2FDOVhlMjhJdmJV?=
 =?utf-8?B?UXBvKzZCU2l3QzY1aWJpajZxSUcrcGFMaTVJR1M2ejRsMFZlNlVmMU5sK2NR?=
 =?utf-8?B?N2xJNy9IVnpFRng0OWx6bTdoUnQrNnJHQUFJc2tsckpiQzRiaGV6ZDV5Szlo?=
 =?utf-8?B?RldBK3N4Rytja1Ivd2VtZS9Ua1F5eWNYRFRaY2cwUWZQa09YN3pQV0hsbzlT?=
 =?utf-8?B?V3FCLzVaQ3BFR2NqdWh3dnJlenN0aG5WRm9OOVh4c3plQllGZ0FVTnhzSGI0?=
 =?utf-8?B?MXd4Ym5NNDFUOXNkYlRVV2FZVGxDV2J5Z1RJWFdsWjBMcnIzTGxjd3VzeFhD?=
 =?utf-8?B?RGg4eEdXRHJYL3VmK2FzYVFKMHJjalZXeTRYSk11eWIzNWxINThlRUlXVWxp?=
 =?utf-8?B?V0FFaG01d0dWblRlMzVZMDczQVJPWUorYkpRNUhkc1ZtcnFqK3FmOS9qajl5?=
 =?utf-8?B?STBxSTJONXY4cXY4bk93TDFCQUhNd1RjYnRKQ01xN2EyY0hMRGpsRDBCSmQ0?=
 =?utf-8?B?cU1YaTNQU1hibzJ2dE11ZE5BY1NiMDRhVlRGWFFjdmNMMkNLbFFyWEpIcExY?=
 =?utf-8?B?RWFMeFU0N2pTVEFudE9DcENtdk5CZTVhY21leXA1dXV4OTBqS2hHT2JGTkpt?=
 =?utf-8?B?ZHlPRHA4U1duYkdTWjVhRkVJVmZmbkh1aG03VkpuUWxLYVFkK3RlMHZjdGo5?=
 =?utf-8?B?RTFiblFubHBzbE5JT1UrbzRjb1prN3NJR0xyUVRSZlVTdDNIdUNpekp5Y2NI?=
 =?utf-8?B?V0d5VXNHVkpKU2NLMEt5SEFJSHJzU0o4OWFBZWlCTnBLVWgwTUVvNW55dkli?=
 =?utf-8?B?SlFhbUdwK2ozMjFwR3RZZmpmNExGR0Z1Q09FN0xRTjk1S3JvdkVnRU1BaGZM?=
 =?utf-8?B?MmdwZ2h1cnlvemhLZGltbHg1TFRUZERkdDlVR29NNUhkaWowMHRaWXp2Y1NL?=
 =?utf-8?B?TCtEN0ozN1lyWmdOMmVxLzJoWmpHTGw2bzlVYU9SQWYwUkxhbisvQ2t3bExp?=
 =?utf-8?B?UG10M1NVeGFzWGRmSm9YUjREM01WUmdIY3hhdUcxYlFIck8xT2JGdmFyRncz?=
 =?utf-8?B?QW5qRlNiUGVTeFRrSkR5THQ0SmZBeTRZTWZZSm1wVUpoQkxGR3gyNE1EdFpE?=
 =?utf-8?B?OTRXNEh5eDZYVDVHaGd4eDNBUmF2U0FURit0Vmw4cnZMYk1RdnM0WVdOaFE1?=
 =?utf-8?B?WmtPeE8vem1GZnhBTW1mV1ZxZitDenY0akpzamJTK0JUMVVNSnI1dVl3cEtU?=
 =?utf-8?B?dkJSNkNLa1VOUGZpckJyWUovVmlLSmVXajdPejN3dWlOd1Z2OVRRSTdkeXJk?=
 =?utf-8?Q?AtGBmSgy?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBsd1FMVlFPa3B3a2VaMHJ3d2sydWRBYWpXOHAwQWZ1TzFJN2t1dUdZaEkz?=
 =?utf-8?B?UmtvaWYwL0F5aW9MeTJvS2U3aEFjejJ6WlgxRXp0d0d3L0pVMGxYT1NxdEpi?=
 =?utf-8?B?d0FwSUNwUUtRaWNwL3NFZ0tGR3BiZTBuYXhtMDNYdE5uMHhUUEpOZVJ1S0cv?=
 =?utf-8?B?eTVyeU1heWpGR3F6VGFRRDQzRCsxaFRRQkN3ZWtKbHJoU053NjVmSXMxcWs1?=
 =?utf-8?B?K2xmaU5PN1JoQkF4NU5lRThoMXpMYnpkYU4yUVJCc3JONGlXRUdYWHVLRUY4?=
 =?utf-8?B?L0ZMZHFlZ0RjcXFUTmtvc1VwbDJ0a2pVTFlQYzJGeUpqR2JjUHdvRzczMXNq?=
 =?utf-8?B?WXFVSVBld09WRzZkQUxRRzRIS0lIU28xUVB3OFlCQzJQQmkrSzZPUStrbDJC?=
 =?utf-8?B?NjZzMkljNkh2TGFqenJhbnZPYW9YbjI5MDV5aWs3L3M4bVhaTURBRkFKOUhz?=
 =?utf-8?B?dERzZ3FnQWMvMzA4T1pSMEh0WXBaUFNVdzRMVkpib1JOYmR1WTNKOWhHNU5y?=
 =?utf-8?B?b2M2UVhTTldsWEx1U3JhdHZmQUF4RnBpclA3T29tdWMzM01FM1daUVVOYnVs?=
 =?utf-8?B?UWgvcEZoUzAyMzV6NHJ1YVBsemVtbWVhQlRrcnVETTZvYjFHTEFKcm5nTEFp?=
 =?utf-8?B?cmdvdXRzVm8xeWFqWHR5Ry8zeWt1MjZPR25GZERVZW9idHlwMUxrK050Umtx?=
 =?utf-8?B?TXpvTG02UU0xcTduVHB1YTN0ZURwRjZBM0orQVhRT3Jrd3hSZUdxQ203N0Vx?=
 =?utf-8?B?MmUyRE03Qmc1Wm9DU1RwMXl4Y2NBUzRjQkJEMFM4Nm0vaUFXRWdTb0JQejEr?=
 =?utf-8?B?SEtBdkJsbDNZQ2p0czNuYnpycndvSTJxbmNrSWUwR2I3eHo1YTJjbFJBbEI4?=
 =?utf-8?B?eFpXS3NEMHkzZ2Jtc2Y5QjVWcjUxdEhod29DNW9INlFGSlZUeGZ4a0V3NmtU?=
 =?utf-8?B?SVBBQUJkLzdvbmd0V2FzNDF6T1hlMlp4eXd1bVlZL2lMRlRiVkdXNVRuYUVG?=
 =?utf-8?B?V0NGN25VUDFrMTRRNVZwcXVzazdBbVZzVkFUVTFIRFRPQzFRSGVxN0U3cldV?=
 =?utf-8?B?d1E4amFYN3R6bFk2RmtXRnFUZ0xJUDBKTWtzRjlnTkk5OHlKTDIyYVN4TzBi?=
 =?utf-8?B?MDBnaWZmK1FlK2Y1TG1reVhqN2VMYXA0dTU4MWdhNW9oaCtkL21LSERSVFV1?=
 =?utf-8?B?N2tVWGN1NSt6ZDdEWTkrSnVkV3V3ajViOUJrNU8rU29YaVdHS2RnYjVXVktl?=
 =?utf-8?B?M1Q2RFNLNVBoT2d0ajFEQTdpNDFtejNtR2xEYjhjVi9VWVJiT2tURjdPWGVx?=
 =?utf-8?B?ZkJGWmVPTnJtdW5iZHBMbFUxeWU2dk4yd2dteFVDeGNwUytRQ0lJQ0ZRV1FL?=
 =?utf-8?B?bnhIUGhLaldtcjQ4MXpKTkxRdVp2VmFXdTJxMFdzc2cvZ25TOU9uZTRRd2F3?=
 =?utf-8?B?TTlQbmVpSnJHVkcxT0xnM3RxdEsxWnpKQ2tjZlZKcGVXRUp6VXJEcHRUakVF?=
 =?utf-8?B?TzVia2I5dmwwa1RFRnBGT2VwNzBRWEJMNkNUN2g0ZFRRN2dHbjdYMUFwd3Vp?=
 =?utf-8?B?Z0lndkxRc1o4WXZMaGpSVjNZYVgwY05vcUt1WkNuVTAvZ3VMR3d2QWo2NElN?=
 =?utf-8?B?TnI0dnJzODR3Z0RWb2tiNW8xMTlwWWhIZ1IyTHJSZ3lpSi83N3dsVU02RFU5?=
 =?utf-8?B?Z2s1bVJOMnBHMmVZb0ZOak1UZlZxaE1xbmlGSnVPZ0RvalRadWJSSFBIbWwr?=
 =?utf-8?B?VU9zcXpPMFQ2cFAvNFlxWkNMZ2wwQkViRXJPazV6aXJrTGZUd2VmSmRHUTV2?=
 =?utf-8?B?aVhnSm5FRXhZRFRCcit2MkhoRTVBdEY0KzgyVzBhdG5PRms4dkh0czNwZUp6?=
 =?utf-8?Q?rArwEGQDVaefp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec47663-217b-43e0-7840-08df1c5bc55e
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 05:54:19.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0290
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_225502_343365_801A3F57 
X-CRM114-Status: UNSURE (   8.15  )
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

OpenSBI assigns SBI_PMU_HW_CPU_CYCLES and SBI_PMU_HW_INSTRUCTIONS to
fixed counters during PMU initialization. sbi_pmu_ctr_cfg_match()
recognizes these events without searching hw_event_map[].

However, sbi_pmu_event_get_info() only checks hw_event_map[] when
determining whether a hardware event is supported. As a result, these
fixed-counter events are reported as unsupported when no riscv,pmu
device tree node is provided.

Check fixed-counter events separately using pmu_ctr_find_fixed_hw() and
report them as supported.

Fixes: e4345842168b ("lib: sbi_pmu: Implement SBI PMU event info function")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 lib/sbi/sbi_pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e79f6b60..b4abfa1e 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1119,6 +1119,9 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 			einfo[i].output = 0;
 		} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 			einfo[i].output = 1;
+		} else if (event_type == SBI_PMU_EVENT_TYPE_HW &&
+			   pmu_ctr_find_fixed_hw(event_idx) >= 0) {
+			einfo[i].output = 1;
 		} else {
 			for (j = 0; j < num_hw_events; j++) {
 				temp = &hw_event_map[j];

---
base-commit: 5a175017261af97e9122fcb9d9012481cdb5aa41
change-id: 20260927-fix-pmu-event-get-info-c4a6e2c5717b

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
