Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2709ECAC587
	for <opensbi@archiver.kernel.org>; Tue, 16 Sep 2025 04:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFD6Jl8P7aBD3XuV7Bbo3efMm8YkxVyCWjkr45YbFy4=; b=CnAxXmProcax/V
	6XtGnOxdpm/nm8djme3cq5/ytHFyQdYMY4RccMuNhWWRL3wjVZOeYdtqh+dt74roqD/4feCZv7AP1
	ThZbgiQsHL0J/OgsIYQVXsN6SsRQvJTWKUAyhNOg0kv46ctyT0rivwsHp8o5GIsb8DymSmxd3rYlf
	RTceqtLhoUddZJV18Y4luUF+CqrvGrjmX/WVCLx/JQ4xhrqB9Q5ZNyXy4VwDF+aq+77qrg0IZqWBY
	u8yZ3yMpRBnhrLv9dKfn9PKo0+MNX3Y6lgU8JpYwHvG5Tuk4Oj6VM6smliD0DKB7jXOXfP4Dzg7Po
	Ds9X42ORTBaN8CUbWgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNFd-00000006gvA-1nLi;
	Tue, 16 Sep 2025 04:25:09 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNFa-00000006gu1-1Cxd
	for opensbi@lists.infradead.org;
	Tue, 16 Sep 2025 04:25:08 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-42307b9811bso21243745ab.2
        for <opensbi@lists.infradead.org>; Mon, 15 Sep 2025 21:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757996705; x=1758601505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h41ppLU142ShDZyphoUYqqgfuB5/k7HWqhY0WoNqdU=;
        b=itmKdM9FYIY2eWYaHS6qa60ubn5rRf74yynmr+wQfUx+w8J3V3mURzgOiJ3HL7TcyV
         inOC9XItWjeifu54gQq+aA/JHKKzNFBvWEThJpwcb4I7CNUCdmAns8+5Z2orPGIm+4hr
         mNrVKQD6VbBDUlpPue0XeNePq68QPjVhVSWQ7HNbHL4ekxJCp1KjSQz5ibpoxv8PF03p
         FbHonlKp+f/oobJyrPsTU1PU2/0HO2fOpEN2sHdMvFesQSTpA9OcxsbYuksQmuFDzkUQ
         8U52r20a6PQqxk1P+pDwQI9QW617Qd8kVwY8cQNBIeCAZHZSjnzSB6oz8CAnj0chLDtr
         ABdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757996705; x=1758601505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h41ppLU142ShDZyphoUYqqgfuB5/k7HWqhY0WoNqdU=;
        b=TY0aeApE2BcudFcTxzw1zES7zGo9LgeMqMFdKp9Ed8ymZ1j22PGHOI1RKEUy9fGWv3
         lGjSEqHsBDh9bXUOLkzciqUapkXj3SheyK8gQgzzJNvF8cZdkJ96jXBXs9/hw9hGFrfh
         tOn6wSdXO0PQ8v81xXqT6O4s/dWSlDzteYmbpZhDrM6kX5ywZqZ5bsYtSM+QRkI5vZmf
         ML4uNqcMnxiihlvgd9gl7skjWDY4+gAkMw4bFfracPKgHRSwt411BEtjNb7jrZQdr4IS
         VOjXLfhc6qrDeIwJHfKy806zAySYxrqWYNg6YV/nq0d+/2I34qX5kuEX2iLmxyjUjxpH
         uwbg==
X-Gm-Message-State: AOJu0Yw7XydJc485Tl1GMAdGfPb88XAw6lC5yI0fHOaxU3W88r44UFqV
	468VrSrj8f0FGQXL1Pr7rJ8wfZNwn9iBb8f64gt0DxQl8WEGO1RfpVJ9YTwznpP6Hx+pn4ftcXa
	cAOKVlbb3magPTXq/w8wPZBH+9UUgPa0Rvv54z6n5Og==
X-Gm-Gg: ASbGncu2voeoJyjkjFAJEzKsFEE5cDHljU60KFPy4wWs7rVjJWHEUIZlrNM9n9HELLF
	47bv99QUKL/tcd4dPzfvPF5pTTuxatfx48RoM4SwgWZwvUowW8zF5JwnMUwpLOIcA0/7zSkcKMz
	W31EeuIjXHR+N0piGfwkGcG8kNUMfI9oCLfIpOM2XFch73qxy7C9hAevB26UvAIdYMXyRzNXMHN
	IBWRFvuRpFP0fmDZvAys0VcwURqBYzZJa8ecMyKbzxfWLi2VzM=
X-Google-Smtp-Source: AGHT+IHHHcRJuaxWZMEwvQKBfUc5b/kVg+eB7siU+X4aVgshTa2k2gzFAQ4DBek0frHb/rW9xS//FQGsL0n4rETDtRA=
X-Received: by 2002:a05:6e02:378e:b0:403:c8eb:8782 with SMTP id
 e9e14a558f8ab-420a42688e3mr150334115ab.25.1757996705079; Mon, 15 Sep 2025
 21:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250903144323.251270-1-rpathak@ventanamicro.com>
In-Reply-To: <20250903144323.251270-1-rpathak@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Sep 2025 09:54:53 +0530
X-Gm-Features: AS18NWDAg_EnVqEQslPCEMM1mGdLG97jNdQOTkQNHeCAOTg5Eg5Mf3DdWex5_Rs
Message-ID: <CAAhSdy1oKFePfgreQzhrPt1onaRY5DVAVU0SJpeUk-Ha-iWt4Q@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/reset: Hang the hart after RPMI system reset message
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_212506_484558_F69E07D8 
X-CRM114-Status: GOOD (  16.26  )
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

T24gVGh1LCBTZXAgNCwgMjAyNSBhdCAxMjo0OOKAr0FNIFJhaHVsIFBhdGhhayA8cnBhdGhha0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFJQTUkgc3lzdGVtIHJlc2V0IGlzIGEgcG9zdGVk
IG1lc3NhZ2Ugd2hpY2gKPiBkb2VzIG5vdCB3YWl0IGZvciBhY2tub3dsZWRnZW1lbnQgYWZ0ZXIg
c2VuZGluZwo+IHRoZSBSUE1JIG1lc3NhZ2UgdG8gUHVDLiBDYWxsIHRoZSBzYmlfaGFydF9oYW5n
KCkKPiB0byBoYW5nIHRoZSBoYXJ0IGFmdGVyIHBlcmZvcm1pbmcgdGhlIHN5c3RlbSByZXNldAo+
IHZpYSBSUE1JIG1lc3NhZ2UuCj4KPiBGaXhlczogNmEyNjcyNmUwOGU0ICgibGliL3V0aWxzOiBy
ZXNldDogQWRkIFJQTUkgU3lzdGVtIFJlc2V0IGRyaXZlciIpCj4gUmVwb3J0ZWQtYnk6IEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFBh
dGhhayA8cnBhdGhha0B2ZW50YW5hbWljcm8uY29tPgoKSSBhc3N1bWUgbm8gZnVydGhlciBjb25j
ZXJucyBvbiB0aGlzIHBhdGNoIGhlbmNlIG1lcmdpbmcgaXQuCgpBcHBsaWVkIHRoaXMgcGF0Y2gg
dG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgbGliL3V0
aWxzL3Jlc2V0L2ZkdF9yZXNldF9ycG1pLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9y
cG1pLmMgYi9saWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3JwbWkuYwo+IGluZGV4IGVkYzUzOTMy
Y2NjMC4uYzI5NzE1ZDMyOWM0IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9yZXNldC9mZHRfcmVz
ZXRfcnBtaS5jCj4gKysrIGIvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9ycG1pLmMKPiBAQCAt
Nyw2ICs3LDcgQEAKPiAgICogICBSYWh1bCBQYXRoYWsgPHJwYXRoYWtAdmVudGFuYW1pY3JvLmNv
bT4KPiAgICovCj4KPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydC5oPgo+ICAjaW5jbHVkZSA8c2Jp
L3NiaV9lcnJvci5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9zeXN0ZW0uaD4KPiAgI2luY2x1ZGUg
PHNiaS9zYmlfY29uc29sZS5oPgo+IEBAIC01Niw2ICs1Nyw4IEBAIHN0YXRpYyB2b2lkIHJwbWlf
ZG9fc3lzdGVtX3Jlc2V0KHUzMiByZXNldF90eXBlKQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAg
ICAgICAgICAgICAgc2JpX3ByaW50Zigic3lzdGVtIHJlc2V0IGZhaWxlZCBbdHlwZTogJWRdOiBy
ZXQ6ICVkXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0X3R5cGUsIHJldCk7
Cj4gKwo+ICsgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ICB9Cj4KPiAgLyoqCj4gLS0KPiAyLjQ4
LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
