Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AC1CAC5B8
	for <opensbi@archiver.kernel.org>; Mon,  6 Oct 2025 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUY7xhz+PDoMQveP5exwpBlsTYf7I1yKA/WrV5DRJZM=; b=GWCMBBb64XVvjW
	4+k0GlSZNXqs1QU2UkLhnPyU1oRDTb8fJTkQ+r46fAdlTkZBuUftjIsdZWxj755IB5WMoJAsr4Zg0
	MzGTBLj871HRudyZ4pK3KGdHPzNInlP8E8bol8f7OTdFw2dyK2Tpyraq12yHYDnFzwoHElzLG3ZBA
	JU1zwZzRI+ixskWl21DfzR5wXbc5tyafwIgXEZ3GQY7RPj6l68x1g5fIrtfxLG8IMULJaTr3PFRr9
	uPBaHhO8hgCbPTMu3C7IITwfBtOIB59XVV/TYvMve2HLpK1OA/ej0IqZD3BIGPt152+R6re9hyKll
	VlrQt4N2JmKxEpuhISEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gzf-0000000HDGH-0Aft;
	Mon, 06 Oct 2025 08:54:55 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gzb-0000000HDFq-235H
	for opensbi@lists.infradead.org;
	Mon, 06 Oct 2025 08:54:53 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-42f6e0bdcf7so9219975ab.0
        for <opensbi@lists.infradead.org>; Mon, 06 Oct 2025 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759740890; x=1760345690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/UyqgdW+/r0qZ4oLayQq0TT+KU6tvOtnS1oSnE7wN8=;
        b=ld7uSUCxbQTtLiUN/t2cBvaqFYkj2D60VSS3pMyUh5BaY+z9bXXHFDACkKj33RR5so
         cHjjnpqr4AjJ9o7DUEEam3oN2tpJkHSGAgGbanlYLVGeQn5e6If9YXZXC1CjA485I+Vs
         MGf+iMU6lmGgL+yPWneiA+CQkx9naKv+bmUkRborHpi16pAZRgr9PX9z036YMgGdihEY
         ilfJkF9LDqj80+49FvQtp035ex8i09GOW79OKdE3FmEYJ7p6BxhVyVXaOy8Ba7j7swr6
         MTYUSLlWaGK1etRGFAjdA6yJQHf02vsa+t7pZKeh4XMdMih7M6IIRMa+I64p9m+SEb0/
         T3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759740890; x=1760345690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/UyqgdW+/r0qZ4oLayQq0TT+KU6tvOtnS1oSnE7wN8=;
        b=nBCyl/V8xTWW91EtYwBT42VfaMjur5KRa04NaIbooMH03gQ/wpAtn8F9Jce8LLBauO
         nLAbUjz5on0uEFH//47wyNrEbPHTIL2c/ZEQWllKkpvYxEUQJRhNCD9eshpolDMOz2FO
         5au7nte1HJWubEst+0t6jJ8vqJNr49Mx2tkMginDSNjTB5YOrutIHGIDMStAGzVvpM9d
         iPPsukvb6KL9y1ahbnby6JO3t8VZW4Bz5/ReVB1/0mzMdUGNe3u/UC2C0+jvDYsuC68Q
         oNM3pDTXJPRg47AE3IgGiFgJodiVW7NvFBHrEQtBLJL5EJfCWMCaMC80xAxRl/BZcnKj
         BswA==
X-Gm-Message-State: AOJu0YzNH5dtrdUOQpktns3C/EKc1EXKp3i1ipibQz06xz+OS1w6kADH
	h+UqknReas+5pz2WNMOsQeSjjsRmB/ncXE30NpHgN8I6U+erV8f5QIA7EbzwsEwimp0BdIigBNy
	DgHUaRAXeBOXiGe+rMEPct/VmxOn1hBeVqss2pAzwIg==
X-Gm-Gg: ASbGncvgnUs7iTB7n2n/sMtxQPC+mTqQDdzBjLOfRJgD8NOZOjVqHN7VhbhxhodKZ/k
	ZCqNEtrBF1BN5PjSw4UmB5W1n27oD42xelxMIxfnPvOcLzoPb5mj9FlX7Rlfuu4aaI1yAM/Pkl4
	oXbg6JMWWxAmKuG6Q5kXxByKr0/4tdO6h1Y729MZv2tmGSE1NLWV7PA5rZz4ozuCNJv3NwmWbaQ
	5KW5sLlPiEV3RruVTuZ7k3OphIaGtnzidsi8vtEm6tvGbhgLuNiEZML6sktBO3UcY4nVeF8Zw==
X-Google-Smtp-Source: AGHT+IHbfugFgAZg04Bm2/O12T4LKfBmpyHg57lXXJxEcKOkxiMx6LlO+fjPT9c7yJakttfhyabiMOFph3rhAxFba/M=
X-Received: by 2002:a05:6e02:1987:b0:427:7b76:7896 with SMTP id
 e9e14a558f8ab-42e7acecb46mr178942655ab.3.1759740890210; Mon, 06 Oct 2025
 01:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250814111012.20151-1-peter.lin@sifive.com>
In-Reply-To: <20250814111012.20151-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Oct 2025 14:24:39 +0530
X-Gm-Features: AS18NWCmxSOxfqF9vsSUH3fL1zch_4ns4t7W8y15mji5aWfMRah6g8i3RWBQkuc
Message-ID: <CAAhSdy0kLOeEDbjv377tr0rfvY-ZUug1hZ9iTPb+WbpynQUntw@mail.gmail.com>
Subject: Re: [PATCH] lib: serial: sifive-uart: add shared memory region for
 SiFive UART
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_015451_773409_6332C780 
X-CRM114-Status: GOOD (  16.19  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgNjo0NuKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHNoYXJlZCBtZW1vcnkgcmVnaW9uIHNv
IHRoZSBkcml2ZXIgaGFzIHBlcm1pc3Npb24KPiB0byBhY2Nlc3MgaXQgaW4gT3BlblNCSS4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+
CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpB
cHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51
cAoKCj4gLS0tCj4gIGxpYi91dGlscy9zZXJpYWwvc2lmaXZlLXVhcnQuYyB8IDUgKysrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2xpYi91dGlscy9zZXJpYWwvc2lmaXZlLXVhcnQuYyBiL2xpYi91dGlscy9zZXJpYWwv
c2lmaXZlLXVhcnQuYwo+IGluZGV4IDM1ODFkNDdhLi41NTYzNzEzNyAxMDA2NDQKPiAtLS0gYS9s
aWIvdXRpbHMvc2VyaWFsL3NpZml2ZS11YXJ0LmMKPiArKysgYi9saWIvdXRpbHMvc2VyaWFsL3Np
Zml2ZS11YXJ0LmMKPiBAQCAtOSw2ICs5LDcgQEAKPgo+ICAjaW5jbHVkZSA8c2JpL3Jpc2N2X2lv
Lmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlf
ZG9tYWluLmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvc2VyaWFsL3NpZml2ZS11YXJ0Lmg+Cj4K
PiAgLyogY2xhbmctZm9ybWF0IG9mZiAqLwo+IEBAIC0xMTEsNSArMTEyLDcgQEAgaW50IHNpZml2
ZV91YXJ0X2luaXQodW5zaWduZWQgbG9uZyBiYXNlLCB1MzIgaW5fZnJlcSwgdTMyIGJhdWRyYXRl
KQo+Cj4gICAgICAgICBzYmlfY29uc29sZV9zZXRfZGV2aWNlKCZzaWZpdmVfY29uc29sZSk7Cj4K
PiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgcmV0dXJuIHNiaV9kb21haW5fcm9vdF9hZGRf
bWVtcmFuZ2UoYmFzZSwgUEFHRV9TSVpFLCBQQUdFX1NJWkUsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTU1JTyB8Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX01F
TVJFR0lPTl9TSEFSRURfU1VSV19NUlcpKTsKPiAgfQo+IC0tCj4gMi40OC4wCj4KPgo+IC0tCj4g
b3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
