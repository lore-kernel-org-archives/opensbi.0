Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E544ACCFA0D
	for <opensbi@archiver.kernel.org>; Wed,  5 Nov 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WTc0FVcLFiIwZn0M96I3FhVdbidNrJ85jOpmvzhNaRg=; b=4BxwZO0TpzyXDy
	ZdADdGg719qqU1Z24XclfcGbUHtAwveSG02nJV7YFytD/h+NE0Re6mxb8o6I3QiUhJuHDay3NGMDP
	Z8jmsQ/GuIFMdVU5VRbBfvqypqFQczEhXp/GqsEgSMy73du+jVkpBc1lRAmWhwyzZ0AwHil/QooHl
	TzUa3FACxOyHoSMQPwuj2v7J2jI+T4juFop9AM7mYyHf6bsTCEVD911kmfr+XNFynhxGfe7kwgpGI
	Atu8SqGbUP+kSkap2dRAbagzDOabmtiBYUntTkVybYcoskrhGFLnN4TYxtyi3uxJQ3U5wC9/XImZ/
	+xhcgv5ftqi4LZpwVjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfxO-0000000E0sT-3Q3m;
	Wed, 05 Nov 2025 16:01:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfxM-0000000E0s5-0TFn
	for opensbi@lists.infradead.org;
	Wed, 05 Nov 2025 16:01:57 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-27c369f8986so70126605ad.3
        for <opensbi@lists.infradead.org>; Wed, 05 Nov 2025 08:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762358515; x=1762963315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WngapgBKr96ZijnHpAVIg0ZdArD4M3DE9UjPFK87dSE=;
        b=K14DUG+Hi9KdnAkQnhp7zOX9G8ygOgvWqWI5nYJmSNbHZ+TFochTLIHhxlX0mhXQpq
         J6IsM3Db477kycxWD7VtzlE+8ncSaH1liJ5W5DPya8oFR5IoRtSMFRE7/gvWvcvre4Gc
         GTAppDqhhNx/HGBLPsjSN9HkZpLU5VYHz9k243+EfDfFS9yokTsakoE5AorBvfJoflfu
         5kAqLjfdoEgdWoQ3O14p2VpnZpvcMAM22/bzVlfYFttR28srZfxg7vTm5r3xACh/tSQd
         ZfY86Bq31WVqpDB9e0iSosoqlWXlr0w15V5/DE0KnSoMM6Fr4fSIM+18cKvBtvkvzqhF
         B+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358515; x=1762963315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WngapgBKr96ZijnHpAVIg0ZdArD4M3DE9UjPFK87dSE=;
        b=FHAJGK8WQmMWQ5GW9010KlsMzA26g6N+sYI7Nqi84bqBe8UlQoK38En65O00cpmLeE
         GnQxmzSgUG9q5T2ldnRDlS98R0JcyfaLgKlUKIJRdVYrA0a8R5XffeMyl0OpYFse0xUr
         UJJ2eqmr5beCytPM1a708tIkGXtx+Phv7ZVcnuRMVKorWTbjnpYEoKb2qPXa8TXaEZ9C
         mZ8Wi47ugrp+V2TfvEb+YYF+VYRQfs+fZ6aoZ3vzOaXCnoqDrJSndV6G4yJotVJ6OAxa
         3NeWbIFW0OQ5U0PNc0+lOmQ504TYLm8WCC0rrhDV0VN17+lKy7TJB3V9OhdfRYz/Um9v
         24zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMIxHbOGyeSV2nKqq6msXNS1rZjVxeck72N01Mq3JhKmLLpj8FH3gO1GxTwGzhobmGDWSkjECm@lists.infradead.org
X-Gm-Message-State: AOJu0YzDVfaTfP2CHg5PQfPpsz4j/Gf/DgQPhzf8qnszvEWHALvGogak
	XA834zMgYpp4nRpBO1OLVdrmRt9Jcbt7M/YaG2nncUU1fT/pXe3lyzu8N6+PFjVgZhs=
X-Gm-Gg: ASbGnctuBXs6Z8Pxv7vVt9Oyo+RceDTHfT+499ZlBT5lnZ3vS3Nhihl4Z8n+XrqS8NB
	O0kuTcb8oaOAdf5pncx7G/Uf6/3yyrczhpugKPziADbiPRjFWUuAc9SgFMHKoDeNM8+zbxPDr2i
	2YZ84i6wiF4UIcbGz8syGn9lWm58IuKxkHgVoAxdzAuSAo0SikWN+XCoYtvo6Gvxw7KdhoXCGMz
	qezBlfL7WeBMN7gbvTtwlFUfsmtzWTQSmlXHhqZFcVDo8xw2ET4h3W9UfPSi1t6FlwbZ2uErmX8
	cUS/zYaZnNU1wcoLvGMdot9G27jxylQomgpi/eOdwWXDVN+F0V5Deo9Pte2gqCmM/RJWfCOg4R0
	7r4AOyNiDFuX4DsAVA7IklHo78n0kpcBVupXEtRfjT2W/YOzp7HOoqiEOmTUDeov9UwH8rVpipd
	0cyV0/LZiEyNlubiw2sO3fHVawvexApbdL
X-Google-Smtp-Source: AGHT+IEgHWy6nHWm60Wsu41Mum5xl0g2nYCzAaLN/f2byjW9ygceujRLDvUdWahT23VBCcfIpdAuww==
X-Received: by 2002:a17:902:d4cc:b0:295:4d62:61a9 with SMTP id d9443c01a7336-2962ad954f6mr56501945ad.38.1762358514431;
        Wed, 05 Nov 2025 08:01:54 -0800 (PST)
Received: from localhost.localdomain ([122.171.16.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2960199831esm65114655ad.37.2025.11.05.08.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:01:53 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] platform: generic: Keep some empty space in FDT passed to next stage
Date: Wed,  5 Nov 2025 21:31:45 +0530
Message-ID: <20251105160146.271156-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080156_161934_E4D03506 
X-CRM114-Status: UNSURE (   8.85  )
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

Leaving no empty space in the FDT passed to the next booting stage
causes the following U-Boot crash on Ventana internal platforms:

Unhandled exception: Load access fault
EPC: 00000000fffa6372 RA: 00000000fffa7418 TVAL: 0001746174730068
EPC: 0000000080245372 RA: 0000000080246418 reloc adjusted

SP:  00000000fef38440 GP:  00000000fef40e60 TP:  0000000000000000
T0:  00000000fef40a70 T1:  000000000000ff00 T2:  0000000000000000
S0:  00000000fffc17a8 S1:  00000000fef38d40 A0:  7375746174730068
A1:  00000000fffc17a8 A2:  0000000000000010 A3:  0000000000000010
A4:  0000000000000000 A5:  00000000fffc17b8 A6:  0000000000ff0000
A7:  000000000000b100 S2:  0000000000000000 S3:  0000000000000001
S4:  00000000fef38d40 S5:  7375746174730068 S6:  0000000000000000
S7:  00000000fef4eef0 S8:  00000000fef4ef90 S9:  0000000000000000
S10: 0000000000000000 S11: 00000000fef4efc0 T3:  00000000fef40ea8
T4:  0000000000ff0000 T5:  00000000fef40a60 T6:  00000000fef40a6c

To address the above issue, keep some minimal empty space in the
FDT instead of no empty space.

Fixes: bbe9a23060e9 ("platform: generic: Pack the FDT after applying fixups")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 platform/generic/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index e66f99fa..ea44676b 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -245,7 +245,9 @@ int generic_final_init(bool cold_boot)
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
 
+	/* Minimize the empty space in FDT to 4KB */
 	fdt_pack(fdt);
+	fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 4096);
 
 	return 0;
 }
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
