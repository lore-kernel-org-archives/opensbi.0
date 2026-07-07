Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A400C43458
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdVRcgtXNNr3aJr3FC63RwQ97e37mjtaSp6PpTlZDDU=; b=BPWRlVZP23vFmw
	GIq1TC+Wq4QCQ5z3Bz46NTjVyDK6/NTgt5+YcE/hodd9naFd/aoRb+Hat6f9fW31mE8SSdMr4+1Od
	++aV7c6pl20AClSCyNWwlZq731Nxt9QAH3ut8/sp+ED/Ezdb4yMgRYGP9RB5nOR70wqm+aZEU+qQ2
	HUaT+qwN7Pvy8Zo5wO8/vYXMB0YMPr0JLZRFa3wjiEsna/ZWT8v9P5Bza8W/cErjcdrYYQA1Kts7f
	/LzM7WPFcNavs1BocdN4fnHsooqu8MFrzqneh7yB+ULgAElXPM+zWnUqMpXcejXdFXwXPxstWon/L
	tHfZKd/RtnrEuy0xbwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfE-0000000E17e-3oSP;
	Tue, 07 Jul 2026 03:40:04 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwf9-0000000E15J-3ziH
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:01 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c998fd549a8so2593742a12.2
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395599; x=1784000399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awz292X1Pt2fVJrL5Rhe3VUo3CtsURzj35FgHuQ4Hww=;
        b=LBKpTdgQc7ao00XzTxG8H3kd6jL+GRDPAWHfuZH1gw2ql4OSOJf34IrTUTK8aF6n77
         Y3UpkXCm74gj4nM+urK3CA0CS94L2E6yfz9sDEqiQ1RfMnSXKhFXjJgvh2E74GDYVvte
         dYVj5wOYkKTRtXRmMgvJ3qNxy+2/PMDOQG/apZqmG48LAVGZUvM9zSf8I4N86/eIt1c4
         Df7VZOXrLtYbiU0uQ5aT5FLEeVbxok8ES2ENGCGw+MPLdgmEA0K2kId4EqxqoUR4Sh6L
         ONg0GhdE5weQRhENfqZ9Yq7YGUfghcN/qWxgeTkOJbD0FIqXV13zsAKnTGKV7/FgOfne
         JEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395599; x=1784000399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=awz292X1Pt2fVJrL5Rhe3VUo3CtsURzj35FgHuQ4Hww=;
        b=Z0U6H8swRn4Nb4u53XxwhC1kXvr4Mw/ikZp/8ty7jPV6ohO0JNbI9jQq/5MVC9ypxL
         Gvcn0ZmN6Ejygd52xDXcWhtKV3xlGL1tVdirjgjILQ2zjX/C3p3//av7NTNaavW9GeJr
         O8yV8PVGkiSlQtHTIC+23aX9nvE0/h7v2e6UKudIbZMvd5zaTrMs3ZfnAhdWYnVmmAIl
         V7Q9NYHfNiB5WtaPP0dT9r+ztIWvC2+yp04wliIDlJKsQwrT14d87J21jsfYg0X+M4u4
         yljs4TMhnSechFi4Im9u92wSdP17ASBb4arVinaIZs/Gczfqce9pw/bq3wuABxQuzleo
         2+Dg==
X-Gm-Message-State: AOJu0Yx5emKOvpXQd0UgDhS1G1mK/pwRZTHOGW/fk694dkun1n2S112N
	uKG2n5I/6Y7vH2vWB30lrNVLe7qAnya5tesomqdX9FsUxKOm6/DTfMQ0sqQ8ichL0QvWx8HFlgo
	Tchzjw5wPNDwJpxtsymPAmOirYMYr6ZeyhEenaIH/ir6dzKcVLHg8lUL8o3llzMN9W3h5BMu1u2
	QrnS5YHoZSZ96wRcwPy418r0OTaHuR97loL2ax2fi8kKS9kw==
X-Gm-Gg: AfdE7cmOC8cmaG1GnknKjxNQr9Od/n3rQrQpsj5xbvdlwcQEFVuRO/vVw315SEC2Qin
	cZDBR1hX+OhCM6wxySQNYxWPOoUIbWNJkaIe4qqtz4iA5wzZnqHFRKAK1raMSqZ7Az0KedjeMza
	RcegNAarwOoFmRNjIA82xQK6/gtSQ4w72oBINl0wJnH1cEoI1TgJMYZNDcaKkH3KEDXjx8GSnnM
	DFveuPLprI8EoGTkIP3cNErek03O1LAr1UVUdTf04Es+Iablc5C2lCm7S8SXd+VqWp/3nrm2F1Q
	tmMfT1AJ4d4/hLaka455uXZ1NZhdXndNh3jkNoIMQ0vpkEdeY5fFtdArdK1QgHldhfPtXQsskgO
	R9VA6dlyAEpnk+FVEggRVSepSZbsED2Z5dHOY0+PXPl5cVDPZuzsArerKN7Utu/nFgBYGl3zrDe
	YZaHHrHj1Bj2+yD6XztfkZb2E3
X-Received: by 2002:a05:6a21:48b:b0:3b4:9168:d9e6 with SMTP id adf61e73a8af0-3c08ee94f75mr3804421637.37.1783395598754;
        Mon, 06 Jul 2026 20:39:58 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:39:58 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/7] firmware: fw_base.ldS: add .fw_dynamic_info output section before .bss
Date: Mon,  6 Jul 2026 20:39:49 -0700
Message-ID: <20260707033954.2054859-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
References: <20260707033954.2054859-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_203959_991658_7600660D 
X-CRM114-Status: GOOD (  13.06  )
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

Add a dedicated .fw_dynamic_info output section placed right before the
.bss section. Because .bss is NOBITS and gets dropped by objcopy when
generating the flat binary, any data placed after it would not be part
of the file. Putting .fw_dynamic_info before .bss makes it the last
PROGBITS content and therefore the tail of the .bin image.

This section is collected with KEEP() so --gc-sections never discards
it. The whole block is wrapped in #ifdef FW_DYNAMIC_APPEND, which is
defined only by fw_dynamic_append.elf.ldS before it includes this file.
For FW_DYNAMIC, FW_JUMP and FW_PAYLOAD the section does not exist at
all, so their layout is byte-for-byte unchanged.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 firmware/fw_base.ldS | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
index 12c7a844..6ae6fe62 100644
--- a/firmware/fw_base.ldS
+++ b/firmware/fw_base.ldS
@@ -82,6 +82,30 @@
 		PROVIDE(_data_end = .);
 	}
 
+#ifdef FW_DYNAMIC_APPEND
+	/*
+	 * Appended fw_dynamic_info used by the FW_DYNAMIC_APPEND firmware type.
+	 *
+	 * This MUST stay immediately before .bss: .bss is a NOBITS section and
+	 * is stripped by 'objcopy -O binary', so it is not reflected in the
+	 * flat binary file size.
+	 * Placing the structure here makes it the last PROGBITS content,
+	 * i.e. it sits exactly at the tail of the .bin file,
+	 * so the previous booting stage can locate it from the image size.
+	 *
+	 * The whole section is compiled in only for FW_DYNAMIC_APPEND (the
+	 * enclosing #ifdef is defined in fw_dynamic_append.elf.ldS before this
+	 * file is included).
+	 */
+	.fw_dynamic_info :
+	{
+		PROVIDE(_fw_dynamic_info_start = .);
+		KEEP(*(.fw_dynamic_info))
+		. = ALIGN(8);
+		PROVIDE(_fw_dynamic_info_end = .);
+	}
+#endif
+
 	. = ALIGN(0x1000); /* Ensure next section is page aligned */
 
 	.bss :
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
