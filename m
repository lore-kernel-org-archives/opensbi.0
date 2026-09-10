Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F994C79F9F
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHqhtu9YJnrdvaLoI/6BlO4L40hA4b0BIYt6oroEV+E=; b=PpLDc3fK6fccNk
	feGXqF6LLUWlTtBTSd3m/C3snwneISPA8VzuswLujv0fpG1KT3fs/rdRJBloOLxK618GCsUF5w3NV
	xqaJ6FQUnPJwbDM2Z8S5bHlfHvGj4XgZh2Njc3rt3kluEp0Aof9teUyOVuPjc+QQ+xfwlpRXv29bp
	tjByd78Cs/EDuLnhWND2GK3wB9qWfjoySgD/kUB+p/ahjNNZMa8dXy8tuO4OCIAKXfnRhr9DTjjCl
	iK5z/545dvuSFUUwLbmgvsfRWknd/S4fpOcyj9yBILVyDIi63zG+L1vriQnz3RJzrOUVRc5D2zmvD
	YcsVuGUI9f2z6NrMWvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g07-0000000Ef91-2SLe;
	Thu, 10 Sep 2026 14:43:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g05-0000000Ef7t-07bR
	for opensbi@bombadil.infradead.org;
	Thu, 10 Sep 2026 14:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z4NPFHEKe+oc8qgXmd5FURXoN/DdmrpoHbzZ7tN9LyA=; b=Fw0V9RlnHTYFWKPndJCM0/Jta3
	cv1HkeAOUW86plv1p5ogb4rZZk6VS5VYBKsPwY9YPlvDy7W4wTnEr7ox22W6gHK0eNjsymIKK4Dma
	VMUKA+YPRjuALx8jcRd0FcOJDE+kofNI8qPqAYIde2jMJ/NRQarAMH4ny1clQulD/pdby9QuZXa2c
	2D2m62AubiHrc/7tsbhJ0m7WVuJNbhcsBdmxt3kFOYHIbArMU5jBqgpMPnCkAeVP9IZnGmWxufNnp
	r1bqdT6LPkxF3gnTGg4sFHgKH7zqwtDPK/8NCmIwxWg6fiqSQenBjO3l87858JXYbs6qmGtY7TXDG
	/F85JrXQ==;
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4g02-00000002dDM-0rmC
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:43:39 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso60506576d6.3
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789051416; x=1789656216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4NPFHEKe+oc8qgXmd5FURXoN/DdmrpoHbzZ7tN9LyA=;
        b=KqtjL03Zq1be3iO5cBzqurOxksuSWjcZjx2+GHQDOXoxH4sUUZt2F/WsRRkQgiAHwl
         oTQd6af59yaeBBFIDckMvVW9Ejv6vPSF1svP7p7B6f1JYp/sgHU/OaLjuD5X9r2l7d8t
         Epvw4pil8izkD/MpdV1EY5akB9YmUC7P6v8132NXyNTy8CBIShy43Ff7FL48BigKE5k/
         WlGdPSzbUFIGuOOLcnKdITFO1hRLyZ3PzW+dgn25d0aSTmeRJwIYhnwrwS5VR6avucjg
         xYITA/eDMiN6IbsAl9UAUPIPQpT4mun3GgMfMYioKVHAOuOsOjzra+hXJG09jLE22Lhx
         Llkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051416; x=1789656216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4NPFHEKe+oc8qgXmd5FURXoN/DdmrpoHbzZ7tN9LyA=;
        b=D0MhaDTx7crmaXhBtFBaPvkKvbPn+Y0AuuBMvhzj3nZz+yRMBsrnquvfP7pzAvBMIk
         +/fcTaerAVWAbDhN+kDjghpDtoT4OzJG1LvEZS3qBdptQnGaS3NauLk4XhXf2MmTwdV1
         /7Xkpf+Rs5MX41fcUGcvli/tXgK2RHiz3L868/Zc7sjVOWyqWmCYDb2VT0den5+Reix4
         hvuNqpgkl4JjE4QACKDioNJunBA9gAo4FqIFDXicht7jeLSEt5IUWlPNS+QCAxkxk/5C
         SFRLzWvkilZx96i9MPeFcLdZ+iVdYyMduInQ8eUTxjrw0hzy32xS1xBgvtutdgOZepFQ
         IQ+w==
X-Gm-Message-State: AFuF++nSrnbm6b2ROFLPWWR3Dc9M8NmMWkrKiG5DyqaJKLfkqzd/xA8o
	v/kfN+3j7BnBWmhIHIlh+BFIg+Ux7qO1hXl0r5hqkBrJ21YCi+Mgd0JaXSsq/T1E/VPGxmHxpS+
	yVfJj
X-Gm-Gg: AYBFou1q48grzlIFuyJQYfrzniCTwNAUd7ednIFXxVgI5SMjbYcB7xF2TuIAIed4qZq
	0t8s1WF5Vv9FJKp1NJ7yEtNctVz6gvDvPQA8LDdCWdFu7lxshdZlypH7qD0fMrMAeNb8n4Nfp2f
	OpsZ+YVc0z/OlXpvF8hOBxPpwikim1YbNKvnw7TLGEY+jnZ/rI3x/WAx+cNRM/l6Asnjjie9Fcl
	jNbGye8K4n45oj+Jwt/YFiOcK1v8R9UWbWINIqz9hJGN1dOcWFQw5d4plWFTIN9DQVAgyzcXmv1
	wW0RxLFa7Bxkqx1/wPoeYi1ejCX6JAjDsprF1nNtzAbD1s7/fz8l0eEN3N1VIjXLU8ciFsmVzTg
	F8IFycc+H2kCq+Fe8XfbO9Url0xyJwpDjx/O5caqV9YpxIN3pkHDUEIwhLnxG7axUAkiWQclQHz
	p2NJO+WP1bNF7NIvhc62/4YCeQZ3Kbww8c+bElCNlccfCapMqDQ3n7Az4OQ+NEutejOY8OfncKE
	zUyqgCxJhre3tu2Er+rk80ktq+147p9SRBCyLecGXD/
X-Received: by 2002:a05:6214:8110:b0:90e:8d49:1ca2 with SMTP id 6a1803df08f44-9103ef006e4mr473429696d6.2.1789051416066;
        Thu, 10 Sep 2026 07:43:36 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120d9df1b6sm2057546d6.18.2026.09.10.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:43:35 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Thu, 10 Sep 2026 10:43:23 -0400
Subject: [PATCH 3/3] Makefile: don't grep when setting
 CC_SUPPORT_SAVE_RESTORE
MIME-Version: 1.0
Message-Id: <20260910-makefile_extension_grep-v1-3-b3ae0d456a6e@baylibre.com>
References: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
In-Reply-To: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
To: opensbi@lists.infradead.org
Cc: carlos.lopezr4096@gmail.com, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154338_356861_89E12450 
X-CRM114-Status: UNSURE (   9.04  )
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
index a8ccfbab..ea05dfd1 100644
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
