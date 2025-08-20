Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA3CA0FE2
	for <opensbi@archiver.kernel.org>; Wed, 20 Aug 2025 03:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K3fxWGu9F1uq5qJPkYjlshzv2oKakPyIbXpdfISlYmY=; b=XnSOQ+82elzN7Xx0WCm+/U63Tn
	s1HKjyiV8uV6cAwduFvDWxZ+PUStzi6VEMqcbTlQumvIXIcd/543BVPW4s04+eBjP5r5b9pBSpcny
	PE9Cby6q3A+vtz+LRsQoFL0kU7l/sUSdzg+1bsTdmowtEfigKc0GZ5zt4fMf1WrUJgegBlOJAqfJc
	PtaSGUr9kk3Ra/KW3oqh/cbowZs9h/TjqjoZnmI1eZcU0BJStNzX/bfh3Qd1BQZE9gtC7gC0oy+Ef
	F5/23Ydcr1n8mY7nT9g43VhSIDxQEMFFgRMVOL/Bnet6FHd7pJV3LCdkCelPuRvoBOi/CtD6n6JFE
	Ro8/xWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZbJ-0000000CHQg-3yzg;
	Wed, 20 Aug 2025 03:35:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZZX-0000000CHD2-2ja3
	for opensbi@lists.infradead.org;
	Wed, 20 Aug 2025 03:33:12 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso5255182b3a.2
        for <opensbi@lists.infradead.org>; Tue, 19 Aug 2025 20:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755660791; x=1756265591; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4d3CT/jsEz5IVpd3dgZX3JabKEzM/pBgUVfC74MRQU=;
        b=JPoA8wvId0aVh2i99cjY/wlJwPGwZ6kZOxmf4ONRoqMVdSiL0ImBXvKIqItDYcn2rf
         ssY0XcAPHZrSLywiyPlqvDnnnkOYAY/0W++BAjMwhPV4I0w8cuZMZvHDVF32Kb1HdmhI
         JDBwlKtoNwa4tv0D1E8Tm53/zrE+l426MZ7K162UAh3/ZcwwidQxuF14+VFdBPZrWEnH
         kWSSCkIa36f3pkFtSZncxFVTHtwrBGWatJlvNuIUwXvN11LP72YJRVpIYCXtRgwrcLHN
         ByLmsWpvXxf+3WH5KE6y3pjs847djzz+bkIE7Q1aYhMuZ9QBtS/m+lapBhTEY9lSc/dW
         PCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755660791; x=1756265591;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4d3CT/jsEz5IVpd3dgZX3JabKEzM/pBgUVfC74MRQU=;
        b=EAXNQoxZjsRJzzuB7JJaBnVFfDbsrETekwe//bPPm7/DQgNwTMh9+KGtobapAtkPEr
         rvG5CXZjGlTFnWRlEBSDwjvFJg1dq22iPJjaNxSWyetVFTKSHzsg7pBSjbKScgYWX3DP
         ifS9FjI7/ygGRAAuDaTWj8AqwKJJt19QMhmCY86YPKPtlVuka83cITpB7LqGYXYbxnqk
         hQvFgx3kzu7UQ4UVNBuXYhwYZhO55yJvrWvp0rQdZd2tORPSAQAXiVwp/P2t9U0SOveD
         eNAdgaeaFXRNTCmvOqMB/2PCbO9UJCXmwZqv99RVJh8D0BOkwmOqzrq+5R1l3mK2M792
         qLAA==
X-Gm-Message-State: AOJu0Yww8QauG5ZgSj3c8ysdJP5/loC4RgkkNc3SNVLRjUX54txNFLio
	MLsVHDlNqyNCLh/YVYbGWhJPxugCeRKKh0d7gXBBuY1PgMNC+xwV7wAJJ35QwQF/P8FE+Ww7KIP
	tHQFVvaxt20yDb/14cTIv5AFKiKHUqybhXAyj5itFlTK/LkuMTvkli4Dy9PIN5WPJqVr1u2DxT7
	XpoIaKCn2vIvOlxXf977gMUjihblH3k+B6GyU3iVUnFF0/Qg==
X-Gm-Gg: ASbGnctdYX34SnhXK5bdLCsnAMvmOdyGIGW7VrZt+4TMc/1rjlXFMjYUR/94uRWNCYL
	K9XSCxWB8mbA4FyKgre2Dyo6aqFFhVfkwqoy+bRfQePXs72B8KbMMm9ZPViLJDMsrghEvYxvE3/
	oh9oQNdq0LmnSA5ld9bZJwYX6zMbWOemO9fHcAXShaQIxIiiEejLPut6omem0aDgM9TJ7HytUXo
	XqzhhEiZwLuYbuGkUocaoA2qBOQJykhLBSaNsuAqQ7Zaa1CtHZWGLcDRLHJSm7BxIw23fucXZ/w
	nmCrq5zB0URe1lBrmfprTwQdkwnAA93S1l61Wgmbj/EBFvehpK8mAJEJAsXVwYUoA4+x0DfyyQz
	iqWEz4+XOmNOyEcryTf/ivZFincft9OIvk1oLl4ka491q
X-Google-Smtp-Source: AGHT+IGSJCCyWM529U04s+Y+xZhtkRu78Gr3QalUQ9VY6sZt2ueuigKJsd6sAKIjMmwLGfnCS5jqwA==
X-Received: by 2002:a05:6a20:431e:b0:240:4d5:8fe1 with SMTP id adf61e73a8af0-2431b7e8466mr2512907637.12.1755660790510;
        Tue, 19 Aug 2025 20:33:10 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e252ea41sm738430a91.9.2025.08.19.20.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 20:33:10 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v4 05/11] lib: sbi: Add SiFive proprietary xsfcflushdlone
Date: Wed, 20 Aug 2025 11:32:44 +0800
Message-Id: <20250820033250.544-6-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250820033250.544-1-nick.hu@sifive.com>
References: <20250820033250.544-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_203311_687616_F4AF2F11 
X-CRM114-Status: UNSURE (   7.95  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Using ISA string "xsfcflushdlone" to detect the support of the
SiFive L1D cache flush custom instruction.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 82b19dcf..fdcf400a 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -81,6 +81,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCTR,
 	/** HART has Ssstateen extension **/
 	SBI_HART_EXT_SSSTATEEN,
+	/** Hart has Xsfcflushdlone extension */
+	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 6a2d7d6f..4160ad6c 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -715,6 +715,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
+	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
