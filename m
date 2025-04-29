Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A55FC369DC
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzqjdGOaoMadeAZXKvhUk2PyVsl6IUbi7pl+yIOufdg=; b=hSO1JtoKE89fj4
	jWEEJ8pSs8DxfgizEi+LKWg060d+Oa5dopRHh9Q3DXMsnxKqu4c3OUoTMvZO7/nDVBwtWXa2w+DBK
	uNqESiWJFtbXllTHTDyw95grDvjzwqO8btr3VAPhBzzfpi5ld5Z61hX5BtJ3KbLejWyjirJJHX3NV
	5iWXF904VS1gjVbWS1p89C8bCS21eUUrO+BqBumGEsiwGZQYMLTs4s9vupwqFt6rfNDmOE9JScdAq
	PSUmx/5l4fP6qKsLIyxE4E6DyeZ9sm0sgiB+3o0wDj1VWjBueDxN547fpo3mkUhh0HoyGIhXcxSRD
	Vw5kzc8Sbd3B+Ps4CyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyj-0000000BDeE-27z6;
	Wed, 30 Apr 2025 00:07:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyh-0000000BDdY-3IpT
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736aaeed234so5550596b3a.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971626; x=1746576426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkRF8JFR0K7JLisd/oGPstD4OKzFakPaa3hn5Z33Cp4=;
        b=YrVWPq+kOtFTwBdbMDawM5WA3NXm72SocBD/JsID0pw5y/fnbZRSNpuLMJAk3QenpW
         w4jRljSz/hdmvUthJ2xEEWrJS5N7O+ooLwMjM3VjQWx+eunjvzc2vp7iyuKrr9L4Yhd/
         eGSTsv2BxBVyzvD46ERNfm5qkHEgoDcI7W1WO+Nz5CA/MTsXi3f7e555fgV2uxy5s4bE
         qKO4ednAjx4fcz4OW0rkhotomwltfGF3BZJcBJWNJsndPTfPmDPxSHDg8w+x0bxUbkGL
         7Wmvx7SbR0TsJgCcLy7cY/Nsg3b6QtL6suchhvh2NG1EwNIoMS64rY8YGTKRdNfxXA/x
         6Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971626; x=1746576426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkRF8JFR0K7JLisd/oGPstD4OKzFakPaa3hn5Z33Cp4=;
        b=PSDq3bK0OlFd5WHPx8fiCMUYtLe8YhacwtMvv85HkCUh08Xkx2HI5g4sWGhM/85TV9
         9KY3Xh1bvioSWT9+Oj6nVLSq21cB+zv1MnlP52kv8r3ylPBVdLAEkAEUFlqBMTUjAejz
         5ox0ZF7HGcgTJbeqcSLv6Pq2GOY9/VAltquFmBhjwGW5lZIVUVXYATtRH2HmW/QfJrXB
         ckQONAMuBpghuz2MQX4lEjzDCl3EC3XBxEgaOZNyACqIPWJ4xRC94j9U8KqOVXrTUQfo
         NJ1YfY+HdTahg4GBmRqB/BnQRuZkKtUGGGoSaESRA6ZUIcxyye7wEIAdZZ8mhjDsQadX
         W0rA==
X-Gm-Message-State: AOJu0YwsHbT7rNO1WulMUyaxkRvd0sMIJKSqAdyRvUan/bK7gVrlHfKb
	QWglKWAuVLeeBWq1H5E6gyis0UtkFj6RW+gLF8uhrhHG7xc2M7jhFd0qTA==
X-Gm-Gg: ASbGncvV7WTLEQveKVbfPvDAe4pNobqtgg1ZxEifLrAK0/bwarg7QNsdC/yjUwSCoQK
	/nja4iNpNnmVIlFG3m/31d5a54WYjHEuHNEv4xOwTStuXVbJVnX7dVbCMwTNM7ToC2XPW4lQRl/
	+xS7tK4ySKmP9AtGqgQlWrGNe/1e1JHNz2p7eRkK9JjB6vBlI8uGLFSdtA5TOoIG8dRezlIz7IG
	FdG6BwQxPtLm7gMEBK9zdO9fnOkAKf4/ykxU7P1RKSK1KarpIefozcA30DjZUQoxzhU69fPOTc+
	zd2xly5oW61sehsiyX1B58flIc8OWDNo8I7lpuRVqCC+Azxqpwa3rQ==
X-Google-Smtp-Source: AGHT+IE6Cq3sUs/BYKMqQqoXVzRlrGIV3Nl3kNqptGeMmiwmGCHbGinlfGaT71gS5pDnFB5SHUiIXw==
X-Received: by 2002:a17:90b:254e:b0:309:fe2b:306f with SMTP id 98e67ed59e1d1-30a333594f8mr1200089a91.26.1745971625706;
        Tue, 29 Apr 2025 17:07:05 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:05 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 0/8] *** Add MIPS P8700 platform ***
Date: Tue, 29 Apr 2025 16:29:20 -0700
Message-ID: <20250429232928.6499-1-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170707_824996_65066686 
X-CRM114-Status: UNSURE (   9.67  )
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

***
Changes in v4:
  Remove code that overrides nascent_init.
  Update p8700.c to work with the latest override.
  Use csr_set for mipsconfig6 in p8700.c.
  Add riscv,cbom-block-size to the dts file.

Changes in v3:
  Remove stw.s, stw.h, and extra scratch space.
  Use nascent_init to initialze MIPS CSRs.
  Add amo emulation via illegal instruction exceptions.
  Change to use AMO and RDTIME illegal instruction exceptions.
  Revise the dts file.
  Remove code that jumps to mips_cps_core_entry.

Changes in v2:
  Break up one patch to 11 patches.

Changes in v1:
  Original code.
***

Chao-ying Fu (8):
  platform: generic: mips: add P8700
  platform: generic: mips: add header files
  platform: generic: mips: add an entry function
  platform: generic: mips: add the platform file
  lib: Emulate amo instructions
  platform: generic: mips: add a dts file
  platform: generic: mips: add objects.mk
  Initialize MIPS custom PMA registers

 include/sbi/sbi_atomic.h                    |  90 ++++
 lib/sbi/objects.mk                          |   1 +
 lib/sbi/riscv_asm.c                         |  36 ++
 lib/sbi/sbi_atomic.c                        | 182 ++++++++
 lib/sbi/sbi_illegal_insn.c                  | 492 ++++++++++++++++++++
 platform/generic/Kconfig                    |   4 +
 platform/generic/configs/defconfig          |   1 +
 platform/generic/include/mips/board.h       |  33 ++
 platform/generic/include/mips/mips-cm.h     |  88 ++++
 platform/generic/include/mips/p8700.h       | 122 +++++
 platform/generic/mips/cps-vec.S             |  75 +++
 platform/generic/mips/mips,boston-p8700.dts | 347 ++++++++++++++
 platform/generic/mips/objects.mk            |   7 +
 platform/generic/mips/p8700.c               | 276 +++++++++++
 14 files changed, 1754 insertions(+)
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
