Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE3C8303C
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mx8CqNeTbJWnKFL46/r91liyQEFV+fLwoaFfRgdGZIk=; b=fd381mrUOnjI0FmqC5VUx2jevV
	ntYh/QrQ3jDWSlOIR/Evw5Ve9kOuBAPttjKHeh43yelgHfWVByz8TYYti6Bv4W7pr3ajKqKDgA5+K
	hAW7H7i+0kSHcjR8CBpW3XHHkEQXyi8u8uSXHvPK1VijLSwJ9K73o9nr9vVyNv9awUgo6CuXneQ7G
	sJbYF+QJNh9UABXstl7SiDGO1MCpl+MUwht/aDqpNJ0HR1UpLbQ/lmHNfR2HkNlwLtZJfw/w2y+GN
	xBO3tVsN5hLLvyDrn9Qgy0WexZxYupWQyjp+gzScOYa9s2N1VZSuLOsp8TmFfUSyLJkTEDrmqWMiT
	BlGY9dIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Ea-00000004fQm-0Zbm;
	Tue, 08 Jul 2025 07:59:24 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35e-00000004dO3-3D2p
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:12 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6fac7147cb8so75505976d6.1
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961010; x=1752565810; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2RLdXbTXfjA6lX7cveWs0mcaNbEwoCCgxcUOQFjoD/0=;
        b=XhkA7wZtqagJz4QJ2WrkHM6fy7y96maLiiERG0nLr7ow5pX4qJ4bmcY2s0cSjUCYa+
         l+pLkTw2VKO9S4brw4Y/ihFMfRcSn0eBVOAPBJSKfIgUznw2VANLVbKolgrgIoaiLhIr
         uFWIP23crxHJMa23pSn7Wq8y7VVAWxAvaxqd6Ipx4hA/yjA1j1FxeTVpkmGG8zzBEdaA
         I/LWNHl6v9E+iKlNE8+j9/jgY33YQBWuCGr8CO8ABuypl23Bt0U4MbIOKU+5ePfB1hSo
         mt7+9q2zLgkNBiaF76o4i8gTsHHzpfQ2VAEUi3DvStgg9lk/Mz7zz0+1GyXQweE+kWG1
         3SJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961010; x=1752565810;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RLdXbTXfjA6lX7cveWs0mcaNbEwoCCgxcUOQFjoD/0=;
        b=K6M0VXZGuOBzu61O/3R092GiGELfAssQ3b8bMtAf1Enj8mTjeqWPveVYvuQOHBGRTZ
         YX9a2w6TBAqeEMcMX1wlmHRuPBEpb8U0gH0n2RJ16h2dPbZvBanO00bxpWWZwCAaXX9V
         NszJz5hy65nwLyY1IgZZNojdizOBsyjeokRlPfdp8ievrpUZPBDscJJItCx2BS9rsKIh
         q7SQwPHR3ng/1p2VaUhvLFJb1fOhl5fqquXYU2Cg8cMeIU6EZiPkc9NmHTGdga8x3OXW
         mfi7goxlxBKBgveSzOdkEb/0EgdDtoBS7v6ldw0oV1lM6isr5SR6sRmY0uZdRLPnAW9y
         Yzsg==
X-Gm-Message-State: AOJu0YxJ+FkIUbJL4fouirZbP2VrVF0LhZBi8SE6FKt1XPH1cuntqfha
	Nb8DLuuzDOOQBLcvqRvkfAzUH5INu8n5ZJucU7Pi+rbCKpt30cGlSgFdWEF4SCdgB9oWjtUmFVy
	GDMM3zNyz4kyAFxeEDUShrgAlNTfXHc9CtcCRQJEPK/SpQFnR/Ol8xlHJ4pOj962KPg4DUjn0rd
	s26dArHD28qNxmTf66qMpxnREBvhhX0mv2EtwPkmtevbn44g==
X-Gm-Gg: ASbGncvyIjulx7xJaOqsXGJgKHUFnukak4970ZGf1+E2vXyWumn5neZEnXw+r7EkcHU
	dVxlyU78OFrEC6QF2tKE2hUmUgleLMjqKDUnzZHxBeYTFMdJjzzJD/bDFlIlwZI6fpFNMFkCqUC
	hKtFxLd2K0Dc2I+oCPveHzoYzwbOCMgWgeyNTqWyJiZw1bLpz0lvmBDdHNYKoxCv5A//HV12N28
	w+SiARVh3yEvLWd/bmfA5X9h2FJehzNOpp4GmdUusFe6QOasETBELt6zyL7+UW3LYaemMh/s0bU
	w1Zfb5JdIi7FjPOHmdaTrKjS2LtmeJKk/qSjI1X9+EXg5bqmjdFVummmbMDqFg8E0kMy4y4RhfA
	g8+LoDboH
X-Google-Smtp-Source: AGHT+IEf2zuqJmOF+KsK8ARX4I8KUBc11Dy4+57NmIo1Avbg3qNf0pCv9eSO6ufSFFQl7HXJQMdMww==
X-Received: by 2002:a05:6214:5709:b0:6fa:b03f:8a39 with SMTP id 6a1803df08f44-7047cf66994mr38756876d6.35.1751961009662;
        Tue, 08 Jul 2025 00:50:09 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:09 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 07/12] lib: sbi: Add SiFive proprietary xsfcease
Date: Tue,  8 Jul 2025 15:49:35 +0800
Message-Id: <20250708074940.10904-8-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005010_799633_26A74F30 
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Using ISA string "xsfcease" to detect the support of the custom
instruction "CEASE".

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 567e0130..db6f4adb 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -83,6 +83,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSSTATEEN,
 	/** Hart has Xsfcflushdlone extension */
 	SBI_HART_EXT_XSF_CFLUSH_D_L1,
+	/** Hart has Xsfcease extension */
+	SBI_HART_EXT_XSF_CEASE,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index e91e1123..c9036084 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -716,6 +716,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSF_CFLUSH_D_L1),
+	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSF_CEASE),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
