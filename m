Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342FAC9830C
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHW9OHi1ekWaLTZ50adn0Sp40Qb9ENYfywtxTNlv5W0=; b=wbCkbyCEsR1VBz
	Hn++tU8ybhutzWJigwSSxWFlxu+8NFfYsmDre2HlX+2F2RxtLLOQvGyRczQhTKsG1eqKlEE+MdTpt
	LR0vxvMlEC57xg2IjsYvElMuUgwgBVLM8Kpazve6ux1paxjpfFxYwAq59ezb5lwFSkVanPoahWJ4v
	nIGpiWNlG1f1+EbqiXgfZD44TTtfeKJUPrt803wdI7Bg3zNtKDT8bpVw6P+dHu1CLgbafVtmnT9/1
	WAUk2UmmfyB8nFKtex3++q8LCC7M0YFh4vH8FucCK94sOEoSR49qYKB2QriXvm1EhUmtvgDCFReq5
	MjvUO/ZNstl3ceAgS1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dam-0000000724J-0yTw;
	Wed, 23 Sep 2026 03:24:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dac-000000071zq-2pm2
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3Bb6u1509371;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AAxEU8MN1u8
	Tt5I8bU0wJ4GYptjeSjeNMhaaHKG/LcY=; b=kLrTSN4KhrLa+lPoEmxqyltIBC6
	LHssshRQGFZ7/NRd41I/kYN4gnQi5WrPYvJ76L1mBqxUXJR+RKGHUpwvbPBhkfYD
	pKcw8ltEPfYj8iRRlgvF76CGh0hYP9X+LkT2WLqeEUby9BodPIMDwxOSEIlTFfIZ
	D3lsNgiP2HWb0GSV7qvj1vuFWs8N5d2zxEnhzpelWyUfilWfPvOtd0/mLw3mfEG3
	ARiiUNtfjnTSV2qX0+vcIMLCtOXwZatJdojrT+zeXDB8PqwBV1zT8MJnLB+EWzDC
	HZKQnfsqfR7gIwkfrymHrQt9DsJ4Cujf+GY8DK883OEK827022gstv/5zUw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xt93a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2ul016008;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O2Pw015973
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:02 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 15A6D248FF; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 06/11] lib: utils/mpxy: Simplify fdt_mpxy_rpmi.h by moving things to fdt_mpxy_rpmi.c
Date: Wed, 23 Sep 2026 08:53:54 +0530
Message-ID: <20260923032359.4041876-7-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: dNdLMYeM6wjOtVHV45sMIJvkX3VS9Bau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX5sEVHDRJBmU8
 19MdmEqFEN4qC9hr0M/pv8teN3IohJt8MXadVvjldtBe/wjyX2hjp3NY77EkMdfaTJrop24ZMns
 20aRYEMMHkdAqduMR4Ixcl5wrQZM1Rkp2WDtUi7x/zPKwNc7f/JMWiUcNynLFfothRYnrSQsASa
 Z6u+j3Fmey51wrcvvm9OL5haL/NgMY4+THJPURnibWF6EYXTpKRYbyMeKTecnLWYtpsQLyzwdu3
 c7akRGrHZ3DEF29uAUZhibd+2JPGH/fivS1UzMq4DCp1myYutPux0Xw1Z0mnG2aRgEn81clL4rS
 gZ6nFxTQldSnoJFaSdje/ff42dNlZ+icuKD7eeb4demBBUFidhyXw75WGl1cgpFh4QlF/mGVOoE
 bA6ntgjVOX6JN2AX1IeuK1TLaA//UXpX6xrVgvt04srD4EpFKaz+1y6636OuWy5TtO3OJdryoAL
 8LxIOprKsa9kK3CUXdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/wRD04uuuvFO
 Zn1v4aOs7oz9z4mh4u2lxYZLb+/ereIzSlCaUXZOxP0BPKsCJ/GIUhGqV9701kruMnbvg8FdliX
 DGnqZE/ThXNpLpC9HWIl9sCuIf1hEpw=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8
 a=02xSguPGxQD_giCV310A:9 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-ORIG-GUID: dNdLMYeM6wjOtVHV45sMIJvkX3VS9Bau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202411_584652_4F7F6D45 
X-CRM114-Status: GOOD (  15.23  )
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

Currently, the fdt_mpxy_rpmi.h has lot things which are not used by
any of MPXY RPMI drivers so simplify fdt_mpxy_rpmi.h by moving such
things to fdt_mpxy_rpmi.c.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi_utils/mpxy/fdt_mpxy_rpmi.h      | 41 +--------------------
 lib/utils/mpxy/fdt_mpxy_rpmi.c              | 41 ++++++++++++++++++++-
 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c        |  1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c |  1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_logging.c      |  1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c           |  1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_performance.c  |  1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c       |  1 +
 lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c      |  1 +
 9 files changed, 49 insertions(+), 40 deletions(-)

diff --git a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
index c4e6897f..ae7e537a 100644
--- a/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
+++ b/include/sbi_utils/mpxy/fdt_mpxy_rpmi.h
@@ -10,47 +10,10 @@
 #ifndef __FDT_MPXY_RPMI_H__
 #define __FDT_MPXY_RPMI_H__
 
-#include <sbi/sbi_types.h>
-#include <sbi/sbi_mpxy.h>
-#include <sbi_utils/mailbox/fdt_mailbox.h>
 #include <sbi_utils/mailbox/rpmi_msgprot.h>
-#include <sbi_utils/mpxy/fdt_mpxy.h>
 
-/** Convert the mpxy attribute ID to attribute array index */
-#define attr_id2index(attr_id)	(attr_id - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
-
-enum mpxy_msgprot_rpmi_attr_id {
-	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
-	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
-	MPXY_MSGPROT_RPMI_ATTR_IMPL_ID,
-	MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION,
-	MPXY_MSGPROT_RPMI_ATTR_MAX_ID
-};
-
-/**
- * MPXY message protocol attributes for RPMI
- * Order of attribute fields must follow the
- * attribute IDs in `enum mpxy_msgprot_rpmi_attr_id`
- */
-struct mpxy_rpmi_channel_attrs {
-	u32 servicegrp_id;
-	u32 servicegrp_ver;
-	u32 impl_id;
-	u32 impl_ver;
-};
-
-/** Make sure all attributes are packed for direct memcpy */
-#define assert_field_offset(field, attr_offset)				\
-	_Static_assert(							\
-		((offsetof(struct mpxy_rpmi_channel_attrs, field)) /	\
-		 sizeof(u32)) == (attr_offset - SBI_MPXY_ATTR_MSGPROTO_ATTR_START),\
-		"field " #field						\
-		" from struct mpxy_rpmi_channel_attrs invalid offset, expected " #attr_offset)
-
-assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);
-assert_field_offset(servicegrp_ver, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION);
-assert_field_offset(impl_id, MPXY_MSGPROT_RPMI_ATTR_IMPL_ID);
-assert_field_offset(impl_ver, MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION);
+struct mbox_chan;
+struct mbox_xfer;
 
 /** MPXY RPMI service data for each service group */
 struct mpxy_rpmi_service_data {
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index 103ded13..c0493ecb 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -9,11 +9,50 @@
  */
 
 #include <libfdt.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_mpxy.h>
 #include <sbi_utils/fdt/fdt_helper.h>
+#include <sbi_utils/mailbox/fdt_mailbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
-#include <sbi/sbi_console.h>
+
+/** Convert the mpxy attribute ID to attribute array index */
+#define attr_id2index(attr_id)	(attr_id - SBI_MPXY_ATTR_MSGPROTO_ATTR_START)
+
+enum mpxy_msgprot_rpmi_attr_id {
+	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION,
+	MPXY_MSGPROT_RPMI_ATTR_IMPL_ID,
+	MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION,
+	MPXY_MSGPROT_RPMI_ATTR_MAX_ID
+};
+
+/**
+ * MPXY message protocol attributes for RPMI
+ * Order of attribute fields must follow the
+ * attribute IDs in `enum mpxy_msgprot_rpmi_attr_id`
+ */
+struct mpxy_rpmi_channel_attrs {
+	u32 servicegrp_id;
+	u32 servicegrp_ver;
+	u32 impl_id;
+	u32 impl_ver;
+};
+
+/** Make sure all attributes are packed for direct memcpy */
+#define assert_field_offset(field, attr_offset)				\
+	_Static_assert(							\
+		((offsetof(struct mpxy_rpmi_channel_attrs, field)) /	\
+		 sizeof(u32)) == (attr_offset - SBI_MPXY_ATTR_MSGPROTO_ATTR_START),\
+		"field " #field						\
+		" from struct mpxy_rpmi_channel_attrs invalid offset, expected " #attr_offset)
+
+assert_field_offset(servicegrp_id, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_ID);
+assert_field_offset(servicegrp_ver, MPXY_MSGPROT_RPMI_ATTR_SERVICEGROUP_VERSION);
+assert_field_offset(impl_id, MPXY_MSGPROT_RPMI_ATTR_IMPL_ID);
+assert_field_offset(impl_ver, MPXY_MSGPROT_RPMI_ATTR_IMPL_VERSION);
 
 /**
  * MPXY RPMI instance per MPXY channel. This ties
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
index c9e77791..a27392d5 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
@@ -8,6 +8,7 @@
  *   Anup Patel <apatel@ventanamicro.com>
  */
 
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data clock_services[] = {
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c b/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
index a2a3b99f..dcfaaafd 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_device_power.c
@@ -1,3 +1,4 @@
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data dpwr_services[] = {
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
index 42bb1e14..7681dfe9 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_logging.c
@@ -7,6 +7,7 @@
  *   Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
  */
 
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data logging_services[] = {
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
index 9b056458..0263a105 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
@@ -8,6 +8,7 @@
  *   Sunil V L <sunilvl@oss.qualcomm.com>
  */
 
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
 
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c b/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
index 9b2c60c5..673d5378 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_performance.c
@@ -1,3 +1,4 @@
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data performance_services[] = {
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
index 9a5b4ec0..f7c3c3db 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -9,6 +9,7 @@
 #include <sbi/sbi_byteorder.h>
 #include <sbi/sbi_heap.h>
 #include <sbi_utils/mailbox/rpmi_mailbox.h>
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 struct mpxy_rpmi_sysmsi {
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c b/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
index fa640886..47488054 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_voltage.c
@@ -1,3 +1,4 @@
+#include <sbi_utils/mpxy/fdt_mpxy.h>
 #include <sbi_utils/mpxy/fdt_mpxy_rpmi.h>
 
 static struct mpxy_rpmi_service_data voltage_services[] = {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
