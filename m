Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC82AC79F91
	for <opensbi@archiver.kernel.org>; Sat,  5 Sep 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8WLLOPxHMOvlE+j347wtAv7tzTCnyMT1OPi/Jr8HOv0=; b=flcXGmGRTtDYTt
	UipODDmujKSjg1p1NFmXZYxuiFNSW5+E+6tgJUzq4hJupXHEqJZ8bOctGrXUSZ1l634bk076RaCJd
	FXiscrSa8o0BcOlRUUb7u0GBa9eqUxPKOevypa4smzHnhuP114AR9VWrzkMIXFqVnkNwkDuYKsDdk
	9IDNNlsEZ0FTdY7QID+pbsuKLgOCuBujqnqjxg1UX0XPhqBwrxX+Q+naUF/wRsNGSyjwMNusBnonq
	w81FhwfRMDg1gNMEWjduRY/N1TIvmNe8ybm4ID2gOIAHXqkEe5YUflflzwEWlLPYRrL9KfX29yp0t
	0AaeVU87ouXMvVg8h+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHR-000000045d7-08NN;
	Sat, 05 Sep 2026 13:18:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qHO-000000045bp-3BM8
	for opensbi@lists.infradead.org;
	Sat, 05 Sep 2026 13:18:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVTH31709626;
	Sat, 5 Sep 2026 13:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HwfxC9Nw4AdtcDG8jz/Eh4YWgkdaIJyq3wq
	qjBqmnb0=; b=k61rMwPAJOjz3efijePw+0/avpFugaS6QhHgK77sPffw42ZCvhK
	TXynnqGfBeY58njElGF7g4F9mClaA9GtrE4MX7EP8DujjFCZx59UJ95d47OqsO4+
	2dfs/R3UjOIl7LfXhC/mRrMdpmagN71WgguEvaFvwIY0OHL8NnTCOo+R6lMyHS4E
	fDGMJ8ie9co5qFKtHkg6BZ+X+S8cRJ765Qt04dg8xR6c8M4alb4z4wWS/XkhoROf
	H9FeCNPpHNbaQNc+6pHEhEgcLCPct68YnNAGT7YHWRRZLrdqlOBQah6c+HEJH/zT
	fg7dhkBETkvdLIXrmnNwSq8n5EmeygYW19g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbueh09a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:53 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 685DHoEb4173913;
	Sat, 5 Sep 2026 13:17:50 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 685DHoXJ4173891
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 05 Sep 2026 13:17:50 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 52D2A22B3A; Sat,  5 Sep 2026 18:47:49 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v3 0/3] OpenSBI domain initialization order
Date: Sat,  5 Sep 2026 18:47:45 +0530
Message-ID: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfX3pltkdSaXJJN
 qe9OUJGuCxD3kCyj/0soLxHdxM8d1xLGqUz0KWdvbwiWWYPoWZke2ABc1SLIh/MOfV3WA08F0SL
 XMNykmpiHLCZ2wNmHvEFqSk7z82AXzH8kmF4JT+IAmX7waH0GOcxY5+MarlwJEBmKHzxCaPIKxj
 8QYVWlp/GZzz9ipwT3Kqt953hx61lDEf6tUCUc6u/fE2L3EXZHsG5mslEPrKd1ZaRSdjwe5fZb9
 l6sVpp5ckULFPvyjmE7kBV499QhEl0ShMNYkEnKmjMIYhvQF8IUmNLY6YCuZQkYLN6Q9F3HQzM9
 u5K0kUAfsZJefkVlMf5WMDUT0uSaam4OMFicV20L9+W36IVZDDRK0HMA61AiKX2gO31AQ8Csc89
 9Tr4Zeo8MudsKpjIYJRgxi88NkDrlWBvbs9gETZOJaL17qsZ+Oeq0G8kZ/08JAOwzPOm27jOqFf
 KGaJz+zk9c2RlLYUKfw==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9c1681 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=H4MaNSKtFCN7xJ7HCV8A:9
X-Proofpoint-GUID: J2UIigNjVmtrwdr5h8zUUlCMCuzpMgek
X-Proofpoint-ORIG-GUID: J2UIigNjVmtrwdr5h8zUUlCMCuzpMgek
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE0NCBTYWx0ZWRfX7Qbz3127ygom
 P0L16vWtd1Yag48sUKXRqbUozLJJs6n3HH2JIC2NuO0iUuMG5LxpSLljDxN9Md86/AUSFldeNo4
 BGu/v6wzSdkIAa1pt8EFIftwMH6qT7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_061758_796014_733B311F 
X-CRM114-Status: UNSURE (   8.49  )
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

Currently, we rely on the "opensbi-domain" DT property of CPU DT nodes
to select the domain assigned to each HART at boot-time but unfortunately
this is only suitable if we have two non-ROOT domains (aka trused and
non-trusted. For more than two non-ROOT domains, the domain initialization
order should be much more predictable where users should define the exact
order via some DT property under domain DT nodes.

These patches can also be found in sbi_domain_init_order_v3 branch
at: https://github.com/avpatel/opensbi.git

Changes since v2:
- Drop unused cpus_offset variable in PATCH2
- Update documentation of next-arg1, next-addr, and next-mode DT
  properties in PATCH2
- Added documentation of init-order DT property in PATCH3

Changes since v1:
- Removed unwanted "break" from the loop in sbi_domain_context_exit()
- Use root values when "next-arg1", "next-addr" and "next-mode" DT
  properties are absent in the domain DT node.

Anup Patel (3):
  lib: sbi_domain: Check possible harts in
    sbi_domain_context_enter/exit()
  lib: sbi_domain: Re-work boot-time assignment of HARTs to non-ROOT
    domains
  lib: sbi_domain: Introduce domain intialization order

 docs/domain_support.md             |  49 ++++++-------
 include/sbi/sbi_domain.h           |   6 +-
 include/sbi_utils/fdt/fdt_domain.h |   3 +-
 lib/sbi/sbi_domain.c               |  45 +++++++-----
 lib/sbi/sbi_domain_context.c       |  31 +++++---
 lib/utils/fdt/fdt_domain.c         | 110 ++++-------------------------
 6 files changed, 89 insertions(+), 155 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
