Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3ABCF6A86
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ep2sGcbBpqJPY/PinuldsmJecv2QYsTOtsY2trqTMl0=; b=O1rFe6jnZH/ZkI
	TDu6dWM2FwYKEioTIDiLZXpOnrz6y9nnW2OrNT1oNZtHGcpOi96Rr9FiB34nihK3XHPfoJHNpxnwF
	8oQvxy12EYZJv0qb8QoS1QLlcOCGz5l+2AAb8/y6L7+IVKAb6ATU1ItB2my9It98lHGHgSkj/A9YU
	iDNpFMHVBqiz3emQF10g5VXRc5lirqWUj9V/ASpSgDzEAN5/H0is6QNDreTBf3oNCGl8x4XyONSDZ
	MCr6WiAEw2se0e4FYW1aMf/qTYLsYpwsC6HF0MmbCOe0oMT2AALIl9SOsr0jnb322RMmDcTeDaZG8
	0KtKn6FcSt4iBwJTk0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlm5-0000000GM4y-3r4V;
	Thu, 08 Jan 2026 08:53:45 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlm0-0000000GM3o-1tC7
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 08:53:42 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-450b5338459so1851081b6e.2
        for <opensbi@lists.infradead.org>; Thu, 08 Jan 2026 00:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767862419; x=1768467219; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMKvzZWC7vBMR1yUm0wUGI5GfjA7SXvZEw3/A2aX3ck=;
        b=pkV6CKaFzINLnGAgCotCJ4uYHvk8fe0vGrmj79kqIvc0Lm40ZklYVqacppwZCCEQhf
         aZDrvc7Dyh3QB55CThYZm4m+fDRLfxwm17vdxM+sD2NFpuxXy5najgMQl6IgkRzQ6I4O
         mbKiW7JRRUp567SyEk1c96NRckhPCXa8KbQz0brGxoSWabKA3+9ydJYCWo3v0djsSKxj
         /MBkANxeP3kRCzDqs8w0pYAZg7xzkpmx95s5XNDVZLP19Ct/yZLRcgaGBBx7Ce+8Ea4W
         bb1P1ps56wp8argfWdZlu02HG6Gxzs78swIYFMgVmMW9pTmgSsKT7qH1AtLTybFOHsfT
         Ak8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862419; x=1768467219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMKvzZWC7vBMR1yUm0wUGI5GfjA7SXvZEw3/A2aX3ck=;
        b=hCl8Sg0D+nbUtk/Gw4DAru2+N8t4HilK/LKwjMVR6MfL7H9/QOUtt1v7Fqxb23QzJk
         TPWdRCvaKeuE5xQ7bRWXXfioxkcF8+0tIw07ASck/RYN2y9+Wjju1kcESeznFx5zcuOm
         ROrcA5HWQZ9bDzhfghiKis9ZDrHXtkm7vZIoXkZKWLo9K9GycN/W8jiitn2u09VZaicH
         7MNVebaQZ/x4uTSUNQgVm1Uciz1nyJ0LKHO/oeRuRg7S4ojAwi75hmurExAnZir4TRQB
         rz5UP0GGxiKOM7dwdUCgMWBtLXP4YA7bdnM1fddFXfLL9Ap9Oy3iXWlmKYpKPiTo/nty
         5nJQ==
X-Gm-Message-State: AOJu0YyNH1FzRVYe0LhNHksE6OZ9SiDKVnjj0K1tCo08/1CKCjq3wUkn
	YCAgb/DJGiPg++zLaIRRY164j62GEu44GB+VPpU7a9AHInZ7fAfSTanCfdQvenTBB8ywlHkUBMK
	jjlyBYaKHl2ZN+h6GoNEyNnjfPoDagSpmE7iCScumnA==
X-Gm-Gg: AY/fxX73GQEiTPmvUlEdl2pEsyQNiw5LxujHlnc4BGVJ7hBTCOpqt+2YGxhM+hpQIGH
	i/ZHJXppflBcFHJVR316lYSxCRrHYfgsILcG0nHMUhBxdloN/d4ouKp2j1cUKMaBmAfuEOEQixt
	C6PtdIfqhKulR6YecGRputS4bPxWAuUD7+woYubzdoUYBpTAEGk+3EzFodoC5o1eqV1nUReLOl0
	RbIHciMn2KB4LEhkujKhgJ6R5q6vUU+SC9hGoPtjU5vtF+2czA3YIexPELZTqpeAUSSKRwcVcpK
	AEsl9q8XZfB73bV+uaGJTK4H/KDW2ZB6sCWnds9OtTuGLMpe7L/v2AQUb+o=
X-Google-Smtp-Source: AGHT+IGrdEtX1QzJfqLxkB389Ev4TGIRT1AToecYCFcO1DuVDOh5DCCJKns8CuBxHu5UUPHEuc4zIVZQej9jC6nV5dU=
X-Received: by 2002:a05:6820:e18:b0:659:9a49:8ff6 with SMTP id
 006d021491bc7-65f54ef8e64mr1447100eaf.35.1767862418292; Thu, 08 Jan 2026
 00:53:38 -0800 (PST)
MIME-Version: 1.0
References: <bb8641e5f82654e3989537cea85f165f67a7044e.1767801896.git.michal.simek@amd.com>
In-Reply-To: <bb8641e5f82654e3989537cea85f165f67a7044e.1767801896.git.michal.simek@amd.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Jan 2026 14:23:27 +0530
X-Gm-Features: AQt7F2qXl_O-2OUNozoQFRF2LX7f5XAsKpmofsZsIEl2L4I-bMIkRaktZNRzWWk
Message-ID: <CAAhSdy0axv1VmXOkrUKA6jgaUWDdHBtupyC3Ttk-Eu09dU4NRw@mail.gmail.com>
Subject: Re: [PATCH v2] lib: sbi: Fix behavior on platform without HART protection
To: Michal Simek <michal.simek@amd.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_005340_764186_C56743D7 
X-CRM114-Status: GOOD (  18.70  )
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

T24gV2VkLCBKYW4gNywgMjAyNiBhdCA5OjM14oCvUE0gTWljaGFsIFNpbWVrIDxtaWNoYWwuc2lt
ZWtAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tbWl0IDQyMTM5YmI5YjdkYyAoImxpYjogc2Jp
OiBSZXBsYWNlIHNiaV9oYXJ0X3BtcF94eXooKSBhbmQKPiBzYmlfaGFydF9tYXAvdW5tYXBfYWRk
cigpIikgY2hhbmdlZCBsb2dpYyBieSBjYWxsaW5nCj4gc2JpX2hhcnRfcHJvdGVjdGlvbl9jb25m
aWd1cmUoKS4gQnV0IHdoZW4gcHJvdGVjdGlvbiBkb2Vzbid0IGV4aXN0IHRoZQo+IGZ1bmN0aW9u
IGlzIHJldHVybmluZyBTQklfRUlOVkFMLgo+IEJ1dCBvbiBzeXN0ZW1zIHdpdGhvdXQgcHJvdGVj
dGlvbiB0aGlzIGlzIGNvcnJlY3QgY29uZmlndXJhdGlvbiB0aGF0J3Mgd2h5Cj4gZG8gbm90IGhh
bmcgd2hlbiBzeXN0ZW0gZG9uJ3QgaGF2ZSBhbnkgSEFSVCBwcm90ZWN0aW9uLgo+Cj4gRml4ZXM6
IDQyMTM5YmI5YjdkYyAoImxpYjogc2JpOiBSZXBsYWNlIHNiaV9oYXJ0X3BtcF94eXooKSBhbmQg
c2JpX2hhcnRfbWFwL3VubWFwX2FkZHIoKSIpCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFNpbWVr
IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KCkkgZGlkIG1pbm9yIGJlYXV0aWZpY2F0aW9uIGF0IHRo
ZSB0aW1lIG9mIG1lcmdpbmcuCgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5z
YmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBBbHNv
IHVwZGF0ZQo+ICAgc2JpX2hhcnRfcHJvdGVjdGlvbl9tYXBfcmFuZ2UoKS9zYmlfaGFydF9wcm90
ZWN0aW9uX3VubWFwX3JhbmdlKCkKPgo+ICBsaWIvc2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uYyB8
IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmMgYi9saWIv
c2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uYwo+IGluZGV4IDMwNmY1YWZiZGFlYS4uZTEwYzg1NjQ2
MGE0IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5jCj4gKysrIGIv
bGliL3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmMKPiBAQCAtNTQsNyArNTQsNyBAQCBpbnQgc2Jp
X2hhcnRfcHJvdGVjdGlvbl9jb25maWd1cmUoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+
ICAgICAgICAgc3RydWN0IHNiaV9oYXJ0X3Byb3RlY3Rpb24gKmhwcm90ID0gc2JpX2hhcnRfcHJv
dGVjdGlvbl9iZXN0KCk7Cj4KPiAgICAgICAgIGlmICghaHByb3QpCj4gLSAgICAgICAgICAgICAg
IHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAg
IGlmICghaHByb3QtPmNvbmZpZ3VyZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9T
WVM7Cj4KPiBAQCAtNzYsNyArNzYsNyBAQCBpbnQgc2JpX2hhcnRfcHJvdGVjdGlvbl9tYXBfcmFu
Z2UodW5zaWduZWQgbG9uZyBiYXNlLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gICAgICAgICBzdHJ1
Y3Qgc2JpX2hhcnRfcHJvdGVjdGlvbiAqaHByb3QgPSBzYmlfaGFydF9wcm90ZWN0aW9uX2Jlc3Qo
KTsKPgo+ICAgICAgICAgaWYgKCFocHJvdCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9F
SU5WQUw7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgaWYgKCFocHJvdC0+
bWFwX3JhbmdlKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IEBAIC04OCw3ICs4OCw3
IEBAIGludCBzYmlfaGFydF9wcm90ZWN0aW9uX3VubWFwX3JhbmdlKHVuc2lnbmVkIGxvbmcgYmFz
ZSwgdW5zaWduZWQgbG9uZyBzaXplKQo+ICAgICAgICAgc3RydWN0IHNiaV9oYXJ0X3Byb3RlY3Rp
b24gKmhwcm90ID0gc2JpX2hhcnRfcHJvdGVjdGlvbl9iZXN0KCk7Cj4KPiAgICAgICAgIGlmICgh
aHByb3QpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPiAgICAgICAgIGlmICghaHByb3QtPnVubWFwX3JhbmdlKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPgo+IC0tCj4gMi40My4wCj4KPiBiYXNlLWNvbW1pdDogZTdm
YTY2YzIxNjBlYzEzOWRlMTg1M2EwMGY2NjljMDkzMjBhOTI1Ngo+IGJyYW5jaDogdHJhY2sKPgo+
IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
