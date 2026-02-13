Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E8FEF48D1
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 05:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIYcRpitp3YPU58dc1azHONOT8lL7ZtunrFp0MQvo3M=; b=36qzauB/z8STvE
	NXOxnPtOs3aF3kPDUlobl9GITWGp3yituoW4HR3eiY/Kcl56IyP3Q40z8btVP9TnTzkqlFkqE1ng0
	GKRrsI5MCzkhLvZ1v/U/z5MPOeB+v6bjO6DwzbzBMGd9K1ffRop+VaaNxrKCwc5LOBzqKNEPWvT+y
	ck5RFH12rXlwOmXx0zNfZHWwshaXpxSCorawDLqFvfMO1M2sO3h+90fwpeRxLYHeqKzm2SRvVc+Hf
	/EEJUJ2dgw7f+avSw1oJtb+wBOzIQ45sUjhExGv8VXn99M4dXO78WMII1Fqr94CM1PMecmGh9vbFG
	ywTNtuOjsQ+NghErYhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7r-0000000323h-4B05;
	Fri, 13 Feb 2026 05:53:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7p-0000000322P-2GZQ
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 05:53:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLbHv9652626;
	Fri, 13 Feb 2026 05:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DGHWrM/Pb1E
	n69sGamDPdJ+SqGJWXl24DAtQXigWPtM=; b=mLNWL1wB5VdhV54lyi9HNQwVYhD
	Z7ud+zGZNyRbRdOpp1ak2FHoI3S80bibgC0aI7EnsXZ+9GXSEjvNqd3xR8iWMBzv
	0YHqoYufecUX7BgcF4ljv1i7CXf/C5Bl1XZaQPW+FaDg8FTrWFojnidQ/m8/ErLz
	TrVhX4RJzNpB7fqDKuv5xb93a7LEP99W0ddRjAS9KBExqDh89rD5nv2FsGfhyHFT
	GSnGF08Ze1UMS4kJ5u+edkwzuJPkvzNF+YGZcnu0lO3EgzpXErlJqHo3NukQwg77
	tyWrrvMB4kjTsQHKEcZfWmvHVwFGmFjaf4Op5yeBHjZAdCov3XU+tGx6jxQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9gbbk2d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61D5ri0U006166;
	Fri, 13 Feb 2026 05:53:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfn97m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:44 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61D5rh8H006086;
	Fri, 13 Feb 2026 05:53:44 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61D5riZG006143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:44 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D7FFE24A0C; Fri, 13 Feb 2026 11:23:42 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 6/8] lib: utils/irqchip: Add unique_id to plic, aplic, and imsic data
Date: Fri, 13 Feb 2026 11:23:40 +0530
Message-ID: <20260213055342.3124872-7-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
References: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MiBTYWx0ZWRfX/oTYrReqa9EM
 U61om063z7cicDCO91mYp2TCj/oq/N25KxIRgaSwan8hWPn0Y9fmwxtIgSoMzVagJ8id16yM9tE
 NuzxzTUxnF36X03nn9iDB0y/BSsv4u4aNnFXfFOW6PUcFAVRZikaIWmNh5RjdF0rSqG0LM/3oBW
 YUxUd9OnzoLwWT9SktfN39PMIY6QXkCFL0F0k83HBR1gnSeBejrqteOL7ZZdyYNGt9tS5bdFP2C
 E5qU/eQBCYKWXIcYg+6HUhWdKSawCb6KZ8b0YD8sehbeLRUInzNoeHOHidLbX1vd+DdFHw+PiS5
 UyUY880xYK1XtiZPkGkZs2wlbfg7WlaVE0+uz0NDuAaouksQgXCmjVMVTz5ImT9KrHKhTIVFm2n
 QQj2bLvT+PjWRCc9wOEba5lQdGT0gPpdOHIInL5tjr7Thy46NdhSg9cC4VXJ7dYiMDQdM4X7S+Y
 NuQmBqb78bgauggB1UQ==
X-Authority-Analysis: v=2.4 cv=a849NESF c=1 sm=1 tr=0 ts=698ebc6c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=R73Jt7Jvv32YFOX0abEA:9
X-Proofpoint-GUID: CcEYHQ9OZkslLgvzIv8DxbsV41lIqtIO
X-Proofpoint-ORIG-GUID: CcEYHQ9OZkslLgvzIv8DxbsV41lIqtIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_215357_573680_7D7E77E3 
X-CRM114-Status: GOOD (  15.25  )
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

Add a 32-bit unique ID to plic, aplic, and imsic data which can be
used to differentiate multiple irqchip devices.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi_utils/irqchip/aplic.h        | 1 +
 include/sbi_utils/irqchip/imsic.h        | 1 +
 include/sbi_utils/irqchip/plic.h         | 1 +
 lib/utils/fdt/fdt_helper.c               | 3 +++
 platform/generic/openhwgroup/ariane.c    | 1 +
 platform/generic/openhwgroup/openpiton.c | 1 +
 platform/kendryte/k210/platform.c        | 1 +
 platform/nuclei/ux600/platform.c         | 1 +
 platform/template/platform.c             | 1 +
 9 files changed, 11 insertions(+)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index ad613778..3461d1c7 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -35,6 +35,7 @@ struct aplic_data {
 	struct sbi_irqchip_device irqchip;
 	struct sbi_dlist node;
 	/* Public members */
+	u32 unique_id;
 	unsigned long addr;
 	unsigned long size;
 	unsigned long num_idc;
diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index 353cefec..88dd3cfb 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -24,6 +24,7 @@ struct imsic_regs {
 };
 
 struct imsic_data {
+	u32 unique_id;
 	bool targets_mmode;
 	u32 guest_index_bits;
 	u32 hart_index_bits;
diff --git a/include/sbi_utils/irqchip/plic.h b/include/sbi_utils/irqchip/plic.h
index 18aa7469..0dbf4ed3 100644
--- a/include/sbi_utils/irqchip/plic.h
+++ b/include/sbi_utils/irqchip/plic.h
@@ -17,6 +17,7 @@ struct plic_data {
 	/* Private members */
 	struct sbi_irqchip_device irqchip;
 	/* Public members */
+	u32 unique_id;
 	unsigned long addr;
 	unsigned long size;
 	unsigned long num_src;
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 799fd48d..4cd71b8f 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -673,6 +673,7 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
 	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
+	aplic->unique_id = nodeoff;
 	aplic->addr = reg_addr;
 	aplic->size = reg_size;
 
@@ -805,6 +806,7 @@ int fdt_parse_imsic_node(const void *fdt, int nodeoff, struct imsic_data *imsic)
 	if (nodeoff < 0 || !imsic || !fdt)
 		return SBI_ENODEV;
 
+	imsic->unique_id = nodeoff;
 	imsic->targets_mmode = false;
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &len);
 	if (val && len > sizeof(fdt32_t)) {
@@ -887,6 +889,7 @@ int fdt_parse_plic_node(const void *fdt, int nodeoffset, struct plic_data *plic)
 				    &reg_addr, &reg_size);
 	if (rc < 0 || !reg_addr || !reg_size)
 		return SBI_ENODEV;
+	plic->unique_id = nodeoffset;
 	plic->addr = reg_addr;
 	plic->size = reg_size;
 
diff --git a/platform/generic/openhwgroup/ariane.c b/platform/generic/openhwgroup/ariane.c
index 70a97f38..ce2f5512 100644
--- a/platform/generic/openhwgroup/ariane.c
+++ b/platform/generic/openhwgroup/ariane.c
@@ -24,6 +24,7 @@
 						 CLINT_MTIMER_OFFSET)
 
 static struct plic_data plic = {
+	.unique_id = 0,
 	.addr = ARIANE_PLIC_ADDR,
 	.size = ARIANE_PLIC_SIZE,
 	.num_src = ARIANE_PLIC_NUM_SOURCES,
diff --git a/platform/generic/openhwgroup/openpiton.c b/platform/generic/openhwgroup/openpiton.c
index 60d719e1..1d098da7 100644
--- a/platform/generic/openhwgroup/openpiton.c
+++ b/platform/generic/openhwgroup/openpiton.c
@@ -23,6 +23,7 @@
 		(OPENPITON_DEFAULT_CLINT_ADDR + CLINT_MTIMER_OFFSET)
 
 static struct plic_data plic = {
+	.unique_id = 0,
 	.addr = (unsigned long)OPENPITON_DEFAULT_PLIC_ADDR,
 	.size = OPENPITON_DEFAULT_PLIC_SIZE,
 	.num_src = OPENPITON_DEFAULT_PLIC_NUM_SOURCES,
diff --git a/platform/kendryte/k210/platform.c b/platform/kendryte/k210/platform.c
index 65f5d497..0b76104c 100644
--- a/platform/kendryte/k210/platform.c
+++ b/platform/kendryte/k210/platform.c
@@ -30,6 +30,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 }
 
 static struct plic_data plic = {
+	.unique_id = 0,
 	.addr = K210_PLIC_BASE_ADDR,
 	.size = K210_PLIC_BASE_SIZE,
 	.num_src = K210_PLIC_NUM_SOURCES,
diff --git a/platform/nuclei/ux600/platform.c b/platform/nuclei/ux600/platform.c
index 14fbaeb6..07b27977 100644
--- a/platform/nuclei/ux600/platform.c
+++ b/platform/nuclei/ux600/platform.c
@@ -63,6 +63,7 @@
 static u32 ux600_clk_freq = 8000000;
 
 static struct plic_data plic = {
+	.unique_id = 0,
 	.addr = UX600_PLIC_ADDR,
 	.size = UX600_PLIC_SIZE,
 	.num_src = UX600_PLIC_NUM_SOURCES,
diff --git a/platform/template/platform.c b/platform/template/platform.c
index 38be1b5c..1f2a1dce 100644
--- a/platform/template/platform.c
+++ b/platform/template/platform.c
@@ -34,6 +34,7 @@
 #define PLATFORM_UART_BAUDRATE		115200
 
 static struct plic_data plic = {
+	.unique_id = 0,
 	.addr = PLATFORM_PLIC_ADDR,
 	.size = PLATFORM_PLIC_SIZE,
 	.num_src = PLATFORM_PLIC_NUM_SOURCES,
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
