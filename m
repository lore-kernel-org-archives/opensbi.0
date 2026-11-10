Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45251606BF3F
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmc3uZTr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Mherfmax
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zhSmOH1RqaLfqAoh7hu7rZ/4iJDx4IlXgDAz/Cna3Ko=; b=zmc3uZTrHJF12rih/jU+qhtjeQ
	KgGMvmAVDBP2aotcX9MEfuXv4gjh/+6AHGdmJIVXdaodWX7b7bW6kjhu1Ze/Wr9C5HvHUafXiBcaR
	iyz9bEa2XH0Jlki0cEcidvC2Xp3nOJje5c90L6P1BFkRkvJroFgKoOCWVyn2LSQ0457fTofYiP0FH
	51p7oEiJIPajFmhoC13If54gau2jffwMMi//rh2FQVQlQy/0GAVggiP9RHDAS+mOqcUesClKtmbRB
	Dib7TNjeUSd45abd7HcU84XyNDXOQbehuzRMXDsWJiTOLiHgU/iBWLqP0WBZdWRZw3wfREKmYaCN3
	hGzA0pdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVI-00000003Lcl-2YKU;
	Tue, 10 Nov 2026 09:51:00 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiVC-00000003LWv-1NVg
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1096634b3a.3
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304253; x=1794909053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGIaj8JXmy6e82nAb9Q2XcMYdUF/w9zO87LshGHDc4k=;
        b=MherfmaxzmckYJOiMUM3d1At8ZB8c4vBy1kLK8hPpFupBN6iiIxG0GAkk1jJbkvOmL
         9qhgzbA52YMPXZKrYleJHjvWPjcfYioVE4CLNwS56cBlDcXjB22JSKTvrUJPh2we9D+w
         59AgmHAneWMafetS/z1XEIxIf21YWQET1aurx9nF3RBgr3UFt9j0G4PSQn34Xxg/0UTy
         CsT8FSrdzaJYHEtSsHxi5X69PJjQuPvhiDpL29M+RjxM3a36c7VJzcrO1a4VUnaCzlhk
         oT9xgtdIJgFPlQ9To7FZfuro0+adkLmk6lZkuDrSDvBT3/9CQEl5/WSWOMFVmeRbxT+p
         zCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304253; x=1794909053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGIaj8JXmy6e82nAb9Q2XcMYdUF/w9zO87LshGHDc4k=;
        b=Inwx0LqLd2kPNhbJJSAm1rHsOn575cwDSlX3ZaS+Z5wDOJrKnvZLXlcn1TxdopVb0i
         wNMC1Omw2WYpM2RbPTfGV/uZuWhK8skEHuxc4eFQmlnrgfO629VHEFo8UfrS3ggIMxg9
         1cDVOGhakSI+z+JRS3JjAseyYf+DlqJFxVjtm8zkmZ7n2TYz4rsXHKnyFgeDIs1m2uV7
         bt8HxrpSyEVqUZO9k386CJ1Il0qLxT2W6fyYQDzO0jqc4LodPRKv0vLWPE0/hcIkbIj/
         EMhFMeSJj20xz0B9ncA57t5yUp9GRQi7Hikt6frdUWUcRIC6XqBcwCwiEFvwOdtTxXxL
         GkuQ==
X-Gm-Message-State: APuU4Z+tjbP+Xlc4w1q4Kf9/EwvCPu/8ZxoApcfbcU7ZUWSuuDY8R5hg
	soQhaPC+SfK2Zsv+ihGJKS39EyeIhS3Ix3tUXPGKAUXRDVhA1Wphhd4EUvbXa8ZXkYukCnz2j/E
	EtVsNSEb0yLl9VyPJMY3Nnj5IhLvO7M/AL2pBb7sgNG170ZDnVEQWJSalrtyJYzucxrX+mt5jFI
	kMSIeG8MBzWXsXq9RZy+v9CGOc3CZVsXd6XAGVHUKQLKnJQdIJYUA=
X-Gm-Gg: AYBFou0XPlardoDgRoRJo8XgzMmaQw1dTGdZelcPq2nGv8K40MJULCU5sJ08ksQCZlh
	7YNKKgXx+SuOyVf0a+OT3peT60IOWyiYrYiYZUAr6TMwqY4RyZ9HhMGA/AFiXDeI6gFJOCFGMPL
	tzFvtiDQnbxkRpbg6rS9ynFodVPqMJc9i4TgMfnz6lGJ28GMxON3pVutA/o1DvBtxKYbv6A3bpm
	a6UgYVkjRoTtBxbtMlx3cz4ejC2QzFsU072EmR5gOcUDOi1odJAIw3KAK6bpaqukwbMWKyacOEp
	R/ckQ5A/Fq1KB5kk8Sdjjgf7ayAxtOvknSWBhJFmpmPMvvMLZXHX2T0J96WgYOhUBIadt1FkCZu
	Gnpo6uazQcWyzxiEOSkjImIufwT9sxzjsYBuNxz0r4C6b7ZJz2UtbPpAulvn37U8vvadlgTjaWg
	Y2oDad6Q1BH4cVzHMEn7eRP2HnCWwnT5Q+7WpOSLaYJ3+G32n/2NBFiHVHqdU+tVr2frptHQJ1L
	Tl3btcOhHmY0tLrNXerbDHCPQfK00kOLamKU+WqRHsVpnP824qwUiAAtiJfb/Kim1Ugad3aYMRZ
	ZvthMLU6Jsr9eWUV+PZ6se4OrIc=
X-Received: by 2002:a05:6a00:951c:b0:8b5:f313:9f40 with SMTP id d2e1a72fcca58-8ba87e0a5cfmr2308302b3a.49.1794304253220;
        Tue, 10 Nov 2026 01:50:53 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8ded4dsm683319b3a.54.2026.11.10.01.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:52 -0800 (PST)
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
Subject: [PATCH v5 7/9] include: sbi_types: add PRIx64 format macro
Date: Tue, 10 Nov 2026 17:50:27 +0800
Message-Id: <20261110095029.117504-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015054_380566_BE930575 
X-CRM114-Status: UNSURE (   8.20  )
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
Changes v4->v5:
- No change
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
