Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F14606A324
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 04:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zEGVA0cp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQlL2JOU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JxzdzlHl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Sfp8dpW96Fp/PafLpUTtIlFLbp9e4rdNyCui6yW55I=; b=zEGVA0cptqdRrn7t7QNcrfP41g
	aFppPmObTO52HpnlF2Kfd15sg/W3g3fijKSpZQkLEo9l4xMVPSJzn3IEgc/koQ9t9+2BDGpylIvdm
	5t/gtjM78I4/hlxs44wk5Q1DqwEfey9nXi8Kicqy6NVfWsbEhNNNIiFsz1NxtBhJPYJDsWcGy52Ag
	BmBMmcxquKoeIB1GVdm6lYl2J0DH6Oaiw85WAMsiHV4L7pb8s9m29Qddoq3w6jpRUVCQlqyJMu8F4
	eU6Q4xkom667Si389oZA5GVjvaSDiStl+EmiA2s7KjybvmP3g3Kdw5ekYKOhRtILis26Tt55CiZCg
	MCh9/EMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkX-0000000FW5K-0EuA;
	Mon, 02 Nov 2026 04:34:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkS-0000000FW3v-49dR
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 04:34:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vLvL1676210
	for <opensbi@lists.infradead.org>; Mon, 2 Nov 2026 04:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UabW5HEhcZ/
	3zmzWQGgMqEybDcdjZh/ikESuMQlxXas=; b=CQlL2JOUd2jmCj+yJdHEhH+9NOl
	HDIfqgOA0Gu25t9jLzUrtb78SRWld8IY0l1JyXHkUrrcs+jQRDtr97j3zMi7DYNX
	TW0rNOHu+rIqY5HtGwSWS/jlt9pNcYShCab6WpjrUl2YM+QHIbC+Hqxp1zgs+Cjq
	o1E9oWYlNsingmnLoqLVr3GnGlOR5ZRahbJex5s2X4PCXbAlebPUFgpAdiw4BK3f
	CQNO+5REeoj5Gol5uG1V3r/LvhOyLG6Hcvca9O/OD1p1hUvxvYcAGQXzmiG9pgsc
	GB4cdx1Kc25w7Ri1SmEfEWR6//iO5S9ctPeXXAKOVYTVfik1akZNeGXORoA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7w3q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 04:34:20 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so5138205c88.0
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 20:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594059; x=1794198859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UabW5HEhcZ/3zmzWQGgMqEybDcdjZh/ikESuMQlxXas=;
        b=JxzdzlHlxLczTnDbW3uAF4CGqfJLN3avzpSDstsYuX9t02sMNanp521iLmUx2YMsC6
         +NcjBcL4Ansfgj8rIAGGRh9iIXGoBih4NcxFTunpGyhjNmwPaTFfjNO4KA2ILb4DmmX8
         RnaBqE5Wql0IqQlYpdgSbtIcWrnPC/W2/B2OwKJaMzqXCVAe4Hh2QGhvgkFJq3LhfdjA
         eihm6C0HQH+ImIkbKJn7Z5cAkJOzQLXdT/fvkl2UXJ6Vheb0V7iljBJzrgwJsWjYcEIz
         GbZUg68csDkMYeLbAYBAT9FjHm7Wc3wH6odDzv/BifrjtiwTaOK+7spLyOKHF+oavx4E
         hKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594059; x=1794198859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UabW5HEhcZ/3zmzWQGgMqEybDcdjZh/ikESuMQlxXas=;
        b=LsZrns046QdVbIge2vMemDJJsCcgG2zWrLDw+K943ZGJzj/FcjZO2J6UkjjCyFZdnj
         8fzaF0n8yQH4JPjnzfZu9d/vZbRY7vr2YLLnPdEAhi+Bu71V/XZABahe8gdUw03QKEjk
         uY0C2E9mjT4z2q6Y3NCOGazGaFz7igBUCpdsaE3PXP0mCK+aTajuXKEHwcPyjfxz1BCO
         keYz+3HHw0GxHoA3x8y6n07TAinTDl3Sw9fR/3Kpg4HBYKFGrskkZ7q/eFjI6wQUIlpO
         dbKvIDyFxNHAzB7iH/0U1Vckqe1aXFTSccHnZ/9fWN9Jz8wIlWu1ypa/TYvi0v+Fnfgb
         fsFQ==
X-Gm-Message-State: AFq9FYJ6eO/c2BzxRU3iTPMP2Um6ur6a9miY3JpL/Cdqad49ktYRcHae
	VkGnNafeTbAYs4jEL1+kKqx1h3ke1Zn9p8f72cSXIVRMPP8ZvuRpL4x4NE5jXBV/mVg+O4JPrzB
	Q7SrlvxuzrJH8n7XpGVPdpUGetKJ5cv6coHCmaSWHADJgyrkQmz2UKW6l+Ar2KhurGKwA/z43pQ
	==
X-Gm-Gg: AYBFou3akRJo9RuY2sDcHPzWMKFVvk3/CBZdZ2Qf0qZl0iXQC+3AYiVH4xlXCin/tmJ
	k6zhy2I5G0jRtCq1/pnNdrcsm2UCG+yqZNHDHrvDcIdqT7lfag9toYYm/gKfeaNf0UMobVU0zQo
	NMqb/d0csxmPNjmWATBDoXCZBmUbYOec5B72i7If+rOLgWwTSOQu8Vnjrfrda7HHTueNESX8Rmb
	NN7sQ0VGt+cpA61KYzVarALmZvvHzuXJChy2tMTB/qHS3HwIp0Q3H+IJtBdagESdoly1IzqUPIZ
	Roxkfv+v93SKTvO1vWka6RFpJMUUAjEdt/BzRpxoBnBz/H1ytGRMfXJh6VRuh3B9GoyYwBNHQJM
	hY5PBArA5DIH1kJ7Hz3ZbSLBo/7X9ZLthZJgDzSpeOsUtGHVSmw3LR2B5fDNyiWMHxTfSP0/PP0
	Haqo1C5Tg2TLbqQ6GkP4Vk5ZuZxU+Zc8exjnYVPg/u8NbS1ZtSh2Hi+HbRtyW9618k+lYPbw==
X-Received: by 2002:a05:7022:160b:b0:196:e254:db24 with SMTP id a92af1059eb24-1ac5c64cf5amr16705722c88.21.1793594058911;
        Sun, 01 Nov 2026 20:34:18 -0800 (PST)
X-Received: by 2002:a05:7022:160b:b0:196:e254:db24 with SMTP id a92af1059eb24-1ac5c64cf5amr16705686c88.21.1793594058099;
        Sun, 01 Nov 2026 20:34:18 -0800 (PST)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm28014910c88.12.2026.11.01.20.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:34:17 -0800 (PST)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v7 2/6] lib: sbi: Introduce memory class for memory type hart protection
Date: Mon,  2 Nov 2026 10:03:53 +0530
Message-ID: <20261102043400.287938-3-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
References: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: dZfZQFJHedkdDnQ2wdQ6JpkhvJFwSqDe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX22jaJmrBqfIC
 W9EE6MqYA2U4G9qKELkDdjIEngIyk432IqLJUv8stjjVrh+LivZInRjTCWajZ3Jbrqt6Q/EgAhN
 fs+xl8HSFD1EPEm0Z0ouyL+ApsC1MCs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfXw6DxY/J4mSIl
 F/Iueocwg32QDUb+k8p9xFm9APh7D59SW5yXz/gCQOXU7vJXQMQ0RP7d4Ortjrr0kZT0okPdioJ
 112Np2mw8wqLVG5/kmPAV23snTd6F+SM5jyT3prw9gbBTOjFIfdA1efa9amThT2a5gMbO8w4qPA
 /tcrn0f0qUkJ8nKDGJmE3hCTDpDJ2RsZo0VzGvBN61kIaiP2DAnEy6Sjtm0YbGIB56VHmCXbAd+
 gRWhWX2YvywpzIOjwJhYof6fS1C1VFITRx14/AO0IKnDXlqsha0C7604nXTLrNPVwWgyR9SDzs4
 n1fmW6L6XqtYHaXezrBQMadvkkJ3RUcClPMOnj1YjDDNoRj3ypB3eeCeCX0+LxMi0kQwatYIVrn
 Uxq6KEpn7gG4u2h8XRAu8vTYE/jAcD3K7C0TzfIwLN9yFWXdVKdq9jIGAcvjRB5XJau8HQJJjhu
 pmABb+hmQNM2Vf5cchA==
X-Proofpoint-GUID: dZfZQFJHedkdDnQ2wdQ6JpkhvJFwSqDe
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae812cc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fpceXIQPXNCN1ozAXgcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_203421_145662_41511E72 
X-CRM114-Status: GOOD (  21.27  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In TYPE_MEMORY type mechanisms, some of the hart protection
mechanisms can be exclusive and other can work as an addon
with the other TYPE_MEMORY type mechanisms. For example, in
PMP, SMEPMP and SMSD which are currently the TYPE_MEMORY
type protection mechanisms, the PMP and SMEPMP are exclusive
to each other and the SMSD if present will work together with
PMP or SMEPMP. So it will be either PMP+SMSD or SMEPMP+SMSD.

For such configurations selection, add memory class in which
types within same memory class are exclusive but other types
in different memory class selected will work together.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_hart_protection.h | 20 ++++++++
 lib/sbi/sbi_hart_pmp.c            |  2 +
 lib/sbi/sbi_hart_protection.c     | 84 ++++++++++++-------------------
 3 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index bdcad0080baf..fee5063ca167 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -20,6 +20,23 @@ enum sbi_hart_protection_type {
 	SBI_HART_PROTECTION_TYPE_MAX
 };
 
+/**
+ * Hart protection class for memory protection.
+ *
+ * Memory protection mechanisms of the same class use the same
+ * hardware for memory access which makes them mutually exclusive and
+ * among those the rating will choose which one is active.
+ * Mechanisms of different classes can work together so a hart can have
+ * PMP + MPT or ePMP + MPT.
+ */
+enum sbi_hart_protection_memory_class {
+	/** PMP CSRs: pmp, epmp */
+	SBI_HART_PROTECTION_MEMORY_CLASS_PMP = 0,
+	/** mmpt CSR: MPT (Smsd) */
+	SBI_HART_PROTECTION_MEMORY_CLASS_MPT,
+	SBI_HART_PROTECTION_MEMORY_CLASS_MAX
+};
+
 /** Representation of hart protection mechanism */
 struct sbi_hart_protection {
 	/** List head */
@@ -31,6 +48,9 @@ struct sbi_hart_protection {
 	/** Type of the hart protection mechanism */
 	enum sbi_hart_protection_type type;
 
+	/** Hardware programmed by the mechanism */
+	enum sbi_hart_protection_memory_class memory_class;
+
 	/** Ratings of the hart protection mechanism (higher is better) */
 	unsigned long rating;
 
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index c530739f8c46..e60dbdcfca0a 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -426,6 +426,7 @@ static struct sbi_hart_protection pmp_protection = {
 	.name = "pmp",
 	.rating = 100,
 	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
+	.memory_class = SBI_HART_PROTECTION_MEMORY_CLASS_PMP,
 	.configure = sbi_hart_oldpmp_configure,
 	.unconfigure = sbi_hart_pmp_unconfigure,
 };
@@ -434,6 +435,7 @@ static struct sbi_hart_protection epmp_protection = {
 	.name = "epmp",
 	.rating = 200,
 	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
+	.memory_class = SBI_HART_PROTECTION_MEMORY_CLASS_PMP,
 	.configure = sbi_hart_smepmp_configure,
 	.unconfigure = sbi_hart_pmp_unconfigure,
 	.temp_map_range = sbi_hart_smepmp_temp_map_range,
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index ee4d4beb9087..72ce4e9899cc 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -12,21 +12,37 @@
 
 static SBI_LIST_HEAD(hart_protection_list);
 
-static struct sbi_hart_protection *__hart_memory_protection_best(void)
+static struct sbi_hart_protection *
+__hart_memory_protection_best(enum sbi_hart_protection_memory_class memclass)
 {
 	struct sbi_hart_protection *pos;
 
 	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
-		if (pos->type == SBI_HART_PROTECTION_TYPE_MEMORY)
+		if (pos->type == SBI_HART_PROTECTION_TYPE_MEMORY &&
+		    pos->memory_class == memclass)
 			return pos;
 	}
 
 	return NULL;
 }
 
+/*
+ * Select the highest rating protection mechanism from each class
+ */
+static bool __hart_protection_selected(struct sbi_hart_protection *hprot)
+{
+	switch (hprot->type) {
+	case SBI_HART_PROTECTION_TYPE_MEMORY:
+		return hprot == __hart_memory_protection_best(hprot->memory_class);
+	case SBI_HART_PROTECTION_TYPE_ID:
+		return true;
+	default:
+		return false;
+	}
+}
+
 void sbi_hart_protection_get_str(char *out_str, int out_str_size)
 {
-	bool memory_protect_done = false;
 	struct sbi_hart_protection *pos;
 	int offset = 0;
 
@@ -35,11 +51,8 @@ void sbi_hart_protection_get_str(char *out_str, int out_str_size)
 	sbi_memset(out_str, 0, out_str_size);
 
 	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
-		if (pos->type == SBI_HART_PROTECTION_TYPE_MEMORY) {
-			if (memory_protect_done)
-				continue;
-			memory_protect_done = true;
-		}
+		if (!__hart_protection_selected(pos))
+			continue;
 		sbi_snprintf(out_str + offset, out_str_size - offset, "%s,", pos->name);
 		offset = offset + sbi_strlen(pos->name) + 1;
 	}
@@ -59,6 +72,9 @@ int sbi_hart_protection_register(struct sbi_hart_protection *hprot)
 		return SBI_EINVAL;
 	if (hprot->type >= SBI_HART_PROTECTION_TYPE_MAX)
 		return SBI_EINVAL;
+	if (hprot->type == SBI_HART_PROTECTION_TYPE_MEMORY &&
+	    hprot->memory_class >= SBI_HART_PROTECTION_MEMORY_CLASS_MAX)
+		return SBI_EINVAL;
 
 	sbi_list_for_each_entry(pos, &hart_protection_list, head) {
 		if (hprot->rating > pos->rating) {
@@ -108,24 +124,11 @@ static void __hart_protection_unconfigure(struct sbi_scratch *scratch,
 int sbi_hart_protection_configure(struct sbi_scratch *scratch,
 				  struct sbi_domain *dom)
 {
-	bool do_configure, memory_protect_done = false;
 	struct sbi_hart_protection *hprot;
 	int ret;
 
 	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
-		do_configure = false;
-		switch (hprot->type) {
-		case SBI_HART_PROTECTION_TYPE_MEMORY:
-			do_configure = !memory_protect_done;
-			memory_protect_done = true;
-			break;
-		case SBI_HART_PROTECTION_TYPE_ID:
-			do_configure = true;
-			break;
-		default:
-			break;
-		}
-		if (!do_configure)
+		if (!__hart_protection_selected(hprot))
 			continue;
 
 		ret = __hart_protection_configure(scratch, hprot, dom);
@@ -139,24 +142,10 @@ int sbi_hart_protection_configure(struct sbi_scratch *scratch,
 void sbi_hart_protection_unconfigure(struct sbi_scratch *scratch,
 				     struct sbi_domain *dom)
 {
-
-	bool do_unconfigure, memory_protect_done = false;
 	struct sbi_hart_protection *hprot;
 
 	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
-		do_unconfigure = false;
-		switch (hprot->type) {
-		case SBI_HART_PROTECTION_TYPE_MEMORY:
-			do_unconfigure = !memory_protect_done;
-			memory_protect_done = true;
-			break;
-		case SBI_HART_PROTECTION_TYPE_ID:
-			do_unconfigure = true;
-			break;
-		default:
-			break;
-		}
-		if (!do_unconfigure)
+		if (!__hart_protection_selected(hprot))
 			continue;
 
 		__hart_protection_unconfigure(scratch, hprot, dom);
@@ -167,24 +156,11 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 				    struct sbi_domain *current_dom,
 				    struct sbi_domain *next_dom)
 {
-	bool do_reconfigure, memory_protect_done = false;
 	struct sbi_hart_protection *hprot;
 	int ret;
 
 	sbi_list_for_each_entry(hprot, &hart_protection_list, head) {
-		do_reconfigure = false;
-		switch (hprot->type) {
-		case SBI_HART_PROTECTION_TYPE_MEMORY:
-			do_reconfigure = !memory_protect_done;
-			memory_protect_done = true;
-			break;
-		case SBI_HART_PROTECTION_TYPE_ID:
-			do_reconfigure = true;
-			break;
-		default:
-			break;
-		}
-		if (!do_reconfigure)
+		if (!__hart_protection_selected(hprot))
 			continue;
 
 		__hart_protection_unconfigure(scratch, hprot, current_dom);
@@ -198,7 +174,8 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 
 int sbi_hart_protection_temp_map_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
+	struct sbi_hart_protection *hprot =
+		__hart_memory_protection_best(SBI_HART_PROTECTION_MEMORY_CLASS_PMP);
 
 	if (!hprot || !hprot->temp_map_range)
 		return 0;
@@ -208,7 +185,8 @@ int sbi_hart_protection_temp_map_range(unsigned long base, unsigned long size)
 
 int sbi_hart_protection_temp_unmap_range(unsigned long base, unsigned long size)
 {
-	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
+	struct sbi_hart_protection *hprot =
+		__hart_memory_protection_best(SBI_HART_PROTECTION_MEMORY_CLASS_PMP);
 
 	if (!hprot || !hprot->temp_unmap_range)
 		return 0;
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
