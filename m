Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A819C83F25
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzUbYcWZOgoLBy5zsBEfH3mKGUyn/y7GtsPqM+H+rTo=; b=3/V5GMLi4l+WvU
	UCtePUrIdtI5WiPJsM2nOY5QMLCTlPmNgwOWv+wDSmTewBoE2mETbvBdPIJqafzvphlq0fnGia/s+
	OTxSAkxt52CbQMfBYPlyDSSxj2IfsSKPWQKd/kL6CYHofTjNqNSjUuRWB1gXZ7OzeBdVnxZJfYMGj
	T2bLyOOvyQhEyvJ4flUwVW1kmWmxCGqPoLINaEFZ2es5+gqUfbLl+YeSRfn6NnRbTFlhusidpzQkH
	jAS48895cqyWVPH7QLviHu5pCPO6ccegIVgj/xk3dKNOLIAwoVqLXDOD1lhqDYiG0rUNpKqGTng6V
	pUDYlS4t3MUsuACK77Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq0K-0000000HIJH-1qzK;
	Mon, 21 Jul 2025 12:52:28 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoSp-0000000H3D1-2TBt
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 11:13:48 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e293a3b426so39913555ab.1
        for <opensbi@lists.infradead.org>; Mon, 21 Jul 2025 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753096427; x=1753701227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJFxiMEa1NpsN+nrtFr+Wf3e2lGYNr5umJjlqDQuHPM=;
        b=Hj2gTVCZcXiRfN1B1pf4Lvjf9AnIgY5Y/+TB409I97qzEn2stUVvC7S47EPPa11USj
         yKghIWUHyqorYYDzczAD5T9lr6cc4AsxLLdlIqQ5jcvQyKzcVFZRpsL9O0c/2vIJ+rEA
         iBYl9Vve4nIRKEZEB6TJAvZFxt0T3S6iq0ES3TkptZ6cnJ8aiLlcppCZjWvmx14amMlv
         glbYOisjNsOrTMcJNNNbOun8QESLtdy0tfSrHc6i0DWKPE3bZUxrCazThSW3QRqnjCze
         O+++ATxhYM4Ht84G2enATYahV0hzUb4rSEiGgpJS4IqrbYeAg6wBWw+iLo0hCuUNKyiv
         kDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096427; x=1753701227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJFxiMEa1NpsN+nrtFr+Wf3e2lGYNr5umJjlqDQuHPM=;
        b=sbhAeoHe231Wzjaq3S3W7pPi3QjQPmiFcQTpVFc5Eo/j50kzdk50qmHZ5xoEjYXWTi
         kWzMXmhVPRNT5K2zA+BjHgKtBt/YU2yH7myjyYs4hM9PVq7dzHC+wCSPjIlUEQoKyu0M
         31G7Jjhr+AyNuwJ2rtRIaflnugwP3AUTbJ4Qo3hTbHcfN90SY/WPF9LFftbPjDqilkA6
         ErEUuLF4CZxGxp3cOC9losdK1AhUqk1ql8CZS+rcP65ewNc1G35xwG+9R6mgo5/6Qzt2
         tyzLM3MWgyKTEj/rv5C6qh4Wg8dRgoiDFvHVpuTrlZmpdMIVZuJIBH7DLstPD6kFMs7G
         Hgrw==
X-Gm-Message-State: AOJu0YyoQ5DpePG2JbXBzqWAUG3hImSM3YSmO9pzqV0QDkDodJZmHmyS
	JQX6cXe2LCWbyMD0/YcbNIJtLhL5ML2JTmM0ROZl4f1hG/RNjD2921os402LTdn66j6JUTO8+MJ
	YUY9YYY8vNHeZyrN82W5mJ8sb5LnglbFPjzLMgX0maA==
X-Gm-Gg: ASbGncsRR/za6nh+BssOxmJ6MIpm5LLWwwvj9GhE9zsA3xnO4dxXiBcQzg2xmmmIGG8
	RTPbkzXxcL7sRZA1M4Fz8E3OAtQWrIMMUV7lHBr38IYxPRjHAj0oU4+uwSGgjJgd3HcPvR2Jhwi
	dDDjlIexueFVU/5ZzRERkd/co+4l53KG9yJjwGQGcC/dfmsYRbjGo5pRC5ldH/odibQBAs68vXi
	v1IuOHwahbpifbabKQMFAXtnj3/cIbzKSZbuI/J
X-Google-Smtp-Source: AGHT+IFG02baxybUxTh2lVwTDyQWaqYgc4CeXCTz087T0KtSQWkeH2nYx85etw0d/nCdYVdzcVBzfxtuBIbFEh9YRSE=
X-Received: by 2002:a05:6e02:1305:b0:3e2:81d9:cbbc with SMTP id
 e9e14a558f8ab-3e2823a7b77mr182251695ab.2.1753096426608; Mon, 21 Jul 2025
 04:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250710002937.44307-1-jrtc27@jrtc27.com>
In-Reply-To: <20250710002937.44307-1-jrtc27@jrtc27.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Jul 2025 16:43:34 +0530
X-Gm-Features: Ac12FXzUUycs50y6dJfVWjzZofSJK9P4r5Gj9lMViiOs2tcqMeDr3XgV3VicaoM
Message-ID: <CAAhSdy0xDquKS2LXaEK5mpKKz3aHrRk5xAWk+_KP8HiADX_yEw@mail.gmail.com>
Subject: Re: [PATCH] firmware: Rename __rel_dyn_start/end to __rela_dyn_start/end
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_041347_628760_B36CF455 
X-CRM114-Status: GOOD (  17.10  )
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgNjozNOKAr0FNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBXZSBhcmUgdXNpbmcgYW5kIGV4cGVjdGluZyB0aGUgUkVM
QSBmb3JtYXQsIG5vdCB0aGUgUkVMIGZvcm1hdCwgYW5kIHRoaXMKPiBpcyB0aGUgY29udmVudGlv
bmFsIGxpbmtlci1nZW5lcmF0ZWQgbmFtZSBmb3IgdGhlIHN0YXJ0L2VuZCBzeW1ib2xzLCBzbwo+
IHVzZSBpdCByYXRoZXIgdGhhbiBjb25mdXNpbmcgdGhpbmdzIGJ5IG1ha2luZyBpdCBsb29rIGxp
a2Ugd2UncmUKPiBhY2Nlc3NpbmcgLnJlbC5keW4sIHdoaWNoIHdvdWxkIGJlIGluIHRoZSBSRUwg
Zm9ybWF0IHdpdGggbm8gZXhwbGljaXQKPiBhZGRlbmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZXNz
aWNhIENsYXJrZSA8anJ0YzI3QGpydGMyNy5jb20+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhl
IHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgZmlybXdhcmUvZndf
YmFzZS5TICAgfCA0ICsrLS0KPiAgZmlybXdhcmUvZndfYmFzZS5sZFMgfCA0ICsrLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZmlybXdhcmUvZndfYmFzZS5TIGIvZmlybXdhcmUvZndfYmFzZS5TCj4gaW5kZXggYWE4
ZTI2NC4uYjY3NWM5ZSAxMDA2NDQKPiAtLS0gYS9maXJtd2FyZS9md19iYXNlLlMKPiArKysgYi9m
aXJtd2FyZS9md19iYXNlLlMKPiBAQCAtNzYsOCArNzYsOCBAQCBfc2NfZmFpbDoKPiAgICAgICAg
IGxpICAgICAgdDAsIEZXX1RFWFRfU1RBUlQgICAgICAgLyogbGluayBzdGFydCAqLwo+ICAgICAg
ICAgbGxhICAgICB0MSwgX2Z3X3N0YXJ0ICAgICAgICAgICAvKiBsb2FkIHN0YXJ0ICovCj4gICAg
ICAgICBzdWIgICAgIHQyLCB0MSwgdDAgICAgICAgICAgICAgIC8qIGxvYWQgb2Zmc2V0ICovCj4g
LSAgICAgICBsbGEgICAgIHQwLCBfX3JlbF9keW5fc3RhcnQKPiAtICAgICAgIGxsYSAgICAgdDEs
IF9fcmVsX2R5bl9lbmQKPiArICAgICAgIGxsYSAgICAgdDAsIF9fcmVsYV9keW5fc3RhcnQKPiAr
ICAgICAgIGxsYSAgICAgdDEsIF9fcmVsYV9keW5fZW5kCj4gICAgICAgICBiZXEgICAgIHQwLCB0
MSwgX3JlbG9jYXRlX2RvbmUKPiAgMjoKPiAgICAgICAgIFJFR19MICAgdDUsIF9fU0laRU9GX0xP
TkdfXyh0MCkgLyogdDUgPC0tIHJlbG9jYXRpb24gaW5mbzp0eXBlICovCj4gZGlmZiAtLWdpdCBh
L2Zpcm13YXJlL2Z3X2Jhc2UubGRTIGIvZmlybXdhcmUvZndfYmFzZS5sZFMKPiBpbmRleCBhMzM3
NDZhLi4xMmM3YTg0IDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL2Z3X2Jhc2UubGRTCj4gKysrIGIv
ZmlybXdhcmUvZndfYmFzZS5sZFMKPiBAQCAtNDcsOSArNDcsOSBAQAo+ICAgICAgICAgLiA9IEFM
SUdOKDB4MTAwMCk7IC8qIEVuc3VyZSBuZXh0IHNlY3Rpb24gaXMgcGFnZSBhbGlnbmVkICovCj4K
PiAgICAgICAgIC5yZWxhLmR5biA6IHsKPiAtICAgICAgICAgICAgICAgUFJPVklERShfX3JlbF9k
eW5fc3RhcnQgPSAuKTsKPiArICAgICAgICAgICAgICAgUFJPVklERShfX3JlbGFfZHluX3N0YXJ0
ID0gLik7Cj4gICAgICAgICAgICAgICAgICooLnJlbGEqKQo+IC0gICAgICAgICAgICAgICBQUk9W
SURFKF9fcmVsX2R5bl9lbmQgPSAuKTsKPiArICAgICAgICAgICAgICAgUFJPVklERShfX3JlbGFf
ZHluX2VuZCA9IC4pOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBQUk9WSURFKF9yb2RhdGFfZW5k
ID0gLik7Cj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
