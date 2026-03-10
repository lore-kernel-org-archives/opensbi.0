Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E575FD4F16
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jU5BpeLmu27HZ3kAdiCl9BKmbfM5K59Yw0m1mcXu9so=; b=p3J9upx4JnzC3s
	E57lFujnetvCJKc0Gg82rTd8pTMHWZQJaSpoX8USPyUSaA0+maTSIbs/oltoSfyI14CPITuYshrxJ
	/Ez0vpsqtkMFmkkW8jcoBCZdaTYcDke+/r3cSZ/AGh/DyWK9JBoLm1VO6SochOdkjPdvc3hco+L2j
	CcSu1VTn9ZSt3nMLUP26SshK/pY/hVw1YHvBQzCBP113QKNY31gS+GXx51EtFTcZyGScGKgHez+ju
	ifM77vWOmEm022MXBjBABColr13VI+bmHmC7bYSFL8Ubk1tiXExLLKF3jnBXWpogQmqegzVWV2Rcv
	3wIlfv+xfitjwrm74R+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tf-0000000A5D7-1F8i;
	Tue, 10 Mar 2026 18:33:35 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tc-0000000A59e-3LiD
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:34 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2be22d699c9so531972eec.0
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167611; x=1773772411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7xN45D1MQHmEwmS7mDXP8AVkRDWe79iMOSbohR+gT4=;
        b=SRTkqspEZRpL9nGr3/zbLzVgO7w6bmMwvA2nWIuwGI8gRHuSqj+limFpIjoKRiv7wq
         WCx4fqWZL0DxU9PmkYpj0QlwsneUzQ5hNoQEqfPyuRm3GGfbKtxFRNPPlrii49lkA5e5
         mSkHOp11sTMFtCh8ind5foqj50svx0SfpogpInkRdo+j8OIpuKGQdwnNZ8nlnsrnFUEl
         dgI5LSvp9OolsUHn3NHPX7D8BAhMojOA2XsR/LhvLwk0nKKboWRvhTQyXzkOTVmU/ccu
         axw9Dngw4mz/EaT9t6QT+psSJ4WaS6IOUdW+J8E96y7GuFxeH9ZrjtGJjsmpi2tkXwRG
         6k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167611; x=1773772411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7xN45D1MQHmEwmS7mDXP8AVkRDWe79iMOSbohR+gT4=;
        b=VFaKVPDGIuNuStzd2Hfddqa547om9Zd60cFUupec5Gc5E7NYe+SuSJjaHhdrexX0wY
         G7SKHQ2zR6hWdh3xZqWsyvSnDyX6yPrRnSmCbSr8XhSJcLLCZCR09XfGwO3buSpYtBH2
         L193TqYmrFgs2juk529sMsX/eThEty2nsKIDXpe+ozZo8fx/tfCvAVUg4l2Dhx0fjlNt
         9+5ab8RVslLtda8eCjYYSzq//lX5i96k9u24fM/wt13nzk4FmfB7b4EUA22QvHnIr+84
         VZAY27wzusdSJuzwH2Qeid+ZIkwGNjq37aUA8QwQJrKPS1BHf0i74rDBxUoAGZ8VNG5l
         TWrQ==
X-Gm-Message-State: AOJu0Yyz5/fvuqz+k6LEKwdamOhfpxsW24VBmOY9+60laujltAH2hVOb
	fahN/+sc4+sajHYoYuZUOtkoKXqOM5U+PnEz5uTb+A6T79L6h7Jeb4yv06IxwCV5UoSKt/xQ6Np
	zgMul9s0=
X-Gm-Gg: ATEYQzyMvgMcCwCwg6nbYMLb++7irNiRfU7V2AqmDl25Qq2uwOgSdH8p7CnvGBtOZWw
	ZgmJjxVArgt084yt7VKh1jPa3Y3YfR1dK9IJi1MUmmeuGFEcG7C0BVo4Q/h8EoZGqSRuvlxZmz6
	37FUUbyvbcCm0vK4lV6i3l3vuSUkfT2bt9sVduU8kUdejLdIFBP4CGCpSGLiEiu/muDqMaWXmCH
	hKWe4yYnlhSkQL7ZAeupMqXMs9f9j3RJB17ZCvdfaXf0FJiNginvz60TnBydBjk/9Hffmk/i0rX
	V+cvFqaZkfTbAwXYkbwca+h7gSUyp56zvjfw6WVhXKP5CJmTZeStbgQLTWIpRiJvylkWagTiipd
	gcm7TF48VHUO1HaX091UVa/Lq0GT+9Fjpw7CKBzNxB1KVMu0kyEJUGglJgiBL2AL74Lo8SxvZWg
	vOArbc7GmGKuerVY+s9NcGHPLQgfc=
X-Received: by 2002:a05:7022:fa3:b0:127:3480:7ca5 with SMTP id a92af1059eb24-128c2dbaca9mr4186775c88.2.1773167611477;
        Tue, 10 Mar 2026 11:33:31 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128d4941b41sm12100277c88.12.2026.03.10.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:31 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 7/7] platform: tenstorrent: Add Smrnmi support for Atlantis
Date: Tue, 10 Mar 2026 18:31:55 +0000
Message-ID: <20260310183155.2186463-8-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113332_851019_C97521DF 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Evgeny Voevodin <evvoevod@tenstorrent.com>

Enable Smrnmi extension support for Atlantis hardware platform by providing
smrnmi_handlers_init callbacks and stub RNMI handler.
Atlantis platfrom code installs the generic Ascalon RNMI/E handlers
with ATLANTIS_MMR_BASE. It also installs stub RNMI handler callback.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 platform/generic/tenstorrent/atlantis.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/platform/generic/tenstorrent/atlantis.c b/platform/generic/tenstorrent/atlantis.c
index 59bbd0eb..4afc0fda 100644
--- a/platform/generic/tenstorrent/atlantis.c
+++ b/platform/generic/tenstorrent/atlantis.c
@@ -49,10 +49,26 @@ static bool tt_atlantis_single_fw_region(void)
 	return true;
 }
 
+#define ATLANTIS_MMR_BASE	0xA0000000
+
+static void tt_atlantis_smrnmi_handlers_init(void (*rnmi_handler)(void),
+			void (*rnme_handler)(void))
+{
+	tt_ascalon_smrnmi_handlers_init(rnmi_handler, rnme_handler, ATLANTIS_MMR_BASE);
+}
+
+static int tt_atlantis_rnmi_handler(struct sbi_trap_context *tcntx)
+{
+	/* No real RNMI handling needed at this point, stub */
+	return SBI_SUCCESS;
+}
+
 static int tt_atlantis_platform_init(const void *fdt, int nodeoff, const struct fdt_match *match)
 {
 	generic_platform_ops.final_init = tt_atlantis_final_init;
 	generic_platform_ops.single_fw_region = tt_atlantis_single_fw_region;
+	generic_platform_ops.smrnmi_handlers_init = tt_atlantis_smrnmi_handlers_init;
+	generic_platform_ops.rnmi_handler = tt_atlantis_rnmi_handler;
 
 	return 0;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
