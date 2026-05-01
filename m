Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0591CCCFA13
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 18:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZmj6mlJvCBG9t3LD8ssTugcR6+bIUuOp/c56WYn3nc=; b=jjfCD4pDmaKiY0
	rn7/qT4WwCQFtnVTNkgCntHJ2y9eVgiD+/LgHePkBjxlN0S+kz4S/qM3076Yxb7DmSondzaztCyPV
	O4Zw4iWVJoi7UbLEHdXChd+E47QUsLkXfCz8wOGEQU6is8S2AQ8yPDCp8zXQcmLy8QhSobrb7DBvB
	fcGb6db1FA5Xn79zfKs3E+IECeS1KEBNfkhfpRxD05osUycsB5zcO7iMluV+oqDVYLaSerDaCKdqu
	j66bNpHdVZrcr1tu4XRB4mKD+Ocr+SIpzPh6swtNtfHQfLLMKe5gDtvuIGqauzd5f5cLFF+mGQhy9
	/z8fSCs40/gNU9tv3kYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgj-00000007ZjL-1zqa;
	Fri, 01 May 2026 18:34:09 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsgh-00000007Ziw-139d
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 18:34:08 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so36141636d6.2
        for <opensbi@lists.infradead.org>; Fri, 01 May 2026 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777660445; x=1778265245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNGh7Aub9Rn17YKM8Unb+N+feNetq1GNPpKoCJBGsKk=;
        b=kGjTis+c4d1VoEdn1iMPIQ30gZKMx1Lyyj08SBrEO0AOHPTPV40GBz2K87qFQgbr7/
         LYlCFXyY8tTVoMi7G1UMvsUyxDDx5BmxozvTMjv1usLuQF0Qw+ALEcHFokqjWFARaRNj
         564KFdpxAKJE9XhysNWu+f0QvVp1vVZmsdt1aBMScBKaf0QEGl3lwyG9AsXkCJbGjYP3
         d2/zmaRzpbXJXY7IUJBfZd3mr9qG1iku4w4ieLerXLkNiex6H+l6IYfd1shbkPoiz/Po
         jBMQBv6ASmoeBvf9ydwtn79dCyqkmiCKfh9vyQj3GnDZI/oP94jhnqOaFfElAPSs+th4
         icaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660445; x=1778265245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNGh7Aub9Rn17YKM8Unb+N+feNetq1GNPpKoCJBGsKk=;
        b=kH6aOZ0/jUGUxE8UdaZS68r/1vZWzJpzRqwBxgVTgaGfcQf5PYljGJyHDZcbAzUFhM
         1TdeydKygQfPpqGrObKJeFX66ZKPIxPvrs9KnqRnBzQtA4d9RdUFJlbCuPLkcHnZ7xKr
         /8y75HcDIBt5SNenf6H3ESbDba+YltGbv/lOUH7jMprNlO+zREwauCi+prokLnFRUhy9
         r/Xr9NJUcWUtecKbkLSP0Kr1hOQNx3hpnMqyUK+O2QfMYBCBbs/kdKVePqGTsOVrdQjj
         O5Po66Jq7r3Gw6qDuUJ58ApEGzdeJUf89EaUZhya0xQnF7m27OCeG1taTRsMEOa69HaA
         X9gg==
X-Gm-Message-State: AOJu0Yw0OXR0FCyvrg26q0m4pHWvX7FFZZNRUImVe6cQz+lyGsHDVA4f
	kn1gVQV1HiFLYS3Le7VhLopbgokyu7SP1r9g7y5cq+FAQUFHZos/Co6KEemqTybW
X-Gm-Gg: AeBDieswE9ielEn2pJoebkM73kryEzUal7lAVSlv7/soX2fvCjgS0XIRFNv8YJcMa/0
	slDC7T8tZ4JucrCRj1STHxjyjrvGuRbs83lp0u/bfRP5JoM4dK+YobXdGsY/OGzD4Z5VtH2YH6R
	GzVJPqWZsXwVWud4abDKP18NsEQIsOEQ/+9gIqI+Gw03ETZPLLAeybJ8jDA4fwDGcDgp/ZVh6dm
	9vAWAg55eItiX6USJAdcHjzgeyk1wUe4qH1qIDtNprXCz0POKSyzi37k2wYGoDIcI04tQXar3T1
	BX9n6b5V0UMEGHuoJTrsWWAuf7tsYSAn+yKVEgZrA6Ua7sKkunXqDc1oQGnxITxn75IP15ylIgt
	JgS69blMmdu81YB5G+nFmHqDeKOE6kCEpVi7S7uIIJjsuKkNA2gylAEB2Dmdm2r9I2E0glMy/Ec
	IAGNFolq7t/3Jpx4nD+lOJ+4CpcDOo0sfvJ76GTdVHNH5vGpeCzPwndqTTHIbyRqmVIhCKfKJ/X
	pMb4pEWexc8d1x72czWXQ==
X-Received: by 2002:a05:6214:21c7:b0:89a:116b:e67d with SMTP id 6a1803df08f44-8b668c10b2emr11386756d6.37.1777660444861;
        Fri, 01 May 2026 11:34:04 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dceddsm29696886d6.30.2026.05.01.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:34:04 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] Add QEMU virt WorldGuard support on top of HWISO
Date: Fri,  1 May 2026 14:33:43 -0400
Message-Id: <20260501183346.1596027-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_113407_301704_C6E92790 
X-CRM114-Status: GOOD (  11.02  )
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

This series adds an WorldGuard implementation for OpenSBI on top of
previous hardware-isolation framework (HWISO) RFC [1].

The goal is to let OpenSBI program platform WorldGuard checker state
at boot and reprogram WorldGuard hart state during domain transitions.
The current RFC targets the QEMU virt WorldGuard model on top of the
proposed generic HWISO hooks.

This series does the following:
1. Add the WorldGuard CSR definitions and hart extension flags needed
   to detect support for MLWID, MWIDDELEG, and SLWID.
2. Document the HWISO/WorldGuard DT bindings and add a QEMU virt
   overlay example for domain WID/WID list assignment and checker
   permissions.
3. Add a QEMU virt WorldGuard HWISO mechanism that:
   - parses checker topology and protected resource permissions from
     DT
   - programs wgChecker MMIO state at boot
   - parses per-hart default WorldGuard execution state
   - parses per-domain WorldGuard metadata
   - reprograms MLWID, MWIDDELEG, and SLWID on domain transitions

[1] [RFC PATCH] sbi: add hardware isolation abstraction framework
https://lore.kernel.org/opensbi/20260317201849.903071-1-raymondmaoca@gmail.com/

Raymond Mao (3):
  hart: add WorldGuard CSR IDs and hart extension flags
  docs: document hwiso WorldGuard DT bindings and add QEMU overlay
    example
  platform: virt: add QEMU virt WorldGuard hwiso mechanism

 docs/domain_support.md                        |  159 +++
 include/sbi/riscv_encoding.h                  |    3 +
 include/sbi/sbi_hart.h                        |    4 +
 lib/sbi/sbi_hart.c                            |    2 +
 platform/generic/include/qemu_virt_wg.h       |   60 +
 platform/generic/objects.mk                   |    1 +
 platform/generic/platform.c                   |   11 +
 .../generic/virt/qemu-virt-hwiso-overlay.dts  |  120 ++
 platform/generic/virt/qemu_virt_wgchecker.c   | 1050 +++++++++++++++++
 9 files changed, 1410 insertions(+)
 create mode 100644 platform/generic/include/qemu_virt_wg.h
 create mode 100644 platform/generic/virt/qemu-virt-hwiso-overlay.dts
 create mode 100644 platform/generic/virt/qemu_virt_wgchecker.c

-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
