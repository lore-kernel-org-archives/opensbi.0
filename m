Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C24DC44507
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+FPmEft6Os4IZQ9cMcgUcZ5kSgGCsVGN0Kw7cRFE40=; b=YbutNeB0nuDgYC
	ULrgiaiJ22zm3n5niKPXJJEFJ4MQn8I8ShfFzpWJA1S3sdve4mXZnrWvk5m3USItc4bbDlGAl5UBm
	uk6Bn7+/z8KDxNI9f6JKi+nLQBtgDjlHZjiLizGyCe6uq3nN26L2Xn2c7gTf/nWiLk1CsuogyXwnC
	8fKb190t9w1F1oAM5tr7JvdIlCBCiOfID60yt2ShKn4MPpZuk+AWQUWBtv2gzhgbh8rzhfk4XWxC0
	Ael0aicB04hJneSS+Gw4+EePlj8AByMDW4RPO8tv3B/ggKwz3rO2Kha3gHWQV9TyliKtXnbA2k+85
	s8OZbZQYO9J/neBCiGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfJ-0000000E19a-16vu;
	Tue, 07 Jul 2026 03:40:09 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfE-0000000E16i-1ZY5
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1929107a91.3
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395603; x=1784000403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73uO+EmLpw9PQzvEk5PNt3VPf18hunI5O8Sly0Z/lSU=;
        b=KXuKOvSadumOoHGM1qkZNVFStaQjDEUTjcXN5h/sbDgjAt/i5uC5oZITNgkJjK009n
         YO96fsbGXDJRxeyFYFE8oPhBc3biQPAzXAATIO9F7HX8/gaZhKZXg8K1uNlAltIRDl3z
         C3xxjcHNHih8Z+B3l7V3u35tvGy+KJMQVOVi3zDhT+VZw3DUco/3WqOF3Cswiv6li8qP
         A3IwDI5VT2cpBOmyG4AdIlBc5cN7HE+/vdrrLp38xC7Al3Lj1cFvfWrHrgZ0t0fmdb/f
         qFw3qQ4VGgyjPJlPfdZzpu7m7cZ1+xqLlS3D0rP6N7sa8qSpRqPE8rO9Pa9qWmcrjncQ
         JKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395603; x=1784000403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73uO+EmLpw9PQzvEk5PNt3VPf18hunI5O8Sly0Z/lSU=;
        b=D9UJGSI96N09/4/9LUM7bb0oIyehfGErMpSaxOWQvxC6C1RruDdLcDmHBc0sD+WPfZ
         Gsi41IqYLAiUb4UEfn4u0S4EOogcUKYZQjlCUmZ2R/Lj6l4BXli94OdoTHtHrFeUQWT/
         TuVIzccG+0im6ZMsQkXUk7E2Yd/f9JiArpP6U5dJnujQx0fEUQx5IL7ynGEMYW9g9hO6
         pSo4q/8XPJkNbcpad1E4MYlEay6hV5sjYEhd/7vkzCcMv0qymdC7a7+g4+h++LxVyQNv
         TmLQa9xLSHvJNqQQPE3WobX4APzqkXg8+MR4g55309xDAtHGwZXZM7+gipQ7bidI5e94
         15Tg==
X-Gm-Message-State: AOJu0YwZpFfLPRBI2ism7rHEwEqFUo5e+gulo+208zV7eGJtLLLnhGzM
	DOZj9abGqURvGROn2ERo0p6hy2rJUp2XB+xmF3C+xaDrkIVXChz0ZThGIOv9LBQavYoaLjnJVC/
	9L3FZxnYVKSOaKPemYtbYoJCeeDrkfQmwYuLXKkuxcu7k5E1MlfH/H7rfTlXMuoWmCaZNHSilYr
	z2RH2NMIHYg6UMwQgHFJuLzFxrNRdj2lBPN1ej1sVdJGOFu0ww
X-Gm-Gg: AfdE7ckFD7lAeXut1poo3TeUGYEOEru25K8OgO4c/i5SverAULrkHx6DNsRICZWvEc7
	uwY10hO1Px7nqcDU+NgXrWJdWV1luIKs4KKshNaojJ8Rpi9WzihNVBzaDVp98tCZj1zbwL6BFa3
	HK4lfABFqiEEGJgBaTnEp61l+8Nvolo9CBewxpuG3hlO+dGAxvWp4JKdSmpLW7vtjfkEVhEQy4c
	lEAXqoN1CE/Ue4LE9wFgfAxBYyjbMVZAxFPKuZ0ejWoV3ckgH5wsjcXldcvnxm8cq/8Jz8r51n0
	ZBGrP/feYIZ04y5Pw8JeC55ZTpcH68go/kyND9h1Bjd5crPq9myGRP+OcpBR5r2w56d6A+NY/Sl
	hHg+9v7KIK88DHG/cQGrCkyZxiKFFFOdgsXpqwtedi7fF+oEcWHw8nn1rY1pqgDmw2GHFmM7XcT
	RGu9sGsry4w1ta8MonC54ClLb6
X-Received: by 2002:a17:90b:4fc6:b0:387:e0db:bc2d with SMTP id 98e67ed59e1d1-387e0dbbdb7mr1010267a91.35.1783395603224;
        Mon, 06 Jul 2026 20:40:03 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:40:02 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 7/7] docs: firmware: list FW_DYNAMIC_APPEND in fw.md
Date: Mon,  6 Jul 2026 20:39:54 -0700
Message-ID: <20260707033954.2054859-8-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
References: <20260707033954.2054859-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_204004_656271_331FF431 
X-CRM114-Status: GOOD (  12.75  )
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

Update the firmware overview to reflect that OpenSBI now supports four
firmware types. Add a short FW_DYNAMIC_APPEND section describing it as a
FW_DYNAMIC variant whose struct fw_dynamic_info is appended into the
binary (before .bss) instead of being passed in a2, and add a pointer to
docs/firmware/fw_dynamic_append.md in the per-type documentation list.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 docs/firmware/fw.md | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
index d2980967..9cdd6a6b 100644
--- a/docs/firmware/fw.md
+++ b/docs/firmware/fw.md
@@ -16,7 +16,7 @@ of RISC-V CPU:
 * device tree blob address in memory via *a1* register. The address must
   be aligned to 8 bytes.
 
-OpenSBI currently supports three different types of firmwares.
+OpenSBI currently supports four different types of firmwares.
 
 Firmware with Dynamic Information (*FW_DYNAMIC*)
 ------------------------------------------------
@@ -28,6 +28,19 @@ A *FW_DYNAMIC* firmware is particularly useful when the booting stage executed
 prior to OpenSBI firmware is capable of loading both the OpenSBI firmware
 and the booting stage binary to follow OpenSBI firmware.
 
+Firmware with Appended Dynamic Information (*FW_DYNAMIC_APPEND*)
+-------------------------------------------------------------
+
+The *FW_DYNAMIC_APPEND* firmware is a variant of *FW_DYNAMIC*. It carries
+the same struct fw_dynamic_info, but the structure is appended into the
+OpenSBI binary itself (right before the .bss section, so that it stays part
+of the flat .bin image) instead of being passed by pointer in the a2 register.
+
+A *FW_DYNAMIC_APPEND* firmware is particularly useful when the booting stage
+executed prior to OpenSBI firmware cannot easily allocate and pass a
+struct fw_dynamic_info, but can load the OpenSBI image and patch a few
+fields at the tail of the image before jumping to it.
+
 Firmware with Jump Address (*FW_JUMP*)
 --------------------------------------
 
@@ -77,12 +90,16 @@ following documents.
 
 * *[FW_DYNAMIC]*: The *Firmware with Dynamic Information (FW_DYNAMIC)* is
   described in more details in the file *fw_dynamic.md*.
+* *[FW_DYNAMIC_APPEND]*: The *Firmware with Appended Dynamic Information
+  (FW_DYNAMIC_APPEND)* is described in more details in the file
+  fw_dynamic_append.md.
 * *[FW_JUMP]*: The *Firmware with Jump Address (FW_JUMP)* is described in more
   details in the file *fw_jump.md*.
 * *[FW_PAYLOAD]*: The *Firmware with Payload (FW_PAYLOAD)* is described in more
   details in the file *fw_payload.md*.
 
 [FW_DYNAMIC]: fw_dynamic.md
+[FW_DYNAMIC_APPEND]: fw_dynamic_append.md
 [FW_JUMP]: fw_jump.md
 [FW_PAYLOAD]: fw_payload.md
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
