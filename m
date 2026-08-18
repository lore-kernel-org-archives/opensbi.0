Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A91EC5B572
	for <opensbi@archiver.kernel.org>; Tue, 18 Aug 2026 02:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxbLaG1rD5kZSvT2XGVu7wrJXbwJiT/TQyv29DUQeiE=; b=420efZhMRujbiQ
	RdCNwMZkF/grSDQmKFvFl5KLWsxbKjQ/WGYivUoaBctNSkmWRH936tK8PccSo0vtjD3RfnYbsM24P
	LR1ih7q3lMmlUdRCzOTfT8t8uomOkRWWGo2UR+t598NUZ56vh2sA8VUha/sc2U/bjqnizIzrk7WdM
	SkZN9RytCpOcxaDVG2ZHOUWPWvU+OYKmrrvoOAb5hxX6SlFeMMHTNyJmdkBB+cR/Nk2gyQIxtacxI
	KroheD7g3gQJ83Iq9XaI4iQ4R09ox1KW1MP1cuLHlbb3dadJ5ypwzbIkzX2KZXvQpwr1UKoDelJr2
	jjfeNzeeAzGhnuIU45TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9jr-000000076gW-2ufR;
	Tue, 18 Aug 2026 02:39:43 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9jm-000000076g5-19yM
	for opensbi@lists.infradead.org;
	Tue, 18 Aug 2026 02:39:42 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dcbade417so4119989a91.1
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787020777; x=1787625577; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idyKkNR+42mo+Rjnf79cre2NT3NROoVly/vDc3aZWfY=;
        b=m1elLCX+csoIxA2UZ6Qs/YM2rfoKho8WsshfQZCTTK76q9HGIZjLJ4NKv6x3hSIAVr
         zUrDWC6Qv1bJngEvTgEPn6XanHeByGUbUgA3a0BX7oHtDqji/8+saRLnlsvB7aqFingH
         8LZTfLMDPKsQ6YpteQpyzC+1bzIyuBnb1E1Z5Keyk0/l7TL1AKCKucwNNLoMbmFXkT1q
         TBxxuYzhndSZSfktOYu0TNkY7Nct6OkVx9vCteZVL9haNQ6wKR+LeQuGlOw9srjR30zk
         UkEFlDdbUeuzObtX4MlC1YL6xEvBg21JkjWR+suVVLtmAK2NYKJlUb2bEJjGIuvjWwo8
         OHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787020777; x=1787625577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idyKkNR+42mo+Rjnf79cre2NT3NROoVly/vDc3aZWfY=;
        b=fw2QX2O4vAk7rUEpsXkt0OdCJYcGtwD3Ah6ldN7RY/2znDyyP8N+8o+ygsMcyR9jdO
         Vwh4sd/3DxlgE9jPM9IJXwqKY+C7bYuQululhgdB3/gboRAnjESxOWgg6cVAojwFOJip
         7hjeUVBIKDvlGTWfIj/VfPakPCzoUrpilqhwpK8D2v4hRjvH1ApJuK2KxzoW4StOUV02
         CfLxiW71MNxsrxdL/h209BtZKikeYdUmPWwI3CUuoi/zFyCnvj7ud0jBqWw7klN50HGq
         6ANUDGx2Jo/bm36zLhp/NDjMRQYmfdRz7tquqTbwr2o8JGJJSTv8YBlMNnyxgLxT/XE2
         wVyw==
X-Gm-Message-State: AOJu0YyGxGQtPlhZhRUwkejWbQlCh3Wmruk39PGbQk3dbxK0xwfuSD5u
	Ugr66BIZQlnVnqU6gDeAXmuQXXrurYNff6TYYPftoee0QoMRqlKXt1ustNVxcw4kqiB+KVi/ZMy
	13gPtasbx8ZXwaW10w7FIQiuKewIVuoFByhQhDO5Ok+SbeDqugjc4DK/mP0dCDHfpDhTHPV0w6s
	25k2frfhSpmjAKjOcyMuDhShx7UtZZSbfIErItx1J9mk948TzNU74=
X-Gm-Gg: AR+sD11w7trTCyVk0iETrYmmdnhQNKYsuwQ550L1NM6UVVokA0xx4/849JYbMDzpLpj
	h2sf/z8sjWAS4EvQ7h8XUJezshXvbQsLxaYbAOi+y0Vb60fQYDaE3QVWrz/tFstCMIlXv2sbffV
	T/KCvPd4DLMRWEaZRsFHWQN96rg2u+R5Dx+ATXJhzVeQ2z6zSV0sps5AvGYI6aomTXGDruyXw7v
	s3rY8xMLxWLKOK48+kS6S8chcaj6BeLgAOgZxpv64Xg7C3TIVi75NR1L8a8LC/V9zlh71QOs7HZ
	/YBASKdwH2bRhEcKSGSp0Yu3bd1WV2TGhK06tnbw0nSrDF7X4FUQotkfCx5fbzQX2RI+jx2bumj
	an3EmhDDy43lN7MOufLVdIVm8Ey34HUxT8HXuiuARdB+zYfOCKC3CieIu783lz995up+E7M8CTd
	zF4+bAJBSzjsXSZ9UXoTX80kzycCUhSrXJ1bglk3cGBLT2rmQwgjtLnIbX6+aOWfvW27xPCw==
X-Received: by 2002:a17:90b:4fce:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-3955a3dd55fmr6298253a91.1.1787020777023;
        Mon, 17 Aug 2026 19:39:37 -0700 (PDT)
Received: from plin-1878 ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb3c5sm6914137a91.9.2026.08.17.19.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:39:36 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:39:30 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com, greentime.hu@sifive.com, anup@brainfault.org,
	scott@riscstar.com, conor@kernel.org, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, robin.randhawa@sifive.com,
	samuel.holland@sifive.com, pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org
Subject: Re: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
Message-ID: <aoPF4mzra0LdDfKm@plin-1878>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
 <20260817090503.2104998-6-peter.lin@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260817090503.2104998-6-peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_193938_335127_CD803483 
X-CRM114-Status: GOOD (  16.49  )
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

On Mon, Aug 17, 2026 at 05:04:59PM +0800, Yu-Chien Peter Lin wrote:
> Register a WID-based hart protection mechanism that
> configures mlwid and mwiddeleg CSRs on domain entry.
> This enables the protection framework reconfigure WID
> isolation whenever domains are switched.
> 
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
> Changes v1 -> v2:
> - Validate WID against pmlwidlist before writing mlwid CSR (Oza)
> ---
>  include/sbi/sbi_hart_worlds.h | 24 ++++++++++++
>  lib/sbi/objects.mk            |  1 +
>  lib/sbi/sbi_hart.c            |  5 +++
>  lib/sbi/sbi_hart_worlds.c     | 72 +++++++++++++++++++++++++++++++++++
>  4 files changed, 102 insertions(+)
>  create mode 100644 include/sbi/sbi_hart_worlds.h
>  create mode 100644 lib/sbi/sbi_hart_worlds.c
> 
> diff --git a/include/sbi/sbi_hart_worlds.h b/include/sbi/sbi_hart_worlds.h
> new file mode 100644
> index 00000000..2bb35a7e
> --- /dev/null
> +++ b/include/sbi/sbi_hart_worlds.h
> @@ -0,0 +1,24 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 SiFive Inc.
> + */
> +
> +#ifndef __SBI_HART_WORLDS_H__
> +#define __SBI_HART_WORLDS_H__
> +
> +struct sbi_scratch;
> +
> +/**
> + * Initialize WID hart protection for current HART
> + *
> + * Registers the WID protection mechanism if Smwid/Smlwid
> + * extensions are present.

Only Smlwid is needed for registration. Will update comment here
in the next version.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
