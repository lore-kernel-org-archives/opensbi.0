Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5291FD4F16
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 18:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tDEQ9pBsnPjvOC+20mMX/RH1YuHforh6YnbHwsd+dM=; b=dCD4XdYTcYWiIS
	F1mJUQlZXM1q9CbzYbz1XhM1e31tOWt7GwFeZglBUW5t2wMD5D9WSKxJMUyzBybJ7Locza+iwksHr
	bOL2UfMLXK4e0Efkrde+VzqM59v/ctiSEGNJ4+Jpb1UhkKDHj4Y2zsGQwvjhkadPYVmYgva+wh+4b
	bxLDNjGXIK95gDLXDDQ/nEHGDsRrl4YnDhSX0VV0PUSLWKLsqaw5POONgCMXSanvP4Qi79EBRWGIe
	sfQ42NOFATzQxILbTycHcOgLNyAEaZ2IHi68s9L+t4rljIutu+BcHfSqDMoyPMc0HaqzSZX+UDK9t
	PuqG3dMr4dGrH1TYLZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tY-0000000A56R-0amd;
	Tue, 10 Mar 2026 18:33:28 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01tU-0000000A557-45k0
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 18:33:26 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2bd801b4078so975962eec.2
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 11:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1773167604; x=1773772404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXdvUhJkJY2u+Mz2t4xciQu8+HagJCwkzcBfzEE/Qx0=;
        b=N/wgDjhYr1rSDhGyPKKQsDUZKFpmppxKIfHOkmG5NhNt5hWwEz9IWjv7H+B5AbSqjP
         1fvZ8qVuDOb1C3U8zddGHKc3OVoKdzOJ6tyNoTkZH2jOSgv7M2OMQ1hxdZZCYVhi/DUz
         FqV8IVTyiSwIDqzgAYHF9QREJXcVyZmeXl+P+g0pcPOiBcw3Gp3/Z0GS1VN6Fz2pFLp8
         K67HNKG/Zbw1SS3ORtjH9BIWzO2uUAuIJDOYLQ+8Kg9E7xgbO8VBvngqi2pbEfR4SHcZ
         YZpYJY3HNnFzu8ROfUqo7dGpN6Ps4VsNgGTh5qv4Ce6sXxS3NIlvb60io7XuV4KDt1lQ
         /Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773167604; x=1773772404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VXdvUhJkJY2u+Mz2t4xciQu8+HagJCwkzcBfzEE/Qx0=;
        b=a/ZQxWqh4tvGd4VJ4v4jhyvmQ4zNvZAFgEBTtW7kam0LSFXM8mbHUiFdP3StWCUY4j
         1JDLbmhpXqPKhLuFW5CWM4cqQfWteNMyVgrqmI7UDZLPBTz2TvakRHo+oTVnknIfbJYP
         Z6l1xg6NbVGtDoJMNnapXpwozOEDPxq3ajc6nefwb70j5GShCEKQ0bYxjHrUx6MaIsLH
         T4O+G3RFrZayCPwzieXcSf02TORgjHhdqmt/FpuCWGpeL4gvAQVKDJJlXYLT2yAwJqIk
         rKhrksy1IfrN3DLqTSrGZpicwAmDtpoIgDEIMqHk0G4UlIP+wkW2U1ZS7aW8/WayG5lM
         qdKA==
X-Gm-Message-State: AOJu0YwNe18NrtnyGU7TV+S/C2d1WbvQk/tyOuOwIM5k4UJ9kH6IBJA+
	ioHKSwN2eUeMC9PMPHzkRC/R8DqB6SGGw+8Te95WKiAGyT5NdvcDGjsGb0PRYSs/1+0McOwNifK
	ExmhnBHk=
X-Gm-Gg: ATEYQzyWbi7pNgT0cPabycpzJSnUuY4vFv1fboBVheAHeyXIF89Cr2ImRH+y970PvyE
	zdQjTmYfV3JgdEVyAkc4lz/ZrnyQNMZi5Kc9+hEU7ont48FmONygmwl8QjZW7nOcjpYEpiiA2ja
	ytwJ4Llz9d8rfRLJjUMkEJDrc9chO2CcVdqcoknIJVdia1yMY5VyDiuHxlHejk19H4ZUfKd2xRK
	QQZJZHr3l1tRlamWXy6r00+lDiSCT0IvB3xeQn+gdevKFWEWPRTX+ItlSNiMjUQuyCyqs6cCgKc
	plJ0Y+uUDoLQzxBfLtEqRhVWhdkZdrfWhBROlw+KconMS+E174JM7CDeg4R7C7jZ0T56iIwSoEz
	LKwcA+K2cTbdCn9n5uoExoSyaspOtL3zVtOwpwFjHSIXXtk/khxDGwp6ZPuwap8UaJ8vc8/zNkZ
	75vEajNiHSar3HYinWmP3IIrHf64E=
X-Received: by 2002:a05:7300:3e96:b0:2be:7eb2:2ed3 with SMTP id 5a478bee46e88-2be7eb23bd2mr563793eec.1.1773167603707;
        Tue, 10 Mar 2026 11:33:23 -0700 (PDT)
Received: from localhost ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984ceasm17146782eec.32.2026.03.10.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:33:23 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Google-Original-From: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@oss.tenstorrent.com,
	Evgeny Voevodin <evvoevod@tenstorrent.com>
Subject: [PATCH 1/7] include: sbi_scratch: Add tmp1 scratch space for RNMI context saving
Date: Tue, 10 Mar 2026 18:31:49 +0000
Message-ID: <20260310183155.2186463-2-evvoevod@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113325_018987_FED5A689 
X-CRM114-Status: GOOD (  10.47  )
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

RNMI handlers use MNSCRATCH instead of MSCRATCH and need separate scratch
space from regular trap handling. Add tmp1 for RNMI context while tmp0
remains for regular traps.

Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
---
 firmware/fw_base.S        |  3 ++-
 include/sbi/sbi_scratch.h | 11 ++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 63bb4473..cdb15429 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -258,9 +258,10 @@ _scratch_init:
 	/* Store hartid-to-scratch function address in scratch space */
 	lla	a4, _hartid_to_scratch
 	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
-	/* Clear trap_context and tmp0 in scratch space */
+	/* Clear trap_context, tmp0 and tmp1 in scratch space */
 	REG_S	zero, SBI_SCRATCH_TRAP_CONTEXT_OFFSET(tp)
 	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
+	REG_S	zero, SBI_SCRATCH_TMP1_OFFSET(tp)
 	/* Store firmware options in scratch space */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 #ifdef FW_OPTIONS
diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
index 58d54628..a6edeb2d 100644
--- a/include/sbi/sbi_scratch.h
+++ b/include/sbi/sbi_scratch.h
@@ -40,12 +40,14 @@
 #define SBI_SCRATCH_TRAP_CONTEXT_OFFSET		(11 * __SIZEOF_POINTER__)
 /** Offset of tmp0 member in sbi_scratch */
 #define SBI_SCRATCH_TMP0_OFFSET			(12 * __SIZEOF_POINTER__)
+/** Offset of tmp1 member in sbi_scratch */
+#define SBI_SCRATCH_TMP1_OFFSET			(13 * __SIZEOF_POINTER__)
 /** Offset of options member in sbi_scratch */
-#define SBI_SCRATCH_OPTIONS_OFFSET		(13 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_OPTIONS_OFFSET		(14 * __SIZEOF_POINTER__)
 /** Offset of hartindex member in sbi_scratch */
-#define SBI_SCRATCH_HARTINDEX_OFFSET		(14 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_HARTINDEX_OFFSET		(15 * __SIZEOF_POINTER__)
 /** Offset of extra space in sbi_scratch */
-#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(15 * __SIZEOF_POINTER__)
+#define SBI_SCRATCH_EXTRA_SPACE_OFFSET		(16 * __SIZEOF_POINTER__)
 /** Maximum size of sbi_scratch (4KB) */
 #define SBI_SCRATCH_SIZE			(0x1000)
 
@@ -83,6 +85,8 @@ struct sbi_scratch {
 	unsigned long trap_context;
 	/** Temporary storage */
 	unsigned long tmp0;
+	/** Temporary storage */
+	unsigned long tmp1;
 	/** Options for OpenSBI library */
 	unsigned long options;
 	/** Index of the hart */
@@ -106,6 +110,7 @@ assert_member_offset(struct sbi_scratch, platform_addr, SBI_SCRATCH_PLATFORM_ADD
 assert_member_offset(struct sbi_scratch, hartid_to_scratch, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET);
 assert_member_offset(struct sbi_scratch, trap_context, SBI_SCRATCH_TRAP_CONTEXT_OFFSET);
 assert_member_offset(struct sbi_scratch, tmp0, SBI_SCRATCH_TMP0_OFFSET);
+assert_member_offset(struct sbi_scratch, tmp1, SBI_SCRATCH_TMP1_OFFSET);
 assert_member_offset(struct sbi_scratch, options, SBI_SCRATCH_OPTIONS_OFFSET);
 assert_member_offset(struct sbi_scratch, hartindex, SBI_SCRATCH_HARTINDEX_OFFSET);
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
