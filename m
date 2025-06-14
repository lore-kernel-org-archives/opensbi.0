Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE51CC71150
	for <opensbi@archiver.kernel.org>; Sat, 14 Jun 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRskt286gqsynxgMAAJzD5wU5vvrOhSDO5igWT2KP3o=; b=jWnErslGDyX69E
	RPBBvUL5oPS1hcDXZpxqdrutbjTd7zI/G+7j3K670N9dTXOEoZTJlLXk9uXQQzGLFwaEN3gPxnJ/K
	+KhyJWlXSlMOPW8c0Y7T9Qc9POnXLt+I+o+Pqu4wIWV5kJnOih5dw6xNkG6SlkLR6/b4Ky2wlDi61
	iGcSGJqJBQfCGdvi8I3D1AsCcXuNG935/QBrsMW4k7O7WU6jp8q/S9gs05abq7MMj8Y4EEFSPFjxG
	KNfZK9tYGDjvd5Pniq58shpp9HEcq2Lq+e/Lt+awTUjCtwGOLalt9YL2uZ6/bU+BnHJEHiCMXDbyI
	sZkb2GpNf3w7fj6P5eQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQTb2-00000001WSy-1YNH;
	Sat, 14 Jun 2025 16:19:08 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQTaz-00000001WSe-2Aq0
	for opensbi@lists.infradead.org;
	Sat, 14 Jun 2025 16:19:06 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3ddca4ce408so12711955ab.0
        for <opensbi@lists.infradead.org>; Sat, 14 Jun 2025 09:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749917944; x=1750522744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAxry/dLxqaFXBnHsSITBhvkTbQTgKWQHMe7jpfIoaI=;
        b=wK8FRQ3zjSlovreBzbS70YaffcEbDHdjeUQ08h+NAl40xhXLsKJRhTJ2Fj4lP/gSZo
         +JXIj7PFiwflpZfhnNbV05Z4DMzzkU4YHW6c8cItWtrXJQwA00sP6TdNvZGXbXWhaZKe
         67TXBV5LGWzW2RpprMajaJGxmkOg7QtcqX99vBqplVvYuCvyroXiPbGdYHGYI4ZNqwY0
         gK5Hyg07WrzStW4iGoq1PeGs8WlgqCGfo5EK0r4wFWKhXPtXJVkQOUMRyWCvxD4ciqnc
         u2aQpTrUufbJeUVZEaRzqVQmorFkrdplLy2Z5wBzOBFkQcSdWRITukScBlC0/n2ZRH9L
         4Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749917944; x=1750522744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAxry/dLxqaFXBnHsSITBhvkTbQTgKWQHMe7jpfIoaI=;
        b=OEAvZsfvOt71imFUwKaRgDjFigOoEWI7afHtImW2faQ6nl4dWphVf2Vw3jsbCP2oUh
         BqlF7qf+u8+EDvifPb+BD/8Zdjtosi7oVGtH0VINLxEkE1J/d5tflN63SOODwGnBUEmj
         Z/choOBsDIsaKWZxS6hf4bFqhAfxwRXsXmJhl2aRY5sqIx/gx2/29greybb9NGqV7LL7
         JMFGMIEsVGspsS8t6LqENghWa/0UA4ztKrE0LmCJzgSrAb0P4aECaiQISMsAl7aavDOu
         WQhZGRxeJBb7OcM7qr86Dnf9L5syRvdmneSqCff47MLYEFmCeasC7ch6y+4Yyxw9xC/1
         RWdQ==
X-Gm-Message-State: AOJu0YyxOgaIomsNTuo+bWQPSi/DB2/cGSwElBj18Y7tMHPFpvw+fhdA
	kit6SPClwHc7TMtMREaX4QRHoB90/Q2ExfqQ76aLZBwjySKWiUAZSoHhGZMXhS7Qpmr6aq8/NDG
	aAgwN46DMeldIfkpI89kadPZ9f40XlIqhyCkhmfpCCA==
X-Gm-Gg: ASbGncunhszlRYhb/vJcR24SEse+U97GEMFWg6fo0SNCGMS4HndW+Dpx7fb2R15y/H4
	o1c5/ajp7wNbP7gkPq4aW/e+KtMqX6SOt8XrAyUUCP7SO2xvaVgubrXarAVL5Mn6GjvhxRSc9+M
	ekCHU3nER5XZolujxxGZTN6x0odGO2AW3ocfz4rVdzmDQNxMCLIzDIQQhKxiORzIY8jyTOL/PeT
	KRF1A==
X-Google-Smtp-Source: AGHT+IG2GImmX+zzJ8dFvCIGqO4sMVfWcE5nBNZxV78ZQvXxeSV9+jVlUgHNjIP4uzvXGw5/ldg8npS7w/j//yH9VKQ=
X-Received: by 2002:a05:6e02:194f:b0:3dd:ebb5:5370 with SMTP id
 e9e14a558f8ab-3de07d3404bmr40542425ab.22.1749917944303; Sat, 14 Jun 2025
 09:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250522212141.3198-1-cfu@mips.com>
In-Reply-To: <20250522212141.3198-1-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Jun 2025 21:48:52 +0530
X-Gm-Features: AX0GCFv7ggESDin-u8kwXbavm_6Js6cM56nfndC4S-lK_LVv3MF0UiQJ-lk9Yi8
Message-ID: <CAAhSdy232m+pV9d2r4m3oRDKvhg2ChGOrDrX9LqPpChkx9cyLA@mail.gmail.com>
Subject: Re: [MIPS P8700 v6 0/7] Add MIPS P8700 support to generic platform
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_091905_795876_1873D47D 
X-CRM114-Status: GOOD (  17.31  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMjo1MeKAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiAtLS0KPiBDaGFuZ2VzIGluIHY2Ogo+ICAgRHJvcCB0aGUg
ZHRzIGZpbGUuCj4gICBEcm9wIHRoZSBlbnRyeSBmdW5jdGlvbi4KPiAgIEFkZCBhIG5ldyBwbGF0
Zm9ybSBwbWFfc2V0IGZ1bmN0aW9uLgo+ICAgTW92ZSBQTUEgY29kZSB0byBNSVBTIHA4NzAwLmMu
Cj4KPiBDaGFuZ2VzIGluIHY1Ogo+ICAgRHJvcCB0aGUgYW1vIGVtdWxhdGlvbiBjb2RlLgo+ICAg
Q2hhbmdlIHRvIHVzZSBtYWNyb3MgdG8gaW5zZXJ0IGluc3RydWN0aW9ucyBpbiBwODcwMC5jLgo+
ICAgQWRkIDMgbmV3IHBhdGNoZXMgdG8gcmVjb2duaXplIG1taW8gcmVnaW9ucyBhbmQgc2V0IHVw
IGNhY2hlYWJpbGl0eSBiYXNlZCBvbgo+ICAgbW1pbyByZWdpb25zLgo+Cj4gQ2hhbmdlcyBpbiB2
NDoKPiAgIFJlbW92ZSBjb2RlIHRoYXQgb3ZlcnJpZGVzIG5hc2NlbnRfaW5pdC4KPiAgIFVwZGF0
ZSBwODcwMC5jIHRvIHdvcmsgd2l0aCB0aGUgbGF0ZXN0IG92ZXJyaWRlLgo+ICAgVXNlIGNzcl9z
ZXQgZm9yIG1pcHNjb25maWc2IGluIHA4NzAwLmMuCj4gICBBZGQgcmlzY3YsY2JvbS1ibG9jay1z
aXplIHRvIHRoZSBkdHMgZmlsZS4KPgo+IENoYW5nZXMgaW4gdjM6Cj4gICBSZW1vdmUgc3R3LnMs
IHN0dy5oLCBhbmQgZXh0cmEgc2NyYXRjaCBzcGFjZS4KPiAgIFVzZSBuYXNjZW50X2luaXQgdG8g
aW5pdGlhbHplIE1JUFMgQ1NScy4KPiAgIEFkZCBhbW8gZW11bGF0aW9uIHZpYSBpbGxlZ2FsIGlu
c3RydWN0aW9uIGV4Y2VwdGlvbnMuCj4gICBDaGFuZ2UgdG8gdXNlIEFNTyBhbmQgUkRUSU1FIGls
bGVnYWwgaW5zdHJ1Y3Rpb24gZXhjZXB0aW9ucy4KPiAgIFJldmlzZSB0aGUgZHRzIGZpbGUuCj4g
ICBSZW1vdmUgY29kZSB0aGF0IGp1bXBzIHRvIG1pcHNfY3BzX2NvcmVfZW50cnkuCj4KPiBDaGFu
Z2VzIGluIHYyOgo+ICAgQnJlYWsgdXAgb25lIHBhdGNoIHRvIDExIHBhdGNoZXMuCj4KPiBDaGFu
Z2VzIGluIHYxOgo+ICAgT3JpZ2luYWwgY29kZS4KPiAtLS0KPgo+IENoYW8teWluZyBGdSAoNSk6
Cj4gICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwczogYWRkIFA4NzAwCj4gICBwbGF0Zm9ybTogZ2Vu
ZXJpYzogbWlwczogYWRkIGhlYWRlciBmaWxlcwo+ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6
IGFkZCB0aGUgcGxhdGZvcm0gZmlsZQo+ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6IGFkZCBv
YmplY3RzLm1rCj4gICBsaWI6IHNiaV9wbGF0Zm9ybTogQWRkIHRoZSBwbGF0Zm9ybSBwbWFfc2V0
IGZ1bmN0aW9uIHRvIHNldCB1cAo+ICAgICBjYWNoZWFiaWxpdHkKPgo+IFZsYWRpbWlyIEtvbmRy
YXRpZXYgKDIpOgo+ICAgZGV2aWNlcyB0byB1c2UgTU1JTyBtZW1vcnkKPiAgIENvbnZleSBNTUlP
IGZsYWcgYXMgc3BlY2lmaWVkIGJ5IFNCSV9ET01BSU5fTUVNUkVHSU9OX01NSU8KPgo+ICBpbmNs
dWRlL3NiaS9yaXNjdl9hc20uaCAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICBpbmNsdWRlL3Ni
aS9zYmlfcGxhdGZvcm0uaCAgICAgICAgICAgICAgfCAgMTkgKysKPiAgbGliL3NiaS9yaXNjdl9h
c20uYyAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKPiAgbGliL3NiaS9zYmlfaGFydC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEzICsKPiAgbGliL3V0aWxzL2ZkdC9mZHRfZml4dXAuYyAg
ICAgICAgICAgICAgIHwgICAyICstCj4gIHBsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyAgICAgICAg
ICAgICAgICB8ICAgNCArCj4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAg
ICB8ICAgMSArCj4gIHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9taXBzL2JvYXJkLmggICB8ICAz
MyArKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvbWlwcy1jbS5oIHwgIDg4ICsr
KysrKwo+ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvbWlwcy9wODcwMC5oICAgfCAxMTMgKysr
KysrKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL29iamVjdHMubWsgICAgICAgIHwgICA2ICsK
PiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMgICAgICAgICAgIHwgMzYxICsrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxMiBmaWxlcyBjaGFuZ2VkLCA2NDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9pbmNs
dWRlL21pcHMvYm9hcmQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9p
bmNsdWRlL21pcHMvbWlwcy1jbS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwbGF0Zm9ybS9nZW5l
cmljL2luY2x1ZGUvbWlwcy9wODcwMC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwbGF0Zm9ybS9n
ZW5lcmljL21pcHMvb2JqZWN0cy5tawo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2Vu
ZXJpYy9taXBzL3A4NzAwLmMKPgoKSSBoYXZlIHNxdWFzaGVkIHRoZSBmaXJzdCA0IHBhdGNoZXMg
aW50byBvbmUgcGF0Y2ggYW5kIGFwcGxpZWQKdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4gSSBo
YXZlIGFsc28gbWFkZSBzdXJlIHRoYXQgcDg3MDAKb25seSBjb21waWxlcyBmb3IgUlY2NCBiZWNh
dXNlIGl0IGRvZXMgbm90IGNvbXBpbGUgZm9yIFJWMzIuCgpUaGUgcmVtYWluaW5nIHRocmVlIHBh
dGNoZXMgbmVlZCBtb3JlIHJldmlld3MuCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
