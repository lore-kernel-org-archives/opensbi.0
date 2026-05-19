Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB8BCD4F54
	for <opensbi@archiver.kernel.org>; Tue, 19 May 2026 20:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k9mcJMMIcIkgtxobgfZYpctMlMe+Ud2kXShsi5ITKjM=; b=nZzi0cI7xI1ydb
	PTVTjQ67LvdQJkLuQKHpflV7Y0i53fh/8VoQlDedxM2r87G0f7KjByi63h7JNiUuJpcayGS1W3ZRS
	d3CC2fScHl5bmZtHN1jPsYB+tfq5+IxPwp1c0atVQZvseHGTgIkuI+S1+SyKyQMAypdQFU4NOj5Ba
	zisCs7YmzvHssDrnTBmql/lmES4wXE/Ow7vtx5zPn7uFcSAXhHkDTtnUO0xSLZmaVLMfHTMJYj3DJ
	EUroqFeQkzYOM6eJlFAeAIIBd7a/DoHIDTCPr2dZxjLBFWChfL+IMZLZGwT17nsROJQffX3FXbvCW
	wrlQbxc/oPPw2vzSrFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8O-00000002ixv-49eG;
	Tue, 19 May 2026 20:33:48 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8N-00000002ixI-0CSI
	for opensbi@lists.infradead.org;
	Tue, 19 May 2026 20:33:48 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51306c36c3eso48061031cf.0
        for <opensbi@lists.infradead.org>; Tue, 19 May 2026 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779222825; x=1779827625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxTj+ZIzA02PJPcl2JxM4vP1NvN8wxe1yr7f3maudiA=;
        b=Dk0LJnQLPKLk41K/CjjBFl2JoF+XBfiueykqWbjKEc95IFrSUzTvR58MDB1iaoQI3t
         n24I/VvhO5w9LHJEZIXCI2UQts6YJrCDNt7zAB5OI7bx8NmIwB8d57HFE4kyS4Cfvnh8
         UB07i7ZSyTwP75u5LTuSUj9yL2vu3cFJlZ2pN9pcATYr37APUrXm8lbPh5vmCiSbPcrV
         i+c604NykWZYYqCsLZv3bJKJvgfWUtuWTrS/NLBigqpjlU63O0XjVFjVv5AZyLCyeAbd
         sxqjGGypdgKTMsn4xg4nP5/6lzF1OY2u57lIuHW8uc0uPahTAe0zg1ozkhOINKn5qeab
         qLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779222825; x=1779827625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxTj+ZIzA02PJPcl2JxM4vP1NvN8wxe1yr7f3maudiA=;
        b=CKFOn53ChmMI2qUfZnGy9EtZGjDahIJbDlXTHD0aje/u+63lGVA0L6BHVsWwfx1aKM
         rc6sD0DhPF42kxY6TGDOTMJiYrK4s6FZSOgdsFGKxhHfOxJ3bYWc1Q/Ze640xgvg8kx3
         k2dbCrJ8fYslPd3V5BYSytcoF2Op+Z41nPUgEzfFwoiHylouiMj6ie2f/K9dDJI9D9xI
         +K30yj5SMihTs+GcjV9iHyuZgKi05tqTWAfLlH1H5jhPaBB/hgepClRoSJQS/U/rIZLX
         +g1V4ST4KLnPJumgwtR8qvFLEtnmxhDbo9idbrb/9vR9ngtlkxJ/VfRZCcHJiaSD7DOJ
         f6Pw==
X-Gm-Message-State: AOJu0YyZcqc/bEpjmrQNh/mKaI0BHl/OT5SD4g1y2DhDoSToweYFWwKo
	T88BGXKZ6dQ4A/e6wUn2bJTP8+Jus6+m2sBMByiW7F6fPzNnAJmbKhyRjnLAnw==
X-Gm-Gg: Acq92OHoe//JAYIfpnes8ugORVlXIRjtLvA71rfsWo7LMhPWvnSEBYktosn94kgbdNo
	Zcm4w3G2YBb1Rd3QYf2hPuofA9wXz6ciiUMW+d/PK7IXDdwB4Zd1k86lMx/tSTess0YEJJI0sgb
	o+z1Z71v1QZZECLpPfdLQaw9NHn+oy0rjtoFn7dEjostoUuEg8Ri7wMfMZGCIb5WEi2q4G7ICed
	6/AufRQn4gFHbp4dWaWrbKEA/9tPMUfK90sDjBxHVets3pLtUNvUntMbuMR3JD5woDr+kquQ3rg
	0I4thnc+oePGXqTQVtlWKibpdTz28MGTDzwLp0KBwL2RRrdwdrzlrxJa0Xg7C6cundQx44RuI1K
	1SA0A7U54+qwD0ykg35uljQvjtXeorkg/ZUDzb572UEAhRydhrDLTp8YhLMRD6thqqlHTQD2bw6
	KSyQSNEJmac3lt1HwhHjdAl7W72qh2LmIjxEjCAqPbraH2iwLQlBh4F5Sbuu6OMy3wqpavghkPm
	Mg0Q02R7Is=
X-Received: by 2002:ac8:584d:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-5165a06f6a8mr298156601cf.11.1779222825203;
        Tue, 19 May 2026 13:33:45 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164581aed3sm173787461cf.23.2026.05.19.13.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:33:44 -0700 (PDT)
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
Subject: [PATCH 0/7] Add WorldGuard hwiso support
Date: Tue, 19 May 2026 16:33:24 -0400
Message-Id: <20260519203331.2773185-1-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133347_096279_8D130C0A 
X-CRM114-Status: GOOD (  13.29  )
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

This series adds WorldGuard implementation for OpenSBI on top of the
generic hardware isolation (HWISO) hooks.

The goal is to let OpenSBI:
- program platform WorldGuard checker state at boot
- parse per-domain WorldGuard metadata from the device tree
- reprogram hart WorldGuard runtime state during domain transitions

The current implementation targets the WorldGuard model of
`sifive,wgchecker2` checker plus per-hart and per-domain WorldGuard
metadata from DT.

The series is organized as follows:
1. add the WorldGuard CSR definitions and hart extension flags needed
   to detect support for MLWID, MWIDDELEG, and SLWID
2. document the HWISO / WorldGuard device-tree metadata used by the
   current implementation
3. add a QEMU virt DT overlay that describes domain WID/WID list
   assignment and checker permission policy for the current test flow
4. add generic-platform WorldGuard runtime support together with
   `wgchecker2` checker parsing and boot-time MMIO programming
5. add generic HWISO SBIUNIT coverage
6. add QEMU virt WorldGuard mechanism-specific SBIUNIT checks for
   boot-time checker programming and runtime CSR state
7. add a QEMU virt failure-mode SBIUNIT test that intentionally
   triggers a denied WorldGuard access and verifies the expected trap

Notes:
- The implementation has been verified with QEMU virt that supports
  `wg=on`[1].
- This series depends on previous patches ([2] and [3]) for
  introducing HWISO framework.

[1] https://github.com/cwshu/qemu/tree/riscv-wg-dts
[2] [PATCH 1/2] sbi: add hardware isolation abstraction framework 
    https://lore.kernel.org/opensbi/20260504173948.1663823-1-raymondmaoca@gmail.com/
[3] [PATCH 2/2] sbi: route domain lifecycle transitions through hwiso hooks
    https://lore.kernel.org/opensbi/20260504173948.1663823-2-raymondmaoca@gmail.com/

Raymond Mao (7):
  hart: add WorldGuard CSR IDs and hart extension flags
  docs: document hwiso WorldGuard DT bindings
  [NOT-FOR-UPSTREAM] platform: virt: add QEMU WorldGuard hwiso overlay
  platform: generic: add WorldGuard hwiso support with wgchecker2
  test: add generic hwiso SBI unit coverage
  platform: virt: add QEMU virt WorldGuard hwiso tests
  platform: virt: add WorldGuard HWISO failure-mode SBIUNIT test

 docs/domain_support.md                        | 159 +++++
 include/sbi/riscv_encoding.h                  |   3 +
 include/sbi/sbi_hart.h                        |   4 +
 include/sbi/sbi_hwiso_test.h                  |  35 ++
 lib/sbi/objects.mk                            |   3 +
 lib/sbi/sbi_hart.c                            |   2 +
 lib/sbi/sbi_hwiso_test.c                      | 173 ++++++
 lib/sbi/sbi_hwiso_testlib.c                   | 119 ++++
 platform/generic/include/wgchecker2.h         |  55 ++
 platform/generic/include/worldguard.h         |  45 ++
 platform/generic/objects.mk                   |   4 +
 platform/generic/platform.c                   |  11 +
 .../generic/virt/qemu-virt-hwiso-overlay.dts  | 121 ++++
 .../generic/virt/qemu_virt_wgchecker_test.c   | 356 +++++++++++
 platform/generic/virt/qemu_virt_worldguard.c  |  42 ++
 platform/generic/wgchecker2.c                 | 585 ++++++++++++++++++
 platform/generic/worldguard.c                 | 522 ++++++++++++++++
 17 files changed, 2239 insertions(+)
 create mode 100644 include/sbi/sbi_hwiso_test.h
 create mode 100644 lib/sbi/sbi_hwiso_test.c
 create mode 100644 lib/sbi/sbi_hwiso_testlib.c
 create mode 100644 platform/generic/include/wgchecker2.h
 create mode 100644 platform/generic/include/worldguard.h
 create mode 100644 platform/generic/virt/qemu-virt-hwiso-overlay.dts
 create mode 100644 platform/generic/virt/qemu_virt_wgchecker_test.c
 create mode 100644 platform/generic/virt/qemu_virt_worldguard.c
 create mode 100644 platform/generic/wgchecker2.c
 create mode 100644 platform/generic/worldguard.c

-- 
2.25.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
