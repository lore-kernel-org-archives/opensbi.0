Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B235AC61DD3
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dT3p0/7CrOIzkO6YfFclVxBmpm1TqEbCUBZhx38GhoQ=; b=3JgaNCqZBApuBK
	5JL3kVqcD/TRYBa1c9Mle/0Bq2iOMKwctygdRWtt8SXrixSTye+qSLv5vxX2UQ5mjLO5GNosyQslQ
	pGkzNDW/ahObUA7MPD64HnuF/zJDOHaWduuny/TnbG5CjeCqCc2zifaMV5ff/oJTEUpuujsa4wM++
	iwEYmYZE8DtO9QaYDYgMeEiVflHVK/X7nPL+fa+nSttQsXTU1A/OXJ9Lbwo2925jFzgGFuKw9gXR0
	xH/E+fv7H/sYngR6KgfG9tVyk8Qwyiwi6y6eThqHbCQjYxET7rbkoUOLVqs2g5MbY8bEtWIQ6lrit
	5ah0wiXTxvVvEdepDKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1X3t-0000000DUu8-1Mxj;
	Tue, 01 Sep 2026 22:34:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1X3q-0000000DUth-3Z6S
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 22:34:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ceab75934dso3918215ad.2
        for <opensbi@lists.infradead.org>; Tue, 01 Sep 2026 15:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788302074; x=1788906874; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SZ8bLk6CvddV2DoaUudub3VpzLWfb6w1zc1ORXdlag=;
        b=tGHRJZTtlynQugcdoTSVabiRO3nqTmUdJbggr5dbYI9OcMKPFtFJZyv3lOrTLV7k90
         lrhLlhqJopVftM/eQffoBG6Xu9korMsvOMBmpVkCKnfpr8LDurHejJBanl5dBoFMs2Qj
         luQcKMzUwOo/mpU5HGK1J+MKL1/IKOYTlKtR4pMed3iG6fe4oAmjheM5YpRphVzeVa4S
         FucgBtPu2Gjq7savUcIRMJgpRaYSfU1lMMI8yqQ4v6MqTBzeP2xrxEI8GwwCI/uMuVQp
         LHMnvBFCssXNci52DFLA3n7N6caQJXkGPyK8Q2JRuyvS4Wbfqq1ja8K5O8I/Uj3eWOYh
         DV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302074; x=1788906874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SZ8bLk6CvddV2DoaUudub3VpzLWfb6w1zc1ORXdlag=;
        b=I/CHP36jY/S+z9EAtixSIzcKhjr1oM1M6/f1YshTktqJB5ijnARC8Z2ngFL/eD8O+p
         lVFAVkTXzJof9nDSRsSjnL5X6dmAeObiLAf2O64hGM0vbbN7kLYW/vGBQ9jG0+6pYMWi
         PoYZr/3BOT9kqNcQf1JH3TnunwMEvV/3vO7bgSGFIoEw7exVffpGRNOrPhlulWk9ApEi
         /X3N9jsaeMEUFN+VXM+G5qkXFftVSEQ0eAjUP9WpLuuBIYEy8RAguD2KC6fjcuxQ3FKd
         /ljp1zD5ZrGIIbYYsiRjx/K8+tHcJgK8d270JkTHkRBZETZjXvWjrxXK7BPf0Xjc60/M
         50BA==
X-Forwarded-Encrypted: i=1; AKwUvBy3e4L6Bk8XloTdVi+cCx+PidInpnrrfJFWA2WHx8bGbFPcr2MASRtu/pxCCZAom/WlHXAsn6ew@lists.infradead.org
X-Gm-Message-State: AFuF++nvsKXyBtStPAk7YGVw9WA+mFBOOGtCNwgFJZ1PCRnDHf8F8TLy
	pizEWW2IeAdrDiiaQITJGm0BRNxHf77oCLTqeUsg89arylo7Cfxco2YX
X-Gm-Gg: AYBFou03HDH+sBxSVyL4XowZhq0cRT7lrm06Tf6bYYDYvI58u0Qu2RlbTUF8NezIyOd
	Z5YY0/bG/IAeziMmfzB+4u3yAxGco/sgdm1Oi2MGWaNx3HKzZxFSQkDfkTg3+TjBS9vwdU6SjH9
	rtqcJQo97mY4nI/D9g6NKlIQiA1EYCewvXDYeij7bzXvJrXWLhP9HsmdUs/msxKLAUxRhXlOTey
	WlcyOqiJya4JDKeAYsr8vX5uVNysWYtaf49S+AMzw/K8YMa/Ahoy39fGfUH6WvQwLpJe9GO+S4F
	vA0lqduQdtTV72YYfvhcbjnLHpqjw+RN9HC056xcQcIBfCvZGkM2qotOXMJh/UAKp1ZrpubAo5F
	NQo/dOB1HEuNCsnLX40txDPGyRuygsQZ50twE+AunphhuI+In7XtfWMivw5QyuvJyMGbDlhJzsQ
	0qfk2mODaKa3fa4U7SPQsJXSysGHDXFXt5EnRLLWwNSnD8k0QlFd3sdd0RXx9tTyyfWZM7QxBMn
	hQnpgRemOSlEqMmumOXPt0=
X-Received: by 2002:a17:902:ef4e:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2daec5df7aamr7036465ad.1.1788302073585;
        Tue, 01 Sep 2026 15:34:33 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1f4fsm1072949eec.11.2026.09.01.15.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 15:34:33 -0700 (PDT)
Message-ID: <2c3672f5-dcfe-489b-be0d-5c1d2a50840c@gmail.com>
Date: Tue, 1 Sep 2026 15:41:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] platform: generic: spacemit: add K3 platform
 support
To: Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 opensbi@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com, xianbin.zhu@linux.spacemit.com,
 anup@brainfault.org, ganboing@gmail.com, samuel.holland@sifive.com,
 heinrich.schuchardt@canonical.com
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
 <20260831200832.404000-1-valentin.haudiquet@canonical.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260831200832.404000-1-valentin.haudiquet@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_153434_923623_9BB34B66 
X-CRM114-Status: GOOD (  24.26  )
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

Hi Valentin, Troy,

AFAIK, the ESOS runs on the two RT24 cores, not the A100 cores. While
testing v3 patchset, I also observed the rpmi-shmem-mbox@cac90c00 timeout
xmitting messages, and I lost the rpmi backed power-regulator, which then
caused some issues in Linux. I don't think this is caused by the A100 cores
but I suspect this might have something to do with clocks not configured in
vendor uboot SPL. Please check if there're other modification to vendor
uboot that needs to be done, apart from the dts changes, in order to adapt
to this patchset.

Regarding the core/cluster HSM, can SpacemiT publish the K3 TRM, at least
regarding this topic? As there're special power-up/down sequences that a
core needs to follow, it's impossible for outsiders like me to review and
verify if the sequence is correct or not. I was told there's even more
complicated sequences when powering-down a core, if it's the last one in
cluster to power-down (suppose that we may want to support HSM stop in the
future).

Publishing the TRM would also clarify the mysterious Audio buffer, and PMA
register format. What's the address of the Audio buffer, exactly? Is there
a CSR_PMAADDR0?

Bo

On 8/31/26 13:07, Valentin Haudiquet wrote:
> Hello,
> 
> I have tested this patchseries on my K3 board. I had to patch U-Boot
> SPL and EDK2 with the mentioned DTS changes.
> 
> Afterwards, booting the upstream 7.2 kernel with Spacemit patches
> (still in mailing list) works but the kernel hangs in initramfs.
> 
> I had to add 3 patches to make it work properly, see the series
> below.
> 
> I believe one of the issues is that the v3 HSM wakes A100 core 8 only
> when Linux onlines CPU 8. The vendor kernel onlines all 16 CPUs
> so ESOS starts and RPMI works. Mainline uses only the X100 complex
> (harts 0-7), so CPU 8 is never onlined, core 8 is never woken,
> ESOS never runs, and RPMI mailbox transactions time out.
> Patch 3/3 wakes core 8 in OpenSBI pre_init so ESOS is available
> regardless of which CPUs Linux uses.
> 
> For the other patches, I'm not sure why the issues are not encountered
> with the vendor kernel.
> 
> I have adapted those patches from the Spacemit OpenSBI 1.6 vendor tree
> logic, through a lot of trial and error. I'm not sure I deeply understand
> the hardware-specific details at play, so any comments would be appreciated.
> 
> Feel free to take this in as part of the patchseries and modify it if needed,
> or send review comments and I can also improve them.
> 
> Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
> 


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
