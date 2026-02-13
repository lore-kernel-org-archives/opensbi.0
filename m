Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C2EF48CA
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 05:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORZnBTSTlCxED3Es4De6h4kxls5YTOnN6tjF4Zze1Cg=; b=ndPBMyGfh7EHAs
	Yeohv5xkbHr/SqcQlz1dmdGy5mwRpp9b8u747F8gXesLG6oDBF8dM7d47HVXlqm+IhbRYPSAFrtz8
	pWSOOCfz7dNzoF4ok9NSDucr0nBnmXPYrYLu+z1y3YYWx34NfATXIPMRRqY1IZjYUUlSsEp+MYyJ/
	yASVVjmVklSuf4aD7d5A0alyBZ8mcpFWS2zVT94UyxTnRMzHPkB7/hQ1hcLncWwM5FQfX21NpdhH2
	hgQCUrkN0XXwkgIhr+o1AX3DVrCyYsR4F91fcvq17P1TayET0mu0K74twP3jFqKO6FqV04e/+bK7i
	lDjiG8ze8Sf3MFiwAAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7n-0000000321y-3yp5;
	Fri, 13 Feb 2026 05:53:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7l-0000000321E-14jV
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 05:53:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0BpBK2733827;
	Fri, 13 Feb 2026 05:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tT5IEdVPLD0
	EyOiVw6rHFRZb2p00+mAnH598aYKTxJE=; b=fQFyQPUj7U5m8vUyrKiSRW5GxdR
	kXYf7pvlFvKmYRU0bBSRBitXQQKtCd80ZWf9TfyPL3TZF+FfNqguEvCoeVTE1etr
	1e5zxFLWT3I2fC6H1HLdc2EqjYhUtXDe/iYzR2B8pyaE2vKV1dqBQ53DUqMrKji3
	/3LLA5yUnikYoWW8RQXQNPKNqRFYp6CbBv2cVoPStHDu6EL6yvq3kaOdETCZ0Bgy
	5EQCc7EIvmKKplqi6Gd4LbcGgTMnU8yrs6ZprpAe9dHmC8sZa8lxwAVr3E4Tc8d0
	1X0OBSU2dJ3HdbePeQewwwFQ/54Yv+TePTH8/5rdzImpuxwq+8PQaCFdRFA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wrxvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61D5risQ006127;
	Fri, 13 Feb 2026 05:53:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfn97m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:44 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61D5ri3X006147;
	Fri, 13 Feb 2026 05:53:44 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61D5rihf006141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:44 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id DB1D424A6D; Fri, 13 Feb 2026 11:23:42 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 7/8] lib: sbi_irqchip: Associate 32-bit unique ID for each irqchip device
Date: Fri, 13 Feb 2026 11:23:41 +0530
Message-ID: <20260213055342.3124872-8-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
References: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C-qXk_0-NA_K-DKEmw_bxbXWceZrL2EP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MiBTYWx0ZWRfXy31Dgr0RfcOM
 UdSDFsvG27wH0PsoBM8YzJicotyw0NF8PtCGi6Pv5RElw0ygte8X90lb1bNeyPFrbj32Rixgsff
 hMEYh1eZZ42syP1+9ZZ+4ztT8U4a/9SgyowxH/M6lO6jv9uQqhaiDVkaL9lTpIMsUb8mbiLsWsx
 LnVgyG4iCJMrqHWvk1UefXwZbNAW3FQ9jWSEzDh8sds8RzkSPmtzO6jnRNqMG96uo2Rk+vzGnm/
 RoMarGeyv09J/C3Gdsk4lCkDEQpbFgBZlSlcqOxKRiDAsq30qGpuTCR4kdJgV2TRyB1lehL8TDJ
 +pPvJJ8LarHVne7uot1/9fLfl0yHaCMdpt8io7aIeAHvviZ+jAHpqhmYN0zbb2IcmpA6mQ8xHWl
 jFidl/3GH6Xpe9uGRutv5DUhHt7t2Ru1j2tcGgZOn0dfeqFOIMaYS4RE2xND2XxrJQHLbjRIqv7
 s8vVhHpaQ+kgQ7QqNgw==
X-Proofpoint-GUID: C-qXk_0-NA_K-DKEmw_bxbXWceZrL2EP
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ebc6c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=cJ7Lga2Aht15EmTzcLkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_215353_296921_94E76444 
X-CRM114-Status: GOOD (  14.65  )
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

Allow locating irqchip device instance using a unique 32-bit ID. This
32-bit unique ID can be set by the irqchip driver at the time of adding
irqchip device.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_irqchip.h |  6 ++++++
 lib/sbi/sbi_irqchip.c     | 15 +++++++++++++++
 lib/utils/irqchip/aplic.c |  1 +
 lib/utils/irqchip/imsic.c |  1 +
 lib/utils/irqchip/plic.c  |  1 +
 5 files changed, 24 insertions(+)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index c3ded271..d2c47ae8 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -21,6 +21,9 @@ struct sbi_irqchip_device {
 	/** Node in the list of irqchip devices */
 	struct sbi_dlist node;
 
+	/** Unique ID of this irqchip */
+	u32 id;
+
 	/** Set of harts targetted by this irqchip */
 	struct sbi_hartmask target_harts;
 
@@ -41,6 +44,9 @@ struct sbi_irqchip_device {
  */
 int sbi_irqchip_process(void);
 
+/** Find an irqchip device based on unique ID */
+struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id);
+
 /** Register an irqchip device to receive callbacks */
 int sbi_irqchip_add_device(struct sbi_irqchip_device *chip);
 
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index d3e58288..5df6189b 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -30,6 +30,18 @@ int sbi_irqchip_process(void)
 	return hd->chip->process_hwirqs(hd->chip);
 }
 
+struct sbi_irqchip_device *sbi_irqchip_find_device(u32 id)
+{
+	struct sbi_irqchip_device *chip;
+
+	sbi_list_for_each_entry(chip, &irqchip_list, node) {
+		if (chip->id == id)
+			return chip;
+	}
+
+	return NULL;
+}
+
 int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 {
 	struct sbi_irqchip_hart_data *hd;
@@ -39,6 +51,9 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
 		return SBI_EINVAL;
 
+	if (sbi_irqchip_find_device(chip->id))
+		return SBI_EALREADY;
+
 	if (chip->process_hwirqs) {
 		sbi_hartmask_for_each_hartindex(h, &chip->target_harts) {
 			scratch = sbi_hartindex_to_scratch(h);
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index ea5cb7c4..d47a810b 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -306,6 +306,7 @@ int aplic_cold_irqchip_init(struct aplic_data *aplic)
 	}
 
 	/* Register irqchip device */
+	aplic->irqchip.id = aplic->unique_id;
 	rc = sbi_irqchip_add_device(&aplic->irqchip);
 	if (rc)
 		return rc;
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 5ec9dff4..0f296c89 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -391,6 +391,7 @@ int imsic_cold_irqchip_init(struct imsic_data *imsic)
 	}
 
 	/* Register irqchip device */
+	imsic_device.id = imsic->unique_id;
 	sbi_hartmask_set_all(&imsic_device.target_harts);
 	rc = sbi_irqchip_add_device(&imsic_device);
 	if (rc)
diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
index 25cc2787..973f7c2a 100644
--- a/lib/utils/irqchip/plic.c
+++ b/lib/utils/irqchip/plic.c
@@ -280,6 +280,7 @@ int plic_cold_irqchip_init(struct plic_data *plic)
 	}
 
 	/* Register irqchip device */
+	plic->irqchip.id = plic->unique_id;
 	plic->irqchip.warm_init = plic_warm_irqchip_init;
 	return sbi_irqchip_add_device(&plic->irqchip);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
