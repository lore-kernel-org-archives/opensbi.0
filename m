Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E7DFF5106
	for <opensbi@archiver.kernel.org>; Tue,  7 Apr 2026 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZR+kX06aHRhX01ok7as9JNsobGOjrTA96WETSD2LZag=; b=0RWBl1Fyc6DisO
	AedmTavdR6Ge49pWRH9HqqfwmFOSgnZxC6yCAncPosLwzdRR/yzmZ8MvbmXKRbuGCA5iQMyun0llG
	jzMTAc+OUggyHCxkunsT9qjcLTEAKFF/KCjeb29xM22ub6eFX+e/qJpghwKk9lsbxK9AvkocUgHrw
	kbTPw1vHezpZHXdEymozfZ63WCsQJeUetCWUSoJgv06OMf7UxBTIgyt7q6GYTVmzjppcAqEFnQW5Q
	EP/2Ks1bkBb2uoqQ7GOhQoS1v1/cNVBLllfDeu3CB52mbZ+BGuOemCpTz0Sxf08v/5orYubi+ZgBA
	kUCCJ/Lyukvv5n9xiT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8dU-00000006jte-22A5;
	Tue, 07 Apr 2026 15:46:40 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8dR-00000006jtD-1YgF
	for opensbi@lists.infradead.org;
	Tue, 07 Apr 2026 15:46:38 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-953a2a4761cso2989034241.1
        for <opensbi@lists.infradead.org>; Tue, 07 Apr 2026 08:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775576796; cv=none;
        d=google.com; s=arc-20240605;
        b=DTiOsx8LYJn0vrYmWMGFN/Qeih/HWvYhsCUgxxgrcyRjdSv+ibQF7OtbVwIkv5zXkv
         BcSGZkoNadVLNRUNbKv+HDXa3napLDLpwYERWVNqkiQP70FxQUrBGCp+g8rzq3EhE8qj
         rmS+PyXHg35NW2QYdAmAxDQUKkkYk+jvH3/qO25YWLHleBKTikiqEBr91FPTlPPTQaVz
         UcZwsjmJbB8EqEF6FgJonXJrfopkhDFul8yQowmJEDdxEmBFQRlxXc1rtfZj4lUu3OgM
         e9i64yO1L+4wClkDBKDROO9pIoq+davdbNElpnYTGJt63zYEXBbBaPBUa8VYcHMrajEi
         RNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VNEwBD3UK8DhjETk28FPFKCAsLtEMFtKxIMqHVDlnF8=;
        fh=Ejg+htItz73PS/wfAdHtxAQHXRUik5FxC9unCi7r5hQ=;
        b=iiBsppaDfiw3IrYinZN+SVbKMYVmEU/13x9EnkFdM/Gnkt7b47LbcAwxemAiIF7Z7a
         GLTJpnEuXhlh//hGgij4M3PslBLnZsswP/6luv4qCc0ITuYTxaCUyE1msrqfp6AMNl+2
         c8BiOwBNe3O2KJzOYr3sNWzyb17p6G6KW69wrdvOPH135ynCl9iZkgLKgzanERqVFZOw
         +icvftFiGEuH+jV0UtwmjO1ibJXvUg1Sx3/bOSt0VCdanPulCYq8o2oBCZ/BGgATdBiQ
         YFW2Cg0IPq3DCAK7INZl/OoqoaHHMa3cUKdE3hS0fvpZBpBt630HsWgXhTU/4YyZOMIQ
         GVng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775576796; x=1776181596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNEwBD3UK8DhjETk28FPFKCAsLtEMFtKxIMqHVDlnF8=;
        b=g3RuIPp78jfJAbUsHLKDH4/G9Qu1ngqL28fRD0QIt5I84hcZTkxqOYPqkip7NDvzTq
         x2ZulJdfecwbDEYAE0ewz/py6MLaLsrFnL+eQNQ8WQteFybH7sMCMbRP3tdzDW3CuWQj
         5wYJXPsd5RPYNJd/LpgkB8eo0KMkox4iR8RG3Ztj/xwmICR/D2jqmILnzManpFARyzUU
         3jnugr7gt5pFCbyHBfMUjGG7G29dZ3m1Y2QyFeJlaJSyOC3KfeMk5A2qFluj1pyflosy
         IHMwj45BLQUAEPfH6kKwdVqp7ef50ihbLV886GRhXuQ9exrV5XoPbjFO0XYSvUjYK1XA
         vQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576796; x=1776181596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VNEwBD3UK8DhjETk28FPFKCAsLtEMFtKxIMqHVDlnF8=;
        b=d2GBEU/dnlP+RgtH63GG7hVumhmv1EmEyOWgKkDHazlGT71Kgjf4NDCXNxnApZ5i/R
         StNVqWrWU2iPAdFrOZshI+BQL+V9GezowYXdsunIE5XiQ8H3qAGSOQEK+KPYf3A+9tjo
         Z8xAnuJ1pS29LDcMiG5pWJY3fMsZRzRXM3JIvPMUurIkkXJyzSWoX6KsMJdtMYAZdIA3
         eD50xNS1AZ8Pyn5rNGGBM/wQg3yvxiuZuS26eBNCnOox9ByqM1Y8HgckrzJZCqSQyIO+
         w0BsecyvIPkZkRXT37AiS4f9K7AQOtRkTas5gMK3B/LgFutaY4QGCBtaEcs8k+HOR1mq
         Q4ow==
X-Gm-Message-State: AOJu0Yzifhn9byjENszbFlhkhYMSe81eKgA9d8BknjFqfIaocfl4SiUJ
	uDlBFb4BJKa1KWKJusYKSOTtd3pynAVfLenXyNeGb7Y3Xfr08KuXpBVItb+L6LjvBnykP5laLD8
	ndReS133uo3ED7xMjMaoTjatIf6eyK9A=
X-Gm-Gg: AeBDiet9Ncjk/arQt0YZSbTmgdSX7hPEw2Ue5/U15gPqfj/rPLRi5ASITg+SzeCRsZy
	5dutfyEIjrDFr4JLC/PGfFD3HlLgmwyh2RSIfHpxA8Na0t1Hrss5DwOYaSX/fl9glk0gY+T3ij5
	z+2u9Yg+suz/hqBOayzH+gjPLKMioA/nqQ8K2xbZzL5nqv6Lpy4JJljtZRnekhyxP9B6IA22Vh4
	iQTLAGN0qEvCrHEC9j6m1SrF8etoEgZ3jGjvGY0f3Flr27FYZUO5acct4KzYHDHOJGJBsrpd994
	16to+obvJXphlvh3AuI=
X-Received: by 2002:a05:6102:201b:b0:607:95f4:53b5 with SMTP id
 ada2fe7eead31-60795f47e24mr456111137.4.1775576795509; Tue, 07 Apr 2026
 08:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201849.903071-1-raymondmaoca@gmail.com> <7177101d-8d27-429d-83c1-816d2edde2eb@sifive.com>
In-Reply-To: <7177101d-8d27-429d-83c1-816d2edde2eb@sifive.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Tue, 7 Apr 2026 11:46:24 -0400
X-Gm-Features: AQROBzACzN6B-4iSC38cn6WPrKWwVOJtJUkVXhuimwzwLvPlVlW2Wy6n0aX4ZmQ
Message-ID: <CAMDkj5zh=8=RnFb_VErS5P6WrKV5LhwQGLCFyXwSvh_xwyM+zA@mail.gmail.com>
Subject: Re: [RFC PATCH] sbi: add hardware isolation abstraction framework
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, anup@brainfault.org, dhaval@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_084637_453326_BF604E28 
X-CRM114-Status: GOOD (  29.68  )
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

SGkgUGV0ZXIsCgpPbiBTdW4sIEFwciA1LCAyMDI2IGF0IDM6MjTigK9BTSBZdS1DaGllbiBQZXRl
ciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIFJheW1vbmQsCj4KPiBP
biAzLzE3LzI2IDQ6MTggUE0sIFJheW1vbmQgTWFvIHdyb3RlOgo+ID4gRnJvbTogUmF5bW9uZCBN
YW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4KPiA+Cj4gPiBJbnRyb2R1Y2UgYSBzeXN0ZW0t
bGV2ZWwgaGFyZHdhcmUgaXNvbGF0aW9uIGZyYW1ld29yayB3aXRoIGEKPiA+IHJlZ2lzdHJhdGlv
biBBUEkgYW5kIHBlci1kb21haW4gY29udGV4dCB0cmFja2luZy4KPiA+IFRoaXMgZXN0YWJsaXNo
ZXMgYW4gYWJzdHJhY3Rpb24gdGhhdCBhbGxvd3MgbXVsdGlwbGUgbWVjaGFuaXNtcyB0bwo+ID4g
YmUgY29tcG9zZWQgd2hpbGUga2VlcGluZyBjb3JlIGRvbWFpbiBkYXRhIHN0cnVjdHVyZXMgaW5k
ZXBlbmRlbnQKPiA+IG9mIGFueSBzaW5nbGUgcGxhdGZvcm0gaW1wbGVtZW50YXRpb24uCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4K
Pgo+IFRoYW5rIHlvdSBmb3IgdGhlIFJGQyBwYXRjaCBvbiB0aGUgaGFyZHdhcmUgaXNvbGF0aW9u
IGZyYW1ld29yay4gSSdtCj4gY3VycmVudGx5Cj4gcmV3b3JraW5nIG91ciBpbnRlcm5hbCBXb3Js
ZEd1YXJkIHBhdGNoZXMgYW5kIHBsYW4gdG8gc2hhcmUgdGhlbSBmb3IKPiBkZXZlbG9wbWVudAo+
IHdpdGggSmltJ3MgV0cgUUVNVSBzaW11bGF0aW9uLgo+Cj4gSSB3YW50ZWQgdG8gb2ZmZXIgc29t
ZSBwZXJzb25hbCBpbnB1dCBiYXNlZCBvbiBteSBleHBsb3JhdGlvbiBvZiBhbgo+IGFsdGVybmF0
aXZlCj4gYXBwcm9hY2ggd2hpY2ggbWlnaHQgYmUgdXNlZnVsIGFzIHdlIGdhdGhlciBjb21tdW5p
dHkgZmVlZGJhY2suCj4KPiBUaGUgZ29hbCBpcyB0byB1dGlsaXplIFdvcmxkR3VhcmQgZm9yIHN5
c3RlbS1sZXZlbCBwcm90ZWN0aW9uIGluIHN0YXRpYwo+IHBhcnRpdGlvbmluZyBURUUgc2NlbmFy
aW9zIChlLmcuLCBPUC1URUUpLiBUbyBhY2hpZXZlIHRoaXMsIHdlIG5lZWQgdG8KPiB3b3JrIG9u
IHR3byBjb21wb25lbnRzOgo+Cj4gMS4gUklTQy1WIFdvcmxkcyBJU0EgRXh0ZW5zaW9uCj4KPiBU
aGUgV29ybGRzIElTQSBleHRlbnNpb24gWzFdIGludHJvZHVjZXMgcGVyLWhhcnQgV29ybGQgSUQg
KFdJRCkKPiBtYW5hZ2VtZW50IHZpYQo+IENTUnMgbGlrZSBgbWx3aWRgIGFuZCBgbXdpZGRlbGVn
YC4gVGhlc2UgY29uY2VwdHMgc2hvdWxkIGludGVncmF0ZSBuYXR1cmFsbHkKPiB3aXRoIE9wZW5T
QkkncyBkb21haW4gZnJhbWV3b3JrOgo+Cj4gLSBFYWNoIGRvbWFpbiBjYW4gYmUgYXNzaWduZWQg
YSBgbmV4dF93aWRgIChjb3JyZXNwb25kaW5nIHRvIGBtbHdpZGApCj4gLSBFYWNoIGRvbWFpbiBj
YW4gYmUgYXNzaWduZWQgYSBgbmV4dF93aWRsaXN0YCAoY29ycmVzcG9uZGluZyB0bwo+IGBtd2lk
ZGVsZWdgKQo+Cj4gV2hlbiBPcGVuU0JJIHN3aXRjaGVzIHRvIGEgdGFyZ2V0IGRvbWFpbiwgaXQg
YXNzaWducyB0aGUgZG9tYWluJ3MKPiBgbmV4dF93aWRgIHRvCj4gYG1sd2lkYCwgZWZmZWN0aXZl
bHkgZW5hYmxpbmcgaGFyZHdhcmUtZW5mb3JjZWQgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZQo+IGlz
b2xhdGlvbgo+IGZvciB0aGF0IHN1cGVydmlzb3IgZG9tYWluLgo+Cj4gMi4gV29ybGRHdWFyZCBD
aGVja2VyIERyaXZlcgo+Cj4gVGhlIFdHIGNoZWNrZXIgZHJpdmVyIHBhcnNlcyBkZXZpY2UtdHJl
ZSBpbmZvcm1hdGlvbiBhbmQgcHJvZ3JhbXMgdGhlCj4gV29ybGRHdWFyZAo+IGNoZWNrZXJzIHRv
IGNyZWF0ZSBhY2Nlc3MgY29udHJvbCBydWxlcyBhc3NvY2lhdGluZyBtZW1vcnkvZGV2aWNlCj4g
cmVnaW9ucyB3aXRoCj4gYWxsb3dlZCBXb3JsZCBJRHMuCj4gKFdlIFNpRml2ZSB3aWxsIGFsc28g
cHJvcG9zZSBEVCBmb3JtYXRzIGZvciB0aGlzLikKPgo+IERldmljZSBJc29sYXRpb24gRXhhbXBs
ZToKPgo+IGRldmljZUE6IFsweDEwMDAwMDAwLCAweDIwMDAwMDAwKSBXSUQzCj4gZGV2aWNlQjog
WzB4MjAwMDAwMDAsIDB4MzAwMDAwMDApIFdJRDAsIFdJRDMgKHNoYXJlZCkKPiBkZXZpY2VDOiBb
MHgzMDAwMDAwMCwgMHg0MDAwMDAwMCkgV0lEMAo+Cj4gTWVtb3J5IFBhcnRpdGlvbmluZyBFeGFt
cGxlOgo+Cj4gR2l2ZW4gYSBEUkFNIHJhbmdlIGBbMHg4MDAwXzAwMDAsIDB4MV8wMDAwXzAwMDAp
YCwgd2UgY2FuIHBhcnRpdGlvbiBpdAo+IGFzIGZvbGxvd3M6Cj4KPiB8IE1vZGUgICAgfCBNYWlu
IFVzZXIgfCBXSUQgICAgICB8IFBoeXNpY2FsIEFkZHJlc3MgUmFuZ2UKPiAgICAgICAgICAgICAg
ICAgICAgIHwKPiB8LS0tLS0tLS0tfC0tLS0tLS0tLS0tfC0tLS0tLS0tLS18LS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPiB8IE0tbW9k
ZSAgfCBPcGVuU0JJICAgfCAgICAgICAzICB8IFsweDgwMDBfMDAwMCwgMHg4MDBDXzAwMDApCj4g
ICAgICAgICAgICAgICAgICAgICB8Cj4gfCBTVS1tb2RlIHwgTGludXggICAgIHwgMCwgMSwgMyAg
fCBbMHg4MDBDXzAwMDAsIDB4QzAwMF8wMDAwKSwKPiBbMHhDMTAwXzAwMDAsIDB4MV8wMDAwXzAw
MDApIHwKPiB8IFNVLW1vZGUgfCBPUC1URUUgICAgfCAgICAxLCAzICB8IFsweEMwMDBfMDAwMCwg
MHhDMTAwXzAwMDApCj4gICAgICAgICAgICAgICAgICAgICB8Cj4KPiBEdXJpbmcgYSBkb21haW4g
Y29udGV4dCBzd2l0Y2gsIE9wZW5TQkkgYXNzaWducyB0aGUgdGFyZ2V0IGRvbWFpbidzCj4gYG5l
eHRfd2lkYAo+IHRvIGBtbHdpZGAuIFRoaXMgZW5zdXJlcyB0aGF0IHRoZSBoYXJ0IGNhbiBvbmx5
IGFjY2VzcyBtZW1vcnkgcmVnaW9ucwo+IGFzc29jaWF0ZWQKPiB3aXRoIHRoZSBhY3RpdmUgV0lE
LCBwcm92aWRpbmcgaGFyZHdhcmUtZW5mb3JjZWQgaXNvbGF0aW9uLgo+Cj4gT25lIG9wZW4gcXVl
c3Rpb24gSSdtIGV4cGxvcmluZyBpcyB3aGV0aGVyIHRvIGV4dGVuZAo+IGBzYmlfZG9tYWluX21l
bXJlZ2lvbmAgd2l0aAo+IFdvcmxkR3VhcmQtc3BlY2lmaWMgZmllbGRzIChmbGFncywgcGVybWlz
c2lvbnMsIGFsbG93ZWQgV0lEcykgYXMgYnVzIGNoZWNrZXIKPiByZWdpb24gZGVzY3JpcHRvciBm
b3IgZm9sbG93aW5nIGNvbnNpZGVyYXRpb25zOgo+IC0gV29ybGRHdWFyZCBjaGVja2VyIHNsb3Rz
IHdpbGwgbWFrZSB1c2Ugb2YgVE9SIGFkZHJlc3NpbmcgbW9kZSwgd2hpY2gKPiAgICBQTVAgZG9l
cyBub3QKPiAtIFdvcmxkR3VhcmQgc2xvdHMgZG8gbm90IGhhdmUgZXhlY3V0ZSBwZXJtaXNzaW9u
IHNlbWFudGljcywgdW5saWtlIFBNUAo+IC0gUmV1c2luZyBQTVAtc3R5bGUgZmxhZ3MgZGlyZWN0
bHkgbWF5IGNhdXNlIGxvZ2ljIGVycm9ycyBpbiBmdW5jdGlvbnMgbGlrZQo+ICAgIGBzYmlfZG9t
YWluX2NoZWNrX2FkZHIoKWAKPgo+IEkgaGF2ZW4ndCBmdWxseSBpbXBsZW1lbnRlZCB0aGlzIHll
dCwgc28gdGhlIGRlc2lnbiBtYXkgY2hhbmdlIGFzIEkgd29yawo+IHRocm91Z2gKPiB0aGUgZGV0
YWlscy4KPgo+IEluIGFkZGl0aW9uIHRvIHRoZSBSSVNDLVYgV29ybGRzIElTQSBzcGVjaWZpY2F0
aW9uLCBJJ2QgbGlrZSB0byBzaGFyZQo+IHJlc291cmNlcy8KPiBmb3VuZCBoZWxwZnVsIGZvciB1
bmRlcnN0YW5kaW5nIFdvcmxkR3VhcmQgYW5kIHN5c3RlbS1sZXZlbCBwcm90ZWN0aW9uOgo+IC0g
WzFdIFJJU0MtViBXb3JsZHMgSVNBIEV4dGVuc2lvbjoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi9yaXNjdi13b3JsZHMvcmVsZWFzZXMvZG93bmxvYWQvcmlzY3YtaXNhLXJlbGVhc2UtNGFl
MjEwNS0yMDI2LTAxLTA5L3Jpc2N2LXByaXZpbGVnZWQucGRmCj4KPiAtIFsyXSBSSVNDLVYgU2Vj
dXJlIFN5c3RlbSBQYXJ0aXRpb25pbmcgd2l0aCBXb3JsZHMgYW5kIFRydXN0Wm9uZSAodjAuNy4y
KToKPiAgICBodHRwczovL2dpdGh1Yi5jb20vTUlQUy9yaXNjdi1wYXJ0aXRpb25pbmcvcmVsZWFz
ZXMvdGFnL3YwLjcuMgo+Cj4gLSBbM10gUklTQy1WIFBsYXRmb3JtIFNlY3VyaXR5IE1vZGVsICh2
MC41KToKPiAgICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytc2VjdXJpdHktbW9kZWwv
cmVsZWFzZXMvdGFnL3YuMDUKPgo+IC0gWzRdIFJJU0MtViBJbXBsZW1lbnRpbmcgQXBwbGljYXRp
b24gUHJvY2Vzc29yIFRFRXMgKFdoaXRlcGFwZXIpOgo+Cj4gaHR0cHM6Ly9yaXNjdi5vcmcvd3At
Y29udGVudC91cGxvYWRzLzIwMjUvMTAvUklTQy1WLUltcGxlbWVudGluZy1BcHBsaWNhdGlvbi1Q
cm9jZXNzb3ItVEVFcy1SRVYtMS5wZGYKPgo+IEFnYWluLCB0aGVzZSBhcmUganVzdCBteSBxdWlj
ayBub3RlcyBhbmQgcGVyc29uYWwgaW5wdXQgZm9yIHRoaXMgbWlsZXN0b25lLgo+IFdlIHNob3Vs
ZCBrZWVwIHRhbGtpbmcgd2l0aCB0aGUgY29tbXVuaXR5IHRvIGVuc3VyZSBvdXIgcGxhbiBpcyBv
biB0aGUgcmlnaHQKPiBkaXJlY3Rpb24uCj4KPiBMb29raW5nIGZvcndhcmQgdG8gY29sbGFib3Jh
dGluZyBvbiB0aGlzIQo+CgpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBmZWVkYmFjayBhbmQgdGhl
IFdHL1dvcmxkcyBjb250ZXh0IOKAlCB2ZXJ5IGhlbHBmdWwuCgpUaGUgcHJvcG9zZWQgSFdJU08g
aXMgbWVhbnQgdG8gYmUgYSBnZW5lcmljIGZyYW1ld29yayBmb3IgaXNvbGF0aW9uCm1hbmFnZW1l
bnQgYWNyb3NzIGRvbWFpbiBsaWZlY3ljbGUgcGhhc2VzIChib290LCBkb21haW5faW5pdCwgZG9t
YWluCmV4aXQvZW50ZXIpLiBUaGUgaW50ZW50IGlzIHRvIGtlZXAgdGhpcyBsYXllciBtZWNoYW5p
c23igJFhZ25vc3RpYywgYW5kCmhhdmUgc3BlY2lmaWMgdGVjaG5vbG9naWVzIChsaWtlIFdHL1dv
cmxkcykgcGx1ZyBpbiBhcyBvbmUgb2YgdGhlCnJlZ2lzdGVyZWQgbWVjaGFuaXNtcy4KCkZyb20g
eW91ciBkZXNjcmlwdGlvbiwgV0cgZml0cyB3ZWxsOiBhIFdHIG1lY2hhbmlzbSBjYW4gcGFyc2Ug
aXRzIG93bgpEVCBiaW5kaW5nLCBrZWVwIHBlcuKAkWRvbWFpbiBjb250ZXh0IChuZXh0X3dpZC9u
ZXh0X3dpZGxpc3QsIGNoZWNrZXIKY29uZmlnKSwgYW5kIHByb2dyYW0gaGFyZHdhcmUgb24gZG9t
YWluIGVudGVyL2V4aXQuIFRoaXMgYXZvaWRzCmZvcmNpbmcgV0cgaW50byBQTVAgc2VtYW50aWNz
IG9yIHNiaV9kb21haW5fbWVtcmVnaW9uLgoKU28gZm9yIHRoaXMgcGhhc2UgSSBwbGFuIHRvIGtl
ZXAgdGhlIEhXSVNPIGFic3RyYWN0aW9uIG1pbmltYWwgYW5kCm1lY2hhbmlzbS1kcml2ZW4uIFdo
ZW4geW91IHNoYXJlIHRoZSBXRyBEVCBmb3JtYXQgYW5kIGltcGxlbWVudGF0aW9uLAp3ZSBjYW4g
aW50ZWdyYXRlIGl0IGFzIGFub3RoZXIgcmVnaXN0ZXJlZCBtZWNoYW5pc20gdW5kZXIgSFdJU08K
d2l0aG91dCByZWZhY3RvcmluZyB0aGUgZnJhbWV3b3JrIGl0c2VsZi4gSWYgd2UgZGlzY292ZXIg
d2UgbmVlZAptdWx0aeKAkWluc3RhbmNlIHN1cHBvcnQgb3IgcmljaGVyIG1hdGNoaW5nIGF0IHRo
ZSBmcmFtZXdvcmsgbGV2ZWwsIHdlCmNhbiBldm9sdmUgaXQgdGhlbi4KCkxvb2tpbmcgZm9yd2Fy
ZCB0byBjb250aW51aW5nIHRoZSBkaXNjdXNzaW9uLgoKVGhhbmtzIGFuZCByZWdhcmRzLApSYXlt
b25kCgo+IEJlc3QgcmVnYXJkcywKPiBQZXRlciBMaW4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
