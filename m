Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB47D0E6C5
	for <opensbi@archiver.kernel.org>; Tue, 25 Nov 2025 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hERvXw1rA68bOd0s3konBMC6mLp63lm5Bd86OxGOkYw=; b=MXPfxcJpTridKC
	eiu8Qdwg12G+CjK14bIdFIQFYFTVMwNIXutegFEjYkGG4oCkVgSV4aEwJJkPnz+NscFiFCzmAxh/P
	O2HHONlVoklO67xUgDXYq8a7SIrdY8FGR3gJJwUQ/Kn35l+UubTsw5ms2Lconc+rWz2ENABKK1uSy
	LwMeLyR9Xljr7PWo+d9k5Z+TFFqTYWutlyh+3i9E9zeZRUQ0vlfgbb5iNtPl9/yetL7XY4DQ7S+P1
	u3FlUVs4+C1Qvt0PfFohRjw871qB5aidXe0JGSOkYttU3aRDjMViRhHHmxgT9ykqvTOChR805LZYk
	O8VoBboREanO6QZCd3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqyc-0000000DC64-1kOX;
	Tue, 25 Nov 2025 11:12:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqyZ-0000000DC5O-3C5i
	for opensbi@lists.infradead.org;
	Tue, 25 Nov 2025 11:12:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-429c8d1be2eso600907f8f.0
        for <opensbi@lists.infradead.org>; Tue, 25 Nov 2025 03:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764069169; x=1764673969; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjvkB9O8codBE9ZCGHjrj+2Trt3lTi0ZpXK1TuZU8fc=;
        b=PrccAVXrEIqUs6iw7LBgO6dvqucsEOSNcuuStGVOT66om1dw6XpnkU1+xfLt+PZ29X
         +Yjm569odWsOrJEsYGOSeveb+hJ7TB/QI3ksXaQ5d6xCjTlqv07CT/V+C0OPxv+8ELOU
         P5KdrOpLfE/iOCgC3cIVzLsP2K74LtYeI7Opl/5zgfwLJwv+o9gFxW/0iGb9vJFdFDu4
         gXj9vo84XuAOuncIc1b4s4oVeU/NaU1vCM1h274Q39KZsqtymnlhsiIMkmC0JYozEgFN
         Ek8xC3k/mWLqKMc/MWM78dT4l6P2xykgdh6wndNJuDU0AEGtO0BhIvRAC1/VFD9t2wjr
         k9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069169; x=1764673969;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjvkB9O8codBE9ZCGHjrj+2Trt3lTi0ZpXK1TuZU8fc=;
        b=EsuiQ3L4ReKl++kSNWBC7e29hdd2YcAdNSixYQ3V9Rcd8Y0nzJf7qYsBbkW70oZ2c8
         9vOz4Ea5WRHKJeHL0MBO2mWCuL5pNkQYHm6R6Ii9vWG+7RldRw/oJBfUzZhixShDOFnQ
         OLRPqeqG5qHJxUz1kIlmF/EMvm0vwmh5I6auBgkgfREGdZEwN+m/Mg44LGVBDL4qe99t
         fa7dHegBZSoVOtBH+kb9lF4bxAk7u3IwrmdOu8CZ+Aba0M3t+ULMRY9AbaREq2iuuqdA
         VuSQlnlSteZ/yttrvNCFXI/hhfxj3NSD1cQMhQIUtNWRlw0BIWg4SiYuJXxWkUaQMJ4l
         whpw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Nlaz0CqUOROr1KQn6PXvW1BgiGRKlbDtgMlw8aC5cE6wCXx0o44vGI9oZrV6+alt1KrJTYfo@lists.infradead.org
X-Gm-Message-State: AOJu0YyB6uxo9vP9Lv+U0XwqWyWVWamxpf7OarJ7Bsod+8KuIz1fVsEK
	BqFDBwBxgxxbugw1hKXIqugapblx3+mgTVGZwAo8+lwkA6ueX6QOzRPjxknBA52/sKY=
X-Gm-Gg: ASbGnctR0+iQ6OXmGbn5Q7soUWmA0pTtER4AOG3hHlr+7faXM8UpQDA+9kYwh8tW2IU
	OcxVRYyicWW7L1Xog4uGcw2QI/ILR3kRSv0OuPx3/Vi84XaAXltzSXdoOpc4JEuApeQuC5sU3Y/
	PGYmiXR7qyFk5ZTYFtF6L16RiH05emYVahToONrRcnCDOlESCxRLQhWX6K1ACquiRTvdoZPSbXW
	Z9AfWnNDHnWpNTIFHYgZMa0gfbzB4KsSMPYd3+O13TbA6B/8/dRpez3GrdQJtNbGpKUcVG1Kn2v
	HO8DECBEKFEvhKsIUv6qPN9LXxkgIfSCpsf1QOruWwnH6wwFSXdzRg6Z8k6/WOBL+uGVJ2JtjQA
	W63uS/4dc8KBuSSzP7A5F4x20x/f9SXwxYSLUSePDoOxImNrLPynTxplaDbvIjVJfzN704QaRwq
	c=
X-Google-Smtp-Source: AGHT+IFTOAcGvm8dFIIl1T3GlEg588ipmJTcPyrwuNdePnc30HytBbpre4Vavlc5u6VbbgCU+VTEpA==
X-Received: by 2002:a05:600c:3b96:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-477c315f86bmr86688415e9.3.1764069169136;
        Tue, 25 Nov 2025 03:12:49 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479052d9affsm13405095e9.4.2025.11.25.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:12:47 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 25 Nov 2025 12:12:11 +0100
Message-Id: <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
Cc: "opensbi" <opensbi-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
References: <20251124220339.3695940-1-debug@rivosinc.com>
In-Reply-To: <20251124220339.3695940-1-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_031251_794842_7F438995 
X-CRM114-Status: UNSURE (   6.33  )
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

2025-11-24T14:03:39-08:00, Deepak Gupta <debug@rivosinc.com>:
> Expected trap must always clear MPRV. Currently it doesn't. There is a
> security issue here where if firmware was doing ld/st with MPRV=1 and
> since there would be a expected trap, opensbi will continue to run as
> MPRV=1. Security impact is DoS where opensbi will just keep trapping.

Does the DoS happen on some implementation?

The expected trap came from M-mode, therefore will have mstatus.MPP=3,
so MPRV=1 should behave the same as MPRV=0.

Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
