Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33197C5DF66
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=asAnA3pKh7aMNmu4MD81gIVjNc1XNRndWNZwkVb/Pbs=; b=ykciTJmZ95xe0X
	9sKg7PICcbcUVdPlTSeJDhPWSBtEFypLf/E4orujzoQ3+avy01SNE3wCiPjh+Za1O5xO8LAcTFGSn
	hXE1OkRHv/T/PWlnhyKcNuYbnIkaD6hJviwGWt0Ruridph//jrnBCH8bU1vAlz+oArdtXp/8NKheh
	y3uRDxbGbg7cvK4Z562oqWOQKyNE6NNbaBtv8abkbPvSDi9TTkCoynY+Z1MR5U8/LyKtL/N4cJRM1
	6GLv3kWhsq/XpJit66tRH/SYox4EY/NOwMevblTvRjhKF4abgUhnvX/B5HmfWxXWhRGunI8ykIKYz
	8HjjCiOpLNH+2iIM+FUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyON-00000006JHF-2IlJ;
	Mon, 17 Aug 2026 14:32:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyOL-00000006JFq-1E8t
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 14:32:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5rUF2008354;
	Mon, 17 Aug 2026 14:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=34xf4rqU5JMOn4+X6Hh6BXpv2eCGyrqJHFt
	c7DhxGI0=; b=Rm+22Tuh053LwCWQ3iPH3uiB4VRsDPbW6pj6pVICPgNQCZl9Tj4
	hb3n58dUTqQvqj/A+rjPGMsfbRWghG6ej/L1/Iq8gvHIorxZZ9zrxImhTZFRq/3p
	S92aIeusIYkH6SLC5UT+ZGtMGCr1AiiMLhpoO7MUnigiQaUTF17hEeQItEpLJiDP
	0vPovX0Xe6bFNbG2Z/FTp8njtDEIZV4UaClJ2416VNSHp854PaHIh4dLkysZe/YZ
	DL521jjxd6BHLoORYjkm9hNP0ynTudvWv586IlvCVbXqfHEqpo9jHtV3EOfbrtyZ
	cDKBnqdTHbuvVb2ddleFWx+SWPFTOvH6sYA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8hbsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 14:31:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HEUIs1008577;
	Mon, 17 Aug 2026 14:31:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g2h6j63j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 14:31:38 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HEUIc5008526;
	Mon, 17 Aug 2026 14:31:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67HEVcKI009473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 14:31:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 4FCFA2211B; Mon, 17 Aug 2026 20:01:37 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 0/3] OpenSBI domain initialization order
Date: Mon, 17 Aug 2026 20:00:22 +0530
Message-ID: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: zUciKAmcbU8AZybWQrsb6623fZVk7Ot1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX4B87Om0SP4Zq
 TKSWluo78tX/IAN0jhHWH0g8zJyU/eSg7CaXfj0ZrmxyJGUM7h9W7srfvdj1Mu1a0taDPsT4TlH
 rLABHwkEEnLHVGmx9czTMl8PyucE6dY=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a831b4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=CblL6Wq_M1aQuw4AvX8A:9
X-Proofpoint-ORIG-GUID: zUciKAmcbU8AZybWQrsb6623fZVk7Ot1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExMSBTYWx0ZWRfX+abA2lzfncJp
 WCxNVeU4Gv2BB3rYGNnG0rZeYkCYKVmnazo+FOdVGJvErrS98Kb8mwPYV8kjgHVWRLcbwaJur7j
 dDiDLDPE/TfC3vwirs2qBfWpON6e5xnWy197gnTnxqAB/pgHS8C6DIbCBewqhFN04aQrNRPDZR+
 DLS7VVqVCFwSdZcOhT8cOeJEAMtIKrI9yt1R/oMG8JA/NGFA6JZKV5kij/bpQpJuZEFegT/whc0
 AJUWSuneUYQTsr5hZyDdbL4hqoj0Q0/YtP8cQKGx1SDYMGz9teNETm29+9ZukJ/c0TnwfqTCkjS
 /obXEwQurwTPAijYs9Zn13x5K72CVNfBdDfbTMtaIhfqM/1FXihzDLhqh5Fz+boicn7jtGa8Oyu
 V+4kDuquStidTSZMwLG6Y6aJ+S0o0RUad7/DJmwbtuZrQKDdz1rWJzalZED1ZJyF4LxJEFew+Zg
 /yKl2gVTnYXAVDRE4rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_073245_454685_263A26A1 
X-CRM114-Status: UNSURE (   8.98  )
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

These patches can also be found in sbi_domain_init_order_v2 branch
at: https://github.com/avpatel/opensbi.git

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

 docs/domain_support.md             |  25 ++++---
 include/sbi/sbi_domain.h           |   6 +-
 include/sbi_utils/fdt/fdt_domain.h |   3 +-
 lib/sbi/sbi_domain.c               |  45 ++++++++-----
 lib/sbi/sbi_domain_context.c       |  31 ++++++---
 lib/utils/fdt/fdt_domain.c         | 103 +++++------------------------
 6 files changed, 79 insertions(+), 134 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
