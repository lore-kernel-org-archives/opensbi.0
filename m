Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BBDCAC5B8
	for <opensbi@archiver.kernel.org>; Mon,  6 Oct 2025 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltPkH+WkbUQbIs8GitgDgKH20iWepknFBl6nJ1i5awc=; b=1yDx4W3lkSvjog
	tEAiLFenl0wIe8fsQHwY8cXah+Z8O6QEhuWwRI9Ry+m5ELMGHlif+MT37Tn8gW9D9CKw/LO4YJG8G
	o+Kmc+lmk2PGURO9d/P5CIhO2bdNrzmJ46LSCm7o3K7bYSE7wMuGon2/AV1uMUwdPbFRp2jMRDBuv
	KebQLbIwilszIDZPc5OUDmk0Bcs6322WQuRQdWnLDTJ1YnpJX1ubDgNAuLb/1dKEHX983g5Nc3wzF
	9FyjcDmbIqzMcNN6tPkva5txEUT9uHiV0Mo11NxpXbwcbKmfHrca9/vZAj3aPou7fYjIoEW/57y46
	lM5fhjNU0oa0Dhq37T9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hBq-0000000HE1k-1RmC;
	Mon, 06 Oct 2025 09:07:30 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hBn-0000000HE1J-34EO
	for opensbi@lists.infradead.org;
	Mon, 06 Oct 2025 09:07:28 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-42d8a0f09f6so18872605ab.3
        for <opensbi@lists.infradead.org>; Mon, 06 Oct 2025 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759741647; x=1760346447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wONpyFeiWI9TvvnrYtpALS3CKrjYW0UpcwrVByqXOEQ=;
        b=oe6ALObHbBe05pSx49SvCBuuKDXfFdSXxq9tzJfIZPsa1EZ94B3Mv8d5kSnA0SCrLQ
         WFW2cvpPCdyou2e7zxXmHertfIZB046vkzrd1AYr0DgKkrxLlKlPEB4Q8KZRufodfdqK
         zEEl7cdhL4i0Pdncw2LiLZTgJ0WCNoaAJrE4apxuXFrledp5vM9frmGQoZA9E8ZPQacS
         O/AcU/MQ5+DCyzHWhP9Kc3ptypTDvHYCM7uYikiiasH/rOD0jkT8UhyXPSh/HzizDeii
         8Fe+Cp+kEnr+M8hBvQh9JqXM3KkgonlVu3onZt/ah1KwsKv3LluFiXdudnlhlNWycJK+
         qn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759741647; x=1760346447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wONpyFeiWI9TvvnrYtpALS3CKrjYW0UpcwrVByqXOEQ=;
        b=wNqYGWKuJsBvyeOmS02+p5V6EPf6S19pQ2nZhn184kE6CMAoJ1mzbPfjE1l/LGz3wV
         BpXKl2w4ES92zc9lVABkH0imrslY6AoZDzi6zL4951lvd1n8cG6fkZZOZKIO/fG9zoIE
         DcKMlbVwqY3eTZgj+BnHeta8TXrGh7cLa6agymsg/pW48tkXO3MX4pfRH/sFTeARXPah
         z75MQSvLgTHbdj4IkH6XOy3GiilSH76YgUzo8w2gc6ETSzILS1HnbBu+1R/qMNEqbq5e
         4DZS1//un7tErcLGKYJZEiaOiyYfq3bqWL/WHkMSUhEVjhPEi82Ogq7zjTcKKJB+0m7I
         AQHA==
X-Gm-Message-State: AOJu0Yz/kGRj7joAqW0q0w2S4fQKSf4/ejPVVu6tJWCCrOdTJ5zyeSix
	gq3WKpfaGtauHupt8WQqtD5KN7AUjkbUMq0tcUkiPR8R+jL8XM9Y4+K3m1SspHPysmQYMlJ8/GF
	N7kzks5MZDDkeyV6o84aLYK8SUdp9ZgKD4c6+g9xSiw==
X-Gm-Gg: ASbGncsMHCrP/qoteR89bLIsaNda/SQ+usby7j4Hp/p5ZNMlJM8OHV/w3cXA67IoczM
	1QwX8dW+7OYx/1qUxpVeNzkhhJ2fbhokEfmufcQJyI0foXZQOxz6XBDWOhBCT2bzXX0vCje6Xlq
	Nh2BUwIQMEMazKws3NEQdo/YVVgtgEQ0mXKxQetK97kVjXbwVxe9YfVBXm906aHtUW8RNQvt1E7
	PUCYYiQpw6Vg2mdaxruAAjpXQ0GEQiUE16RteCVIjBUHZKH6LXPfREltZ0wM2Q=
X-Google-Smtp-Source: AGHT+IFMX/yLduhMAhpNK3rNy0c1zUMWKDD2OSe6ea0b8aE8aDPgSH4rjilT8RUZpZ+UBE/DKVIief38tcWI3s2x5zs=
X-Received: by 2002:a05:6e02:1988:b0:424:80f2:2a8 with SMTP id
 e9e14a558f8ab-42e7acef8bdmr169023245ab.3.1759741646481; Mon, 06 Oct 2025
 02:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250903044619.394019-1-wxjstz@126.com>
In-Reply-To: <20250903044619.394019-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Oct 2025 14:37:15 +0530
X-Gm-Features: AS18NWBe7GEoiNAOl6mY0xYj8CBQME2_6Ju35LdVH7zRty9qirI0GnAk7qyM3oA
Message-ID: <CAAhSdy2QqAg9bCgguhyOqq1rYw=oWLaCfpeXNO1mMw=ALOi6xw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Some updates about domain context
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>, 
	Alvin Chang <alvinga@andestech.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>, Qingyu Shang <2931013282@sjtu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_020727_768967_46D402C0 
X-CRM114-Status: GOOD (  10.47  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCAxMDoxNuKAr0FNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IC0gQWRkIGNvZGUgdG8gc2JpX2RvbWFpbl9jb250ZXh0X2VudGVyIHRvIGFs
bG9jYXRlIHRoZSBkb21haW4gY29udGV4dAo+ICAgZm9yIGFsbCB0aGUgZG9tYWluIG9uIHRoZSBj
dXJyZW50IEhBUlQuCj4gLSBBZGQgZXJyb3IgaGFuZGxpbmcKPgo+IFhpYW5nIFcgKDMpOgo+ICAg
bGliOiBzYmk6IEFkZCBlcnJvciBoYW5kbGluZyB0byBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29u
dGV4dAo+ICAgbGliOiBzYmk6IEFkZCBoYXJ0IGNvbnRleHQgaW5pdCB3aGVuIGZpcnN0IGNhbGwg
ZW50ZXIKPiAgIGxpYjogc2JpOiBQcmV2ZW50IHRhcmdldCBkb21haW4gc2FtZSBhcyB0aGUgY3Vy
cmVudAo+Cj4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgfCA4MiArKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDU5IGluc2VydGlvbnMo
KyksIDIzIGRlbGV0aW9ucygtKQo+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVu
c2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
