Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309CDC83F17
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 23:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0lBLNp6KFl8KCvq1q2raY6EEhBH3+b2Y9iYHpMTkwI=; b=fysKqba2Cqwyod
	JH04+Zlk9G+HGD8rj+ZhrGRMBwM97hAKbO1C/pliKu79HSucsnugqE5A30OZrATmGp5ZYT0magjd9
	Ay7uDEnssWpS1gvZ4qzoKz5bE+1NAIfCZW0FF2zG2mMLt23Xr0mPGIztzbF5b7z3eMF8wDxTK2nt0
	k5UoYU1/p25sk3AAV3/CAtIdj8udRFHZZoR3rBU+Ub5eMFbQh0SCKZzXTC8yZbITU+r+65Ix2Hsc3
	EybGqbJksgLRVMtkfNJ/Nivq4amCsYxuwHpimkwSTAzdcWYmeWq64Ddz3aup9NDoio/Yq9ogB4fRu
	3tf/xEyeOPR7KCrhFN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeEW-0000000AFlM-24wC;
	Wed, 09 Jul 2025 23:29:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeET-0000000AFk5-3xmM
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 23:29:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so996697f8f.0
        for <opensbi@lists.infradead.org>; Wed, 09 Jul 2025 16:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1752103784; x=1752708584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WuapQexztaWffQypchZ4YvY06QFYdz2y+TfuHMzTeo=;
        b=RzR0kFpDxlWzK35pbdt47YCbZTG+adeCZ2IsOE1vx7fq88xfJGmVBamhvAkXdJYMit
         dDBK+eD1r4E/TmaOHyOa8qcsaPvd5YAutg38jATi8HxZ6yma7tsOOdzNzwhavTGkoaL2
         PpbDny2HB0C09FLOmK9n1Fc6mou4/Oj2ySZNJjfQ1vhIxuTj7a9tfi5GLW59Op0ReAWv
         Xjct1v3+0OiaXhcRS9geAbA6E7xX+WM3Q6saAZoObtNY226293SBWxH1kEQp5D79r3tI
         qyt1GjxZg+NIuvx0JRtpJTXNjuZjfBWSvqsQlLJizu07wsrtRUMXUOTiFK3KxlKyf4dr
         2kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752103784; x=1752708584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WuapQexztaWffQypchZ4YvY06QFYdz2y+TfuHMzTeo=;
        b=RqfyPmYPRInWan2e6EXf+IBge6Z+DjXBDe2EyL1pLMMP7BJIv2s7jmrqJ3PeYvwzah
         hckI8Ph/wg+VwLLBfFjspI2xGm1kSdf9VwkwxVdWINBAPgNjYPLN04aqgkNCRR+K4lLs
         eVm5IYufZqlnF78Q1fJqZqY6XZZQqxxgFIkC4OL6LkEm8FvuWhxibvnkbl6AsndIBjr/
         DSy19nci/QeDJHzu0875qa8UvnheI9HfvPqS330Nk/+4s1F/32nbVzihZJdwMtEY1I2F
         bg9IcfBZt4jkj8LwbGm5Lgy0gHLkkQI7CUQHw8lzzLMr3G3sx2e6G+gxus4MZnYoIizf
         z3Lw==
X-Gm-Message-State: AOJu0Yyy8X7vZ131DsudDfXmWG0kTpe+OOdAV6mUEQ1j7HPu3KSIsk5q
	tiPTe9k0rZQcDNc0fZMx7mTvwpuYpLopB/Wy/VVc2ih0J1RJhQY7dTE8kVgH1+hgXaXCICeOoGU
	a34Sl
X-Gm-Gg: ASbGnct3xKX8LCg9AB4w5nS7CxLMQ/N1V5tAV73onDVfDtRs6MneZ9ni1fZz+XwKgkJ
	3SmM594tFdCIboX2UC7upUKJpXF71aIyobYKQq07YRdSWywPMUwc2BXdDMqkEdrcJBklvVV4gnc
	33Bkw13ThuM94HGNtukkBZoC/FeGM8vAiPFeR2nNBO6U3oYo3XV8fcBfCRXbT9t+XlAkuGWBdYb
	W1kZJJuc10nBSyjy8T+epDVNzqNujOgyxy2F3Jgfp9PArN/MN+AoOEgXLNrGMrcTeP657aEsKzX
	/uW/gcxUPz9o2OIgLHtbArAZ2AGfCvVRREel+CMGHOPRZrLNgde2nhrvQQer7/h8/pnMrWXJDKF
	ez1meUjkkRKXDDAJMYHjLIZYGgiPdfDFAVxNq6stymzGad6MyrQzQ8BW1VQ==
X-Google-Smtp-Source: AGHT+IG6xMi/vNsdJJMkMsLc4CRNt3SlanpJzTjvOOqhshuOBnkQrYnMf9KO6INwcYxb6hvfzwoNXQ==
X-Received: by 2002:a05:6000:642:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3b5e7f34e49mr1139288f8f.23.1752103784421;
        Wed, 09 Jul 2025 16:29:44 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.localdomain ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d511bafdsm42014145e9.34.2025.07.09.16.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Jul 2025 16:29:42 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id D4C60E7BE922; Thu, 10 Jul 2025 00:29:41 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: opensbi@lists.infradead.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH 2/3] firmware: Replace sole uses of REGBYTES with __SIZEOF_LONG__
Date: Thu, 10 Jul 2025 00:29:29 +0100
Message-ID: <20250709232932.37622-2-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250709232932.37622-1-jrtc27@jrtc27.com>
References: <20250709232932.37622-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_162945_981062_15BEF773 
X-CRM114-Status: GOOD (  13.75  )
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

This code has nothing to do with the ISA's registers, it's about the
format of ELF relocations. As such, __SIZEOF_LONG__, being a language /
ABI-level property, is a more appropriate constant to use. This also
makes it easier to support CHERI, where general-purpose registers are
extended to be capabilities, not just integers, and so the register size
is not the same as the machine word size. This also happens to make it
more correct for RV64ILP32, where the registers are 64-bit integers but
the ABI is 32-bit (both for long and for the ELF format), though
properly supporting that ABI is not part of the motivation here, just a
consequence of improving the code for CHERI.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 firmware/fw_base.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 2498797..aa8e264 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -80,17 +80,17 @@ _sc_fail:
 	lla	t1, __rel_dyn_end
 	beq	t0, t1, _relocate_done
 2:
-	REG_L	t5, REGBYTES(t0)	/* t5 <-- relocation info:type */
+	REG_L	t5, __SIZEOF_LONG__(t0)	/* t5 <-- relocation info:type */
 	li	t3, R_RISCV_RELATIVE	/* reloc type R_RISCV_RELATIVE */
 	bne	t5, t3, 3f
 	REG_L	t3, 0(t0)
-	REG_L	t5, (REGBYTES * 2)(t0)	/* t5 <-- addend */
+	REG_L	t5, (__SIZEOF_LONG__ * 2)(t0)	/* t5 <-- addend */
 	add	t5, t5, t2
 	add	t3, t3, t2
 	REG_S	t5, 0(t3)		/* store runtime address to the GOT entry */
 
 3:
-	addi	t0, t0, (REGBYTES * 3)
+	addi	t0, t0, (__SIZEOF_LONG__ * 3)
 	blt	t0, t1, 2b
 _relocate_done:
 	/* At this point we are running from link address */
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
