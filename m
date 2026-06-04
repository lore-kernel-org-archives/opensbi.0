Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5CECD6E75
	for <opensbi@archiver.kernel.org>; Thu,  4 Jun 2026 22:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yQNYGP3MdkqpiwBLNo4mLmjimrVZeZ5fjhjGm1q/rw=; b=exwkJtWKqwPSus
	OV7sjUGGoWaD2WYDr6zB1ghqQKworkR2wVElIaWhmI9YfLO9QRDytN3x07EGBOszJCuwwl31a4whS
	MkEjMW4oOt8W/+f0EDBBALwBoaYh0+NrQ58W3W+P5tlhNncmttE4wwsCZFyU9shtGZSQn515ImLoN
	ss7wH+He3ZOIfsp7/mdB/DvEwxu+M0hwK6hf8yvdKcK6yNU84l3Xi26WCEL6r4rC42+lfWodXUmik
	XRTa8/vDxHBL2fqMRwlRrhU0T08pQzIDrvi+WC9cEoOIEXI9HGZlK2DtFURKnMyp/cWKFzR9EjxAr
	P4VCfuj2WQFNFMKcqLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGR2-0000000HOcq-1FMd;
	Thu, 04 Jun 2026 22:21:08 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGQz-0000000HOcQ-0aw3
	for opensbi@lists.infradead.org;
	Thu, 04 Jun 2026 22:21:06 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-7dd3f176f84so15515387b3.0
        for <opensbi@lists.infradead.org>; Thu, 04 Jun 2026 15:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780611664; cv=none;
        d=google.com; s=arc-20240605;
        b=ECWc0dslbrdrqhsdA1JSgKJEjZJ9dRfq7dgJGs3fn0lErCyz3aZwmCNwik41P7DkV/
         OIb1XCQfZgRKONQZd7TKa5sqE5t+t+yc2NunPL6djpaJYByeS1DsvmvOP53jWROzHmYj
         VgIqVx0WPEi0mieIRh3OFCtHwirYq3duLREofnZYSwOwlI2dKPSoxifjZtRWzlUMwO3o
         fd0ankgifr4JqmrXmdRPEDN1/3N8z0NOa9HLtoL4g0kUOn6uoyW3ttHHG3s7SGX+icHm
         C/H/vQEo8fCHa57SRqcNCtNvz3jPd8T/0Dr/hxFt1rUi8bh9XBHY0R2VGIBHA6Z++xJI
         zePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7WTP/29a03P1MihMX3vmXkNQO9bXMcY5lBXnh41gyBY=;
        fh=pwFNWI3zrAll4TRQts2Zkho2MuJnkdCDFZlP114MDY8=;
        b=WAQPhQjslSREcgKa2dlo/gO1EX6rBzBIUvG2RUm0ndLVPiYOu53rxcxK/zsuZP6Ry2
         JTIFuRhsTe4KOe34fRjy4WgUjkmS7kGTmZZmkouVrITTjkalb44IJg7tWmNdzME1ed/G
         l4cNQeFeD3zHDmyjLLQS3Jm4AyUiYeZ5+WgSyfsP8blNn84aYGwRlqb3WK+m7URCjDZ9
         VU3Ub01zkpFIZfymZLRdkzDrpsl4JnK03Bal+XqX5b/jmdhTU0Rf7KhEtjbYWaOGxkDh
         b4mfT12zpIwQvh1UESeF35oOzg6MDol8pcV69QWHeFS+3bYHTkun9mlS6/yHOr3L4VJ+
         brWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1780611664; x=1781216464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WTP/29a03P1MihMX3vmXkNQO9bXMcY5lBXnh41gyBY=;
        b=IO3qvPR/eR2mwO4NKOpJTFxQnXylIL6mihZzmqrXZxANA+QpyarDqo7zf7HW615y8Z
         uiL/rwPrjDdJIBWKGY8s/AoDmuSS8ynrDAn31GuFIPJjyTa5H7qZpzaWKqMwAG8VYdJQ
         /JfPnJsZgHg/qLq5B+SeALWZ24FM8ilFYkRy1z1EmMTYCVIgXFQz2x5sSzTM/Jm0bkTX
         Y2bCyrS6blGfGxK977yZKx5y0FTX0Nkmv4YB+k0q84GOwmuVmd/RN9Tv0yWyjQ6rQM7v
         EzuBbk6Pp9ppvziuUY7mdotmY33E/Y1+kPP0OEMB0C4CDyJmzUxPf95rffRnGnj/gfxC
         qu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780611664; x=1781216464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WTP/29a03P1MihMX3vmXkNQO9bXMcY5lBXnh41gyBY=;
        b=GBNS/Zwhz3vUKJu4z2VAE5v0od5t+iQJP9LpSIL8Z90EQbdM2dhITB8GPqedlLLhW8
         i2L8hVndlZ1x0o0EwHtocmKxjrJI8m1VkM6T6ouWMs9aSyytbuP9QoZ+pd2zNizIUvCe
         mcRangEc557kpqav/e8c9rv/oPg+k3jX5u6n/Zf7vRWMYkdx3P0GN0+epP4o/TRWGo65
         76CgrCxs76grBoCVnb8n5TrKIwr6DAnXv058sEM+udSlphRccHFAlP4raBRQb7qtnaRJ
         Nn3ptfTn4U8Q0El54pGNEAmCxJUwfptcBX//ENnBxGKKyoOgphV/oO9iSaEtS4bcaOzP
         MSBw==
X-Forwarded-Encrypted: i=1; AFNElJ98oA41OwW3eregKPz/aN7NV3yCeSGjIaol1oHw8rKbAiTyRuQrt/oNq07kVxt2UXAeD1SuLK4+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2kyd4Zo0XeO+0h9Q9Ckb1+i4lE+DMZuvfrEUSa0hK+iddWPFS
	geE6Z74LsdJHEZxDn//55UdZtzcGPKsJuqFQnTSMXaZ2Dy/+5Th1s2NS0cWaPRqSAg2tbpMZBgm
	3METSVaHZYrQS+PElsYIL1rfj6Afo+vZx+Clsmuqj6Q==
X-Gm-Gg: Acq92OFcklk006ARFyPxtr0Du2tFK92UZBIJgQTQMJQmonQJ5hSs16q7AHH16CH5cOE
	5LOA4A2/+jA2gEt6TjiC6CDycnY1aJ/SIuADXuCtGIuUo4ZVPk5tv4LVFsYx3h7W6NAR4kxGN+j
	nmwbkLrdrA5nEZFCmPBIs/0DP6mrRNNsxXsAOLNyAl+1A3ijru8hjMMq9XFngUTRefJyhBvpi14
	IfB8+JpOahQfbWC5wm+tbVB5rmr6Qss3uBa2EZ6FEB+TiHXvCNSQkEyRfdlG68dfNxhdNlfdCZd
	bBXtNz61WA4ApWBdt+y65HPYZeGVtDDuvfjlLpqJLxOeNRvobZa7Cch9dd+a61Dy7BZQOUohxMs
	IfoC2y74=
X-Received: by 2002:a05:690c:6e06:b0:7bd:6a98:58e4 with SMTP id
 00721157ae682-7ed0ed518cdmr8565277b3.27.1780611663730; Thu, 04 Jun 2026
 15:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
 <ah8rCkntd95JPfti@aurel32.net> <CAEev2e9yixsoPSp4dQZdVXH=JTC3GKKkiOAOvuPgqykPzGz0FA@mail.gmail.com>
 <aiHxbW-UV4TGnTIv@aurel32.net>
In-Reply-To: <aiHxbW-UV4TGnTIv@aurel32.net>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 4 Jun 2026 17:20:52 -0500
X-Gm-Features: AVHnY4IeKEiMToxRIfOKtWSPg-K5L9EQ3anxuOwEdIWSzqgmnT5KvTYJC4CyKes
Message-ID: <CAEev2e_+npo7t9UVAXtggDQ1XOE0JOy2VVSGrppRb9LmSckkxg@mail.gmail.com>
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, opensbi@lists.infradead.org, 
	Michael Ellerman <mpe@kernel.org>, Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_152105_215177_C852DBCA 
X-CRM114-Status: GOOD (  33.46  )
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

T24gVGh1LCBKdW4gNCwgMjAyNiBhdCA0OjQz4oCvUE0gQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVu
QGF1cmVsMzIubmV0PiB3cm90ZToKPgo+IEhpIEFuaXJ1ZGgsCj4KPiBPbiAyMDI2LTA2LTA0IDE1
OjA5LCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4gPiBIaSBBdXJlbGllbiwKPiA+Cj4gPiBP
biBUdWUsIEp1biAyLCAyMDI2IGF0IDI6MTLigK9QTSBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5A
YXVyZWwzMi5uZXQ+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAyMDI2LTA1LTI0IDEzOjUzLCBWaXZp
YW4gV2FuZyB3cm90ZToKPiA+ID4gPiBzYmlfbWlzYWxpZ25lZF92X2xkX2VtdWxhdG9yKCkgaGFz
IGEgbG9jYWwgYnVmZmVyIChuYW1lbHkgbWFzaykgd2hpY2ggaXMKPiA+ID4gPiA4MTkyIGJ5dGVz
IGluIHNpemUsIHNvIHRoZSBkZWZhdWx0IHN0YWNrIHNpemUgaXMgbm90IGVub3VnaC4gRG91Ymxl
IGl0Cj4gPiA+ID4gdG8gMTYzODQuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHN0YWNrIG92ZXJmbG93
IGNhbiBiZSBvYnNlcnZlZCBieSBhbnkgUy1tb2RlIHNvZnR3YXJlIGFuZCBsZWFkcyB0bwo+ID4g
PiA+IE0tbW9kZSBjcmFzaCBvciB1bmV4cGVjdGVkIGJlaGF2aW9yLCBhcyBsb25nIGFzIHRoZSBT
LW1vZGUgc29mdHdhcmUgZG9lcwo+ID4gPiA+IG5vdCBlbmFibGUgRldGVCBtaXNhbGlnbmVkIGRl
bGVnYXRpb24gWzFdLiBUaGlzIG1heSBiZSBjb25zaWRlcmVkIGEKPiA+ID4gPiB0ZW1wb3Jhcnkg
Zml4IHVudGlsIGZ1cnRoZXIgZml4ZXMgYXJlIG1hZGUgdG8gbWlzYWxpZ25lZCBoYW5kbGluZyBb
Ml0uCj4gPiA+ID4KPiA+ID4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi9ucnZ0NzRxbm9qYXViaXdqbzM3dW1zNGxuY2x1NDY2aG92d3JobXRiYWc2ZjV1aHJxbEBx
Nm1zb2Uyb3RvNGIgIyBbMV0KPiA+ID4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9v
cGVuc2JpLzIwMjYwMjEwMDk0MDQ0LjcyNTkxLTEtZ2FuYm9pbmdAZ21haWwuY29tICMgWzJdCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogVml2aWFuIFdhbmcgPHdhbmdydWlrYW5nQGlzY2FzLmFjLmNu
Pgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBpbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaCB8IDIgKy0K
PiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiA+Cj4gPiA+IFRlc3RlZC1ieTogQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0
Pgo+ID4gPgo+ID4gPiBJIGNhbiBjb25maXJtIHRoYXQgdGhpcyBmaXggaXMgcmVxdWlyZWQgdG8g
Ym9vdCBhIDcuMS1yYzYga2VybmVsIG9uIGEKPiA+ID4gQ1BVIHdpdGggdmVjdG9yIGluc3RydWN0
aW9ucyAoaW4gbXkgY2FzZSBTcGFjZW1pVCBLMSkuCj4gPgo+ID4gQXJlIHlvdSBzdXJlIHRoYXQg
dGhpcyBpcyBuZWVkZWQgZm9yIHRoZSBLMT8gSXQgc2VlbWVkIGxpa2UgdGhpcyB3YXMKPiA+IG9u
bHkgYW4gaXNzdWUgb24gYm9hcmRzIHdpdGggbGFyZ2UgdmxlbiAoNTEyIGxpa2UgdGhlIHgyODAp
Pwo+Cj4gWWVzIHRoaXMgaXMgYW4gaXNzdWUuIFRoZSBzdGFjayBhbGxvY2F0aW9uIGRvZXNuJ3Qg
ZGVwZW5kIG9uIHRoZSBhY3R1YWwKPiB2ZWN0b3Igc2l6ZSwgYnV0IG9uIFZMRU5fTUFYIHdoaWNo
IGlzIDY1NTM2LiBUaGUgYWx0ZXJuYXRpdmUgdG8gaW5jcmVhc2UKPiB0aGUgc3RhY2sgc2l6ZSBp
cyB0byByZWR1Y2UgdGhpcyB2YWx1ZS4KClRoYW5rcyBmb3IgY2xhcmlmeWluZy4gSSBtdXN0IGhh
dmUgbWlzdW5kZXJzdG9vZCB0aGlzLgoKPgo+ID4gRG8geW91Cj4gPiBtaW5kIHNoYXJpbmcgYW55
IGtlcm5lbCBib290IGxvZ3Mgd2l0aC93aXRob3V0IHRoaXMgcGF0Y2g/Cj4KPiBZZXAsIHBsZWFz
ZSBmaW5kIHRoZW0gYXR0YWNoZWQuIE5vdGUgdGhhdCBJIGhhdmUgYXR0YWNoZWQgdGhlIHVzZWZ1
bAo+IGZhaWx1cmUsIHNvbWV0aW1lcyB0aGUga2VybmVsIGJvb3RzIGNvcnJlY3RseSBhbmQgbW9z
dCBvZiB0aGUgdGltZSBpdAo+IGp1c3QgaGFuZ3MuCj4KPiA+IEkgd2FzIGFibGUgdG8gYm9vdCA3
LjEuMC1yYzYtbmV4dC0yMDI2MDYwMyBkZWZjb25maWcgd2l0aG91dCBpc3N1ZSBvbgo+ID4gYSBN
aWxrViBKdXBpdGVyLiBPbmx5IGNhdmVhdCBpcyB0aGF0IG15IGJvYXJkIGlzICBydW5uaW5nIGFu
IG9sZAo+ID4gdmVuZG9yIG9wZW5zYmkgKHZlcnNpb24gazEtYmwtdjIuMi40IHRoYXQgbWF5IGJl
IGJhc2VkIG9uIHVwc3RyZWFtCj4gPiB2MS4zKSB0aGF0IHRoZSBib2FyZCBzaGlwcGVkIHdpdGgs
IGFuZCBub3Qgc3VyZSBpZiB0aGF0J3MKPiA+IGhlbHBpbmcvaHVydGluZyBpbiBhbnkgbWFubmVy
Lgo+Cj4gSSBhbSB1c2luZyB0aGUgY3VycmVudCBPcGVuU0JJIEhFQUQuIFN1cHBvcnQgZm9yIG1p
c2FsaWduZWQgdmVjdG9yCj4gbG9hZC9zdG9yZSB3YXMgYWRkZWQgaW4gdmVyc2lvbiAxLjYgaW4g
Y29tbWl0IGMyYWNjNWU1YjBkOCAoImxpYjoKPiBzYmlfbWlzYWxpZ25lZF9sZHN0OiBBZGQgaGFu
ZGxpbmcgb2YgdmVjdG9yIGxvYWQvc3RvcmUiKSwgc28gaXQncyBub3QKPiBzdXJwcmlzaW5nIHRo
YXQgeW91ciB2ZXJzaW9uIGRvZXMgbm90IGhhdmUgdGhlIGlzc3VlLgoKSSB3YXNuJ3QgYXdhcmUg
dGhhdCB5b3UgY291bGQgdXNlIHVwc3RyZWFtIE9wZW5TQkkgb24gdGhlIGsxIGJvYXJkcy4KCkkg
aW1hZ2luZSB0aGF0IGEgbG90IG9mIGZvbGtzIHdpdGggb2xkZXIgYm9hcmRzIGFyZW4ndCBnb25u
YSB1cGdyYWRlCk9wZW5TQkksIHNvIHdvbid0IHJ1biBpbnRvIHRoaXMgaXNzdWUuIFN0aWxsIHVz
ZWZ1bCB0byBoYXZlIGEgZml4CnRob3VnaC4KCgo+Cj4gUmVnYXJkcwo+IEF1cmVsaWVuCj4KPiAt
LQo+IEF1cmVsaWVuIEphcm5vICAgICAgICAgICAgICAgICAgICAgICAgICBHUEc6IDQwOTZSLzFE
REQ4QzlCCj4gYXVyZWxpZW5AYXVyZWwzMi5uZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8v
YXVyZWwzMi5uZXQKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
