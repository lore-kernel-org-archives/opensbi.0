Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3516C5AC9E
	for <opensbi@archiver.kernel.org>; Fri,  7 Aug 2026 04:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/ydNIYKBJtHiz47Z5cYBhU2o+sHEnB5Yhjn4XMYoWw=; b=rkgtTuIwfcK3jX
	LZ7O9aLLV+MQ+zS4cHMQFtHLq9ic2h7Ur/TY9vhzjlYEhFk0qo6aD3CENJDITG8dKpf0oXU+UfDhZ
	yVItfNLWC/9Om8wLZRAfpxpnqnR7FYla/QDHDpKurs2n+6PuKQwJ/2NlMsMVKfwSha6YwxooFK0qZ
	66Yo1AAL6UuzmkL2bz2FV1suuWgqGu+ftfkY+8QkzJlJGDs++SIlX0vRC1t68a0tjcjSt0dik6Xpo
	1JEV2g4E99IZNbV9iHRP1EVJYzslvRQJwrVx2xiiwDrN5gPlEU8EGnS4GuanW5/6Rv4gkpU5H4fnP
	sn7UpvvqveDhlpsPYWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCXB-000000075rZ-1rVl;
	Fri, 07 Aug 2026 04:50:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCX6-000000075pe-3RwW
	for opensbi@lists.infradead.org;
	Fri, 07 Aug 2026 04:50:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Glie3829286;
	Fri, 7 Aug 2026 04:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQw3EiTr1JA
	xJ5rmd1tnAhtpzUME7bYt5q/OFIOBY6k=; b=V09PRRUmZ0XJEje/z490df8RYRq
	llZOIuRI+ADe0AXFoqf4hz8F3EHWkx7GO+T2z78vuRITeClA9bF75mciCMTCHDT2
	TgEm/qQNWt75gdCKLZS/TG408DcAlikTEGGCthUx4H/IGcImPOk5IEaJrd3o7Xgf
	eG77hIj+Hq0T508bA7YwPHk5pCaDexeOJhhjsXFdYhxLTwIuEBZ8yTzbwo1aPBvR
	79fJ0kchfUZGB3VyFZIrZ0Ri68FR0W9Pc4SqxEvSs7HOWN2GZwxLQQXiEBtiIRA+
	G9CPbCOlDLG7KSCi2L+7Pt4CgM8cNP6ptQ8yqq0EyVwASGRIAXAt6/u/DOQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gtb6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6774o5KK018715;
	Fri, 7 Aug 2026 04:50:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vm119p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:05 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6774o5Wo018690;
	Fri, 7 Aug 2026 04:50:05 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6774o5UU018684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:05 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BFFB024B09; Fri,  7 Aug 2026 10:20:04 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 2/3] lib: sbi_domain: Re-work boot-time assignment of HARTs to non-ROOT domains
Date: Fri,  7 Aug 2026 10:20:01 +0530
Message-ID: <20260807045002.2538935-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807045002.2538935-1-anup.patel@oss.qualcomm.com>
References: <20260807045002.2538935-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a756400 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ZJOUiLeJ6B_-f_V8wgkA:9
X-Proofpoint-GUID: TDLc7tjUloOUvM64q_yQDdLzVVY7UJM-
X-Proofpoint-ORIG-GUID: TDLc7tjUloOUvM64q_yQDdLzVVY7UJM-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAzMiBTYWx0ZWRfX+KACknokYeVl
 OUPfB1KylSdT10VVdun2Ss0va/r67EzkHOTh7zbDZ7GbL5Zu88KB+koka4HJhsCAqCfSByMpHub
 HH6DkqqClXgtnvx4acRJyTzHXdVkXtE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAzMiBTYWx0ZWRfXxacDvYrErUzV
 Ahoo7tZz/yr+2NXA3L/mf5bSYYPYXBmCKcxzGyZpMq395GO81H2oj8FJ7dIANyt/5nhttu56s7S
 T/VSGBHUm3z5FIRSDJ1ymB2pT9Mk1jJp27Z/ZlwQ5smCLhFqXt/veUFaYDFWq1ZSth93BbcVP4L
 a74bm5fku3Ub88fMrwjORiha1Hio/MYP2fu/tziPai5WAPNtRu20pbqziy8zxkC3I8Tj1U5vEpv
 9F1s/+LLqYgptwnPg6onmtffKp+xa7o91dtoW2Th89Zq/Pq7qZH2+J0WXGzcwiubKDuGyS7xn2Q
 D7/M7HMcobiEbpvxmgBNH/2CWMUCNtC0O6o106yTO0DfUF55GuYuez/U0pOxlEIXQMXPc+0mHI6
 BJywjqmqxPe1n6qZIorKpjEiVfG5nK1sshJC1O3qSJi52Z26C75V4yys6DXHeoKgI8tZrZbe9tC
 12RO0GyavSItnmyFfKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_215012_984979_009E23BE 
X-CRM114-Status: GOOD (  28.19  )
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

Assign a non-ROOT domain to a HART on first come first serve basis if the
HART is listed as a possible HART of the non-ROOT domain. If no non-ROOT
domain list a HART as possible HART then the HART is assigned to the ROOT
domain.

This allows us to drop the OpenSBI specific DT property from each CPU DT
node (aka "opensbi-domain" Dt property).

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 docs/domain_support.md             | 20 +++----
 include/sbi/sbi_domain.h           |  4 +-
 include/sbi_utils/fdt/fdt_domain.h |  3 +-
 lib/sbi/sbi_domain.c               | 34 ++++++------
 lib/utils/fdt/fdt_domain.c         | 86 +++---------------------------
 5 files changed, 36 insertions(+), 111 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index e267a9f7..82f155e1 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -207,15 +207,14 @@ The DT properties of a domain instance DT node are as follows:
 
 ### Assigning HART To Domain Instance
 
-By default, all HARTs are assigned to **the ROOT domain**. The OpenSBI
-platform support can provide the HART to domain instance assignment using
-platform specific callback.
+At boot-time, a HART is assigned to a non-ROOT domain on first come
+first serve basis if the HART is listed as a possible HART of the
+non-ROOT domain. If no non-ROOT domain list a HART as possible HART
+then the HART is assigned to **the ROOT domain**.
 
-The HART to domain instance assignment can be parsed from the device tree
-using optional DT property **opensbi-domain** in each CPU DT node. The
-value of DT property **opensbi-domain** is the DT phandle of the domain
-instance DT node. If **opensbi-domain** DT property is not specified then
-corresponding HART is assigned to **the ROOT domain**.
+At runtime, the assignment of a HART can change from one domain to
+another domain as long as the HART is listed in possible HARTs of
+both domains.
 
 ### Domain Configuration Only Accessible to OpenSBI
 
@@ -289,7 +288,6 @@ be done:
             device_type = "cpu";
             reg = <0x00>;
             compatible = "riscv";
-            opensbi-domain = <&tdomain>;
             ...
         };
 
@@ -297,7 +295,6 @@ be done:
             device_type = "cpu";
             reg = <0x01>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
 
@@ -305,7 +302,6 @@ be done:
             device_type = "cpu";
             reg = <0x02>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
 
@@ -313,7 +309,6 @@ be done:
             device_type = "cpu";
             reg = <0x03>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
 
@@ -321,7 +316,6 @@ be done:
             device_type = "cpu";
             reg = <0x04>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
     };
diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 16edd4ce..b6731c04 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -328,12 +328,10 @@ void sbi_domain_dump_all(const char *suffix);
 /**
  * Register a new domain
  * @param dom pointer to domain
- * @param assign_mask pointer to HART mask of HARTs assigned to the domain
  *
  * @return 0 on success and negative error code on failure
  */
-int sbi_domain_register(struct sbi_domain *dom,
-			const struct sbi_hartmask *assign_mask);
+int sbi_domain_register(struct sbi_domain *dom);
 
 /**
  * Add a memory range with its flags to the root domain
diff --git a/include/sbi_utils/fdt/fdt_domain.h b/include/sbi_utils/fdt/fdt_domain.h
index 8c2dee09..a366b271 100644
--- a/include/sbi_utils/fdt/fdt_domain.h
+++ b/include/sbi_utils/fdt/fdt_domain.h
@@ -50,8 +50,7 @@ int fdt_iterate_each_memregion(void *fdt, int domain_offset, void *opaque,
  *
  * This routine:
  * 1. Disables MMIO devices not accessible to the coldboot HART domain
- * 2. Removes "opensbi-domain" DT property from CPU DT nodes
- * 3. Removes domain configuration DT node under /chosen DT node
+ * 2. Removes domain configuration DT node under /chosen DT node
  *
  * It is recommended that platform support call this function in
  * their final_init() platform operation.
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index fa69170b..af753459 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -625,16 +625,14 @@ void sbi_domain_dump_all(const char *suffix)
 	}
 }
 
-int sbi_domain_register(struct sbi_domain *dom,
-			const struct sbi_hartmask *assign_mask)
+int sbi_domain_register(struct sbi_domain *dom)
 {
-	u32 i;
-	int rc;
+	u32 i, cold_hartid = current_hartid();
 	struct sbi_domain *tdom;
-	u32 cold_hartid = current_hartid();
+	int rc;
 
 	/* Sanity checks */
-	if (!dom || !assign_mask || domain_finalized)
+	if (!dom || domain_finalized)
 		return SBI_EINVAL;
 
 	/* Check if domain already discovered */
@@ -663,15 +661,21 @@ int sbi_domain_register(struct sbi_domain *dom,
 	/* Clear assigned HARTs of domain */
 	sbi_hartmask_clear_all(&dom->assigned_harts);
 
-	/* Assign domain to HART if HART is a possible HART */
-	sbi_hartmask_for_each_hartindex(i, assign_mask) {
-		if (!sbi_hartmask_test_hartindex(i, dom->possible_harts))
-			continue;
-
+	/*
+	 * Assign a non-ROOT domain to a HART on first come first serve
+	 * basis if the HART is listed as a possible HART of the non-ROOT
+	 * domain. If no non-ROOT domain list a HART as possible HART then
+	 * the HART is assigned to the ROOT domain.
+	 */
+	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
 		tdom = sbi_hartindex_to_domain(i);
-		if (tdom)
-			sbi_hartmask_clear_hartindex(i,
-					&tdom->assigned_harts);
+		if (tdom) {
+			if (tdom == &root)
+				sbi_hartmask_clear_hartindex(i, &tdom->assigned_harts);
+			else
+				continue;
+		}
+
 		sbi_update_hartindex_to_domain(i, dom);
 		sbi_hartmask_set_hartindex(i, &dom->assigned_harts);
 
@@ -975,7 +979,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 		sbi_hartmask_set_hartindex(i, root_hmask);
 
 	/* Finally register the root domain */
-	rc = sbi_domain_register(&root, root_hmask);
+	rc = sbi_domain_register(&root);
 	if (rc)
 		goto fail_free_root_hmask;
 
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 61627db3..31786e0e 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -170,26 +170,11 @@ static int __fixup_disable_devices(void *fdt, int doff, int roff,
 
 void fdt_domain_fixup(void *fdt)
 {
-	u32 i, dcount;
+	u32 dcount;
 	int err, poffset, doffset;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	struct __fixup_find_domain_offset_info fdo;
 
-	/* Remove the domain assignment DT property from CPU DT nodes */
-	poffset = fdt_path_offset(fdt, "/cpus");
-	if (poffset < 0)
-		return;
-	fdt_for_each_subnode(doffset, fdt, poffset) {
-		err = fdt_parse_hart_id(fdt, doffset, &i);
-		if (err)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, doffset))
-			continue;
-
-		fdt_nop_property(fdt, doffset, "opensbi-domain");
-	}
-
 	/* Skip device disable for root domain */
 	if (!dom->index)
 		goto skip_device_disable;
@@ -315,12 +300,11 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	const char *inherit;
 	struct sbi_domain *dom;
 	struct sbi_hartmask *mask;
-	struct sbi_hartmask assign_mask;
 	struct parse_region_data preg;
 	int *cold_domain_offset = opaque;
 	struct sbi_domain_memregion *reg;
 	int inheritance_mode = FDT_ROOT_REGION_INHERIT_M_ONLY;
-	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
+	int i, err = 0, len, cpus_offset, cpu_offset;
 
 	dom = sbi_zalloc(sizeof(*dom));
 	if (!dom)
@@ -368,6 +352,10 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 			if (!fdt_node_is_enabled(fdt, cpu_offset))
 				continue;
 
+			if (*cold_domain_offset == -1 &&
+			    val32 == current_hartid())
+				*cold_domain_offset = domain_offset;
+
 			sbi_hartmask_set_hartid(val32, mask);
 		}
 	}
@@ -490,37 +478,8 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		goto fail_free_all;
 	}
 
-	/* HART to domain assignment mask based on CPU DT nodes */
-	sbi_hartmask_clear_all(&assign_mask);
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &val32);
-		if (err)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(val32))
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
-			continue;
-
-		/* This is an optional property */
-		val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
-		if (!val || len < 4)
-			continue;
-
-		/* However, it should be valid if specified */
-		doffset = fdt_node_offset_by_phandle(fdt, fdt32_to_cpu(*val));
-		if (doffset < 0) {
-			err = doffset;
-			goto fail_free_all;
-		}
-
-		if (doffset == domain_offset)
-			sbi_hartmask_set_hartid(val32, &assign_mask);
-	}
-
 	/* Register the domain */
-	err = sbi_domain_register(dom, &assign_mask);
+	err = sbi_domain_register(dom);
 	if (err)
 		goto fail_free_all;
 
@@ -537,43 +496,14 @@ fail_free_domain:
 
 int fdt_domains_populate(const void *fdt)
 {
-	const u32 *val;
 	int cold_domain_offset;
-	u32 hartid, cold_hartid;
-	int err, len, cpus_offset, cpu_offset;
 
 	/* Sanity checks */
 	if (!fdt)
 		return SBI_EINVAL;
 
-	/* Find /cpus DT node */
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0)
-		return cpus_offset;
-
-	/* Find coldboot HART domain DT node offset */
-	cold_domain_offset = -1;
-	cold_hartid = current_hartid();
-	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		if (hartid != cold_hartid)
-			continue;
-
-		if (!fdt_node_is_enabled(fdt, cpu_offset))
-			continue;
-
-		val = fdt_getprop(fdt, cpu_offset, "opensbi-domain", &len);
-		if (val && len >= 4)
-			cold_domain_offset = fdt_node_offset_by_phandle(fdt,
-							   fdt32_to_cpu(*val));
-
-		break;
-	}
-
 	/* Iterate over each domain in FDT and populate details */
+	cold_domain_offset = -1;
 	return fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
 					  __fdt_parse_domain);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
