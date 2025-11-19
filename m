Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A1CF34D9
	for <opensbi@archiver.kernel.org>; Wed, 19 Nov 2025 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KM+OVVGjUIomJb4iIYrGY5TG/cJzPpxS39MdwlGcKYs=; b=s83Z+SCXtIyj20
	BQK/6BKTkTnWjEiXPvFw8VC1aJjM1RdBjepZDyHiJGMru0f68E9GbiqY4BbxJcyk+O9JM2vu3bquj
	ZvhTvulpyoi8KI2gFnrw/ky09vWMRORHZj7cWAvK+joPu8C6o6slJqZJfiO0vDPrxSfjWxwGDDNIM
	GYlsVtCbkZXCE/q+XEFdUB1w5kKugLQCieDOvby9/MV1aMzDFJm81/lTQ4zb5fC/O+4wSCLPthi5y
	08RGCN/7ytLr3tTfiIJUvWYIc2SM9u7BgGYj4jfEoHiSpJsY2utLxWk+T8AEwCx9MiVd+2LXCg8Cd
	cf+bvgJ5pjCgcX5FwQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkXS-00000003brv-2nE1;
	Wed, 19 Nov 2025 15:56:10 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkXN-00000003bq1-3NRb
	for opensbi@lists.infradead.org;
	Wed, 19 Nov 2025 15:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=H2
	GM2/zkVQOsveW5fYXLGxp9Ei0byQaVzQxm4UF4iMg=; b=Vx8WTHgOp8Ii7JMTv+
	v8douYBxwU+SfWQ8uANBpPB5cqKOFJnyqcovMuZN8h2RZH3iYFee8n8zEY+Cs9Dj
	bUXYZZOhGc9HERLVddrQAvUhj9yArpGdDI11VjxXoAFSgYbrK0VuMBCENBVEkTJA
	MPuBLX/OOvRCasO0Qi+52BZtA=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3tyuP6B1pg1eRAA--.48721S2;
	Wed, 19 Nov 2025 23:56:00 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	Bo Gan <ganboing@gmail.com>,
	Andreas Schwab <schwab@suse.de>,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [PATCH v3] lib: sbi: Add runtime stack overrun detection
Date: Wed, 19 Nov 2025 23:55:54 +0800
Message-ID: <20251119155556.408753-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyuP6B1pg1eRAA--.48721S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw4DWrWfXFW5Zr1UZr1kXwb_yoWrCFWxpF
	9xCF93Gr4kA3yrtFW3C3WFg3WfJan5ur47CFy7J34Fv3yxA3s3JrZrJ3WqvFnrJrsFy3y3
	GasFyFySkFs8Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi0Jm8UUUUU=
X-Originating-IP: [2408:823c:b211:2d25:600c:cd2e:5300:e58c]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbiFwsLOmkd4dJB7gAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_075606_208451_98BAAFF8 
X-CRM114-Status: GOOD (  12.21  )
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

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
v3 changes:
- s/Reviewed-by/Signed-off-by/

 Makefile                      |  4 +++
 firmware/fw_base.S            |  3 ++
 firmware/payloads/test_head.S | 16 +++++++++++
 lib/sbi/Kconfig               |  4 +++
 lib/sbi/objects.mk            |  2 ++
 lib/sbi/sbi_sochk.c           | 52 +++++++++++++++++++++++++++++++++++
 6 files changed, 81 insertions(+)
 create mode 100644 lib/sbi/sbi_sochk.c

diff --git a/Makefile b/Makefile
index 398eabe8..a52f940b 100644
--- a/Makefile
+++ b/Makefile
@@ -449,6 +449,10 @@ else
 CFLAGS		+=	-O2
 endif
 
+ifeq ($(CONFIG_SBI_SOCHK),y)
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
index c6cc04bc..6c4d660b 100644
--- a/lib/sbi/Kconfig
+++ b/lib/sbi/Kconfig
@@ -6,6 +6,10 @@ config CONSOLE_EARLY_BUFFER_SIZE
 	int "Early console buffer size (bytes)"
 	default 256
 
+config SBI_SOCHK
+	bool "Enable stack overrun runtime checking"
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
index 00000000..8e441ff6
--- /dev/null
+++ b/lib/sbi/sbi_sochk.c
@@ -0,0 +1,52 @@
+ /*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Authors:
+ *   Xiang W <wangxiang@iscas.ac.cn>
+ */
+#include <sbi/sbi_console.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_platform.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_types.h>
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
+__attribute__((no_instrument_function, weak))
+void __cyg_profile_func_enter(void *this_func, void *call_site)
+{
+	struct sbi_scratch * scratch;
+	void *sp, *stack_start, *stack_end;
+
+	if (!__scratch_init_done)
+		return;
+
+	scratch = sbi_scratch_thishart_ptr();
+
+	asm volatile("mv %0, sp" : "=r"(sp));
+	stack_start = (void *)((uintptr_t)scratch
+			   + SBI_SCRATCH_SIZE - platform.hart_stack_size);
+	stack_end   = scratch;
+
+	if (sp < stack_start || sp > stack_end) {
+		/* Reset SP to output error messages */
+		asm volatile("mv sp, %0"::"r"(stack_end));
+		sbi_printf("Stack overrun detected in function 0x%p "
+			   "(caller 0x%p), sp = 0x%p (0x%p - 0x%p)\n",
+			   this_func, call_site, sp, stack_start, stack_end);
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
