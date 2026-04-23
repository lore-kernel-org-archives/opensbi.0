Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7CFFAD410
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrIjERNyUpf90tDO7h09T9TJR1UIBZzhUmTkFMcHNJo=; b=DyiiiKQeo0VA96
	Ewk5pW2RdH52NVtxybyj0/nHR9ZRMdozsL1Zy6GuNjfKMFc7xOg9PS5Ua5V9kGJpkuHqtbzg81H/C
	bWYcuc1WrHHnqN7EmK0d6XbkpOtkY08e8Ne4Y907lLxCQidtQbt3HJOX73owo9H/iV1bUYpZLbbuR
	cZkUdPeOR/hw5DH0tFQD7idGfg2Q1EXgPdiMydtw7mKmwXr0fcOWe1RGOCk0JpW3OIqA7D/YhnPV3
	1GRVL4U0aMePJ7Wz4v10AqP4F+aBqGCTgS/m6murONrA1DUvsA7CszpdkqD9+yTFVY4vhM2/KS6TW
	OkNH+ck9dxuZuewkb4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXk-0000000B3mZ-0cw8;
	Thu, 23 Apr 2026 05:24:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXh-0000000B3lR-3KYY
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:24:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3Yacv3173021;
	Thu, 23 Apr 2026 05:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PJenAc+eY6C
	5c7HGE2yCoN9GUNdnZ7lYojmVzwKhVUc=; b=MytU0r2JMO4PW+QPmpPxN0PT+6N
	4QlLXMamCKQjGhFmoKRxDv/83rtK7+4V3BaY+lLEs9cKdYgIZsMDp414UFUnurmg
	+YEEnxtlypTrPqim0EZuQ2YZ/+YAbVagAsUJSS5549JBRZmDcxEN0paEIkl9ij6J
	J0okIY7T5qYsooM+dsFbISzQZhBoDlaualAoinydlQOPaf9tsVpYKAdMJJCshhhO
	qqBRpXHK1EWgcTbJeGFYgMupDDLq6zMU6QtVtRSP7mMqqHMQR8NQMWh/pmr276AZ
	w6SwOS5ijj71LAnpr+hZpyztq44lqkrO2oLUn9nx8Lg2tijsVkYf/8Qd6Hg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m3283k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N5Ngt6007157;
	Thu, 23 Apr 2026 05:23:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31jyv28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:43 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N5NgZc007163;
	Thu, 23 Apr 2026 05:23:42 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N5Ngbb007162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:42 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0945722A5B; Thu, 23 Apr 2026 10:53:41 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 5/6] lib: sbi_irqchip: Allow setting hardware interrupt affinity
Date: Thu, 23 Apr 2026 10:53:38 +0530
Message-ID: <20260423052339.356900-6-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
References: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: YrIIXbpHos8L2Sv8bGLVly8pzNSZmBsh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NyBTYWx0ZWRfX/4j8y0+G/fik
 whpVd00bz7POQOCqwu9F95hWa4F4GwwYWAWpkjjyjm7KGyc+tZy8gJwV8E1fOncxl03WAvpfCp1
 2sDWZBPlzWWmckPfviM5RZz1lZ7rYf9STbZDhMZxkIa6jK7u7wtMy2anQkdCRBXGrV4U/m129EE
 O9BNt+xVR7/zMODZW/z9svKOk3joPho2bOZqG/+rbTty31z+UUmEqzp1OqPEU+qrKNbexKPjLGK
 i6XMUU5vQ+qsMRb3kIdfvxNyoNbg6r01e509QHmfd4k3oDPfgtPrA66pnRkwVsSGWphhPieBijq
 6ZNfrKB1aRpSv6Bj4iLiOQME6K2wSzIwxMjN3sNEgF7DHFrYZ62SGLSjHjDrzGg/yazrCTbkjDj
 p4c93MhLKFk1Lw4Dn51sF0UFx+Q3A+sAnYKTYuyyMsw9o0qB2O/AykZ+0RVWoPC+LTeOOuNREDC
 EHSKO47DlW5PO7WwkMw==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e9ace2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8
 a=DUg25WrKxpq9Pd_k14kA:9 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: YrIIXbpHos8L2Sv8bGLVly8pzNSZmBsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222401_837405_D4FD9B77 
X-CRM114-Status: GOOD (  19.86  )
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

The irqchip drivers can provide mechanism to set interrupt affinity
so add hwirq_set_affinity() callback for irqchip drivers and use it
to implement sbi_irqchip_set_affinity() which can be used by other
drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  11 ++++
 lib/sbi/sbi_irqchip.c     | 123 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 880ff49f..03a01038 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -60,6 +60,10 @@ struct sbi_irqchip_device {
 	/** End of hardware interrupt of this irqchip */
 	void (*hwirq_eoi)(struct sbi_irqchip_device *chip, u32 hwirq);
 
+	/** Set hardware interrupt affinity */
+	int (*hwirq_set_affinity)(struct sbi_irqchip_device *chip, u32 hwirq,
+				  u32 hart_index);
+
 	/** Mask a hardware interrupt of this irqchip */
 	void (*hwirq_mask)(struct sbi_irqchip_device *chip, u32 hwirq);
 
@@ -98,6 +102,13 @@ int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq);
 int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
 				int (*raw_hndl)(struct sbi_irqchip_device *, u32));
 
+/** Get hardware interrupt affinity */
+int sbi_irqchip_get_affinity(struct sbi_irqchip_device *chip, u32 hwirq,
+			     u32 *out_hart_index);
+
+/** Set hardware interrupt affinity */
+int sbi_irqchip_set_affinity(struct sbi_irqchip_device *chip, u32 hwirq, u32 hart_index);
+
 /** Register a hardware interrupt handler */
 int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 15ea2211..386dfd87 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -7,7 +7,9 @@
  *   Anup Patel <apatel@ventanamicro.com>
  */
 
+#include <sbi/sbi_console.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_hsm.h>
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_list.h>
 #include <sbi/sbi_platform.h>
@@ -17,6 +19,9 @@
 struct sbi_irqchip_hwirq_data {
 	/** raw hardware interrupt handler */
 	int (*raw_handler)(struct sbi_irqchip_device *chip, u32 hwirq);
+
+	/** target hart index */
+	u32 hart_index;
 };
 
 /** Internal irqchip interrupt handler */
@@ -136,6 +141,78 @@ int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
 	return 0;
 }
 
+int sbi_irqchip_get_affinity(struct sbi_irqchip_device *chip, u32 hwirq,
+			     u32 *out_hart_index)
+{
+	if (!chip || chip->num_hwirq <= hwirq)
+		return SBI_EINVAL;
+
+	/*
+	 * If no handler registered for hwirq then hwirq
+	 * is not being used so return failure
+	 */
+	if (!sbi_irqchip_find_handler(chip, hwirq))
+		return SBI_ENOTSUPP;
+
+	*out_hart_index = chip->hwirqs[hwirq].hart_index;
+	return 0;
+}
+
+int sbi_irqchip_set_affinity(struct sbi_irqchip_device *chip, u32 hwirq,
+			     u32 hart_index)
+{
+	struct sbi_irqchip_hwirq_data *data;
+	int rc;
+
+	if (!chip || chip->num_hwirq <= hwirq || sbi_hart_count() <= hart_index)
+		return SBI_EINVAL;
+
+	/*
+	 * If no handler registered for hwirq then hwirq
+	 * is not being used so return failure
+	 */
+	if (!sbi_irqchip_find_handler(chip, hwirq))
+		return SBI_ENOTSUPP;
+
+	data = &chip->hwirqs[hwirq];
+	if (data->hart_index != hart_index) {
+		if (chip->hwirq_set_affinity) {
+			rc = chip->hwirq_set_affinity(chip, hwirq, hart_index);
+			if (rc)
+				return rc;
+		}
+		data->hart_index = hart_index;
+	}
+
+	return 0;
+}
+
+static int __sbi_irqchip_handler_set_affinity(struct sbi_irqchip_device *chip,
+					      struct sbi_irqchip_handler *h,
+					      u32 compare_hart_index,
+					      u32 hart_index)
+{
+	u32 i, current_hart_index;
+	int rc;
+
+	for (i = 0; i < h->num_hwirq; i++) {
+		rc = sbi_irqchip_get_affinity(chip, h->first_hwirq + i,
+					      &current_hart_index);
+		if (rc)
+			return rc;
+
+		if (compare_hart_index != -1U &&
+		    current_hart_index != compare_hart_index)
+			continue;
+
+		rc = sbi_irqchip_set_affinity(chip, h->first_hwirq + i, hart_index);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
 static int __sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 					  u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
 					  int (*callback)(u32 hwirq, void *priv), void *priv)
@@ -185,6 +262,17 @@ static int __sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 		}
 	}
 
+	rc = __sbi_irqchip_handler_set_affinity(chip, h, -1U, current_hartindex());
+	if (rc) {
+		if (chip->hwirq_cleanup) {
+			for (i = 0; i < h->num_hwirq; i++)
+				chip->hwirq_cleanup(chip, h->first_hwirq + i);
+		}
+		sbi_list_del(&h->node);
+		sbi_free(h);
+		return rc;
+	}
+
 	if (chip->hwirq_unmask) {
 		for (i = 0; i < h->num_hwirq; i++)
 			chip->hwirq_unmask(chip, h->first_hwirq + i);
@@ -294,8 +382,10 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 	chip->hwirqs = sbi_zalloc(sizeof(*chip->hwirqs) * chip->num_hwirq);
 	if (!chip->hwirqs)
 		return SBI_ENOMEM;
-	for (i = 0; i < chip->num_hwirq; i++)
+	for (i = 0; i < chip->num_hwirq; i++) {
 		sbi_irqchip_set_raw_handler(chip, i, sbi_irqchip_raw_handler_default);
+		chip->hwirqs[i].hart_index = -1U;
+	}
 
 	SBI_INIT_LIST_HEAD(&chip->handler_list);
 
@@ -340,6 +430,37 @@ int sbi_irqchip_init(struct sbi_scratch *scratch, bool cold_boot)
 void sbi_irqchip_exit(struct sbi_scratch *scratch)
 {
 	struct sbi_irqchip_hart_data *hd;
+	struct sbi_irqchip_device *chip;
+	struct sbi_irqchip_handler *h;
+	u32 migrate_hidx = -1U;
+	bool migrate = false;
+	int rc;
+
+	sbi_for_each_hartindex(i) {
+		if (i == current_hartindex())
+			continue;
+		if (__sbi_hsm_hart_get_state(i) == SBI_HSM_STATE_STOPPED ||
+		    __sbi_hsm_hart_get_state(i) == SBI_HSM_STATE_STOP_PENDING)
+			continue;
+		migrate_hidx = i;
+		migrate = true;
+		break;
+	}
+
+	if (!migrate)
+		goto skip_migrate;
+	sbi_list_for_each_entry(chip, &irqchip_list, node) {
+		sbi_list_for_each_entry(h, &chip->handler_list, node) {
+			rc = __sbi_irqchip_handler_set_affinity(chip, h,
+								current_hartindex(),
+								migrate_hidx);
+			if (rc) {
+				sbi_printf("%s: chip 0x%x handler 0x%x set affinity (err %d)\n",
+					   __func__, chip->id, h->first_hwirq, rc);
+			}
+		}
+	}
+skip_migrate:
 
 	hd = sbi_scratch_thishart_offset_ptr(irqchip_hart_data_off);
 	if (hd && hd->chip && hd->chip->process_hwirqs)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
