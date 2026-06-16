Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB04CCD98DA
	for <opensbi@archiver.kernel.org>; Tue, 16 Jun 2026 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4A2csMCiDIE9f8+HgQBIhDetEmC7Y30n+SFPzwGzIBc=; b=GZy/AN5pKCSWg9
	Jz7fgggi9VN8/3hcVEWV6ZQAlaqb/sxpOS5v9rokHBsgM812tg6RUi+Th9KXy8V3Quvu6Xaev7jnx
	D9kIT2LpB7LN04sDhHdrB/cQtorGRXDLdfFwvAWO7r1oW2Re6nJe0w6FdeDn59roI4GOuiA+2eo/M
	rkDiAZKj0AjTwJ0TKMQwYjOzmgp3nwYqqtP1N2x4aoGh4L+gstxCktOva+rdbskAWkwuRGUTyjk1R
	Q4aPfKKOqsWKC/SxFpfQ9TPN6SHPk1HodozBA9pHGA7175YB+JZ+3dYqs+GlWs4ymre61f92/UnDr
	PJ42/YfhXosNvfebWVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP7B-0000000FRgE-0t1Z;
	Tue, 16 Jun 2026 08:25:45 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP79-0000000FRfb-045Y
	for opensbi@lists.infradead.org;
	Tue, 16 Jun 2026 08:25:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5aa6792e7b8so3838886e87.1
        for <opensbi@lists.infradead.org>; Tue, 16 Jun 2026 01:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781598341; cv=none;
        d=google.com; s=arc-20240605;
        b=AoRE51eHQuzIzVAf2xGKpeWwhFvAc5XMMawNBvmwitlHWRhADQJNLfHqPZWsqQMO8m
         sFStPMu0aHXwbUVe69c3TI9yKRdqY7uPAcSRE5Gcfoq9XCrCxmm5M0MyFHSGHu8AOT4l
         XDi7AL8aFbaUWUCMcZXSEp+PPd/XoaBbC69jK6WVS8/WUDz1HVqS4DcESsMXsSbWBIx4
         QgDHXkutExQpq4xZhwJqDByJpLlH3akc7hr0bfWHWl/UZLos2EI/cMaq/7nir6rWBut3
         0U9U9y3A27Em1SiqJvmVHR/Gggdx9vn8C5HurM/6cqw3D7xtlE5t5jHFdXf8yRUGqmqh
         p6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3K++MaCRRtJlRPLZb2iZzssuFtv8h9TJ6Lj6clZ3IY4=;
        fh=0p86q/2ythAQMBPuGbnW44JppkNwhxCdadir6TIka8w=;
        b=eSNMQ4G6s5foNUX7dlJrQsEmKQh/8nyic6UcIQc0A6aSGfbA2ziTTEhJCKRirgJApU
         W8VhoWNCv6cp56AKKeEi00ZJZpIWcVeFm3EJAWskR4QvQJ/GxYUlRC9YjRCrzWNMrpcP
         6c1/6zF2vYn4kFni3hf/nZCha7LS5RcqiEdknvneQPFWVzugAD/CW/YOgou02yzZwD0t
         i9zbXDLfj7NaQCz0a6ta1hvyYp7+nMyQc8NZrYPex2r4xmObJSJQ8W1v/3sUhCkQsrDQ
         3slXjD/SrwzWrwjJXUZlc10t2Vp8NEKb9SHNfrdBLzWT4hCHYyZZsyWRr27SXzRpsBmM
         fZ+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781598341; x=1782203141; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K++MaCRRtJlRPLZb2iZzssuFtv8h9TJ6Lj6clZ3IY4=;
        b=ChLK4XzE6E+D1MBrLPYILSDJ+9s5fRMgvszPIgOhKnUDQJZ23OS+h9KNpMF/RNXtVw
         0gMVH6UiZlWFSHy8s1SRAp0Ubp5G4nHkbnNjMv3crJAvGw0Jjln1tLaxHecHtFmYyX7p
         fA086MvkAtF98RHl5yt6ggzKvbmqx6+6jO2n/fkyZZv8JrOrXk91kxNWyLSqL21j6MH2
         NGfY0xVMstLkyGGWimuG9r+y0bth362HulpSb27EdPzWtel3cPK0TFwJxHKo5p6E0RO8
         l2VfQZcGKfFO7Sb+Pos/rtCCEP8/xSnXkZxs8zQrjzj2QEPGaobCsV//q8oITb5FexiO
         4VCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781598341; x=1782203141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3K++MaCRRtJlRPLZb2iZzssuFtv8h9TJ6Lj6clZ3IY4=;
        b=kxNODEZy/1vFKRlI5zSWn/Nf0/bOVLJT4Ck5ZC/6P9oddXniI90I/7KW+x6Cdc9w52
         OGfJzDsMTj4L+lIzBMNro/Mqsd9ijYkl2CUajSVFJGUYzkkQY1qbwG0tGneXgA3lOpJA
         HmhxwXeRMnwiAtDo/6QtFA7Zusy5VeSetnGLns0d/dKn6aVCfok5kRm5P1QQQScjCL9A
         inBMCA7sS6U9clnyh34Zhm4XBaIVHL8g7S0MyKT+tTrgtpjmnHRaMe59e9R6BOAiCsrr
         IP/EIuO2WPIPYBzrFxXl861jn82XKKKuKZdeYaxeg/D8nOwUA0XaUctxvNYXXk9nsAA3
         deaw==
X-Gm-Message-State: AOJu0YxnvRv+QwwcBdiuDD/1HCWIBDaMBJ5gUcvZHQfz31tkroKZHE4o
	jR73r63ZS4/0mP0GdgnjetPBsNAOHFrLVwTk54AsUafiPx4nbjynW9ItxDnY20cCLOLcNHsU49k
	yPHfmlyi1VM4fzxx3L9v8H9ROIXiXFBsW6Brk+bo0pQ==
X-Gm-Gg: Acq92OH9dDDAge7ZZmEgJa5sq4r5e459ISnXHxQNMFdddsshcoXrbH+kN3UaxfeyQhw
	NjfHPB0eG/R5I6dnfuhHQM5EVjVnQMOax6zmdeyEco8Z58rOMUqfwD5smWpNtfmIzM3+Sf7MPi9
	EiGlei1nTE+3ShydTKveuhVfTbqtcHPFNT5idSjTBAddmpnguZfZc+9FxbyKZuOc07pPozRh7kK
	+t/w5ZPcylxmEM3YnW9CyLPSwd+Kr6zEY3Cdvh8bskgAPW6adpxZ7wBFNWjD5tF7Qod1uTGXJ77
	CCkKhf5GsGX6onURJHdPBrDNCQ6qJDyh6XmWqvk=
X-Received: by 2002:ac2:44c6:0:b0:5ad:3035:fa44 with SMTP id
 2adb3069b0e04-5ad30dddeb7mr2924862e87.50.1781598340789; Tue, 16 Jun 2026
 01:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260605113214.242-1-ganboing@gmail.com>
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 16 Jun 2026 13:55:29 +0530
X-Gm-Features: AVVi8Cdz_7EsMSfKPqasHzAO19F9HEyX0OPKUEvCHioJMpRMCIybJCMJWaYr4I4
Message-ID: <CAK9=C2VyO02sta+Y7Ozse8mXx076qEdHS=3YrvN+ZXiin2_6FQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Fixes for load/store misaligned and access faults
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, wangruikang@iscas.ac.cn, dramforever@live.com, 
	andrew.jones@oss.qualcomm.com, cleger@rivosinc.com, pjw@kernel.org, 
	asrinivasan@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_012543_105911_C786EAD3 
X-CRM114-Status: GOOD (  22.39  )
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

T24gRnJpLCBKdW4gNSwgMjAyNiBhdCA3OjE14oCvUE0gQm8gR2FuIDxnYW5ib2luZ0BnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gUmUtdmlzaXQgdGhlIGxvYWQvc3RvcmUgbWlzYWxpZ25lZCBhbmQgYWNj
ZXNzIGZhdWx0IGhhbmRsZXJzIHRvIGZpeAo+IGlzc3VlcyByZWxhdGVkIHRvIGNvZGluZyBwYXR0
ZXJucywgZmxvYXRpbmctcG9pbnQgc3RhdGUsIGFuZCBpbnN0cnVjdGlvbgo+IGRlY29kaW5nOgo+
Cj4gIGEuIFZlY3RvciBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgZW11bGF0b3IgaXMgaW52b2tlZCBp
bXByb3Blcmx5Cj4gIGIuIHZzc3RhdHVzLkZTIGlzIG5vdCBzZXQgZGlydHkgd2hlbiBWPTEKPiAg
Yy4gTm8gY2hlY2tpbmcgb2YgcHJldmlvdXMgWExFTiwgcmVzdWx0aW5nIGluIHdyb25nIGluc24g
ZGVjb2RpbmcKPiAgZC4gTG9hZC9TdG9yZSBiYXNlIGFkZHJlc3MgaXMgd3JvbmdseSBhc3N1bWVk
IHRvIGJlIHRyYXAgYWRkcmVzcwo+ICBlLiBIaWdoIDMyLWJpdHMgb2YgdGluc3QgbmVlZHMgdG8g
YmUgY2hlY2tlZCBhZ2FpbnN0IDAKPgo+IFRoZSBwYXRoc2V0IGlzIHZhbGlkYXRlZCBvbiBhIG1v
ZGlmaWVkIFFFTVVbMV0gdGhhdCBleHBvc2VkIG1pc2FsaWduZWQKPiBmYXVsdHMsIGFuZCBRRU1V
WzJdLCB3aGljaCBmdXJ0aGVyIGRpc2FibGVkIHRoZSBpbnNuIHRyYW5zZm9ybWF0aW9uLgo+IFsy
XSBjb3ZlcnMgbW9yZSBpbnNuIGRlY29kaW5nIGJyYW5jaGVzLCBpbmNsdWRpbmcgdGhlIHBhcnRp
Y3VsYXIgb25lcwo+IHdoaWNoIGNhbiB0cmlnZ2VyIHRoZSB3cm9uZyBkZWNvZGluZyAoYykKPgo+
IFRoZSBwYXRjaHNldCBpcyBhbHNvIHZhbGlkYXRlZCBvbiBTaWZpdmUgUDU1MCBjb3JlIChFU1dJ
TiBFSUM3NzAwKSwKPiB3aGljaCBpcyBSVjY0LW9ubHkgaW4gTS8oVilTLyhWKVUsIG5vIEhXIG1p
c2FsaWduZWQgc3VwcG9ydCwgbm8gdmVjdG9yLAo+IGFuZCBtdGluc3QgYWx3YXlzIDAuIFJlZmVy
IHRvIFszXSBmb3IgdGhlIGdpdCByZXBvL2JyYW5jaCB0aGF0IGhhcyBhbGwKPiA2IHBhdGNoZXMg
YXBwbGllZCBhbG9uZyB3aXRoIHRoZSB0ZXN0IGNhc2UgdGhhdCBleGVyY2lzZXMgYWxsIGludGVn
ZXIKPiBhbmQgZmxvYXRpbmctcG9pbnQgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMuCj4KPiBUZXN0
IGNhc2UgdXNlZCBpcyBhdmFpbGFibGUgaW4gUEFUQ0ggOC4KPgo+IFRoZXJlJ3Mgbm8gY2hhbmdl
IHRvIHRoZSBiZWhhdmlvciBvZiB0aGUgdmVjdG9yIG1pc2FsaWduZWQgbG9hZC9zdG9yZQo+IGhh
bmRsZXIuIEhvd2V2ZXIsIEkndmUgZm91bmQgYWRkaXRpb25hbCBpc3N1ZXMgd2l0aCB0aGVtOgo+
Cj4gIC0gYHVpbnQ4X3QgbWFza1tWTEVOX01BWCAvIDhdYCBpbiBzYmlfdHJhcF92X2xkc3QuYyBp
cyA4S0IsIHdoaWNoCj4gICAgY2FuIG92ZXJmbG93IHRoZSBkZWZhdWx0IDRLQiBzdGFjay4KPiAg
LSB0aW5zdCBzaG91bGQgYmUgemVybydlZCBvdXQgdG8gbm90IGNvbmZ1c2UgcHJldmlvdXMgbW9k
ZSB3aGVuCj4gICAgcmVkaXJlY3RpbmcgZmF1bHRzLCBvdGhlcndpc2UgdGhlIHZlY3RvciBpbnNu
IGNhbiBiZSBtaXN0YWtlbgo+ICAgIGFzIGEgcmVndWxhciBsb2FkL3N0b3JlLgo+ICAtIFZTIGlu
IHByZXZpb3VzIG1vZGUgbXVzdCBiZSBzZXQgZGlydHkgZm9yIGxvYWRzLgo+Cj4gVGhlc2Ugd2ls
bCBiZSBhZGRyZXNzZWQgaW4gZm9sbG93LXVwIHBhdGNoZXMuCj4KPiBbMV0gaHR0cHM6Ly9naXRo
dWIuY29tL2dhbmJvaW5nL3FlbXUvdHJlZS9nYW5ib2luZy1taXNhbGlnbgo+IFsyXSBodHRwczov
L2dpdGh1Yi5jb20vZ2FuYm9pbmcvcWVtdS90cmVlL2dhbmJvaW5nLW1pc2FsaWduLW5vLXRpbnN0
Cj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9nYW5ib2luZy9vcGVuc2JpL3RyZWUvZml4LWxkc3Qt
djIKPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIEFkZHJlc3NlZCBBbnVwJ3MgY29tbWVudCBm
b3IgUEFUQ0ggNSBpbiB2MQo+ICAtIFZhbGlkYXRlIGxvYWQvc3RvcmUgb2Zmc2V0IGlzIDAgaW4g
bWlzYWxpZ25lZCBmYXVsdHMgdy8gREVCVUcgYnVpbGQKPgo+IC0tLQo+IEJvIEdhbiAoOCk6Cj4g
ICBpbmNsdWRlOiBzYmk6IEFkZCBtb3JlIG1zdGF0dXMgYW5kIGluc3RydWN0aW9uIGVuY29kaW5n
Cj4gICBpbmNsdWRlOiBzYmk6IEFkZCBzYmlfcmVnc19wcmV2X3hsZW4KPiAgIGluY2x1ZGU6IHNi
aTogQWRkIEdFVF9SRFNfTlVNL1NFVChfRlAzMi9fRlA2NClfUkRTIG1hY3Jvcwo+ICAgaW5jbHVk
ZTogc2JpOiBzZXQgRlMgZGlydHkgaW4gdnNzdGF0dXMgd2hlbiBWPTEKPiAgIGxpYjogc2JpOiBE
byBub3Qgb3ZlcnJpZGUgZW11bGF0b3IgY2FsbGJhY2sgZm9yIHZlY3RvciBsb2FkL3N0b3JlCj4g
ICBNYWtlZmlsZTogZGVmaW5lIE9QRU5TQklfREVCVUcgaWYgREVCVUcgYnVpbGRzCj4gICBsaWI6
IHNiaTogUmV3b3JrIGxvYWQvc3RvcmUgZW11bGF0b3IgaW5zdHJ1Y3Rpb24gZGVjb2RpbmcKPiAg
IFtOT1QtRk9SLVVQU1RSRUFNXSBUZXN0IHByb2dyYW0gZm9yIG1pc2FsaWduZWQgbG9hZC9zdG9y
ZQoKQXBwbGllZCBhbGwgcGF0Y2hlcyBleGNlcHQgbGFzdCBvbmUgdG8gdGhlIHJpc2N2L29wZW5z
YmkgcmVwby4KClRoYW5rcywKQW51cAoKPgo+ICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKPiAgaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCB8ICAyMSArLQo+ICBpbmNs
dWRlL3NiaS9yaXNjdl9mcC5oICAgICAgIHwgIDMwICsrLQo+ICBpbmNsdWRlL3NiaS9zYmlfcGxh
dGZvcm0uaCAgIHwgIDkyICsrKysrLS0KPiAgaW5jbHVkZS9zYmkvc2JpX3RyYXAuaCAgICAgICB8
ICA1OSArKysrCj4gIGluY2x1ZGUvc2JpL3NiaV90cmFwX2xkc3QuaCAgfCAgIDQgKy0KPiAgbGli
L3NiaS9zYmlfdHJhcF9sZHN0LmMgICAgICB8IDUxMCArKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQo+ICBsaWIvc2JpL3NiaV90cmFwX3ZfbGRzdC5jICAgIHwgIDI1ICstCj4gIHRl
c3RzL2xkc3QuUyAgICAgICAgICAgICAgICAgfCAxMzQgKysrKysrKysrCj4gIHRlc3RzL2xkc3Qu
aCAgICAgICAgICAgICAgICAgfCAxNzAgKysrKysrKysrKysrCj4gIHRlc3RzL3Rlc3QtbWlzYWxp
Z25lZC1sZHN0LmMgfCAxNTQgKysrKysrKysrKysKPiAgMTEgZmlsZXMgY2hhbmdlZCwgOTk0IGlu
c2VydGlvbnMoKyksIDIwNiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rz
L2xkc3QuUwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvbGRzdC5oCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0ZXN0cy90ZXN0LW1pc2FsaWduZWQtbGRzdC5jCj4KPiAtLQo+IDIuMzQuMQo+Cj4K
PiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
