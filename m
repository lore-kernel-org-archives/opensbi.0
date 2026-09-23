Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB29AC982FA
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LccJQZE/A1fM1Fl4V4eHg9XsXrwBtnXT8lCo+0T7CpM=; b=tnQ+EEJ6pqD25h
	lYFCmKBsvdFohHZ0qXG8Z51fyXOe1yJdi+yBL2xYBWYW4KtEC8Cx0hpiSJ3KkUeceFvj1nPjFn9ur
	b0spjMaB25TPR7uQQZNhAJz2AUAwx/8tPSYd3E6Is4DpTmcBJhrYNlArjS1fRDriIM8hv795LPhWp
	mpcM21epJLW5lcqcjjJDl3YG+GnuBGIHHTkpN33M2ugSuLyt7y5Bn1G8IBwiZVoNx/Lu6bhkwycEh
	Kv6cc+IxFz7c3TDhnKluOKGao6vK+eyKEW3aGQqBSdGmgkuH0Tug3OlHazIhDJQj+sZUM6yQ1/Uf8
	NSdsupXwJuuzGmr7/kFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Day-000000072Dd-0uQ7;
	Wed, 23 Sep 2026 03:24:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dam-0000000724N-48Iv
	for opensbi@bombadil.infradead.org;
	Wed, 23 Sep 2026 03:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FSeO/Qhvdsoie1dX/64khs/LKuKWNKX2lKkrqOTOqoI=; b=g0gmZF45RMwG8Y4OwOCmpZ+aeq
	ddSE02asyDoOc3PFskuJVvkjXOpinxiqWrITIM99zVU8mGnBjw25A/PAphitEk4Nm9WwBbW3ULCZs
	VaMod4qRUqeqL3FnpzMfQrKbw0HqK+HHRL6kQ5UeK2h1xbg3GNCY07jfL6SDdNWgypEEPGRsynkHP
	tjn+rAN8ClCHczFD7FKTcnP7ggTuxlwYgmaXKMlgFJ7RLAZu8E8y+b6v4Be3FQC6tkZbMrbTrt0+D
	VcBHItoNaLo58y9rmISShnXLMs07ag0IiglatZiRYA50r3S/aUXTEornByDAbkIYZII/v8WxjhGWA
	ngzLRm8w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Daj-0000000EJco-2gke
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72RA2033271;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSeO/Qhvdso
	ie1dX/64khs/LKuKWNKX2lKkrqOTOqoI=; b=TM0zqRIfmFC4ur0LopyMeCbE++Y
	MahSAekn5BbqJUUZVPBZBBE5dTzqRon5SzaG0pkpkQfhffNXeRa/IIrBVd1AFVmk
	S9UTH70Sld8EJUSzvjk34oknaOUY3YeP3duRh1mcb/7OZc2beiDa6fv7VQlqY23g
	8zCYO6hLaC+qzfZmzeSl4VpFln6l1UZPWX8poUv9EswWjdV3xSDmx1sDnMcT2RKF
	UQewxhy444eqNDesH3Ng0FVlOZkoqtZWfhjK5tN5LAn6MQTlXgnesRnqMuUrRV4l
	/5wIW6zOWQrYp/6xgEMzp98MiEGp6w6OiSbJwUqwYDwrYC2kkRX25NIdMXQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c27qu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2wC015896;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O29n015972
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:02 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 27108249A7; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 11/11] lib: utils/mpxy: Use domain notifier for deferred creation of MPXY RPMI
Date: Wed, 23 Sep 2026 08:53:59 +0530
Message-ID: <20260923032359.4041876-12-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXwAOK0gnWnFYx
 GhQblgNM1PuVJbI4cu4NzwVO6yfB4sdYT9YKqy6UFgIdbBiTuyT0MuqEETaxQ2Mpl/M34ecUfpp
 iGRCFiC1uQQLeXIkIfpIKVNbBUKX5kPSQP7Pq62XUsw3dAK5zUiECb8j/UV1qHhaPQME1Y7vXTG
 nw9W3VpX+LI9iVeBoEY/flp0VlbK1IPxFNd7t3upvNlzcejqMcY0jPvRuueDC2IPVAOLrRcCfJz
 Bc5ISy//OG24pBViwW680MJad2HvP0T0LeGNj5wyXjUeYuLou1OgyNcGiQVhTuS7zMyqLKcGlOP
 fGydREL842nGLMwdKSStf5s4qwbpr2SbqeJXs6FaopIJfyHNtRKOf3mNOUeAe/FNY0w9kT7/B3R
 gK+6vRKDYcOTsZh4GkMwJpE9OPlfNNkWin49EnVPOSMMscil7Hqp2K+z8yVnauLUUpigd/62frQ
 IMUiQZxHdjm7Uqf7VOQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=ycQkslR-TVuXbAGIG9kA:9
X-Proofpoint-ORIG-GUID: vq74ermhHE3jVEspO1gb7OqO4AW0kEax
X-Proofpoint-GUID: vq74ermhHE3jVEspO1gb7OqO4AW0kEax
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX0sUi4F0jVA5+
 2X7p8J112PCUOHI0Qmj+sV+IEfxqTONmWjeYMJRGdo2re+Vk/o3TaMZrJm7hl4y+mippW0dWmCm
 k6AobdSzAaf6eMFnCtMTwDtB0JmQoNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_042418_164374_118727AC 
X-CRM114-Status: GOOD (  18.92  )
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

The owner domain may not be available at the time of creating MPXY RPMI
instance so use domain notifier for deferred creation.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi.c | 106 +++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 5 deletions(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index 69fd608a..4340b953 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -384,20 +384,92 @@ fail_free_client:
 	return rc;
 }
 
+struct __mpxy_rpmi_defer_init_priv {
+	const struct mpxy_rpmi_data *data;
+	struct mbox_chan *chan;
+	u32 mpxy_channel_id;
+	const char *dom_name;
+};
+
+static int __mpxy_rpmi_defer_notif(struct sbi_domain *dom,
+				   enum sbi_domain_notify_event event,
+				   void *priv)
+{
+	struct __mpxy_rpmi_defer_init_priv *ipriv = priv;
+	int rc;
+
+	/* Do nothing if domain name does not match */
+	if (sbi_strcmp(dom->name, ipriv->dom_name))
+		return 0;
+
+	/* Unregister notifier */
+	rc = sbi_domain_unregister_notifier(__mpxy_rpmi_defer_notif,
+					    SBI_DOMAIN_NOTIFY_EVENT_REGISTER, ipriv);
+	if (rc)
+		return rc;
+
+	/* Create MPXY RPMI instance */
+	rc = __mpxy_rpmi_init(ipriv->data, ipriv->chan, ipriv->mpxy_channel_id, dom);
+	if (rc)
+		return rc;
+
+	sbi_free(ipriv);
+	return 0;
+}
+
+static int __mpxy_rpmi_defer_init(const struct mpxy_rpmi_data *data,
+				  struct mbox_chan *chan, u32 mpxy_channel_id,
+				  const char *dom_name)
+{
+	struct __mpxy_rpmi_defer_init_priv *ipriv;
+	int rc;
+
+	if (!data || !dom_name)
+		return SBI_EINVAL;
+
+	/* Allocate defer init private data */
+	ipriv = sbi_zalloc(sizeof(*ipriv));
+	if (!ipriv)
+		return SBI_ENOMEM;
+	ipriv->data = data;
+	ipriv->chan = chan;
+	ipriv->mpxy_channel_id = mpxy_channel_id;
+	ipriv->dom_name = dom_name;
+
+	/* Register notifier */
+	rc = sbi_domain_register_notifier(__mpxy_rpmi_defer_notif,
+					  SBI_DOMAIN_NOTIFY_EVENT_REGISTER, ipriv);
+	if (rc) {
+		sbi_free(ipriv);
+		return rc;
+	}
+
+	return 0;
+}
+
 int mpxy_rpmi_no_mbox_init(const struct mpxy_rpmi_data *data, u32 mpxy_channel_id,
 			   const char *dom_name)
 {
-	/* Create MPXY RPMI instance without mailbox channel */
-	return __mpxy_rpmi_init(data, NULL, mpxy_channel_id, sbi_domain_find_by_name(dom_name));
+
+	struct sbi_domain *dom;
+
+	/* Direct/Deferred creation of MPXY RPMI instance with no mailbox channel */
+	dom = sbi_domain_find_by_name(dom_name);
+	if (dom)
+		return __mpxy_rpmi_init(data, NULL, mpxy_channel_id, dom);
+	else
+		return __mpxy_rpmi_defer_init(data, NULL, mpxy_channel_id, dom_name);
 }
 
 int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	const struct mpxy_rpmi_data *data = match->data;
 	struct mbox_chan *chan = NULL;
+	struct sbi_domain *dom;
+	const char *dom_name;
 	const fdt32_t *val;
+	int rc, noff, len;
 	u32 channel_id;
-	int rc, len;
 
 	/* Request mailbox channel when available */
 	val = fdt_getprop(fdt, nodeoff, "mboxes", &len);
@@ -430,8 +502,32 @@ int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *mat
 		goto fail_free_chan;
 	}
 
-	/* Create MPXY RPMI instance with mailbox channel discovered from DT */
-	rc = __mpxy_rpmi_init(data, chan, channel_id, &root);
+	/*
+	 * The "riscv,domain" DT property is optional for MPXY RPMI
+	 * for MPXY RPMI drivers so if this is not present then assume
+	 * root domain.
+	 */
+	val = fdt_getprop(fdt, nodeoff, "riscv,domain", &len);
+	if (len > 0 && val) {
+		noff = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
+		if (noff < 0) {
+			rc = noff;
+			goto fail_free_chan;
+		}
+		dom_name = fdt_get_name(fdt, noff, NULL);
+	} else {
+		dom_name = "root";
+	}
+
+	/*
+	 * Direct/Deferred creation of MPXY RPMI instance with optional
+	 * mailbox channel discovered from DT
+	 */
+	dom = sbi_domain_find_by_name(dom_name);
+	if (dom)
+		rc = __mpxy_rpmi_init(data, chan, channel_id, dom);
+	else
+		rc = __mpxy_rpmi_defer_init(data, chan, channel_id, dom_name);
 	if (rc)
 		goto fail_free_chan;
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
