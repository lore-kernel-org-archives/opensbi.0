Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCA1D111A8
	for <opensbi@archiver.kernel.org>; Sun, 30 Nov 2025 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=++e7LZvKw5KMTZW+rk5SknhJWmsvzVlbWEru09FK4ug=; b=B8QP7sFWtMYAXm
	IcfnTq+KM1jidg6VPEOzKNmFycHtGIcHffkVlq4tS7a+wMmTAhOerDa1XN8NeTXmtPmDt8TCz4mcl
	cQQETjM5ADSTBCTm2IcMqvqgvu6j6Semu5TK/lS8sA/aPWuao+y2nE/cSBOvh98ctY6Sw3kAxX9ew
	d6RtbsCladh7j8DWtEZ5OALKue/VbULk2P7h1a2ZmapQjMlXk6xDf3WFRPIcFuGDubxh3rkxcFQya
	gK/0Z2g+SCFPXjWuPDVLT2YWPlqUc2rPNSwqo6fnEzUZjeOYFGFvfW4re4sESjYGNlJUh0cmmWRKz
	P31vbkJAWda+ItVlxYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQF-00000002F8c-0jCk;
	Sun, 30 Nov 2025 11:16:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQC-00000002F7h-0AW2
	for opensbi@lists.infradead.org;
	Sun, 30 Nov 2025 11:16:53 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7aab7623f42so3554093b3a.2
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 03:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764501410; x=1765106210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VotHuYaqGprBDFakBvF6Pnjq1LaKYU+dubXhbT4xY4=;
        b=HObHcPs1XIp786jVCM6ljxTfQvUDkjX+gjAxDFAVqIurvH41vCeqLFDhYUSM96bLsD
         wqQ4nbHt/HhbcoCh5jf1NThSV6P6lbWdyUOy5wwfNKyzVh3c+krWcNNwU/Jir38cdsHN
         4FH5T036As+k5UJ2OkkpGgqbb2+L5j+PLTDhaYz0IfOGlsURPAoAdrIS3pTsF7St4KUv
         XbtGc3eyIzzLt7uYXP0aFhNH8oJHXfXF+KB9/5UGeDPC0QMon1cVDRvepe+ePkS3l+yv
         mBmVMxvcYJkpK+Nvsm9x7x+jGO4RcxFCn4owGQP1aNRANfpPzHedX0xdGT13EWYmkYnT
         VSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764501410; x=1765106210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VotHuYaqGprBDFakBvF6Pnjq1LaKYU+dubXhbT4xY4=;
        b=EY36OchUN9dxP7ywrwTFP1A68Vskg/gKB6hqwWAApvlZanfelmvcbbFkStkmQ2IV5K
         RXrX+1SE7oxpPAuTRQM26t88nU9jFfwzLXbr2Ni8bwZ0CGi3kVLZ1dY0OO8V211coCZm
         gJwG6LZmG4V+abCsp6e66gMj67vVwlWVCkaRyI5Q8KIQ4Gk51+t5otmCqc18kAjMJJI+
         M1q32u3F1DIFyvzxJqI9LXzI0valzIrWd3uxNGLtjG+nx4TmJdyT49xTyNaNoRVjy1eq
         aK/vJNEpfPLO8arGR6qiMdUW4y1KMXXq5lSUXiNMR62LNJ8ommtM24nf7BlghZZnl58V
         cMRQ==
X-Gm-Message-State: AOJu0YzxDX+Z2fKkNpjUEBniQiCcu/TJDHJAm/1BpF9ISbTH4CZ4sMhE
	kLzTXBovLGELDWX1bmRiP7vbeZi4eBSsHM0lHJMGNMPRQojl+M7v1rwSqpDM+6sqg18lKqtDcXS
	wEF2FaqrHG4BxC4UnF2F9G0HKDHpSz+gqu/RXeHUR37vZwgeH7/0SEtUzR0lFLL0/iNtIU2svN3
	SNXU3uQ2C/JD7aaU71EjQaCUgex+y1HjnW2CuCh4Pr4BtP2Oua
X-Gm-Gg: ASbGncsXzk2ajB4gPEEkyckrMWXHOhr6tFV++IgyIBPp6RPXWOllSDcDf1Hs4pfPYO3
	U1ME/a9dB+Jy+eb/4Hh1cBqFj5CiHVpeLaCTd+eU+zvcdfBTSyihUAWXXaRMonEj1g5bs6SlSmv
	DxT0Z9CO/yN32IYlJVBhftQ0g4D0rOKbq3HUOqcROw83NIXBPYfzaZgjyvIodZTmIvn6oJitdLa
	uNNK1jZ5ohsvom2a71Fk147pTlHTxSwckhaTJv+iuMF+Tl6SJCdmYPj+b+5Kb9glE/iiSnDzSmj
	3V8xoQNp4C3w79KXkw5wlwy9VJY/XodGqReuYpOUox666G/hpfH03JDrDiHsKuqEiPrmIl589JJ
	aBhiMRNCMu+LwpvsrPqjSep0ghBtZW1FNVKyTAi2nIZ/YesZ1ZG+RvjCd+DpiDYXZkZckyH9Nw3
	SCCLVHPlWbCst6upO3jfvUgpfO5hopDeNpCjg=
X-Google-Smtp-Source: AGHT+IEhnOANQBCEqwCaylIBREYDiqfJhYYB6kri4KgNwbiG5emW9QX2d77YYnu1nnZ92apnhD4iaA==
X-Received: by 2002:a05:6a00:a0b:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-7c58eaf2669mr34464477b3a.30.1764501410277;
        Sun, 30 Nov 2025 03:16:50 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1819277c5sm10027050b3a.4.2025.11.30.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:16:49 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 0/6] Extend the reserved PMP entries
Date: Sun, 30 Nov 2025 19:16:37 +0800
Message-ID: <20251130111643.1291462-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_031652_107913_D16E7925 
X-CRM114-Status: UNSURE (   8.76  )
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

This series extends OpenSBI to support multiple reserved PMP entries
that platforms can configure for critical memory protection needs.

Key characteristics of reserved PMP entries:

- Have highest priority
- Available in ToR mode for platform-specific use cases
- Persistent across domain context switches (cannot be disabled)
- Support runtime allocation through a dedicated allocator API

Motivation:

Reserved PMP entries address the need to protect memory regions that
cannot be covered by domain-managed PMP entries. For example, platforms
can enforce PMA_UNSAFE regions [1] parsed from the device tree. These
regions often cannot be precisely covered by one or two NAPOT entries,
so using reserved entries allocated in ToR mode optimizes PMP usage.

Additionally, reserved entries remain unchanged across domain transitions
and persist until hart reset, ensure consistent protections.

Use case demonstration:

This series includes a demonstration on the SiFive FU540 platform, which
uses a reserved PMP entry to protect the memory region at 0x0-0x1000
during early boot. This serves as a reference implementation showing how
platforms can leverage the reserved PMP allocator.

Changes v2->v3:
- Instead of using reserved-pmp-count DT property, this version adds
  sbi_platform_reserved_pmp_count() to determine the reserved PMP count

[1] https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive.com/

Yu-Chien Peter Lin (6):
  include: sbi: sbi_platform: add sbi_platform_reserved_pmp_count()
  lib: sbi_init: print total and reserved PMP counts
  lib: sbi: riscv_asm: support reserved PMP allocator
  lib: sbi: sbi_hart: extend PMP handling to support multiple reserved
    entries
  lib: sbi: sbi_init: call sbi_hart_init() earlier
  [TEMP] demonstrate hole protection using reserved PMP

 include/sbi/riscv_asm.h         |  6 +++
 include/sbi/sbi_hart.h          | 15 ------
 include/sbi/sbi_platform.h      | 35 +++++++++++++
 lib/sbi/riscv_asm.c             | 92 +++++++++++++++++++++++++++++++++
 lib/sbi/sbi_domain_context.c    |  6 ++-
 lib/sbi/sbi_hart.c              | 57 ++++++++++++++------
 lib/sbi/sbi_init.c              | 15 +++---
 platform/generic/sifive/fu540.c | 56 ++++++++++++++++++++
 8 files changed, 243 insertions(+), 39 deletions(-)

-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
