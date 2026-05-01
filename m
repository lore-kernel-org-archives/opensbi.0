Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF43CCFA13
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AooFi0nn5VCPuQ+ChCjeBnFO/iit6zRbemigkYZIxwU=; b=J4zObdrdqTt/9t
	/IbVs1+K/RvYaUlCodswcrdYe0AJT6frAR63aQma3UBZXOkdABrLV9vJeV1qR64q/Q9ve9kPcxUyY
	pySAffyxZhuaGo5lghxqd9k+20jnshs/Zl3k/4B9Vcmi8bJ8JDOlJRMnjFccqbd0oZps+Ds5ri86W
	rPUNPYwx96744VIJtLggEpQalKPxNx8opGgLtQrOfUSPdZ7eqWY3MhXbuqgi0cFAVVrPcCfevenKg
	wAADVmBJClpUprQIIm8ZQTQbq5GesJ085FWWS6cdMoK5eS79H/qyaHHeZPqpmHGQwUPpFPL3530yE
	Z6FmLk4EWPKiV4wrsfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE5-00000007goo-02Rp;
	Fri, 01 May 2026 21:16:45 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvE3-00000007gnr-0TEr
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 21:16:44 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-12734af2cdcso165434c88.0
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 14:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1777670202; x=1778275002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gedFcuIRbcY5cKAROs+9fJm9rfpClAXKxRQDwhl0jXo=;
        b=RB44gI4g5gskh0luQtDcZg64xgwsabnrDlv66jJaobcX0L6FXZFpM918Jm0VdN5tG2
         HlP9XPnlRFoykhuNV3vqLuyJT3C8kv1vd/WAgZRP8gw4SAlcrcuWnuPF2c+TrRncgQID
         rEqF6rkpZ3lA+cwCA7KNM264U0982utvXyLqe8jVHB7oaJgNHSB7sCSZ6iASgMeoQJg0
         kbIFpEffRzk8YdtN5rWDxbww2vcRsvcFLSDjigjE4WTjADP6LklacBnog1XfeHlLihEP
         mADwC7H61ExCNty9CuoPUWb6kEUBqP4QjMdpGaIIcIc+pHzKSJklJhA+zhcYOjru9a8A
         E+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670202; x=1778275002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gedFcuIRbcY5cKAROs+9fJm9rfpClAXKxRQDwhl0jXo=;
        b=XTJcPDFWgVICOEPvp+w5/geKORotMX/lQ0fg9kO0/MbA96c9zbIaBFKnOpdTEj25kb
         dvMBRqOu6LRXo6/5x73yidg9kDPGxFabVoM5SkcSNMJFgzjHZmt3cysYjAsgi0qQJlIp
         wAlKEds6qWY8B2S81Oj6CS2Bne8VXhBXCGoUjJYs65+zLLdaSVDp23onU9WbXBKPB0aH
         LEhFn1ore6Bzx93G6VvfEcxB997eJZ33mxyqpX2EsN+K9nbQJOr/Me7M9kjlHD49XJ5+
         6HD80bVj8GpXKMfPs/VPcK9ph0w6a+a6xqGLXLMMgkb8Tfjsghn6GP5G97Q9ZErq5kJF
         /oxw==
X-Gm-Message-State: AOJu0YxIk5DCQW52YJOihrDiP7YN3Cn3jYR/bm1402l49rKsO+eqYrWA
	Gjxuo8PJZ3tygDl8uNKfKVhSalHheK1zNWLb00jUsfgxggAn+rQ9qsv+dBzumrl7MlxGmHMdyNM
	LDgOA
X-Gm-Gg: AeBDievdLL0qv0uZEmkWzZVStEtDMBg/LlVl4/gZTcTd1rsIKVeGZ22fK2m1ibwtpFf
	WfG+TUyMsUdqdQFgSqtMyFCPwQDb/zZYpZRcc2rdmHEmdTdsiNhEVpoKXwBwoYqu5OJNFLxbSxB
	TMCa/a7p6h/PF6pWvg3x766EvvOSjfpvYY6oKpRnIeHfDLcbVl5wN7istBjx77Jam+6A9aXXFBu
	HcEVrbJ3bgBEAbaJ0Dc+OzxxcvNbg26+k5j8pwegWdWPA6SzZVspXk/wOthDvtzhPybIhno10vB
	QqCWJM24eOyWqcRKNN4nIQPy5xZf/xRs4o1FHjOwZVC0jaLTKhyx7GCJBQ8rUr7GzCk654N1yqI
	Tinp+LaKkDjdNftYq8Kah0HbX5ETSHTB5eLDoKxWCFzW0O9cmq+5md+txrsRXFfTms4swQkpvSf
	8e8OsxTnLBi9S6I2JUmlCRbG3tqb7fspOPct9nyhUof6WwKsNS29S7sb2OeBVM
X-Received: by 2002:a05:7300:7fa2:b0:2bd:d8e6:90a0 with SMTP id 5a478bee46e88-2efb9d80a23mr210419eec.3.1777670201388;
        Fri, 01 May 2026 14:16:41 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b2casm5879308eec.14.2026.05.01.14.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 14:16:41 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v2 0/5] Add RISC-V Smrnmi extension support
Date: Fri,  1 May 2026 21:16:22 +0000
Message-ID: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_141643_158563_711CB241 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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

This is v2 of the Smrnmi series. Rebased on top of upstream/master at
commit 2257e9957103 ("lib: sbi_bitmap_test: add tests for bitmap_empty()").

v1 thread:
https://lore.kernel.org/opensbi/20260310183155.2186463-1-evvoevod@oss.tenstorrent.com/

Changes vs v1:

- Dropped patches 6/7 and 7/7 (Tenstorrent platform support). They will
  go through the Atlantis platform series instead.

- Dropped _rnme_handler assembly entry point, ops->rnme_handler callback
  and sbi_rnme_handler() C function. RNME path now reuses the existing
  _trap_handler since RNME is taken as a regular M-mode trap with NMIE=0.
  ops->smrnmi_handlers_init() now passes _trap_handler in place of
  _rnme_handler.

- Renamed _rnmi_handler to _trap_rnmi_handler.
- Renamed C handler to sbi_trap_rnmi_handler().

- Kept ops->rnmi_handler as the temporary RNMI dispatch mechanism, per
  the v1 discussion. Extending sbi_irqchip to support NMIs is left for
  a separate follow-up series.

Between v1 and v2, upstream introduced ecdb6c90 ("firmware: Initialize
stack guard via Zkr"). The Zkr seed-CSR access can trap if Zkr is not
implemented. On Smrnmi platforms NMIE=0 by default after reset, which
routes that trap to NMEVEC rather than MTVEC. Until Smrnmi handlers are
installed and NMIE=1, no NMEVEC handler is in place, so the early-boot
Zkr probe in _start would crash. To handle this, a new patch (4/5)
refactors the inline seed loop in fw_base.S into a callable
__stack_chk_guard_init function and invokes it from init_coldboot()
after sbi_hart_init() has installed Smrnmi handlers and set NMIE=1.

Testing: Verified on Whisper SW system simulator and on HW emulator.

Evgeny Voevodin (5):
  include: sbi_scratch: Add tmp1 scratch space for RNMI context saving
  lib: sbi: Add Smrnmi extension macros for registers and bits
  firmware: Add RNMI handler infrastructure
  lib: sbi: Create a spot to place Smrnmi detection before traps and
    after DT is ready
  lib: sbi: hart: Detect and enable Smrnmi before trap-based feature
    detection

 firmware/fw_base.S           | 188 ++++++++++++++++++++++++++++++-----
 include/sbi/riscv_encoding.h |  10 ++
 include/sbi/sbi_hart.h       |   2 +
 include/sbi/sbi_platform.h   |   8 ++
 include/sbi/sbi_scratch.h    |  11 +-
 include/sbi/sbi_trap.h       |   2 +
 lib/sbi/sbi_hart.c           |  37 +++++--
 lib/sbi/sbi_init.c           |  10 ++
 lib/sbi/sbi_trap.c           |  39 ++++++++
 9 files changed, 273 insertions(+), 34 deletions(-)


base-commit: 2257e9957103aac7df8089a59b9d4bdda7c592ce
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
