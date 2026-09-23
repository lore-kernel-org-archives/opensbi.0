Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97C0C98302
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qMx2nk+1IRXfPzEU6PdUjYJ29AL8Lopt7OLPx6fBQ0=; b=KsrATmjNiXiCjO
	A6gOiuvqxQ7zqDbu4nUaeiIsXdm+Qks4N3TpJ+qBj7anTAcE3H7mwGOLZ5n92jZx7uYdgWQ1U7GuM
	HxQZsK8/6ODAY6/jf0MezQqr/XjCHWhdVrXPzqpqBUl3oq9JWcV5OoVLb1FWBfY0GJ16U3fyG0/Up
	1OUAH2WXDf+3zECClvOv1xBXwYDGJCM3G1fZt1zw85+LcB4XZIushYpICJj/m80iDcmktKEqfiAlL
	/iy916s/qRBh+PJUbOft9UBLAC0wHSe0NYfMy2DanTrMEuoJFo0iKjP4gm0vW7ImMhuCIJCJpYvG3
	SfQ+0cn9jV63akOaFybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dai-0000000723E-096y;
	Wed, 23 Sep 2026 03:24:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dac-000000071zl-1Zjd
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXN3U268290;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CfkhdOhMOmG
	Exd5SXSsrXusaea+Cfvb3g997n0MMa+E=; b=BgqC05Tw4mg5BifhJkQ2jDTpWVs
	yRuDFfVVPfszaxUrxiXBhCvIT/+YcyKEW3MOHOYPvCHdVnSH2N9pzO0f4NQHwO76
	EZkMXx75mwznpFz4Vu3OY9UVIZLEx9FGcYKP+syaXXCaj/7ltU5BX5aWH6Yqzhwt
	jlrFQ8s9aPPfagAfz+3MM0l8Ylbud/lfs0c16fIqi8AXexPMAEgnRPAyP4LazFO7
	00cQIicoM43kLnSxe2Zkh2BoBSx0xOZmKD5O16S9DWN7/xqFkrIBnk0kGZj4SngZ
	+tR13/9ITDjXs6rZrbS2kt5Y0SDXIF9Bld56eUfVZOqlXNX7V6YNS3ekdxg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1xjm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2J1016003;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O2Bl015967
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:02 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 237AB249A4; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 10/11] lib: sbi_domain: Add domain notifier infrastructure
Date: Wed, 23 Sep 2026 08:53:58 +0530
Message-ID: <20260923032359.4041876-11-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: e6XcBLAMkiOfJozG66JTnMMoZ4OPDJHI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXwUnk7CXtaVrP
 zLgQ6amifGdp05abyhjXHBSPbqCaxBq6CdqdcXGy375Bc20QB/n6HQ35EK0uljcFiWne83kxiMB
 gzM/MLC1f1jFv1dJtB3K3idi0zz5PKM=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=oQeJ2WtW1ex_Upc5PeoA:9
X-Proofpoint-ORIG-GUID: e6XcBLAMkiOfJozG66JTnMMoZ4OPDJHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXznD6i/pQaeGm
 CZoCjxNLWBuTLmWnBGMqF+JRTm4qSM4HHQY76INIhiXx/s8x94yI+XkMnfbVnjL7aDzVzVq+z2A
 3eVki4o9/9EaN9DvoCEFhUVweHnOo3CbclcdHbV+laAjTNdWBz26vmtzQVglKIHDOTWCAsn4HlU
 UqsnzxmZCBq4vsyq3qKGo7vn7hG58fmgjl9lqwQ49huauIp+kLAL9yMkSvS3Xv41fhx5BcSXztm
 PaufZa1kDP/57U2PNk8gf6O1Flni7O+FSfDL4v4qAVe8F/v6nHIrLkXC2LugYaoGHAuNFD2aeT9
 +gHbIRUsoa4z++Qop750QfGmCQ1PnDgOu5nY29b/Zu6MIUoKjhH23RhVqULP6nJvfDBUexUaFD0
 3dW7nfILWlSAhcBeE0O6zm7yAb7SigRsA0H8eDkQsO45Xe3WhWqWKkQlEF4kTA099VrCQBcwJYg
 hD7qzcenvTgXF9gWBHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202410_616990_87D70AFE 
X-CRM114-Status: GOOD (  14.75  )
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
register interest in domain events (such as registration). Whenever
such events happen for a domain, all registered notifiers are invoked.

The following public interfaces are added to sbi_domain.h:

  - sbi_domain_register_notifier(): registers a notifier callback.
    Duplicate (fn, event, priv) pairs are silently ignored.

  - sbi_domain_unregister_notifier(): removes a previously registered
    notifier callback.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi/sbi_domain.h | 40 +++++++++++++++++++++
 lib/sbi/sbi_domain.c     | 78 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index d530f939..56a21397 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -387,4 +387,44 @@ int sbi_domain_finalize(struct sbi_scratch *scratch);
 /** Initialize domains */
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
 
+/** Possible domain notify events */
+enum sbi_domain_notify_event {
+	SBI_DOMAIN_NOTIFY_EVENT_REGISTER = 0,
+	SBI_DOMAIN_NOTIFY_EVENT_MAX,
+};
+
+/**
+ * Domain notify callback.
+ * @param dom pointer to domain
+ * @param event domain notify event
+ * @param priv private data of the callback
+ * @return 0 on success (informs framework to continue notifications)
+ * @return negative error code on failure (informs framework to not continue notifications)
+ */
+typedef int (*sbi_domain_notify_fn)(struct sbi_domain *dom,
+				     enum sbi_domain_notify_event event,
+				     void *priv);
+
+/**
+ * Register domain notifier
+ * @param fn domain notify callback
+ * @param event domain notify event
+ * @param priv private data of the callback
+ * @return 0 on success
+ * @return negative error code on failure
+ */
+int sbi_domain_register_notifier(sbi_domain_notify_fn fn,
+				 enum sbi_domain_notify_event event, void *priv);
+
+/**
+ * Unregister domain notifier
+ * @param fn domain notify callback
+ * @param event domain notify event
+ * @param priv private data of the callback
+ * @return 0 on success
+ * @return negative error code on failure
+ */
+int sbi_domain_unregister_notifier(sbi_domain_notify_fn fn,
+				   enum sbi_domain_notify_event event, void *priv);
+
 #endif
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 1c95b0fc..42fe5632 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -35,6 +35,74 @@ struct sbi_domain root = {
 
 static unsigned long domain_hart_ptr_offset;
 
+struct sbi_domain_notify_entry {
+	struct sbi_dlist		node;
+	sbi_domain_notify_fn		fn;
+	enum sbi_domain_notify_event	event;
+	void				*priv;
+};
+
+static SBI_LIST_HEAD(domain_notifier_list);
+
+int sbi_domain_register_notifier(sbi_domain_notify_fn fn,
+				 enum sbi_domain_notify_event event, void *priv)
+{
+	struct sbi_domain_notify_entry *entry;
+
+	if (!fn || SBI_DOMAIN_NOTIFY_EVENT_MAX <= event)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(entry, &domain_notifier_list, node) {
+		if (entry->fn == fn && entry->event == event && entry->priv == priv)
+			return SBI_OK;
+	}
+
+	entry = sbi_zalloc(sizeof(*entry));
+	if (!entry)
+		return SBI_ENOMEM;
+
+	entry->fn    = fn;
+	entry->event = event;
+	entry->priv  = priv;
+	sbi_list_add_tail(&entry->node, &domain_notifier_list);
+	return SBI_OK;
+}
+
+int sbi_domain_unregister_notifier(sbi_domain_notify_fn fn,
+				   enum sbi_domain_notify_event event, void *priv)
+{
+	struct sbi_domain_notify_entry *entry, *tmp;
+
+	if (!fn || SBI_DOMAIN_NOTIFY_EVENT_MAX <= event)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry_safe(entry, tmp, &domain_notifier_list, node) {
+		if (entry->fn == fn && entry->event == event && entry->priv == priv) {
+			sbi_list_del(&entry->node);
+			sbi_free(entry);
+			return SBI_OK;
+		}
+	}
+
+	return SBI_ENODEV;
+}
+
+static int sbi_domain_notify_all(struct sbi_domain *dom, enum sbi_domain_notify_event event)
+{
+	struct sbi_domain_notify_entry *entry, *tmp;
+	int rc;
+
+	sbi_list_for_each_entry_safe(entry, tmp, &domain_notifier_list, node) {
+		if (entry->event == event) {
+			rc = entry->fn(dom, event, entry->priv);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return 0;
+}
+
 struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
@@ -719,6 +787,16 @@ int sbi_domain_register(struct sbi_domain *dom)
 		return rc;
 	}
 
+	/* Notify everyone */
+	rc = sbi_domain_notify_all(dom, SBI_DOMAIN_NOTIFY_EVENT_REGISTER);
+	if (rc) {
+		sbi_printf("%s: domain notification failed for %s (error %d)\n",
+			   __func__, dom->name, rc);
+		sbi_domain_cleanup_state(dom);
+		sbi_list_del(&dom->node);
+		return rc;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
