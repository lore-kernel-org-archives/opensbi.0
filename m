Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A9BCA1009
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYM90wPAAENIoDEjbvoxjlaXgMpsdW8mbBiVeuExZTo=; b=Vyqr482WwNYlZc
	WCkHjddqqWemOgvnvvFMMFLegY5JZpTH4XgcnMlvNAhlRSsKMUvJ/KXvDTGloTtCpRSl99Xjd0og5
	GgjG5EN95qJGXv1jYa7FRDI9lcymPOdjgdzKOc0uvKclOjiiw0UmCz74fXqu82/cQlgUd4HT2Tyf6
	3WAiWKu1QRd2sH2ntbu1SoZknrV9JIX5IqTWgcdVXzjsTUa/VMiVA7vYE67GM6+ShjvH31dTxUUtb
	30B/FUdAZg54wzMjBIqNzQJYv9Z7HQO//uyul0LoLWp6nWCUyTFCJvzypu/q1UIUO/IT0KO4anPWY
	PYXmB4LTwLNma5FA+BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbu-0000000EpcV-2aEF;
	Tue, 02 Sep 2025 02:19:02 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbs-0000000Epb2-1bmB
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:19:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24b1596b1beso1350555ad.2
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779539; x=1757384339; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h20B4XMLgWl9n/BYQROVnjjzIn3WnRzdJgKhCKkask=;
        b=leydWg+yGmWlHuletuh0kYcWOFCQtm82bQwFRVbXltQZZ9UURVs6srAwmcwX8SXNtK
         /r9rwBPPU9N/ESbH5VD39aI2suvgVyeqRngp4/khwrnlpXjJGf00FGyTXdZDePaojr2e
         +hqTz8pTwzmyTZM3ORTPGm3Uwq5xqtDcXsdS1QNXPmcm/VzyFJLqSvW5AaA0ZENACPRX
         brQqGOIhVWvArh5X6VcjOEZ0W+LLertDUCFVUqYvZKGdDDIzkFtqY0Gbio9Dv9udCKfE
         e//o8KVsbXeaQPZvyg6US5ewINdxyexu6yQWSxkTqWV5BHmRxRqg9HbGhJBv0aW5/llM
         GcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779539; x=1757384339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h20B4XMLgWl9n/BYQROVnjjzIn3WnRzdJgKhCKkask=;
        b=krJHB3qcje48GZRyK/Jeb50I8ovyNzzDQk/KN1uBzhZC4JHB8kAW7Rdw0jsI2gZmHx
         39Z7+7QROiaOpNVzx137tvPWd6dg+f4abTGoUHaEy8ZTb6B2LBk+4Ya6qgsZ13/QOaPP
         /shErRTV9g/trfalETN7SHC+NkKAPM1gTsfL5Y1ppOMXgMzhEHevIo+P76LHiT17Y6qt
         Iw9vaeEWTu805JlxQSQoJBVBuND/kzF+z1W9ssEn+YyY8UY8FW0ORbTwk9upwI6hZnya
         9hs+p0yY6visuSzkMiUeGnSRk2TG/TgFnYuKh9kt5SfbNtSuAkHnLA8qET4qXA5meHTr
         U56Q==
X-Gm-Message-State: AOJu0YxjOESGPcoQ/6KhyGv3sO6KOWHdniPzIE5dKV/ATdOlN3iFAe+m
	2bSxaRKP1LU8EFmsua5H1MGJGhaTDuNNLZbUV88jbjXlcq/1mnlPtJvlfwitJmHkzEnT09PmgkZ
	zF7pVY+q46XvURryJO4VQMDg4beKlimt8OOQN2CxJHaJNuB5t0bImxeekw5Oih9yjtfDRPXCAkK
	tZybaSqYBuE7pvfHB4RoBqny8ZizovKejKGKB8niMLE1iE+w==
X-Gm-Gg: ASbGnct8//zNuJuetgAWj/DS97LzApaaDUXX7ek6C/5cqWx1SdaqhUJB0JqpZcayA2s
	i++JVaVZxpKdxf1b5kB49VXXgBKeZlIaZt3cPNGn2qmDGk2i2IBsxHck9yXLJKGXRxA3EDBK9z3
	bAe3XBSV6Tmju1ZaWeKC19sZUuvDxhUqIbu7wOQ+CSZ+/+Pz8Xl/p3rxFptcyKZ2zeTJp3BoajB
	c0dpanit5rwvdl4IhZzlW8qpttzrYoK4/JnionN22pPRTAHGZkvU/eEJ7xbBvmXzIQsPaKy25Ex
	xcGmApRVh7m9S3QKDvtBDQVl9omt6PnJkhXeIui8OtB/Dejwwwta46wp+SKUrLWFb+ngwlkhLm2
	otkemgwhJPixEYdIiZmD1ImJINcB+H10=
X-Google-Smtp-Source: AGHT+IFJtOsC89WanCkbaOHDKDDXQkLkx0NutG85mLqhWN8HTmIvB603wA7gRk8eZBS0fuo57vuORg==
X-Received: by 2002:a17:903:46c3:b0:246:cf6a:f009 with SMTP id d9443c01a7336-24944b46499mr139590635ad.46.1756779539294;
        Mon, 01 Sep 2025 19:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:18:58 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:45 +0800
Subject: [PATCH v5 06/11] lib: sbi: Add SiFive proprietary xsfcease
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-6-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191900_429442_6E0FA744 
X-CRM114-Status: UNSURE (   8.67  )
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

Using ISA string "xsfcease" to detect the support of the custom
instruction "CEASE".

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index fdcf400aa8c494cd941c412294bd0c118c5ec2af..ff682fb4579291cd9e5fb36ca5ab392aa376d37f 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -83,6 +83,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSSTATEEN,
 	/** Hart has Xsfcflushdlone extension */
 	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
+	/** Hart has Xsfcease extension */
+	SBI_HART_EXT_XSIFIVE_CEASE,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4160ad6c3d8b31ff9f3d5ab5dbf55356140232a8..2519f3f003ce035289f6d5dd54ccec20b36c7667 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -716,6 +716,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
+	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
