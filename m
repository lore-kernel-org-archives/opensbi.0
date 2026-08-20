Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A48C5DF81
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5FSllExL91V+3W0NsW7tda0Kx/eeAtL/HgVOc0zZxI=; b=qZLhuCqaLq/G2r
	12kOnSXyATwHIvcDlXgXNMWIegMkVTviznhTKZvU3P4J090WsNqmC+K7IKJeGCRQQYcGaCtuIebtK
	CjXoyxTb/ApNQk1y2475kZ+oJkf/1mzPbdc+jbDizdD1Q/dcniOG0OTGicQ2Unt0Ubk0ywJxf1CNS
	wgfhy4UVE/xKPK02f1qNjj1n+Um8pBKWA7pCTmBFgD12YgJwR4N3Y3GM4k8Q5khYZoAUCjjnwhAkF
	12XwTnkYgnveXSlX3MyS16ufBwHIoeaFznFTGnX9qYoT3eBY2B+IQgPbQWURzxOQq2Z5LwZPLg8c9
	WT3F41w74fnmkVZCwPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwz2f-0000000BH9I-0KLc;
	Thu, 20 Aug 2026 09:26:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwz2c-0000000BH8o-1qRE
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 09:26:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cf452def93so5079995ad.1
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787217990; x=1787822790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrPcSTpEyEf08VAxPKSCvgvGaEl0Dj1IiyQExMR0bNg=;
        b=sT4vfCbiUgQTImd630I6pCNw9gvUnt3ju6oKqYkG+0fP2Rn8RBVqIlgrCYPnpGnv6v
         a8fU88xmVzVr2n83l5ByRjmAENaaKBgGgm3aRMYdF7slMVTqREfWgPSY6xP4TE7zBGVD
         fkq0qAunHx4xt4inh9NbojUFUX9An+fWEjVSvAD+ykdejlURrRkQdOqJMj59n4O0wMll
         /6F0Nf1qnYO/l09JiTaJg/mrhIx1wBPM+eYAGSt7zrYnbHmKmTe1Kp/M/epe2r8Ridm1
         vYHp60m/MD8g3juQ0kFYzshkNnTfBDjGnuRr+egLb+UMlDTkymGr9ihHdtRndfuUWkX8
         OD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217990; x=1787822790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrPcSTpEyEf08VAxPKSCvgvGaEl0Dj1IiyQExMR0bNg=;
        b=QXh2rplzkMOjS2JpbZ25hWqm20GDJRD70i+Q8c3oAz1AfTTcaVUlZ5L9hH6kTGAcI6
         bjX37TFbd4mO/PiV1w9dDeLZtnnCGwHqfnyilWOZT39J1SklfqyhC8KX14IrDPOgGW55
         YlTbkjQDQjv7BM5qfYUpUJCmhGUAAKwretmyLgqQc/A/tCFjj6IfDgr2Rypo4TgIS4kC
         0YO7/1LGZw4RNpEQqtvk8qUKfr6RDeVEzaLnu1TGb+cnSb7s/iAVIbJIwBMwvx2szkqh
         nOdq7mh83ST6CX4TX2N613R+sZc7vM6p81pdzXoOvDGVlPjNyf5pOR1zVACHiN4S1T0x
         Pd9A==
X-Forwarded-Encrypted: i=1; AHgh+Rqtj2RMWx6/9JZUp3bG7mJcL1BB9KrX8LzoPvDIJedQRqZweWvjOxlaRYJvstFpTy9YZrGPobGX@lists.infradead.org
X-Gm-Message-State: AFuF++lVOcUVbdrjj0J2uAYyPydkuM1bQdIyn8C7SAcsuKjf/OdKOIOO
	1gsmP9xYv/iDsLxyVJnue4ezP7UutYbrq7ZFnejYZKvUdTiizzS/0eS4
X-Gm-Gg: AR+sD10XY72Pm/9ANPjQxJoAWN6EICqC0P+hm2d8OdWoUIURkpSLWvkzYnmVnIFDn9p
	oK9AhMlU0WCNcO+NXdhXkmnw8m6kjD9TJz31asMt9fhluO9vYe4ffB32zLbmb+o2A631x4BzVVR
	ZdDtHHWhtJaY+NZh9qG590g3RqGJAr5SjEeNVnxqy6i2UXY4ojG5xNbClH1i8tCwQZC6hiFJZUf
	fgJ4vf8MajnueuenvfvVLWwnjaqgr4UVeH8MXK2YrSfU5tWYvoPTOMlsMc7UHmlbgB/2pnv3Ksh
	R7A8TJrP2PPfiLWWD3EPagyC2eys6/A/4Ip9y7YFkBJqaq1KGnv3Ht2xD1dyvexgeqJtz/kCKtP
	O3fTZPoVnLGgiDcsdbp1JnIWzB83UqP4AdU502dRVLl3Br0M0dN5lXY+XbMunV8rxeQba00dWcM
	YQZSuohHH6fasMA9TDoHddpuZvutH2M1ScoHn8Qk/MG04jKe1OPSN94I6+tO0B1Q==
X-Received: by 2002:a17:90b:2584:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-395a074aab8mr5519668a91.10.1787217989475;
        Thu, 20 Aug 2026 02:26:29 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9ad013sm5875009a91.7.2026.08.20.02.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:26:29 -0700 (PDT)
Message-ID: <df177995-1c44-420d-8138-2bbc7a4861bd@gmail.com>
Date: Thu, 20 Aug 2026 02:26:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] platform: generic: spacemit: add K3 platform
 support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_022630_498644_95E527C6 
X-CRM114-Status: GOOD (  32.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi Troy, Xianbin,

I got my com260 delivered just days ago, and I'm able to review and test
this series. I just sent out some review feedbacks. One more high-level
question is regarding rpmi. I see the vendor opensbi utilize the services
provided by esos running on the small cores. What's the plan here? Is it
(this patch series) suppose to work with the esos currently shipped?

Also you mentioned "K3 SDK" many times, but I couldn't find any pointers.
What is that exactly?

Bo

On 8/17/26 18:14, Troy Mitchell wrote:
> Add initial OpenSBI platform support for the SpacemiT K3 SoC. K3 has
> 16 harts split across four clusters: eight X100 harts in C0/C1 and
> eight A100 harts in C2/C3.
> 
> The main upstream integration constraint is that K3 is heterogeneous at
> the ISA level. The CPU device tree used for testing exposes the same
> non-H standard extensions for X100 and A100. X100 additionally exposes H
> and the related Sha, Shcounterenw, Shgatpa, Shtvala, Shvsatpa,
> Shvstvala, and Shvstvecd extensions. X100 has a 256-bit VLEN, while
> A100 has a 1024-bit VLEN. A100 also implements the vendor-specific
> SpacemiT IME and FP8 AI extensions, which OpenSBI does not inspect or
> use.
> 
> At the base of this series, OpenSBI selects the expected-trap handler
> once from the cold-boot hart and reuses it globally. An X100 cold-boot
> hart would therefore make an A100 hart use the H-aware handler, which
> accesses mtval2 and mtinst even though A100 does not implement H. Select
> the handler from the current hart instead. An audit of the remaining
> extension-dependent paths found that ISA extensions and detected CSR
> features are stored per-hart, the generic FDT parser visits every hart,
> and vector code reads the current hart's VLENB. The K3 CPU device tree
> also exposes the same counter and timer extensions on both core types.
> No other cold-boot-hart-derived ISA selection was found.
> 
> K1 and K3 share vendor cache-control CSRs, PMU idle fields, cluster
> sizing, and the CCI-550 programming sequence, but their CCI topology,
> boot flow, and HSM support differ. Factor only the common definitions and
> CCI helper so K3 does not depend on K1 and the K1 encoded values and
> behavior remain unchanged. Run per-hart register setup from
> nascent_init() rather than the policy-only cold_boot_allowed() hook.
> 
> On K3, the cold-boot hart programs the four cluster warm-boot vectors,
> enables CCI snoop and DVM requests, prevents WFI from powering down cores
> or clusters, and wakes the secondary harts. A bounded wait prevents a
> non-responsive secondary hart from stalling boot indefinitely. Each hart
> programs its own PMA, cache, snooping, and prefetch state, with X100 harts
> also enabling H. The warm-boot entry establishes cache coherency before
> entering common code so secondary harts can observe state published by
> the cold-boot hart.
> 
> Runtime validation used the SpacemiT K3 SDK. The UART at 115200 baud
> showed OpenSBI and U-Boot starting successfully, followed by Linux
> bringing all 16 harts online. The series has also been build-tested with:
> 
>    - the generic default configuration
>    - a K1 configuration with K3 disabled and the SpacemiT HSM driver
>    - a K3 configuration with K1 and the SpacemiT HSM driver disabled
> 
> To reproduce the runtime test, build this OpenSBI tree at the address
> where the SDK loads it, then copy the resulting firmware into the SDK
> output directory:
> 
>    K3_SDK_DIR=/path/to/k3-sdk
>    make O=build-k3 CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic \
>         FW_TEXT_START=0x100000000
>    cp build-k3/platform/generic/firmware/fw_dynamic.bin \
>       "$K3_SDK_DIR/output/fw_dynamic.bin"
> 
> Before rebuilding U-Boot, update the UART0 node in the K3 board DT
> selected by SPL and passed to OpenSBI. The SDK describes it only as
> "ns16550", so upstream OpenSBI initializes it without UART_CAP_UUE and
> writes 0x00 to UART_IER. The K3 UART requires UART_IER_UUE (bit 6).
> Change the node in uboot-2022.10/arch/riscv/dts/k3.dtsi to:
> 
>    uart0: uart@d4017000 {
>            ...
>            compatible = "spacemit,k1-uart", "intel,xscale-uart",
>                         "ns16550";
>            ...
>    };
> 
> The compatible order is significant. Upstream OpenSBI skips the vendor
> string, then matches "intel,xscale-uart", which selects UART_CAP_UUE and
> writes 0x40 to UART_IER. The final "ns16550" remains a generic fallback.
> This is the DT used for the successful boot test.
> 
> With output/fw_dynamic.bin already present, rebuild U-Boot. The SDK
> preserves that OpenSBI binary and packages it with U-Boot:
> 
>    make -C "$K3_SDK_DIR" uboot
> 
> This produces output/FSBL.bin and output/u-boot-opensbi.itb. Using the
> SDK-built output/Image.itb, enter BROM fastboot mode with FEL+RESET and
> stage all three images into RAM:
> 
>    fastboot stage "$K3_SDK_DIR/output/FSBL.bin"
>    fastboot continue
>    sleep 8
>    fastboot stage "$K3_SDK_DIR/output/u-boot-opensbi.itb"
>    fastboot continue
>    sleep 3
>    fastboot stage "$K3_SDK_DIR/output/Image.itb"
>    fastboot continue
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v2:
>    - correct the K3 PMACFG0 CSR number from 0xbc0 to 0x7de
>    - select the expected-trap handler per hart for heterogeneous H support
>    - move K1 and K3 per-hart setup out of cold_boot_allowed()
>    - split the generic and K1 fixes into standalone patches, growing the
>      series from three patches to five
>    - document X100/A100 ISA and VLEN differences and the homogeneous-core
>      audit
>    - document OpenSBI/U-Boot packaging, the UART compatible adjustment,
>      and the USB fastboot test procedure
>    - Link to v1: https://lore.kernel.org/r/20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com
> 
> ---
> Troy Mitchell (2):
>        lib: sbi: select expected trap handler per hart
>        platform: generic: spacemit: k1: move hart init to nascent hook
> 
> Xianbin Zhu (3):
>        platform: generic: spacemit: k1: rename cache flush operation
>        platform: generic: spacemit: k1: refactor platform support
>        platform: generic: spacemit: k3: add platform support
> 
>   include/sbi/sbi_csr_detect.h                 |   4 +-
>   include/sbi/sbi_hart.h                       |   2 +-
>   lib/sbi/sbi_hart.c                           |   9 +-
>   lib/sbi/sbi_illegal_atomic.c                 |   4 +-
>   lib/sbi/sbi_unpriv.c                         |   6 +-
>   lib/utils/hsm/fdt_hsm_spacemit.c             |   7 +-
>   platform/generic/Kconfig                     |   9 +
>   platform/generic/configs/defconfig           |   1 +
>   platform/generic/include/spacemit/common.h   |  88 +++++++++
>   platform/generic/include/spacemit/k1.h       |  96 ++--------
>   platform/generic/include/spacemit/k3.h       | 144 +++++++++++++++
>   platform/generic/include/spacemit/k3_asm.h   |  16 ++
>   platform/generic/include/spacemit/spacemit.h |  14 ++
>   platform/generic/spacemit/k1.c               |  45 ++---
>   platform/generic/spacemit/k3.c               | 266 +++++++++++++++++++++++++++
>   platform/generic/spacemit/k3_asm.S           |  33 ++++
>   platform/generic/spacemit/objects.mk         |   3 +
>   platform/generic/spacemit/spacemit.c         |  36 ++++
>   18 files changed, 661 insertions(+), 122 deletions(-)
> ---
> base-commit: c0f87f10d1bfb9e72a84ddfafb5604ee1bfe9d04
> change-id: 20260723-spacemit-k3-84720a7be53d
> 
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
