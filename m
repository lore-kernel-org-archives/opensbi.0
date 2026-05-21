Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D8CD4F5E
	for <opensbi@archiver.kernel.org>; Thu, 21 May 2026 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwS9V+iwEP+hjzM8O87BG29UmD+9AP7GhMQrMEKkmFM=; b=0vYsMzvUDMheaH
	EouT2ZNO0Z4sbSwM0HK6g99cDxvOh3LOcvzAJfYW57HyWm1LffPCMufWz/aS/OQrCy9davcRHo7oE
	ZZpT3AlENQYistEd96VsWJchw2Jum2D/ybI8haAbyqVQYeOPWhtvSViY2ARQT/+xtTxAadcHhRK10
	6hwZ2RNSUwzTJ8Va1n4HG+tTDSyjCm1xL+bF3BuP/hSPx3Sgk/JbQ3lR4cKWgN5bdseo8fzcYfT4S
	+SWXGpKz7Vt845Nho+v3UOWT6s6SPoPwFT7asAPG/GA3gzowEjt2E3wydknGpplIX7Li79v129RL8
	mACo56aTJTKpZQXmWnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyjt-000000078Ku-1g2f;
	Thu, 21 May 2026 08:26:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyjr-000000078K8-0Z3o
	for opensbi@lists.infradead.org;
	Thu, 21 May 2026 08:26:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5TJlE3085144;
	Thu, 21 May 2026 08:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ls3lZJl06ZD
	1Xeb2PO5IA/mAp7ADn5a3NwPWF3MyTuw=; b=JHx48Q4iGGugQzI1/NtSuLUugUJ
	0K4WEvy1V8/iMhYv0XEY+r1/ZZuuqixVjMHJ/6LP63GkPP9Cioov3uPH5qjwzwRp
	bETmUQOdf4sIgu11tGpbFoz9ZABGKtNNiyVZv465ihaACDmld6JQTaxGJ8pQzXVh
	e/lzViYQcrwVmEDZ59UtD23AqecRYlulkOq9ajZeghGHUaX7LrdEt86NtStFuyX1
	E/Z44JZSEvUvzkY+/WGDekiSwkBddasbXuTzUt3pPKfQq8u+5QmhwKJ7huMdZ38k
	b9kG2fPvJQRmD9o46lOGL5s89r1z36I5pgGABdPeGic4a6XFdN2hqDSOvfg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4dd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64L8QUfn028218;
	Thu, 21 May 2026 08:26:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712gbkju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:30 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64L8QUF0028202;
	Thu, 21 May 2026 08:26:30 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64L8QUbQ028200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:30 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 8205F21A7B; Thu, 21 May 2026 13:56:29 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 1/2] lib: sbi_hart: No need to clear features in hart_detect_features()
Date: Thu, 21 May 2026 13:56:24 +0530
Message-ID: <20260521082625.1520870-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521082625.1520870-1-anup.patel@oss.qualcomm.com>
References: <20260521082625.1520870-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ec1b9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=J797vcvDe0Wnb0lxRKkA:9
X-Proofpoint-GUID: n5JoqaK6f4sGz-YtRMjmhZ3NZLwaQ45l
X-Proofpoint-ORIG-GUID: n5JoqaK6f4sGz-YtRMjmhZ3NZLwaQ45l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MiBTYWx0ZWRfX0ny7P8aEXDBn
 Ka8eboPc+Cpy/zBYKu0z+34ZAK04N1yyTjyVcXWNZqzO8UzfWIV+LekQTnjsnw7zp/ixX0dEWcE
 sWt6uG3gbEBvdvyKf3unUrq0TVXDRBDPwP2fs0f+yGXen6LuJ8tx0VzB6xCHQ+M3KtwtWzqAOzu
 TDApxlXsHD3pvbSJv5kxi7tUKtUTvtGiPnAeoOvIHiMcfyvTdTos/C3hz0cbjD6JTIyJhmWhKmP
 IWS8llDvTUB8kjLJ2ZsCni8YEFSKLc4oBzpuuJg/Oe3sWgyl8ia4UuvCfxcBQ5l75oyJMew8Jba
 RNe8Eh8PtM1BeqEyXEO4efRKtDuf3Akxt93bVnNXWhmHl8L3I0yi5L8RW0IZS6ztPi2sHdtmSoD
 gxkhYBqy+tDHzxW9VaurwGJS6QkShF644EGu66lS/nK1nb63CIEdzWycgT1rSUpbbl9ZUphkJ2f
 YEfLKM6SM6qTfdpgNEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012643_289395_72DF096E 
X-CRM114-Status: GOOD (  10.07  )
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

The per-hart features are already zeroed by sbi_scratch_alloc_offset()
for all harts so hart_detect_features() should not explicitly clear
features later.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/sbi/sbi_hart.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0f690f53..e7360712 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -520,13 +520,6 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	if (hfeatures->detected)
 		return 0;
 
-	/* Clear hart features */
-	sbi_memset(hfeatures->extensions, 0, sizeof(hfeatures->extensions));
-	sbi_memset(hfeatures->csrs, 0, sizeof(hfeatures->csrs));
-	hfeatures->pmp_count = 0;
-	hfeatures->mhpm_mask = 0;
-	hfeatures->priv_version = SBI_HART_PRIV_VER_UNKNOWN;
-
 	/*
 	 * Parse device tree extensions early, before any trap-based checks.
 	 * Needed to detect Smrnmi and install NMI handlers before CSR probes
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
