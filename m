Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19820606A31C
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hWarauzs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kvmmgngC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ydQHZf5AQIVp40enfrvVR3fwNOZnzaHEIWDH+GTuKmE=; b=hWarauzsZY55jf582HwwHAZO+6
	B7sojszU4F/Dk+WmQ5KTkZ2V0+kOUeHHTIFI5S5Ry796SH7bJ3UT/EoCOYQ2m/A9vIxOMpNiHpOvc
	c8N4HArUHbF+Cn3S3vUeoWtrIw/aXMGKcKV5mEXIzN0Dt/H25KmoYgDzhvqY5P3HeFPJPYzttexY6
	f+EfqA3LQfOsnK99CeBwPYNR34vBGdWKvktlIegsM+6/+1jl/EuE6qzeNgpip8UlEmsmv+ERBGEh0
	xh8s4PvRSSCGwo7FtfThW4NhlYa86PKou0+3Q2u1+CF3DDyZww2yLFCvVhcneJXtH/tnVnDSgc0n6
	fQ/MCT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndJ-0000000AMrx-2Bll;
	Wed, 18 Nov 2026 21:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndD-0000000AMn8-0E4B
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 21:55:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDcuC1417331;
	Wed, 18 Nov 2026 21:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YBcRERI+LMI
	mpBzDz39+fH5KifucAVz7lT7cbiMtz0U=; b=kvmmgngCjpCMKg9N4TvxWgL/bev
	3AmB26sO7E6GKMUgdQpW+UPEH4lATfdCpXNkxmIbQFa7/egZlg4o06dZV1ZbNWo5
	WuTEkhNd9KjVzgWIdN4EYfmcMQbgM1gq03/1kFtpJuZqL5OzqEyuZheKFxsiVaUB
	4Op+1Xis7UsfnVHmiORO0v8Szy8z7d2u9IjjT5qpR1hpllJOCd7I54zMozaidwVK
	kfdnnOXb1Ib/3sMG8LXUz3ylFbs1tSsTTcCf+HdaS4GTOc9Xnay9YwAKRfM/YnlL
	Ze53QR4yiHVnyt4vBQME4NDUE/1+fegeHSKDxKLuhR7la2+QmcTKY3E4Wfg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p1527-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILtoVp1444053;
	Wed, 18 Nov 2026 21:55:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 6AILtopB1444045
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:50 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id BC0EE24CD3; Wed, 18 Nov 2026 13:55:49 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v10 7/7] lib: sbi: mpxy: Register extension unconditionally
Date: Wed, 18 Nov 2026 13:55:48 -0800
Message-ID: <20261118215549.2499040-8-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
References: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Eqi8nB4Kdtufmh68LE6xnIver9c06J9x
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afe1ee7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=XuAbEzKkVT7uJdxXfSwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfXxPbh3QPSByrR
 Telwzmsw1pXO/uG8nteuA+Fuc8Dj373Tq/UBHq4ARL8hz+N5NRP/QTQMuSlKE0FMclwDyMcBylp
 oJP6wNOHYZvfnItgvMmCK6ryYCbdSku4d7sJ+vBrZj+uu6/NKePG8cmsWDJQUVQArPSdNhJNIoQ
 J21ctU3s6BZ78gWk84kyGZriIm8vqMzfjtcUBqkHzluGHgQsoKF+uF1NmQCRYhi6TJFoEHZVc3w
 ozx0LMOFJBN/KVuvIofTLIkejeLb5g/QbzZuFwT4bzP6D6/agC6t4dhV8ck5tFJcfmLG4Jc/hSB
 KehPv5l095jgNMKOMsEht1EjG9qzvkhtiCQsB9NFS/deQZ+bE8Y6VrM9boFoqINpXsthJHNa1Ks
 aT0cD2oCuFYcyFg4V6uxbAp1z5qdcHhKu/sIg9WJJq0Spr+D7pPsh9gw+ekh/ed/YjbXKwnTv+k
 OL2bB5rr4wDg1dw80Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfXzd45pftgCKCM
 J6R1BVrlw8XcGK9MwTFxYyqrQDHr+iEdKYcGcfGkiOZC2pfSfCs6+RYzP0flBTv45HuoIREKMYO
 vl9pNFMln3B85gavetS3SPWTlJWlkOA=
X-Proofpoint-GUID: Eqi8nB4Kdtufmh68LE6xnIver9c06J9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_135555_221800_B2D4304D 
X-CRM114-Status: GOOD (  10.59  )
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

Register the MPXY ecall extension unconditionally, as this is too early
in the init order and any channel might not have been registered yet.

Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 lib/sbi/sbi_ecall_mpxy.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_ecall_mpxy.c b/lib/sbi/sbi_ecall_mpxy.c
index 0a5e3525..bd55640b 100644
--- a/lib/sbi/sbi_ecall_mpxy.c
+++ b/lib/sbi/sbi_ecall_mpxy.c
@@ -57,9 +57,10 @@ struct sbi_ecall_extension ecall_mpxy;
 
 static int sbi_ecall_mpxy_register_extensions(void)
 {
-	if (!sbi_mpxy_channel_available())
-		return 0;
-
+	/*
+	 * Register the MPXY ecall extension unconditionally, as this is too early
+	 * in the init order and any channel might not have been registered yet.
+	 */
 	return sbi_ecall_register_extension(&ecall_mpxy);
 }
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
