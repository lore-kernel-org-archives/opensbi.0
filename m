Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095BEEA3F31
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEW1wXsJQuKX4UyLJgg37JbIn5KsMTAyT+ZTFIoj4/o=; b=h6xdyOyVVy9qEh
	wK7U/wpS0R4wXJ4UhLCFU92d3jSGC1YRgnudK9+SkHxPbs+Q67ONMdJp3EaHVF8Y7cpf++bq46RZv
	xvRP5BVF/k092UvxMgLePmbh09H5O5ewRWhd03LEx9zLYA7ss0Tu2nBVsJX0pD11a4gp++RddRNkM
	g18ZMux8oQ4KQ95WjX3QscG1JRTsv0/e0kJ9aoivw3YxX/X5CNr4pzAkYEq1yPz9wzjLG7qBoUjJR
	x8U1dxdc33RHPJZTULixdnNNwFyPStwdqPnmfIVQS4YxaLf9+PzxwLMwafqPlKXbjXTlObmiJwlGY
	PKOVsxORX5OSCasz1l5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGp-0000000Gle0-1Eo3;
	Tue, 10 Feb 2026 09:42:59 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGm-0000000GlaF-1DA1
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 09:42:57 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c65822dead7so1595257a12.3
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 01:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716575; x=1771321375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe0AH6ICsihCfssC3unzvZJu8+fiKYK5mJIRBuB6FQ4=;
        b=UxkQDyVt3H3BP11SiauP9UnEHh3kU/AFfujXcWAZKKvYWFCJ9dp2CEFkWc8mOyq47U
         xK6FCQOoNjEryfQYzdxHPBSpRWl2pZ2ecRmeHrLzyweWLfwqSj0WjKiEGSsYWNmeS+Qy
         GF9dfYpJtLg9vMGWu7SE4gZHqpyM6QxJB6PyqB7Ct46x+rxOXL52ssR+ayeueBlSsitZ
         hmsrKtjzZ2Z/YpMOK+vslS09zViRcD4sqVRb2HUL46bhWOEPLGyFMyia7KlrSN4wllyN
         55dGGlE574EDpH3VwLuyAKmEwPFB6SOpDQ92/qjmzokDmox8NenRr6iCeAfpBze4hi63
         7XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716575; x=1771321375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xe0AH6ICsihCfssC3unzvZJu8+fiKYK5mJIRBuB6FQ4=;
        b=YmJPEJFdYiT4BLC2Zn49WiRSzuQY7FEqUNYbIJ10FQ6rU61FRlWmK26OgqktJZl0Zz
         KM5WgcOkkn+2R3xEQ6kbF/JMz+zUmaqJ+okGsxaxNg7+3yBYklgLmsyUwmzAUrr21nVL
         /Zw/PHtjAqQMzvI8l4bcq+d326VJnmMG7es8P7sMNOTG4/e8p9ZaYe94MtDIJOvEdqYF
         e12Wy9XaLBZ524/xhZ0ToaempHFccpISoOcOm7SZ+RMI0I9pbXaitLLktd5gzZEsLjzR
         Plt8C/WDmyPf1GfwO3NC0b0VdRTQw3GP/KyDdfqxuSQ/jRuvtjKkF0z9H/tsG6nAYBRq
         tFIA==
X-Gm-Message-State: AOJu0YzkyAISEnL4FxQffCpu5DKhzuw27vgnoDBQVUQ5BwnFEomwrGhH
	J228XNBnEv7zIrJ1UcZa9r3Hf7ioLcGrxDxNg/aWr3n6MPqmoH5wj4p6Rx0TZQ==
X-Gm-Gg: AZuq6aKAPKLFSP9BZWhJdUB6FofT+g5fLCctDxPqw+2e93RiYuvqhgjpZ20LA/dqySj
	4v8jRIMd61UIwuT3BrAWn31mfQkixS0nXVDsvBYYNT/Ox6ugwr/nINQLaGEHfZwg5VOkhRGxyMB
	UeD2QOqajum6sNwQxzwDeoY+GzIGm0yetS9yGMHq4vTPCD/59CrZgJ3HhYVZbdLrTvOJS/EEaDG
	PubwKemheqn6N/5z4LHqmQL7Of6cUfkKrWcYlvyvzkClZt4AYIQoi7/vWDtZzWVObOXDZZADRa9
	CA22Zu9MNjR6UWkgfqtsjKHgQxTYNM+xOefY1OOJBuV7MGXQoBSYkXcOOz6RwpGrA5yN6Kv+EbJ
	MVqpu1aAU4L1rVlDNiC9PNdz5L1QftzX8IgaAmapCMkYENKjQ9fnYmUAzx3iiKCA3oyq1hxs6gV
	Q7n3TC0kVgf3JlJdOumMJwJcehaNsAHN7aBBM=
X-Received: by 2002:a17:903:f8d:b0:2aa:d7fe:8603 with SMTP id d9443c01a7336-2aad7fe933bmr66638565ad.8.1770716574856;
        Tue, 10 Feb 2026 01:42:54 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm133219215ad.61.2026.02.10.01.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:42:54 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	dramforever@live.com,
	anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org,
	cleger@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH 7/7] [NOT-FOR-UPSTREAM] Test program for misaligned load/store
Date: Tue, 10 Feb 2026 01:40:44 -0800
Message-Id: <20260210094044.72591-8-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210094044.72591-1-ganboing@gmail.com>
References: <20260210094044.72591-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014256_349345_A789029A 
X-CRM114-Status: GOOD (  15.18  )
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

Build: gcc -o test-misaligned-ldst test-misaligned-ldst.c ldst.S

Failure observed before the fix on QEMU with 64-bit Linux and 32-bit test

...
loadfp 64, insn cfldsp, n=64, off=1, cmp=788796a5b4c3d2e1
loadfp 64, insn cfldsp, n=64, off=2, cmp=69788796a5b4c3d2
loadfp 64, insn cfldsp, n=64, off=3, cmp=5a69788796a5b4c3
loadfp 64, insn cfldsp, n=64, off=4, cmp=4b5a69788796a5b4
loadfp 64, insn cfldsp, n=64, off=5, cmp=3c4b5a69788796a5
loadfp 64, insn cfldsp, n=64, off=6, cmp=2d3c4b5a69788796
loadfp 64, insn cfldsp, n=64, off=7, cmp=1e2d3c4b5a697887
loadfp 32, insn cflw, n=32, off=1, cmp=ffffffffb4c3d2e1
./test32: failed at load_f 1 4 0: 0

With the patch series:

...
loadfp 64, insn cfldsp, n=64, off=1, cmp=788796a5b4c3d2e1
loadfp 64, insn cfldsp, n=64, off=2, cmp=69788796a5b4c3d2
loadfp 64, insn cfldsp, n=64, off=3, cmp=5a69788796a5b4c3
loadfp 64, insn cfldsp, n=64, off=4, cmp=4b5a69788796a5b4
loadfp 64, insn cfldsp, n=64, off=5, cmp=3c4b5a69788796a5
loadfp 64, insn cfldsp, n=64, off=6, cmp=2d3c4b5a69788796
loadfp 64, insn cfldsp, n=64, off=7, cmp=1e2d3c4b5a697887
loadfp 32, insn cflw, n=32, off=1, cmp=ffffffffb4c3d2e1
loadfp 32, insn cflw, n=32, off=2, cmp=ffffffffa5b4c3d2
loadfp 32, insn cflw, n=32, off=3, cmp=ffffffff96a5b4c3
loadfp 32, insn cflw, n=32, off=5, cmp=ffffffff788796a5
loadfp 32, insn cflw, n=32, off=6, cmp=ffffffff69788796
loadfp 32, insn cflw, n=32, off=7, cmp=ffffffff5a697887
loadfp 32, insn cflw, n=32, off=9, cmp=ffffffff3c4b5a69
loadfp 32, insn cflw, n=32, off=10, cmp=ffffffff2d3c4b5a
loadfp 32, insn cflw, n=32, off=11, cmp=ffffffff1e2d3c4b
loadfp 32, insn cflwsp, n=64, off=1, cmp=ffffffffb4c3d2e1
loadfp 32, insn cflwsp, n=64, off=2, cmp=ffffffffa5b4c3d2
loadfp 32, insn cflwsp, n=64, off=3, cmp=ffffffff96a5b4c3
loadfp 32, insn cflwsp, n=64, off=5, cmp=ffffffff788796a5
loadfp 32, insn cflwsp, n=64, off=6, cmp=ffffffff69788796
loadfp 32, insn cflwsp, n=64, off=7, cmp=ffffffff5a697887
loadfp 32, insn cflwsp, n=64, off=9, cmp=ffffffff3c4b5a69
loadfp 32, insn cflwsp, n=64, off=10, cmp=ffffffff2d3c4b5a
loadfp 32, insn cflwsp, n=64, off=11, cmp=ffffffff1e2d3c4b

<no failure>
---
 tests/ldst.S                 | 134 +++++++++++++++++++++++++++
 tests/ldst.h                 | 170 +++++++++++++++++++++++++++++++++++
 tests/test-misaligned-ldst.c | 154 +++++++++++++++++++++++++++++++
 3 files changed, 458 insertions(+)
 create mode 100644 tests/ldst.S
 create mode 100644 tests/ldst.h
 create mode 100644 tests/test-misaligned-ldst.c

diff --git a/tests/ldst.S b/tests/ldst.S
new file mode 100644
index 00000000..66f88e42
--- /dev/null
+++ b/tests/ldst.S
@@ -0,0 +1,134 @@
+.altmacro
+
+.macro mem_repeat name:req, ldst:req, op:req, rx:req, ry:req, len:req, signext=0, step=1, n=4096, max=2048
+.globl mem_\name
+.type mem_\name, @function
+mem_\name\():
+.set i, 0
+.rept \n
+.set j, \max - \n * \step + i * \step
+1:
+	mem_\ldst \op \rx \ry j
+	ret
+.ifne . - mem_\name - (. - 1b) * (i + 1)
+.error "mem_\name is not aligned"
+.endif
+.set i, i + 1
+.endr
+.size mem_\name, . - mem_\name
+
+.align 3
+.globl mem_\name\()_desc
+.type mem_\name\()_desc @object
+mem_\name\()_desc:
+	.byte \len, \signext, \step, (. - mem_\name) / \n
+	.half \max - \n * \step, \n
+#if __riscv_xlen == 32
+	.word mem_\name
+#elif __riscv_xlen == 64
+	.dword mem_\name
+#endif
+.size mem_\name\()_desc, . - mem_\name\()_desc
+.endm
+
+.macro mem_load op rs rd imm
+	mv \rs, a0
+	\op \rd, \imm(\rs)
+	mv a0, \rd
+.endm
+
+.macro mem_fpld op rs rd imm
+	mv \rs, a0
+	\op \rd, \imm(\rs)
+	fmv.d fa0, \rd
+.endm
+
+.macro mem_store op rs1 rs2 imm
+	mv \rs2, a1
+	mv \rs1, a0
+	\op \rs2, \imm(\rs1)
+.endm
+
+.macro mem_fpst op rs1 rs2 imm
+	fmv.d \rs2, fa0
+	mv \rs1, a0
+	\op \rs2, \imm(\rs1)
+.endm
+
+.macro mem_ldsp op tmp rd imm
+	mv \tmp, sp
+	mv sp, a0
+	\op \rd, \imm(sp)
+	mv sp, \tmp
+	mv a0, \rd
+.endm
+
+.macro mem_fpldsp op tmp rd imm
+	mv \tmp, sp
+	mv sp, a0
+	\op \rd, \imm(sp)
+	mv sp, \tmp
+	fmv.d fa0, \rd
+.endm
+
+.macro mem_stsp op tmp rs2 imm
+	mv \tmp, sp
+	mv sp, a0
+	mv \rs2, a1
+	\op \rs2, \imm(sp)
+	mv sp, \tmp
+.endm
+
+.macro mem_fpstsp op tmp rs2 imm
+	mv \tmp, sp
+	mv sp, a0
+	fmv.d \rs2, fa0
+	\op \rs2, \imm(sp)
+	mv sp, \tmp
+.endm
+
+mem_repeat lb     load   lb    t0 a1   1 1
+mem_repeat lbu    load   lbu   t1 a2   1
+mem_repeat sb     store  sb    t2 a3   1
+mem_repeat lh     load   lh    t4 a5   2 1
+mem_repeat lhu    load   lhu   t5 a6   2
+mem_repeat sh     store  sh    t6 a7   2
+mem_repeat lw     load   lw    a7 t6   4 1
+#if __riscv_xlen == 64
+mem_repeat lwu    load   lwu   a6 t5   4
+#endif
+mem_repeat sw     store  sw    a5 t4   4
+#if __riscv_xlen == 64
+mem_repeat ld     load   ld    a4 t3   8 1
+mem_repeat sd     store  sd    a3 t2   8
+#endif
+mem_repeat flw    fpld   flw   t3 ft8  4
+mem_repeat fsw    fpst   fsw   t4 ft9  4
+mem_repeat fld    fpld   fld   t5 ft10 8
+mem_repeat fsd    fpst   fsd   t6 ft11 8
+#ifdef __riscv_zcb
+mem_repeat clbu   load   c.lbu a5 a1   1 0 1 4  4
+mem_repeat csb    store  c.sb  a4 a2   1 0 1 4  4
+mem_repeat clh    load   c.lh  a3 a3   2 1 2 2  4
+mem_repeat clhu   load   c.lhu a2 a4   2 0 2 2  4
+mem_repeat csh    store  c.sh  a1 a5   2 0 2 2  4
+#endif
+mem_repeat clw    load   c.lw  a5 a1   4 1 4 32 128
+mem_repeat csw    store  c.sw  a4 a2   4 0 4 32 128
+mem_repeat clwsp  ldsp   lw    t0 t6   4 1 4 64 256
+mem_repeat cswsp  stsp   sw    t1 t5   4 0 4 64 256
+mem_repeat cfld   fpld   c.fld a3 fa2  8 0 8 32 256
+mem_repeat cfsd   fpst   c.fsd a2 fa3  8 0 8 32 256
+mem_repeat cfldsp fpldsp fld   t2 ft10 8 0 8 64 512
+mem_repeat cfsdsp fpstsp fsd   t3 ft11 8 0 8 64 512
+#if __riscv_xlen == 32
+mem_repeat cflw   fpld   c.flw a5 fa4  4 0 4 32 128
+mem_repeat cfsw   fpst   c.fsw a4 fa5  4 0 4 32 128
+mem_repeat cflwsp fpldsp flw   t3 ft11 4 0 4 64 256
+mem_repeat cfswsp fpstsp fsw   t4 ft10 4 0 4 64 256
+#elif __riscv_xlen == 64
+mem_repeat cld    load   c.ld  a5 a4   8 1 8 32 256
+mem_repeat csd    store  c.sd  a4 a5   8 0 8 32 256
+mem_repeat cldsp  ldsp   ld    t3 t6   8 1 8 64 512
+mem_repeat csdsp  stsp   sd    t4 t5   8 0 8 64 512
+#endif
diff --git a/tests/ldst.h b/tests/ldst.h
new file mode 100644
index 00000000..3d4b6062
--- /dev/null
+++ b/tests/ldst.h
@@ -0,0 +1,170 @@
+#include <inttypes.h>
+
+typedef struct {
+	uint8_t len;
+	uint8_t signext;
+	uint8_t imm_step;
+	uint8_t isize;
+	int16_t imm_base;
+	uint16_t n;
+	void *fp;
+} mem_op_desc;
+
+typedef union {
+	unsigned long u_long;
+	long i_long;
+	uint32_t u32[2];
+	int32_t i32[2];
+	uint64_t u64;
+	int64_t i64;
+	float f32[2];
+	double f64;
+	uint8_t bytes[8];
+} ldst_val;
+
+extern mem_op_desc mem_lb_desc;
+extern mem_op_desc mem_lbu_desc;
+extern mem_op_desc mem_sb_desc;
+extern mem_op_desc mem_lh_desc;
+extern mem_op_desc mem_lhu_desc;
+extern mem_op_desc mem_sh_desc;
+extern mem_op_desc mem_lw_desc;
+extern mem_op_desc mem_lwu_desc;
+extern mem_op_desc mem_sw_desc;
+extern mem_op_desc mem_ld_desc;
+extern mem_op_desc mem_sd_desc;
+extern mem_op_desc mem_flw_desc;
+extern mem_op_desc mem_fsw_desc;
+extern mem_op_desc mem_fld_desc;
+extern mem_op_desc mem_fsd_desc;
+extern mem_op_desc mem_clbu_desc;
+extern mem_op_desc mem_csb_desc;
+extern mem_op_desc mem_clh_desc;
+extern mem_op_desc mem_clhu_desc;
+extern mem_op_desc mem_csh_desc;
+extern mem_op_desc mem_clw_desc;
+extern mem_op_desc mem_csw_desc;
+extern mem_op_desc mem_clwsp_desc;
+extern mem_op_desc mem_cswsp_desc;
+extern mem_op_desc mem_cfld_desc;
+extern mem_op_desc mem_cfsd_desc;
+extern mem_op_desc mem_cfldsp_desc;
+extern mem_op_desc mem_cfsdsp_desc;
+extern mem_op_desc mem_cflw_desc;
+extern mem_op_desc mem_cfsw_desc;
+extern mem_op_desc mem_cflwsp_desc;
+extern mem_op_desc mem_cfswsp_desc;
+extern mem_op_desc mem_cld_desc;
+extern mem_op_desc mem_csd_desc;
+extern mem_op_desc mem_cldsp_desc;
+extern mem_op_desc mem_csdsp_desc;
+
+typedef struct ldst_func {
+	const char *name;
+	const mem_op_desc *desc;
+} ldst_func;
+
+#define DEF_LDST_FUNC(x) { #x, &mem_ ## x ## _desc }
+
+static const ldst_func load_funcs[] = {
+	DEF_LDST_FUNC(lb),
+	DEF_LDST_FUNC(lbu),
+	DEF_LDST_FUNC(lh),
+	DEF_LDST_FUNC(lhu),
+	DEF_LDST_FUNC(lw),
+#ifdef __riscv_zcb
+	DEF_LDST_FUNC(clbu),
+	DEF_LDST_FUNC(clh),
+	DEF_LDST_FUNC(clhu),
+#endif
+	DEF_LDST_FUNC(clw),
+	DEF_LDST_FUNC(clwsp),
+#if __riscv_xlen == 64
+	DEF_LDST_FUNC(lwu),
+	DEF_LDST_FUNC(ld),
+	DEF_LDST_FUNC(cld),
+	DEF_LDST_FUNC(cldsp),
+#endif
+};
+
+static const ldst_func store_funcs[] = {
+	DEF_LDST_FUNC(sb),
+	DEF_LDST_FUNC(sh),
+	DEF_LDST_FUNC(sw),
+#ifdef __riscv_zcb
+	DEF_LDST_FUNC(csb),
+	DEF_LDST_FUNC(csh),
+#endif
+	DEF_LDST_FUNC(csw),
+	DEF_LDST_FUNC(cswsp),
+#if __riscv_xlen == 64
+	DEF_LDST_FUNC(sd),
+	DEF_LDST_FUNC(csd),
+	DEF_LDST_FUNC(csdsp),
+#endif
+};
+
+static const ldst_func loadfp_funcs[] = {
+#if __riscv_xlen == 32
+	DEF_LDST_FUNC(cflw),
+	DEF_LDST_FUNC(cflwsp),
+#endif
+	DEF_LDST_FUNC(flw),
+	DEF_LDST_FUNC(fld),
+	DEF_LDST_FUNC(cfld),
+	DEF_LDST_FUNC(cfldsp),
+};
+
+static const ldst_func storefp_funcs[] = {
+#if __riscv_xlen == 32
+	DEF_LDST_FUNC(cfsw),
+	DEF_LDST_FUNC(cfswsp),
+#endif
+	DEF_LDST_FUNC(fsw),
+	DEF_LDST_FUNC(fsd),
+	DEF_LDST_FUNC(cfsd),
+	DEF_LDST_FUNC(cfsdsp),
+};
+
+static inline unsigned long load_i(const void *p, unsigned func, unsigned sel)
+{
+	typedef unsigned long (*func_i)(const void *p);
+	const mem_op_desc *desc = load_funcs[func].desc;
+
+	long imm = (long)desc->imm_base + desc->imm_step * sel;
+	func_i f = desc->fp + desc->isize * sel;
+
+	return f(p - imm);
+}
+
+static inline void store_i(void *p, unsigned long val, unsigned func, unsigned sel)
+{
+	typedef void (*func_i)(void *p, unsigned long val);
+	const mem_op_desc *desc = store_funcs[func].desc;
+
+	long imm = (long)desc->imm_base + desc->imm_step * sel;
+	func_i f = desc->fp + desc->isize * sel;
+	f(p - imm, val);
+}
+
+static inline double load_f(const void *p, unsigned func, unsigned sel)
+{
+	typedef double (*func_f)(const void *p);
+	const mem_op_desc *desc = loadfp_funcs[func].desc;
+
+	long imm = (long)desc->imm_base + desc->imm_step * sel;
+	func_f f = desc->fp + desc->isize * sel;
+
+	return f(p - imm);
+}
+
+static inline void store_f(void *p, double val, unsigned func, unsigned sel)
+{
+	typedef void (*func_f)(void *p, double val);
+	const mem_op_desc *desc = storefp_funcs[func].desc;
+
+	long imm = (long)desc->imm_base + desc->imm_step * sel;
+	func_f f = desc->fp + desc->isize * sel;
+
+	f(p - imm, val);
+}
diff --git a/tests/test-misaligned-ldst.c b/tests/test-misaligned-ldst.c
new file mode 100644
index 00000000..ccbd0d36
--- /dev/null
+++ b/tests/test-misaligned-ldst.c
@@ -0,0 +1,154 @@
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+#include <error.h>
+#include "ldst.h"
+
+#define ARR_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
+
+static const uint8_t patt[16] = {
+	0xf0, 0xe1, 0xd2, 0xc3, 0xb4, 0xa5, 0x96, 0x87,
+	0x78, 0x69, 0x5a, 0x4b, 0x3c, 0x2d, 0x1e, 0x0f,
+};
+
+static const uint64_t load_val[16] = {
+	0x8796a5b4c3d2e1f0ULL,
+	0x788796a5b4c3d2e1ULL,
+	0x69788796a5b4c3d2ULL,
+	0x5a69788796a5b4c3ULL,
+	0x4b5a69788796a5b4ULL,
+	0x3c4b5a69788796a5ULL,
+	0x2d3c4b5a69788796ULL,
+	0x1e2d3c4b5a697887ULL,
+	0x0f1e2d3c4b5a6978ULL,
+	  0x0f1e2d3c4b5a69ULL,
+	    0x0f1e2d3c4b5aULL,
+	      0x0f1e2d3c4bULL,
+	        0x0f1e2d3cULL,
+	          0x0f1e2dULL,
+	            0x0f1eULL,
+	              0x0fULL,
+};
+
+int main()
+{
+	unsigned i, j, k;
+	//ldst_val val;
+
+	// Test int read
+	for (j = 0; j < ARR_SIZE(load_funcs); ++j) {
+		const mem_op_desc *desc = load_funcs[j].desc;
+		unsigned shift = 8 * (sizeof(long) - desc->len);
+
+		for (i = 0; i < ARR_SIZE(patt) - desc->len; ++i) {
+			unsigned long expected;
+			if (desc->len != 1 && i % desc->len == 0)
+				continue;
+
+			expected = load_val[i];
+			if (desc->signext)
+				expected = (long)(expected << shift) >> shift;
+			else
+				expected = (expected << shift) >> shift;
+
+			printf("load %c%u, insn %s, n=%u, off=%u, cmp=%lx\n",
+				desc->signext ? 'i' : 'u',
+				desc->len * 8, load_funcs[j].name, desc->n, i, expected);
+			fflush(stdout);
+			for (k = 0; k < desc->n; ++k) {
+				unsigned long read = load_i(&patt[i], j, k);
+				if (read != expected)
+					error(1, 0, "failed at load_i %u %u %u: %lx",
+						i, j, k, read);
+			}
+		}
+	}
+	// Test fp load
+	for (j = 0; j < ARR_SIZE(loadfp_funcs); ++j) {
+		const mem_op_desc *desc = loadfp_funcs[j].desc;
+
+		for (i = 0; i < ARR_SIZE(patt) - desc->len; ++i) {
+			ldst_val expected, read;
+
+			expected.u64 = load_val[i];
+			if (desc->len == 4) // float
+				expected.i32[1] = -1;
+
+			if (i % desc->len == 0)
+				continue;
+
+			printf("loadfp %u, insn %s, n=%u, off=%u, cmp=%" PRIx64 "\n",
+				desc->len * 8, loadfp_funcs[j].name, desc->n, i, expected.u64);
+			fflush(stdout);
+			for (k = 0; k < desc->n; ++k) {
+				read.f64 = load_f(&patt[i], j, k);
+				if (read.u64 != expected.u64)
+					error(1, 0, "failed at load_f %u %u %u: %" PRIx64,
+						i, j, k, read.u64);
+			}
+		}
+	}
+	// Test int store
+	for (j = 0; j < ARR_SIZE(store_funcs); ++j) {
+		const mem_op_desc *desc = store_funcs[j].desc;
+
+		for (i = 0; i < ARR_SIZE(patt) - desc->len; ++i) {
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Woverflow"
+			ldst_val val = { 0x8899aabbccddeeffULL };
+#pragma GCC diagnostic pop
+			unsigned end = i + desc->len;
+
+			if (desc->len != 1 && i % desc->len == 0)
+				continue;
+
+			memcpy(val.bytes, &patt[i], desc->len);
+			printf("store %u, insn %s, n=%u, off=%u, src=%lx\n",
+				desc->len * 8, store_funcs[j].name, desc->n, i, val.u_long);
+			fflush(stdout);
+
+			for (k = 0; k < desc->n; ++k) {
+				uint8_t buff[ARR_SIZE(patt)] = {};
+
+				memcpy(buff, patt, i);
+				memcpy(&buff[end], &patt[end], ARR_SIZE(patt) - end);
+				store_i(&buff[i], val.u_long, j, k);
+				if (memcmp(buff, patt, sizeof(buff)))
+					error(1, 0, "faild at store_i %u %u %u", i, j, k);
+			}
+
+		}
+	}
+	// Test fp store
+	for (j = 0; j < ARR_SIZE(storefp_funcs); ++j) {
+		const mem_op_desc *desc = storefp_funcs[j].desc;
+
+		for (i = 0; i < ARR_SIZE(patt) - desc->len; ++i) {
+			ldst_val val;
+			unsigned end = i + desc->len;
+
+			val.u32[0] = 0xccddeeffUL;
+			val.u32[1] = 0x8899aabbUL;
+
+			if (i % desc->len == 0)
+				continue;
+
+			memcpy(val.bytes, &patt[i], desc->len);
+			printf("storefp %u, insn %s, n=%u, off=%u, src=%" PRIx64 "\n",
+				desc->len * 8, storefp_funcs[j].name, desc->n, i, val.u64);
+			fflush(stdout);
+
+			for (k = 0; k < desc->n; ++k) {
+				uint8_t buff[ARR_SIZE(patt)] = {};
+
+				memcpy(buff, patt, i);
+				memcpy(&buff[end], &patt[end], ARR_SIZE(patt) - end);
+				store_f(&buff[i], val.f64, j, k);
+				if (memcmp(buff, patt, sizeof(buff)))
+					error(1, 0, "faild at store_f %u %u %u", i, j, k);
+			}
+		}
+	}
+	return 0;
+}
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
