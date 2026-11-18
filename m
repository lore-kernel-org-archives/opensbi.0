Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD2606A331
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 21:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MHAh9WyC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEPjBJkR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kusCSIIthhcZaEPPv0j1HWXsmF2Oaa+hGq4Em5DS2zo=; b=MHAh9WyCPKscCVwEEGXAsY+UAi
	YjAVbQwty0t4Ekp4jlgo3yEEt2vUufUH4XNMXWxwE1UOlWJQG2VWElbS8u6ojYteDJhvsG22qEaW9
	Xf82hBcBuHT92ys/rZXaU3VOX0V0dMRWK4E/uT3PwNqk5rS39VHxNi9lGk6RStZ9bntkGpSho7pSW
	aN1gPZMnQm6LasXLYXxOO89H/pqFv69fGPxnhvTjWyj97tui4VsrHg5CI+jWSkLq6Bq6r2LHYf29x
	zdPzNYhN+8AvLmHYRzde+03pSSIicgvQUZ6yflZiJ1o64DXjDRB+xdzHi1MQ04CwwH9EmZhHKyUbX
	U/sdKcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndJ-0000000AMrV-1PjJ;
	Wed, 18 Nov 2026 21:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndB-0000000AMn1-0zPP
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 21:55:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILE3j32370020;
	Wed, 18 Nov 2026 21:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bA1TcuvtkFi
	JX/Yt6WnNVPXVo+V5ilR59rSrFoZdRJ8=; b=cEPjBJkRu+EWbODdCYGguokhxYe
	aGbiO/YjDHY4Dg9AFvYnfJthcO9y+hKYuur1dcR9K16+mzcTECzBkD+Hn5NbQ/TV
	b5AZbnWxeNT9jlDm+/oxN/gjweljpfg0X1KjNKHGklGVOCS/PsbvcGD9dnK/HN5S
	9LiMv7gCreEaUGNo/rZWMzPqQb6bVvR+xDqI5RyRQSudLTDQmT2swc8ePxuHxrIN
	UDFF5ksfsf7UW7gCYHGZK0hAchUNPV52t9qwFk3zgfGCyNvu6SItmyfIL/1SpjzW
	lcVALxdENCs8T+lPG9374ycQkEtZYPYzWNAntsZmQjvJOzV7rYnXFfYWMBQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrt11p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:50 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILtoIt1552885;
	Wed, 18 Nov 2026 21:55:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AILtnu21552866
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:49 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id A588024CAE; Wed, 18 Nov 2026 13:55:49 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v10 2/7] include: sbi/sbi_hartmask: add equality helper
Date: Wed, 18 Nov 2026 13:55:43 -0800
Message-ID: <20261118215549.2499040-3-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
References: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfX2LEV+2yro8ts
 68m7d3cXv/LILp0iMAjkoQm4gt48dPeVY6jSLglHp6iKZ/lu85ZGGFzXLpj5fqc5ncWFhwCb72G
 0bJCdrusW+gTcMcFlHglAghXhEiB7tS/8GBgH9Du2aJ6kGY5tmY/49rnssvwCQkinBrAsG7sI9e
 hBSREN40yGR/c1Vs9Vug7WFIC9NM8e3xX58UN43WB2K/HYOec9fZapk8xHWJquHFrFWNXZcpSa6
 SrlC9Lq6ADmF2iJS1gh/pThcxQ8oumhWY0sss49hYEWUtTaRSk1DDasIBZcpqfiow88XsPasBfH
 yIhBldSV6NvMBcfbFCgZIBliqQNjwG42zFohk4/cXd/fVFacJr6xiA2pF9hODbRd6p5HL3r9WJH
 lZ/zSZ8fZx+SMJ/VGBtb2xOfxtW5pyHFpHOHHDkeCRX7B3atC1tDYlO3bUR8/k+ZVLHHE6vigf9
 iLfD/CuxJsBCpqi3/WQ==
X-Proofpoint-GUID: o0bjL7SldD9U2W1TdzvDVlOOAxeIfr6Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfXxcyEzZmWJUaq
 TH1UiRf+EyC6qrT/JbMtCdjWGINBU0rxnaWWsvoPXQdnwzHeC5vrP0eaTGHXl2WiYQkSGYaBO6d
 ngcZDUMd4Epk3poSVcFpIMl6PqTKACQ=
X-Proofpoint-ORIG-GUID: o0bjL7SldD9U2W1TdzvDVlOOAxeIfr6Y
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afe1ee6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=PLc3IS76AkRC7sn_w1IA:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_135553_412482_EDB09A0B 
X-CRM114-Status: GOOD (  11.88  )
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

Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
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
