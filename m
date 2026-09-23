Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CE6C98306
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 03:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tiHMSMCZHufmlPL7ZZ3/v4cczSmeTb5NL1bCNYF6FDg=; b=tVdQppvHnPBthW
	2uaB1uw4Bhtu+yN+iKSnSQGiMRimRguEhCEwz1EMScZKe2hPqsi/dkg8YJZMluVDQ43GHb+epz4Lo
	JT9qvII2fVmMpkPZ6Zw46HoC95WR+7OUjECQuKcGAAu6OCVbnHFPXyO4VSqVO4MCjyWaJ39fGSIbO
	OuOPbTEJAea0lwNhnA2vcojfzeVN/MRoNOrx4EgAXZSp4libAbQ921o/IypCrHnNTcyjgRVL7ibcs
	Rqa1rdAF1fcvhviASyZt05axiDovslV71oHrSew7mZUP4jrFHacTzkfWWp54c9UVvjOUtH0EqFUXL
	5Hy5ZAQcdfXt+HBf7Wdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dah-0000000722l-0X4t;
	Wed, 23 Sep 2026 03:24:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Dac-000000071zo-2EXa
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 03:24:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6xBa2033234;
	Wed, 23 Sep 2026 03:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+0BQdrG20XO
	NuWXg1ttBLRXctHHjMNGFmFh8D2Q4UnA=; b=BwNhwAW7GDeviHFXtiV61gZzcPJ
	qTAgorqgJjleWcMGD3rgFQJgYTIbfNm80l85+8IiyGessJjRPiqxUvgJtowzGdHZ
	Xd7fL6OJptF4fW2HplaNz+cr+vLyrzrsnI9ZlC3QnvBDzoE87oAiYAvVePNLdYRd
	aklNRjnI4PiROkIMu13unJyYEaxXxXWWCcuQfPBYnTVm3+3BmWOx2VSOGNQ2w0qC
	iTu3fM2Bmru7QxIas7KsQoOPi0Gh27f+UaOSG8v74LiHdEAX7MrukE1CRgKYMlwz
	9pzZCPTh4Gtyq9h6uJ3vlKMc6Egooi8p3yQavb9msZQt74jeH+1WhzpfUdA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c27qt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3O2wB015896;
	Wed, 23 Sep 2026 03:24:02 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N3O1QD015847
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:24:01 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0ED0F248F7; Wed, 23 Sep 2026 08:54:01 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 04/11] lib: sbi_domain: Introduce sbi_domain_find_by_name() function
Date: Wed, 23 Sep 2026 08:53:52 +0530
Message-ID: <20260923032359.4041876-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX8MX3R5XpAKy2
 sRhRoJ5076eSl02XFo8GiZh5FPcyNtrnVSEUCOOZpvSO62hBMLVYjlIdqrvThTqg0A6o+6kkDzZ
 86myb4Qfmqqx3H0mJJrRz7XO7U1+lFP7vyJpez6EVTZ3Af5S2G7FewaA02iPO+l07YNmotuULPh
 3gbRjGE13qHzZ2KjyM/BLlx01zMjYIAVis2+PJL8haDaHekXXmEGIYUeHDQkawj14Ey/dogLrXx
 o7+sSoDqp7uTpSIyISO6gnt8Dph+H7xd+dRPuqwgAi5tU3vgH75hlsz651nzmR8WSJPcRYtD+oK
 WC0InhnpY9iL0RBpg6r+GKxU32vtp+eSh6YkrMwVPLh2BoMz6tRLz7oTkqoHisn9HlNhaxYh3Cw
 b3FzFLUwM6IcSN5SDWcQehLzhiUeDMb9NgZtUt9XBpDa73IGCYuGukwthSQedvUvn4ncvZzrRzq
 x7mvZiIjOTg11XVDYww==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab34655 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=WUJfmSRJ23pjHjXAEBAA:9
X-Proofpoint-ORIG-GUID: yrSC-t1z72X9YdGasHYKovSVXh6uuhnN
X-Proofpoint-GUID: yrSC-t1z72X9YdGasHYKovSVXh6uuhnN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX76/x+hYi9CX0
 J2alaRZCfUDiAsILJRvw+eLpl8gztRiuSmqAMspHTXbickxGKY5Arw12f5sajbjFVX4iZgr2vaw
 qUgKPNJovnQMDnuBaDseikc6xwI1kO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_202410_616873_64D87B81 
X-CRM114-Status: GOOD (  13.26  )
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

Add sbi_domain_find_by_name() to allow driver locate domain instance
using domain name. This also means domain names must be unique.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi/sbi_domain.h |  7 +++++++
 lib/sbi/sbi_domain.c     | 19 ++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 1f773e41..394e7ddf 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -323,6 +323,13 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 				 unsigned long mode,
 				 unsigned long access_flags);
 
+/**
+ * Find a domain by name
+ * @param name Name of the domain
+ * @return pointer to the domain or NULL upon failure
+ */
+struct sbi_domain *sbi_domain_find_by_name(const char *name);
+
 /** Dump domain details on the console */
 void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix);
 
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index b3f5892d..f5c62509 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -531,6 +531,21 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 	return true;
 }
 
+struct sbi_domain *sbi_domain_find_by_name(const char *name)
+{
+	struct sbi_domain *dom;
+
+	if (!name)
+		return NULL;
+
+	sbi_domain_for_each(dom) {
+		if (!sbi_strcmp(dom->name, name))
+			return dom;
+	}
+
+	return NULL;
+}
+
 void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 {
 	u32 i, j, k;
@@ -645,11 +660,13 @@ int sbi_domain_register(struct sbi_domain *dom)
 	/*
 	 * Ensure that:
 	 *  1) Domain not already registered
+	 *  2) Domain name is unique
 	 *  2) Initialization order is unique
 	 */
 	sbi_domain_for_each(tdom) {
 		if (tdom == dom ||
-		    tdom->init_order == dom->init_order)
+		    tdom->init_order == dom->init_order ||
+		    !sbi_strcmp(tdom->name, dom->name))
 			return SBI_EALREADY;
 	}
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
