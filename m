Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAC3C71136
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWrcbsB2mPMgiJ1R42nquhP/nYUMnfyc51wlvT/U6tA=; b=ALUgvxrpCFhJDm
	c6OCtBPs7bqBSAKKaszMsw1QUJ5Ymao63qdu39tYgcpM+L+b7jvURg5j6gRFTlGyCnfPfDgYNnEP1
	4mR1LI9/mpylpkOexRkmgXBI55yBa0bnpHod4uvW9r854p63LURaFdB5VNS8O+LsYuXp6t8RP6a/d
	fOHkS/9Rj+WnygL5iXJxvmWQidVRgR91mduBNoVFKkuAMDlitqw9G2BdUSyZh0UjoQ+WwQrNQY+9j
	K6KzTGtPZVSRvzM8pFo7PrxXsoWJgN9tqvURc2Lw7VD3yuDNrX9ECPjUxKfixb1CpiNNj7Iiu0gWt
	aG3eH11gQSsWxbjeo+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL5-0000000ANl2-0JW7;
	Wed, 11 Jun 2025 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKD-00000009p0t-0RxO
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kfAHimJr9p6HuywG6oFgxWV3EU+2olmMUmPzgU/ykNs=; b=AsgGv40QXBdcaCdeN3sWpl3nAT
	5MDdmU+YYwP5uWIZnUMm0+63OtbYRmZQVvW7zBFlo7Y2AdXNHiHtizijmCtSQJ+Eei3CGUjQ3GHrW
	gwINQdACAC3ExxURq8HEuR0SJ/bOVM22lBpT88IibYs0fDsRRc8ZxClodxOIA4B53zHKfNJiCQ2eg
	00Lt0d+OhFQQlOzBhNRsoNbNBp1OafdKZ78suGe6oOdoTvDLkQ0gqBjabqVUs0Bnfquu/UFDTfGP6
	rn1Hkv8102ICAalV910LJjk7PKrmViJk3hhwJ41oeSNTXSyeup8Rncj9cgQyZafKjc4ZHhudRzLau
	QcYwBCXg==;
Received: from m16.mail.126.com ([117.135.210.9])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKA-00000002NeV-238v
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kf
	AHimJr9p6HuywG6oFgxWV3EU+2olmMUmPzgU/ykNs=; b=lg26oDMt+C5994Z3Ez
	bj1AzfUK2xaOmKsAYhI1/wEOf8eSOv7XItjqU69G2WYwIciYIwUfqTVtjtNl3PDk
	SzCpKqU431K1+gj9UjGkOX/mDIIMFhsLFFQNOHwcYNbpqkS7wSSEGtecMNjiEsqQ
	xFystGQHRSqpXJFgWB2CUq2/w=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S12;
	Wed, 11 Jun 2025 20:12:43 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 10/12] lib/utils: Fix Zicntr detection in fdt_cpu_fixup
Date: Wed, 11 Jun 2025 20:12:27 +0800
Message-ID: <20250611121236.937455-11-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S12
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw18JrW8Xry8Zr4rXFyxKrg_yoW8ZrW7pF
	ZxGasFkrWvqas7K39a9FsrWw15Gws7t347GrWSk34Fya4UAryrXrWfK3WjyFyDJFWfJa4U
	Aws2qFy8uFsrGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEqXdUUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFxdpOmhJa81dAwAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131259_056090_7B4F6C87 
X-CRM114-Status: GOOD (  10.90  )
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
