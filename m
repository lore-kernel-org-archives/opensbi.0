Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB36D1CDC6
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILzra4pEzl6HVXCsRQx2ozXo4Wy8HQj47f3DmdMTtTY=; b=GVd5LxlHPoa/OJ
	9ZP8gkLliDxdav2Q4YoDnsrsIzjPaecmJgN9cJMj5l7tS9fRZbFI/x9WAxhoR7i/Q//e3qKKhZvb9
	7TLfYkExZSTb/nbfS/qNVPBGmApCeE+4teVHCXxJNdGAATqg3uUXzJGRrE/Os/51ZggvpTebzxsRN
	mwQFja2FqK1TimNhQAKhy/adoUE4LmZQvaaoJfpsVZUT3ZvQEIS8Xvj2nyG/XyNTYriejJ/P+MSqp
	MEypMBwzebg/uLsegk84osDSoJ6OhrFD4oGzPO+SME9x4Y87c1FHI7heJLDlXoQC+rsuh0N+LSgi0
	+Ia5jjkUUTDZt386y6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSG97-0000000C1bq-20LY;
	Sun, 07 Dec 2025 14:53:57 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSG93-0000000C1bI-2iRY
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 14:53:55 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-656b4881f55so2127268eaf.2
        for <opensbi@lists.infradead.org>; Sun, 07 Dec 2025 06:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765119232; x=1765724032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmqiwWX4ECZGsNrbH5GkTFFv0uG60ZH1/l43HJByqRg=;
        b=b47t14lLccKVENpciqYeML2LfhZ0hhguBnDS3Hez1LAwumnjkEpZ29uE4JjtpJQJah
         9esdPEn2v3DT4NefyVwacCEvAS3qA+fjFgcVhcO542gSIxJMWywyLait5MKp9S0O5Ha/
         NfeV0yowEYQlpbpYvSyPflBIG+CWXC610fO8MgRlUHPDY+k3hXf1sXj26rLIM/dVDYG5
         5B/gEJmT1br0EXshavWIp/eotsPLOko03VZ9RVnor/arAKZkZQbMNWJ1LopyDb78Yyce
         t5iFtNJPXFvv+Yhkkgow4PtZjsNYcOd79O4J5bLqHYKk9AzGfBrBBoIB352puNj3Kvla
         w2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765119232; x=1765724032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmqiwWX4ECZGsNrbH5GkTFFv0uG60ZH1/l43HJByqRg=;
        b=lVG3oy5++UtoxXPaLYaK7MLR+X6x20VO90MoaNkFZ0697OqsdyTWCvOBaarOMZLa6x
         OS+VljJ08bvmZ+XZafos0R3BI9AReY5MNEI21ZxjSaUofy9drFcZ2oY5GSFdPFwV/CnX
         ngM6OTcTmdFtQKsCFzpCGwoP/l0Fh6as6ZR44ZcZRypaobvxD/W0WbTwh5CrqQbF2/tf
         74OOJkjQqml5oIl29Jt7eb2C7SlJFnITm+nM4kwK78IgQ9L3eN/TF8/LTtHtCLFshfup
         MZJRtYRTmBZBjV7uPuV0xmbrXOEQxAJlianwbG9RQ5GtGDOrgyicXKWOvw5tVdkCKkQ+
         at4g==
X-Forwarded-Encrypted: i=1; AJvYcCUs2FeLR+ikAtj7+NbS31KBGzI0ciMrnClKU6XNOvlJ9gyG7U1kWZUtsG1XDE1XTVAHbPCcSYb9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb5mgBtMldq0kEsiSPcg2a7kuz7IsImAClRX7Qg2mCyKouyLET
	ah3WqI30n0E0ljg1VeQ62WsPU76TIAeS/W/6Kj0sWHT1z6D/ILnAjPBx5LjpJFN/kh7NXQ7Xxus
	krGWWB3tIhCu8vLf8om6IYgtlTVVqCxrY/Gd38LwslA==
X-Gm-Gg: ASbGnctKPC79Nu5/w7ClN2jU4fJHkFwgSiBF8/S/qyvK0NrmInlvCimMUOWpYFDWjDK
	4Vq0jL2W+MUYsPjEG+PIrgKiKXi/7TIOdGtH9YcXDl2TPicNJshZClrRxkCKbTxjP4IVHhHcWPB
	j1/Rbj8HpyeH4gE28TZ//k6WqkouuUSCBOnMKKEzJt0OsGfrDst3WDBjm9M1FeX6fN35quAVd6x
	DiazfzO3DyqcbPJlL6kCO4bwgTDHgmGxjBNW48AIp/IOkmLBdQYPGq9IPjitnZOgf60yB+V
X-Google-Smtp-Source: AGHT+IHF8KoGklCN6H/L3LxHXzKo96+2kv7/vbjkC1RiPKWXnG/5+i/VPrgKwPmjnCQKqbXfk5joNc43OSF+cvWf7mE=
X-Received: by 2002:a05:6820:6af0:b0:659:9a49:9073 with SMTP id
 006d021491bc7-6599a97c4e7mr2170967eaf.62.1765119231988; Sun, 07 Dec 2025
 06:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20251201050014.8788-1-apatel@ventanamicro.com> <4d25665d-d152-47ab-8da6-c7297dd117b3@sifive.com>
In-Reply-To: <4d25665d-d152-47ab-8da6-c7297dd117b3@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Dec 2025 20:23:41 +0530
X-Gm-Features: AQt7F2rVeivZY8rVqEmnmvDCjCYhBx0W6fnzVw5PUveCHzVoVRq5FkbnUppuCdw
Message-ID: <CAAhSdy367b6XBKSWp4PoKeDi7uz3L08oncSyb9c8rk+AmLqbHw@mail.gmail.com>
Subject: Re: [PATCH v2] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_065353_939570_6F60C487 
X-CRM114-Status: GOOD (  25.90  )
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

T24gU3VuLCBEZWMgNywgMjAyNSBhdCA0OjI54oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIDIwMjUtMTEtMzAg
MTE6MDAgUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBMZWF2aW5nIG5vIGVtcHR5IHNwYWNlIGlu
IHRoZSBGRFQgcGFzc2VkIHRvIHRoZSBuZXh0IGJvb3Rpbmcgc3RhZ2UKPiA+IGNhdXNlcyB0aGUg
Zm9sbG93aW5nIFUtQm9vdCBjcmFzaCBvbiBWZW50YW5hIGludGVybmFsIHBsYXRmb3JtczoKPiA+
Cj4gPiBVbmhhbmRsZWQgZXhjZXB0aW9uOiBMb2FkIGFjY2VzcyBmYXVsdAo+ID4gRVBDOiAwMDAw
MDAwMGZmZmE2MzcyIFJBOiAwMDAwMDAwMGZmZmE3NDE4IFRWQUw6IDAwMDE3NDYxNzQ3MzAwNjgK
PiA+IEVQQzogMDAwMDAwMDA4MDI0NTM3MiBSQTogMDAwMDAwMDA4MDI0NjQxOCByZWxvYyBhZGp1
c3RlZAo+ID4KPiA+IFNQOiAgMDAwMDAwMDBmZWYzODQ0MCBHUDogIDAwMDAwMDAwZmVmNDBlNjAg
VFA6ICAwMDAwMDAwMDAwMDAwMDAwCj4gPiBUMDogIDAwMDAwMDAwZmVmNDBhNzAgVDE6ICAwMDAw
MDAwMDAwMDBmZjAwIFQyOiAgMDAwMDAwMDAwMDAwMDAwMAo+ID4gUzA6ICAwMDAwMDAwMGZmZmMx
N2E4IFMxOiAgMDAwMDAwMDBmZWYzOGQ0MCBBMDogIDczNzU3NDYxNzQ3MzAwNjgKPiA+IEExOiAg
MDAwMDAwMDBmZmZjMTdhOCBBMjogIDAwMDAwMDAwMDAwMDAwMTAgQTM6ICAwMDAwMDAwMDAwMDAw
MDEwCj4gPiBBNDogIDAwMDAwMDAwMDAwMDAwMDAgQTU6ICAwMDAwMDAwMGZmZmMxN2I4IEE2OiAg
MDAwMDAwMDAwMGZmMDAwMAo+ID4gQTc6ICAwMDAwMDAwMDAwMDBiMTAwIFMyOiAgMDAwMDAwMDAw
MDAwMDAwMCBTMzogIDAwMDAwMDAwMDAwMDAwMDEKPiA+IFM0OiAgMDAwMDAwMDBmZWYzOGQ0MCBT
NTogIDczNzU3NDYxNzQ3MzAwNjggUzY6ICAwMDAwMDAwMDAwMDAwMDAwCj4gPiBTNzogIDAwMDAw
MDAwZmVmNGVlZjAgUzg6ICAwMDAwMDAwMGZlZjRlZjkwIFM5OiAgMDAwMDAwMDAwMDAwMDAwMAo+
ID4gUzEwOiAwMDAwMDAwMDAwMDAwMDAwIFMxMTogMDAwMDAwMDBmZWY0ZWZjMCBUMzogIDAwMDAw
MDAwZmVmNDBlYTgKPiA+IFQ0OiAgMDAwMDAwMDAwMGZmMDAwMCBUNTogIDAwMDAwMDAwZmVmNDBh
NjAgVDY6ICAwMDAwMDAwMGZlZjQwYTZjCj4gPgo+ID4gVG8gYWRkcmVzcyB0aGUgYWJvdmUgaXNz
dWUsIGtlZXAgc29tZSBtaW5pbWFsIGVtcHR5IHNwYWNlIGluIHRoZQo+ID4gRkRUIGluc3RlYWQg
b2Ygbm8gZW1wdHkgc3BhY2UuCj4gPgo+ID4gRml4ZXM6IGJiZTlhMjMwNjBlOSAoInBsYXRmb3Jt
OiBnZW5lcmljOiBQYWNrIHRoZSBGRFQgYWZ0ZXIgYXBwbHlpbmcgZml4dXBzIikKPiA+IFNpZ25l
ZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4g
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gLSBBZGQgS2NvbmZpZyBvcHRpb24gZm9yIGFtb3VudCBv
ZiBlbXB0eSBzcGFjZSBpbiBGRFQgd2l0aCBkZWZhdWx0Cj4gPiAgIHZhbHVlIGFzIDRLQgo+ID4g
LS0tCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgIHwgNSArKysrKwo+ID4gIHBsYXRm
b3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDMgKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmln
IGIvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4gPiBpbmRleCAyNWI4ODg2Yi4uYjE4MDgwMTIg
MTAwNjQ0Cj4gPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcKPiA+ICsrKyBiL3BsYXRm
b3JtL2dlbmVyaWMvS2NvbmZpZwo+ID4gQEAgLTIzLDYgKzIzLDExIEBAIGNvbmZpZyBQTEFURk9S
TV9HRU5FUklDX01JTk9SX1ZFUgo+ID4gICAgICAgcmFuZ2UgMCA2NTUzNQo+ID4gICAgICAgZGVm
YXVsdCAxCj4gPgo+ID4gK2NvbmZpZyBQTEFURk9STV9HRU5FUklDX0ZEVF9FTVBUWV9TUEFDRQo+
ID4gKyAgICAgaW50ICJQbGF0Zm9ybSBGRFQgZW1wdHkgc3BhY2UgKEtCKSIKPiA+ICsgICAgIHJh
bmdlIDAgMTAyNAo+ID4gKyAgICAgZGVmYXVsdCA0Cj4KPiBTaW5jZSB0aGlzIGlzIGEgd29ya2Fy
b3VuZCBmb3IgYSBzcGVjaWZpYyBwbGF0Zm9ybSwgYW5kIHRoZSB3b3JrYXJvdW5kIHNob3VsZAo+
IGV2ZW50dWFsbHkgYmUgb2Jzb2xldGVkIGJ5IGEgVS1Cb290IGZpeCwgcGxlYXNlIGRlZmF1bHQg
dGhpcyB0byB6ZXJvLgoKQWx0aG91Z2ggdGhlIGlzc3VlIG1hbmlmZXN0cyBvbiBWZW50YW5hIGlu
dGVybmFsIHBsYXRmb3JtcywKdGhlIGlzc3VlIGlzIG5vdCBWZW50YW5hIHNwZWNpZmljIGFuZCBj
YW4gaGFwcGVuIG9uIGFueSBwbGF0Zm9ybQp3aGVyZSBVLUJvb3QgdHJpZXMgdG8gbW9kaWZ5IEZE
VCBwYXNzZWQgYnkgT3BlblNCSSB3aXRob3V0CmFkZGluZyBleHRyYSBzcGFjZS4KCj4KPiA+ICsK
PiA+ICBjb25maWcgUExBVEZPUk1fQUxMV0lOTkVSX0QxCj4gPiAgICAgICBib29sICJBbGx3aW5u
ZXIgRDEgc3VwcG9ydCIKPiA+ICAgICAgIGRlcGVuZHMgb24gRkRUX0lSUUNISVBfUExJQwo+ID4g
ZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyBiL3BsYXRmb3JtL2dlbmVy
aWMvcGxhdGZvcm0uYwo+ID4gaW5kZXggZTY2Zjk5ZmEuLmRkZmM5ZTgwIDEwMDY0NAo+ID4gLS0t
IGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gPiArKysgYi9wbGF0Zm9ybS9nZW5lcmlj
L3BsYXRmb3JtLmMKPiA+IEBAIC0yNDUsNyArMjQ1LDEwIEBAIGludCBnZW5lcmljX2ZpbmFsX2lu
aXQoYm9vbCBjb2xkX2Jvb3QpCj4gPiAgICAgICBmZHRfZml4dXBzKGZkdCk7Cj4gPiAgICAgICBm
ZHRfZG9tYWluX2ZpeHVwKGZkdCk7Cj4gPgo+ID4gKyAgICAgLyogTWluaW1pemUgdGhlIGVtcHR5
IHNwYWNlIGluIEZEVCB0byA0S0IgKi8KPgo+IFRoaXMgY29tbWVudCBpcyBubyBsb25nZXIgYWNj
dXJhdGUsIHNpbmNlIHRoZSBwYWRkaW5nIGlzIG5vdCBhIGZpeGVkIHNpemUuCgpTdXJlLCBJIHdp
bGwgdXBkYXRlLgoKPgo+ID4gICAgICAgZmR0X3BhY2soZmR0KTsKPiA+ICsgICAgIGZkdF9vcGVu
X2ludG8oZmR0LCBmZHQsIGZkdF90b3RhbHNpemUoZmR0KSArCj4gPiArICAgICAgICAgICAgICAg
ICAgIENPTkZJR19QTEFURk9STV9HRU5FUklDX0ZEVF9FTVBUWV9TUEFDRSAqIDEwMjQpOwo+Cj4g
VGhpcyBjaGFuZ2UgcmVpbnRyb2R1Y2VzIHRoZSBwcm9ibGVtIHRoYXQgbW90aXZhdGVkIGFkZGlu
ZyBmZHRfcGFjaygpLgo+IGZkdF9vcGVuX2ludG8oKSBkb2VzIG5vdCBpbml0aWFsaXplIHRoZSB1
bnVzZWQgc3BhY2UsIHNvIG9uY2UgYWdhaW4gdGhlIHJhbmdlCj4gW2ZkdCwgZmR0ICsgZmR0X3Rv
dGFsc2l6ZShmZHQpKSBjb250YWlucyB1bml0aWFsaXplZCBkYXRhLgo+Cj4gSWYgaGF2aW5nIHVu
aXRpYWxpemVkIGRhdGEgaW4gdGhlIEZEVCBibG9iIGlzIG5vdCBhIHByb2JsZW0gb24gdGhlIHBs
YXRmb3JtCj4gcmVxdWlyaW5nIHRoaXMgd29ya2Fyb3VuZCwgdGhlbiBJIHN1cHBvc2UgdGhlIGNv
ZGUgaXMgZmluZS4gT3RoZXJ3aXNlLCB0aGlzCj4gd291bGQgbmVlZCBhIG1lbXNldCgpLgoKSSB0
aGluayBpdCBpcyBiZXR0ZXIgdG8gZG8gbWVtc2V0KCkgb24gYWRkaXRpb25hbCBzcGFjZSBpbiBm
ZHRfb3Blbl9pbnRvKCkKaXRzZWxmIGJ1dCB0aGF0IHdvdWxkIGJlIGEgc2VwYXJhdGUgY2hhbmdl
IGluIGxpYmZkdC4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
