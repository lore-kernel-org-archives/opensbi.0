Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A37CA5FD9
	for <opensbi@archiver.kernel.org>; Fri,  2 Oct 2026 08:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tp82eeegul+620wboD9v01iwSSyOX+heue3SWowuok4=; b=MD+u4xrHW3wBju
	iOVW6jrgW+zMP5VDq8488w5sdAXzzo/f9nPiviEEEJGB4PEH0nvlkp823IOoc1zGp7Iq6qWCFn40m
	P15ODhuNBM70lVNkJsz/VusHDSSK9flQDv1h32WBZVB57d7TL4YjX+Y67SC4YvTuxvzoupMtHZ0gM
	nFESssKrj04/gPAAZXh/+MFO+jgEr4Wr+X/OVa65/PZLwFmJuOhW8rrzC04w8Uqx2pL9iOG4xRh5u
	rIdnGJZfjDdWghwHtuedR4lj4zmSBR2YnZUCbLqZ5dL5TBbuNHcoZjhlDFFbucC3iSrdfDWKNreIs
	rb33xbcesx1s6r2s/v7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfX-0000000AzMg-2xZw;
	Fri, 02 Oct 2026 08:31:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfV-0000000AzLR-2QTu
	for opensbi@lists.infradead.org;
	Fri, 02 Oct 2026 08:31:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925ivZk671590
	for <opensbi@lists.infradead.org>; Fri, 2 Oct 2026 08:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BUL7R1fYfk9
	vud23PAWpXrY5g77nm3MrGkA4e4ZyAMo=; b=i9Wrq9RKMG+JslYYyVyq/P6wsm+
	Ol03DxwRgirXEEQ0CzpieQL0XlpDkNWg5P2KAJuOtaz0M5kp31vMgg1mgy0+wtwO
	yAZj7M8bMdjuvAdDPcWNO4+hU0bCVUBYxVrSQshTWrvDU1AanPfuSwJ+jFmjMI36
	Xl9B1GfWwVPsDOWNRbIDkB6YPMqnpY3tkSSjEdO0506O0dxonQFeH3HRKrG9vFry
	xdNi0uVTaUl9oHOUQxcIlWMq1D+EvKbYlKJFcXMCmHgCrnic/qbc7Lw1eR00KQ8k
	A9vOzH+fLM4JnNJWJz2WJ0hs5WKudTdNDbYBCME4psD0r53vVjHfPzwazrw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tjac7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 08:31:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so11424822eec.1
        for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790929860; x=1791534660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUL7R1fYfk9vud23PAWpXrY5g77nm3MrGkA4e4ZyAMo=;
        b=Mv4zn9O+hMXt+50C5U7dTboCz61k8ZuP8b69aEUQlmd7ywQxuNNgDd1f8u4OeM+lp6
         SOxdmtf1dSzzOSpWL3Y86ExD7MEUBMFHZgl/HvebFCtdbkUGHjcnJIagacpjhU1++tOW
         5ndAtGlrW8aPKfnn72xopnaoKFBM1GLuPClm9/435PBsz2+kECgy8/NmIW9dpOo4s1js
         1tnvw6sj10xIiZeaPbyIseVNXrrHsbeNu+hIX8HIHnojAHR63hbXY0oGHOJI11Hmeaj0
         LQbbIejdoU4LpY7IJ5tCrE56UB11Hrp0jfGMvFlS/txzd3yWp/E2Ad6kA6T7QBLEpzrq
         cgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929860; x=1791534660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUL7R1fYfk9vud23PAWpXrY5g77nm3MrGkA4e4ZyAMo=;
        b=IcBr5OjO/3Ffv78Mr2MCwX4PzwjFz3jNVe/WKq+jw3nrnhiYLfdB6AZyCvcxF8DOxL
         au2IWiVI94VlghRLvpq6foH1Lk7Ps6jm+iiyeAnS7tkN9dXbdjo58BdlYD/aHJFdawrG
         CPh04Z4KTDh0wGL+8aj1pl7oaZ1qagFUJWVRm4aY6Wz+/o9MtT9QzzAAxTMYSl7UpZaV
         V8O0FVbybosFxLmoq0nk+eHWd+y8CGdc1QwXh+Yz4ZP5VV1DDOfo/tyl9dmfMWpSYM5U
         TX/FnXmyATHsB12ITDWTKYxcOS3YYPFhOaGKKWpZH5HU0Ybi3/P6i6hCLi+qQRyer6k3
         6mLw==
X-Gm-Message-State: AFuF++lgkPHTcKgh48pDxRb9O7gIQidtMvuCr/fXlW7XC0kQ1jhNHstS
	WbuSFbVYcwKgsace8ekWz2Ga/HvXHBt6yUsA9ickQGGNqpsNllL68bV+y7hX3SmslWaShDVQ/Vo
	GuOSXjqtqLrqFjC+tQacVapjso31pe+QOK8wKwz1WqvIPA6ZuGs3BHYdZMtoRBFY7Oifafae7/g
	==
X-Gm-Gg: AYBFou3ufommZCkvWfgxB2JFvsMWkCk1L1kiOz2jmjxKnmx6Fw2iXU5D7GAMYOvZLIp
	QJujPevvS/8YqJCXRXl6zKzd6OZS4m2Iu65B9UrI1toeKkg5O8Hq2D/8vtkaIQOezeGKs4xEeG7
	7VS1pPLbXBl2thUYWG0/AkksMr4weOVL8Sz8FDI+1Apa+QieDeQ62RnipUQdFVFP6XpRdC8QHTp
	6LJRWhFRuOp4t5fYvQwbkDQ8HEZoyYbNViBNGlw3ZpRr+lCDvS+sq0bt31IE7kqgP6mzURJwmEP
	J9Pyxm+HJSe6NX1vKGxK1pXSslGUuXc4NB/PEu1an5XPuxvd3cZ0OedQrh+ky4HwAcXaJMMR3IW
	rqM7IpLucH/TlDvgBh0s23SPqGJrEEdVyob9Mc2dJ30Ic/gCpenCMnjT8og6tZNxPzoHEhk/xkk
	N7iKuz/JEJlCTH
X-Received: by 2002:a05:7300:d190:b0:33c:380:1fa1 with SMTP id 5a478bee46e88-34f2199c38amr2159621eec.36.1790929859942;
        Fri, 02 Oct 2026 01:30:59 -0700 (PDT)
X-Received: by 2002:a05:7300:d190:b0:33c:380:1fa1 with SMTP id 5a478bee46e88-34f2199c38amr2159597eec.36.1790929859266;
        Fri, 02 Oct 2026 01:30:59 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm5208850eec.1.2026.10.02.01.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:30:58 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH 3/4] lib: sbi: Add SBI watchdog framework
Date: Fri,  2 Oct 2026 14:00:39 +0530
Message-ID: <20261002083040.2533097-4-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
References: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: xcswVkN6UjH4M41G0KMv0P4lysqHHHcw
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abf6bc5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cgZmKVGfzAO9Ibn1TsgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfXxrOZ7jw3rrci
 vzYwyo4DTQaCx7c85E79bUIsxMZ8Rgy7qCsnxHsX7aou9d88eZqMGoWcOVgIjFE5Tto/l0ZKlNW
 5nRkp6FIfJeMpiTGl1owZApr9pGLsdWBQ3QbSQvX9rZz5wkRbh4Ue/u2BfouwM3cbFBmOdSwpbK
 sbSHTv7Ltys4DETI6vIyHji8v6qdUdMEAwqISTFNqpdwkpgWhgZGILfAnEzxxxM6+nBPOovu5EE
 X/Bja+XQV+WDkw/gZO/pvxbotaKSFXtGfnEaBRNZ0QcDduE0GMSaELDjl19ncanCb8aA/D5EsEf
 SKgdN5kAhWPhOrTwEbCCMSIhpmyNbWZgwhO7iK4lnwRR5JGY7Vo5slaZDQdhAKlcHbuHUwAEtBl
 M4iEMM+Z04spNdifeWvhdz9+ONWaOf/Hb4L4SjyQw+NrF3yq5VMu5IhhfaHMEE+38QnrKUpeYF1
 dq3CJrhtpdpFrHLf8Pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfX+78lPnhCGy7/
 hNog8DxiKIC+btZANQrHElfECaiOPKLeSuQ5JR0zaiAVb94MohwtiQC/B1FGco99nB/KqvPThYE
 7qAfwv9LtJ4RW+h4LIzxVkkBxbjEGOk=
X-Proofpoint-ORIG-GUID: xcswVkN6UjH4M41G0KMv0P4lysqHHHcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_013101_632592_50F73653 
X-CRM114-Status: GOOD (  25.08  )
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

Update the build infrastructure to include the SBI
watchdog compilation.

Implement the SBI watchdog functionality including
start, stop, pat, read and write attributes,
pretimeout and timeout handlers.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 include/sbi/sbi_wdt.h |  72 +++++++
 lib/sbi/objects.mk    |   1 +
 lib/sbi/sbi_init.c    |   8 +
 lib/sbi/sbi_wdt.c     | 455 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 536 insertions(+)
 create mode 100644 include/sbi/sbi_wdt.h
 create mode 100644 lib/sbi/sbi_wdt.c

diff --git a/include/sbi/sbi_wdt.h b/include/sbi/sbi_wdt.h
new file mode 100644
index 00000000..43f866dc
--- /dev/null
+++ b/include/sbi/sbi_wdt.h
@@ -0,0 +1,72 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Qualcomm Inc.
+ *
+ * Authors:
+ *   Prajwal N <prajwal.n@oss.qualcomm.com>
+ */
+
+#ifndef __SBI_WDT_H__
+#define __SBI_WDT_H__
+
+/**
+ * Read the watchdog attribute
+ * @param attribute_id The wdt attribute id to be read
+ * @param attribute_value The value of attribute returned
+ * @return int error
+ */
+int sbi_watchdog_read_attribute(u32 attribute_id, u32* attribute_value);
+
+/**
+ * Write the watchdog attribute
+ * @param attribute_id The wdt attribute id to be written
+ * @param attribute_value The wdt attribute value to be written
+ * @return int error
+ */
+int sbi_watchdog_write_attribute(u32 attribute_id, u32 attribute_value);
+
+/**
+ * Write the watchdog MSI message attribute
+ * @param msi_addr_low The value of MSI low address
+ * @param msi_addr_high The value of MSI high address
+ * @param msi_data The value of MSI data
+ * @return int error
+ */
+int sbi_watchdog_write_notif_msi_message(u32 msi_addr_low, u32 msi_addr_high, u32 msi_data);
+
+/**
+ * Start the watchdog
+ * @param void
+ * @return int error
+ */
+int sbi_watchdog_start(void);
+
+/**
+ * Stop the watchdog
+ * @param void
+ * @return int error
+ */
+int sbi_watchdog_stop(void);
+
+/**
+ * Pat the watchdog
+ * @param void
+ * @return int error
+ */
+int sbi_watchdog_pat(void);
+
+/**
+ * Initialize the watchdog
+ * @param void
+ * @return int error
+ */
+int sbi_watchdog_init(void);
+
+/**
+ * Remove the watchdog
+ * @param void
+ * @return int error
+ */
+int sbi_watchdog_exit(void);
+#endif
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index ae27d0c5..c8bdc94a 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -106,5 +106,6 @@ endif
 libsbi-objs-y += sbi_unpriv.o
 libsbi-objs-y += sbi_expected_trap.o
 libsbi-objs-y += sbi_cppc.o
+libsbi-objs-y += sbi_wdt.o
 libsbi-objs-$(CC_SUPPORT_VECTOR) += sbi_vector.o
 libsbi-objs-y += sbi_fp.o
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b6..a8ce0a63 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,6 +35,7 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_wdt.h>
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -365,6 +366,13 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
+	/* Initialise the watchdog*/
+	rc = sbi_watchdog_init();
+	if (rc) {
+		sbi_printf("%s: watchdog init failed (error %d)\n", __func__, rc);
+		sbi_hart_hang();
+	}
+
 	/*
 	 * Note: Finalize domains after HSM initialization
 	 * Note: Finalize domains before HART PMP configuration so
diff --git a/lib/sbi/sbi_wdt.c b/lib/sbi/sbi_wdt.c
new file mode 100644
index 00000000..988c6581
--- /dev/null
+++ b/lib/sbi/sbi_wdt.c
@@ -0,0 +1,455 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Qualcomm Inc.
+ *
+ * Authors:
+ *   Prajwal N <prajwal.n@oss.qualcomm.com>
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_bitops.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/riscv_locks.h>
+#include <sbi/sbi_heap.h>
+#include <sbi/sbi_irqchip.h>
+#include <sbi/sbi_timer.h>
+#include <sbi/sbi_wdt.h>
+#include <sbi/sbi_system.h>
+#include <sbi/sbi_console.h>
+#include <sbi/riscv_io.h>
+#include <sbi/sbi_string.h>
+#include <sbi/sbi_hart_protection.h>
+
+/** Watchdog capabitlity - MSI */
+#define WDT_CAP_MSI_MASK	BIT(1)
+
+/** Watchdog capabitlity - SSE */
+#define WDT_CAP_SSE_MASK	BIT(0)
+
+/**
+ * Helpers to enable/disable channel capability bits
+ * _c: capability variable
+ * _m: capability mask
+ */
+#define CAP_ENABLE(_c, _m)	INSERT_FIELD(_c, _m, 1)
+#define CAP_DISABLE(_c, _m)	INSERT_FIELD(_c, _m, 0)
+#define CAP_GET(_c, _m)		EXTRACT_FIELD(_c, _m)
+
+/* Watchdog Permission Flags */
+#define WDT_ATTR_PERM_RO	BIT(0)
+#define WDT_ATTR_PERM_W	 BIT(1)
+#define WDT_ATTR_PERM_RW	(WDT_ATTR_PERM_RO) | (WDT_ATTR_PERM_W)
+
+static const u32 sbi_watchdog_attr_perm[SBI_WDT_ATTR_MAX] = {
+	[SBI_WDT_CAPABILITY]            = WDT_ATTR_PERM_RO,
+	[SBI_WDT_STATE]                 = WDT_ATTR_PERM_RO,
+	[SBI_WDT_MIN_PERIOD]            = WDT_ATTR_PERM_RO,
+	[SBI_WDT_PERIOD]                = WDT_ATTR_PERM_RW,
+	[SBI_WDT_TIME_LEFT]             = WDT_ATTR_PERM_RO,
+	[SBI_WDT_NOTIF_TIME]            = WDT_ATTR_PERM_RW,
+	[SBI_WDT_NOTIF_MSI_ADDR_LOW]    = WDT_ATTR_PERM_RW,
+	[SBI_WDT_NOTIF_MSI_ADDR_HIGH]   = WDT_ATTR_PERM_RW,
+	[SBI_WDT_NOTIF_MSI_DATA]        = WDT_ATTR_PERM_RW
+};
+
+/**
+ * SBI watchdog state
+ */
+typedef enum {
+	SBI_WDT_STOPPED = 0,
+	SBI_WDT_RUNNING	= 1,
+	SBI_WDT_PAUSED  = 2,
+	SBI_WDT_EXPIRED	= 3
+} sbi_wdt_state_t;
+
+/**
+ * SBI watchdog attributes
+ */
+struct sbi_watchdog_attrs {
+	/* MSI and SSE capability flags */
+	u32 wdt_capability;
+	/* Watchdog state */
+	u32 wdt_state;
+	/* Minimum watchdog timeout supported in us */
+	u32 wdt_min_period;
+	/* Watchdog timeout period in us */
+	u32 wdt_period;
+	/* Time left until watchdog expiry in us */
+	u32 wdt_time_left;
+	/* Watchdog pretimeout in us */
+	u32 wdt_notif_time;
+	/* MSI target address low 32-bit */
+	u32 wdt_notif_msi_addr_low;
+	/* MSI target address high 32-bit */
+	u32 wdt_notif_msi_addr_high;
+	/* MSI data */
+	u32 wdt_notif_msi_data;
+};
+
+struct sbi_watchdog {
+	/* Watchdog attributes */
+	struct sbi_watchdog_attrs wdt_attr;
+	/* Watchdog timeout event */
+	struct sbi_timer_event wdt_timer_ev;
+	/* Watchdog pretimeout event */
+	struct sbi_timer_event wdt_pretimeout_ev;
+	/* Watchdog spinlock */
+	spinlock_t wdt_lock;
+};
+
+/* Global pointer to the watchdog structure */
+static struct sbi_watchdog *sbi_system_watchdog;
+
+/** Make sure all the attributes are packed for direct memcpy in ATTR_READ */
+#define assert_field_offset(field, attr_offset)				\
+	_Static_assert(							\
+		((offsetof(struct sbi_watchdog_attrs, field)) /		\
+			sizeof(u32)) == attr_offset,			\
+		"field" #field						\
+		" from struct sbi_watchdog_attrs invalid offset, expected " #attr_offset)
+
+assert_field_offset(wdt_capability, SBI_WDT_CAPABILITY);
+assert_field_offset(wdt_state, SBI_WDT_STATE);
+assert_field_offset(wdt_min_period, SBI_WDT_MIN_PERIOD);
+assert_field_offset(wdt_period, SBI_WDT_PERIOD);
+assert_field_offset(wdt_time_left, SBI_WDT_TIME_LEFT);
+assert_field_offset(wdt_notif_time, SBI_WDT_NOTIF_TIME);
+assert_field_offset(wdt_notif_msi_addr_low, SBI_WDT_NOTIF_MSI_ADDR_LOW);
+assert_field_offset(wdt_notif_msi_addr_high, SBI_WDT_NOTIF_MSI_ADDR_HIGH);
+assert_field_offset(wdt_notif_msi_data, SBI_WDT_NOTIF_MSI_DATA);
+
+int sbi_watchdog_read_attribute(u32 attribute_id, u32* attribute_value)
+{
+	u64 current, deadline, tick_delta;
+	int ret = SBI_SUCCESS;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	switch (attribute_id) {
+	case SBI_WDT_TIME_LEFT:
+		/* Calculate the time left before expiry and update the attribute */
+		current = sbi_timer_value();
+		deadline = sbi_system_watchdog->wdt_timer_ev.time_stamp;
+		if (current >= deadline) {
+			sbi_system_watchdog->wdt_attr.wdt_time_left = 0;
+			break;
+		}
+		tick_delta = deadline - current;
+		sbi_system_watchdog->wdt_attr.wdt_time_left = sbi_timer_ticks_to_usec(tick_delta);
+		break;
+
+	default:
+		/* Return error if the attribute index is out of bound*/
+		if (attribute_id >= SBI_WDT_ATTR_MAX) {
+			ret = SBI_ERR_INVALID_PARAM;
+			goto out;
+		}
+		break;
+	}
+
+	u32 *wdt_attrs = (u32 *)&sbi_system_watchdog->wdt_attr;
+	*attribute_value = wdt_attrs[attribute_id];
+
+out:
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+	return ret;
+}
+
+int sbi_watchdog_write_attribute(u32 attribute_id, u32 attribute_value)
+{
+	int ret;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	/* Check if the attribute is writable */
+	if (!(sbi_watchdog_attr_perm[attribute_id] & WDT_ATTR_PERM_W)) {
+		ret = SBI_ERR_DENIED;
+		goto out;
+	}
+
+	switch (attribute_id) {
+	case SBI_WDT_PERIOD:
+		/* Return error if wdt_period passed is less than wdt_min_period */
+		if (attribute_value < sbi_system_watchdog->wdt_attr.wdt_min_period) {
+			ret = SBI_ERR_FAILED;
+			goto out;
+		}
+		break;
+
+	case SBI_WDT_NOTIF_TIME:
+		/* Ignore the write if the MSI capability is not enabled */
+		if (!CAP_GET(sbi_system_watchdog->wdt_attr.wdt_capability, WDT_CAP_MSI_MASK)) {
+			ret = SBI_SUCCESS;
+			goto out;
+		}
+
+		/* Returen error if the notif time is greater than the timeout period*/
+		if (attribute_value >= sbi_system_watchdog->wdt_attr.wdt_period) {
+			ret = SBI_ERR_FAILED;
+			goto out;
+		}
+		break;
+
+	case SBI_WDT_NOTIF_MSI_ADDR_LOW:
+	case SBI_WDT_NOTIF_MSI_ADDR_HIGH:
+	case SBI_WDT_NOTIF_MSI_DATA:
+		/* Ignore the write if the MSI capability is not enabled */
+		if (!CAP_GET(sbi_system_watchdog->wdt_attr.wdt_capability, WDT_CAP_MSI_MASK)) {
+			ret = SBI_SUCCESS;
+			goto out;
+		}
+
+		/*
+		 * The MSI address and data can be written only when
+		 * the notifications are disabled
+		 */
+		if (sbi_system_watchdog->wdt_attr.wdt_notif_time != 0) {
+			ret = SBI_ERR_FAILED;
+			goto out;
+		}
+		break;
+
+	default:
+		/* Return error if the attribute index is out of bound*/
+		if (attribute_id >= SBI_WDT_ATTR_MAX) {
+			ret = SBI_ERR_INVALID_PARAM;
+			goto out;
+		}
+		break;
+	}
+
+	u32 *wdt_attrs = (u32 *)&sbi_system_watchdog->wdt_attr;
+	wdt_attrs[attribute_id] = attribute_value;
+
+	ret = SBI_SUCCESS;
+
+out:
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+	return ret;
+}
+
+int sbi_watchdog_write_notif_msi_message(u32 msi_addr_low, u32 msi_addr_high, u32 msi_data)
+{
+	int ret;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	/* Ignore the write if the MSI capability is not enabled */
+	if (!CAP_GET(sbi_system_watchdog->wdt_attr.wdt_capability, WDT_CAP_MSI_MASK)) {
+		ret = SBI_SUCCESS;
+		goto out;
+	}
+
+	/* The MSI address and data can be written only when the notifications are disabled */
+	if (sbi_system_watchdog->wdt_attr.wdt_notif_time != 0) {
+		ret = SBI_EINVAL;
+		goto out;
+	}
+
+	u32 *wdt_attrs = (u32 *)&sbi_system_watchdog->wdt_attr;
+	wdt_attrs[SBI_WDT_NOTIF_MSI_ADDR_LOW] = msi_addr_low;
+	wdt_attrs[SBI_WDT_NOTIF_MSI_ADDR_HIGH] = msi_addr_high;
+	wdt_attrs[SBI_WDT_NOTIF_MSI_DATA] = msi_data;
+
+	ret = SBI_SUCCESS;
+
+out:
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+	return ret;
+}
+
+static void sbi_watchdog_pretimeout_cleanup(struct sbi_timer_event *ev)
+{
+	/* Nothing to do */
+}
+
+static void sbi_watchdog_pretimeout_callback(struct sbi_timer_event *ev,
+					     struct sbi_timer_event_restart *restart)
+{
+	u64 msi_addr;
+	u32 msi_data;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+	/* Calculate the MSI address using the low and high addresses*/
+	msi_addr = (((u64)sbi_system_watchdog->wdt_attr.wdt_notif_msi_addr_high << 32 ) |
+					sbi_system_watchdog->wdt_attr.wdt_notif_msi_addr_low);
+	msi_data = sbi_system_watchdog->wdt_attr.wdt_notif_msi_data;
+
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+
+	sbi_hart_protection_temp_map_range((unsigned long)msi_addr, sizeof(u32));
+	/* Write the MSI data to the MSI address*/
+	writel(msi_data, (void *)(unsigned long)msi_addr);
+	sbi_hart_protection_temp_unmap_range((unsigned long)msi_addr, sizeof(u32));
+}
+
+static void sbi_watchdog_event_cleanup(struct sbi_timer_event *ev)
+{
+	/* Nothing to do */
+}
+
+static void sbi_watchdog_expired_callback(struct sbi_timer_event *ev,
+					  struct sbi_timer_event_restart *restart)
+{
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_EXPIRED;
+	/* Trigger the system reboot*/
+	sbi_system_reset(SBI_SRST_RESET_TYPE_WARM_REBOOT, SBI_SRST_RESET_REASON_NONE);
+
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+}
+
+static void sbi_watchdog_enable_timer_events()
+{
+	u64 timeout, pretimeout;
+	u32 pretimeout_us;
+
+	/* Restart the pretimeout event only if the wdt_notif_time is non zero*/
+	if (sbi_system_watchdog->wdt_attr.wdt_notif_time != 0) {
+		pretimeout_us = sbi_system_watchdog->wdt_attr.wdt_period -
+				sbi_system_watchdog->wdt_attr.wdt_notif_time;
+		pretimeout = sbi_timer_value() + sbi_timer_compute_udelta(pretimeout_us);
+
+		sbi_timer_event_start(&sbi_system_watchdog->wdt_pretimeout_ev, pretimeout);
+	}
+
+	/* Restart the Watchdog timeout event only if the wdt_period is non zero*/
+	if (sbi_system_watchdog->wdt_attr.wdt_period != 0) {
+		timeout = sbi_timer_value() +
+			  sbi_timer_compute_udelta(sbi_system_watchdog->wdt_attr.wdt_period);
+		sbi_timer_event_start(&sbi_system_watchdog->wdt_timer_ev, timeout);
+	}
+}
+
+int sbi_watchdog_start(void)
+{
+	int ret;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	/* Return error if the watchdog is not in SBI_WDT_STOPPED state*/
+	if (sbi_system_watchdog->wdt_attr.wdt_state != SBI_WDT_STOPPED) {
+		ret = SBI_ERR_INVALID_STATE;
+		goto out;
+	}
+
+	sbi_watchdog_enable_timer_events();
+
+	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_RUNNING;
+	ret = SBI_SUCCESS;
+
+out:
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+	return ret;
+}
+
+int sbi_watchdog_stop(void)
+{
+	int ret;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	/* Return error if the watchdog is already in SBI_WDT_STOPPED state */
+	if (sbi_system_watchdog->wdt_attr.wdt_state == SBI_WDT_STOPPED) {
+		ret = SBI_ERR_INVALID_STATE;
+		goto out;
+	}
+
+	/* Stop both the pretimeout and expiry events */
+	sbi_timer_event_stop(&sbi_system_watchdog->wdt_pretimeout_ev);
+	sbi_timer_event_stop(&sbi_system_watchdog->wdt_timer_ev);
+
+	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_STOPPED;
+	sbi_system_watchdog->wdt_attr.wdt_time_left = 0;
+
+	ret = SBI_SUCCESS;
+
+out:
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+	return ret;
+}
+
+int sbi_watchdog_pat(void)
+{
+	int ret;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	/* Return error if the watchdog is not in SBI_WDT_RUNNING state*/
+	if (sbi_system_watchdog->wdt_attr.wdt_state != SBI_WDT_RUNNING) {
+		ret = SBI_ERR_INVALID_STATE;
+		goto out;
+	}
+
+	sbi_watchdog_enable_timer_events();
+	ret = SBI_SUCCESS;
+
+out:
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+	return ret;
+}
+
+static void sbi_watchdog_init_attributes(void)
+{
+	const struct sbi_timer_device *tdev;
+	unsigned long timer_freq;
+	u32 capability = 0;
+
+	spin_lock(&sbi_system_watchdog->wdt_lock);
+
+	sbi_memset(&sbi_system_watchdog->wdt_attr, 0, sizeof(struct sbi_watchdog_attrs));
+
+	/* Retrieve the MSI capability from irqchip */
+	if (sbi_irqchip_find_device_by_caps(SBI_IRQCHIP_CAPS_MSI, NULL))
+		capability = CAP_ENABLE(capability, WDT_CAP_MSI_MASK);
+
+	sbi_system_watchdog->wdt_attr.wdt_capability = capability;
+
+	sbi_system_watchdog->wdt_attr.wdt_state = SBI_WDT_STOPPED;
+
+	/* Set the min period based on the timer frequency */
+	tdev = sbi_timer_get_device();
+	if (tdev != NULL) {
+		timer_freq = tdev->timer_freq;
+		/* Ceil division to ensure the result is non-zero */
+		sbi_system_watchdog->wdt_attr.wdt_min_period =
+					(u32)((SEC_TO_MICROSEC + timer_freq - 1) / timer_freq);
+	}
+
+	spin_unlock(&sbi_system_watchdog->wdt_lock);
+}
+
+int sbi_watchdog_init(void)
+{
+	/* Allocate memory for global watchdog structure sbi_system_watchdog */
+	sbi_system_watchdog = (struct sbi_watchdog*)sbi_zalloc(sizeof(struct sbi_watchdog));
+
+	if(!sbi_system_watchdog) {
+		return SBI_ENOMEM;
+	}
+
+	SPIN_LOCK_INIT(sbi_system_watchdog->wdt_lock);
+	SBI_INIT_TIMER_EVENT(&sbi_system_watchdog->wdt_timer_ev,
+			     sbi_watchdog_expired_callback,
+			     sbi_watchdog_event_cleanup, NULL);
+	SBI_INIT_TIMER_EVENT(&sbi_system_watchdog->wdt_pretimeout_ev,
+			     sbi_watchdog_pretimeout_callback,
+			     sbi_watchdog_pretimeout_cleanup, NULL);
+
+	/* Initialize the default watchdog attributes */
+	sbi_watchdog_init_attributes();
+
+	return SBI_SUCCESS;
+}
+
+int sbi_watchdog_exit(void)
+{
+	/* Clean up the global watchdog */
+	sbi_free(sbi_system_watchdog);
+
+	return 0;
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
