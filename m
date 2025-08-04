Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D734DC88CB9
	for <opensbi@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrD1uaktPOw7UY9MFNXbPTw1wMls0ZyTMfsjwVL18Qk=; b=BU7iGIKqYZ1Qbv
	QKznPioDOtJ+NgHhK+9V4VcrpUMq5jJiVq/gCHPKwfJv2wJLOP3UPzz+RH3SpBbIrlZ7qNNwgaVC2
	OVZOiC7kSsB5nIXN7Wn8AXGgMoHWgYcmVtQoy60YGYlDwnmFsQ0943jeZMjIoGpxnv7RUyQR6LQ+h
	1oTJ/VDQ4M5SUCDL3+eAf/XoaQH+ujt5s7nGZ5B4abs+tx00BC3KSEgO0FDIe0WtSpznV/A1SwHK5
	cmx0nnevA6b+tMjNR7IvP0gfJ0/KEloVqZQfvMhtYGrPLzxf1lyqf5Pb4U5Goz56wVHIgKZ0hAADo
	HQ34ofvzLLYSuYAn/9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsv-00000009zcn-1jWo;
	Mon, 04 Aug 2025 08:49:33 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqhV-00000009y55-1hL5
	for opensbi@lists.infradead.org;
	Mon, 04 Aug 2025 08:37:46 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3d7b135c2so55176175ab.1
        for <opensbi@lists.infradead.org>; Mon, 04 Aug 2025 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1754296664; x=1754901464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rRe4HmtOvHlO8VesBCeYHnXj3TTJliextQ+lZWqpng=;
        b=q3BakIP9sudeQA7AXE06BsEPFlnFyuScwJAoG0IM18Wpgh0SA/M9veM+RsCESKZDdK
         7sbcQnqJ1kDkQ9HOqRH7vt7a0K9qUIfneMdQCVIEmq+no6bYndV4DF50q708LNRZZawS
         Pfnihj7qTaC2H79r85hp8blhtuCOS9s6LFQabw9YnA3RMLIMfXo3yN1ue8doumULDZfq
         8g6TPp0d6qxTgjU9HwCrOrGxEOUAmaVNGCCK34XWuYFzS/At04qpyzSSG2zGvDySYrZq
         N367Khobq3OGOPi2UH9loXYy2GS8ZJBc9eElPxq6n3oc6UITbEMY+apW3p9mpsUYI/QT
         SYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754296664; x=1754901464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rRe4HmtOvHlO8VesBCeYHnXj3TTJliextQ+lZWqpng=;
        b=hqYzKsBvdkbGYKWqHAufPzOcKpwfnlqMs2zXuBmRDQf3sx1UQ/obipwZJ4ctFyhR+K
         No4xy2SxiQYrh2SIJP+D7yPl7297Rh3I5n7318Cu2DIfpRSDsjDxUMBxnc3c8i7o4MiI
         o4P7fOp6VyqjNGfsJNT/vj/ly/OsEW7/KnDWTmyIy3BVRozuvLRufrLJuxx5WEky3wu/
         20ZtxDeOLC0rZ2CJxkLfUVvlVTiu4d2sEYgFKd1GTCokkH7+zIM8QzVCNhgSBKzf9ILL
         6EEzuHOUgBPknzXNDir8zonE/xZi+NB/th5Y19r8Nf7brK7H3F9QWisMDOHIXjNHGzgo
         1XhQ==
X-Gm-Message-State: AOJu0YxACvTtFAw7L5262S1UldQYkqggToLQneeZzq0BGS/isaR2BDmD
	SzpXdP3kJcWs83jrWNC8LQp0Yuf5zbT4fcEXE2bGZx+GfsCOoRwgoY7cK6+rMVJlu0BK67Pm7De
	ChSqO4+zh/AGN5HzJyU5G7phRUafetAyzkK7Gke7MUV803uGe7dTX
X-Gm-Gg: ASbGncuUyxIwtcLkRuStZwGmgzmhjqUPu5c8rUmSihX6y8qt4H2dfx7G1F1mvsmF1xp
	rl3V7G7WwwFmghjDwAjV3EzHbAfwekTNlMgD+M55EWznLNTngiWsdZ9/uFet6dYnntf77zb1M0t
	0tQpTN2eFeD6HBqY/rNmA/FDWj00PL/dsV27AbQLC70Ic8S7K1T3qhbzz+dDtExs+2AQV691K8P
	zvvEvQ=
X-Google-Smtp-Source: AGHT+IEsSiUcLtt6edmQLQF/Vz00kZ6nIiNbbbk6zC+A1dnolRLc1QW0ylrsSOAeK+SL5m9BIWXZiGRb/vmV9xYNR8c=
X-Received: by 2002:a05:6e02:1c23:b0:3d8:2085:a188 with SMTP id
 e9e14a558f8ab-3e41611a1a7mr175426545ab.1.1754296664458; Mon, 04 Aug 2025
 01:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250708074940.10904-1-nick.hu@sifive.com> <20250708074940.10904-6-nick.hu@sifive.com>
In-Reply-To: <20250708074940.10904-6-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Aug 2025 14:07:32 +0530
X-Gm-Features: Ac12FXyY36HcrV9d9Ieo8QB-COoBougqj_Jy5bnsDU9EpRwBv2LX5E0Jjvk-KT8
Message-ID: <CAAhSdy2+zx8NWFQ8O7-qPNpkb7Xu_8VrNha7+JaBskU1L-woDw@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] platform: generic: Add SiFive development platform
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_013745_453699_DA473EA5 
X-CRM114-Status: GOOD (  21.36  )
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
Cc: vincent.chen@sifive.com, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgOCwgMjAyNSBhdCAxOjIw4oCvUE0gTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IEZyb206IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5j
b20+Cj4KPiBUaGUgc2lmaXZlX2Rldl9wbGF0Zm9ybSBpcyBhIG5ldyBwbGF0Zm9ybSB3aGljaCBp
cyBjb21wYXRpYmxlIHRvIHRoZQo+IGdlbmVyaWMgcGxhdGZvcm0gdG8gcGxhY2Ugc29tZSBmZWF0
dXJlcyB3aGljaCBhcmUgb25seSBmb3IgdGhlIFNpRml2ZQo+IGRldmVsb3BtZW50IG1hY2hpbmUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
Pgo+IENvLWRldmVsb3BlZC1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiAtLS0KPiAgcGxhdGZvcm0v
Z2VuZXJpYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrCj4gIHBsYXRmb3Jt
L2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICB8ICAxICsKPiAgcGxhdGZvcm0v
Z2VuZXJpYy9zaWZpdmUvb2JqZWN0cy5tayAgICAgICAgICAgIHwgIDMgKysKPiAgcGxhdGZvcm0v
Z2VuZXJpYy9zaWZpdmUvc2lmaXZlX2Rldl9wbGF0Zm9ybS5jIHwgNDEgKysrKysrKysrKysrKysr
KysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0uYwo+Cj4g
ZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyBiL3BsYXRmb3JtL2dlbmVyaWMv
S2NvbmZpZwo+IGluZGV4IGEyNGQ2YWIyLi4yMGMyNWE4MyAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9y
bS9nZW5lcmljL0tjb25maWcKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcKPiBAQCAt
NDMsNiArNDMsMTEgQEAgY29uZmlnIFBMQVRGT1JNX1JFTkVTQVNfUlpGSVZFCj4gICAgICAgICBz
ZWxlY3QgQU5ERVNfUE1VCj4gICAgICAgICBkZWZhdWx0IG4KPgo+ICtjb25maWcgUExBVEZPUk1f
U0lGSVZFX0RFVgo+ICsgICAgICAgYm9vbCAiU2lGaXZlIGRldmVsb3BtZW50IHBsYXRmb3JtIHN1
cHBvcnQiCj4gKyAgICAgICBkZXBlbmRzIG9uIEZEVF9DQUNIRQo+ICsgICAgICAgZGVmYXVsdCBu
Cj4gKwo+ICBjb25maWcgUExBVEZPUk1fU0lGSVZFX0ZVNTQwCj4gICAgICAgICBib29sICJTaUZp
dmUgRlU1NDAgc3VwcG9ydCIKPiAgICAgICAgIGRlZmF1bHQgbgo+IGRpZmYgLS1naXQgYS9wbGF0
Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdz
L2RlZmNvbmZpZwo+IGluZGV4IDZiMjE5Y2ZiLi40MmU3ZWY3NSAxMDA2NDQKPiAtLS0gYS9wbGF0
Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9j
b25maWdzL2RlZmNvbmZpZwo+IEBAIC0xLDYgKzEsNyBAQAo+ICBDT05GSUdfUExBVEZPUk1fQUxM
V0lOTkVSX0QxPXkKPiAgQ09ORklHX1BMQVRGT1JNX0FOREVTX0FFMzUwPXkKPiAgQ09ORklHX1BM
QVRGT1JNX1JFTkVTQVNfUlpGSVZFPXkKPiArQ09ORklHX1BMQVRGT1JNX1NJRklWRV9ERVY9eQo+
ICBDT05GSUdfUExBVEZPUk1fU0lGSVZFX0ZVNTQwPXkKPiAgQ09ORklHX1BMQVRGT1JNX1NJRklW
RV9GVTc0MD15Cj4gIENPTkZJR19QTEFURk9STV9TT1BIR09fU0cyMDQyPXkKPiBkaWZmIC0tZ2l0
IGEvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvb2JqZWN0cy5tayBiL3BsYXRmb3JtL2dlbmVyaWMv
c2lmaXZlL29iamVjdHMubWsKPiBpbmRleCBkNzVlNDQ0YS4uZDMyZTEyNzMgMTAwNjQ0Cj4gLS0t
IGEvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvb2JqZWN0cy5tawo+ICsrKyBiL3BsYXRmb3JtL2dl
bmVyaWMvc2lmaXZlL29iamVjdHMubWsKPiBAQCAtMiw2ICsyLDkgQEAKPiAgIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gICMKPgo+ICtjYXJyYXktcGxhdGZvcm1fb3Zl
cnJpZGVfbW9kdWxlcy0kKENPTkZJR19QTEFURk9STV9TSUZJVkVfREVWKSArPSBzaWZpdmVfZGV2
X3BsYXRmb3JtCj4gK3BsYXRmb3JtLW9ianMtJChDT05GSUdfUExBVEZPUk1fU0lGSVZFX0RFVikg
Kz0gc2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0ubwo+ICsKPiAgY2FycmF5LXBsYXRmb3JtX292
ZXJyaWRlX21vZHVsZXMtJChDT05GSUdfUExBVEZPUk1fU0lGSVZFX0ZVNTQwKSArPSBzaWZpdmVf
ZnU1NDAKPiAgcGxhdGZvcm0tb2Jqcy0kKENPTkZJR19QTEFURk9STV9TSUZJVkVfRlU1NDApICs9
IHNpZml2ZS9mdTU0MC5vCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUv
c2lmaXZlX2Rldl9wbGF0Zm9ybS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvc2lmaXZlX2Rl
dl9wbGF0Zm9ybS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMC4uYWM2
NTk4NjgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvc2lm
aXZlX2Rldl9wbGF0Zm9ybS5jCj4gQEAgLTAsMCArMSw0MSBAQAo+ICsvKgo+ICsgKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykg
MjAyNSBTaUZpdmUgSW5jLgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxwbGF0Zm9ybV9vdmVycmlk
ZS5oPgo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmg+Cj4gKwo+
ICtzdGF0aWMgaW50IHNpZml2ZV9lYXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+ICt7Cj4gKyAg
ICAgICBpbnQgcmM7Cj4gKwo+ICsgICAgICAgcmMgPSBnZW5lcmljX2Vhcmx5X2luaXQoY29sZF9i
b290KTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsK
PiArICAgICAgIHJjID0gZmR0X2Ntb19pbml0KGNvbGRfYm9vdCk7Cj4gKyAgICAgICBpZiAocmMp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKCldoeSBub3QgY2FsbCBmZHRfY21vX2luaXQo
KSBkaXJlY3RseSBhcyBwYXJ0IG9mIGdlbmVyaWNfZWFybHlfaW5pdCgpID8KCj4gKwo+ICsgICAg
ICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc2lmaXZlX3BsYXRmb3JtX2luaXQo
Y29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKQo+ICt7Cj4gKyAgICAgICBnZW5l
cmljX3BsYXRmb3JtX29wcy5lYXJseV9pbml0ID0gc2lmaXZlX2Vhcmx5X2luaXQ7Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmR0X21hdGNo
IHNpZml2ZV9kZXZfcGxhdGZvcm1fbWF0Y2hbXSA9IHsKPiArICAgICAgIHsgLmNvbXBhdGlibGUg
PSAic2lmaXZlLWRldiIgfSwKPiArICAgICAgIHsgfSwKPiArfTsKPiArCj4gK2NvbnN0IHN0cnVj
dCBmZHRfZHJpdmVyIHNpZml2ZV9kZXZfcGxhdGZvcm0gPSB7Cj4gKyAgICAgICAubWF0Y2hfdGFi
bGUgPSBzaWZpdmVfZGV2X3BsYXRmb3JtX21hdGNoLAo+ICsgICAgICAgLmluaXQgPSBzaWZpdmVf
cGxhdGZvcm1faW5pdCwKPiArfTsKPiAtLQo+IDIuMTcuMQo+CgpSZWdhcmRzLApBbnVwCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
