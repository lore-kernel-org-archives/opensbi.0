Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE20C44521
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QikUgKQb53xSW0mclcYvZoKZp5hnPmATbFHrpRSbbjo=; b=iD8aHYnlbLrtD2
	UB8bk3gS9fQQPqN05mdMYRUCIFUaIudS3XQs11LTlASbottV2nfx0r7TXracmTXA3cORR6DI96nS/
	j0PtNY0ec8dEX1QVv/kswJQ2A9se/2s+o9bUbvpVF8NpOXkd/td+kK4ca/4wers58aatUu8fGiaMG
	JwviiyxXFfQ/5449wamPM7bt5ItLh4jCxf6sKtLkkjn8BWqRfjqMoEBjKwg+3/4HVjlml7o3ZYot0
	nhsLxqsMdIp13LEAgRG3aWfGTa1OtRiUhaoZ7wTlwxM4C2fpzMGNPnKCny+bpcCyJ/v/xhJawVBPL
	uBXZVM2OMqOmdaSB9KZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYe-000000066i1-1bYj;
	Mon, 20 Jul 2026 07:37:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYc-000000066gc-0Uq4
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 07:36:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cace91f112so99063555ad.0
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 00:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784533017; x=1785137817; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PjmNmaclIEhlOkf2R90bet95AvkMrB3PbelnA+z6ySU=;
        b=eggnLpGpQK2495cAuRXQaRSXKH2WVvzBkogTE66hRAFqAj71teYsBV5xpjunoRB4NM
         +O7IYfObCS3BLZY2gIDdcj7ElcamBTWtMf0i0J8qnMj3FX5Ay3IQPP8FJjbVZlQWfMHa
         qYGJFELunYDdA1GSdC904vuTCGagZGrUj1kDfbqO6Ysg/OFltBWZrpegtESX5Yh1XdAI
         DLSKTeDals0IZBoDy6enxYzlZGlTJIwqvg6mZF5/aYzxCoZequIxpj56Qkgua+uH1rD2
         OKMkHwFIHWM41YCqdJki00GzlzFcAtVArLbSdL/LzQZ3DvKg/f3P0uLJDZHyBOl40YJ7
         K+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533017; x=1785137817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PjmNmaclIEhlOkf2R90bet95AvkMrB3PbelnA+z6ySU=;
        b=RAbsq4u7xMEzRYyXiZu6REnRJoZ7y/tFc467MLTzxf4IbRsZ1sZpSjUfoBvq4hp4x0
         9VmkO8cZRL0wlh2m2fw5dQUFQXabrVkhhdJB8ctnf+npAHp2o/SqLxbz+p54Nn2/VzLW
         uuCOYW0aSJDJ7aAn5wBzzHxKe+jaWLXrcnu23JMEgkmTF429dFFu5+KaoqogVawJp1yc
         BeKwW9ujDY2OFSfY458RAwQEm5o9FFlPMdxjJpFf0I/sC42nkmEvWf2ApXqjtzufF2lx
         A/eVqllXFo8ft3yUV+wet2v77I+R6LhUv6AgRwQGZ82mNrbV532r5q2b4bs5FH0qQb77
         7nKg==
X-Gm-Message-State: AOJu0YwNgT4PAa0n+fEPBuF0zdPrgzgKWEnOILTflAoj4pd9LrrPbo9K
	zml2+a9EDl1omc1stLZkQqkm1czcbHL8CigZnha8K6fVVYddJrMKo1xdzC5EFMxe2udfFWnLAZJ
	ciKQdrFM=
X-Gm-Gg: AfdE7clgUieZ9Zx3l0XjzezBsEqeqkv9eCuEJJmKgOH6rRpi1UkQcYcRdkNu4odynwe
	EtEw5GzmmIf/CVWb4iwL5HZenbXVwSBIklzm7R5+ZAeSZa4cwkKd4SsmxOiEaqdl47qa+OnjVjr
	vMPzPAAoDwgyi/CvafiAYyo/vrZgeHPCSy3yyIu+L79nh3DORS8jLum72gLfo4537h/BHARXV7S
	opMZCbcauuzUKcpdINtscFqV9zowfR8lfvBf8/Vp1Hrt7THJ5BIToMHZTlBk83bam9mS1OHASH+
	oxmfOSJwL2Y2J3VUPLw8QcWC7xjEK1Yrj3kOsjhRRnWt2+/WDAC5I1dnGtMpX1YAuXgeNh+RqfB
	R1waZyuWtqx5s+8FFZLjpuxWGCAbO9oE1vvZk4x2qk5ghdGnZBAB482PxGn/VYmuc9ViQ1N8Wi+
	65
X-Received: by 2002:a17:903:1245:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2cf348c009dmr132598875ad.21.1784533017094;
        Mon, 20 Jul 2026 00:36:57 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344be458sm52308025ad.25.2026.07.20.00.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:36:56 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:36:51 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com
Subject: Re: [RFC PATCH 04/12] lib: sbi_hart: lock mwid CSR for RoT
 immutability
Message-ID: <al3QE++JPwPBB9KJ@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-5-peter.lin@sifive.com>
 <CAAVgOkK0ccb2L2SGtx-LFRhjt83t9jN-e7AmCH0S_do-=yX-0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOkK0ccb2L2SGtx-LFRhjt83t9jN-e7AmCH0S_do-=yX-0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_003658_174557_05FE9019 
X-CRM114-Status: GOOD (  22.30  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMDI6Mjg6NTBQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3
cm90ZToKPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAzOjE24oCvQU0gWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gTG9jayB0aGUgTS1tb2Rl
IFdvcmxkIElEIChtd2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5pdGlhbGl6YXRpb24gdG8KPiA+
IGVuZm9yY2UgaW1tdXRhYmlsaXR5IG9mIHRoZSBXSUQgZXN0YWJsaXNoZWQgYnkgdGhlIHJvb3Qt
b2YtdHJ1c3QuCj4gPgo+ID4gT3BlblNCSSBkb2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBp
dHNlbGY7IGl0IG9ubHkgc2V0cyBNV0lEX0xPQ0sKPiA+IHRvIGZyZWV6ZSB0aGUgdmFsdWUgZXN0
YWJsaXNoZWQgYnkgcHJpb3IgUm9UIHN0YWdlLiBUaGUgTVdJRF9MT0NLIGJpdAo+ID4gYXQgWExF
Ti0xIGlzIHN0aWNreSBhbmQgbWFrZXMgdGhlIENTUiByZWFkLW9ubHkgdW50aWwgcmVzZXQsIGVu
Zm9yY2luZwo+ID4gYSB0ZW1wb3JhbCBzZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBX
b3JsZHMgc3BlY2lmaWNhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRl
ciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgbGliL3NiaS9zYmlfaGFy
dC5jIHwgNyArKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMK
PiA+IGluZGV4IGNiMGM2NmVhLi40ZmJlNDZkNyAxMDA2NDQKPiA+IC0tLSBhL2xpYi9zYmkvc2Jp
X2hhcnQuYwo+ID4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gPiBAQCAtODA0LDYgKzgwNCwx
MyBAQCBpbnQgc2JpX2hhcnRfcmVpbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiA+
ICAgICAgICAgaWYgKHJjKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiA+Cj4gPiAr
ICAgICAgIC8qCj4gPiArICAgICAgICAqIEFzc3VtZSBNV0lEIGlzIHJlc3RvcmVkIGJ5IHJvb3Qt
b2YtdHJ1c3QgTS1tb2RlIGluIHByZXZpb3VzCj4gPiArICAgICAgICAqIHN0YWdlLiBMb2NrIG13
aWQgc28gUm9ULWRlZmluZWQgV0lEIHJlbWFpbnMgaW1tdXRhYmxlLgo+ID4gKyAgICAgICAgKi8K
PiA+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRf
RVhUX1NNV0lEKSkKPiA+ICsgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9NV0lELCBNV0lEX0xP
Q0spOwo+IEF0IG1pbmltdW0sIGJlZm9yZSBsb2NraW5nLCByZWFkIGJhY2sgQ1NSX01XSUQgJiB+
TVdJRF9MT0NLIGFuZCB2ZXJpZnkKPiBpdCBtYXRjaGVzIGhmLT5wbXdpZC4gSWYgdGhleSBkb24n
dCBtYXRjaCwgdGhpcyBpcyBhIGZhdGFsIHNlY3VyaXR5Cj4gZXJyb3IgYW5kIHNiaV9wYW5pYygp
IGlzIGFwcHJvcHJpYXRlCgpJbiB0aGlzIHBhdGNoc2V0LCBPcGVuU0JJIHRydXN0cyB0aGF0IFJv
VCBNLW1vZGUgaGFzIHNldCBtd2lkIGNvcnJlY3RseQppbiB0aGUgcHJldmlvdXMgYm9vdCBzdGFn
ZS4gVGhlIGVhcmx5LWJvb3QgTS1tb2RlIG1heSBzZXQgbXdpZCB0byBhbnkKdmFsdWUgKHdpdGhp
biBwbXdpZGxpc3QgaWYgZXhpc3RzKSB3aGVuIHVubG9ja2VkIG9uIHJlc2V0LCBpbmRlcGVuZGVu
dApvZiBEVCdzIHJpc2N2LHBtd2lkICh3aGljaCBkZXNjcmliZXMgdGhlIHJlc2V0IGRlZmF1bHQs
IG5vdCBhIG1hbmRhdG9yeQpmaW5hbCB2YWx1ZSkuIEFkZGluZyBhIHBhbmljIHdvdWxkIGluY29y
cmVjdGx5IHRyZWF0IFJvVCdzIGxlZ2l0aW1hdGUKV0lEIHNlbGVjdGlvbiBhcyBhIHNlY3VyaXR5
IGVycm9yLiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKVGhhbmtzLApQZXRlciBMaW4KCj4gPiAr
Cj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAtLQo+ID4gMi40My43Cj4gPgo+
ID4KPiA+IC0tCj4gPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+ID4gb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
