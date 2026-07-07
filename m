Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C434CC44503
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnYsTqec4ybuhJfTsBJe3iJDGO4Q/EpRXomgItm4dZw=; b=jRE57w/IXI1VPH
	7zahBFRzDN7QBy77B1p/vOTpq7ZI6aGzSkouEBZfyJ78eA5y9AeXnjQmCx/IBmx+PWETGr5Y95BC5
	DQQf0o2qqt1mfTOtsu6m/PHoWDmQiJYGlGHnlXcX/cirFga9DVloH8ekH7bks7ke0JXtwuw+0TruB
	C5EJQRwePjAYKCBzmbS4hNXUOSh/cii2VXGE3fdJLFyhWVmbr+m/S/A4EdqZWKWpot5oCQAHU8XuB
	LmprtQskS6OzsfJU3dejQxSwzq85xjeS6igq5L7jid27CEb0oJg58E/6Pwj+Be4UydNscDl/dvMR3
	kU/VFTeQhizo4JXgk2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfJ-0000000E19l-1Z84;
	Tue, 07 Jul 2026 03:40:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfC-0000000E16f-2LWU
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cacf197759so59150665ad.2
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395601; x=1784000401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ePIhBDqbhdu2ZL+HY+a4/zKxKumorckSPegi9Jv4f8=;
        b=UEaiKWYciymGY6nCZxvnHcLAl9u+zD+r4tiMuTGuNPO3qRI7TixiR6BoIdcyJtY1QV
         zUzVHEiRwRH5PBN2Hvk32fcxDyMNWbqYj1tkP/UXSYFBLDC/7gtOq85dURCFfJNMbIPj
         AT/iAJd7ecCyDHEKWJ2+rhiMSPPN/dcgk+zVbag7CXKcbfB/L8tE7xFjr/OPccP2usEQ
         YC0zMPLC1zgyY8brsLGQSkTg/dISSWlMfImIucmUk/0loMo14xrT2hsC2+GJ+8tAqy/9
         gPPlqWfbvZ6C+QMKU5gYhb9j8SpC8wU5XX6jkJ6iJLGlPiPqMavt6Ygu4mP6sviKZASl
         dkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395601; x=1784000401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ePIhBDqbhdu2ZL+HY+a4/zKxKumorckSPegi9Jv4f8=;
        b=fj4mRt8ofuYBhOcSg0zpzwnYk0mRwC2ndUq+Mw97+Lj36W4POjUAuzAf32R9Bnq30a
         KwEJS7d9JaR/At7y9Aw7cehZnn5br9ZWwkDGlZLEwfwT6V4LcLbpw4oFnVlpmJmXPfzM
         w0/0BU+wl+eck1JVfL8rVtHeOug9WuzWj4vDUVu5yuIyYilU4qKy5upHeKZAtnVZrJi1
         RaytBL2QYnqjK18NzZZLNSS8VCKztVZZLWb52MLRx6wxN83SwAAN6fd8IdbbuZkoUWyU
         XNc3+ZDwBIlhAkcKHv9oNDXL1rYjyaZS6/IdO/zjisVZ/O3H7wPnQjhwnQGnEaCVZRVP
         USsQ==
X-Gm-Message-State: AOJu0YyT294PPwHW0h2BQWbyWVFFcxMpIAuvtI5pd0joAPlKCF7YY/sL
	s24pM2cBAQBozs1lkmz140kCV8Yfze251qOMYX9aWTO60XMA6yJ4GqbDN4CVmvyOz4DbxIpqLvL
	F0rsQw9SNMT0Tfb9HnXExsExkzJU4weXaBy8x7OokXX8rqPwC79xK3mx4zOBSL5nTebF+D83GjZ
	E5irzwfhwZgmONjvmTMI/G0wlgcCT+8CFAKvxZMzNHD0PdNKJt
X-Gm-Gg: AfdE7cnNvpq912Bq4/lzMWgrD0NUWUCBv4gxVi6GRR+CBcimWjKSDmMfMz57rbKYwqX
	4Ts/tmaarBAg1chpWY0CVpdk1rw2yMsIEZWio6e4bbHJ2uorH1Rk2SW9/huTQQSb2IDMZzsB+U+
	BuWPAG3K7QtjSNpbyyhdBeFNb0XJsiMsFHk0gpA1G+i1h2anc7URgu8hDgETwDms+NWfGZPdPgb
	iWLtCGzO+DOCcvj2UbyP/1CHA1LZmG9q85BoDyEnXRTw2sQsGeMG4tnC3Fl3w1kKWUjtoOj4pHb
	EXlWABQ15XWv6z95HYkSFzQCNIzNpDy9J+yJKQs09+2BtFbfOzcx6Bk/N7xQ/gVXIjFJ/v596tc
	VthTB/UVWqJ7q2Dk/wrZW92zwMJAxbn+oLhgmyLwABY85ziHPDgIFMzGxDZbyDXuwqJlPjMs1D8
	O6Vco4nO1+Ex8/HZQwHSzAGkm8
X-Received: by 2002:a05:6a21:4d8b:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3c08ea52ccemr4210663637.0.1783395601277;
        Mon, 06 Jul 2026 20:40:01 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:40:00 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 5/7] firmware: build and enable the FW_DYNAMIC_APPEND firmware type
Date: Mon,  6 Jul 2026 20:39:52 -0700
Message-ID: <20260707033954.2054859-6-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
References: <20260707033954.2054859-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_204004_551505_97F6A22D 
X-CRM114-Status: GOOD (  12.34  )
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

Wire up the new FW_DYNAMIC_APPEND firmware type into the build system and
platform configuration.

- firmware/objects.mk: register fw_dynamic_append.bin so that platforms
  can opt in by setting FW_DYNAMIC_APPEND=y. The generic firmware pattern
  rules in the top-level Makefile pick up fw_dynamic_append.S and
  fw_dynamic_append.elf.ldS automatically.

- firmware/external_deps.mk: fw_dynamic_append.S includes fw_dynamic.S
  (hence fw_base.S), so it can embed a device tree via FW_FDT_PATH just
  like the other firmwares. Add the matching build dependency so that
  changing the FDT correctly triggers a rebuild of fw_dynamic_append.o.

- platform/generic/objects.mk: add FW_DYNAMIC_APPEND=y so that
  fw_dynamic_append.bin is produced as part of the default generic build,
  without having to pass FW_DYNAMIC_APPEND=y on the make command line.

- platform/template/objects.mk: add a commented FW_DYNAMIC_APPEND entry
  alongside FW_DYNAMIC so platform authors are aware of the new firmware
  type and how to enable it.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 firmware/external_deps.mk    | 1 +
 firmware/objects.mk          | 2 ++
 platform/generic/objects.mk  | 1 +
 platform/template/objects.mk | 9 +++++++++
 4 files changed, 13 insertions(+)

diff --git a/firmware/external_deps.mk b/firmware/external_deps.mk
index 6264005b..945715fc 100644
--- a/firmware/external_deps.mk
+++ b/firmware/external_deps.mk
@@ -8,6 +8,7 @@
 #
 
 $(platform_build_dir)/firmware/fw_dynamic.o: $(FW_FDT_PATH)
+$(platform_build_dir)/firmware/fw_dynamic_append.o: $(FW_FDT_PATH)
 $(platform_build_dir)/firmware/fw_jump.o: $(FW_FDT_PATH)
 $(platform_build_dir)/firmware/fw_payload.o: $(FW_FDT_PATH)
 
diff --git a/firmware/objects.mk b/firmware/objects.mk
index bfec4671..d4548523 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -28,6 +28,8 @@ endif
 
 firmware-bins-$(FW_DYNAMIC) += fw_dynamic.bin
 
+firmware-bins-$(FW_DYNAMIC_APPEND) += fw_dynamic_append.bin
+
 firmware-bins-$(FW_JUMP) += fw_jump.bin
 ifdef FW_JUMP_OFFSET
 firmware-genflags-$(FW_JUMP) += -DFW_JUMP_OFFSET=$(FW_JUMP_OFFSET)
diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index ca7fb8b7..91c0a49e 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -23,6 +23,7 @@ platform-objs-y += platform_override_modules.carray.o
 
 # Blobs to build
 FW_DYNAMIC=y
+FW_DYNAMIC_APPEND=y
 FW_JUMP=y
 ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
diff --git a/platform/template/objects.mk b/platform/template/objects.mk
index 9b4bc928..368bc922 100644
--- a/platform/template/objects.mk
+++ b/platform/template/objects.mk
@@ -51,6 +51,15 @@ platform-objs-y += platform.o
 #
 FW_DYNAMIC=<y|n>
 
+#
+# Dynamic firmware with appended info configuration.
+# Same as FW_DYNAMIC, except the struct fw_dynamic_info is appended to
+# the firmware binary (before .bss) instead of being passed in a register.
+# Optional parameters are commented out. Uncomment and define these parameters
+# as needed.
+#
+FW_DYNAMIC_APPEND=<y|n>
+
 #
 # Jump firmware configuration.
 # Optional parameters are commented out. Uncomment and define these parameters
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
