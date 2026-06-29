Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CE8C43458
	for <opensbi@archiver.kernel.org>; Mon, 29 Jun 2026 18:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ih0fXxoeFUk1mOijWF5dDEeu0W7j0/92YWvx1pneJTI=; b=ZF3VhHYZAdPifl
	ItLgvzclQ2tCOg62/Ffj3NKtbWEJ6oY6C1tslwKfNyHdstcjA9SBTUYOWA2HkJ96XzNPIO3+WvClN
	6PJUsH7yL6Extsn5PYkIMVi+JC9zPLPqifjcfCEq+5Q7zH6rBH60BNCFq6oK8L92gKLvHJtv0DaWo
	mpRYboBwPqg49KiN42fQB6NjBMtammEZAZDkW434mWk105MgCinmAMN4i4x8sQlh7pO98VjKibpLC
	e9mKB4LSPapNSJS9Qa8FLbBQriGpIOSl31cMKO82sNUdoOTZe7o2SJYt97RodoDbec7CEn/wNOapG
	KwOIjvM2Blp+AhIthLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGSq-0000000FL4Z-2X8M;
	Mon, 29 Jun 2026 18:12:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weGSo-0000000FL4A-1BTl
	for opensbi@lists.infradead.org;
	Mon, 29 Jun 2026 18:12:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGKElw3406490
	for <opensbi@lists.infradead.org>; Mon, 29 Jun 2026 18:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KIOSusfQyFoDHmQGQeyZgnzYzDbd4bUUa+8
	rKVJ5DZ4=; b=EpJCA8sABz5DWxluKva+2BzGcdLCZFlnMP1I15I4SRIP5FeaH+T
	ax1eyt9x9/EoaAX6m2y+dA0SohPPbW+LqBtxrGrAH76LC49xSYYrburm6jwZSJWj
	HlH1ekGmwUrDms6xe1pYX7QxzvVFaD3SCMC4zfxNORjT7C5nuPIWQhiJeDIp7Ai1
	/VG4ByQFt61+QLeFB+QqOL7h6OLXveJHTWoGmJ8LJ2wQIxnuiWTRj6DeHzVuXlR6
	BHShQFjItA+AJeP0IpZ8D5UvOd46qwxrdbtYF9z5iQWHFvu5x3o5L+ST4jSPVgiu
	K1gTCM//8ZeEdRhW3lbmmmlNaoeM9MIsEpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq8ad0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 29 Jun 2026 18:12:08 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65TIC8nc022737;
	Mon, 29 Jun 2026 18:12:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f3ngxc75h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 29 Jun 2026 18:12:08 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65TIC7ag022730
	for <opensbi@lists.infradead.org>; Mon, 29 Jun 2026 18:12:07 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 65TIC7uV022725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 18:12:07 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 3CA2322C54; Mon, 29 Jun 2026 11:12:07 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH] lib: utils/mpxy: bind channel access to owning domain
Date: Mon, 29 Jun 2026 11:12:06 -0700
Message-ID: <20260629181206.754781-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 6sFj-u_RpMahadzK6GeyMsuehL7GPBZ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE1MiBTYWx0ZWRfX7EknMJtDMEn0
 3FoHlCUWlti+g+TLhRjGu51VaLSsRfGsDLoqju9ZPP89si2DlRGhm6pEmkvtSVMpauTS30GIAy0
 LnJwwy55Aa6MrHi9O9H2jNfvDGY8hYY=
X-Proofpoint-ORIG-GUID: 6sFj-u_RpMahadzK6GeyMsuehL7GPBZ7
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a42b578 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=p7KZXEz3gBxBHWQySC8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE1MiBTYWx0ZWRfXz8sI9Pv+M5oQ
 3ckq1+Cl/3JHayt2CHczQrTq2CcmCAsXbW2NoOJtnNbdQg+cuNlX4tZM6M9FZ2DnpwDIVSgfhmL
 yw6xe5nWltO3rfeKvHNOPjq6mepGniWtlWYT9MB7NLZ7ew2lmvbL6EvpXVvKRKIueBl/hGAqtcG
 JF7R3ec9uHN4rsAswuN2aTe9w+J1S6GJDq7evYa3NeNYN3tUWNOjUXBswM5YZ4JopOewWdZbSVj
 hA3/KQ9YhAEhqEsPWoAoesdLtMmVdT4qJQi0/bn55FVCAOtrilUtOYSXtnuq2gg7o755S8fRgyy
 PHJczS6vnucO7daxWER1uhGr8JjibuPKdmFkGfpLreKZk5g35mopEuGk05xF0SoqA5JzlI74jaR
 K5vG09E9SospbkoH+eNDPBIexDiTBMESnoDmogUqaYj+fKDH1xmC+FGLUxQZM8JKyyGd+XOyiOz
 xz5u8SP8tIqeRXN916A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_111210_325722_98C37CE8 
X-CRM114-Status: GOOD (  19.16  )
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
index ff5c6ab6..08e10dca 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -145,14 +145,23 @@ static inline bool mpxy_is_std_attr(u32 attr_id)
 	return (attr_id >> 31) ? false : true;
 }
 
+static inline bool mpxy_channel_visible(struct sbi_mpxy_channel *channel,
+					struct sbi_domain *dom)
+{
+	return channel->owner_domain == dom;
+}
+
 /** Find channel_id in registered channels list */
-static struct sbi_mpxy_channel *mpxy_find_channel(u32 channel_id)
+static struct sbi_mpxy_channel *mpxy_find_channel(u32 channel_id,
+					struct sbi_domain *dom)
 {
 	struct sbi_mpxy_channel *channel;
 
-	sbi_list_for_each_entry(channel, &mpxy_channel_list, head)
-		if (channel->channel_id == channel_id)
+	sbi_list_for_each_entry(channel, &mpxy_channel_list, head) {
+		if (channel->channel_id == channel_id &&
+		    mpxy_channel_visible(channel, dom))
 			return channel;
+	}
 
 	return NULL;
 }
@@ -222,9 +231,12 @@ static void mpxy_std_attrs_init(struct sbi_mpxy_channel *channel)
 int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 {
 	if (!channel)
+		return SBI_EINVAL;	
+
+	if (!channel->owner_domain)
 		return SBI_EINVAL;
 
-	if (mpxy_find_channel(channel->channel_id))
+	if (mpxy_find_channel(channel->channel_id, channel->owner_domain))
 		return SBI_EALREADY;
 
 	/* Initialize channel specific attributes */
@@ -397,12 +409,15 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
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
@@ -420,6 +435,9 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 
 	// Iterate over the list of channels to get the channel ids.
 	sbi_list_for_each_entry(channel, &mpxy_channel_list, head) {
+		if (!mpxy_channel_visible(channel, sbi_domain_thishart_ptr()))
+			continue;
+
 		if (node_index >= start_index &&
 			node_index < (start_index + returned)) {
 			shmem_base[2 + node_ret] = cpu_to_le32(channel->channel_id);
@@ -446,11 +464,12 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
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
 
@@ -597,11 +616,12 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
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
 
@@ -686,12 +706,13 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
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
 
@@ -743,12 +764,13 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
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
index 84b7a67d..d2d420de 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
@@ -299,6 +299,8 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	/* Setup MPXY mbox client */
 	/* Channel ID*/
 	rmb->channel.channel_id = channel_id;
+	/* Set the onwer domain */
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
