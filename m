Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB57FC369DC
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBUUJ2buTvSO2BIFoqxVrADiluJjdT6BTz6Jysp8S/8=; b=isuJmsDqDq/X61
	vk6oChnGJsaatEphfJr+5CJGBVIKu+13AfUcKd3IVk9MJ9qUnoG5yNE/+ar5gdmLhE01JkCqdB8RN
	PN9gm9CWkGqi0tGnI4Tv47ngpeGGxzkIeN3LjeSarK+dXN5736zL6K033jw7O6ngnZzk8SRncjKiM
	ZiQtA/mjf4liSCG43WwCNTCqwXofH4nhOl5zhjyboRa4bNs/SEDr9QM1h5Iv29rTxOsyMSP4RHOG7
	iqB5U6fphvil7uUunDndsjbZFOtwwtJHeLwYLfXgwjJw3C3iYTkbmehwsEQdKWJ3ERQaf7TIgJLwX
	ce7nVPVA6XOutkb0DPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OCR-00000006Mt8-362t;
	Mon, 28 Apr 2025 13:07:07 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NhJ-00000006D4Y-0VpP
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:34:58 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d9030c2b73so8838175ab.0
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843696; x=1746448496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCLw8RWrHnO+FYummOJFnjeKmdBWLv01wx6/4W97mlk=;
        b=NMkAIASkjFskqrRL7TtbdapLEeeYllhVd8miJBLXhqNgQ6pwyhrBrVC4GDWB2gJgI3
         1Celni572R45Ke4lo+8Ar+jrG4ySnz76/DbZ4mXRaxRNe/uKTby09KgJcr62O/ZJt72v
         NuPrFtUNwF7b2ftT9w+1ZKnvuSXMpv9mrXY+GwKF8GH7kg/ph6siuyUTlYXDngO19g2w
         95442WVTlAZ9YpszYgFao0Nh4sdJsT8l6p6CXynpv6T2lXdpwxp/Z1fKnf2F9OTqnG6+
         dG9QexG/QUolrguDqtM2kPRq0MGeONLJy7pf0t2l+yIujX1aLOTEilb08jYdSnV3LfNU
         KSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843696; x=1746448496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCLw8RWrHnO+FYummOJFnjeKmdBWLv01wx6/4W97mlk=;
        b=BakXkPf1LZh6Cai0XblAtIRSUDfOYjp9JFUzTwdTXamaSdGiF5UtSAAnY3MNWOqKb3
         FkW61d42+cq158sQLPDIih6WnHIHdzMr+OUL7oGKG9PysxknKSqz0dtHqv0SiE25cWWV
         rxKdPtAefUFGYgLowfdDb4WgL+uwC38fw6qQ8VH+t3l3MSyEkmmrThc6QHgPb9CkyTkv
         3DHXd61VHWfDpxkLtP8RZt3u4WPvUlGaUVTYDjrEU3/evwFn1ESz0PxZu2CrRwM4xQ3j
         ISEGq1MYiIPc/pyfKhdaSl7sk+DGksDe6FX+xeM79RWkhrQkuFSpfPPFSEtzvdsTfhHp
         7lOg==
X-Gm-Message-State: AOJu0Yyd+53zUw/yAgQsa0CcE0KQ6a8P/dIa3R8DRgE3im7E3WewDMiD
	PRRaMCcETQz4mAzN6SCYzI36wGDn1r7uAuAnFfuSWwNv8BOhaYmmHbmCzwr/c5TYCXQqYjtrzVn
	CVqtTbCDvwlvmUPLql7vqvhWk/lXGGjvinsWn0gVhU7IPsor+FQU=
X-Gm-Gg: ASbGncsShaCr+yIA9fCZrkKHPQB8aGfgUnxfo1CwN3C63HN23mWDQ8AtKRjowQmCnG0
	DYHEb9xXKSVoI1kZFFyuZto+iLgAcD3k/DJ8oOQJeoMTbdoWmGld8W/vh9t4LK4MsrujP1h/Lbl
	opI2XByTSipqhBWXOd61mKLek=
X-Google-Smtp-Source: AGHT+IGGZgThJm3OzIo/O9MB3S5ejKyGNSpe+KZa++x7vAgUq1nuFNJ/y/9ZD9i5HJW1kf05HmQFpKhmvm8R0hp+wtU=
X-Received: by 2002:a05:6e02:1fcd:b0:3d8:1d7c:e180 with SMTP id
 e9e14a558f8ab-3d93b423787mr110278555ab.6.1745843696101; Mon, 28 Apr 2025
 05:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-7-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-7-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 18:04:45 +0530
X-Gm-Features: ATxdqUHFv2jrgMIvcPBLo8LfepMeY5CTeVqVpBlozAMvSfTJLm6YP8hbUmvuq3I
Message-ID: <CAAhSdy3oqpQR6+yOYJNwADvyKqoDtb+pgzL31iu84MC4O+K_xg@mail.gmail.com>
Subject: Re: [PATCH 5/8] lib: sbi_hart: fix sstateen emulation
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_053457_161910_3B6DB91A 
X-CRM114-Status: GOOD (  14.19  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBTc3RhdGVlbiBleHRlbnNpb24gZGVm
aW5lcyA0IHNzdGF0ZWVuIHJlZ2lzdGVycywgYnV0IFNCSSBjdXJyZW50bHkKPiBjb25maWd1cmVz
IHRoZSBleGVjdXRpb24gZW52aXJvbm1lbnQgdG8gdGhyb3cgaWxsZWdhbCBpbnN0cnVjdGlvbgo+
IGV4Y2VwdGlvbiB3aGVuIGFjY2Vzc2luZyBzc3RhdGVlbjEtMy4KPgo+IFNCSSBzaG91bGQgaW1w
bGVtZW50IGFsbCBzc3RhdGVlbiByZWdpc3RlcnMsIHNvIGRlbGVnYXRlIHRoZQo+IGltcGxlbWVu
dGF0aW9uIHRvIGhhcmR3YXJlIGJ5IHNldHRpbmcgdGhlIFNFIGJpdC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51
cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfaGFydC5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xp
Yi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IGMyODBjMGIzZTg1ZS4uYjIwOWYxY2FiMjdkIDEwMDY0
NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+
IEBAIC0xMTEsNiArMTExLDkgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBzYmlf
c2NyYXRjaCAqc2NyYXRjaCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBtc3RhdGVlbl92YWwg
Jj0gflNNU1RBVEVFTjBfQ1RSOwo+Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZTY0KENTUl9N
U1RBVEVFTjAsIG1zdGF0ZWVuX3ZhbCk7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZTY0KENT
Ul9NU1RBVEVFTjEsIFNNU1RBVEVFTl9TVEFURU4pOwo+ICsgICAgICAgICAgICAgICBjc3Jfd3Jp
dGU2NChDU1JfTVNUQVRFRU4yLCBTTVNUQVRFRU5fU1RBVEVOKTsKPiArICAgICAgICAgICAgICAg
Y3NyX3dyaXRlNjQoQ1NSX01TVEFURUVOMywgU01TVEFURUVOX1NUQVRFTik7Cj4KPiAgICAgICAg
ICAgICAgICAgaWYgKG1pc2FfZXh0ZW5zaW9uKCdTJykpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY3NyX3dyaXRlKENTUl9TU1RBVEVFTjAsIDApOwo+IC0tCj4gMi40OC4xCj4KPgo+IC0tCj4g
b3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
