Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB343CA0EE6
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u89GucR/UJXEncQajcr9tC9P8CzoUzYS0qvpdp/tcUE=; b=MzDbNkd6npUX5K
	7So3/obEnak8iT83OkV7oPJD7zF0tsMVTwhXGf5AUwDcDlf8mYfuFxHY/1JJdewinw25fx+UmnK8p
	G42OL8h22V3FjtVg71pfndmL2O/mIzMN/6026Ledo6Hq2l/sw6g1zdd2mUKRv94xnElgKwG5XKUQZ
	wAhWJU3tq1WcYN56pz5XVxrU0YnBJvbVVDv9NHiZuVacfgqpM95IdEwQqG920hMaKFHC5yhTS8+5W
	tksmxpSRIdLG8Ly3eRvijCBc3cGMVk1+qW3qGCYyaHqr+tq/qMHbdpR+4E/vade6Ea6zh0pALNpyq
	XQI9bf9fgPGOEShRkwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXob-0000000H0T2-0DjS;
	Thu, 14 Aug 2025 13:16:21 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVqd-0000000GiLY-1JIL
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:10:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32326bd4f4dso786059a91.1
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169818; x=1755774618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S2ZFdRUDrpwVi3dU+S25mVSokB+EkCMIba5CVWe4Zg8=;
        b=K+Fpgn3Jk/ADila0a6zex5X1HqXVAe+qrTzawhz+dUtxIJ4EBaEDJwE/WwnoHL8kpL
         XVrv+yiltTXqEEASFEIxU4a+jhzHPTMJAkiEAs0+z4BAo2aPaF6DVFHgyU1P6ZXDBN8U
         cM38i1qnpSzhyP+ZwVFmriJ/G1EGloi2ZW1X7PBg6AjcUMV9SJCQZBGT1zD7FJHQTVj5
         asoAPT51SQMgO+qmPPkqmKUrfDOrWGX1/3xJ6sseNO5JdUhXKeJnBNWtZEj3RnXTV/j9
         vIVNHUCzY6ofFiU0NwJxG2meDi7uPX7AflwF0dSJuClpOG77wcR/F4CZoWhrK7XBPsNo
         hWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169818; x=1755774618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2ZFdRUDrpwVi3dU+S25mVSokB+EkCMIba5CVWe4Zg8=;
        b=FqJsY/Kddfry17HSgeoMoRB10D0n9oIZmtqfJ/JmlYG1s+gj1VYu+rbhK7AS+K1dyP
         PZIc2E4IN3vVjbI8wAp9jqZ6lYWneFQOTG/FMF7MXxOXsTg1hfuSCuO6VDNhYnmLqgEK
         HyvRdfnetVv4QxVMxWBPEw5mnhfsyCfJljOSgt4tvIgVvke1HciQ4UkHQzg7YT+W0cdv
         dC5ytGSF45ORPYOBqaoKFCKbEV1t6hffsaxohr7t38l3HdUFNlulOSL0ZZzz96w0nwSY
         zVOCbCW1Qdnr+qh2JdVhOMQHEDx31s/9+brnNcSNAe8aiyAzx3TttWLXZHhSBh+DXuG/
         Q/Cw==
X-Gm-Message-State: AOJu0Yzh6dYflt2BCAQ+ZF7xssVMFIKDAIUcOrn4aF2OcH07hNCA1GOx
	igieQt0k+1IcD4sBsk+le/aVN3jVE69WoU3sJRqguBeYy8IpEOhMv9AQUgij6QETMKVUQGMv4yY
	85PGAxNg4NeBTIKA53BRZyL1mNZFW7YpVgEl6DoHMZSwbw0C1PCR8nWtImQSeK0W+TJP7o4v7Ij
	KYsE1cK95q+AJfqUrEpjXNz3oHt/juW/Qcqd+aaLikxy+p44aKzalibQ==
X-Gm-Gg: ASbGncsqfkp6Qe5A2kvr1WD6+qwyKcnWsydLmw4BVue9N3FiYDF8oo8udmqH5D3gKnT
	OmOS9HJWhEpvyr+AUX5WdSQcz0JUKH05DRmoubX2bFtSj8urgqaobAenpxqM8EVyTZqv9BQmiFV
	1HVjkPVFng7hB9f9Dxq0VQW9FWlSJUzeU5TKmkNYHetze8z64jInyu4eqEIYaBESehHBXdvidhl
	atkJfoidxM81sy1LGGe21fUy0SE6GorVBIJus7NlA3lA1eaMXaYvPpvtnZvwN/fbpZdOG0ik6Gc
	mAK09tW6Zc8/6kv3Ctb/SGjBU3GJQ74hFmEnXumWlUwzL7f4V5XZrOIkQtQOc10YY6ThhcMdp4u
	SskXqy2nIaCZaN8SJamd3SHJYqc9XNmjzNxGqY4hyS1LSzL0=
X-Google-Smtp-Source: AGHT+IFKFfZTzi8P9o8qtsDcuDVBo1CBoV6A4uKOG8evZT+bi6eMEXGa5c3U2Bxtz9yTkcgB9Ng7Lg==
X-Received: by 2002:a17:90a:d405:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-32329a72cafmr3140893a91.2.1755169818111;
        Thu, 14 Aug 2025 04:10:18 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233100d06csm1481930a91.20.2025.08.14.04.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:10:17 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH] lib: serial: sifive-uart: add shared memory region for SiFive UART
Date: Thu, 14 Aug 2025 19:10:12 +0800
Message-ID: <20250814111012.20151-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_041019_346027_9CF2E3C3 
X-CRM114-Status: UNSURE (   9.59  )
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

Add shared memory region so the driver has permission
to access it in OpenSBI.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/utils/serial/sifive-uart.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
index 3581d47a..55637137 100644
--- a/lib/utils/serial/sifive-uart.c
+++ b/lib/utils/serial/sifive-uart.c
@@ -9,6 +9,7 @@
 
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_domain.h>
 #include <sbi_utils/serial/sifive-uart.h>
 
 /* clang-format off */
@@ -111,5 +112,7 @@ int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
 
 	sbi_console_set_device(&sifive_console);
 
-	return 0;
+	return sbi_domain_root_add_memrange(base, PAGE_SIZE, PAGE_SIZE,
+					    (SBI_DOMAIN_MEMREGION_MMIO |
+					    SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW));
 }
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
