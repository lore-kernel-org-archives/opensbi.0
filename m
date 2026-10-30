Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB1606A321
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iGBuuIDe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NHLmu+hN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=CmoDH3qJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CAnQXNGh5kNCXgA5/1G4eiwSgRpxyHCocWejAZUvdpA=; b=iGBuuIDe5vJaEitLSEH4SLBK0p
	JuedW+KO4BqHYu7P2c59YT4zLPcT4Ft9VZ8BHGX6gNBUvYUeHplp0AzITmlCH293QOO7i0Axy56LE
	i++elMCTsr+hmBmn/JfUlzjvIHo20s1PpSqvbgNBoQ6VPWAsJcoyAM4bLaWC8fsKYzx3MklAK7WRD
	SoDnSjzlT1TINTLki4mdNU96DKRffv4jZflabuVdZyW99bn2MZ4zVjvuVrI1/NQRNWisABkokw25T
	m7PHi0VKsUBCA3jf35acL8a+NnJ86lpvHvWScDGH17gY2MBIi/Ti9FcLDJTW0AW9qoVpojkltJKkA
	7rEtAVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7R-0000000BQuP-3BUm;
	Fri, 30 Oct 2026 10:45:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7Q-0000000BQrq-0rJ7
	for opensbi@bombadil.infradead.org;
	Fri, 30 Oct 2026 10:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cTDVZ09Euqu4XkeKdO94nm3CwCftAD4ZoaHLVchP3U8=; b=NHLmu+hNunMEH4NoppU5TKFiIf
	f4dY9JhQMe2GJGkfnqPhFYodgQ9eYk3yutohrvIlGWpKrMjT8QcybGZ5aT7S1eB1ZINza9oXTIRC4
	z7rmU3LAKUEgq/Dq5IxYUPZ7vr8z2SE3hMB+8AizlKcQRV5zhyVjUMQfb6x4OFZ0++TV+aeZiuw0W
	AzmunaXZtvhnJY9y4zmucYyIkvgxjkKCs7st1iPxnM5E49zDstFKu6E2Fwif9efuRhVPSiF/EKQeh
	5yDiViTPSRk3uyWeAyM9YmCO6TFHZNR0JO3NxRPM7DuoEI1HhV7hLSR98VU84Cr2/1fuJFvixFF9c
	bB9ayWTw==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7K-00000000EqX-2Prw
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so289960b3a.1
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357148; x=1793961948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTDVZ09Euqu4XkeKdO94nm3CwCftAD4ZoaHLVchP3U8=;
        b=CmoDH3qJZhWNC09HAKqh7mi3s2Yw+iu7ybnGrLDCAHpUrz5pVs2sChZllan0mD9tSf
         qDnzT6wWweOxNsVLk0rS5SJcQcEbrOSsVs8SRCVoum2L3cwGztskSytQ7EDmSQ/iIMaY
         Oah9qAzk8jval/OBfjcnDu/sPtmOQk4VPJbTTftDS8YWNdt6mqS1MYR7OhKzon5LvDRt
         xNVSDJCoXaxDsn3lmyPrKskrSRvmCAnCDxq30yrMe8H/1hqmO3AI4VaIR4KMObyjc/xW
         0LX7vOtYdW7ftJGbeLJBZ2NzkUgXXIIJoDDqWG1GAKYyLafI/GSAUCI/OcNzd7HZluq3
         vItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357148; x=1793961948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTDVZ09Euqu4XkeKdO94nm3CwCftAD4ZoaHLVchP3U8=;
        b=S5i7Zg3hZVoLhbaJygpq7ndjvy6zUtOj84INISSnoJrOJna9JuahUhk/CDw2TJVilm
         d6vH7iF0y+g6h3p/0Efzk9AlRqKDoUYk3KF9Er7WvC+wrV+iTs1cDyb79NwlRNZL5EwM
         Ph5EpH9Mkh4XJyWhc058mcwgGqVyEMbklAmEP3x76sGl11yIijfLNTarzG5x/MBhnVWQ
         l6anRW62pmkEno6WemSveQYOg8q8KvykJ7FSo0t6iYjmBZK1Z1rhgxNqFvXx7zTvcp7s
         M4X/8FNpMQd9k9/vBTyJjXwG5wb5ZXYoCPzU+pQqbKle0tZNU7iwxqYhpA4gLVqRv4Rz
         OKaQ==
X-Gm-Message-State: AFq9FYK6BD0G0tAvFU+BgqPia31lb1zMZJygMXv4Oqicv0amkgav08MJ
	+L/FVzBYDPnYfB5p/xcYVgO6mLaSu9GFOe6cDOPh9Jp4EqbV+FVJXsmAzUJ2mGi9Zq08KGVm4gv
	JbU3Q7m2V0oyfz1fm1wT0AYBquKsRwMMuxLePJSoWkxnjPY8sjiLYsOdOOuT3cwC15dD+LIQbzY
	Ry2wWVwme9oiHWX0bxvJCafxaC0H9xGNpjsE2OlqG+0OBXVG5lUN0=
X-Gm-Gg: AYBFou2AAiyJv7Wfg+QdfE8Eo9gCV4+U7FTXhh2amElIf3qOJrwkQvjuawA0loutPIa
	BWMebOEwOwahgR2wUsQdrzl71YV1y+JNBh6EWLy1iyfNUx69Sm2DMaE0/q//sMUNy7GKnBsXLIr
	2J81Oe7B1O/d7RpkzNqZ07gmoCh3tAdwiGSVdLd5k9Z2Zy+qQ7RIUZlF/WegFK3gBHGpJ39Dir8
	ao91/FbxBStmUlUetHMiF5aRagWjcu4IiJIaYGxwOx2QX13HRRgHQMfN/IltV3UL4AZMlwIDMx7
	H+XSLCM+X2aGleYeTucXS9Ec/o7fiKemfN7ab7X6OJfns9OcolPI7ddMwc8aH2wSBUKmOikVDfl
	hMPwNJwASi2WyAkpgaFI1ZwSbAu4XzHXwrRMgIKf4I1NZX00KVVoaVCf04mRoGogp7tWG79CNNf
	Yalo70flT+ABN4upWalFa8QXvOZ/doxvAOLeHlTcHF6+mfTNClACNDyX3XGpS+jzSI27iKZMQzC
	iO/fqwVVHc/9g3EMOE6nFWOcI2lqVA11IYapbd7SI51+5sGWffrWBkKuMIoVpOaIpBT8GFNfi8U
	hxmh4Eu9VaLOPdPzkLvEAhij1LzcGPVUz/1h64xVzhGaUpLT
X-Received: by 2002:a05:6a00:2906:b0:89e:b19a:3bb5 with SMTP id d2e1a72fcca58-8a8317ddb5cmr3525575b3a.15.1793357147527;
        Fri, 30 Oct 2026 03:45:47 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef96e53sm599116b3a.20.2026.10.30.03.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:46 -0700 (PDT)
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
Subject: [PATCH v4 7/9] include: sbi_types: add PRIx64 format macro
Date: Fri, 30 Oct 2026 18:45:16 +0800
Message-Id: <20261030104518.3297875-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104550_749749_0726F3BB 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
