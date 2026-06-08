Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3C7CD8C9F
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eq/ao1c9FE5lmUPdh3CXoESmvt3FmsrP6+og0ENYRwE=; b=4EuQ7aeqiKlnui
	+EXI99ixPuVWP6doIxKcBeZimdTQcNajdeikmSgh7eFIF66ptcE3aWtKBFebS/hWIjiRAwlsoK2fj
	myfqZHX/yXHGTpaGQMfLRLY2nQwAjXMpZinJqQ8IFr+ysabwVnv0hjzOjngTFZYh4sxlm83bZ7bGC
	9UQyPrqyJor8Yc9tCWinB8I1UnV5vcmMZgCaQ2B+Rn6x/gRyfYMQoB9Knn3+Jv5rtzW7FQ7XCZjEE
	t3pPQNE9/WEy4xgTknmcmlz7YqxdfD9ohJT8QtzCkkLeOKT2MtqDEeO415IKnXXclYVNvr94qSvWa
	w4fYpbiryUeF4ih4YLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTt-00000003Xuv-3pqN;
	Mon, 08 Jun 2026 12:53:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTp-00000003Xt9-3qor
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 12:53:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658CnREI3594833;
	Mon, 8 Jun 2026 12:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ODJvoXjuUHO
	tVp7Ex7UT1S7BERPfxAhjLtdCXsfzHP0=; b=ALx/qdXyUKMsT7kVZXZ32ytv2E1
	W8DjhAoGFlzKAFQCGAUyNBmR7vPv6+ToqrcjGB35170NkqYMr4RXje2n3n/kFscD
	AKcNUTVe6ADqP+DCS5n2RYdqDpbiCizKwTWRMaMzOnRCSAzikcwFe4rLXJlTio6t
	7saqlsYKpnIOhL8pA5pTS6IH/n3rqG8M4wr6CSyXfB9Ma+H4DD7laKGtgXyNR2H9
	CfESTQkuYM26sl7h09rLryfj8gqCojNGxy/sVNlzPu40TLDmdR+JUjfrcoqINrba
	VqiykgZA4N/QdQ7/7vFC8bLTthoZX8hZQTUMyrWqd28Wusey7g4SEUVSZyg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rr0hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 658CrIKB018166;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmj8fsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 658CrIce018142;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 658CrIfx018138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 13AFD2151B; Mon,  8 Jun 2026 18:23:17 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 1/4] lib: sbi_irqchip: Allow irqchip drivers advertise capabilities
Date: Mon,  8 Jun 2026 18:22:53 +0530
Message-ID: <20260608125257.3220114-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
References: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 6VajBEFMENTyz30ziCT93yJGOvag7i6A
X-Proofpoint-ORIG-GUID: 6VajBEFMENTyz30ziCT93yJGOvag7i6A
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26bb41 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=_XBLbOsICfXnSrIvqYoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMiBTYWx0ZWRfX0OVMZYPigug5
 J9n8yV2ibJv+ytU05tvlrQwycBDGGdjYQd4okHhiemCQzSpT1Og5Ce51+SNInz1+I3si1wQ9OUK
 G7oVr3COHVUND5r7uLz7pT4nihaCeHE3Hsm/YcbRTdQaw8gR7UGuOIY33trCTECTshr6x42RxJ0
 T+8mqZFzCYVraeIrz5OEVNEa3AElBelMX2QqJ2otI1xDB9c1PrbCaBngBGhn6btZL5saW+ryMPz
 Sz5lH7eY7lm915NTj/ZzDz5Zl4/28RZXKPWtnWc7MlVgerD6eW6Eh9B8k8k33N0j+Ua4Ysv3ufD
 dEJIoDw2W3Du92iUIYuPQ6KmLXjI2ktO6kA+2rkYE4JHWyC1jHUWTi7xbv4uN2/Xz45lGMxXS7T
 P5vJSwY4fdBCzSRlErJUbqM3hE/dzcC/89RmDXOKQmQJz/qP/7osM8DoPNqm9WwT/o6OiiGQ2YE
 XM7UfqESdLb0+orm4oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_055326_074835_5C357774 
X-CRM114-Status: GOOD (  16.42  )
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

Extend struct sbi_irqchip_device to allow irqchip drivers advertise
interrupt controller capabilities (such as wired interrupt, MSIs, etc).
This further allows other parts of OpenSBI to lookup irqchip devices
based on capabilities.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h | 11 ++++++++++-
 lib/sbi/sbi_irqchip.c     | 20 ++++++++++++++++++++
 lib/utils/irqchip/aplic.c |  1 +
 lib/utils/irqchip/imsic.c |  1 +
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index 8e7ff573..e778d747 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -31,12 +31,17 @@ struct sbi_irqchip_device {
 	/** Internal data of all hardware interrupts of this irqchip (private) */
 	struct sbi_irqchip_hwirq_data *hwirqs;
 
-	/** List of interrupt handlers */
+	/** List of interrupt handlers (private) */
 	struct sbi_dlist handler_list;
 
 	/** Unique ID of this irqchip */
 	u32 id;
 
+	/** Capabilities of this irqchip */
+#define SBI_IRQCHIP_CAPS_WIRED		BIT(0)
+#define SBI_IRQCHIP_CAPS_MSI		BIT(1)
+	unsigned long caps;
+
 	/** Number of hardware IRQs of this irqchip */
 	u32 num_hwirq;
 
@@ -141,6 +146,10 @@ int sbi_irqchip_register_reserved(struct sbi_irqchip_device *chip,
 int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
 				   u32 first_hwirq, u32 num_hwirq);
 
+/** Find an irqchip device based on matching capabilities */
+struct sbi_irqchip_device *sbi_irqchip_find_device_by_caps(unsigned long caps,
+							   struct sbi_irqchip_device *first);
+
 /** Find an irqchip device based on unique ID */
 struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id);
 
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 5880872c..6d0df02e 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -408,6 +408,26 @@ int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
 	return 0;
 }
 
+struct sbi_irqchip_device *sbi_irqchip_find_device_by_caps(unsigned long caps,
+							   struct sbi_irqchip_device *first)
+{
+	struct sbi_irqchip_device *chip;
+	bool found = false;
+
+	sbi_list_for_each_entry(chip, &irqchip_list, node) {
+		if (!found) {
+			if (first == chip)
+				found = true;
+			else
+				continue;
+		}
+		if ((chip->caps & caps) == caps)
+			return chip;
+	}
+
+	return NULL;
+}
+
 struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id)
 {
 	struct sbi_irqchip_device *chip;
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index ec69c82b..6c63620e 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -307,6 +307,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 
 	/* Register irqchip device */
 	aplic->irqchip.id = aplic->unique_id;
+	aplic->irqchip.caps = SBI_IRQCHIP_CAPS_WIRED;
 	aplic->irqchip.num_hwirq = aplic->num_source + 1;
 	rc = sbi_irqchip_add_device(&aplic->irqchip);
 	if (rc)
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 521d17fe..0e7f3e6b 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -400,6 +400,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 
 	/* Register irqchip device */
 	imsic_device.id = imsic->unique_id;
+	imsic_device.caps = SBI_IRQCHIP_CAPS_MSI;
 	imsic_device.num_hwirq = imsic->num_ids + 1;
 	sbi_hartmask_set_all(&imsic_device.target_harts);
 	rc = sbi_irqchip_add_device(&imsic_device);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
