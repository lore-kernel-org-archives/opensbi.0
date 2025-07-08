Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89604C83F10
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hbaJHarmcbmq6YEzo/XzfVN9JKmg7WWFNWLWwfiSQ9I=; b=gxBDHIFKlbPiJyvUbkPP9k4MRm
	NnebEksTLTXidlWQwT6eXS+FNKXctHEAIpqiXHQ/6yROKFt4A+pYbpNysUgQPg9yfsHLxtyAqXbm1
	X9eSecy/4vyrWKI79B7pgkfJUleCaEZGCpDXOiFU/sI9TBD2aPjDaXiesQvGTXNhdYs0FUEsO21+e
	CLetwK97KFfmw4GQRUhwzVOb9D0BOAkOMUkunjWBS1hoSWQasVRAbx01rUV9HtV+HBeBHiFqycNG+
	2JyW/uMh1WvESFLPCTCPHgLbh+Ev2bivHUYUiHXgkr+8gnDlRPg4olP7KvWsbv7q6VSER4u+9Uk0Q
	87GrHDag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3EZ-00000004fQ8-2mo6;
	Tue, 08 Jul 2025 07:59:23 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35c-00000004dN3-47jU
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:10 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6face367320so42401716d6.3
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961008; x=1752565808; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CvoEsl/8r9Vj3vGPuNMX7xxIXQeQuCbsxOThYVSXwiM=;
        b=OJrgt+0ty3c922ZBEcgSZ8WiXi/3DwHRqQ96ImJ1OmA5Spg/5CRY4kx/qE/qhHzLEj
         Kx8blAe40eFdOKIuXqiHrgnPbAStmV1ef3vMlUm96Wi00fzB2LC4Y6dYe9P9D9mr2Mn8
         PNR/6bVPs8njzk+OuhPCDqIf5ztCpKVpsYFUYXeZbn/Zet5Us6vGxcP0XOcK45Ic/cuW
         wWg7FuwVZk4WHM0M3lXKaDnLqDsB3yyrWclPLQC+fOpMAAshIS6D/3tbG31O8JCUbHOg
         nhyuQRuERAwBRTJyhiK4EDw8ynaSTm6MdZTFh8PG/+ja8ARU1ZdIEeiAuUVrfgX5dZnE
         QB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961008; x=1752565808;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvoEsl/8r9Vj3vGPuNMX7xxIXQeQuCbsxOThYVSXwiM=;
        b=oXIJFJij5szs/x3lUtcqodeWY67SdsvLlrbvfaOF2x+9/+YIPjb3MhO27wBOuiPWOm
         l5iaGS37/e8fRSSKVyjjJKltR8PbtTkglzaI1dVNNkRB0grv8E6WzGKjOQ76jIBU96VP
         drMRv/N17JJnzf+cnkeNI8YwUBJYtsvKGLRb87aH6BWHd52h6G00qBA1CgwrojIPe+L0
         4gKkzXNUDAgVUiHwgm0WRLBUJ9h+nnA81IiFR1YXXTjPL6CcdEX0+fsk2cUCFcZMn7z+
         ZAJE9GMsPYqCQZ88hUfQqwpPAfkL8tVWWgCBUOhh2wVB7WKxwq+yQdAfqJHTu1IdMEjX
         7qEg==
X-Gm-Message-State: AOJu0Yy5nl5iREWGiUJAVCjZZyPnXWN6XwMSn5zuSrlxM/JGi0qYjYeb
	ZCnHB3YucUMd1X5YsxO5hVK476vRv0QBeqqBFr8NY16+rDUiX1gD3o0vFgk2rReu60zB5FZa6z+
	0KfcqcDWJcocb3LMfwLALNdi4cF6M1VhKRI1xQfG+4De4sS3BVOcPOaUyizKDROrQ4XmilwfDxY
	Ni6MZX4VcztEe4lKtfKmJEYHuJGRmRK+RbWZYn089iHA7uUQ==
X-Gm-Gg: ASbGncttvq9tLCbu3QHogfy6yTbnXThaVCJLe8eJRhWppQmEI66qD37MdiZid0cnI6x
	kyV4Mo66mv2osL75H6Z33WdLSDdl/DDESi7hxHYCfyXYbnN3lVVW9LY4x+ERkVCiyS0xu5F0Znz
	7jEIB0buMJuYGuy5AH3/Ryb4D7b5/DamSujMMsLLZBPydeH3wIgSJclzIW+6yLzbC5u/F0uwATZ
	8kJAfscNSC8Bsg/c0LGxCyJy02EvNuQNSEhW6kj9n3eutF5Ugpn4MILDsxzqLsWQqV3O99OFNmK
	+V+Guea8VQ0TeFxbhmDag6ppMOeDLPELFj6YB9eycF3hOepHIX2cpBZ0xOsLMsvTnHbawiQ4DkD
	i9jpAPqpv
X-Google-Smtp-Source: AGHT+IGq/ot00xL4B/VBvvtkujUK5LP6QiOXyEHeql1/apFKwimVwkFMBsvC8Yqnwv7mHQlTQwtmMg==
X-Received: by 2002:ad4:5747:0:b0:704:574a:d28d with SMTP id 6a1803df08f44-704574ad2admr113110196d6.17.1751961007478;
        Tue, 08 Jul 2025 00:50:07 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:07 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 06/12] lib: sbi: Add SiFive proprietary xsfcflushdlone
Date: Tue,  8 Jul 2025 15:49:34 +0800
Message-Id: <20250708074940.10904-7-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005009_022014_62DC9F2F 
X-CRM114-Status: UNSURE (   8.57  )
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
index dfbe8e4c..567e0130 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -81,6 +81,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCTR,
 	/** HART has Ssstateen extension **/
 	SBI_HART_EXT_SSSTATEEN,
+	/** Hart has Xsfcflushdlone extension */
+	SBI_HART_EXT_XSF_CFLUSH_D_L1,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 054a405c..e91e1123 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -715,6 +715,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smctr, SBI_HART_EXT_SMCTR),
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
+	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSF_CFLUSH_D_L1),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
