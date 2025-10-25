Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28461CCF9EF
	for <opensbi@archiver.kernel.org>; Sat, 25 Oct 2025 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sg1BJsCw2mcUW1GTZlgH2zpPDTxGGdPE3a9o3XqjdYo=; b=Wsdq7WkQdCltp8
	6Jkp7xrRQIE0twPxTHTmNaD15+7TjoW43uvQwXHtGeHQ1m3c9GUKjRm0S/u2RSxXXeU3LKGlWUJ9H
	XNRhpSAer20PRtl1xauOHvoHQbu8fhdFzQgIQpkd0lU0ucxLAoqxcnie7MWO40VoW2i0UqihMnIhe
	x5FU6cPVDehJna0mxBjszExw4ZH8TRikoltH+l1jAwPStaVwwAhJX94Gn4s9Z2bOA5OzimNEYQz4z
	n6tSy80Rfci3MVQU+I5Jn0xTrEX2GrdyFmIKRq08RgnFqCbGdzNtQ5w1MS1H1hhMuwMN2tbjtawJH
	iTa5uBf70jCvtQ95/h2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaPx-0000000B9kp-1HaI;
	Sat, 25 Oct 2025 09:18:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCaPu-0000000B9ju-1rrI
	for opensbi@lists.infradead.org;
	Sat, 25 Oct 2025 09:18:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2241311b3a.2
        for <opensbi@lists.infradead.org>; Sat, 25 Oct 2025 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1761383909; x=1761988709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obo9fkOu/9nrs21T6qPwyjXXVd26jZpGUbCIfJp4UkA=;
        b=ZfdVJyUx3+xcWzXkYDxaoiPAQFsjr4kmZca1svFQlKhEuNtNg6/3dk7vfHipgtzJom
         bQAE2E1h3fKA+FOlKk6HWAbd7ZzmgpDKC7Mi+isZ4WvaG5p6vMhFwGGjEfXo6Zi9cGIw
         u0J1LvsR9pnFV/CCKacXIeTB7eemUmCFDJ5ynmPCZ+cWTKIFeb1MuXolEiLFXIM4hb0b
         trDfbMFp01mpnwm5+pNKuRGHSNtc8bp4V3N3dPu8u8SjrP8cLeD6raGOtYk6lycRwuP1
         0YhJYuuqoC/oWYaXfL6wrcCqZa3bjK64t5TIx4jjAuYUS6dm4KmqXU60THDJ6bQZq5AH
         5N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761383909; x=1761988709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obo9fkOu/9nrs21T6qPwyjXXVd26jZpGUbCIfJp4UkA=;
        b=MR9M55VrUT2JT9UgOayGMPgEuBeyVtwlWxCPNI08+vaGtg3CYrBALS5QHT/C3HCNPP
         rCVmp9+kaVS4XtYVcXHOAI+LOppAu82mEImbj8gs2p0wnYWfGl1qYdfw3EiGaqmHnfdH
         lCYbR7aIXvPNUmrnS4VtX3zuANqkIalmnyEHT/CixXDqBnks+7XonnyAQ/hp48tpA5f5
         KU6TUBQaQPw7cbuB7n3x9RcLMsVNXuZs7qqAVwnMQVhCT3RIQLRGYZiCnRnWuZ3fDel5
         rbGi/5cwCOCbKVXfpfjfNF6zr7Sj5kHBWfTvUNUrSmsscCxJWbLZezr9jIAi6vZvTpXz
         aoIg==
X-Gm-Message-State: AOJu0YzDKuo4dXbCxZZzxmbqJGZpxLkJT0EQvbtDVmsgSi/ZqVrbVneG
	3OeOKfiuSGVe47ecgOpW1aOpQFB8CuzEuvvCclg6FP3N4EnBmwTIMKwru2QmY0/4UkykJLYsfMj
	clSf6eST1t/B46s8XAlMKu2inth/+87gGlE0FF64E5EPmp6jm1vyK8FdPP0F06+Yp9GDJp8bxNl
	uUpo9ziaDVPHGYe/qzglE+QiziyM9KtUWAd2JfEN9vXy3ifj6n
X-Gm-Gg: ASbGnct45ll6RbgdS34QAiqPoXjww1TfgXoB9mioecavsz2JcMxyPyx8ymBzdbsG71N
	xx/rtbQeZW3Fr9fXJVfcLyDAxfvMrqdf/+Wkk5/UFbKjmKVcHYq7WCqWvbO+lfvtPVX+ShxLoyh
	OnPlYiUMhW/TAsl2o1qGInibhlKuxuQlM3lxSOU1n/kBDd/vqwnm2j2VKDVZ+i7ULBRuHQjK+wi
	gItfwsT1V+BMmV0BUFvsTEX2e63urPIPDFdJ4hDOSJaLDhEepVnHJseIU7Gxs3HxYNZFnHB92CS
	ByYpYjVRvJeVlpbvrhpDr5X653VPg/jKIe8ky1LoAIPwch96/9NkXOD7i4xpk78kz3ebpphim++
	TQws7FXsIQlaUCoD48+V/tOce1IQ/AQWeohFZcLYBxOaSXDRiBYTMoiUBBz7UiNO1f9pQCXT4Ti
	jcvT5T3L1B8uVg6Fd38kce67JP
X-Google-Smtp-Source: AGHT+IF8kc0uYxVyeD1paX9cNp3UYjRpJvWsDXH5dW7NA1h1qPBvc6rfjdDAsjzdJ77HbyqVOyXVJA==
X-Received: by 2002:a05:6a00:4602:b0:772:3b9d:70fb with SMTP id d2e1a72fcca58-7a220b2775dmr36439904b3a.31.1761383909000;
        Sat, 25 Oct 2025 02:18:29 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f20sm1702700b3a.29.2025.10.25.02.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 02:18:28 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH v2 0/7] Extend the reserved PMP entries
Date: Sat, 25 Oct 2025 17:18:04 +0800
Message-ID: <20251025091811.506511-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_021830_644486_AF3A2C46 
X-CRM114-Status: UNSURE (   8.85  )
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

This series extends the number of reserved PMP entry.
The capabilities of the reserved PMP entries include:
- Highest priority
- Allow TOR mode for platform-specific use cases
- Can be consistent across domain context switches
- Allow runtime PMP allocation

A potential use case for reserved PMP entries is to enforce
PMA_UNSAFE regions [1] parsed from the device tree. These
regions may not be exactly covered by one or two NAPOT entries,
so reserved entries can be allocated and configured in TOR mode
to optimize PMP usage. In addition, they do not require
reconfiguration across domains and should remain unchanged
until the hart is reset.

[1] https://lore.kernel.org/all/20251009015839.3460231-16-samuel.holland@sifive.com/

Yu-Chien Peter Lin (7):
  lib: utils: fdt_helper: add fdt_has_isa_extension() helper
  include: sbi: sbi_platform: add reserved_pmp_count field
  platform: generic: introduce fw_platform_get_reserved_pmp_count()
  lib: sbi_init: print total and reserved PMP counts
  lib: sbi: riscv_asm: support reserved PMP allocator
  lib: sbi: sbi_hart: extend PMP handling to support multiple reserved
    entries
  docs: opensbi_config: add description for reserved-pmp-count

 docs/opensbi_config.md             |  9 +++
 include/sbi/riscv_asm.h            |  6 ++
 include/sbi/sbi_hart.h             | 15 -----
 include/sbi/sbi_platform.h         | 10 ++--
 include/sbi_utils/fdt/fdt_helper.h |  2 +
 lib/sbi/riscv_asm.c                | 92 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_domain_context.c       |  4 +-
 lib/sbi/sbi_hart.c                 | 56 ++++++++++++------
 lib/sbi/sbi_init.c                 |  6 +-
 lib/utils/fdt/fdt_helper.c         | 62 ++++++++++++++++++++
 platform/generic/platform.c        | 31 ++++++++++
 11 files changed, 254 insertions(+), 39 deletions(-)

-- 
2.39.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
