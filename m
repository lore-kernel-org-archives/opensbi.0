Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0901ED3900B
	for <opensbi@archiver.kernel.org>; Wed, 14 Jan 2026 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=326+TrKdoPnPiuwX1if45FBXlhCBQ/wEyxmIb4PyLUQ=; b=kGGTtciLenf2Jc
	gTsNh3BuAG1ExPnxRRVeouvq9sSaLXu+t1gpmieuUPQ6CCQr8BAj+gvTCPKxPmmWNX8BWcDbh5OaX
	W7RwBFyrimvOE/Pb3H9ZSY2vbk+4+8WLUXCNHmlJ8QdWFTvVJTH1r8FuWJ1lmepaC6K4W7fVib5mh
	IeyC27k2tOSv+N05HYbldo5hpIt7iklyLxS2DXpyoobRvWMs7W4IJp0FBVde6eS9LPBLiVNBBsgpS
	YVW+5D61mrz9UpSGApe7hegA34QQ/t3KtMWK7vBduiDU0SbzSSPAKq7Wwsng7CuJLqCn4+goHKsX7
	EhzAWC0Y49QR9+K7fmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6E8-0000000AQjg-2U0x;
	Wed, 14 Jan 2026 19:08:20 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6E6-0000000AQj2-2wq3
	for opensbi@lists.infradead.org;
	Wed, 14 Jan 2026 19:08:19 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7cfd48df0afso98613a34.1
        for <opensbi@lists.infradead.org>; Wed, 14 Jan 2026 11:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1768417697; x=1769022497; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bsqm5zegRaVUwQ289hjlLejWtn1SHNO8wk5to8ptJjE=;
        b=R38f/1SF5gDZtf+TDiDJ8+1F1M1+t35psWsCrsED72Rmry8oSya+vdIE0IamU8NZkH
         65zcO+Cr7qDBkNFPruNp4FoeiPS5nRPk9ICuQN2r+lGfhGNiG55kBzr+6Mjbzedq59si
         CjXBMytC49tgSY4JpUczHQGueXdhc8VJcgBGkQqnzKfOTfpFvRHmjynrDAJDhQ40bWOu
         uOueSnRWQ1rs3Zo1nO+oFGVucpzxiocowZoICXEeC3zNJ5bRtZDZuVCtHWlWj1uRr9kG
         esGg1OzTzCTQvUvqHqaXgED6rG6MbaC+uw//raGtK9JUAui+MLtiBwhgZfv2UU2Q+7mE
         VAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768417697; x=1769022497;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsqm5zegRaVUwQ289hjlLejWtn1SHNO8wk5to8ptJjE=;
        b=KemsDpry9iHh/NXSqpEUQiil0q5ksOsFkHNgAJJjUX43uM4xndGKbfNNY1NQlOZUGv
         pVPqGXxPCcyzMc2vcYWn+c6PRUl2cNB0rz2TTmk/YcmgdKCY8D4NZ71SwKlGqVMn2AMu
         yahZ/rKhxrvQELYY68OdAtv3HGlfylMv7RKnNy7IiG4MFaA53GUsms73rS9YR9AS5gZW
         Nc9EAJ7WoA+9i8d0GkPCJ8rVJ41NTI64cSehnHds2bq5sr5Sg2zhUdw1U10n4adKmsRr
         b7biGisJC93q8jCrWqC41ijZ1QniXUMg5BHVMir4weWR5uxixgrdLZVFOBiJBksbWXRZ
         qntQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi3p0tg5gHe008UGnFVQWxlbfUGGurKT97xrnv4ok1L/ds0hiakKvGeSRp+miNpxyM9z/HeS55@lists.infradead.org
X-Gm-Message-State: AOJu0YyWo/hdO/e0AyaUlQsKSnHJByC4Rx1lHxjM0PknDtA73eYJ1mU5
	fjLAlqqMrWtS7ruuA5P9+W6Ycc6Vj4kjop2jsQTGED8kHAGKAO+oJB+F8MNuq7mZpcOKkd8jDXw
	xyj7/
X-Gm-Gg: AY/fxX4I6FhoF9HclMu3e7TNKlQG5u0LHyA9epAapxX6BP21L7vA96RfCiNvmrxRygf
	lScAQqvTXq+Jq2rcv3eoYFTgcgpGXXUGwPf0cteBq24sV+dX1rOj5OvB3gI3IXu6GGHhhYgcif+
	PtIFQ8DL9TwVQjP467Hfe6nVJkbAHTUr/uRP8yQI5VhB/eB3uDdUdIlzt3iTSQi6IDqeofEaonk
	WNFDhTzyCeIYMQ3hdLb1hwbzLC9ROJT4UyGPkt/Jc7wF34NEUqhStkaI0cS56YyvyRiKCObC2v+
	U8evs5bUWvB3VeIkMZHo4vzabfSTzx+TRtDJCWJBQNjlNnS2AMnmHR3mYctW+fEmHdizXD46rS/
	6H7DC1+vBUVqIYHTLOVa0ocCse6vg0utCHYSF0FpKqoQoW8PLqB6MhHb1H3Ot9pmLAkBK5pHoiZ
	nx/dPFI60pd/26K5kunh03VmzOoHkZ
X-Received: by 2002:a05:6830:4412:b0:7cf:d472:e576 with SMTP id 46e09a7af769-7cfd472eb21mr290846a34.21.1768417696845;
        Wed, 14 Jan 2026 11:08:16 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af813sm18794309a34.19.2026.01.14.11.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 11:08:16 -0800 (PST)
Message-ID: <f7f86129-0118-4eaf-8699-69bd4398a0bb@sifive.com>
Date: Wed, 14 Jan 2026 13:08:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: sbi: KASan implementation for OpenSBI
To: Marcos Oduardo <marcos.oduardo@gmail.com>, opensbi@lists.infradead.org
References: <20260114184316.45312-1-marcos.oduardo@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260114184316.45312-1-marcos.oduardo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_110818_787071_50949337 
X-CRM114-Status: GOOD (  30.62  )
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

Hi Marcos,

On 2026-01-14 12:43 PM, Marcos Oduardo wrote:
> From: marcos <marcos.oduardo@gmail.com>
> 
> KASan (Kernel Address Sanitizer) is a tool implemented using compiler
> instrumentation at runtime that allows checking for memory management
> bugs such as heap OOB access, stack overflow or global OOB write.
> Compiling and testing the OpenSBI firmware against KASan will print a
> message in the console highlighting the memory access that caused the
> bug and its address.
> 
> Support for this implementation involves two main components:
> 1. The KASan implementation hooks: Custom malloc, memset, memcpy to
>    check for bugs and the handlers when finding a bug.
> 2. A test suite to verify correct operation at runtime.
> 
> KASan needs to keep a copy of the sanitized memory region. This copy is
> named shadowmap, and each byte of this map corresponds to 8 bytes of
> real memory. KASan keeps a record of the state of each address and
> checks each memory access performed by OpenSBI.
> 
> In addition, this patch increases FW_PAYLOAD_OFFSET to accommodate the
> memory overhead when both KASan and UBSan are enabled simultaneously,
> ensuring that the OpenSBI binary fits within the limits.
> 
> Users may compile OpenSBI with the KASan instrumentation by adding the
> flag ENABLEKASAN=y to the make command. To compile with the tests, add
> the flag ENABLEKASANTESTS=y.
> 
> Note that the implementation of KASan adds a certain overhead caused by
> the checks performed at runtime and the shadowmap loaded in memory;
> therefore, it is only expected to be used in development builds, never
> in production. If ENABLEKASAN is not set, tests won't be compiled even
> if the ENABLEKASANTESTS flag is enabled.
> 
> Signed-off-by: Marcos Oduardo <marcos.oduardo@gmail.com>
> ---
>  Makefile                     |  32 ++++
>  firmware/fw_base.S           |   4 +-
>  firmware/fw_base.ldS         |   9 +-
>  include/sbi/sbi_heap.h       |  22 ++-
>  include/sbi/sbi_kasan.h      |  35 ++++
>  include/sbi/sbi_kasan_test.h |  24 +++
>  include/sbi/sbi_string.h     |  13 +-
>  include/sbi/sbi_types.h      |   1 +
>  lib/sbi/objects.mk           |   3 +
>  lib/sbi/sbi_heap.c           |   5 +-
>  lib/sbi/sbi_init.c           |  19 ++
>  lib/sbi/sbi_kasan.c          | 343 +++++++++++++++++++++++++++++++++++
>  lib/sbi/sbi_kasan_test.c     |  60 ++++++
>  lib/sbi/sbi_string.c         |  55 +++++-
>  platform/generic/objects.mk  |   5 +-
>  15 files changed, 616 insertions(+), 14 deletions(-)
>  create mode 100644 include/sbi/sbi_kasan.h
>  create mode 100644 include/sbi/sbi_kasan_test.h
>  create mode 100644 lib/sbi/sbi_kasan.c
>  create mode 100644 lib/sbi/sbi_kasan_test.c
...
> diff --git a/include/sbi/sbi_kasan.h b/include/sbi/sbi_kasan.h
> new file mode 100644
> index 00000000..2a3c027a
> --- /dev/null
> +++ b/include/sbi/sbi_kasan.h
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright 2024 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */

This looks like it would be a very useful feature, but you have added several
files under a license that is not compatible with the remainder of the OpenSBI
project, which uses the BSD-2-Clause license. I don't think this patch can be
reviewed in its current state.

Regards,
Samuel


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
