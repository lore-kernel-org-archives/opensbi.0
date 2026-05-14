Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93EECD4F25
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xhhk3TU4K/ex/CX/cqmJyTcmZX5Z34MMCD0InUv1B1w=; b=eu0Ql3+biwfi1c
	OHq8kwKGAeBzsGgOlt3lH1bPqZMee9pDD/syXMzBqVDSZYYsFWbrHsZwsdtB3xzhM5XWDrISNLQT+
	EXvUI+sKbAVgc+GSnDejrEOAUCZn77W4NhiWsNkUhT04mGONIBSW+lPjebFeZA7f7L6D+bjqDBokX
	QrgSngoJ53ng8D7jyJkpA1mjhJ6sQNIFb7RoL+ebBdmqvVMlBAnPTs0D+AVjEVifQKq+jzI2/lxWx
	pgmnnefdH4tdlXjRHwSq6026xh+VRo8jVwGrbn9R4o/5hXZhy50ZtvWppMztMJ/Aw7l8PS5ylGHFX
	dWViru2hVmRfVqYipY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0Q-00000006lv8-2PRv;
	Thu, 14 May 2026 22:58:14 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0N-00000006luH-34Ke
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:13 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8b3fe2f19a4so81596486d6.2
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799490; x=1779404290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6B9ceZB0pPAgjl1YXosYpuwp6TSTmJgbYcHeAEZ+5x8=;
        b=l3gCdFBCLJTGAl1iyGichHQcdVEgtvQYvXFj33y709wcTD61ZPn3jG/yg8Zq0P2LGU
         jDe4YLp+62JxxPRy3qXrfjtStgdMYJAuRmufWkLIxvV/aJ4ruqmbziCcZI5uXy/Mrdky
         hdRGdp4Dhmgw6L41OR7pEjMsx7QIcliqpZwc1VZiNBpbUMbxhG1o7/j7QQ/V7ifku7pG
         xeSaTPqYp0Wc70EVnpgFeerceqwOS53CO5ND89cdUhzvige28fIyk3XNK94Faz8aLZpH
         oRhYC1PjFH/I9kCfKObAqtqWjbw2S7KoEH8zOvHRE7gYwukJ1C0QPKh5Kq+zL02J7kWU
         xWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799490; x=1779404290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B9ceZB0pPAgjl1YXosYpuwp6TSTmJgbYcHeAEZ+5x8=;
        b=j/p4S4/lTFEgMN6AQL1DAO756t4nZmpQLbxRsY/Je2M8blrmdrht7aQbH3ey1/M3n0
         C6CPEXLPjyZ+6LvUoz0AltecKvw+0K5SV2A/9FV2JMzJuBdVqMvTDJVN1m0ebbpBQtb4
         y3MslIcqIIssrq5/kNWMDQL1eYjDUfJRmT94v9xaET3dyt51MeGfFbmStcFMF7tqTrxW
         8DJcb4DDDzJAArEZYj5ZTgxVi0OlAN8OYdGWHWbous1zS15PXV5u3OC9kTWT90c12T4v
         7cAyv8PGYgEy4zr/waLSZnPMSd6VxVIUwY/xiktNBwl/oqAtHWU3SmGaHnMb26qHgNSG
         GBBQ==
X-Gm-Message-State: AOJu0Ywyurha477v6MTzE5j9sqCN0i/coWJDrPLA+hh99ejqeXbysC/v
	aCEWTdzkzmcbu0nOB1Z0Zus2DsdLeDtkPww233qd3EruL7ZGhY1N+w1fic5g+g==
X-Gm-Gg: Acq92OEYtxfsBfdz66F+F1a4N76hWCcOM8d1Q/41KrVhC76rkyr7O5y/bPtTubYWcq0
	9zQzD6MFFfV8fFLlUUJN88zQ/yaPFd+ahWzI0CpHsJzlexPUKf5VxEJb2ZPu7+bay2CdwuDs1F3
	DCNwssCiK1mKL2b2SZLeSrVja8GZ5i0lVDSaw17ZOLYv+I+uFY6I3nf95N94S+J+UWxIDUAgnM9
	8sf+CLB85ScxuAcF1G35Q+ZHY4ktie6xM0t2hob85hr6+fELZuz7mcxxweKw512t2C1N8EcsPfO
	Zt+UV1/6kktsG4s5CSnkbueEwfD/Xkjq6Jv4J3TEB7RNttyIUcaxQwBqzDWPJbc4Kw5k/mDz3UR
	x/QVYWVDU0k4h9VUCjxeaD3B9bg9bHE9o+b1cTVja6Op3IJPq5OdRbUOSF2f11IDaVuBsOEXIEE
	/bF7QoDd4TOJoT3busDx8DEZNKNZilscTLhiXZKhXXsEznmPaR4sQZ+OCf9bKw0ylM9P0BKpGDs
	RaqoW7l8zc=
X-Received: by 2002:a05:6214:3290:b0:89c:ac72:2f6e with SMTP id 6a1803df08f44-8ca0f6e1bd3mr27407076d6.43.1778799490034;
        Thu, 14 May 2026 15:58:10 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:09 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 00/10] Introduce Virtual IRQ (VIRQ) framework
Date: Thu, 14 May 2026 18:57:46 -0400
Message-Id: <20260514225756.2255758-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155811_813531_EEE1F490 
X-CRM114-Status: GOOD (  13.21  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

This series introduces a Virtual IRQ (VIRQ) framework for OpenSBI to
support domain-aware wired interrupt couriering.

The main use case is to let OpenSBI receive a host HWIRQ in M-mode,
map it into a per-channel VIRQ number space, route it to a target
domain, notify the target S-mode payload, and let that payload
pop/complete the pending VIRQ through an SBI ecall interface.

The implementation is organized as follows:

  - add irqchip helpers for S-mode pending notification
  - extend domain context switching to support VIRQ-driven
    cross-domain couriering and return-to-previous-domain flow
  - add the core VIRQ mapping, routing, and per-(domain,hart)
    pending queue framework
  - add a VIRQ vendor ecall extension for POP and COMPLETE
  - parse sysirq routing rules from DT under /chosen/opensbi-domains
  - derive APLIC target hart routing from sysirq nodes
  - update the irqchip/APLIC path to support deferred completion and
    per-HWIRQ APLIC targets
  - document the DT binding and routing rules

The DT routing model is based on "opensbi,mpxy-sysirq" nodes.
Each interrupts-extended entry contributes one routed physical source,
its entry index becomes the VIRQ number within the selected
opensbi,mpxy-channel-id, and opensbi,domain selects the destination
OpenSBI domain.

This series depends on a previous patch set:
[PATCH v2 1/3] lib: utils: irqchip: implement APLIC hwirq operation hooks
https://lore.kernel.org/opensbi/20260504171342.1655882-1-raymondmaoca@gmail.com/#t

Raymond Mao (10):
  lib: irqchip: add S-mode notification helpers
  lib: sbi: domain: adaptation for supporting VIRQ couriering domain
    context switch
  lib: sbi: Add Virtual IRQ (VIRQ) subsystem
  lib: sbi: Add VIRQ ecall extension
  lib: sbi: domain: add domain lookup by name
  lib: utils: fdt: parse sysirq routing from DT
  lib: utils: irqchip: derive APLIC targets from sysirq nodes
  lib: irqchip: support deferred completion and per-HWIRQ APLIC targets
  lib: sbi: domain: ensure boot_hartid is assigned
  docs: domain: document sysirq VIRQ mapping and routing rules

 docs/domain_support.md                |   63 ++
 include/sbi/sbi_domain.h              |    7 +
 include/sbi/sbi_domain_context.h      |   24 +
 include/sbi/sbi_ecall_interface.h     |   26 +
 include/sbi/sbi_irqchip.h             |   24 +
 include/sbi/sbi_virq.h                |  492 +++++++++++
 include/sbi_utils/fdt/fdt_helper.h    |   17 +
 include/sbi_utils/irqchip/aplic.h     |    1 +
 lib/sbi/Kconfig                       |   10 +
 lib/sbi/objects.mk                    |    4 +
 lib/sbi/sbi_domain.c                  |   49 ++
 lib/sbi/sbi_domain_context.c          |  152 +++-
 lib/sbi/sbi_ecall_virq.c              |   56 ++
 lib/sbi/sbi_irqchip.c                 |   39 +-
 lib/sbi/sbi_trap.c                    |   16 +
 lib/sbi/sbi_virq.c                    | 1136 +++++++++++++++++++++++++
 lib/utils/fdt/fdt_domain.c            |  119 ++-
 lib/utils/fdt/fdt_helper.c            |   49 ++
 lib/utils/irqchip/aplic.c             |   60 +-
 lib/utils/irqchip/fdt_irqchip_aplic.c |  103 +++
 20 files changed, 2429 insertions(+), 18 deletions(-)
 create mode 100644 include/sbi/sbi_virq.h
 create mode 100644 lib/sbi/sbi_ecall_virq.c
 create mode 100644 lib/sbi/sbi_virq.c

-- 
2.25.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
