Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA7ACD4F54
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKq9aj5e0NvTEHHlWX7shIq6nYu2kFQmNmeZJaKGMmA=; b=KYBCsct6NTQuRI
	/AcdZpwO1LjO2nWaYdncDVlgVLiqkT0MWtDdEBjVGwKCbZyI1yNzJaIXikUacpV6Sh8WSa8QQdBiz
	o4uVA740JxyhuZOZzS8ZtMv0OXUgU/lrCf9+Ohm7wJAPyNv8h4kZTLWS8JvLDRgIUbjpm0rn5gNUz
	usjncpw6gmFO4jeys5S2gYNm+8nHp4UVmk812ZlBc9mQev041MKKUNj+WtcYHw6fp9pCd+hHIGRZc
	ekWl1i8InzLeXikAJ1piRz0BGnv0CWomM5vCGoI5R1ixfLBw5flGb5nRUy00H5E5rSQzEc5+yia/+
	cS+dB5ERjG415LHSzhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtN2-0000000EoFB-2UWe;
	Mon, 18 May 2026 08:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtN0-0000000EoEG-1mlC
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 08:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j3rLC93nss/itgTyzQdP4am4zQA6jmLTDni5QG1Goko=; b=VdB4OdJ0ox46ne50ksoDhXZUkJ
	Sq7grEtOdKS8YY/thVUrK3O3IGy2Oog+D0s9nc8parSDC/af/GkykwLB463hBQRL5ZpAE+/8GbWam
	oFPwlJGKSo0mdr+ccRqcJ1rN4wdfHzU+AEaja1QC7UFDSTSNGe3lwGKDyniOVuM5j3ASjnez5hlWS
	hQqegnEbiinu8jbUITeeE8RwV6yUbG9lw9zxaIXZSzpddOHbCcq9uYNLozNDGRNmos51PUHnwFEiq
	khxtGqt81lYhjhIBhRO8bQuA0itv0qR5dkVV2uNLZ3YY60yjNUf8fPcDkdLd5Ml3W0aMn48LDr8Tx
	cYx8BVuQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtMw-0000000ANc8-3pgZ
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:30:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I81x1d2753028;
	Mon, 18 May 2026 08:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3rLC93nss/
	itgTyzQdP4am4zQA6jmLTDni5QG1Goko=; b=LwXi2MsqbKXF6dJp0r8hvB6uiqX
	b+j3aTs5PuuveBwBNoT/NqVT9PJXJzO5jMPk307/mWk7yuVgu7aQN++1P0CQxVKL
	HLjV3pdi7eQQ93usrcxvfOTnDHtwJjAjjwr+j8DydtSW+V4aD8/grLx62ESh4tkL
	cXfsGq5U2y8IGR3epdeUJaz2es2fIjXXkOb+2+zjr0ErqwqIMJhfyrVVBA+p7oAc
	mML8vpDgpk721rt5GRA1Qd/jik48eOnAWxIWiVfkLhEw268n25tvVIhY9ZuStPtJ
	iPlKXXWOtcOXhmo9a6FAJMvWPPZFJjTDN46i5SGzZAawRNsEd4dmyMsgmjg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qdgev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64I8UPvO032692;
	Mon, 18 May 2026 08:30:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716cyqmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:25 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64I8UPSc032671;
	Mon, 18 May 2026 08:30:25 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64I8UPp4032667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:25 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 78E0D21AE1; Mon, 18 May 2026 14:00:24 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v8 1/3] lib: sbi: Add RISC-V vector context save/restore support
Date: Mon, 18 May 2026 14:00:21 +0530
Message-ID: <20260518083023.997323-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
References: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: fiUgdZqRgdhdVUv3YoxhDyMKq4X2Esqx
X-Proofpoint-GUID: fiUgdZqRgdhdVUv3YoxhDyMKq4X2Esqx
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0ace24 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8
 a=BumnxhG7TQBLWTpoR1QA:9 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4MCBTYWx0ZWRfXwH3M2yVCFqu3
 ySV0qgNPJd/G/ITCt6bIKC0b8Zynp6Z+VSKGg1qIevXSgd06t1Q0z/rmgYd3NPJSQMJETViDeH/
 sMZO5qhGJD+EQLKwnYYEDNZ2ImyiuM2dthUPPXWKLwtGlJSdEdte9WF8CxHj46FXsTWONsecr5y
 1zAIxC43wVxp0Rjt2mdZS/5cSen0d8raLFoe3SiYd8VckXvOUOYoLcTKYWqw6FcVQr9cHgRRRTh
 PzHdndPasyTVfa+YyNGjXlUDfCSK7ICh0rgny1jyI+uiJqexCYxWwklDayCZ2ypbRI0LAAb6PJw
 4kh1rpP32i506WjMxNuZHqM7beWTP6nLt2Fgsm8/cOLA3ye110w2bZNpDh40Rerr3jXjjlACdOy
 NPs+hQhfjy0fExX29zXnpFto8w28CzXZBwlthQyBPhV71a1c4HrciOZg8mKkzaL27uw4FabhJMG
 klE9loczjF6LX9PgtmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093035_565739_BA3444E5 
X-CRM114-Status: GOOD (  16.12  )
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

Eager context switch: Add support for saving and restoring RISC-V vector
extension state in OpenSBI. This introduces a per-hart vector context
structure and helper routines to perform full context save and restore.

The vector context includes vcsr CSRs along with storage for all 32 vector
registers. The register state is saved and restored using byte-wise vector
load/store instructions (vs8r/vl8r).

The implementation follows an eager context switching model where the entire
vector state is saved and restored on every context switch. This provides a
simple and deterministic mechanism without requiring lazy trap-based
management.

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_vector.h | 40 +++++++++++++++++
 lib/sbi/objects.mk       |  1 +
 lib/sbi/sbi_vector.c     | 94 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_vector.c

diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
new file mode 100644
index 00000000..f00184f0
--- /dev/null
+++ b/include/sbi/sbi_vector.h
@@ -0,0 +1,40 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Authors:
+ *   Dave Patel <dave.patel@riscstar.com>
+ */
+
+#ifndef __SBI_VECTOR_H__
+#define __SBI_VECTOR_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_vector_context {
+	unsigned long vcsr;
+	unsigned long vstart;
+
+	/* size depends on VLEN */
+	uint8_t vregs[];
+};
+
+#ifdef OPENSBI_CC_SUPPORT_VECTOR
+void sbi_vector_save(struct sbi_vector_context *dst);
+void sbi_vector_restore(const struct sbi_vector_context *src);
+size_t sbi_vector_context_size(void);
+#else
+static inline void sbi_vector_save(struct sbi_vector_context *dst)
+{
+}
+static inline void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+}
+static inline size_t sbi_vector_context_size(void)
+{
+	return 0;
+}
+#endif /* OPENSBI_CC_SUPPORT_VECTOR */
+
+#endif /* __SBI_VECTOR_H__ */
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 07d13229..c965e86d 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -102,3 +102,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
+libsbi-objs-$(CC_SUPPORT_VECTOR) += sbi_vector.o
diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
new file mode 100644
index 00000000..1f9e01cf
--- /dev/null
+++ b/lib/sbi/sbi_vector.c
@@ -0,0 +1,94 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 RISCstar Solutions.
+ *
+ * Authors:
+ *	 Dave Patel <dave.patel@riscstar.com>
+ */
+
+#include <sbi/riscv_encoding.h>
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_vector.h>
+#include <sbi/sbi_types.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_error.h>
+
+size_t sbi_vector_context_size(void)
+{
+	return sizeof(struct sbi_vector_context) + (32 * csr_read(CSR_VLENB));
+}
+
+void sbi_vector_save(struct sbi_vector_context *dst)
+{
+	unsigned long vlenb, mstatus_orig;
+
+	if (!dst)
+		return;
+
+	/* Step 1. Save original mstatus and Enable VS */
+	mstatus_orig = csr_read_set(CSR_MSTATUS, MSTATUS_VS);
+	vlenb = csr_read(CSR_VLENB);
+
+	/* Step 2: Save CSRs */
+	dst->vcsr = csr_read(vcsr);
+	dst->vstart = csr_read(vstart);
+
+	/* Step 3: Save vector registers */
+#define SAVE_VREG(i)							\
+	({								\
+	asm volatile(							\
+		"	.option push\n\t"				\
+		"	.option arch, +v\n\t"				\
+		"	vs8r.v v" #i ", (%0)\n\t"			\
+		"	.option pop\n\t"				\
+		::	"r"(dst->vregs + (i) * vlenb)	: "memory");	\
+	})								\
+
+	SAVE_VREG(0);
+	SAVE_VREG(8);
+	SAVE_VREG(16);
+	SAVE_VREG(24);
+
+#undef SAVE_VREG
+
+	/* Step 4. Restore original mstatus LAST */
+	csr_write(CSR_MSTATUS, mstatus_orig);
+}
+
+void sbi_vector_restore(const struct sbi_vector_context *src)
+{
+	unsigned long vlenb, mstatus_orig;
+
+	if (!src)
+		return;
+
+	/* Step 1. Save original mstatus and Enable VS */
+	mstatus_orig = csr_read_set(CSR_MSTATUS, MSTATUS_VS);
+	vlenb = csr_read(CSR_VLENB);
+
+	/* Step 2: Restore vector registers */
+#define RESTORE_VREG(i)							\
+	({								\
+	asm volatile(							\
+		"	.option push\n\t"				\
+		"	.option arch, +v\n\t"				\
+		"	vl8r.v v" #i ", (%0)\n\t"			\
+		"	.option pop\n\t"				\
+		::	"r"(src->vregs + (i) * vlenb) : "memory");	\
+	 })								\
+
+	RESTORE_VREG(0);
+	RESTORE_VREG(8);
+	RESTORE_VREG(16);
+	RESTORE_VREG(24);
+#undef RESTORE_VREG
+
+	/* Step 3: Restore CSR's last */
+	/* Restore CSRs first */
+	csr_write(vcsr,   src->vcsr);
+	csr_write(vstart, src->vstart);
+
+	/* Step 4. Restore original mstatus LAST */
+	csr_write(CSR_MSTATUS, mstatus_orig);
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
