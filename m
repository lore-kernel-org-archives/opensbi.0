Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C693CA1012
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u/2PfKW9/0dnBRCRL8BHrmUUxLWHPD6jgk5gPF70Ecc=; b=N/XXJ2q8PUxkH8
	mOv3XTNkdxUD5BDVyYK0lh0B1jOcCOjiraIzeiQr1MEMv2NbUFZxUuV33O4nE3s5IQdwBKgB0p1qf
	VdHUESOKnW3IIRlVWjpzFSoPX76/tPDKTLZkrI6yzI79qr6xmFoMHN5rg1APq4AiwuE6UStoKVzFJ
	kaASHSTDqLypqnURAg3B5uPVnaU5HoQpO+LvChoMA58qVeWHgdcb5G4mQTZ6UFTjairUfZCYV9E59
	adcucM2Xf0VAvdkjYQj10+PV1ARjDzRCYL7Y8WA6p/vezfL31pd9+dFm48B7AdJhCK9qRmB74cETg
	TFS7DHpIzZLLPcVoVBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt0S-00000007Qvo-0LjA;
	Wed, 03 Sep 2025 19:18:56 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoiM-00000006krM-09sP
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 14:43:59 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so875404a91.1
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756910637; x=1757515437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsYOnt7UEL5gYivIk0pTaQ7JcuORNKRipDlSkz/jsNM=;
        b=WKA3idFlqAbptJ7ofOCqBhXjFkFJe5QEhfHHb7r1D6CmURjlvn3TUkX950C8kKeWUA
         IDXqWSV8bOdAy1ASUhW4Qy5jTnga5L6tKQxw+JsAKt0ab884IJjulHa65xgTfrGuEqau
         g84M/sbdSHYzjsXZRNF1AJfxXh91d95gJTe44ZQfnTwIPHthoct+W5BFBeiQh2PySsk/
         ux2F2lpxKYnA4Mfycu09jfOPw0NS4KVVwMZfdPEcUSBcY13SdspsaVwNxVZnzNfRfMDy
         4WtBDeyv3/sR6nyKaLLmdvie43x/m8jsGNUAd10knAz/V2+bkxN/OsYqEHR9ydeh7QxP
         kSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756910637; x=1757515437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsYOnt7UEL5gYivIk0pTaQ7JcuORNKRipDlSkz/jsNM=;
        b=RWhWwF6BYNvWJiYs7sojSpbojQ1myCjsCS+lfRdhN1z/5LtkpkAI4AfaokaFjdOAL8
         8lN0+GaEhYbNYm0IQXNpQN4yduPD9zY0sipktraYH+P240+hUe0w0BMJ/AqIlzgRdS44
         u4VeqHTBAgtEWxEhh0PK2S7JY5o66BnKgjo24NP7EG/kRV/2SARiVgiW942YrIOlNs6j
         5VWyDyvsi0UGvxVaSFcs9TTK3k9DOicrMI4hai/J270WkjRAtHquIuxaWrnR5hPkNpyV
         IHFhasNZ2khggruwHaqX8kkfjT8F0JNPH1nTB0uRwZHtWqIBlTpHwHv3fORZ6k5Q3xsV
         CJIg==
X-Gm-Message-State: AOJu0Yzvak/7znaTGi4Zv/HjMCg/4OKnBwA7reZWonAh065PhBeUCX55
	oO5w+uFIfZcEIHmpdcL0XF1ISRFFW6e/RY0Yb2FBYTfSqSjACMQZ+eaC9n3gAcEJWYwJkwtLqeY
	qsApVXO8=
X-Gm-Gg: ASbGncsucmvSuQCmYsgPs+LRKMQhkgNMAqZc3W1nllqz0er8TaEKb/qPmZ+iWkHt7ID
	ZBQEKFYbUD0EIHR3HVV9WnIT2wiVp4aTGSenGq0w+aqDnHBlhDpKh4R5CW9ZzzR2o33j0N12RTN
	B0d9qe5Oww6Pl3WI5j72ZF54fQH6VJKfFKN5AQEG1tkL4ACnARnPVK8SFAhAq+7eyE8QKlcG20g
	eZfAfc8qDIhdcpTwv0R5XF0lkbbuFqGf5WEu26TblUGcDWHTd3FD6Cj219i8kiqLinmzvzw/6Ci
	0eU2xecO3T3i+7Zo0OUvAcRkeXevvk+X45nn1w+QgVltr8iIucysa1vs4COtW3pOip5tDHtEO2G
	9a+diGWSfZA0R+CT6F6GShzQEd3tbvqKgZMyhpAxsihC5ficONlXT3bL3zJ0WV6BOHDGAPdN+LI
	+a+KekM7dASE/x8gJc8bVzGe763rRYu3jB8cY8UmqSUvc=
X-Google-Smtp-Source: AGHT+IF47uqSedHaPeoReIlL0ISwsQDR883w6Z8+8j3eZUWfbaLKlepCbnnXDoWXjVHUoK6BGinH3A==
X-Received: by 2002:a17:90b:2790:b0:325:25fb:9128 with SMTP id 98e67ed59e1d1-328156b8379mr21817475a91.9.1756910636623;
        Wed, 03 Sep 2025 07:43:56 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.. ([2402:e280:3e81:5eb:b81a:4c64:9d04:77a2])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7722a4bf561sm17041610b3a.59.2025.09.03.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:43:56 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: rpathak@ventanamicro.com,
	rahul@summations.net,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] lib: utils/reset: Hang the hart after RPMI system reset message
Date: Wed,  3 Sep 2025 20:13:23 +0530
Message-ID: <20250903144323.251270-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_074358_078126_89A9F025 
X-CRM114-Status: UNSURE (   8.59  )
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

RPMI system reset is a posted message which
does not wait for acknowledgement after sending
the RPMI message to PuC. Call the sbi_hart_hang()
to hang the hart after performing the system reset
via RPMI message.

Fixes: 6a26726e08e4 ("lib/utils: reset: Add RPMI System Reset driver")
Reported-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 lib/utils/reset/fdt_reset_rpmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
index edc53932ccc0..c29715d329c4 100644
--- a/lib/utils/reset/fdt_reset_rpmi.c
+++ b/lib/utils/reset/fdt_reset_rpmi.c
@@ -7,6 +7,7 @@
  *   Rahul Pathak <rpathak@ventanamicro.com>
  */
 
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_console.h>
@@ -56,6 +57,8 @@ static void rpmi_do_system_reset(u32 reset_type)
 	if (ret)
 		sbi_printf("system reset failed [type: %d]: ret: %d\n",
 			   reset_type, ret);
+
+	sbi_hart_hang();
 }
 
 /**
-- 
2.48.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
