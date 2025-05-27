Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5152CC54F30
	for <opensbi@archiver.kernel.org>; Tue, 27 May 2025 18:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y658Jh+0n15CoQxQWKuideQCfotu00HDbFpbbIxI+Jw=; b=xqWyUUS636z77H
	HFhqL+C2otuEnd0kEtMtQU6XMCyvJXyKOhxeHSKCDqTuvOJPmwOZ8vWSGXfXNd8DD71CKB3KqKC/m
	bOV959uIjwNdFy7svQU3D8x1f0Q74+wJXeHjPW359E8GR2xit0L/UZd+MZY7ILxQieKPdNMhFFNK+
	wqmT19PwylRtPbVp2Hc8lr8lWtmt0BiO42gwSTi7M81K/wHR1BrfayKjw9qWpbMZwdaYgawbyeeQz
	WjBpQn+R8rurgHpm3MnJmlf2/nVWkzgZq5wYKdtEornVh6etWOHUZvRnjSfFFMUWPtT8TmdoB2Unt
	atLyWCOzKDbHIapLhOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJz1D-0000000BLl0-0XXd;
	Tue, 27 May 2025 18:27:19 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJz19-0000000BLkh-37xy
	for opensbi@lists.infradead.org;
	Tue, 27 May 2025 18:27:17 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c5675dec99so391089685a.0
        for <opensbi@lists.infradead.org>; Tue, 27 May 2025 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748370434; x=1748975234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJQGJ4w+Q6MYexhX6wbKDQyfm7Dfnuf686feIVXdLJE=;
        b=3HYkwP2ZQ9JMKRBvf5tD2mi4CNEPRZO9slPcKAdZuGJ983SNCES2zxwA9Eou74aQ9o
         dndl+Cvv7AgqMaU8JVoh7amFUoJQ8QfQmh0v98KSVN0FXgAM5IPqBXb8UKu+sq0HXEnD
         NgydanZVsUx3uPgAB7hEe2Ajn4MfQtcwmFEwOqX95ozzifKZ8Yq2Skjj9jErpipohi2I
         J6AIVn3gHUFmmDgwERcCOpQvfV8IuSIJbHNVJJGoaQ808Z6STxfDxH7PveyEIGMCjLQa
         AYBFeDsV7gR8Xgn0YrsQ06MPqNmL+8L3pRhLd8dfOFDQw5PJs6Vul/AMVMmIcwTtPJv1
         KQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748370434; x=1748975234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJQGJ4w+Q6MYexhX6wbKDQyfm7Dfnuf686feIVXdLJE=;
        b=KOYD5+1GBIz/HkX1bXgLvq4h9OGFK6VWetV01UKuZp0qX0wJP5muo2EaDKvobPF3zU
         5IVtPJJtka3iqdVwPHe2LGz8zIfo9UA0HV6N/jCjWFgsNkQbed3sUKagbpxRf/P0vZXr
         sD8tCgh8X1eRVDmbDC1auS6fqOYEVIiCNstL8dQ2a3HViW3ALo+Qk7afkGAgv6xRUnp/
         dWhYEHV4GWN1TAqW0+DbX+uTG8KUbREle+mKscJ7xe2RE1Q4fNE2t7/PV+Mz913qAogk
         357RYP2gnPtL3VTmRiQwSoYXwmTMrKcWY6IPBdCk3fD3qSIM1j2EehfFReYbESwpXidQ
         jzKA==
X-Gm-Message-State: AOJu0YwbZs5v9F9vfxTcNxID1UrweWbSKiOTUX5t4fFrbY2ehxqGiXBl
	szNSBMfKzlc3TKIQ7JfzJOewuEJsfjN1vpmA17DOTe/LphOBBilNsQXr51aGJ/0/O3yvdRGTrs4
	nt9nb
X-Gm-Gg: ASbGncseM9TtNwRViu+cHNG+BOEPJEk9EGIxk37hix7FM27k4Iq68FL0gy/Kyh+BPh/
	ARjI1apf/04n4i7EzJSr2K4pLRhNZefvHfqBbB3fC+CHz0eTlPvKhNNjtAy9+/3aLe4Lyjc5I7m
	syZxRuOH87X/ZCdAkyxU/TvjCev9Ap9V8OI759MeBLq1gmpHu9tGt1zQTuJKpEWhJBQCFGRjhKw
	SKAq8RR78W9xNFClMZ00fHHHo5Cicc7TlpnRstTSc3YhbSXjM13TA2CXnr9ihwZe4Vifzspwepk
	BejqEmqB8uN/C1aRmsfzsYTcwlZd6zBs1WsMmMbpuUSdXRw7CMH1P5wtggi1pbeP90LBY0FIX79
	OEoOUzzAtgTVD2n2RW07fA4NEwuUFViWV
X-Google-Smtp-Source: AGHT+IH9+Zma+C2R8Li5RnHkpIULciQu7UmwN1qdHCxH0ZtHgtf0lYttrRBW7qinoQ0cB0A7KuSbRQ==
X-Received: by 2002:a05:620a:27c3:b0:7cd:ba:7b63 with SMTP id af79cd13be357-7ceecc144famr2205020285a.45.1748370434343;
        Tue, 27 May 2025 11:27:14 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-224-24.bstnma.fios.verizon.net. [108.26.224.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bde34sm1772563385a.8.2025.05.27.11.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 11:27:14 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>
Subject: [PATCH] lib: sbi: dbtr: Fix shared memory layout
Date: Tue, 27 May 2025 11:27:13 -0700
Message-ID: <20250527182713.527202-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_112716_047704_B8B97F8D 
X-CRM114-Status: UNSURE (   9.13  )
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

The existing sbi_dbtr_shmem_entry has a size of 5 * XLEN with the final
entry being idx. This is in contrast to the SBI v3.0-rc7 Chapter 19.
Debug Triggers Extension [0] where idx and trig_state share the same
offset (0) in shared memory, with a total size of 4 * XLEN for all the
SBI calls.

Add union to match memory layout described in SBI.

[0] https://github.com/riscv-non-isa/riscv-sbi-doc/tree/v3.0-rc7/src/ext-debug-triggers.adoc

Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 include/sbi/sbi_dbtr.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
index a8b3a02..8cb776c 100644
--- a/include/sbi/sbi_dbtr.h
+++ b/include/sbi/sbi_dbtr.h
@@ -91,8 +91,10 @@ struct sbi_dbtr_hart_triggers_state {
 
 /** SBI shared mem messages layout */
 struct sbi_dbtr_shmem_entry {
-	struct sbi_dbtr_data_msg data;
-	struct sbi_dbtr_id_msg id;
+	union {
+		struct sbi_dbtr_data_msg data;
+		struct sbi_dbtr_id_msg id;
+	};
 };
 
 #define SBI_DBTR_SHMEM_ALIGN_MASK	((__riscv_xlen / 8) - 1)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
