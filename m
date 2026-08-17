Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1218C5DF7D
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXyo6DzTTYRrVzKbFnS2qgpTHfUdQGEm+L+uvfLkKQI=; b=D/0g0vYDLxV+wv
	uR+y8izbMK9fmfmIb6cVTpN+FtCvSc+HuHJShrmqFCGXg/pEmSeQx7x1jAcui93Mzmv9Ks46bUqHF
	78nYqRcJayzFj7tnlci7bZkzEgYcMYNrnA4zMOjJmIu+WxaDIHG6OOE7fawa4rkEbLglNYEbRCpCB
	AnYhEQrOTN51P8GlEZHF9p14xAR0xUhbIbQZO8/EnKxm34NIyX6DZguDJchPAN+9QJOvaPUk+Z4k5
	NdmElTPFOce519daeHTi5tmX6rAOqRB05RBK+XhQaCVkjL7GoGNH6c0iAzqaPMwjD99tbMI5Iz3y2
	9K875Q8G6Z39zp7VyxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I7-00000006jcC-3wGu;
	Mon, 17 Aug 2026 19:46:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww3I4-00000006jZb-2xBZ
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 19:46:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIRYgG1909583
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2gwG0OBOigV
	H49kJ8C+DRiycKflbCvtULgm3J8UE+GQ=; b=Z6sdFyJKRNninN29GkeX2cS4DTy
	6h1gtz3aqJKAQqjjApS5c7/kl7Kn66WNm/6Xqs1BK/BVogK9H0a3w+eJWyRDlOCR
	UDrMiFE/d1+P5SLtBylKERCtaDb+5OmUlB3ObJXk/6VK6g5vbvVbi9/DZWMsfzcc
	m5tV/FArP2R4LSGk19PJl+wB/EB5YmH49dDGg3ewE5SIUMhHgUdAA/QJT6Myp9cy
	9yWXXDApSZjXHaw6lwxvmfz7HCJ9thAhTaOP7wsrXGXp9wQkrUO08jC10KTG5bbV
	rfXBY5uxNzsgsPSvECMRHCIvJqmH3rhTOjc6Kska86bOJE4jMuHEpI1vtKg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke34d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:35 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HJkWoe004105
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6jxjjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:34 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HJkWks004100
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:46:33 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 67HJkX7M004120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 19:46:33 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id A538C217BB; Mon, 17 Aug 2026 12:46:33 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 1/3] lib: sbi: domain: add domain registration notifier infrastructure
Date: Mon, 17 Aug 2026 12:46:29 -0700
Message-ID: <20260817194631.3723725-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817194631.3723725-1-pawandeep.oza@oss.qualcomm.com>
References: <20260817194631.3723725-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE1MSBTYWx0ZWRfX372ieadZp8y6
 7bdd1O5CxRUwc/gzjECiHZ0MNvvo2RU/aKgLMs9NqxOZD1uvXHsQksany3/TesBAqdf8jRapwrY
 PrgsHW9WayuVrMu13Q/FRsWv7zIEWrcu7pfrZXAo3VBzo1mDPMkiC5G5JZ3wI98yUh3pld1rcjr
 f6WFoJhsdICP/B7aDhkayqJbO6vE+maVUck7niqCd+D8bpMCkCzWE5FevoSsdoD2sKR9mSJOlQp
 Yyd0wobu7RWZoPb0xzDTJqWu/ShtLT84Iv0XnyZ7Jj2Ahl3nzCVSZcY6mLxbIKyVQMosN22BaME
 C+tbzvmm5vopRUn3MgpdXTL7JA/sbUFCvPXvKbyXVb2jjVcedO5+dzjpNEkjp5AVH7xStCtPkOL
 mSLrrxv/ldGX/+9DPXnHUTERIbPnzuWbEnwKvh2rgoyz7KL6doS3EocnJ2fSUCS93CGprE5e7Xt
 jlzfm7ijNkmhoCAMWTQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a83651b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=Wfo4nuPocUaWA4cd95wA:9
X-Proofpoint-ORIG-GUID: RDExcgBC5xyoJ5qpH_bL-xFwlo37yA_j
X-Proofpoint-GUID: RDExcgBC5xyoJ5qpH_bL-xFwlo37yA_j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE1MSBTYWx0ZWRfX/PM0MUG3hqR/
 HTqJVKZuxYpy3kRIoRfPF39LR+0GGNGXKfw7NAIcaIUSQY8mGr9knaWNThmrSVchg0NwQHHsLTJ
 l1BPT0Ir5zQWBaxU9hGUpcbBUm5gx2I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_124636_911836_71E2640C 
X-CRM114-Status: GOOD (  14.76  )
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
