Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA982CA100D
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pagXW+y6yXIMbbP9ZDxlVci2eyQzsAPvCJKLCRMEi00=; b=mbDyw4Mwc4bggo
	kkScPSrTrNQQTYdl45pMCq0TujmCcHHarj3DMItbOFv6Lvg6qv0X5/e5nnU5TFErCbiRh38SD60cY
	q62b4HYV+xeCKA0eUtI3e1LGacEndIn0/OoV16IjRRcDgbBRBR2YcEjVBfIPnlo2AFdOw+OElRC7L
	vGEMlVWt5bmCMmfHuvz5lMmPm/K9CfGmbmcLN+1iWxvaR2WzoEeDiEf+VeDUj8LbNpvJPNZ3b2h0C
	3AwD9vvb2EEKnSQAvrhGtQfGCQySpvzPBcF63odmE4MmDoWOMM55S8NWlyqQTY2Yoe+L9psdWWuVg
	fzIOm7zLQm9KAf2mGCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTXP-00000000rXe-27wo;
	Tue, 02 Sep 2025 16:07:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPx7-0000000HAVm-1LCM
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 12:17:34 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-77246079bc9so2774352b3a.3
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756815452; x=1757420252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSQmfnZuP/1KV/IpygZK5VaNk4AbzLhCfFLzN51JkUw=;
        b=Q6wuMhULb8Bf09iR1J7welN2R3efQDfHiWR3x0fG2TGN+GyCKJx8Qb/4a5LDLkr05d
         CIIdTBm3F86wALdd8wfFMy9dObkMC9fB7tno4RjuVzKqzzFRyQniOrLd+NUXyL4QOYGi
         2GUpLmu2H6Ju74oQF3VEWNdGFKrVOvVuLfRrSOTxXwUHLVZcpTc1swa5W3GvwQHdM6kF
         KiXcg9o48W+jOCDUS3E9VGjKCXO+P0Hb/Xq+Qa9FCw0bDuzjlRZrmqTa1EAIFRt0JfCW
         GYcmWi8bbq3M3QPUzdCBwbnPbScLodvv1+mAM/G+SdB2AcngGhvOsE1ZzNFpJEAoTpYT
         8QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815452; x=1757420252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSQmfnZuP/1KV/IpygZK5VaNk4AbzLhCfFLzN51JkUw=;
        b=VLwNQktXBCnyX6yEhRPOXYEtDL98O5FBoSi45ofa3B8hcKCypYgskfWAaU9EjYTYwL
         Q+ffca/OPvANOJAv5gibm92xSSGM3swRYEp7iZxmOl0QGRB4x5ud2hLsRfbiVcvDKzUt
         G/prvn4DYCcSnAFlXJ5IyIHhxYIYI4pgaMyWL82uO/0lQtTogUb4u3ZS0xQtOMEh+LcU
         UHhlHOJS54cPdM8AJKiRA66HgjQlBKcy1psAPloO8pCgf4ajBJ5uxg+0tPJZzZ+lTePg
         UA2jE4BswtAdL/pw6bfu2jt1JdjNnoH0BgWYsE26rye1XwEw+a4Qy5CPcDVWB25IrPoG
         vu1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgPLGyCQ95hV3NdYIrgmVkcbFCDIT1iZ0VfONQnL2wKuHSJGn9lqqdAgnoGnCYs+t0/RwUVrjT@lists.infradead.org
X-Gm-Message-State: AOJu0YzJrsXBAxN2JQ+8wl0M69fxGTfYTd7kNirwnBCFkOxE+pzg05B1
	us08zpVX/0Ga/L62syjGRToGuTXm9iUQrKDDFJUbcQy+tosZNgO0OoOUa0t7I+QdgNg=
X-Gm-Gg: ASbGncsbCKTswKnc4MmeMzzYuN2cGF7dq8xWkbA+2RWJnGiVMTNOC1sE84zKcurWmJJ
	fCcZLKckBLCFHDBrPRKyG/E417/uOaBUkQ0NIfiRvsnVFdMz9bXLmUC6kplGhW2+l1Uf0Y9FbA8
	snjvfXLdLGFWwqhSIIEC+i2cGqoDGvWXjjEA/Xl55iwMO1bEEu6/xDN1mHi+cnDgZIPPI0CkxTV
	ZNmhbzPlTKXKh7QYyMozfi1HxDnxZwRxUQVzH/CRUZBnLq3tDpgnT8sokig6WR/4ChXC1e/QgFS
	RVqgo9x+j/4lvjKIL4tKh044k7PESHhMHQdDF18c7zIBt/TynUSu/8TpE7hEb9maj8RrO/n2U9D
	c/8nkldsh92c92D99Ka4zzOnKyQ80mHjtMNZc3Cg76ojENDx00ReAbJsNjsJlrQ==
X-Google-Smtp-Source: AGHT+IG8ZrMlAqhbHQWmQ8QBzBam3hXkJElkyeH/UEFxuw2Fn9YuXuT1FTpQdBcvNyH2w8fkgXOlOQ==
X-Received: by 2002:a05:6a21:9997:b0:243:c76d:ac8c with SMTP id adf61e73a8af0-243d6f051cdmr18034291637.32.1756815452199;
        Tue, 02 Sep 2025 05:17:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da8e713dsm14265834a91.17.2025.09.02.05.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:17:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/3] lib: sbi: Introduce IPI device rating
Date: Tue,  2 Sep 2025 17:47:19 +0530
Message-ID: <20250902121721.401933-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902121721.401933-1-apatel@ventanamicro.com>
References: <20250902121721.401933-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051733_361621_0E12E0D8 
X-CRM114-Status: GOOD (  20.19  )
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

A platform can have multiple IPI devices (such as ACLINT MSWI,
AIA IMSIC, etc). Currently, OpenSBI rely on platform calling
the sbi_ipi_set_device() function in correct order and prefer
the first avaiable IPI device which is fragile.

Instead of the above, introdcue IPI device rating and prefer
the highest rated IPI device. This further allows extending
the sbi_ipi_raw_clear() to clear all available IPI devices.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/sbi/sbi_ipi.h        |  6 +++++-
 lib/sbi/sbi_init.c           |  2 +-
 lib/sbi/sbi_ipi.c            | 28 ++++++++++++++++++++--------
 lib/utils/ipi/aclint_mswi.c  |  1 +
 lib/utils/ipi/andes_plicsw.c |  1 +
 lib/utils/irqchip/imsic.c    |  1 +
 6 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index 62d61304..0a9ae03d 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -14,6 +14,7 @@
 
 /* clang-format off */
 
+#define SBI_IPI_DEVICE_MAX			(4)
 #define SBI_IPI_EVENT_MAX			(8 * __SIZEOF_LONG__)
 
 /* clang-format on */
@@ -23,6 +24,9 @@ struct sbi_ipi_device {
 	/** Name of the IPI device */
 	char name[32];
 
+	/** Ratings of the IPI device (higher is better) */
+	unsigned long rating;
+
 	/** Send IPI to a target HART index */
 	void (*ipi_send)(u32 hart_index);
 
@@ -87,7 +91,7 @@ void sbi_ipi_process(void);
 
 int sbi_ipi_raw_send(u32 hartindex);
 
-void sbi_ipi_raw_clear(void);
+void sbi_ipi_raw_clear(bool all_devices);
 
 const struct sbi_ipi_device *sbi_ipi_get_device(void);
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 84a63748..663b486b 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -507,7 +507,7 @@ static void __noreturn init_warmboot(struct sbi_scratch *scratch, u32 hartid)
 	if (hstate == SBI_HSM_STATE_SUSPENDED) {
 		init_warm_resume(scratch, hartid);
 	} else {
-		sbi_ipi_raw_clear();
+		sbi_ipi_raw_clear(true);
 		init_warm_startup(scratch, hartid);
 	}
 }
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index 2de459b0..b57ec652 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -32,8 +32,9 @@ _Static_assert(
 	"type of sbi_ipi_data.ipi_type has changed, please redefine SBI_IPI_EVENT_MAX"
 	);
 
-static unsigned long ipi_data_off;
+static unsigned long ipi_data_off, ipi_dev_count;
 static const struct sbi_ipi_device *ipi_dev = NULL;
+static const struct sbi_ipi_device *ipi_dev_array[SBI_IPI_DEVICE_MAX];
 static const struct sbi_ipi_event_ops *ipi_ops_array[SBI_IPI_EVENT_MAX];
 
 static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
@@ -248,7 +249,7 @@ void sbi_ipi_process(void)
 			sbi_scratch_offset_ptr(scratch, ipi_data_off);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
-	sbi_ipi_raw_clear();
+	sbi_ipi_raw_clear(false);
 
 	ipi_type = atomic_raw_xchg_ulong(&ipi_data->ipi_type, 0);
 	ipi_event = 0;
@@ -283,10 +284,19 @@ int sbi_ipi_raw_send(u32 hartindex)
 	return 0;
 }
 
-void sbi_ipi_raw_clear(void)
+void sbi_ipi_raw_clear(bool all_devices)
 {
-	if (ipi_dev && ipi_dev->ipi_clear)
-		ipi_dev->ipi_clear();
+	int i;
+
+	if (all_devices) {
+		for (i = 0; i < ipi_dev_count; i++) {
+			if (ipi_dev_array[i]->ipi_clear)
+				ipi_dev_array[i]->ipi_clear();
+		}
+	} else {
+		if (ipi_dev && ipi_dev->ipi_clear)
+			ipi_dev->ipi_clear();
+	}
 
 	/*
 	 * Ensure that memory or MMIO writes after this
@@ -307,10 +317,12 @@ const struct sbi_ipi_device *sbi_ipi_get_device(void)
 
 void sbi_ipi_set_device(const struct sbi_ipi_device *dev)
 {
-	if (!dev || ipi_dev)
+	if (!dev || ipi_dev_count >= SBI_IPI_DEVICE_MAX)
 		return;
+	ipi_dev_array[ipi_dev_count++] = dev;
 
-	ipi_dev = dev;
+	if (!ipi_dev || ipi_dev->rating < dev->rating)
+		ipi_dev = dev;
 }
 
 int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
@@ -347,7 +359,7 @@ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
 	ipi_data->ipi_type = 0x00;
 
 	/* Clear any pending IPIs for the current hart */
-	sbi_ipi_raw_clear();
+	sbi_ipi_raw_clear(true);
 
 	/* Enable software interrupts */
 	csr_set(CSR_MIE, MIP_MSIP);
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 9e55078a..23510551 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -62,6 +62,7 @@ static void mswi_ipi_clear(void)
 
 static struct sbi_ipi_device aclint_mswi = {
 	.name = "aclint-mswi",
+	.rating = 100,
 	.ipi_send = mswi_ipi_send,
 	.ipi_clear = mswi_ipi_clear
 };
diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
index 5d085d85..000fe9fd 100644
--- a/lib/utils/ipi/andes_plicsw.c
+++ b/lib/utils/ipi/andes_plicsw.c
@@ -61,6 +61,7 @@ static void plicsw_ipi_clear(void)
 
 static struct sbi_ipi_device plicsw_ipi = {
 	.name      = "andes_plicsw",
+	.rating    = 200,
 	.ipi_send  = plicsw_ipi_send,
 	.ipi_clear = plicsw_ipi_clear
 };
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index 057b9fa7..3c150c37 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -199,6 +199,7 @@ static void imsic_ipi_send(u32 hart_index)
 
 static struct sbi_ipi_device imsic_ipi_device = {
 	.name		= "aia-imsic",
+	.rating		= 300,
 	.ipi_send	= imsic_ipi_send
 };
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
