Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E86C9830D
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zybJytedBhZWXH25zHCZ/zOL66uYrlgAYr2cfNBkPtc=; b=HQo4dkFPE/vDX4
	wtyKe4dDinLSBAYuu3L8R7sznb4Fv7mFHYrL6yE+uHsk8ukflhV65nA9h9l+xynE2MdwTgu1dOuKp
	1exCQlbVCpSb8+OjJV3Kd5+T9bT1E7Bq6QZBLHWv4wLT9u5UzuLagwWFB52dytGFs3tRh6NjkAu4c
	RTJhOGOQAEScVqEwzDo5lsKzgXDENPyfxQW44MZCRx/K2NpbpvKNUumNy88haDp8AXrUui6lLqSii
	yRmYMu/ynE+jsUFenmzOOE0nzgxkuSEco6nHH+mjjToHHw8KLFQyrA4yNeitnE+1U5Y3e4rxbnuO2
	e1u5GFBXBZ0CWnDNCCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQA-00000009YyX-0y3H;
	Wed, 23 Sep 2026 21:22:30 +0000
Received: from mail-vs2-x0c.google.com ([2a00:1450:4864:3a::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQ7-00000009Yw5-1NZw
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 21:22:28 +0000
Received: by mail-vs2-x0c.google.com with SMTP id ada2fe7eead31-7ab11c26693so713761137.2
        for <opensbi@lists.infradead.org>; Wed, 23 Sep 2026 14:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790198546; x=1790803346; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ag4Js80tt6NZhVOzbzFmyrXNDQ+0Jb8OmX5qYNg3XI=;
        b=WLtNIWTBnPHKewa/BdLZDIhNQFY5BDdbXRHlE1H2lNvrGEabBQ5N8iPbA6VjBxxkTM
         oj8Q2zf8fizFA0Qhzm11V7mQs++n8ccF3V9k26e8Y27tNhGn3VOQzUsld8j5uIkehcYo
         IVE8LdqLJZOVVWxGarRlxokDwVhH7ha6UOu3Dcnr9rfsR/wB+LOEXYMZWm8fU02z3W6J
         Cl5cMmZeoS20CO0yKxQDmCWYHAg2I1cyN2uaDA/aORaJJ62R+qFtuD1TrMI7UqM67blS
         ieY9Bc4MWTKgYnQ0H07DZK1Za10ZwG7nGrUOCavK+3slTBkMEXFVqRA/6f8qmcWYd03M
         7qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198546; x=1790803346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ag4Js80tt6NZhVOzbzFmyrXNDQ+0Jb8OmX5qYNg3XI=;
        b=PayfH5hIF3+84tzIu9KXyWpbAGRImlLrf/KhPg2DWXCORzyPzj9FxvBm/rRi2VkLnc
         ye+tdCns/AM/bKvsooWsZL5HnAZbwswCBGI97JUsK6evefWKH8QvuPDBygWeZRkSbkUU
         LasusjdtfLjm5zl6QvA0jFqAH4t6wxTE7drWH9iCldo27qpp3JZp/W3V5huf9YGl3Qf1
         OjAsnkCCxKY9nkBdKhyPwPj0/wjIlPPy5/MGpS3ALdQcDFVdMwKpCR7E0MPyjl01B+dv
         12KwF1ygiIAG2XQ/PdwmJV65xDX2hIB3CbImFrlASmszGokC6+77o2oeTk/WaO2UlXF8
         qnNQ==
X-Gm-Message-State: AFuF++mr6a7mxb0FRsSKGlgPhnryTgRLOglUfKOpZ2WEqUnvdmsgii1B
	aAJ2bvyA2FLHXMNewAhaZEco6+eDHJlTiCTIoeY4X6ytrTY/UQ/nnC8F1eZ8Fh0lR+w=
X-Gm-Gg: AYBFou09Aj2BysdWkNagdoEGuKsHZbz9CS2AWSfTNrtX8iYprc79PMsgTIANhb+fnlW
	ywVn+G3EwHcpEKXhOjqKYEExJn03KZrvArs38Fwxs6Wk8tWz/n0gjo3hDyC+lzTyecl3e1oSnKs
	N556ckSl424alW1/yMThOyDtw+t1m8eKmfcFjqdnAhsyRCEVDkVcS2bROErtLYydLB6zPczxA6o
	xqtq9d/FPBH04x3RCvCwHO5vWdOMd7Qw1kaB11P8o2wzs040i/k2jnYCrbVY1wqrJ1A9fCr1XQW
	kOgFuRRg8XZRDZ+C3VynInmWkvqveAsOEq1Zu9Nfam0eY9c2oEPjPJR4pnHf/LkmmUuPW5Nw/IS
	zxSHF5vLRuMArqBFcjDr39EkZf11I6o4oswImT/9bqNamEoCvLsS0cgRy0jURY9QNeFScWu8ZU8
	l56Ufv4rzIfpNs1QbfqY4N2UbYeZfUAFEaX9a4iB88NH2WYTN91V3vPOjxJ74LVFlBWkhak2UOa
	Tyx5BEepc6Vqu9iG282mtoxXAzxMgdfAkdiIKiA2+KIcooj115KdQ==
X-Received: by 2002:a67:e703:0:b0:7a7:36ac:b17a with SMTP id ada2fe7eead31-7af1e4f6353mr381597137.20.1790198546184;
        Wed, 23 Sep 2026 14:22:26 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566bdccsm5213986137.4.2026.09.23.14.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:22:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Wed, 23 Sep 2026 17:22:14 -0400
Subject: [PATCH v2 3/3] Makefile: don't grep when setting
 CC_SUPPORT_SAVE_RESTORE
MIME-Version: 1.0
Message-Id: <20260923-makefile_extension_grep-v2-3-0eb97b8ac076@baylibre.com>
References: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
In-Reply-To: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_142227_379014_8CE63DF2 
X-CRM114-Status: UNSURE (   9.33  )
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
index b0a23ce0..90bf7d5d 100644
--- a/Makefile
+++ b/Makefile
@@ -198,7 +198,7 @@ OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fP
 OPENSBI_LD_EXCLUDE_LIBS := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) "-Wl,--exclude-libs,ALL" -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
 
 # Check whether the compiler supports -m(no-)save-restore
-CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -e "-save-restore" >/dev/null && echo n || echo y)
+CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 && echo y || echo n)
 
 # Check whether the compiler supports -m(no-)strict-align
 CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mstrict-align -x c /dev/null -o /dev/null 2>&1 && echo y || echo n)

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
