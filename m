Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D806FE64014
	for <opensbi@archiver.kernel.org>; Sun,  5 Apr 2026 07:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkFcyntGcWZteYNzsbrHiJFD9FzF3MdFSYQogcV9mEE=; b=eLpx5ioBBw+cWr
	n3a3MxrJ4kq9pYdhojRLZ/PY7DRGiHM+DO18xxxMGjFPysAsuPDZadF9SMEmex+Z49kT32x7T2rOM
	tDMwfvrKd6ZpIGaExA4BYCG1Nzdzs+U/xPuusDXdiDaAawoqcYOs6rXKGaNqvKrKCdn69JJCDRSes
	qBc3lA2rAPX/KIGecoqS/Hck8RvqH4fe4U4M/vAIxYW2bXjmhDelt0JPtwT9m+dGywqN5cc8hpjEM
	I/xiMrainncXJboHRnKx4AJo8ehDZWqbkL5ulntLVmvUWsxcB8rddZfi+iGlqOyDvjGgtjH2mvpDW
	YT2TFYufZ3+9Bhmw67bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Hq5-0000000426r-2ObT;
	Sun, 05 Apr 2026 07:24:09 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Hq3-0000000426V-01Dg
	for opensbi@lists.infradead.org;
	Sun, 05 Apr 2026 07:24:08 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so2820305a91.2
        for <opensbi@lists.infradead.org>; Sun, 05 Apr 2026 00:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775373845; x=1775978645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcN4wtVSegVuOWORusyhGbj0hbiZhGyvNHjmin432aE=;
        b=GQ4iYjdeWpoXWvOcdZXmN/UrK4Dw+muBaBIn3ZUEHOlE7pQ36Fpe9gss3EtVp+NITV
         nrnYIhxyAwMXz0a2fXS53wp6+IBBSfGYv32d84IxfUHfkaQX2NzuX4ZVMhThxnuuAmEW
         /wKVmU1eKSC+LTU0TPgSCxBuf5NyW48IElSRR5NJ4H4sbtfiAm2UNBigFWiM/XoGwlIt
         byeQEHOqp2uWQdKnzS/l/7eeFkYTZCOfhHif+Sq0/28CXt85uq+G7Z8Oy0pzcp7JIRwb
         lG8LbPa7JkV44VlV0v6tgy2Z/7EJ1IVLMdtMMcaMP1gTbAPJ0dpPFo7kx8s6v2Xs9LHA
         BHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775373845; x=1775978645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcN4wtVSegVuOWORusyhGbj0hbiZhGyvNHjmin432aE=;
        b=lAU8mdnVyMGw73XQDHZT+KCKZYXeRpXlOs/VgzgIpaynU4RagSZrzBHYPcCWR+NPoc
         b8zvA2X5J5qWmAUqZma22ccDgQjLmyW8bW5K2xp1zdDQDx+Q9DNHwskIpMSG+9t1y7Ao
         HzC6sH7W30WDIYCrnPcF1EQxCBes7/17PX9OT/d72dzbVm5gOzqpx15nOtiFkh588mfO
         6IK4+d92r2d0Q9cN8QHhZzxH4v033Zw4UOqdvC18DIj3PjwbuMZv0qkrLKmY54Qbxm1G
         PRv7yVu8bmyGRXrtjfetR966Ve+Md7PxhrhkL1rDHLtg874el0nPsdJItwmUN7ifhKug
         B0mA==
X-Forwarded-Encrypted: i=1; AJvYcCWe1eX79HaCZmPUt7JCaL0XFUCer+CuMTq3OUE+xl8vgcoq4Bc8vNC4xcxtR5O0yejMFiBMqQ99@lists.infradead.org
X-Gm-Message-State: AOJu0YxpMN0ncTCGSYEkXe61Y/sAC7H6iyr7KXY9oPT8l9WUXsspaLSb
	5lqadKW+x9CcZMo2x9XhMN/6CXG1JeI05zeb5q10MpOI9yKkAoWEdaVvTxIrHbnKwUY=
X-Gm-Gg: AeBDieuK92+DhuuvgDnhAtzBebNrmxqSBRNfl+V+6IX9R8T5IKCh1sG+YnjEQM8QJYv
	vIzWMAAXqu1RHrbYjly0ecyR8ensxajulo9/tzsnj5x/8DFf9DT36ZjwYJ4/uRPwoJdzRfP9gUv
	WcpJ1WHRYNQbZjlfyTQdaE1Xe1Om8DAqrYtnGVUJ5TGRzaZvuhwVFK7ZMijkHSAJc7t2t1i4EIm
	+CMt2RvDQ6oogpdV2ohmdYHsoh2ALfFDGzM9+EI+zdVbhN6I97w8GtnxCvY0krYRYBmjqyvTwxJ
	augD1zt5bU1r/lPBLdxwJseenG0SMYx4cb3EfUb3WeeUnFKGs9PFq47YUaCNXsrkE9SjQodPKEX
	01+4rz5C0moNKJa51OmWG9fJZaNAEXoXjILHDZIzXN2cJiPCEzNdPwxEDUvqRVJPmVPtjqp5ZHH
	Xe78J23LGbTLZE8Bi0I70eX6ecL8d7GkjS36Rfvmb8pIxAKRbaQzBVDVZMaYUL2w==
X-Received: by 2002:a17:90b:3dcb:b0:35b:e671:a527 with SMTP id 98e67ed59e1d1-35de679fc26mr8217209a91.3.1775373845575;
        Sun, 05 Apr 2026 00:24:05 -0700 (PDT)
Received: from [10.0.0.205] (1-169-192-175.dynamic-ip.hinet.net. [1.169.192.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd36a0595sm10633607a91.16.2026.04.05.00.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 00:24:05 -0700 (PDT)
Message-ID: <7177101d-8d27-429d-83c1-816d2edde2eb@sifive.com>
Date: Sun, 5 Apr 2026 03:24:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] sbi: add hardware isolation abstraction framework
To: Raymond Mao <raymondmaoca@gmail.com>, opensbi@lists.infradead.org
Cc: scott@riscstar.com, dave.patel@riscstar.com, raymond.mao@riscstar.com,
 robin.randhawa@sifive.com, samuel.holland@sifive.com,
 anup.patel@qti.qualcomm.com, anuppate@qti.qualcomm.com, anup@brainfault.org,
 dhaval@rivosinc.com
References: <20260317201849.903071-1-raymondmaoca@gmail.com>
Content-Language: en-US
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
In-Reply-To: <20260317201849.903071-1-raymondmaoca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_002407_072546_F836E7FA 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Raymond,

On 3/17/26 4:18 PM, Raymond Mao wrote:
> From: Raymond Mao <raymond.mao@riscstar.com>
> 
> Introduce a system-level hardware isolation framework with a
> registration API and per-domain context tracking.
> This establishes an abstraction that allows multiple mechanisms to
> be composed while keeping core domain data structures independent
> of any single platform implementation.
> 
> Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>

Thank you for the RFC patch on the hardware isolation framework. I'm 
currently
reworking our internal WorldGuard patches and plan to share them for 
development
with Jim's WG QEMU simulation.

I wanted to offer some personal input based on my exploration of an 
alternative
approach which might be useful as we gather community feedback.

The goal is to utilize WorldGuard for system-level protection in static
partitioning TEE scenarios (e.g., OP-TEE). To achieve this, we need to
work on two components:

1. RISC-V Worlds ISA Extension

The Worlds ISA extension [1] introduces per-hart World ID (WID) 
management via
CSRs like `mlwid` and `mwiddeleg`. These concepts should integrate naturally
with OpenSBI's domain framework:

- Each domain can be assigned a `next_wid` (corresponding to `mlwid`)
- Each domain can be assigned a `next_widlist` (corresponding to 
`mwiddeleg`)

When OpenSBI switches to a target domain, it assigns the domain's 
`next_wid` to
`mlwid`, effectively enabling hardware-enforced physical address space 
isolation
for that supervisor domain.

2. WorldGuard Checker Driver

The WG checker driver parses device-tree information and programs the 
WorldGuard
checkers to create access control rules associating memory/device 
regions with
allowed World IDs.
(We SiFive will also propose DT formats for this.)

Device Isolation Example:

deviceA: [0x10000000, 0x20000000) WID3
deviceB: [0x20000000, 0x30000000) WID0, WID3 (shared)
deviceC: [0x30000000, 0x40000000) WID0

Memory Partitioning Example:

Given a DRAM range `[0x8000_0000, 0x1_0000_0000)`, we can partition it 
as follows:

| Mode    | Main User | WID      | Physical Address Range 
                    |
|---------|-----------|----------|----------------------------------------------------------|
| M-mode  | OpenSBI   |       3  | [0x8000_0000, 0x800C_0000) 
                    |
| SU-mode | Linux     | 0, 1, 3  | [0x800C_0000, 0xC000_0000), 
[0xC100_0000, 0x1_0000_0000) |
| SU-mode | OP-TEE    |    1, 3  | [0xC000_0000, 0xC100_0000) 
                    |

During a domain context switch, OpenSBI assigns the target domain's 
`next_wid`
to `mlwid`. This ensures that the hart can only access memory regions 
associated
with the active WID, providing hardware-enforced isolation.

One open question I'm exploring is whether to extend 
`sbi_domain_memregion` with
WorldGuard-specific fields (flags, permissions, allowed WIDs) as bus checker
region descriptor for following considerations:
- WorldGuard checker slots will make use of TOR addressing mode, which
   PMP does not
- WorldGuard slots do not have execute permission semantics, unlike PMP
- Reusing PMP-style flags directly may cause logic errors in functions like
   `sbi_domain_check_addr()`

I haven't fully implemented this yet, so the design may change as I work 
through
the details.

In addition to the RISC-V Worlds ISA specification, I'd like to share 
resources/
found helpful for understanding WorldGuard and system-level protection:
- [1] RISC-V Worlds ISA Extension:
  
https://github.com/riscv/riscv-worlds/releases/download/riscv-isa-release-4ae2105-2026-01-09/riscv-privileged.pdf

- [2] RISC-V Secure System Partitioning with Worlds and TrustZone (v0.7.2):
   https://github.com/MIPS/riscv-partitioning/releases/tag/v0.7.2

- [3] RISC-V Platform Security Model (v0.5):
   https://github.com/riscv/riscv-security-model/releases/tag/v.05

- [4] RISC-V Implementing Application Processor TEEs (Whitepaper):
  
https://riscv.org/wp-content/uploads/2025/10/RISC-V-Implementing-Application-Processor-TEEs-REV-1.pdf

Again, these are just my quick notes and personal input for this milestone.
We should keep talking with the community to ensure our plan is on the right
direction.

Looking forward to collaborating on this!

Best regards,
Peter Lin

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
