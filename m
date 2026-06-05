Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7BECD6E7C
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuR8luhaf4O+yloKVgZn2l7kvUdCGourc4+3+cYJzZs=; b=IVUEroS0hHwYQj
	A+RT5W5OJlF1rLcDhMgsHZtQ4Pc+7O/ntDy3K/eGQtR4j7pUfjC3sIgMpfzAO8hJWUSBNJiQV5ZSA
	UDQBjZ1LWGAQLL7Ig6h9fqd55vseU8O/Iq3RSU7DhhDttt6TzlqNAp9mAtpR21npiV0qxmNXD2689
	LLLKFRn1FEJv05U8xNq5SKjGiUJ+1WWWYQezWyJ2tMHfcjtHk0q20Y0v1mpP1ICG+qBNkIArWu9Wq
	L2+9/9J/329+mdK6bxTbp1zM9IZBetqlWYPYpU/BgyckBARwb9bGhUqjal3hWiqO8Nv9jxMUbFi80
	W1BQh2Trgh/reXp2hefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSop-00000000Xnp-0389;
	Fri, 05 Jun 2026 11:34:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSok-00000000XlC-32IH
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8423efd76c8so1217366b3a.0
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659266; x=1781264066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V+hsp8+yJdkvMCrdpcbyggGPSO1ozxAsc2VdopHzfI=;
        b=r6sz9sPz6UJ8/MRLjzVW0oj32GE9X/kjOHetmPKWWcxpbsuQW/QJyKauRhhYojqr4j
         k5nJ/uNsAyXtHVgRI/1dBxDwIaSag4YMOEXRemFg8haKJW1RdiSsxBcCvIaIGKNPe7KB
         6oad0m6hc6XD7IC5D6XHMG6GRGqn2F4qGwc6sLW5Taz/IuTWJlCYXcQcEiHDz+ab96jy
         tyWr5h1kBudgH8Lgl3z3Bh5H7xCyNKMzrU6jCaSfkBf4C1AWES46U4BWIWQ6hSQ9BlA1
         OltRJBaHp4DNuSLvJtkslrMxhTIniTgB/A++1FA5sNu67MVb5TnMLJVqJ3/5hsHBmKKX
         T+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659266; x=1781264066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/V+hsp8+yJdkvMCrdpcbyggGPSO1ozxAsc2VdopHzfI=;
        b=d9/6xn29THvC9Wg2OPdS8RBo5FMFOD0E/yBn8k6MCxTXOoKkczXii/szHkT1B/43wK
         TdpnHByxTyOEfSP75T79aJPcQM8DVbqnADkZ/D79+bYcHQTGBDTPboWglHT4rHpeI9Ed
         4ABQ/z8zns9d6iw2dGYi9urKuSzGXOmterlYLshCJHLbrVul4WrgpNB6ye4FMDqisjPt
         GnPE88CULB7DDp4DyHiqJPuMjj+bvzsU44ujY/heSKWEV7Md+jb1Hhh1TBURUXdFWQMc
         tZiDr/g7JzT/au+Lwpx7hMdqQjBbnpUT48nxfekKdMX/1i5bokyUMuOVz5q4TA3Do7C6
         RbeQ==
X-Gm-Message-State: AOJu0Ywv7p+A7hMf7mlC0iIai31Fbe3xIBqaB4OyVXufOOju4Fq8CnXQ
	DPIBeBBfA+8tHx6aRK44OcgOLpNm9u/Ns6OLjZcNS4VxKlYxj+T0+Lu64nITMg==
X-Gm-Gg: Acq92OEEzakPoKmfi3NbIPJu6Hf7o4dTLcrhMmcBVDeCHq1Ox0oJcdI/85VpJ2XWlFd
	UWvA0KNKBgATGvDdUAuIpxDq/R2GheZeNgpk1fH5HSlQwpbizMLVTgyzhKrMSXyXQS9FIs1Der0
	692u66Jmag93BGn84pgCT6P5W9vtAq0bQ9JuFDATIDC0UGyRjjD9zdlu2toWpfO93i1JvwfhnBn
	UO29zcXM1ryzeFyh6Q89sBLT3JjAkJsRX0iBCGYbOoidnfbHvIOPo6796Qs4hU89u9w6MkGH0Um
	aXMiGzpld2Fx69MOb5ZoTqO/IVittRkn/D7m+BViQNcXe8Y3B2qY6M14K7/FfadgWJcfG+AntK6
	TlHXuGU/kl3ZGZDMnqiaswvStPaciI48nQGnYREfSJsIsZzq8DshwPyd4xaaBaoJ0Deio6BWCRn
	RrBgv8bUI0ZoYJzvMRgX8fHMCuJC5jJDGvsa0=
X-Received: by 2002:a05:6a00:3498:b0:842:2ddb:e303 with SMTP id d2e1a72fcca58-842b0d5736amr3389063b3a.12.1780659265660;
        Fri, 05 Jun 2026 04:34:25 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:25 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 3/8] include: sbi: Add GET_RDS_NUM/SET(_FP32/_FP64)_RDS macros
Date: Fri,  5 Jun 2026 04:32:09 -0700
Message-Id: <20260605113214.242-4-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043426_766033_9F65ACD3 
X-CRM114-Status: GOOD (  10.05  )
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

These macros can be used to decode rd' and set rd' in RVC instructions

Signed-off-by: Bo Gan <ganboing@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/riscv_encoding.h |  1 +
 include/sbi/riscv_fp.h       | 24 ++++++++++++++++++------
 include/sbi/sbi_trap.h       |  1 +
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 535aed66..ffe7666c 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -1434,6 +1434,7 @@
 #define GET_RS2S_NUM(insn)		RVC_RS2S(insn)
 #define GET_RS2C_NUM(insn)		RVC_RS2(insn)
 #define GET_RD_NUM(insn)		((insn & MASK_RD) >> SH_RD)
+#define GET_RDS_NUM(insn)		RVC_RS2S(insn)
 #define GET_CSR_NUM(insn)		((insn & MASK_CSR) >> SHIFT_CSR)
 #define GET_AQRL(insn)			((insn & MASK_AQRL) >> SHIFT_AQRL)
 
diff --git a/include/sbi/riscv_fp.h b/include/sbi/riscv_fp.h
index f523c56e..03011af9 100644
--- a/include/sbi/riscv_fp.h
+++ b/include/sbi/riscv_fp.h
@@ -91,15 +91,27 @@
 #define GET_F64_RS1(insn, regs) (GET_F64_REG(insn, 15, regs))
 #define GET_F64_RS2(insn, regs) (GET_F64_REG(insn, 20, regs))
 #define GET_F64_RS3(insn, regs) (GET_F64_REG(insn, 27, regs))
-#define SET_F32_RD(insn, regs, val) \
-	(SET_F32_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
-#define SET_F64_RD(insn, regs, val) \
-	(SET_F64_REG(insn, 7, regs, val), SET_FS_DIRTY(regs))
+#define SET_F32_RD(insn, regs, val) do {	\
+	SET_F32_REG(insn, 7, regs, val);	\
+	SET_FS_DIRTY(regs);			\
+} while(0)
+#define SET_F64_RD(insn, regs, val) do {	\
+	SET_F64_REG(insn, 7, regs, val);	\
+	SET_FS_DIRTY(regs);			\
+} while(0)
 
 #define GET_F32_RS2C(insn, regs) (GET_F32_REG(insn, 2, regs))
-#define GET_F32_RS2S(insn, regs) (GET_F32_REG(RVC_RS2S(insn), 0, regs))
+#define GET_F32_RS2S(insn, regs) (GET_F32_REG(GET_RS2S_NUM(insn), 0, regs))
 #define GET_F64_RS2C(insn, regs) (GET_F64_REG(insn, 2, regs))
-#define GET_F64_RS2S(insn, regs) (GET_F64_REG(RVC_RS2S(insn), 0, regs))
+#define GET_F64_RS2S(insn, regs) (GET_F64_REG(GET_RS2S_NUM(insn), 0, regs))
+#define SET_F32_RDS(insn, regs, val) do {		\
+	SET_F32_REG(GET_RDS_NUM(insn), 0, regs, val);	\
+	SET_FS_DIRTY(regs);				\
+} while(0)
+#define SET_F64_RDS(insn, regs, val) do {		\
+	SET_F64_REG(GET_RDS_NUM(insn), 0, regs, val);	\
+	SET_FS_DIRTY(regs);				\
+} while(0)
 
 #endif
 
diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 3be418a3..281366e7 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -218,6 +218,7 @@ _Static_assert(
 #define GET_RS2S(insn, regs)		REG_VAL(GET_RS2S_NUM(insn), regs)
 #define GET_RS2C(insn, regs)		REG_VAL(GET_RS2C_NUM(insn), regs)
 #define SET_RD(insn, regs, val)		(REG_VAL(GET_RD_NUM(insn), regs) = (val))
+#define SET_RDS(insn, regs, val)	(REG_VAL(GET_RDS_NUM(insn), regs) = (val))
 
 /** Representation of trap details */
 struct sbi_trap_info {
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
