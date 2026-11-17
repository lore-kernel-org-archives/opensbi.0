Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A47606A32A
	for <opensbi@archiver.kernel.org>; Tue, 17 Nov 2026 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHN2Wqly;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hErHAzpG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fYkJUcTszot65oig26Nh/SPtGVxbAFE4IERdEXtY8ZY=; b=dHN2WqlyTN6Qfu4sZGUjYrvu2+
	67aP/1MLNiJpAgohnD2NkHjfIr7Ya0Zu05+QKRIQF1CZbpWwmvHioKrynRdsljgHFeYyf+cBzykIR
	yEiraDlydvRRXm5kvdMMsujvxAWQ7nBnohQsvl6CvRwTEP5FqmofGS+HJlNFn9VkVg9OGTkRpV82C
	ic3SmHoaxf/jVlg+rslsDk/+SmCkppFet9kTkXeSMPJgKJFM0CRIzHmXGcwV/XYUif1tGZ1N9Oojc
	hNG5udUFgmcUHRlcVxGuUsVjwl8L+Ee8mMzRZyAvW8Tm6iV9Pp3keoQJqrUEpRqfFPFXYYtX/hp3/
	30FuLQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOBp-00000006mxR-0Cd9;
	Tue, 17 Nov 2026 18:45:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOBl-00000006mvt-0gVA
	for opensbi@lists.infradead.org;
	Tue, 17 Nov 2026 18:45:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQcvr4169876;
	Tue, 17 Nov 2026 18:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QlWAzaHdO3K
	iu1D59LeeC0BXjcUSl2QIhdjUgtwzV50=; b=hErHAzpGv/KWcl6bm8zs4JFoAcO
	OOwFHNXPWhCC8x2W+dg/WIifPnLpkzqN4eTJU7BReMAuCy6TmCKkVzuZMLXoSe7P
	s1T1ILcj8uKlQpKIESWdfg4kJTcSKFrJKLSDrC1azP5abwPTptQBNH/CEon7zUCn
	Szky0VhWN5+qLtloXx4zjjCWeUgGch0y06uRjv8/gAkjpvHmg4EX5xCu5JeISl7a
	5vk34XoiJvBjgdGzCxeBlsmHyo+xKjkNjNB4znbS7NhDFRUgbL1ofKglHkJFYj3P
	q55FTBCUTlF4npbz2eqHp79Qn1wQ8flUOVE4tgt3c2i6Up69YLH0StcAchg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve32s8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:45:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHIjpwJ3060661;
	Tue, 17 Nov 2026 18:45:51 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 6AHIjpPC3060640
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:45:51 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id DB51124D76; Tue, 17 Nov 2026 10:45:50 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v9 7/7] lib: sbi: mpxy: Register extension unconditionally
Date: Tue, 17 Nov 2026 10:45:46 -0800
Message-ID: <20261117184547.1145243-8-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfXyOtXJsYrQ0Uk
 V8UA372KulTeNVp9/B62/4JpImvIr7vUe+YTGJqzqBItbcM7yhdkoMeLSaOt/t9r87emJ61CJDP
 FJ5prF12txWt/TFhbGqrpJPUW0wLuoU=
X-Proofpoint-GUID: N6onSvjBOIFf134vt9FI_QCmT6jq7Mmr
X-Proofpoint-ORIG-GUID: N6onSvjBOIFf134vt9FI_QCmT6jq7Mmr
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afca0e0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=Gy3Qv9AVVwgb-yd0fg4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfXyPSTuhxqw3+y
 a0kl4X3JKPAv+B8m0OwPJpsoiqbcMkHytvF6yKuP2QDI7gB0VGY8EuEOj6tEDNzkdq/OfIVmii1
 TXhQTHX7TmLR+CBGYHPMGC/VgCZTx5dGNxS8gLnpDJ4m/baOVKhjYA0mpFVjykWDN14iKjbyHox
 ESoCHmmrL3fRViAtIlTB7On2j3pqXi54HSKGNMb5aatPmw7yvhrpTtWur850/s0J5h2mrYjXX25
 q0FxQn5Curgi0Ayuz49cI939EI0Ao5XI2y9X5NnW8MifPDn0UopMDGI8WnNRRCCL+TNTdXYLgsW
 Yb0hbtmiiaC9RP17poRcSH59ZesLyuq0+JtKh8PhuUUYCW2XwNshVKnABS+kVCqMB+ODHtU7/h8
 uny7nnsvHclWJU8TwaM5aTBNJ7pLSQv+WBCqgJF+9NnExdz9rixM+QigLkvpNXUy6R3rtkUF1G0
 emooggPbYfghQh8ydeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_104553_209874_07EC2A07 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Register the MPXY ecall extension regardless if an MPXY
channel is available at the time of regitration.

Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 lib/sbi/sbi_ecall_mpxy.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/sbi/sbi_ecall_mpxy.c b/lib/sbi/sbi_ecall_mpxy.c
index 0a5e3525..45cb4807 100644
--- a/lib/sbi/sbi_ecall_mpxy.c
+++ b/lib/sbi/sbi_ecall_mpxy.c
@@ -57,9 +57,6 @@ struct sbi_ecall_extension ecall_mpxy;
 
 static int sbi_ecall_mpxy_register_extensions(void)
 {
-	if (!sbi_mpxy_channel_available())
-		return 0;
-
 	return sbi_ecall_register_extension(&ecall_mpxy);
 }
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
