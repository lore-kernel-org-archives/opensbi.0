Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B1CC982D0
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OjRZMFvM+E/kAsR403FUVGju8W/JV6r0AGsazWReEI=; b=IB4Dry3/vyi38T
	eO9qmv9zHJvmOQrgxwAXHqPXt8VClExPawAsfBRSdjNG0Yc50BY/jteWR2W9UAw+ZoKUanSAGjPpo
	vUd6m9RGr8MOCEq+qalPhAinCtxV2Fb24CCaQdw8wmgF7tZZWK6aCkcVpxterOQySobBtjn5MCA2o
	bnDL3OEvVBOZtMcTtW6sZizB0drA3s/qtVOXpxfTaFADd/XUPuaKBY4vSUIPW6vDjoMtTxwWDx6FS
	QGevde0UKZf97Hckg0/E6hzs2NQG5OT7pJfG7hda73PrJXLjUhb72g4Xkgp+OYqRcM4izq59hANvs
	EE/Puc2hXa16Ksk1S3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Zv-0000000AuVN-2oVY;
	Thu, 17 Sep 2026 08:34:47 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Zt-0000000AuUm-0D5W
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 08:34:46 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso7422205e9.2
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 01:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789634082; cv=none;
        d=google.com; s=arc-20260327;
        b=dRlPuIEfla/HXLd0nD1Oq/JELd3SGwIuu8Tp2PawLjm6jydl7zumyA7sFaB9vFcOg1
         WkXlaUZ6AGkAYTEw1wIfEyhLoPbN2VT1Y9e27PynhzS3Z6xNnvMpRHSWdmxGsF7UgMe5
         R37+4QXfFn1Bd7YDGBDBtOrdrYEdC8m9ZVM+VeslpUbEF8eVj0Kouq0J4R7J8ZR+xV3v
         iPR6ywP1uQfFVqgg2YJCaWOygvj/nvvOKiDLzYGfI8hxdIirXc1ujCno1bU60S4dNf2K
         fZbX9xsQC+L3uewrf1zzU7RT198YRVNT58+zN3+7atzYeDicmuC6My3Qodv1tFWKnCGI
         DnYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=10eeMA/4yA89CeCQDfiWkaO159iXyGtTDIB7ml7pteY=;
        fh=eQRLnJNeHQBGvSQQ3K81dsZjCFpV01l3b0rpGkosk9o=;
        b=W+/xukLdGkh4bGNajxtcz/k6Z9NwYBq8AiI5pG9G4PSfgkyJjORHA3NmWrCD7ZYbQK
         Cbe6S+w2YkY3cIcu4H3VrPcygh+nKb8bqfqJDJcsMDTBv2XRBvLQpNsOsAqP4AU8by6w
         lQuQxOSzm8pfL2/89li7PKmxxtSiVYrI3rGyjvr/K+CCw8zVC3O9TQqd/Ut5XUgphpYJ
         DgTXA219DihQ2/q+5Gua+olSx4VWVtqgm3wL3QtAFJK4EgNvvnYCGZtIo/ytito83kou
         0a4/YE6rHVNvsdSDDc2oKgcmOkvWSb3e+nOxxMWuYVAs20DyFr/OFfu7K/RQTOBTFHDG
         1idw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789634082; x=1790238882; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10eeMA/4yA89CeCQDfiWkaO159iXyGtTDIB7ml7pteY=;
        b=gEzm3az9qxa8DS08zW+PSC5KCbPo4q3qT3erKnbihHcPmRsV78t9u41pnVhBFf2Nzn
         MRuA612y4H2IPN63QtzFKh1jN22Opdis9eqMUD4IswsdNDPr3e52JkNL1tU7wRM30OTf
         P4yuXsYy5okH9pvNccFdgkEyO3XFbGJfIZsMop7B7wUih2A83HUg4tZFa+ie9OzyNKTq
         jr6jm1QwS88btiB710p2VhAFYKovdI9eW3n17ebZFRLwDOuG7gYcDfXOmLpEaott9CKC
         C2DX8Rxw0qQI3IyYjazdvXVXGsnlQslFv2tMb/Z+y/oRjZFAT7yARnDEBYDQh2Lyf+A4
         JDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634082; x=1790238882;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10eeMA/4yA89CeCQDfiWkaO159iXyGtTDIB7ml7pteY=;
        b=UU9O+26KfcNjqWQDt+g/UKPgnloXnXGtmyCoMN1PqITKOPa8w9ZCoMdNpAqQPGVq2N
         CzQ50ZQnugfW4RuirLEa9vSTpLdJk34hZCygEXNlNrt1I6KPf1VjVarRn8/GlxJJWYmp
         aR60EWYKGutqtLX10orpcqkYQZVcaN+jXvGHRNT4s+AI99eR4qRTfiB9mmO+2He1gege
         IJYF5OmLrkyrEcGDnegL2kGdnhEoYZsTATXlFhGmXWOlNPh1ua0n9TXKLL/5MwjGm6tB
         JNsZheg3yNnpxFk3qskQLuY/fR4FIUsSo9trCS7QNU9SbXJVenMMalvDIbWYgU0sIq43
         9rGA==
X-Gm-Message-State: AFuF++m/6jT2dwYX9qEAerMDEvF5nXliEg6VGh0QO0ouhkcax8lfYgRm
	W+0p1AxfnjAw7TiFbQrdU8QwTcOqr22hAg2qgKWYh1rmQ5loLCLr46x7ob0TlYnRJAp3Iyzz4Oy
	u4TUgJ3b314l1SiXNuv0TPhUwSLEPuYLeImOxZk8YFbXLUAU3rZFXpEQe9w==
X-Gm-Gg: AYBFou3keOu045+AwH4V68mxPV9+yQJ9x4ohmNTidk4/0j5rJIX8eHh8K4hx8jotbfo
	DsAOljJqvFAwfHJKNjGVqJ5VhAj8XhvEiM+yAMB9jgBPqDtDXXWygPGn9//15Dv0ADWIN3DYxmR
	Tp1tPZtucJkl359StB5/Eb64bmEncbI5RY+g278Mgo+7n0fAZkUdhhOZn7wsaOyE1W+fXASYDVI
	ZJbJ6gq9TC/Hr7BX9HAdFWucIN2828gcFv2cqoBw4DGYo/RFHWJH6J45w+YkO0SrkNsVQ8rtxPq
	fGwXKPNTxzakrgF72zfV7bCCL5KiPWGWz4VIwpmawG2gNMv2ie9re0UYDEnbpWLQqnTkli+xeVj
	KZbpx0LQTFBVwV+tynEY8V2t+wwwmCdyN5GuhwXg+AFAiwg//twrPDGqhCT4Hq47GH5DyuOGVMQ
	==
X-Received: by 2002:a05:600c:a14:b0:49c:f89b:f82 with SMTP id
 5b1f17b1804b1-49eb732e3dcmr111902375e9.12.1789634082171; Thu, 17 Sep 2026
 01:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260901022211.2619560-1-zong.li@sifive.com> <20260901022211.2619560-2-zong.li@sifive.com>
 <CAAhSdy2c-Cy4TZeL5J8fzQN_BCf5-M9UG_6HSuVum1D5hYNUdg@mail.gmail.com> <CANXhq0qOKJKmk137N3xRke=ngrxc+5F+aZFoT3gWHGVC6MDbPw@mail.gmail.com>
In-Reply-To: <CANXhq0qOKJKmk137N3xRke=ngrxc+5F+aZFoT3gWHGVC6MDbPw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Sep 2026 14:04:31 +0530
X-Gm-Features: AcwNN1Xw20kkPzjj8jC1B6M0Pmq5kz2O42eZBJ2ldyqeWtLNMHFsvoyOv5E7kNY
Message-ID: <CAAhSdy1RzUtBuLpUVZ48d1VNCd0vmy628N4O2b4s6tg1CmMj1Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: fw_base.S: add a formatted OpenSBI firmware header
To: Zong Li <zong.li@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_013445_145728_90EDA8D4 
X-CRM114-Status: GOOD (  42.52  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMTowM+KAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAxNiwgMjAyNiBhdCAxOjA54oCvUE0gQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBTZXAgMSwg
MjAyNiBhdCA3OjUy4oCvQU0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gQWRkIGEgZml4ZWQgMTI4LWJ5dGUgaGVhZGVyIGF0IHRoZSB2ZXJ5IGJlZ2lubmlu
ZyBvZiBldmVyeSBPcGVuU0JJCj4gPiA+IGZpcm13YXJlIGltYWdlLCByZWdhcmRsZXNzIG9mIHRo
ZSBmaXJtd2FyZSB0eXBlLiBUaGUgaGVhZGVyIGxldHMgdGhlCj4gPiA+IHByZXZpb3VzIGJvb3Rp
bmcgc3RhZ2UgaWRlbnRpZnkgYW4gT3BlblNCSSBpbWFnZSBhbmQsIG1vcmUgaW1wb3J0YW50bHks
Cj4gPiA+IGdpdmVzIGl0IGEgd2VsbC1rbm93biBwbGFjZSBpbnNpZGUgdGhlIGltYWdlIHRvIGhh
bmQgb3ZlciBpbmZvcm1hdGlvbgo+ID4gPiB0byBPcGVuU0JJIGJ5IHBhdGNoaW5nIGEgZmV3IHdv
cmRzIGluc3RlYWQgb2Ygc2V0dGluZyB1cCByZWdpc3RlcnMuCj4gPiA+Cj4gPiA+IFRoaXMgZmly
c3QgcGF0Y2ggb25seSBpbnRyb2R1Y2VzIHRoZSBsYXlvdXQ6Cj4gPiA+Cj4gPiA+ICAgLSBhIDQt
Ynl0ZSBqdW1wIG92ZXIgdGhlIGhlYWRlciB0byBfc3RhcnRfcmVhbCwgc28gdGhhdCBfc3RhcnQg
c3RheXMKPiA+ID4gICAgIHRoZSBlbnRyeSBwb2ludCBvZiB0aGUgaW1hZ2UuIFRoZSBqdW1wIGlz
IGFzc2VtYmxlZCB3aXRoCj4gPiA+ICAgICAnLm9wdGlvbiBub3J2Yycgc28gdGhhdCB0aGUgZmll
bGRzIGJlaGluZCBpdCBhcmUgYWx3YXlzIGF0IGEgZml4ZWQKPiA+ID4gICAgIG9mZnNldCwgZXZl
biBmb3IgYSBidWlsZCB3aXRoIGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb25zIGVuYWJsZWQsCj4gPiA+
Cj4gPiA+ICAgLSB0aGUgJ09TQkknIG1hZ2ljLCBhIGhlYWRlciB2ZXJzaW9uLCB0aGUgWExFTiB0
aGUgZmlybXdhcmUgd2FzIGJ1aWx0Cj4gPiA+ICAgICBmb3IgYW5kIHRoZSBzaXplIG9mIHRoZSBm
aXJtd2FyZSBpbWFnZSwgc28gdGhhdCB0aGUgcHJldmlvdXMgYm9vdGluZwo+ID4gPiAgICAgc3Rh
Z2UgY2FuIHZhbGlkYXRlIHRoZSBpbWFnZSBhbmQgZmlndXJlIG91dCBob3cgbXVjaCBtZW1vcnkg
aXQKPiA+ID4gICAgIG9jY3VwaWVzLAo+ID4gPgo+ID4gPiAgIC0gYSBmbGFncyB3b3JkIGFuZCB0
aHJlZSA4LWJ5dGUgb3ZlcnJpZGUgdmFsdWVzLCB3aGljaCBhcmUgdW51c2VkCj4gPiA+ICAgICAo
YW5kIHplcm8pIGZvciBub3cgYW5kIGFyZSB3aXJlZCB1cCBieSB0aGUgbmV4dCBwYXRjaC4KPiA+
ID4KPiA+ID4gVGhlIGxheW91dCBpcyBkZWxpYmVyYXRlbHkgaWRlbnRpY2FsIGZvciBSVjMyIGFu
ZCBSVjY0IHNvIHRoYXQgdGhlCj4gPiA+IHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgY2FuIHBhcnNl
IHRoZSBoZWFkZXIgd2l0aG91dCBrbm93aW5nIHRoZSBYTEVOIG9mCj4gPiA+IHRoZSBmaXJtd2Fy
ZSB1cGZyb250LiBFYWNoIG92ZXJyaWRlIHZhbHVlIGlzIGZvbGxvd2VkIGJ5IGEgcmVzZXJ2ZWQK
PiA+ID4gOC1ieXRlIHNsb3Qgc28gdGhhdCB0aGUgc2FtZSBsYXlvdXQgY2FuIGJlIGV4dGVuZGVk
IHRvIFJWMTI4IGxhdGVyLgo+ID4gPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlA
c2lmaXZlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBmaXJtd2FyZS9md19iYXNlLlMgfCA2OCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZmlybXdh
cmUvZndfYmFzZS5TIGIvZmlybXdhcmUvZndfYmFzZS5TCj4gPiA+IGluZGV4IDBjNWM2NWMxLi5k
ZDJhZGI4YSAxMDA2NDQKPiA+ID4gLS0tIGEvZmlybXdhcmUvZndfYmFzZS5TCj4gPiA+ICsrKyBi
L2Zpcm13YXJlL2Z3X2Jhc2UuUwo+ID4gPiBAQCAtMTcsNiArMTcsMTUgQEAKPiA+ID4gICNkZWZp
bmUgQk9PVF9MT1RURVJZX0FDUVVJUkVEICAgICAgICAgIDEKPiA+ID4gICNkZWZpbmUgQk9PVF9T
VEFUVVNfQk9PVF9IQVJUX0RPTkUgICAgIDEKPiA+ID4KPiA+ID4gKy8qIE9wZW5TQkkgZmlybXdh
cmUgaGVhZGVyICovCj4gPiA+ICsjZGVmaW5lIEZXX0hFQURFUl9NQUdJQ19WQUxVRSAgICAgICAg
ICAweDQ5NDI1MzRmIC8qIEFTQ0lJIHN0cmluZyAiT1NCSSIgKi8KPiA+ID4gKyNkZWZpbmUgRldf
SEVBREVSX1ZFUlNJT04gICAgICAgICAgICAgIDB4MQo+ID4gPiArI2RlZmluZSBGV19IRUFERVJf
U0laRSAgICAgICAgICAgICAgICAgMTI4Cj4gPiA+ICsjZGVmaW5lIEZXX0hFQURFUl9SRVNFUlZF
RF9PRkZTRVQgICAgICAweDQ4Cj4gPiA+ICsjZGVmaW5lIEZXX0hFQURFUl9GTEFHU19PVkVSUklE
RV9BMCAgICAoMSA8PCAwKQo+ID4gPiArI2RlZmluZSBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVf
QTEgICAgKDEgPDwgMSkKPiA+ID4gKyNkZWZpbmUgRldfSEVBREVSX0ZMQUdTX09WRVJSSURFX0Ey
ICAgICgxIDw8IDIpCj4gPiA+ICsKPiA+ID4gIC5tYWNybyBNT1ZfM1IgX19kMCwgX19zMCwgX19k
MSwgX19zMSwgX19kMiwgX19zMgo+ID4gPiAgICAgICAgIGFkZCAgICAgXF9fZDAsIFxfX3MwLCB6
ZXJvCj4gPiA+ICAgICAgICAgYWRkICAgICBcX19kMSwgXF9fczEsIHplcm8KPiA+ID4gQEAgLTQ0
LDggKzUzLDY3IEBACj4gPiA+ICAgICAgICAgLnNlY3Rpb24gLmVudHJ5LCAiYXgiLCAlcHJvZ2Jp
dHMKPiA+ID4gICAgICAgICAuYWxpZ24gMwo+ID4gPiAgICAgICAgIC5nbG9ibCBfc3RhcnQKPiA+
ID4gKyAgICAgICAuZ2xvYmwgX3N0YXJ0X3JlYWwKPiA+ID4gICAgICAgICAuZ2xvYmwgX3N0YXJ0
X3dhcm0KPiA+ID4gIF9zdGFydDoKPiA+ID4gKyAgICAgICAvKgo+ID4gPiArICAgICAgICAqIE9w
ZW5TQkkgZmlybXdhcmUgaGVhZGVyCj4gPiA+ICsgICAgICAgICoKPiA+ID4gKyAgICAgICAgKiBF
dmVyeSBPcGVuU0JJIGZpcm13YXJlIGltYWdlIHN0YXJ0cyB3aXRoIHRoaXMgZml4ZWQgMTI4LWJ5
dGUKPiA+ID4gKyAgICAgICAgKiBoZWFkZXIuIFRoZSBsYXlvdXQgaXMgaWRlbnRpY2FsIGZvciBS
VjMyIGFuZCBSVjY0IChhbmQgY2FuIGJlCj4gPiA+ICsgICAgICAgICogZXh0ZW5kZWQgZm9yIFJW
MTI4IGJ5IHVzaW5nIHRoZSByZXNlcnZlZCBoYWxmIG9mIGVhY2ggb3ZlcnJpZGUKPiA+ID4gKyAg
ICAgICAgKiBmaWVsZCksIHNvIHRoZSBwcmV2aW91cyBib290aW5nIHN0YWdlIGNhbiBwYXJzZSB0
aGUgaGVhZGVyIHdpdGhvdXQKPiA+ID4gKyAgICAgICAgKiBrbm93aW5nIHRoZSBYTEVOIG9mIHRo
ZSBmaXJtd2FyZSB1cGZyb250Lgo+ID4gPiArICAgICAgICAqCj4gPiA+ICsgICAgICAgICogT2Zm
c2V0ICBTaXplICBGaWVsZAo+ID4gPiArICAgICAgICAqICAgMHgwMCAgICAgNCAganVtcCB0byBf
c3RhcnRfcmVhbAo+ID4gPiArICAgICAgICAqICAgMHgwNCAgICAgNCAgbWFnaWMgKCdPU0JJJykK
PiA+ID4gKyAgICAgICAgKiAgIDB4MDggICAgIDQgIGhlYWRlciB2ZXJzaW9uCj4gPiA+ICsgICAg
ICAgICogICAweDBjICAgICA0ICBmaXJtd2FyZSBYTEVOCj4gPiA+ICsgICAgICAgICogICAweDEw
ICAgICA0ICBmaXJtd2FyZSBzaXplIChfZndfZW5kIC0gX2Z3X3N0YXJ0KQo+ID4gPiArICAgICAg
ICAqICAgMHgxNCAgICAgNCAgZmxhZ3MgKEZXX0hFQURFUl9GTEFHU18qKQo+ID4gPiArICAgICAg
ICAqICAgMHgxOCAgICAgOCAgb3ZlcnJpZGUgdmFsdWUgZm9yIGEwCj4gPiA+ICsgICAgICAgICog
ICAweDIwICAgICA4ICByZXNlcnZlZCAodXBwZXIgaGFsZiBvZiB0aGUgYTAgdmFsdWUgb24gUlYx
MjgpCj4gPgo+ID4gVGhpbmtpbmcgYWJvdXQgdGhpcyBtb3JlLCB3ZSBkb24ndCBuZWVkICJvdmVy
cmlkZSB2YWx1ZSBvZiBhMCIgaW4gdGhlCj4gPiBoZWFkZXIgaW5zdGVhZCB3aGVuZXZlciBGV19I
RUFERVJfRkxBR1NfT1ZFUlJJREVfQTAgaXMKPiA+IHNldCB3ZSBjYW4gdXNlIG1oYXJ0aWQgQ1NS
IHZhbHVlIGFzIHRoZSB2YWx1ZSBvZiBhMC4gVGhpcyB3aWxsIHdvcmsKPiA+IGJldHRlciBmb3Ig
YWxsIENQVXMgZW50ZXJpbmcgYXQgX3N0YXJ0Lgo+Cj4gVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dl
c3Rpb24gYW5kIHJlbWluZGVyLiBCZWNhdXNlIHRoZSBoZWFkZXIgaXMKPiBzaGFyZWQgYnkgYWxs
IGhhcnRzLCBpdCBjYW5ub3Qgc2hvdyBlYWNoIGhhcnQncyBJRCBjb3JyZWN0bHkuIEkgd2lsbAo+
IGZpeCB0aGlzIHByb2JsZW0gaW4gdGhlIG5leHQgcGF0Y2guCj4KPiBIb3dldmVyLCBJIGFsc28g
aGF2ZSBhIHF1ZXN0aW9uLiBJbiB0aGUgb3JpZ2luYWwgZmxvdywgY291bGQgd2UgYWxzbwo+IGxl
dCBlYWNoIGhhcnQgcmVhZCBpdHMgb3duIG1oYXJ0aWQgQ1NSIGludG8gJGEwIGF0IHRoZSBiZWdp
bm5pbmc/CgpNeSBzdWdnZXN0aW9uIGlzIHRoYXQgZWFjaCBoYXJ0IHdpbGwgb3ZlcnJpZGUgJGEw
IHdpdGggaXRzIG93biBtaGFydGlkIG9ubHkKd2hlbiBPcGVuU0JJIGhlYWRlciBmbGFncyBoYXZl
IEZXX0hFQURFUl9GTEFHU19PVkVSUklERV9BMApzZXQgc28gdGhpcyB3aWxsIGFsbG93IHVzIHRv
IGRyb3AgX2Z3X2hlYWRlcl9vdmVycmlkZV9hMCBmcm9tIHRoZSBPcGVuU0JJCmhlYWRlci4KCj4g
SWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgdGhlIHByZXZpb3VzIHN0YWdlIG11c3QgcGFzcyBl
YWNoIGhhcnQncwo+IG1oYXJ0aWQgdG8gT3BlblNCSSB1c2luZyAkYTAuIFNpbmNlIGEgaGFydCBz
aG91bGQgb25seSB1c2UgaXRzIG93biBJRCwKPiBJIGFtIHdvbmRlcmluZyB3aHkgT3BlblNCSSBk
b2Vzbid0IGp1c3QgcmVhZCB0aGUgSUQgYnkgaXRzZWxmIGluIHRoZQo+IG9yaWdpbmFsIGZsb3cu
CgpFdmVuIHRob3VnaCBPcGVuU0JJIGRvZXMgbm90IHVzZSB0aGUgdmFsdWUgcGFzc2VkIG9uICRh
MCBhcyBoYXJ0IElELAp3ZSBzaG91bGQgc3RpbGwgc3RheSBjb25zaXN0ZW50IHdpdGggYm9vdCBw
cm90b2NvbCB3aGljaCBoYXMgYmVlbiBhcm91bmQKZm9yIG1hbnkgeWVhcnMuCgpSZWdhcmRzLApB
bnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
