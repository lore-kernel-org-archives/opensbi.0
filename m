Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBE3CD343F
	for <opensbi@archiver.kernel.org>; Sat,  9 May 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOZzw4oHHkoJ5Om7aHROaiFneZvY9zEyOb9SqeoX70A=; b=TjX7+na7DX2W7R
	PioO1VtDVgl0M9tiQ4kR3f3lyp8RD7L/fxCYNv27ZXzhSbXLiWBUDc46kIxXf3c32r2t+iC0a8qmM
	NkJCuAbOTMXbn0BzFCdE0v0OHzWBfpGAEAq2l05TA/kuuGYRDTeJZMS3jlmmj442dIAPgQL219KP/
	S4M59AI8rl9NRXriYahg/luKKi1bUOFLMm9H8/6LXHIetN2kMb+mnnHbufu695NLtS3yz66fLlBgF
	iYqFnAGCtXSQLjoLJnvfRGhQKpXVhWhA66gsH9fJYoGZYk2b0Qb5Y/VmW+VAZ1nikVLrsvNzCfbUS
	p4EzrxEesVlxDyvNRY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcDT-00000008UoA-3WS3;
	Sat, 09 May 2026 07:35:15 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcDQ-00000008UnJ-3yJ0
	for opensbi@lists.infradead.org;
	Sat, 09 May 2026 07:35:14 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-40946982a78so984576fac.2
        for <opensbi@lists.infradead.org>; Sat, 09 May 2026 00:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778312111; cv=none;
        d=google.com; s=arc-20240605;
        b=lYbLbcnCIazQrfEuJV/CLI57D/3+OBd4ECXfDDzvKB18owSzlafN7aZmhX5GSIMaFZ
         Yb9evhjSdP+nWi89cvwvE9sbFvsUdLpVmvCKc51LEg76wsyxlOvf7dOY2UFEY3En76yP
         8oyk4TIEKT4qx3nWixSkeHMuOF7wt666XKlnEfCtm4/2b83P7NmpWugRQ96/y4PCLlKo
         xOm+Pasz9a80ng40O02jz/K8yfvDvfmZEXqzOeMNE58yMrswc8SnWE9NyQbeW71oHTfe
         XusCfkPQtp5y0OM80HiQIoWlSE4d4yv63HHJZhK+DRui6ZZbhEyAunV/66cl06743AnR
         xL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zo5b9oAMJxSu5/Hy0Le1bGMGDE+MMQmIJStIVXoA4sg=;
        fh=ZAtPgNT/mWeTZ6vNEkZRyB0hM0YzwkpsSL1tZLHA+mM=;
        b=DmAWaQzNFQjwF/ns1eUkuIzJoN65aM+n8algTyi8okPueMaQ9mfHKTcfVp9cTOQGw4
         /R7PFcjkow+eIMD8590v2Oh8Xdzz4yrQdSjJI7Yd88VZUX7YA20KobtDNPCI/orn3xJT
         YVL4vfJ8EP474fswaAY93gs94lLa71NqFAFG1zGEfXZpORQL2Qs+wTX8142UT7y2CQTG
         zjvj/nKECOF2HkU3ZjtWa4kQEkrt+pCCaHOmgf6HPXpRuLiXaPJWqvwQzyoki6kczWWY
         1V7ewbrfvRar1TDJF3yIb/iOU3owc6bQqI6cwBtfMT5JRX6K9HMD3msBB7/W+4wfWUy5
         AdxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778312111; x=1778916911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo5b9oAMJxSu5/Hy0Le1bGMGDE+MMQmIJStIVXoA4sg=;
        b=movnumcKPsNQNmi9GH0pDZNjlQjJ5ctejWY9u3cryXNkCBWyVdd1I2EGPzfy90rjXV
         KZj5afnR1yYDMOESJ5yEs0K4r7br+JUtACHV457cpk5rMXs3P26iqfsWmkd/TGhxBNBp
         AvTA2Pr9FnyCvZimaJ/Z1YPJndoIqrt3hA7isC1GQcstp3u12ss2oVecmFnhDrdTQg0F
         dYyAHCqlLInU875P4M7XmAFpfYJnHQTjbtuw8ZMLltdtYJRrrae95GDuS/bDsuUZ4Uso
         dpfxE/aCBrZtld8gGGI7YphXixW9H9TN9le5dojkO25odY3GbWnxCUvBCrNM5iApIPPE
         WI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778312111; x=1778916911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zo5b9oAMJxSu5/Hy0Le1bGMGDE+MMQmIJStIVXoA4sg=;
        b=kyx7Y927so7Xk8ZPesyzCKVGuL9yKAH6tpPpl3k77KVrGthdOTbIPuwoQAxXJObeXy
         TrokaHioDJVomDmZ1xMIhxbt+3ukBKWv8y1Go7LB648zbNh6RKff3Vm8BnEqSSZ6eoqf
         g8kOMiuRxC2jKpKByiUm279kMnnFnAGbGPHJXsOEFVCz4+gMlWk5svpZnOE02KXZjWOh
         GMnz7npUEiRqfhzqHW0cEfvDcJ5zC2lBzCyNG6eeLpYHjT2nRXPDaXe6SyTYOX02aFtG
         hvM1kIjucITWM2nsUgpiXpL829V0iV5VQSimJOiX3mSviRB54U7xLF1eAurP2J6EgaaT
         OYlQ==
X-Gm-Message-State: AOJu0YxyLjOcQ4Az3cvq45sJTc4RdwUwt93KTJsFqI83l4jSlsByCNiA
	XhlA1NLz/jtA4FozPDewyf8vDH7O8wQfbyfEulXZKPzhbM3hXBbTqnkG+pku+cY4jm0DZvDNNEE
	ka3FO1sA/3btI0TAhbZBDDqERZWe8X2rq1MOv2w5Ajg==
X-Gm-Gg: AeBDiev7jy9q6/ATsXmVlJ0oCtx38wC4wAPOXcyj+x4eLcvGNMdW9FnEuZ3AbVPuF0A
	As1UAh1DLidZNgV8VrduX2twq3UkBiCNgGZPCtZggQn18TbrHXWPl9kziJeeA/4OlO0ckcO0l9o
	oJ5CGSZW40cleEYh8TJI+9nbtNGfw42suCyUDicWMUYpdiIrITKTmhalNIalQRskAs9rrWAUSuG
	oNLMiUbYaTbRCAmsB4gal5yOp2bPlNi9sdO7RjrtSHxi8J9rLfrApr+7Mo1i9BruAmsrZ6yEMOY
	Izpv1mS5jrqzVN3XawlHA5/SNSVcpWO8EWRSaQ56sV5D/3P5+JEncHRZt6/SO3VlKr7vA9pmbQL
	L7AGCX7dl5FfDr5N7A7mzCAnFsWlL5eL2MTQi
X-Received: by 2002:a05:6820:608:b0:694:8c46:e2cc with SMTP id
 006d021491bc7-69b36b3de7fmr960190eaf.16.1778312111511; Sat, 09 May 2026
 00:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
In-Reply-To: <cover.1778176768.git.evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 May 2026 13:04:59 +0530
X-Gm-Features: AVHnY4JJCIN8CFrm88P2qZtGOZ4acSZXBdKDO41xlUclyGjKLhom-3tTRMeE5r4
Message-ID: <CAAhSdy1w_D5_kF0Ct2RWSAO8=SCfAPmrKZY5ZMXuwPYrBDUTgg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add RNMI handler infrastructure for Smrnmi extension
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_003512_992728_612B623F 
X-CRM114-Status: GOOD (  13.91  )
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

T24gVGh1LCBNYXkgNywgMjAyNiBhdCAxMTozOOKAr1BNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFRoaXMgaXMgdjMgb2YgdGhlIFNtcm5taSBz
ZXJpZXMuIEJhc2VkIG9uIHVwc3RyZWFtL21hc3RlciBhdCBjb21taXQKPiAyMjU3ZTk5NTcxMDMg
KCJsaWI6IHNiaV9iaXRtYXBfdGVzdDogYWRkIHRlc3RzIGZvciBiaXRtYXBfZW1wdHkoKSIpLgo+
Cj4gdjEgdGhyZWFkOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5zYmkvMjAyNjAzMTAx
ODMxNTUuMjE4NjQ2My0xLWV2dm9ldm9kQG9zcy50ZW5zdG9ycmVudC5jb20vCj4KPiB2MiB0aHJl
YWQ6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDUwMTIxMTYyNy4zMjkz
MTI2LTEtZXZ2b2V2b2RAdGVuc3RvcnJlbnQuY29tLwo+Cj4gQ2hhbmdlcyB2cyB2MjoKPgo+IC0g
U3BsaXQgZm9ybWVyIHBhdGNoIDQgKCJDcmVhdGUgYSBzcG90IC4uLiIpIGludG8gdHdvIHBhdGNo
ZXMgcGVyCj4gICBBbnVwJ3MgcmV2aWV3Ogo+ICAgICAqIFBhdGNoIDQgb25seSBtb3ZlcyBzYmlf
cGxhdGZvcm1fZXh0ZW5zaW9uc19pbml0KCkgdG8gdGhlCj4gICAgICAgYmVnaW5uaW5nIG9mIGhh
cnRfZGV0ZWN0X2ZlYXR1cmVzKCkuCj4gICAgICogUGF0Y2ggNSBtb3ZlcyBaa3Igc3RhY2stZ3Vh
cmQgaW5pdGlhbGl6YXRpb24gb3V0IG9mIGZ3X2Jhc2UuUwo+ICAgICAgIGludG8gaW5pdF9jb2xk
Ym9vdCgpIGluIEMsIGRyb3BzIHRoZSBhc20KPiAgICAgICBfX3N0YWNrX2Noa19ndWFyZF9pbml0
KCkgaGVscGVyLgo+Cj4gVGVzdGluZzogVmVyaWZpZWQgb24gV2hpc3BlciBTVyBzeXN0ZW0gc2lt
dWxhdG9yIGFuZCBvbiBIVyBlbXVsYXRvci4KPgo+IEV2Z2VueSBWb2V2b2RpbiAoNik6Cj4gICBp
bmNsdWRlOiBzYmlfc2NyYXRjaDogQWRkIHRtcDEgc2NyYXRjaCBzcGFjZSBmb3IgUk5NSSBjb250
ZXh0IHNhdmluZwo+ICAgbGliOiBzYmk6IEFkZCBTbXJubWkgZXh0ZW5zaW9uIG1hY3JvcyBmb3Ig
cmVnaXN0ZXJzIGFuZCBiaXRzCj4gICBmaXJtd2FyZTogQWRkIFJOTUkgaGFuZGxlciBpbmZyYXN0
cnVjdHVyZQo+ICAgbGliOiBzYmk6IGhhcnQ6IE1vdmUgZGV2aWNlIHRyZWUgZmVhdHVyZXMgZGV0
ZWN0aW9uIGJlZm9yZSB0cmFwLWJhc2VkCj4gICAgIGNoZWNrcwo+ICAgbGliOiBzYmk6IE1vdmUg
WmtyIGVudHJvcHkgaW5pdGlhbGl6YXRpb24gZnJvbSBmd19iYXNlLlMgdG8KPiAgICAgaW5pdF9j
b2xkYm9vdAo+ICAgbGliOiBzYmk6IGhhcnQ6IERldGVjdCBhbmQgZW5hYmxlIFNtcm5taSBiZWZv
cmUgdHJhcC1iYXNlZCBmZWF0dXJlCj4gICAgIGRldGVjdGlvbgo+Cj4gIGZpcm13YXJlL2Z3X2Jh
c2UuUyAgICAgICAgICAgfCAxNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0K
PiAgaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCB8ICAxMCArKysKPiAgaW5jbHVkZS9zYmkv
c2JpX2hhcnQuaCAgICAgICB8ICAgMiArCj4gIGluY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oICAg
fCAgIDggKysKPiAgaW5jbHVkZS9zYmkvc2JpX3NjcmF0Y2guaCAgICB8ICAxMSArKy0KPiAgaW5j
bHVkZS9zYmkvc2JpX3RyYXAuaCAgICAgICB8ICAgMiArCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAg
ICAgICAgICAgfCAgMzcgKysrKysrKy0tCj4gIGxpYi9zYmkvc2JpX2luaXQuYyAgICAgICAgICAg
fCAgMzEgKysrKysrKwo+ICBsaWIvc2JpL3NiaV90cmFwLmMgICAgICAgICAgIHwgIDM5ICsrKysr
KysrKwo+ICA5IGZpbGVzIGNoYW5nZWQsIDI1NCBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi40My4wCj4KCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29w
ZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
