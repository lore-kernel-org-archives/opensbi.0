Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7788CD37AF
	for <opensbi@archiver.kernel.org>; Sun, 10 May 2026 06:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuB0/+F2eOlZvtpVbJ+RxqIGryFOPd3P/gbMoNjeJwA=; b=JrebcNypxvB+i0
	xrw8A/t+Sd8ZFQ9POBfODjxoJEimMHxE6u2/017BNNi4jaRO0O4RaAk/nySDxIoImfjNsQAo2jEjv
	nj1dwPoYltRd/3f3RIeIArnnpHTUQOcWDOUBlu8tq8kSrwl4GyBwwHVnZspKiRV+ERCBcHCEaSUKL
	UJvIU+CeTVtX6QOI4nqIoqZaZBA2K8rX5GbNILrVm1E7x1H1px3ATamZecQKZsMOwjTZZwfcnS9O3
	cljaFbVkc+HUgO4AASy8aBW3oAEQLEWfay8PMRUDR16+hKDmy8N0jrj6fdLpjPH+/dRlst2IlW7DJ
	WrDGU8VgZ/bhq1JTFxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLxN3-0000000AG8f-2Hbt;
	Sun, 10 May 2026 06:10:33 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLxN0-0000000AG81-1HvR
	for opensbi@lists.infradead.org;
	Sun, 10 May 2026 06:10:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7de44ed7a11so2612554a34.1
        for <opensbi@lists.infradead.org>; Sat, 09 May 2026 23:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778393429; cv=none;
        d=google.com; s=arc-20240605;
        b=OrhddGNwUgeYuUGmI1lqJbabN92+wwa/YW21YrhFss8sWQMbixw1gadKidYYgNNqk6
         Wf42cyTwPQZ7SE6vN1YNWj1UhjZQ2rCT7wK5g6dajJMled1kuifo/rnRrX+ah3dfCZZY
         gmqfSaudTkJv8q4YiNfkWAwaR+g6IT0XgLIgyFSjOcqyCcA1XYVdjEwK8rxfQMzXNQdA
         PNyuzrbQ73aX1BJIjnLZGIftMnIQ2m073Gt8Ygq2YdBn1iCEanjHRAgs+Ab4OEYEDlJ+
         4mXhALXj4UMRhZIkCoYoeDmZoTsqHTTntt8YD9iiGLUt0qLihcwP8KyVhuOW/ZqbRPZC
         CF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LTuPYPzG0k92YgV8q0d9Cd249MLZ4OAl6x6nITdLgmE=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=kdQa5//zv4451Ddydwhwzb5cwyJnG9JKPkk49ea4vc4aVckHqtgdMsf2PrOrmiOg5s
         75Q8dVaH3AM5/mGE7I5+OPI42cq92BklbiY5aMzc5ADMHSxzUrtRxRhkiVnNWto+0nZh
         OW/fjhV9evfLGpHIZpusmM646xJj9af4E0NxX2+r5D5cggG2vVxkfJI/4yamOjJRQEqU
         UGP678h2RYFnL6TKqYTaGNOpKgomXtVivjIwxCs/ETKuOsuV17RPkJW59PAZHbAixIPP
         jjBo8vh7kiLeTgqPPj37c7ukF8pFx11ev7kBSy+MM+qSddycIHoi9lMNCZWUUFargZ+G
         qByA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778393429; x=1778998229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTuPYPzG0k92YgV8q0d9Cd249MLZ4OAl6x6nITdLgmE=;
        b=vq4n0fy5MXf0ziRmWJGG3NjY1g4XzB7hXT/CLLkGtxW5I2jZyid/UBn8ZAeiikgPqw
         igFZ4s+0NzJdBant32FCpFqEOfCULi35VOK1po7cWWiuejEfPy6Z6If+BNwRrpNelZxY
         i5nI8P/Nwfguj9lKi9ZBCUQU08x9zsBJymUeSUYCx6IShJINQ6HqSc0oGnV79I4qkabq
         rZ3QO4JejQwfvHE8XD51VLOZxriOvPDoSt/v3Uoq35OUtBDyF+q4+X+eMIQkJanT8Ptm
         dnWjsnVD/cY+8IXG8YIZb69FO+fJugNCEJz2p4yuDf+OKJIqK9/3I647wjEJxaCaGXQW
         ywhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778393429; x=1778998229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LTuPYPzG0k92YgV8q0d9Cd249MLZ4OAl6x6nITdLgmE=;
        b=EXM0+vMciYGtsp6ez7YxiyntuOl0arzZ/4Zvdlq/2lyOuB7rPaUGqrN712yZ1/cOxt
         uJ61L/t/08djq0YBPMsNWKocJcE+ikYfKYrs8cvNSJmrmJGYaBHuMyZkMxXLzBqo+prB
         L+aaN66KX6dlkVk/goR7wRudU39eWtxbRhA0ODEg9bxiM5O9QUKTH8PZ9Y8MH+UZfTxW
         IS54D4GD21eJVNGhXCkssobIdP5dpJIBVrNlMfPhApkdxRU/X8l4vehEhwJ7ykKSghPB
         PTqc+RNoHd9DKlZsIQWShlH1zK4hPLBiIXDKKFUBsZOfEaZlADO3kK/4YxnrF8afKPzT
         VfMw==
X-Gm-Message-State: AOJu0YwyA05z+niBCln8V/tEIEPC2uIA0t9lQuS1XD8R4HelOami6Lnm
	E31SFiNb+I889DeqjspTsJULVbAgN84wLn+9nEbFnBC18xxtVtMFPpIhIb4OCcL/5oykzYvIWIj
	j3qLQ8Ihm2EsakBMzu9+P4fqKhRAleSkeHA8fpQT8zd5Z7qemw2GMwYU=
X-Gm-Gg: Acq92OG5qO3ZhA2aVhCOlu23/FsVsKMtddEYyGzwzmPEzzuqaq5Iv/dO6o3i8kDL3zA
	0nUbXX1n4rHMzyuRmM54kieiT4WHWAPmcsBP2TnmCGcW769TX+Dj6CmeGBaRuhDyj0euzbdPXqd
	sM6mbz04TsS5HVPU8ADil5VmkMMWqTTtRe/TaoHinpZ1rvtlo/2BRPqYxmgGHKneHYftzQ+YxiD
	ANwyvIlVtuJz1vviWIqpfVE5tkn9gUOBxrAL6y2iVAi5lE6QDlydIxHKWas76Bx0gZUfIw/cxTX
	PfMqgwdnLg8SqFbCN5xuICB/EUl58TySac0dlZsEeRPfDARGr4gYp//Ah/WAeu7n/KpyyJh92jv
	PCQLpd2jg1iMUB+p5e0fhFeH+2A==
X-Received: by 2002:a05:6820:1b05:b0:694:9156:9b97 with SMTP id
 006d021491bc7-69b25b78f91mr4712890eaf.22.1778393428983; Sat, 09 May 2026
 23:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260327054936.3462935-1-peter.lin@sifive.com>
In-Reply-To: <20260327054936.3462935-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 10 May 2026 11:40:16 +0530
X-Gm-Features: AVHnY4J5yS74qvZgJOw6FsWHzLPdKoDuT7x4mPIfhgaviecrXpdsF1mHsIWjEWA
Message-ID: <CAAhSdy2X-QZM0jfwNt3JW9JStQiRqd+MALLHQ=6Wbm0eZRoNSg@mail.gmail.com>
Subject: Re: [PATCH] lib: fdt_domain: Default boot-hart to coldboot HART for
 multi-domain boot
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_231030_362356_A9828630 
X-CRM114-Status: GOOD (  23.01  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgMTE6MTnigK9BTSBZdS1DaGllbiBQZXRlciBMaW4KPHBl
dGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFdoZW4gImJvb3QtaGFydCIgaXMgbm90IHNw
ZWNpZmllZCwgZG9tLT5ib290X2hhcnRpZCB3YXMgbGVmdCBhcyAtMVUsCj4gY2F1c2luZyBkb21h
aW4gY29udGV4dCBzd2l0Y2hpbmcgdG8gZmFpbC4gRGVmYXVsdCBpdCB0byB0aGUgY29sZGJvb3QK
PiBIQVJUIHRvIGVuYWJsZSBTTVAgYm9vdCBpbiBtdWx0aS1kb21haW4gc2V0dXBzLCBjb25zaXN0
ZW50IHdpdGggaG93Cj4gbmV4dC1hcmcxIGlzIGhhbmRsZWQuCj4KPiBBbHNvIHVwZGF0ZSBpdHMg
ZGVzY3JpcHRpb24gaW4gZG9tYWluX3N1cHBvcnQubWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1D
aGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0K
PiAgZG9jcy9kb21haW5fc3VwcG9ydC5tZCAgICAgfCA2ICsrKy0tLQo+ICBsaWIvdXRpbHMvZmR0
L2ZkdF9kb21haW4uYyB8IDUgKy0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZG9jcy9kb21haW5fc3VwcG9ydC5t
ZCBiL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiBpbmRleCA5MzE4NmM0YS4uYzAxZTQ0NWYgMTAw
NjQ0Cj4gLS0tIGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZAo+ICsrKyBiL2RvY3MvZG9tYWluX3N1
cHBvcnQubWQKPiBAQCAtMTczLDkgKzE3Myw5IEBAIFRoZSBEVCBwcm9wZXJ0aWVzIG9mIGEgZG9t
YWluIGluc3RhbmNlIERUIG5vZGUgYXJlIGFzIGZvbGxvd3M6Cj4gICAgQW55IHJlZ2lvbiBvZiBh
IGRvbWFpbiBkZWZpbmVkIGluIERUIG5vZGUgY2Fubm90IGhhdmUgb25seSBNLWJpdHMgc2V0Cj4g
ICAgaW4gYWNjZXNzIHBlcm1pc3Npb25zIGkuZS4gaXQgY2Fubm90IGJlIGFuIG0tbW9kZSBvbmx5
IGFjY2Vzc2libGUgcmVnaW9uLgo+ICAqICoqYm9vdC1oYXJ0KiogKE9wdGlvbmFsKSAtIFRoZSBE
VCBub2RlIHBoYW5kbGUgb2YgdGhlIEhBUlQgYm9vdGluZyB0aGUKPiAtICBkb21haW4gaW5zdGFu
Y2UuIElmIGNvbGRib290IEhBUlQgaXMgYXNzaWduZWQgdG8gdGhlIGRvbWFpbiBpbnN0YW5jZSB0
aGVuCj4gLSAgdGhpcyBEVCBwcm9wZXJ0eSBpcyBpZ25vcmVkIGFuZCB0aGUgY29sZGJvb3QgSEFS
VCBpcyBhc3N1bWVkIHRvIGJlIHRoZQo+IC0gIGJvb3QgSEFSVCBvZiB0aGUgZG9tYWluIGluc3Rh
bmNlLgo+ICsgIGRvbWFpbiBpbnN0YW5jZS4gSWYgbm90IHNwZWNpZmllZCwgZGVmYXVsdHMgdG8g
dGhlIGNvbGRib290IEhBUlQuIE5vdGUgdGhhdAo+ICsgIGlmIHRoZSBjb2xkYm9vdCBIQVJUIGlz
IGFzc2lnbmVkIHRvIHRoaXMgZG9tYWluLCBpdCB3aWxsIGJlIGZvcmNlZCBhcwo+ICsgIHRoZSBi
b290IEhBUlQgcmVnYXJkbGVzcyBvZiB0aGlzIHByb3BlcnR5Lgo+ICAqICoqbmV4dC1hcmcxKiog
KE9wdGlvbmFsKSAtIFRoZSA2NCBiaXQgbmV4dCBib290aW5nIHN0YWdlIGFyZzEgZm9yIHRoZQo+
ICAgIGRvbWFpbiBpbnN0YW5jZS4gSWYgdGhpcyBEVCBwcm9wZXJ0eSBpcyBub3QgYXZhaWxhYmxl
IGFuZCBjb2xkYm9vdCBIQVJUCj4gICAgaXMgbm90IGFzc2lnbmVkIHRvIHRoZSBkb21haW4gaW5z
dGFuY2UgdGhlbiAqKm5leHQgYm9vdGluZyBzdGFnZSBhcmcxIG9mIGNvbGRib290IEhBUlQqKgo+
IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYyBiL2xpYi91dGlscy9mZHQv
ZmR0X2RvbWFpbi5jCj4gaW5kZXggYjJmYTg2MzMuLjFiMDM5NTMzIDEwMDY0NAo+IC0tLSBhL2xp
Yi91dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4gKysrIGIvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWlu
LmMKPiBAQCAtMzk2LDE2ICszOTYsMTMgQEAgc3RhdGljIGludCBfX2ZkdF9wYXJzZV9kb21haW4o
Y29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3BhcXVlKQo+ICAgICAg
ICAgZG9tLT5md19yZWdpb25faW5pdGVkID0gcm9vdC5md19yZWdpb25faW5pdGVkOwo+Cj4gICAg
ICAgICAvKiBSZWFkICJib290LWhhcnQiIERUIHByb3BlcnR5ICovCj4gLSAgICAgICB2YWwzMiA9
IC0xVTsKPiArICAgICAgIHZhbDMyID0gY3VycmVudF9oYXJ0aWQoKTsKPiAgICAgICAgIHZhbCA9
IGZkdF9nZXRwcm9wKGZkdCwgZG9tYWluX29mZnNldCwgImJvb3QtaGFydCIsICZsZW4pOwo+ICAg
ICAgICAgaWYgKHZhbCAmJiBsZW4gPj0gNCkgewo+ICAgICAgICAgICAgICAgICBjcHVfb2Zmc2V0
ID0gZmR0X25vZGVfb2Zmc2V0X2J5X3BoYW5kbGUoZmR0LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZkdDMyX3RvX2NwdSgqdmFsKSk7
Cj4gICAgICAgICAgICAgICAgIGlmIChjcHVfb2Zmc2V0ID49IDAgJiYgZmR0X25vZGVfaXNfZW5h
YmxlZChmZHQsIGNwdV9vZmZzZXQpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGZkdF9wYXJz
ZV9oYXJ0X2lkKGZkdCwgY3B1X29mZnNldCwgJnZhbDMyKTsKPiAtICAgICAgIH0gZWxzZSB7Cj4g
LSAgICAgICAgICAgICAgIGlmIChkb21haW5fb2Zmc2V0ID09ICpjb2xkX2RvbWFpbl9vZmZzZXQp
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgdmFsMzIgPSBjdXJyZW50X2hhcnRpZCgpOwo+ICAg
ICAgICAgfQo+ICAgICAgICAgZG9tLT5ib290X2hhcnRpZCA9IHZhbDMyOwo+Cj4gLS0KPiAyLjQ4
LjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
