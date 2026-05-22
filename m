Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D7CD5BB0
	for <opensbi@archiver.kernel.org>; Fri, 22 May 2026 22:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lKuYIWn9ZAqRE14xnZgNiOrFnWCiHw78gXm47osBLiM=; b=O7ggFW8UeeS0pE
	VCTwN/Dx0KMsiFr+4T2SVdZX7HVbwpkfpNbsrAxpPTur9O2n5RKQftqMAK6tOZ5d4H6M9/D/vO3xM
	RzBJoKRI5+mq29XsylerDGXGLm+XSgSuH5zNYGD81ycN9t3CS4ouiVcWBFlYo67ZACfdQAEL1Fo/D
	zsWj9Z42PyMTEvE49oHKZ956ABd8/W5FZ9bmWpA2SOAe7vY0g5g+2/xB+Pyajiay3cAwF2z8aKZ0J
	M/SD7qpmSSz9wvqUnxLsO2ZA5h9LUJ9jvhnpXkJO/xl3u6WxD4uGuli0Xf1u5/QVY9rd6e9P/q//H
	FvmPF/9GVv8v6pV5LqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYlJ-0000000C9YZ-3fwW;
	Fri, 22 May 2026 22:54:37 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYlH-0000000C9Xo-0eJl
	for opensbi@lists.infradead.org;
	Fri, 22 May 2026 22:54:36 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-65e39d1dd38so7402861d50.3
        for <opensbi@lists.infradead.org>; Fri, 22 May 2026 15:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779490474; x=1780095274; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r57DHEkL07p2syY2fX1EGuD9s3bNyllnbAGtF/oFQ80=;
        b=HgDbDY3t/xKT6nlx0FSmTdNEU156mle7w/LW4k8XN3fVp/Wf3ENIS4NE8Xj4HTRAvk
         5ag7oHT5MUBg6a9L4Gp2WRn1DABFOEyd8DxEk/EE5Q2kuCJ2LIat0tz5cDNae1ha4Amd
         5XBrEHIIGbPZXXkRCSV7YoLg/5KNQxudxqzo61ybXLVnS2IgoJG6DCgCKf+yaI3+bCKC
         GPEHc+ByaggYZ5VYCBDlEsyWkBW6kRqaIpUPpSQVRC8SHcaU31PU5zN6ox8wrcsO8VD1
         Ik2g3+GCSyQs2xoWd53snjj1mThKAVY++ZOIXoxY2XO2XT6w7Cz08B9k3YPlcOfm/7Wv
         I1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490474; x=1780095274;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r57DHEkL07p2syY2fX1EGuD9s3bNyllnbAGtF/oFQ80=;
        b=Io5Gl8QLyQm9a2MV0E3v8cAOAC3z/TTpcBWaWA2ejMUnaT9d/KFR8v70sIbCZfw6G1
         /3cRnRDyIy/b74A9x+SVgS563SAwuuwd2FnQ6/7TfREBGxd2IeBpWln5xDYBfwm/01KB
         66/oWoMso2DDuVz+lrhTmq/r3GlM6j/t1832gnEjHVaJW8tUH12UWtuZREUYMb33ruGp
         4atcVfpw2YWJsIEQsS3il/CehNmZdXjYEh6C6z6lD8na1fhJmLjeq8afMbXFTkXecbWl
         gybJPGZk3lpwlKydTRf1mczAPANmLaMFAXqGBR6aM4b22r5J0bFyZS+BA37wah1kEYIk
         MQwg==
X-Gm-Message-State: AOJu0YyFirsjOsQAFNbwa1QdLYmPz+f+7+5KFP9aW14Cc0jI9QJiD7ds
	PYpCDvICk08LxhqK+1NHZLwmOEkrFu739svbAnHhaZrmjIH2d+Nt246bpbF62SMUDq3nca0jrEr
	UoPCg
X-Gm-Gg: Acq92OHKXgihH8Ffpw80P78pP5Z61X9v4UezDRIsT7GHz1+uHwf+e1rpI+HowWy8OfK
	FC2GFwqmWq3yYxSCZtd9VhnjZQZXZa8vaI8AhZZKtSlKRLe0X+mexbkX1/V2oPr6ZEZhVJX8mjk
	Wg1JX6yQVcP9pNJ02Fg/aXHAWkcOumoB6TZhdabkWNGjnavbniu5fLe2XO9Xj0hSoT/jHg8jPuQ
	wa6PNI69HbyXHpi1qufUDXdyH85KMCy/X1/4yda8giMp1XlhlRajBcHlaIfvsajLUkjTaSaFfC2
	kY2GfGdALGg9WkGW9gBf5KzQujyESDCmtLuwjohDZn7NAnthaREYxRPYQYZFn3kA8MChUo+DjV2
	scjG79h2ZYvxzMXoVsQtdSIcrrpVDCr8jJlVew5mSI/VCGqLNivSdF8r+NFakkhM4mH0KtUs+C7
	OsUg5BkV4zoBzRqfhGjrD0MyYvCGe8OgMdkAaqzdJ5GeqPhmFvCr+dI20+lLY4A9Dr39q3ucftl
	M/i398=
X-Received: by 2002:a53:e217:0:b0:65e:4bcb:2b70 with SMTP id 956f58d0204a3-65ec98dcad8mr4489397d50.36.1779490473657;
        Fri, 22 May 2026 15:54:33 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:619c:3b2f:1c06:e432])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecfb27ce2sm1316926d50.3.2026.05.22.15.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 15:54:33 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 22 May 2026 17:54:17 -0500
Subject: [PATCH] lib: sbi: Drop fw_rw_offset alignment requirement for
 single fw region
MIME-Version: 1.0
Message-Id: <20260522-fw_rw_start_alignment-v1-1-362c17331541@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAJneEGoC/yXM0QrCMAxA0V8ZebYwY5Xir4iUrGYzolWSzg3G/
 t2qj+fh3gWMVdjg2Cyg/BaTZ67YbhpIV8oDO7lUA7Z4aPeIrp+iTtEKaYl0lyE/OBfnPROlEHz
 AHdT2pdzL/Puezn/b2N04le8M1vUDpgYpBXkAAAA=
X-Change-ID: 20260522-fw_rw_start_alignment-44eaac884823
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_155435_286292_5BEDE7D0 
X-CRM114-Status: GOOD (  10.80  )
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

From: Nicholas Piggin <npiggin@gmail.com>

In a single fw region scheme, there is no separate PMP created for RW
memory. The checks that opensbi does for the alignment between fw_start
and fw_rw_start (using fw_rw_offset) and the power of 2 check for
fw_rw_offset are no longer necessary.

Update sbi_domain_init so that these checks are only done in the non
single fw region scheme.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Co-developed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 lib/sbi/sbi_domain.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 4f458ac0..296ee81b 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -871,20 +871,23 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	struct sbi_hartmask *root_hmask;
 	struct sbi_domain_memregion *root_memregs;
 	int root_memregs_count = 0;
+	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
+	bool fw_single_region = sbi_platform_single_fw_region(plat);
 
 	SBI_INIT_LIST_HEAD(&domain_list);
 
-	if (scratch->fw_rw_offset == 0 ||
-	    (scratch->fw_rw_offset & (scratch->fw_rw_offset - 1)) != 0) {
-		sbi_printf("%s: fw_rw_offset is not a power of 2 (0x%lx)\n",
-			   __func__, scratch->fw_rw_offset);
-		return SBI_EINVAL;
-	}
-
-	if ((scratch->fw_start & (scratch->fw_rw_offset - 1)) != 0) {
-		sbi_printf("%s: fw_start and fw_rw_offset not aligned\n",
-			   __func__);
-		return SBI_EINVAL;
+	if (!fw_single_region) {
+		if (scratch->fw_rw_offset == 0 ||
+		    (scratch->fw_rw_offset & (scratch->fw_rw_offset - 1)) != 0) {
+			sbi_printf("%s: fw_rw_offset is not a power of 2 (0x%lx)\n",
+				   __func__, scratch->fw_rw_offset);
+			return SBI_EINVAL;
+		}
+		if ((scratch->fw_start & (scratch->fw_rw_offset - 1)) != 0) {
+			sbi_printf("%s: fw_start and fw_rw_offset not aligned\n",
+				   __func__);
+			return SBI_EINVAL;
+		}
 	}
 
 	domain_hart_ptr_offset = sbi_scratch_alloc_type_offset(void *);
@@ -913,7 +916,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.possible_harts = root_hmask;
 
 	/* Root domain firmware memory region */
-	if (sbi_platform_single_fw_region(sbi_platform_ptr(scratch))) {
+	if (fw_single_region) {
 		sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
 					  (SBI_DOMAIN_MEMREGION_M_READABLE |
 					   SBI_DOMAIN_MEMREGION_M_WRITABLE |

---
base-commit: e7fa66c2160ec139de1853a00f669c09320a9256
change-id: 20260522-fw_rw_start_alignment-44eaac884823

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
