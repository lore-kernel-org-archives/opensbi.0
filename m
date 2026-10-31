Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E1606A31A
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ncw3anU0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VJ7cfSnj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYSwE1ki
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oe6urNYT3inhDmjgKy90ZZgYzbTHsn4rjibxXAzYvp8=; b=ncw3anU08XBt/VapgXT4DZPDXD
	V90DEal1ZEFAFgxdEfrJ6JFllFJ9Lk65GDmCEGJvgyXwijV/SEAs4kCepVYqZutID0vV6Bgv4P5yD
	CjxROmp/oC4t2JgybTD04jvYtHJjRp2jTWAmerLlqKWcCFNzDUGTASWP7TSgS8bj/nfyZEXJBLzat
	OKNKwbYUHKy6fCvKJkFsigsmmxQNC3UGZ+8P+NOAYu9yc2/JoRCjtgot/tC8y99jVybWzBlZ+Crvs
	C5kLmIUCx20QCBHvlba7n1eFFWP6D6vHCJad2ruZ32NTK4D0VY6ODILOoI6NFhCExbi/US6P/XhWD
	PH7r+PEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8C0-0000000DItF-0qhJ;
	Sat, 31 Oct 2026 12:28:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Bx-0000000DIru-3xdC
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:28:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aHWs2142766
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NrR5z5WLBRq
	j/t/aUg37YKd0fkUMSKSQDHBU2LhzeZA=; b=VJ7cfSnjZs0t4pAKYT1dVgGcaI/
	v5XKOVoy30AFZxKKukFMDf9eyIAzDxunzB5MwqigencAzITbJsu/wWXxbmZaXT5Q
	egUUQGyUwCzbP7BDyRlh9uF2USnoDvjOnUONdllu8dlzrqE9FsCLyrybv/9Lix7C
	0GzmKHjGZVcN8xY9uIRbP87zPTlFyAZoOTlkH38MoNUPK5520ivFcA1smBR9/U1p
	a/d0pNQpyr16rDdFJLTqz7oG6eMF88nrd+Wt8Ma+Vsq3SBK4nPLNJN1uZqrnS5O6
	xrTAniNzD+5Tvuy0jy7W0/oDDdE0RzuH8S+Hp7k8jMWOcvVETAHR9W8UGEQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsd3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso7533449eec.0
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449692; x=1794054492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrR5z5WLBRqj/t/aUg37YKd0fkUMSKSQDHBU2LhzeZA=;
        b=bYSwE1kiiWgtHm2mQyqkmJdh5LAjJfpKG7P0+S6NDI9q0SArkYfC9krGMaNFT56+6O
         XPn34o8L3lHuVJkPXG9u/ylkx8VMCcRDf6oZjMPxCNFf0kIPpDbUDjVBrpKPXE+kQz0g
         xp2UzjH/E4KD9Y2Bt6IBTEdegbxzY82q1PomidNkgu8XA4h5XfQO/S7ojD6XkmKPUe/O
         g/wTOUkVUDiZAzq7GeS/t3ujPglsafFm2PBLByGAsKdaNYBTsANrGWEoHUfsB0YiuWcE
         Ko9UYDc0SQNcLH49CSKaKmfakT8VJCX2LdlzCllgGSRFcZqGKZB0ifb62SeSNiz+xBT2
         PTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449692; x=1794054492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrR5z5WLBRqj/t/aUg37YKd0fkUMSKSQDHBU2LhzeZA=;
        b=oKKXPHUjsTeA1xnguj3JXjQ9et1pEYiVd9DFcKOnub3jCCKAoVLFJz8AXnlC0hkLYB
         ejgo7ReDRYdZP7FSGncXWsEldqBw+IgSMUgMDF0AkqewtgeHA0iB1xkdVpKOxkMnCUkp
         57X6Qk/fUuX4vXtj1RsEueWE5gs2UAm66L/9eLMBDaEunkX+L/gCx3HjsmXT5xBXRurq
         Q4TLidaLn2vyVOekUq3yPRbbJlU1XiNlrGtP+b5guERLIbyqXqO8SWzeUSC7brFbuDlB
         KQLmwQfARUIy4IurFU5c3HuA9iVRKGcSXIXc1IGdErcyvEncwWVVgZ2FBAbez7tTmwGb
         cYAg==
X-Gm-Message-State: AFq9FYKhxXLAIh5yE67XhQe43pnMbD7o1PLswb+4Kpzeic01bjcSnGrn
	c0cCeSymoj51mTCy9d2uF6qm3nunFy5F+EhYwqIBHy6Hxv0U/z2WrdcsJJUKrZBamBl/g0l1yLV
	DJKZDUHHMcTczTYWTrf6SbL5yNql7CKchpUW0bEf33z9a5rfWAa4xBp/Dv/z65yfQkqVbzvIKjg
	==
X-Gm-Gg: AYBFou0nIqVRl+UDKP8nJIHOjmBV8QIgqUxSd3XCPZV0fqblXHv42AKSQIi50S/mZRw
	2/CR766GXeY81r+X2zxLmK53KqmXouNIxKerouDDb9ZYs+HZJxyEY0CFK6sQfN/4/Scp6i8NjGh
	1s8TfvlIhv9WP7dJGOlJ9YLyXQ74AsKDbaWEjZGytE9CxkKKHAmey+T588bx2gtzdAsHtx6N2Gf
	lD6jICLZOBo3N+YPqznQM2Tm9hos0nwy3X5M7rAtFOot1zmYBCnTTxqN67R22nzKiTj02hF7G1X
	K4G5a4UCueOLiOcyWRAISQWU6e4biUcN7FMbfHUXDs78Tri5QKTTBLDK1HXWaxibKjuwLWEYI22
	zIAFrWIQUh873F/dUjYs7SQiS9EfYUHFDdLjQ2jPwpH3Ke3bgxDoIbZt3GcqF0Wncf4OD7iBe4D
	kF0gbfiRhdLSpgNYSSDIJ0iicw8nw345B6+m6ulxujiwCN32faAdVZpmrhRI/naV5mNEcv
X-Received: by 2002:a05:701b:428f:10b0:19b:98bc:326f with SMTP id a92af1059eb24-1ac5aa5d85bmr8197074c88.18.1793449691780;
        Sat, 31 Oct 2026 05:28:11 -0700 (PDT)
X-Received: by 2002:a05:701b:428f:10b0:19b:98bc:326f with SMTP id a92af1059eb24-1ac5aa5d85bmr8197032c88.18.1793449690989;
        Sat, 31 Oct 2026 05:28:10 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm15515168eec.17.2026.10.31.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:28:10 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v6 2/6] lib: sbi: Introduce memory class for memory type hart protection
Date: Sat, 31 Oct 2026 17:57:51 +0530
Message-ID: <20261031122757.2572125-3-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
References: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX07zer53scqJi
 JGunCXFgl4VGq/EncQxF7LvIqIA+PaQBcbye7VlX4ZscE2EAotd5j4btrm68IlFVpPgfj8aewyD
 rESX95n8HTX1HSKxXn7owLyh+WhUX74=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5dedc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=fpceXIQPXNCN1ozAXgcA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: s0Jp2JtJGWZE9szIK87qBuveoGZ21M5Z
X-Proofpoint-ORIG-GUID: s0Jp2JtJGWZE9szIK87qBuveoGZ21M5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfXy5/ubzC0UaCu
 EvWyQJP9PaP0BcQlkPjigNWO8WkS/BP6vcg8lmLGh8K+dBDCuKTFRusYlDsesUxC1n9ezcLCxI4
 pk9uRyQlsu2ZvqqycK5AU3AhPns1fuBpCDUKxIycqTcmKcVbHpSMQQuVfFh1Ef6A6ZoqixNuoQl
 38WC6oCGxuKLKRolBXXkWE7sl23ji9TUtG0TazOIOn73ZziQvPBR62AJQx6vP9gAn0ZPAlkuwZ+
 7fzsiWk/+dbftSf81iPc7LyXJQR9pGouvsENGm3tDUS4dSkg5QmycghCRkiYM48SvFDLn0q6yuD
 In2yrAg8vCdVqi87qkjDDjXApxxoQMwenE6kkh9azFcpAYyZlZ9RVSsdm/nZTVwiroIbMVeDrDj
 NQ8S13xVlYFOU3kZpVB2H+MpLwEsFH4i2FiZIDcBTCVsSIjlIVssjE66Z+z+GGaASXRF8c7tKbf
 3XISksiln/+2MWZHq8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_052814_019126_EEC531BB 
X-CRM114-Status: GOOD (  19.74  )
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
PMP, SMEPMP and SMMPT which are currently the TYPE_MEMORY
type protection mechanisms, the PMP and SMEPMP are exclusive
to each other and the SMMPT if present will work together with
PMP or SMEPMP. So it will be either PMP+SMMPT or SMEPMP+SMMPT.

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
index bdcad0080baf..20ec940fee5f 100644
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
+ * PMP + Smmpt or ePMP + SMMPT.
+ */
+enum sbi_hart_protection_memory_class {
+	/** PMP CSRs: pmp, epmp */
+	SBI_HART_PROTECTION_MEMORY_CLASS_PMP = 0,
+	/** MMPT CSR: smmpt */
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
