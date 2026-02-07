Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE517EE0AC7
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5yh9QtM+eFVk+t0brCwQVAIoAhhHG5fRgW1No7gqnSg=; b=vHYKAod8XOcB4L
	2p2zNzEN+8qDeslVDAqh9rF89+FIGkEmIFWgEqCXPdZze5V0IlVoCnHIW6UC66RRcoDYDebkwjZNa
	CQDGxvhZfzBFHdWY4Iu5RnVYsfSz9c975JOEey5O9c+2DYTDPAluPxgBADp8vQaZvsfEcA+J1pJPl
	3a77m7LUFmD+4lzkw+FNFim1vVW9Z2jxv3vmpDyf4KTmXgIjDYXkqKoKZBTrPuzPXnYCiTJRf4158
	EX02UU2cw3Rqb4Ul3q5V3FDZht7z6ybFHOqjj0Y9W4G1XsoX/G/ExKxLNsGgLGxpsVq9X9Hzenp6m
	CH/3TY63mWWND2F4ybBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofWB-0000000CJSF-1QHv;
	Sat, 07 Feb 2026 10:26:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW8-0000000CJPz-1xVO
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:26:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174e2JS2496847;
	Sat, 7 Feb 2026 10:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cb0+iUUuVSpzdQTTKXxlQWQ4JvZ/gbMcRq6
	BmK7ud9U=; b=FucfHgJ4lBvlGiY/ZamyKk8FXrQDIzZ4yrMifqgyrsrJ3c2BKVg
	FYpGPbqaTx0oswiRQLTqGWlc8SQpKpFDmk2VJs6WxfxtoEbjnyudCgPRV6ld+VGa
	FVb7g90XBn2XX14otnAQnqCnybEHS1brT71M7kIgFg1MU/r3EPl04JUUOgMv6Err
	/e4BsCPYQ6W9ghLvmj6E9s/bzSWaZciwbWJNemgg9TImjw4LCQ/alovNX432ZtUF
	qT1gUjU3cOfCvJ4mzOSC6NVNZM7xkFYvYK6rpID2AlP1VnXmbVvqbXPK3cPOSVRd
	ocyJS5qdoZZBKCPGxpGOARogOB8vnlBnxbA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xjg8g0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 617AQ3Nm002714;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfkj4ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 617AQ3eP002686;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 617AQ3uI002677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BAC4224986; Sat,  7 Feb 2026 15:56:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/8] Extend irqchip framework for M-mode interrupts
Date: Sat,  7 Feb 2026 15:55:54 +0530
Message-ID: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69871340 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=AHNysdtPsxtkaPcY4bYA:9
X-Proofpoint-ORIG-GUID: lPLZcf9GfU_ieOP-w4f-I5maGRJiGWRq
X-Proofpoint-GUID: lPLZcf9GfU_ieOP-w4f-I5maGRJiGWRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX1nXuzFbv3PkY
 l+rn6ivoppGgqtUDl2hDvaIbVSgrFeT7RARllsxMbj+6+djLoIdrFB6KzUJ1VmowWgeDAQvT7fA
 3Ww0mnHQ86Rfa7oAwD+zq8V9vZMhxdZp4Hk8wbpocDB88gr1BfmcZOafwGtVrbru3O2MWV0PpW0
 x8XeTwY9RVICfKPmVh0K0fNCRBtHQjQNQvoyJJ7Q2PBx3Lnp7U/ijrGDajPqRTrvioSmc8CRLyF
 J9VIicwNGAbufHTSSanzkFQxDXLxjwJk6x3HA9f2x1wV1xtOig/sh66i8A3uTAehR+5m/fTfQ8X
 BKh2VpYG37L9xBrO8hZiCzyBgsNvaOSl7CWpA1uYZsP0+kns5iP/ueAhCIsDv5pu8AZai0CniBG
 iuuzyAVuL8soMSoNOGlSXLqiDF7vU1yB4wXu6xJw8aPWEraEn3XzsiEa8st4qYRRF/YMaxeoESg
 mx5mp8YfDgRlK+F8k9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1011 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022620_510616_0E05DF45 
X-CRM114-Status: UNSURE (   8.81  )
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

To handle interrupts in M-mode, the OpenSBI irqchip framework
needs to support:
1) Multiple interrupt controllers where each targets a
   subset of harts
2) Hierarchical interrupt controllers (e.g. APLIC + IMSIC)
3) Registering handler for hardware interrupt of a
   particular interrupt controller out of multiple
   multiple interrupt controllers

The needs to be achieved without over-consuming memory.

These patches can also be found in irqchip_imp_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (8):
  lib: sbi_irqchip: Use chip as variable name for irqchip device
  lib: sbi_irqchip: Rename irq_handle() callback to process_hwirqs()
  lib: utils/irqchip: Fix context_map init in
    irqchip_plic_update_context_map()
  lib: utils/irqchip: Add IDC to hartindex map in struct aplic_data
  lib: sbi_irqchip: Support irqchip device targetting subset of harts
  lib: utils/irqchip: Add unique_id to plic, aplic, and imsic data
  lib: sbi_irqchip: Associate 32-bit unique ID for each irqchip device
  lib: sbi_irqchip: Allow registering interrupt handlers

 include/sbi/sbi_irqchip.h                |  74 ++++++-
 include/sbi_utils/irqchip/aplic.h        |   2 +
 include/sbi_utils/irqchip/imsic.h        |   1 +
 include/sbi_utils/irqchip/plic.h         |   1 +
 lib/sbi/sbi_irqchip.c                    | 267 +++++++++++++++++++++--
 lib/utils/fdt/fdt_helper.c               |   3 +
 lib/utils/irqchip/aplic.c                |  14 +-
 lib/utils/irqchip/fdt_irqchip_aplic.c    |  54 ++++-
 lib/utils/irqchip/fdt_irqchip_plic.c     |   5 +
 lib/utils/irqchip/imsic.c                |  19 +-
 lib/utils/irqchip/plic.c                 |   7 +-
 platform/generic/openhwgroup/ariane.c    |   1 +
 platform/generic/openhwgroup/openpiton.c |   1 +
 platform/kendryte/k210/platform.c        |   1 +
 platform/nuclei/ux600/platform.c         |   1 +
 platform/template/platform.c             |   1 +
 16 files changed, 424 insertions(+), 28 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
