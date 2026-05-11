Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5CACD37B7
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 04:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2mjTozkcQgyqwGBET1eGE16GfZSyORz0c0MP602lJo=; b=u042X/jzya0VEP
	Kl+63GI/y6tUxCSt8m+wzY7wu5cgvwpOP1n8mkRFcQgAoaf0svNFocA80C8uHKTsElTSE29mX5cIP
	BB9b6f7ZTuUD9NmK/rHeckUy0+8y21qVrR65KNMpx6zvdhbhfitzSMw8YUU9yHjKUqrSO1q9F5Pm+
	wk/up3WqA1+E9wM4rgrpcnJ8Eb0cBGli7lc13cISz1r6O+qJdrz4V8nSC3EZriRz6tU7dTIoHtjbO
	Iyamj/F4szvNbtAbl/rsoEvljDKGstTnbvOLgWvbo2EZyKscuqHJhXwwdckoWccb/UPEFwsIGbLYc
	mmPqr4QxNu8XkyWROsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIid-0000000CJhr-1MWF;
	Mon, 11 May 2026 04:58:15 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIiZ-0000000CJgx-40Pc
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 04:58:13 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7dbccf6a23dso3274381a34.2
        for <opensbi@lists.infradead.org>; Sun, 10 May 2026 21:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778475491; cv=none;
        d=google.com; s=arc-20240605;
        b=FDt7nkendQ/kB3QjqiYBaPoKJHBrMdVj5u11L8bqf6y8zqH9bjeUjAVtEYPZypNiED
         XW6Z1nzqB/Ih1YbCkvNIYqKQfa4DJcj53UwpvhGKYl+H25pcozpRW1ZHR6/vCRZv+VWO
         tI6eGSXxK5oSG5NMD1SXFNNki8TxrFUuodZY6UAij2flvecaC6SuZcqFWqPT+e5aPOA8
         iJE77JHF7HCU7uiIi1zy7V4i0kCekVEtcMmeRxjTW/hllFL4Ip4/4nJBWLLJnST4xI1b
         sge3fSgI4eKbgF+xYpxfUbx0JK8nkwAz/vpRYLkbxQIlPDiyHFsA+JHpzXEhqCiE6675
         xn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oO/mu+s3LDedWM6EFUKut1K70w9CoWXQB6D21h0sF0c=;
        fh=AopYFoSfARpPMY+tJdQwjfh14VE0lrbFstcHAJ74czQ=;
        b=GNA68xx02kOEa93AOkx+CF5Uu5SVOyp/75k96uaxnFbskIL0ni5Xf0MI6WXNGCkrks
         TepLYebYUYoJt0SqN5WGbygRYyN+DYFFRyxC4xFNCZPr6XvG9mwWCGhfbswbX8uD0vXV
         OhIufY7SHMoBkRE/iclEi3GpYe9SdQHqmA2FlR3gX/gkfWRWwFNYYRLRiiAdf6JAZHBi
         Gu5jTbzaVRgEKc9d1qKkaGCO0YLthMTPEX7Pa06MWULA9Ujoh7SrB34ruEZ4SVaOIGFY
         mmtW6mzHa5ErpTsDRHj2sQbAPX0+vonps0ZKjMyGYlW3YHq1RimKM/K9S6LoT2b4GP2M
         374Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778475491; x=1779080291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oO/mu+s3LDedWM6EFUKut1K70w9CoWXQB6D21h0sF0c=;
        b=iVhIv7m3qON72Wi8iB0748ZjJQbw/6sDYHnJ7Zz+hjqkgjK2MKIAYncIZoydjGPj+y
         dc13fSOrnVPujNx6AcrQ/hXYVGCAwHKwlSjQNM0hgWj+VwGxwoZX1fSzIvDFNjMthTdy
         ZLHUFzDFKOzaWdASWbFC/wGiHSKDClorLlCEJQNS3Z6I7CMTCAUJeElSfIZcuzJf82EA
         kMciH7SpzuTgh+F+ntDokiWsp2VWUwu9O+uMgKAuQv1LDb8B/jCveB6MrEbouhsR0yzA
         9c+KXm3InqVYjDTMAq9BoLCutDKFO780MCiqmi8n8E2NY+jMrEp2dSw7cey5yzI67ZF/
         gczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778475491; x=1779080291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oO/mu+s3LDedWM6EFUKut1K70w9CoWXQB6D21h0sF0c=;
        b=HzY6lcbqAbc2ORDdRdjPF8gXhwlx/KQEdT91sv524imdzJ5BAgbeOwIGkkQKqSv5+m
         QKjwk3eOc0ATKAsFteHYlZpWr/MNeRja7PkYOB1RTtZB5uVl+SSpliixgVxn4rquoWCa
         Msxz1+JT+HWGXpHIPplO/Hvmivxbwz0mtqlHvPvzQK2M6OiVGP+tqkXoTvd/LKldPnz1
         Rt0sI5oGjgQOdypD1HPf7bjGGaX9CsjUDQ47SOXjnU85GbTwd6kA6ritsHMWciY7Kc0J
         B3F0kcJ8LK9v+Xd8f5dvR5rC4QFg+cZS1qbfzoqhNA5HiWdaignesrre0/ZKov9E+K4j
         BifA==
X-Gm-Message-State: AOJu0Yx75lWUxP4GsXZPdetG/e3DZjaysrHUIYO0VIz/XcExdgtt44rs
	a7B7OLdyL5iQRUdsB1AkusRpNXkuoJPg3V35gEp8dV10+Yry2v7MogcZl62vc9sy17ZGPirICWT
	fwG9/B5zORVGxK0bFZSiDuLYj++VanKsUDF7u8aendQ==
X-Gm-Gg: Acq92OHf8vuyxjFuensk3KsVokqyH5VlDYEuQN4REVl7kUbhXoMO4lpqm240t8hzw/1
	PHoabxHA/jyq5FvvlHH5BxAVodsxhP8wBkTz4vNv0T6WsB+D6aYELKApBH2bnMej89hYuXo49GH
	ehbQbRAPMgMdMz4KnfN2KDV2tSPXn16toeAIu4UB9wap+5pf2AD1ddqLNQhqj/L3L3eGCHVI69Q
	cpwQRo4TXQOKlsn0yOa/zeLE9Jrh+LxOk2fXuI6ct+3PQ4L+tEmZadLoq/ICRL2vCSQFe11ZY3R
	SBJnryUGQcLqryXWj+EBPcGj4gkvOCUzjZ7o4AH7Tzjqql7hDNUGD1yXeQ8Y/WJKgYbT/Jp4BxD
	J7xIZDs/2nk+bEUrr+XssJvox/ptGnO3pmAbf
X-Received: by 2002:a05:6820:4def:b0:699:b131:d5aa with SMTP id
 006d021491bc7-69b25b171b3mr6414492eaf.8.1778475490500; Sun, 10 May 2026
 21:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260319125641.480161-1-runmin.zhang@ingenic.com>
In-Reply-To: <20260319125641.480161-1-runmin.zhang@ingenic.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 May 2026 10:27:58 +0530
X-Gm-Features: AVHnY4LaXShLB6OOX9_G_U2q7Rtxh6KsQZtQLRJmbC9ZHchrYDv1kugrlk1N-1g
Message-ID: <CAAhSdy3UBpnyiApALGUnMv7xTKGF1M-dwuXkkX_A-kRxCeSUwg@mail.gmail.com>
Subject: Re: [PATCH] docs: platform: update qemu_virt.md
To: runmin.zhang@ingenic.com
Cc: opensbi@lists.infradead.org, fmrt19zrmin@163.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_215812_087602_ADA60B1F 
X-CRM114-Status: GOOD (  18.19  )
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

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNjoyOOKAr1BNIDxydW5taW4uemhhbmdAaW5nZW5pYy5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogWmhhbmcgUnVuTWluIDxydW5taW4uemhhbmdAaW5nZW5pYy5j
b20+Cj4KPiBXaGVuIHVzaW5nIEdEQiBmb3IgZGVidWdnaW5nLCBpZiBGV19URVhUX1NUQVJUIGlz
IG5vdCBzZXQgdG8gMHg4MDAwMDAwMAo+IGR1cmluZyBjb21waWxhdGlvbiwgdGhlIGZvbGxvd2lu
ZyBlcnJvciBvY2N1cnM6Cj4KPiBSZWFkaW5nIHN5bWJvbHMgZnJvbSBidWlsZC9wbGF0Zm9ybS9n
ZW5lcmljL2Zpcm13YXJlL2Z3X3BheWxvYWQuZWxmLi4uCj4gUmVtb3RlIGRlYnVnZ2luZyB1c2lu
ZyBsb2NhbGhvc3Q6MTIzNAo+IG1pcHNfd2FybV9ib290ICgpCj4gICAgIGF0IC9ob21lL3pybWlu
L29wZW5zYmkvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL21pcHNfd2FybV9ib290LlM6MTEKPiAxMSAg
ICAgIGogICAgICAgX3N0YXJ0X3dhcm0KPiAoZ2RiKSBiIF9zdGFydAo+IEJyZWFrcG9pbnQgMSBh
dCAweDA6IGZpbGUgL2hvbWUvenJtaW4vb3BlbnNiaS9maXJtd2FyZS9md19iYXNlLlMsIGxpbmUg
NTAuCj4gKGdkYikgYwo+IENvbnRpbnVpbmcuCj4gUmVtb3RlIGNvbm5lY3Rpb24gY2xvc2VkCj4g
KGdkYikKPgo+IFdpdGggRldfVEVYVF9TVEFSVD0weDgwMDAwMDAwLCBkZWJ1Z2dpbmcgd29ya3Mg
Y29ycmVjdGx5Ogo+IFJlYWRpbmcgc3ltYm9scyBmcm9tIGJ1aWxkL3BsYXRmb3JtL2dlbmVyaWMv
ZmlybXdhcmUvZndfcGF5bG9hZC5lbGYuLi4KPiBSZW1vdGUgZGVidWdnaW5nIHVzaW5nIGxvY2Fs
aG9zdDoxMjM0Cj4gMHgwMDAwMDAwMDAwMDAxMDAwIGluID8/ICgpCj4gKGdkYikgYiBfc3RhcnQK
PiBCcmVha3BvaW50IDEgYXQgMHg4MDAwMDAwMDogZmlsZSAvaG9tZS96cm1pbi9vcGVuc2JpL2Zp
cm13YXJlL2Z3X2Jhc2UuUywgbGluZSA1MC4KPiAoZ2RiKSBjCj4gQ29udGludWluZy4KPgo+IEJy
ZWFrcG9pbnQgMSwgX3N0YXJ0ICgpIGF0IC9ob21lL3pybWluL29wZW5zYmkvZmlybXdhcmUvZndf
YmFzZS5TOjUwCj4gNTAgICAgICBNT1ZfM1IgIHMwLCBhMCwgczEsIGExLCBzMiwgYTIKPiAoZ2Ri
KQo+Cj4gVGhpcyBpcyBiZWNhdXNlIFFFTVUgbG9hZHMgT3BlblNCSSBhdCBhZGRyZXNzIDB4ODAw
MDAwMDAuIFdoZW4KPiBGV19URVhUX1NUQVJUIGRvZXMgbm90IG1hdGNoIHRoaXMgYWRkcmVzcywg
dGhlIGRlYnVnIHN5bWJvbHMgYXJlCj4gaW5jb3JyZWN0bHkgb2Zmc2V0LCBjYXVzaW5nIEdEQiB0
byBmYWlsIHRvIHNldCBicmVha3BvaW50cyBwcm9wZXJseS4KPgo+IFNpZ25lZC1vZmYtYnk6IFpo
YW5nIFJ1bk1pbiA8cnVubWluLnpoYW5nQGluZ2VuaWMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRv
IHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGRvY3MvcGxh
dGZvcm0vcWVtdV92aXJ0Lm1kIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RvY3MvcGxhdGZvcm0vcWVtdV92aXJ0Lm1kIGIvZG9jcy9w
bGF0Zm9ybS9xZW11X3ZpcnQubWQKPiBpbmRleCBmZDg3ZWU1YS4uNDUxM2RmOGIgMTAwNjQ0Cj4g
LS0tIGEvZG9jcy9wbGF0Zm9ybS9xZW11X3ZpcnQubWQKPiArKysgYi9kb2NzL3BsYXRmb3JtL3Fl
bXVfdmlydC5tZAo+IEBAIC0xNTgsNiArMTU4LDkgQEAgcWVtdS1zeXN0ZW0tcmlzY3YzMiAtTSB2
aXJ0IC1tIDI1Nk0gLW5vZ3JhcGhpYyBcCj4gIERlYnVnZ2luZyB3aXRoIEdEQgo+ICAtLS0tLS0t
LS0tLS0tLS0tLS0KPgo+ICtOb3RlOiB0aGUgY29tbWFuZCBsaW5lIGV4YW1wbGVzIGhlcmUgYXNz
dW1lIHRoYXQgT3BlblNCSSB3YXMgY29tcGlsZWQgdXNpbmcKPiArdGhlIGBERUJVRz0xIEZXX1RF
WFRfU1RBUlQ9MHg4MDAwMDAwMGAgY29uZmlndXJhdGlvbi4KPiArCj4gIEluIGEgZmlyc3QgY29u
c29sZSBzdGFydCBPcGVuU0JJIHdpdGggUUVNVToKPgo+ICBgYGAKPiAtLQo+IDIuNDMuMAo+Cj4K
PiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
