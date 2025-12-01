Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A018D111A8
	for <opensbi@archiver.kernel.org>; Mon,  1 Dec 2025 05:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n9NrcCt8VvYLBvt8Ie3nhMMH1Wk05j0vFxGRlr8UfLY=; b=oqqqGbaj3ueKCY
	Rkz34sQF2boUghCjytUGY+Vq/aWx83u2kwAw7//Yz8WNTSE/kTZ/WuRP8vPR9PRwus1uTH4leJhJT
	N2EbJUg8fIq+kI/daknzfrk1c3WLHghPArJ0w09zYdS0fsPSkXqnGn3+MmEyf+obcPNv2wHU8Sy6U
	KEW9dTkaRJRUxprMiBeEIGcloNVm3tkU9N9UA59Q+ygx8/ApHv2gL0eCJYSyMp1QcdFOj/qVn2iBJ
	lmZXGqJDuT8sy/5n8FPByVMV9Papq/619sevYxOesocWTAlVU5svOsI42Q0i0DM3BHaJZ5AnaSKiA
	OFhV4pSeQTY5fZQT8PTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPw1T-00000002uk4-1qYU;
	Mon, 01 Dec 2025 05:00:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPw1O-00000002ujb-1txB
	for opensbi@lists.infradead.org;
	Mon, 01 Dec 2025 05:00:26 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so4468449b3a.0
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 21:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764565222; x=1765170022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzV5u87/eYLObAnw+3Db/BNvMyHgtVKUgObT9ie1Bww=;
        b=QWeEdZ54ENiRqijjNATeiQtqileTp204Gq/3qZhkeXb89T4fq3kECyx3nwGSOZQkf4
         QE5eB+jYtwqzYBfDq+g9IMOoVbPlN0QrSqvbW73oaOSFJjV92NyU8aNWjAkNwLWOSqxY
         yZwYsdQASH3fC62CboYd6tWh3z99znLS/ZZsHg+xaNp18HJP6QaLtJXuQn2YGowzjUNv
         k7Yn5FNK4RXkuagvCN5MjJZ/ELxLnWUvpRV4iLWTOCjOxsPT6EXEvr1MZqWaG3ZqtQNR
         7wklGp8JDTCLJFfH8s9qy+ps8Tmevsm5c4vUqLuBhbtsjuP/L9ahSgIbw+/osSxMTcTE
         v06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764565222; x=1765170022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzV5u87/eYLObAnw+3Db/BNvMyHgtVKUgObT9ie1Bww=;
        b=oo13TohBuAcRigdHYPnQfiljPBHvq3UkaO0KB9Mr8aafyQ1EJn0OtH70pVaGYkR2PD
         ZZms2r/Cqcp5Pvb09hsio1bJKYNJYSh/8xxvZPdxnYaIFRq3gGERHdqrERX0q1bnH6Ae
         K7pfzaCbqwq0uyEoYid0HnO/0rMi1sH0yJgiskIJjhtIZDNarVwPcx535MSlPxDb1zfq
         LUfQSKUPpT8HCiUMtt6GcBHlK9retEEByrDWzctgQXbTy7GF79zA9fXk414qOD19wZRr
         dgtNiLSLhfDd42OYQXwhS8WLcC2wSgA5uci77DxPw47tBPkprDxLMJc/SAwdW7LkEVyt
         mTwA==
X-Forwarded-Encrypted: i=1; AJvYcCWC1BPJyerbf20apBgfa7dB5XI4GRK0OaAAggkKPXZYe6mZz1DaQCCchvxZFiVXclaHOOlK3wUf@lists.infradead.org
X-Gm-Message-State: AOJu0YxJVgdgomdM31bxLgwgF14sFJggIlCKTI19dFfJCI7nppokz18r
	tLa7UlK+XbUM6RnGB/9r7DspeNI5kRIGw/vgE7nEhbP6P/T0ek1eK6kRqYOVdFq6RII=
X-Gm-Gg: ASbGnctU9pTcXDqhkEj/aE/+2d6VsUnIHsxQnihBpCtt+LAdM90jocIVwvvbPOJaKYx
	LF7wiXl0xwwkDmUaG23v9/U1EbcPYMBlqQU8rRLIRTLviat+oz+eYt3WqUrYp634SVfQyfQJUgA
	MrGSl2VSS5jI3+Rs8TTGB583LPh3DUb0aN8Z4/ubab8x/fGIHI/LTN1TUKSzvWIK1bAtUYAG4I5
	+LQFUABdk6BqqK51fU9Xu4BocLmjjWUU9JmoBfAstTJkk8GB7zryAP7N+MSs1vpYvKJOhrCs8Jl
	XJKmbf0liJQWem66PwjflMX6EI1YEjInVEI5+y3SytMDIOxzO/YTR55NfReNFh03KQ3Cyh1v/gx
	8zNzEJq5nCxx5x8+Nu5IY8U52PKWHf/UzFfh48/+L+w/nk+YBFmMmgA9DTgXcBnumrJOL0rxlKK
	xK0kGhakvY2PiXvFGaEWi4Eet+zBjcsccTwlR5gzSY
X-Google-Smtp-Source: AGHT+IHD7VjxjyLj+3IC0BTEEmhZqT46HMXA3IHoSwKN/7IkXMPCEZWmYlt03wbSM53BOimT6tQKIQ==
X-Received: by 2002:a05:6a00:14cf:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-7c58c99a1eemr42419205b3a.14.1764565221447;
        Sun, 30 Nov 2025 21:00:21 -0800 (PST)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e7db6ddsm11735498b3a.34.2025.11.30.21.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 21:00:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2] platform: generic: Keep some empty space in FDT passed to next stage
Date: Mon,  1 Dec 2025 10:30:14 +0530
Message-ID: <20251201050014.8788-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_210023_407020_DEA7AD6B 
X-CRM114-Status: UNSURE (   9.77  )
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

Leaving no empty space in the FDT passed to the next booting stage
causes the following U-Boot crash on Ventana internal platforms:

Unhandled exception: Load access fault
EPC: 00000000fffa6372 RA: 00000000fffa7418 TVAL: 0001746174730068
EPC: 0000000080245372 RA: 0000000080246418 reloc adjusted

SP:  00000000fef38440 GP:  00000000fef40e60 TP:  0000000000000000
T0:  00000000fef40a70 T1:  000000000000ff00 T2:  0000000000000000
S0:  00000000fffc17a8 S1:  00000000fef38d40 A0:  7375746174730068
A1:  00000000fffc17a8 A2:  0000000000000010 A3:  0000000000000010
A4:  0000000000000000 A5:  00000000fffc17b8 A6:  0000000000ff0000
A7:  000000000000b100 S2:  0000000000000000 S3:  0000000000000001
S4:  00000000fef38d40 S5:  7375746174730068 S6:  0000000000000000
S7:  00000000fef4eef0 S8:  00000000fef4ef90 S9:  0000000000000000
S10: 0000000000000000 S11: 00000000fef4efc0 T3:  00000000fef40ea8
T4:  0000000000ff0000 T5:  00000000fef40a60 T6:  00000000fef40a6c

To address the above issue, keep some minimal empty space in the
FDT instead of no empty space.

Fixes: bbe9a23060e9 ("platform: generic: Pack the FDT after applying fixups")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v1:
- Add Kconfig option for amount of empty space in FDT with default
  value as 4KB
---
 platform/generic/Kconfig    | 5 +++++
 platform/generic/platform.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/platform/generic/Kconfig b/platform/generic/Kconfig
index 25b8886b..b1808012 100644
--- a/platform/generic/Kconfig
+++ b/platform/generic/Kconfig
@@ -23,6 +23,11 @@ config PLATFORM_GENERIC_MINOR_VER
 	range 0 65535
 	default 1
 
+config PLATFORM_GENERIC_FDT_EMPTY_SPACE
+	int "Platform FDT empty space (KB)"
+	range 0 1024
+	default 4
+
 config PLATFORM_ALLWINNER_D1
 	bool "Allwinner D1 support"
 	depends on FDT_IRQCHIP_PLIC
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index e66f99fa..ddfc9e80 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -245,7 +245,10 @@ int generic_final_init(bool cold_boot)
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
 
+	/* Minimize the empty space in FDT to 4KB */
 	fdt_pack(fdt);
+	fdt_open_into(fdt, fdt, fdt_totalsize(fdt) +
+		      CONFIG_PLATFORM_GENERIC_FDT_EMPTY_SPACE * 1024);
 
 	return 0;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
