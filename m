Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56868CCD1BF
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXTb5TnqfQX1z5bi/gF/KG2+yYfz3qF0rTyTo3WAKkQ=; b=fOBf6k+QtO+HK5
	unmY2VAa4mUZBbWjk1SDlY9OHM2kNhAM6nso4KWr12ul/0pGIK/5ygJvNbME/wk/CCJJEVuxSas6n
	Ql33uCLYhBalei1dLM5wi+TW/pcQbhJcuqKNOf2GTrsVfSy59QHkfK+ITKrDiHzB3Pm8EDuseY37G
	PbRhGFnJYt5RZ8DoqcXobEpsCVLEz7+VmZS5ImOTD1qHctOz+yF7QTRD9ReO35e2CzYJzgdjq3H35
	29Xx2SqO0eGzAvZ529PJy8Rqa5g5wIxZQnGXrLRCuagbulN69P7SYVyKOZJvRZLhXEzo27sNZwlfc
	74CuAseumKRs/Anlk6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ7-0000000B9qX-1jQ6;
	Sat, 25 Oct 2025 09:18:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaQ4-0000000B9o1-1ZuZ
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:41 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7810289cd4bso2886848b3a.2
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383920; x=1761988720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CcfYAIlS0vFNy2SZA4/70eD7S7U/jvBoGM6n+8Yu7c=;
        b=XDks6mjV+8GhWxqq1ReVMhfO2Y/ODrA5q6XTUB0p+zfo+5tYdahR/Ee10nryHrU/JR
         5ORxgYv/Ew0XlAvWhp4TqG8ohOI0fz7VEO9NV0jZvstaHRX7/uUFG3sibrtdSR4dMERS
         P1ahtO1V1P/h+Yjpy+JwVCKPoCcdLhR6P11QenKe884G8smxdFRFcJ7rWDbqE+bhnWL1
         7smxODausr1/41QR+0r10BOQRWZg1Z/y0qXHxqN+p+Qsp3+oVU6DZstcz9opio69v4oT
         34oSez5XRkkmM7zGrlHOTxLXc4m/7VVEXm8LZQ1hi6y0IeM6Z74kg0FTlj94U3rFpdQB
         0DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383920; x=1761988720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CcfYAIlS0vFNy2SZA4/70eD7S7U/jvBoGM6n+8Yu7c=;
        b=QL7ZlBTFJpujRBnT+3ETWYVM/RjwumxNnwPNve/87yrj6XFQfqpiVI+M59jRSjiLJf
         Bpy3g+LYEQ5moqd1zSm1sp6jLG/mTlHo/IuNQaLxm7moJ/exgmJ/rJJvWAUQYSgE0j9H
         vK97WKEdqB68cPVXblQ9urWXfEdK3qAHR1uOjDBt7TvkWn1XS5p8C9XyxcDBuNon8/x6
         6v2OSSgZLwB/D4isWKjKBP5zZ3C4oE9Fq1cVptXflRSknyCc5hbk6m/qda5eW2YA++nU
         Cro1uUC7kZnBgZRGO6JTcRwcihSo89n8oFIGInYXs8boh7gZPicxGdP0/F+LhAQ06GFM
         FpqA==
X-Gm-Message-State: AOJu0YzzFzKdCnHT7wTMXOjbBtOXM7jmBjWZcNXVOp+y/Pz/0/hCGPA7
	G9nbbVpt+jHeK6cn7S9SlfYHvuXnLNA4Qp0Z0urcISu2cocd/SNEO6WPWpDvTfC1+FCXpBhbMfu
	17sbGDTncUmZ3BWvBTA9lHjnvj+gVLmE9XCvbHh5mriXl0B0hBoCYxZiiJqSipe7FjBnHMkVbIs
	44RuiNoODwmFKiyDgY6sgksFM3t6lIPlscjuo4UhDfpTOuYuyY
X-Gm-Gg: ASbGncvafXnDkNhE/lX7G6xN5zbtBTRoFXCUSqryagb3DhZx9DeaLM0guyIdgGSJcE+
	1Tnw5pZV0i2nFLXH5ZP0evwFmS0JnDh4xRhGsbBMGdB+LAd3vBS6nwb/34PZh27xiUHPeJCCbYS
	PYDPWYSX/tXfQvatWwnHm6hEiaM9SGhQwDdd6gFfbm+ggyu1cBeRPByUzzwAdO9BF/HG1S2ewfB
	Os3eLzRU6Y5nZdOHWCVgBBl5d1TRrXqC0zgj98uQAXY9LGFtTxwwGB1WzS30KEkwTZWWkAid52Z
	4eFwFFRJkIP2YJFXJV2Of3TYVEuoXuM2y64snCoNqcmwDsisTzrmCBTnh7QsuSYNLB1XJS0Z0tq
	7ZJ8OOasSu4P34EsfHKEz2x3L2jvz2oKnHXQV8rWw6i4NMYwszfcrRZTYqingTOkeQslWepGZ7G
	amhR8oH4eiSRRwFFU3SgvYtbMZKxW8ojMm87A=
X-Google-Smtp-Source: AGHT+IHUr2iFqqgixw4gMW868JSLAYO5lFq8D4Nomw1LrcsN1H6bTsfC0d4pUEuSqFBwX0mrp40A3Q==
X-Received: by 2002:a05:6a20:4306:b0:33f:df99:11e9 with SMTP id adf61e73a8af0-33fdf9913e4mr4198429637.11.1761383919522;
        Sat, 25 Oct 2025 02:18:39 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:39 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 7/7] docs: opensbi_config: add description for reserved-pmp-count
Date: Sat, 25 Oct 2025 17:18:11 +0800
Message-ID: <20251025091811.506511-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251025091811.506511-1-peter.lin@sifive.com>
References: <20251025091811.506511-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021840_417585_F4A264AF 
X-CRM114-Status: GOOD (  10.37  )
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

Add documentation for the reserved-pmp-count property, which
specifies the number of additional high-priority PMP entries.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 docs/opensbi_config.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/opensbi_config.md b/docs/opensbi_config.md
index 104d82c9..085f4c73 100644
--- a/docs/opensbi_config.md
+++ b/docs/opensbi_config.md
@@ -26,6 +26,14 @@ The DT properties of a domain configuration DT node are as follows:
 * **heap-size** (Optional) - When present, the specified value is used
   as the size of the heap in bytes.
 
+* **reserved-pmp-count** (Optional) - When present, the specified value
+  is used as the additional number of reserved high-priority PMP entries.
+  These entries may be allocated dynamically at runtime, or permanently
+  reserved to protect, for example, PMA unsafe regions.
+  When smePMP is enabled, a minimum of one reserved entry is required
+  for sbi_hart_map_addr/sbi_hart_unmap_saddr; therefore, the final
+  reserved entry count will be (1 + reserved-pmp-count).
+
 * **system-suspend-test** (Optional) - When present, enable a system
   suspend test implementation which simply waits five seconds and issues a WFI.
 
@@ -40,6 +48,7 @@ The OpenSBI Configuration Node will be deleted at the end of cold boot
             compatible = "opensbi,config";
             cold-boot-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
             heap-size = <0x400000>;
+            reserved-pmp-count = <2>;
             system-suspend-test;
         };
     };
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
