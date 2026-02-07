Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05932EE0AC6
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrhZ9n8PxNtRFGn7HH4pj3LVOuRTpEd0b3DNLEZHzSc=; b=LaWMOw1xiGl5s0
	/JwtTHcRMsuF/31yJZRg3dDt1u6uIn9jBo3Tjczxk6awRrTgVJbOroj51DC13ic3X9tHXDetG7sHh
	ozQzUZWL1RWmS77o0f1Dq/rhMQDQlsXO3W03XvemG7SiqY5+ZLI+rvsjDdS4k/1xg1Rqr9FOsZ6Lc
	uQtJoDsOOlZEJUWAnas8z2VMvhVMJC0KRAtUn/msKNafhpM3NMrD2TCLtudcgZNwBBClqZpHmFdZ1
	E/MZwZhylVsHXp4O38ysAYD2LglceJBix+tPrBSRJy+UHmsD9d0CqXE5uL7lMrW3Rl6fgCUrz4mae
	uN1i+CyCL7Sgxk20+Jbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofWD-0000000CJUb-14iV;
	Sat, 07 Feb 2026 10:26:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW8-0000000CJQ2-3qCH
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:26:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174Ou8B1740797;
	Sat, 7 Feb 2026 10:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W+YoNnB4Txs
	VhGGBt2uBtE1JK6XI2srnGggoc3LXPWs=; b=Hh9X8ncfR/AwTCwB9eE9XqFgvKN
	7OC5AAB2KlanohNJijTl399zOde6oCRHvk3xi1lA31WN6tt7E14iOWCb7o+TwHUy
	thOvO6kqKw0sfKuwORSnJlpbWCPGPkRt0/LNh5FcnGkfo/iZdOwRek4aBV0D9iNb
	25cXlNkLX5uu8sEwIxemfz4oArSp88u+TlY++obVNnc0FPtXFxJJ09cnN/8aIoCU
	nFEZrQzoPLeoazbdK9vAQzFrKU8HFWbcSEqdwrFFsp7onpiMQisrpxu1tuTywgPD
	x2LezhBRG1DuG4SE26qTWEvQtyTPGeX3vGnA9cSOtFCjUGUELdbjUmSgFOw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xbf8gy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 617AQ3w3002713;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfkj4j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 617AQ3qY002687;
	Sat, 7 Feb 2026 10:26:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 617AQ3xm002679
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:03 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C63ED249C6; Sat,  7 Feb 2026 15:56:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 4/8] lib: utils/irqchip: Add IDC to hartindex map in struct aplic_data
Date: Sat,  7 Feb 2026 15:55:58 +0530
Message-ID: <20260207102602.2917520-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0-PXfmtA4iBJqsufABSEfjc_JvB437ML
X-Proofpoint-GUID: 0-PXfmtA4iBJqsufABSEfjc_JvB437ML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX+R4PKCTM539J
 VIqhK6hlJOxIyZHJxRr2TZG6qg//PAVQWrApyUxriLWIG1Z/d6hIhfiJiLmM47NLCuXL44VOL+3
 aKCsckCGY18iqePrPUkc555vZdgR3Rhj89DBCT6aC+5bHovn8LwfGAv6s7ZNqhqCymHES+0sd0A
 PEBwQ+4TnikUfWxH56KThG5Vh/rOXPAaBWLMMoEqIrZ3n4VHobzHmk0L/EKV3lFqHggXg7gzrTO
 QAbuUy0k4hBwAGoo8X3YgCrwaOGuYWuqHYfqk/lrUqkDsnnIuto1hhY0Mp1GeqQ2WAf8KtKXY3k
 OjL+LfAqE7aLNysfIc9rM1glu5dl8Epa9RCfLBt1eG/8SkevxjfzfKC5hTRPxwDioxahOtmFldr
 jSmZxDreguW8YbmiiGTEgXi1shRB7SQ6bgj6V891UJENYNW1OD3muwmp/2deo8Cs45UOKZrI1o2
 mh2f4T/OAHSmMZJSvYA==
X-Authority-Analysis: v=2.4 cv=aIb9aL9m c=1 sm=1 tr=0 ts=69871340 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=SFL2i2No19TeFF_6YJsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022621_073948_8B788CA6 
X-CRM114-Status: GOOD (  15.76  )
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

A platform can have multiple APLICs in direct-mode targetting
different subset of harts. Add APLIC ID to hartindex map in
struct aplic_data to capture the set of harts targed by a
given APLIC in direct-mode.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi_utils/irqchip/aplic.h     |  1 +
 lib/utils/irqchip/fdt_irqchip_aplic.c | 54 ++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index cbfcd3fd..ad613778 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -45,6 +45,7 @@ struct aplic_data {
 	bool has_msicfg_smode;
 	struct aplic_msicfg_data msicfg_smode;
 	struct aplic_delegate_data delegate[APLIC_MAX_DELEGATE];
+	u32 *idc_map;
 };
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic);
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index 81ebe67d..4d7b1e77 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -16,6 +16,43 @@
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/aplic.h>
 
+static int irqchip_aplic_update_idc_map(const void *fdt, int nodeoff,
+					struct aplic_data *pd)
+{
+	int i, err, count, cpu_offset, cpu_intc_offset;
+	u32 phandle, hartid, hartindex;
+	const fdt32_t *val;
+
+	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
+	if (!val || count < sizeof(fdt32_t))
+		return SBI_EINVAL;
+	count = count / sizeof(fdt32_t);
+
+	for (i = 0; i < count; i += 2) {
+		phandle = fdt32_to_cpu(val[i]);
+
+		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
+		if (cpu_intc_offset < 0)
+			continue;
+
+		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
+		if (cpu_offset < 0)
+			continue;
+
+		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (err)
+			continue;
+
+		hartindex = sbi_hartid_to_hartindex(hartid);
+		if (hartindex == -1U)
+			continue;
+
+		pd->idc_map[i / 2] = hartindex;
+	}
+
+	return 0;
+}
+
 static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
 				   const struct fdt_match *match)
 {
@@ -30,12 +67,27 @@ static int irqchip_aplic_cold_init(const void *fdt, int nodeoff,
 	if (rc)
 		goto fail_free_data;
 
+	if (pd->num_idc) {
+		pd->idc_map = sbi_zalloc(sizeof(*pd->idc_map) * pd->num_idc);
+		if (!pd->idc_map) {
+			rc = SBI_ENOMEM;
+			goto fail_free_data;
+		}
+
+		rc = irqchip_aplic_update_idc_map(fdt, nodeoff, pd);
+		if (rc)
+			goto fail_free_idc_map;
+	}
+
 	rc = aplic_cold_irqchip_init(pd);
 	if (rc)
-		goto fail_free_data;
+		goto fail_free_idc_map;
 
 	return 0;
 
+fail_free_idc_map:
+	if (pd->num_idc)
+		sbi_free(pd->idc_map);
 fail_free_data:
 	sbi_free(pd);
 	return rc;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
