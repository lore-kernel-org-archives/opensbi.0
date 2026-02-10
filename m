Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD41EA3F2F
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3FlDISwIbLY1Y+XFuMwCsWMiYiVA6Urx9X1Ae4DxcM=; b=yFMj11FBRFXdeq
	LpHpZ9T1YnuvZ49rTP5FrgOF5gePpmG5dGiWFclTfw6xAZejc4HRD6pZV1C7QYddTdZXXQ1l+vww/
	Spki/2qVEDCUnlLcljeKVBXD2QNSEHqf0dCPTPqBO3vfoKEnOKT0RHvqsridtcGiGNsTNkJf9deLY
	elA+ya4FGgsLBk8pOaRMZQwau/YA/CmyJcr8ftjw8aYotAEMzUNYgiPBm7tzuEGwPjyC78h72Ubrn
	jFaTRAJMjGv316gh0Y45dI6pp4W3fu7y8fPovokRemjMjXjGDctoQ9vBdUZtY4PxLfoBj0YupnAL2
	0qzJk86cSuSx071gbIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGh-0000000GlWp-0srr;
	Tue, 10 Feb 2026 09:42:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGe-0000000GlVn-0PVO
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 09:42:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a91215c158so4832855ad.0
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716566; x=1771321366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGR7lirTgLKQxGdn88rUhQCecqu4BT9uGtDXpZyXtWU=;
        b=IK2M8NRp6beoYGT/XDsNxKd9qMRahDKp4dQh7kGdV11w82RQZLjo3aGQvVDMNUPfIH
         uvakY/VqwXDobSD04goxuPEJfp35MdC+gEHmeYOW4JDRYQqPZ5QQ1uYmvWYw4eFJ3qA9
         qKK83VmxtvfOxjnBgI0dSQwXW6569BWJhsW0fXFChvFgV8jrS7oKUN01RE8cB7xq3wYQ
         OBJ4j/a2bLK+Mq/sOoyuZ6zK0nTzSRi/pflNriwIhWxr8zkdFC5tf/tTje+1sX1cC188
         arfxhs+QQIbdkdy1cS+8QqZHECm6mCcyGP2QJvn2aj1PmOn0XbNZN/ZRFsO8UqTNutTU
         AeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716566; x=1771321366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGR7lirTgLKQxGdn88rUhQCecqu4BT9uGtDXpZyXtWU=;
        b=UA/TfYkUZqQJemgzW/gD+Y4g/e21WvRekSM4x/NNU5aX1bYTT+vSJOUX/yqyxo08te
         vz1Bd/Pk61090FnYxlkuTR6HzTrnb9/O040ZjqjiRXI6zIR5ZIgEkESskzNZiX7nIKuD
         9WlBEynq5DknShhhENURkJA35EEEt3hth9VuWs0yP4CH/401QwTrKI5rN6N9GB9OBvg0
         fb8erFJ+vE3tvwMcEuXye9RuXExSz0XSi89Zz3ut7unSlv+0TM3HwG8Iz9VShQ6qklXF
         ZXNpZvYGFI4+Qqo8lrTFKtt9pdlKRKA0iyjMmSxTqiH0aLuIaTjKOdYHsOFuZaDm4AOf
         FG8Q==
X-Gm-Message-State: AOJu0YwOUnbaZUm1n5wX8k+3BwYVVsSmw5qWOrcXqIlsaKXKsropVsX/
	xds2UqxZUwuNkODrE9EMazFA9D+FRNZgxAN44/YnNsC8gjkwXkMe81KcqanxBA==
X-Gm-Gg: AZuq6aJ9uS7gRuw7RTy53qTyX9pfKkdI8bkNx5htWBRBW0+Xw1KKe3gYmvtI80MI6WX
	i6jIrK5BYYWKlQXW2yO0MruLtsOciPTQj0IruhK7k39mul6NN0QTrHtqmwVH+/9372SpJLqcG+G
	gBaxULtE7oykwC2AGTJGt4jEVH1bl6+oHrIwJM/BIUCMCFsU5z36cwOqOOYGPEBCRMpvokyT2KD
	R7MbVz/3keTZI166bikUz/sqq2ekAZ9DDVbGt2tRqCqPlfk1TozOmCJUaNytM2IQZMfeWm1IuUc
	rkXK5Mysvg6xgLSWdkPMW+EzDiXEO2zPl9Nwp78GAGJVlVP0T9ys58SLuUJRXPF1COWnt6Bz1L1
	aomrxmMBe4RtPIEMqn6Ti+FDU6VnC1TjQj29UJvB6QawI245q6i9pbmTOfzyARWdWfSuB8QW7Ix
	RzIopN1zpKoWz+QnjN4dBF1Elc
X-Received: by 2002:a17:902:f687:b0:2a7:d5c0:c659 with SMTP id d9443c01a7336-2a95160bfa3mr150883715ad.5.1770716566231;
        Tue, 10 Feb 2026 01:42:46 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm133219215ad.61.2026.02.10.01.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:42:45 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	dramforever@live.com,
	anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org,
	cleger@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH 0/7] Fixes for load/store misaligned and access faults
Date: Tue, 10 Feb 2026 01:40:37 -0800
Message-Id: <20260210094044.72591-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014248_135704_E03B4A9B 
X-CRM114-Status: GOOD (  12.38  )
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

Re-visit the load/store misaligned and access fault handlers to fix
issues related to coding patterns, floating-point state, and instruction
decoding:

 a. Vector misaligned load/store emulator is invoked improperly
 b. vsstatus.FS is not set dirty when V=1
 c. No checking of previous XLEN, resulting in wrong insn decoding
 d. Load/Store base address is wrongly assumed to be trap address
 e. High 32-bits of tinst needs to be checked against 0

The pathset is validated on a modified QEMU[1] that exposed misaligned
faults, and QEMU[2], which further disabled the insn transformation.
[2] covers more insn decoding branches, including the particular ones
which can trigger the wrong decoding (c)

The patchset is also validated on Sifive P550 core (ESWIN EIC7700),
which is RV64-only in M/(V)S/(V)U, no HW misaligned support, no vector,
and mtinst always 0. Refer to [3] for the git repo/branch that has all
6 patches applied along with the test case that exercises all integer
and floating-point load/store instructions.

Test case used is available in PATCH 7.

There's no change to the behavior of the vector misaligned load/store
handler. However, I've found additional issues with them:

 - `uint8_t mask[VLEN_MAX / 8]` in sbi_trap_v_ldst.c is 8KB, which
   can overflow the default 4KB stack.
 - tinst should be zero'ed out to not confuse previous mode when
   redirecting faults, otherwise the vector insn can be mistaken
   as a regular load/store.
 - VS in previous mode must be set dirty for loads.

These will be addressed in follow-up patches.

[1] https://github.com/ganboing/qemu/tree/ganboing-misalign
[2] https://github.com/ganboing/qemu/tree/ganboing-misalign-no-tinst
[3] https://github.com/ganboing/opensbi/tree/fix-ldst-v1

Bo Gan (7):
  include: sbi: Add more mstatus and instruction encoding
  include: sbi: Add sbi_regs_prev_xlen
  include: sbi: Add GET_RDS_NUM/SET(_FP32/_FP64)_RDS macros
  include: sbi: set FS dirty in vsstatus when V=1
  lib: sbi: Do not override emulator callback for vector load/store
  lib: sbi: Rework load/store emulator instruction decoding
  [NOT-FOR-UPSTREAM] Test program for misaligned load/store

 include/sbi/riscv_encoding.h |  21 +-
 include/sbi/riscv_fp.h       |  30 ++-
 include/sbi/sbi_platform.h   |  92 ++++---
 include/sbi/sbi_trap.h       |  59 ++++
 include/sbi/sbi_trap_ldst.h  |   4 +-
 lib/sbi/sbi_trap_ldst.c      | 502 ++++++++++++++++++++++++-----------
 lib/sbi/sbi_trap_v_ldst.c    |  25 +-
 tests/ldst.S                 | 134 ++++++++++
 tests/ldst.h                 | 170 ++++++++++++
 tests/test-misaligned-ldst.c | 154 +++++++++++
 10 files changed, 986 insertions(+), 205 deletions(-)
 create mode 100644 tests/ldst.S
 create mode 100644 tests/ldst.h
 create mode 100644 tests/test-misaligned-ldst.c

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
