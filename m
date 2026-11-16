Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702AE606A31C
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 21:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YpoHqtoe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhfE3LtZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=deQhiuEUammNVA00ibVR72wWdsheE1pOqvWX6QaN0Gw=; b=YpoHqtoeo4M2P2s1lJzhFKFjhx
	0blov4YBFNC1tzXanrQXAEQgLYfKNPYNpmCW8m1IvejQp+O4JxrQ5gMkb2lq2EfKxxtdoOQyeoiQp
	cFntBABUfhz0LGW9Wf9neMGg8vhaRMYVuhmdZ1O4PB0ZoMWXBDMPLQPc6wJeRCLHKzejHnwFOMQyL
	8BpAQlexy5kGcgnRwUtTf9caA1/CDU25jrsyzgIr+nRQlnEd1VT0XDK+VWGhQqKVpZ5U74a3Ud/ML
	FFrKwSZoHHrIiPidfM3Xp7uXwYd8vnfGsv6mFmoMcbG4w349qxzk5n0mY9xLpT39bL0v74+nrC/YE
	SI1waedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Xz-0000000410P-1KVw;
	Mon, 16 Nov 2026 21:47:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT4Xv-000000040xi-0GuD
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 21:47:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfR9M612386;
	Mon, 16 Nov 2026 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w/UQ9ulWJvr
	msqnd1R1excl0T1y6rFbgDt2l1El8Iek=; b=nhfE3LtZ2uzs1Uy/eVTXIP339QI
	fsPEfCUSqwqlesJh5yhIlBLj4kmr64AyecYKJZUUnM2dizpggZjGmZEfDOHu/VCB
	8tKigl2EAsC7nubfWtoN95XR7hS0TyIdief+jJBgNRaWWgMucaTwaGU6x8lTBDGR
	1oJ4yVmi5ze8C/Q19R8R4HnazmwJi/e9moJuQjtqNF10qls9o8Qr5kkcF6nofcDG
	Ew+cB7xh6gLfl2f7hlhdQCgO/XBFhg3EXQlAtwOQTgUP0qffbJdlxprjmXlB5ps9
	D+YGSixkrYrXYzGQ/LdJxbUSLaYAx2Z1U4dQ+7Qhxepp4XUpjX8GlpNKehQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6gju36-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 21:47:25 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGLlOUs1052319;
	Mon, 16 Nov 2026 21:47:24 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 6AGLlNQQ1052298
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 21:47:24 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id E5F3524CAA; Mon, 16 Nov 2026 13:47:23 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v8 2/5] include: sbi/sbi_hartmask: add equality helper
Date: Mon, 16 Nov 2026 13:47:08 -0800
Message-ID: <20261116214722.243038-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116214722.243038-1-pawandeep.oza@oss.qualcomm.com>
References: <20261116214722.243038-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfX8AxtBRoNlPGA
 A8RkjFS9/tOPsvk4t7tCx5j1d8WJEcTF4nBpmClXvRDkB+EZddU4kgwV9bf3MhD/XmIsmbMv0SW
 A3BBz+toOkqayToIidEiCH5DiQbrjQMG04Sk9C684TIv88TWLe6K/wmNVaAP7SMFPrA1ZQAowlF
 8KTELKu6pfCm29mk6E2axHYjB7tOeji8hW47C2WWjtBcckVfj0qzP0GL7toUfkgiZZKgRzGU6M9
 mfZwrJBK5JqOHsfKOi6ql5+30VRFFsJBl+EfgDKlfxmgEIubLyGXTQGT8fbRlmn0s9s/R7smgRR
 +lnYRIMUupcVdCotFAKNntbCCRpy0Ose5cFCtWkA7x45ZM+u8nzE4QLE6/dQ1a+CMSFTVnKgM7t
 lnq4dpQ5QV56P+XYj+TwEpkrJEcJ/nz1x3WKYdAgSv1qDKs2v3VWWjBfjkUx1dqBWUFuwrdg+DG
 U9CTx7lb5Rrs0ch2zYA==
X-Proofpoint-GUID: K9wP4onmYXJEx2i_8A49sXmpP_Jpuj_l
X-Proofpoint-ORIG-GUID: K9wP4onmYXJEx2i_8A49sXmpP_Jpuj_l
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb79ed cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=Gqzax4GKrRsUkqHTIwsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfX8OaIPkDreOw1
 PNrF5e2b664e7VPBYY9WY8FXSYaa0aWi8vNOKZWBmkxhHz6qI0uLdVLExcvoNM2iNeSjOa9bisE
 r23luuS+VzB4DqozINsAooW9mvGtIks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_134727_221582_92C4D8DB 
X-CRM114-Status: GOOD (  10.13  )
X-Spam-Score: -2.7 (--)
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

From: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>

Add sbi_hartmask_equal() to check whether two hartmasks contain the
same hart indexes.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi/sbi_hartmask.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index da6821ee..253a5dcd 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -206,4 +206,30 @@ static inline int sbi_hartmask_weight(const struct sbi_hartmask *srcp)
 		(__i) < SBI_HARTMASK_MAX_BITS; \
 		(__i) = find_next_bit((__m)->bits, SBI_HARTMASK_MAX_BITS, (__i) + 1))
 
+
+/**
+ * Check whether two hartmasks are equal
+ * @param a the first hartmask to compare
+ * @param b the second hartmask to compare
+ *
+ * Return: true if both hartmasks contain the same harts, false otherwise
+ */
+static inline bool sbi_hartmask_equal(const struct sbi_hartmask *a,
+				      const struct sbi_hartmask *b)
+{
+	u32 hartindex;
+
+	sbi_hartmask_for_each_hartindex(hartindex, a) {
+		if (!sbi_hartmask_test_hartindex(hartindex, b))
+			return false;
+	}
+
+	sbi_hartmask_for_each_hartindex(hartindex, b) {
+		if (!sbi_hartmask_test_hartindex(hartindex, a))
+			return false;
+	}
+
+	return true;
+}
+
 #endif
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
