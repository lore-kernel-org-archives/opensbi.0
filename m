Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA67CCD1BF
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcW5PwTELmz8DyCOILKczsbtrMC4p+qMdyZVXJeHtGs=; b=2j6RsiqaQZWjja
	vqCtH5BzrpQscd5yOYZ1iHtyhJe8Pldgf4w/B8eXRROHhZopf4Mj5f4koa3Dy7TKL3MWLu2PnwdpU
	SMQbkxOxyp7lMKqB+pkN2ysrzaBZ6H4SbyEg8THmYkb5ortc1ye7qrQHHi1Gqhs6z8wS8uBRLyGUB
	JXCbKGmou1NLBx4KH2SJp2GQTNywXDHu4oVhFz19iclYeS7ztKbZI5un7Or3rcu0EJ6RY14i3xhgP
	zRS5hgzcXKaMhs8WmRsbuKc4xH4AdA5JIZryxEi4nkIZH9E9IQPHCGvwHwYeyswRSJzYzU3xvevne
	pbCjze0wJ+97bxSIbhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ3-0000000B9nU-2a2i;
	Sat, 25 Oct 2025 09:18:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ1-0000000B9mP-2jHm
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7a4176547bfso200957b3a.2
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383917; x=1761988717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R24QWXM8s25uaJksrfURDy7lYDmCy+sHwvxJkP/MDi4=;
        b=H2pJc9zj8N58hsAyJ9WEVTGQTV3Fn9XEiIdJd1vGlAmiBfXL6eRc/6Oa/QKAGDUXPk
         g5SIVXq1Aer2wO81/sXEotj1HPHQ5wMmXgiVKERrx1kZIrT9FvhhXIAzXTsNROE/d6FG
         OuJ1AOOmyzzvpxSTBpEF1aIK/BYwy0rbc7/tvb3zt6FitQpG/RUEUwb0IJH3+BmrbKch
         Eawse5+usykHWXZIfPhORCzNa9GEmCbVm9jloqwSUWNLrU8OE5ZcQb3i4hi8ZA6FCy6W
         LX8ZJ/rydBcsBGzCGbJonS1CY3DBwhF+dDolkXKMJp6Ua75zwLrGzB9ESetAqrnnRxWW
         g3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383917; x=1761988717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R24QWXM8s25uaJksrfURDy7lYDmCy+sHwvxJkP/MDi4=;
        b=qD3rPYGcHIO4uNFrS/kK43LEK24PMRaJs/7Dd5k/+o4bzYAy5sSU7Rrgs1orO4MPu7
         vhuubWUSZkPFFv+4oxueINkv43AhcQ+5aJMIDqAU2D142J0bwjG9kbV2FcPB8LlAJTT4
         i4cXvw+KPQY1eZOOvHOOPVCiZ/OFwsDo8wdvn6NcOpv7VJdNv2LrfWMLVY12XVPIdV66
         LzgyrhYTAx9qH2mBiNTbbsylnvc8AJpnDRK5ae+wyizC2+g5XwKxvdt30nYimIjpUmNi
         GRDwxCUKnsDlpP8+dn24U6o+G53GrugI3K1lVVU+/Wo7fDfLrhkz890s+991ux/nZQ8D
         yhVA==
X-Gm-Message-State: AOJu0YxWukj2ZqhUETC0B4jbuuwk4ifmDaONc2EooHmW4buWCnnie3y7
	N/pJ7g1y7cmIYxWlhBlySlhLR31CQdpgio5HOpsaogMM7E/CIcaUMPAuddk+K4adJoJmqxoRrAX
	WxDoU058WlzyYcfmlorqMpEA8OuzNZQoRKAvdyhx3stiTwI5ZTCTGYiWSZtUPkLqb6NdhJoXFl8
	6fkEjDPLE2uyzqWuBbMpF8nDYvRVn8dxUBq6QrsRvDZ8J5U8RX
X-Gm-Gg: ASbGncv+TX7rF20JKmfQSRMNt7c+lXwKlcNSWB9Lf68CAYBPS0Wy/7eKn4tZ41uRwXM
	YXj8GoEHn78j3+aJEhHDXNxf9c19oB3x3Q2bbOU/Ru/uE7Kk506WRkN/eJUVUzxXdVjRRL3C9mZ
	x1S3qUVSFSY1elcj/k6/VAK9As368wvF1AtpL63vfiT8jz/vnD9tDJgNaGxAXT71nhlZ53ILdO6
	W8bDyowkxoB/CT3jMKUkuo90cifpcYJ0n2DvGulnf5c/OiDpfIw2yyjnUFgBRDH0mIwDa5w2+1H
	G6+TdRUn98QuC5NihsahtgvR9twDfE6kjBfTXuf5VbAVblF1Lm2SGtltu4CJykQNheKDmZ7ERUt
	7hG/gFY8lv1AmIDhh2OkiT8GZBr6wA2Shr/Rc51FG6w8t4Z5Gxuo6bMcYp5Y41P3AJuYlaoGjpu
	WOa1p18IL32nTeZt2FAt3Um17o
X-Google-Smtp-Source: AGHT+IFmh/+jApNJlwO5fdl/DG50U8IOUBB0qj+iCYGJwu21GP2x4DvyQuVOrOxRPvcFgKkWN5d1rA==
X-Received: by 2002:a17:90b:2f8d:b0:32d:d8de:191e with SMTP id 98e67ed59e1d1-33fd65fbff3mr6086873a91.10.1761383916489;
        Sat, 25 Oct 2025 02:18:36 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:36 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 5/7] lib: sbi: riscv_asm: support reserved PMP allocator
Date: Sat, 25 Oct 2025 17:18:09 +0800
Message-ID: <20251025091811.506511-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251025091811.506511-1-peter.lin@sifive.com>
References: <20251025091811.506511-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021837_784595_B9716592 
X-CRM114-Status: GOOD (  14.24  )
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

In sbi_hart_init(), the coldboot hart will call reserved_pmp_init()
to create scratch space to store reserved_pmp_used bitmaps for each
hart, then user can use reserved_pmp_{alloc,free}() function pair
to allocate and release high-priority reserved PMP entries.

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
index 3e44320f..2beb3ba4 100644
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
+ * The following programming sequence is expected to use the
+ * allocated PMP entry:
+ * - reserved_pmp_alloc(&pmp_id)
+ * - pmp_set(pmp_id, ...)
+ * - pmp_disable(pmp_id)
+ * - reserved_pmp_free(pmp_id)
+ */
+int reserved_pmp_alloc(unsigned int *pmp_id)
+{
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned long *reserved_pmp_used;
+
+	if (!reserved_pmp_used_offset)
+		return SBI_EINVAL;
+
+	reserved_pmp_used = sbi_scratch_offset_ptr(scratch,
+						   reserved_pmp_used_offset);
+
+	for (int n = 0; n < plat->reserved_pmp_count; n++) {
+		if (bitmap_test(reserved_pmp_used, n))
+			continue;
+		bitmap_set(reserved_pmp_used, n, 1);
+		*pmp_id = n;
+		return SBI_SUCCESS;
+	}
+
+	sbi_printf("%s: Failed to allocate PMP entry. "
+		   "Please increase reserved-pmp-count\n", __func__);
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
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	unsigned long *reserved_pmp_used;
+
+	if (!reserved_pmp_used_offset)
+		return SBI_EINVAL;
+
+	reserved_pmp_used = sbi_scratch_offset_ptr(scratch,
+						   reserved_pmp_used_offset);
+
+	if (pmp_id >= plat->reserved_pmp_count ||
+	    !bitmap_test(reserved_pmp_used, pmp_id) ||
+	    is_pmp_entry_mapped(pmp_id)) {
+		return SBI_EINVAL;
+	}
+
+	bitmap_clear(reserved_pmp_used, pmp_id, 1);
+
+	return SBI_SUCCESS;
+}
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 1b50f671..f173187c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1058,6 +1058,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
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
