Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE861606A330
	for <opensbi@archiver.kernel.org>; Sat,  7 Nov 2026 23:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uU3rgvgT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+Tlsa4x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1ieTFQz7ZhcqoUHqFcdLgVN7pfGYECKBLAhK6kTZGZA=; b=uU3rgvgT8M+lFSby3QPjBz2TUH
	k4FhvIg/E+GPuA0o5zmHsANdhwaH9V+v01k+bwtOeaPdIN6ENxCvrf6EZ7HkKdAJuggrXAFnHuV8I
	qFB3+BaW/b+jeeoCOS6X96sjxjAezsvWxSsNx76Hs1R22m71+Q3qcQOKM1DYhXtcH11nCX/9mEvIi
	tnhQoeKivYJIc1McdXg/6ALP9YBoAYRxOYkR6yQRRs0AioRnyulaeLsrfS4AMw/7uFVM78kdzf5rv
	WhmPDP3al4z1S+vHk00YOvqC+UdapiaMWTc6C4Z2G0C4ph+cg4iwgnpN2qCWQjGwJE6nbUgOaH2jb
	fwYOqNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5M-0000000FVvc-09VB;
	Sat, 07 Nov 2026 23:44:36 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPq5J-0000000FVuw-0gr9
	for opensbi@lists.infradead.org;
	Sat, 07 Nov 2026 23:44:34 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36ff9c9da34so169235eec.1
        for <opensbi@lists.infradead.org>; Sat, 07 Nov 2026 15:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794095072; x=1794699872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VezU0k8lts/YzNaSm1oH4hTJiV/gavUewFOO5//pIlk=;
        b=Y+Tlsa4xIXy3IvvlSsIV1x6HH9t8ckGjukuDaGgZ6gwRRHUep/A7HJCUUJdUsT11Tx
         aVJTFd4wDt3FXCoxWi0p8s7Q4kMiblp1CbIP020AS0DZ/hVrs5Tm8A8rYplklAr4WPTY
         9s8ZBt9DW29BiEUAp9uBAdKlnT7/oWhjplJVLgjjwWMjjzHK56l1UsaVrm7F/uVmcZ17
         AcYxK8UCytsijXsvo9szd2TKWO00UfWfcrlIbat06dzzotADdFroM9ScGFMKSmWcXrmv
         wcJ1UVvvbsYBehlEt1XbTAWy5AmAIOiwGq2H1H+ttpJU0Gcp/HNFqvMYRjik7ghTbNRT
         UhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794095072; x=1794699872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VezU0k8lts/YzNaSm1oH4hTJiV/gavUewFOO5//pIlk=;
        b=tgpeKNNDghsvKS9OibuD+N6GaMOla95ljrT8p4rPORzkt3klyNN5Rx6TkhnuGILaVu
         N+L+W1uN2JwTnEESVcfDhs3wXqMEIMGIYQ/yMYcZt3IxCvHlLxqg8E7YvZekElYYwmGw
         cyrwjPqOUJuzGQoYGekV3BAdXw4ewMstQ7lAdEAEL90h1EePLIpYJ6oRtIw1imBgXJSk
         ldrbmuHzJTJnijOtDcdqYm4X1bq6Dx7vORnGSu9cV7OdWBkqXso1cVNLANzyva2SW3BT
         5leltKE3aV1WKK6r7/ZYsS09CVHvjpu3U/dspKhPHa52jNiR5xDDbrPGdIjI0N9Fbqfz
         WiZA==
X-Gm-Message-State: APuU4Z/oygaEHPsYu00qZ67oOpAzgCpPqLosRhOPFFP5vTiAaiH46Ci3
	A2pS/vi4QvG4io58Y7TV/VYvDzb84N7qNCWqd1WE7mIQ7+BqPfeeaW9HlyuaXus6
X-Gm-Gg: AYBFou2UBvG6nbpg0Q1qaiiDNWLCFSlm55xbwmtZy0YbqKiBDA1NN5DHksJYCYzm3Cb
	F1tMU8Vp6ln3l1NCE5PgVJi/mf5vx2iy7fCh4S3cYAPXcEhc+Jb9DxlwGYUjuS8PGYuIaGmI1vx
	gKgAaQJebRsZT23mhJs+n2+NUu16YU1bFcgED0aBfjNOVQ+feSzI0IpR5ELvbltI+zDfrFBzau0
	tCeIl4ui5f8WN9qWkCvjJBXzV2X9PedAIBHLFWKPuu2AG8CwwP3JBH0gjOVdF+91v7FTU+DDhw4
	Dpia/fyDyauSEJn97yBYJufkoEwm9pECMFCjS97p45sdW6mbi4FwrOEqNJ3EEZgooOjGIFdFWka
	AxdmQkRMJiXnZMO7Rua+mgXeNX0tkCBKMKEz4JkY+hDGj9hnIxJmIzpI0rRabfBqsunPrbUOsz6
	OtrM2+/rx2S5o0Kc34yzP4PVyO98pqcWNgV6VJgQ2QQ046c2j6kirozKfcpfST1bDQaPIGbShUW
	Zr4HAt412kbPw7qK6r6YukWeh1DV58SPVDKPB/cMNAfLNnKvLXKe8Etjsk0RNw2JVh71rSqpk9w
	pVBhAGRxOZTkMMneroCy7r84ooMEr4MtdJq0tOkv4++1UQPsLyYfERmdtbL3jxSKR8GEL5/lzWD
	3TnOxEc31X9wk10a5zoMTbBCF9egr8W7/
X-Received: by 2002:a05:701b:2091:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b39feb2b95mr95163c88.28.1794095071661;
        Sat, 07 Nov 2026 15:44:31 -0800 (PST)
Received: from aster-MS-7D31.scai.dhcp.asu.edu (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm1819730c88.6.2026.11.07.15.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:44:31 -0800 (PST)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: samuel.holland@sifive.com
Subject: [RFC PATCH v4 0/5] Preserve more architectural state across domain switches
Date: Sat,  7 Nov 2026 16:44:16 -0700
Message-ID: <20261107234421.137100-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_154433_203584_3DB6D2AA 
X-CRM114-Status: UNSURE (   6.73  )
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

This RFC series extends OpenSBI domain context switching to preserve additional architectural state, including hypervisor and virtual supervisor CSRs, supervisor counter inhibit configuration, indirect CSR selectors, supervisor control transfer records, and vector configuration state.

Changes since v3:

- Check the privileged specification version before accessing HENVCFG.
- Save SENVCFG before switching HENVCFG and restore it afterward.
- Use the software timer delta to preserve HTIMEDELTA when Zicntr is unavailable, including RV32 support.
- Consolidate the Smaia checks.
- Move vsiselect into struct hart_context_hext.
- Remove the Sstc patch from this series. Preserving timer compare registers alone is insufficient to handle timer expiration for inactive domains. This requires additional work on timer scheduling.

Validation:

- All five commits build successfully for both RV32 and RV64 using the OpenSBI generic platform.
- The complete series also builds successfully for both architectures.
- Runtime regression testing has not been repeated for v4.

Feedback is welcome.

Theodorus Wensan Februanto (5):
  lib: sbi: Preserve hypervisor and VS state across domain switches
  lib: sbi: Preserve supervisor count inhibit configuration
  lib: sbi: Preserve S/VS indirect CSR selectors
  lib: sbi: Preserve supervisor CTR records across domain switches
  lib: sbi: Preserve vl and vtype during domain switches

 include/sbi/sbi_hart.h       |   2 +
 include/sbi/sbi_vector.h     |   2 +
 lib/sbi/sbi_domain_context.c | 303 ++++++++++++++++++++++++++++++++++-
 lib/sbi/sbi_hart.c           |  11 ++
 lib/sbi/sbi_vector.c         |  11 ++
 5 files changed, 327 insertions(+), 2 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
