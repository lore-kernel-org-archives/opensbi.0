Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCC0C369CB
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eudlrY8y6NPZjbe56CCZFJKczGyZelPhK9wxxaXXiM=; b=oW66YGx+XO4vDx
	SJBsC34AyEatGFx9W5em3ekrl0MHKUtpGlBMSfV2n6LTDRE3dM/LZUDnDKn6xOw1jiBNlo2Pqv854
	mfWjeRrCGDBppaFciNUwuYh7OxrF1xPmdII4uFz7pmUdhFWSIoUBTG+muW/OqvG1vjNtYX7b8wOBd
	89vqpuxlUR8p4NB88Hi15ySgoA8X1RiDG4sA3ijTM8xojzrqHESc2hsrLqoj44Mh1K6vW2hJnhinn
	t0WvleQI/eJz+yeexuGQJJ3ZLfW68gTFNs0TJIK8TX8YFw/HjYAK84kHn81OoFWkTIdNzRkGHb4wo
	CZNlUOKp9XwZrDzxBYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ivc-0000000CDpr-0egr;
	Wed, 23 Apr 2025 22:50:52 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7iva-0000000CDpV-1cug
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 22:50:51 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b0da25f5216so193860a12.1
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 15:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745448648; x=1746053448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9QouFczlwQ/tOuzPCJRd6f+D/7xo5/KYW2V2c5vYAA=;
        b=U61wnjLZazbUccMGgqzq+I7hy4mWwqoTOfDbna4rgEFaZ7fkHdmGhdC/I7aS+Gnvnm
         /2WOymfD/+5a2LUnN6mj27hgAeOT/PNjmR6RPrRScf7gaav/K6MtD+DvWQkY86AhXGck
         otJfLJUysKoMcxPitmmGD1svPwWPcUtMktMUcLMqN3ejdnKPETXvWY2bY40WIoLuTMbI
         ZmFgZqjCG+mjZihVYOvQ4EGRGTFp9nYaK5u3QGLuMLNgOGVnBXaaRn7NHgp8WUoDSpWY
         x8xr6oFkXsRz6slbPvN9TErTH3Q9hWsN2UVkiL17tHRr+/xgm3U9thnoxPzamzN8sG2t
         vMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745448648; x=1746053448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9QouFczlwQ/tOuzPCJRd6f+D/7xo5/KYW2V2c5vYAA=;
        b=OqmsnI7JZ5K0KnMpXOW6i+iuMWoHZZtP9VGvAS4Xiolpc6sVi5pNRITzJDXpKVnjGo
         KkAXP6qTXytzrPT3aRSdH/LtMkjwc+R+6Lyy2lp2b3GysNMcsT1xrnSBAzxBGMB6JgVF
         v9Aw7/U62NTPAL5oK83dfcWgHTKfM+fFOsyUM6exaTMaUQZUAcuNieH5w5wRnR3Ne2IV
         tN3kN1ALpPmahAEpF2d5PjzNM5YntBmJmahY1v9wNhcldKwJRpi4w+HARQKMNYzO3yQR
         JXkaf1vEpEGMwmz2avdC6xbg7bi2RT6U0CUD5Cqd04XUx6EIDwv2BVFk2EwdhWTJPiTT
         YPWw==
X-Gm-Message-State: AOJu0YwRITlqweKsKA+wlnoJPe/Ry9ekIIxFIEQOM/mKmSbAIKfve89K
	IdTswgZd4JXPGKa8jBV18lxzrkYKrW0HMMaQUjkkMTQLcX9TBdIs9cipnlFOI64=
X-Gm-Gg: ASbGncv7nJClZZQ92x/Pto5OUDsU6zbdfTVZt4D9Yz1RYAnZ3FsLU7IlGitcCSFbpXs
	1ReOBIJtWhCGxSNgvW1XgKL7Q6lNpHEVS8KyfWJqIxTiCZo508VJs1rXSRHdAy1NYy+QIyMJCJt
	TeINtZH1tgnl4/Pf4xTUIEyltBKyuLtTrZyghreYlR8Ncx0C4lvLgguCyvx/CXr8ZTTFcIjN3Gz
	l17VsX/A+DezltNjofcp+OSPVBD9LEoxfsFNz4ix6NY0dUqsllZnaF7snFnOBSBfX9XJdOK3rhG
	wZNMK/Kf/VfHmcTnK58ewJ+rDkqNZs8TVkX4D+fO5/NDkl0eyaSpP7nXthAMh0T27e0h4GUm+lr
	77WZfLwI=
X-Google-Smtp-Source: AGHT+IH4TLR7N8+sQMcltLXEmPRev6bMcKPjgduqm5toA/XyKauJ+XSvJTAg7r/ja3eWxkImTFlaBQ==
X-Received: by 2002:a17:90b:4c0b:b0:2fe:ba7f:8032 with SMTP id 98e67ed59e1d1-309ed26eddfmr666014a91.9.1745448648334;
        Wed, 23 Apr 2025 15:50:48 -0700 (PDT)
Received: from sjcdev801.. ([50.175.154.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dc7d5fsm3665ad.103.2025.04.23.15.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:50:47 -0700 (PDT)
From: Raj Vishwanathan <raj.vishwanathan@gmail.com>
X-Google-Original-From: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
To: opensbi@lists.infradead.org
Cc: rvishwanathan@mips.com,
	Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
Subject: [PATCH v6] lib: sbi: Set the scratch allocation to alignment to cacheline size.
Date: Wed, 23 Apr 2025 15:50:45 -0700
Message-ID: <20250423225045.267983-1-Raj.Vishwanathan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318185111.452620-1-Raj.Vishwanathan@gmail.com>
References: <20250318185111.452620-1-Raj.Vishwanathan@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_155050_427929_BDE6CBFD 
X-CRM114-Status: GOOD (  21.10  )
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

We set the scratch allocation alignment to cacheline size,specified by
riscv,cbom-block-size in the dts file to avoid two atomic variables from
the same cache line causing livelock on some platforms. If the cacheline
is not specified, we set it a default value.

Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
--
Changes in V6:
	Add assert for assert_member_offset for cbom_block_size
	Update the subject line
Changes in V5:
	Formatting issues
Changes in V4:
	Pickup the cacheline size from the dts file
Changes in V3:
    Remove platform specific references to 64 Bytes.
Changes in V2:
    Added a new configuration to get the alignment size.
Change in V1:
    Original Patch
---
 include/sbi/sbi_platform.h         |  5 +++++
 include/sbi_utils/fdt/fdt_helper.h |  2 ++
 lib/sbi/sbi_scratch.c              | 26 ++++++++++++++++++++++++--
 lib/utils/fdt/fdt_helper.c         | 24 ++++++++++++++++++++++++
 platform/generic/platform.c        |  9 +++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index 82840ae..08ece32 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -39,6 +39,8 @@
 #define SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET (0x60 + __SIZEOF_POINTER__)
 /** Offset of hart_index2id in struct sbi_platform */
 #define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
+/** Offset of cbom_block_size in struct sbi_platform */
+#define SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET (0x60 + (__SIZEOF_POINTER__ * 3))
 
 #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
 
@@ -190,6 +192,8 @@ struct sbi_platform {
 	 *     hart_index2id[<abc>] = <abc>
 	 */
 	const u32 *hart_index2id;
+	/** Allocation alignment for Scratch */
+	unsigned long cbom_block_size;
 };
 
 /**
@@ -207,6 +211,7 @@ assert_member_offset(struct sbi_platform, reserved, SBI_PLATFORM_RESERVED_OFFSET
 assert_member_offset(struct sbi_platform, platform_ops_addr, SBI_PLATFORM_OPS_OFFSET);
 assert_member_offset(struct sbi_platform, firmware_context, SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET);
 assert_member_offset(struct sbi_platform, hart_index2id, SBI_PLATFORM_HART_INDEX2ID_OFFSET);
+assert_member_offset(struct sbi_platform, cbom_block_size, SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET);
 
 /** Get pointer to sbi_platform for sbi_scratch pointer */
 #define sbi_platform_ptr(__s) \
diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 5875880..04c850c 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -50,6 +50,8 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
 
 int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
 
+int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long  *cbom_block_size);
+
 int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
 
 int fdt_parse_isa_extensions(const void *fdt, unsigned int hartid,
diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
index 8c7eeaf..916f283 100644
--- a/lib/sbi/sbi_scratch.c
+++ b/lib/sbi/sbi_scratch.c
@@ -14,6 +14,8 @@
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_string.h>
 
+#define DEFAULT_SCRATCH_ALLOC_ALIGN __SIZEOF_POINTER__
+
 u32 sbi_scratch_hart_count;
 u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS] = { [0 ... SBI_HARTMASK_MAX_BITS-1] = -1U };
 struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS];
@@ -21,6 +23,19 @@ struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS];
 static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
 static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
 
+static unsigned long sbi_get_scratch_alloc_align(void)
+{
+	const struct sbi_platform *plat;
+	/*
+	 * Get the alignment size. We will return DEFAULT_SCRATCH_ALLOC_ALIGNMENT
+	 * or riscv,cbom_block_size
+	 */
+	plat = sbi_platform_thishart_ptr();
+	if (!plat || !plat->cbom_block_size)
+		return DEFAULT_SCRATCH_ALLOC_ALIGN;
+	return plat->cbom_block_size;
+}
+
 u32 sbi_hartid_to_hartindex(u32 hartid)
 {
 	sbi_for_each_hartindex(i)
@@ -57,6 +72,7 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
 	void *ptr;
 	unsigned long ret = 0;
 	struct sbi_scratch *rscratch;
+	unsigned long scratch_alloc_align = 0;
 
 	/*
 	 * We have a simple brain-dead allocator which never expects
@@ -70,8 +86,14 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
 	if (!size)
 		return 0;
 
-	size += __SIZEOF_POINTER__ - 1;
-	size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
+	scratch_alloc_align = sbi_get_scratch_alloc_align();
+
+	/*
+	 * We let the allocation align to cacheline bytes to avoid livelock on
+	 * certain platforms due to atomic variables from the same cache line.
+	 */
+	size += scratch_alloc_align - 1;
+	size &= ~(scratch_alloc_align - 1);
 
 	spin_lock(&extra_lock);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 79e59dd..b2d91fd 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -246,6 +246,30 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
 	return 0;
 }
 
+int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, unsigned long *cbom_block_size)
+{
+	int len;
+	const void *prop;
+	const fdt32_t *val;
+
+	if (!fdt || cpu_offset < 0)
+		return SBI_EINVAL;
+
+	prop = fdt_getprop(fdt, cpu_offset, "device_type", &len);
+	if (!prop || !len)
+		return SBI_EINVAL;
+	if (strncmp (prop, "cpu", strlen ("cpu")))
+		return SBI_EINVAL;
+
+	val = fdt_getprop(fdt, cpu_offset, "riscv,cbom-block-size", &len);
+	if (!val || len < sizeof(fdt32_t))
+		return SBI_EINVAL;
+
+	if (cbom_block_size)
+		*cbom_block_size = fdt32_to_cpu(*val);
+	return 0;
+}
+
 int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid)
 {
 	u32 hartid;
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index f3072be..2b1b949 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -147,6 +147,9 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 	const void *fdt = (void *)arg1;
 	u32 hartid, hart_count = 0;
 	int rc, root_offset, cpus_offset, cpu_offset, len;
+	unsigned long cbom_block_size = 0;
+	unsigned long tmp = 0;
+
 
 	root_offset = fdt_path_offset(fdt, "/");
 	if (root_offset < 0)
@@ -174,11 +177,17 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
 			continue;
 
 		generic_hart_index2id[hart_count++] = hartid;
+
+		rc = fdt_parse_cbom_block_size(fdt, cpu_offset, &tmp);
+		if (rc)
+			continue;
+		cbom_block_size = MAX(tmp, cbom_block_size);
 	}
 
 	platform.hart_count = hart_count;
 	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
 	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
+	platform.cbom_block_size = cbom_block_size;
 
 	fw_platform_coldboot_harts_init(fdt);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
