Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30731C88E75
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 03:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmbCi9Hyg5AzMR9/PIGQ6I9Ym+7H91NQF7e7bczXAk0=; b=cm5Pv/Dg+xcvJW
	SbSikNhLPvWYr3Bf16JGrGN66tJV9K66NJKwDmrgftvVDQAIBUSmo99jG2AvCFNFxuSPXvxOkPf0n
	8bZn15pelaLmFVxd1i/hNYDyPbOdQ50pNvVpvCYIgXUU6AcfWMiRijgqOtIwaoxHWsDbsRodrYEy7
	SpsjFEYR6Fq/bk0yGY/JkzkIbT9VeIMi+oIBnnQN8JqaOylX3x0JBJKiuNozr4n9kn25Ceaxc3IXE
	8trzqTVwqC2Bty5bNHj0HyT8QSnfAana1ItEofhVRD3efyDFT0PDSIJCOcfnOE1Brsb4ZNhikkoce
	9FBloarwiGAkfDPisL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzY-0000000DMsR-1QNv;
	Fri, 18 Sep 2026 03:10:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzW-0000000DMrZ-1mvU
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 03:10:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UjFC3761693
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1dbKmaDnJvX
	+/WxrJHlGhthrrmdJ64YhjGHA/VeuNjc=; b=bx5nZSwYyYpLaBcmGHnPUsY1qac
	/6v92K4MWdPT/yWGoPBPqdeN0CwHNnk5WCIvIq62E92TxXxcRIfqPdYIq1nXgg+8
	GRIo6+xP4qfiFF2ELqnrNas5ZWLTFCbIQOZtPBIChQbQbScdC25/ZTylcv/v3K43
	gqwgBi65hqFR/yJ5Ua0B2fZ/9XFf5QHNhb+n1GZa3Oosk5SGOtXo3fFea6udx5RS
	vKp4om1OE3uVGwXALFJSQ+N4/haKMUkpRES0AiTLzOCWY6pmz6x/pXBs8aFKRKgM
	jW9Pv+GlSTPaggr0YVwJFkVoaEa9+wXfc45NCPWJ3tkeB0tiP0turfIbpXQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqe9tuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so447039a91.2
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 20:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789701020; x=1790305820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dbKmaDnJvX+/WxrJHlGhthrrmdJ64YhjGHA/VeuNjc=;
        b=ap4oB3/nHH977r89Kpn+0swdPf0xtrb2r/vUAs/aU7WdQhYSWNGkwepLex+h4F11bj
         u2he4ZPcMaXIhJBhG9Dc5vnwZwvFLPrvPL4aFaHvh0FnepHwHZoJTqrIiZQreQA1ASY8
         VIzEa/9n47bTof5MCmtiXdBXpYu27LNxVBDCECgmNMro9oNKSmbftzwKLExJSLl2BO/J
         3T1KGsvTrw/kbfYHFjVc0Os6ec2i3zib77X16KZ6myw4/8NiQ5++mf8E6S6VpRWJiSma
         uAl7+qSvOrp3V14Ywn16Y8fKEw8cKD+JCkNS9dyN4ryC+6/p3InQD7bOlBeOqSMUFXaT
         aBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701020; x=1790305820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dbKmaDnJvX+/WxrJHlGhthrrmdJ64YhjGHA/VeuNjc=;
        b=lLmTU6wl2gW7Eevig66c1ODcghZaLCuUYL9HOEiyo7mGmFgxqp3rrKrLugL58+eQaw
         oS3bruNc1il1M2PFDKiHDjo58wjR2UjItq/pVgLX5gMrf1inREEx3YNlDaJdYqb2t2Id
         4JSGCoGP3LMbS38HKGz644haWWjDC4XdBeXo8wHNXjufUfNzmCfImTEf0MMjnlaEZlYO
         37ZF20p/m0fQEEZkxuimYUttrJfC9+3yf6xvm+juB2FUUQsbYkK7P3fWdnXFxbezMI4V
         4y2KSfJdrcDajTsYDybIQIC9wAbXTrn/wKvg70JEx6J8PT7bsXMR8ZBz7nqM8xYOkeTW
         MvPg==
X-Gm-Message-State: AFuF++nzHl9z5SHo4KEvfJ2SbwfmNTDQ7ox0vK+iWVZDbevoxakD38Bb
	vKaI6IUeNoPGIr5VN/Da244edb0Ea8OYyIKYEjVafdvEFm7CVKYBOfZ1nqt/my+A43WFHIgRmp1
	fXpzEFYTNHs9hG3Q74QHWWMvxFBMl7zxCgkjbxLwKsCCRCG7S9+Jok0i7eomYl/BEei8BstWoIA
	==
X-Gm-Gg: AYBFou0ajpW5sUrfqv6A6bGI/dCqtw9EahequPic090DZnxlzIJCC23paV2HQea+eBC
	GLhMN4wYvWOcASVzKYnWURHdwEu2YvX9AP72NXVItCGfIrc1n4z2DYWmxJ3BAFcrPgsjmrd8dAZ
	zdCyF6nDUtND/VD+627dTX9tegCR6II/TK08+PoBDgOanOCYSqkAajzGxB6+/bqbeRECv0l4Z9o
	kJWItNdkOb6az1iSgCIkFU9IPTf2qXVcjL98S23UVXwdvKHjO6HE4gKy26t/gjHBN5HtzvbDG5h
	NBrPgQM6sKGCaqDKOSIsCt4cTy0d2Msf3r5EEnfhXKoogfOfPAp6+omoBq9Q2QBkgwQcmo5Iyaz
	Gs/sbP5tLZj/LlkFMuKDJi3YWfaSD2hOqd6gi/EtTK6mRRSGdLV+FhXdnp2cpARPfmfjSBfHgXf
	o0RidlluEoANq5E+nbZuEp
X-Received: by 2002:a17:90b:2690:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-39e54f47948mr2631828a91.33.1789701020467;
        Thu, 17 Sep 2026 20:10:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2690:b0:39e:4c80:f682 with SMTP id 98e67ed59e1d1-39e54f47948mr2631765a91.33.1789701020012;
        Thu, 17 Sep 2026 20:10:20 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4cf8sm846468c88.1.2026.09.17.20.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:10:18 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [RFC PATCH v5 4/4] lib: sbi: Initialize SMMPT during coldboot
Date: Fri, 18 Sep 2026 08:39:53 +0530
Message-ID: <20260918030955.3902993-5-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: tD-SxQZ_boG3wusPcYcTP0aeI-7rYt8M
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aacab9d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RKe48KprB3DBmAy2IaYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: tD-SxQZ_boG3wusPcYcTP0aeI-7rYt8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfX8k/rpe1ERAiQ
 wqEapq+5osNyqJDXRJp+jlxTuRLTnXtHny/A9/CSWQjliYKWZN2EUVioADqkycsqaRgmDcRJMhc
 uqtfkdRB1zQemjDo5jUFPldjkbcOc3IPLzCDdea0cnREkQji40gsxGwMbhgmZ0ehF5qU2DMBuA1
 vgpx4U3nEv5Zs0nYku4Ij3Pqsd6l3s0hizPlz03WPEopRmLf2KtaKZ2Uk3yE5EmZyBCoQS0GG/W
 MqG4Tc/8Kir8P8uWLTumUuBf+CBqEnZcB9THeKHoDb3jgVJDQzncXvgqlab4He1SLbKtG2YiQYT
 uwzx+sB9Vy3Ol8CRjzfbNxX77kAXi8BPXgNzA2pSwhOX0qIQmSfudt+D8Y70m7afcCML3cmaUeP
 sHnKJIwKEDNhVHg9OsvFP+jBUrNBJSffrWEAAgeMBFf70r3A6GryNW3ZYsf/ObyQTPLsAOaaU9p
 WTKDEE21DRYGRr2AidQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfX9hhHoHB9Bt9E
 y9PdgZkMw8qA5T9QOlrgV+l1Sxf6K01iOS8818y4JKof4WAJdYI+QdsxjRIYgwdX5hrSYlhigS/
 J4IoSUxyPWQsjQDQuSSBjbEq4CvoRRM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_201022_578542_DABDC0FE 
X-CRM114-Status: GOOD (  13.82  )
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
 lib/sbi/sbi_hart.c          |  6 ++++++
 platform/generic/platform.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4261fea8..f95ee5d1 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -16,6 +16,7 @@
 #include <sbi/sbi_csr_detect.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_mpt.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_pmu.h>
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
index 1df0280d..b9f5bb2a 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -30,6 +30,8 @@
 #include <sbi_utils/serial/semihosting.h>
 #include <sbi_utils/timer/fdt_timer.h>
 
+#define SBI_PLATFORM_MPT_HEAP		1048576		/* 1 MiB */
+
 /* List of platform override modules generated at compile time */
 extern const struct fdt_driver *const platform_override_modules[];
 
@@ -42,6 +44,15 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
 	/* For TLB fifo */
 	heap_size += SBI_TLB_INFO_SIZE * (hart_count) * (hart_count);
 
+	/*
+	 * MPT table budget
+	 * 1 MiB memory for MPT allocated currently.
+	 *
+	 * TODO: Need better way to get the memory budget based on active
+	 * SMMPT mode.
+	 */
+	heap_size += SBI_PLATFORM_MPT_HEAP;
+
 	return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
 }
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
