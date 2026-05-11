Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566CFCD37AC
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6131688iXG0sHLQBay5OLjvFUhnF73ec6cPeasGvKE=; b=HDAVxgZcUE1ZZo
	EDhPChwebF14NL+ZeGbre9ogwdypVYR1HBURFYJENYQRzd1qB760jaLvdbTJiRigKLs/tJCckModX
	Klb2hTKlle8EmnRmxxmqCwZ1INIyfTBvU5q/r33P3tvYhVwL4QG7e5LYjMf90xhIFpCLxMu+1GvxG
	ou4cRbvo+rTS44zlYwR2mbZiNG8WOntcds0oz9mq3PBuXz75BnZ4uDBklbHOXsTJN41whezgwGY1C
	aadwGiMDfT8Kw3W4ZwcvK1bm+xSKaSU7OUmk19TucgzMEFn/QPv2ie6gMt9hCWSRYYWRSQWxaqO6t
	LngTO6MCGnhwxcTLyqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLRq-0000000CfHo-1fZ1;
	Mon, 11 May 2026 07:53:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLRm-0000000CfGS-26Jb
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 07:53:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a860667fabso3586736e87.0
        for <opensbi@lists.infradead.org>; Mon, 11 May 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485980; cv=none;
        d=google.com; s=arc-20240605;
        b=QoKi97w3Dr4oPqmmpFFTL6U+/2jMIsh7l+WcIaIsHYg0Sd5ljs9t/OO2fIjp6qYpDD
         nPce7nl/xttj82stYOErheyDVpJjdWK04g6wsiufZPkDhdIpEHqqumaX85JNHh+0Easv
         yCbm+bHctPiWkFLU4dC9/A7h7RNoX6DfiZTfAohqdLcNQBMmCSyDYKCld55fqAmaz5er
         G4QxcYgkz95nkuIbiDL1hteEwfVyCXV4jAglUKptW/c5MURwxMYs1jSh6Tc/C+/ebV2i
         HG66AFSKrJ9mpdzwIcfrDcGYg98746Hrhq/j9d6BSgEEF2E7IgcWNamDuavllvwFG1B9
         nnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qv7y/Vi3oyB0TzqN1YUu8QcU5aio7ijGznWkHvO4vvk=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=RvN0ocg3bDUpqgp00aG0HQPNSqgm25x6EImBJyIlftOWULmx5NfoLlIXBOxZkDM7Iw
         /28m0qLdLd/b076uMvJrzX14RrkxGh2YLvNxo5hw0iNOHC1n7K7KZAlTBqFDVWXoaSq3
         e6+EhaS32ONYfOU9yCfnqllImPrN/GBvueV5o9+YuRid7acxrW6XDeV6b7Obp2kdxJbZ
         fCNgaNgpd1SAe+n/EZ8eUrbqiINM1mZzO52fLhbAdZGvWILfcDKQoK1mCZxfEfwTiGvz
         3MwwKp3lrcZKLZ4t0GQrz4waPfKB+gWfEFnSfp+ZcuUqO20+kTO48AhsRwmNOabtyTw5
         PNRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1778485980; x=1779090780; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qv7y/Vi3oyB0TzqN1YUu8QcU5aio7ijGznWkHvO4vvk=;
        b=LHWgaj28+8KoeK+o/zAtLBQDdlYCsUAL6kVmo6zT0/eDZ9+lf/X86sY/9/daoy9gx2
         5o7yFfYa5Ah+i1bpFRVZ7Ltcl0BYQ/zVOCbUGb8sR2DBcxqNA80i/g1u52nA4o+EULK6
         4xFKv/NQM/yReuHMJOF5FfNYeFhmUD+Ac8NCJjhdr3m6lFOg+guzs79/ZbRqXBqEnUdZ
         o5bJ04Lgt+LYc0RI3u/GUQgREVHcRur1y9ILYTJkgd/854tC8S6Ptm3n1HlxsVs/1e3F
         J4JXm3P55f3LlvmkU3S+GUcmOsUTt9zZdF4C2CVVnA8xE7LJieBRNE+oENy0B5KI3d8Z
         P2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485980; x=1779090780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qv7y/Vi3oyB0TzqN1YUu8QcU5aio7ijGznWkHvO4vvk=;
        b=PBCA5iluryrTmDQpCIlOwFeJ/M92gvssyqzH4JKUxx6M5+wfoct80I8uqjs09zgffg
         QaYsoCTMHOAcZfdz1ob4Pg98PyDYafux0R78yZSKgJwn41l9QJRMsUaGJfbUtZ7qPV3T
         xZO0LQhzDgSca/eoOIY04D2RGE7yn9dUfvnj16RmBsq88wsiFDrwdLV9ruLFp5MyWW9j
         0Xlqv1O/7jyWC4+tNdKv+31kSiPiL/MYu95bFld1uXmzpQIboz2Yj14k7e5Ga7oeeSPR
         ZO80enGOmo10leRpMe1XJMpOLa2Heml2Q3E99EfnY+PwrHEb4TDJ/Eu81UVqzr95eXLn
         2F1g==
X-Gm-Message-State: AOJu0YzejrCgNN7/EIbphgLR3UeHTzm1tIFWiknvWVlI2/FGV6rMovae
	E9XNMOIqjg5h1m7qeOup1eA3DnKSDklzCAG+M+kpYRmJs7HBHcQbiWBrruGDT2NQYDSw9bhf08t
	0mmL0tsgg6TVlHnCmLhT1nz0x99pGD/MSY5ZVGEOLjyioF3wul/98S/k=
X-Gm-Gg: Acq92OFGhm2kVigN927Wbv0sY9Kh6l8JiN4s3IE95HRY8XYjABikNl1ZsE1XhNpc/aL
	VjOg7tqGPpzuzeUuC8UCHjP+0OXt0P+kIXKmsyy+MhvoxNkccP/utlHdGUfnkzhI368MKV0XGN+
	DwdyMwoiJAqf0UAjV/hCZFmf6WPeGOcJNiycXJGKFhPLPtW/IiFTsXWK4MdB14rM/crACMlJpGn
	QRlq+vIhaqOSbpy6ZoEzn856wCf+QmUYDCz1TeG068j5KnOO3YiXMw4vHjhK7J+7dyqQdprnG28
	Q/yGVse7un7yO6yZUFWkhHToySyGdkNQWoNVZCfVPjvb8SW4DiU=
X-Received: by 2002:a05:6512:2252:b0:5a4:b2d:25c0 with SMTP id
 2adb3069b0e04-5a8a949f103mr4347492e87.3.1778485979986; Mon, 11 May 2026
 00:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260403202903.3407945-1-david.garcia@aheadcomputing.com>
In-Reply-To: <20260403202903.3407945-1-david.garcia@aheadcomputing.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 11 May 2026 13:22:48 +0530
X-Gm-Features: AVHnY4LkBzxR6wZ5M5E1p_rTLKnpIvP2JKlqubhISHym3Ja0umZ4xZNu0tRyyDY
Message-ID: <CAK9=C2W7V=fuBXn5CUJoJTZiOTDfmW0mB+58A1+8812X=qQKyA@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/regmap: Fix reg_stride calculation in syscon regmap
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_005302_567389_E221BA49 
X-CRM114-Status: GOOD (  18.54  )
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

T24gU2F0LCBBcHIgNCwgMjAyNiBhdCAxOjU54oCvQU0gRGF2aWQgRS4gR2FyY2lhIFBvcnJhcwo8
ZGF2aWQuZ2FyY2lhQGFoZWFkY29tcHV0aW5nLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcmVnX3N0cmlk
ZSBmaWVsZCByZXByZXNlbnRzIHRoZSBhZGRyZXNzIHN0cmlkZSBpbiBieXRlcyBiZXR3ZWVuCj4g
Y29uc2VjdXRpdmUgcmVnaXN0ZXJzLiBUaGUgTGludXgga2VybmVsIHJlZ21hcCBmcmFtZXdvcmsg
dmFsaWRhdGVzCj4gcmVnaXN0ZXIgYWNjZXNzZXMgdXNpbmcgSVNfQUxJR05FRChyZWcsIG1hcC0+
cmVnX3N0cmlkZSkgYXMgYW4gYWRkcmVzcwo+IGFsaWdubWVudCBjaGVjayAoZHJpdmVycy9iYXNl
L3JlZ21hcC9yZWdtYXAuYykuIFRoZSBMaW51eCBrZXJuZWwgc3lzY29uCj4gZHJpdmVyIChkcml2
ZXJzL21mZC9zeXNjb24uYykgc2V0cyByZWdfc3RyaWRlIGRpcmVjdGx5IHRvIHJlZ19pb193aWR0
aDoKPgo+ICAgc3lzY29uX2NvbmZpZy5yZWdfc3RyaWRlID0gcmVnX2lvX3dpZHRoOwo+Cj4gVGhl
IGN1cnJlbnQgT3BlblNCSSBjb2RlIGluY29ycmVjdGx5IG11bHRpcGxpZXMgcmVnX2lvX3dpZHRo
IGJ5IDgsCj4gY29udmVydGluZyBhIGJ5dGUgdmFsdWUgdG8gYml0cy4gRml4IHRoaXMgYnkgdXNp
bmcgcmVnX2lvX3dpZHRoIGRpcmVjdGx5Cj4gYXMgdGhlIHN0cmlkZSB2YWx1ZSwgY29uc2lzdGVu
dCB3aXRoIHRoZSBMaW51eCBrZXJuZWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBFLiBHYXJj
aWEgUG9ycmFzIDxkYXZpZC5nYXJjaWFAYWhlYWRjb21wdXRpbmcuY29tPgoKRml4ZXMgdGFnIGlz
IG1pc3NpbmcgYnV0IEkgd2lsbCBhZGQgdGhpcyBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAg
bGliL3V0aWxzL3JlZ21hcC9mZHRfcmVnbWFwX3N5c2Nvbi5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIv
dXRpbHMvcmVnbWFwL2ZkdF9yZWdtYXBfc3lzY29uLmMgYi9saWIvdXRpbHMvcmVnbWFwL2ZkdF9y
ZWdtYXBfc3lzY29uLmMKPiBpbmRleCAxMzA5YTU1Yy4uNTljZDVlZTUgMTAwNjQ0Cj4gLS0tIGEv
bGliL3V0aWxzL3JlZ21hcC9mZHRfcmVnbWFwX3N5c2Nvbi5jCj4gKysrIGIvbGliL3V0aWxzL3Jl
Z21hcC9mZHRfcmVnbWFwX3N5c2Nvbi5jCj4gQEAgLTE5MCw3ICsxOTAsNyBAQCBzdGF0aWMgaW50
IHJlZ21hcF9zeXNjb25faW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+Cj4gICAg
ICAgICBzcm0tPnJtYXAuaWQgPSBub2Rlb2ZmOwo+ICAgICAgICAgc3JtLT5ybWFwLnJlZ19zaGlm
dCA9IDA7Cj4gLSAgICAgICBzcm0tPnJtYXAucmVnX3N0cmlkZSA9IHNybS0+cmVnX2lvX3dpZHRo
ICogODsKPiArICAgICAgIHNybS0+cm1hcC5yZWdfc3RyaWRlID0gc3JtLT5yZWdfaW9fd2lkdGg7
Cj4gICAgICAgICBzcm0tPnJtYXAucmVnX2Jhc2UgPSAwOwo+ICAgICAgICAgc3JtLT5ybWFwLnJl
Z19tYXggPSBzaXplIC8gc3JtLT5yZWdfaW9fd2lkdGg7Cj4gICAgICAgICBzd2l0Y2ggKHNybS0+
cmVnX2lvX3dpZHRoKSB7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcg
bGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
