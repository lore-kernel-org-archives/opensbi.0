Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E2CA0FE1
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ebz9SWlijl7pS7ZwjyCLJmP7mjLd6jsDINK6josvrRY=; b=qUM6HAcJSwKGSL94J+ezo/DnwJ
	nxmwB7un1Awe+FaWHJDhlFGD0UFsQgf5/8NmIXWlKXrUIQZJJmkWJ2aQa2xe2nDPPpUWlmeS82Kmi
	P+/Xt+morvr7A6AgM4TcN9kPj9EOTP05/4jkvFXKHcBrUDWTGbIV4inaPMHYroe3IeCDINAI0sYeW
	FvEvAG/H9OFV1aK1SdjN/RGiSDcD91Et1ZdjA4bSZClbeAlaeJnO2XmAQDuaqavZl+I93NBUmggaX
	UvjU51dlbF77E5AbVgFdE25gif/5M1lAvUrMusG9ax50fVw6ZTvb2Ybl2JgeKxRFnad0+2Xwn4Pk8
	bkCvHuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbL-0000000CHRy-109g;
	Wed, 20 Aug 2025 03:35:03 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZa-0000000CHDr-2ERj
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32326e5a623so4945289a91.3
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660794; x=1756265594; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/q/SggIZrVmmm8A91IDs+DygwgJiblBxUZCHXjzVMMA=;
        b=aXmlOoYfyR8G9Ce+IL9NO2OTvUh9Q/Ip39BSqrvfYEhN8typ0tqFjJNn/RHjlEIsY9
         Tl+Qa6EAp/GJjhwvvUCjdAguHeu6eb4U6cZlNU9IiDpy4vENTmEeVe7Ogg9P0nVOjs9Q
         NaIxNn3AyMNNWo7fWFADBtGnf44MleDDYJc/LxMCSCh9LXz2BWHpO0CHSisY8Oy/R221
         7LcxzkCvCNuTp31uz314rSkCMwjHunJStUAl262SEoRTUtcix3KRwIczbgWZuvLxe8k5
         TyLC5r/Db/SLC1PH3VWhjmMj42cuzgTgQGtivURBUyqSdkRCBlzsXu8Qpw2l8FtPYNcu
         Qohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660794; x=1756265594;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q/SggIZrVmmm8A91IDs+DygwgJiblBxUZCHXjzVMMA=;
        b=U05GjUL0ULcgycniCHYFN4msIeYElmaXve7sH+XAT2ef4lSS0cZjRDuf6gIhbDD4sg
         A7RDmNhTfWIT5muIkm82spQLRn7yNvjXFbIuB7F4YAjvOrSeOwWeLjGKK/lk7u/o/h1W
         m5X7G0fNoJaqqKNIiV0wP509pwRuZSkLLAC56te8ebW/V3LTmjOcDtezx/HZ6F3BL+TK
         KPj/VFNcRQt69eSex6Dck3tBClWOh7O27DhbRV91DxpLwtW/pwTPkQ9VVZsM5CUZOpfw
         IHebTTYLQZebL3Hz6FMrHkZcU/DzH4XpV8g6YHtXHj2reor/QPLWHNlVl9SaNFxnmtsC
         GDbA==
X-Gm-Message-State: AOJu0YytrIltWnFmgHzH3Ez/YRoqoo2HBsFUyiHXAeGFsv8rTrjJcvD+
	2MuTyybed0Wd4CySZbveekvhZiBzkn8Y6ztllUyX0Yd3DWG6VgcGOCHWnZ4Uxrlp3i8Pl1Pws1V
	sUmHh6/yn2MjiAnX0pSOtDMYcIT6FSxuNWeKtx/AEV467fYREC8f7mGe0xCmQ/Xlwmua0hQrqRz
	b9eOg3rHQHbB8nglanvBuzDqcY5+IYv/FGAF7OsysbipWUtQ==
X-Gm-Gg: ASbGncvGfDzQnsB4t3VX/dzQZKZmG+ft/oxXpR4q+MpY1lLNULzw3ZTJ2PE/4Ggmodk
	5h4ljOVVOk+n3P1N6MO2slZoj0jt5QBF5c33Hd9U6DyS01T9w9Lu5XoIfHK7/FiU4AAkBwsDgnU
	Dm4TF9y/3igFRMBFJJIWlXGn0xBYjrpYa2oYBcN7G2+++hH5rIpiNC35Aj5en9pInzqHUMWUxwo
	mICpPpSOojBCXwWN/DvR97zsrbXftq6lZZASDah/K6kFN2Vyz5ChUKEbF0O3M13+IRp+pwGS+gV
	jiGbJThGYKPxNgZ9CtaDXOLRLejARXkI7L3EoH38wlTnqHyfOF+J7+Z4PbyXvI4C7ZYezX96SnU
	tNm1Is0q/v1xQmPOoyjDCuPPCGv2x+SucZXiVzVn32rvf
X-Google-Smtp-Source: AGHT+IG3vaOek93nXudTVkzgDElh3oNE6zvH+CTytanZjxuKwJUEJBqcgStmV76Bq5w30xuT99mdyQ==
X-Received: by 2002:a17:90b:5705:b0:312:1ae9:1525 with SMTP id 98e67ed59e1d1-324e1291fc3mr1959175a91.8.1755660793512;
        Tue, 19 Aug 2025 20:33:13 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:13 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 07/11] lib: utils/ipi: Exposing the ACLINT IPI device
Date: Wed, 20 Aug 2025 11:32:46 +0800
Message-Id: <20250820033250.544-8-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203314_568263_CF2434E5 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
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
index 4b8249f2..311228eb 100644
--- a/include/sbi_utils/ipi/aclint_mswi.h
+++ b/include/sbi_utils/ipi/aclint_mswi.h
@@ -26,6 +26,7 @@ struct aclint_mswi_data {
 	u32 hart_count;
 };
 
+struct sbi_ipi_device *aclint_mswi_get(void);
 int aclint_mswi_cold_init(struct aclint_mswi_data *mswi);
 
 #endif
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 9e55078a..a4173b7c 100644
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
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
