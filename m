Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD388CD4F21
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 10:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I0oYQDKl2+6g4np3isD8suxJRCbVUFWSX0RYh9oeZfc=; b=H3Le6jJ80oTV4K
	MMRK3DMhfMwe2k7BdFyyDQDOAc/joN0OU6bdz9gDWD53vWWJ3x3cNLjX5UMMSyyGgO37RnaerRb/N
	1HKfYwEUTLfcVhvLcUeAOXkg7G1AeSK1pZcFbcvm4OrHOPwNFdmsQ/649Qr02nUzyYX3S264V7lJY
	yyNOrMXiU5x0g7t9O7RiQSLsfdEOHYFWeeFVFJs2VEYLtYn8cYCT+sYj3iVot7E1vA/KpPShuACZY
	sDkrIA+i03qQ8sab3gx547t3RNIV5ranET+I7wH3P3i1QyvbxRsJYYwwx3ezjMG0kVs/0LnzYsWf1
	Q6/NikCHMax5EQf99yxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBw6-0000000AXl2-3H0K;
	Sat, 16 May 2026 10:07:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOBw4-0000000AXjk-1yTh
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 10:07:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so283918f8f.2
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 03:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778926074; x=1779530874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBxJwbn4K6YQ6gvpo8L6ARcSh/YWIdb15/DynVy8EQc=;
        b=X7s/3BHyW6jHbbF4gq5LkaYtDVETN3XziBvw0Op16faTGvhHNkQ9dqQ5GQZdIucqPT
         p8S0utXLVBEDMyhBTSVspfCR4lBrGAXGWkp8T6bv/XbGBB3k1bIEh1OXh+ZX9AKYqts/
         jFeA2SfnWxkMw9r9qr99vWo2dgflcRC1d/2GzMz6FpNduAYIZ3MsXC7L1MSDWrxxWUVr
         6eq7y11mHwW6f+Vc5YM3Mlu71R+tGM+pREO13Xdp5fsrPRGw4GqrR8Te3mUCxcXvSz7C
         AnS9oJKuRRGyWveMfFvaUBVja6hmcFHYKmdcH27KnBeXSIavOXL4OTGvCCB4UDB6mdmK
         4Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778926074; x=1779530874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBxJwbn4K6YQ6gvpo8L6ARcSh/YWIdb15/DynVy8EQc=;
        b=OJUzxeVmoMF6cNdQgqc6RakRuw+o1/iCRGTTMuGV+wO0ube0p/FWMrM32qtW6AkjAx
         9n4R/607gmsNBL179z0yR2P+IbqKTA392956RsRwXFPS69YIfrKo4R/mdj7bFm1ZoZhj
         XVi0BXFJCkr4QDsOCT1oKEsy0maDezYSXkZBi+hQSgZ7vQpMM1lMaWn82vFRKa4UXNBo
         fGBF8ApoHUOerw1sgUdnxhApj3MWgacedbAKcqDFmR7hdtDqIWv/sNup1sQAF4mKIzGp
         St79z2xmioy2l7RdIsQVhaOLwGNsSgcw7JJHYF+tDSdEw+8XcDJnR//czQisvtmuoyUG
         Mshw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZJIJHSyf0Yh8n143kPoLucW7Hp2qCHeMlW/4mQ5qdwJuJ/dmbkxwKtoe12VA0OywxPuk1ro3x@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs5btntkNvgpv7JzbvfnKrzInxmWfUP+Y74rRlJ6ZzJ/Ao2dg9
	hXZqk4/sAudjjri/iuDb2+3i5jEqiUWedWQ+THUBsVFEHPunNEEI8daUObXDjnecuns=
X-Gm-Gg: Acq92OG/IkQGFwsqV3v/TZIjtjCyPR0RYBgZ94Yut55jE3mIh92Xa+O7YY8l+DOGzFJ
	w5Q0Z/+9W8gLRkgFJoBwjCogQHAgpxptKczPQssDMkJj2ivJKjv0daXVH8rjVsCYAwMeO7tvw6L
	7/3uPbK8eZAH03HRXiP/li20BL4aZ7jAm+0Az7JvnQ1P+P9RHCdCw+hmWdr2hHFm28LGp0bXEEO
	0YD9Pm76TFxq2ZaRgdPyllY/zFh3U0DE+dDXCSLTFNjS9rgWK2Najk56wPzI8dsHKgJ2yxqF37f
	YrwwPeOSJD/ivmcN/OW5Pw02N7rNq+F04aCs9w/qunXa7erIvsSuC0mK6JefjjzyNxkwm+31oRa
	xnFAFovFmTgnW43fPdDyOCByiLGwaGjus017af0GIkjvsEwRKA3oPj9TgJQgfam9lRuquJsuYpy
	tF1wOy+VNh0vmuXV0mPLqViRb7Ap7h7L0rkC+/ap3d8JT2GQI8GS1jkSht4sBcJjBwrCE=
X-Received: by 2002:a05:6000:2507:b0:452:2834:c690 with SMTP id ffacd0b85a97d-45e5c305133mr9979742f8f.0.1778926073329;
        Sat, 16 May 2026 03:07:53 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9adc2209sm19167114f8f.0.2026.05.16.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:07:52 -0700 (PDT)
From: dave.patel@riscstar.com
To: Anup Patel <anup.patel@oss.qualcomm.com>,
	Anup Patel <anuppate@qti.qualcomm.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v5 0/3] Add eager FP and RISC-V vector context switching support
Date: Sat, 16 May 2026 11:07:43 +0100
Message-ID: <20260516100746.13502-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_030756_524539_23405F09 
X-CRM114-Status: UNSURE (   7.43  )
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

From: Dave Patel <dave.patel@riscstar.com>

1) fcsr to unsigned long.
2) removed redundant line
3) merging path 3 and 4 into patch 3.

Dave Patel (3):
  lib: sbi: Add RISC-V vector context save/restore support
  lib: sbi: Add floating-point context save/restore support.
  lib: sbi: domain FP/Vector context support for context switch

 include/sbi/sbi_fp.h         |  26 +++++
 include/sbi/sbi_hart.h       |   6 ++
 include/sbi/sbi_vector.h     |  28 +++++
 lib/sbi/objects.mk           |   2 +
 lib/sbi/sbi_domain_context.c |  40 ++++++++
 lib/sbi/sbi_fp.c             | 192 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |   3 +
 lib/sbi/sbi_vector.c         | 109 ++++++++++++++++++++
 8 files changed, 406 insertions(+)
 create mode 100644 include/sbi/sbi_fp.h
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_fp.c
 create mode 100644 lib/sbi/sbi_vector.c

--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
