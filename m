Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BC4C9830D
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83g73u/MpEcmvP+u+niMESQjSSGOVu7yZrfMWrXU84E=; b=DKKvWYnP4iUJ3g
	1wpPtVzgeT5CvmDagroWQO01/Vl8to05n2bxBPNxmMQLkJwDn9+aqH8IqNl1zBf7qrNKzY9APCs7A
	SDBzf24wCfUY0H1sL5AyxIm+BNnd1+iu5xzaNadNnTu5eTeDWmPFQj4Zd4L6SBzg+j1KNkG4L36YO
	v3cCS7T+8g4VIilfNxjxmNyooyYXmnlsP0fFVttEsJJ/g4Q/rMLHM5goXMpBIYkYM/duXoXLcmSgG
	hgYiL1PIIKMA3nyPO5irqfB/GtBaJlzpXomQatbQ/9vdtZsa3AQ267usNjP2VsZOm7t+RKfflr0/8
	PDehuVZSqiPOACu5Uu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dam-0000000724V-1a0p;
	Wed, 23 Sep 2026 03:24:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dac-000000071zp-2kZ0
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3Bb6t1509371;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Naq3XXBHz/I
	H4X6SwCAR43SK7Jf0ttA7JX89/76Eau0=; b=TLgc6hK+4pP0F2JHFsJEvw7mczv
	zX018LTWzzWeMTanWV7axQ0JbOxfjsnagBJIVVoG4NEbai7U0XHCoGTzxNjiUOpI
	VqP3/36jbekyJUt/41wHU2e7v9EhxKoC57BwPTueMQjcN/f3VybXvxNH0sz6DRdK
	XyBqrkrU7AZb0vvNaGXLgJ8J9o3FDIE7mQHRQAugJk6x83PGdIyRGwexYNCFQo3L
	/bGjLpxoAVRqbLY7wLFCm2xb8MZzFxhB/NjCtsobMj4kff+Mt3y5v9cku8OlAedE
	WEBY9tMNjZvTkr1VD7jh07PUODel5xzAMR2OQEZiiFHDrK3AYl+JMs9Whmg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xt936-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2Nx015889;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O1kj015848
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:01 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 03D3A21167; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 01/11] lib: utils/mpxy: Rename fdt_mpxy_rpmi_mbox to fdt_mpxy_rpmi
Date: Wed, 23 Sep 2026 08:53:49 +0530
Message-ID: <20260923032359.4041876-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: ABFMTRO4e9EbgSMnaeU46i66LTJTXJgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX9Ejbccn94dkP
 VBOVdz56igbVBuMN8oHRv43SwMNX36RjVBobznA+Aoakf9Q2np92AhBBfOcQpmLOh3hbGlewbSe
 5QRIY3/L+miZrURzJPE7iSr1yKQuGQVeciG5KdQihaQZfRZWW1LfXTEaaG3bXdkuZVcw0848lHN
 Du6f8hqkHaj59Iv40xz+KQ7CF350hsAbv1YqJCinE3XcT6uELMcNvngCCbNtDoiycxEF+5LIwOg
 zG5+FeF/9H76J2pf6SPzJYH4wfrY9srrnKF0CB9e2AA1mG+t1Nq1ljai2E5lrdhyFl6zaljy/zk
 94ZQIVq3QW4+3VorlBKUiwPsb6rz1yvykFB2BO/GaXW30gIEeMXmqH94htqp3zZA96r6u2booEO
 xJHzLutWnnTrH72+WepZM057REatmcsbMzBBbMu+L9cfC8Okzz0J743qlj1KBPfyHYAAWh+yrnC
 RsGNwtv+LOtdOj/xC+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX9FgZ6vwszjMh
 xAWi7t0e5FZ2/3cMkxzvTGF1jcFuWq+PjTSpkfOjckZiApoodqwZuBKlSnoaW5Dc2QHcYMTJHVh
 U4U4HYA9+OT9/AlsiIq2hSCOFqsgF8s=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8
 a=j5wKuVfKb0KE5SSMK6QA:9 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-ORIG-GUID: ABFMTRO4e9EbgSMnaeU46i66LTJTXJgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202411_595381_6F468071 
X-CRM114-Status: GOOD (  23.51  )
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

The common fdt_mpxy_rpmi_mbox driver is being upgraded to support emulated
MPXY channels hence drop term "mbox" from fdt_mpxy_rpmi_mbox everywhere.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 .../{fdt_mpxy_rpmi_mbox.h => fdt_mpxy_rpmi.h} | 12 +--
 lib/utils/mpxy/Kconfig                        |  6 +-
 .../{fdt_mpxy_rpmi_mbox.c => fdt_mpxy_rpmi.c} | 92 +++++++++----------
 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c          |  6 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c   |  6 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c        |  6 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c             |  8 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_performance.c    |  6 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c         |  8 +-
 lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c        |  6 +-
 lib/utils/mpxy/objects.mk                     |  2 +-
 platform/generic/configs/defconfig            |  2 +-
 12 files changed, 76 insertions(+), 84 deletions(-)
 rename include/sbi_utils/mpxy/{fdt_mpxy_rpmi_mbox.h => fdt_mpxy_rpmi.h} (89%)
 rename lib/utils/mpxy/{fdt_mpxy_rpmi_mbox.c => fdt_mpxy_rpmi.c} (76%)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
similarity index 89%
rename from include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
rename to include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
index 3a1c1177..d1f5f9ca 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
@@ -7,8 +7,8 @@
  *   Anup Patel <apatel@ventanamicro.com>
  */
 
-#ifndef __FDT_MPXY_RPMI_MBOX_H__
-#define __FDT_MPXY_RPMI_MBOX_H__
+#ifndef __FDT_MPXY_RPMI_H__
+#define __FDT_MPXY_RPMI_H__
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_mpxy.h>
@@ -61,8 +61,8 @@ struct mpxy_rpmi_service_data {
 	u32 max_rx_len;
 };
 
-/** MPXY RPMI mbox data for each service group */
-struct mpxy_rpmi_mbox_data {
+/** MPXY RPMI data for each service group */
+struct mpxy_rpmi_data {
 	u32 servicegrp_id;
 	u32 num_services;
 	struct mpxy_rpmi_service_data *service_data;
@@ -73,13 +73,13 @@ struct mpxy_rpmi_mbox_data {
 
 	/** Setup RPMI service group context for MPXY */
 	int (*setup_group)(void **context, struct mbox_chan *chan,
-			   const struct mpxy_rpmi_mbox_data *data);
+			   const struct mpxy_rpmi_data *data);
 
 	/** Cleanup RPMI service group context for MPXY */
 	void (*cleanup_group)(void *context);
 };
 
 /** Common probe function for MPXY RPMI drivers */
-int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match);
+int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *match);
 
 #endif
diff --git a/lib/utils/mpxy/Kconfig b/lib/utils/mpxy/Kconfig
index a3ed1c22..74cd3a32 100644
--- a/lib/utils/mpxy/Kconfig
+++ b/lib/utils/mpxy/Kconfig
@@ -7,12 +7,12 @@ config FDT_MPXY
 	depends on FDT
 	default n
 
-config FDT_MPXY_RPMI_MBOX
-	bool "MPXY drivers as RPMI mailbox client"
+config FDT_MPXY_RPMI
+	bool "FDT based MPXY RPMI drivers"
 	depends on FDT_MAILBOX && FDT_MPXY
 	default n
 
-if FDT_MPXY_RPMI_MBOX
+if FDT_MPXY_RPMI
 
 config FDT_MPXY_RPMI_CLOCK
 	bool "MPXY driver for RPMI clock service group"
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
similarity index 76%
rename from lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
rename to lib/utils/mpxy/fdt_mpxy_rpmi.c
index 825ac9b3..9a37fbdc 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mbox.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -12,16 +12,16 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi_utils/fdt/fdt_helper.h>
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 #include <sbi/sbi_console.h>
 
 /**
- * MPXY mbox instance per MPXY channel. This ties
+ * MPXY RPMI instance per MPXY channel. This ties
  * an MPXY channel with an RPMI Service group.
  */
-struct mpxy_rpmi_mbox {
+struct mpxy_rpmi {
 	struct mbox_chan *chan;
-	const struct mpxy_rpmi_mbox_data *mbox_data;
+	const struct mpxy_rpmi_data *data;
 	struct mpxy_rpmi_channel_attrs msgprot_attrs;
 	struct sbi_mpxy_channel channel;
 	void *group_context;
@@ -32,12 +32,12 @@ struct mpxy_rpmi_mbox {
  * MPXY message_id == RPMI service_id
  */
 static const struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
-					const struct mpxy_rpmi_mbox_data *mbox_data)
+								 const struct mpxy_rpmi_data *data)
 {
-	const struct mpxy_rpmi_service_data *srv = mbox_data->service_data;
+	const struct mpxy_rpmi_service_data *srv = data->service_data;
 	int mid = 0;
 
-	for (mid = 0; srv[mid].id < mbox_data->num_services; mid++) {
+	for (mid = 0; srv[mid].id < data->num_services; mid++) {
 		if (srv[mid].id == (u8)message_id)
 			return &srv[mid];
 	}
@@ -53,12 +53,10 @@ static void mpxy_copy_attrs(u32 *outmem, u32 *inmem, u32 count)
 		outmem[idx] = cpu_to_le32(inmem[idx]);
 }
 
-static int mpxy_mbox_read_attributes(struct sbi_mpxy_channel *channel,
-				     u32 *outmem, u32 base_attr_id,
-				     u32 attr_count)
+static int mpxy_read_attributes(struct sbi_mpxy_channel *channel,
+				u32 *outmem, u32 base_attr_id, u32 attr_count)
 {
-	struct mpxy_rpmi_mbox *rmb =
-		container_of(channel, struct mpxy_rpmi_mbox, channel);
+	struct mpxy_rpmi *rmb = container_of(channel, struct mpxy_rpmi, channel);
 	u32 *attr_array = (u32 *)&rmb->msgprot_attrs;
 	u32 end_id = base_attr_id + attr_count - 1;
 
@@ -96,18 +94,16 @@ static int mpxy_check_write_attr(u32 attr_id, u32 attr_val)
 }
 
 static void mpxy_write_attr(struct mpxy_rpmi_channel_attrs *attrs,
-			   u32 attr_id,
-			   u32 attr_val)
+			    u32 attr_id, u32 attr_val)
 {
 	/* No writable attributes in RPMI */
 }
 
-static int mpxy_mbox_write_attributes(struct sbi_mpxy_channel *channel,
-				     u32 *outmem, u32 base_attr_id,
-				     u32 attr_count)
+static int mpxy_write_attributes(struct sbi_mpxy_channel *channel,
+				 u32 *outmem, u32 base_attr_id,
+				 u32 attr_count)
 {
-	struct mpxy_rpmi_mbox *rmb =
-		container_of(channel, struct mpxy_rpmi_mbox, channel);
+	struct mpxy_rpmi *rmb = container_of(channel, struct mpxy_rpmi, channel);
 	u32 end_id = base_attr_id + attr_count - 1;
 	u32 attr_val, idx;
 	int ret, mem_idx;
@@ -132,14 +128,12 @@ static int mpxy_mbox_write_attributes(struct sbi_mpxy_channel *channel,
 	return SBI_OK;
 }
 
-static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
-				  u32 message_id, void *tx, u32 tx_len,
-				  void *rx, u32 rx_max_len,
-				  unsigned long *ack_len)
+static int __mpxy_send_message(struct sbi_mpxy_channel *channel,
+			       u32 message_id, void *tx, u32 tx_len,
+			       void *rx, u32 rx_max_len, unsigned long *ack_len)
 {
-	struct mpxy_rpmi_mbox *rmb =
-		container_of(channel, struct mpxy_rpmi_mbox, channel);
-	const struct mpxy_rpmi_mbox_data *data = rmb->mbox_data;
+	struct mpxy_rpmi *rmb = container_of(channel, struct mpxy_rpmi, channel);
+	const struct mpxy_rpmi_data *data = rmb->data;
 	const struct mpxy_rpmi_service_data *srv =
 		mpxy_find_rpmi_srvid(message_id, data);
 	struct rpmi_message_args args = {0};
@@ -194,33 +188,33 @@ static int __mpxy_mbox_send_message(struct sbi_mpxy_channel *channel,
 	return SBI_OK;
 }
 
-static int mpxy_mbox_send_message_withresp(struct sbi_mpxy_channel *channel,
-				  u32 message_id, void *tx, u32 tx_len,
-				  void *rx, u32 rx_max_len,
-				  unsigned long *ack_len)
+static int mpxy_send_message_withresp(struct sbi_mpxy_channel *channel,
+				      u32 message_id, void *tx, u32 tx_len,
+				      void *rx, u32 rx_max_len,
+				      unsigned long *ack_len)
 {
-	return __mpxy_mbox_send_message(channel, message_id, tx, tx_len,
-				 rx, rx_max_len, ack_len);
+	return __mpxy_send_message(channel, message_id, tx, tx_len,
+				   rx, rx_max_len, ack_len);
 }
 
-static int mpxy_mbox_send_message_withoutresp(struct sbi_mpxy_channel *channel,
-				  u32 message_id, void *tx, u32 tx_len)
+static int mpxy_send_message_withoutresp(struct sbi_mpxy_channel *channel,
+					 u32 message_id, void *tx, u32 tx_len)
 {
-	return __mpxy_mbox_send_message(channel, message_id, tx, tx_len,
-				 NULL, 0, NULL);
+	return __mpxy_send_message(channel, message_id, tx, tx_len,
+				   NULL, 0, NULL);
 }
 
-int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *match)
+int fdt_mpxy_rpmi_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	u32 channel_id, servicegrp_ver, pro_ver, max_data_len, tx_tout, rx_tout;
 	u32 impl_id, impl_ver;
-	const struct mpxy_rpmi_mbox_data *data = match->data;
-	struct mpxy_rpmi_mbox *rmb;
+	const struct mpxy_rpmi_data *data = match->data;
+	struct mpxy_rpmi *rmb;
 	struct mbox_chan *chan;
 	const fdt32_t *val;
 	int rc, len;
 
-	/* Allocate context for MPXY mbox client */
+	/* Allocate context for MPXY RPMI instance */
 	rmb = sbi_zalloc(sizeof(*rmb));
 	if (!rmb)
 		return SBI_ENOMEM;
@@ -285,8 +279,8 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 
 	/*
 	 * The "riscv,sbi-mpxy-channel-id" DT property is mandatory
-	 * for MPXY RPMI mailbox client driver so if this is not
-	 * present then try other drivers.
+	 * for MPXY RPMI drivers so if this is not present then try
+	 * other drivers.
 	 */
 	val = fdt_getprop(fdt, nodeoff, "riscv,sbi-mpxy-channel-id", &len);
 	if (len > 0 && val) {
@@ -296,20 +290,18 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 		goto fail_free_chan;
 	}
 
-	/* Setup MPXY mbox client */
+	/* Setup MPXY RPMI channel */
 	/* Channel ID*/
 	rmb->channel.channel_id = channel_id;
 	/* Set the owner domain */
 	rmb->channel.owner_domain = &root;
 	/* Callback for read RPMI attributes */
-	rmb->channel.read_attributes = mpxy_mbox_read_attributes;
+	rmb->channel.read_attributes = mpxy_read_attributes;
 	/* Callback for write RPMI attributes */
-	rmb->channel.write_attributes = mpxy_mbox_write_attributes;
+	rmb->channel.write_attributes = mpxy_write_attributes;
 	/* Callback for sending RPMI message */
-	rmb->channel.send_message_with_response =
-					mpxy_mbox_send_message_withresp;
-	rmb->channel.send_message_without_response =
-					mpxy_mbox_send_message_withoutresp;
+	rmb->channel.send_message_with_response = mpxy_send_message_withresp;
+	rmb->channel.send_message_without_response = mpxy_send_message_withoutresp;
 
 	/* RPMI Message Protocol ID */
 	rmb->channel.attrs.msg_proto_id = SBI_MPXY_MSGPROTO_RPMI_ID;
@@ -334,7 +326,7 @@ int mpxy_rpmi_mbox_init(const void *fdt, int nodeoff, const struct fdt_match *ma
 	rmb->msgprot_attrs.impl_id = impl_id;
 	rmb->msgprot_attrs.impl_ver = impl_ver;
 
-	rmb->mbox_data = data;
+	rmb->data = data;
 	rmb->chan = chan;
 
 	/* Setup RPMI service group context */
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
index 585c2bf3..c9e77791 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
@@ -8,7 +8,7 @@
  *   Anup Patel <apatel@ventanamicro.com>
  */
 
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data clock_services[] = {
 {
@@ -69,7 +69,7 @@ static struct mpxy_rpmi_service_data clock_services[] = {
 },
 };
 
-static const struct mpxy_rpmi_mbox_data clock_data = {
+static const struct mpxy_rpmi_data clock_data = {
 	.servicegrp_id = RPMI_SRVGRP_CLOCK,
 	.num_services = RPMI_CLOCK_SRV_MAX_COUNT,
 	.service_data = clock_services,
@@ -82,5 +82,5 @@ static const struct fdt_match clock_match[] = {
 
 const struct fdt_driver fdt_mpxy_rpmi_clock = {
 	.match_table = clock_match,
-	.init = mpxy_rpmi_mbox_init,
+	.init = fdt_mpxy_rpmi_init,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c b/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
index 6ffcb403..a2a3b99f 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
@@ -1,4 +1,4 @@
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data dpwr_services[] = {
 {
@@ -38,7 +38,7 @@ static struct mpxy_rpmi_service_data dpwr_services[] = {
 },
 };
 
-static const struct mpxy_rpmi_mbox_data dpwr_data = {
+static const struct mpxy_rpmi_data dpwr_data = {
 	.servicegrp_id = RPMI_SRVGRP_DEVICE_POWER,
 	.num_services = RPMI_DPWR_SRV_MAX_COUNT,
 	.service_data = dpwr_services,
@@ -52,5 +52,5 @@ static const struct fdt_match dpwr_match[] = {
 const struct fdt_driver fdt_mpxy_rpmi_device_power = {
 	.experimental = true,
 	.match_table = dpwr_match,
-	.init = mpxy_rpmi_mbox_init,
+	.init = fdt_mpxy_rpmi_init,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
index 1e92053d..42bb1e14 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
@@ -7,7 +7,7 @@
  *   Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
  */
 
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data logging_services[] = {
 	[0] = {
@@ -33,7 +33,7 @@ static struct mpxy_rpmi_service_data logging_services[] = {
 	},
 };
 
-static const struct mpxy_rpmi_mbox_data logging_data = {
+static const struct mpxy_rpmi_data logging_data = {
 	.servicegrp_id = RPMI_SRVGRP_LOGGING,
 	.num_services = RPMI_LOGGING_SRV_MAX_COUNT,
 	.service_data = logging_services,
@@ -46,6 +46,6 @@ static const struct fdt_match logging_match[] = {
 
 const struct fdt_driver fdt_mpxy_rpmi_logging = {
 	.match_table = logging_match,
-	.init = mpxy_rpmi_mbox_init,
+	.init = fdt_mpxy_rpmi_init,
 	.experimental = true,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
index 7185f3f3..9b056458 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
@@ -8,7 +8,7 @@
  *   Sunil V L <sunilvl@oss.qualcomm.com>
  */
 
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
 
 static struct rpmi_mm_get_attributes_rsp rsp;
@@ -38,7 +38,7 @@ static struct mpxy_rpmi_service_data mm_srvcdata[] = {
 };
 
 static int mpxy_rpmi_mm_setup(void **context, struct mbox_chan *chan,
-			      const struct mpxy_rpmi_mbox_data *data)
+			      const struct mpxy_rpmi_data *data)
 {
 	unsigned long mm_region_addr = 0;
 	unsigned long mm_region_size = 0;
@@ -99,7 +99,7 @@ static int mpxy_rpmi_mm_xfer(void *context, struct mbox_chan *chan,
 	return rc;
 }
 
-static const struct mpxy_rpmi_mbox_data mm_data = {
+static const struct mpxy_rpmi_data mm_data = {
 	.servicegrp_id = RPMI_SRVGRP_MANAGEMENT_MODE,
 	.num_services = RPMI_MM_SRV_MAX_COUNT,
 	.service_data = mm_srvcdata,
@@ -119,5 +119,5 @@ static const struct fdt_match mm_match[] = {
 const struct fdt_driver fdt_mpxy_rpmi_mm = {
 	.experimental = true,
 	.match_table = mm_match,
-	.init = mpxy_rpmi_mbox_init,
+	.init = fdt_mpxy_rpmi_init,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c b/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
index 759b3aed..9b2c60c5 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
@@ -1,4 +1,4 @@
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data performance_services[] = {
 {
@@ -73,7 +73,7 @@ static struct mpxy_rpmi_service_data performance_services[] = {
 },
 };
 
-static const struct mpxy_rpmi_mbox_data performance_data = {
+static const struct mpxy_rpmi_data performance_data = {
 	.servicegrp_id = RPMI_SRVGRP_PERFORMANCE ,
 	.num_services = RPMI_PERF_SRV_MAX_COUNT,
 	.service_data = performance_services,
@@ -87,5 +87,5 @@ static const struct fdt_match performance_match[] = {
 const struct fdt_driver fdt_mpxy_rpmi_performance = {
 	.experimental = true,
 	.match_table = performance_match,
-	.init = mpxy_rpmi_mbox_init,
+	.init = fdt_mpxy_rpmi_init,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
index 1dcc049e..9a5b4ec0 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -9,7 +9,7 @@
 #include <sbi/sbi_byteorder.h>
 #include <sbi/sbi_heap.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 struct mpxy_rpmi_sysmsi {
 	u32 sys_num_msi;
@@ -84,7 +84,7 @@ static void mpxy_rpmi_sysmsi_cleanup(void *context)
 }
 
 static int mpxy_rpmi_sysmsi_setup(void **context, struct mbox_chan *chan,
-				  const struct mpxy_rpmi_mbox_data *data)
+				  const struct mpxy_rpmi_data *data)
 {
 	struct rpmi_sysmsi_get_msi_attributes_resp gmaresp;
 	struct rpmi_sysmsi_get_msi_attributes_req gmareq;
@@ -189,7 +189,7 @@ static struct mpxy_rpmi_service_data sysmsi_services[] = {
 },
 };
 
-static const struct mpxy_rpmi_mbox_data sysmsi_data = {
+static const struct mpxy_rpmi_data sysmsi_data = {
 	.servicegrp_id = RPMI_SRVGRP_SYSTEM_MSI,
 	.num_services = RPMI_SYSMSI_SRV_ID_MAX_COUNT,
 	.service_data = sysmsi_services,
@@ -205,5 +205,5 @@ static const struct fdt_match sysmsi_match[] = {
 
 const struct fdt_driver fdt_mpxy_rpmi_sysmsi = {
 	.match_table = sysmsi_match,
-	.init = mpxy_rpmi_mbox_init,
+	.init = fdt_mpxy_rpmi_init,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c b/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
index 90673975..fa640886 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
@@ -1,4 +1,4 @@
-#include <sbi_utils/mpxy/fdt_mpxy_rpmi_mbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data voltage_services[] = {
 {
@@ -59,7 +59,7 @@ static struct mpxy_rpmi_service_data voltage_services[] = {
 },
 };
 
-static const struct mpxy_rpmi_mbox_data voltage_data = {
+static const struct mpxy_rpmi_data voltage_data = {
 	.servicegrp_id = RPMI_SRVGRP_VOLTAGE,
 	.num_services = RPMI_VOLTAGE_SRV_MAX_COUNT,
 	.service_data = voltage_services,
@@ -73,5 +73,5 @@ static const struct fdt_match voltage_match[] = {
 const struct fdt_driver fdt_mpxy_rpmi_voltage = {
 	.experimental = true,
 	.match_table = voltage_match,
-	.init = mpxy_rpmi_mbox_init,
+	.init = fdt_mpxy_rpmi_init,
 };
diff --git a/lib/utils/mpxy/objects.mk b/lib/utils/mpxy/objects.mk
index 1f1bf0a0..7645d13a 100644
--- a/lib/utils/mpxy/objects.mk
+++ b/lib/utils/mpxy/objects.mk
@@ -10,7 +10,7 @@
 libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy.o
 libsbiutils-objs-$(CONFIG_FDT_MPXY) += mpxy/fdt_mpxy_drivers.carray.o
 
-libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_MBOX) += mpxy/fdt_mpxy_rpmi_mbox.o
+libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI) += mpxy/fdt_mpxy_rpmi.o
 
 carray-fdt_mpxy_drivers-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += fdt_mpxy_rpmi_clock
 libsbiutils-objs-$(CONFIG_FDT_MPXY_RPMI_CLOCK) += mpxy/fdt_mpxy_rpmi_clock.o
diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 98829884..2617ea19 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -78,7 +78,7 @@ CONFIG_FDT_TIMER=y
 CONFIG_FDT_TIMER_MTIMER=y
 CONFIG_FDT_TIMER_PLMT=y
 CONFIG_FDT_MPXY=y
-CONFIG_FDT_MPXY_RPMI_MBOX=y
+CONFIG_FDT_MPXY_RPMI=y
 CONFIG_FDT_MPXY_RPMI_CLOCK=y
 CONFIG_FDT_MPXY_RPMI_VOLTAGE=y
 CONFIG_FDT_MPXY_RPMI_DEVICE_POWER=y
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
