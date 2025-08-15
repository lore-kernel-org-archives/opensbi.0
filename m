Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D14CA0EE8
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XaGOpPzH8hAujeyZctD5yk6CeIfJyn5JKMS2YIWzry4=; b=bOxXfVUnHXzB6d
	rfDVB1+vhN5+lexqsDAR41sCWvJrHFFj+Gbw21qZxTy5KD9tmXZMNJ9FOwlz+ghSScC35EOxqYMzm
	9HfEeiYtcW5gR/1WDnFsjf/mhTdvIHbqYHp99sOinp/T3t3tQG4IMVeq0lvDPdcGZgLZASo5VRO5h
	MvtSY9vrUd8KKwuYhqAfwxy/bjIj/TZi2/DTyuJPvrps+fBcxykXFyWSf1OaucCWRfZHE9RfhuAJb
	IabTOXz0EQ1DK63nK+u7t8LDDYtk6Ny+QJ1n9Www/X3lFsovr6rIJjkZO+eoSi/n0OUU3CuG5Uwb8
	lojR9NEb8d3aWFoIeOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGO-00000002YCG-3Vrv;
	Fri, 15 Aug 2025 13:14:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFX-000000028hq-20x7
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2445818eb6eso14718015ad.2
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252086; x=1755856886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPZEtZGJho1KPh/zd+yjGz8b8DS6hy8A4jKdD/mvtYA=;
        b=A9I8MNUf4nRBBe5NBlC8+ShMFQG+5I3WlnakGkEN3H6MtCl2YYJEevSz5g7e6Tls/D
         pzDJyqhHXWyqzX4Rc5Vf3P6fVQlFrl/rSyxnaYIUXOWbE0pyp00lvNE4q9cO+dE3PQhE
         V/iDxiyppr+hOzjlX2jyRTYGs9G6bdGg7R53z2uh97tMP5ajgQo+5mABRGPP2FVCrZ1U
         edJk9TwPb4nUDbormnnF0xmbD8BQa0Sd2RkNzRWdgYmgsgX/ROaS4ZxVB7m169SIVkba
         +89fmkwNwB6hcmrZN9eGnZvsoWT1a6TJYI2EzhXB896uJT7U50TxpZ/vVOvCjcq39gye
         NVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252086; x=1755856886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPZEtZGJho1KPh/zd+yjGz8b8DS6hy8A4jKdD/mvtYA=;
        b=jf7cEduX+PyWdMoZJu5Iy9kzjAy7zo7E4VEkFFnuuPzQsUkgq8Rtjb+9wMxgSM0cM5
         g8YHctgZnygsiBNOyGVlIaQXjeArtkxU0mX6KaOIZcGhFYJRT1C4kFwa/xd32dtqHDnx
         gbOJn2n9vdzDCE/CxfpPxq8bjipf9nsUx44qvPiiMJNBfl+y5p9r+oekycds3liAbxP7
         uPO3YKd6G/yQzyJsCnyegwIkto6rruvMNNtoS/zuUraunRZ5fS36r3XjuG0nm8W0zNXJ
         aFee4SJGVuK8WOO09Qm0eOrdxzISOxUAjXMn/E6s+IPhFyhrneUIoNZcJTfdyHNfAZG9
         WbIQ==
X-Gm-Message-State: AOJu0YxIUBmqfHYh4oKJsti30i80S6AshIKKQRAy3fDZa+VmIV3cy68K
	IyRTAq31dZi6i4d6Tq5CSmm3+7zTTU22JW19ScTunHdgIvKNNYjFEOJNGkwmXOYmrptGt05hOJq
	kra4rv1sqAaywEGVuH5GhN2vMGfaKCtwcauHa12Nwn82TiFGuLDB54k7kg+otECqzrsdICYWp49
	Fe0IcBqpgLaw5Oa8M+QadWA6P2Ihm0iXG1tWlihHOy3cXrZwGl+EcilQ==
X-Gm-Gg: ASbGncucZGSgRTe0irOtUwgr6Ka9xczwho1sQ0nslOYBhr03A4W2Z048I/5rDF0kXLc
	de1RHSgJtc7AVCsgHfZritv2hWjGoTFQiy5PBHrZptRrmN7gzeANMMFEBFxtX/Ek5aao7GMYkKf
	EvckKW0i4cGxRmO9grShIviusWEAtn94EvD6HjIGfPKszjoSgWg3P1at5sdDoWn0AHayjnxgN29
	s4iFE2CLWUjs5O0XyPUrBy4yNBEarke9/mfDLu3y5YKR8N/a1njS6sag5tDOvKBS36bCqBaLXvi
	J5LvQcxqnNqokt1wLNyxmdJ9ad/vFVjXyED0GgsR8XspwHZ5eKILqPGr/VJJyPW7iVn4JEhjh8L
	pGn1LS4yqSZN+QZ8RC5XHt987zA2kiB2oh9pv8WaLChYUWNo=
X-Google-Smtp-Source: AGHT+IGUrA/8Id+RNeeG/1HpdsPrlQbPRrjgBAFV5H/goGsz3mbe6Uk1YQ5nKDx1peSCYhwTCy/HfQ==
X-Received: by 2002:a17:903:b07:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-2446d745130mr24792225ad.22.1755252086321;
        Fri, 15 Aug 2025 03:01:26 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:25 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 0/7] Extend the reserved PMP entries
Date: Fri, 15 Aug 2025 18:01:08 +0800
Message-ID: <20250815100116.27776-1-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030127_526289_BB7FFF78 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
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

A potential use case for reserved PMP entries is parsing gaps in
memory ports marked as PMA_UNSAFE [1] in device-tree. These gaps
may not be able to exactly covered by 1 or 2 NAPOT entries, so TOR
mode PMP can be allocated to save PMP usage. Besides, they don't
need reconfiguration across domains.

This series depends on:
1) https://lore.kernel.org/all/20250815024434.14303-1-peter.lin@sifive.com/
2) https://lore.kernel.org/all/20250814110522.18809-1-peter.lin@sifive.com/

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20241102000843.1301099-2-samuel.holland@sifive.com/

Yu-Chien Peter Lin (7):
  lib: utils: fdt_helper: add fdt_has_isa_extension() helper
  include: sbi: sbi_platform: add reserved_pmp_count field
  platform: generic: platform: introduce
    fw_platform_get_reserved_pmp_count()
  lib: sbi_init: print total and reserved PMP counts
  lib: sbi: riscv_asm: add reserved_pmp_alloc() to allocate a reserved
    PMP
  lib: sbi: sbi_hart: extend PMP handling to support multiple reserved
    entries
  docs: opensbi_config: add description for reserved-pmp-count

 docs/opensbi_config.md             |  4 +++
 include/sbi/riscv_asm.h            |  2 ++
 include/sbi/sbi_hart.h             | 15 --------
 include/sbi/sbi_platform.h         | 15 +++++---
 include/sbi_utils/fdt/fdt_helper.h |  2 ++
 lib/sbi/riscv_asm.c                | 25 +++++++++++++
 lib/sbi/sbi_domain_context.c       |  6 +++-
 lib/sbi/sbi_hart.c                 | 56 ++++++++++++++++++++++--------
 lib/sbi/sbi_init.c                 |  6 ++--
 lib/utils/fdt/fdt_helper.c         | 35 +++++++++++++++++++
 platform/generic/platform.c        | 34 ++++++++++++++++++
 11 files changed, 163 insertions(+), 37 deletions(-)

-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
