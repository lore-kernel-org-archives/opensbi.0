Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082C2FAD40D
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dX+OvaT9ct2mt/LLC26NAXlklZqOsdfrQrWAJCFLcWA=; b=dFn1ryv+MCI1m6
	RibC/Wos9eeTwrOE3ZcrqEjJ4ndN9RVARTWDzKxjjxqu0nX4BX2VODi7HXYUbIsw4uHbjnizJvYzt
	B7FOOaGbpbZ/DQlupdc52niTfCBfIg2uh+qqvcbclNfjFG7Pp4skF9+SEYWIPU9sXNzRpi6GCvw1n
	vcRwOwdM6Bqkfc+3YsDRSmSn/0VUx29f5NUuia0w7Af+7xqh0kI4dOtjJG+OvEmGT6jURbkNSv1xe
	1rFaC5snms4bSa203db4UZdWD5lNcPjWjW6rw46QgPz5PY/IuyMCxnCCl/Wcm9GFWvvlgnOQE/CWB
	4B0Kuyubg1QyMVDVI1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXw-0000000B3tP-0w3M;
	Thu, 23 Apr 2026 05:24:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXs-0000000B3qT-1q4p
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:24:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N5B2ve2630173;
	Thu, 23 Apr 2026 05:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1jKuHKI5ZR4
	1JXbYW2guFj0HyROvlTy9Lx6TdPqxbyc=; b=AR243kdZigCMT05AxtD4LI5vaLz
	5GW44wp8cX7PNZF4WXh9qTYePYEYRll51RfchwQgV38ysYu2z328xHE6D5F4teZ5
	qu3/3A3T7te5rltXt8FKgCmjd1g4FHTM/OTpJh2Sz5giHrS/3CG3KBvshhFtXR/2
	L9uZfL3Lhy2UmATYlI2aeDQeUovt4r7hAk4OfSbIm5KcnjOdRcL1Kufmk0dT8UE5
	BmDAkvP+dZYpWKgBLdXWsWml54eGOfsJOAGMPZh5qdAH2dvXiBAeCaCqHU8Cdiyu
	5RNA/3wCwN+A0xF7KaJ4Y2So+D0UMKoWy8Tz8d4pjUAy/naDNOIsOvQmp4A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35r9vj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N5NgWC007147;
	Thu, 23 Apr 2026 05:23:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31jyv26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:43 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N5NfNU007121;
	Thu, 23 Apr 2026 05:23:42 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N5NgoO007161
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:42 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0CD4422A6E; Thu, 23 Apr 2026 10:53:41 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 6/6] lib: sbi_irqchip: Add support for registering MSI handlers
Date: Thu, 23 Apr 2026 10:53:39 +0530
Message-ID: <20260423052339.356900-7-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
References: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NyBTYWx0ZWRfXwXvqYHC5QFeA
 3YQGcbT6SGNTpG5T+FDRmvH1w7Zf18rNoQWSy1GRy4fUsab7kAGc3861S7F05XCHfQ57PBVLvaC
 Tjj7UdZKT0aCu1+3PexVK6JI9Imus1U+/pglT006oCJsVBWLv0MLpaFF+34DwWa/o7LHp07Zl/H
 h5Hv1ipXcobctovCFJqmIGq/EkdTlgZdYv8kN/XRREFyYVOAV+iVhX3S6+bowPC/BUINjvb8CSR
 hMV04RzgbhcS91TWsY2WEqHiFxVUW1dhZCT5A3/RMzNXdabOwPvlkwCJ02lUBwfiT8HOMY6y60m
 +01g9r1p1vqLd9AYhpv0+/6wg9JeYLKwLMUZ+/OdvgVf9aa/eyv0IUWCcdJ49YWOgI3SEq4fYec
 cSZjS6/62AdZQu2ubCaMFqkPXeyvEiCw99HUDJWeJ3wS8mm7lyg8aKD95lwkfeU/cMt5Z5SOGE7
 8pIUVG7je92bPbXyXUg==
X-Proofpoint-ORIG-GUID: tvjGY8tAAFChqWbrgrX7nFSGyy3Cjqmh
X-Proofpoint-GUID: tvjGY8tAAFChqWbrgrX7nFSGyy3Cjqmh
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9ace2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=W-_n0kkjAAAA:8 a=ZzP6kdRnfcf-SEE31FgA:9
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222412_605984_48339A31 
X-CRM114-Status: GOOD (  17.21  )
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

Some of the drivers (such as APLIC) require capability to registers
MSI handlers from the parent interrupt controller (such as IMSIC)
so add sbi_irqchip_register_msi_handler() for this purpose.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_irqchip.h | 19 +++++++++++
 lib/sbi/sbi_irqchip.c     | 71 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 03a01038..8e7ff573 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -16,6 +16,13 @@
 
 struct sbi_scratch;
 
+/** irqchip message signalled interrupt (MSI) */
+struct sbi_irqchip_msi_msg {
+	u32 address_lo;
+	u32 address_hi;
+	u32 data;
+};
+
 /** irqchip hardware device */
 struct sbi_irqchip_device {
 	/** Node in the list of irqchip devices (private) */
@@ -109,6 +116,18 @@ int sbi_irqchip_get_affinity(struct sbi_irqchip_device *chip, u32 hwirq,
 /** Set hardware interrupt affinity */
 int sbi_irqchip_set_affinity(struct sbi_irqchip_device *chip, u32 hwirq, u32 hart_index);
 
+/** Write MSI message to the hardware interrupt handler */
+int sbi_irqchip_write_msi(struct sbi_irqchip_device *chip, u32 hwirq,
+			  const struct sbi_irqchip_msi_msg *msg);
+
+/** Register a hardware MSI handler */
+int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
+			     void (*write_msi)(u32 hwirq,
+					       const struct sbi_irqchip_msi_msg *msg,
+					       void *priv),
+			     int (*callback)(u32 hwirq, void *priv), void *priv,
+			     u32 *out_first_hwirq);
+
 /** Register a hardware interrupt handler */
 int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 386dfd87..5880872c 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -35,6 +35,9 @@ struct sbi_irqchip_handler {
 	/** Number of consecutive hardware IRQs handled by this handler */
 	u32 num_hwirq;
 
+	/** Write MSI function of this handler */
+	void (*write_msi)(u32 hwirq, const struct sbi_irqchip_msi_msg *msg, void *priv);
+
 	/** Callback function of this handler */
 	int (*callback)(u32 hwirq, void *priv);
 
@@ -141,6 +144,24 @@ int sbi_irqchip_set_raw_handler(struct sbi_irqchip_device *chip, u32 hwirq,
 	return 0;
 }
 
+int sbi_irqchip_write_msi(struct sbi_irqchip_device *chip, u32 hwirq,
+			  const struct sbi_irqchip_msi_msg *msg)
+{
+	struct sbi_irqchip_handler *h;
+
+	if (!chip || chip->num_hwirq <= hwirq || !msg)
+		return SBI_EINVAL;
+
+	h = sbi_irqchip_find_handler(chip, hwirq);
+	if (!h)
+		return SBI_EFAIL;
+	if (!h->write_msi)
+		return SBI_ENOTSUPP;
+
+	h->write_msi(hwirq, msg, h->priv);
+	return 0;
+}
+
 int sbi_irqchip_get_affinity(struct sbi_irqchip_device *chip, u32 hwirq,
 			     u32 *out_hart_index)
 {
@@ -215,6 +236,9 @@ static int __sbi_irqchip_handler_set_affinity(struct sbi_irqchip_device *chip,
 
 static int __sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 					  u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
+					  void (*write_msi)(u32 hwirq,
+							    const struct sbi_irqchip_msi_msg *msg,
+							    void *priv),
 					  int (*callback)(u32 hwirq, void *priv), void *priv)
 {
 	struct sbi_irqchip_handler *h, *th, *nh;
@@ -232,6 +256,7 @@ static int __sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 		return SBI_ENOMEM;
 	h->first_hwirq = first_hwirq;
 	h->num_hwirq = num_hwirq;
+	h->write_msi = write_msi;
 	h->callback = callback;
 	h->priv = priv;
 
@@ -281,6 +306,48 @@ static int __sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 	return 0;
 }
 
+int sbi_irqchip_register_msi(struct sbi_irqchip_device *chip, u32 num_hwirq,
+			     void (*write_msi)(u32 hwirq,
+					       const struct sbi_irqchip_msi_msg *msg,
+					       void *priv),
+			     int (*callback)(u32 hwirq, void *priv), void *priv,
+			     u32 *out_first_hwirq)
+{
+	struct sbi_irqchip_handler *h;
+	bool found;
+	u32 hwirq;
+
+	if (!chip || !chip->hwirq_set_affinity || !num_hwirq ||
+	    !write_msi || !callback || !out_first_hwirq)
+		return SBI_EINVAL;
+	if (chip->num_hwirq < num_hwirq)
+		return SBI_EBAD_RANGE;
+
+	hwirq = 0;
+	found = false;
+	sbi_list_for_each_entry(h, &chip->handler_list, node) {
+		if (h->first_hwirq <= hwirq && hwirq < (h->first_hwirq + h->num_hwirq)) {
+			hwirq = h->first_hwirq + h->num_hwirq;
+		} else if (hwirq < h->first_hwirq) {
+			if (h->first_hwirq - hwirq < num_hwirq) {
+				found = true;
+				break;
+			} else {
+				hwirq = h->first_hwirq + h->num_hwirq;
+			}
+		}
+	}
+	if (!found && !hwirq)
+		found = true;
+	if (!found)
+		return SBI_ENOSPC;
+	*out_first_hwirq = hwirq;
+
+	return __sbi_irqchip_register_handler(chip, *out_first_hwirq,
+					      num_hwirq, SBI_HWIRQ_FLAGS_NONE,
+					      write_msi, callback, priv);
+}
+
 int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 				 u32 first_hwirq, u32 num_hwirq, u32 hwirq_flags,
 				 int (*callback)(u32 hwirq, void *priv), void *priv)
@@ -292,7 +359,7 @@ int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 		return SBI_EBAD_RANGE;
 
 	return __sbi_irqchip_register_handler(chip, first_hwirq, num_hwirq, hwirq_flags,
-					      callback, priv);
+					      NULL, callback, priv);
 }
 
 int sbi_irqchip_register_reserved(struct sbi_irqchip_device *chip,
@@ -305,7 +372,7 @@ int sbi_irqchip_register_reserved(struct sbi_irqchip_device *chip,
 		return SBI_EBAD_RANGE;
 
 	return __sbi_irqchip_register_handler(chip, first_hwirq, num_hwirq,
-					      SBI_HWIRQ_FLAGS_NONE, NULL, NULL);
+					      SBI_HWIRQ_FLAGS_NONE, NULL, NULL, NULL);
 }
 
 int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
