Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05063D21687
	for <opensbi@archiver.kernel.org>; Thu,  4 Dec 2025 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOmtF1+2vrX6gKjQSrE6CHULQhoBh6xnk81GOVJyJcg=; b=RyNM9/JXmKiMBg
	ac5VME0j93V3uowJlsEAAhHjprCt3FJpR1rBr68u40ZIp1s1nymqYzCWqNwimqnhrOsEWkeGs2lk3
	J564ub9cQ3vet/Abg0DIMA/GQmJxarD8x3GjWK6zn4EfUBxxo156po8BDKi0mzfJfb66xiPNTu+gj
	HyBbbH9y8geSowlN3VvFWvSK7oglclOLLVJ4vURh3YOsvShF8Tbxyq6VMADo627fJ9B71Pta3Ckrw
	cCsnLKG0Sg9kHWfi2yjIB6hcbP2gX8inyR5dS3wJdNSe0E0jOgQhNwNR8rSldD2jw7Psf3qLk0E8F
	uvyxvkkKXZh7PtzN3K+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAnb-00000008AGL-0jBC;
	Thu, 04 Dec 2025 14:59:15 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAnX-00000008AF2-1oiH
	for opensbi@lists.infradead.org;
	Thu, 04 Dec 2025 14:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=X1
	mhlO9+O/QZc3NFkLj7H2gRPmCdbvIsKWAozyro/UY=; b=EPaWQ+C+zmMGuMEIlK
	MNXU71/G4jSqbVnknVsMUjkoSx9xt7YSA5JAANBemDG5VS21JOwsojlH8IamcEK9
	nRkoLdZ9CuSc9Al72ALFOvVjh3U7S/Zr952BLg/mWavFYriJHd7qHw2IL48KlvAp
	PmqOVn+A5uLuzisUd6ujEo8XA=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3pwu4oTFpKmb+AA--.24795S3;
	Thu, 04 Dec 2025 22:59:05 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	peter.lin@sifive.com,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [PATCH 1/2] lib: sbi: restore platform CSR when suspend
Date: Thu,  4 Dec 2025 22:58:51 +0800
Message-ID: <20251204145901.411369-2-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204145901.411369-1-wxjstz@126.com>
References: <20251204145901.411369-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3pwu4oTFpKmb+AA--.24795S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3AryUur4rXFyUtF1rur18uFg_yoW7tFWfpF
	WjkFZxJw48Ka4Ig347Jw47ur4rGw1FqrW5KryUJw1IkasIqr1rJrZrJFyrtFZrAryxA3WU
	Zr42vr48uFs8Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pELZ2sUUUUU=
X-Originating-IP: [2408:823c:b211:2949:db98:1913:e9e:6e1a]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiIQ4aOmkxkAK8PwAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_065911_897476_3397340D 
X-CRM114-Status: GOOD (  14.73  )
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

When HART enters suspend mode, some platforms require specific CSRs
to be saved for recovery. This patch add interface for this.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 include/sbi/sbi_platform.h | 60 ++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hsm.c          | 12 +++++++-
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index d75c12de..175ec1e2 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -41,6 +41,9 @@
 #define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
 /** Offset of cbom_block_size in struct sbi_platform */
 #define SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET (0x60 + (__SIZEOF_POINTER__ * 3))
+/** Offset of suspend_backup_csr_count in struct sbi_platform */
+#define SBI_PLATFORM_SUSPEND_BACKUP_CSR_COUNT_OFFSET \
+					    (0x60 + (__SIZEOF_POINTER__ * 4))
 
 #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
 
@@ -146,6 +149,12 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+
+	/** Save platform specific CSR before suspend */
+	void (*suspend_non_ret_save)(unsigned long *data);
+
+	/** Restore platform specific CSR after suspend */
+	void (*suspend_non_ret_restore)(unsigned long *data);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -198,6 +207,13 @@ struct sbi_platform {
 	const u32 *hart_index2id;
 	/** Allocation alignment for Scratch */
 	unsigned long cbom_block_size;
+
+	/**
+	 * When HART enters suspend mode, some platforms require specific CSRs
+	 * to be saved for recovery. This variable tracks how many CSRs need to
+	 *  be backed up for this platform.
+	 */
+	unsigned long suspend_backup_csr_count;
 };
 
 /**
@@ -216,6 +232,8 @@ assert_member_offset(struct sbi_platform, platform_ops_addr, SBI_PLATFORM_OPS_OF
 assert_member_offset(struct sbi_platform, firmware_context, SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET);
 assert_member_offset(struct sbi_platform, hart_index2id, SBI_PLATFORM_HART_INDEX2ID_OFFSET);
 assert_member_offset(struct sbi_platform, cbom_block_size, SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET);
+assert_member_offset(struct sbi_platform, suspend_backup_csr_count, SBI_PLATFORM_SUSPEND_BACKUP_CSR_COUNT_OFFSET);
+
 
 /** Get pointer to sbi_platform for sbi_scratch pointer */
 #define sbi_platform_ptr(__s) \
@@ -666,6 +684,48 @@ static inline void sbi_platform_pmp_disable(const struct sbi_platform *plat,
 		sbi_platform_ops(plat)->pmp_disable(n);
 }
 
+/**
+ * Platform specific CSR count to backup during suspend.
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return csr count need backup
+ */
+static inline unsigned long sbi_platform_suspend_backup_csr_count(
+					    const struct sbi_platform *plat)
+{
+	if (plat)
+		return plat->suspend_backup_csr_count;
+	return 0;
+}
+
+/**
+ * Save platform specific CSR before suspend
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param data buffer used to save CSR
+ */
+static inline void sbi_platform_suspend_non_ret_save(
+					    const struct sbi_platform *plat,
+					    unsigned long *data)
+{
+	if (plat && sbi_platform_ops(plat)->suspend_non_ret_save)
+		sbi_platform_ops(plat)->suspend_non_ret_save(data);
+}
+
+/**
+ * Restore platform specific CSR after suspend
+ * @param plat pointer to struct sbi_platform
+ * @param data buffer used to restore CSR
+ */
+static inline void sbi_platform_suspend_non_ret_restore(
+					    const struct sbi_platform *plat,
+					    unsigned long *data)
+{
+	if (plat && sbi_platform_ops(plat)->suspend_non_ret_restore)
+		sbi_platform_ops(plat)->suspend_non_ret_restore(data);
+}
+
 #endif
 
 #endif
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..949f7aaf 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -21,6 +21,7 @@
 #include <sbi/sbi_hsm.h>
 #include <sbi/sbi_init.h>
 #include <sbi/sbi_ipi.h>
+#include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_timer.h>
@@ -50,6 +51,7 @@ struct sbi_hsm_data {
 	unsigned long saved_mideleg;
 	u64 saved_menvcfg;
 	atomic_t start_ticket;
+	unsigned long platform_saved[0];
 };
 
 bool sbi_hsm_hart_change_state(struct sbi_scratch *scratch, long oldstate,
@@ -249,9 +251,13 @@ int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
 {
 	struct sbi_scratch *rscratch;
 	struct sbi_hsm_data *hdata;
+	unsigned long n;
 
 	if (cold_boot) {
-		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata));
+		n = sbi_platform_suspend_backup_csr_count(
+			sbi_platform_ptr(scratch));
+		hart_data_offset = sbi_scratch_alloc_offset(sizeof(*hdata) +
+							    n * sizeof(long));
 		if (!hart_data_offset)
 			return SBI_ENOMEM;
 
@@ -430,6 +436,8 @@ void __sbi_hsm_suspend_non_ret_save(struct sbi_scratch *scratch)
 	hdata->saved_mideleg = csr_read(CSR_MIDELEG);
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12)
 		hdata->saved_menvcfg = csr_read64(CSR_MENVCFG);
+
+	sbi_platform_suspend_non_ret_save(sbi_platform_ptr(scratch), hdata->platform_saved);
 }
 
 static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
@@ -443,6 +451,8 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
 	csr_write(CSR_MEDELEG, hdata->saved_medeleg);
 	csr_write(CSR_MIE, hdata->saved_mie);
 	csr_set(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
+
+	sbi_platform_suspend_non_ret_restore(sbi_platform_ptr(scratch), hdata->platform_saved);
 }
 
 void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
