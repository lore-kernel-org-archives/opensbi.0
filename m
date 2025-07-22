Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9C5C83F1A
	for <opensbi@archiver.kernel.org>; Tue, 22 Jul 2025 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F76Cd/qsT+5JzyZhrKnb2J4RyTUO24wU+73Z79ORYdo=; b=DgsQ7tDPvn11YL
	s93lvdNHAWYb9IYWXoV8ysf2gN0kAaWJoaNMNwHmXJfRx9cJbHzXPH1IBGXYilcxPMNRmBOfn6mKV
	BoOS6K+4N9fD+r6dVmropAJKVXvMaYCKaCDypfWiH6DGGqVV00GMXMRiTKfWIA9z2fAKWqJuGVats
	GYXdiOMouxtwAL7qkwfs1BUoFtc4B+FFaXCPASkkOOy4wLqdrcBmCTw5TPThBZKiDx29k5NWcfGIL
	KwBzzTLPI8LFFBOrf9aCog/fTJaoalJvI71yu8qRvj41pg0IBKoTrYTZnLvBKUvTR4Mr6puArdEKq
	Tv5NAOGO/0dd3BSekEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKra-00000003Xfl-1bgQ;
	Tue, 22 Jul 2025 21:49:30 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKe9-00000003WXR-3NmT
	for opensbi@lists.infradead.org;
	Tue, 22 Jul 2025 21:35:38 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-32f1df5b089so54747321fa.3
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753220134; x=1753824934; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZTdqTEru8kQVZLvCwxFs8xe84YHXm696nYtnDSCY3g=;
        b=M0bxgljBqzqLdkIoHudPB/DnMjPzIvA0SUyNw0T+uA8WmBwCl9Dj99sSojjL9ccrcd
         CSyUWVa3Z/6YsswFoQNDAPeucTh+eEeMOK/+J8j+f3MNf/YT7jEo+vEfpDxHQkHmEFus
         bTNpZGSqJgRgCV1L06pY4yKfcfozcnPAXWeycgt/n84gOrIgXv6ZMJNiGcL1gLVRp+4j
         p8fS6Ditkf9l2zndRiofjoqkFPmzX1Sc+GRuHABIJnvi5WfgXotctFlyUSnWozp6Tlf7
         NMl1wkXwThagt4WzuP3Vqri8mxCFdL5faCRCfopCcu9HPmo1PRk413qEV0xCue4xCHq8
         0rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753220134; x=1753824934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZTdqTEru8kQVZLvCwxFs8xe84YHXm696nYtnDSCY3g=;
        b=nnSAybwo53p5nTsRMZnFNZd2tAfoc5UyMEU9wgZ6mheL0ZP43kmEfC5TDKzdg17m8A
         54L8LXcnvOC9657BSwLUGEf2AHEs5M3APb3PQgr2vMmh5/mLnPTh/SjhJGvq1xyohbpn
         drbmvjIKeGN+RQbTwfuFSm1msIzqAtYWlLxxOKatUQbsxfoMiCiNTWqIfoW6u+s1yU4p
         Qa9PywdiHoOm1ewHthtT/zxItcVk7lLGTglXhN28ptJ+wYZSylPgQ0/vsz98OeAO6XcB
         txjXbpq33bVwjiQS8uIHWJla1QzACPt01SCpDkcIyMTxJ3MmFSXWM14IQcWQ9rn+0GwM
         +eIA==
X-Gm-Message-State: AOJu0YxtY2dY6zm3x58MPU1nGsfuVbks7Evurg+QNc7XFxjFzWM/2Xc7
	kZtkfABc1527XXchjP8nhhimP/0ONRHaMJNSHa0d+l9zG8U+FHLHLQopRstPx8vK4GOublga4rS
	FtyxqxJLc0GbCSAzSTz33kf8JAx4h+Y4=
X-Gm-Gg: ASbGncvTIkbluNEmaNeuqqBmPIrGlrj3aACF9oi6443aEmQhrXDqPG7483muin+TS2N
	auRVeCCcqFAiS7o4LuEhpKJV3xyIXWBZYDsjCx4DpNUTK6vD+o31tgqCMskEDttNnrJ8R7gef7N
	tGhF3B+gdM03bbeyCHZU5OMD8+JxeG+q/dT0kT+rrXPngN0H1n41ISfATYBwSzdzfZyeaNFLOoN
	2S7BB0X
X-Google-Smtp-Source: AGHT+IFW42rUVaMDSmvQtlYx3+hmg1XWhycNKGiY8t146f94zDXqhWBtwF/5rELL+A0il1F8T1wf5woFSgOFycNxfXQ=
X-Received: by 2002:a2e:6e11:0:b0:32b:9652:2c35 with SMTP id
 38308e7fff4ca-330dfe3974emr1136351fa.23.1753220134014; Tue, 22 Jul 2025
 14:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250710231708.4553-1-cfu@mips.com> <65346468-9810-4f4a-9360-c588f758184f@sifive.com>
In-Reply-To: <65346468-9810-4f4a-9360-c588f758184f@sifive.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Tue, 22 Jul 2025 14:35:21 -0700
X-Gm-Features: Ac12FXzDreAdNgKYVkwHbXwQvW5Jp7osgIgxWHjej0p7Azx9tzISWFP8GRoFI1M
Message-ID: <CAM1rFzFxWbCf8SLXhGYyRtVx33m4F0-H7m87fmoPCBzp_k_C8g@mail.gmail.com>
Subject: Re: [PATCH v1] generic: mips: support harts to boot from mips_warm_boot
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_143537_845587_2BFEA68B 
X-CRM114-Status: GOOD (  17.28  )
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

T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgNTowNOKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjUtMDctMTAgNjoxNyBQTSwgQ2hh
by15aW5nIEZ1IHdyb3RlOgo+ID4gV2UgcHJvZ3JhbSByZXNldCBiYXNlIGZvciBoYXJ0cyAob3Ro
ZXIgdGhhbiBoYXJ0IDApIHRvIGJvb3QgYXQKPiA+IG1pcHNfd2FybV9ib290IHRoYXQganVtcHMg
dG8gX3N0YXJ0X3dhcm0uIFRoaXMgaGVscHMgdG8gc2tpcCBzb21lIGNvZGUKPiA+IHNlcXVlbmNl
IHRvIHNwZWVkIHVwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW8teWluZyBGdSA8Y2Z1QG1p
cHMuY29tPgo+ID4gLS0tCj4gPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMgfCAxOSAr
KysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMgYi9wbGF0
Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYwo+ID4gaW5kZXggODg4YTQ1Yy4uNjg3OTEyYSAxMDA2
NDQKPiA+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5jCj4gPiArKysgYi9wbGF0
Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYwo+ID4gQEAgLTE0MCw2ICsxNDAsMjIgQEAgc3RhdGlj
IHZvaWQgcG93ZXJfdXBfb3RoZXJfY2x1c3Rlcih1MzIgaGFydGlkKQo+ID4gIH0KPiA+ICAjZW5k
aWYKPiA+Cj4gPiArc3RhdGljIHZvaWQgX19hdHRyaWJ1dGVfXygobmFrZWQsbm9faW5zdHJ1bWVu
dF9mdW5jdGlvbixhbGlnbmVkKDQwOTYpKSkKPiA+ICttaXBzX3dhcm1fYm9vdCh2b2lkKQo+ID4g
K3sKPiA+ICsgIF9fYXNtX18gX192b2xhdGlsZV9fKAo+ID4gKyAgICAgIiAgICAgICBqICAgICAg
IDFmXG4iCj4gPiArICAgICAiICAgICAgIC5hbGlnbiAgMlxuIgo+ID4gKyAgICAgIiAgICAgICBq
ICAgICAgIDFmXG4iCj4gPiArICAgICAiICAgICAgIC5hbGlnbiAgMlxuIgo+ID4gKyAgICAgIiAg
ICAgICBqICAgICAgIDFmXG4iCj4gPiArICAgICAiICAgICAgIC5hbGlnbiAgMlxuIgo+ID4gKyAg
ICAgIiAgICAgICBqICAgICAgIDFmXG4iCj4gPiArICAgICAiMTogICAgIGxsYSAgICAgdDAsIF9z
dGFydF93YXJtXG4iCj4gPiArICAgICAiICAgICAgIGpyICAgICAgdDBcbiIKPgo+IFRoZSBkb3Vi
bGUvaW5kaXJlY3QganVtcCBpcyBub3QgbmVjZXNzYXJ5LiBqYWwgKGopIHJhbmdlIGlzICsvLSAx
IE1pQiwgd2hpY2ggaXMKPiBtdWNoIGxhcmdlciB0aGFuIHRoZSBPcGVuU0JJIGZpcm13YXJlIHNp
emUuIFNvIGVhY2ggZW50cnkgcG9pbnQgY2FuIGp1bXAgdG8KPiBfc3RhcnRfd2FybSBkaXJlY3Rs
eS4KPgo+IFJlZ2FyZHMsCj4gU2FtdWVsCiAgWWVzLCB3ZSBjYW4gdXNlIG9ubHkgb25lIGp1bXAg
aW5zdHJ1Y3Rpb24gdG8gX3N0YXJ0X3dhcm0gZm9yIGVhY2gKZW50cnkgcG9pbnQsIGFzIHlvdSBw
b2ludGVkIG91dC4KSSB3aWxsIHNlbmQgb3V0IGEgbmV3IHBhdGNoLgoKICBUaGFua3MgYSBsb3Qh
CgpSZWdhcmRzLApDaGFvLXlpbmcKCj4KPiA+ICsgICAgICk7Cj4gPiArfQo+ID4gKwo+ID4gIHN0
YXRpYyBpbnQgbWlwc19oYXJ0X3N0YXJ0KHUzMiBoYXJ0aWQsIHVsb25nIHNhZGRyKQo+ID4gIHsK
PiA+ICAgICAgIHVuc2lnbmVkIGludCBzdGF0Owo+ID4gQEAgLTE1MCw2ICsxNjYsOSBAQCBzdGF0
aWMgaW50IG1pcHNfaGFydF9zdGFydCh1MzIgaGFydGlkLCB1bG9uZyBzYWRkcikKPiA+ICAgICAg
IGlmIChoYXJ0aWQgPT0gMCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9UU1VQUDsK
PiA+Cj4gPiArICAgICAvKiBDaGFuZ2UgcmVzZXQgYmFzZSB0byBtaXBzX3dhcm1fYm9vdCAqLwo+
ID4gKyAgICAgd3JpdGVfZ2NyX2NvX3Jlc2V0X2Jhc2UoaGFydGlkLCAodW5zaWduZWQgbG9uZylt
aXBzX3dhcm1fYm9vdCwgbG9jYWxfcCk7Cj4gPiArCj4gPiAgICAgICBpZiAoY3B1X2hhcnQoaGFy
dGlkKSA9PSAwKSB7Cj4gPiAgICAgICAgICAgICAgIC8qIEVuc3VyZSBpdHMgY29oZXJlbmN5IGlz
IGRpc2FibGVkICovCj4gPiAgICAgICAgICAgICAgIHdyaXRlX2djcl9jb19jb2hlcmVuY2UoaGFy
dGlkLCAwLCBsb2NhbF9wKTsKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
