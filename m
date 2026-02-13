Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DEFEF48D3
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 05:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UL3glsHKSU3IfxKEilEQ7YkZVhbpWS7AuOA0qMNc8SM=; b=NYy1FXjuolfp61
	0vxgZmf68JpHJApOLpnjEvbLtHzp3aOP5mb0SihfRhEIqwtJlTBfx/swPzGcxCdNwQyVCZUi0ustg
	/dYRnx0xlvQkl2aSgyJUJbgyyyLYJYM2ESKnsPmoEPyVaGE7EHyrhMZ0m5LplkJ2CqB3NHWcdqCzx
	MOGhnf2qXag1gjX7k7/nhI7rvhXbyhYZ2mf2AvAZQ9r/4NaiEjEn3+XAmxxr1J5+ii2RO0oex2zyK
	kRPwklfapVXdjRcg8YgBkNpyfxU3xDopGZtgEnzZUbssPPQZe+jPfiVZznRGgGOovLrqP/IqMpjyq
	0uNaKapB9L4s4cTCE4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7q-0000000322f-0uOI;
	Fri, 13 Feb 2026 05:53:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqm7o-00000003225-0kS3
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 05:53:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLTWYx1642266;
	Fri, 13 Feb 2026 05:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MsYK3GtBpny
	4Nsaz3nGOf13MM8HysfNjDb1CzBHYdSI=; b=KJzAMGQtAKIBHtC4i/+jrbCDP/a
	fyvbXdbo5lS/cmOjnDKbnBWTxyMABapLf6OQyto1S2cuNsfWXqvzGdwDgjUOXEWZ
	a7QkBJS5eZ3D5SrgVtbfQDuA7wyOdXjgLSUYfklkICdJaOl/bGR2hH/1quc6k/jO
	49QsA3bLlsvZpOL7DqBVK9/1c9WIvH3WwACzVM/5iTBCMsN33z3ZrASYVV0SasiW
	CqDRHjVvHhc9b+xwAU7HYq6ZUBJ0/r9r0Z5ZMz43IZkOUzqgvh0qdmvtbLAVmrNF
	qO7JREyBtijCVs+oPQR+cecrjZSwsMb6Lvjf8Eeb9Sv1nGMsV8awQXuFrcw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ptv1efv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61D5rhp3006114;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c5xfn97kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61D5rhdB006089;
	Fri, 13 Feb 2026 05:53:43 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61D5rhm1006081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 05:53:43 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id CDF68249BC; Fri, 13 Feb 2026 11:23:42 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 3/8] lib: utils/irqchip: Fix context_map init in irqchip_plic_update_context_map()
Date: Fri, 13 Feb 2026 11:23:37 +0530
Message-ID: <20260213055342.3124872-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
References: <20260213055342.3124872-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: A0HXp-S3qs0d5FvR2Clx3PM9qUvkOeFL
X-Authority-Analysis: v=2.4 cv=eaowvrEH c=1 sm=1 tr=0 ts=698ebc6a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=KwGMMZOPHlQ5tBqmZvAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MiBTYWx0ZWRfX8H0/2nZk5cB2
 OLs310hJsegHKOdJ6jzBuXGHiP0Cf07eb1bpVxVJBi42uG709zAVWkqODGUU1mMFlOrS0T8a8Qf
 enCcN3B5bYY25Ljb2pT+RjxsJZN3QzYIqAU7qgWP2XHynjX/ZH43UIU6VhIHV99gd/sdy1z5gFD
 w75oOedQNC36YFeUqBR/d8cohGUg0jwCapZUD7Lku4sV4H3tqz4DIF+2n8vUGPKz6HfAJVqSxnO
 LxosyPW8dGBX5Uglew5SmBayx2G+XAE+l9frekzuuN02ui3arQx5A4kxry+CUSu2LfX6lKWAR0o
 ++cushgM/Gn+ljInOMOJI5eNE4prUqpNTmOevqKDq5+cLKitp76xcWVd0L4VQcGN8hxJ9NFPU1J
 QiIuZdMmb3o+g7Yqo9Hq2uWp1dFOGR7MRxI9CyOPFf+u6u8iZyy6qBU3nXcL9cwQp39YYicGo/Z
 vkjcW7U3EMlaWyrAxAA==
X-Proofpoint-ORIG-GUID: A0HXp-S3qs0d5FvR2Clx3PM9qUvkOeFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_215356_222021_8C8C2082 
X-CRM114-Status: GOOD (  11.48  )
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

The context_map[][] elements should be initialized with negative
value so that context_map does not point to anything for non-existent
PLIC contexts.

Fixes: 69448a079065 ("lib: utils/irqchip: plic: Provide a hartindex to context map")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/utils/irqchip/fdt_irqchip_plic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 65a9de15..61c68ac9 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -24,6 +24,11 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
 	u32 phandle, hwirq, hartid, hartindex;
 	int i, err, count, cpu_offset, cpu_intc_offset;
 
+	for (i = 0; i < sbi_hart_count(); i++) {
+		pd->context_map[i][PLIC_M_CONTEXT] = -1;
+		pd->context_map[i][PLIC_S_CONTEXT] = -1;
+	}
+
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
 	if (!val || count < sizeof(fdt32_t))
 		return SBI_EINVAL;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
