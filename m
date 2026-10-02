Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CD2CA5FD9
	for <opensbi@archiver.kernel.org>; Fri,  2 Oct 2026 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTnLTFwTobdfGjRnlwEb9jIFvpTiJp+buqkPPDn75QU=; b=gVrQolH9QcmVxv
	AsMntQvJ05RpeX9BtrX1VPdlLOpfsu1d0eKjsim8WJyToeDcRaTtwZabwgw0lJ44T/DU6dN8V7CP4
	F2AUdyWrF9qk4+uhfp9bIHbUwQYQSj4rS0pDykz8YGX0Oyecaxt27Fk5DuU6aYsrXdSgKT/yEjweg
	OZdPVpz66QZaJzU+sAUKm+MTAKu3McdtB6q3eiYsD9w0/AghzfirZNu4dEk+3ViSK8v/ouoRPBlDv
	SH+p1c4tVbOe7OqquumTVh4RmvjMNm+yN57Fb0Hx02TFfj3xHqfQdOhWdTcz0SeeiufDzm8zHCxkv
	zHnB6P/fx+JLITY/02qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfc-0000000AzP9-3Y5R;
	Fri, 02 Oct 2026 08:31:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYfa-0000000AzNs-0ip9
	for opensbi@lists.infradead.org;
	Fri, 02 Oct 2026 08:31:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j75P437921
	for <opensbi@lists.infradead.org>; Fri, 2 Oct 2026 08:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UX88gMmDsPO
	y1uZSivziDrsOqYY14kUwlbUgEEE5iqE=; b=E59HftKZp8U2bJPHHGEZSSKG323
	2b1FiozS85oCZdd4MLfb6Ki7AJ2i7e+s8BQUEl/lH26yQnz1yZVKJhsxbt+CwP+M
	vRfp7f5LMNA2CnaorpXj/fowMSxxVAo18u1ZmwCRyw9oz1DH0+OFgwz3Lk+AQZGv
	h9pfArPJ63HRXKrfw67EIWbU53a/Hk3/c6R8xlvrFLM4mWYbDtvOMVJFonCv9aXp
	LJbqN7HtJ+6C56XzZgITO2kbGRIHlBOhi7dDRD2yW3F/hhMulgLmr0fg3lRrlkVD
	jFZkvSht8ybhWK04yLvokDlwR/PAjMK5U0lUvUb+WeJl+9Pze7rwr2GM1wg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdckp5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 08:31:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so1344219eec.1
        for <opensbi@lists.infradead.org>; Fri, 02 Oct 2026 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790929864; x=1791534664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UX88gMmDsPOy1uZSivziDrsOqYY14kUwlbUgEEE5iqE=;
        b=IwSIUqRYnPfrFFoIoFZv+tfODw2Dvn6V1tLAdHg1N4EeQMrDaGQjn701IwvBVdamYb
         F4EvjwAZ3FR75VMnvQPsnZ//uhBrYmSf8+5OxfxCJ8P6gXuMudMKpzm/d1gC2mm0gELl
         Llvq8Y+VBrCRYn9KSlLbYoYKuBXd1Gp7XIQxyrekSi6KyNEUocY6xT6YtdQW9CVe/7L1
         aZm5emeYB088h3YhwxM5C60OV4XtPZcGtS3TryvPyUS5aXnvN3HJ1djbwsXlhdIMKEjU
         LTy86d2iUfV1ZOmGKpEFr/Gd5V4VrVgjj3jaXK9k/ZEHqxyOeihQBVn7fwa5LpILjZfH
         Fssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929864; x=1791534664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UX88gMmDsPOy1uZSivziDrsOqYY14kUwlbUgEEE5iqE=;
        b=Fp90PslPrI/VjhHIxM872sdSPgrh2y7pG8xXQlIIWsd2Ww5yd7p96uy60UkWleEMPs
         Ke8b8otJc0eup+taVjAS9fxQQiGNyedxDkMyc9ZpJQoJn2qkMIiwg3Fw2agokE9tIdK2
         CczeGGayRrWbBO2z+AjGACfNGLAQ0Knbnok9TlH0kzng7vk5sZIqOh8JzK8Irw6STuWc
         ZjTBTTwBGAvHs6tNBfoQdlRsZsVLY5ivYbjBHxFDHUOIHPRiICsfrb6E64bHoVYGj9m5
         F231xmnZfg4MZEQ/yyyBzgvVg3/cjjsjzPw0yOzpu+WAjyqx+hsI6sPEYbw0qdHprlzG
         nHJQ==
X-Gm-Message-State: AFuF++l3XrpOH87SEB44n/Gh2xB3ZccRw+Qn0TnIZDCsKjSPeb6NnYGS
	qesidNSa7xN4N9KF6yWv1tmS63xiGje84eqiB9nSzop2eCAa4bz29HFqSwm56f+tQDi9Wc5SbSh
	ULazBiH0ecUGi6B3/al/VYIfE2Xyg7iwWlofD3Fhzbx8fhklkqIZRe1BOjxrf2xXCfA==
X-Gm-Gg: AYBFou3Vb7bjow+EG67SlVcPsFq7nbMhhuhsi3fjyNzKke6iBKou8TMfsMFuC4WVw5O
	kjJmTFxU/dHQ+X4aD3JoBusmbEk0GoOwbtQtC5bkE9yLEjRC2Eo6qDS7JW1Ry6Pbd9tbVh39kBT
	2j24FdSQ0rZMytOcMjLMjfGXEOsW508v+BMB36TDzq/8JC8Q4thEc94Y+8hJ5wvb7JX/DQ/qzp+
	mMpdmHH/+OEg+UWrDNO9y7OId/C+eT4X0a/y7TyDtAIvtdWv7GsTXBQ9dQCBvJYGuFq9ZUOV8v3
	xgfCHe5UvFtIGVtXWIsnJvOxen2yMI0t7skeqy+kjWoRypBZNEGmdr8WPIEmz2LC/Zb9r8eM/MM
	pO6pzsBRGfQ32/Rqot55QPVPFhisBPhcMdnY93zV/GjKN5lLp+MiQvbaEgatcfsxdoLkgYaI75A
	z7JZGMIzUqwpNw
X-Received: by 2002:a05:7301:6182:20b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-34f14f2d867mr2080716eec.3.1790929863827;
        Fri, 02 Oct 2026 01:31:03 -0700 (PDT)
X-Received: by 2002:a05:7301:6182:20b0:33e:c164:b5d7 with SMTP id 5a478bee46e88-34f14f2d867mr2080685eec.3.1790929863138;
        Fri, 02 Oct 2026 01:31:03 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f067301b5sm5208850eec.1.2026.10.02.01.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:31:02 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [PATCH 4/4] lib: sbi: Add ecall handler for SBI watchdog
Date: Fri,  2 Oct 2026 14:00:40 +0530
Message-ID: <20261002083040.2533097-5-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
References: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: _SNfSQosVvbVrBHVFTKz6NnS_zIqiCu4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfX/Gfunuy6Uuwk
 kEF+pcqbXnLrb4+YzQ8DJ3ZSUU/X+MV27P6vvPk7DQgA9Ul2FibqUeaoE+iTszLemCyOdftwbfn
 zOYGydrqNmuPqIu5G0fUGxvujJNthhY=
X-Proofpoint-GUID: _SNfSQosVvbVrBHVFTKz6NnS_zIqiCu4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMyBTYWx0ZWRfX72qk263Jc/Ha
 A/VxMj3gVE+5MEsxRPyT/nA26jGatBKVaXd7u6phyvmtzpoDw/ug3svq6fstEO078aZrKoFiGwt
 V8OBXQ7+Igx5Fr4Nzn9NofztY7g66YRLXpm7zPb/qokIIUHzjRmK+CWGmMNEGCw2VxZ+9q37dRq
 PJcs3mojMbu09zxg6IdE+tNr8sOeqO0jmOnuRgZSn9B3ZLJsIsDl5gwq4xAcjJCYO9mOmIYUo+c
 Tz/OSRQVkC7tF58zLibZpwHCt1oAWVruANN/jjYLH9bQDMbFOYBxvskU/hK1EKzVv735ntaIuL6
 wnL/pn8KpmDMXhtLIYQBslLAmX19BV21xO8xl/AnJVdMfBftMdhW96Ph1rRAVFsFB92Awu8MLxD
 jfPiUp/iLJxWoGQ4FR+3YnvmAJqUpyC1L6WjWZawBGzLKtGO+L7uEW4mRZ0uLQfPV23fTv97iEs
 faOCVtWbHHfojH020Pg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf6bc9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-C7UwQzWU0aCVvUP-gMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_013106_354576_FEE63D73 
X-CRM114-Status: GOOD (  18.45  )
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

Update the Kconfig and build infrastructure to include
SBI ecall handler for watchdog.

Implement ecall handler functionality to delegate the
ecall to SBI watchdog framework

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 lib/sbi/Kconfig         |  4 +++
 lib/sbi/objects.mk      |  3 ++
 lib/sbi/sbi_ecall_wdt.c | 79 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_wdt.c

diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 24132eaa..6fd965d5 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -95,4 +95,8 @@ config SBI_ECALL_SSE
 config SBI_ECALL_MPXY
 	bool "MPXY extension"
 	default y
+
+config SBI_ECALL_WDT
+	bool "WDT extension"
+	default y
 endmenu
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index c8bdc94a..847aee89 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -46,6 +46,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_DBCN) += sbi_ecall_dbcn.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_CPPC) += ecall_cppc
 libsbi-objs-$(CONFIG_SBI_ECALL_CPPC) += sbi_ecall_cppc.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_WDT) += ecall_wdt
+libsbi-objs-$(CONFIG_SBI_ECALL_WDT) += sbi_ecall_wdt.o
+
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_FWFT) += ecall_fwft
 libsbi-objs-$(CONFIG_SBI_ECALL_FWFT) += sbi_ecall_fwft.o
 
diff --git a/lib/sbi/sbi_ecall_wdt.c b/lib/sbi/sbi_ecall_wdt.c
new file mode 100644
index 00000000..81b3e174
--- /dev/null
+++ b/lib/sbi/sbi_ecall_wdt.c
@@ -0,0 +1,79 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2026 Qualcomm Inc.
+ *
+ * Authors:
+ *   Prajwal N <prajwal.n@oss.qualcomm.com>
+ */
+
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_trap.h>
+#include <sbi/sbi_wdt.h>
+
+/**
+ * OpenSBI watchdog ecall handler
+ * @param extid OpenSBI extension ID
+ * @param funcid OpenSBI function ID corresponding to the extension ID
+ * @param regs Trap registers for arguments
+ * @param out Carry the return value
+ * @return integer error value
+ */
+static int sbi_ecall_wdt_handler(unsigned long extid, unsigned long funcid,
+			                        struct sbi_trap_regs *regs,
+	                                struct sbi_ecall_return *out)
+{
+	int ret;
+	u32 attribute_value = 0;
+	ret = SBI_ERR_FAILED;
+
+	switch (funcid) {
+	case SBI_EXT_WATCHDOG_READ_ATTRIBUTE:
+		ret = sbi_watchdog_read_attribute(regs->a0, &attribute_value);
+		out->value = attribute_value;
+		break;
+
+	case SBI_EXT_WATCHDOG_WRITE_ATTRIBUTE:
+		ret = sbi_watchdog_write_attribute(regs->a0, regs->a1);
+		break;
+
+	case SBI_EXT_WATCHDOG_WRITE_NOTIF_MSI_MESSAGE:
+		ret = sbi_watchdog_write_notif_msi_message(regs->a0, regs->a1, regs->a2);
+		break;
+
+	case SBI_EXT_WATCHDOG_START:
+		ret = sbi_watchdog_start();
+		break;
+
+	case SBI_EXT_WATCHDOG_STOP:
+		ret = sbi_watchdog_stop();
+		break;
+
+	case SBI_EXT_WATCHDOG_PAT:
+		ret = sbi_watchdog_pat();
+		break;
+
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+struct sbi_ecall_extension ecall_wdt;
+
+static int sbi_ecall_wdt_register_extensions(void)
+{
+	return sbi_ecall_register_extension(&ecall_wdt);
+}
+
+struct sbi_ecall_extension ecall_wdt = {
+	.name                   = "sbi-wdt",
+	.extid_start            = SBI_EXT_WDT,
+	.extid_end              = SBI_EXT_WDT,
+	.experimental           = true,
+	.register_extensions    = sbi_ecall_wdt_register_extensions,
+	.handle                 = sbi_ecall_wdt_handler,
+};
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
