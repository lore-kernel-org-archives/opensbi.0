Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86872FD4F17
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9c5ELj74VGr+Q1jn9GAsHtL9L7SGf10Vm1mzomDxE5E=; b=FbVrmNLNnPsHI7
	pbeTpCCejFSEi3N4Ftwf6j+F7isoXBz484Mru1/xEKDzmk6btDBc8a9r20KNh107+MEXS41g/dvpi
	i7cOnbAaPL0/YaCgq0IQW9prMEXO51YrrS0LBjJkylt1XXq8GBC+98RuZHw2bJvZh+CVugNRFlv+a
	gQp/7EdMu6xmR55l28lPORg6Fo2ThgUYeqNb15sX35PfIHXkNRQDM8JTRVM26BdYkS1J4RNITNyrD
	iLZiLpyhtnFNJAOvrI8EdJXocYe6lktqNMs7bI03KE3588izw0yAuq91in5HMD/bfmEkZPv/Z5Kod
	hM5DsKTHyU26bd62GKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tW-0000000A55l-1kX0;
	Tue, 10 Mar 2026 18:33:26 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tT-0000000A54p-32wk
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:25 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2be7ded9477so53379eec.1
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167602; x=1773772402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aP5Mr++EO5TzGY/F5GB6sXA3dMc/9h+5uDRaR/wclDE=;
        b=TiKqB+KwBI5hHYWPxOpD8wXrhoNC4Y8HQe/g0AL2bPHwr/ZPuGrVIAOKZK6d9w/+T0
         W5DiyTTYA2dDMOu37vQLjua5fM4tSSzENMM7HrSN96kHp8+BhSDNI1GQ9oFG/FPWpSSX
         uVEd5zvLaVm7Cz7DJ3qCeYu7RrPMFLsQ+zucIzI4r410ymCO6Iz4S/IP9OlJiduaTDGJ
         qAfVsLxYNJtxdlRKmHUNjVSXClDM5s53L4U/cps1GAsBJRK+eCnjUizRTCZxyWw2Bf9s
         WWGFmNifIdL5fpevl+FYDdcYI5Z+oB5YwYZizj7BaFX9MUMFcnbkxCSp41ZjvGRJuSwh
         JmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167602; x=1773772402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP5Mr++EO5TzGY/F5GB6sXA3dMc/9h+5uDRaR/wclDE=;
        b=G8Vi5T/sxNspgO0XFQgK5gmfbeLYH6Ou2+/fpC0qaD2yKvxliH08jq50z01WRp7QeK
         jvHPJ6VmFDZll8/PvwK6qhkgT0YlqAudrcW1MX0ZS/SdLyev2t1kXheXdeFY7MmEdBbI
         nkKEtrspStDrEcBFP1uzdQTdS5DuHT3T+rA/gPTnIH2kw4SJITgEkBB+YTOf1E6Os5+e
         so6OifNQk7NyRg0/kUUtLuNDoUa/UZvH2oRSfQOBUU8Pyf2Q9rORqFFwSJp9G2NJ/WTT
         IbD7ZgsprZMzDjG0jfC//jDzb18MCnT09ABQ5b0VKiDmwxaOBGnRya3JgCTyfy8FP7nu
         MFjg==
X-Gm-Message-State: AOJu0YyPt+9d6rZVNC8aqMBerA2HbTMIm4RXSpZocHlxN4Vt7kpZjab+
	zx/J0Po+wZMQ8FGT9epbj9MsmBabx368Kd4ympry9vkajUcoFwkggGNiXU3F453aOShvDeQkyoP
	zZE4OWQ4=
X-Gm-Gg: ATEYQzz8nXLDID6p8YmCcvLDKI7U6Uri28BbEMujpmTvof97PmOzIO4aXjxj3bcpajq
	ZsM0EU82dAMYyVfO8oytncteULcc9SfsI2UBAE1iSaiXJlhd+F6TaABj8YBuoxjCaRD6pgZhYyW
	U+Xx8fMOh7D3vFo1tLojD5GiIFdjtOJUrE+InhNidxc/gzWNO3kt/Cz5/QWDf9XRMKce3bQKcv5
	BFyxyu9Qj//ROxb2yi/Z4tG3vrtAoN02alZIH+UGkD/crehF0beZb6ORm18i8ho7zE8haCbDm4e
	2NTfFHDBUqOTL6F6pja43mO00WAwP3z93OnW7H+g+qomJ4QijDJVRhqDLyw16a3nEeJl3HpFeS7
	12VoRRQzGO8gVdAEYcLJobjOppQFZIaYdqIOTOgP2xhCU8SPEu0PD48AQuFmtya3h0SvmyN/BAP
	3aaDqWScUGDt//HAeibwYt3ZFTwfI=
X-Received: by 2002:a05:7301:fa13:b0:2be:80c4:2c60 with SMTP id 5a478bee46e88-2be80c43508mr606156eec.8.1773167602178;
        Tue, 10 Mar 2026 11:33:22 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82316bsm14378316eec.7.2026.03.10.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:21 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 0/7] Add RISC-V Smrnmi extension support
Date: Tue, 10 Mar 2026 18:31:48 +0000
Message-ID: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113323_776015_03DFA7EC 
X-CRM114-Status: UNSURE (   9.51  )
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

From: Evgeny Voevodin <evvoevod@tenstorrent.com>

This patch series implements support for the RISC-V Smrnmi (Resumable
Non-Maskable Interrupts) extension in OpenSBI.

This series is based on top of the Tenstorrent Atlantis platform patch series:
https://lore.kernel.org/opensbi/20260310005000.3837512-1-npiggin@gmail.com/T/#t

The Smrnmi extension provides:
- Resumable NMI (RNMI) support with dedicated MNEPC/MNSTATUS/MNCAUSE CSRs
- Resumable NMI Exception (RNME) handling for traps occurring with NMIE=0
- Implementation-defined NMI vector locations via NMIVEC/NMEVEC

Key implementation details:
- Adds infrastructure for RNMI/RNME handlers in firmware assembly (fw_base.S)
- Provides platform callback interface for custom NMI handler installation
- Detects and enables Smrnmi early, before trap-based feature detection
- Ensures trap-based CSR probing works correctly with NMIs enabled
- Adds stub handler for Tenstorrent Atlantis platform

Testing: Verified on virtual Whisper platform.

Evgeny Voevodin (7):
  include: sbi_scratch: Add tmp1 scratch space for RNMI context saving
  lib: sbi: Add Smrnmi extension macros for registers and bits
  firmware: Add RNMI/RNME handler infrastructure
  lib: sbi: Introduce smrnmi_handlers_init() callback for platform code
  lib: sbi: hart: Detect and enable Smrnmi before trap-based feature
    detection
  platform: tenstorrent: ascalon: Introduce Smrnmi handlers init
    callback
  platform: tenstorrent: Add Smrnmi support for Atlantis

 firmware/fw_base.S                            | 159 +++++++++++++++++-
 include/sbi/riscv_encoding.h                  |  10 ++
 include/sbi/sbi_hart.h                        |   2 +
 include/sbi/sbi_platform.h                    |  18 ++
 include/sbi/sbi_scratch.h                     |  11 +-
 include/sbi/sbi_trap.h                        |   4 +
 lib/sbi/sbi_hart.c                            |  35 +++-
 lib/sbi/sbi_trap.c                            |  70 ++++++++
 .../generic/include/tenstorrent/ascalon.h     |  10 ++
 platform/generic/tenstorrent/ascalon.c        |  11 ++
 platform/generic/tenstorrent/atlantis.c       |  16 ++
 11 files changed, 336 insertions(+), 10 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
