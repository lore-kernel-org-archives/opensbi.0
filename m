Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB00CD5BAC
	for <opensbi@archiver.kernel.org>; Thu, 21 May 2026 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KkDox3wkVyZxTpQJhIMG/ifhvnqVIxTAfmRk7zMiQdE=; b=hzgKlbvtBzdwHs
	x+R1xrUzYj9thtWIS0LeMp74JgOOvoauYTHsm4CI8HXboDl++WCPBtZzEuCxUeCNnGipQRM4g5CoP
	3PSnHw4R8/8E2u3089/29tTUlbUOAk1ulzeAn7fupRjREerTOzd602DbWlsYcj1vKC+IwMi+DjFPb
	9JHljwQv4cTFZcMCFLWK6mIBTRPhBI98TENiQyeBwko8Fv5JJRGaRXa610n+CLnNNljyDp1fIcm8b
	c40NeM9hrnzh3EdBztsxg1CGfJ/ilkgPXTkImP8+dafePYycV35GGqIuIvrvDsvrkdDUbtZfQoZgR
	qTTG4ZVIj2RGzjCtXDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyk3-000000078OH-3dQj;
	Thu, 21 May 2026 08:26:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyk1-000000078Mm-0yyF
	for opensbi@lists.infradead.org;
	Thu, 21 May 2026 08:26:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6uhDG963957;
	Thu, 21 May 2026 08:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=igPTCgNUNMzUB7gTx1qGzg0rBhilsH66VDd
	Pc5rTGp4=; b=LBuDTQ0EzhsyEfvEJtVkJO5YHzZgPUVxFoUdEtmmxTv27SuXmPd
	PBtzIZKM4ukxlF5cd5mbH2gfBqinmxyoKHJuiS4WQuLmaFqEI8HZYVRdy6/gwyhi
	GBlwmQEgy+eYU6DfB6WxoZJ/QyDTAFkLcyiSUdxqebvuNLMugrkF8e5g7Kyw0Qne
	w1qPZ2FpLnnX7auE1AKZ1EhvjVyaS+NdzL6c2+lx/J2jYDl1DgAJSjTTHqoSKZHo
	OZH1CQ+52gqXN5FT6IKIQoPpMj0MlVFlCj0WvtxFVWPbNqHWX68KRwC7R3/gQ+HG
	Cyu6QpMgDKRGIzJz9+DyOAMzBq1RunVT9cw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh3utg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64L8QUVS028219;
	Thu, 21 May 2026 08:26:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712gbkjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:30 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64L8QUag028203;
	Thu, 21 May 2026 08:26:30 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64L8QUu6028201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 08:26:30 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 8004221BF3; Thu, 21 May 2026 13:56:29 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/2] Minor improvement in FDT extension parsing
Date: Thu, 21 May 2026 13:56:23 +0530
Message-ID: <20260521082625.1520870-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0ec1b9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=taGTGjbq3fFEuWZIvQUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MiBTYWx0ZWRfXzFIjqjAIA2EM
 zDJ+uovAKxbxPYGGBcVGw78gxEbjppFiR066njAiILOUyqoBYdDhzVfLn2Y9ydVUVcQOSQkJ3Ef
 8H8mS2WTe/C7zqRl3zovB9w5c8BIM3ThyzZLoU7Q+quIpDwsrUzC1HLldPufHN1mgBUNFBJU43P
 v4KpUUVYM06C7f2/xC6pxy6Bl73+Wre/tl1I2q7rU5FNISuhGKvQywBoWji/DPieFuI3CfoGOkv
 1hKmq7EPwJXtvMSCvHWLOrj2vddjzaEWuoGmsP6hbbtYbsVttidn9uyhIuMePJ3Sgx6U0rSPwG7
 dg5i7pekzUd9Ic/FJCnLOsetGlNcDUAAfwHEYPxBxb8gh/ByAbq3L5vARljbE4bJXKYJbv6+T6q
 sW6eqklJUYYxJ5FHeoDDDOH2LoA1jhnK013+qouMgtcLNWvC7PjIlPaLqvr2wGXqRHqY9XMMqNi
 bvzwuecMwUVHh27u6jA==
X-Proofpoint-GUID: dgogjOd6sRJq0x7Z_zrbtBAonuviS86M
X-Proofpoint-ORIG-GUID: dgogjOd6sRJq0x7Z_zrbtBAonuviS86M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012653_392250_80E98BD5 
X-CRM114-Status: UNSURE (   9.08  )
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

The FDT extension parsing can be improved by parsing ISA extensions
of all harts in the cold boot path. This also saves some part of
scratch space which was used by the fdt_isa_bitmap.

These patches can also be found in platform_extensions_init_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (2):
  lib: sbi_hart: No need to clear features in hart_detect_features()
  platform: generic: Optimize extensions_init() to parse ISA extensions
    once

 include/sbi/sbi_platform.h                   |  7 ++-
 include/sbi_utils/fdt/fdt_helper.h           |  3 +-
 lib/sbi/sbi_hart.c                           | 14 ++----
 lib/utils/fdt/fdt_helper.c                   | 47 ++++----------------
 platform/generic/allwinner/sun20i-d1.c       |  7 ++-
 platform/generic/andes/andes_pmu.c           |  5 ++-
 platform/generic/eswin/eic770x.c             |  1 +
 platform/generic/include/andes/andes_pmu.h   |  4 +-
 platform/generic/include/platform_override.h |  3 +-
 platform/generic/platform.c                  |  8 ++--
 platform/generic/sophgo/sg2042.c             |  4 +-
 platform/generic/starfive/jh7110.c           |  1 +
 platform/generic/thead/thead-generic.c       |  4 +-
 13 files changed, 37 insertions(+), 71 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
