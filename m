Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C58FD5F82
	for <opensbi@archiver.kernel.org>; Wed,  8 Apr 2026 07:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+Jj6J2xAHJjWj2wguPhTwhYee46V0RvMD90LooO18I=; b=mswU1eQATqZ5eU
	ub9MJ1Lk3G4yCzK9G5K2F2Io18Tk/QP2lcjCI95x4k6F+8AnIGGDsgyARUuc4cbHKpf0JPD2lPeYA
	wCo0bAQ/Wu4uw6pG8Il0yLXBueIKxJ/VzWqPZmNMjYP06w2GEszAOVpEUt09xTFTpcpFfnaFh4Ovl
	S8zG8L6WPsLgR0mvtOOgRmJQ+IdGZQkgr921dUQF2mvdABB7+GJL4vBbdFv0kiDp726NgtDKSLTjo
	2xmhUxYEW/JLWoD/gK/b7R8A+ZzsqfQ3LB1gWbJ9wPq+qtjbKEYpvEJvsCVzXdCy2uX7FPuXab0uU
	uzo3QKW3njAv75RcWOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANB1-00000008PJd-07Wg;
	Wed, 08 Apr 2026 07:18:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANAy-00000008PJH-0C72
	for opensbi@lists.infradead.org;
	Wed, 08 Apr 2026 07:18:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so5642053f8f.3
        for <opensbi@lists.infradead.org>; Wed, 08 Apr 2026 00:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775632689; x=1776237489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wP8rVY6O1YXSL3Rl9ZBgyVLQUG6sqimCK3HqgtHD/v4=;
        b=GXylH4ZgFuRrhtnLN4TwWSiE/0yhzYg4E+A+s38JTipVI8VMJZKwz+SMs5nd3q9oNm
         66/uGaJ9n8HEblp3ZC0yDE0q9eUQv6uA6PnTboyvv87B3wzDnmQYNEHwfEqYGTLtVK8w
         DUSde632xa35N4BddmHm8xFvRmsSXLcvNFBS/IdVp1KUmBkK7rO5LWYKwNaq9ErPVlDC
         571dYpOLExx0AzB3mle6CUgq+LvYqvqlpCrwty2ymfSjOF9072CTKg/IfmwIcSTf0dXi
         +R1qzCk+RZ662mxAn44tuqw4D/AUxVNd7VF1tuF8f/VDolwG7ZhRfKpTXzYLMxDURPV8
         uR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632689; x=1776237489;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wP8rVY6O1YXSL3Rl9ZBgyVLQUG6sqimCK3HqgtHD/v4=;
        b=PqnVUNiHN8YoHFkDWiBgNiM7DR0tzuQu33Y4srWpjz0tAkkaSyMJqo/p2Kj82MELPi
         EoH/sZbMenOu9ilpDe7k1x9c3nz0GxgkavoGwTlOTfBQuBUuFPJsjD1ikJjxQppIFCfj
         IPlhEwXPRuT2wV7fJX97opByUr1FMNBL3aGMjao22vUljQnjV7sA0JsVlqSZJPir120W
         GqGxTspmuvBUOROpfMs9sPlhUuokTMlAmqldEebnvioVcVqtXFAaTBydyi9MOwOXq/gT
         BBROtwbJN47UfmPA8C7yLGbA5lqlpaFofpMUOZnsXxC4NptkaimY0znKXk4TynDMjNhM
         e/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWU11OMZeOWMY9VJctQ/o8+fh5BDv03rK1DB9FGaB5QYYqt+rdzqfClgNQnMGcSz6g16+mZQzUm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvgmgv5eIHW0c6ZiDMJ9xaLDmKCP0AHyhcx6ni5YmuBgMaUkJo
	7yGTAJwteSHuf+5Tst3jJs1S99mv+6XbFp0ff/ziVxRltEYheewsLxKE/LrdOy5tovw6aWGdAoI
	N+GW5r7o=
X-Gm-Gg: AeBDietaAJfqu2Jtzo1gp4Vq86oD9NaupmgQgRHl7Y0hP0N3cuSUITClJ0uwu1T9TsX
	6E7gM46BjLgMHRNeWUdjBrHIzoS0rOJ7HwFyBznv4GsukJ+o68pqtZXLVppDR0kNqW5AUZhmNld
	tL/mJAS9KqOD1TmnXsE49NuU9N28FmNV+IKt07cicqd9ZVQlN7FkMQzsqRDfGk2f0Vuzo1Ddulc
	shVuso/vVpJyYMDg7cbddvvxzsOxXpydk9DigNrcs7zog60iC+7RO3gcqkQRfwzASLnZT1BkXGc
	/tK69Nu+EFGEGiPQf3Akp+9pYSOyZ2UK1XfMX3CBbEWdtahZhFgtv6z8AsacdkMCphe79lk1RRh
	m+EpFxbCcAktvGUY0gxW9wMMpceDWnVCqxxuxJwTmGVZ6sNCaBfOMV8MNCLy3NQd8qDdxZp2CEA
	a+8kwIlVC9AAnC734h0/9GOXg+maTy1x3h6DH+ueBNMuBCcaKRVpvbi/+LLS8PGw==
X-Received: by 2002:a05:6000:230c:b0:43b:42af:75e with SMTP id ffacd0b85a97d-43d292fed0dmr28537695f8f.44.1775632689182;
        Wed, 08 Apr 2026 00:18:09 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm53762959f8f.29.2026.04.08.00.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:18:08 -0700 (PDT)
Message-ID: <2b7f38c5-01cb-4f39-979a-8a8a89eea07a@riscstar.com>
Date: Wed, 8 Apr 2026 08:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dave Patel <dave.patel@riscstar.com>
Subject: Re: [PATCH v4 1/3] lib: sbi: Add RISC-V vector context save/restore
 support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 opensbi@lists.infradead.org, radim.krcmar@oss.qualcomm.com
References: <20260406193133.658066-1-dave.patel@riscstar.com>
 <20260406193133.658066-2-dave.patel@riscstar.com>
 <c91abcac-6e06-4d9e-8f59-9fd23d53df32@sifive.com>
Content-Language: en-US
In-Reply-To: <c91abcac-6e06-4d9e-8f59-9fd23d53df32@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_001812_408456_05049AA5 
X-CRM114-Status: GOOD (  24.79  )
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

On 4/6/26 23:39, Samuel Holland wrote:
> Hi Dave,
> 
> On 2026-04-06 2:31 PM, dave.patel@riscstar.com wrote:
>> From: Dave Patel <dave.patel@riscstar.com>
>>
>> Eager context switch: Add support for saving and restoring RISC-V vector
>> extension state in OpenSBI. This introduces a per-hart vector context
>> structure and helper routines to perform full context save and restore.
>>
>> The vector context includes vcsr CSRs along with storage for all 32 vector
>> registers. The register state is saved and restored using byte-wise vector
>> load/store instructions (vs8r/vl8r).
>>
>> The implementation follows an eager context switching model where the entire
>> vector state is saved and restored on every context switch. This provides a
>> simple and deterministic mechanism without requiring lazy trap-based
>> management.
>>
>> Notes:
>> - The SBI_MAX_VLENB is configured using CONFIG_SBI_MAX_VLENB.
>>
>> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
>> ---
>>  include/sbi/sbi_vector.h |  29 ++++++++
>>  lib/sbi/Kconfig          |   4 +
>>  lib/sbi/objects.mk       |   1 +
>>  lib/sbi/sbi_vector.c     | 154 +++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 188 insertions(+)
>>  create mode 100644 include/sbi/sbi_vector.h
>>  create mode 100644 lib/sbi/sbi_vector.c
>>
>> diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
>> new file mode 100644
>> index 00000000..13048716
>> --- /dev/null
>> +++ b/include/sbi/sbi_vector.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: GPL-2.0
> 
> This license is not compatible with the OpenSBI project. You need to release
> these changes under a compatible license (assuming you are able to do so, i.e.
> they are not derived from GPL code, etc. I am not a lawyer).
> 
Thanks, I have updated to match the Opensbi standards.

>> + *
>> + * Copyright (c) 2026 RISCstar Solutions.
>> + *
>> + * Authors:
>> + *   Dave Patel <dave.patel@riscstar.com>
>> + */
>> +
>> +#ifndef __SBI_VECTOR_H__
>> +#define __SBI_VECTOR_H__
>> +
>> +#include <sbi/sbi_types.h>
>> +
>> +#define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB
>> +
>> +struct sbi_vector_context {
>> +	unsigned long vcsr;
>> +	unsigned long vstart;
>> +
>> +	/* size depends on VLEN */
>> +	uint8_t vregs[32 * SBI_MAX_VLENB];
>> +};
>> +
>> +void sbi_vector_save(struct sbi_vector_context *dst);
>> +void sbi_vector_restore(const struct sbi_vector_context *src);
>> +int sbi_vector_domain_init(void);
>> +
>> +#endif //__SBI_VECTOR_H__
>> +
>> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
>> index 8479f861..b2432150 100644
>> --- a/lib/sbi/Kconfig
>> +++ b/lib/sbi/Kconfig
>> @@ -74,4 +74,8 @@ config SBI_ECALL_VIRQ
>>  	bool "VIRQ extension"
>>  	default y
>>
>> +config SBI_MAX_VLENB
>> +	int "Vector VLENB size"
>> +	default 256
>> +
>>  endmenu
>> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
>> index 68fc2036..ecb2b54e 100644
>> --- a/lib/sbi/objects.mk
>> +++ b/lib/sbi/objects.mk
>> @@ -109,3 +109,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
>>  libsbi-objs-y += sbi_unpriv.o
>>  libsbi-objs-y += sbi_expected_trap.o
>>  libsbi-objs-y += sbi_cppc.o
>> +libsbi-objs-y += sbi_vector.o
>> diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
>> new file mode 100644
>> index 00000000..85134f8b
>> --- /dev/null
>> +++ b/lib/sbi/sbi_vector.c
>> @@ -0,0 +1,154 @@
>> +/* SPDX-License-Identifier: GPL-2.0
>> + *
>> + * Copyright (c) 2026 RISCstar Solutions.
>> + *
>> + * Authors:
>> + *	 Dave Patel <dave.patel@riscstar.com>
>> + */
>> +
>> +#include <sbi/sbi_domain.h>
>> +#include <sbi/riscv_encoding.h>
>> +#include <sbi/riscv_asm.h>
>> +#include <sbi/sbi_vector.h>
>> +#include <sbi/sbi_types.h>
>> +#include <sbi/sbi_hart.h>
>> +#include <sbi/sbi_error.h>
>> +#include <sbi/sbi_console.h>
>> +
>> +#ifdef OPENSBI_CC_SUPPORT_VECTOR
>> +
>> +static inline unsigned long vector_vlenb(void)
>> +{
>> +	unsigned long vlenb = 0;
>> +
>> +	asm volatile (
>> +		".option push\n\t"
>> +		".option arch, +v\n\t"
>> +		"csrr %0, vlenb\n\t"
>> +		".option pop\n\t"
>> +		: "=r"(vlenb)
>> +		:
>> +		: "memory");
>> +
>> +	return vlenb;
>> +}
>> +
>> +void sbi_vector_save(struct sbi_vector_context *dst)
>> +{
>> +	if (!dst)
>> +		return;
>> +
>> +#define READ_CSR(dst, csr)				\
>> +	({						\
>> +		asm volatile (				\
>> +			"	.option push\n\t"	\
>> +			"	.option arch, +v\n\t"	\
>> +			"	csrr %0, " #csr "\n\t"	\
>> +			"	.option pop\n\t"	\
>> +			:	"=r"(dst)		\
>> +			:				\
>> +			:	"memory");		\
>> +	})						\
>> +
>> +	/* Step 1: Save CSRs */
>> +	READ_CSR(dst->vcsr,   vcsr);
>> +	READ_CSR(dst->vstart, vstart);
>> +
>> +#undef READ_CSR
>> +
>> +	ulong vlenb = vector_vlenb();
>> +	uint8_t *base = dst->vregs;
>> +
>> +	/* Step 3: Save vector registers */
>> +#define SAVE_VREG(i)						\
>> +	({							\
>> +	asm volatile(						\
>> +		"	.option push\n\t"			\
>> +		"	.option arch, +v\n\t"			\
>> +		"	vs8r.v v" #i ", (%0)\n\t"		\
>> +		"	.option pop\n\t"			\
>> +		::	"r"(base + (i) * vlenb)	: "memory");	\
>> +	})							\
>> +
>> +	SAVE_VREG(0);
>> +	SAVE_VREG(8);
>> +	SAVE_VREG(16);
>> +	SAVE_VREG(24);
>> +
>> +#undef SAVE_VREG
>> +}
>> +
>> +void sbi_vector_restore(const struct sbi_vector_context *src)
>> +{
>> +	if (!src)
>> +		return;
>> +
>> +	const uint8_t *base = src->vregs;
>> +	ulong vlenb = vector_vlenb();
>> +
>> +	/* Step 2: Restore vector registers */
>> +#define RESTORE_VREG(i)					\
>> +	({							\
>> +	asm volatile(						\
>> +		"	.option push\n\t"			\
>> +		"	.option arch, +v\n\t"			\
>> +		"	vl8r.v v" #i ", (%0)\n\t"		\
>> +		"	.option pop\n\t"			\
>> +		::	"r"(base + (i) * vlenb) : "memory");	\
>> +	 })							\
>> +
>> +	RESTORE_VREG(0);
>> +	RESTORE_VREG(8);
>> +	RESTORE_VREG(16);
>> +	RESTORE_VREG(24);
>> +#undef RESTORE_VREG
>> +
>> +	/* Step 3: Restore CSR's last */
>> +#define WRITE_CSR(csr, val)			\
>> +	({					\
>> +	asm volatile(				\
>> +		"	.option push\n\t"	\
>> +		"	.option arch, +v\n\t"	\
>> +		"	csrw " #csr ", %0\n\t"	\
>> +		"	.option pop\n\t"	\
>> +		:				\
>> +		:	"r"(val)		\
>> +		:	"memory");		\
>> +	 })					\
>> +
>> +	/* Restore CSRs first */
>> +	WRITE_CSR(vcsr,   src->vcsr);
>> +	WRITE_CSR(vstart, src->vstart);
>> +#undef WRITE_CSR
>> +}
>> +
>> +int sbi_vector_domain_init(void)
>> +{
>> +	csr_set(CSR_MSTATUS, MSTATUS_VS);
>> +	ulong vlenb = vector_vlenb();
>> +
>> +	if (vlenb > SBI_MAX_VLENB) {
>> +		sbi_printf("[Vector ERR:] vlenb range error\n");
>> +		return SBI_ERR_BAD_RANGE;
>> +	}
>> +
>> +	csr_clear(CSR_MSTATUS, MSTATUS_VS);
> 
> What is the purpose of this CSR write? If you want to set the initial state of
> the vector registers, this doesn't accomplish that; you have to write the vector
> registers.
> 
The code is to check the vlen at the startup, the csr set is used so
that the vector operation can be performed and cleared to bring it back
to it's original state.


> Regards,
> Samuel
> 
>> +	return SBI_OK;
>> +}
>> +
>> +#else
>> +
>> +void sbi_vector_save(struct sbi_vector_context *dst)
>> +{
>> +}
>> +
>> +void sbi_vector_restore(const struct sbi_vector_context *src)
>> +{
>> +}
>> +
>> +int sbi_vector_domain_init(void)
>> +{
>> +	return SBI_OK;
>> +}
>> +
>> +#endif /* OPENSBI_CC_SUPPORT_VECTOR */
>> --
>> 2.43.0
>>
> 
Hi Samuel,
          Please see inline above.
Thanks
Dave


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
