Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA0CA0EE4
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RHuIGatklZaX2VouBErkBYylKMpWD+3OitpQUXP6jk=; b=SUP2guW6uh0msR
	mk7uWTDGc7PwBYrvYsmw7d0+5+gB9JCoGF/JPG2tZGGmrXGUqM5VO7ly2HLt0KtHNKh+kkFzJo1TW
	DkUiyinF2q9s677o4HlnEStdUT8UM0wKhpGWrWyXSw7dMrUT7l//uIyVsvhWxsTrL/Jl+tVNCvatd
	pXKJt5pgPWy6yd9B8gxLi+Tm72HtP0oPAMpmBm1MLteHn6kZ5fcOi7t6kxRZHW7PH0t0Qx7vq/trv
	sDHLe5Hvd5xONLo+FCPI42nVpAo2gyL8j+Jst0axZPtjLPkIBytghs8+k0/r8i6p/04TS8T7WYo6b
	WgpppscXYR+KEa37Wpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGX-00000002YJ5-44Ki;
	Fri, 15 Aug 2025 13:14:41 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFa-000000028iu-2jb7
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:31 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b47174beccfso1431247a12.2
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252090; x=1755856890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAvl4DTQEK7MqDDgEGC/ZWFZ03DAJSVQvlUq1XXbO3U=;
        b=kHypQZZWBxePNBznnBDJ+J5UjPXXLJjq47ud+f9zks9cECdNhSriuzVPV8Nl4fuQsu
         flOhdbSXYItHIzOXXmkeEMMxjMDNUeD/Vb8Rq2GVJ/gHWzi4Exdce5I/A8pTm1r/oaKN
         p42FcNlkKY0UTBmD+qvDvYu7OcMWaMXc+7KUeSRuGReWyylGBJj6s8tKuzIdHHVxsDCh
         0Re0JcOx5LBMMUr2DWRTyNudyJsTuFCJgrn4GnzcAE/Dywpja8BMbyhFE22hUPx4aQc/
         B1lDnnwa9LMMOEgikEQrGt3e6aPYMiqDbzDZOqnAb38cVaB5zH/Q9AvTlUwGX/9sarXY
         /CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252090; x=1755856890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAvl4DTQEK7MqDDgEGC/ZWFZ03DAJSVQvlUq1XXbO3U=;
        b=TlpNU7Oc6y6NRpcOJ6I/PgUoEreyp1uZlObGTvBppG9vb6XYJm4FTF2PjFvavzWcOZ
         Yso1LeUw/a9VuIwpfsm789yYvE0WkJ1n3GPflDeCt9gG77ibAR76zA9ToD4p/hc7r34j
         ddZM9kgxNDviFgn5AdatFWVIkZc3IURYD5rNLOMig00LKKpldrr8yMT3OIXO4XtwOPEJ
         XbZDsPAfVUuD6Q0ASbC5UAeEFjRzTABB3h3nvcEZb21yDyivC+6zeSGQudFrZvxr1BL3
         V7U/pqURtWSyFU/DpDQ7GYbJtLLWvSRMvPDA+lHNnH9XReqgnsGs1Lh/0kLvfgNSuMl7
         TuaQ==
X-Gm-Message-State: AOJu0YwCkolS8ls+4RH1PuU/lDUT1HBWKt4EEYESXcxepSUB9iuyMDPH
	pA8oU7FNnjZ4bdrxyWCVkxCdyKisQungCvSFNsKKAPmuB5MhG28Yt33TQLjM9nj95LtNbOIphae
	BD+N5mpXGftpDmshrR5/DVOL/XFztEddom7/JFGk5F1svHaAb2u2B5M4Th0AuSdeZbpOMUMZadB
	pPraS/aEYyxoUgjpf2vk1TNKpEEKwxcn/O90iZm/OY7YR9H1KgoNJxfw==
X-Gm-Gg: ASbGncsJ9gxI9/3SO1iwfUwzylV2THdgRFNgTXujW/Z5K9Aj+xBxlx4T/aIaCNQvYc1
	jliIYjXjOTCRjq182syDYJUqkCugNbq0YAdw1AjDnxe7vxcpYiVGtNjkjtlT9jZgO+g1sOk2N4a
	mKHG25Y51XWPL2XYmyBSCZxENIvVUy1WUL3nlT0X6QvFyd8KF5T9qzdoIBk37FTJ/oF+KhgpoRD
	zgZ6Of+Co/D10yi2XFyURuLlhHJAk999fPtoIGAGgxQNn5zrNOSla+5XVoQS8ik/WdDSYZV4iOd
	9yhIEtaT82vG2EZx+p0x6FAs6n/g6jDpcHx0snOHQiod2+PViC8kkKhAPECpvFHwFCHMqCNjclj
	ww/zW0ej9iDhY0NGh5z8rPlJ9LddVdqi8ohHFoqN2vOjObFE=
X-Google-Smtp-Source: AGHT+IHynr2OKREAN0FNlQSRU+wFUTVGdxZHy0iQ5symDNYKXHRoi5Z1UuHl6IQfqxUwLTC6IuR8bQ==
X-Received: by 2002:a17:903:17cd:b0:240:2e99:906c with SMTP id d9443c01a7336-2446d6f02cfmr21361375ad.15.1755252089453;
        Fri, 15 Aug 2025 03:01:29 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:29 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 2/7] include: sbi: sbi_platform: add reserved_pmp_count field
Date: Fri, 15 Aug 2025 18:01:10 +0800
Message-ID: <20250815100116.27776-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
References: <20250815100116.27776-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030130_691657_C3DF3407 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add reserved_pmp_count field to struct sbi_platform to specify the
configurable number of high-priority PMP entries reserved.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_platform.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index c6d30080..e2bf9b77 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -31,16 +31,18 @@
 #define SBI_PLATFORM_HART_STACK_SIZE_OFFSET (0x54)
 /** Offset of heap_size in struct sbi_platform */
 #define SBI_PLATFORM_HEAP_SIZE_OFFSET (0x58)
+/** Offset of reserved PMP entry count in struct sbi_platform */
+#define SBI_PLATFORM_RESERVED_PMP_COUNT_OFFSET (0x5c)
 /** Offset of reserved in struct sbi_platform */
-#define SBI_PLATFORM_RESERVED_OFFSET (0x5c)
+#define SBI_PLATFORM_RESERVED_OFFSET (0x60)
 /** Offset of platform_ops_addr in struct sbi_platform */
-#define SBI_PLATFORM_OPS_OFFSET (0x60)
+#define SBI_PLATFORM_OPS_OFFSET (0x68)
 /** Offset of firmware_context in struct sbi_platform */
-#define SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET (0x60 + __SIZEOF_POINTER__)
+#define SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET (0x68 + __SIZEOF_POINTER__)
 /** Offset of hart_index2id in struct sbi_platform */
-#define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
+#define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x68 + (__SIZEOF_POINTER__ * 2))
 /** Offset of cbom_block_size in struct sbi_platform */
-#define SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET (0x60 + (__SIZEOF_POINTER__ * 3))
+#define SBI_PLATFORM_CBOM_BLOCK_SIZE_OFFSET (0x68 + (__SIZEOF_POINTER__ * 3))
 
 #define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
 
@@ -182,6 +184,8 @@ struct sbi_platform {
 	u32 hart_stack_size;
 	/** Size of heap shared by all HARTs */
 	u32 heap_size;
+	/** Reserved PMP entry count */
+	u8 reserved_pmp_count;
 	/** Reserved for future use */
 	u32 reserved;
 	/** Pointer to sbi platform operations */
@@ -214,6 +218,7 @@ assert_member_offset(struct sbi_platform, features, SBI_PLATFORM_FEATURES_OFFSET
 assert_member_offset(struct sbi_platform, hart_count, SBI_PLATFORM_HART_COUNT_OFFSET);
 assert_member_offset(struct sbi_platform, hart_stack_size, SBI_PLATFORM_HART_STACK_SIZE_OFFSET);
 assert_member_offset(struct sbi_platform, heap_size, SBI_PLATFORM_HEAP_SIZE_OFFSET);
+assert_member_offset(struct sbi_platform, reserved_pmp_count, SBI_PLATFORM_RESERVED_PMP_COUNT_OFFSET);
 assert_member_offset(struct sbi_platform, reserved, SBI_PLATFORM_RESERVED_OFFSET);
 assert_member_offset(struct sbi_platform, platform_ops_addr, SBI_PLATFORM_OPS_OFFSET);
 assert_member_offset(struct sbi_platform, firmware_context, SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET);
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
