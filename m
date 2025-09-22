Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735FDCAC5A7
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 06:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArOMcB++SbbLINH1+TswHqTjZaM9AuNgTNUrxSfVJ9M=; b=PzzvzL2N1aUMxN
	ZBndFlxK81oCQtB/ZGSg5wio+wQm+iFvFtIz/jw/leImGN2CDkl03huyt9/U7zPT+4fXDUCy4Kr8I
	yeGYCWWfbZf/nP0sG+6afwGsS3N1F7B5jUN8agDVcVASKLJzUISQ5VMRn7KcvVqPsFTID/qg0oBkO
	/3IKN+TfhA58SeR0nlSCyCix53mzGHTo5rcDff9rIPHsfffGznNkUiEdo7mldBScpri6JUeWH9yuc
	rvRGDI9ZwRzVTtPozMuBKQbEvXJARCcIonce3jkEvI8sSG0Z3UMYCjuggB2upTarrb+W8ID4xFwGr
	0u+asaSMAPHiMuUKlaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zu0-00000008wPf-0WZw;
	Mon, 22 Sep 2025 06:19:56 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Ztw-00000008wP0-3AWt
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 06:19:55 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-42480cb42e9so16169885ab.0
        for <opensbi@lists.infradead.org>; Sun, 21 Sep 2025 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758521992; x=1759126792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFKmFE4kPYMuva6yqqC4UBZhCNUflGs+qzdyOmunL8Y=;
        b=fvrGIoxy51m6z2T1nkgbi0zP70daq+0VeumbW6pufUV1xvHQ1rlP1bsxbwqbjW3hC0
         ljizkBS4C5cbVH/v9K0fQPCvosPmvfS4kKacVXtitlNkzGJA2Eb09i1YB2JOBz9W4ckx
         rF/gOpLou7CcPRKEml3BCfsOTfuh9ejtY8pZjKDoObZxykWygtDLOkZzGi6i5RNtLGXn
         QprL2NR5J82YhEqlbYBEtiVIeqPUffrYgvowLfN++I08ZFzandb4o2re8Rt9tuYMVV1Z
         /Qk2WDpYBE8tUJEWiQUz9/08Gqzrw0ENkpuLNBxrlNEb8ZMOqwRDkfr7wnnkIUX2PfYm
         dWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758521992; x=1759126792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFKmFE4kPYMuva6yqqC4UBZhCNUflGs+qzdyOmunL8Y=;
        b=AskPqrneiWitAk+C9DnyE2qFR/qpYrHJHfOzK589GJMYFooGIAqUKqzoqDTkEijejn
         L2uQbFRqzQQmp4RVWStYv4BLsJL9FjaqBOVLjYkCI/gPjMR9g+cOTkl0Hbo8K2DoqYGb
         rwtLrid/ArT9DNOF+GblJu3h5LlouFblmiPRrnfYFppeyltx/VAFeOhuA9i6J+5pI4uu
         26U0j2r7M3CC5RF/rRwts0cZPdkPlVNjp5lVkeHPb7KleuC9Y5VLoJ/y0+X1mNZkBhQd
         zZQUglyqOqxZSr0cQiD0CD+o2yiWW+jZx5TtFLj5WLx5r2syqzaG/pr/eE6O7L4KXVHq
         c4iQ==
X-Gm-Message-State: AOJu0YxprhYJPMMyxLBGpZQQmY86i0Y6CxzeLbwkOQt3iLnBJNANOXFm
	wUNQmgsCgCyzFLYUCo+1AZkZMVkLffYXleWJo8bvwofVDyeLLSz72AWVs25tKSlXgZmqZqIlgMk
	p32l6sQBrpRECUFvP+dFGvRifWo7VYq0bT0J5DpdF25NLWOLBSCUVf+w=
X-Gm-Gg: ASbGncvJlYj0D8CIte4apD8kokwUkNyA1T2Nbu15a7Wer6AEv9TJ1Cp2tay9RPeJGyY
	/gejr/rW1UuyjU0wNcfQZcYzYNVnhYI0Zk5jul3uhtDq7mxRTmlk6i3x2+Z6IQUjHDJqIDxLZ1u
	JbFefpM58ocdPAgp7r6Mp5I6vQfqB8y/A5grr8c9OtuocQZamokBCSb/ylMxatY1ddXtwi0neUR
	nmChadASq7bNi2RFw19zRpnC/4ss+KA/K3lH2o5
X-Google-Smtp-Source: AGHT+IGeXFdt0nTCV9ugquUOlpcpGjEh2JKBljx8Xyc7+RuEnYxeyAaK38XVxEGegfXtDl1RLDjnLzPh5I78BbIZ4wI=
X-Received: by 2002:a05:6e02:19c6:b0:425:7481:cc9 with SMTP id
 e9e14a558f8ab-42574810d86mr48543955ab.24.1758521989350; Sun, 21 Sep 2025
 23:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <CAAhSdy2x2w0+92W1+L5FPYVpcTypakMjop7YLCADvZyrWKoe4g@mail.gmail.com>
 <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi> <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
 <10FA4FAF4385199D+aNDoKROfVoYsolIw@LT-Guozexi>
In-Reply-To: <10FA4FAF4385199D+aNDoKROfVoYsolIw@LT-Guozexi>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Sep 2025 11:49:38 +0530
X-Gm-Features: AS18NWAusyCI-_CfJQTSHc_azzphAj9kn2kthSRv0flkWAg8Tjvb9FYQgGQqQgw
Message-ID: <CAAhSdy2E+ZCrJUmB_Tm1qBC6gY6JOgwQKOXpVbcHOiZe9zJUHg@mail.gmail.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_231952_799874_F660F563 
X-CRM114-Status: GOOD (  24.95  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6MznigK9BTSBUcm95IE1pdGNoZWxsCjx0cm95Lm1p
dGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAyMiwgMjAy
NSBhdCAxMTozMTozNUFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAg
MjIsIDIwMjUgYXQgMTE6MTLigK9BTSBUcm95IE1pdGNoZWxsCj4gPiA8dHJveS5taXRjaGVsbEBs
aW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIFNlcCAyMiwgMjAy
NSBhdCAwODo1NToyNUFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwg
U2VwIDIyLCAyMDI1IGF0IDY6NDbigK9BTSBUcm95IE1pdGNoZWxsCj4gPiA+ID4gPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGcm9t
OiBYaWFuYmluIFpodSA8eGlhbmJpbi56aHVAbGludXguc3BhY2VtaXQuY29tPgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEV4dGVuZCBnZW5lcmljIHBsYXRmb3JtIHRvIHN1cHBvcnQgU3BhY2VtaVQgSzEu
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gSzEsIHRoZSBCUk9NIG9ubHkgYnJpbmdzIHVwIHRoZSBw
cmltYXJ5IGNvcmUgYW5kIGxlYXZlcyB0aGUKPiA+ID4gPiA+IG90aGVyIGNvcmVzIGluIGEgZGlz
YWJsZWQgc3RhdGUuIFRoaXMgcHJldmVudHMgTGludXggZnJvbSBib290aW5nCj4gPiA+ID4gPiBT
TVAgYW5kIG9ubHkgb25lIGNvcmUgaXMgYXZhaWxhYmxlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFk
ZCBjb2RlIHRvIGJyaW5nIHVwIGFsbCA4IGNvcmVzIGR1cmluZyBPcGVuU0JJIGluaXRpYWxpemF0
aW9uIHNvCj4gPiA+ID4gPiB0aGF0IHRoZSBMaW51eCBrZXJuZWwgY2FuIGRldGVjdCBhbmQgdXNl
IGFsbCBjb3JlcyBwcm9wZXJseS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDby1hdXRob3JlZC1ieTog
VHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNl
bWl0LmNvbT4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW5iaW4gWmh1IDx4aWFuYmluLnpo
dUBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+IENoYW5nZXMgaW4g
djI6Cj4gPiA+ID4gPiAtIHJlbW92ZSBfX3NiaV9oc21faGFydF9nZXRfc3RhdGUoKSBpbiBzcGFj
ZW1pdF9jb2xkX2Jvb3RfYWxsb3dlZCgpCj4gPiA+ID4gPiAtIHBsdXMgUE1VX0FQX0JBU0UgaW4g
UE1VX0FQX0NPUkUoMHw0KV8oV0FLRVVQfElETEUpX09GRlNFVAo+ID4gPiA+ID4gLSBMaW5rIHRv
IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwOTE2LXNtdC1rMS04LWNvcmVzLXYx
LTEtNWI3NmUwNmQxMmRhQGxpbnV4LnNwYWNlbWl0LmNvbQo+ID4gPiA+Cj4gPiA+ID4gSXQgaXMg
YmV0dGVyIHRvIGhhdmUgYSBzZXBhcmF0ZSBmZHRfaHNtX3NwYWNlbWl0IGRyaXZlciB1bmRlcgo+
ID4gPiA+IGxpYi91dGlscy9oc20gZGlyZWN0b3J5Lgo+ID4gPiBXZSBhcmUgbm90IGdvaW5nIHRv
IHN1cHBvcnQgdGhpcyBmZWF0dXJlLgo+ID4gPiBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4K
PiA+ID4KPiA+Cj4gPiBJIGRvbid0IHVuZGVyc3RhbmQuCj4gPiBUaGlzIHBhdGggYWxyZWFkeSBy
ZWdpc3RlcnMgc2JpX2hzbV9kZXZpY2Ugc28gYWxsCj4gPiBJIGFtIGFza2luZyBpcyB0byBjcmVh
dGUgYSBwcm9wZXIgSFNNIGRyaXZlciB1bmRlcgo+ID4gbGliL3V0aWxzL2hzbSBkaXJlY3Rvcnku
Cj4gUGVyaGFwcyBJIG1pc3VuZGVyc3Rvb2Qgc29tZXRoaW5nLiBXaGF0IEkgbWVhbnQgaXMgdGhh
dAo+IHdlIGRvIG5vdCBwbGFuIHRvIHN1cHBvcnQgcnBtaS4KClRoZSBsaWIvdXRpbHMvaHNtIGlz
IG5vdCBvbmx5IGZvciBSUE1JIEhTTSBkcml2ZXIuIFBsYXRmb3JtcwpjYW4gYWRkIHRoZWlyIEhT
TSBkcml2ZXIgdW5kZXIgdGhpcyBkaXJlY3RvcnkgYXMgd2VsbC4KCj4gQWxzbywgSSBub3RpY2Vk
IG90aGVyIHBsYXRmb3JtcyBhcmUgZGlyZWN0bHkgcmVnaXN0ZXJpbmcgdmlhCj4gc2JpX2hzbV9z
ZXRfZGV2aWNlKCkgaW4gdGhlaXIgcGxhdGZvcm0gY29kZToKPgo+IGBgYAo+IGFsbHdpbm5lci9z
dW4yMGktZDEuYzoxOTA6ICAgICAgc2JpX2hzbV9zZXRfZGV2aWNlKCZzdW4yMGlfZDFfcHB1KTsK
PiBhbmRlcy9hZTM1MC5jOjEwMTogICAgICAgICAgICAgIHNiaV9oc21fc2V0X2RldmljZSgmYW5k
ZXNfc211KTsKPiBtaXBzL3A4NzAwLmM6MjE5OiAgICAgICAgICAgICAgIHNiaV9oc21fc2V0X2Rl
dmljZSgmbWlwc19oc20pOwo+IGBgYAoKRmV3IG9mIHRoZXNlIHBsYXRmb3JtcyB3ZXJlIGFkZGVk
IGJlZm9yZSBhIGRlZGljYXRlZApsaWIvdXRpbHMvaHNtIGRpcmVjdG9yeSB3YXMgY3JlYXRlZCBm
b3IgSFNNIGRyaXZlcnMuCgo+Cj4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIG1lIHdpdGggbW9y
ZSBpbmZvcm1hdGlvbj8KCkdyYWR1YWxseSwgd2UgbmVlZCB0byBtb3ZlIEhTTSBkcml2ZXJzIGZy
b20gcGxhdGZvcm0vZ2VuZXJpYyB0bwpsaWIvdXRpbHMvaHNtIGFzIGluZGVwZW5kZW50IEhTTSBk
cml2ZXJzCgpJIGhhdmUgYWxyZWFkeSBzdWdnZXN0ZWQgdGhpcyBmb3IgU2lGaXZlIFRNQzAgYW5k
IFNNQzAgZHJpdmVycwphcyB3ZWxsLgooUmVmZXIgIltQQVRDSCB2NiAwMC8xMV0gQWRkIFNpRml2
ZSBUTUMwIGFuZCBTTUMwIGRyaXZlciIpCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
