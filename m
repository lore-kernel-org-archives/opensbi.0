Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC4C982D9
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGPvKgkQ0gKdp26KuSggSpCw6LWlb4fkECFHZGnGTK4=; b=HeZxJm+LQuc1n4
	Y2izHdsjq+HqKLiGyNe71Aa8z/+iuLK5wIZNtM+DkJvwAG3yyB3gldD3LJg0S00w1fc2uE6kt+aKo
	XLnd8ZfmVBhOIlA3F8DZOu1zmTaIw43TrjfVpk3PnoTdTwp53BMb86AD7A5ctLkGuCu7nX6ykRKXs
	Itr2dEnEo8yE47pJOQJlM5QYxRiiYR/9PcsETtqtI9Qcl4mju8L+yw1jgy2dejnJzvtsupASmfga/
	wDdlS2ZHfPW1CFqf4Bqddms0KTG86phpi1hBoHRqE8oS8XCi740CD8NSUyXlPuIAApSVghV6yQAew
	55dlD7R6hjYpsRzaBeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tii-0000000Dm45-1mja;
	Fri, 18 Sep 2026 08:13:20 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tig-0000000Dm31-2Fwk
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 08:13:19 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398cb5615deso539364a91.3
        for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789719198; x=1790323998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8Q4R3WcNNp0vlLFEmxUETFe1fqK6QI+F18+2TYE0xU=;
        b=HyEMDsASU0MVWl8kxOU8tJzTy6Pp/tBGGamkNT1JU50tBArABrcHndc/ka3/+296Z6
         nThM3jL5xKwqKmhs4OCuOqTWh3HFUeK+qUkGlNR2+26DI9M2RXGwMZ1MYMyW74IKDuNe
         Vt9rUdwRrO2wBXJGDMbBqrPM/RtI13rqbtyUVxfKic8mAUL8WzyJbwS27DeEdVxcTDKH
         EYWueSrOEpHBIaOgHOPJoVeXLcUx09KNWIZlwgi2nSE5PZbYx/hw25zMiv8JC6lcXTpG
         /wozpPmgPwGjeBn7Uyr91kSAZgvrYaFO6rRhWIJjBHsvtHcA9kG4I0aKPc5gSsQW2Y3B
         KdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719198; x=1790323998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8Q4R3WcNNp0vlLFEmxUETFe1fqK6QI+F18+2TYE0xU=;
        b=IY4loeJjdjaHZdfquDj3CPyZOg0yHpARfXbwdq1wU6/eOYrAEibz7TzezbrFUBIOj5
         hcbze1NM4oMie0XhfKSZGyCJ56DCSuOL4Zz8vmn1X4ROmkLEFIPC9MGx+q2lmJZfBEdd
         EAPZJLmsG3oXQEHLrNTRuNfESD9dcywcQboCnHRA5V9bezqmM2xebzU4K+a8sjwYqtRJ
         ccvBFsCn3TTWGpWAloi+YNx56jbLY0wihD3TJWi0V7OeTb/GMQMSgQR9FBi5VrBfxZA+
         YhsVdsbrFUTfMlGHBuAZNBn4iw5e6NIfJp1HC2RusXEuB8826yCB2t3JertN8Xem5y88
         SO0A==
X-Gm-Message-State: AFuF++kJ+mRTCmif4tA2ABA9626+XRQkcYr2LbPR9Pr/L9cnh10o1MOY
	0g8f0BMr1Lcz9hU4WdgAAfV8dJ1RbYuTxxE6jc/ZWQGIIo0O5M4wMCYNc7m1WROfwVkifU9qmfi
	S8ADGif/BI15OcgG1wtnBNpGrgElcfZ/KQEfil8+DUsSlSaZB3rxuH32624AG1LardU6bSxznmi
	xwup/Y7UaHigfd0Pr2Ej/O5s+HkIY+Sa20iMw6XgsX7jwc8g==
X-Gm-Gg: AYBFou0SlLsyX7Gzk8Vo9m9GlW+sNAI/XbXcmdmjksLeJDRTpV2GAEUTItXXXISxsGa
	68wTabnd4J9vZXbaxZe3q8PiCTFg1ixs9WW0LmTrq0YRfNXnA1IzgrOKuZKxefM1sJuHNqT7wd7
	2jIvp1W+DkjENINTJDktR+tpdX1ajAiZLCvZptNZl/bG306tGQ0EYkTAk61QGOaLHmNql3WFyHk
	kfsd7do2ZmUb1OI8UyRV4ityN7W/Rgu+T776NffmTYKSo1SYiGpFbXejblRZ7+2FExmwnbW5mI9
	eh161eZwQr+yz8msQCg/vszKwkODygq64qLW0cS89yraebeKOOo4O2hKjCeYFsszGIxvWoxImte
	h5vKOUL1tG9Vu2pUEWQMeSaaeajhcVx7KwKTzRPo7QRrLS9v5AStvtBT7fO+YGZ3U+iNIK3+rb6
	wvSLgvCAMPLk9rKY5UMr0eyOFO2h4Qo8C1fG+r/UaWgNpl8A59DGGuu7dflGTroLPxeU1mkCkvT
	36vJ7wx9XM+lAieFBG3pw==
X-Received: by 2002:a17:90a:d44f:b0:39e:4c81:6c98 with SMTP id 98e67ed59e1d1-39e54fa5ec7mr4393439a91.30.1789719196741;
        Fri, 18 Sep 2026 01:13:16 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm2812649eec.9.2026.09.18.01.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:13:16 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 1/3] firmware: fw_base.S: add a formatted OpenSBI firmware header
Date: Fri, 18 Sep 2026 01:13:11 -0700
Message-ID: <20260918081313.659655-2-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260918081313.659655-1-zong.li@sifive.com>
References: <20260918081313.659655-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_011318_576626_7D690FED 
X-CRM114-Status: GOOD (  17.32  )
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

Add a fixed 128-byte header at the very beginning of every OpenSBI
firmware image, regardless of the firmware type. The header lets the
previous booting stage identify an OpenSBI image and, more importantly,
gives it a well-known place inside the image to hand over information
to OpenSBI by patching a few words instead of setting up registers.

This first patch only introduces the layout:

  - a 4-byte jump over the header to _start_real, so that _start stays
    the entry point of the image. The jump is assembled with
    '.option norvc' so that the fields behind it are always at a fixed
    offset, even for a build with compressed instructions enabled,

  - the 'OSBI' magic, a header version, the XLEN the firmware was built
    for and the size of the firmware image, so that the previous booting
    stage can validate the image and figure out how much memory it
    occupies,

  - a flags word and three 8-byte override values, which are unused
    (and zero) for now and are wired up by the next patch.

The layout is deliberately identical for RV32 and RV64 so that the
previous booting stage can parse the header without knowing the XLEN of
the firmware upfront. Each override value is followed by a reserved
8-byte slot so that the same layout can be extended to RV128 later.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 firmware/fw_base.S | 63 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 0c5c65c1..d01d0574 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -17,6 +17,15 @@
 #define BOOT_LOTTERY_ACQUIRED		1
 #define BOOT_STATUS_BOOT_HART_DONE	1
 
+/* OpenSBI firmware header */
+#define FW_HEADER_MAGIC_VALUE		0x4942534f /* ASCII string "OSBI" */
+#define FW_HEADER_VERSION		0x1
+#define FW_HEADER_SIZE			128
+#define FW_HEADER_RESERVED_OFFSET	0x38
+#define FW_HEADER_FLAGS_OVERRIDE_A0	(1 << 0) /* override a0 with mhartid */
+#define FW_HEADER_FLAGS_OVERRIDE_A1	(1 << 1)
+#define FW_HEADER_FLAGS_OVERRIDE_A2	(1 << 2)
+
 .macro	MOV_3R __d0, __s0, __d1, __s1, __d2, __s2
 	add	\__d0, \__s0, zero
 	add	\__d1, \__s1, zero
@@ -44,8 +53,62 @@
 	.section .entry, "ax", %progbits
 	.align 3
 	.globl _start
+	.globl _start_real
 	.globl _start_warm
 _start:
+	/*
+	 * OpenSBI firmware header
+	 *
+	 * Every OpenSBI firmware image starts with this fixed 128-byte
+	 * header. The layout is identical for RV32 and RV64 (and can be
+	 * extended for RV128 by using the reserved half of each override
+	 * field), so the previous booting stage can parse the header without
+	 * knowing the XLEN of the firmware upfront.
+	 *
+	 * Offset  Size  Field
+	 *   0x00     4  jump to _start_real
+	 *   0x04     4  magic ('OSBI')
+	 *   0x08     4  header version
+	 *   0x0c     4  firmware XLEN
+	 *   0x10     4  firmware size (_fw_end - _fw_start)
+	 *   0x14     4  flags (FW_HEADER_FLAGS_*)
+	 *   0x18     8  override value for a1
+	 *   0x20     8  reserved (upper half of the a1 value on RV128)
+	 *   0x28     8  override value for a2
+	 *   0x30     8  reserved (upper half of the a2 value on RV128)
+	 *   0x38    72  reserved
+	 */
+_fw_header_jump:
+	/*
+	 * Must stay a 4-byte instruction so that the fields below are always
+	 * at a fixed offset. 'norvc' keeps the assembler from picking c.j and
+	 * 'norelax' keeps the linker from compressing it later on, which it
+	 * would otherwise happily do for a jump this short.
+	 */
+	.option push
+	.option norvc
+	.option norelax
+	j	_start_real
+	.option pop
+_fw_header_magic:
+	.word	FW_HEADER_MAGIC_VALUE
+_fw_header_version:
+	.word	FW_HEADER_VERSION
+_fw_header_xlen:
+	.word	__riscv_xlen
+_fw_header_size:
+	.word	(_fw_end - _fw_start)
+_fw_header_flags:
+	.word	0
+_fw_header_override_a1:
+	.dword	0
+	.dword	0			/* reserved */
+_fw_header_override_a2:
+	.dword	0
+	.dword	0			/* reserved */
+	/* Reserved, pads the header up to FW_HEADER_SIZE bytes */
+	.fill	(FW_HEADER_SIZE - FW_HEADER_RESERVED_OFFSET), 1, 0
+_start_real:
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
