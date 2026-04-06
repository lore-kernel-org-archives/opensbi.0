Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978B6FB5173
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 22:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqrCD4D2iMgeyW+wAObUbO/GvPmGLI9rOh7R+z4xAuQ=; b=HcS7IIZyuzppaF
	Oyqm/oTiJahCCmwtjPpi6FjKQPonsBPnNTzylHni4nW2QsJ1pU2fsy++KQzXksbZ/c0SV/fLxLRBl
	ikJmKz+1yTVZuR91gRpHoZsuC3iisH8fqFlDbcOnwm/Y0InpynuK+YCn/DgFHgNfH2jItjCMoGZm+
	nsbPyKDOhVxBu2rL8C70vcrHAt0ZDVifm5mWt3kSm6TvJtP+js8SdfJ7Q77dHty9T58fjTrCixlh/
	h3ixhYf8blD9mkhUJAMkxM4ihPat8sZkjXicB79Jnfliklo5svSmI7egirAoGM0o3DkpyQJroWQhR
	TAtcnvF4SN6SnFWGQfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sW1-00000005a2r-2Twh;
	Mon, 06 Apr 2026 22:33:53 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sVy-00000005a2T-1sGD
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 22:33:51 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-41c420d1460so1329317fac.3
        for <opensbi@lists.infradead.org>; Mon, 06 Apr 2026 15:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775514828; x=1776119628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJfrxYnQsWRiWbD4Ri11hRU49ggsndP7S0B+RQp7nhU=;
        b=ZuI2bnTJJTeU0PqOUCJnOsSumZuPrcfzvcNMmR5C8yHj+p7cCz4OoUDWDItrmhpBB4
         WpeJJ1hdUUzJR3zJCujWpE05z1AorVBQyuG6reFJIGimOUnsIJmP6RGTtN9Ym6Pof/Ja
         nVAnnvTnUZK+h8mUnOoS7dYROM0YklCcqgWohZOAg84977+foF07pjWNKg385/nahsCE
         e0Rji/mCJkWokVlh9qbCO7BYM1mJnfQLUXgq39yKl64HVRz5G+k7LW1LVnRssIK3iy2O
         N8SZZJ+mHnlGC+rDV1ZhdaBPyHTC5Yo7K4pumGFCsteDdAIWQULZmTTeOHPLxps2X6tt
         xpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775514828; x=1776119628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJfrxYnQsWRiWbD4Ri11hRU49ggsndP7S0B+RQp7nhU=;
        b=MAhzgP/kHArf0Sj/EaYyPSu5heIlm5Sb6Qd5KBB9Nl69AFV6suYVCpkODeJhvljdwr
         VRIgQ+YfRg/TOsppoTyDyw3NM3vhKRV7xYvHSqHJ/ehaZnNrreW8r+e9wXQ+0p2UxbDW
         KsIUU71DDgD6Vbwouj8R8vCQNHXa9cE2ceYjNGmcMOcpqvskAHg+JEuD0Zczz10ph3cz
         breesX88pjGp5kdy8QMBFFicEKmHzC+3LRTJZ072FUnoFvHP2So74ijaO1hotbyjZ/WN
         lzs6L71MI1cS9qg0OeuyNXe6zmJoxEjpJK5xiBya76btW51A2fjkG0cNbWscTr8WfO+G
         CpAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcFkIMuLjZsRH4RNXQfOc6buZPZjWbCkOmNgoeyPrTUPS6ZXoE4ox4vREa9kbZVYQdp0QO82jg@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDVR9DgDBUGk9rb1NKE4GkCrLPDEMCm7Z52bSH2tO7DxN+aLp
	NOLrh1/DAtd+wXKZQ3alp52CI6aAkHm1FpnmTjUIDpo1Y+JaWdptdv5NeaSn+7s38ew=
X-Gm-Gg: AeBDiev8vD46dg/Y9aV9pmTqULWo2Ncu1Q2XGtETE1TS6x6ZfvEhyc+SaR2MYegI2e7
	WJi2O/nRIXAjcv3fsFOkATboud5rA1PnUldf2RwDO/D6lO5uxKczNlJQDwl8dhtJtonetIsyXVN
	Va3wZmT8M9B1tBvaN0CHoNfmxrj+iDQ4PxlRMTnhT7CLWL98uSxNCTOanj+HuATRctE6INPLkgA
	CMjUt7eVbZc8TGNdn/N5kf9A1wwD3OZ/zVfGZ0STfgBmW1xTCrqyPDq8IxSPTVGD6Mw+u/NDThd
	ClNfELlUq3wzgylEwW/jRFbuc5bdL7DEqIHq875NGVcnzlKoxe06iw8dUqfwibbPZ1bG3Prjf/5
	KLyTEb9u4uQKT5KwjV6GJmXZibeqK4O370zXdGc18bdo1j9cnZK/W65NKuKanxmCROW9IXwhSOO
	l3WYCxoynt1OVXTFzuIoQ5fQdyKFtB7wk+DyPKo6tS
X-Received: by 2002:a05:6870:8274:b0:41c:4423:5f0 with SMTP id 586e51a60fabf-4230fd66454mr8857331fac.14.1775514828511;
        Mon, 06 Apr 2026 15:33:48 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42344076923sm6181655fac.13.2026.04.06.15.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 15:33:48 -0700 (PDT)
Message-ID: <3f13a0c7-f3ad-4c4e-8209-abc205326ae1@sifive.com>
Date: Mon, 6 Apr 2026 17:33:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching
 support
To: dave.patel@riscstar.com
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 opensbi@lists.infradead.org, radim.krcmar@oss.qualcomm.com
References: <20260406193133.658066-1-dave.patel@riscstar.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260406193133.658066-1-dave.patel@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_153350_499545_E0C63943 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Dave,

On 2026-04-06 2:31 PM, dave.patel@riscstar.com wrote:
> 
> Hi Radim, Samuel,
>                 Thank you for taking out time and reviewing the patches,
> has been some insightful comment and appreciate your inputs and feedback.
> 
> I have covered all your comments, please can you have a look and let me know.

You need to include a changelog in your cover letter when sending a new version
of a patch series, describing the changes you made to each patch. You can't
expect reviewers to go back and find your previous series and diff them to find
out what you changed.

Regards,
Samuel

> I have tested this across the 2 s-mode domains doing context switch and both
> floating point and vector retains the values across the context.
> 
> Thanks and Regards,
> Dave
> 
> Signed-off-by: Dave Patel <dave.patel@riscstar.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
