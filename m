Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4392DC9833E
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzBv0q/cLLcakille/SwNziZ85z4NUXZ1IDD9ldZEiU=; b=02m/YxEtphg9Wz
	BahELua4tjVaLYz1vD4gt4Q8vd5lb/gFc+Ycs1sZjm1JbZGgz9tpLbLgslijTriUrfW0dxpRt35cL
	WdO62QQf/XNztFot+32RMbJt14HNREsjg/B/etjjGBpqAsEz/96S2tjTfnEjU0GOk1mA+0YclCcjm
	GG7HyxDxLjUcy1D22GKVJ6uzrYLD5mBsVvEPfR9jwl9Nu7ridldZBjCIqxYj1Io2PRuDNFYFFiaJ/
	QZkJAc4VakILpNiht+s9fYncnnzHCf//V6NKlWPqaZ2+1bWRr+utjiHStAe7IbxeQpsOTNTDlCt7L
	DXE8v8zeFcw3Obskd25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6pr-000000006OB-44zA;
	Mon, 28 Sep 2026 08:35:43 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6po-000000006NL-0gEo
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 08:35:41 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a00713639cso2994825e9.1
        for <opensbi@lists.infradead.org>; Mon, 28 Sep 2026 01:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790584538; cv=none;
        d=google.com; s=arc-20260327;
        b=YJ4rdinLjiYEbnISnd7TeNPLWkfJ88TWt129EDTyhZvQP6uK8LiejspaJ1Ts6d9fhC
         PzDuuUkIsJyxBOi4LXUN8CyJvVjyDJ9FklrV2KeWfNlbqFLtkknyBFTWdaeFKoCNEhEm
         t81vYJNzY4r3emonBo/kwVJ/RBJDZLnCuWqlN4W79K3pYCOuReuINYLzew3NKtAFb4Ys
         pGUE91vRp9EHtKdlaJX5whz5/GY41LMmJ1LokBkmhYo6dQZFC8Le0KbiiTVyQfvgT+Od
         pQSVPIHXgSwrAGkOi1NV06Kfik+8SquC/wBKAo9JjEJFh64g9bZ4ZSRVXCq/xXs/Xo6l
         9hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d5vWs7f6qZOsy4/ZQI2zj8mB1VvUPIdUVZUnYV2BCBE=;
        fh=KrX0cB6SQZaa7uS5x1bblriTTCtEIAYg1Fj8pKLq+4o=;
        b=af8iyx/dMzYnN45gj1hdOc6LozprKneYV3CwCzdUgg2RiaSB/x33NSaCttdrUAfXVr
         e5UpKBfOKsZWHGTKwTZaFROYJg89jMg1g2LmU3e/bzPQ+YE9UQbXfYfhNrtxrSZjF36r
         kGTR+g6+A4lW3Jp7TFkoRdByGY5SivuuMtesqxV5vq1vA/eMHiaU4s3dJIcK9XALTjFV
         MNrjONjBzjU0DFxDmbVmxpEV67gg8LcKAweLm4bfNbI/328aqxANCGY7gOTRVicPHGs+
         dciwU6LjGCkdopB86hCTk9/IOPa3YMjTLeuJHkSqhwfN61Wj1azkPNmct+GmJczC6TmN
         OfCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790584538; x=1791189338; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5vWs7f6qZOsy4/ZQI2zj8mB1VvUPIdUVZUnYV2BCBE=;
        b=F8IKF/Plxq34cpYam9UbF5NnoyGhorhzRiz9BsvncbYFtFMSQGfeUfTBi5Ikz9n/a4
         t3vq01TX/1yclgmdPcsoP0LTGyJgtqwd+VBwQW/nw3uEdm1LBR/ISKcONObQqbUpWLzu
         lwLMMn5fJLIyXmkQLivLbxpORCQe+bwUUT8BNcOvFrtvDn7/LcUMIlxy1rVKCjWjFW5a
         //QNmqGg1MICowcuGnEd34beOLcpYdF7pMYlJggpi5y29Q+2S7LszZhS2AcA+rcBj6K1
         15pdfdMYk+NYLhBvoDEfkaycvadH/VNQLiZ26dSDtejXq1eZtcQng3NwRGuf7Zshv/lx
         amaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584538; x=1791189338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5vWs7f6qZOsy4/ZQI2zj8mB1VvUPIdUVZUnYV2BCBE=;
        b=Qvsyzkw1R9PauEsdj92EnKA2nrfEJJ3Yl0zLtfNKJ9FHq268X9bw4/SYoCGlYSif24
         VfEy/yVKvINjplFgTY05kHsl8Y4EfJJwcbNQHEmPSAkkJL/fp0G8ARoqLeTfD3nKJKtS
         2ebCL6GbGHXSY9/F4FLz+Bgwjk4xsaz9yDcKQvy9RvDJ7bniA/+eue5yjOkqcOpvuiDB
         1MF1N2z30NZLJswcbAxKpljjKShSythFA+NfxtcMMQ2F7PeSWiHXHtLY7qmK9NlmWD+H
         UekH7Sa9UPAqsxuttq+7gKxHLUbekOeJJIPDBa9xTLnQkg+aL+CiGI6clObXI9pdPxOY
         ANBg==
X-Gm-Message-State: AFuF++nH4vDO8ls91V+mbPrByFhtRKyu72gH1Vs1hwDALI0xloDCiGdK
	Cbu1Ch+kHGJ85mic4J+nfRXuBz/k3xOuN3r7iQTl5IE+YKwm4CiUTxJnnF6r9EF6+A059aGi2GY
	gmh6EuDQeUGpga5gtuPQzfqfVFGE+OejYjfssS+vnEXm5tBaK72MEPYs=
X-Gm-Gg: AYBFou2huqJ9Yy4moamJYWtVuJ7WIb1+ntImpnmjUkd6pQiMpMScCWjGYw8+g3mUqty
	Nijni2DC7eb74q7+H6T3tOYuIKOYpMuEJPNp/ieI3OpCn4jFu+0wDO6pe8MrhdvYSO2Z8aeHKna
	YPUqUmdu+GPbiZe+6KrzJwvYfCo6uh14nDfeZTWMQfQzo5G8NfMjnu6Qw1f90w8+fBX91i4w1m1
	FGeB/ZVGa6D1coxiBGOGm/l2hr2MPpZ0DtTZ8rnZF1/lL1j6CATgF8Y3eh2SHrawRiFXTSx5DWU
	3+a9NYnPOQIR81ZwsMn9c02dG8hMCPnrwZEAPIu4KgzjxqFATnnLG6ZZ+ZWSK2voCQcjI1lwFft
	Kw6Ds771e93zAvY0GtYptwheDNFCuXYsXVgqNyRhVVSQjt2Suh7JNiP7fxbFYHwljX5ZTpyP4Ng
	A=
X-Received: by 2002:a05:600c:1d28:b0:49c:fc6e:8cbd with SMTP id
 5b1f17b1804b1-49fe66fc677mr237030305e9.33.1790584537661; Mon, 28 Sep 2026
 01:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
In-Reply-To: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 14:05:24 +0530
X-Gm-Features: AclHuK-lITznwSvIS7bJAlx987xxwKBLcYzjzSnpk3FQLDWZzrHk4GcVVcG3RfY
Message-ID: <CAAhSdy3pwXC1-gNJWGe+B5eVMHHmoG_E7QBUtvB17Oj-1B=NRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Makefile: fix support checks that use grep
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_013540_234874_BB8A01F3 
X-CRM114-Status: GOOD (  25.21  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMjo1MuKAr0FNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gV2hlbiBidWlsZGluZyBPcGVuU0JJIGluIGVudmly
b25tZW50cyB3aGVyZSBleHRlbnNpb25zIGZyb20gdGhlIElTQSBhcmUKPiB1c2VkIHRvIGdlbmVy
YXRlIGJ1aWxkIHBhdGhzIChlLmcuIFlvY3RvIFByb2plY3QpLCB0aGUgTWFrZWZpbGUgY2hlY2tz
Cj4gd2hpY2ggdXNlIGdyZXAgdG8gbG9vayBmb3IgcGF0dGVybnMgY2FuIGluY29ycmVjdGx5IG1h
dGNoIGFnYWluc3QgdGhlCj4gYnVpbGQgcGF0aHMsIHJhdGhlciB0aGFuIHRoZSBjb21tYW5kJ3Mg
ZXhpdCBzdGF0dXMuIFRoaXMgbWVhbnMgYQo+IHdvcmthcm91bmQgaXMgbmVlZGVkIHRvIGhhbmRs
ZSBjaGVja2luZyBmb3IgZXh0ZW5zaW9ucyBsaWtlIHppY3NyIGFuZAo+IHppZmVuY2VpLiBJbnN0
ZWFkLCBtYWtlIHRoZSBmb2xsb3dpbmcgdmFyaWFibGUgYXNzaWdubWVudHMgdXNlIHRoZSBzYW1l
Cj4gZXhpdCBzdGF0dXMgcGF0dGVybiBhcyBPUEVOU0JJX0xEX1BJRToKPgo+IENDX1NVUFBPUlRf
WklDU1JfWklGRU5DRUkKPiBDQ19TVVBQT1JUX1NUUklDVF9BTElHTgo+IENDX1NVUFBPUlRfU0FW
RV9SRVNUT1JFCj4KPiBUZXN0ZWQgYnkgYnVpbGRpbmcgYSBmdWxsIGltYWdlIGluIFlvY3RvIGlu
Y2x1ZGluZyBPcGVuU0JJIGFuZCBib290aW5nCj4gaXQgaW4gUUVNVS4KPgo+IE5vdGUgdGhhdCBv
bmx5IHRoZSBmaXJzdCBwYXRjaCAoZm9yIENDX1NVUFBPUlRfWklDU1JfWklGRU5DRUkpIGlzIG5l
ZWRlZAo+IHRvIGZpeCB0aGUgWW9jdG8gUUVNVSBjYXNlLCBidXQgSSd2ZSBzdWJtaXR0ZWQgdGhl
IHJlbWFpbmluZyB0d28gZm9yCj4gY29uc2lzdGVuY3kuIEFsc28gc2luY2Ugc3VibWl0dGluZyB0
aGUgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHNlcmllcyB0d28KPiBhZGRpdGlvbmFsIHVzZXMgb2Yg
Z3JlcCBoYXZlIGFwcGVhcmVkIGluIHRoZSBNYWtlZmlsZSwgYnV0IEkndmUgb3B0ZWQKPiBub3Qg
dG8gY2hhbmdlIHRoZW0gc2luY2UgdGhleSBkb24ndCBhcHBlYXIgdG8gcmVzdWx0IGluIHRoZSBz
YW1lIGlzc3VlCj4gb2JzZXJ2ZWQgaW4gWW9jdG8uCj4KPiBTZWUgYWxzbzogaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNTg5Nwo+Cj4gQXMgYW4gZXhh
bXBsZSwgaW4gbXkgWW9jdG8gYnVpbGQgZW52aXJvbm1lbnQsIHZhbHVlcyBsaWtlIENDIGZvciBP
cGVuU0JJCj4gYXJlIHNldCBsaWtlOgo+Cj4gfGV4cG9ydCBDQz0icmlzY3Y2NC1wb2t5LWxpbnV4
LWdjYyAtbWFyY2g9cnY2NGltYWZkY196aWNzcl96aWZlbmNlaSAtbWFiaT1scDY0ZCAtV2wsLU8x
IC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCAtV2wsLXoscmVscm8sLXosbm93
IC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3Jt
YXQgLVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290PS9o
b21lL3RnYW1ibGluL3dvcmtzcGFjZS95cGJ1aWxkcy9wb2t5LXFlbXVyaXNjdjY0L2J1aWxkL3Rt
cC93b3JrL3Jpc2N2NjRpbWFmZGNfemljc3JfemlmZW5jZWktcG9reS1saW51eC9vcGVuc2JpLzEu
OS9yZWNpcGUtc3lzcm9vdCIKPgo+IGFuZCB0aGUgYnVpbGQgZXJyb3I6Cj4KPiB8IC90bXAvY2Nu
cGFqajMuczogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+IHwgL2hvbWUvdGdhbWJsaW4vd29ya3NwYWNl
L3lwYnVpbGRzL3Bva3ktcWVtdXJpc2N2NjQvYnVpbGQvdG1wL3dvcmsvcmlzY3Y2NGltYWZkY196
aWNzcl96aWZlbmNlaS1wb2t5LWxpbnV4L29wZW5zYmkvMS45L3NvdXJjZXMvb3BlbnNiaS0xLjkv
bGliL3NiaS9zYmlfdGxiLmM6MTc2Ogo+IHwgRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGUgYGZl
bmNlLmknLCBleHRlbnNpb24gYHppZmVuY2VpJyByZXF1aXJlZAo+Cj4gQ2hlY2tpbmcgdGhlIGV4
aXQgc3RhdHVzIGRpcmVjdGx5IGF2b2lkcyBhIHBvc2l0aXZlIG1hdGNoIGFzIGhhcHBlbnMKPiB3
aXRoIGdyZXAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5
bGlicmUuY29tPgo+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJlYmFzZWQgb250byBsYXRl
c3QgbWFzdGVyLCByZW1vdmVkIG9sZCBDQyAodGhlaXIgY2hhbmdlcyBtZXJnZWQKPiAgIGFscmVh
ZHkpLCBubyBmdW5jdGlvbmFsIGNoYW5nZXMKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gu
bXNnaWQubGluay8yMDI2MDkxMC1tYWtlZmlsZV9leHRlbnNpb25fZ3JlcC12MS0wLWIzYWUwZDQ1
NmE2ZUBiYXlsaWJyZS5jb20KPgo+IC0tLQo+IFRyZXZvciBHYW1ibGluICgzKToKPiAgICAgICBN
YWtlZmlsZTogZG9uJ3QgZ3JlcCB3aGVuIHNldHRpbmcgQ0NfU1VQUE9SVF9aSUNTUl9aSUZFTkNF
SQo+ICAgICAgIE1ha2VmaWxlOiBkb24ndCBncmVwIHdoZW4gc2V0dGluZyBDQ19TVVBQT1JUX1NU
UklDVF9BTElHTgo+ICAgICAgIE1ha2VmaWxlOiBkb24ndCBncmVwIHdoZW4gc2V0dGluZyBDQ19T
VVBQT1JUX1NBVkVfUkVTVE9SRQoKTEdUTS4gWW91IG1heSBhbHNvIHdhbnQgdG8gdXBkYXRlIEND
X1NVUFBPUlRfVkVDVE9SIGFuZApDQ19TVVBQT1JUX1dUSFJFQURfU0FGRVRZX1BPSU5URVIgaW4g
dG9wLWxldmVsIE1ha2VmaWxlLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpUaGFua3MsCkFudXAKCgo+Cj4gIE1ha2VmaWxlIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDog
NWExNzUwMTcyNjFhZjk3ZTkxMjJmY2I5ZDkwMTI0ODFjZGI1YWE0MQo+IGNoYW5nZS1pZDogMjAy
NjA5MDktbWFrZWZpbGVfZXh0ZW5zaW9uX2dyZXAtNGY5ZmNlYTg5NGNkCj4KPiBCZXN0IHJlZ2Fy
ZHMsCj4gLS0KPiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgo+CgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
