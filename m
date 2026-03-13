Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF681106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OMTSMDBVzFlPGD3XcjNtsAFGyQBCnzmBas7a107q1I=; b=Aas4YAdil8vv8/
	ZbiDyT9YZ79A9mtfL88NbM2a5HpFOm3nH2lz5+cQ2jIxVVrt6Ehev2WKiuTsMoyWfWqKVMmAK5T1Z
	Y7z28W0vL0K1Sbg/Xy7NjzYe5Qa05k5zytsrtxCRA6XmEn5I58u9hD9c0JneaM7TBOxdiU0KaM6/P
	EVoXIW8GL44Vx36V70+y/qlM6nu5gIGuxBuytzErCzTiB2sV2iEHMtII0HzXXXPMbyb7VTfPUZJ+p
	YGN5FlBwCRacOHnBWCVPqagHGCi+PINNNzOYX3gVTJsLunrCAj23h0s60rIPkbADDPtNlZh9WiYxl
	/MNVBMAw7b17a++yzvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxZ-0000000GcnU-1Vwy;
	Fri, 13 Mar 2026 05:21:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxW-0000000Gciw-2sq4
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:21:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35a0b413684so1159732a91.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379273; x=1773984073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iqQsWjyQu6dFKUd91bH5hf+3HC2aCllTDvFdmj/EVY=;
        b=YC3ZtJGfSaTDnvc59A6SLNrvP4Y3H3uPdEU6P8/2pYdr/PNG5ivbQimzMbCc7xYRt6
         sJALsoJBxVeS/qM04Svr9pa+19Pz7AHkZZ/vBCWe5ka2n+zegg92elG/hwlPH3Ni6dTI
         /VFAYHtrQco6lepiKUEUVexd/trk555He1IK407x9GwFreNvZjieVV/KyY4zR+HwRguV
         eREUs+l7Z5avy07nV0F2Je0wL8OZEcQhXuprB0oq26X0U7Et9NS6Ty15Xm/gbp9GlNDE
         lPQr4lgYtxe6cNhC75WP3/+wVpZIRKZL95UQ5wUdruy4XJTiKeVv8Kgz1WSCKSrWirg3
         k9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379273; x=1773984073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6iqQsWjyQu6dFKUd91bH5hf+3HC2aCllTDvFdmj/EVY=;
        b=VwfXCotWuObCU77CCArw6yjVPB9USUDWdVSnYUsLA9mGi6GcxU7tJcGZzdofq6jpD/
         9l+BlXVa1H/aDkcALkUV9lt/gy9ub/uRsq19p9HSgmRd4wUjRgftFksG4Il8QxjByQlG
         e2pfFdQMnD4zZ8oVlcBjjAQmKkOXy9bbvpjecUVfovBglUr2O9fBWyB4nKAHzZQ3MtqM
         ggG7Cy1CsylQPxr67uNlbvVobKlFsJAiJIhtGZR6/gEVE8FU8Pjk2NTNbjtnHctqger3
         pRp+v2AXpuIVODIqho6h89LoLhAn6UIrb66YlhlhJOnjUeuzzLoVhJZK9Mca422zlIZ/
         ChgQ==
X-Gm-Message-State: AOJu0YyuqAXm/lNsiKypkyV2STmCkK2WNgU8L1zYJ0Jl9YOWg7qxFqN0
	asqwmfQbEq/XrQMIbjzuEPPJ9BHfAkMI7OacSSwn+9gHcBcN5LLVevv/1eR2/g==
X-Gm-Gg: ATEYQzzr+8v7LWSssgoaPMbXrwy4+3rBRwygJg9qaUwCgvmClidSLyhIKFvqIXMXlCs
	41KSOe1Qa+mI2toK/5br8jOdGv6NJiH3HPlsOxQXJ2GzMCkSLipKOPlg+oLOQW170QVWbXYiry0
	oPY8fePHruVwtXXwXNN2G0iN+5yfjz+fje6YNtlPlfe8MJnjPRmtxDkztkuac9bFbmZzOczvn/m
	78SFm65NxjXSUALiu4pNA6gCjD0D6zDeVRV1o/hYsOpnRkfI6fMw4OR7YRJrvnQVynbM+xj4gex
	7yjFPukXgRZyn6KLMJmgo6TN+Ct+mMfu2GKECJ46GJkNdmy7V9qJqCkZ96ypQiGNX9fa0rr516w
	ggTOWskoaPCcK/Wu76M4bfy9GHBr/k2XRunTfaecwy9zwHDaWD46RDdsc6YEHv8kh0NgkYFuur5
	Tk5+LKY1GlRs7UpgX9eAEwBXZzPYexXuLuieidlRIvkOr/MOWQvdaJA6undZiXh9fem1AD
X-Received: by 2002:a17:90a:e7d2:b0:359:f141:5edc with SMTP id 98e67ed59e1d1-35a2205569emr1812806a91.28.1773379273322;
        Thu, 12 Mar 2026 22:21:13 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:21:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 17/18] dbtr: Heterogeneous access type matching for mcontrol triggers
Date: Fri, 13 Mar 2026 15:19:46 +1000
Message-ID: <20260313051948.4017134-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222114_739004_A5EB87EA 
X-CRM114-Status: GOOD (  17.49  )
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

The Tenstorrent Ascalon core has a set of mcontrol6 triggers which can
match load/store, and a set which can match execute.

Detect access types supported in mc/mc6 triggers by writing 1 to
load/store/access fields and reading back the result. Unsupported bits
read back 0.

Account for this capability when allocating HW triggers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/sbi/sbi_dbtr.h |  1 +
 lib/sbi/sbi_dbtr.c     | 77 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index c0b9369e..16407f34 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -52,6 +52,7 @@ struct sbi_hw_trigger {
 	unsigned long index;
 	bool inuse; /* Allocated for a DBTR trigger */
 	unsigned long type_mask; /* Types supported by this trigger */
+	unsigned long mcontrol_rwx_mask; /* rwx match bits supported */
 };
 
 struct sbi_dbtr_trigger {
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f91a2b0d..f3186993 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -60,6 +60,15 @@ static unsigned long hart_state_ptr_offset;
 
 #define DBTR_SHMEM_MAKE_PHYS(_p_hi, _p_lo) (_p_lo)
 
+/*
+ * MC and MC6 type and access fields are the same, no
+ * point duplicating this with MC vs MC6 accessors.
+ */
+#define RV_DBTR_MC_RWX_MASK						\
+		(RV_DBTR_BIT_MASK(MC, LOAD) |				\
+		 RV_DBTR_BIT_MASK(MC, STORE) |				\
+		 RV_DBTR_BIT_MASK(MC, EXEC))
+
 /* must call with hs != NULL */
 static inline bool sbi_dbtr_shmem_disabled(
 	struct sbi_dbtr_hart_triggers_state *hs)
@@ -90,6 +99,19 @@ static bool sbi_hw_trigger_supports(struct sbi_hw_trigger *hw_trig,
 {
 	if (!(BIT(type) & hw_trig->type_mask))
 		return false;
+
+	switch (type) {
+	case RISCV_DBTR_TRIG_MCONTROL:
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		if ((hw_trig->mcontrol_rwx_mask & tdata1) != (tdata1 & RV_DBTR_MC_RWX_MASK))
+			return false;
+		break;
+	case RISCV_DBTR_TRIG_ICOUNT:
+		break;
+	default:
+		break;
+	}
+
 	return true;
 }
 
@@ -180,6 +202,7 @@ static bool sbi_hw_trigger_probe(int i)
 {
 	struct sbi_hw_trigger *hw_trig = INDEX_TO_HW_TRIGGER(i);
 	struct sbi_trap_info trap = {0};
+	unsigned long type;
 	unsigned long tdata1;
 	unsigned long val;
 
@@ -204,8 +227,6 @@ static bool sbi_hw_trigger_probe(int i)
 
 	val = csr_read_allowed(CSR_TINFO, &trap);
 	if (trap.cause) {
-		unsigned long type;
-
 		/*
 		 * If reading tinfo caused an exception, the
 		 * debugger must read tdata1 to discover the
@@ -227,6 +248,51 @@ static bool sbi_hw_trigger_probe(int i)
 		hw_trig->type_mask = val;
 	}
 
+	/* Probe supported features for each supported type */
+	for (type = 0; type < 32; type++) {
+		if (!(hw_trig->type_mask & (1UL << type)))
+			continue;
+		csr_write(CSR_TDATA1, 0x0);
+		csr_write(CSR_TDATA2, 0x0);
+
+		switch (type) {
+		case RISCV_DBTR_TRIG_MCONTROL:
+		case RISCV_DBTR_TRIG_MCONTROL6:
+			/*
+			 * Set an MC/MC6 type trigger with load/store/exec bits
+			 * set, then read which remain set. The implementation
+			 * should read back zeroes for unsupported bits.
+			 */
+			tdata1 = RV_DBTR_MC_RWX_MASK;
+			RV_DBTR_SET_MC_TYPE(tdata1, type);
+			csr_write(CSR_TDATA1, tdata1);
+			tdata1 = csr_read(CSR_TDATA1);
+			if (TDATA1_GET_TYPE(tdata1) != type) {
+				sbi_printf("DBTR error: Hardware trigger type could not be set\n");
+				/* Disable the trigger type */
+				hw_trig->type_mask &= ~(1UL << type);
+			}
+			hw_trig->mcontrol_rwx_mask = tdata1 & RV_DBTR_MC_RWX_MASK;
+			if (hw_trig->mcontrol_rwx_mask == 0) {
+				sbi_printf("DBTR error: Hardware trigger type has no access bits\n");
+				/* Disable the trigger type */
+				hw_trig->type_mask &= ~(1UL << type);
+			}
+
+			csr_write(CSR_TDATA1, 0x0); /* Reset tdata1 */
+			break;
+		case RISCV_DBTR_TRIG_ICOUNT:
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (hw_trig->type_mask == 0) {
+		/* May get here if the above "impossible" conditions are hit */
+		return false;
+	}
+
 	return true;
 }
 
@@ -917,6 +983,13 @@ int sbi_dbtr_update_trig(unsigned long smode,
 			err = SBI_ERR_INVALID_PARAM;
 			goto out_unmap;
 		}
+
+		hw_trig = INDEX_TO_HW_TRIGGER(GET_TRIG_HW_INDEX(trig->state));
+		if (!sbi_hw_trigger_supports(hw_trig, type, tdata1)) {
+			*out = _idx;
+			err = SBI_ERR_NOT_SUPPORTED;
+			goto out_unmap;
+		}
 	}
 
 	/* Update triggers */
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
