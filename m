Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D71C54E71
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/h/KZ/2OiJHq5SaXDGORg7ExYc7kNVKR533lPQY+s8s=; b=M0DAFd6GJqqqf9
	GYpTVS0y/YyubvEp7nF7iPyRI41CAlKpDFHgptE6h4s0k5tikpKy8K/Iv01FVMevtroe4TCB3jKcO
	BeYOcLxUEH8+KEmrOEGMqmGyIUrXuBj1w9ugQCJ5ldZ1L8m0CEDi7sUeKYShSda6aWgaTDQPPlZ9e
	nHl5Vr/QQOft5V6IPa9wScVuIqGrr8t6s9hVIOIWL4GoGSbOovZH20YaFWLAubiH1tfL0LhYKLHbT
	V8p3UqARzoCrtE6CMMpzgL682fUN5Tb36Bc7gDyHL4JdV3ufwty+UO7tJT7j4ZwYeYXO6pAXukIBk
	gw2Ce5eYlYN4V4Wi40bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vs-0000000AgGT-290c;
	Mon, 19 May 2025 21:59:12 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vo-0000000AgAi-3gFr
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:10 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b07d607dc83so3920536a12.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691947; x=1748296747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4hHvE928FcUZ/8LI3recxEEZEJ3VPwoQn/1T/mu5Ls=;
        b=CKjS4pbPaqbZBcBmcGFP6505/EoEyrOXNky+KFE6I59C+bD1BhcPENxKyG7B1RdhyD
         4I3tUbGJC3omRJLG1/prZ+GbwpwpeGx8vzEu8aH1Of5nJOH0MZBSjNOABSqaQyZDG1XB
         jypZUay/JHmJNtCMFS+aj615KwC3KKQjIt+rIZy1tXNVHCNAkyccJUG9es2exkIUsCZt
         Vl9xT3BavPuZV7RHc22aN/4qDOQmvpdS6gwCsaZkb6kppV6PNKFvXq9vz95VD1rIQ7xH
         CUr0YKTfy4+z+3hkaILAvHvpi7vPuOESPpAyTt+AnLnxpqgR11gVbsGR1NPOTp3lYWui
         eTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691947; x=1748296747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4hHvE928FcUZ/8LI3recxEEZEJ3VPwoQn/1T/mu5Ls=;
        b=dlZo6jpwqBUcau7Xsd6Nh9c9j+O0alNWgiuaBaGXu2j850t4WMYlKO3U4M9KEJ6fqo
         PPJNcia17Xy3Mf9+w12flvlRmC32yfOeq48gKK5CtJLLtEsOxQ7/Xet/J3U8ebT+oT91
         c1Cm928jv0TDMSo9wrjA0OgoFh0m52nUO8OaoOdBmKv9FCHTtTGCgh6UMIgjwLmtmoOT
         V+0tE7pUkm0d7h1STbG5Ev5w51ERJI7LnfREEaTvnH5dt6uDVIFuujZm3woBMk6L79Ye
         5SkP7/nJWcRXXjXYEnGGMWon5Gg1yWsa0khwuX3GEA9ryqIAsXGeD9DW1NU0Sd0JcjW6
         jgeg==
X-Gm-Message-State: AOJu0YxeYO2Yt8tDmoyq7HdPzP/tWiu2ut3DUx+Pa87317VL19T8+r5G
	i1kl6FiMgzPxTafFt/dSuTvsqZ364uykUtT3ZiXUbDY/aM2njFWqoEggpiiOcJvT
X-Gm-Gg: ASbGnctiEKbbDqzuAWX0OZ6/lRrBkzgVSZujOfyNmNZnNmCcvtxeh9moxECM2MeLoZS
	/8r0e0UAASX6PUNFv7lJ6jyRi4Ljx5O0nwQb5tXmFM/VTRkKtQe1Z6vCjvqSPN9fyD3LZw9ocdJ
	oeTxnu+rFfDJ1UknrlhG1S1YMxw+6zRpuuNl0UdIAEJ3+pl2LQPddrXV++KZ10jwvP2rw2qF/I/
	LzBFk0eFFgIH+/wV6/wGrOnaCVdYDzvxp8ZTs9RxgqPOEh1AsmldhUQ31wPnoZV3X181SfHrXIf
	3mBhiY6f0yvrpNeX/dTzb+y2z5W/H5/gXWLplwAYiSEK3L3psA3YJbgM+emqqAiphQ==
X-Google-Smtp-Source: AGHT+IFCGJV9yKVqHRglTe1BjPBYzjQOkDwl57D9rGaqxQSYflYeWuYSX3DphSHUdV6uc5Wq73dcXA==
X-Received: by 2002:a17:902:f691:b0:22e:4203:9f33 with SMTP id d9443c01a7336-231d45a81c1mr200996885ad.33.1747691947440;
        Mon, 19 May 2025 14:59:07 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:06 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v5 06/10] platform: generic: mips: add objects.mk
Date: Mon, 19 May 2025 14:58:43 -0700
Message-ID: <20250519215848.27569-7-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145908_928883_D093A9F6 
X-CRM114-Status: GOOD (  10.19  )
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
