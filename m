Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5C4C61DD6
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 05:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDHTwqsjQUN+axczU1rdS/nEMDplNLFlY32Jrr4UoQE=; b=IjP4uLJkFx9lAm
	5hrMQ3g3OHejLfAde8TvD+LkYbbWFM/rx/Yie60UL6cpvtDboqYweHquV6I8kly3mZmas5pblQb6s
	0qqKtOP1l9d9lNdPat9MrqmODtBe5XHCI+IPmkhd1+uTU3ojslaS8Y2ZOusKujS4RUGUof/2h2Td6
	1v5MAAxq+ptnsVPrlfM/mv80VhzuL32aQ7e9J3lf6JuWj6bLyYPJXBtmMKcCeHANIQUzL1VfQ35QI
	cRX0LcOps9TOfZ6ufymlfzSSBu0lULHfkQn9eyyEc1PQ5msAkm19gvxJpMByTkln0pOR7uaW9ccO0
	PXywnUeF8xFZdzEnv7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1dtO-0000000DpCB-12Gi;
	Wed, 02 Sep 2026 05:52:14 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1dtK-0000000DpBe-3iDj
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 05:52:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d8f265cbe6so5880075ad.0
        for <opensbi@lists.infradead.org>; Tue, 01 Sep 2026 22:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788328330; x=1788933130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAiP0bOCAk/2aMnJGyHUfFbxI/8mYK7DkLelqcXaTjA=;
        b=lDGAvrIzTwAsI76knMyocaBJKfPQFyaMuRutnm4lFB63q+Nji0XA4dzvdhTgvQ9oUI
         GwKVgYC4bgQeKKqIoPbo+cyVY5kA9D44f/VrtDEAN8yUOLd/xvH+fon/0uM+bTYz1bYe
         L8RbR7tSWazSkBxjaY3MN5IqiTRC94mFu0lMxqpUg2ctf2srCziGluwoUjR7V8tRzTVy
         uCYG9kqZIKcREPt8AuXQUvxUtTczQuIfY1N/WTj399prcH+7IyxpuN3O+FjzbkJK8v/F
         z/0MNYcAm3xEuIqUJmiJANVlBtx+ZYkPXa3w14sndfAx3rhunMnhynERLvmL9Xeg1hp4
         hF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328330; x=1788933130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAiP0bOCAk/2aMnJGyHUfFbxI/8mYK7DkLelqcXaTjA=;
        b=jVLJwCevqiZl2f8OMa4PK0x2Zsq9GM1roU4PIYU5P9PFSDy/PK368IyzB8FMDhByiX
         ZPEVJ83ve1xW58oayOooGzPjJg+JZ1ckiGDPIhoqDD6oQOzH4/8APyd2+DviArj62+FD
         UQDWK8g0d75eeORywXa/x8gnSkKb47PN68BvuuBwvLfDK9OSk/PDl4aeIebkJyDCcvAP
         3NeG/kT+Xox9NMmBTx/EFOK/LF6qvcAaJBbaQSSHIC43CWkfZFTRq6pMCvdNSq+bLoPs
         vPHxBfYt+NWF8h8e2Y5rotFvr8jzA6jIWVfN6sqwI6mtbqmryxXpRyrLgeMGtnw+SM+e
         Pn2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/Ud10YjAqwMVBZPwXZv5xisSQ4J2mXbiZML76KNw/YSfV8B46ArKBzJ9hXJDGFe9U6IqNWquy@lists.infradead.org
X-Gm-Message-State: AFuF++nwku7beDXop6ZpfBypXHBkzE5Vd6E41WGmzfBS6MN3PedEN7q4
	lFvlruUwDWJxjOtZ3srzyK6alDtXhWi9zvtzke94lOHT2KlCV4ezhomLA2TYwB6C
X-Gm-Gg: AR+sD105AJOirvXTnxi/95cZshVFuo74bVzYz04dneb4YB4MLm/1qetC71KHT2difce
	1pAygwegxp/9+R3xemETDIYW67ZlBvz0JhzicEAu1s2Reu7eTMKC4ptEQI7wleB5ue4awkfcEtQ
	s1DHAzUfCWleyTrLAdW7yAK6QgEbC+wZ/wW2Qq1S77cPlVnaznlG79aisqZu6b2YEIram0spZdW
	IMlEXH55TCqDo8vQuxYK3UBqYyGHzWqVeoJw0W+sTOFBNIWdNlQo2O1JrInkJ8adkcfbSyQRJn2
	Av46j1aEtmC2cW1JWHmxNAM2YqnqwCbFXMs4PbtVPR8wpwuWs/biZ3ZINMRuckrv6cjJUgCm+lj
	OrwKpoT8lp8xyEKyho8JgQQWnndXNBlmBKgkLEIQRUexVeALk/k6CxPZsdPxJsOoonIgLLxiSVz
	NZcgz2xciT3ntYk8sYe42CzFgxwlhv7zvzV/TsUNmohpzuDvun5A519mUHSyfOuA==
X-Received: by 2002:a17:903:3c0c:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2daec732a4fmr36833835ad.18.1788328329869;
        Tue, 01 Sep 2026 22:52:09 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd39e9cfsm7478185ad.34.2026.09.01.22.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:52:09 -0700 (PDT)
Message-ID: <886ec260-f4d3-43cc-8212-10828c8873ba@gmail.com>
Date: Tue, 1 Sep 2026 22:51:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] platform: generic: spacemit: add K3 platform
 support
To: Bo Gan <ganboing@gmail.com>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 opensbi@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com, xianbin.zhu@linux.spacemit.com,
 anup@brainfault.org, samuel.holland@sifive.com,
 heinrich.schuchardt@canonical.com
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
 <20260831200832.404000-1-valentin.haudiquet@canonical.com>
 <2c3672f5-dcfe-489b-be0d-5c1d2a50840c@gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <2c3672f5-dcfe-489b-be0d-5c1d2a50840c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_225210_934407_F718C769 
X-CRM114-Status: GOOD (  25.80  )
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

On 9/1/26 15:41, Bo Gan wrote:
> Hi Valentin, Troy,
> 
> AFAIK, the ESOS runs on the two RT24 cores, not the A100 cores. While
> testing v3 patchset, I also observed the rpmi-shmem-mbox@cac90c00 timeout
> xmitting messages, and I lost the rpmi backed power-regulator, which then
> caused some issues in Linux. I don't think this is caused by the A100 cores
> but I suspect this might have something to do with clocks not configured in
> vendor uboot SPL. Please check if there're other modification to vendor
> uboot that needs to be done, apart from the dts changes, in order to adapt
> to this patchset.

I found the problem myself. There're many SpacemiT hacks in the vendor tree.
E.g., https://github.com/spacemit-com/opensbi/commits/k3-br-v1.0.y/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c

Without those, ESOS/rpmi simply won't work. SpacemiT, please don't mislead
folks on this part. I was under the impression that this patch would just
work with the shipped ESOS, but it's clearly not the case.

> 
> Regarding the core/cluster HSM, can SpacemiT publish the K3 TRM, at least
> regarding this topic? As there're special power-up/down sequences that a
> core needs to follow, it's impossible for outsiders like me to review and
> verify if the sequence is correct or not. I was told there's even more
> complicated sequences when powering-down a core, if it's the last one in
> cluster to power-down (suppose that we may want to support HSM stop in the
> future).
> 
> Publishing the TRM would also clarify the mysterious Audio buffer, and PMA
> register format. What's the address of the Audio buffer, exactly? Is there
> a CSR_PMAADDR0?
> 
> Bo
> 
> On 8/31/26 13:07, Valentin Haudiquet wrote:
>> Hello,
>>
>> I have tested this patchseries on my K3 board. I had to patch U-Boot
>> SPL and EDK2 with the mentioned DTS changes.
>>
>> Afterwards, booting the upstream 7.2 kernel with Spacemit patches
>> (still in mailing list) works but the kernel hangs in initramfs.
>>
>> I had to add 3 patches to make it work properly, see the series
>> below.
>>
>> I believe one of the issues is that the v3 HSM wakes A100 core 8 only
>> when Linux onlines CPU 8. The vendor kernel onlines all 16 CPUs
>> so ESOS starts and RPMI works. Mainline uses only the X100 complex
>> (harts 0-7), so CPU 8 is never onlined, core 8 is never woken,
>> ESOS never runs, and RPMI mailbox transactions time out.
>> Patch 3/3 wakes core 8 in OpenSBI pre_init so ESOS is available
>> regardless of which CPUs Linux uses.
>>
>> For the other patches, I'm not sure why the issues are not encountered
>> with the vendor kernel.
>>
>> I have adapted those patches from the Spacemit OpenSBI 1.6 vendor tree
>> logic, through a lot of trial and error. I'm not sure I deeply understand
>> the hardware-specific details at play, so any comments would be appreciated.
>>
>> Feel free to take this in as part of the patchseries and modify it if needed,
>> or send review comments and I can also improve them.
>>
>> Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>>
> 

Bo


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
