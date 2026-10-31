Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD66606A31C
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LPUIo4Z1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ifbfawTz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNkEqkH3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J8Ep9nbfHlTVzMBTZHTy2PYUKo1CvjPEm35snpYk2Fg=; b=LPUIo4Z1PrTHESiCiX/rcflaWG
	yR+/J7tqk2dMj1x0Du8YBgMMGzb8oZSQ/29LsC15yuqtecMK43y1jyiLCVj/0cB7RCQpJigyLbmDN
	HQ2lyM/TbJTgHiHaXD38YIXkagH8Eriflr4jK4+E7ZNLDededJFDfLD/oWoPJZbrCG5U6Aek2Kgmp
	MxT7fKLNL1YQE9Z277yy1/jwZwj46o9WEtcKQZLOC0f9MZi94KrvAPiQIsaAJFYBr4XOL3emS2p6G
	i+HxOJmgCawudSohxbCi3N5fNLH59ooUqgXS0ZETcFhBxuKnmLKWnwhDbuB9Q3DoyR7JjIhvUjyY6
	juhkE+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8C1-0000000DItm-1x7m;
	Sat, 31 Oct 2026 12:28:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Bz-0000000DIsm-19oA
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:28:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aHWt2142766
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tDuYcRMolVC
	JyW/S6xymAYKB0IH+wL/LFYLB5RlDOqE=; b=ifbfawTzXZofDqcKMD/6o8a9gEY
	W9yEkmU75eeoHrtOa2omDQyYuIgd/Ki1bMUcolTx65xQLJZIfYthSDNzA8WYkh8k
	XQAZ2+aF1eybw8cx50ulGIo6J1A9nCDnYO9LmVJqexOBu3VvyfvlqqWJDEt+Zkza
	hO3W9hr7y0O9jwA7gWzUq1DCgFann+cLJ3KAG9/WNF2FvSLMJ3rJMxnIDkADsQbw
	6KdNTOIinFDBwDk5UfwfID6d1xORYuETPMXS5/CUZrEl/Bkzco8VLfUC9nLQgOP6
	ZnUaWXwF3A/jxuzTpDNeWN2rgMyMMwMVmWuugOwEpp8j8UPWvUyV6InLrDg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsd41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1907031eec.0
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449694; x=1794054494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDuYcRMolVCJyW/S6xymAYKB0IH+wL/LFYLB5RlDOqE=;
        b=UNkEqkH3cQxEXjfssQgxHS1kguSqIfQgTGGwrBWZTuusES0fBWypk9sGccvRqa/oS5
         dqpYYH4Fj5fvmCSiCklFpnvETBDpHwcp3zGe+oySpB6bAu3vvJYxpOb3+MmvdJWoE9Nm
         2Uf/ZjFZz/HihGY5a7IWcIi70ezkR4/WzEdVzdZgxQRPHgjVGV6pRhlrclGckKOv7mDQ
         FkTnfR03CKG6J8SPSYzNOSpqP+JsMyxaEK38KHWR60EHhFwifESxk9HElTMdolumjsuB
         qUho2v2zr0EDSHyAFI46vvFztO/MeNUf35LLfe3wnTlrz748fVHQ+YRw+2f8SHsT+E/5
         NKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449694; x=1794054494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDuYcRMolVCJyW/S6xymAYKB0IH+wL/LFYLB5RlDOqE=;
        b=MTqEVXWY4+MGfkuBOhfAm6yhjRWAx1ENKvK6D364scdJoNNhTlKrm+girnwHbTyqeh
         Zjb5BsUAPVJPN1z/1ikkWsc5SWrrJeU+lABFIJCv+xgQknZlBRyX1L8sBqFtTf9sk2JI
         WXf9sWKnKWCR3ROtSMxWX1KGyn72g5h3CKSKcUxYp5fkg7UIzP5Oz0Y0bd2whHEfoAv1
         aZV+z2unpFZOQf/8Qv99ptt1SlCBcMvzk4/RCf/J+AlqyMTaXBeGKfb0EQiFQyoBxlw+
         Hkz77qObpaqyC071kD1x9sgLbgu8ZNBWzUPhVGKokjyS99uPMjMzzKFEZuxnCHaYppog
         0JUg==
X-Gm-Message-State: AFq9FYLwZ48+f3X8JciF4oN7GAFYg3pyfl9IdkqoHa+YRe/7PWbh17JZ
	4+Lzd4jRCVfSloB29+AIbRmmHQK7ZfES72wUzLNcJwVgNX1PXaQqEUENOWi2o7dzXoWWWb6uIMW
	LK32vOUFRq1SGegKolijjFPwCg+uLd+gQl/LTETsY4mrLZD0RhXVq37giofkTH4HCdbSb4MoAJQ
	==
X-Gm-Gg: AYBFou1L6iTZd/paDtbwwD6vyFPabg477QwgiQENTxbkaLbDRcxUY9GjmRvwRdwTJfE
	RqA9QWJ/ID94zmk8n5j5Crgz7THB0XK8g9I4JHYf/I6u59e3cFO8PbYgrWU7o9jhIrAtrqZEZLb
	HaigBB+4ItE2VHdH4reZLms0udwI+zoBdL0//UV7s3GWnoDxNn2fK2mGI9EJ6Q13kBNLGzQwEv6
	sYea3XpXwm8WzkzimyLROUm2KeteDeQXOacibmzKvZ1/Lj4M1R7jyRMTAUPDMAAU0hQE5xghr2k
	ULXx5P3qCxDmCRNZeIX50UzT3+ROHxKztiKKK0GvNxHi+iOdFDAFcenB1Xc8UneK4XEIRDRqOeC
	B6PpjJcZGkBWw4zc6tthXljVG9NpTLNhBAMEIacwyYUX9yN4pgE2RmmKzFTYuS9GpqLDEBXiQhK
	Jf+Jrq9WceU3ui07Uvj/bTuuFvJEp9PjCuY5yD9KrtaslOJMYDGYIKJtthee3XfP9Q7A5R
X-Received: by 2002:a05:693c:881a:20b0:36a:ebf:5816 with SMTP id 5a478bee46e88-36a4238b5f0mr7615535eec.19.1793449693946;
        Sat, 31 Oct 2026 05:28:13 -0700 (PDT)
X-Received: by 2002:a05:693c:881a:20b0:36a:ebf:5816 with SMTP id 5a478bee46e88-36a4238b5f0mr7615503eec.19.1793449693303;
        Sat, 31 Oct 2026 05:28:13 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm15515168eec.17.2026.10.31.05.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:28:12 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v6 3/6] lib: utils: fdt: Add helper to check for an extension in DT
Date: Sat, 31 Oct 2026 17:57:52 +0530
Message-ID: <20261031122757.2572125-4-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
References: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX3QJXggfpJcgj
 N0w1AZXlYRwZnBQNWNBgp5ir8vYND66KjZ6kNJJIWFTSBH6KJQmfd3PmpWiwg8ajYwn548sNjHY
 KlhoaICzHccAdLfUCrms+e1yMlxuRGQ=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5dede cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-3CqMY4tcljjevOultEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: gzM21oUZaZqSBHuY6JrvtVpndrSEiIyW
X-Proofpoint-ORIG-GUID: gzM21oUZaZqSBHuY6JrvtVpndrSEiIyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfXxDVWKrOguk8t
 gvcUDlTg3UxBcojAjjatbOaTo6DLcjiQSQet7n29YGavBYiPMo52lmnindsQFc8D3XA9oVaaugz
 nsl3KjQ2hKxzBg6/lzlfJKAtWYYWH/fbfJTBeTgKszvtBZqFLTSbF80xocMpgrMkpgBlWHWifc1
 tNQPx5aM9N4th8OknnjE5GOUSDaZEdst6C0AJFcvhic8vjsTfjMo73dsLh29foO4WMPQ3DFUOfV
 zG1tyPevqT7qsW+VXoesd5K6RIGCsMj0zXr5fAXXANIr0cPsbyh+yeHwBjgOlL9DZ7wJzFKBnbG
 yRf9GLKj7yKDN1ee7hq81vmRlmYOFQmgODFk5OY2QIw1ngtufOYWCPzCLL8cs65HkPAmxkiwxOK
 Efv4ya4sHBsidufKWXN09eN2O7pNFeAIvIMKlLXU7r+osPg/M/tTdH/dOIapDnnFNLu5+lMyEFX
 /v9YJ5AORJQhDvs7iPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_052815_320778_A8A78F0F 
X-CRM114-Status: GOOD (  16.28  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the early boot stage a platform may need to
check for an extension in DT. This early stage
can be before the sbi_hart_init is called which
later parses all extensions available on the harts.

Add a new helper function for this detection.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi_utils/fdt/fdt_helper.h |  4 ++
 lib/utils/fdt/fdt_helper.c         | 61 +++++++++++++++++++++++-------
 2 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 75a564d1fece..59e369780730 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -12,6 +12,7 @@
 
 #include <sbi/sbi_types.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_hart.h>
 
 struct fdt_match {
 	const char *compatible;
@@ -56,6 +57,9 @@ int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
 int fdt_parse_isa_extensions_all_harts(const void *fdt);
 
+bool fdt_cpu_has_extension(const void *fdt, int cpu_offset,
+			   enum sbi_hart_extensions ext);
+
 int fdt_parse_gaisler_uart_node(const void *fdt, int nodeoffset,
 				struct platform_uart_data *uart);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 747ba0285b37..d71b8c76a733 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -407,13 +407,56 @@ static void fdt_parse_isa_extensions_one_hart(const char *isa,
 	}
 }
 
+static int fdt_parse_isa_extensions_cpu(const void *fdt, int cpu_offset,
+					unsigned long *extensions)
+{
+	const fdt32_t *val;
+	int len, err;
+
+	val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
+	if (val && len > 0) {
+		fdt_parse_isa_extensions_one_hart((const char *)val,
+						  extensions, len);
+		return 0;
+	}
+
+	val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
+	if (!val || len <= 0)
+		return SBI_ENOENT;
+
+	err = fdt_parse_isa_one_hart((const char *)val, extensions);
+
+	return err;
+}
+
+bool fdt_cpu_has_extension(const void *fdt, int cpu_offset,
+			   enum sbi_hart_extensions ext)
+{
+	int err;
+	bool is_ext;
+
+	DECLARE_BITMAP(extensions, SBI_HART_EXT_MAX);
+	bitmap_zero(extensions, SBI_HART_EXT_MAX);
+
+	if (!fdt || ext >= SBI_HART_EXT_MAX)
+		return false;
+
+	err = fdt_parse_isa_extensions_cpu(fdt, cpu_offset, extensions);
+	if (err)
+		return false;
+
+
+	is_ext = __test_bit(ext, extensions) ? true : false;
+
+	return is_ext;
+}
+
 int fdt_parse_isa_extensions_all_harts(const void *fdt)
 {
 	u32 hartid;
-	const fdt32_t *val;
 	struct sbi_scratch *scratch;
 	struct sbi_hart_features *hfeatures;
-	int err, cpu_offset, cpus_offset, len;
+	int err, cpu_offset, cpus_offset;
 
 	if (!fdt)
 		return SBI_EINVAL;
@@ -438,18 +481,8 @@ int fdt_parse_isa_extensions_all_harts(const void *fdt)
 		if (!hfeatures)
 			return SBI_ENOENT;
 
-		val = fdt_getprop(fdt, cpu_offset, "riscv,isa-extensions", &len);
-		if (val && len > 0) {
-			fdt_parse_isa_extensions_one_hart((const char *)val,
-							  hfeatures->extensions, len);
-			continue;
-		}
-
-		val = fdt_getprop(fdt, cpu_offset, "riscv,isa", &len);
-		if (!val || len <= 0)
-			return SBI_ENOENT;
-
-		err = fdt_parse_isa_one_hart((const char *)val, hfeatures->extensions);
+		err = fdt_parse_isa_extensions_cpu(fdt, cpu_offset,
+						   hfeatures->extensions);
 		if (err)
 			return err;
 	}
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
