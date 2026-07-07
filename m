Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A9EC44500
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+P3fZ+m0G/Sb0sCU0V9LtyNZhF0DITTjHu6+tDLNajw=; b=r76Kolrk8QALA5
	Rzm9OXBk5YW1OxpdZRGdVkWRLs9uKyloS9C2rHt5m7k6j8G0RCukjMZMy6RAG8RUq4vf6cj0WLnEo
	0wz/jxii5EXDMWRA3UKoNeQAoUwnDPRggJGkjFhbDs+aFGsYXBSlbkQTFyaUdx14imBrD+DOdGPOW
	GcGYQuBvK5WeOnbs5ioI424VnAQ0pCJknPIqGz60Fp9KXJ5ZdSmp85OaoLxCmSie1xfTHudytrzB4
	ZEbArAbJm9L79/ktX56UXvfqSyRSpdazuU0E5taOfXELx78rAC7rSRVGHTIzqQcoTG6c4DMRh1acN
	XE2WBUE1G3gY0iK+gcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfE-0000000E17Q-2oVI;
	Tue, 07 Jul 2026 03:40:04 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwf8-0000000E14l-2R7m
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:01 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso2637363a12.2
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395597; x=1784000397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=au/j54oO3A7KJPDGsUdK2UwQk1HqkqMU2sQD1xi8e6Y=;
        b=RMje5mJntathNA3UOuiW6xXMQB4baeQ8bembOF9HLQqJ3/AlEPClpzWIH32qcSOMq+
         WymBA8BDd0IDAby0oK6iFnM3uZn8JyIu74g8mLWfQwlGGPDF5wXbjAihx1NUf7sb/KJe
         fulp8wm36VqOCvqOvalXxRLcLrhIsaUQIXr+guwhRGjQGRZYm4gMhWqduSSGsr8j5gne
         wJMw3g+AA6JpLpsU/t2zqVwpif4CCKx7tRyuFVA+QkT/HQMZ3IMHpEfrmqirR6oLwkMH
         j6A2J3NvYTkIpqVt5e6tRGBWsElQ+ujHj4cvp5QjUJFkRoLMSGB4TYKLchibPJ1XaHr+
         fd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395597; x=1784000397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au/j54oO3A7KJPDGsUdK2UwQk1HqkqMU2sQD1xi8e6Y=;
        b=DrDHB3sIIdu6XYnDdbqcQBADJhPTiuCvH0oxHmr0enIVgr3lBFuWJOc7BlblNHTjy3
         mn87FxXQ2WuiX8aQ8VdA2IVaQyzmQs8e7AXQWyZRrTVlqDD7bvMN8PcQLTTKKFghKRQU
         RakJQcMr5UggvDcvgPtPEycajdBQgz67jbjNNgFOJ7ShvKlumNj42MaXjZ/clUfaUZwP
         LPmxLS6NeMXk6Mw0m+DjsKHhdE9IHhNZ0vkXv/pRLH6vnT4Io5BikizbNIdW46hv4rVI
         CN+EwuY3rGYq8kMQ2RnA3OeDuFXATAbrHgpnpfObWJTWH7j8McGjHTVXDb7zlep3nvDn
         LC1g==
X-Gm-Message-State: AOJu0YyVZtrPoAJhUlWagvng+WaMwy6SYqnwkv5zeaBIoUSj/JRinyLB
	HZHZfTJNGNeWjnfVPwTvkjPN2La0fClSw5c0+4YzK469xQA55tRWmpfOPzLKg0rLjq5ky76deE9
	+zvI1bojWVE4V+ebDgqoSlADb45fBisMRmrN85Qzg+5+vpkW2e9xsiQG6lhG9uYGL66Qwwg/4s9
	hiMPVKL1WB3rGF2jlfWMWjd1S3xJ2IvWIP1E5ngVsHwPThPQ==
X-Gm-Gg: AfdE7cnShWn1MiKyx7fvVOu8T9hRvB4JM3GIwN/oWdYXNYNoLYmnioGgb2dcZ4t1KNV
	jCSdCUf5NlEGiZz6tuIT1MJkMcwSYZM6Le3gqD8zItS3/RS6nj4hRGhTJgzTx30iJlmgwIGGlUT
	2lnITI5Chnm9p3EED1outXXYG22SPIRsUAJ7Gjyijzr2aTVx3aX8u+UZoXmYqhrzHJd73vWBhyb
	bB2clwh9aOFF1QK58h3Ji0R3sun8ZptQc0/P3JHQSR5oQRD4qxsvc8/KFHpbYhG0NWacu85fpdr
	7aAIJG5sulkGoPymoSjisvs4lzp/Zp7OfXdHOzBhgWp/2LXAfJ92DPfOM3dofD2lKc9GzfLHKo1
	lf33QgqaThEpA4LPpxQ9dWk7K++KFZX74vv+e2e63/22sbpysh766viK0ceMPU6T0+cqTUrQSPW
	5mVCvvQPsp65o7guM9K2RykxkL
X-Received: by 2002:a05:6a21:689:b0:3b3:fdb0:2288 with SMTP id adf61e73a8af0-3c08eabffc0mr4072357637.0.1783395597056;
        Mon, 06 Jul 2026 20:39:57 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:39:56 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/7] firmware: add FW_DYNAMIC_APPEND firmware type
Date: Mon,  6 Jul 2026 20:39:47 -0700
Message-ID: <20260707033954.2054859-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_203958_655842_4953F0A4 
X-CRM114-Status: GOOD (  16.70  )
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

This series adds a fourth OpenSBI firmware type, FW_DYNAMIC_APPEND, next to
the existing FW_DYNAMIC, FW_JUMP and FW_PAYLOAD.

Motivation
==========

FW_DYNAMIC requires the previous booting stage to build a struct
fw_dynamic_info in memory and pass its address in a2. Some booting stages
cannot easily allocate and pass such a structure, but they can load the
OpenSBI image and patch a few words at a known location before jumping to
it. FW_DYNAMIC_APPEND targets exactly that case: the struct fw_dynamic_info
is appended into the OpenSBI binary and patched in place by the previous
stage. For example, the previous boot stage runs on a dedicated hart.
Therefore, it cannot set up CSRs of another hart that runs OpenSBI.
This scenario will occurs in server systems with secure boot.

Key design points
=================

  - The appended struct fw_dynamic_info is placed immediately before .bss.
    .bss is NOBITS and is dropped by 'objcopy -O binary', so a structure
    after it would not be part of the flat .bin. Placing it before .bss
    makes it the last PROGBITS content, i.e. it sits at the tail of the
    .bin and can be located from the image size. The previous booting
    tage can therefore find the structure at:

        load_address + binary_file_size - sizeof(struct fw_dynamic_info)

  - struct fw_dynamic_info gains a new 'boot_dtb' field (info version 3)
    to carry the DTB address. Existing offsets are unchanged.

  - The previous booting stage patches every field at runtime. The
    reservation is a KEEP() PROGBITS section, so the zero-initialised
    bytes still land at the tail of the .bin.

  - On the cold-boot path (guarded by FW_DYNAMIC_APPEND), fw_base.S calls
    fw_dynamic_append_boot_args() in fw_dynamic_append.S. The helper sets
    a0 = mhartid, a2 = &appended struct, and a1 = boot_dtb, and clears the
    reserved a3/a4 that fw_platform_init consumes. Only a0-a4 are handled
    here, the remaining GPRs are already cleared by the existing _reset_regs
    later on the cold path. The boot_dtb load is gated on info version 3, so
    an older layout leaves a1 = 0 instead of reading past the struct.

Backward compatibility
======================

All changes for the existing three firmware types are compiled out: the
fw_base.S fixup and the .fw_dynamic_info output section are under
#ifdef FW_DYNAMIC_APPEND, which is defined only by fw_dynamic_append.S and
fw_dynamic_append.elf.ldS. FW_DYNAMIC, FW_JUMP and FW_PAYLOAD binaries are
byte-for-byte unchanged.

Build
=====

  make PLATFORM=<platform_subdir> FW_DYNAMIC_APPEND=y

On the generic platform FW_DYNAMIC_APPEND=y is set in
platform/generic/objects.mk, so it is built by default.

Zong Li (7):
  firmware: fw_dynamic: add boot_dtb field to struct fw_dynamic_info
  firmware: fw_base.ldS: add .fw_dynamic_info output section before .bss
  firmware: add fw_dynamic_append firmware type
  firmware: fw_base.S: call fw_dynamic_append_boot_args on cold boot
  firmware: build and enable the FW_DYNAMIC_APPEND firmware type
  docs: firmware: document the FW_DYNAMIC_APPEND firmware type
  docs: firmware: list FW_DYNAMIC_APPEND in fw.md

 docs/firmware/fw.md                |  19 ++++-
 docs/firmware/fw_dynamic_append.md | 110 +++++++++++++++++++++++++++++
 firmware/external_deps.mk          |   1 +
 firmware/fw_base.S                 |  11 +++
 firmware/fw_base.ldS               |  24 +++++++
 firmware/fw_dynamic_append.S       | 106 +++++++++++++++++++++++++++
 firmware/fw_dynamic_append.elf.ldS |  24 +++++++
 firmware/objects.mk                |   2 +
 include/sbi/fw_dynamic.h           |  17 ++++-
 platform/generic/objects.mk        |   1 +
 platform/template/objects.mk       |   9 +++
 11 files changed, 322 insertions(+), 2 deletions(-)
 create mode 100644 docs/firmware/fw_dynamic_append.md
 create mode 100644 firmware/fw_dynamic_append.S
 create mode 100644 firmware/fw_dynamic_append.elf.ldS

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
