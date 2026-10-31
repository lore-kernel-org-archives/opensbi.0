Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19588606A31A
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cStf6Hdn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RCLXDh65;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVQmQIgy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YGKqghsvxew8b28cIKt+Ec7f2OYYKdj/Rpo/v1Nn5Vs=; b=cStf6Hdn3XS6TDNWMJrdoH0vsy
	AmvGRggmSr8bDDsgr3hwlk0sLK0+7t2GWG+Kqc1vAgg545x2XmRQXpy6lALUKjL5/YXG2sS1JU8v3
	SHCb8xCAa0lxdgCxC6PLD7iMOLOSyfOy00EmuLtot5lYhqTKP5r+/DWHFXQ4Do+diHkjSn7Orgbnj
	V5/YrYtoPq2PPOnufAKSHLBPvL1JK8kiwAGy3JY9lI08b/9Le+18QHEEYZd2XLX6H0+rFQ7C+AS3K
	xJu0MgL3aeu/2pmyUhbMaMWYWUj/+6piJd68sbDLKL8UbPyQThw8s1VrSXa0ilJLuLFu0+BngwrVd
	vq50EFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8C9-0000000DIxc-43Sx;
	Sat, 31 Oct 2026 12:28:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8C7-0000000DIwW-2ScF
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:28:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4a5nR2142556
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0dpiNmOrWj4
	5nhtAth4Rk7h4WQ9ImTq3xAB2QehWGAQ=; b=RCLXDh658YIHkqFB5y18b+pEtgm
	nVQkcrB5MfdnEX/CfbM/4RZW4PKitVdv79VeBDPMCG5W3TXn5WAOG9GV/iaU+zh7
	I7SKSxCqK+Nww2LlMXM11pE6mCw6AK3mA6D4MjImIDR3Ix7CrnMa4hFepqrkLaMH
	lYNt9DSx2i6XzMu8/bvmEaxx2y+E5EMHzm6+knmyHXaOvWqZlJawXK9kIZkfFkK0
	1w7Vmyc0Ets81YJsI6EtTX97mN1yB2ou1Y8LVNyuVwt7BtZ2TOLZFOaWw8pywnMy
	O/BMaF56GnNfj8EV5+Kpekyq6xO15GlR7ynVYjmH+NWo/j+ZhUcpJRnvvBQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsd4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3604430eec.1
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449702; x=1794054502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dpiNmOrWj45nhtAth4Rk7h4WQ9ImTq3xAB2QehWGAQ=;
        b=LVQmQIgylDTe34T9Jvlw8gEl/7xjtUr/ya6ruBZXIGPzpo/kOhzg4pGl5BCRiZGkWd
         RPkPTHg8fukPsSKWYj8CwRq1vdKKcILF/jdlO21wQ+C1pqUEbQKwQJLBvZrsNdbCHf8w
         6NLhEVIcm1y6obDdSn9id/S5GbpC8LnzyAqbiv7WK73nDTNEe1yA/BV6grgtTQaCohks
         9O8x+mIrc+qEEg3oh/50l7DjgIsNxaaxU8Qa0xcwebtpIH08aD12RHWUDvTkjIJBepdd
         e52NfQf6e0T7uLwgGKwPMz9etw8PajiwLXavZapsILMMOkkVOLGQ+PjWgO8C+PYvZJdQ
         Nw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449702; x=1794054502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0dpiNmOrWj45nhtAth4Rk7h4WQ9ImTq3xAB2QehWGAQ=;
        b=HjXx9yjPHQgXWpeEK1pPGzXX6JOdPSOipW5ULZTdc/tLZrlFpCYTGlDGIXiqex4wNs
         ms/72EZkb2uFgTAzPyuuwsmHvtJ2ycyjs8axeQKMPD1gjdxEDgVep+C1mkA1PeN6ciZ1
         RAM15XCyRtSdcaKCtoB9IFPf1zPI3pJfDdXJR+WOejXchhx+QghrzLi3dm6GT8tQL4w1
         au/WPDF/GpodvVV2xyoXDVtCYDuneZDC3rJLRvzhLAP2c4eCgC7zBFz3jHmPQqNEI6Kh
         5f4xgL4VPRf2tV8AhRPR6sdvddxNQDBQmu+UYKVsGb7w0vDarQYqLohfDJIpEWxxQ85n
         h8QA==
X-Gm-Message-State: AFq9FYKWCVwZLs0yDtFlyBrc8S2w6jq9yo9gVKH4Wl/xBVkb+JhaSRu5
	jvUk0v3WrrpnI6GYse05+NgD8W5p5ehTuTjksxbD8xqTViAw05ewTAHV1n8CJ/cmSwjXtgNvpBN
	icbsGzhkyzFLZ+zkbQb/SmR1wyx7QvCLvidunzYiZSsyl+PRGnP43hksQXcv1lIgOwiLBFSglzg
	==
X-Gm-Gg: AYBFou3GH5qh9SwGD5XpUEI7X8gkPeKzB5dnXRDKMUR+w3wp2C/X53DYsisajdtMFmf
	/fsbAxxv8PbSU1ww0XM9rR4FYcjzLzoRjCxpV4+e5PhXmtwiwgQQEuz5sUaPksFnSCkkm9N2yTS
	g2so4UMix2aXmB5Xhh5268ns10oDAiadqYchBKdA1Czogb11gaWHoiyLjg+12U/jv/nvsepVfVT
	W2lKZnC8mGrNk5xCh4VQtRiiQANTIQgEIvKL9KWtW8Z3b3PQfdn2T+WKXv+4Gy/+D/FrMb6xaLH
	I/GCMA9Ox3LJfPbk7yPLDSkRMc/hCsQmpzqVT2fGpWHLm0H88WMMDC4PoDAjT11uSsXIEAWiR62
	z2tQfcYJmBG6YuFe3USlLumUQ04LsuAHK2z1DCciBtA/jBLiYEWHvFRk6EEUwCq4dU6TNtbGyId
	XQ/YVQlEsfH3U6FZAsDJw5VdBBZRbIgtcc8QVsPXwiAZ9j8fDgeftwrSWi/e0f6VwtFxVm
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr8578178eec.41.1793449702092;
        Sat, 31 Oct 2026 05:28:22 -0700 (PDT)
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr8578135eec.41.1793449701517;
        Sat, 31 Oct 2026 05:28:21 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm15515168eec.17.2026.10.31.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:28:21 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v6 6/6] lib: sbi: Initialize Smsd during coldboot
Date: Sat, 31 Oct 2026 17:57:55 +0530
Message-ID: <20261031122757.2572125-7-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
References: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX4qIzeQxeUQvG
 G9j4UPm9eeGoGkhLD+fiBwVTAvbZhx9kYbolKmkM98ZGNBr0HQs/vSo0byfvK60jXi2NL4cqYC5
 GwFwb3wXzIWEsL/t99VVvH5KhW5oKwc=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae5dee7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YNo4ulahfpTerlih3WUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: L9ah65r9afm6YqoE7OUFmcxRW9-AWFUj
X-Proofpoint-ORIG-GUID: L9ah65r9afm6YqoE7OUFmcxRW9-AWFUj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX64lpGqx1Sn2i
 PZGYtzZ3i4ftVvMgjeFN7Q+FnwAPMtzDIHCIJ3PI3JF7BWaMyR7jNps6ZGOohlVafutE5jYAA0V
 3BArkYQgBMcEAKE6TFnjGainhO0KVer9MIVSvcCmBrIt4ACspouNKQpeyCgUBAlXn9om8taApTj
 xb8P81o01byPyYz6lZzmT7NN6PlrQOY1+5FgSGIO1S2W0KueKx8s+PrZavaCaBKvk4qX2oytYkh
 h2+zOMvKlarzjshiia73Eyo1lBRCA8Gu/vN2OjNhiinN3XbLhVAmkueLCokkQViNdJrc7NH8SAi
 tJ4XxzHxct3lHANXdXUVQgv2ZQ3thPMPVdmyjWsesXhsuBSh4Xgp+qE064mdW22G87ruEuQBPQS
 flElaKGPBMed7OAJ/tP/bTe8cSBwg3jwlZhf5yfNPhWqvNj3aUNwd9GI5bU0hTODvmO6qO3ffOY
 oyDOhWyoUfjq288v7vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_052823_627480_6556796A 
X-CRM114-Status: GOOD (  15.73  )
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

Call sbi_mpt_init() function from coldboot path of
sbi_hart_init() to initialize the Smsd core. It will
create and the MPT tables for each SBI domain and maps
its memregions with appropriate permissions in MPT tables.

Also each MPT table requires to memory to install tables
so reserve more space in heap for MPT tables

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/sbi/sbi_hart.c          |  6 ++++++
 platform/generic/platform.c | 23 +++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index b80a13d16670..d6e53e618677 100644
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
@@ -733,6 +734,11 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
index 1df0280da61f..949e41bd95ca 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -33,7 +33,7 @@
 /* List of platform override modules generated at compile time */
 extern const struct fdt_driver *const platform_override_modules[];
 
-static u32 fw_platform_calculate_heap_size(u32 hart_count)
+static u32 fw_platform_calculate_heap_size(u32 hart_count, bool has_smmpt)
 {
 	u32 heap_size;
 
@@ -42,10 +42,21 @@ static u32 fw_platform_calculate_heap_size(u32 hart_count)
 	/* For TLB fifo */
 	heap_size += SBI_TLB_INFO_SIZE * (hart_count) * (hart_count);
 
+	/*
+	 * MPT table budget, only when a hart implements Smsd.
+	 * 1 MiB memory for MPT allocated currently.
+	 *
+	 * TODO: Need better way to get the memory budget based on active
+	 * SMMPT mode.
+	 */
+	if (has_smmpt)
+		heap_size += 1024 * 1024;
+
 	return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
 }
 
-static u32 fw_platform_get_heap_size(const void *fdt, u32 hart_count)
+static u32 fw_platform_get_heap_size(const void *fdt, u32 hart_count,
+				     bool has_smmpt)
 {
 	int chosen_offset, config_offset, len;
 	const fdt32_t *val;
@@ -64,7 +75,7 @@ static u32 fw_platform_get_heap_size(const void *fdt, u32 hart_count)
 		return BIT_ALIGN(fdt32_to_cpu(*val), HEAP_BASE_ALIGN);
 
 default_config:
-	return fw_platform_calculate_heap_size(hart_count);
+	return fw_platform_calculate_heap_size(hart_count, has_smmpt);
 }
 
 extern struct sbi_platform platform;
@@ -149,6 +160,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	int rc, root_offset, cpus_offset, cpu_offset, len;
 	unsigned long cbom_block_size = 0;
 	unsigned long tmp = 0;
+	bool has_smmpt = false;
 
 	root_offset = fdt_path_offset(fdt, "/");
 	if (root_offset < 0)
@@ -177,6 +189,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 		generic_hart_index2id[hart_count++] = hartid;
 
+		if (fdt_cpu_has_extension(fdt, cpu_offset, SBI_HART_EXT_SMSD))
+			has_smmpt = true;
+
 		rc = fdt_parse_cbom_block_size(fdt, cpu_offset, &tmp);
 		if (rc)
 			continue;
@@ -184,7 +199,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	}
 
 	platform.hart_count = hart_count;
-	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
+	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count, has_smmpt);
 	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
 	platform.cbom_block_size = cbom_block_size;
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
