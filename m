Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AE0D5E393
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m42+LnKA5n/ARWuCZZhNFbt8FhMcZWdXVTG7mVYBJic=; b=bKvz4GhAImCwhh
	pT35cQkvGYIfzAt/7KY87gReZJoesuPiMrU+cPpG32M1jgonLeopyCkeaPtBbi0/6G1vabVvOipPM
	NElBVg11e5HjhAaLhpO+9XPX5nt4PBzFp0a3SKHnkpnpd9ewOpkmrYrbrDSZepmqy8MPRVy2O28HR
	lxHH9CPh347tTnlhmNQGUlJLNSQ/ajCQOFlCiT8wi9LCCjkvqKdim8nHFoDem2Lwy70uKvZ3gn8/e
	/+X/aYgIKWxIdiVkyB6+8vkmAhHWh3hmK94ntbHJV3weQeillZDf1JPQW2LU2bmB7aItSuMQbaf74
	BJJvNoGZV5PEIHn+fgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWKt-00000005Ndr-3H9R;
	Tue, 16 Dec 2025 14:47:35 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWKq-00000005Nbe-3sYG
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 14:47:34 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7c95936e43cso1779264a34.0
        for <opensbi@lists.infradead.org>; Tue, 16 Dec 2025 06:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765896452; x=1766501252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WB4eUOWSdi/OuQ9UpCCmyULtiGgy1OnZ5nTM/tocEbM=;
        b=U1SR5Lo2Z0tiFNTw1ARA7DfYa9MsNxUD5zyVKSQQbM1I4HKgrM2Tl+9MpC723iRaLQ
         dME79A6gIxXGRigL8XR5mjlFtdcV1U+10MGeXteXZf2k+0zXxX/O7wB+DsHSY7Wn70/y
         yRzNvfjgVTf/TZ+aTo4J1SQI84c6DSu5vzNfRbAOd3I8OdEctRNGaLsyOMM4eyALJ9hE
         p/AxN19AfxjODxb6dTy1IQ/XizN2nPSjKxvCkwn2EcFKfHVmPTpA13BSjygDoVLjpRSx
         kyoF2DAzgv3NETCJd79N5iCoPt6YPm1Yrx6hYNeDho/tMZRuOx7OZeXFvgbhVkrfHdzV
         4Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896452; x=1766501252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WB4eUOWSdi/OuQ9UpCCmyULtiGgy1OnZ5nTM/tocEbM=;
        b=NYsWnCtY12iiFZKxXKHyZHfebnV9sREB6Lx+OtrOxUOrYjZZWa1OrJ7LQq66469YCw
         zx6cHalsxxSNwJq5sCWDw37PDVPj8iTzxR4O2Jg/KQoPkxjz/Pv4pkoRIkaUDWJ45K3M
         YRH4O7QdowE3KinoS+UaQtLgqlpcBbMaaajdCB9CsChPzBVR39yb1AabLmRzazcArBWw
         Re+1Kcgag7N9W5U5d9jy0iKDmHn1muCiWuMGGxVVnUJWrLL18oWgRqe859SLIv+MkEdR
         riXhScHv3pxMXL4sXXzAW+duNlA9Ew3GfFNzrTHscTgH6kf8uajGR7+f/5p817ADD93W
         F/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXUFvTDYqQceoc3HVeSHUj6wx4rxEuIJTwK6XmzypJuTNO8AgnySfAXI1VwC97TF2j5LuiAZ0jV@lists.infradead.org
X-Gm-Message-State: AOJu0YydZ3qiN9Uec2qNd978eUDW0liddgdDKzl3g+BFpKKtKUXGoEms
	uZfTsJRjIBl6X2GjMBVNRRS4HXt4jmyvFbrFtLghyLeFiHmuIC0AxWVl6agRzWWdCqidelX6736
	hywAxbEGdWzsFjQxdDBFj1Ocwg9nWTTC8SiSnqsNF2fVcxN2X+1cqe6g=
X-Gm-Gg: AY/fxX5viZbg5TRsnYtwDX2YSeUEpfrH/33wuvXRhntSN4T3y8liiNXk7J4LVBoyLl1
	7vMX1fsbo3++AsxRvoSEaas4XjbhJRCnWU1CZDbzwiNaMLqC1LXfPU9maA9GXyrWRboO72DzJol
	63+mzXyljAhX+lRUH8LPTlBQq7TkpSislF12CDdjZezVdi+kUwI0H+cEQaU3K4Vzqn1iY8juefy
	/IdKR5dx1dchZgIPChdE/ZNwkMpnHFuj85ykdNg1xeHEXez+13ErNUo5LJ+LYnA3pqN86rhi7rM
	CPPsfW+menh0+AZtM+t8WPF6wlA=
X-Google-Smtp-Source: AGHT+IGn+Q7KPMQ4iDbq+XFo2VUdjH2Lh0DPh3UFa/3QzjN8zERBA2S7qOqX3asv2IP30sEO+aRJ3fF5Jsr5B6X6ls4=
X-Received: by 2002:a05:6820:22a1:b0:659:9a49:8dec with SMTP id
 006d021491bc7-65b45225e82mr6345601eaf.46.1765896451781; Tue, 16 Dec 2025
 06:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20251209135235.423391-1-apatel@ventanamicro.com>
In-Reply-To: <20251209135235.423391-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Dec 2025 20:17:21 +0530
X-Gm-Features: AQt7F2qVJhCAKBUQtDdkg723tHnjpyqSEonOmLH0rXYR7j0yH7mxH_MghAhLdJo
Message-ID: <CAAhSdy1dCJY4jy=3d-Bhsp0xO-aX9+3_42QGP=4aTR1EvimL0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] OpenSBI hart protection abstraction
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064732_966144_B40B64F0 
X-CRM114-Status: GOOD (  12.41  )
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

T24gVHVlLCBEZWMgOSwgMjAyNSBhdCA3OjIy4oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCBQTVAgYW5kIGVQTVAgYXJlIHRoZSBv
bmx5IGhhcnQgcHJvdGVjdGlvbiBtZWNoYW5pc21zCj4gYXZhaWxhYmxlIGluIE9wZW5TQkkgYnV0
IG5ldyBwcm90ZWN0aW9uIG1lY2hhbmlzbXMgKHN1Y2ggYXMgU21tcHQpCj4gd2lsbCBiZSBhZGRl
ZCBpbiB0aGUgbmVhciBmdXR1cmUuIFRoaXMgc2VyaWVzIGFkZHMgaGFydCBwcm90ZWN0aW9uCj4g
YWJzdHJhY3Rpb24gYW5kIHJlbGF0ZWQgQVBJcyBmb3IgYWxsb3dpbmcgbXVsdGlwbGUgaGFydCBw
cm90ZWN0aW9uCj4gbWVjaGFuaXNtcy4KPgo+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gZm91bmQg
aW4gaGFydF9wcm90ZWN0aW9uX3YyIGJyYW5jaCBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vYXZw
YXRlbC9vcGVuc2JpLmdpdAo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBBZGRlZCBkb2N1bWVu
dGF0aW9uIGZvciBmdW5jdGlvbiBwYXJhbWV0ZXJzIGluIFBBVENIMgo+ICAtIERyb3BwZWQgcmV0
dXJuIHZhbHVlIG9mIHNiaV9oYXJ0X3Byb3RlY3Rpb25fdW5yZWdpc3RlcigpIGluIFBBVENIMgo+
ICAtIFJlZ2lzdGVyIG9sZHBtcCBoYXJ0IHByb3RlY3Rpb24gb25seSB3aGVuIFNtZXBtcCBpcyBu
b3QgYXZhaWxhYmxlCj4gICAgaW4gUEFUQ0gzCj4KPiBBbnVwIFBhdGVsICg1KToKPiAgIGxpYjog
c2JpOiBJbnRyb2R1Y2Ugc2JpX2hhcnRfcG1wX3VuY29uZmlndXJlKCkgZnVuY3Rpb24KPiAgIGxp
Yjogc2JpOiBJbnRyb2R1Y2UgaGFydCBwcm90ZWN0aW9uIGFic3RyYWN0aW9uCj4gICBsaWI6IHNi
aTogSW1wbGVtZW50IGhhcnQgcHJvdGVjdGlvbiBmb3IgUE1QIGFuZCBlUE1QCj4gICBsaWI6IHNi
aTogUmVwbGFjZSBzYmlfaGFydF9wbXBfeHl6KCkgYW5kIHNiaV9oYXJ0X21hcC91bm1hcF9hZGRy
KCkKPiAgIGxpYjogc2JpOiBGYWN0b3Itb3V0IFBNUCBwcm9ncmFtbWluZyBpbnRvIHNlcGFyYXRl
IHNvdXJjZXMKCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4K
ClJlZ2FyZHMsCkFudXAKCj4KPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICAgICAgIHwg
IDI1ICstLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydF9wbXAuaCAgICAgICAgfCAgMjAgKysKPiAg
aW5jbHVkZS9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5oIHwgMTAwICsrKysrKysrKwo+ICBsaWIv
c2JpL29iamVjdHMubWsgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICBsaWIvc2JpL3NiaV9kYnRy
LmMgICAgICAgICAgICAgICAgfCAgMzMgKy0tCj4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0
LmMgICAgICB8ICAxMyArLQo+ICBsaWIvc2JpL3NiaV9lY2FsbF9kYmNuLmMgICAgICAgICAgfCAg
IDYgKy0KPiAgbGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgICAgICAgIHwgMzA4ICstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIGxpYi9zYmkvc2JpX2hhcnRfcG1wLmMgICAgICAgICAgICB8
IDM1NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfaGFydF9w
cm90ZWN0aW9uLmMgICAgIHwgIDk2ICsrKysrKysrCj4gIGxpYi9zYmkvc2JpX2luaXQuYyAgICAg
ICAgICAgICAgICB8ICAyMiArLQo+ICBsaWIvc2JpL3NiaV9tcHh5LmMgICAgICAgICAgICAgICAg
fCAgMjUgKystCj4gIGxpYi9zYmkvc2JpX3BtdS5jICAgICAgICAgICAgICAgICB8ICAgNSArLQo+
ICBsaWIvc2JpL3NiaV9zc2UuYyAgICAgICAgICAgICAgICAgfCAgIDkgKy0KPiAgMTQgZmlsZXMg
Y2hhbmdlZCwgNjQ1IGluc2VydGlvbnMoKyksIDM3NCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV9oYXJ0X3BtcC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGxpYi9zYmkvc2JpX2hhcnRfcG1wLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9zYmkvc2Jp
X2hhcnRfcHJvdGVjdGlvbi5jCj4KPiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
