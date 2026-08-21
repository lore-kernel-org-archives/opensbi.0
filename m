Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFDAC5DF87
	for <opensbi@archiver.kernel.org>; Fri, 21 Aug 2026 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJsozIyxtdDypKD8XofyPSJ1H3iGPwgYROSUJCOByCo=; b=rucXdNjbC/otvz
	KSdahAC9V197hDxux1W3YIGsXwa0HB50rAqlqRbD1hbIC+kZ45yzOLjaJDs9+aRqyPSCoGOzZqsD9
	Mr9IOhVVQWOpkaRQ8hT2Zj09Ylpqx4u3PHy5rQyj1w7KcNFgX+uswJM/+9BHayX6T6tfBO3uYr2xq
	n0r65vImw1L29ChhIpVtZBMPlN7NioVRB9ZKkCE/1PR1p1ixx5JaJJy57/k/f2Wh1r0S9eyFgXZYq
	2pWGK08mvnYnsDF1LVZLv9AtragWpUMbSDvircdZ7IVr6IVa6/KAJH1ducblkLQFLLbNu8DdBR+FF
	5AMa3z6GFdKDIfZIMBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLei-0000000Cvwl-2gMx;
	Fri, 21 Aug 2026 09:35:20 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLef-0000000CvwN-0DKA
	for opensbi@lists.infradead.org;
	Fri, 21 Aug 2026 09:35:19 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a422090b14so1273181a12.1
        for <opensbi@lists.infradead.org>; Fri, 21 Aug 2026 02:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787304915; cv=none;
        d=google.com; s=arc-20260327;
        b=GHGkv7yxjj13Kn3XKhPwHkCp6Uqn7cFlQIGmm8JJ4b1Js1010zgys+1ghpHqH6jnE2
         xIg70LIAmqYTy+/8Wp6g8bxl3bqHE0TCvu+26YOKKsLhe3csYAUVJ0QUwksXU8xENKRD
         8Tk4a88XkLaAliwKMdSiVLUn3zbU/GOGy5ssQprIEynesi7xRihIEC2Y8nhX97tRrCrT
         XgxHdcW1/AHLKy6PISab2HymlWkQJAWpoOPj2sIJlSoTr9B5vJbZmCINC8IPku7fSwrZ
         Svu3xm6C/vAARcqJPLqwGqCzUwaecaH5JqKDr0/cyCyg8NvAr3FR1Vp4W4XSki8krz3i
         h+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCg4f/AKFIlfxUNRZUOI3w52DNRmkmQvLR2FUs4RO0A=;
        fh=84iVe/PSOJxldWpQ6pMR7IhUk9iJTQ25iYxQQpMMt2s=;
        b=jvgCJsrVw50JrksFL5y8ox9JGuZ+hvIE3DmzOtojFFrT/J9Xhq5rJ7jJv/5tIqDV/g
         n2Kwclp5JCCZtMXE8uhtMnJJJ4PT/485AeMlkEfK3v1/8GxZxojd3bDO22dieEKGYmYA
         HBNGWK9cTw41sIus1zVx7KqN3FsPi3YcHqGMD7q7ZCSERj47Y3ZVsMW0vTFMdXyLBKhj
         SNkPxjH/DoqS/8UT3wmvdYX7cJ8eFNChGAgkw5O065kDVO/M/aBNdOi3vuUn06aJmaCc
         Ub8S/+bSTpHMT0Soe8LQSM9d72haTDrZXcqXRyhQ1atnXNKXcJnfH/0VX+UNCByFCebe
         O6jQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787304915; x=1787909715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCg4f/AKFIlfxUNRZUOI3w52DNRmkmQvLR2FUs4RO0A=;
        b=nblARsRCkUuCjpjWa2hMoK5lDE/KHWcmLraJ3nYOFQD3/4Wxs3UZU/vK+cZZtxNQxa
         YWHEKAMOOBDb5+BEMBIyGiWg1I0fJ7mEzxGovIJ8Dqvnx0FdmidUX3xhZO3mjOrKV8YJ
         dKZHVQW/pfiCnLsRpVv5Ty4O9qrE3UyPdBFnXL5mgjLzioUbYpx4tMJpM+1LRwazmxG1
         WIr5+2TYNbtLDnFrxVwN/qA2DDYVijuLeK8b52RCFZrctqcKzKuLR2nGz40A3MQMLjTG
         tI+5ZHxenhBs85BeEtMaPjdhFtj8PoVAtqbw50wOs+NfvaWZUWQkNxCO5FJJBugUTMJ+
         CDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304915; x=1787909715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCg4f/AKFIlfxUNRZUOI3w52DNRmkmQvLR2FUs4RO0A=;
        b=nNuCgPUfnWOndZNBj3hBExkZj9itKHpxXmpCcddfUyVeWqJS0/SWI9KjKY6Kc4uIZ5
         GUucRO4Nmi9NX/8xOpfMjbACwhytOHFR/6F2++pXc44XzlW3NEZmyzDGIfmIybTruVRe
         A2X4JF5zfWSeolmhabotbYvC+RKEo3qxB8q3BcAIbBtqYYer6ZqQ7bX+wLvAL/oe7ibe
         LjEKvZBUcFvKkyhz+zlIipYpuFYLfwleaZTd448YYD3OfD3HuMGzuCOw7Oj8BImD0a73
         Tcd0A+oo1g8mIRAUpbcRtvplgidewpZZaY/0szRDKAuXHD3Mcni8JurRmC0VnxR+zVdk
         PMdg==
X-Gm-Message-State: AFuF++kvZq0b7wwThoaeHchplpgs8t92DexvdOP/9PYuox6lnyrUf0vD
	P0xyePKMSIZDQZKv5zJbtPbqfbO/c3r7ETPS2P7UWu3wx4vrabUDterfFN4bWbSRYPKOtfxzxiv
	0tPI8akpAAevgVoOUWbRe3fJZlR+Zjm26E5c0wbWq6ZH6uNqlo2nDWxYjWepL
X-Gm-Gg: AR+sD12megYHMUPjzGUWcCWSiWFMzSIBzh0XHOm3zKzAVXWwihh8yAxK/Cu2UZB6enH
	ISWIF0YtiOdnALb0hp+e67ufBmmywpV/91tNleCBhItqBBZYlaQXOqk4rIdFjd2NaEAgCkrgyMf
	sMGHtqhq5sF9JcVDBbA7URbanntmK3nBRggexm4oDyWGz5gLTQScs76pzpuDu5wU+5Knv5cpP8+
	7rVn5cABqnMqF5nQ7bMbatG8URLLNlmPKcnOdgSOyvFpmUO1HcvB5cy6UDq0/sbOkeML0OKacAX
	gd6QpzHLzhBhwnH8OOufUqdePxxQEFZgmfTutm5riX0w5ek=
X-Received: by 2002:a17:906:6205:b0:c21:992e:63f2 with SMTP id
 a640c23a62f3a-c246a4a9ff1mr557410666b.1.1787304915131; Fri, 21 Aug 2026
 02:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260707033954.2054859-1-zong.li@sifive.com> <CAAhSdy0ctLCb6AhbQaz-TY2Bb8uGC6ToCaeCsADUJCyR-2WtDQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0ctLCb6AhbQaz-TY2Bb8uGC6ToCaeCsADUJCyR-2WtDQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 Aug 2026 17:35:03 +0800
X-Gm-Features: AcwNN1UcxTw4mW0_Mk6hRNpOzkW1dRPvsenGByCEvqLpVh5HfyZUpMiQ1jpk9LU
Message-ID: <CANXhq0pmZd9TYcA5Y1cGwRT8vDWzz3ceia6Zt2hsYa3MVg1uDA@mail.gmail.com>
Subject: Re: [PATCH 0/7] firmware: add FW_DYNAMIC_APPEND firmware type
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_023517_142666_59C12B94 
X-CRM114-Status: GOOD (  36.27  )
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

T24gV2VkLCBBdWcgMTksIDIwMjYgYXQgODo1N+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgNywgMjAyNiBhdCA5OjEw4oCvQU0gWm9u
ZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHNlcmllcyBhZGRz
IGEgZm91cnRoIE9wZW5TQkkgZmlybXdhcmUgdHlwZSwgRldfRFlOQU1JQ19BUFBFTkQsIG5leHQg
dG8KPiA+IHRoZSBleGlzdGluZyBGV19EWU5BTUlDLCBGV19KVU1QIGFuZCBGV19QQVlMT0FELgo+
ID4KPiA+IE1vdGl2YXRpb24KPiA+ID09PT09PT09PT0KPiA+Cj4gPiBGV19EWU5BTUlDIHJlcXVp
cmVzIHRoZSBwcmV2aW91cyBib290aW5nIHN0YWdlIHRvIGJ1aWxkIGEgc3RydWN0Cj4gPiBmd19k
eW5hbWljX2luZm8gaW4gbWVtb3J5IGFuZCBwYXNzIGl0cyBhZGRyZXNzIGluIGEyLiBTb21lIGJv
b3Rpbmcgc3RhZ2VzCj4gPiBjYW5ub3QgZWFzaWx5IGFsbG9jYXRlIGFuZCBwYXNzIHN1Y2ggYSBz
dHJ1Y3R1cmUsIGJ1dCB0aGV5IGNhbiBsb2FkIHRoZQo+ID4gT3BlblNCSSBpbWFnZSBhbmQgcGF0
Y2ggYSBmZXcgd29yZHMgYXQgYSBrbm93biBsb2NhdGlvbiBiZWZvcmUganVtcGluZyB0bwo+ID4g
aXQuIEZXX0RZTkFNSUNfQVBQRU5EIHRhcmdldHMgZXhhY3RseSB0aGF0IGNhc2U6IHRoZSBzdHJ1
Y3QgZndfZHluYW1pY19pbmZvCj4gPiBpcyBhcHBlbmRlZCBpbnRvIHRoZSBPcGVuU0JJIGJpbmFy
eSBhbmQgcGF0Y2hlZCBpbiBwbGFjZSBieSB0aGUgcHJldmlvdXMKPiA+IHN0YWdlLiBGb3IgZXhh
bXBsZSwgdGhlIHByZXZpb3VzIGJvb3Qgc3RhZ2UgcnVucyBvbiBhIGRlZGljYXRlZCBoYXJ0Lgo+
ID4gVGhlcmVmb3JlLCBpdCBjYW5ub3Qgc2V0IHVwIENTUnMgb2YgYW5vdGhlciBoYXJ0IHRoYXQg
cnVucyBPcGVuU0JJLgo+ID4gVGhpcyBzY2VuYXJpbyB3aWxsIG9jY3VycyBpbiBzZXJ2ZXIgc3lz
dGVtcyB3aXRoIHNlY3VyZSBib290Lgo+ID4KPiA+IEtleSBkZXNpZ24gcG9pbnRzCj4gPiA9PT09
PT09PT09PT09PT09PQo+ID4KPiA+ICAgLSBUaGUgYXBwZW5kZWQgc3RydWN0IGZ3X2R5bmFtaWNf
aW5mbyBpcyBwbGFjZWQgaW1tZWRpYXRlbHkgYmVmb3JlIC5ic3MuCj4gPiAgICAgLmJzcyBpcyBO
T0JJVFMgYW5kIGlzIGRyb3BwZWQgYnkgJ29iamNvcHkgLU8gYmluYXJ5Jywgc28gYSBzdHJ1Y3R1
cmUKPiA+ICAgICBhZnRlciBpdCB3b3VsZCBub3QgYmUgcGFydCBvZiB0aGUgZmxhdCAuYmluLiBQ
bGFjaW5nIGl0IGJlZm9yZSAuYnNzCj4gPiAgICAgbWFrZXMgaXQgdGhlIGxhc3QgUFJPR0JJVFMg
Y29udGVudCwgaS5lLiBpdCBzaXRzIGF0IHRoZSB0YWlsIG9mIHRoZQo+ID4gICAgIC5iaW4gYW5k
IGNhbiBiZSBsb2NhdGVkIGZyb20gdGhlIGltYWdlIHNpemUuIFRoZSBwcmV2aW91cyBib290aW5n
Cj4gPiAgICAgdGFnZSBjYW4gdGhlcmVmb3JlIGZpbmQgdGhlIHN0cnVjdHVyZSBhdDoKPiA+Cj4g
PiAgICAgICAgIGxvYWRfYWRkcmVzcyArIGJpbmFyeV9maWxlX3NpemUgLSBzaXplb2Yoc3RydWN0
IGZ3X2R5bmFtaWNfaW5mbykKPiA+Cj4gPiAgIC0gc3RydWN0IGZ3X2R5bmFtaWNfaW5mbyBnYWlu
cyBhIG5ldyAnYm9vdF9kdGInIGZpZWxkIChpbmZvIHZlcnNpb24gMykKPiA+ICAgICB0byBjYXJy
eSB0aGUgRFRCIGFkZHJlc3MuIEV4aXN0aW5nIG9mZnNldHMgYXJlIHVuY2hhbmdlZC4KPiA+Cj4g
PiAgIC0gVGhlIHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgcGF0Y2hlcyBldmVyeSBmaWVsZCBhdCBy
dW50aW1lLiBUaGUKPiA+ICAgICByZXNlcnZhdGlvbiBpcyBhIEtFRVAoKSBQUk9HQklUUyBzZWN0
aW9uLCBzbyB0aGUgemVyby1pbml0aWFsaXNlZAo+ID4gICAgIGJ5dGVzIHN0aWxsIGxhbmQgYXQg
dGhlIHRhaWwgb2YgdGhlIC5iaW4uCj4gPgo+ID4gICAtIE9uIHRoZSBjb2xkLWJvb3QgcGF0aCAo
Z3VhcmRlZCBieSBGV19EWU5BTUlDX0FQUEVORCksIGZ3X2Jhc2UuUyBjYWxscwo+ID4gICAgIGZ3
X2R5bmFtaWNfYXBwZW5kX2Jvb3RfYXJncygpIGluIGZ3X2R5bmFtaWNfYXBwZW5kLlMuIFRoZSBo
ZWxwZXIgc2V0cwo+ID4gICAgIGEwID0gbWhhcnRpZCwgYTIgPSAmYXBwZW5kZWQgc3RydWN0LCBh
bmQgYTEgPSBib290X2R0YiwgYW5kIGNsZWFycyB0aGUKPiA+ICAgICByZXNlcnZlZCBhMy9hNCB0
aGF0IGZ3X3BsYXRmb3JtX2luaXQgY29uc3VtZXMuIE9ubHkgYTAtYTQgYXJlIGhhbmRsZWQKPiA+
ICAgICBoZXJlLCB0aGUgcmVtYWluaW5nIEdQUnMgYXJlIGFscmVhZHkgY2xlYXJlZCBieSB0aGUg
ZXhpc3RpbmcgX3Jlc2V0X3JlZ3MKPiA+ICAgICBsYXRlciBvbiB0aGUgY29sZCBwYXRoLiBUaGUg
Ym9vdF9kdGIgbG9hZCBpcyBnYXRlZCBvbiBpbmZvIHZlcnNpb24gMywgc28KPiA+ICAgICBhbiBv
bGRlciBsYXlvdXQgbGVhdmVzIGExID0gMCBpbnN0ZWFkIG9mIHJlYWRpbmcgcGFzdCB0aGUgc3Ry
dWN0Lgo+ID4KPiA+IEJhY2t3YXJkIGNvbXBhdGliaWxpdHkKPiA+ID09PT09PT09PT09PT09PT09
PT09PT0KPiA+Cj4gPiBBbGwgY2hhbmdlcyBmb3IgdGhlIGV4aXN0aW5nIHRocmVlIGZpcm13YXJl
IHR5cGVzIGFyZSBjb21waWxlZCBvdXQ6IHRoZQo+ID4gZndfYmFzZS5TIGZpeHVwIGFuZCB0aGUg
LmZ3X2R5bmFtaWNfaW5mbyBvdXRwdXQgc2VjdGlvbiBhcmUgdW5kZXIKPiA+ICNpZmRlZiBGV19E
WU5BTUlDX0FQUEVORCwgd2hpY2ggaXMgZGVmaW5lZCBvbmx5IGJ5IGZ3X2R5bmFtaWNfYXBwZW5k
LlMgYW5kCj4gPiBmd19keW5hbWljX2FwcGVuZC5lbGYubGRTLiBGV19EWU5BTUlDLCBGV19KVU1Q
IGFuZCBGV19QQVlMT0FEIGJpbmFyaWVzIGFyZQo+ID4gYnl0ZS1mb3ItYnl0ZSB1bmNoYW5nZWQu
Cj4gPgo+ID4gQnVpbGQKPiA+ID09PT09Cj4gPgo+ID4gICBtYWtlIFBMQVRGT1JNPTxwbGF0Zm9y
bV9zdWJkaXI+IEZXX0RZTkFNSUNfQVBQRU5EPXkKPiA+Cj4gPiBPbiB0aGUgZ2VuZXJpYyBwbGF0
Zm9ybSBGV19EWU5BTUlDX0FQUEVORD15IGlzIHNldCBpbgo+ID4gcGxhdGZvcm0vZ2VuZXJpYy9v
YmplY3RzLm1rLCBzbyBpdCBpcyBidWlsdCBieSBkZWZhdWx0Lgo+ID4KPiA+IFpvbmcgTGkgKDcp
Ogo+ID4gICBmaXJtd2FyZTogZndfZHluYW1pYzogYWRkIGJvb3RfZHRiIGZpZWxkIHRvIHN0cnVj
dCBmd19keW5hbWljX2luZm8KPiA+ICAgZmlybXdhcmU6IGZ3X2Jhc2UubGRTOiBhZGQgLmZ3X2R5
bmFtaWNfaW5mbyBvdXRwdXQgc2VjdGlvbiBiZWZvcmUgLmJzcwo+ID4gICBmaXJtd2FyZTogYWRk
IGZ3X2R5bmFtaWNfYXBwZW5kIGZpcm13YXJlIHR5cGUKPiA+ICAgZmlybXdhcmU6IGZ3X2Jhc2Uu
UzogY2FsbCBmd19keW5hbWljX2FwcGVuZF9ib290X2FyZ3Mgb24gY29sZCBib290Cj4gPiAgIGZp
cm13YXJlOiBidWlsZCBhbmQgZW5hYmxlIHRoZSBGV19EWU5BTUlDX0FQUEVORCBmaXJtd2FyZSB0
eXBlCj4gPiAgIGRvY3M6IGZpcm13YXJlOiBkb2N1bWVudCB0aGUgRldfRFlOQU1JQ19BUFBFTkQg
ZmlybXdhcmUgdHlwZQo+ID4gICBkb2NzOiBmaXJtd2FyZTogbGlzdCBGV19EWU5BTUlDX0FQUEVO
RCBpbiBmdy5tZAo+Cj4gSW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBuZXcgZmlybXdhcmUgdHlwZSwg
c2FtZSB0aGluZyBjYW4gYmUgYWNoaWV2ZWQgYnkKPiBzaW1wbHkgaW50cm9kdWNpbmcgYSBmb3Jt
YXR0ZWQgaGVhZGVyIGZvciBhbGwgT3BlblNCSSBmaXJtd2FyZS4KPgo+IElmIHRoZSBwcmV2aW91
cyBib290aW5nIHN0YWdlIGNhbm5vdCBwYXNzIHBhcmFtZXRlcnMgaW4gYTAsIGExLCBhbmQgYTIK
PiB0aGVuIGl0IGNhbiBzaW1wbHkgb3ZlcnJpZGUgdGhlIHZhbHVlcyBvZiBhMCwgYTEsIGFuZCBh
MiBieSBzZXR0aW5nIGZpZWxkcwo+IGluIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyLgo+Cj4gRm9y
IGV4YW1wbGUsIHdlIGNhbiBoYXZlIDEyOC1ieXRlIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyIGRl
ZmluZWQKPiBpbiBmd19iYXNlLlMgYXMgZm9sbG93czoKPgo+IGRpZmYgLS1naXQgYS9maXJtd2Fy
ZS9md19iYXNlLlMgYi9maXJtd2FyZS9md19iYXNlLlMKPiBpbmRleCAwYzVjNjVjMS4uMGQ2M2Zl
MWUgMTAwNjQ0Cj4gLS0tIGEvZmlybXdhcmUvZndfYmFzZS5TCj4gKysrIGIvZmlybXdhcmUvZndf
YmFzZS5TCj4gQEAgLTQ0LDggKzQ0LDY0IEBACj4gICAuc2VjdGlvbiAuZW50cnksICJheCIsICVw
cm9nYml0cwo+ICAgLmFsaWduIDMKPiAgIC5nbG9ibCBfc3RhcnQKPiArIC5nbG9ibCBfc3RhcnRf
cmVhbAo+ICAgLmdsb2JsIF9zdGFydF93YXJtCj4gIF9zdGFydDoKPiArIC8qIE9wZW5TQkkgZmly
bXdhcmUgaGVhZGVyICovCj4gK19md19oZWFkZXJfanVtcDoKPiArIC5vcHRpb24gcHVzaAo+ICsg
Lm9wdGlvbiBub3J2Ywo+ICsgaiBfc3RhcnRfcmVhbAo+ICsgLm9wdGlvbiBwb3AKPiArX2Z3X2hl
YWRlcl9tYWdpYzoKPiArIC53b3JkIDB4NDk0MjUzNGYgLyogQVNDSUkgc3RyaW5nICJPU0JJIiAq
Lwo+ICtfZndfaGVhZGVyX3ZlcnNpb246Cj4gKyAud29yZCAweDEKPiArX2Z3X2hlYWRlcl94bGVu
Ogo+ICsgLndvcmQgX19yaXNjdl94bGVuCj4gK19md19oZWFkZXJfc2l6ZToKPiArIC53b3JkIChf
ZndfZW5kIC0gX2Z3X3N0YXJ0KQo+ICtfZndfaGVhZGVyX2ZsYWdzOgo+ICsjZGVmaW5lIEZXX0hF
QURFUl9GTEFHU19PVkVSUklERV9BMCAoMSA8PCAwKQo+ICsjZGVmaW5lIEZXX0hFQURFUl9GTEFH
U19PVkVSUklERV9BMSAoMSA8PCAxKQo+ICsjZGVmaW5lIEZXX0hFQURFUl9GTEFHU19PVkVSUklE
RV9BMiAoMSA8PCAyKQo+ICsgLndvcmQgMAo+ICtfZndfaGVhZGVyX292ZXJyaWRlX2EwOgo+ICsg
LmR3b3JkIDAKPiArX2Z3X2hlYWRlcl9yZXNlcnZlZDA6Cj4gKyAuZHdvcmQgMAo+ICtfZndfaGVh
ZGVyX292ZXJyaWRlX2ExOgo+ICsgLmR3b3JkIDAKPiArX2Z3X2hlYWRlcl9yZXNlcnZlZDE6Cj4g
KyAuZHdvcmQgMAo+ICtfZndfaGVhZGVyX292ZXJyaWRlX2EyOgo+ICsgLmR3b3JkIDAKPiArX2Z3
X2hlYWRlcl9yZXNlcnZlZDI6Cj4gKyAuZHdvcmQgMAo+ICtfZndfaGVhZGVyX3Jlc2VydmVkOgo+
ICsgLmZpbGwgNywgOCwgMAo+ICtfc3RhcnRfcmVhbDoKPiArIC8qIENoZWNrIGFuZCBvdmVycmlk
ZSBhMCwgYTEsIGFuZCBhMiByZWdpc3RlcnMgKi8KPiArIGxsYSB0MCwgX2Z3X2hlYWRlcl9mbGFn
cwo+ICsgbHcgdDAsICh0MCkKPiArIGxpIHQxLCBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVfQTAK
PiArIGFuZCB0MiwgdDAsIHQxCj4gKyBiZXEgdDIsIHplcm8sIF9za2lwX292ZXJyaWRlX2EwCj4g
KyBsbGEgdDIsIF9md19oZWFkZXJfb3ZlcnJpZGVfYTAKPiArIFJFR19MIGEwLCAodDIpCj4gK19z
a2lwX292ZXJyaWRlX2EwOgo+ICsgbGkgdDEsIEZXX0hFQURFUl9GTEFHU19PVkVSUklERV9BMQo+
ICsgYW5kIHQyLCB0MCwgdDEKPiArIGJlcSB0MiwgemVybywgX3NraXBfb3ZlcnJpZGVfYTEKPiAr
IGxsYSB0MiwgX2Z3X2hlYWRlcl9vdmVycmlkZV9hMQo+ICsgUkVHX0wgYTEsICh0MikKPiArX3Nr
aXBfb3ZlcnJpZGVfYTE6Cj4gKyBsaSB0MSwgRldfSEVBREVSX0ZMQUdTX09WRVJSSURFX0EyCj4g
KyBhbmQgdDIsIHQwLCB0MQo+ICsgYmVxIHQyLCB6ZXJvLCBfc2tpcF9vdmVycmlkZV9hMgo+ICsg
bGxhIHQyLCBfZndfaGVhZGVyX292ZXJyaWRlX2EyCj4gKyBSRUdfTCBhMiwgKHQyKQo+ICtfc2tp
cF9vdmVycmlkZV9hMjoKPiAgIC8qIEZpbmQgcHJlZmVycmVkIGJvb3QgSEFSVCBpZCAqLwo+ICAg
TU9WXzNSIHMwLCBhMCwgczEsIGExLCBzMiwgYTIKPiAgIGNhbGwgZndfYm9vdF9oYXJ0Cj4KPgo+
IFBsZWFzZSBub3RlIHRoYXQgT3BlblNCSSBmaXJtd2FyZSBoZWFkZXIgZGVmaW5lZCBhYm92ZSBz
aG91bGQKPiB3b3JrIGZvciBib3RoIFJWMzIgYW5kIFJWNjQgYW5kIGluIHRoZSBmdXR1cmUgY2Fu
IGFsc28gYmUgZXh0ZW5kZWQKPiBmb3IgUlYxMjguCj4KCkhpIEFudXAsClRoYW5rcyBmb3IgeW91
ciBzdWdnZXN0aW9uISBJIHdpbGwgc2VuZCBhbm90aGVyIHBhdGNoIHNlcmllcyB0byBpbXBsZW1l
bnQgdGhpcy4KQWRkaXRpb25hbGx5LCBJIG5vdGljZWQgdGhhdCAub3B0aW9uIG5vcnZjIG1pZ2h0
IG5vdCBiZSBlbm91Z2guIFdlCmFsc28gbmVlZCAub3B0aW9uIG5vcmVsYXggZm9yIHRoZSBydjMy
IGNhc2UuIFRoaXMgaXMgYmVjYXVzZSBHQVMgcHV0cwpSX1JJU0NWX1JFTEFYIHRvZ2V0aGVyIHdp
dGggUl9SSVNDVl9KQUwuIEFzIGEgcmVzdWx0LCB0aGUgbGlua2VyIHdpbGwKc3RpbGwgdXNlIGEg
Y29tcHJlc3NlZCBqdW1wLCB3aGljaCBjYXVzZXMgdGhlIG9mZnNldCB0byBjaGFuZ2UuIExldCBt
ZQpzdWJtaXQgaXQgZm9yIGZ1cnRoZXIgcmV2aWV3LgpUaGFua3MKCj4gUmVnYXJkcywKPiBBbnVw
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
