Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1159C5AD49
	for <opensbi@archiver.kernel.org>; Fri,  6 Jun 2025 05:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eea76FBT4N1EmXXh5lH4GdGahJmMkl+gSslveQKt3zM=; b=E/h4C9/+wzRMoU
	vGyPaDwZgsWp006dqgpFMdDrXeN++t7NlkddEzNrHAUH5p1TnYLM5fsckSqSQ2FqfqdXYCYZeEHEm
	Rv4QgRU/UZ7diAVeQH+adlc8DfdzY/eVoZyTZguoHoBdv0GGee9qcrT6gY4w2BeRM5jbHpaRuis57
	XKlelxKqoQFprD25D2+Gvq/jzLGZuDrC+pk+I1LgvXNEVMA0J5YtzIAVtpz58HX/tlNlRGFwePQwW
	P/CzQoQh/LQzCY7T97QXroUPxJWpdN70Ssh1YEINyl5ije9dL6WMMJccaLFAQgfZjGgBBC1HtUG+Z
	El+Vexx9unHIlbb/n4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQ5v-0000000H9s6-2wkO;
	Fri, 06 Jun 2025 05:58:23 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQ5s-0000000H9mA-1jSD
	for opensbi@lists.infradead.org;
	Fri, 06 Jun 2025 05:58:21 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so1583839a12.3
        for <opensbi@lists.infradead.org>; Thu, 05 Jun 2025 22:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749189499; x=1749794299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKi4lvWYvpr6vzHleimJ0uYfq8iV2FzhoQj9rTF65/k=;
        b=MkM6BMPWsQkIf2vu3Z9pV4x1Q12mgvKismI5hP8403FhmSqz6VH2MyXLHd6u0Jvs4c
         kEMONcRduRJaPLWpk3jNCl0tNIFHZRtZkAdIACGA6S2UlWGtaaVePvjS0K7J55fwyyhy
         iEuZUZrKYrkB/Ks1htHGvkT8xz4D4lSIxzQ19BWm/19RtLjWRNFq7UfqKVVQMS4qL6OL
         vhAAxXIsyW89X1RbefJViMJMQk9h4EEIQNiPsmjOulQaWy9b9WK3slWseVWpGCf4SIgP
         5KgYgbXTilFOJW+gCqkI/fJMBfSQTcjk3mHKCXuajo1Jzpp6M6KQL1LHL5g6xJjvTcZz
         IXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749189499; x=1749794299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKi4lvWYvpr6vzHleimJ0uYfq8iV2FzhoQj9rTF65/k=;
        b=Av4SNEg5remy6d2V+B+4XMKZwNmmnq3ZwQIbWH8JC5p83IBJIhjMhRfDxJcsD9VIaS
         jKFZVeANJMgxgE7MFP3TFUasuYAJw5BHlL0qBzZaHYqmCRLdyyhfEguSLaMUPlyJITdN
         5qJOtTfCT6a/C06dGVkN3sNiGKdGdReIdhpdSP5cob9vMfwFX5jmI/WFlGbzI9YWx9QB
         fxKf8xyhLvrtqDkaUr07ko0VlZDRygEkkS/9PXPTBIns/XFWOu6ReNvHnYI3+xAq16AM
         H7KjgzGb33KMyxamAeO2wajqtxU4v9ietBLiqiyYjolUcNlgQUbSwokN6lEDUosqMqya
         8mJA==
X-Forwarded-Encrypted: i=1; AJvYcCXpGcZNhGH2tccdz0KsDz212kKt24kvqRgGT7om+yJxNhupxkfPdStWON+2MMQbgf7GFrs9QH1s@lists.infradead.org
X-Gm-Message-State: AOJu0Yw33i5iHstKDUxs8HtRQlNJCOjm7sskz8Lpc5QVnR0SXtB30oel
	KIosgidHd+DvwwhSY4SaMhQ9yF0HkRuzq9MQ85fbdVCbRrotvPP09kM0jjbh88VT8mA=
X-Gm-Gg: ASbGncvGXk1zBEMLi5Bq8thLZbbXrdVfBgtG2mEbf9je+KrAKhzUsjiR7byqIINhQRA
	0FFdEsjt+z8Hi2t8VCrEcOfW+5XSfo5Nfcvp1Bnrx7CBOlJxwISgl3IrQhBwY2U0SnKodhafiCy
	IS26djU99JUVgDnRrNHHCBoYF4z9YpPP4Oecd38zv0QJvVF+3Whzzj9zjOMJ9Mm6QpPdNgrdom7
	F4TCwzE4U5MMXZ4LSov43aQZztYPmBEoDB9cPh4mzI8ABdY8BBPUb/ZUTkwWUNs0q37IIIr+kpe
	LcY/rcmu9v6Clv8WcmTIoui1ctOG44gfdxLBsyIYxEAvLMvgadWru6mdv06IqG0nrdCANzw/7St
	QmawhXwRbyDfQM4k=
X-Google-Smtp-Source: AGHT+IFnMnFtwTU0FLahSex/8SNacFhviF5S50mgP+TK+zBsZT5+SQ7SVI56c6xECdvseToQObaALg==
X-Received: by 2002:a05:6a20:160e:b0:20b:9774:ac6c with SMTP id adf61e73a8af0-21ee6853262mr2169336637.5.1749189499341;
        Thu, 05 Jun 2025 22:58:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7852b1sm545473a12.58.2025.06.05.22.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 22:58:18 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Raj Vishwanathan <Raj.Vishwanathan@gmail.com>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>,
	Maria Mbaye <MameMaria.Mbaye@microchip.com>
Subject: [PATCH] lib: utils: Fix fdt_parse_aclint_node() for non-contiguous hartid
Date: Fri,  6 Jun 2025 11:28:10 +0530
Message-ID: <20250606055810.237441-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_225820_520218_12EC4569 
X-CRM114-Status: UNSURE (   8.16  )
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

Currently, the fdt_parse_aclint_node() does not handle non-contiguous
hartid correctly and returns incorrect first_hartid and hart_count.
This is because the for-loop in fdt_parse_aclint_node() skips a hartid
for which hartindex is not available (aka corresponding CPU DT node
is disabled).

For example, on a platform with 4 HARTs (hartid 0, 1, 2, and 3) where
CPU DT nodes with hartid 0 and 2 are disabled, the fdt_parse_aclint_node()
returns first_hartid = 1 and hart_count = 3 which is incorrect.

To address the above issue, drop the sbi_hartid_to_hartindex() check
from the for-loop of fdt_parse_aclint_node().

Fixes: 5e90e54a1a53 ("lib: utils:Check that hartid is valid")
Reported-by: Maria Mbaye <MameMaria.Mbaye@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/fdt/fdt_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index b2d91fdf..4c0e8221 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -1013,9 +1013,6 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 		if (rc)
 			continue;
 
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
-			continue;
-
 		if (match_hwirq == hwirq) {
 			if (hartid < first_hartid)
 				first_hartid = hartid;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
