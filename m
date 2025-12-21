Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D71BD68BD5
	for <opensbi@archiver.kernel.org>; Sun, 21 Dec 2025 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Lwnhxc+7Ulch6xnT/tckGnjGbUVuXDQFqcuZKW8/1o=; b=Sqbu5KFrcvoeNf
	x2/i23iHYUodgIZZHC1jJtfrENgmY/0ADmXacYgFZl7Cv2j0orNqdtn8PCSo1Msj2eBuLsLjtDK+/
	jXhlyO9De+LPDgJyO76BA1YseyiaKGOIyUDGjJjtGD3RNAXXWLNLv4YWYBsmz3saFO4pRLisGWAZQ
	bL5sgCJgrdaXz7RibFCJyU6yF0I2yvzM8VXA5GUWNBzIcjUzHs600JrDCs6gLgocpwFHb/NU6BAD3
	zfELo5wmsQK7LAV30cdS3BpvKIG8CB6hQnEpc+jIAB6Zi7W8B6c1pVXaeXO0bqvn4+sID7K1yWd3K
	i6+v4hdVRE+/+twa7nLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDHa-0000000CBrZ-0wRe;
	Sun, 21 Dec 2025 06:51:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDHX-0000000CBr7-1SIr
	for opensbi@lists.infradead.org;
	Sun, 21 Dec 2025 06:51:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso2052493a91.1
        for <opensbi@lists.infradead.org>; Sat, 20 Dec 2025 22:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766299864; x=1766904664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x3anu2DJxCxslJE8rSdk3/kSzVX7lDJLxUOWrNwrQdw=;
        b=PvteYqqwvImBMYCjUpeaSNVgdsw5oTV7tWKe/QUtl5hFJD9/MD9xsAav30Na93O0zJ
         DquiYizh6oPOg3d7lpKZh3Sbz+4lcxPJzJ15+N6NylZqcspIjNrMQeoGvka9Kkuc4+qB
         xuE+eCX/4zgKwlpyPMEGyAMLC8cHY28PrDwwNxN8qWhF0vE6zlpwbUsneDshTU/bLQEy
         qL7ctYbHDh3XoikL/xErCpFREQRT76YGk+HVnSZ6rdXGRESm47dQD98f8HMMreD6vQ8G
         n6W1xHPdHAnhbEAlsPVcAqLY6bLwzSCiXdZiiFdqz41Nsw8L4xtKPjfM4pgKv/80RfHc
         xTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766299864; x=1766904664;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3anu2DJxCxslJE8rSdk3/kSzVX7lDJLxUOWrNwrQdw=;
        b=eV85bT2zKn70pCl9NuXcf1gmvHk/HNfnlyEgWzgVksI5mvocWzUcC+xuqMfS5y7j9q
         gzBtHhYIaZLFQneU7C0hEo7d/hCebRVbKrk66rzSfv+EzK2sKBz3jFMHWy92Z0f/8iDc
         +AuUa7MTne9MGkiqiicBBdLvgvCo4Ywi81lck3N5ZG7yK+7XTtTGeMISTyAN+d1xHzGc
         7kmppPkWCbITZF+5d4dUm6CgbZzB5T6EhrdHQi5eyFksfrvgErL22GqaYMU/eLXSUB4R
         EzaQr1YJd0sf3El6cgW24oiF+iHJrDVmlLONbORwjWqUibhuycYuEOWZxGp/sdsWlzrD
         /RzA==
X-Gm-Message-State: AOJu0Yz+kio275PEx5VUjuD9bxWhwtdBrARiHn5fRWGwjZSJ6CqsaRaH
	VSzqsLM8M9AJTnatLeJ9UDmUMz2FWeTrZj23oKh3rsDf+7jOLPvuq6f0nI7JBw==
X-Gm-Gg: AY/fxX6dZGObNto3jFA7f6HKnXzHedSCLC24FXyE3rWt6yIRce+nHSnhdBYoYm/jSuE
	i5vrCsrCM1BtSBp0laGZz1rKsYhQKDJFV9UnDD33j4BSoHaLXaKZcOnrVrnmT1tT9/vDHpUyM6L
	ce2yyLvKjn70X/uEHre2OOMGyW2dmIMQwm7mFtStcixOlUPMrRRGjOTleyKrjUJCZaB8BlomZnH
	KrZUrsq3LPdJSp2LQTtLs4mZoXCTyn8g15PCu3v/OyUkAVLxemL0Ep/bKApXuZAAPBw5mb82V4X
	w9Tyx/Z8vaIhZ1o+oZeZ8Sy837Er6TfTcA/JHzKxxGS7VoTy9gW9ZCCYarj+VOA6jB3hw13J7q3
	o88E2we2WZDxPcPqHAihHl0vBZL+b5FIkg/E9ocLLs+xuB819FIP01c3O/xwPaCgXwzNXD81Zzc
	WNwSNVXfaP4S7N
X-Google-Smtp-Source: AGHT+IE5eMQd8ieJCaFw+KqHxr6ft/0MYpw1OGA+Zn0ljd2PnJKBmBT/CoZ/2ooUy6rNMNyIu+L4+w==
X-Received: by 2002:a17:90a:d00c:b0:34a:c671:50df with SMTP id 98e67ed59e1d1-34e71e60b02mr9747078a91.17.1766299863617;
        Sat, 20 Dec 2025 22:51:03 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm9599466a91.0.2025.12.20.22.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Dec 2025 22:51:02 -0800 (PST)
Message-ID: <151b04b0-034b-4deb-a7ac-277aa9add673@gmail.com>
Date: Sat, 20 Dec 2025 22:49:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] platform: generic: eswin: Add shutdown/reboot
 support for Hifive Premier P550
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 gaohan@iscas.ac.cn, samuel@sholland.org, wangxiang@iscas.ac.cn
References: <20251218104243.562667-1-ganboing@gmail.com>
 <20251218104243.562667-8-ganboing@gmail.com>
Content-Language: en-US
In-Reply-To: <20251218104243.562667-8-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_225107_436935_AD6D2FBC 
X-CRM114-Status: GOOD (  13.67  )
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

I just found I made a typo.

On 12/18/25 02:42, Bo Gan wrote:
> Hifive Premier P550[1] is a Mini-DTX form factor board with EIC7700X.
> It has a STM32F407VET6 onboard MCU acting as the BMC, controlling
> ATX power on/off while providing remote management features. The
> EIC7700X SoC/SoM communicates with the BMC via UART2, using ESWIN's
> protocol. The messages transmitted are fixed sizes (267 bytes), and
> depending on the type, can be directional or bi-directional. The
> shutdown and cold reboot requests are directional messages from SoC
> to BMC (NOTIFY type) with CMD_POWER_OFF or CMD_RESTART. The payload
> of shutdown/cold reboot requests should be empty and are ignored by
> the BMC at the moment. A HFP (Hifive Premier) specific reset device
> is registered in addition to the SoC reset device. For shutdown and
> cold reboot, the board-level reset takes precedence.
> 
> The definitions of the SoC <-> BMC message protocol is taken from
> ESWIN's repo [2]. The only file used from that repo is `hf_common.h`
> It's disjunctively dual licensed as (GPL-2.0-only OR BSD-2-Clause),
> hence, compatible with the license of OpenSBI. It's heavily modified
> and renamed as platform/generic/include/eswin/hfp.h. The author and
> copyright in the original file are retained.
> 
> Validated shutdown/core reboot working on Hifive Premier P550.

core reboot -> cold reboot.

@Anup Would you mind help me fix it when merging? Or I'll fix it in v7
and later if there's any comment I need to address. Thanks!

Bo

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
