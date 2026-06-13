Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAE9CD98D6
	for <opensbi@archiver.kernel.org>; Sat, 13 Jun 2026 13:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uH7GFm/+NmaF4qDvpvxtk6DbrAoFHJJHT72sp/UObtM=; b=WXLxGF99cjsP+Q
	J1vYGcW3lUX2DAP5d4K6GaB7MHl7ays3oRNEXCjnsT0aLxkN8Qq2qlfo2nzh9zveYcyfSwFoyxbWr
	MG+GGC1ZjV+Q8jV7lXPSR12fY9jDtC9cNrCi+qYz7xUNBSOJ8WvbPeKgWpZPYf2PeOVFC6TABX1hd
	nCehXXImZXAtHQWn57RQMIk9U4Q6s3w5CyZH4Xp55vrx1Gm9l1jAGB+BnA4eouHGW10DMAhYQxe25
	8xRZbslq6IeMjUZz1z4v3PyNq3hHD7ymQtZK2ULWvGERWMhAMvmLPEBiqc0Juj0wXnF0yszYKN/oP
	TW/fW5oAJXspv6/y52dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOJ4-0000000CJtt-1fYp;
	Sat, 13 Jun 2026 13:21:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOJ1-0000000CJt3-3TZX
	for opensbi@lists.infradead.org;
	Sat, 13 Jun 2026 13:21:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DAxSXP2748001;
	Sat, 13 Jun 2026 13:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2S0lI2TqfDt
	/hWJPkpf4fDiL6Pb3sqXa4iRH4xiDli8=; b=JAb6k6qq7mjQDB3Dgfdq5WKFxYP
	B4XIXvpzNzJkceTuYYlecBmIoZlGjfcJ9+iDgw9Np5c6scP0aRfr+rK6H1JKbA0X
	twT0nomZOOCjgC6CTbEyDO5MyKXefzSZbleJKxXuqwAsYQaATTuo5rJBO9020Ec2
	Y6hqy20ArMW2M0sideu5dJYuDu/8qQODbYeDoxR+RMaTZ9j/P9HB+y+dfbgAQiKm
	s+SXw6Cg8un/whVHvC2//U0cMtINUR9GnjFRpSSPmRzE+6/Kehxe230nyenFlOFX
	268wr6gMsHljoFnQxfYWqyrGJQX0Zvfi5sU5q/qNJgHZ9yLJ7sZAvP6eHtw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gs5q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65DDLV2L013502;
	Sat, 13 Jun 2026 13:21:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09hd8xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:31 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65DDLUkD013485;
	Sat, 13 Jun 2026 13:21:31 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65DDLUQ6013482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:30 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 2A83621CE0; Sat, 13 Jun 2026 18:51:30 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Vivian Wang <wangruikang@iscas.ac.cn>,
        Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
        Bo Gan <ganboing@gmail.com>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 2/2] lib: sbi: Reduce stack usage of vector misaligned load/store emulation
Date: Sat, 13 Jun 2026 18:51:29 +0530
Message-ID: <20260613132129.2135128-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613132129.2135128-1-anup.patel@oss.qualcomm.com>
References: <20260613132129.2135128-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDEzNiBTYWx0ZWRfX+jcTTQNwqpeP
 sAj8qaNqU4QPY3tEo0qz8Zf8YDw9ndPnX6v2mgfP/vq3AjqOiPJ4RwypO0oQaTAG1P8RraX46d8
 IMxL6siQsjRLXFKrfjEk6RHCqKxRVXk=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2d595e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=HxIbWsuE_kYlyNr2vc0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDEzNiBTYWx0ZWRfX3/rpB5uZSL+d
 UdBOy7W2uHm0BdDF/olA9k+ZzRkRhvbggwukoAgrwQAuBbRwtW62/aWSt4YjksRFzT4id5wjgse
 10g/CtedwZQzkdxpznH/7c+4Ot5J4NscDw8Y7EEh3DX7g3xEo9IloO1vIluEtOO5F/s4tzP7IkY
 vADmLUvupYKrstIY4lw7NgYbfD747topQ03/ufZHzvrnTR5mO+2ail5wmlEtMC/RJzUxoPCnWTn
 C9A/Gb9r1iIr76MlrdCVOR/8dReD2fJ2WFdmFQcIMRxJr19PTzO5Ay74UbtmHfAiuRqaEfdH1lS
 G+ZEmzTbVGWSJQRFvOnJPbDGzeb06rt9byNx0Lw49X37WoRdG+I6fntZLkNBWexBfFGIzdTCIme
 q0+LUTuEqYTT1t9AYgvpWrgxelbTLUfK7FQ03hObDraCdineCgt+17Zn4oldCVO4QgKxC4AAVrL
 wp9v7gp3JoDtnxYwvog==
X-Proofpoint-GUID: 0yTj3K6mbDLHAlB5ARkSwg74npAYRd8k
X-Proofpoint-ORIG-GUID: 0yTj3K6mbDLHAlB5ARkSwg74npAYRd8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_062147_986928_A8502555 
X-CRM114-Status: GOOD (  15.76  )
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

The vector misaligned load/store emulation requires mask[] of 8192
bytes which cause stack corruptions since default stack size is also
8192 bytes.

To address the above issue, allocate mask[] on-demand from heap for
each hart and store the per-hart pointer in scratch space for reuse.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_trap_ldst.h |  2 ++
 lib/sbi/sbi_trap.c          |  8 +++++
 lib/sbi/sbi_trap_v_ldst.c   | 61 +++++++++++++++++++++++++++++++++++--
 3 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/include/sbi/sbi_trap_ldst.h b/include/sbi/sbi_trap_ldst.h
index a6a6c75b..65539035 100644
--- a/include/sbi/sbi_trap_ldst.h
+++ b/include/sbi/sbi_trap_ldst.h
@@ -37,4 +37,6 @@ int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 				 struct sbi_trap_context *tcntx);
 
+int sbi_misaligned_v_ldst_init(void);
+
 #endif
diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 16774fd2..428d9296 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -459,5 +459,13 @@ static int delegate_traps(struct sbi_scratch *scratch)
 
 int sbi_trap_init(struct sbi_scratch *scratch, bool cold_boot)
 {
+	int rc;
+
+	if (cold_boot) {
+		rc = sbi_misaligned_v_ldst_init();
+		if (rc)
+			return rc;
+	}
+
 	return delegate_traps(scratch);
 }
diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index f4d469dc..e642d4a2 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -12,15 +12,45 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_encoding.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_trap_ldst.h>
 #include <sbi/sbi_trap.h>
 #include <sbi/sbi_unpriv.h>
-#include <sbi/sbi_trap.h>
 
 #ifdef OPENSBI_CC_SUPPORT_VECTOR
 
 #define VLEN_MAX 65536
 
+struct misaligned_v_ldst_data {
+	uint8_t mask[VLEN_MAX / 8];
+};
+
+static unsigned long misaligned_v_ldst_dataptr_offset;
+
+#define misaligned_v_ldst_get_data_ptr(__scratch)				\
+	sbi_scratch_read_type((__scratch), void *, misaligned_v_ldst_dataptr_offset)
+
+#define misaligned_v_ldst_set_data_ptr(__scratch, __ldst)			\
+	sbi_scratch_write_type((__scratch), void *, misaligned_v_ldst_dataptr_offset, (__ldst))
+
+static struct misaligned_v_ldst_data *misaligned_v_ldst_thishart_data_ptr(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	struct misaligned_v_ldst_data *ptr;
+
+	if (!misaligned_v_ldst_dataptr_offset)
+		return NULL;
+
+	ptr = misaligned_v_ldst_get_data_ptr(scratch);
+	if (!ptr) {
+		ptr = sbi_zalloc(sizeof(*ptr));
+		misaligned_v_ldst_set_data_ptr(scratch, ptr);
+	}
+
+	return misaligned_v_ldst_get_data_ptr(sbi_scratch_thishart_ptr());
+}
+
 static inline void set_vreg(ulong vlenb, ulong which,
 			    ulong pos, ulong size, const uint8_t *bytes)
 {
@@ -142,6 +172,7 @@ int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
+	struct misaligned_v_ldst_data *hart_data;
 	struct sbi_trap_info uptrap;
 	ulong insn = sbi_get_insn(regs->mepc, &uptrap);
 	ulong vl = csr_read(CSR_VL);
@@ -157,12 +188,17 @@ int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 	ulong vlmul = GET_VLMUL(vtype);
 	bool illegal = GET_MEW(insn);
 	bool masked = IS_MASKED(insn);
-	uint8_t mask[VLEN_MAX / 8];
 	uint8_t bytes[8 * sizeof(uint64_t)];
 	ulong len = GET_LEN(view);
 	ulong nf = GET_NF(insn);
 	ulong vemul = GET_VEMUL(vlmul, view, vsew);
 	ulong emul = GET_EMUL(vemul);
+	uint8_t *mask;
+
+	hart_data = misaligned_v_ldst_thishart_data_ptr();
+	if (!hart_data)
+		return SBI_ENOMEM;
+	mask = hart_data->mask;
 
 	if (IS_UNIT_STRIDE_LOAD(insn) || IS_FAULT_ONLY_FIRST_LOAD(insn)) {
 		stride = nf * len;
@@ -242,6 +278,7 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 {
 	const struct sbi_trap_info *orig_trap = &tcntx->trap;
 	struct sbi_trap_regs *regs = &tcntx->regs;
+	struct misaligned_v_ldst_data *hart_data;
 	struct sbi_trap_info uptrap;
 	ulong insn = sbi_get_insn(regs->mepc, &uptrap);
 	ulong vl = csr_read(CSR_VL);
@@ -257,12 +294,17 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 	ulong vlmul = GET_VLMUL(vtype);
 	bool illegal = GET_MEW(insn);
 	bool masked = IS_MASKED(insn);
-	uint8_t mask[VLEN_MAX / 8];
 	uint8_t bytes[8 * sizeof(uint64_t)];
 	ulong len = GET_LEN(view);
 	ulong nf = GET_NF(insn);
 	ulong vemul = GET_VEMUL(vlmul, view, vsew);
 	ulong emul = GET_EMUL(vemul);
+	uint8_t *mask;
+
+	hart_data = misaligned_v_ldst_thishart_data_ptr();
+	if (!hart_data)
+		return SBI_ENOMEM;
+	mask = hart_data->mask;
 
 	if (IS_UNIT_STRIDE_STORE(insn)) {
 		stride = nf * len;
@@ -330,6 +372,15 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 
 	return vl;
 }
+
+int sbi_misaligned_v_ldst_init(void)
+{
+	misaligned_v_ldst_dataptr_offset = sbi_scratch_alloc_type_offset(void *);
+	if (!misaligned_v_ldst_dataptr_offset)
+		return SBI_ENOMEM;
+
+	return 0;
+}
 #else
 int sbi_misaligned_v_ld_emulator(int rlen, union sbi_ldst_data *out_val,
 				 struct sbi_trap_context *tcntx)
@@ -341,4 +392,8 @@ int sbi_misaligned_v_st_emulator(int wlen, union sbi_ldst_data in_val,
 {
 	return 0;
 }
+int sbi_misaligned_v_ldst_init(void)
+{
+	return 0;
+}
 #endif /* OPENSBI_CC_SUPPORT_VECTOR */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
