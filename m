Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795E7D6ACE2
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEmrynXiQYis7qTw4N/IKvLY7vBO7ZmEU2usUuc/qTc=; b=EZKF2yzNCRJlLX
	qtNpNNzMxcgDJPjXPHrU9x7t9S626BnlBx+F4/V5XQ5NfWgkJy6wIVRT4ZTQmYdtg9VwkBg+IwrRA
	WoHnrTakwcGg0w/x7OOVkStB2Ou9mwCeJvEugMd+nabCPH+d0y9mNueiaUgCdYO2b7Qq1Ul3OaLak
	InAEsfrvm6QAF9e0w7Qbpb9wx54Wk2qVHaoutEl3a+uMUk6zT8T8sSoJ09NL75aFk1FQ5aRerc3Tf
	++0n4M49i4TlM1IPtTFvgC7RdEcrhyI9aQyjjWruBwFxOMqLlE7oIBq+9Bk7R+65jIUQChugQD+k6
	AJsv7CGmau0Y3jadZMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUz-00000008FgC-246l;
	Thu, 18 Dec 2025 10:44:45 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUw-00000008Ff6-2HXx
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so470776b3a.0
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054681; x=1766659481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDzwK0Mtm7yPyEjl5uEK/H1TTT4dfwzDLrYmM6RpVAE=;
        b=j97LbLkyYypdruxQ1KZsPaWOxzRE9KLeYQu5Y7CbKFpmkqGEfyL/TsPXocdWqQJkDZ
         Cinvf2lyL8ZT4M6xEpbQB1Okowm4YwxIledK9Wg+oxDQ3x6OSD0ZI7z9DWVvRdM5b4AR
         GX0nFExrKPuMHHS3AgDpbqzNw4CHdqQvub1zRXAnLXINeQBLU7qbgXK6IK6DwBLM2x5A
         0hRv2RHmkJvCs5NIfyX8Pj5z0lZR7k26qJfgT/OY4M59iQvlkpUOsi9iuNB6XL0sjzWi
         InESg9eUYMJFr+BuIpKXeBZQPSQOMhatLKO5Zo5PLKidyTWsxY0EWXkk2bv/9VKFZ6d1
         qQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054681; x=1766659481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EDzwK0Mtm7yPyEjl5uEK/H1TTT4dfwzDLrYmM6RpVAE=;
        b=jXMEnH/B98nwovyezMp6hGXu0gu4D5mpXdh0jetOypbKoZ4vK/dONJl/COhYPEXRP5
         QjziPJOsoCUvc/QVR2XLN6rsYtayYg7K76G0hm0vysE3TWzPrULNzUIHQPKU0BnZu3TG
         9sL/eu2mhRv326Wltl7G4rcQkxW+qKggOtCRBr6d+kWFwgIBwuApfZ/KxUnFwoxrxUDy
         0bCcK0O64maaabGaQ9p9/aYrcBZcbMFwxGOjy6Dkc+TZjPTwkf2oh/c2q2ScxL68XDBp
         cJstuAUSBlQxnU3fqt6+pW7Gm7XKBacLzx+hWGnvAU9ITG2wVBXvBDP5cW1lsB+MDbmj
         yqFw==
X-Gm-Message-State: AOJu0YwN7YiNgsxyzfM1FvWoBBNbeXzBTFE6Jp+Qd1P3ZAOMdySMkXo6
	vVOMNvQLyKwbAp5/DLKOFN0Isgy7E62cSCrZfOCOQymSQsfi16y1AHaYLYlFdg==
X-Gm-Gg: AY/fxX4mG+JNH8bvuXB+Wk8eKR/y0Ps85fSQ2Zi7kyjMDxjzttvCP0PN97IGtvyawVF
	J89lJisUpWUiyMYYcPYVsCWbpYTM25pbmT6m5d/uUesQRsGsJenbeAGw2GhGZNTx9OofpKuudsz
	pSoXe7v8v5Ks9amYEKoFcLwAA+AEJsGmYZ4pd4IT1KV4l6uUyFiC0u2Jd+o534bimvh4nA8LfUQ
	uhWaAmBq5na4V5PanNpR+eOlMeyVjZ+qCBcdOxsHvAtVx3z5jw+Sbelb5lNXoSzSdhjt69RNFwm
	CPtIYedz9arsFgnVhciFjvOERD29FclFJjRYjm9Cjk3mFJ1l8d/Mb2P6g0npoFEGjeoXFD+6+Da
	15RvCe+vd1g9roJkgwtNB6Hi0mYzUKtkRFlDv1HcgS73Nx0DK27riLu8Mu8cxbJ7JmoHQ+9jOj5
	UHZToeUBxlBXQYh+YhdNJ2+fc=
X-Google-Smtp-Source: AGHT+IF8g7A1QzkQGIgSWGpTpvE20e3RgzbMZ2HbovVRcYuXa32bPZ/eQn8PFYLspsymMWPJAWE8mg==
X-Received: by 2002:a05:6a00:288f:b0:7e8:4398:b360 with SMTP id d2e1a72fcca58-7f66969f560mr18353123b3a.51.1766054680968;
        Thu, 18 Dec 2025 02:44:40 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe11d3e004sm2264795b3a.15.2025.12.18.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:44:40 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v6 1/7] lib: sbi_hart_pmp: make sbi_hart_pmp_fence public
Date: Thu, 18 Dec 2025 02:42:37 -0800
Message-Id: <20251218104243.562667-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218104243.562667-1-ganboing@gmail.com>
References: <20251218104243.562667-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024442_575312_E529B0B2 
X-CRM114-Status: UNSURE (   9.03  )
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

sbi_hart_pmp_fence can now be utilized by other hart-protection
implementation.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_hart_pmp.h | 1 +
 lib/sbi/sbi_hart_pmp.c     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sbi/sbi_hart_pmp.h b/include/sbi/sbi_hart_pmp.h
index f54e8b2a..a7765d17 100644
--- a/include/sbi/sbi_hart_pmp.h
+++ b/include/sbi/sbi_hart_pmp.h
@@ -15,6 +15,7 @@ unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_log2gran(struct sbi_scratch *scratch);
 unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch);
 bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx);
+void sbi_hart_pmp_fence(void);
 int sbi_hart_pmp_init(struct sbi_scratch *scratch);
 
 #endif
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index 62bc859a..7f970ca3 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -62,7 +62,7 @@ bool sbi_hart_smepmp_is_fw_region(unsigned int pmp_idx)
 	return bitmap_test(fw_smepmp_ids, pmp_idx) ? true : false;
 }
 
-static void sbi_hart_pmp_fence(void)
+void sbi_hart_pmp_fence(void)
 {
 	/*
 	 * As per section 3.7.2 of privileged specification v1.12,
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
