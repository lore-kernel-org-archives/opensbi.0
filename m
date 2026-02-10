Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B81E7E0DB
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YPrKZoorziPdUipAoJFY36dh4LPj/E5iEu5vbSnxOM=; b=lBgKosGaeRAR0L
	4K2aoKRRBwE/Ft7g/DJwH4M1QIRt5V9S1jr1f+Ej1RV+R77zyrhxVwWWCG4+lke1aHpbFPqZWJpZT
	0H+kaYz0iBSV0jK4nt+BPALJc4TDEVw/zzGSrgO5NVKGSjuJqOTT4aU2/ZBVcNdm3KQKtbkbxsXHU
	URLwUlgGLC+Qyr9hyz+N+nn4DIi9ggmDeiYm1gtRo2uvHSnzsJFE4xgjYs8zyVx4DfsH6tmfIbtr1
	rx9kQ12J1tQNRbwv6Muj5U/L6b92iaxjCDoT7kL5Zy0sutlSzh3fBSeDYKUiLrsjWKcW+Tb9+3g4/
	G+IWkfNVyimXcWIdALQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqG0-0000000HBb8-1mc4;
	Tue, 10 Feb 2026 16:06:32 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqFx-0000000HBaW-1auX
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 16:06:31 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-66f3e7d9eccso529762eaf.1
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 08:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770739588; cv=none;
        d=google.com; s=arc-20240605;
        b=JEDraka5iWLTZFEdMxu5GmXIEpjEwG1qAH9LDrBwTfFh2nn2tdMpoQUT+By1R9DEQ8
         FtySvttzEsJFqtWBPzkFCOfSh8j3i+rDDD900NnD26E89wFW6883DDC1PO4bqkVRpn1J
         38T9XMJr+AHueKr8ynkKZ9m8HJiCaqYP8nbJFu9BydAdxTzSPcO87gF7k62c9aBuPGxS
         mQqxuKHTTw1ffS13RonuuRW2Ffs/1oMuiLeN4K5t1/+OYK3U+6ehZZCp9scYzKeTW4IR
         04/qfRZ1QVrZ1f/63+KZd79FUNL7ofYnwTigGttbNtVX39oQd6d9VQ+i9i7eFuLw/ik1
         5M4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5OC4PDMYeYtRj1nIK+FcGk31ThmQuVHMuHuhlDa43jk=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=M7dT2h3we7AbjlEFy10aqJe4szzRZXTRbfJMiWIPo4fjvSgBvDhKsC2JTvpg6knBvf
         cuntzdaQ23J48IrDWUtwnBzfneV6yCYtHNDx0x2SzsDDm16vbkj/8mQk17jIt0PWD/rX
         R/+jl+T2S9c6xI58DsinSDtz1FOuHcOuq3BCKuEywAjeeEgbl/5KKwBhiZ3TCBfOgvQy
         3s8bUmAbtYfM8xLdNJj4oqS7QpGKCguGRu8+24Up8tzWZ2mQj5szjwWyw3QHLbxSYss2
         RedWW8FOW/A6pvIdeDZjqqr456ii59QIjoN3MvGzuGr9UKRd//A4OOqnQmpjh9ZWEFMz
         Fa7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770739588; x=1771344388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OC4PDMYeYtRj1nIK+FcGk31ThmQuVHMuHuhlDa43jk=;
        b=mPDXgRd9S2R/BKuCYoGC/uYzW1FNqurbETJdFqUyyZctc7thvceXf+5g/RzyilfGnp
         cD/l9zQq2kJybYTTZS45thJDZprFW62eGI8MIE0MjTrx8aaK32BKnJuRyRb8pENv3N56
         uUqBA/oKAlW147RysEKIX+v+P45x0J3fb1WeMMRKKbUBiFmZMABsHET9QIgPJ6DBT0w5
         0LyOox8wuE6L8Ptc2FJqwvRIsSHipPao8TEDjTabCwrDi/fj3kpNDykL6Xdhy/Zq4At5
         SuniCKRqvrxmFAlnGdKzCKmnnSs6CpioZT1LdEBQnz92zd8hC900PmCzT9gloq3FjN3D
         GU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739588; x=1771344388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OC4PDMYeYtRj1nIK+FcGk31ThmQuVHMuHuhlDa43jk=;
        b=ZB/CQ66qpO31kDPYSFyi32cZMZ6QykRJuaclPVey57b1X4pz5z+CM10adKyMhwDUTv
         ZPSEcl1amIoE+cmON6dmoUZDZhfAvIIaHfO1jWenESs8jn8KmgZhEmUYGxKXMC+ZbCCp
         AK+vnSLdxW5ZO9P0QpsymfzlHMUHzBHOiPj0+0NgOy6ulZVjVuja4/CB8z5N33X8IqY4
         jEGdc4G8jULwSkAdPMNJMIeBr4BVhbSx1VoI2oTstk6gh5oSAgChwrcvM81Sm8o5v12N
         v9IivATdbbGEx25c9SUcgd/5ihIKXffYzqdRq9pDX9g5wzFPN1hLF9AnL4x07Fxh0p4H
         fr+Q==
X-Gm-Message-State: AOJu0YzkQxn7Or/a13OAUaevmxR+EpfESpyIZ88QXzKYhtUjfqQywpYM
	I238VcsYydEoLG0K7lDwnnOdm1Jrc55QdOMsjmY6quiEUZBFg71FrYIHjieDw+q8Je7CGYPOYYG
	CMzTz8N+g047xlN1yvv3H/nLWrC7JTcGa29MkFqB6Dw==
X-Gm-Gg: AZuq6aItJ3Woj5CLYhG6LdmL5gtNjfWJLXe1BElq1QVN7mU3zBgnQ0lMob5+gDkj3o3
	kO/TC0ux8op4HUsNZseCkMXTK10Q0kfIph5oT10udBMr5VtmKe5tjDW9CMQTVBheMy/gyZrM5Iz
	JtxkPF538/j6MrQHghQd8OyctYFS8Wedldv8rR4q/pbhgj88F7OYmJ46xEQhXjt9rwZ3OS4WcJK
	j2gaHS55umwZbVo9T9VGQ8LmtDAj/MZhSH8odcCiouyTXLg/A+W6Gh0EXe79uk+jTXQKv2OXtxN
	VcOghBHA6nl8J6Lg4uwpFHaB262fOVLn515xmhrQ7I0rtFypKA0a8AGse6WBiksr7Olt9iY=
X-Received: by 2002:a05:6820:80d:b0:662:fa5a:b2f1 with SMTP id
 006d021491bc7-66d0c950897mr8140933eaf.63.1770739587846; Tue, 10 Feb 2026
 08:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20260202150207.1331811-1-raymondmaoca@gmail.com>
 <CAAhSdy1VQp5RtgR+uK6Wv6+RTw0Ja3-Oa-YnR17--0jmerjOcQ@mail.gmail.com>
 <CAMDkj5zgcR1Jyspp9qFme7cmS73tcxScY9CpunnPiNUHG9To1g@mail.gmail.com>
 <CAAhSdy3QGDY1k+M6O2aBz4=KvoTmvUmWRUXAkK--irMyZjzeoA@mail.gmail.com> <CAMDkj5x1NUzaqpVOofCY+--mfJLaKL4uEZGPjXL9a35r5eyJXw@mail.gmail.com>
In-Reply-To: <CAMDkj5x1NUzaqpVOofCY+--mfJLaKL4uEZGPjXL9a35r5eyJXw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Feb 2026 21:36:15 +0530
X-Gm-Features: AZwV_QgIJ1o3Q_iyWBP_DPmy41BMfSrR586OX3KlrXcYNUacGQkp3ZF9i_luYQY
Message-ID: <CAAhSdy0xfHJMb5voUfYBEGW1XdvBh=aa9aDnOvsDspMv+YCEaw@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/2] Introduce irqchip and VIRQ layer prototypes
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_080629_561308_ECBCCD35 
X-CRM114-Status: GOOD (  37.47  )
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

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCAxMjoyMOKAr0FNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiBTdW4sIEZlYiA4LCAyMDI2
IGF0IDg6MjTigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiBTYXQsIEZlYiA3LCAyMDI2IGF0IDk6NDHigK9QTSBSYXltb25kIE1hbyA8cmF5bW9u
ZG1hb2NhQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEFudXAsCj4gPiA+Cj4gPiA+
IE9uIFNhdCwgRmViIDcsIDIwMjYgYXQgNTowOOKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBGZWIgMiwgMjAyNiBhdCA4
OjMy4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9jYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5j
b20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBSRkMgaW50cm9kdWNlcyBpcnFjaGlwIGFic3Ry
YWN0aW9uIGFuZCBWSVJRIGxheWVycyBmb3IgQVBMSUMKPiA+ID4gPiA+IHdpcmVkIGludGVycnVw
dCBzdXBwb3J0IGluIE9wZW5TQkkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSW4gdGhlIGN1cnJlbnQg
T3BlblNCSSBpbXBsZW1lbnRhdGlvbiwgQVBMSUMgc3VwcG9ydCBwcmltYXJpbHkgZm9jdXNlcwo+
ID4gPiA+ID4gb24gaW5pdGlhbGl6YXRpb24gYW5kIGRlbGVnYXRpb24sIHdoaWxlIGV4dGVybmFs
IGludGVycnVwdCBoYW5kbGluZwo+ID4gPiA+ID4gZm9yIHdpcmVkIGludGVycnVwdHMgcmVtYWlu
cyBsYXJnZWx5IHN0dWJiZWQuIEFzIGEgcmVzdWx0Ogo+ID4gPiA+ID4gLSBUaGVyZSBpcyBubyBn
ZW5lcmljIG1lY2hhbmlzbSBmb3IgT3BlblNCSSBkcml2ZXJzIG9yIHBsYXRmb3JtcyB0bwo+ID4g
PiA+ID4gICByZWdpc3RlciBoYW5kbGVycyBmb3Igd2lyZWQgaW50ZXJydXB0IGxpbmVzLgo+ID4g
PiA+ID4gLSBJbnRlcnJ1cHQgZGlzcGF0Y2ggcmVtYWlucyB0aWdodGx5IGNvdXBsZWQgdG8gc3Bl
Y2lmaWMgaXJxY2hpcAo+ID4gPiA+ID4gICBpbXBsZW1lbnRhdGlvbnMuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhlIGdvYWwgaXMgdG8gaW50cm9kdWNlIGEgc21hbGwsIGV4dGVuc2libGUgYWJzdHJh
Y3Rpb24gZm9yIGlycWNoaXAKPiA+ID4gPiA+IHRvIGhpZGUgdGhlIEhXIGRldGFpbHMgYW5kIHBy
b3ZpZGUgYWJzdHJhY3Qgb3BlcmF0aW9ucyBsaWtlIGludGVycnVwdAo+ID4gPiA+ID4gcHJvdmlk
ZXIgcmVnaXN0cmF0aW9uLCBjbGFpbS9jb21wbGV0ZS9tYXNrL3VubWFzayBvcGVyYXRpb25zLgo+
ID4gPiA+Cj4gPiA+ID4gV2UgZG9uJ3QgbmVlZCBjbGFpbSgpIGFuZCBjb21wbGV0ZSgpIGNhbGxi
YWNrcyBpbnN0ZWFkIHNpbmdsZSBlb2koKQo+ID4gPiA+IGNhbGxiYWNrIGlzIHN1ZmZpY2llbnQg
YmVjYXVzZSB0aGUgQVBMSUMgZHJpdmVyIHdpbGwgaGF2ZSB0byBhbnl3YXkKPiA+ID4gPiByZWFk
IHRoZSBDTEFJTSByZWdpc3RlciB0byBnZXQgdGhlIGhhcmR3YXJlIGlycSBudW1iZXIuCj4gPiA+
ID4KPiA+ID4KPiA+ID4gVGhlIGFic3RyYWN0aW9uIGlzIG5vdCBvbmx5IGZvciBBUExJQyBhbmQg
aXMgZmxleGlibGUgZm9yIG90aGVyCj4gPiA+IGludGVycnVwdCBjb250cm9sbGVycywgdGhhdCBp
cyB0aGUgcmVhc29uIHdlIGhhdmUgY2xhaW0vY29tcGxldGUgYXMKPiA+ID4gZ2VuZXJhbCBpbnRl
cmZhY2VzLgo+ID4KPiA+IFRoZSBjbGFpbS9jb21wbGV0ZSB0ZXJtaW5vbG9neSBpcyB2ZXJ5IHNw
ZWNpZmljIHRvIFBMSUMgZXZlbiB0aG91Z2gKPiA+IHdlIGNhbiByZXRyb2ZpdCBpdCBmb3IgQVBM
SUMgYW5kIElNU0lDLiBJbnN0ZWFkIGEgc2ltcGxlIGVvaSgpIGNhbGxiYWNrCj4gPiAoanVzdCBs
aWtlIGtlcm5lbCkgaXMgc3VmZmljaWVudC4KPiA+Cj4KPiBJIHNlZS4gSSBjYW4gcmVuYW1lIGNs
YWltKCkgdG8gZW9pKCkgYW5kIHJlbW92ZSB0aGUgY29tcGxldGUoKSBmcm9tIHYzCj4gLSBrZWVw
IGFsbCBvcHMgYXMgbWVtYmVycyBvZiBzYmlfaXJxY2hpcF9kZXZpY2UsIHNvIHRoYXQgd2UgY2Fu
IHdyYXAKPiBSUDAxNi1NMiB1cC4KPgo+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFZJUlEgKFZp
cnR1YWwgSVJRKSBsYXllciBpcyBvbiB0b3Agb2YgSU5UQywgcHJvdmlkaW5nIElSUSBzdGF0ZQo+
ID4gPiA+ID4gbWFuYWdlbWVudCB2aWEgcGVyLShkb21haW4saGFydCkgSVJRIHBlbmRpbmcgcXVl
dWUsIHdpdGggY291cmllcgo+ID4gPiA+ID4gZGlzcGF0Y2hpbmcgYW5kIGludGVyZmFjZSB0byBl
bnF1ZXVlL3BvcC9jb21wbGV0ZSBhbiBJUlEgYW5kIG1hcCBod2lycQo+ID4gPiA+ID4gdG8gdmly
dHVhbCBJUlEgbnVtYmVyIHRvIGF2b2lkIGV4cG9zdXJlIG9mIGh3aXJxLgo+ID4gPiA+Cj4gPiA+
ID4gVGhpbmtpbmcgYWJvdXQgdGhpcyBtb3JlLCBhIHNlcGFyYXRlIFZJUlEgbGF5ZXIgd2lsbCBj
b25zdW1lCj4gPiA+ID4gcXVpdGUgYSBiaXQgb2YgbWVtb3J5IGZvciBtYW5hZ2luZyB0aGUgdmly
dHVhbCBJUlEgc3BhY2UuCj4gPiA+ID4KPiA+ID4gPiBJbnN0ZWFkIG9mIGEgVklSUSBsYXllciwg
ZWFjaCBpcnFjaGlwIGhhdmluZyBpdHMgb3duIEhXSVJRIHNwYWNlCj4gPiA+ID4gaXMgbXVjaCBt
b3JlIGZsZXhpYmxlIGFuZCBzY2FsYWJsZS4gSSBzcGVudCBwYXN0IDIgZGF5cyB0cnlpbmcgdG8K
PiA+ID4gPiBjb21lLXVwIHdpdGggdGhpcyBhYnN0cmFjdGlvbiB3aGljaCBJIHdpbGwgcG9zdCBp
biBhIGZldyBtaW51dGVzLgo+ID4gPiA+Cj4gPiA+ID4gSSBob3BlIHRoaXMgd2lsbCBzYXZlIHRp
bWUgaW4gcmV2aWV3cy4KPiA+ID4gPgo+ID4gPgo+ID4gPiBEbyB5b3UgcGxhbiB0byBoYXZlIHRo
ZSBxdWV1ZSBtYW5hZ2VtZW50IGluIGlycWNoaXA/Cj4gPgo+ID4gVGhlIGludGVycnVwdCBwZW5k
aW5nIHF1ZXVlIG1hbmFnZW1lbnQgZm9yIGRvbWFpbnMgbXVzdCBub3QKPiA+IGJlIHBhcnQgb2Yg
dGhlIHNiaV9pcnFjaGlwIGZyYW1ld29yay4gVGhlIHNiaV9pcnFjaGlwIG9ubHkgZm9jdXNlcwo+
ID4gb24gbWFuYWdpbmcgaG9zdCBpbnRlcnJ1cHRzIGFuZCBwcm92aWRpbmcgYSB3ZWxsIGRlZmlu
ZWQgQVBJIGZvcgo+ID4gaG9zdCBpcnFjaGlwIGRyaXZlcnMuIFRoZSBzZXJpZXMgd2hpY2ggSSBw
b3N0ZWQgZG9lcyBleGFjdGx5IHRoYXQuCj4gPgo+ID4gPiBNeSBvcmlnaW5hbCBpZGVhIGlzIHRv
IGtlZXAgaXJxY2hpcCBhcyBhIEhBTCBhbmQgYXMgbWluaW1hbCBhcyBpdAo+ID4gPiBjb3VsZCBi
ZSwgYW5kIHB1dCBvdGhlciBoaWdoZXIgbGV2ZWwgbG9naWNzIChlLmcuIHBlci0oZG9tYWluLGhh
cnQpCj4gPiA+IElSUSBwZW5kaW5nIHF1ZXVlIG1hbmFnZW1lbnQpIGFzIGEgaGlnaGVyIGxheWVy
IG9uIHRvcCBvZiBpcnFjaGlwLgo+ID4gPiBPbmNlIHlvdSBzZW5kIHlvdXIgcHJvcG9zYWwgSSBj
YW4gY2hlY2sgaG93IHRvIGNvbWJpbmUgdGhlIGlkZWFzLgo+ID4KPiA+IEF0IGEgaGlnaC1sZXZl
bCwgd2UgaGF2ZSBhcmUgdGhyZWUgcGFydHM6Cj4gPgo+ID4gMSkgc2JpX2lycWNoaXAgZnJhbWV3
b3JrIGZvciBtYW5hZ2luZyBob3N0IGludGVycnVwdHMKPiA+IDIpIEhvc3QgaXJxY2hpcCBkcml2
ZXJzIChzdWNoIGFzIEFQTElDLCBJTVNJQywgUExJQywgZXRjKQo+ID4gICAgIHdoaWNoIHVzZSB0
aGUgc2JpX2lycWNoaXAgZnJhbWV3b3JrIEFQSXMKPiA+IDMpIFBlci1kb21haW4gcGFyYXZpcnQg
b3IgdHJhcC1uLWVtdWxhdGVkIGlycWNoaXAgd2hpY2ggaXMKPiA+ICAgICBpbnN0YW50aWF0ZWQg
YmFzZWQgb24gZG9tYWluIGNvbmZpZ3VyYXRpb24gaW4gdGhlIERldmljZVRyZWUKPiA+Cj4gPiBU
aGUgcGVyLWRvbWFpbiBwYXJhdmlydCBvciB0cmFwLW4tZW11bGF0ZWQgaXJxY2hpcCAoIzMgYWJv
dmUpIHdpbGwKPiA+IGJlIHJlc3BvbnNpYmxlIGZvciByb3V0aW5nIGhvc3QgaW50ZXJydXB0cyB0
byB0aGUgZG9tYWluIGl0IGlzIGFzc29jaWF0ZWQKPiA+IHdpdGguIFRoZSBwZXItZG9tYWluIHBh
cmF2aXJ0IG9yIHRyYXAtbi1lbXVsYXRlZCBpcnFjaGlwIHdpbGwgcmVnaXN0ZXIKPiA+IGhhbmRs
ZXJzIGZvciBob3N0IGludGVycnVwdHMgYW5kIHJvdXRlIHRoZW0gYXMgZG9tYWluIGludGVycnVw
dHMgdG8KPiA+IHRoZSBkb21haW4gYW5kIGFsc28gbWFpbnRhaW4gZGF0YSBzdHJ1Y3R1cmVzIHRv
IHRyYWNrIHBlbmRpbmcgaW50ZXJydXB0cy4KPiA+Cj4KPiBGb3IgUlAwMTYtTTMgZGV2ZWxvcG1l
bnQsIEkgc3RpbGwgaGF2ZSBhIGNvdXBsZSBvZiBxdWVzdGlvbnMgb24geW91cgo+IG5ldyBwcm9w
b3NhbCAtIHdoaWNoIGludGVyZmFjZSBub3cgY2FuIHByb3ZpZGUgdGhlIHZpcnR1YWwgSVJRIG51
bWJlcgo+IGlmIHRoZSBtYXBwaW5nIGlzIG5vdCBzYXZlZCBpbiB0aGUgc3RhdGljIG1lbW9yeT8g
LSBUaGUKClRoZSBzZXJpZXMgd2hpY2ggSSBwb3N0ZWQgaXMgYW4gYWx0ZXJuYXRlIGFwcHJvYWNo
IHdoZXJlIGVhY2ggaG9zdAppbnRlcnJ1cHQgaXMgaWRlbnRpZmllZCBieSBhIHBhaXIgKHBvaW50
ZXIgdG8gaXJxY2hpcCwgaHdpcnEpLiBUaGlzIGlzIG11Y2gKc2ltcGxlciBjb21wYXJlZCB0byBt
YWludGFpbmluZyB2aXJ0dWFsIElSUSBudW1iZXIgc3BhY2Ugd2hlcmUgZWFjaAp2aXJxIG1hcHMg
dG8gYSBod2lycSBvZiBhbiBpcnFjaGlwLgoKPiBlbnF1ZXVlL2RlcXVldWUgaW1wbGVtZW50YXRp
b24gbm93IGlzIHVzaW5nIHRoZSB2aXJ0dWFsIElSUSBudW1iZXIgYXMKPiBhbiBhcmd1bWVudC4g
U2Vjb25kbHksIHdoaWNoIGRhdGEgc3RydWN0dXJlIGRvIHlvdSBwcmVmZXIgdGhlCj4gInBlci0o
ZG9tYWluLGhhcnQpIHF1ZXVlIiB0byBiZSBpbnRlZ3JhdGVkIGludG8/CgpUaGUgZGF0YSBzdHJ1
Y3R1cmUgdXNlZCB0byB0cmFjayBwZW5kaW5nIGludGVycnVwdCBmb3IgcGVyLWRvbWFpbgpwYXJh
dmlydCBvciB0cmFwLW4tZW11bGF0ZWQgaXJxY2hpcCBkZXBlbmRzIG9uIHRoZSB0eXBlIG9mIGly
cWNoaXAuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
