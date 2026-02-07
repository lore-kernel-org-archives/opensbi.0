Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB7DEE0AC7
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eX7mrQS+JYHvDXl6+qFDPMX3U0wBvTfFxmmUMcNxeB0=; b=O03MF1gkOeGdRT
	fIwU6h2IeJ+BDYb2iQZ1R3jzOVVq4ymbq7yBa04/7JhqDa2rgcP3umGOLOd9GOOW3//FiSO9a3h21
	zDQJtg4nx3MgxQxWJZnYLkhzCJCvaXvUEG2HXuV5BvQo3a5S76rJzziB8LmutND6mQ2bbO9OiZysu
	y34kL0xqrqm8zqxE5BGrbIC4rNGo5VPzer8zxJ1tkZO9JT9Mlda1/YrYqQ4lpETJFum9ReaDo3KCT
	j2+JiA+ZXK63NMi3kJT2+IohftDChqDKRpFVGyiFNiPqUHLegfiMrYQ2LVpJv/y2zBDaxqKQLIMON
	iD5XzzBG9Es39XeRxtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW5-0000000CJOX-3AOR;
	Sat, 07 Feb 2026 10:26:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofW3-0000000CJNV-3zOc
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:26:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174O1Hu411126;
	Sat, 7 Feb 2026 10:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mja7pdbITbh
	CxIdAkCDJRXGCfkl04hE2Bxz18Qo2I1Y=; b=SQpqzfnSowASGxLSPzpmYCYxc9g
	9tT56OTsfIltPi+lweFqO6SecRB+2eLfBWGQ79hICC0Lch8vV0QPps8ZzM9DRDWQ
	XZCGO8UivOu5BbT8AkssWCDHrbFcKsaoU+cL5JjsSbNi4glB5sDFUHelJIOubiVz
	Ml+bobJQBFxoKJO6t/ccgqwVHS6IuXq12EYJUVUFzeyUinnkDFqYxxb+l1Z73Gga
	OvE2ZYAG6epo13/C/xVrq8a0j4cfTqHqx4cZwaM7KiNzyxpqzLfzMfRv90cW93S+
	cwnN5hFKRCu/dMWQtjK2eCDdbqPTfvcnvaF9GO6nnNH4hnU4olaB9DwTKcQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xb4rhb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 617AQ3Th002715;
	Sat, 7 Feb 2026 10:26:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfkj4kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 617AQ4sa002759;
	Sat, 7 Feb 2026 10:26:04 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 617AQ3XF002750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Feb 2026 10:26:04 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D000824A01; Sat,  7 Feb 2026 15:56:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 7/8] lib: sbi_irqchip: Associate 32-bit unique ID for each irqchip device
Date: Sat,  7 Feb 2026 15:56:01 +0530
Message-ID: <20260207102602.2917520-8-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G-IG1_cYlTjodCtAKYJWrk7CB1k9z0Re
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA4MiBTYWx0ZWRfX6w810BfiKb1D
 jWjick858Akau4QjLFgHaPHRulntlm3iRpj4TnA+qxWT162oWpoWQkqVvPvJmTvRA2RvRzK6lqf
 R8nUDR+Qrn5ND20StwWAa/9d7IGdPXZkmnseRljx+kTR+nVEaI1ABxmQ9DfECM4y3LbbBifrT++
 kyOIH2Iyn7dZZjz7B8RKT5ALvWMqoeFAMg0zbBHlVuyoNSsvltKvPkPYFzneN1uzSrUsl5bkZk0
 ZoQki+uJp7vzUHDKJOEoZfTAgB9BpaWVc8in/ZFqaM/eY4MLlHJjHbL2jeX9cmODvhmFjbTmPqR
 H8ncZvZg/COOh6EjC6lCOzJGEZxA2+BhDAviNapx02+dj0lH+XWPIRJMj5qTK6oEQxgeSUP46pS
 1kzKTWPPzFIN34ZcQC/4fbIE+i7gi/fc1rYmZX7ey3PIlg+yv3A1LRn4JwVr7glU3tpA9kOTs9m
 kh1Pmlk83SSzJ1Q82GA==
X-Authority-Analysis: v=2.4 cv=PYLyRyhd c=1 sm=1 tr=0 ts=69871345 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=cJ7Lga2Aht15EmTzcLkA:9
X-Proofpoint-ORIG-GUID: G-IG1_cYlTjodCtAKYJWrk7CB1k9z0Re
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022616_109107_9064F590 
X-CRM114-Status: GOOD (  13.68  )
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
index 77ec05af..fb3357f3 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -31,6 +31,18 @@ int sbi_irqchip_process(void)
 	return rc;
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
 	struct sbi_irqchip_device *c;
@@ -39,6 +51,9 @@ int sbi_irqchip_add_device(struct sbi_irqchip_device *chip)
 	if (!chip || !sbi_hartmask_weight(&chip->target_harts))
 		return SBI_EINVAL;
 
+	if (sbi_irqchip_find_device(chip->id))
+		return SBI_EALREADY;
+
 	if (chip->process_hwirqs) {
 		sbi_list_for_each_entry(c, &irqchip_list, node) {
 			if (!c->process_hwirqs)
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
