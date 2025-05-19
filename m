Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C20C3ABDD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLALEDffeieKswjIhhqI49vA/eo1M1NHDOVj8i7HubA=; b=kK4ijAoZNylEDX
	QS4zoP4bYYfRl1oQynt0DDY0jznZe2k59AQpsq4pTlxmKXU4jSDmSOC4+hNLufDQmckkZIeMlRbZp
	E5lf6pTsB1XDJ+hFmgB+cNtr0zv3uTStF5Wfv5xB0ETjPWcsLJVP9JthpeRASItG52syuyx/Rp32b
	47C/qonSsAVnUrty0dDuCFbgM0YvhxdCVuiVtH2sKgl/0OGRnksfSKUZq1zMFKsaQLmC7JXM7KSp8
	ShF5MA+YA14pPoFWqbh44Kjmdy9Mn2mUdqXWCmAcSzf36hlteKwtfphBNPug7WXE/80r8YFkZdyG/
	k78hyvUX97ITQLKESKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aJ-0000000AHz5-0USi;
	Mon, 19 May 2025 19:55:39 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5Is-0000000A9TX-3v4Z
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 18:33:36 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-551ed563740so2293580e87.2
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747679612; x=1748284412; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=603XevYrlvbK3IVLXFen8tYv6RoiOYoimExm8KNnN58=;
        b=Kt2Oxv5w40Xe4Qa6snJskZnC7BcJwb55FgfZ1LF688xsbGTpEqSQdY13GDdM4fpe6m
         Gq7QT1TV0TCbg2Yprc0+de5KQJ3B9luXc9XDGS8tyWyxeuuNXxNpt84LWbLHh6koQegb
         mXtdfGXnauD9NGxQdFiwDajvqLqFa5qjn2ocT6V+xHdLqdSDJlnVaa6e1C7H+WW2FaNU
         RVfupUlwIDvFJU71YLGZZnlnPIHIbGMshmRPEVmDEfUFfKnNS2IfR119fHKUreii8Isy
         3qVZLB21DgtSxlwCkaGrVrwDitM0/4/EhN1IclFKHFY4qvNRGTKCJH2pHgynLQtJb/XU
         0XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747679612; x=1748284412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=603XevYrlvbK3IVLXFen8tYv6RoiOYoimExm8KNnN58=;
        b=H2NhaHu1ix3ONwjgsFm+hK4cKJ+b5NdRtq4BflwjMc5Vwcfa3o8tP8Q8z+HOBPlOEK
         qcn+NE4O2ShG5MWkmgUZOjHRBUJmgc9z18SsDY5ehvqf1MZGMACZp4vOsUznMyAK+9lj
         wo3uZnViT+WwjgCHu6ntQZ9JwzX6vzZauomPtr/7E+p+GtglIYUgUv8WpBGogrEQ5zfh
         ycL/0oycPm4B3DQ6bMpHX7mdZgZrKUgdtBg3ZeI/WQlumjJmyVB+BWCjZWdFlwBPn74O
         fIEvOn2aQFF0NoK2k7tip7pRcntid/WAnR20/X1hAy68nTupbf/GC1BZf05X8QJ8SgaU
         TaQQ==
X-Gm-Message-State: AOJu0YzIqNdErMaMlx0Bj/WQjO8uuv/EDXsfZcveQ+VwtVGWJ9kUZMtk
	Wuel24qi/IYgwUvDRv/XjRk1E2uy/pcTL12mlFbcFJVViPMexXHOICVhRzDukStaWxhiSxDiuPU
	HTO2i1N/uz8f8U3kucpNbZfmNbPwuWd7COw==
X-Gm-Gg: ASbGnctUxbMtBIhLC/bAzNvHvBpx74ePo8wA4efal0LP0eOmoM71xhqdTGvfjevd5ww
	a/UfPlh8yHCLLj2xYnvCiMhquQkOFGgfeSgKgjd9XVg27K5MAXU26JNfUv91mCRmni03Usb5mQm
	icuwEjxetoGdX//p+DZ7xhf9gMnj9T74qnzA==
X-Google-Smtp-Source: AGHT+IGEKnOdXuYvsQbNj7J8lC1c6IGAxbhQKDjFutcbQx5BNVORk4jopVEywAWn3VPzfvoeCQ8oMPeNbpN2Rbv4Wvk=
X-Received: by 2002:a05:6512:31d2:b0:549:66c9:d0d9 with SMTP id
 2adb3069b0e04-550e724e150mr3843661e87.53.1747679612302; Mon, 19 May 2025
 11:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250429232928.6499-1-cfu@mips.com> <CAAhSdy2dMXgJ9brDL_bRT3AUJFjL5isyMCy4+GO=xk6+F8KCHQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2dMXgJ9brDL_bRT3AUJFjL5isyMCy4+GO=xk6+F8KCHQ@mail.gmail.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Mon, 19 May 2025 11:33:20 -0700
X-Gm-Features: AX0GCFvwYwoX6BXpocxB0wGDhC0RAnltsRlujubpu7t1HDQYXpOBUzMHMqCE7Xw
Message-ID: <CAM1rFzGy0tqMJzDAyZ=CVmtKgEid9GDs3-qTvpjTAkjkB7p4PA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] *** Add MIPS P8700 platform ***
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_113334_970356_BD63D7B3 
X-CRM114-Status: GOOD (  17.48  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgNToxNuKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgNTozN+KAr0FNIENo
YW8teWluZyBGdSA8aWNlYmVyZ2Z1QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gKioqCj4gPiBD
aGFuZ2VzIGluIHY0Ogo+ID4gICBSZW1vdmUgY29kZSB0aGF0IG92ZXJyaWRlcyBuYXNjZW50X2lu
aXQuCj4gPiAgIFVwZGF0ZSBwODcwMC5jIHRvIHdvcmsgd2l0aCB0aGUgbGF0ZXN0IG92ZXJyaWRl
Lgo+ID4gICBVc2UgY3NyX3NldCBmb3IgbWlwc2NvbmZpZzYgaW4gcDg3MDAuYy4KPiA+ICAgQWRk
IHJpc2N2LGNib20tYmxvY2stc2l6ZSB0byB0aGUgZHRzIGZpbGUuCj4gPgo+ID4gQ2hhbmdlcyBp
biB2MzoKPiA+ICAgUmVtb3ZlIHN0dy5zLCBzdHcuaCwgYW5kIGV4dHJhIHNjcmF0Y2ggc3BhY2Uu
Cj4gPiAgIFVzZSBuYXNjZW50X2luaXQgdG8gaW5pdGlhbHplIE1JUFMgQ1NScy4KPiA+ICAgQWRk
IGFtbyBlbXVsYXRpb24gdmlhIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZXhjZXB0aW9ucy4KPiA+ICAg
Q2hhbmdlIHRvIHVzZSBBTU8gYW5kIFJEVElNRSBpbGxlZ2FsIGluc3RydWN0aW9uIGV4Y2VwdGlv
bnMuCj4gPiAgIFJldmlzZSB0aGUgZHRzIGZpbGUuCj4gPiAgIFJlbW92ZSBjb2RlIHRoYXQganVt
cHMgdG8gbWlwc19jcHNfY29yZV9lbnRyeS4KPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICBC
cmVhayB1cCBvbmUgcGF0Y2ggdG8gMTEgcGF0Y2hlcy4KPiA+Cj4gPiBDaGFuZ2VzIGluIHYxOgo+
ID4gICBPcmlnaW5hbCBjb2RlLgo+ID4gKioqCj4gPgo+ID4gQ2hhby15aW5nIEZ1ICg4KToKPiA+
ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6IGFkZCBQODcwMAo+ID4gICBwbGF0Zm9ybTogZ2Vu
ZXJpYzogbWlwczogYWRkIGhlYWRlciBmaWxlcwo+ID4gICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlw
czogYWRkIGFuIGVudHJ5IGZ1bmN0aW9uCj4gPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBh
ZGQgdGhlIHBsYXRmb3JtIGZpbGUKPiA+ICAgbGliOiBFbXVsYXRlIGFtbyBpbnN0cnVjdGlvbnMK
PiA+ICAgcGxhdGZvcm06IGdlbmVyaWM6IG1pcHM6IGFkZCBhIGR0cyBmaWxlCj4gPiAgIHBsYXRm
b3JtOiBnZW5lcmljOiBtaXBzOiBhZGQgb2JqZWN0cy5tawo+ID4gICBJbml0aWFsaXplIE1JUFMg
Y3VzdG9tIFBNQSByZWdpc3RlcnMKPgo+IERyb3AgdGhlIEFNTyBlbXVsYXRpb24gcGF0Y2ggc2lu
Y2UgSSBoYXZlIHNlbmQgYW5vdGhlciB2ZXJzaW9uCj4gb2YgdGhpcyBwYXRjaC4KPgo+IEFsc28s
IHlvdSBuZWVkIHRvIHJlYmFzZSB0aGlzIHNlcmllcyBvbiBsYXRlc3QgT3BlblNCSSBiZWNhdXNl
Cj4gdGhlIHBsYXRmb3JtIG92ZXJyaWRlIG1lY2hhbmlzbSBpbiBnZW5lcmljIHBsYXRmb3JtIGhh
cyBjaGFuZ2VkLgo+Cj4gUmVnYXJkcywKPiBBbnVwCgogIFllcy4gSSB3aWxsIGRyb3AgdGhlIEFN
TyBwYXRjaCwgcmViYXNlLCBhbmQgc2VuZCBvdXQgYSBuZXcgcGF0Y2ggc2V0ICh2NikuCk5vdGU6
IEkgc2VudCBvdXQgdjUgdHdvIHdlZWtzIGFnby4gKFBsZWFzZSBpZ25vcmUgdjUuKQogIFRoYW5r
cyBhIGxvdCBmb3IgdGhlIHJldmlldyEKClJlZ2FyZHMsCkNoYW8teWluZwoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
