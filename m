Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7BFC9832F
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc1QlJSY1AykreaJt3xC/71DuZjjTo8+kSK9hL4jQh8=; b=epyBJl8KXrifbC
	vqQ6jcr0yFmXh17i1TvKRiFGfb4X9I9l1OATgVOy8bhOJGnSLpolcPbIqc+b1Xvg059XNRX9Egsw8
	Alm0tRA2BgXn2XNl7pK8R6Uw2XbWagqZw8VJQtK/J249ATm1HkrlbxDmuldGLu9TRTybbK0nVkXD3
	uOYkl1E54H03G5+5iY9Lv1VqUj/gXBG4Vbi04UWPx58BRiiM7RBIVSJ4hFmqNAFj9TmosKYBxxuUq
	uFX6kEISMon6ExR7FN8w9HzVLQNqN9NjZK57Cfj2PsBNNcbujsC8zTMF+Vrj797ttN70OIUHIAVDZ
	s6NdQtTC6GJvFykd2+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6yq-000000008KY-1Tih;
	Mon, 28 Sep 2026 08:45:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6ym-000000008Ja-3YmH
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 08:44:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D0DD04E41090;
	Mon, 28 Sep 2026 08:44:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3B6B601BD;
	Mon, 28 Sep 2026 08:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 055F9102F1EA6;
	Mon, 28 Sep 2026 10:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1790585090;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=JFgvxxh872+iuJqMGF5DfeHNDdFzQfCcSO/HnduFRx4=;
	b=mgqfkW+8cA6l/YLlQQ+HHLsuE/cVfgdijOwRgUDH4wJ+y2UwQ0wT0qJ1RmlG3e0gTKqF0i
	u71rwmHssTiIoJf/gT3pk1w9pSwSdyNHjs/tXawdZyzmsLV5EJ/d5VdnIWP6sv5/ogPG9u
	hwBcw4wJwBeVw7/2Ci5NaSNEuf1IhcI7wWV7eiuskxysJ6yF7MglSmD32N/buGjhffdEmG
	9G8h0NVoLwtzpwcZ0uQF3xgsHUZLkyC80V49M26xbHTFACn1lFhCWXmxilenJGVC9jdnQn
	ZjtZY75mVLU4ztSz/PHr+1sKNJ+t6RRqKz4Z1PClXaOgT0jvKvW/LAHUh3Kk6A==
Message-ID: <8a096379-443b-415d-9263-4f4709ba4f49@rootcommit.com>
Date: Mon, 28 Sep 2026 10:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Drew Fustini <drew@pdp7.com>,
 guoren@kernel.org, wefu@redhat.com, inochiama@gmail.com,
 opensbi@lists.infradead.org
Subject: Re: TH1520: broken CPU count detection
To: Yao Zi <me@ziyao.cc>
References: <873b32a7-2e17-41dd-be7a-f97d5b768177@rootcommit.com>
 <aqrG3uRzSjV58d8R@pie> <5e67bae3-753c-4f39-bdb2-b912ff2f62e8@rootcommit.com>
 <aqwlIK3ly-Ct4z0L@pie> <7d24d195-02e4-46d3-b0a3-4c48bf6a0d90@rootcommit.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Autocrypt: addr=michael.opdenacker@rootcommit.com; keydata=
 xjMEagLVOhYJKwYBBAHaRw8BAQdApKjypQYDpk7gc2tKU7srAaN/v2wqp3zsRtrICl5tMarN
 Nk1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29t
 PsKQBBMWCgA4FiEEHltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwMFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AACgkQzXRqZ2jNCaAK/QD/fCa/2kPEcJYpt3XjoXUFC40rV5p92/Mn/CcV
 cDDLTNcA/19zgdNIKAqVOaJAcLwhBjCCIZJfAQ80CuPOdGRR5NMGzjgEagLVOhIKKwYBBAGX
 VQEFAQEHQCujvLLf/3B2yAjCRJWU9BUta58RTcZ9ZYYxzsOBj5FmAwEIB8J4BBgWCgAgFiEE
 HltE0IOQ91GyZqTazXRqZ2jNCaAFAmoC1ToCGwwACgkQzXRqZ2jNCaAWEgD/SY55n6h+sq1u
 /Kdbsd4z+uOz2+0Z9V0HtrYLdfgdBTIA/0nuXShti770G4hZDQD52XLANSdPbO7hbwmpNKHm y3UE
In-Reply-To: <7d24d195-02e4-46d3-b0a3-4c48bf6a0d90@rootcommit.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_014457_091715_C24F98AA 
X-CRM114-Status: UNSURE (   4.93  )
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


On 9/20/26 11:09 AM, Michael Opdenacker wrote:
>
> As you predicted, the issue detecting the number of CPU cores is gone.
> I'm preparing a meta-riscv layer update for Yocto to automate all this.
>

FYI, these are now supported by Yocto's meta-riscv for the BeagleV Ahead 
board:
https://github.com/riscv/meta-riscv/blob/master/docs/BeagleV-Ahead.md

We also have a pull-request under review for LicheePI 4A, with mainline 
DDR training, OpenSBI, U-Boot and Linux:
https://github.com/riscv/meta-riscv/pull/698

Thanks again!
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting. Yocto Ambassador.
https://rootcommit.com


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
