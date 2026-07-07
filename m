Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0D6C44502
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuCOD0M3v4BGSj4BtM4la4Hs8HP5rVNF0ruThvs7xuQ=; b=E8yD+gY+bcMblu
	Jt0goJAO8+YG0WgL3Qj0jax3yco78aGxVlhKLQSgLE1wiOokGJUJRMFyJn/JCDVy3AwpqFU5TO//+
	OfNUeLPC5Q2q44sGWvylCqBMK9MB1mvJj2nXLfz24AYO1fYN822ZjeEMwATcXBaK6Zf32uCXRSGbk
	86LJUv4mUakYuWKQDjDax1RpmNeYiBhX15ePiTfoPVnRZ18D292aRj2/3PPoh9lk+EAZPgsQPQe47
	seQZ+4d05J/Q/gQZKCYYYAY5M2xE3NYqzBcLStwHjL5d2WpunTToT73L8dXSJnRIzSDEceB9RNiAT
	q42sGEZru+JIkyZQsXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfJ-0000000E19P-0gDq;
	Tue, 07 Jul 2026 03:40:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfD-0000000E16h-2j7x
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:05 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-381ed661712so3314339a91.2
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395603; x=1784000403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOhCjBAlQuHKoUkruuDk+2MClQldMQ0d+EjFJ1mza+8=;
        b=edamv7YAGCvc7DLEO8W1htgcF8I4Xu0lKUTNfjcu3z93eswY/g/yMqiAFwjhPYDf4R
         FHZFyF7e05ZJAOdVmXmrIMWOVXFbySQq7S38wohWavvhZS13hqdvm80TqgW6LiJtdpC6
         ZoS1EMR5+1zWy0kyGdfZcmU36pIbcKvtEpkqTo4v3XE848KMkBaPlCfUMAKBBUAgEhiZ
         Poi+rx4mJ/XmiYE0nGCyivAFiMe3saE5ikQpKegXKxK8JGro5cQFuBOalzi7g+TrHr8t
         539ALChb8u+ofko3kG8QPqKCHVs9Xr1zN6XhIgLRsZKAqrk0PhXZP9Cw3koWirojKUz6
         +CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395603; x=1784000403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOhCjBAlQuHKoUkruuDk+2MClQldMQ0d+EjFJ1mza+8=;
        b=HLSN7+5g6QHm8eaAwyHJyblk5rSHe/86lR4QtHx/KkFVEkb7eUr4fS38HG+QthcWcH
         KBopr0gClv5qYo2wAz2pVREX9HimykXdexNE44ztOm8BqClEBstqJyVQwgi6vhVVdxMp
         NM0lYGsEa7lSQuLryiw+S/iyqyyW+gtqsX/MRlcIMwyRDoCNKD2ajIq9hQy+r+mKdfmH
         qaEkxkTJXO/sdfFmMQha52Zqz8Kv+E13Xchnxgp67pbfLK3Bg33eh9tOAv22g/KXS/b3
         MbdbgDo+7Z5Wags5/6afQ8TTUg2iiR5hCTnGl2a9rCVgk2g8UHGfEOuf2rq48niJi2hs
         VahQ==
X-Gm-Message-State: AOJu0Yx7PQcVIIMNjPFZg/XwVrlylxf9G7EyEPKaw46/YMmekzy++HBq
	ld/cIvB2Aa2jt75FnmdvKuczQ33hJ10MLpxJpzYqxpNnk9AHQ+tAGuMc639/PzF2I3lHLZqDiFC
	KlgKLPuN5QSRVBMZ9DnVsuvkCbZldWJbE6uJrA9r/gXbDfabvWdiNLiGcXVsMpY+IE6nowxFA42
	baruJWZ/Qla3OmXNZ+S/iEO6PAkyaergk2lyac6U1dqIZhAW6j
X-Gm-Gg: AfdE7clZ8kcrr5BptCSXp2YADp8xY6pP5hUEj0YRuoelAowGg3p1WoXwm3XUeqjaPTU
	laT/fbZnGQQXlWQsfMZiXEnMjzO5aGox4WBDrFfCHuETjreDT/isKvcDAU9MBcNHXY0nkTEgSX8
	gQgE0g/rmZ4LcjqHPiLoobK/q1OO1gSXn2Kxg2hgBg5erDCq6yvtxxWzSpHz1y8IJExneLjJrHs
	kN9euFgYB+2I256+hjlnM5TD9KvrhK9wS0pJ41I7XGVYVzZTu7e2EEW6fwGi37RBIOHnrKEC///
	10QF+coMT61oVeMw2T+VKno5nz9ny4HEdnrBD9ncO8V6sxRDlrhTeqqfJVvL51rp/adQ1f2UMeX
	t0kwZVppfBjZTlQGFYb3HRXhrMaRhjkrhE0d5A6Yvj/sxyZYkTMcJeMZ5TOKubKs23xM9o3GR9u
	c0qvXI/aX6h6QW1kPZCrUt4nlf
X-Received: by 2002:a17:90b:270b:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-387572b45fbmr3204516a91.18.1783395602340;
        Mon, 06 Jul 2026 20:40:02 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:40:01 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 6/7] docs: firmware: document the FW_DYNAMIC_APPEND firmware type
Date: Mon,  6 Jul 2026 20:39:53 -0700
Message-ID: <20260707033954.2054859-7-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
References: <20260707033954.2054859-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_204004_559372_67323D18 
X-CRM114-Status: GOOD (  25.43  )
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

Add docs/firmware/fw_dynamic_append.md describing the new firmware
type: how it differs from FW_DYNAMIC, why struct fw_dynamic_info is
appended before .bss (so it stays inside the flat .bin), the version 3
structure layout with the new boot_dtb field, that the previous stage
patches every field at runtime, the boot register setup performed by
fw_base.S, and how to build it.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 docs/firmware/fw_dynamic_append.md | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 docs/firmware/fw_dynamic_append.md

diff --git a/docs/firmware/fw_dynamic_append.md b/docs/firmware/fw_dynamic_append.md
new file mode 100644
index 00000000..25e951d9
--- /dev/null
+++ b/docs/firmware/fw_dynamic_append.md
@@ -0,0 +1,110 @@
+OpenSBI Firmware with Appended Dynamic Information (FW_DYNAMIC_APPEND)
+=====================================================================
+
+OpenSBI **firmware with appended dynamic info (FW_DYNAMIC_APPEND)** is a
+variant of the FW_DYNAMIC firmware. Like FW_DYNAMIC, it gets information
+about the next booting stage (e.g. a bootloader or an OS) and runtime
+OpenSBI library options from a *struct fw_dynamic_info*.
+
+The difference is *how* that structure is delivered:
+
+* For *FW_DYNAMIC*, the previous booting stage creates a struct fw_dynamic_info
+  in memory and passes its address to OpenSBI via the *a2* register.
+* For *FW_DYNAMIC_APPEND*, the struct fw_dynamic_info is *appended into the
+  OpenSBI binary itself*. It is laid out immediately before the *.bss* section so
+  that it is the last byte-content of the flat binary (`.bin`) image. The
+  previous booting stage locates the structure at the tail of the image, patches
+  its fields at runtime, and then jumps to the OpenSBI entry point *without*
+  having to set up the a0/a1/a2 registers.
+
+A FW_DYNAMIC_APPEND firmware is useful when the previous booting stage cannot
+easily allocate a separate struct fw_dynamic_info and pass its pointer in a2,
+but can load the OpenSBI image and patch a few words at a known offset (the en
+of the file) before jumping to it. For example, the previous boot stage runs on
+a dedicated hart. Therefore, it cannot set up CSRs of another hart that runs
+OpenSBI. This scenario will occurs in server systems with secure boot.
+
+Why the structure is placed before .bss
+---------------------------------------
+
+The flat `.bin` image is produced with `objcopy -O binary`. The *.bss* section
+has type NOBITS and is therefore *not* stored in the file. It does not count
+towards the binary file size. If the appended struct fw_dynamic_info were placed
+after *.bss*, it would not be part of the `.bin` file and the previous booting
+stage would compute the wrong address for it.
+
+By placing the structure right before *.bss*, it becomes the last PROGBITS
+content and sits exactly at the tail of the `.bin` file:
+
+```
+ .text | .rodata | .rela.dyn | .data | .fw_dynamic_info | .bss (NOBITS, dropped)
+ <------------------- .bin file size -------------------><--- not in file --->
+                                       ^ struct fw_dynamic_info (image tail)
+```
+
+The previous booting stage can therefore find the structure at:
+
+```
+    struct_addr = load_address + binary_file_size - sizeof(struct fw_dynamic_info)
+```
+
+The structure layout
+---------------------
+
+FW_DYNAMIC_APPEND uses struct fw_dynamic_info version 3, which adds a *boot_dtb*
+field after *boot_hart*:
+
+| Field      | Notes                                   |
+|------------|-----------------------------------------|
+| magic      | 'OSBI' (0x4942534f), patched at runtime |
+| version    | 3, patched at runtime                   |
+| next_addr  | next stage entry, patched at runtime    |
+| next_mode  | next stage privilege mode               |
+| options    | OpenSBI library options                 |
+| boot_hart  | preferred boot HART id (-1 = lottery)   |
+| boot_dtb   | DTB address, patched at runtime         |
+
+In the OpenSBI image the structure is reserved as all zeros. It is a placeholder
+only. The previous booting stage is responsible for patching *every* field,
+before jumping to OpenSBI. Because the reserved block is a PROGBITS section that
+is KEEP() in the linker script, the zero bytes are still emitted at the tail of
+the `.bin` (unlike a NOBITS/.bss reservation, which would be dropped).
+
+Boot register setup
+-------------------
+
+Because the previous booting stage does not pass a0/a1/a2, the OpenSBI cold-boot
+entry path (in firmware/fw_base.S, guarded by FW_DYNAMIC_APPEND) synthesizes the
+expected boot state:
+
+* all general purpose registers are cleared to a known state,
+* *a0* is loaded with the current *mhartid*,
+* *a2* is pointed at the appended struct fw_dynamic_info, and
+* *a1* is loaded with the *boot_dtb* field from that structure, but only when
+  the appended structure reports version >= FW_DYNAMIC_INFO_VERSION_3 (the
+  version that introduced *boot_dtb*). For an older layout that lacks the
+  field, *a1* is left at 0 rather than reading past the end of the structure.
+
+From this point the boot flow is identical to FW_DYNAMIC. Only the cold-boot path
+is affected, secondary HARTs enter through the warm-boot path unchanged.
+
+FW_DYNAMIC_APPEND Compilation
+-----------------------------
+
+A platform can enable FW_DYNAMIC_APPEND firmware using any of the following
+methods:
+
+1. Specifying *FW_DYNAMIC_APPEND=y* on the top level make command line.
+2. Specifying *FW_DYNAMIC_APPEND=y* in the target platform *objects.mk*
+   configuration file.
+
+For example:
+
+```
+make PLATFORM=<platform_subdir> FW_DYNAMIC_APPEND=y
+```
+
+The compiled FW_DYNAMIC_APPEND firmware ELF file is named *fw_dynamic_append.elf*.
+Its expanded image file is *fw_dynamic_append.bin*. Both files are created in the
+platform specific build directory under the
+*build/platform/<platform_subdir>/firmware* directory.
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
