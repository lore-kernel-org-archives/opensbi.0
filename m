Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72A0C71135
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DlZDlupRu2AlGLRRhawsYyOpWniU2HBXZ5Fg4tHe+AM=; b=B3a
	F1PnCBV2ob22GCib8YvvpzT7Wrz9In9dZcWW2NoVsHsHeX9bm06C5bw9MjqwPML4k0IfAWCqcgDY8
	zMgEZY7pCwCvV/qMSmDd9iuZUBa/IgLnZK1gGqWS1phSeZ0GSlU1XKswLvlB7H93xTEpPCDRz7cPZ
	d3q8y5/Pex7XM3l7tWCJ/O8rP/1zmj4RwOH3K1e69ybFpAV8xErGumFFgf0TXDdlELzU3hLyFdFQb
	K2oWiZNwRspceoY5OXa0Z1OP3In6PnO17rdSr1R8gXHmtf0Uq8XZ0AvQOUPvRgkCSunSJPhX1KwEN
	2qiauyL8A462pWj/l0Px7ngEM91kzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6zr-000000043eA-1xHI;
	Mon, 16 Jun 2025 10:23:23 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6L9-00000003wWn-48gW
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 09:41:21 +0000
Received: by mail-oo1-xc44.google.com with SMTP id 006d021491bc7-60efc773b5fso2388899eaf.3
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750066879; x=1750671679; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VBuvIRRpg4wvTYC0LX7dARhZeiHlTwGcDw48ZwZs2Sc=;
        b=ItG/pN7i34ui5PTZPDY8io6lIIFFvku//1IvKqWlRS1XZx4C3YX1lH/i100klOUJjF
         SJNd8IMiU1b9BtAAcM8tEy/7E3XIEWph/fX+MZXHT2a41FHuxQTWmuzCm8GjQQmbXf8a
         Md/tCc1xO3Zo3EiMUoCptWY0sDRfjhL+iQWNAr+UD8VICejL/SdTGBT3RLjDKij3cqXP
         yGwEI3TfkYqDPZCbcDNwIvvKeUDAxMyQThtbRe/zmMbta8FfYTje0StWvfcAXvnf0/LN
         mheCfuX271zIKhTxb17+KEfYm2YLjGveRbWXYD7q7lYg/0a67ItVH32EJ58xAB0MZrne
         wmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066879; x=1750671679;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VBuvIRRpg4wvTYC0LX7dARhZeiHlTwGcDw48ZwZs2Sc=;
        b=B4JwH2kaWJrraIHz5wEc2DPA388DZAGZhpy70+9+Q4rurtH6rB2nqhMa4Gj7aMj5P0
         2NbHn0usthGNikH/sdbWt6YQSWFRTcMeJ2I6FKN48gayOKB/TFcAoJpeI+/kGNtNq+Tn
         w9lsV9gn3Q9ZGmJyGR1cLkE9C6Dkoy8F32amgB7poEnFBU5+q+XLRtlzi18Y4wDWDz+3
         FotcC7LWfQC+MzOptDG9gOe/7ZOSst1KO43KN5OulQPhfi2I2cvErsL49uYdsa+3byIH
         XLx3S5xgENBBOtO0ZA1ZwAx2lX/I+ckFHu2BM9JoEH2P79HE1/gjLKdkLtUW2NjD+FTM
         tobA==
X-Gm-Message-State: AOJu0YyIE2gBqb43EQHrG4K8LOIWRotXGBPGyrfBVjzXTS32wnavzVMG
	JXSgYtn2XBS/uumAr5dEWaWhry6tLkcfVz8qEJtERkh9UWAoT/4uLV/IbcCcVjNN2Xj+5mRymYg
	6N7AzvtS7/XMBVQipfbZXrwINgI/TAo8aJ6EmdlI=
X-Gm-Gg: ASbGnctwJqf7nmdIYJS/SomNAtlNhBwlJwJ4pWqwRYPu5PKtpVfph+jIGrIM/gsEyiA
	IYnOll8aU5Brdxi6m5lEToTKGNO0g0lRdtM1dhjy4L7QVHHZc4pKBOAXGomIPSoSE/TE0q3Y6Sl
	0EnFcdr90AH5EBIeJvP6uopdMgnHmfl6yKqjJ7Oy+xvI0=
X-Google-Smtp-Source: AGHT+IE9yxlbJ3ozmniq135aB6EwluIim0wonA3bQE9n5YCHKdrj/NfnFOWmkBCRy7W2hZOwUYzVjqEGCKvYbKYuTqA=
X-Received: by 2002:a05:6820:1b96:b0:60f:446e:2ac6 with SMTP id
 006d021491bc7-61110ea4febmr5050139eaf.2.1750066878810; Mon, 16 Jun 2025
 02:41:18 -0700 (PDT)
MIME-Version: 1.0
From: Neo <neopimail@gmail.com>
Date: Mon, 16 Jun 2025 17:41:08 +0800
X-Gm-Features: AX0GCFuI90iyv6CbSZzxOWnAVOagIgeksQHQIVvEcxEUstf428rwrX7jJaF97Vk
Message-ID: <CAFPVDjQZ1gpf8-u--RBbAL1Y0FfDN2vZ3g=wBw+Bp-8ppuz3HA@mail.gmail.com>
Subject: [PATCH] lib: utils/serial: Clear LSR status and check RBR status
To: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_024120_024218_B18F2B26 
X-CRM114-Status: UNSURE (   8.14  )
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

On some platforms, read RBR when it is empty may result in an error.

Signed-off-by: Yi Pei <neopimail@gmail.com>
---
lib/utils/serial/uart8250.c | 6 +++---
1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/utils/serial/uart8250.c b/lib/utils/serial/uart8250.c
index 82fb142a..ddae0aa3 100644
--- a/lib/utils/serial/uart8250.c
+++ b/lib/utils/serial/uart8250.c
@@ -134,9 +134,9 @@ int uart8250_init(unsigned long base, u32 in_freq,
u32 baudrate, u32 reg_shift,
/* No modem control DTR RTS */
set_reg(UART_MCR_OFFSET, 0x00);
/* Clear line status */
- get_reg(UART_LSR_OFFSET);
- /* Read receive buffer */
- get_reg(UART_RBR_OFFSET);
+ if (get_reg(UART_LSR_OFFSET) & UART_LSR_DR)
+ /* Read receive buffer */
+ get_reg(UART_RBR_OFFSET);
/* Set scratchpad */
set_reg(UART_SCR_OFFSET, 0x00);
-- 
2.34.1

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
