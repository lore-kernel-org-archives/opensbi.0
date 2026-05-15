Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BFFCD4851
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 07:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZvlOQtNBi0PV8v5/zb7vOE5jNh8Th1rwtPMmseaxmQ=; b=jFoiyY6aLdNMe3
	xlkRm8kDOpH28KxBEseB4jC+eVBvAbvJTkWFYuYays141M1WqluILcg+l7N9WsVQxESCZkIkCML80
	eUNZrk46vtflwjJIL3axxYXCZ1RjbpVj2PAGtPeNb0fuz290DJOqWCRSajbZIlk1Jj3Cp9A6jy1f2
	7P8IY0jHJO/J7CAKQwyBDQF43jxcSgm/sGtGR5GUWA0/daa0XBHid19fTOU/xdfWDWsjVNWGmSOYr
	pm1MCwjXPEBhMAEEbUc2vyobUlE3hBnoesvLZV8X1WZShfd3+UCECRZKGa9Ni2V37d2125JyZYfML
	QskXZ3aHBM468F1XAPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnEJ-00000007eVO-3g7W;
	Fri, 15 May 2026 07:45:07 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnEF-00000007eTv-0emE
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 07:45:04 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso799798a34.0
        for <opensbi@lists.infradead.org>; Fri, 15 May 2026 00:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778831102; cv=none;
        d=google.com; s=arc-20240605;
        b=K1z+K3CrlYzG2/9KE0WRX69OPTCKiTN86A3Cz8Zq2ebTiGZiR3Wnv6TpJ9WNgOM5J0
         q/n7yahoNHQFIaojYJI5F5iolJj5pawRm9hvwZr2HAWaz74LFwUJPjFP7HrZIh80ux4k
         NHQbMrgwp108mMEn5K97XYTo6rRkjRKvUxF/q/8qXclyzaC3kBZxKCW0pOAJNRE6HQ0T
         uteH8ZNifqonpWMkZCESMUbFkbzV2xjGr8cqCCRZBXii8cENP2dYj26WpBXHcY5knyGr
         4lC7R6IZi4gQ2wOfmpcaTopdKW+8kl3It5ZoPUle5TR+F3D0ApuXOyGH3E3DnSQITl1+
         G+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xiEelxqGW+pUiFEhh6sGRIDOUpg6J24/kpgGUtuazm4=;
        fh=OCiKmVyjmrrSNe9LoN8bacYD+traOCYA/VwWq3YPSNM=;
        b=WJ7sRzBHR61MCiPmXrrpLw+q7fMC2M+9qsf8irJePRKMMxIAfGkOFAbPW2s1V512pf
         bOpl8NNZYdpWizu/pQmlI96WuTknnQ6CQAdZNh+NkoAzhiYHgENJ8W7D3pIrRRQsD0+j
         RVPa0Nh5uguW+PuB7SdAhHr5VWZdWEKFzLsWAeSy7oLS0elqmX9f4jtVFB8EYxnGmcFc
         fVF7+ESS6YLjGGFQfE9Ab0bRue7Ic2FUzZN/8kcTGHSNjqaxRFwcALjsuxIvkA3iEEJq
         gwjVfnOnM2kQosqjOCwMRVonIqANRIbLQO98aoMbb5dTW68VdC7QDzlqPJ23RzF/6HTA
         Mv/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778831102; x=1779435902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiEelxqGW+pUiFEhh6sGRIDOUpg6J24/kpgGUtuazm4=;
        b=HHV4zyOaXRb+3GCpxXgOaw3jy3aW86lPhR4ShenxLkHLzZTToy/hrO4k8OYm5XNBFD
         ishS++Ye8R6hqt2mnXkX8neOa4K16e8Bv4o0ppHjkNxraVyfZTaDw7A9j5oLt+qN8jIv
         A1VumHbe/IY6m/Pg8RqNITlBzTXeWgdHAKlshV/8EiOxiQl5QT1E1ZSYPoHBDN3xq3LZ
         TOqXoezV3z+WAhHFKpM/y1gpEpS0bjp0wbFG9RrJkkdrJqchiZ7PqdBLF6nkFG89x4tl
         LH2ugv3x4vpKvHLt5+WOyfMUQvG5VvN5zV4qb5vYSf+Jk+YT6GtJJpJRCVizyDQs4Y6n
         T8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831102; x=1779435902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiEelxqGW+pUiFEhh6sGRIDOUpg6J24/kpgGUtuazm4=;
        b=MLEOf1RfwjO0n+Dzm6+b+n9V3/ODcRV2RnvmvGGReUoZVMyyTg5AGwkwyvEhBKt1u8
         q4cjH/F/kxtuKiig9RqPBGfgOTWG0ZEV3UwmvfzoL16XV1qb09KWRnJ8InSTvNOZ6yok
         mUQlvRYZKTrVfNRuJRpRlul6oksl8uOW79kWo4924E+w1uvztm0u0y0E8IdXnqBDwl14
         0BTpqm2wnPPElT3UszDA7+bsNqudPt/S+m6TpzddbX8x//+/HQp0dmQR/LVt71KqPdgU
         ZKuVHEPXVyq73uwalO6FAAToYbY/5LYguwd48JUSU/BHPBhMn9DtJVny9LVBNH2pNu8f
         wKNw==
X-Forwarded-Encrypted: i=1; AFNElJ/pDz95Su6yVB0lICboWjqzvtpqFqAIwd1x64hPYczbyA2EgmoWT1A0YtLLi2rGrvC3SZC/q/km@lists.infradead.org
X-Gm-Message-State: AOJu0YytSh0xO8uMNSIZxI8qY0D59FXc7iWVWFeafpCttf6ky4WwECp1
	dQx7eloqI6kgWjEvXe9Nb3+4jnbNvsEvPD6eHK4eRdcWk9D1O1zvyqxCOUaI/8sj5xg/TS0G4gW
	Ullh4yCir0tnOfN6hNNjSKs8/oWmx54x/L7HYEm/IGg==
X-Gm-Gg: Acq92OER8IWqvarfbaZbz0XA31QviW+CBdMcgdYsXGpSS2cjkyVJ1JV9N1fYOSaE9x0
	tN99hr/Zi2lV5JxVKccKRXawGqxlmwn7/hUdJ2R+lm2kLwIAOVHWr3Vo1ajtz5KvsTjFN4IEr6J
	kgv4jBjHbCT6Cxn1cV8JDlcdB7qlrLo88295GLP7AA6a8yC/MqvWgC5q0iWE9MRr+WCa9lwZytB
	1KJcUcEU9ISofQY0qSj9cCrKdk284iQ66Bfk2h2OZ7KagqleVhy6BNeL5gx0Fvm+BkYNNbkExk8
	z+F2eI/h7TtevOHqwLBk3dRmt6Ry9pvcam+p5S1iXQIkhMwN+q2gK6QfDscIxco0pve0lVZAYmX
	Ki54vj0/LXPqWxuwFIPqdPb0+kEo=
X-Received: by 2002:a05:6820:5544:b0:694:93fc:9a0b with SMTP id
 006d021491bc7-69b8829a79dmr2414117eaf.27.1778831102000; Fri, 15 May 2026
 00:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260515054208.151045-1-dave.patel@riscstar.com> <20260515054208.151045-5-dave.patel@riscstar.com>
In-Reply-To: <20260515054208.151045-5-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 13:14:50 +0530
X-Gm-Features: AVHnY4KqQp8QRTc-wNksJCVGvlPKbF-HlYBGdS6HZxPFdRvEPVwqTjUmo45ALX8
Message-ID: <CAAhSdy1Z+3P81wT7XzUkBtMuXJieQbdi3s+p9uNNddWUGmqJPg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] lib: sbi: Conditionalize FP and Vector
 save/restore based on extensions
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_004503_219628_A31F7A52 
X-CRM114-Status: GOOD (  24.44  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBVbmNvbmRpdGlvbmFsIHNhdmUgYW5kIHJlc3RvcmUgb2YgZmxvYXRpbmctcG9pbnQgKEZQ
KSBhbmQgVmVjdG9yCj4gcmVnaXN0ZXJzIGZhaWxzIG9uIGdlbmVyaWMgcGxhdGZvcm0gZmlybXdh
cmUuIFRoaXMgZmlybXdhcmUgbXVzdCBydW4KPiBvbiBtdWx0aXBsZSBwbGF0Zm9ybXMgdGhhdCBt
YXkgbGFjayB0aGVzZSBleHRlbnNpb25zLgo+Cj4gQWRkcmVzcyB0aGlzIGJ5IGNvbmRpdGlvbmFs
bHkgZXhlY3V0aW5nIEZQIHNhdmUvcmVzdG9yZSBvbmx5IGlmIHRoZQo+IHVuZGVybHlpbmcgaGFy
dCBzdXBwb3J0cyB0aGUgRiBvciBEIGV4dGVuc2lvbnMuIFNpbWlsYXJseSwgcGVyZm9ybQo+IFZl
Y3RvciBzYXZlL3Jlc3RvcmUgb25seSBpZiB0aGUgaGFydCBzdXBwb3J0cyB0aGUgVmVjdG9yIGV4
dGVuc2lvbi4KPgo+IERlcGVuZCBvbiBhIHNlcGFyYXRlIHBhdGNoIHRoYXQgaW50cm9kdWNlcyBT
QklfSEFSVF9FWFRfRiwKPiBTQklfSEFSVF9FWFRfRCwgYW5kIFNCSV9IQVJUX0VYVF9WIHRvIGVu
dW0gc2JpX2hhcnRfZXh0ZW5zaW9ucyBhbmQKPiB0aGUgc2JpX2hhcnRfZXh0W10gYXJyYXkuIFVz
ZSBzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKCkgdG8gY2hlY2sgZm9yCj4gdGhlc2UgY2FwYWJpbGl0
aWVzIGJlZm9yZSBwZXJmb3JtaW5nIHRoZSBjb250ZXh0IHN3aXRjaGVzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGluY2x1
ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgfCAgNiArKysrKysKPiAgbGliL3NiaS9zYmlfZG9tYWlu
X2NvbnRleHQuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgbGliL3Ni
aS9zYmlfaGFydC5jICAgICAgICAgICB8ICA0ICsrKysKClRoaXMgcGF0Y2ggc2hvdWxkIGJlIGJl
Zm9yZSBQQVRDSDMgYW5kIHRoZSBzYmlfZG9tYWluX2NvbnRleHQuYwpjaGFuZ2VzIGluIHRoaXMg
cGF0Y2ggbXVzdCBiZSBwYXJ0IG9mIFBBVENIMy4KCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9z
YmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IGluZGV4IGE3ODhiMzRjLi42OGEw
MWI5NyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gKysrIGIvaW5jbHVk
ZS9zYmkvc2JpX2hhcnQuaAo+IEBAIC04Nyw2ICs4NywxMiBAQCBlbnVtIHNiaV9oYXJ0X2V4dGVu
c2lvbnMgewo+ICAgICAgICAgU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0ZMVVNIX0RfTDEsCj4gICAg
ICAgICAvKiogSGFydCBoYXMgWHNmY2Vhc2UgZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFS
VF9FWFRfWFNJRklWRV9DRUFTRSwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBWIGV4dGVuc2lvbiAq
Lwo+ICsgICAgICAgU0JJX0hBUlRfRVhUX1YsCj4gKyAgICAgICAvKiogSGFydCBoYXMgRiBleHRl
bnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9GLAo+ICsgICAgICAgLyoqIEhhcnQgaGFz
IEQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfRCwKPgo+ICAgICAgICAgLyoq
IE1heGltdW0gaW5kZXggb2YgSGFydCBleHRlbnNpb24gKi8KPiAgICAgICAgIFNCSV9IQVJUX0VY
VF9NQVgsCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgYi9saWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4gaW5kZXggNWUxODA2OTguLjFlM2NhNDZkIDEwMDY0
NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiArKysgYi9saWIvc2JpL3Ni
aV9kb21haW5fY29udGV4dC5jCj4gQEAgLTE1NSwxMCArMTU1LDIwIEBAIHN0YXRpYyBpbnQgc3dp
dGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoc3RydWN0IGhhcnRfY29udGV4dCAqY3R4LAo+ICAg
ICAgICAgY3NyX3NldChDU1JfTVNUQVRVUywgTVNUQVRVU19GUyB8IE1TVEFUVVNfVlMpOwo+Cj4g
ICAgICAgICAvKiBFYWdlciBjb250ZXh0IHN3aXRjaCBGIGFuZCBWICovCj4gLSAgICAgICBzYmlf
ZnBfc2F2ZSgmY3R4LT5mcF9jdHgpOwo+IC0gICAgICAgc2JpX2ZwX3Jlc3RvcmUoJmRvbV9jdHgt
PmZwX2N0eCk7Cj4gLSAgICAgICBzYmlfdmVjdG9yX3NhdmUoY3R4LT52ZWNfY3R4KTsKPiAtICAg
ICAgIHNiaV92ZWN0b3JfcmVzdG9yZShkb21fY3R4LT52ZWNfY3R4KTsKPiArCj4gKyAgICAgICBp
ZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKSwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9GKSB8fAo+ICsg
ICAgICAgICAgIHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRy
KCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9FWFRfRCkp
IHsKPiArICAgICAgICAgICAgICAgc2JpX2ZwX3NhdmUoJmN0eC0+ZnBfY3R4KTsKPiArICAgICAg
ICAgICAgICAgc2JpX2ZwX3Jlc3RvcmUoJmRvbV9jdHgtPmZwX2N0eCk7Cj4gKyAgICAgICB9Cj4g
Kwo+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hh
cnRfcHRyKCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9F
WFRfVikpIHsKPiArICAgICAgICAgICAgICAgc2JpX3ZlY3Rvcl9zYXZlKGN0eC0+dmVjX2N0eCk7
Cj4gKyAgICAgICAgICAgICAgIHNiaV92ZWN0b3JfcmVzdG9yZShkb21fY3R4LT52ZWNfY3R4KTsK
PiArICAgICAgIH0KPgo+ICAgICAgICAgLyogU2F2ZSBjdXJyZW50IHRyYXAgc3RhdGUgYW5kIHJl
c3RvcmUgdGFyZ2V0IGRvbWFpbidzIHRyYXAgc3RhdGUgKi8KPiAgICAgICAgIHRyYXBfY3R4ID0g
c2JpX3RyYXBfZ2V0X2NvbnRleHQoc2NyYXRjaCk7Cj4gQEAgLTIwMSwxMSArMjExLDE0IEBAIHN0
YXRpYyBpbnQgaGFydF9jb250ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPiAgICAgICAgICAgICAg
ICAgaWYgKCFjdHgpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07
Cj4KPiAtICAgICAgICAgICAgICAgLyogQWxsb2NhdGUgdGhlIHZlY3RvciBjb250ZXh0IHBvaW50
ZXIgKi8KPiAtICAgICAgICAgICAgICAgY3R4LT52ZWNfY3R4ID0gc2JpX3phbGxvYyh2ZWNfc2l6
ZSk7Cj4gLSAgICAgICAgICAgICAgIGlmICghY3R4LT52ZWNfY3R4KSB7Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgc2JpX2ZyZWUoY3R4KTsKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VOT01FTTsKPiArICAgICAgICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNp
b24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9WICkpIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAvKiBBbGxvY2F0ZSB0aGUgdmVjdG9yIGNvbnRleHQgcG9pbnRlciAqLwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGN0eC0+dmVjX2N0eCA9IHNiaV96YWxsb2ModmVjX3NpemUpOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghY3R4LT52ZWNfY3R4KSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzYmlfZnJlZShjdHgpOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgfQo+ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgLyogQmluZCBjb250
ZXh0IGFuZCBkb21haW4gKi8KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGli
L3NiaS9zYmlfaGFydC5jCj4gaW5kZXggNjBlOTViY2EuLmU3NTgxMzY4IDEwMDY0NAo+IC0tLSBh
L2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC0zOTYs
NiArMzk2LDEwIEBAIGNvbnN0IHN0cnVjdCBzYmlfaGFydF9leHRfZGF0YSBzYmlfaGFydF9leHRb
XSA9IHsKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3NzdGF0ZWVuLCBTQklfSEFSVF9F
WFRfU1NTVEFURUVOKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoeHNmY2ZsdXNoZGxv
bmUsIFNCSV9IQVJUX0VYVF9YU0lGSVZFX0NGTFVTSF9EX0wxKSwKPiAgICAgICAgIF9fU0JJX0hB
UlRfRVhUX0RBVEEoeHNmY2Vhc2UsIFNCSV9IQVJUX0VYVF9YU0lGSVZFX0NFQVNFKSwKPiArICAg
ICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEodiwgU0JJX0hBUlRfRVhUX1YpLAo+ICsgICAgICAgX19T
QklfSEFSVF9FWFRfREFUQShmLCBTQklfSEFSVF9FWFRfRiksCj4gKyAgICAgICBfX1NCSV9IQVJU
X0VYVF9EQVRBKGQsIFNCSV9IQVJUX0VYVF9EKSwKPiArCj4gIH07Cj4KPiAgX1N0YXRpY19hc3Nl
cnQoU0JJX0hBUlRfRVhUX01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0X2V4dCksCj4gLS0KPiAy
LjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
