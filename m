Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9437BFAD40F
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0l2PCt5TR9yMdNS0K/ZBTIWp+zELdvbsb4LAAagaeCg=; b=VBXSQj1rd2ZyO5
	jBB+wUSfbnHjG5eSkgEVfyL9uGZXjav182lkvfElH0waCYBJrS4JUlyzI7uQ3HMGzhbkHOthUWuay
	WtBn2aNPH6wMOn1890fShU+1OyXTV8fjqvKP4TUT/q5NHijDnyftt8oiuvdSSHfHpaigOOxO0PNu9
	I3GWYpgSOtYb4K5Mh/C4IqLdggl1YY/8M2Utf6bFTEmsqZn4Qs1rAPOUVTRnQq+rMPjFddGyIftD6
	I8Xx4pfAjFxCw9QZ7dTPfSb5hUw8QE168i0OuoyVpeTDb/ZwW76BJWPGaGtT9wpgws4apHjK+XMrF
	9a4c1rQrnewZcWU2CZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXc-0000000B3j6-3RfP;
	Thu, 23 Apr 2026 05:23:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXa-0000000B3iO-3PbG
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:23:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3HeFD3173113;
	Thu, 23 Apr 2026 05:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dSmeb8hslRP
	ak9h1rK8mZZGr3+ZmMysGtvwf0sAm7lo=; b=CzUg820MtxGp+K7JTJpZ4ilqfnR
	PduasGIzria5TARk6X3YuI93s6l6Sj9lwJ99jgPllyjFds9MCVz6p6f/VxpVLtER
	z9VZFCuWJHjxg9k0bLtyWYCgpkZodwlNBoyWs7QNxThjcGe6WoeddP00xWQlkZ4h
	rw6JZFNa+sjOl3tz65FtUMrvuf605GDAwpKSLrgEaQQEdgo4RAOS4q36bXM4/DsO
	3xpSoJUAcUjS3xTJw1ENZzxO5MpcpMDIkNI1/fz2vUu/unuCdPezjrwYez1oOOos
	g1gbAxRM+qiZvyGFcrg/2iHKs5k3unlTUjrMesdEdF8o5oM+8P9M6S8sP9w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m3283j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63N5NgWA007147;
	Thu, 23 Apr 2026 05:23:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dm31jyv1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63N5NftZ007122;
	Thu, 23 Apr 2026 05:23:41 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63N5Nfq6007116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:23:41 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id EEEC02146E; Thu, 23 Apr 2026 10:53:40 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 1/6] lib: sbi_irqchip: Check full range for existing handlers in sbi_irqchip_register_handler()
Date: Thu, 23 Apr 2026 10:53:34 +0530
Message-ID: <20260423052339.356900-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
References: <20260423052339.356900-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: l1deNhnrH_Wa2euu6ObDMqDinvmMWrtS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0NyBTYWx0ZWRfX+2PCJvkOqH+a
 Sywq06q//4/gp5WGsrQvbxk2MJJbHItADjMDNB2DaaVBCyRmeeS8Loq93w00rsmXn6QCj+waL/x
 Q2swIOMKdDbpdzLgAcEKFYTNbnN6LDFwbr9X5i3Ffm5BuHMBXXvtlz/1F/2l7Lt+FzJjk29Kwwj
 V2nzJCqkWEnjuLeUX/UGIE/Eb3usptIAvL0Z1kGaKC2mKUgqoGr5PXJS0T7m11nw+mDb15Yt9r3
 yYDYmq74tap0HC5B7mBKNOydiTx7el5f9DcBWJRAUfCbycel4yWTnf6GoyKSMPhTZRkoBazfkki
 Cq8m7nlf5Zkik9TQ1/ZILRR0LjAFtYlQiutebl7/aSnelca0O7twNbYdLMq4o6KIbAM5MxQ8DEP
 Bzp6sk850etRXP2JhGmanZcNnJiWPeopmd/na0BMOaaCxNnuqaxwWPWb96hCS2G/3GWifC3YlPf
 BK5UbDEABQJDdjxVESg==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e9ace1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=uvnXrKUwWFJ4GUwoRRsA:9
X-Proofpoint-GUID: l1deNhnrH_Wa2euu6ObDMqDinvmMWrtS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222354_875361_C81EBC90 
X-CRM114-Status: GOOD (  10.69  )
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

Currently, the sbi_irqchip_register_handler() only checks the first and the
last hardware interrupt for existing handlers which is buggy because there
may be existing handlers between the first and the last hardware interrupt.

Fixes: 0ab0c470d588 ("lib: sbi_irqchip: Allow registering interrupt handlers")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 lib/sbi/sbi_irqchip.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index f0744830..503958e1 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -149,12 +149,11 @@ int sbi_irqchip_register_handler(struct sbi_irqchip_device *chip,
 	    chip->num_hwirq <= (first_hwirq + num_hwirq - 1))
 		return SBI_EBAD_RANGE;
 
-	h = sbi_irqchip_find_handler(chip, first_hwirq);
-	if (h)
-		return SBI_EALREADY;
-	h = sbi_irqchip_find_handler(chip, first_hwirq + num_hwirq - 1);
-	if (h)
-		return SBI_EALREADY;
+	for (i = first_hwirq; i < (first_hwirq + num_hwirq); i++) {
+		h = sbi_irqchip_find_handler(chip, i);
+		if (h)
+			return SBI_EALREADY;
+	}
 
 	h = sbi_zalloc(sizeof(*h));
 	if (!h)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
