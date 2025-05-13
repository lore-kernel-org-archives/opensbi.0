Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7936FC3ABC3
	for <opensbi@archiver.kernel.org>; Tue, 13 May 2025 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HFqpwe6ZEVdpr4M4KWZ2jsdy5H034lPsG/g/ZQIoPrU=; b=NlKKV+16PqSkIb
	rTf+KJsRcS4t1sdFANS/aHrZBx/hWrECzkPPKPfHtl3Xr77VWiTCwKOOQpExNLHAsou+eNzOtYk1u
	POq9qYYQ84cp3L8LdWJLX3z7QCNjffqEFMymwoVxCjTS+hDgMXhrLIkoMSI3+YPqFshQMqxartc/2
	5Z04p1NusOUghY3a4h93/BkPX3k68sW7SV7mUb3K4yNFZDBWOzgcVa6d+4ueM90HtFksoPcdgryIq
	0LxpI9XEG3rdY2lL6oBqZRG3yPEFD4He0bHuFLTh5wHdkaX13Gm5GXOfkTnpuXx2uQRX/7wgu7oOZ
	a9IvMZCeNQhwStOGaLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq6F-0000000CY3g-39Rw;
	Tue, 13 May 2025 13:55:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpsU-0000000CW9W-2uDE
	for opensbi@lists.infradead.org;
	Tue, 13 May 2025 13:41:04 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7415d28381dso4636505b3a.1
        for <opensbi@lists.infradead.org>; Tue, 13 May 2025 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747143660; x=1747748460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlWrO2hF5BAV3U9zo0SorwTDzpVvf5oYAlFINeHpBrM=;
        b=kiUANnfKzANuTJi05AnA/30jugZbC8GJqTEa89kJ7XhHa4mSdSmu10X7pyihPlSCs8
         ZF9S4P04u7IiylXz2Cgy0D3yZrC5ReLPGVl3JP3YVbgCk0KurGuOOoR71TZl/DM6jh8M
         K+4lNnzKshlN1PiF6vUtEoK3i1e1FheqUS5WZvunsumGV2iIZKXj81WXEntclY1Sihme
         +KwfK33E6bbi1YINQA6rlS56HYf9um0SMhQ/Nn0ThF5+dPTME9xTlzyl7R4YnWdN+xzg
         F6WxgbGuK+HKj9+o33m6K2W9Q4UTtP7LDbziNiDhZHftyG3bb3T5ytSIsFpDRSkdFmQq
         cu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143660; x=1747748460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlWrO2hF5BAV3U9zo0SorwTDzpVvf5oYAlFINeHpBrM=;
        b=XcVkXqXU1gk9BkjRS9dnBzvmXQVDvepnmGIJ6Ddqf0iXL1fF9t//zhFnKPY+KFp7Oi
         k4p+N7g5bDqxMlppyroqssJrBaHqIw5U2qkx/wCOLcDOi9HZkBq+oOJt2Qe9+QmXTeQc
         qtp/uYiCj4Eoe+aCBWqZEHHcilL/+Ke9mVDegeOKsLRMsQbNP7mB0TMu1TAFy2CLxYM0
         wrWWNofpdfFY/ZrEf6K/CBi7JXfGC1I4uTD8WwSFK5NFZAY6gqrMsVBTKsB3Z4jbHtEs
         8duOeJoDthLb28S9xRe0N2zZRbdnaZtj70HAXVZor9E3PkDF9T7Y5RbdQ/PdM9lSqtrW
         PaQA==
X-Gm-Message-State: AOJu0YyvI4vkaI0kiomUByQ7hX4v5pA/dCpNaOHRbG/We2Pm8sYXLlzg
	mFqwEp5fNeKqUL58JKiotgp5hTJgJOsuE+iao1bCP7ql4Hsu8LhWL0oddhEA
X-Gm-Gg: ASbGncvWPonBJCX82l3AuC6CrmSkTVdQ6O/0DmbnztBapz89cU9no27q2+tH3tPZ3v5
	gDW+FfoOmaxVB/7YT3N0n7gppiI69bF9Hdfwf9B9l5/CU7PEiEqPUH6x92oVVTWVnyj71kahnqt
	RDzoiG8ymybAwH+HA/tV+R4p2ovRYU5/K2nQFUN/5YAuSMPJbHEAzt16yH56HuXUdTLHm8m6B6q
	wyFg55HkjHIghRU5QXBef+MUdTtV4kl2kFbhYp+utwsEDmz1i2u88rYGakLPXNHkEbZd7MLQzle
	3E57p5bU6rEasUuuL/Uv607WLS/aUJUb1Q4v8E44sWgYXo12OmR1oLkax3ZRWLowECRdmuOG07w
	eklgL
X-Google-Smtp-Source: AGHT+IE+UwRpMNlmLnH4iDjhJ5tt/4phVyCa/XNHoA8YowNaHqCgJGwjQ6gNlRJqPHjpO5akTPsb9w==
X-Received: by 2002:a05:6a00:148a:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-7423bc1d435mr21279017b3a.5.1747143660449;
        Tue, 13 May 2025 06:41:00 -0700 (PDT)
Received: from JRT-PC.. (bb121-6-174-130.singnet.com.sg. [121.6.174.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237761069sm7794413b3a.76.2025.05.13.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:40:59 -0700 (PDT)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [PATCH v3] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0
Date: Tue, 13 May 2025 21:40:54 +0800
Message-ID: <20250513134054.80863-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_064102_734101_0FF1D481 
X-CRM114-Status: GOOD (  15.65  )
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
---
 lib/sbi/sbi_pmu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 5983a78..353a8f2 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -206,6 +206,12 @@ static int pmu_ctr_validate(struct sbi_pmu_hart_state *phs,
 	return event_idx_type;
 }
 
+static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
+{
+	/* Do a basic sanity check of counter base & mask */
+	return cmask && ((cbase + sbi_fls(cmask)) < total_ctrs);
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
