Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE17CA1002
	for <opensbi@archiver.kernel.org>; Fri,  5 Sep 2025 02:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XaNzBepDp3p5pIpUhDIL4Qmvw4ywfxXOwprCp2NdqOs=; b=tEqanvpWDLJbQ+
	pAKPhY0doiqP3blZ+CZYHg2EQqa8+B8GglQjJ0DaU8n+MSkmyLp9NJRwugvJu+NFONyqF5dfFd7I4
	bPUWc9hRZ7A+MJNqzwjIBNhGhJMNWXg00AVnCJv/s9gpId1+J/MhVHn/JbmDT8Rp2J0Q2hP7yMkCs
	eEwzILWa1UpByvwzp0YVToZg+86U+YMG39GGyV5vACfgVGZpRIfQ4SKC680hy/lKgDFNlAcEPPSdR
	oYyJyCpVXiOvayJHWyx0NnYR1ulPGHlWF1vZGSYzXd80e6hcd+mRHsCp0fkt0GcCe0cKDBasVQyti
	gTDDuFe9kmiPFIKWET2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM7m-0000000G7u2-20XG;
	Fri, 05 Sep 2025 02:24:26 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM0F-0000000Fxex-2fCd
	for opensbi@lists.infradead.org;
	Fri, 05 Sep 2025 02:16:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32326e09f58so1843815a91.2
        for <opensbi@lists.infradead.org>; Thu, 04 Sep 2025 19:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757038599; x=1757643399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V84+VLBFqIPNXouMrVGdYIYCQx9UBWenvy8rWpfHBRc=;
        b=YgnjmLoPtO7g9QOZXETl/IWm02ZmNYSuI69ypM7Qc2ZPeggSMnFya/Fpkk0ZBJMG8T
         O/8lIMgpyv4QZBSGaeWlHXfKpmIuxpjD9CledNxESEoEStDMX9xpG9aExn+B0+gCz8EV
         O0SR9RDrbaXaa4h6ojlUx7PtQMqkFSMVoKCYmOL34wLObqqiawoJLZ5XRvBy7UFBrS6p
         sg7lPedmHQ4q/FDklAH8/l8JesqcaHt7VC08i6AVicV0V0hYrrkbCMJC0MOTD92LFYz0
         klewW3kh+5jdMNUBoCEOEUIxrqpt2PgOzGUerAXN1nCgubmwrGSpns5Em6Bh49PFJLHY
         HBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757038599; x=1757643399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V84+VLBFqIPNXouMrVGdYIYCQx9UBWenvy8rWpfHBRc=;
        b=Ix3xbL/cJkq5J3m+lPhXdLIEEdvuFRbQ/ypkspT7X+n/ZHJk9gi7BVBdiTf2DtsQX+
         1T6atEajrgUq6Yq9REbAmK7q0jv4XQyMc3Zi93y1rzN5x+bm4nB9/reevaqgf4OG/fUX
         Dsc5pIMDUG6jf/tifsRJbDhXCMPyHgr+p/fWqRKqPugoHegf5KTAEMAwYZSV46oOMCVA
         /Wjpoce2JdB/HnvsShC/FXoTtw2SQZQONCTn2xXX0ZhGzBqheoQ/XrVH1zAbO+oMbaMr
         ZKpEF1wBk74oZ4mmc/sI/vCzde3iQfv2ttyt3nmlROxu/3m+LNN6QuAe+79jECjulfh4
         VQ6Q==
X-Gm-Message-State: AOJu0YylEwmjHcrHXUvYSWZ4gQ4rbEW0rYiUeq1yOMeasOzLdNgKEz6a
	eQu1iRj2trN62DFJfExVCvtF97q6F+ko8o+Eo+OYvld7BUVij0Tt+zWevuc3CFWwciqxOKQYWdZ
	ixf5uZh82BunSZ+lf4pCjiFujtbcLl7xSVrUrupjVjeMBmSWwKt+bmf7iLygXB//+M4Cqr1+65p
	V1RKIUme5oe3A1SzzkCM1FAsiiO+DMhIlCkdrUrYyOlGTVUMrE
X-Gm-Gg: ASbGncuOwOGej7TO2GN+J3kWvpDTu+dhpyCjsSO6Q3TJjcOJ8AXQSBLUGNzsQ39D3NF
	SxyYZvzqykAd6SRKz0QTM4GrAWJ4EHZNGGobqvvc0vgtT1jsVz9qlkW0bkq1uzgdmHWVGcMgeLV
	/uF2IZuDYNQGVZwQj42sYdqMBP9Oq3lsAwvUHj3UHRlby92/W917aIJgeTgkLGDwPtt2ttPjsfe
	jzxaZiROor+9XldFlxQKrRygEodHfksPrsK2BFVWnEKgC85O5+02KcLlHgDsvnYQvDS0pU4TDSD
	yw5ACUw0C+1lwOHIq8CYTulFgMCS89tap2G/sxxcAVG0vi126PYoDiUqX4AyYlnKfLSKhyGRSpx
	sowbX9nduvMYtADWJFbua8oRNQu8H9q4=
X-Google-Smtp-Source: AGHT+IFXl8AqhU1j3pQUkorGJerT8ZSthyvxbt5JKS6yoEzgHiqxWqXIBy7YjfD2rETfexEcUMdIvA==
X-Received: by 2002:a17:90b:2e48:b0:32b:9595:ea3a with SMTP id 98e67ed59e1d1-32b9595eb72mr5753817a91.29.1757038598560;
        Thu, 04 Sep 2025 19:16:38 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm11048953a91.21.2025.09.04.19.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:16:38 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 05 Sep 2025 10:24:38 +0800
Subject: [PATCH v6 05/11] lib: sbi: Add SiFive proprietary xsfcflushdlone
MIME-Version: 1.0
Message-Id: <20250905-cache-upstream-v6-5-6a6da629c961@sifive.com>
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com>
To: opensbi@lists.infradead.org
Cc: Cyan Yang <cyan.yang@sifive.com>, Anup Patel <anup@brainfault.org>, 
 Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_191639_665412_A3CE5BEB 
X-CRM114-Status: UNSURE (   8.18  )
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

Using ISA string "xsfcflushdlone" to detect the support of the
SiFive L1D cache flush custom instruction.

Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 82b19dcfd4582b39e1dafb6bdb41d2fbe77dc419..fdcf400aa8c494cd941c412294bd0c118c5ec2af 100644
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
index 6a2d7d6f95339b9a6a37f346cf923ec63964cd3e..4160ad6c3d8b31ff9f3d5ab5dbf55356140232a8 100644
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
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
