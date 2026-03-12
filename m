Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01135106ACFB
	for <opensbi@archiver.kernel.org>; Thu, 12 Mar 2026 23:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=700BeS3hfhAKbD+xlBPaeFJrBs4QnCmpBGrz22ofnes=; b=09muwrRU1F1ifq
	68vtCyhLCQ5WT0ycqkIB8EfpJHFoKxBazC0zIzbLNSSPLhC80J8CterhseprJi1ocWVGpXxyQkj8x
	SNv+OL+LAbQDvm4cPVnaIx4MIJLDna+ldiQC55+8YgY/4HgEhV1jIEq1xTnhgmCgGf5DfAKhIzRgF
	ZRg33JWqle6YEYdRMuMNqHCUI/mLs+aM2wZ48/tcrP3Wm24UrknHPeBFOJu09VWLWYaM061ZyeW9e
	YwqWjo5UBu5O+7XLEkudotc8ISNvktSPCLgT6lN6H6Xa7jdIWKYwwLdX6HfM9ABvXm/wByY7EDucW
	pwwxosGQwYe3WoyDKcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pNp-0000000Flq2-1PXI;
	Thu, 12 Mar 2026 23:24:01 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pNm-0000000FlpQ-2spB
	for opensbi@lists.infradead.org;
	Thu, 12 Mar 2026 23:24:00 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-7982c3b7dfcso17598397b3.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 16:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773357837; x=1773962637; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZKg87jhEZuZniv8bOYMuYoA3x542zKvcM1GIaQLmB0=;
        b=Fjsk83JMCJg+Slm+WZpXr4vyLFxPkCuL9D1YTTAIFcFXiO4xtLun/vlydUiK1gTLF9
         SAt214YOIOQUrlXnxjiysViPUSbVsfYxONAW83jUr/2hYv3epUXni9u1Ro2/HqbqeLlt
         KjXfAwjdla+DuVjvyF+y3xjh5aBR7BZcqN+f+g4qVD+qhZiWwnwpfaNmU+aXHEU30Y62
         tl3DKfk8C/Q2BZVINpYeVIG6eL9RbtxTRulCBhdJ6ROZXoRFWYi7JvzSTwo9TR3XoT7/
         infkafs70ht+PCL/mSItfl/Nli8pM+mNHFlQ+SAY4kSiZUoPgYMVWnHxJWtGai+ilm9H
         eAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773357837; x=1773962637;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZKg87jhEZuZniv8bOYMuYoA3x542zKvcM1GIaQLmB0=;
        b=gf/6sp41jb3x5AUG1rGwIuWYM/3orxYqnciFJUOACH1eNDlZWsPi9n85yGix7+nIiH
         qPimYknU5veAyJ8xqQ+r4/91lLqj4A1pkf63aRUyaV3b40PVCE0xGyKPbpidOsvUcv3W
         ugqtrqOzq15W4QHf27vO63ubPBtwfAdwQYjIbHRY0VTn0h/dEn9ro8A5haE/Es+Vzd5l
         nbz7/ExIhXkgIVitjXKPTEzde25NZikP7KUGqcvlUBebuTmI1kXrmt/xT012i5bvCQhu
         B+5oWy+7LQIaldyDx+/tzH7LFWNDtjjB1w4g7hSgB8gJ0mL3TxpVfPB+dJZ4I9neK5tN
         qSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiDn8mifs4h70p0Jc65e/FoyEhxKz8T09W+09dsqEACAPOCsEDqwxR3G03sdRlHPhe9Q/ge4JG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7LDbcRBYtN4lTtk/nQ61ohBkPhJkgIojccoMylIOzJ/p5+kwr
	B9L5ga07AU8ItflVX8CTtDKwxWvPEgeTPq/czWZA/XhKB4Ah8hvdHsHe6WHeiN3ry+d5RTFcQWz
	FK3ld
X-Gm-Gg: ATEYQzzXZXJmTo9PtgGxEI9itQdlI2i+2brPQkTUUAnV9xPq1QP8Tk1OC5SnKVUTRcE
	VpyIuQBjmANdaTJJEYReawT1Ei69GFedTH45E4RJLF41CZ4j/lw/lAgWUZT2n90neBxcX7KkQoV
	bHLCfglZBU5QHtI7DR6IrB0JHy8honTKc92NRKKy/1i+PuoXw0+uolH3XRnoVLYU2wZSstVIsl7
	EgY+/2ZosNJaUpoRYw7BNNvCxKuIekPA8x7czDhkHZzvXpXiTSc62TjZXZTM/1LpV+FfxiYnGa+
	GD+hEUuApXZ/2aVZDfGZD7PTasLIAzkaXgk0wDJVwWYVikae3YRUPO/l/Pqh+esf5myQsXd9RDT
	wh3HfjlWuqDsmtd7zK7q4hfJ6hmdv5IL66X3d+PBLv7GtBoDLVuqNNbAHIXvbc/J64zormf8mfD
	iNGx3qe5k1BgUoWSsDgidGz/t6qyuYjp+IeFmMy2s=
X-Received: by 2002:a05:690c:7245:b0:798:58be:3242 with SMTP id 00721157ae682-79a1c2081d4mr15091217b3.57.1773357837344;
        Thu, 12 Mar 2026 16:23:57 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee574bsm38262137b3.26.2026.03.12.16.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 16:23:56 -0700 (PDT)
Message-ID: <56c57ce1-5ac4-44b9-81c0-02c6025c4edc@sifive.com>
Date: Thu, 12 Mar 2026 18:23:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] OpenSBI: Lazy floating-point and vector context switching
To: Vivian Wang <wangruikang@iscas.ac.cn>, dave.patel@riscstar.com,
 opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
References: <20260311171103.70074-1-dave.patel@riscstar.com>
 <1b1d72fb-482f-49db-b41b-53bfef6edb3d@iscas.ac.cn>
 <88dca6b0-46cc-453d-8a5f-00e0c7181550@sifive.com>
 <ec7f6648-c2a7-4250-8079-fb5baefb0bf3@iscas.ac.cn>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <ec7f6648-c2a7-4250-8079-fb5baefb0bf3@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_162358_755446_A344AECD 
X-CRM114-Status: GOOD (  25.01  )
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

SGkgVml2aWFuLAoKT24gMjAyNi0wMy0xMiAxMjozMyBQTSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4g
T24gMy8xMi8yNiAyMjoxMywgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+IE9uIDIwMjYtMDMtMTIg
NDoxNCBBTSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4+PiBPbiAzLzEyLzI2IDAxOjExLCBkYXZlLnBh
dGVsQHJpc2NzdGFyLmNvbSB3cm90ZToKPj4+PiBIaSBPcGVuU0JJIG1haW50YWluZXJzIGFuZCBj
b21tdW5pdHksCj4+Pj4KPj4+PiBJIGFtIHdvcmtpbmcgb24gYW4gaW1wbGVtZW50YXRpb24gdG8g
c3VwcG9ydCBmbG9hdGluZy1wb2ludCAoRlApIGFuZAo+Pj4+IHZlY3RvciByZWdpc3RlciBjb250
ZXh0IG1hbmFnZW1lbnQgZHVyaW5nIGRvbWFpbiBhbmQgYXBwbGljYXRpb24KPj4+PiBjb250ZXh0
IHN3aXRjaGVzIGluIE9wZW5TQkkuCj4+Pj4KPj4+PiBDdXJyZW50bHksIE9wZW5TQkkgc2F2ZXMg
YW5kIHJlc3RvcmVzIG9ubHkgdGhlIGludGVnZXIgcmVnaXN0ZXIKPj4+PiBjb250ZXh0IHdoZW4g
aGFuZGxpbmcgdHJhcHMgb3IgZG9tYWluIHRyYW5zaXRpb25zLiBUaGUgRlAgcmVnaXN0ZXJzCj4+
Pj4gKGYw4oCTZjMxKSBhbmQgdmVjdG9yIHJlZ2lzdGVycyAodjDigJN2MzEpIGFyZSBub3QgY3Vy
cmVudGx5IG1hbmFnZWQgYnkKPj4+PiBPcGVuU0JJLgo+Pj4+Cj4+Pj4gV2l0aCBpbmNyZWFzaW5n
IGFkb3B0aW9uIG9mIHRoZSBSSVNDLVYgdmVjdG9yIGV4dGVuc2lvbiBhbmQKPj4+PiBmbG9hdGlu
Zy1wb2ludCB3b3JrbG9hZHMsIGl0IGJlY29tZXMgaW1wb3J0YW50IHRvIGVuc3VyZSBjb3JyZWN0
Cj4+Pj4gYmVoYXZpb3Igd2hlbiBTLW1vZGUgc29mdHdhcmUgb3IgdHJ1c3RlZCBhcHBsaWNhdGlv
bnMgdXNlIHRoZXNlCj4+Pj4gZXhlY3V0aW9uIHVuaXRzLgo+Pj4+Cj4+Pj4gVGhpcyBlbWFpbCBw
cm9wb3NlcyBhbiBhcHByb2FjaCB0byBzdXBwb3J0IGxhenkgRlAgYW5kIHZlY3Rvcgo+Pj4+IGNv
bnRleHQgc3dpdGNoaW5nLCBhbGlnbmVkIHdpdGggdGhlIG1lY2hhbmlzbSBkZXNjcmliZWQgaW4g
dGhlCj4+Pj4gUklTQy1WIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbi4KPj4+Pgo+Pj4+IC0tLQo+
Pj4+Cj4+Pj4gIyMgQmFja2dyb3VuZAo+Pj4+Cj4+Pj4gSW4gUklTQy1WLCB0aGUgYEZTYCAoRmxv
YXRpbmctcG9pbnQgU3RhdGUpIGFuZCBgVlNgIChWZWN0b3IgU3RhdGUpCj4+Pj4gZmllbGRzIGlu
IGBtc3RhdHVzYCAvIGBzc3RhdHVzYCBjb250cm9sIGFjY2VzcyB0byB0aGUgZmxvYXRpbmctcG9p
bnQKPj4+PiBhbmQgdmVjdG9yIHVuaXRzLgo+Pj4+Cj4+Pj4gV2hlbiB0aGVzZSBmaWVsZHMgYXJl
IHNldCB0byBgT2ZmYCwgYW55IGF0dGVtcHQgdG8gZXhlY3V0ZSBGUCBvcgo+Pj4+IHZlY3RvciBp
bnN0cnVjdGlvbnMgcmVzdWx0cyBpbiBhbiBpbGxlZ2FsIGluc3RydWN0aW9uIHRyYXAuCj4+Pj4K
Pj4+PiBUaGlzIG1lY2hhbmlzbSBhbGxvd3Mgb3BlcmF0aW5nIHN5c3RlbXMgYW5kIGZpcm13YXJl
IHRvIGltcGxlbWVudAo+Pj4+IGxhenkgY29udGV4dCBzd2l0Y2hpbmcgd2hlcmUgRlAvdmVjdG9y
IHJlZ2lzdGVycyBhcmUgc2F2ZWQgb3IKPj4+PiByZXN0b3JlZCBvbmx5IHdoZW4gdGhleSBhcmUg
YWN0dWFsbHkgdXNlZC4KPj4+IFRoaXMgZG9lcyBub3Qgd29yayBpbiBNYWNoaW5lIG1vZGUsIHdo
ZXJlIE9wZW5TQkkgcmVzaWRlcy4KPj4+Cj4+PiBTZWUgcHJpdmlsZWdlZCBzcGVjLCBzZWN0aW9u
ICJFeHRlbnNpb24gQ29udGV4dCBTdGF0dXMgaW4gbXN0YXR1cwo+Pj4gUmVnaXN0ZXIiOiAiTWFj
aGluZSBhbmQgU3VwZXJ2aXNvciBtb2RlcyBzaGFyZSBhIHNpbmdsZSBjb3B5IG9mIHRoZSBGUywK
Pj4+IFZTLCBhbmQgWFMgYml0cy4iCj4+Pgo+Pj4gVGhpcyBtZWFucyB0aGF0IGEgU3VwZXJ2aXNv
ciBtb2RlIHByb2dyYW0gY2FuIHNldCBzc3RhdHVzLkZTIHRvIERpcnR5LAo+Pj4gYWNjZXNzIGZs
b2F0aW5nIHBvaW50IHN0YXRlLCBhbmQgc2V0IHNzdGF0dXMuRlMgYmFjayB0byBPZmYgd2l0aG91
dAo+Pj4gTWFjaGluZSBtb2RlIHNvZnR3YXJlIG5vdGljaW5nIGV2ZXIuCj4+Pgo+Pj4gU2VlIGFs
c28gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvaXNzdWVzLzgzMgo+
Pj4gIkltcG9zc2libGUgdG8gaW1wbGVtZW50IEhTLWxldmVsIHNzdGF0dXMue0ZTLFZTfSA9IE9m
ZiB3aXRoCj4+PiBzb2Z0d2FyZS1lbXVsYXRlZCBoeXBlcnZpc29yIGV4dGVuc2lvbj8iIHdoZXJl
IEkgcmFuIGludG8gdGhlIHNhbWUKPj4+IHByb2JsZW0gaW4gYSBkaWZmZXJlbnQgY29udGV4dC4K
Pj4+Cj4+PiBTbyBiYXNpY2FsbHksIGxhenkgc2F2aW5nL3Jlc3RvcmluZyBGIGFuZCBWIGluIE1h
Y2hpbmUgbW9kZSB3aXRoCj4+PiBtdWx0aXBsZSBTdXBlcnZpc29yIG1vZGUgcHJvZ3JhbXMgaXMg
bm90IGEgZGVzaWduZWQgZmVhdHVyZSwgYW5kIGlzIG5vdAo+Pj4gcG9zc2libGUgYXMgdGhlIHBy
aXZpbGVnZWQgYXJjaGl0ZWN0dXJlIGlzIGN1cnJlbnRseSBkZXNpZ25lZC4gRm9yIHRoZXNlCj4+
PiB1c2UgY2FzZXMgbm9uLWxhenkgc3dpdGNoaW5nIGlzIHJlcXVpcmVkLgo+PiBBcyB5b3UgbWVu
dGlvbmVkIGluIGluIHRoYXQgR2l0aHViIGlzc3VlLCBpdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGZv
cmNlCj4+IGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucyB0byB0cmFwIGJ5IGNsZWFyaW5nIG1p
c2EuRi4gSG93ZXZlciwgbm90ZSB0aGlzCj4+IGNsYXVzZSBpbiB0aGUgbWlzYSBzcGVjaWZpY2F0
aW9uOgo+Pgo+PiAiV2hlbiBzb2Z0d2FyZSBlbmFibGVzIGFuIGV4dGVuc2lvbiB0aGF0IHdhcyBw
cmV2aW91c2x5IGRpc2FibGVkLCB0aGVuIGFsbCBzdGF0ZQo+PiB1bmlxdWVseSBhc3NvY2lhdGVk
IHdpdGggdGhhdCBleHRlbnNpb24gaXMgVU5TUEVDSUZJRUQsIHVubGVzcyBvdGhlcndpc2UKPj4g
c3BlY2lmaWVkIGJ5IHRoYXQgZXh0ZW5zaW9uLiIKPj4KPj4gU28gZmxvYXRpbmctcG9pbnQgc3Rh
dGUgbXVzdCBhbHdheXMgYmUgc2F2ZWQgb24gYSBtaXNhLkYgMS0+MCB0cmFuc2l0aW9uIGFuZAo+
PiByZXN0b3JlZCBvbiBhIG1pc2EuRiAwLT4xIHRyYW5zaXRpb24uIFRoaXMgZG9lcyBzb21ld2hh
dCByZWR1Y2UgdGhlCj4+IGVmZmVjdGl2ZW5lc3Mgb2YgdGhlIGxhenkgY29udGV4dCBzYXZpbmcs
IGJ1dCBzdGlsbCBwcm92aWRlcyBzb21lIGJlbmVmaXQuIEFuZAo+PiB0aGlzIHNjaGVtZSBncmFj
ZWZ1bGx5IGRlZ3JhZGVzIG9uIHN5c3RlbXMgd2hlcmUgbWlzYS5GIGlzIG5vdCB3cml0YWJsZS4g
U28KPj4gdW5sZXNzIEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIGhpZGluZyBGUCBzdGF0ZSB1c2lu
ZyBtaXNhIGJpdHMgc2hvdWxkIHdvcmsgZm9yCj4+IHRoZSBjdXJyZW50IHVzZSBjYXNlLgo+IAo+
IEknbSBhIGJpdCBjb25mdXNlZCBhYm91dCB0aGUgMC0+MSBhbmQgMS0+MCB0cmFuc2l0aW9uIHRl
cm1pbm9sb2d5IGJ1dCBJCj4gZ2V0IHRoZSBpZGVhLiBJdCAqd291bGQqIHdvcmssIHllcy4KClNv
cnJ5IGZvciB0aGUgY29uZnVzaW9uLiBUbyByZXdvcmQ6IHRoZSBGUCBjb250ZXh0IG11c3QgYmUg
c2F2ZWQgZXZlcnkgdGltZSB0aGUKbWlzYS5GIGJpdCBpcyBjbGVhcmVkIChGL0QvViBleHRlbnNp
b24gZGlzYWJsZWQpLCBiZWNhdXNlIGl0IG11c3QgYmUgcmVzdG9yZWQKZXZlcnkgdGltZSB0aGUg
bWlzYS5GIGJpdCBpcyBsYXRlciBzZXQgKEYgZXh0ZW5zaW9uIGVuYWJsZWQpLCBiZWNhdXNlIHRo
ZQpyZWdpc3RlciBzdGF0ZSBpcyBvdGhlcndpc2UgdW5zcGVjaWZpZWQgaW1tZWRpYXRlbHkgYWZ0
ZXIgdGhlIG1pc2EuRiBiaXQgaXMgc2V0LgoKVGhpcyBpcyBpbiBjb250cmFzdCB0byBtc3RhdHVz
LkZTLCB3aGVyZSB5b3UgY2FuIHNldCB0aGUgZmllbGQgdG8gT2ZmIHdoaWxlIHRoZQpGUCByZWdp
c3RlcnMgaG9sZCBkb21haW4gQSdzIGNvbnRleHQsIHN3aXRjaCB0byBkb21haW4gQiBhbmQgYmFj
ayB0byBBLCB0aGVuIHNldAptc3RhdHVzLkZTIGJhY2sgdG8gRGlydHksIGFsbCB3aXRob3V0IGxv
c2luZyBhbnkgcmVnaXN0ZXIgc3RhdGUuIFNvIG1pc2EuRiBpcwpub3QgYXMgbGF6eSBhcyBtc3Rh
dHVzLkZTLgoKPiBJdCdzIGp1c3QgdGhhdCBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgZXhpc3Rpbmcg
aGFyZHdhcmUgaW1wbGVtZW50YXRpb24KPiBoYXZpbmcgd3JpdGFibGUgbWlzYS5GIGFuZC9vciBt
aXNhLlYgKGFzIG9wcG9zZWQgdG8geHN0YXR1cy57RlMsVlN9Cj4gd2hpY2ggYXJlIG1hbmRhdG9y
eSBpZiBGIGFuZCBWIGFyZSBpbXBsZW1lbnRlZCwgcmVzcGVjdGl2ZWx5KSwgc28gSSBkaWQKPiBu
b3QgY29uc2lkZXIgaXQuCj4gCj4gVG8gbWUsIHdyaXRhYmxlIG1pc2EgaXMgb25lIG9mIHRob3Nl
IGZ1bm55IGZlYXR1cmVzIHRoYXQgdGhlIHNwZWMKPiB0ZWNobmljYWxseSBwZXJtaXRzIGJ1dCBu
b2JvZHkgYWN0dWFsbHkgaW1wbGVtZW50cyBpbiBIVy4gSSdtIGhhcHB5IHRvCj4gY2hhbmdlIG15
IG1pbmQgYWJvdXQgdGhhdCBpZiBzb21lIHJlYWwgaGFyZHdhcmUgaGFzIHdyaXRhYmxlIG1pc2Eu
RiBhbmQKPiBtaXNhLlYuCgpUaGF0J3MgZmFpci4gSSBrbm93IGF0IGxlYXN0IG9uZSByZWFsLWlz
aCBpbXBsZW1lbnRhdGlvbiwgUm9ja2V0WzFdLCBoYXMgdGhpcwpjYXBhYmlsaXR5LCBidXQgSSdt
IGFsc28gdW5hd2FyZSBvZiBhIHB1YmxpYyBjb21tZXJjaWFsIFNvQyB3aXRoIHRoaXMgZmVhdHVy
ZS4KVGhhdCBiZWluZyBzYWlkLCBzaW5jZSB0aGlzIGlzIHRoZSBleGlzdGluZyBhcmNoaXRlY3R1
cmFsIHdheSB0byB0cmFjayBGUCB1c2FnZQpmcm9tIE0tbW9kZSAoYWRtaXR0ZWRseSB3aXRoIHRo
ZSBhYm92ZSBsaW1pdGF0aW9uKSwgSSB3b3VsZCBleHBlY3QgcHVzaGJhY2sgdG8KYWRkaW5nIGFu
eSBkdXBsaWNhdGUgb3Igb3ZlcmxhcHBpbmcgbWVjaGFuaXNtLiBTbyB3ZSBtaWdodCBzZWUgaW1w
bGVtZW50YXRpb25zCmFkZCB0aGlzIGNhcGFiaWxpdHkgYXMgdGhleSBzdGFydCB0byBhZGQgU3Vw
ZXJ2aXNvciBEb21haW5zIGZlYXR1cmVzLgoKUmVnYXJkcywKU2FtdWVsCgpbMV06Cmh0dHBzOi8v
Z2l0aHViLmNvbS9jaGlwc2FsbGlhbmNlL3JvY2tldC1jaGlwL2Jsb2IvdjEuNi9zcmMvbWFpbi9z
Y2FsYS9yb2NrZXQvQ1NSLnNjYWxhI0wxMTg0LUwxMTkyCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
