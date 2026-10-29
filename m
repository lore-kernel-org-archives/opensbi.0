Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42170606A31D
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3r+AM0VX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms2PbPwP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1AtVE4qN9C7pnN8+DD69i6mmMcWDYGat30/yQ6lV/iw=; b=3r+AM0VX0C/xGUdq7kYDC9YQkZ
	gsshHGKyVyArl3FAveoTAyJbrTk9I72URJqQa8iI3K7HRmwi0E1sDt2ZHnYKWxgpTdRqK7qQlSK7/
	qVhrZD4nNg9oqAEeaTnrPtO/q1TIZ2H2S5mIJkvnnMHGIj6JrKSkFKpmtt1fuNWhn5rvPDQa5lZqf
	GqXgab7HUNRYkJNuXEg0RPEbYe2Smq6+o8imh4WzBFTI6beX8X86IUN/IypbgTa3QeuGBphojW/TD
	dfUUhKJg7MqISQ1SH/rHZQQ5LszpTW59ilS/vObOWJ4oFV7iVhkExF5xcAPttuTXLQt3COh7+vsy2
	U8LOvDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXj-00000009iHU-0Cxb;
	Thu, 29 Oct 2026 15:59:55 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXf-00000009iFE-3u8R
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 15:59:53 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5366ae57896so26845891cf.3
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289590; x=1793894390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feWrChgEHRsnKnWgkSFeYB2kuACZ93LvcF2PQQj5ucU=;
        b=ms2PbPwPONcRjGWklBBWYq5rtW4s3C4NiUbGclHmqaadeQUGvfKuCRn9Mzd4mS0xt/
         M91QXPuPe+W131+lnyIj6TZ/KcIHEvQcFmhRfsAm/B75OhSd5q99eg9rbWsotjzbXk3O
         bBY4KP5MU3E0U6r2kE6HQ+FxJVKbz9M29DFONo7xrB26XkNpMKe6Fo6l0DD2quLjP1cW
         po79B120MZ6dxL9vdUdXKt8r84wtsVuEqJzI3HZWRlGqGgbil67NhjC9oVEf/l66AvFm
         PxfXJejsIEcYMNjXBf8ODiF53D4JK/EQxJE0oG9FEBtbbQai34MsL1OdOIQIjAGwHZ5j
         gemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289590; x=1793894390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=feWrChgEHRsnKnWgkSFeYB2kuACZ93LvcF2PQQj5ucU=;
        b=DgSCpNwpZJs8TNlXOCf5b72DowJGouWAzanhgj13jfsCy8D44wJOLSBbYkZoTP36lA
         pLxnUWhFw69oP2Fm7lKvus5QuJSc3pO0o5ejviS/ZisWGOUTgRQ22fXUvuJVoCeHZLVh
         4O4g655Ci0VUx+VEpVf8R3R4ITifqFDFX5QL5/t0yMIBAgpbsPKwZtcSA0jdxOoC7hUT
         D+yz7jadQ5EREiB0NuamLZhEmq8hD5y1Uw5lvIa8iNaM4qPZCUDxfAQVlIZKgiCstWrS
         yWRNmZMDu3SPPf9zfLCg2of6H9wjwej65tDfCBh2hP67Z3tcjLXmLlu1PVfIXwNjEdSP
         /KdA==
X-Gm-Message-State: AFq9FYJp+JgXMaVTAL+9kXXRsj7OLmrSJjDWeG7QOZElAlqwxCMB2Jmf
	trLonNlhXix3KLvLVKv1MInxDjVClkh4xXoMfpc6bnYcBEu+HU1DxGuQgXyjnQ==
X-Gm-Gg: AYBFou0rxGhVi+cho+XxVZNAE3b65UbXJW9BFmLGiKydDi4XG1kZ4/MDIjnH41sA8qL
	JXnFnNumMYNscqUzO+03v3HCULA94O4QDWXeYxUdzsAo7Jmoa6EO+9pcAuHI7ngSpIrBlTPpZCQ
	l6kiXHuOhOeRAu/jUkIlh8fIAPeOpuTQND0JvzPAhVidaev3V9QJ74mDG/wFknbjGZwskxtubBG
	BUX0m8exzxVYESOkC4LdD++AUsdKlk/zyqF4jScXVXdRCBFEqnl3YZ985eyJcv/iDfbvat+5Od0
	fCLDXorjjmmP02pjQs2kt8Tl62AgLiYxKL/aX1KgkjXBJON/r9osE4Q7vBZIl1KYkfrLPY4Xc3b
	LDHpxuDcvXwqJtFwp2tZESE5AE254H9OPQZh+jN88J3fSMH/DcXqWJJkMVl9AX0jIhwyQ1Y2dEE
	UyDTG5OlRlU41CYCIwDuzr4ILYBt5eEL41ijmHgh86tapd7hIHexCJFsieAxefiDXV4j0og4axd
	2O9januY48qtisApUXNcXAIED0b262P9FWQUeX/HuJ52OkiwHYfkgaUn45ZkDkWORKW8M19b1he
	TrG18aUHgSUB00UmweWPXtbjqGiyeHCpG95dd6e1f7qfAJe3l4JNeIsxsh6/kc9rdQOOQ1tNPJP
	VPi/HhxlSvKpDxQ==
X-Received: by 2002:a05:622a:654:b0:536:8f5a:628 with SMTP id d75a77b69052e-53fcbfdf4f6mr96710031cf.52.1793289589859;
        Thu, 29 Oct 2026 08:59:49 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.08.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:59:49 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 02/12] lib: sbi: add experimental Yield ECALL extension
Date: Thu, 29 Oct 2026 11:59:19 -0400
Message-Id: <20261029155929.586597-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085952_037836_8D8487ED 
X-CRM114-Status: GOOD (  16.09  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raymond Mao <raymond.mao@riscstar.com>

Add a Yield extension with EID 0x0800594c and FID 0.
The ID is experimental and is not an official SBI assignment.

Complete the calling domain and hart's outstanding SYSIRQ batches
using the same completion mechanism as the next CLAIM. Return the number
completed, including partial progress on error, without claiming new IRQs.
Ask the backend to consider a drained return only after completion
succeeds.

Enable the extension with CONFIG_SBI_ECALL_YIELD and register it only
when SYSIRQ channels exist.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_ecall_interface.h |  6 +++++
 lib/sbi/Kconfig                   |  9 +++++++
 lib/sbi/objects.mk                |  3 +++
 lib/sbi/sbi_ecall_yield.c         | 42 +++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 lib/sbi/sbi_ecall_yield.c

diff --git a/include/sbi/sbi_ecall_interface.h b/include/sbi/sbi_ecall_interface.h
index fd4e77ca..287d3151 100644
--- a/include/sbi/sbi_ecall_interface.h
+++ b/include/sbi/sbi_ecall_interface.h
@@ -39,6 +39,9 @@
 #define SBI_EXT_FWFT				0x46574654
 #define SBI_EXT_MPXY				0x4D505859
 
+/* SBI extension ID for Yield. */
+#define SBI_EXT_YIELD				0x0800594c
+
 /* SBI function IDs for BASE extension*/
 #define SBI_EXT_BASE_GET_SPEC_VERSION		0x0
 #define SBI_EXT_BASE_GET_IMP_ID			0x1
@@ -122,6 +125,9 @@
 #define SBI_EXT_DBTR_TRIGGER_ENABLE	0x6
 #define SBI_EXT_DBTR_TRIGGER_DISABLE	0x7
 
+/* SBI function IDs for the Yield extension. */
+#define SBI_EXT_YIELD_YIELD	0x0
+
 /* SBI function IDs for FW feature extension */
 #define SBI_EXT_FWFT_SET		0x0
 #define SBI_EXT_FWFT_GET		0x1
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index 24132eaa..894ce22f 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -76,6 +76,15 @@ config SBI_ECALL_LEGACY
 	bool "SBI v0.1 legacy extensions"
 	default y
 
+config SBI_ECALL_YIELD
+	bool "Yield extension"
+	default y
+	help
+	  Enable the Yield ECALL extension.
+	  Yield completes the calling domain and hart's claimed SYSIRQs.
+	  A delivery backend may request a context return once work is drained.
+	  Interrupt claiming still uses RPMI SYSTEM_IRQ through SBI MPXY.
+
 config SBI_ECALL_VENDOR
 	bool "Platform-defined vendor extensions"
 	default y
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index ae27d0c5..16c141fe 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -64,6 +64,9 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
 libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
 
+carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_YIELD) += ecall_yield
+libsbi-objs-$(CONFIG_SBI_ECALL_YIELD) += sbi_ecall_yield.o
+
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
diff --git a/lib/sbi/sbi_ecall_yield.c b/lib/sbi/sbi_ecall_yield.c
new file mode 100644
index 00000000..fddc2d6c
--- /dev/null
+++ b/lib/sbi/sbi_ecall_yield.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2026 RISCstar Solutions Corporation.
+ *
+ * Author: Raymond Mao <raymond.mao@riscstar.com>
+ */
+
+#include <sbi/sbi_ecall.h>
+#include <sbi/sbi_ecall_interface.h>
+#include <sbi/sbi_error.h>
+#include <sbi_utils/sysirq/rpmi_sysirq.h>
+
+static int sbi_ecall_yield_handler(unsigned long extid, unsigned long funcid,
+				   struct sbi_trap_regs *regs,
+				   struct sbi_ecall_return *out)
+{
+	u32 completed = 0;
+	int rc;
+
+	if (funcid != SBI_EXT_YIELD_YIELD)
+		return SBI_ENOTSUPP;
+	rc = rpmi_sysirq_complete_thishart(&completed);
+	out->value = completed;
+	return rc;
+}
+
+struct sbi_ecall_extension ecall_yield;
+
+static int sbi_ecall_yield_register_extensions(void)
+{
+	if (!rpmi_sysirq_available())
+		return SBI_OK;
+	return sbi_ecall_register_extension(&ecall_yield);
+}
+
+struct sbi_ecall_extension ecall_yield = {
+	.name = "yield",
+	.extid_start = SBI_EXT_YIELD,
+	.extid_end = SBI_EXT_YIELD,
+	.register_extensions = sbi_ecall_yield_register_extensions,
+	.handle = sbi_ecall_yield_handler,
+};
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
