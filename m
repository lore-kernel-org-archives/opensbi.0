Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B7AC982F1
	for <opensbi@archiver.kernel.org>; Tue, 22 Sep 2026 03:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JUwqW60eYRplMZl9ML/Rm79SxNF4WDEm9xCCWhoLKIc=; b=C4STITdZz6QcSF
	cmyxFmN6T2xAyki4pHxFf7oNxaQL3CmamChdeK9VsRLhQnQv9Tu2okGOLTWvlMhvP/i/sayT83RKR
	OZnwyy3cgT3qU6NBFY2oUZtBt4R33ddZZdCaKn4Fn1QL6vl34r+KH0Q3w2cN74L8wpXzSI4VqDyay
	sHIXs+BWggiYKq6ZLfNYJlisjJ4tAjnE9L2dQgDlMkPSj+8pr626SYTU0Jznsd7P56IqiDrQmTb/c
	Yrvr6Lvzq0X7ugmyf8Sh1IeVGLeyHnKUvlXDLZBiyUzh5qP02zyOiASnVAZIA4U1eAc6D1T5YG+j2
	HfAZHwbvzXnSJBP/4LMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qqL-000000042oJ-0o8z;
	Tue, 22 Sep 2026 03:06:53 +0000
Received: from mail-ua2-x0f.google.com ([2a00:1450:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qqI-000000042ns-0fas
	for opensbi@lists.infradead.org;
	Tue, 22 Sep 2026 03:06:51 +0000
Received: by mail-ua2-x0f.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso2427156241.3
        for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790046408; x=1790651208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzp7gSGZyvPShLaj24yocgvFFz4KKlCkst6TcFYrkys=;
        b=ILkuzbBHnlCkt+reuStpHYkCeHxibcfcRSRmEmDwtQ3Xvs6vHJzfV4u2jxOCTRYFM+
         f+LXWRc5u4gE2cliZAuHwrkgz+kojq3mGSd0doOIr4j3FnBpnh0549KiT4na2NXWcwUY
         4RsuXRySjCLvURuFgB4SxH5PvVDmMiW9tUvA7fvya+zNKC5OKZIvty0V7UNnqZ3T3AIB
         pGSM4IKtDnAEyneOqd6XNItrW8Umm/bNZV/NUdZjkMctgC+6yMv4XqkVvaTBrsQhXT7i
         nvk2SAYX2ZDT+dge8xgrlV+MhmPSstTTtdjDtOwDIK45oU/sqHXXJ35OgdJQ0mn6dhCI
         G3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790046408; x=1790651208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzp7gSGZyvPShLaj24yocgvFFz4KKlCkst6TcFYrkys=;
        b=iM4hxcTHHmD86zNrqUlIe5aY3cSGjvQkevDtIL2Vefy6P9mUAAC7/yNEY3G68xDW2U
         KtBK7RJoC+j0Yj3KjJPAanCx1+JVBH8sZX0Q525Ied+zh0bMa0XAzNAO+Q3Q1TvkPCY5
         uKxbvNiszTrTd3EXYEkpeF08lMBAVxio+WeMYvW+k+dlqAaCN62zTJoHEFH21P6T0Jmq
         /yG78ZN8vEEJsYCBAqOtfwc299iilKtO5lSRFF5zgB46eNULyAPSvXa4UEWwRcjZV6sF
         MWoJg7yxRaSvDiBqQfUSqVqMWLdxUV2prGc+D0EzaSNPLh6qRL2ETCtm475K5jR9bmEg
         +Fxg==
X-Gm-Message-State: AFuF++np9DgaT3SFpWWbJ1zUodjG0aoS/9xe95kmrlHl5/7lWefpJpWw
	zhGjszrSuqePGYzKp+nurDrBKzfc0SYOFJMCriCDa/fk3ZINuICf/CBKYYVnnnB2xl0=
X-Gm-Gg: AYBFou20iK4eJ4EOC9FuPwqHpVBPgYptfbEB5IVI8LN/irDwLF11oCTo5+1qliXqE/m
	KUdLIJwBaFM6TB/Hjbw4rW4+Izvv8/Ro41qpm20S0v0Y+8RdrWfhc02bhlVL+OhsSoQpVC1R0+e
	KmdjSS7BvD8iaJM0XLhhlJe66zSpYOHh04cLodOdTB07OqsDn75ISSAtthf4TkccBlAsw/ZSFb4
	x1NdS+riNfI/dP2SBMp38bLU7KoaHSmGlh+cAjC5Xar/dcVZA+Za8lQoaP3G6bCRIJccv0/Eylo
	kjKZdHmv+BWILp3mtJI7k+/0PXb1GJXI64Hyj8gkVZggc1aO07x2KOGPiT/WsNLdOQdLVHIlERC
	AXP17s0wIv+BSv1N9DYvi9k34rCzju2RVXSI13uwNaNLDsh7Orc7PWOQvF+79gEuUPPzUqYxSqF
	x1up6hlyJOvsMLAAhholZ57rnEMrgc+sKd+m5zkLmVGFwZzC9ruIJaVZC+Y63G26S4EqDf4bHDj
	VdvHimCRUv5yND4ZzSYw3hmQhnd79QH14aJnwfYsiMap055eVX1hR3BOjGKCPA=
X-Received: by 2002:a05:6102:38c7:b0:7a1:88cc:6787 with SMTP id ada2fe7eead31-7a55b951a9dmr7225971137.12.1790046407922;
        Mon, 21 Sep 2026 20:06:47 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850d6460f7sm417634241.3.2026.09.21.20.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:06:47 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: ganboing@gmail.com,
	anup@brainfault.org,
	apatel@ventanamicro.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH] lib: sbi_trap_v_ldst: fix mask buffer overflow on VLEN > 128
Date: Mon, 21 Sep 2026 21:06:33 -0600
Message-ID: <20260922030633.10886-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_200650_216306_8ED66FA3 
X-CRM114-Status: GOOD (  11.28  )
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

mask_len counts mask bits: it is derived from vlenb * 8, and the mask
indexing below divides by 8 to turn a bit index into a byte index.
get_vreg() counts bytes: its size argument feeds "vsetvli x0, %0, e8,
m8" and a vse8.v, both of which operate on 8-bit elements.

Both emulators pass mask_len directly as get_vreg()'s size, so the
firmware writes eight times more than intended into mask[], a
MASK_BUFFLEN / 8 == 128 byte stack buffer. The write stays in bounds
only while vlenb * 8 <= 128, that is VLEN <= 128. Above that it runs
past the end of the buffer and corrupts the M-mode stack, including the
saved return address.

The pre-rework code passed vlenb, a byte count, which was correct; the
chunked version replaced it with a bit count.

Reachable from S-mode or U-mode with a single masked, misaligned vector
load or store on a hart whose VLEN exceeds 128 bits. Observed on
qemu-system-riscv64 with -cpu rv64,v=true,vlen=256,zicclsm=false: the
firmware takes an instruction access fault in M-mode with mepc and ra
both zero. The same payload at vlen=128 enters the emulator and
completes normally.

Convert pos and size to bytes at both call sites. mask_len is a power of
two and at least 8, and pos is already a multiple of mask_len, so both
divisions are exact.

Fixes: a8be5e94 ("lib: sbi: Rework misaligned vector load/store")
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---
 lib/sbi/sbi_trap_v_ldst.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_trap_v_ldst.c b/lib/sbi/sbi_trap_v_ldst.c
index 540f655f..9f1c312a 100644
--- a/lib/sbi/sbi_trap_v_ldst.c
+++ b/lib/sbi/sbi_trap_v_ldst.c
@@ -213,8 +213,9 @@ int sbi_misaligned_v_ld_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		if (masked) {
 			if (vstart == orig_vstart || vstart % mask_len == 0)
 				/* Fetch a mask_len chunk of mask */
-				get_vreg(vlenb, 0, vstart / mask_len * mask_len,
-					 mask_len, mask);
+				get_vreg(vlenb, 0,
+					 vstart / mask_len * mask_len / 8,
+					 mask_len / 8, mask);
 
 			if (~mask[vstart % mask_len / 8] & BIT(vstart % 8))
 				continue;
@@ -326,8 +327,9 @@ int sbi_misaligned_v_st_emulator(ulong insn, struct sbi_trap_context *tcntx)
 		if (masked) {
 			if (vstart == orig_vstart || vstart % mask_len == 0)
 				/* Fetch a mask_len chunk of mask */
-				get_vreg(vlenb, 0, vstart / mask_len * mask_len,
-					 mask_len, mask);
+				get_vreg(vlenb, 0,
+					 vstart / mask_len * mask_len / 8,
+					 mask_len / 8, mask);
 
 			if (~mask[vstart % mask_len / 8] & BIT(vstart % 8))
 				continue;

base-commit: 3593a5facc4c6938b90429a6973ba9ee21fc5899
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
