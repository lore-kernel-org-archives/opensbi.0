Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D52C61DFD
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 02:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJXPIzVbsCAzJO60p00uykzenWoqXhQXAv0IL2L8EIg=; b=ZavWcfjpIOP2Ww
	jqs4CRjo0Wv6pBcnSh6x0WFYw0A9fFJsFLgftAEtZKvnDI9B3Ld6Lcvi94QCEcUhydh404POUBKOK
	VskWF34fOvriOeS4i6941JFV5bUnu7CJ9heYV6n9EGCMc7HHb1XhmO2PC0U8TsaK2zeF6u42yozVv
	VteVttBpAJ38TzY0oZhYUV4FC9g4X7xWiiG8++jEZxSmzwUW62FqagHYLRC8+GlzU02zC359CiWfL
	HcNoFN+ETtakDO9sj4KN4NQPVj1G8aCg8ehM2iRrfYYRSAI0t+CWB7Y945ad/gaQRoM3SQNhNIYiD
	m1y+mYKtWfzXYSe9iAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8j-0000000Argq-1xcH;
	Tue, 01 Sep 2026 02:22:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1E8g-0000000ArfH-21sV
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 02:22:20 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso3752122a12.1
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 19:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788229338; x=1788834138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytSKm5C2E+jtd+CbfUMGPTc+Q0I8tzsCT3mOTe4cLIw=;
        b=ZVkR1bgcFQr0UDKShRANEqqxJTPQZjbQzY0zogHds9QMWeuqxoLvAMSKCg6t5Gt02r
         P+otxPSfqAdjwpvQxzLsbhLFI37HcyLeXIBPkFtXhPgb7LAh+ekwbglV7VYFdJUXWHf9
         /98YNdF4TfsNCJAGsJSWvx0o7uPNqIUC3V6Q8p4iw9ES8fjxpsd16KdZD5fKrrHx43M7
         b0aJr+hf47kRAz1lbusf5bxjTL4iW0jjM0RYbtm//3C5yAY1Bwv+CU6FyXmQdmCoy9+2
         y0tLWZ7XYfoFySvLsq0+DJg/a9UDK2LxqBMs2ImrxiyAFoe2yLi0+wyfqvntBOGqsCzg
         Z1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229338; x=1788834138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytSKm5C2E+jtd+CbfUMGPTc+Q0I8tzsCT3mOTe4cLIw=;
        b=DSECPqlFAWXfNJ+FJK2709Bsmy6T7tCs+04DenLQr/ClPCdbdif5AJpFIffBstplAb
         u1T5GkNiWU6+7D6U/A+i6nrA+39HAqoo/N/wjkM3EPjUN26jkH0/1fl3SrFWmJuawi9g
         tUtIl8qyguy3Gcz1+LtodPPrS7ApxTuP/7ki77EL233acPlNe/sACkt2D3ybOTX1ldr3
         RuaeCx6LR1+dd20Nd7gnOPTvz+4SKtRnT4/J1Saud1jLkI85bYRrofLYAT2Fwos6ak4B
         de7PQepKiifKXYDR6qcezH4rwldHAyJRMRpc3275Mc8PQqbmJqTYHWQNqe9PEGHpYbna
         +6hQ==
X-Gm-Message-State: AFuF++lyd877XmfsN/ZH2RoRXbd6VDif/8Xc58PqvpIg0J3xPoFr/9Ny
	NQDSq0p+TxW74PPi3SEL5RufGsqPpovNk+AHYGaqvn0MSAA9wiBGamQZtmOjOpFlhip39Ktf0qb
	hrC5NgHigVePbHIMReJvNyifl0/RxnhmD8V/ye9FTYKvMJ3gZ8L2U3YIpm4E8E86cCopi2DhzXN
	G7g7KHKJ7fxAXO6W/J2fT2rY13hTJKq+vX4ly7cZXI4I+0Jg==
X-Gm-Gg: AYBFou3FPZLUWrKw0X/ysKVwgzkUS8t0jldVA4FPN1sSaXzEA8ITzeIe3TMaAxvtR7P
	qR+XNqY/a6gk54GUD8zgwPnVs20XWCvIEx5fD6JkYHSFzD5VdrBzg758EsCu/ACtW63I4FSuo3e
	pqtDRSzkpkV2cl6oy/KwoVAwTMrj87xZX3JPGp2+/dYWppTjdzRtuF78BogkneP7Xyx8frkeWXP
	3cIDwWA6F+atbLWaalXtUQp/8bmn/BGN5RUeCBpoNqkqu1ajr15EU3I9cIJHxVsj2cvddL6Xtuy
	Ut4jmoqHSnz/VP7RvzAQO+xIwzWb+twepr3RopDfk+3KQF/7yibmxGCYg9YAuqvFHh2WXXJW3vK
	liLsk91ooQYRtr4buSYoB6/SmLjaIhRt5SBl0iUaPk7O0g7QLpWrD/CTCX1itLadaHtbfo/iRor
	og1Af5FqeU6mesZ7VMMA3lL5RS/UeLDITBLA+A5bIqXN2T2TpP8MA7Putm1dlGfuyf9bpIydbo
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr7308075a91.6.1788229337736;
        Mon, 31 Aug 2026 19:22:17 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm33287164c88.6.2026.08.31.19.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:22:17 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/3] firmware: fw_base.S: override a0, a1 and a2 from the firmware header
Date: Mon, 31 Aug 2026 19:22:10 -0700
Message-ID: <20260901022211.2619560-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260901022211.2619560-1-zong.li@sifive.com>
References: <20260901022211.2619560-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192218_522465_7A843F74 
X-CRM114-Status: GOOD (  16.66  )
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

Wire up the flags word and the three override values in the OpenSBI
firmware header. When the previous booting stage sets one of the
FW_HEADER_FLAGS_OVERRIDE_A[012] bits, the cold boot path replaces the
matching register with the value stored in the header before doing
anything else with the boot arguments.

This lets a previous booting stage which cannot pass the boot arguments
in registers hand them over by patching a few words in the firmware
image instead. For example, a booting stage running on a dedicated boot
processor can load the OpenSBI image, patch the header with the hart id,
the DTB address and, for FW_DYNAMIC, the address of a struct
fw_dynamic_info it built somewhere in DRAM, and then release the hart
that runs OpenSBI, without ever being able to set up that hart's
registers itself.

The flags word is zero in a freshly built image, so nothing is
overridden and every existing booting stage keeps passing a0, a1 and a2
in registers as before.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 firmware/fw_base.S | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index dd2adb8a..bf458ba0 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -114,6 +114,38 @@ _fw_header_override_a2:
 	/* Reserved, pads the header up to FW_HEADER_SIZE bytes */
 	.fill	(FW_HEADER_SIZE - FW_HEADER_RESERVED_OFFSET), 1, 0
 _start_real:
+	/*
+	 * Override a0, a1 and a2 with the values from the firmware header.
+	 *
+	 * This is for a previous booting stage which cannot pass the boot
+	 * arguments in registers, but can patch the firmware image before
+	 * jumping to it. Nothing is overridden when the previous booting
+	 * stage left the flags word alone, so the registers passed by all
+	 * existing booting stages are used as-is.
+	 *
+	 * This runs before relocation, so only PC-relative addressing is
+	 * used. t0, t1 and t2 are free to use here: the boot arguments live
+	 * in a0-a4 and every other register is reset further down the cold
+	 * boot path.
+	 */
+	lla	t0, _fw_header_flags
+	lw	t0, (t0)
+	andi	t1, t0, FW_HEADER_FLAGS_OVERRIDE_A0
+	beqz	t1, _skip_override_a0
+	lla	t2, _fw_header_override_a0
+	REG_L	a0, (t2)
+_skip_override_a0:
+	andi	t1, t0, FW_HEADER_FLAGS_OVERRIDE_A1
+	beqz	t1, _skip_override_a1
+	lla	t2, _fw_header_override_a1
+	REG_L	a1, (t2)
+_skip_override_a1:
+	andi	t1, t0, FW_HEADER_FLAGS_OVERRIDE_A2
+	beqz	t1, _skip_override_a2
+	lla	t2, _fw_header_override_a2
+	REG_L	a2, (t2)
+_skip_override_a2:
+
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
