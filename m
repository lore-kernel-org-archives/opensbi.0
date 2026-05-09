Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F7ACD3445
	for <opensbi@archiver.kernel.org>; Sat,  9 May 2026 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U02lrU8HmqaRlnOtcKBE9/mOh8o1ZNritMfAYYTLVA4=; b=2z7xu1mcA28nhH
	LUMC/78o2+UfyNG98nj2DGo6SMjMXSErijt8pAPDSOjaeEvt8E2ZSipPhKbEu3wZlb4XYrmo/+Mdp
	vY0tqdX3yTrcLtS2L74lRZiN+gKYD2k4vUMuBI9xlVpIM4MsZ3qj2/t8sOd0MtML+bKg7NUhwJ17c
	uQzclqR9uEhXh+TmKjj7iQq3Ke1E9n+LRUf/vKlkqBRrP35qt8aFr7Y8Z7whRqfJ3KJhexshwL0nz
	mi5jbUdBAqxsP4BdyfdP3/4R//vEnl4Pf0B31zVhX8vz9KbwYWOAHr/864j8x5A7BgomYvDQAz5Te
	cTk+Cr2EERIkW+4tjTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkOS-00000009FSX-3QAE;
	Sat, 09 May 2026 16:19:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkOP-00000009FS0-2eCn
	for opensbi@lists.infradead.org;
	Sat, 09 May 2026 16:19:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6493jh702818001;
	Sat, 9 May 2026 16:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VZBzhclPp3MLJPUvCLg0veWOVDJzxa6UkzP
	6YeD4mPU=; b=kz+LT6+Fsy9XmomIMe3xDbxwdykVBgrsOav7kyzqaxPhV/uLVYN
	hqMAesgtGCt3xzUC6YItvzJ79iTNWJtXIFQf9gMY8MZa3/8IhaQ8E4XDU/Rixlgz
	QzuW/rGB4oToXdnlh/I0+iZosUl1tp8xkunMaSd151n7/UCGbuXHy68yFKRFoiS7
	FyS1cMvvuJeuIzghvEgIdryUOuzrmCk2rPzHqzj9qW3BOgDKwVQXg1t13Y6R2t1a
	yGOz0XvDKpmmvhWxPJogABX0aBjIv5E02QRVLUnj9NpdCZJUuWET9ue4ZDCgih0u
	XZKBSrqMqDVzJUpgssH2LP51ir1rgco4dRg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wa998pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 May 2026 16:18:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 649GIqRo005520;
	Sat, 9 May 2026 16:18:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e1x0hchtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 May 2026 16:18:52 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 649GIqX9005515;
	Sat, 9 May 2026 16:18:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 649GIqOO005514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 May 2026 16:18:52 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 60DF421534; Sat,  9 May 2026 21:48:51 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] lib: utils: Fix LLVM compile error in MPXY client driver for RPMI MM
Date: Sat,  9 May 2026 21:48:49 +0530
Message-ID: <20260509161849.2935816-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE3NyBTYWx0ZWRfX4deC7ofF5dwt
 zYbU1Hq+1cfgpRWCEHipkcGvsch8AwTCQjhz5VyTCAR62gjSHw5Ny8/zXGBTo8qMNA0qyMrjYbb
 AmqgRubuBihoUIVL1Hn04Isfh/y8N743eBsXHl2sf4uAhZXfrkJUNoZNw5mB7Y/R+bC3IxIiVaI
 F9uJ2jJYp0wynYkSFUyATHgKS5q/LeV7tgwfQDrQXCzNw9D1UbR/weZ1uoKH+3ZcYJTKsvGNj29
 unbf7e8+hto9k/OqwppsDTNTZUlev/TJmYHvB2TZmE2UEE0nMnKx0zBiZZ81ZCwR3z/bwJZLiD5
 MZ3lL4L7oXP6fv36ZInvWQeSP2O7S1CYYWR/lLCuhJN25qJ2UHfiQW02aitpJIm4bLDhsqAwmuQ
 IoJqCujXoLnK8dfsTakawtIipInswQC8v14bdzBRquzC/hpaBSzETsK1EU/O/Z8kBUa8vYIAdll
 FP2pYgB89tZkU0yhSoQ==
X-Authority-Analysis: v=2.4 cv=HO7z0Itv c=1 sm=1 tr=0 ts=69ff5e6f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=mz_PBBu8zrkj57Qz2jEA:9
X-Proofpoint-GUID: dDPdxBmFtn26Inco9PbPyqGsdLIvLAcj
X-Proofpoint-ORIG-GUID: dDPdxBmFtn26Inco9PbPyqGsdLIvLAcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_091905_882102_6E1C1E03 
X-CRM114-Status: GOOD (  12.96  )
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

The following compile error is seen with LLVM compiler:

 CC        platform/generic/lib/utils/mpxy/fdt_mpxy_rpmi_mm.o
lib/utils/mpxy/fdt_mpxy_rpmi_mm.c:17:6: error: use of GNU 'missing =' extension in
      designator [-Werror,-Wgnu-designator]
   17 |         [0] {
      |             ^
      |             =
lib/utils/mpxy/fdt_mpxy_rpmi_mm.c:24:6: error: use of GNU 'missing =' extension in
      designator [-Werror,-Wgnu-designator]
   24 |         [1] {
      |             ^
      |             =
2 errors generated.

Add missing "=" in mm_srvcdata[] array initialization to address
the above issue.

Fixes: 0b041e58c078 ("lib: utils: Add MPXY client driver for RPMI MM service group")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
index 0163d0d2..d7176aca 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_mm.c
@@ -14,14 +14,14 @@
 static struct rpmi_mm_get_attributes_rsp rsp;
 
 static struct mpxy_rpmi_service_data mm_srvcdata[] = {
-	[0] {
+	[0] = {
 		.id = RPMI_MM_SRV_GET_ATTRIBUTES,
 		.min_tx_len = 0,
 		.max_tx_len = 0,
 		.min_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
 		.max_rx_len = sizeof(struct rpmi_mm_get_attributes_rsp),
 	},
-	[1] {
+	[1] = {
 		.id = RPMI_MM_SRV_COMMUNICATE,
 		.min_tx_len = sizeof(struct rpmi_mm_communicate_req),
 		.max_tx_len = sizeof(struct rpmi_mm_communicate_req),
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
