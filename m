Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDA606A327
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 04:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BysfB3gs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPc+UhYk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JItk2vML
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YMQRC9F/vFXgQSDTnJobgd8GPU64JpjA6YpY5XKV4KI=; b=BysfB3gsS3u91/NSxjg6wacFj4
	DTfUynjowao5hRImF4Zr5+iNgAZUnABaiauups5A+2jtWuJqbmrZJL3+r28fdT6UEftU37YuqNPNa
	/ftR9cMgvlBfCUERvZHBXLqzVnii3F7Csnx2uvbESOXt8dY2b42atQObQ7cd9EBY7oJpZZ0bGjcGi
	NqfJX9hoveSakbN6vd9nQkJyr9o7RoEArCClyglg9V2OPn5kLA6B6o5ZEbqa5gsyjCwFsRJ7poi9m
	NTDhWjO7mbYEBwGF6+P3Af028y8ZgCOfcvoi7Cz7E/r89O/1cYg88+CeeuIN/J/2Ym0FLxI8ubE2l
	hOGDwSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkh-0000000FWC5-20Wd;
	Mon, 02 Nov 2026 04:34:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkd-0000000FW90-1AKY
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 04:34:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DE5r2433255
	for <opensbi@lists.infradead.org>; Mon, 2 Nov 2026 04:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/1n0jOYRInU
	BpuC3T8EVwJFWPAVhHI5NJMqip2YqFNo=; b=nPc+UhYkAKViLdLGnktQRh32gVO
	Nb8iZNzyb1i+aO8sLIy1iN1suJX+3Z1acLItNCSahTzbVAxu+HDPRdnLpNCBZZGf
	t0w0GPDCTpKIHNc9FXwzgGrKNLpm3byg9i5VO3OI/QTGnSGzOl8Dq/uWnCbs4b/v
	uT4PZuq8IT7PoY0CJVMwcQitOSpQeI7IcfD3IGAZotz95G0SpjjUhV9Ol3L8QVkw
	E+jsqiPIr635E1ZNGq0c88FQwWC98h2XsKskKSZmFBL3usUJ1Jtfn9rLG/QslsRl
	hm6KQXlvVLC5iKtHmaqhjqYOWSwkJpss6YRPoWqaFS5Dt9C0Rv7LR6U2M8g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka601mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 04:34:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a223755e4so11345694eec.0
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 20:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594069; x=1794198869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1n0jOYRInUBpuC3T8EVwJFWPAVhHI5NJMqip2YqFNo=;
        b=JItk2vMLmlwXnj//dxfYoTEOBuOqTebVXA4oBFJL892ZSKGBxhR4A5t8LEaej0jFx3
         RoTUl/NAeI51fxQZyuKDw5SgoUguyMK1/4r72UE4Garpd05D0R6Lobn9zuYxAn2JjsT9
         hHtlzBrpezeuERC4XgOnLsln4WDfLiOtNAZOo1HpLRVRx6z0lEbc2qAvpB2CfrusJ5ok
         5SHapfLx0ped9bWoUZHfeJEgWbeu9lzsrvjtPRQKL+DFxc8oci0cTXCQBJYrSlyNBZYy
         I3gLjBTXRz7LbzgUmhnCzZk3TbxGZe8zoOiFUUt86nhfDYjgtUuDAqC1Q0Risco6j9W2
         /W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594069; x=1794198869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1n0jOYRInUBpuC3T8EVwJFWPAVhHI5NJMqip2YqFNo=;
        b=AL5gDCOFeYCPLnh46sg4EMOcbcsmjCe0gi+jEYnYRP92IZcTo44eWMmqpC2QRltucw
         DkrJGy66gJ18exgCEs5Mv3UMFbuKI6vSJlNy825XnhW2LJq9bulKF4Bve3JTbRt5sh7w
         HGRV4lsl+s7a8REr2cOvfnCP/YhruJpxkXPqC5CSxfQupZSx28+w7FIsPBdFysqjmkgv
         BhmMVvmV/gazcQwrXLH1YJYSirdWhp1T2cBv0KwwostF0Bcl1xC/KMvLnjQxFUlZcxbg
         eNzau4qBKmWHSH8B8NdJypQqnxrpLMsJOd8VANyOJOa5oWkwJM3CcmhFUQzDzeFrirsX
         hXyA==
X-Gm-Message-State: AFq9FYLH/aB+JpbIKw08YNsy+VZsqrfOa8P0ymcS8T0yo1hGekqG616H
	eFhV/yrQRNvX7Y1oVyj4TOqFnc1eQ8ixHqeBVSlhAq7Urbn3lckGkOS+qjsahoM1AD8zzT+W54a
	mQbSqZ4mRYf0tgnj6VpbgGqQ+n/UpyP8WgR98oxj50VcfyJIp7GT3P+Q1UYT9+8D8k3CDRu3utg
	==
X-Gm-Gg: AYBFou2sBWa8MzY5c67L4LrbS0cIYC6E7BYjckvmRGzp2fIrKMbdFvgOHY697ui1HlU
	Fq3LIHw/+3xkZwH8PzE/ZzstAt7E8gpHxilmhjuWu/8ZEWpoEYqe4khwJxsSjBr9I2z6qme0cwv
	XhzZM1VtIeYg3T5GqNfAmp78G1Do2rYaxwfSTnGTfGu5ndZdt+hJS3OPRMHTlSFQCZzPCb0kskE
	3XbkPla1VYqwo+bUzmPxflhiZyG9/Z7CK5XbKYxqNFWZHmXi5Wss3nWzHpKAlUebHkX0bCTj2qU
	u7C3anoFn4QzWRwH84L0YX2dVt+zNXScEdAqNET/+xYotxRsJVSDGlN7BBK213nfC/rZcCXsQMx
	NV1LFncJRQpykDN9RtDi14S67NT4enw+mBhHfqa+jKyvtJN7OZDHFHPBOWgTcnl3DNWz2HK05y/
	8C3i0dxyV8RUM2BGnUHtI7L5iBRrLhXvJ5Je4WLxcRrQcOqQdbvAhz1dhNZXBIH4VTjdxLew==
X-Received: by 2002:a05:701b:418d:10b0:192:e5a8:6bae with SMTP id a92af1059eb24-1ac5e6f5eaemr14003260c88.40.1793594068985;
        Sun, 01 Nov 2026 20:34:28 -0800 (PST)
X-Received: by 2002:a05:701b:418d:10b0:192:e5a8:6bae with SMTP id a92af1059eb24-1ac5e6f5eaemr14003230c88.40.1793594068334;
        Sun, 01 Nov 2026 20:34:28 -0800 (PST)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm28014910c88.12.2026.11.01.20.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:34:27 -0800 (PST)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v7 6/6] lib: sbi: Initialize Smsd during coldboot
Date: Mon,  2 Nov 2026 10:03:57 +0530
Message-ID: <20261102043400.287938-7-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
References: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: caq74DxVYTLVkoYvwBh6v6Id6Tb7EPcI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfXxQDN16hdbXVM
 wDUPSzQoFJCc2jiNJy710A9Au/gwfGKvryHL5gweupRX4uqvMw8RumYK/+36Z5VagwvVTd+mdWZ
 qEdc+FK1FEpglERUN+YjRtFptjztgG4=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae812d6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nhWSGysQLHp8jdvb3aQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX4Nu/8VELBNhH
 wLg78UqmubvVKixPAi35m+aRnsFml7QJHMVvfWPDSE2DGgfUs7QU+2eDH9Q1sn5gTA7I6ircUK3
 plwTBgL/8sZOfv+XfDIqxhL1xdXdvjibz5u0tN/2a9tt2FQcgG3XfBeeiFUqQrG6dLlkjKRmcIS
 49VsmIIXfQjLsdRD8+LcJmFfrgMY8bAUn8fzhGVRFlyE41vul6y/UfIGGitUcCKPsniclTKRKKS
 UrmTxHskga8W+1RttVIr2N7YoyFKoYFaM14BrvJniHR28yJYGkNPIvg0PhfvlVPFL62/VRHXweZ
 RoogJ9BD/RLp7aUn70asw5bhjCwAWb97cD/lV2Rw8m/s1n3f+lRucFkQP74+wsEoTmfhIG7WA+I
 uTIV9v/IxR6xlLO350HAlEYrwDaUAxBXx6SGT8zIhOgH1zOP0XEtuCEdWW7XF2eeBWOaXSKq7TF
 Tn8HUB0cn4kBQ0gAcaQ==
X-Proofpoint-GUID: caq74DxVYTLVkoYvwBh6v6Id6Tb7EPcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_203431_433940_DDA919A2 
X-CRM114-Status: GOOD (  17.25  )
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
index 54191041a2a1..b15a2a93c8cd 100644
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
+		/* Smsd is optional. Continue if Smsd is not present. */
+		rc = sbi_mpt_init();
+		if (rc && rc != SBI_ENODEV)
+			return rc;
 	}
 
 	return sbi_hart_reinit(scratch);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280da61f..469c169c443f 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -33,7 +33,7 @@
 /* List of platform override modules generated at compile time */
 extern const struct fdt_driver *const platform_override_modules[];
 
-static u32 fw_platform_calculate_heap_size(u32 hart_count)
+static u32 fw_platform_calculate_heap_size(u32 hart_count, bool has_smsd)
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
+	 * MPT mode.
+	 */
+	if (has_smsd)
+		heap_size += 1024 * 1024;
+
 	return BIT_ALIGN(heap_size, HEAP_BASE_ALIGN);
 }
 
-static u32 fw_platform_get_heap_size(const void *fdt, u32 hart_count)
+static u32 fw_platform_get_heap_size(const void *fdt, u32 hart_count,
+				     bool has_smsd)
 {
 	int chosen_offset, config_offset, len;
 	const fdt32_t *val;
@@ -64,7 +75,7 @@ static u32 fw_platform_get_heap_size(const void *fdt, u32 hart_count)
 		return BIT_ALIGN(fdt32_to_cpu(*val), HEAP_BASE_ALIGN);
 
 default_config:
-	return fw_platform_calculate_heap_size(hart_count);
+	return fw_platform_calculate_heap_size(hart_count, has_smsd);
 }
 
 extern struct sbi_platform platform;
@@ -149,6 +160,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	int rc, root_offset, cpus_offset, cpu_offset, len;
 	unsigned long cbom_block_size = 0;
 	unsigned long tmp = 0;
+	bool has_smsd = false;
 
 	root_offset = fdt_path_offset(fdt, "/");
 	if (root_offset < 0)
@@ -177,6 +189,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 
 		generic_hart_index2id[hart_count++] = hartid;
 
+		if (fdt_cpu_has_extension(fdt, cpu_offset, SBI_HART_EXT_SMSD))
+			has_smsd = true;
+
 		rc = fdt_parse_cbom_block_size(fdt, cpu_offset, &tmp);
 		if (rc)
 			continue;
@@ -184,7 +199,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	}
 
 	platform.hart_count = hart_count;
-	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
+	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count, has_smsd);
 	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
 	platform.cbom_block_size = cbom_block_size;
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
