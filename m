Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ECDC531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 04:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y53bjxz0kjOZdKH1+valEEyoldC70tJUsh5LQfDyX24=; b=pfFFkcUj9M/Tob
	3rFbe0QcabK7Szv63KJ2IKRvM4G2N0hZGcABK+PiCq4eKeR3AHIDPpVmyeb+oTSMxTEtquh2fwwTk
	bSGqH2JIamwz21JC6bPjWdgaKx5ctfRX3hjzXc+bxJWWPQBQKkL15Nckps4nnZhOkP1wT3BkeZgOH
	SbWAi+D0D3tMKaWtYmBHfi/TbCuQ7VVaXzsue61cPggi1faJLXzNmfGMb3dzko40uh4zSVptCyNG3
	XWBJLpeKTuM12ckY4r1Qg5BoSjgDNRA+gFI7t7dOTQm8d6Q7+Lbr3RPw5HNgurxCABwhMAAJHhU/d
	P+sy44c9qNesti4XX4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtw-00000001vax-1eIs;
	Mon, 27 Jul 2026 04:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtt-00000001vZB-3iXH
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 04:25:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fwR72417162;
	Mon, 27 Jul 2026 04:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kHQf1XXFMlb276M+jiO+3F7rPFSONbceUGH
	jfgx6OT4=; b=Q84oapjw9wpN+MXQ74hqeP+6QfDvNin/EpRKOSAHU9oXxdcuWue
	EcNx4OPOmYpM000DU2ljs/P+FKkdlaCBtblZAYR0cPpt/M08eJ6LccIIc6wNPhl0
	no/+6uwV9CI7ZkbZ4hoS9HagLYsm1Vlo+tA2v3/W/V7KfDQtgRJbmXROovNwRacC
	lCJFUNlFXH0VnkQ8UKR91bBqiF+KdItgg7xt4SLS8QBoy7xJnqjrZnwnQVrytPkH
	rRzwlZMlL1hP9dJGs8vOjzwpkFqBtPOMTvo9+YvLnOEhO0xKrBxVVSirm8MpoC/9
	IRagZaUPPfuxBV7BYelBfqisKNj5IylVzHg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmqycgnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66R4P69H020035;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fmp7hjd8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66R4P6dB020015;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66R4P6ms020011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id A597F21C61; Mon, 27 Jul 2026 09:55:05 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Extend hart protection abstraction for ID configuration
Date: Mon, 27 Jul 2026 09:54:59 +0530
Message-ID: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: VhxCEEbhLGRZYiq6L2PU7ga7MwSXtSTn
X-Authority-Analysis: v=2.4 cv=drbrzVg4 c=1 sm=1 tr=0 ts=6a66dda6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=2WzdzGUaa8jloaRP49cA:9
X-Proofpoint-GUID: VhxCEEbhLGRZYiq6L2PU7ga7MwSXtSTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfX8QJHlfSlvAeZ
 puqfQa5rS/ZiGKzfnaBxRoVzLnTF6+ucMWVR5ZCnfc8ZZYkN+v1QUFZwPQWLEk9RMZWuIOBq0Yh
 bKK7mgGuCZzcOmeUidINKv2vZyT93Y7Bfo9VPeJZy/Y1gtQE26rMl/SaccFMRREtFHGSKjJH6cB
 7C/mlR9zIHyagvJfLPz2fPbtbjaiiwyrG3Ey9LhIqGUThi+PCLz3y3b0Cengmd9+4eLo29d/6+e
 bitfJDCWgKIk0YMpvfgHPmEXxLjvAdVYJqsaIS1YaclNDa9TR7uCeqPSkghltVjdP0Uur+I9WNJ
 4jkCq5f8yxiPeC9bRUL1vLqb8bQ3X6ApbxNdgOPO4ILJZduaseec5AYdRcBUs7n5vwj4kiADH36
 h6bQgRagzqsQKdKdmQcVOm/F8wq/NvpKYeiLaU4TADGKDZQLK1BM+Wr8wJeDBoiWC4FIP4iTADq
 p9TwBnCOHAj2g5wYrJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfX9DcrA688zFNz
 IiB3FDQLxPNrZlNl8b5ECA6g7TufJ5mGRUa2pQj7lpRXexIuxmFiM5pB5ZMUePxDJQaqgGHa8GJ
 d1Xp26UTKmFF3pAKqsdoJ7pvdHn7fJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212514_038646_24C33F44 
X-CRM114-Status: UNSURE (   8.95  )
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

Extend hart protection abstraction to support ID configuration related
ISA extensions such as RISC-V worlds, Supervisor domain ID, QoS ID, etc.

These patches can also be found in sbi_hart_protect_imp_v2 branch
at: https://github.com/avpatel/opensbi.git

Changes since v1:
 - Addressed Rahul's comments in PATCH1, PATCH2, and PATCH4

Anup Patel (5):
  lib: sbi: Fix typos related to hart protection
  lib: sbi: Introduce sbi_hart_protection_reconfigure() function
  lib: sbi: Add domain parameter to hart protection (un)configure()
  lib: sbi: Extend hart protection abstraction to allow ID configuration
  lib: sbi: Print list of all hart protection mechanisms at boot time

 include/sbi/sbi_hart_protection.h |  49 ++++++++--
 lib/sbi/sbi_domain_context.c      |   3 +-
 lib/sbi/sbi_hart_pmp.c            |  13 ++-
 lib/sbi/sbi_hart_protection.c     | 153 +++++++++++++++++++++++++++---
 lib/sbi/sbi_init.c                |  18 ++--
 platform/generic/eswin/eic770x.c  |   8 +-
 6 files changed, 202 insertions(+), 42 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
