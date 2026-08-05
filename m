Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98019C55ABA
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcwkNWP8TDn8tE00OJ7DeOe2er/qNlG9MJUxGgtriuk=; b=aT1W7MfTL3djqB
	GPf2Y8yiZaeHSmQvLCpCrt1VLKPAdL9uUUgsUly6jugQZ112b+UD41lfjaMNjv2uo33OB3cNOVx+1
	/vbyKc+8fZpnmDxojjVeWw+va6c9fVMlrZJ7M++Lt4M287PRLfKq9oKDsbxhDLICSyz1W4wL07Fr0
	flrxXBG6MOOrBGpUBdnXTuwjni92pr4I/7AcNxLvNIs0oMaIu5AW8vgaHM67S/hSPpR8ktJQ4hO4O
	mN+4v/NfSPBM6353gVPYkdSM1fm3XSrdtbMQFHyCjPAlt7EqjN+HzNnua3Pynh3SKTBj4Tq+QpaWj
	d5e/baRY4BEgNCnHgahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgW7-00000004P3D-3A1T;
	Wed, 05 Aug 2026 18:39:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgW4-00000004P1B-2Fz9
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 18:39:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSHuK3889901
	for <opensbi@lists.infradead.org>; Wed, 5 Aug 2026 18:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6aIR7YJ9JmD
	8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=; b=kqd1hOHfkfX7HliksxE5tM5Blwx
	7u6iyF7JltMhO8SQLs7jTERmpyPrJiIbP27TKmkpz5RjD5GEScwWzQk+Fwsq6VId
	rUmHeaY7jl344zWjkqEjh4TTvtZPTZ8AvY9Nx8Q9GPWM3IJERcflg4K09A7StgZ8
	69SHSuKRoZpy1bDTtagsuVzVcZ0piNZBP8lFv+Km7QSPuHIPolR2ERgskSWk6e5i
	N/aONTU68sBX8alqmLkFP8xodqQ0G7rYsONon3NsfEijFF4NreiIw7UCzug0gthJ
	edeWM5/X0xauc2omhtYRjEuz0MLM1sBRV9VR8KTpKvDBpLiIpz5aZW5pzPg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14wayvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 18:38:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9c26587e67so169221a12.0
        for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 11:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785955139; x=1786559939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aIR7YJ9JmD8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=;
        b=TWHfzHO51bRaKIanVDowFjbZQFZ3GZaqxa/f1GYGlwp044jXT1xHjCwtz7cU6WWyg7
         6SFuiasBUFNvxo00MWVJiv6l3Z+HsOsxWmofl9oSwXnL14aqPGUoCq3kHnMl0vTKHEzd
         99lIhHaEoYqfFoUeOC5S6UFvXLOqvMGjjf19b+E6D0VMIdEIbi9RdkufOICQV8fud7aA
         O0d27PyW/xaY2uZvqYrq1Ob19v+YkAkUW8mB9SuI6Rt+bESLDOgHc1vVuSsK8MChS8hG
         Zr16IQD3dIzge9X0HqX3qw/hX39D1iYlHQ97/DzMXRXv9ILWSuQ1VlcH9Q2SzyrZ5Gqd
         oZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955139; x=1786559939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6aIR7YJ9JmD8cN4dOklz/Jn1yRyyoz+VGD5bB5Cnbio=;
        b=GnzKvVVCRjLT1AqGBNkuvpf3JYbHrbws9nNHa+ddKBtS0CusGkNK9l6PngVgIuQL2u
         iB8oBNbPS2FZdzerBoVhPzovdqH1oiCnxlJoVf1FVxQEk7lccGRxYjsyGEShlluHiy/c
         Yuy99kcaY1O+FRqWb9Hld4dgvSziLEjIinBOABY2phpXTQawSL7W7fMvJPzl7zRgnrpt
         gWWdI+tSFMP5l0fMgoxQL3rHsAfGUCQHMI+WGwfICCnohuitFvY8bUxxNC1Sri8iiMCz
         2vLgBTSblkd1yM3t2Tp7B/tj11bBIYyRGEpa/ji+ZQ+EIUE0Z4Dfu7aG8gIXuMM0KwzT
         wIoQ==
X-Gm-Message-State: AOJu0Yz14VgWjw/e1dusH23ZZ1J+CTAfvHmxvz0q1kTyU0y04tBPBKxr
	TTTpAgqQmtlujJvwJVKvghrA8lRgPi/AyLqrnuJ7rMfL08iuf8vWJPglbuuUpgJJi7+G8ORP/hv
	Q7MqLHchlyHqti5a1S0NfORuI7wDTWh1h+Fq4iJt0z3qMW+47mpnvZzZWF+2+V9JdMlr0/ZpsCQ
	==
X-Gm-Gg: AR+sD12MM2N1nuJEkw0NwsLXHjQq01QjzKqzfia0RgzaRbck00MDY79HZLun0K3q6TJ
	X/B0BIsWAQFZdkTvCcZfyLXpODt7vJ1L5qBeEa6r16iqVRTkdHWYUREJMge6wGghxObDAac5rcf
	jSZCzDQT4yGiBBsFfWPdRhk9LKa6c37YwsQdW8wJXDZObfvPaC1pphAxf4x1KhJKPDhT4I7uCHE
	AXrpeoIvuzp72+PE3RGjL6fOt7SdRFS16ZUi7asgJTTugOuTogE1R+JzMhMXn4XWW2QH8X8VBkt
	8s9W47OFSt7FN/mmSIIFaU+Ej1C0V2haot3n+rSBxmLxDO0XD6dnikzpLIu4CncznAq++cu6IFm
	U6VYtxPDOBQyzR9aFdRmOT3zZKbovvYPjQjgUsF7/3tdaPJqWxjRMQzDr5+0k9JrTdOknhEHDpR
	93BJDlHXYW06ZPRjk+ieqw
X-Received: by 2002:a05:6a21:9cc8:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3cb9c291f2bmr1424605637.18.1785955138525;
        Wed, 05 Aug 2026 11:38:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:9cc8:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3cb9c291f2bmr1424543637.18.1785955138053;
        Wed, 05 Aug 2026 11:38:58 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm17636943eec.12.2026.08.05.11.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:38:56 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v3 4/5] platform/generic: Initialise MPT at boot
Date: Thu,  6 Aug 2026 00:08:37 +0530
Message-ID: <20260805183839.2576691-5-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfXw4Un8bkc5ADG
 FnAHL4V9wrt5JbaItRgEOQE58r2AjMCL40G9xtkJQC6GEur2hpfJNXbt88IF7JL1MoXINaPme2E
 HECxgbk3e1QTpNTMhFzvpct+wkv6Iaw=
X-Proofpoint-ORIG-GUID: It5DWfU9Z4bHJY3Hd_Ts-yOIc-G6pKkn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX6pkyTWtwY+AI
 dbtAU0lETru4ZjsIgivfIbT5+AVPVO9RKcI6npdTsh3j3uULvOzVjAKRuy/FXxQ8ibjIXPESXm9
 qDM1+YrNpT+F9V8m8SGiu70lz9/CGQuqf7CgZ4tg5NFAQSc3GatMJ+JPh7aNyoTNSxAWawEQVaW
 H0FxJDz68ihhIfYo36BiOtE5OASgqC2tKn/myFd7GmrcPYI7yBlcWaDqbvYPJn4oClcU07HEWu9
 VrcPz0Q5ixZZt/RRD4m/wV3LuhS22wRfkwdCtNjTY7cbH/RNZWF2PsMOTGdJIXc+sZx7dbOQqbi
 mM8ehwrTM3L2ZdADj04KZdzM5E0HLclFDmAeK4oOuGvCR2xoGQTbN9g3LkGR9iVKJgNI23Km26S
 XWenWhaloG2R5gutjcmQzWZtYd6qOXJhPufiurEw/ikeG42kZlJoG6/BNWFbE23MEWkzZ/J+R0G
 bM5HNebU1hhEur0xe5Q==
X-Proofpoint-GUID: It5DWfU9Z4bHJY3Hd_Ts-yOIc-G6pKkn
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a738343 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0mU-SnhwxBcTv7J85KcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_113900_689878_3994E9BA 
X-CRM114-Status: GOOD (  18.00  )
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
