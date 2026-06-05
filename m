Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB0CD6E7B
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPsKGrI+dzigYcJMiloAmPomTt8iOG2I9m6t4MwevYQ=; b=47P4j4To/GuDGH
	wCF5jodWh2kPgq98LJ2DTcHibqjSY+w+5m4sNagcglEWZTe1NaP90LO2IzIk8DjNvYKkOKWFrNqYF
	TEr60oMCUb1leFQNJXnZhZ8B4PKScy3erJ52uYlPT/RKeReN+NVAFX0IE2KSeNPJPJK+uSHZ7gFnX
	H7GURgKbu5UgAfJ0yuWnr5gdDW6HN46IItL+6aa80IC2lz3qXMCg73Jb3I7tH7CQEr6nyHuTSjLV3
	mOWm64Fkue0lUpWYgjH+MJBapAhC0ya/wsURhOITSldiiRiq1EbymDXuKzPdN9F8mkbprw4ut6jyu
	JpKB1ZkMDILR94c+f/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPSz-00000000H0l-3HTK;
	Fri, 05 Jun 2026 07:59:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPSv-00000000GzB-33G6
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 07:59:43 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c8584bbbf2cso1011315a12.3
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780646379; x=1781251179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4aItUS4veGbie46W42tIMQg+z6aR+PPe6UQTvPu04s=;
        b=n3+un20C2GrZoic9pAIuVNasSieNhZ8RgWUpBsHEisFowJsrmCV5E3q10rO7zxUOuW
         qjAbmT2JppjWjZYkwr9hGRUM/BYkUp8sCmA+ddyDzuF/A90L+FhdATxWyzoKHLXkWTK1
         7Paib/KRjOhIdIEkM/g6J1WCt1Z6h2toAzg7jCOfovp7dFbCiqLCywTbaFJLQJ7fWiyk
         mcnh+PSpd2Z1t3AWQZ545NagQNpVZn0CduyxqfeiuDBf30XpNgZ0oNFAnkgfC7KmdAxh
         GHMAdlArGNm9ApwzEkzXktSnPzE9OwVAxySNfrKEg6pwjrUEA+KY5jCRv2nw5FqT+e39
         8yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646379; x=1781251179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4aItUS4veGbie46W42tIMQg+z6aR+PPe6UQTvPu04s=;
        b=SZSJrSC90/VELFAnHDd/QB1Ym99mCKfRwmxunN+Zofp+RTcC1XvIxUEppM/jumonKH
         iEtZTVUqQzx+GaE9e6tayxntyLcVPmqsplBRVCOHfpwVzu4VfyE4byeLgEOcJZA41f0Y
         FWgJ4mNzL/RHvUTxavJ5P4MWpWLycd+icquqb59XMBBv3JVjcQ2oXtzn4DtR0DKXZUwB
         KIZrGbdS4oxpvIhEhyGTky6mR/T3x3OimgqyJ8YO/Q9C1o6+IE+tsK63U/DkgIpvJMW1
         0yDyT4dWhJtFZggYXZ9AuIgjAWHR5cZgCiSsTVnJQ3Xp+kQ/NmTCZN/2fmqUBmZ0NaZJ
         E7Zg==
X-Gm-Message-State: AOJu0YwvQAdlPK5OwzB1XYmXkoKs7i2FEOAwGm0z5jF9efVDg2w7c3AO
	zLNqP+x4K321QTG24NrK5hWOBcUsippm8U47sNcWXKrVXiZMPsDBmX7iqwzVsQ==
X-Gm-Gg: Acq92OG/hwXdWkF4MlQ9fM8OHqj+tupDCGCsG6XWMydsEgNvMBauU+i/Emg0mSizIWu
	SYGRar4yEIDSlUcheJ1JPp9621yWLZygHUG4ZzOK5PmIgImhKIf6UYtnlLdhLIgln8p5mujKbEo
	Pg1GVrQNblANOR7adcrsn3YHfF0I87y5hKTokyMNarsntoKM49B+an69qua1cQrGFx3krc+Fbi4
	iIG9XStiIEzky0hD8xpTdLRNAqLOXxwGMFJ828jgGo/OBnUOnccJtQ5i+sHODVnKa8JIKtEooNj
	VgMPEKyQ1l2PxM8yG9o5DR7k9Ao2z/VsFSe3chZDULyuQEkqXnFsBR76qmwQZF0GrR3CH07S9TI
	q7t6pC6m2HmNGsvAcPCm01F7vDXvquQV+QNmynmUs/ohqKy2mCiEBCywXfl2A/xMTNvCUu4piK4
	li8IuG8DfBEWZHHKNd3dJqlbsRcZvUAgsV2v8=
X-Received: by 2002:a05:6a20:d529:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3b4ccd56df5mr3504638637.12.1780646378686;
        Fri, 05 Jun 2026 00:59:38 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm6883862a12.26.2026.06.05.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:59:38 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: nick.hu@sifive.com,
	linmin@eswincomputing.com,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Subject: [PATCH v2 1/2] include: utils/hsm: Add __noreturn attribute for sifive_cease
Date: Fri,  5 Jun 2026 00:57:07 -0700
Message-Id: <20260605075708.96-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605075708.96-1-ganboing@gmail.com>
References: <20260605075708.96-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_005941_826307_AD5D48F7 
X-CRM114-Status: UNSURE (   8.86  )
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

Decorate the sifive_cease to allow more compiler optimizations

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
index 7e9180ea..8de853ed 100644
--- a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
@@ -7,9 +7,10 @@
 #ifndef __FDT_HSM_SIFIVE_INST_H__
 #define __FDT_HSM_SIFIVE_INST_H__
 
-static inline void sifive_cease(void)
+static inline void __noreturn sifive_cease(void)
 {
 	__asm__ __volatile__(".word 0x30500073" ::: "memory");
+	__builtin_unreachable();
 }
 
 static inline void sifive_cflush(void)
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
