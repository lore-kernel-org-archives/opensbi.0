Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F96C3ABDA
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH9+0AQ3xL0j9yh/r77amIZu0lqipNFLUyAXgwFih4M=; b=CFzaum2Wwo+FVP
	EkdyK/bg8K9T6rYM6IS3JAYaTZFPw0RAQiXC/ZkvQF8kMCUcLJeH70ogDwbJ9Qgv3ub3Xu5IPCZ7Z
	9kJti05ty0ZuKNJjXUm0MSSyGzBr5e8sMlsFIvDFvXRuxeSDN9X5RmLe+GS1/W/6nu4c89E0xq+zF
	iuslXelVeSNlJ7l9XyCFNJCsEmr0HX5MjUD7XAewpEA14BPRTBjL4430i1dIdCkmV9Nn5RZV3qk83
	ZHd1alf9gdPf9XeGKTONWEPc8IEkEOZDD3iGzoYocvlQq3NFQSLAkY11bxKb1LVzXAqhNI3eEeZzm
	Mr8wX0xLMOhpP+rX8ikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGR3-0000000BhDR-3bN6;
	Tue, 20 May 2025 06:26:45 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHGR0-0000000BhCy-438C
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 06:26:44 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so17357255ab.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 23:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747722402; x=1748327202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4j5Jws3uxl5nEU8hYy1HLnO3rtqzNQ5KswLtDe3lu4I=;
        b=YMhlsAVlpFyFP9N16yApANMv+MPMWB0T8dkVmuDhklxAlzCJ/6j/iLNiCxnK9v9xn4
         9HPzvrO9OdgBsgoKzYijtlBDb8AiJeByQag61lds+pfi9icQbZcYWD8JNfTz2o8Iwfsu
         BB5XBISKo07r+9mSXi/JRfU/7GQnp7AuNxuDcTuMEDNo1/WGoX5cw+iWOksgu9SVUx7P
         kVd3+5bLmWqucKiVFkbfhZObyvj4+q2BO460TzS+HpgX++ZVakb2nJJ1XeuhMCMLto/J
         FxmqYaKLypv/PD76NImk+o8i823viWU6YhSD+LZDem7dqUKbjG/chaHm05pwQj5Hty1Z
         TEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747722402; x=1748327202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4j5Jws3uxl5nEU8hYy1HLnO3rtqzNQ5KswLtDe3lu4I=;
        b=pFTgryV3G0A0MGnp7uUodUpyEKqlrxqTZF3JjGqb73JAA3B5njz8tL0AXvP/oomzch
         vCFS1FVY8GuuQH0lB+SDveqBHSJHIoXep+HE2u+JCoEHNQiDzs+aJhV2PLt+K9tS/HKo
         3xujMIyAr2ReXvvtjXtOxHuuZnNLMNO7WwabTGRdATyQOj9QXRWTeMRPiMWNCaFbfeNp
         TwduKwwDMY6ztWv2OuhQzhKZ3YVaZpdpttw+t88yWdqUgZsG2dfeOFguDWmYMnFy7i3j
         fl98+/g9bG4DfgCmDXVe6vHo1QStXDaTli3/mhmhvsc4FjnXJRoc7ddRjfqOhJBea6oV
         aCQw==
X-Gm-Message-State: AOJu0Yw3cdJkHgaOdMmTOXLVWvgCwCz5JazmcJ7F4CASzLz6K9vIuyt5
	7hkQ22m/L42QW87IGbvLonTULXPSlfoxQF5IWysedHKeQdouO7IayPiMZUQZqz0fzFdkfWtwQtC
	FEBLtI135c1CmTEPeljzxK7mGouLJjDZjL1EsOuGJ5/WqrY+80wts
X-Gm-Gg: ASbGnctzDEj8+hpGwkOMUHBO/4HqJ1yPs6RAQdFps0LOgyuryGTH+CVrRmxCV8+boEI
	wilTbCh8hS3HgjgoNj0uC+59dypvp17/NMV8saGLt9CHiJSuKZF0OZU5DAUYXf/TLrRtNDJ8Bmp
	FsbHTVVZ/VuEvX1lCgU3I5D9XxwK6v0vsptA==
X-Google-Smtp-Source: AGHT+IHiiGHVz+h1LF7YB61P+NyW8sinyzG0pgzyS4/FFucvqstPtGHzDyz9q8J1bXOC0IXlXG8E7E0fUpO+rXnf2SY=
X-Received: by 2002:a05:6e02:3e06:b0:3d8:2023:d048 with SMTP id
 e9e14a558f8ab-3db84377bbdmr160551405ab.22.1747722401979; Mon, 19 May 2025
 23:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250430091007.3768180-1-alvinga@andestech.com>
In-Reply-To: <20250430091007.3768180-1-alvinga@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 11:56:30 +0530
X-Gm-Features: AX0GCFv2IXUP2F1s454V8aNuvNKLVZZkZXk0OebiF8PtRTbZHXxjA3xcIAEleok
Message-ID: <CAAhSdy2EuXwHPZmzg_akb_V4cHsUw6_bsaf5mH+fZh8S9O5N=A@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: Fix fdt_mpxy_init() not returning error code
To: Alvin Chang <alvinga@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_232643_272983_BD4C34CF 
X-CRM114-Status: GOOD (  21.37  )
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

T24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgMjo0MOKAr1BNIEFsdmluIENoYW5nIDxhbHZpbmdhQGFu
ZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gSXQgc2VlbXMgdGhhdCBjdXJyZW50IGltcGxlbWVudGF0
aW9uIGRvZXNuJ3QgZmFpbCBvbiBmZHRfbXB4eV9pbml0KCksCj4gYmVjYXVzZSBwbGF0Zm9ybXMg
bWlnaHQgbm90IGhhdmUgYW55IE1QWFkgZGV2aWNlcy4gSW4gZmFjdCwgaWYgdGhlcmUgYXJlCj4g
bm8gTVBYWSBkZXZpY2VzLCBmZHRfZHJpdmVyX2luaXRfYWxsKCkgd2lsbCByZXR1cm4gU0JJX09L
Lgo+Cj4gTW9yZSBpbXBvcnRhbnRseSwgaWYgdGhlcmUgaXMgYW55IE1QWFkgZGV2aWNlIHdoaWNo
IGZhaWxzIHRoZQo+IGluaXRpYWxpemF0aW9uLCBPcGVuU0JJIG11c3QgY2hlY2sgdGhlIGVycm9y
IGNvZGUgYW5kIHN0b3AgdGhlIGJvb3RpbmcuCj4gVGh1cywgdGhpcyBjb21taXQgYWRkcyB0aGUg
cmV0dXJuIHZhbHVlIGZvciBmZHRfbXB4eV9pbml0KCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbHZp
biBDaGFuZyA8YWx2aW5nYUBhbmRlc3RlY2guY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSBy
aXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0
aWxzL21weHkvZmR0X21weHkuaCB8IDQgKystLQo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eS5j
ICAgICAgICAgfCA4ICsrLS0tLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyAgICAg
ICB8IDMgKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5Lmgg
Yi9pbmNsdWRlL3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5LmgKPiBpbmRleCAyYmE5ZDI4Li41N2Uw
YjI0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHkuaAo+ICsr
KyBiL2luY2x1ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHkuaAo+IEBAIC0xNSwxMSArMTUsMTEg
QEAKPgo+ICAjaWZkZWYgQ09ORklHX0ZEVF9NUFhZCj4KPiAtdm9pZCBmZHRfbXB4eV9pbml0KGNv
bnN0IHZvaWQgKmZkdCk7Cj4gK2ludCBmZHRfbXB4eV9pbml0KGNvbnN0IHZvaWQgKmZkdCk7Cj4K
PiAgI2Vsc2UKPgo+IC1zdGF0aWMgaW5saW5lIHZvaWQgZmR0X21weHlfaW5pdChjb25zdCB2b2lk
ICpmZHQpIHsgfQo+ICtzdGF0aWMgaW5saW5lIGludCBmZHRfbXB4eV9pbml0KGNvbnN0IHZvaWQg
KmZkdCkgeyByZXR1cm4gMDsgfQo+Cj4gICNlbmRpZgo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGls
cy9tcHh5L2ZkdF9tcHh5LmMgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eS5jCj4gaW5kZXggNjk4
NGVjNy4uZTZlMjYxNCAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eS5jCj4g
KysrIGIvbGliL3V0aWxzL21weHkvZmR0X21weHkuYwo+IEBAIC0xMiwxMSArMTIsNyBAQAo+ICAv
KiBMaXN0IG9mIEZEVCBNUFhZIGRyaXZlcnMgZ2VuZXJhdGVkIGF0IGNvbXBpbGUgdGltZSAqLwo+
ICBleHRlcm4gY29uc3Qgc3RydWN0IGZkdF9kcml2ZXIgKmNvbnN0IGZkdF9tcHh5X2RyaXZlcnNb
XTsKPgo+IC12b2lkIGZkdF9tcHh5X2luaXQoY29uc3Qgdm9pZCAqZmR0KQo+ICtpbnQgZmR0X21w
eHlfaW5pdChjb25zdCB2b2lkICpmZHQpCj4gIHsKPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBQ
bGF0Zm9ybXMgbWlnaHQgaGF2ZSBtdWx0aXBsZSBNUFhZIGRldmljZXMgb3IgbWlnaHQgbm90Cj4g
LSAgICAgICAgKiBoYXZlIGFueSBNUFhZIGRldmljZXMgc28gZG9uJ3QgZmFpbC4KPiAtICAgICAg
ICAqLwo+IC0gICAgICAgZmR0X2RyaXZlcl9pbml0X2FsbChmZHQsIGZkdF9tcHh5X2RyaXZlcnMp
Owo+ICsgICAgICAgcmV0dXJuIGZkdF9kcml2ZXJfaW5pdF9hbGwoZmR0LCBmZHRfbXB4eV9kcml2
ZXJzKTsKPiAgfQo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9w
bGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiBpbmRleCAyZTg1NjY0Li40N2U3NzFhIDEwMDY0
NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ICsrKyBiL3BsYXRmb3JtL2dl
bmVyaWMvcGxhdGZvcm0uYwo+IEBAIC0zMjQsOCArMzI0LDcgQEAgaW50IGdlbmVyaWNfbXB4eV9p
bml0KHZvaWQpCj4gIHsKPiAgICAgICAgIGNvbnN0IHZvaWQgKmZkdCA9IGZkdF9nZXRfYWRkcmVz
cygpOwo+Cj4gLSAgICAgICBmZHRfbXB4eV9pbml0KGZkdCk7Cj4gLSAgICAgICByZXR1cm4gMDsK
PiArICAgICAgIHJldHVybiBmZHRfbXB4eV9pbml0KGZkdCk7Cj4gIH0KPgo+ICBzdHJ1Y3Qgc2Jp
X3BsYXRmb3JtX29wZXJhdGlvbnMgZ2VuZXJpY19wbGF0Zm9ybV9vcHMgPSB7Cj4gLS0KPiAyLjQz
LjAKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
