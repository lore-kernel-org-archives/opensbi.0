Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BB4606A332
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ApD9snt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=irpJaJVo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ASmMG73g89OECYaqxXXqq7qePsu5Rb6b1KbaUG/Cr0o=; b=1ApD9sntrS/ApqjWkR8Xpq7NI6
	bnfbjdhyb6gZMx6rg7ig4CDJNFmsFNMLaS0XRn7/rjEJH3fXZl1Q2QoG/SCWzq4i5o2Lls9LoBlOJ
	RpYvQUg7/LBFiGZWVPHZ1kfURq3WFvRyJd+vasTnfxPRVP60PfT1Gjs1T5XrjU/kwCgtZWUDd4ySb
	MUlJ1XpkG4dWOaL1AK87zTxGKtdKrBF3xdoUiVP2NBxWdQh/8kKaydv41xHPB63OGG6XAG8rm2t3C
	2/Z9iF9zn0czKyz4n1VigL1Qk+82JHSY+HG3zjkNnKfkznTL/0hcIG3UhzKa+gkx6KzY9qNUx/CqB
	/q/7b5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndJ-0000000AMrd-1lCy;
	Wed, 18 Nov 2026 21:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTndD-0000000AMn6-08NE
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 21:55:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDTUD300982;
	Wed, 18 Nov 2026 21:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cNqr3ew64HS
	kLxykSiweHl/akFLZD6blyhLkO++045M=; b=irpJaJVoUxtIOr9lu8UgKDcRkyC
	YAZTP0BK8mK59asi1RCWsMR3ZtV25MiU4tN1UUqqRXJbnQbEx/lpD6H2EUq/WISn
	MfoTWPUWg6G2/cq2HGKW8kLYmMPeS1xCX6DG/1LOQ3baHMJISCBZyY9O418x0Hgz
	zh8hn5XgGudwvlssm2M4OBehVzMBkZXvQMLIo3NjlawOnjv7bcuDUkq2VZZG5k5r
	zbLGMHzfj72cCINUpvGapwgq8eEKbJvlWr+j13tGPCgl01tYkO6hNqyCuQAi0bwA
	qSM1LthDst1f+YZXW7j2kpBttsQHuK4t4AhzKyWzFggm2FAQbvGO+fYuRHw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg1dwa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILtoiO3727867;
	Wed, 18 Nov 2026 21:55:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 6AILto1u3727862
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 21:55:50 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id B7BA024CC6; Wed, 18 Nov 2026 13:55:49 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v10 6/7] lib: utils: mpxy: Fix RPMI service ID lookup
Date: Wed, 18 Nov 2026 13:55:47 -0800
Message-ID: <20261118215549.2499040-7-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
References: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 6BW7JLEkioNo5wEfbZ9YFPskIyrB-xPf
X-Proofpoint-ORIG-GUID: 6BW7JLEkioNo5wEfbZ9YFPskIyrB-xPf
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe1ee7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=m9DGP9vA8-QqvM16EH8A:9 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfX9eXCp/tcdCTE
 HsFcdD5Zlxeqi1qGPvaLBxo9YenqLUXyZzXvwpnYh8tunLQnO6v/dCXasghs/+IOkMYOh93niFL
 KfkQ5LODCYhVEKByxIGxl62tixqyT3E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4MCBTYWx0ZWRfX43PvG54UeHcM
 obj7TWXCycBIJanJfCaDI0VrOL1OfbwITh22DX1lyagcxCWU4Fx773Zwke5RGM4r+fH/du67Iyd
 vW7vw63M1Qqbb6nNQjg8jILIzCfbyITA03gcrRBlonLXPrhDBreUzgd4bCJNEdXHmgDFjxL0Ntv
 2RiYgQZboJLI+L3WwLBEC0SRDvTbZZQEqNIn2N2NGE4Lo6I88DM/Qh9qEFF3d1H49AaR2T3Yycr
 k3P9VSaaDDmfdQuyZA3Z20FzFKq0eMs7ltiQb9QBNUaX1965Fw3FWI9eORRI9UWAt5h/2AHbxwN
 i25/TlP74DDN8bJrdPQxROCauUX0YuFkNsB3IQr9bF1lhdkWdih/FWCSZPALuiq06KvKOkefD6m
 0VFThD+L8PdlBNgBLrH82Nrqag5FT7Lcun1TLRASmn0rQCuZv1Z7/U77su2htlu1F1ZlA+VqD0P
 dcONAz62kP7M4vHaMYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_135555_216902_E44E9D13 
X-CRM114-Status: GOOD (  12.94  )
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

mpxy_find_rpmi_srvid() incorrectly used the current service ID to
control iteration through the service table. This could stop the
search prematurely or read beyond the table.

Bound the search using num_services so every registered service is
checked without accessing entries past the end of the array.

Fixes: c5a8b15e398a ("lib: utils/mpxy: Add RPMI client driver for MPXY")
Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index 6b71803d..624831be 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -76,7 +76,7 @@ static const struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
 	const struct mpxy_rpmi_service_data *srv = data->service_data;
 	int mid = 0;
 
-	for (mid = 0; srv[mid].id < data->num_services; mid++) {
+	for (mid = 0; mid < data->num_services; mid++) {
 		if (srv[mid].id == (u8)message_id)
 			return &srv[mid];
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
