Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2CEC61DFD
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9YgaxpYD5dE8utAbrRZSvBIaXW1TwLymA8UNrbwPLM=; b=pLUNxUWz2tQfjL
	zgJlsx8JNr6Lb2DCA/LwY/dB6WpZ+tYuhE/x3O+EikaoNMeRH2pV/CL7h/68i/x/S3SG6GoB8MdBs
	NKfkbFI+zvTU4X+OSb/G2sdyhx/lxuNXnudFJ+GWi8Ko+0WyrSzT6hb+4nZIwGZGkK829XsAV6p7y
	/Szt1PBaybLyNro503Q5BK8/8NLqnuNI2vEqokUnorXgkO491fijPpNASS1G4TlUqgAvFApGyKNZ3
	keyk+s0ewheecqsgyqAUPsfXx0GVfygLAd/RrBjKDU1Ipvv8e/v9ceZOqaSyAllQGToslIqNjoKyG
	lb2pUBslYF7uXJHMNH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18JW-0000000AQ9o-0W41;
	Mon, 31 Aug 2026 20:09:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18JT-0000000AQ7p-1cAX
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 20:09:04 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 09B6E3F610
	for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 20:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788206942;
	bh=tlfQGu+ZF5hylDsBNu9EIyA5L+mPpYtjup5/Zr4fy/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=TKHwxLg1CcVGA3ICzP2y9PK5Ga5+rHC+z9VDCpvFEwVz63SSk6BGHLMLYZmxboJat
	 2AKDJw+0YFUYuabcFYy1/mSxzA6SY7u8pYi4u7Lvqj8GFsswdeppimcOwY28O0XUBU
	 ViqrfWY4PNX+DjWbXwvSgXji5epV8PXNk4b22cN+nu4EdtrfLJ90bXDzCwNSbH84jl
	 NrkLGP4ofwf4ChpQjE81e1a8kRgCYgbQ5wlt7TIhL4v5Gp3uNR7cPNZjCqAIZwOR2d
	 2Xk6lQmV7rQZfGvWtbaVACGyOgDWYYnOUcxmR8PH1ACU9q6c1DYv27jXDvgOLslW+W
	 VomKlN8YIlxbI4xkkVdNZqu2WKSwuWfLGtPTvqH5S/jYpCvn4tL+WUALT07uQ1/1K4
	 kjfC9RecBBk3DOaY8s+ryGRlEV3Vgk/7Qijjbl5t0mGyDLHgw4m7FRxYyqjE+VXfcr
	 duJjCfnUBPPAYM5uLVNnBkNYnKcBz6W3hpmXWlklTGghQHXa/pGzCCU02uOxQ0Ymni
	 ijfZvVqTJAnsE9vXON6VH4MQi8V1NFSBpJNvFU40NTc7HqiL7wx5xZFKG/qCnRcsz9
	 yljl7sf9Q5hznFqyvNaBvokZxzbC+YREYn3LnvcbQfutLIvmDn0rf9cWactgvdBXd0
	 3Sxg/r75ggwwlDbxaVgM9ruA=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48437090e74so80526f8f.2
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 13:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206941; x=1788811741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tlfQGu+ZF5hylDsBNu9EIyA5L+mPpYtjup5/Zr4fy/I=;
        b=KK6USTbyiDLD5ynhvVLPb4Jlh6ZfpViq6KnlwMD6eZ/JIRXhfQvCOc6ZHniel9DDsM
         RKzAz+HXeXyFBl8DANmJJB+k7CekTY5A/WjrSFa8lD/tY818qtadTf+b3Ae34J+YypCf
         9BnoJFOAHeIFjGOGK/QUl+z2LrBzqWcce4skuy2xCROhTC3SPmbWGbqPBgaDMpa+iFy4
         HTXpux5cuyB0odhHO/LQE3FwrAzMzNcF3Qtl6yKex3TH+zMAJxR/fPgDubV3wih1KtYF
         zofr/5BKne8UU09ckAl7UDgaA5upSl/CpjeEcvmtlDmLU76s0DDj4ATA1ZbJ7IMzETLh
         E4+g==
X-Gm-Message-State: AFuF++kc0JcG5rJkvfzrmyswM/sR0e5kbAbeRTJsd2+Gcyl7md8YH1GR
	IY7JmkJBWAk1yRWSCqHZ/FUE2//ZP5p2Ww/kVbVsHNvnvBv3nW6E4UjBsYhBKrmGFWK9K49k7WG
	TGSum7Bnn5C4V7ijV48KuGCUxkbWHMe2DcdtwATwjLlW3vD4/sVnMB+3tLThfwLkqvLGkhc+db1
	R69br9sw31rs8KsCI=
X-Gm-Gg: AR+sD10mHAzcMM1OJ9AVDToc0PFvhO7H7v13yB/vXM3Tb3qCoKr1T4eXwTbx7bTgfvq
	InE/FX5Bkgu6rdb6EoZBxGRmQ/lcTr6jN3D8/LmUwE65G4naZ8mlWxoxV61h9TkW9Vo1wxG9dmm
	o3kTEt9BVSIobDWLCYXsSv7kEG5HOIdgszJHs6YnFi25JWnNnAWbhPNhO6H0GthTr6PT1D2h6by
	H+ny5Kqm8atCrLyUYICCBBcTfM/3N1XmlyGM3pvdo1C6yC9reQEQzi0MVht08G6nxDP9ihvw0TY
	4cyl+DuwM4MomQWd20Wk8Fgmi7i9LbJJnON7xRr3tRy1AGn7l4EiQIKUCA7DwwAbfPopfOnPmF5
	jgzAbxh9w/pheGaVwG67BeNGq2Jx2pNuDsA==
X-Received: by 2002:a05:600c:a106:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49ccb6a1689mr272125875e9.4.1788206941527;
        Mon, 31 Aug 2026 13:09:01 -0700 (PDT)
X-Received: by 2002:a05:600c:a106:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49ccb6a1689mr272125465e9.4.1788206941168;
        Mon, 31 Aug 2026 13:09:01 -0700 (PDT)
Received: from k6.lan (141.175.65.37.rev.sfr.net. [37.65.175.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e3a9sm15515825e9.15.2026.08.31.13.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:09:00 -0700 (PDT)
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
To: opensbi@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com,
	xianbin.zhu@linux.spacemit.com,
	anup@brainfault.org,
	ganboing@gmail.com,
	samuel.holland@sifive.com,
	heinrich.schuchardt@canonical.com,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: [PATCH 3/3] platform: generic: spacemit: k3: wake A100 core 8 for ESOS/RPMI services
Date: Mon, 31 Aug 2026 22:07:52 +0200
Message-ID: <20260831200832.404000-4-valentin.haudiquet@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831200832.404000-1-valentin.haudiquet@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
 <20260831200832.404000-1-valentin.haudiquet@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_130903_559409_544CB405 
X-CRM114-Status: GOOD (  18.29  )
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

The K3 SoC has two asymmetric CPU complexes: X100 (harts 0-7) and A100
(harts 8-15).  ESOS -- the rcpu-side firmware already loaded in SPI NOR --
runs on A100 core 8 and provides RPMI services (clock, voltage, device
power, system reset, suspend) that the X100 side depends on during boot.

Without waking core 8, all RPMI mailbox transactions time out and the
system hangs early during Linux boot (at basic.target or
cryptsetup.target, depending on which earlier fixes are present).

Wake hart 8 during pre_init by writing its RVBADDR to a minimal assembly
entry (_spacemit_k3_dummy_start) that does A100-specific CSR setup,
restores C2 RVBADDR to the normal warm-boot entry, and enters WFI.  The
HSM can later start hart 8 normally -- the HSM hart_start happens
post-boot from Linux, so there is no race with the dummy path writing
RVBADDR concurrently.

Add A100 performance CSR definitions (VEC_L1BYPASS, L2_PERF_DIST,
CIU_CHR2_DEPD_DIS, CIU_CHR2_MER_DIS) to k3.h and the
_spacemit_k3_dummy_start entry to k3_asm.S.

Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
---
 platform/generic/include/spacemit/k3.h     | 11 ++++
 platform/generic/include/spacemit/k3_asm.h |  1 +
 platform/generic/spacemit/k3.c             | 19 ++++++
 platform/generic/spacemit/k3_asm.S         | 75 ++++++++++++++++++++++
 4 files changed, 106 insertions(+)

diff --git a/platform/generic/include/spacemit/k3.h b/platform/generic/include/spacemit/k3.h
index ed1637b9..b50e9b1b 100644
--- a/platform/generic/include/spacemit/k3.h
+++ b/platform/generic/include/spacemit/k3.h
@@ -129,4 +129,15 @@
 #define DMASYS_CLK_EN				(0xd8440000 + 0x234)
 #define DMASYS_RESET_DEASSERT			BIT(0)
 #define DMASYS_CLK_EN_BIT			BIT(0)
+/*
+ * A100 core performance CSRs.  CIU_CHR2_DEPD_DIS and CIU_CHR2_MER_DIS
+ * are bitfields of CSR_ML2HINT (0x7f7), named after the hardware manual's
+ * CIU_CHR2 register description.
+ */
+#define CSR_PERF_CTRL				0x7d0
+#define VEC_L1BYPASS				(_UL(1) << 32)
+#define CSR_PREFETCH_CTRL			0x7d1
+#define L2_PERF_DIST				(_UL(3) << 10)
+#define CIU_CHR2_DEPD_DIS			(_UL(1) << 3)
+#define CIU_CHR2_MER_DIS			(_UL(1) << 2)
 #endif /* __RISCV_SPACEMIT_K3_H__ */
diff --git a/platform/generic/include/spacemit/k3_asm.h b/platform/generic/include/spacemit/k3_asm.h
index 70c00478..3f06b20e 100644
--- a/platform/generic/include/spacemit/k3_asm.h
+++ b/platform/generic/include/spacemit/k3_asm.h
@@ -11,6 +11,7 @@
 
 #ifndef __ASSEMBLY__
 void _spacemit_k3_warm_start(void);
+void _spacemit_k3_dummy_start(void);
 #endif
 
 #endif /* __RISCV_SPACEMIT_K3_ASM_H__ */
diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
index f134427d..650e9f98 100644
--- a/platform/generic/spacemit/k3.c
+++ b/platform/generic/spacemit/k3.c
@@ -128,6 +128,25 @@ static void spacemit_k3_pre_init(void)
 
 	for (i = 0; i < array_size(cci_map); i++)
 		cci_enable_snoop_dvm_reqs(cci_map, i);
+
+	/*
+	 * Wake hart 8 (first A100 core, cluster 2) so that ESOS -- already
+	 * loaded in SPI NOR -- can provide RPMI services (clock, voltage,
+	 * device power, system reset, suspend).  Without this, all RPMI
+	 * mailbox transactions time out.
+	 *
+	 * Core 8 jumps to _spacemit_k3_dummy_start which does minimal A100
+	 * setup, restores C2 RVBADDR to the normal warm-boot entry, and
+	 * enters WFI.  The K3 HSM can later start it normally -- the HSM
+	 * hart_start for hart 8 happens much later (post-boot, from Linux),
+	 * so there is no window where both the dummy path and HSM could
+	 * write RVBADDR concurrently.
+	 */
+	writel((u32)(unsigned long)&_spacemit_k3_dummy_start,
+	       (void *)(unsigned long)C2_RVBADDR_LO_ADDR);
+	writel((u32)((unsigned long)&_spacemit_k3_dummy_start >> 32),
+	       (void *)(unsigned long)C2_RVBADDR_HI_ADDR);
+	writel(BIT(8), (void *)(unsigned long)PMU_CAP_CORE8_WAKEUP);
 }
 
 static int spacemit_k3_early_init(bool cold_boot)
diff --git a/platform/generic/spacemit/k3_asm.S b/platform/generic/spacemit/k3_asm.S
index 2da58857..9d1ea5c5 100644
--- a/platform/generic/spacemit/k3_asm.S
+++ b/platform/generic/spacemit/k3_asm.S
@@ -50,3 +50,78 @@ _spacemit_k3_warm_start:
 	.word	0x62000073	/* hfence.gvma */
 1:
 	j	_start_warm
+
+/*
+ * Minimal entry point for the initial wake of an A100 core (hart 8) on
+ * cluster 2.  Its sole purpose is to power up the cluster so that ESOS
+ * -- already loaded in SPI NOR -- can provide RPMI services (clock, voltage,
+ * device power, system reset, suspend).  After setup the core enters WFI;
+ * the K3 HSM can later start it normally via the warm-boot vector.
+ *
+ * The PMA/L2/cache setup below mirrors _spacemit_k3_warm_start, plus
+ * A100-specific performance CSRs that ESOS needs.  These are applied
+ * only here because upstream K3 support targets X100 harts (0-7) for
+ * Linux; A100 harts (8-15) are used solely for ESOS.  When the HSM
+ * later starts hart 8 from Linux, it enters warm_start -- the perf CSR
+ * settings persist from this initial wake since it is a WFI exit, not
+ * a cold reset.
+ *
+ * The C2 RVBADDR is restored to _spacemit_k3_warm_start so that the next
+ * wake (from HSM hart_start) enters the standard OpenSBI warm-boot path.
+ */
+	.align 3
+	.globl _spacemit_k3_dummy_start
+_spacemit_k3_dummy_start:
+	/* Disable all interrupts. */
+	csrw	0x304, zero		/* CSR_MIE */
+
+	/* Program PMA attributes before enabling the caches. */
+	li	t0, (PMACFG0_AUDIO_BUF_FIELD_MASK << \
+		     PMACFG0_AUDIO_BUF_FIELD_SHIFT)
+	csrc	CSR_PMACFG0, t0
+	li	t0, (PMACFG0_AUDIO_BUF_ATTR_CACHEABLE << \
+		     PMACFG0_AUDIO_BUF_FIELD_SHIFT)
+	csrs	CSR_PMACFG0, t0
+	li	t0, PMACFG0_XIP_FIELD_CLEAR
+	csrc	CSR_PMACFG0, t0
+	li	t0, PMACFG0_XIP_ATTR_IO
+	csrs	CSR_PMACFG0, t0
+	sfence.vma
+
+	/* A100-specific performance CSRs. */
+	li	t0, VEC_L1BYPASS
+	csrs	CSR_PERF_CTRL, t0
+	li	t0, L2_PERF_DIST
+	csrs	CSR_PREFETCH_CTRL, t0
+	li	t0, CIU_CHR2_DEPD_DIS
+	csrc	CSR_ML2HINT, t0
+	li	t0, CIU_CHR2_MER_DIS
+	csrs	CSR_ML2HINT, t0
+
+	/* Enable L1 snooping and L2 prefetch for this hart. */
+	csrr	t0, mhartid
+	andi	t0, t0, (PLATFORM_MAX_CPUS_PER_CLUSTER - 1)
+	li	t1, 1
+	sll	t1, t1, t0
+	li	t2, (ML2SETUP_IPRF | ML2SETUP_TPRF)
+	or	t1, t1, t2
+	csrs	CSR_ML2SETUP, t1
+	li	t0, ML2HINT_TRACE_TOP_ICGEN
+	csrs	CSR_ML2HINT, t0
+
+	/* Enable caches. */
+	li	t0, MSETUP_BOOT_FLAGS
+	csrs	CSR_MSETUP, t0
+	fence	iorw, iorw	/* A100 needs explicit fence after MSETUP */
+
+	/* Restore C2 RVBADDR to the normal warm-boot entry. */
+	lla	t0, _spacemit_k3_warm_start
+	li	t1, C2_RVBADDR_LO_ADDR
+	sw	t0, 0(t1)
+	li	t1, C2_RVBADDR_HI_ADDR
+	srli	t0, t0, 32
+	sw	t0, 0(t1)
+
+	/* Enter WFI until the HSM starts this hart. */
+1:	wfi
+	j	1b
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
