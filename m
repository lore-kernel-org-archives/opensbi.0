Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC61606A321
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OA5te6Ju;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=YarTwNCV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CAnQXNGh5kNCXgA5/1G4eiwSgRpxyHCocWejAZUvdpA=; b=OA5te6JumBZn9yqAF1Cv3xh5co
	bH+8U3X7w1VbBx7QgZG2fx1HYpdc855sPp1LveWzQd9ZlMonbiwnzfd0TJEMstmH/6azCtJfoc8BN
	NJQoxKn4c/F3DORuOMyvilxM0EujpTrk3BpeH4gTLpvdi109g5cFd1n1szhaf5BQikTVfo80OVMNJ
	MLqKLVCkIobXiqZKT9IvStkXKuD9TyRtwMVu+aEf2W7B44FR5LFwp13/nAXVXnbiz7S9emG+tAmK6
	p672KtZivIJfAw/KRqgOBu5PiooFKHiuPdl+pJwBZuwKdK2mqWavtpLIxyh3yKBOhbVKl2GYB3EPg
	vEJS8BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxi-00000005Vdd-45aI;
	Tue, 24 Nov 2026 04:16:58 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxg-00000005Vbs-48EP
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:58 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so807183a91.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493816; x=1796098616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTDVZ09Euqu4XkeKdO94nm3CwCftAD4ZoaHLVchP3U8=;
        b=YarTwNCVaskEHw639IwULqKTTPB9XeyA44Xe3zOLnrlhSNCV61VB2/Ig8zTa9IdHrr
         s4evyp6d2GTHGHxd96N1H6BoUBfxB62EfK+/MwhXO0gltScqOSS8W5x894qnlYEdY8gJ
         Hx9b08boA2FQuXO+3jLnfLY18DPT4offYqsMQBufjZXIoWcAxFfRchduQclNcZwjSuvd
         iK2nIOBcgkP5yUkkbimc2TloAuitppqUvc3xnortFYnWG4wpC0NMGcXxJFKR4hgKY/nT
         1yXAGUEe3rrqtFOIkD3xO/THVMs7SCO/jpoYkXWdVxc38nryDVjtYPwz7qZMvVR9rksd
         /eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493816; x=1796098616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTDVZ09Euqu4XkeKdO94nm3CwCftAD4ZoaHLVchP3U8=;
        b=crHUHGhtIbe0MTfqfLZv2/GM7Zg6uReeL77jwyF8ryfMeEHiGDsnFYbFE7n0LgC0rA
         nXYdRDV411qW2bHW84YygFoVWt7J0U4BXzeX1AIu+XcEaKo17fd/tohrf6l5Tx3lR5dw
         EkS74ZVp0z5RxQKt4GtBpv2K/8Hq5iDoOLaSqWwjd4MTHt2VSgv0H8sItm4SK1AqwqXI
         bDI62d61erFuay4j51d8Q+2tku2PMDF1viQloXLC823s70GfCbm9Zccz9L06dqAXnaK6
         DvLYY8i7tjOydbEFT5K2YcHC7XEGYzsFB2wX1JzKtaboqCgA6S5Y3O6MxkAIkMV31xx+
         jFLw==
X-Gm-Message-State: APuU4Z+NLSbJH5wCic26qKf1Nwc1JWceyTPhWQ//0D6SK9nfyHJWbu2m
	V49qx2sogJ3dWmm6ViCry2vHLZL7gkBokmqusL+N30rbWU/9+pQIUJqAH0apjvdovlEUROlFHTX
	4CoquKhN76H/VHYPEiehZM2AafzGaXAGDJxuJ0v3yKJjLynyz8AXhxwZkMYAxogkJhr79IH0IRM
	VvreqABaY1rdEC/kjVelWJs176Wz5Vu+aeFjQy2stkrptvbOUJ
X-Gm-Gg: AZFdTZe2cRe1byZSpBbbxs3+2QhMh0h8SYEkkuEbUE93U1+sqAVv9Zes7BMP/8DpoND
	7AvNE6ZtfBLiGsuSH5snB6EPmKMuMUrPIHoChUkgmb8SWrk4Q4KzMtPNzaAQbHOAVDYfOe4tNlD
	Wj2FTIGAmgozev0W3vwt/2dh57UYS/EB8PgItm0AaYfwwZSK5tiI/e001imjsdkKkA7DMw04IpN
	wHXuyfXyLIH0sERoQWBu2AAf9cSLtfuP5qOf5znIPUAmuDRfV3MKwtvirX6nqzeXR5WQ4zOYE1t
	EoTxNiurew3rJeALRgcl8slC2+LD+8qat85RpLoxlzq4en5iCVrE1dHKL4C4c3IkmMcGIsO54ji
	gl+jvg4EhtOLePY/fLoIxWWQG/LVB75xAyxyOzoZQJGx3Vgwfn9WVA3eUpXZBLtyZcFBHNIGao/
	Ww8gQJWHp4ukrvolYqLMcCjeYJ7rdqB4rrt9B1CekQRRQ2u3dBL90Qu5LzmfI8AD3qOmegIDT7a
	OqUz7aaW9paeHPo1uhVDIVoZIMSV7thMrhM96tbFMGsHxFL+9v6UDNNVrQmt52U6gVvy7PkLPry
	oryakjZM644fsyoYfpxO60Mi29U=
X-Received: by 2002:a17:90b:2701:b0:3b4:184c:c20e with SMTP id 98e67ed59e1d1-3b41c7b6809mr11443428a91.4.1795493815888;
        Mon, 23 Nov 2026 20:16:55 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm8036175a91.0.2026.11.23.20.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:55 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v6 7/9] include: sbi_types: add PRIx64 format macro
Date: Tue, 24 Nov 2026 12:16:29 +0800
Message-Id: <20261124041631.1049169-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201657_093169_6CDA0EB2 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add PRIx64 for portable 64-bit hex printing. Expands
to 016lx on RV64 and 016llx on RV32, enabling consistent
printf-style formatting of uint64_t values.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index b8a7e6cb..780a4c2a 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -34,12 +34,14 @@ typedef unsigned long		u64;
 typedef long			int64_t;
 typedef unsigned long		uint64_t;
 #define PRILX			"016lx"
+#define PRIx64			"016lx"
 #elif __riscv_xlen == 32
 typedef long long		s64;
 typedef unsigned long long	u64;
 typedef long long		int64_t;
 typedef unsigned long long	uint64_t;
 #define PRILX			"08lx"
+#define PRIx64			"016llx"
 #else
 #error "Unexpected __riscv_xlen"
 #endif
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
