Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9E606A326
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2fQRmev;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=GQMGrfzp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H/po7bJb8pQuUHGXSuuKgMUepunQpFTzZ1r8wiEcY1g=; b=T2fQRmevWFdgkCXCgnXT3FSc9C
	tutLQL7Uh7j+UFOaqPLAs+5b+tXtP1pjZrm+NsqCI93gDC5IFNDSa+GwMjXNZZ/QoNuHaNB1tRk+c
	BjZDntxxHEaKD0nr+yQWY2wu5UhscwrcKNWrN31r3QnIHHXP1NMT0ZZUQg/lf1pZqooXQAsoL3oRm
	gwoiX4Xh1mgd2Mt2kOHVR+jnxHgGl+8MSn6UUo3Wh1isuYBfDT4f3EVQs/WdyfBvFM5jt8nOcaYHf
	8bN35nMA+lbpc2CLOnLz4YUVg4aQfFZTRha/+w8NYnwkrMsrRREeuGgulm6ARRT+fRb6DsFZrZZ37
	gbXv8DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcfB-000000042hx-447Z;
	Tue, 27 Oct 2026 08:36:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcf8-000000042eJ-3Fka
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:36:08 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd623dfe420so2452766a12.0
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090166; x=1793694966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zsHhHr+OhM08auCGT2ZWcXhdaJoI1OoJDBoVfAGYuA=;
        b=GQMGrfzprvFV+AJpO8uCHa8lQbW+u6xEXmztLtDPRRkYOZcNYd3x4ACyWBabvXeH5r
         w1V5riGwLIypTL/931uW2DM8NXqe9eg3GZ1qfTnwGT7B7cGAwf3jWwEmeva7Vyi8MNET
         em4REPWbV4O+sBXWrlMA0PEuXlBMLsM+Jx2xdWDJOJIUZsSx+9U1EBwnt3Kq2oaQUiW/
         iFi25VTdz+yduhlhjORxQV5l6Imp3CchKp0abeigcteo9F8HVf2v7VjC/e3MMEQZeLSx
         QlhpNwf5O2uSNRZmdfoVSnM9E+1kJg7vd6CiM3a3Xs7oRn0U+I+J7H+LVzlFjTtcjhm8
         s6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090166; x=1793694966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zsHhHr+OhM08auCGT2ZWcXhdaJoI1OoJDBoVfAGYuA=;
        b=wihyeRod2/5/3c6jPcu+fTddl5XAGZw5bXuuLPWMFGHsFcwcCl903UffBtCaGRLXML
         ErJDJd0T6bdYN7kvZOV5XK+FB/BIXgab1WfDC4GBP2JCwto2kGRmHqE/JS19SPj2jHcb
         rsQ/Lr05xTgrrrwCG76AiFwIsTiSHk/upp2AtQANNP4IObtRTIqnKcQdEZ9OdSCBnLkN
         g8Cq+cGCYH249EeJLAcJAq+X4+/kHCwsI4UqHkKUJ8WCZVZV1532UtkVPnw04FISrNCn
         gmxZz3GBeYi+XGgonvbEzZN2D4jIC2W+6otgmUbDrPFcYJu+VmHzP+t6cPqFfHusmNI0
         VLNw==
X-Gm-Message-State: AFq9FYIl2iyvrSI9viyGh+1LVJi2E7zGVb9xQJxTshx0SOgDiHoJSLpk
	J5CI9MkZI0tsj43T4smFddxk9SkvSXcSvpcm3W7UDdWVcnzrHPdUM+S2DSJGFnwBdAWGvMxEsYl
	s4dKBXU+lbQxavHUFrY6buqXO4ft6QdKGQtQ+oOJBVQXSHzTeATdHuGFjDwr3g80befig571PNj
	zuSOM31/yzqDYWrTLb56pgXvp8NY8ZReU243OrGGhg3QTVcsJrGBk=
X-Gm-Gg: AYBFou0aVGb0lSF1FoZg3wdS0ljZHr4Yct8SWH3YPNK9Lh9z4GqJ1Tqoa2OMhYguHLQ
	/O2gjWntJ4vl80KOp2AAdPbCM3NiOx9KEBXQPF0h8kE702NGVwcQsIgtuA+cDZHzOL7+Kfmx7k+
	H+j7BxbDBq3PCO15YYXoTbSVHSmcbXWUE7mBu4U/oaT+LcrwFW8PwFC98mDpGkuaaE4KkRXFSMX
	gjB8QUuxqYdOoLvnFpovWKoE4AMf2rLsv2zomdYzrgRDe83gWdAgAr3VKc1OaCzXVa4jr85VL7m
	USdCDtKkWse4UwgVbiY+Rg99mYQngN3+vdU9FXMt4J9uozNUVqY2y+pRussXVctaxvYlUx84Koq
	R/gJQaqbq6rftiWovG0FBpQnhXyFe57PTeiAFpBItDOhSRKcrAnDT5DET2wreOd5RCBxpl0JLNg
	Xoje+gQQBuhs+4InGZYqlLvXWdjpQ/Xtl2MMHORIx0/ViHUQCw/O3gvmFbkiGFJPC5lqHBTwQPc
	ysotH0YwweB6QNHFl7S+neN+gVbneB9b07jJmW1XWjb49vIDTew2OfCABr1O8WJLP7gMKcmxJI=
X-Received: by 2002:a17:903:2407:b0:2e2:da4f:b2bf with SMTP id d9443c01a7336-2ea9c88c479mr83469545ad.44.1793090165722;
        Tue, 27 Oct 2026 01:36:05 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7982dsm5694615ad.25.2026.10.27.01.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:36:04 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3 7/9] include: sbi_types: add PRIx64 format macro
Date: Tue, 27 Oct 2026 16:35:07 +0800
Message-Id: <20261027083509.1076577-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013606_826553_F78244D4 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add PRIx64 for portable 64-bit hex printing. Expands
to 016lx on RV64 and 016llx on RV32, enabling consistent
printf-style formatting of uint64_t values.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
Change v2->v3:
- No change
---
 include/sbi/sbi_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sbi/sbi_types.h b/include/sbi/sbi_types.h
index b8a7e6cb..780a4c2a 100644
--- a/include/sbi/sbi_types.h
+++ b/include/sbi/sbi_types.h
@@ -34,12 +34,14 @@ typedef unsigned long		u64;
 typedef long			int64_t;
 typedef unsigned long		uint64_t;
 #define PRILX			"016lx"
+#define PRIx64			"016lx"
 #elif __riscv_xlen == 32
 typedef long long		s64;
 typedef unsigned long long	u64;
 typedef long long		int64_t;
 typedef unsigned long long	uint64_t;
 #define PRILX			"08lx"
+#define PRIx64			"016llx"
 #else
 #error "Unexpected __riscv_xlen"
 #endif
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
