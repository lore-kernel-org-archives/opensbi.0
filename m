Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A3C79FB9
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDoyrFn7tuktXoYwVRu3BPx6WsSmU0aySAs/W8h3guQ=; b=vwgR5KjZBEtshM
	nTZStvafn0qHua4s1zN0GGPEPCiAhI86pUD+XqTGYN7f1VnpL06xi/vjbnmM9M30zMQmYRhyM96GP
	zvNzv4B/hCeJInTTH7TfPOiULo9FGubDBfejDcardypg7/cKXWBvLhVPw05wjVmj0sa53jiy0XqEc
	TgdqR6AKxNxSe+PrWhzClEOG2c4Jc9C34QP9snO2jDEMfcy7SkNVPRC3fIoUFodd04ikr4JOBnpQt
	kK1VfcSu4AKMJXAtdpiagiznu6RJaM6dn2mpMKbR2gYlmLEr3ZGZ1s1EDc5XbFA1VfCg8FuRwNaut
	3HHF+0bSXO5jsXfiz4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g03-0000000Ef7Z-47QM;
	Thu, 10 Sep 2026 14:43:39 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g00-0000000Ef6U-0b43
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:43:37 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-67119f919bfso611488d50.0
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 07:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789051415; x=1789656215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDZs7jz8SVgQ9F2Oe2AE2/BdLW9o+mtwAGNqA+M+4cQ=;
        b=XrVbaUfW+txEPIr3dDCEuV1OaRIFjLWCzqIQjcZSzFIl/dMZuduDYiNyEUqedir7hr
         w4l40YN1mebQ0ujlzjYY98iXVLTRAUQE4HIUf0biWxo3Ow/qCHV1Iplz32AaolwDHpf4
         wH1oEaNqoG1ciOfbSGrSbOGRh5zQKgDOS2HFbPJCgZosdMwokymrzoBU8DrAPNK9DYUQ
         CzoL9bQQSJHiC1Fn3iRksKMH1aBkbBm3fn4Gq3nitgid7Ste8NYEIMuX31/Y/0eeitU4
         9n7vNXwd4kd3jAABHL/O2weX4kSTc8z+VVNg28rzYdPYo4HxuGuhQ5KXhD9L7Eqs+9kS
         mDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051415; x=1789656215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDZs7jz8SVgQ9F2Oe2AE2/BdLW9o+mtwAGNqA+M+4cQ=;
        b=fPenR7i9fyGX9B1LcAbIQVT2EIHXtiktQygBzXeL/HS5TWsRWGUp0wCX2OaU5GWyTP
         Pi58A9JStbnVZbplXuTwC8zLOUAKrV9IwV9NAXS/mSbEhXLg9OZ950QTmD6IZ+/R2W6p
         lZMRCX0ZIC8ClPXZAzRNKlc/OTzzQVDxtbkzb4+miT00nL4z9Es+AY5nAHA2vWoxLvj5
         mksqbqZEN8KyVjJej+l2112DywUnTsrvPhBaPmZnpEQT8lbHVukB4s874zygef4xTBR8
         nv3pcEhZt9d5g1ZrLuA5oRigQyAteEtQu5mt8Z3yFe6ca0F894f6Se+/QAYkRZy0reO9
         GCEQ==
X-Gm-Message-State: AFuF++lWVyD2eq04Q94Q3PUpkPyak1bY1marxFsswm+j0Onlhvb2ynnG
	tmrvoXqY0yCBOM9O4iGBDHcKt32IU72JS/hOzm/4hQDqpe/BPY253JAnyNDm0X4ofxHTQhVvDXA
	x8a0L
X-Gm-Gg: AYBFou1sigebfcCHSq+lvSx0b/JBFaxar4ZQjqRyFBnJpd2H+TZSzX2vk3ZWwQIC6tW
	ypnuLlUY7fBmWSiRIv91SKyodJLPalvtEFkfoERN2Iev7r+aZlgQKFD+1X4GS8JQCODKLIznTEm
	zBQdJuoRLIzjJGRUGVDLLYrD3dIzU/pspKjGcnKRF4mk4msyGa0TyECr1v+APeaP7xunBOPLGJb
	bnnMkU6qRxsfjikKz9uMknHGGZsNGil83ZMraXl9weY2blYAiu+nardXN7DaCbiXMoGmhQYsz8Z
	YkwZ99pTwUeGr0O4PjNE6KO1XBHkDXZAP786kwiDrgX5iZ0Wfw+uwdHJ6hYzBnMJYuFw6aAPTV5
	WbKASpfdPM7tDLj25ej25jicUtOU9DUxfmT6nnAbPiGe4uuVYQ3OroMNI7QmAaYLiSceYpbsZrq
	UFKQ72XtfAWLuvvBFLACo5bNW+t+98+eESVOqXMlH+UMsbYTy89iLhA+ZB74cn7Wg8nrl/u5Ez3
	UyVoKJdU7x/OWbvJPj646LRMyBfiKM8ljvgxFAbGCs=
X-Received: by 2002:a53:c152:0:b0:66f:c1bc:c097 with SMTP id 956f58d0204a3-66fc1bcc711mr8764132d50.95.1789051414786;
        Thu, 10 Sep 2026 07:43:34 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120d9df1b6sm2057546d6.18.2026.09.10.07.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:43:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Thu, 10 Sep 2026 10:43:22 -0400
Subject: [PATCH 2/3] Makefile: don't grep when setting
 CC_SUPPORT_STRICT_ALIGN
MIME-Version: 1.0
Message-Id: <20260910-makefile_extension_grep-v1-2-b3ae0d456a6e@baylibre.com>
References: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
In-Reply-To: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
To: opensbi@lists.infradead.org
Cc: carlos.lopezr4096@gmail.com, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_074336_196348_0840AD32 
X-CRM114-Status: UNSURE (   9.19  )
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
index 07ac7e30..a8ccfbab 100644
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
