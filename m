Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDE4C624D7
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOCJpQrb8R1S+OW89idU/95qvcAwt7s4qRFuDrZAI2c=; b=TPyattOtc8K8YH
	/2AZINEsbXWvKaDRONxx8xLpfoAeQfpzTg/QmlTpvX1SkancPyhtJtQHDgVEH6UnhY4PEcx7cKoFf
	6lropB9rdyKf+s4bz7qx8/bKssR+Co/0X6Ouu5Oq0VydZrLXzz9q/X+4ls+D4pZYuF3zoDUKGWOaV
	I+XHWiOb/Fv7diOf/3FP8YiwWnr048RxwI5C82zpXhBwzmOw2ZBlCh9Fx4868at6c3zZv5V2iwPV6
	BgFwgTHlf/5R6EmWfaAKy3Ez4oJTpDEuUh93681M93MjzTHK+oWyD36C0VGZgwhh1g2lR3hVnwUT4
	xOnR36KWkJNbX4h9okcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gFK-0000000E4sM-34C3;
	Wed, 02 Sep 2026 08:23:02 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gFI-0000000E4qw-1lAY
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 08:23:01 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-5c7991578c2so376158e0c.3
        for <opensbi@lists.infradead.org>; Wed, 02 Sep 2026 01:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788337378; cv=none;
        d=google.com; s=arc-20260327;
        b=mKjXT4gNLsB3x9LZdVgnqQ1i7UIQgD8jumzGmUCL91yd+vPop8Ow/NC7/GqUnflA++
         NMbY771rwoQgvtSdAXkH/Nhi+59V6l6YkLoonJ3eQjNyyN9CCZOrQ159zNdPU+MkHo/T
         3CfzQRQZyvEbsSL2vgJPa6anKYNQUo2cLnCDFDAynhX8yY6AfhSHUdnh805PCMOuLcN/
         DtRzsJV6f5oypN3Zb4rgEOZgP0gDndG8Mw6pJeuJJ/5qbkpCyexZXFu+AhB3ykZ33d/t
         id92isH1cHRFKPYRE0LT6cIIAT7FpCPUVBOCy0Q4Mi/pgFTrXDC7KtKR9cF+BW8r5dPj
         eTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gb6QznoVnIw9pfqQ4KrXgZOlbJPn9c8VXbqj7A+prks=;
        fh=CC8RNPHXnJgn5dOneo5I+Q+AFr9/kuoV9Q0WjY5+Rbw=;
        b=VtGDAdSDR2WCkmT6eLz2q0sQrnb3b5byr3jcjAr3gefB9sqG3Fn1JCOTk0SAWJjyE0
         itR3aC0XfS3N+3hNMAiFfQP1Hu1SdE1Jginv4EHAodvW4ojGot8fPFHRtqA4txnK6VGZ
         UH+HqQxiw/bK4v0+f5tki/QixrfuWWC15y8omZGtInRGOR5bQ65+zz0NxwClyczNRuwP
         ZsTJ+F3olo58QdX/oigQV7EBLXgCwSSYkaqrmibDa1imM5Yu+M8tzH7FxsjFpt4wsywH
         3vyXUNOBHdvsPflVJNew8iKm45HDfgKkhGTqbangGBionHsAiss+kXM1Os52kuRVlaMh
         5IGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788337378; x=1788942178; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gb6QznoVnIw9pfqQ4KrXgZOlbJPn9c8VXbqj7A+prks=;
        b=U3Uc2YZDrpO4oh3SITxLV5b8zKIjTOi9f0eG/BzUwkl7/9zkIwPdtlwmyU3hvrX6Qm
         gd1LaFcKKR2RK7tzMfKRlOjfE+uTZyQSYe3iXcK/7gnQOyKIFhl1F1FcwhpNdDxnf2K/
         VMM6WkApniM4QdX3Oygf577e/QQ0jwyQ7K/2Ju9DG3Ow/NtxcMxqekpZADSHLHMHcHAi
         smFHVo4kO34oYCkYWdfQW2HiYzr2fDtoYp+c3rheKAh2CqYWE9pe/iSVtQy0kTGe8gkr
         d5ed0kzPfpHjB61NTQTKXaPq/PO9ClRn/fVP0PNhV/je9BLLcyGrTLZ7fP9EYXB3PB9K
         vJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337378; x=1788942178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gb6QznoVnIw9pfqQ4KrXgZOlbJPn9c8VXbqj7A+prks=;
        b=l8T0Vuvu/LlhdOl49TZ0BjUYMf4t7t63hwNZBXb2kb7R6+3SpKKk+DE3xivN4ZeiQM
         j2vA3gOQI1F2TfcAYjdQESOCk6iFvZyZqnok02QPXdbHSGwwOIkCwfXsJeg+kAlQBJTr
         gKJgxXg7acZsBSPcz6+5VR8NsgOf4ChXpXr8JmPyx8WBhQkDk015ZH/9BosMAi1jMkaq
         O9e+CkMQOzDUliz5hCIXo0VO8seYsYhLqc0UStBzCPS4Es9qJWhcKjt5PRg2YzO7qZR6
         sravTDkaktYSS+gGpPvpt4bNA9+CmnPPSRZjNDmkci977evzN5CgOb0hJ1Xicrj5PG1H
         9EIA==
X-Gm-Message-State: AFuF++n2FxaN+E54/SkD2br4wqcBXYhTV2fL/3P22Q1h3Zw3/l+3l3yY
	HR58rD8prC8f5/3UYHCGk37wws0sd5/zY9EZtkFVJC0shD/BPXvAbv2sz95/W/zcfY87nBfncpA
	kHAsoe0EBqTuj4ktSD3bFVKL7wdERP8F5c8dpUZXCug==
X-Gm-Gg: AYBFou2nEfG9JPtLRsfK+4ke4uNCEStShu/5p5gv+VLjPXy4yi8DE8T+02Crl/hc1qD
	32+SEXvw5KsoD63lwaj0xQ+yR9qOv8/3q+8o1wqkSG9/TbOkOAHJVb5rHR5oQXlg3J/jWZj9lPa
	yNqfl65bpyxu1YV9uz29bmLKbt/rBlanUWEyFSCl0x6hCl/yfXwowA+OmbtkGrnVVzzycsQCHe/
	95OBGTZ6tlPXRxnDVnr2tOPUza+ggiE1X7ROMMJLPboDgyenANvgAfRRcPSnAZAC+MPAi+ULZZx
	o1yyCX5IO6XH5dHaLUtFYMmedT8D7VyePpojig2z38dm/gY=
X-Received: by 2002:a05:6122:1d86:b0:5c2:ac92:eb18 with SMTP id
 71dfb90a1353d-5c7d2886ac9mr1043570e0c.7.1788337369531; Wed, 02 Sep 2026
 01:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com> <20260831171751.3206696-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260831171751.3206696-1-evvoevod@tenstorrent.com>
From: Nia Su <nia.su@sifive.com>
Date: Wed, 2 Sep 2026 16:22:37 +0800
X-Gm-Features: AcwNN1Wt-6HSpc5MXBk2lJhh_v3obK6_DXazA3J8yhVYH4fMf73e59KCkEYBz6c
Message-ID: <CACpYXwCiciQzQo99=f=_wioYb3kHHTZkQm_UAi6FCXYpbJmeog@mail.gmail.com>
Subject: Re: [PATCH 0/2] lib: sbi: Fix Smrnmi/RNMI trap handling issues
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_012300_465918_60EFBBA0 
X-CRM114-Status: GOOD (  25.69  )
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

T24gVHVlLCBTZXAgMSwgMjAyNiBhdCAxOjE44oCvQU0gRXZnZW55IFZvZXZvZGluIDxldnZvZXZv
ZEB0ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+Cj4gSSB0cmllZCB0aGlzIHBhdGNoIHNldCBvbiBh
cnRpZmljaWFsIHNldHVwIG9uIFdoaXNwZXIgU1cgc3lzdGVtIHNpbXVsYXRvciBhbmQgaXQKPiBz
ZWVtcyB0byBzb2x2ZSBpc3N1ZXMgZGlzY3Vzc2VkIGluIFsxXS4KPgo+IEJ1dCBJJ2Qgc3VnZ2Vz
dCB0byBzcGxpdCB0aGlzIHNlcmllcyB0byBzZXBhcmF0ZSBjaGFuZ2VzIHN0cnVjdHVyYWxseSBh
bmQgbWFrZQo+IGJhY2twb3J0aW5nIGVhc2llciBpZiBuZWVkZWQ6Cj4KPiAgIDEuIFJlc3RvcmUg
dGhlIFNtcm5taSBjb250ZXh0IG9uIG5vbi1yZXRlbnRpdmUgcmVzdW1lOiBleHRyYWN0Cj4gICAg
ICBzYmlfc21ybm1pX2hhcnRfaW5pdCgpIGFuZCBjYWxsIGl0IGZyb20gc2JpX2hhcnRfcmVpbml0
KCkuIFRoaXMgaXMgdGhlCj4gICAgICBhY3R1YWwgZml4IGFuZCBpdCBpcyBzZWxmIGNvbnRhaW5l
ZCwgc28gYW55b25lIG9uIGEgdjEuOSBiYXNlZCB0cmVlIGNhbgo+ICAgICAgcGljayBqdXN0IHRo
aXMgb25lLgo+Cj4gICAyLiBUaGUgc2JpX3RyYXAuYyBmaXggZm9yIHRoZSBjbG9iYmVyZWQgdHJh
cCBjb250ZXh0ICh5b3VyIHBhdGNoIDIvMikuIEl0Cj4gICAgICB0b3VjaGVzIGEgZGlmZmVyZW50
IGZpbGUgYW5kIGhhcyBpdHMgb3duIEZpeGVzIHRhZywgc28gaXQgZG9lcyBub3QKPiAgICAgIGRl
cGVuZCBvbiB0aGUgcmVzdC4KCkdvb2Qgc3VnZ2VzdGlvbi4gSeKAmWxsIHN1Ym1pdCB0aGlzIGNo
YW5nZSBhcyBhIHNlcGFyYXRlIHBhdGNoLgoKPiAgIDMuIENoYW5nZSBzbXJubWlfaGFuZGxlcnNf
aW5pdCBmcm9tIHZvaWQgdG8gaW50LCBidXQga2VlcCB0aGUgcGFuaWMgd2hlbgo+ICAgICAgdGhl
IHBsYXRmb3JtIGRvZXMgbm90IHByb3ZpZGUgdGhlIGNhbGxiYWNrLiBUb2RheSBhIGNhbGxiYWNr
IHdoaWNoCj4gICAgICBmYWlscyBoYXMgbm8gd2F5IHRvIHJlcG9ydCBpdCBhbmQgTk1JRSBpcyBz
ZXQgYW55d2F5LCBzbyB0aGlzIGlzIGEgZml4Cj4gICAgICBvbiBpdHMgb3duLgo+Cj4gICA0LiBB
bGxvdyB0aGUgTlVMTCBjYWxsYmFjay4gVGhpcyBvbmUgY2hhbmdlcyB3aGF0IGEgcGxhdGZvcm0g
aXMgYWxsb3dlZCB0bwo+ICAgICAgc2tpcCwgc28gSSB3b3VsZCBwcmVmZXIgdG8gZGlzY3VzcyBp
dCBzZXBhcmF0ZWx5OiBhcyB3YXMgbWVudGlvbmVkCj4gICAgICBlYXJsaWVyIGluIHRoZSBwcmV2
aW91cyBlbWFpbCB0aHJlYWQgWzJdLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYQo+ICAgICAg
bGV2ZWwgb2YgY29udHJvbCBvZiBhIHNpdHVhdGlvbiB3aGVuIHBsYXRmb3JtIGZvcmdvdCB0byBp
bml0aWFsaXplIHRoZQo+ICAgICAgY2FsbGJhY2sgcmF0aGVyIHRoYW4ganVzdCBzaWxlbnRseSBz
ZXQgTk1JRSBhbmQgcHJvY2VlZC4gSSBjYW4gc2VlIHRoZXNlCj4gICAgICBkaXN0aW5jdCBvcHRp
b25zIHRvIGhhbmRsZSB0aGlzOgo+Cj4gICBhKSBCb290IHRpbWUgb3V0cHV0OiBiYXNlZCBvbiBh
IGZsYWcganVzdCBwcmludCB3aGV0aGVyIFNtcm5taSB2ZWN0b3JzIGFyZQo+ICAgICAgaW5pdGlh
bGl6ZWQgYnkgcGxhdGZvcm0gZXhwbGljaXRseSBvciBub3QKPgo+ICAgICAgICAgIFNtcm5taSBW
ZWN0b3JzICAgICAgIDogTlVMTCAgICAgPC0tIG9yICJQbGF0Zm9ybSIKPgo+ICAgYikgV2Fybmlu
ZyBwcmludCB3aGVuIFNtcm5taSBpcyBwcmVzZW50IGFuZCBubyBjYWxsYmFjayBpcyByZWdpc3Rl
cmVkCj4KPiAgIGMpIEV4cGxpY2l0IG9wdCBvdXQ6IHBsYXRmb3JtIHdoaWNoIGRvZXNuJ3QgbmVl
ZCB0byBwcm9ncmFtIHZlY3RvcnMKPiAgICAgIGV4cGxpY2l0bHkgc2V0cyBhIGNvcnJlc3BvbmRp
bmcgZmxhZyBpbiBzYmlfcGxhdGZvcm0gdG8gaW5kaWNhdGUgdGhpcy4KPiAgICAgIFdpdGhvdXQg
dGhpcyBmbGFnIHNldCBhbmQgd2hlbiBoYW5kbGVycyBhcmUgbWlzc2luZyB3ZSBwYW5pYyBsaWtl
IG5vdywKPiAgICAgIGFuZCB3aGVuIHRoZSBmbGFnIGlzIHNldCB3ZSBnbyBhaGVhZCBhbmQgcHJv
Y2VlZCB0byBzZXR0aW5nIHRoZSBOTUlFIGJpdC4KPgo+ICAgIEkgcGVyc29uYWxseSB3b3VsZCBn
byB3aXRoIGEpIGFuZCBjKSBhcyB0aGlzIGFsbG93cyBmdWxsIGNvbnRyb2wgb2Ygd2hhdCdzCj4g
ICAgZ29pbmcgb24gYW5kIGNhdGNoZXMgZXJyb3JzIGVhcmx5LiBXaGF0IGRvIHlvdSB0aGluaz8K
Pgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuc2JpL0NBSGg9WWtfU2JkMU1FSDh0
VnNoQU9GUXB0RVZLbTBRWnYrRDdiSndNQzgwcXZhclZld0BtYWlsLmdtYWlsLmNvbS8KPiBbMl0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS9ESUlPS1ZKN1NWSEcuMTE1RU9NN0xZMzZJ
MUB0ZW5zdG9ycmVudC5jb20vCj4KPiAgIFRoYW5rcywKPiAgIEV2Z2VueQoKSSBhZ3JlZSB3aXRo
IHlvdXIgcHJvcG9zYWwgdG8gYWRvcHQgb3B0aW9ucyBhKSBhbmQgYyksIGFuZCAgSSB3aWxsIGZv
bGxvdyB0aGUKaW1wbGVtZW50YXRpb24gc3VnZ2VzdGVkIGluIFsyXQoKVGhhbmtzLApOaWEKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
