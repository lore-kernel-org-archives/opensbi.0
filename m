Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBA7C88E72
	for <opensbi@archiver.kernel.org>; Mon, 14 Sep 2026 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZkVVKy8meGApoY4MZcGEnpC8KK7Bndot/2JzT72tgo=; b=A1vGfKSi+nbYBo
	YG6BOgsivB3yE8navjgVOjvkz+u5Sxyhzbs7tt6B4RT4jsenDkNucaj1hPpIH15J8GIJJY9NUhaSv
	gnRIZiUYULR2z5JkLIPzTGJ1InfRJTNMx9OeeK30uejO/LnECXHq7LCXoTPODt5nKBSaii7e1hiqN
	uPoHKh5Sjc1A1V2jO8OFh48eAEh7/SiVVR4DBpatxveb3CV9JObdVDdG0v4ajAAjI939FzCsKAtbp
	mA0kIoR7uV76/2srKiRjQDMbz1aZ3yUHnAgo4tIdiNE+F4apsQieIgpXbWcFKxX2Ue29g7raTJgGS
	/xKXM+tje2lYSVw4ecYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x694d-00000004Epj-46F4;
	Mon, 14 Sep 2026 15:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x694c-00000004EpN-2sYw
	for opensbi@bombadil.infradead.org;
	Mon, 14 Sep 2026 15:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZXC5jICYFyKmu8qk2Dn47ntZSr0UKhydXldZtqG5NB4=; b=HdXZSKXGKWP4It218Jotu40MdS
	W56aRUj//PhLv2SkUFUY7QCx5UXjbU2/wPanlkxVnnKycMZwZ6vt+BDsdtFhStQluvUTaVzAiU64s
	ILogXPoTCMXnJe4nPQanFOYyTE4ENcPzraogPbukhSNYJaq8WgEdMu4bOcGYptGRAz5LRvxx/a7qv
	qKnlbwyPjFVnkGscxixK/73jWBuPR1pfjKp9AKLRAXtohdLupRzgxW35KZiS1N31hChHAyUqEW1AL
	5n4fosWAd0NOMK0NeKJuxjkHxcthr6Uu5zc2xR7Xnd1lsCzTKLxRE/LEG13m/yRBnqx7h9aEZmse6
	5d+sjU6Q==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x694W-00000005oIu-30uI
	for opensbi@lists.infradead.org;
	Mon, 14 Sep 2026 15:58:25 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc46895f82dso168705a12.3
        for <opensbi@lists.infradead.org>; Mon, 14 Sep 2026 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789401498; x=1790006298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXC5jICYFyKmu8qk2Dn47ntZSr0UKhydXldZtqG5NB4=;
        b=Y2IcoQ/rAzFES8YErJ7v1FGXzgaEvSE+62+5S/Y2t5Xn/BapnIrcd7YPiOwOIdxPDM
         1nl0UqmXD6m5SoamUlNVGX5urHY/nxKANCN3Z5QnwDUmTmxEOoksjeJvQsz507aitWau
         Hx02LwfcYQJgGNSFoJSd2Qh4E4+3kF5HTr3f6TvuKaolAKxgm8bn3pcb5/MKdcunmzsN
         6SE0Z8vAI1oHcJ2E/ffTYcpzIvlqVqzTDjl1MtOZyFt5OCUk+nqc7ihbR2zAGgL5Syig
         rdnOCamF2ic7/V1fw4Jn79mTLGf9GoXupOtk6svDGl+8RmRg10mA2TQENXxWl8tgRmwK
         NrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401498; x=1790006298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXC5jICYFyKmu8qk2Dn47ntZSr0UKhydXldZtqG5NB4=;
        b=fWc5Xe6MaXntNLbsFcicS7OYB5DVPeR8ctVz9dK1AmsZf++jUmVIakTwk3cnQFmt/5
         D6UYwsLfAyGf/uchaIDO9GiWhWTVaE6mw7W7AiZEjEvcdTChLlmUn4s+JDFNhSELXEFT
         N678WZCdXO76rpijf+oZwm/ryxu0sUjF0LAjWoMzA3AKj33wCc5aX2Hkk480DuddjgzS
         rdBkCvpjR97xO+Tti2LpsbLCDSqnU4gRRz+lmz0EqXPXd7MOVEUtc+HQKT6HeulCuDF0
         /eHUkvoBhsFrZ+88ejJcn0fEJN6CoCLHyuKOEYlxb6rNqFdkUA7SfUqNJV+aePFe/86n
         x1pQ==
X-Forwarded-Encrypted: i=1; AKwUvByREYUV419a0XwWdEVQHRBdZqX9E0Ar8nnQcwJ2LHoqLMiBeSRUd/8y3A42LHunFi7yHMUlbKIC@lists.infradead.org
X-Gm-Message-State: AFuF++ldnO476JSlmNkyMYulWTXphRmGIq9Mk3MOVPCFd9thcjcdJuvt
	yNrTvPG1v82Jfb6Kbbg/Lhi04WFgBSu6g/Pu3yssr9VXkSo+nwVQml+r7+W63IXPwxA=
X-Gm-Gg: AYBFou35K7SFppY5w0yO14kryJ2Btu61bhZ7MWUN+dWybcjqAZfbgoX9Yg/odMHDElZ
	cT4cxrFYXF2zZjUCTsL9Ij9ktVCG1gifUKCfZDQPwCkzhUGUS/kCcLrz5BH1m9fCPVLOIR8wPX1
	Y4Yy3jWd5YOkfgdyRqOmyyFc9XlVCRA25Arypeem6awIDFS8mfL1Okp9EwJXxZM0kBlENGrfvi0
	ulm1uPP5zwmxILMNqDbrmAkaxxLia9x6cdDclqy/9gY9po4xIOo4fpRiJ3HjY1Hmo1CL+KNfNhK
	11TdJ9g0lFzvbnOTkcooBPUv6hb1tgTWMpMlvrRhz/ewhLoDnkJJYXMlu8/YSTtbTkpDhqHh0+6
	lvrQjdKz4iebYquaw5sUfcKptoDFk5KTlaygQlQUsCa+MumQM/laE8rPAQez1odjVIo34GgnvKC
	EfBXBMVk7dAiNz/Rn/lGGA2uSZU85RjTNekiyje0iPumUaQYD3CTH95HK5of3JVzDOklB57fGGp
	MDu2YpnMdarysU7JPJHAOsrVmb8
X-Received: by 2002:a17:90b:2541:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39debfbe500mr4369273a91.2.1789401497995;
        Mon, 14 Sep 2026 08:58:17 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm26910597eec.25.2026.09.14.08.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:58:17 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nia Su <nia.su@sifive.com>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	opensbi@lists.infradead.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 0/3] lib: sbi: Fix Smrnmi resume init and optional platform callback
Date: Mon, 14 Sep 2026 15:57:58 +0000
Message-ID: <20260914155759.21435-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACpYXwCNakoUGui1SUSFPePk_Zw43oLv2BmicbEadF0OF+Tu0Q@mail.gmail.com>
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com> <20260911171103.18573-1-evvoevod@tenstorrent.com> <CACpYXwCNakoUGui1SUSFPePk_Zw43oLv2BmicbEadF0OF+Tu0Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_165820_928175_9BC6D179 
X-CRM114-Status: UNSURE (   6.94  )
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

Yes, this approach corresponds with what I meant, with several things
worth noting:

1. There is no sense to sbi_printf() from sbi_smrnmi_hart_init because
   this call is before the moment where console is initialized, so
   output is invisible. We can just rely on return value here.

   Worth to mention in comment to that new flag that it prevents
   uncontrolled jump on a platform which accidentally forgot to register
   smrnmi_handlers_init, and that a platform which really uses fixed or
   mtvec based vectors has to set the flag to indicate this explicitly.

2. Not to forget to update value of SBI_PLATFORM_HAS_LAST_FEATURE

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
