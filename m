Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AD5D609A0
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qD+AHL/1aTWE9HeiyoSwbBmZUVjHexTy1lJMZn+U8uc=; b=KFmLAT22DjF/ZX
	77E7LcvPekCkLB9392UFUpa4Megc3RTc1bZSHdZ/eHVmQcj6AkxoyAQ8LMuVIIuHH+6a8TeOEBUI3
	+qvIbi4vH8pKs187xTRAmqa6/GogWQCKb8d2Ul5prblBLT7bPh+ggd7P19S3ePV4yFXJPIOnyAbkd
	+Dp/W+HltxSUwjMXvCZFxSfdey5jFhtMDmAhyio38mFmY0CwJWMKWRc3+sPUOkQO+27bqXK4XPoPW
	3PSh85zMxjx4VfQQAkIfdZKLWRSgkGDbOSGbA4EgMacwIyrCM8cjXL7n45FrHGnTgGCXPel34fUAx
	jFV1Xzg9TFmgSvpDhCGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWSx-00000005OYL-1Vic;
	Tue, 16 Dec 2025 14:55:55 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWSu-00000005OY0-3vVZ
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 14:55:54 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-657044fea68so2388382eaf.0
        for <opensbi@lists.infradead.org>; Tue, 16 Dec 2025 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765896951; x=1766501751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZJ+O6QO7c322hPrQolpwVvs1DOgJl3Knnvqluj7PNc=;
        b=0idm4sQ3/uytTngBh0o49w5FTSAEKl/C7CleG0PI8jv48AiRbf66tCsf6Fshmpxzgl
         P59c3IWB6P1nDx2AEfd9J4M9VVml5d8ecfPTpk41aU+y0xzz7zzasctYFEGh7e8SV0dI
         RUSTb3aIRVNOcAWgRfp8FTSiAiIuOb1uUTcbRaD8RNTmIiEyQxIyoTm05NlDqXoTxN+f
         p6M2Du0cdCJFQB7ygieeGTrpy72kWQY6uqv7RKnSvTZ8xtKpaZrVVD/P3emygYag97AS
         CHH9R7tAwMxTvoEVYenFR5yA59tb5Iwz3hIgOIJCreFFIR5ZPhzK0OmXY3aa4/O+JYJ6
         c2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896951; x=1766501751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ZJ+O6QO7c322hPrQolpwVvs1DOgJl3Knnvqluj7PNc=;
        b=Tg/LxGGRq47Smt6PNuLLcJDO4ay8J+xhGK8KDocQ7FE6si/zyRGw+yORhKyBGYZjj4
         Y6b7IVgG0oRH51iHpjGitz43YJA2HBc6I5sJorhx84dcEluDm/j3qGbkYCW5AlPJVhTW
         Lpt4KTYceb0G9NSwY8cEO8S4IvGv8S77AuH2IHKFJYfg1/k07WqrK+NoskcjoFD8PHLP
         Qml81IvC/VRGp6Z0F74OEgtL4kUfoLLQ00SCGYe0TakagZL93S55sOf/fgQlAIgCbloH
         4blw6CMoo7wiTb8l5B7wJLH7hMnElQugdJ12VUTu3qs4i8JdLfHkTDwQZFeJnUOVZU8Z
         Cv+g==
X-Forwarded-Encrypted: i=1; AJvYcCXoYr2ULtBVw7mBXR07YC2dPXyEko+X6Fpsqpx0Nh463f+dwapcjI6iiniW0QILqgeXuGt7EO94@lists.infradead.org
X-Gm-Message-State: AOJu0YxfAlOFgKiafDsQtAcXUQfYU/pOudn2Jc/Y7yABVlhMAcXPiCLX
	S+d32V2ex4u+8pY95wzneK0j7VtueZztK5wzeCJVtaGpvrA+SYnaDDd09MNa4tXKKkZDqzLSrfL
	pZkdzHIipD5ehhA19cil7rmlKfXvxeiNjZ5yQYxrOaw==
X-Gm-Gg: AY/fxX4xfwOuYWXs/P7zYhdyR3TAgmtxcR3f1JX5KT2MQo1tzJx2Us3SuCodT3Erbfk
	ThNCAs65nkvAf/t0eZmGcK8ssN1ZN2C2VUTo1H8tYejci0512S0gjVLQ5hP4IsdXKQaU0S4wXRe
	qZVQXyP2K2nr5qoG39MVlB6T5KFeKBwEMr+axCIa+SqykNEyZrQRmMqRLUUBQdFxJSAHelBOKpR
	A5PDITmdjmHKQEhkh4Nk+66DnKjIg/hp0mae1P8ADYEaGw89j1xr/jVPBoU+tx+N75ZQm8fRjjj
	PmUxU3HN66mmhcg6RH7F4upvVqpWszkSJjn+zw==
X-Google-Smtp-Source: AGHT+IG283eCtYnOAGMMIPDi6FUBuJtmBqunKyGzLHBDPRXymZi4IHx2NlXH1r1IzOsaUxG4UGtldMqIRUOYxkI16hg=
X-Received: by 2002:a4a:d08a:0:b0:659:9a49:8e17 with SMTP id
 006d021491bc7-65b37e855d7mr7232038eaf.9.1765896951612; Tue, 16 Dec 2025
 06:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20251127112121.334023-1-apatel@ventanamicro.com>
In-Reply-To: <20251127112121.334023-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Dec 2025 20:25:41 +0530
X-Gm-Features: AQt7F2qbPAUhV1qpQkJBEBLQIyVk4wHtscxkLlF7aQSs-7J0DzHWjBBxv4Dnfys
Message-ID: <CAAhSdy04OLwWzspiNLG8p4uNF-FCUukCm56kxiB2HfkkCVkHqw@mail.gmail.com>
Subject: Re: [PATCH 0/2] OpenSBI FWFT ADUE update fix
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_065552_979514_FFBB8047 
X-CRM114-Status: UNSURE (   8.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgNDo1MeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFzLXBlciBsYXRlc3QgUklTQy1WIFByaXZpbGVnZWQg
SVNBIHNwZWMsIFRMQnMgbXVzdCBiZSBmbHVzaGVkCj4gdXBvbiBGV0ZUIEFEVUUgY2hhbmdlcyBo
ZW5jZSB0aGlzIHNlcmllcy4KPiAoUmVmZXIsIGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVj
aC1wcml2aWxlZ2VkL21lc3NhZ2UvMjcyOCkKPgo+IFRoaXMgc2VyaWVzIGJhc2VkIHVwb24gdGhl
ICJPcGVuU0JJIGhhcnQgcHJvdGVjdGlvbiBhYnN0cmFjdGlvbiIKPiBzZXJpZXMuCj4KPiBUaGVz
ZSBwYXRjaGVzIGNhbiBhbHNvIGZvdW5kIGluIGZ3ZnRfYWR1ZV9maXhfdjEgYnJhbmNoIGF0Ogo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL29wZW5zYmkuZ2l0Cj4KPiBBbmRyZXcgV2F0ZXJt
YW4gKDIpOgo+ICAgbGliOiBzYmk6IEV4cG9zZSBfX3NiaV9zZmVuY2Vfdm1hX2FsbCgpIGZ1bmN0
aW9uCj4gICBsaWI6IHNiaTogRmx1c2ggVExCcyB1cG9uIEZXRlQgQURVRSBjaGFuZ2UKCkFwcGxp
ZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClJlZ2FyZHMsCkFudXAK
Cj4KPiAgaW5jbHVkZS9zYmkvc2JpX3RsYi5oICB8ICAyICsrCj4gIGxpYi9zYmkvc2JpX2Z3ZnQu
YyAgICAgfCAxMyArKysrKysrKysrKystCj4gIGxpYi9zYmkvc2JpX2hhcnRfcG1wLmMgfCAgMyAr
Ky0KPiAgbGliL3NiaS9zYmlfdGxiLmMgICAgICB8ICA0ICsrLS0KPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQzLjAKPgoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
