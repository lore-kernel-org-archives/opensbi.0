Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5510DD65C46
	for <opensbi@archiver.kernel.org>; Wed, 17 Dec 2025 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEmrynXiQYis7qTw4N/IKvLY7vBO7ZmEU2usUuc/qTc=; b=CPENaKWtErxFmW
	rhYqGLqDo1EGf6UcWwa15wpWY6cE5BGjCEIazMoNp4z8sDcueoM9aCIhuhs06UhBJkPBU/8eQU/60
	kXJ19YvM+V0/bu/GJDXkg1Q7g+Y/EcnIetUGKDU/D3lv/3rAtVoyab0+k6IKoSVwS1996sRYc3T3V
	Wsn/gq0v43HRIX+wYYYCwvT4mQeL2KIx9Zivbq9iKiHpaeLJHxXSCubio7m3JsWVNLYBWxKD/jWk8
	cEOjNk8elqNevssU3ZbPCtE1HPacBtvXI3/3nhlPw3mXqb3hnilG6Wlde1B2xoEYNmbTENVzH3USn
	tT9V0KvmpqBOdvDaGYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrd6-00000006r0k-3bug;
	Wed, 17 Dec 2025 13:31:48 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrd4-00000006r00-22ZJ
	for opensbi@lists.infradead.org;
	Wed, 17 Dec 2025 13:31:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7ba55660769so4602721b3a.1
        for <opensbi@lists.infradead.org>; Wed, 17 Dec 2025 05:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765978305; x=1766583105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDzwK0Mtm7yPyEjl5uEK/H1TTT4dfwzDLrYmM6RpVAE=;
        b=YUwgD5oORVvgi6U296BX1aaHIkf/9WINMeAQbcI1s7JpobJpJR47DYX+rE7Hl/a861
         m8NEw3yz/Xx3bOCqRjY9X7zVwh1JyhMwWOeBAaj7VxTdrepWuvS5rq5yYJhrUqXLgUHq
         exeC0asS4wVMi5N9Z3v+XLTKSJssuGRChAUNwiAv40B5WMZ4GFhv634DUhvLIM7d8WDn
         SBPIOBHsBwxoCY3oBDNqdH97nnhFc3Us5IkKpJfTa1DcokjGfsFd5MKpLajhLvQTYu0z
         VqmQEIW6PvXeadstpTZ+EF3ZK8ptn1UnIQD2vOE+oBRw0ThiMCkjMVCpiiUjQFdLdBsT
         6amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978305; x=1766583105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EDzwK0Mtm7yPyEjl5uEK/H1TTT4dfwzDLrYmM6RpVAE=;
        b=Fi4G1UsSX2nVNDC/+mxpGQZQLzDr52OwvtJy/5CU+G8Ku5jJOLlt8e6SdZDzYAhKdm
         H/s/2fcpbibN3c5/lW9LHOOU0Rhsn29lIS3Y9P7TcsNUrvWoKrHhvwACSjV5+Nk3/3lx
         uZCm+EiaXhoIGRyG2uDPGhH+GT/UeumMFO+THMQlpFGclLQAW/6FR51W9Q8MPD8TRQl/
         pLyq6S4n++Fpzp6HQXMz1rtOQHciaB9SZFdw30Sg6OPW6rgey+DdjB3p24rOtwVHPw98
         SaQLd5VdBBzyqMWplaaXI5SrgLIr/F4iuBOxuHn96WQ8dWmXtxdk3cUgeEleKcyhuy4g
         B1XA==
X-Gm-Message-State: AOJu0Yz8hC07OdiB3wu2HQ9FXI1ElUoUhM6K8K56+nbSlo0qsJcbVGj+
	0Fs17GnwV7murRz/MeQHGNgDAztCk75IZ9wrd4x9Yoo3T1M2vcV4XmIg8mP8MA==
X-Gm-Gg: AY/fxX72Bht7M6YvKuCnNH/fDuOGc8MP5R7fhN3r2nTbG7ieHE+/BePclrtTNWhBDnv
	NXm5iLA92Xs4s7JEhShWuAhFljojTwKj1KhJRrkYCUpOhFXIty04lbFxrUNepuykoy7NeFSGSrN
	nkPgAdIFW4NbiNqTOYCRPEChyq01gqqjaoBMt9ZPV+1URWdluxylGHGyY8Imvyl9kHIu34zhImx
	+JIUBoHRqkG6bvYStW7/yGV0QoIrJ0kzq/CU0stKabkhRlLjgn31TqiGfjE4I7WdEY0swvmUdRn
	2YmnSy8rq+kWpGs1qq1mpJhe2D0L39R8aqSmkJ5s0bg9BQ7hXgf30oG9zDs6uMlr/HJ1kJaHuFs
	fnkEtWjccpJVtMNKX6ujO/aFaMMS1cuUrcs94EK6B0nul/idP9f2//X7c462/xw6q4Ea4448tNZ
	SMyukvx8fuXyBI
X-Google-Smtp-Source: AGHT+IHstk9BaIoisnm1EWO7AFlsnynfnU82cgGQxnefodP3sdauVRlOhBKTT8P7N6xsxmEmJRGZKA==
X-Received: by 2002:a05:6a00:2a06:b0:7e8:4471:8d7 with SMTP id d2e1a72fcca58-7f669e80b7dmr16048095b3a.56.1765978304859;
        Wed, 17 Dec 2025 05:31:44 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc1c4ef2sm2809104b3a.65.2025.12.17.05.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:31:43 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v5 1/7] lib: sbi_hart_pmp: make sbi_hart_pmp_fence public
Date: Wed, 17 Dec 2025 05:29:53 -0800
Message-Id: <20251217132959.545197-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217132959.545197-1-ganboing@gmail.com>
References: <20251217132959.545197-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_053146_532795_6120C92F 
X-CRM114-Status: UNSURE (   8.98  )
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
