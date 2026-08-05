Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C952C56201
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRAAJtmHL02K3HGe8JhTKThKyAfAmjy3cVqJFWS8d5o=; b=EaFRSZvwFZu9dA
	kPqRQWA7TTALegXDjQK4X9wwDK8tQ1nmKIXtWAIx5AycMiJdroxGVAsiqZLlWoBsopYwVrvEc+W9/
	1F6X/LBVmP5TTQuL+IId4V+ZEV/+MJhqgTsqSXpqQlTieopENfw6/wG/nu8QzhQM1bRIM3yCVNZpS
	/8Xm4aWgkxlzIW9hhSbRMBNhrOiQuX60FZ8tCjwNKJWE2OI4/nxKD6mKlHFONXY5K8SR/u8ZV2De7
	q7yDrHepHcgLXm214mcZHf1PyTGJqad2c4rcrtbsDADKbR57eu6toyoFPD0Zu7dARa/xQUg/+SyrG
	g6Lh3bj1WuNCQao0+ZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgVy-00000004OyL-2BdF;
	Wed, 05 Aug 2026 18:38:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgVw-00000004Oxn-141Y
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 18:38:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSMYs3890342
	for <opensbi@lists.infradead.org>; Wed, 5 Aug 2026 18:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jUae9qn7lAb
	kdxJWTgQSOXsaTXKJKZjgXskbjcyEYIY=; b=jwnZCJ0quMVxxdRaH5ztWszlHLQ
	q1Ozt49vSD6v+uAlRmONhK3Y8zS9J+jZQQY/RyFjlI+K1dlKlHyVgmJl8QfcmWMh
	fkaYznDsphGsGzFZJ9hcFzV+cKsWLd9ETEiv7HB7P1rQMBZnhRJPFgjaSVOSOoXL
	5iUAoK19FXeuFSA71OOjiBn5Qe/Q63JW/ONANKveBAZ4dU/nNNr3hm0CXiowVXJ7
	GNojSD2JOzoiCRjo3kiFLSn82QvmdYchlnfBAKR45wewS8HPUsGvaPxF1mPxYXHj
	hbqvJUhdO9Qxysq/V34qykRVw3KugE9zoNU/r6ab7djSR7hbJ66yVNj0zTw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14wayv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 18:38:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso1987436a12.0
        for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785955130; x=1786559930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUae9qn7lAbkdxJWTgQSOXsaTXKJKZjgXskbjcyEYIY=;
        b=M4F/hlopT+vp05cPPbb9VadZMninTbrYVMXVgQgzpOMYAJv00i0VTaai2R5HdUQ+UB
         iCp0NOu7SruE2M30Bt8Xx5AMj6p4th58ycLSAx8F7KIn+2zWfaoDMYoV8yOYGGI0nuYE
         MOSl5OBE73rXrs/2MQtJpQ3bPbYX3qUEot3RFLYQZAYeQrEFP+Ush2v8F9TBgJACVoMk
         B6y+EB7nplUfCy2ZR4Lxrk+zsWlgTRNtWOMJIwdwPQR3oewDlScwx7wMokhM/jHDXZQo
         6WDRMvySN3nexgHBlsOABru814aTkkBQ7/Fk9jbulktrez2GjhJ+5TYnpP2L/jgEzQG4
         jRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955130; x=1786559930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUae9qn7lAbkdxJWTgQSOXsaTXKJKZjgXskbjcyEYIY=;
        b=skl4MTfZD4UPHTJJidZKxVm4I0583zBBzMXHX0DbeWuA4p8qMcjptCXgHEToeSCVZt
         LfuTBM4wUsLcIVqSjrNbDQ7sVf0zrKcQSlpPd2+e9U09aWsTeyVx59y3eeIyGKhR1DqN
         iwjxBkKqDVTzNVvHjFa6pCJnGr7n/gUbbcx8nBZZ0eC56JGfl78DTUGVxMu/3KAHWWbb
         S3PTrGlxhiE+O27Ei8KEGWKatl0VF/rgLhqCMiTFb1XenO8HWbZ+XGjr89dSUfCZNi0C
         9y2tgja1PNkgrvmQcDldBlrLY1iC+8NhgtG+wduQEov/1gvB3EagmCCvuMofUvX58f5i
         6Liw==
X-Gm-Message-State: AOJu0YyWMivmN0V58LsGrRtqDDYKNp0uNw4snD+g+YOYW0QTc5czOrfB
	4HO3MP490Ipb5f+Wr8JcY8+2o0S/pwBcDXJ82Y1gpO3pgKqdse7YkFhwLGeMgUe/Cp0e8rUZOLU
	EJNbgRZhnOeCg0IMGX3bGGuWyyt1kq5F1BKoiH8SMLXI0B5n0a7aUlxwXAA6cwiYYjC8g8HVnZg
	==
X-Gm-Gg: AR+sD12TYzMteFUadU//iNE1ignCIm/i6kExQp/mT/DTfV2ZNd0aClmoOvjHzJK2A0L
	6v/xTRXVAVMvkWTilGlbnp/w/FDQVfSJ9apUZBDlDh9lxzE2uztGszNxeV/1psTYhj8qIwPS8C9
	HGjd0Cmt63ykRCKBAhP9QJhWSRiSQK9u7s8gdbwWacw3jVGx2oTosCP0tC9YEygIh0kZxlSogjz
	H2zM1IOli2Qgo6zKQLTrGxksXGkCckzWdiiBD0M6l3Pch3Qv+GrIvTeSmV/1QpEYtQEKZ0c/T83
	wbu+Qx0v13Re6F+VJSlw89Up4ptNfHZxsNrPvpu5hl9o2v1oSAeafYdbRN2TQQcBfk7hNTeqBFE
	XR9lHtRepybKjooPc7P6y6GlkY0VMbZI88trkAEbk712LtSBba+I1HSJCRTQaUePDXNMC5TGugU
	sqIXXzY3ImAXCFx0OOoPUM
X-Received: by 2002:a05:6a21:998c:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3cb8603af30mr10678162637.31.1785955129748;
        Wed, 05 Aug 2026 11:38:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:998c:b0:3ba:cd5b:3dc8 with SMTP id adf61e73a8af0-3cb8603af30mr10678101637.31.1785955129143;
        Wed, 05 Aug 2026 11:38:49 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm17636943eec.12.2026.08.05.11.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:38:48 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v3 1/5] lib: sbi: Rename map_range/unmap_range functions
Date: Thu,  6 Aug 2026 00:08:34 +0530
Message-ID: <20260805183839.2576691-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX8VwjoMY3MEEH
 gGxZqYE59QpnuGJ111RBszjuPfxPv21bLcnkscaIuvGJIpEKx2ehlDOz8UCfUgph6ip2TDKIHQx
 3VNP+j1WUdFL2y/BEMYOwrPVCAO9H4o=
X-Proofpoint-ORIG-GUID: 7GG_xoXWQ8KRLXtoxBf2LcGPBlE0KE-_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX+aFhd91crpnS
 n84CKENx95iCTVElHhsEs3m/5/EtEP7pLKAjOerUel1uvRTSs9eKWbi/qkjpEKuLttj+NcUCnvP
 Bk6w5UozvxKeVT40c15PG8APodwzpk6VzVKakpDJyqZEaURKif/cCOEelT25ITECoRACD0wD627
 sfKDAveZexW7qLgsjz5S9PS9DibEYesg+ytRatPtmb8qpzl19/ElWcrZpa7y79BTowFrstMqtYH
 5Chb+To8b7Cmln9/uu/kkQ1pumzZ72xerwsFAEPfjszVPBHB+7OLNeWTVXeatXdQYIde3k3Dwyr
 5wMHIxHDWih/T8omeDISZvdNOqnMJ+qb80hDNWJz1vjg2VVJFD6KVeW8W2v7lXxKF+hydbGCPD3
 /zVlnOBqIG5OfRu66ZEBxO7ffchoc733z9swLGslvlZzAu3t+8I9tlmyz6ZX4A+HDGUMIEARFLn
 w7Y72/GrpcJNugt5mcg==
X-Proofpoint-GUID: 7GG_xoXWQ8KRLXtoxBf2LcGPBlE0KE-_
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a73833b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NnRM1_deUklkRIrYnNUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_113852_412095_57C9E6A7 
X-CRM114-Status: GOOD (  20.60  )
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

*_map_range and *_unmap_range functions are required
in M-Mode to get the temporary access to S-Mode and U-Mode
regions. Thse functions only operate using the TYPE_MEMORY
memory protection mechanisms. Rename them to reflect the
actual usage of these functions and let generic map/unmap_range
names to implement generic functions

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_hart_protection.h | 27 ++++++++++++++++-----------
 lib/sbi/sbi_dbtr.c                | 26 +++++++++++++-------------
 lib/sbi/sbi_ecall_dbcn.c          |  4 ++--
 lib/sbi/sbi_hart_pmp.c            | 10 +++++-----
 lib/sbi/sbi_hart_protection.c     | 12 ++++++------
 lib/sbi/sbi_mpxy.c                | 24 ++++++++++++------------
 lib/sbi/sbi_pmu.c                 |  4 ++--
 lib/sbi/sbi_sse.c                 |  8 ++++----
 8 files changed, 60 insertions(+), 55 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index cafe6ee7..bdcad008 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -40,13 +40,17 @@ struct sbi_hart_protection {
 	/** Unconfigure protection for current HART (Optional) */
 	void (*unconfigure)(struct sbi_scratch *scratch, struct sbi_domain *dom);
 
-	/** Create temporary mapping to access address range on current HART (Optional) */
-	int (*map_range)(struct sbi_scratch *scratch,
-			 unsigned long base, unsigned long size);
-
-	/** Destroy temporary mapping on current HART (Optional) */
-	int (*unmap_range)(struct sbi_scratch *scratch,
-			   unsigned long base, unsigned long size);
+	/**
+	 * Give temporary M-mode access to an S/U-mode address range on current
+	 * HART (Optional). Only applicable for the TYPE_MEMORY and the TYPE_ID
+	 * mechanisms are not invoked.
+	 */
+	int (*temp_map_range)(struct sbi_scratch *scratch,
+			      unsigned long base, unsigned long size);
+
+	/** Remove the temporary M-mode access on the current HART (Optional) */
+	int (*temp_unmap_range)(struct sbi_scratch *scratch,
+				unsigned long base, unsigned long size);
 };
 
 /**
@@ -111,23 +115,24 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 				    struct sbi_domain *next_dom);
 
 /**
- * Create temporary mapping to access address range on current HART
+ * Give temporary M-mode access to an S/U-mode address range on the
+ * current HART. Only valid for TYPE_MEMORY.
  *
  * @param base base address of the temporary mapping
  * @param size size of the temporary mapping
  *
  * @return 0 on success and negative error code on failure
  */
-int sbi_hart_protection_map_range(unsigned long base, unsigned long size);
+int sbi_hart_protection_temp_map_range(unsigned long base, unsigned long size);
 
 /**
- * Destroy temporary mapping to access address range on current HART
+ * Remove the temporary M-mode access on the current HART
  *
  * @param base base address of the temporary mapping
  * @param size size of the temporary mapping
  *
  * @return 0 on success and negative error code on failure
  */
-int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size);
+int sbi_hart_protection_temp_unmap_range(unsigned long base, unsigned long size);
 
 #endif /* __SBI_HART_PROTECTION_H__ */
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..afa8232f 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -580,7 +580,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
-	sbi_hart_protection_map_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		xmit = &entry->data;
@@ -594,7 +594,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		xmit->tdata2 = cpu_to_lle(trig->tdata2);
 		xmit->tdata3 = cpu_to_lle(trig->tdata3);
 	}
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
@@ -620,7 +620,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
-	sbi_hart_protection_map_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 
 	/*
@@ -639,14 +639,14 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
 		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
@@ -654,7 +654,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		if ((recv->tdata2 && !tdata2_impl) ||
 		    (recv->tdata3 && !tdata3_impl)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
@@ -662,7 +662,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
-		sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+		sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 					       trig_count * sizeof(*entry));
 		return SBI_ERR_FAILED;
 	}
@@ -684,7 +684,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 	}
 
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
@@ -768,29 +768,29 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
+		sbi_hart_protection_temp_map_range((unsigned long)entry, sizeof(*entry));
 		trig_idx = entry->id.idx;
 
 		if (trig_idx >= hs->total_trigs) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_INVALID_PARAM;
 		}
 
 		trig = INDEX_TO_TRIGGER(trig_idx);
 
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
 		if ((entry->data.tdata2 && !tdata2_impl) ||
 		    (entry->data.tdata3 && !tdata3_impl)) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
 
 		dbtr_trigger_setup(trig, &entry->data);
-		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 		dbtr_trigger_enable(trig);
 	}
 
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 75c8455d..76837737 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -46,12 +46,12 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 					regs->a1, regs->a0, smode,
 					SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
 			return SBI_ERR_INVALID_PARAM;
-		sbi_hart_protection_map_range(regs->a1, regs->a0);
+		sbi_hart_protection_temp_map_range(regs->a1, regs->a0);
 		if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
 			out->value = sbi_nputs((const char *)regs->a1, regs->a0);
 		else
 			out->value = sbi_ngets((char *)regs->a1, regs->a0);
-		sbi_hart_protection_unmap_range(regs->a1, regs->a0);
+		sbi_hart_protection_temp_unmap_range(regs->a1, regs->a0);
 		return 0;
 	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
 		sbi_putc(regs->a0);
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index c0a4ce1b..c530739f 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -135,7 +135,7 @@ int sbi_hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *add
  * When shared memory access is required, the physical address
  * should be programmed into the first PMP entry with R/W
  * permissions to the M-mode. Once the work is done, it should be
- * unmapped. sbi_hart_protection_map_range/sbi_hart_protection_unmap_range
+ * unmapped. sbi_hart_protection_temp_map_range/sbi_hart_protection_temp_unmap_range
  * function pair should be used to map/unmap the shared memory.
  */
 #define SBI_SMEPMP_RESV_ENTRY		0
@@ -327,7 +327,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	return 0;
 }
 
-static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
+static int sbi_hart_smepmp_temp_map_range(struct sbi_scratch *scratch,
 				     unsigned long addr, unsigned long size)
 {
 	/* shared R/W access for M and S/U mode */
@@ -359,7 +359,7 @@ static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
 	return SBI_OK;
 }
 
-static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
+static int sbi_hart_smepmp_temp_unmap_range(struct sbi_scratch *scratch,
 				       unsigned long addr, unsigned long size)
 {
 	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
@@ -436,8 +436,8 @@ static struct sbi_hart_protection epmp_protection = {
 	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
 	.configure = sbi_hart_smepmp_configure,
 	.unconfigure = sbi_hart_pmp_unconfigure,
-	.map_range = sbi_hart_smepmp_map_range,
-	.unmap_range = sbi_hart_smepmp_unmap_range,
+	.temp_map_range = sbi_hart_smepmp_temp_map_range,
+	.temp_unmap_range = sbi_hart_smepmp_temp_unmap_range,
 };
 
 int sbi_hart_pmp_init(struct sbi_scratch *scratch)
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index c4c149c8..ee4d4beb 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -196,22 +196,22 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 	return 0;
 }
 
-int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
+int sbi_hart_protection_temp_map_range(unsigned long base, unsigned long size)
 {
 	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
-	if (!hprot || !hprot->map_range)
+	if (!hprot || !hprot->temp_map_range)
 		return 0;
 
-	return hprot->map_range(sbi_scratch_thishart_ptr(), base, size);
+	return hprot->temp_map_range(sbi_scratch_thishart_ptr(), base, size);
 }
 
-int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
+int sbi_hart_protection_temp_unmap_range(unsigned long base, unsigned long size)
 {
 	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
-	if (!hprot || !hprot->unmap_range)
+	if (!hprot || !hprot->temp_unmap_range)
 		return 0;
 
-	return hprot->unmap_range(sbi_scratch_thishart_ptr(), base, size);
+	return hprot->temp_unmap_range(sbi_scratch_thishart_ptr(), base, size);
 }
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 19f59f3a..41fea0ae 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -401,10 +401,10 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 	if (flags == SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE_RETURN) {
 		ret_buf = (unsigned long *)(ulong)SHMEM_PHYS_ADDR(shmem_phys_hi,
 								  shmem_phys_lo);
-		sbi_hart_protection_map_range((unsigned long)ret_buf, mpxy_shmem_size);
+		sbi_hart_protection_temp_map_range((unsigned long)ret_buf, mpxy_shmem_size);
 		ret_buf[0] = cpu_to_lle(ms->shmem.shmem_addr_lo);
 		ret_buf[1] = cpu_to_lle(ms->shmem.shmem_addr_hi);
-		sbi_hart_protection_unmap_range((unsigned long)ret_buf, mpxy_shmem_size);
+		sbi_hart_protection_temp_unmap_range((unsigned long)ret_buf, mpxy_shmem_size);
 	}
 
 	/** Setup the new shared memory */
@@ -436,7 +436,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/** number of channel ids which can be stored in shmem adjusting
 	 * for remaining and returned fields */
@@ -466,7 +466,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 	shmem_base[0] = cpu_to_le32(remaining);
 	shmem_base[1] = cpu_to_le32(returned);
 
-	sbi_hart_protection_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	return SBI_SUCCESS;
 }
@@ -498,7 +498,7 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_protection_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/* Standard attributes range check */
 	if (mpxy_is_std_attr(base_attr_id)) {
@@ -537,7 +537,7 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 					       base_attr_id, attr_count);
 	}
 out:
-	sbi_hart_protection_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 	return ret;
 }
 
@@ -650,7 +650,7 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	mem_ptr = (u32 *)shmem_base;
 
@@ -707,7 +707,7 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 					       base_attr_id, attr_count);
 	}
 out:
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 	return ret;
 }
 
@@ -740,7 +740,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (resp_data_len) {
 		resp_buf = shmem_base;
@@ -757,7 +757,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 							     msg_data_len);
 	}
 
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (ret == SBI_ERR_TIMEOUT || ret == SBI_ERR_IO)
 		return ret;
@@ -788,12 +788,12 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 		return SBI_ERR_NOT_SUPPORTED;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 	eventsbuf = shmem_base;
 	ret = channel->get_notification_events(channel, eventsbuf,
 					       mpxy_shmem_size,
 					       events_len);
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (ret)
 		return ret;
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a0f6d2fa..aac6adb6 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1093,7 +1093,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
-	sbi_hart_protection_map_range(shmem_phys_lo, shmem_size);
+	sbi_hart_protection_temp_map_range(shmem_phys_lo, shmem_size);
 
 	einfo = (struct sbi_pmu_event_info *)(shmem_phys_lo);
 	for (i = 0; i < num_events; i++) {
@@ -1127,7 +1127,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 		}
 	}
 
-	sbi_hart_protection_unmap_range(shmem_phys_lo, shmem_size);
+	sbi_hart_protection_temp_unmap_range(shmem_phys_lo, shmem_size);
 
 	return 0;
 }
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 818afb87..ad9e6a06 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1037,7 +1037,7 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	if (ret)
 		return ret;
 
-	sbi_hart_protection_map_range(output_phys_lo, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_map_range(output_phys_lo, sizeof(unsigned long) * attr_count);
 
 	/*
 	 * Copy all attributes at once since struct sse_event_attrs is matching
@@ -1050,7 +1050,7 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	attrs = (unsigned long *)output_phys_lo;
 	copy_attrs(attrs, &e_attrs[base_attr_id], attr_count);
 
-	sbi_hart_protection_unmap_range(output_phys_lo, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_unmap_range(output_phys_lo, sizeof(unsigned long) * attr_count);
 
 	sse_event_put(e);
 
@@ -1065,7 +1065,7 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
 
-	sbi_hart_protection_map_range(input_phys, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_map_range(input_phys, sizeof(unsigned long) * attr_count);
 
 	for (id = base_attr_id; id < end_id; id++) {
 		val = attrs[attr++];
@@ -1081,7 +1081,7 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	}
 
 out:
-	sbi_hart_protection_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
 
 	return ret;
 }
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
