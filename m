Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D97D606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 03:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KThgBkG7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ExYalUtp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LqM5jOJBBKy2i6DvALc8+ocX4ICxZIM/LwlwLjrDsSE=; b=KThgBkG7Fz/p4LmqSZI2Pzw3ra
	Ej95ubjAOMWWrs5x8f7mJ7Jzau5ORXRApq0MyQbwOqxYAkgN5oFh6WXBF8SwmuI+u4SXb6KTvA9dE
	a+zpZ+olhnaWXOP7xgCn/+U96LpSCE3Xp8oBBgStsLkg/yP919n9dE143HxYPQNJbMad/mmJ9BQ2E
	YE0NO/soM1DEdWtp+m+5BfQCSctaCXc1ObcK6tiShDJC1M+kb0BXYn2mlTp7pfHsyc4cMu2qK3adf
	ggYBpvvFdRKCqVmaA6Lz97aDKYGISEKgSgEPLq30DS4FG/I0UFyCXH74ozj6aJD6KNV4oy10qUVtK
	tbd8HoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK67H-0000000FQrd-3YZX;
	Fri, 23 Oct 2026 03:38:51 +0000
Received: from mail-dy1-f170.google.com ([74.125.82.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK67F-0000000FQrG-2ysN
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 03:38:51 +0000
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso779556eec.0
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792726728; x=1793331528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dt1LHz/GtHp964w6J1Etl75b9aUx3Dx04BD3yuwAgVQ=;
        b=ExYalUtpG+H3Xk47o2annjZPJPwkWrpttWeTBJWn4chzCzUfv8r1+GTHv0jOHeIWHC
         AxDpef0juHRS0t/Cz5ZTYQdXJ0jvFtol4sM75gPULqJ8QRZ9EaKcDS44E+tYJp0rCl0Y
         S66Z99ItuqNGfQudMI2c5icOpHZmX4dj2ZsyCKkTa0+ariGXQRvTh/j4S65PrrQaTRSG
         fRRZba2lr5PDjMSQob3xtwiAsdURmwXS8sMx0umc/CHdFVYLyl7J8JeOFT0Zb0bDuy7q
         /KrMHF2JT5pJkHi5R391w0NKkCk+gHpMEdKHwo7Me/GYvIdX2jVXc3LWD1s4BxMvJVb4
         6N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792726728; x=1793331528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dt1LHz/GtHp964w6J1Etl75b9aUx3Dx04BD3yuwAgVQ=;
        b=gmQB/UkCWyMtwkRYq94Geyq44Ngw9y+SB9fAXO7HaZ2Nai3IZaIDMxpTA/GCdR/n37
         Nin5NtdyJ8OKPAYCuXGS1QeOTNYpKZpeJMgkMGyILXQiZrI99IWoA339IQ8blrx8patm
         +epLQhmlm2oKeyXxfSv4wWeKfYOGNgISyERpF5iT/epxs+9tkwcNJdXV70DAKFH4RI80
         cB0IWDfnvVoCwKERaZPztj20Tuhl/rcD3W0XUT5kDO6kuJqSk5yCKo4+4Utqouy7wwqI
         bBpYKNgCDAyvKi46cXnjUFpnX4dp6tLX2RUYUdv64cWJvVXu49EFZ8nc8qS82ul1c1WB
         NClA==
X-Gm-Message-State: AFq9FYIlgCb6gl9zeIebyKBh0ntzDWRumio1pgtZj7l6FCmY+REOi9w0
	IscF9lplH418Ga/nIW/YHlqRvYmdI7n7vxBJuulEWmQGkYq41zxf1uz3bLpql89r
X-Gm-Gg: AYBFou3j5xN68dXwLIApu/6uy8TnUgdfJbvgTO4KiFd89b7AiFwcvPoIdEDucFMEwU7
	aa/brr2HWcsi+SrCm/dWwfHstzUAJpxrFftabCVrzbFLjn8/OULf/cqOIO8zQDjQgYGlYybHtuN
	xzTb7jQDqrAuCHoDIh82nsT+2oshcJLQuIvyaSPPVEoaNJwnmSOaxjdmLNLzHbUbfNNsCq6+lOd
	YVIGZuZBHra+dGgC7SQnSG52Z/tgAVs7V2hlWNvc86gcwHmqfS862szeKeW8N9f4JTVbw5eV98v
	QXvVjuezbP7/8ZjPyl8q11WI5Na4Lkc6V8OH/ZXQfAeQV/IkHxcQCP/nL9pXthnYlpnAUoQuMKj
	w/msmOS5aEl/tQHaME/UUDPYFYocKqQJKu3hPxEFu6LoNA2kQ3Za1sv5jizeg4sZxnddBaEfVnQ
	nEO2Sl6V9TyeRECYohnURlqAPthklyT440p3fHeLVRjSuG4F2Xuwhk7+Ed7tQzD0C2rq3cSJwE0
	fHjbqFumdvtgMs1r6c4RxJ/J6t/5iJ3dyCEqO1Qco9eik/FYYpNjVH4IJlyC/al2669v1PnB5Kh
	Y+qEOM/1OstkSVX++tAFZ1s4W2xz24BYtCnrA6m7stZsJvPQkPuTc7KxPcg=
X-Received: by 2002:a05:7300:f784:b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-369d98f2844mr1383756eec.39.1792726728212;
        Thu, 22 Oct 2026 20:38:48 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm2746414eec.3.2026.10.22.20.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:38:47 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 0/2] Preserve supervisor AIA priorities and CTR records on domain switches
Date: Thu, 22 Oct 2026 20:38:43 -0700
Message-ID: <20261023033845.89152-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_203849_787066_E94EDA10 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>

This RFC series extends the earlier 5-patch S/HS CSR context series
for https://github.com/riscv-software-src/opensbi/issues/433.
The patches should be applied on top of that earlier series:
https://lists.infradead.org/pipermail/opensbi/2026-October/010804.html

Patch 1 saves and restores supervisor AIA priority registers via the
siselect/sireg indirect CSR window (selectors 0x30..0x3f).
Patch 2 saves and restores Ssctr control, depth, status, and records
through selectors 0x200..0x2ff when Ssctr and Sscsrind are available.

Validation:
  - Generic OpenSBI build passed using riscv64-linux-gnu-gcc.
  - On QEMU 11.0.50, one A->B->A domain transition test passed for
    supervisor priority state at selector 0x30.
  - One A->B->A domain transition test passed for the CTR source entry
    at selector 0x200 (expected/observed 0x80200001).

Both tests used an OpenSBI backend with a test-only SBI domain-switch
extension and CPU extension flags for AIA and CTR. A separate local
fix for an existing floating-point save issue was used to let the
tests execute; it is not part of this series and has already been
reported independently.

These tests cover only selected entries and do not establish correct
behavior for every extension combination or CSR side effect.

This series does not implement IMSIC indirect backing-state
virtualization (selectors 0x70..0xff). It also does not independently
save hip: some bits alias hvip and some depend on hardware interrupt
sources. Maintainer feedback on the appropriate isolation boundaries
for those states would be welcome.

Please review as an RFC rather than a complete fix for Issue #433.

Theodorus Wensan Februanto (2):
  lib: sbi: Preserve supervisor AIA interrupt priorities
  lib: sbi: Preserve supervisor CTR records across domain switches

 lib/sbi/sbi_domain_context.c | 125 ++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
