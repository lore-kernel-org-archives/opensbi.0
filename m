Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363B1606A326
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 04:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QVp1+zaI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EcYXvSdy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVdS4MdS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J8Ep9nbfHlTVzMBTZHTy2PYUKo1CvjPEm35snpYk2Fg=; b=QVp1+zaINSP82yBJsBSVIGF9wp
	wenJaYdkhnL8l1VBKBfJOs7JAWEIyykFAXwCP8jYd/TkF1/+G3b4lofKkoBhI+pb8B+OazjM5SGzL
	CUgWj68ujJcusBEM6WyDxeMEyHxnQcz437hXp36J18++FjOEWvhG74UvQ9zbcr5drXDWz/WOK6NJT
	L0Im5vCv5XaqzLAE3S4tnH7tk4AKN4a38SG6scyi+CRDWHp0oAkGm8L1jt14/CH5iiKQ7hJPgMf3g
	2QwnCXFEg+pICdIGJf869PZLH3F2zksxYB6rhkHMinr3UjehQ7WoZ1QgSarK4ICc+4ITd6khJqu30
	5Sq0IwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkW-0000000FW57-44fC;
	Mon, 02 Nov 2026 04:34:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkU-0000000FW4F-2SgX
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 04:34:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vUlg2192509
	for <opensbi@lists.infradead.org>; Mon, 2 Nov 2026 04:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tDuYcRMolVC
	JyW/S6xymAYKB0IH+wL/LFYLB5RlDOqE=; b=EcYXvSdyiq/0SngeEDVfgHsGZK+
	MzMs0/HdZWh0wk3/X5R0y5Ln05Di4cEYdfmQZnTqZLuovYLvOtfD1p2/+5s1VBnN
	0bOJbnYlGVhkIkD6C/k7O4eclI0mwZgiTDTK1F0S+y3QFdULl2jVYZaWkUEQk3Gi
	0AEKVgvoynSIKKsiNY5bLCZWqMS29i0yH4PWQigekuw6mGKMenhTuVG6EkueD6fl
	GF7ktHwmcWtRdXdl9SWBLs3vzxLRqXx57NXNMsMbI02W7W4MYhO8t1F7x8BW/Eb9
	Li0KVGqq7kf9My3UQ3TpvL9HS88jsS3wArDU5IXzUf4JJ1RxCmeF2QaWynQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93en02f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 04:34:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so9300206c88.1
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 20:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594061; x=1794198861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDuYcRMolVCJyW/S6xymAYKB0IH+wL/LFYLB5RlDOqE=;
        b=fVdS4MdSjepDYSlUsTbbnZlGhuRaIIzV2NAhp8GHaMPLkqNbgN38FJNQ5jVoIIJqyv
         GEZV/4wDnrg8aR1KWXWj/Fh/znGx7nP9CfTTVUb0RzG2sokROJQRabmd+na4IukiTeCs
         iuhXTqna4i0nR6yLLvDVDF+BMBaNkDS7fkgM034eXxIhmHgjjPNHa1YmLi07R4sUyqje
         4HIlaxWoxDG7G4YPWMaYy8ELtz/SovGJ8d+ujjFegdIolU2RBEfotP4rRMSof8eCrKIu
         7GRWDL8CvbjwBTQd32F779FbmfvYJ8XM+i7vENYL6k/f+s6kYmw+TTPV4wlYKQfJrwM0
         yI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594061; x=1794198861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDuYcRMolVCJyW/S6xymAYKB0IH+wL/LFYLB5RlDOqE=;
        b=ujhh//pwZ/4t11A2lZZS9X6gc47y2uMb6iyVKs5e1hhI7sfaiamhw2WlrzcBnvYzqT
         vVcI/yQyWBeYzMp2kGJKaRRvhAugyu+u6kXzofhZ/vuZAzbvR3lHsSwK6Ki6/TDwfN/F
         pTWfKHBuTEb+fafi6/M0Po2CI7T1k8G7e2HM2RjXSMsav8TsWip0iGf4EhOk3WDBEe8D
         cnhW9hHn7ZlG0GhKRwDAp+i9rjJqLRSOxG6K378Mtg6gZYroY4Ji06dmg53MtcKMJMM8
         ShJ73xYkMhkj3EJrB0PBC5n5QJfh+5AkOl6L+VOsJPoaP9hA2yZb7wR9uqLhgdGZn7nq
         m4Jg==
X-Gm-Message-State: AFq9FYKs5VAI85V0VJLq8swdc/mgtTiKUUwz1I4E0XzZJzdtR7WYepNB
	+u4XQI/PdAcicKzGj5a9iQRrCc7qhCa1bKyvU3MF/l76eKlDMoxneSXZI8U9NjN4GZePESRfegH
	ViUEXmiGwuoszUDrKTWCYBJjiUZV60PRZlwIGEgpL/z7YBL1qU4ZJmJB+JhkINaodaH3a4QVfqQ
	==
X-Gm-Gg: AYBFou0T0T0NjxzkrQYL9OZy3OfRLi+2QAKY5+5vcYWe6BA1zFvfD0ftyxZdvRrLll5
	nVJouVa3edK/f0kI8bjy4zb61taW8oWZdsC+DWo1ZkFlRzMZYHcWDoAMpzeF53BXI9daOSb35Ip
	wCgEVz81cKvc4Ze2iAFQPvJgtwaR+HBik8fPaUTIB6KZpCTDKGrAlgb/oYQsJA9p1cIeS/DH2W5
	+LEpxMxnBSl7/5xJkFOp3iIv8TkNg1WzobclLnA80kQibK/cVnxlZBl9vA+zJZAqKupOfD+1QDC
	m9FTtJwgogQk4i/54zbmyBEu8oTj5L4ySMyOCJW1ZpYX+4TeHT67NgrLQB5r/2tg1j4qlqa3fBb
	NxPCdmzYGagvQLSQNNN7SyaFMlFIOt83rW4+OTciRA9+fu/5TylHgTVZRv2nqcfptHeh5jim3I3
	f435J+LFW4Y1QuBB1lRdPvEeQh2R/W4V4wfgOFPpWrHKK3J2puBoRsJETWz6BoOcbxgop2uQ==
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr11952209c88.35.1793594061074;
        Sun, 01 Nov 2026 20:34:21 -0800 (PST)
X-Received: by 2002:a05:7022:d8b:b0:195:c6c2:c6b with SMTP id a92af1059eb24-1ac5c273c3emr11952172c88.35.1793594060362;
        Sun, 01 Nov 2026 20:34:20 -0800 (PST)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm28014910c88.12.2026.11.01.20.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:34:19 -0800 (PST)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v7 3/6] lib: utils: fdt: Add helper to check for an extension in DT
Date: Mon,  2 Nov 2026 10:03:54 +0530
Message-ID: <20261102043400.287938-4-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
References: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX9DktcDq2x13P
 +PPfm3t+71DGWPccRQF/mutojuWnQkGmyaBGsQtjYts/u+HlGMo3eC78vH1gFaFz9aKz4yFfnuQ
 X+FcCAC1coDPUnFvd8gBLCv3BT/mIvVVzBctAjcwwFpnL9v6Nu5mYQrD+g10rFqK1Ftcknlm1/H
 5fXUVuWcrZGBkF6Thj4avWYlzB2Sh0mqlSr1bJep6xgvYzJA4qhEg+sNTEBhsyLpDQ/zrdmbM2/
 RrclTU1R/LhZPCAkdOxTUk+apvsVR9et1sQW1q3YnmJbqYFLEdWQIt/Go42vQ4Gqeke+yyy3aB7
 VZvHnbKTWXTGPJnvSdgP1PrafV78BVLn7Txzf9P7mNBCRpyhZ6ppW2xvopv5bNRXewmfsuZx7Df
 4W2ZBxO+ruBMF6AKlUndvk9L54PiDOnUAeZsnShKfHMu3NMRMEiowVsY7kFM8j7/pRGHRP1QGhI
 jFXbh6I5cnUHVKLSrGA==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae812cd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-3CqMY4tcljjevOultEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 5YXFnLdAqYbKHDLUfJGIemRR4xo42mnX
X-Proofpoint-GUID: 5YXFnLdAqYbKHDLUfJGIemRR4xo42mnX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX8VvyEWR1gsbc
 suW8Cg5jKAdqQlngRKcNcPDdLoGyQ+Yj26p5HeY5onOSV5XaGm7fyP+LQ1ok6vKmopWzatmxxKS
 myg5UfmgOzFQ8zrN2SZTYXDV1AOXxWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_203422_625310_13E361C5 
X-CRM114-Status: GOOD (  17.88  )
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
