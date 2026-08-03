Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBAEC55182
	for <opensbi@archiver.kernel.org>; Mon,  3 Aug 2026 23:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLneLJSp6fXKj+fyjnHIIqN0NqT2Mssh1A9P1HDG1GM=; b=tKWAk0FXkgpWEn
	1LX+fUCnaV2Z0EBhk1T1wVdZXiBh4tKkaeH/A/aGW9cXm6L0s66ZGrWrBFarBYXf45B8bYWhg8lI8
	qOsbwNwFMxSWVs97GKtctTqKDdWm/DlrSAxOPWuXQ40RPZc017UGXWu0lIicCIEZBgqlkpenVLt0C
	Xa8Q5IrkEwbOW5F5zbbTXS8ZsepuNB4miQ8cgqWtOmeUTarhKlbboKgWLuBB/7R6TaJlpVFjv0rU3
	w6KIeMnpZgBzM/xFyXPaffFwmDbiSwVFJgaOgN4GWrygx4MkRwFl8nNa7fMfdTuG/XdO2BcSrkmIA
	0cz50FdCEzvxVEcwkK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr2HQ-00000000iID-0KSt;
	Mon, 03 Aug 2026 23:41:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr2HN-00000000iHR-07Fj
	for opensbi@lists.infradead.org;
	Mon, 03 Aug 2026 23:41:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cacf197759so58210555ad.2
        for <opensbi@lists.infradead.org>; Mon, 03 Aug 2026 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785800468; x=1786405268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DModdhFI6sxBlXDTq1pQeLDOfzPvT1mKAIdhQtmHYME=;
        b=TkuB9lnfRH4vIj4BHcWrOwsJXV4Mv38WhrNZz+/xYyC/yBS/bjw7OwC3EALusEMrRO
         MBTOT/EZKCL/PHlr4yMyGA9MUq7YXwE9dO4snEa/DXd+sgXnP2NpLBquHTnJ/A9cE5xT
         x8SnOTdvNNtIHxXI4VJDJwQWkhhIQjjQ7xfwXfNTpCua4YltIfCDSAV/25ruRer0QNlf
         UiFpzpZ3rXercgV196JldcGkmufS5v2GA4vQV5cWsQ+ziUayDOgbWPAfh0puC8WlU7PR
         LuycOYxpyF4atmKEzit9VttuN+Np4Gr2bZedTFa9ekZm7fh7fPr5ykK2vS+KO9ZH9k2V
         iGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785800468; x=1786405268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DModdhFI6sxBlXDTq1pQeLDOfzPvT1mKAIdhQtmHYME=;
        b=Sk8rqhtnosbGv6DtVlx+Is0ylq+JdblbQszdMKiyR+A2FNdQ7sSs5MrjtYKov7dCtz
         wOxrDjpsJq82i3QMjwSaFXOuy5k4lz+7/AxLOkMvxEss3qa/D7XmS9m7qYjKnAHkCEEl
         8lOzzwzGnzYwFHrqUDymQ1wmnQtF3r6eu+qdqw/oFzZjHWL8zZqHg0pf0XnfhXDseywE
         afJ/y28lwfoOKaOxgbdRdrDtPb45v2nxSsWGUz4ICO4k4TeKruBb0D7MnEJM5OB3ijyO
         a9Q/2I0MOb6FGxDQGFQCRvngZBmNOR+K1fyYFqyXgJ5zAayhz7bVzz4N3tWQJKnnqlje
         BO0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrt3TxkF/4S0CgONoKSF9jS4YadMyHB0oneu88OMQkaqwDd1LM9wx/UVSVg1E05+ESM9izXaRbD@lists.infradead.org
X-Gm-Message-State: AOJu0YxYrYoB38nFcYZRUSm5i4uyAsPS6wptTXNv2iCAVAJnCkzv6IEp
	YBZzuTQuoHVXzIPvzopL+RPsEitTltcGVqY+afIe6h9MkGH297TZ82CcovBtQw==
X-Gm-Gg: AR+sD124UEHVIDpLBB/1nGS6A3RQnWz1JRP319RGY8EpDLoIgBfOzbBqB3ZgjJE/KSs
	JHrx9UpIRfcEATnZUuKSXzYVGoGvejlcvIODlsWwUTmRNxBcg7KZSVKATUUL0eVPICW1hTNQP6n
	xIOPiGcCidprsWNKoJbR8EWdTVc4iQSDTugHpxlbVBRkpe6gI9nFFQhhIA6eA3bJ242dDaNErlQ
	n9Gr0wUFief+CqfZ6OaxlUoYKZRNgModJM+TVypG4wzmjdemDaGakPAcxg2TQwcfl+xabsjlJ5U
	wSQva6JrzrIsVuYlqmyX95Nggiuu5L39M/7y6huSOifn9u2LzMNmAPVS7bGrBnWhyB2f33X0V0X
	bBsei1bEF4OravM1hr4NBmovBd7THhyYn+iMm7FG+xg5Ix0WJn3Fz/hCoLzj9glLn7Q2IPW2YpO
	tHHbjgjSjMKdNp+OFDtjS8wYHAZKzKMLjiIyjR92ZsD38T3eSu7eHH96TiGzkJvY9hfBVPSfCh
X-Received: by 2002:a17:902:ebc2:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d0521a56ecmr124947845ad.10.1785800467777;
        Mon, 03 Aug 2026 16:41:07 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae68cf7sm43967685ad.31.2026.08.03.16.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 16:41:07 -0700 (PDT)
Message-ID: <b60701d7-9b64-4f17-8972-b818318a20f9@gmail.com>
Date: Mon, 3 Aug 2026 16:38:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform: generic: spacemit: add K3 platform support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
 Anup Patel <anup@brainfault.org>
References: <20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260724-spacemit-k3-v1-0-f0e49329feb8@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_164109_073733_38EA2241 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi Spacemit folks,

Please also add instructions on how to test your series. How should we
rebuild a u-boot/opensbi image and how to flash it or boot from UART...

On 7/24/26 02:27, Troy Mitchell wrote:
> Add initial OpenSBI platform support for the SpacemiT K3 SoC. K3 has
> 16 harts split across four clusters: eight X100 harts in C0/C1 and
> eight A100 harts in C2/C3.
> 
> The first patch corrects a misleading K1 cache-operation name without
> changing its encoded value or behavior.
> 
> The second patch refactors the existing K1 support by moving the
> definitions and CCI-550 programming helper needed by both SoCs into
> common SpacemiT files. The K1 CCI topology, boot flow, and HSM
> implementation remain K1-specific.
> 
> The third patch adds the K3 platform implementation. During cold boot,
> the boot hart configures the cluster warm-boot vectors, enables CCI
> snoop and DVM requests, disables core and cluster power-down on WFI,
> and wakes the secondary harts. Per-hart initialization configures PMA
> attributes, caches, L1 D-cache snooping, prefetch, and the H extension
> on X100 harts.
> 
> The series has been build-tested with:
>   - the generic default configuration
>   - a K1-only configuration with the SpacemiT HSM driver
>   - a K3-only configuration without the K1 HSM driver
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Xianbin Zhu (3):
>        platform: generic: spacemit: k1: rename cache flush operation
>        platform: generic: spacemit: k1: refactor platform support
>        platform: generic: spacemit: k3: add platform support
> 
>   lib/utils/hsm/fdt_hsm_spacemit.c             |   7 +-
>   platform/generic/Kconfig                     |   9 +
>   platform/generic/configs/defconfig           |   1 +
>   platform/generic/include/spacemit/common.h   |  88 +++++++++
>   platform/generic/include/spacemit/k1.h       |  96 ++--------
>   platform/generic/include/spacemit/k3.h       | 144 +++++++++++++++
>   platform/generic/include/spacemit/k3_asm.h   |  16 ++
>   platform/generic/include/spacemit/spacemit.h |  14 ++
>   platform/generic/spacemit/k1.c               |  33 +---
>   platform/generic/spacemit/k3.c               | 264 +++++++++++++++++++++++++++
>   platform/generic/spacemit/k3_asm.S           |  33 ++++
>   platform/generic/spacemit/objects.mk         |   3 +
>   platform/generic/spacemit/spacemit.c         |  36 ++++
>   13 files changed, 636 insertions(+), 108 deletions(-)
> ---
> base-commit: c0f87f10d1bfb9e72a84ddfafb5604ee1bfe9d04
> change-id: 20260723-spacemit-k3-84720a7be53d
> 
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> 

Bo

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
