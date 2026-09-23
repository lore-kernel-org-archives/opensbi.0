Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2455C982FA
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIgBYQYHk0oNIvoqL6c02LjoxRYSO2NWQuVaIHSuExA=; b=z0fY7kFxAqNxj7
	1VvKoe5toab6j9nPb6ZHQdbhZpzi1BMC4e3UUWz3w+70gqYLxUskws7tbj8NC/wpDcqzM/JQ7Y6oK
	WTww+AoyFXtdkm4gsexjN2Ey4b1gjMQYcr5eNTgFTAqHDDo2/1mGxu/De40H5hJvLDZkQ0MZLENL0
	AAwhPPxFj5RFRB3JT9FuPUAA4UbBJgdDz/DQ8PUXF7MnlC2apUsJ1rn/qHNqUcowaYkcziYu4W5o8
	yAzlsK3SsTtm5nuWkNYeS/WJ/i/jnJBPTRRAJNaHJP6Nzbkyxy2+G76LYdBW2gbKEu364Z81mwmeU
	EkOmor+SZLfjSEkvQFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dah-0000000722y-3EAF;
	Wed, 23 Sep 2026 03:24:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dac-000000071zn-22gV
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N0Egik2645887;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yh8O27gJ2Gg
	DZH6unfK/IIyOFQho1Qfpg51ZwbcikJ4=; b=m2hqlSxqrNFXNCBT6UJFrFrX1b+
	ou2nM49WU21gMLYxw4RIiZvGJvvmD4Gg+5dOHF0GHf+c9IgpJCJiKYwemreApewr
	QABf/7P8w3ugklXNGOupNCb0KnFa0YtyLGAPVkFOTifyf9/pFEVtF7w5OvQC9XvD
	DYj0uvmo5KmDnhPwVpPVcVOmQQ5ED7gA9kay95dm5irP/F8rToZOyznuIswbAV2H
	/p3o4c38FCtwHBYWQ+w9Xg2HuqO1MbqczXqyhYa5/N/jVl2V1Rib0FkfyxkW2dEa
	avDx8HOnjFl8UpgBIoHAjXwD+eTWZL9WsQyWs9pv1RYZf2eyG5O9l7ELxHA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428rk6s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2VE016005;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O21g015970
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:02 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1922F2493C; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 07/11] lib: sbi_domain: Make domain regions as fixed array
Date: Wed, 23 Sep 2026 08:53:55 +0530
Message-ID: <20260923032359.4041876-8-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=oetqBYt1a2jYudrOgesA:9
X-Proofpoint-ORIG-GUID: SCkLsdMVfrTkE3nG3c4mAx-73ddvQ9LB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX341jvH4Tia51
 N0fj98/KCYk98OfS2EEHUAezaFiw3gGi90YoWw4/+YSIpmKvUhirITRwjrq9SSvH2gdyG/eCXWF
 7GtYJ1Drg/I9O47pp7tvkn0f+OHXLz6vzKQnyfreVAKS/A2uOWFkDw+uu1GkjvQD1rOLYEUGCRX
 i8XK4cVIzWrlK5ne5fSKe0iByEhWPOb5ERNZe3JrbE3/JqlwwoY4AUh9Vm3tWW9ZuLWh7ZNUTwF
 xtViciEy8Wvm1+egs5Y42eisfBbBRCWd0yb/XbuWi1NrSG4RVA5YkKSth5eTzAZ0kye4d1jqj6L
 /KnuQCrHzcgzpVy1FWS2a4Jx92ym3TQ38GwsWuqM4GenrnFKte9/J+D1JS6qhwj6IgitaAie81a
 vGy1c82mzyM4m85fzpKIuIsA/DI74UMoItisBGgP8td34G6N3jtLCyfmVIuiHV2EzAd3syXf3hG
 c64t38E1MrK9FDPZ19A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXxiUBvh+S8Tvw
 Wujz0SN2VBz6fpl8R1I0Mm/BJ1MCzEhlWNt69fhYYACRSQqFDg1TaBEuKBrUFlrM+2OSSHRVRxY
 MpJCjKGnht2kvLhzW3AN+grGvG0x/bA=
X-Proofpoint-GUID: SCkLsdMVfrTkE3nG3c4mAx-73ddvQ9LB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202410_603699_1E850C9F 
X-CRM114-Status: GOOD (  22.52  )
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

Instead of separately allocating domain regions, let us have a fixed
size array so that regions are automatically allocated along with
domain allocation and one SBI_DOMAIN_MEMREGION_MAX macro defines
maximum number of regions for all domains.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_domain.h       |  3 ++-
 lib/sbi/sbi_domain.c           | 42 ++++++++++------------------------
 lib/utils/fdt/fdt_domain.c     | 17 +++-----------
 platform/generic/mips/eyeq7h.c |  6 ++---
 4 files changed, 20 insertions(+), 48 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 394e7ddf..5e5b2227 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -204,7 +204,8 @@ struct sbi_domain {
 	/** Possible HARTs in this domain */
 	const struct sbi_hartmask *possible_harts;
 	/** Array of memory regions terminated by a region with order zero */
-	struct sbi_domain_memregion *regions;
+#define SBI_DOMAIN_MEMREGION_MAX	32
+	struct sbi_domain_memregion regions[SBI_DOMAIN_MEMREGION_MAX + 1];
 	/** HART id of the HART booting this domain */
 	u32 boot_hartid;
 	/** Arg1 (or 'a1' register) of next booting stage for this domain */
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index f5c62509..c28eeba6 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -24,13 +24,10 @@ SBI_LIST_HEAD(domain_list);
 static u32 domain_count = 0;
 static bool domain_finalized = false;
 
-#define ROOT_REGION_MAX	32
-
 struct sbi_domain root = {
 	.name = "root",
 	.init_order = -1U,
 	.possible_harts = NULL,
-	.regions = NULL,
 	.system_reset_allowed = true,
 	.system_suspend_allowed = true,
 	.fw_region_inited = false,
@@ -225,7 +222,7 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			   unsigned long access_flags)
 {
 	bool rmmio, mmio = false;
-	struct sbi_domain_memregion *reg;
+	const struct sbi_domain_memregion *reg;
 	unsigned long rstart, rend, rflags, rwx = 0, rrwx = 0;
 
 	if (!dom)
@@ -331,7 +328,7 @@ static const struct sbi_domain_memregion *find_region(
 						unsigned long addr)
 {
 	unsigned long rstart, rend;
-	struct sbi_domain_memregion *reg;
+	const struct sbi_domain_memregion *reg;
 
 	sbi_domain_for_each_memregion(dom, reg) {
 		rstart = reg->base;
@@ -349,7 +346,7 @@ static const struct sbi_domain_memregion *find_next_subset_region(
 				const struct sbi_domain_memregion *reg,
 				unsigned long addr)
 {
-	struct sbi_domain_memregion *sreg, *ret = NULL;
+	const struct sbi_domain_memregion *sreg, *ret = NULL;
 
 	sbi_domain_for_each_memregion(dom, sreg) {
 		if (sreg == reg || (sreg->base <= addr) ||
@@ -377,7 +374,7 @@ static void swap_region(struct sbi_domain_memregion* reg1,
 static int sbi_domain_used_memregions(const struct sbi_domain *dom)
 {
 	int count = 0;
-	struct sbi_domain_memregion *reg;
+	const struct sbi_domain_memregion *reg;
 
 	sbi_domain_for_each_memregion(dom, reg)
 		count++;
@@ -407,11 +404,6 @@ static int sanitize_domain(struct sbi_domain *dom)
 	}
 
 	/* Check memory regions */
-	if (!dom->regions) {
-		sbi_printf("%s: %s regions is NULL\n",
-			   __func__, dom->name);
-		return SBI_EINVAL;
-	}
 	sbi_domain_for_each_memregion(dom, reg) {
 		if (!is_region_valid(reg)) {
 			sbi_printf("%s: %s has invalid region base=0x%lx "
@@ -550,7 +542,7 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 {
 	u32 i, j, k;
 	unsigned long rstart, rend;
-	struct sbi_domain_memregion *reg;
+	const struct sbi_domain_memregion *reg;
 
 	sbi_printf("Domain%d Name        %s: %s\n",
 		   dom->index, suffix, dom->name);
@@ -738,8 +730,8 @@ static int root_add_memregion(const struct sbi_domain_memregion *reg)
 	int root_memregs_count = sbi_domain_used_memregions(&root);
 
 	/* Sanity checks */
-	if (!reg || domain_finalized || !root.regions ||
-	    (ROOT_REGION_MAX <= root_memregs_count))
+	if (!reg || domain_finalized ||
+	    (SBI_DOMAIN_MEMREGION_MAX <= root_memregs_count))
 		return SBI_EINVAL;
 
 	/* Check whether compatible region exists for the new one */
@@ -901,12 +893,12 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
 
 int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 {
-	int rc;
-	struct sbi_hartmask *root_hmask;
-	struct sbi_domain_memregion *root_memregs;
-	int root_memregs_count = 0;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 	bool fw_single_region = sbi_platform_single_fw_region(plat);
+	struct sbi_domain_memregion *root_memregs = root.regions;
+	struct sbi_hartmask *root_hmask;
+	int root_memregs_count = 0;
+	int rc;
 
 	SBI_INIT_LIST_HEAD(&domain_list);
 
@@ -933,19 +925,11 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	if (rc)
 		goto fail_free_domain_hart_ptr_offset;
 
-	root_memregs = sbi_calloc(sizeof(*root_memregs), ROOT_REGION_MAX + 1);
-	if (!root_memregs) {
-		sbi_printf("%s: no memory for root regions\n", __func__);
-		rc = SBI_ENOMEM;
-		goto fail_deinit_context;
-	}
-	root.regions = root_memregs;
-
 	root_hmask = sbi_zalloc(sizeof(*root_hmask));
 	if (!root_hmask) {
 		sbi_printf("%s: no memory for root hartmask\n", __func__);
 		rc = SBI_ENOMEM;
-		goto fail_free_root_memregs;
+		goto fail_deinit_context;
 	}
 	root.possible_harts = root_hmask;
 
@@ -1014,8 +998,6 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 
 fail_free_root_hmask:
 	sbi_free(root_hmask);
-fail_free_root_memregs:
-	sbi_free(root_memregs);
 fail_deinit_context:
 	sbi_domain_context_deinit();
 fail_free_domain_hart_ptr_offset:
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 575fbdf0..e4cce8c3 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -223,14 +223,12 @@ skip_device_disable:
 	fdt_nop_node(fdt, poffset);
 }
 
-#define FDT_DOMAIN_REGION_MAX_COUNT		16
 #define FDT_ROOT_REGION_INHERIT_M_ONLY		0
 #define FDT_ROOT_REGION_INHERIT_ALL		1
 
 struct parse_region_data {
 	struct sbi_domain *dom;
 	u32 region_count;
-	u32 max_regions;
 };
 
 static int __fdt_parse_region(const void *fdt, int domain_offset,
@@ -257,7 +255,7 @@ static int __fdt_parse_region(const void *fdt, int domain_offset,
 		return SBI_EINVAL;
 
 	/* Find next region of the domain */
-	if (preg->max_regions <= preg->region_count)
+	if (SBI_DOMAIN_MEMREGION_MAX <= preg->region_count)
 		return SBI_ENOSPC;
 
 	/* Read "base" DT property */
@@ -309,20 +307,13 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	if (!dom)
 		return SBI_ENOMEM;
 
-	dom->regions = sbi_calloc(sizeof(*dom->regions),
-				  FDT_DOMAIN_REGION_MAX_COUNT + 1);
-	if (!dom->regions) {
-		err = SBI_ENOMEM;
-		goto fail_free_domain;
-	}
 	preg.dom = dom;
 	preg.region_count = 0;
-	preg.max_regions = FDT_DOMAIN_REGION_MAX_COUNT;
 
 	mask = sbi_zalloc(sizeof(*mask));
 	if (!mask) {
 		err = SBI_ENOMEM;
-		goto fail_free_regions;
+		goto fail_free_domain;
 	}
 
 	/* Read DT node name */
@@ -405,7 +396,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		if (!copy)
 			continue;
 
-		if (preg.max_regions <= preg.region_count) {
+		if (SBI_DOMAIN_MEMREGION_MAX <= preg.region_count) {
 			err = SBI_EINVAL;
 			goto fail_free_all;
 		}
@@ -481,8 +472,6 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 
 fail_free_all:
 	sbi_free(mask);
-fail_free_regions:
-	sbi_free(dom->regions);
 fail_free_domain:
 	sbi_free(dom);
 	return err;
diff --git a/platform/generic/mips/eyeq7h.c b/platform/generic/mips/eyeq7h.c
index 30af096c..f08b5197 100644
--- a/platform/generic/mips/eyeq7h.c
+++ b/platform/generic/mips/eyeq7h.c
@@ -120,7 +120,7 @@ static const struct sbi_hsm_device eyeq7h_hsm = {
 	.hart_stop	= mips_p8700_hart_stop,
 };
 
-static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain *dom)
+static struct sbi_domain_memregion *find_last_memregion(struct sbi_domain *dom)
 {
 	struct sbi_domain_memregion *reg;
 
@@ -128,7 +128,7 @@ static struct sbi_domain_memregion *find_last_memregion(const struct sbi_domain
 	return --reg;
 }
 
-static int fixup_dram_region(const struct sbi_domain *dom,
+static int fixup_dram_region(struct sbi_domain *dom,
 			     struct sbi_domain_memregion *reg)
 {
 	const void *fdt = fdt_get_address();
@@ -297,7 +297,7 @@ static void eyeq7h_init_clusters(void)
 
 static int eyeq7h_early_init(bool cold_boot)
 {
-	const struct sbi_domain *dom;
+	struct sbi_domain *dom;
 	struct sbi_domain_memregion *reg;
 	int rc;
 	unsigned long cm_base;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
