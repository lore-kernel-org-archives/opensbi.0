Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE98DC369D9
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 23:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=imCnDYtSeAz40iBhyK/34DeEUUVJ6F++NHdSmKE94Uo=; b=HhI1vfdjgteMc7
	k/ho+IhQkyytwfcRSgjY42eqRe7p8UhNZhCHw7Cy1AhXqZzcWBPiGZDz3dO2U5RoNiUDpx8X2XVUf
	QuCW/dFTNzsFv43mYY8M6kjpR/1mft7qOTR6xiA5dIA6p/NsHUIzCIk+feP33Sry+w5qMod+GjbZ/
	DEVSNNsKpEzz8IVItw6HW5XPpmtTUD85xuRpYSvryWps5s5+ebCK8y4q3rsGEGn7UazPzMfF5wOtW
	kQauu9prp5OrvvZqq7obWsXZjzihhX0JhACSExvLtgr1Mxws7gegSm/my5QvGdodgVI3fd7vxr/p0
	6Glc4/xl1ZR70gJS7xTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAH13-0000000EGXs-0auh;
	Wed, 30 Apr 2025 23:39:01 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAH10-0000000EGXW-4AVe
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 23:39:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso491104b3a.2
        for <opensbi@lists.infradead.org>; Wed, 30 Apr 2025 16:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746056338; x=1746661138; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+y0gJFMTMbFVfr/MrPamaK88fdkS8CFPnyvuJ3dahg=;
        b=XHC/UTXdfk7m2A31aHBm7hTjWmoxRWmKmLMRAAQFxokRemK5EstVFdg00lE/gFNopa
         VG+XKcyb54Amm04kz2Br3PbelOp3Z4mkKTmPEwOVCbBimz6H0MWGxJcuFT0m4Ict9CDD
         Vg4rZmMJqbM9l64oqUMiXKcIycgA/TnJf8i81v3o9AmdPICVgZttsUweLFWZkiNxG4f8
         VAXu12G/NfNm5V8xux+CN78JUbumJSZpmDW8/W61OFSLIlZYLrXsgkFxsRA8mc6+iDxb
         Geq36XUROPruFNDBdNE8nVB1+LKKDbM6mYdM60kevZYWzgG6SRVrBEQSFaNmIdRdVpKk
         27kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746056338; x=1746661138;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+y0gJFMTMbFVfr/MrPamaK88fdkS8CFPnyvuJ3dahg=;
        b=VWXrK7UkXoTMWo1Asw9J5sT9Hqiv1WZik00kw90LZk1MM/1g6MTahM88V6N7igzUAe
         iHd/An1nMWxpkpjA/gLOoGQfoynVouGT9O8dYh8v6jfktska7pHED1xIEAwqFYghEJ0a
         H99+5wE4MNmzZIn4tcBecIfAuAZy/gb0z/otONYJ3Hp43MRpmic1iVtMASaAVZpogGMo
         X2ryacm6KPjwa6pYf9jNYxsrmoltcrAlHC8qybQP2Gh2ofw8YEcAgFRrpawZyH6HOJFL
         lUIshLDlRwyiO9gLzecjFtnfh+Tek8cIsyd/2hpJOqAVOfbCSsvM4nU2h6kfk5O02LTX
         ltvQ==
X-Gm-Message-State: AOJu0YxG3a2WS+AygoXQtM3BM/WBn9UWxVJwOMdPgq12gmO4kaHaSd/9
	yXblLDaH4GPIl6oG1zbCgOppcDJHv3qTuOO9SEoT34D3OxIzKuYPyZXO19mKOzOb3+6bHb0P0GN
	Y
X-Gm-Gg: ASbGnctjLbRluJqDUDfvFDE7HvM7OTvzEMxuzqKqGJrzNDCo0xoowp0jW4Ysmw4BKyo
	8lk/BAvKQ2Nq9VGC5/2ikaL7jaqEfqKLkGGKBaqbAmonupTnx71lcUykX3YsvhbjfNP6r6OsDui
	b0/ffV0arCAZkfJl2keGyw0EVgQ5AxALMU4ddTOMtbT18Gs1O/P7Qr6VvgG10ylAtUxzNl/bq/S
	3fqy1fVEVazOE68KSq5A/cbAyTx3kG9wvA+htjgp/nJWC5D6U/QJ41LtuSgTX6HkUENqAEwZabD
	mhokmMUspZ1bWe8yVWVezhj0+XTG+1u1EE4c8sL5MErqU7osTwGkIGyH
X-Google-Smtp-Source: AGHT+IGlU1DgrJOF/nxxst1bFhzg7FGvIxTgMADgWD/mmdqUfM1CayejaBAIq9WEfoe8oJukaB/YWg==
X-Received: by 2002:a05:6a21:9181:b0:20a:53e7:4a44 with SMTP id adf61e73a8af0-20aa2fc98ddmr6293972637.19.1746056337952;
        Wed, 30 Apr 2025 16:38:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f9a6csm2315198b3a.7.2025.04.30.16.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 16:38:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 30 Apr 2025 16:38:31 -0700
Subject: [PATCH] Makefile: Make $(LLVM) more flexible
MIME-Version: 1.0
Message-Id: <20250430-improve_llvm_building-v1-1-caae96cc6be6@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAHa0EmgC/x3MTQqAIBBA4avIrBM0K6qrREg/Yw2ohZIE0d2Tl
 t/ivQciBsIIPXsgYKJIh8+QBYNln/yGnNZsKEVZi0oJTu4MR0JtbXJ6vsiu5De+GKNkJ1uUUwO
 5PQMauv/vML7vBwvRIp9nAAAA
X-Change-ID: 20250430-improve_llvm_building-cff31918e1a6
To: opensbi@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=Eb9eNvgqig3ObzEkS46qgoZAFHjPlNNTd9TywWjJmds=;
 b=kA0DAAoWjgFid219CPYByyZiAGgStImjXzNxX364JnnUdhzCKqoKi1wf9jWslb/ebIeqq4Cjh
 Yh1BAAWCgAdFiEEDNaAA4XcL3bFFXaQjgFid219CPYFAmgStIkACgkQjgFid219CPb1rAD/RSHi
 7IZZWnB6gTBaW5a2CcPD3K9PWlEAmv4S2tjNl3ABAIVb9O+6y18FvkTEK1ZTw+Hfk/JO7bCZaj3
 1JUKHwP4G
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_163859_040661_7BD30DCD 
X-CRM114-Status: UNSURE (   9.74  )
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

Introduce a way for developers to easily switch between LLVM versions
with LLVM=/path/to/llvm/ and LLVM=-version. This is a useful
addition to the existing LLVM=1 variable which will select the first
clang and llvm binutils available on the path.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Makefile  | 14 ++++++++++----
 README.md | 12 ++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index e90836c7c4ad16c30d4d80649ff8b228413190ad..37d4cf41a2214e0a829f1d4a53f3f4f9ae09ee41 100644
--- a/Makefile
+++ b/Makefile
@@ -104,10 +104,16 @@ endif
 
 # Setup compilation commands
 ifneq ($(LLVM),)
-CC		=	clang
-AR		=	llvm-ar
-LD		=	ld.lld
-OBJCOPY		=	llvm-objcopy
+ifneq ($(filter %/,$(LLVM)),)
+LLVM_PREFIX := $(LLVM)
+else ifneq ($(filter -%,$(LLVM)),)
+LLVM_SUFFIX := $(LLVM)
+endif
+
+CC		=	$(LLVM_PREFIX)clang$(LLVM_SUFFIX)
+AR		=	$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX)
+LD		=	$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX)
+OBJCOPY		=	$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 else
 ifdef CROSS_COMPILE
 CC		=	$(CROSS_COMPILE)gcc
diff --git a/README.md b/README.md
index 2795cc1a5ff0df62d83a4b5c3062ff2b682dbcab..fd40be0b4988815d8d02386271aeaeb787541215 100644
--- a/README.md
+++ b/README.md
@@ -252,6 +252,18 @@ option with:
 make LLVM=1
 ```
 
+To build with a specific version of LLVM, a path to a directory containing the
+LLVM tools can be provided:
+```
+make LLVM=/path/to/llvm/
+```
+
+If you have versioned llvm tools you would like to use, such as `clang-17`, the LLVM variable can
+be set as:
+```
+make LLVM=-17
+```
+
 When using Clang, *CROSS_COMPILE* often does not need to be defined unless
 using GNU binutils with prefixed binary names. *PLATFORM_RISCV_XLEN* will be
 used to infer a default triple to pass to Clang, so if *PLATFORM_RISCV_XLEN*

---
base-commit: 316daaf1c299c29ac46e52145f65521f48ec63b5
change-id: 20250430-improve_llvm_building-cff31918e1a6
-- 
- Charlie


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
