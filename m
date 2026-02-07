Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8A2EE0AC6
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5V5q/e37TNyfYWTusDWUyszbv0MiWfsuwpEGuIUs60=; b=QuDEzzPLBGo6N7
	PGGx9PVv7QDF9lob5NWhAxZ1nDYDbyu9h7D+r9cgW1CMN8ucKpQ84A5c4Mx4h9ujmov6VmX7z2D5v
	/OWEeasvLYnRBrUO164OLUYhkYVcBSNDHJUmMajwmUPtyhAs3ZpjFXpnj0Zvtu2h7Eurf8wCn0KIk
	3WoFSzyVAZbeLt+ynDs1ELFEEIZq6+cqrXYI3EhClxC7e0o4v/gODgl1KRCITpGnI9dzQwc7vDnxo
	yuOf6JeqGKCaTcxkGoM6ut1r4gEf+ToauCr9HPRM+J0cB2T/7C3cmLA1Qu9edlpNDtE+hKcnUG4KV
	+opULR5aj0oq0swF0S4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW3-0000000CJNW-2zub;
	Sat, 07 Feb 2026 10:26:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW0-0000000CJMu-2dHH
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:26:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174Mxdi1117283;
	Sat, 7 Feb 2026 10:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ey/Zgjb9n/h
	oqh+iTeH4X4ePiqKaWekrrnXZGt5++qw=; b=LGA6MJGEFz5TmwGDRryoL0tesIb
	yr76BkokZA+Dekx+iuwIm3i7sT0Rf29wbqygYAEhH+XuW61WKBdUlBBAd4yBmqhP
	7Yq93h3fFdu6fvv5hGFJs8SLmTBKfEhz958LuqQMlFXh1VDCXhPmtz+WpJtX/B0I
	rGLfyZd+e/63xBngGBJGSTScxRmQV00y+qAI2+LrzY6z6rrhir/9Gnefmu3OlDoa
	lxAprvONxC22Sbo+FUcJJF66p30l+tYMBjkU3jhx1UGULEXimy00waA5XZd9UVEP
	iMcayt4OJcPPMyloLc+wtb58DkTRobqhrb0tsXC5s6CC/VYwVU0Iqyj8xig==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xamrgxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 617AQ47G002791;
	Sat, 7 Feb 2026 10:26:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfkj4k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 617AQ3Ze002690;
	Sat, 7 Feb 2026 10:26:04 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 617AQ3f1002748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:04 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D357824A1C; Sat,  7 Feb 2026 15:56:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 8/8] lib: sbi_irqchip: Allow registering interrupt handlers
Date: Sat,  7 Feb 2026 15:56:02 +0530
Message-ID: <20260207102602.2917520-9-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: geodN9JJmOrinfDGNxQnKBmT7iF-ihCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfXwGgO0ztJ6d6m
 pIdePYwzn2VavlW/che/XwbbDzPRvaczj2srR0TZ9uo17Pe7vxFlnmtISXEsApQEE6E7w0imqSb
 43j0s/KAWcQoinLHRHKc4bvX1E0VuXDeMABYw+isGcHAOW8S+qk4H+kjmTOl8QdwGOa8T6aqBqf
 f5N7LTAQdHiOgvzhGETPbBWT3zyyWcmqezni3SYcmZ6YXJpuohizRUCx95/iqH31sBW0Rz1jQ/P
 qsOGI/BJSmFL3Io7WF5LzsyAA3klz6STxoQQl29injBH+S5ax7yDJ+ngnOzUQlU9QLIxINRGPUJ
 ffqcMkbDFS3O23Xt/jcGSI11wabaUm4zXCuVUsCR7AthdwNIvRQ04Tk25qb0DXrlzHEunvbx/ey
 WsN5l0aYHNRVaW6+Ua/CjIvlfgp13zaMjqUatNVOHDy5MOAt5rbqFJpj+peL7/STSRk3qY7wGEb
 3zAZDe/+thPAC7Bhliw==
X-Proofpoint-ORIG-GUID: geodN9JJmOrinfDGNxQnKBmT7iF-ihCH
X-Authority-Analysis: v=2.4 cv=Or1CCi/t c=1 sm=1 tr=0 ts=69871340 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8
 a=dxl-2DmbjyPBmnOifdcA:9 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022612_813185_D676DAA3 
X-CRM114-Status: GOOD (  21.97  )
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

To handle external interrupts in M-mode, the sbi_irqchip framework
must allow registering interrupt handlers from device drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  56 ++++++++++-
 lib/sbi/sbi_irqchip.c     | 202 +++++++++++++++++++++++++++++++++++++-
 lib/utils/irqchip/aplic.c |   1 +
 lib/utils/irqchip/imsic.c |   9 ++
 lib/utils/irqchip/plic.c  |   1 +
 5 files changed, 267 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index d2c47ae8..77b54110 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -18,12 +18,21 @@ struct sbi_scratch;
 
 /** irqchip hardware device */
 struct sbi_irqchip_device {
-	/** Node in the list of irqchip devices */
+	/** Node in the list of irqchip devices (private) */
 	struct sbi_dlist node;
 
+	/** Internal data of all hardware interrupts of this irqchip (private) */
+	struct sbi_irqchip_hwirq_data *hwirqs;
+
+	/** List of interrupt handlers */
+	struct sbi_dlist handler_list;
+
 	/** Unique ID of this irqchip */
 	u32 id;
 
+	/** Number of hardware IRQs of this irqchip */
+	u32 num_hwirq;
+
 	/** Set of harts targetted by this irqchip */
 	struct sbi_hartmask target_harts;
 
@@ -32,6 +41,21 @@ struct sbi_irqchip_device {
 
 	/** Process hardware interrupts from this irqchip */
 	int (*process_hwirqs)(struct sbi_irqchip_device *chip);
+
+	/** Setup a hardware interrupt of this irqchip */
+	int (*hwirq_setup)(struct sbi_irqchip_device *chip, u32 hwirq);
+
+	/** Cleanup a hardware interrupt of this irqchip */
+	void (*hwirq_cleanup)(struct sbi_irqchip_device *chip, u32 hwirq);
+
+	/** End of hardware interrupt of this irqchip */
+	void (*hwirq_eoi)(struct sbi_irqchip_device *chip, u32 hwirq);
+
+	/** Mask a hardware interrupt of this irqchip */
+	void (*hwirq_mask)(struct sbi_irqchip_device *chip, u32 hwirq);
+
+	/** Unmask a hardware interrupt of this irqchip */
+	void (*hwirq_unmask)(struct sbi_irqchip_device *chip, u32 hwirq);
 };
 
 /**
@@ -44,6 +68,36 @@ struct sbi_irqchip_device {
  */
 int sbi_irqchip_process(void);
 
+/**
+ * Process a hwirq of an irqchip device
+ *
+ * This function is called by irqchip drivers to handle hardware
+ * interrupts of the irqchip.
+ */
+int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
+
+/** Unmask a hardware interrupt */
+int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
+
+/** Mask a hardware interrupt */
+int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq);
+
+/** Default raw hardware interrupt handler */
+int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq);
+
+/** Set raw hardware interrupt handler */
+int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
+				int (*raw_hndl)(struct sbi_irqchip_device *, u32));
+
+/** Register a hardware interrupt handler */
+int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
+				 u32 first_hwirq, u32 num_hwirq,
+				 int (*callback)(u32 hwirq, void *opaque), void *opaque);
+
+/** Unregister a hardware interrupt handler */
+int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
+				   u32 first_hwirq, u32 num_hwirq);
+
 /** Find an irqchip device based on unique ID */
 struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id);
 
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index fb3357f3..736dde6c 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -7,10 +7,35 @@
  *   Anup Patel <apatel@ventanamicro.com>
  */
 
+#include <sbi/sbi_heap.h>
 #include <sbi/sbi_irqchip.h>
 #include <sbi/sbi_list.h>
 #include <sbi/sbi_platform.h>
 
+/** Internal irqchip hardware interrupt data */
+struct sbi_irqchip_hwirq_data {
+	/** raw hardware interrupt handler */
+	int (*raw_handler)(struct sbi_irqchip_device *chip, u32 hwirq);
+};
+
+/** Internal irqchip interrupt handler */
+struct sbi_irqchip_handler {
+	/** Node in the list of irqchip handlers (private) */
+	struct sbi_dlist node;
+
+	/** First hardware IRQ handled by this handler */
+	u32 first_hwirq;
+
+	/** Number of consecutive hardware IRQs handled by this handler */
+	u32 num_hwirq;
+
+	/** Callback function of this handler */
+	int (*callback)(u32 hwirq, void *priv);
+
+	/** Callback private data */
+	void *priv;
+};
+
 static SBI_LIST_HEAD(irqchip_list);
 
 int sbi_irqchip_process(void)
@@ -31,6 +56,172 @@ int sbi_irqchip_process(void)
 	return rc;
 }
 
+int sbi_irqchip_process_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct sbi_irqchip_hwirq_data *data;
+
+	if (!chip || chip->num_hwirq <= hwirq)
+		return SBI_EINVAL;
+
+	data = &chip->hwirqs[hwirq];
+	if (!data->raw_handler)
+		return SBI_ENOENT;
+
+	return data->raw_handler(chip, hwirq);
+}
+
+int sbi_irqchip_unmask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	if (!chip || chip->num_hwirq <= hwirq)
+		return SBI_EINVAL;
+
+	if (chip->hwirq_unmask)
+		chip->hwirq_unmask(chip, hwirq);
+	return 0;
+}
+
+int sbi_irqchip_mask_hwirq(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	if (!chip || chip->num_hwirq <= hwirq)
+		return SBI_EINVAL;
+
+	if (chip->hwirq_mask)
+		chip->hwirq_mask(chip, hwirq);
+	return 0;
+}
+
+static struct sbi_irqchip_handler *sbi_irqchip_find_handler(struct sbi_irqchip_device *chip,
+							    u32 hwirq)
+{
+	struct sbi_irqchip_handler *h;
+
+	if (!chip || chip->num_hwirq <= hwirq)
+		return NULL;
+
+	sbi_list_for_each_entry(h, &chip->handler_list, node) {
+		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq))
+			return h;
+	}
+
+	return NULL;
+}
+
+int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	struct sbi_irqchip_handler *h;
+	int rc;
+
+	if (!chip || chip->num_hwirq <= hwirq)
+		return SBI_EINVAL;
+
+	h = sbi_irqchip_find_handler(chip, hwirq);
+	rc = h->callback(hwirq, h->priv);
+
+	if (chip->hwirq_eoi)
+		chip->hwirq_eoi(chip, hwirq);
+
+	return rc;
+}
+
+int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
+				int (*raw_hndl)(struct sbi_irqchip_device *, u32))
+{
+	struct sbi_irqchip_hwirq_data *data;
+
+	if (!chip || chip->num_hwirq <= hwirq)
+		return SBI_EINVAL;
+
+	data = &chip->hwirqs[hwirq];
+	data->raw_handler = raw_hndl;
+	return 0;
+}
+
+int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
+				 u32 first_hwirq, u32 num_hwirq,
+				 int (*callback)(u32 hwirq, void *opaque), void *priv)
+{
+	struct sbi_irqchip_handler *h;
+	u32 i, j;
+	int rc;
+
+	if (!chip || !num_hwirq || !callback)
+		return SBI_EINVAL;
+	if (chip->num_hwirq <= first_hwirq ||
+	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
+		return SBI_EBAD_RANGE;
+
+	h = sbi_irqchip_find_handler(chip, first_hwirq);
+	if (h)
+		return SBI_EALREADY;
+	h = sbi_irqchip_find_handler(chip, first_hwirq + num_hwirq - 1);
+	if (h)
+		return SBI_EALREADY;
+
+	h = sbi_zalloc(sizeof(*h));
+	if (!h)
+		return SBI_ENOMEM;
+	h->first_hwirq = first_hwirq;
+	h->num_hwirq = num_hwirq;
+	h->callback = callback;
+	h->priv = priv;
+	sbi_list_add_tail(&h->node, &chip->handler_list);
+
+	if (chip->hwirq_setup) {
+		for (i = 0; i < h->num_hwirq; i++) {
+			rc = chip->hwirq_setup(chip, h->first_hwirq + i);
+			if (rc) {
+				if (chip->hwirq_cleanup) {
+					for (j = 0; j < i; j++)
+						chip->hwirq_cleanup(chip, h->first_hwirq + j);
+				}
+				sbi_list_del(&h->node);
+				sbi_free(h);
+				return rc;
+			}
+		}
+	}
+
+	if (chip->hwirq_unmask) {
+		for (i = 0; i < h->num_hwirq; i++)
+			chip->hwirq_unmask(chip, h->first_hwirq + i);
+	}
+
+	return 0;
+}
+
+int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
+				   u32 first_hwirq, u32 num_hwirq)
+{
+	struct sbi_irqchip_handler *fh, *lh;
+	u32 i;
+
+	if (!chip || !num_hwirq)
+		return SBI_EINVAL;
+	if (chip->num_hwirq <= first_hwirq ||
+	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
+		return SBI_EBAD_RANGE;
+
+	fh = sbi_irqchip_find_handler(chip, first_hwirq);
+	if (!fh || fh->first_hwirq != first_hwirq || fh->num_hwirq != num_hwirq)
+		return SBI_ENODEV;
+	lh = sbi_irqchip_find_handler(chip, first_hwirq + num_hwirq - 1);
+	if (!lh || lh != fh)
+		return SBI_ENODEV;
+
+	if (chip->hwirq_mask) {
+		for (i = 0; i < fh->num_hwirq; i++)
+			chip->hwirq_mask(chip, fh->first_hwirq + i);
+	}
+
+	if (chip->hwirq_cleanup) {
+		for (i = 0; i < fh->num_hwirq; i++)
+			chip->hwirq_cleanup(chip, fh->first_hwirq + i);
+	}
+
+	sbi_list_del(&fh->node);
+	return 0;
+}
+
 struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id)
 {
 	struct sbi_irqchip_device *chip;
@@ -47,8 +238,9 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 {
 	struct sbi_irqchip_device *c;
 	struct sbi_hartmask hm;
+	u32 i;
 
-	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
+	if (!chip || !chip->num_hwirq || !sbi_hartmask_weight(&chip->target_harts))
 		return SBI_EINVAL;
 
 	if (sbi_irqchip_find_device(chip->id))
@@ -64,6 +256,14 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 		}
 	}
 
+	chip->hwirqs = sbi_zalloc(sizeof(*chip->hwirqs) * chip->num_hwirq);
+	if (!chip->hwirqs)
+		return SBI_ENOMEM;
+	for (i = 0; i < chip->num_hwirq; i++)
+		sbi_irqchip_set_raw_handler(chip, i, sbi_irqchip_raw_handler_default);
+
+	SBI_INIT_LIST_HEAD(&chip->handler_list);
+
 	sbi_list_add_tail(&chip->node, &irqchip_list);
 	return 0;
 }
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index d47a810b..ec69c82b 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -307,6 +307,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 
 	/* Register irqchip device */
 	aplic->irqchip.id = aplic->unique_id;
+	aplic->irqchip.num_hwirq = aplic->num_source + 1;
 	rc = sbi_irqchip_add_device(&aplic->irqchip);
 	if (rc)
 		return rc;
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 0f296c89..7559a069 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -346,9 +346,17 @@ int imsic_data_check(struct imsic_data *imsic)
 	return 0;
 }
 
+static int imsic_hwirq_setup(struct sbi_irqchip_device *chip, u32 hwirq)
+{
+	if (!hwirq || hwirq == IMSIC_IPI_ID)
+		return SBI_ENOTSUPP;
+	return 0;
+}
+
 static struct sbi_irqchip_device imsic_device = {
 	.warm_init	= imsic_warm_irqchip_init,
 	.process_hwirqs	= imsic_process_hwirqs,
+	.hwirq_setup	= imsic_hwirq_setup,
 };
 
 int imsic_cold_irqchip_init(struct imsic_data *imsic)
@@ -392,6 +400,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 
 	/* Register irqchip device */
 	imsic_device.id = imsic->unique_id;
+	imsic_device.num_hwirq = imsic->num_ids + 1;
 	sbi_hartmask_set_all(&imsic_device.target_harts);
 	rc = sbi_irqchip_add_device(&imsic_device);
 	if (rc)
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 973f7c2a..2d721724 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -281,6 +281,7 @@ int plic_cold_irqchip_init(struct plic_data *plic)
 
 	/* Register irqchip device */
 	plic->irqchip.id = plic->unique_id;
+	plic->irqchip.num_hwirq = plic->num_src + 1;
 	plic->irqchip.warm_init = plic_warm_irqchip_init;
 	return sbi_irqchip_add_device(&plic->irqchip);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
