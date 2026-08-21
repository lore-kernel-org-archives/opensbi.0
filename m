Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C510C5DF93
	for <opensbi@archiver.kernel.org>; Fri, 21 Aug 2026 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaimwbPlnlFnHJ1Bc8hp9SXq9KelvgQLJXj+Q9LFpKQ=; b=qlvHJppTGpq9mv
	qSOr9KqTriT5weeF2qUZvIK47gkhkWHL2GClDtYDBvoKMxYVFh+2fiM9gckwUDRLLPIeEJ/dTsCzB
	cFhTlmpwseZo8JKTlWHXIJlSEIMqMuK1nx+8Rz0mDTVqdJEJC1W06Cot1b6/FVELYke7DiZvwjC2E
	EPy0vqt8Leapate+b2FcaUCl9Vnb8HHaIEyFdPuxGi7JptlpciX2XS/wMpmysNDCqF0klp0AkqffK
	zH85ncNWfk9oeqhlGTrhQJ1VOhD9AbXfVaKS+k+GcYVcQ/M/utLrMUxAudXYH+rH5G8kOrH+DK9st
	7N7Ts3ULwOo5/EiD5XzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQJS-0000000DZ9F-2EOp;
	Fri, 21 Aug 2026 14:33:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQJN-0000000DZ6h-49RW
	for opensbi@lists.infradead.org;
	Fri, 21 Aug 2026 14:33:41 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D5E043F98E
	for <opensbi@lists.infradead.org>; Fri, 21 Aug 2026 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787322813;
	bh=Z4N+jcuPJy0KPwXZFUCfKSEIVbUQzb0QtjSAjzFnMsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=OO4LVIqU1iMl2sVzkn4lh1xHNJ/Ps+ETB+H9UmZvVcvPm0dNW58ArjiEL562byd2R
	 iKnnXTAx8uz+a1dw2xSnV8kmyZN71nvLyc9yTr2C0PuWM//so+b3LGa7N6WWaSNDmU
	 aOi+um+u4BPgB6xLGTAtGndqSRe9z4/TQnfEyX1wlZVQEMw0eEcB6JXoCkwrlvVmzt
	 mQm/GBCOyP2XadpwQ+LoL/Nfq+TDoThjsmXxXYDlPaxaQrknNOKjgwspoBLXD2R+Ug
	 r7hi/s2kf5wE+KNu+VkHToRB2HuHw9mCtoCRFf84G9iQyLOpjITW39WpdaG6wSW3T7
	 xnyt7gWJTZ63MH38+ZdGMXR6xDW0kr+BKkey6VyIQbn7nijyH+IjvXPvKOodYCAjc8
	 c8BflFC3vuwUHE9Q5zhTcYnSUjITMKMRThJmCv+M1TkE4skNhHTo45ocmcnmzqjDKd
	 gd1/1A8apJ5ZhYzCizrTrmZVVjxWTvtOGaWp/NdmkKbHaA7WkMYF5aOQdBYrNBp1V/
	 v1Rk0F+hjD0YMhE6NF3k4AYfjDh1B25qW9hTY9GIqxk8B9PCt2uPROZ3Cz9gkGrbiX
	 J7ht26PIwL53cK/Lv0h/PI+0cT3xD1XBFqJgUgBOEu/sgdtgaNDMN1yTVRNgkUWGE7
	 QUl8iYz0m9SxZxOBfb4r5TIk=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso79193066b.2
        for <opensbi@lists.infradead.org>; Fri, 21 Aug 2026 07:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322813; x=1787927613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4N+jcuPJy0KPwXZFUCfKSEIVbUQzb0QtjSAjzFnMsM=;
        b=LhUh+QYoN1iLUcgBfjARGRmCnWLbpMVIWgilQfRkwY+Qa58VVG5KkoFfNm/1RpOAB3
         xqZscT2Z/EyDVCyTem8PWCkHcqiDYd/Gg3vPnmA2cmXebd2FOFhBrrUBUx0juDN0nh/e
         HeTn1tksBU7Gicsp5YKzlORGKSz3YMu6Rbtl73iOsqITwyA7TZyiwbo7QiacC5+pmviY
         Rdc+s74gH4DRpTKHJC7ODW2jyM9IbiJZgtOsFqJuJ+w4M90hdxWGAlTIE4EUDPK36KaJ
         uMFq/HiN54ZzXxFRPCR76WVjtY7lhS4ygfNvaiPk85ruvrvEefkqZ/BlT0UAg+T40wZU
         J7IA==
X-Forwarded-Encrypted: i=1; AHgh+RoyXLpfd9lRDb8Gavu+5lSxG9eb81NGxhLFmqqUUXZNhQvr5LPgdDieP/D0Ujr6d7/QiXSf0w9k@lists.infradead.org
X-Gm-Message-State: AFuF++naz+UeFUcsKJAF6zRJ9bh397ZrwYJZyM087f0qEKFNjJaw8ahL
	KDwlQhUePluRQ0IJdC1cqd4NzkNha1cX6FZOzvNSjUKGuXYYEUVyPCT9O55BcsXTNxIsBtkz4J2
	igJKtduFV3AfHSL354C6tu0NCvKuNcqSX4E5pfs1xfO/Ph2Tl08776a43iSXdi7waHAvrxpSrEC
	NdWzCb
X-Gm-Gg: AR+sD11wb9WISmTadEMbh0IQ3rKTY1cga6qfFOPW/YRe8spltt7s0B+CN6wYa8QZnQV
	tFgb52r6V12cQRjgFSMaHeNfMICWe6DQr8XUK6NOwNDdXc7YO1uj/vxPpyU19DGMnQmgJzyFxly
	Ifvnvk0GZ8jb30eXaQM8lo88jOhI74wMvVqtws1LI0HyhgD+UHpc0iWO7HDh8MPQqVla85S+jcP
	9jYVV8q6GhkFCvrNUS25gD54A3rqx9MO7NA3X8pJLkvSwaNQznGeVoNLjYwNnyQlz62IHdgqipq
	ngQn5r+p1UVwa4NOmMHtC4hMRrSZ6Kgo2D227zLiyBqsJQIlIDdJ4nyr+2irW5plLQhXGbbGYmZ
	xcbbVsRxtgiz1d1OiGcfPPIK1Zo9AYshXm7ayA1fBJYxpDe5qAYJIeYHCulupUrCJIIgmL1C4bc
	72WC8PCTZy/n7DpQuSI3iCvrf/
X-Received: by 2002:a17:906:6b86:b0:c21:74ad:8b7a with SMTP id a640c23a62f3a-c246a398994mr548902566b.9.1787322813349;
        Fri, 21 Aug 2026 07:33:33 -0700 (PDT)
X-Received: by 2002:a17:906:6b86:b0:c21:74ad:8b7a with SMTP id a640c23a62f3a-c246a398994mr548895566b.9.1787322812658;
        Fri, 21 Aug 2026 07:33:32 -0700 (PDT)
Received: from ?IPV6:2a02:908:1242:30e0:82b8:e889:3ac1:330b? ([2a02:908:1242:30e0:82b8:e889:3ac1:330b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e044dsm572125066b.51.2026.08.21.07.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 07:33:32 -0700 (PDT)
Message-ID: <81df96b6-8c0e-4a02-8139-33305393c9ce@canonical.com>
Date: Fri, 21 Aug 2026 16:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] platform: generic: spacemit: add K3 platform
 support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>,
 opensbi@lists.infradead.org
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_073338_504625_BD71D09E 
X-CRM114-Status: GOOD (  29.87  )
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

On 8/18/26 03:14, Troy Mitchell wrote:
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

The SpacemiT firmware is developing fast. Please, indicate the exact 
version by commit hash and repo url for buildroot, U-Boot, esos, EDK II, 
Linux or any other repos that are needed for testing.

Best regards

Heirnich

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
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
