Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3FDC624D0
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 02:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jtk6UmVyPC7AkNQgO/Db9mDz1wENY2ryLbP3GlSusSk=; b=QSj5vIuVKf5TRy
	F6aIo0JvGos+PZzSPoVS/DkvUvE8jIp1t0pJ+Vq3JugJQk0+1crYFkv6iffVSS2RYgiDoadMAcs10
	5kVh8W6i/nUbyVdsvS78V4RdOx3s19i1lV0/19UdPD45NpLKaGwOmr45VgxRdezSLvGZyVsTjNxdS
	ND7pn4xWbZDcKuzlJY6M2dArgU5Iv1E/G4699UBHw1nczrjOB3ebvjWuyMEV1cirOQ3wvY253Lmy5
	CQ9V5ixkLskSUm5IXPokKlVcsyJ/klAarwC8hwQwbAss584Mu+oka9GOVJ8SYzkxCPRkR1mIQuQrB
	j7SwRAUslu77ZU99/nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8i-0000000ArgO-1MEz;
	Tue, 01 Sep 2026 02:22:20 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8g-0000000Arf2-0CSG
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 02:22:19 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3720531a12.1
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 19:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788229337; x=1788834137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YrRK2bruEL8IcLW0TtPEHFHsBSp6hl8Y6iUCzFtdy4=;
        b=UmnaYcojmj30N0G+Hypcrss4ERep97P1yMyJj/7uqwLT9FptlpFSpyatEDkpVgiciK
         EHfuOWrghZ9n//F1VGaDDWa0mV89UmrbpzeC3BUM1r01E//NNkvEAkEV2D2h8hx6n7Wc
         C6fjJmP77G+rlCkQiYoY/lBOBlcEuWRQNJspRmtZabt0q8nBbWBJ1KB1wkL7MSYwNdNo
         sB9QQByRB8qagL26EmrzBD1bDMHdQkjPSkzM5goCPxZEB/v6CqvDNBWto1b3epN4+fIJ
         9l6Ml7HkJL6A1UBWANcm+I5jUxxCM2kn7iMxr9w05YTnMmM5LG8SRzFzWo6rC8DfMX5+
         o3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229337; x=1788834137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6YrRK2bruEL8IcLW0TtPEHFHsBSp6hl8Y6iUCzFtdy4=;
        b=aJjXOKB58R493wuExjJlnpCemFDJbGYbmzlxiDfVqxVppgMA7J0upzQ84pPQrNS9Vw
         AXybiDovFwx7WNP7ae8557Rs8kIbc3E2YEaEylDGC2ZliPx9QRER3p2V30CfgIRyfw1a
         MlC/zT/zyjbMmkfCfVB2ccQbTlGhZZUME/XN2HyHz7dARirCoMRivBMJy9Shnchijl0U
         JrnpQ6zqGz9xe3ZnzixvD0uB8J5OxYpF+7vimCSv68FnFTwAq61JXQNgS6kvTCQkbqBS
         N89OJJ7KTLwU3iPOYhaR2/U1S5O+yY3w6CVRSGEkAYgV6mbagn7Ezf/zmOoAxgCFLVKh
         kaGw==
X-Gm-Message-State: AFuF++no5kvfVYQxVqYb0fyQNAAycAoPHjXknH2o6J1ZJVb5hN0iRkS4
	Ili4uOeXYPTTNSt1oEgSliwri6VrKO7FbBqAzYN443bKeLjkfT052GlpGK+Fnvwg/8/93cEMCQ7
	WbAxoMAE+2uwgb3VmZT2Qh1SIV3QHmVUiLZoQCYLbphzr+/eEcijYTo3/wUJd619+y/zqsojV8K
	Odt8nd2SbMkZ5Hjj6Sca6wwUgY5uPFGaB2ekIMAVKOghvA5g==
X-Gm-Gg: AYBFou3QaCUKVl52sJ+8hNvsprkhtefG8xlTo5CPGUcti9qO5IsCVXOr0gZOlpK9TCG
	tIchhTnXo9U209LGYoeqnB8uvJnT7Lxd42wUGasUZdqBV1pxxY65LH8qay7ZU9InfBpCOf1kARl
	zCcoTqa+0gurRgWlhi+2TO/IqAVw2tgvfggvKOlZGcW+FPtRNzwHcGm8f0BltuY9D/L6LtLPTfI
	MNkFd7x67dvOlS1eyCeqEi0w96ySYrDfN8BuNIGKKIfZq2YI2jQtiCAy4P+XiL5zvZrktDhKIWo
	INjp5ut6MYXVntIC2QSKb8uvORH1vSli65UpqMQ7S8qtqmXloTajjM7d/7b30LZ8wEQTPe9pHzY
	3nb+KLeuqtnMuYNmC/dAh7I4rpr3tdAAVKf03mfKrjNERU1isNFm8QprjLeLdOKY+j2c72u6Qqj
	luG5dmsFBRuBM8Kvyr9y7A3c0Bcks7pXwmGnERwdoklje69LDxVHJusUyWi8rwLMyypfSnQkdX
X-Received: by 2002:a17:90b:37d0:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39907b66052mr7158009a91.5.1788229336703;
        Mon, 31 Aug 2026 19:22:16 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm33287164c88.6.2026.08.31.19.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:22:16 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/3] firmware: fw_base.S: add a formatted OpenSBI firmware header
Date: Mon, 31 Aug 2026 19:22:09 -0700
Message-ID: <20260901022211.2619560-2-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260901022211.2619560-1-zong.li@sifive.com>
References: <20260901022211.2619560-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192218_104682_2CC083B3 
X-CRM114-Status: GOOD (  17.29  )
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
 firmware/fw_base.S | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 0c5c65c1..dd2adb8a 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -17,6 +17,15 @@
 #define BOOT_LOTTERY_ACQUIRED		1
 #define BOOT_STATUS_BOOT_HART_DONE	1
 
+/* OpenSBI firmware header */
+#define FW_HEADER_MAGIC_VALUE		0x4942534f /* ASCII string "OSBI" */
+#define FW_HEADER_VERSION		0x1
+#define FW_HEADER_SIZE			128
+#define FW_HEADER_RESERVED_OFFSET	0x48
+#define FW_HEADER_FLAGS_OVERRIDE_A0	(1 << 0)
+#define FW_HEADER_FLAGS_OVERRIDE_A1	(1 << 1)
+#define FW_HEADER_FLAGS_OVERRIDE_A2	(1 << 2)
+
 .macro	MOV_3R __d0, __s0, __d1, __s1, __d2, __s2
 	add	\__d0, \__s0, zero
 	add	\__d1, \__s1, zero
@@ -44,8 +53,67 @@
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
+	 *   0x18     8  override value for a0
+	 *   0x20     8  reserved (upper half of the a0 value on RV128)
+	 *   0x28     8  override value for a1
+	 *   0x30     8  reserved (upper half of the a1 value on RV128)
+	 *   0x38     8  override value for a2
+	 *   0x40     8  reserved (upper half of the a2 value on RV128)
+	 *   0x48    56  reserved
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
+_fw_header_override_a0:
+	.dword	0
+	.dword	0			/* reserved */
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
