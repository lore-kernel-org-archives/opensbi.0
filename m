Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBEAC369D7
	for <opensbi@archiver.kernel.org>; Tue, 22 Apr 2025 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vj4hjMSNT3tZHbAiSz0R5KITdTBaw+ZIr0HoS/HP0Wg=; b=y+HBe4FqzCZ0Qf
	CTTxX/a26Uj/Kgp2IL9ruibLLfglI1fAGIyJlO30uUbUrd9dT1ESD4mf5G+VXYbW6bm1GzIC3JgCz
	fLlw7dvQBSvuZiTusztNv1w2PfMhfM+Whncy6PG5SfFJn2M6dTWokSD/qAWxHg+e91kAZs3DEkcUa
	xYfcuAwqMjVWC6fHPU+eJSEkykhb79i08QwUWj+oidU3R4tGUQp+4rSnacbPxH9q1FhcPMw9uqZ9m
	oq9YHhrfqL0Rw1z+cjGsBPdS3mMfYxPEjWG4+0xLnH4sxkgV8OCJysKCePpyq89DnhaLSR0Rqm9vl
	QJFEcVRu0QOCKdNptd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FFi-00000007dwh-2MuN;
	Tue, 22 Apr 2025 15:09:38 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DmK-00000007K3t-1KOV
	for opensbi@lists.infradead.org;
	Tue, 22 Apr 2025 13:35:14 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3d81ea55725so17277925ab.1
        for <opensbi@lists.infradead.org>; Tue, 22 Apr 2025 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745328911; x=1745933711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8HgzXlnenkJweCmPVJ7iMkobYAUIFcyAJDgrU2UHHo=;
        b=JuGL/H5w1aY5ynTW2Q+MHmYQ9Nv8moxA1sI4aNthXUiZoOpyJGHqzax1/t5zAgjXEH
         KYhypRf1oMqb9Vb2eHZb15mVQUukqh4vzkh/VmCG79kFHip7+He33/1rwhkw6eXzQylJ
         52ktVGcrYwyyf7RJE4kM0t2oW57cuGAnnv+Y/sKu+DzW4pxP2qRNTQOxc8rkcCFW/NHy
         0btJqfxvd32WAFoJitf0QgrJgCi1PWZmOTRUa4qQs/XS6ur21Yjn0k7WrRANIG1LmGaX
         IpdiMuD9aksZm0ap2jBw+bHWo1BN9pwfZ9lEJ3tEig3u2zEwmHlYpq4ZrrFSbhCj4n5r
         0vBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328911; x=1745933711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8HgzXlnenkJweCmPVJ7iMkobYAUIFcyAJDgrU2UHHo=;
        b=R8XxnouY7c5YL/U/R3OBtzTjDwglFSIzFhxMsz58h9TBuXrqcdjNjRzdNIh6jlOpaV
         YkEO8MiRAVpMxhnRSwm7WYYON8GZS0vsSBX/wcypbVfUy1eQtpfXjbMT90TyPLxKNeO3
         UnwBSaZfaMMiSq3W+T8oCV4XpspR+dSUEVzJpCAspBoX1w6dRBhsbv0eTjLzOuMtlAJM
         6FHDHxtCcGI8EfelN1JI8SXUhW7oN9BJ8dcCQCfoPWN8Sk0e5Dgi+7kjOxcWU0QUl3fg
         ZXy5keD1aN5DwjvpenRiaZsI1kMTG4JnbVkgaUgv9BQXF0JztbTCw2gqXM68deU6qf6t
         D/HQ==
X-Gm-Message-State: AOJu0YwJZIUQcg3NTOgUc/R2AVARlhw6z2V+X0FKJ19K/7P48UF9syJT
	sRbEUvt6vGxqIICyScoiqeUqjf5FZeyd1KxcAxr8xP2Zh9FYACCn8zjTBMD/9lIEMzPB8CbLtIU
	d8Mii/Stw2b+l+n1BFczmODISYIdaMfqS/90gdZsv0S2F/46r
X-Gm-Gg: ASbGncseyw0VEmmCjxJblU+ElqPqtilxPJwWpwQneTFQvGRji7q4bkbjBJgzRNkpaFr
	sPYj2fa1pPP2Oz0Qdw7su2DyuQJcO1Ei3F0QP1eQszjrYYJILKrK2WX4hnvNv4p0P6mcSJxAQEg
	EA6yIuXQfpAQNKOD/EKLc+Sqs=
X-Google-Smtp-Source: AGHT+IFjqjvSEBm9yOApeodEMEIwcyEMkAoPaag24So5NnFA4JTaTrMZBkTaxM0H6e5qMh2MH9kTGsoA+jm/omTfMww=
X-Received: by 2002:a05:6e02:2187:b0:3d8:2178:5c50 with SMTP id
 e9e14a558f8ab-3d88ee25f04mr135384455ab.14.1745328911171; Tue, 22 Apr 2025
 06:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com> <20250325234342.711447-4-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-4-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Apr 2025 19:05:00 +0530
X-Gm-Features: ATxdqUGEKYfhj1HxPuGi_GH-kxQL0GOm3aDYY_zFjUOu2Xj-yQbxBW6XzJLbxD8
Message-ID: <CAAhSdy1Tg0jSbipxFsOUZtvFwpZDT-zBCq2AT3YMn+VZ3GqTVA@mail.gmail.com>
Subject: Re: [PATCH 03/10] platform: generic: thead: Avoid casting away const
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_063512_363532_A2277D3A 
X-CRM114-Status: GOOD (  16.13  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNToxM+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IHN0cnVjdCBmZHRfbWF0Y2ggZXhwZWN0cyBt
YXRjaCBkYXRhIHRvIGJlIGNvbnN0LiBGb2xsb3cgdGhpcyBleHBlY3RhdGlvbgo+IHNvIHRoYXQg
bm8gdHlwZSBjYXN0aW5nIGlzIG5lZWRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xs
YW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPgo+ICBw
bGF0Zm9ybS9nZW5lcmljL3RoZWFkL3RoZWFkLWdlbmVyaWMuYyB8IDggKysrKy0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9wbGF0Zm9ybS9nZW5lcmljL3RoZWFkL3RoZWFkLWdlbmVyaWMuYyBiL3BsYXRmb3JtL2dl
bmVyaWMvdGhlYWQvdGhlYWQtZ2VuZXJpYy5jCj4gaW5kZXggZmVkYjYxNDUuLjI1OTE5ZGYxIDEw
MDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvdGhlYWQvdGhlYWQtZ2VuZXJpYy5jCj4gKysr
IGIvcGxhdGZvcm0vZ2VuZXJpYy90aGVhZC90aGVhZC1nZW5lcmljLmMKPiBAQCAtMjIsNyArMjIs
NyBAQCBzdHJ1Y3QgdGhlYWRfZ2VuZXJpY19xdWlya3Mgewo+ICBzdGF0aWMgaW50IHRoZWFkX2dl
bmVyaWNfZWFybHlfaW5pdChib29sIGNvbGRfYm9vdCwgY29uc3Qgdm9pZCAqZmR0LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1h
dGNoKQo+ICB7Cj4gLSAgICAgICBzdHJ1Y3QgdGhlYWRfZ2VuZXJpY19xdWlya3MgKnF1aXJrcyA9
ICh2b2lkICopbWF0Y2gtPmRhdGE7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgdGhlYWRfZ2VuZXJp
Y19xdWlya3MgKnF1aXJrcyA9IG1hdGNoLT5kYXRhOwo+Cj4gICAgICAgICBpZiAocXVpcmtzLT5l
cnJhdGEgJiBUSEVBRF9RVUlSS19FUlJBVEFfVExCX0ZMVVNIKQo+ICAgICAgICAgICAgICAgICB0
aGVhZF9yZWdpc3Rlcl90bGJfZmx1c2hfdHJhcF9oYW5kbGVyKCk7Cj4gQEAgLTMzLDcgKzMzLDcg
QEAgc3RhdGljIGludCB0aGVhZF9nZW5lcmljX2Vhcmx5X2luaXQoYm9vbCBjb2xkX2Jvb3QsIGNv
bnN0IHZvaWQgKmZkdCwKPiAgc3RhdGljIGludCB0aGVhZF9nZW5lcmljX2V4dGVuc2lvbnNfaW5p
dChjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfaGFydF9mZWF0dXJlcyAqaGZlYXR1cmVzKQo+
ICB7Cj4gLSAgICAgICBzdHJ1Y3QgdGhlYWRfZ2VuZXJpY19xdWlya3MgKnF1aXJrcyA9ICh2b2lk
ICopbWF0Y2gtPmRhdGE7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgdGhlYWRfZ2VuZXJpY19xdWly
a3MgKnF1aXJrcyA9IG1hdGNoLT5kYXRhOwo+Cj4gICAgICAgICBpZiAocXVpcmtzLT5lcnJhdGEg
JiBUSEVBRF9RVUlSS19FUlJBVEFfVEhFQURfUE1VKQo+ICAgICAgICAgICAgICAgICB0aGVhZF9j
OXh4X3JlZ2lzdGVyX3BtdV9kZXZpY2UoKTsKPiBAQCAtNDEsMTEgKzQxLDExIEBAIHN0YXRpYyBp
bnQgdGhlYWRfZ2VuZXJpY19leHRlbnNpb25zX2luaXQoY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAq
bWF0Y2gsCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLXN0YXRpYyBzdHJ1Y3QgdGhlYWRf
Z2VuZXJpY19xdWlya3MgdGhlYWRfdGgxNTIwX3F1aXJrcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCB0aGVhZF9nZW5lcmljX3F1aXJrcyB0aGVhZF90aDE1MjBfcXVpcmtzID0gewo+ICAgICAg
ICAgLmVycmF0YSA9IFRIRUFEX1FVSVJLX0VSUkFUQV9UTEJfRkxVU0ggfCBUSEVBRF9RVUlSS19F
UlJBVEFfVEhFQURfUE1VLAo+ICB9Owo+Cj4gLXN0YXRpYyBzdHJ1Y3QgdGhlYWRfZ2VuZXJpY19x
dWlya3MgdGhlYWRfcG11X3F1aXJrcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCB0aGVhZF9n
ZW5lcmljX3F1aXJrcyB0aGVhZF9wbXVfcXVpcmtzID0gewo+ICAgICAgICAgLmVycmF0YSA9IFRI
RUFEX1FVSVJLX0VSUkFUQV9USEVBRF9QTVUsCj4gIH07Cj4KPiAtLQo+IDIuNDcuMgo+Cj4KPiAt
LQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
