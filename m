Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D94FF8865
	for <opensbi@archiver.kernel.org>; Sat, 25 Apr 2026 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ElIUnkyurWXm93L2bgv4hO69Nn0wfT29Xev1FggXGI=; b=g8h3U892CNP1Yc
	hO5Kk/swGSMu9RqbneadlK12huSMugCQsZuXUgDdhw8hRhabetxW+50VkBtFx2oSxvfBheCr4YO5+
	0tCGkrYIPw2UHhmSn/JbEXrZH9NEGnxD7G/Kt9Ifm3aFBX7bQSkcA0ckZ0J7A3t66I7MTnp/Aogep
	UHdmuRKTHxmR2NJ7jChSuffixRkSHFAvXKHCdZPmUrS83HRdWgNYcvBYYv1VYAFFeUF958NJ1smCi
	+eXU126Gs4cYZoo3HPXJimVhuLAU87B3cQgi5fnWLJvgYBPlVYvKHmOwXVJVLdx1Q73O9QB3qlHe4
	A6BrXmfwVb7G0jxqx1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRc-0000000ELug-2ksp;
	Sat, 25 Apr 2026 10:41:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRa-0000000ELsq-1CR3
	for opensbi@lists.infradead.org;
	Sat, 25 Apr 2026 10:41:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3KPQu1728696;
	Sat, 25 Apr 2026 10:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GMR0S9caWpJ
	W+F1FJchra63fcDD6pc4Jy4r3zwMDIPM=; b=mnQve48Aaq9qxP6yrxRDx81o1Tg
	dcoTdjNcC5a6cjufoabV5hR/kQbV7KT2ubd9NvRLz6BcT+rsnWNOszhyWTcCR/tE
	yMbyCWwEDP6GwDkRCoL+NgBJAOb0LVMGDD1AZo/fpj65pTUHmqWD73O+i588VX/3
	kmyRO996rWsPYPkQoLWWs5IwQtpDdaU7yW67W//hdiFiiCVJNZRqgTDwhBg39P3v
	uFEtObRI5BNir/+19M3Dol5VhvbG6bJpbTp4+6iZaX9ot8dc1y9noAeziw+WHwYm
	kyHZNr/KzL3tI7jAWwZTBAEWmbZnAc2Jk2tIh6qPaku0nP3mrz3zqHEdRVg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx8rbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63PAeodf005577;
	Sat, 25 Apr 2026 10:40:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4drpph2c8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:50 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63PAenMO005550;
	Sat, 25 Apr 2026 10:40:49 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63PAentZ005542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:49 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 17023215F9; Sat, 25 Apr 2026 16:10:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 1/4] include: sbi: Add sbi_scratch_hartindex() macro
Date: Sat, 25 Apr 2026 16:10:45 +0530
Message-ID: <20260425104048.2335262-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
References: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: OEqryJ57afM2CykqpLg6KUjpVgx8GxbV
X-Proofpoint-ORIG-GUID: OEqryJ57afM2CykqpLg6KUjpVgx8GxbV
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ec9a35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=gediNOQQjWOMD0gy8BYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwNiBTYWx0ZWRfX8OS6Ld8eZtYM
 HNt7yigmnftcV4bmetY+Foxxr9lN6xqXechtp/TrUu8LPrONCXHywpCh579dOUKDg+1rKo9a6pp
 +VQkLc1sa1EmAPtTMABcUtIeQUuySjMwoVGm7KvrAAhSfyzeuXXJaQ6Vag4n1ziBOAZqN3ZE7A1
 eRp1JGRvcoH3xij316MTdec2T9mSA/Cwt1Tuw5Zh+JObcL1XnudgoLwfNEtMERUZjszyGG9nVJy
 2vK0e1r/wmvCiY/Sukr6ImFaQ90MYb8ZROSist55anzk/MvcJzh7qHd5r56m3EnOzldZxdyB2pm
 oxwbPUKPj9h10nl+Jtcvk/hZ3dRWiHdIZaYWvRrpPWU7vipRQEAfh+x+t46kkELfQqInTWGxyoP
 30Xmd4STyCC5hkCqQ0XTEujnn5ybMQ1WGT9cXva7FgamAzxcnO924BrZNLrSLYYS9WVgTstxI+x
 MfhcloHJ8Ju8fXMtkJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_034102_459576_C6EC8C2F 
X-CRM114-Status: GOOD (  10.46  )
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

Add helper macro to extract hart index from scratch pointer. This
can be used to check whether scratch pointer belongs to a particular
hart or not.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/sbi_scratch.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 58d54628..c12aa796 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -166,9 +166,11 @@ do {									\
 					= (__type)(__ptr);		\
 } while (0)
 
+/** Get the hart index of a particular sbi_scratch */
+#define sbi_scratch_hartindex(__scratch) ((__scratch)->hartindex)
+
 /** Get the hart index of the current hart */
-#define current_hartindex() \
-	(sbi_scratch_thishart_ptr()->hartindex)
+#define current_hartindex() sbi_scratch_hartindex(sbi_scratch_thishart_ptr())
 
 /** Number of harts managed by this OpenSBI instance */
 extern u32 sbi_scratch_hart_count;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
