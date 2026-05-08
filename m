Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B23CD3436
	for <opensbi@archiver.kernel.org>; Fri,  8 May 2026 16:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a3pPmKxSclerPXYKVeOu4M40fYo9vw4pTkyN3eoYJvc=; b=U/xID40HnRDSNx
	GtbVChVndhD+/lqGlgE/XLOz/JpBgLRbu9kApuCPXAAXq5i2LJtdoukNCNEvhRZndtzzZo91TdqTN
	fTQiyWRMqrXT2tz3d9BXLKoMUbwPwL7J/7/TrAPEjVeVSfE9lDoJmZJMqOayFtQaBlgQUy0VKXnqp
	LeQVcOMoDxBEVKwfuw9lGKgvhIeQ0gxnCR822cIsnxwlcknWFMF44MBKDe+AoJwcGFq8u7I+4qHAR
	4/itHOBXm3z/Pq+nYNSm4GjPUxUZ2DhTrELTVdXzVdd8AaL/E80WfPsMD2ozB72hhtRPUppuDF7eE
	G8LaG+EM0AoWMr6QANyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLO88-000000070I8-2gv1;
	Fri, 08 May 2026 16:32:48 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLO85-000000070HO-1lQH
	for opensbi@lists.infradead.org;
	Fri, 08 May 2026 16:32:47 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7bde9d73678so24844257b3.0
        for <opensbi@lists.infradead.org>; Fri, 08 May 2026 09:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1778257963; x=1778862763; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pS7QDMyTPn+qXeEhdqM1p9kWQ8gc0iqQRoSfcLjmYu4=;
        b=Swt63v6Ia1Q2bS9a5EZXNKhqH7PXKrFjsheDIa12DH99/iYcUPo0RvkGQPDPq/w/63
         US1LAC00MZbeA68/sIq25IaofgDwOCsOW9HuFj381kc3opmYAxYnT1Y4Hc1kqB8VFyT9
         2XSpQymRoVUGTZQXkpSEmHGd3ZnrKdxktUyV1Ei+xx27BVI/Ft4+C1z8fznYDNaBmWrk
         l+TORKM47f/U/z6n3NtNLgBMxfcDWX9ZpYODmolmuUCTf6TUxN7eftYUyhkiX1looosL
         QL5MNPUVHOo+TCJuxSsNBlSN4i1XpA2pFOcs7SLxFkk4Hm0PHxgLxoMt1QlMBVF3YuU0
         u/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257963; x=1778862763;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS7QDMyTPn+qXeEhdqM1p9kWQ8gc0iqQRoSfcLjmYu4=;
        b=EGP/vJcGD7IQ0n4QxYZJkKxGhgIWdVpnoq/QV/aQmRoiIQD39/YF9pqIJQpQw3TpUT
         P1zVQSL9ahHHHvxSNya55Iuf8FlvrGFkPFW8LUwyI84pbp/fZvo3513nXY2FfyPLsexi
         rhD/hPehK6fy0s9TVMThcNVEyiX2myIpSM5x3ZrRTuhvYt/R5vb2irKREYrbv06li5Hu
         uR5f2ItMaCPTF304MYSmR+Fpx/uQ7N5l9QfND/Xaxdqgv2NXuU/Fydt49l/Rm6YewzEh
         NQIAj4SxGLwiguG/cshCxOL6VZE6MU4LGRZo3jGk1RT3NvV2yYRaT1T+jQf7NqQsDjHS
         cSJQ==
X-Gm-Message-State: AOJu0Yw6SnscZNRf+Q42kSMDsDZXSIoP7X8G8YAHBaqGTnXKQsN8JZli
	QsZNb2tn8PI+OKihUNKVZWYE8fhBP+6b5J4p6Znc97+APBiwxBAp9CXncRwEneRzmBbrK2QbSsU
	5tO9t
X-Gm-Gg: Acq92OHEHzhmM5I1iNPgCjLz8quCd/JeJT4F80lHFEAPmHaeE/x/JyrYOli5GnECzfx
	I3eL8JdCx7YYGzvKL5d65Fug84AKsBG5ZOOuwfVs1/kZffLPd/c9zk6ZOo7VEvNE3ShSF2p9GHV
	ZRODPhCpE1wwZ7zsjGz5IHCaxpZirbDnWaRr5dHQTZnTxaFsoBmuXGWeh/f9q4yJVi5hsyYAUbf
	plaV6pFdQIsG3Jph2v6IeB35+3GsffPMMk1Xqw5aOSMTdHhCbZaqdN/YOTdfPF9cTOTEs/aKgaM
	s1I82qdPzLxRt8JjIRPpdBnVBZzOzQYEXEI0xpn7dycMxB9G6oxnRBjcLzCquE80zE6+MWMKtlL
	qZmJCdZXOxlk9zSId92zw91WOMUIHRV6msHPsdRxJoRMY4bu4loIx0vP2P3Mq52CqocdKPlRkit
	SXesZwoTKXTeHrR2aPgxbDvzVoAtEc04k+Sjc8Xe87TS+EQB8IRLljvNg4XzcEJw6roYCE+pUVe
	OCViKu2HTTO7YAyhjV9qg4tJaFC
X-Received: by 2002:a05:690c:9982:b0:7bd:69b8:f2e7 with SMTP id 00721157ae682-7bf04b72939mr70512667b3.12.1778257963372;
        Fri, 08 May 2026 09:32:43 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:4175:b791:de2f:a20e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd7d849afesm90571867b3.49.2026.05.08.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:32:42 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 08 May 2026 11:32:30 -0500
Subject: [PATCH] platform: Fix payload alignment when FW_TEXT_START isn't
 2M/4M aligned
MIME-Version: 1.0
Message-Id: <20260508-payload_alignment-v1-1-6628b4ec1ed3@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAB0Q/mkC/yXMQQqDMBBG4avIrA2k0tjQqxSRMf61U2yUxIoi3
 t3YLr/FextFBEGke7ZRwCxRBp9wyTNyL/YdlLTJVOii1EZbNfLaD9zW3EvnP/CTMsYatiXcDVd
 K3RjwlOX3fFR/x2/zhpvOEe37AfACvGV1AAAA
X-Change-ID: 20260508-payload_alignment-5585a86ec7e4
To: opensbi@lists.infradead.org
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_093245_491557_0A372884 
X-CRM114-Status: GOOD (  11.95  )
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

The payload for FW_PAYLOAD needs to be placed at a 2M/4M aligned address
(for 64/32 bit systems) and the current makefile uses FW_PAYLOAD_OFFSET
to achieve this. This only works if FW_TEXT_START is already 2M/4M
aligned. Most existing physical/virtual platforms have used a
FW_TEXT_START of 0x0 or 0x80000000, so this hasn't been an issue so far.
If, for example, FW_TEXT_START is 0x80000, the payload would end up
placed at 0x280000 on a 64 bit system, which isn't a 2M aligned
address.

Update the makefile to use FW_PAYLOAD_ALIGN instead. This will ensure
that the address picked for the payload is 2M/4M aligned irrespective of
where FW_TEXT_START is.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
To: opensbi@lists.infradead.org
---
 platform/generic/objects.mk  | 4 ++--
 platform/template/objects.mk | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
index c4a8fee2..ca7fb8b7 100644
--- a/platform/generic/objects.mk
+++ b/platform/generic/objects.mk
@@ -35,9 +35,9 @@ FW_JUMP_FDT_OFFSET=0x2200000
 FW_PAYLOAD=y
 ifeq ($(PLATFORM_RISCV_XLEN), 32)
   # This needs to be 4MB aligned for 32-bit system
-  FW_PAYLOAD_OFFSET=0x400000
+  FW_PAYLOAD_ALIGN=0x400000
 else
   # This needs to be 2MB aligned for 64-bit system
-  FW_PAYLOAD_OFFSET=0x200000
+  FW_PAYLOAD_ALIGN=0x200000
 endif
 FW_PAYLOAD_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
diff --git a/platform/template/objects.mk b/platform/template/objects.mk
index f240a557..9b4bc928 100644
--- a/platform/template/objects.mk
+++ b/platform/template/objects.mk
@@ -85,11 +85,11 @@ FW_PAYLOAD=<y|n>
 # This needs to be 4MB aligned for 32-bit support
 # This needs to be 2MB aligned for 64-bit support
 ifeq ($(PLATFORM_RISCV_XLEN), 32)
-FW_PAYLOAD_OFFSET=0x400000
+FW_PAYLOAD_ALIGN=0x400000
 else
-FW_PAYLOAD_OFFSET=0x200000
+FW_PAYLOAD_ALIGN=0x200000
 endif
-# FW_PAYLOAD_ALIGN=0x1000
+# FW_PAYLOAD_OFFSET=0x400000
 # FW_PAYLOAD_PATH="path to next boot stage binary image file"
 # FW_PAYLOAD_FDT_OFFSET=0x2200000
 #

---
base-commit: 2257e9957103aac7df8089a59b9d4bdda7c592ce
change-id: 20260508-payload_alignment-5585a86ec7e4

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
