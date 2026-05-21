Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456A0CD4F5E
	for <opensbi@archiver.kernel.org>; Thu, 21 May 2026 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhQmWFlXUvPHUW0FHQIvHbVFX3gIylVnzsIudHlv5Rs=; b=bJqTMepvi8cRc2
	rP0hhI5kSESW2T1c8074N07dExHkBCfvs3XQ4O7KqaiPYcMj6VTNtO4dKsk+Hnz+PDeD4+/+NZptm
	pdqFKrjZRgnjTg6h07ldKQqiV2aMahUPnfvnqiU2s6xl4ANwvwkgE3DxVJ+ipGc+yvaDF56dRn7RA
	I95aNmYLwuQuY/TrR6pjD7xB0sFMDm57T397eSPiwV/ZZIHjfOjTq0ihTDLyBev/Nb2R6M+4fL7OS
	fFnmJTvyJcfir99zShWE6BkbyGt9I02kTPynO/MKvNYJNpw6Lf4YYBjRbV67lLiaWeDOc8Ih5VC5x
	O7q0hdjMQJzLLl2jE0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyk3-000000078O1-3L9B;
	Thu, 21 May 2026 08:26:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyk1-000000078Me-0zA1
	for opensbi@lists.infradead.org;
	Thu, 21 May 2026 08:26:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L68pjQ3110737;
	Thu, 21 May 2026 08:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tn5Pl5Al/KL
	lt6BXQdBTit0ivAxMLdkSL8yGwJX9dK0=; b=gDl55nd2Ja6InQDj6NASp1i+Kdt
	VLgzw6lLExy+9i6B41qf9PmNgs0/VMwLSjod6yZT1ZZA54cUFHf36eU+OcX+EAXy
	ga8C6ZlgpnF348pAZvCgxDDx0i+L+/0oqQ4wQ9QafPWxdEqwQ18ldAq1qkFeEQvm
	a3+LHRg2/wIhVvs0wKVO9ckSXKePEd4qwWIqo7ZWJZUnVK5TAItewHOsTxndPWRA
	afzsRXm0iWaktKEgoJ1xEvrZZbs/QrH/lihGH3Ect1Vuqeazx7PDHmcC9Bs2ABQa
	rVj3EH/WEE/enRSyigg0X4K7M+Ri7H1Wdkr++UwbIHS+3jnuiXMkya+G4tw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbgj3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64L8QUXB028217;
	Thu, 21 May 2026 08:26:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712gbkjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:30 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64L8QUST028204;
	Thu, 21 May 2026 08:26:30 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64L8QUH4028199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:30 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 84EEC222FE; Thu, 21 May 2026 13:56:29 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 2/2] platform: generic: Optimize extensions_init() to parse ISA extensions once
Date: Thu, 21 May 2026 13:56:25 +0530
Message-ID: <20260521082625.1520870-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521082625.1520870-1-anup.patel@oss.qualcomm.com>
References: <20260521082625.1520870-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MSBTYWx0ZWRfXzSBF/n6BGbna
 krOfigK8tEW//rK4cmTjnNMXnf9ZSHRN+BOEEppqJ/9q6KKGNEu6JZZzmk/v3ROaiUiKkhEfA+B
 ma/9XmttjmJg1pwhKYt89cihL9bTpZZAbeHhEFqNFlnmLREB05vNH/eNCsMaoIp6/dAcIOwlbmu
 IyudSIf5P/DcnNT9dNsyw24JW/NRIHkmzRZPrWa4SxAJV4rfmnAdGmb9i9z+PNKlozc8I7le3DR
 cWmAq8Cl7KPSei/taXyM1JZdm8Hh/YS2eTcW7S5TOEpnq02boOSKP1FCTkI5QcMDmQn356uF96W
 OyWDq0hqZZ5PzNM6W75s02SVcwvFuuAoK000ku5iWU1D5sYsZLjhyj8dahs/ObypDdGgEh3KnYy
 AbZ/E1OqkyAqkDEtlY5HSxpEfehQWkB5We9f0sYURlxyxHWiDHeyESJtwL7dd6Zf1ympgBC0jNi
 6ZY0yPDpUl94Gi9eERQ==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ec1b9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=YUzETBFewA54k1blHrQA:9
X-Proofpoint-GUID: 2QLDKCRcjfOVlm0iuymxwKtBF7jqElZ6
X-Proofpoint-ORIG-GUID: 2QLDKCRcjfOVlm0iuymxwKtBF7jqElZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012653_394732_EE1EE041 
X-CRM114-Status: GOOD (  23.84  )
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

Instead of parsing ISA extensions separately for each hart in the
generic_extensions_init() function, it is better to parse ISA extensions
for all available harts in the cold boot path. Also, this allows us
to remove fdt_isa_bitmap from scratch space and directly initialize
"extensions" in struct sbi_hart_features for each hart.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_platform.h                   |  7 ++-
 include/sbi_utils/fdt/fdt_helper.h           |  3 +-
 lib/sbi/sbi_hart.c                           |  7 ++-
 lib/utils/fdt/fdt_helper.c                   | 47 ++++----------------
 platform/generic/allwinner/sun20i-d1.c       |  7 ++-
 platform/generic/andes/andes_pmu.c           |  5 ++-
 platform/generic/eswin/eic770x.c             |  1 +
 platform/generic/include/andes/andes_pmu.h   |  4 +-
 platform/generic/include/platform_override.h |  3 +-
 platform/generic/platform.c                  |  8 ++--
 platform/generic/sophgo/sg2042.c             |  4 +-
 platform/generic/starfive/jh7110.c           |  1 +
 platform/generic/thead/thead-generic.c       |  4 +-
 13 files changed, 37 insertions(+), 64 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index fe382b56..7a4f9242 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -55,7 +55,6 @@
 struct sbi_domain_memregion;
 struct sbi_ecall_return;
 struct sbi_trap_regs;
-struct sbi_hart_features;
 union sbi_ldst_data;
 
 /** Possible feature flags of a platform */
@@ -105,7 +104,7 @@ struct sbi_platform_operations {
 	int (*misa_get_xlen)(void);
 
 	/** Initialize (or populate) HART extensions for the platform */
-	int (*extensions_init)(struct sbi_hart_features *hfeatures);
+	int (*extensions_init)(bool cold_boot);
 
 	/** Initialize (or populate) domains for the platform */
 	int (*domains_init)(void);
@@ -486,10 +485,10 @@ static inline int sbi_platform_misa_xlen(const struct sbi_platform *plat)
  */
 static inline int sbi_platform_extensions_init(
 					const struct sbi_platform *plat,
-					struct sbi_hart_features *hfeatures)
+					bool cold_boot)
 {
 	if (plat && sbi_platform_ops(plat)->extensions_init)
-		return sbi_platform_ops(plat)->extensions_init(hfeatures);
+		return sbi_platform_ops(plat)->extensions_init(cold_boot);
 	return 0;
 }
 
diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 04c850cc..75a564d1 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -54,8 +54,7 @@ int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *c
 
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
-int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
-			     unsigned long *extensions);
+int fdt_parse_isa_extensions_all_harts(const void *fdt);
 
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index e7360712..21713816 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -508,7 +508,7 @@ static int hart_mhpm_get_allowed_bits(void)
 	return num_bits;
 }
 
-static int hart_detect_features(struct sbi_scratch *scratch)
+static int hart_detect_features(struct sbi_scratch *scratch, bool cold_boot)
 {
 	struct sbi_trap_info trap = {0};
 	struct sbi_hart_features *hfeatures =
@@ -525,8 +525,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
 	 * Needed to detect Smrnmi and install NMI handlers before CSR probes
 	 * that may trigger traps.
 	 */
-	rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr(),
-					  hfeatures);
+	rc = sbi_platform_extensions_init(sbi_platform_ptr(scratch), cold_boot);
 	if (rc)
 		return rc;
 
@@ -764,7 +763,7 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 			return SBI_ENOMEM;
 	}
 
-	rc = hart_detect_features(scratch);
+	rc = hart_detect_features(scratch, cold_boot);
 	if (rc)
 		return rc;
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b57eae1a..ad4efaaf 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -328,8 +328,6 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq)
 
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
-static unsigned long fdt_isa_bitmap_offset;
-
 static int fdt_parse_isa_one_hart(const char *isa, unsigned long *extensions)
 {
 	size_t i, j, isa_len;
@@ -409,15 +407,15 @@ static void fdt_parse_isa_extensions_one_hart(const char *isa,
 	}
 }
 
-static int fdt_parse_isa_all_harts(const void *fdt)
+int fdt_parse_isa_extensions_all_harts(const void *fdt)
 {
 	u32 hartid;
 	const fdt32_t *val;
-	unsigned long *hart_exts;
 	struct sbi_scratch *scratch;
+	struct sbi_hart_features *hfeatures;
 	int err, cpu_offset, cpus_offset, len;
 
-	if (!fdt || !fdt_isa_bitmap_offset)
+	if (!fdt)
 		return SBI_EINVAL;
 
 	cpus_offset = fdt_path_offset(fdt, "/cpus");
@@ -436,13 +434,14 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 		if (!scratch)
 			return SBI_ENOENT;
 
-		hart_exts = sbi_scratch_offset_ptr(scratch,
-						   fdt_isa_bitmap_offset);
+		hfeatures = sbi_hart_features_ptr(scratch);
+		if (!hfeatures)
+			return SBI_ENOENT;
 
 		val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
 		if (val && len > 0) {
 			fdt_parse_isa_extensions_one_hart((const char *)val,
-							  hart_exts, len);
+							  hfeatures->extensions, len);
 			continue;
 		}
 
@@ -450,7 +449,7 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 		if (!val || len <= 0)
 			return SBI_ENOENT;
 
-		err = fdt_parse_isa_one_hart((const char *)val, hart_exts);
+		err = fdt_parse_isa_one_hart((const char *)val, hfeatures->extensions);
 		if (err)
 			return err;
 	}
@@ -458,36 +457,6 @@ static int fdt_parse_isa_all_harts(const void *fdt)
 	return 0;
 }
 
-int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
-			unsigned long *extensions)
-{
-	int rc, i;
-	unsigned long *hart_exts;
-	struct sbi_scratch *scratch;
-
-	if (!fdt_isa_bitmap_offset) {
-		fdt_isa_bitmap_offset = sbi_scratch_alloc_offset(
-					sizeof(*hart_exts) *
-					BITS_TO_LONGS(SBI_HART_EXT_MAX));
-		if (!fdt_isa_bitmap_offset)
-			return SBI_ENOMEM;
-
-		rc = fdt_parse_isa_all_harts(fdt);
-		if (rc)
-			return rc;
-	}
-
-	scratch = sbi_hartid_to_scratch(hartid);
-	if (!scratch)
-		return SBI_ENOENT;
-
-	hart_exts = sbi_scratch_offset_ptr(scratch, fdt_isa_bitmap_offset);
-
-	for (i = 0; i < BITS_TO_LONGS(SBI_HART_EXT_MAX); i++)
-		extensions[i] |= hart_exts[i];
-	return 0;
-}
-
 static int fdt_parse_uart_node_common(const void *fdt, int nodeoffset,
 				      struct platform_uart_data *uart,
 				      unsigned long default_freq,
diff --git a/platform/generic/allwinner/sun20i-d1.c b/platform/generic/allwinner/sun20i-d1.c
index 666473c1..4ea90158 100644
--- a/platform/generic/allwinner/sun20i-d1.c
+++ b/platform/generic/allwinner/sun20i-d1.c
@@ -12,6 +12,7 @@
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
@@ -197,11 +198,12 @@ static int sun20i_d1_final_init(bool cold_boot)
 	return generic_final_init(cold_boot);
 }
 
-static int sun20i_d1_extensions_init(struct sbi_hart_features *hfeatures)
+static int sun20i_d1_extensions_init(bool cold_boot)
 {
+	struct sbi_hart_features *hfeatures;
 	int rc;
 
-	rc = generic_extensions_init(hfeatures);
+	rc = generic_extensions_init(cold_boot);
 	if (rc)
 		return rc;
 
@@ -209,6 +211,7 @@ static int sun20i_d1_extensions_init(struct sbi_hart_features *hfeatures)
 
 	/* auto-detection doesn't work on t-head c9xx cores */
 	/* D1 has 29 mhpmevent csrs, but only 3-9,13-17 have valid value */
+	hfeatures = sbi_hart_features_ptr(sbi_scratch_thishart_ptr());
 	hfeatures->mhpm_mask = 0x0003e3f8;
 	hfeatures->mhpm_bits = 64;
 
diff --git a/platform/generic/andes/andes_pmu.c b/platform/generic/andes/andes_pmu.c
index 9eee4edc..b3e49e8d 100644
--- a/platform/generic/andes/andes_pmu.c
+++ b/platform/generic/andes/andes_pmu.c
@@ -9,6 +9,7 @@
 #include <andes/andes_pmu.h>
 #include <sbi/sbi_bitops.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_pmu.h>
 #include <libfdt.h>
 #include <platform_override.h>
@@ -58,12 +59,12 @@ static struct sbi_pmu_device andes_pmu = {
 	.hw_counter_filter_mode = andes_hw_counter_filter_mode
 };
 
-int andes_pmu_extensions_init(struct sbi_hart_features *hfeatures)
+int andes_pmu_extensions_init(bool cold_boot)
 {
 	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	int rc;
 
-	rc = generic_extensions_init(hfeatures);
+	rc = generic_extensions_init(cold_boot);
 	if (rc)
 		return rc;
 
diff --git a/platform/generic/eswin/eic770x.c b/platform/generic/eswin/eic770x.c
index 7330df9f..60d28c51 100644
--- a/platform/generic/eswin/eic770x.c
+++ b/platform/generic/eswin/eic770x.c
@@ -10,6 +10,7 @@
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_math.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_hart_protection.h>
 #include <eswin/eic770x.h>
diff --git a/platform/generic/include/andes/andes_pmu.h b/platform/generic/include/andes/andes_pmu.h
index ad4564a6..e4446364 100644
--- a/platform/generic/include/andes/andes_pmu.h
+++ b/platform/generic/include/andes/andes_pmu.h
@@ -7,9 +7,9 @@
 #ifndef _RISCV_ANDES_PMU_H
 #define _RISCV_ANDES_PMU_H
 
-#include <sbi/sbi_hart.h>
+#include <sbi/sbi_types.h>
 
 int andes_pmu_init(void);
-int andes_pmu_extensions_init(struct sbi_hart_features *hfeatures);
+int andes_pmu_extensions_init(bool cold_boot);
 
 #endif /* _RISCV_ANDES_PMU_H */
diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 3e6e5044..1b8127cb 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -10,7 +10,6 @@
 #ifndef __PLATFORM_OVERRIDE_H__
 #define __PLATFORM_OVERRIDE_H__
 
-#include <sbi/sbi_hart.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_types.h>
 #include <sbi_utils/fdt/fdt_driver.h>
@@ -19,7 +18,7 @@ bool generic_cold_boot_allowed(u32 hartid);
 int generic_nascent_init(void);
 int generic_early_init(bool cold_boot);
 int generic_final_init(bool cold_boot);
-int generic_extensions_init(struct sbi_hart_features *hfeatures);
+int generic_extensions_init(bool cold_boot);
 int generic_domains_init(void);
 int generic_pmu_init(void);
 uint64_t generic_pmu_xlate_to_mhpmevent(uint32_t event_idx, uint64_t data);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 01fa03e0..1df0280d 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -253,11 +253,13 @@ int generic_final_init(bool cold_boot)
 	return 0;
 }
 
-int generic_extensions_init(struct sbi_hart_features *hfeatures)
+int generic_extensions_init(bool cold_boot)
 {
+	if (!cold_boot)
+		return 0;
+
 	/* Parse the ISA string from FDT and enable the listed extensions */
-	return fdt_parse_isa_extensions(fdt_get_address(), current_hartid(),
-					hfeatures->extensions);
+	return fdt_parse_isa_extensions_all_harts(fdt_get_address());
 }
 
 int generic_domains_init(void)
diff --git a/platform/generic/sophgo/sg2042.c b/platform/generic/sophgo/sg2042.c
index c2447c3c..ac8840e8 100644
--- a/platform/generic/sophgo/sg2042.c
+++ b/platform/generic/sophgo/sg2042.c
@@ -49,11 +49,11 @@ static int sophgo_sg2042_early_init(bool cold_boot)
 	return 0;
 }
 
-static int sophgo_sg2042_extensions_init(struct sbi_hart_features *hfeatures)
+static int sophgo_sg2042_extensions_init(bool cold_boot)
 {
 	int rc;
 
-	rc = generic_extensions_init(hfeatures);
+	rc = generic_extensions_init(cold_boot);
 	if (rc)
 		return rc;
 
diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
index c1328437..7008386a 100644
--- a/platform/generic/starfive/jh7110.c
+++ b/platform/generic/starfive/jh7110.c
@@ -12,6 +12,7 @@
 #include <platform_override.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_bitops.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_timer.h>
diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
index ddb4f0bf..fef0871b 100644
--- a/platform/generic/thead/thead-generic.c
+++ b/platform/generic/thead/thead-generic.c
@@ -26,11 +26,11 @@ static int thead_tlb_flush_early_init(bool cold_boot)
 	return generic_early_init(cold_boot);
 }
 
-static int thead_pmu_extensions_init(struct sbi_hart_features *hfeatures)
+static int thead_pmu_extensions_init(bool cold_boot)
 {
 	int rc;
 
-	rc = generic_extensions_init(hfeatures);
+	rc = generic_extensions_init(cold_boot);
 	if (rc)
 		return rc;
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
