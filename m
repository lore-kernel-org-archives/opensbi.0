Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE24D58CD0
	for <opensbi@archiver.kernel.org>; Mon, 23 Mar 2026 04:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jx1RaV8W+Wk90J/cNhtRhz4BNeX6p79NVJabX5nTtwA=; b=1l1Fo5apIifz7K
	6n9+cbThkhK19mZRoA/U+Aa0pqbi4BWJdsC+7yCaDug4a/BWpuhdfel439MSDV0uxr4nm7CYlLqxZ
	SHvUGIHBmjBYg/p7VXi8+RleK2YtvFuUXRtu286DP0c2LyAsS+BWfePV4857e9U1HbWYMHrEdKBrN
	q2UbcAfhd+gW4zkgzFu3XXkQqiKabn77LLQjnYSUmjg25mu5/AimC3xFm4/K01cSso4+EKsjRIgc+
	XJCaiIHYUW1UJbN6/wLpm0TuWeubbo2irSVh9p7lc5POEe69+ckCLfX8xg4M2c4bj3QOtSF7aGR+T
	YzXdKGYs0eFO5IIDdPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X2V-0000000G1Zn-21uV;
	Mon, 23 Mar 2026 04:37:19 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4X2S-0000000G1ZR-2Uoe
	for opensbi@lists.infradead.org;
	Mon, 23 Mar 2026 04:37:17 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64eb8ceda8fso1492210d50.1
        for <opensbi@lists.infradead.org>; Sun, 22 Mar 2026 21:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774240635; x=1774845435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUJXclC9avZEAoKLQvF9zyE3lVMrHaKhBoWlqS/oTVI=;
        b=MhKUvpkfE6P0R49CEiLge4JDcuKBFxJdqW1eZj4YA3YqiJ9w+8Su8LDyiY5bPuBh/y
         g0POPKEZO91Hs1H3DjBmRuWlg4PP3Fgh2xuNMniyBQfNbeH/Tx/QheQV2Ek7yrwLHkls
         fNp4EjpGNIF86ke8NEaUeiNHdLuwrHBslcTTC92fKMaLDDJaB30bWUtMQ5zYyF+e0cTs
         vhQ/5Jr1UnJ85LRxMOsBW73uoJO/ADTHVjGjotjdcsEg9nGDuejsRjIkrX5nxbDZfjxb
         KxzUKIoXuXSHMnv0CtXwva4yt1zUULwr0f2QBp2J5uhB6rGCCtNE7GrS0larGxNa+tV7
         Ok/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240635; x=1774845435;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUJXclC9avZEAoKLQvF9zyE3lVMrHaKhBoWlqS/oTVI=;
        b=MT+A/vDjRNgm0zEMUtCL9IavZP8+UZbkj7jX5NmTSyUox/tlZPkDbt+eDJuX3v7I0o
         uIMo4QGT0Hw4FVAV1SaQu5fSLSjs2P/kJoKnhqCEuMr4oaD3Sfw3tausfBpIrfLGwdcc
         N7T91lOWuToFN1qIpppjM4kFsVM6MtckCoGTbkbceTqV8MDwrIx84aV2FzGtEQ4fMc7n
         KhUYf533Z9Lq1s8C7zKe+fqHKd4crtQXD4D6q/cHR0SjlDPDrPcKEE9dDJYwAILzWluN
         DUBY+8iaQll9yDKFbC/u+fru2xLI2scolrhNygd4VCl9fbs74hSa4Ypqtz1f6CRiZWc5
         JDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7/JKWnh5TuT4SZ9HVjIDy9wwEHrGaeuihh2rEY2YEwovrSIRN5sONdVcs89b9uhEEdBPQRWyo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2lAw6yP6n4Eak4H6P+/lEfDZjJwhM1hy4YkxvQI/KkCiBgYNd
	glXsSWBhOl+u6i8mug0u3SwAST4ykGJvMVdKVo+SR9PIxzq5GXLIJ4wdR6E7KkMKvKXLTqXnyDx
	IboQ6
X-Gm-Gg: ATEYQzwaGbg6u8DGXNpaQW8R7D4ywkPkeeRgqWYU29iBCU0HZt5ONLGQbuvDKzfalyo
	i2xWX7piwE9ko29b+Ls4TXAfNz0sv/4YL7FLDPTVX6E/OCy/i2TmjJAsmOiAH++Hb7YHDYrNMKI
	4xLyEM48KJKC0FTgbtow711abw7IvQ2+gX173uQ3J1boUnLbqjBSp+ZAdy3eoMeMbEazqcspCC1
	b4Z57Vc/zqYgkAaU+bPIxvNSRxjvMQP6XxnWX19te9ao34GzLiq9AEi3ACnpsmOk3PDzlsaQg1c
	UNlfAcdeXUoGBnlbrXCGFPNl/tb4w9t2GmrEw4bhnNUqMKjIpMWqG1aXl0UObD7GukutVs69Ehv
	noRqGxbZgLpxlRfgVenKvst/yF8vLoVEiYdp+dT2X1XI0OWkCxdDkTcj8cVY/9IUy5q0vB4Ba7I
	Rcs5CUiNjHmPAnpxCVYutdXRRoD8rpQ9Yy7vDG7RRxMIS5iYHOYn9c
X-Received: by 2002:a05:690c:a041:b0:79a:660d:19e5 with SMTP id 00721157ae682-79a90bd0f8bmr88991167b3.29.1774240635142;
        Sun, 22 Mar 2026 21:37:15 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.102.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903f4190sm52022127b3.15.2026.03.22.21.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:37:14 -0700 (PDT)
Message-ID: <cfbfa618-d875-43e9-bbff-2aa8d75a519b@sifive.com>
Date: Sun, 22 Mar 2026 23:37:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] lib: sbi: Add RISC-V vector context save/restore
 support (eager switching)
To: dave.patel@riscstar.com, opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
References: <20260320143018.74191-1-dave.patel@riscstar.com>
 <20260320143018.74191-2-dave.patel@riscstar.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260320143018.74191-2-dave.patel@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_213716_673655_F523BBB6 
X-CRM114-Status: GOOD (  26.12  )
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

On 2026-03-20 9:30 AM, dave.patel@riscstar.com wrote:
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
> A per-hart pointer is used to track the current vector context owner.

Storing only one context per hart means that you must save/restore the context
every time the hart traps to M-mode. This is unnecessary and inefficient,
because OpenSBI itself does not use the vector registers (except where it
explicitly modifies the lower-privilege vector state when emulating
instructions). It is only necessary to save/restore the context when switching
between domains, not when trapping to M-mode and returning to the same domain.
So a better place for the context is in `struct hart_context` in
lib/sbi/sbi_domain_context.c.

> Notes:
> - The maximum supported VLEN is capped via SBI_MAX_VLENB.
> - The implementation assumes the vector unit is enabled when invoked.

This is not something you can assume. The code must not crash when running on
hardware without vector ISA support (Zve32x).

> - vstart CSR is not currently saved/restored and is expected to be zero
> across context switch boundaries.

This is not something you can assume. A trap can happen anywhere (e.g. due to an
interrupt), so vstart may be nonzero and must not leak across domains.

> 
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>
> ---
>  include/sbi/sbi_vector.h |  30 +++++++++
>  lib/sbi/objects.mk       |   1 +
>  lib/sbi/sbi_vector.c     | 136 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 167 insertions(+)
>  create mode 100644 include/sbi/sbi_vector.h
>  create mode 100644 lib/sbi/sbi_vector.c
> 
> diff --git a/include/sbi/sbi_vector.h b/include/sbi/sbi_vector.h
> new file mode 100644
> index 00000000..6be477c0
> --- /dev/null
> +++ b/include/sbi/sbi_vector.h
> @@ -0,0 +1,30 @@
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
> +#define SBI_MAX_VLENB 256
> +
> +struct sbi_vector_context {
> +    unsigned long vl;
> +    unsigned long vtype;
> +    unsigned long vcsr;
> +
> +    /* size depends on VLEN */
> +    uint8_t vregs[32 * SBI_MAX_VLENB];
> +};
> +
> +struct sbi_vector_context *sbi_current_vector_context(void);
> +void sbi_vector_save(struct sbi_vector_context *dst);
> +void sbi_vector_restore(const struct sbi_vector_context *src);
> +
> +#endif //__SBI_VECTOR_H__
> +
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index ea816e92..5c0caf39 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -106,3 +106,4 @@ libsbi-objs-y += sbi_trap_v_ldst.o
>  libsbi-objs-y += sbi_unpriv.o
>  libsbi-objs-y += sbi_expected_trap.o
>  libsbi-objs-y += sbi_cppc.o
> +libsbi-objs-y += sbi_vector.o
> diff --git a/lib/sbi/sbi_vector.c b/lib/sbi/sbi_vector.c
> new file mode 100644
> index 00000000..37239ce2
> --- /dev/null
> +++ b/lib/sbi/sbi_vector.c
> @@ -0,0 +1,136 @@
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
> +/* Per-hart vector owner */
> +static inline struct sbi_vector_context **vec_owner_ptr(void)
> +{
> +    struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +    return &scratch->vec_ctx;

The code must compile and run after every patch in the series, but the vec_ctx
member isn't added until patch 3, so this doesn't compile. However, as mentioned
above, the context should be stored per-domain anyway.

Regards,
Samuel

> +}
> +
> +/* Get current vector context */
> +struct sbi_vector_context *sbi_current_vector_context(void)
> +{
> +    return *vec_owner_ptr();
> +}
> +
> +static inline unsigned long vector_vlenb(void)
> +{
> +    unsigned long vlenb;
> +    asm volatile ("csrr %0, vlenb" : "=r"(vlenb));
> +    return vlenb;
> +}
> +
> +
> +void sbi_vector_save(struct sbi_vector_context *dst)
> +{
> +    if (!dst)
> +        return;
> +
> +    uint8_t *base = dst->vregs;
> +    unsigned long vlenb = vector_vlenb();
> +
> +    asm volatile("csrr %0, vtype" : "=r"(dst->vtype));
> +    asm volatile("csrr %0, vl" : "=r"(dst->vl));
> +    asm volatile("csrr %0, vcsr" : "=r"(dst->vcsr));
> +
> +#define SAVE_VREG(num) \
> +    asm volatile("vse8.v v" #num ", (%0)" :: "r"(base + num * vlenb) : "memory")
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
> +    asm volatile("csrw vtype, %0" :: "r"(src->vtype));
> +    asm volatile("csrw vl, %0" :: "r"(src->vl));
> +    asm volatile("csrw vcsr, %0" :: "r"(src->vcsr));
> +
> +#define RESTORE_VREG(num) \
> +    asm volatile("vle8.v v" #num ", (%0)" :: "r"(base + num * vlenb) : "memory")
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
> +


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
