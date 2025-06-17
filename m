Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3E7C71159
	for <opensbi@archiver.kernel.org>; Tue, 17 Jun 2025 03:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3I3pgz3U2AnTbRDps7N2DmY+LtYTWgk01Ki/hMwK58=; b=rkZOl+xHvrRaoo
	MDOzJDxiYYGG6XIXG4c5hr6AycLB6rzhynvOR3jQzpncoIc02DlW96eK2bdXKzjFeJi9NuZXxTa6K
	osgQvfamlvui+kC1UQzcEv+J2gGzsLZQXW11AvmRzzuthKzo6P6wOkoBPdQ5mtWGAry3e4ZBRP42n
	xuUzkOqbRMLiKrulPHv9eUuz/t7FUg2PMD9H3K5MSxmDfT/ZGRnsV9wsM1BffV7RtTLMXBar8zEK4
	C0oXW6aMLVj3/6lU5Ku1A41Otx81ZOboBe97VVjqBO6DENp6tYEe4pQg68bWxT1XgR5yIvoO6f5MC
	da7anu41mxl95+av/FiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMun-000000065nM-0qdp;
	Tue, 17 Jun 2025 03:23:13 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMuj-000000065mF-3Rfb
	for opensbi@lists.infradead.org;
	Tue, 17 Jun 2025 03:23:11 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b2f11866376so4081597a12.3
        for <opensbi@lists.infradead.org>; Mon, 16 Jun 2025 20:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750130589; x=1750735389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/DfffTLyrPvFnAg5ciTY4y45a0zvJm8cQDsrBGr7t4=;
        b=TMoGgL07FKnYlBck+RtwkAwFHGzFZ/6W7XMPw701JeE+xi3f1nFmFTkIzHlN/28Arl
         4gZeK1pIk6mqBFQzGTk2UDYrormVlH3YfbkFGC03NZTZK7HBZzKDroh9K8lBX1fsFhXQ
         rICaqnAXl8WHSXn+D0xootR6RkRcFZRlNM4TJjOy1VuA1T95BQ8loFDeeBae5ISU5ED6
         u+udlVnr+3Gtv2HxzPZTsZKuX4a2t1aBXh0vqaiTjkNdqWvS1lbkEFn/Jb90Kqf/FTD2
         UgL+7wzC4HeAm9R5cEP/5C+ykZSBbav17VxtkgIXEpo6FA/bE/JXc5lRnZui+26sDE/S
         Mu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750130589; x=1750735389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/DfffTLyrPvFnAg5ciTY4y45a0zvJm8cQDsrBGr7t4=;
        b=TdOOZSQtcl3vnSfs9FHZ2SDrAHeIxkHqtdBzzbawZhuiBe8/DYX0k08+acysvhjIuW
         zIp4rkyXdLb2y6cmHSMbVDv5FIo7JzTieUU3o9YSyLBIEiDQl1576/VvDtGcXoDphS/a
         iJC1kurb46d9fGyH/hXaMtB5jvJh/AOs+pjcjK+WCCl7RwPxSRG/ljzPctiMAjPiaoC4
         9hUEqOJBiPVGtQFy9sqBPAtG7l7zlgqBRm586/ceWR1ZZpPnXaW6w6XLKY+TrSz47uWG
         BQlZxlcvJA7GvDQnRBbKFhBi65btB6295bc+jx7gtvO+yx3HJMP/Qeo3UDLyehu6QZV1
         QftA==
X-Gm-Message-State: AOJu0YzhP/Q1T3JnBh0Ih0Gm9biKx3HmI+zDjLvn5yi0kYuRFyDeXaAO
	jtolR6nORod1hnWseCSiVBV/pn0ohVrIvLxnGJc6Yh+kzkaCsWxPoyLS4qA1ssia1WBMdC+Hdvg
	zzkVnQvaIyjswk72IapF/mFG6xjSdbFrYtizHVp2IU28mxP0I4/BOf9Kr4i4AvXhc36DEjfmr23
	a+QW7drZc4NjIlomSkwZY1xq1cida+PhALiBrignhpFP2v4r1KeQlJY8c=
X-Gm-Gg: ASbGnctey6LfKfBxjQldT47a/U037sIYfI/9gv+r6+d8miBg1PYBOmRuiQG5cU2jph4
	yTmdYDDU6HAHHMs2HTgYYTFsghhhn4wNMCiePQL2fULVpHVQw4JxXXqJMKuWGsNAxSRZVsg7W/X
	/v1oLYx8Ic81XlzguVhgC0yZ5r7wyDT2BzFTYvQOLRb/2Caz3W5OA5kJURycUluLH5njjwHCvqR
	HgHDhRLBCbjZbsf5sk2EuVZqQDWW+fGD61pHohnnNwU6878JZEeMVyBsRGZvBqICClGbDfFDtjH
	SUH+7UIfox1jxEmA0lb1sH/CAFA/lCnBFvYIxzppivD2JI41XI3TWOuuAyrftRBW59yhLUsaEkl
	Adixj00W+
X-Google-Smtp-Source: AGHT+IFivqTiiNsY9fz5XVZ5t7pt06OQEnWhdR8z79goQDC2vkkQlspnIKfyN4qFiDPZc6P++UKtVA==
X-Received: by 2002:a17:90b:268a:b0:313:283e:e881 with SMTP id 98e67ed59e1d1-313f1cc5abbmr18289656a91.11.1750130589012;
        Mon, 16 Jun 2025 20:23:09 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31429aae8eesm244821a91.40.2025.06.16.20.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 20:23:08 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 1/3] lib: sbi_list: Add a helper for reverse list iteration
Date: Mon, 16 Jun 2025 20:21:35 -0700
Message-ID: <20250617032306.1494528-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617032306.1494528-1-samuel.holland@sifive.com>
References: <20250617032306.1494528-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_202309_859867_6634ECB2 
X-CRM114-Status: UNSURE (   9.50  )
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

Some use cases require iterating through a list in both directions.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_list.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/sbi/sbi_list.h b/include/sbi/sbi_list.h
index 9e56c526..b1a6b3ab 100644
--- a/include/sbi/sbi_list.h
+++ b/include/sbi/sbi_list.h
@@ -160,4 +160,15 @@ static inline void sbi_list_del_init(struct sbi_dlist *entry)
 	     &pos->member != (head); 	\
 	     pos = sbi_list_entry(pos->member.next, typeof(*pos), member))
 
+/**
+ * Iterate over list of given type in reverse order
+ * @param pos the type * to use as a loop cursor.
+ * @param head the head for your list.
+ * @param member the name of the list_struct within the struct.
+ */
+#define sbi_list_for_each_entry_reverse(pos, head, member) \
+	for (pos = sbi_list_entry((head)->prev, typeof(*pos), member); \
+	     &pos->member != (head); \
+	     pos = sbi_list_entry(pos->member.prev, typeof(*pos), member))
+
 #endif
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
