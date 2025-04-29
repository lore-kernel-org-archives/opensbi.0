Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1122CC369DC
	for <opensbi@archiver.kernel.org>; Wed, 30 Apr 2025 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/h/KZ/2OiJHq5SaXDGORg7ExYc7kNVKR533lPQY+s8s=; b=goKHsYRFEZmLoR
	nZ60//4jROK1wqbpBtcyvpXrdbwKB0Q6MzBBAoOSnDsJZSUdUYIEHj+IY0QYMB9ahjd+6LoDa28aN
	/UQYJVfGrRZatiZZgA6dxkitskJf0quaW671wqjQmWo3PJtAnZxdwKoYENSgS/bt4CW1dLELZq3pR
	T7wFxTlMFWMxt2r7NfkgdpN4hP02kqi8Eb+ktsuT8/28OwvN1jQ+vn227FlhhPhjjd6PofTiNJ+Ns
	Ak9oH4MqpTJrde2sQs/dbI7uJxS9kQlf5EUXGWar1YNSQXMFVC9T3qxF4bK4N/dVcyRNN3nXPEsll
	pc/Q1in8BhC3g8ZUeC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uyw-0000000BDpJ-1wOF;
	Wed, 30 Apr 2025 00:07:22 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uys-0000000BDjV-26GW
	for opensbi@lists.infradead.org;
	Wed, 30 Apr 2025 00:07:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22c33677183so69955025ad.2
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 17:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745971637; x=1746576437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4hHvE928FcUZ/8LI3recxEEZEJ3VPwoQn/1T/mu5Ls=;
        b=TaksKV4ZhDVSTsj6eMJslMQNE1GjIfQwLtjlal/5pEBYKNH/vXYOfsJSjDa+DMWpLZ
         9qvJo3Sxb7EoTHejQl2ofeyMVWtJxoW4jNmO2nxI1XSHZnXuAVZI+PASyR53IaLQDWj/
         k3eThckTHq5QsFpNw7ov6LISmxNm42g+R7M77mu6xylWsbqT9mCOSCC4+rtoTUyYcFeY
         YcV+tpkBSN57tSxfPUIfTogg+j0LdsJDJuBv4WBsTbuBW7ghfBUZDu4sFDB0IBQ9/H4G
         SdUR03A77ZRY+m2DHCLUNRmYObgE5FgSlOESotE3jSvQsI/V8B3HX53nauub6JPS/yLA
         eRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971637; x=1746576437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4hHvE928FcUZ/8LI3recxEEZEJ3VPwoQn/1T/mu5Ls=;
        b=Jrrpzty5b41ka/X2Uk6JUaSq4ToebRR1dxa1MfC85jAHUpb54L7QNt+bCX4LDg5FMF
         xXE56j7vblFTOyHtTr+sWvCWwtR3EMTILkpSgvUs7u1mDZDRMAVfK7orlOc7ZVtQcYcj
         Fk9M81G9Ee2kTsIsujMuUuXfWamoX909vpnFJOlGq344c2gqejOYEvWVNKiG+D1c975w
         1GKRS5NZgku6N6USHKFG2JTHSpmevhJXMXfa2nOCGvNWwsqZpeGCBlzBNZIIonRVEw2r
         s10RdBsPBPyE7P8pSPJd7S5DfWHMIidXnCTktso3ERb6ain25N+hb+UGxGXKXQGOxcD1
         HhSg==
X-Gm-Message-State: AOJu0YzWX4Vd7hExVOVFMTzqS9FMnRGAsPHoHvWhiszrfsLcLvDwXxAv
	xQLz+xO4dpkezVt0QdpmaIxL6oWDa7vmoPdpkQ9F5g1B0hFv+quyQAyBlQ==
X-Gm-Gg: ASbGncs6CDF6uruJOD7xcx90JPFH/38H8te2JAB7xORRwbbuC7Khx7Pc1xfiY7PfhL0
	VtwR93mPkvxUD7kOE0L7NNEqT+HSXb9E70InZqFO5Qh/5dctr13X9UO5qaTweQxjAdfzzr2QJBj
	qldwkjkR8tKV5LLF7WcMzGccJqUpkAqNn1DxinUpXCeqL6K/gLqF0WvLP/0HjnKUJb3rCXeHaoo
	vsc0p6l+krKLdvPAaqAFwe4Xt5lCWvwKmAA2Tk13oTL7lKrDRideT6BIQ3oTmXekefq2POv43Gt
	qCWfZY46nJNQkNxs1q9DagE3j282iOZUQXXbru85tPCtP7wIkBTlWw==
X-Google-Smtp-Source: AGHT+IG1f9y2evD+EVMvXE1ODpOgNBUbF21nqwBqZEic8t6AwzQm0esk/oOhLp0l129iph2J97DhWQ==
X-Received: by 2002:a17:903:2443:b0:223:6657:5008 with SMTP id d9443c01a7336-22df57c9ae6mr7316155ad.24.1745971636753;
        Tue, 29 Apr 2025 17:07:16 -0700 (PDT)
Received: from localhost.localdomain ([50.247.98.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm108953815ad.114.2025.04.29.17.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:07:15 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v4 7/8] platform: generic: mips: add objects.mk
Date: Tue, 29 Apr 2025 16:29:27 -0700
Message-ID: <20250429232928.6499-8-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_170718_567731_351B8EFC 
X-CRM114-Status: GOOD (  10.30  )
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
