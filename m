Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45CAC83F1A
	for <opensbi@archiver.kernel.org>; Sun, 20 Jul 2025 15:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIeswnMyRuQ6LkI4vmz2ZpWhl3HFClqG5g/RsYATGk8=; b=qXyduufNa0aGlA
	mQlwITYvdBiVIUIjNAlahZp5+ETS+SnroGO2qEGHJqVd3tGJfZQqaJty4N/SBlz7TkBpguab47VBv
	XP7M5Fc6atTFl+ZZdv84dRI4plz6zG80AbNC7FdnZPNgdp0XR2Ps6GzqDQJJzezrGjCUAo2knRFNK
	E81PZE3WlhrZQBdGEW1CzAyysPaBugujbllNyKVuFTNnHxYJTV7ujtgDSqxNwWOl43SPv1rU19rq7
	IX/pq5l5KtHpBeqtdE7bymrG6ZwZk/PFe2/1Y8G//YaBkLilByfsvzAXcBoCY6S99IpqD0NEzRBoc
	9d0HqNN1L9f2SQTZunJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVkN-0000000FROd-3tmN;
	Sun, 20 Jul 2025 15:14:39 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVkL-0000000FROH-0VLL
	for opensbi@lists.infradead.org;
	Sun, 20 Jul 2025 15:14:38 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3df2ddd39c6so15957625ab.0
        for <opensbi@lists.infradead.org>; Sun, 20 Jul 2025 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753024476; x=1753629276; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GERJuFrLAidrtz8j8tJUZ967Ba1eW2GhScxr0W0IgQ=;
        b=UVjb/eu8q2GDGnAwCoPNX2RWbQxgQuXck0vFW5FpJggOVvMSDhMrUDgcJ+2G5UNsgv
         RU6Qgnap4CzbvFjbeBqgbws2f3Q9ymys4ku1jHbRvvn2q0lLIur1A5+uzwZ6cadLeK9t
         Z+zUc8i/1n9zMYZiKscoy7FbcWyakmKNM915EEFhvFu5jNsZCihNXZHeJ3k7bbbFD8Hv
         QKutSXSMhXVz/hTG+1AtXYwm8wHy+/7XPYkpbLu6T19AzFQOeWQuKtvKU8O0pY2if2hT
         XIJQhrTv7AgCHNR03YjRs+pdc9Fza0529+wXk39azv9acuDd2QQ/sjW4FemBdP15DmXD
         a2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753024476; x=1753629276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GERJuFrLAidrtz8j8tJUZ967Ba1eW2GhScxr0W0IgQ=;
        b=KZ17sUqiuGsFw63a09PjnOz6LIHvsZc3qUtvuaG8M/F7jY2zBu2CQW2iCpMS7el4wz
         Ucd4As7Y3QBV7kxFs38F35A1ud+3Gbn4PrVHAJH9De2ZTnraEQdbDIYbevKHzHKhX0aA
         RQVd+K0UkG8uiG5xbrJ6+6MNyxui9xRGph4MBoBhtc6ikLiSW8voWV67FGGr+tF9zX3a
         9AxdKkpikHPoketCNitTp9e3TFvgkLrRfoh8RPuBwDsWZMZ6zis4Frlz4h3hHcF0wwJ7
         TeeviV4kWh+qibDUNInABgI2D/IfQ/4aQzElUwQyQmquBbgSARZw1JoBMRWfBFr+uapR
         jY0g==
X-Gm-Message-State: AOJu0YzRwbosW9Rf0lRbZ9Nm/GvedJrCbVZ8khdIrW8vdFt5+mhDOHnF
	247Kh3GRp5BQsYU9L8dLiFhDP7OUhUjcThwKp2SnnVW4uGdWiJA2GoTLmys/NnIan+cILvZi8h+
	gMXuhVrw3XBkOEZI+FaAoxocIATngeEhpvPDNYSG4Ng==
X-Gm-Gg: ASbGncsJmo7JJwzx+HbBkpv1ytg9UFOByt5ZnLxaY77qMEoyd8MVRIjLg+wvPqS7nwa
	7PjShM5ckjYq3PJhxGcGliC00as7IdyqItXZ9Eugztr+6Ih9PBDqNit5afAJ1Zm2KM6rE1uvhey
	VwCUaXtj0nUM6FkXVjiBECGWOXLVjxfuiGmfTz1GLWfZLP6nkw4XwzgUmjdxNw1X4xhSyER9num
	NenyYrk
X-Google-Smtp-Source: AGHT+IFk44WViP7ZwrJFlyV+GSRhx2fh6OPvxvzmsigwfaCEDy7mpZcxCGLzgwU81uahV9YDbgEVx1qXbMkLd1R5NJQ=
X-Received: by 2002:a05:6e02:3045:b0:3e2:9715:df3e with SMTP id
 e9e14a558f8ab-3e29715dfd6mr123999175ab.18.1753024476223; Sun, 20 Jul 2025
 08:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPVDjQZ1gpf8-u--RBbAL1Y0FfDN2vZ3g=wBw+Bp-8ppuz3HA@mail.gmail.com>
In-Reply-To: <CAFPVDjQZ1gpf8-u--RBbAL1Y0FfDN2vZ3g=wBw+Bp-8ppuz3HA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Jul 2025 20:44:25 +0530
X-Gm-Features: Ac12FXw5mmUV5_Rebz72bqA2AgfzXPBMaap0Y_V5JRcrzGv-ZcVC87_ax0maCoU
Message-ID: <CAAhSdy2YXO3nzT-yM788rn8+qJ=kcEr=wJr-H-mFOtdWjKcu5g@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/serial: Clear LSR status and check RBR status
To: Neo <neopimail@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_081437_246878_F273A05F 
X-CRM114-Status: GOOD (  18.19  )
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

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgMzo1M+KAr1BNIE5lbyA8bmVvcGltYWlsQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBPbiBzb21lIHBsYXRmb3JtcywgcmVhZCBSQlIgd2hlbiBpdCBpcyBlbXB0
eSBtYXkgcmVzdWx0IGluIGFuIGVycm9yLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWkgUGVpIDxuZW9w
aW1haWxAZ21haWwuY29tPgo+IC0tLQo+IGxpYi91dGlscy9zZXJpYWwvdWFydDgyNTAuYyB8IDYg
KysrLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvc2VyaWFsL3VhcnQ4MjUwLmMgYi9saWIvdXRpbHMv
c2VyaWFsL3VhcnQ4MjUwLmMKPiBpbmRleCA4MmZiMTQyYS4uZGRhZTBhYTMgMTAwNjQ0Cj4gLS0t
IGEvbGliL3V0aWxzL3NlcmlhbC91YXJ0ODI1MC5jCj4gKysrIGIvbGliL3V0aWxzL3NlcmlhbC91
YXJ0ODI1MC5jCj4gQEAgLTEzNCw5ICsxMzQsOSBAQCBpbnQgdWFydDgyNTBfaW5pdCh1bnNpZ25l
ZCBsb25nIGJhc2UsIHUzMiBpbl9mcmVxLAo+IHUzMiBiYXVkcmF0ZSwgdTMyIHJlZ19zaGlmdCwK
PiAvKiBObyBtb2RlbSBjb250cm9sIERUUiBSVFMgKi8KPiBzZXRfcmVnKFVBUlRfTUNSX09GRlNF
VCwgMHgwMCk7Cj4gLyogQ2xlYXIgbGluZSBzdGF0dXMgKi8KPiAtIGdldF9yZWcoVUFSVF9MU1Jf
T0ZGU0VUKTsKPiAtIC8qIFJlYWQgcmVjZWl2ZSBidWZmZXIgKi8KPiAtIGdldF9yZWcoVUFSVF9S
QlJfT0ZGU0VUKTsKPiArIGlmIChnZXRfcmVnKFVBUlRfTFNSX09GRlNFVCkgJiBVQVJUX0xTUl9E
UikKPiArIC8qIFJlYWQgcmVjZWl2ZSBidWZmZXIgKi8KPiArIGdldF9yZWcoVUFSVF9SQlJfT0ZG
U0VUKTsKPiAvKiBTZXQgc2NyYXRjaHBhZCAqLwo+IHNldF9yZWcoVUFSVF9TQ1JfT0ZGU0VULCAw
eDAwKTsKPiAtLQo+IDIuMzQuMQo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKVGhlIGNoYW5nZXMgaW4gdGhlIHBhdGNoIGFyZSBmaW5lIGJ1
dCBJIGFtIG5vdCBhYmxlIHRvIGFwcGx5IHRoaXMKcGF0Y2ggYmVjYXVzZSBpdCBpcyBub3QgZ2Vu
ZXJhdGVkIGNvcnJlY3RseS4gUHJlZmVyIGdlbmVyYXRpbmcgcGF0Y2gKdXNpbmcgImdpdCBmb3Jt
YXQtcGF0Y2ggLU0gLUMgLi4uIiBhbmQgcHJlZmVyIHNlbmRpbmcgcGF0Y2ggdXNpbmcKImdpdCBz
ZW5kLWVtYWlsIC4uLiIKClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluYXVsdC5v
cmc+CgpJIGhhdmUgdGFrZW4gY2FyZSBvZiB0aGUgYWJvdmUgcGF0Y2ggZm9ybWF0dGluZyBpc3N1
ZXMgbWFudWFsbHkuCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBv
LgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
