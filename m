Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25861106FD7F
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUSUVaTG6mFdrPOHCcV/GJIc3rTQb0xj6Wupk+sptq0=; b=IwfjEKrWk1xtKO
	bZBqB4Cpw3smspBjpLdOLoQR5T6dwQsihvxseXDHU2YuIsXMt2CsJG4l2/G7eYS29N2Bt56npmx5i
	LBQ7LGmNoh9Fv0tnioEtwNQE6k1xS38sUlXqG4zRMVlJyCGb41xyQuVscFFddSNEkVjtV2ur/TX9z
	oX92DaN20DPruaYTKPfsfEUlwmRdr4tcYEyYAluZwyKOegOTW0jtxSuiAjpS00hL8CfjZYLAJflAn
	NpixnamQ6rk+sC+MmWgPEw9G7dxkseRkqMTVybKyW3EtGpD7rBRJY7lCl7rVz8X2ALjcryzYZuEX4
	BdZO+tUgb+Mrjf40y3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxR-0000000GcdV-0c6w;
	Fri, 13 Mar 2026 05:21:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxO-0000000GcZ8-3dwX
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:21:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3591cc98871so875073a91.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379266; x=1773984066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn+mv/SxHHu/4H7ZNgfUGWfSKdVH2j94gl3zU91gMus=;
        b=BQOhTVaQfvxKBrOxpdAiRUnrB0ndjKdQx7bb86h1BNCeh+saJJ7mJyKHD2i8ZqsQjX
         lzjrPCJGHYVrpkKujVX+MVJc64kbtXnMKtpg7RpXJJc5EVx8yYwKr8SbORtBlRH6fuxE
         9FmvEf/Gv7jtGCZOPGLX2mfogMtJQjmi565LYDzK6q3Y05kuurxpUlCa/Vw9Y7dUbnPu
         K9hmCbTVVDesVI7YlLy9PymBSbFUohbmturvJFQea1uPDT+lFKfcGGgZjF2PZJtF+aeL
         +Rz0bKBd+eT15PZf2s2Fn1wuVTA8EShgyYgrPCJxjoWL6an1nZd91BcD8dx8uy2B6CAS
         wX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379266; x=1773984066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sn+mv/SxHHu/4H7ZNgfUGWfSKdVH2j94gl3zU91gMus=;
        b=hqaw8e8cahceu2BPK6UuAC9XcFY08D9UUYhGxpd5XIeAVIgU76wVa3cpW7UOV3agIo
         A0+v1oK0XdRnWPCwV/oULg3uHFhxoc8Nl7uWNRxxOltFPzGXDIh+jPEm+OXvzxzadMfy
         KoKLiKwpHufFSR3pxYzI02qeoyQq/EBi2PZ42IJccUFA5Eo9/PKU2X6JDvxIdM54T/mS
         PrUEKkwUyhceR2lohrWUz2yygHCp8Ptx1ytqWkdsh4GmPP7KQx5j/lZLjXrz1QcBM9RS
         nmc8AQQpRb6TFuT+DOSHnYX8ibw9KnYMs8SuvS9Jz63wA6yQhPHRXlqr+sqt2a1Rffrb
         KA8w==
X-Gm-Message-State: AOJu0YyFXcZS91qZuNMUy15AmiHKOFf32N7jKdGWPS5TVTZ4V2NloeRk
	OvOmGN4Y11IMHfH+2nIOKk9aeek5gyxFYxNkkBGg74wn/fc3RnNmzMY4xZugIw==
X-Gm-Gg: ATEYQzxA96D9gXT9lc8AkJwkgmYJ2gb/al7CxEVhIaHs80z+YfH6eEVHtTur5ZhOota
	X28HbR/1TeRMM2ZVv8pwC6lPzJ56s755iv4CJ8WM4A+4tQEJG14rKY8KHNt0F5V+OCJGrTHKTSi
	VNkPU9C7KzvY4GuMulWMY8mfqn2faWOMCyQ7rTnBb5+1g1GiqPVVmErkPKOkdpV/jMTOe3Pns3V
	qFLy1qfnP33NmJ67PfZUWdm2Ga/TTtOtJ/i79XyEZC8UugqaEztYArXNdD+IdcscJoLu6qkV38m
	lGIUZQUtysgTGhhhBu4PMawsSXe02H17mKaGhL0ZymzxOU9Z74W/5pj0gj81cqx79NHVroYqlIC
	L+xww00ayE34lgqsaJOasLMtE976Dy0aJTfpOBD6xrpYVf97FC65ju+AZ3IZKOc87Q0f4oKefI7
	Hf3VlufPFjWgreFSNfFl/9dzcvzNpVQCUwU9nSvVUfbHT47T7nImH2IfijYmds1Qi4/cN5
X-Received: by 2002:a17:90b:3b91:b0:359:9a60:44c8 with SMTP id 98e67ed59e1d1-35a220fb2d2mr1856471a91.30.1773379265732;
        Thu, 12 Mar 2026 22:21:05 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:21:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 15/18] dbtr: Move trigger feature support test into a function
Date: Fri, 13 Mar 2026 15:19:44 +1000
Message-ID: <20260313051948.4017134-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222106_920583_5D91B3FC 
X-CRM114-Status: GOOD (  10.50  )
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

With heterogeneous triggers this test becomes more complicated and is
neeed in more places, so move it into a function.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 74b114b8..77162efe 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -85,6 +85,14 @@ static inline void *hart_shmem_base(
 			hs->shmem.phys_hi, hs->shmem.phys_lo));
 }
 
+static bool sbi_hw_trigger_supports(struct sbi_hw_trigger *hw_trig,
+				unsigned long type, unsigned long tdata1)
+{
+	if (!(BIT(type) & hw_trig->type_mask))
+		return false;
+	return true;
+}
+
 static inline struct sbi_dbtr_trigger *sbi_alloc_trigger(void)
 {
 	int i;
@@ -555,7 +563,6 @@ int sbi_dbtr_num_trig(unsigned long data, unsigned long *out)
 	unsigned long type = TDATA1_GET_TYPE(data);
 	u32 hartid = current_hartid();
 	unsigned long total = 0;
-	struct sbi_hw_trigger *hw_trig;
 	int i;
 	struct sbi_dbtr_hart_triggers_state *hs;
 
@@ -569,9 +576,7 @@ int sbi_dbtr_num_trig(unsigned long data, unsigned long *out)
 	}
 
 	for (i = 0; i < hs->total_trigs; i++) {
-		hw_trig = INDEX_TO_HW_TRIGGER(i);
-
-		if (__test_bit(type, &hw_trig->type_mask))
+		if (sbi_hw_trigger_supports(INDEX_TO_HW_TRIGGER(i), type, data))
 			total++;
 	}
 
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
