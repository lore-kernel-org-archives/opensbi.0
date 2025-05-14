Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671CFC3ABC3
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 00:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YjOgrEmOwE69tKeYNde7VbIMzJ8qfO2E8vbgCyT2sC0=; b=s2z0s/5jFKW1Lc
	2ue2zwA4TRal1n/tJhJvOn4zE9WJk3IyV51LNskCseBoDEXLEBrrImX0ALadLiRFUq4JOJDMo1Anz
	k8Vuk11iJrO4p2CbYuqAAqZ4rNzQTK42jQiKpo6bNobex0QNGun86NiGBgNoHlKOQYGoLTwPTHNgp
	eoout6aY99my7cOeBsVuEB4Imd+1C68l9WhyWIHymrNNSL9d/t1AM5/iyL1mVJrkeAmWL72+tFSgC
	2pjp3t6pcaUpHsPgZ3OJOM/4uOjk1CApoaLN0jBHj7hBAgoEKc2DAWxS58oGct9pxBaTw46YCJCKN
	u/H1+rulJNrdRTKlYq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEzw5-0000000DmQD-2wSA;
	Wed, 14 May 2025 00:25:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEzw2-0000000DmPe-3DXd
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 00:25:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22e4db05fe8so59172595ad.0
        for <opensbi@lists.infradead.org>; Tue, 13 May 2025 17:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747182321; x=1747787121; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QN5ezuqunDiNuD7UyUNhXBePs16bzf4Y6HAQYprjH1E=;
        b=YR03VxluNIfk23qJserl62hCkRkrPpEAHOnIpAdWp4ioXNvUOUsVIP9HuTJyvJug+X
         iPJF3DY4hXhAXnD6VbYR98wTOKFj6iJAr9aOl9WXi76vLI3+ujqO/aE6dYu32GoNhzSg
         /4VtnA1TX8nmadxV5LsyGarXb8tNIfpkLMXnWO/ltz6Zz7KWw9h8cD8rUsBBsioWCgTG
         BkxLGZWu0V7yVVppW87w7t8DfqL822AqOFiifhh8JkKVkJl0ZaHhW+MYoG3LkC6g1Axy
         m1qNNTWDlyF7X/ykbempmFs7YAin6q+de1cA3d3jQqSb2IQsCEHHJbcgMuhzz3+7+Qaq
         b5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747182321; x=1747787121;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN5ezuqunDiNuD7UyUNhXBePs16bzf4Y6HAQYprjH1E=;
        b=FfwarwZK+a4fpiUb+/MmdL2MAC8+RjqSKsn5Q0JruNcEE1Fwc4KruBgQ2wVlmCaLQY
         ph8OE4Sp+wKe8BqFi8z+eSu/Nr97yy/huCrKt9vu9AvlX0AAh2S9BnhDKUkc0YIHHAtX
         6q6JQ0AwWOiRxaxhAte73/B9H1oJr6IXtSaKGp9hhDl7DgaPHAp3TxuuHcF9PpXotZWx
         MN34hYSv8qGKxPM5gUkhp3xzT91Lfq0BUcLrbOy0oFkmHii7XLYwkCzhbjmWjiLmXId/
         XEPwABY6SLhjuVyRI6e9LZTGUYCvId/EA2uO4GXPMUz/POssljjRQpGArZ9Jy2xjcBLt
         vZTg==
X-Gm-Message-State: AOJu0YzWmJibW1BNx+Z6tVblGhutPbatjQSP48t8JN8sffMcuak9F/EE
	NiCyGFr/lV0WnqzUlkXmadw2YI57GiZ84DifeosudPaL+8kd7qBDNiYCxVyRtBtbIrtqqeQtYPk
	3
X-Gm-Gg: ASbGncshw7mQIkCRmMG8tU6YIk1oQBwyLUEAZ6zctqSA16Ie10JX2ik1ts3T4QPboS3
	RZsw67NDeWgxkA8nPgcdtkGwMa3R5oP3uFuYCOJ2hdC8mnzGdGE9PZWUmbk40BqRDW5tOw3ZTR/
	70xqczRIKLLd0GSnvAe5eSqJ7dH8ruNYEWUtjIAKkGvB7M2n3zx20w8jW//LeetMry2kl/+T0bG
	db/EIXdXQCX2fW7hM28PnrTEG/Lga0XVFaTXM0QFJieFBDz7+udQyniY1NNl1Htgo+98RJwScFK
	9C8uL51tAx/Sa2VWpz6CNJc1dqcoUJMuQYF6gOd7Ist9W5bzmto1Qa3VrzJB3hcG
X-Google-Smtp-Source: AGHT+IGsx34VJNO1hfQc5In90KAVp7oclfptYYG5ar6YDL3U9GEWYilcNPfCubm+R33Dzet/IUon0g==
X-Received: by 2002:a17:902:d2ce:b0:220:ca08:8986 with SMTP id d9443c01a7336-2319813d2b7mr16953975ad.22.1747182321111;
        Tue, 13 May 2025 17:25:21 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754938asm87461615ad.22.2025.05.13.17.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 17:25:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 13 May 2025 17:25:15 -0700
Subject: [PATCH] lib: sbi: Only enable TM bit in scounteren
MIME-Version: 1.0
Message-Id: <20250513-fix_scounteren-v1-1-01018e0c0b0a@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAOriI2gC/x2MQQqAIBAAvxJ7TlBJk74SEWlb7UVDKwLx70nHg
 ZnJkDASJhiaDBEfShR8BdE24I7F78horQySS8WVkGyjd04u3P7CiJ4Z21ttpLVGd1CjM2I1/uE
 4lfIBcOFgNGAAAAA=
X-Change-ID: 20250512-fix_scounteren-8b7b682bb864
To: anup@brainfault.org
Cc: opensbi@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_172523_009733_D9EF4D2A 
X-CRM114-Status: GOOD (  10.58  )
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

The S-mode should disable Cycle and instruction counter for user space
to avoid side channel attacks. The Linux kernel already does this so that
any random user space code shouldn't be able to monitor cycle/instruction
without higher privilege mode involvement.

Remove the CY/IR bits in scountern in OpenSBI.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
To: anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
---
 lib/sbi/sbi_hart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index fc4925b57625..177f356b7b77 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -49,10 +49,10 @@ static void mstatus_init(struct sbi_scratch *scratch)
 
 	csr_write(CSR_MSTATUS, mstatus_val);
 
-	/* Disable user mode usage of all perf counters except default ones (CY, TM, IR) */
+	/* Disable user mode usage of all perf counters except TM */
 	if (misa_extension('S') &&
 	    sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
-		csr_write(CSR_SCOUNTEREN, 7);
+		csr_write(CSR_SCOUNTEREN, 0x02);
 
 	/**
 	 * OpenSBI doesn't use any PMU counters in M-mode.

---
base-commit: 316daaf1c299c29ac46e52145f65521f48ec63b5
change-id: 20250512-fix_scounteren-8b7b682bb864
--
Regards,
Atish patra


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
