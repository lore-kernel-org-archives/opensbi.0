Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC5ECD98C5
	for <opensbi@archiver.kernel.org>; Sat, 13 Jun 2026 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dbtQ//Jv2u6x8MNuCBoPCI+XCGEPnVBm+dN82+giF+8=; b=ISMwAB6pICz5kM
	ufvzepHKyWhiqkgHdT+0vczN/jbpxlb1bKGWA5abdo6xwXZr3GuY5odpHFntE9hypkwyw/eJLF1Bb
	iJ6Ag6RWTB96eWZAKSFmrbFAdw2gK8N5JCB1ay9sEIxC/Dnhjk2erQE2RpfWGD/zZY2WlLyvxdbxb
	GosV+ud8cZRRkohdiVJWgI/JXHDK2BA3hTWyRphqOZNjJxZgnxQbSdA3YmtyAfO3+uuT4TlH89eVU
	5Fq0ZjW1Q1etEOn1I7B614WQm4K0aapnMSL0xl77kIEpRPO2JPqJYVGKNHJp5RO0dFZCYq5v9vTAJ
	l3ofckmBDYiorwvhO70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOJD-0000000CJwk-2hXG;
	Sat, 13 Jun 2026 13:21:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOJB-0000000CJwB-2IWB
	for opensbi@lists.infradead.org;
	Sat, 13 Jun 2026 13:21:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DB0XtQ2720216;
	Sat, 13 Jun 2026 13:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rAgLAzDAzFo/TxDm9Aa2pRQtMKdifkgPziJ
	NKs47XfA=; b=Dy0h4cL9OI7AuCDV51iHc1HGHOjy/nby9QzF5D/vRuTQ03GHP7A
	GO6lmkksRtil1V41DVqF+Ae57+xiqa+16ffcZoHxWtdbamtxD3lvIl5DzSX/gBih
	Ra5muTjQcsgnvsMPKho68U4iOZSbIVTnlpPruR8hR+0XJUMqo/IJBzaKbWEAC7CX
	8NYIbchJtFz3/n32T+2NxaV5mAZpCe1TWtJOUitqGdvVnzEpwPusy4Kczx217cQ7
	Kr45Dwg9OMgh00JFvQmc9QdD8nFE5lUNhcX3eZAVMa4OaxV4WZk0o71C/oiYw5mO
	wzEl/C/SFWZj/7jSQ+onY4qS/BokeaWqtZg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u147s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65DDLV61013500;
	Sat, 13 Jun 2026 13:21:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4es09hd8xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:31 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65DDLUxB013486;
	Sat, 13 Jun 2026 13:21:31 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65DDLUfD013483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 13:21:30 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 2499E21AF4; Sat, 13 Jun 2026 18:51:30 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Vivian Wang <wangruikang@iscas.ac.cn>,
        Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
        Bo Gan <ganboing@gmail.com>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/2] Address vector misalgined load/store stack issues
Date: Sat, 13 Jun 2026 18:51:27 +0530
Message-ID: <20260613132129.2135128-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2d595e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=mtBIN3TT_JMJfRMJ0VgA:9
X-Proofpoint-GUID: hfz0hoNP6LPasbj5fu1iw-t2t28b7TaD
X-Proofpoint-ORIG-GUID: hfz0hoNP6LPasbj5fu1iw-t2t28b7TaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDEzNiBTYWx0ZWRfXxXQ5QBGfAANb
 YFvBAg0EsD9wckJ8PKfKpIK5MHpYH1Dty/JlOlEH0o1PFnqFBm6WXwzvXywLLyVxx8Ud8T+XALJ
 dWatr871ViIqdHsYi0A7Tz+UbvXjtaBnDg8YBsZvJYesTZu8Vtfej97aZoBqJFtZaeV080JkhR4
 7wRA6Lo9oONM/QLgRIRUunsMpPxi8sF6LbP1cRZmVoEonS2TKyoFXvt+IKulXaPKz1ZSL3908eY
 t+hFmMmF27iq62jUqFzskTR6FLB27gj6MYgeuWw3G5U8rR5lpjTTJD5DCHfPLElXqw5tJGMkqUy
 jt1OAgtcjTbZQH8/dsVvH74pizTUUJqf5tNd3qQiBhIuASKP5lMGgMZIpEq1kiaSN1G3sSnVlSR
 4sRa6hMD4D7bt3o/YS7XC6UwAm28az4IShO18cFHJmcNm9nMlNNBWPQFxcDzxNVkcaJRbQZNfpd
 w6yr6SfpaQtXTcs8JUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDEzNiBTYWx0ZWRfXxDhGiwqlshQB
 hz/8KpdYhw8WocTMzMTwyoML193m8s71exs+q6RvJKt+2wPeeUD1xxOnsqGZ6KuTx6EXCvbSFGF
 qgeoa0Jv4RDgAdF7aQur7U8hIy9uJIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_062157_705279_0D3B7657 
X-CRM114-Status: UNSURE (   8.07  )
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

The vector misaligned load/store emulation requires mask[] of 8192
bytes which cause stack corruptions since default stack size is also
8192 bytes. This series tries to address it.

These patches can also be found in misaligned_ldst_v_stack_imp_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (2):
  lib: sbi: Move trap delegation setup to sbi_trap.c
  lib: sbi: Reduce stack usage of vector misaligned load/store emulation

 include/sbi/sbi_trap.h      |  2 ++
 include/sbi/sbi_trap_ldst.h |  2 ++
 lib/sbi/sbi_hart.c          | 46 ----------------------------
 lib/sbi/sbi_init.c          |  8 +++++
 lib/sbi/sbi_trap.c          | 55 +++++++++++++++++++++++++++++++++
 lib/sbi/sbi_trap_v_ldst.c   | 61 +++++++++++++++++++++++++++++++++++--
 6 files changed, 125 insertions(+), 49 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
