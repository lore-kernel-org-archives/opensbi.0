Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349D7CA100D
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 02:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xv0gR3Q+sqY0RS1+hbbbkzObaH0NrchCxXRUDH2qgE8=; b=tKqnFQWrGXJsYL
	DKEhpbtF3I2qMo37H5dU4G++GmpwnHvium68gycO52xE6SrxE+2VNmdVzVxOjn+a4UI0J9N+o3J4Z
	uW9sJWGqhaixWHyUDg7EVoHO/aylixdbw84doRFQEWZi2Xlr8JWKp6W2rxey3SjNR3nMyhZ1twRbk
	iGaZR3HKpLMe8qWG4vy6bBlKkMKc9hFB2BM4FZFAwnFxmasBynQC9HX0xv+Xgtqei8fptOJRLLRa8
	h8+LSLxm7/T9Q4b9BpfjoDgu2u8oA3I1lHmhtltGGHReMdFJ9KYvsCJM4KvwBvxzOgFGu5hd8kldb
	yeFHP9fsvp8IzOVrCmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbw-0000000Epde-0M9S;
	Tue, 02 Sep 2025 02:19:04 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utGbt-0000000Epbq-2OsO
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 02:19:02 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b4f8bf49aeaso825388a12.1
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 19:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756779541; x=1757384341; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+9rDFHyMl0yWopTNL7KTxfVtiX3RIrthk5jw1KOWP0=;
        b=P9Ov6CMhHRQX+iuKoe1YaRp/SDrgm+gr6JwhroVGccGSAaPG0R5oLU9J3w2XUHUsMZ
         f9key9wWtjk9Iu7ahimmGK6RCY4frs05EJ+yDuFikyuGvQ0C34kC6sMWG5aaEGH6eD5o
         A90D0fIJDTRze5KmwXxK11gG2ZHAScIN0Qwx1c9GcXRETIW7xtlBzi2YBa5/mtLXViJ7
         Zj5cvYDKZIX7iWDdH95QuMQTQogGqzEvXRCRWd7C4iRAA1I5K4m5S7/hHiejKshy/xC3
         quElxHVSUL7pojmOBrFfEwkzZLVa+VhizRWExk7YbDozXSj5zVg2wJ0lfr3zUzQwkHLp
         nlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779541; x=1757384341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+9rDFHyMl0yWopTNL7KTxfVtiX3RIrthk5jw1KOWP0=;
        b=cUq794f0xtpzJpzFapEaSjpaYwsBePh3Bil6tXtPiFGNy3vBfIlH1QBHHmLQITAvNg
         XNzyTvpKICa/AnYDIbTTu8OoLm2mC7l59d/Q8ix7QhqvbawPhMO4qy0EpQYrg/xk76Fg
         xiRUY0pV+jtPQ32hIeoSGCvhXyT0ApaVNT7cICpa5i1FUtLfH3wZpd9QN5srH2jBZDhO
         lhjyav1o5MFJsKfto3HLcTSq7/Ep5X3boh8yttdBTt7c2XgFRddu0OQW5fZSiqrmO3/Z
         BBaauyMRYU8gzp2Xg+kHo6Ua+iICjWKg/MwHmwsX1l5nwPnRfsGs0upQjWhPpwyuBps8
         jVwQ==
X-Gm-Message-State: AOJu0YxjoBclexNuaYxkyScGITlM9iFXMcadbufg2I23AkAOBc4fLD0v
	1nq/Efo8UHVVlfYb+f/moLDR7QCpQvQ9mct4D7tbhFUL/SqNOpovxeDCwP3ntNOjXnen5gG36fj
	5z9FR0mGRujiQC1VjU8aRlYkAqDEZyDyN8Dhs0E7BfT0SCXQiYtsxeabebHuAoNPQ4T6hshQAbR
	QdXT+q3YhPIhd+lnxwQL3NHOofjeV9AeXV37Q68QCmptoKXA==
X-Gm-Gg: ASbGnctDndJOiPERO6x/1G1TqqD0TdE6fDXmBO6yaLruLAWabkc3AjHNO5t8Wf3sU9Q
	Ln8uJ9CCtx8KRvgx9xsjUs5zfnBbTMtTsYsjFX1avyXLmlE7DbnEBu6me8Aq90QySapWv+nZyLy
	nmrmtdzMscjM7suzZ17LsnC8v8DgbAmsTglS+wJYNtFIzswtdvoMqt2o3Am6uhahKfHE4myFcLf
	yW4y6ZrLmDVMi9xrVIV8FyZj776D8S3tG5QK9K5aCFZbXwx/uDg1dRdD3Pt6fJXPNEQXz9Z84Z/
	mP5bWrtosYgDvblWWka2C7dUj/5BEiZr+0xToj4C28ciA+V3v52Kr/Q+ZAWgzeciJEBfMpMsUIa
	S1bZ/N51P7MMrwvGM7wvO
X-Google-Smtp-Source: AGHT+IFqYKARuyLUytzNQUMOcPQ39jMhrS2C/syuBKDAwSM0r1U0VwOTTB6jbS43fterfJruvvkHdw==
X-Received: by 2002:a17:903:1211:b0:246:464d:118a with SMTP id d9443c01a7336-24944ae8610mr140530085ad.46.1756779540556;
        Mon, 01 Sep 2025 19:19:00 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903755851sm116316745ad.56.2025.09.01.19.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:19:00 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 02 Sep 2025 10:24:46 +0800
Subject: [PATCH v5 07/11] lib: utils/ipi: Exposing the ACLINT IPI device
MIME-Version: 1.0
Message-Id: <20250902-cache-upstream-v5-7-af60a067f47a@sifive.com>
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_191901_616310_1A6453C3 
X-CRM114-Status: UNSURE (   9.42  )
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

Exposing the ACLINT IPI device so the other driver can send the CLINT
IPI on the platform with IMSIC.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi_utils/ipi/aclint_mswi.h | 1 +
 lib/utils/ipi/aclint_mswi.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sbi_utils/ipi/aclint_mswi.h b/include/sbi_utils/ipi/aclint_mswi.h
index 4b8249f25e7e9ee4a053af54e8c8c03dae8674a1..311228eb27faae040f8a603a083ff28c038d8f6c 100644
--- a/include/sbi_utils/ipi/aclint_mswi.h
+++ b/include/sbi_utils/ipi/aclint_mswi.h
@@ -26,6 +26,7 @@ struct aclint_mswi_data {
 	u32 hart_count;
 };
 
+struct sbi_ipi_device *aclint_mswi_get(void);
 int aclint_mswi_cold_init(struct aclint_mswi_data *mswi);
 
 #endif
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 9e55078a0b9b0f47acc006d3232402da6148828c..a4173b7c29d03dfd8dc316ab42a166e05c7eb9a8 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -66,6 +66,11 @@ static struct sbi_ipi_device aclint_mswi = {
 	.ipi_clear = mswi_ipi_clear
 };
 
+struct sbi_ipi_device *aclint_mswi_get(void)
+{
+	return &aclint_mswi;
+}
+
 int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 {
 	u32 i;

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
