Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FBCE63C82
	for <opensbi@archiver.kernel.org>; Sun, 25 Jan 2026 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zWOWO7UrgmrC6DDTOufHDAb2g07h8u381Gpx4MozwkI=; b=Izircr0XvT6639
	O3DkAbKmR0ps4KzCXYkCKx9gk3ShPgsoPBHfiHtNq68HK/NDtSoQXTzd9xt+ARNfz6Ipql6wwI3Vn
	zDLLzMDbDOZdtGa3xagx2jZ1PeNQ6LSKLLv0HJ8IDK/IDpYyiW1XS5a02RGspGHqD6S30h4kb+R4I
	X37rHcyHUweN9+3YC7TtwRPm+hFSI+Vj8dlMAX0wblDoYHq1ozniOGuTosKPZAXY8cQUDg0g0dpvL
	MzQd5fR5SiniMSZQL3aPslyIw7vVNEEgRNXSB7wMuKWyaulFDh9sB4LF3pV44cLjuLw83l+nL0+QH
	GuRhfZTdcv+Y/Gxhm5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjw5B-0000000B1Ne-0uMQ;
	Sun, 25 Jan 2026 09:06:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjw58-0000000B1NE-2S5o
	for opensbi@lists.infradead.org;
	Sun, 25 Jan 2026 09:06:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so39517805ad.2
        for <opensbi@lists.infradead.org>; Sun, 25 Jan 2026 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769332012; x=1769936812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tAfO30pXEUo6pNWrWQ0nQn6kFYSXi13lult25YXYSEA=;
        b=Uxfi+XxNdO75pNPFaj5m05JPex/+LxQAP537nm6v1YbWJlpe3VBT42mu+/YY1HR1Gh
         Jc/H+45BhPn8U61oOp6H3gPyaoHt3r3h9cTwUdkSXYiKzUKvAezTXdboJLCaUNfNjUZY
         lchj8Bd/8OOFUMZ5zYLzBhr5nwlTrTN9Q9lMjz7OmPEIbc0nSC0+i/S0fvOH/So+a5Z7
         W/uWa6M9nhRjORJG+2ro9wGbui7e5ExYuGbCmLYw+bHDfN93TjguUgXy1JzN2EJwnTim
         cHrEfa5uYbAN/Xf+KNW/xQfXcvb0Mcz1H2Nv3hHnFnUGDCUDBOdDUHqcrqqk8NAjz6z9
         6+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769332012; x=1769936812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAfO30pXEUo6pNWrWQ0nQn6kFYSXi13lult25YXYSEA=;
        b=NJ6A/eWjx0zFmir7H5BVQuCIUulFSmLX5y1K8loBbGYP0KPfE0j9BnkwzOPAaDoo/+
         QNkqwmuJEynwFw0kLLBGuDKImZfyUo7OTyLoAMirSS74ze7j3ntvg71iKXtUSp+W0CXo
         br3wGDV2aoGSNI6eSfYPNm7aH0wiF9XQVfrEuvb1YZRylDRP0m++GYApTG4uTSlrBuw3
         xWsQ1ShlGawFdUa6FEcQMMtobGtXKytO9qPFnMHWljsv6uMo2hS6WSdG0gM9iRmpGXdc
         XmDn6d2O8ypxLjLdO9dA2Pciy5dIl0plXeSAFrqBbneKTajVfrVamhQ9Fj0zUjWeWyZn
         1PsA==
X-Gm-Message-State: AOJu0Yw29y+6f8+Z/GqqKSUEZocBLRQPFUAbpSlilSm6w2VOyZyXY7aO
	GSM0biB5gvpff2Ebibt85YPtFv2B1MWqPnfdtkt6dSlMHAcQMs7MIQG42kwsRQ==
X-Gm-Gg: AZuq6aLBuuTXrc5pO/qo9JOyENKPAyWuCH3yOggbFFFwIHU+y8I42UllqP/hj1RYLS9
	CnYxzYcaQ0vLeiAVmLARUtq/el665FqfCnjgYYmdJBHiQVefmuKfiJ8qJ8tf77LtXjwztkpV1As
	6B1/r/lqYi1sLm7rUS2rdrupjY7cFFF59ASLRJMoeC1NprCFklsIsRLHFbKZjWaDoKnMWerMdD6
	9hCD47zgehKkrDHgZqOAgNev+7m2CZtcG5uLyN7DAD5glwkSHDPifxuN1iOrsvOPfET2HGNXcx4
	x3Fs/j7jYHPH4T1VVNqZH6wny9dfKAG/EyZCsG2Woobl5Az0VqpaMKd6101cXwf3wq9kig3293h
	LAc0Xdp3ckg/A9xOSPfBRXQr1Y8A8caSK2kLdwFJV0TTR9+awWVKcntHI5ThOOA8WpXOb1h1lqn
	lXuZQY8WgAusC3s8tPXIUn1clOEco02J+Oa/8d0tC5FRr3daRbug==
X-Received: by 2002:a17:902:ce83:b0:2a3:ec72:f462 with SMTP id d9443c01a7336-2a84523fa94mr9820325ad.25.1769332012495;
        Sun, 25 Jan 2026 01:06:52 -0800 (PST)
Received: from JRT-PC.. (bb121-7-149-229.singnet.com.sg. [121.7.149.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcdb8csm63476845ad.31.2026.01.25.01.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 01:06:51 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	radim.krcmar@oss.qualcomm.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [PATCH v2] lib: sbi_pmu: Add FW counter index validation when reading high bits on RV64
Date: Sun, 25 Jan 2026 17:06:43 +0800
Message-ID: <20260125090643.190748-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_010654_721637_E5E8335D 
X-CRM114-Status: GOOD (  13.92  )
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

Currently, when we attempt to read the upper 32 bits of a firmware
counter on RV64 or higher, we just set `sbiret.value` to 0 without
validating the counter index. The SBI specification requires us to set
`sbiret.error` to `SBI_ERR_INVALID_PARAM` if the counter index points to
a hardware counter or an invalid counter. Add a validation check to
ensure compliance with the specification on RV64 or higher.

Fixes: 51951d9e9af8 ("lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi")
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
v1 -> v2:
  - Implemented Radim's suggestion to refactor `sbi_pmu_ctr_fw_read()`
    instead of adding a new function.
  - Updated the type of `cidx` in the function signature of
    `sbi_pmu_ctr_fw_read()`.
---
 include/sbi/sbi_pmu.h   |  2 +-
 lib/sbi/sbi_ecall_pmu.c |  4 ++--
 lib/sbi/sbi_pmu.c       | 10 +++++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index c0e25f5a..3fff4627 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -136,7 +136,7 @@ int sbi_pmu_add_hw_event_counter_map(u32 eidx_start, u32 eidx_end, u32 cmap);
 
 int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32 cmap);
 
-int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval);
+int sbi_pmu_ctr_fw_read(unsigned long cidx, uint64_t *cval, bool high_bits);
 
 int sbi_pmu_ctr_stop(unsigned long cidx_base, unsigned long cidx_mask,
 		     unsigned long flag);
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 868e8665..41bb1624 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -50,12 +50,12 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ:
-		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
+		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp, false);
 		out->value = temp;
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
+		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp, true);
 #if __riscv_xlen == 32
-		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
 		out->value = temp >> 32;
 #else
 		out->value = 0;
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e084005d..a310553e 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -227,7 +227,7 @@ static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
 	return cmask && cbase + sbi_fls(cmask) < total_ctrs;
 }
 
-int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
+int sbi_pmu_ctr_fw_read(unsigned long cidx, uint64_t *cval, bool high_bits)
 {
 	int event_idx_type;
 	uint32_t event_code;
@@ -236,6 +236,14 @@ int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 	if (unlikely(!phs))
 		return SBI_EINVAL;
 
+	if (cidx < num_hw_ctrs || cidx >= total_ctrs)
+		return SBI_EINVAL;
+
+#if __riscv_xlen > 32
+	if (high_bits)
+		return 0;
+#endif
+
 	event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
 	if (event_idx_type != SBI_PMU_EVENT_TYPE_FW)
 		return SBI_EINVAL;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
