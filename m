Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B47CCD183
	for <opensbi@archiver.kernel.org>; Thu, 16 Oct 2025 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCdjgMHTcr01tHmuuokA08TyiUPm3M7usJktyfsnB4A=; b=lFnsw3kmEwe4d3
	/TUWvrofeB0aFHddiU/wSqQmo6/xAG+vYr6putyfEcSb2DlCTkX7c24wPY648OjbInymlbvITBVIR
	xkzv/udNZeeQ3pPxF96uX+4irFQOcnOgo8UzNld8zm7xuVCxSuhra0N2Vt3Nlk7XyBYg3OP789B3k
	fQT3GMQr4RFIuqFUXw81cis3Bnhb6+vzHF4bxZAhV0EetJ8soXhdG9Aal2Cc29CxF8VOt7qfYdo78
	7DPZMIn+ELWHhbRuLxHVECv4GhUCturlj+Kzxc7D6fUq2WEmV6HZuPHNugaZfUJQsxgdmxyM16gFt
	Yk3YOd2jUEu5NCtOtbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pm5-00000005AQs-1Hbb;
	Thu, 16 Oct 2025 15:20:17 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pm1-00000005AQ4-3yKa
	for opensbi@lists.infradead.org;
	Thu, 16 Oct 2025 15:20:15 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-78113fdfd07so7949337b3.2
        for <opensbi@lists.infradead.org>; Thu, 16 Oct 2025 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20230601.gappssmtp.com; s=20230601; t=1760628011; x=1761232811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms51t8qyfml5W3TtqBKcGlWOEvb9b8pkHrR8ikClMf4=;
        b=lL3MKq/81kjnGMD5Uy/4hS9DmIlJ2Qck4R8oa4dQ3fYALLVVvrC1xFJB9ZemlptAmo
         E63NY9ymefk5KdpBeb9RIkuQObd+3M3/OAIaAoSnl7nDEaKZ+MpXoTSEnE+Fy743+BrS
         9iFf2Rn+JktOp3TJ4UUtE4yPfjnML7Zfy7SgZRzYEdOuXv7g4xuAtOlLu7kUvy3IJyVg
         VWatzgFtxdqlKNIXfIlt2YrdO9DI9EGiipp2JPlQVAiRtk9/vMuuOhQpk+os8ucQxMX1
         L51tXQ7gIyU9yHVRRvkFK18FXdKehKFZiY3Rrfg9EunDurwggnyEfQ3IbVux4cY9RjhG
         Twlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760628011; x=1761232811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ms51t8qyfml5W3TtqBKcGlWOEvb9b8pkHrR8ikClMf4=;
        b=G7BdfgTgDj3bbrmkdU6xhfwPrJ/6KwvopQwJimPeeycVebjTIVTViGqor2KX1zuRIz
         H3y8zcW1qUjKzpG493PU3r1yvTlisZVO1+hfBDAWgCeBRldMmOxBQf2k3vEURuZkhNY5
         zgY3nl0NgHAyGamg5G3MRX106W9r8eVp9bqBEkoXjnJZROq4d5LDPLnYnOcIF0vARMZV
         EfjQlyB5y2Gw7KoYZv3z4F99ZNPjT7YjMJeZknwdc467ALCF0UQujZPFABHLExG8j0TH
         LK7x/Fz2peg15kx90B0BhguJvSTYNIxGAZ1MAs7fb5r/5kqeiyPzxOlvP2bA6E/P3Wqo
         Sb1g==
X-Forwarded-Encrypted: i=1; AJvYcCWEGURnBRPjkXH7te+0EyHvoD1ReuXP/165A4MWqch3WxJ/GqwvZ5IHBWl4NSZ5DfSBgN+46Ri8@lists.infradead.org
X-Gm-Message-State: AOJu0YzPpgksiT0zvkb+xK9hH5QAzh883dM9AZVxfkMKNndrv0jztG3A
	GlQOm7/xa9/EG6ZqPuuZ/g3T5sjksYkIRs1BNeYGJ1VwrUnAy0ieyRvzN0YTnQvR+1vEYOdXdcy
	b5oliczjD9l/ZBIrtFSqmH0gelpEVTPpLmGWfCt+2lVA=
X-Gm-Gg: ASbGncvD+uI1AImWRacgnIOVmSDNcXSOwTrRDV+oh7fxUWjnsD5SWsNj905wa906KrI
	38aDFmnsddl0asuCpaMQsFKxdSH07QIwXQPVrsLYd7tVBwfdk1GxmiqDCqBpZWo+8E3KW8ZR8Fu
	1oz1J61gNBi/MHU6apYf8q1IvU+y6d8wFquum8stfCkx5xfYSRmYwwHg1Qzs0thcvZlLQAQ5jOZ
	DP6vA/iSCxrf3cm44viG7/ns28ImxB+HnGnKUZzq3CvflM1uYGlS/3qCftLBq7wqPITmztYhAr5
	ewxYjVjs7EGR
X-Google-Smtp-Source: AGHT+IHguOjzDEGCJRH5pjUHHCLg4L4CEGYbnUZi3oK0n7u9EFiIgRAcjICFgrerzNInFhfNHoXyHpjzdKVQZb1Whbw=
X-Received: by 2002:a05:690e:12c7:b0:636:d3c9:b9e3 with SMTP id
 956f58d0204a3-63e1617b208mr502895d50.17.1760628011209; Thu, 16 Oct 2025
 08:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20251013153138.1574512-1-joshua.yeong@starfivetech.com>
From: Rahul Pathak <rahul@summations.net>
Date: Thu, 16 Oct 2025 20:49:59 +0530
X-Gm-Features: AS18NWDhEwrBB6IiCbg62xiJoR_RnimzPEbyV02IDWWq2RqtVoj6s7M131YbgeU
Message-ID: <CABdD5x=svn8jtFMpoR1w=xQfc=C_jYmHU=KZmPioWBjaeOXirA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add RPMI/MPXY voltage, device power and performance service
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: atishp@atishpatra.org, opensbi@lists.infradead.org, 
	apatel@ventanamicro.com, rpathak@ventanamicro.com, 
	leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_082014_221033_3E844477 
X-CRM114-Status: GOOD (  12.01  )
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

SGkgSm9zaHVhLAoKSXQgd2lsbCBoZWxwIGlmIHlvdSBjYW4gYWxzbyBzaGFyZSB5b3VyIGJyYW5j
aGVzCmZvciB0aGUgTGludXggYW5kIExpYnJwbWkgc2lkZSBjaGFuZ2VzIGZvciBhbnlvbmUKdG8g
dGVzdC4gSWYgeW91IGFscmVhZHkgaGF2ZSBRZW11IGJhc2VkIHN0dWJzIGltcGxlbWVudGVkCmZv
ciB0aGlzIHRvIHRlc3QgdGhlbiB0aGF0IHdvdWxkIGJlIGdyZWF0IGFuZCBwbGVhc2Ugc2hhcmUg
dGhhdCB0b28uCgpUaGFua3MKUmFodWwKCk9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDk6MDLigK9Q
TSBKb3NodWEgWWVvbmcKPGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToKPgo+
IEFkZCBSUE1JL01QWFkgZHJpdmVyIGZvciB2b2x0YWdlLCBkZXZpY2UgcG93ZXIgYW5kIHBlcmZv
cm1hbmNlIGdyb3VwIGJhc2VkIG9uCj4gUlBNSSBzcGVjaWZpY2F0aW9uIHYxLjAuCj4KPiBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1ycG1pL3JlbGVhc2VzL2Rvd25sb2Fk
L3YxLjAvcmlzY3YtcnBtaS5wZGYKPgo+IEpvc2h1YSBZZW9uZyAoMyk6Cj4gICBsaWI6IHV0aWxz
OiBBZGQgTVBYWSBSUE1JIG1haWxib3ggZHJpdmVyIGZvciB2b2x0YWdlCj4gICBsaWI6IHV0aWxz
OiBBZGQgTVBYWSBSUE1JIG1haWxib3ggZHJpdmVyIGZvciBkZXZpY2UgcG93ZXIKPiAgIGxpYjog
dXRpbHM6IEFkZCBNUFhZIFJQTUkgbWFpbGJveCBkcml2ZXIgZm9yIHBlcmZvcm1hbmNlCj4KPiAg
aW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaCAgICB8IDI0NCArKysrKysr
KysrKysrKysrKysrKwo+ICBsaWIvdXRpbHMvbXB4eS9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEyICsKPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9kZXZpY2VfcG93ZXIu
YyB8ICA1NSArKysrKwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3BlcmZvcm1hbmNl
LmMgIHwgIDkwICsrKysrKysrCj4gIGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfdm9sdGFn
ZS5jICAgICAgfCAgNzYgKysrKysrCj4gIGxpYi91dGlscy9tcHh5L29iamVjdHMubWsgICAgICAg
ICAgICAgICAgICAgfCAgIDkgKwo+ICBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmln
ICAgICAgICAgIHwgICAzICsKPiAgNyBmaWxlcyBjaGFuZ2VkLCA0ODkgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9kZXZpY2Vf
cG93ZXIuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBt
aV9wZXJmb3JtYW5jZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRpbHMvbXB4eS9mZHRf
bXB4eV9ycG1pX3ZvbHRhZ2UuYwo+Cj4gLS0KPiAyLjQzLjAKPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
