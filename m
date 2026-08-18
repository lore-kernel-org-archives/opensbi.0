Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957B4C5DF7D
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 21:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXyo6DzTTYRrVzKbFnS2qgpTHfUdQGEm+L+uvfLkKQI=; b=Xu0/T/NfxHvyMj
	Q8pdl1bSpf6oLXKWLdFVVQEsgRueXi0z4hnNUwKCcY8IXSrErqkvzbmUUUBqJFZHi/j/s7vHjGlZ1
	o596a9oZLslQM0WYtRlSpVehavg2DaDKo0HjhEj7RpMGzGUASPP8b5uxNLjcTmlwBVqK4k+ML5etK
	4HqoBG5fYcijjnI4xQfSMDJQzkCU8dhahmF3Dji2JNK+YY3atN+gZCECoJrpDvk5LsBJmu81UYzxz
	gDu3ru8wAqlGQmJshlm5n8atO6KAnPTDkzLnOKW/OA1PwNTBBeVdQmI6w29D8dhRs3Unwp+chhz5N
	bPESanyqFFYE6BIRjh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRQA-00000008g5B-1wh9;
	Tue, 18 Aug 2026 21:32:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRQ6-00000008g3L-49Vt
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 21:32:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IJZdQO2169034;
	Tue, 18 Aug 2026 21:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2gwG0OBOigV
	H49kJ8C+DRiycKflbCvtULgm3J8UE+GQ=; b=MTTJSZSPLFnezbzKxFTEJE4/pEh
	ZI5XF//0LNvdpEtAVDghFopBZMpnghCI/VhAf9L5BhaaADMX8wcNXBbPro4Ntfon
	zB/8Z1bcrZuE4HpNj2lG9zZRC0a2vJsaEwJ7YzLR2QWcJ2qZDhMPC7+zX+L7+Rz0
	n1yRNYXZXfXrQXYE7Fu14WvPYrInjUoYvRFRYawC0Sp5STHBBkCq6e42Z3Bi3x10
	VYwgrg2KQLisFLRSPHyhMPUHAwO/3Peg6/g+npJfU1X+mggYFVV6QvUqMVlT5DJ2
	HBpyEcS2p+zgRXo59uO/JP92WbYjr1ZwsfiwhtWzcS7ulvh4u1YMDQMFIdQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb1b13j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:32:28 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ILKCIo000722;
	Tue, 18 Aug 2026 21:32:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4g4b7y3md6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:32:27 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67ILWR1U018404;
	Tue, 18 Aug 2026 21:32:27 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 67ILWRHE018400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:32:27 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 6545D217BB; Tue, 18 Aug 2026 14:32:27 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
        Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 1/3] lib: sbi: domain: add domain registration notifier infrastructure
Date: Tue, 18 Aug 2026 14:32:16 -0700
Message-ID: <20260818213218.875883-2-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818213218.875883-1-pawandeep.oza@oss.qualcomm.com>
References: <20260818213218.875883-1-pawandeep.oza@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE1OCBTYWx0ZWRfX65otqc/y2EFQ
 +Wnq2hQKTHkvfDGFQrWFnSSK/MWNPrKMIaTYfdlMY8s5esmbf6ZYrjLKEJl2rh8OobPwABy3sfY
 OSE5CnB0JrRWraqrko08k7gy/cVU4cJTIm3K/EGuAcAlhFyh4hnGBfnc8/3/S2NHhUHZV/8D8Qy
 Ca796Qs4ulQmZvYS3wiwc/FsazyiJc1Aow9nRbgOBpCW1qDRiBOpx0PAsidScJqnNvOxvoJDZ7k
 IQrQKIFDeW2CImwfnKfkbz+S95PzsiEEGknjFWF3GxBzKwnbVT0AFXyESrH93s7IIiULbp6mdGA
 LMu4wB/GpkUQaTqWBLdSa++OuHK4cY/a+KV903Q2p3giEPeFQnS04KDbV8GQjxPCY0jVriK4i58
 i0AFYMG7Fql9+5VEmNrsti0NIlRexdjYkhlDcmx7WQgHQJnqSpUrXlfx8q2PHF4qI7CaDN4rioi
 qK1ujvk030LJgqEYuvA==
X-Proofpoint-GUID: hx3o7zg6iVAnOWqLbPdBLlmZpiEgxoDk
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a84cf6d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Wfo4nuPocUaWA4cd95wA:9
X-Proofpoint-ORIG-GUID: hx3o7zg6iVAnOWqLbPdBLlmZpiEgxoDk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE1OCBTYWx0ZWRfX6tnNOceb2EUW
 FgXqkwxoQVNubTruhVmC7XzLk8hWmiIqLgtZBdRYd5eL+rdMRJ541sRPVVBb1ghvR7KOMh9JDvI
 1vsL3x2ApCYMZJbc89rMbj44dh1Yw6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_143231_143483_E20F0BF4 
X-CRM114-Status: GOOD (  14.00  )
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
