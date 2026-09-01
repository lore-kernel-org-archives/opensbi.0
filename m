Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E10BC624CF
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 02:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAvF8M/xjTyddHDBU+DBEgvqgzSCUApFUXliL41FgZk=; b=C/yfmrije8ToDo
	VYoFSHJRNo9mIMoAv9hAemgviUdfVqTRhtviBzx424+1oPGBMUnPRAAmss1B4qU0jnYa+MuwQLVcc
	wEknHG4eGxjmk7NgqkYvrNhx4m1JYkfUoyF1mCojOutz7zwI8DAMVIUiwrdUIPlJ/TLjh1z/H3hr6
	U7SZdYgPYhiQYihpUUZkB6xS2DD/jGYO0ISppkM6WRL4iI4rPszG9DOH2P66JESh3wMN/dcLkKpye
	/Kb2d156Z4Ey7Gw2nY6TxMBrWV9mI84prAkOx8GV45jdXCV+LdXSzOJ9uG39ODagcmCEcH6eNqm8H
	7J2kpwfSpLofa+i1S6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8k-0000000ArhE-2L94;
	Tue, 01 Sep 2026 02:22:22 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8h-0000000Arfs-3emX
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 02:22:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so448612a91.0
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 19:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788229339; x=1788834139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkDHAAfq6OdlCHHpeeeZ8m2vmdS3+JGiEr7G7wcJYO8=;
        b=ZswccM8CQGOnn2EHPJhdFYeaqptgO8v0ubDZaAkAPla+tHUwpOTViDE22R2UIKfIri
         JN7USl2IFQyhCopneDJUIAzrTVPjkmxBSFcVGTOOfFR7tMTba6zhX+D9rpEM9NBt6+fq
         roQD86HmtQwgCuOQY3FAyCB6mjx4+vHRVAT26MeKBEn3nkOciWOW1hfkeHmt+S5dVAhL
         H1HeRB6CyiY5xhpBvGIPUZWPxZ6S+KHYebVjd5HmkyHNN6nv7oMgRPNH9ppKGm1tXfxY
         O2w5bimxf7wYivRfj8loId4znv9f/EjFA7ERED70ZTHNhQXZoEJfQnT0PENKFrKgvAai
         JHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229339; x=1788834139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkDHAAfq6OdlCHHpeeeZ8m2vmdS3+JGiEr7G7wcJYO8=;
        b=Tua0e2PLBZLD22m3NksWMAJQ5cSh0RWlORLVx/lqAshuDx6GwGWX+zXHpy/sNKndsd
         BFEVOAblaB7vGq94Qso38/gkrdELLVnwHenJGgc97e6igXWUauE8rldgZps7OkaSxMhs
         MLdoP9RDwjiIQkO/lxvxYAnGnp1KSD6mThhA8zxmNqrSaWtf2lKI0OVKYSxITmDZtGdt
         ph1tETF39903N4UcpM4jbPgsihXJ+2xlCoR2PXPgAa+pFnsgqQSf++/3jkU6yMF+NnUi
         2EM+mO5E1VxJBw6uEkLqetO3NBXenqcYfeXzVJAFZ/LTaRP82eJcxV189kzuvQp8RowO
         3x/A==
X-Gm-Message-State: AFuF++kRrhL0r5cnRPv0cjn6hAMdyqO5nHBPwQCuSyFrt+3dKiFtqNOM
	Cgi23Lx0GEqVBYBNK7W7QD9Hkjq+iayeed/yTAqHejNmkUn/KoNJL0gQCElbrot0MtWFiKjNHqs
	exrn8BOM4+LpMdsB63EhvQX5rYV1NZerNDfpgDfOkCyh4lyhhuwOqrSRTkas5Tks8YXUPbO04il
	BJBRVypJUHvqj8JLR53HiK4yEnN8OiMK81UegOBsaCWCrWSfBP
X-Gm-Gg: AYBFou30jZkLOnVkOR7acnbQ7uibWAzEFzBSvVlz2V3oUkzzVtB/K02Yn6aRjTpNDTM
	fhAuNb6p5yirTTPKFGQcXCGJEWzYn1gtUt9J9ErrDioXpQ4adWqgxUxUa24gHVcNAqtPTDCDht+
	1zFhkzaIaAbZsRusvb9SmoRzLXw4VNcqcPZ9zs5iDXeYBGKkpcVQhfQRX1CWpeGdNUd0OVtj1XU
	0oRMpnmx+kggZnB7bSrXOVWdPASDerl1HJ2CcYjdTGI0t3mUbPMxKaemI4VCUWr6HravUvyuFJr
	Xt8MIZI1DPF4FwNsQ++SScQxe8WviZOJWePwaIPQP5g7qSSOfOTH7PCtbCgW2eOL5wzElyQvDQ0
	cc3f6hkM3kL+ADI0B2e0ajnZr79A80hX9svLagh3ZlJS7UCfintt4wbOXcwPySyG50/JOxpcHFT
	7zaCv/kntce/VZXHaiJXUgtl9pH9zfM7VTyVmd+ijCS8uR74K2nNnWMcA9cuWkuESGsw7dVEuwj
	w8cX3otxuw=
X-Received: by 2002:a17:90b:1dce:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-396d0ea8b47mr46686545a91.3.1788229338562;
        Mon, 31 Aug 2026 19:22:18 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm33287164c88.6.2026.08.31.19.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:22:18 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 3/3] docs: firmware: document the OpenSBI firmware header
Date: Mon, 31 Aug 2026 19:22:11 -0700
Message-ID: <20260901022211.2619560-4-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260901022211.2619560-1-zong.li@sifive.com>
References: <20260901022211.2619560-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192219_918981_3B7308F1 
X-CRM114-Status: GOOD (  25.68  )
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

Add docs/firmware/fw_header.md describing the layout of the 128-byte
OpenSBI firmware header, the a0/a1/a2 override flags, what a previous
booting stage is expected to put in each register, and an example of how
to patch the header. Also point at it from fw.md, next to the
description of the registers the previous booting stage passes.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 docs/firmware/fw.md        |   9 +++
 docs/firmware/fw_header.md | 127 +++++++++++++++++++++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 docs/firmware/fw_header.md

diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
index d2980967..6b5ff153 100644
--- a/docs/firmware/fw.md
+++ b/docs/firmware/fw.md
@@ -16,6 +16,11 @@ of RISC-V CPU:
 * device tree blob address in memory via *a1* register. The address must
   be aligned to 8 bytes.
 
+A previous booting stage which cannot set up these registers can instead pass
+the same information by patching the OpenSBI firmware header, which is present
+at the beginning of every OpenSBI firmware image. See *[FW_HEADER]* for
+details.
+
 OpenSBI currently supports three different types of firmwares.
 
 Firmware with Dynamic Information (*FW_DYNAMIC*)
@@ -82,9 +87,13 @@ following documents.
 * *[FW_PAYLOAD]*: The *Firmware with Payload (FW_PAYLOAD)* is described in more
   details in the file *fw_payload.md*.
 
+The *OpenSBI firmware header*, which is common to all firmware types, is
+described in *[FW_HEADER]*.
+
 [FW_DYNAMIC]: fw_dynamic.md
 [FW_JUMP]: fw_jump.md
 [FW_PAYLOAD]: fw_payload.md
+[FW_HEADER]: fw_header.md
 
 Providing different payloads to OpenSBI Firmware
 ------------------------------------------------
diff --git a/docs/firmware/fw_header.md b/docs/firmware/fw_header.md
new file mode 100644
index 00000000..7dfca111
--- /dev/null
+++ b/docs/firmware/fw_header.md
@@ -0,0 +1,127 @@
+OpenSBI Firmware Header
+=======================
+
+Every OpenSBI firmware image, regardless of its type (*FW_DYNAMIC*, *FW_JUMP*
+or *FW_PAYLOAD*), starts with a fixed 128-byte header. The header serves two
+purposes:
+
+1. it lets the previous booting stage recognize an OpenSBI firmware image and
+   find out what it was built for, and
+2. it gives the previous booting stage a well-known place inside the image to
+   hand over the boot arguments by patching a few words, instead of setting up
+   the *a0*, *a1* and *a2* registers.
+
+The second point matters when the previous booting stage cannot set up those
+registers at all. A typical example is a system where the previous booting
+stage runs on a dedicated boot processor: it can load and patch the OpenSBI
+image in DRAM and then release the application hart that runs OpenSBI, but it
+can never execute on that hart and therefore cannot place anything in its
+registers.
+
+The first word of the header is a jump over the header, so the entry point of
+the firmware is unchanged: the previous booting stage still jumps to the first
+byte of the image.
+
+Header layout
+-------------
+
+| Offset | Size | Field                                             |
+|--------|------|---------------------------------------------------|
+| 0x00   | 4    | Jump over the header (a 4-byte `j` instruction)   |
+| 0x04   | 4    | Magic value, 'OSBI' (0x4942534f)                  |
+| 0x08   | 4    | Header version, currently 1                       |
+| 0x0c   | 4    | XLEN the firmware was built for, 32 or 64         |
+| 0x10   | 4    | Firmware size in bytes                            |
+| 0x14   | 4    | Flags, see below                                  |
+| 0x18   | 8    | Override value for *a0*                           |
+| 0x20   | 8    | Reserved (upper half of the *a0* value on RV128)  |
+| 0x28   | 8    | Override value for *a1*                           |
+| 0x30   | 8    | Reserved (upper half of the *a1* value on RV128)  |
+| 0x38   | 8    | Override value for *a2*                           |
+| 0x40   | 8    | Reserved (upper half of the *a2* value on RV128)  |
+| 0x48   | 56   | Reserved                                          |
+
+All fields are little-endian. The layout is deliberately the same for RV32 and
+RV64, so the previous booting stage can parse the header, and in particular
+check the *XLEN* field, without knowing the XLEN of the firmware upfront. The
+override values are 8 bytes wide on both; on RV32 only the lower 4 bytes are
+used and the upper 4 bytes must be zero. Each override value is followed by a
+reserved 8-byte slot so that the same layout can be extended to RV128 later.
+
+The *firmware size* field is `_fw_end - _fw_start`, i.e. how much memory the
+firmware image occupies once loaded, including the *.bss* section. Note that
+this is not the size of the flat binary file, which is smaller because
+*.bss* is not stored in the file. OpenSBI also needs some scratch space
+beyond the firmware image, so this field alone does not describe everything
+the previous booting stage has to reserve.
+
+Overriding a0, a1 and a2
+------------------------
+
+The following flags are defined:
+
+| Flag                        | Value | Description                     |
+|-----------------------------|-------|---------------------------------|
+| FW_HEADER_FLAGS_OVERRIDE_A0 | 1 << 0| Override *a0* from offset 0x18  |
+| FW_HEADER_FLAGS_OVERRIDE_A1 | 1 << 1| Override *a1* from offset 0x28  |
+| FW_HEADER_FLAGS_OVERRIDE_A2 | 1 << 2| Override *a2* from offset 0x38  |
+
+For every flag that is set, OpenSBI replaces the corresponding register with
+the value from the header before it looks at the boot arguments. Registers
+whose flag is clear are used exactly as passed by the previous booting stage.
+
+The flags word is zero in a freshly built image, so a previous booting stage
+that already passes *a0*, *a1* and *a2* in registers is unaffected and needs
+to know nothing about the header.
+
+The meaning of the registers is unchanged, so the previous booting stage
+should patch:
+
+* *a0* with the hart id of the hart that will enter OpenSBI,
+* *a1* with the device tree blob address, which must be 8-byte aligned, and
+* *a2* with the address of a *struct fw_dynamic_info*, for a *FW_DYNAMIC*
+  firmware. The structure itself is not part of the OpenSBI image; the
+  previous booting stage has to place it in memory that OpenSBI does not
+  overwrite, which notably excludes the OpenSBI *.bss* section and the
+  scratch space above the firmware.
+
+Patching the header
+-------------------
+
+The header is at the very beginning of the image, so all offsets above are
+relative to the address the image was loaded at. For example, on RV64:
+
+```c
+#define FW_HEADER_MAGIC_VALUE			0x4942534f
+#define FW_HEADER_FLAGS_OVERRIDE_A0		(1 << 0)
+#define FW_HEADER_FLAGS_OVERRIDE_A1		(1 << 1)
+#define FW_HEADER_FLAGS_OVERRIDE_A2		(1 << 2)
+
+struct fw_header {
+	uint32_t	jump;
+	uint32_t	magic;
+	uint32_t	version;
+	uint32_t	xlen;
+	uint32_t	size;
+	uint32_t	flags;
+	uint64_t	override_a0;
+	uint64_t	reserved0;
+	uint64_t	override_a1;
+	uint64_t	reserved1;
+	uint64_t	override_a2;
+	uint64_t	reserved2;
+	uint64_t	reserved[7];
+};
+
+struct fw_header *hdr = (struct fw_header *)opensbi_load_addr;
+
+if (hdr->magic != FW_HEADER_MAGIC_VALUE || hdr->xlen != 64)
+	return -EINVAL;
+
+hdr->override_a0 = hartid;
+hdr->override_a1 = dtb_addr;
+hdr->override_a2 = (uint64_t)dynamic_info;
+hdr->flags = FW_HEADER_FLAGS_OVERRIDE_A0 |
+	     FW_HEADER_FLAGS_OVERRIDE_A1 |
+	     FW_HEADER_FLAGS_OVERRIDE_A2;
+```
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
