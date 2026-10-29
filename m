Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0346606A322
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHW83FEQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=bm3rI69f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Da/UYrNNkyYgxbPgS2TIg1JX1ac6Xa13iUhD2CEEsCE=; b=dHW83FEQ6+5g26iUm9CuQt4EdR
	QVC5Hi4oWfk9ERBoF868JBp/Htj2xzte3XDixWv7E/cj05twXO7gtBZ1WOOMI4ObST2z0WCx94DtA
	KiwoPLBJOVEOeotms1cRdOWThXoHUHh+PuHJGyi3m5X8tZBRC0aXzWQPu0jRrJZE3LWXREi+RHso9
	iL7xv/2YPUVp44MoCO9HsBPWWnXyMpmo0CGas2VzkBJ+Xpe0JqnQSlvofXx6Z9H7lGH9X5wJax48C
	O7PN+h7lDQy9Ih3bBMu6Ym7esrwpWgVqZ2uSFFAd7UQ8XCiePeXBpFVVuf9ZqLjaSNfrp8qpH7tcu
	um+5UH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHlF-00000008KFF-18PM;
	Thu, 29 Oct 2026 04:29:09 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHlB-00000008KEr-3tPB
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 04:29:07 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1059378a12.2
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 21:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793248143; x=1793852943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xCKTrr4E6cvg1ewIkBPFRjYT0qCAPFbXy2O67VEwaM4=;
        b=bm3rI69f5nWsgApupWySkL+geQSPoNZlZrsekqFrrp7gin3eJ5yYALSyKKVxzOS7je
         FF2C/lwKOKo7uCDe3WnFMiRppcJwoJga4JIjP7KCSKoR1UCUS0+Lf9l0CWZQ/uMNzltd
         Gyde+s7eEXI3RjtVeILboRI9WL7MRl+z0iWRBuzBKXhBf5jUtS19Mqf/kAp61MRKyIeE
         TkLqM+YBaqPpHUozoDQPxSsSLpBrnp2Ea9/143d/iy/QBM1RLGt6GGGWzI73QK3Zq5Ok
         ajSdsjaSbwo61nPwQ/XW7bj7iEdqMiLNSldnwjmQ74b78EdWDBsGNWy43aFg1fUghlRi
         AI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793248143; x=1793852943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCKTrr4E6cvg1ewIkBPFRjYT0qCAPFbXy2O67VEwaM4=;
        b=UMbjaa1IKcQcid04m40k3BKgq/3y9qcmUAg1cIwpuwZ+WxkygxjCqMHr0XEppHs/N6
         DNlwW5oykd2uHtcPyrzdSyQiiNfwJqfYUsX4FCe/FqB6/IGDK36NuqLDMrwkjgoUS6xM
         geA3/e7GBfVyIwOn7p7Yb1L0rW2Yli2In2vnfP8gb/3r9Oji/cuzFwGY6NTPWAp+X4J3
         3qVMWCDeo+geEWUw5SHvbli11zkJxRxfap6P9weFfj+YBD1qVGickYwc5ffYEoEIjfkh
         vTnNfpxntpZs7hOUo0nOAqNeXYyT1VLozZFhYiPv9hYFA0p6KZ043P3O+rwcySJ+5cwo
         ur/Q==
X-Gm-Message-State: AFq9FYLQ96hzvaARS68DC/V7eygvP8/yAFKmmjIkImD7wtBnwoP2mzki
	lpFndi6s9iVjsF2TDSLoaxuha0P1m0189odx4UgRKnHFh01r6hDTPGBCI3rckQ1OJjM=
X-Gm-Gg: AYBFou1eAfQhmrmj7rhHQMlcxxyzXp+G8vKN98twwEvJo9XOPr69oA9Xty+y4nAT0RO
	o2qY9MbAx0mOjEUw8eoqowRljMIn4fQw9vi5K4FVI5wC/OlSRex+a+u949tYUwOQjRi13q55Ts7
	dALqb4yzCHEW9iKbY4FjDoVXxY5Cfo0szHD5k2YGO6k+QcZ4b0IHxBxVfSPHvErIJGAO5dL1xmu
	VIaBEcYUQdUd1DOEoVxc1RJ/2sufhTxcc61aRxsZR/yfiL+N/toXQA4y5aax1swEam6F5HLK0qQ
	gIA0H+MGZBQoNEcxPqTEPOYZJ5NvqUs+16lvnqmDirURE3BezNQ/eMx+7/G6hhfdTgnekTWywx7
	+pDQ3TEcQV5JRMiciDfJjs5KwwEceNYhCNDCnbRaJBHBea5OZbuN+0+1zCs25Z52O3WKV9D7k7t
	R6w2ehhk32iP97q1W11G3VpeEMCz1rMURQ4AGpnxM5BU9zx8i4U574p96jjGV5HbNXMEkDQLyDS
	X6QXCBSwZEQTrKRRblnQfb2fT4bz1vi91s++5/bWcXBdcTlblXtvwelonqpPXhB4t0bSxU8p5lf
	9tqn4x939kYYvfQfbNzxgdhDKjw=
X-Received: by 2002:a17:90b:5346:b0:3ab:d45c:59da with SMTP id 98e67ed59e1d1-3ae58299f52mr3462430a91.40.1793248143499;
        Wed, 28 Oct 2026 21:29:03 -0700 (PDT)
Received: from plin-1878 ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm2039005a91.9.2026.10.28.21.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:29:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:28:57 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, anup.patel@oss.qualcomm.com,
	scott@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	zong.li@sifive.com, greentime.hu@sifive.com
Subject: Re: [PATCH v3 0/5] Add WorldGuard support with SiFive WG checker
Message-ID: <auLLiQfr0bkMEx5z@plin-1878>
References: <20260904162915.1092353-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260904162915.1092353-1-raymondmaoca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_212905_996663_4E4618F3 
X-CRM114-Status: GOOD (  18.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Raymond,

On Fri, Sep 04, 2026 at 12:29:10PM -0400, Raymond Mao wrote:
> From: Raymond Mao <raymond.mao@riscstar.com>
> 
> This series adds WorldGuard support according to the wgchecker2 DT-
> binding proposal from SiFive [1] with QEMU virt integration.
> 
> The implementation:
> - reuse sbi_hart_protection for hart-local runtime reconfiguration
> - reuse sbi_domain_data for per-domain WorldGuard state
> - keep WorldGuard-specific setup and checker programming in platform
>   code
> 
> At boot, the generic platform code invokes a QEMU virt WorldGuard
> setup path which:
> - parses wgchecker2 checker instances
> - parses provider partition@N entries and programs checker MMIO
> - parses per-hart CPU defaults from /cpus
> - parses per-domain WorldGuard metadata under hw-isolation
> 
> Checker programming is provider-driven. Consumer-side
> access-controllers references are carried for DT-binding alignment.
> 
> During domain transitions, the WorldGuard hart protection
> implementation reprograms MLWID and, when available, MLWIDLIST,
> MWIDDELEG, and SLWID.
> 
> The series is split as follows:
> 1. add reusable FDT helpers needed by the WorldGuard parser
> 2. add WorldGuard CSR definitions and hart extension flags
> 3. document the current DT layout consumed by the implementation
> 4. add the wgchecker2 / WorldGuard runtime and QEMU virt integration
> 
> Tested with:
> - QEMU riscv-wg-v4-260821 [2] with arg 'worlds=on' and the merged
>   WorldGuard test DTB.
> 
> [1] dt-bindings: riscv: Add RISC-V Worlds and SiFive WorldGuard DT
>     bindings
>     https://lore.kernel.org/linux-devicetree/20260812122131.1534906-1-peter.lin@sifive.com/
> [2] https://github.com/cwshu/qemu/tree/riscv-wg-v4-260821

Thanks for working on this series. Could we align the implementation with
the DT proposal on a few key points?

1. Domain WIDs should use wid / widdeleg directly under domain nodes, not
   hw-isolation with sifive,wgchecker2. 
   My patches already handle the WID assignment and switching.
   https://patchwork.ozlabs.org/project/opensbi/patch/20261027083509.1076577-10-peter.lin@sifive.com/
2. wgChecker is a static firewall configured once at boot; by design it does
   not support efficient dynamic reconfiguration.
3. Unlike sequential first-match PMP, wgChecker slots are strictly accretive
   (parallel OR), so overlapping rules cannot restrict access. i.e.

   /* PMP (Priority-based, sequential): */
   for (i = N-1; i >= 0; i--) {
       if (pmp[i].matches(addr))
           return pmp[i].perm;      // FIRST match wins
   }
   
   /* wgChecker (Strictly accretive, parallel): */
   perm = NO_ACCESS;
   for (i = 0; i < nslots; i++) {
       if (slot[i].matches(addr))
           perm |= slot[i].perm[wid]; // OR all matches
   }
   if (perm allows access)
       grant_access();
   
   The wgChecker driver should automatically select between NAPOT and TOR
   encoding to minimize slot usage.

4. OpenSBI should support use cases below and dump the wgChecker slot info at boot:

========================================================================
Use Case 1: Single-Slot Peripheral Protection (Full Subordinate Range)
========================================================================

0x001c_1000 +---------------------------------------------------+
            | partition@0 : [0x001c_1000, 0x001c_2000)          |
            | serial@1c1000 | WID 0,3 RW (perm 0xc3, cfg 0x1f)  |
            | Slot00..01  : A=TOR (Slot00 base, Slot01 top)     |
0x001c_2000 +---------------------------------------------------+

uart: serial@1c1000 {
    reg = <0x001c1000 0x1000>;
    access-controllers = <&wgc0 0>;
};

wgc0: access-controller@1c2000 {
    compatible = "qemu,wgchecker2", "sifive,wgchecker2";
    reg = <0x0 0x001c2000 0x0 0x1000>;
    #access-controller-cells = <1>;
    #address-cells = <1>;
    #size-cells = <0>;

    partition@0 {
        reg = <0>;
        sifive,wg-region = <0x0 0x001c1000 0x0 0x00001000>;
        sifive,slot-permissions = <0x0 0x000000c3>;
        sifive,slot-config = <0x1f>;
    };
};

Expected OpenSBI boot dump:
wgChecker Base       : 0x1c2000
wgChecker Slot00     : 0x00000000001c1000-.................. 00: A:0 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot01     : ..................-0x00000000001c2000 c3: A:1 ER:1 EW:1 IR:1 IW:1 L:1
wgChecker Slot Usage : 1 (total), 1 (used), 0 (free)

========================================================================
Use Case 2: Multi-Region Peripheral Protection (Disjoint Register Groups)
========================================================================

0x0001_0000 +---------------------------------------------------+
            | partition@0 : [0x0001_0000, 0x0001_8000) (32 KiB) |
            | reg[0] m_mode | WID 3 RW   (perm 0xc0) | Slot01   |
0x0001_8000 +---------------------------------------------------+
            :                  (unreferenced)                   :
0x00a0_0000 +---------------------------------------------------+
            | partition@1 : [0x00a0_0000, 0x00a0_4000) (16 KiB) |
            | reg[1] s_mode | WID 0,3 RW (perm 0xc3) | Slot02   |
0x00a0_4000 +---------------------------------------------------+

device@10000 {
    reg = <0x0 0x00010000 0x0 0x8000>,
          <0x0 0x00a00000 0x0 0x4000>;
    reg-names = "m_mode", "s_mode";
    access-controllers = <&wgc1 0>, <&wgc1 1>;
};

wgc1: access-controller@35000 {
    compatible = "qemu,wgchecker2", "sifive,wgchecker2";
    reg = <0x0 0x00035000 0x0 0x1000>;
    #access-controller-cells = <1>;
    #address-cells = <1>;
    #size-cells = <0>;

    partition@0 {
        reg = <0>;
        sifive,wg-region = <0x0 0x00010000 0x0 0x00008000>;
        sifive,slot-permissions = <0x0 0x000000c0>;
        sifive,slot-config = <0x0f>;
    };
    partition@1 {
        reg = <1>;
        sifive,wg-region = <0x0 0x00a00000 0x0 0x00004000>;
        sifive,slot-permissions = <0x0 0x000000c3>;
        sifive,slot-config = <0x0f>;
    };
};

Expected OpenSBI boot dump:
wgChecker Base       : 0x35000
wgChecker Slot00     : 0x0000000000000000-.................. 00: A:0 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot01     : 0x0000000000010000-0x0000000000018000 c0: A:3 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot02     : 0x0000000000a00000-0x0000000000a04000 c3: A:3 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot04     : ..................-0x0000000001000000 00: A:0 ER:0 EW:0 IR:0 IW:0 L:0
wgChecker Slot Usage : 4 (total), 2 (used), 2 (free)

========================================================================
Use Case 3: Multi-Domain DRAM Spatial Partitioning (Hybrid NAPOT + TOR)
========================================================================

OpenSBI: WID3
Linux  : WID0
OP-TEE : WID1

  0x8000_0000 +---------------------------------------------------+
              | partition@0 : [0x8000_0000, 0xC000_0000) (1024M)  |
              | Linux / OpenSBI | WID 0,1,3 RW (0xcf) | Slot01 A:3|
  0xC000_0000 +---------------------------------------------------+
              | partition@1 : [0xC000_0000, 0xC100_0000) (16M)    |
              | OP-TEE / OpenSBI| WID 1,3 RW   (0xcc) | Slot02 A:3|
  0xC100_0000 +---------------------------------------------------+
              | partition@2 : [0xC100_0000, 0x1_0000_0000) (1008M)|
              | Linux / OpenSBI | WID 0,1,3 RW (0xcf) | Slot03..04|
0x1_0000_0000 +-------------------------------------------------+

memory: memory@80000000 {
    reg = <0x0 0x80000000 0x0 0x80000000>;
    access-controllers = <&wgc2 0>, <&wgc2 1>, <&wgc2 2>;
};

wgc2: access-controller@50000000 {
    compatible = "qemu,wgchecker2", "sifive,wgchecker2";
    reg = <0x0 0x50000000 0x0 0x1000>;
    #access-controller-cells = <1>;
    #address-cells = <1>;
    #size-cells = <0>;

    partition@0 {
        reg = <0>;
        sifive,wg-region = <0x0 0x80000000 0x0 0x40000000>;
        sifive,slot-permissions = <0x0 0x000000cf>;
        sifive,slot-config = <0x0f>;
    };
    partition@1 {
        reg = <1>;
        sifive,wg-region = <0x0 0xc0000000 0x0 0x01000000>;
        sifive,slot-permissions = <0x0 0x000000cc>;
        sifive,slot-config = <0x0f>;
    };
    partition@2 {
        reg = <2>;
        sifive,wg-region = <0x0 0xc1000000 0x0 0x3f000000>;
        sifive,slot-permissions = <0x0 0x000000cf>;
        sifive,slot-config = <0x0f>;
    };
};

Expected OpenSBI boot dump:
wgChecker Base              : 0x50000000
wgChecker Slot00            : 0x0000000000000000-.................. 00: A:0 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot01            : 0x0000000080000000-0x00000000c0000000 cf: A:3 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot02            : 0x00000000c0000000-0x00000000c1000000 cc: A:3 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot03            : 0x00000000c1000000-.................. 00: A:0
wgChecker Slot04            : ..................-0x0000000100000000 cf: A:1 ER:1 EW:1 IR:1 IW:1 L:0
wgChecker Slot16            : ..................-0x0000000100000000 00: A:0 ER:0 EW:0 IR:0 IW:0 L:0
wgChecker Slot Usage        : 16 (total), 4 (used), 12 (free)

Best regards,
Peter Lin

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
