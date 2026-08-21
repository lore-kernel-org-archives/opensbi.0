Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D4C5DF7D
	for <opensbi@archiver.kernel.org>; Fri, 21 Aug 2026 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6R3q6qlnG4nuGzpsOyb+gk7yIVvMx+8NppnT3IcGlsE=; b=RPXUZGXFHvMbBc
	mj22XfdMlnZDVd2+tVyE2rHT+G1juYSuPQjxtP9PqC0WEXmOAznU7XhKimSb6uvydLl2+t5o03Bc6
	aYQE/iPtDHjDWBh4ZURxzMwMr/ihFnlezLk+vMU+CMpBknV6VgY2XD32Pkg5LdFHD7RDJwy79HfH2
	rb5Xi/L5tyE4Ey2UEzFrrYTaOq8CopY/YUcsovYsXmvC4H4vc633MC5Z+yq+oj6nASVj/x0bHPcGD
	M+M7V745pXy5nh2MOWilMhkJGEbZp7SbuO4petg4RaYAoy3GZIM+TfXmXosQJrLIJaOSlYSgvehGZ
	Qa4ItjK5044Lt5ULeK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMGA-0000000D4KF-3SfM;
	Fri, 21 Aug 2026 10:14:02 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMG7-0000000D4FT-1V2o
	for opensbi@lists.infradead.org;
	Fri, 21 Aug 2026 10:14:01 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 67LADmPT081213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Aug 2026 18:13:48 +0800 (+08)
	(envelope-from alvinga@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Fri, 21 Aug
 2026 18:13:48 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Aug
 2026 18:13:48 +0800
From: Alvin Chang <alvinga@andestech.com>
To: <opensbi@lists.infradead.org>
CC: <anup@brainfault.org>, Alvin Chang <alvinga@andestech.com>
Subject: [PATCH] firmware: payload: test: Relocate GOT entries before calling C code
Date: Fri, 21 Aug 2026 18:13:39 +0800
Message-ID: <20260821101339.3563598-1-alvinga@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 67LADmPT081213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_031359_746524_D60368D8 
X-CRM114-Status: GOOD (  12.34  )
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

The test payload is linked as a PIE but, unlike fw_base.S, its startup
code never processed its own dynamic relocations. Nothing in the payload
needed a GOT so far, so this went unnoticed.

CONFIG_STACK_PROTECTOR_ALL=y changes that. GCC derives the
__stack_chk_guard reference from an artificial declaration with default
visibility, so under -fPIE it always loads the guard address through the
GOT. The linker zeroes that entry and records an R_RISCV_RELATIVE
relocation instead, which nobody applies. test_main() then reads the
canary from a NULL pointer before the first sbi_ecall_console_puts(), so
the payload hangs silently right after the OpenSBI boot banner. The other
two configurations emit no canary in the payload, leaving .rela.dyn
empty, which is why only this one breaks.

Keep .rela.dyn in the payload image and apply the R_RISCV_RELATIVE
entries at the top of _start, reusing the code from fw_base.S. The loop
is skipped when .rela.dyn is empty.

Fixes: edfbc1285dd9 ("firmware: Initial compiler built-in stack protector support")
Reported-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Alvin Chang <alvinga@andestech.com>
---
 firmware/payloads/test.elf.ldS |  6 ++++++
 firmware/payloads/test_head.S  | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/firmware/payloads/test.elf.ldS b/firmware/payloads/test.elf.ldS
index 2328a1b7..6632c132 100644
--- a/firmware/payloads/test.elf.ldS
+++ b/firmware/payloads/test.elf.ldS
@@ -47,6 +47,12 @@ SECTIONS
 		PROVIDE(_rodata_end = .);
 	}
 
+	.rela.dyn : {
+		PROVIDE(__rela_dyn_start = .);
+		*(.rela*)
+		PROVIDE(__rela_dyn_end = .);
+	}
+
 	/* End of the read-only data sections */
 
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
index e4fcaaca..09d0ad18 100644
--- a/firmware/payloads/test_head.S
+++ b/firmware/payloads/test_head.S
@@ -7,6 +7,7 @@
  *   Anup Patel <anup.patel@wdc.com>
  */
 
+#include <sbi/riscv_elf.h>
 #include <sbi/riscv_encoding.h>
 #define __ASM_STR(x)	x
 
@@ -24,6 +25,13 @@
 #define REG_S		__REG_SEL(sd, sw)
 #define REG_ADDW	__REG_SEL(addw, add)
 
+/* Link time address of _payload_start, see test.elf.ldS */
+#ifdef FW_PAYLOAD_OFFSET
+#define PAYLOAD_LINK_START	(FW_TEXT_START + FW_PAYLOAD_OFFSET)
+#else
+#define PAYLOAD_LINK_START	0
+#endif
+
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _start
@@ -45,6 +53,28 @@ _sc_fail:
 #endif
 	bnez	a3, _start_hang
 
+	/* relocate the global table content */
+	li	t0, PAYLOAD_LINK_START	/* link start */
+	lla	t1, _payload_start	/* load start */
+	sub	t2, t1, t0		/* load offset */
+	lla	t0, __rela_dyn_start
+	lla	t1, __rela_dyn_end
+	beq	t0, t1, _relocate_done
+2:
+	REG_L	t5, __SIZEOF_LONG__(t0)	/* t5 <-- relocation info:type */
+	li	t3, R_RISCV_RELATIVE	/* reloc type R_RISCV_RELATIVE */
+	bne	t5, t3, 3f
+	REG_L	t3, 0(t0)
+	REG_L	t5, (__SIZEOF_LONG__ * 2)(t0)	/* t5 <-- addend */
+	add	t5, t5, t2
+	add	t3, t3, t2
+	REG_S	t5, 0(t3)		/* store runtime address to the GOT entry */
+
+3:
+	addi	t0, t0, (__SIZEOF_LONG__ * 3)
+	blt	t0, t1, 2b
+_relocate_done:
+
 	/* Save a0 and a1 */
 	lla	a3, _boot_a0
 	REG_S	a0, 0(a3)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
