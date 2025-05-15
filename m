Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E4CC54754
	for <opensbi@archiver.kernel.org>; Thu, 15 May 2025 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcrOW9pt+ysja2YuCGPszsfFVgZsMgHAKbF7m5oqTYA=; b=qLbguHxbSI9eMg
	Hr3iU8g6062uUdcp2jgk1P1a/MY+ciklb3QAjyO4asVTBfaZWXXCUONYorY3TZ1OwHdHJ+kK5abZK
	sMXbTat9+XqcZrsRcJBXXMhNfLY8zkcmMwplBPYINhjQWfCoarYRk7YiriWursQxWeUN9ykOw0k4m
	Gf8B3dFFbdIgBAk7mAyoWvAcD3kgJ6Nbp8ehCjMhEcE0Vkl600NNyNNcVTQPlZw+IS4xg6C90oJam
	zto3oE97kFTaEs8iM+NZP4jdb6j+WKJq+JRknrO16JTkWcL35NLXTpGfz2QR18Hy5KevlSEqzwGRS
	VZYsUVanCTsjV2oBGKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXAx-00000000T5s-414p;
	Thu, 15 May 2025 11:54:59 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFX7M-00000000Sci-3KtQ
	for opensbi@lists.infradead.org;
	Thu, 15 May 2025 11:51:18 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so7056145ab.1
        for <opensbi@lists.infradead.org>; Thu, 15 May 2025 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747309876; x=1747914676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JaFANYgNeqQSRYWtMSCpBS+0/HZyGPcW8qamEp/hiI=;
        b=Aka0LRZ19o6l+oTJK30UXYb1sHu6YK5cT6RLFi2BT50Ifc+hsUzo2eUaCpSo9UJj7q
         YbeSi57bl6eUroEnzyNuUaCV3DuocYggFl5DZvD36bCIRe4OkJ1v8WPrg4juO6JbceEa
         TKlucuQwL6MJo/TNIqbcXSwDPmfdtHv9e9jWq3z+eyzXECEMv8k13ZTU7gS9jN53ynPC
         EBWAQ5TO5TCEB3H/dLlLQ8yjHP+TWnne14WSQ7gTlR91xSXFRh9eQteezhAisk3tA/Bb
         hzkr3sIiNo6bfEF8JTg9Tc0LrmB443HnIuhVZlowaKU74xv3ArYlgsdVYtu6DwnpbsfC
         yXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747309876; x=1747914676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JaFANYgNeqQSRYWtMSCpBS+0/HZyGPcW8qamEp/hiI=;
        b=fY54lvcJTg6ipNnJceFXqaaKMriawkK/9ZPVB3vpoK7zMZX43VDEEQ/st9XqPq3T4s
         9enR3TAxhhlcgDcTuj19ehHIWqSNEeiE0Zr/IOvwU22hOiig7LvNYSMzDioH1mYz/YrV
         r1eQv6mA/BOyGsuvSk5CodxDU/FMDz48/7PAlrxYWVEAejto2f9YJb9e3nANCGoma0V9
         uhTr7qb7J9h7VGQ2moSYPVA04HKS2L56+1XL+xfh3evscAqslwm8uhtpXtZS3AZ94UyQ
         k2UWXhijKjrCBACmAH2Mi8AWUdCYjq9Xfl8ThtdMB8lSBIYv5s00l2XS37EB6wJ6Oto7
         wbzw==
X-Gm-Message-State: AOJu0YxoeS4Ix7ig8bq+8NBzoyn8KOHk2OPbGPTKTdKZnO1aynZz+u3w
	+p+isxNRf0wSky/GZsyCo2z2fi2EEusHVA5IdFFk6WyKF1jv6QVaxkTDuHPMAmUriSG4/Mcbj9f
	ftIsxc5MJwYqBvq9lUg7A+aV725naPKpY4BTgZA==
X-Gm-Gg: ASbGncuVa0EaGzpia20QEBVHqHzWxtK4InGfNKbTY6WUrzK4ENUvvaTRQ4wlwU9Ypk8
	dacTlXEJr16N+mz76R9WmQ5aHd/dGGE5sLwcm2VRdig5tj69Tyq4nxvZCTpW/INY8JTwfdy4mdv
	b7C10c9x6S51pxVxS4ifEfSUS8WYUBJAYWZQ==
X-Google-Smtp-Source: AGHT+IFbcL/Yk3RpydPgIZtrR3pevv8K946D54jBH49hYQSokOE56Hv+FBuWgwWm3UVhK18xD29ZRelBxfJh9kiNFRg=
X-Received: by 2002:a05:6e02:1aa7:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3db6f7ea216mr96406085ab.18.1747309875653; Thu, 15 May 2025
 04:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250413150628.75614-1-wxjstz@126.com> <20250413150628.75614-4-wxjstz@126.com>
In-Reply-To: <20250413150628.75614-4-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 17:21:02 +0530
X-Gm-Features: AX0GCFtTRT_ycXY5DNf9j-EPYlbrBNUC2Lz5fe5uHdc5N9xnUt1uATeVIeMyF4o
Message-ID: <CAAhSdy0QeTh8OAr0D_Xs9HApbyOQMcmnwBSLprtwAQXQkLmxwQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] lib: sbi: Fix sbi_timer for Asymmetric Multi-Processing
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_045116_836286_4281A93B 
X-CRM114-Status: GOOD (  21.09  )
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

T24gU3VuLCBBcHIgMTMsIDIwMjUgYXQgODozNuKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFRoZSBvcmlnaW5hbCBnZXRfdGltZV92YWwgaXMgYXNzaWduZWQgdG8gZ2V0
X3RpY2tzIGJ5IGRldGVjdGluZwo+IFppY250ciBkdXJpbmcgY29sZCBib290LiBIb3dldmVyLCBp
ZiB0aGUgbXVsdGktY29yZSBzeXN0ZW0gaXMgbm90Cj4gc3ltbWV0cmljYWwsIHNvbWUgY29yZXMg
ZG8gbm90IGhhdmUgdGhlIFppY250ciBleHRlbnNpb24sIGFuZCBhbgo+IGVycm9yIHdpbGwgb2Nj
dXIgd2hlbiBleGVjdXRpbmcgc2JpX3RpbWVyX3ZhbHVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlh
bmcgVyA8d3hqc3R6QDEyNi5jb20+CgpEbyB3ZSBoYXZlIHJlYWwtd29ybGQgYXN5bW1ldHJpYyBT
b0Mgd2hlcmUgb25seSBhIHN1YnNldApvZiBDUFVzIGhhdmUgWmljdG5yLiA/CgpJZiBub3QgdGhl
biBsZXRzIG5vdCBhZGQgdGhpcyBjb21wbGV4aXR5IHVudGlsIHN1Y2ggU29DIHNob3dzIHVwLgoK
UmVnYXJkcywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfdGltZXIuYyB8IDIyICsrKysrKysr
KysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3RpbWVyLmMgYi9saWIvc2Jp
L3NiaV90aW1lci5jCj4gaW5kZXggMTRlNWVlNDYuLjUyNjZjNjEyIDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvc2JpX3RpbWVyLmMKPiArKysgYi9saWIvc2JpL3NiaV90aW1lci5jCj4gQEAgLTE5LDcg
KzE5LDYgQEAKPiAgI2luY2x1ZGUgPHNiaS9zYmlfdGltZXIuaD4KPgo+ICBzdGF0aWMgdW5zaWdu
ZWQgbG9uZyB0aW1lX2RlbHRhX29mZjsKPiAtc3RhdGljIHU2NCAoKmdldF90aW1lX3ZhbCkodm9p
ZCk7Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2JpX3RpbWVyX2RldmljZSAqdGltZXJfZGV2ID0g
TlVMTDsKPgo+ICAjaWYgX19yaXNjdl94bGVuID09IDMyCj4gQEAgLTUyLDE2ICs1MSwxOSBAQCBz
dGF0aWMgdm9pZCBub3BfZGVsYXlfZm4odm9pZCAqb3BhcXVlKQo+ICB2b2lkIHNiaV90aW1lcl9k
ZWxheV9sb29wKHVsb25nIHVuaXRzLCB1NjQgdW5pdF9mcmVxLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdm9pZCAoKmRlbGF5X2ZuKSh2b2lkICopLCB2b2lkICpvcGFxdWUpCj4gIHsKPiAr
ICAgICAgIHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCA9IHNiaV9zY3JhdGNoX3RoaXNoYXJ0
X3B0cigpOwo+ICAgICAgICAgdTY0IHN0YXJ0X3ZhbCwgZGVsdGE7Cj4KPiAgICAgICAgIC8qIERv
IG5vdGhpbmcgaWYgd2UgZG9uJ3QgaGF2ZSB0aW1lciBkZXZpY2UgKi8KPiAtICAgICAgIGlmICgh
dGltZXJfZGV2IHx8ICFnZXRfdGltZV92YWwpIHsKPiArICAgICAgIGlmICghdGltZXJfZGV2IHx8
Cj4gKyAgICAgICAgICAgKCFzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJU
X0VYVF9aSUNOVFIpICYmCj4gKyAgICAgICAgICAgICF0aW1lcl9kZXYtPnRpbWVyX3ZhbHVlKSkg
ewo+ICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogY2FsbGVkIHdpdGhvdXQgdGltZXIg
ZGV2aWNlXG4iLCBfX2Z1bmNfXyk7Cj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAg
IH0KPgo+ICAgICAgICAgLyogU2F2ZSBzdGFydGluZyB0aW1lciB2YWx1ZSAqLwo+IC0gICAgICAg
c3RhcnRfdmFsID0gZ2V0X3RpbWVfdmFsKCk7Cj4gKyAgICAgICBzdGFydF92YWwgPSBzYmlfdGlt
ZXJfdmFsdWUoKTsKPgo+ICAgICAgICAgLyogQ29tcHV0ZSBkZXNpcmVkIHRpbWVyIHZhbHVlIGRl
bHRhICovCj4gICAgICAgICBkZWx0YSA9ICgodTY0KXRpbWVyX2Rldi0+dGltZXJfZnJlcSAqICh1
NjQpdW5pdHMpOwo+IEBAIC03Miw3ICs3NCw3IEBAIHZvaWQgc2JpX3RpbWVyX2RlbGF5X2xvb3Ao
dWxvbmcgdW5pdHMsIHU2NCB1bml0X2ZyZXEsCj4gICAgICAgICAgICAgICAgIGRlbGF5X2ZuID0g
bm9wX2RlbGF5X2ZuOwo+Cj4gICAgICAgICAvKiBCdXN5IGxvb3AgdW50aWwgZGVzaXJlZCB0aW1l
ciB2YWx1ZSBkZWx0YSByZWFjaGVkICovCj4gLSAgICAgICB3aGlsZSAoKGdldF90aW1lX3ZhbCgp
IC0gc3RhcnRfdmFsKSA8IGRlbHRhKQo+ICsgICAgICAgd2hpbGUgKChzYmlfdGltZXJfdmFsdWUo
KSAtIHN0YXJ0X3ZhbCkgPCBkZWx0YSkKPiAgICAgICAgICAgICAgICAgZGVsYXlfZm4ob3BhcXVl
KTsKPiAgfQo+Cj4gQEAgLTkxLDggKzkzLDExIEBAIGJvb2wgc2JpX3RpbWVyX3dhaXRtc191bnRp
bChib29sICgqcHJlZGljYXRlKSh2b2lkICopLCB2b2lkICphcmcsCj4KPiAgdTY0IHNiaV90aW1l
cl92YWx1ZSh2b2lkKQo+ICB7Cj4gLSAgICAgICBpZiAoZ2V0X3RpbWVfdmFsKQo+IC0gICAgICAg
ICAgICAgICByZXR1cm4gZ2V0X3RpbWVfdmFsKCk7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX3NjcmF0
Y2ggKnNjcmF0Y2ggPSBzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKTsKPiArICAgICAgIGlmIChz
YmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9aSUNOVFIpKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gZ2V0X3RpY2tzKCk7Cj4gKyAgICAgICBpZiAodGltZXJfZGV2
ICYmIHRpbWVyX2Rldi0+dGltZXJfdmFsdWUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiB0aW1l
cl9kZXYtPnRpbWVyX3ZhbHVlKCk7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gQEAgLTE4
MSw4ICsxODYsNiBAQCB2b2lkIHNiaV90aW1lcl9zZXRfZGV2aWNlKGNvbnN0IHN0cnVjdCBzYmlf
dGltZXJfZGV2aWNlICpkZXYpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+ICAgICAgICAg
dGltZXJfZGV2ID0gZGV2Owo+IC0gICAgICAgaWYgKCFnZXRfdGltZV92YWwgJiYgdGltZXJfZGV2
LT50aW1lcl92YWx1ZSkKPiAtICAgICAgICAgICAgICAgZ2V0X3RpbWVfdmFsID0gdGltZXJfZGV2
LT50aW1lcl92YWx1ZTsKPiAgfQo+Cj4gIGludCBzYmlfdGltZXJfaW5pdChzdHJ1Y3Qgc2JpX3Nj
cmF0Y2ggKnNjcmF0Y2gsIGJvb2wgY29sZF9ib290KQo+IEBAIC0xOTYsOSArMTk5LDYgQEAgaW50
IHNiaV90aW1lcl9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9vbCBjb2xkX2Jv
b3QpCj4gICAgICAgICAgICAgICAgIGlmICghdGltZV9kZWx0YV9vZmYpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07Cj4KPiAtICAgICAgICAgICAgICAgaWYgKHNi
aV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1pJQ05UUikpCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgZ2V0X3RpbWVfdmFsID0gZ2V0X3RpY2tzOwo+IC0KPiAgICAg
ICAgICAgICAgICAgcmV0ID0gc2JpX3BsYXRmb3JtX3RpbWVyX2luaXQocGxhdCk7Cj4gICAgICAg
ICAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsK
PiAtLQo+IDIuNDcuMgo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
