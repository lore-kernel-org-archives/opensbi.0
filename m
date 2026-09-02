Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B45C61DFD
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fo0/XIvsrYJUbamagX7DI7KdZK8vPXenmYw+fNNfDo=; b=2ihzksI9NocFDE
	WAgBsMVJPTGs+fvVikM6jeMkCL+/JQMXuwCtv5pb+xHZ7iRrtXFl61T93E266QUMRUkFK5/YT6ge9
	+X3b/W7yMT6eKIysxoS/Zuhbe+Vvv/yp1ocilrZQ7qs009jwepz9pqN3GTEF3IGGfsplGgffG0yVx
	6JMoTa2FeoPC6limvpqAb7NJQVf0/R9JWXHU3vJGxV5dKocN4n4gVuc/g+7d7L4uOeSb26aH8r+c0
	CbNDHe0MlGtB2Piy6KRBcd86Yj2xExkg0fC1HZBsudkjM79UKp2oRBWizQ5jnnjLO1hIG8yIRQAp7
	XQXNp44b81Ac+iaLoeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gXP-0000000E7gQ-0ry1;
	Wed, 02 Sep 2026 08:41:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gXM-0000000E7fX-28rp
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 08:41:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1100771a91.0
        for <opensbi@lists.infradead.org>; Wed, 02 Sep 2026 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338500; x=1788943300; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgouqaWgjcUgoJXhnooGvuu+zOZM3jYr1R7HxW3CqLk=;
        b=jOBAngBqkGCD0WsVglQPjALEVhtwBHlp/TIB7zDCgNeZOWA5M/3ynFwHtniwqB9vW6
         NLEeAkiC8X80iA/A+6xuWyk9yydckU+ytFltal44HE4BmaBsXFJHi8H/Dz4RXHdCzzth
         8rfeQHpRCUb9eYMx7Lm09eFTuadH7xKcD0xYNJIqftAKmdV2dxdldlBb3C7SqWEpm6tx
         I79bjYvfUfhZYiSJv018cLyhdFf9xomevuvBXq0t9LZGDu95ILfb0Tn1/uafFSEiX3Mn
         bVWFGfyJwlT+g9yBgR/kiFrjacMSSoAi8zZ6N+IyrA/c8k15D/Vw+fbdpH6/C00b6Qer
         tP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338500; x=1788943300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgouqaWgjcUgoJXhnooGvuu+zOZM3jYr1R7HxW3CqLk=;
        b=qW8DnjWqa5euiJAkWovCxJeHGtadAz1vYsz+bYnIRWbhzWL+dGI26Oov7jQ0ZSDtBy
         satT9mVCx9zO8G524BzzVfOx0lbrYWM79cagkyDBVoye7B9378uK/dwBLk+T7YgS0ZIS
         xiJBvIAImTOl0c2Imdt8qUtoXDnKQQdPqi4b4+dIFWp5ZldP4JL0x4w31IRqGd87GoJm
         d0j64n8e576pkntr6BnXOH2umoaiO+nUFetudiPH8vGybWwuBs+pSWPrHTDY7KWspzZZ
         84Zxjv6uDpDJgdpJJXuCdTF3k7cK3u9TmB237dbrL5umoMlxb07erJMoRMeGZ1+9igKu
         dYDA==
X-Gm-Message-State: AFuF++kEfb06vEyCOKLHgzzdyLvFFIAWPQsnl1r4Dl6yNsLrt7Udm4Gh
	2F85l8bgoB3xEWfNDo94K1gas4mzugQTX7nW+7lagU/HjexVqDyNFq34
X-Gm-Gg: AYBFou0msvwA4sJ8wb79OYBLuOsx1Yy09KfWG5SZaTakQcHJja931hos9qYZ3b6X5L/
	/bsZAYwhyyQQD8Z2KvYEEaYFFjZc+2jlkw4eiAqt5Z4UiqOZG9sy+eGbnD6CjTEzP75E87oigtL
	kbX9Be5vWvNZpR2LKWe/Z/077BDrfpR5xa+mRCcCggFX43b/sie9tymLXaEWL4JXyjF64J6vwuB
	zrauNMS961kkVi8yuVqa2urr1nCCibzB8ObjJSYHk/tM1sVb+rmG2oHISJ9Xnz1YeW+Vm1epRt7
	NYO1vlah/mZgT+pgHDzFPVUl9MPBNZIkwujpuMza1HttSOFlv4H6Ux5oL3oUrQ7vgMBzwHsUzWA
	D0IAaOIbStrdVRKeui3hwYV095U7ByZj7w4TZ1Yx9Xh3PqLEdITBuhAC21mYWrk5uhecVtygPya
	9fqhI+k579J7Y6Iwmt5cnbHypa2+ffFZsVF4jkb9goo3RfSNqpMgYicjh6ZT0IPA==
X-Received: by 2002:a17:90b:3985:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39aee22218dmr3673942a91.21.1788338499705;
        Wed, 02 Sep 2026 01:41:39 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f2a315sm5057841a91.8.2026.09.02.01.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:41:39 -0700 (PDT)
Message-ID: <a2f37394-2cce-4168-9d84-df51aade028b@gmail.com>
Date: Wed, 2 Sep 2026 01:41:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform: generic: spacemit: k3: follow-up fixes
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu
 <xianbin.zhu@linux.spacemit.com>, Anup Patel <anup@brainfault.org>,
 Bo Gan <ganboing@gmail.com>, Samuel Holland <samuel.holland@sifive.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
 <20260831200832.404000-1-valentin.haudiquet@canonical.com>
 <DL3QRSFAH67P.3K76LXQO2VWBC@linux.spacemit.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <DL3QRSFAH67P.3K76LXQO2VWBC@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_014140_729913_31284AC4 
X-CRM114-Status: GOOD (  20.76  )
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

Hi Troy,

I missed this one earlier. So basically I need the latest upstream kernel
to be able to test this patchset, because all the rpmi backed devices in
vendor kernel device-tree just won't work. Perhaps this should be called
out in the cover letter, so I don't have to waste time debugging vendor
stuff. IMO, leaving the rpmi stuff out is the right approach for initial
work. I feel that path needs to be properly reviewed and make sure it
fully conforms to the standard.

Bo

On 8/31/26 22:48, Troy Mitchell wrote:
> On Mon, Aug 31, 2026 at 10:07 PM +0200, Valentin Haudiquet wrote:
>> I believe one of the issues is that the v3 HSM wakes A100 core 8 only
>> when Linux onlines CPU 8. The vendor kernel onlines all 16 CPUs
>> so ESOS starts and RPMI works. Mainline uses only the X100 complex
>> (harts 0-7), so CPU 8 is never onlined, core 8 is never woken,
>> ESOS never runs, and RPMI mailbox transactions time out.
>> Patch 3/3 wakes core 8 in OpenSBI pre_init so ESOS is available
>> regardless of which CPUs Linux uses.
>>
>> [...]
>>
>> I have adapted those patches from the Spacemit OpenSBI 1.6 vendor tree
>> logic, through a lot of trial and error. I'm not sure I deeply understand
>> the hardware-specific details at play, so any comments would be appreciated.
>>
>> Feel free to take this in as part of the patchseries and modify it if needed,
>> or send review comments and I can also improve them.
> 
> The original scope of this series is the K3 platform initialization and
> HSM support needed to bring up the X100 and A100 harts. It is not
> intended to reproduce the vendor SDK firmware ABI in the initial series.
> 
> In the mainline K3 DT, regulators are managed directly by Linux through
> the P1 PMIC driver. It contains no K3 RPMI regulator or power-domain
> interface, so this boot path does not depend on ESOS.
> 
> Your changes appear to additionally target compatibility with the vendor
> SDK stack. That may be useful, but it is outside the scope of this initial
> series. Support for the vendor SDK stack can be considered separately in
> the future if needed.
> 
>                                              - Troy


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
