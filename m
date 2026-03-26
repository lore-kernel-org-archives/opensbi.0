Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DF910A62ED
	for <opensbi@archiver.kernel.org>; Thu, 26 Mar 2026 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ah38/sk5ylEQSdPEenKWB3m19+8DEDTJgrx2dR7D+zc=; b=pvh939WktrS4Z2
	koCUWi52no8OvIIs4weOMSpASYRFJlNXOZ4MZ7wrNeldvDt2tBDWKfYCnEY0QNAtSNeLvIUPnn3PN
	pGki82rSd+Tr9hM/xv5UttmaV+hw9Fyi63+90D+PsrT+uBoy6BTKUjF09YAAfaTkkb+6QQnu809a3
	5LQCzPBDC8GpCx1l9wz6239hz6XP+2G3wE/0W+HWdNOelcZzQWk+SPkQ5nmB/uGZSlGAdLIf03XJI
	4X/pesqVltp5yQyTmQRZDxh0x9oeT5GBTrLK0K06yWq/aUyjB5jHQ5QnaSwdtxJw+zxVCJQ20JBD2
	ZzryvYp+jVTdh7DtQXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lga-00000005dpq-2ESX;
	Thu, 26 Mar 2026 14:27:48 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lgX-00000005dpJ-26vm
	for opensbi@lists.infradead.org;
	Thu, 26 Mar 2026 14:27:46 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4043b909ed4so669274fac.3
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774535264; x=1775140064; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8iHWnIkjYyliHk7dayV5vHCEblVAAkKXX+ASJ1ObA0=;
        b=CG4WIcwmUnIOnMxeONgtm/DkLReYd+VgyAHzS5mGSDhR9vxkq57/+vJbr+KZexJMJ4
         hDM1SMFM3FefuyFc4jNYrYGZDsSboqGPxNNZqHU6Wo4RygJNk+k0qfSLLluZjWOw2iwH
         1IMrKPw3ZnHvjIA/XYFSJAZ73x33Y+ESMwDPWXDLg4gGHBDhbKvEUZEctZqnk4hvGWiL
         vXQlaHn3/WssoZwSSx3CZQlqE4L8bvGh8JKNIVF1L9JL95ozvcnCZD4m6Z16oa+E6BSy
         4pEjKDemP8fxn13KP+rO7lC+PQaxeU+NsWm0v+BZoclGJo/5c8wJSUW1gSqn3LuiO/O7
         50IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535264; x=1775140064;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8iHWnIkjYyliHk7dayV5vHCEblVAAkKXX+ASJ1ObA0=;
        b=YRBu5KtszAN/nQRJrVfYmiZViPrhZG3pRLB+CbeyDjyzNs3PQDk8t/FkZObunJa5eD
         OvjcnMv3jzzF9ER68TPT7iTHEOdbtdxURlN/6jjLU6IwWs646HOPuRP218X/ClH4YxEz
         Y0bI9IRiNMn4gULvZQyTtth1B5+xFJdS9D6JE+STtf6krLFDv6IKtlKnBUBW51LiN0td
         +zPK2Q8RgEHJ2uJUMSjOai/VaJZTa49WXPhT7D/dFQZQsY/kLmd54T3jI0uk0Rztmq4A
         kFo6FBBtLGUYj9llORYbMWICPks5iw7IS3/Eji9ei+RYc8KjQbmkKJbbO7JCUEW2YLwq
         tS1w==
X-Forwarded-Encrypted: i=1; AJvYcCV+LVKhCjLt4wAbsW9Uph1AYV9CXfJyXT5Gufs0GQSCKqnmPmAl1Ghst3et1CAxwX2/WVhTLvDf@lists.infradead.org
X-Gm-Message-State: AOJu0YyCdqFcZhhOTmM30ZsqxujM/OGjD+vk6z4TkhvGsEiyIIAPa+OH
	RKOz57OS0TQ2geA3NWkxKMOwjHdTPf9Zh4rzoLnqs6lyWS81arTsKjyiv8VylxJzoY0=
X-Gm-Gg: ATEYQzwMlxfp/tTmtCRIon880C1V4LLG+f08z/9doreUt3n1KggJlRQI3/invH+4jNw
	jVOvLusiCtKotNkIsg7y/R68Aw66lnezlfvz8mZvY1zt8To3tbhIm8cc28iqjkbU45eVSvlao+y
	au5HFN4ihnzU/FNFZJblBwEFKYebWQShkSxFZOkL913usvEqevuoCOdxv7VwSQEXVTtUkiQdexT
	/8Zyxi4PHUKQUYSnq3pDNlskHwlVyN4ppEe6sp1j98dRzzG+7tAV1nLkJDJ5nc4f6Ce7ByZdWLk
	IVDjzJ4TSITkWvTW7bL+V4WgX4orV7BSJKMfVRAslMa43d7x+Mu5IMj4TkU6MVbONambYvPdVaM
	xu8oF6IkyhH8dZNbBNw93PSUX3S2WhuN81RIqQ3krHDEEY0eqgfVvlifDxuLsZ6C0K5amDILI2v
	jkLv46wfVml4kMBX+44i2RN15lEVI1txMZsgTvrLZn
X-Received: by 2002:a05:6870:8197:b0:409:95eb:9618 with SMTP id 586e51a60fabf-41ca6dd813dmr3869946fac.17.1774535263822;
        Thu, 26 Mar 2026 07:27:43 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc77b9242sm2113520fac.5.2026.03.26.07.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:27:43 -0700 (PDT)
Message-ID: <02e874f9-47d5-418f-b3f9-2151af588e0b@sifive.com>
Date: Thu, 26 Mar 2026 09:27:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] lib: sbi: Add RISC-V vector context save/restore
 support (eager switching)
To: dave.patel@riscstar.com
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 opensbi@lists.infradead.org
References: <20260326115517.2156-1-dave.patel@riscstar.com>
 <20260326115517.2156-2-dave.patel@riscstar.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260326115517.2156-2-dave.patel@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_072745_567578_536C6CE0 
X-CRM114-Status: GOOD (  26.75  )
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

On 2026-03-26 6:55 AM, dave.patel@riscstar.com wrote:
> From: Dave Patel <dave.patel@riscstar.com>
> 
> Add support for saving and restoring RISC-V vector extension state in OpenSBI.
> This introduces a per-hart vector context structure and helper routines to
> perform full context save and restore.
> 
> The vector context includes vl, vtype, vcsr CSRs along with storage for all
> 32 vector registers. The register state is saved and restored using byte-wise
> vector load/store instructions (vse8.v/vle8.v), making the implementation
> independent of current SEW/LMUL configuration.
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
>  include/sbi/sbi_vector.h |  35 ++++++++++
>  lib/sbi/objects.mk       |   7 ++
>  lib/sbi/sbi_vector.c     | 146 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 188 insertions(+)
>  create mode 100644 include/sbi/sbi_vector.h
>  create mode 100644 lib/sbi/sbi_vector.c
> 
> diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
> new file mode 100644
> index 00000000..ae151406
> --- /dev/null
> +++ b/include/sbi/sbi_vector.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2026 RISCstar Solutions.
> + *
> + * Authors:
> + *     Dave Patel <dave.patel@riscstar.com>
> + */
> +
> +#ifndef __SBI_VECTOR_H__
> +#define __SBI_VECTOR_H__
> +
> +#include <sbi/sbi_types.h>
> +
> +#ifdef CONFIG_SBI_MAX_VLENB
> +#define SBI_MAX_VLENB CONFIG_SBI_MAX_VLENB
> +#else
> +#define SBI_MAX_VLENB 256
> +#endif

You should include the corresponding Kconfig change in this patch, and then
CONFIG_SBI_MAX_VLENB will always be defined, so you will not need a fallback.

Also, you need to check vector_vlenb() against CONFIG_SBI_MAX_VLENB somewhere
during the init sequence, and refuse to boot if it is too large.

> +
> +struct sbi_vector_context {
> +    unsigned long vl;
> +    unsigned long vtype;
> +    unsigned long vcsr;
> +    unsigned long vstart;
> +
> +    /* size depends on VLEN */
> +    uint8_t vregs[32 * SBI_MAX_VLENB];
> +};

OpenSBI follows the Linux kernel coding style. All of the indentation in your
patches is incorrect. Please use scripts/checkpatch.pl on your patches.

> +
> +struct sbi_vector_context *sbi_current_vector_context(void);

This function no longer exists.

> +void sbi_vector_save(struct sbi_vector_context *dst);
> +void sbi_vector_restore(const struct sbi_vector_context *src);
> +
> +#endif //__SBI_VECTOR_H__
> +
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index ea816e92..9fd378d0 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -106,3 +106,10 @@ libsbi-objs-y += sbi_trap_v_ldst.o
>  libsbi-objs-y += sbi_unpriv.o
>  libsbi-objs-y += sbi_expected_trap.o
>  libsbi-objs-y += sbi_cppc.o
> +
> +RISCV_EXTS := $(patsubst rv32%,%,$(patsubst rv64%,%,$(PLATFORM_RISCV_ISA)))
> +$(info RESULT = $(findstring v,$(RISCV_EXTS)))

This check will never succeed, because it is not safe to include "v" in the
compiler's ISA string. See commit 5545602f778e ("Makefile: Don't enable
V-extension using -march option"). You need to use ".option arch" in the inline
assembly, like in lib/sbi/sbi_trap_v_ldst.c.

> +
> +ifneq ($(findstring v,$(RISCV_EXTS)),)
> +libsbi-objs-y += sbi_vector.o
> +endif
> diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
> new file mode 100644
> index 00000000..e14b658c
> --- /dev/null
> +++ b/lib/sbi/sbi_vector.c
> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2026 RISCstar Solutions.
> + *
> + * Authors:
> + *     Dave Patel <dave.patel@riscstar.com>
> + */
> +
> +#include <sbi/sbi_domain.h>
> +#include <sbi/riscv_encoding.h>
> +#include <sbi/riscv_asm.h>
> +#include <sbi/sbi_vector.h>
> +
> +static inline unsigned long vector_vlenb(void)
> +{
> +    unsigned long vlenb;
> +    asm volatile ("csrr %0, vlenb" : "=r"(vlenb));
> +    return vlenb;
> +}
> +
> +void sbi_vector_save(struct sbi_vector_context *dst)
> +{
> +    if (!dst)
> +        return;
> +
> +    uint8_t *base = dst->vregs;
> +    unsigned long vlenb;
> +
> +    /* Save CSRs */
> +    asm volatile("csrr %0, vtype"  : "=r"(dst->vtype));
> +    asm volatile("csrr %0, vl"     : "=r"(dst->vl));
> +    asm volatile("csrr %0, vcsr"   : "=r"(dst->vcsr));
> +    asm volatile("csrr %0, vstart" : "=r"(dst->vstart));
> +
> +    /*
> +     * Set a known vector configuration before accessing registers.
> +     * This ensures the hardware is in a consistent state for save.
> +     */
> +    {
> +        unsigned long tmp;
> +        asm volatile("vsetvl %0, %1, %2"
> +                     : "=r"(tmp)
> +                     : "r"(dst->vl), "r"(dst->vtype));
> +    }
> +
> +    vlenb = vector_vlenb();
> +
> +#define SAVE_VREG(i) \
> +    asm volatile("vse8.v v" #i ", (%0)" :: "r"(base + (i) * vlenb) : "memory")
> +
> +    SAVE_VREG(0);
> +    SAVE_VREG(1);
> +    SAVE_VREG(2);
> +    SAVE_VREG(3);
> +    SAVE_VREG(4);
> +    SAVE_VREG(5);
> +    SAVE_VREG(6);
> +    SAVE_VREG(7);
> +    SAVE_VREG(8);
> +    SAVE_VREG(9);
> +    SAVE_VREG(10);
> +    SAVE_VREG(11);
> +    SAVE_VREG(12);
> +    SAVE_VREG(13);
> +    SAVE_VREG(14);
> +    SAVE_VREG(15);
> +    SAVE_VREG(16);
> +    SAVE_VREG(17);
> +    SAVE_VREG(18);
> +    SAVE_VREG(19);
> +    SAVE_VREG(20);
> +    SAVE_VREG(21);
> +    SAVE_VREG(22);
> +    SAVE_VREG(23);
> +    SAVE_VREG(24);
> +    SAVE_VREG(25);
> +    SAVE_VREG(26);
> +    SAVE_VREG(27);
> +    SAVE_VREG(28);
> +    SAVE_VREG(29);
> +    SAVE_VREG(30);
> +    SAVE_VREG(31);
> +
> +#undef SAVE_VREG
> +}
> +
> +void sbi_vector_restore(const struct sbi_vector_context *src)
> +{
> +    if (!src)
> +        return;
> +
> +    const uint8_t *base = src->vregs;
> +    unsigned long vlenb = vector_vlenb();
> +
> +    /* Restore CSRs first */
> +    asm volatile("csrw vtype, %0"  :: "r"(src->vtype));
> +    asm volatile("csrw vl, %0"     :: "r"(src->vl));
> +    asm volatile("csrw vcsr, %0"   :: "r"(src->vcsr));
> +    asm volatile("csrw vstart, %0" :: "r"(src->vstart));
> +
> +    /* Re-establish vector state */
> +    {
> +        unsigned long tmp;
> +        asm volatile("vsetvl %0, %1, %2"
> +                     : "=r"(tmp)
> +                     : "r"(src->vl), "r"(src->vtype));
> +    }

This clobbers the CSRs you just restored. You have to restore the CSRs last.

Regards,
Samuel

> +
> +#define RESTORE_VREG(i) \
> +    asm volatile("vle8.v v" #i ", (%0)" :: "r"(base + (i) * vlenb) : "memory")
> +
> +    RESTORE_VREG(0);
> +    RESTORE_VREG(1);
> +    RESTORE_VREG(2);
> +    RESTORE_VREG(3);
> +    RESTORE_VREG(4);
> +    RESTORE_VREG(5);
> +    RESTORE_VREG(6);
> +    RESTORE_VREG(7);
> +    RESTORE_VREG(8);
> +    RESTORE_VREG(9);
> +    RESTORE_VREG(10);
> +    RESTORE_VREG(11);
> +    RESTORE_VREG(12);
> +    RESTORE_VREG(13);
> +    RESTORE_VREG(14);
> +    RESTORE_VREG(15);
> +    RESTORE_VREG(16);
> +    RESTORE_VREG(17);
> +    RESTORE_VREG(18);
> +    RESTORE_VREG(19);
> +    RESTORE_VREG(20);
> +    RESTORE_VREG(21);
> +    RESTORE_VREG(22);
> +    RESTORE_VREG(23);
> +    RESTORE_VREG(24);
> +    RESTORE_VREG(25);
> +    RESTORE_VREG(26);
> +    RESTORE_VREG(27);
> +    RESTORE_VREG(28);
> +    RESTORE_VREG(29);
> +    RESTORE_VREG(30);
> +    RESTORE_VREG(31);
> +
> +#undef RESTORE_VREG
> +}
> --
> 2.43.0
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
