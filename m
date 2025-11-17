Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0989ACEBF96
	for <opensbi@archiver.kernel.org>; Mon, 17 Nov 2025 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qjb4CeYGQsAgHn03kuNP5C+lXipGQVj46DAWBfXMQQU=; b=xwIl7O47Lyav5u
	od1GLdaMVuGJ6nJkNXy2v66pBk3MVZOsCETr4IFQ+EZSQWQdffbnIM6xP1NdnL3qETynJqNFKeVp8
	mdCmkHLvr/L6zBp0Ev9m5lB34G60pixQviVwn0BhZTQDv9HUNV0yMx48zP8X7bDned+W/nmbtB8zh
	h+HwVBDwHdcQqmh4yLLhWdSO33vAFpB+GUyvcfiuLRqxz9Ufky3MII0kpD0sMMUwgMcRdYVR1PU+D
	UXODzDVqGgFKQ8eMTWpVX4hJTWFmBifYpi2vVgQJHwqauEEUPmSCQ1NyI/8dXlgF5tCCSw73tVM4Q
	uxYP1vV4XSsx4BsTaDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8H-0000000FT7q-0mzG;
	Mon, 17 Nov 2025 05:50:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKs8E-0000000FT5p-2DUQ
	for opensbi@lists.infradead.org;
	Mon, 17 Nov 2025 05:50:31 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7ade456b6abso3382462b3a.3
        for <opensbi@lists.infradead.org>; Sun, 16 Nov 2025 21:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763358629; x=1763963429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pi4NW+mY15co2wShR1uN1yM5TwfvrUAet1nzSs/rfc=;
        b=GAnpFZuUA0GnkMuVakK+PHu+d3O4a/420HDBOb1BWVVv1i7v0NASxpXnJVvAkRGd+F
         QvpJKM9DuK1V82pJR2rNhjge7Bhl9mGpKccls5zI01aWDDuE8ReJiP2oQHlUVbys8WrD
         Bh+Q2cIospSAs6hG/rJMnciqJpNn/VzKoWRwf3JxYN+nPUvUS1BTp1PsatDWf3clghpq
         +PuQaUhwxmeQ+rYRr1x7L92ew8L9gFyXMKpFaLH9Is1kPAVlI48wkEedCngKdc8AhnR2
         mt5aPbh5kBGtH+eKgysrEmqv5TYmAZGanoLOchQB+oHzrUevMeX5q68FmfOrSr2SqQgg
         4FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358629; x=1763963429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1pi4NW+mY15co2wShR1uN1yM5TwfvrUAet1nzSs/rfc=;
        b=wwGosbZvKuxGfxuB14AYyfX+0h/7MvM4I1lAH7Rktv4UbOO09fVgwgUCuPBWe/kY89
         ttOr+lc4eTF0DJQ8aJQA+d1LjMf8W2ZTwezo6oI3staBNqJL4Qx6Ln1PrswIKrMrf2hA
         +eWUWTjvCZm4B9dbcIqmPJ7pNTUkkczsyW8A/RyQ/fEAXFtnx0KwuSge+rK4SD2jepQq
         SSes3j01yZrY0APaL5Sk2AfYqrkFiCC1ilm0OtFvXpRJcGfsKyDtOAm99Cd7malYGR3W
         mCAufMOap+GvOppI309Yc4BacEkWCqBpFaTNfJestAPWN+agU0ywblpuPLoabpdeHkhI
         J32A==
X-Gm-Message-State: AOJu0YwQyv5HX9fmQibkslONpePIw9Uq5UeXUafhuq8FukVPkpf6F3fF
	R2i0HkQF3BSfnxqJRqGo8luu7SrIcokAFWvvNAMNmW1NueZxpt6Lugv/AXI1rA==
X-Gm-Gg: ASbGncseAOwdjcAe4u4ipJB0w0LDI/ts/UuWcSrZrB8zGYbiTF8IuByR72U/NkH8uDl
	hadXyVBSEb1ZLh+LKK/V8cRIxLI52BXH4IZATUIp++yioY0qGi2F7BEJH5s8neILDpi/jmR/3WJ
	e0SrrBXrRUrrnuQL6+7LgciKc4JMDVsYdJKgFLR9/Oicpm5UBp2+VgdSmda5YHxAGeWSa7QGTtX
	dVSVZ+prziB+jmzrqxQPD4oIhJ8hfsleS3efhkbKytAHN5ctToglHGOIovljpirVlYcngTVJ7Lv
	CHdbBgNzR8VZW+tPnKDpKTPB6sNRy3I1o2wRsoaWG412/8OvCcfDEGsVYGeh2hmuBtrhgReZFKF
	uG55m/MTrqh8EQvxc+3WO/EFI5f3S/WpG9oEQjCzDP2Mnsh7Ql/9JFB7x/5v+8F08IaA3vt4PXb
	dspg==
X-Google-Smtp-Source: AGHT+IHpkcAqAZrDBu3ndupQoy2UivhtOHA/pTXP8OpxDKWRZcqAws9WUz/erFR8//jVnICKsh45vw==
X-Received: by 2002:a05:6a00:18a2:b0:7aa:ac12:2c2e with SMTP id d2e1a72fcca58-7ba3c6658admr14171287b3a.25.1763358629292;
        Sun, 16 Nov 2025 21:50:29 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924cd89bcsm11719856b3a.15.2025.11.16.21.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:50:28 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v2 4/5] include: sbi: Add helpers for sbi_domain_memregion
Date: Sun, 16 Nov 2025 21:48:45 -0800
Message-Id: <20251117054846.1335-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117054846.1335-1-ganboing@gmail.com>
References: <20251117054846.1335-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_215030_570937_C80BC9C2 
X-CRM114-Status: GOOD (  11.01  )
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

New helpers:

- sbi_domain_memregion_disjoint:
  Check if two memregion are disjoint

- sbi_domain_for_each_memregion_idx:
  Iterate domain memregion with index

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_domain.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 1196d609..0d1b095f 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -164,6 +164,26 @@ struct sbi_domain_memregion {
 	unsigned long flags;
 };
 
+/**
+ * Check if two memregion A/B are disjoint.
+ * @param a memregion A
+ * @param b memregion B
+ * @return true if disjoint
+ */
+static inline bool sbi_domain_memregion_disjoint(
+				struct sbi_domain_memregion* a,
+				struct sbi_domain_memregion* b)
+{
+	/* Bail out early to avoid overflow */
+	if (a->order >= __riscv_xlen || b->order >= __riscv_xlen)
+		return false;
+
+	if (a->base < b->base)
+		return b->base - a->base >= (1UL << a->order);
+	else
+		return a->base - b->base >= (1UL << b->order);
+}
+
 /** Representation of OpenSBI domain */
 struct sbi_domain {
 	/** Node in linked list of domains */
@@ -222,6 +242,9 @@ extern struct sbi_dlist domain_list;
 #define sbi_domain_for_each_memregion(__d, __r) \
 	for ((__r) = (__d)->regions; (__r)->order; (__r)++)
 
+#define sbi_domain_for_each_memregion_idx(__d, __r, __i) \
+	for ((__r) = (__d)->regions, (__i) = 0; (__r)->order; (__r)++, (__i)++)
+
 /**
  * Check whether given HART is assigned to specified domain
  * @param dom pointer to domain
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
