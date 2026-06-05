Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE36CD6E7E
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEW1wXsJQuKX4UyLJgg37JbIn5KsMTAyT+ZTFIoj4/o=; b=TsVslflN43IssS
	9lulR/wlSZhhJcNDUlzIBYgMFlxS/b09UvTkRO4aLLVnj4u/p27rH5xQmKEYC85m1gLi+q/Cd73p/
	VKIpaHG+dZVKIZk9+80rPJDKG29A7BFF53xUlVsSk9nMQpwKx0XtQ+nmt7uNx0T+7gYNy/iZ+Us46
	mvnmcMD9f4rKDVAJKUV65Ut0NNPrI3BKmab8YRZJpgM96h02ZO7p1Op8KbVr4h8mzEa29+55MTrGX
	uY4snMi3J4kME/D/1A4k3hK6HoIdc97DbQ1+WqoYxsX0EGIdL2porbP6Ci6oPEnM+C6fYwYW0HDJk
	Q9GbZ8tg8efLJywmxvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSou-00000000Xsx-3YK8;
	Fri, 05 Jun 2026 11:34:36 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSop-00000000Xo3-16Cw
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8422524cb38so590246b3a.0
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659271; x=1781264071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe0AH6ICsihCfssC3unzvZJu8+fiKYK5mJIRBuB6FQ4=;
        b=ocCoPlmJVyhVBsoDFIgmDU4/xgNMQyT6IULtYO2j+3ABXnvDkxniL4WfUJPqzwSa6V
         +dqA9knl2hi/fwMY43/wzIWe1mUczhEMq8I3Cn0HANeG/hRH8B/XhE4BjDtYo+DrddpM
         UOUnzOImeLrKA13YFfuTbbW3IN1CGOIbPe81Q3US68GcNbdHfLc7RLQDV1MPBXyMQVrX
         eMFdpStd+AQuvDXucBAFWC+ieS5snR2zKgD3iNML5PcKLSxEkXWS+kCkkYJtixWldP4h
         ptVQ1kkkfJpTHlqc6qdU17+LeNgvYxI+68S2Y7wNPWRLWQDtD1m1BRXS6Y+3fv3/ixQr
         GPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659271; x=1781264071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xe0AH6ICsihCfssC3unzvZJu8+fiKYK5mJIRBuB6FQ4=;
        b=bXswQ8CwYYEIOAmH6ik2dXySgYXjM39k/b/VRi0mbCmIEDWwA+Yuv6jvNi+y5ovAkA
         IYLILz8U6d6WiAoUa/QOLveTcZlmSUVqdsqpfx8cvbl01AWQYBvbKMywOB69Fu3xa0cJ
         tDRK4eCoRAiTd2NZzroNkf5imXKyWCDK0sTC7teHBUjGyiTefxLBHlJI0ScoXdM8rBTU
         mKSwX8fwvCZJ99uYaGS1SG8kNVLGPseairB+d9KmXL1ImNxVqPgMvN61VtWHZujKiKIi
         aelpqbdKH09CbXr0lWbHkxIc8BtarWio4G5aJQAq8doqalqbe/AiE8aR9YbVM1eFuCBN
         ++JA==
X-Gm-Message-State: AOJu0Yzke1tMkgB3QuZ6WjnPjNGGP6ZSkL5tyYrQKvZYQhTxgGqEp7rN
	bhlUORSmU13wb/cSHJAmS4q+8T7JACb6c04NDEBt+Qrpi8uAHI35KzzTfwR8qw==
X-Gm-Gg: Acq92OGXHRMM6D7Alp09hnlLbKSpmfx8OHUNGpYjNHg9aAm3CWclRbzeeKw8OpGTQsk
	E1bjtBZkcyL7zcfzNPm7ImoFGXCutBxaihSjqZZSazRgtMhHFHnQ3WhtMot5BIX2Iz2WCQcbC71
	WXfE9xEOQbPIqq2OOky/VejiHiFjrZAdeEEGm7RI1yUwkNvK/Ok/89EAk7l7eGajX3KWEOUxc3t
	xY+fHz1xcLBQ9MTqE6leJtGBZN95wMFXjYBMgukAm8Ha0mtBvNanoyxbOXvHAQPwZCGccK5V3pr
	Re9/dfAOy8KXWz8Bzvf5cnAlw0nrNzB2JyVs4LqwYGYHFY19C+fhs1gdqtaizES0Jxb8jb9fo/A
	eHfV7qWC2G7NJ2KPHM4Oy0a6EcuKB7TklzB7vgCwUMQCCJTuAsxTppSUlrc6WNMcoopJw48XS86
	TwSwslX62T1Mst7oIbJfsF4ILXnKYWa1duwcrpg3kw0KhkIg==
X-Received: by 2002:a05:6a00:4fcc:b0:842:5a18:9af8 with SMTP id d2e1a72fcca58-842b0e627e6mr3143650b3a.12.1780659270562;
        Fri, 05 Jun 2026 04:34:30 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:30 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 8/8] [NOT-FOR-UPSTREAM] Test program for misaligned load/store
Date: Fri,  5 Jun 2026 04:32:14 -0700
Message-Id: <20260605113214.242-9-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043431_400617_12CB9D32 
X-CRM114-Status: GOOD (  15.17  )
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
