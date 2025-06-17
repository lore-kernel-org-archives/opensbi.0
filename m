Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F81C7115B
	for <opensbi@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciVnplha1IHS4/t+wBUWnyI7NTbY1zGsPuWRG1/u6W8=; b=pWoTIpqxIgrt0i
	GK3zgv3cfBjToWXrUyRIeyQk1wDjdLt1sSo0hUMiuqxrn20fFn3xUZsc2gGQmEf2uJTjp79N0Gzed
	9puNHZNLv0wLKLT5ZWZLi2Tp05rmSjAHv3/sjez9mSM6BGLIJg1kbU7a3IcY8TTtPOW0ohNsofy7z
	h/tnJaG2GnLK/JvZBpSX6AjXPNhjmLOzkJTfMSBkTTDAxDuKfyMLz9/fcrP2q5ysZGqmlRpX9aeh9
	QNGNfk12f6ej7+j5jBM5H2VJYlX4toO1Exq3L1aZmKryYZYXF8VAEy2YX0NZ6VUHI6GU/PNl7E8g/
	Mf/7OHXJttzyKJSCJUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZqg-00000007z89-2wf0;
	Tue, 17 Jun 2025 17:11:50 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYPh-00000007kno-0598
	for opensbi@lists.infradead.org;
	Tue, 17 Jun 2025 15:39:54 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-86d00ae076dso224621139f.0
        for <opensbi@lists.infradead.org>; Tue, 17 Jun 2025 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750174792; x=1750779592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YahRLWRAqO1XTQamcpf6Uk1eQYE6ha0jxyh8oyooaw=;
        b=sZ5i1/fG+nWgaaEJZN/vEsw3bpTyLpl6QEeNPYjPNp7s65aZ59LCecpH/pKrkUQW8b
         hFtC86RAJ080y0yo95wexgF7eIeTKd3FTQz/UEcRbqJJG4iD9h+Uk5lVN4n3kMEYcgV1
         fzGVFiob+CQckm0mVJehkEZiqQ+bDhNwb+gfJjQiGblzAjBSjq0ricGsQUE6J296tKfb
         HEnYsZWxPjqhity0cE0WGENAGAJgpAkYR2BYuCcvl48pUz6OOpw+if/0msS25KGiTP6/
         4Vq34A+IYdgoKAhym4P4X/cAwOaZDCbse2BfdjBmSTaYj9WYMT8by8XmIOD4MMCcQxWg
         rttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750174792; x=1750779592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YahRLWRAqO1XTQamcpf6Uk1eQYE6ha0jxyh8oyooaw=;
        b=DcWZNjt6pqEzhlUzJJkmGZ8iLYSfPr+VYKNYMr3mHeUvEd76MVVQiPYaEl92hDg6LL
         eKFturSIA44yamVbD38SO2vITijqXDE+EGY/DLqGWm3dHuC1gNMrD/UxH8yP2rcPSfk/
         bQQoLxwAiLUOtNqW91cmYxF8cN1O3oTJWI7C6ItDY5M0nR/R02MnpvDu3WNtHeEJYK0j
         A6kLdA3HzMRoKPqXBwwRlx/aKeWKHW9pj5CBjaRFdP5iz5tXBwQ0QexYD7rAeyTt6Grd
         vSbSA98DHAyhje8jF8iykySQAOmh6UKmoU6HPWmHAbPtYtFCQ9jqtqPuM0k+ie7laKGW
         EUkg==
X-Forwarded-Encrypted: i=1; AJvYcCUM9BYaU0dvjGZfOu00bETCRUlguMsV1T93MdpBExqKBtWxh7ljs7AvlxUlc3dScM2Y6REeMJoY@lists.infradead.org
X-Gm-Message-State: AOJu0YxxnQMFdkZs05deX/iBU3/l7E/LlhwLMsPM83wM4LveKeevS3ek
	cjszXB8WiSk8/XkynhHvBMZkMzSNNWZN26P2vPQ8ht0LfrrjMrFQl9XT0yv/gP6Cl7Ca4zVEvSM
	xkeSNMyDu6UFCZu/2kmULJk/BkiSjdnKDZYG638mkJQ==
X-Gm-Gg: ASbGncsWFHdjwsozGKWyPPjOJb1xQR+ALmHp9l04zGbHX7DJ4/iq0aQqphiHDfVVw4q
	gcGcLscD7zFG5IHROw6AWxLaisL0P+Ozsl+phcmojrGIfFNwMKow5+VHOTaEzXHvIn9xoHHVTdN
	okwUWVZg/ydfVrPg9Y/xROhrjj77YbA6A/hXwBBznv+/CE
X-Google-Smtp-Source: AGHT+IHhVXJvaQp22e+ppC24+VPampxQo7dG+WcI+0ByahbJcc+zqYFY4FShoo8wgVTTRftHh1mGqmcpeKbvZQ7Iqnc=
X-Received: by 2002:a05:6e02:450e:b0:3dd:bf91:23f7 with SMTP id
 e9e14a558f8ab-3de22cc97bamr34371465ab.7.1750174791999; Tue, 17 Jun 2025
 08:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250614172756.153902-1-apatel@ventanamicro.com>
 <CAAhSdy3axiPX99WS+EbkNk-EQU8r4=NYi98Toe=ucutFieWu4Q@mail.gmail.com>
 <SJ0PR22MB27206BD79B2E8CA385C96125C270A@SJ0PR22MB2720.namprd22.prod.outlook.com>
 <CAAhSdy3017uy6Wj_D5jNNx1_gnNetpH2B5jc2Xnc85Eet-h5Gg@mail.gmail.com> <SJ0PR22MB2720F058F76CCBF0195C310AC273A@SJ0PR22MB2720.namprd22.prod.outlook.com>
In-Reply-To: <SJ0PR22MB2720F058F76CCBF0195C310AC273A@SJ0PR22MB2720.namprd22.prod.outlook.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 17 Jun 2025 21:09:40 +0530
X-Gm-Features: AX0GCFtnoGAwjWhOCAJVQ9_e3QtojpPNwV6wdkt6SbH5OoUfMkuo61F9VJcDqSI
Message-ID: <CAAhSdy1b_X+fs4rVMnS_3sRGoLBbsTXKyhJnz+PTtkQbtdyoTg@mail.gmail.com>
Subject: Re: [EXTERNAL]Re: [PATCH] lib: sbi_platform: Add platform specific
 pmp_set() and pmp_disable()
To: Chao-ying Fu <cfu@mips.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_083953_295950_78CFA882 
X-CRM114-Status: GOOD (  32.18  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgODoxNuKAr1BNIENoYW8teWluZyBGdSA8Y2Z1QG1pcHMu
Y29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiA+IEhpIENoYW8teWluZyBGdSwKPiA+Cj4gPiBP
biBNb24sIEp1biAxNiwgMjAyNSBhdCA5OjQ34oCvUE0gQ2hhby15aW5nIEZ1IDxjZnVAbWlwcy5j
b20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBBbnVwLAo+ID4gPgo+ID4gPiA+IEhpIENoYW8teWlu
ZyBGdSwKPiA+ID4KPiA+ID4KPiA+ID4gPiBPbiBTYXQsIEp1biAxNCwgMjAyNSBhdCAxMDo1OOKA
r1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBGcm9tOiBDaGFvLXlpbmcgRnUgPGNmdUB3YXZlY29tcC5jb20+Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gQWxsb3cgcGxhdGZvcm1zIHRvIGltcGxlbWVudCBwbGF0Zm9ybSBzcGVjaWZp
YyBQTVAgc2V0dXAgYW5kCj4gPiA+ID4gPiBQTVAgZGlzYWJsZSBmdW5jdGlvbnMgd2hpY2ggYXJl
IGNhbGxlZCBiZWZvcmUgYWN0dWFsIFBNUCBDU1JzCj4gPiA+ID4gPiBhcmUgY29uZmlndXJlZC4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBBbHNvLCBpbXBsZW1lbnQgcG1wX3NldCgpIGFuZCBwbXBfZGlz
YWJsZSgpIGZvciBNSVBTIFA4NzAwLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51
cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+Cj4gPiA+ID4gUGxlYXNlIHRy
eSB0aGlzIHBhdGNoIGF0IHlvdXIgZW5kIG9uIHRvcCBvZiB0aGUgbGF0ZXN0IE9wZW5TQkkKPiA+
ID4gPiBhbmQgc2VlIGlmIHRoaXMgaGVscHMgb24gTUlQUyBQODcwMC4KPiA+ID4KPiA+ID4gPiBS
ZWdhcmRzLAo+ID4gPiA+IEFudXAKPiA+ID4KPiA+ID4gICBZZXMsIHRoaXMgcGF0Y2ggd29ya3Mg
ZnVuY3Rpb25hbGx5IHRoZSBzYW1lIGFzIHdoYXQgdGhlIG9sZCB2ZXJzaW9uIGRvZXMgb24gRlBH
QSBhbmQgUUVNVS4KPgo+ID4gVGhhbmtzLCBJIHdpbGwgYXBwbHkgdGhpcyBwYXRjaCB0byB0aGUg
cmlzY3Yvb3BlbnNiaSByZXBvLgo+Cj4gPiA+IE5vdGU6IEkgYWRkZWQgdHdvIG1vcmUgcGF0Y2hl
cyBmcm9tIFZsYWRpbWlyIHRvIGRlYWwgd2l0aCBNTUlPIHJlZ2lvbnMgb24gdG9wIG9mIHRoaXMg
cGF0YyBoLgo+Cj4gPiBXaXRoIHRoaXMgcGF0Y2gsIHdlIGRvbid0IG5lZWQgdGhlIFBNUF9NTUlP
IGZsYWcgYWRkZWQgYnkgVmxhZGltaXIncyBwYXRjaGVzLgo+ID4gSXMgdGhlcmUgYW55IG90aGVy
IHBhdGNoID8KPgo+ICAgU29ycnksIEkgZGlkbid0IG5vdGljZSB0aGF0IHRoZXJlIGlzIGEgcGFy
YW1ldGVyOiBmbGFncy4KPiBXaXRoICJmbGFncyIsIHdlIGNhbiBjaGVjayBTQklfRE9NQUlOX01F
TVJFR0lPTl9NTUlPIGluIG1pcHNfcDg3MDBfcG1wX3NldCgpLgo+IFdlIGRvbid0IG5lZWQgVmxh
ZGlybWlyJ3MgcGF0Y2ggdGhhdCBjcmVhdGVzIFBNUF9NTUlPIGFuZCBwcm9wYWdhdGVzIHRvIHRo
ZSBwYXJhbWV0ZXI6IHByb3AuCj4KPiAgIEhvd2V2ZXIsIHdlIG1heSBzdGlsbCBuZWVkIFZsYWRp
bWlyJ3MgcGF0Y2ggZm9yIHRoZSBmZHQgZml4dXAgY29kZSB0aGF0IHRyaWVzIHRvIGRpc2FibGUg
dGhlIGFwbGljIG5vZGUuCj4gV2l0aCB0aGlzIHBhdGNoLCB3ZSBjYW4gaGF2ZSB0aGUgTU1JTyB0
eXBlIGZvciB0aGUgcmVnaW9uIHRoYXQgY292ZXJzIHRoZSBhcGxpYyBub2RlLCBhbmQKPiBtaXBz
X3A4NzAwX3BtcF9zZXQoKSBjYW4gc2V0IHVwIGNvcnJlY3QgY2FjaGVhYmlsaXR5IGZvciB0aGUg
TU1JTyBvciBub24tTU1JTyByZWdpb24uCj4gKFRoaXMgcGF0Y2ggbWF5IGFmZmVjdCB0aGUgZXhp
c3RpbmcgZHRzIGZpbGVzIHRoYXQgZG9uJ3QgaGF2ZSB0aGUgTU1JTyB0eXBlIGZvciB0aGUgcmVn
aW9uIHRoYXQgY292ZXJzIHRoZSBhcGxpYyBub2RlLikKCk9wZW5TQkkgaXMgYWxyZWFkeSBkaXNh
YmxpbmcgQVBMSUMgcm9vdCBkb21haW4gd2hpY2ggaXMgbWVhbnQKZm9yIE0tbW9kZS4KClRoaXMg
Y2FuIGJlIGVhc2lseSB2ZXJpZmllZCBvbiBRRU1VIHZpcnQsYWlhPWFwbGljLWltc2ljIG1hY2hp
bmUKZnJvbSBMaW51eCB1c2VyLXNwYWNlIHVzaW5nIGZvbGxvd2luZyBjb21tYW5kOgokIGNhdCAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJAYzAwMDAwMC9zdGF0dXMK
Cj4gLS0KPiBGcm9tOiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2IGF0
IG1vYmlsZXllLmNvbT4KPgo+IFdoZW4gYXBwbHlpbmcgRkRUIGZpeHVwcywgcmVxdWVzdCBkZXZp
Y2UgbWVtb3J5IHRvIGJlIG9mCj4gTU1JTyB0eXBlCj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1p
ciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2IGF0IG1vYmlsZXllLmNvbT4KPiAtLS0K
PiAgbGliL3V0aWxzL2ZkdC9mZHRfZml4dXAuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2Zk
dC9mZHRfZml4dXAuYyBiL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVwLmMKPiBpbmRleCBmM2ZlOGFm
Li5iMGVkMjBjIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVwLmMKPiArKysg
Yi9saWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jCj4gQEAgLTE4NSw3ICsxODUsNyBAQCBzdGF0aWMg
dm9pZCBmZHRfZG9tYWluX2Jhc2VkX2ZpeHVwX29uZSh2b2lkICpmZHQsIGludCBub2Rlb2ZmKQo+
ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAgICAgICAgIGlmICghc2JpX2RvbWFpbl9jaGVj
a19hZGRyKGRvbSwgcmVnX2FkZHIsIGRvbS0+bmV4dF9tb2RlLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFNCSV9ET01BSU5fUkVBRCB8IFNCSV9ET01BSU5fV1JJVEUpKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9SRUFEIHwg
U0JJX0RPTUFJTl9XUklURSB8IFNCSV9ET01BSU5fTU1JTykpIHsKPiAgICAgICAgICAgICAgICAg
cmMgPSBmZHRfb3Blbl9pbnRvKGZkdCwgZmR0LCBmZHRfdG90YWxzaXplKGZkdCkgKyAzMik7Cj4g
ICAgICAgICAgICAgICAgIGlmIChyYyA8IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+IC0tCj4gMi40Ny4xCj4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
