Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8324606A319
	for <opensbi@archiver.kernel.org>; Thu, 22 Oct 2026 02:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=axbnNxBV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=KqclWZE8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ii6KnGGY7AwBj1nasC2AkDkdKYttiDC1X8sQI+Q/8fw=; b=axbnNxBVWkuLGk
	mH39RvnqjlxxfZ5lyxzVZ1yAJ9ZVOqqO71EowFt6JC5WgKBMgqGY9/2kbfz+BFM5KnnMhLy3Ph2mC
	mXyUJvfY5dCJS1+I2PB5OFnYcsRGgc/hDOvLiwWF0nmaUkO0OwIsn85cmpMm6kkH9pm1ao1UHg+3z
	pqd0tY2wD5WqzMNl0zDtAs1G2tArd4JciHkT59pPYGHjT43yr3F/fauhSZsivuEe4Z9/b+jKlkXk5
	fdLydcTpfIENHZrKEEIFRU30uEt8lPcopneGRSJt07t1UVaq3Hl5iH/EIcPzXsvt7Q8JjDz8eXOc/
	RI/AqObFcb3DzRxyabzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVX-0000000DCJX-2AUt;
	Thu, 22 Oct 2026 02:26:19 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiVT-0000000DCHu-38WL
	for opensbi@lists.infradead.org;
	Thu, 22 Oct 2026 02:26:16 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2458397eec.1
        for <opensbi@lists.infradead.org>; Wed, 21 Oct 2026 19:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1792635975; x=1793240775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIpZMsZOonHYJItRRzXFL22TpQds4FjQNJJBasDrA0g=;
        b=KqclWZE87Ixu8oQN4S7ZcH+Fp/b4mdmJpC4IZs+kul2q/TUmzFSySrzhEofgPChnaf
         Jf2qjXB8+8lqTRu9baIFmVS4aRdlHo4cHH9S+CvePM2B0QrdQOaPinmIBHMr8oFAvs4+
         tNw2OhaenIretAN2A3ZVoO/bLaGBUA07ssgN1t0jbo2CvZZ3Lmz6cVfJHe24ow0glT3h
         skTqC4Y+1DoaD7KbtUJRiUxjmGxrCk53cV5yAfBH0hCHbZCEcez+Zm8l8p4PdUah40fm
         fR9/G4dS8SU65ACYr8pj3T/8ejIHgcafT8Panr/HvwrPiGbJ5ODKzUJaYY2Nd2oJ3Amy
         qAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635975; x=1793240775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OIpZMsZOonHYJItRRzXFL22TpQds4FjQNJJBasDrA0g=;
        b=WInUQ17xVxCspX2vcQF4Z67wN4PC+kfSsTSD0UIbotXugGpflWWpTAjDS7v8aS7okn
         cgkJ2JHf5yTvFdNESSFg9SFjhu8TGXGCinPSsXo5dfsv+DRy60afJ5igv4or+mHLArRd
         MfpVRmcYVijGRPRMTCUq3xt76W0DMAmzs60YyZNqtFVLI3frTDHjw5DoUxWLyZvPA6c6
         o/Pe65hkQ2p/XjJHfUU5TGGzofbqKRdun0Zj2H671AkCXJWCY7EvmFOw07nHzbkc3uP/
         lR0YckzKTk8Ci3jvLKvbDhp8tyIa0d5t9DuavYeHDejDLcIGF5B0o+RNpVT0iSj4S+BH
         fB8Q==
X-Gm-Message-State: AFq9FYLI5fU0LmlLjVZ6WZmd2u11vZtIq8Ksi9nfC2I9NQ73d21ZKSLa
	51hRXahEl9VV4Q2pKpbnf17hZTlcyPjETW2kNmwtvkuqK5FqS8CjQWXGjFL4UdpWa9THUVeRRoP
	udcAvRFmtIjQ9EDGMH5otftjZlLhVBtOO+Da9cFkOt/A3LthVhN/nqd+Zo1j0jE/ZCP0WSl4sec
	SK19d89otyajEASPSZgrFL/3TyB+hu8GFy3q8APXaeYp1Q9Sc+aa4=
X-Gm-Gg: AYBFou0r2ZPPEHXCFwaUiI3p/J0oAlZU7qY/mZ7IdeBzOkfOeUmuDbfA/hlLzmjklnX
	AP1rfx2wTSeNnrOf3oy9VpDY6saU73/Xn0SbgI1GEfxXGTCDP9SEWgQMh98yfn4l1gU09o9KJFi
	jFQjgd/BPnkU4MlB5/wWi6LQe3k/Q4TsA8tk8FLyZGHoUKjqOGJYS3Mu8NyjOi3vvUeXjniSZun
	SGaeljX/7kuV1IRXZi2p5/e04rfSevNsJkfjNa6FHEMvZkGAdwsfNxXQRsfF53KD3H1YBX4Bjy3
	AxIotR4KE7jiQA8eFmsNxfdyeYzGuArdao4tRHwoBJawBk+JY/pcJZIF/YLQny6Pvo5CBXd3fHR
	fuV83oie/iIIprSUK19B190GFbPYhdm4wmixQFEEInLGpphj5qZuBQ0RCJvgx9U6BB9Iocs/A7f
	XCa8hFTMAHS+tyPeDhi14W8FxeBj9X3JtEQoedtork46RrlZGXZHENwRhOXXUedVGbj0b981zs7
	PMlnYIB0Ci5lA78cegEA0ZzBPuhg6r/2vgplVdk8TE1qmlosudgysiF4QwcqSdDu8X5ipE=
X-Received: by 2002:a05:7300:fe89:b0:358:36e5:b81c with SMTP id 5a478bee46e88-3674eb34c9fmr4826164eec.31.1792635974747;
        Wed, 21 Oct 2026 19:26:14 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm13047659eec.25.2026.10.21.19.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:26:14 -0700 (PDT)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	ganboing@gmail.com,
	anup.patel@oss.qualcomm.com,
	Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Max Hsu <max.hsu@sifive.com>
Subject: [PATCH v2 1/5] lib: sbi: Add per-hart feature-configuration platform operation
Date: Wed, 21 Oct 2026 19:26:05 -0700
Message-ID: <20261022022609.1974514-2-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022022609.1974514-1-leo.liang@sifive.com>
References: <20261022022609.1974514-1-leo.liang@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_192615_794182_5F9F0BD5 
X-CRM114-Status: GOOD (  28.22  )
X-Spam-Score: -2.1 (--)
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

Signed-off-by: Max Hsu <max.hsu@sifive.com>
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
