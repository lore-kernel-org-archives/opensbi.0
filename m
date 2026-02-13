Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB66EEF48D4
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 05:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t08tsF3o550xXMyt/WTDoESf8/f15R6Au6mfwmqr7rM=; b=eElROThwYXGHSP
	xyzJARV7p0qwHHzJpuvFsVbTG1l3YvIw1cWOl0yxVipPDrxjX//oES9/41URAfgNqKxi+HO6GwMfT
	mJ67/rIaI0qCvBVrW6/7pU+/Qs/zlP9uCFv74lJd0HLo828L/uQ4QdZt73DploE+zEm/enq8BaF1d
	V0XG14karl0mzzjIqlf8sRfJ6SmcPPhIPg8td1Vl95w92MBMKkj+9x5xgisZyG4bZ0n2EhPtOASlm
	p7Ctmhb+gHLa7vI+OjlVvLxdRc2hcxtuhx2Rfci7+Ar70Q3jfxhrH2/ImF8lBHDB09HJIqnEIVO0R
	2agMEVqLh1n0uj6aUNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7n-0000000321s-2rwY;
	Fri, 13 Feb 2026 05:53:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7k-0000000321D-49Gc
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 05:53:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0BeMm2733243;
	Fri, 13 Feb 2026 05:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KBdJ9ox/LAE
	Prt5pHx0w/V+Xn+ySoIgWkKoCGIaagbQ=; b=nfxoUhc9ioC1t64jRWDiLS3qjEh
	LoBzoX0KsUsSLo5s+ObEnm1GxPNCllrwgl+vT523py+h/XYVzVLzq5K44h2kJg6h
	gYTYg3f39MuplOoVgO+/XtuRaJ42uAm3Ce6qt7MUIDxecvAaNfcfKCNdmte5IWDE
	hIPZSY2nM3GfopMn0x9noq291ZXyFTeWAxxyikw/Y99hSYKuN+wTeJGNwxuWYJGv
	5xTXqLGsQor4pAQYQJShpeCNOmnOYlRBtB+Z7SaqWI8brtg/N4Hf9p3bzWgApFzH
	2qoFuJAnIsGKVF+8Z3zPqSdolCLHCET7OvFFjw8Y+PsGetq0AJ2iM1WEIXA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wrxve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61D5rhaf006115;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfn97kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61D5rhwq006088;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61D5rhvf006083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D12F0249BE; Fri, 13 Feb 2026 11:23:42 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 4/8] lib: utils/irqchip: Add IDC to hartindex map in struct aplic_data
Date: Fri, 13 Feb 2026 11:23:38 +0530
Message-ID: <20260213055342.3124872-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
References: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bDs_XiGmxSTJKkfmBSNAhG3S3-t-HOxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MiBTYWx0ZWRfX4SBWxpEOOBmS
 zjU62Hy6IkGZ1FsXArUjGDyg3uXEnlk/R9V6jYARK2Sg8qmRBSwLWnejWkWPOAKN+U/R0OPScen
 sRG5NFJdSVRzaiDuQkzkkKMG2EYmHw4/ctbpRkj6JTBPOVGnAcduAQwlavsq+EKYteVKJpXvrr+
 AAxEiw5vF7DZaCq1zGJV/VhnxnVafXLmVNW03ZPF+0U0I0Kb0W8Uz3a7w0n46DSOwBU848lD95t
 /83zPE8vIzJsDkQ6/S8U10XVhnWbjpPMOdFTiSnY/G6PQuu9polt035/73006isj0YtL/2S+bP1
 VvIMePovC9zTFN9z83Mp/1bxyAVKIFRg5T/xGtzthopUsLnynAYI8iIY9/+rh7ttsShEgZ9UHkO
 BbkXm53/+0O9+27sjBIIijrEGtxlc0dmaCMlwwdvQLyFlFDi7v1WBEjV1qwd6Zkl0tlIlB1sz14
 anKBeH0EHdePChIbqlw==
X-Proofpoint-GUID: bDs_XiGmxSTJKkfmBSNAhG3S3-t-HOxD
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ebc6b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=SFL2i2No19TeFF_6YJsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_215353_056635_B95094D6 
X-CRM114-Status: GOOD (  16.86  )
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
struct aplic_data to capture the set of harts targeted by a
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
