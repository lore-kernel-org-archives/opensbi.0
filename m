Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46492C83F1A
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UsfeKCPyTVxBDShNFb3A/cqWbSz484W1nviPeEZke8=; b=BLOt3TUJzLwhTw
	HHoE/zyqUvAIGU6N8uhiNDJvngG1MvqPogPdiawdhxXLX5ps4DKv1lK6PYRsgAOp2z1DmIw7DVVxc
	LI7kwl2xrpD9vMDwY+xehQLxek8lBdaxEalWi7GqB27DHZ+PQsoYtJ5xBBKWNmYOwTTG0xq8kZGzF
	kGzmiCVlpPa+aYlZVYCCy3YKdHvU8NFPHj5sWaEScw23zjNY+ASQBasXuKELY58BV50/WptH5dvNz
	wugOR25pD1jfSyiyTb75RU56XepeEqQu5lvwwjpqiDocnMRcQjAUv1z0PJX1Zni2xopJGSSZc+DgT
	hxHwxrPMcK1vuMsQOUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq0J-0000000HIIk-40p0;
	Mon, 21 Jul 2025 12:52:27 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoSW-0000000H3Bm-2kGP
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 11:13:29 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3df2d8cb8d2so15728315ab.2
        for <opensbi@lists.infradead.org>; Mon, 21 Jul 2025 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753096408; x=1753701208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbaRjw3GkUQg7VGZTrHpp7w/LA6FxrGYed3Mq53rMZw=;
        b=ukp5jvsGFVmgJq6EIylLfI17xGaawAn/PV+HeQx2RdGh1nDFmofxYfntitPQkqIVLp
         s23IYuHc8FNWgVt5mI7kaH+tPhHpO6DMyvUd3GD/UJ8o7YsnuF6HdMJHtVh+WVo4pPXV
         GaQl+x+97lRjmUyKQukMAXj9oOMTbR2bv+YHcUoP7zM92kunIZl2toJYum43mzU3+3Wv
         0gDNWV5B5Fz47dGnaZrRHRDsciCzKUnxN3kIOCbjzdQ3hk0RhdilQNPFwCBMvCfsKuLF
         CnH1mDOR+Ien6W8uKIG0AYO6sF9Ml32vC/rwmNRNXSTMK3zdB+s30D1LaJZRc5Rplzta
         WKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096408; x=1753701208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbaRjw3GkUQg7VGZTrHpp7w/LA6FxrGYed3Mq53rMZw=;
        b=WnH/J4AyRc1nACcfV0lEX/qeGg1csZRXm8xl2GvtQ4z1AdP3uJYPLwunNQ0lfBYrq5
         B3TmBf5arKCYswWpzEi/J7gi07duDTNo1b3tzvMaiCgIo1OQLmbhP4frcofL2UF7SRqn
         iEHJgYMq0m0XLwdvFZiwW+GN9eUM/cJVL0aNOLYn4tRB+8H+dGTjfDTbqUixefRqVhtx
         4GSuaETm30JGy6c4gtn0LsChR56Yopn0em5Z7BhChaLtfWvrugSfQy2DuDBhfwseOXGu
         xpRCnk0b9Oht7u7usq+EmrmxV/KQU5uTaUdsM7DPDeqiveTxCFxeqSXLUUOUm2VzAUyC
         9T6A==
X-Gm-Message-State: AOJu0Yy1pX7tFa689AMhNthGgIXYMIf9FJaQxfJIDK4XzshAuqvCUwg1
	vWcw1nS4ECyXYRw58lqlptmviWEOwK03fH8hc8RLv/GJorl4/8YMzY8oAFzjIM3OlZMdhno4Djb
	nrX8jUK1RDXXD/a7uUaQkdaEeS9hOZyyqA/69aHQnhvPNoSGvrKBE
X-Gm-Gg: ASbGnct1fyjNkK3td63zl7ENN1danByF93bpcnJGPOWDaRGiQQ3Gtj7Ctb3+i14yM17
	/y4O0V0TmLQGApWZhuX6NZHE70ZC/FV+vtJtatJ2rimiLF73LXPXU6uFUj1t4EL0USrMmAp58Jw
	GKOBbKABuE6hZ2yyxysR5znrvTfGMqgJi8BqhWtSB/kiCuQsfm0V3uEbVqq7aZMPLHIaet/Fk0m
	d418siUi6QIQLwz2C1WilpZbWh2SA3PauyrXTjuPRmDiNIGMOc=
X-Google-Smtp-Source: AGHT+IGWTz+ReE0lX226qri5akxya5aKHkBbUKzGyTs16xdRxnp21jleVcWuNS46Ui3HDxzJgZhw3tdBhOUTbztPd+Y=
X-Received: by 2002:a05:6e02:440e:10b0:3e2:91bb:c075 with SMTP id
 e9e14a558f8ab-3e291bbc1c1mr129706555ab.22.1753096407419; Mon, 21 Jul 2025
 04:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250709232840.37551-1-jrtc27@jrtc27.com>
In-Reply-To: <20250709232840.37551-1-jrtc27@jrtc27.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Jul 2025 16:43:14 +0530
X-Gm-Features: Ac12FXwRZLisriRRYT8BSOnIJY1ntsJ4aKcU9dEdaSKa8zNsAMlQHyOIhhil6GA
Message-ID: <CAAhSdy0h1-ikCv2wFnm0gxbFhnOGMXhDPKeGjjsycG_dHY6NFw@mail.gmail.com>
Subject: Re: [PATCH] include: sbi: Don't use #pragma when preprocessing device
 tree sources
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_041328_693367_63D40AC1 
X-CRM114-Status: GOOD (  17.88  )
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgNDo1OOKAr0FNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSB0aGlzIHBlcnNpc3RzIGluIHRoZSBwcmVwcm9j
ZXNzZWQgb3V0cHV0IChzbyB0aGF0IGl0IGNhbiBhZmZlY3QKPiB0aGUgc3Vic2VxdWVudCBjb21w
aWxhdGlvbiksIGl0IGVuZHMgdXAgaW4gdGhlIGlucHV0IHRvIGR0YyBhbmQgaXMgYQo+IHN5bnRh
eCBlcnJvciwgYnJlYWtpbmcgdGhlIGsyMTAgYnVpbGQuIElkZWFsbHkgd2Ugd291bGRuJ3QgYWRk
IHRoZQo+IC1pbmNsdWRlIGZsYWcgdG8gRFRTQ1BQRkxBR1MgaW4gdGhlIGZpcnN0IHBsYWNlIGFz
IHRoaXMgaGVhZGVyIGlzIHdob2xseQo+IHBvaW50bGVzcyB0aGVyZSwgYnV0IHRoYXQncyBhIG1v
cmUgaW52YXNpdmUgYnVpbGQgc3lzdGVtIGNoYW5nZSBjb21wYXJlZAo+IHRvIGp1c3QgbWFraW5n
IHRoaXMgaGVhZGVyIHNhZmUgdG8gaW5jbHVkZSB0aGVyZS4KPgo+IEZpeGVzOiA4NmMwMWE3M2Zm
OWQgKCJsaWI6IHNiaTogQXZvaWQgR09UIGluZGlyZWN0aW9uIGZvciBnbG9iYWwgc3ltYm9sIHJl
ZmVyZW5jZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3
LmNvbT4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhh
bmtzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfdmlzaWJpbGl0eS5oIHwgMiArKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9zYmkvc2JpX3Zpc2liaWxpdHkuaCBiL2luY2x1ZGUvc2JpL3NiaV92aXNpYmlsaXR5LmgKPiBp
bmRleCBlOWM0MDFjLi5mOTAwYzQ0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV92aXNp
YmlsaXR5LmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfdmlzaWJpbGl0eS5oCj4gQEAgLTcsMTAg
KzcsMTIgQEAKPiAgI2lmbmRlZiBfX1NCSV9WSVNJQklMSVRZX0hfXwo+ICAjZGVmaW5lIF9fU0JJ
X1ZJU0lCSUxJVFlfSF9fCj4KPiArI2lmbmRlZiBfX0RUU19fCj4gIC8qCj4gICAqIERlY2xhcmUg
YWxsIGdsb2JhbCBvYmplY3RzIHdpdGggaGlkZGVuIHZpc2liaWxpdHkgc28gYWNjZXNzIGlzIFBD
LXJlbGF0aXZlCj4gICAqIGluc3RlYWQgb2YgZ29pbmcgdGhyb3VnaCB0aGUgR09ULgo+ICAgKi8K
PiAgI3ByYWdtYSBHQ0MgdmlzaWJpbGl0eSBwdXNoKGhpZGRlbikKPiArI2VuZGlmCj4KPiAgI2Vu
ZGlmCj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
