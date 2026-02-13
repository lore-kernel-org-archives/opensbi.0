Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE90EEF48D1
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 05:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NUrA+624XuGhmI2Gi63tiwIjFVZoFBtoKWxe6MrYGhA=; b=ohBRpYcZXr7XBf
	9jQQTgR7Ke3amqT7+n3Ub7+x2t5nARWynqhW0sZ3PtXhFfBLiVG0tyjXwrkda3dg+DUCzpxWbr/lh
	a881Kab3vQTkiKOlFX0n9MypWQwC/AhmIyZzZPnqWCeFLw/qQ1EniZCumAB1UFZqYsJarfybXDn0Y
	1vBmKZci3/BRNguz9HfeeKnIC09pt4Sc2TfktFqthIB/swEOJ5EFyccRD1M4V+Loumr/bEXuyr2KF
	92WbozdmMpUk3UV2Qb9akDcr5mrILAr96uSod0w8Rs2MGMdhVKgR1bDMkPCZFyY4J8X2mNUtkbHCO
	BDbPawbSM6dEU8EmEDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm8j-000000032PK-1LJ7;
	Fri, 13 Feb 2026 05:54:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm8g-000000032Nb-2zqV
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 05:54:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLKEFK1067977;
	Fri, 13 Feb 2026 05:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c+3AVzc1Q2iAI1er1MJQK3MPeC7Uprp2dt2
	rNzCmWNc=; b=otf1f0LDpWtqj5swTxtjGiQ9/EdbWjJK4c2cQey6UPunV7S70Er
	xlodilXYYqKbWcNzFAv/tiv6s1mLvGzfw9bVhoxV0eU8942O4TUVD+6iNN7ssrY4
	wb6yk5q2WvYN1z3GJZAyZQZILaWITh/Xn/AxZUWSgzGzAyEANAcfNjP2NF/R+OBf
	93Hb5Go4c6Sqf0sSn8+TGSZka4ubVmyWS159I7hGxP3rdHX7TkMdQ+wP94alLNfP
	6uw9gQ/meHfTEe46AdIPU82ppkathZu+5VUm0GUldPsqkEKcFURAjMq63D8yZpNW
	C3xOMJ1SdMRR8Fz/YNDBO8lPZhPH1RHfJyA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09kruh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61D5rh60006111;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfn97kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61D5rhjr006085;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61D5rhTT006082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C5830235AE; Fri, 13 Feb 2026 11:23:42 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 0/8] Extend irqchip framework for M-mode interrupts
Date: Fri, 13 Feb 2026 11:23:34 +0530
Message-ID: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MiBTYWx0ZWRfXwM3C53lmL6Oc
 WQRvycRoaboVdEdlBc6yqqJimPd/vWGORAkqeWCpqyb9qg62JXs7l/K5J4vkZkC7mf/+doayp3i
 iKTuGmOyCKwKStAZc7NO1IPbs3JNYz8VR2LVwPFIa6IA1DIpab6N3nKAiFKWZQIIzrL/2VTRZDq
 cIq9tR2L+I6EbyAErLyqwJaBgsGTVjzjrHGclPEXJQJ9MoLyELfTw53Oml2KuI3v/oVfeyGcxMo
 yqaCK4ZgWiY77TuQ91/v1tVro0ogiCivmFD3Kv9bIKFRavkxeDYmycS7NAh+fE18cmEZ3G6YRhM
 Ti69q6Y+VUmF7QE5jRfzEfY8fuaL97HVKHr+ZUD7aHwbE+cY9/HtOh2zX2xqTmeKoFmgUmmC20l
 m8dVFpfe7KcpD1GQL8dPxKG5rlQeJVUC2MyWcKNQzKgzzA1pS/8ZqiSgodO3kdMoDP5FlzAWuR1
 DWWyDHz2jNQAHCpDQnQ==
X-Proofpoint-GUID: 0CgT_ScA-Wl_dt5nT2qM7ssihSQlpa-c
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698ebc6b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=8fTsYDokL4cmS8J0QHoA:9
X-Proofpoint-ORIG-GUID: 0CgT_ScA-Wl_dt5nT2qM7ssihSQlpa-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_215450_758553_F5138803 
X-CRM114-Status: GOOD (  10.07  )
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

To handle interrupts in M-mode, the OpenSBI irqchip framework
needs to support:
1) Multiple interrupt controllers where each targets a
   subset of harts
2) Hierarchical interrupt controllers (e.g. APLIC + IMSIC)
3) Registering handler for hardware interrupt of a
   particular interrupt controller out of multiple
   multiple interrupt controllers

The needs to be achieved without over-consuming memory.

These patches can also be found in irqchip_imp_v2 branch
at: https://github.com/avpatel/opensbi.git

Changes since v1:
 - Fixed typos in PATCH4 and PATCH5
 - Improved sbi_irqchip_process() and sbi_irqchip_add_device()
   based on Samuel's suggestion

Anup Patel (8):
  lib: sbi_irqchip: Use chip as variable name for irqchip device
  lib: sbi_irqchip: Rename irq_handle() callback to process_hwirqs()
  lib: utils/irqchip: Fix context_map init in
    irqchip_plic_update_context_map()
  lib: utils/irqchip: Add IDC to hartindex map in struct aplic_data
  lib: sbi_irqchip: Support irqchip device targetting subset of harts
  lib: utils/irqchip: Add unique_id to plic, aplic, and imsic data
  lib: sbi_irqchip: Associate 32-bit unique ID for each irqchip device
  lib: sbi_irqchip: Allow registering interrupt handlers

 include/sbi/sbi_irqchip.h                |  74 +++++-
 include/sbi_utils/irqchip/aplic.h        |   2 +
 include/sbi_utils/irqchip/imsic.h        |   1 +
 include/sbi_utils/irqchip/plic.h         |   1 +
 lib/sbi/sbi_irqchip.c                    | 281 +++++++++++++++++++++--
 lib/utils/fdt/fdt_helper.c               |   3 +
 lib/utils/irqchip/aplic.c                |  14 +-
 lib/utils/irqchip/fdt_irqchip_aplic.c    |  54 ++++-
 lib/utils/irqchip/fdt_irqchip_plic.c     |   5 +
 lib/utils/irqchip/imsic.c                |  19 +-
 lib/utils/irqchip/plic.c                 |   7 +-
 platform/generic/openhwgroup/ariane.c    |   1 +
 platform/generic/openhwgroup/openpiton.c |   1 +
 platform/kendryte/k210/platform.c        |   1 +
 platform/nuclei/ux600/platform.c         |   1 +
 platform/template/platform.c             |   1 +
 16 files changed, 437 insertions(+), 29 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
