Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A70CD8CA8
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3eXGj9wfDMniGpNcsifzJcTyTZuIrjbc0SukiPEDnw8=; b=mkCTtbMHe5xtAI
	LkQqQmpPxvCdfPBKmBSTEAAU59KozogfryaNuZq+HXe8tt2Z1H3ZC6GmE+nxTWGSCoFAHrKojUdnQ
	XIK2hzUVAJVk+jZGKXnEsLRVHzar8+50Ka8lMg//l40BLS7D13Fus7VoL4PnW3LSfu5wA82Bm7dpR
	bbqX4a3jX1WyH/XqKNz/EzIaV3GdCtByk/g7xSL4DLGzFXoYCeOufnseXPZU9D/pdUeyMPUFgPm8j
	4ALXCxob650NNocfMpTqx34YwcgxNP+z3jr5vobvchUwjQS/Qdn4mgJv5H164oz37a8O//jLCUqGd
	/ZQQreVBI5s2V3TIpLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvHj-0000000APOO-2zpd;
	Fri, 12 Jun 2026 06:22:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvHg-0000000APO3-3WvZ
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 06:22:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3A4vE2476935;
	Fri, 12 Jun 2026 06:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EA9f4X/USNZzA7hdRSlAdSUSCiS62rKtBhz
	6IhXpjYY=; b=p8eJj7A0dFZq3Arwdn0NOWyO7QSXfOmjG3NjGGIfz7HjU+iRflV
	xiTZ+9S5fiDW/UCjLg/PCatZIcVsib7UFZXjZDIkSmrcmdqVpoGqzZsIAMeAe9RD
	4teVbXs88/A25WhkeNgLXBIUEbrCANhCffmbI4gGFh0SlDbb9VyuW3GMn5xW59Lf
	fHJL7f3h+u5DmKgt4ozVkvUJewUjMtHl2nSUgDAAhalfjZh1JXYAIJduQIfk/uOh
	YgUN72M4A2EsVN7QxM/WIcuNfFGoCrhtD9J4/jCsNCv0HbwiHWsi7tUjHXOQ5ONP
	XRMe1+LdCnSoB2dq5JP9rnArCiXx9N3zxxQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5sv7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jun 2026 06:22:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65C6MKRM001385;
	Fri, 12 Jun 2026 06:22:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4emcmkpp06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jun 2026 06:22:20 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65C6MKEq001380;
	Fri, 12 Jun 2026 06:22:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 65C6MKl3001379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jun 2026 06:22:20 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 2AE7121C53; Fri, 12 Jun 2026 11:52:19 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] lib: sbi: Fix LLVM compile error observed in sbi_mpxy.c
Date: Fri, 12 Jun 2026 11:52:18 +0530
Message-ID: <20260612062218.172726-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: XXDd2kQ4top2NMb6zD-UwtDSSgJ56rHq
X-Proofpoint-GUID: XXDd2kQ4top2NMb6zD-UwtDSSgJ56rHq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfXwr1Jilb90QGa
 qk32Jz1jgOBWqmX4IvzcgerX4BIdkF/kTKRX7LPNL+e5WmGwUw6ZetmH3gK6agAKpwHdLGwXZrz
 bezpn3RCRJspwXjyUQk3zlB10v7Zbf0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA1NSBTYWx0ZWRfX2yTRw2q1Exu0
 IA4pww8f5D7nArJIq+u3RSwDw7ySDLKQhDoxokNEupehkbE7P+dfDmFmV/8rzl0Ky+cBua5oMAO
 t21iVVQQ5Z4PHwRqTUPsR8fKd1x+xKEsYIy1RgYD76+VQ7x+mWAlnzCFSjfQwKY6rTuKPw5sJW4
 2sBWdb1fHV5fQmwlLjluc5+PsTfsVQt+hdYUnVRWOxQ9rbMHEJJiZNitmkMbOn+lZUz08JDmGLv
 D43S8C+UEOy1NP0BIa5rknVBcoM5ni8v2k7R11rMgdlUY9pxbmDsfh5/t9VF0GXsNON8w3PH+cv
 c+7yxjxIRO4//gr+uMnq6c/y6r5S1v7BLvt+W0zrpUE9p9zFd2i4wR12BdbLzv1HOCeaa2ETFg3
 3jBQmMD9i9hTwnwdsePM1/JiaeL4yslFuGlD1wNSCENH85QQuBDoBWFlXzXBQpHGebMjEDc9op1
 r2a5mxIDdp2cchnwCQA==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2ba5a0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=wTc3_UFGKCPP5Dp4k7AA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_232228_891539_5F46DC7C 
X-CRM114-Status: GOOD (  11.83  )
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

The following LLVM compile error is observed in sbi_mpxy.c:

 CC        lib/sbi/sbi_mpxy.o
lib/sbi/sbi_mpxy.c:535:36: error: result of comparison of constant 18446744073709551615 with
      expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
  535 |                     (attrs->msi_info.msi_addr_hi == INVALID_ADDR))
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~
lib/sbi/sbi_mpxy.c:534:36: error: result of comparison of constant 18446744073709551615 with
      expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
  534 |                     (attrs->msi_info.msi_addr_lo == INVALID_ADDR) &&
      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~
2 errors generated.

To address the above issue, add u32 typecast to INVALID_ADDR.

Fixes: e92c8fd0836e ("sbi: mpxy: define INVALID_ADDR using unsigned long width")
Fixes: 7939bf1329eb ("lib: sbi: Add SBI Message Proxy (MPXY) framework")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/sbi/sbi_mpxy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 3e0e0af6..ff5c6ab6 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -531,8 +531,8 @@ static int mpxy_check_write_std_attr(struct sbi_mpxy_channel *channel,
 		if (attr_val > 1)
 			ret = SBI_ERR_INVALID_PARAM;
 		if (attr_val == 1 &&
-		    (attrs->msi_info.msi_addr_lo == INVALID_ADDR) &&
-		    (attrs->msi_info.msi_addr_hi == INVALID_ADDR))
+		    (attrs->msi_info.msi_addr_lo == (u32)INVALID_ADDR) &&
+		    (attrs->msi_info.msi_addr_hi == (u32)INVALID_ADDR))
 			ret = SBI_ERR_DENIED;
 		break;
 	case SBI_MPXY_ATTR_MSI_ADDR_LO:
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
