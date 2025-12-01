Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E1D116F3
	for <opensbi@archiver.kernel.org>; Mon,  1 Dec 2025 22:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HN/bhnidKLaqHxy6tgDe3v5U0heDXmv8BN5VIx6nvDY=; b=1pi1kgW/UHgg32S1H1/qqOX2R9
	T2x6gaVZktT14fUGFrFqowKVFZQnx4XFv/zL0L80vWlKcykvs2j+4gPs5DK+Le88aGHb3xEcNrShb
	AExH9EaQSUP3cx5C3YbD5pMaYGBwo1UEMf6pbzrF3+oP5sunkNTpYO9k4VH9VL3fjBwyzTPI7ll/Y
	Lz0L3ADcYe1Y8xmQ/jIWTG9lHVv8s6VAgE+aB1l6cw/hGtmGod3XWyBj8Yr+PcgUak63KnaPckX1i
	LIpGHhQ9KBIOnylroT+hoK6JNa/uvoPnTfk4U0Nn6Ey0z1g4Tnvex66g9uKO79rrNzKGnRn1BFdvG
	b+VdLMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQC7S-00000004ZsR-2aFP;
	Mon, 01 Dec 2025 22:11:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQC7N-00000004Zrw-2YIw
	for opensbi@lists.infradead.org;
	Mon, 01 Dec 2025 22:11:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-298456bb53aso62487445ad.0
        for <opensbi@lists.infradead.org>; Mon, 01 Dec 2025 14:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764627096; x=1765231896; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vqGAadmbcQwycn7AJzjXKfCBTXQARYS/3lWKDoixVAk=;
        b=cKeum7geEWjoKTUnG8tC2LOcgFPDvjW1bv1Lwv8TcEL5/gv7Hz+olqmiOSJcaNXO4O
         +uEy6MS6RuYX84vjqg0jnDz/spYbmxU4S+S2uAqJS4Oa1erxiHIxB7i8YEO16p4HHY/G
         QEnaGtb88dIE++XuskE75esCxclvD6NVtBKuqiCcZZ5G6j3Boh32jI3kcisB6IZzZkku
         xiHhNrJ5tqT7RtoZhXkvk3wSlhIYqSj4XY+dMEopJ1x4RGCHnnNf9poA3Ibq4tPpCnYI
         vEqCrC2zEzWEBwDdYiRwtLowsXTYxYi4mzqu1iCdhfOVBgxtIZC/6R/DeNjQCirVe4H7
         lshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764627096; x=1765231896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqGAadmbcQwycn7AJzjXKfCBTXQARYS/3lWKDoixVAk=;
        b=mG039TH97HEfei0lz0EanD2V0LzERFROSgi6Td3ZiA9V+LzdCc4VPfatNWzpMCzMWA
         f2s1RasU6xUp4B0C/jVRDYPwx4YaT0c84CwBDa47lxxrLYTfg9QPmNSqnBEa8/KQy8zC
         b8gZb7SiYlSbNGZSIe96JbnMv8IGSrCy0lXXpteu/EcB1SlV2serIlX+wL/KffFjOuMK
         5wR63aJJh70CmNUh+wbFleP+Vl4WT6mu243JTiOHeAys0lkoZD0tMHBCIX8YKw9jeS5+
         lz0k3jDnPOZADv1/7hbgTxxleXH3qfVLbrOIkTCY0VR15r+mWOAFdBuDG7HIK7nDRAwo
         SSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrX4a2Gr4+KZRSSjMYN1iNEvhDzA3FGeWRUSNUEdTsT7VTYeHTNr+FNU3vXikjOeob017dTB94@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeup29fV9fYP39ODiVuMwt7YZruEyYib1ey6pAdK9OW7mdbqrp
	GzsF40WOEliXJ1O7sypJRHB+xOdoKXP0x2yhajZsuxTF6AbFkSRE89dB
X-Gm-Gg: ASbGncvIAq6EMPensZlrcRVRTh2ptknBt3ku9gl8x0u8EQbhjwmZ730lcDf4Ukue8nw
	XpQo4qh50xnl8V6kNHIffmzyrvyDwb52jbCUCmDKXZ+Da3W9GGoNCV7ru34uSNf80i+2Ym8T5aP
	yP+I3QayOTB5owwuHPwp+Dn3S1sjMuGGNXGCdfUkKJDNgCEIKfkZ662M9te8YFAIIbsfnkW3gPs
	WCNOUatANmi3461jSskKBx0QlJ3x5lSm19YK87PsqT5wLp4sLaGHaCo3B6r/C3MTpcitIkGjkqn
	a7J4bhle3EIG9BBlNJu6qL/eB6xoipfR7vop+VMWzjkCY0lDPqL7K3pJorKHaNGfnWCT4P9K6/6
	hOMSdJoco04EQ9mCYqNgMAqpJURebUxInk91CedNNYHTnxyQ/DLLWaacziqj9C1W+QilLnvLQA1
	utp6dJf2Z1TXSp1piI55TSrRjSL2CTpZexdqo=
X-Google-Smtp-Source: AGHT+IGBmhZ38Hl4JhaIVw0bmUtWfDIV2oH0A12LeEXrfUCUVKMTAz1J8+H+zwr2yDPHpmLpecKd/Q==
X-Received: by 2002:a17:903:2c9:b0:298:33c9:ed99 with SMTP id d9443c01a7336-29b6c684bfamr442800105ad.30.1764627096218;
        Mon, 01 Dec 2025 14:11:36 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27648sm133712805ad.52.2025.12.01.14.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 14:11:35 -0800 (PST)
Message-ID: <4ea45365-1360-4a75-9024-1d51855cc7d6@gmail.com>
Date: Mon, 1 Dec 2025 14:15:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] platform: generic: eswin: add EIC7700
To: Yu-Chien Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org,
 ganboing@gmail.com, anup@brainfault.org
References: <20251120093440.4533-1-ganboing@gmail.com>
 <20251120093440.4533-5-ganboing@gmail.com>
 <e288c418-8676-4703-b1e8-e3788ebbfc2b@sifive.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <e288c418-8676-4703-b1e8-e3788ebbfc2b@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_141137_660601_152319D7 
X-CRM114-Status: GOOD (  24.14  )
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

Hi Peter,

Thanks for the review. I saw your other reply, but let me still reply here,
while trying to fix the formatting:

On 11/30/25 23:35, Yu-Chien Peter Lin wrote:
 > Hi Bo,
 >
 > On 11/20/25 5:34 PM, Bo Gan wrote:
 >> ...
 >> +/**
 >> + * EIC7700 special arrangement of PMP entries:
 >> + *
 >> + * We have to use extra PMPs to block data cacheable regions that
 >> + * that doesn't belong to the current hart's die in order to prevent
 >> + * speculative accesses or HW prefetcher from generating bus error:
 >> + *
 >> + *     bus error of cause event: 9, accrued: 0x220,
 >> + *    physical address: 0x24ffffffa0
 >> + *
 >> + * The data cacheable regions (per datasheet) include:
 >> + *
 >> + *   - [0x1a000000,    0x1a400000) -- Die 0 L3 zero device
 >> + *   - [0x3a000000,    0x3a400000) -- Die 1 L3 zero device
 >> + *   - [0x80000000, 0x80_00000000) -- memory port
 >> + *
 >> + * To make the blocker effective for M mode too, the extra PMPs need
 >> + * LOCK bit to be set, and once set, we can't change them later.
 >> + * We also have to to use 1 extra PMP to protect OpenSBI in uncached
 >> + * memory. EIC770X maps main memory (DRAM) twice -- one in memory
 >> + * port (cached), the other in system port (uncached). P550 doesn't
 >> + * support Svpbmt, so EIC770X use the uncached window to handle DMA
 >> + * that are cache incoherent -- pretty much all peripherals
 >> + *
 >> + * Final PMP configuration:
 >> + *
 >> + * From die 0 point of view, block
 >> + *   -         [0x3a000000,    0x3a400000) -- Die 1 L3 zero device
 >> + *   -      [0x10_00000000, 0x80_00000000) -- Die 1 cached mem + holes
 >> + *
 >> + * Root domain Harts:
 >> + *  PMP[0]: [   0x80000000,    0x80080000) ____ Firmware in cached mem
 >> + *  PMP[1]: [0xc0_00000000, 0xc0_00080000) ____ Firmware in uncached
 >> + *  PMP[2]: [   0x3a000000,    0x3a400000) L___ Die 1 L3 zero device
 >> + *  PMP[3]: [    0x2000000      0x2010000) ____ CLINT
 >> + *  PMP[4]: [          0x0, 0x10_00000000) _RWX P550/System/Die 0 cached mem
 >> + *  PMP[5]: <Free>
 >> + *  PMP[6]: [          0x0, 0x80_00000000) L___ P550/System/Memory Port
 >> + *  PMP[7]: [     0x0, 0xffffffffffffffff] _RWX Everything
 >>
 > I noticed that some PMP entries such as PMP[2] and PMP[6] are configured
 > with pmpcfg.L set. During domain context switch, all PMP entries managed by
 > OpenSBI domain will be disabled [1], so locked entries will remain active,
 > and if a hole entry not using identical PMP id across domains, other regions
 > that program the locked PMP id cannot be applied. This will block the use
 > of e.g. OP-TEE which relies on domain context switch mechanism.

The non-root domains shouldn't have ENF_PERMISSIONS (locked PMP entries).
I'll add docs for EIC7700 in subsequent patchsets. In short, it's a user
error to do that in EIC7700's case, or perhaps even applies for all plat
OP-TEE is supported (to some extent), and the boot log from cover letter
demonstrates a t/u-domain like setup. It, however, does require hacks to
existing code by reverting this patch from Himanshu Chauhan

   lib: utils: Disallow non-root domains from adding M-mode regions

Thus, I left it for future work. FYI, the domains are:

opensbi-domains {
   compatible = "opensbi,domain,config";

   tmem: tmem {
     compatible = "opensbi,domain,memregion";
     base = <0x4 0x7ff00000>;
     order = <20>;
   };

   tuart: tuart {
     compatible = "opensbi,domain,memregion";
     base = <0x0 0x50910000>;
     order = <12>;
     mmio;
   };

   p550_sys: p550_sys {
     compatible = "opensbi,domain,memregion";
     base = <0x0 0x0>;
     order = <31>;
     mmio;
   };

   p550_sys_mem: p550_sys_mem {
     compatible = "opensbi,domain,memregion";
     base = <0x0 0x0>;
     order = <36>;
   };

   allmem: allmem {
     compatible = "opensbi,domain,memregion";
     base = <0x0 0x0>;
     order = <64>;
   };

   tdomain: trusted-domain {
     compatible = "opensbi,domain,instance";
     possible-harts = <>;
     regions = <&tuart (MEM_MRW | MEM_SURW)>,
               <&p550_sys MEM_MRW>,
               <&tmem MEM_SURWX>;
     next-addr = <0x4 0x7ff00000>;
     next-arg1 = <0x0 0x0>;
     next-mode = <0x1>;
   };

   udomain: untrusted-domain {
     compatible = "opensbi,domain,instance";
     possible-harts = <>;
     regions = <&p550_sys_mem (MEM_MRW | MEM_SURWX)>,
               <&tmem 0>,
               <&allmem MEM_SURWX>;
   };
};

In short, there's no need to match the PMP entry id from non-root domains
The pmp_configure will figure out the order of programming PMPs, and the
pmp_unconfigure will reset everything to a state where OpenSBI can still
function before the next pmp_configure(). The memory region config in the
domain instance has indeed became a little bit tedious, where it needs to
explicitly allow certain regions, but I hope it's acceptable.

 >
 > I am proposing reserved PMP allocator [2]. Hopefully, it can address this requirement.
 > By specifying reserved 3 entries on P550 platform, the PMP usage should become:
 >
 > PMP[0]: Reserved NAPOT [   0x3a000000,    0x3a400000) L___ Die 1 L3 zero device
 > PMP[1]: Reserved TOR1  [0x10_00000000,                L___ Die 1 cached mem + holes
 > PMP[2]: Reserved TOR2                  0x80_00000000) L___ Die 1 cached mem + holes
 > PMP[3]: Domain0Region0 [   0x80000000,    0x80080000) ____ Firmware in cached mem
 > PMP[4]: Domain0Region1 [0xc0_00000000, 0xc0_00080000) ____ Firmware in uncached
 > PMP[5]: Domain0Region2 [    0x2000000      0x2010000) ____ CLINT
 > PMP[6]: Domain0Region3 [     0x0, 0xffffffffffffffff] _RWX Everything
 > PMP[7]: unused
 >

Sounds reasonable to me, but there are 2 concerns.

1. My v2 change was using PMP TOR, and it's NAK'ed by Anup. Perhaps I
    should wait and see his feedback on this one, and your other change,
    before moving forward.

2. From die 1 POV, it's not easy to block those "hole" ranges using PMP
    at the beginning. Even with TOR, we'll run out of PMPs, because die
    1 needs to have 2 ranges in memory port blocked. It'll inevitably be
    done with reserved PMP and domain PMP interleaved, like what I have
    here.

 > One aspect that requires careful attention is CPU suspend with power gating scenarios.
 > When reserved PMP states can be removed, additional reserved PMP management
 > (save/restore operations for PMPs that protect holes) must be included in the
 > suspend/resume flow.
 >
 > [1] https://github.com/riscv-software-src/opensbi/blob/825d0e918a9e41cc57097a8cb913f26550699911/lib/sbi/sbi_domain_context.c#L123-L131
 > [2] https://lore.kernel.org/all/20251130111643.1291462-7-peter.lin@sifive.com/

This can be enhanced in future pathsets. My plan is to have a HSM that
restores the PMP blocking those "holes". Actually it also needs to restore
those feature enable/disable CSRs. This patchset is the "initial support"
for EIC7700, and I'm not precluding future improvements.

 >> ...

I'll fix the RV32 build issue for sure. Thanks again.

Bo.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
