Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFABAC83F18
	for <opensbi@archiver.kernel.org>; Wed,  9 Jul 2025 23:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7RlYl13JUauhzEsUz+uzhibppusTqeR2BuE+E5e6hU=; b=jJxbeecQ+wEnbK
	PVZrzV2JWRH9F/eShcs6BJW+AmHxTjVhlDtzAzYtv3JiwgBFnGlqQEkPR0B/RlXSuLIaMlYnu5KYY
	VU5EVeVBCK883FXrCg9a4z9Ozyt8QFNeJrXD7VlJkpxydLL5yvwgdPIvbfaTMn9bcIr7CQpl1+lRM
	k3wKzoc8dHeep6mCPxrbEKpwOc3NX0wyWKUflXd/2ZOzgB7ZHFuS/gcnTjSiEmQ138jMItEUjItHI
	hDj05+UBrVe+FEQPBM/FYaoazZe0nwgZuS2Z3nU8SUM6tsGHlmteI4SvuRYkaFAXHdVLUc6yvKOLs
	V9+fKVnhzbQuym2oXcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeEW-0000000AFlk-3qso;
	Wed, 09 Jul 2025 23:29:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeEU-0000000AFk6-0lW8
	for opensbi@lists.infradead.org;
	Wed, 09 Jul 2025 23:29:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso11015595e9.0
        for <opensbi@lists.infradead.org>; Wed, 09 Jul 2025 16:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1752103785; x=1752708585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vaRtyt7K1JqsdYYYwXkhDXf+hV1GnoArFzf++7LSIQ=;
        b=KQb22EynvoMzVthvmei5amplYFFRCiMbUKE76lA5u9ddov0pB9lO0+qDSxajAmor7s
         9CyWC11VLD4+80wjRAkf1Ej/nB2ruUzwv2oA4I2dMoKQTnzOmFFuVco7JvLTAP4K/uXb
         eup/9HyTOEvZCQTvAxAzeapbB8JV/NsS0OYGlNmH4tGvpeyU41movHI9CWjaYktgf57a
         qcN/VRehU2/PYSx2DEMxUeaDKRJ95xen24rlnmhHUx+uX25t1Xyqr5stcytJQtaY9bfe
         EK74PLorqHNSZmriNWIdmKNka8T6QgWQXcrPjdAiz/fLWuWd3giIAXHamqei0b1N9hnh
         tcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752103785; x=1752708585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vaRtyt7K1JqsdYYYwXkhDXf+hV1GnoArFzf++7LSIQ=;
        b=Oa1US0Hb/FpvD8uaTrWmR+uprttz/Xt+UH3wEGGwJzlaNg5uZ5MvBH9NkSwdopkUvI
         jf+lrVW7Pfiq7ozZeqXMmFbJtA5pUoPecr7t/PybkCz+97UluTVJSlzkkZvvdv7lS8gU
         uzR1mcVOpSJQ5UZ+JeTtttY2b9P31eACEybMCHmasX6xVvPgj+EtjhcD2toQQw3NI8Ne
         XX5kZNxs8C30Ztrjf05VQyP/2Mq/AX+ZLQuLlXLt4ishJsQ+Y3FwrjewyyPe7afaehCa
         I5aBehxtWLKPCPxBNQEHQBV4X9bvzNAnA3P2qherORF6KZ3mhpgYHaoIchzs4vqN5BIH
         wmXw==
X-Gm-Message-State: AOJu0YzFFDcWxA4iLvEwD9mohv9ZpUZS4LycIGopIDdLVwnRbK872ucv
	lr7GUKwZnKIrYlmWtMuD2clkd1LQdlfuVMSLoOdjdhkM9gC0fPWNs1r3YV72m2TrwjybquVAKg0
	3MMu3
X-Gm-Gg: ASbGnct1lxluwXB+SvVwwvSBye7pO9De58u/zEiTe1QfURRNaWW6nbH0WawrfVki8J+
	j9x0rxsJPNbBPBmDbAMpqVz8DZ6YRfkHqZMC1lHS2VMulP9WYIron+xeiMCPcsFGf4FBEjDu66M
	02okLDoWXuwN3QSfiXglRJ212OGkPf0AS39/ithdDbtdVmOPe0ud7QFtY2H+IVYhRpDeKYLRo8J
	ZrOoDW7Lpd9hpv8/jr2lyXQ6TdupcwIAyFcmfbOLjQG3dl0z9kiPFZJ+Qr6POzIYqbb9yz5kCfy
	blVM9MNbjXoRaIray/qLDgseQfos6UPuv5HOXFto5pQ5HHmRIp8ktsC1sxNgUarzJzxYeRXAmvC
	z8sCm/tAlejmdUnKa6CZkSNlbjywz9IC0RVPGV9QnkW3urTIlTw3I5PfsRQ==
X-Google-Smtp-Source: AGHT+IF80OXMs7EQGo64nMkquAq5PASt8FHxoLd2NJUXPLHcPUN+NpitjIU8vX+miCgQUk6d90fTFA==
X-Received: by 2002:a5d:5d13:0:b0:3a5:3993:3427 with SMTP id ffacd0b85a97d-3b5e7f29693mr1059680f8f.26.1752103784660;
        Wed, 09 Jul 2025 16:29:44 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.localdomain ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e2747fsm216443f8f.100.2025.07.09.16.29.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Jul 2025 16:29:43 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id D914FE7BE924; Thu, 10 Jul 2025 00:29:41 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: opensbi@lists.infradead.org
Cc: Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH 3/3] include: sbi: Remove unused (LOG_)REGBYTES
Date: Thu, 10 Jul 2025 00:29:30 +0100
Message-ID: <20250709232932.37622-3-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250709232932.37622-1-jrtc27@jrtc27.com>
References: <20250709232932.37622-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_162946_216773_69166420 
X-CRM114-Status: UNSURE (   7.24  )
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

These are no longer used, so remove them.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 include/sbi/riscv_encoding.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index f4df1ae..40a854e 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -1317,13 +1317,6 @@
 
 #define INSN_LEN(insn)			(INSN_IS_16BIT(insn) ? 2 : 4)
 
-#if __riscv_xlen == 64
-#define LOG_REGBYTES			3
-#else
-#define LOG_REGBYTES			2
-#endif
-#define REGBYTES			(1 << LOG_REGBYTES)
-
 #define SH_VSEW			3
 #define SH_VIEW			12
 #define SH_VD				7
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
