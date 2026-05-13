Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6573CD37B6
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLTKHOyEvBAy6YH1lmX8fLfen3Xj/sk9kfFg/unFShk=; b=KXxXoFgY/IvlYj
	90tHyD8kPyhod7Rtm5+eDnFpVdOWsLtZ8UtkWkiuR5fm53ugAl+YlMlMqQHjlNOhXacat+E09gVYd
	jboanfWA8weHA/tvlFiNZASXOmLJaNVmMv5+66lC236DjtaYJRwkCf1h+toXkbJGD6lPD2ZHVV+jm
	S8vwN407kL8IIiL5FYnbuLiZqyzOxtJHGo4aALWecXlp2/rK2LIpu16qRuYD9frY3QDLcEriJKMrS
	lWdWVeb6Ol14VTlE6D5tdvMZEq4ihUlClf15tsnNk+hjVmgsRDH65SvADy8G7dLVw1aJNMNOM2AJ6
	HJ4Zt2WjKOXOXSuRoaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4FL-00000001bqX-3zvL;
	Wed, 13 May 2026 07:43:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4FK-00000001bq9-1gTr
	for opensbi@bombadil.infradead.org;
	Wed, 13 May 2026 07:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=YHxD8ulL+nhXoYBdoXHqSUJw6ZXhv7NDTmurojxJmow=; b=JURRoZbO4HpFNcw0ocEge7G1Su
	EkfDbID9YOj88gyt3C/H+YucfNPhoAxNOt4Q6X4o+LvoDzhacBKOSrSBRStJe3pN8TyMAKJwSCyK9
	fNSC1P3iMrczGLIVQsOpmnxogSK0ksB2pene03UXl6PEuBuVAMbbEPvPHAdR7BJKxFfl70lBVvnJV
	Ly0t8kpLnYEh27cR4cx1Ah2pdNlqlIoyumoS/qmRsUvUrD0LbjVGVWbuBeACvHr/RmCPh+1kTWyq5
	TnoLmFzvAvW0kF2faTFyincUbs9xmA/MvNohErXllfak6xWuRPkNenDJopiMABZFYz7WU7urD23u3
	o0BqgOOA==;
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4FH-0000000BCxk-0AsI
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 07:43:09 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-47c7b282d73so3727065b6e.3
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 00:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778658183; cv=none;
        d=google.com; s=arc-20240605;
        b=UP458U8u4uscgij+A2RfCqzi6/uExqLeabwKHPitGL7cL37KRZSc9UW9xoJg/HALW5
         PwPnwzx6A05eBvJt4p/fqayOu+imFwwNL0Rb+nRw0rLLlD3HllIlIMJp6O0vVqweuPpu
         QDRW2RDI/Mblm2TU8A7u4p6Q0t8/R838rJREkhgmXxysWWUYdHl4EAt/4OZ6MmRuS21a
         pz5cNAWM18uF0nk/ITHISHAizlBac3Y5XjZmXVJkQoXKCHnpWpLe5ZZzN03oxFuTIErZ
         8pvDY5yx1zzEj4UpaLniy1qa4xEc2gz3V3N67Z8jcQBLiJxyb0uan4P9fwEKxOISKgdJ
         xg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YHxD8ulL+nhXoYBdoXHqSUJw6ZXhv7NDTmurojxJmow=;
        fh=u6yx1j8b/B3CuuNU/6qclLBZ1N7N58E4bMMGpLl7Sqg=;
        b=ay+ZDQ+BSDTnAdvdCTAG9py7j4KooLIwSufOMbnjik1wPhpaBeI83UUj726xfTBDJS
         PE+Vao2mCQL7mOj5eKK40dUbjxIuZk6AKC8QV3IacZtjoK2cijfS1WJ67/SjEXLeBVF4
         jBQ9you2as4+FfHk4eD5+DaoNLad+KwlPn4jN5YMNhcW6cqNIDO2cac6hNBzv5Rg1OXZ
         G3QTTHzL+CI/7SbdjMo7Kzn7lvuRaRktkVWzwWz7x1gDd+2AC6X162GeDXvRvPGO66hW
         nb4Fdei9I7Cs+mGkptdSXDIua9FtF2bpyyPkRo3tGQyFAkaO8tGdRwHCSkhQdtvP6u46
         W6+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778658183; x=1779262983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHxD8ulL+nhXoYBdoXHqSUJw6ZXhv7NDTmurojxJmow=;
        b=EhG2lroRf+PTWcATyWRe5DdIeQCQbg9z4Ptqvk21qtghnUqcbuDiSyZpFOtd8yGEzu
         xzT/us4yUexLinXoWouo+f6vZkuUcvFB4yEkq35uoy21rVU5hJKyMMJTz4UU6jzyM6j3
         a0kGYNPSPZPCQQlY5E4gc4QgdLO1BSzdEfDMq8oQXdmhm1qI/+TBsrq56+M/DZAZOoDb
         JiKfogaMgiF4Xn2DgZkDtJV7jbMCbWbWvMXMLpBcT4ZEhQ0MGHFKhygkyIZInwhyJmkt
         floJ7r/EsvUm4qoM5iceNGDgDyJULfmjWv7n3xzPxyZWWP/X/slobG+wfEqglSe6y00h
         WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658183; x=1779262983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YHxD8ulL+nhXoYBdoXHqSUJw6ZXhv7NDTmurojxJmow=;
        b=Gs0i+0l2ZjRvKdnXDDZqJ7B9OXLeY3apFLMW86lplLrRN2LK66mwQrzFk7e07UD8/Z
         /Y3Gq54xf5n1PP5wJjLFE8ncEoLc2szU/ipPpuN1fI1fny8gB3kC4idQegEa6vUpjYp6
         ActbcLIFL3MPiM7+6R3ZHR9QLhrGl1AtG4NXc+oVUtgc/vH3rfuWobq7/BDWSzlSme5j
         TF5bkvmV9PRlJWbpdQSckowYeRt3rT9Pj8QXHpL+RZWUs/i8dBq0ryYlq8KkoDR2n4nU
         2Piz0QK1zeQzmTH6r07L9KUJGK8U0XkUU5Yy1wcfJUnHPWHh0NwqlFqG2jXA2uhj5bpH
         9xYA==
X-Forwarded-Encrypted: i=1; AFNElJ8oBwnVV2Gl1D/4FuQG4S0yB3jZfAjmEUn+yE0VpR5jkaA5BJ4R9fqHuPAHQZW4buqlHtFQ0w/Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TY3zM3eYFzq13ogr2cHAqnovw+X5Nal8lCgKmIIsYW77WtiO
	gUzqrm/llHTBXE6QmLtBVjcn5pWk+SDsKPkfnkgNtMNK0sP3JJhLoPeZvExz/vsehGe26PU6qOG
	F9YVhxawOAa5vObhZDmCYEkJSNsJ33PEAiIR1IDNY4A==
X-Gm-Gg: Acq92OEdrX2DUL7Foxz3rgasHYz6reb8DFnU7Fk3W9/GGbIKNP+2Z7VfrI0YU/FLB1l
	YacSCW1ywzNMpt0470u5aOmFLOVEA3FWwDLPGKs6xL0DYMtbxAaSP20jBJmQG8sWmLkZ+B3TooR
	fOCLwteHk/NaZo+VUMVG4At3sgXS5SejiuCjnynd2s+V8DFhTiOXu2+8whovnEFgEqOk9zB5+l+
	FJQn+AoCO9/maRpu+1kG/vFlCik5edwIfSWCEh9raxhl3e0f7UxQm/TisgmZI2I2SYhD21634An
	PTR/W5Ni8KOn00h7gFOz6ZwIcR1pLnMicIov5A1GLvdL+x9WY4AczijenfVtiK0/BVy16u0Lfnp
	4duQOcs+V6z6GbxPwoNeu5Hs5vA==
X-Received: by 2002:a05:6808:c191:b0:479:d467:1a26 with SMTP id
 5614622812f47-482b2dbbaacmr1555669b6e.43.1778658183375; Wed, 13 May 2026
 00:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260513071418.50957-1-dave.patel@riscstar.com>
In-Reply-To: <20260513071418.50957-1-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 May 2026 13:12:52 +0530
X-Gm-Features: AVHnY4KIkKPxXFm3WnF86YmuexXhI19nTr_cFRk0X2eDmm53eQjKUwscm_01NOk
Message-ID: <CAAhSdy0D6opyLUCpHKg9cOptYgdVgrXbyacMMSHoOKhV7tkSRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching support
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_084307_252723_554F2088 
X-CRM114-Status: GOOD (  11.16  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTI6NDTigK9QTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPiAgICAgICAgIFRoYW5rIHlvdSBmb3IgdGFraW5nIG91
dCB0aW1lIGFuZCByZXZpZXdpbmcgdGhlIHBhdGNoZXMuCj4gRm9sbG93aW5nIHlvdXIgcmV2aWV3
IGNvbW1lbnRzLCBJIGhhdmUgbWFkZSBmb2xsb3dpbmcgY2hhbmdlcy4gQWxzbyBJIGhhdmUKPiB0
ZXN0ZWQgdGhlIGNoYW5nZXMuCj4KPiBUaGUgY2hhbmdlcyBpbmNsdWRlOgo+ICAgICAgICAgLSBE
cm9wcGluZyBDT05GSUdfU0JJX01BWF9WTEVOQiBhbmQgc2JpX3ZlY3Rvcl9kb21haW5faW5pdCgp
Cj4gICAgICAgICAtIHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgdmVjX2N0eCBpcyBub3cgc3Ry
dWN0ICogaW4KPiAgICAgICAgICAgJ3N0cnVjdCBoYXJ0X2NvbnRleHQnCj4gICAgICAgICAtIGNo
YW5naW5nIFJFQURfQ1NSIGFuZCBXUklURV9DU1IgdG8gdmNzcl9yZWFkIGFuZCB2Y3NyX3dyaXRl
CgpJIHRoaW5rIHlvdSBtaXN1bmRlcnN0b29kIG15IHByZXZpb3VzIGNvbW1lbnQuIFdlIGFscmVh
ZHkKaGF2ZSBjc3JfcmVhZCgpIGFuZCBjc3Jfd3JpdGUoKSBkZWZpbmVkIGluIHJpc2N2X2FzbS5o
IHNvIHVzZQp0aGVzZSBtYWNyb3MgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyAgdmNzcl9yZWFkKCkg
YW5kIHZjc3Jfd3JpdGUoKS4KCj4KPiBJIGhhdmUgY292ZXJlZCBhbGwgeW91ciBjb21tZW50cywg
cGxlYXNlIGNhbiB5b3UgaGF2ZSBhIGxvb2sgYW5kIGxldCBtZSBrbm93Lgo+CgpSZWdhcmRzLApB
bnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
