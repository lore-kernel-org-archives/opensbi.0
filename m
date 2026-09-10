Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1614C88E46
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXyo6DzTTYRrVzKbFnS2qgpTHfUdQGEm+L+uvfLkKQI=; b=Z7o30D/Fg/T4GA
	go5dd9t07OpiaTRgU5bmqeorGxbub/jBHQSTyxxdh9nIGG8BRPyhuqMspytxbsFlwn5es7LVexoBi
	TKLR8ODn///TlaanGOYYp3vFvVlY8BBYfGv2zDJZu0ELO8Ss2Iyl9YgcVghxx0zg93ACmxMJ243o7
	5K1eMcW1CW6nlQ6j/E+o1FMBjsPY3TBY871dyrciX5GbhuyCkIxnKMct4t8fYu/I3yY+bkQBJHZZV
	yb/ksyc/4NyK1/WRhej7ky3Hod/mhSUW2IHnX6OmL+I18T1+GPaH0L3rBPI64ouUE9/ouxbB51c0P
	iN8n303CD4yk4gdwhxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4m0V-0000000FOiF-25MF;
	Thu, 10 Sep 2026 21:08:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4m0R-0000000FOgN-3lfD
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 21:08:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AIS8Rx1740636;
	Thu, 10 Sep 2026 21:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2gwG0OBOigV
	H49kJ8C+DRiycKflbCvtULgm3J8UE+GQ=; b=QhwyXBgzet1CmrMdZ9XQRTOOcAY
	hb30EIomu3isfokwLDzr4R7GKePKj3vtsoNYlckgDOkcju5V6/Hk1yFHsoN5JUOW
	Q2Ni2rCcUY5utF3nmUadzBA9UwwN7lIweYsgSMjiPaPtWrnVf2DYDQPCZu05vKa8
	UQqnEijUA4bL0IIqNTRrg68gvF9X36Z0QfWF+F7K1CXSOZ8gRE3YbmvaT9dCsFwe
	zI+fsqeRQgKjW5WaB8DetWp7kX5d6R+9Pj5pRXRDGn3yo5eK+EZeyvs6Zp9nFEAE
	4MrZNsfxKvbd/W/277yOh8GqStD5W4FKvv22IFXEM3BznL33XE3qq4UM61w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkwa3uh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 21:08:25 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68AL8PiX2299202;
	Thu, 10 Sep 2026 21:08:25 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 68AL8O1Z2299186
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 21:08:24 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id B49D2216BB; Thu, 10 Sep 2026 14:08:24 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v4 1/3] lib: sbi: domain: add domain registration notifier infrastructure
Date: Thu, 10 Sep 2026 14:08:17 -0700
Message-ID: <20260910210819.525538-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com>
References: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa31c4a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Wfo4nuPocUaWA4cd95wA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI2MiBTYWx0ZWRfX41rbaCigFFsy
 FeXA52j5TeA8rdmhMI+KixMmQq7o95Kn/vSOD+PiJTDVFr8GZzfNEK4vilFV8dqebI0kcHxoynO
 pNiI0+AHUsgNIAlgkRPWg8ZmsqnjuPA=
X-Proofpoint-ORIG-GUID: HCqB066UHJJRi04Wn9x_u3FgVZcA-NOx
X-Proofpoint-GUID: HCqB066UHJJRi04Wn9x_u3FgVZcA-NOx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI2MiBTYWx0ZWRfX5nT4BjPX2n8M
 hRohweaWMcd66jZmVMN8jMG8SlcAVVRifxDIgYc97mmh8G6xaolSAIxZe3BatltRtf75mWTVDog
 GoSmWaIRNjHS7B7uljKiUTebC6fYoiATkGQt9RyPju52g8wxCWQb2XpeAo6odiFdxARNBEA0+75
 TOkWKsLr4wRyGtuDZu6CK2tjk6vKPIqK5HnD9+gApYFpxpqk3JbZKI0L1J0EhtMjdv9YwjYeWSB
 emvkSmYPi7z4qRByXiMT4aNqmn94oE2TjfrmJ7Ta+EA1/2Q/XJpBtiFRSewCt88tgUOyHOTtp2Q
 XnwOxNNkevvCcrS9oXdCioAeR3MWbmRBmHfekjiLtwvlTtkdDd+bc/3/hTPxgRF4+onA4Q6FA1U
 pa03IV+TnYr9i7G1Hb+ZvpMls+Dbk4jPDIZtSQfRBi2/jwS8AJ7vJ1ZvayXQPG+YVD7ACeom08i
 cwDlzy8ZxVbfgKXzYOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_140828_045869_73F79255 
X-CRM114-Status: GOOD (  12.73  )
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

From: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>

Introduce a notifier callback mechanism that allows subsystems to
register interest in domain registration events. When a new domain
is registered via sbi_domain_register(), all registered notifiers
are invoked before domain sanitization.

The following public interfaces are added to sbi_domain.h:

  - sbi_domain_register_notifier(): registers a notifier callback.
    Duplicate (fn, priv) pairs are silently ignored.

  - sbi_domain_unregister_notifier(): removes a previously registered
    notifier callback.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi/sbi_domain.h | 10 +++++++
 lib/sbi/sbi_domain.c     | 59 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index b35ea99f..2471df48 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -358,4 +358,14 @@ int sbi_domain_finalize(struct sbi_scratch *scratch);
 /** Initialize domains */
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
 
+/** Notifier callback */
+typedef void (*sbi_domain_notifier_fn)(const struct sbi_domain *dom,
+                                      void *priv);
+
+/** Regitser domain notifier */
+int sbi_domain_register_notifier(sbi_domain_notifier_fn notifier, void *priv);
+
+/** Unregitser domain notifier */
+int sbi_domain_unregister_notifier(sbi_domain_notifier_fn notifier, void *priv);
+
 #endif
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 747c346c..99f201cf 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -36,7 +36,65 @@ struct sbi_domain root = {
 	.fw_region_inited = false,
 };
 
+struct sbi_domain_notifier_entry {
+       struct sbi_dlist        node;
+       sbi_domain_notifier_fn  fn;
+       void                   *priv;
+};
+
+
 static unsigned long domain_hart_ptr_offset;
+static SBI_LIST_HEAD(domain_notifier_list);
+
+int sbi_domain_register_notifier(sbi_domain_notifier_fn notifier, void *priv)
+{
+	struct sbi_domain_notifier_entry *entry;
+
+	if (!notifier)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(entry, &domain_notifier_list, node) {
+		if (entry->fn == notifier && entry->priv == priv)
+			return SBI_OK;
+	}
+
+	entry = sbi_zalloc(sizeof(*entry));
+	if (!entry)
+		return SBI_ENOMEM;
+
+	entry->fn   = notifier;
+	entry->priv = priv;
+	sbi_list_add_tail(&entry->node, &domain_notifier_list);
+	return SBI_OK;
+}
+
+int sbi_domain_unregister_notifier(sbi_domain_notifier_fn notifier, void *priv)
+{
+	struct sbi_domain_notifier_entry *entry, *tmp;
+
+	if (!notifier)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry_safe(entry, tmp, &domain_notifier_list, node) {
+		if (entry->fn == notifier && entry->priv == priv) {
+			sbi_list_del(&entry->node);
+			sbi_free(entry);
+			return SBI_OK;
+		}
+	}
+
+	return SBI_ENODEV;
+}
+
+void sbi_domain_notify_all(const struct sbi_domain *dom)
+{
+	struct sbi_domain_notifier_entry *entry;
+
+	sbi_list_for_each_entry(entry, &domain_notifier_list, node) {
+		if (entry->fn)
+			entry->fn(dom, entry->priv);
+	}
+}
 
 struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
 {
@@ -650,6 +708,7 @@ int sbi_domain_register(struct sbi_domain *dom)
 			return SBI_EALREADY;
 	}
 
+	sbi_domain_notify_all(dom);
 	/* Sanitize discovered domain */
 	rc = sanitize_domain(dom);
 	if (rc) {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
