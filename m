Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE1606A321
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZeDPLiBp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luHjzsgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wTwclHcsRJVhjJlH36rDObLtqHo8oRvpMdFoQpTsFb0=; b=ZeDPLiBp3/bNaMsDiJtFRe8Pxz
	tMbElgIXWly75E0ine7rvS0QsuD9kAtwa2Xojwcn0QbbAcH5XxynYcA5plAIcrnzi5VXaBg6/bJtB
	+yl9upl+iCTEHdxpm7D42WTSEH9yFswtWADGZJnKRRIOm/d9XbV6B9I2jItP0KHnQZwALLhCqmqRV
	Zt/AdFsesUqARHvwrZ6yrmNEdM7Wg84/6k8mdghSelziaCxNeuLVtvQDzvtO+7YpJFPusouVblCBZ
	2tPBAsgU2H66mX2eQ5DaFmDtCMqSLXfR8VsdpIon/osNtj/2tBvjmtbacW9Mh7QdXA47dThxHE7Wb
	+O9/v7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXd-00000009iEX-1NKM;
	Thu, 29 Oct 2026 15:59:49 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXb-00000009iDM-0oFk
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 15:59:49 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5364042eecfso31853021cf.2
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289585; x=1793894385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwzHWEmDn+a1T+gpX3haqvk1ZoD7V4vO+nsrLCeIdvE=;
        b=luHjzsgz2PQ2d2PT5fs+tstcaXDTVZ9mwtGKIdZO4xObdkKGoeHRmPz/8WXl5p3tcz
         AXlsx9gTtRnTxVLh51KEi2XiyQ4n0Wl5KphsP71zy01NjTObGFNWLhYRPhiqnrVgv4lx
         bIS5pXuU5Mfjqn8oXdyu31N0EyDhRcNIC453qhnef+e3Sq15a8c42hR9wICce7wooUcv
         lCstkLbffOhdfuDFtQp2e+Dj+Iovp3EAjIX43QH8sZquNAP8bbDV9B+x/XbKSHBEF0pl
         Q+7R25bB215BH2AOHNtkIihUSCbzuqw3/6Z5GGcbW6uw1/COQDazFqptTaqOFz0oAMlH
         5yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289585; x=1793894385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwzHWEmDn+a1T+gpX3haqvk1ZoD7V4vO+nsrLCeIdvE=;
        b=TY2fCGojyBPqSle4+hnUZc2u980uzYnyXvu5Kqqk5mZ9SBrEn8RTtY0Ghkh55BW/0x
         VBeI9qjMvxoKM3qXN7vwyGmPbOp5hEWc+3xRKFOu4tCROmhF+WLaxiUjhv1fYadoAJ4u
         h80AzAi7WsTW3gYio0VWPPX2pRa+Mjmk7imqhQlWAWGnNgGu568rOKKgG3jPPQ2QQqcS
         C7GoGyoRI79fcHQD80jvKdxYRX1R95wpY8saKEQ0IZ2D8lvDOkc/ALlsiXCJ+dXQ9aX3
         RR/3vDSkNR9Oj+mk00jLwFPuDmtEurQAbQeavJEVx1fJR8iQPPKBwbbqbPIL3Ng0TgG4
         YkVw==
X-Gm-Message-State: AFq9FYIGP+DSqTTPSU2sCbR88vvKPdkZ7Xwg7opWlPT2LsEKsQgl8ZTX
	Lvmq+QW8uzSbppOiwNdoB07x3p8LAuT2Uj09EWsWa7hn/oWanLuajGIzNUP13w==
X-Gm-Gg: AYBFou21zpMaDr10DMd6Ryj0T/+/EiBNIjMqQ5zgm8QpWVih4HQdA2X9YMD1R3NhtWG
	VfF1g5Xx5Zh1SGAKqKSah31NhG7PQb+rpd3xZz95XJ2DuIVpVH3HNUItp8Zaa60LjunfQyeTVsw
	eWT8v40RnXFxP1zu3XSR/3bASUby61cuvrzkbNOx0aNxM8popw+QHi8dZnSZa26D2qtdwB3EySZ
	ynVzvBmapetQTh1CcgY4k6B0GK6vmneQ+P2zR2qU/efKqU4swM5uJasv3tfX5RixHqHCqR0lat0
	0DLz6J9qAQ/1sFdpK+069Q1n1Sdth5m+WRaft540T5s3+Vec2xjr2A4zw82ESIhn1QkbHLrnq5l
	XsCh1ScYLNJrlVvemRP5nJF6xtMfQfYAa65HrgoCUqQ98IE2oJhaiptP1CJO+NpENy6T34OO/rm
	rGMfnXKRz87c8c3jmRUml8rwVYXHf4XCXCIhtRObEChhGPFV3ROBZ4zd6B8SY49L1dx1mmX9WPX
	Upz5rUaPYwl2MhBWM+9JQIGEaQs+Tv+93AXNq0faQ8bDBBOHpIYBfev6zW+XmiR+Gvt0ad3Vm3M
	Ae1gEbyBiZlQaWerjfxb+Mp8nrWJI2m4e4E2blh9w1CX4qe+DTkZ5uFlfBstx4bSQ6CI/INbptd
	or32JMy0/12DM1A==
X-Received: by 2002:a05:622a:5285:b0:536:6c22:e346 with SMTP id d75a77b69052e-53fcd584ce7mr97645981cf.68.1793289584845;
        Thu, 29 Oct 2026 08:59:44 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:59:44 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 00/12] Introduce Virtual IRQ (VIRQ) framework
Date: Thu, 29 Oct 2026 11:59:17 -0400
Message-Id: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085947_250363_34AC68CE 
X-CRM114-Status: GOOD (  14.82  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raymond Mao <raymond.mao@riscstar.com>

This series introduces a Virtual IRQ (VIRQ) framework for OpenSBI to
support domain-aware wired interrupt couriering.

The main use case is to let OpenSBI receive a host HWIRQ in M-mode,
map it into a per-channel VIRQ number space, route it to a target
domain, notify the target S-mode payload, and let that payload
claim the pending VIRQs through RPMI SYSTEM_IRQ over SBI MPXY.

The implementation is organized as follows:

  - add RPMI SYSTEM_IRQ service support, including SYSIRQ_CLAIM
  - add an optional experimental Yield ecall for explicit completion
  - add irqchip helpers for S-mode pending notification
  - extend domain context switching to support VIRQ-driven
    cross-domain couriering and return-to-previous-domain flow
  - add the core VIRQ mapping, routing, and per-(domain,hart)
    pending queue framework
  - parse sysirq routing rules from DT under /chosen/opensbi-domains
  - derive APLIC target hart routing from sysirq nodes
  - update the irqchip/APLIC path to support deferred completion and
    per-HWIRQ APLIC targets
  - select domain boot harts before activating physical sources
  - document the DT binding and routing rules

The DT routing model is based on "opensbi,mpxy-sysirq" nodes.
Each interrupts-extended entry contributes one routed physical source,
its entry index becomes the VIRQ number within the selected
opensbi,mpxy-channel-id, and opensbi,domain selects the destination
OpenSBI domain.

Claimed sources remain masked while the payload handles their device
conditions. The next valid CLAIM completes the previous batch, or the
payload can complete it explicitly through Yield. Return to a previously
interrupted domain is deferred until pending and claimed work is drained.
The Yield EID is experimental and is not an official SBI assignment.

This version reuses the existing irqchip infrastructure.

Patch 12 contains sample DT overlays for reference only and is marked
[NOT-FOR-UPSTREAM].

The series are also placed at:
https://gitlab.com/riseproject/riscv-optee/opensbi/-/tree/rp022-m1

Test instructions are available at:
https://riscv-optee-docs-c9fea0.gitlab.io/rp022/milestone1/

Changes in v2:

  - Rebase on master and adapt to its irqchip interfaces, dropping the
    old scratch-local provider lookup workaround.
  - Replace the private VIRQ POP/COMPLETE ecall extension with RPMI
    SYSTEM_IRQ 2.0 services over SBI MPXY, including batched SYSIRQ_CLAIM.
  - Add an optional experimental Yield ecall for explicit completion
    after device handling; retain implicit completion through the next
    valid CLAIM.
  - Track outstanding claims per channel and target, preserve failed
    completions for retry, and block return switches until all pending
    and claimed work is drained.
  - Keep SEPC separate from the M-mode trap frame's MEPC and preserve
    the advanced ecall return state across domain switches.
  - Key routes by (chip_uid, hwirq), allowing identical HWIRQ numbers
    on different physical controllers without routing collisions.
  - Select boot harts during domain finalization and activate couriers
    only after boot-hart selection and all mapping/channel setup.
  - Add irqchip-independent courier registration with DT IRQ flags,
    target affinity and rollback; use APLIC IDC indices for affinity.
  - Reject malformed DT argument lists, extra IRQ specifier cells and
    invalid scalar properties; update the binding documentation.

Raymond Mao (12):
  lib: utils: add RPMI SYSTEM_IRQ service support
  lib: sbi: add experimental Yield ECALL extension
  lib: irqchip: add S-mode notification helpers
  lib: sbi: domain: support VIRQ couriering domain context switch
  lib: sbi: domain: ensure boot_hartid is assigned
  lib: sbi: Add Virtual IRQ (VIRQ) subsystem
  lib: sbi: domain: add domain lookup by name
  lib: utils: irqchip: derive APLIC targets from sysirq nodes
  lib: utils: irqchip: Add helper to register VIRQ courier handler
  lib: utils: fdt: parse sysirq routing from DT
  docs: domain: document sysirq VIRQ mapping and routing rules
  [NOT-FOR-UPSTREAM] platform: generic: Add sample dts overlays for
    testing hwirq/domain route rules

 docs/domain_support.md                        |   55 +
 include/sbi/sbi_domain.h                      |    7 +
 include/sbi/sbi_domain_context.h              |   24 +
 include/sbi/sbi_ecall_interface.h             |    6 +
 include/sbi/sbi_irqchip.h                     |    9 +
 include/sbi/sbi_virq.h                        |  513 +++++++
 include/sbi_utils/fdt/fdt_helper.h            |    8 +
 include/sbi_utils/irqchip/aplic.h             |    4 +
 include/sbi_utils/mailbox/rpmi_msgprot.h      |   25 +
 include/sbi_utils/sysirq/rpmi_sysirq.h        |   30 +
 lib/sbi/Kconfig                               |    9 +
 lib/sbi/objects.mk                            |    4 +
 lib/sbi/sbi_domain.c                          |   61 +
 lib/sbi/sbi_domain_context.c                  |  130 +-
 lib/sbi/sbi_ecall_yield.c                     |   42 +
 lib/sbi/sbi_irqchip.c                         |   21 +-
 lib/sbi/sbi_trap.c                            |   11 +
 lib/sbi/sbi_virq.c                            | 1235 +++++++++++++++++
 lib/utils/fdt/fdt_domain.c                    |  116 +-
 lib/utils/fdt/fdt_helper.c                    |   57 +-
 lib/utils/irqchip/aplic.c                     |   57 +-
 lib/utils/irqchip/fdt_irqchip_aplic.c         |  103 ++
 lib/utils/mpxy/objects.mk                     |    2 +
 lib/utils/sysirq/rpmi_sysirq.c                |  266 ++++
 platform/generic/virt/hwirq_bind_domain.dts   |  107 ++
 .../virt/hwirq_bind_domain_linux_bmapp.dts    |  125 ++
 26 files changed, 3017 insertions(+), 10 deletions(-)
 create mode 100644 include/sbi/sbi_virq.h
 create mode 100644 include/sbi_utils/sysirq/rpmi_sysirq.h
 create mode 100644 lib/sbi/sbi_ecall_yield.c
 create mode 100644 lib/sbi/sbi_virq.c
 create mode 100644 lib/utils/sysirq/rpmi_sysirq.c
 create mode 100644 platform/generic/virt/hwirq_bind_domain.dts
 create mode 100644 platform/generic/virt/hwirq_bind_domain_linux_bmapp.dts

-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
