Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545E8CF64AB
	for <opensbi@archiver.kernel.org>; Thu, 20 Nov 2025 09:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xy/Xf+iLi3GSJGTJC54g2YHzGa+hQP1CAwY0ZQSm3rg=; b=2oFnQK2nTcxNnw
	wZO2p4GhnnReM3UA6ZLAYlrSGGTvfT6dXAmOqeuY2GqUszY78WJf6zgoqrKto+zAIraHu6h9Q/0+P
	vNtEJQKuEhniQU/36YfqmfuHfKsVhfj+bQCJ0+sPHXtN6V+s/SlfA6deYltIo+IXGwZ0WtigtqHGf
	q6A3MoHZWTpV6XgQldwyZMp9XISOYk6g39F2NKcdlfhChQI5dSD0tsirBXtMfOo0+9Qf017eE7H2Y
	ImH+Z1VxcenHKuEPo4NtXBeKYnsbfMrgPJjJ1en5JmY4HLjVS93k+eYBzWcYLVycC+h80OwNSL3BC
	DyIIJcyLjM+WJDpKnGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1AT-00000006RYR-24yz;
	Thu, 20 Nov 2025 09:41:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1AR-00000006RX1-03OH
	for opensbi@lists.infradead.org;
	Thu, 20 Nov 2025 09:41:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29555b384acso8258025ad.1
        for <opensbi@lists.infradead.org>; Thu, 20 Nov 2025 01:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763631690; x=1764236490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1Xjw88E9tjfnBGjliI4ZSMOgZLbA7PyMV2EveSxoxY=;
        b=K7aUR1EZKZ/2XXoyzkg25RhznWuTxGVrdtdys7zqCr6+0SdZwyocqwV8SbU8KXDzoB
         V5C77H/OVaGecyw3X1tfhdPxQuhmxwTzGu+IKV+LpGxze3K8VBsXddUjjhqa+7UOu/gt
         ZxoyvoN7SbClSFPf/NSERpa4JkJe+t5LW3b1eGMfPdc7vjdShf4ahSd+Px4mccq1yi0H
         oTxp8G0pa21WB1GQFP82oBlHMZvIXIMginWIKYHv/xiOFdzhzw/Op7d4qte5rgo5l8cJ
         8vvwYeD8D6X3QamXT8uJOB4yM1YTKT8YzghnhLSfRfBnJNmuci4Ia3hKWMtdj61wCRlr
         LMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631690; x=1764236490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1Xjw88E9tjfnBGjliI4ZSMOgZLbA7PyMV2EveSxoxY=;
        b=qpJcD/zoQtWXXBvO8QbtLy2YKfT9F9boGgR45gPuXWX800RrsBu3UIKBALcSegxdwH
         4HHZIJMcyTZtER+LUoI04loi+tB92b0XPD7B8Xd3xCtodoyFSU8Gd/G2OPkxWQ83oZjT
         MfdzQeCRZFHdgVe5hMgM+PTrVuf0i5WavslxpbmXfBB5qCY+xOGcwaukKTzu9QlRlLyS
         iUBq9l3EzGNf9HOTiEqqkX33+GdDpKZMIBEuddp1KhtQXrhFJ5An18hXwmxRf7KMwWAj
         F22YQa3+sxejI1AAdmsBoFI4Uma9cLtqeRiEOxYQxkQTmAxJ8jvgyTlf1blLvzs8wM//
         lLMA==
X-Forwarded-Encrypted: i=1; AJvYcCVv37dP63JCuTtHtMtNWDkHoCQ0jxKYSTSqVSxNoqa70/LaZWE4Jc/SBrCT7Dl/bge6fM7bdc8k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5sAEx/A8iNOcw+NTWHfn/9B1OE0IxobnTpjT5OgW3nMJx4sEm
	fDwc7Sc7/uzPai92vqc3+2hwkmiQOUqPj088RSfTC3ctulGk08A9tscz
X-Gm-Gg: ASbGncsCnCvwd9+0IdGJ7ng08hgwCHiEwjlIE3gs56bDj/wXfcEvuK1LUISi7zSJD+y
	DHAZY7/cQxytBNkf8lNehL1OSdO8U5rdSCsM5mbcpuLNk1GgeJQBhDouQ9fnhNsDs8xyKSknf4J
	84moPu711YnFur9IwI1XD9KcedbHDDeoDqLw7MWIsSuJDm0/Nnhia8UMY9ckyzZVN7TRRpLPdeg
	xnuEqr549m0R7wZ8xa13z+SxP6QUCN/51Snh5Dm4N/88S0OFpxuTg+0eci4OoqwCHYtzH8yKsPt
	oE97lMOafqcGeEOMGaH4XFc57Ppi5SEgZ7DA6PhB5Ue4OJkkIhoyQTjTzAz1ZbqA/gNBB5Ghdl/
	agNoDrkJaYUVk+4AZfqYoFUV3m7+2W10ov0nD+wzWjfthoSb3W4nC16hVjiY8pNLSpbXcVqPpoz
	Jayd0i/3xKtWzU
X-Google-Smtp-Source: AGHT+IGZ+wKapJyguEqJAWE5n8QaqX085lP49VwkchdT1k+VVvKIuC6eO7cIq6ditFVZnjiC8isYBw==
X-Received: by 2002:a17:903:388d:b0:297:db6a:a82f with SMTP id d9443c01a7336-29b5b080db8mr32953525ad.24.1763631690110;
        Thu, 20 Nov 2025 01:41:30 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25df75sm20895045ad.65.2025.11.20.01.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:41:29 -0800 (PST)
Message-ID: <7d765af5-3b3b-480f-9cdb-57eadb322bfd@gmail.com>
Date: Thu, 20 Nov 2025 01:39:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Initial ESWIN/EIC7700 support
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
 linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 gaohan@iscas.ac.cn, samuel@sholland.org, wangxiang@iscas.ac.cn
References: <20251117054846.1335-1-ganboing@gmail.com>
 <CAAhSdy0Epa0RhOn5Cvjxnzd-XAdxHi1PEJPmj++Sm_GqbgVf-A@mail.gmail.com>
 <6d2f3906-5c9d-4ce2-b222-44b05071b9ec@gmail.com>
 <CAAhSdy0gmOtDDbNc0wE0iAaGz33a1Q+75OMrWAuKYybToPnhkw@mail.gmail.com>
 <8c3bd968-9d01-4748-85bc-8e25fb105e93@gmail.com>
 <CAK9=C2VVBZDO6u6GEebwgKfugZ9kG6Pw4LAehyRMXuWB4PUm3A@mail.gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <CAK9=C2VVBZDO6u6GEebwgKfugZ9kG6Pw4LAehyRMXuWB4PUm3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_014131_061729_7A1DC45B 
X-CRM114-Status: UNSURE (   4.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi Anup,

Actually I managed to do a tdomain/udomain like setup on die 0. There's
a free PMP entry there. I've also simplified the PMP consolidation logic
and refactored the comments to make it more readable. Please see v3.

Thanks!
Bo

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
