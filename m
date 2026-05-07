Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3217CD3447
	for <opensbi@archiver.kernel.org>; Thu,  7 May 2026 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m725UWfPuBYn9AVFpygJVk9vsSsJgf0IXJD7f6wuEJI=; b=jTCI6FcJWYg5zT
	JPSJlQT1Z1+hHPTOZL8Wi9t2FM44bWwbEh39MKUTkvvLvzl9qFmmnGmFdpWAfhN5U/RrU0lfahqqT
	wvSSJ1pQBPRhBb8pKAGt1hBsui+OKjpb44ZNYz2ck8uT9HxvI1iagZRyvh82T7E59G+1HRlUkP76z
	qtIToFmnVHEqJjco+54C8EB7PU6QxBsT9U/YAgh5LQY0f7b8CS/8oCNVNvsB0TPj8flJqHp613BHB
	uyrQj6MzVa2lXOC/ljYeY/4PScNU/42kzAomLXCfrqE5WpEH3E04OhnQZ38oC9p2f8ubVa39I/k6o
	X/aioComYEpN8Cvay9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39K-00000004YQC-3pqv;
	Thu, 07 May 2026 18:08:38 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL39F-00000004YPF-1qou
	for opensbi@lists.infradead.org;
	Thu, 07 May 2026 18:08:34 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2f13ae64db1so52323eec.3
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 11:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778177312; x=1778782112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJxJFmaHNHCfQ3mxD9OFPbR26ioQRYPLXrfIRkXgnow=;
        b=hQhoRgAZN3QVMm9tlzKUjycaQ300AlxUJP7wLnFROp1ljiIf3nONXEOPQNix+no9xL
         D2j/0qH/uXjfOjGBdk3KuIPoF9Wek6LeOQzKO81lDpcQIZUEVLsoasni+/IR0TEXKjlb
         vtqBZTsQ8yDUGJGg9UWsVZgVu5XN1goHI/6H2wf34fXVXhrRRnUvqj2qtjDNQQJp3kVh
         rf9g+zR+/vCBX4WxJzdtTIcDx8yhFveV1l5qgjzI2LOceUvQVtA+c6vuh5fqZBkRyTed
         28+wJfOeeci1KlYEJCMxC+L+p98ROANPGT3OzVkJzRvesPBvfWumicIFnUOY2NG8vHhv
         bk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177312; x=1778782112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJxJFmaHNHCfQ3mxD9OFPbR26ioQRYPLXrfIRkXgnow=;
        b=sdZQ/5ttX2yToibKYJRRPnSi4doxepc4nEzagj70LEiq+7jkHzy3DTlk59GP4oQTve
         1fdqC6V/tn0qUrVd8fMaASZho2Baz4GT6F6005IVjcYR4BuG9+VX9SP0O89d/anQW7G5
         owVJzd4R4g4kO8AvpUMo/P6KwTtqkMGEJvX8redXcqKQWf6FUcGSQFH+KYy4B/zia/FX
         qMI9VP1doTOJFzL5SxL0z3KJ+zqkoODJwnlsWARyCU5Mo9eyOrmvPsGDY6cRghR4p6lS
         L/m7f8tRT7GARDizS4EtRTyeL8UllnkaZsBsFYjGvprrjcFM5x9o8EyK6hxZcI2LGjpz
         PACA==
X-Gm-Message-State: AOJu0Ywd0jaWa4lRJIEsGejYhvH19+2l+W1YYHTmR57YQhwZ27K4zM9q
	uo+T9LfaE1T4EyrpmbBNodWy3SP2PS5Yp/s49r+j2fOSwoKMkl/Zu/FPKhGDxl5sDQs=
X-Gm-Gg: Acq92OHvJRNQ8QhfEp0kMgEYjlWSkEeMUYN4Ucm1AT8CDxsUPKfzdveaW4vno/07oME
	T9Q5WiXsEfJY6ASAK44WFEPOd6EJvgr37+iO5BW8T3jQpI+BA9FZ6QODigbHKCAwU0bcTBiE/Lh
	U5mRi9ailUIYpayWVIL8dNTxThBtVb0vdCvpHA32Gx3CFeQuNFQYfVgxYiV54OIMGBp37dpVZSD
	wQ+mj/43qTiOinVhOUmpRKW66G79WgWQhwvqDTrhqC/lKTTkidojZoDZXNjRsMT4uwcqh24PMJV
	mkIq+an1vVf5W+/jVg3izpybIaX0dHKjXAfFjJ7Sa0bt43cI6Aiy6yiIQ2+qkNy0+WVMeIxy2FS
	akRpfqx/xy+dfKST7aRFI31W15ahhcf/ZlfUTA/w1+ljL+6CvQANXSSOjV+BcpeNnIsmxUWQHx6
	WcLNfGHBvpjIOQEtyzptP9z3D+7qIYOntPXuu3x/ATTWUCALGvOg==
X-Received: by 2002:a05:7300:ec11:b0:2f0:ddce:8468 with SMTP id 5a478bee46e88-2f54c77cb43mr1957365eec.8.1778177311742;
        Thu, 07 May 2026 11:08:31 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82b5636besm78285eec.2.2026.05.07.11.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:08:31 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	evvoevod@tenstorrent.com
Subject: [PATCH v3 0/6] Add RNMI handler infrastructure for Smrnmi extension
Date: Thu,  7 May 2026 18:08:01 +0000
Message-ID: <cover.1778176768.git.evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110833_655895_239B8FCD 
X-CRM114-Status: UNSURE (   6.56  )
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

This is v3 of the Smrnmi series. Based on upstream/master at commit
2257e9957103 ("lib: sbi_bitmap_test: add tests for bitmap_empty()").

v1 thread:
https://lore.kernel.org/opensbi/20260310183155.2186463-1-evvoevod@oss.tenstorrent.com/

v2 thread:
https://lore.kernel.org/opensbi/20260501211627.3293126-1-evvoevod@tenstorrent.com/

Changes vs v2:

- Split former patch 4 ("Create a spot ...") into two patches per
  Anup's review:
    * Patch 4 only moves sbi_platform_extensions_init() to the
      beginning of hart_detect_features().
    * Patch 5 moves Zkr stack-guard initialization out of fw_base.S
      into init_coldboot() in C, drops the asm
      __stack_chk_guard_init() helper.

Testing: Verified on Whisper SW system simulator and on HW emulator.

Evgeny Voevodin (6):
  include: sbi_scratch: Add tmp1 scratch space for RNMI context saving
  lib: sbi: Add Smrnmi extension macros for registers and bits
  firmware: Add RNMI handler infrastructure
  lib: sbi: hart: Move device tree features detection before trap-based
    checks
  lib: sbi: Move Zkr entropy initialization from fw_base.S to
    init_coldboot
  lib: sbi: hart: Detect and enable Smrnmi before trap-based feature
    detection

 firmware/fw_base.S           | 156 +++++++++++++++++++++++++++--------
 include/sbi/riscv_encoding.h |  10 +++
 include/sbi/sbi_hart.h       |   2 +
 include/sbi/sbi_platform.h   |   8 ++
 include/sbi/sbi_scratch.h    |  11 ++-
 include/sbi/sbi_trap.h       |   2 +
 lib/sbi/sbi_hart.c           |  37 +++++++--
 lib/sbi/sbi_init.c           |  31 +++++++
 lib/sbi/sbi_trap.c           |  39 +++++++++
 9 files changed, 254 insertions(+), 42 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
