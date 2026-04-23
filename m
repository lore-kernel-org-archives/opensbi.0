Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937BAFAD40D
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UeMhmDi7KovRv03qOAT9Xedurn5rxr8FfjpzJ//h2GI=; b=MQ2/e8WHlq7A35
	XozKQqvmQ+tsfxy0hN8psvzd5L3NQXs18drH7fWXyHW7vu51YSQndZHTISlRMGZR4+X9nVXFRf08O
	Q6xs1d7pPMnwyIEPVv/oTebv5z1NwJXyuT+pF9zJbGda28b6C3jgymMZb0Ee36UxSmfJz+E3l5wic
	B04OGZyJWqe78ynI3/iLuCjM+hU0PyYC3kWKm2yeRt4TIDs4VC0djHTvIYTn45jEx+nkjugb9j2S2
	SO4thJx+rKfU/nb9W+j9tx2uDDw0oeEHgO4uOSGs7yKPGujRF8aGJZT/eYnoHdindRhem7Olijx2R
	oKCzgclmQgKAqojaCBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXg-0000000B3kv-2NMd;
	Thu, 23 Apr 2026 05:24:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXe-0000000B3jW-1kuY
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:23:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3PwfX122023;
	Thu, 23 Apr 2026 05:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dO8nbqgsDW6ysMxFWz+P0I4q0lUv02df6ZD
	i+Cryrj8=; b=owRKXWiT8ALDqnUoQQY8gtTFjIkyonGnwqAnqXVjaZs6zmbxsv+
	rOC+Ks+A4TjAhCHLvP292GesT3iB7HsEkqomToI3/pCjPG2xbIpPsYeD6izsA2gm
	qqHXGs88QPfWsLfFNIkoWmcz2qy1N0Xdd1HclgpNDtU/VcFyWXH89XrWybIFbVoT
	9nhAAetQLGyufZuZhBoU1GNsJRdaTYn2Apm1sUv/YEEXMN/aEP1wRQwLkNiliurd
	Fv0O96kW/JDegdpTRNz0Lx42+Y9c63OmVOghJsGQ9hhHaDOLm4M7s3bRHQRX8ARh
	kwwIkTI7rrlu3dGPfE30DZbyZV7suzqtH0A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h829sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N5NglH007145;
	Thu, 23 Apr 2026 05:23:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31jyv1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N5NflL007123;
	Thu, 23 Apr 2026 05:23:41 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N5NfVt007117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:41 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id ED53521AF4; Thu, 23 Apr 2026 10:53:40 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/6] Extend irqchip framework for MSIs and line sensing
Date: Thu, 23 Apr 2026 10:53:33 +0530
Message-ID: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NyBTYWx0ZWRfX34/EsxS7/rFh
 2MogTnBzogNmzzQi3eoosHbup7QoW9XwfCSHcD/OW9nRJt1mM89nYaBDYSsmD4CjiNlYjClQb6Q
 edrUNd97U0CaNyma1Y61JnEjuzLFDnzSENercxGs/4S5WjnPdV98YoGFDdB3UQqfbwnGL0QV/2V
 julG+KTB4O6VnDkqTS11VRk4ZRSaar9aCj7xL34/0AXANbmFTgKUnw4NYREWwqTvpkRNvTtYMpT
 1Qp4eHMcO5i5+H0ldYUS2vAM02OUQB0/Fi9ujLqHGqsEKPxYFfkNd4WxBIjn/+ycOXqszNVqODp
 AEWAXJ1ykgsNs+Yoe061iF4+ArINHxYY+AsSrW1uWXuLW61TUhX+/uNgEHHjnVq1J65OZrn8Gi+
 RkJ37bNxxGfN/Sz8Rk0s4s6T69LgBoIr2QjkcQcrLSORk+chj5sbp8aHQlowxAyIVZhaa/JWEdo
 G/6fwIm8fKQBUEomMxg==
X-Proofpoint-GUID: NrIOwjhRX9EQKbmlvcnxth97xvoLjKyA
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e9ace1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=gpzuCDYat6Ll9ARpwxAA:9
X-Proofpoint-ORIG-GUID: NrIOwjhRX9EQKbmlvcnxth97xvoLjKyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222358_460473_2AB2E94E 
X-CRM114-Status: UNSURE (   8.56  )
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

This series further extends the OpenSBI irqchip framework to:
1) Allow interrupt clients specify line sensing type
2) Support MSI controller (aka IMSIC) as irqchip device

These patches can also be found the irqchip_imp2_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (6):
  lib: sbi_irqchip: Check full range for existing handlers in
    sbi_irqchip_register_handler()
  lib: sbi_irqchip: Keep the handler list in sorted order for irqchip
  lib: sbi_irqchip: Allow interrupt client to specify line sensing
  lib: sbi_irqchip: Allow marking hardware interrupts as reserved
  lib: sbi_irqchip: Allow setting hardware interrupt affinity
  lib: sbi_irqchip: Add support for registering MSI handlers

 include/sbi/sbi_irqchip.h |  49 +++++++-
 lib/sbi/sbi_irqchip.c     | 258 +++++++++++++++++++++++++++++++++++---
 lib/utils/irqchip/imsic.c |   9 +-
 3 files changed, 292 insertions(+), 24 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
