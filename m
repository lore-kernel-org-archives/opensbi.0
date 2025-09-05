Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1F2CA1017
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYM90wPAAENIoDEjbvoxjlaXgMpsdW8mbBiVeuExZTo=; b=QYURPootV4JQS2
	KVKgLsHIUT0zN75CnIFhtPhUj7MxZuaduxp1gkOfI6Pi9wIX9LLDbsR4YKLJk7NDKmo5sSUbP/Kvj
	qt0/AXTSG1jdZoIB9idQBe6sN3q8sHDIybFPU1eT0gm9ZaXrQGjb7HpauJfxOaPRhCtdv2gyX6acT
	OVDC2BPxMNsA6btbQNYTSROZ/ePbXE6FsvT3+VDkW1dTINWBRTa6vaLST7k+xomgGgcJBB/6xitx3
	g6Tz0aUjXNXsXkSZCyoLKXDtpJm/oIJS3COADG9gsxB1+ncTPvgGPTuH4IiW3JViKFs8uEQz950jW
	822v0sWSwCHMeZZTpT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7o-0000000G7xl-2E8J;
	Fri, 05 Sep 2025 02:24:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0H-0000000Fxg7-1Ezq
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-329b760080fso1596337a91.1
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038600; x=1757643400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h20B4XMLgWl9n/BYQROVnjjzIn3WnRzdJgKhCKkask=;
        b=A0V4YYb8EykCj/TIMzhcEd908hJF+y2eh+3G03A1HFPb3LTT5ivmGxfEh8QBEyK9qK
         wgaMDffS4fH13qWtwHrS4CrLbAwHnLbQSNdgYlzWGG8nUg8DPgDjfr26EfWHIILF4G25
         EBibUxhl6hNxcUMkDjlXnI95+wdkuA2ayAoVR9hQx54L99sPTu3o0XvjQqedt8z3Jhto
         RO5X/S46UrFp/1UTzDNO2oWAri0o5VYO69cGkCzqL6NxTK9Sspd/FlOgWpR6/FaEGsde
         J0jwbFYCA8n4XQrD5FgHuQ1MWAVlpCkNV+YNf2br3ybgTG7+zDPdf6cZ9ohuqZsdcjM1
         kNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038600; x=1757643400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h20B4XMLgWl9n/BYQROVnjjzIn3WnRzdJgKhCKkask=;
        b=OZZvAPR2KPovE+p7R1FfiLAAVO0D/H5n+YhvN4AXT925QP+AfIUFeZIJTbYB+BKI03
         JYQrX7m/zUnkS+WIPOXOkp+8hOYOvgbhTAv/OO6oMhzYjhmWeB+/CcKbUVVIJyYrj6ma
         bACuV1hoC6l/NouuO/VQ0ODej8X2AHDBoc8lW2zHtcaM3w0wZincKqH2B6sKSlqYpZcP
         nzA2iiKQGRdnIkPY5Fad6423Ai19HLmjEdRclcontSNdM6hvgoPq5/mb6xewh4KRFV2j
         lfFAkQ/JbFlBxf7ErOSvPJNhsnLGzLurk/T74EeiFKz2hQMstVOCUgxv5rvEiqgNuE3B
         qjnQ==
X-Gm-Message-State: AOJu0Yw0Tk3QvorWyeE/GzcwmOkt1svZqV8pbhvk7b27eQrGlUIfbUyY
	HGu9zA+WUVFMbnWeM4F1U88IoI8ej2OXh+4ujgBlGOGxPciDu/tFQuP81O6wDb1P32XpDVgnK5z
	nlq7DGr6PVIBGD6FFW2Zb34zX0b/NxWVrbZfrkOvUEYO5eTqb/9le7aJ1l7yiinrwFrCBW6z6Ah
	O16iLejyQlJbcthBqxD5sM8rfU/rZeENEG7WsWvEELwPz0p/Fw
X-Gm-Gg: ASbGnctvDgjNPD1dT4Fo7sU8TjsSEzZwOd3ETUhPmEQausW+coGfJWlx2FQU1iEolU0
	0pL5+ddtJn7xE+Khw6GQYQnpkfUZB+ctyYpimOqBdbKiiDmulsai7uS2GZ6IgFPGCPLcw3cySTI
	GjIZXlyX42HBTMiFb2Lf8yLPcDyzBu7elvD7LPI6eWnFGJ/R4XdCDYmBEbEL5e1/zJs1PHCibfX
	cf+4/wxd6g+m0EQ53XMbDHKYO5gbpeGhFTGgARHaDbjuzTcpP0jIfpsIjU3QM80dtQLbEvkqv/c
	oRpN018+2FuEXT38QPi0XPyor3yy/5aK933wimGuJD7kzvWFBocXSBwcT+OH2FVXk7+IaQdUBjR
	nRsVpTJxwJCUBHrMSqeUT
X-Google-Smtp-Source: AGHT+IGm7E2j60WdrEH9NsLzRi8d2wZRam9oVJmAPh0sEls6LSf1WXzdA4SKDF/uHYoKV1wmHEn3SA==
X-Received: by 2002:a17:90b:48d0:b0:327:dce5:f635 with SMTP id 98e67ed59e1d1-328156dfca5mr25417827a91.25.1757038600150;
        Thu, 04 Sep 2025 19:16:40 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:39 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:39 +0800
Subject: [PATCH v6 06/11] lib: sbi: Add SiFive proprietary xsfcease
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-6-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191641_338027_A7E28AAB 
X-CRM114-Status: UNSURE (   8.39  )
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

Using ISA string "xsfcease" to detect the support of the custom
instruction "CEASE".

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index fdcf400aa8c494cd941c412294bd0c118c5ec2af..ff682fb4579291cd9e5fb36ca5ab392aa376d37f 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -83,6 +83,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSSTATEEN,
 	/** Hart has Xsfcflushdlone extension */
 	SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1,
+	/** Hart has Xsfcease extension */
+	SBI_HART_EXT_XSIFIVE_CEASE,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 4160ad6c3d8b31ff9f3d5ab5dbf55356140232a8..2519f3f003ce035289f6d5dd54ccec20b36c7667 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -716,6 +716,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(ssctr, SBI_HART_EXT_SSCTR),
 	__SBI_HART_EXT_DATA(ssstateen, SBI_HART_EXT_SSSTATEEN),
 	__SBI_HART_EXT_DATA(xsfcflushdlone, SBI_HART_EXT_XSIFIVE_CFLUSH_D_L1),
+	__SBI_HART_EXT_DATA(xsfcease, SBI_HART_EXT_XSIFIVE_CEASE),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
