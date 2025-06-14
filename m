Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED45C7114A
	for <opensbi@archiver.kernel.org>; Sat, 14 Jun 2025 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfN+k6KYHshNGCz5q7v77108dr8jxxp8BBJ6jytofJY=; b=zYRDQ5TgLy33a0
	U3Jrp3xEEH63rVxBJnS/lbNn9j8keWFEo283sbS8SyKHMBreQbnbO4doUo9/hVR11JspOoo8mD+LX
	3mKo86Lp44+rti2Y48JBXXTGMlMHFv/oS62XQfhwG/wcdx13l1st46i7XK1Vx3pm88DNYMHxEpQxn
	et09jodzCitsihYVhXzyJ0k8lO1qCx80cMFKd+vkoQiDo+4tZzZcArXp98M/SDQ0ETFUKGzZd4J/k
	Q5mtzK2/t+KjtXbze5bx+52/71QwUUx38VOJDB6x5BSCMT7+olzoJZus0voVnLtbikPLr9/ovJDD7
	zJqWEkfOWWZ0vzqCea3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQM3J-00000000yLZ-3vTi;
	Sat, 14 Jun 2025 08:15:49 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQLPT-00000000u3Q-1cte
	for opensbi@lists.infradead.org;
	Sat, 14 Jun 2025 07:34:40 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso11834445ab.2
        for <opensbi@lists.infradead.org>; Sat, 14 Jun 2025 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749886478; x=1750491278; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9V3xrOoiXVGABWQpu94B1KkgND/NC+ksgqjdwiBgCY=;
        b=egJtl03f1EZZc0DO/fb6sCGA7LiAxyXLWrIzUtdsL5pU1sP7hXndYaEtberTCoiq9y
         PDgu6oSKUMWPG8ocbeiOiuwMltL+50MCxSuiWOJG5Bvpuc7b5q+2moEcArbHhnN+JM4q
         xZQlJSY0xK7okat6uSccLaTTM52a5yv14A3g0IxEWkbu/TIgzIxckL9oSXyMK7uSDLvy
         MwlQx2/1bIg2n9ubei0i+dZclz7Otx+Mgoy9l5PZ7ZAu8RC6hU64tl/c3k9c8nG9cJ2j
         ipanXO9I/0p8n96lK+SpCDkbK1MX0ff5S9ZTzV16rT1bfRrltr0/ntyxNW5twqij5NDi
         YKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749886478; x=1750491278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9V3xrOoiXVGABWQpu94B1KkgND/NC+ksgqjdwiBgCY=;
        b=gkU1Mv5JBpBldSouhjfowgrPMuJwSPqIjyTwq86njvM4F+Q/PS3SaDFbtKMOtUFj2x
         2s2xO21j0HX924H6ZIMeYP4RGbbGg2YtDaLGXUj2OuI0qAWXcEAqnBDg3Sac26OZULT3
         nXg3bMol+QxHVyOo6K1taYzFmCtn7TwMLn8ELBJi700h9I/EXkc5lRBntQvMws22BdVa
         GcYEzYY8MkM4jfmwU1q/M4CAfhSMe1NN//0Ls0Qg0Ti9IXzPcWRLdWGhfUhyeywCLARL
         D353WDD52HLdvwgrtE14KQy0NTLwiKLM/1bFwZyGULXefjGjoBAt32ToyNsn3fOUSSTE
         N/ng==
X-Gm-Message-State: AOJu0YwcaPqoEmtEwqkbMKe3cKfItrQg0WzWpDrbHCn0zFEKr0VbMlqO
	z15P9J0A5uOTU3DsXqCHZYND0JoTY33Si3qMGnDMhX0tHzNZZqlwgk2lgWSUaoFeWMZGwD7Q6BZ
	ODSAJbCYq1StSQbATLqoI9sY/ife2HTjsQP+BP0H4cuui3+xTM4sE
X-Gm-Gg: ASbGncuNzFSUQ8XWuTKN0tTmD5j6qpiyJEXikZ6EY1ueNCzvbZMVDjBGmZBcrv1TabS
	VwSW6UxNPyB+Ax6DFVySAT9tHkBx1aymlQR3g+f3X86w5zdiU6LtnBlI6WL3zTqfoSFVmk5L8T8
	HynamE7oK4c7KHz8Ahu6+LKS1b9uA/MH/OgaXhFj3JBxXS
X-Google-Smtp-Source: AGHT+IG03huYBs23RDCFKLn6FsjauUsUoCpuL1AyNdL4/BELsqOv55ZGUZ9fQfqHNCDEPRaEBTodLXYY8uZIH1kaF6E=
X-Received: by 2002:a05:6e02:1647:b0:3dd:c946:a273 with SMTP id
 e9e14a558f8ab-3de07cb637emr24492005ab.9.1749886478466; Sat, 14 Jun 2025
 00:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250430-improve_llvm_building-v1-1-caae96cc6be6@rivosinc.com>
In-Reply-To: <20250430-improve_llvm_building-v1-1-caae96cc6be6@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Jun 2025 13:04:26 +0530
X-Gm-Features: AX0GCFudEzLRnHiTVSGWhsE9_0MSct3w5piWxIBVTUSAxfA6CV6aS2zZ-1dqBIs
Message-ID: <CAAhSdy3LxFnPhG7GyNzEuC3qssreQ3BYDJTt-+UCmo-9gumWCA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Make $(LLVM) more flexible
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_003439_667950_61141CD1 
X-CRM114-Status: GOOD (  18.55  )
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

T24gVGh1LCBNYXkgMSwgMjAyNSBhdCA1OjA54oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBJbnRyb2R1Y2UgYSB3YXkgZm9yIGRldmVsb3BlcnMg
dG8gZWFzaWx5IHN3aXRjaCBiZXR3ZWVuIExMVk0gdmVyc2lvbnMKPiB3aXRoIExMVk09L3BhdGgv
dG8vbGx2bS8gYW5kIExMVk09LXZlcnNpb24uIFRoaXMgaXMgYSB1c2VmdWwKPiBhZGRpdGlvbiB0
byB0aGUgZXhpc3RpbmcgTExWTT0xIHZhcmlhYmxlIHdoaWNoIHdpbGwgc2VsZWN0IHRoZSBmaXJz
dAo+IGNsYW5nIGFuZCBsbHZtIGJpbnV0aWxzIGF2YWlsYWJsZSBvbiB0aGUgcGF0aC4KPgo+IFNp
Z25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+ClRlc3RlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0
byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgTWFrZWZp
bGUgIHwgMTQgKysrKysrKysrKy0tLS0KPiAgUkVBRE1FLm1kIHwgMTIgKysrKysrKysrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXggZTkwODM2YzdjNGFkMTZjMzBk
NGQ4MDY0OWZmOGIyMjg0MTMxOTBhZC4uMzdkNGNmNDFhMjIxNGUwYTgyOWYxZDRhNTNmM2Y0Zjlh
ZTA5ZWU0MSAxMDA2NDQKPiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01ha2VmaWxlCj4gQEAgLTEw
NCwxMCArMTA0LDE2IEBAIGVuZGlmCj4KPiAgIyBTZXR1cCBjb21waWxhdGlvbiBjb21tYW5kcwo+
ICBpZm5lcSAoJChMTFZNKSwpCj4gLUNDICAgICAgICAgICAgID0gICAgICAgY2xhbmcKPiAtQVIg
ICAgICAgICAgICAgPSAgICAgICBsbHZtLWFyCj4gLUxEICAgICAgICAgICAgID0gICAgICAgbGQu
bGxkCj4gLU9CSkNPUFkgICAgICAgICAgICAgICAgPSAgICAgICBsbHZtLW9iamNvcHkKPiAraWZu
ZXEgKCQoZmlsdGVyICUvLCQoTExWTSkpLCkKPiArTExWTV9QUkVGSVggOj0gJChMTFZNKQo+ICtl
bHNlIGlmbmVxICgkKGZpbHRlciAtJSwkKExMVk0pKSwpCj4gK0xMVk1fU1VGRklYIDo9ICQoTExW
TSkKPiArZW5kaWYKPiArCj4gK0NDICAgICAgICAgICAgID0gICAgICAgJChMTFZNX1BSRUZJWClj
bGFuZyQoTExWTV9TVUZGSVgpCj4gK0FSICAgICAgICAgICAgID0gICAgICAgJChMTFZNX1BSRUZJ
WClsbHZtLWFyJChMTFZNX1NVRkZJWCkKPiArTEQgICAgICAgICAgICAgPSAgICAgICAkKExMVk1f
UFJFRklYKWxkLmxsZCQoTExWTV9TVUZGSVgpCj4gK09CSkNPUFkgICAgICAgICAgICAgICAgPSAg
ICAgICAkKExMVk1fUFJFRklYKWxsdm0tb2JqY29weSQoTExWTV9TVUZGSVgpCj4gIGVsc2UKPiAg
aWZkZWYgQ1JPU1NfQ09NUElMRQo+ICBDQyAgICAgICAgICAgICA9ICAgICAgICQoQ1JPU1NfQ09N
UElMRSlnY2MKPiBkaWZmIC0tZ2l0IGEvUkVBRE1FLm1kIGIvUkVBRE1FLm1kCj4gaW5kZXggMjc5
NWNjMWE1ZmYwZGY2MmQ4M2E0YjVjMzA2MmZmMmI2ODJkYmNhYi4uZmQ0MGJlMGI0OTg4ODE1ZDhk
MDIzODYyNzFhZWFlYjc4NzU0MTIxNSAxMDA2NDQKPiAtLS0gYS9SRUFETUUubWQKPiArKysgYi9S
RUFETUUubWQKPiBAQCAtMjUyLDYgKzI1MiwxOCBAQCBvcHRpb24gd2l0aDoKPiAgbWFrZSBMTFZN
PTEKPiAgYGBgCj4KPiArVG8gYnVpbGQgd2l0aCBhIHNwZWNpZmljIHZlcnNpb24gb2YgTExWTSwg
YSBwYXRoIHRvIGEgZGlyZWN0b3J5IGNvbnRhaW5pbmcgdGhlCj4gK0xMVk0gdG9vbHMgY2FuIGJl
IHByb3ZpZGVkOgo+ICtgYGAKPiArbWFrZSBMTFZNPS9wYXRoL3RvL2xsdm0vCj4gK2BgYAo+ICsK
PiArSWYgeW91IGhhdmUgdmVyc2lvbmVkIGxsdm0gdG9vbHMgeW91IHdvdWxkIGxpa2UgdG8gdXNl
LCBzdWNoIGFzIGBjbGFuZy0xN2AsIHRoZSBMTFZNIHZhcmlhYmxlIGNhbgo+ICtiZSBzZXQgYXM6
Cj4gK2BgYAo+ICttYWtlIExMVk09LTE3Cj4gK2BgYAo+ICsKPiAgV2hlbiB1c2luZyBDbGFuZywg
KkNST1NTX0NPTVBJTEUqIG9mdGVuIGRvZXMgbm90IG5lZWQgdG8gYmUgZGVmaW5lZCB1bmxlc3MK
PiAgdXNpbmcgR05VIGJpbnV0aWxzIHdpdGggcHJlZml4ZWQgYmluYXJ5IG5hbWVzLiAqUExBVEZP
Uk1fUklTQ1ZfWExFTiogd2lsbCBiZQo+ICB1c2VkIHRvIGluZmVyIGEgZGVmYXVsdCB0cmlwbGUg
dG8gcGFzcyB0byBDbGFuZywgc28gaWYgKlBMQVRGT1JNX1JJU0NWX1hMRU4qCj4KPiAtLS0KPiBi
YXNlLWNvbW1pdDogMzE2ZGFhZjFjMjk5YzI5YWM0NmU1MjE0NWY2NTUyMWY0OGVjNjNiNQo+IGNo
YW5nZS1pZDogMjAyNTA0MzAtaW1wcm92ZV9sbHZtX2J1aWxkaW5nLWNmZjMxOTE4ZTFhNgo+IC0t
Cj4gLSBDaGFybGllCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
