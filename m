Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28ECCCF9E0
	for <opensbi@archiver.kernel.org>; Tue, 28 Oct 2025 06:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ld5wyDLS1YFIKfiw+30UIx3CEf0Xyqsai2XystKf4Yo=; b=BcFcpVd+9BXI3Z
	qV9dEoGfzw+bbtBqSLLbC6EE237NjAVunKn+d+facQrsRR2GdWMeTVCEW3yrfn+KhNfuct+VIOO+p
	EERjpj7pZNTLNCu89/wAxkkLu6fI4UfxqbFju6qSI7Z99ME/iFVmJ3s0y2ENOj6ERi0d1g/gcvkxN
	VRRiyqRt+zwfemJjf7ghz6Dc/85RS2S5YxwFLlqBZ0RkTMcL/fvoHNaf6oSlz3DoheQaTEmqc7wPd
	zZmkqZMR4AqM5RhTY8hdCi3CXeXBY2OyKXYuDTuYKjp5Ivu47LKugjteym5SxDeqa6tXDnJKNnxpt
	F8/mjuqfyYC0M/0XCy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcnD-0000000FJ6E-3jAk;
	Tue, 28 Oct 2025 06:02:53 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcnB-0000000FJ5m-06mJ
	for opensbi@lists.infradead.org;
	Tue, 28 Oct 2025 06:02:50 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-93bccd4901aso509456639f.2
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 23:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761631368; x=1762236168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIjnZU72ELJ30q1m9TOPXCuWKhBJpMRnN7QDssoj+tA=;
        b=raVDjNAls3lwI9/vxsABstRya+gOcTI0BtCoRtsfg8QobzDfyE0/tnbxhkTq1oUm8F
         7bj4430nbBqHlYKbIEjttbVtx1nDFEalGg+1ztmwUtTFf4Jh29gAHws7qQ2oa0VqV64N
         rpp5ZpNB285EFNeYwL2pcmAc0i5ZZKp5x6tFbXlrPlF9cLrtVVaU1/WaF/txiqrzZLKL
         DkEeRr+AZLivRf5wJ4iZZ9NAwafJUn2BOe5hXBv84/FjrUiRVLniuVesS+X3l3U2As3e
         vSG/MO7ITzcX/AW38hihu7qR4xpHPYdoEjY2luT0GVZ0QPhfIH5ZiCVJIlGaTh2JOWii
         mH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761631368; x=1762236168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIjnZU72ELJ30q1m9TOPXCuWKhBJpMRnN7QDssoj+tA=;
        b=rxz90TmITJY7NOkVPMR9akiuNQmihIsQO4Fp9KmVI1HJg/JypsjXTl1Ivl1e560iSz
         CLsldvCHGo7OOqKY3ZiqPuZkPHECty+jnpJXP78os8+nkYLGqmmL297+k26HmYCWoCJ2
         XGXvfkP0Fx9XL9tTdCFrMOW96HxLG5MB0sdn2uqZKWYPIhKUrR/FQGfaUcbCNsgZia2i
         YHlfmB4/W+vKfkWBldLm+a3TuM5zWKryxoJX7BBx5h/z0t1eAr0e8HrCKZwPy9zQkey6
         uqWA9MtOu4o03Jwz+armIsoJY6mOYr3N2yf8rIfvjY6Q2DjkcQHS/JnIk5ifmj2x1lEK
         Cpeg==
X-Gm-Message-State: AOJu0YzR5LRkKux3dk8PLpkF7O+qbUckuhlymj497ewfJrwMiY1d1eWa
	/XJcnQHH6jyVu0fDdr0AuTz9JNMLtMhmJ/cqNFgqa+9GVXTK+LFVOF3PbdXSMdXx4hzckejwGDC
	EJWzza/WPS7Vun2N/mDGjViaRzu9a+MZY2AAChTDBgQ==
X-Gm-Gg: ASbGncvcAWlrnJr6YVaizLwCpKCagHBD5y5hwhDMmaQx+2X1bc8H9tPK49dW9Tpua83
	yhPou4EfO30Mnq5mXuL4zr7+43d/9VyG4i2hJ8m9U2ZBH28k/3C834Nn1onp6D8G6hKOwwvtT0H
	q81IzKNOjH1IzeoIIx2+6jWhNLYOMY9VTnlqlEB3EwHVx2p1hU1WOHYJyLQu2Raq9NXCs9SGheR
	pQ7f+VvuQ3YWeBoChAlcUcWWHk0ShDM8/1cl4hHs92+gYofhwHP1FucmIIW9dViTZyKY9r34foT
	YMZWuolsasLRlGmMCQ==
X-Google-Smtp-Source: AGHT+IFO8T0seoFuX1kox7DT6pbMWjLO17WXSDi081fJxS2sXEhXiWLiInXj5kElL4+e7nQP9LC9EFja4uw320kbwPM=
X-Received: by 2002:a05:6e02:1749:b0:42f:680c:9cc7 with SMTP id
 e9e14a558f8ab-4320f7729dbmr31630745ab.16.1761631367953; Mon, 27 Oct 2025
 23:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Oct 2025 11:32:37 +0530
X-Gm-Features: AWmQ_bncOUV3CETIbcAN6UpvUXFmSJXtFmlHVQbUN6wFYrXNhYlBq0GJGAG7lqM
Message-ID: <CAAhSdy2oFjeoKZKGLzOmAqwoNK0sJ=GeBnF1Tu-B0b8cv_vkEQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/12] Add SiFive TMC0 and SMC0 driver
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Cyan Yang <cyan.yang@sifive.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_230249_226901_F978B64D 
X-CRM114-Status: GOOD (  17.68  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTE6NTbigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gU2lGaXZlIFRNQzAgYW5kIFNNQzAgYXJlIHRoZSBwb3dlciBjb250
cm9sbGVycyB0aGF0IGNvbnRyb2xzIHRoZSBUaWxlIGFuZAo+IENvcmVDb21wbGV4IHBvd2VyIGRv
bWFpbi4gQWRkIHRoZSBkcml2ZXJzIHRvIHN1cHBvcnQgdGhlIHBvd2VyCj4gbWFuYWdlbWVudCBm
ZWF0dXJlcyBzdWNoIGFzIEhTTSBTVE9QIGFuZCBTeXN0ZW0gU3VzcGVuZC4KPgo+IEZlYXR1cmVz
IHN1Y2ggYXMgcG93ZXIgbWFuYWdlbWVudCBtYXkgcmVxdWlyZSBmbHVzaGluZyB0aGUgZW50aXJl
Cj4gY2FjaGUgYmVmb3JlIGVudGVyaW5nIGEgbm9uLXJldGVudGlvbiBwb3dlciBzdGF0ZS4gVG8g
c3VwcG9ydCB0aGlzLCBhCj4gc2ltcGxlIGNhY2hlIGZsdXNoIGZyYW1ld29yayBpcyBpbnRyb2R1
Y2VkIHRvIGFsbG93IHRoZSBleHRlcm5hbCBDTU8KPiB0byBwZXJmb3JtIGEgZnVsbCBjYWNoZSBm
bHVzaC4KPgo+IC0tLQo+IENoYW5nZXMgaW4gdjc6Cj4gLSBVcGRhdGUgdGhlIGNoYW5nZSBsb2cg
b2YgUEFUQ0ggOSBhbmQgUEFUQ0ggMTIgYmVjYXVzZSB0aGUgVE1DMCBhbmQgU01DMCBhcmUgbW92
ZWQgdG8gdGhlCj4gICBsaWIvdXRpbHMvaHNtIGFuZCBsaWIvdXRpbHMvc3VzcGVuZC4KPiAtIEFk
ZCBuZXcgY29tbWl0IHRvIEV4dGVuZCB0aGUgc2JpX2lwaV9yYXdfc2VuZCgpIHRvIHVzZSBhbGwg
YXZhaWxhYmxlIElQSSBkZXZpY2UgaW4KPiAgIFBBVENIIDggYW5kIHVzZSBpdCBpbiBQQVRDSCA5
Cj4gLSBBZGQgYHN5c3RlbV9yZXN1bWVgIGNhbGxiYWNrIGZvciBzeXN0ZW0gc3VzcGVuZAo+IC0g
U2luY2UgdGhlIFNNQzAgZHJpdmVyIG5lZWQgdGhlIGBhcGxpY19yZWluaXRfYWxsKClgLCB1cGRh
dGUgdGhlCj4gICBTTUMwIEtjb25maWcgb3B0aW9uIHRvIGRlcGVuZCB1cG9uIHRoZSBBUExJQyBL
Y29uZmlnIG9wdGlvbgo+IC0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDkwNS1jYWNoZS11cHN0cmVhbS12Ni0wLTZhNmRhNjI5Yzk2MUBzaWZpdmUuY29tCj4KPiBD
aGFuZ2VzIGluIHY2Ogo+IC0gUmVuYW1lIHRoZSBhcGxpY19yZXN0b3JlKCkgdG8gYXBsaWNfcmVp
bml0X2FsbCgpCj4gLSBSZW1vdmUgZmR0X2hzbV9zaWZpdmVfdG1jMF9jb2xkX2luaXQoKSBmcm9t
IFRNQzAgaGVhZGVyIGZpbGUKPiAtIFJlbW92ZSB0aGUgc2lmaXZlX2Rldl9wbGF0Zm9ybS5jCj4g
LSBBZGQgYSBkdW1teSBpbmxpbmUgZmxhdm9yIG9mIGZkdF9jbW9faW5pdCgpIGZvciB0aGUgY2Fz
ZSB3aGVyZSBDT05GSUdfRkRUX0NBQ0hFIGlzIGRpc2FibGVkCj4gLSBMaW5rIHRvIHY1OiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwOTAyLWNhY2hlLXVwc3RyZWFtLXY1LTAtYWY2MGEw
NjdmNDdhQHNpZml2ZS5jb20KPgo+IENoYW5nZXMgaW4gdjU6Cj4gLSBQdXQgdGhlIFNpRml2ZSBU
TUMwIGRyaXZlciB0byB0aGUgZmR0X2Vhcmx5X2RyaXZlcgo+IC0gRml4IHRoZSBmb3JtYXQgb2Yg
dGhlIGNvbW1lbnRzIGluIFNpRml2ZSBUTUMwIGRyaXZlcgo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAt
IENhbGwgZmR0X2Ntb19pbml0KCkgZGlyZWN0bHkgYXMgcGFydCBvZiBnZW5lcmljX2Vhcmx5X2lu
aXQoKQo+IC0gUmVuYW1lIFNCSV9IQVJUX0VYVF9YU0YqIHRvIFNCSV9IQVJUX0VYVF9YU0lGSVZF
Kgo+IC0gTW92ZSB0aGUgVE1DMCBkcml2ZXIgdG8gdGhlIGxpYi91dGlscy9oc20vCj4gLSBNb3Zl
IHRoZSBTTUMwIGRyaXZlciB0byB0aGUgbGliL3V0aWxzL3N1c3BlbmQvCj4KPiBDaGFuZ2VzIGlu
IHYzOgo+IC0gQWRkIHRoZSBTaUZpdmUgVE1DIGFuZCBTTUMgZHJpdmVyCj4KPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gU2luY2UgdGhlIHBsYXRmb3JtIG92ZXJyaWRlIGhvb2tzIHdhcyBkZXByZWNhdGVk
LCB1c2UgdGhlIGZkdF9kcml2ZXIKPiBmb3IgaW5pdGlhbGl6aW5nIHRoZSBzaWZpdmVfZGV2X3Bs
YXRmb3JtLgo+Cj4gLS0tCj4gTmljayBIdSAoMTApOgo+ICAgbGliOiB1dGlsczogQWRkIGNhY2hl
IGZsdXNoIGxpYnJhcnkKPiAgIGxpYjogdXRpbHM6IEFkZCBGRFQgY2FjaGUgbGlicmFyeQo+ICAg
bGliOiB1dGlscy9jYWNoZTogQWRkIGZkdCBjbW8gaGVscGVycwo+ICAgbGliOiBzYmk6IEFkZCBT
aUZpdmUgcHJvcHJpZXRhcnkgeHNmY2ZsdXNoZGxvbmUKPiAgIGxpYjogc2JpOiBBZGQgU2lGaXZl
IHByb3ByaWV0YXJ5IHhzZmNlYXNlCj4gICBsaWI6IHNiaTogRXh0ZW5kcyBzYmlfaXBpX3Jhd19z
ZW5kKCkgdG8gdXNlIGFsbCBhdmFpbGFibGUgSVBJIGRldmljZXMKPiAgIGxpYjogdXRpbHMvaXJx
Y2hpcDogQWRkIEFQTElDIHJlc3RvcmUgZnVuY3Rpb24KPiAgIHBsYXRmb3JtOiBzaWZpdmU6IEFk
ZCBTaUZpdmUgVE1DMCBkcml2ZXIKPiAgIGxpYjogdXRpbHMvdGltZXI6IEV4cG9zZSB0aW1lciB1
cGRhdGUgZnVuY3Rpb24KPiAgIHBsYXRmb3JtOiBzaWZpdmU6IEFkZCBTaUZpdmUgU01DMCBkcml2
ZXIKPgo+IFZpbmNlbnQgQ2hlbiAoMSk6Cj4gICB1dGlsczogY2FjaGU6IEFkZCBTaUZpdmUgY2Nh
Y2hlIGNvbnRyb2xsZXIKPgoKQXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3BlbnNi
aSByZXBvLgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
