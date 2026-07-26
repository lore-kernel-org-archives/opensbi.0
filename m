Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B353CC531D0
	for <opensbi@archiver.kernel.org>; Sun, 26 Jul 2026 01:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//bzToMu2alvYhP9Di9JbDXdNRzAtycr+yGgMhHQKLk=; b=UhFJitDvzezGPq
	o/jJOv3OCuI8fnZC2wA1z4iMrH1Lca1lf7rpMyXLoeMvbUL3TbG0TX+ZOplXJEzQQSD0EMf9JJJ5g
	s7miEU/xq/gTNoUsTkzW7n7ClgHE1lxBOXYeuIBdzVICVew0q8IDKa4toAgCBiVAldn+pusDL91rY
	gEOVtDl4DmPC7SO+r86cOaKSWAIchlM0NWk+1xrDO+pDkfM56YzjCNTvioAng1fK+fgfV3y9yr0Q2
	oYK8Z/TaCyJU6gfXBT7zeAX4qCnBIA8MAcVzoou0XiQ6u2VQlVpNuljxIF6KX8mxxV7jFaBZItPAt
	B2LhsU9ubYgpcknJzkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnnUZ-00000000oFq-1Pho;
	Sun, 26 Jul 2026 01:17:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnnUV-00000000oFM-3I6n
	for opensbi@lists.infradead.org;
	Sun, 26 Jul 2026 01:17:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2262652a91.1
        for <opensbi@lists.infradead.org>; Sat, 25 Jul 2026 18:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785028638; x=1785633438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OguePrNOaS0SRqRpaMw6XgQOJEfrIWXOmM1WAtCWgzg=;
        b=fuhc2Og0Kwm0j4R3Yk7bBCrVYnwO6T9kLK/wv+PPI20gY/M+AqG9+NIaEq27J50Knl
         ZSJ3sQrvoMCDn5mpgrBCbD34mRR7+s17UgrNTPaDEKBy+jWiB4JigEOgZG9Into6rrr1
         s0PsBMJUFM7XuZGqKNFFARPe8oV4H68+cb36zwDHwn7XFbm2DoRIBJ2THUwNrpKzk4a9
         HmA7cw0MEWB8IyuGmI5n2VAvzbGgXK+MtJKToUd5mIfx7rTCnckuyZyO/yHyK2B2Aj7w
         Pktyea1xHuazxdwzc9tfziWbwgxj6kyODD9dtyawsI+C9tEuZWOgtIm6U+Qbx2kij4Mp
         vYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785028638; x=1785633438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OguePrNOaS0SRqRpaMw6XgQOJEfrIWXOmM1WAtCWgzg=;
        b=E+Wm65O0opkb7Br3hWBIS9I/Q95Kgisq8LASqiIszUvQ1BNI+YVsaA6z3qq84rlo4I
         x9+JNN+D54pHOd2HVynZseVDnSZ8pZGAntV021KnnllYvEh811KZjVT8l83JOfEbLNXl
         h0hw6lLRX7G1WcDI1Y1nTOuq9xf5Q/cXcjz+Z4GWBETu/TknTsh78OHgdbGNy5IFmm2Y
         F0Wfsgun43s5/dvneRv5Itq0PUHIEbLmogyo28zlrLbY1ODsKxpL6y+pUE0g8GF3T16q
         TCb1ejLNaySdz4rwo05kP9ABxKP5XU/yR2EO01SDDhTpXSU4GGj7H3DRuMDQz0WVb7t3
         jtKA==
X-Forwarded-Encrypted: i=1; AHgh+RrzHoz1P5wVkUvWt523O4PucuurnwIVPRR6ztUvDp9QKleL2cLqtn57I3MFFR/FGh5e7p28KPxl@lists.infradead.org
X-Gm-Message-State: AOJu0YxQRmySemGQsDWwMTlmdgV594gjoRNRSFpyT3KIKKavQ4dM+iKF
	xQoEgqDSw0VWhChjAYoaNAvFTDPqzi8nwdWOkh/G85EKkjEMS2PLsIALs1bleg==
X-Gm-Gg: AR+sD13vcp50YhfuqgV9ZFBvZ1euLXZ8SD0dSr+TNsOud50deQ2T035sJMJUqoT0peT
	ZbwzHjMnUxLRNv7vLr5jtLobT+D/ap2C2oXb+utecqzdsMeqihWWZ6ZKFBFWUbwaKZN/60N2yoZ
	JdhSZao9aAzDe1p3Pva4+nbj0gbr+iuHbwJPfVI3DHRTd9QFzJu6eE30PalUkxKSKR49GPMB933
	XjFgEKNF+N50ReVPnb8Rk4Cu6kp6A4HIwWHe4zZ+fF6sbbClEOStyZsuxMjlXVDheZ3dr6mV6Kr
	/hsTu0v66eGmq556Sgxw13AxPDG278HFKt1C1wOibnb72CAam6+siti9q4p3y2yroNomzGyNfkC
	/8Q9Jsyhdswd1DNVkQYHc+vl1xulxv+i6+CXx1NDpN9k9qyfSnCxUNu+68RpEQKNWmjDdGgj2PU
	+LjLM=
X-Received: by 2002:a17:90b:5706:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38f295232dcmr3787204a91.18.1785028638161;
        Sat, 25 Jul 2026 18:17:18 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292d2136sm1245166a91.6.2026.07.25.18.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 18:17:17 -0700 (PDT)
Message-ID: <e702f291-dde8-4b99-a65e-182d2b847720@gmail.com>
Date: Sat, 25 Jul 2026 18:14:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform: generic: spacemit: add K3 platform support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>
References: <20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_181719_859572_E576FFDF 
X-CRM114-Status: GOOD (  18.82  )
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

On 7/24/26 02:27, Troy Mitchell wrote:
> Add initial OpenSBI platform support for the SpacemiT K3 SoC. K3 has
> 16 harts split across four clusters: eight X100 harts in C0/C1 and
> eight A100 harts in C2/C3.
> 

One thing to watch out for is the lack of 'H' in A100. This can cause
issues where the code assumed all cores to have the same extensions:
https://github.com/riscv-software-src/opensbi/blob/c0f87f10d1bfb9e72a84ddfafb5604ee1bfe9d04/lib/sbi/sbi_hart.c#L704

	if (cold_boot) {
		if (misa_extension('H'))
			sbi_hart_expected_trap = &__sbi_expected_trap_hext;
	...

At least this `sbi_hart_expected_trap` needs to be enhanced to account for
heterogeneous cores. Perhaps wrap it as a function, such as
ulong sbi_hart_expected_trap_addr(void), and fix up all users:

- register ulong mtvec = (ulong)sbi_hart_expected_trap;
+ register ulong mtvec = sbi_hart_expected_trap_addr();

Please also check other places where it's assuming homogeneous cores. Can
you also describe in detail the different extensions between X100/A100?
Apart from H/no-H, and different vlen's, anything else?


> The first patch corrects a misleading K1 cache-operation name without
> changing its encoded value or behavior.
> 
> The second patch refactors the existing K1 support by moving the
> definitions and CCI-550 programming helper needed by both SoCs into
> common SpacemiT files. The K1 CCI topology, boot flow, and HSM
> implementation remain K1-specific.
> 
> The third patch adds the K3 platform implementation. During cold boot,
> the boot hart configures the cluster warm-boot vectors, enables CCI
> snoop and DVM requests, disables core and cluster power-down on WFI,
> and wakes the secondary harts. Per-hart initialization configures PMA
> attributes, caches, L1 D-cache snooping, prefetch, and the H extension
> on X100 harts.
> 
> The series has been build-tested with:
>   - the generic default configuration
>   - a K1-only configuration with the SpacemiT HSM driver
>   - a K3-only configuration without the K1 HSM driver
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Xianbin Zhu (3):
>        platform: generic: spacemit: k1: rename cache flush operation
>        platform: generic: spacemit: k1: refactor platform support
>        platform: generic: spacemit: k3: add platform support
> 
>   lib/utils/hsm/fdt_hsm_spacemit.c             |   7 +-
>   platform/generic/Kconfig                     |   9 +
>   platform/generic/configs/defconfig           |   1 +
>   platform/generic/include/spacemit/common.h   |  88 +++++++++
>   platform/generic/include/spacemit/k1.h       |  96 ++--------
>   platform/generic/include/spacemit/k3.h       | 144 +++++++++++++++
>   platform/generic/include/spacemit/k3_asm.h   |  16 ++
>   platform/generic/include/spacemit/spacemit.h |  14 ++
>   platform/generic/spacemit/k1.c               |  33 +---
>   platform/generic/spacemit/k3.c               | 264 +++++++++++++++++++++++++++
>   platform/generic/spacemit/k3_asm.S           |  33 ++++
>   platform/generic/spacemit/objects.mk         |   3 +
>   platform/generic/spacemit/spacemit.c         |  36 ++++
>   13 files changed, 636 insertions(+), 108 deletions(-)
> ---
> base-commit: c0f87f10d1bfb9e72a84ddfafb5604ee1bfe9d04
> change-id: 20260723-spacemit-k3-84720a7be53d
> 
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> 

Bo


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
