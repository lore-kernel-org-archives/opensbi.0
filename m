Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90EFC79F82
	for <opensbi@archiver.kernel.org>; Sat,  5 Sep 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UH8w7b2lISGPRFjU1k9Ez6qWLZHsiuUmAXHQl95aRg=; b=qYjJJHSg0fKbwl
	xlIXVKbuGwFjcMr8Qovac0bWtLm8KAQmyDKGGl7sjg8ZOwaKJcLDaARR1tTm0ReVVznFHx9hrGgGg
	KEnXGGWR9rH9p88stKP0nEaHlIhMOuIjgo7dMfyy/EyfIkAgiFItsUVFu8f7n0SPjYxJAYlAji/77
	Ce5FD/z732Z0+ePy6ZEYQna5Vn7gf7jq0bBGqEm3JAaOzivYLKXcao0JhWXbNRiUf/ZgbTNsmsXvO
	SlKpKjcjWg2pktfCAspSc5+yKugSeoCQHA8w2Zv9t9N5UVdrG0rHVKOegS7uIv9PQTvq3OPWSaSXz
	v/OiQttIO1YtOLBrjC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHS-000000045do-0pGo;
	Sat, 05 Sep 2026 13:18:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHP-000000045cH-0OjG
	for opensbi@lists.infradead.org;
	Sat, 05 Sep 2026 13:18:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVd8O1710037;
	Sat, 5 Sep 2026 13:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KmrKVNnjSpQ
	h3oe2nH6iS0YoN9J08jg6NW/TJZ5VOho=; b=no1eRmS/ZpLpj1JC+ZRCevaee1C
	+vlN1s5TAGTtwglZ/31PewFFnm/eFuaDbZqWep9lLJNoNuX772WOdfbXTIwyLRjV
	19y4VLJwkOGDownwTGJs2nzko1VFwMq2tCr3Wdfj7p4wfWsmkdmTZ2caYBhc/3qO
	IBS6rnUz5WOLGR0Bteo+IogFxr7gSJau+13EBuIFYFKbhrN20diHTjfFH4s2Epxq
	6Q0pZBVRfPQx9lII0L/DjVNpsAKzUze9Z4DHUsZvBhl4UFX8fGeOz688XHnSzUFW
	DEYWEnqG9FYVb2/FLSehiqqnEPBXTR3Aa8v8GvHBIwPLoNqj7jjGLEDW5jg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbueh099-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:53 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 685DHoUW4173916;
	Sat, 5 Sep 2026 13:17:50 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 685DHoQS4173890
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:50 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 5B95A24A1F; Sat,  5 Sep 2026 18:47:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 3/3] lib: sbi_domain: Introduce domain intialization order
Date: Sat,  5 Sep 2026 18:47:48 +0530
Message-ID: <20260905131748.922920-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
References: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfX9hHlZF9UGDpX
 GiQaFO4Har/qgAWYt+fxpj2JWnb/CiSXYj2cOgBqCtVFRb5oxUXpfy4nN4OcqOm+ln8oZppH3rK
 wRhp0n0kRewxV88vgpi2DJtHlXZj4j1ge0kODpBLmS69BYJnkkQDH1cKyY1oPS9hlEeHKkk++wT
 VMMPa0GMMO4MzL4mCRftt1RZ9O9y35SCJ5KwAYVtZV1q2VFDkYHng1IxpVYCgZTHNEsTYbC2X8/
 Plb+CH/8hh0b3SGMUiD7ndflZ0330hnlS/roqGZD+yNbBIflj/g9/RzYq12vn0aoPDDWqAcVlb9
 fTEAfQ0fWlTDIlMnL5ShQ18bmvohJxs2g3XiaZJeZzhh0Mu4NYJkOnR0CHfU4OAAxYySVgX6eU+
 WekESV4xKMCB/B6mtTYbmDO2+ZwSjPLKeeu4TDy6DAwveo/vBHXy6kNOpVqRJPxicS5p/3onOeq
 m3LqZAhvRcLSmZrmvnA==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9c1681 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=4vXGszdGeJKz1TGQDYAA:9
X-Proofpoint-GUID: 6O9Te5gpDj12Tf4I1MQXZRyWPjLAeBww
X-Proofpoint-ORIG-GUID: 6O9Te5gpDj12Tf4I1MQXZRyWPjLAeBww
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfX0hYgNGLJ/1vH
 FEIe45y2ut7R1cJQO3SBf4E7Z8WBIkEPF4nu+NeAagC4h0JaK4KPV0Oi1Y5jmnAp5seZxViP8FT
 sxN6LLbRKBdrt0yxPe/0+Ylg3UE0iRs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_061759_138079_BC376C9E 
X-CRM114-Status: GOOD (  25.21  )
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
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Tested-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
 docs/domain_support.md       |  8 ++++++++
 include/sbi/sbi_domain.h     |  2 ++
 lib/sbi/sbi_domain.c         | 21 ++++++++++++++-------
 lib/sbi/sbi_domain_context.c | 17 +++++++++--------
 lib/utils/fdt/fdt_domain.c   |  8 ++++++++
 5 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index a8c4fb3b..51737218 100644
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
@@ -156,6 +161,9 @@ The DT properties of a domain instance DT node are as follows:
 
 * **compatible** (Mandatory) - The compatible string of the domain instance.
   This DT property should have value *"opensbi,domain,instance"*
+* **init-order** (Optional) - The 32-bit initialization order for the domain
+  instance. If this DT property is not available then domain instance DT node
+  offset is used as default value.
 * **possible-harts** (Optional) - The list of CPU DT node phandles for the
   the domain instance. This list represents the possible HARTs of the
   domain instance.
diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index ae3fb972..bb444fe9 100644
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
index 10ab9dab..87e5faa8 100644
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
index 316368ea..6eb8199b 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -291,28 +291,29 @@ int sbi_domain_context_exit(void)
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
+			if (!dom_ctx || tmp->dom->init_order < dom_ctx->dom->init_order)
 				dom_ctx = tmp;
-				break;
-			}
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
index 152d9519..575fbdf0 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -330,6 +330,14 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
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
