Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B648EC79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXyo6DzTTYRrVzKbFnS2qgpTHfUdQGEm+L+uvfLkKQI=; b=lGU7+7S1u+7plh
	zkwebYmBKltLqInnRT0IAG4Le0hAqRjkXBKp+OFjND2S1iT3aHLipcCzNIKQ7vbGSx3Euz9gPVFNi
	QlsZi925rhC9sV1CMQIyuqZMd2Hass8caIp0I6zHoInAaB/OHkvT+1cCNIlxifRd18dYkOf5oUVY8
	Qze6dXEOJzM/Y/SBR1QZyBHPzQ78DSJhotF7mD4WlwmMuEcRVdfVMFLrsTVS+L3FRqVQQDkiSykch
	cwoMfblfNUDl5C+FAwM05Y0JbeL+gGhgLe6mVPn+eRctsqC4ufy1Zr6NYWl6U9EnVpAOG9Z3We+GH
	TR8/AkpI+uwFQmjqYwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PSr-0000000CrB5-3XBx;
	Wed, 09 Sep 2026 21:04:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PSm-0000000Cr9B-1s3t
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 21:04:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JI6uL2363660;
	Wed, 9 Sep 2026 21:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2gwG0OBOigV
	H49kJ8C+DRiycKflbCvtULgm3J8UE+GQ=; b=k7ssoAKsWE2NfZcN/emMhgS5QOi
	o51W3OTjRrrKNNw3grn+c0VqAjR8OQeznGxlZIrmpQNE5A16nq83Y55PnSwrANNe
	6K+DZs0Y+veWCuTcuxsuUW2Dm3QjE7AbMohtKQ/lvUF8Enl/QMoM79J+elOQUkmS
	SLykDfBQrvt7MZ43cEh+mRaOgf1EoLn6cp5Q4OVP642nWkBqMgWpIZuxYy1LlGlN
	CY1xli+Rd61WAQ3TxhfIlFC6i87JNnnKp9djSXXMQTR69RKjVX9Tdqds1XnVGAvD
	FnPRfaaKIt87icl7HCnn/NXW+qOP14QJ31QUAmwg7z17oPOLSmLXiTy2fWA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydrm3p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:04:10 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 689L00783993448;
	Wed, 9 Sep 2026 21:04:10 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 689L49ds4000502
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:04:09 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id A605A216BB; Wed,  9 Sep 2026 14:04:09 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 1/3] lib: sbi: domain: add domain registration notifier infrastructure
Date: Wed,  9 Sep 2026 14:04:05 -0700
Message-ID: <20260909210407.3524619-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909210407.3524619-1-pawandeep.oza@oss.qualcomm.com>
References: <20260909210407.3524619-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa1c9ca cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=Wfo4nuPocUaWA4cd95wA:9
X-Proofpoint-GUID: 7PN6x6oAdd-iFczlH5bCE1c1Cobajq5F
X-Proofpoint-ORIG-GUID: 7PN6x6oAdd-iFczlH5bCE1c1Cobajq5F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNSBTYWx0ZWRfX8OVLNO1KDo1d
 XU38ewJOtyNRY4BZVbps3E5UDraTEOSas7iJ5ejM2oCkP2mZ1h/AbPpWbtQBdqoUzTbL4IonJfS
 FYNmts1MQIN88urNGOPJFXmBoM2djuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNSBTYWx0ZWRfX/1zhJblYwhRD
 i781pMcJvSX/VqrwxaW2H8XcFEjYTc3DA6tkmdv15EKZ4y7Hb0CmE6FFnOO38wdIMD9ERtakyF6
 0nG4cXDerJ4wvo++lRqb9sgKlCXWrzPJReKfrQk6K1HOHAkhN378mze7Huem09WKpzPZR21VVlw
 yFp3Ij48DYc30CDpCR+X8Nuc2oZ7bad+x6CA8FdDnjUwhMpLt5VHKO/P8OHF195I8iG5WPjX54/
 5q1Zg/AWTjH1jd+uZud6tFVFSTtBV994fUuKKYR6HDp13ozTh3k1/ZHyRRezAJpAOODURdbcmXc
 yYjX67dZqV+nwkLJsq9jOGg2xBS2BoIW377LIJFnvKz1MU0ODaONR2tjmr0Dpq6j3ip8aLgAzjk
 OkPo8HViup3steY5TNCLf6gSylBT94halmyTxqWam+/8RHDENwuT5UwDW0TEI8DmXpx35tpFqZ+
 D8g3ftwZS9p3c4owaNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_140412_491670_44235CA2 
X-CRM114-Status: GOOD (  13.23  )
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
