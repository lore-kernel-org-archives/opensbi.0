Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98397D148B3
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 07:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGDst58WMiFJ6EopDtvrwx1c+sD3GaEJGJms59BCMCA=; b=xJU4T8thep780Z
	W3nWMrosoQZyq/IFH0osFU2Pg9PLEAdSgEC1Cc1wRztoS8GuAjxZnk5YEFS4xKig6L7U7ebSudnFi
	o4UBhv4r2zPzzhm2onfEN+ky2BaR+hfGLPSuCyWlsOFK6ga4ObfKOJopAxn9l/33OC1iyc1Ie8yMg
	Ikdwvm8Y4jsVhoCFPzvO67+jC1+kXJ4LE0qcKeiKnQloFZ+/offlPPe58JpHX+PMbXUEH5B10yOhr
	Uetj0Z0vSTixub24AlXdGYMYTplA5DM2QgYfBJer0LpeWCNrIYwxolACGI5XxxmyJ3yCUg3+CQCsX
	+KO+DhWbVDrmnlJs3FAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkBN-0000000G41q-1BKO;
	Thu, 08 Jan 2026 07:11:45 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkBI-0000000G40x-2mAj
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 07:11:44 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c7533dbd87so2094457a34.2
        for <opensbi@lists.infradead.org>; Wed, 07 Jan 2026 23:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767856299; x=1768461099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGFV7XrEIJrjJ+Jo4e9qlIPs2kE31cuHBBOekTIEngE=;
        b=NW7B7PuWZ3WDWcuu8Vpwk3WgF5YFHb9Sa++yqs6mT6+BRs9Gifhkfn8dO4wmBNHr6R
         +xyevsCggNxXhnoJXMAW+rCqqzJCaYr4rgvbzap1WJVQeJc+5qlN+sk/u3a3Po+Qv1j0
         kH4FekiFvgPQhDC8JL1bbRgZuZQrKzu23MO+1AtO0qYqVN9IZNXaiCQdzkj0FmEqB4WL
         ZhQjt7W4B9wP8FCOV0nMrJNTkTeGRvLoK1vmiVZgM1MRiGR6RBXV39WLZ3SjTnzJbN7v
         A3A6A3L/wX2eyI0140QYD6vpd7YL/naFaEl1FZkoajNXrXEh5SE3XpPrkG9fh/bkFzh3
         NExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767856299; x=1768461099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGFV7XrEIJrjJ+Jo4e9qlIPs2kE31cuHBBOekTIEngE=;
        b=XD79LLN+18HGieZJvz+SJtXR4EWePTVV3oc1GasZUAHVQNMO3B8JuZluM2HFpH4OdT
         2CO/TDgaWCqDxI68nr7P/GCGiNP/K+1fPJ9YxD9BQwNZnS2D04Bah92Lp2/FNUNvlHC6
         5eV2qVqnl/9WIxzPKJV40im3CZiF/zqVMMCCEb1qD/vT3qSUErXJNd+gXlRrPoD+7MWY
         39v8d5NMZ87uD4M1bsg+jEGDvjdRU11iw16XcBI8cRLoG3xr/8LDFur0va2LGrOM9Vej
         HR7/GlVBtlxcUQM+Bfb++gjzjQKNbqVAERvJfAGlIMy3y632DvWykKH///yBReaUQ/h2
         tU9w==
X-Gm-Message-State: AOJu0YytK54jYUndGrvCo+JmkmHQnZCMcMyFH7k+q9LIJJC+bbB/O8tN
	A4f8nVV5DEiFLb3OqiVvieSiHjM6htv9osMobooGODTd5ZiOmUe3Okilw+FdKAAi92cJ65oYCWN
	jRUKx6RaIGitBMdAiHZ16bNw0nn2ByAlGEUebIHoRXOJv4uSPNPMuLfQ=
X-Gm-Gg: AY/fxX7rq/AG/1zInGdUtJSGNsy0oxw/0bMecJIXJhz4pTicux2PBfHo+9/0D7jdFTq
	4VBdEprhcY6WULhhfEWefNSnKNKp+dl8i1/KQgatZivsBTs+T2lNKXGfRNf0Dj9QGjFSErfmleX
	INue7sFtTPknpIsBePYxIRScdZxDwDYDTWQaL3l6PeDzZkS7OCZY1/1UwgHbxtQWah8dPJaoAfS
	LfPNMGatVvrg01zQZchiO5u8Nvz6fEmx1npwlmxMZDj5b6Zq53wQ6nrDmd0UIYjkW9+3MrBkmCb
	YDMGPuZa8uM/aqG8WegQwQdTVo2fP8Lm4SZZQerNrVdMHygkk9SKP65Irjo=
X-Google-Smtp-Source: AGHT+IFGFWcgxnmYV+MdwKDTZ/dCANchIibMYAoCG840NPmzQiCxiUOsuig0vYtnlIEDHZGfbK9OqNXKemvG8+W2ggw=
X-Received: by 2002:a05:6820:1a55:b0:65b:f0da:31c0 with SMTP id
 006d021491bc7-65f54f707edmr1764312eaf.55.1767856298654; Wed, 07 Jan 2026
 23:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20260107032602.1143819-1-ycliang@andestech.com>
In-Reply-To: <20260107032602.1143819-1-ycliang@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Jan 2026 12:41:26 +0530
X-Gm-Features: AQt7F2rxPg9P1ng9EVDunovpsKjvGMTQNX1FKru4J718aeFRSOwajVEs79dNjAo
Message-ID: <CAAhSdy3-WOR7XytXM-3TtVcBRWCJqiQLMC93WgmP-YSXUNGqhA@mail.gmail.com>
Subject: Re: [PATCH 1/1] include: sbi_scratch: fix typo sbi_scratch -> HART id
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_231142_566259_89A06F64 
X-CRM114-Status: GOOD (  14.13  )
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

T24gV2VkLCBKYW4gNywgMjAyNiBhdCA4OjU24oCvQU0gTGVvIFl1LUNoaSBMaWFuZyA8eWNsaWFu
Z0BhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEZpeCAic2JpX3NjcmF0Y2giIHRvICJIQVJUIGlk
IiB0byBiZXR0ZXIgcmVmbGVjdCBpdHMgcHVycG9zZS4KPgo+IFNpZ25lZC1vZmYtYnk6IExlbyBZ
dS1DaGkgTGlhbmcgPHljbGlhbmdAYW5kZXN0ZWNoLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0
aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3Ni
aS9zYmlfc2NyYXRjaC5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfc2NyYXRjaC5o
IGIvaW5jbHVkZS9zYmkvc2JpX3NjcmF0Y2guaAo+IGluZGV4IGYxYjQxNTVkLi41OGQ1NDYyOCAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfc2NyYXRjaC5oCj4gKysrIGIvaW5jbHVkZS9z
Ymkvc2JpX3NjcmF0Y2guaAo+IEBAIC0xODYsNyArMTg2LDcgQEAgZXh0ZXJuIHUzMiBzYmlfc2Ny
YXRjaF9oYXJ0X2NvdW50Owo+ICAvKiogSEFSVCBpbmRleCB0byBIQVJUIGlkIHRhYmxlICovCj4g
IGV4dGVybiB1MzIgaGFydGluZGV4X3RvX2hhcnRpZF90YWJsZVtdOwo+Cj4gLS8qKiBHZXQgc2Jp
X3NjcmF0Y2ggZnJvbSBIQVJUIGluZGV4ICovCj4gKy8qKiBHZXQgSEFSVCBpZCBmcm9tIEhBUlQg
aW5kZXggKi8KPiAgI2RlZmluZSBzYmlfaGFydGluZGV4X3RvX2hhcnRpZChfX2hhcnRpbmRleCkg
ICAgICAgICAgIFwKPiAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICgoX19oYXJ0aW5kZXgpIDwgU0JJX0hBUlRNQVNLX01B
WF9CSVRTKSA/ICAgICAgIFwKPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
