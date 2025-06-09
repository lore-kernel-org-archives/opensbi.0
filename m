Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B20C5B552
	for <opensbi@archiver.kernel.org>; Mon,  9 Jun 2025 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2V/avdP5dEN3xivn7+M+FrZ4DgVx0hxk3VS48pKyZUQ=; b=Fk2WGIg5iQZhFRSNwHNAjyaAFk
	3gSWX1rYMsKmBwc3OWg8gaWJfOuOEsL5nbG/PjpwYYGjaE8bEIj1S/NukgiH5Gfs1r/PN91oJJNf2
	XzpDY08OOL7sUheJLdGqL4ysYQKzyQOPP1NND44u7vjPulJkmMT3ieyECj9Wwlt+uGZnFEV5zkdUj
	lYKMrB/h9uBgEPaX2YpmtSW9lbvbIi9BiWxKEdxOtl1ICTDYt/BOmYndQmgcJXGSY5+wRWK1CVgzm
	A8TGCWHwFseMCKmlt+s/jk/fTHtg6TiUJVj56AxrMJc2pTYOYU4NjoyRujOtKFNRfs9Ise3Nzmc+/
	6TCnB/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlcg-00000005QDj-0WhW;
	Mon, 09 Jun 2025 23:09:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlce-00000005QDQ-2ug2
	for opensbi@bombadil.infradead.org;
	Mon, 09 Jun 2025 23:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=m7W8szO//zDzhBhYgLCrpR6jY+WOXvSIWny+9NgxWUk=; b=RaRw0vtU1SN9D2gitICh7Syukh
	W2Y8xKzkucix/nu5rp55kXCnK0U7gO8E54eXSJ9+7YMrcWDkt/3UQFR4Wsd6tFV5RP3jmmOnfvKuq
	v0vAvNw0KdC2u85xRi00sMr0FnkTw4n7QVq5pW2YLTbTY2asuLQvdnNB4AZhJ7qz/Oe/xqtBjPyu1
	K8at9LrGido68g4rKpN08U6YVewazLlWpNsJs3QJNaahcfBMyXOYQ5PgWIQEvoFRfRjD5QA8TmXb2
	/SvRetXyBCHXeeolVgDtzWYdJMHyZe5iey4Igh8lGQHJvFa1xYxqIry9r+CtQPYABCVmBINQKAw/G
	PAHqKbxQ==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlcV-00000001hCQ-3pFn
	for opensbi@lists.infradead.org;
	Mon, 09 Jun 2025 23:09:39 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3105ef2a071so51825861fa.1
        for <opensbi@lists.infradead.org>; Mon, 09 Jun 2025 16:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1749510570; x=1750115370; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7W8szO//zDzhBhYgLCrpR6jY+WOXvSIWny+9NgxWUk=;
        b=pVZSe9L3YuH9Ua2J22a4Xlyj3DoFLcgmSfBlU9Eofvz2bcUhyNYQC1sk1OUXSuysmU
         CY1Y89P6DHzVTIbt0wYPzkN3zOa0SL3IsLi8vqh0v4JxMjHZfvoq7Dz6yVmmZ+z+suVW
         /5tZHgSvR+EXViw5xsFtBT+GcPky9DI6CROpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749510570; x=1750115370;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7W8szO//zDzhBhYgLCrpR6jY+WOXvSIWny+9NgxWUk=;
        b=GALGUJH7sG9jq52CManCI30/jS5UZoOtO3y/efI0gqPgLdM7nPJ1BHSEy0V6bjzBW6
         M8EP/3YZ10HT3JkbNq6KeBU7ie83vpB1nPW8rM/dSDUEwAnm6PCcLJzPFnmVJ/2ICgVr
         yH+BmNWKtTHMA7uz/bAM3CFgF/4j2Xa7NCmsTfG+dZ7tuyUo4Y6uUx3LiNuRddnEKKU8
         TUgQG63N4orb+2XdN66Ojh0xjXk4QX1k/91SKrZj3PU0EFu7SuQRFVeHsmCrVy9phlMc
         1uU4LGcGQUhAu8U0LFNn8CjncQrMw4Vrrq5dzkmssBDnry8Kiij/8g+svKeS8V8/JvRs
         jNLg==
X-Gm-Message-State: AOJu0Yz5ZQOFgIVpuWuJlL+aWHiy1w9GZDCExMYxM1xazxSnUw/A9Mnh
	UjtRiPbqvcqwwy1jepP/yLjytvUulnGbzI7rKNz2UVbNtZqjsyFvbbxHF0gMcMpHyrfuA/u0oXG
	rzBGP10FC3B1NB+83aId3tlRSQO2fMclKdgWfmwlSq5YPAMOY1/OR1w==
X-Gm-Gg: ASbGnctIXnvunS+JU9Z5iN1i/E9Lr3nv3QACC24t5OZWcrlxmj08Q6axu2G7M4SlfLg
	x3uer4DTdjJm5AbXXOFQcCgHPFImhghz4g1yA1Pjzsf1i+tiVlwVYH0lB6s3Gu3P9GIwSbpKbAy
	0qpYo8qmRz4j/OpXc2mdT/n88cgdrlAjukQyFih9JB
X-Google-Smtp-Source: AGHT+IEWMMff+VYQVsGpjnaXm/Rn+Jul0YvV4ACZEai3Uq0Vho3uDx8M4RM6ygBBdbc10Ja/CaIYRVTgzwggqMG9dMg=
X-Received: by 2002:a2e:8645:0:b0:32a:6c16:d3a5 with SMTP id
 38308e7fff4ca-32adfd369bcmr31191401fa.3.1749510569768; Mon, 09 Jun 2025
 16:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
In-Reply-To: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 Jun 2025 16:09:18 -0700
X-Gm-Features: AX0GCFvzzx0sgQlTBgQqz1aYTf9FCOEcA5zF6GsJeLGQOky_JUzsDZRXZjmq3RA
Message-ID: <CAOnJCUJ-VusA8E4-ABvXPZOReD3nq6_jvqNF5bscfDY89_BoRw@mail.gmail.com>
Subject: Re: Public Review : RISC-V Supervisor Binary Interface (SBI) version v3.0
To: OpenSBI <opensbi@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, isa-dev@groups.riscv.org, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_000938_092185_03804152 
X-CRM114-Status: GOOD (  13.73  )
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

SGkgQWxsLApUaGUgcmV2aWV3IHBlcmlvZCBpcyBub3cgb2ZmaWNpYWxseSBjbG9zZWQuIFdlIGFw
cHJlY2lhdGUgeW91cgpwYXJ0aWNpcGF0aW9uIGluIHRoZSByZXZpZXcgcHJvY2Vzcy4KClJlZ2Fy
ZHMsCkF0aXNoCk9uIGJlaGFsZiBvZiBQUlMgVEcKCk9uIEZyaSwgTWF5IDksIDIwMjUgYXQgNToy
N+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+Cj4gV2Ug
YXJlIGV4Y2l0ZWQgdG8gYW5ub3VuY2UgdGhlIHB1YmxpYyByZXZpZXcgb2YgdGhlIFJJU0MtViBT
dXBlcnZpc29yCj4gQmluYXJ5IEludGVyZmFjZSAoU0JJKSB2ZXJzaW9uIDMuMC4gVGhpcyAzMC1k
YXkgcmV2aWV3IHBlcmlvZCBiZWdpbnMKPiB0b2RheSwgOSBNYXkgMjAyNSwgYW5kIGNvbmNsdWRl
cyBvbiA4IEp1bmUgMjAyNS4KPgo+IFNwZWNpZmljYXRpb24gRGV0YWlsczoKPgo+IERvd25sb2Fk
YWJsZSBQREYgVmVyc2lvbjoKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNj
di1zYmktZG9jL3JlbGVhc2VzL2Rvd25sb2FkL3YzLjAtcmM3L3Jpc2N2LXNiaS5wZGYKPiBTb3Vy
Y2UgQ29kZTogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYwo+
Cj4gSG93IHRvIEdpdmUgRmVlZGJhY2s6Cj4gRW1haWwgeW91ciBjb21tZW50cyB0byBvbmUgb2Yg
dGhlIGZvbGxvd2luZyBtYWlsaW5nIGxpc3RzOgo+Cj4gcHVibGljIGlzYS1kZXYgbWFpbGluZyBs
aXN0KGlzYS1kZXZAZ3JvdXBzLnJpc2N2Lm9yZykKPiBQUlMgbWFpbGluZyBsaXN0ICh0ZWNoLXBy
c0BsaXN0cy5yaXNjdi5vcmcpLgo+IE9wZW4gYW4gSXNzdWUgb3IgUHVsbCBSZXF1ZXN0IHRvIFNC
SSBHaXRIdWIgcmVwb3NpdG9yeS4KPgo+IFJldmlldyBhbmQgUmF0aWZpY2F0aW9uIFByb2Nlc3M6
Cj4KPiBEdXJpbmcgdGhlIHJldmlldyBwZXJpb2QsIHdlIHdpbGwgY29sbGVjdCBhbGwgZmVlZGJh
Y2sgKGNvbW1lbnRzLAo+IGNvcnJlY3Rpb25zLCBhbmQgc3VnZ2VzdGlvbnMpIGZvciBjb25zaWRl
cmF0aW9uIGJ5IHRoZSBQbGF0Zm9ybQo+IFJ1bnRpbWUgU2VydmljZXMgVGFzayBHcm91cCAoUFJT
IFRHKS4gTWlub3IgY29ycmVjdGlvbnMgYW5kCj4gbm9uLWNvbnRyb3ZlcnNpYWwgY2hhbmdlcyB3
aWxsIGJlIGluY29ycG9yYXRlZCBpbnRvIHRoZSBzcGVjaWZpY2F0aW9uCj4gZGlyZWN0bHkuIEFu
eSB1bnJlc29sdmVkIGlzc3VlcyBvciBwcm9wb3NlZCBtb2RpZmljYXRpb25zIHdpbGwgYmUKPiBk
ZXRhaWxlZCBpbiB0aGUgcHVibGljIHJldmlldyBzdW1tYXJ5IHJlcG9ydC4gQXNzdW1pbmcgbm8g
aXNzdWVzCj4gbmVjZXNzaXRhdGUgaW5jb21wYXRpYmxlIGNoYW5nZXMgdG8gdGhlIHNwZWNpZmlj
YXRpb24gdW5kZXIgcmV2aWV3LAo+IHRoZSBQUlMgVEcgd2lsbCBwcm9wb3NlIHRoYXQgdGhlIHVw
ZGF0ZWQgc3BlY2lmaWNhdGlvbnMgYmUgcmF0aWZpZWQgYnkKPiBib3RoIHRoZSBSSVNDLVYgVGVj
aG5pY2FsIFN0ZWVyaW5nIENvbW1pdHRlZSBhbmQgdGhlIFJJU0MtViBCb2FyZCBvZgo+IERpcmVj
dG9ycy4KPgo+IFdlIGV4dGVuZCBvdXIgZ3JhdGl0dWRlIHRvIGFsbCBjb250cmlidXRvcnMgZm9y
IHRoZWlyIGRlZGljYXRlZCBlZmZvcnRzLgo+Cj4gQ29udGFjdCwKPiBUYXNrIEdyb3VwOiBodHRw
czovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJzCj4gVGFzayBHcm91cCBDaGFpcjogQXRpc2gg
UGF0cmEgKGF0aXNocEByaXZvc2luYy5jb20pCj4gVGFzayBHcm91cCBWaWNlLWNoYWlyOiBTdW5p
bCBWIEwgKHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbSkKPgo+Cj4gUmVnYXJkcywKPiBBdGlzaAo+
IE9uIGJlaGFsZiBvZiBQUlMgVEcKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
