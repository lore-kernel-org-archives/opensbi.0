Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E71FC83F17
	for <opensbi@archiver.kernel.org>; Thu, 10 Jul 2025 01:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DSSI1ETjD/bZYYRT4I8kBV2XrEmi0eZEClqMUfnNhbw=; b=HCWayN9dugyYf9
	ynkmfPniINKyFM+Jt+fQC8RNqG2hJbEwVzSFc+lajLBcEOqvLnZh5iCIvUl7tRLKVtKqLOBkEadg3
	ngA4u7n5KyhMFVRWGc5GuHFx+DQqWPhqFu7guDiNBXkt30/Ps7OyjPaoFDZPhUTEJRfwUSexWysC+
	4Ryjw20+s3Qn9U7XDYPhEJDxIQuB3rtXk6RV1K4xylTvztU6jSDR2D0/jOAsTxHKnOmYGChaziFnX
	tU2kG/8V2KUIcSCzZpoKodql2zbmMxAldN2TXh2bJOpm3kUXf8QmPpwb3KGceuGKH3Sp2b0/65Q03
	N5o/5bYQDBF/PV9kcMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfi2-0000000AOgr-34Sk;
	Thu, 10 Jul 2025 01:04:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfAW-0000000AKWx-2GBZ
	for opensbi@lists.infradead.org;
	Thu, 10 Jul 2025 00:29:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso385820f8f.1
        for <opensbi@lists.infradead.org>; Wed, 09 Jul 2025 17:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1752107383; x=1752712183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBJSz9Q8sH7x4irviKt08m5RhDx2mtnCyHaJ2v0v0XI=;
        b=kcHpgcPvaN0mJUKl9Rz0qqbBg42ZjRVThy+VhD66gqQaynJWG0vP6rk1hfxAzDldL1
         dkBDeAoNz08lKXvq2SpkKEnaKyydUnF6i0Cb+CYKQiQaaz1dBE4UiIXKTNk/rdiJiAsR
         Aj8kPa3FLnoCOYyGgsIWDmMs+yJ1SvcqbTMTgaowfyjjkQ0nc5SbIX2CvVGN1W+CUfsW
         0UWxQSuoLoWiuT/0doTYXxtSMxOfRQT/X9DT6FLmVk7PJtPU/neezwVlkXW6bw3Zd69f
         MG0H0VQKTERdXQCOL4wXWoouWpitSFQAPEiSlQgeyeybL5KIdXQ6m+WPpRu2mqaWbnih
         msVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752107383; x=1752712183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBJSz9Q8sH7x4irviKt08m5RhDx2mtnCyHaJ2v0v0XI=;
        b=uqvTwursm1SfdAuHv7Vx7tAiDJlrZg4nd2vkFXImmXQPSULHmbx/bWOHWPAMQLxHYI
         ruSpsDNC5H8UhgRZ7+quLUY22gUurmeuZ9lVYdIUqVSA+OjgcEaQ8KBQeUDv1YxDiI2h
         SiWX01F1rJwdW7gEUwsIxT4ODkGJ4ZgxeaJhl8BAWi6LIZtMZKaPNj7CPOEWhrt7J9M9
         OAlVA7Ym+/To5FDCv9yABTAnI1pEqew5emvFjbHGVHoxSM8dwP6Fxkwd0tr11fZGFG1i
         tl6j+8Pk2OOH6SE4StxduvbxQ03Q883LIodEYBfcqUC6roIOoiexT37YTrFNDZLDFnqH
         5mog==
X-Gm-Message-State: AOJu0Yz5/chO8LIOJE+kZCnY22RQzWHCVBRixpBdSH46sRb2YtmMOGxa
	ecnW29dV4b/1xmR+nHDpv58ydO7crd7XkyVd1RIASsOurixnXENwxV5dISzpDmTpBzE=
X-Gm-Gg: ASbGncskHn2k8PFwAoXSPYyNgsvh93cuxsTYtEap+TkxF9ZM/BLhEyJy4OGrlLzFFON
	OT57Cwc5wCYFISXGARlaB64HRtkSbOianyQM3D2TdDDbqwsMBtvAZhSm6Zxc6cTes3SdFR8JIWC
	J1yjcd7e2+9gstbanRPV4ul6P4IjP5zu4AsXqWtC2UZ222uuvo5xfVCUBGaN8VdTmJaV6i+C0Sq
	PZjuYe1B/YnqyxIDkGho/0Y441GPA4hYX5LOCeTUsIvNmppUqLPfSLtHOT3dpiJBYlzyD5SgyHs
	Jf8jm0GCFqUihi8MqW5UsrcIU6bPsjjuU+ESgbtLfxlX9BOxshEjNuiWaPJVZzmHukGG72xV1EN
	xuzvAIBBnF8yog4jcuMcNsNWGWMK6FjikfWkhA2fRBb1rK57x1Lk5
X-Google-Smtp-Source: AGHT+IHu3Kguj+5024kE+IAKiYO6ST+Fj7znDGlQOk8J5dh1+Vk0zEIZPtzKseC2xOe8mzhecnNG0Q==
X-Received: by 2002:a05:6000:410f:b0:3b5:dc2a:ee74 with SMTP id ffacd0b85a97d-3b5e78a4fbfmr1362064f8f.24.1752107382817;
        Wed, 09 Jul 2025 17:29:42 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.localdomain ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14d07sm330905f8f.66.2025.07.09.17.29.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Jul 2025 17:29:42 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id 15EF0E7C18BD; Thu, 10 Jul 2025 01:29:40 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: opensbi@lists.infradead.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH] firmware: Rename __rel_dyn_start/end to __rela_dyn_start/end
Date: Thu, 10 Jul 2025 01:29:35 +0100
Message-ID: <20250710002937.44307-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_172944_601058_3CFCB0CB 
X-CRM114-Status: GOOD (  11.69  )
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

We are using and expecting the RELA format, not the REL format, and this
is the conventional linker-generated name for the start/end symbols, so
use it rather than confusing things by making it look like we're
accessing .rel.dyn, which would be in the REL format with no explicit
addend.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 firmware/fw_base.S   | 4 ++--
 firmware/fw_base.ldS | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index aa8e264..b675c9e 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -76,8 +76,8 @@ _sc_fail:
 	li	t0, FW_TEXT_START	/* link start */
 	lla	t1, _fw_start		/* load start */
 	sub	t2, t1, t0		/* load offset */
-	lla	t0, __rel_dyn_start
-	lla	t1, __rel_dyn_end
+	lla	t0, __rela_dyn_start
+	lla	t1, __rela_dyn_end
 	beq	t0, t1, _relocate_done
 2:
 	REG_L	t5, __SIZEOF_LONG__(t0)	/* t5 <-- relocation info:type */
diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index a33746a..12c7a84 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -47,9 +47,9 @@
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
 	.rela.dyn : {
-		PROVIDE(__rel_dyn_start = .);
+		PROVIDE(__rela_dyn_start = .);
 		*(.rela*)
-		PROVIDE(__rel_dyn_end = .);
+		PROVIDE(__rela_dyn_end = .);
 	}
 
 	PROVIDE(_rodata_end = .);
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
