Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6A2CA5FAB
	for <opensbi@archiver.kernel.org>; Wed, 30 Sep 2026 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/e4A46jFg9Ucd0/isG0pq8gyb0mf0QDu7RyvAYbGgc=; b=RB/TEAcz3l7AhX
	nnGfihN3EZ/+DpdUWKzXSZ8IOICo3y88YMwXPS+U9Rmkw1G//PHj+x/qypRx2jCNi6OSaS0rRep9A
	/KLPEXs5OCgNeG47LGGnsziqCtyhSp8u/Y4vRSG7N/b/6UBYs2Ov6MWQUUq+ylN3gVdt+F/hZE0eN
	C+5Cv/WNC42LEd2Vdrl7S9llegcxBTtzOEvW7tAVbYCpL1PK6u7cvlg3O57XQubto1B1d6Ke3Z0El
	EzDYIgEYSQC5KCt8FF5hfAmjVormoKGgjTR96WxPoQjx8aLxLDF5piIAMytwRe4pLC2IQR3stALD0
	bXTmDJ4s0x1mNtzIYlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5J-000000054Ey-1DjE;
	Wed, 30 Sep 2026 05:42:29 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBn5D-000000054DY-17KE
	for opensbi@lists.infradead.org;
	Wed, 30 Sep 2026 05:42:24 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-34b48100af4so1168276eec.3
        for <opensbi@lists.infradead.org>; Tue, 29 Sep 2026 22:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790746941; x=1791351741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rftwNdJJO/FEp9HbzOgSoSCDMH9xQEkABpdzOoUyO+c=;
        b=niAC1ODz3kMC8umCtwAJd48ejlW3ShCJaWIWcDkHj3m7q/WJRonzmrqBQLIjq9wviI
         4l78dzQ7iieVPxhIazOPi5LjckZ8Ws9f2abu4iMlfCkggGJ2M6u8zCXX4GbjjhXMzcLO
         /jfcSXrBUajA9mKuDoCe4fMEZw1ta6/ST0hBiSJLCNuXBGlvIXGMuud1+SDajBaRAWIu
         I+VFDn48vDChWFjRP+e6X1fZVpSb+XFoWRF9FjURuyVpzxuQiYLMDAQK5/VL6cRpa66y
         px8DvuD9lnd3C7egOSdGxokWm2fuLsjK/+4kz2jmksiOnRhaYt8+OgXXUUcPPki6485m
         XpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746941; x=1791351741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rftwNdJJO/FEp9HbzOgSoSCDMH9xQEkABpdzOoUyO+c=;
        b=oQ1R00UY140abPmq0ClTN/NDbQX1MIiXjx+sHs6LM7dg/4Z+Sj83Icq71ZtjzJH+Rl
         88n1aMMEmvyQChBXDjpbVd2dSMBmiAI1aOXQ/tIr8Y+6Ma6nUe8vLb871vJRH8d4hWoU
         nmFHTjQj9mk5n4e9oyFzwqgw0J9zVjFSfeOo7zwusm4O/rC57vALizKt0QN05l3gus2I
         vyOKwJJih4cxOuwG+vJbvW82SDFcNqTNp1s/L30eH5TsyvFMjFSgoLctHYGfO1ukVOad
         K0BFzpMFPiaagtbvotJg/6MSDLEMm1XAxdHGqoyBWLOqhNnXUy5VGX6NrHqrneO3T2hI
         Cf3Q==
X-Gm-Message-State: AFq9FYK2mfUc6IDYQQwy1WACfEoyo1FFOnR5wj6k/Gyj3dYiNaCtY9jn
	rqfMw/yhDCJ5ciPcmvxHkKQaBwhdtmpnojO9WK6jHxwqecKZz2/ASp9CzgeOZKpvDSEYbfx74nv
	nu7jJQAR3WgsBYIs1U/OywHXkMucJ/7RUDi7tIhr+xBm0dnln5cW3j3PGMG9+JtNHkUgJZwuBw4
	A5IBWmNVfMr6iQ81gSf+VHgJCwVkiH3H48uLDTeCe9XMjSfPK2Luo=
X-Gm-Gg: AYBFou1sfttfe1SPpPHmIForyj190kqYUwpNvfCqJ52KVoeMXrV8KTmJRqAVJjlJ2SI
	KubwnbL0u9mUE2J9QY0Zi4P9UoaTVq+3ml2gJ+5W/yzkzgwCxu75ocGlPchMTSPsoB0BIIZc9mE
	oAWg8tlSL4H4Jm3EqxSK0zdM3g7HyL/SJo00F1bVe0F1fD/3qhr1ZeszrukAEs0fYG6VBSjXxVJ
	Ic/H2nR3MzJzyk2M/flmsBzlD7BxqPc1Q2hV67Y0gDPoM80MY8tq0EJ4w7gp3VGTnyfVuZ+uwyY
	MhvhZFrGhsaF2DweXNrrh6/C3qIJfnHn5jm7HIapUyqnDTA7EFVmXnlipVQcZa9rWXg5my8a7SX
	ljtSHIhVZM4UDc8Ihu5FlmrlGhpzqJfIT/elBF+x4utHM163QG0ntKI0lpnU2on5jvlrsBAoRYr
	G8riy/kUbM84hH2sInFM0uP20sX8JqUjpWSTmkukHCQt3DSglTB88yN1cZu02ERsEdbpYvI61tI
	4GgvhHjB9f/Mw==
X-Received: by 2002:a05:7301:7308:b0:34b:c18d:c290 with SMTP id 5a478bee46e88-34cdb8e1aa9mr678525eec.15.1790746941103;
        Tue, 29 Sep 2026 22:42:21 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a60283sm910797eec.6.2026.09.29.22.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:42:20 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	leo.liang@sifive.com
Subject: [PATCH 1/5] lib: sbi: Add per-hart feature-configuration platform operation
Date: Tue, 29 Sep 2026 22:42:06 -0700
Message-ID: <20260930054210.3498806-2-leo.liang@sifive.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930054210.3498806-1-leo.liang@sifive.com>
References: <20260930054210.3498806-1-leo.liang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_224223_546869_774E453A 
X-CRM114-Status: GOOD (  28.35  )
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

Some RISC-V implementations expose per-hart CSRs that select
microarchitectural behaviour (branch prediction, prefetcher, LSU
options, etc.) and must be set on every hart.

Add a feature_config_init platform operation plus a per-hart cache of
pending CSR writes. sbi_hart_feature_config_set() lets a hart cache a
CSR write. Passing write_back=true writes the CSR immediately.

sbi_hart_feature_config_init() calls the platform's feature_config_init
hook, then (re)writes every cached CSR. It only calls the hook once
per hart, so a hart hotplugged back in or resume from suspend,
skips the hook and just reapplies its already-cached values.
A failure anywhere in this path hangs the hart, since an unconfigured
hart may run with unsafe microarchitectural defaults. Wire it into
sbi_init.c after platform final init on cold/warm boot, and again
directly on warm resume, since a non-retentive suspend can reset
these CSRs.

All matching policy lives in the platform operation; this only adds
the hook, the cache, and the call sites.

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Assisted-by: LLM
---
 include/sbi/sbi_hart_feature_config.h |  16 +++
 include/sbi/sbi_platform.h            |   7 ++
 lib/sbi/Kconfig                       |  23 ++++
 lib/sbi/objects.mk                    |   1 +
 lib/sbi/sbi_hart_feature_config.c     | 169 ++++++++++++++++++++++++++
 lib/sbi/sbi_init.c                    |  21 ++++
 6 files changed, 237 insertions(+)
 create mode 100644 include/sbi/sbi_hart_feature_config.h
 create mode 100644 lib/sbi/sbi_hart_feature_config.c

diff --git a/include/sbi/sbi_hart_feature_config.h b/include/sbi/sbi_hart_feature_config.h
new file mode 100644
index 00000000..a1649da5
--- /dev/null
+++ b/include/sbi/sbi_hart_feature_config.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ */
+
+#ifndef __SBI_HART_FEATURE_CONFIG_H__
+#define __SBI_HART_FEATURE_CONFIG_H__
+
+#include <sbi/sbi_types.h>
+
+struct sbi_scratch;
+
+int sbi_hart_feature_config_init(struct sbi_scratch *scratch, bool cold_boot);
+int sbi_hart_feature_config_set(unsigned long hart_index, unsigned long csr_num, unsigned long value, bool write_back);
+
+#endif
diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 1e9a23c1..76d0b822 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -83,6 +83,13 @@ struct sbi_platform_operations {
 
 	/** Platform early initialization */
 	int (*early_init)(bool cold_boot);
+
+	/**
+	 * Platform feature-configuration hook. Caches per-hart CSRs
+	 * via sbi_hart_feature_config_set().
+	 */
+	int (*feature_config_init)(bool cold_boot);
+
 	/** Platform final initialization */
 	int (*final_init)(bool cold_boot);
 
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 24132eaa..d72a480d 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -88,6 +88,29 @@ config SBIUNIT
 	bool "Enable SBIUNIT tests"
 	default n
 
+config FEATURE_CONFIG
+	bool "Per-hart feature-configuration CSR setup"
+	default n
+	help
+	  Some RISC-V implementations expose per-hart machine-mode CSRs
+	  that select microarchitectural behaviour, such as branch
+	  prediction policy or hardware prefetcher configuration, that
+	  must be set on every hart.
+
+	  Enables the platform's optional feature_config_init hook,
+	  which matches the hart against a registered vendor driver and
+	  caches the CSRs it owns. sbi_hart_feature_config_init() calls
+	  this hook on cold/warm boot of every hart, then writes the
+	  cache.
+
+	  A vendor driver must also be enabled, see "Feature
+	  Configuration Support" under utils. Harts with no matching
+	  driver values are left untouched.
+
+	  On hart resume, sbi_hart_feature_config_init() rewrites the
+	  cached values directly without calling the hook again, since
+	  a non-retentive suspend can reset these CSRs.
+
 config SBI_ECALL_SSE
 	bool "SSE extension"
 	default y
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index ae27d0c5..13afe0bc 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -75,6 +75,7 @@ libsbi-objs-y += sbi_emulate_csr.o
 libsbi-objs-y += sbi_fifo.o
 libsbi-objs-y += sbi_fwft.o
 libsbi-objs-y += sbi_hart.o
+libsbi-objs-y += sbi_hart_feature_config.o
 libsbi-objs-y += sbi_hart_pmp.o
 libsbi-objs-y += sbi_hart_protection.o
 libsbi-objs-y += sbi_heap.o
diff --git a/lib/sbi/sbi_hart_feature_config.c b/lib/sbi/sbi_hart_feature_config.c
new file mode 100644
index 00000000..b401a00a
--- /dev/null
+++ b/lib/sbi/sbi_hart_feature_config.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2026 SiFive Inc.
+ *
+ * Per-hart cache of feature-configuration CSR writes. A platform's
+ * feature_config_init hook caches CSRs via
+ * sbi_hart_feature_config_set() instead of writing them immediately.
+ * sbi_hart_feature_config_init() writes the cache and re-applies it on
+ * hart resume.
+ */
+
+#include <sbi/riscv_asm.h>
+#include <sbi/riscv_encoding.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_error.h>
+#include <sbi/sbi_hart_feature_config.h>
+#include <sbi/sbi_hartmask.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
+
+/** Max number of cached feature-configuration CSRs per hart */
+#define SBI_HART_FEATURE_CONFIG_CSR_MAX	8
+
+/**
+ * A single cached feature-configuration CSR write, keyed by csr_num.
+ * Populated by sbi_hart_feature_config_set() and replayed by
+ * sbi_hart_feature_config_init().
+ */
+struct sbi_hart_feature_config_csr {
+	unsigned long csr_num;
+	unsigned long value;
+};
+
+/**
+ * Per-hart cache of pending feature-configuration CSR writes
+ *
+ * Own scratch allocation so platforms without CONFIG_FEATURE_CONFIG
+ * pay nothing for it.
+ */
+struct sbi_hart_feature_config_cache {
+	bool probed;
+	unsigned int count;
+	struct sbi_hart_feature_config_csr csrs[SBI_HART_FEATURE_CONFIG_CSR_MAX];
+};
+
+static unsigned long feature_config_offset;
+
+static struct sbi_hart_feature_config_cache *
+sbi_hart_feature_config_cache_ptr(struct sbi_scratch *scratch)
+{
+	if (!feature_config_offset)
+		return NULL;
+
+	return sbi_scratch_offset_ptr(scratch, feature_config_offset);
+}
+
+/**
+ * Check that a CSR is one of the machine-mode custom read/write CSRs
+ *
+ * Confirms @csr_num falls in a range the privileged spec reserves for custom
+ * machine-mode read/write use.
+ */
+static bool sbi_hart_feature_config_csr_valid(unsigned long csr_num)
+{
+	return (csr_num >= CSR_CUSTOM8_M_RW_BASE &&
+		csr_num < CSR_CUSTOM8_M_RW_BASE + CSR_CUSTOM8_M_RW_COUNT) ||
+	       (csr_num >= CSR_CUSTOM9_M_RW_BASE &&
+		csr_num < CSR_CUSTOM9_M_RW_BASE + CSR_CUSTOM9_M_RW_COUNT);
+}
+
+/**
+ * Cache a feature-configuration CSR write for a HART
+ *
+ * @hart_index is the target hart of the CSR write
+ *
+ * @write_back writes the CSR immediately. This is only valid
+ * when @hart_index is the caller's own hart. The value is cached either
+ * way, so a later resume still replays it.
+ *
+ * @return 0 on success, or other negative error codes on failure
+ */
+int sbi_hart_feature_config_set(unsigned long hart_index, unsigned long csr_num,
+				 unsigned long value, bool write_back)
+{
+	struct sbi_hart_feature_config_cache *cache =
+		sbi_hart_feature_config_cache_ptr(sbi_hartindex_to_scratch(hart_index));
+	unsigned int i;
+
+	if (!cache)
+		return SBI_EINVALID_STATE;
+
+	if (!sbi_hart_feature_config_csr_valid(csr_num))
+		return SBI_EINVAL;
+
+	/*
+	 * write_back only makes sense for the caller's own hart.
+	 */
+	if (write_back && hart_index != current_hartindex())
+		return SBI_EINVAL;
+
+	for (i = 0; i < cache->count; i++) {
+		if (cache->csrs[i].csr_num == csr_num) {
+			cache->csrs[i].value = value;
+			break;
+		}
+	}
+
+	if (i == cache->count) {
+		if (cache->count >= SBI_HART_FEATURE_CONFIG_CSR_MAX)
+			return SBI_ENOSPC;
+
+		cache->csrs[cache->count].csr_num = csr_num;
+		cache->csrs[cache->count].value = value;
+		cache->count++;
+	}
+
+	if (write_back) {
+		csr_write_num(csr_num, value);
+		sbi_dprintf("hart%lu: feature-config: csr 0x%03lx = 0x%lx\n",
+			     hart_index, csr_num, csr_read_num(csr_num));
+	}
+
+	return 0;
+}
+
+/**
+ * Feature-configuration initialization for current HART
+ *
+ * On cold boot, allocates the per-hart CSR cache. Calls the platform's
+ * feature_config_init hook, if not already called for this hart, then
+ * (re)writes every cached CSR.
+ *
+ * @return 0 on success or a negative error code on failure; the
+ * caller is expected to treat failure as fatal, since it can leave a
+ * hart running with unsafe microarchitectural defaults
+ */
+int sbi_hart_feature_config_init(struct sbi_scratch *scratch, bool cold_boot)
+{
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	struct sbi_hart_feature_config_cache *cache;
+	unsigned int i;
+	int rc;
+
+	if (cold_boot) {
+		feature_config_offset = sbi_scratch_alloc_offset(sizeof(*cache));
+		if (!feature_config_offset)
+			return SBI_ENOMEM;
+	}
+
+	cache = sbi_hart_feature_config_cache_ptr(scratch);
+	if (!cache)
+		return SBI_EINVALID_STATE;
+
+	if (!cache->probed && plat && sbi_platform_ops(plat)->feature_config_init) {
+		rc = sbi_platform_ops(plat)->feature_config_init(cold_boot);
+		if (rc)
+			return rc;
+		cache->probed = true;
+	}
+
+	for (i = 0; i < cache->count; i++) {
+		csr_write_num(cache->csrs[i].csr_num, cache->csrs[i].value);
+		sbi_dprintf("hart%lu: feature-config: csr 0x%03lx = 0x%lx\n",
+			     current_hartindex(), cache->csrs[i].csr_num,
+			     csr_read_num(cache->csrs[i].csr_num));
+	}
+
+	return 0;
+}
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b6..49dec1a9 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -17,6 +17,7 @@
 #include <sbi/sbi_ecall.h>
 #include <sbi/sbi_fwft.h>
 #include <sbi/sbi_hart.h>
+#include <sbi/sbi_hart_feature_config.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_hart_pmp.h>
 #include <sbi/sbi_hart_protection.h>
@@ -389,6 +390,14 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
 		sbi_hart_hang();
 	}
 
+	/* After final init, so it can adjust PMP or other state first */
+	rc = sbi_hart_feature_config_init(scratch, true);
+	if (rc) {
+		sbi_printf("%s: feature config init failed (error %d)\n",
+			   __func__, rc);
+		sbi_hart_hang();
+	}
+
 	/*
 	 * Note: SSE events callbacks can be registered by other drivers so
 	 * sbi_sse_init() needs to be called after all drivers have been probed.
@@ -508,6 +517,10 @@ static void __noreturn init_warm_startup(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	rc = sbi_hart_feature_config_init(scratch, false);
+	if (rc)
+		sbi_hart_hang();
+
 	rc = sbi_sse_init(scratch, false);
 	if (rc)
 		sbi_hart_hang();
@@ -541,6 +554,14 @@ static void __noreturn init_warm_resume(struct sbi_scratch *scratch,
 	if (rc)
 		sbi_hart_hang();
 
+	/*
+	 * A non-retentive suspend can reset these CSRs, so rewrite them
+	 * from the cache.
+	 */
+	rc = sbi_hart_feature_config_init(scratch, false);
+	if (rc)
+		sbi_hart_hang();
+
 	sbi_hsm_hart_resume_finish(scratch, hartid);
 }
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
