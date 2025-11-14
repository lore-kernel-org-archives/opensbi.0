Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D9CDB47D
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 03:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJG0nCloFisqtNon/f87cx3e5qwLmC1UP9KgYnbJXFo=; b=M1izIIzgh1Nuup
	ttIwOndMPs+fLb7GLUGD29AuJyJ8LXshmcBha6mH1qMv9waNInkQy3+P5tuEUnJD1oVQv8kQhwyp5
	/pONIoi7d/aBojdRg2MY1UqYaH0w4lBfpS7uoIm2dexX0W94ZxoscprPIbHX/1EYUbPVQ3Is7UKUE
	6Ndrwn1QuwDH60psV9qGpdYpHQzT5bH2AepvhHnXlCDHCs2EOETNfNeSR4KYewqLichG9QQFj/Hbh
	FLM6UwcjvHXwM/u9F79zTM1UIxPLeyLjjHoRiNgXs5dzMk4oKVJCySFNCgr8tpl+6TorcaVvUnalK
	2m/CFVjVBURgClNGlkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI3-0000000BSRd-1NrS;
	Fri, 14 Nov 2025 03:15:59 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI1-0000000BSQe-1GxJ
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 03:15:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-298456bb53aso16638965ad.0
        for <opensbi@lists.infradead.org>; Thu, 13 Nov 2025 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763090156; x=1763694956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+288bD5oOmkmOoGZocw/oxBiBNc9v9Zz2ncE/WjKuw=;
        b=SHuLD5dqTFJ90frmaIeNeu1N/rGAQOVnUBrJVDbmgAiKj7yEzja1w4iDFyXE1tlh4p
         0su1guv2nhcVXf5xz6bqI/2Q/u0+v4src+uQyrDSoHgZxxpqhrLrOSO2jImpFa6ZAUF6
         oACMe/ty1bItmjknumoOSx5G7arGXb4ANeRSOVExvdL5/qw3aeanNcgaBFNe/fl/BJCZ
         UUP9DJ//LzSnWndbZdhXse7UXRJdAWxq0rWMKYCcmeXW3gse13NrOIZS+tHLkx+N3+MX
         H71nH0nEF0cLprg9fLZy2lIxygthVYRVLEO+k7M3D/CTbf+0GMfLuppI/SOeZbpmvjgJ
         plBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763090156; x=1763694956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+288bD5oOmkmOoGZocw/oxBiBNc9v9Zz2ncE/WjKuw=;
        b=ZDyazZoksU6ePNhpD5Emk/uDbVUDkPQ6hJf/HDswKFOFeMOIpseYolxdfnSKoBypyp
         wGyguL1FPFzk7lG+Bfs2hlQKCTArrWuW0oB2QHT8weYV6gXo7/c5itPGNT+7OQVcsD6w
         JM0b8FR9r69nkmDaR4HiFFmDKb2NYlvcyM22jqbXJ5/PM6DLuAk8eu1IPTofFYsdL96f
         HbbIlEUE93sVbcbiwqOE+f9634+ILQvqO9nFHFyqlNSOiq4bW/C5xMmmWy7MKg3WT0u0
         Gi9dXAa4ozUYs/7g6EV09CEj3Goxhzrbn3RRk7GKr9jSiNjY77zpxzj1Kt2nW47iVHJB
         APyw==
X-Gm-Message-State: AOJu0YztXcnVmtlSbalyk+kGN7cfaQCs8WRFRQl9TzO5RNVopnmt5ydH
	cvn+VUTb9R1DVky2qB5xmmrBIlCHEM7KZIxGtgYeqoyhUpEr3e+2W1LOm8zra38NaJDu/itLwKb
	G1GAW2GDh83ezaXrfEpBcKoL0FDLZJvxhzEUS5vV3skLH/NvfugXjlyEJyzujunc01TzDOm0VGt
	dwuQPSqsRtoAlzlyWBFCK+HaJsEeChXAj0NDLJXjNdquXCLg==
X-Gm-Gg: ASbGncsTrNDZsPsygqviAZs9jB92mAX6mmrPawLJ9NDxa9bRluIB90G9j3QEMEn5hhp
	duKaZLLx0gQcxnx+W/w6qNJsUo2JMLRIsXPW9Au/Xg09SdhLnt51FMZjU7yGuhRU7kXL/K71Q/E
	J1qpXMZ9RCtDG7hdWFuMLEAivDw6HZ2pj/8oPo8E60DB/p6ZOv6KEAoHjDf7AFwYPbzfMo+ORnS
	Z3NYcMgXqWMkirnbMVYX2N0nxhgCRU7ubOmzJEaMd2WgrGs6Y8sWI23Kpl5shqjdZ1N2k6qcppL
	Ki1f5xJIRPPe3BUOPa7Pt9i/nmlykuDPh1k/hR9eFQNGIdFGuem93jAHFNt3ULek8vHEjj1cJTH
	AH+GyWt6KXNrXqYCG98Z+1BZgQK0cJ5c3mx3svhIscpQLM8fmEtfW4MAgDhbF8s6DBNYVfKufAw
	==
X-Google-Smtp-Source: AGHT+IEJUqywJEDPJYWJJBhPol843PLNiOYBP9iFc+03Obo3mgqLxuHni50zMUHRExB0SMMbiu5bpg==
X-Received: by 2002:a17:903:46c8:b0:295:50cd:e759 with SMTP id d9443c01a7336-2986a76f495mr15328465ad.58.1763090155968;
        Thu, 13 Nov 2025 19:15:55 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db22439sm3538606a12.4.2025.11.13.19.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:15:55 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 14 Nov 2025 11:22:45 +0800
Subject: [PATCH 1/3] lib: utils/cache: Handle last-level cache correctly in
 fdt_cache_add()
MIME-Version: 1.0
Message-Id: <20251114-sifive-cache-drivers-v1-1-8423a721924c@sifive.com>
References: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com>
In-Reply-To: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com>
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_191557_347108_38454C0B 
X-CRM114-Status: GOOD (  10.58  )
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

The fdt_cache_add() helper attempts to retrieve the next-level cache and
returns SBI_ENOENT when there is none. Since this condition only indicates
that the current cache is the last-level cache, the helper should not
treat it as an error.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 lib/utils/cache/fdt_cache.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/utils/cache/fdt_cache.c b/lib/utils/cache/fdt_cache.c
index aeaa613830960b67bf5f512a101f0242d8692872..2a9e8a6dd53c008eec8f319d0e19c56ea1d11a1a 100644
--- a/lib/utils/cache/fdt_cache.c
+++ b/lib/utils/cache/fdt_cache.c
@@ -23,7 +23,9 @@ int fdt_cache_add(const void *fdt, int noff, struct cache_device *dev)
 	sbi_dprintf("%s: %s\n", __func__, dev->name);
 
 	rc = fdt_next_cache_get(fdt, noff, &dev->next);
-	if (rc)
+	if (rc == SBI_ENOENT)
+		dev->next = NULL;
+	else if (rc)
 		return rc;
 
 	return cache_add(dev);

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
