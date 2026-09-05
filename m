Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CAEC624D3
	for <opensbi@archiver.kernel.org>; Sat,  5 Sep 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybnfd38tVkpdWqNO56kWJvZWbTUAEPkBNmuSUWz9AiE=; b=FshwXuY3GC+jmk
	YRVLUDHqqlZbPwRuo59I3a83NntZ/F8DlHNRp0fuH+Kl932GlPQBy7f3riZrlMWMKBTFc3DrPB2qp
	H3NM6bKutpDVpeGM/ejE13oYkURjf1uB+HFZpRHcbey21rXLAjDciRlVWFKpepKf9IbSWyXHuNpAS
	ZmpusbYldUb7luGWRY6QCXAmwoKlFPC0LcBfk7YLyR4awWphc9Dhm5Q6M5D40bbuXl9lLiFYJQmhY
	0J4KqWmRD9eqYY3RF2vQOA5/txbGR3Es50/7DpORewLZgc/FD+5HBukzvPT5R3dhepnJ1RhvHI7I4
	TJqA4MMGk6bgYfShr/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHS-000000045dy-1XBM;
	Sat, 05 Sep 2026 13:18:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHP-000000045bo-1hzH
	for opensbi@lists.infradead.org;
	Sat, 05 Sep 2026 13:18:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVhBf2249638;
	Sat, 5 Sep 2026 13:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dd8CGuQHZc1
	q8HULqUu5NSRfy+GYAWE+/F9LI6mS4M8=; b=pehy0T0dPngis7uHzIxtmzdeEOA
	+DfR7LP1ua4aXjDBdAA8BPgZk9SAbchQ/h4KjNakNW+gDdzImxa5u5g8Q8aBy037
	bKCzrOfC1/4MCrArlhIjVQgsGz1rRTvH1ZQI59wfG8cyUZcTGBEIMqOdrJyHcZcV
	6n7Yz2Hh3N4ZFVAcWS2XTJB+hVhpdn4zKnITwob2yTq52eJh3xCxyRCTztx5mtWH
	hFeDWr3PUXfKZmHzkkb8HCwb6DqKh9kHFDEofN7xy9ba3y58a0p8/CIcnbM5SSL7
	7stIdFzf4/Ph6Fw2ev5ZsCCYNnl/exIyZnt1k3pg0OUi/lMgesVqW0rz89Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggba3h152-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:53 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 685DHotB4173915;
	Sat, 5 Sep 2026 13:17:50 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 685DHoj94173892
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:50 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 584E324A17; Sat,  5 Sep 2026 18:47:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 2/3] lib: sbi_domain: Re-work boot-time assignment of HARTs to non-ROOT domains
Date: Sat,  5 Sep 2026 18:47:47 +0530
Message-ID: <20260905131748.922920-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
References: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfX3HnRWxA+sTnC
 +Kk1YCVPgZRx3I3ARDwWhM7ET16U0+LD+kj3UEq48vMEn0CRvCR64j0zLdXq34ewT4OqbzlCqyc
 ZkuwC+tGMikyJbWrMv6fkunU2mIcOVxsGdExI0BXed6B17wVFC8YTE/JJKsqf9w1k8yUFoDK82D
 lc8GsiwW55U8EXQPYgpaUCW9sMC27Yv9mWhDeVrnck6e6qx4qXx2jetQolXf6+Fj1Fn9ykiyNpa
 84ROm19p7B4HKR9kK5yO2bPWopRSKJeKKXt6HcL7r6x8Wstgfxb2k3rm7N1pZPCnePJhuWNF3sP
 aP9Lgy1eQMia78UGKaJPg0jgctXFLHpjniJBg903wgzhZRiPFoTObWNLkCB9R6Gfeaia1CbqOQk
 jTWGP5dtHOONv5jkudInDrPsfMCFoZSvs61nzA/+x3Owvz8CVxAL6ntKnOEjuVOg4q24P1+gqzD
 mw80CiEyHbIIQwShf8A==
X-Proofpoint-ORIG-GUID: 6pwOT42aOfOxox3r2WX86PAPF7Tj5579
X-Proofpoint-GUID: 6pwOT42aOfOxox3r2WX86PAPF7Tj5579
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfXwz1LtQRhQhyy
 Fssyc+O3HpkTZ4vq8/HdwF5yVuL0RwFRZPD/SjFvqpAp6y7QFBP1B9WfyUpITHeccsDZCN8s36h
 0tOIgDkM9Co71iBpQVhiAN/wyGRpyyU=
X-Authority-Analysis: v=2.4 cv=Tf2mcxQh c=1 sm=1 tr=0 ts=6a9c1682 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=X-wJOS_TghTjOV6KdOQA:9
 a=6Z0L1sxyeN8VC4nQ:21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_061759_452227_87D221EC 
X-CRM114-Status: GOOD (  29.95  )
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
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Tested-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
 docs/domain_support.md             |  41 ++++--------
 include/sbi/sbi_domain.h           |   4 +-
 include/sbi_utils/fdt/fdt_domain.h |   3 +-
 lib/sbi/sbi_domain.c               |  34 +++++-----
 lib/utils/fdt/fdt_domain.c         | 102 ++---------------------------
 5 files changed, 42 insertions(+), 142 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index e267a9f7..a8c4fb3b 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -183,23 +183,16 @@ The DT properties of a domain instance DT node are as follows:
   domain instance. If not specified, defaults to the coldboot HART. Note that
   if the coldboot HART is assigned to this domain, it will be forced as
   the boot HART regardless of this property.
-* **next-arg1** (Optional) - The 64 bit next booting stage arg1 for the
-  domain instance. If this DT property is not available and coldboot HART
-  is not assigned to the domain instance then **next booting stage arg1 of coldboot HART**
-  is used as default value.
-* **next-addr** (Optional) - The 64 bit next booting stage address for the
-  domain instance. If this DT property is not available and coldboot HART
-  is not assigned to the domain instance then **0x0** is used as default
-  value. If this DT property is not available and coldboot HART is assigned
-  to the domain instance then **next booting stage address of coldboot HART**
-  is used as default value.
+* **next-arg1** (Optional) - The 64 bit next booting stage arg1
+  for the domain instance. If this DT property is not available
+  then **next booting stage arg1 of coldboot HART** is used as default value.
+* **next-addr** (Optional) - The 64 bit next booting stage address
+  for the domain instance. If this DT property is not available
+  then **next booting stage address of coldboot HART** is used as default value.
 * **next-mode** (Optional) - The 32 bit next booting stage mode for the
   domain instance. The possible values of this DT property are: **0x1**
   (S-mode), and **0x0** (U-mode). If this DT property is not available
-  and coldboot HART is not assigned to the domain instance then **0x1**
-  is used as default value. If this DT property is not available and
-  coldboot HART is assigned to the domain instance then **next booting
-  stage mode of coldboot HART** is used as default value.
+  then **next booting stage mode of coldboot HART** is used as default value.
 * **system-reset-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
@@ -207,15 +200,14 @@ The DT properties of a domain instance DT node are as follows:
 
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
 
@@ -289,7 +281,6 @@ be done:
             device_type = "cpu";
             reg = <0x00>;
             compatible = "riscv";
-            opensbi-domain = <&tdomain>;
             ...
         };
 
@@ -297,7 +288,6 @@ be done:
             device_type = "cpu";
             reg = <0x01>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
 
@@ -305,7 +295,6 @@ be done:
             device_type = "cpu";
             reg = <0x02>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
 
@@ -313,7 +302,6 @@ be done:
             device_type = "cpu";
             reg = <0x03>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
 
@@ -321,7 +309,6 @@ be done:
             device_type = "cpu";
             reg = <0x04>;
             compatible = "riscv";
-            opensbi-domain = <&udomain>;
             ...
         };
     };
diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 38784a0e..ae3fb972 100644
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
index 79d61c54..10ab9dab 100644
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
index 61627db3..152d9519 100644
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
@@ -315,12 +300,10 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	const char *inherit;
 	struct sbi_domain *dom;
 	struct sbi_hartmask *mask;
-	struct sbi_hartmask assign_mask;
 	struct parse_region_data preg;
-	int *cold_domain_offset = opaque;
 	struct sbi_domain_memregion *reg;
 	int inheritance_mode = FDT_ROOT_REGION_INHERIT_M_ONLY;
-	int i, err = 0, len, cpus_offset, cpu_offset, doffset;
+	int i, err = 0, len, cpu_offset;
 
 	dom = sbi_zalloc(sizeof(*dom));
 	if (!dom)
@@ -440,7 +423,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		val64 = fdt32_to_cpu(val[0]);
 		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
 	} else {
-		val64 = sbi_scratch_thishart_ptr()->next_arg1;
+		val64 = root.next_arg1;
 	}
 	dom->next_arg1 = val64;
 
@@ -451,8 +434,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		val64 = fdt32_to_cpu(val[0]);
 		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
 	} else {
-		if (domain_offset == *cold_domain_offset)
-			val64 = sbi_scratch_thishart_ptr()->next_addr;
+		val64 = root.next_addr;
 	}
 	dom->next_addr = val64;
 
@@ -464,8 +446,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		if (val32 != 0x0 && val32 != 0x1)
 			val32 = 0x1;
 	} else {
-		if (domain_offset == *cold_domain_offset)
-			val32 = sbi_scratch_thishart_ptr()->next_mode;
+		val32 = root.next_mode;
 	}
 	dom->next_mode = val32;
 
@@ -483,44 +464,8 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	else
 		dom->system_suspend_allowed = false;
 
-	/* Find /cpus DT node */
-	cpus_offset = fdt_path_offset(fdt, "/cpus");
-	if (cpus_offset < 0) {
-		err = cpus_offset;
-		goto fail_free_all;
-	}
-
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
 
@@ -537,43 +482,10 @@ fail_free_domain:
 
 int fdt_domains_populate(const void *fdt)
 {
-	const u32 *val;
-	int cold_domain_offset;
-	u32 hartid, cold_hartid;
-	int err, len, cpus_offset, cpu_offset;
-
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
-	return fdt_iterate_each_domain_ro(fdt, &cold_domain_offset,
-					  __fdt_parse_domain);
+	return fdt_iterate_each_domain_ro(fdt, NULL, __fdt_parse_domain);
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
