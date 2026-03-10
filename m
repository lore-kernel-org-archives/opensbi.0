Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF8BFD4F17
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo1icnHwtUggPBH8sDytLX/FAvlFONqxKuRW49rJ+Es=; b=bQ50WdHv7qY2Pp
	TKQTERWXgifcnRIydKU3CJCj7/37tyMkK3B9FX1oPvslo7W1lIqfSlnN7xMh4y6D3ofhcInBf1MBN
	GWLBfgHIANQxJdk5hw6JERxUXjV5of5H7lOnnoPIK/P+aIediaQd5MpPSiRvWBEhq25RAwXsI95Ub
	ZNAwAwgEpDTouXip72Pl6kiRP6v6vYONYWPdg2AbRyjb7qAOGHUDXKXeOVh5X7+T/YO7MBvSuLDqs
	v/eW/uSmOsnrf8tURCplGPer5Fy9zYMtk5YGqjWNE+YXsVr6kjvo+L5djrj1Go/8VSOwHZd6T6e8K
	T1Drbfd6f/ZbIoWDEMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tf-0000000A5Cj-05pw;
	Tue, 10 Mar 2026 18:33:35 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tb-0000000A58e-26WE
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:32 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2be7ded9477so53397eec.1
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167610; x=1773772410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUkQPmf6gnyjWeQQvwnq/POSi/sgon0zrklf55tZsMQ=;
        b=dfDNIH5Vg1UI7QQg9DSK5iDrMH9oancWtzTUmDSPCkWbegtSXAq8u7ZiSYZuBVEA05
         6KoA55HFgX38v1wua/3wXj/PsZixYzr+svvZxRJjJwcBJhZT0xDfPn4kQT6KeekUVTtj
         nZksfJGB8cMd2qjYNfk3xGHwxtoamcH/fxQikHiuj7EeKLeufeqJxccjiLXzG2sI3hGk
         v4Svxrbq26VdHVJMGLjH5TSOq7BCOfgHStCr1Ru5wnj8QVaPV3i+sIBh86eXUQB0s2pJ
         KfuLknC6zuFcoOT1dHtYMjLBsdpAcFiDiqC5jZUkYy+uNVYEW2DNCYHeckDDQ8jK0MLx
         65vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167610; x=1773772410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tUkQPmf6gnyjWeQQvwnq/POSi/sgon0zrklf55tZsMQ=;
        b=M442O+9BG50mNmkoZttcvSN/9i6BeIILyJ6zE2Hm3dNfytgjYMJHldgMTUq6AZbTCn
         6Wy0bxUYnIE2cs63///drKmF0xrcaSRfPCPfEaAu51rS3S3tv8/KA/rO3flhdlONIRKH
         OoAx7m/OE9DxRUXjMIehmP/H3ifE7xSrHnN+ja8LArJpdD1N3qmKHqwHOJfXifwyOk6V
         qoaKqwqZ2eq3Ptlfz69vQQfmYdN8Xj8aTALegBnus0MxfHpHtvSRXueUVdc9Aeyw9+U8
         yEi4buRBMsZoUsAb/lmxmhcJoKgmm7GWq+M7R8KfeUoRMJ91YfK+PrqC+v+DmwU3TUAU
         I+Ag==
X-Gm-Message-State: AOJu0YyDk/zR3u6nJz7xHgkvtJCUtEjaZSd0wfsTXqnhcxyWT6dt64Vc
	4W2qiF2fQG00O+CSKBm9KUQwWwMH/t260Gl3uf+61Nn977lcHwCEM32gp9QIse8wxapB6Rx0hfA
	zAHJjEEo=
X-Gm-Gg: ATEYQzzpydkU+69jSy6MJH1Lw5Du+XIHZLVsJzNE0uQ4JvjpOv6COi+qcmrtE47K8Bk
	ug8hk3a23wE0CTY7lFsTQXpO6Tq5je/R1WKypzqT2CZDPW/C1wXgFff3GRn79fESPqAZL6Udv9E
	jVoiP9qhhmnqXB5sLWGVR3X788sQ8i9c38hz1FGLrdXpDXeqjDQdgXfE87fhnIrCDr5FctbsfCz
	PZX2V0Z/sTSdTlvnA5wgTcJvNZ6Z9D08pQiyo54PtxJqaN8ZvoHKC4KhIDroqAjhR0mKvmi2mMq
	ghItbO/WQp4zboTCOI0fkzq2zm3sjQp9LtQRywbncPKNimhOIvPpGEsLp8LERp6I1d/DRCEgBG3
	pmiNiJvEGJAC8N+vQCZkgfBKrSd2xQYhX64Khd8CqFQfmf0vOI9CDhYKXAD1kwhntEGwvRajDZJ
	zKPJSyvZ50BJG2Xrx5re6kX4D9LuQ=
X-Received: by 2002:a05:7300:3e96:b0:2be:7eb2:2ed3 with SMTP id 5a478bee46e88-2be7eb23bd2mr563845eec.1.1773167610237;
        Tue, 10 Mar 2026 11:33:30 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984cf5sm15622976eec.33.2026.03.10.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:30 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 6/7] platform: tenstorrent: ascalon: Introduce Smrnmi handlers init callback
Date: Tue, 10 Mar 2026 18:31:54 +0000
Message-ID: <20260310183155.2186463-7-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113331_547774_B21DB94F 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Evgeny Voevodin <evvoevod@tenstorrent.com>

This provides a generic method for Ascalon-based platforms to set up RNMI/E
handlers. NMIVEC and NMEVEC MMR CSRs should be written by each hart
accessing its own offset within the MMR region. Platform code will
provide a base address of MMR region and the rest will be handled by
introduced generic tt_ascalon_smrnmi_handlers_init() function.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 platform/generic/include/tenstorrent/ascalon.h | 10 ++++++++++
 platform/generic/tenstorrent/ascalon.c         | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/platform/generic/include/tenstorrent/ascalon.h b/platform/generic/include/tenstorrent/ascalon.h
index 5d7b7635..91def5fc 100644
--- a/platform/generic/include/tenstorrent/ascalon.h
+++ b/platform/generic/include/tenstorrent/ascalon.h
@@ -9,4 +9,14 @@
 void tt_ascalon_discover_pmas_from_boot_hart(void);
 void tt_ascalon_verify_pmas_nonboot_hart(void);
 
+#define ASCALON_MMR_NMIVEC			0x20
+#define ASCALON_MMR_NMEVEC			0x28
+#define ASCALON_MMR_HART_STRIDE		0x10000
+#define ASCALON_MMR(MMR_BASE, MMR_REG, HARTID) \
+	(MMR_BASE + (HARTID) * ASCALON_MMR_HART_STRIDE + MMR_REG)
+
+
+void tt_ascalon_smrnmi_handlers_init(void (*rnmi_handler)(void),
+			void (*rnme_handler)(void), unsigned long mmr_base);
+
 #endif
diff --git a/platform/generic/tenstorrent/ascalon.c b/platform/generic/tenstorrent/ascalon.c
index 485144cd..889923e5 100644
--- a/platform/generic/tenstorrent/ascalon.c
+++ b/platform/generic/tenstorrent/ascalon.c
@@ -4,6 +4,7 @@
  */
 
 #include <sbi/riscv_asm.h>
+#include <sbi/riscv_io.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_csr_detect.h>
 
@@ -51,3 +52,13 @@ void tt_ascalon_verify_pmas_nonboot_hart(void)
 		}
 	}
 }
+void tt_ascalon_smrnmi_handlers_init(void (*rnmi_handler)(void),
+		void (*rnme_handler)(void), unsigned long mmr_base)
+{
+	unsigned long hartid = current_hartid();
+
+	writeq((unsigned long)rnmi_handler,
+			(void*)ASCALON_MMR(mmr_base, ASCALON_MMR_NMIVEC, hartid));
+	writeq((unsigned long)rnme_handler,
+			(void*)ASCALON_MMR(mmr_base, ASCALON_MMR_NMEVEC, hartid));
+}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
