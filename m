Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ED8CD4851
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMUDWABmanBeG+1IDdrPezS2hBY1suwJ3V8ge85Dz1A=; b=CUJFaXg5GxKWZT
	9NuNkA10ISxp80O5GPEmDUVs2RcPEoNl3fr8k8ptxIx0a4CAuAYpZ2axYogP5c4AQ5wDy9wfuzvuH
	VTWpoIlL0Gz0Pts6fZITixgI+8clEZtMquQGNe5re1LPozTQzO8uGZh7h2utdMR0C38ZWCxZ4x/oT
	XnGt0v4KGeKELbucYQ7pEox38tS7y3HQR0QmTEmBE9ewXuO2M8tFu/1JdU7HEH1hAxADQ31Cgt/vQ
	XFU5Ql8k+IOgrfmTo3yhjRsHkGCvg7gZwpzqehRdWSkwjpJVSkCnZbWjzB+dhT4eh8jYMuS0ZoFK6
	IBNJjTEM6J0f4NMnjlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpNm-0000000HGuM-48Kl;
	Tue, 12 May 2026 15:50:54 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpNk-0000000HGtr-24F4
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 15:50:53 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7dccb8644c4so2929879a34.0
        for <opensbi@lists.infradead.org>; Tue, 12 May 2026 08:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778601051; cv=none;
        d=google.com; s=arc-20240605;
        b=RXaXOrY4RiZD6IAfhBHHZ4OkZCt3Ewi8MzG2r/+kehFtA+r2gHotMVPQOpsoUTEOsp
         EelKRRTJJtW8h/q2ft4IIs2EwNSyWmVMod4ymjGiHbN31KoJlb8CaIeRL/Sol2dZPA47
         12AbCCAsEi27DatVVsffjKqYIbAClgqstyKJC+6pk+JiFD+xh9ym/9QVr5e6PXqb++Bk
         GYnHsteGBlS9L+GOlMKqTBnDjSCJSqZgOHrZlwA2FW3HFaOuUrgKZnJvXBTV1VDSO5cm
         zL/HnuMMRSKbpAuKZ2WjVYIwnqp4a8KCrZaXZ54M7gVoZ1Pa8UIqCa900bqsPk/HVUT8
         BHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBhSXsCjtFjHz1OHvo0sfdo/fe20za1kPXbf5+ywkNU=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=i4pL+5wzu5xFlcYGCZAv/GZLca1GyajWHIwvYfbwQMZdjCb9E77d9xxOhIYVEHSYZz
         tAWXCYjf3NRQ0qTH3mJayC8dz2UILr0nxYdk/j/fBOFJOQzLnLvsf9XRmMrBIQ9qU8e8
         VRgTunyWa8F4MfmyZlvAenjjV68+VJcnGxjMFwgTALMXFY8ZBHyr9Ox1xVq6hm2qlGtb
         pAZxrXuxt1ykO30AciEw5o3ITMCwCFcqMaBq/nLpRz+scU9ogLVuX50Xt1eOVSq4dlVi
         kn6lU6Vk4hGyx126sO2tXclT7rfC9nz57dybDt/rQ5qp0p/vwmT+LCP7LcS628doOrTt
         1TWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778601051; x=1779205851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBhSXsCjtFjHz1OHvo0sfdo/fe20za1kPXbf5+ywkNU=;
        b=dghggx5rf2Um+02p2nINLQu+m5aUsK3//p2GC+PESUyFRzCOxmoOIwTz7jvab8IA7i
         vh6vjpA8LSeyndRg1OdnYgyzNBfteGi5yNBAjTMkbxUmzuAUvTs39ko7g/4ANjTKsNLh
         OzUJvI+JtNF6wQkcD/u2uoJ2ru+kvaH/OrrcdvZOcQgfQ2sscqtM3Luo7WxRvFDrdp56
         37DXbvtwrJjGB1zacwXE6Ct3n95RXfMC5DpzNieXymIaTTkuAn1JUi47h3/sWBt+Sjvo
         PHWy+VJ4ZFCUoFfD1jZPXBKBCtGjhwkXuDrXOJM4cVwqe2DaC9f5M4QNDq71gIX7ii0W
         HSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601051; x=1779205851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBhSXsCjtFjHz1OHvo0sfdo/fe20za1kPXbf5+ywkNU=;
        b=Mn3hz5r5KBtNSNcCdbjATwQl3UqWuf1leoT1Px2y++RIz4RyHBKeL5rVfUQfsWNIXT
         NL/o4o19lNdiSdcLEXXLHJRANzmmnASKB+/reoYL5Qt1P1qSTtYMvB5ZhDbRS5YtCLIC
         IzYmjYCmpKyp29Rja14cIFYnuzPTiJ8JnxmAghXTdsdjFJGh/6O+kdbcUj6M7aP0xLCr
         Qsb7I5N53QWJlTd2oQNnA7JdTpx2fTUV5FkvlUAHfNcxtlhhEAlPOwpI0UxnYubGwOLy
         t9boZc1zRcwi21HUS2pKpKk/tHHFVdP5kKyH01hmG6/7yDTv5jX7mzXW9WWyOHmYaUKT
         QzJw==
X-Gm-Message-State: AOJu0YyY57y3ZINqpxC01NfNUSskSZMd4LhVmmkhCVgSx50NC8VG/SBC
	v7Zy0idMaI7FnUD4ZaZPgWogmjBcO3ITjpsj8c1Dgj9iRRIMpGffHM2YY5secUVuDL27kkkZPXX
	y2b3v7qfU2y3EPuy3CC74YsToDdlZLoa2SVg7fNDafIINK090M6jR9b0=
X-Gm-Gg: Acq92OGP1iwMP0SqvEMM3ae9Sy0BrdDuAE+E+IXzI1Cbs6eK2mxly1EPJWyBY+JTm0g
	szNzYsrowxLv/09h+9244lZuG350fjQi1rljckRoNNs6s4a5C422Z3wu5UfTdv4guO3BhOB2J1S
	3lJibPivltI5OSaiT7WjXn6FJ9prR8UGTOK22JKZXdgxT2odiedc8T6PBcLhEQBSZ7Elb1fnVKA
	0QnjUrtorD1FqAxNEALLhZnIV5UAIiXUK1Aa96ebmuW0450FimpiWaUpguEyi74VQkKr+xzwPPr
	rgbcBWI/ywGxn0nZAg0uwuRUPemJjbh91+Qc4//lja7aIHiUihLCtKzuRHfDCjtnY9gf4rOIYUU
	f6vRDoHsXK/g3fUuzHnuJtoyT/w==
X-Received: by 2002:a05:6820:1c9a:b0:696:233b:20fa with SMTP id
 006d021491bc7-69998c8f453mr15148696eaf.1.1778601051512; Tue, 12 May 2026
 08:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260327043357.3452008-1-peter.lin@sifive.com>
 <CAAhSdy2P4D41w5fM=gYwn8ObRjUW3D5p_rdc8EMB7qFa_n-U4w@mail.gmail.com> <agLjlvK9ZQYrvPjr@plin-1878>
In-Reply-To: <agLjlvK9ZQYrvPjr@plin-1878>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 May 2026 21:20:40 +0530
X-Gm-Features: AVHnY4KhtiWEYH_LpzG8n5BoEjfbnhzDXM9W1TQbpGdsd9bmFlhGuINhxUgP2MY
Message-ID: <CAAhSdy0QLe3jjtdAZDigyd9Lizk=AegU3r-pSstQsdFj_MmB4A@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: fdt_domain: add support for root domain
 region inheritance
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_085052_669164_742AAF1D 
X-CRM114-Status: GOOD (  17.72  )
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

T24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMTo1M+KAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IFRoYW5rcyBmb3Igc3Vn
Z2V0aW9uLCBJJ2QgbGlrZSB0byBkb3VibGUtY2hlY2sgYmVmb3JlCj4gc2VuZGluZyB2MiBwYXRj
aC4KPgo+IE9uIFN1biwgTWF5IDEwLCAyMDI2IGF0IDExOjM0OjQ5QU0gKzA1MzAsIEFudXAgUGF0
ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIE1hciAyNywgMjAyNiBhdCAxMDowNOKAr0FNIFl1LUNoaWVu
IFBldGVyIExpbgo+ID4gPHBldGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
QWRkIHRoZSAicm9vdC1yZWdpb25zIiBwcm9wZXJ0eSBpbiBkb21haW4gZGV2aWNlLXRyZWUgbm9k
ZXMgdG8KPiA+ID4gYWxsb3cgZG9tYWlucyB0byBpbmhlcml0IGFsbCByZWdpb25zIGZyb20gdGhl
IHJvb3QgZG9tYWluLiBUaGlzCj4gPiA+IHNpbXBsaWZpZXMgY29uZmlndXJhdGlvbiBmb3IgZG9t
YWlucyB0aGF0IG5lZWQgYWNjZXNzIHRvIG1vc3QKPiA+ID4gcm9vdCBkb21haW4gcmVnaW9ucyB3
aXRoIG9ubHkgbWlub3IgZXhjbHVzaW9ucyBvciBhZGRpdGlvbnMuCj4gPgo+ID4gT3ZlcmFsbCwg
dGhpcyBpcyBhIGdvb2QgYXBwcm9hY2ggYnV0IEkgc3VnZ2VzdCByZW5hbWluZyB0aGlzIHByb3Bl
cnR5Cj4gPiB0byAicm9vdC1yZWdpb25zLWluaGVyaXRhbmNlIiB3aGljaCB0YWtlcyB0aGUgZm9s
bG93aW5nIHBvc3NpYmxlIHZhbHVlczoKPiA+Cj4gPiAxKSAiYWxsIiA6IEluaGVyaXQgYWxsIHJl
Z2lvbnMgZnJvbSB0aGUgcm9vdCBkb21haW4KPiA+IDIpICJzdS1vbmx5IjogSW5oZXJpdCByZWdp
b25zIGFjY2Vzc2libGUgdG8gUy1tb2RlIG9yIFUtbW9kZSBmcm9tIHRoZQo+ID4gcm9vdCBkb21h
aW4KPgo+IDEuIERvIHlvdSBtZWFuOgo+ICAgIGEpIGFueSByb290IHJlZ2lvbnMgdGhhdCBoYXZl
IGFueSBTVSBwZXJtaXNzaW9uIGJpdHMgc2V0IHJlZ2FyZGxlc3Mgb2YgdGhlCj4gICAgICAgTeKA
kW1vZGUgcGVybWlzc2lvbiBiaXRzLCBvcgo+ICAgIGIpIG9ubHkgcmVnaW9ucyB0aGF0IHNhdGlz
ZnkgU0JJX0RPTUFJTl9NRU1SRUdJT05fU1VfT05MWV9BQ0NFU1MoZmxhZ3MpPwoKQWN0dWFsbHks
IG5vbmUgb2YgdGhlc2UuIEFwb2xvZ2llcyBmb3IgdGhlIGNvbmZ1c2lvbi4KCkkgbWVhbnQgdGhl
IGN1cnJlbnQgcG9saWN5IG9mIGNvcHlpbmcgc2VsZWN0IHJlZ2lvbnMgZnJvbQpyb290IGRvbWFp
biB0byBub24tcm9vdCBkb21haW4gd2hpY2ggaXMgb25seSBjb3B5IHJlZ2lvbnMKd2hpY2ggaGF2
ZSBubyBTVSBwZXJtaXNzaW9ucyBzZXQuCgpUaGlzIG1lYW5zIHRoZSBmb2xsb3dpbmcgcG9zc2li
bGUgdmFsdWVzOgoKMSkgImFsbCIgOiBJbmhlcml0IGFsbCByZWdpb25zIGZyb20gdGhlIHJvb3Qg
ZG9tYWluCjIpICJtLW9ubHkiOiBJbmhlcml0IHJlZ2lvbnMgb2Ygcm9vdCBkb21haW4gbm90IGhh
dmluZwphbnkgU1UgcGVybWlzc2lvbnMgc2V0IChjdXJyZW50IHBvbGljeSkgd2hpY2ggYWxzbwpj
b3ZlcnMgZmlybXdhcmUgcmVnaW9ucy4KMykgIm5vbmUiOiBJbmhlcml0IG5vIHJlZ2lvbnMgZnJv
bSB0aGUgcm9vdCBkb21haW4KCj4gMi4gRm9yIGZpcm13YXJlIHJlZ2lvbnMgbWFya2VkIHdpdGgg
U0JJX0RPTUFJTl9NRU1SRUdJT05fRlcsIHNob3VsZCB0aG9zZSBhbHdheXMKPiAgICBiZSBpbmhl
cml0ZWQsIGV2ZW4gd2hlbiAicm9vdC1yZWdpb25zLWluaGVyaXRhbmNlIiBpcyAibm9uZSIgb3Ig
InN1LW9ubHkiPwoKWWVzLCBGVyByZWdpb25zIHNob3VsZCBhbHdheXMgYmUgaW5oZXJpdGVkIGJl
Y2F1c2UgdGhlc2UgYXJlIGZvcgpPcGVuU0JJIGl0c2VsZiBhbmQgT3BlblNCSSBpcyBhbHdheXMg
cmVzaWRlbnQgaW4gYmFja2dyb3VuZC4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
