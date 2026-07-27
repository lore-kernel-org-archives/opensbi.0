Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B60C531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcwkNWP8TDn8tE00OJ7DeOe2er/qNlG9MJUxGgtriuk=; b=ppPbBhTVarvRPA
	FSo3xlRtYFkbakGfhAJj+9hNnv39EYBqth+nqP/+uQMEeejeC009dzzAgRhgF4vzwqdBKE+6AcmN4
	e0boxmvzjV5LzNnY0YpVT4LZTpj03nCuVMpkZDTiU4XZ1FBMYpEYsLopR06mSznnro2kTTJSsaVBO
	iOgWU0I/N8Kb0MLXQQZ8ImENVA5+gjjkgvtTCuSW67nnVFos72HcbEQ+i8IZRoLx1xsaUcYATzRoX
	AemWc+6sGFRD5froz/XezWsU5X/5tm6LZ1hWcP7Kt2vHiASvZ2SE2CqlhEGDzTKh0PzcwHnV2EX/f
	J7rR4mvR+2PRGrI66B9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoc-00000002uef-2I5d;
	Mon, 27 Jul 2026 13:56:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoZ-00000002uci-3pXO
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 13:56:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlapx4065655
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6aIR7YJ9JmD
	8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=; b=UFRMYO6y83uOqEAqdftjFhfOSt7
	nouGQe013EDbC34stbso9GfqKmODdMivgtZ6Jagcv7NGp+NuAbFO/PqT7LPlIkVc
	D6yx1txd16nEm8fvL9pZJCgHDPpjrKsh+Ke7nZIWRy+BPCf2KXAA/wkm+R/qozJr
	TAbqrBRGOavWrJmZTHhhl29u91rUkUJu5CSSMs8PO+DBo04dU3YQyYNhpezSz9tE
	99I00dgaBEQnzgAr4yM9Wy3oWXButic+guBJ5gWf8/BCpjZXkhNSG5yzE8tN7W7K
	fa8O0QOmLrSz3cJOMszaLkMtBD2lYGrhQf8JBE4XtOgrAn8xxTwvSpq+2kw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysur72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so4214267a91.1
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160579; x=1785765379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aIR7YJ9JmD8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=;
        b=QblKwX51k0uJQXnlH2aU2bUJMQUu7+vRI984RvDiRaCYwf9yKfIRHG+tqpfVbKgB2P
         q2ME35Wa8QKTsSgx0re47dMOAa7K4Bri/pEkDWO4/xsqRsqCcukTWrtm8Gxd/KblocKX
         m0n4pbLoD1vLQteEZujryLXVBTyO48ywkGbJgS0bWreFTs+Y3AEFcvJS1kUPynUK5fgg
         U2CC3QJsXKR3iwiLgzekR/8y1PikT/xDuWbCzN7kXXi+MgkBee2BEdykaK2jBtj/wECJ
         9ETPd2MRQyZFHGWz7v3x86c9s1m98adV1esVjdH3p/ppHc3GXHqcUI3qXxLo0qmMyQap
         zGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160579; x=1785765379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6aIR7YJ9JmD8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=;
        b=Yk7QNHSfpKh0oY5WIcIbly8+K3d0hdILBHPz6/gPiykdZ00/pvrlLwjVX0wWRD4sRJ
         Vj7X+XzdXZmS4GPKVR84V76qzgkQTqL+YpIUrS8zkqIFJyAJ7LvlX3weqFZRkg47s7wy
         QB8ODDHosIAAh2BGEQoUyTzlMpRrIXIf236Mn37yV/azo/cNlqqZ2i+JtwZn5jFQgelk
         sQBfmzviycusXewyduzg2RxRdJQFpgjnFXlhyry8jyyO84GyTbILhka/WobuXITncgVq
         I2N2pKK++QK6Owtk7wO4lD1nrxPULqfCushuBLAx5Gk29iUlbLdtfGGCEYSPmNUj0/7n
         /OgA==
X-Gm-Message-State: AOJu0YwWw1LljERBlSfhyHEsXMOKu80h/+F17fsftIOf/50YKJzmiFPO
	nYmO9XXGov27EdxwvfEj4LbuS+h48U3euEzZ7QlBLZyZq17y2vr3FZ9zjztMPFbNW/yK3Gzh7P4
	Ougc/BaCkgJhm1EEGBaZyONank4I9+8WeyaY0sZ2PDxlITW9aOiUXWDjf8VZub1OIVMICObTKtA
	==
X-Gm-Gg: AR+sD12lTwwEtQofcZDc15ohWMErFcGavIYZndVlloH0zJFoJROq2qXdOnnFDqjKkIA
	oqmAu9OW7cdrn823XQACGaMs7HqDfUg4BL7Wfxjvyemc8t5B2+8PUsRDa1IpxS6As9u+B6ifCQT
	fbKZXGJps0n52r54oG0uJ+BzMTEaYjU7222Je1J0yC9+nf7AJnyT0mNy07rHxZqPsaKsmKk+p4e
	p53INkLaeSoekqNumWbRvDyeVODqJD1IDNjNfeqNZnDgWUMhi6aEdpjbabUbLw8JOSdT9VlW7AK
	8cLt8Q9U3ZsFGJSQgjHuAs2s/u8VnY4t+E5OKmtGqOnZUaRAOEFC5CAp25Br0n216gzOL6Kl//S
	puJV4tALkiI0cVL2ilOKScKHHpmFJH4BFVNrG72Eh9ObhzGj4f84uZVxpxlB33e9blqdGS82tDn
	88EieayebqvQJq0CXgoIY5
X-Received: by 2002:a05:6a21:700d:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c67dab463cmr8206445637.31.1785160578568;
        Mon, 27 Jul 2026 06:56:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:700d:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c67dab463cmr8206413637.31.1785160578043;
        Mon, 27 Jul 2026 06:56:18 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm47067658eec.25.2026.07.27.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:17 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v2 3/5] platform/generic: Initialise MPT at boot
Date: Mon, 27 Jul 2026 19:26:01 +0530
Message-ID: <20260727135605.465309-4-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX4drLj980nGmV
 XZDgC26kTCG0BE/GTWtHXMY/1QJ1OnDoh06qjbKnAo/y6QRHBwPgyHseEfDppQGVbMpQMaLJpRO
 KqSOWJvkpE/eCBdiYWlUDLDOiWziRfv4q2YPpq5xe+bEyY3KyHl0FmJe0I8ynXU+ZKvF6dA8yEN
 z2uHqJI/HMdxF/VwlSkyZk1ITdo08CcYsxkvrgVsaZxRbPc9xMB2L/E2TUsST6P4/VMw8sSllQJ
 bFT+Sc2Q+C0jHJwKbcoJAS2Xre9BQTj46FbK/spXtfMfoHtg6p+HorXvLBXTidL46n/f+wrbl12
 19GirrIqI9uqCp9OznreoghnuPWGKXbj9W5FbvQV9NNBpgkUnA8Qg+TFq3uHIjb2vx7VjwLe5G8
 d75mK1XXBbSdS/dVCOT1ydQL+kWEGSqYaBkcCuK77avZSP02PZLuKldxYBfZfHCAWDKVi47nQjU
 SRbuLQcFhn6w6meXHbg==
X-Proofpoint-GUID: NF2ItucKGhYUbDi5Y6XmTDYlEfmSKcA4
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a676383 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0mU-SnhwxBcTv7J85KcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfXy+hpdJv4PriL
 H83vHkEhKO93pYfF91G19uOMsfrFEWOqIXKlZkjCawqH533uuZhAQ3dIeXndz3rMDYlumyGDVmT
 387SeSgIE08FVW3qKbxze34NqrCXVmU=
X-Proofpoint-ORIG-GUID: NF2ItucKGhYUbDi5Y6XmTDYlEfmSKcA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065619_971922_88691F60 
X-CRM114-Status: GOOD (  18.82  )
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
