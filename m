Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7E9CDB480
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tj6qiIxPjNS0JxAKgPnuygcHem506iJAhZw46e9/7nk=; b=AFgI/Sd5B+EUk+
	tjzZdRYDLux0m410/3TvfeOowkF7evy/HA1GJABHsbxpSDPzGfkmLgLFoSpA/uj4IIbuBJKKmsXVo
	wQwE/wmNrPFU5I9b564cU1twGxMHW/t/UGcqCaVbu0eJ80pMtsNOm6jqyjANIZACF/8QFfuOT3t/F
	adWrf6uRegH4IqUCXsdYfGd3F4leLXDd1EiX8U+JHkyO4kg7Zokpv1QCmkM4Rg6YtwLiyYnIEHyON
	JEP8dZO9y+d3fyDPuI3QfrED0eHmG9e5V+E/AJLdrCubGSQT4YzEMjZ0+MrBVMqUuoi5XDs7KIaJi
	ZYDF7kL9VhwXTcyszu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI3-0000000BSRN-0A5X;
	Fri, 14 Nov 2025 03:15:59 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkI0-0000000BSQY-3O3R
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 03:15:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34372216275so1742293a91.2
        for <opensbi@lists.infradead.org>; Thu, 13 Nov 2025 19:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763090155; x=1763694955; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrGTHDzG+UX1RTEWxA2/NZLWgF9HvfWsCAiWvRvyGiE=;
        b=Z2QtvTGfb/UYqJYoS9SR59yMGgZs2/JpwVJerTq1kT+W2XGvpxAUFDUOh8zkku4CNk
         FWN0E1cqXovHYWm9aSwLinm7jb7NatsvVFS0Rci9DeX/kOHDeGV5UVuEiceVSS9xmK4e
         0FOY8FEnsv/CR/wY4mGp4cq0G1T2GlOH+qHDY9VsNAwg2o9kP05mrNBNk/p5fubHF9oU
         s2R9uRKiRWQPJyIr6UmWBKG248/nmp9d0aT9on4At2kvegk3/mjhD6D61rQ+2W+7cvIf
         kII5QZn1Y2sLufJVSruTnJ0MIiff2TzrOhx2/ggUDXmMRzwilIzTvVwcSh8uabnn567x
         k9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763090155; x=1763694955;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrGTHDzG+UX1RTEWxA2/NZLWgF9HvfWsCAiWvRvyGiE=;
        b=hodJeXvNIq4TbhDNCsA+Km9ak2msnt7IeosQdfgu4Gmh+8R7Yd1sC7zDLCOyrx8vAV
         2xfNfzexYGr+WmeAqnayeThxlaD4iXkte+iqnKgOhm7PLsbJ312I1l4H/buEpQvNYgdh
         yXgsAb7SXSlmGjuK4vqTCP1s/KfFk3JYMGwunzli/90uassTetNJSzS8C+GsP0YgqG2V
         uWLlqHL3SGB/J7ZFVfUeSh0E7sizLbAzBjsm7UZXIfznkGz2wLm7VEZZPBvyX64tXgbr
         PnV3z4ou9bZLwkNfF0U3u18kqvO00ZGKV0c+zezyNKvYduYGT7kKxWhlLts7Gn6Kph7P
         YnpQ==
X-Gm-Message-State: AOJu0YxxpRbN1UI71KTx7CKd1dVfRBiLsv2uC4U5EZIoLedncUwrtzdZ
	Thuw2PTlY0dY0KYvzOmO/dDwNUVapAPqafWQkX2P9SZifDtkBiMe5PGxLZBRTrf6oWhXE6dKRkE
	msSNCv+NlL2AP7E1ALkCTV9W7RW5tim32ewW0Bs9rZ22gJ73uBnA8JEc4xlatPucGgu6jBI63+w
	Gxdcq9SQiM8OVsiWlOS0ucGQfMyYrPYS7ct9VSvwkHdUTaMw==
X-Gm-Gg: ASbGncsWTwgSY2BHUHq3ocB4KBZIQaY6vdCHEtSwQT4KSbWhL6f4TE5/O0A3cuAOTvU
	nPXo3esvL22Q/0WfI6WAiwn5H7aIu0zehAqEyWP533RuEWoCm+iR3Ah03yi/B0pE5Omy7Ac9HFU
	GU1uuoV/ZUy7zc8I2zFE32DUmDeDtp8puj+q5tU/0d8gVCyjA1L74MRqVXm+7S5OsVED9xPIUiV
	J6mZGQnn7P/MYsfSIRs+Ef16ztV31gES+koiQG9AwDxtegs413FFZEG5sQCIHBPKlrDehYbXWJf
	qCBYmLc49p7A+VpZqd+ZuAw8T2o15lfEgDTN/u3YqyWhdDemLtJcXoz3gM6mx4RVqduZxZw3qpS
	knQAd4BQO2nO0iLnXCkoQ9o0nck2GmVZL6elZvVQZhgI0AP64elIPLE1X0iR1DdkuN8UqivGsJw
	==
X-Google-Smtp-Source: AGHT+IFUbAESjMSpX4IgTiMhK7leAu2n2yg+bIapyIPIQycYotywtKOFO5z2U2qBI5Ta42iKiQiNeA==
X-Received: by 2002:a17:90a:da87:b0:340:c4dc:4b8b with SMTP id 98e67ed59e1d1-343f9ebb660mr1699256a91.10.1763090154560;
        Thu, 13 Nov 2025 19:15:54 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db22439sm3538606a12.4.2025.11.13.19.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:15:54 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH 0/3] lib: utils/cache: Add SiFive PL2 and EC cache drivers
Date: Fri, 14 Nov 2025 11:22:44 +0800
Message-Id: <20251114-sifive-cache-drivers-v1-0-8423a721924c@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAISgFmkC/x2MuwqAMAwAf0UyG7AV8fEr4lDb1GapkoAI0n+3u
 N0Ndy8oCZPC0rwgdLPymauYtgGfXD4IOVQH29nBdHZG5cg3oXc+EQapLIp7nM0UTN+P5KCml1D
 k59+uWykfpyJNimYAAAA=
X-Change-ID: 20251029-sifive-cache-drivers-bf918d1337ea
To: opensbi@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>, Eric Lin <eric.lin@sifive.com>, 
 Zong Li <zong.li@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_191556_869379_B4FBABDE 
X-CRM114-Status: UNSURE (   6.03  )
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

Add the SiFive PL2 and EC cache drivers to support the external cache
maintenance operations.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
Nick Hu (3):
      lib: utils/cache: Handle last-level cache correctly in fdt_cache_add()
      lib: utils/cache: Add SiFive PL2 controller
      lib: utils/cache: Add SiFive Extensible Cache (EC) driver

 lib/utils/cache/Kconfig            |   8 ++
 lib/utils/cache/fdt_cache.c        |   4 +-
 lib/utils/cache/fdt_sifive_ec.c    | 194 +++++++++++++++++++++++++++++++++++++
 lib/utils/cache/fdt_sifive_pl2.c   | 139 ++++++++++++++++++++++++++
 lib/utils/cache/objects.mk         |   6 ++
 platform/generic/configs/defconfig |   2 +
 6 files changed, 352 insertions(+), 1 deletion(-)
---
base-commit: fade4399d2a47a3ff9c5ecd5dd4c3cba7a4eace7
change-id: 20251029-sifive-cache-drivers-bf918d1337ea

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
