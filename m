Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F3CFB5177
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 22:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVGZBUr5lRyyISKMVxgUXL/qPto5HK50Tc8NR9XNZ20=; b=MuQJ/LZV8xPNF/
	j2mBarsSLzMWGjNvmFPmSLrNKaxqHOkw74Xy3puc1KAZtfiwSk7gyJNqPLN1RSduYZXvFQq6fA7B2
	oT/XvRnxhypm6w+HRG40Sq9IZDT9k/JnTgCdI2Ydcd98mLABKtE+vQ5e3kNhiH9MzYwCisb3gR4wL
	XVpb5tbyI+bgHjAcNh0bkCFvysQPPpknfl8QoxT9kTPL7jmRDWsCj6PhQ5fyLYO8rmsewlmMfrON+
	hDRyxvG+Ukn5kj+k8WKujm7uMt52+ILoL5NjNlx/nvy2BrsjRLGRA8S+yrMITeKUzklRaE4qcKL4v
	kevOAs45X/qGBYcgd73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sc0-00000005aIS-1sUG;
	Mon, 06 Apr 2026 22:40:04 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sbx-00000005aHt-2cTa
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 22:40:02 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-466ec4c6846so1300973b6e.3
        for <opensbi@lists.infradead.org>; Mon, 06 Apr 2026 15:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775515200; x=1776120000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pX1YC5tISi+USHBQkf3/gYgjH84jLt2WiqEZ7zHo10=;
        b=cBQnmQThzv+uA862Lm/xqe3vRmMY3TIf2Zy+asDs6wo855cLzsTfzDud235oMVcKRe
         WvVdUqi3w0uYQz2UTkwowgPAgBKagy3+zuIayOPHHih2xRJiSEaFWxlSdKNpnl7n+sC5
         1EjxDTB5hCo75GJXeGEY9NC/F6FIqlkCoUDN1PBNk8UIhwSdkw0HRzAobIhyqBfg1dj1
         sy+6YZUGvwfXE4nLXZjAVqI0nGcpT7lWp+zh7nGnBZ5wJgZZWzotJIp3Fbb83mi1b67U
         WTKK57xdN9pQmRiFqt4J+Wkm3JdWF/cV/a3cPvVmguzTviXQqifIjlOgsmGrOkTfTOn0
         WV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775515200; x=1776120000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pX1YC5tISi+USHBQkf3/gYgjH84jLt2WiqEZ7zHo10=;
        b=ouDx7LMm7m1MEs9x/K6tBx/UgzT28QJ/dzPNYrBdChkMadIUwoQ88EdJYX7KjajhnB
         V47o2q8lvcv4DKVhXCO1df7BDsyBEwsIP53jDg4QRcbhpBpDRIXmL7PUp+6sS8X6mNP1
         xs31H2pT2xYVOYhnTp7KxNHX8MWZK44ybXvbhjbogOlstc8vltEk736YFabfCgtnkp/T
         RVSk+hL/h6hWY9vJrxiGmBZT8ewOd3Ry5qOsItA0XZ5aldWHNMbgx3XJL2m3Req9Cdsi
         FcjD9pignmjg9JjC3qaOHMixL4T5kOLbq8OeU4/N+zhRYc6w6G5a78y045YaoDfujN8P
         jjew==
X-Forwarded-Encrypted: i=1; AJvYcCV5fR+6Q+U9M6rL7nAi3IoaAwNyOZqwf284hAIbAsDWZONModdwQNOeMCuNcEHJVarAXGgM66td@lists.infradead.org
X-Gm-Message-State: AOJu0YxTQ51YghOhsJolX5uBT8jmwSOEFdFFAt4+SfKg2hoARyN5df9T
	QrKiyhjSurZ+Zsw6g9l3O872xGBDhI7fC21fjt4CnaRoaE64NSR3Z9jawwnKDUryImg=
X-Gm-Gg: AeBDietBjdcQ/GENrEm1Df69gE+G6Qncq127KmgKUqa+GBvbZz6+dejLx6W94ucnOMh
	aJH1XnnlyUhYujc8nyhMnQoOeCIM5Irufmd2TlqS3WleQRiLsNnMYKnDVge/T7jF1Fa+5iiaSWJ
	gM7dyguF1EKtTTrXl1rl7Tfavu3eJ1i3c0qKKH6Vz4Nn5CuJHobUDEHS3ZJ5N4q09yEzIFOqye2
	ZaTGcqXWmeaBzM3DaR7t0oArpgPcOvgQ/GH0Lhlup2eFcEJdcPO3sPJKX5igEEK28fpmWE9TwZC
	YD7rh8m6oAc9JX/55sSqo20xMX7bIchlETPF5l1SdDAPeRv8b0Gf1tHYt5luf4RKZUtVw8WhQaK
	7wIHkR9InnR1pi6rpJ74kCvwUF7pXcoM50qB5fuiCJ2pgRI+WGyV4OKk+6LDKeFdO25Pukl5/0k
	/QWHCWkfxhJpRhPaKbIWCGEkPsWEXrIZSJt+U=
X-Received: by 2002:a05:6808:5383:b0:467:268d:31d4 with SMTP id 5614622812f47-46ef60f1cd3mr6814012b6e.20.1775515200149;
        Mon, 06 Apr 2026 15:40:00 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7159fd9sm10901262a34.7.2026.04.06.15.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 15:39:59 -0700 (PDT)
Message-ID: <c91abcac-6e06-4d9e-8f59-9fd23d53df32@sifive.com>
Date: Mon, 6 Apr 2026 17:39:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] lib: sbi: Add RISC-V vector context save/restore
 support
To: dave.patel@riscstar.com
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 opensbi@lists.infradead.org, radim.krcmar@oss.qualcomm.com
References: <20260406193133.658066-1-dave.patel@riscstar.com>
 <20260406193133.658066-2-dave.patel@riscstar.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260406193133.658066-2-dave.patel@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_154001_720274_CD81F9FF 
X-CRM114-Status: GOOD (  23.62  )
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

Hi Dave,

On 2026-04-06 2:31 PM, dave.patel@riscstar.com wrote:
> From: Dave Patel <dave.patel@riscstar.com>
> 
> Eager context switch: Add support for saving and restoring RISC-V vector
> extension state in OpenSBI. This introduces a per-hart vector context
> structure and helper routines to perform full context save and restore.
> 
> The vector context includes vcsr CSRs along with storage for all 32 vector
> registers. The register state is saved and restored using byte-wise vector
> load/store instructions (vs8r/vl8r).
> 
> The implementation follows an eager context switching model where the entire
> vector state is saved and restored on every context switch. This provides a
> simple and deterministic mechanism without requiring lazy trap-based
> management.
> 
> Notes:
> - The SBI_MAX_VLENB is configured using CONFIG_SBI_MAX_VLENB.
> 
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---
>  include/sbi/sbi_vector.h |  29 ++++++++
>  lib/sbi/Kconfig          |   4 +
>  lib/sbi/objects.mk       |   1 +
>  lib/sbi/sbi_vector.c     | 154 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 188 insertions(+)
>  create mode 100644 include/sbi/sbi_vector.h
>  create mode 100644 lib/sbi/sbi_vector.c
> 
> diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
> new file mode 100644
> index 00000000..13048716
> --- /dev/null
> +++ b/include/sbi/sbi_vector.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0

This license is not compatible with the OpenSBI project. You need to release
these changes under a compatible license (assuming you are able to do so, i.e.
they are not derived from GPL code, etc. I am not a lawyer).

> + *
> + * Copyright (c) 2026 RISCstar Solutions.
> + *
> + * Authors:
> + *   Dave Patel <dave.patel@riscstar.com>
> + */
> +
> +#ifndef __SBI_VECTOR_H__
> +#define __SBI_VECTOR_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +#define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB
> +
> +struct sbi_vector_context {
> +	unsigned long vcsr;
> +	unsigned long vstart;
> +
> +	/* size depends on VLEN */
> +	uint8_t vregs[32 * SBI_MAX_VLENB];
> +};
> +
> +void sbi_vector_save(struct sbi_vector_context *dst);
> +void sbi_vector_restore(const struct sbi_vector_context *src);
> +int sbi_vector_domain_init(void);
> +
> +#endif //__SBI_VECTOR_H__
> +
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index 8479f861..b2432150 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -74,4 +74,8 @@ config SBI_ECALL_VIRQ
>  	bool "VIRQ extension"
>  	default y
> 
> +config SBI_MAX_VLENB
> +	int "Vector VLENB size"
> +	default 256
> +
>  endmenu
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index 68fc2036..ecb2b54e 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -109,3 +109,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
>  libsbi-objs-y += sbi_unpriv.o
>  libsbi-objs-y += sbi_expected_trap.o
>  libsbi-objs-y += sbi_cppc.o
> +libsbi-objs-y += sbi_vector.o
> diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
> new file mode 100644
> index 00000000..85134f8b
> --- /dev/null
> +++ b/lib/sbi/sbi_vector.c
> @@ -0,0 +1,154 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2026 RISCstar Solutions.
> + *
> + * Authors:
> + *	 Dave Patel <dave.patel@riscstar.com>
> + */
> +
> +#include <sbi/sbi_domain.h>
> +#include <sbi/riscv_encoding.h>
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_vector.h>
> +#include <sbi/sbi_types.h>
> +#include <sbi/sbi_hart.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_console.h>
> +
> +#ifdef OPENSBI_CC_SUPPORT_VECTOR
> +
> +static inline unsigned long vector_vlenb(void)
> +{
> +	unsigned long vlenb = 0;
> +
> +	asm volatile (
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"csrr %0, vlenb\n\t"
> +		".option pop\n\t"
> +		: "=r"(vlenb)
> +		:
> +		: "memory");
> +
> +	return vlenb;
> +}
> +
> +void sbi_vector_save(struct sbi_vector_context *dst)
> +{
> +	if (!dst)
> +		return;
> +
> +#define READ_CSR(dst, csr)				\
> +	({						\
> +		asm volatile (				\
> +			"	.option push\n\t"	\
> +			"	.option arch, +v\n\t"	\
> +			"	csrr %0, " #csr "\n\t"	\
> +			"	.option pop\n\t"	\
> +			:	"=r"(dst)		\
> +			:				\
> +			:	"memory");		\
> +	})						\
> +
> +	/* Step 1: Save CSRs */
> +	READ_CSR(dst->vcsr,   vcsr);
> +	READ_CSR(dst->vstart, vstart);
> +
> +#undef READ_CSR
> +
> +	ulong vlenb = vector_vlenb();
> +	uint8_t *base = dst->vregs;
> +
> +	/* Step 3: Save vector registers */
> +#define SAVE_VREG(i)						\
> +	({							\
> +	asm volatile(						\
> +		"	.option push\n\t"			\
> +		"	.option arch, +v\n\t"			\
> +		"	vs8r.v v" #i ", (%0)\n\t"		\
> +		"	.option pop\n\t"			\
> +		::	"r"(base + (i) * vlenb)	: "memory");	\
> +	})							\
> +
> +	SAVE_VREG(0);
> +	SAVE_VREG(8);
> +	SAVE_VREG(16);
> +	SAVE_VREG(24);
> +
> +#undef SAVE_VREG
> +}
> +
> +void sbi_vector_restore(const struct sbi_vector_context *src)
> +{
> +	if (!src)
> +		return;
> +
> +	const uint8_t *base = src->vregs;
> +	ulong vlenb = vector_vlenb();
> +
> +	/* Step 2: Restore vector registers */
> +#define RESTORE_VREG(i)					\
> +	({							\
> +	asm volatile(						\
> +		"	.option push\n\t"			\
> +		"	.option arch, +v\n\t"			\
> +		"	vl8r.v v" #i ", (%0)\n\t"		\
> +		"	.option pop\n\t"			\
> +		::	"r"(base + (i) * vlenb) : "memory");	\
> +	 })							\
> +
> +	RESTORE_VREG(0);
> +	RESTORE_VREG(8);
> +	RESTORE_VREG(16);
> +	RESTORE_VREG(24);
> +#undef RESTORE_VREG
> +
> +	/* Step 3: Restore CSR's last */
> +#define WRITE_CSR(csr, val)			\
> +	({					\
> +	asm volatile(				\
> +		"	.option push\n\t"	\
> +		"	.option arch, +v\n\t"	\
> +		"	csrw " #csr ", %0\n\t"	\
> +		"	.option pop\n\t"	\
> +		:				\
> +		:	"r"(val)		\
> +		:	"memory");		\
> +	 })					\
> +
> +	/* Restore CSRs first */
> +	WRITE_CSR(vcsr,   src->vcsr);
> +	WRITE_CSR(vstart, src->vstart);
> +#undef WRITE_CSR
> +}
> +
> +int sbi_vector_domain_init(void)
> +{
> +	csr_set(CSR_MSTATUS, MSTATUS_VS);
> +	ulong vlenb = vector_vlenb();
> +
> +	if (vlenb > SBI_MAX_VLENB) {
> +		sbi_printf("[Vector ERR:] vlenb range error\n");
> +		return SBI_ERR_BAD_RANGE;
> +	}
> +
> +	csr_clear(CSR_MSTATUS, MSTATUS_VS);

What is the purpose of this CSR write? If you want to set the initial state of
the vector registers, this doesn't accomplish that; you have to write the vector
registers.

Regards,
Samuel

> +	return SBI_OK;
> +}
> +
> +#else
> +
> +void sbi_vector_save(struct sbi_vector_context *dst)
> +{
> +}
> +
> +void sbi_vector_restore(const struct sbi_vector_context *src)
> +{
> +}
> +
> +int sbi_vector_domain_init(void)
> +{
> +	return SBI_OK;
> +}
> +
> +#endif /* OPENSBI_CC_SUPPORT_VECTOR */
> --
> 2.43.0
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
