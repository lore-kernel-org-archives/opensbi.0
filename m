Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5576C83F17
	for <opensbi@archiver.kernel.org>; Fri, 18 Jul 2025 08:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZ7y1QGG25mLUu+s2LjYnVz0zi8pIJPvw2kqTEDK6aI=; b=YxSAMWaDkaUWIJ
	lmK7hGN2FV2un8ARujKlwEx3uPa9wz8rfQm1IDjQweBjmSZ0jAln84PY0zkJv5xzy4AfHAOgQ1t1m
	T81WnM7hCJLmPBJ7uHqM1rdSNDqshs36UOl9KnUUZpsFlv9leyNIX1n9b3kKue8HdKWpLoiQ7d3yL
	36P+sF6flu8/mhF9PERtLx1vVLqAmsgfelQYJq9RaqVtkBhtw5yymTH0Xh0HEkrAlx23WRfmSawZx
	uNZ0Z2qs2yN/eMaw2H+iKgt085Q2QV19kXVdB507PX2qLCZu/puIvuYd/P965/4ebyeHgstjlk8Wu
	DZHafxD0MO37gHUs7rZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg9J-0000000ByYd-0kK3;
	Fri, 18 Jul 2025 08:08:57 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg2H-0000000Bxpi-29Vv
	for opensbi@lists.infradead.org;
	Fri, 18 Jul 2025 08:01:43 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3df2e7cdc69so5404175ab.2
        for <opensbi@lists.infradead.org>; Fri, 18 Jul 2025 01:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752825700; x=1753430500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ltA8y5JRVdkHYchbXpin0ZRrBuNq8K/NIyunbjX/Lfs=;
        b=PNyKstnQHkSegDUXw8fr94WsU0g+b4JhOoQ+nQOINsT0gQbWSWgvyKKZ2xuKzYbKYn
         TGlkQ3/9Co7QjC59UFXv987d6HNa7VGYO0OtQmzaj+LoJGUpJKvCuYOz6ks0H/bdCP1M
         7i6CAISDG8JbK0pz/Qkpwpz0FzZTXe4AietMdujZMphjvZVBSPmExg0y4+2koyrn1gVc
         +Urp4wHzowkn1ATYd1QjExqWWs3CKN53V5OSwVeegaG+mJj3qMp3vhCnwbv/euj+g9pl
         yvwNnd5QB4qKWJHSGd99vADn6n6DLgsPmVpZmJIP/qCGyVRH/tACx3hruK/tqfLZCcaw
         MALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825700; x=1753430500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltA8y5JRVdkHYchbXpin0ZRrBuNq8K/NIyunbjX/Lfs=;
        b=LJ4maZr7Udrc8Y0kh6FR65rUNrpxHOJTBbP255QsXktkRun+8RKvbRLzY0F0cy1XgW
         1vra5gSimPicrekELah30YcBKGGoF6CYSiVwyS84EWz6DCKDToVY1aEyLg7EVwKLNm8o
         EGY/oVVWrxojbKn5wEfkQr42dnGQwH8g6/reSZyHmRIJ7Nh8YN6UurJFBIO1a9SH74OD
         DTYyn61CN5k9+yYLKqkWsDkCKTdpAoWpSUGbNK0mx7kZQ17VPF1pd2BneK2hTxsPHmdg
         S1mC7cY2Mg0wj7VrOvHzpUh9MbW2VOgEkI6NwRcg7LvkyeWEOo1WVh/JWp6ANirYoFKY
         vs/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnsjAqKbqCl5VDV33YTJDS1oOJe+sm695ukKqDXv9+pdx+ZdcIeWZmKnqzujm8aqQkPyiMuBv5@lists.infradead.org
X-Gm-Message-State: AOJu0YxMqYsxInTh7OQScgVLqYkSNbM2DHdGdh1USX7kGslSUHk6PNwB
	PBiD5Hc8s+7C8+yPj9z24cun0p8oq4tDDojiFk4E+YqMtU4kjVoKYVCPfw9qWuPHtU8eHD1RIQT
	cOZmw
X-Gm-Gg: ASbGncu1W2DkxusjZaszh33VfedtjTYqhmEx3+MEv3UW9obDkmVaMcApGvG4nmdjDwr
	WgMGsN2clsFErlZiXD7R+bHH/ocrhulhwSc4l5JSOfX2W22LoMWmKtDQ0SbI/r7KlqRmt/MxeeN
	Mi1i6cFJYukH8scn8YDUwZ2pYkXQsfPl1amLltmODiqwi/NjEUy+8lztiMC78U8+aytNZl0yxze
	H+QVK//mlGheJ93FGwT7ZbfzK/E4SkG/g+6byTEDOsAlWfSF5a92Cv+3ZrAREMEhc4qL4+kDBSu
	mN7pQi4VweIPrBxg1tNLU/dgnx+VUcWu+YbF1YNlov77afE64hjAKoz5N4tGSas12W9o5NUS7xF
	yx+SAlxsWNX2YE8Had53CSC81LQ==
X-Google-Smtp-Source: AGHT+IG5fCHrwTaEIgSzLluxIEZePLIe+gf/80DzmlHd4RsqXWYAXD2czfbv74OvI6nZJBx4atshtw==
X-Received: by 2002:a05:6e02:4518:20b0:3e2:977d:f814 with SMTP id e9e14a558f8ab-3e2977df87bmr11251165ab.19.1752825700521;
        Fri, 18 Jul 2025 01:01:40 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e29826d489sm2772565ab.43.2025.07.18.01.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:01:40 -0700 (PDT)
Message-ID: <3d8ace28-3c8e-4bef-a6c5-92b0fd60fa60@sifive.com>
Date: Fri, 18 Jul 2025 03:01:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: Rename __rel_dyn_start/end to
 __rela_dyn_start/end
To: Jessica Clarke <jrtc27@jrtc27.com>, opensbi@lists.infradead.org
References: <20250710002937.44307-1-jrtc27@jrtc27.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250710002937.44307-1-jrtc27@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_010141_559187_4DFCE78A 
X-CRM114-Status: UNSURE (   9.99  )
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

On 2025-07-09 7:29 PM, Jessica Clarke wrote:
> We are using and expecting the RELA format, not the REL format, and this
> is the conventional linker-generated name for the start/end symbols, so
> use it rather than confusing things by making it look like we're
> accessing .rel.dyn, which would be in the REL format with no explicit
> addend.
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  firmware/fw_base.S   | 4 ++--
>  firmware/fw_base.ldS | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
