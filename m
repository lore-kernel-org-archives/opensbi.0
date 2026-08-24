Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F478C5DF8C
	for <opensbi@archiver.kernel.org>; Mon, 24 Aug 2026 02:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRo5CoooKPlgQBmM41JHbN2P2NBk1bX7U8TXtOGMMEs=; b=GL5Hk9N+ZOTHKt
	kILzGmRJnyd4avJoxpLtH/7lpi16puNLIDGlt/lfgF6zMPLNfGTa7Zndv9pES6TFZBHqZ9XcI15EI
	9zJH0jAv99zjklwTCFzRj2sydCMYCj168eC0UT0q6HrMrJZDxwKXzufSEE9pL10o5mI3aDYy8OtnY
	Ks/j47ZIZjya11ywKzzD10HasI89ydAUIBTXI79mbefgXGrbdaU8sXy96W2VLfneNpooZJl7dddK4
	bVn6cK/OJRSiFSRVVYg7yxJ2k/gDFwoBF6j6hTRx1Bt7jEANz/aVC3+XHpxdCm6Y+4uKRZbJUXsUt
	WA4KgioRq6yvWzEdbVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8u-0000000Fl2Y-3Ifj;
	Mon, 24 Aug 2026 02:10:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8r-0000000Fl0f-2HFR
	for opensbi@lists.infradead.org;
	Mon, 24 Aug 2026 02:10:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0lfWl983217
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P+fnBYZnpAM
	vzlvirkb8jUt1h2rexRwJtAHpGC9p5FQ=; b=cZUsO53dXB7pc5R9/X60zFogAUo
	xx39gujF6zUAJ+N1ujI6uzHQFv/CCtYaOmO6xLBzsUlGZFES54ijrCdWtQ8Us1hi
	NdzcWllMNCjzrFCGY2oRwnEpyFafO1kRBneG9VgIy3BGfeGO39NIzTm95hW/9XyK
	CQSfw7/5ganOyrvIn1djSb1wbqvQY5EXGPci+0aLBLZacHoC/yfX4v3ZzLoZhMgn
	Ok7hMNTaWiOAaLOgyEH+SHJN4++QN2pwsKpB8qsZVVBgvjFnuAG5aaiVWILFPWWZ
	x765a9KVJ5Yn8Tr9f1WRtl1N852gCnYj1wPZ5HomPWCURuOeOg7yjGBcZ8g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7456w2er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63c48886bso52721065ad.0
        for <opensbi@lists.infradead.org>; Sun, 23 Aug 2026 19:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787537427; x=1788142227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+fnBYZnpAMvzlvirkb8jUt1h2rexRwJtAHpGC9p5FQ=;
        b=JUoOF0EGud2sLY79/nHIa+cgdAO1lft4EQxv0RxwqTfUIAwOa9yWVtNLS+5MCV6x++
         jMu5HrifgN3wehZVLQLmAfomKFtP5w4gf4ZaAmjrURVzZuMVJHSSzXZUbKLdBekzAWvZ
         6xLCbRiLrLio9qW2QUO66TBraZ2b4G0G5CRTp0013U0Y7qOsAeHe1zvl4Aj2MrzDY4/F
         KFiX0ceEuxzmKxmxzYSKqnkHmhY83sZCSaLfRkVD15EEMgMb+ZlMYw7IlfxxFfxbu5p/
         kbCxAFn8AYvBqRA72i52qKIPcbup/LEZmQF+o2f93fjnug6agra0IBKrzn8N2MFRgbHh
         EmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787537427; x=1788142227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+fnBYZnpAMvzlvirkb8jUt1h2rexRwJtAHpGC9p5FQ=;
        b=neCaaaK5dAIyNGfpLCbbTgB62Yp+VuJnyNNIv21v5T16lp1egI1onWRJYMHybrfH0H
         fGwmqsy6dEzsUPoinqJsmaREi/nv6uJ9ldhibXxvbQVpaHN60kVxeoHsWgOGVCGMSaKe
         VCHxP1eoVLx9xyNWQqOcU1Fs/8jSckFdcK0Q98Q+wuhLYtqhuw2rbz6GGsOBgerhLuNC
         J8JI2fkbp9+hXW7+7pnVV+ijKEGkdb9ws/qA8c+nHVtgF3mOgV0xUdWtfBXV8fqFot6h
         ayHa5hg8SFnNV7/SWl2/3HeCKTSMdmtqCBZntERdcFxLIjx21ReqNzkWqPiF7Jw6AWCK
         oRiQ==
X-Gm-Message-State: AFuF++l0T+wVcMaqvaEluZRTA+LdTYIetbZ0FahoTqpwfElwBHnEkXSH
	OpN0aqjXGMaR6GU4sVnu6pgSmpsfrRFaYUAm/Irbl26WuU8YviPL6AvK/IhgngIRgMaczOnLuZ0
	VEKsPfMduvfC1VNMIajjgnHiinUNw8E7Xbu9HYSYW/db75xIy62sh4wb4eJnB6TH+ulJLg8Kg6w
	==
X-Gm-Gg: AR+sD12BqiiWKWCOaCFgzPlDLm/bEcgz6edijWbT3WUnw7f4Mjs5NwgJW61/5rE3qT2
	oesiWa22Ae4/lP35Vpj6CJ/FvYZcTszDH5BMd7d88R90d8Ku10/boRwuwPHxVTZHAt8u+UZ1v5L
	m98MvKkFlpgE3nb+oo1KgtWDeZSri9wgjtwiDXMelmpwTGmpMjCDtyauTsGqkaN9SA7sXlYFLLv
	yLC9Cn7fbC1MTL4j3DNwoFxHVNffzyTg1yLwNGzf5ZuPXseh6E/knNtIQwXLEQgz/cKUYc9wAvY
	zPCLd94oivhH4wMCbpEZhzYcIaoKn1KQaVU285Mewb3Af4jsf5pgkemQfwyMtRXiEQ34obVjlxG
	0w2aW0IHb7bAp/r9ReoT3YU9/eoPVzBMc2Rvkmpup8fkPNWAtEqs9eAu9PDBtmg+Uty85of1gEz
	CT4O8M2sN1Sdmo8BmIHfVN
X-Received: by 2002:a17:902:d4c5:b0:2d3:104b:1acf with SMTP id d9443c01a7336-2d64afe8b7dmr383429445ad.8.1787537423589;
        Sun, 23 Aug 2026 19:10:23 -0700 (PDT)
X-Received: by 2002:a17:902:d4c5:b0:2d3:104b:1acf with SMTP id d9443c01a7336-2d64afe8b7dmr383418755ad.8.1787537415971;
        Sun, 23 Aug 2026 19:10:15 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm20487634eec.27.2026.08.23.19.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 19:10:15 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [RFC PATCH v4 4/4] lib: sbi: Initialize SMMPT during coldboot
Date: Mon, 24 Aug 2026 07:39:52 +0530
Message-ID: <20260824020953.2438946-5-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
References: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfX/OBtZzBCVDpi
 E0qvc/3at3eICNmU8DLXgQqIwKJ0p/cwgCsQAWRkjXMJBs81o/Vw97d45js4+j9kv5d2JjrhUsZ
 R3qWZ9LUIo4E3oL1by2u7QruKAHANzA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfX8cJS0Vf85h9n
 dtE1dqVnF2U2X2B0JRa70547k/PT5nH/m5G3w6ar2FF5iZgfRcmhsS7FI80w0genImGJSy62gB6
 Sv7Ej+rQB5nC4WowAY8pQLqatvAM2IS5cNryH7zViZb30gxhNwm7cWn79jSF67U4RrMCw0QhjhJ
 kwVfOIyoXbk7NViPDEiy+UT5Jjtbjp+Hb/zK3F8VV8+r/7ydqmjvcyrEvSstlFQMhis4j5/cneR
 BeTqGitTQqcXtlcsxj+r2cdYu5qFI2ytjBJDagzJkQP12kOTnm1yu6ylCJ03HVb3Mu+KIvsk4Ye
 cHepxdmTjGVeV+kgaF0EMKi3tZFKhNKawoWG8inDqZfOgoHmjxwabGMkGuu5bAN1Ii8sSCj2BAz
 d7vZAhSMwbd9eAA53xiGv7mPLiDdz4oQnb0RqP5b9Ll/tU3G2cSHV72+/RAoC2rNIcnS3VnSJB0
 AGZJiXeOzAcQZbvp2lA==
X-Authority-Analysis: v=2.4 cv=RtL16imK c=1 sm=1 tr=0 ts=6a8ba814 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rd1Op-0AFHWMy0GXr_EA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hfqZet3GV42YlTSa5LfGDZLDQaFPKGlP
X-Proofpoint-GUID: hfqZet3GV42YlTSa5LfGDZLDQaFPKGlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_191030_222476_E76AD926 
X-CRM114-Status: GOOD (  15.39  )
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

Call sbi_mpt_init() function from coldboot path of
sbi_hart_init() to initialize the SMMPT core. It will
create and the MPT tables for each SBI domain and maps
its memregions with appropriate permissions in MPT tables.

Also each MPT table requires to memory to install tables
so reserve more space in heap for MPT tables

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/sbi/sbi_hart.c          | 8 +++++++-
 platform/generic/platform.c | 9 +++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4261fea8..cc18b2c5 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1,4 +1,4 @@
-/*
+/*sbi_hart.
  * SPDX-License-Identifier: BSD-2-Clause
  *
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
@@ -21,6 +21,7 @@
 #include <sbi/sbi_pmu.h>
 #include <sbi/sbi_string.h>
 #include <sbi/sbi_trap.h>
+#include <sbi/sbi_hart_mpt.h>
 
 extern void __sbi_expected_trap(void);
 extern void __sbi_expected_trap_hext(void);
@@ -731,6 +732,11 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 		rc = sbi_hart_pmp_init(scratch);
 		if (rc)
 			return rc;
+
+		/* Smmpt is optional. Continue if the Smmpt is not present. */
+		rc = sbi_mpt_init();
+		if (rc && rc != SBI_ENODEV)
+			return rc;
 	}
 
 	return sbi_hart_reinit(scratch);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..ccf6f756 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -42,6 +42,15 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
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
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
