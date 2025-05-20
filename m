Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CE9C3DA6D
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lVB1Pe+M7kKHZ/a0QEf9KJ49XJOH3xWv1gD/WZkZH3w=; b=oVWRqifnkEpY3a
	bnYXspMPXp/hOalhEd5dJSPuvFkJpgzfVxNJc2TjPKiKd2QRj/0KAEdsx4Ufs06NUc/vdizRAMl5E
	QVToeG299tCvcHBwja7p57rLVaNo0zanc16a85LA2+xKSfVA1aQj4IL2MEDR0h48rPu1xD88yXkP+
	ZDQpRI+V5Uc6V3xwMaVTcxPJ1gRFHzW7fzzd+ouWynM0r3X/8WCZPwnYlNcLpmB5KK++XGqBP/XC8
	qNXOnXnzKW3FDiwq9zORAcY21e+ft2GuI6h/LWtm0nsDLhlWaYU2JZm2fYrj10ZgK/v6tsfut8Bw/
	S13XGx5GYvKOKDRGsykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHN0W-0000000D0dR-1iN6;
	Tue, 20 May 2025 13:27:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMyT-0000000D0NO-1lu6
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 13:25:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4979306b3a.2
        for <opensbi@lists.infradead.org>; Tue, 20 May 2025 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747747539; x=1748352339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ivc6lTa4H0P1e2K+tjYiYnIcORQlC46taFkZn7jGJg=;
        b=ZQSQIAF4MxdsVuXkRMpC0fo6lsYdhglR7lLLUug2Ef0iXiDLjyyCDp3CIp7p4bLhof
         82crdGvHrhFZtUcB5hHtNP2RZQ2dZ6ytT1xHqrAuj1zwUZgNrgpZdMspgUQm8R9B+h4k
         YMhWa2ZjgnJTvzh4yLz3XUpkEYQQoCLGQsx2VQUSjdgYZBLTGy6CcF4CvrD5CSSgyaCt
         neZFox6hFdPQg6fKHsSDN03RsyKdYirkELJXrSeqkGW44R305xtNmqVscGDHXaOOKXIk
         LLZE+UOxdrdspEiHvRYNiqICLpBDAr9aEBkGaZYVWADQZfaJd2J00WI9bO8hpOTGUkIE
         xXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747539; x=1748352339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ivc6lTa4H0P1e2K+tjYiYnIcORQlC46taFkZn7jGJg=;
        b=KX74dxKJXOR4o+TEIZVN/Qey+SviWHg2AzSym79KsbuF3x++TX1INUVRW+QCm7mhIU
         iGJR4hJsyePDKypIFFHCBGQCtQ7T4hGsJxNQpfSl3/isYMKf0+DvG1Yz8OQgBZ9fTHcX
         ID8i4nd18Q79Gt3ioX63uA8oXi/wZZjTNOT7qS6STfX5zCpnEGCizkmrIWd50KQV4Sdq
         JfYtTaCcU3ZG8wl+QeEk7sWqgrDhiiYuRi7sH4mwirSk9ki82pEejXV1K3p7J3RKtM7b
         csHm+74d3D7sDt8uvCIKMvf4ila/JOD+djC4Ic0Zym0YH8Mm56wE4LjUV1rMPJ/DLV4L
         xWtQ==
X-Gm-Message-State: AOJu0YxjzACHgwlLJGC0nipTZIU/SqqYKDr+y4lWXH0xhUHWjMbLwzSm
	5qugd6kf3yoLaWR8ULksE+BDwTFbxkQ3mc40ixQYPpt3B0xxtNW0DG6rTQEjvxZr
X-Gm-Gg: ASbGnctBzZT+LLPTNF9BnAzeQFQR1Mmih4V/mm2z0BjV+i9JH8hz0XehXbyiAElAT+R
	BIUmpWXvmeHIzNkWDDi2AdxWHWll7TG3KYkwBLPbpHfu0YklvSj3beRPEdQeBMkgwYr16Qo7KIm
	aaha48jBH5OAMfXnPmW5o1+bfxZsIleRsvrMPZrXgq1+pFJnD30fFFLqIMKuQ840EHslZVizrnx
	G6Jo9kgm3nqxf15iNwZQa6WXbjROnNKzVjX6AcgXsO0oUwUy/xeLGg3FgfUDTz5JHbjtMPd8ykB
	wSbVuRgli437qeNUBF/Jxgr9cDDqFE6WVihjX3wFGIu1MCK9wM31SYp/fd/YMUNVAEZ+4nNHlk5
	J+5DdbB18gBvav4Y=
X-Google-Smtp-Source: AGHT+IFSyNg3egctBed0XGci/+eD2VtSmNFACE+PDjrbzomqIZ2dnK+pWsY6p9+sT9+nbPJLo9I9SQ==
X-Received: by 2002:a05:6a20:2d07:b0:1ee:a914:1d64 with SMTP id adf61e73a8af0-216219bd3a5mr26336644637.28.1747747539426;
        Tue, 20 May 2025 06:25:39 -0700 (PDT)
Received: from JRT-PC.. (bb121-6-174-130.singnet.com.sg. [121.6.174.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a9ac9sm7936627a12.78.2025.05.20.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:25:38 -0700 (PDT)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0
Date: Tue, 20 May 2025 21:25:33 +0800
Message-ID: <20250520132533.30974-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_062541_469593_70CDECAB 
X-CRM114-Status: GOOD (  16.14  )
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

Currently, when configuring a matching programmable HPM counter with
Sscofpmf being present, cidx_base > 2, and cidx_mask == 0 to monitor
either the CPU_CYCLES or INSTRUCTIONS hardware event,
sbi_pmu_ctr_cfg_match will succeed but it will configure the
corresponding fixed counter instead of the counter specified by the
cidx_base parameter.

During counter configuration, the following issues may arise:
- If the SKIP_MATCH flag is set, an out-of-bounds memory read of the
phs->active_events array would occur, which could lead to undefined
behavior.

- If the CLEAR_VALUE flag is set, the corresponding fixed counter will
be reset, which could be considered unexpected behavior.

- If the AUTO_START flag is set, pmu_ctr_start_hw will silently start
the fixed counter, even though it has already started. From the
supervisor's perspective, nothing has changed, which could be confusing.
The supervisor will not see the SBI_ERR_ALREADY_STARTED error code since
sbi_pmu_ctr_cfg_match does not return the error code of
pmu_ctr_start_hw.

The only way to detect these issues is to check the ctr_idx return value
of sbi_pmu_ctr_cfg_match and compare it with cidx_base.

Fix these issues by returning the SBI_ERR_INVALID_PARAM error code if
the cidx_mask parameter value being passed in is 0 since an invalid
parameter should not lead to a successful sbi_pmu_ctr_cfg_match but with
unexpected side effects.

Following a similar rationale, add the validation check to
sbi_pmu_ctr_start and sbi_pmu_ctr_stop as well since sbi_fls is
undefined when the mask is 0.

This also aligns OpenSBI's behavior with KVM's.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 lib/sbi/sbi_pmu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 5983a78..6ca4efd 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -206,6 +206,12 @@ static int pmu_ctr_validate(struct sbi_pmu_hart_state *phs,
 	return event_idx_type;
 }
 
+static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
+{
+	/* Do a basic sanity check of counter base & mask */
+	return cmask && cbase + sbi_fls(cmask) < total_ctrs;
+}
+
 int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 {
 	int event_idx_type;
@@ -472,7 +478,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 	int i, cidx;
 	uint64_t edata;
 
-	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
+	if (!pmu_ctr_idx_validate(cbase, cmask))
 		return ret;
 
 	if (flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
@@ -577,8 +583,8 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	uint32_t event_code;
 	int i, cidx;
 
-	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
-		return SBI_EINVAL;
+	if (!pmu_ctr_idx_validate(cbase, cmask))
+		return ret;
 
 	if (flag & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT)
 		return SBI_ENO_SHMEM;
@@ -839,8 +845,7 @@ int sbi_pmu_ctr_cfg_match(unsigned long cidx_base, unsigned long cidx_mask,
 	int ret, event_type, ctr_idx = SBI_ENOTSUPP;
 	u32 event_code;
 
-	/* Do a basic sanity check of counter base & mask */
-	if ((cidx_base + sbi_fls(cidx_mask)) >= total_ctrs)
+	if (!pmu_ctr_idx_validate(cidx_base, cidx_mask))
 		return SBI_EINVAL;
 
 	event_type = pmu_event_validate(phs, event_idx, event_data);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
