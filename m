Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C631C98311
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 21:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiCUJZkXtbK+jvXojwTRe8gDQPl7Oqd8Te/tqjCk6QE=; b=rLlRPs5SvyODPS
	WcuA+Ia0o06bl0QGnxb9cQJnG+YX+KsxApAjtAQGFB9be+TuMZJjXqJCsxJxwC4RYC5Fxelf7itEY
	txWqUVxsKg2TLaZ2WUSE7nfDZV6G1ei+xs70+dDo/MsngSjgvE5r6Oda6Zs5E9T0EyPFiysvoW12D
	FUv/mijG7r56XOevSHrVsSvbB1niu6c85mxSR5mBMgIMexrJ9GJFqkQelLE8f8ThKa0ZWy6OD608E
	+WfFF6sLaE6mxABPyMCKEA8rQTawLZMYB4gPWuQzme14gmffdQXVfgH5y+lMqnR9+TzjQqlnGTyxH
	9P6+ip6iNgQ2+Wx+kwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQ8-00000009Ywy-09zT;
	Wed, 23 Sep 2026 21:22:28 +0000
Received: from mail-ua2-x10.google.com ([2a00:1450:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQ5-00000009YvH-1Kyc
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 21:22:26 +0000
Received: by mail-ua2-x10.google.com with SMTP id a1e0cc1a2514c-97e7dba0631so529112241.3
        for <opensbi@lists.infradead.org>; Wed, 23 Sep 2026 14:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790198544; x=1790803344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UDPsaYqw3yE6Y4m0nCk48t/1zMvqFjCBOzLMpYyMc8=;
        b=S+dFs2mbk8VysuhWz2sZVjYh3JBjjNbkq49EMrp+nGAaykQ5gkYCMwAEFTVL14VDpF
         DVas2i+K9cPXHN0h8a/d4oEmMo0Y+qpbgTzq12/Mmld5mRririJ/VtMww5G1nV+jyf2W
         vf/x92hG0NYJ8d/p5AEeY6tCBi9zUIOQyKshNFjRIaDV+DI1Q4aGe7GHy3MZhizwbZkf
         FKKrRi3KIMieHmwX4opw6aohwr16+H4CrTtLf1jO7daQaFoQGEsqLWUavcbEEvaSTMGo
         z2qJZvWeiOtlJaIcxl3dw1z1bd0T+6zlsxjPrVdljDCok3bFbq1UrIhaQ/QIgSgR81T+
         WEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198544; x=1790803344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UDPsaYqw3yE6Y4m0nCk48t/1zMvqFjCBOzLMpYyMc8=;
        b=cmkhRe8u0EZ5tCj7Wq0iX+aitySMQgoNynsgpmexfb9yPxx0nenjwsqwDQIeJA+ran
         s/rSnQu6LG5upENYtEJKLYf6dOnV1h5/DaUJ5nbrAhYyEOctAO2iCQJMqBfiSQBzhMzv
         74gLn6JUKvc+CVDqcrKLny211mSl/fAniyAPmVH9FBvvNsbV4KlLZhoVURWjsWkBZcHt
         JRfV8sXBlo4nqDjdxQx46V4W57r+3ko0GSLlDRdnrOaIGYxvBxlMMrmX0L7C8EH+8qRE
         vMgYCHQjLJ43rPm1hvtcjXIH1og/Z8MgEL6Vs4gzW9qXK8O4V01ffFoF8V5HLbLCMXEz
         xAtQ==
X-Gm-Message-State: AFuF++nycHCNKUffMdlVTD+MGJ7ad4wTZfUG3fsQc33trxwPBJdA1n+A
	UPMQ18NHbFxywktlMNB0qDWeX6C0cs0tnhSrkEoy2YE35i92A3VaXyoVn1aHPCPmRThCM7S1S2b
	4iHlL
X-Gm-Gg: AYBFou0LIj/yJ1x0nnwlXaUpnRo1CS851Me7vOr0e5xfXNkna9YcPVYG2RayENbTTDr
	OJwBCmcTGqqZZbB6eci5jH6oTmL/GeJ0edI3bAC/dwfw2K0l9RCUNZFnjk2yaS9TLoWYW5oqSUp
	tqJ3nvHszdLBwOKXhnOewontP3I6yic8InbmybuyE5+PTP+t455P4Qsmq3fHG/95cd8AmICvg5y
	gyXzYE8skTDo8PXYInziMNn0YMB6ftzisKJSwWZLBTtaFVTlIDrB8ku9D8tLAecgxCZlzuSrIpx
	GdNG12n482cIbgBmlDTayhv5H7yFwUZ+Oxin5XjPanXgBKr+VTHRyc7E0JUUUpf7yqn1vmwkDlW
	5M0MZxa9zCKzNOkkBh+W/V5slMmT9C/a0oBD2gwFoqsUvqQDoRVw3CMS/Hoy4ye4xWTPob74MoD
	I7zZsP1nvumlymIa3ALGFKjqfas0vjCAFuub9Wvi4xV5kUJhhOoRdXB9PKscvn2FYjXXb1WyVo3
	UPyDJYzvMAi/0FkbUHXc2/LPVRuOeAlQ6bf9ak+Qqk=
X-Received: by 2002:a05:6102:f12:b0:7ab:d3f6:6225 with SMTP id ada2fe7eead31-7af19738629mr436835137.0.1790198544095;
        Wed, 23 Sep 2026 14:22:24 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566bdccsm5213986137.4.2026.09.23.14.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:22:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Wed, 23 Sep 2026 17:22:13 -0400
Subject: [PATCH v2 2/3] Makefile: don't grep when setting
 CC_SUPPORT_STRICT_ALIGN
MIME-Version: 1.0
Message-Id: <20260923-makefile_extension_grep-v2-2-0eb97b8ac076@baylibre.com>
References: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
In-Reply-To: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_142225_373758_56EA080A 
X-CRM114-Status: UNSURE (   9.02  )
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

Check exit status from the compiler/linker check directly (similar to
OPENSBI_LD_PIE), rather than using grep to search for a pattern. This
avoids potential unrelated matches in the command.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d704b0b6..b0a23ce0 100644
--- a/Makefile
+++ b/Makefile
@@ -201,7 +201,7 @@ OPENSBI_LD_EXCLUDE_LIBS := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_
 CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -e "-save-restore" >/dev/null && echo n || echo y)
 
 # Check whether the compiler supports -m(no-)strict-align
-CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mstrict-align -x c /dev/null -o /dev/null 2>&1 | grep -e "-mstrict-align" -e "-mno-unaligned-access" >/dev/null && echo n || echo y)
+CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mstrict-align -x c /dev/null -o /dev/null 2>&1 && echo y || echo n)
 
 # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
 CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
