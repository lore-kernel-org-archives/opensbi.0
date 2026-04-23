Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BAFFAD40D
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uraWXqCbkNvxs5QsvYroxx3WOASTWQCEfehHBSOnVWQ=; b=UWLs/JyALasFoB
	5Hx/hY47zrUAk/s8b/53f7Lt75P7FvwoN9I0ouC4zX7M9cgfYQ4vpG10/b9x7o6GKSNX5O9Op/Nk0
	gssW7cKp+nXrVMrxIkkBYsXWZ/eQkmOH7hYydYsbLZc84usTseVMfsmPQoMz/+Skp6FXrIbaxf75J
	tZ7krAzu7fldA+4zvy7+O6F4lluN4U97m0rtVBBVRtBqLT+2UGcBdCf5ahYnIqTKxmgIEC00yJnaq
	wngfWVa+mUQFdPT1UE5lYil6ILehkBrpXlJ5ngAIfE+/Zw2EYgiYbNesS+yP36NKsBmaaoRl9V80a
	tZDnuqDYMkeEJSRSuXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXZ-0000000B3iH-2Iby;
	Thu, 23 Apr 2026 05:23:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXW-0000000B3hw-3PhT
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:23:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3VG551587834;
	Thu, 23 Apr 2026 05:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fkJzGoh1Kp1
	M2NHTOstIhYyYwIwMnJR7A3Wp0EDtVbo=; b=lDzFo5nA3X0qhLa4DmYjhHXUGG7
	Ju8EJLEmzQm7YLInZhC3RhHI6QjrICbadQY6PyCEDyNYNrYcLf5d5fRsfMqeScJl
	00195r1bZOnswy62crvCXiwCj5NcNkebP9NUa8ArtZQ5GxNSbGBZtToqlJdL0b26
	9G9p7SUKNg8NX9Tia5gvbyNwOsYxDOuXGCdL4Sq5TPZ93jxoiH3DyXfHMT6uCZBo
	5IOJQW9L6mLkEEyipPOnGKABiwF0tjdnpNfr+XR4bCy5IfDuKH7mycVLNd2LUmGz
	leeKneRlfJPNL1Sx6Nt+VwBwRcmTSxiHiRI+09/laLYvVtX6Gon/S9IqM3g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq28kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N5NgIh007148;
	Thu, 23 Apr 2026 05:23:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31jyv1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N5NfvE007120;
	Thu, 23 Apr 2026 05:23:41 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N5NfsA007115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:41 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id F2A08222E4; Thu, 23 Apr 2026 10:53:40 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 2/6] lib: sbi_irqchip: Keep the handler list in sorted order for irqchip
Date: Thu, 23 Apr 2026 10:53:35 +0530
Message-ID: <20260423052339.356900-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
References: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NyBTYWx0ZWRfX3sZA5iRCCyab
 deoNgco2tdDVUM3AStIelISyDRZn30IiCIvXqW/Za+oqf4bmVgBy/eQrVwZnSo7aaJzHUkXUx8c
 Mxfmc25JTIWOoLm5yYessaZKV8kRD8KbUAC3Dat0pJT3fL7WPmt2pAzY0xKbvrKmpf9GWnDbxRK
 dC7qQCyetb4ANPwnD5xflRH9aJb/5uWFh03erx60I2zwtoIt/mh0LPqu0Ni4eLkstaOwWcosSXG
 W5DTI3fnQEbrGAywXIwfxEDEoVQg5ffTjuXcrwQgrZY9sIep7l1XbwC/EmFfLloTEeTl9/OTLew
 5oe/Xj1RW8kyt/qPjPgS+rWASLJ6RgWIeeZzTTH6JWuDg+yUKp7CGxPIP7LdL9xlwz3Qnjoizc/
 mICIV++9RIk2ltCw1v8dWAb1wDEerj4PXZiAmpkHGt6N8FUDR5U7CrNjZ/Q/drFegB8G6fbAlyj
 D/XcSPJX1rMMy4ZrS5g==
X-Proofpoint-ORIG-GUID: lOBK3yq1pAJYSfCDnav6ZjITy9gSVI1l
X-Proofpoint-GUID: lOBK3yq1pAJYSfCDnav6ZjITy9gSVI1l
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e9ace1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=DHE891H7Gske2VlohvUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222350_971037_7E7A6449 
X-CRM114-Status: GOOD (  12.62  )
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

Let's keep the handler list in sorted order for irqchip so that
it is easier to allocate unused hardware interrupts based on the
sorted list.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/sbi/sbi_irqchip.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 503958e1..f9e2eb5a 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -139,7 +139,7 @@ int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 				 u32 first_hwirq, u32 num_hwirq,
 				 int (*callback)(u32 hwirq, void *opaque), void *priv)
 {
-	struct sbi_irqchip_handler *h;
+	struct sbi_irqchip_handler *h, *th, *nh;
 	u32 i, j;
 	int rc;
 
@@ -162,7 +162,18 @@ int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 	h->num_hwirq = num_hwirq;
 	h->callback = callback;
 	h->priv = priv;
-	sbi_list_add_tail(&h->node, &chip->handler_list);
+
+	nh = NULL;
+	sbi_list_for_each_entry(th, &chip->handler_list, node) {
+		if (h->first_hwirq < th->first_hwirq) {
+			nh = th;
+			break;
+		}
+	}
+	if (nh)
+		sbi_list_add(&h->node, &nh->node);
+	else
+		sbi_list_add_tail(&h->node, &chip->handler_list);
 
 	if (chip->hwirq_setup) {
 		for (i = 0; i < h->num_hwirq; i++) {
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
