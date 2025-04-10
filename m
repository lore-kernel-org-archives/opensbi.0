Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1171C369AC
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLjaCT1fxzTHQ69vrFEttQ0hlTTJHBoYen7s/HVMN8E=; b=UrQUib7X8CZmTv
	RvjQ+GFiLBTQXI5YP9NRed5J2kenvz9hfMU1hy8eLlorTBhyOU0kFIkzlQYO1Nrr5bLlDiL8CIeo/
	plm8a/8J9mpSDBCnE31Edeq+P7wKqzrg4iJHQ6sDXyBjtdSskeVsRMvdzn1aliExNBmGBVLNAxYGZ
	N/lnK4kbngoLvzClvugZk3i8+HKkztpsqNpi5gadbHsOz8HvX8HF8Vt3YNcXcUAS5cl7a7qz5YH0+
	Umv6uklPpCWJWX0dtwJGOfKDFGCQ14Ob/DvS92CJDcsDmDEQVuCnNwT6bW/I1XmbYeimvFOg+IOAG
	1ZLhzX7v+/cFIdgkeUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31RU-0000000C41C-3g82;
	Thu, 10 Apr 2025 23:36:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31RR-0000000C3zX-2qX6
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227914acd20so20909535ad.1
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328175; x=1744932975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZHrB5HXlE/fFUuqz27xst1ZtK2vHqd1I3s15aaYh/Q=;
        b=QmeaWhGFgmgoeJRLqk3bBuOM67lorr8PWJx9JtlZtsQPIpTPVg8sIlC2QeNVIi7PFK
         0FEYSuvZhc5078YZhmQKjZbEFCl2014zpEQwOEOIQMlDnEu31rhTW0hzrKBGkdIJ3CHZ
         6YuTHl76R+KqRJonvFvjEPdPq7oDztxKE0bgiTGWv53vN3l5tHr1qQD8cdPcjvA/Wt4y
         hefBnQn9iTNaU8ulBdFo38IIudG26UehmdjZ5WA31c8OEwH31oJ6z7rl9RsFIJ+MTNtq
         fHSh/W2fIotrqF7sWapjustga/ONQH3Zp+SfS0d4ljgqJyhDNb1hvHEHUCShyMgnQtYe
         fa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328175; x=1744932975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZHrB5HXlE/fFUuqz27xst1ZtK2vHqd1I3s15aaYh/Q=;
        b=Y85kkM/VZ5IdjRKnAoWk8tGjHv0JxAxUDHonYKG7QRfZu494SnJZD2OtaIYelTxpgR
         E0vkWD68EWymVwZYumbwghzEi9zjJ0sCQNdWrMZoOWZiKZLb9CNdTc1lxoTKlwrB1k+C
         0HRQv1xsKx5Bo4krrvHlipDfJ12LOxA4S/0+qz7RlpcQ3gpGaVIMOxPEzWVnxIwcSacH
         EpjEUwXNBEJOFSNr0zdml1sOVU5Ppdx5kVfNvC2bChgF7Q5Za9jwpuqYNIoTJrvthXAQ
         dxcJDQn91jjlZoWNJvwHanElqvG+G35Qx4ynsSusq5Xusi30JgP0kDSCYXbvZwE6Bmy2
         6M/w==
X-Gm-Message-State: AOJu0YyLRUpFS9MFuO4KGaWOJACab3gjeLOhK2NTaGUSM0tKlLiMdYej
	grWc9DXH4DsLOwYFLjmYvC8Q8gvdxsDNE20s6ZYnNBRilpjZ4PUNbkb9eDXG
X-Gm-Gg: ASbGncttixhD3vn5K4UPm9+0IG1agbVPp6huCPY1d/eXar+KfUxDxao9B99RfUbYTob
	v4t2TaiNxt0nwI5EuR5uIpUOD8XFP/VVr92HLxnNlJm35qt9gy5LC9KiPe1B1yqUQT8NChh8h+R
	+KVcGNa2w6bJ8mvW/0fw7Wnqk7v5Cxfhzd6kFvqPu/eT4En0nS+qdh3liFDkxEvTUo7dbhQP7TS
	O46nQjxg6dcIYk2d5f1v20uGisTACoFI1uknb60tDqDitzLLDLIX3QyshV+/jfjgWqNkHHXFA/e
	a79WPydaSuR/IpDFyl/FjF6LDJcFlv+DBjr3kOknjw1EQQ16UIUFTNYVAw2Rwsaa5gSQ2CIF680
	7/VW3gvLvd8Le
X-Google-Smtp-Source: AGHT+IG0fKTZsB5a1F77qKb6Ri0SGfxQyCfYCKv4DK6HL7/Nb84YtYwx4v58C1tXO/Xuflf78UQZMQ==
X-Received: by 2002:a17:902:eb8a:b0:215:58be:334e with SMTP id d9443c01a7336-22bea042195mr11297365ad.10.1744328175202;
        Thu, 10 Apr 2025 16:36:15 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:14 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 0/9] *** Add MIPS P8700 platform ***
Date: Thu, 10 Apr 2025 15:45:26 -0700
Message-ID: <20250410224536.25021-1-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163617_719434_605C5EED 
X-CRM114-Status: GOOD (  10.01  )
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

***
Changes in v3:
  Remove stw.s, stw.h, and extra scratch space.
  Use nascent_init to initialze MIPS CSRs.
  Add amo emulation via illegal instruction exceptions.
  Change to use AMO and RDTIME illegal instruction exceptions.
  Revise the dts file.
  Remove code that jumps to mips_cps_core_entry.

Changes in v2:
  Break up one patch to 11 patches.
***

Chao-ying Fu (9):
  platform: generic: mips: add P8700
  platform: generic: mips: add header files
  platform: generic: mips: add an entry function
  platform: generic: add nanscent_init to platform_override
  platform: generic: mips: add the platform file
  lib: Emulate amo instructions
  platform: generic: mips: add a dts file
  platform: generic: mips: add objects.mk
  Initialize MIPS custom PMA registers

 include/sbi/sbi_atomic.h                     |  90 ++++
 lib/sbi/objects.mk                           |   1 +
 lib/sbi/riscv_asm.c                          |  36 ++
 lib/sbi/sbi_atomic.c                         | 182 +++++++
 lib/sbi/sbi_illegal_insn.c                   | 492 +++++++++++++++++++
 platform/generic/Kconfig                     |   4 +
 platform/generic/configs/defconfig           |   1 +
 platform/generic/include/mips/board.h        |  33 ++
 platform/generic/include/mips/mips-cm.h      |  88 ++++
 platform/generic/include/mips/p8700.h        | 122 +++++
 platform/generic/include/platform_override.h |   1 +
 platform/generic/mips/cps-vec.S              |  75 +++
 platform/generic/mips/mips,boston-p8700.dts  | 339 +++++++++++++
 platform/generic/mips/objects.mk             |   7 +
 platform/generic/mips/p8700.c                | 267 ++++++++++
 platform/generic/platform.c                  |   6 +-
 16 files changed, 1743 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_atomic.h
 create mode 100644 lib/sbi/sbi_atomic.c
 create mode 100644 platform/generic/include/mips/board.h
 create mode 100644 platform/generic/include/mips/mips-cm.h
 create mode 100644 platform/generic/include/mips/p8700.h
 create mode 100644 platform/generic/mips/cps-vec.S
 create mode 100644 platform/generic/mips/mips,boston-p8700.dts
 create mode 100644 platform/generic/mips/objects.mk
 create mode 100644 platform/generic/mips/p8700.c

-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
