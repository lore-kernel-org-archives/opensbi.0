Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3FAC4451C
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 03:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcwkNWP8TDn8tE00OJ7DeOe2er/qNlG9MJUxGgtriuk=; b=OeJBUvFLeVsVmg
	240eWoZRi5OwT4jWL1+xKnjdUNrBaJsEffdg2wo0ykaSopgsAawNAi0JuB9H+H9L9qqS6OYZzEC2g
	JVVY8rnJhcmox5KY2cIki9huSpRbwOBF0su5iNaNmj8tPc5gcGin6hub7u4g2ml/gkJNpXNegigog
	k5rZGI3+qJ8UYVigWYbNu1jjz6zsPsd4EpJL5NLptgKfA6DgTLDiABhrbRUbfVaO8nXQqJGOz5mFM
	sheNZ/fy5NReZuqX7m4WvfYWnzDt14vjrR+7BAhBm9EnIpJHfX1kirDeGEvmf/GXLc0iyXmDGA0Vc
	2YwR/TFHIeExRaDIIzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjp-0000000Ap5S-2cWb;
	Wed, 22 Jul 2026 03:35:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjm-0000000Ap3b-2T8v
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 03:35:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M3HqEj3528477
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6aIR7YJ9JmD
	8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=; b=Nk/dNEytjAcOE+f4ZFEBprEdWLU
	iFdaZ+dQGzuCWAx5eoGaXxt/bihX3cokm58d2coWTyQBRGuv99AaxKNWL6WqHFfo
	/bEIXTOWTJmhLHyzVXtCBDDpCXxuwTI73L2h5ppbDIk1PZlQatQi0PRlrheMqlp6
	P1urc77eRUXO4VlOGrZluM+qduieuHY/5+plPiFLFskpMuQujYz+5vvWXwuZNkc0
	2WjZMJWDWFqlD1TKn7fjHgmnAkrYS0CPCxy3C/3lNF8022rWw5Q+34EWmmD64Hyk
	RBLV3s7M22mwhjJosl2Ccq6rWzRI2xy0FgypYOytNJskQR+H+c5gIrGlEqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4r1p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so3157146a91.0
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 20:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784691313; x=1785296113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aIR7YJ9JmD8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=;
        b=bVg4LG4Ycj+cgWOZqN93EBTw6eK725cu4VIedwbPK+URKWuqQpmlxGzU7j1ZY4ixmU
         JS2vDDpXQBvySHV2Q1wiObk1sUauI41sHUyUX5Cgq+5sGIVwcAy+nkv18AqfRQGQ23Fz
         jTO8OYfGQBgx9YJFyLaVfQymFZE0qVmlH6NAmLbQMdY5ygBUKaeX6vKpPnV4UrLW1Kzi
         iFlVUPzLXP1rHKrzdMfqKBZ1ar3Kcb+oQiW22GjJp4xjMz3tKNg98PIee5TEOjL42BEy
         t0tP3qV91bpM8VeZH+aCo56HTnn3fJB3+mpx9FWJjqYIlmym65mCKQiF1Pc4e4L89pto
         /bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691313; x=1785296113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6aIR7YJ9JmD8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=;
        b=lBOEvVE6LtZnzEZKsqY4RTXKnRGrV0VfmXrb3u0KD3uKZHVrFF4gBUwK7to1ZSIsC2
         Ype2PgqQ1/UR7ZxlnLAyqoLdYeBVF7IiTSTdtYQB27MY6f2mbJrEM7neLCNx0Aoy1xAt
         FI+BC21ZY+jWLg56HKyBzJ5jMnlFnCPvPhNpMC5/pQUOjuekI6rM3ObR2zgpBvXsAESb
         zCHYRmBnooGRXRW3muYwXUJzAq2MOWs2dAgkgQHNazJBu1OtwpMdl4BCPG56fdb8fdqD
         yOJcoKbsLqGz6in+4FzeFEJhwH4GUuT8w8PvQD1Qy4cjO5PEkNqHHnb9C1mMBuZUZdIZ
         LTTA==
X-Gm-Message-State: AOJu0Yy+9eYv+S7i5io+B90Ebgb5R+F4c+xuHIaP1wDImfJHlVFLYZY/
	JhOlI5m6GKt/Kb3Y2hX67jHmoWpxlhZY+dKE81vQF1/lbAGlINfuSgY3RstU4h5sZ14x0dWE61j
	mQ+HKTVZt/dAJ7w61DUhlbtv2Rz7KLQYzWWqt04NE/QnVZYy7XZ6SGXDYhYWFHgtp8F/pTxuUDA
	==
X-Gm-Gg: AR+sD13QivRjJ6jyHknrWIBbyiLaxvlwmmXBWLm2DbUjUqXKl+skc7V5Gltiinn8EF6
	Ug7KWThFV6IwJbINcvh6yMP5534fxREtfWmMZSRRviqhFrGIXxBqZ6e9tG0uBsAUYR94LIsa7Ar
	SaDfRF5QOTLBllsyAG0nP9d/Iyr0vjd23b1dQ4bykw0Ok7J5yB/zvmEzVVy+oD1CckIzyG44HVx
	TysGKvp49uNPQCb20AVO+9FBhhQylzzT4ECWQJn1OrKh3+VHJNctwLVI2w9bCH5pYGj0OzUSsf7
	5PG85+k+jTvwBj6uGcGT4Xgr9Zg4SLBlLUlnJVlFrkGVZMCDfdo9GfXjBEk/mflWsXUatEao4mk
	HmsG0MGlKB8+tlVtquA+eFk3jf8rUogzkktNWPNOFTjUDX0qCTF52u+U7XZIsWIxr5aVtHLi6Qx
	Rs1ms9eaLS13lS7NXO8Fuy
X-Received: by 2002:a17:90a:f94e:b0:38e:500:3975 with SMTP id 98e67ed59e1d1-38e4b476b7bmr21260936a91.18.1784691313270;
        Tue, 21 Jul 2026 20:35:13 -0700 (PDT)
X-Received: by 2002:a17:90a:f94e:b0:38e:500:3975 with SMTP id 98e67ed59e1d1-38e4b476b7bmr21260899a91.18.1784691312723;
        Tue, 21 Jul 2026 20:35:12 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm1645787c88.8.2026.07.21.20.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:35:11 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH 3/5] platform/generic: Initialise MPT at boot
Date: Wed, 22 Jul 2026 09:04:52 +0530
Message-ID: <20260722033455.2658178-4-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: bu6jS7oOxNd9BwXYoBCLqUgpv0L8Dpn0
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a603a72 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0mU-SnhwxBcTv7J85KcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX8SfJLiAXbO7P
 PQlNdYom/U35EgQxmZkFuFz+PzLGYdz2/nPmVL9q2PAvoC+1qQJzENN0HLExVzgx5fXPhnmWTRV
 ZRDosrmkUjC5XpWgLcdp+ozw9wUhQJhaNmnTI2UmdQ6rBN7SDQPIs3qFNQEB3WBZxS30piG75uI
 PAwtKr6tcBgvJrso/SBRvuxCqZbw6o67p58hNBm5ln+UXMozT7cIjSf6LaIm6q57AW0q4BaE68+
 ylvbsyKw/A2HlV/B5fgD4F0knlq1oPqR5L8GtzcBCzBYhJJSIPfkuFAqg/U6aIQnIiIDiK2yTHH
 SuKpFTqPg99ZpFCXgBn61YmfhF99OB0gD6rRS2qj3AHJf/HjK/L0sUsOf8OgqaKxrUUgCwZ1GAz
 2SUEEI7iu3aDt4xMm/XfjsGErc0l84Tko3g51M/IHjBx7IPpIuE6VyF7jUDI3bVApuBe6eRq1z1
 tB1XGe4I9es2bijqTXg==
X-Proofpoint-ORIG-GUID: bu6jS7oOxNd9BwXYoBCLqUgpv0L8Dpn0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX8/30pIxJXtRO
 hKHF57fAqCjHGsxD8BjTEET+erGuTapR+5I9YuPJQ6egOFBWQYJm514P/O/gnnWfkVBli1qr95j
 RJemFk/W/w3uyQOOKQz95zEykeyymzg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203514_734836_54698A91 
X-CRM114-Status: GOOD (  18.85  )
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

Integrates MPT initialisation into the generic platform boot flow.

mpt_early_init() probes for SMMPT during cold-boot early init and
initialises the structures required to build MPT tables.

mpt_final_init() creates the root supervisor domain which is mapping all
physical memory with the firmware region explcitly denied to S-mode and
adds support for an MPT domain for each additional registered SBI domain.

The heap budget is extended to reserve space for MPT tables.

With this patch MPT tables are built at boot.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 platform/generic/platform.c | 101 ++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..b9a715b6 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -17,6 +17,9 @@
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
+#include <sbi/sbi_mpt.h>
+#include <sbi/sbi_domain.h>
+#include <sbi/sbi_console.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_driver.h>
@@ -33,6 +36,86 @@
 /* List of platform override modules generated at compile time */
 extern const struct fdt_driver *const platform_override_modules[];
 
+/*
+ * mpt_early_init(): Detects the SMMPT mode and initializes the
+ * structures (not MPT tables) requried to prepare MPT tables and
+ * domain programming.
+ */
+int mpt_early_init(bool cold_boot)
+{
+	int rc;
+
+	if (!cold_boot)
+		return 0;
+
+	rc = sbi_mpt_init();
+	if (rc == SBI_ENODEV)
+		return 0;
+
+	return rc;
+}
+
+/*
+ * mpt_final_init(): Performs the final initialzation including
+ * creation of Root supervisor domain.
+ */
+int mpt_final_init(bool cold_boot)
+{
+	int rc;
+	u32 sdid;
+	struct sbi_domain *dom, *root_dom;
+	struct sbi_mpt_domain_config cfg;
+
+	if (!cold_boot)
+		return 0;
+
+	/* SMMPT may be unavailable */
+	if (!sbi_mpt_ctrl_get()->ready)
+		return 0;
+
+	/*
+	 * Create MPT domain for Root domain.
+	 *
+	 * Root domain maps all physical memory so the
+	 * firmware region must be explicitly denied to S-mode.
+	 *
+	 * regions pointer is NULL and nregions is 0 since there
+	 * are no other regions other than respective SBI domain for mapping.
+	 */
+	root_dom = sbi_domain_thishart_ptr();
+	cfg.sbi_dom = root_dom;
+	cfg.xwr = SBI_MPT_PERM_RWX;
+	cfg.fw_protect = true;
+	cfg.regions = NULL;
+	cfg.nregions = 0;
+
+	rc = sbi_mpt_domain_create(&cfg, &sdid);
+	if (rc) {
+		sbi_printf("mpt: Root domain create failed rc=%d\n", rc);
+		return rc;
+	}
+
+	sbi_memset(&cfg, 0, sizeof(cfg));
+
+	/* Create MPT domain for all other registered SBI domains. */
+	sbi_domain_for_each(dom) {
+		if (dom == root_dom)
+			continue;
+
+		cfg.sbi_dom = dom;
+		cfg.xwr = SBI_MPT_PERM_RWX;
+		cfg.fw_protect = false;
+		cfg.regions = NULL;
+		cfg.nregions = 0;
+
+		rc = sbi_mpt_domain_create(&cfg, &sdid);
+		if (rc)
+			sbi_printf("mpt: domain '%s' failed rc=%d\n", dom->name, rc);
+	}
+
+	return 0;
+}
+
 static u32 fw_platform_calculate_heap_size(u32 hart_count)
 {
 	u32 heap_size;
@@ -42,6 +125,15 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
 	/* For TLB fifo */
 	heap_size += SBI_TLB_INFO_SIZE * (hart_count) * (hart_count);
 
+	/*
+	 * MPT table budget
+	 * 1 MiB memory for MPT allocated currently.
+	 *
+	 * TODO: Need better way to get the memory budget based on active
+	 * SMMPT mode.
+	 */
+	heap_size += 1024 * 1024;
+
 	return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
 }
 
@@ -229,6 +321,10 @@ int generic_early_init(bool cold_boot)
 			return rc;
 
 		fdt_driver_init_all(fdt, fdt_early_drivers);
+
+		rc = mpt_early_init(cold_boot);
+		if (rc)
+			return rc;
 	}
 
 	return fdt_cmo_init(cold_boot);
@@ -236,11 +332,16 @@ int generic_early_init(bool cold_boot)
 
 int generic_final_init(bool cold_boot)
 {
+	int rc;
 	void *fdt = fdt_get_address_rw();
 
 	if (!cold_boot)
 		return 0;
 
+	rc = mpt_final_init(cold_boot);
+	if (rc)
+		return rc;
+
 	fdt_cpu_fixup(fdt);
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
