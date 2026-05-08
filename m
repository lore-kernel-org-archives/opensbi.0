Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458F9CD342F
	for <opensbi@archiver.kernel.org>; Fri,  8 May 2026 05:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zGqfnHoBMp88vbmA99Zfhmm5ADxUv4bHOQsiyQ/y5E=; b=bbjTJv2V8QngDt
	ruv1crLra7rLImHt93Sz2VDylg63G4iSgVI8eeAzZv+dZUYtwg0Pmtq4fqNZaoGbbL+U/tk+mi4Zl
	BH7JSI9j49ENWgqkZWdsff3m6XuAgeEwjW5YkqKnO+SfmKpr8kpR4Z3m3pllkkRIpYxDdzUhXkh3Y
	JE8vUZCb+CcdKnHWRx8Eq3REq+MjZFuuSrIsmGAOQBtDa2Si/6zMVI3ncLrju2Phq4qUF8/2is+qd
	91w+SREDM4ZTiTuaGoUewHurlDALz3N1N6nS7W9fYZhtjJaea0hajmgfiyyXvrDmDC5JGgoXgMbG7
	wWPWABw5CDSGM/hgPUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLDM9-00000005ZxW-1Unu;
	Fri, 08 May 2026 05:02:33 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLDM6-00000005Zx2-1qJ1
	for opensbi@lists.infradead.org;
	Fri, 08 May 2026 05:02:31 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6966d0665baso1092809eaf.1
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 22:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778216549; cv=none;
        d=google.com; s=arc-20240605;
        b=GbKXnNRijJsYrjGYuS+lDa7FNbvvejuFPiKcnxLYWtOHnZIbps6xoejVkZ+G3CVd0e
         P+MQUrdlox11XU037yCaGwVBbvrd04d0+9Ci0hZafnCO5imqwOUvbEjD9FBtNPeFJxkL
         1o4qlhoz+qWW1bjj8D6JMU5fVPYUrAomBhdZ1+W2fslVh+/ymfBiMaYZz9JhxxO/EV+s
         xtBOWk7k2T2koHI1atBUrLeemuNk3tHEx18z5jKK1vLHPjyuMLnghvq4nZPgwsj3SPkN
         DVvmq+6zMf1KdXIliQWjLysUIu37sK3/raLXoKWUlOwr3StaTvFNJD3hzsocTHHAK0Ei
         O3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UuWQ7iVulyZYU1hZbLwgHBb0S9FWVmtqXMk2EBnWjgg=;
        fh=ZAtPgNT/mWeTZ6vNEkZRyB0hM0YzwkpsSL1tZLHA+mM=;
        b=QoefzQ/sYCIx3v8POBMFWpnFOZR2mHVbpwAqwrIcdhbWDISaYZkCHgGBvsuEZ7x96W
         oNXhvOViVvAvpbx5PvrZ2cU5oUkDkAOnybrm+EuUVvNAJMobeRcZUP7IESK7IXC+v8a6
         NzC/ZUvk/omYurza9cy/rlL3ETfGoapP2JlcPgoyHpAW8Hfircl8Mc0SWO/yHQtrwAsF
         HxSxG2fMLJjyzn+SyIItyI74dW1U5IOfcqw4En0IErpIF4+gEFwvkAh7CZyDLEGC5gun
         djHWNReGXyBP9FMlxFeH3gNARbEwbvgvDfSOHQzyqg51c3lcwIP6neUZ8CWtkOzw+wXz
         v1TQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778216549; x=1778821349; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuWQ7iVulyZYU1hZbLwgHBb0S9FWVmtqXMk2EBnWjgg=;
        b=SWIOJWShO+42iwgo++GiiHBbMcKzuFiQoiZjYMMtC7GIUhsK6EZVcrYCTpOPw8ggsC
         PnBFa98bhgzfcauwe6FhBIt235omKN1qMCLhBskIsu+aB5+eFIRCsg0fjRiJiFzVZJgQ
         xRReIXnRIr3s+nwRQh6Zmkw2XTeHbfeoQCRUfYUqrQGtpYskFmj/FYmX1W/Eh+J3+5c1
         Li2duVBIr82DT/wKEdsnR2GMP6T+nuiSWDH+qxZllNVaHeEoLATeemTMHd/CKyc8mreR
         RGSNOIMKGICEUb1qxnNsEpJNVb0L9nUVhwuNKBn0+KnUf1nLFDv3Qhtb5fQZNqYrT0+P
         3evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778216549; x=1778821349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UuWQ7iVulyZYU1hZbLwgHBb0S9FWVmtqXMk2EBnWjgg=;
        b=pW/D//jiopDCsKb+q4r3CXleZIKjWNBUyxGo2vXlr6wfY7NFtsGLjYuMTkrgckmIMr
         PdbbC3qiWjCRMwe7HKaPKV617K8Z23JmMzvB3tw1MsMyuLbXyufVcy37YjLr+y2IExDv
         ECQxSTWLvnYjRqm4a9iI4GCFdfVmY70GGBPrFJEoGFFWLfX4+xLse5Ri+Bt7KLb9p6Uu
         Qna90xhiAlbeXASl18jpRRiiFl5b+lxQbKSXEw2ywBhLjrN5mRRD2Lgs1BadY6AJMyv6
         ZUvNv6zFhDnF5NZAErMm4wE5P0S5nzS6vDSuQ83AvhXEtx889Qb3tpCLrkJs7KbYQRl0
         vrhg==
X-Gm-Message-State: AOJu0YwGpMlukmdq2JESh+1Kluri0PEsRhYOqd9wszTXzdKD6BRyGKoh
	Qsak9fyC90QzHdqZ9bfTf2p0OnoQwhHDQGtcgRrKUrMRNr8NzNqKze32l1UE8vskDGAVfwyIKda
	1qiftz9jkIQkVaXFsj3OODdE9K6VCPP+cgJqa1rxfSQ==
X-Gm-Gg: AeBDietZ24eIsYGgmLuPfXenqqetQdJdtkIaIAAvw3mfUm05fsYZ4g6g5H6xAOW2MqV
	Sc/vxUYdBOX9AMLuNLsdOC53LgVXHhh7ns4ATdUSGUVnWgyOuJ80XDwoazWV4Makgk15fQtxx2o
	O0DVU1wY4m4ImydzioqtZd9bRlMMhfLDWSQayrhfBnzG+yRO2kl3ju/BFFrCU6kx0IICMiUcROv
	smNoMxEEB2XNaAVgOu/zMPI78ct3ktZmhW4MO8pKE2swyTjwyyuaZKPT3WefVNeRx5FTVU5tbDu
	Q4raRNsCX3vD4pMMwniaQ5zNr9FM12aPAvtC9xpwaJoQ5kN8iA3MAvX5lDPFybLwO+5AMHHS0X0
	Wy0CAR84chgYBe+xNRdve87zImknwEukIwXvjZA==
X-Received: by 2002:a05:6820:218:b0:694:8f37:708a with SMTP id
 006d021491bc7-69998cbccb8mr6275989eaf.15.1778216548851; Thu, 07 May 2026
 22:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com> <acd52b0f3468758bc5f09e6a45662341b31d4d87.1778176768.git.evvoevod@tenstorrent.com>
In-Reply-To: <acd52b0f3468758bc5f09e6a45662341b31d4d87.1778176768.git.evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 May 2026 10:32:17 +0530
X-Gm-Features: AVHnY4JOVbK9kOYDU7rQS23-XumHyJvdpdFFlcd0zsUBPKnMpdZ6DPIQr7Y8ziw
Message-ID: <CAAhSdy2gGxBDuFud4BAferOV1DgNf5vn2j3cFvf24AT2gZkS0Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] lib: sbi: Move Zkr entropy initialization from
 fw_base.S to init_coldboot
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_220230_539598_8E0CD5FA 
X-CRM114-Status: GOOD (  22.23  )
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

T24gVGh1LCBNYXkgNywgMjAyNiBhdCAxMTozOOKAr1BNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IEN1cnJlbnQgcGxhY2VtZW50IG9mIGVudHJv
cHkgaW5pdGlhbGl6YXRpb24gdmlhIFprciBleHRlbnNpb24gcmVxdWlyZXMgYQo+IHRyYXAtYmFz
ZWQgbWVjaGFuaXNtIHRvIGhhbmRsZSBhYnNlbnQgWmtyIGV4dGVuc2lvbiBjYXNlLiBJbiBwcmVz
ZW5jZSBvZgo+IFNtcm5taSBleHRlbnNpb24gbm8gdHJhcC1iYXNlZCBtZWNoYW5pc21zIHNob3Vs
ZCBiZSB1c2VkIGJlZm9yZSBTbXJubWkgaXMKPiBkZXRlY3RlZCBhbmQgZW5hYmxlZCBvdGhlcndp
c2UgdHJhcCB3aWxsIGp1bXAgdG8gdW5kZWZpbmVkIGxvY2F0aW9uLgo+IE1vdmUgc3RhY2sgZ3Vh
cmQgaW5pdGlhbGl6YXRpb24gaW50byBpbml0X2NvbGRib290IGZ1bmN0aW9uIGJvZHkgYWZ0ZXIK
PiBkZXZpY2UgdHJlZSBoYXMgYmVlbiBwYXJzZWQgc28gd2Uga25vdyBpZiBaa3IgZXh0ZW5zaW9u
IGlzIGltcGxlbWVudGVkIGJ5Cj4gdGhlIHBsYXRmb3JtIHdoaWNoIGhlbHBzIHRvIGF2b2lkIHRy
YXAtYmFzZWQgZGlzY292ZXJ5Lgo+IGluaXRfY29sZGJvb3QoKSBpcyBhIHNhZmUgcGxhY2UgdG8g
aW5pdGlhbGl6ZSBlbnRyb3B5IGJlY2F1c2UgaXQgZG9lc24ndAo+IHJldHVybiBzbyBubyBjaGVj
ayBvZiBfX3N0YWNrX2Noa19ndWFyZCBhZ2FpbnN0IHZhbHVlIG9uIGVudHJ5Cj4gd2lsbCBiZSBk
b25lLgo+Cj4gU2lnbmVkLW9mZi1ieTogRXZnZW55IFZvZXZvZGluIDxldnZvZXZvZEB0ZW5zdG9y
cmVudC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBmaXJtd2FyZS9md19iYXNlLlMgfCAzMiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBsaWIvc2JpL3NiaV9pbml0LmMgfCAz
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUv
ZndfYmFzZS5TIGIvZmlybXdhcmUvZndfYmFzZS5TCj4gaW5kZXggMDQzZGU3ZDcuLjVkNjU0MGQ3
IDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL2Z3X2Jhc2UuUwo+ICsrKyBiL2Zpcm13YXJlL2Z3X2Jh
c2UuUwo+IEBAIC0xMDcsMzAgKzEwNyw2IEBAIF9ic3NfemVybzoKPiAgICAgICAgIGFkZCAgICAg
czQsIHM0LCBfX1NJWkVPRl9QT0lOVEVSX18KPiAgICAgICAgIGJsdCAgICAgczQsIHM1LCBfYnNz
X3plcm8KPgo+IC0gICAgICAgLyogVHJ5aW5nIHRvIGluaXRpYWxpemUgdGhlIHN0YWNrIGd1YXJk
IHZpYSB0aGUgWmtyIGV4dGVuc2lvbiAqLwo+IC0gICAgICAgbGxhICAgICB0MCwgX19zdGFja19j
aGtfZ3VhcmRfZG9uZQo+IC0gICAgICAgY3NydyAgICBDU1JfTVRWRUMsIHQwCj4gLSAgICAgICBs
aSAgICAgIHQwLCAwCj4gLSAgICAgICBsaSAgICAgIHQzLCBTRUVEX09QVFNfRVMxNgo+IC0gICAg
ICAgbGkgICAgICB0NCwgU0VFRF9FTlRST1BZX01BU0sKPiAtICAgICAgIGxpICAgICAgdDUsIF9f
U0laRU9GX1BPSU5URVJfXwo+IC1fX3N0YWNrX2Noa19ndWFyZF9sb29wOgo+IC0gICAgICAgY3Ny
cncgICB0MSwgQ1NSX1NFRUQsIHgwCj4gLSAgICAgICBsaSAgICAgIHQyLCBTRUVEX09QVFNfTUFT
Swo+IC0gICAgICAgYW5kICAgICB0MiwgdDIsIHQxCj4gLSAgICAgICBiZ3R1ICAgIHQyLCB0Mywg
X19zdGFja19jaGtfZ3VhcmRfZG9uZQo+IC0gICAgICAgYmx0dSAgICB0MiwgdDMsIF9fc3RhY2tf
Y2hrX2d1YXJkX2xvb3AKPiAtICAgICAgIGFuZCAgICAgdDEsIHQxLCB0NAo+IC0gICAgICAgc2xs
aSAgICB0MCwgdDAsIDE2Cj4gLSAgICAgICBvciAgICAgIHQwLCB0MCwgdDEKPiAtICAgICAgIGFk
ZGkgICAgdDUsIHQ1LCAtMgo+IC0gICAgICAgYmd0eiAgICB0NSwgX19zdGFja19jaGtfZ3VhcmRf
bG9vcAo+IC0gICAgICAgbGxhICAgICB0MSwgX19zdGFja19jaGtfZ3VhcmQKPiAtICAgICAgIFJF
R19TICAgdDAsIDAodDEpCj4gLSAgICAgICBqICAgICAgIF9fc3RhY2tfY2hrX2d1YXJkX2RvbmUK
PiAtICAgICAgIC5hbGlnbiAzCj4gLV9fc3RhY2tfY2hrX2d1YXJkX2RvbmU6Cj4gLQo+ICAgICAg
ICAgLyogU2V0dXAgdGVtcG9yYXJ5IHRyYXAgaGFuZGxlciAqLwo+ICAgICAgICAgbGxhICAgICBz
NCwgX3N0YXJ0X2hhbmcKPiAgICAgICAgIGNzcncgICAgQ1NSX01UVkVDLCBzNAo+IEBAIC04OTUs
MTQgKzg3MSw2IEBAIF9fc3RhY2tfY2hrX2ZhaWw6Cj4gICAgICAgICBsYSAgICAgIGEwLCAuTHN0
YWNrX2NvcnJ1cHRfbXNnCj4gICAgICAgICBjYWxsICAgIHNiaV9wYW5pYwo+Cj4gLSAgICAgICAv
KiBJbml0aWFsIHZhbHVlIG9mIHRoZSBzdGFjayBndWFyZCB2YXJpYWJsZSAqLwo+IC0gICAgICAg
LnNlY3Rpb24gLmRhdGEKPiAtICAgICAgIC5hbGlnbiAzCj4gLSAgICAgICAuZ2xvYmwgX19zdGFj
a19jaGtfZ3VhcmQKPiAtICAgICAgIC50eXBlIF9fc3RhY2tfY2hrX2d1YXJkLCAlb2JqZWN0Cj4g
LV9fc3RhY2tfY2hrX2d1YXJkOgo+IC0gICAgICAgUklTQ1ZfUFRSICAgICAgIDB4OTVCNUZGNUEK
PiAtCj4gICNpZmRlZiBGV19GRFRfUEFUSAo+ICAgICAgICAgLnNlY3Rpb24gLnJvZGF0YQo+ICAg
ICAgICAgLmFsaWduIDQKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaW5pdC5jIGIvbGliL3Ni
aS9zYmlfaW5pdC5jCj4gaW5kZXggYWFlMDM1ZTEuLmIyNDhlNzNmIDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvc2JpX2luaXQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+IEBAIC0yMTgsNiAr
MjE4LDggQEAgc3RhdGljIHZvaWQgd2FrZV9jb2xkYm9vdF9oYXJ0cyhzdHJ1Y3Qgc2JpX3NjcmF0
Y2ggKnNjcmF0Y2gpCj4gICAgICAgICBfX3NtcF9zdG9yZV9yZWxlYXNlKCZjb2xkYm9vdF9kb25l
LCAxKTsKPiAgfQo+Cj4gK3Vuc2lnbmVkIGxvbmcgX19zdGFja19jaGtfZ3VhcmQgPSAweDk1QjVG
RjVBOwo+ICsKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZW50cnlfY291bnRfb2Zmc2V0Owo+ICBz
dGF0aWMgdW5zaWduZWQgbG9uZyBpbml0X2NvdW50X29mZnNldDsKPgo+IEBAIC0yNjksNiArMjcx
LDM1IEBAIHN0YXRpYyB2b2lkIF9fbm9yZXR1cm4gaW5pdF9jb2xkYm9vdChzdHJ1Y3Qgc2JpX3Nj
cmF0Y2ggKnNjcmF0Y2gsIHUzMiBoYXJ0aWQpCj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAg
ICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEluaXRp
YWxpemUgc3RhY2sgZ3VhcmQgdmlhIFprciBlbnRyb3B5IHNvdXJjZSBpZiBaa3IgaXMKPiArICAg
ICAgICAqIGltcGxlbWVudGVkIGFjY29yZGluZyB0byBkZXZpY2UgdHJlZS4gV3JpdGluZyBuZXcg
c2VlZCB2YWx1ZQo+ICsgICAgICAgICogdG8gX19zdGFja19jaGtfZ3VhcmQgaXMgc2FmZSBoZXJl
IGJlY2F1c2UgZnVuY3Rpb24gZG9lc24ndAo+ICsgICAgICAgICogcmV0dXJuIGFuZCBubyBjaGVj
ayBhZ2FpbnN0IHZhbHVlIG9uIGVudHJ5IHdpbGwgYmUgZG9uZS4KPiArICAgICAgICAqLwo+ICsg
ICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1pL
UikpIHsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBndWFyZF92YWwgPSAwOwo+ICsg
ICAgICAgICAgICAgICBpbnQgY2h1bmtzID0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpIC8gc2l6ZW9m
KHVpbnQxNl90KTsKPiArICAgICAgICAgICAgICAgYm9vbCByZXMgPSB0cnVlOwo+ICsKPiArICAg
ICAgICAgICAgICAgd2hpbGUgKGNodW5rcykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgc2VlZCA9IGNzcl9zd2FwKENTUl9TRUVELCAwKTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIG9wc3QgPSBzZWVkICYgU0VFRF9PUFRTX01BU0s7Cj4g
Kwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChvcHN0ID09IFNFRURfT1BUU19ERUFEKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXMgPSBmYWxzZTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IH0KPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAob3BzdCA9PSBTRUVEX09QVFNfRVMxNikg
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3VhcmRfdmFsID0gKGd1YXJkX3Zh
bCA8PCAxNikgfCAoc2VlZCAmIFNFRURfRU5UUk9QWV9NQVNLKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNodW5rcy0tOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAgICAgfQo+ICsg
ICAgICAgICAgICAgICBpZiAocmVzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fc3RhY2tf
Y2hrX2d1YXJkID0gZ3VhcmRfdmFsOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJjID0gc2Jp
X3RpbWVyX2luaXQoc2NyYXRjaCwgdHJ1ZSk7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAg
ICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsKPiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
