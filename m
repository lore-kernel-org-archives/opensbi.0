Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26363CA1007
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obv7GxiL5NxhBumEuKNiVH0K8am70R8Ax+XCoiwEMoQ=; b=i8n6oTrvgrE/Q+
	IfSBUqe0zgcdqwWwzrt4phSNDF6jg4Y0yXitArLj6pjIXtjVczHDAQYl+ZFaWZf5ioNcWXdZeo3b9
	hc5+3qYp6cNDrXcfWyifuKL82j4mo0th/7S0+ELJU9azG6iHprRjhOCZqNXcWWDqM2YWNyTtTQldO
	y6yzkB/tUCS5V/Z5y19szhw0Yk7WL3Jj5vHAgmhrjfx6oVEizmcEiyWJ7OtcYPtcvlFIT9qNsPnSk
	77nqrIW4LyovSDk0OX/FwPhmCPl1VcrwZ+DrSw8fDM5Iv2vEZ/wEaRX5BH61+psUihcMYvE99jvvJ
	4hGIidklrhjt+XeDy3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthMK-00000004oM7-2QyO;
	Wed, 03 Sep 2025 06:52:44 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthJn-00000004nFm-2y0v
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 06:50:08 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55f76277413so3748646e87.3
        for <opensbi@lists.infradead.org>; Tue, 02 Sep 2025 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756882206; x=1757487006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MOwyTO47XozGp95U1ORHoMUV9tGck7UAy9hKUDAhpA=;
        b=b06i7b0mE4FBu3PfwpCd1ZOLSHEbSyeYlYcqTpInd9/FklaxlrFfpiZVIVJGMhW1wt
         EBflg5EquMVDeP7YYgr0dCx4hgV4FhNJXOTx1R6Lrk0pvz1Dl+FHwvZQQhhyLDdZkPnP
         HbOp7HGEFc+vyKZZVHDoaV367U4PY25XrupCnlUBBhWY0o66JWN+D6VaxCA3i9cBTVB9
         Kq9/aRQmU1RKqquhUIR8dxwB822voNkTV5kLfQNTvOHCdZ42udZATeVi9/xh+g9WoP7C
         EPRGwfQeVtGD25kSc8X4fI2aS7kS3jOQeBTYboDTTM3o6hV9YWKhBBDW5tL1f3bccxqP
         CPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882206; x=1757487006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MOwyTO47XozGp95U1ORHoMUV9tGck7UAy9hKUDAhpA=;
        b=qeqFoEGYEWGEwnIKKBUv3IWGuVDBSHI0FbCh5CytFkDv0uXJEK8pY2CeN28KqqVLVB
         9MwQCSJtdh1tbaUi1VKZBKurBUc3QOEtzcP7PPLi5bHWYRbJxVyIxjsaflylaxywi0sT
         xnk2SqHCXFezemA/oZjJxK/bFJJXVy+b9ohHVHU3r60Jz87+z8CqMR2yGtYogqvP2MJn
         u4DW5ryFyaOUXKmnqNlLmTC546TWRCukKOCnl7InVmlvC4kLDmX7VPRDcVI6J/oZtRHv
         47xOyiWI4v3o9scboXE2EZAHeeIsEx/kJ2NM6ttThhpFYCA0XBEyqwg3LclLVawuVdWd
         uLrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbF1G74NkhwKZufU8ldsIf/s6ZtqIMy5rb8CrkU6O4bOXFVB8+voEfrVN1rcF4+ymfdNJPKm/g@lists.infradead.org
X-Gm-Message-State: AOJu0YwgCAEPcr601tTIE/WKNeA2lb+bSBqnQwRvnSNp57NK9K6ou2yz
	7uyfr48Y6q1TUdgXyd4u9m07LlB2faIoh+7jiXSoyzQDnyGvJTdw3c/5gq/VLicAHD08bS3hx8O
	7r6GgqIgxL653NmT7J1NnabLCkfSG7bY7wOJGm9zCgA==
X-Gm-Gg: ASbGncs8Q9rjCZJVEzcEhkir+qpaZTNEQzwNyXEJTjRzuGAevBLGNjTPcJm4+eirbmc
	fFeyOVVr+HsyQIJhgpOus52rW6iVlAihNxJ2ClWGNdvzMzEd1FXmA/IGLH5IPifVunjJFWqV15h
	Skzvnqh8qGH8y5hoiDCSQDkjv5jYTqeijR3TbFumRioyPJtt1mzB0eix0D3r+muByv0g3iUTFZ1
	+ryqmLf
X-Google-Smtp-Source: AGHT+IGxyKgxk203myvOwq9tpTx8hCK10qIlNL8AIDQ5zzGOW3KunK0DfaW5mwIOTawt7RLxKfQwxM2V5HLSYqModpM=
X-Received: by 2002:a05:6512:318e:b0:55f:496e:99bd with SMTP id
 2adb3069b0e04-55f709747bemr4438253e87.52.1756882205730; Tue, 02 Sep 2025
 23:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250902121721.401933-1-apatel@ventanamicro.com>
 <20250902121721.401933-2-apatel@ventanamicro.com> <4d4d4645-4391-4fdb-a17c-76851958e642@sifive.com>
In-Reply-To: <4d4d4645-4391-4fdb-a17c-76851958e642@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 3 Sep 2025 12:19:53 +0530
X-Gm-Features: Ac12FXysFxfWStdbQUEwPLLl0ckm1duIwhMvVhVAbMWUDqf7Nk9_69__1-qD6Dg
Message-ID: <CAK9=C2U6OzUkL3yB_9+TsRCELLSqr874CPfJGvxwEwadFnCWBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: sbi: Introduce IPI device rating
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_235007_749139_CABE07E4 
X-CRM114-Status: GOOD (  24.90  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCA1OjEx4oCvQU0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIDIwMjUtMDktMDIg
NzoxNyBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEEgcGxhdGZvcm0gY2FuIGhhdmUgbXVsdGlw
bGUgSVBJIGRldmljZXMgKHN1Y2ggYXMgQUNMSU5UIE1TV0ksCj4gPiBBSUEgSU1TSUMsIGV0Yyku
IEN1cnJlbnRseSwgT3BlblNCSSByZWx5IG9uIHBsYXRmb3JtIGNhbGxpbmcKPiA+IHRoZSBzYmlf
aXBpX3NldF9kZXZpY2UoKSBmdW5jdGlvbiBpbiBjb3JyZWN0IG9yZGVyIGFuZCBwcmVmZXIKPiA+
IHRoZSBmaXJzdCBhdmFpYWJsZSBJUEkgZGV2aWNlIHdoaWNoIGlzIGZyYWdpbGUuCj4gPgo+ID4g
SW5zdGVhZCBvZiB0aGUgYWJvdmUsIGludHJvZGN1ZSBJUEkgZGV2aWNlIHJhdGluZyBhbmQgcHJl
ZmVyCj4gPiB0aGUgaGlnaGVzdCByYXRlZCBJUEkgZGV2aWNlLiBUaGlzIGZ1cnRoZXIgYWxsb3dz
IGV4dGVuZGluZwo+ID4gdGhlIHNiaV9pcGlfcmF3X2NsZWFyKCkgdG8gY2xlYXIgYWxsIGF2YWls
YWJsZSBJUEkgZGV2aWNlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0
ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvc2JpL3NiaV9pcGkuaCAg
ICAgICAgfCAgNiArKysrKy0KPiA+ICBsaWIvc2JpL3NiaV9pbml0LmMgICAgICAgICAgIHwgIDIg
Ky0KPiA+ICBsaWIvc2JpL3NiaV9pcGkuYyAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLQo+ID4gIGxpYi91dGlscy9pcGkvYWNsaW50X21zd2kuYyAgfCAgMSArCj4g
PiAgbGliL3V0aWxzL2lwaS9hbmRlc19wbGljc3cuYyB8ICAxICsKPiA+ICBsaWIvdXRpbHMvaXJx
Y2hpcC9pbXNpYy5jICAgIHwgIDEgKwo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Ni
aV9pcGkuaCBiL2luY2x1ZGUvc2JpL3NiaV9pcGkuaAo+ID4gaW5kZXggNjJkNjEzMDQuLjBhOWFl
MDNkIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2lwaS5oCj4gPiArKysgYi9pbmNs
dWRlL3NiaS9zYmlfaXBpLmgKPiA+IEBAIC0xNCw2ICsxNCw3IEBACj4gPgo+ID4gIC8qIGNsYW5n
LWZvcm1hdCBvZmYgKi8KPiA+Cj4gPiArI2RlZmluZSBTQklfSVBJX0RFVklDRV9NQVggICAgICAg
ICAgICAgICAgICAgKDQpCj4gPiAgI2RlZmluZSBTQklfSVBJX0VWRU5UX01BWCAgICAgICAgICAg
ICAgICAgICAgKDggKiBfX1NJWkVPRl9MT05HX18pCj4gPgo+ID4gIC8qIGNsYW5nLWZvcm1hdCBv
biAqLwo+ID4gQEAgLTIzLDYgKzI0LDkgQEAgc3RydWN0IHNiaV9pcGlfZGV2aWNlIHsKPiA+ICAg
ICAgIC8qKiBOYW1lIG9mIHRoZSBJUEkgZGV2aWNlICovCj4gPiAgICAgICBjaGFyIG5hbWVbMzJd
Owo+ID4KPiA+ICsgICAgIC8qKiBSYXRpbmdzIG9mIHRoZSBJUEkgZGV2aWNlIChoaWdoZXIgaXMg
YmV0dGVyKSAqLwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyByYXRpbmc7Cj4gPiArCj4gPiAgICAg
ICAvKiogU2VuZCBJUEkgdG8gYSB0YXJnZXQgSEFSVCBpbmRleCAqLwo+ID4gICAgICAgdm9pZCAo
KmlwaV9zZW5kKSh1MzIgaGFydF9pbmRleCk7Cj4gPgo+ID4gQEAgLTg3LDcgKzkxLDcgQEAgdm9p
ZCBzYmlfaXBpX3Byb2Nlc3Modm9pZCk7Cj4gPgo+ID4gIGludCBzYmlfaXBpX3Jhd19zZW5kKHUz
MiBoYXJ0aW5kZXgpOwo+ID4KPiA+IC12b2lkIHNiaV9pcGlfcmF3X2NsZWFyKHZvaWQpOwo+ID4g
K3ZvaWQgc2JpX2lwaV9yYXdfY2xlYXIoYm9vbCBhbGxfZGV2aWNlcyk7Cj4gPgo+ID4gIGNvbnN0
IHN0cnVjdCBzYmlfaXBpX2RldmljZSAqc2JpX2lwaV9nZXRfZGV2aWNlKHZvaWQpOwo+ID4KPiA+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pbml0LmMgYi9saWIvc2JpL3NiaV9pbml0LmMKPiA+
IGluZGV4IDg0YTYzNzQ4Li42NjNiNDg2YiAxMDA2NDQKPiA+IC0tLSBhL2xpYi9zYmkvc2JpX2lu
aXQuYwo+ID4gKysrIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gPiBAQCAtNTA3LDcgKzUwNyw3IEBA
IHN0YXRpYyB2b2lkIF9fbm9yZXR1cm4gaW5pdF93YXJtYm9vdChzdHJ1Y3Qgc2JpX3NjcmF0Y2gg
KnNjcmF0Y2gsIHUzMiBoYXJ0aWQpCj4gPiAgICAgICBpZiAoaHN0YXRlID09IFNCSV9IU01fU1RB
VEVfU1VTUEVOREVEKSB7Cj4gPiAgICAgICAgICAgICAgIGluaXRfd2FybV9yZXN1bWUoc2NyYXRj
aCwgaGFydGlkKTsKPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiAtICAgICAgICAgICAgIHNiaV9pcGlf
cmF3X2NsZWFyKCk7Cj4gPiArICAgICAgICAgICAgIHNiaV9pcGlfcmF3X2NsZWFyKHRydWUpOwo+
ID4gICAgICAgICAgICAgICBpbml0X3dhcm1fc3RhcnR1cChzY3JhdGNoLCBoYXJ0aWQpOwo+ID4g
ICAgICAgfQo+ID4gIH0KPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pcGkuYyBiL2xpYi9z
Ymkvc2JpX2lwaS5jCj4gPiBpbmRleCAyZGU0NTliMC4uYjU3ZWM2NTIgMTAwNjQ0Cj4gPiAtLS0g
YS9saWIvc2JpL3NiaV9pcGkuYwo+ID4gKysrIGIvbGliL3NiaS9zYmlfaXBpLmMKPiA+IEBAIC0z
Miw4ICszMiw5IEBAIF9TdGF0aWNfYXNzZXJ0KAo+ID4gICAgICAgInR5cGUgb2Ygc2JpX2lwaV9k
YXRhLmlwaV90eXBlIGhhcyBjaGFuZ2VkLCBwbGVhc2UgcmVkZWZpbmUgU0JJX0lQSV9FVkVOVF9N
QVgiCj4gPiAgICAgICApOwo+ID4KPiA+IC1zdGF0aWMgdW5zaWduZWQgbG9uZyBpcGlfZGF0YV9v
ZmY7Cj4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgaXBpX2RhdGFfb2ZmLCBpcGlfZGV2X2NvdW50
Owo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2JpX2lwaV9kZXZpY2UgKmlwaV9kZXYgPSBOVUxM
Owo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc2JpX2lwaV9kZXZpY2UgKmlwaV9kZXZfYXJyYXlb
U0JJX0lQSV9ERVZJQ0VfTUFYXTsKPgo+IFNpbmNlIHRoZSBvbmx5IHRoaW5ncyB3ZSBkbyB3aXRo
IHRoZSBhcnJheSBhcmUgYXBwZW5kIHRvIGl0IGFuZCBpdGVyYXRlIG92ZXIgaXQsCj4gY2FuIHdl
IHVzZSBhIGxpbmtlZCBsaXN0IGhlcmUgc28gdGhlcmUgaXMgbm8gYXJiaXRyYXJ5IGxpbWl0PwoK
U3VyZSwgSSB3aWxsIHVzZSBsaW5rZWQgbGlzdCBpbiB2Mi4KClJlZ2FyZHMsCkFudXAKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
