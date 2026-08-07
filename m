Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C6AC5AC9F
	for <opensbi@archiver.kernel.org>; Fri,  7 Aug 2026 04:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IXtozktX4Cze/EpPG/iz3/MevIr6qHiHVS1b/Ai/pg=; b=a6/sFTvS774V7A
	0LHJETpvPik5zDe1XuVIU6f973+eJa/qVC1ePteUEMlJuXd46M3uLXz2f56RBf0qP7DPuCJXFOvKy
	jVOaxj0USmlTCykT+AhIjjPgghlJCnGc6z9t+RotQwkQjsxJ4Y0aw60uHiepeMw+4JQ1dh5M9yPHK
	Ap9PEnLzSmYVQhGEsUyPRxVNWX7HIsrq+WzOtdOwQ4fDV6SGzH766nFUXruBcngFIRceZ8Qkxj4l2
	qNJBDyCAvZcTDLKVRExq9VKVvoUdKiaWwrsXHrpsrIx+8QhcIDJVaW9vXThV4vhDj8gQeN1FgLndX
	d62N6yNjME+Z8Fa5ckLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCX9-000000075r5-17oP;
	Fri, 07 Aug 2026 04:50:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCX6-000000075pf-3S8G
	for opensbi@lists.infradead.org;
	Fri, 07 Aug 2026 04:50:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GllU3177598;
	Fri, 7 Aug 2026 04:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ja5tNOeac1kwjgS6c/tUWubzdnztqa2AcO+
	30UuDOeg=; b=GukqW7K+0q63vWSRkXlbF1iGE9AFeZ/0hlkIA1lW7jsM+pag7nQ
	jhHzNkx+xJ2HPJeYBcniHCHLDQSLZWiFYFqYoFjxlMGXZsDBb3zPpqRq3tOUdI0I
	6rH/GT1KBHEY7PH+UXIQZ5c1sxFIYRGz8pNsSjW3oMJEFTfPg/RNUeSikR1GhE3m
	BQCUgD5zyFN40Ad1rGOKn0VE+QC97m7sn30y7fSBEj9IEsEWlgHqaHYFE90bOuhI
	SSMQkT5scZQlDjpbUka8XPkf3NqYK/0VZtEsVB8JurVs/eU3Mpp67g/lmJvKZaSx
	nWowcq5zPxkm0f6NF+ulEaLswzRKPpEcQPg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jj6d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6774o5br018713;
	Fri, 7 Aug 2026 04:50:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vm119q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:05 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6774o5Wv018693;
	Fri, 7 Aug 2026 04:50:05 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6774o5Pf018686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:50:05 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BB14322C1F; Fri,  7 Aug 2026 10:20:04 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/3] OpenSBI domain initialization order
Date: Fri,  7 Aug 2026 10:19:59 +0530
Message-ID: <20260807045002.2538935-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAzMiBTYWx0ZWRfX+FhdiU9rv/sZ
 LMvG7rAc7ds/aN+F/skiw4CcNjzmvSP74cbr5Fyv6TlrimqEPYbHdfZ3g+J2pV7rEniBs59DzGN
 VfxJEY7fJJMVTKDsVkvTbzI/3ZutcUBr8cAAPNOQdE10/N01+sKmzwAHQcJCN5G07llq7vR9Spn
 KojT5hS5He1Ge2PncdQSXXHybifCtsa+vpcdk353VAOdWHK4xxkuu+kSQsXGkuL420u7vZT0nEh
 oA4C5HA+wLo/IsG0NllLWumJn5GWBGwaNo1zrxDlvy2RiShCJbq9fjzMwmRmmDsn6RvjcP7zHfg
 jjBtm41vkCkdZRSd6BptXLxh9iz4C8ADRQPHP++XeimydawNNLTcSrw6hFI7faOwK/otDKpr8yT
 4lDFEbFJYK9qjQqo5Tr13X4klMokQMWvVJ2YM+drf0W8t3xKfzUmEKx7Tu9YZBbqOemsRKLYEnV
 obqHB8ZPTSRdC/U9NiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAzMiBTYWx0ZWRfXypI/svJ4NNqi
 33A2ILdfVFVPdsBZ/VR22n45bAXKld+lWRg4ifoBTid/Sl1AXDp1CQTSGr+3O3sAEGH0Cz5d4Wk
 IKE3t34at6ahppOC2DwLu6+bpdKsp9I=
X-Proofpoint-ORIG-GUID: 4O9SV798IXjzkmZ-vGhGdLEY0c-e_RyG
X-Proofpoint-GUID: 4O9SV798IXjzkmZ-vGhGdLEY0c-e_RyG
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a756400 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=ekFEysgXQ27BxnXZrScA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_215012_869540_5A0C2A67 
X-CRM114-Status: UNSURE (   8.65  )
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

These patches can also be found in sbi_domain_init_order_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (3):
  lib: sbi_domain: Check possible harts in
    sbi_domain_context_enter/exit()
  lib: sbi_domain: Re-work boot-time assignment of HARTs to non-ROOT
    domains
  lib: sbi_domain: Introduce domain intialization order

 docs/domain_support.md             | 25 ++++----
 include/sbi/sbi_domain.h           |  6 +-
 include/sbi_utils/fdt/fdt_domain.h |  3 +-
 lib/sbi/sbi_domain.c               | 45 ++++++++------
 lib/sbi/sbi_domain_context.c       | 29 ++++++---
 lib/utils/fdt/fdt_domain.c         | 94 +++++-------------------------
 6 files changed, 80 insertions(+), 122 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
