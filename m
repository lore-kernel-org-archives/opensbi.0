Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6103C47BDF
	for <opensbi@archiver.kernel.org>; Tue,  6 Jan 2026 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xljubGGE7kiY2Oy5vE1eniNeQkMpBKtgEJMVbKFFy2w=; b=ln7JhM7p/Buz/n
	RCDKvk59xTco3WJaTKHHBD1YC1+edYPpvNzxmQSqf1lzUJxwZnvYPQ/t6hsp6z+DqCalTBMYlE5lJ
	7nKQNwT6KoXOiP3R+9PR1ntHTSJqXOVAdKSNmNwzamwv/BJNtlvYQx8ZRt9kjxHepdEaSqeIbdGPO
	6/M1Y66OX7/r3+kH4KiNiZCMfqhn+KpoONobV7zgLAvSgHjLJzojldedBEf+jpQeh1q8vEmAQPtqo
	U1U9ulBd5sv5glXZP+79B4n6yr9e7jOEP8kVgyPT+TkszYxCl9ei8oeXafrRegAzBYeRe3mR8xwyw
	1ulwAmJVkH3ntkOcSpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4S9-0000000CoGw-2gG9;
	Tue, 06 Jan 2026 10:38:17 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4S7-0000000CoGJ-0sHW
	for opensbi@lists.infradead.org;
	Tue, 06 Jan 2026 10:38:16 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-37b495ce059so6881741fa.0
        for <opensbi@lists.infradead.org>; Tue, 06 Jan 2026 02:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767695892; x=1768300692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l59uF6/tgIIMe/TCv2QE6z/Xo8jI9oIkMMkobqXpWw=;
        b=it/mH0ztdvho4iZGmxL0mLy0ptpBU+V3VrzrHO63N1jiz6nM0aZctGWVjXl/gdUvRx
         kwdp5hR2mo4W6WLZ6zH3T29CKz1AsAySaoCjjyO+MpUMGN/E0bok+UaVxne4FlOxVdQe
         4Mfg5VHgaQ5XgccIQ5XHEL7MXEnPaRw2cCfAMgxVoqHM5aC7o/WZwHVe9d5u9TZIHBz2
         +vfMY1VisuNlEBDd9JMT211o9Vkc0luBYFklwHLWWPREMzLq08QCmZB8hU4sX6uKbRYk
         2pBJwKKJrWLz2iUi7bJgK8+dhIHbtEbfg82NIK6r5V4MW7QADfWur14EBwv68GmPK3hh
         IL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767695892; x=1768300692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1l59uF6/tgIIMe/TCv2QE6z/Xo8jI9oIkMMkobqXpWw=;
        b=KTHoeJzz011pJhI3VFFwzHvsMV4mtAjBu0YmiK2NI0TfUf0GTfLiJkqepzi4B4/94G
         PzmWkkneGTXbkcPxTUM7gbBMPePOpi2NR+LlXXj8Xw65TDOXEauK5nkGBXr8XtF54w/G
         Mq9moy8XNTJ0WrdPnapoCP5br7vs05f2xfeljtlIg5jzvyU1UVGCj5Ztb9W8Dr9WvE0T
         gzeCnZHPyWSZHz11bK4voRkUz8b9zHt6wLSJl8S6Rpl+wy4D33xcC4zv+7G/N6R4tw4S
         SZbqyXpl56WgxteVEC+Sk1lkFp5SmEjtzFDPx0FG1kh2oOTk9lRVKYgNPsZpkYxkL0VZ
         JNvQ==
X-Gm-Message-State: AOJu0Yy62VOAlrOLG1uBNs4XerhI8LOm1ENzpzpnsTGK2AikVY8/vsD5
	QnDqWWe67UBE4a7bMYezanT1+Cs1if9vZf70MlA17f0MPvqDljnihZu90o0TmbgUlOfjr0Zywrz
	V1yWNAbnrbATL2U5YLiDtIli6e3Vp9FIlWXG/Mr9SBzWgc//NHd1wTiyeqyGs
X-Gm-Gg: AY/fxX7+usl1XZY8DqK9Xqc1f8F7wk9sX/R2/cVaoZwcriMnJ28MamVpE1AY7p9VqY4
	hCTvgzJPR1N7hVDkoUnBVC4hj+THGq4LyhFEdrtpUShv6wocQFKd2cB5VvnUDPw+Zexh57MfpDo
	mdTDsKCbFaJrTls+9KMeCPnGpB4dO9RzF4mejtmvax2nx/gzpT7BmqeW0+DDFym6skfG5DsClsi
	ZRKxAu9f57o+wpTM3B/blvIIUcVokUfVeTFu+yfiJ7lq4ccRk9WCV07hrQHuCaV/bGqEncVK8uv
	gwSplUmStfihLmtMKfpaiTguVjWD
X-Google-Smtp-Source: AGHT+IE3+TwGx/fGBo+H8YAGMPt/qBGXECtNnE75bcvpnfH6U4HSW1r7n1X8YDMY5mxEKnkjFlfye2LdYvDB1rSWdQc=
X-Received: by 2002:a2e:bc15:0:b0:338:10c9:5871 with SMTP id
 38308e7fff4ca-382eaacc740mr7611651fa.34.1767695891706; Tue, 06 Jan 2026
 02:38:11 -0800 (PST)
MIME-Version: 1.0
References: <bd8cc9b22f496b06e4c874253ba964f306c8f575.camel@bootlin.com>
In-Reply-To: <bd8cc9b22f496b06e4c874253ba964f306c8f575.camel@bootlin.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 6 Jan 2026 16:07:59 +0530
X-Gm-Features: AQt7F2o80iT9O759fPGsUeRYFo_REVEpY7uYLhA3dmbueWpcZNq5j2hAp2DhtBY
Message-ID: <CAK9=C2VxzMojb9z_sK+t=Q83oaN=hY1qzBUkAdAG5f7oyD+H8A@mail.gmail.com>
Subject: Re: Hart isolation configuration failure (error -3) with OpenSBI 1.8
 on QEMU 10.1.3 rva22s64/rva23s64 profiles
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: OpenSBI <opensbi@lists.infradead.org>, qemu-riscv@nongnu.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_023815_299544_8F5E1E27 
X-CRM114-Status: GOOD (  14.55  )
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

T24gTW9uLCBKYW4gNSwgMjAyNiBhdCAxMToxM+KAr1BNIFRob21hcyBQZXJyb3QgPHRob21hcy5w
ZXJyb3RAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBIYXBweSBOZXcgWWVhciEK
Pgo+IEknbSBmYWNpbmcgYSBoYXJ0IGlzb2xhdGlvbiBjb25maWd1cmF0aW9uIGVycm9yIHdoZW4g
cnVubmluZyBPcGVuU0JJCj4gMS44IG9uIFFFTVUgMTAuMS4zIHdpdGggdGhlIFJJU0MtViBhcHBs
aWNhdGlvbiBwcm9maWxlcyBydmEyMnM2NCBhbmQKPiBydmEyM3M2NDoKPgo+ICAgICBpbml0X2Nv
bGRib290OiBoYXJ0IGlzb2xhdGlvbiBjb25maWd1cmUgZmFpbGVkIChlcnJvciAtMykKPgo+IE5v
IGlzc3VlIG9jY3VycyB3aGVuIHVzaW5nIHRoZSBydjY0IHByb2ZpbGUuIFRoZSBzeXN0ZW0gY29u
dGludWVzIHRvCj4gYm9vdCBhZnRlciB0aGUgZXJyb3IsIGJ1dCBJJ2QgbGlrZSB0byB1bmRlcnN0
YW5kIHRoZSByb290IGNhdXNlLgo+Cj4gSSBoYXZlbid0IHRlc3RlZCBPcGVuU0JJIDEuOCBvbiBy
ZWFsIGhhcmR3YXJlIHlldCAtIHRoYXQncyBteSBuZXh0Cj4gc3RlcC4KPgo+IElzIHRoZXJlIGEg
a25vd24gUUVNVSBpc3N1ZT8gSXMgdGhlcmUgYSByZWNvbW1lbmRlZCB3b3JrYXJvdW5kIGJlc2lk
ZXMKPiB1c2luZyBydjY0Pwo+Cj4gQmVsb3cgaXMgdGhlIGNvbXBsZXRlIHRyYWNlOgo+Cj4gcWVt
dS1zeXN0ZW0tcmlzY3Y2NCAtZGV2aWNlIHZpcnRpby1uZXQtCj4gZGV2aWNlLG5ldGRldj1uZXQw
LG1hYz01Mjo1NDowMDoxMjozNTowMiAtbmV0ZGV2Cj4gdXNlcixpZD1uZXQwLGhvc3Rmd2Q9dGNw
OjEyNy4wLjAuMToyMjIyLToyMixob3N0ZndkPXRjcDoxMjcuMC4wLjE6MjMyMy0KPiA6MjMsdGZ0
cD0vc3JjL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2VzL3FlbXVyaXNjdjY0IC1vYmplY3Qgcm5nLQo+
IHJhbmRvbSxmaWxlbmFtZT0vZGV2L3VyYW5kb20saWQ9cm5nMCAtZGV2aWNlIHZpcnRpby1ybmct
cGNpLHJuZz1ybmcwIC0KPiBkcml2ZSBpZD1kaXNrMCxmaWxlPS9zcmMvYnVpbGQvdG1wL2RlcGxv
eS9pbWFnZXMvcWVtdXJpc2N2NjQvY29yZS0KPiBpbWFnZS1taW5pbWFsLXFlbXVyaXNjdjY0LnJv
b3Rmcy0yMDI2MDEwNTE3Mzg0Ny5leHQ0LGlmPW5vbmUsZm9ybWF0PXJhdwo+IC1kZXZpY2Ugdmly
dGlvLWJsay1kZXZpY2UsZHJpdmU9ZGlzazAgLWRldmljZSBxZW11LXhoY2kgLWRldmljZSB1c2It
Cj4gdGFibGV0IC1kZXZpY2UgdXNiLWtiZCAgLW1hY2hpbmUgdmlydCAtY3B1IHJ2YTIzczY0IC1z
bXAgNCAtbSAyNTYgLQo+IHNuYXBzaG90IC1zZXJpYWwgbW9uOnN0ZGlvIC1zZXJpYWwgbnVsbCAt
bm9ncmFwaGljIC1kZXZpY2UgYm9jaHMtCj4gZGlzcGxheSAtYmlvcyAvc3JjL2J1aWxkL3RtcC9k
ZXBsb3kvaW1hZ2VzL3FlbXVyaXNjdjY0L2Z3X2p1bXAuZWxmIC0KPiBrZXJuZWwgL3NyYy9idWls
ZC90bXAvZGVwbG95L2ltYWdlcy9xZW11cmlzY3Y2NC9JbWFnZSAtYXBwZW5kCj4gJ3Jvb3Q9L2Rl
di92ZGEgcncgIG1lbT0yNTZNIGlwPWRoY3AgY29uc29sZT10dHlTMCBjb25zb2xlPWh2YzAKPiBl
YXJseWNvbj1zYmkgc3dpb3RsYj0wCj4KPiBPcGVuU0JJIHYxLjgKPiAgICBfX19fICAgICAgICAg
ICAgICAgICAgICBfX19fXyBfX19fIF9fX19fCj4gICAvIF9fIFwgICAgICAgICAgICAgICAgICAv
IF9fX198ICBfIFxfICAgX3wKPiAgfCB8ICB8IHxfIF9fICAgX19fIF8gX18gfCAoX19fIHwgfF8p
IHx8IHwKPiAgfCB8ICB8IHwgJ18gXCAvIF8gXCAnXyBcIFxfX18gXHwgIF8gPCB8IHwKPiAgfCB8
X198IHwgfF8pIHwgIF9fLyB8IHwgfF9fX18pIHwgfF8pIHx8IHxfCj4gICBcX19fXy98IC5fXy8g
XF9fX3xffCB8X3xfX19fXy98X19fXy9fX19fX3wKPiAgICAgICAgIHwgfAo+ICAgICAgICAgfF98
Cj4KPiBQbGF0Zm9ybSBOYW1lICAgICAgICAgICAgICAgOiByaXNjdi12aXJ0aW8scWVtdQo+IFBs
YXRmb3JtIEZlYXR1cmVzICAgICAgICAgICA6IG1lZGVsZWcKPiBQbGF0Zm9ybSBIQVJUIENvdW50
ICAgICAgICAgOiA0Cj4gUGxhdGZvcm0gSEFSVCBQcm90ZWN0aW9uICAgIDogLS0tCj4gUGxhdGZv
cm0gSVBJIERldmljZSAgICAgICAgIDogYWNsaW50LW1zd2kKPiBQbGF0Zm9ybSBUaW1lciBEZXZp
Y2UgICAgICAgOiBhY2xpbnQtbXRpbWVyIEAgMTAwMDAwMDBIego+IFBsYXRmb3JtIENvbnNvbGUg
RGV2aWNlICAgICA6IHVhcnQ4MjUwCj4gUGxhdGZvcm0gSFNNIERldmljZSAgICAgICAgIDogLS0t
Cj4gUGxhdGZvcm0gUE1VIERldmljZSAgICAgICAgIDogLS0tCj4gUGxhdGZvcm0gUmVib290IERl
dmljZSAgICAgIDogc3lzY29uLXJlYm9vdAo+IFBsYXRmb3JtIFNodXRkb3duIERldmljZSAgICA6
IHN5c2Nvbi1wb3dlcm9mZgo+IFBsYXRmb3JtIFN1c3BlbmQgRGV2aWNlICAgICA6IC0tLQo+IFBs
YXRmb3JtIENQUEMgRGV2aWNlICAgICAgICA6IC0tLQo+IEZpcm13YXJlIEJhc2UgICAgICAgICAg
ICAgICA6IDB4ODAwMDAwMDAKPiBGaXJtd2FyZSBTaXplICAgICAgICAgICAgICAgOiAzNTcgS0IK
PiBGaXJtd2FyZSBSVyBPZmZzZXQgICAgICAgICAgOiAweDQwMDAwCj4gRmlybXdhcmUgUlcgU2l6
ZSAgICAgICAgICAgIDogMTAxIEtCCj4gRmlybXdhcmUgSGVhcCBPZmZzZXQgICAgICAgIDogMHg0
ZDAwMAo+IEZpcm13YXJlIEhlYXAgU2l6ZSAgICAgICAgICA6IDQ5IEtCICh0b3RhbCksIDAgS0Ig
KHJlc2VydmVkKSwgMTMgS0IKPiAodXNlZCksIDM1IEtCIChmcmVlKQo+IEZpcm13YXJlIFNjcmF0
Y2ggU2l6ZSAgICAgICA6IDQwOTYgQiAodG90YWwpLCAxNDY0IEIgKHVzZWQpLCAyNjMyIEIKPiAo
ZnJlZSkKPiBSdW50aW1lIFNCSSBWZXJzaW9uICAgICAgICAgOiAzLjAKPiBTdGFuZGFyZCBTQkkg
RXh0ZW5zaW9ucyAgICAgOgo+IHRpbWUscmZuYyxpcGksYmFzZSxoc20sc3JzdCxwbXUsZGJjbixm
d2Z0LGxlZ2FjeSxkYnRyLHNzZQo+IEV4cGVyaW1lbnRhbCBTQkkgRXh0ZW5zaW9ucyA6IG5vbmUK
Pgo+IERvbWFpbjAgTmFtZSAgICAgICAgICAgICAgICA6IHJvb3QKPiBEb21haW4wIEJvb3QgSEFS
VCAgICAgICAgICAgOiAwCj4gRG9tYWluMCBIQVJUcyAgICAgICAgICAgICAgIDogMCosMSosMios
MyoKPiBEb21haW4wIFJlZ2lvbjAwICAgICAgICAgICAgOiAweDAwMDAwMDAwODAwNDAwMDAtMHgw
MDAwMDAwMDgwMDVmZmZmIE06Cj4gKEYsUixXKSBTL1U6ICgpCj4gRG9tYWluMCBSZWdpb24wMSAg
ICAgICAgICAgIDogMHgwMDAwMDAwMDgwMDAwMDAwLTB4MDAwMDAwMDA4MDAzZmZmZiBNOgo+IChG
LFIsWCkgUy9VOiAoKQo+IERvbWFpbjAgUmVnaW9uMDIgICAgICAgICAgICA6IDB4MDAwMDAwMDAw
MDEwMDAwMC0weDAwMDAwMDAwMDAxMDBmZmYgTToKPiAoSSxSLFcpIFMvVTogKFIsVykKPiBEb21h
aW4wIFJlZ2lvbjAzICAgICAgICAgICAgOiAweDAwMDAwMDAwMTAwMDAwMDAtMHgwMDAwMDAwMDEw
MDAwZmZmIE06Cj4gKEksUixXKSBTL1U6IChSLFcpCj4gRG9tYWluMCBSZWdpb24wNCAgICAgICAg
ICAgIDogMHgwMDAwMDAwMDAyMDAwMDAwLTB4MDAwMDAwMDAwMjAwZmZmZiBNOgo+IChJLFIsVykg
Uy9VOiAoKQo+IERvbWFpbjAgUmVnaW9uMDUgICAgICAgICAgICA6IDB4MDAwMDAwMDAwYzQwMDAw
MC0weDAwMDAwMDAwMGM1ZmZmZmYgTToKPiAoSSxSLFcpIFMvVTogKFIsVykKPiBEb21haW4wIFJl
Z2lvbjA2ICAgICAgICAgICAgOiAweDAwMDAwMDAwMGMwMDAwMDAtMHgwMDAwMDAwMDBjM2ZmZmZm
IE06Cj4gKEksUixXKSBTL1U6IChSLFcpCj4gRG9tYWluMCBSZWdpb24wNyAgICAgICAgICAgIDog
MHgwMDAwMDAwMDAwMDAwMDAwLTB4ZmZmZmZmZmZmZmZmZmZmZiBNOgo+ICgpIFMvVTogKFIsVyxY
KQo+IERvbWFpbjAgTmV4dCBBZGRyZXNzICAgICAgICA6IDB4MDAwMDAwMDA4MDIwMDAwMAo+IERv
bWFpbjAgTmV4dCBBcmcxICAgICAgICAgICA6IDB4MDAwMDAwMDA4MjIwMDAwMAo+IERvbWFpbjAg
TmV4dCBNb2RlICAgICAgICAgICA6IFMtbW9kZQo+IERvbWFpbjAgU3lzUmVzZXQgICAgICAgICAg
ICA6IHllcwo+IERvbWFpbjAgU3lzU3VzcGVuZCAgICAgICAgICA6IHllcwo+Cj4gQm9vdCBIQVJU
IElEICAgICAgICAgICAgICAgIDogMAo+IEJvb3QgSEFSVCBEb21haW4gICAgICAgICAgICA6IHJv
b3QKPiBCb290IEhBUlQgUHJpdiBWZXJzaW9uICAgICAgOiB2MS4xMgo+IEJvb3QgSEFSVCBCYXNl
IElTQSAgICAgICAgICA6IHJ2NjRpbWFmZGNidmgKPiBCb290IEhBUlQgSVNBIEV4dGVuc2lvbnMg
ICAgOgo+IHNtc3RhdGVlbixzc2NvZnBtZixzc3RjLHppY250cix6aWhwbSx6aWNib3osemljYm9t
LHN2cGJtdCxzZHRyaWcsc3ZhZGUsCj4gc21ucG0sc3NzdGF0ZWVuCj4gQm9vdCBIQVJUIFBNUCBD
b3VudCAgICAgICAgIDogMAo+IEJvb3QgSEFSVCBQTVAgR3JhbnVsYXJpdHkgICA6IDAgYml0cwo+
IEJvb3QgSEFSVCBQTVAgQWRkcmVzcyBCaXRzICA6IDAKPiBCb290IEhBUlQgTUhQTSBJbmZvICAg
ICAgICAgOiAxNiAoMHgwMDA3ZmZmOCkKPiBCb290IEhBUlQgRGVidWcgVHJpZ2dlcnMgICAgOiAy
IHRyaWdnZXJzCj4gQm9vdCBIQVJUIE1JREVMRUcgICAgICAgICAgIDogMHgwMDAwMDAwMDAwMDAz
NjY2Cj4gQm9vdCBIQVJUIE1FREVMRUcgICAgICAgICAgIDogMHgwMDAwMDAwMDAwZjRiNTA5Cj4g
aW5pdF9jb2xkYm9vdDogaGFydCBpc29sYXRpb24gY29uZmlndXJlIGZhaWxlZCAoZXJyb3IgLTMp
CgpUaGlua2luZyBhYm91dCB0aGlzIG1vcmUsIHRoaXMgbG9va3MgbGlrZSBRRU1VIGJ1ZyBiZWNh
dXNlCnRoZXJlIGFyZSBubyBQTVAgZW50cmllcyBmb3IgcnZhMjJzNjQgYW5kIHJ2YTIzczY0IHdo
aWNoCmlzIHdoeSB0aGVyZSBpcyBubyBoYXJ0IGlzb2xhdGlvbiBtZWNoYW5pc20gaGVuY2UgdGhl
IGhhcnQKaXNvbGF0aW9uIGNvbmZpZ3VyZSBmYWlscy4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
