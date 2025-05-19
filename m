Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68375C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llLQbur5771kZKf4kAwBnMIrM0xQNM1arCP7YFlwMFE=; b=aYs4T+0Ol9yjvW
	bdIeU9Cv6pb9VHcVxS7CCmIS7NmYi5Xe1zAkLE9w8YAhWdCSgFbVWwaCXBW5t/RIsdGgTPlKGQxWB
	GfJlNVBbTyRdNPjTxF2/MAyZzAyZ0qEsjb3ol03LImGngRT3oHwd6fY/6x439S2vNw5hHgXW3Qv51
	okih9zQUp6JjQkpDquTnY+G41EVgkfR7PnUAh/C4Rqj1s6hsrJvdhdpMY8KPea1Z8kXfF0c7TlC9N
	WAQ1M2CJqlRiXXzqIucUfYghg8gLyCnMzCTX4D7uxp5VMK0itRnZKgY+gvbwHkmiWhI0gJAkFq2ld
	nLzDoygUkeiymauLD9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Gw-0000000AcZw-2rPB;
	Mon, 19 May 2025 21:43:46 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH80l-0000000AXXt-10h3
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:27:04 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3db6ddcef4eso44861905ab.2
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747690021; x=1748294821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pC3YWMiQQ6XkiY/HHpAeBS56prSKgY+PxFdfHwL02nw=;
        b=SjMvlsawMgCECO5+8uz7Qg/w8AEfPehqjDmDUnwWIzy3oqtQdRurDYg0AjRypw2G/v
         yVcEUk5fGkPQ4Ekua3ylvZcpn8uAWpLYEJC++4BYImarjsJFFvgtELywHwOM6OJsk9Cd
         xEvDAFI2U5yB3SmdK8dbpSNsYqrgXpILO1X/ddxowx4MqcMU5l2EO+dy/J2yn4V3lQ2c
         O73gkysEa2JXa5vJcKTSyI2ok3NrZgDd00yIe/qQrD3dUtu/iNWo/Warom0GtT3RBwwU
         tkXqLtCkSHMTsKK6Jt1b9XpseFhcW4DFs0fR1U172rAJS5pSGcHApArFt3Uscla5mW7a
         3LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747690021; x=1748294821;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pC3YWMiQQ6XkiY/HHpAeBS56prSKgY+PxFdfHwL02nw=;
        b=cXyKTfTD7ZK2zcjbQJsH4VGHig94qiOXePUDGVXTi14uFn1I5tAukWy0PBN14kiVWO
         MGekgKe5UQOl0pR40hpYNdObxLjWDwPchWvZGYd1iugAT4uvswWE6BAsPaaezqi/ZOCG
         0gae0OZF3xlsev8iulX0VFc9wz4iDkpIBeHwdyVsd2Ku8cMx/WxW+1UZGTrqdPqPF82c
         u9saLgkNY4BVYCpw6hiD+WlW2AuFClA2in0SluCjVGJ6omI1ezk3N0vrjERFDBZp/e+C
         7nplgS6FCFsCwKW9/fcbbWFXlfTBf35KJ0ZxzICNCl2yoWA6ARkLrHT2i/qdqXD2UwXZ
         iqbg==
X-Forwarded-Encrypted: i=1; AJvYcCXzY2AhjCpdRyXbv/QMpZSIm9pKO2/rV3AkYiZVTvBeKDd2PT8hAyai1Vq0K/Qfzmr5lBkWprZs@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd9dnajPMoDzVLlZ1GgrIZ2wQbzesScPxJVToySWqgbP++qf9V
	lbScCs9Ry9XUn7TYw3yRfyNFhg7Mj5LHXT5EWTyc17qHH/C8bCNuIjKiOWnoGIfpzmM=
X-Gm-Gg: ASbGncsIcBOA8zsTiCuS1QYoWwXgukpna52CTJg6TLX4RI+P1Pc8J1Dp+IwxToc6aRP
	DjUOo+Z8Vtn6FWR9njj4h+49QpmytXPigtUhAODdb/yXgq+cr9nyVelrybPWpkKG/gk9ktOdS9Y
	C7qhByQ9kwegVgKmBqil5lgA2HqfOgmMYrR5chLw4RX6zkmbdFVXZk3vZzHSZ5oFzd8XCPtmn7w
	4D/svcSIZ847haR4a1BVScHinql9M4OChrIpaP7sV7bFxAowuooPXB/4zlBEULJ1tdBiSsZt567
	0G0PJIxoCJSx9yu1BEiuUNuCMd0M7cHegBVpolNm58Md5MdQzMZ1XngbfxxWJz8OiWCxIVD0
X-Google-Smtp-Source: AGHT+IEnRCdr6FBMKIEkwn3OMxjmj0R7fkwfeujE6ayEA6NsNYeJcD8N+A6jfLX78AoeSSAaNRmFiA==
X-Received: by 2002:a05:6e02:351d:b0:3db:71e8:8645 with SMTP id e9e14a558f8ab-3db84321b22mr150222605ab.16.1747690021634;
        Mon, 19 May 2025 14:27:01 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843d471fsm21410625ab.10.2025.05.19.14.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 14:27:01 -0700 (PDT)
Message-ID: <7447a767-ea7f-40c1-af11-2d8a9e93dc0c@sifive.com>
Date: Mon, 19 May 2025 16:27:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] lib: sbi: pmu: Add SSE register/unregister()
 callbacks
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250519083950.739044-1-cleger@rivosinc.com>
 <20250519083950.739044-2-cleger@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250519083950.739044-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_142703_306622_6EB19FE4 
X-CRM114-Status: GOOD (  14.67  )
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

T24gMjAyNS0wNS0xOSAzOjM5IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gQXMgc29vbiBh
cyB0aGUgU1NFIGV2ZW50IGlzIHJlZ2lzdGVyZWQsIHRoZXJlIGlzIG5vIHJlYXNvbiBub3QgdG8K
CnR5cG86IHJlbW92ZSAibm90Ii4gT3RoZXJ3aXNlLAoKUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xs
YW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKPiBkZWxlZ2F0ZSB0aGUgaW50ZXJydXB0
LiBTcGxpdCB0aGUgUE1VIFNTRSBlbmFibGUvZGlzYWJsZSgpCj4gY2FsbGJhY2tzIGJ5IG1vdmlu
ZyBNSURFTEVHIHNldHRpbmcgdG8gcmVnaXN0ZXIvdW5yZWdpc3RlcigpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgbGli
L3NiaS9zYmlfcG11LmMgfCAyNCArKysrKysrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBpbmRleCA1OTgzYTc4NC4u
ZGVlNTBiOWIgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2Jp
L3NiaV9wbXUuYwo+IEBAIC0xMDk3LDI0ICsxMDk3LDE4IEBAIHZvaWQgc2JpX3BtdV9leGl0KHN0
cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgCj4gIHN0YXRpYyB2b2lkIHBtdV9zc2VfZW5h
YmxlKHVpbnQzMl90IGV2ZW50X2lkKQo+ICB7Cj4gLQlzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRl
ICpwaHMgPSBwbXVfdGhpc2hhcnRfc3RhdGVfcHRyKCk7Cj4gIAl1bnNpZ25lZCBsb25nIGlycV9t
YXNrID0gc2JpX3BtdV9pcnFfbWFzaygpOwo+ICAKPiAtCXBocy0+c3NlX2VuYWJsZWQgPSB0cnVl
Owo+IC0JY3NyX2NsZWFyKENTUl9NSURFTEVHLCBpcnFfbWFzayk7Cj4gIAljc3JfY2xlYXIoQ1NS
X01JUCwgaXJxX21hc2spOwo+ICAJY3NyX3NldChDU1JfTUlFLCBpcnFfbWFzayk7Cj4gIH0KPiAg
Cj4gIHN0YXRpYyB2b2lkIHBtdV9zc2VfZGlzYWJsZSh1aW50MzJfdCBldmVudF9pZCkKPiAgewo+
IC0Jc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0
cigpOwo+ICAJdW5zaWduZWQgbG9uZyBpcnFfbWFzayA9IHNiaV9wbXVfaXJxX21hc2soKTsKPiAg
Cj4gIAljc3JfY2xlYXIoQ1NSX01JRSwgaXJxX21hc2spOwo+ICAJY3NyX2NsZWFyKENTUl9NSVAs
IGlycV9tYXNrKTsKPiAtCWNzcl9zZXQoQ1NSX01JREVMRUcsIGlycV9tYXNrKTsKPiAtCXBocy0+
c3NlX2VuYWJsZWQgPSBmYWxzZTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgcG11X3NzZV9jb21w
bGV0ZSh1aW50MzJfdCBldmVudF9pZCkKPiBAQCAtMTEyMiw3ICsxMTE2LDI1IEBAIHN0YXRpYyB2
b2lkIHBtdV9zc2VfY29tcGxldGUodWludDMyX3QgZXZlbnRfaWQpCj4gIAljc3Jfc2V0KENTUl9N
SUUsIHNiaV9wbXVfaXJxX21hc2soKSk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIHBtdV9zc2Vf
cmVnaXN0ZXIodWludDMyX3QgZXZlbnRfaWQpCj4gK3sKPiArCXN0cnVjdCBzYmlfcG11X2hhcnRf
c3RhdGUgKnBocyA9IHBtdV90aGlzaGFydF9zdGF0ZV9wdHIoKTsKPiArCj4gKwlwaHMtPnNzZV9l
bmFibGVkID0gdHJ1ZTsKPiArCWNzcl9jbGVhcihDU1JfTUlERUxFRywgc2JpX3BtdV9pcnFfbWFz
aygpKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgcG11X3NzZV91bnJlZ2lzdGVyKHVpbnQzMl90
IGV2ZW50X2lkKQo+ICt7Cj4gKwlzdHJ1Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMgPSBwbXVf
dGhpc2hhcnRfc3RhdGVfcHRyKCk7Cj4gKwo+ICsJcGhzLT5zc2VfZW5hYmxlZCA9IGZhbHNlOwo+
ICsJY3NyX3NldChDU1JfTUlERUxFRywgc2JpX3BtdV9pcnFfbWFzaygpKTsKPiArfQo+ICsKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzYmlfc3NlX2NiX29wcyBwbXVfc3NlX2NiX29wcyA9IHsKPiAr
CS5yZWdpc3Rlcl9jYiA9IHBtdV9zc2VfcmVnaXN0ZXIsCj4gKwkudW5yZWdpc3Rlcl9jYiA9IHBt
dV9zc2VfdW5yZWdpc3RlciwKPiAgCS5lbmFibGVfY2IgPSBwbXVfc3NlX2VuYWJsZSwKPiAgCS5k
aXNhYmxlX2NiID0gcG11X3NzZV9kaXNhYmxlLAo+ICAJLmNvbXBsZXRlX2NiID0gcG11X3NzZV9j
b21wbGV0ZSwKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
