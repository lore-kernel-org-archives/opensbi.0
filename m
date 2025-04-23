Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6533FC369D7
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7nShRgfdperD8XUvzmc0Qhe+bojEoWVyq6CphuHt20=; b=sTqZJBkcpsZuri
	YOY6VwRsqkoMCrF0g3a3uPhPEhXjsmka2MZOGKUgK8Ndm2272/q5lXUXhep0a/RkWXfKPQActM9rp
	DGOxiR7JpNhFRrol8JeoQUX881uz3I0KQEvb5Nb3/DywkWYEQ63PYl6SNjVnsuOU2/fLDPu3RAgEx
	jeg4JnH1I1DWiKvr+0NIzfVJwikMN3S6FyjiIWjm8NBbOwKVNseaEyu9eudO1oiMCEUuouOYuYqyg
	Tlq1hMdlynNbY5ERMnAxIcmxy1yeF6sdAmhZ2iNFNcTbKcNJJBElbiNPAEqdF9QF1WRUZVNH8FMkX
	2a3mNelfKbXcN4YkoZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aWS-0000000AgLC-2LHB;
	Wed, 23 Apr 2025 13:52:20 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ZgX-0000000AW1H-2GUP
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 12:58:42 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-861b1f04b99so177558339f.0
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745413120; x=1746017920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6McN6ur2k4N+zrAEEjX5JbQoSyj78CB77ZAIJXYmv+o=;
        b=VImhmDh/DBdRSUkGdMjsR1rHrXysiC7Wb4w2jdCGfoTbqV7TckN5o76vIav5dY551T
         4RfHFSvNEFHVl6nkwLilDdvCTE9W3tHC2bbmclnjRHi9zlVnwwiMaSrpPtkGRMzjvDlD
         srZsM6ZNeRAPlP+fG6+ZS4L5baAzRLlyOmTQ7P5HDr+L648FluVnSZgW7mBqSHTbrhkq
         dH0tAohESQ/nVF1SAGu9oRd/gyXbY8nHZcTh+lbB3bp133nhX+C9GcFf3FbD+r8FqUZU
         haNBcEAGh33YWWQf0dI9fZ5ydeEO8Nlg8eQ3l4avcMUp50M6De4Q92jzRhG0EEuBuveK
         HaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413120; x=1746017920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6McN6ur2k4N+zrAEEjX5JbQoSyj78CB77ZAIJXYmv+o=;
        b=sdb05M0bH2x14libu1gxhr3w8eUd4JRSgy3RqbBCyU0Ii2XyLpmJNk9LgfyyiJDh3f
         9tT4KFL3GLbLQZ9pIXsl/DakWsA6ZprDMdHE1p7WUzb03gYc5U2+ukBR9zyPderxgbZg
         yFqr7XI8dpgxR1sAPOXoxysMwLbt8RjGbQcRjr/9cVDA87RpU2TxlU5Gjdf42WsKLHGU
         HIFJvNb0ekaf/AH9UVmtJsGMGfPEBy/4Y/QSGDBUYw/d6GmOFxolNWseSmzrzcMpoC+a
         Jmt+s4P+WayS8MasdjgUrhUjDNGJkb8FCNFD5zHSMqilXkyNue+6QprNpui/NmKS1DNF
         +vCw==
X-Gm-Message-State: AOJu0Yx9Z+VY/tWpK6f1NOhKAUVvzPZPZOPW4FR3oaI1n77rvCbYTjzB
	5nErp7tuTdWQMkKXtnxgmOnJeTAPlhycJzNcY8pTtNvLj6OkGrae786/jIKo2epUBfMdQd9V70g
	4Pl0ka1wFfJGgX0NERiT1+zqdpg9xc0o+Ub03cLb96qoStMA0
X-Gm-Gg: ASbGncsqJBfKLmxliTutNtzxrALP8jwkiVm6xxWAUeWtXoKRR+ZoACYxKzJYVInmQ4z
	pKCiF7KqDo56faueqFAXSgDEGLrQfdcFD0azelpPTvkVpcqLGN9lGXv/pgVbvo7Ysg9BGbvh3rk
	MHLNQHWKDTWAr6jRGDqH64+go=
X-Google-Smtp-Source: AGHT+IEl3Vom/G0awXDL73S3scbNav2X3e2Q2d8iVceXltPF8P9+GJeV4uqAX5rtXzaPa+o89BhH6rr4TrKEAbflnZU=
X-Received: by 2002:a05:6e02:1a8b:b0:3d6:d3f7:8813 with SMTP id
 e9e14a558f8ab-3d89428c3efmr183237665ab.22.1745413120295; Wed, 23 Apr 2025
 05:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250318185111.452620-1-Raj.Vishwanathan@gmail.com>
 <20250326192730.587788-1-Raj.Vishwanathan@gmail.com> <CAAhSdy2A4nVB1Si4E=pCa=xuKtufCsfy1=NpER6o8Y9=TKvcCg@mail.gmail.com>
In-Reply-To: <CAAhSdy2A4nVB1Si4E=pCa=xuKtufCsfy1=NpER6o8Y9=TKvcCg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Apr 2025 18:28:28 +0530
X-Gm-Features: ATxdqUHNz41WgnQI5KYCXqnGVdrlG-iI27TIB5dyC-i3RB9c5cHf0-xDugRSrM0
Message-ID: <CAAhSdy2+b4EJg8CqiRU2Y5vVMkntMRQiJ_LTmSxsmVhsrAXFew@mail.gmail.com>
Subject: Re: [PATCH v5] Set the scratch allocation to alignment to cacheline size.
To: Raj Vishwanathan <raj.vishwanathan@gmail.com>
Cc: opensbi@lists.infradead.org, rvishwanathan@mips.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_055841_583458_22C15B07 
X-CRM114-Status: GOOD (  10.72  )
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

SGkgUmFqLAoKT24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgMTA6MTHigK9BTSBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDI3LCAyMDI1IGF0IDEy
OjU34oCvQU0gUmFqIFZpc2h3YW5hdGhhbgo+IDxyYWoudmlzaHdhbmF0aGFuQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gV2Ugc2V0IHRoZSBzY3JhdGNoIGFsbG9jYXRpb24gYWxpZ25tZW50IHRv
IGNhY2hlbGluZSBzaXplLHNwZWNpZmllZCBieQo+ID4gcmlzY3YsY2JvbS1ibG9jay1zaXplIGlu
IHRoZSBkdHMgZmlsZSB0byBhdm9pZCB0d28gYXRvbWljIHZhcmlhYmxlcyBmcm9tCj4gPiB0aGUg
c2FtZSBjYWNoZSBsaW5lIGNhdXNpbmcgbGl2ZWxvY2sgb24gc29tZSBwbGF0Zm9ybXMuIElmIHRo
ZSBjYWNoZWxpbmUKPiA+IGlzIG5vdCBzcGVjaWZpZWQsIHdlIHNldCBpdCBhIGRlZmF1bHQgdmFs
dWUuCj4KCkRvIHlvdSBtaW5kIHNlbmRpbmcgdjYgb2YgdGhpcyBwYXRjaCA/CgpSZWdhcmRzLApB
bnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
