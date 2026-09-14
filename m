Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A738C88E6E
	for <opensbi@archiver.kernel.org>; Mon, 14 Sep 2026 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VopZc5IhXUxseLpRYlj2uQhOmXZiTC7+dMikCy5eKR4=; b=3a9U9FqUq/rwRH
	tu5/HPn5WOyeHKRgqezS2868GZVMO2ZloPEVyqSlHsQNPIR5iS7C2ugVVsyImtkiTSY03hbcI96SW
	OiZ6GzEYI+OeYJYXTtiKdoakGMwkw3htCkGARIOMLwuJ+aj1QWG+zbItCkJ766tm/8Qd1K1aVpOFE
	giCkSgqIJDKTHvkNLqVs6OvJkqn8nQwhAybVhZEwZutLg8eoxYbg0qSpL7V1pmIgIs4szmyFKYr3u
	ldYGSJgubAFlvlhWsnbUdkRAe/lO/zWMB/YD/nuA9YeM6AM+Sl7bOE+5XH3M9bZanGNtKi3Ema6n5
	XWznFyQ2EpZVkOwz4c8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62E2-00000002m9M-1ytc;
	Mon, 14 Sep 2026 08:39:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Dy-00000002m7E-3stA
	for opensbi@lists.infradead.org;
	Mon, 14 Sep 2026 08:39:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2045886a12.3
        for <opensbi@lists.infradead.org>; Mon, 14 Sep 2026 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789375178; x=1789979978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDvXEo0jVTj/l3bVFTbEZuG5Zu336o9nooUeKXvC9qc=;
        b=L48upVoikMEMrg1T3qaRdTPLaqDT1zqZp1OM3fkRxRVgTR7lBlPtHVKRtfZ54QQK4+
         +2YcHT506cRKH+Eog5UW8mxcMPVf7n3SlQrdGuSXLRMtuBukmftvbDWX1xtuABsdqXhz
         8HmmtUsCFW21d6QVbnON/8D3UlgdnkCLpgVTsjEi/wjaytUaTDIcmGCCgFxmgkPNhRxj
         aW2OgDOmYsZSCbr++WXxQM9wWyMJuuekp/f2Vi7ei/Yp3BsoTFlYZp1mOKAj6oxveFbU
         Z/VYSLvtlaQ+GiWFYa6NH1ZYzxAgrxmGRNWL+k3RkEaRkPhOnSYyDpl87mONzxlHkCeS
         p65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375178; x=1789979978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDvXEo0jVTj/l3bVFTbEZuG5Zu336o9nooUeKXvC9qc=;
        b=tIMoB0f50qOdlgirmUTyi96pvLehM+exm3d9HXEuRuKU9zK+DOIniIF2eV0ZD102kc
         MTKxLvk852t9bWfCxaQL/gBK3rMW7XgQvtZVgTI8EN75ZiCDXRVmn88F/su1zR0o9Fah
         jpXujiwX7bNbo02+4dE+IsGydYbhml0J60hu9bsV9FEluaTr6iRnZo31107KV0wS1fNL
         rxjLT90v+DU9SteovCtgZkUoJVgG/Nc+lw6bKVyEeOSZya+h6BWskpUNrF5oEHVs4fD2
         L8mij1EjeqW9IuTouOHLZlqdZ94jLW6p8dy2+iUOpEObHwpVYG3K0n6DbYBTdRWq9tA0
         CyPA==
X-Gm-Message-State: AFuF++nGjZG1wxYqX2Q+NRgJpP59TWh5x2lwNQkJ2FK1R3VsZYIQoFXT
	N0lka5+iVc/EsHwut05P1GsvHSWaKbow1cytnXppYpYserA7AoGsLCbMnqF0mo1UPT8=
X-Gm-Gg: AYBFou2TFr6bmJzPzh84NXWbkWfSr7fOdluxQ0HEgkkdcjAJKphOwOMGMIy19iydy2n
	l6KXKCyjAeofhvnw5cjYQiB1k/PhdyAAAndLzRutuxkqwhjfSMTSLpRTk3lKDfpTDOMG6qIqs/J
	L27cvwJwKf78Imcyct8bySibT5Z+BckxUVl+5/VFF+YQ+1YBVN4Duq4MxvkeGwGXDsHcAuVOIJQ
	TAiKe6trE3ru9Pa8UWLAKxTO/xR/U5jjpg91clw8386FU+l834L2HuEOOSO7S4iwMRq774iUdz0
	NJ4UFjfqKjdiXhGCydGiYkk1StxBSd/xrsxdXkzknoFY9q2PRP+d20xZ1WYFe5d02pPEmmvoY4H
	lkJIFYcsCxReilRa6vq0VhDDeo/RUqWW7DQSdd2DFrx42dejWY+8i7PIUe6kxOJY+nb2U1GZKU3
	IN6E3rFC2p9dKATIHkk8hZ6WyxXUljcWYedrKXWg2QLWzxqOLF/JKyIxRxf/casrwnr/xHtQtoY
	ZwnUBJZ8w==
X-Received: by 2002:a17:90b:4a45:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39dec10b1f1mr3495076a91.24.1789375178084;
        Mon, 14 Sep 2026 01:39:38 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm24665369eec.13.2026.09.14.01.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:39:37 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Mon, 14 Sep 2026 01:39:33 -0700
Subject: [PATCH v2 1/2] firmware: Clear scratch->trap_context on warm boot
MIME-Version: 1.0
Message-Id: <20260914-trap-context-fix-v2-1-3a6bedc6fcf0@sifive.com>
References: <20260914-trap-context-fix-v2-0-3a6bedc6fcf0@sifive.com>
In-Reply-To: <20260914-trap-context-fix-v2-0-3a6bedc6fcf0@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Evgeny Voevodin <evvoevod@tenstorrent.com>, 
 Nick Hu <nick.hu@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=tg9zI5bQAR9GfIN8sR3In4PmUikyFuBK+65rtfT/Kjs=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqp7LI2cEXHXy4vEIwRFf0Ob9mbHFNF5Aw4tIXy
 At1E8xBFkmJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCaqeyyAAKCRCIoTSWt/mH
 4LDWD/9V6tQd+a0MURJJv58UMncRda4+ommKgYYoI9Ikq3JBQjOmyG3rCOra8+HBf6TyAlfqM0t
 hOCe+w++QnmZ58IBroLorsIcIr4AUYqbSXx7iWFli2fkZ0KSa8zDExH6uulK5WSVmsv2wMXDfhX
 yyWs5Pch0k08UC9R/Xs4JcOY0tkm8EnL2XYYYh3N7Q7OwkES54Ln2D9UWPoqJXWzGdM2yU+ffhM
 EPD7LJdsxud3ppSYdV8L8Zmm0JJBrvzHGH3aQRTxe2arKYteDNTjuoYFg7RaxIn2u/XpHmD3LEf
 XXwCqL+eRu5PIxeppBicYkkUE29Ee8VeCMGT2jFtp2r2YuCtXLYR+EtEbuNtj6N3gTKnGFGWzGF
 +muNLpnKVAPPv1alHK9AfWM3HVO2nVF4wS/t02kgp949LYW2+yGGUygcAidFrsJXQCQmqlQ3+yi
 NS+HVll1NVBnnjlqAHOuHkAWv4Yi9+rDUXUMa22mvgmKEcu57/lB/jJl9gkVeYw+FhZGVRSyGco
 AYAdPKDu4VQVbvqFQmu4LVpQUqcZJNrt6h/J+05D9yKRvsCvBoK1kHahFzz6fsuTGC/WGWUToHm
 MeW893HZPLM6JDzrbkVmJJT0emX+i5QGAhYzBPhHq5VJyd1ay1/PT1zqFJLZYvMJKAB2v8+Qex+
 kPH0BwX5K1T4HLw==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_013938_974842_76891B36 
X-CRM114-Status: UNSURE (   9.03  )
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

sbi_trap_handler() links tcntx->prev_context on entry and restores
scratch->trap_context on exit, forming a stack that unwinds through
the same path it was pushed from.

Non-retentive suspend/resume breaks that unwind: the SBI call
requesting suspend jumps straight to warm boot (jump_warmboot())
instead of returning through the normal exit path, leaving
scratch->trap_context stale. Since each hart's scratch space sits at
a fixed address, the next trap taken after warm boot resume reads
that same stale scratch->trap_context as its prev_context, which
sbi_trap_error() then walks to print trap diagnostics -- producing a
broken trap dump.

Clear trap_context in the scratch space on warm boot entry.

Fixes: 60ffc154c84d ("include: sbi: Add trap_context pointer in struct sbi_scratch")
Signed-off-by: Nia Su <nia.su@sifive.com>
Reviewed-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 firmware/fw_base.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 0c5c65c10e5cf38d1cc6d0b3a66ffac661e7bacf..8ccca5e91c09f9c4cfcbab9c31c7e77afe7a96ab 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -364,6 +364,9 @@ _start_warm:
 	/* update the mscratch */
 	csrw	CSR_MSCRATCH, tp
 
+	/* Clear trap_context in scratch space */
+	REG_S	zero, SBI_SCRATCH_TRAP_CONTEXT_OFFSET(tp)
+
 	/* Setup stack */
 	add	sp, tp, zero
 

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
