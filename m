Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6723ACA5FA2
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=am/5WgNGWGnHcaWjxQOvPgIBgwID9TT4Nk3XO43PQS4=; b=Nkep3QfRp+ipdq
	R6moSVcOw1cEVS406GWnTW93v/zSvaGfm0ed11jRtLxuE7QZ5CN0vq0szBhNQoQHtTHEIqYbdOpe2
	N7i5ypfBmGQk5OuIT8Nk4IPhcZr6s/0IRAfrgmgg+9kfIGZPIPXs1S1qTayac2qdM6k3hsucabHfw
	ZABk3WbSJNT566hLK2i6LOFhc+CcFVnsg0h3Inc2vSHZfrhF9jPE3+7uAWRHQfd0eFgA9Sl8TP3Ik
	o+C0hb1n6Hn5DA3huSg1EmYWsg2668V0qTg5OEyEptECZjX7TOcXj5KBb53usTzKXu4tvLCcrFVNo
	9QAlbTY15YBrb0d9IVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9br-00000000TBC-14hC;
	Mon, 28 Sep 2026 11:33:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9bp-00000000TAq-1b5u
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 11:33:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2DCF43FEB;
	Mon, 28 Sep 2026 11:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FE61F00898;
	Mon, 28 Sep 2026 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790595204;
	bh=jclS1jFDUX0qpCMM6Z9M+WzpmiihJBvztxI3ixXVSAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GVDjVGbA6fLi61rMj5MXqJXW7ZQNVxJvsLuPebaJSMtSY7ukswwTyZLYfDKEXzOU5
	 PmDRRYvmydr4fUupOfq43QMsBWp6QLF3dVphVVdRqfDQ8eCR2UEt+yzBxnzzxJe9Ak
	 cDD/oQGFEAoquGjcG7WGQhWSL4O53Nw0Rl5a90sYuq/pKtVTCn/iSWw8qlTvHUJJh6
	 R/ozApjgQKQN0n9OTlT5pwssX1SvJKtkWM6o9hPpElOGNMLKQr7yDWA76vlMUOiAjU
	 mMDxJoT8mmBEtIyRyzQ34+UrPR0oJyZVuWIdiqP5pPHSIr27B6dQ8icej+wciAp1wZ
	 GCoA/LS1ZyHfA==
Message-ID: <43ee673a-8df0-4b6f-9e8d-eeda05eb32b9@kernel.org>
Date: Mon, 28 Sep 2026 13:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Add RISC-V Worlds ISA support to OpenSBI
To: Yu-Chien Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
Cc: zong.li@sifive.com, greentime.hu@sifive.com, anup@brainfault.org,
 scott@riscstar.com, conor@kernel.org, dave.patel@riscstar.com,
 raymond.mao@riscstar.com, robin.randhawa@sifive.com,
 samuel.holland@sifive.com, pawandeep.oza@oss.qualcomm.com
References: <20260817090503.2104998-1-peter.lin@sifive.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
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

On 17/08/2026 11:04, Yu-Chien Peter Lin wrote:
> This patch series adds support for RISC-V Worlds ISA extensions,
> enabling hardware-enforced isolation boundaries based on World IDs
> by extending the OpenSBI domain framework.
> 
> Trust Model and Boot-time Roles
> --------------------------------
> 
> The implementation follows the two-phase M-mode trust model:
> 
> - RoT M-mode phase: Prior boot stage (ROM/SPL) that may program mwid and
>   mlwidlist and lock mwid before handing off to OpenSBI.
> 
> - Regular M-mode phase (OpenSBI): Treats pmwid/pmwidlist/pmlwidlist as
>   input policy from hardware/RoT. Locks mwid to prevent later M-mode code
>   from changing its own WID. Programs per-domain mlwid/mwiddeleg based on
>   DT configuration.
> 
> Device Tree Bindings
> ---------------------
> 
> Per-hart properties defined in linux kernel DT bindings v3 [1]:
> - riscv,pmwid: M-mode World ID
> - riscv,pmwidlist: M-mode permitted WID bitmap
> - riscv,pmlwidlist: S/U-mode permitted WID bitmap>
> Per-domain properties (see domain_support.md):
> - wid: S-mode WID for this domain
> - widdeleg: WID delegation bitmap for this domain


I don't understand why I am cc-ed here, why DT is described here but not
in the bindings and why do you reference some RFC (which means: not
READY for review) patchset in a different patchset which is ready for
review.

Best regards,
Krzysztof

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
