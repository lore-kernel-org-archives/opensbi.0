Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EDEC3ABC3
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmF7TbP6rD1E9eWZNd1F5yPl/meXZEJo4POuDl36D0A=; b=DTBGYXsrM3eSZq
	R/oZmiu66j5CGofMD/G61mWXovNvQFU7pZbq0L8eAIFXH9inA/6F9IPJ90X9/xDq+eFwGGfbuN1rf
	mpdhHkJLk+KJ3MCuaQXxR95slsOnxwB7yiazJCxosvcJsUoUwFJIFSNJjhNszqcZ/IDxy84k+I5lI
	6RHDTHPIvEIBXGHKGWvlUCpok0gplHM2/dez4XP3pbQhAvqhnnOYpxva1srxxYk73EE6d/63iHSft
	l9ugCfxz/ISADT5I+Z7D+KsPSJrYyM1uOUIS70COnJdcjpXltatOGgJo/jCrjKpRLFlTgo+8N7MA+
	pwEFzodDt+aTOH3ULg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOj1-00000008msF-1Rat;
	Mon, 12 May 2025 08:41:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOgI-00000008mQU-30fR
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 08:38:39 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso3136734b3a.1
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039118; x=1747643918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjU6mKE0ukl6eqhAjpLJpbvRuCocX5gAy/1qIc270DA=;
        b=XWgVzE/48g/nOZBSHRcOcLp6+9JzP17uwHZasxS+ZGZr/s/pLwmblWvp8KNARQIr91
         Y7o3tVVupuozjOr1GkoIwnC9MQvea07203M/ItvuZTL8E3BRFVt88Pmjg0OV0Oi056Hn
         cpt6eAqwFeocTtMh6oFht+MKWDJ1o2QCGTL9Ba/mEqEwSofDrjamNaLQtUqfKXOiK94A
         OH2yLYEj5j785wD/2mQyHAXde2U4zANPrOrQPehWAMRI8M9LMPFpQFjzNtpx4qUCisqa
         /qRLP14Vrju/CcjHogfOiECcnJH56m/FGsA6RrNBafNC4CjsuxmTfCDFKK0P4QT40sBw
         ZMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039118; x=1747643918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjU6mKE0ukl6eqhAjpLJpbvRuCocX5gAy/1qIc270DA=;
        b=uEmcKKc9WNXwx8F4tHPkRcmJnHL6+l+Cw55pMNyCxYkV8cO+9zsYBz5gzhwsvzAq/H
         wCtC19IDGlpkQ3DCgT0aqW3ANf1Ukq+0UlnUzNHUc89OsBvgik8LqyPIbRXWTmB8JjKE
         YUrFe97dvucqzVhtqAiR78xUZO2JiB8DucEpHAYpaJacCU3iRqxKkktdqzA3uinlR/YJ
         jjkTbGSqrICpZPgEA1T3QRCHN/84VlucOcn32s3sqoiqoBsU6HLHvy4441gJlP2IwzTJ
         t9XP7BDrVsuq6PeoShlv/4/sqQjGJpXOTergmrIJIJd/C1AJZicRNvOWte9MZJVMAeKw
         kMgA==
X-Forwarded-Encrypted: i=1; AJvYcCXQTFORqF2vRZIvOm5So3FTnlchPjVt9cNQ2NYVi90gRbtAov9jZ/CdyGep/jRwxGYHpawucxth@lists.infradead.org
X-Gm-Message-State: AOJu0YwqFAPg30isLgNpEAeZWdKNQRd7U02fZywuKXo4z+ppdImytSEW
	pS0/9mKD+Zb/B0ksGFsdYeQeeAuGM8YZOLisYgjK70TYegue03U9bqm+xB6ngfA=
X-Gm-Gg: ASbGnct/xTETHKihhwAOvMmETyOkklEO3hxC5fa8KCe5YfOn5CJ4bCdYuHEB6OaKHbV
	BfX8TVzmK7QVlJgewHOcmnw0G/ns26uVXIlPvSZbsRAf3ItUBNqICpXS0yidsP3EpLAtFSa7f3t
	FJ84HLsfLVN73v0cBZTVJsZym0oXeLwQNwWrSjPBCOhl+1hwgwXYCngHyK8bKXM30iir8KqUTe2
	xErQgqudG0Yg3DLjSkxinlOj9F6yJYWwLu9yQKQQZoOMeqAHM1ST+Bp2+BG6mQclCWKPiGiLhKl
	84D+0P6oAlMs5CM7mfZS/J4J2bK+z8++Zg23q7nCmN0ufbYVXSeBHw7f0RNz3u4f48S/C451eSa
	M4Zr0ac8BYBGo9Q==
X-Google-Smtp-Source: AGHT+IHdZnp0i92laBVqCNo/9jHkJVJ3wTHIUf3os7m9NMA/H37yuZdi/WgTu1fHOI1CVd6ZIFIy1Q==
X-Received: by 2002:a05:6a00:190f:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-7423bc1eac3mr15342372b3a.5.1747039117913;
        Mon, 12 May 2025 01:38:37 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.16.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773dedfsm5520943b3a.72.2025.05.12.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:38:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/4] lib: utils/mailbox: Update DT register name of A2P doorbell
Date: Mon, 12 May 2025 14:08:24 +0530
Message-ID: <20250512083827.804151-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512083827.804151-1-apatel@ventanamicro.com>
References: <20250512083827.804151-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013838_766981_8CB6E680 
X-CRM114-Status: UNSURE (   9.82  )
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

The latest device tree bindings define A2P doorbell register name as
"a2p-doorbell" so update rpmi_shmem_transport_init() accordingly.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index 5b858d36..2faf51e4 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -651,7 +651,7 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 		SPIN_LOCK_INIT(qctx->queue_lock);
 	}
 
-	/* get the db-reg property name */
+	/* get the a2p-doorbell property name */
 	name = fdt_stringlist_get(fdt, nodeoff, "reg-names", qid, &len);
 	if (!name || (name && len < 0))
 		return len;
@@ -659,7 +659,7 @@ static int rpmi_shmem_transport_init(struct rpmi_shmem_mbox_controller *mctl,
 	/* fetch doorbell register address*/
 	ret = fdt_get_node_addr_size(fdt, nodeoff, qid, &reg_addr,
 				       &reg_size);
-	if (!ret && !(strncmp(name, "db-reg", strlen("db-reg")))) {
+	if (!ret && !(strncmp(name, "a2p-doorbell", strlen("a2p-doorbell")))) {
 		mctl->mb_regs = (void *)(unsigned long)reg_addr;
 		ret = sbi_domain_root_add_memrange(reg_addr, reg_size, reg_size,
 						   (SBI_DOMAIN_MEMREGION_MMIO |
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
