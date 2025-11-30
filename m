Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2239FD116F7
	for <opensbi@archiver.kernel.org>; Sun, 30 Nov 2025 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzrE72OcL+JTxE3ds1CIy36MzZI+VYZlAK9Wof7fsbk=; b=eYNA61hYh6QT5w
	4ge/4ZQ+JeUKqnhsdXR4ubiR1UWDkoWLCvkZWqorHnPB77u0kRofPKwKXyIL2RfA4uxq6LnhIytai
	NtV6N4EP964ysteRYMzuTdkTkSfUSAQMXGj23KtFmMoVY6fjcMCbYxkb5ZBw1LQkLoDYJgYJAzzqr
	vHfJC4Zs6Adqk9/04eSVrLpBA0d7jtjWVhONhrdTe6d9P/6RbK/zILccaJnRKfLGXu4CMGRoWS0S5
	VIlJAUinhxNxsmiwXXqRz/fPA2n7EkjwyclqO4T4h3qlChYNJ5oPEbqzHeRVTdtF663k93xjObc3m
	FI6igKagORXmsLlRal6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQF-00000002F8i-2Rvm;
	Sun, 30 Nov 2025 11:16:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPfQC-00000002F7v-49Gv
	for opensbi@lists.infradead.org;
	Sun, 30 Nov 2025 11:16:54 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so3892609b3a.0
        for <opensbi@lists.infradead.org>; Sun, 30 Nov 2025 03:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764501412; x=1765106212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkFuE/b601msZc5eQRcFw5QAnZfVLmZDWNmrfyUCp/4=;
        b=SpAfHrWlHxRHcrqZ6FLg7T1WSj/5twbw7WFBefN8wCQSILnuenSPmPFR5y4bfDTUaw
         Xb/iNNUW69NSOcd3XbL4Mr/5RB1BlgLZxrJgcFkiPBOQYfPHv4VQuBfrdadTLmw8qzgy
         JJRGvoCjA+v0SiFdY9nIWPUZNsDfZvlFiJr5tlj0COQUAYCZKuOc/NOu0kKZIgmEOCgd
         eU8xqcmUZ5L0m6ukvb3UBqmdh+yUVsG7VqepU8b396+wa4nA0QPi71XFbEl2CucpD9Gg
         jj9MVmuhQxDjVqYXejN5o0rxz8GSHK55wm91iVrdF0C/ZlAFYvSMes7fOreFOL8r87gr
         mdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764501412; x=1765106212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TkFuE/b601msZc5eQRcFw5QAnZfVLmZDWNmrfyUCp/4=;
        b=uKeJgSeZTvwc597FxtB4VSRFv1/As0H65tDpgr+d/SUdqUVhmy/tchLA0p0flWY/u2
         23KOJ2GkUEKeR2IwmhVyORxeZAV8rKrX1Chvr9Zaa04o3uOgeH2KAmwRqkICvG0L3qJL
         00e2JaJUq61brhag1bR/67vrWAS30gIqI88p46AvdS+T27NDNICgZKfFRQvzKnf3R0pb
         2bMrrz/SaTPk+UyaGQSWOiD721ERlOoupX5T9qKhFHpg19evwRjKR0ZqlL31pOVCRP0V
         Y4jZPbXDCCwBAAKNYkw8zTYOxVN9xKHVx02eixBKr3tdNU17FRs6J2yNeQN2NDxch/fd
         GLBg==
X-Gm-Message-State: AOJu0YyrNhNcoItCg+u2yjgX3HLWNEFB7nP0rWRjvB4QeSvTY0YKkVaS
	zAdNd9bNOBQGzG7g11P9RTkDDZWXt2Y5UPRy7jir1DePKTK+33HUze23nSC32Ua/Xi/FojyWrxf
	Y5+A+/SzK31DbdHIEYJV5ckYAS7ym6hpuo0+70PObWzb7d2pmE4GCAssdqIMTB8zM8liRgdkr3W
	xMURD5iahAwfIwD3Jz/++uk1aTBk6Vn4PNpRXLxGrIPcxFpHGe
X-Gm-Gg: ASbGncsAQ6Y5QKmLwMp+x6hmz7D6lD2E9oL2AiNl1JwIZ6VvKSHqvotRL9u5zebvHs0
	hJw6K77v2UbLpSWECkygSvmRKHZt72wkvG4KWrL+R5evQjVKD9jG0gx1/yTcmuKR2CtUz1/4KP7
	P0NYQsmP1ZqYieTfgojQkC9A7mDKS2kmsnsblOkz0LP8H2JTcmYlPPHu83tToeJdrmiAvjjHBLF
	atU4GzsLniwn2033pjbBeyt08BSu/gjGFMwOyKZevHlFHFiHDAiMkfhRflenuUx7RW+tRPyVhxU
	UKTIw8Kn5jLdwkT6dB8drnxmOM8E8uq1q5Dj0WtYsc3zVVXIoGKC4JMUkDknjCjXoJsDaUgTz+m
	uXDoNXAg6t3FpIxXiPeU0TBHuIveBegpzPZX/fvFghTm3gn1JjmVUPy5KA+Reirvdp7D0uif9j3
	Ah5lJvnEoDu/FKfMk/45/c4Aq9dZU8cufTrog=
X-Google-Smtp-Source: AGHT+IHEf8KYMfxBNnuR/YDQkyxOIrYuGGMUinJEyA9QwfvLghgcaRV0ZGu4+Hk1N6F9vC7jDFsf6w==
X-Received: by 2002:a05:6a00:2d95:b0:792:574d:b12 with SMTP id d2e1a72fcca58-7c58c999802mr33340305b3a.10.1764501412035;
        Sun, 30 Nov 2025 03:16:52 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1819277c5sm10027050b3a.4.2025.11.30.03.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:16:51 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v3 1/6] include: sbi: sbi_platform: add sbi_platform_reserved_pmp_count()
Date: Sun, 30 Nov 2025 19:16:38 +0800
Message-ID: <20251130111643.1291462-2-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251130111643.1291462-1-peter.lin@sifive.com>
References: <20251130111643.1291462-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_031653_039602_5E89090A 
X-CRM114-Status: GOOD (  13.02  )
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

Add sbi_platform_reserved_pmp_count() function to calculate
the total number of reserved PMP entries for a platform.
Also add get_reserved_pmp_count() callback to allow platforms
specifying their additional reserved PMP requirements.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_platform.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index d75c12de..0deeca9f 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -48,6 +48,7 @@
 
 #include <sbi/sbi_ecall_interface.h>
 #include <sbi/sbi_error.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_scratch.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_trap_ldst.h>
@@ -146,6 +147,8 @@ struct sbi_platform_operations {
 			unsigned long log2len);
 	/** platform specific pmp disable on current HART */
 	void (*pmp_disable)(unsigned int n);
+	/** Get number of additional reserved PMP entries. */
+	u32 (*get_reserved_pmp_count)(void);
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
@@ -302,6 +305,38 @@ static inline u32 sbi_platform_tlb_fifo_num_entries(const struct sbi_platform *p
 	return sbi_hart_count();
 }
 
+/**
+ * Get total number of reserved PMP entries for the platform.
+ *
+ * This includes:
+ * - One default PMP entry for sbi_hart_map_saddr() when smepmp is enabled
+ * - Additional platform-specific reserved PMP entries from get_reserved_pmp_count()
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return total reserved PMP entry count for the platform
+ */
+static inline u32 sbi_platform_reserved_pmp_count(const struct sbi_platform *plat)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	u32 pmp_count = 0;
+
+	if (!plat)
+		return 0;
+
+	/*
++	 * If smepmp is enabled, reserve at least one PMP entry
++	 * for sbi_hart_map_saddr().
++	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
+		pmp_count += 1;
+
+	if (sbi_platform_ops(plat)->get_reserved_pmp_count)
+		pmp_count += sbi_platform_ops(plat)->get_reserved_pmp_count();
+
+	return pmp_count;
+}
+
 /**
  * Get total number of HARTs supported by the platform
  *
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
