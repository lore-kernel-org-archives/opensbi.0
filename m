Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34C6106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMCJuYGFBvr0cPdRzln2qDKSy6y5etNuzAnZXOG2P34=; b=RvNKoEo6tx4zkt
	MOoaj/N2DmXUyF119eKZXX6Xwz1DZ2BNPaI9/BSF3ZccFtiLolalWY94FZ2XnfwjbiDPnytUQhECA
	oeGfUJp49pdr0KM+cquh/cElgw6Wn2qQv0JO9+CEFEoSH0uVkUx0D0+A/qUZMmpR6i1nAWpuokQz4
	UICX44e5shDx/khsdnQ8Ec5xHCwzPoDFxT+lJydpgDsV1mex0DecPmaFb9M+Cx2a5IKMOYZvSq3BX
	Y07izWAYH7TpV9vniUX2faXl7eBfmrh14due33m+81sDP3C+mSDXe7kHkNeiKLOUMBxMHwIq/x/w3
	bAbM6RgH62c7Jndb0kGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxG-0000000GcPX-0M3f;
	Fri, 13 Mar 2026 05:20:58 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxA-0000000GcLA-3qJR
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35a18b65515so1000040a91.1
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379251; x=1773984051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBkyZzVzrooCW6ugz3aOY4UfFStX3bioM8qBQnjJ3Kw=;
        b=cdinesnQBKJtgPIzhUg61SmpSOd1gnErMGkQnAaQqc9CRKrcl/EI28tBUvoV28OqSx
         VGYNGEZFJ9Zhp81or3A9ivWUX5RzfBN5XzUltCp9cQK7Ig33UcVqikKhNAmk+tinnpvP
         LBEkneorH2DsOe5R8bLwKmtNM8E8MWhwV7gPnmKsQ86Gl848yZaHDLzFjHcGhLZvvt3r
         7qXwfHdBNIqX1QAL/rMJ5X1GZCZ/S7+tPw9kqe3Bkq2z1Trrq+ctvYI5QcGrUYV/5VvT
         8Lz9rJFy73Jj/hqK1Trq5kSxVgMr8rXLW0WLgmllArTG5ohX20W7YurvATNn6/hfX2FG
         4Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379251; x=1773984051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBkyZzVzrooCW6ugz3aOY4UfFStX3bioM8qBQnjJ3Kw=;
        b=iJtyVeT+KYkSEEY58aoeySbLtxB9Yv31u+umkXNmcE8uazWlW5ArNndODE1OoVVsPv
         yAG2T+6qNQnm7ZwIBRaBnqGkCBhwvatpjDyWcSK7734wM7jn1eNM3z5IwlrmwETBY5uJ
         j7PgNawjv3FJ7gxVJOh46fvHGGpE/1Dl2qpDt/6SxmkkQhIjsbtoBUsYTtsU9rXiM/i8
         roNaMcAF+026JDwfGh1xEtZAFn9/vTrdHvPrq6qoOQ6q4W4+LThBSq8xkzCj8QU6p8pG
         ZBpVrw5D7liQcCbKlOtPznsKdW7h8YZZJuu3adDdNQVvdVZDnVuUNWJ29oC0e88UfJr9
         m8Og==
X-Gm-Message-State: AOJu0YytCGVecSnLphAm6Dlf+6kK5FmfNDp4s2qTPLmPjexUpRxELCCT
	dW23TTvje1Hqc1w/RK+c7Oc9RMQoluwz8MfafDn9oz6b9RgUXdI2sTZmaS+LYw==
X-Gm-Gg: ATEYQzyUjYUTsEm2YOJFYsm9rtpfdIguRWa5wIDCgVfanNHxyNPB5wexaa8PL2D0x/A
	xJFW94zJ0+zwdThfz3UjRG06yT2gUUkCO+889BIJMzTqENMn4/m/JJPOd7kD6kL0E1TwOY+y3vp
	K2THz42wmfgxtwyv9Zsvr5P9pKRRz7YH/mc4EKRlQcPgBkRKixxgk+S6oUggn4Kk8pBGR2EW9oY
	cjnyaAJcXYf2MF6tFQyXmWTQhgbLGUBVmq8O4QvuPBtD3oGET8YeLuR5KAXqYgA6eUcR0aCojxN
	PI8TSGFs59ZZwLhwSAI1qBZkBBUtKpsYqGklCzIJCftBOai9S5IXYrGRbOue6/wuawckUuQPoF0
	k8+8zNzpl2sgaD5+TgWcXsvRa0pIC6PftExGkFePVf2yUthtEQMhE5ouVJcjiBju6ugcFhcH+9V
	iuFqKhxKzTjZUyOucoSxnh+WtgfcUKVCkGTt87moD4GdvBotyc8u4XiMKsPBQCT45c+KX9
X-Received: by 2002:a17:90b:3d8a:b0:35a:b8:597 with SMTP id 98e67ed59e1d1-35a21ea7c3fmr1967910a91.1.1773379251458;
        Thu, 12 Mar 2026 22:20:51 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 11/18] dbtr: Succeed operations with no triggers in mask
Date: Fri, 13 Mar 2026 15:19:40 +1000
Message-ID: <20260313051948.4017134-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222052_958093_F01A145D 
X-CRM114-Status: UNSURE (   7.28  )
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

Trigger operations that use bitmasks should succeed if there are no
triggers in the mask.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f72c76f2..5735bdc6 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -694,6 +694,9 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (!trig_idx_mask)
+		return SBI_SUCCESS;
+
 	if (trig_idx_base >= hs->total_trigs ||
 		find_last_bit(&trig_idx_mask, hs->total_trigs) +
 				trig_idx_base >= hs->total_trigs)
@@ -728,6 +731,9 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (!trig_idx_mask)
+		return SBI_SUCCESS;
+
 	if (trig_idx_base >= hs->total_trigs ||
 		find_last_bit(&trig_idx_mask, hs->total_trigs) +
 				trig_idx_base >= hs->total_trigs)
@@ -844,6 +850,9 @@ int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (!trig_idx_mask)
+		return SBI_SUCCESS;
+
 	if (trig_idx_base >= hs->total_trigs ||
 		find_last_bit(&trig_idx_mask, hs->total_trigs) +
 				trig_idx_base >= hs->total_trigs)
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
