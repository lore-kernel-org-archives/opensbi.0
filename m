Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED49FCA0EE4
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1g5mLlgqua4Cgq/sNv8BybaPPjxvep/kRDQEeWg6q1I=; b=AedrHi+0ysnQmZ
	CK9Dgv/ZhK534nQUBPd/dJnAyzCvEGzzo5s3JWAsLLDXQOWYDX37YxVo65l9t8lwKPoszLlcptf6c
	uhQwurhM2aZ90EDPkTJqnBXVdazDNhLZQq/e15p7LbuT573VGyYaC6hcEsPRogoVUvfAJHPGIt6Tc
	FApQYuzAjsZfU1GSJmiAPtQtn0fJrSs2GZhD4LCUIXfXJIrzJKtt/PIIql9TuiDJ0rk0b/AhxLxnr
	1/PvlOcG4cPvodNqoln+lzGq9wu8/d4ZD7dtBu8sB32MDEuFkzKLwEepDRZF+236xCnY4FtyPkR8x
	nGQN9KmkPm+27WHUZrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0v-0000000HTdM-3SmX;
	Thu, 14 Aug 2025 15:37:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVm2-0000000Gi3X-49ms
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-24458194d83so5113225ad.2
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169534; x=1755774334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eRXhWSFy0K2AoTxiRy+iZQDP5taGkN8Kp/Iwo56p5o=;
        b=aJ52kY9tDEphpczGYDc/3Hlp1WABEDuiI8lX9uSsIxKmwIFCGUUyizmLm/3mltiaU6
         gYwvOk48fE009qRtvd+QcOhyMO+ax0Sh/HZLScmGoouxigz3VpNJ+3FSbf+aqZ+U2zSJ
         kM/uhnzAWU5mW1jJuW7yBHiFZr0pGhTr+pPvO3gZckEmFDwq+MYIK/Pp/yMbHTSpXwQU
         4U7D5LRxq5MqGnk37/Dg1xjW3lYsazIFQTZfwhZUSCEGNyRbYx/oNcMNlSWKYnw3GiMV
         ZbzEBEhmpMmB9Cmf/Fy/8faUyzyA/ImVXDQVDFL/l8xAZ2GrxfF477kL7pIw2ieGx5A/
         KhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169534; x=1755774334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eRXhWSFy0K2AoTxiRy+iZQDP5taGkN8Kp/Iwo56p5o=;
        b=ZilLyNt4ni6+DwG48SA3zJiNl/er5X5UznLEy3EIzQE+y9bKbbDKeFwKHDuZ3XhlHo
         MMOHh368L7LeU6e6ilwfFxP3h2IB2Y/f4TXWweYAKtK8lhTjI7Sf3KVLUJ4bf91nnAEY
         llq5UxakljVIQnssANpv+ysPrLijkwABiUL5NsIbagDCEWp7Sir3llCOAHOSS5qZEh7e
         cbXsRJFRmElJc1yyRJDRs8ZHLwPeXUuAiCTcVcA3tH8ehUmjosM4vUA+AAU2RpvPffkz
         QGRXCrJBYZ4DF05T1j20tdj/sz9pFhs9FVQeuaudLK+PhDD7sHqOfEQ1owLPokSOQZI3
         KWXA==
X-Gm-Message-State: AOJu0YzRcIYjVZXMalVTKlKl/Q4YHJQwOnjwEmIbJWWhDPE84lW26qPb
	8vn/CWt+Ba3csrl9uHxc6oxgz+T3o4am75g3lo6FGKhyS65jzPivZGKWmw7G1kbZRMDyX6yRiBv
	IMc1dDzsGDIYIFQzpxzqXRiHNoI8/nzsm2PyyvMwzAcQLPFCRKe+E0z/ruw6ScYOjiUZ6D5Wbwi
	j/xeE72gEl65dXiwiGglNrFXVNZpMEowiJNL9yTDfqmJTq80a4HGS/qA==
X-Gm-Gg: ASbGncv0kC16GhcgkevgS/8ed/f1YguBJlJ79ZSpfOFIbn9KyUeQaNq5erIQLGnbXd2
	aIPaw4rRjaYLZe65TROiTEIS0uT3bYGLly7J+jLvs4PgMlbVCX4Jzt4DnKv2Il1ECgH4OGEi87M
	mm3ifAWIEAgxkxu7jh0e7+wsy4Qw8ct3VDVIqMl7ArTj7eVnaUeiXSof+BEYi1+zl7qEj5nH9oP
	/wijoR5BB3zv4o+H8Gd18LMSaxBCNEhAWXcFb/1zO+r3AMOdCMPqdF1fILDflAUIQFvmpI+Ks/A
	n6znp0m5AIGaK725p5eloQlbGyaQNTvdw44maGDVb6El4afwRwT2os4qgudawXyRO9bdUvxDwZV
	RiUyGgJV4q1XCHids0koCW4Efap+m8a67qdHAXoNY7Yw4060=
X-Google-Smtp-Source: AGHT+IGlVEqJKEzRy6e9nFaAzlhThWRQx42m6YzZuoY96WFVt68SrgZtW/YI9QhBsxpBOECY0fjWeA==
X-Received: by 2002:a17:902:c947:b0:242:9aaa:1351 with SMTP id d9443c01a7336-24458a29828mr34839555ad.13.1755169533862;
        Thu, 14 Aug 2025 04:05:33 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:33 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 4/8] lib: sbi_hart: add error message for insufficient PMP entries
Date: Thu, 14 Aug 2025 19:05:18 +0800
Message-ID: <20250814110522.18809-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040535_027795_B8017209 
X-CRM114-Status: UNSURE (   8.91  )
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

Report PMP configuration errors when available PMP entries are
insufficient to adequately protect the system, at least the
security vulnerabilities becomes visible at boot-time.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_hart.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index eab27f48..f4932909 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -348,8 +348,11 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 		/* Skip reserved entry */
 		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
 			pmp_idx++;
-		if (pmp_count <= pmp_idx)
+		if (pmp_count <= pmp_idx) {
+			sbi_printf("%s: ERR: region %#lx cannot be protected - "
+				   "insufficient PMP entries\n", __func__, reg->base);
 			break;
+		}
 
 		/* Skip shared and SU-only regions */
 		if (!SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
@@ -372,8 +375,11 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 		/* Skip reserved entry */
 		if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
 			pmp_idx++;
-		if (pmp_count <= pmp_idx)
+		if (pmp_count <= pmp_idx) {
+			sbi_printf("%s: ERR: region %#lx cannot be protected - "
+				   "insufficient PMP entries\n", __func__, reg->base);
 			break;
+		}
 
 		/* Skip M-only regions */
 		if (SBI_DOMAIN_MEMREGION_M_ONLY_ACCESS(reg->flags)) {
@@ -407,8 +413,11 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 	unsigned long pmp_addr;
 
 	sbi_domain_for_each_memregion(dom, reg) {
-		if (pmp_count <= pmp_idx)
+		if (pmp_count <= pmp_idx) {
+			sbi_printf("%s: ERR: region %#lx cannot be protected - "
+				   "insufficient PMP entries\n", __func__, reg->base);
 			break;
+		}
 
 		pmp_flags = 0;
 
-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
