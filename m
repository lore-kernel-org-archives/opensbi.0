Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5F7C369AB
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iMwPQlQjTj/42b5otxjk9NpwiHdNZvDu3AE3KD2FsYU=; b=Ed+
	nsAHJCNt9e5kLXKfcSPTu985BGVbRU3ftA4TFOZcoaqPmCJNUw0bvwPZw4xENPE1B/8YQ06t7yJ+F
	pzmsZSmsoF6NP5uqejfHMziHL8V5cc4bPDQil6k9JASgPhyedKgWeFEFQ2gjh/pl0orSMhfzx1ATO
	vS0apNb3/FQkXAydaIaNJi9dmipE71G8+unxKAAZHOufWJyPw60+Iqjy1Y43iOQWV7rKzJsl4MN4y
	EJV9Lgf1NLe3OV1cDLgG0qDl4Qn7DAsF8WAADBWrQ5escKDmqPTElkkJpGJ1/O6f+ijjGVmnag0Nc
	RmStpltEPiG/gMMmpn9a0lNUMps0OMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kaw-00000003hXg-41cl;
	Mon, 21 Apr 2025 06:25:30 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kav-00000003hXL-18lQ
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 06:25:30 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so3315778b3a.2
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 23:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745216728; x=1745821528; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0k4I+Is+6wbHEhTHim8+ONp9zR3pLpV7zIfzsYA0QCI=;
        b=KXOJe7B27dpuyTkPwB+ScNGgD0jbMi8ZfJ2nhnCaDSR1znKRQGE+F17wFfQGLCJO5j
         EhYBF6fkTcNjMcMBvE6dbmzqgseNNmJjq2UcU6EihKVgBs0TVG2LxDG8ERhN3kYTPmwb
         xXrCqd2OnbtguBcQEepFjBHBWjNxtYDBRH1eewq+23GYHbF+pwPLNtmziy4XkETuCPSb
         Q3m3+ioiIOjGZ4B7ipDor71Hj1H16s4FxEoomh5v8PsfPBQy2Q4hoIhxXXOy4QQ1tHE9
         JFDqXhuIAEc2sJj3dYRPKjc0B/IM1rbEuGFmWVG0cGNGQjoOsa+4YxUMDdukBwR/+Ebz
         EeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745216728; x=1745821528;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0k4I+Is+6wbHEhTHim8+ONp9zR3pLpV7zIfzsYA0QCI=;
        b=seoKfagMXK75yAv3kbs6y/IFQpCFrSLZ96uLjd830W4d/QDNnyeNqer2yWZ8FVnmko
         VxKt7Ihei3x8giur92DIdwt+4NcxApLV69rwUImjJL7iDa/HN6ZtkxbCfMHYgfNmFCRm
         rmnn5luCi1YwNtxT3ZWKcw7rrZ00eanXJWXf79jXkzl8hNqIAXVXSD78MEaYt9txLLRb
         1IsiXdDezRs36dl9xYXshGrImIhfS0iuIjDo1GVFVzRpFoVSLU43EEzjFZlFuDiwoPRK
         23aJtFGQ0/fznxZl5sDUadJd8tlMOemrZQPWiL/yLrdYSL49CcjifL8k8xe1nvjpjVXs
         DwMA==
X-Gm-Message-State: AOJu0YxQwdMeYLqRWUAyIX5DgMAgoQiNzthoPK8AeVZ+JlPMTkDu0Cv2
	mkX51/d9QpDZvAp5EVw2TiJUPGMIb2U2i3Jp8+kLuCXErhI5JQilUO7mhqmmPHqKFgwPAE21RSI
	1FBODQ0SBHrTGPnw0syw2EVdIUuupgyzOl+d8VDZNI3UAhf0N7qnO7meDrtJAfrTOyK4GRCT9Uw
	4jYMKMCtnsOY2LuFAZfMJimRlVSY7H9pvj5ui0ho7aJg==
X-Gm-Gg: ASbGncsPzWBNOWl+oP0+w6LcYfl9H9yOUvNJtzDD/JVBOKgyB1v25eLZVvksawf1C0f
	PRavADuQz1zImUOFTb8tqRVD58aYJWfzFek1sxjQxHW7/CLXWL7dLV2JrMVTIs97YboiNWoNEp+
	zhBFi3ORx41QbYpFZwjLqpnths+xUgqTXEcaidCIfMTGQAd7Hs/mT8vNrYWn4TndKQM8oSBvZZO
	05/ukf/HlEoD//iUPKy04iYDljySwBEOSWdxTu7nMBPSP8y1S/yrAovDOYGkopuvwX8UwDEnjuN
	6XVS8iqKg1+ni65l1bjUgbYNlKatsJv6IDTAFulNPGT338EdTW8Y2sG/36d8sKA=
X-Google-Smtp-Source: AGHT+IHDsBivEWd/ZvLiIpyyVOZM/PkjHEDhZiAa4JIHHKBiB+zGQ1B4aPwQ011XEF2eAoPRzrV7vg==
X-Received: by 2002:a05:6a00:2e84:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-73dc15ca18emr12259469b3a.20.1745216727549;
        Sun, 20 Apr 2025 23:25:27 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaacf3dsm5961043b3a.134.2025.04.20.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 23:25:27 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 0/5] Support external CMO to flush entire cache
Date: Mon, 21 Apr 2025 14:25:03 +0800
Message-Id: <20250421062508.21187-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_232529_327167_54F51326 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Some features, such as power management, may require flushing the entire
cache before entering a non-retention power state. To support this, a
simple cache framework is introduced to allow the external CMO to
perform a full cache flush.

Nick Hu (3):
  lib: utils/cache: Add cache flush library
  lib: utils/cache: Add FDT cache library
  lib: utils/cache: Add fdt cmo helpers

Vincent Chen (2):
  lib: utils/cache: Add SiFive ccache controller
  platform: generic: Add SiFive development platform

 include/sbi_utils/cache/cache.h               |  69 +++++++
 include/sbi_utils/cache/fdt_cache.h           |  34 ++++
 include/sbi_utils/cache/fdt_cmo_helper.h      |  34 ++++
 lib/utils/Kconfig                             |   2 +
 lib/utils/cache/Kconfig                       |  23 +++
 lib/utils/cache/cache.c                       |  46 +++++
 lib/utils/cache/fdt_cache.c                   |  87 +++++++++
 lib/utils/cache/fdt_cache_drivers.carray      |   3 +
 lib/utils/cache/fdt_cmo_helper.c              | 111 +++++++++++
 lib/utils/cache/fdt_sifive_ccache.c           | 175 ++++++++++++++++++
 lib/utils/cache/objects.mk                    |  14 ++
 platform/generic/Kconfig                      |   5 +
 platform/generic/configs/defconfig            |   3 +
 platform/generic/sifive/objects.mk            |   3 +
 platform/generic/sifive/sifive_dev_platform.c |  31 ++++
 15 files changed, 640 insertions(+)
 create mode 100644 include/sbi_utils/cache/cache.h
 create mode 100644 include/sbi_utils/cache/fdt_cache.h
 create mode 100644 include/sbi_utils/cache/fdt_cmo_helper.h
 create mode 100644 lib/utils/cache/Kconfig
 create mode 100644 lib/utils/cache/cache.c
 create mode 100644 lib/utils/cache/fdt_cache.c
 create mode 100644 lib/utils/cache/fdt_cache_drivers.carray
 create mode 100644 lib/utils/cache/fdt_cmo_helper.c
 create mode 100644 lib/utils/cache/fdt_sifive_ccache.c
 create mode 100644 lib/utils/cache/objects.mk
 create mode 100644 platform/generic/sifive/sifive_dev_platform.c

-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
