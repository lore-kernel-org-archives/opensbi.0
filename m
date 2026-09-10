Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E768BC88E42
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4P0A2qRKPJcbFbJFMr1VxEvWlVZPdf3nPtzCyaY1Ql8=; b=LqzvVx7Ab7AHcl
	/yW7Vx8wV4ZIBG78Mpc5jgpF/eGH6oWwi2Txvfp5Xw/RNoMaq5PyzfJSAqQAZhmu9yjevZBgTghbf
	+5/K8NrTNIq/vHW55rbNsEkknB8voJkO9ZAwyxB/4QBkW62WEvwS0IOWXVLdZUs2ri1o4wlRxzJaN
	N0rKc9TW2sxiRs4my/WvIAOKT6Xt0SChj54AVV76pr6F/3L5AdDpyG5ENU9IVQ8JjJV1FBD6qg3ll
	7aWLumcjg+HpsoHowD6qYwGOSWgSljkIdfSmurPHgw88vujIlLuWfnPCrJy6uR/rPeF6jOxG1bxxN
	YuR/FmOoH4LXGmMY5xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g05-0000000Ef8J-0eGc;
	Thu, 10 Sep 2026 14:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g02-0000000Ef77-1bwb
	for opensbi@bombadil.infradead.org;
	Thu, 10 Sep 2026 14:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IwQxYgbR+Ih6VAygWqxyLDDiiBJvi3fmloiWdhWIk6A=; b=a7moP4OGLfFVv5QAr9eZRFQFeF
	KJBsJ97zs7qzJOGBJt0skWQiIo6BNj5LBYbImLQ6Fc6HggKXcrH8aZqU7iuyeptr0K592NqQVy8hB
	QHJEcGKyMmwMe0loAmDoNbY2+v1TgkFrhwwAGlOtOvgwPMkKhEGzcY1RdUiQs2xxSexM4uFU1yHL6
	GfY6LionPf/gDBBkfBXdAC27Q4iqF/PXvQZVNsdWu3iEdhW0QB5w8SVdljCLLG8atjLG0Kn9hxafG
	GWraFeM2nW8EKu243tiHvEcf2ERZJ8pwgf7BjrAXdAZEna21vpIkfPN2PfIfjknp6CkvKiZ3z9+uB
	2RRj/pPQ==;
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4fzz-00000002dCs-21SH
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:43:37 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-90e8e70fa02so75956746d6.3
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789051413; x=1789656213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwQxYgbR+Ih6VAygWqxyLDDiiBJvi3fmloiWdhWIk6A=;
        b=HzQVqFw30jyOn8lc1H2OMKR0LP2QIhxOLrFoo6U4cz/fHShfOsmIhGDv/PjtZHZRuO
         EjqVZHqlO/BcS4SqvxOQmbBLvDYbn1XcDV/6L/T9olIG5I+odpvz7buVyz2iwj8G0hio
         H528v2HMjHIuC6NKJ+H7gzEY8VvahfFCWFkyAgbSARQ18/G4lJMSnG6WUlTHnoghwuYk
         wJHAWndq1YG2QjHmj7YDQ4OkLd0Lc1pF5AedsX75z5sFiAho1OP9H/uhuw8pLtUfQwVp
         97CPMcUZsKxb0s7TIK67twB+Fx4yB8jnvntbbXJcHXKvu0y6DrNS0G3ffd9642V3xkGm
         tzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051413; x=1789656213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwQxYgbR+Ih6VAygWqxyLDDiiBJvi3fmloiWdhWIk6A=;
        b=kvb1/cZn/oBCBEp9HbvZn0+KvRBF8q3lgoxcuPP9CmRu9efQw0lPXyG9DzSoCw6RWY
         0HL3e0mo8pN3dIr5LCXNEQ1f5QCyREhgKzitF5ZVEv6civy3eUVjeUZ8gc+ZP74U1skp
         Ll7/PBxHl3LcojxWBDglZBODDEROv8esA4lPhc968BDxW1IMt9HR1cl1zoaA3hVIMmhA
         Ol77yIts3nPvxSzdFF8XUT0zhQPyrc9AvGkDVyMoo25G0r+mQeZ56Y6i02N3qEVk1iqS
         HScbe2MJi5L3jVQ0sdVSZO1cMogXtmawQzH/5aSxEkjTIAQSl1RoZVFJDHGVCzEebQXX
         EqUg==
X-Gm-Message-State: AFuF++mlnTi1nAc/gSYZ2YWrqnccwVvZS45W5k9NY66BLwZNv+a/3Kuq
	9tK9pFuIP4aZtfcgtBhZU6IT2djl42UzVx8fecl6HtLW79m0RuT5R7/vLuz1cC0Yk/D6uHKajbd
	Z8wnF
X-Gm-Gg: AYBFou1VX9+fn8VOnpAHbMyZtTQGP/MkPYR+K+/oW5YR2w4/YBiBrB/e7CLOxvynxQc
	QK1+bEZShkee0mvxzoJyY8ZtIBJjBN6mFmtCcvjOtyuP+2g1y38sKxlgjAT8/ELEThX3U5VgkwF
	nYuOjV6dbwqW6ASWGIU7EuinMGnYKM/jV2TZm871Tgy0Ko22yxBvenlEJqJC9rgmug9Fh9bXNeU
	xWAHG+fMKn4g1PoUC1+A111DAGxZlYGATTBP9PCAjF1OcLRCB0K9eipN3MTkPSNuuS/yGvr+Z0F
	Ah3TdElOdzToKckKZgnAF91n8fbSKZ3ZaxFkzuCMzJhcGz2v5Fxy5MA4mcGPa6tIYt/5TZO7bdx
	SzDcvAFZGAFW3D5yWun/J9zycU3UGcm7v2N/FT5CGUKNelG1rl4qBGYxGyKreoCibhTIEEy13V5
	Qf+56sEGdFgKcUD6jI9dAqigN3AND43kaUmUF2OpUFsL/OBzAvrhGwOMzModTPfx0qdD5cISyYu
	takUEaOVJi7BbX6hlWzwMBqrSoPgCvIPp7EOH3pBh8b8Qpa/ZbneA==
X-Received: by 2002:a0c:f006:0:b0:90e:9389:2579 with SMTP id 6a1803df08f44-9103ef8d5a4mr482450866d6.18.1789051413453;
        Thu, 10 Sep 2026 07:43:33 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120d9df1b6sm2057546d6.18.2026.09.10.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:43:32 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Thu, 10 Sep 2026 10:43:21 -0400
Subject: [PATCH 1/3] Makefile: don't grep when setting
 CC_SUPPORT_ZICSR_ZIFENCEI
MIME-Version: 1.0
Message-Id: <20260910-makefile_extension_grep-v1-1-b3ae0d456a6e@baylibre.com>
References: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
In-Reply-To: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
To: opensbi@lists.infradead.org
Cc: carlos.lopezr4096@gmail.com, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154335_796949_FCF6F27E 
X-CRM114-Status: UNSURE (   9.06  )
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
index aebaa98c..07ac7e30 100644
--- a/Makefile
+++ b/Makefile
@@ -204,7 +204,7 @@ CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
 CC_SUPPORT_STRICT_ALIGN := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mstrict-align -x c /dev/null -o /dev/null 2>&1 | grep -e "-mstrict-align" -e "-mno-unaligned-access" >/dev/null && echo n || echo y)
 
 # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
-CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep -e "zicsr" -e "zifencei" > /dev/null && echo n || echo y)
+CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
 
 # Check whether the assembler and the compiler support the Vector extension
 CC_SUPPORT_VECTOR := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)gv -dM -E -x c /dev/null 2>&1 | grep -q riscv.*vector && echo y || echo n)

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
