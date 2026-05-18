Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA7ACD343F
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=72ES+0xdOiAWHzd/0zRdtnNk1cVRhevHyxCfufgiQNk=; b=kSWtk4m6o4GzJt
	p3A4+RaHkJ8M8wiFJcft2+pRs4Q+dQEryaWZ2OsGHY9GWKA8Sr77bHRYs/DnGHYENGOZCErArjTEe
	quRVQbL/beWGFBQkggrLTvNrRqq3bg8gEPUIbO5U35jnbhM/sX4UtIk5LL02f/kZ84wj4ciKWWr4q
	ngOSLbZXzrmWhHaqESKBYvgE3nX2f0ap9iCUontEP4Q3jTR5XHTKffvAi/Gq9giCi44ZpL1ZOyFGa
	KG5O7xtpqChPHWkpIuKTjQ0CgJx87KwmjFmN8chxz0WZi8EoLuzTxkiKJKIuzgEIQE53ddWKC4Rkg
	ozKtiAI/e/vM4dJ5a6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkO-0000000ELG2-2Y4Y;
	Mon, 18 May 2026 05:42:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkN-0000000ELFd-0mtx
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 05:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=y+40BYW8k6LtPJ9qpd3//d913Umga9xBdNbDzd0/Y4s=; b=esSRiXbP0rrykLLiJuBimF5li0
	pVpXRF46D9fRiNQGGIg5X4UfYOUDnqduRPtRctVA1t1RUnFLlWgG5gZXGhdchgV2S+qFSFThaPguU
	7eaP+plbnhvd8onNhvl1Q22iWuyxk2tr7Ng085HlYKXgs/h9T56dn7SaL+vyoEkoEoQblqogKURtE
	am0cpjAASuI2hX7pCYL0tDcx44iDOeKhrRJXDwtsLVPaLK9sZ9M1kJwDCtnjrjQexGy0YOCdZx7EQ
	obU4lWrhrZ45JE/+QR+VoY9lBGQHrg+jDaYIZltW2M7SdP/XL4KpFMFtlav7P9VG6ZdWmKQIbjrEb
	6BeIbV5A==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqkJ-00000009wlZ-1v6C
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 05:42:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48d146705b4so19183775e9.3
        for <opensbi@lists.infradead.org>; Sun, 17 May 2026 22:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779082949; x=1779687749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+40BYW8k6LtPJ9qpd3//d913Umga9xBdNbDzd0/Y4s=;
        b=jr/hwagGi97zhSxsKoCuRC9Pt9KsOBvpPcuhE60+KvSVI0x2EOhBSb3NIYMKftQrug
         v4mANk/ySDMrPlgQMJxBW5fSIFrvsyVCq6ixFlo19SqpXCNFsqRPEVOU+AyNPuV0VeHi
         7e79Ir8vbBNafN+lICr9LBS/2TBMqM6aQVCsMXfnHmKBEFJzeOMMvuxxFknF4M2HgxM6
         r0tH1yHY+LQau8LRJ9DgNL27Y7uxoXoFLIishG+iHCyuPKUKCAYvqbbdaQJOKFu3rFwE
         SYI1Le3zQCcG5lE2cFbJfDr3sRtocO8r32ajJneJoa36pTrLPxJD/DHhnKxtr1bxm1fU
         jjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082949; x=1779687749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+40BYW8k6LtPJ9qpd3//d913Umga9xBdNbDzd0/Y4s=;
        b=THESK6NMT+CMy+VZuqG9skfbECzocWryQ/ou3n9xpBgdIoY8ItnXjxAU9YU5veARG4
         3eoN1wbhxKrr4/9jxINk0mQE0iod8QtoEavqxNSsSzm9GtuvniaN8WWEJCoVFG3QkkQl
         2ZPwSEHJyk/uPQBBRHZ9KQgFXuZj4mDkXkc7RYpOzs567Ak5XXA//UY+MfKU1hBlGqL1
         i7+CcHVKbPrdDG6Xl6ZYXGfst57W+IM7Pnb2Pyj03K7Zjvn5jNlvwuoQ29CumBj9Jk6Z
         EFLh5n2Ko5pVsWWfcS0sWcc7WWKzzHFDKD8GvE7s3qYau7Nqa1TUVF6sLEitSfK3/lvS
         OK3A==
X-Forwarded-Encrypted: i=1; AFNElJ9NaGdF+GmuIygDv9boFzW1izn+rChPkPp0U+sdSSx+53Ze8tpZv2e4MF6TCNwdM21JJIkf6aBM@lists.infradead.org
X-Gm-Message-State: AOJu0YyDlNCBBz3Q9uQUQcWfiyi8JBCqK/x6Nw81h90VmVTP96qd4a5d
	yL5SL410MXZ0mA5OYTcqCoChkxVkGCMd4TfUPx5RTGuazD/hW684AwF4qzwdGdLIiSE=
X-Gm-Gg: Acq92OEsBS9pzaSheCoIGhkxuDc9FL/uiLKKIHit3jFCUB24OCXCPm/TpGkcUDWrWsz
	RaibAeGxlA2OhczjwFSNWmJxe1PVqXONoSg0M88gl4YlLFgEmS8EwyZDt5kAb1NjmXGEnB4LYoy
	fIM30FI6MjHVCoPCRf327PQOrlSb7D0iQvFQmxzJCqw5l6B+AeDoxfOgf8rAsD7G+kb14vur/8Y
	jOhWQDexWIHoE4aruRz/OETcVEqZaxklew/xgaxux1a67hZsteEVsRrlDvj7dl7d610QO8JnLh2
	P8+JAfeRBNKB9GHBJ4VTaeIKqZICuEew/l9XBx3cEL16yV97f12OBbkmJs/ov05WY/JiPr7QoqT
	3Bt7SJmrS23xCNAyfopK6H1lao1FpCIMxTfB148Rs72YvbbdOaUIdcIpzcoLG5daEsX4eIoPx3q
	+Emten0Xs9z7/SUpb/ohLEJKokRgXlYOR+H+PZ4vttBpD3krY31LvjmJwYE8wkvk+v9Lldc+vEn
	Ya3
X-Received: by 2002:a05:600c:4e47:b0:48e:707f:cdfd with SMTP id 5b1f17b1804b1-48fe60e54f4mr222398665e9.2.1779082948771;
        Sun, 17 May 2026 22:42:28 -0700 (PDT)
Received: from Dev-EliteBook.lan (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6faeasm73948715e9.26.2026.05.17.22.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:42:27 -0700 (PDT)
From: dave.patel@riscstar.com
To: Anup Patel <anup.patel@oss.qualcomm.com>,
	Anup Patel <anuppate@qti.qualcomm.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v7 0/3] Add eager FP and RISC-V vector context switching support
Date: Mon, 18 May 2026 06:42:16 +0100
Message-ID: <20260518054219.58708-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_064232_007564_260C8C8A 
X-CRM114-Status: GOOD (  11.08  )
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

From: Dave Patel <dave.patel@riscstar.com>

This patch series adds proper support for per-domain floating-point (FP) and
vector (V) contexts in the domain context switch logic. Each domain
now maintains its own FP and vector state, which is saved and restored
during domain switches.

Conditionalize FP and Vector save/restore based on extensions, unconditional
save and restore of floating-point (FP) and Vector registers fails on
generic platform firmware. This firmware must run on multiple platforms
that may lack these extensions.

Address this by conditionally executing FP save/restore only if the underlying
hart supports the F or D extensions. Similarly, perform Vector save/restore
only if the hart supports the Vector extension.

Changes include:

- Add Vector save and restore functionality
- Add Floating Point save and restore functioanlity
- Added `fp_ctx` and `vec_ctx` members to `struct hart_context`.
- Introduced dynamic vector struct allocation for vlenb in 'struct hart_context'
  to allocate and free per-domain FP and vector context.
- Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
- Updated `switch_to_next_domain_context()` to save/restore FP and vector
  contexts safely:
    - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
- Added runtime checks for FP and vector extensions where needed.
- Added SBI_HART_EXT_F, SBI_HART_EXT_D, SBI_HART_EXT_V to enum
  sbi_hart_extensions and the sbi_hart_ext[] array. Use sbi_hart_has_extension()
  to check for these capabilities before performing the context switches

This improves support for multi-domain systems with FP and Vector
extensions, and prevents corruption of FP/Vector state during domain
switches.

Dave Patel (3):
  lib: sbi: Add RISC-V vector context save/restore support
  lib: sbi: Add floating-point context save/restore support.
  lib: sbi: domain FP/Vector context support for context switch

 include/sbi/sbi_fp.h         |  26 +++++
 include/sbi/sbi_hart.h       |   6 +
 include/sbi/sbi_vector.h     |  28 +++++
 lib/sbi/objects.mk           |   2 +
 lib/sbi/sbi_domain_context.c |  36 ++++++
 lib/sbi/sbi_fp.c             | 207 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |   3 +
 lib/sbi/sbi_vector.c         | 118 ++++++++++++++++++++
 8 files changed, 426 insertions(+)
 create mode 100644 include/sbi/sbi_fp.h
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_fp.c
 create mode 100644 lib/sbi/sbi_vector.c

--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
