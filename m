Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282D7CCFA1A
	for <opensbi@archiver.kernel.org>; Mon, 10 Nov 2025 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0r0Dw62VksFFh2R/qxhatUvUanGsp6ZRymAJAs7DNY=; b=Cm8PmercJ2FmqW
	oCHh2D2woMoHCrclUBdx4y+qqpgLoDXS9ADUDBvUT95DHAXog0+PqD2RyN9y9a5+4YOuzHlxDbpRd
	AKtGyH8gAjBXFIMBRJJMT9aF6FiryT2W2jHjvmgkOLZlkU2mpfNbqpuRE6CG1V+bjt0sJ0N8+CLjA
	NuW1RzlWPFRZtpkmoBdpebWfuLfyCIRp7sXN1NA5sXoO/ID6I4PTd/Q0JAeP4QWuWXt2Igl7jLSYw
	Rzbtx6xSES8wmjLp959zeu/MG1nEMiocvEhJ5HUQbBysDurnrdNtFy0Uv4B28R+tiVWqvh58N+aZW
	qfY6khGlqM/Jk71S7iuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN7X-00000004yAR-44SY;
	Mon, 10 Nov 2025 08:19:27 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN7V-00000004y9f-0hqj
	for opensbi@lists.infradead.org;
	Mon, 10 Nov 2025 08:19:26 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-4336f492d75so7236805ab.1
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 00:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762762764; x=1763367564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33OBgNIIPH5E/kgcBnv9i5EoQjihgrj72bQaojGtI0k=;
        b=uHJtoNsFvosYNRsHlntvkHzC1yYc1GhBuOMz3pLeYgpTVjP7RpDkRd5+nqV+y4Qcuz
         mjIFNrtM3lOXFe1zDnIq9DhaimUY+RdhiNyAy0lzJdXyuhxpLQmyl4XhzlDSC5mQ5ltV
         SiUZJxcD2QLrugR2bUPlc4UFkZ2iwCY763HtLs9gWW03v5hBUQfyAJdZPFITfpir0sKh
         FEiePVbThhxDSbTRcl0chmv+N+NvOR9dAFok2CA8thrFxJ34Q2+vydTSodEdsvbpLe/2
         8IHEj3cay2m47Wa9EP62Gzv0z9YCjOp/MYWZ2MptHPXkWAkBk1RcQrwD6VkkhenXN4Da
         AGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762764; x=1763367564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=33OBgNIIPH5E/kgcBnv9i5EoQjihgrj72bQaojGtI0k=;
        b=Qyq1JjSdNUTKQdFJBJEWV1lUB/iN8Gp+vCPFHv+mYjP9vspwhkmjnOAn0QMqZKVpl0
         V1dZMYTRWBJoNCa0AK9EfqVBuFerAq/MVwRF2SIkhXcXebNclmY7R5I/TbOlNDqrOy0f
         MBofBPkEECisOMPgRnJfn9+SydszawAVlsCFzWaHPzJyBdYxLY3aRoUdPPyhZAI4T27X
         yrKW8yI3b2hpNJ/qzFWlji580IwPVtWNkrrBYkk6Uz4VxfuMjCD9/JCcJa9h7+zp/xC4
         iEXIXhWisSND6Vsr8cD2/r6nTXMUQJWl9OuZNRylAeREx41DCpN2JAE07K91lRyIB2zR
         7Osg==
X-Forwarded-Encrypted: i=1; AJvYcCUMKWQogiMpz1G6xJWLZE9H600MWW6AJZMB0phO8ezRnh8U5TTVA46aIJ7fLGkLZaqWh5G1V57r@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7bpqEtqd454UkwHTvzt8EUZTsEhAkcCAxdBj0UkuFIctswWQB
	NmWOSZBMGZOnh9fp7bdmWJbHMv5LaNOh0wMGD4EJ3FFlgYwdd5VJ51PuIDupYJX9dtfxpRKYRzP
	BCLksmP/dwS/mmwEdWb5IFT9zs4fncUTGOZwXjn2czA==
X-Gm-Gg: ASbGnct3mHF2FUdG2VHG81lY5j5XO4S6cAXxi3mJYvHbCt+Pcv7JvhYgL0ql//ip9wt
	JlbjXRhaytiXDIbvxFypSgi5UhPPm5AbHmmXjAVzmyYoilFOxIbnOfVVIAv9TK7nb9ChSi6MyIu
	pl3wJQztoCL/8YDfanE3MpEX6n2mKtqaZPHzS3T5PbID7n+IVfef4jxxfxhycy4SuJFPZjm1Y5m
	BimJhcdLcvCZkiHOUw/X6OK7Mh1Y9krwvCifbfrnejHhMPeaharNPYjW3UJOUFDyT/Xye68zX1C
	321Xv7FanNyUiBMbt+v/eIdFZrhs
X-Google-Smtp-Source: AGHT+IH8loqcvMJP1n+XSROncP59M0kiU0XsPYWPvp1vOa/oHEoB4yBAaJnoAm+cnzpFZnaco8g3RBUHHewDuf65r1c=
X-Received: by 2002:a05:6e02:240b:b0:433:209d:fede with SMTP id
 e9e14a558f8ab-43367dd9d9fmr103770385ab.1.1762762764248; Mon, 10 Nov 2025
 00:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20251105110121.47130-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20251105110121.47130-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 10 Nov 2025 13:49:13 +0530
X-Gm-Features: AWmQ_blxsuVztTYVqiKjgCOgR-hRF-uR_wdJTHN2PjwpKtfpWS8B9KmvGEg8bWE
Message-ID: <CAAhSdy1O00py_mM0b_RWioHLy8HkEyhHG2vOJ=VAbA-7b9DkkQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] lib: utils/irqchip: plic: context_id is signed
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_001925_210937_7B2A64FB 
X-CRM114-Status: GOOD (  15.22  )
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

T24gV2VkLCBOb3YgNSwgMjAyNSBhdCA0OjMx4oCvUE0gSGVpbnJpY2ggU2NodWNoYXJkdAo8aGVp
bnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEFycmF5IGNvbnRleHRf
aWQgaW4gc3RydWN0IHBsaWNfZGF0YSBoYXMgZWxlbWVudHMgb2YgdHlwZSBzMTYuCj4gQSBuZWdh
dGl2ZSB2YWxpZCBpbmRpY2F0ZXMgYW4gaW52YWxpZCBlbnRyeS4KPiBDb3B5aW5nIHRoZSBhcnJh
eSBlbGVtZW50IHRvIGEgdTMyIHNjYWxhciBoaWRlcyB0aGUgc2lnbi4KPgo+IFVzZSBzMTYgYXMg
dGFyZ2V0IHR5cGUgd2hlbiBjb3B5aW5nIGFuIGFycmF5IGVsZW1lbnQgdG8gYSBzY2FsYXIuCj4K
PiBBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE2NjcxNzYgVW5zaWduZWQgY29tcGFyZWQgYWdhaW5z
dCAwCj4gQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxNjY3MTc4IExvZ2ljYWxseSBkZWFkIGNvZGUK
PiBBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE2NjcxNzkgVW5zaWduZWQgY29tcGFyZWQgYWdhaW5z
dCAwCj4gQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxNjY3MTgyIExvZ2ljYWxseSBkZWFkIGNvZGUK
PiBTaWduZWQtb2ZmLWJ5OiBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5zY2h1Y2hhcmR0
QGNhbm9uaWNhbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVw
by4KClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGxpYi91dGlscy9pcnFjaGlwL3BsaWMuYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9pcnFjaGlwL3BsaWMuYyBiL2xpYi91dGlscy9pcnFj
aGlwL3BsaWMuYwo+IGluZGV4IDU4MWE0MWJiLi43OTg5YTk2MiAxMDA2NDQKPiAtLS0gYS9saWIv
dXRpbHMvaXJxY2hpcC9wbGljLmMKPiArKysgYi9saWIvdXRpbHMvaXJxY2hpcC9wbGljLmMKPiBA
QCAtMTM2LDcgKzEzNiw3IEBAIHZvaWQgcGxpY19zdXNwZW5kKHZvaWQpCj4gICAgICAgICAgICAg
ICAgIHJldHVybjsKPgo+ICAgICAgICAgc2JpX2Zvcl9lYWNoX2hhcnRpbmRleChoKSB7Cj4gLSAg
ICAgICAgICAgICAgIHUzMiBjb250ZXh0X2lkID0gcGxpYy0+Y29udGV4dF9tYXBbaF1bUExJQ19T
X0NPTlRFWFRdOwo+ICsgICAgICAgICAgICAgICBzMTYgY29udGV4dF9pZCA9IHBsaWMtPmNvbnRl
eHRfbWFwW2hdW1BMSUNfU19DT05URVhUXTsKPgo+ICAgICAgICAgICAgICAgICBpZiAoY29udGV4
dF9pZCA8IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gQEAgLTE2Nyw3
ICsxNjcsNyBAQCB2b2lkIHBsaWNfcmVzdW1lKHZvaWQpCj4gICAgICAgICAgICAgICAgIHJldHVy
bjsKPgo+ICAgICAgICAgc2JpX2Zvcl9lYWNoX2hhcnRpbmRleChoKSB7Cj4gLSAgICAgICAgICAg
ICAgIHUzMiBjb250ZXh0X2lkID0gcGxpYy0+Y29udGV4dF9tYXBbaF1bUExJQ19TX0NPTlRFWFRd
Owo+ICsgICAgICAgICAgICAgICBzMTYgY29udGV4dF9pZCA9IHBsaWMtPmNvbnRleHRfbWFwW2hd
W1BMSUNfU19DT05URVhUXTsKPgo+ICAgICAgICAgICAgICAgICBpZiAoY29udGV4dF9pZCA8IDAp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLS0KPiAyLjUxLjAKPgoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
