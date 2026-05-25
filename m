Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84767CD5BC9
	for <opensbi@archiver.kernel.org>; Mon, 25 May 2026 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdC8pt9mJ3X9x4Cqjn/oSQpLg8A2sFUSdowZ8z7HSzM=; b=yijM6Hm6M6P5/A
	8XAZ7ugCJE7vCvlMmhWQNCd8dIUX9Mf4CX7cZKDpYtY0k1eBTagfLrdne7NVXX05jYNuKDDDyZWXB
	dOEx4o+/uM7XtQRo8hk8Bc7vx0vd2Kolp/etdRWjdcESXbq8e0JC05eeKc7knSivd0W9CKka36ZyK
	6/WHiQpUyMyUfF/F3DRmmv6Tf7n+9fyH/qYAkufPxqrqqSm0mkxdQoG4/utF8Ae3Cr3W5OlB/6MAo
	Reb64om5nDhZKB12UGul54YmVNdlQzI72cxhhBZJKU0XPNcUxtMZNLFMCx7PCFWWu89qBrpTfq2vz
	i9sCjz+8IXprPIpz4ZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVI4-0000000HJ6A-2GBe;
	Mon, 25 May 2026 13:24:20 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVI1-0000000HJ56-3KNc
	for opensbi@lists.infradead.org;
	Mon, 25 May 2026 13:24:19 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-7b37d84a6b3so86967137b3.2
        for <opensbi@lists.infradead.org>; Mon, 25 May 2026 06:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779715456; cv=none;
        d=google.com; s=arc-20240605;
        b=CN+gqidRnNqTD77NpPLtMZ/nz/D1h1X+IGpBDDLZFxHSLR16tKOe9jZnPh2IaKnmih
         dAmrY5thUHRzOU4JT1HbeqvIueZoyz2pLyIOwsYACVGjXH0EfMypUJR3qgCbNnv/rEJx
         q24IMbKbnusmzi1zQpulAW47CEwoBYouOd41YS3rI8JX84fQa7tAYZGtK5PSpWwjsWPM
         SLuE4t3pRloqxUHKsbMFrODU/TqLKwAcJh0NBMcqZ9lV/Hhlh/2lcu8bq/drPMdRETib
         zRChhYN5AeteNLJ7KZCW9By2XedyvyekG+swnPDbKwnokPMqKoLBBiYsQVDnCNtR/kkC
         vv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNtqW3T7CIDGWevgFDY9YOz+STjE5c9k6+XB7CYuuqI=;
        fh=MdyoXVCrBqUhlnfgi0d8ER4Z8FgrnUi1r3jLWTbuc64=;
        b=aoIHBE4omxhpNoiIOlZueFlW+R58Cbs1G6kEe2TWOFLMbBZvl9l4CqNNJ1P2+HZA8M
         X/QXfl+fkvdnU12rDycI77uUHW+B2yvgGkQoA2DDTA/RNtLlRHv/7b9MUm4WSTiQFjZQ
         LcQGdPs/G1bGna1rCkE7yAEirNPirOC2oI6nRzQj1rKt1PaAYGUmvBZAxDsVFv92wkSx
         Dc0+aQ0h4JzajoEp3TkypasuWhJUiWEpXrfq+B3kLLJYQEpOPJMr6Rr865zjEPplPkut
         25RCVfvAZOuIbEqOhtkbrhmoJ7x9VBhKKyi8l2Oo2wyyGd+pIC6O0nzRQsVL6Kn+Ph6p
         Z06Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779715456; x=1780320256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNtqW3T7CIDGWevgFDY9YOz+STjE5c9k6+XB7CYuuqI=;
        b=VMKgvw85/3t80xi/yFEe8pPso+8S6LteroYBpej0+iouH1IxKgOIYRuq1V0e3sVJIJ
         FYZusg7x08C/9my8hd757pVMfnwPkCWXSuiGkzxBxP3tc/LzG78KXT7l8JxoWOPQZ9yz
         OJUVqyM91J4qnHfcVcveuHcBm0J4bjvMV/bLwY0OvVGJFYxdknCOqUS987p3G8EWKgol
         vIMKHmRYF2c0M7gyhp8n/5OS0/zoUXa0IGtsII09MLrLK49YKSMQS3kCr3cQ3bcTQFk8
         CO9/1Ti2koH3r6YuzLVgadQ0xWDILuERRADN474KdikKWQ2P/Nc9hY149THuN+nC7/zZ
         CDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715456; x=1780320256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNtqW3T7CIDGWevgFDY9YOz+STjE5c9k6+XB7CYuuqI=;
        b=C/riJPWsu88w7+a9Jq6OZBUjjmMtLwJs2Fhj878SJ86Uos37TVo1Wav9W+3ld53lUW
         +CiuYHrWhzpexSQptEfY45X5mOKZby422xUh+9sYJSJnPOol8KWdzTw831ThVdhN97bI
         a4DLMpZp/xWpangK1wWez0InYPlAoQAyi3fEq49C87Ssc73n/WJSBYAgWksG0aQ8mxeA
         zSVW3Tb8pFxUJyUTZ6g3sxjkHHqGyDezssgN26hWwq4rYgG1WPxc56DCubJxkPQZUOJm
         p6IC34enA0lalZBGBLDywRgPX5kXeEK8+z/SLXCEm1yUw2nDoYMwSoqtJLoA2NfUzTQm
         +cLA==
X-Gm-Message-State: AOJu0Yxjhg7ItONtvtsvUbAh1Ks33TLp13lxmAcfPpfxgUnx9B19c5g0
	bF262HPXxc2fK55/2dT2pJbowtedNF6RhuuXBpCQVADZP4vlmTxYXArm92wW7n5YpXXzuayn+F6
	ZBTggdpMqV2YWTxRNPzoi3xuuASYj8xgKGt6J1XkWFQ==
X-Gm-Gg: Acq92OGvzgPRnOGmDwo1B4LvYTAJms4/JFxWHWBZUhUh9cNwAMRBQA32OreiLuyRCWk
	tYMGYxWg18crmD4J1AlYj0h6SK/yiRuvbvku7+/rF3C6o0c5RWwr989HTFcXs3P/qNwYiz20GZp
	AGB5gf0AyKGwOye4hAJLdkJSOMCG1C713gio8GoCgtA6BTbeuZ3D9Qrbsf9ksObOjIE/VEc1SGS
	IIZMShgS7wB1FVQI7TJn9SlX/bG+vMq6lF3uMnoc5y1OsZ3WxTIEKRav/xfVGBI2VyywU8NMEyH
	61NW3cTuVQsP0/t6z8dpWhXVsG+4/tzyr9DYQZNL00/E6oPPXNcgmyRj5y9kGZNpDXT2HLd2
X-Received: by 2002:a05:690c:4b0b:b0:7d1:c256:b5b8 with SMTP id
 00721157ae682-7d333dd1ba1mr154907607b3.13.1779715456050; Mon, 25 May 2026
 06:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
In-Reply-To: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 25 May 2026 08:23:57 -0500
X-Gm-Features: AVHnY4J_XF7u8cSXl1iImL4tBqb3r78ZlyHZNfNSqRhfmwLcfVl5zUO9YlQHIqs
Message-ID: <CAEev2e-MU3Gz3Ag5RV9YDQo+XqxS6Jrw0X+m83stqCLAqVr99A@mail.gmail.com>
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Michael Ellerman <mpe@kernel.org>, 
	Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_062417_945845_E3610999 
X-CRM114-Status: GOOD (  11.97  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkgVml2aWFuLAoKT24gU3VuLCBNYXkgMjQsIDIwMjYgYXQgMTI6NTPigK9BTSBWaXZpYW4gV2Fu
ZyA8d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gc2JpX21pc2FsaWduZWRfdl9s
ZF9lbXVsYXRvcigpIGhhcyBhIGxvY2FsIGJ1ZmZlciAobmFtZWx5IG1hc2spIHdoaWNoIGlzCj4g
ODE5MiBieXRlcyBpbiBzaXplLCBzbyB0aGUgZGVmYXVsdCBzdGFjayBzaXplIGlzIG5vdCBlbm91
Z2guIERvdWJsZSBpdAo+IHRvIDE2Mzg0Lgo+Cj4gVGhpcyBzdGFjayBvdmVyZmxvdyBjYW4gYmUg
b2JzZXJ2ZWQgYnkgYW55IFMtbW9kZSBzb2Z0d2FyZSBhbmQgbGVhZHMgdG8KPiBNLW1vZGUgY3Jh
c2ggb3IgdW5leHBlY3RlZCBiZWhhdmlvciwgYXMgbG9uZyBhcyB0aGUgUy1tb2RlIHNvZnR3YXJl
IGRvZXMKPiBub3QgZW5hYmxlIEZXRlQgbWlzYWxpZ25lZCBkZWxlZ2F0aW9uIFsxXS4gVGhpcyBt
YXkgYmUgY29uc2lkZXJlZCBhCj4gdGVtcG9yYXJ5IGZpeCB1bnRpbCBmdXJ0aGVyIGZpeGVzIGFy
ZSBtYWRlIHRvIG1pc2FsaWduZWQgaGFuZGxpbmcgWzJdLgo+Cj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvbnJ2dDc0cW5vamF1Yml3am8zN3VtczRsbmNsdTQ2Nmhv
dndyaG10YmFnNmY1dWhycWxAcTZtc29lMm90bzRiICMgWzFdCj4gTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDIxMDA5NDA0NC43MjU5MS0xLWdhbmJvaW5nQGdtYWls
LmNvbSAjIFsyXQo+IFNpZ25lZC1vZmYtYnk6IFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nh
cy5hYy5jbj4KClRoZXJlIHdhcyBhIHNpbWlsYXIgcGF0Y2ggWzFdIGZyb20gZmV3IGRheXMgYWdv
IHRoYXQgbWFrZXMgdGhpcyBhCktjb25maWcgb3B0aW9uLiBFaXRoZXIgb3B0aW9uIHdvdWxkIHdv
cmsgdG8gZml4IHRoZSBidWcgSSBlbmNvdW50ZXJlZC4KCldvbmRlcmluZyB3aGF0IHRoZSBtYWlu
dGFpbmVycyB0aGluayBhYm91dCBob3cgdG8gcHJvY2VlZCB3aXRoIHRoaXMuCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS9WSTBQMTkyTUIzMDYyNzM1QTYxOTRCQjZEQTcyMDgz
NDk5RTAwMkBWSTBQMTkyTUIzMDYyLkVVUlAxOTIuUFJPRC5PVVRMT09LLkNPTS9ULyN1CgpSZWdh
cmRzCkFuaXJ1ZGggU3Jpbml2YXNhbgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
