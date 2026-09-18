Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B4C982D2
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5b7+vxdktccanSb3cXa1nQivCIlbSFnKBQSMAlrKmQ=; b=3lNkXjzqt6Tkvi
	kq8F16Hj7MO6XHAJusUsZCbfSxBAgy0X/Bv5qGIM5Q7kYA4F783tlksdNpPCz1YUxtR/mBpIixdCn
	JqdTiNo88E9fHFohr7mea2/eIEVbEoZRNXZm/ldfy+C1ZOsuya+75Z8QIG9Uy/rYBF2d0S6LTbeHi
	qu58u/7TfBHkQFNhpFEQ9w5n4OpvI19nnH/43wTdXDKIGSC3iVC8pq3VmTWy6TaPgou8YkJHmHdd7
	zozjk4K06N8WO1+QAp8YJ/SE9KuS5fQo8viCznT1Jm3SiErLc5XWEZqwxDhfOKwx/Zxeue64eKLFR
	o4aS7zyEmDb4sxQSNKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tij-0000000Dm4Y-24GL;
	Fri, 18 Sep 2026 08:13:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tih-0000000Dm3Z-2YqS
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 08:13:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2db710396ffso12632415ad.1
        for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 01:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789719199; x=1790323999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xZxuc3cwnQRD/AlWf5NLqlIYLwUmHH3UO/h3E3OVMo=;
        b=Z1QPaKM78Bbxw9JJ1BDcGW0oCRrNgXNwOA0xs6uL1MsZD4UJrhIShzW8VrOQwp+S1b
         /kvh/LHFz9SUQxgKLi6FOMKHPpRIE9+L8Y3qiI9SRElUzGSy8jt4NJX/cRNDOp1dKM8O
         M0D0dS4z1y5jz2JY4zCvMYVn+1N/ePPQOg567Z1gestGmyoz2ZL3+WnJ0qoqWWeK1zXw
         PgMnyrSpskvcs055gnIkFLUf8rmbpMqcGONjdwwkojfMt17bjxq3x2Gq5Xi1ImZuC81R
         7W4iZk2/nd89qRQ2olB4PvH8gV07ZDTlnAXMdInmn8PQh3JE2SR+m4Z81kcCZXOhsyMz
         0NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719199; x=1790323999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xZxuc3cwnQRD/AlWf5NLqlIYLwUmHH3UO/h3E3OVMo=;
        b=RS7CkzbmcaLTZ0IvkS/h3rpIH+ojCMz/zAnn0r+luVVS/UANIHjNQIUgjtx0BJO43f
         bIDyRcHM4ffR4MK4JCABdaeUD+DptO3g/xap6DtaYclXTDXRlRczHzAVmXeSEQK9leB+
         Hoy0HxfiCJm2h8T5aoDBl9sawp9xl1B3j0yQO2M+3nTqtox5Gb9g/0OcFF0CfXcf0p17
         IuA3TIUK1LRepP7FUC+Dz7x9i0KSWBblPCbm57fLwqHo+gJXuWQAG76C/UelMTlnf3YS
         p+qcU9ML4Y5VHMDjGfT9LN7gt5bCVdaYauscizZFAnoRF27ileN5PIxx4cF26usFSDyV
         bFCw==
X-Gm-Message-State: AFuF++kxdNqn2QdzlvCnGEZ4KEhXxoZhA8b/2yr/yP7pSsPvDR2eIUse
	9+9l4Wp+AprkvFRC22eNK4ZZXntRAWoyWzRvISHEGnVpm2Px8ewRgerTdCgPIWsKnq+yGMxQ7Zu
	UCvqfNfHFMvZkBb8mwEdtZoXuzuLpw4UikA0Sr+VEb2cfsn83kIWPBzNiJKh0yPSFEy7jgLlMg2
	7UTBb+KCfm4u2KL0n5iaanykPzvcQdSf1vksLp5XcMk8/6GA==
X-Gm-Gg: AYBFou2FOPM/VYEQA4P7GJKtOS5FTEGvmOpqLOMOR7K4cWCpsm4D2pYUzu/IuQ5/S36
	SBgkIOGMY+h5FL9WxkNmx859pNl5H6pkN+pYutObSSwgy+i4xjfCgEYD0TsCQX9T4HjGUvqh2vJ
	Xo4X9Q3lTEZXmOxhWZ3WpkQDfjAaMdBeplgHRA30uR9KdWZp988QAx0GWR1KAs8AKVlSgjq8vVz
	t5VGSn7nR77Xlqf6WJ41ejfOHfakMqdRKV+asJLy6VXMz8tAp8SINnnHjM49n4dk5twElKYTX2q
	PBLRTsP00IYFTA4j1Z/0qbVCfoDD9cWw4IvGJT3u/Bu3yyDNnvW99diYfAztiYz+GJUzV8naIhP
	1bwuaBQx0Oq3xJ5TCqGmV/rO0d5fPJBn+yg4sUpYuc9RpB2FmE9aZxi01Ielh6X2Gcw+JdmCFTZ
	4oaWxY4joj8B7ikwbXXHZsv8hFq4tvVkAgP58J10Wcd/3PeEXlEWEqUVm11K/XYzOu2TiQe/eZv
	jN9LG6BpMo=
X-Received: by 2002:a17:90b:384f:b0:39e:455f:36fc with SMTP id 98e67ed59e1d1-39e455f3d97mr5431364a91.28.1789719198491;
        Fri, 18 Sep 2026 01:13:18 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm2812649eec.9.2026.09.18.01.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:13:18 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 3/3] docs: firmware: document the OpenSBI firmware header
Date: Fri, 18 Sep 2026 01:13:13 -0700
Message-ID: <20260918081313.659655-4-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260918081313.659655-1-zong.li@sifive.com>
References: <20260918081313.659655-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_011319_659725_2206499C 
X-CRM114-Status: GOOD (  27.02  )
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
 docs/firmware/fw_header.md | 137 +++++++++++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)
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
index 00000000..62fba808
--- /dev/null
+++ b/docs/firmware/fw_header.md
@@ -0,0 +1,137 @@
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
+| 0x18   | 8    | Override value for *a1*                           |
+| 0x20   | 8    | Reserved (upper half of the *a1* value on RV128)  |
+| 0x28   | 8    | Override value for *a2*                           |
+| 0x30   | 8    | Reserved (upper half of the *a2* value on RV128)  |
+| 0x38   | 72   | Reserved                                          |
+
+All fields are little-endian. The layout is deliberately the same for RV32 and
+RV64, so the previous booting stage can parse the header, and in particular
+check the *XLEN* field, without knowing the XLEN of the firmware upfront. The
+override values are 8 bytes wide on both; on RV32 only the lower 4 bytes are
+used and the upper 4 bytes must be zero. Each override value is followed by a
+reserved 8-byte slot so that the same layout can be extended to RV128 later.
+
+There is no override value for *a0*. Every hart runs the header independently
+when it enters the firmware, so a header field could only ever hold a single
+value shared by all harts, which does not fit *a0*'s role as the current
+hart's own hart id. See "Overriding a0, a1 and a2" below for how *a0* is
+handled instead.
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
+| Flag                        | Value | Description                           |
+|-----------------------------|-------|---------------------------------------|
+| FW_HEADER_FLAGS_OVERRIDE_A0 | 1 << 0| Override *a0* with the hart's mhartid |
+| FW_HEADER_FLAGS_OVERRIDE_A1 | 1 << 1| Override *a1* from offset 0x18        |
+| FW_HEADER_FLAGS_OVERRIDE_A2 | 1 << 2| Override *a2* from offset 0x28        |
+
+For every flag that is set, OpenSBI replaces the corresponding register
+before it looks at the boot arguments. Registers whose flag is clear are used
+exactly as passed by the previous booting stage.
+
+*a0* is handled differently from *a1* and *a2*: instead of being patched with
+a value from the header, it is set to the value of the *mhartid* CSR read by
+the hart that is currently executing the header. This runs once per hart, so
+each hart gets its own hart id, which a single shared header field could not
+provide.
+
+The flags word is zero in a freshly built image, so a previous booting stage
+that already passes *a0*, *a1* and *a2* in registers is unaffected and needs
+to know nothing about the header.
+
+The meaning of the registers is unchanged, so the previous booting stage
+should:
+
+* set FW_HEADER_FLAGS_OVERRIDE_A0 if it cannot set up *a0* with the hart id
+  of the hart that will enter OpenSBI on every hart itself; OpenSBI then
+  derives it from *mhartid* directly and no header field needs patching,
+* patch *a1* with the device tree blob address, which must be 8-byte
+  aligned, and
+* patch *a2* with the address of a *struct fw_dynamic_info*, for a
+  *FW_DYNAMIC* firmware. The structure itself is not part of the OpenSBI
+  image; the previous booting stage has to place it in memory that OpenSBI
+  does not overwrite, which notably excludes the OpenSBI *.bss* section and
+  the scratch space above the firmware.
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
+	uint64_t	override_a1;
+	uint64_t	reserved1;
+	uint64_t	override_a2;
+	uint64_t	reserved2;
+	uint64_t	reserved[9];
+};
+
+struct fw_header *hdr = (struct fw_header *)opensbi_load_addr;
+
+if (hdr->magic != FW_HEADER_MAGIC_VALUE || hdr->xlen != 64)
+	return -EINVAL;
+
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
