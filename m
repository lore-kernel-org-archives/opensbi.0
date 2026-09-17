Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E973C982D0
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12VYqfhDETPKwqhnPvr80KAWmhu7ZcO6ozdO6fSKm9A=; b=QyBXu32MbCeTAr
	ZAaEzE7jO/ZC8fFkUvkXKaToPBkObvk6TkFrfiDYRyQqvISTQqQZqu3OkUyBFTS9a8YSkYnNvPZs4
	XTpGciD86VywAn1DMKjdhaM5eQcDD/Jq+4DVDHVbp5Cs8IE9Dj8Tq8ASGf8whLx6o67mogcNMB6M0
	tB4vKU5uXHgUpKsxRCT9AojUkw/J/K3BbUOO1bYdb++hyAsZTJf5d5JrRgTbQ6PVaJ5rndcHa7/Es
	5ijvsVFFEubrid4d+8gl00MJICq80EqOxJ1djk1YNh6mVgStMY27YlW3WO/x2QZw+rZW45/MxIATA
	P8ILvZCIyF0v6V4ozU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77z0-0000000AwRN-2xqA;
	Thu, 17 Sep 2026 09:00:42 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77yx-0000000AwQS-41fD
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 09:00:41 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso1088018a12.1
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 02:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789635638; cv=none;
        d=google.com; s=arc-20260327;
        b=oTJUihRu3vJuHGFGiBRXkg1dSA1FR2t3k5nXuFFonbVGvl4Q4JsY8g5h5uAzUqDq+Y
         tICbnJWRxmFZrjfUxqo6dl4lZ8uSKO514Lb0smN3iWIF12csMFAFGDGaGhGzhj5DGkjb
         Yh0djHSXYSSmFDcEyfEU/pty4zKM6UsXRDjgXatEUoik732QZtWOMP7ThVG7gosbYqgk
         LRBLX+fakbZK/ehyZv6UnSARtXkCx1TqXPZ+rRgGZafKD/axqUUCrkKEVaCGunSsrkci
         3IHTeZB+C24rBFQHb2zCYUY28o3OzPp3t0YlIrkpJFb8PDIaVIrnzzKvQJhP8PTbhdBr
         C0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WntgkEwOybrOaqylki0hCA5gZgvRvwzlE76HEIZypyw=;
        fh=84iVe/PSOJxldWpQ6pMR7IhUk9iJTQ25iYxQQpMMt2s=;
        b=C1Lz1D0JtD8lsPpeTsJgu99WVKxIdmMvxO+XxAyssWIKXxhNCyN/poGsfQkNg9b/hH
         //R3bE+TdW8Fj8pu/ordthS+wnjYBVf+4hjJuEoMubgKSC42L47kgaOn/LBcgV8Ow6Q7
         VeJ65Fzy/edazfQA7uA6BC809dUcC3KKkSUYV9Oxbp09CFzo7Sg7wmDiC0A98Qfwz3sk
         wsah0TR51XMHlkIVXkqmMUwjuv0a0bNYoIqy2AZhYx1kAiMRztgTUTznn4zbE4SY6pN0
         cyYugD6JeLoZi44RN+WoVOjy3I64mSWotxJPPZTNDl+i3qDSLuiFp/X1Szz1/Zd3dNZ2
         ot6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789635638; x=1790240438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WntgkEwOybrOaqylki0hCA5gZgvRvwzlE76HEIZypyw=;
        b=EMqgYhpb2a4joJSYObL/NNcHdWtFtKZE1Zr9Gq2VSDDQt9w72H2IYuf3bWbv5VuQBi
         C0Vw1sdaopTxBNFeIOzlE2ZXAO9IabdaFmBHQvE9v/ogJTddxXu67KxHp4XKGJaHJDQd
         SB6gud2+bKSn/+6FLW7tE5du0M3REljmA5GsKUeH+RU7Ks2RRo2gi90ZWB73gxFDvUPU
         rMl6SI24eNhLWZsRoaYfueszAcEJJwJcZJT5S27sJhQUkEfi6dJY+fq7Dvz+F/KKQrPo
         b9yFrOW7D0XYTnwZ97ukewcD7XWAl+MdbpZe8RHMI52659mmsp6owITGYe4fS7tikKAi
         K0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635638; x=1790240438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WntgkEwOybrOaqylki0hCA5gZgvRvwzlE76HEIZypyw=;
        b=LRWAYlYAWZ+khEtJuuImmVMyj0jMZ+RR+zPaW4NTfzcv3jnRcCYDdMcSOfUo1spx+C
         NUFAit98GCe7AioFUByd/flh+hlg9uZktAyDid0BYHN5+1NYyY2iH3l0HfQxCD4DBYcc
         1rTBLAAxb7AGNxroJYD2/oPp0LuBJ73Zw9WNUsgeC0hf/92UvxhokHcYknRkwykbD8pk
         qS+d2//L69ez1yUEhgLG0aR4kaKsrEA72A/8ocC2ju5w2eVufhbXmNp85QZtwHY17Zq+
         VUUmfQMLK/9DNq5S/gAGRGbCKuYD1AK4yZUpmop6H/SCoQZCIv2kfLsaInvYGWQa5b2H
         FFgA==
X-Gm-Message-State: AFuF++mdj335JwPJF6E4b06pQ+23iQ7kd2n+4+8/+lMLgZ49H+k+Ruc/
	gpL2QKUr84b23Ah9Gps7neDFfMWVTSjS4oUdwAFxbPvHDluRRTAPDB2zIB+qIgZAWBzSKR/W+Lz
	q84cNSpOimU/28UHoOtd9MiHrle6ayhfTDiPn7Z+r2TyInM7Rx2orNbsWgA==
X-Gm-Gg: AYBFou2x52YcWjAO9SXG7Jz//m9o8yn1xv8FI0hNyWu1l+QhQdMACOxrKNWfl8Md+Sf
	WhO/UUpPOhSeBbF4qrsulPrP5wmK1CByLZY91F56RllY9wyLtqL5V8lfUliwB4dhS2R6j//lici
	UlLmYVFGql+ycV1D1P3qLQ7YXN/vZcOvJbzM/XWS1qL4CRTwHC9DHlXaOn0JLzuj9fPVjj+UvL3
	XGCzWagAIZu4hOT1mUEcV+UyG0aZy85m4CzV2ESoMUmMttMdE/uH460fQEh4ZPgfRPv1hUiwu8/
	m63WWbOYWSNEebUPtwAcPmR258ZMDfyGoNQlB71FN3pxze/wslUJM2d8/Q==
X-Received: by 2002:a05:6402:c2d2:b0:6aa:47ed:3e84 with SMTP id
 4fb4d7f45d1cf-6aa47ed40fdmr131068a12.30.1789635637798; Thu, 17 Sep 2026
 02:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260901022211.2619560-1-zong.li@sifive.com> <20260901022211.2619560-2-zong.li@sifive.com>
 <CAAhSdy2c-Cy4TZeL5J8fzQN_BCf5-M9UG_6HSuVum1D5hYNUdg@mail.gmail.com>
 <CANXhq0qOKJKmk137N3xRke=ngrxc+5F+aZFoT3gWHGVC6MDbPw@mail.gmail.com> <CAAhSdy1RzUtBuLpUVZ48d1VNCd0vmy628N4O2b4s6tg1CmMj1Q@mail.gmail.com>
In-Reply-To: <CAAhSdy1RzUtBuLpUVZ48d1VNCd0vmy628N4O2b4s6tg1CmMj1Q@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 17 Sep 2026 17:00:26 +0800
X-Gm-Features: AcwNN1X5Wbw3TS9Ob8iqAiDO7m0HpGcLq2rIab19aAuBMqXGY66FG4n7JtMwfdY
Message-ID: <CANXhq0poriteZb4GyAOX4dGM5pygJCr0GzWBuXbeeLrOBb2G2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: fw_base.S: add a formatted OpenSBI firmware header
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_020040_052700_951A1FB0 
X-CRM114-Status: GOOD (  46.24  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgNDozNOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMTowM+KAr1BNIFpv
bmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBTZXAgMTYs
IDIwMjYgYXQgMTowOeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBUdWUsIFNlcCAxLCAyMDI2IGF0IDc6NTLigK9BTSBab25nIExpIDx6
b25nLmxpQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gQWRkIGEgZml4ZWQgMTI4
LWJ5dGUgaGVhZGVyIGF0IHRoZSB2ZXJ5IGJlZ2lubmluZyBvZiBldmVyeSBPcGVuU0JJCj4gPiA+
ID4gZmlybXdhcmUgaW1hZ2UsIHJlZ2FyZGxlc3Mgb2YgdGhlIGZpcm13YXJlIHR5cGUuIFRoZSBo
ZWFkZXIgbGV0cyB0aGUKPiA+ID4gPiBwcmV2aW91cyBib290aW5nIHN0YWdlIGlkZW50aWZ5IGFu
IE9wZW5TQkkgaW1hZ2UgYW5kLCBtb3JlIGltcG9ydGFudGx5LAo+ID4gPiA+IGdpdmVzIGl0IGEg
d2VsbC1rbm93biBwbGFjZSBpbnNpZGUgdGhlIGltYWdlIHRvIGhhbmQgb3ZlciBpbmZvcm1hdGlv
bgo+ID4gPiA+IHRvIE9wZW5TQkkgYnkgcGF0Y2hpbmcgYSBmZXcgd29yZHMgaW5zdGVhZCBvZiBz
ZXR0aW5nIHVwIHJlZ2lzdGVycy4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgZmlyc3QgcGF0Y2ggb25s
eSBpbnRyb2R1Y2VzIHRoZSBsYXlvdXQ6Cj4gPiA+ID4KPiA+ID4gPiAgIC0gYSA0LWJ5dGUganVt
cCBvdmVyIHRoZSBoZWFkZXIgdG8gX3N0YXJ0X3JlYWwsIHNvIHRoYXQgX3N0YXJ0IHN0YXlzCj4g
PiA+ID4gICAgIHRoZSBlbnRyeSBwb2ludCBvZiB0aGUgaW1hZ2UuIFRoZSBqdW1wIGlzIGFzc2Vt
YmxlZCB3aXRoCj4gPiA+ID4gICAgICcub3B0aW9uIG5vcnZjJyBzbyB0aGF0IHRoZSBmaWVsZHMg
YmVoaW5kIGl0IGFyZSBhbHdheXMgYXQgYSBmaXhlZAo+ID4gPiA+ICAgICBvZmZzZXQsIGV2ZW4g
Zm9yIGEgYnVpbGQgd2l0aCBjb21wcmVzc2VkIGluc3RydWN0aW9ucyBlbmFibGVkLAo+ID4gPiA+
Cj4gPiA+ID4gICAtIHRoZSAnT1NCSScgbWFnaWMsIGEgaGVhZGVyIHZlcnNpb24sIHRoZSBYTEVO
IHRoZSBmaXJtd2FyZSB3YXMgYnVpbHQKPiA+ID4gPiAgICAgZm9yIGFuZCB0aGUgc2l6ZSBvZiB0
aGUgZmlybXdhcmUgaW1hZ2UsIHNvIHRoYXQgdGhlIHByZXZpb3VzIGJvb3RpbmcKPiA+ID4gPiAg
ICAgc3RhZ2UgY2FuIHZhbGlkYXRlIHRoZSBpbWFnZSBhbmQgZmlndXJlIG91dCBob3cgbXVjaCBt
ZW1vcnkgaXQKPiA+ID4gPiAgICAgb2NjdXBpZXMsCj4gPiA+ID4KPiA+ID4gPiAgIC0gYSBmbGFn
cyB3b3JkIGFuZCB0aHJlZSA4LWJ5dGUgb3ZlcnJpZGUgdmFsdWVzLCB3aGljaCBhcmUgdW51c2Vk
Cj4gPiA+ID4gICAgIChhbmQgemVybykgZm9yIG5vdyBhbmQgYXJlIHdpcmVkIHVwIGJ5IHRoZSBu
ZXh0IHBhdGNoLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGxheW91dCBpcyBkZWxpYmVyYXRlbHkgaWRl
bnRpY2FsIGZvciBSVjMyIGFuZCBSVjY0IHNvIHRoYXQgdGhlCj4gPiA+ID4gcHJldmlvdXMgYm9v
dGluZyBzdGFnZSBjYW4gcGFyc2UgdGhlIGhlYWRlciB3aXRob3V0IGtub3dpbmcgdGhlIFhMRU4g
b2YKPiA+ID4gPiB0aGUgZmlybXdhcmUgdXBmcm9udC4gRWFjaCBvdmVycmlkZSB2YWx1ZSBpcyBm
b2xsb3dlZCBieSBhIHJlc2VydmVkCj4gPiA+ID4gOC1ieXRlIHNsb3Qgc28gdGhhdCB0aGUgc2Ft
ZSBsYXlvdXQgY2FuIGJlIGV4dGVuZGVkIHRvIFJWMTI4IGxhdGVyLgo+ID4gPiA+Cj4gPiA+ID4g
U3VnZ2VzdGVkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+ID4gPiAtLS0KPiA+
ID4gPiAgZmlybXdhcmUvZndfYmFzZS5TIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9u
cygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2UuUyBiL2Zp
cm13YXJlL2Z3X2Jhc2UuUwo+ID4gPiA+IGluZGV4IDBjNWM2NWMxLi5kZDJhZGI4YSAxMDA2NDQK
PiA+ID4gPiAtLS0gYS9maXJtd2FyZS9md19iYXNlLlMKPiA+ID4gPiArKysgYi9maXJtd2FyZS9m
d19iYXNlLlMKPiA+ID4gPiBAQCAtMTcsNiArMTcsMTUgQEAKPiA+ID4gPiAgI2RlZmluZSBCT09U
X0xPVFRFUllfQUNRVUlSRUQgICAgICAgICAgMQo+ID4gPiA+ICAjZGVmaW5lIEJPT1RfU1RBVFVT
X0JPT1RfSEFSVF9ET05FICAgICAxCj4gPiA+ID4KPiA+ID4gPiArLyogT3BlblNCSSBmaXJtd2Fy
ZSBoZWFkZXIgKi8KPiA+ID4gPiArI2RlZmluZSBGV19IRUFERVJfTUFHSUNfVkFMVUUgICAgICAg
ICAgMHg0OTQyNTM0ZiAvKiBBU0NJSSBzdHJpbmcgIk9TQkkiICovCj4gPiA+ID4gKyNkZWZpbmUg
RldfSEVBREVSX1ZFUlNJT04gICAgICAgICAgICAgIDB4MQo+ID4gPiA+ICsjZGVmaW5lIEZXX0hF
QURFUl9TSVpFICAgICAgICAgICAgICAgICAxMjgKPiA+ID4gPiArI2RlZmluZSBGV19IRUFERVJf
UkVTRVJWRURfT0ZGU0VUICAgICAgMHg0OAo+ID4gPiA+ICsjZGVmaW5lIEZXX0hFQURFUl9GTEFH
U19PVkVSUklERV9BMCAgICAoMSA8PCAwKQo+ID4gPiA+ICsjZGVmaW5lIEZXX0hFQURFUl9GTEFH
U19PVkVSUklERV9BMSAgICAoMSA8PCAxKQo+ID4gPiA+ICsjZGVmaW5lIEZXX0hFQURFUl9GTEFH
U19PVkVSUklERV9BMiAgICAoMSA8PCAyKQo+ID4gPiA+ICsKPiA+ID4gPiAgLm1hY3JvIE1PVl8z
UiBfX2QwLCBfX3MwLCBfX2QxLCBfX3MxLCBfX2QyLCBfX3MyCj4gPiA+ID4gICAgICAgICBhZGQg
ICAgIFxfX2QwLCBcX19zMCwgemVybwo+ID4gPiA+ICAgICAgICAgYWRkICAgICBcX19kMSwgXF9f
czEsIHplcm8KPiA+ID4gPiBAQCAtNDQsOCArNTMsNjcgQEAKPiA+ID4gPiAgICAgICAgIC5zZWN0
aW9uIC5lbnRyeSwgImF4IiwgJXByb2diaXRzCj4gPiA+ID4gICAgICAgICAuYWxpZ24gMwo+ID4g
PiA+ICAgICAgICAgLmdsb2JsIF9zdGFydAo+ID4gPiA+ICsgICAgICAgLmdsb2JsIF9zdGFydF9y
ZWFsCj4gPiA+ID4gICAgICAgICAuZ2xvYmwgX3N0YXJ0X3dhcm0KPiA+ID4gPiAgX3N0YXJ0Ogo+
ID4gPiA+ICsgICAgICAgLyoKPiA+ID4gPiArICAgICAgICAqIE9wZW5TQkkgZmlybXdhcmUgaGVh
ZGVyCj4gPiA+ID4gKyAgICAgICAgKgo+ID4gPiA+ICsgICAgICAgICogRXZlcnkgT3BlblNCSSBm
aXJtd2FyZSBpbWFnZSBzdGFydHMgd2l0aCB0aGlzIGZpeGVkIDEyOC1ieXRlCj4gPiA+ID4gKyAg
ICAgICAgKiBoZWFkZXIuIFRoZSBsYXlvdXQgaXMgaWRlbnRpY2FsIGZvciBSVjMyIGFuZCBSVjY0
IChhbmQgY2FuIGJlCj4gPiA+ID4gKyAgICAgICAgKiBleHRlbmRlZCBmb3IgUlYxMjggYnkgdXNp
bmcgdGhlIHJlc2VydmVkIGhhbGYgb2YgZWFjaCBvdmVycmlkZQo+ID4gPiA+ICsgICAgICAgICog
ZmllbGQpLCBzbyB0aGUgcHJldmlvdXMgYm9vdGluZyBzdGFnZSBjYW4gcGFyc2UgdGhlIGhlYWRl
ciB3aXRob3V0Cj4gPiA+ID4gKyAgICAgICAgKiBrbm93aW5nIHRoZSBYTEVOIG9mIHRoZSBmaXJt
d2FyZSB1cGZyb250Lgo+ID4gPiA+ICsgICAgICAgICoKPiA+ID4gPiArICAgICAgICAqIE9mZnNl
dCAgU2l6ZSAgRmllbGQKPiA+ID4gPiArICAgICAgICAqICAgMHgwMCAgICAgNCAganVtcCB0byBf
c3RhcnRfcmVhbAo+ID4gPiA+ICsgICAgICAgICogICAweDA0ICAgICA0ICBtYWdpYyAoJ09TQkkn
KQo+ID4gPiA+ICsgICAgICAgICogICAweDA4ICAgICA0ICBoZWFkZXIgdmVyc2lvbgo+ID4gPiA+
ICsgICAgICAgICogICAweDBjICAgICA0ICBmaXJtd2FyZSBYTEVOCj4gPiA+ID4gKyAgICAgICAg
KiAgIDB4MTAgICAgIDQgIGZpcm13YXJlIHNpemUgKF9md19lbmQgLSBfZndfc3RhcnQpCj4gPiA+
ID4gKyAgICAgICAgKiAgIDB4MTQgICAgIDQgIGZsYWdzIChGV19IRUFERVJfRkxBR1NfKikKPiA+
ID4gPiArICAgICAgICAqICAgMHgxOCAgICAgOCAgb3ZlcnJpZGUgdmFsdWUgZm9yIGEwCj4gPiA+
ID4gKyAgICAgICAgKiAgIDB4MjAgICAgIDggIHJlc2VydmVkICh1cHBlciBoYWxmIG9mIHRoZSBh
MCB2YWx1ZSBvbiBSVjEyOCkKPiA+ID4KPiA+ID4gVGhpbmtpbmcgYWJvdXQgdGhpcyBtb3JlLCB3
ZSBkb24ndCBuZWVkICJvdmVycmlkZSB2YWx1ZSBvZiBhMCIgaW4gdGhlCj4gPiA+IGhlYWRlciBp
bnN0ZWFkIHdoZW5ldmVyIEZXX0hFQURFUl9GTEFHU19PVkVSUklERV9BMCBpcwo+ID4gPiBzZXQg
d2UgY2FuIHVzZSBtaGFydGlkIENTUiB2YWx1ZSBhcyB0aGUgdmFsdWUgb2YgYTAuIFRoaXMgd2ls
bCB3b3JrCj4gPiA+IGJldHRlciBmb3IgYWxsIENQVXMgZW50ZXJpbmcgYXQgX3N0YXJ0Lgo+ID4K
PiA+IFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uIGFuZCByZW1pbmRlci4gQmVjYXVzZSB0
aGUgaGVhZGVyIGlzCj4gPiBzaGFyZWQgYnkgYWxsIGhhcnRzLCBpdCBjYW5ub3Qgc2hvdyBlYWNo
IGhhcnQncyBJRCBjb3JyZWN0bHkuIEkgd2lsbAo+ID4gZml4IHRoaXMgcHJvYmxlbSBpbiB0aGUg
bmV4dCBwYXRjaC4KPiA+Cj4gPiBIb3dldmVyLCBJIGFsc28gaGF2ZSBhIHF1ZXN0aW9uLiBJbiB0
aGUgb3JpZ2luYWwgZmxvdywgY291bGQgd2UgYWxzbwo+ID4gbGV0IGVhY2ggaGFydCByZWFkIGl0
cyBvd24gbWhhcnRpZCBDU1IgaW50byAkYTAgYXQgdGhlIGJlZ2lubmluZz8KPgo+IE15IHN1Z2dl
c3Rpb24gaXMgdGhhdCBlYWNoIGhhcnQgd2lsbCBvdmVycmlkZSAkYTAgd2l0aCBpdHMgb3duIG1o
YXJ0aWQgb25seQo+IHdoZW4gT3BlblNCSSBoZWFkZXIgZmxhZ3MgaGF2ZSBGV19IRUFERVJfRkxB
R1NfT1ZFUlJJREVfQTAKPiBzZXQgc28gdGhpcyB3aWxsIGFsbG93IHVzIHRvIGRyb3AgX2Z3X2hl
YWRlcl9vdmVycmlkZV9hMCBmcm9tIHRoZSBPcGVuU0JJCj4gaGVhZGVyLgo+Cj4gPiBJZiBJIHVu
ZGVyc3RhbmQgY29ycmVjdGx5LCB0aGUgcHJldmlvdXMgc3RhZ2UgbXVzdCBwYXNzIGVhY2ggaGFy
dCdzCj4gPiBtaGFydGlkIHRvIE9wZW5TQkkgdXNpbmcgJGEwLiBTaW5jZSBhIGhhcnQgc2hvdWxk
IG9ubHkgdXNlIGl0cyBvd24gSUQsCj4gPiBJIGFtIHdvbmRlcmluZyB3aHkgT3BlblNCSSBkb2Vz
bid0IGp1c3QgcmVhZCB0aGUgSUQgYnkgaXRzZWxmIGluIHRoZQo+ID4gb3JpZ2luYWwgZmxvdy4K
Pgo+IEV2ZW4gdGhvdWdoIE9wZW5TQkkgZG9lcyBub3QgdXNlIHRoZSB2YWx1ZSBwYXNzZWQgb24g
JGEwIGFzIGhhcnQgSUQsCj4gd2Ugc2hvdWxkIHN0aWxsIHN0YXkgY29uc2lzdGVudCB3aXRoIGJv
b3QgcHJvdG9jb2wgd2hpY2ggaGFzIGJlZW4gYXJvdW5kCj4gZm9yIG1hbnkgeWVhcnMuCgpUaGFu
ayB5b3UgZm9yIHRoZSBlbGFib3JhdGlvbi4gSSB3aWxsIG92ZXJyaWRlICRhMCB3aXRoIGl0cyBv
d24KbWhhcnRpZCBvbmx5IGZvciB0aGUgZmlybXdhcmUgaGVhZGVyIGZsb3cgaW4gdGhlIG5leHQg
dmVyc2lvbi4gVGhhbmtzCgo+Cj4gUmVnYXJkcywKPiBBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
