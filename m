Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4047AC3ABDA
	for <opensbi@archiver.kernel.org>; Thu, 15 May 2025 02:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cS0CsT66I8sXbKAICqyx6rgmCRsYUCoRk0ULhoFSRPA=; b=B+i8Yz/Ozt/5FC
	DzZqDUdB17UOxJEslDVL/7/7hlAq1Xs932EFUrwNb6oqXS4iuZYBhKkVAS1KZM3NX1/gQI0u7JALN
	QmamhzgGd4eg1aEXOm5HqfxFHIOkhyhF7N+QuthGWPusMl/zHNemVqSqke9a1mOKXcakSLQVxX58i
	zAOzV1rv1Zn39q21X+94usWHG5Ptm8/kedFgCN+uHZovJi05RgeCSv6VcmJxtkUqAsSlm2kMd7R1O
	cHV0p/H5yYXUoY+8e1u7RPe0KBbcS4FO0JjNa0r/j/axTSSziYy2xKihI9XxkQCbqJVFePnllfA9l
	KtWVChNd/gqV+cpDp4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOot-0000000Gs8U-1IDo;
	Thu, 15 May 2025 02:59:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFOoq-0000000Gs7g-32bm
	for opensbi@lists.infradead.org;
	Thu, 15 May 2025 02:59:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22e16234307so5300975ad.0
        for <opensbi@lists.infradead.org>; Wed, 14 May 2025 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747277975; x=1747882775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWcFnU+ZCMa4E0uXYP2GehfQD38U4zdLiRH9Jcj2pYQ=;
        b=jAElggIFd6hTZjnVJDM26m2LSP/i8J7YhhIkN8FkT43jVs+qB+RpsL1I7+HeGws2BB
         PetRAvwvxINDX9QHpwczVyrZQMP020YtBv91fGDKvVK1kzareK0A7NmgmkLVNRpl7Hl7
         i0m9pf8ri0bem/Rtq+HS4NyOX4MknwQhSJxYMCS+nGcog0j9lRVVtXzIus8iu0PSAXH2
         QegNAkK4iEK7DiC08V8eIevRjLQoJrz+PgqT5RWZBk7JdGokxjV6/OBBVYBIjh9sOnbm
         wXfbs1snwQ81lz6wvSP7y2yqEBgQnhsZd7HxoZLL+KKhuIPdci7p4124NZ9Zw/LtPwsU
         FmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747277975; x=1747882775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWcFnU+ZCMa4E0uXYP2GehfQD38U4zdLiRH9Jcj2pYQ=;
        b=mfvtlUifaV35O47Ynwtho0LTuLeaECxRhruoYgi3/jblOWiY2nW9vnfd9ieSA+u8LT
         YwFMercDuyX18CQL45HGIutzA/k/LEUknbR2XDHM0LeJ9QbTjPWx4Q+ayFuiCR7pjMj6
         ZZbAEI1Gsm5LxdwgYbENVkmn1o4fNyO8BbQz9C8B22hrSSJxVwZyQQXOL9y553G6bxVm
         wmMuU45UKbhdi3Tgi0kCsnwQ20lFThyS8+iFGkfzbnNfNu9s3ps6a1VGvMW7cl6/Giak
         zyEyK9t4Oc5FBgVIG603wB/nP3QEFwEjQEXNqpqI6ikHp/dxh6W8UBr0Zn3fGs+YJg5J
         0lEQ==
X-Gm-Message-State: AOJu0YwuHVba/HVUzysyBlyB7A1gatcog+rCeQgutEvhZhXI7AIuQFfq
	P6FjyTafeG8NVSMPbUYDtz/WJVwYIEP3AaqDZ4yT2VGb36BtSV3tzH4MW/kP
X-Gm-Gg: ASbGnctZUYIq9YYmW36cAGXKQ7f/rf57tfw0OCju0k5x2n2vt5UoGfxUfBLYC3dYXxJ
	6V/nDSrhX2jHDXTXje2ECKULem3N8fBOYdooYoO60ULFW+I3rKPShy6YT98gOl4NV7ok+TsbzJ/
	dcwSwpE6ByaehjPcazPcT+mrD7+7mDuyKggYakHyhRDCvpv3Jo8oRczH374PIJ2YjV0ex0lz8A1
	1RLAgvqKitPiwaYDsqBYtbxeZaVxSCFR4p9SR4pQ9byT0YRWW3Qw35u8vKGxWWXzxzH5FXKUC4F
	+J6e333w2DZshsQ8v8tN/vZzQ2CFYC9Xt4gOp/AsChQ=
X-Google-Smtp-Source: AGHT+IHFmG1gxrAai/tUNQmrVru65aXeoui71s3PdRUFq3emMh0r1a4El/zYailF/bR1FwFKVKbLIw==
X-Received: by 2002:a17:903:1252:b0:21f:2e:4e4e with SMTP id d9443c01a7336-231b3970b19mr25850755ad.5.1747277975040;
        Wed, 14 May 2025 19:59:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc774364bsm106728075ad.102.2025.05.14.19.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 19:59:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: opensbi@lists.infradead.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Makefile: Add flag for reprodubility compiler flags
Date: Wed, 14 May 2025 19:59:31 -0700
Message-ID: <20250515025931.3383142-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_195936_769529_212F700C 
X-CRM114-Status: UNSURE (   7.38  )
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

Provides mechanism to remove absolute paths from binaries using
-ffile-prefix-map

It will help distros (e.g. yocto based ones ) which want to ship
the .elf files but need to scrub absolute paths in objects

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index e90836c7..22d4ecff 100644
--- a/Makefile
+++ b/Makefile
@@ -174,6 +174,11 @@ else
 USE_LD_FLAG	=	-fuse-ld=bfd
 endif
 
+REPRODUCIBLE ?= n
+ifeq ($(REPRODUCIBLE),y)
+REPRODUCIBLE_FLAGS		+=	-ffile-prefix-map=$(src_dir)=
+endif
+
 # Check whether the linker supports creating PIEs
 OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
 
@@ -362,6 +367,7 @@ GENFLAGS	+=	$(firmware-genflags-y)
 
 CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -ffunction-sections -fdata-sections
 CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+CFLAGS		+=	$(REPRODUCIBLE_FLAGS)
 # Optionally supported flags
 ifeq ($(CC_SUPPORT_VECTOR),y)
 CFLAGS		+=	-DOPENSBI_CC_SUPPORT_VECTOR
@@ -387,6 +393,7 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
 ASFLAGS		=	-g -Wall -nostdlib
 ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
 ASFLAGS		+=	-fPIE
+ASFLAGS		+=	$(REPRODUCIBLE_FLAGS)
 # Optionally supported flags
 ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
 ASFLAGS		+=	-mno-save-restore

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
