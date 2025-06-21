Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32B2C7EE32
	for <opensbi@archiver.kernel.org>; Sat, 21 Jun 2025 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWrcbsB2mPMgiJ1R42nquhP/nYUMnfyc51wlvT/U6tA=; b=vbsgRHB3sAEp2H
	FS8+pbDbYr4gNmbLPToT84zPDhxCs3rx58HRecGE27PFVvkh+cb7nKROvO/NGy7J81DghrnsuYAd+
	/yTtSib00loLABlc/Ijn+LwSThwLgl+igdM/Il/Au4KxiwAVsLVBTDu/3ugDs5WZgQ7fBdWVanYlS
	G9PgqR0Sc7XvYu6a7IxpqdOs3BmbOZr9qxrUv+0BWPbsv9+FDXmXdnmTCZv/4TnpN2bMK8yjOLt2e
	AxF3TU7CeGeW3krIl5f+fdOp2aeOuT7ef+Az3GfU8r+3yhwYfjInDRNR0aJC/gv82H0TKCtNDtgVJ
	nN+Q9BFLT5r9Unj+Fxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSpyj-0000000H5zL-2j8n;
	Sat, 21 Jun 2025 04:37:21 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSplA-0000000H4zq-44Zs
	for opensbi@lists.infradead.org;
	Sat, 21 Jun 2025 04:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kf
	AHimJr9p6HuywG6oFgxWV3EU+2olmMUmPzgU/ykNs=; b=Lq9pT95JYr1NchHMYG
	XyFl9isRco57xQUajvqLl1d6/dYIfJEwBXschpE9qePPHXOpZhDt69ZonPGHidar
	msWRRSweH/qaH2mVzTLfjDg4CpEQMU5+BCfOtliKZnzb34hsqYHJajNs4RV/89Ts
	fQjkrKLjEFfnyCM2MtSVsdC0k=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3362pM1Zozz3yAA--.37963S9;
	Sat, 21 Jun 2025 12:23:11 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH v2 7/9] lib/utils: Fix Zicntr detection in fdt_cpu_fixup
Date: Sat, 21 Jun 2025 12:22:55 +0800
Message-ID: <20250621042302.160802-8-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621042302.160802-1-wxjstz@126.com>
References: <20250621042302.160802-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3362pM1Zozz3yAA--.37963S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw18JrW8Xry8Zr4rXFyxKrg_yoW8ZrW7pF
	ZxGasFkrWvqas7K39a9FsrWw15Gws7t347GrWSk34Fya4UAryrXrWfK3WjyFyDJFWfJa4U
	Aws2qFy8uFsrGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zitxhLUUUUU=
X-Originating-IP: [2408:823c:b211:38d5:8750:6ca9:3f88:f953]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1w9zOmhWM5sA-gAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_212321_355093_871E31E9 
X-CRM114-Status: GOOD (  10.96  )
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

As a result of the change in the boot sequence, it is now
possible to check in fdt_cpu_fixup if a specific HART supports
CY/IR, instead of assuming that all HARTs have the same support
for CY/IR.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/utils/fdt/fdt_fixup.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index f3fe8af9..ed9b77c1 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -108,22 +108,13 @@ int fdt_add_cpu_idle_states(void *fdt, const struct sbi_cpu_idle_state *state)
 
 void fdt_cpu_fixup(void *fdt)
 {
-	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	struct sbi_scratch *rscratch;
 	struct sbi_domain *dom = sbi_domain_thishart_ptr();
 	int err, cpu_offset, cpus_offset, len;
 	const char *mmu_type, *extensions;
 	u32 hartid, hartindex;
 	bool emulated_zicntr;
 
-	/*
-	 * Claim Zicntr extension in riscv,isa-extensions if
-	 *  1. OpenSBI can emulate time CSR with a timer
-	 *  2. The other two CSRs specified by Zicntr are available
-	 */
-	emulated_zicntr = sbi_timer_get_device() != NULL &&
-			  sbi_hart_has_csr(scratch, SBI_HART_CSR_CYCLE) &&
-			  sbi_hart_has_csr(scratch, SBI_HART_CSR_INSTRET);
-
 	err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 	if (err < 0)
 		return;
@@ -153,6 +144,19 @@ void fdt_cpu_fixup(void *fdt)
 			fdt_setprop_string(fdt, cpu_offset, "status",
 					   "disabled");
 
+		rscratch = sbi_hartindex_to_scratch(hartindex);
+		if (!rscratch)
+			continue;
+
+		/*
+		 * Claim Zicntr extension in riscv,isa-extensions if
+		 *  1. OpenSBI can emulate time CSR with a timer
+		 *  2. The other two CSRs specified by Zicntr are available
+		 */
+		emulated_zicntr =
+			sbi_timer_get_device() != NULL &&
+			sbi_hart_has_csr(rscratch, SBI_HART_CSR_CYCLE) &&
+			sbi_hart_has_csr(rscratch, SBI_HART_CSR_INSTRET);
 		if (!emulated_zicntr)
 			continue;
 
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
