Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B31C636A0
	for <opensbi@archiver.kernel.org>; Sun, 22 Feb 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NB+zgScelpaUg/P5b5S8zwyLjumuYAIQld32CibOZhQ=; b=Z8A2WQAYMhgPYA
	cIr2EJsJtBAx2uR493cyG4e1+CHA/IIDEjcuIZxHG91wTJPFJ+6fvFPssAMDUEtR2EF3BGz479M9F
	VR6O5KrOlQXhHY94a23dsebWJ61gEnqUmnfII47GUPuWdu0K39k/ihI3vlMlitqX0TlK3P3qZFsQ6
	v/5F74HZllx8gkl0Gz3iNUvqkFktpausEvudkDBjzzVdsZjGtXF/X/vsmwcLNksJ4agO2GFckPsQg
	Pej/alkzCQWPgUWLSiiNR0G38crSpyHH6gSCvKQoU0NaIAnxCXWsWR/zbD5GG26LZ9I0nRq/qjNwy
	dhEg21XhRMfBM2Ks5sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuByF-0000000Gnvq-2bia;
	Sun, 22 Feb 2026 16:06:11 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuByC-0000000GnvT-2z1c
	for opensbi@lists.infradead.org;
	Sun, 22 Feb 2026 16:06:10 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-662f9aeb782so2264132eaf.3
        for <opensbi@lists.infradead.org>; Sun, 22 Feb 2026 08:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771776367; cv=none;
        d=google.com; s=arc-20240605;
        b=UBZ2Rg8AuFl8FDxhAdIQNXVyI6R5cE6Y2exPBB82dwym/i0Z5iJe/nqcuPT0l9qox8
         AoPvdxzZJ3Bl9SqTNiMQAxUTKWNw+27ss3hMD2JpP3uCOWoQR7uymQNSMZoLJ3TMURPh
         WFDIqyVZ5wgUGLWGSANXe/VQkFrzVFcOOv68gcf1yQATLDJvU5QdBkxxV1ZWVkhrFvWt
         PTmJZYWXq3qNo79BSUE5Uam5LKlbkVmSgaSPsptb6eGNhF5MlpC2xi2nUsBCkMqc/+0h
         UAIp1KwDlqBNzb5TkYHq2uoOf2r/NHfTd3Lw8fbixXmbug30ZR0icSOptyfZ6wyPE4uC
         tVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LiA1Y730P2qP884yJp5me4IqvoZvs440ItTGuxohz4=;
        fh=feGH2Kc7pFmm80Cy1mFuBHwic2IUGlo6thSuhPIMyeU=;
        b=D6HQ1AbdTcSNrQd09jplyroMlTtekW0ZcfVTUzULCrDVhkZuuFE/8P6+af+d1Q+Jcj
         QxbXxufHwpkcDD/fut/zIr6U59FuVCJfWvIWMAVkVQAEayCz81KZQlXNG9CTJH+babaE
         K+QocNtfaGDBaVpB3T5f8OsuRgc21jIk6dhI7EXIgBmX1NrPllTnK+vhclPevBpafONs
         P1Orjncwt+Jtn9mP08Pbj4b4G9k3Yv0gpgiAu8h0H+1HARgMtMocpzVZWWSCkPhkr8lW
         CCBLzyWPakEt83XQL63hpcTbgyPqNVSYlyKxHGStEH587V+0L6LXRgTs0FNhvwtv1adh
         C8OQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1771776367; x=1772381167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LiA1Y730P2qP884yJp5me4IqvoZvs440ItTGuxohz4=;
        b=wqPe8AwUDC0Hdv5DFlYuDlbrfhYg1RSqSsJJu8wD+VCo9k0ANDQJpJv1WJbs9PVBBx
         nA/HLB8kka32Po4FYHS54RNrn7t5zIzfdAPwzhv4woZPBcGojO0ZCb/uM1g4E8mY/5XA
         vRDlVk6AP7xEHPBjMY/W044Jl/YGXQb1oxIfPc3oc1Zbq8fMAFpWix2M8WaCBFIR5nYa
         aen99HTMfpIQLU/1/6yvi+mHEBiR92SPCErUBpSMsxdVW9vDkfkeh1wkVpB0Ih8/fj0u
         gRnm0JMR9JaszrpJsA3dI5+u2eNNdv1c+aoSov7Ga6/SBlsjzvTw4DaZVkah+6J/D8nv
         EHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771776367; x=1772381167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LiA1Y730P2qP884yJp5me4IqvoZvs440ItTGuxohz4=;
        b=N6Xq5g46l0X3kvo90t0dyUndn4hW94HbMNcGObfn/OuUlKdLQZahnJrdXpVrAk/kmh
         A3zUvRMKkJl2StmytcMMBxijQLPdGYO7GMwoJz0RJVm7eYpgv9lN4ktvzDYRywC2Nvau
         a8uUXjGrU2e2OAF2Ih6c1TGFff9AN3J1dbYUWJd0zZwFTAUGsIKz2QGJOtFGYDvE7rqx
         zPwSISOe5uOT0cHHGjxRJHzIhD+vRGKB8tIYgETTFHyCZnHJj2y8Q5OIUsOmEb82iRGz
         079RikC92aA/Moby9TQJaZObx1oBjHk9Emw1FAh6TQeQ/1cEg8EOrEqT2zfnpzdZIM8N
         wTew==
X-Forwarded-Encrypted: i=1; AJvYcCXIYl5RsqWzSp+wfCzgqsk4wIxeJm4CiVSv+5TlBQ+9bDTT42JcAqJILxhv/VRZxkrbIT0snlVU@lists.infradead.org
X-Gm-Message-State: AOJu0YwdxsFS09Q1c8D2HxV1Tieb/Yrsj6FHG+8D8RDjGE8tgDNOLf35
	4mxa/x6FI48qxT+NbthBY6K25V3qSy5nK6vsmU/mN30AKSnA2gvruuADXjPCxle6cyKB+pNeuLi
	uz1S7cvhF1tuwky5bVlGHAtwYWm9c6oRKWkbQbCxrZ/NRpLycTTCTENg=
X-Gm-Gg: AZuq6aJVOquIdaavO/LSCX0SWFBgv0861O1NWNnu1uqtO/VJBvzhujSgTB+a9jPHTO1
	E90PRajyDBsJoUxGh5vJX+09law+R7zwXfWXdjJjYvTVO6Y18mEXCWZGFMc6hwaDtGenxoZ759A
	pgpEczuXAY9ViGrUUOLOhkG3R7z1Y5tg3kQt/f/odLcAP88kGFpJz/RKwRIGzGpEfBI9W99HfEJ
	/tItn3vTAB2a79nh9kpkTIdJUAJOS+/bSyhTKdZ3c9nFkaZoZqPio58UvHuBs4eHbkqUYPL0QIs
	dRZNKSxn+D/ej0Z/RT5laIO+3v79nWIBc1Eiq+WUy8HJXnGK/IOCsyeDGGtCrlx713XdZ1XrEDE
	vUa/Y3c3C17CdOOCKFf3eleD0pA==
X-Received: by 2002:a05:6820:2019:b0:65d:3c7:b57 with SMTP id
 006d021491bc7-679c46845e6mr3281144eaf.34.1771776367255; Sun, 22 Feb 2026
 08:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20260114092118.1315581-1-vladimir.kondratiev@mobileye.com> <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
In-Reply-To: <20260118-for-upstream-eyeq7h-v2-0-71934a5b9756@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 22 Feb 2026 21:35:56 +0530
X-Gm-Features: AaiRm533TeVM2nUT6WKz9iEyLv1xVIfX8D8pX6RETtL3j2QpJc5zKuZllps-zZE
Message-ID: <CAAhSdy0zRN-e5K8kp=vy=dHQx2SwHaLpvUsXGE7LU_bOB3ZmEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Introduce MIPS p8700 based "eyeq7h" and "boston"
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: benoit.monin@bootlin.com, cfu@mips.com, opensbi@lists.infradead.org, 
	cc=cfu@mips.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_080608_908593_F00CC765 
X-CRM114-Status: GOOD (  13.82  )
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

T24gU3VuLCBKYW4gMTgsIDIwMjYgYXQgNTowOOKAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
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
dGlldiAoMTkpOgo+ICAgICAgIGxpYjogc2JpOiBwcmludCBoYXJ0aWQgaW4gaGV4Cj4gICAgICAg
cGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IGltcHJvdmUgQ00gYWNjZXNzIHRyYWNpbmcK
PiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogcmVzZXJ2ZSBtZW1vcnkgZm9y
IE0tbW9kZSBwZXJpcGhlcmFscwo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIHA4NzAw
OiBmaXggcG93ZXJpbmcgdXAgb3RoZXIgY2x1c3Rlcgo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmlj
OiBtaXBzIHA4NzAwOiBmYXN0ZXIgY29yZSBib290Cj4gICAgICAgcGxhdGZvcm06IGdlbmVyaWM6
IG1pcHMgcDg3MDA6IHVzZSBnbG9iYWwgQ00gYWRkcmVzc2VzCj4gICAgICAgcGxhdGZvcm06IGdl
bmVyaWM6IG1pcHMgcDg3MDA6IGFjY2VzcyBDTSByZWdpc3RlcnMgdmlhIG1hdGNoIGRhdGEKPiAg
ICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwczogYWRkIFA4NzAwIGJhc2VkICJleWVxN2giIGFu
ZCAiYm9zdG9uIgo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogcG93ZXIg
dXAgY2x1c3RlcnMgd2l0aCBPTEIKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBleWVx
N2g6IGRldGVjdCBhY2NlbGVyYXRvcnMgY2x1c3RlciBwcmVzZW5jZQo+ICAgICAgIHBsYXRmb3Jt
OiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogZGVhc3NlcnQgYWNjZWxlcmF0b3IgY2x1c3RlciByZXNl
dHMKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogY2FjaGUgZ2VvbWV0cnkg
ZGV0ZWN0aW9uCj4gICAgICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHMgcDg3MDA6IENQVSBjbHVz
dGVycyBtZW1yYW5nZXMKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwcyBwODcwMDogdXNl
IFNCSSBiaXRmaWVsZCBtYW5pcHVsYXRvciBtYWNyb3MKPiAgICAgICBwbGF0Zm9ybTogZ2VuZXJp
YzogbWlwcyBwODcwMDogc3luY2hyb25pemUgaGktcmVzIHRpbWVycwo+ICAgICAgIHBsYXRmb3Jt
OiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogc3luY2hyb25pemUgdGltZXJzIGFjcm9zcyBjbHVzdGVy
cwo+ICAgICAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzIGV5ZXE3aDogZml4IE5DT1JFIHJlZ2lz
dGVycyBhY2Nlc3MgZnJvbSBjbHVzdGVycyAxLi4yCj4gICAgICAgcGxhdGZvcm06IGdlbmVyaWM6
IG1pcHMgcDg3MDA6IGR1bXAgTU1JTyByZWdpb25zCj4gICAgICAgcGxhdGZvcm06IGdlbmVyaWM6
IG1pcHMgZXllcTdoOiBwcm9oaWJpdCBhY2Nlc3NpbmcgbWVtb3J5IGJleW9uZCBEUkFNCgpJIHNh
dyBmZXcgb2YgdGhlIHBhdGNoZXMgdXNpbmcgIi8vIiBzdHlsZSBjb21tZW50cy4gUGxlYXNlCnBy
ZWZlciAiLyogKi8iIHN0eWxlIGNvbW1lbnRzLgoKUmVnYXJkcywKQW51cAoKPgo+ICBsaWIvc2Jp
L3NiaV9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICBwbGF0Zm9ybS9n
ZW5lcmljL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAxNiArLQo+ICBwbGF0Zm9ybS9nZW5l
cmljL2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICB8ICAgMSAtCj4gIHBsYXRmb3JtL2dlbmVyaWMv
Y29uZmlncy9leWVxN2hfZGVmY29uZmlnIHwgIDYxICsrKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9p
bmNsdWRlL21pcHMvYm9hcmQuaCAgICAgfCAgMzMgLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNs
dWRlL21pcHMvbWlwcy1jbS5oICAgfCAgNTUgKystLQo+ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1
ZGUvbWlwcy9wODcwMC5oICAgICB8IDE2NiArKysrKysrLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMv
bWlwcy9ib3N0b24uYyAgICAgICAgICAgIHwgMTUwICsrKysrKysrKwo+ICBwbGF0Zm9ybS9nZW5l
cmljL21pcHMvZXllcTdoLmMgICAgICAgICAgICB8IDQ5MyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL29iamVjdHMubWsgICAgICAgICAgfCAg
IDcgKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMgICAgICAgICAgICAgfCA0MTAg
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxMSBmaWxlcyBjaGFuZ2VkLCAxMDkyIGluc2Vy
dGlvbnMoKyksIDMwMiBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogNzQ0MzRmMjU1
ODczZDc0ZTU2Y2M1MGFhNzYyZDFjYWYyNGMwOTlmOAo+IGNoYW5nZS1pZDogMjAyNjAxMTUtZm9y
LXVwc3RyZWFtLWV5ZXE3aC05MDMxYmRhZTExNDgKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IFZs
YWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPgo+Cgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
