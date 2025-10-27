Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F08CCF9EA
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/4e4XqaRGjvQ0SDpFYFN6WQweOkhRJp5KeugNafj2w=; b=2XBifHMK4rRu1Ujc8MyqcwTUhr
	6Hq8gmAgiBqbn4c5YOKwnr61RI2qLmp2OtagVg/5xoB8KIVKN8f+mD8FNNaUOjGiSibh3CJInnuUp
	nEstI0Uk/ovt6vnskV9EQvYFVcG0N+EDn1xPP6IahGrWda1pAHqa0MOBcexYaB0gHPEZB1NpevKUG
	pPbhlFLLfRneoNO5g4LGR3gJBhtPqTKY/YHTRAl4d33hhI9IJlbIz9JCueXpVayHwWnkY5RuSVIeE
	2OQuYADSdzflZcXPL9f+GBoHWs64dgvm9BLVpn94nLM0r6X56z1nw/Rz3DB5TBIcaTB62Nwvc4DHZ
	YGKJ20UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW4Z-0000000Etp3-0EnP;
	Mon, 27 Oct 2025 22:52:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW4X-0000000Etog-0Ikr
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 22:52:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2897522a1dfso47192975ad.1
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 15:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761605536; x=1762210336; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+YU5gVH+cS+zu+cD/Z1ebX8vpI77cwPhPOFm+iGzBI=;
        b=KNMuE2uAaZJtHOPvg82WjC2AXVqBHkpcXmsDfYWyLfMe48MCCVtKTY3fZffsz600pl
         z+GYrTLQLABp31+QVJOsZFVZzVaKZOlpDgfAK5u1mB0KbZDUAohGBn5A1gQO/ayFlrUY
         m5fiGg9uCluLkrZ3W2qigb/taHaCeZRVfneBUdWnPjBhob9smKC9Z1DJl/HcFaRVMARY
         dm+XjoKj5xJlGeopDPWunH9UYFEQ2+9dUomqYdlQIyXUc9d0kKca18zYLgSoZ6QWy1K0
         wBSH7kAvdpeCHlBm0EzcoqZvCtish897mokUhxWNG2cPthFBhqCLJzFU6CVJOqJIuL5N
         8JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605536; x=1762210336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+YU5gVH+cS+zu+cD/Z1ebX8vpI77cwPhPOFm+iGzBI=;
        b=eTjFlBFz3pILzd7QwLAlrtyPbJTzFTKvFvLMtAj+R+TAAF17XPZKrR0XyfJ0VDF9tg
         tNIkIUdNalQGXPuWQGqED5Wa97FVFpeyRwZqEF5MZk+z+uZ886WNMvd0gNN2HGTaLOzB
         7su6qAZhGPsBXx4vpfdeNrK7ZfkAFavOMrZI1hva3qJUJa5YCCEtdh6C2St23sM9BAqe
         dSho9lr/E3NVxSTIizIRpXen4CHuzjCdvb72hmjNk/MUCM4CkXB2T6kCGxfxyEvZlhCC
         5F6o4sUXxOPlNN3RZaC7EBAVwi12/12IPkyYI8yj8R4TjQZC39jimsA5/qasw0brk5tt
         2FIg==
X-Forwarded-Encrypted: i=1; AJvYcCU0LXIh9OzcZcP2t/VtGIaxxYtIqvGziZPHRTE7/Cazu63o7/si5HH0/RTjOL65r0jHT787aj4K@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy6KV7siLDxtyo/AtF3O+X5HHkA2L6hep0VRC6r9YemwyLr+w7
	FogDMJ0iImyBf/Gi8C3BCwN2SDUZ0EMFvMgEtMRYT+ze3tPZejnVTqLE
X-Gm-Gg: ASbGncv2wVgexj8/31OcUiyJCUit5Gvk0TuE+34n0OVICDy2/iEjZ6P/GjHtgqSthQx
	IgKxC1tp6VB4d1ojovRZYj8JylE4eucsJVWwEWC17GjQjL9iGlmBpV/dkq8acp2FezcbKA0vBBV
	xPDR0Cy8JU5IX7Z9M8i745hbrPBCxuf2Y+wYFcoSRQpxlDQiI727EnTvOAtCvFXhPplrzzCnbLA
	qpqjGrl6GoP+rRo5e9gJZMEQGaNBv6R1L+1LMunJs3hOjMKifSSf64PKepKcZz38GTydMW2FelQ
	HPq3xbG//SwZPZt7IR3NFMoRaxvzafDwYnf8LyGUr81T0SuTULhUVXAibMIkO4o/mJCs0RyuS42
	kiCedu74j2DkwTUKYOD+aTsBcCEyPVQEWZJrt06vC4NiOkzALlTm1ezK65lGsxPrUD/tgSo3BK5
	zOFUMmMi0W/vusS0cDR9Hc1WZ5Y7XWEiG1p+o=
X-Google-Smtp-Source: AGHT+IH2TR3Nc2sGk/QzL5r4SX1unIwHL3w1nmH1JnxTq9Md55j0tql8b4CgDVKTlL06Wj6H2BPTLw==
X-Received: by 2002:a17:902:db10:b0:250:999f:31c6 with SMTP id d9443c01a7336-294cb50e4demr16141515ad.32.1761605535848;
        Mon, 27 Oct 2025 15:52:15 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42de5sm95236755ad.76.2025.10.27.15.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 15:52:15 -0700 (PDT)
Message-ID: <8dfeeb99-49da-4061-9085-bfec9050c0eb@gmail.com>
Date: Mon, 27 Oct 2025 15:56:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add trap-based ISA extension emulation
To: Benedikt Freisen <b.freisen@gmx.net>, opensbi@lists.infradead.org
References: <20251026202416.23550-1-b.freisen@gmx.net>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251026202416.23550-1-b.freisen@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_155217_122514_9566AD46 
X-CRM114-Status: GOOD (  21.42  )
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

Hi Benedikt,

On 10/26/25 13:21, Benedikt Freisen wrote:
> This patch series seeks to add trap-based emulation functionality for various ISA extensions relevant to RVA22, RVB23 and RVA23.
> The emulation functionality contained herein has been demonstrated to e.g. allow the VisionFive 2's JH7110 to run software using the RVA22U64 and RVB23U64 profiles, allow the Orange Pi RV2's Ky X1 (a SpacemiT K1 derivative) to run Ubuntu 25.10 (RVA23U64) in a docker container, and allow the Tenstorrent Blackhole's SiFive X280 (Gen. 1) to boot into Ubuntu 25.10.
> 
> The first patch merely fixes the tab alignment in riscv_encoding.h.
> 
> The second patch adds workarounds for decoder bugs in the C906 and C910, where FENCE and FENCE.I instructions with nonzero reserved fields are mistakenly treated as illegal instructions.
> 
> The third patch corrects the typedef of "s8" from "char" to "signed char", because "char" is implicitly unsigned on RISC-V.
> 
> To me, personally, these three look like uncontroversial improvements.
> 
> The fourth patch, the big one, adds the actual ISA extension emulation code.
> For initial consideration, I am hereby submitting it "as-is", mainly to see whether there is even interest in having this kind of functionality in mainline OpenSBI.
> If that turns out to be the case, this patch will need further iterations that, aside from incorporating your feedback, e.g. add configuration options for conditional compilation.
> 
> The fifth patch is included for documentary purposes only, not for merging.
> It contains the section of my fork's README file that explains which extensions can be emulated. The information therein could also go somewhere else.
> 
> 

OpenSBI is a critical RISCV firmware implementation. It's NOT an emulator.
It should strictly follow the spec and focus on correctness, security and
performance. It's not wise to add this kind of single purpose, not spec-
related, very hard to verify correctness (for people other than you) code
to something that everyone relies on. I don't needed it and either do I
want to see my jh7110 crash because of it. I have something similar as you
did, which is to emulate a S mode w/o MMU on the S7 hart of jh7110 such
that I can run linux nommu on it, and I'm perfectly happy maintaining it
as a fork, without polluting the mainline repo. FYI, S7 only has M/U mode
w/o MMU. For stock systems, after boot, S7 spins in OpenSBI doing nothing.

In my vision, part of such "instruction" emulation feature can be done in
userspace as some kind of binary translation layer pre-loaded into
processes as .so library. This can solve issues for apps hard-coded for
ext., w/o probing it first. It'll also be performant.

Side note on jh7110 cache flush:

 From U74 Core Complex Manual:
(ref: https://starfivetech.com/uploads/u74mc_core_complex_manual_21G1.pdf)

  "The custom instructions CFLUSH.D.L1 and CDISCARD.D,L1 only target the
   L1 data cache, and do not impact the L2 cache. The L2 cache controller
   contains flush capability, which performs a clean and invalidate
   operation of a line in the L2 cache. If the targeted line also resides
   in the L1 cache, then it too will be cleaned and invalidated. Section
   13.4.9 describes how to flush the L2 cache."

cflush.d.l1 is not enough. The proper way to flush cache on jh7110 is
through L2 cache controller (MMIO).

Bo

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
