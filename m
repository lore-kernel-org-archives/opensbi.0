Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF3ACCA470
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 01:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3sQ62/bU6SdxESXYChD+xJrBIEg30TVqh1OmyIosIY=; b=CgnBdnfXqbnGnz
	TsM4ajQl2eVpZaeUokovlsusSM6DZvBquDvKjCk23g4CztrlGskcdrcveM5WlKoFabF99tUWuETcG
	/w7lWw+G8XN96DSAGFlAxp1Ra9RPoKxFprXIktXycAkphwhcvSrKy49vwUYW69VmKXTZxhaUl3l4r
	XEaIQEEVabmv9mVSgA6SnXBsewsOfr10peEe8W3O9e4lm1r5icpcArTNPXQzbjKpVMM/u70XcgE1g
	S1qDlN64CGkZKrOCWSajGjKwyNJFY9vyEjlozFHN3ZAHjKewHW8FDSHvxpnK4VRDGlSTinrDCJyrI
	tKKIn6G6ODjV7gqXUOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6J0s-000000032TM-0U3K;
	Wed, 08 Oct 2025 01:30:42 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6J0p-000000032Sa-1AuR
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 01:30:40 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-63bcfcb800aso4246758d50.0
        for <opensbi@lists.infradead.org>; Tue, 07 Oct 2025 18:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759887037; x=1760491837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDpv4L6uNosjqwHMH6l6cMjSmBvYL9zJmnIUSd905JY=;
        b=XgGLjISkqGJ8TGrgBAY7gp4+gtFm557l34VX3BYTUx2H6FnWxz+Ho8TydQZGIcCGd3
         +EPkX3rGcGPEwK75lBUj+DKSVVjqtKn0MpezVTBcjaosQknNEYcHgPQLPS4VTVyD+sTB
         gUkgn4i23mI9d7KqSonr7iZFa6qvuMh+NPSjhMIuD2IgWdlKk9sQca29RtVEckpVjklX
         9jLCSS+tZFFC1+jJgp0FQdIBBNewMhyIxdmVco4PLlaZl9FistybOwtFmM5RtKhxz3RL
         aFH0NWbT/4ChHMb2CBHUcbzsxW3m4AuF+3lmHrhfZjp4kXZW+ebIeuHxFAfBkxSN+EyM
         Sfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759887037; x=1760491837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDpv4L6uNosjqwHMH6l6cMjSmBvYL9zJmnIUSd905JY=;
        b=jkFvqlrFYiy5aeHURj61PoVkAuXrXln8LLbwupSxMgaCGilXzEvXdrLPuaZM2V+wMy
         WqWvXML+6fjLJvd1vBaMMUL7dUObTw5/Z1BsJ5wOox03IU1H9YH073o9shJYKEAN+snS
         QavVWGXMc6K4J8JL74vF3GNlGhnA8Rmif3dG48u4KhT6DKgkhRwdUsFgvuoC3P6G3PtG
         ITeQ5I+hFCht2HPmqr7AnuBEJ8ll37Q9rsTmtvV+C3z16dRfooMP5x3VNyjy/B5u/LaO
         1uT0uN/862UqOAVT5+tofQ5GXGPAYA170YH9W4Rg9znG4yMrCOGNbZiXJSimv/T25KSs
         IJlg==
X-Gm-Message-State: AOJu0YyYz8Yr3KNhx3Ih0db5xm2Wu9xxxuiBEoNrhrMwzjLuEXY0rN5f
	gQfVH/llN3vU5lGDyalwkXczzBHR+UsdwfE2OETDXQnZ6W10AbVImCA6kKZpnHlCts6BpYLnKrF
	RWSszt1gMx9xHALbYCO8j/YFMyWCjaAM3ZlXf51oRUA==
X-Gm-Gg: ASbGncv01SI418cRStOgUHEXweUmWpd86hDF8Z+7jeNHYeDPzBPQqTRuWPD/tq/FvSa
	N5d4PxG+OQ5tZ7ypnLD0gN176gA8D/EDw3MIi/9dywUoCQpiuh8B4ydswavHO6d6xdsFEfhGeGS
	nBYf372A+Y9kICPMV6PNtMZeN2wwcCCdR3p6gCu0bkXQBkXkjFjWtAiT6Qm17Hvy7hvWSbT0hkH
	cJS8L6CnVL6H/5/C/GuTLyxXvvB6/M1U9KRZO0qK9CWbGBbXIi4B/ysOx23XzhcwYlF+FsjfGeE
	9+UDR4UgO44jYtNgsCk=
X-Google-Smtp-Source: AGHT+IGOLRTc73sor8sDvbYBz5J21p62gaDk6f4s9RJVUG9VliL04Y/IqzvB9i6VDYsWURw/1auHtcigHEfrLKsVRog=
X-Received: by 2002:a05:690e:2061:b0:633:a1c7:a999 with SMTP id
 956f58d0204a3-63ccb8f391emr1438744d50.37.1759887037507; Tue, 07 Oct 2025
 18:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250814110522.18809-1-peter.lin@sifive.com> <CAAhSdy3TiKTF-5b_fg5FtctFZVBdxVDxjOYYa5Tg0LMrO_iwEA@mail.gmail.com>
In-Reply-To: <CAAhSdy3TiKTF-5b_fg5FtctFZVBdxVDxjOYYa5Tg0LMrO_iwEA@mail.gmail.com>
From: Peter Lin <peter.lin@sifive.com>
Date: Wed, 8 Oct 2025 09:30:26 +0800
X-Gm-Features: AS18NWAeuULlDIVtWRW3vCy8qC6nSKR7c_inGoAVdol1_2JsXJpJy6EquGSalE4
Message-ID: <CAHZsQ-O6saXYsSerqxBJVy4n3gHstMrVt+XkvEF_Hz1tfgydiA@mail.gmail.com>
Subject: Re: [PATCH 0/8] SmePMP bugfixes and improvement
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_183039_339559_1DE106D6 
X-CRM114-Status: GOOD (  16.01  )
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

SGkgQW51cCwKCk9uIE1vbiwgT2N0IDYsIDIwMjUgYXQgMToyMeKAr1BNIEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgNzo0
NuKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+
ID4KPiA+IFRoaXMgc2VyaWVzIGltcHJvdmVzIFNtZVBNUCByZWxhdGVkIGZ1bmN0aW9ucyBhbmQg
Zml4ZXMKPiA+IHRoZSBhY2Nlc3MgZmF1bHQgZHVyaW5nIGRvbWFpbiBjb250ZXh0IHN3aXRjaCB3
aGVuIFNtZVBNUAo+ID4gaXMgZW5hYmxlZC4KPiA+Cj4gPiBZdS1DaGllbiBQZXRlciBMaW4gKDgp
Ogo+ID4gICBsaWI6IHNiaV9oYXJ0OiBtb3ZlIHNiaV9oYXJ0X2dldF9zbWVwbXBfZmxhZ3MoKSB0
byBzYmlfZG9tYWluCj4gPiAgIGxpYjogc2JpX2RvbWFpbjogYWxsb3cgc3BlY2lmeWluZyBpbmFj
Y2Vzc2libGUgcmVnaW9uCj4gPiAgIGxpYjogc2JpX2RvbWFpbjogcHJpbnQgdW5zdXBwb3J0ZWQg
U21lUE1QIHBlcm1pc3Npb25zCj4gPiAgIGxpYjogc2JpX2hhcnQ6IGFkZCBlcnJvciBtZXNzYWdl
IGZvciBpbnN1ZmZpY2llbnQgUE1QIGVudHJpZXMKPiA+ICAgbGliOiBzYmlfZG9tYWluX2NvbnRl
eHQ6IHNraXAgdGhlIHJlc2VydmVkIGVudHJ5IGR1cmluZyBkb21haW4gY29udGV4dAo+ID4gICAg
IHN3aXRjaAo+ID4gICBsaWI6IHNiaV9kb21haW46IGFkZCBTQklfRE9NQUlOX01FTVJFR0lPTl9G
VyBtZW1yZWdpb24gZmxhZwo+ID4gICBsaWI6IHNiaV9kb21haW46IGVuc3VyZSBjb25zaXN0ZW50
IGZpcm13YXJlIFBNUCBlbnRyaWVzCj4gPiAgIGxpYjogc2JpX2RvbWFpbl9jb250ZXh0OiBwcmVz
ZXJ2ZSBmaXJtd2FyZSBQTVAgZW50cmllcyBkdXJpbmcgZG9tYWluCj4gPiAgICAgY29udGV4dCBz
d2l0Y2gKPgo+IEkgdG90YWxseSBtaXNzZWQgdGhpcyBzZXJpZXMgYmVjYXVzZSBmb3Igc29tZSBz
dHJhbmdlIHJlYXNvbiwgaXQgaXMgbm90Cj4gc2hvd2luZyB1cCBpbiBPcGVuU0JJIHBhdGNod29y
awo+IChodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qvb3BlbnNiaS9saXN0Lyku
Cj4KPiBDYW4geW91IHBsZWFzZSByZWJhc2UgYW5kIHJlc2VuZCB0aGlzIHNlcmllcyA/CgpZZXMs
IEkgYW0gcHJlcGFyaW5nIFBBVENIdjIsIHRoYW5rcy4KClJlZ2FyZHMsClBldGVyIExpbgoKPiBS
ZWdhcmRzLAo+IEFudXAKPgo+ID4KPiA+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAgIHwg
MTEgKysrKwo+ID4gIGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICAgICAgfCA5OSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICBsaWIvc2JpL3NiaV9kb21haW5fY29udGV4
dC5jIHwgNDggKysrKysrKysrKysrKysrKysKPiA+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAg
ICAgIHwgODYgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDQgZmlsZXMgY2hh
bmdlZCwgMTcwIGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAy
LjM5LjMKPiA+Cj4gPgo+ID4gLS0KPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiBvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
