Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED92DC369A8
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/h/KZ/2OiJHq5SaXDGORg7ExYc7kNVKR533lPQY+s8s=; b=nzns1a3GfSCS20
	jFu0xMuf9j41h7RPTxYglyqkBffg7EAQbIqqCbgWTAEDnLKYzZpLtSUPLk5FZVwySg6GHiYkyhT7Z
	WCeBXBL2KdG5ofyrVfE7YpNlRw5gTEqoSyShbPQ15tD8+Nuwm6CBPcxuTZYYB9/d2oMrLhB/Mn7oF
	VRVA34gMPu4cGJHuC/k7je7KFKK3LsHjNIjMWBUxsgut/i7oFrVvqJjRiTOPZ1z5VfEDEK5j0+Ztf
	EhBz6dt2rTi0n3s9zpXLWCKn8Mdf0ta3rWCxL/072tk3LadMGMaNdosdm745bVAhtL+isunZlLRUu
	OfUc7hbKHD4q3BXPvHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rj-0000000C4CL-0pxI;
	Thu, 10 Apr 2025 23:36:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Rg-0000000C48a-0Cge
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22a976f3131so15504915ad.3
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328190; x=1744932990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4hHvE928FcUZ/8LI3recxEEZEJ3VPwoQn/1T/mu5Ls=;
        b=Ot7x+UkgURDsOMPEMdGvT3FI72Ffnk6E08uQLCHuIZXHj2AsXjM2DeRMnwNVaNnQQm
         80XmpdOxW61iaGzO/J6QhEaGrw9PgdjNOdi2o/qDy6zHmZOxPBAc4xmbuPFKIWJG/wRJ
         mYFTfOmgdfmr7edKkUqxqsO/Vt4cK0itnD8cOn1MXpydmDHDdu2jm4fXYGErw/rNRWpQ
         9RvPbp1FhGp/wRTVR5xj8z+c9cMIj/Apt6M5aH2HNodtr+vTwKhjIQe16BCOQrrvOX3c
         +ZdIEzv4SH/Su19QuR7lBrFyBzOc6RjhDjZ5SQz5tSAJGf+VUNZEUFG9KB1+dLAuo/4w
         Aumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328190; x=1744932990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4hHvE928FcUZ/8LI3recxEEZEJ3VPwoQn/1T/mu5Ls=;
        b=I8/eGn2GCWNNso0llJSxNFz2l2/Y8eXsMbhYxGL5RPB0XXf5JTuBFEM9F0JS8T4vzA
         PfWYbKRFBBO47O+wKibsXuvEL26/8URW6OI7XbHnMPMAcaCxgBn7aaava4QemQdlerlN
         YCUZzmNEF/39FilmWHuoLZokxEcmGWtTLE/BoPV9eCX8iLGzFqxFXgOCDID679GzYZ0D
         6CkCAwBuoX4Wp+bydI8rMV85wqS3M/w+rLb9171Uqw39RWe9JF3GrabE3YsH3C5LJm4c
         ju9p/iZ8FXxIc5kdQIDxI+VKctYjx86XNktHwvb6GnX5OZMtsIwt1tCKWII84HG1A1t5
         SXmA==
X-Gm-Message-State: AOJu0YwEd+m8h+Rl7t+XaQQI1VvFWNhP9WijClvjybLFgUoqyP1PYtEJ
	h106umr30zWBnFQKkIw1Jcrc3CyUYwBPu9kds+IzXJ5QPNTGU6e58+iijPVr
X-Gm-Gg: ASbGncv48v5Ajgs4MUvZ52HSqBAmzPNZW8aUHTLCji1hYT5zI/wLj9pYMYn+hGMe65Q
	zGVWCPSr2NCAESBKvxvllxenj8gbT3yC3cZQN8pIvBOL6ZKRy+kmMgebUYWsk7/PHLNd3/WH2HP
	SLLJL7yAvS78SG4M6FWOAVOLAKlDT0S+5O9+0MLjWLG6Va5SLQmoRTG36SbiP6anx9VVV0ps4tx
	uipaNGWkQIBRKptpXpBeyTRsiFuvphfY2FMzAxxf+JvfDEtUcxzDFgo5zjOQSvi9lD0hFdB+trO
	WrSIUa0BQE9EPeDfKE3LwNsxqVdD/m+dLmudWtOzEnt4DckdgwnV0+g6gslKEJH0gWzSw3NtMvN
	H2yFtXd8C1HIrFuQ51rrEfL0=
X-Google-Smtp-Source: AGHT+IGr0kuDEGwdqlEot3uKDmehfwEETED2DwNmLSBvXynAJweByfQA0HpsDzqniUMvNepZg26hzg==
X-Received: by 2002:a17:902:f705:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-22bea4c6e17mr11716565ad.24.1744328190124;
        Thu, 10 Apr 2025 16:36:30 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:29 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 8/9] platform: generic: mips: add objects.mk
Date: Thu, 10 Apr 2025 15:45:34 -0700
Message-ID: <20250410224536.25021-9-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163632_088028_9AB6E1A9 
X-CRM114-Status: UNSURE (   9.76  )
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

We build MIPS files.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/mips/objects.mk | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 platform/generic/mips/objects.mk

diff --git a/platform/generic/mips/objects.mk b/platform/generic/mips/objects.mk
new file mode 100644
index 0000000..6b051c0
--- /dev/null
+++ b/platform/generic/mips/objects.mk
@@ -0,0 +1,7 @@
+#
+# SPDX-License-Identifier: BSD-2-Clause
+#
+
+carray-platform_override_modules-$(CONFIG_PLATFORM_MIPS_P8700) += mips_p8700
+platform-objs-$(CONFIG_PLATFORM_MIPS_P8700) += mips/p8700.o mips/cps-vec.o
+platform-dtb-$(CONFIG_PLATFORM_MIPS_P8700) += mips/mips,boston-p8700.dtb
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
