Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E10C88E64
	for <opensbi@archiver.kernel.org>; Mon, 14 Sep 2026 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZuFS3eQEIxNAmVvBpgsvnKNqcY6gHYQEdwANYaYOwk=; b=pZPTLqQ9OmjsYZ
	yyJos3suJmR27LQyPE5Vzk5XtUaw+udce4OqwA7/8WUPK7FVhmU399Lw28A58QoC8q3eWt0SD5Lvl
	za6EpLg9066KdNAr9Ecc05jWMYWvZ/IIhliN5JZBfM7xJN7nyfDoa7QrolVFvF7TtG9vtKTP0I2yL
	xV7Gal3uZSfZXDB4oTG3gq46Ov5eUZvOo/fBrWIX87X8UHYvOibImi5RRF3aorVYYmOSX3rzgZ24/
	qpADnOQBx5x+hJo9DTbm2DZkyYMThGJYvcyYkRRl4XQKRZ9r//zg2Wb+WmRbuAuzfDC0FnYg6Wxur
	QnT5dq2NzzcQUT/DWRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62E2-00000002m9Z-2VD6;
	Mon, 14 Sep 2026 08:39:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Dz-00000002m7a-2jl7
	for opensbi@lists.infradead.org;
	Mon, 14 Sep 2026 08:39:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2842012a91.2
        for <opensbi@lists.infradead.org>; Mon, 14 Sep 2026 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789375179; x=1789979979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0mjieHPVtqO7RHGIRKRcFj300ta6FhnWQLNlG1tBM8=;
        b=HbdFp/3fYIJupmjS/pORM5ef++AOOsm9FgWgAxAv0sfPAG3B5/IpJVzBlPwmpCpFjX
         lFSoOwqTmRUuCQyXDXe+CaH6TGNXmoZxgJK80C/ODo6VJXIm8DJhFBgEXvI0e77NdaFV
         cq3/nc1z2aVoSKf+8fwE27D9Bueaug8KmqRYoZ6kYP2tNQ2uFO/3vf5WOxgpYpJr00Up
         u97UCM4erOmRwXfY5igAmkwU3e+LJhznLzzOnyfBddhMUG0UfKBmubVimnZHf4cTbx7z
         W4/LY6hoVg5nu1hjG2EcxgI+bqEp/7gOY6oWI2pebaoh7KPx+0uKqtAUeFoEPFd8hvTe
         W/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375179; x=1789979979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0mjieHPVtqO7RHGIRKRcFj300ta6FhnWQLNlG1tBM8=;
        b=i8r/HRjQ/URvsnR1ooVUJLAa+FBHPDRA158rv6vVjeyaZWwEYRjOb8IImwyZAH/1uN
         Zts7YI41ZxylhdEcF6QxMLD+485HTSbVuJebIC7ml/ygNHJnws4zSdV+mNWogsHttOmg
         kyuE+d2R423jJdz0r5ctpxMKhIlxrl/3/X/uj52KvQiiHA4gtV0MGSJ3tsypjVdahM2Y
         wKh2kuAVcuH8wcSGJKNsyn/AcLA5MPrV3MAbLtwTWy2OI9w5Zvv/Qr1YDcJjFvvt06FB
         gE4JiRIXxpgPbTTnN0d/loHqBumjFP0OH3m0sFKACXvdoKd+2fMAfDAjZWUOT/gLOQ5e
         rs1Q==
X-Gm-Message-State: AFuF++nxTjVXStJQubzd8XN3sW94Ld1RuUv0NBIa4KKbClRED7+hhti8
	237quf6easT/qtBGFV9WBfdv2GNRqadzyGwcgin94jyXu9GJwGTfa2NKL4xejz320Yc=
X-Gm-Gg: AYBFou3Fa1oTAojvuYg1HHWYPdrbsX9KQ8+kgvFyTc8N6T7rDAmJpaWz6Il2RCXwKXH
	SUbpdWl3P3JGdEmbcH6E5Mc8ymko5lNNYgMWvGB3ClML9bd0H/OW5EXxdv5Szbn69Kyt5Kb8LTO
	HpZspbvFGdtqX5rypj9KJ+2iTTd5Sxh7MLDoKlGQC64bZz+fR1S9oKsVpq6Em1pS4PcO0wz8rz6
	lo5WvYvtW8i0l61IfCO+HN/LbvFozOtg45Hofl8FwjR0xI771HaYAeE3m7pL0mXfhbQiaZo31yj
	pefS5oSLN6aucubz6G1WMCjhvuDFM2EeQYkj44MZNNDFdrG7+IvtVXC9xAOGbADOBGol40pCkDP
	RruVcZVECrMdlPYdESWT7HeFaf7p5SLfyTiqBpoux9SPaXewgOAxDxwZ3KCwEYDULztugMB1S9Z
	pCqUKm7n2GEwYqt62ccMUSogjFOqCLy5NC0rdF0fBiiP+kKpWaqA0x/aggdB4zNFcoTL+UGHGwS
	X4CoC14Ag==
X-Received: by 2002:a17:90b:510f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39dec08deacmr3502783a91.14.1789375178765;
        Mon, 14 Sep 2026 01:39:38 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm24665369eec.13.2026.09.14.01.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:39:38 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Date: Mon, 14 Sep 2026 01:39:34 -0700
Subject: [PATCH v2 2/2] lib: sbi: Fix stale prev_context in RNMI handler
MIME-Version: 1.0
Message-Id: <20260914-trap-context-fix-v2-2-3a6bedc6fcf0@sifive.com>
References: <20260914-trap-context-fix-v2-0-3a6bedc6fcf0@sifive.com>
In-Reply-To: <20260914-trap-context-fix-v2-0-3a6bedc6fcf0@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Evgeny Voevodin <evvoevod@tenstorrent.com>, 
 Nick Hu <nick.hu@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=T1ADguHT53/GES3jeeidV78n3vcZQGcUPcIUAWhr/Bw=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqp7LI08GHQHTKe+uY0W3phke81gXa9c/Ue0Hc+
 Ohyn4ePUTWJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCaqeyyAAKCRCIoTSWt/mH
 4LxaD/9GAnISxEX8FSiQJD+GY2mxns0um/Xmh+WRxrcF5IQmcLnYRxoJOl203Us9VmZrNoArDyl
 ouU9p6JUqRANxhxBhTqWdDM+5pPAsRTDnwIHxt8dODbu79bZ8WIcF0oA4A74I96C3EMtGlsuol6
 dQY4U1X8J1q7Fdfb7hlWt85DutxJRAI8XmDjgqD/RdVdxwPM5r5lxc4DgZKbKsrrdQbPwUDZdt1
 yDgBi9oGUMLksjKM7DSkfIdF8zLFXu7mBzKWswXe2vH7jYIKBnKB8+BfsgoutUtVDKDKu2Wz+ti
 KFKYBOnxQryIBxXVjQAXzHz27he2GvEb3/wJtth23hr+SQ0NiaGmGx6Ovm7GtyMBLwkrVkiriRk
 SBYhOYjIr5wgdov09IrWk2i7+4mL+a9M8tLjvJwQRl+dy9lUudh4wuEODhqodBmaOzbFk+D/uAn
 JA+4O2DeLIT0SjJwHY6yOchxdb8wvwZZixncG2MlRoHsrdvZkAx2N0blBxep9idmT43c88eG5lf
 U3kMzXuquh+izg7L2y1rNjeWPcptnNAcmZMQw1t8HbIpAAejiLJWhNXs1ZWPjxrZRx0aAnzP0DS
 UkIxtJX27Ln/FBfh9Jw18wAC2986EWSeb3/BAW24i22iY92WxDklgkQoo9vKlbF637jSqkASgjL
 6xZ9eCBGWslhn1w==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_013939_728822_633606D0 
X-CRM114-Status: GOOD (  11.97  )
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

An earlier SBI trap may have already used the same M-mode exception
stack slot to save its trap context before an RNMI is taken.
sbi_trap_rnmi_handler() never initializes prev_context before
sbi_trap_error() walks it to print trap diagnostics, so it can read
whatever stale value happens to be left in that slot.

Link prev_context on entry and restore it on exit, the same way
sbi_trap_handler() does. This also lets an exception taken while
already inside RNMI handling chain back to the RNMI's own trap
context instead of dropping it, so sbi_trap_error() prints every
nested context correctly, including the RNMI's.

Fixes: 00fec20b4976 ("firmware: Add RNMI handler infrastructure")
Suggested-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nia Su <nia.su@sifive.com>
Reviewed-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 lib/sbi/sbi_trap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
index 16774fd2f73059c1268bfb9f43fdf8e9c460c0b6..e694188c25b7b1715df660206af0a501290389fc 100644
--- a/lib/sbi/sbi_trap.c
+++ b/lib/sbi/sbi_trap.c
@@ -394,9 +394,14 @@ trap_done:
 struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
 {
 	int rc;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
 	const struct sbi_platform_operations *ops = sbi_platform_ops(plat);
 
+	/* Update trap context pointer so nested traps chain correctly */
+	tcntx->prev_context = sbi_trap_get_context(scratch);
+	sbi_trap_set_context(scratch, tcntx);
+
 	/* Call platform-specific NMI handler if registered */
 	if (ops && ops->rnmi_handler) {
 		rc = ops->rnmi_handler(tcntx);
@@ -404,14 +409,15 @@ struct sbi_trap_context *sbi_trap_rnmi_handler(struct sbi_trap_context *tcntx)
 			/* Platform handler failed to handle NMI */
 			sbi_trap_error("platform NMI handler failed", rc, tcntx);
 		}
-		return tcntx;
+		goto done;
 	}
 
 	/* No platform handler - treat as unhandled NMI */
 	sbi_trap_error("unhandled NMI (no platform rnmi_handler)",
 		       SBI_ENOTSUPP, tcntx);
 
-	/* Never returns */
+done:
+	sbi_trap_set_context(scratch, tcntx->prev_context);
 	return tcntx;
 }
 

-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
