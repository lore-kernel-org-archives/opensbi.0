Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AE8CAC582
	for <opensbi@archiver.kernel.org>; Mon,  8 Sep 2025 05:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYW8YgU8SwDTZyFfUF54vPZJgSWdOizeOhM/mv4ElA8=; b=PxgcLKfMOVjR8L
	UWk6k3j5Q4fK+OO7fkT2lqcCkvlte7Kp64xU7Rn0u1LvERt2akuNOYLkLOrm0AMd/4wWD+6utC6pQ
	CbRRiuw3LcmSrhzhWJhxzgL5TukheMwtBRu6aopkP0kE+oJ47jFEyOAcsAXpF6jVvCgE7X68e3CEk
	udlTRrxxsF4fdrJyGoohLz6vwGonspmdvgeFXTH+O8HK7c4EjTghKQpIXkSICmjQ5lwXU2BkHW1wA
	gpILX2PEwTUa0G+Cv/mD3IR/Y5UwNaCkYryzm1FdcjgeUHl3gphTZEcGdWOFTMHBm/pcFS8bmbszU
	DO0V2tgPAMtjJ7G759rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUrz-0000000Epn0-35ud;
	Mon, 08 Sep 2025 05:56:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvUrx-0000000Epki-0JGx
	for opensbi@lists.infradead.org;
	Mon, 08 Sep 2025 05:56:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2445806df50so33745715ad.1
        for <opensbi@lists.infradead.org>; Sun, 07 Sep 2025 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757311008; x=1757915808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJsnWpUes5jQlOo17epOwZq81e0WhwBNKw+ZDm/D61w=;
        b=YpwSTxhe69pV59qEkPR5CDRVThL/dFDZlT829ysuLQnAAUeNMUk0StSmHvK7Ukimh8
         9IVw38pglVhDpmI3mLNR9C6tYsLfcHs0wQxDL7y62ox/3bFdcARypLzZsp7Hv4a+oSLD
         aXcM40UrYcUYbD9N3W4+CL2D6izPFataaIqKiYNN/o2iOQPhIVIKBtzgnj+ax6ZN8H6O
         xiTZi5M8QOXtfsKFE+Nm6lIGEN9arFIXMkBlE0dkJXkj7eKHqxfZKh14ixNxyJAA7OgM
         N2+ZCvGI+KQgLa1fJ4QGAhe85XpqvrCXGHKIaMlscp9xXf8MSb239VCWiSWeHpy/jqh8
         WEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757311008; x=1757915808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJsnWpUes5jQlOo17epOwZq81e0WhwBNKw+ZDm/D61w=;
        b=lwbvIi9skBcYCzXpIr2fCfYnf4xFIBwagV+OzZ8Fv1zG69wY4KBDd89Pm0zA1/bm7X
         i+jb53wvnrEEEPebk02LutSIsO1CdgQHbOaj+t3UWIGuz82/JW9HsNYY5eCJRciKvAL/
         5opAX/qXztFuXRpMpeP3qM4XHZwWJqwe1ACQQrJxc/NxR7lzS7PV0YE7/5y5vceaM9JR
         Up44TMj6fiDu6/FCABbW/QGqV9xdFQnI7U6yCT+1CZmWXaaUI6/bTtyS4RCEQgQrbmb1
         7hhajjtvevUMr2grCLHsEzwM8+2HRMsyA5N/SSyo3dkKCJuhgXRJCNRzLwoQExdhhfTq
         I5RQ==
X-Gm-Message-State: AOJu0YxRGG02kbDmvhBBFwO8VD3+dIGAg2k/NtEDDkLm14XM8nPSmY6G
	iJXx8j20esBeJxDEkEhFqxYPWApU+SEk4lFdWQX/aQYEfXN89cMAEBf6oP7tKCJSBfkFDYmEcNK
	5taBt6rdrOgPl0jpqR3qfcYdF1j3lvb5F+c6ATws/zHq7qHb1pPhQAMosiqxYbB2JzdYESqAr8A
	/KnnatQd6zXqaupIM/LEJ+DB4vX+HqW1V3Adw5NNg03LTF37g+wJRNNxU=
X-Gm-Gg: ASbGncu/+RxW9rS9XCy5gON7KLHVRaxRKwN/O2YaqxkAyhRphrM4D4FNsJOnbzV+8fb
	/99MoH++dZDqwsUSUStUFsGrW7ojcLU/Y1fiw+CC3a1dQQuZKNRXAUkJONH2vaiPEwdiiy5NLRJ
	fiqcY3pm5wUy1L9Ol8yvfkAaF6SAbxPRNvTT4HRcYQFuH0yGJJKWpI4CqPrGtLSAYYb/WSSuphY
	e8VIlA74i+H5+6ecsXL6EG1Peh4u6ypTjWv1dmmynjSx7WP/+ZtvuhIwXpF1F2A1zHqVbM3GT2p
	mE76d/5JFp/39P96Vc4VYq25A5oVpp626LsrYPlz+fb0ChdN8wpQzA8rIC+63hVEph/guN+cb61
	X1XU7ijFL0j8Sy/5Uod7NJdM9jOzvjbyojpN+m/0E4uzr
X-Google-Smtp-Source: AGHT+IGicZdJ5MuUlD68zSgW41Su5ck7GaKTCSjF2C6sPpQ+sg7xR6HsQJX9rgNmgjtb65Wf2K+4GQ==
X-Received: by 2002:a17:903:238a:b0:24a:a2c5:a0a1 with SMTP id d9443c01a7336-2517057fd3cmr94299775ad.21.1757311008234;
        Sun, 07 Sep 2025 22:56:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-252ea823306sm42894525ad.26.2025.09.07.22.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:56:47 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/3] lib: sbi_hart: Do not call delegate_traps() in the resume flow
Date: Sun,  7 Sep 2025 22:56:39 -0700
Message-ID: <20250908055646.2391370-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250908055646.2391370-1-samuel.holland@sifive.com>
References: <20250908055646.2391370-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_225649_122288_E2923F78 
X-CRM114-Status: GOOD (  10.22  )
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

The only purpose of this function is to program the initial values of
mideleg and medeleg. However, both of these CSRs are now saved/restored
across non-retentive suspend, so the values from this function are
always overwritten by the restored values.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_hart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6a2d7d6f..1b50f671 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -1037,10 +1037,6 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
-	rc = delegate_traps(scratch);
-	if (rc)
-		return rc;
-
 	return 0;
 }
 
@@ -1068,6 +1064,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
 	if (rc)
 		return rc;
 
+	rc = delegate_traps(scratch);
+	if (rc)
+		return rc;
+
 	return sbi_hart_reinit(scratch);
 }
 
-- 
2.47.2

base-commit: 153cdeea5350837c1206a2d2b6189fd0ba06d1f2
branch: up/mideleg-fix

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
