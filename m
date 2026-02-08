Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AE2EF06E4
	for <opensbi@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/+IfdmaNN8A/oJ/aWby7xIojOyLDURcLHzsZpT+4Yk=; b=cS4BrJq58w4AMD
	OuJBgcjPEZs/1GW0MFoj6euE0OQVntkwkfz1coIl9uAIV9ueo9rDu9GQ+rxU5wlYhuWZv4GOXT62S
	xnsEuVXaWQAvctJxvd/8Uf4EcFcxwqJ3iLLjGqyQMOYB+pbk9zKtMEnfnj1wobRTRniQA+dk1IA0l
	pl95hhx02Z2m2/LTsUidCWN4mDEFJWohq6uoX6rETXA4vT5MuLrsGXMMnrdWvF9nSjnDn3joyFB6L
	fS6mlakQwTBV5pzCbtb3R4hMYTj3pPUTXVH1zX12Y+X5pO/vAX54FGuKfDd566MjKMQMBQLlSTa6r
	/nHyGT4+MWSLvruy/2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp9ro-0000000DZ61-31C7;
	Sun, 08 Feb 2026 18:50:44 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp9rl-0000000DZ5d-22Wu
	for opensbi@lists.infradead.org;
	Sun, 08 Feb 2026 18:50:42 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so1104561241.0
        for <opensbi@lists.infradead.org>; Sun, 08 Feb 2026 10:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770576639; cv=none;
        d=google.com; s=arc-20240605;
        b=foHLVX9WC+VymnXbfAosK2mdooZ2Dcd01E281swjxgS4YfLG0AykwaoYuwIIyv+Av1
         Cw5UfD6skoSrhnEvlIEjM4Ywas7vSoSrwsNCBqouq7ukvAK4BhXiIxG51MmpaSG8nv/f
         UuFfTwtd5YBL5m8jBvSKr3EZa1T9jn18BiRX35E05y7wpmDHVrx3vgruLEk3w5CHD02h
         Nid27Dz0k+u8zCc7cqhBOHkWiq0qM7v3lEQgjZp/FrMmUP+Oo0eT0Tz7lBy/A/gZ+UZH
         tPX3fTCwTADapY6pUxnsxm+4TkBknh/lU+fqdluci7WbykYCtHoOVGPB0GoMbXhbbbz1
         48GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MV7JD7RtVnIkM+IMt4Vu7xphh6eTNNz+e4d/QNTQHQQ=;
        fh=CeyCQp+XPGqs+/QFfJPRWct+orJ+/ruIFXLmnlb/73E=;
        b=THbGLG9ulSeGOfce07c+h4kv9b5ujcifmmbbXBsq70Bye7U147KHXjB4Qfcn6SEiVd
         3C5ekr7N1MImUA0WA1mWUatgPdDhsJiV4akmLuYl1tYQ0Vm6512Gm6l3p+UYWHg4vyzo
         CY8gTWvzS0Awv5lyBNeYff1jlQH/YhxJFUaPeI88rsOm/72ksPd5Yxckzw87ITA4pfX+
         znkC5/6pIaZJk8IGJphrGm55r9u9G2P3OIi9RoXcJCSJBNO1k+zkyV/gR3twvirZN/DI
         DswDvVBQAPnVTMLGrePIrVS+u5k+5fJy02HDDZpfzGd7vlpFM72Bslq1FH26cvqSD5tn
         Ze1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770576639; x=1771181439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV7JD7RtVnIkM+IMt4Vu7xphh6eTNNz+e4d/QNTQHQQ=;
        b=GcWWpCmEdqfdhGG13C2N3m27NaGO0QZ6H3WuAEKN3cR531row63lV8pAwR56Nvze95
         aYeU+ZEndKBBb/WL3C4Wt5o+HIdAyU/+xzaoLT2n+HNzO5pyKOfZLfPSmbTWi81fpHNM
         btUzqd5TFbXHaAXWqXXJzJel1OfGP716G7p4IS8joyw8X5K0zOhDFtroH/7xBHsEr7k3
         Y+vrj0IMeLzYUNN7LbobIZkrTiv6eGKjBTBKbDaTik/qHmLvlL87V7e+sWCc2yKIBI0/
         2Nun42fD30st/AnF5+ojLuSRDpeM3BSn9N2rQF4ZRpYIZAdDua98IrlMjhKD8fzfVi8F
         xyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770576639; x=1771181439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MV7JD7RtVnIkM+IMt4Vu7xphh6eTNNz+e4d/QNTQHQQ=;
        b=DS2+mAUicIOfGK3ToytE53oQHRsgdG7uWOfgwXyq0SSI7tr45vz3w7qr05qoKtzkQ/
         ydpNraGD+HAxvwdLQkmDrKv4AZFIX76r6hgvENBwC5NL82NXS74O6uc1I78SyaXACEWT
         OB38W0NRPgDOy44xMzvhY4v1LDN1E7VaaMO/YfUrzj99fFej6jhn5k8AchXw7A6vet2D
         lzdNcZ3lHb14mwc2UV9M0IVnbwQ848xJ+T3X/uq/jDnZij/aPAdg6+grO7kZd3Yn2BzZ
         Ojt2Jsb0BY/ITcRat/f5otZ62LbQi0jzf2t5OTVq8hlz+EEfd1jUfC4/UsszF/QZAxpi
         6rFQ==
X-Gm-Message-State: AOJu0YxhTpxd23z1OUuYq/HlZ7T8nsZCSPa1ZwOOTximth7YSuXEhf00
	qKDwpX31H676kKIOsThjuW8REBXjjXKw9LbpKgUdqWzXaN6uAjg78+V1Fom8w1Kvr1AEfTEzzeI
	fl/91oNmjSNEIJ8sz3z6cPRs547KzVco=
X-Gm-Gg: AZuq6aLZZjYPsOoMJ/19QUhJFyL4lZurhm02HMC+d5+AFxpvYpPWkvFKynbmJ3zuDla
	jAMfJ4+O7fkiKtN2EfYg9TLZ6kdrX4umHJYwJD7Q+pmdbe8DjzrBc/2wT8tcTMBbExMZTgti87A
	areCIGv+czfstbpubO22n8THfZwrbx1fThIeUPl1+p3ywOs55aCeS09cm8wp2fPXtBJ+8Cu1MUq
	4BW/cam+5Oo66NvjyJmjDPVhFsgZ6EjoKJtvJwoy7+S4PBDXy5E+sXAS4FZgW4O8g3rjM/K
X-Received: by 2002:a05:6102:3589:b0:5f5:4d65:90d4 with SMTP id
 ada2fe7eead31-5fae76be9a9mr2540640137.1.1770576639540; Sun, 08 Feb 2026
 10:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20260202150207.1331811-1-raymondmaoca@gmail.com>
 <CAAhSdy1VQp5RtgR+uK6Wv6+RTw0Ja3-Oa-YnR17--0jmerjOcQ@mail.gmail.com>
 <CAMDkj5zgcR1Jyspp9qFme7cmS73tcxScY9CpunnPiNUHG9To1g@mail.gmail.com> <CAAhSdy3QGDY1k+M6O2aBz4=KvoTmvUmWRUXAkK--irMyZjzeoA@mail.gmail.com>
In-Reply-To: <CAAhSdy3QGDY1k+M6O2aBz4=KvoTmvUmWRUXAkK--irMyZjzeoA@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Sun, 8 Feb 2026 13:50:28 -0500
X-Gm-Features: AZwV_QiNmQQ48N2fjNIRCygmQXuvRVU87D9SkvzbIobfNBimHdn5nHrtB2jXdK4
Message-ID: <CAMDkj5x1NUzaqpVOofCY+--mfJLaKL4uEZGPjXL9a35r5eyJXw@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/2] Introduce irqchip and VIRQ layer prototypes
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_105041_630269_F4EDA446 
X-CRM114-Status: GOOD (  33.62  )
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

SGkgQW51cCwKCk9uIFN1biwgRmViIDgsIDIwMjYgYXQgODoyNOKAr0FNIEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgNywgMjAyNiBhdCA5OjQx
4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9jYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IEhpIEFudXAsCj4gPgo+ID4gT24gU2F0LCBGZWIgNywgMjAyNiBhdCA1OjA44oCvQU0gQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgRmVi
IDIsIDIwMjYgYXQgODozMuKAr1BNIFJheW1vbmQgTWFvIDxyYXltb25kbWFvY2FAZ21haWwuY29t
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0By
aXNjc3Rhci5jb20+Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIFJGQyBpbnRyb2R1Y2VzIGlycWNoaXAg
YWJzdHJhY3Rpb24gYW5kIFZJUlEgbGF5ZXJzIGZvciBBUExJQwo+ID4gPiA+IHdpcmVkIGludGVy
cnVwdCBzdXBwb3J0IGluIE9wZW5TQkkuCj4gPiA+ID4KPiA+ID4gPiBJbiB0aGUgY3VycmVudCBP
cGVuU0JJIGltcGxlbWVudGF0aW9uLCBBUExJQyBzdXBwb3J0IHByaW1hcmlseSBmb2N1c2VzCj4g
PiA+ID4gb24gaW5pdGlhbGl6YXRpb24gYW5kIGRlbGVnYXRpb24sIHdoaWxlIGV4dGVybmFsIGlu
dGVycnVwdCBoYW5kbGluZwo+ID4gPiA+IGZvciB3aXJlZCBpbnRlcnJ1cHRzIHJlbWFpbnMgbGFy
Z2VseSBzdHViYmVkLiBBcyBhIHJlc3VsdDoKPiA+ID4gPiAtIFRoZXJlIGlzIG5vIGdlbmVyaWMg
bWVjaGFuaXNtIGZvciBPcGVuU0JJIGRyaXZlcnMgb3IgcGxhdGZvcm1zIHRvCj4gPiA+ID4gICBy
ZWdpc3RlciBoYW5kbGVycyBmb3Igd2lyZWQgaW50ZXJydXB0IGxpbmVzLgo+ID4gPiA+IC0gSW50
ZXJydXB0IGRpc3BhdGNoIHJlbWFpbnMgdGlnaHRseSBjb3VwbGVkIHRvIHNwZWNpZmljIGlycWNo
aXAKPiA+ID4gPiAgIGltcGxlbWVudGF0aW9ucy4KPiA+ID4gPgo+ID4gPiA+IFRoZSBnb2FsIGlz
IHRvIGludHJvZHVjZSBhIHNtYWxsLCBleHRlbnNpYmxlIGFic3RyYWN0aW9uIGZvciBpcnFjaGlw
Cj4gPiA+ID4gdG8gaGlkZSB0aGUgSFcgZGV0YWlscyBhbmQgcHJvdmlkZSBhYnN0cmFjdCBvcGVy
YXRpb25zIGxpa2UgaW50ZXJydXB0Cj4gPiA+ID4gcHJvdmlkZXIgcmVnaXN0cmF0aW9uLCBjbGFp
bS9jb21wbGV0ZS9tYXNrL3VubWFzayBvcGVyYXRpb25zLgo+ID4gPgo+ID4gPiBXZSBkb24ndCBu
ZWVkIGNsYWltKCkgYW5kIGNvbXBsZXRlKCkgY2FsbGJhY2tzIGluc3RlYWQgc2luZ2xlIGVvaSgp
Cj4gPiA+IGNhbGxiYWNrIGlzIHN1ZmZpY2llbnQgYmVjYXVzZSB0aGUgQVBMSUMgZHJpdmVyIHdp
bGwgaGF2ZSB0byBhbnl3YXkKPiA+ID4gcmVhZCB0aGUgQ0xBSU0gcmVnaXN0ZXIgdG8gZ2V0IHRo
ZSBoYXJkd2FyZSBpcnEgbnVtYmVyLgo+ID4gPgo+ID4KPiA+IFRoZSBhYnN0cmFjdGlvbiBpcyBu
b3Qgb25seSBmb3IgQVBMSUMgYW5kIGlzIGZsZXhpYmxlIGZvciBvdGhlcgo+ID4gaW50ZXJydXB0
IGNvbnRyb2xsZXJzLCB0aGF0IGlzIHRoZSByZWFzb24gd2UgaGF2ZSBjbGFpbS9jb21wbGV0ZSBh
cwo+ID4gZ2VuZXJhbCBpbnRlcmZhY2VzLgo+Cj4gVGhlIGNsYWltL2NvbXBsZXRlIHRlcm1pbm9s
b2d5IGlzIHZlcnkgc3BlY2lmaWMgdG8gUExJQyBldmVuIHRob3VnaAo+IHdlIGNhbiByZXRyb2Zp
dCBpdCBmb3IgQVBMSUMgYW5kIElNU0lDLiBJbnN0ZWFkIGEgc2ltcGxlIGVvaSgpIGNhbGxiYWNr
Cj4gKGp1c3QgbGlrZSBrZXJuZWwpIGlzIHN1ZmZpY2llbnQuCj4KCkkgc2VlLiBJIGNhbiByZW5h
bWUgY2xhaW0oKSB0byBlb2koKSBhbmQgcmVtb3ZlIHRoZSBjb21wbGV0ZSgpIGZyb20gdjMKLSBr
ZWVwIGFsbCBvcHMgYXMgbWVtYmVycyBvZiBzYmlfaXJxY2hpcF9kZXZpY2UsIHNvIHRoYXQgd2Ug
Y2FuIHdyYXAKUlAwMTYtTTIgdXAuCgo+ID4KPiA+ID4gPgo+ID4gPiA+IFZJUlEgKFZpcnR1YWwg
SVJRKSBsYXllciBpcyBvbiB0b3Agb2YgSU5UQywgcHJvdmlkaW5nIElSUSBzdGF0ZQo+ID4gPiA+
IG1hbmFnZW1lbnQgdmlhIHBlci0oZG9tYWluLGhhcnQpIElSUSBwZW5kaW5nIHF1ZXVlLCB3aXRo
IGNvdXJpZXIKPiA+ID4gPiBkaXNwYXRjaGluZyBhbmQgaW50ZXJmYWNlIHRvIGVucXVldWUvcG9w
L2NvbXBsZXRlIGFuIElSUSBhbmQgbWFwIGh3aXJxCj4gPiA+ID4gdG8gdmlydHVhbCBJUlEgbnVt
YmVyIHRvIGF2b2lkIGV4cG9zdXJlIG9mIGh3aXJxLgo+ID4gPgo+ID4gPiBUaGlua2luZyBhYm91
dCB0aGlzIG1vcmUsIGEgc2VwYXJhdGUgVklSUSBsYXllciB3aWxsIGNvbnN1bWUKPiA+ID4gcXVp
dGUgYSBiaXQgb2YgbWVtb3J5IGZvciBtYW5hZ2luZyB0aGUgdmlydHVhbCBJUlEgc3BhY2UuCj4g
PiA+Cj4gPiA+IEluc3RlYWQgb2YgYSBWSVJRIGxheWVyLCBlYWNoIGlycWNoaXAgaGF2aW5nIGl0
cyBvd24gSFdJUlEgc3BhY2UKPiA+ID4gaXMgbXVjaCBtb3JlIGZsZXhpYmxlIGFuZCBzY2FsYWJs
ZS4gSSBzcGVudCBwYXN0IDIgZGF5cyB0cnlpbmcgdG8KPiA+ID4gY29tZS11cCB3aXRoIHRoaXMg
YWJzdHJhY3Rpb24gd2hpY2ggSSB3aWxsIHBvc3QgaW4gYSBmZXcgbWludXRlcy4KPiA+ID4KPiA+
ID4gSSBob3BlIHRoaXMgd2lsbCBzYXZlIHRpbWUgaW4gcmV2aWV3cy4KPiA+ID4KPiA+Cj4gPiBE
byB5b3UgcGxhbiB0byBoYXZlIHRoZSBxdWV1ZSBtYW5hZ2VtZW50IGluIGlycWNoaXA/Cj4KPiBU
aGUgaW50ZXJydXB0IHBlbmRpbmcgcXVldWUgbWFuYWdlbWVudCBmb3IgZG9tYWlucyBtdXN0IG5v
dAo+IGJlIHBhcnQgb2YgdGhlIHNiaV9pcnFjaGlwIGZyYW1ld29yay4gVGhlIHNiaV9pcnFjaGlw
IG9ubHkgZm9jdXNlcwo+IG9uIG1hbmFnaW5nIGhvc3QgaW50ZXJydXB0cyBhbmQgcHJvdmlkaW5n
IGEgd2VsbCBkZWZpbmVkIEFQSSBmb3IKPiBob3N0IGlycWNoaXAgZHJpdmVycy4gVGhlIHNlcmll
cyB3aGljaCBJIHBvc3RlZCBkb2VzIGV4YWN0bHkgdGhhdC4KPgo+ID4gTXkgb3JpZ2luYWwgaWRl
YSBpcyB0byBrZWVwIGlycWNoaXAgYXMgYSBIQUwgYW5kIGFzIG1pbmltYWwgYXMgaXQKPiA+IGNv
dWxkIGJlLCBhbmQgcHV0IG90aGVyIGhpZ2hlciBsZXZlbCBsb2dpY3MgKGUuZy4gcGVyLShkb21h
aW4saGFydCkKPiA+IElSUSBwZW5kaW5nIHF1ZXVlIG1hbmFnZW1lbnQpIGFzIGEgaGlnaGVyIGxh
eWVyIG9uIHRvcCBvZiBpcnFjaGlwLgo+ID4gT25jZSB5b3Ugc2VuZCB5b3VyIHByb3Bvc2FsIEkg
Y2FuIGNoZWNrIGhvdyB0byBjb21iaW5lIHRoZSBpZGVhcy4KPgo+IEF0IGEgaGlnaC1sZXZlbCwg
d2UgaGF2ZSBhcmUgdGhyZWUgcGFydHM6Cj4KPiAxKSBzYmlfaXJxY2hpcCBmcmFtZXdvcmsgZm9y
IG1hbmFnaW5nIGhvc3QgaW50ZXJydXB0cwo+IDIpIEhvc3QgaXJxY2hpcCBkcml2ZXJzIChzdWNo
IGFzIEFQTElDLCBJTVNJQywgUExJQywgZXRjKQo+ICAgICB3aGljaCB1c2UgdGhlIHNiaV9pcnFj
aGlwIGZyYW1ld29yayBBUElzCj4gMykgUGVyLWRvbWFpbiBwYXJhdmlydCBvciB0cmFwLW4tZW11
bGF0ZWQgaXJxY2hpcCB3aGljaCBpcwo+ICAgICBpbnN0YW50aWF0ZWQgYmFzZWQgb24gZG9tYWlu
IGNvbmZpZ3VyYXRpb24gaW4gdGhlIERldmljZVRyZWUKPgo+IFRoZSBwZXItZG9tYWluIHBhcmF2
aXJ0IG9yIHRyYXAtbi1lbXVsYXRlZCBpcnFjaGlwICgjMyBhYm92ZSkgd2lsbAo+IGJlIHJlc3Bv
bnNpYmxlIGZvciByb3V0aW5nIGhvc3QgaW50ZXJydXB0cyB0byB0aGUgZG9tYWluIGl0IGlzIGFz
c29jaWF0ZWQKPiB3aXRoLiBUaGUgcGVyLWRvbWFpbiBwYXJhdmlydCBvciB0cmFwLW4tZW11bGF0
ZWQgaXJxY2hpcCB3aWxsIHJlZ2lzdGVyCj4gaGFuZGxlcnMgZm9yIGhvc3QgaW50ZXJydXB0cyBh
bmQgcm91dGUgdGhlbSBhcyBkb21haW4gaW50ZXJydXB0cyB0bwo+IHRoZSBkb21haW4gYW5kIGFs
c28gbWFpbnRhaW4gZGF0YSBzdHJ1Y3R1cmVzIHRvIHRyYWNrIHBlbmRpbmcgaW50ZXJydXB0cy4K
PgoKRm9yIFJQMDE2LU0zIGRldmVsb3BtZW50LCBJIHN0aWxsIGhhdmUgYSBjb3VwbGUgb2YgcXVl
c3Rpb25zIG9uIHlvdXIKbmV3IHByb3Bvc2FsIC0gd2hpY2ggaW50ZXJmYWNlIG5vdyBjYW4gcHJv
dmlkZSB0aGUgdmlydHVhbCBJUlEgbnVtYmVyCmlmIHRoZSBtYXBwaW5nIGlzIG5vdCBzYXZlZCBp
biB0aGUgc3RhdGljIG1lbW9yeT8gLSBUaGUKZW5xdWV1ZS9kZXF1ZXVlIGltcGxlbWVudGF0aW9u
IG5vdyBpcyB1c2luZyB0aGUgdmlydHVhbCBJUlEgbnVtYmVyIGFzCmFuIGFyZ3VtZW50LiBTZWNv
bmRseSwgd2hpY2ggZGF0YSBzdHJ1Y3R1cmUgZG8geW91IHByZWZlciB0aGUKInBlci0oZG9tYWlu
LGhhcnQpIHF1ZXVlIiB0byBiZSBpbnRlZ3JhdGVkIGludG8/CgpUaGFua3MuClJlZ2FyZHMsClJh
eW1vbmQKCj4gUmVnYXJkcywKPiBBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
