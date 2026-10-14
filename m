Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA2CCC6B1A
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEOFw5UzmZnMcWG6+EKJX20r2tO6g4NBHuDzX6HWdNc=; b=pp19BvEh9TRsFT
	2otYwaDrBn2BVy1DeYGxoCVKcrNdaE2WZTuUYuD1ToaD1FDywIhslEMBwMkJAEWtCYA/PD8r8Kzg6
	/hQnY1NjbP6DklJw5OePAeVwOz2aw6UzEwpR0ZKHzBHL+7FdW8FE6325qT1VRbeNi8OPpOetRynkI
	Dir7SmHErZyRUXQPH6VX3m6hbWzwtRIT5psNXp6IJuRqIJ8ji0slNHNhytUw6AnROrQVrgqCETYMT
	SYkm80cx/R7I2aIIQZ+QTynWq4JzCfFXJExYNFvMi+qAdi7cjT973InOjeOcVJoRILhnAY8bl/TYE
	97GRlTFPFFIzmXoPKkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCS-0000000FLQy-2ElJ;
	Wed, 14 Oct 2026 11:31:12 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCO-0000000FLND-13je
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:09 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-35834f72d94so7135032eec.0
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977467; x=1792582267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ifbtjr9ZINJVilmF15ghAWXoi2rb9yojhWtXya0tTSY=;
        b=LZ9JZdkrPLzKVH7xOZf102/2RYeWwrR9s9UjEKMBULbAVxhuY0+m6GmYQGS3zwG81u
         /CVsrC1I0QDasggMnpBkSJH7t5KlupvWnrxVeZ6YOH4tIsZpFS4cYNFjad/Nu5bDIsB8
         J7UxaGuPo649P/gzfuYzQjPNUwu2zRvVdETRS4wJ+YbNk6S7s9KbTYDEL5V2VcWcjGhb
         JvSR88kWtHRAun617nTLAvH12BzAtBYgrKJyCEMsZeBnK8VrolcD5tuwx4fDemArsNBx
         PuY1WhY99qCV8JP3SHzvQELLOu/ilskMx6mVPpzl0SiqODWCNFYZdhCGdIt8bzmhAZiq
         TRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977467; x=1792582267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ifbtjr9ZINJVilmF15ghAWXoi2rb9yojhWtXya0tTSY=;
        b=JO8WoSDeLED9UbUHIDrGdXhfxCZukIjUHzWX09IdXuIVdd6WAwCTnEPiB0X0e/5Nui
         3sB3cURDav34pel0OFpJS6vUkxjtbPFuLHSt6GaPvNjux2k7krL+b77MTlYQX7Z3tZi/
         o4f6cpdcoXNUJEIieS5gUG183ZLBrzHVJhV+efQ8LKBwPohmcB6wejzP3HGeo/Buh/ph
         DD3oDprkd2V8v/Ff/C2bsIFbFyVkewm2Q/BFbWByyiTWNl9WlYA5OY1vdQ0EvpgDob55
         ekstsoLevDlin+iTDX28fO/FU0WjJVH1Hh1gfABAMpejCBQ9t8OivYKCidpgps+AvXFK
         +8VQ==
X-Gm-Message-State: AFq9FYLbjm7r9OfGkD+dMjajoc4yrixzAOIJCnA0aHzMgcZnb8Mnqz0G
	HdKEh/8RWtMWlWIlSuLWjrk6Lpbomqgti1+FXxzUI20TX7uzi3RSeRonKrOZwSmJwUX4kMOkOw1
	jJ6wWaM+1BjU3EQ8lkT9gt3WOrxMVPx/CRVjDy0r1fo6H/0S4pYfxE/o6KySyWsuCXTnZB98Jsw
	0BIbG2BxSUQ08BMoCfPTQPcHEX/13duZKss78vDKCPPQnoXGEANrEd95Y=
X-Gm-Gg: AYBFou38751iPWXB3mv926WKsbLLBDD7I4U7Z22XzSvj3apfUMgzULkyObfzIqcAMUP
	meL/48YcTs9acJnObCIH1QYMB3zfjDWNnY6C9oS/EhOgc8bYP8YSf4Jnbj3iQjv7+F3tQuFuXuA
	s2g73GC7O+0j20YFHYrIx2fVhRjojI7R/AzE4OFa2TjGLdNr1UdK8bbZXK4Jtm+RKkj5tHvHsXw
	tyhuRBDRsHOV1RPtFq547h34xygepMKwyM2Y4WkZ4n/DRUrccY9DdPq3jrcqNV6KOBzwda2k53O
	AJvwrTO7x0hu9Y8B+UdiKDt9jYB7tON/iZokXNijzqn7xHA+XotyRxMqHwLNwT7roOSWFn1FsXe
	RyQ7YF6Kc9/8Degk6MtqDhpT0Pxa7JjYm0j8WD4pPRNAKkwDQdelhCoA1EcQz7ATwympxLUFR4U
	tukDseVSpyWao69gJzwDIEtvVqNoxt8zNDGN3QIZEuXjTEIRzjzXGQBidAUSm8yFTDZdvzKmE5A
	xRih9oZzRpQhNmSu4Cg
X-Received: by 2002:a05:7022:eb44:10b0:168:6ad8:e89e with SMTP id a92af1059eb24-17dc865cadamr2445375c88.45.1791977466748;
        Wed, 14 Oct 2026 04:31:06 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:06 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 4/7] lib: utils/fdt: Cache CPU information from the DT
Date: Wed, 14 Oct 2026 04:30:21 -0700
Message-ID: <20261014113100.2192229-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014113100.2192229-1-samuel.holland@sifive.com>
References: <20261014113100.2192229-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043108_323822_CFD57392 
X-CRM114-Status: GOOD (  22.82  )
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

Looking up and parsing the CPU nodes in the DT is extremely expensive.
Functions like fdt_node_offset_by_phandle() and fdt_parent_offset() must
walk the entire FDT structure because they are a backward lookup. Since
the offsets and phandles of the CPU and interrupt controller DT nodes
are used in several places in OpenSBI, we can significantly speed up
cold boot by caching the information in the scratch area. On the HiFive
Premier P550 board, using this cache reduced boot time by 33%.

Any platform that wants to use the cached information (for example in
fdt_parse_isa_extensions_all_harts()) must first call fdt_cpu_init().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Check fdt_cached_offsets_valid() before returning cached FDT offsets
 - Document that fdt_cpu_hartindex_to_offset() cannot be used in fixups
 - Move fdt_cpu_init() call to generic_extensions_init()

Changes in v2:
 - Rename for_each_hartindex() to sbi_for_each_hartindex()

 include/sbi_utils/fdt/fdt_cpu.h |  60 ++++++++++++++++
 lib/utils/fdt/fdt_cpu.c         | 118 ++++++++++++++++++++++++++++++++
 lib/utils/fdt/objects.mk        |   1 +
 platform/generic/platform.c     |  10 ++-
 4 files changed, 188 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi_utils/fdt/fdt_cpu.h
 create mode 100644 lib/utils/fdt/fdt_cpu.c

diff --git a/include/sbi_utils/fdt/fdt_cpu.h b/include/sbi_utils/fdt/fdt_cpu.h
new file mode 100644
index 00000000..84ab45b3
--- /dev/null
+++ b/include/sbi_utils/fdt/fdt_cpu.h
@@ -0,0 +1,60 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * fdt_cpu.h - Efficient access to CPU information from the devicetree.
+ *
+ * Copyright (c) 2025-2026 SiFive
+ */
+
+#ifndef __FDT_CPU_H__
+#define __FDT_CPU_H__
+
+#include <sbi/sbi_types.h>
+
+/**
+ * Look up the DT node offset for a given hart
+ *
+ * This function cannot be called from DT fixup code, as the cached node offset
+ * may not be valid at that time.
+ *
+ * @param hartindex a valid hart index
+ *
+ * @return the node offset in the FDT, or a negative error code on failure
+ */
+int fdt_cpu_hartindex_to_offset(u32 hartindex);
+
+/**
+ * Look up the hart index for a given CPU DT node phandle
+ *
+ * @param phandle the phandle of the CPU node
+ *
+ * @return the hart index, or an invalid hart index on failure
+ */
+u32 fdt_cpu_phandle_to_hartindex(u32 phandle);
+
+/**
+ * Look up the hart index for a given CPU interrupt controller DT node phandle
+ *
+ * @param phandle the phandle of the CPU interrupt controller node
+ *
+ * @return the hart index, or an invalid hart index on failure
+ */
+u32 fdt_cpu_intc_phandle_to_hartindex(u32 phandle);
+
+/**
+ * Get the CPU timebase frequency
+ *
+ * @return the timebase frequency in Hertz if known, or else 0
+ */
+u32 fdt_cpu_get_timebase_frequency(void);
+
+/**
+ * Initialize the cache of CPU node information
+ *
+ * @param fdt devicetree blob
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cpu_init(const void *fdt);
+
+#endif /* __FDT_CPU_H__ */
diff --git a/lib/utils/fdt/fdt_cpu.c b/lib/utils/fdt/fdt_cpu.c
new file mode 100644
index 00000000..e1dafe89
--- /dev/null
+++ b/lib/utils/fdt/fdt_cpu.c
@@ -0,0 +1,118 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2024-2026 SiFive
+ */
+
+#include <libfdt.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
+#include <sbi_utils/fdt/fdt_helper.h>
+
+struct fdt_cpu_info {
+	int cpu_offset;
+	u32 cpu_phandle;
+	u32 intc_phandle;
+};
+
+static unsigned long fdt_cpu_info_offset;
+static u32 fdt_cpu_timebase_frequency;
+
+int fdt_cpu_hartindex_to_offset(u32 hartindex)
+{
+	struct fdt_cpu_info *info = sbi_scratch_offset_ptr(
+		sbi_hartindex_to_scratch(hartindex), fdt_cpu_info_offset);
+
+	if (!fdt_cached_offsets_valid())
+		return -FDT_ERR_NOTFOUND;
+
+	return info->cpu_offset;
+}
+
+u32 fdt_cpu_phandle_to_hartindex(u32 phandle)
+{
+	/* Assume phandles do not change, so do not check fdt_cached_offsets_valid() */
+
+	sbi_for_each_hartindex(i) {
+		struct fdt_cpu_info *info = sbi_scratch_offset_ptr(
+			sbi_hartindex_to_scratch(i), fdt_cpu_info_offset);
+
+		if (info->cpu_phandle == phandle)
+			return i;
+	}
+
+	return -1U;
+}
+
+u32 fdt_cpu_intc_phandle_to_hartindex(u32 phandle)
+{
+	/* Assume phandles do not change, so do not check fdt_cached_offsets_valid() */
+
+	sbi_for_each_hartindex(i) {
+		struct fdt_cpu_info *info = sbi_scratch_offset_ptr(
+			sbi_hartindex_to_scratch(i), fdt_cpu_info_offset);
+
+		if (info->intc_phandle == phandle)
+			return i;
+	}
+
+	return -1U;
+}
+
+u32 fdt_cpu_get_timebase_frequency(void)
+{
+	return fdt_cpu_timebase_frequency;
+}
+
+int fdt_cpu_init(const void *fdt)
+{
+	int cpu_offset, cpus_offset, err, intc_offset, len;
+	struct sbi_scratch *scratch;
+	struct fdt_cpu_info *info;
+	const fdt32_t *val;
+	u32 hartid;
+
+	fdt_cpu_info_offset = sbi_scratch_alloc_type_offset(struct fdt_cpu_info);
+	if (!fdt_cpu_info_offset)
+		return SBI_ENOMEM;
+
+	cpus_offset = fdt_path_offset(fdt, "/cpus");
+	if (cpus_offset < 0)
+		return SBI_ENOENT;
+
+	val = fdt_getprop(fdt, cpus_offset, "timebase-frequency", &len);
+	if (val && len == sizeof(*val))
+		fdt_cpu_timebase_frequency = fdt32_to_cpu(*val);
+
+	fdt_for_each_subnode(cpu_offset, fdt, cpus_offset) {
+		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
+		if (err)
+			continue;
+
+		/*
+		 * There is no need to apply any filters (e.g. disabled nodes)
+		 * because those harts will not have an associated hart index.
+		 */
+		scratch = sbi_hartid_to_scratch(hartid);
+		if (!scratch)
+			continue;
+
+		info = sbi_scratch_offset_ptr(scratch, fdt_cpu_info_offset);
+		info->cpu_offset = cpu_offset;
+		info->cpu_phandle = fdt_get_phandle(fdt, cpu_offset);
+
+		fdt_for_each_subnode(intc_offset, fdt, cpu_offset) {
+			err = fdt_node_check_compatible(fdt, intc_offset, "riscv,cpu-intc");
+			if (err)
+				continue;
+
+			info->intc_phandle = fdt_get_phandle(fdt, intc_offset);
+			break;
+		}
+	}
+
+	return 0;
+
+}
diff --git a/lib/utils/fdt/objects.mk b/lib/utils/fdt/objects.mk
index 31cf1c5a..f540f53b 100644
--- a/lib/utils/fdt/objects.mk
+++ b/lib/utils/fdt/objects.mk
@@ -9,5 +9,6 @@ libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_early_drivers.carray.o
 libsbiutils-objs-$(CONFIG_FDT_DOMAIN) += fdt/fdt_domain.o
 libsbiutils-objs-$(CONFIG_FDT_PMU) += fdt/fdt_pmu.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_helper.o
+libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_cpu.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_driver.o
 libsbiutils-objs-$(CONFIG_FDT) += fdt/fdt_fixup.o
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 1df0280d..34e6c638 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -18,6 +18,7 @@
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_tlb.h>
 #include <sbi_utils/cache/fdt_cmo_helper.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_domain.h>
 #include <sbi_utils/fdt/fdt_driver.h>
 #include <sbi_utils/fdt/fdt_fixup.h>
@@ -255,11 +256,18 @@ int generic_final_init(bool cold_boot)
 
 int generic_extensions_init(bool cold_boot)
 {
+	const void *fdt = fdt_get_address();
+	int rc;
+
 	if (!cold_boot)
 		return 0;
 
+	rc = fdt_cpu_init(fdt);
+	if (rc)
+		return rc;
+
 	/* Parse the ISA string from FDT and enable the listed extensions */
-	return fdt_parse_isa_extensions_all_harts(fdt_get_address());
+	return fdt_parse_isa_extensions_all_harts(fdt);
 }
 
 int generic_domains_init(void)
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
