Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940EFC98304
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nthKxQQBREIl03du9Lc+ppxILZPl+/jVimAtKEjJxFs=; b=baopbDQh3K6hM9
	Haq35ijm6pihXxCq/pK/GTwEd3cew1040Cx76t/E8cLt9i3u2TT5nIrDvz4Lrhe8cjSPEQNJ4aYlh
	kIgbcov8EtnG13D0wCFkcLHdpDOH4JMARwXTfVFxPGL4XC3/kO1mrJ5cYLNNZyi+oa/VvS+q1q+G1
	y0dZIaQk2Vt+KZVpFqqJggjyhePGIat+V5KJz5B1Dq8oDr1MejYMnvik3B52NYaFfHOTWcXziR2EK
	NLy+/1qYkFzi2qBatx4B++xC+ErjanUb0yXdvZ/bxbg5p75ppFRX1bLh3TZEOZ95qsOFnse7dRUkc
	veSoUa29gb77nptUNlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQ5-00000009Yvp-3vqa;
	Wed, 23 Sep 2026 21:22:25 +0000
Received: from mail-vs2-x0e.google.com ([2a00:1450:4864:3a::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQ3-00000009Yus-0i8p
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 21:22:24 +0000
Received: by mail-vs2-x0e.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso1220701e0c.0
        for <opensbi@lists.infradead.org>; Wed, 23 Sep 2026 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790198542; x=1790803342; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0jNT4FEQI2etcDBSIYAqylcDGZNLrQUKhNVDe/WWb8=;
        b=MpNJYT/ToUiBVN3E3YfgTo9jkmTIMTSGt/euPtasG0LCcBKTMxQerDjYMXzNo8B6QT
         VbnsECro+rHGafDR92PFALtmeUdf0YUs3H4Pb+sG2p9DIG3SpWiPUy7D9JCPn6Me99Hh
         3T7fbAn4brWSNlh9DplC3rkC9500L8i9XPz1MSbzI/TOWZOmVOQXnMB11655/OQm/MbJ
         Mmr3RNaq+HYK6hKvWGYEuj8OVkfzxkNay3kyq7T8CXJ/SYsLMNJWszJQ2JB39Jhsdhru
         vsNtqLGmeYjK8bpdInEq+ITybVdVt7/XLnJMtZv2ACXKsuZKkZEbJL9heMIZDs4DgWGq
         iOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198542; x=1790803342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0jNT4FEQI2etcDBSIYAqylcDGZNLrQUKhNVDe/WWb8=;
        b=qBQGoo+m648CsIjyFnYshAXPPpcAg41uxQ9s1FGGE4kl96O28ojAnAYMuIdhLLR0eV
         pGNwSX16EiVrh82AKKxs6yPjFeLPQtPgTHN+j5J6CtYgqi/p3a8OiFxjolNTHsHF/FQI
         kvyYuXhGeBYKGx/aLYrsZ3s1jbubVPPJnE+VDYIoRhcPIUEJHwfz0egbNenoJwvtCMwp
         16TipxkOpvA4uJHpg40Xj1aGNTumscHYr2brP+Yue8K/L+7LACNEq9+qlCtpMGosWIoU
         /aIbuzBqi7BD4hGBbbd+KIfVwovvtWEmoxHAe7kV/MiB+nAOxCb+6BTdy++TMRXHqw87
         xQrw==
X-Gm-Message-State: AFuF++nhZxiLpXA5Ks7UvL0cR3KLlgKFAIp+8YeA5Sc+Cg11tZnXgWuy
	T6hEkGt1/yYQpL3rJXnU5raV+b/G/RF5CMgBSx91vtojRPjeURAX4fa7PxWpaKKbVJqSQp2em99
	LIEXf
X-Gm-Gg: AYBFou0HbfqkwEYU0S7KsfyQiwvyakLUoWf6kCCrpgRMJcY9Cb+gogYkS1msiiAZXHF
	FmC+7EI8gmgi2cBjuRyc8hMOLJZGRyRKGlT+iegskK7kqy60CPiNzncWPqKNRKBJaA9rQEWfcY0
	odFe0bX9WXPIEZ2KhBH/063aEHPdtVglAgB224F9N88YaKRTAUgXzg/fOPtTZhC3pIwdkqFlsDz
	xINqRJm7X9QFK14mJnl309k8ceXMRqs1MRAtb+++66sUQE/3RoChiK3OSdcVC1V6R/di06zPtrR
	ubgPRs55bPNrw82Tx96y5nFwYSdnMMxJkcYKZQH5MCmUjkhdTJ6jGEVHfJiWPj2eXd2aS67bsAD
	ZHG/R1aKBHbAy3ASXzTz095jpICQZO1Pbm1X4bayAa/yrs8vVKO3OXuT34Lhfac1PzTA2TGM9tj
	+LReA1elPpCPQajqKYaZW6lsTQW63sGccR5dd7p/IBGKwELOMFgh+6hAeNe5zGkMDkNmT32mOmR
	tEPsco1J6dUhM1BfpzXtJq62AUaQ5FoWpCyS/JK1I586Sjsvzn3OQ==
X-Received: by 2002:a05:6102:5129:b0:7a1:f7c3:3a41 with SMTP id ada2fe7eead31-7af1c17d7a0mr464194137.14.1790198541869;
        Wed, 23 Sep 2026 14:22:21 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566bdccsm5213986137.4.2026.09.23.14.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:22:20 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Wed, 23 Sep 2026 17:22:12 -0400
Subject: [PATCH v2 1/3] Makefile: don't grep when setting
 CC_SUPPORT_ZICSR_ZIFENCEI
MIME-Version: 1.0
Message-Id: <20260923-makefile_extension_grep-v2-1-0eb97b8ac076@baylibre.com>
References: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
In-Reply-To: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_142223_454602_242E93AB 
X-CRM114-Status: UNSURE (   9.15  )
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
index 1b3333f3..d704b0b6 100644
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
