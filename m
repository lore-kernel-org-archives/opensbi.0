Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9076DCCD19A
	for <opensbi@archiver.kernel.org>; Tue, 18 Nov 2025 04:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2epPMDiWn8l6WriLjUp17AESjnOW0m3iFSJo1Btnlbg=; b=xpvON1caHCXrDK
	RhPcmIUrKrzB/ZYPm2D0bECVhGMk8DpciQDJQdM1+nggE8iauuO2Fu8b+RauAg4eBcltnOnbeqpnM
	H/p+eQf6Sdpc4ucJjMSCvQjtyNzF/0WOFL/JSCPQoIjaFBxZ6uu4PvGyXs1YBXUCPuXA35xrQmyFp
	WQIuZzf8mle/MvX+OzApY9YuYSE3hgLGGSkFtBHMnZIItewSr9WI8nR6x3zWWBcYR0vMxrJgoVVUd
	pQeEYHsEu+9/f/cMEzNeeL832ffH9aSkfRmeXx423zW7RwqaFErx5V61q8uFLc2bBlsuF7zas22oJ
	HUvlJu5rmI8hqcdm8mjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLDCT-0000000HMDq-3YyQ;
	Tue, 18 Nov 2025 04:20:17 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLDCR-0000000HMDG-1lgb
	for opensbi@lists.infradead.org;
	Tue, 18 Nov 2025 04:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8h
	CS/+GhGpO73zqq6PwMlINU05GFiOcwdBvPTjxMC1c=; b=I0v+hzRm6igJTEVK9g
	bFkCqwWhcbmLPbJesGWAkKkWkIT7vg8E2TKt0r+BfUhYODKprtz0Gzf175ooQJfk
	+swOfI+zIXELAMX/YZf/xxDPkkDC5Q7E7MW3YuYdePqQxF9mmIgbmm3xhLix2lap
	J8aVbmcdW/6dDU9Zuuuj2fVdg=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD316z08xtp0yMrAA--.47997S2;
	Tue, 18 Nov 2025 12:20:04 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [PATCH] lib: sbi: Add runtime stack overrun detection
Date: Tue, 18 Nov 2025 12:19:46 +0800
Message-ID: <20251118041948.1331562-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD316z08xtp0yMrAA--.47997S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxArWUuw1UZr1fJF47tw1rtFb_yoWrAF48pF
	98GF93Gr4vy3yxtry3C3WFg3WrJa1kur47Ca47J34Fv3y8Ar93XrZrt3WqqFnrXrsrA3y3
	ua4IyFySkFs8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE-eOgUUUUU=
X-Originating-IP: [2408:823c:b211:2d25:600c:cd2e:5300:e58c]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiIR0KOmkb5xWqFgAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_202015_887902_32815441 
X-CRM114-Status: GOOD (  12.12  )
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

Implement lightweight stack overrun detection using toolchain's
-finstrument-functions instrumentation

Reviewed-by: Xiang W <wangxiang@iscas.ac.cn>
---
 Makefile                      |  4 +++
 firmware/fw_base.S            |  3 +++
 firmware/payloads/test_head.S | 16 ++++++++++++
 lib/sbi/Kconfig               |  4 +++
 lib/sbi/objects.mk            |  2 ++
 lib/sbi/sbi_sochk.c           | 47 +++++++++++++++++++++++++++++++++++
 6 files changed, 76 insertions(+)
 create mode 100644 lib/sbi/sbi_sochk.c

diff --git a/Makefile b/Makefile
index 398eabe8..cd7d1ad5 100644
--- a/Makefile
+++ b/Makefile
@@ -449,6 +449,10 @@ else
 CFLAGS		+=	-O2
 endif
 
+ifneq ($(CONFIG_SBI_SOCHK),)
+CFLAGS		+=	-finstrument-functions
+endif
+
 # Setup functions for compilation
 define dynamic_flags
 -I$(shell dirname $(2)) -D__OBJNAME__=$(subst -,_,$(shell basename $(1) .o))
diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 5300ecf2..6cd5725f 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -366,6 +366,9 @@ _start_warm:
 	/* Setup stack */
 	add	sp, tp, zero
 
+#ifdef CONFIG_SBI_SOCHK
+	call	sbi_sochk_init
+#endif
 	/* Setup trap handler */
 	lla	a4, _trap_handler
 	csrr	a5, CSR_MISA
diff --git a/firmware/payloads/test_head.S b/firmware/payloads/test_head.S
index 070ce8aa..de4e334f 100644
--- a/firmware/payloads/test_head.S
+++ b/firmware/payloads/test_head.S
@@ -112,3 +112,19 @@ _boot_a1:
 	.type __stack_chk_guard, %object
 __stack_chk_guard:
 	RISCV_PTR	0x95B5FF5A
+
+#ifdef CONFIG_SBI_SOCHK
+	.section .text
+	.align 3
+	.weak __cyg_profile_func_enter
+	.type __cyg_profile_func_enter, %function
+__cyg_profile_func_enter:
+	ret
+
+.section .text
+	.align 3
+	.weak __cyg_profile_func_exit
+	.type __cyg_profile_func_exit, %function
+__cyg_profile_func_exit:
+	ret
+#endif
diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
index c6cc04bc..77077991 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -6,6 +6,10 @@ config CONSOLE_EARLY_BUFFER_SIZE
 	int "Early console buffer size (bytes)"
 	default 256
 
+config SBI_SOCHK
+	bool "Enable Stack Overflow runtime checking"
+	default n
+
 config SBI_ECALL_TIME
 	bool "Timer extension"
 	default y
diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
index 8abe1e8e..ed6107ad 100644
--- a/lib/sbi/objects.mk
+++ b/lib/sbi/objects.mk
@@ -64,6 +64,8 @@ libsbi-objs-$(CONFIG_SBI_ECALL_SSE) += sbi_ecall_sse.o
 carray-sbi_ecall_exts-$(CONFIG_SBI_ECALL_MPXY) += ecall_mpxy
 libsbi-objs-$(CONFIG_SBI_ECALL_MPXY) += sbi_ecall_mpxy.o
 
+libsbi-objs-$(CONFIG_SBI_SOCHK) += sbi_sochk.o
+
 libsbi-objs-y += sbi_bitmap.o
 libsbi-objs-y += sbi_bitops.o
 libsbi-objs-y += sbi_console.o
diff --git a/lib/sbi/sbi_sochk.c b/lib/sbi/sbi_sochk.c
new file mode 100644
index 00000000..950275d1
--- /dev/null
+++ b/lib/sbi/sbi_sochk.c
@@ -0,0 +1,47 @@
+
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_hart.h>
+
+extern struct sbi_platform platform;
+
+static bool __scratch_init_done = false;
+
+__attribute__((no_instrument_function, weak))
+void sbi_sochk_init(void)
+{
+	__scratch_init_done = true;
+}
+
+
+__attribute__((no_instrument_function, weak))
+void __cyg_profile_func_enter(void *this_func, void *call_site)
+{
+	struct sbi_scratch * scratch;
+	unsigned long sp, stack_start, stack_end;
+
+	if (!__scratch_init_done)
+		return;
+
+	scratch = sbi_scratch_thishart_ptr();
+
+	asm volatile("mv %0, sp" : "=r"(sp));
+	stack_start = (unsigned long)scratch + SBI_SCRATCH_SIZE - platform.hart_stack_size;
+	stack_end = (unsigned long)scratch;
+
+	if (sp < stack_start || sp > stack_end) {
+		/* Reset SP to output error messages */
+		asm volatile("mv sp, %0"::"r"(stack_end));
+		sbi_printf("Stack overflow detected in function %p (caller %p), "
+			   "sp=%p (%p - %p)\n",
+			   this_func, call_site, (void*)sp,
+			   (void*)stack_start, (void*)stack_end);
+		sbi_hart_hang();
+	}
+}
+
+__attribute__((no_instrument_function, weak))
+void __cyg_profile_func_exit(void *this_func, void *call_site)
+{
+}
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
