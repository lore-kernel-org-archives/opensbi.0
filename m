Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74E5C43458
	for <opensbi@archiver.kernel.org>; Sun, 28 Jun 2026 05:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkLUYUg9xoh3mx3E7N12IDlWWwurfdBT+AMPFv+857g=; b=JsAGgsWPJcL9ts
	CLErBYHd1kL2Zgp+ta+ANuW4W8asKkU1uC0J6O2Nd+VPhuUjcZYwCfNuG2dwQ4MR6eM4IRWDZ/NbY
	BnM/wwgqfCVi9pQqZj7gWtsqYZ46xvEWbvoS3xgel1ATKeASTiCgTsYwfT5xhnyp+QJyTXFq1OJfm
	+qe1ZMRt2t2rygEWDyeRfPgiAaaUfsAVhbjVw4rr9MDtjelko6bgISOPGZBBhzHDrb6yrN5vzM9wB
	p0SmvITMPssZIbaIR7OYm+3+yBr2ekwAkxujbQdY+nIU3ee6sXAL+7qxvZnNC3iUfazJOhT1cFWw3
	8jn/RHnqq2eaSyK/T7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdiHA-0000000Cvt3-08sO;
	Sun, 28 Jun 2026 05:41:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdiH6-0000000Cvse-2c8c
	for opensbi@lists.infradead.org;
	Sun, 28 Jun 2026 05:41:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so12037915e9.0
        for <opensbi@lists.infradead.org>; Sat, 27 Jun 2026 22:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782625306; cv=none;
        d=google.com; s=arc-20260327;
        b=oyuiXa0FB12jgzgpOlk+j91h9FNscPcOZzjvMI5LUqr+WvpfuDg44N7FlO4v3wNScz
         aMF6iAbeHr2eWQY1yCJNE6UgWSAnSqfnH3IPwF0Uyz1gnz3h5wAZsFIDeukMsBnxHcU3
         GoDElCal9rUd/df4xxwl0HdxebgKSwLxx2+ajArXoBqt9kvzsKi4Omjojfg85VeswoyF
         lLw8IcQXXpcEcNMrFlToiwi8RGNQsI5iiHMGpZuVTlFZQS8GULF04Up/25VcOdNI8DtP
         4rKXs1O9NQoN9OBUlcCdo0WNEIHdiNUGveQe0IR6STaFdsm5LxyvmZtFVYR44oYySEp0
         d2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E+43/ZkFnYKhWR5gyXsQUXRs72GwT+BMQ0yXdsmUaxI=;
        fh=4wwJDrv5u9KKxhcLJ7PsALpJ/qvYfZxTvkqYVdvbljo=;
        b=jr+IkJ0AqD/rNqYKYXceJiUjTEblIipZqy1UaDb6emSuUZCGRMlcyzIAqo/zh12583
         yfGP/dlS00DsvXZLlY/pLU/2iVALWcfKffWu5PQnTJB/Hs14SgQmgvjfuV6LYtFFA54r
         uvXN1vLL6qDd05/SDGL7ybqlCuOt5TfvgY5ozgLxQvTsKUQzXgJ+rlAY4G6zIhtQ7K5K
         f19AhLV4GeCdUsnNlG1IHI09ZM+sR2vfl68oKcdgchlXzQz1Y2Mg4A8KkH38RChmA5pb
         ERFm5ukoFvBsqOgjI2B+IYeIOa9xYfCs2U6Z/0m1f0HA0nTfogOmy2kV1yQ+WZhrPzc4
         EGZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1782625306; x=1783230106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+43/ZkFnYKhWR5gyXsQUXRs72GwT+BMQ0yXdsmUaxI=;
        b=jj/LnnGNpqyngmynpAbnkGoZrVQzq7J1xKq6/Pk5ACnaXCojBaCY1Hno8ndF+oPmGs
         qsFJJ+GGbRJLrq38MpfM94Pl7PFuYnFkaNNo8d0O+4Bi2WFynp6AEatomFGQjNqP7KQs
         jGIdn6VOrsJrR7XNv7qT+AnhjeNc9G80bOY+VqjXVbM/ZlwxVcb6tuAb1FNOT/bCljXc
         DzfYfbjwjiObGOuMuz0y1wRO90xH6XKqlyP/hG7YUt8p4JkHLNDikCsulHNbFLre0Ydk
         vvcyW4pWBqzKDo3TODtU7dKVnn6+5sHw6mEitpWowPgwQUbs/99BODDKkFAlMBbCutJM
         kZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782625306; x=1783230106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+43/ZkFnYKhWR5gyXsQUXRs72GwT+BMQ0yXdsmUaxI=;
        b=igK2r94rf/Q4/SQxi+redG1J3pJNK9HUjqPNI2g1xKOCEE+OZi/sVi8WDQdNl278n7
         DEDHyIWVzjsaUALG9776lKvpc+XU1/Ib+fV5nyU5Goxd13LKLjWvcpXgktXO8R/Z/8A8
         Lne1Ig2qcLapXPtHYUuJ449tHZIRuPDr8KjPnqtymOuMq+/ztuxrH/tgKI3/lCbh5ycR
         az4v94YvHsPeFJgkF/qL8PVom1H16XY1Il6//2NO+eN4OVU/Y0mwH96MrjdBpBSOlktj
         5efJ3fWUV4ajY6scsgyRHVMAUbng57sXYxAPu8RFDUm0E+7BdqOaVkTJYxxP2LMwy7ca
         0clg==
X-Forwarded-Encrypted: i=1; AFNElJ/NYyPYQtDZ1KfOWvkcPbWCc41jz5lLa9D7693ITv/NUin2SaUcLCsuuVIGtrYQ7yHKYZdtEgsb@lists.infradead.org
X-Gm-Message-State: AOJu0YyCpx2YQLCnB0ac2fCi45o8fqO1kit4vvLzFX5FXCU1I0Mv6WVv
	yybaTHCzR+h9r+b+0AjeCZevCU9nsw4EX3Zu/2TyeSySyZ+RpPHrDBtFJ0E6KBLZw+r184vSyYm
	VzD3LU0Vw3xws8o3fWanwtTvtW1YRNiJ1TBMjkJtZRQ==
X-Gm-Gg: AfdE7cmiEUUVqXTaj3zTkpFW8ycI1FbRQzB6T+MbHrla4UqRpRMUkch8q4N0TlFIDJ+
	ylahg0uPAo75RNWbPB7o3gs8YfTtmvUlWJfWCeUnCib2M1/CzNBDJcRPYJG9Iw6PJY1MGX09AUl
	PAgln0v4KLH0QIx8ORwhSq9PazxLQm5iaVMzBmNW1Wx9RLzmIEjAYAA1K23Rv4uSKzHxRO+Tzlx
	1Hkuk5J/y5yIM/AcLqF7MxeZiujFmE9UB4ZjfN4Aq8ylzDrUmoL9OVemLH0VkwXxKrCVyOTnypZ
	Rkzk2vKJdUNh1LkLTtb+qmckpPNAzcaiivd3zZfmvCOYpZgLFclbdZ/bbN7FMCpxOQR+DYaP+eH
	WgDCXBcegpubWg+I=
X-Received: by 2002:a05:600c:1f91:b0:492:4d56:d5fe with SMTP id
 5b1f17b1804b1-49266858306mr175813525e9.14.1782625305671; Sat, 27 Jun 2026
 22:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260618103713.2588984-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20260618103713.2588984-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 28 Jun 2026 11:11:34 +0530
X-Gm-Features: AVVi8CfY-WuDfR6xE0slJZWWnekyLR4rbyMX4JfhEzcoHmbqpCdmUcW__EERao4
Message-ID: <CAAhSdy0hv9LgyZighDhjsX-CnOox1qMWS5eEhUx6DHfpEnJoFg@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: mips eyeq7h: fix boot with JTAG
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: chao-ying.fu@globalfoundries.com, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_224149_060415_78610CF6 
X-CRM114-Status: GOOD (  16.36  )
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgNDowN+KAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
YWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPiB3cm90ZToKPgo+IFdoZW4gSlRBRyBpcyBj
b25uZWN0ZWQsIGludGVybmFsIGxvZ2ljIGxlYWRzIHRvIHRoZSBiaXQKPiBNSVBTX0NUTDBfREJH
X1JTVF9EQVNSVCAoZm9yIHRoZSBkZWJ1ZyB1bml0KSBzdGF5IGhpZ2ggYW5kIHRoaXMKPiBwcmV2
ZW50cyBub3JtYWwgY2x1c3RlciBwb3dlci11cC4KPgo+IEZvcmNlIHByb3BlciBwb3dlci1vbiBy
ZXNldCB2YWx1ZSBwcmlvciB0byBwb3dlci11cCBzZXF1ZW5jZS4KPiBIb2xkIHRoaXMgdmFsdWUg
Zm9yIGFib3V0IDEwIHVzZWMKPgo+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIEtvbmRyYXRpZXYg
PHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRv
IHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIHBsYXRmb3Jt
L2dlbmVyaWMvbWlwcy9leWVxN2guYyB8IDggKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dl
bmVyaWMvbWlwcy9leWVxN2guYyBiL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9leWVxN2guYwo+IGlu
ZGV4IDI0MmNiYjNjZTMyNy4uMzBhZjA5NmMxNGY0IDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dl
bmVyaWMvbWlwcy9leWVxN2guYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9leWVxN2gu
Ywo+IEBAIC03Myw3ICs3MywxMyBAQCBzdGF0aWMgdm9pZCBleWVxN2hfcG93ZXJ1cF9vbGIodTMy
IGhhcnRpZCkKPiAgICAgICAgIC8qIEdldCB0aGUgTUlQU19DTV9DVEwwIGFkZHJlc3MgKi8KPiAg
ICAgICAgIGNtZCA9ICh2b2xhdGlsZSB2b2lkICopKE1JUFNfT0xCX0FERFJbY2xdICsgTUlQU19D
TV9DVEwwKTsKPgo+IC0gICAgICAgdGVtcCA9IHJlYWRsKGNtZCk7Cj4gKyAgICAgICAvKiBzZXQg
cmVzZXQgdmFsdWUuIFZhbHVlIG1heSBiZSB3cm9uZyBhZnRlciBKVEFHIGRlYnVnIHNlc3Npb24g
Ki8KPiArICAgICAgIHRlbXAgPSBNSVBTX0NUTDBfQ0FDSEVfSFdfSU5JVF9JTkhJQklUIHwKPiAr
ICAgICAgICAgICAgICBJTlNFUlRfRklFTEQoMCwgTUlQU19DVEwwX0RCVV9DT0xEX1BXUl9VUCwg
MikgfAo+ICsgICAgICAgICAgICAgIE1JUFNfQ1RMMF9EQlVfUFdSX1VQIHwgTUlQU19DVEwwX0NN
X1BXUl9VUDsKPiArICAgICAgIHdyaXRlbCh0ZW1wLCBjbWQpOwo+ICsgICAgICAgd21iKCk7Cj4g
KyAgICAgICBzYmlfdGltZXJfdWRlbGF5KDEwKTsKPiAgICAgICAgIC8qIEVuYWJsZSBIVyBjYWNo
ZSBpbml0ICovCj4gICAgICAgICB0ZW1wID0gdGVtcCAmIH5NSVBTX0NUTDBfQ0FDSEVfSFdfSU5J
VF9JTkhJQklUOwo+ICAgICAgICAgLyogZGVhc3NlcnQgcmVzZXQgKi8KPiAtLQo+IDIuNDMuMAo+
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
