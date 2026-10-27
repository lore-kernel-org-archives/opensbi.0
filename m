Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8CE606A320
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yHdXJrJF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ERvPNoFc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qTtkuYVZtY1OowWJms78MdeKzNkLC7mJQV1FWoZY5uQ=; b=yHdXJrJFR+I+Lb02fWIfhxZJr6
	zMgIreb5BZTkqxRSq0nitmMAq+w4CDjmp+AGs11OzH8Gs4b51jXmzCl5sLBIKUEXs6ArhI7jadoTA
	ck/PNfPTeEXYoKyWVO7UltObJ6iwm7dY+yQ1vXWLJbHlDBOoyodrNfXnne9CEYcFneLjX141Ml8Az
	FOAi539YxBBJrrJuGfdrUy7+2Otpf8+iUKh5QLOrFaRGRz3WkqIRCb42CFEHczI7M/xzm1V6WJq9n
	5yLsWhDoF2l04hoNnjmN7YR8M7mjz5RpGkDTKvTV/OsN3Yp1Mm3Y3oolI1vMvZQUyujfVYWlGLLZP
	KU8LLfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcf4-000000042Zi-1yWl;
	Tue, 27 Oct 2026 08:36:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcf1-000000042Xg-3aRC
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:36:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e608cd460eso24429765ad.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090159; x=1793694959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06FMNvMjykvWZA8HS6R6RYdQW3TSkMnxRS9ymb6rI18=;
        b=ERvPNoFcu+EZ+NTnLeauFj6bGZTxxKGgu8VppKoo5GzGYmCsg0KyfxPM9EYfQ1UpIW
         Xysu5M0tyNyeQBei8UwBYYd5i6RMUmY7VokS85GkUPf63FjJVjqGgBahgOI6rtLWxBmX
         TnDO07I+8F1T3Xq1s/5HiNvt4d69ZxcY0zu1EpiZdMKaLWAZbZ8osoDXurAUzaxjt5H+
         mvlfJFlbj2G6UI3E4TBfy5nd5szcL8vlVtHMm6jIHDhH7gL+EtzIO8kh5b0FAIl4lWR2
         BSewinGwnITYH+wcgAj5K5Q8OyahN78DC6bawwvQYkT9njMsNOaO2PWFLLRMErHIRdz/
         hXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090159; x=1793694959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=06FMNvMjykvWZA8HS6R6RYdQW3TSkMnxRS9ymb6rI18=;
        b=QQN5bvfEuvjxtZzUxB2PGAGECt+nrH+O4H5c0G3KBkfXudJduVb8gLpvM2o4Lu4t8t
         YM4D75YRYfqqzf9s/pPDGAs1Kztyd5zD6WkDLPhHfz1RQv1Hoht1i8ReVFiQae4JtjTS
         IrkGtgkZ6cJLnUL4FY2iVhsUgKX2cEdtqZS2adPTld9CG5UL3GhkCii7SUXy1ybAbRcX
         9u7Qf3icHCVmRX0P3S5LteVVnEUg1L2jZ0vowZF209FqzVss484z7AgAcvQFG5fyGnxG
         Uccd0occHLvhIrdBEFjFVSGP5ZNIeuDGtZc8Yf6H6UaP2Xt03lcrspwucljEGlhc41CX
         TXQQ==
X-Gm-Message-State: AFq9FYLT4ukpCFHP0yBQluyznaQRl1w8maX8Xci5KMFhGFT/t4pGnxmE
	4bg7lBN9UCI3wbmqqupClDgkjcFoQYgrEi8CI//W/Vf8LHOy7qfprerbXJdbn0n1fGRjnafcpO7
	8yHU+jJgtFs/TW5xUSAlll0h14BnKULSpEw0IT2ZARVrxDsp/DUrkzPuffQ4X9c+fMVy59QZadZ
	LSN/9a2fSl3AAGkIwxNdsGZf+NMz12KCTqtHU+eWlAMqoyNu+i9QY=
X-Gm-Gg: AYBFou3HD/TqdupojKiQ0KUdsWAclxieVXTeZ6WnmuHPIafJ37FOgy0cbk5pcjfi9vT
	GRBdqY4eEWttTmDx7pOSr1lVmUB0dJLM2KJLWM4ViNFTI4+YjXnew9ucxLI7K3wIv7C5W/7QnaA
	10Z+BjRc+RVI85FB1jSCLFw0wNqANSB/9HTp8C/fxT0BYWhdj2oAAUpryzzmw2l4fjG8pWXRuch
	09A80z/b9G6EZhyTTV/KRfrAwOpy8cFmYkZ0uC93jHHOiWFu5D7kxSJmoUohdR/vUCOFvwXwh19
	+Gb1pTPNFlpI1yUdxiRzmb2Nj8KWSq8Rci1/eJIjySYOnf9uZTSCuVLcrg0HWRXulWqJJYc+tjB
	sx+UhhQ/UjTY0gpF7zEKtPW6FVWlL3pqlhgZi/5wW25MsgcVIr7w71qwGf0kvG8rNNuiM507J1k
	ES74XyGLLmQwJwVUsWRS3pxLDQXxEkAb+eBFwEhgGRqLavdJITxJq7CrIVA0I5W72r6s9gV208h
	D1HqEgOB9gRJPXJmYeCEP0oiGNgqdwUmBgL1h6ZQANM/WPNtR4KnhI=
X-Received: by 2002:a17:902:f54d:b0:2e9:7b4f:b98f with SMTP id d9443c01a7336-2ea9c0e4848mr80016555ad.6.1793090158774;
        Tue, 27 Oct 2026 01:35:58 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6cf3d6bsm5639495ad.76.2026.10.27.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:57 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3 5/9] lib: sbi_domain_context: propagate error from sbi_hart_protection_reconfigure
Date: Tue, 27 Oct 2026 16:35:05 +0800
Message-Id: <20261027083509.1076577-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013559_902703_1EC84E0E 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Propagate the return value of sbi_hart_protection_reconfigure in
switch_to_next_domain_context to ensure that domain transition
failures are correctly handled by the caller.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
Change v2->v3:
- New patch: propagate return value of sbi_hart_protection_reconfigure()
  in switch_to_next_domain_context().
---
 lib/sbi/sbi_domain_context.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 987ac7fa..1751d016 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -110,6 +110,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	MUST_NOT_HOLD(&ctx->dom->assigned_harts_lock)
 	MUST_NOT_HOLD(&dom_ctx->dom->assigned_harts_lock)
 {
+	int rc;
 	u32 hartindex = current_hartindex();
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
@@ -173,7 +174,9 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	 * is also required for some of the above CSR updates (such
 	 * as satp CSR).
 	 */
-	sbi_hart_protection_reconfigure(scratch, current_dom, target_dom);
+	rc = sbi_hart_protection_reconfigure(scratch, current_dom, target_dom);
+	if (rc)
+		return rc;
 
 	/* Mark current context structure initialized because context saved */
 	ctx->initialized = true;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
