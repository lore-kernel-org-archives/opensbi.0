Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D631C83F26
	for <opensbi@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vcWdZ9sA5vr4bZOv2OsCu/yWh1RVy2DLDXpqryaV5mE=; b=CtYCvWilUkYDhM
	pxC21XIHxcMbfE/qySjBZHRc3DSl/N/VoF29RlwQ9/loWa4yzRtyf88ZbT2dYichN4mwL7bvjqi8x
	Vb9UeCG9GxeqzrK35ZWcEImFFBq/cVIp1zT/MZO8+LmukVAthEkljE9zCO8n9o9CqbfJDRfAiwEm8
	37/DBzNUjdfCZZBWtYcSpcBpIvcWw2h0TX6zSUhCEwEqluourjRcGuQNC35AtgzmpbnMLXsw2FJ2O
	cTtX7EGM1QmG9U50/BCQZaQfQq8utYY9NFsqrDaBSAqvMCqi7kKSnwwnjLVXy2ohSLrZdtkb5FJQh
	jqGlFKP3DwT+NYtjoydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0oC-00000008DyH-43u9;
	Thu, 24 Jul 2025 18:36:48 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0iy-00000008CiE-27x4
	for opensbi@lists.infradead.org;
	Thu, 24 Jul 2025 18:31:26 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ab6b3e8386so14693121cf.3
        for <opensbi@lists.infradead.org>; Thu, 24 Jul 2025 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753381883; x=1753986683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jE38BOXDk21rQef5rn1+BgUYPddImUeAHVJ7eowcMSQ=;
        b=PBKPB/wAojkfDKjDQnXeO4qTyZHIBqRuipcGCDnvoYPs+sDermcS75YMKjbwmsFmFS
         Lr/BRoU9XN6WIZAMmKlFETm3TfssFKwuFB26DmoadrtQEVIcyNhjQCYhDCHyIZPxQCmI
         kxhYkKBClw5/oG0+3MiC+eOomoijj2TOdQ9VH5sZBoMzyUroDrEsgijUZmQ6Ngw6TYDp
         B77KwiNcCcfy1fXSpCU6pd1b8JrClE0AkRJresiamX9DZsWw3p5ZPF6BLHUkf3+tD3MA
         B83GMUtQs8/FdDwUrWkwwmMxqM4RhCOcX7QfyUFmXYSSHcOcnEF4Kay7VwAPMTVIDS8E
         wC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753381883; x=1753986683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jE38BOXDk21rQef5rn1+BgUYPddImUeAHVJ7eowcMSQ=;
        b=j8hDUn6Ey4vQvGa4TaeSpQDC7GLw/7LcY1KMnjQ+ML7lEqdc/tDMlhDabEki+CZOxC
         XHvN5BWl+KNyVxaiA+iP6LbTM8sSWSaNWs0g1kmw6DmDYRiIehNLOP/rUSnMEI4HjiOj
         I34egTtqwQMjY4l7i93RjYncNMT/Se37iM0McI+JIT0u6U2LZzEQK7gWjKxK56jTCh0E
         K/jlZSM8q6UtgUx0iAVoN3r7WE7WgtJJal2DYjcKoTlxyGnLaovZ21+zZk15nwI8tm6P
         ohd9cVVeIl6JdGVy+rEhp12z9ghWY7tNO2TbrMmujVojruUuLFlxouY88UuQaUvkA4kl
         qMxA==
X-Gm-Message-State: AOJu0Yxmpxjns5xzl3zC99RUmjxIrWNqBSQy70KA1InkWobvLhOVF7IG
	6Kr1xuO2/IpSw6fZgm++Uugq6c0s/0oZedqPHLEcHNxdQC5sz5s646XboeBUcfEuvRG2axCUWHU
	ueM61
X-Gm-Gg: ASbGnculjgCfOIN14iEYxleunMhKB5hMc0/MIR0RMfGf9lSKQQP8JQRGMUipQcCrHip
	lE2tUkHUEKdLjoVoY9LaogrWndTyFP4Uexs/lcktHshiU0DgICwtZm1vr89BXa+iFh5/E2XzlwR
	p8WF2crZWV7k6wwshVuohvCnYmMUzqrc1AEVnxRRisIpfoQrR7quEiK6XSCnz6TcUbl5A8n/Z0D
	cayF5n+DUE4FWGf55cFqT0JJkbqQd8PRo6K+Md3SySM2x85jNRW67agjel9yDhy98vbarxcnVCw
	8cubQfDwc2ccQHM9V0Y3NJtr08VWvqULPYOdKKFMG8pnu1ikN7y6GpMsKAGoUbbII7QAaDJD8Pv
	w5frCgtQyzg8PVrTCMr+NyPLh7NJYNI28Rz0zo7xoIkodTq+2dNX34e/pYLBE17weyc79RIjYj5
	MAwQBokUa3dFI=
X-Google-Smtp-Source: AGHT+IFXcPZAGAPMtQqc5ghOd9H8WDpf5CAQAljV+WgHUtYsOKAtXGxbsHvkPuNxVN7dIm9dsYi21w==
X-Received: by 2002:ac8:5903:0:b0:4a9:e20f:c60 with SMTP id d75a77b69052e-4ae6de75d1fmr126539391cf.20.1753381882585;
        Thu, 24 Jul 2025 11:31:22 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae7e545de7sm14328731cf.50.2025.07.24.11.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 11:31:22 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>
Subject: [PATCH] dbtr: Add support for icount trigger type
Date: Thu, 24 Jul 2025 11:31:20 -0700
Message-ID: <20250724183120.1822667-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_113124_796590_866199C5 
X-CRM114-Status: UNSURE (   9.35  )
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

The linux kernel needs icount to implement hardware breakpoints.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 include/sbi/riscv_dbtr.h | 44 ++++++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_dbtr.c       | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/sbi/riscv_dbtr.h b/include/sbi/riscv_dbtr.h
index 96c7d3e3..e249eaed 100644
--- a/include/sbi/riscv_dbtr.h
+++ b/include/sbi/riscv_dbtr.h
@@ -122,6 +122,50 @@ enum {
 	RV_DBTR_DECLARE_BIT_MASK(MC, TYPE,    4),
 };
 
+
+/* ICOUNT - Match Control Type Register */
+enum {
+	RV_DBTR_DECLARE_BIT(ICOUNT, ACTION,   0),
+	RV_DBTR_DECLARE_BIT(ICOUNT, U,        6),
+	RV_DBTR_DECLARE_BIT(ICOUNT, S,        7),
+	RV_DBTR_DECLARE_BIT(ICOUNT, PENDING,  8),
+	RV_DBTR_DECLARE_BIT(ICOUNT, M,        9),
+	RV_DBTR_DECLARE_BIT(ICOUNT, COUNT,   10),
+	RV_DBTR_DECLARE_BIT(ICOUNT, HIT,     24),
+	RV_DBTR_DECLARE_BIT(ICOUNT, VU,      25),
+	RV_DBTR_DECLARE_BIT(ICOUNT, VS,      26),
+#if __riscv_xlen == 64
+	RV_DBTR_DECLARE_BIT(ICOUNT, DMODE,   59),
+	RV_DBTR_DECLARE_BIT(ICOUNT, TYPE,    60),
+#elif __riscv_xlen == 32
+	RV_DBTR_DECLARE_BIT(ICOUNT, DMODE,   27),
+	RV_DBTR_DECLARE_BIT(ICOUNT, TYPE,    28),
+#else
+	#error "Unknown __riscv_xlen"
+#endif
+};
+
+enum {
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, ACTION,   6),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, U,        1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, S,        1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, PENDING,  1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, M,        1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, COUNT,   14),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, HIT,      1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, VU,       1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, VS,       1),
+#if __riscv_xlen == 64
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, DMODE,    1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, TYPE,     4),
+#elif __riscv_xlen == 32
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, DMODE,    1),
+	RV_DBTR_DECLARE_BIT_MASK(ICOUNT, TYPE,     4),
+#else
+	#error "Unknown __riscv_xlen"
+#endif
+};
+
 /* MC6 - Match Control 6 Type Register */
 enum {
 	RV_DBTR_DECLARE_BIT(MC6, LOAD,   0),
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a832c7f1..c30c2fd6 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -336,6 +336,19 @@ static void dbtr_trigger_setup(struct sbi_dbtr_trigger *trig,
 		if (__test_bit(RV_DBTR_BIT(MC6, VS), &tdata1))
 			__set_bit(RV_DBTR_BIT(TS, VS), &trig->state);
 		break;
+	case RISCV_DBTR_TRIG_ICOUNT:
+		if (__test_bit(RV_DBTR_BIT(ICOUNT, U), &tdata1))
+			__set_bit(RV_DBTR_BIT(TS, U), &trig->state);
+
+		if (__test_bit(RV_DBTR_BIT(ICOUNT, S), &tdata1))
+			__set_bit(RV_DBTR_BIT(TS, S), &trig->state);
+
+		if (__test_bit(RV_DBTR_BIT(ICOUNT, VU), &tdata1))
+			__set_bit(RV_DBTR_BIT(TS, VU), &trig->state);
+
+		if (__test_bit(RV_DBTR_BIT(ICOUNT, VS), &tdata1))
+			__set_bit(RV_DBTR_BIT(TS, VS), &trig->state);
+		break;
 	default:
 		sbi_dprintf("%s: Unknown type (tdata1: 0x%lx Type: %ld)\n",
 			    __func__, tdata1, TDATA1_GET_TYPE(tdata1));
@@ -379,6 +392,16 @@ static void dbtr_trigger_enable(struct sbi_dbtr_trigger *trig)
 		update_bit(state & RV_DBTR_BIT_MASK(TS, S),
 			   RV_DBTR_BIT(MC6, S), &trig->tdata1);
 		break;
+	case RISCV_DBTR_TRIG_ICOUNT:
+		update_bit(state & RV_DBTR_BIT_MASK(TS, VU),
+			   RV_DBTR_BIT(ICOUNT, VU), &trig->tdata1);
+		update_bit(state & RV_DBTR_BIT_MASK(TS, VS),
+			   RV_DBTR_BIT(ICOUNT, VS), &trig->tdata1);
+		update_bit(state & RV_DBTR_BIT_MASK(TS, U),
+			   RV_DBTR_BIT(ICOUNT, U), &trig->tdata1);
+		update_bit(state & RV_DBTR_BIT_MASK(TS, S),
+			   RV_DBTR_BIT(ICOUNT, S), &trig->tdata1);
+		break;
 	default:
 		break;
 	}
@@ -418,6 +441,12 @@ static void dbtr_trigger_disable(struct sbi_dbtr_trigger *trig)
 		__clear_bit(RV_DBTR_BIT(MC6, U), &trig->tdata1);
 		__clear_bit(RV_DBTR_BIT(MC6, S), &trig->tdata1);
 		break;
+	case RISCV_DBTR_TRIG_ICOUNT:
+		__clear_bit(RV_DBTR_BIT(ICOUNT, VU), &trig->tdata1);
+		__clear_bit(RV_DBTR_BIT(ICOUNT, VS), &trig->tdata1);
+		__clear_bit(RV_DBTR_BIT(ICOUNT, U), &trig->tdata1);
+		__clear_bit(RV_DBTR_BIT(ICOUNT, S), &trig->tdata1);
+		break;
 	default:
 		break;
 	}
@@ -441,6 +470,7 @@ static int dbtr_trigger_supported(unsigned long type)
 	switch (type) {
 	case RISCV_DBTR_TRIG_MCONTROL:
 	case RISCV_DBTR_TRIG_MCONTROL6:
+	case RISCV_DBTR_TRIG_ICOUNT:
 		return 1;
 	default:
 		break;
@@ -462,6 +492,11 @@ static int dbtr_trigger_valid(unsigned long type, unsigned long tdata)
 		    !(tdata & RV_DBTR_BIT_MASK(MC6, M)))
 			return 1;
 		break;
+	case RISCV_DBTR_TRIG_ICOUNT:
+		if (!(tdata & RV_DBTR_BIT_MASK(ICOUNT, DMODE)) &&
+		    !(tdata & RV_DBTR_BIT_MASK(ICOUNT, M)))
+			return 1;
+		break;
 	default:
 		break;
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
