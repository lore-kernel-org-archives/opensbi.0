Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A8F4198E
	for <opensbi@archiver.kernel.org>; Wed, 15 Apr 2026 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MfZ6TR6Np1HV7e70NoCGoFS8qn2D333tXI8WDpKC++k=; b=vF2Dv3lDecGopf
	mI1TRPHBwtxcLi9mIZDjtmAB9/r0Lc4i/jQNh1TqA2Yfhf3R7BejiAW0KcDHOR8foQJeJMSK5mUus
	qzM8KwKxtFcu4gGHFF6wygiJzfHc6fFtmGwJDWHyTrwd5yKWmY63o6/D35B6iXrCycRDUReNXfXMF
	V5qQztiulAA5yMIsXo9yYbJCZLO7cEwbUhtMbhUg8FMpFL3Eskwh/zhxpCyn6S7qednE4rSUvHyyA
	8szEbBTQD0+GKEO0/9gDTn3Z8yiVyW/z8oF/uibgPfXCzWC3VWZ1bs1sR3JxlgWzzfYjhDg/N7H73
	XrdfwEdSMFhnmchx5NXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxyq-000000010Ww-2Wy8;
	Wed, 15 Apr 2026 11:00:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxyn-000000010Ve-2Lwp
	for opensbi@lists.infradead.org;
	Wed, 15 Apr 2026 11:00:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xTKq2773230;
	Wed, 15 Apr 2026 11:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P91YyvlpDfyZW49bbaDuic7nuidmewwd1Wv
	IVImUMy8=; b=ocmGCnbUgDdvlZjccwACZscb9eAP5tqGE2jvYCMJFijdVwZz+dw
	Ep4xwkqHZSUaluF9jmYwU6jZHuhNvUpdOm0qPdLC14TSEsh768UARBNLS9gx0KvQ
	lEcOX86DTH3IlMa8VbZxF0OYnikxiV1rCXbv7A6z1aXSL2BqM3i6sWbuYpoGTy4o
	NVYUlFjLSAodn/Ocfrt/3JgCVcmDAilBCrfhWHWOHU3abOL9k6UMzhFquIsus3yU
	7K6CuaTvSQsQE8nExy+5Mcje+ebT+wNhdPT0Jh6XBQ0jqNVJBATa1BStD8xpaCyb
	a7bqoGBTRjiP4dtmMABWQsAlnm6QniSxGoA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v126r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63FB03jj029579;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5d11e7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63FB03V9029541;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63FB03Id029529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D0FC421A6C; Wed, 15 Apr 2026 16:30:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/3] Timer events for OpenSBI
Date: Wed, 15 Apr 2026 16:29:59 +0530
Message-ID: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: aGQiiAYRpIrj5BRfkY8hMBi1aGeOtFRB
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df6fb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=amyLw63ENV4AMvtQeHgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMSBTYWx0ZWRfX3Y36w9/A8+T5
 qahRu41tBVK9XR9expqflEj2ndfpro2KFWUwcfUiKoboIhEuNpBhfsLtCda6fgR/6z5lpm97G7Z
 lNzUPXuCTjOOaZZQ02J/1Zd1OFh0cvVc1aJvI5iuktiJFPLhnYb3qe8behGvv0OtUhz7cQjKq3Y
 Vfv2YYIKVLaf2msS/C3vuXXP1/FyeWL/yuM+1eyxij/8BVmE0xsieO8OnNiDHikdwJtlDY6v423
 fPbagZRmP7Jcel8OL5F2c5yuMV3k324hyfqthlmkTo5E0VQmvb2qriGPWhJm3M5thh+CxoJRXh8
 mvuadrtzAP+Bs1A1y2Yxp0bBXBTGTjDskii7jO14+c+d8eIyUczD6oRsSCkxXQpEulJvDV5YJzD
 58ZC5HHeNKtg3v/43n9gI1c/18+lkFNUJ5DNyeNfiiibyJSbg9K4/uRCzYVDnjsuBF5/rEy9rih
 E87NzXoVhYFAk9KU2VA==
X-Proofpoint-ORIG-GUID: aGQiiAYRpIrj5BRfkY8hMBi1aGeOtFRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_040021_601670_F8D3BBA9 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

These patches can also be found in sbi_timer_imp_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (3):
  include: sbi: Add sbi_scratch_hartindex() macro
  lib: sbi_timer: Introduce per-HART timer state
  lib: sbi_timer: Add support for timer events

 include/sbi/sbi_scratch.h  |   6 +-
 include/sbi/sbi_timer.h    |  43 +++++++-
 lib/sbi/sbi_ecall_legacy.c |   4 +-
 lib/sbi/sbi_ecall_time.c   |   4 +-
 lib/sbi/sbi_timer.c        | 221 +++++++++++++++++++++++++++++++------
 5 files changed, 234 insertions(+), 44 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
