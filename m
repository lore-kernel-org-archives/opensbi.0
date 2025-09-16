Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DACCCAC592
	for <opensbi@archiver.kernel.org>; Tue, 16 Sep 2025 04:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkK+y7yRpdHNgbi6xNJNubvH7mIPiScwWv5eQrmRkrw=; b=a3/VnPqfj5FZB7
	BppqkQV9IdB1tCYSozQs7MUhc17xj8i8nheMdAYr1YITuqBVKZ+ShF/iHgHT5ZotAdE7paGzcPLHS
	h2OwF9itwz0MRxEw6wNkwBYuFjGRvsHCHj2yaSeaBc9xcHfx3S4HCvxxP0NPs+AhDIqYMF1sl8ajI
	DD9aq+BbhDEeiOgicD8X7CH49eXb36mhnLQcHwBxHbzYYSeHrFEUuPa4Ivm4ahKzLzG6yxEmsDinp
	0coNNN36KltIbIQ1lfa9yTvw3C4h8tbgANSA/kfWxDi3AHejYkjsWZcZewvUQaa+zJIpmXBQ5AapH
	dRNP5KzuNgxDXvsWaKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNVO-00000006iHb-2AZz;
	Tue, 16 Sep 2025 04:41:26 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNVL-00000006iGB-3u1i
	for opensbi@lists.infradead.org;
	Tue, 16 Sep 2025 04:41:25 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-893661db432so64119739f.1
        for <opensbi@lists.infradead.org>; Mon, 15 Sep 2025 21:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757997683; x=1758602483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18QOGTAlcDXTk5yAyUTgD4is0kdHBSUu9JBdZe7pVhI=;
        b=Em2/K4v38SaMhIhBXK7PJA/l8RNeDMx1dY0UK1oRKm4rH/TShPHjGTPKQznt9r1TY7
         rBwHioxxDa1YCSgdSzuTsjNhG8RO3Cb2r+dKTRQgev8Exv0UsZhJv4LeBysFI9WmyVqZ
         Lgvng4W90yby/sWhR2C9vrXJX+4wo3gn3afJP1dBpv2RQppISaYvwYM7cnD0idFEsie3
         /bdrSRE0f4dvgXi5q4sxMPY0uY0CYhCjVE2q8LjzXtvtl4v+7ie3CFN0jUNC57oMh/Bz
         MFD/fhJ8OesSeqFJwmecqWNILI2g4rDYw6jmPW5Bmv09wc7RYfl46nEP4zVrcn+U8/lq
         7vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757997683; x=1758602483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18QOGTAlcDXTk5yAyUTgD4is0kdHBSUu9JBdZe7pVhI=;
        b=EBW7sSlb5iDfg6IN48cTvopZNgPaHgogybEwYNWnCdaCq+zC6igGuQQ7KPUyKGJ6ZH
         dqZFQfpqm6NMYVAjPhSQGWsqsPfqV7i9VCtXYgAIoBEm7UmugagYLQgc2zXapx5MOSiI
         +HXYTfQFNrn1NDDKIZCCrCcLe/kSEQGjYxHNL19MYT7IrtgegnAOsfwwKP7C3WxpUPay
         t1sYCKsrPZoUT9d3ZvL7839YIERjZ5lvQGfNlcbnRBDBCO4Xto+9G0OYY2fpAiwlm2/6
         KrO5g5HP6FZMhaTt9S9CHhlZKAcgwVHgIjjdjHjw4rvI2G16/dt5nnmGRnPhBYSGEVj5
         seVA==
X-Gm-Message-State: AOJu0YyMmeDGlmeutFl4+CgJXxyrY+WdaM+fTRJFV4I86rfmDxdYVMOq
	i6LbcBTD4f6h8QEoYPmAKrgIurQ6xYkFMuXlk6j9Je3mexVz6mLrsnJH1oO1ioBH7yYO1KF1zlp
	ULTRb4EXyD5ApSN3O+jCzJAG+lCRoH3u7ckn47AvnJMm3LaEfuJG2wjc=
X-Gm-Gg: ASbGnctTcwKvAWxVnARKkhYVS09pGl5CZNqhqsjfn5ZMxm0HkVsO/t8bW/IOp4xfmRq
	V8uqFBhCpt6Kabai68HiKdxhD+AXJbVSak7pni3uMaspPyigRoC8Z0l0+Hzq2Pdh3GAKHqGg7qV
	CQgvru5AsYcHoV4mlqYh54mX0Jql6x3hipcx9HQXb4oV42XutbpclQHY0ksPPeXwXdBWih69od5
	aC4kF5/5OSvfHM0dPyrBbjnMIhANFgemIHZbS6i
X-Google-Smtp-Source: AGHT+IGTwFQ7qcV6ZDLbl1X9OspU/4N7lyosFB+HX9o2/S+cBGmSVG/u46WTcn0ZQRWyzeDKi/ihh056/l/InIbuCJA=
X-Received: by 2002:a05:6e02:19ce:b0:412:fa25:dd4e with SMTP id
 e9e14a558f8ab-4209d40ff57mr142112465ab.1.1757997682954; Mon, 15 Sep 2025
 21:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250908055646.2391370-1-samuel.holland@sifive.com> <20250908055646.2391370-2-samuel.holland@sifive.com>
In-Reply-To: <20250908055646.2391370-2-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Sep 2025 10:11:09 +0530
X-Gm-Features: AS18NWCFh3TGWm5kbPmgnos0UVhB6WzExMBDl5PWSLpYXztzEdgoiKCkZfu4DnY
Message-ID: <CAAhSdy3ApegWiQ6v8-1pDBE9S1+PUkk_EjEK7aeXs8YLKXGPyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] lib: sbi_hart: Do not call delegate_traps() in the
 resume flow
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_214123_972820_FA1F140A 
X-CRM114-Status: GOOD (  16.69  )
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

T24gTW9uLCBTZXAgOCwgMjAyNSBhdCAxMToyNuKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBvbmx5IHB1cnBvc2Ugb2YgdGhpcyBm
dW5jdGlvbiBpcyB0byBwcm9ncmFtIHRoZSBpbml0aWFsIHZhbHVlcyBvZgo+IG1pZGVsZWcgYW5k
IG1lZGVsZWcuIEhvd2V2ZXIsIGJvdGggb2YgdGhlc2UgQ1NScyBhcmUgbm93IHNhdmVkL3Jlc3Rv
cmVkCj4gYWNyb3NzIG5vbi1yZXRlbnRpdmUgc3VzcGVuZCwgc28gdGhlIHZhbHVlcyBmcm9tIHRo
aXMgZnVuY3Rpb24gYXJlCj4gYWx3YXlzIG92ZXJ3cml0dGVuIGJ5IHRoZSByZXN0b3JlZCB2YWx1
ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhh
bmtzLApBbnVwCgo+IC0tLQo+Cj4gIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDggKysrKy0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCA2
YTJkN2Q2Zi4uMWI1MGY2NzEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysr
IGIvbGliL3NiaS9zYmlfaGFydC5jCj4gQEAgLTEwMzcsMTAgKzEwMzcsNiBAQCBpbnQgc2JpX2hh
cnRfcmVpbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgICAgICAgIGlmIChyYykK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+Cj4gLSAgICAgICByYyA9IGRlbGVnYXRlX3Ry
YXBzKHNjcmF0Y2gpOwo+IC0gICAgICAgaWYgKHJjKQo+IC0gICAgICAgICAgICAgICByZXR1cm4g
cmM7Cj4gLQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IEBAIC0xMDY4LDYgKzEwNjQsMTAg
QEAgaW50IHNiaV9oYXJ0X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCBib29sIGNv
bGRfYm9vdCkKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+
Cj4gKyAgICAgICByYyA9IGRlbGVnYXRlX3RyYXBzKHNjcmF0Y2gpOwo+ICsgICAgICAgaWYgKHJj
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICAgICAgICAgcmV0dXJuIHNiaV9o
YXJ0X3JlaW5pdChzY3JhdGNoKTsKPiAgfQo+Cj4gLS0KPiAyLjQ3LjIKPgo+IGJhc2UtY29tbWl0
OiAxNTNjZGVlYTUzNTA4MzdjMTIwNmEyZDJiNjE4OWZkMGJhMDZkMWYyCj4gYnJhbmNoOiB1cC9t
aWRlbGVnLWZpeAo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
