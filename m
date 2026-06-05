Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9567CD6E74
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Z6F+ggGeMPrAsMOJMyTCVQddzDVGkUY3m+L1QCyb/U=; b=TNASNUp0cYVz4M
	hrd4ZmU7djwamSF9APIFYMdCLXBnIXUqgEw+iMnixDBiv1jl/p+N1ojpkgcgy9BBToOkYx02lzcHy
	o+2/PsMRFqwVNmmobYIRUnttZE7CvBoRGUJSuWjo36DwNfioZECyRxMzeWuuPpPT1zvxZPofNiGuL
	NpXIZhKAiatItHLM7Jb6uYC8reoAm5i+a9s3hEXYrGCIlLBLTMOCf2lewWTJEUYpxx1vKrPjpg9FU
	1E4OfOlb2pSuQZzYxdGnNVqBEcREB7wtFj5/rKGCrupVd9WbGEd46mEdfurwWqe2hkb/L0aq4NKf9
	vHinU4PuPmJwUZta421g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSol-00000000Xlp-1riR;
	Fri, 05 Jun 2026 11:34:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSoi-00000000XkW-3GXC
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84236f9b638so815116b3a.2
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659264; x=1781264064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1p4l3jO1j/Y5FOsXC6PvK11aXF0dQHYq9XydbhXfZ8=;
        b=dC9F07Y/Ib4tA3ND6ROZNY1aizHrMN0Mo3NI6hsG0s4ctLShCDFgbyhNmIQxObSFPE
         Nk2HRZ5NVRc+nxtb4DoEYySRG/suCm3cWEe5KcjxGL+NIK9G47Fj/t9ECD5/+/RYxF/t
         J0gwiswlMu3ij45g8AhMGZN6lCKsGoYhZj2zIRBwmawoV3trQsRpRKNZUxsCnVz3+d+q
         60azzGwfaOZDvYC3/gS+9aDspjBBxZ6Pa3phGjEGk3Jde2+YNSB3z+hm77ouDYZRLSyx
         hIKOaDxtJQs8qv0NG8qn7XCNGC7FKwsexIbJLi4plXvPOFzqgTIjKlI/KAv8CxvlfXEv
         porQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659264; x=1781264064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1p4l3jO1j/Y5FOsXC6PvK11aXF0dQHYq9XydbhXfZ8=;
        b=YWOmBSfaB4KRAYUdnEdeirr8wZr+dC6+QCoOBi2MwbMJBO6IRDosckzYeevrJoH2T9
         EKDpazd6F4Hl9v8iw63Ihw4BUrPgutwh3n/qqus+ueGnARxoIUJXdbBcuF2c9OFmHuNm
         Phx7kiF5dYwdIpcWttoPS+BBdt0vOGrl/bKSTps24voWdIivPRibgp9cFoDSMTG694b1
         XOvArYj5iVPf1Fupu9NAZyV+0n4yMgtRRcpG11JmHwbwqlMrgGqtQdSrOXeRku3kUu2D
         ro2zrMpHb0g7sOdCtH5XRslZ+RctGYZsvoQ+MGYOJ0oRPvhFWpMJUZQ1h21uiEK+rG4a
         vEmw==
X-Gm-Message-State: AOJu0YyCC11sgWIEvC59Kl0TkmwJyZh5gFdfX0OjZEekN4UYXhQoTT7N
	DBO6isxuuUKIfrAMXpZvF4VXL/ukeAUn+kA8TQhN5yxg+O13Syn8G5EH8k8dpA==
X-Gm-Gg: Acq92OHnUyeutKs0e9x+cfrTHWH+TPvYOyY7FxnTHnVeskyfY6GVfo8B65Fi8LIpXX3
	0WGphqwzxbcQdykSep8USfuctz0Qv5WCRWGeUgQNjJJ+5Mn0IxvnN1+gErZPGL/Hu4SjlHzcbSs
	FHXfY/QjiKhDf9B8YJYIxCPWrtxxpiBQayDOTLPQy/S9IymIXwc8cxo3XOosdoQuqArliQW3u1G
	eOZklnaUgSGxilTbb4s3Wy0Eg9zm7F2AqguRnWnpSi56uEY8UU369VKqq/Rr7xqLp1WWzAXpb35
	aHrzTmV8kd00qkvSWnTuN8ewJjkNmXAPXvQqBIPibAJQ/nrbc6cVdNXTxVftwQVpNK/Wyrq5Wak
	mBEtm8T54OIkZCNnpTQV63aAWOzNog7upyl8tqyXyUg/JAaHaSkPmJsi2Sd4/bbk0oKd/gfK16c
	HFAvbRp3YSFSD0mRsd+TFI7W8MThhlTz2qPzU=
X-Received: by 2002:a05:6a00:348a:b0:834:e092:2631 with SMTP id d2e1a72fcca58-842b0e2fb12mr3099942b3a.8.1780659263884;
        Fri, 05 Jun 2026 04:34:23 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:23 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com
Subject: [PATCH v2 0/8] Fixes for load/store misaligned and access faults
Date: Fri,  5 Jun 2026 04:32:06 -0700
Message-Id: <20260605113214.242-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043424_847662_AD5A5C7D 
X-CRM114-Status: GOOD (  13.33  )
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

Test case used is available in PATCH 8.

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
[3] https://github.com/ganboing/opensbi/tree/fix-ldst-v2
---
Changes in v2:
 - Addressed Anup's comment for PATCH 5 in v1
 - Validate load/store offset is 0 in misaligned faults w/ DEBUG build

---
Bo Gan (8):
  include: sbi: Add more mstatus and instruction encoding
  include: sbi: Add sbi_regs_prev_xlen
  include: sbi: Add GET_RDS_NUM/SET(_FP32/_FP64)_RDS macros
  include: sbi: set FS dirty in vsstatus when V=1
  lib: sbi: Do not override emulator callback for vector load/store
  Makefile: define OPENSBI_DEBUG if DEBUG builds
  lib: sbi: Rework load/store emulator instruction decoding
  [NOT-FOR-UPSTREAM] Test program for misaligned load/store

 Makefile                     |   1 +
 include/sbi/riscv_encoding.h |  21 +-
 include/sbi/riscv_fp.h       |  30 ++-
 include/sbi/sbi_platform.h   |  92 +++++--
 include/sbi/sbi_trap.h       |  59 ++++
 include/sbi/sbi_trap_ldst.h  |   4 +-
 lib/sbi/sbi_trap_ldst.c      | 510 ++++++++++++++++++++++++-----------
 lib/sbi/sbi_trap_v_ldst.c    |  25 +-
 tests/ldst.S                 | 134 +++++++++
 tests/ldst.h                 | 170 ++++++++++++
 tests/test-misaligned-ldst.c | 154 +++++++++++
 11 files changed, 994 insertions(+), 206 deletions(-)
 create mode 100644 tests/ldst.S
 create mode 100644 tests/ldst.h
 create mode 100644 tests/test-misaligned-ldst.c

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
