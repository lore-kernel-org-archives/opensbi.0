Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD59CC6B2C
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJWwQPgoDrXBILWuI7eHxvb4dYXsRU24RLsj6DrvyCE=; b=vShQ1gZCbbt/Pn
	fqLqERBeW2AbbZereiTfOpcGBIsF9i6WB9l/kJv/8XHjHdbqSkwuAebVKmYPCgB3nRjf1By0/3q0Q
	c4C9YV+cPoB37y3XIqFiEF376DoDL7t928wC9GtyGEwPApwoyUtqkDr/HW4nNR7d59hOo0CcFDyW/
	s6GPNIeHVjq5p+gaKZIB/VoQb9gZNcSnE5q2e/vagHMXZslBgzdHK7Ujoq1HlZiKJhNhsOaRJ9HGr
	vKfgc1aLvfTtQgCUjVm35kjIT82xDoYDNpimWRzP+cxeRTL3B+q8P0BtmhfioXIbrahkCRI3PmORO
	cPwXPBajpurmOkhlr/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCP-0000000FLOX-3xCR;
	Wed, 14 Oct 2026 11:31:09 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCM-0000000FLMh-44kF
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:08 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-15ea896ddc8so1199322c88.0
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977466; x=1792582266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpxoiKO4xlX6aAWfnkj/HNj8KgBBf3Fbt9+RikG2wL0=;
        b=Vdn8dhQIML7F5FeC/o5u2XMbM2PlMUbm+8aZG+Xmc50vty/V/rlAhH6A7h9EzM13To
         wfOyrViQkbOHrefKkLMn2V+fElVM/o3uKx0o6+dCqVIkGnSplj/kbaNYBNKrnjum2PXH
         2VNqLcnJjPwHl4TIZb4fWqbOxSD2tXNxt9mnvZ9FXlC94xFLZgqAcVpA0l5p+F0g2kzT
         +lM4TbQoXtnjI3yL4llK528EuSrUmfs91aOk2mkNwO9hMSPk3C6y8FiIzyeJsGLodDcY
         e19rJUhhJtGbBIRzOVMIdQhZDI5++gyAAUTrGLrhH8arnzXrLZmUKWWv7DTszqVO6gtw
         wyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977466; x=1792582266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpxoiKO4xlX6aAWfnkj/HNj8KgBBf3Fbt9+RikG2wL0=;
        b=Q8dea2gMgZBHTzHUzNS2yM+YP2PnR0Jpms+u88jXdaRwTfXMJIIWDhyHqi/meMfXUI
         2K7yw6yO/aVoDKDHM++UDPKiix+VaIaZ4ooG8VP9wqykVq2IxdqwEOR7v+NyHwtYuPAp
         sVfWiOGl7/PCRRnjrFNhVPrtMxp8beMZA5CIZHXSgBf2PcL8yzQzyr5kxQKlCns/3VYS
         aoiN4W2PJkJFajAPO4vi2LZmnR470B5b2vPaciqkPkM949In/3+jzmfORplHqBiow3kZ
         J8CssXlH2oqmqpgpcq/Jba1Eni/+lellKyKFWVnKBA7KmygAleaXgXHcE5YrjO5LcQ2a
         Jekw==
X-Gm-Message-State: AFq9FYLrdeLoBQa/bvg3PznnbI2Ah/wfEyvsgqs9cKT4pq085zw1LHCx
	qQyA8VsBvQx1xoxlwGtuCrnAorS2cvSy7+dF8OeE0lrZrTR+llqajdqYgHLUzG/9WuZ6TbsHtUm
	HlAek0UKG8CEiABiQfauKSVU2N4RwkurjnPzkgaGH0YKHHh4BXvuHVd1nzrkpC+fIjrl07dUwfL
	Jv0oKSzVR6Mwee2dLjWjkzfYxNGl+05DPlYrpqgb6XQyRF9PiYw8XEd4c=
X-Gm-Gg: AYBFou1pyXvEbcpVyCy2pYGZiVcuiD6XrgFROEQg4PKHEwNX2/PU631UvNA7T9QMnWN
	mmZeE7pVTJ7KfVDrwELuu47XZTxBXJ5BTYUqZXyMZaeofbbfSfxNH+llr/ZE9hRHOylMM+iAwX4
	JM7ifghRNgMyfDwxpiInUTR34sY7/Nqieg0JFlxSkJRTK2yG79V98H7W+ElelyQ4ze+z30/OtOf
	ARIVE6FfFjprLuFLIkNT7t1dxQPmi5Qf+UMjY9T//gAn7HdmyPIO/sisbnbRoaEt5GbSQfIVKYK
	0IOBxbhoIYNeCMUepQ3rhz0qm6qEKxGFx1IeqqlW3GeElNtxVLjTQqOZyy2rd9Nc1EdGH/hc2EU
	wr9u46GNDk7olfrKfD2zT7lCNuSvkvLuBAvUuvTMAzwcXfpk6ar7G1II/83VsTfiH0e+FkGrGe6
	LfrQZX+VNYpQEHsQcssjmaFnTW/XPsc1hqWtRgyYyz5sbFS5VpsU+LV9I6bMCjZsCU8LSDIM/Vo
	3jm9semr0gieV4+pwaV
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-16a5e49fe06mr23290323c88.14.1791977465661;
        Wed, 14 Oct 2026 04:31:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:05 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 3/7] lib: utils/fdt: Indicate when cached FDT blob offsets are valid
Date: Wed, 14 Oct 2026 04:30:20 -0700
Message-ID: <20261014113100.2192229-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014113100.2192229-1-samuel.holland@sifive.com>
References: <20261014113100.2192229-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_043107_025827_7AF9880F 
X-CRM114-Status: GOOD (  12.84  )
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

During the cold boot process, data such as the CPU node offsets is
repeatedly parsed from the FDT blob. Caching this information can save
code size and significantly speed up the boot process. However, any
changes to the FDT blob may affect its structure and invalidate cached
offsets and pointers. As a result, any caching logic must check if the
FDT blob has been modified. Since all writes to the FDT blob go through
fdt_get_address_rw(), performing the validity check is straightforward.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - New patch for v3

 include/sbi_utils/fdt/fdt_helper.h | 31 +++++++++++++++++++++---------
 lib/utils/fdt/fdt_helper.c         | 19 ++++++++++++++++++
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
index 1246ab69..263e07c7 100644
--- a/include/sbi_utils/fdt/fdt_helper.h
+++ b/include/sbi_utils/fdt/fdt_helper.h
@@ -11,7 +11,6 @@
 #define __FDT_HELPER_H__
 
 #include <sbi/sbi_types.h>
-#include <sbi/sbi_domain.h>
 
 struct fdt_match {
 	const char *compatible;
@@ -106,14 +105,28 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
 int fdt_parse_compat_addr(const void *fdt, uint64_t *addr,
 			  const char *compatible);
 
-static inline const void *fdt_get_address(void)
-{
-	return (const void *)root.next_arg1;
-}
+/**
+ * Check whether cached FDT blob offsets are still valid
+ *
+ * If this function returns false, the structure of the FDT blob may have been
+ * modified, and cached offsets must not be passed to FDT accessor functions.
+ *
+ * @returns true if the FDT blob has never been modified during the execution
+ * of the firmware, else false
+ */
+bool fdt_cached_offsets_valid(void);
 
-static inline void *fdt_get_address_rw(void)
-{
-	return (void *)root.next_arg1;
-}
+/**
+ * Get a pointer to the platform's flattened devicetree blob
+ */
+const void *fdt_get_address(void);
+
+/**
+ * Get a writable pointer to the platform's flattened devicetree blob
+ *
+ * This function should be used only by code that explicitly needs to modify
+ * the FDT blob (e.g. FDT fixup routines).
+ */
+void *fdt_get_address_rw(void);
 
 #endif /* __FDT_HELPER_H__ */
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index f78ea39e..c5d76707 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -9,6 +9,7 @@
 #include <libfdt.h>
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
@@ -33,6 +34,24 @@
 #define DEFAULT_SHAKTI_UART_FREQ		50000000
 #define DEFAULT_SHAKTI_UART_BAUD		115200
 
+static bool cached_offsets_valid = true;
+
+bool fdt_cached_offsets_valid(void)
+{
+	return cached_offsets_valid;
+}
+
+const void *fdt_get_address(void)
+{
+	return (const void *)root.next_arg1;
+}
+
+void *fdt_get_address_rw(void)
+{
+	cached_offsets_valid = false;
+	return (void *)root.next_arg1;
+}
+
 int fdt_parse_phandle_with_args(const void *fdt, int nodeoff,
 				const char *prop, const char *cells_prop,
 				int index, struct fdt_phandle_args *out_args)
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
