Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AEFC5DF87
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 12:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbBWLBrTIfTl/PZD0r2RFVr2/AhgPxw4VnT7XLLHBxM=; b=lCJqrkR7j/f/zn
	Hy6XSjOuQbkj5qZOSIMcVSvrkh8n4dxviuebC9U7l8plVmN5f25+nvIDozM+L2B1tVUv5167OWMLh
	zz5IO2vLQLiecn3Swa94PP6u4k3SgHuiA/Bux+/JkryQUsgxX/6xqv4CVqvTcNH42NXlWf2ZAvfeE
	caFLl9XVf9ZWs2HcgwoOf8npjrDhq22eUnftulAXjBM6KhH7OwlYGVvDUNErmSrFk50fXrFACI4Tt
	pLabEGcQ8rCiE9pcLSs3SIsZ1SJkR7pk+4LFw8aMsemXLUNRCYsZXYKnFEz7qvsxwt6HfWU2nPDVC
	302wm1tTkKIQWJgXFKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1eB-0000000BVgu-1wOF;
	Thu, 20 Aug 2026 12:13:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1e7-0000000BVew-41qH
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 12:13:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K9JFr52927178
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 12:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QdLM6jfWa5m
	9lWE62hX5wHNKLdNfpydmBvj4ZrKEXfY=; b=Zrpg2XAALR3v1R+g5MzDSfGZ4EO
	FP5H0cwUD+ZEBrCupHthXKbMkEk6SAOcS9PlVsAjMGRQU4AwP4V6n9T6yJm0z2sx
	DpkFNvJsJMIJae+LNRjvtWpLcbvYid6jWOcq3hoL3anmTy2tMro3itHXbANhQUMy
	/s/HlIdPIZqHylNxdNNFwlPH38MGOA4XZNwAYKzVkKqLfxbul2ROoQ1j6kAF+2J2
	H4caFH2LtSh9OuEl5lJ9TWzF1ibZ4DruMyXPxq1dwbCHivHLpo7EvrfdCMQZeEd2
	6UuGBOk8TCiMwWJ9FXQpAuwU75/geXu+iyTIHSVAX/CW7qGd/IDj50hNmXg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk0mvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 12:13:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d54187d8b0so46193535ad.0
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 05:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787228001; x=1787832801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdLM6jfWa5m9lWE62hX5wHNKLdNfpydmBvj4ZrKEXfY=;
        b=Uo3U6Bg1QK+WCraBcnufyNCbAs7H/ZwsjDcktciuzVM5wLyLRg/5XJGqGckSCKPpwS
         Gc7yn66xpCmxVRQT/WY1PRC719uL/hhBxFMnR6YstNXqLtra/DOB+ETTwMgl4vNMZYM2
         puvsjsqUY/a8oUHJdqvvWQQeZ8Uyko/Tp7D7Art3JHTPC3F66FHGbC1X3L9V873YezdX
         VFAQvGjRWdWnLpvd//z3EF9MMsFYjt9aWGZhtzrTuCIQlMDmtX2HmDHe0Gzayof8RUCk
         SjNIzS9i/R5SFvXdlSjuXp8VcFS0SCsQUxwIi46h477gPRzsCtemQftkZXQkewJ8jILy
         sUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228001; x=1787832801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdLM6jfWa5m9lWE62hX5wHNKLdNfpydmBvj4ZrKEXfY=;
        b=SNHJk0ro0E40ADYh7+16OVO7gMS7/ONS7vhfmuiNfye+UNJhq3GsdXBkZEV6ZxGsjw
         ibc9L+Xcy99WKzzISNJ3CSkV05FFKmmhfKkvOID5LvrLzMetfbGYVVbgtGS+L73hg2oI
         Qci6Ip4KxVknPSE3yRXAVCFW+MDY6MZH9qV39z/L/r3pMx7uefNELGww8h1kmFmb792E
         xWc/+zsAELYbaAart/T7Ou5A1EqFFfXYsh0p+O4E5zcc25JHn3VTaeMlz0x8WZ39Bbs5
         ql0FW2QNY9l1MuQPgDXhEAGNE8t2aOq1PiWkMGYhc2cLRyb7bOqOfTO5mDBiQvTWbi6e
         N34Q==
X-Gm-Message-State: AFuF++kBEWLijHxVO7CtIqdOPEsZ9u3MtmQ22pcT/XtgPSfqFfShI0nH
	uvOY2N7pAzxEpNxUQd3zUakMw4UOHuSncGw7hChAuFIJDAZq5Nb8o9C0nW9E5N82lymsX4/XyYh
	KjvQmue5LBSgUox517kMRYYw/a4Dyrcv6sJDWPTfLjI4tLmf/1lPRPbHmceWp5PV2ujvZUT5sxA
	==
X-Gm-Gg: AR+sD10/rT8Fx/kYaJSYhXdIKMbEizGwjc/I+XZOEOQIr35QpKRRsczV60QtwSh/XZp
	SDvtaPr5pg8+TcUW6Sw6jTe+2p1w79mt2YWMYJ/GI5Y8+s5FRhuG2Lqo5egDblPe6W/PRDRjCgN
	CYOVFRxuMVQjrkP7LX6nwIB72on+Z5VIp9T5jnVRsQPWWipMlElFcGXtSXsIqtL03kvhvauDgt8
	esAiJg5wcbAXYAKueMpFAYDbLvrwe1hcyjNMNazTp44B0p/tERhOVPLo0jkbGqnJO/gpTAMNzLf
	qFZNlfoRMx4dtB8JbHREWRfwkRs1oOthYzCC1oThzR6DPEDuHWD6DxlpMFkeg9F0GuXTlfaU8bX
	EjGTaczrd2YCk3af+/uhr4N7HUwlaBU7tP5m5gsgKMOCNljEvxUAZbh4JKOlj5vOd2zJ43U3IAb
	2mBLeXjJ1kGsMuQGsu6k6F
X-Received: by 2002:a17:903:90f:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d63c1a8633mr25150235ad.14.1787228001141;
        Thu, 20 Aug 2026 05:13:21 -0700 (PDT)
X-Received: by 2002:a17:903:90f:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d63c1a8633mr25148775ad.14.1787228000488;
        Thu, 20 Aug 2026 05:13:20 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d55538fsm6005415ad.13.2026.08.20.05.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:13:20 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [PATCH 2/2] lib: sbi_domain: Rename per-domain data to per-domain state
Date: Thu, 20 Aug 2026 17:43:09 +0530
Message-ID: <20260820121309.2551296-3-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820121309.2551296-1-rahul.pathak@oss.qualcomm.com>
References: <20260820121309.2551296-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: ttLtgHR8DFk56_UJVRvdZe-uh3J0lHdT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfX54K7fu2Hs0EB
 JBhFZusculTBMFvrzsdITYvNCho4lhJ1QOnzpALbf0s5RYprF/By8GnNJwVd0u4oseG0a8M7x/l
 jYpAsIOZ7zIMQiiadoYLpQaqDRDGZ2s=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86ef62 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=tHZfFPyI7O1_sOD6RpsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfX/sX57us+w8Eu
 efqjKpKxy5bIVcImWaLxWB4BLWKek8aDdKwWVgyAhgzWy4qJVclqIpolH/LXkxnLLnufeXvREmd
 Qm/jG77B3FjQ+LoPUDUU36Re1KUWs5FGwfyA2zpmCNiI31HpeTFGAaGrbu4nvWUcBhwuZ8tt1zm
 x3W7nSB9R9edM/OK0VGxpr8wqvgbsurzRwRMX5xDnmNY8ZSnnDSLzR3O9owXo44JpeEJXSz4Eb1
 aH48G4lZ/LG9yTLCiAR4mL9KTbi6+cLYnmzdyJUGbT4eodaV8Bzn8m9shN9/Ai3QavjjkkfKH40
 zNaHI6jEEOKyKHS1hgipoA+qMGdq3WlF1m8pp2r/CLZKC8lwgg+wNXvrz8mBHdF1lcmG5947bC8
 0YfnnYKOSh2QtRgF0ADlOGA+MC+Jnj74EmMxQP1XwvAqH1T9RailSZYVeS9atZnPerYJEdehpkU
 zPyo/n10aeuyAZDTgeQ==
X-Proofpoint-ORIG-GUID: ttLtgHR8DFk56_UJVRvdZe-uh3J0lHdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_051324_145240_F39FFC4C 
X-CRM114-Status: GOOD (  26.28  )
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

The per-domain sbi_domain_data hold each domain
associated state like hart context in sbi_domain_context,
mpxy state in sbi_mpxy, and others like each domain backed
by the corresponding MPT (SMMPT).
DATA reads as a generic name, while every use stores state.
Rename functions and macros appropriately. There are no
functional changes.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_domain.h       |   6 +-
 include/sbi/sbi_domain_data.h  |  93 ----------------------
 include/sbi/sbi_domain_state.h |  93 ++++++++++++++++++++++
 lib/sbi/objects.mk             |   2 +-
 lib/sbi/sbi_domain.c           |   6 +-
 lib/sbi/sbi_domain_context.c   |  14 ++--
 lib/sbi/sbi_domain_data.c      | 138 ---------------------------------
 lib/sbi/sbi_domain_state.c     | 138 +++++++++++++++++++++++++++++++++
 lib/sbi/sbi_mpxy.c             |  32 ++++----
 9 files changed, 261 insertions(+), 261 deletions(-)
 delete mode 100644 include/sbi/sbi_domain_data.h
 create mode 100644 include/sbi/sbi_domain_state.h
 delete mode 100644 lib/sbi/sbi_domain_data.c
 create mode 100644 lib/sbi/sbi_domain_state.c

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 16edd4ce..38784a0e 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -15,7 +15,7 @@
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_domain_context.h>
-#include <sbi/sbi_domain_data.h>
+#include <sbi/sbi_domain_state.h>
 
 struct sbi_scratch;
 
@@ -189,8 +189,8 @@ static inline bool sbi_domain_memregion_is_subset(
 struct sbi_domain {
 	/** Node in linked list of domains */
 	struct sbi_dlist node;
-	/** Internal state of per-domain data */
-	struct sbi_domain_data_priv data_priv;
+	/** Internal per-domain state areas */
+	struct sbi_domain_state_priv state_priv;
 	/** Logical index of this domain */
 	u32 index;
 	/** HARTs assigned to this domain */
diff --git a/include/sbi/sbi_domain_data.h b/include/sbi/sbi_domain_data.h
deleted file mode 100644
index 7eeafdce..00000000
--- a/include/sbi/sbi_domain_data.h
+++ /dev/null
@@ -1,93 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- */
-
-#ifndef __SBI_DOMAIN_DATA_H__
-#define __SBI_DOMAIN_DATA_H__
-
-#include <sbi/sbi_types.h>
-#include <sbi/sbi_list.h>
-
-struct sbi_domain;
-
-/** Maximum domain data per-domain */
-#define SBI_DOMAIN_MAX_DATA_PTRS		32
-
-/** Representation of per-domain data */
-struct sbi_domain_data_priv {
-	/** Array of domain data pointers indexed by domain data identifier */
-	void *idx_to_data_ptr[SBI_DOMAIN_MAX_DATA_PTRS];
-};
-
-/** Representation of a domain data */
-struct sbi_domain_data {
-	/**
-	 * Head is used for maintaining data list
-	 *
-	 * Note: initialized by domain framework
-	 */
-	struct sbi_dlist head;
-	/**
-	 * Identifier which used to locate per-domain data
-	 *
-	 * Note: initialized by domain framework
-	 */
-	unsigned long data_idx;
-	/** Size of per-domain data */
-	unsigned long data_size;
-	/** Optional callback to setup domain data */
-	int (*data_setup)(struct sbi_domain *dom,
-			  struct sbi_domain_data *data, void *data_ptr);
-	/** Optional callback to cleanup domain data */
-	void (*data_cleanup)(struct sbi_domain *dom,
-			     struct sbi_domain_data *data, void *data_ptr);
-};
-
-/**
- * Get per-domain data pointer for a given domain
- * @param dom pointer to domain
- * @param data pointer to domain data
- *
- * @return per-domain data pointer
- */
-void *sbi_domain_data_ptr(struct sbi_domain *dom, struct sbi_domain_data *data);
-
-/**
- * Setup all domain data for a domain
- * @param dom pointer to domain
- *
- * @return 0 on success and negative error code on failure
- *
- * Note: This function is used internally within domain framework.
- */
-int sbi_domain_setup_data(struct sbi_domain *dom);
-
-/**
- * Cleanup all domain data for a domain
- * @param dom pointer to domain
- *
- * Note: This function is used internally within domain framework.
- */
-void sbi_domain_cleanup_data(struct sbi_domain *dom);
-
-/**
- * Register a domain data
- * @param hndl pointer to domain data
- *
- * @return 0 on success and negative error code on failure
- *
- * Note: This function must be used only in cold boot path.
- */
-int sbi_domain_register_data(struct sbi_domain_data *data);
-
-/**
- * Unregister a domain data
- * @param hndl pointer to domain data
- *
- * Note: This function must be used only in cold boot path.
- */
-void sbi_domain_unregister_data(struct sbi_domain_data *data);
-
-#endif
diff --git a/include/sbi/sbi_domain_state.h b/include/sbi/sbi_domain_state.h
new file mode 100644
index 00000000..72030380
--- /dev/null
+++ b/include/sbi/sbi_domain_state.h
@@ -0,0 +1,93 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#ifndef __SBI_DOMAIN_STATE_H__
+#define __SBI_DOMAIN_STATE_H__
+
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_list.h>
+
+struct sbi_domain;
+
+/** Maximum number of per-domain state areas */
+#define SBI_DOMAIN_MAX_STATE_PTRS		32
+
+/** Internal per-domain state areas */
+struct sbi_domain_state_priv {
+	/** Array of per-domain state pointers indexed by state identifier */
+	void *idx_to_state_ptr[SBI_DOMAIN_MAX_STATE_PTRS];
+};
+
+/** Representation of a domain state */
+struct sbi_domain_state {
+	/**
+	 * Head is used for maintaining state list
+	 *
+	 * Note: initialized by domain framework
+	 */
+	struct sbi_dlist head;
+	/**
+	 * Identifier which used to locate per-domain state
+	 *
+	 * Note: initialized by domain framework
+	 */
+	unsigned long state_idx;
+	/** Size of per-domain state */
+	unsigned long state_size;
+	/** Optional callback to setup domain state */
+	int (*state_setup)(struct sbi_domain *dom,
+			  struct sbi_domain_state *state, void *state_ptr);
+	/** Optional callback to cleanup domain state */
+	void (*state_cleanup)(struct sbi_domain *dom,
+			     struct sbi_domain_state *state, void *state_ptr);
+};
+
+/**
+ * Get per-domain state pointer for a given domain
+ * @param dom pointer to domain
+ * @param state pointer to domain state
+ *
+ * @return per-domain state pointer
+ */
+void *sbi_domain_state_ptr(struct sbi_domain *dom, struct sbi_domain_state *state);
+
+/**
+ * Setup all domain state for a domain
+ * @param dom pointer to domain
+ *
+ * @return 0 on success and negative error code on failure
+ *
+ * Note: This function is used internally within domain framework.
+ */
+int sbi_domain_setup_state(struct sbi_domain *dom);
+
+/**
+ * Cleanup all domain state for a domain
+ * @param dom pointer to domain
+ *
+ * Note: This function is used internally within domain framework.
+ */
+void sbi_domain_cleanup_state(struct sbi_domain *dom);
+
+/**
+ * Register a domain state
+ * @param hndl pointer to domain state
+ *
+ * @return 0 on success and negative error code on failure
+ *
+ * Note: This function must be used only in cold boot path.
+ */
+int sbi_domain_register_state(struct sbi_domain_state *state);
+
+/**
+ * Unregister a domain state
+ * @param hndl pointer to domain state
+ *
+ * Note: This function must be used only in cold boot path.
+ */
+void sbi_domain_unregister_state(struct sbi_domain_state *state);
+
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index c29c888f..ae27d0c5 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -68,7 +68,7 @@ libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
 libsbi-objs-y += sbi_domain_context.o
-libsbi-objs-y += sbi_domain_data.o
+libsbi-objs-y += sbi_domain_state.o
 libsbi-objs-y += sbi_domain.o
 libsbi-objs-y += sbi_double_trap.o
 libsbi-objs-y += sbi_emulate_csr.o
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index fa69170b..79d61c54 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -687,10 +687,10 @@ int sbi_domain_register(struct sbi_domain *dom,
 		}
 	}
 
-	/* Setup data for the discovered domain */
-	rc = sbi_domain_setup_data(dom);
+	/* Setup state for the discovered domain */
+	rc = sbi_domain_setup_state(dom);
 	if (rc) {
-		sbi_printf("%s: domain data setup failed for %s (error %d)\n",
+		sbi_printf("%s: domain state setup failed for %s (error %d)\n",
 			   __func__, dom->name, rc);
 		sbi_list_del(&dom->node);
 		return rc;
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 0861d541..37cbe175 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -64,14 +64,14 @@ struct hart_context {
 	bool initialized;
 };
 
-static struct sbi_domain_data dcpriv;
+static struct sbi_domain_state dcstate;
 
 static inline struct hart_context *hart_context_get(struct sbi_domain *dom,
 						    u32 hartindex)
 {
 	struct hart_context **dom_hartindex_to_context_table;
 
-	dom_hartindex_to_context_table = sbi_domain_data_ptr(dom, &dcpriv);
+	dom_hartindex_to_context_table = sbi_domain_state_ptr(dom, &dcstate);
 	if (!dom_hartindex_to_context_table || !sbi_hartindex_valid(hartindex))
 		return NULL;
 
@@ -83,7 +83,7 @@ static void hart_context_set(struct sbi_domain *dom, u32 hartindex,
 {
 	struct hart_context **dom_hartindex_to_context_table;
 
-	dom_hartindex_to_context_table = sbi_domain_data_ptr(dom, &dcpriv);
+	dom_hartindex_to_context_table = sbi_domain_state_ptr(dom, &dcstate);
 	if (!dom_hartindex_to_context_table || !sbi_hartindex_valid(hartindex))
 		return;
 
@@ -314,15 +314,15 @@ int sbi_domain_context_init(void)
 	/**
 	 * Allocate per-domain and per-hart context data.
 	 * The data type is "struct hart_context **" whose memory space will be
-	 * dynamically allocated by domain_setup_data_one(). Calculate needed
+	 * dynamically allocated by domain_setup_state_one(). Calculate needed
 	 * size of memory space here.
 	 */
-	dcpriv.data_size = sizeof(struct hart_context *) * sbi_hart_count();
+	dcstate.state_size = sizeof(struct hart_context *) * sbi_hart_count();
 
-	return sbi_domain_register_data(&dcpriv);
+	return sbi_domain_register_state(&dcstate);
 }
 
 void sbi_domain_context_deinit(void)
 {
-	sbi_domain_unregister_data(&dcpriv);
+	sbi_domain_unregister_state(&dcstate);
 }
diff --git a/lib/sbi/sbi_domain_data.c b/lib/sbi/sbi_domain_data.c
deleted file mode 100644
index 04f0edf9..00000000
--- a/lib/sbi/sbi_domain_data.c
+++ /dev/null
@@ -1,138 +0,0 @@
-/*
- * SPDX-License-Identifier: BSD-2-Clause
- *
- * Copyright (c) 2024 Ventana Micro Systems Inc.
- */
-
-#include <sbi/sbi_bitmap.h>
-#include <sbi/sbi_domain.h>
-#include <sbi/sbi_error.h>
-#include <sbi/sbi_heap.h>
-
-static SBI_LIST_HEAD(data_list);
-static DECLARE_BITMAP(data_idx_bmap, SBI_DOMAIN_MAX_DATA_PTRS);
-
-void *sbi_domain_data_ptr(struct sbi_domain *dom, struct sbi_domain_data *data)
-{
-	if (dom && data && data->data_idx < SBI_DOMAIN_MAX_DATA_PTRS)
-		return dom->data_priv.idx_to_data_ptr[data->data_idx];
-
-	return NULL;
-}
-
-static int domain_setup_data_one(struct sbi_domain *dom,
-				 struct sbi_domain_data *data)
-{
-	struct sbi_domain_data_priv *priv = &dom->data_priv;
-	void *data_ptr;
-	int rc;
-
-	if (priv->idx_to_data_ptr[data->data_idx])
-		return SBI_EALREADY;
-
-	data_ptr = sbi_zalloc(data->data_size);
-	if (!data_ptr) {
-		sbi_domain_cleanup_data(dom);
-		return SBI_ENOMEM;
-	}
-
-	if (data->data_setup) {
-		rc = data->data_setup(dom, data, data_ptr);
-		if (rc) {
-			sbi_free(data_ptr);
-			return rc;
-		}
-	}
-
-	priv->idx_to_data_ptr[data->data_idx] = data_ptr;
-	return 0;
-}
-
-static void domain_cleanup_data_one(struct sbi_domain *dom,
-				    struct sbi_domain_data *data)
-{
-	struct sbi_domain_data_priv *priv = &dom->data_priv;
-	void *data_ptr;
-
-	data_ptr = priv->idx_to_data_ptr[data->data_idx];
-	if (!data_ptr)
-		return;
-
-	if (data->data_cleanup)
-		data->data_cleanup(dom, data, data_ptr);
-
-	sbi_free(data_ptr);
-	priv->idx_to_data_ptr[data->data_idx] = NULL;
-}
-
-int sbi_domain_setup_data(struct sbi_domain *dom)
-{
-	struct sbi_domain_data *data;
-	int rc;
-
-	if (!dom)
-		return SBI_EINVAL;
-
-	sbi_list_for_each_entry(data, &data_list, head) {
-		rc = domain_setup_data_one(dom, data);
-		if (rc) {
-			sbi_domain_cleanup_data(dom);
-			return rc;
-		}
-	}
-
-	return 0;
-}
-
-void sbi_domain_cleanup_data(struct sbi_domain *dom)
-{
-	struct sbi_domain_data *data;
-
-	if (!dom)
-		return;
-
-	sbi_list_for_each_entry(data, &data_list, head)
-		domain_cleanup_data_one(dom, data);
-}
-
-int sbi_domain_register_data(struct sbi_domain_data *data)
-{
-	struct sbi_domain *dom;
-	u32 data_idx;
-	int rc;
-
-	if (!data || !data->data_size)
-		return SBI_EINVAL;
-
-	for (data_idx = 0; data_idx < SBI_DOMAIN_MAX_DATA_PTRS; data_idx++) {
-		if (!bitmap_test(data_idx_bmap, data_idx))
-			break;
-	}
-	if (SBI_DOMAIN_MAX_DATA_PTRS <= data_idx)
-		return SBI_ENOSPC;
-	bitmap_set(data_idx_bmap, data_idx, 1);
-
-	data->data_idx = data_idx;
-	sbi_list_add_tail(&data->head, &data_list);
-
-	sbi_domain_for_each(dom) {
-		rc = domain_setup_data_one(dom, data);
-		if (rc) {
-			sbi_domain_unregister_data(data);
-			return rc;
-		}
-	}
-
-	return 0;
-}
-
-void sbi_domain_unregister_data(struct sbi_domain_data *data)
-{
-	struct sbi_domain *dom;
-
-	sbi_domain_for_each(dom)
-		domain_cleanup_data_one(dom, data);
-
-	sbi_list_del(&data->head);
-	bitmap_clear(data_idx_bmap, data->data_idx, 1);
-}
diff --git a/lib/sbi/sbi_domain_state.c b/lib/sbi/sbi_domain_state.c
new file mode 100644
index 00000000..2d1f30e3
--- /dev/null
+++ b/lib/sbi/sbi_domain_state.c
@@ -0,0 +1,138 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024 Ventana Micro Systems Inc.
+ */
+
+#include <sbi/sbi_bitmap.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+
+static SBI_LIST_HEAD(state_list);
+static DECLARE_BITMAP(state_idx_bmap, SBI_DOMAIN_MAX_STATE_PTRS);
+
+void *sbi_domain_state_ptr(struct sbi_domain *dom, struct sbi_domain_state *state)
+{
+	if (dom && state && state->state_idx < SBI_DOMAIN_MAX_STATE_PTRS)
+		return dom->state_priv.idx_to_state_ptr[state->state_idx];
+
+	return NULL;
+}
+
+static int domain_setup_state_one(struct sbi_domain *dom,
+				 struct sbi_domain_state *state)
+{
+	struct sbi_domain_state_priv *priv = &dom->state_priv;
+	void *state_ptr;
+	int rc;
+
+	if (priv->idx_to_state_ptr[state->state_idx])
+		return SBI_EALREADY;
+
+	state_ptr = sbi_zalloc(state->state_size);
+	if (!state_ptr) {
+		sbi_domain_cleanup_state(dom);
+		return SBI_ENOMEM;
+	}
+
+	if (state->state_setup) {
+		rc = state->state_setup(dom, state, state_ptr);
+		if (rc) {
+			sbi_free(state_ptr);
+			return rc;
+		}
+	}
+
+	priv->idx_to_state_ptr[state->state_idx] = state_ptr;
+	return 0;
+}
+
+static void domain_cleanup_state_one(struct sbi_domain *dom,
+				    struct sbi_domain_state *state)
+{
+	struct sbi_domain_state_priv *priv = &dom->state_priv;
+	void *state_ptr;
+
+	state_ptr = priv->idx_to_state_ptr[state->state_idx];
+	if (!state_ptr)
+		return;
+
+	if (state->state_cleanup)
+		state->state_cleanup(dom, state, state_ptr);
+
+	sbi_free(state_ptr);
+	priv->idx_to_state_ptr[state->state_idx] = NULL;
+}
+
+int sbi_domain_setup_state(struct sbi_domain *dom)
+{
+	struct sbi_domain_state *state;
+	int rc;
+
+	if (!dom)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(state, &state_list, head) {
+		rc = domain_setup_state_one(dom, state);
+		if (rc) {
+			sbi_domain_cleanup_state(dom);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+void sbi_domain_cleanup_state(struct sbi_domain *dom)
+{
+	struct sbi_domain_state *state;
+
+	if (!dom)
+		return;
+
+	sbi_list_for_each_entry(state, &state_list, head)
+		domain_cleanup_state_one(dom, state);
+}
+
+int sbi_domain_register_state(struct sbi_domain_state *state)
+{
+	struct sbi_domain *dom;
+	u32 state_idx;
+	int rc;
+
+	if (!state || !state->state_size)
+		return SBI_EINVAL;
+
+	for (state_idx = 0; state_idx < SBI_DOMAIN_MAX_STATE_PTRS; state_idx++) {
+		if (!bitmap_test(state_idx_bmap, state_idx))
+			break;
+	}
+	if (SBI_DOMAIN_MAX_STATE_PTRS <= state_idx)
+		return SBI_ENOSPC;
+	bitmap_set(state_idx_bmap, state_idx, 1);
+
+	state->state_idx = state_idx;
+	sbi_list_add_tail(&state->head, &state_list);
+
+	sbi_domain_for_each(dom) {
+		rc = domain_setup_state_one(dom, state);
+		if (rc) {
+			sbi_domain_unregister_state(state);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+void sbi_domain_unregister_state(struct sbi_domain_state *state)
+{
+	struct sbi_domain *dom;
+
+	sbi_domain_for_each(dom)
+		domain_cleanup_state_one(dom, state);
+
+	sbi_list_del(&state->head);
+	bitmap_clear(state_idx_bmap, state->state_idx, 1);
+}
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 41fea0ae..2b9ad351 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -267,11 +267,11 @@ int sbi_mpxy_register_channel(struct sbi_mpxy_channel *channel)
 }
 
 /** Setup per domain MPXY state data */
-static int domain_mpxy_state_data_setup(struct sbi_domain *dom,
-					struct sbi_domain_data *data,
-					void *data_ptr)
+static int domain_mpxy_state_setup(struct sbi_domain *dom,
+					struct sbi_domain_state *state,
+					void *state_ptr)
 {
-	struct mpxy_state **dom_hartindex_to_mpxy_state_table = data_ptr;
+	struct mpxy_state **dom_hartindex_to_mpxy_state_table = state_ptr;
 	struct mpxy_state *ms;
 	u32 i;
 
@@ -296,20 +296,20 @@ static int domain_mpxy_state_data_setup(struct sbi_domain *dom,
 }
 
 /** Cleanup per domain MPXY state data */
-static void domain_mpxy_state_data_cleanup(struct sbi_domain *dom,
-					   struct sbi_domain_data *data,
-					   void *data_ptr)
+static void domain_mpxy_state_cleanup(struct sbi_domain *dom,
+					   struct sbi_domain_state *state,
+					   void *state_ptr)
 {
-	struct mpxy_state **dom_hartindex_to_mpxy_state_table = data_ptr;
+	struct mpxy_state **dom_hartindex_to_mpxy_state_table = state_ptr;
 	u32 i;
 
 	sbi_hartmask_for_each_hartindex(i, dom->possible_harts)
 		sbi_free(dom_hartindex_to_mpxy_state_table[i]);
 }
 
-static struct sbi_domain_data dmspriv = {
-	.data_setup = domain_mpxy_state_data_setup,
-	.data_cleanup = domain_mpxy_state_data_cleanup,
+static struct sbi_domain_state dmstate = {
+	.state_setup = domain_mpxy_state_setup,
+	.state_cleanup = domain_mpxy_state_cleanup,
 };
 
 /**
@@ -324,7 +324,7 @@ static struct mpxy_state *sbi_domain_get_mpxy_state(struct sbi_domain *dom,
 {
 	struct mpxy_state **dom_hartindex_to_mpxy_state_table;
 
-	dom_hartindex_to_mpxy_state_table = sbi_domain_data_ptr(dom, &dmspriv);
+	dom_hartindex_to_mpxy_state_table = sbi_domain_state_ptr(dom, &dmstate);
 	if (!dom_hartindex_to_mpxy_state_table ||
 	    !sbi_hartindex_valid(hartindex))
 		return NULL;
@@ -339,12 +339,12 @@ int sbi_mpxy_init(struct sbi_scratch *scratch)
 	/**
 	 * Allocate per-domain and per-hart MPXY state data.
 	 * The data type is "struct mpxy_state **" whose memory space will be
-	 * dynamically allocated by domain_setup_data_one() and
-	 * domain_mpxy_state_data_setup(). Calculate needed size of memory space
+	 * dynamically allocated by domain_setup_state_one() and
+	 * domain_mpxy_state_setup(). Calculate needed size of memory space
 	 * here.
 	 */
-	dmspriv.data_size = sizeof(struct mpxy_state *) * sbi_hart_count();
-	ret = sbi_domain_register_data(&dmspriv);
+	dmstate.state_size = sizeof(struct mpxy_state *) * sbi_hart_count();
+	ret = sbi_domain_register_state(&dmstate);
 	if (ret)
 		return ret;
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
