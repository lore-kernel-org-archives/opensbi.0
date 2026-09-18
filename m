Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1952AC982D2
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77nW+2qT7/ZgkcfiscHVxFvR20I58PHFQvnEUxCiR0Q=; b=RuikM/TLXZ3ldy
	LcxLuMxuC2hjxrzb7Cd6VQJhZSw1eNhrjIOqsLCUkQISxcCssAX3fjcIyTPt1FAwsCjGMc5fuJ5mE
	BfrgF/23UJ1qT73kuyVpSwI1ihdH+ApMWnuFW3GD27fWri7Zf3YkPcp84YqHpr/tAod8F78uajVLy
	KbVKCVWSJNAs88KIVN5qvVs7fJFYolHOkrewF8r7t+BkqqVfiqJhsBpD/ICkxJPRPMsmfBQ9RbQIK
	qoYlj3XIvBhcPIE99xc0IffzWdC1p29hgpAEpMtv677nER3OZqHwjS6kKYit0X9kXUOeEODGLuHoG
	rUS9U4erVAJq1pcoU25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzO-0000000DMpQ-0RQ6;
	Fri, 18 Sep 2026 03:10:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzL-0000000DMos-3YvN
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 03:10:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2VHA23947594
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JWHLhrEx7wQ
	a+VE1t45GjZYz8Uf9QqgTZfY3AoH5Twg=; b=NHn4RBoner5EBHxkihc4UI2wVya
	YZB9PH4WzbWQEzEtXrCUi/e29W1osDIOpYZzdzDj9CjuFDjw5EB3ZbY1cNcBi8lW
	lM4h+3P4i9ZwjFwN1QkBmzNkUd3aL6ApthdI/+KwVbQBBqhyBRBeifxE9vGW6sjl
	ZYKXLKeqSKx55lyFhxBa0pRf0GS5ACW2F0wIF2b2nJ9UOpyCwH6jDB393DFT+znZ
	WUPmr/LZ46s7WjyyMfIN7a7Phe7MLgG5UNF+qcCnhGgbrX/aXYOQI9ys8DRDFtIV
	dVOVrFeUGbG11LoukcEp8AYBWvPj9GqdFmxp3Ey6cQ20HRX9sCfxx47ZPcw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppktpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso449754a91.2
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 20:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789701010; x=1790305810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWHLhrEx7wQa+VE1t45GjZYz8Uf9QqgTZfY3AoH5Twg=;
        b=dyLUSU4FkWD+flCw8nVLEVIuNCwI1QwEcGsonk3PW7Ql+iIHeYXiN5Y4vWbnqVEJPF
         eWpJKmAxaNhOY7PQCFqWKxpHobPwQeQT9oB5jD2Xu6LRZVPjyvnT9MxbAB5yozU+p8Qj
         O0HvufAKdG/FOMuxMpHU95wav9aWPt+fEtCApOrMUgH8MFXcAJGk/PMWyI8MsPSoocTp
         DRJZT5aIa/NAdjTBEOyu7WNTnTrqAgg5Lg5cFVZSb8Fxqkq2dTeiTjesCnMZI3TKVIIP
         C+1dpJzOyEfkmjDKtRsHUwqLQYlxhnjT0Ksv84CEHfBDJL0CIajBgpx8VvswJoAma7KW
         D08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701010; x=1790305810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWHLhrEx7wQa+VE1t45GjZYz8Uf9QqgTZfY3AoH5Twg=;
        b=P3LOIZ0XS8SW0Cb048KFJf+cL5s53uk0RaplfTQkSILUT3tE4UYAlCYcCK2R6UonQo
         0H+ajBydPtjCzIXSSQ7vf0Pb5j/5teeu6EKnMY8+sB5idURfKsaqEr8AP8Kiu7AKyV57
         vfrU/+93RlSrBVbPXRZq5dQlmpVrQMI96d+hZO2UdlkmqtXTtiN/zdr1tVZ5Ec8llioo
         duFotH/HrB4aMJvgHYsScrZvReGi7MP2KhYPs75FAh4aD4TgfPi0mdWJktW7+Q2delKA
         N/TVptpeRqcXy0Fdd7K8od61mfbhcUYgNZaYeYgKIGRT+YRwt+y3mwYBzGllWWroZvfJ
         cysg==
X-Gm-Message-State: AFuF++k0aeOGKVJjQMUt4+j1HXXgqhoVsC01X15H126QgCPxoszW08uD
	wzPF/oJ9OXiXlJjjHIojnm/MGiGvrJkcYLjw1xI2zsDznvqMjn/Vv50Cl/KDQP1+7TaCC4tnZPy
	+mAgK+4Rax+bEI1Fntl+Rk9EKorP5bYK8ai3KuOPvmgIj/rwRuFE1KizzwrQy33awwLbS5CwGVg
	==
X-Gm-Gg: AYBFou3RSSIng7LBiyuuc8dPPLjjOjU1rakQUL3rNQxNV2Kk3zXg8HhAFtPcsgYJ1Jn
	bNPp2V9pjctXzuQbNcGdKcEVv++7ui311fK6NJuLoyakSInROtGhAkeL3vFG9dTe2dVvVg+9fk1
	IM8kFD8Cjo+WUfb+E4V7aGMFdA65or5NZERu5bJxEumV+GIsRH5C+1eU8ASARA4Mz6V9JhNprtR
	E7+GER4BL7s2LThGGp4ZU1PFiqIc6LL+hAUqdu5/VwWSk0fotMP/bstzhxkFCXhkDORF9PNIhGd
	fGWi3GV23L4Ss0kGlkCleS0D7i8mwqaGDHkD4QnV/ChK7jYcp4b45OjRnLRZzR1dFXCPe08rDAM
	SeVlYNCREE5y6IqSt573QGyS/L679nztm+CbUxGRvviBG9kgGlhhbCxkAuUoGHZToQ2cqQf96hO
	/eQPFd/qtKPhnBDHEr6q+2
X-Received: by 2002:a17:90a:d443:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e54f9c08bmr2346683a91.21.1789701009674;
        Thu, 17 Sep 2026 20:10:09 -0700 (PDT)
X-Received: by 2002:a17:90a:d443:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e54f9c08bmr2346621a91.21.1789701009149;
        Thu, 17 Sep 2026 20:10:09 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4cf8sm846468c88.1.2026.09.17.20.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:10:07 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [RFC PATCH v5 1/4] lib: sbi_domain: Add domain register finalize notifier
Date: Fri, 18 Sep 2026 08:39:50 +0530
Message-ID: <20260918030955.3902993-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Uc2IsiaqzhztGO0kAlXZE9vdp2lsoYVB
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aacab92 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=XWzWPA7GMWhotSyTkHIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Uc2IsiaqzhztGO0kAlXZE9vdp2lsoYVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfX6k0QfTRua8s+
 NUOQd6VF0NgkvxpjwY8TR1vyesqj66vL6ZF0OghJ6frPY2jefzDCig3JmAfLYAQmXPcgV0e4PRz
 90iLIuNgCmSC7bMIYXRrFMVHDCdpO6uZxXLjvR7dACFC4rNdDal70J6x68Ki4p9a8DbNzwnxpKU
 +9p3EeZBgsdOUecan8hbUg7CxweKkcgvjsFIfdmyYUoKhHL/26G2SshUIH3aOPi3xlFbkko2jCM
 mALpiTXSABheNaxUxoP6RNZevSw4he8w93ntUS8K5TaWdjO1pyRC2BWzPgyd+VNxfsVZ6saUo5z
 sqCm351QBWaFqpXuDdmsz/GhufaSxR57wvSofLuPjoxJTO7Yw/1utEWZ2TmV4LhZUUtUo2hF/2K
 7+TdukwVNWxfHKeRRyBLdv+oi/BjY0wSGMNsNGSjLZRuBTHwVq4UUPmh60OeCVmpuw9gDnBG61g
 SZuKczLTWlBkHLdBAbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfXxuhrRJNpjJUg
 Cq5PcPibcHQNurnhP4vvE+WjWkT4h9cbBDFPtyXYvZKfHdL5GbN28S0p3QgtmuDi9byIjy2uVRR
 n2E2BoWyn4GjTwnzQP1VPKujeVn80H8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_201012_005837_3B530D52 
X-CRM114-Status: GOOD (  17.16  )
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

sbi domain registeration notifier is invoked when
memory regions of the domains are not finalized. The root
domain is registered early and the drivers keep adding
the regions until sbi_domain_finalize() is called. Such regions
are added to the root after root domain is already registered
and notification for that has already been sent.

Per-domain configuration which is based on the final memory
regions of the domains especially the root domain is not
possible only with a domain register notifier.

Add a domain finalize notifier for such case which is called
for every domain once all the domains are already registered and
their memory regions are finalized.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_domain.h | 16 ++++++++
 lib/sbi/sbi_domain.c     | 80 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 39e6fc81..a96d709d 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -362,10 +362,26 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid);
 typedef void (*sbi_domain_notifier_fn)(const struct sbi_domain *dom,
                                       void *priv);
 
+/**
+ * Domain finalize notifier callback
+ *
+ * Invoked from sbi_domain_finalize  function after every domain gets
+ * registered and memory regions of all domains are finalized.
+ */
+typedef int (*sbi_domain_finalize_notifier_fn)(struct sbi_domain *dom, void *priv);
+
 /** Regitser domain notifier */
 int sbi_domain_register_notifier(sbi_domain_notifier_fn notifier, void *priv);
 
 /** Unregitser domain notifier */
 int sbi_domain_unregister_notifier(sbi_domain_notifier_fn notifier, void *priv);
 
+/** Register domain finalize notifier */
+int sbi_domain_register_finalize_notifier(sbi_domain_finalize_notifier_fn notifier,
+					  void *priv);
+
+/** Unregister domain finalize notifier */
+int sbi_domain_unregister_finalize_notifier(sbi_domain_finalize_notifier_fn notifier,
+					    void *priv);
+
 #endif
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index c0583efc..913f8142 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -42,8 +42,15 @@ struct sbi_domain_notifier_entry {
 };
 
 
+struct sbi_domain_finalize_notifier_entry {
+	struct sbi_dlist			node;
+	sbi_domain_finalize_notifier_fn		fn;
+	void					*priv;
+};
+
 static unsigned long domain_hart_ptr_offset;
 static SBI_LIST_HEAD(domain_notifier_list);
+static SBI_LIST_HEAD(domain_finalize_notifier_list);
 
 int sbi_domain_register_notifier(sbi_domain_notifier_fn notifier, void *priv)
 {
@@ -95,6 +102,67 @@ void sbi_domain_notify_all(const struct sbi_domain *dom)
 	}
 }
 
+int sbi_domain_register_finalize_notifier(sbi_domain_finalize_notifier_fn notifier, void *priv)
+{
+	struct sbi_domain_finalize_notifier_entry *entry;
+
+	if (!notifier)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(entry, &domain_finalize_notifier_list, node) {
+		if (entry->fn == notifier && entry->priv == priv)
+			return SBI_OK;
+	}
+
+	entry = sbi_zalloc(sizeof(*entry));
+	if (!entry)
+		return SBI_ENOMEM;
+
+	entry->fn = notifier;
+	entry->priv = priv;
+	sbi_list_add_tail(&entry->node, &domain_finalize_notifier_list);
+
+	return SBI_OK;
+}
+
+int sbi_domain_unregister_finalize_notifier(sbi_domain_finalize_notifier_fn notifier, void *priv)
+{
+	struct sbi_domain_finalize_notifier_entry *entry, *tmp;
+
+	if (!notifier)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry_safe(entry, tmp, &domain_finalize_notifier_list, node) {
+		if (entry->fn == notifier && entry->priv == priv) {
+			sbi_list_del(&entry->node);
+			sbi_free(entry);
+			return SBI_OK;
+		}
+	}
+
+	return SBI_ENODEV;
+}
+
+static int sbi_domain_notify_finalize_all(void)
+{
+	struct sbi_domain_finalize_notifier_entry *entry;
+	struct sbi_domain *dom;
+	int rc;
+
+	sbi_list_for_each_entry(entry, &domain_finalize_notifier_list, node) {
+		if (!entry->fn)
+			continue;
+
+		sbi_domain_for_each(dom) {
+			rc = entry->fn(dom, entry->priv);
+			if (rc)
+				return rc;
+		}
+	}
+
+	return 0;
+}
+
 struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex)
 {
 	struct sbi_scratch *scratch;
@@ -924,6 +992,18 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
 	 */
 	domain_finalized = true;
 
+	/*
+	 * All domains are registered and their memory regions are final
+	 * so notify the subsystems which derive per-domain configuration
+	 * from the domain memory regions.
+	 */
+	rc = sbi_domain_notify_finalize_all();
+	if (rc) {
+		sbi_printf("%s: domain finalize notifier failed (error %d)\n",
+			   __func__, rc);
+		return rc;
+	}
+
 	return 0;
 }
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
