Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EC5C54EFC
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 04:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVXx3IkbbhBraD0FQLoKiEyGAU/kpQxoh5TxgszdoRI=; b=HJr16vahgjoQue
	a8ZtC9aE4Gv/QIfr69iVsyMKIaZuoiWwB5Zrmfqvbobqd745F+298NFiP3TmGXVCLonPz2R1DI+Qj
	ilDAoLrhuJqBd0G+NJNWiMQW4i0JIKKQbxXBM54tIh1hD+dKgPj+1hALX9Z8w6DGP+N7CIXPDGA4F
	j+ZUot1d/lJrWzVmQsX1uTH0TQeQmpSouFuSI6Ywwii+w/wDQ3MR3FLjCPji/QFqYdjNco+KrvrI/
	VNmj/HuB70lNg544RyyRQ1L0Fw+y/nbFO/A7fr5bDKlfMU6RytRI1C1+0X/AVbKB7JlmcvwI85z1B
	VbHfKppOFHdcUP8/11mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCty-00000001vc2-2r5t;
	Mon, 27 Jul 2026 04:25:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCtu-00000001vZI-1GJz
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 04:25:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g3GA2467067;
	Mon, 27 Jul 2026 04:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TViRISa94gh
	zKydmhHkqv96+YbbBiADg6BnwFC9SJGE=; b=WhCURxEDle0rh3zZ2HMdaywN8v5
	bvXQWZWr8s1/qaaMANWMjc0LhV/oAYjaCE2UNZHuHgw8+W/yVWbtiMQQXv+c4ZuF
	8Hi9AG5L/G0Yi5m2YIsTnXyvCSv8gbVBSYxYzE8T474Wy858+tLaxAtwG8RA8I9F
	IU6BRMbHPy/xbxHjKV08n4VjotV3e1GIoAVDQSA+kaY/vE+gVPFemuHg98JyMnEb
	uGOuTJ85sJn0rRx/Sm+HeuGQboxBw1LCUQ3GdlLHn9hnxc1V+8AQMdwPrTTx0+B7
	KuptfLPOnngUydcEzE4sEkaXV9pQqImk0x91Ly4gecKpe4VIGvGhphTbGtQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574n2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66R4P6mc020038;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fmp7hjd8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66R4P64T020017;
	Mon, 27 Jul 2026 04:25:06 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66R4P6F0020012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 04:25:06 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id A78CB21A4A; Mon, 27 Jul 2026 09:55:05 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [PATCH v2 1/5] lib: sbi: Fix typos related to hart protection
Date: Mon, 27 Jul 2026 09:55:00 +0530
Message-ID: <20260727042504.1743250-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfXxNTlu4JI5uFM
 qS/xnXdAV2gZdIEEQJJHgd8/fxGFKw4NVKy1rzD3l1fOfQVA4hy9U2EpZWSovH7+IiuvgctIAv4
 bzAYPuduq5EXbyPAVJnJnMyJNvoKvsE=
X-Proofpoint-GUID: OtBeBWsv6Art0AyK8WjhqVaiaJMyvJ7a
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66dda6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=Jgr15qjBWqoaIRDPcTsA:9
X-Proofpoint-ORIG-GUID: OtBeBWsv6Art0AyK8WjhqVaiaJMyvJ7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MCBTYWx0ZWRfXwTuOo5Ac4EUF
 takmsagbaQGyFaCZjAjiJZiuAqKgLum5lREyfJ4wiTDoM7iiTlgJY3onGCETUitv0luJv6DpeU5
 hBMyKVNoTTUTHIEiHXB5HQ1YuwA2YuL6ztWHY2G4lLSA0m9OR3lu/08Fqc7MbQPAU6VrdZbmw1Q
 Qk8w+ZUs4AmGk/sqcp/8nZxGj7YKyzau0bw7qPQVnhmr5RLPJgPK1LKLFjkifEZZK0CHaebYVwG
 ClN+qqmsao9xBVw1zgLpf9dhCLBzs8MekTD5DreG3Iv9irV+EjuAGFoXjxZeE4XBUPfHbfqUgUU
 1pz6ULDkSX72lO0AhHomSBnTMr0nSB32CLWNHRNO0lhuExpmf/6CPVV62GBBETxo/vpDrNsaS2a
 UP/76RmGQA5WF0QKDhC/K9ZwQCKcJ4D1r0YMaZHA1pTbijTTEqtQZgYShevu0OCCW8N4EoyoFHo
 8gXFT0s8MX6IPFbPYgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212514_454531_DC4E929F 
X-CRM114-Status: GOOD (  12.42  )
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
Reviewed-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/sbi/sbi_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 9bb1a37e..d4aca242 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -432,12 +432,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 	}
 
 	/*
-	 * Configure hart isolation at last because if SMEPMP is,
+	 * Configure hart protection at last because if SMEPMP is
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
 	rc = sbi_hart_protection_configure(scratch);
 	if (rc) {
-		sbi_printf("%s: hart isolation configure failed (error %d)\n",
+		sbi_printf("%s: hart protection configure failed (error %d)\n",
 			   __func__, rc);
 		sbi_hart_hang();
 	}
@@ -515,7 +515,7 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 		sbi_hart_hang();
 
 	/*
-	 * Configure hart isolation at last because if SMEPMP is,
+	 * Configure hart protection at last because if SMEPMP is
 	 * detected, M-mode access to the S/U space will be rescinded.
 	 */
 	rc = sbi_hart_protection_configure(scratch);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
