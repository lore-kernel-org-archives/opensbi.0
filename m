Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC609EE0AC3
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UL3glsHKSU3IfxKEilEQ7YkZVhbpWS7AuOA0qMNc8SM=; b=o3A1XIaegJ5xsk
	L6X0mkbFnGeQOcRgNCVL7l9XgqgqNGVq2pmGK2vhvTe3Cx3wGZ+hXZAe3y/V5mD8YHo5t+iItU2US
	g4JUtO2imBtrD/1yM0apxpsyIPw1P1TRaCrXcx1RK3aRXYRq3m92fipxbLcksf6dkkCruEHGrT55B
	pqQZecr0PMGBZmHN7uUKLRTDLLHFAtBe3T1DGTeY12x939rfYA9rv1o8d81tUj7JgXTX5S8rN/UYB
	PTJw0A7FzTE9fNNZBj6tnfXfsTaj/dhnLcdKYJU0ewcJB5ply8ccPnWt7JpxJL7Yq+cFnnQ8k9sQ7
	nmd1oUHwLULhNpHoepXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofX1-0000000CK8k-333i;
	Sat, 07 Feb 2026 10:27:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofWx-0000000CK5a-0F58
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:27:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174Tlik371335;
	Sat, 7 Feb 2026 10:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MsYK3GtBpny
	4Nsaz3nGOf13MM8HysfNjDb1CzBHYdSI=; b=bYCI37cv0xNepil5Ctoj3w23Zlw
	2e1m/n5CCkYavTnp1ozNc6KmRhBCRX+jc0nsveGaaFfbybZ12P6wyKy0vLzf7ffU
	lrV9sySGA90R8ITDTpYwkX1nbt7A8fxW9ab9OvbKIEWRnP3tv50TWHwhn+aEYpcL
	XyJX3MxztKsHonhLsYdFRwiqjty7oYGNo3wiPRcg6IsW6jIGZ4SZmSrI5lqZbZHV
	hEt/1ev0O7pjTClLT5yxb24/F0UHxNTIMgdICw41pH10v/uw5nK15pGo4UHMBYBU
	pHqUAXA90SGukhr3G8CpqHHzs/cvVXeum4cIBj1ltCh+b7iw3itajvm8Qdg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd0g40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 617AQ3kr002716;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfkj4jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 617AQ3WS002689;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 617AQ32U002682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C2EAC249BD; Sat,  7 Feb 2026 15:56:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 3/8] lib: utils/irqchip: Fix context_map init in irqchip_plic_update_context_map()
Date: Sat,  7 Feb 2026 15:55:57 +0530
Message-ID: <20260207102602.2917520-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3PB5n4BMToHOMYrxr5HQ4g0Exkw4r3Mq
X-Proofpoint-ORIG-GUID: 3PB5n4BMToHOMYrxr5HQ4g0Exkw4r3Mq
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=6987133f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=KwGMMZOPHlQ5tBqmZvAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX5ckUuEQJa+AK
 uyw6nk7QhPvccsecGA6yoVJKj43OrWdK7dJ8BiLrogLe3zybB0SnkmVc6sDNEHxw8APtPZptUhs
 EMXvHkWpihSrDpNQ60LUOpTvtlcQgKj02SOVP5/3r+iCf5wtSy66K5Eif3nK+dlqLmlHkTEUz3I
 hjQ9c4pmPyGtFPcP9TjOG4GGqLjPOEuDQAScTyGbthhx9Q203a+Kk/aJFLkrmX/7wBZ+z8HRPNG
 ZCjcOYa7yjrjhW+du827xnGhhqQy65gf9a2ZG2dCLQAFJdoUEgZm6xHsCvYSfB28JxsiWqTYPcq
 FkGDbWCyXWvttBLg+p9SKjPcHlHGAVIyYPhjhR7eZr9pXgq7Ord8d3DFMJnRv0sn7jfwoIEZt5p
 ty9AESJZGvKUQfKrxhifuoVBUCUEDcG6ROwPtrRvSlOYhXc9dh2f6hVcMZKTXqSmgeR1nNxeVN6
 qO2e0Jvz5f15OOGMtmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602070082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022711_216721_6688158C 
X-CRM114-Status: GOOD (  10.54  )
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

The context_map[][] elements should be initialized with negative
value so that context_map does not point to anything for non-existent
PLIC contexts.

Fixes: 69448a079065 ("lib: utils/irqchip: plic: Provide a hartindex to context map")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/utils/irqchip/fdt_irqchip_plic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 65a9de15..61c68ac9 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -24,6 +24,11 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
 	u32 phandle, hwirq, hartid, hartindex;
 	int i, err, count, cpu_offset, cpu_intc_offset;
 
+	for (i = 0; i < sbi_hart_count(); i++) {
+		pd->context_map[i][PLIC_M_CONTEXT] = -1;
+		pd->context_map[i][PLIC_S_CONTEXT] = -1;
+	}
+
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
 	if (!val || count < sizeof(fdt32_t))
 		return SBI_EINVAL;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
