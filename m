Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DDAC88E7F
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kci7DQy5rzN/nZS4j0dQyl/5X3JfIejKk4oE18G0ioQ=; b=K/V94jTDAWXyk9
	NiY6MHWVMjoFNVTc8ku+vlt22rNQGyN/pPgSSHlpT0S9kr9O8ib20sXVZslowq9ryOiF4qosvbfIf
	ep7itGvMCS6h7tiUv/Nvn+xN+nTedvxVkj7nJ5wgUC1F+v8Y6k2FWnEXcq9DXZOO32r7qIK2Bbyjq
	emeSrWCmmjigcTJn3PDDEzl8Pa219mkcyD01U3XpvGUqe0YF0QhJ1HZb9K7B1L5W4qH9jZ818zubv
	48zKZckHrPS3k7WVMaqG6X8ki8XJVGSZTjX5sggOJehGuSpAoL4HKYqzbV5a8wOMbvqiTPGkMJszS
	soRg//tdHUl+8AOPzFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uFs-00000009wcU-0CHT;
	Wed, 16 Sep 2026 18:21:12 +0000
Received: from mail-pz2-x21.google.com ([2607:f8b0:4864:3b::21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uFp-00000009wcA-3Fhg
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 18:21:11 +0000
Received: by mail-pz2-x21.google.com with SMTP id 41be03b00d2f7-cc4e4979c55so63510a12.1
        for <opensbi@lists.infradead.org>; Wed, 16 Sep 2026 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789582868; x=1790187668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qdYqqJqNal0UmKB0VUxb+7O27e+qKE/VD3h6XknRs0=;
        b=EublzYN4OxV7ugPoC/QGXY3mNnSNo5KiQRwoB6LfQlWhmFJRWIzUdPE+l4mkmajQc3
         RGTFk6IYGxLjsc/FIfkfIc6MHlfOzdpSyYCbdxpq1elnBCkWG7un7uT9axOy7dho6g5l
         bOaj1N7CTEzKtyToerabtMcgTDDRwFk97HgZt2ZbGloOx6PG1F1VaCJzcN5PtBe+viII
         K6XCtaFsoz0Pgv2PfiXVqagYJTSdTKChqkX854/Od4msn5sw3II+B8Iqq8Bq3hsBs6So
         JkDGmFB4uT04WzvbhOS5p4vuieYZ5WqIyJCmm8jP3FNm+Gy/MILbd7XZDPGmuB75GaNO
         6Uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582868; x=1790187668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qdYqqJqNal0UmKB0VUxb+7O27e+qKE/VD3h6XknRs0=;
        b=XyUSKq1SjpapBua7EQfW8kj0s7LGq5ssQIByJjICcZB1hrtFdxvzjIWKcxLjtQVELw
         78puOYuX4pMSSCHPi6PeJg8irkRvAeL7kspWXq2/g3/8mMTvRWyAIHTJZrdhTq87Kt9I
         R8v4g2IxIpwLNxLARizTuCstvfw9C7wTrkq4MHFWL62U9uTjzvJYwSlk9mgfzbGF0Fmj
         /MVt4MLioakYmeclylFe82IONZar0/D4xLHlNSthbJwD6Nn2Cq3JTESytxZjRKe0k2Gy
         dCTp4H2XuNHAE44v/OTpMYiav91vBoe4YbC5hcK33iGBHowTsQknFS2ZSCFooo7wxqlm
         fHaA==
X-Forwarded-Encrypted: i=1; AKwUvBzuomSKD0+Acq1P/f66GQgW+mwq+YkcY9x115AM4rU1P5t9SvhixK2R6llqq+relgNvG1bpMn9G@lists.infradead.org
X-Gm-Message-State: AFuF++npyV493pYpxXjo4HFJZuQGy4qMEUVdLn0GAqvh1zN6PAXfK/mT
	mdGa5JteG8M+OI2qyNxInIMOaI8uQSRGvkUDaN1B7PecnhEikfcdTuPMN/6W2T2Hj84=
X-Gm-Gg: AYBFou0jTiDJV7c5cSo65ko5aEw3nGd69m6aS11B7kIgcZnsT40GK/6TvSLJvtSYjtq
	XE2X9DU3h4V3B/Hpwir5zu/2MThY6rOS6oPFW9uAUekUBFI0SlsyZ5BWImXuFnM7d9n7m9+fjQ6
	1taV3eWixNPpgJ8hiWN2qdmA99vtBxMW9F7vBSYnV2y6DkqqY0WQxlUUGaFIhrnzff4gaxj1s9o
	oui7WONRSczEzIu/lqnuy/4wlGIdNGjnyS4sUQ1MnxQlpLP0/0LZ5WZnQy89xCtxtNnSoBbOKQu
	a+2AabbwidocHTLqd1Kiu3cuxN6jK1dgzJ6PeBFv5FmwMGjIT1o5KovzdZcDMoXTYZV7gL0759g
	IJeDFaARfdQ1uABZQWDgDn5jkKRm7NSK5sVw6AiRXXcqac4b+v1QpOZA1+vSkrjhcgnmJGnzPXr
	mFHDSCU3Ly+PY115B1Uh/habGfXIL0CdD7k5UpZ5f6fLCkkPsOsBBSZQZtRoRd674PxT7LeLnZa
	lBnzQVxyrA7QSl/U0vOkDuvOw4=
X-Received: by 2002:a17:90b:4d86:b0:39e:fbf:e7b5 with SMTP id 98e67ed59e1d1-39e1ed3a90emr5184189a91.6.1789582868092;
        Wed, 16 Sep 2026 11:21:08 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d5d0f3sm7929070c88.12.2026.09.16.11.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:21:07 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 1/3] lib: sbi: extract sbi_smrnmi_hart_init() and call on non-retentive resume
Date: Wed, 16 Sep 2026 18:20:41 +0000
Message-ID: <20260916182052.107781-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-smrnmi-context-restore-v3-1-e9dd31152515@sifive.com>
References: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com> <20260915-smrnmi-context-restore-v3-1-e9dd31152515@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_112110_074379_0E919795 
X-CRM114-Status: UNSURE (   3.51  )
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

Reviewed-by: Evgeny Voevodin <evvoevod@tenstorrent.com>

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
