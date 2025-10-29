Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEAFCCD1BF
	for <opensbi@archiver.kernel.org>; Wed, 29 Oct 2025 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFVsDPsppB0XjcZXdn6+WD2fEYHt4ScThCI48dyyevQ=; b=dHakw4mErK2l9c
	pZQlsWhie0esaCHPsTsUnhgUQcHS1qttYoTGJJP2a6Hc94J3RtFBagIKpB4V7AMOKLFwuz7YK7DaR
	RFZSVqBAND0PXrXiZAe0GibCLqiIv3lR6f5PGPq47tnINBvRnhlEcO2I5WvhzgW9j9PMeIIuyGqGA
	cn6YArhD9/kh/nQWRyPEmVT3TTn+6dxWjVLeD5WUGJMf6W+n7qWNcPt3I0zPQoGBT+0y5XsIxn6VC
	w3asvisbLh4rHFHLdnYu6dRMu93ys7k+7S+luvLrLAipvSajpQe6GYs4lxQTkKzs78jPAhESWLgsm
	yj3hpJ+eJfbAVTYRWqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDxBT-0000000H4sM-1wBL;
	Wed, 29 Oct 2025 03:49:15 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDxBR-0000000H4ra-02QX
	for opensbi@lists.infradead.org;
	Wed, 29 Oct 2025 03:49:14 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6542eb6dae0so3277856eaf.3
        for <opensbi@lists.infradead.org>; Tue, 28 Oct 2025 20:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761709751; x=1762314551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HajlO0R/6MeIztqC/IjpWJnx3zGIXpf1p9mxiqr+/fQ=;
        b=N1hCaP8diWHtMwDDJ0z0spBNM65i6JcQGfkUmT+JFrnx9gOAQRHK5hthWD6Xs/q8TE
         R4d/cApEC/Kl9GQTgh18b3N6mCuOd1knF+d9LF0Me6HlNrtZMvpCczaOMzc84L/UzDJe
         S5WCDa4Inkbzao15EfMPs03DeR7wLTsSkegZT1Lx12k846gkzSnm1/fOrFS2SCGC/rc9
         jzbcWM7uJO1R6flwqQHHuYelFBXJ9L9JWt5Klk5yD0kNs1eNlq3Ok58SriX+Xx7UQ5cb
         QBiOoeNPg/1zCM9+72Qer07XhN/HWwzEtHmnLM+6Kyzg5mFTKSaVP3kwtN3nGcQqEHNj
         zTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761709751; x=1762314551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HajlO0R/6MeIztqC/IjpWJnx3zGIXpf1p9mxiqr+/fQ=;
        b=SbMtbIwuF7Exrs1Vm6eDz0IJPBI+U6BuIMHhBkt9F7vJBvxu1KgzgjAa9SRuJ+0rdC
         Dw2XXtYiiFdXrc99TCwdH30ReJ4LlSBRgqz3wkWIhDxXhcgpHQ8qsfwH2bwyz6jzFFDa
         NHdDKYE4+kvvsJiVqiLxDnqJYFt12fX5qBWRokPujInr3Y2rKVU/nAbx9cm+Wjl9bRLF
         3w9+5J34eahmmdYr5lxmHIoIuq9UhA3Rl6t8C8dm3FZE2MU8VfLjOw8EsoBnpT+fJrUl
         NBybp7NWaXnxgm38c/A16cc2w6vGi4pfg/4BsFxX1ybWBNjBsUBoKd6FTsToTex60wAA
         u94g==
X-Forwarded-Encrypted: i=1; AJvYcCVkcxsvYQOT5dMFKFI80I+v0XqdQqjT14iZzLyVrzgWo/jkwTCUZIUJtnFHOFERtUruyjzpf0IM@lists.infradead.org
X-Gm-Message-State: AOJu0YzT6wjGJpN9YxxtTLhZbRkC0VY/AIGoLVO3l0xlGyYLY//vIP1J
	oDzF6iync4uqNNxR2TSOHn69V7Glr0s/btbd02KpscN8n789mJH7SuQBu1a2deAmhATONf1xWZp
	RV49C5EeaeOAOoN9sXBT/JP5ygyNXmmBZb0QhP6sKlg==
X-Gm-Gg: ASbGnct0LUS3nEd7Gpk6BQ8FecvXqKTOlOv0ZR3vNsAMofwmoPqLVu6p62wGUkkKBJP
	h1Vk9D3fgBDzE070lgqva1iJlz1l1L+RnBw8/AiCRPMg2AR9QTtNHMGvRBs2ZlzHqP9SIIhYh0O
	PZHwxPgXD0Rx4rTO9er87IA+f8eEdXaZ5vgyRUvfxsDMqDrV7jp0WSuRzJhQOrwWgXd7Ia5wDmO
	hkyOSopxaN8AqUKQZrS55PK8B1LurOVgioN5NlSjafKaac18W2+yhPJe1un+6qB1bwWddFUQPKx
	xPNKclno4UhGHPiTtqJd7KAncO9LDVBWsriTOWpne6Ml3BKjVl18dey2e3yhaetqIqPPPrKNgGI
	FnqvKz7wkAaok5JLMn4Wv1aUdJG3IpRtzH3g=
X-Google-Smtp-Source: AGHT+IEsJk/ihe1F/ygcHO4ZtD6u7eA9q/+j22VERu5XhbrYySjIAmHVuJpXYEvB8ATufPHZN/MiS1BWT88mjLCiTPE=
X-Received: by 2002:a05:6871:4b05:b0:30b:e02b:c7f5 with SMTP id
 586e51a60fabf-3d7487b19aamr900826fac.40.1761709751470; Tue, 28 Oct 2025
 20:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com> <20251013153138.1574512-2-joshua.yeong@starfivetech.com>
In-Reply-To: <20251013153138.1574512-2-joshua.yeong@starfivetech.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Wed, 29 Oct 2025 09:18:34 +0530
X-Gm-Features: AWmQ_bnhw8qdxp0i-HKA71TDXBuH8uZmceKTTH01OzZ23CO1FNqnlTl7HxQ87VU
Message-ID: <CA+Oz1=awXDR4KOiJsR2EASXEBj6uAObAvWoiUJtCbfx6WPr2JQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: utils: Add MPXY RPMI mailbox driver for voltage
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: atishp@atishpatra.org, opensbi@lists.infradead.org, 
	apatel@ventanamicro.com, leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_204913_052792_C44A2F0E 
X-CRM114-Status: UNSURE (   9.11  )
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgOTowMuKAr1BNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIHZvbHRhZ2Ugc2VydmljZSBncm91
cCBmb3IgUlBNSS9NUFhZIHN1cHBvcnQKPgo+IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBZZW9uZyA8
am9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxz
L21haWxib3gvcnBtaV9tc2dwcm90LmggfCA4MSArKysrKysrKysrKysrKysrKysrKysrKysKPiAg
bGliL3V0aWxzL21weHkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICA0ICsrCj4gIGxpYi91
dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfdm9sdGFnZS5jICAgfCA3NiArKysrKysrKysrKysrKysr
KysrKysrCj4gIGxpYi91dGlscy9tcHh5L29iamVjdHMubWsgICAgICAgICAgICAgICAgfCAgMyAr
Cj4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAgICAgfCAgMSArCj4gIDUg
ZmlsZXMgY2hhbmdlZCwgMTY1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxp
Yi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfdm9sdGFnZS5jCj4KCkxHVE0KClJldmlld2VkLWJ5
OiBSYWh1bCBQYXRoYWsgPHJwYXRoYWtAdmVudGFuYW1pY3JvLmNvbT4KCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
