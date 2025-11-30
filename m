Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E033CD116F8
	for <opensbi@archiver.kernel.org>; Sun, 30 Nov 2025 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8I0L+7AiOlhLXpjxN8Nk1qL85uAiWBAknmgTdbgToA=; b=jsl+/29bj9OMdg
	JqKEr/Z06NpdQrOoanxC49tHsYXIVodLds7zagFDPCYvgPbMp8rfUp+idbZTjs37Cnmhh9wC0Gu18
	t2BV1YMqvXYyh6E6axw/xtYLQKW/TuldUzc5vx7Q6HIAQY9/TLefIiv0Tqby89cSDWQhfxd/PhE3w
	BNXcynBox+n7D20syzZtUvVdiiaeYjHK5K5GxXOaTQxWghAtzoJK8R8lynQga0bruVu8nTd0Kd9wT
	fLFdN8OSehV9DkPvttUG/v2l9pw8da0CYe/JjSjV5+3T4+Nki6ITxlG/VgyxurnDEhEkVYUbLP6Jw
	JJm01UsLDoKxWbvyhKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQI-00000002FA0-29r0;
	Sun, 30 Nov 2025 11:16:58 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQG-00000002F95-2fH2
	for opensbi@lists.infradead.org;
	Sun, 30 Nov 2025 11:16:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso2587101b3a.0
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 03:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764501416; x=1765106216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDJK5LiOIpk/nn06wmN3vUomDrnOAF3KgKYzIwoJlM8=;
        b=MaMk/ONFqTZn/b1Pu2O0cQuW2BslcDYZFrQ6JaqsfWi/rCSYGRxmLQKadZYZHiv94I
         ocUb/qMKMrMz7eECbSmkXZguzngrBI8ERMZlyDz5fiZO1MEzQUFn8ounZmb5uGU21MYV
         HfuCVdJKj6SQKJQti9VSXDWJK+gczNQ7VhYq8tD85mrP2pHoazBiuFTSVWsAp3oI3awo
         Lh98T4/e1JJDgwqO95l4rIwC/YmEsBGX26L3PFEx7L7ZhjDHU4DAz8JiU+DinPGlfb9j
         w9U/tBuicTiRQr2yBNuHXFTaEEgQigsSXQQvJCBPxZ1FlBg5Ph9JGWzvYDggZwLgXGnD
         cdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764501416; x=1765106216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hDJK5LiOIpk/nn06wmN3vUomDrnOAF3KgKYzIwoJlM8=;
        b=QNXPrIyEdMqyuE4fi2h3CLq+3lnXjr+mfGRQr3RncSfrrIUUvMSwnDLUwT5gEweOU1
         RoWCVObm89mAQDaDlOXyTl0Y/e5+YXkMsRTjoHOshAv37CmUOTkyxy7C/wHft2nvGC3+
         Ivq8vSgoXknpHetbgfRgVGw/xUwiGLWp0VDnkOIkvQ4j5nieNHQOkSg1S22hmWMqvCeH
         0eGYGwf0KtyZ25YwIN+RaOi3c/d/kPhQoZiflkrPK/GesiZnaGLknDXpp/DGbSCRjTrS
         a/e5yE65xWsAExyoKpPv7rc9hNltGbrXBK+dcvyszjOoa1SH9/B2kJxmYSSDRUdziXUd
         rE7Q==
X-Gm-Message-State: AOJu0YwNqkPDXIYRQBpvi6rLtUbpqvU6HPMaXLFbHuPYHtNr5pqalA8b
	EXe+mbNYyjQJLjYouy1RXAnbTm6TwUEo7W62L+bq6g0yQo/70vNbLGyYgBqtT+8DvNzjRNpPf5J
	90pHtV1H9UBf1I+PvNWDpmNH72AYnSOlK1panedMpQlRtbSacYHN6cYgUl2qHp2PAaWWIhk7Lpy
	ZNrGT1QXf0E6l0z7CuxKrdGo3yg4IdHoUtvkkFmGjQx4Qn4YVI
X-Gm-Gg: ASbGncuQkgjHtDafEDspqN00XdyC7lSM+5PGuWcE5JjuFCjL+zvMR3kiSs+coDlmJOs
	GOu7RASleT8fPecR7e1OzFwIVExdzs3AgGskLSmyLu9CbqOOitwNBmomZvmX6V7X6D6GUlbCNgs
	eqwRyyWhkx9qbLuYPtjei1C+iL1lS+tOkqX9Lv3hOuWHQs50urT7XDqtYdFI9S56Ug3eCJwq7bu
	hM1HpOBzugvAZu2oetLR+iH9mteDZgwwdsKXZVv2KmWfwj4LowVIbcZROVFPxKz8vTt21NQ8sSX
	DJccnLmSxkYqJaGY1+8SElvZMRwL22Jx5o3M4hUx72iViRVfJ8utTV+Hah3pSu3gZF9+HKl/1Ee
	YNLhohS9AXs8kLbEI8CE54H4x7gX2dIPl9IHKLULzO2GXqyu7mDsywES00a2voZZd7GMvXVXza+
	Zlg/arX71+ejI24y3Szsa14AJCdYk81nG1a5k=
X-Google-Smtp-Source: AGHT+IFq/GnH8IodABYg1O9aldginolZ27er0UKSs4ObmtkbZOOsqde5+N856FggktGw/z9bS3e/QQ==
X-Received: by 2002:a05:6a00:9294:b0:7ae:8821:96dd with SMTP id d2e1a72fcca58-7ca8977866dmr22772846b3a.24.1764501415334;
        Sun, 30 Nov 2025 03:16:55 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1819277c5sm10027050b3a.4.2025.11.30.03.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:16:54 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 3/6] lib: sbi: riscv_asm: support reserved PMP allocator
Date: Sun, 30 Nov 2025 19:16:40 +0800
Message-ID: <20251130111643.1291462-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251130111643.1291462-1-peter.lin@sifive.com>
References: <20251130111643.1291462-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_031656_707754_95B40C51 
X-CRM114-Status: GOOD (  14.39  )
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

Add reserved PMP entry allocation and management functions to enable
dynamic allocation of high-priority PMP entries. The allocator uses
per-hart bitmaps stored in scratch space to track reserved PMP usage.

New functions:
- reserved_pmp_init(): Initialize allocator scratch space
- reserved_pmp_alloc(): Allocate unused reserved PMP entry
- reserved_pmp_free(): Release allocated PMP entry

The coldboot hart calls reserved_pmp_init() during sbi_hart_init()
to set up the tracking bitmaps for all harts.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/riscv_asm.h |  6 +++
 lib/sbi/riscv_asm.c     | 92 +++++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c      |  4 ++
 3 files changed, 102 insertions(+)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index ef48dc89..4fd0be2b 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -221,6 +221,12 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len);
 
+int reserved_pmp_init(void);
+
+int reserved_pmp_alloc(unsigned int *pmp_id);
+
+int reserved_pmp_free(unsigned int pmp_id);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 3e44320f..6c81708f 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -9,10 +9,14 @@
 
 #include <sbi/riscv_asm.h>
 #include <sbi/riscv_encoding.h>
+#include <sbi/sbi_bitmap.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
 #include <sbi/sbi_console.h>
 
+static unsigned long reserved_pmp_used_offset;
+
 /* determine CPU extension, return non-zero support */
 int misa_extension_imp(char ext)
 {
@@ -432,3 +436,91 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 
 	return 0;
 }
+
+/**
+ * reserved_pmp_init() - Initialize the reserved PMP allocator
+ *
+ * This function initializes the reserved PMP allocator by allocating
+ * scratch space to track which reserved PMP entries are in use.
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int reserved_pmp_init(void)
+{
+	if (reserved_pmp_used_offset)
+		return SBI_EINVAL;
+
+	reserved_pmp_used_offset = sbi_scratch_alloc_offset(
+		sizeof(unsigned long) * BITS_TO_LONGS(PMP_COUNT));
+	if (!reserved_pmp_used_offset)
+		return SBI_ENOMEM;
+
+	return SBI_SUCCESS;
+}
+
+/**
+ * reserved_pmp_alloc() - Allocate an unused reserved PMP entry
+ * @pmp_id: Pointer to store the allocated PMP entry ID
+ *
+ * Returns: 0 on success, negative error code on failure
+ *
+ * The allocated PMP entry should be used with the following
+ * programming sequence:
+ * - reserved_pmp_alloc(&pmp_id)
+ * - pmp_set(pmp_id, ...)
+ * - pmp_disable(pmp_id)
+ * - reserved_pmp_free(pmp_id)
+ */
+int reserved_pmp_alloc(unsigned int *pmp_id)
+{
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	u32 reserved_pmp_count = sbi_platform_reserved_pmp_count(plat);
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned long *reserved_pmp_used;
+
+	if (!reserved_pmp_used_offset)
+		return SBI_EINVAL;
+
+	reserved_pmp_used = sbi_scratch_offset_ptr(scratch,
+					   reserved_pmp_used_offset);
+
+	for (int n = 0; n < reserved_pmp_count; n++) {
+		if (bitmap_test(reserved_pmp_used, n))
+			continue;
+		bitmap_set(reserved_pmp_used, n, 1);
+		*pmp_id = n;
+		return SBI_SUCCESS;
+	}
+
+	/* PMP allocation failed - all reserved entries in use */
+	return SBI_EFAIL;
+}
+
+/**
+ * reserved_pmp_free() - Free a reserved PMP entry
+ * @pmp_id: PMP entry ID to free
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int reserved_pmp_free(unsigned int pmp_id)
+{
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	u32 reserved_pmp_count = sbi_platform_reserved_pmp_count(plat);
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned long *reserved_pmp_used;
+
+	if (!reserved_pmp_used_offset)
+		return SBI_EINVAL;
+
+	reserved_pmp_used = sbi_scratch_offset_ptr(scratch,
+					   reserved_pmp_used_offset);
+
+	if (pmp_id >= reserved_pmp_count ||
+	    !bitmap_test(reserved_pmp_used, pmp_id)) {
+		return SBI_EINVAL;
+	}
+
+	bitmap_clear(reserved_pmp_used, pmp_id, 1);
+
+	return SBI_SUCCESS;
+}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index a91703b4..548fdecd 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1031,6 +1031,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 					sizeof(struct sbi_hart_features));
 		if (!hart_features_offset)
 			return SBI_ENOMEM;
+
+		rc = reserved_pmp_init();
+		if (rc)
+			return rc;
 	}
 
 	rc = hart_detect_features(scratch);
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
