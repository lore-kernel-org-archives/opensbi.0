Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D63FC5AC7A
	for <opensbi@archiver.kernel.org>; Fri,  7 Aug 2026 04:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzX0LKo9eX2EmC28JK3+pIQn8th0LwS283Obs9JmRyE=; b=Q7jZF4cg9rSo69
	YD+RjaS/SE5+Do7f/sQ2kPjQfrihEkZGeQnExu0CRmKOJbbhUR8kA16ED8CCe/N3Dnprh+F0cqaET
	dfvQugfkTA6PQGZOpW8MuvZCEpaMIbuVHKJXJvZahKYP5Sgxo6i7WY7vz+btnAI41AY+5EidwDdsu
	QU3YRu6Sr6Pp5IO+zlY9dVQz81TesvlAOLjffmtGDDA24GA4KUXwOrelZeAqgtMfSYscHuL+wEtZ2
	RUYcqisQ42LFvo3g1OmL1utPm/FiFD152m5BhgDzM+YYrrEhatsBSj/LUyCrrPF8uYu7j+SwkVEjL
	t+0ThE0RwXsoPnlUAXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCX9-000000075qr-0fnE;
	Fri, 07 Aug 2026 04:50:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCX6-000000075pc-37w3
	for opensbi@lists.infradead.org;
	Fri, 07 Aug 2026 04:50:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GeXq3533311;
	Fri, 7 Aug 2026 04:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qxn70xm1ob5
	hrgGdcbklU4/yLRIbe4xbETexJPNaJEU=; b=JOGvygi+E1H9wEVteoJiZWqwVOM
	55ghHVY2+mezYdeWeedh46o+eEBHwc+gVwrYCvfAyTb7beFCwvUGiygaR7NY8s7U
	xEU32vbLWe1j0WCca1u7qXms6YJldbWsIflwxVzz+S3dyggbBFcxxA2vjw0WpzZf
	kwugF9R47v6WXKmEinTujkj+2RQFzzZ7pNktjg4lvYOLxCGvF9sGSMX8Xj2O3WO0
	X1pUWiTfYX7jaqLIkymB7Dj2xYf4Y+kJLdGm/czxPnlJfRsAHv5M/4KqSFQFe8Qd
	jxjQSAYhwfaVa7GOhlkNr/eG8b6iZ/mY+J28j/omASCI5eqTdCMZTmZS3mg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ftagk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6774o50V018712;
	Fri, 7 Aug 2026 04:50:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vm119m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:05 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6774o5Ks018691;
	Fri, 7 Aug 2026 04:50:05 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6774o5TP018685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:05 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C357A24B10; Fri,  7 Aug 2026 10:20:04 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 3/3] lib: sbi_domain: Introduce domain intialization order
Date: Fri,  7 Aug 2026 10:20:02 +0530
Message-ID: <20260807045002.2538935-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807045002.2538935-1-anup.patel@oss.qualcomm.com>
References: <20260807045002.2538935-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAzMiBTYWx0ZWRfX783z+4uYLRiy
 7RqjGnOIRG2pQIIS8Vml5UoSmPCnQCCaOHs6bx9QBD3paPswfsY/xR6ZUJvE9L1SVi7yDS02d3f
 8nwOZ3hcxthcrlKY22deDlKEgTl+ixgZxquTGzaFZl1dkwyz+ugQLV4ICS0pFERL6a8PPtqSFPW
 sZXf9I0a94RvJayoDnA1prJgw5DXArmsFDOsK5lLmM4jTK04YHaXZzua6JNlUGz/IgltG6xIQ25
 C49Cz6tkmwFZtslC1g+fLyqixTd9FZWf9Jc7nV/8wYfY/VmTZLvhIi07jpomRWNFtBh+vuRTX0R
 iehRmH8zi1Z/An+kZ1hVXwsry2GxcN8imoVEFhZBqwBYdkMAZ+suwwAwRSs/18zvHma2FmteuWL
 S9F6WezU28UNP2hgnPM8KAAieknLNPqSyoz2Khd9CZyNulyEJtZUgYRGPlilkMEWut15UHTrPDk
 XU8sauSyYxd/xYr+UAg==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a756400 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=OVUozZ5dJveFW_pSK8cA:9
X-Proofpoint-ORIG-GUID: GIIQdQD48Wj4EUoPmvV3zF2P_9_gcnCQ
X-Proofpoint-GUID: GIIQdQD48Wj4EUoPmvV3zF2P_9_gcnCQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAzMiBTYWx0ZWRfX0JVgC/ZgV54r
 EEYHmJ9fhpvvoOA4ldCAB65YGLzawZX05nrVyGaMdW9t9tGfH/dkeZ8ZOty5vkkqCPmHWoYSHGD
 Ner6DVN9C6XJygjEbge5w4LU9IypZ6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_215012_906021_256CBD7A 
X-CRM114-Status: GOOD (  23.82  )
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

Currently, the domain initialization order is implied by the order
in which domains are populated by sbi_platform_domains_init() from
sbi_domain_finalize(). This is not documented anywhere and forces
unecessary ordering between domain DT nodes.

To address the above, introduce per-domain 32-bit integer to represent
intialization order (aka "init_order") where domain with a lower
initialization order will be booted first and two domains must not
have same initialization order. For DT based domain creation, new
"init-order" DT property can be used in domain DT node to specify
the initialization order. The ROOT domain is assumed to have lowest
initialization order (aka 0xffffffff).

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 docs/domain_support.md       |  5 +++++
 include/sbi/sbi_domain.h     |  2 ++
 lib/sbi/sbi_domain.c         | 21 ++++++++++++++-------
 lib/sbi/sbi_domain_context.c | 15 +++++++++------
 lib/utils/fdt/fdt_domain.c   |  8 ++++++++
 5 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 82f155e1..655bf474 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -39,6 +39,9 @@ has following details:
 
 * **index** - Logical index of this domain
 * **name** - Name of this domain
+* **init_order** - Initialization order of this domain. Domain with a
+  lower initialization order will be booted first and two domains must
+  not have same initialization order.
 * **assigned_harts** - HARTs assigned to this domain
 * **possible_harts** - HARTs possible in this domain
 * **regions** - Array of memory regions terminated by a memory region
@@ -75,6 +78,8 @@ following manner:
 
 * **index** - Logical index of the ROOT domain is always zero
 * **name** - Name of the ROOT domain is "root"
+* **init_order** - Initialization order of the ROOT domain is always
+  0xffffffff (aka maximum possible 32-bit value)
 * **assigned_harts** - At boot-time all valid HARTs of a RISC-V platform
   are assigned the ROOT domain which changes later based on OpenSBI
   platform support
diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index b6731c04..b35ea99f 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -199,6 +199,8 @@ struct sbi_domain {
 	spinlock_t assigned_harts_lock;
 	/** Name of this domain */
 	char name[64];
+	/** Initialization order of this domain */
+	u32 init_order;
 	/** Possible HARTs in this domain */
 	const struct sbi_hartmask *possible_harts;
 	/** Array of memory regions terminated by a region with order zero */
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index af753459..747c346c 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -28,6 +28,7 @@ static bool domain_finalized = false;
 
 struct sbi_domain root = {
 	.name = "root",
+	.init_order = -1U,
 	.possible_harts = NULL,
 	.regions = NULL,
 	.system_reset_allowed = true,
@@ -537,6 +538,9 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	sbi_printf("Domain%d Name        %s: %s\n",
 		   dom->index, suffix, dom->name);
 
+	sbi_printf("Domain%d Init Order  %s: 0x%x\n",
+		   dom->index, suffix, dom->init_order);
+
 	sbi_printf("Domain%d Boot HART   %s: %d\n",
 		   dom->index, suffix, dom->boot_hartid);
 
@@ -635,9 +639,14 @@ int sbi_domain_register(struct sbi_domain *dom)
 	if (!dom || domain_finalized)
 		return SBI_EINVAL;
 
-	/* Check if domain already discovered */
+	/*
+	 * Ensure that:
+	 *  1) Domain not already registered
+	 *  2) Initialization order is unique
+	 */
 	sbi_domain_for_each(tdom) {
-		if (tdom == dom)
+		if (tdom == dom ||
+		    tdom->init_order == dom->init_order)
 			return SBI_EALREADY;
 	}
 
@@ -662,15 +671,13 @@ int sbi_domain_register(struct sbi_domain *dom)
 	sbi_hartmask_clear_all(&dom->assigned_harts);
 
 	/*
-	 * Assign a non-ROOT domain to a HART on first come first serve
-	 * basis if the HART is listed as a possible HART of the non-ROOT
-	 * domain. If no non-ROOT domain list a HART as possible HART then
-	 * the HART is assigned to the ROOT domain.
+	 * Assign HART to a domain with the least initialization order
+	 * where the HART is listed as a possible HART of the domain.
 	 */
 	sbi_hartmask_for_each_hartindex(i, dom->possible_harts) {
 		tdom = sbi_hartindex_to_domain(i);
 		if (tdom) {
-			if (tdom == &root)
+			if (tdom->init_order > dom->init_order)
 				sbi_hartmask_clear_hartindex(i, &tdom->assigned_harts);
 			else
 				continue;
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 837ff54f..e39c10fa 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -291,28 +291,31 @@ int sbi_domain_context_exit(void)
 	}
 
 	dom_ctx = ctx->prev_ctx;
+	ctx->prev_ctx = NULL;
 
 	/* If no previous caller context */
 	if (!dom_ctx) {
-		/* Try to find next uninitialized user-defined domain's context */
+		/* Try to find next uninitialized domain with least initialization order */
+		dom_ctx = NULL;
 		sbi_domain_for_each(dom) {
-			if (dom == &root || dom == sbi_domain_thishart_ptr())
+			if (dom == sbi_domain_thishart_ptr())
 				continue;
 
 			if (!sbi_hartmask_test_hartindex(hartindex, dom->possible_harts))
 				continue;
 
 			tmp = hart_context_get(dom, hartindex);
-			if (tmp && !tmp->initialized) {
+			if (tmp && tmp->initialized)
+				continue;
+
+			if (!dom_ctx || tmp->dom->init_order < dom_ctx->dom->init_order) {
 				dom_ctx = tmp;
 				break;
 			}
 		}
 	}
-
-	/* Take the root domain context if fail to find */
 	if (!dom_ctx)
-		dom_ctx = hart_context_get(&root, hartindex);
+		return SBI_ENOENT;
 
 	return switch_to_next_domain_context(ctx, dom_ctx);
 }
diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 31786e0e..366ab138 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -331,6 +331,14 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 		    sizeof(dom->name));
 	dom->name[sizeof(dom->name) - 1] = '\0';
 
+	/* Read initalization order */
+	val = fdt_getprop(fdt, domain_offset, "init-order", &len);
+	len = len / sizeof(u32);
+	if (val && len)
+		dom->init_order = fdt32_to_cpu(val[0]);
+	else
+		dom->init_order = (u32)domain_offset;
+
 	/* Setup possible HARTs mask */
 	SBI_HARTMASK_INIT(mask);
 	dom->possible_harts = mask;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
