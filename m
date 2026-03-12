Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1AD105A57C
	for <opensbi@archiver.kernel.org>; Thu, 12 Mar 2026 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BByVgtUpfrvzB1E5hq3Ya53ZTxOVDX6RC70pKnHiuew=; b=IaVycA01pVOABP
	pKkuGuOinOH2ysDRQjRfgtCw20S2onCLTZt1HJbl3n83MrUqXJOOMcMSxgbg3pIF9jmTSzCGgs5QN
	V1N30OgaMv0ZFWLrG8r0gjwQ3omHq61fU4dLfFohAWiGRG/UTXwhA763noLZc94ym1V3xegwzWl/2
	ibell0D9nDJsKCM4RkFXJFAqrsWnIeS+Y9IEoKtMi1SXScOoRzui9hMhtiZFdQgRVCKzCHX5RwGYi
	9v/N+4n7wwvuUa/qUykEdAmuAQhX0l9r+EFSEBIhspVf4SaJWVSHPWTmAAElvNz2aXbZIOk8Sjz75
	N8FLInbK+7xd+BRUxCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0doF-0000000DuHF-1Yly;
	Thu, 12 Mar 2026 11:02:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0doB-0000000DuFz-1nal
	for opensbi@lists.infradead.org;
	Thu, 12 Mar 2026 11:02:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso717887f8f.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 04:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1773313345; x=1773918145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Try9qOJW7ZyZnaj6NyPbEnHYn/1eOH0+YiP2ZvG7/sI=;
        b=vtth60NaRR1IjnLsxZeSQve2A6zykj7mGZGhgtviOgGQ5FdbXGEr6s8/lIHFhzkvEJ
         25nvZkgWm0OP0M9rkoMpMBeJfj1bGrYSpOwJlWTrvKIPRmLgGiVQ3STGKkybrJ2xnehH
         ryqGusvpHlCnq92cx8aBCd0p3w0Kv6QFn5XezjJRuJKN7W/H/Tqh0m12737DAWvDM3Az
         oj8H3PsvteZv33ul/pBi23iJBdOZ7aG91q7DbWLWosO7aX05OgCvMZFL/d1LDXQTTl9U
         3zptIG3huffbrsBlShZw2lEK/k7mtJxpfYEgu1uP3RpS6HQPfK5i6VYzp7u1xQinzzLc
         pgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773313345; x=1773918145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Try9qOJW7ZyZnaj6NyPbEnHYn/1eOH0+YiP2ZvG7/sI=;
        b=ZsDqcq6IHdNDITwKuv0BwjcxboAKMlZ1HGxjLS+GkcKrXmxmh0/QPPbEsIi+CU91ZU
         ySs7YFMeboYBVbkW+2RoYaVFBp4KJbgtQ5QRntcHEHMunf7MIqz26hbwmpneIWZ7je/Z
         RNmbTK9Xfs+ILR6+xY1avTIIczDtGA3AJDiPxK866gXpP4rcxZCqlUsbFePHvIstsoeJ
         qHh/xEdMtxbKnQa6MdUvmvwagDQ9scEn5C7GTsHk5Q56eWco2SKSw0k2ILNzoFxdWFt3
         nj5HOe/fkMpXubsUCgXyeJCpq2UWjRh27BwL+vJXqH3ra9rsXyErifTdurqmXrsZ+vL6
         bLFA==
X-Gm-Message-State: AOJu0Yx3/DrT3bT8H7d3VMHmT0U4fZnkXlim1Qqm/RpidR0/1Ab6m0GC
	mA4ivYuGyoo/PU8IycYCope48UZGrotxPFirygXgxWeEhzD97bpNCJnW0XTVlUVCB1JpbRy8NRk
	61woJ
X-Gm-Gg: ATEYQzwGFMYKaGiBsjJ0fb2IUBUD3NzP0oHngZu5b88MIKEyKTq8p3AByprQ/i+Z73F
	zLPL5plsnxubmolY+DdcEoEmH+Fd8d8uki94jwwdpuVg3+l1Uyl7rZ3zhV3FTG42GU7GbLCVfmK
	BwyUGqKO46TRCiHKAnM6Ps3WA//mCS7I256jz4XclOy/H5Aenw5rD1qvxfaE5Y/qvs7tp3EcePi
	/LyjgU7PJoICd4txrABxjWbh2x+wAtP+l3COFF7SaXb17NY6HS7NXD1BT9gzEfryUzm458wrw5y
	C6uAWVvD9Z7AD5DGK36lePGQ9bP+1Vf3noD35lNarWFftaGT8jUU7oMndpoa+L/q1rFpSbLnE3E
	jpgLoCppl4RHqKWHToUfyFX3/uI6CFT3Z7xuA32GZU/KoATYE/63UShEBYTYWs4a3KJhN1M821V
	7qYrzyh3g9APjK2i2BSn0JJEylHXKMLjylW6im94UZv+/lKVdfmmIKLj5OIx4gk9mgKg==
X-Received: by 2002:a05:600c:3106:b0:485:4526:ee05 with SMTP id 5b1f17b1804b1-4854b0fb159mr123072885e9.19.1773313345267;
        Thu, 12 Mar 2026 04:02:25 -0700 (PDT)
Received: from localhost.localdomain (92.40.169.86.threembb.co.uk. [92.40.169.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a18de05sm44625195e9.0.2026.03.12.04.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:02:24 -0700 (PDT)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [RFC] OpenSBI: Lazy floating-point and vector context switching
Date: Thu, 12 Mar 2026 11:01:58 +0000
Message-ID: <20260312110158.77308-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_040228_412092_0059B10B 
X-CRM114-Status: UNSURE (   9.58  )
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

Hi,

On , wrote:

>This does not work in Machine mode, where OpenSBI resides.

The code provided works in Machine mode. It has been tested in an M-mode
environment where OpenSBI executes using S-mode bare metal app.

>See privileged spec, section "Extension Context Status in mstatus
>Register": "Machine and Supervisor modes share a single copy of the FS,
>VS, and XS bits."

Yes, that is correct. Machine and Supervisor modes share a single copy
of the FS and VS bits.

>This means that a Supervisor mode program can set sstatus.FS to Dirty,
>access floating point state, and set sstatus.FS back to Off without
?Machine mode software noticing ever.

That is correct. However, in the proposed approach the lazy context
switch is triggered only when sstatus.FS is Dirty. If sstatus.FS is not
Dirty, then no save/restore operation is performed.

>See also https://github.com/riscv/riscv-isa-manual/issues/832
>"Impossible to implement HS-level sstatus.{FS,VS} = Off with
>software-emulated hypervisor extension?" where I ran into the same
>problem in a different context.

Could you please elaborate on how the issue described there applies in
this context?

>So basically, lazy saving/restoring F and V in Machine mode with
>multiple Supervisor mode programs is not a designed feature, and is not
>possible as the privileged architecture is currently designed. For these
>use cases non-lazy switching is required.

Could you provide more details on the limitations you are referring to?
In particular, it would be helpful to understand whether the concern is
related to the shared FS/VS state visibility between privilege levels,
or to some other aspect of the privileged architecture.

Thanks for the review.

Regards,
Dave



-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
