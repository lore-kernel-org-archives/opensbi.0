Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714B606A31B
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=chtgQwYD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NB4XxtIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DTzsPjrJ5TCkvvyTPuTQScz4oa/LBQk70tCePvCfou4=; b=chtgQwYDXGpJ2Cbj/PQIzxp6Va
	1P3tTvqddVjVxZmxYLKLLk4nrsLwoQu3yQUoYWP9a+YzHvUGK+5qSgam2DDHdu6eQ4mNX41IJHnSr
	2snv9bbxq5C5YI+aCwoD6zzjH0m5UGZFvS/ZB0aJutulAblADgS2ciPc81wxwzjrsvXqWH5OpBE9q
	6tICglbc7a3/5GFaq2gWp3zmkQFs0zJ+iSGFHYBX8gF4zJMiOdkcay4Iw4b9A5GH6EppjV3gF2Rr1
	JGBqfMmcHLjrnqyk6hgpJs7mTABOJON6mrCZ1CM2Ha8A+7ZqBDJHuAB9vWEw3IVAbPz6qx6npxQr+
	4oVj0EIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrj3-00000000nJ1-0pa7;
	Sun, 25 Oct 2026 06:29:01 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKriz-00000000nIL-3eFL
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 06:28:59 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so2403426241.0
        for <opensbi@lists.infradead.org>; Sat, 24 Oct 2026 23:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792909735; x=1793514535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+e697HlZFOKutWlzpSQ3vndbmvBqApFmHNHgobWJAA=;
        b=NB4XxtILNOGgbZA6N4yLhPR6xX1DOeZTUzqPoekMAA0V9R9Y/aPm6pHhqaPs1LVsDK
         eJs3DEQQ8ULxy6UoAUvgukGXa0KQbpo+1XBMPncMxI7Ux92wBj+VkNLbaZLzoYIzZN9p
         nfhCV456R+sSVsngjl1zGeTTAlyfQ0NmBIwkTiCC0hYmIUTppospj+DW3PZE79I4ZvJ9
         DyH2bblU6XQja47qlEu3bgw0QX+kaA3dR0CYCDlPb6BHkUrnN3kd9zA8LJUiwOPFGyOP
         jUxOoIkaZxSNIc01wUxTG6ccqZLZX+W1F2kBCYubdIW5EJoJyMXijAkj09SFuLdZObYx
         NF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792909735; x=1793514535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+e697HlZFOKutWlzpSQ3vndbmvBqApFmHNHgobWJAA=;
        b=gBLGpsjchJzLThDEOChrlzr/NbgtxCvZOkxH1qCYoqA6+/kV48A6lFpPubJFnPhNlK
         d8oV34NAwtNO/dsJM3770dQ55BuQ7DrfNTvJAiYgZU++rJ9xU23XqAOkU6UJPjYsKiXo
         MSHKDZGCCE5Ht01ajp2YLS76vmHzYjF+qxpb9jMmXc+c5/9UerBvELike75xTphTkCXc
         muUTgObKkSUJM1EkqRBO28+1dlS9rQRsaKXKdbJKND5kKIrNGh00YNUI7EiKJzXAWUHF
         0dNL98jc2a5bDtmczFnWwmVJzwxbVumIQsKogfjzr07aUW8Dxm1Dx/CLezSjxkms7lw7
         iMhQ==
X-Gm-Message-State: AFq9FYJlvwit13+FscIWQxf5ilnjSk6oQbde1Ye/RCYSivX/iF5Y9uBt
	DgBBdREbmyULVeCgt3kIFvRHvRfUhVQu3tPXLzHlmQ1ADRUrk+bBd4HVLL+IRw==
X-Gm-Gg: AYBFou0IJ4Ydrm44h2hENxbcQkUAdW7/dyQw4oUP3jyOhyAw6inG8CRGsUE7zGlrOKu
	ynwCm+toL/1fFNciRMBBVVYEh8SDEhSK1HxFEk5Eky/pQH8UZdxdl5K+VOTBYFRMfj5Z+2towub
	3r/nDwwR7B1X2yIvVc0mw0fUCkrPDcWNAP3N36tENYEMuiobbD0QPFJarsnd51M5WtqJ9mfRMaj
	G9DXTBnag+GZk4zjc+ubECXE5EQDxhulTzqupVMoDQLal9yZldeA5YIKDYey4ag/08Ca8UXei3k
	2efKDWnosqLRXtAv3j45FuTyR2IbR2rTh848RwUW0BOWw0nYmE2in4zzDb27gPkCuh2Pc9gkwNA
	myrNv6e35MxZ+WSA9Ccs4SWTsfbj2mao6QOgVtjHeAYAijDSXDE/TTTezGcGme13WEGwrJUEHot
	H7mgxWvzodbADqAkttrhxa844i9Rm1pFVrPfN7eI/P0xOpBy/tzrmpL57Zv2BgAjSLA1yNtRNKA
	xMNoEHxsm49N9AjkuPUHWvGU0F7CGGCT+aBPGF+Jo1cBR2v6kXZhxU16vvRucZ33rOT4QMhTQ4/
	zTv3d5NlEtMalwbJz9WBsnfUCo7+ueuAUBjJIJIW7r+s+Ah+1Yw8Xdq37S7NjSuyhg==
X-Received: by 2002:a05:6102:6054:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7ce5cdfc85bmr806677137.33.1792909735513;
        Sat, 24 Oct 2026 23:28:55 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec233f5148sm4552395e0c.6.2026.10.24.23.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 23:28:54 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	pengpeng@iscas.ac.cn,
	hppiscas@163.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH 0/2] lib: sbi_pmu: propagate hardware counter errors
Date: Sun, 25 Oct 2026 00:28:33 -0600
Message-ID: <20261025062836.2445655-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_232857_937345_C1652D91 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Anup asked for these two as separate patches in the thread for
Pengpeng Hou's SKIP_MATCH class check:

  https://lore.kernel.org/r/20260827115718.50124-1-pengpeng@iscas.ac.cn

They go as a series rather than two independent patches because both
touch the same if block in sbi_pmu_ctr_cfg_match(), and the second
does not apply without the first.

Both are hardening of a latent defect rather than a fix for a
reachable one. Since 9f37e25f landed I could not find a route that
gets a bad counter index into either call site on current master;
details are in the note under patch 2. The Fixes tag points at the
commit that introduced the missing checks.

Built clean for rv64 and rv32, PLATFORM=generic, no new warnings.

Sebastian Alba Vives (2):
  lib: sbi_pmu: do not ignore pmu_ctr_start_hw() error in cfg_match
  lib: sbi_pmu: reject out-of-bounds counter index in pmu_ctr_write_hw()

 lib/sbi/sbi_pmu.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
