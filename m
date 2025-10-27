Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DD4CCF9E5
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 22:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mMuhXcKUsQN1wI2nyNUn9VJaZCiqPicUrBGWwVavDw=; b=vRzNSvsvtGWN+D
	bd19aYFCbmIUXyOxKMPpo1OgImhcLmX0HS/OGYVD9pe07+mEgAzc/gHqDRl4rEm85/RrstNwI8Q4q
	QLZP+2ULhMOXt/ES9t297SFeOROQwkHR6YRzT84joBRtF8DY1IfHlV7MqQWCIZ9UlXWNie2N6Hr5R
	W4K/QtQ82rwUWz+ZNBjoHvkXlRb0FUSDKqrWzuCf4rk7+9CD/7FuQzZpsZtOr19eMqKraTi6rfEwx
	YietLGlIGocszxDZUpK7mCDkDw4FZJnTvhicO2dmeiu5QCutVGRBtjfpAkmYngJO7AFnUifAJyKEc
	/ZKgj538F15aizVzPMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVub-0000000EtEx-3hlh;
	Mon, 27 Oct 2025 22:42:01 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVuY-0000000EtEA-3o8M
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 22:42:00 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-340299e56fbso198069a91.1
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761604918; x=1762209718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WM6F7burng+w9fXrJ46yWT/KjJ3OFAWXYLT585eMQjA=;
        b=dIKUiq4k9NQskzHqwUqml1U4WqHekXR4XM3SR/Ixj2qjHvtkDR2SQPKNLiO554V3FZ
         qASnKigZ0Ph28th3DPez/dQct+UA58c6pthhNSgVUKho9g6+k4LJeaI7GiyywME5qPYb
         IO/rJqz9EaXIpxpK2g5bZytipgOXT0OuVTBzU8xddFb7VVT1Ozjmg3KJspFpgZaAoV8P
         ZI3VjV2n+N40Um8qvwOcBCYfwiWVlWnFwMxhCLbx1vwtRcXxZ8eLjP1pN8Rbx6uLIbC/
         QOAGW0o/MpJLA+PDI7CSL7F9HSVV+JvzW9Buhk70u2ZHL+ZvzF6ICDElnbz0J8BQ1rAn
         CeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761604918; x=1762209718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM6F7burng+w9fXrJ46yWT/KjJ3OFAWXYLT585eMQjA=;
        b=ONpkFZY0IoWUYejso0T4bJ3QeYJYr440l33SQsmiGQ3Tz76QsKjNcFC03S4x8ZFM+C
         2rKNfnP4rIzn5841P958JQRR+QVSq6OOarKp1rUn2a7yjm0ZaJuNw8B6xFeV5hechZoF
         6lyXHYZ+Xo0gj1lz9BJWpjVEYbKsgR30ClGAramoAUGUCyGhGvwlegI+zE8VIZ9/U9ja
         dOQKJgeW8W8VPnrE8hE4Yf48ao5wC0444dIcTryKsFsR5YvypPR+5s63t5rLglLU91Lm
         GJbeCFBFzO2y4SMVa/Zu6r9m0htZkCRumB/Ue3EvQSNtX67v0rYvtFnXc+R6W5lVjr/9
         fnQg==
X-Forwarded-Encrypted: i=1; AJvYcCXARxVFzI+n/Xp0yVIldQ67w/6MGWXonnLAcQzbhmVB56HAgRIKKx/ouXCSUaoZ6IoReszbEMCR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+hBFIOuNPKOnKBaxheePOYur5FdRXgonf46QMwn8gRgT8o1NM
	FoFkJcmJdDebGjBY5kNhCCTII9ZN9RMhz4CiLsBnlO+otVEFGdu0UOqy4DKUCPJ0
X-Gm-Gg: ASbGnct9rN/SY8eoSaLnjQuhpO8hXZ8g7M7W2B2linGXk+OgaCWt9ejaqvBRtkv9NGL
	eTUlzWXRDNbwHEQlMCEJBu8j7Y0aolFndokhT862w2VmbeQ7U4F/quoo7/XqsDVnx2UqvIam1bg
	2P6NJ12wK3/rmu+BWAbUcCVoU7tytTP53bPWncRnnJHPDFyz4m55fnf+YlYH4tVJLXdvUeJNpiT
	Bj5w88Zw8j110a+qCWzcHQjddp/rRjYf8UdxRyTk/Yz9iHmAdl7+92QLdYjR6T97WSedyq4IYma
	W/Gyhm+N6+vkoM3GDDMoXzP3rOCLIMQ9apzz+ybrqN7FNtXiKdNNPUimL9gVzNk9GpULy8hlgSs
	j05WZxD9RPJejWwxHg0ct1b6Hl7WSTLU9+ACkJiLOVuUxlhOvu0dEd5vo9AHS8BiUCqlmHw6L9i
	/RaEu/ZiyC1A==
X-Google-Smtp-Source: AGHT+IGEPJMrvRjYuruxzoyIS7XDQZVRlEyxnXz9Kd992TseWbjxQDMyoq+c2RnNJAA0WAbCrI7dJw==
X-Received: by 2002:a17:90a:da86:b0:329:e703:d00b with SMTP id 98e67ed59e1d1-34027bd07d9mr1493416a91.19.1761604917614;
        Mon, 27 Oct 2025 15:41:57 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81ca93sm9743016a91.19.2025.10.27.15.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 15:41:57 -0700 (PDT)
Date: Tue, 28 Oct 2025 06:41:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Benedikt Freisen <b.freisen@gmx.net>, opensbi@lists.infradead.org
Subject: Re: [PATCH 4/5] lib: sbi: ISA extension emulation.
Message-ID: <565g67ze2cgzadeqrlkjs3mpuzlbiq4wnh26mrby7ogcni3oot@uh6trkf7ypgg>
References: <20251026202416.23550-1-b.freisen@gmx.net>
 <20251026202416.23550-5-b.freisen@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251026202416.23550-5-b.freisen@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_154159_016090_7CE83655 
X-CRM114-Status: GOOD (  33.78  )
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

On Sun, Oct 26, 2025 at 09:21:58PM +0100, Benedikt Freisen wrote:
> Add trap-based emulation code or compatibility stubs for the following ISA extensions:
> Zba, Zbb, Zbc, Zbs, Zicbom, Zicboz, Zfhmin, Zicond, Zimop, Zcmop, Zcb, Zfa, Zawrs, Zvbb, Supm
> 
> Zicbom uses SiFive and XuanTie vendor extensions to flush data caches.
> The Zvbb implementation relies on hardware support for Zbb and RVV 1.0.
> 
> Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
> ---
>  CONTRIBUTORS.md                        |    2 +
>  include/sbi/riscv_encoding.h           |  177 ++++
>  include/sbi/riscv_fp.h                 |   47 +
>  include/sbi/sbi_hart.h                 |    2 +
>  include/sbi/sbi_illegal_insn.h         |    1 +
>  include/sbi/sbi_insn_emu.h             |   24 +
>  include/sbi/sbi_insn_emu_fp.h          |   19 +
>  include/sbi/sbi_insn_emu_v.h           |   21 +
>  include/sbi/sbi_platform.h             |   14 +
>  include/sbi/sbi_scratch.h              |   12 +-
>  include/sbi/sbi_trap.h                 |    2 +
>  lib/sbi/objects.mk                     |    3 +
>  lib/sbi/sbi_emulate_csr.c              |   14 +
>  lib/sbi/sbi_fwft.c                     |   14 +-
>  lib/sbi/sbi_hart.c                     |    4 +
>  lib/sbi/sbi_illegal_insn.c             |  133 ++-
>  lib/sbi/sbi_insn_emu.c                 |  584 ++++++++++++
>  lib/sbi/sbi_insn_emu_fp.c              |  962 ++++++++++++++++++++
>  lib/sbi/sbi_insn_emu_v.c               | 1128 ++++++++++++++++++++++++
>  lib/sbi/sbi_trap.c                     |   52 ++
>  lib/sbi/sbi_trap_ldst.c                |   10 +-
>  platform/generic/starfive/jh7110.c     |    7 +
>  platform/generic/thead/thead-generic.c |    7 +
>  23 files changed, 3195 insertions(+), 44 deletions(-)
>  create mode 100644 include/sbi/sbi_insn_emu.h
>  create mode 100644 include/sbi/sbi_insn_emu_fp.h
>  create mode 100644 include/sbi/sbi_insn_emu_v.h
>  create mode 100644 lib/sbi/sbi_insn_emu.c
>  create mode 100644 lib/sbi/sbi_insn_emu_fp.c
>  create mode 100644 lib/sbi/sbi_insn_emu_v.c
> 
> [...]
>  
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 8abe1e8..0da775c 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -81,6 +81,9 @@ libsbi-objs-y += sbi_hfence.o
>  libsbi-objs-y += sbi_hsm.o
>  libsbi-objs-y += sbi_illegal_atomic.o
>  libsbi-objs-y += sbi_illegal_insn.o
> +libsbi-objs-y += sbi_insn_emu.o
> +libsbi-objs-y += sbi_insn_emu_fp.o
> +libsbi-objs-y += sbi_insn_emu_v.o
>  libsbi-objs-y += sbi_init.o
>  libsbi-objs-y += sbi_ipi.o
>  libsbi-objs-y += sbi_irqchip.o

I suggest adding detailed Kconfig entries for these new emulation.
This emulation is quiet heavy and I think it should be possible for
users to decide which extension is needed to be emulated.

> diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c
> index c2253c8..e0e2373 100644
> --- a/lib/sbi/sbi_emulate_csr.c
> +++ b/lib/sbi/sbi_emulate_csr.c
> @@ -76,6 +76,12 @@ int sbi_emulate_csr_read(int csr_num, struct sbi_trap_regs *regs,
>  			return SBI_ENOTSUPP;
>  		*csr_val = csr_read(CSR_MINSTRET);
>  		break;
> +	case CSR_SENVCFG:
> +		if (prev_mode == PRV_S && !virt)
> +			*csr_val = scratch->sw_senvcfg;
> +		else
> +			ret = SBI_ENOTSUPP;
> +		break;
>  
>  #if __riscv_xlen == 32
>  	case CSR_HTIMEDELTAH:
> @@ -162,6 +168,14 @@ int sbi_emulate_csr_write(int csr_num, struct sbi_trap_regs *regs,
>  		else
>  			ret = SBI_ENOTSUPP;
>  		break;
> +	case CSR_SENVCFG:
> +		if (prev_mode == PRV_S && !virt) {
> +			struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +			scratch->sw_senvcfg = csr_val;
> +		}
> +		else
> +			ret = SBI_ENOTSUPP;
> +		break;
>  #if __riscv_xlen == 32
>  	case CSR_HTIMEDELTAH:
>  		if (prev_mode == PRV_S && !virt)
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index a2aefb9..73a5d5b 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -241,11 +241,16 @@ static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
>  		return SBI_EINVAL;
>  	}
>  
> +	/* Reset emulated pointer masking */
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +	scratch->sw_pm = 0;
> +
>  	prev = csr_read_clear(CSR_MENVCFG, ENVCFG_PMM);
>  	csr_set(CSR_MENVCFG, pmm);
>  	if ((csr_read(CSR_MENVCFG) & ENVCFG_PMM) != pmm) {
>  		csr_write(CSR_MENVCFG, prev);
> -		return SBI_EINVAL;
> +		/* Instead of returning SBI_EINVAL, enable emulation */
> +		scratch->sw_pm = value;
>  	}
>  
>  	return SBI_OK;
> @@ -253,6 +258,13 @@ static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
>  
>  static int fwft_get_pmlen(struct fwft_config *conf, unsigned long *value)
>  {
> +	/* Check for emulated pointer masking */
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +	if (scratch->sw_pm) {
> +		*value = scratch->sw_pm;
> +		return SBI_OK;
> +	}
> +
>  	switch (csr_read(CSR_MENVCFG) & ENVCFG_PMM) {
>  	case ENVCFG_PMM_PMLEN_0:
>  		*value = 0;
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 1b50f67..a7cbf4a 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -991,6 +991,10 @@ __pmp_skip:
>  	__check_csr_existence(CSR_CYCLE, SBI_HART_CSR_CYCLE);
>  	__check_csr_existence(CSR_TIME, SBI_HART_CSR_TIME);
>  	__check_csr_existence(CSR_INSTRET, SBI_HART_CSR_INSTRET);
> +	__check_csr_existence(CSR_MENVCFG, SBI_HART_CSR_MENVCFG);
> +	__check_csr_existence(CSR_SENVCFG, SBI_HART_CSR_SENVCFG);
> +	/* Initialize value of emulated SENVCFG CSR */
> +	scratch->sw_senvcfg = ENVCFG_CBZE | ENVCFG_CBCFE | ENVCFG_CBIE;
>  
>  #undef __check_csr_existence
>  
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index 4b85450..47f050c 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -2,9 +2,13 @@
>   * SPDX-License-Identifier: BSD-2-Clause
>   *
>   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + * Copyright (c) 2025 Benedikt Freisen*.
>   *
>   * Authors:
>   *   Anup Patel <anup.patel@wdc.com>
> + *   Benedikt Freisen <b.freisen@gmx.net>
> + *
> + * *) ISA extension emulation
>   */
>  
>  #include <sbi/riscv_asm.h>
> @@ -15,6 +19,9 @@
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_illegal_atomic.h>
>  #include <sbi/sbi_illegal_insn.h>
> +#include <sbi/sbi_insn_emu.h>
> +#include <sbi/sbi_insn_emu_fp.h>
> +#include <sbi/sbi_insn_emu_v.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_trap.h>
>  #include <sbi/sbi_unpriv.h>
> @@ -25,7 +32,7 @@ int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
>  	struct sbi_trap_info trap;
>  
>  	trap.cause = CAUSE_ILLEGAL_INSTRUCTION;
> -	trap.tval = insn;
> +	trap.tval  = insn;
>  	trap.tval2 = 0;
>  	trap.tinst = 0;
>  	trap.gva   = 0;
> @@ -57,7 +64,8 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>  		return 0;
>  	}
>  
> -	return truly_illegal_insn(insn, regs);
> +	/* Delegate Zicbom and Zicboz emulation */
> +	return sbi_insn_emu_zicbom_zicboz(insn, regs);
>  }
>  
>  static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
> @@ -70,14 +78,29 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>  	ulong csr_val, new_csr_val;
>  
>  	if (prev_mode == PRV_M) {
> -		sbi_printf("%s: Failed to access CSR %#x from M-mode",
> -			__func__, csr_num);
> +		sbi_printf("%s: Failed to access CSR %#x from M-mode", __func__,
> +			   csr_num);
>  		return SBI_EFAIL;
>  	}
>  
>  	/* Ensure that we got CSR read/write instruction */
>  	int funct3 = GET_RM(insn);
>  	if (funct3 == 0 || funct3 == 4) {
> +		/* Handle "Zawrs" Wait-on-Reservation-Set */
> +		if (insn == INSN_MATCH_WRS_NTO || insn == INSN_MATCH_WRS_STO) {
> +			/* do nothing */
> +			regs->mepc += 4;
> +			return 0;
> +		}
> +		/* Handle "Zimop" May-Be-Operations */
> +		if ((insn & INSN_MASK_MOP_R_N) == INSN_MATCH_MOP_R_N ||
> +		    (insn & INSN_MASK_MOP_RR_N) == INSN_MATCH_MOP_RR_N) {
> +			SET_RD(insn, regs, 0);
> +			regs->mepc += 4;
> +			return 0;
> +		}
> +
> +		/* Otherwise treat this as an error */
>  		sbi_printf("%s: Invalid opcode for CSR read/write instruction",
>  			   __func__);
>  		return truly_illegal_insn(insn, regs);
> @@ -126,50 +149,77 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>  }
>  

>  static const illegal_insn_func illegal_insn_table[32] = {
> -	truly_illegal_insn, /* 0 */
> -	truly_illegal_insn, /* 1 */
> -	truly_illegal_insn, /* 2 */
> -	misc_mem_opcode_insn, /* 3 */
> -	truly_illegal_insn, /* 4 */
> -	truly_illegal_insn, /* 5 */
> -	truly_illegal_insn, /* 6 */
> -	truly_illegal_insn, /* 7 */
> -	truly_illegal_insn, /* 8 */
> -	truly_illegal_insn, /* 9 */
> -	truly_illegal_insn, /* 10 */
> -	sbi_illegal_atomic, /* 11 */
> -	truly_illegal_insn, /* 12 */
> -	truly_illegal_insn, /* 13 */
> -	truly_illegal_insn, /* 14 */
> -	truly_illegal_insn, /* 15 */
> -	truly_illegal_insn, /* 16 */
> -	truly_illegal_insn, /* 17 */
> -	truly_illegal_insn, /* 18 */
> -	truly_illegal_insn, /* 19 */
> -	truly_illegal_insn, /* 20 */
> -	truly_illegal_insn, /* 21 */
> -	truly_illegal_insn, /* 22 */
> -	truly_illegal_insn, /* 23 */
> -	truly_illegal_insn, /* 24 */
> -	truly_illegal_insn, /* 25 */
> -	truly_illegal_insn, /* 26 */
> -	truly_illegal_insn, /* 27 */
> -	system_opcode_insn, /* 28 */
> -	truly_illegal_insn, /* 29 */
> -	truly_illegal_insn, /* 30 */
> -	truly_illegal_insn  /* 31 */
> +	truly_illegal_insn,	/* 0 */
> +	sbi_insn_emu_load_fp,	/* 1 */
> +	truly_illegal_insn,	/* 2 */
> +	misc_mem_opcode_insn,	/* 3 */
> +	sbi_insn_emu_op_imm,	/* 4 */
> +	truly_illegal_insn,	/* 5 */
> +	sbi_insn_emu_op_imm_32, /* 6 */
> +	truly_illegal_insn,	/* 7 */
> +	truly_illegal_insn,	/* 8 */
> +	sbi_insn_emu_store_fp,	/* 9 */
> +	truly_illegal_insn,	/* 10 */
> +	sbi_illegal_atomic,	/* 11 */
> +	sbi_insn_emu_op,	/* 12 */
> +	truly_illegal_insn,	/* 13 */
> +	sbi_insn_emu_op_32,	/* 14 */
> +	truly_illegal_insn,	/* 15 */
> +	truly_illegal_insn,	/* 16 */
> +	truly_illegal_insn,	/* 17 */
> +	truly_illegal_insn,	/* 18 */
> +	truly_illegal_insn,	/* 19 */
> +	sbi_insn_emu_op_fp,	/* 20 */
> +	sbi_insn_emu_op_v,	/* 21 */
> +	truly_illegal_insn,	/* 22 */
> +	truly_illegal_insn,	/* 23 */
> +	truly_illegal_insn,	/* 24 */
> +	truly_illegal_insn,	/* 25 */
> +	truly_illegal_insn,	/* 26 */
> +	truly_illegal_insn,	/* 27 */
> +	system_opcode_insn,	/* 28 */
> +	truly_illegal_insn,	/* 29 */
> +	truly_illegal_insn,	/* 30 */
> +	truly_illegal_insn	/* 31 */
> +};
> +
> +static const illegal_insn_func illegal_insn16_table[24] = {
> +	truly_illegal_insn,	 /* 0 */
> +	truly_illegal_insn,	 /* 1 */
> +	truly_illegal_insn,	 /* 2 */
> +	truly_illegal_insn,	 /* 3 */
> +	sbi_insn_emu_c_reserved, /* 4 */
> +	truly_illegal_insn,	 /* 5 */
> +	truly_illegal_insn,	 /* 6 */
> +	truly_illegal_insn,	 /* 7 */
> +	truly_illegal_insn,	 /* 8 */
> +	truly_illegal_insn,	 /* 9 */
> +	truly_illegal_insn,	 /* 10 */
> +	sbi_insn_emu_c_mop,	 /* 11 */
> +	sbi_insn_emu_c_misc_alu, /* 12 */
> +	truly_illegal_insn,	 /* 13 */
> +	truly_illegal_insn,	 /* 14 */
> +	truly_illegal_insn,	 /* 15 */
> +	truly_illegal_insn,	 /* 16 */
> +	truly_illegal_insn,	 /* 17 */
> +	truly_illegal_insn,	 /* 18 */
> +	truly_illegal_insn,	 /* 19 */
> +	truly_illegal_insn,	 /* 20 */
> +	truly_illegal_insn,	 /* 21 */
> +	truly_illegal_insn,	 /* 22 */
> +	truly_illegal_insn	 /* 23 */
>  };
>  

Can we convert this to a carray configuration? I think it is time
to build it dynamicly.

>  int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
>  {
>  	struct sbi_trap_regs *regs = &tcntx->regs;
> -	ulong insn = tcntx->trap.tval;
> +	ulong insn		   = tcntx->trap.tval;
>  	struct sbi_trap_info uptrap;
>  
>  	/*
> -	 * We only deal with 32-bit (or longer) illegal instructions. If we
> -	 * see instruction is zero OR instruction is 16-bit then we fetch and
> -	 * check the instruction encoding using unprivilege access.
> +	 * We only deal with 32-bit (or longer) illegal instructions directly.
> +	 * If we see instruction is zero OR instruction is 16-bit then we fetch
> +	 * and check the instruction encoding using unprivilege access.
>  	 *
>  	 * The program counter (PC) in RISC-V world is always 2-byte aligned
>  	 * so handling only 32-bit (or longer) illegal instructions also help
> @@ -183,7 +233,8 @@ int sbi_illegal_insn_handler(struct sbi_trap_context *tcntx)
>  		if (uptrap.cause)
>  			return sbi_trap_redirect(regs, &uptrap);
>  		if ((insn & 3) != 3)
> -			return truly_illegal_insn(insn, regs);
> +			return illegal_insn16_table[(insn & 3) << 3 |
> +						    insn >> 13](insn, regs);
>  	}
>  
>  	return illegal_insn_table[(insn & 0x7c) >> 2](insn, regs);
>
> [...]
>

> diff --git a/platform/generic/starfive/jh7110.c b/platform/generic/starfive/jh7110.c
> index c132843..037be2e 100644
> --- a/platform/generic/starfive/jh7110.c
> +++ b/platform/generic/starfive/jh7110.c
> @@ -301,6 +301,12 @@ static bool starfive_jh7110_cold_boot_allowed(u32 hartid)
>  	return generic_cold_boot_allowed(hartid);
>  }
>  
> +static void starfive_jh7110_flush_data_caches(void)
> +{
> +	/* flush L1 data cache via cflush.d.l1 zero */
> +	asm volatile(".insn i 0x73, 0, zero, zero, -0x40");
> +}
> +
>  static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
>  					 const struct fdt_match *match)
>  {
> @@ -316,6 +322,7 @@ static int starfive_jh7110_platform_init(const void *fdt, int nodeoff,
>  
>  	generic_platform_ops.cold_boot_allowed = starfive_jh7110_cold_boot_allowed;
>  	generic_platform_ops.final_init = starfive_jh7110_final_init;
> +	generic_platform_ops.flush_data_caches = starfive_jh7110_flush_data_caches;
>  
>  	return 0;
>  }
> diff --git a/platform/generic/thead/thead-generic.c b/platform/generic/thead/thead-generic.c
> index ddb4f0b..2e6c5a1 100644
> --- a/platform/generic/thead/thead-generic.c
> +++ b/platform/generic/thead/thead-generic.c
> @@ -39,6 +39,12 @@ static int thead_pmu_extensions_init(struct sbi_hart_features *hfeatures)
>  	return 0;
>  }
>  
> +static void thead_flush_data_caches(void)
> +{
> +	/* flush data cache via th.dcache.call */
> +	asm volatile(".insn i 0xb, 0, zero, zero, 1");
> +}
> +
>  static int thead_generic_platform_init(const void *fdt, int nodeoff,
>  				       const struct fdt_match *match)
>  {
> @@ -48,6 +54,7 @@ static int thead_generic_platform_init(const void *fdt, int nodeoff,
>  		generic_platform_ops.early_init = thead_tlb_flush_early_init;
>  	if (quirks->errata & THEAD_QUIRK_ERRATA_THEAD_PMU)
>  		generic_platform_ops.extensions_init = thead_pmu_extensions_init;
> +	generic_platform_ops.flush_data_caches = thead_flush_data_caches;
>  
>  	return 0;
>  }

Please split these two diff into standalone patches. And, Please add an
errata quirk for the data_caches. New cores may not suffer this problem.

Regards,
INochi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
