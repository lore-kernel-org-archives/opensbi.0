Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33810CD37B7
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 04:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuIGz81fU8ciBUwCuXjd41wKQ8ddxnu17L7YQrQJZUE=; b=1qk2V7TYJ6VO7f
	tPoFWd03gOduje+uuhqs5vqh2ZDOJJL8vI+6TW3Pl+ifDox9nHWkh5NbSQlBkm7NvicbmzXpDPKwR
	E7kZWgoTNRZr8VAov/R5gCEsi9/kittDOfBVk9RQLOaa2o5gkJKp+jqRQlRCUIOtyskjl3RpHn068
	5osZfjJfVg60G4aMYlSy2ApeOSeXiSSvqzL55CtnrEHczky86Nu0DQ39nrOHZqAg7x8j65GoKJCuz
	LOYN8j5DnTOdoo83UyFqMxH69/30QOX4idlbkaiExLC9udPKZdES3zs58sfoQtU/ucCU4jtYOtBsy
	ALEMAm0+nz27bC+I3CTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIdy-0000000CJ38-1t4p;
	Mon, 11 May 2026 04:53:26 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIdw-0000000CJ2X-22fm
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 04:53:25 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-393c93a01abso32539571fa.1
        for <opensbi@lists.infradead.org>; Sun, 10 May 2026 21:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778475202; cv=none;
        d=google.com; s=arc-20240605;
        b=d7my/PeC2JsHkE2DVgILPf96t3d+Padel0wM7dGMvHgurJ38s4Zh63HsZ+CrFaaDP1
         FVkQRHxa+3LBJe2uPSjVgdoS3eoaDbevCFrupDeyQADB45Bow/pss3bf3UlQXm6KGnWZ
         lmQia/AKV+Uk3QVX4xWai7IVJ9TqmWkskvA+Cs2kT9u3LBD6PmvfatEX06JbtqhjG/Pw
         D6Alto3LBENfSZLjn4TeLlWBub8Ga5nlCp6rLcFaZuaDKvDp30SttEpm05HAIA1e1zC4
         sLr0Am23YSePMgL1FGiSFabexjFGQXZ9tTRxUBqK7euxyjS7jStEIJTeBHQj5pJU9qpl
         gltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jcr16Fe6mPyG/calPPPzdk32SxlZZpdquLrGN2qXt08=;
        fh=wBC0jRIx/wSUw1FCDWXW3SqUCYyQSc+HzUQFRjN9Kew=;
        b=KdFpicQP7dU2YGN2XXLe4m0s0QVB3wmkf23osyaco4daKWrF7O/DmQpdkv7HaA03u4
         3DgzKmNPYMzcW/J2wjfaoRypY6QZ2C9evlEDt9Rwr1dFfNKv4lLlT9XygmdkXuvJlT6/
         2p2uCilehfzDIj5MlAEA50/3lNQ5L79llei4n5jnv0hzJRejmsOQwoGc0fr0VKZzXb7A
         ENCJcSUifKELzpU8Mm+ZFw7Jt+A6cTLvq3cu7h247NLoPNQfWMsTyQgR+0yUHJOnJV3B
         xLEiZ01lr00FXrgwyiJKERAFoOKXt15fqd9Y5rpCn6G7JLNTDMCds5LZQ/EVmFyjqBLe
         nnQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1778475202; x=1779080002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jcr16Fe6mPyG/calPPPzdk32SxlZZpdquLrGN2qXt08=;
        b=FDdafMp40nccQYqRxlnyPMv77++/EO12tAiFxm86p0+CQUVcIgtD0SH47CGnEsoNY/
         Kn2TRAAfD4HoYICGFmNXNSSYHaexzh8sPreogmv4GbloK7wIExTp7O+tTgPcBMW7D7ua
         UAq73OCRnJjMxVO7i+pkstfLnGMUyXmhT0u9Ozfeodp+yMOiVwxowLrzQKLPQzMsOVX/
         8lcYXcrbOFEupBonU4ScdbQBBVy84fmilqY3zORxVAx9z22SRu2L1LJs4PLj/sxh+95L
         6fLKO1px55PYTyW2VoACGUXAQ63zab7hX9y7laVJFS9X7LtxW4sy9oZN4PYWkigfYYTo
         JssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778475202; x=1779080002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jcr16Fe6mPyG/calPPPzdk32SxlZZpdquLrGN2qXt08=;
        b=n9PuXU6OqnU9Iklu3WPTOkzT5nZfEwU8E+HlEvsnppaLXlCEWFyxdqjOpSi53Ald4q
         OldxnKMIu1mhr4/XfWOUCoMGIyC+ws35qVqhDdBOXRW8vl0C5wOn40C6qtQ8Ng+xiYCG
         oLuTU/E01qvtj6uAu23LpPtGptUCFicQv2w/f7JetxASf/OiE+VE4IqZ8PKAA4WNMeKQ
         5pWpHYfXSVTSpy+Oldkek6XSXHqhf9hENYca40U6ceFHypwsWPSXDMQ8JhaTDBWeV0/n
         KuKIErmz93bXI758qCPWLF8IojmxIGzBsrMf9pj5sFdOhp/7hmuAfqc2GcYZPvlGQBAx
         /0XA==
X-Forwarded-Encrypted: i=1; AFNElJ/tQqMgNGsbMCbfMNljX0dBHXUfNPquSbseYyJG9X4tZ5fRq+il0jxmMhuQ83iJHYkebeIEG/Zt@lists.infradead.org
X-Gm-Message-State: AOJu0YyVIiDxsFBP3ep/9XYIRYtu/q3Hqq+nv9cuePH7uXWxSWh8aQ49
	IwIe3vGrUFmh0KLswsAjzJsDOfOQVmaQjKE+EhxRt0ZSy0wOpQ2J7KRe9vRoAwrw9KwYiFz6sZ2
	ZDKwcud+6JHUP5dD4gNpDTXXjc6lbkN+w2kXHCOV/HQ==
X-Gm-Gg: Acq92OH2mUjztkoOJxJNWTUUXBHJjZgdB90K9KVoE5LsAI4BEzgxvr1wmLh9cFvhFlY
	8VQraH6WgzAMi1vEoNrgJa8Lhk4yC7YnIxOs1+fw5xBG3R6i1+Jc0VyB9syipHxNtPM9Xyui57H
	V9eEgMEIN5/N+d9ZsPq8ezHXpgMkpbaJFGvC536QI7jCwCf3UklmyYDln8Z3XUttqo4vw6r/ngp
	vMl5zJbUW3VSSdKkHlBmie29r4oxbVMwHDiT1VXtcAtnSR1VASwECdxxKMlIBRy8oK8UrX4Bcr4
	SPAomLEjWbadVjnJwiRUFR/cNdfaXfbnM0NLFlCi
X-Received: by 2002:a2e:be9a:0:b0:394:1192:5e1f with SMTP id
 38308e7fff4ca-39411926f62mr18263821fa.22.1778475201603; Sun, 10 May 2026
 21:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260509161849.2935816-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260509161849.2935816-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 May 2026 10:23:10 +0530
X-Gm-Features: AVHnY4LNJs4dc8h3haCyWqrk-8ETuz8SBOO4RAGFgbg60W1RYt8CVXya5TFT870
Message-ID: <CAK9=C2XrjHdCkwF-xmHkE2pP98ag=gkU6i=tCqCXK7HncKRfbg@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: Fix LLVM compile error in MPXY client driver
 for RPMI MM
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_215324_550042_90A816DC 
X-CRM114-Status: GOOD (  16.64  )
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

T24gU2F0LCBNYXkgOSwgMjAyNiBhdCA5OjU44oCvUE0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFRoZSBmb2xsb3dpbmcgY29tcGlsZSBlcnJvciBp
cyBzZWVuIHdpdGggTExWTSBjb21waWxlcjoKPgo+ICBDQyAgICAgICAgcGxhdGZvcm0vZ2VuZXJp
Yy9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21tLm8KPiBsaWIvdXRpbHMvbXB4eS9mZHRf
bXB4eV9ycG1pX21tLmM6MTc6NjogZXJyb3I6IHVzZSBvZiBHTlUgJ21pc3NpbmcgPScgZXh0ZW5z
aW9uIGluCj4gICAgICAgZGVzaWduYXRvciBbLVdlcnJvciwtV2dudS1kZXNpZ25hdG9yXQo+ICAg
IDE3IHwgICAgICAgICBbMF0gewo+ICAgICAgIHwgICAgICAgICAgICAgXgo+ICAgICAgIHwgICAg
ICAgICAgICAgPQo+IGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYzoyNDo2OiBlcnJv
cjogdXNlIG9mIEdOVSAnbWlzc2luZyA9JyBleHRlbnNpb24gaW4KPiAgICAgICBkZXNpZ25hdG9y
IFstV2Vycm9yLC1XZ251LWRlc2lnbmF0b3JdCj4gICAgMjQgfCAgICAgICAgIFsxXSB7Cj4gICAg
ICAgfCAgICAgICAgICAgICBeCj4gICAgICAgfCAgICAgICAgICAgICA9Cj4gMiBlcnJvcnMgZ2Vu
ZXJhdGVkLgo+Cj4gQWRkIG1pc3NpbmcgIj0iIGluIG1tX3NydmNkYXRhW10gYXJyYXkgaW5pdGlh
bGl6YXRpb24gdG8gYWRkcmVzcwo+IHRoZSBhYm92ZSBpc3N1ZS4KPgo+IEZpeGVzOiAwYjA0MWU1
OGMwNzggKCJsaWI6IHV0aWxzOiBBZGQgTVBYWSBjbGllbnQgZHJpdmVyIGZvciBSUE1JIE1NIHNl
cnZpY2UgZ3JvdXAiKQo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3Nz
LnF1YWxjb21tLmNvbT4KClNpbmNlIHRoaXMgaXMgY3JpdGljYWwgZml4LCBhcHBseWluZyBpdCBy
aWdodCBhd2F5LgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21t
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21tLmMg
Yi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21tLmMKPiBpbmRleCAwMTYzZDBkMi4uZDcx
NzZhY2EgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tbS5jCj4g
KysrIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tbS5jCj4gQEAgLTE0LDE0ICsxNCwx
NCBAQAo+ICBzdGF0aWMgc3RydWN0IHJwbWlfbW1fZ2V0X2F0dHJpYnV0ZXNfcnNwIHJzcDsKPgo+
ICBzdGF0aWMgc3RydWN0IG1weHlfcnBtaV9zZXJ2aWNlX2RhdGEgbW1fc3J2Y2RhdGFbXSA9IHsK
PiAtICAgICAgIFswXSB7Cj4gKyAgICAgICBbMF0gPSB7Cj4gICAgICAgICAgICAgICAgIC5pZCA9
IFJQTUlfTU1fU1JWX0dFVF9BVFRSSUJVVEVTLAo+ICAgICAgICAgICAgICAgICAubWluX3R4X2xl
biA9IDAsCj4gICAgICAgICAgICAgICAgIC5tYXhfdHhfbGVuID0gMCwKPiAgICAgICAgICAgICAg
ICAgLm1pbl9yeF9sZW4gPSBzaXplb2Yoc3RydWN0IHJwbWlfbW1fZ2V0X2F0dHJpYnV0ZXNfcnNw
KSwKPiAgICAgICAgICAgICAgICAgLm1heF9yeF9sZW4gPSBzaXplb2Yoc3RydWN0IHJwbWlfbW1f
Z2V0X2F0dHJpYnV0ZXNfcnNwKSwKPiAgICAgICAgIH0sCj4gLSAgICAgICBbMV0gewo+ICsgICAg
ICAgWzFdID0gewo+ICAgICAgICAgICAgICAgICAuaWQgPSBSUE1JX01NX1NSVl9DT01NVU5JQ0FU
RSwKPiAgICAgICAgICAgICAgICAgLm1pbl90eF9sZW4gPSBzaXplb2Yoc3RydWN0IHJwbWlfbW1f
Y29tbXVuaWNhdGVfcmVxKSwKPiAgICAgICAgICAgICAgICAgLm1heF90eF9sZW4gPSBzaXplb2Yo
c3RydWN0IHJwbWlfbW1fY29tbXVuaWNhdGVfcmVxKSwKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+
IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
