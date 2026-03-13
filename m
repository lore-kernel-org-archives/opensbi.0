Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9DC105F7AC
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fjXUPOObYvWLLuHKFXktsj4Fdg6q4AxFcRUDLJjK1Wc=; b=awNRRsPkqB5CfA
	ndsw5BYzBuYljgQxkeTisoeYO1Pyy8YSk4irQH/NBHPuOGvkSSXIACE0bBnkBGA1gu+HjbVoBy8Ql
	tFGzpaO9fOBbUtFMyiAlb1seyrD8aA7dVsIb4z8EXNsojIqHrbT1QFe1pqBlklmsHzm3Xewsmjfq0
	8KWNLp58PEMee8aKvEdQ3CLKDxX1cmxZTHTK+f8PLnRCnlDGUi9XKQMO4hst8slhVpeZ9Nh8LiFjs
	FLkxa9KX/w8jP12V9KicQbexeORFUyiGyslWlGGTC6FNvSegpQG7m1AzVZiyBM/Ju3A10+17PcL43
	FkgURvHaENUjV38purWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12jz-00000000ISW-2iGm;
	Fri, 13 Mar 2026 13:39:47 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12jw-00000000IQt-4BOK
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 13:39:46 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2510292eec.1
        for <opensbi@lists.infradead.org>; Fri, 13 Mar 2026 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773409183; x=1774013983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGmNj4wV1iDd7N4CZTmdqWltFBr6EsvV4RvlxLxQ6fg=;
        b=IerTPoAMFVzu6rp4x4nVLnF6kj7XD4q5Y9LIKMaOXPJ+OZsJ0CVKTDsnUw7TLHLz2Z
         1+t1P77iy+o+OGOoeKmKYV/vnWn3IbPI0AupqPMDLI8gUumhvzIqQEuc8ln6OCmXmE0Q
         UQZhXRwlTFsla06jRrvO40x8HWY7+Bu2nNrsQ7jeQshDXd+RWyW5e27/EO3lQlou/GU5
         QOKMD+pisHaIxjpil6w0FMUsmssdWt+JI0oCJJnADw5GLY+bOzpqfaIFkzKbHvn+dAeq
         rzS75ryu+8dQwpu7mxEEG3Id7SZpWl/a3wMzu8cYx+WUnWYpT0qJZn1Zva/57Z6t8eBN
         FINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409183; x=1774013983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGmNj4wV1iDd7N4CZTmdqWltFBr6EsvV4RvlxLxQ6fg=;
        b=gFmB3cT/wd+elVjytU6MOFl9/nGHTNWIeXZg6rGYsKy53ql4lgaMLtyHkHSWnfMbao
         EpzVvv5TszLQEab4YW+PWd+ohz3vHT72IJkwWcvrrBYB0TIu7h31LXrsJA2YPX/pfS1q
         drsIBIG1XZ5drs3tSKwel/zcECF7EVPxTCGqsyT0wA4Miv6LVz1AGEjYHra6mXLqsorZ
         +1aotHdHyWyr6B3iIHagCulM/fRnr6sgSM86SPbVPM2eEzwDU0ZoLzxtAQ0gnstV3ktV
         rjfLDBxedgPoGfRq9YnSOE07xgRFPtx/hulqMBe3m6BLBNKmM5j+q7eTrIhw2wjZEA0o
         nsuw==
X-Gm-Message-State: AOJu0Yxb5tuuBO5K5P6HCIrzGVPsygGrVgX2drnURrvtuCIHspvIHPqT
	yDrR0lRmCSMUfVje6c2uSV61WPqAAATKK9vHe0sa+IjVUQNQp/HkHFGPhEIem8dK/qNG/7trG66
	zCvnQNMYzwNVsCVuhpYRPlwaDcGnVHOc5Nsg3fY4OaCLYtl7fZAWTUoA6reuqZK7yByzF2GcrtD
	kEpfgAc2vKkh84dahQFM4skYa9PAqpcUztNEjEFrUFiuyPQ4obUw==
X-Gm-Gg: ATEYQzyn5f40Ir6rzXs+r2rHyDA9lM7cD2cup2gxyWDbQBOp6Q9geKNwTOdWyZQQgbt
	umC9U1KCKm0B99e1XFaqFqfg2XX/mZ0y5e27vEgoavp+bPBl7o8oryGc0IF/th29OSkTUPygdlH
	e8/1l9SacTZVGrI9Hm9btGpkqe8ETNiqwcVePWPbAsjEV5Qwnd+25tekf7SCvrbbh1dHqRFe88X
	kdJnk8oimf3oL1ZVOrpYFGzla6XDdxDiBbEQiTCp2RVhkpjWKd0S8lWJziJKs/RofdqpFscAfAr
	vtVsIGDk3zxEsmqBKa01br04/YjPnNL4+CrIvh4J8D30GVsOEXpmC/2tVk5LOtZrbHqROe6MTuD
	UhCjR6WH/PGMTNp7yJexoHXMm4Dx36/KcAZNzcS0+YODECBO36sObCxXPFAMT0hXTyMZ6Tcfj+s
	gRFN5+P42iDKJ3pFZYm4FjZDlK4XOZy2+Sg98TtZ0=
X-Received: by 2002:a05:7300:578d:b0:2bd:c8a2:954 with SMTP id 5a478bee46e88-2bea558f13dmr1787116eec.24.1773409182969;
        Fri, 13 Mar 2026 06:39:42 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab57b1d2sm2441671eec.32.2026.03.13.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:39:42 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	anup@brainfault.org,
	rkrcmar@qti.qualcomm.com,
	atishp@rivosinc.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v4 0/3] Add support for RISC-V Smrnmi extension
Date: Fri, 13 Mar 2026 06:39:38 -0700
Message-ID: <20260313133941.3012966-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_063945_061171_924A3787 
X-CRM114-Status: GOOD (  12.20  )
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

This patch series adds support for the RISC-V Smrnmi (Resumable
Non-Maskable Interrupts) extension to OpenSBI.

1. PATCH 1/3: Add Smrnmi extension detection
   - Defines Smrnmi CSR registers (MNSCRATCH, MNEPC, MNCAUSE, MNSTATUS)
   - Defines MNSTATUS bit fields (NMIE, MNPV, MNPELP, MNPP)
   - Registers the Smrnmi extension in hart extension enumeration

2. PATCH 2/3: Enable Smrnmi extension handler
   - Implements rnmi_vector_init() as a static function in sbi_hart.c
   - Sets MNSCRATCH to the scratch pointer (same role as MSCRATCH)
   - Adds platform operation set_rnmi_trap_vector() for trap vector programming
   - Adds suspend/resume support for RNMI CSRs (MNSCRATCH, MNSTATUS)
   - Calls rnmi_vector_init() at the end of sbi_hart_init()
   - Note: Does not yet enable RNMI; trap vector setup deferred to Patch 3

3. PATCH 3/3: Add common NMI trap handler
   - Implements sbi_rnmi_vector assembly entry point in fw_base.S
   - Checks MNSTATUS.MNPP to distinguish S/U-mode vs M-mode interrupts
   - Uses scratch area for S/U-mode interrupts
   - Reuses existing M-mode stack for M-mode interrupts (nested RNMI)
   - Implements default sbi_rnmi_trap_handler() in C (marked __attribute__((weak)))
   - Completes rnmi_vector_init() with platform hook call and NMIE enablement

Changes in v4:
 - Added MNSTATUS.MNPELP bit definition (for Zicfilp extension)
 - Made rnmi_vector_init() a static function and removed global declaration
 - Moved rnmi_vector_init() call from sbi_init.c to end of sbi_hart_init()
 - Changed set_rnmi_trap_vector() parameter type from uintptr_t to unsigned long
 - Changed platform hook requirement from "should" to "must" in documentation
 - Simplified MNSCRATCH setup: directly use scratch pointer instead of allocating
   separate RNMI context (addresses Radim's feedback on stack space)
 - Rewrote sbi_rnmi_vector to check MNSTATUS.MNPP and reuse M-mode stack for
   nested RNMI (addresses Radim's feedback on M-mode stack reuse)
 - Removed RNMI_SAVE_REGS/RNMI_RESTORE_REGS macros in favor of explicit
   register save/restore for better control
 - Added sbi_rnmi_trap_handler() declaration in sbi_trap.h
 - Changed printf format from %016lx to PRILX macro for 32/64-bit compatibility
 - Fixed patch structure: Patch 2 now only sets up MNSCRATCH; Patch 3 completes
   the initialization with trap vector setup and NMIE enablement (ensures each
   patch can be compiled independently)
 - Marked sbi_rnmi_trap_handler() as __attribute__((weak)) to allow platform override

Changes in v3:
 - Split single patch into three-patch series per Anup's feedback:
  * PATCH 1: Add Smrnmi extension detection (without enabling NMI)
  * PATCH 2: Enable Smrnmi extension handler
  * PATCH 3: Add common NMI trap handler in fw_base.S
 - Added platform abstraction via set_rnmi_trap_vector() callback
 - Added per-HART RNMI context allocation
 - Added suspend/resume support for RNMI CSRs

Changes in v2:
 - Remove hart_smrnmi_get_allowed() and use sbi_hart_has_extension() for
   Smrnmi detection

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Nylon Chen (3):
  lib: sbi: Add Smrnmi extension detection
  lib: sbi: Enable Smrnmi extension handler
  firmware: fw_base.S: Add common NMI trap handler

 firmware/fw_base.S           | 141 +++++++++++++++++++++++++++++++++++
 include/sbi/riscv_encoding.h |  12 +++
 include/sbi/sbi_hart.h       |   2 +
 include/sbi/sbi_platform.h   |   8 ++
 include/sbi/sbi_trap.h       |  22 +++++-
 lib/sbi/sbi_hart.c           |  54 +++++++++++++-
 lib/sbi/sbi_hsm.c            |  14 ++++
 lib/sbi/sbi_trap.c           |  17 +++++
 8 files changed, 267 insertions(+), 3 deletions(-)

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
