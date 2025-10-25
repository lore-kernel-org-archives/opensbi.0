Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C86CCF9EC
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNESrF918aDQ+kY473rIot9KGTCgkcQzgs5WN3GgJzo=; b=tA6Tk68oCRKlVj
	BDMvhETddcufCWWZYWfaMgNMLdYszEu3LhZu79+vh2YX/su6opwQk8UTZ8mYrBXxctXlMpJtWfkNA
	/G5BdEDL4beGfx7NzCzufetM9ZhyRpkP2WaaVpXkc5iv/1wheEOdQSyH3gd6fpl0PLmNMadVFBJdu
	EiLBurKXUU8qAZ1vNhLsz1Hecs+UxDvTOScCj++Z3XfsCV2Wcj0kldTImv8RCWd8iESLPMa7pzsm1
	lT1hAQx2c15XxgC3ySDjSpegBjZfnunWTjAV+PfuYuS6VbmjrOy28uJLAXesyfF8kUV4lmlYzmMl4
	xMpvcawbGFUO8AensZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaPy-0000000B9lQ-3hJ3;
	Sat, 25 Oct 2025 09:18:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaPw-0000000B9kY-4Bge
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7811a02316bso2152714b3a.3
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383912; x=1761988712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhwMVIG6l6ygBwR4/sZp6eP5WGJI1UoxOXheDHtFZh0=;
        b=G9IDOosYg/z/l/u/X303Gd8912ET+7rqtadbM/dynj0jnkyGzl7cAMKwgs0xT+GcDH
         +4dN0tHWY8CS75C5e0GcgfAD0YXOqX4A2BagBR514gkHzUDq6/6mjX3mY0mdQ7HtsaUI
         /VS9hK0UqnLIwhIMjG0nbt0tJE93cE9GMZZF0tmnVMb+TLDi5siROqQ+BSXYQC+keUBf
         B6yuhCquGY0W6VCpoFG5yeM6r6OdfnT/qvdStuY4bW24so02OYoakpwiB6rbujbP16QW
         tt+uyVvcuoTMzhum7YBqDYr8EqnwdkyqXUSygFgWaJ0Tia3TsYVUP+jLGOfLy7C1r38N
         p2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383912; x=1761988712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhwMVIG6l6ygBwR4/sZp6eP5WGJI1UoxOXheDHtFZh0=;
        b=qyJL/BiLz5M83bmnqf+Z6HBJtKdK9cglKm0RATzDMGJtHMZUoJtfWjvfrQpW1wfhaR
         Y1rlcMQYr+inX4KhFoPHJ7joTjQdIsJjAQ+rZknHdSy4PaEi7KTGivj9xPtWNwND2O1c
         FU3xMcnlIZ7nellRAHUNAC4bEO+I0ipl9yRx1H5rMtppQ0woT7QbskC7uxwUwiG4wGPZ
         SvMG6IJpDS9RRYCtey2cjuIFx2F+ALwVP/to82DAIZ8va1eYZz7vclD6RNL57lus57n9
         r8DQE27TBIfw6qXimQmbyRbzyQF/rGXw8Sn07fF3bBD20l7eYGaxQtr6ZmGv2+wBmOF4
         UIhw==
X-Gm-Message-State: AOJu0YxuiRz/CG55t1JItFaaOQKH1q87R2mrcRZgrbNUNBfp99xqXTf0
	5WbC1THa8lLSctQrEXu5Mmy9YGMMG8iJnpBhbBVDM5FwZ2cDLHkYbSGFbA/Gmf9rQ8KAYOaf/FW
	aaAgdTvtwXDCkhMH+q/WN6pttEMQ7Waaqw0zfVU/YStYntj1GVAeZ8ZolPPzJOML0rhTgGkNlId
	VhRpNwmtlCJWTrB1zS8A2zpPkVScCZVMjP/287FTdciCTwaNWr
X-Gm-Gg: ASbGncvVZJ7jF+0lg5KEeWZ9TV95nlFbZa0G8Rgcc35aEru6AgkmpNnSYV/T77adNgk
	Op0rFV3h/+pi2K5jfBbWs1S5nXJUksJmnscabUM3XrfJBwOWJC+XP5Z42zR38ZCHKzmAxnKqsRe
	VEn7z0KT13mqwBBetneBDYe9JfQGq+oYAszngdD2UQk4XbqXqDrMYO3xAKQ6dR3NYaGNvnho34H
	9I53bWa4SfbCNgm/WHJddiiazAA7gG4VtI0ddxUiR3QVDpS6u/LznDFRX72vZO/1QNhGdVqiOOp
	8gDlgKHs88007x9rRVMXwpFX6qHrxG53dMqfTcwxR89zGXKkyESSe4892U/0zjnv3mmm3UaYXXO
	91gX78c7R6Wl32VpURidDrrmAPmhxxRQrQtKLjkht1e9w5EnSbEOfaxDbovMCxfXBttlyqcvdlb
	b7OWHmyP+md/JtwVgToh8EHerq
X-Google-Smtp-Source: AGHT+IE3mZ1pDMoM0A4+UAuhqoUzf1LRPl16274kfHxZ9HphYG0lacTbT7DhyNXKEL5Jauq+m/APVg==
X-Received: by 2002:a05:6a00:23c4:b0:7a2:77b9:52eb with SMTP id d2e1a72fcca58-7a277b959c6mr8731655b3a.26.1761383912035;
        Sat, 25 Oct 2025 02:18:32 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:31 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 2/7] include: sbi: sbi_platform: add reserved_pmp_count field
Date: Sat, 25 Oct 2025 17:18:06 +0800
Message-ID: <20251025091811.506511-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251025091811.506511-1-peter.lin@sifive.com>
References: <20251025091811.506511-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021833_038271_068FA629 
X-CRM114-Status: GOOD (  10.14  )
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

Add reserved_pmp_count field to struct sbi_platform to specify the
configurable number of high-priority PMP entries reserved.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_platform.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index d75c12de..a42b88b4 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -31,8 +31,8 @@
 #define SBI_PLATFORM_HART_STACK_SIZE_OFFSET (0x54)
 /** Offset of heap_size in struct sbi_platform */
 #define SBI_PLATFORM_HEAP_SIZE_OFFSET (0x58)
-/** Offset of reserved in struct sbi_platform */
-#define SBI_PLATFORM_RESERVED_OFFSET (0x5c)
+/** Offset of reserved PMP entry count in struct sbi_platform */
+#define SBI_PLATFORM_RESERVED_PMP_COUNT_OFFSET (0x5c)
 /** Offset of platform_ops_addr in struct sbi_platform */
 #define SBI_PLATFORM_OPS_OFFSET (0x60)
 /** Offset of firmware_context in struct sbi_platform */
@@ -179,8 +179,8 @@ struct sbi_platform {
 	u32 hart_stack_size;
 	/** Size of heap shared by all HARTs */
 	u32 heap_size;
-	/** Reserved for future use */
-	u32 reserved;
+	/** Reserved PMP entry count */
+	u32 reserved_pmp_count;
 	/** Pointer to sbi platform operations */
 	unsigned long platform_ops_addr;
 	/** Pointer to system firmware specific context */
@@ -211,7 +211,7 @@ assert_member_offset(struct sbi_platform, features, SBI_PLATFORM_FEATURES_OFFSET
 assert_member_offset(struct sbi_platform, hart_count, SBI_PLATFORM_HART_COUNT_OFFSET);
 assert_member_offset(struct sbi_platform, hart_stack_size, SBI_PLATFORM_HART_STACK_SIZE_OFFSET);
 assert_member_offset(struct sbi_platform, heap_size, SBI_PLATFORM_HEAP_SIZE_OFFSET);
-assert_member_offset(struct sbi_platform, reserved, SBI_PLATFORM_RESERVED_OFFSET);
+assert_member_offset(struct sbi_platform, reserved_pmp_count, SBI_PLATFORM_RESERVED_PMP_COUNT_OFFSET);
 assert_member_offset(struct sbi_platform, platform_ops_addr, SBI_PLATFORM_OPS_OFFSET);
 assert_member_offset(struct sbi_platform, firmware_context, SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET);
 assert_member_offset(struct sbi_platform, hart_index2id, SBI_PLATFORM_HART_INDEX2ID_OFFSET);
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
