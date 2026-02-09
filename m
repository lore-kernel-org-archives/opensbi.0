Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D2EEF06ED
	for <opensbi@archiver.kernel.org>; Mon,  9 Feb 2026 02:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/9VQ+YHtzB+imegDmfj3CufL23Q+whcJbUxXDoQW1c=; b=t6rJVAK6g81h/2
	OutCsKxXG4M8HVkknC+UQoQGJN0jmSqnudkqX7MZUWLMBJIEVDugCmj6oiMRdIWD/TLS84gyymfP3
	J24NoHwdreJYaI8HKrAqSudWnla7mWrhq2L70Ptz1WYiQpnMq4tUVC8O+KHsemjoADBm49dGSJ8ra
	tTvsyqPD+Bb4869qSdwRAIWMSm1hyjGYjaXYhD/0Vx/qQEZeX1D1sxZcEG/MpvSD9GleE3ga/xJFv
	ALxtDey+RAf9E0AuiCZwwMZbCk0oYyqXbcNx6lL6s0vLuVc3a6SQeiSfTWzjcOSKCxB37LcoRSEVn
	OfdbbCiQ9HLEGsmwuX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpH95-0000000EidY-3vme;
	Mon, 09 Feb 2026 02:37:03 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpH93-0000000Eicq-2hyl
	for opensbi@lists.infradead.org;
	Mon, 09 Feb 2026 02:37:03 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-5fadf645f9bso668148137.0
        for <opensbi@lists.infradead.org>; Sun, 08 Feb 2026 18:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770604620; cv=none;
        d=google.com; s=arc-20240605;
        b=W4fOYTEGjdkQJGly55U59h6qS1cXShkFBwRFn1pBd1pA6tBtJV1ot3CVoC0QB8A1Bs
         ZX2ZEPRJOc+nDwQm+od2HjOJABDy+4V/Q66IwVjy/Cn08nWiQ2jjwRbTQuw3nHJKJ2gB
         8BVHHxaZuR8Z3/aP370cPOt3igG1R8CtAiBTDtDnHhnzASCoexbmf/0x4PdJcmBZgyku
         XIXavYSChz/wqn/JDq/KFG12lVnnMEP+uk9UpNb1kX1ZTE4hYEuYtLfVrgWIGwCXCl6E
         6qCaD9LZk4B+//hWa7w5QyHbJJJ6VgpJ87/fJpX1IiOCauB4sdHGoe3jwQ4bTMmjV2g3
         lMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEbC9entBQsWarnLqzQRfOpSs9ygPwzawB9tJAcI0+c=;
        fh=b/g7bp+g7BjWzIfI3mLeDTHml0ctJAWA3rYN+mZTOjE=;
        b=dkTkRqSgFTD8xnGo57lwrpUY08qCL+et5BounHPawV/aarGugYxsZrgsb/e9IbJ4He
         FvIrbpU+rp6+3D5YpeS+5I9lBNFebFNPNDYy7rsMWOTG4c1XQXawgkRLeZ4yQQr5N2Wf
         L3fD750TRRc+Z+9snM7kez4TwgYALiXfidE5O4JV9U9Adf4v9vEpLdOJHzSVNroOhkW8
         Nc4zilGhEHsc0zW3r9QurkQCa054QAXXrxKuOqOfAvEn8EaGnzopkqHymqWEg6xHdIhO
         R6J61GpV3wCPS2H8LWiOQyEoAyTuOUjOtFp1S5TWPyLOtU26QlHOdsGVA1IYUh6Knqe9
         tlfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770604620; x=1771209420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEbC9entBQsWarnLqzQRfOpSs9ygPwzawB9tJAcI0+c=;
        b=lLGp0+dyHROFUfoZl8NgzTQlsamTLL5UBr8ryrKMJFwjRGxjXaBfhCwtMV3Io0iDOs
         eweptkDJQRF3zM3X8+i9yUhHxr/kFasgDgIZmHlQDO31e5kvJhawhl02UGlI/BLHcfRb
         0YH7fiikgcs6rAd9ryW2fgQRbajXpHd8+WWNDgImoNgoXn0MC9pQiI1ioA4dk/GVaPLV
         kKvKa9cO51Mrjqxy6W45eDtVAzxRv3bxstsTzbyCgFfZ975lccAp1h0wwpm3JgR9dKwy
         SkZW5kOhRJMeT57zBoKaRZactdgjBNcWtmAVhUatVNcW8c4vnjf58zav7twJyaJpCJFj
         OAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770604620; x=1771209420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEbC9entBQsWarnLqzQRfOpSs9ygPwzawB9tJAcI0+c=;
        b=lKOE4VhUlUI6q83rMmXT9PG9qKyFiTCPGQZPZvoKwtgZKVlW3cAstolULlWyetrDQZ
         gwkvP9bnJs254Uf1JUYJQMs4hd4EVXPZEiZl76iZvMP7WUxx6MhnyCBc8fzuJ1PXBByC
         5MjSeGYWGABKVn6U+nO1Akp0liaJNRdz9OmxvcRWDA5hoBmDNqO4UYyKkYVW7f1vGOn5
         nOM0N6jWEJixWFIptwvb7Tq274NtxzrrgCtz221ENFmcc6pEYC669PYK6InGxeaQUN4b
         W+P/sMOc/RKcf2MDRsbBGSP9bvCXAXlqMzeU03sKxrbeFOMECgtcgZmoX0LNRtmktJ72
         +wJQ==
X-Gm-Message-State: AOJu0YzA/PW8KtOkzK5xAY0AKHyGxKN8NSoXYTvUZgEvd69FW2k5QNZ+
	AYMJALsnU7Ijo2NhmBlo+V/2sUaUcKLgDLOf/WzyKJHqMoZU6EZQqgngGoAvlaZijWvUsfC0OQr
	ZbWFYqHG5eW+Zuj5lBN8fpPAciHqbb2nQXOq+kKxBcA==
X-Gm-Gg: AZuq6aLumfB6nkkcM65bFz2ztvGi1AYmikeSy1iYUZdFCIJYj07ZYvu2Eus1LTXCJmw
	Nx2IKAO2fapE721IF8dheC0SlN7kdwMDVFK98tRHnVZeZfHgGmSwekw9eG0WsnaqQn57/mpw8rv
	o5REaERqc7K2LFabOGGhGC6+J26fImYCp/LSl6LZJAIl0IRosNC20sLZdor5vvjq/5pJohCJVR0
	efOLd/qEllr09nRodl7+yDGhCAXhjY8PYUm3yq7TIdEMceBr7+pmtwl8GyhpFAZYib0sqdzTw==
X-Received: by 2002:a05:6102:510f:b0:5f8:f6f3:84d7 with SMTP id
 ada2fe7eead31-5fae8a2f018mr2062994137.13.1770604620000; Sun, 08 Feb 2026
 18:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-3-5d297d3e2027@sifive.com> <DG4K5AOGY1J9.1BWQ6O7XEY7S1@qti.qualcomm.com>
In-Reply-To: <DG4K5AOGY1J9.1BWQ6O7XEY7S1@qti.qualcomm.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 9 Feb 2026 10:36:49 +0800
X-Gm-Features: AZwV_QhUtI2gA8gVbjQ6cJ6jL_xjcfGZy8AG8ruvHrAyGseThFvvJ-oqrv1MrRI
Message-ID: <CAHh=Yk_w7NDYm3E9gVfzppyObO_Rp1MFtJbQO7fx2NXZeiTy1g@mail.gmail.com>
Subject: Re: [PATCH 3/3] firmware: fw_base.S: Add common NMI trap handler
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_183701_717150_762C522F 
X-CRM114-Status: GOOD (  12.65  )
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

SGkgUmFkaW0sCgpSYWRpbSBLcmNtYXIgPHJrcmNtYXJAcXRpLnF1YWxjb21tLmNvbT4g5pa8IDIw
MjblubQy5pyIMuaXpemAseS4gCDkuIvljYgxMDo0OeWvq+mBk++8mgo+Cj4gMjAyNi0wMS0yOVQw
MDoxMzo0My0wODowMCwgTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPjoKPiA+IEFk
ZCBybm1pX2hhbmRsZXIgYXNzZW1ibHkgd3JhcHBlciBhbmQgc2JpX3JubWlfdHJhcF9oYW5kbGVy
IGRlZmF1bHQKPiA+IEMgaGFuZGxlci4gVGhlIGRlZmF1bHQgaGFuZGxlciBwcmludHMgZGlhZ25v
c3RpY3MgYW5kIGhhbmdzIHRoZSBoYXJ0Lgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5s
aUBzaWZpdmUuY29tPgo+ID4gU3VnZ2VzdGVkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5j
b20+Cj4gPiBTdWdnZXN0ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZp
dmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lm
aXZlLmNvbT4KPiA+IC0tLQo+ID4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2UuUyBiL2Zp
cm13YXJlL2Z3X2Jhc2UuUwo+ID4gQEAgLTY0Myw2ICs2NDMsNzAgQEAgbWVtY21wOgo+ID4gKyAg
ICAgLnNlY3Rpb24gLmVudHJ5LCAiYXgiLCAlcHJvZ2JpdHMKPiA+ICsgICAgIC5hbGlnbiA0Cj4g
PiArICAgICAuZ2xvYmwgc2JpX3JubWlfdmVjdG9yCj4gPiArc2JpX3JubWlfdmVjdG9yOgo+ID4g
KyAgICAgLyogU3dhcCBTUCB3aXRoIE1OU0NSQVRDSCAqLwo+ID4gKyAgICAgY3NycncgICBzcCwg
Q1NSX01OU0NSQVRDSCwgc3AKPiA+ICsKPiA+ICsgICAgIC8qIEFsbG9jYXRlIHNwYWNlIGZvciBm
dWxsIHRyYXAgcmVnaXN0ZXJzIHN0cnVjdHVyZSAqLwo+ID4gKyAgICAgYWRkaSAgICBzcCwgc3As
IC0oU0JJX1RSQVBfUkVHU19TSVpFKQo+Cj4gWzIvM10gZGlkOgo+Cj4gICAgICAgICBybm1pX2Nv
bnRleHRfb2Zmc2V0ID0gc2JpX3NjcmF0Y2hfYWxsb2Nfb2Zmc2V0KFNCSV9UUkFQX1JFR1NfU0la
RSk7Cj4gICAgICAgICBybm1pX2N0eCA9IHNiaV9zY3JhdGNoX29mZnNldF9wdHIoc2NyYXRjaCwg
cm5taV9jb250ZXh0X29mZnNldCk7Cj4gICAgICAgICBybm1pX3NwICA9ICh1bnNpZ25lZCBsb25n
KXJubWlfY3R4ICsgU0JJX1RSQVBfUkVHU19TSVpFOwo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9N
TlNDUkFUQ0gsIHJubWlfc3ApOwo+Cj4gV2UgY2FuIGF2b2lkIHRoZSBhZGQvc3VidHJhY3QgZGFu
Y2UsIHNpbmNlIGl0IHByb2R1Y2VzIHJubWlfY3R4Lgo+IEEgYmlnZ2VyIGlzc3VlIGlzIHRoYXQg
aXQgbGVhdmVzIDAgYnl0ZXMgZm9yIHRoZSBzdGFjayBvZiB0aGUgY2FsbGJhY2suCj4KPiBJcyB0
aGVyZSBhIHJlYXNvbiBub3QgdG8gcmV1c2UgdGhlIGV4aXN0aW5nIE0tbW9kZSBzdGFjaz8KVGhh
bmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIGRldGFpbGVkIHJldmlldyBhbmQgZXhjZWxsZW50IGZl
ZWRiYWNrIQoKSSdtIHdvcmtpbmcgb24gdjQgcGF0Y2hlcyB0aGF0IGFkZHJlc3MgaXNzdWVzICMx
IGFuZCAjMy4gSSdsbCBzZW5kIHRoZW0gc2hvcnRseS4KClRoYW5rcyBhZ2FpbiBmb3IgdGhlIHRo
b3JvdWdoIHJldmlldyEKPgo+IFRoYW5rcy4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
