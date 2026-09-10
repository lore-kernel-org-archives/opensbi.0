Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A1EC79FBF
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOAawiqQge87FmAKzj+9GauR7+oq2Z6X0ZQRGILF16g=; b=nsZKH8BZUbY+nn
	NLZ3PcK3hdpldXOvHQzEAah0nWGPsQn3/+6CAvckVYtlfsckc/wUtuIsflquC5JuAJL0n5D1Zi0UI
	HKG77KZ12QjLferxCweJops+JpoD3jjU7iqWbDNrzPm4cqQFt3R/MHWGqVCHw3g5Xk0EDBmblWV0r
	xkWHx0XXJy779NOmwXLaDHJe3+2xvCOOUduGTS1kyyeGNTnkTTy7IKpJ0yoN7BFfdMKENdJeTU5WW
	9LDjspzLlGmApvRP9L7y1HXRO55aIm3ORlwS2U5QBSNNLYWk3VTslsOIDpuzqhjzVL7UoSHaXZu5o
	79NtnWX0d+u+WhsSQmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jzB-0000000FDRr-24qK;
	Thu, 10 Sep 2026 18:59:01 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jz9-0000000FDRW-21GU
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 18:59:00 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396673bd283so17009a91.0
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789066739; x=1789671539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ErlKwHAjykbD7csplsCSRPYL74yDnU4KegW0pop7ukY=;
        b=DTgf6+DSzs9VQ43KXneuCIlIzqZgrqmVGcuVPF2+MrZXs4uPj2otGPLWOsDQkI2NFZ
         Q3jBxOiFSNJ/w4yCU66+YX1fkHEB+MN6VZ13mySx9Gf11pPLytnZhZOZPCqOT00gZxYA
         iIiwzFOHPTs1kOHQTSFN42nu4UmezW+1MAvPooejggwUntaGoWs5CSvuraeVutQy7bfL
         +d2zugKLYPUpzWs3GN89O3qq8OEZzCkVUCwq73Z0ROl26ZEbrD1bQrarqg+CYsPCu56L
         y/OTQJHtN3MZfrTE4TaJ1kEaDyPhRpxSNU4OEL+ed0yk9m8EhTfHFrz5n0SNDig68GlD
         OPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066739; x=1789671539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ErlKwHAjykbD7csplsCSRPYL74yDnU4KegW0pop7ukY=;
        b=Me481prngw2iv9OsMTPR/bljIQ0WJa6JF8kVtyPUF8gSjjB3FPYiaRAufbrEXqNu43
         rcE+cxsx2b6znJtXLxaOdQTHyO0bCj3txfqzmmYKT1IG+noW2fkDQExROMWIM27o+2n6
         YklPf/h0oR92scE/CZoIJAFlURL8ejteSZacQdfT8QiA+Wjr9gXToCn2/TVhdpFKVteY
         v2JH73CToFHiEd51DCXx8RaJb7LHlqO6i0XThuAfkCgJ+LXoQlHXQ004ICaq5Xs8nu0F
         QEUl07Z1e3BM9PeN0MIOx4w7Lvx7beZpbiyAr651jhGavz3scCS1ulaQ4PSXuyK6+M3V
         XQ4w==
X-Forwarded-Encrypted: i=1; AKwUvBz/EhyPPyWsEcSFrVXtEXNTu8Annc/400bFWObI/gHB8DT8EybqKa+AG9wiXgRJ1S4v7Qt9Jzm9@lists.infradead.org
X-Gm-Message-State: AFuF++lGtPEwkyuWhrtYoKFOke20RzDQ1YumEPuHJdw/bhfy2smWs/XB
	x6b/QhRUw+35AzRNiDJ9XG95vYvLp48+IrC2coAC5JsCtAoGZYYid5lIWc1EdUmwXDU=
X-Gm-Gg: AYBFou0qEgCpgCofnO/2tkYqbmHmtlnUeyVooc08KTzQzPW3ehtgraLPWqj24anGwlI
	hYpTE22EYNSCRO3njmM9A+PAaEhnXTuA1YFs0tx64smldELnIMPIrQrSXC4uGSRjlF8IaVQ6KDd
	i+Lel/3ThBdV3tOvj0jk8SW/j44QrVOp8Zzgk27OTyStrYFO5I9Rh1F08VJPxukHF8hy5/2EdGv
	UPzUignb2sh5s+G+yahsigijidD6snn48bU8Zgm6cUeBaVkHDvUi8B0lflS4ovSikdsjE3Zv7zB
	fYeR1pU8wKVCYB7IHza580mPb/ZJVbjai+I8+ziw5xoUinM3V8QbUMKdOsj3Ows318W3F3nduTl
	ji7FQsozQiAzle0hKNDplEeqX+i4NkN7lWnn4lRx5Z3bZ62bv7QwgD10X4yQXA509xx016MuO0K
	sMLbhv7ENvufgCB6bKxQmCtfa6UBODi+m0MTjYfAIapT1dPhQh0rxooT8uP/hQTG8IIX8u7GP8a
	uwUD5iCP9+m80JZxaGHuXq/Vlc=
X-Received: by 2002:a17:90b:5605:b0:390:3936:8760 with SMTP id 98e67ed59e1d1-39d9b99eb0bmr147904a91.0.1789066738765;
        Thu, 10 Sep 2026 11:58:58 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm82685eec.6.2026.09.10.11.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:58:58 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 0/3] lib: sbi: Fix Smrnmi resume init and optional platform callback
Date: Thu, 10 Sep 2026 18:58:39 +0000
Message-ID: <20260910185840.12169-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115859_523044_4852ADB4 
X-CRM114-Status: UNSURE (   7.21  )
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

Patch 1/3, two things.

- I'd put the sbi_smrnmi_hart_init() call in the beginning of
  sbi_hart_reinit() to initialize trap handlers early.

- Worth noting that after this change we have sbi_smrnmi_hart_init()
  called twice on cold boot, one from hart_detect_features() and another
  from sbi_hart_reinit() at the end of sbi_hart_init(). As long as
  platform's smrnmi context initialization allows it, this doesn't bite.
  Please mention it where smrnmi_handlers_init is declared in
  sbi_platform.h, so a platform knows the callback can be called more
  than once on the same HART.

Patch 3/3, two things.

- Global variable is racy because every hart writes smrnmi_init_mode and
  boot hart reads it. How about make the banner stateless:

      const struct sbi_platform *plat = sbi_platform_thishart_ptr();

      if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMRNMI))
              sbi_printf("Boot HART Smrnmi Init       : %s\n",
                         plat && sbi_platform_ops(plat)->smrnmi_handlers_init ?
                         "Platform" : "Default");

  also this is lightweight and clearly describes the status. Then
  smrnmi_init_mode, the enum and sbi_hart_get_smrnmi_status_str() are
  not needed.

- Also, I didn't see a platform flag to indicate that it doesn't need to
  initialize Smrnmi handlers so that boot code can proceed without
  smrnmi_handlers installed. Did you plan to add it?

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
