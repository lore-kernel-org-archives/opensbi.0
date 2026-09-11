Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E0EC88E4D
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bu8YtUDHWIqGijOIWW7DkOoQIciErdmZm2deA4foaA=; b=N2jgFzSHeIi7KG
	7rRVK558iwhyxMvPMCV/hD6RVoIZUovRHODhbwOTDxrsdthfTdArQxT1Ho75yk2o3x4vXKPoSJ98Z
	gDKGA9rU4p9zbiPl96LFf+I9nlSdvLfcTPGO/hjTQQbH6NOspRZz3QEvp8oLwmZiMStLCAOQgGsv0
	YENCYXMI3MZBD0fTiJ3whZbVAShv1c7/aV9/KB0VwoaQcVgXVnRSXyTEHvxAfYqLu48KyVa8rcjHa
	kxEVE7ipjofCqJH2djKOaIuc5Nfehi7gZVP/gYlyXnZLKE75wq6GGRZ6M2OMVFayg71Zvxu7T/NbD
	8ic0sxXiicGmyOu1vWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54mY-0000000HJ0M-1Ozt;
	Fri, 11 Sep 2026 17:11:22 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54mV-0000000HIzH-2iEp
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 17:11:21 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b1a806664so188824a91.3
        for <opensbi@lists.infradead.org>; Fri, 11 Sep 2026 10:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789146679; x=1789751479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duFbKtbBgnXek7rSBCmaW6SygZU+H9+kdoNSD5PowTk=;
        b=Ko9KsN59+Kkx5iYe6p5xK/w+DrzH3nGcKib1wKb/KrrXHbjm2/JlwZjOd3bD3URvA+
         kZOc0yAwDTLONmFi5cBMvdghqqX3mSjxQMT59VQtNNpmHLhsaLPUsLe60JPmpj2NRJNG
         N5PRhFTeNImRK+umY4aM7Z82t9L9nppA1uVAHKsAcZTRA5js76xJ8oLu+t3vRLHuB+wY
         zBCxzILuu3Tgz1S7d90igh0jfz7gD5W+M8qYqsEfNN3jqD1A1lrx/3FmVbYf11wPlsdJ
         j1YaBQoUS8vCOv9go4gQzMLEXOBk/ZyS61K7naUB/pJfG+bI7FEdBAO2uTF9Mc/hGDBZ
         P2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146679; x=1789751479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=duFbKtbBgnXek7rSBCmaW6SygZU+H9+kdoNSD5PowTk=;
        b=LwN6wP5ZGLHaoxmYoW6VRwM7wXZALiqqkVvIjy0Kr5sBD1xlgDuNBW/ynwtjhaKyOV
         /DOGSnkautoq09RI/97j6mG8wI0ME8mntIY87e3EXVvdbPfwXyZxumwYcCb5Mq66KFJL
         05ZWNyzrC+xxniKs/TNJcUtKA904N1KEGU0NTy0y3Ik5CrmOQWIPy4KCHJUALPVPHZOU
         A59Tje2qzaOCDvRo4AbDSPsjmqHkqPaNB0qq6TxJQERvXk+hV5WpGs9sUB8NBIZ/7SDf
         06HF9RL9uhQneNDrVonGHVpSnRggsubb5ZiVgDtdJSCcC8dpO3t5+aLGAK1iKSPdReKT
         dtkA==
X-Forwarded-Encrypted: i=1; AKwUvByGCL04J8+5jdxRJ/hpcGJFcMTHfUIY9j3zq5TSbhQbIzAFwsL9qASfBT3HOOSj36MzmbrMnn7y@lists.infradead.org
X-Gm-Message-State: AFuF++kGxhPxUOYEPUZaBBk5hgBP/Kh1enLUMskEZ3tWZB2TcRGYlqMt
	90kBLpp9MCDORbn+fKE+w3+37eBEmLcetCXL1g28WIRZTdh/i5Dm1xyCwPZuP8C0+Es=
X-Gm-Gg: AYBFou0KlPEQt7T3MfljBxrjHqzjNwTwaYktONgeZYqDbCxovuZdRFioOppd/JZztZY
	CBdZ9h6tNw6d6lkPeommTiEl0GH0Czug4585zrp3M/9NvgPtdC8YdJlRqCyhxyAywMQSqpo+eyb
	anuwb/yb2OU5/jfemXSmrXBuRvQIcgXtjJU4umKDwqViVKPphnIXcDda5Fd/0aLBdBvN3wLzcnl
	8amJrXDZFh2i47xtrFmHPrrJhGNa0BZKIADELHi2Zj0YoDu01JY//mTuTLLvq6DZlf+bUKVIPr6
	/SB/9KtGjvXSYRhfBlU+C6/WDzU5oVZqGGeZq4BBl1M71G59d2X+TAVMn5bBRtsI+ySSO1eNdjE
	gmNsAxONDaWznEkKMEVSGiW1j89UkgtAkkeWQwbtva7Ua86XioTQT6sSeUnXnqvaP/zxki2cGrT
	y4yqZEzNgKS69+g34cBwcWQ3EjcR66k2tzCliT4JXGgTy6vE1Avi9kErzlGfmXMbO1Z7Tu0pHLX
	kpWtuO7HCLmcwlnnDS/iLNk0gyGmLLmoSh34co=
X-Received: by 2002:a17:90b:4b82:b0:39b:34ef:3b24 with SMTP id 98e67ed59e1d1-39d9bc05930mr5808466a91.1.1789146678720;
        Fri, 11 Sep 2026 10:11:18 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm8676906eec.3.2026.09.11.10.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:11:18 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 0/3] lib: sbi: Fix Smrnmi resume init and optional platform callback
Date: Fri, 11 Sep 2026 17:11:01 +0000
Message-ID: <20260911171103.18573-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACpYXwAACrdFcxTpNUgdsk6xGQ3yMRti6jFD_ui-EDH7WtyBaw@mail.gmail.com>
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com> <20260910185840.12169-1-evvoevod@tenstorrent.com> <CACpYXwAACrdFcxTpNUgdsk6xGQ3yMRti6jFD_ui-EDH7WtyBaw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_101119_690719_8C69AEA6 
X-CRM114-Status: UNSURE (   9.98  )
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

Patch 3/3:

- About the mode variable: I don't think we need to keep any state just
  to indicate how Smrnmi trap handlers were initialized, if a simple
  check gives the same answer.

  sbi_boot_print_hart() (where the Smrnmi mode is indicated) is only
  reached in these cases:

  1. No Smrnmi detected (Smrnmi mode output is suppressed based on its
     absence)
  2. No platform handlers installed (Default)
  3. Platform handlers installed AND succeed (Platform)

  If a platform has handlers but the initialization didn't succeed
  (sbi_smrnmi_hart_init() returned non-zero) the hart gets hanged in
  init_coldboot() before any part of the banner is printed
  (sbi_init.c:299, the banner starts at sbi_init.c:440), so the Smrnmi
  mode line is never reached.

  So, I would still prefer to get rid of the Smrnmi mode variable in
  favor of a simple on the fly check.

- About the platform flag. Allowing the NULL callback is right, it fixes
  the panic on platforms with fixed or mtvec based vectors. My point is
  that NULL alone does not distinguish between platforms which
  intentionally didn't set the handlers and those which forgot to do
  this. Both proceed with csr_set(CSR_MNSTATUS, MNSTATUS_NMIE), so for
  the second one NMIs are enabled while the vendor vector register keeps
  its reset value, and the first RNMI jumps to an undefined address.
  This is broken in a way which might be hard to debug.

  A flag in sbi_platform which says "this platform has nothing to
  program" separates the two cases: no flag and no callback is then a
  platform error. This is what we agreed on in [1], options a) and c)
  together.

  Thanks,
  Evgeny

[1] https://lore.kernel.org/opensbi/CACpYXwCiciQzQo99=f=_wioYb3kHHTZkQm_UAi6FCXYpbJmeog@mail.gmail.com/

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
