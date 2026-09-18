Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB41C982D7
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Uy1w6BZsQSAOZFkFn2sMo/Itbugkkfxx4kv2YUhrvQ=; b=SzrziugLGql+sS
	7KK8BkYpXAmMSsPXyLj16vwt1T2ye1wS8/jai0JQ7Kj9djrlxiVbMv8M/VFOxjo7ZfBniFfOhwq8P
	iw+OL8UxU6lpjv9q2CRG8PYMorjN0o7UZllt+lk1NO7L9e/Jn/F1i5XzsQgkCzXrbl2P3c4bGBiSK
	Y7Y+iu4rX8vHe0lCmY1+dkgSq/9qCJoTjnGa62hJgquvGd+BGHtQava+QFczbyKIjGWxxTXEbH6kC
	kkjWensuBK+tZYZRqjIYZVgH7uW6Vp5WbFto11RMH45NPr3AQl4y5oJI+3w2M9xGEzYTkJ6oRfHhW
	p54XncW6x198Fomo5Cvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tim-0000000Dm68-2cYW;
	Fri, 18 Sep 2026 08:13:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Til-0000000Dm54-2cB3
	for opensbi@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pxCGm4XVEvdE1VR6D8r6u5YCni+pSd1gfZ6DYOVAfDw=; b=mFttgewafsW3FQ/vEboiYdO653
	Mbo73nDnVpH5KZ3049D13dpBYUITYkvBBHorxyw6K1UJony4waD7iSCIq6uKY+dTner9yORgD5+Fe
	yYfB1JreJxQomKGFaUsL0Ja9fqCnT71BdbndKp3N2GBS+viu0AZrLW7s20377E3RnoYISEDLYiFE4
	AEwbx3AStXePFepgIvelXQUZbhJcbxXnzO4JN4gNQvk4901Hw7QYG3RsZMJxb6lTpsM1QAiumDxOD
	7eoCKixbLTxjjsTidM7ENw61BbXJIpKL2Y2rqdJCW5cBGwUniMiIFfzZSFyi3J7KypxUi0n7C6nG4
	bAAFKpnA==;
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Tii-00000009lpB-285q
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 08:13:22 +0000
Received: by mail-pz2-x0d.google.com with SMTP id 41be03b00d2f7-cc4c3304833so280025a12.3
        for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 01:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789719198; x=1790323998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxCGm4XVEvdE1VR6D8r6u5YCni+pSd1gfZ6DYOVAfDw=;
        b=PZC706y7kW4I0FVZ8etgWATT33uT0FQhjHiPyNG05CGOUpP1SjWnqZiLgL0FlR7Rni
         gME1YudMptPMiH2noCWtTBrfETzk/fDWcTj0Ntl0xEy50vPowoE3+q46PWaBouz2LYB0
         3BBsEL7f/0p9/ITygolmqaIwdYjpWOYI51Z5J96BmBRrDewmbRmbSSl+lhazSb5NdvCF
         3W05cXDuI8KvZyCukDILtQ3uteVZAHYda/2iBC2b6rUY2EpqOuTVtHlv47qpdtHCdDOy
         oxWVnP2POC4lFxBW9Nypc/viUpe9YS++zOAuqYCWAtgdDg7lVwwMw6H4pBtkStkVw1QI
         oGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719198; x=1790323998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxCGm4XVEvdE1VR6D8r6u5YCni+pSd1gfZ6DYOVAfDw=;
        b=aCrLGjZsGVOh/OAhsM5SKrChFwm9aCyLezJViY1NhfMGbgb0rqFkMXaykf3XvqOSD0
         ylAsu61lahShejBeV7Lsdz5soP70T/g8FhRPGBBcs16ELSbrPoPneVDCadfgbp9MOCIc
         Ao4gRouIFdWh3arQfyUheRFgQejqUprSwjvMkNjQeUiTh2D/zWr+XAAbFMuJnErGhHPE
         pDf0U90ZxhNFeUeW8ylaOuJaJV+4DnODBb1EgACscKD7WkxsoNePwoathkECqIJ/5pL4
         J6ulZprZwbq43rdM1JU2ZRa4CUtn2NdMmxMPM7FApPEIVzOFrwAdTfxjS7QsZNAN/3lz
         sT0w==
X-Gm-Message-State: AFuF++kPhU9iCU+pcsIX+wzJuOJ4Z2PvF7cNg9XvAUWXbLfFXAwFDmnG
	hSqGzTY17YBQSsYP0ugTKPy8Gugu/52XDRNGf0fuNECvWegcRcSUovsW1TrHFfbZlfWj1aDt7aS
	RsMSe5/dtUSHkSvEiWAVVZ42YoOa9zWwvB37EtaZfkjQ8uYHvm8W2WutLcsLaEkaT2SGJwRfLpB
	MSOBj1Mv9RKlJGGisMOTyjpRZSLJGsIqY0sJP2DlFAX+v/dLA6
X-Gm-Gg: AYBFou2d8ru6vfj79mxAdRlNCl7YIuFE6G366JbECHrBhhksOYpeJ4pnPQAuu3sIvho
	QcBxBwwaYXBKgHbNWdYUKqLO8/+SvE94iPyzSEGYEH4iGoDac3abQWsddalROs82orFarMU1bxo
	9W75aHbIazqFHlSn7IIZtQHOMWv04sdRQk0msSMLEcsptg1iI4UDlFhLX3PJtHUX5QIxPojWFrl
	TUyX/8jE1ZfkN2MkZwpJObJyq7Dr9nApWAwy3Fn+0igktGS3sJXzq5NCZVOKnVV5K39E35x5OhO
	crUKNFWieQ12BrinLdj5TXGM70/lHxe0qXfBXYjbczKvgxfY+uR40BYMpSDm2A27JZTmVomW2EN
	SGVj/i+Y7aKsAwDnKOXWumNF4Kw7cV0i4WpnvzK3AtT0u0MmyFPtYSf8y4+ru/OLqfAN1OmDO+3
	Yo2c/pW5hB0BxmxRVKOzMTosUc41xYyILDKVoVllW9AAUiN6xcqQEENVdJjsQJ8PAhKnwufoYJ9
	Ztv/RRsQUk=
X-Received: by 2002:a05:6a21:4910:b0:3d9:6f0:b42f with SMTP id adf61e73a8af0-3dd8c541c53mr4217551637.17.1789719197601;
        Fri, 18 Sep 2026 01:13:17 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm2812649eec.9.2026.09.18.01.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:13:17 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 2/3] firmware: fw_base.S: override a0, a1 and a2 from the firmware header
Date: Fri, 18 Sep 2026 01:13:12 -0700
Message-ID: <20260918081313.659655-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260918081313.659655-1-zong.li@sifive.com>
References: <20260918081313.659655-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_091320_703620_DEC52CB9 
X-CRM114-Status: GOOD (  15.73  )
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
 firmware/fw_base.S | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index d01d0574..a76ddc1b 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -109,6 +109,37 @@ _fw_header_override_a2:
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
+	csrr	a0, CSR_MHARTID
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
