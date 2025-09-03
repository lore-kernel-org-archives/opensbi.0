Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A1CCA1015
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 19:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvvCKirReLl0GKStisjynSpoyPFv2QOPG/c3idxLTcM=; b=vUFyvMljgatt3p
	cgXvJ3NrAzs/jMlW3sVck3fi8uwjAKreaZ4LSG+mYPiBvW4w/MSSQ5J7RIq4tEntKwquNWPgLRwzR
	SkOAYBQSZIlA8uX3kJe5y4fkZd62qdlAqroSHFnbDdY7yM24KtZziVH+1gXYAoD5wQVadsHzucpqd
	pMxRSHkKsNpoyr3paM/Di4jl9LEcwhMNPQmEuFSYKvpByTjXmTPKzm1ph7+RGxX/jXW3YU6nfR0zK
	qIgNqp60y/AffIRIzH63SdJpYbbHBHzA1goLfG/byBOAHPXCbBEUaELczdeJUkudkLUNzzY/TsQyy
	SZCCRRQIHWWvdPHZ88fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uttZ8-00000007UeM-03Pe;
	Wed, 03 Sep 2025 19:54:46 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utowz-00000006ogB-2n5x
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 14:59:06 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3f372839583so6446055ab.1
        for <opensbi@lists.infradead.org>; Wed, 03 Sep 2025 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756911544; x=1757516344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLtKoUasBJNpg+6bGlZnBgDOi4YWs2IlwRsyjz+xYQM=;
        b=LCLHMm4Y/xfAH4hSjFYflUDJZiNP5oqF0vybKd37FcpRlxVu0vJMbo5KOYvChDIqX4
         ieNoOyyinPme5GduHpSR1K0x7lfi8pDJ9RdVemsRKoOrUcyU8+Opk1SvTlKnh5vd8jRq
         6jHzcrZJ01d79WgxxEw6fGjd05gXI+OvvqEq0ij6DPJscr9uJfb/H72RzyGBDmaXwBjS
         I0xxajzrdY5QbSmJTLFF5ltBXubn9T3+srNVP5mgYo9WV4yNbhe0NibpzUF/Yb9N8Q76
         lu09JQvi5FjAFtj8YixNho3sCfiK8kmGx2ar+z+VcwUS4NNhWOeqoh82uWngkbhItuud
         4Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911544; x=1757516344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLtKoUasBJNpg+6bGlZnBgDOi4YWs2IlwRsyjz+xYQM=;
        b=svetFVIVyMw+dLxu8rUpFoNQv61S31B7zjBzQwFrOAfk+Wqn2WLw62DhWEIOrc9tdP
         JW3o3KyP+nSOGdUrlUZpbA1C3NrkLvb+hiRwkAkajLx3L4+02G79wYik8nNdlVfN6tLL
         tJtNnHd1dmRt7exZBB4uPzgg9oqx9olaqkCbH7plKvdWSjjlpTw6RgEHmi0XzrW6nkyv
         sa7cGEQcKAWaengRAr/TteFzKrdM+RVPsuwqTvPG41+8CZhZxz8P9QO4jpTpAS6aNLPW
         hFCddpumwsJvuOYg4GGgq586LV47rMuJaTOGvtASd3R+5YXgH9lMBG+AcNHIHu/YbhOx
         ZEmA==
X-Forwarded-Encrypted: i=1; AJvYcCVxpQREE6lVct9QgZptU29AepkmkSCBEyKz9gyVe8DCCcZrg6X4e6Ja/I1PbGtqyVCmUOqFpBfG@lists.infradead.org
X-Gm-Message-State: AOJu0YwkOaqLYojIJza/n+gDEOb96Ox7XNP2Rv2xqRDh+41B0Kc0/Ixi
	xs8WeJUK64cBvBB4m2mg1b4SMi16gI3IJM5r10oWUf/Ur7YJArcW+pf0zQDfG3q1xNM=
X-Gm-Gg: ASbGncuTSqwUI9+XtR2VWTcjlwmkoyPr8Lh1Pn0uSMvGxGOrYbZiiA2tHzwYeqI1xM3
	UqH1BvxBmN6hXQ3icKUTx3L7Xo8DMpIaTDqqIaLoU0mhI8XheXYYuAIEvR8GD1BO3vlQzY0zgnC
	c76EhYZMbst6SY0UmsFv69G5/BbW363iTOfmVu9EX/DUrHGpvkLWuZUuHgpyQVBei9rQ7MilYkc
	/KTZe0GXpdbtveG7Swj7McxBaakr99NY3KTIgI8yw+zuVLmz2kMe3z2wL40zLUwBfMNmfhK8mIM
	reijgqFpdaj2gASP0GMG6NMQwDPsMkAYqo9REQ7FC4+ZKSGBZ0ix/ijXwOkPGGrwQZo8DpJX1im
	87kFh/LE5wfFPlReV
X-Google-Smtp-Source: AGHT+IHHgtsw1i8dyh+wvgoOdBscriHv9gQ7xBSRkW7kIOIcib+FBXhT5HHz/ByHEfkB+izieV6Uzw==
X-Received: by 2002:a05:6e02:1545:b0:3f0:7cfe:6d93 with SMTP id e9e14a558f8ab-3f3d46dd271mr289359465ab.6.1756911544577;
        Wed, 03 Sep 2025 07:59:04 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f0a4970sm4198978173.1.2025.09.03.07.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 07:59:04 -0700 (PDT)
Message-ID: <f60e064e-6ff6-4a64-a4c7-74b56e6734df@sifive.com>
Date: Wed, 3 Sep 2025 09:59:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] include: sbi: Remove platform specific IPI init
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20250903065220.456955-1-apatel@ventanamicro.com>
 <20250903065220.456955-3-apatel@ventanamicro.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250903065220.456955-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_075905_709118_62C85BAA 
X-CRM114-Status: UNSURE (   8.81  )
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

On 2025-09-03 1:52 AM, Anup Patel wrote:
> The platform specfic IPI init is not need anymore because using
> IPI device rating multiple IPI devices can be registered in any
> order as part of the platform specific early init.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_platform.h               | 17 --------------
>  lib/sbi/sbi_ipi.c                        |  5 ----
>  platform/fpga/ariane/platform.c          | 29 +++++++++++-------------
>  platform/generic/openhwgroup/openpiton.c | 23 ++++++++-----------
>  platform/generic/platform.c              |  5 +++-
>  platform/kendryte/k210/platform.c        | 17 +++++++-------
>  platform/nuclei/ux600/platform.c         | 15 ++++++------
>  platform/template/platform.c             | 20 +++++++---------
>  8 files changed, 49 insertions(+), 82 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
