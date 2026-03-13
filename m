Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680D8106FD61
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 01:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23ekqmX4hLZEQUDuINYlFdq3QwWOOKVdY8oVuAOfzyk=; b=UdUPj25EE6Y6VR
	L2gvQcYxu/GA21crrg4o3Z/VunSUZxnSYWActQUkQEvKAhUD9XmATNtWaL0fYokjmlQ3hHFvKcw9f
	iRp8btHCkA+Isrybqv/KmTL7dNdwFF+ERs1cDjKkUZO1CMuVs3Q8hORJNCmtYJ+4bz/adH8DcW7sB
	kq/SMFGo5GX6HoC8N8rgbikZwSvk+UXNUvES8qjA0ZAUoDC0/IIWIVRfhasVPLrguUb8ud2rPZK/Q
	VdpZSQIJFJRQe0w1FULD5GNaVlBllC19FlSEzEOEkbLb9YgqWNd3FpAIsKOskIlePa+3KI6IxrllA
	qBUP78fnLdfjryzPJtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0r5t-0000000G2Rl-1FJu;
	Fri, 13 Mar 2026 01:13:37 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0r5q-0000000G2R0-2Ucp
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 01:13:36 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso2111110d50.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 18:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773364413; x=1773969213; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJMK5DyxkFqIx0hKOwvGSY66jL4fKOExkyM6+0mkIcs=;
        b=XvYQhBSNFY0NMvEYq5f/NrSxFnTrqX9LE3JKrbMnpJ++xxkwcwZjdkRDhUa/vcYWft
         Wp2kWff6AY+QqdLNSYRLN9HXxgMu8uu3EfzYd0wxAp7dXXlMwuBUqJp+afNo8tBpzNNJ
         e0QbmiAUg3hNxuCDHE2pJowyHag8vTbOfkFsUEOXmgWC1fQDQZCNwDCpOgWNg7GlvdfD
         XyyTprOYHUyAx+QfSIYHaPltIV7oUTlZ6qtscsv5BrElY0jfKxTZILJ4yZTSBLHgzWm+
         g1n+Z+MDYC78hq6Jq4qmllMkppwGkd/3McN6zKr2bM2uemGkbqt9prasdn/sV9t6FPLO
         Y5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773364413; x=1773969213;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJMK5DyxkFqIx0hKOwvGSY66jL4fKOExkyM6+0mkIcs=;
        b=Pb5cw6LnNvNgF8v8Bl5ZjhoUxy8QDdOqJU2bUzA0reo/Ltel0l6ZYxZ+heBIa7OaUc
         Lfd6AU4C6i2CXxoE5CkvmvuhcN3ccaoxlpBElWs8CTuGHS0pOvi8uBga5QqJJZapkpYr
         arJB7gBwBaLTl/uUrJrHHlw3HCvIE7hR1tpyPKU/dGQOv1n0gZCISlXl9bTCrnQqHi9I
         ASKlF0ioZo6+zwoSkOQCckaJu6vuIXDukNM5fDujrTw96xxMkyga8JosyMDORExiQipI
         2xTGiQLUuk9XRjSRVk5DXISg+18rIO17jq8s5/tKeOTz0ARXmur0dszbykPXrIzBfr8A
         WfKA==
X-Forwarded-Encrypted: i=1; AJvYcCX3bv0ckM/3FiVax7UMy8Mo8i7rdTXPV9GVU4UtuGSxQw4XjriTcWBmEU5FQZrzMUz8hU5i8P3/@lists.infradead.org
X-Gm-Message-State: AOJu0YxxZeV0ZujRSR79O52rXlhLAaGY0K2RGACpIZtoH5KGgZZXEtSK
	AO5mEwrqbfjTUYWu0+SIYFzctHyyR+r2lX2aNnYyuklc1VhEVZcXloyIu+mWHnzSfvY=
X-Gm-Gg: ATEYQzzKNNnsy8GMm21CYx3XuZjywVDMWYGIUC7rXyRMw2UHmqHaRAKPs7zUS+so0Rq
	0ayTGirx9OtGeZQPFMV/2foOyvgKIDjfXChgKCwkc1KrrJCvAx4CXXLjXUzWH2V3oXvQagLealQ
	+9920JaEEQsldZi8CX/cP40a1rK+JGbd9L0w887NGfADGl30LlnGI3in11tChlteDnVFd/j+Hla
	QBOrOWptP4XYGYiyNdo8TvURGH3mAecRGqHdxvszOP+KZ/WRFSIk+e1stN0fJdsXkGX+TeZEyG/
	NziHLeAMbB9HOgPrmojUkXiVpsa6KZf54lLI9D8XZ9qVA2ZFm0pzyQUmwRoZ1a1IWjE4eBKXTRG
	IRE+sdSL41M8AphTgFJl3C9hE0uWqL15bpmzJzmIaKnaTA/5vtjCTcIdpMoSB4TttB65o1t0t7x
	BsQLSejQkpADiwkixVF6AtYY7qrFiPyynrJetcsZTg
X-Received: by 2002:a53:b465:0:b0:64d:6815:25dc with SMTP id 956f58d0204a3-64e62f25dc8mr1333736d50.15.1773364413068;
        Thu, 12 Mar 2026 18:13:33 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b39cb8sm219741d50.11.2026.03.12.18.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 18:13:32 -0700 (PDT)
Message-ID: <3208508c-cf73-4878-9d87-76d58e821cc4@sifive.com>
Date: Thu, 12 Mar 2026 20:13:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] OpenSBI: Lazy floating-point and vector context switching
From: Samuel Holland <samuel.holland@sifive.com>
To: dave.patel@riscstar.com
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, opensbi@lists.infradead.org
References: <20260311171103.70074-1-dave.patel@riscstar.com>
 <1b1d72fb-482f-49db-b41b-53bfef6edb3d@iscas.ac.cn>
 <88dca6b0-46cc-453d-8a5f-00e0c7181550@sifive.com>
 <ec7f6648-c2a7-4250-8079-fb5baefb0bf3@iscas.ac.cn>
 <56c57ce1-5ac4-44b9-81c0-02c6025c4edc@sifive.com>
Content-Language: en-US
In-Reply-To: <56c57ce1-5ac4-44b9-81c0-02c6025c4edc@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_181334_691675_F971F2DB 
X-CRM114-Status: GOOD (  26.91  )
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

SGkgRGF2ZSwKCk9uIDIwMjYtMDMtMTIgNjoyMyBQTSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4g
T24gMjAyNi0wMy0xMiAxMjozMyBQTSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4+IE9uIDMvMTIvMjYg
MjI6MTMsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4gT24gMjAyNi0wMy0xMiA0OjE0IEFNLCBW
aXZpYW4gV2FuZyB3cm90ZToKPj4+PiBPbiAzLzEyLzI2IDAxOjExLCBkYXZlLnBhdGVsQHJpc2Nz
dGFyLmNvbSB3cm90ZToKPj4+Pj4gSGkgT3BlblNCSSBtYWludGFpbmVycyBhbmQgY29tbXVuaXR5
LAo+Pj4+Pgo+Pj4+PiBJIGFtIHdvcmtpbmcgb24gYW4gaW1wbGVtZW50YXRpb24gdG8gc3VwcG9y
dCBmbG9hdGluZy1wb2ludCAoRlApIGFuZAo+Pj4+PiB2ZWN0b3IgcmVnaXN0ZXIgY29udGV4dCBt
YW5hZ2VtZW50IGR1cmluZyBkb21haW4gYW5kIGFwcGxpY2F0aW9uCj4+Pj4+IGNvbnRleHQgc3dp
dGNoZXMgaW4gT3BlblNCSS4KPj4+Pj4KPj4+Pj4gQ3VycmVudGx5LCBPcGVuU0JJIHNhdmVzIGFu
ZCByZXN0b3JlcyBvbmx5IHRoZSBpbnRlZ2VyIHJlZ2lzdGVyCj4+Pj4+IGNvbnRleHQgd2hlbiBo
YW5kbGluZyB0cmFwcyBvciBkb21haW4gdHJhbnNpdGlvbnMuIFRoZSBGUCByZWdpc3RlcnMKPj4+
Pj4gKGYw4oCTZjMxKSBhbmQgdmVjdG9yIHJlZ2lzdGVycyAodjDigJN2MzEpIGFyZSBub3QgY3Vy
cmVudGx5IG1hbmFnZWQgYnkKPj4+Pj4gT3BlblNCSS4KPj4+Pj4KPj4+Pj4gV2l0aCBpbmNyZWFz
aW5nIGFkb3B0aW9uIG9mIHRoZSBSSVNDLVYgdmVjdG9yIGV4dGVuc2lvbiBhbmQKPj4+Pj4gZmxv
YXRpbmctcG9pbnQgd29ya2xvYWRzLCBpdCBiZWNvbWVzIGltcG9ydGFudCB0byBlbnN1cmUgY29y
cmVjdAo+Pj4+PiBiZWhhdmlvciB3aGVuIFMtbW9kZSBzb2Z0d2FyZSBvciB0cnVzdGVkIGFwcGxp
Y2F0aW9ucyB1c2UgdGhlc2UKPj4+Pj4gZXhlY3V0aW9uIHVuaXRzLgo+Pj4+Pgo+Pj4+PiBUaGlz
IGVtYWlsIHByb3Bvc2VzIGFuIGFwcHJvYWNoIHRvIHN1cHBvcnQgbGF6eSBGUCBhbmQgdmVjdG9y
Cj4+Pj4+IGNvbnRleHQgc3dpdGNoaW5nLCBhbGlnbmVkIHdpdGggdGhlIG1lY2hhbmlzbSBkZXNj
cmliZWQgaW4gdGhlCj4+Pj4+IFJJU0MtViBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24uCj4+Pj4+
Cj4+Pj4+IC0tLQo+Pj4+Pgo+Pj4+PiAjIyBCYWNrZ3JvdW5kCj4+Pj4+Cj4+Pj4+IEluIFJJU0Mt
ViwgdGhlIGBGU2AgKEZsb2F0aW5nLXBvaW50IFN0YXRlKSBhbmQgYFZTYCAoVmVjdG9yIFN0YXRl
KQo+Pj4+PiBmaWVsZHMgaW4gYG1zdGF0dXNgIC8gYHNzdGF0dXNgIGNvbnRyb2wgYWNjZXNzIHRv
IHRoZSBmbG9hdGluZy1wb2ludAo+Pj4+PiBhbmQgdmVjdG9yIHVuaXRzLgo+Pj4+Pgo+Pj4+PiBX
aGVuIHRoZXNlIGZpZWxkcyBhcmUgc2V0IHRvIGBPZmZgLCBhbnkgYXR0ZW1wdCB0byBleGVjdXRl
IEZQIG9yCj4+Pj4+IHZlY3RvciBpbnN0cnVjdGlvbnMgcmVzdWx0cyBpbiBhbiBpbGxlZ2FsIGlu
c3RydWN0aW9uIHRyYXAuCj4+Pj4+Cj4+Pj4+IFRoaXMgbWVjaGFuaXNtIGFsbG93cyBvcGVyYXRp
bmcgc3lzdGVtcyBhbmQgZmlybXdhcmUgdG8gaW1wbGVtZW50Cj4+Pj4+IGxhenkgY29udGV4dCBz
d2l0Y2hpbmcgd2hlcmUgRlAvdmVjdG9yIHJlZ2lzdGVycyBhcmUgc2F2ZWQgb3IKPj4+Pj4gcmVz
dG9yZWQgb25seSB3aGVuIHRoZXkgYXJlIGFjdHVhbGx5IHVzZWQuCj4+Pj4gVGhpcyBkb2VzIG5v
dCB3b3JrIGluIE1hY2hpbmUgbW9kZSwgd2hlcmUgT3BlblNCSSByZXNpZGVzLgo+Pj4+Cj4+Pj4g
U2VlIHByaXZpbGVnZWQgc3BlYywgc2VjdGlvbiAiRXh0ZW5zaW9uIENvbnRleHQgU3RhdHVzIGlu
IG1zdGF0dXMKPj4+PiBSZWdpc3RlciI6ICJNYWNoaW5lIGFuZCBTdXBlcnZpc29yIG1vZGVzIHNo
YXJlIGEgc2luZ2xlIGNvcHkgb2YgdGhlIEZTLAo+Pj4+IFZTLCBhbmQgWFMgYml0cy4iCj4+Pj4K
Pj4+PiBUaGlzIG1lYW5zIHRoYXQgYSBTdXBlcnZpc29yIG1vZGUgcHJvZ3JhbSBjYW4gc2V0IHNz
dGF0dXMuRlMgdG8gRGlydHksCj4+Pj4gYWNjZXNzIGZsb2F0aW5nIHBvaW50IHN0YXRlLCBhbmQg
c2V0IHNzdGF0dXMuRlMgYmFjayB0byBPZmYgd2l0aG91dAo+Pj4+IE1hY2hpbmUgbW9kZSBzb2Z0
d2FyZSBub3RpY2luZyBldmVyLgo+Pj4+Cj4+Pj4gU2VlIGFsc28gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvaXNzdWVzLzgzMgo+Pj4+ICJJbXBvc3NpYmxlIHRvIGlt
cGxlbWVudCBIUy1sZXZlbCBzc3RhdHVzLntGUyxWU30gPSBPZmYgd2l0aAo+Pj4+IHNvZnR3YXJl
LWVtdWxhdGVkIGh5cGVydmlzb3IgZXh0ZW5zaW9uPyIgd2hlcmUgSSByYW4gaW50byB0aGUgc2Ft
ZQo+Pj4+IHByb2JsZW0gaW4gYSBkaWZmZXJlbnQgY29udGV4dC4KPj4+Pgo+Pj4+IFNvIGJhc2lj
YWxseSwgbGF6eSBzYXZpbmcvcmVzdG9yaW5nIEYgYW5kIFYgaW4gTWFjaGluZSBtb2RlIHdpdGgK
Pj4+PiBtdWx0aXBsZSBTdXBlcnZpc29yIG1vZGUgcHJvZ3JhbXMgaXMgbm90IGEgZGVzaWduZWQg
ZmVhdHVyZSwgYW5kIGlzIG5vdAo+Pj4+IHBvc3NpYmxlIGFzIHRoZSBwcml2aWxlZ2VkIGFyY2hp
dGVjdHVyZSBpcyBjdXJyZW50bHkgZGVzaWduZWQuIEZvciB0aGVzZQo+Pj4+IHVzZSBjYXNlcyBu
b24tbGF6eSBzd2l0Y2hpbmcgaXMgcmVxdWlyZWQuCj4+PiBBcyB5b3UgbWVudGlvbmVkIGluIGlu
IHRoYXQgR2l0aHViIGlzc3VlLCBpdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGZvcmNlCj4+PiBmbG9h
dGluZy1wb2ludCBpbnN0cnVjdGlvbnMgdG8gdHJhcCBieSBjbGVhcmluZyBtaXNhLkYuIEhvd2V2
ZXIsIG5vdGUgdGhpcwo+Pj4gY2xhdXNlIGluIHRoZSBtaXNhIHNwZWNpZmljYXRpb246Cj4+Pgo+
Pj4gIldoZW4gc29mdHdhcmUgZW5hYmxlcyBhbiBleHRlbnNpb24gdGhhdCB3YXMgcHJldmlvdXNs
eSBkaXNhYmxlZCwgdGhlbiBhbGwgc3RhdGUKPj4+IHVuaXF1ZWx5IGFzc29jaWF0ZWQgd2l0aCB0
aGF0IGV4dGVuc2lvbiBpcyBVTlNQRUNJRklFRCwgdW5sZXNzIG90aGVyd2lzZQo+Pj4gc3BlY2lm
aWVkIGJ5IHRoYXQgZXh0ZW5zaW9uLiIKPj4+Cj4+PiBTbyBmbG9hdGluZy1wb2ludCBzdGF0ZSBt
dXN0IGFsd2F5cyBiZSBzYXZlZCBvbiBhIG1pc2EuRiAxLT4wIHRyYW5zaXRpb24gYW5kCj4+PiBy
ZXN0b3JlZCBvbiBhIG1pc2EuRiAwLT4xIHRyYW5zaXRpb24uIFRoaXMgZG9lcyBzb21ld2hhdCBy
ZWR1Y2UgdGhlCj4+PiBlZmZlY3RpdmVuZXNzIG9mIHRoZSBsYXp5IGNvbnRleHQgc2F2aW5nLCBi
dXQgc3RpbGwgcHJvdmlkZXMgc29tZSBiZW5lZml0LiBBbmQKPj4+IHRoaXMgc2NoZW1lIGdyYWNl
ZnVsbHkgZGVncmFkZXMgb24gc3lzdGVtcyB3aGVyZSBtaXNhLkYgaXMgbm90IHdyaXRhYmxlLiBT
bwo+Pj4gdW5sZXNzIEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIGhpZGluZyBGUCBzdGF0ZSB1c2lu
ZyBtaXNhIGJpdHMgc2hvdWxkIHdvcmsgZm9yCj4+PiB0aGUgY3VycmVudCB1c2UgY2FzZS4KPj4K
Pj4gSSdtIGEgYml0IGNvbmZ1c2VkIGFib3V0IHRoZSAwLT4xIGFuZCAxLT4wIHRyYW5zaXRpb24g
dGVybWlub2xvZ3kgYnV0IEkKPj4gZ2V0IHRoZSBpZGVhLiBJdCAqd291bGQqIHdvcmssIHllcy4K
PiAKPiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4gVG8gcmV3b3JkOiB0aGUgRlAgY29udGV4dCBt
dXN0IGJlIHNhdmVkIGV2ZXJ5IHRpbWUgdGhlCj4gbWlzYS5GIGJpdCBpcyBjbGVhcmVkIChGL0Qv
ViBleHRlbnNpb24gZGlzYWJsZWQpLCBiZWNhdXNlIGl0IG11c3QgYmUgcmVzdG9yZWQKPiBldmVy
eSB0aW1lIHRoZSBtaXNhLkYgYml0IGlzIGxhdGVyIHNldCAoRiBleHRlbnNpb24gZW5hYmxlZCks
IGJlY2F1c2UgdGhlCj4gcmVnaXN0ZXIgc3RhdGUgaXMgb3RoZXJ3aXNlIHVuc3BlY2lmaWVkIGlt
bWVkaWF0ZWx5IGFmdGVyIHRoZSBtaXNhLkYgYml0IGlzIHNldC4KPiAKPiBUaGlzIGlzIGluIGNv
bnRyYXN0IHRvIG1zdGF0dXMuRlMsIHdoZXJlIHlvdSBjYW4gc2V0IHRoZSBmaWVsZCB0byBPZmYg
d2hpbGUgdGhlCj4gRlAgcmVnaXN0ZXJzIGhvbGQgZG9tYWluIEEncyBjb250ZXh0LCBzd2l0Y2gg
dG8gZG9tYWluIEIgYW5kIGJhY2sgdG8gQSwgdGhlbiBzZXQKPiBtc3RhdHVzLkZTIGJhY2sgdG8g
RGlydHksIGFsbCB3aXRob3V0IGxvc2luZyBhbnkgcmVnaXN0ZXIgc3RhdGUuIFNvIG1pc2EuRiBp
cwo+IG5vdCBhcyBsYXp5IGFzIG1zdGF0dXMuRlMuCj4gCj4+IEl0J3MganVzdCB0aGF0IEkgYW0g
bm90IGF3YXJlIG9mIGFueSBleGlzdGluZyBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbgo+PiBoYXZp
bmcgd3JpdGFibGUgbWlzYS5GIGFuZC9vciBtaXNhLlYgKGFzIG9wcG9zZWQgdG8geHN0YXR1cy57
RlMsVlN9Cj4+IHdoaWNoIGFyZSBtYW5kYXRvcnkgaWYgRiBhbmQgViBhcmUgaW1wbGVtZW50ZWQs
IHJlc3BlY3RpdmVseSksIHNvIEkgZGlkCj4+IG5vdCBjb25zaWRlciBpdC4KPj4KPj4gVG8gbWUs
IHdyaXRhYmxlIG1pc2EgaXMgb25lIG9mIHRob3NlIGZ1bm55IGZlYXR1cmVzIHRoYXQgdGhlIHNw
ZWMKPj4gdGVjaG5pY2FsbHkgcGVybWl0cyBidXQgbm9ib2R5IGFjdHVhbGx5IGltcGxlbWVudHMg
aW4gSFcuIEknbSBoYXBweSB0bwo+PiBjaGFuZ2UgbXkgbWluZCBhYm91dCB0aGF0IGlmIHNvbWUg
cmVhbCBoYXJkd2FyZSBoYXMgd3JpdGFibGUgbWlzYS5GIGFuZAo+PiBtaXNhLlYuCj4gCj4gVGhh
dCdzIGZhaXIuIEkga25vdyBhdCBsZWFzdCBvbmUgcmVhbC1pc2ggaW1wbGVtZW50YXRpb24sIFJv
Y2tldFsxXSwgaGFzIHRoaXMKPiBjYXBhYmlsaXR5LCBidXQgSSdtIGFsc28gdW5hd2FyZSBvZiBh
IHB1YmxpYyBjb21tZXJjaWFsIFNvQyB3aXRoIHRoaXMgZmVhdHVyZS4KPiBUaGF0IGJlaW5nIHNh
aWQsIHNpbmNlIHRoaXMgaXMgdGhlIGV4aXN0aW5nIGFyY2hpdGVjdHVyYWwgd2F5IHRvIHRyYWNr
IEZQIHVzYWdlCj4gZnJvbSBNLW1vZGUgKGFkbWl0dGVkbHkgd2l0aCB0aGUgYWJvdmUgbGltaXRh
dGlvbiksIEkgd291bGQgZXhwZWN0IHB1c2hiYWNrIHRvCj4gYWRkaW5nIGFueSBkdXBsaWNhdGUg
b3Igb3ZlcmxhcHBpbmcgbWVjaGFuaXNtLiBTbyB3ZSBtaWdodCBzZWUgaW1wbGVtZW50YXRpb25z
Cj4gYWRkIHRoaXMgY2FwYWJpbGl0eSBhcyB0aGV5IHN0YXJ0IHRvIGFkZCBTdXBlcnZpc29yIERv
bWFpbnMgZmVhdHVyZXMuCgpJIHJhaXNlZCB0aGlzIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di9yaXNjdi1zbW10dC9pc3N1ZXMvMjY0IGFuZCB0aGUKcmVzcG9uc2UgZnJvbSBWZWQgd2FzICJF
bmhhbmNpbmcgc3VwcG9ydCBmb3IgbGF6eSBzYXZlL3Jlc3RvcmUgaGFzIGJlZW4KZGlzY3Vzc2Vk
IHByZXZpb3VzbHkgYW5kIGlzIG5vdCBsaWtlbHkgdG8gYmUgYWNjZXB0ZWQiLgoKU28gaXQgc2Vl
bXMgdGhhdCB0aGUgb3B0aW9ucyBhcmU6CjEpIGVhZ2VyIGNvbnRleHQgc3dpdGNoaW5nLAoyKSBv
cHRpb25hbGx5IHdpdGggb3Bwb3J0dW5pc3RpYyB1c2Ugb2YgbWlzYS57RCxGLFZ9IGlmIHRob3Nl
IGJpdHMgYXJlIHdyaXRhYmxlLgoKUmVnYXJkcywKU2FtdWVsCgoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
