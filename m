Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC706FF8866
	for <opensbi@archiver.kernel.org>; Sat, 25 Apr 2026 10:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IMLLIIVOXvQb5TLau9nvmFTFjgwpWOoVJvanlRRQBaw=; b=CjgKGYH1fc/U6X
	My50yIV2lfImQVh7tWt8GrAps9d0sRTW1e8bm5RHm7WSa8nIBya0wqwceOjbC5EEk1cl63TWnOylV
	W+cbPgxIDMSJ+0DXsAjgE6Ey8VACdaYQTByveGcogSD4eCX9iXZYf5ceJ3F52mbKXko4B5njh7fRR
	ro0KopnKD4ePyguq/CUtlg0cymgAQmKp+lNxJ9X05ymktPqdtiwInvn8+iuJvUxwlrWRfYIhjdT/B
	2iF3OW6tpzF7RqHXZls0pVanpmY010uwu6aQX1ku5/XGFvQyB//y0fRBhNbekUDa2/UT3GXxSiiU+
	a8OR38EiGqyE5IoiJQFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRc-0000000ELv3-3yuX;
	Sat, 25 Apr 2026 10:41:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGaRb-0000000ELtp-0NU4
	for opensbi@lists.infradead.org;
	Sat, 25 Apr 2026 10:41:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3Qw91470937;
	Sat, 25 Apr 2026 10:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A9ySWwPKQ+z+HP7xzghVszVJe3p436+6Kch
	dtizxpNg=; b=pS6MVlAy2j30CUc2c5a8wKw+TDlD6hqfa61gnYeNYE4fvIytl4p
	guAiQCZ6nZl0TMXN7lLPaU8PONccJOaLPsfnbyktHNE6M6LhUaPxNGqGKw307Ke6
	NLDCStyDrEz256hd+dgeH/lHjEuJxYtZxcY3elr9PrlUfUI+qQF7Q+YyDJyPCWS5
	yYC0SLNOxYs2NuRnTV4IVvrNVqXESkBjy82W76VSSgRQW3UZaMWO2kSOQNdfSAs/
	IsaYzusBSUuQcpBNx1Uq2zDaohx7Rxf2qeb3JmGhF9skGfrxVaPiXgdde9nzKf2O
	TaMiZNVKmp3r3o5K7OY84kXZHlaWBO39Kjg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnq5rq4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63PAeoch005576;
	Sat, 25 Apr 2026 10:40:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4drpph2c89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:50 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63PAenae005548;
	Sat, 25 Apr 2026 10:40:49 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63PAenes005540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Apr 2026 10:40:49 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1569021A55; Sat, 25 Apr 2026 16:10:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Timer events for OpenSBI
Date: Sat, 25 Apr 2026 16:10:44 +0530
Message-ID: <20260425104048.2335262-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=QNxYgALL c=1 sm=1 tr=0 ts=69ec9a35 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=nPgPu_eHUA1ilri_HmYA:9
X-Proofpoint-GUID: Wbms-WjKY1iRCFmXFUBNIenUICj2_J8B
X-Proofpoint-ORIG-GUID: Wbms-WjKY1iRCFmXFUBNIenUICj2_J8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwNSBTYWx0ZWRfX7rpU8X5ZfLCL
 OsrTiisFju3S69GmQcGj+5T91C+xJDPz2g+vHt8BCBJUgfjJ8Seip7hhyag1HXckLvTm9F1w9hi
 LxpUEw6gM9cbF/rteGfv++eXdKgAqY8k4oddWZQcJF7wlkfMdiXiooqzdv4dQnCxUzsbNHzxS71
 n87DJRH/yEGOz2fIuTO7dg+XkquAa0Eb46QnKnASZI2lccrbZ0hM9F1EVEW4tv9alGOjYp/rkrz
 Wh56lDlf5vUPf22UL7WCIoA0Tno4UE4vPM9eKbMOkPnmVO6EaeEpUYxhp7hhjJI9ubSv7jcOZr+
 DiMl3SwHwxUMaSnOKpMckh1KZ+dFwWH0Zsq9bJzgQ0ey30uwtlhrkgfTsILnda+yYEnykmP+Pua
 FgpXOkbJ/EUV4Y2s7PAKENTwY1zd3CiC60BWw2cq/fSACgidDO0biogtpn2/wjt7U8ZrCwfFxbQ
 qOzLG+HdLH5LbyN4zEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_034103_139221_23C755E0 
X-CRM114-Status: GOOD (  10.30  )
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

This series extends the sbi_timer framework to support
timer events usable from any part of OpenSBI. The platform
drivers in OpenSBI can use timer events for timeouts or
periodic checks.

These patches can also be found in sbi_timer_imp_v2 branch
at: https://github.com/avpatel/opensbi.git

Changes since v1:
- New PATCH4 adding sbi_timer_compute_delta() and friends
- Fix typo on cleanup() comments of struct sbi_timer_event
- Remove the spin_unlock()/lock() dance from sbi_timer_event_start()
  and sbi_timer_exit()
- Update timer device in sbi_timer_event_stop() only when
  required (i.e. ev->hart_index != current_hartindex())
- Break the loop in sbi_timer_process() when
  ev->time_stamp > sbi_timer_value())
- Allow callback() function in struct sbi_timer_event to
  optionally provide event re-start details

Anup Patel (4):
  include: sbi: Add sbi_scratch_hartindex() macro
  lib: sbi_timer: Introduce per-HART timer state
  lib: sbi_timer: Add support for timer events
  lib: sbi_timer: Introduce sbi_timer_compute_delta() and friends

 include/sbi/sbi_scratch.h  |   6 +-
 include/sbi/sbi_timer.h    |  92 ++++++++++++-
 lib/sbi/sbi_ecall_legacy.c |   4 +-
 lib/sbi/sbi_ecall_time.c   |   4 +-
 lib/sbi/sbi_timer.c        | 256 +++++++++++++++++++++++++++++++------
 5 files changed, 314 insertions(+), 48 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
