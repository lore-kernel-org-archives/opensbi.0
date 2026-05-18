Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8E6CD4F55
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LW9xO+as9hBEM0zRXQfsTxetRdpyX5hJfOzxytn6LUQ=; b=SYqqfK5Y870FgX
	bQ16GXuUI1vU/DZ1UKh33PJA62m5gingdKzo1EG/ECGW2MaUfSCadOOgHdbWRb5aAn4XYXa2006Sn
	tZrn3BOfWmV9ZvvZ0ulC9FtTTkY/CQgFRKuLYWD7i3hBgebA38wp9Wv4xXpYVedT9E/Av2pyK0gCb
	TVIXkz6B+QRcfEtKasjAI5HxDIP5u6RtDrNjYDRtiNImAconFUh0Tvm4u63rzd9fXbQ0rliIYjBoT
	bvq/b49bKZeMRq+K5Vy1/st6em+3uCgjVUKi/YPuQoBC5X2ialoaf0nNfD3SRIbPvuNcD12w03bBm
	IfP5N77BWGgA5GX7gBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtN3-0000000EoFh-2oTV;
	Mon, 18 May 2026 08:30:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtN1-0000000EoEh-2u1y
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 08:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pKWA8ZCzS/DT364h5R7A46wyhoIAAMuN4IZeYBweckA=; b=GwHSYly500MiEhBBUIQNqQNtps
	uPXpltH0Tv6VxH+8Ugd35tp3NYgSfrW631E7vjIwQk2y6z3d/gwfMGJCnom9Wr90PqYhGGMQDgheP
	7kIBakXLgsEfuWHo68uPjm4NG8Y9Fd9DE3lFReM64fFQzI5UOc9NRc72CT3GD319KitJK59Gg60Ru
	TsqvQTN+2q/qZWckdb1p3soH+M6V67zRlOl//PE9fBN2dVLHUQvx2ej+Fff1oHOlpooxlr+IcSRFK
	OTw0rIKJHtj0i9GEaL68Oy2gYz8NckpM1EtXj42CjKIglvpz9ZQBCk9MdZF5v+wNuJeixJh5iAbNX
	LjycZ6bQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtMx-0000000ANc9-1HOc
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:30:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e25N2892643;
	Mon, 18 May 2026 08:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pKWA8ZCzS/D
	T364h5R7A46wyhoIAAMuN4IZeYBweckA=; b=FoAEkOawAIEDpW6QXFQBkRe9jTv
	2llvnKIltd9Te21LichwcPan4t84liczicg7og6i73MlldRr0rb5w59DRaltzwH+
	4bpXhhUZRTP8rKyZczuD+5MW4f8lcTepqsMhBDpkWPykxh0pJKJo53bNkMaCJLXK
	elD920XH+PlDpPzptLaqcQ2pBMBTpAqVzCsEQJEMug++ZFK1dd2M7QYwzMi8en80
	KfQfx+lSIom4//ybAlmE59To8hJQo9GGwfXqHBVXZogSfl9Ad9hDaKM/LVEQBj5K
	gxg5t4+n0Rb4+vUJVfLpFl9QLPf/+gV7yNvzuWF0fmj3No4a1A9VoJxqhSA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk18773-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64I8UPHI032694;
	Mon, 18 May 2026 08:30:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716cyqmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:25 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64I8UPcg032668;
	Mon, 18 May 2026 08:30:25 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64I8UPIY032665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:25 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 81BD0222FF; Mon, 18 May 2026 14:00:24 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v8 3/3] lib: sbi: domain FP/Vector context support for context switch
Date: Mon, 18 May 2026 14:00:23 +0530
Message-ID: <20260518083023.997323-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
References: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: AANPVUzQxjYuWbeK4-IFv5a51M7Xbc4c
X-Proofpoint-ORIG-GUID: AANPVUzQxjYuWbeK4-IFv5a51M7Xbc4c
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0ace24 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8
 a=Hx4rMgOWgGZGTF8YxU8A:9 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4MCBTYWx0ZWRfX8445+DvXxgxI
 2aq5z8p+D8elrXxXxHCGEqUamQsxcrhT4YnA5buYUHAD3p30R90oHX169VSy3/DTfsuWdSyNBtK
 FBKsEW7bmdwuCUBopi03WO9MvxLtCZb8U5tncCnb1Uorv2Sx+r/NYYEESNhzm8eeKsWh+9IdsAL
 g6RtjqSGmrm1Jw/z8LMidrucanQb6h9Kq9OyKfzrJ+bbzv50KxwSmb+7I7QcfghlHvAudcDlau6
 rvyb+pTbWdltY/l2oJ+ivnc/4PLChUM9PaP7yd2IcoNG4qg8zqQ7MPWDB4ghew8rwNtnOtr8uuZ
 PF2wro4O8J+/IHGvLtfdSSDmwtbPH3WhxbZBeuGkh1/ohEHfhpJjevyB0DaQX7FBMHAX26veGsC
 svfBmvVSzKVykE4E1PGTJvnuxN0AZXGLjP3QBz48/byNZHLJprKeQ0LbTNfSZOMZ29bOkTFEVJ1
 p7tYSXDVuUx8JbcTtAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093036_393997_C05088F2 
X-CRM114-Status: GOOD (  17.92  )
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

From: Dave Patel <dave.patel@riscstar.com>

This patch adds proper support for per-domain floating-point (FP) and
vector (V) contexts in the domain context switch logic. Each domain
now maintains its own FP and vector state, which is saved and restored
during domain switches.

Conditionalize FP and Vector save/restore based on extensions, unconditional
save and restore of floating-point (FP) and Vector registers fails on
generic platform firmware. This firmware must run on multiple platforms
that may lack these extensions.

Address this by conditionally executing FP save/restore only if the underlying
hart supports the F or D extensions. Similarly, perform Vector save/restore
only if the hart supports the Vector extension.

This improves support for multi-domain systems with FP and Vector
extensions, and prevents corruption of FP/Vector state during domain
switches.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_hart.h       |  6 ++++++
 lib/sbi/sbi_domain_context.c | 33 +++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |  3 +++
 3 files changed, 42 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 937cdf29..543393bb 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -89,6 +89,12 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_XSIFIVE_CEASE,
 	/** Hart has Smrnmi extension */
 	SBI_HART_EXT_SMRNMI,
+	/** Hart has V extension */
+	SBI_HART_EXT_V,
+	/** Hart has F extension */
+	SBI_HART_EXT_F,
+	/** Hart has D extension */
+	SBI_HART_EXT_D,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 158f4990..fad402a8 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -18,6 +18,8 @@
 #include <sbi/sbi_domain_context.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_fp.h>
 
 /** Context representation for a hart within a domain */
 struct hart_context {
@@ -49,6 +51,11 @@ struct hart_context {
 	/** Supervisor resource management configuration register */
 	unsigned long srmcfg;
 
+	/** Float context state */
+	struct sbi_fp_context fp_ctx;
+	/** Vector context state */
+	struct sbi_vector_context *vec_ctx;
+
 	/** Reference to the owning domain */
 	struct sbi_domain *dom;
 	/** Previous context (caller) to jump to during context exits */
@@ -143,6 +150,19 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SSQOSID))
 		ctx->srmcfg	= csr_swap(CSR_SRMCFG, dom_ctx->srmcfg);
 
+	/* Eager context switch for float */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_F) ||
+	    sbi_hart_has_extension(scratch, SBI_HART_EXT_D)) {
+		sbi_fp_save(&ctx->fp_ctx);
+		sbi_fp_restore(&dom_ctx->fp_ctx);
+	}
+
+	/* Eager context switch for vector */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_V)) {
+		sbi_vector_save(ctx->vec_ctx);
+		sbi_vector_restore(dom_ctx->vec_ctx);
+	}
+
 	/* Save current trap state and restore target domain's trap state */
 	trap_ctx = sbi_trap_get_context(scratch);
 	sbi_memcpy(&ctx->trap_ctx, trap_ctx, sizeof(*trap_ctx));
@@ -168,6 +188,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 
 static int hart_context_init(u32 hartindex)
 {
+	size_t vec_size;
 	struct hart_context *ctx;
 	struct sbi_domain *dom;
 
@@ -180,6 +201,18 @@ static int hart_context_init(u32 hartindex)
 		if (!ctx)
 			return SBI_ENOMEM;
 
+		if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(),
+					   SBI_HART_EXT_V)) {
+			vec_size = sbi_vector_context_size();
+
+			/* Allocate the vector context pointer */
+			ctx->vec_ctx = sbi_zalloc(vec_size);
+			if (!ctx->vec_ctx) {
+				sbi_free(ctx);
+				return SBI_ENOMEM;
+			}
+		}
+
 		/* Bind context and domain */
 		ctx->dom = dom;
 		hart_context_set(dom, hartindex, ctx);
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 43197721..0f690f53 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -399,6 +399,9 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
 	__SBI_HART_EXT_DATA(smrnmi, SBI_HART_EXT_SMRNMI),
+	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
+	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
+	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
