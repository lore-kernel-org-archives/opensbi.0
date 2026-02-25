Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E95FD3770
	for <opensbi@archiver.kernel.org>; Wed, 25 Feb 2026 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tD9VBcz0yWb7XjNTUF1cyRita/jJfHqEZ5g7FPD50xw=; b=OBq43zQFLIbd/g
	i+v33bNe+sqyXAOAk4Zw5SPdrshfnJxadvq2lLKsOkpCkrgAgOMODjrxccD2PR294UzYHF1BWSu6W
	NBFXhaHdX8r1ZRTww4XPoRis7YBbHiHxZLvxwvY9HdV/71Sg1JsyuqcJTjSqSH0xqGF83tWFcvQLS
	fRkNb5vE9taKgireBufg0jnnty9tpj2yd3uuKAlFHQHUDN7Ls90bbsGrM0IPh9JdrAaHfXKlcGf82
	nC1WXUnn+GqYgqq2nL5BFWro7tRxIUe5/PnLPDtM6N60LeuQ96JHH37wbQXsZWhyvw04ZsSkjDF1W
	OhaUuFQE5Eez+ZcLGY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHHP-00000004R9r-3vx1;
	Wed, 25 Feb 2026 15:58:27 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHHM-00000004R9Q-3GKL
	for opensbi@lists.infradead.org;
	Wed, 25 Feb 2026 15:58:26 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d4be94eeacso2141175a34.2
        for <opensbi@lists.infradead.org>; Wed, 25 Feb 2026 07:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772035103; cv=none;
        d=google.com; s=arc-20240605;
        b=XwvGm97G9/Slun9eLwPdj1lkbGEAeLfsQYJWO6/cMhPRStbCmdSt2rB6tBqxWIeadk
         MEO4k+0rZY/5NUW5IV9BUFnF6n9ijMGncW4rd5DZeeFqxwBGFmz4ZbZeB857o6FlK/Wn
         QBjdFwei8rYuyc8HCLxDtNIQoFGu/8l/RjMquDwLP4V3IX0r2ZoktGUo3aeg8ieMabK0
         vodHzxhWOr+5HcL8EB+wzmHryDfo7PQHd0NrdqusPCpjf9ZNNjsyF9EYFgDzIxDVjFTT
         U/WuCtZcZwCHIWQHNbEEiPqo0WhDqYWGgEXxEhUfBJFuSId9LkJDcEH5yE6r8ChECwWN
         ZUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NSpVu/Zc8Z+SmZ8W+w4uWHzKQIeh7Ct1EeXU8mPMQ2s=;
        fh=1xeobZcNSnYEXJYAIHFFXNF8dfYa6fTsfvUKZu/XF3s=;
        b=b9X+vonS/DTHnQWkqmIGDe1oA1j+QSqpdedv1ey3nDmyLuuRq6N8pAMbJe5BZ+4WpC
         gC0gX0rv+BHS+jLBjcoTI2rEFChwxx5OUlY09utsokD6owPfD9kLEkv6Uz5aU9weBg7V
         Z8h3J9yQeDEImvumZf+ebzKehigJd445sO5/fUdkjnIskiuhTmZWPFQdecog4iqJUa03
         yOENcvzk+/Ofdz0juKSKj3BZdF8ujLzQtQfRSv/cDz6lG2GS0Z/Hf9wF2ATBRdvGaZ4t
         MMtYDDX1SOej1SHpf71tTr7hQkMAQFW9SgrIO6FLuqlIaNrgaKLIRsFWGUDrYIpuWUNt
         4WKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772035103; x=1772639903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSpVu/Zc8Z+SmZ8W+w4uWHzKQIeh7Ct1EeXU8mPMQ2s=;
        b=x83ZPrS5q00b/wyGDDNZLN+6xm+xZzUCpu/h7rnoQQYnfnqCQFimOXEIPZdtyB1E92
         gwpZXC65I6AmoB9evIGptiV60IBwfIUKTqrTsvkfxsyxnVtqJiIrfQgW2m618oQVFtNg
         a90rOaD6DTszu6w2XqlmKnfg0vBfbpy6ZZq8DtSMYN+bUo5y8lIDzbDO2xUPAxPPkdp9
         Qru/xzEM1ec7aSwDkipkTlykm/GctzJAv1kFKcK65CLIrtnaEpPaQj68kDvSIBCARELN
         XTbA5OnyFnmk4WhtG1qld1g6Fngs2I4DN0yGUBOpoxQhy8GiobofkhCcahiv8Mc5VXCW
         QuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772035103; x=1772639903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NSpVu/Zc8Z+SmZ8W+w4uWHzKQIeh7Ct1EeXU8mPMQ2s=;
        b=DVOfFUUcKCADjCSwAGKmYQ4YiOHYh1VLJaWf3s/pPgcI0QLvXh2H9T/R+c9uHOxbJm
         xFo/L1opFmTrg1GkCdDCt4vY2SpZesKtr27KE/qld638eNNIG6jwfiFfQ6EG7u9KqgA7
         1kRDT6Ve8Itm2kdTh6LyA3w2IyuZxAb79hMqhCN8A74L4FNLFDmRsvFMyZXZ7nvYepuP
         gbkanzF5+hhNF1cJb+UnytRUveP0sc4ye4WOxdG7gjdAcdkODmEOE08t+bxuP8D4A7D2
         oPUETDZ3yO5dbBt7hqUS3NSMadjKyvNYTSf1E1vBysdhcXRZcihy8DiJsujxATxT5YD3
         N6fg==
X-Forwarded-Encrypted: i=1; AJvYcCVu8/OwKm2M2YuDrbW6j2dwYCm4kIHnq6I1tLD9Btsj1Po/Q8dynFAed+v496LiBpqctybU8R3s@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1bFHdi1elgPWTAJIp/PZrgCqrxkKnH+gjqe6dCD/Dag6B+8g6
	V/s+nxcQn6t5fHLGYJYn6weJxKEuIvOb4NCiaenu//n242deQJONRKjK8a2+uXRak55kraMwVcL
	scc+OUcHbjC9WP34tM5NUZqwuFiXBj7JBcZAX+BleTQ==
X-Gm-Gg: ATEYQzy/M+02FIWuYOy+vhtPRCpDXqwdQMNp/uE5RhFMjskMwn/jA40VLIQ9PUQlqVY
	Ay8xexeAaiAsdR/suWDga/zDL9En28EFbiQdzNjqfwK0/edHRaGrpfxXKeEgLyGy7uK0nDIW2me
	FgZ9U4z+HE6u9A52nprshDwFx7s/MlTa9RXyFs3NPq3bieD4K/CiPgVBqju6EBc1U9S/sNvi6hD
	kCMXH6cZg5pWkj1vkOS8R+8vF+/OVWWR3XIc0TL2W7T7x7RTBiWHvfMf1TTzwuOdQCbnRzalKNu
	tD6w1jz9I6N86zDooaL8w9aJxiQCoHt7wIWZNzoDNah24JIXapoXVHmUAEFrhShU/k0Qqhz/rHl
	awRCUIgDssaAONr1ldKZtmYMwXmM=
X-Received: by 2002:a05:6820:6ae4:b0:679:ef25:336c with SMTP id
 006d021491bc7-679ef253623mr449993eaf.40.1772035103124; Wed, 25 Feb 2026
 07:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Feb 2026 21:28:03 +0530
X-Gm-Features: AaiRm53OGwkwXu9pCVW5LENFxzuW3Alu3WkoakQtSiCQFOe54f99dajAEmG3W4Q
Message-ID: <CAAhSdy3hojj4se2h=3dadTBtPnvyVp3xnKY1jb4F2ATWw0vFBA@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] Introduce MIPS p8700 based "eyeq7h" and "boston"
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: benoit.monin@bootlin.com, cc=cfu@mips.com, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_075825_017182_9D4C262C 
X-CRM114-Status: GOOD (  14.54  )
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

T24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgODoyNeKAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
YWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPiB3cm90ZToKPgo+IGluLXJlcGx5LXRvOjIw
MjYwMTE0MDkyMTE4LjEzMTU1ODEtMS12bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbQo+
IGNjOiB2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbQo+IHRvOiBhbnVwQGJyYWluZmF1
bHQub3JnCj4gY2M6IGJlbm9pdC5tb25pbkBib290bGluLmNvbQo+IGNjOiBjYz1jZnVAbWlwcy5j
b20KPiBjYzogb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4KPiBBZGRpbmcgc3VwcG9ydCBm
b3IgdGhlIE1vYmlsZXllICJleWVxN2giIGF1dG9tb3RpdmUgcGxhdGZvcm0KPiB1c2luZyBNSVBT
IHA4NzAwIENQVS4gUmVmYWN0b3IgY29kZSB0dXJuaW5nIG1pcHMgcDg3MDAKPiBwbGF0Zm9ybSBp
bnRvICJjcHUiIHRoYXQgaXQgYWN0dWFsbHkgaXM7IHdpdGggcGxhdGZvcm1zIHVzaW5nCj4gdGhp
cyBDUFUsICJleWVxN2giIGJ5IE1vYmlsZXllIGFuZCAiYm9zdG9uIiBGUEdBIGJvYXJkIGJ5IE1J
UFMKPgo+IFRlc3RlZCBvbiB0aGUgcmVhbCBleWVxN2ggaGFyZHdhcmUKPgo+IFNpZ25lZC1vZmYt
Ynk6IFZsYWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29t
Pgo+IC0tLQo+IEJlbm/DrnQgTW9uaW4gKDEpOgo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBt
aXBzIHA4NzAwOiBBZGQgbWF0Y2ggZGF0YSBmb3IgQ00gaW5mbwo+Cj4gVmxhZGltaXIgS29uZHJh
dGlldiAoMjIpOgo+ICAgICAgIGxpYjogc2JpOiBwcmludCBoYXJ0aWQgaW4gaGV4Cj4gICAgICAg
bGliOiBzYmlfaGFydF9wbXA6IGRpc2FibGUgdW5jb25maWd1cmVkIFBNUCBlbnRyaWVzCj4gICAg
ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IGltcHJvdmUgQ00gYWNjZXNzIHRyYWNp
bmcKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogcmVzZXJ2ZSBtZW1vcnkg
Zm9yIE0tbW9kZSBwZXJpcGhlcmFscwo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4
NzAwOiBmaXggcG93ZXJpbmcgdXAgb3RoZXIgY2x1c3Rlcgo+ICAgICAgIHBsYXRmb3JtOiBnZW5l
cmljOiBtaXBzIHA4NzAwOiBmYXN0ZXIgY29yZSBib290Cj4gICAgICAgcGxhdGZvcm06IGdlbmVy
aWM6IG1pcHMgcDg3MDA6IHVzZSBnbG9iYWwgQ00gYWRkcmVzc2VzCj4gICAgICAgcGxhdGZvcm06
IGdlbmVyaWM6IG1pcHMgcDg3MDA6IGFjY2VzcyBDTSByZWdpc3RlcnMgdmlhIG1hdGNoIGRhdGEK
PiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwczogYWRkIFA4NzAwIGJhc2VkICJleWVxN2gi
IGFuZCAiYm9zdG9uIgo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogcG93
ZXIgdXAgY2x1c3RlcnMgd2l0aCBPTEIKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBl
eWVxN2g6IGRldGVjdCBhY2NlbGVyYXRvcnMgY2x1c3RlciBwcmVzZW5jZQo+ICAgICAgIHBsYXRm
b3JtOiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogZGVhc3NlcnQgYWNjZWxlcmF0b3IgY2x1c3RlciBy
ZXNldHMKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogY2FjaGUgZ2VvbWV0
cnkgZGV0ZWN0aW9uCj4gICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IENQVSBj
bHVzdGVycyBtZW1yYW5nZXMKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDog
dXNlIFNCSSBiaXRmaWVsZCBtYW5pcHVsYXRvciBtYWNyb3MKPiAgICAgICBwbGF0Zm9ybTogZ2Vu
ZXJpYzogbWlwcyBwODcwMDogc3luY2hyb25pemUgaGktcmVzIHRpbWVycwo+ICAgICAgIHBsYXRm
b3JtOiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogc3luY2hyb25pemUgdGltZXJzIGFjcm9zcyBjbHVz
dGVycwo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogZml4IE5DT1JFIHJl
Z2lzdGVycyBhY2Nlc3MgZnJvbSBjbHVzdGVycyAxLi4yCj4gICAgICAgcGxhdGZvcm06IGdlbmVy
aWM6IG1pcHMgcDg3MDA6IGR1bXAgTU1JTyByZWdpb25zCj4gICAgICAgcGxhdGZvcm06IGdlbmVy
aWM6IG1pcHMgZXllcTdoOiBwcm9oaWJpdCBhY2Nlc3NpbmcgbWVtb3J5IGJleW9uZCBEUkFNCj4g
ICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IHA4NzAwOiBmaXggTUlQUyBzcGVjaWZpYyBDU1JzCj4g
ICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IGV5ZXE3aDogZW5hYmxlIEVDQyBvbiBMMSBjYWNoZQo+
Cj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBs
aWIvc2JpL3NiaV9oYXJ0X3BtcC5jICAgICAgICAgICAgICAgICAgfCAgIDYgKwo+ICBwbGF0Zm9y
bS9nZW5lcmljL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMTYgKy0KPiAgcGxhdGZvcm0vZ2Vu
ZXJpYy9jb25maWdzL2RlZmNvbmZpZyAgICAgIHwgICAzICstCj4gIHBsYXRmb3JtL2dlbmVyaWMv
aW5jbHVkZS9taXBzL2JvYXJkLmggICB8ICAzMyAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNs
dWRlL21pcHMvbWlwcy1jbS5oIHwgIDU1ICsrLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRl
L21pcHMvcDg3MDAuaCAgIHwgMTkwICsrKysrKysrKystLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9t
aXBzL2Jvc3Rvbi5jICAgICAgICAgIHwgMTUwICsrKysrKysrKysKPiAgcGxhdGZvcm0vZ2VuZXJp
Yy9taXBzL2V5ZXE3aC5jICAgICAgICAgIHwgNDc4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9vYmplY3RzLm1rICAgICAgICB8ICAgNyAr
LQo+ICBwbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYyAgICAgICAgICAgfCA0MTAgKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tCj4gIDExIGZpbGVzIGNoYW5nZWQsIDEwNDQgaW5zZXJ0aW9u
cygrKSwgMzA2IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiA5NjU2OTQzYmQzYTJj
YWQ5NDE4NDY1YzJhMTY4ZjkwN2VhNTIxODliCj4gY2hhbmdlLWlkOiAyMDI2MDExNS1mb3ItdXBz
dHJlYW0tZXllcTdoLTkwMzFiZGFlMTE0OAo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gVmxhZGlt
aXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+Cj4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQg
dGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
