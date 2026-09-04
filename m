Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E90C79F80
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 04:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h61AdCWw3JeUOIt7i0v9j6WZNraV8maLgQlYHCbtFGE=; b=CYJ77eZ+NUiCvz
	IbMhphUQ6FkkbwqCia8qRzNGyTFJt5nR1nBle2LlVr8tl3j7gL3g0CIhnBKEcu4SyhU1L/j2hWKl7
	yfBZ+dabi5WgwfNHT8q2pyJaE17sV9aX626lQoFScyMV1rPKGZATKuX1/V4PLdvpbUqpIR/uGVkHo
	cdryytwGJ4rZdwlhlXb0IjbUX3E9q6kP1t+BvgEc6IQ7hzJ+mwy2YQT7pKUI2wYRZu3A13FaOgFYY
	7Lh04TzL4cNZ752JLEYfsOnOSSKj6kVwqO+U9jzEnR5Bj9qNvttIBZ5VT6Q9ID5/Xq26WOE35AAZ2
	8kmEy3VIOGQ7aR+eVeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmQ-000000012F4-231s;
	Fri, 04 Sep 2026 04:43:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LmN-000000012DA-2HWN
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 04:43:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8534d507f59so704418b3a.0
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788497034; x=1789101834; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GPZ/rqk6e3dTvSixL9fgE1rE2AaQqu95HWR024BEtNc=;
        b=EinRKakbGCiOaf+h0GF2KlMlakr70TtNnC0Mb/FlwJG5cyMEjDXMeuN+gtGGI0rwpY
         mSK8GJuQchwdUKf4R5cTNT11OyORkVk7BaIeQ0CfRN9ueus4czVhMudG8klaiTtlhbyN
         C1m77HO6WlhCq64dKSNNVi7ZJlAmV60jUnY/ONfSrS6sc4pB0mdb91qr6sQfYYYDEK95
         RE09fKYUBqcJ2G4j5Ha3t3lMyApCCMHfyi00VYW6x8pifExN+cFhznrNkUMbRYs8iO2r
         CKywbe5miNuaOsX0ZiPGaYYgQzZexggvA5WFfWZlQMFPl61xyIc6CGm8gv1h7odWKHu7
         1cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788497034; x=1789101834;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GPZ/rqk6e3dTvSixL9fgE1rE2AaQqu95HWR024BEtNc=;
        b=NOMaGBB6Trh62l4/ZqSzyOvw+wtSiNNjpOr/k0L+RfZ4NZF69dP+esfs5rKaZ4Dt8V
         YSDScS9A2y4lMUvFPCEdRXmmIBDByrlkgZVVKjRQ072tG3ujQJdEnfMwMQOfZSYoOFpI
         eKXZ9MAusSz1Tp0oFJ0iVNIko4KLfn2azJapBslP8WpfT3YvY3dQszxaHQTe9ejWBu5j
         6d4t6pJAPJ4PG3Je3ZHc6/PrBHR69B0xc8urMgfzbkL15HFBHkDq9WQTj5/8HurMhH55
         Chd9xYmQ9RPB2+wc0/BV9BmKsIjbjH68syFBpbd/3rZfxFriobiuPeJkZuM1wBgYBUT7
         m4Fw==
X-Gm-Message-State: AFuF++lebarZPFo+3OErWD9msNVtlEDILfKKtUI8SR7CIJVqaZbZR/ca
	v4vmVNxim5I8+Wg+N1juyvnnmixeFkk0y1sBIY9R6TI+DY8hgUaPmsSNTMVaKAwKHGk=
X-Gm-Gg: AYBFou0IVoW/Q/gKRTJzWhPWXI2/uwaXXwkSiKuHK/BJUxd0zPDqLpI0JOJw3m4YVYy
	BecqrO4hXlfnB55LchogH5srhlBdRhR7GbezwxeHhXTCkFn5k5tzuiu+kKQ9h9PwWifglCm6ruG
	hZIQQ6j82B6wcamFj929SKLbGyYRfxHg5sbqITdV6WKurhEU8Q3/tzxgb4j4+2Nq9q3FUV8QtyA
	xRxnrVClGWoRDntDhCZffdneONJ5AX7+j2d3PjKRDGlZGl9i+7ag0jALdyg0sx3q2k/+ouaiSvE
	zrBTXe0xwy60wMDvOvZb2uY7xR/xKu2d3s1/Lz30hFacGFmUIUDB28bdm7YbAt4fyNjJywYRkiq
	gCoENhWtjqe0atANUT3fHGQwKwFTeWPLOTW9mjt7xse8Vq8BluNPfn5/vk/9ZPxVeCw1F4DGppy
	mePAyOqAeRTLTT2wuvjeFrNNu/ll+dCoAln/dHlX/XEBnX8j1/9t/YAcq1iYfG8JZ7AInrW8g=
X-Received: by 2002:a05:6a21:7117:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3da39eb8acbmr5873796637.7.1788497034397;
        Thu, 03 Sep 2026 21:43:54 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm3574463eec.30.2026.09.03.21.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:43:53 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Subject: [PATCH v2 0/3] lib: sbi: Fix Smrnmi resume init and optional
 platform callback
Date: Thu, 03 Sep 2026 21:43:49 -0700
Message-Id: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIVMmmoC/x3MQQqDMBBG4avIrDsQRyjVq5QumvjbzsKkzIQii
 Hc3uPwW7+3kMIXT1O1k+KtryQ1y6yh93/kD1rmZJMg9jKFnXy2vyqnkiq2ywWsxcBxiv8gQkeR
 BLf4ZFt2u8fN1HCegbcUTaAAAAA==
X-Change-ID: 20260901-smrnmi-context-restore-b3b1f23bec28
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=9ihuZu6eNzy0iANItcgTu6VGq2jPvEVeZ35FikM3kZk=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqmkyJJRHQuRXxVB0TPFKVTrIf5OkOjN+PRrJ+w
 otDm2lc7HaJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCappMiQAKCRCIoTSWt/mH
 4IThD/9nfb34oDCSf6E9etT6+WaZnFIt78A2U0c8s0WH94gUhy+QyR8AJnHhshYLhenjUe/XV3z
 gFFtp3RxYB9PSf1YJFnvfBnfjoa0CSFfu1dBFlXzqVSxcsrFLTcD0FOreIpL3dyJYbDX6Juwhdr
 Jfv7k/9pwcSvCQvyRP+VQhXCv2fembT4BisyAt3Q02tlw+nq7UeeAfXAF2B9X2cSyrtjglA2V0c
 Hv5LhOUwtIrKxc2TiZ+AQfeSLnDE5YDcbFi2SwMGY+Al8DHY5UqGAxSAft1dvyxYno8HzoXuuOt
 bdeoRKh9Q9uiQsMR632ChT+2O509q7F2jgxEvIjkNRcCpZbJ4GwiC59aWXec8Ffy8IZzfkgIW7W
 lGm5bpukXXDG6nb7UqMDyBZtHNcyG3WAp21LoSGZm0KY9KscPAnG2eeqfapWII7sWgLHCkGQTY8
 2c+UKgIREzV8AndgE9WEO8uPKlh6DKnCcMiSleZsuXLuvUiTzpQAdisebV00FNi4Bpbb/FpmIYO
 IeHD1bq7ygvxOJovN4UZ44Yd+1tHdm9FYAJy5785qgptBjuTSRIfQj1zMVmFXWcZ9MuZVBUzV30
 iHGlk7Z5A8gL24TsiUZdTdIfgk2gi+3UxgOAIaLvN9WonB29XTy+bc8kTbg3XuF3xR8VcUqXFEi
 MdUFlBxjUqWTc8Q==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_214355_605899_DD835396 
X-CRM114-Status: UNSURE (   9.99  )
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

On non-retentive suspend resume, the hart never initializes the
Smrnmi CSRs the way hart_detect_features() does at boot, so a hart
waking from non-retentive suspend resumes with NMIs disabled and no
RNMI handler installed.

Patch 1 extracts the setup into sbi_smrnmi_hart_init() and calls it
from both hart_detect_features() and sbi_hart_reinit().

Patch 2 changes smrnmi_handlers_init to return int, so a platform
callback that fails to program its NMI vector register is no longer
silently ignored before NMIE gets enabled anyway.

Patch 3 allows a NULL smrnmi_handlers_init instead of calling
sbi_panic(), since platforms with fixed or mtvec-based NMI vectors
need no vendor register programming and an unhandled RNMI already
falls back safely to sbi_trap_error(). It also reports the init mode
("Platform" or "Default") in the boot HART banner for visibility.

Signed-off-by: Nia Su <nia.su@sifive.com>
---
Changes in v2:
- Break v1's patch 1 into three smaller, self-contained patches for
  a clearer structure.
- Dropped v1's patch 2, which is unrelated to this fix and will be
  sent separately.
- Link to v1: https://lore.kernel.org/opensbi/20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com/

---
Nia Su (3):
      lib: sbi: extract sbi_smrnmi_hart_init() and call on non-retentive resume
      lib: sbi: report smrnmi_handlers_init failures instead of ignoring them
      lib: sbi: allow NULL smrnmi_handlers_init and report init mode at boot

 include/sbi/sbi_hart.h     |  8 +++++
 include/sbi/sbi_platform.h |  2 +-
 lib/sbi/sbi_hart.c         | 75 +++++++++++++++++++++++++++++++++-------------
 lib/sbi/sbi_init.c         |  4 +++
 4 files changed, 68 insertions(+), 21 deletions(-)
---
base-commit: 35511bc6ee1c9c17b6a89b44c52e2044bb51b979
change-id: 20260901-smrnmi-context-restore-b3b1f23bec28

--


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
