Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5800F4198B
	for <opensbi@archiver.kernel.org>; Wed, 15 Apr 2026 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L57wOndNs2h5DhOjl2q8GFKcei2ZI3elFjoQTlscpIw=; b=uSY8lsBl3/Ayb4
	og3QHiOJnA25V0e9KqYg37hV2YkhhE3oeOC5qHEozvBD+5I6LM1biENVrB1CMd5M0xgsgsGFl0ltN
	3E/GwkCm8FJRiCoIatrNoWToAv2Ed5KYO8mI61zH28klcyGZy+HluVv28gtXNU+Dev/uTReWEamGa
	uHebHI2LjiIFhMTIlhFN3rMMWe+sLjVJb5XT1Cog/5bJc/wK57H2/UW2fga9Cg82+TNe+0F+LhmL1
	jiQwfoFBhnGcRwqu2P3Ecwn8phrBnLednzBRInYyZ3t343ebUXD0Ie6qzYuldRuXZyFx8JgDd+mKb
	zmd0D6Ml51kvtW7ZJ9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxyf-000000010Sq-1Ca1;
	Wed, 15 Apr 2026 11:00:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxyc-000000010SL-3fz6
	for opensbi@lists.infradead.org;
	Wed, 15 Apr 2026 11:00:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9INhE1567113;
	Wed, 15 Apr 2026 11:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bs0IUSahtot
	IQAg/j+S+95SDWEMzb3uQiM1MQlBc+B0=; b=nq9m+dP0JSYeidjJ+kfpTJBQmHH
	lJA789OPIVNdOPBzmBSFfmHtJVU85zwyy3KmWF+9i18EcdTXb+Wi0qiGpgtvJlpg
	35YWl3EHv84VTAbMetW6smuF/Zb9a7leFYFGhTmAGmZJPtUu8rYXzlGbsG/J717S
	xKax2vCt3akdKSWlylOrWtP857YjohoVbqcfFbby/R7k/zWsBQ5+ygqC8N4gfiPc
	Lkv14SmgMh8rjKq8WsIVZI9Z2i2Hlnz1bMNYdD8joh+Xe45VwBMXBfz99saQGYeB
	WNokvWfSgoviYayzkGHu23xlG07f19pjC35Oyf5IpyfdO/rozjE1ifqVmwA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7wv0a65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63FB0383029581;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5d11e7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63FB03IS029548;
	Wed, 15 Apr 2026 11:00:03 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63FB03HT029530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 11:00:03 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D2FD321542; Wed, 15 Apr 2026 16:30:02 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 1/3] include: sbi: Add sbi_scratch_hartindex() macro
Date: Wed, 15 Apr 2026 16:30:00 +0530
Message-ID: <20260415110002.2610929-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: wEOLVIX9E15vEYAwHM0hHDKbqQrdpEOd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwMSBTYWx0ZWRfXyLFZR+0W9YS5
 FdX0m7oApcoHa5zlbBsZRMr+LQcYAivJBEmwGZyei03PNLln0dXP1gVASlNKnWX0g62ko+DtRTU
 2z/AzUj/opQDdiWsLfLCSCmXbt72Qe0V82i0Wp1h1b8H95hoptdBLiHHjJJPC1o3Tjt2oybKmvO
 oLa21r9oGe9IA0rJN6tgIHwaEi77X6Mi6xxp8IVwcz59l5FLzIMoQWTAm6GYl+xFLLc5IWkpYlC
 Qv5azXhovbylxH+5Hsa/E6TDUKjBPekJ81SpFDNOP7cveRaXkLMszFNwSsk0oCUgwXzbwb0FI7N
 xKWifosdFTZ2tLwXHXd/xy0DzzY7eF8qrOrb2BxOOUj53EI2553SAuiKI5QsIl/5fh6P/vUJYrA
 YsW8pgwtj/vwUPe3N3kxxuTNXfHwjJi8iqiHh0gzndUOWNFl6sHekcNDzLgbbvd9S46wmECFw6t
 VDAiDLUlSlq9ukeyh6w==
X-Authority-Analysis: v=2.4 cv=GYgnWwXL c=1 sm=1 tr=0 ts=69df6fb7 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=dKX0P6GNmAe_BcdMX9YA:9
X-Proofpoint-ORIG-GUID: wEOLVIX9E15vEYAwHM0hHDKbqQrdpEOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_040011_032267_7F4128D6 
X-CRM114-Status: GOOD (  10.78  )
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

Add helper macro to extract hart index from scratch pointer. This
can be used to check whether scratch pointer belongs to a particular
hart or not.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_scratch.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 58d54628..c12aa796 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -166,9 +166,11 @@ do {									\
 					= (__type)(__ptr);		\
 } while (0)
 
+/** Get the hart index of a particular sbi_scratch */
+#define sbi_scratch_hartindex(__scratch) ((__scratch)->hartindex)
+
 /** Get the hart index of the current hart */
-#define current_hartindex() \
-	(sbi_scratch_thishart_ptr()->hartindex)
+#define current_hartindex() sbi_scratch_hartindex(sbi_scratch_thishart_ptr())
 
 /** Number of harts managed by this OpenSBI instance */
 extern u32 sbi_scratch_hart_count;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
