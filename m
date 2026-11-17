Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F4606A31C
	for <opensbi@archiver.kernel.org>; Tue, 17 Nov 2026 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eLLYCIzQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtfPdNAt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aPafE4/noy7p8QbsacGBpvxbNJcNVP26pI8Ay1oeItg=; b=eLLYCIzQnTa9Atmbg68byLwrAQ
	JuPvffePJ7F5Heh0dXPKUo2VmIH6RlrmRR33E3JvTI7WTB6KojxG9wJgOqTDsPV864dmGXs7oMaXY
	ftxXvMLKDSxzxwFMqZDHQolMzuMjmuAD+B/rmLEYOw1hT7V+2Z9VyjMF5M1S6eSNu7rnX2b7lv4CZ
	jGaLFW7sO/v6ydcz0/gvnAOHn4rsNvaqJtjgmkFOtOuRVjjuOo3iXZhvf4btmkwbj252D8LZD7/4H
	9HPAlHZOTC7SkHrZC16RPq0ul9EJgQ6eYqUulJBenyQGF1ZUzm3VqUOyDU0cekRBLQAhoNpuq2EyP
	ZHhNYQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOBm-00000006mww-4191;
	Tue, 17 Nov 2026 18:45:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOBl-00000006mvr-0LrF
	for opensbi@lists.infradead.org;
	Tue, 17 Nov 2026 18:45:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFR4Y73503964;
	Tue, 17 Nov 2026 18:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J7jdLACxdU+
	X3K0EU18/fLnjfHFS07SMmcw8dQul/kc=; b=MtfPdNAtv1FJe/2UK63o2kRTZUh
	6mLDXDy2lMouIbvUo5WYJxXl/0POHvYl3aEoANvKR38dmelX2V1oqmCrKdVzqHSx
	vZDzAyNYO4MoTGDbuY31JQP2pUlZHAOmB8gV6joj1nGj4HhWTn/k4g6QcwHJwr0z
	Sk1LbaT6bnxklJmKN7aITg62j2XcjNYgiPoVVqdwCVcPGgwBQxy77tXuKdBrRUOh
	MCCWEhPs6Dg92TO1t5A5SofVMBtSiDfq0DlPh83VbKVxlT9rEy3PDwBJTo97fBhZ
	uAb5i5zudna6v8cm0sfGRccFQQlHkjj/DFM05o9Ulr+EBFfbyJWn+wNx+aA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv126hp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:45:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHIjpiY3060644;
	Tue, 17 Nov 2026 18:45:51 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 6AHIjocw3060634
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:45:51 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id C1A6B24CC4; Tue, 17 Nov 2026 10:45:50 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v9 2/7] include: sbi/sbi_hartmask: add equality helper
Date: Tue, 17 Nov 2026 10:45:41 -0800
Message-ID: <20261117184547.1145243-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: bK6AvigQ0tbRo-dpAWDQaih5rwtm8RTw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX6H2Vx/2f0DsB
 oxEr+loxrw5wlmTGCJTvoFTVMdDToWd8Hdx2wkQbwmXZfWiFF+pJJXALaQNr2ll0VNoxdNIq0zd
 WO1sX6vrkBnOBu/dp0RkQzP4AWoyS5U=
X-Proofpoint-ORIG-GUID: bK6AvigQ0tbRo-dpAWDQaih5rwtm8RTw
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afca0df cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=PLc3IS76AkRC7sn_w1IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfXycMHm6iIy7wb
 69Bi6u1JsWEMkrq8QVA855epQdjBJLN20KrqrBerqt8dLSqhAI2+4p6yCZLJLcT7KSw89gMzRoM
 r32NmB7Wle//nzkgvCox+H3n41bq4jIFo8Z84UDdy/HUEM42Ah0qEYaZERdXvOBh+DqtrQ7Aj+1
 P9OAtB4Tj6LKIDA6dIRuC3KEYND+t1NcVaNYbibKg+4m8+UCAs5pbf4L1spRqo504fdN+9EKVcA
 dhr4PMQXg1ddCxV90kp/uJSo+pj//ENLZUNrtG34Aem0uFuZegRbk49jtGd1NnUwfqIxBb+VoZ/
 EPr8v3a8CqLK6//TwDBSGkyGsfYFiLUrNazUpWgC+RXEJc5bftvUWNe5FKMi5XecEQm7FJY/Z6Z
 DHr8G/nIZEA66LALoLMUBYj4j82UuXI9bEganD8psvhksAW6sDqbLUBTuko9WnWah1S6mN6EGTD
 qxKRchjk7xSzWYfUKVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_104553_128440_187EAFB7 
X-CRM114-Status: GOOD (  11.79  )
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
 include/sbi/sbi_hartmask.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/sbi/sbi_hartmask.h b/include/sbi/sbi_hartmask.h
index da6821ee..e6fce323 100644
--- a/include/sbi/sbi_hartmask.h
+++ b/include/sbi/sbi_hartmask.h
@@ -206,4 +206,25 @@ static inline int sbi_hartmask_weight(const struct sbi_hartmask *srcp)
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
+	u32 i;
+
+	for (i = 0; i < BITS_TO_LONGS(SBI_HARTMASK_MAX_BITS); i++) {
+		if (a->bits[i] != b->bits[i])
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
