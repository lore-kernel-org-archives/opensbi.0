Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A21C4452D
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CiYvtIVbiEAtMoLp+PzHDvu/rAhNeUUxmiI2pmTg2ak=; b=HWBTN7j770mpxQ
	JmIrtrlfJgLlfIvfPFNZ9GxyHCMHlTTYF+3LtMRHmORWsGzJOtp17/DxMR59IIz+46G2qeS2i32pk
	H5K0n/Lxs8Y0ZUArsgRgbiseiPLHsAUMVTOXS1EPUjzpVWLziBuDDYDcVK/LTY34GK41Df4qdMkBH
	kRriLZ0u70jS3OEnOVZ+jq+BvOxNahtaXRzc2D0VLrM2E/RNPPsqHniM8gSon0Ua/DeG8W+B8QZgC
	9Tvp7jtWgPbhHR2hYZ6e395FogZmeP20lRUrEptEJzupxz9GzDfKy2fCusHToqxgJHOlHIe+rxLqA
	/VC3vTJk2AjHEo1VE46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmITd-0000000AUPC-0IjW;
	Tue, 21 Jul 2026 21:58:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmITa-0000000AUOb-1EEk
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 21:58:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKljq52676717
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TnxyHnLXoxh4VFMgoJxG5WBM7Vobo+Z05fD
	l/9w/IxU=; b=VkVJixg4333scF2g9B7ZqD0HO0bLZ1TtDHQBoG9CBtNWtt6OipJ
	gPiGVRUL1QArDM/1Q3Qkjnul1pYQk6oZEJCvox9t1+xhPjv4IguznGfv4QYnQ3mw
	gYlEfnzNV6xt5c70wLmnRE/f0g3H3yDvIMBOqlb1QCHwAqZ1gQdzOv1wyVznM/un
	dbV6y5flhs3oaFp1v+amNv/aUC8QvMbdjjWpuKRQLPKjr+6y/c5iLVZWRpBL5f6E
	SDcEAvYgaxDzTGoNsBk/XBpDVjpG2pEVVSGZiX6Rld/blg1LwbTaxY6AB5aMnhro
	Dyp4gTHV0VUwu7vcUUeVNJt4/jxy8rqRUXg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c42a0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:58:08 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LLw82P029623;
	Tue, 21 Jul 2026 21:58:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4fgj5xbc6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:58:08 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LLw76M029604
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:58:08 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 66LLw7EO029579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:58:07 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id C7D7B21BEF; Tue, 21 Jul 2026 14:58:07 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v3] lib: utils/mpxy: bind channel access to owning domain
Date: Tue, 21 Jul 2026 14:57:58 -0700
Message-ID: <20260721215758.695736-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5feb70 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=soZFZoyfFO9URlR6oEIA:9
X-Proofpoint-ORIG-GUID: of89z5WuFRwEjksDnc7reYufjY6umLvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNyBTYWx0ZWRfX25xkbGpYKAGc
 ll4FQkc4Wzxh4vx7XqxlZl3qMOimvEnx79gRf54EMAIGczR/CklUlpIvyij3YHN0l5QUWUkJb70
 Ip9fSTp+ICI3GN/Z7HQGJy0bSPDRB4aeme8SFbjh038+qbZ07RWJwtrQ5aqMIIsIGsldMAo5V+E
 MlcTgV4pB8pPW1e5+nf4np7F9cje29swcCUlBYtbWWsKaEnlT0/kssbP9DyRI4h+/c1jVGATQ99
 CdoyZ3efP4Mt2UurPNw8bbDCE6M5hzEql3pk3PJ3Hm9q/RfGRYw8Ck5nKDEnZUmHvjR5WRpfo/K
 5BXweDS5uLbl4aqOoL54lnsZ1dNRzp4ZtplTGcp/Rvdu3XSamGcWJy/Pb9WNCr8AqrmIbN3mQoQ
 fA+CAEhWVJ5NirWFI+7fFV21l8pBDJi6TmZBU5cuNI8ewcB4ZjFXyRj0aXJeAx30ky45M015bIa
 pzhr97PW2qEnYuru/Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNyBTYWx0ZWRfX8EDEYcRwNpss
 7F/NOTAUG3DK0Z8kBIzSBMORgaC2uWZKantBZxfrreH1i+4yXSBUjKaB3oI5pXpP3Z6JAxlXGXR
 AuXzxC2gFuQ7wroP1Nx4RQadure9ato=
X-Proofpoint-GUID: of89z5WuFRwEjksDnc7reYufjY6umLvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_145810_344483_A79828F9 
X-CRM114-Status: GOOD (  21.87  )
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

The MPXY framework currently stores registered channels in a global
list and exposes them to all callers. However, the intended model is
that each channel is assigned to a single supervisor domain at boot and
remains owned by that domain for its lifetime.

Introduce fixed owner-domain tracking in struct sbi_mpxy_channel and
make channel lookup and enumeration domain-aware. A channel is now
visible only when accessed from its owning domain. Also require the
owner to be set before channel registration.

This allows MPXY to support systems where the same hart may be reused by
multiple domains while keeping channel ownership and visibility fixed to
the domain that owns the service.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_mpxy.h              |  5 +--
 lib/sbi/sbi_mpxy.c                  | 53 ++++++++++++++++++++++++-----
 lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c |  2 ++
 3 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/include/sbi/sbi_mpxy.h b/include/sbi/sbi_mpxy.h
index 9da2791e..e7b28527 100644
--- a/include/sbi/sbi_mpxy.h
+++ b/include/sbi/sbi_mpxy.h
@@ -13,6 +13,7 @@
 #include <sbi/sbi_list.h>
 
 struct sbi_scratch;
+struct sbi_domain;
 
 #define SBI_MPXY_MSGPROTO_VERSION(Major, Minor) ((Major << 16) | Minor)
 
@@ -91,12 +92,13 @@ struct sbi_mpxy_channel_attrs {
 	/* Events State Control */
 	u32 eventsstate_ctrl;
 };
-
 /** A Message proxy channel accessible through SBI interface */
 struct sbi_mpxy_channel {
 	/** List head to a set of channels */
 	struct sbi_dlist head;
 	u32 channel_id;
+	
+	struct sbi_domain *owner_domain;
 	struct sbi_mpxy_channel_attrs attrs;
 
 	/**
@@ -181,5 +183,4 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 /** Get Message proxy notification events */
 int sbi_mpxy_get_notification_events(u32 channel_id,
 					unsigned long *events_len);
-
 #endif
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index ff5c6ab6..1007f556 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -145,14 +145,36 @@ static inline bool mpxy_is_std_attr(u32 attr_id)
 	return (attr_id >> 31) ? false : true;
 }
 
+static inline bool mpxy_channel_visible(struct sbi_mpxy_channel *channel,
+					struct sbi_domain *dom)
+{
+	return channel->owner_domain == dom;
+}
+
+/** Find channel_id in registered channels list for this domain */
+static struct sbi_mpxy_channel *mpxy_find_channel(u32 channel_id,
+					struct sbi_domain *dom)
+{
+	struct sbi_mpxy_channel *channel;
+
+	sbi_list_for_each_entry(channel, &mpxy_channel_list, head) {
+		if (channel->channel_id == channel_id &&
+		    mpxy_channel_visible(channel, dom))
+			return channel;
+	}
+
+	return NULL;
+}
+
 /** Find channel_id in registered channels list */
-static struct sbi_mpxy_channel *mpxy_find_channel(u32 channel_id)
+struct sbi_mpxy_channel *sbi_mpxy_find_channel_any(u32 channel_id)
 {
 	struct sbi_mpxy_channel *channel;
 
-	sbi_list_for_each_entry(channel, &mpxy_channel_list, head)
+	sbi_list_for_each_entry(channel, &mpxy_channel_list, head) {
 		if (channel->channel_id == channel_id)
 			return channel;
+	}
 
 	return NULL;
 }
@@ -222,9 +244,12 @@ static void mpxy_std_attrs_init(struct sbi_mpxy_channel *channel)
 int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 {
 	if (!channel)
+		return SBI_EINVAL;	
+
+	if (!channel->owner_domain)
 		return SBI_EINVAL;
 
-	if (mpxy_find_channel(channel->channel_id))
+	if (sbi_mpxy_find_channel_any(channel->channel_id))
 		return SBI_EALREADY;
 
 	/* Initialize channel specific attributes */
@@ -397,12 +422,15 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 	struct sbi_mpxy_channel *channel;
 	u32 channels_count = 0;
 	u32 *shmem_base;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	sbi_list_for_each_entry(channel, &mpxy_channel_list, head)
-		channels_count += 1;
+	sbi_list_for_each_entry(channel, &mpxy_channel_list, head) {
+		if (mpxy_channel_visible(channel, dom))
+			channels_count += 1;
+	}
 
 	if (start_index > channels_count)
 		return SBI_ERR_INVALID_PARAM;
@@ -420,6 +448,9 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 
 	// Iterate over the list of channels to get the channel ids.
 	sbi_list_for_each_entry(channel, &mpxy_channel_list, head) {
+		if (!mpxy_channel_visible(channel, sbi_domain_thishart_ptr()))
+			continue;
+
 		if (node_index >= start_index &&
 			node_index < (start_index + returned)) {
 			shmem_base[2 + node_ret] = cpu_to_le32(channel->channel_id);
@@ -446,11 +477,12 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	int ret = SBI_SUCCESS;
 	u32 *attr_ptr, end_id;
 	void *shmem_base;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id);
+	struct sbi_mpxy_channel *channel = mpxy_find_channel(channel_id, dom);
 	if (!channel)
 		return SBI_ERR_NOT_SUPPORTED;
 
@@ -597,11 +629,12 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	struct sbi_mpxy_channel *channel;
 	int ret, mem_idx;
 	void *shmem_base;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	channel = mpxy_find_channel(channel_id);
+	channel = mpxy_find_channel(channel_id, dom);
 	if (!channel)
 		return SBI_ERR_NOT_SUPPORTED;
 
@@ -686,12 +719,13 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 	struct sbi_mpxy_channel *channel;
 	void *shmem_base, *resp_buf;
 	u32 resp_bufsize;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	int ret;
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	channel = mpxy_find_channel(channel_id);
+	channel = mpxy_find_channel(channel_id, dom);
 	if (!channel)
 		return SBI_ERR_NOT_SUPPORTED;
 
@@ -743,12 +777,13 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 	struct mpxy_state *ms = sbi_domain_mpxy_state_thishart_ptr();
 	struct sbi_mpxy_channel *channel;
 	void *eventsbuf, *shmem_base;
+	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	int ret;
 
 	if (!mpxy_shmem_enabled(ms))
 		return SBI_ERR_NO_SHMEM;
 
-	channel = mpxy_find_channel(channel_id);
+	channel = mpxy_find_channel(channel_id, dom);
 	if (!channel || !channel->get_notification_events)
 		return SBI_ERR_NOT_SUPPORTED;
 
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
index 84b7a67d..825ac9b3 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -299,6 +299,8 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	/* Setup MPXY mbox client */
 	/* Channel ID*/
 	rmb->channel.channel_id = channel_id;
+	/* Set the owner domain */
+	rmb->channel.owner_domain = &root;
 	/* Callback for read RPMI attributes */
 	rmb->channel.read_attributes = mpxy_mbox_read_attributes;
 	/* Callback for write RPMI attributes */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
