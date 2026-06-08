Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF4ACD8C9D
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 12:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNGcnGueyWsVV9HtPBczcX38WT2fi6Uo9+GUbdh3WH8=; b=XB7Vm7aEh1vAMI
	zkQ97mwnslbX8MCWkKodJ8BtADfw4uJop9rKunKGLx3qOokt/0SWsSWP9eCGFxEOczSbVuFxwZSM9
	Ds4oAcVD4zJpfdr15TZwPapiFF5aCSvNjQ0Uu41fbiV5u6IpwRcqx4htuMCisuGj+dtToLuw5Fw8k
	HmTbl3hi9orVynuwiPga8I6EMqu4bljbHU9E43MzXp8c8DCgZtYHmW4gvBZ27nADfB5gCT4GTeJMm
	S5gDeS3DsmMCIepjbHIiP58FB6OWdpaH6Zx4GLReeyTerHKxS3Q1Iesmte+olqyWVit0eNQvuO538
	TZfK+/Gee65niLXDAdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTu-00000003XvC-0GVg;
	Mon, 08 Jun 2026 12:53:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTr-00000003Xtj-3rNv
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 12:53:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658CThan3658215;
	Mon, 8 Jun 2026 12:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E9BJQveparn
	Jkj6zVRgizdhDmUhI7Ib8XfK3CwaTAoY=; b=ag5QmgAJ3L2n7j0jpPx40tswxGn
	IO0i2sbBOe/QifO50cGJyVv5OlVa8armBKlCiveGRRaRIXlU4jJghGkm1eayZauW
	HIG4MbNNZQjROlatK0QJ7m8VEBgwJ5Z0idPdcJM8L6i8jUIi02AEHrEByqRB1gzg
	2QCMks8rgDJVUQZVCvrqWv4FfVRw5KacfW1Ea/474Jf0N90kliUEujfqAgBc8Xyl
	ssmlYFpCs921dKyLhStQMKd7+TGLiuVbTqhWmqoLoUIzRPGl1y/nM4LU2Ll21G2H
	rUAVgxzILtS++cjfFEdU+V2X4oOCaFYf73fS7djv/p1VtgqIP/DfCVPbEdQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsv8367-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 658CrILH018168;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmj8fsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 658CrIf2018145;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 658CrIk7018137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1D7A422944; Mon,  8 Jun 2026 18:23:17 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        "David E. Garcia Porras" <david.garcia@aheadcomputing.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 4/4] include: sbi: Add SBI MPXY notification related defines
Date: Mon,  8 Jun 2026 18:22:56 +0530
Message-ID: <20260608125257.3220114-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
References: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: RnNKV3jlFV_rGYRZUhzMLgj7Fj7Z7ITL
X-Proofpoint-ORIG-GUID: RnNKV3jlFV_rGYRZUhzMLgj7Fj7Z7ITL
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a26bb41 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=mlbbMAg2AAAA:8 a=EUspDBNiAAAA:8
 a=00y4juxpSN1CxcrQzt4A:9 a=MVgJjSScqoDYXLft4fpg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMiBTYWx0ZWRfX8mLLZNQTC8X4
 2jAcI0AhpDfUpWwn//wrpC3iWTVHiRrsMzhHwrv9z63aeDLhhV7hUmwzkvW/MnGBes6Rl1nqA5P
 8ptUkEGcczurCJhDXEnuvhLb3HkYHeVRPCaAJBnGbO40bFEW8tf/cMnO1jn3idM78qfgYtgQ0uN
 X08ligXUlI0cjkT/BYaiH2ZOdg6SMJfPUvxV0QgV6K0QlbPAi6cvkkxKBocSk2G1ttZG6ZEi4MA
 wh9OzQH727P5e6CRmCtQxxzF7P76EB6IJyboxCQBtX31kLDA37Jo/hzZ/CeEE498PdG7mN+vwO3
 jGP3wpTIQlHA3aOOUb0JCClzFh9l8KhS4O6bQF6HDGeh3XjzWOAmKvmWdTNjUudrzn6uUrmmFG+
 7Vr3ktzKHrIMMFJk+49EQ6SwRjDiVIg2HqRpl3Tq9d1wHwqHwIm4lStE3pB9iG3lxpkdsSSNmWv
 9hEfZRmjugUCiSXP87A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_055328_170728_977ACCA0 
X-CRM114-Status: GOOD (  10.08  )
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

From: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>

The SBI MPXY notification header related offsets are missing from the
sbi_ecall_interface.h hence add these defines.

Signed-off-by: David E. Garcia Porras <david.garcia@aheadcomputing.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_ecall_interface.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index 9a776f79..acb91a01 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -469,6 +469,15 @@ enum sbi_sse_state {
 #define SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP	0x6
 #define SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS	0x7
 
+/** SBI MPXY notification header size */
+#define SBI_MPXY_NOTIF_HDR_SIZE			16
+
+/** SBI MPXY notification header offsets */
+#define SBI_MPXY_NOTIF_HDR_REMAINING_OFFSET	0x00
+#define SBI_MPXY_NOTIF_HDR_RETURNED_OFFSET	0x04
+#define SBI_MPXY_NOTIF_HDR_LOST_OFFSET		0x08
+#define SBI_MPXY_NOTIF_HDR_RESERVED_OFFSET	0x0C
+
 /* SBI base specification related macros */
 #define SBI_SPEC_VERSION_MAJOR_OFFSET		24
 #define SBI_SPEC_VERSION_MAJOR_MASK		0x7f
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
