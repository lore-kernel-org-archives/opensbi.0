Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE02C4451F
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/vqE0jb4RFKokYSn4o/HAbhZ3FmoBXof1SZtg0JuO0=; b=RU/nc33Y+rhhon
	SQAewkHOr6/prF7vIge7yjEAUH5SxbFY8jD8/EiikweA4crX/YSms8UhIZfZpgZSSeh3bGVCJ7eDV
	loOPaBL1+HQm0t9h36m8b1CmiIB2o23NLtQL4jREm5gh5Gk9e4rjZNIDIScPcIk1YCbSfTPNPtsUm
	8MZ9NWJI3DB+ZARg7fg8mozzDmsWhiPoNCWXzTvQRIcbqKSOg4XdlAtyCLxk5eMvuYUXaaXeMbiLt
	Tayev/7rEWz35kCxxWdzXseBeok3YmiRT5yaQjlvaukmxDnYQChPnDL1f625RtBigjSRYRYmee/0p
	/mukq00yKx2BHbldYMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFE-00000001UgZ-3n9N;
	Fri, 17 Jul 2026 07:44:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdF9-00000001Uds-1PcL
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 07:44:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cFZE1160804;
	Fri, 17 Jul 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=twN9bFmomug
	Ag3B7nLpdKC5JbGnL9g6SN4mS/N2CQfo=; b=X74VXQLD0tDqa7JcM+/+boZowKk
	49+CBNzE/Zeyb12tQ5WKXGEc/X9BRDaiH1dgdt6A3IpDmUxyoFhIp71eGcAdkW+I
	K1M7LgTf8/xtZuNFdeOfAYcT4nvqX7k7taKHgP0gQ1NvvI2hl3JOP4NROuupMuSc
	W3IeEqaVmKNEqfUPG/Opn+DHSatt3nxZ7lcOemLA2nddufqxJdjkipEAKiZN2jvv
	cjgxZ5s2aGex3OpPVp8DwosVEOOfB4v5pLPZtqrT98un3n6AKI71L0sjHgih/DUb
	P2KbPmQTe3dFqpMmkHtMSp7NuPaDQwdJTlR36UnmGPqwdhIzX8F4u4H3egQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3arr8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66H7iEdU015892;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewm32q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66H7iE5v015867;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66H7iESE015859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BAF9821C7E; Fri, 17 Jul 2026 13:14:13 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 1/5] lib: sbi: Fix typos related to hart protection
Date: Fri, 17 Jul 2026 13:14:09 +0530
Message-ID: <20260717074413.2536416-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX8PFNYKP1YHgQ
 40YjhvCLBeLJ1J41zEMJlmNzoq70btgl9rPzcDB6lsfOVPg5k7QsZX3iHf56Zlyd8RYhYQQeWEl
 rIxXliYIA1lDg6r1Br3QBRNVaBt2KeQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX9LDijbG1Yxb0
 LP48RqLC42pH+b5QGO2+xbLekZkhiF6dpGcwA+/EmZYFR9LAnUpYhZ7xlWCso318NwyqhqdIGLZ
 J7Lp/gv1GOKsr0pOHH8q9nY0gesmziV7SYgczarncjeXdCYLuKVDHW6gfv/SosP53VlmH3e/mtS
 h3qcGGPj2YuYXsCM5pIbchprX5HsUADCllrdaZi4+8N25R4Qlo/kce9tRWLu3BT89HrqcEAt8cn
 kpf6NKy/+1Um/CK2jRYg2vrJ1SqynIl+TOMwZR6z0xaRD1yfjkX/xMRyljeb5NWTDhQ62JbDv8Z
 /NJEuulvlxNcQav/+c5Jzmhz1he1lPLbtGR0b7tOnbXg+ln3s63/ppoHik2GQb4c6D5rsksVipg
 hG9LTxB0fwJjfS+j6NLqaxm+6IKSYgvcilWhjXuu63PiYd7pqk3euefhKbBz9FPHFW5WCGzfvfV
 wy/aMxg6R73Mj4Ic1Zg==
X-Proofpoint-GUID: caGL_1Y84fiW10RBa32JZlaP5qVEjQNO
X-Proofpoint-ORIG-GUID: caGL_1Y84fiW10RBa32JZlaP5qVEjQNO
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59dd52 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=Jgr15qjBWqoaIRDPcTsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_004423_381637_2DF50238 
X-CRM114-Status: GOOD (  11.19  )
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

The hart protection is incorrectly mentioned as hart isolation
at few places in sbi_init.c hence fix these typos.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/sbi/sbi_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 658fe37f..4208db0b 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -428,12 +428,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	}
 
 	/*
-	 * Configure hart isolation at last because if SMEPMP is,
+	 * Configure hart protection at last because if SMEPMP is,
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
 	rc = sbi_hart_protection_configure(scratch);
 	if (rc) {
-		sbi_printf("%s: hart isolation configure failed (error %d)\n",
+		sbi_printf("%s: hart protection configure failed (error %d)\n",
 			   __func__, rc);
 		sbi_hart_hang();
 	}
@@ -507,7 +507,7 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 		sbi_hart_hang();
 
 	/*
-	 * Configure hart isolation at last because if SMEPMP is,
+	 * Configure hart protection at last because if SMEPMP is,
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
 	rc = sbi_hart_protection_configure(scratch);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
