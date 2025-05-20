Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B231EC3ABDD
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIFROuhP6/UMxSa32zVKHx5mLQeNUkgQHXIv7the4Ag=; b=bEa8cl9ZVq7Z+h
	ikgb3L9UOyFefFGXlOcWlg3f36EFk4JO7M54pzfPaki0HcrbuDdbzn8lZtA3XHzaWYROHVocqLHIw
	p2ubcofUMEs89LvYwOkGpmnTUrf9byc7yisGIm/fsNyiFQ2d9fwLhClRcDKvjH8P/60QkzmNwFlmZ
	SYxPcJKcmvyISCpNhrXU9c+yBasKiHPZsfbMKCe2a4q7NjHHAIgB5hgoEbS32qlznm13B4SlrL6L5
	3T5jrU3+5YrHDeH6K04li0f4C34+x2j+CwtrdzhpaM195ZuqHnvF/tVTg8J5/WNc+SoGVxJN4bv3t
	5HABGqXHX/xQZ//a81mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPN6-0000000DQkI-1iNm;
	Tue, 20 May 2025 15:59:16 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOxh-0000000DMcm-2Q2S
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 15:33:03 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3dc7294716cso13927065ab.2
        for <opensbi@lists.infradead.org>; Tue, 20 May 2025 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747755180; x=1748359980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CODCd3tx31s/haYXvH7px8KgdUtMmeVjdaqFagbSkjg=;
        b=sqdkbZgbAVA+eJUfSz5F8GFtFhvaoXwZuZ1wVIJUhzieunptTAW7jkepHKLkT6L/2N
         hjF1V3J+K4g5QE7dp325eMHLjEslB0eTf+TwwXr2J1rI8FyV2BSS5EtbIJaOztCdBU/B
         8rn9dAk+czs02l5xR7nbsADr16HY+kVIJ3AGNMlkauJTDR98uxAKuOLo9r2fhesDxsVz
         8JBoP1jOsdGY0QgVHx+p+8ugm4o+W6ONaUg/AI1/Q/BL8S/zCZf6K5W5sIVo+PQPLTJ6
         eZ36TH5hGwOzDWwcgZZJlFj7RduMYVPsd6hu+5dQpq0bjmOgXgqBdPA+iKJebc4bqdHq
         KuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755180; x=1748359980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CODCd3tx31s/haYXvH7px8KgdUtMmeVjdaqFagbSkjg=;
        b=qjI2jpZDLQFZfaHkmE1ktF9+zQbaZHEjxhjbSbtkgdu16RRgHIyD1RHPdpztB4504X
         IYYvPoa+ARXMLwMuNJdJgGHHd7e7wHan3Mh00FrkyOG+373n1HDHOsvROmiHyE3do3Er
         Vtp30TLl7rzkDnOrBl+bZZZZ8f5UDAFGurBjd0jevgLzun5koHT703kg/iAOfQ44jZHx
         vwnFsi+LA3ZMLhchubhD6GZ9BTlZ9U5Lgz+yxoaWYMh3hvcRW78/4OtpA8rqtsQf37xu
         I5j+w4deNx7u+CdA+9ACXxZ7xb6uTwU5WaJ3ZcZeRXgRVvmy24jPxBbIos/7hWHZfXu2
         WpLw==
X-Gm-Message-State: AOJu0YwduTwyEBlzBt+jjjZlO+vxd0OQPFrfhUETAkIORCJpKk2iCXoi
	cpXOF4TB5T8lgt+a8aCD14kAq84u47PXhQZKxE10pLGk+ucirps6g0FCCoJKmVlPT4HTWQSw8Rk
	2HJHuP8Kisi5bm9+tuem2UCkGJA8S+RGKKjTNaQxD/A==
X-Gm-Gg: ASbGncslTiryXuLmLGMdCs4qkCX4ihJZtPD/Rh88LM6H4uKx2i2Qo13eb9XiXv2AyU+
	LllpefKxVVdh81k4zDRMhEznQfjIe+zQ99tW3fuDYrN//XZP+4GH+CU0O1Skba1SroXzJdxa6mw
	eYsZ7YBlf/+cn3CB4X4k4UDjx3PteggGLCIA==
X-Google-Smtp-Source: AGHT+IGkqxOWr5Brau+IaJKOJzkgiuo5sVpE55qvpxzjdPotrL4yGQT80uvjWdo5mYwJgjt1wi9kQ6WxcLmzzhB7ARA=
X-Received: by 2002:a05:6e02:198d:b0:3d8:2023:d057 with SMTP id
 e9e14a558f8ab-3db85750240mr149689085ab.11.1747755179098; Tue, 20 May 2025
 08:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250520132533.30974-1-jamestiotio@gmail.com>
In-Reply-To: <20250520132533.30974-1-jamestiotio@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 21:02:47 +0530
X-Gm-Features: AX0GCFv5r8D1xnd4VBTI5_VLXZY11JqZO3TilXGDO2kIXtZnZX94F-wisaFa0xQ
Message-ID: <CAAhSdy3uEgtgpbL_Sg2GMbW2zYp=AUVJ-dSiDFouGtQg=Lm1gg@mail.gmail.com>
Subject: Re: [PATCH v4] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0
To: James Raphael Tiovalen <jamestiotio@gmail.com>
Cc: opensbi@lists.infradead.org, andrew.jones@linux.dev, atishp@rivosinc.com, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_083301_813273_09400667 
X-CRM114-Status: GOOD (  28.64  )
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

T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgNjo1N+KAr1BNIEphbWVzIFJhcGhhZWwgVGlvdmFsZW4K
PGphbWVzdGlvdGlvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHdoZW4gY29uZmln
dXJpbmcgYSBtYXRjaGluZyBwcm9ncmFtbWFibGUgSFBNIGNvdW50ZXIgd2l0aAo+IFNzY29mcG1m
IGJlaW5nIHByZXNlbnQsIGNpZHhfYmFzZSA+IDIsIGFuZCBjaWR4X21hc2sgPT0gMCB0byBtb25p
dG9yCj4gZWl0aGVyIHRoZSBDUFVfQ1lDTEVTIG9yIElOU1RSVUNUSU9OUyBoYXJkd2FyZSBldmVu
dCwKPiBzYmlfcG11X2N0cl9jZmdfbWF0Y2ggd2lsbCBzdWNjZWVkIGJ1dCBpdCB3aWxsIGNvbmZp
Z3VyZSB0aGUKPiBjb3JyZXNwb25kaW5nIGZpeGVkIGNvdW50ZXIgaW5zdGVhZCBvZiB0aGUgY291
bnRlciBzcGVjaWZpZWQgYnkgdGhlCj4gY2lkeF9iYXNlIHBhcmFtZXRlci4KPgo+IER1cmluZyBj
b3VudGVyIGNvbmZpZ3VyYXRpb24sIHRoZSBmb2xsb3dpbmcgaXNzdWVzIG1heSBhcmlzZToKPiAt
IElmIHRoZSBTS0lQX01BVENIIGZsYWcgaXMgc2V0LCBhbiBvdXQtb2YtYm91bmRzIG1lbW9yeSBy
ZWFkIG9mIHRoZQo+IHBocy0+YWN0aXZlX2V2ZW50cyBhcnJheSB3b3VsZCBvY2N1ciwgd2hpY2gg
Y291bGQgbGVhZCB0byB1bmRlZmluZWQKPiBiZWhhdmlvci4KPgo+IC0gSWYgdGhlIENMRUFSX1ZB
TFVFIGZsYWcgaXMgc2V0LCB0aGUgY29ycmVzcG9uZGluZyBmaXhlZCBjb3VudGVyIHdpbGwKPiBi
ZSByZXNldCwgd2hpY2ggY291bGQgYmUgY29uc2lkZXJlZCB1bmV4cGVjdGVkIGJlaGF2aW9yLgo+
Cj4gLSBJZiB0aGUgQVVUT19TVEFSVCBmbGFnIGlzIHNldCwgcG11X2N0cl9zdGFydF9odyB3aWxs
IHNpbGVudGx5IHN0YXJ0Cj4gdGhlIGZpeGVkIGNvdW50ZXIsIGV2ZW4gdGhvdWdoIGl0IGhhcyBh
bHJlYWR5IHN0YXJ0ZWQuIEZyb20gdGhlCj4gc3VwZXJ2aXNvcidzIHBlcnNwZWN0aXZlLCBub3Ro
aW5nIGhhcyBjaGFuZ2VkLCB3aGljaCBjb3VsZCBiZSBjb25mdXNpbmcuCj4gVGhlIHN1cGVydmlz
b3Igd2lsbCBub3Qgc2VlIHRoZSBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRCBlcnJvciBjb2RlIHNp
bmNlCj4gc2JpX3BtdV9jdHJfY2ZnX21hdGNoIGRvZXMgbm90IHJldHVybiB0aGUgZXJyb3IgY29k
ZSBvZgo+IHBtdV9jdHJfc3RhcnRfaHcuCj4KPiBUaGUgb25seSB3YXkgdG8gZGV0ZWN0IHRoZXNl
IGlzc3VlcyBpcyB0byBjaGVjayB0aGUgY3RyX2lkeCByZXR1cm4gdmFsdWUKPiBvZiBzYmlfcG11
X2N0cl9jZmdfbWF0Y2ggYW5kIGNvbXBhcmUgaXQgd2l0aCBjaWR4X2Jhc2UuCj4KPiBGaXggdGhl
c2UgaXNzdWVzIGJ5IHJldHVybmluZyB0aGUgU0JJX0VSUl9JTlZBTElEX1BBUkFNIGVycm9yIGNv
ZGUgaWYKPiB0aGUgY2lkeF9tYXNrIHBhcmFtZXRlciB2YWx1ZSBiZWluZyBwYXNzZWQgaW4gaXMg
MCBzaW5jZSBhbiBpbnZhbGlkCj4gcGFyYW1ldGVyIHNob3VsZCBub3QgbGVhZCB0byBhIHN1Y2Nl
c3NmdWwgc2JpX3BtdV9jdHJfY2ZnX21hdGNoIGJ1dCB3aXRoCj4gdW5leHBlY3RlZCBzaWRlIGVm
ZmVjdHMuCj4KPiBGb2xsb3dpbmcgYSBzaW1pbGFyIHJhdGlvbmFsZSwgYWRkIHRoZSB2YWxpZGF0
aW9uIGNoZWNrIHRvCj4gc2JpX3BtdV9jdHJfc3RhcnQgYW5kIHNiaV9wbXVfY3RyX3N0b3AgYXMg
d2VsbCBzaW5jZSBzYmlfZmxzIGlzCj4gdW5kZWZpbmVkIHdoZW4gdGhlIG1hc2sgaXMgMC4KPgo+
IFRoaXMgYWxzbyBhbGlnbnMgT3BlblNCSSdzIGJlaGF2aW9yIHdpdGggS1ZNJ3MuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBSYXBoYWVsIFRpb3ZhbGVuIDxqYW1lc3Rpb3Rpb0BnbWFpbC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+IFJldmll
d2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKQXBwbGllZCB0
aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0t
Cj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMTUgKysrKysrKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xp
Yi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBpbmRleCA1OTgzYTc4Li42Y2E0
ZWZkIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4gKysrIGIvbGliL3NiaS9zYmlf
cG11LmMKPiBAQCAtMjA2LDYgKzIwNiwxMiBAQCBzdGF0aWMgaW50IHBtdV9jdHJfdmFsaWRhdGUo
c3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+ICAgICAgICAgcmV0dXJuIGV2ZW50X2lk
eF90eXBlOwo+ICB9Cj4KPiArc3RhdGljIGJvb2wgcG11X2N0cl9pZHhfdmFsaWRhdGUodW5zaWdu
ZWQgbG9uZyBjYmFzZSwgdW5zaWduZWQgbG9uZyBjbWFzaykKPiArewo+ICsgICAgICAgLyogRG8g
YSBiYXNpYyBzYW5pdHkgY2hlY2sgb2YgY291bnRlciBiYXNlICYgbWFzayAqLwo+ICsgICAgICAg
cmV0dXJuIGNtYXNrICYmIGNiYXNlICsgc2JpX2ZscyhjbWFzaykgPCB0b3RhbF9jdHJzOwo+ICt9
Cj4gKwo+ICBpbnQgc2JpX3BtdV9jdHJfZndfcmVhZCh1aW50MzJfdCBjaWR4LCB1aW50NjRfdCAq
Y3ZhbCkKPiAgewo+ICAgICAgICAgaW50IGV2ZW50X2lkeF90eXBlOwo+IEBAIC00NzIsNyArNDc4
LDcgQEAgaW50IHNiaV9wbXVfY3RyX3N0YXJ0KHVuc2lnbmVkIGxvbmcgY2Jhc2UsIHVuc2lnbmVk
IGxvbmcgY21hc2ssCj4gICAgICAgICBpbnQgaSwgY2lkeDsKPiAgICAgICAgIHVpbnQ2NF90IGVk
YXRhOwo+Cj4gLSAgICAgICBpZiAoKGNiYXNlICsgc2JpX2ZscyhjbWFzaykpID49IHRvdGFsX2N0
cnMpCj4gKyAgICAgICBpZiAoIXBtdV9jdHJfaWR4X3ZhbGlkYXRlKGNiYXNlLCBjbWFzaykpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiAgICAgICAgIGlmIChmbGFncyAmIFNCSV9Q
TVVfU1RPUF9GTEFHX1RBS0VfU05BUFNIT1QpCj4gQEAgLTU3Nyw4ICs1ODMsOCBAQCBpbnQgc2Jp
X3BtdV9jdHJfc3RvcCh1bnNpZ25lZCBsb25nIGNiYXNlLCB1bnNpZ25lZCBsb25nIGNtYXNrLAo+
ICAgICAgICAgdWludDMyX3QgZXZlbnRfY29kZTsKPiAgICAgICAgIGludCBpLCBjaWR4Owo+Cj4g
LSAgICAgICBpZiAoKGNiYXNlICsgc2JpX2ZscyhjbWFzaykpID49IHRvdGFsX2N0cnMpCj4gLSAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgaWYgKCFwbXVfY3RyX2lk
eF92YWxpZGF0ZShjYmFzZSwgY21hc2spKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+
Cj4gICAgICAgICBpZiAoZmxhZyAmIFNCSV9QTVVfU1RPUF9GTEFHX1RBS0VfU05BUFNIT1QpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PX1NITUVNOwo+IEBAIC04MzksOCArODQ1LDcg
QEAgaW50IHNiaV9wbXVfY3RyX2NmZ19tYXRjaCh1bnNpZ25lZCBsb25nIGNpZHhfYmFzZSwgdW5z
aWduZWQgbG9uZyBjaWR4X21hc2ssCj4gICAgICAgICBpbnQgcmV0LCBldmVudF90eXBlLCBjdHJf
aWR4ID0gU0JJX0VOT1RTVVBQOwo+ICAgICAgICAgdTMyIGV2ZW50X2NvZGU7Cj4KPiAtICAgICAg
IC8qIERvIGEgYmFzaWMgc2FuaXR5IGNoZWNrIG9mIGNvdW50ZXIgYmFzZSAmIG1hc2sgKi8KPiAt
ICAgICAgIGlmICgoY2lkeF9iYXNlICsgc2JpX2ZscyhjaWR4X21hc2spKSA+PSB0b3RhbF9jdHJz
KQo+ICsgICAgICAgaWYgKCFwbXVfY3RyX2lkeF92YWxpZGF0ZShjaWR4X2Jhc2UsIGNpZHhfbWFz
aykpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gICAgICAgICBldmVu
dF90eXBlID0gcG11X2V2ZW50X3ZhbGlkYXRlKHBocywgZXZlbnRfaWR4LCBldmVudF9kYXRhKTsK
PiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
