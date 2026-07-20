Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0491C44515
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 08:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZzwzHEgk9PMfkBBfunK3onuByPMSbxGFD8i+gwpSuI=; b=uQd6EOpu8pnw9X
	WE9ILGhVdx/1qfCCaGHvah3sTYaUUiSt5XH5QVo63oGhV/c1y/R9Lt4I3YrvaiEhAt5u2hoJUAGiO
	x4kkfbJF7aFJZd4SS/i+ls6U1vYDSNJCtJ0ncGeV0ZOcloUpLVRop7NDUfP2Y47twWeWRwieiqWis
	K+eBKYlZJFZzjOvTJwm5fb3H3hfwMLb64JV02K0+u8RFR45YqhADCCgduZgU3lS0eJColU5zW0pjk
	AlDoqmzhD/qgj+ASJh4QBQ6ASzztxSnpFOja3j3OgK6wc4ObAN8gYxFrQLbq02UhIFuqFFnYr2zhJ
	PevqTR4bbJm7/lCI+fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljZZ-00000006DoE-3PcO;
	Mon, 20 Jul 2026 08:42:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljZX-00000006DnJ-2AfY
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 08:42:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4798bea72f9so5070568f8f.1
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 01:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784536918; cv=none;
        d=google.com; s=arc-20260327;
        b=sMC8P/uNuEN26BGB5hNMgejYAs7j5TYv/ti7BHAyWLC+AX9BGYMOLr2rKBk/Zl879N
         hEGx8afEoR8ue4hAczy8A4+7z1KEz2q4KfyRofCvBALPxPVwYIQw1Sf1BBXezSMpEoT0
         C+6GY2o2SfjJJzdeYJG+PaWQH+AJi6YEffNtbKEkvmA9pilDOyHq5QX6yKbb6bKuKXsk
         FpkwiS6/U1IuU6q/WVDy2sh+uADaEBuGlJSR0PjBBXBxDJKObZwSbVDUOZpc71zajQZD
         h1tDAUSgPdxifxWWeeHqH10yN4sYx773nR6kspIc9sTZavnuCwedoIWVc+NnMa7/ySE3
         lVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTpNGWql0PNhx2VIDvNJUszm7GpIMXdFya61Ji2biIw=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=UNHfS4w0iQpCdX7E2LzXBqlGo2CfRKxnOVB1m3D13UCRjhhyYjvxA7lWIw710pSXLn
         AXQWsDNDGLjCDAUd/6grJS3RHUcZm98b/4pLWOZcBnhvrna8ABg7Yn2DHORrZjrMVcEQ
         cu5lSKoTUoeW4OV8ytj/P/HrssLqFojVpOCGQRUmPJs0jUL9nC9IO/oTazFzA+5/LzrD
         pwN2IGg5vpOmvO3mqyXMp1ADPcL1TZXApJADQZ/1mG2ERB5Zv5f3JqrhI7TZ+M1yQxo8
         2OObnlkUz9XJc9LYunVWeslDImTUcKyTYTQZJn6OgWlPgvod84swxHzTTGrQMhrjWG3/
         qYWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784536918; x=1785141718; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTpNGWql0PNhx2VIDvNJUszm7GpIMXdFya61Ji2biIw=;
        b=pOsfBFge4cFCwn1QEFRnCyXVu9kKFAJ2IZmxCxHZX23ahQcPl/qV7m1WS3Zpdzh7Nf
         /ulGqWrXwNcTUokGjIJBu5F1xxu7KRxZnVuWqY9Vdy4GrmmrSP2zbk9guym/uWiBNaPP
         weOuNcgHfevdVuk90XXDKvGLDoTQ0lD6Vh7Jckn614nNSws3ooXAcK4SR9lPptrkVeUj
         WF15rHr9Ndg8LIDznAGOpszoJD6X4pXQmUPCXABEkika9WDN9kVsxd7P5E9vnv6pgx6g
         FUTzJB6zJW3rWdjsLa0afOwTHJaJ+OZ2Xb0/uUVGuATwllrUg1c8E5kJvd57ITXEu2Cg
         LmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536918; x=1785141718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTpNGWql0PNhx2VIDvNJUszm7GpIMXdFya61Ji2biIw=;
        b=DJ8M3TfkxqLZk6JatEq/S+S/2P2DpZT+IKPRgNQ7ExLOXpiL5iL+1eCD7MdhbylYhh
         svir88WfTm9ffkpAHN1j/vq4R9nvTsHuYd1ejmef+Cm2SkG31jsaltHuk1febRi0G5ta
         QUO3/L+yD2x7QGX6hAiM5y1b1YFKIIgkt9J2+ijgQxl/YMaj58G2RwoQOWqn850BAGxj
         QzT9QgTYN79xIN8PIRjjmVsGeJiJ/4BkJylr62Gx2RcH0XD82/BjTB8mxqcBMyDOwqc/
         Z4aUT6aBq8UIlMOtz+3eOlBNM1kfalpUn1V7UXDF06RPAJhvqc6iSyF+zMI9HpxoL0sG
         /mVA==
X-Gm-Message-State: AOJu0Yw7+VeHCW79Eq3FyMhAYnU0T8GjEvUrcaHm5j+z9m6s1ONcm1Hj
	9DImyKmbXTurE1qCBamEz5lvN8SjR+W8TlqPQ3U7l9xwpdAKxQgj9mbp+JpPebyFlLSCb2i9a4D
	PqTH+E3mgEmDMm3NZTKCvLaPhxWN35oZT2iWGo5cL5g==
X-Gm-Gg: AfdE7cmg62sC/wdpm7e9ap4YVttBvCapr9WP/IEQ+xtV0CPgPieT+tAeiIH3FlX/w6z
	KAZv8SWWWn/jYbBNLZM+4aB9z8fhI4QOD3+PRgaVmY5areP124XrNKE97OYnCjEvTAmYtH6Zt/V
	Nn+LI+rsOsmCM13QhPuaZ4wRSREYGE1HNI0jdZekwy7aNAtXxs8rI14NdBTe1cGkhUT9Dkk1Kx4
	TV7vHzEEBLqhSMK1ESc6edlP87ik06OIr5wtKh7tZdou9bi+woMoklskUMh94Vkaqzuo9Evl5hb
	6osFAF3dRYee+i+QOdfqL7DGI9mbE5dxJYE6hJEHMAFIx/nX68YKvyj1ehFcDA17stCd50a+f4i
	b8lL0Og==
X-Received: by 2002:a05:6000:2681:b0:47f:7526:598 with SMTP id
 ffacd0b85a97d-47f7526063bmr4753199f8f.12.1784536917651; Mon, 20 Jul 2026
 01:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260519203331.2773185-1-raymondmaoca@gmail.com>
In-Reply-To: <20260519203331.2773185-1-raymondmaoca@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Jul 2026 14:11:45 +0530
X-Gm-Features: AUfX_myJO4iuuN5fb86SsQrhkkhAAPrjAOGuRzmyV0vkTzLQMjwWAhCpC451aJk
Message-ID: <CAAhSdy1i+1oxkP5XdMJCzjgze3sZ0SSxZ-jzcFJSNPHQfSjm-Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add WorldGuard hwiso support
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_014159_569888_942AE190 
X-CRM114-Status: GOOD (  17.87  )
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMjowM+KAr0FNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0By
aXNjc3Rhci5jb20+Cj4KPiBUaGlzIHNlcmllcyBhZGRzIFdvcmxkR3VhcmQgaW1wbGVtZW50YXRp
b24gZm9yIE9wZW5TQkkgb24gdG9wIG9mIHRoZQo+IGdlbmVyaWMgaGFyZHdhcmUgaXNvbGF0aW9u
IChIV0lTTykgaG9va3MuCj4KPiBUaGUgZ29hbCBpcyB0byBsZXQgT3BlblNCSToKPiAtIHByb2dy
YW0gcGxhdGZvcm0gV29ybGRHdWFyZCBjaGVja2VyIHN0YXRlIGF0IGJvb3QKPiAtIHBhcnNlIHBl
ci1kb21haW4gV29ybGRHdWFyZCBtZXRhZGF0YSBmcm9tIHRoZSBkZXZpY2UgdHJlZQo+IC0gcmVw
cm9ncmFtIGhhcnQgV29ybGRHdWFyZCBydW50aW1lIHN0YXRlIGR1cmluZyBkb21haW4gdHJhbnNp
dGlvbnMKPgo+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHRhcmdldHMgdGhlIFdvcmxkR3Vh
cmQgbW9kZWwgb2YKPiBgc2lmaXZlLHdnY2hlY2tlcjJgIGNoZWNrZXIgcGx1cyBwZXItaGFydCBh
bmQgcGVyLWRvbWFpbiBXb3JsZEd1YXJkCj4gbWV0YWRhdGEgZnJvbSBEVC4KPgo+IFRoZSBzZXJp
ZXMgaXMgb3JnYW5pemVkIGFzIGZvbGxvd3M6Cj4gMS4gYWRkIHRoZSBXb3JsZEd1YXJkIENTUiBk
ZWZpbml0aW9ucyBhbmQgaGFydCBleHRlbnNpb24gZmxhZ3MgbmVlZGVkCj4gICAgdG8gZGV0ZWN0
IHN1cHBvcnQgZm9yIE1MV0lELCBNV0lEREVMRUcsIGFuZCBTTFdJRAo+IDIuIGRvY3VtZW50IHRo
ZSBIV0lTTyAvIFdvcmxkR3VhcmQgZGV2aWNlLXRyZWUgbWV0YWRhdGEgdXNlZCBieSB0aGUKPiAg
ICBjdXJyZW50IGltcGxlbWVudGF0aW9uCj4gMy4gYWRkIGEgUUVNVSB2aXJ0IERUIG92ZXJsYXkg
dGhhdCBkZXNjcmliZXMgZG9tYWluIFdJRC9XSUQgbGlzdAo+ICAgIGFzc2lnbm1lbnQgYW5kIGNo
ZWNrZXIgcGVybWlzc2lvbiBwb2xpY3kgZm9yIHRoZSBjdXJyZW50IHRlc3QgZmxvdwo+IDQuIGFk
ZCBnZW5lcmljLXBsYXRmb3JtIFdvcmxkR3VhcmQgcnVudGltZSBzdXBwb3J0IHRvZ2V0aGVyIHdp
dGgKPiAgICBgd2djaGVja2VyMmAgY2hlY2tlciBwYXJzaW5nIGFuZCBib290LXRpbWUgTU1JTyBw
cm9ncmFtbWluZwo+IDUuIGFkZCBnZW5lcmljIEhXSVNPIFNCSVVOSVQgY292ZXJhZ2UKPiA2LiBh
ZGQgUUVNVSB2aXJ0IFdvcmxkR3VhcmQgbWVjaGFuaXNtLXNwZWNpZmljIFNCSVVOSVQgY2hlY2tz
IGZvcgo+ICAgIGJvb3QtdGltZSBjaGVja2VyIHByb2dyYW1taW5nIGFuZCBydW50aW1lIENTUiBz
dGF0ZQo+IDcuIGFkZCBhIFFFTVUgdmlydCBmYWlsdXJlLW1vZGUgU0JJVU5JVCB0ZXN0IHRoYXQg
aW50ZW50aW9uYWxseQo+ICAgIHRyaWdnZXJzIGEgZGVuaWVkIFdvcmxkR3VhcmQgYWNjZXNzIGFu
ZCB2ZXJpZmllcyB0aGUgZXhwZWN0ZWQgdHJhcAo+Cj4gTm90ZXM6Cj4gLSBUaGUgaW1wbGVtZW50
YXRpb24gaGFzIGJlZW4gdmVyaWZpZWQgd2l0aCBRRU1VIHZpcnQgdGhhdCBzdXBwb3J0cwo+ICAg
YHdnPW9uYFsxXS4KPiAtIFRoaXMgc2VyaWVzIGRlcGVuZHMgb24gcHJldmlvdXMgcGF0Y2hlcyAo
WzJdIGFuZCBbM10pIGZvcgo+ICAgaW50cm9kdWNpbmcgSFdJU08gZnJhbWV3b3JrLgo+Cj4gWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9jd3NodS9xZW11L3RyZWUvcmlzY3Ytd2ctZHRzCj4gWzJdIFtQ
QVRDSCAxLzJdIHNiaTogYWRkIGhhcmR3YXJlIGlzb2xhdGlvbiBhYnN0cmFjdGlvbiBmcmFtZXdv
cmsKPiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDUwNDE3Mzk0OC4x
NjYzODIzLTEtcmF5bW9uZG1hb2NhQGdtYWlsLmNvbS8KPiBbM10gW1BBVENIIDIvMl0gc2JpOiBy
b3V0ZSBkb21haW4gbGlmZWN5Y2xlIHRyYW5zaXRpb25zIHRocm91Z2ggaHdpc28gaG9va3MKPiAg
ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDUwNDE3Mzk0OC4xNjYzODIz
LTItcmF5bW9uZG1hb2NhQGdtYWlsLmNvbS8KPgo+IFJheW1vbmQgTWFvICg3KToKPiAgIGhhcnQ6
IGFkZCBXb3JsZEd1YXJkIENTUiBJRHMgYW5kIGhhcnQgZXh0ZW5zaW9uIGZsYWdzCj4gICBkb2Nz
OiBkb2N1bWVudCBod2lzbyBXb3JsZEd1YXJkIERUIGJpbmRpbmdzCj4gICBbTk9ULUZPUi1VUFNU
UkVBTV0gcGxhdGZvcm06IHZpcnQ6IGFkZCBRRU1VIFdvcmxkR3VhcmQgaHdpc28gb3ZlcmxheQo+
ICAgcGxhdGZvcm06IGdlbmVyaWM6IGFkZCBXb3JsZEd1YXJkIGh3aXNvIHN1cHBvcnQgd2l0aCB3
Z2NoZWNrZXIyCj4gICB0ZXN0OiBhZGQgZ2VuZXJpYyBod2lzbyBTQkkgdW5pdCBjb3ZlcmFnZQo+
ICAgcGxhdGZvcm06IHZpcnQ6IGFkZCBRRU1VIHZpcnQgV29ybGRHdWFyZCBod2lzbyB0ZXN0cwo+
ICAgcGxhdGZvcm06IHZpcnQ6IGFkZCBXb3JsZEd1YXJkIEhXSVNPIGZhaWx1cmUtbW9kZSBTQklV
TklUIHRlc3QKCkkgd2lsbCBjb25zaWRlciB0aGlzIHNlcmllcyBzdXBlcnNlZGVkIGJ5ICJBZGQg
UklTQy1WIFdvcmxkcyBJU0EKc3VwcG9ydCB0byBPcGVuU0JJIiBwb3N0ZWQgYnkgWXUtQ2hlaW4g
UGV0ZXIgTGluIChTaUZpdmUpLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
