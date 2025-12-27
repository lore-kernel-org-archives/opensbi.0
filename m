Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8A6E8FDD5
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ms4PcdlBFH+xDxve7HjkA/rzbV4n7Rvf+lk3h8EY9xc=; b=TgVq897ig0serP
	oaI8QekCO/4KwkmipE8AIa2SLrrDKt2t8yuMwzYEUS2DWQIbvF9DqedsX4fLzQ5qw/O6TY+OInSco
	946QHRkzE+oBUmRQ1ie0NMU/Z8aJzlgk+sz4zS//QyQsmYqbBgYswes1d3l7eAHsQLnsOc3T7ohHE
	X6eOV2XPQZcnGl56lhXKaJ9EJoZXv1CAW6GK0Qh9ygLXKE+UNOjfOeXrSU+gCMDd0dFD7Ukm4jGuC
	UKF8IOzraeggZkW7DItim/3KSx1suvhP0Ohh4ojQeY1sgafrPFpBxWpdQqgnGd44AMxx+HJFJdpWJ
	YXBf9hH/C73O4VKU1IbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQIy-00000001otp-2nXB;
	Sat, 27 Dec 2025 09:09:44 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQIv-00000001ot0-0v6K
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 09:09:42 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7cae2330765so5543343a34.0
        for <opensbi@lists.infradead.org>; Sat, 27 Dec 2025 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766826580; x=1767431380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeU3K77GriJgwoN7bEVBK6lTQDYcJLQFt6v/LFTc6fQ=;
        b=Q867aih+KTlUrrp2PlW6MamBJiA96vkwMvuIaMGP5jDB755Cmxlep6pHSRYJl2nnuR
         NqFNV5W+Ci4MT1qquL3xbzw8EKBdhgAKSDJS5HQgN8BMhTk1x1UZfrtEE2iFtplCzVLC
         T9cL8Da11Rga14p6tsLaomadzepCssKaJQkQQlYPQafNqQSrIRSIwTV9cpiIgPnJK5MI
         JCaORDJE2QGUtkQggcrmwcwYwHLEKsPFoG85wlPW77Llh7eQdSDLg4cbeNlJaKC3jTYU
         jQ4pY5Z+3uVySkMgsFnGP5FtQkv/kxhg9VNW+yjaXhovtkkZKFQhKYIrUWRKaaFX8Rc1
         Atvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766826580; x=1767431380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeU3K77GriJgwoN7bEVBK6lTQDYcJLQFt6v/LFTc6fQ=;
        b=F5ygtfsAXsf3Nr1lLrEU5/8EHE62vPXGTgrrE7TlYgLKp+Brpx2TZsXzOqvZKFsLSK
         me5szRNRrG/7Q7zs5jHGR2OLRPN42SrxjP2q7uajLDoZH6NYpFhG8DAg+8v1rAn/bQXC
         mVwSSuzfaA+Pw3Pw9g1gtfdyIzRVMD9eEmmh9rhvVyrdyb/Gh3DXxhb7MzdG6scPxkK+
         8G82aLt3T+WNvxdkyThgWjDgNE2XVVEV75tj7vtggSixByFIeQbtq9leJUG5WEeX/tIB
         hdEakL0Ctbb3vnE7/Q7+Xx41vZe15fdhvX51m0Ns51Fp4DSaQ3PhPXgubCqemZmwg85U
         nXRA==
X-Gm-Message-State: AOJu0YypOPS5e6rrD6fCTypgXjrSDpKYNWzYHJf54CXZ032JB7UPdtnF
	b6GTad6yakxwzwO9RbR0nwnMthCo5jiByL4Hyei2xPXV9J5M4WvqjKJHAV4zHWrAVH6jfIWUzIb
	eNF7CUXtIF8JILpskaxznZjVXX06VJomTxjD7wY492GU+0rTY1MD0gb+ECg==
X-Gm-Gg: AY/fxX7TOokk79eW21q2LxaCAgzVLaiwF1BIkg7jwmGa6n6kh1svmvYsm8npXtk5zyn
	ky9kCT5YBo2pbXJkLoZGMzKx49uaVor4hWCk3lJmVTuWDlPp+rF9uhb7V32EezSqv7TCpBwb6eP
	9eLf7Lamgzsq52WDBHNRaTSIy+nIw+kiXYUjqxNeszoLd8h28Vy2RlxEuVE66cdfv7occ+a17yC
	xPO47czWzkrczJxbUVgKhX/CvgSV8b0uTpvg++7moDXaHjSdvPDJmKV/6dBuzhRMYSQxNBntJo1
	XaAwm4A2w9roRMBZs5qA04/z8sJGFVzw6+HbIFKXagyNvDn4/y1UKOTwag==
X-Google-Smtp-Source: AGHT+IGXrK32uXTvhQh1qd38dzh88jl2Ut4S0FL6GGmYF1SK2GsF/QANkvA78LDyyCVkOUutRyEBGzBwi/JDLCWyEWk=
X-Received: by 2002:a4a:c90c:0:b0:65d:1636:5439 with SMTP id
 006d021491bc7-65d16365bc8mr7489527eaf.40.1766826579949; Sat, 27 Dec 2025
 01:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20251216052528.18896-1-ganboing@gmail.com>
In-Reply-To: <20251216052528.18896-1-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 27 Dec 2025 14:39:28 +0530
X-Gm-Features: AQt7F2pSSnP3zwRCqXWMsmmb7ip0tjqFv-0kX75pi7qjAcQSYQZOKkHjdBNs_Co
Message-ID: <CAAhSdy1Rrj85RAms7_wHw72WSoefpuERY8t+cZLmKWHY3QTxaQ@mail.gmail.com>
Subject: Re: [PATCH] include: riscv_asm: Optimize csr_xyz() macros to reduce
 stack usage
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_010941_522548_81F920EB 
X-CRM114-Status: GOOD (  15.53  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTA6NTfigK9BTSBCbyBHYW4gPGdhbmJvaW5nQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHVzaW5nIGRlYnVnIGJ1aWxkcywgYWthLiwgREVCVUc9MSwg
Y3NyX3dyaXRlX251bSgpIGZ1bmN0aW9uIGNhbgo+IHRyaWdnZXIgc3RhY2sgb3ZlcmZsb3cuIFRo
aXMgaXMgY2F1c2VkIGJ5IHRoZSBsYXJnZSBhbW91bnQgb2YgbWFjcm8KPiBleHBhbnNpb24gb2Yg
Y3NyX3dyaXRlKC4uLiksIHdoaWNoLCB1bmRlciBkZWJ1ZyBidWlsZHMsIHdpbGwgZ2VuZXJhdGUK
PiBtYXNzaXZlIGFtb3VudCBvZiBzdGFjayB2YXJpYWJsZXMgKHRlc3RlZCB3aXRoIEdDQyAxMy4y
LjApLiBUaGUgaXNzdWUKPiBpcyBtYXNrZWQgcHJldmlvdXNseSBhcyB3ZSBkaWRuJ3QgaGF2ZSB0
b28gbWFueSBjc3Jfd3JpdGUoKSdzIGJlZm9yZQo+IGNvbW1pdCA1NTI5NmZkMjdjMGMsIGJ1dCBu
b3csIGl0IGRvZXMgb3ZlcmZsb3cgdGhlIGRlZmF1bHQgNEtCIHN0YWNrLgo+Cj4gVGhlIGNzcl9y
ZWFkKHJlbGF4ZWQpIG1hY3JvcyBhbHJlYWR5IHVzZSB0aGUgInJlZ2lzdGVyIiBtb2RpZmllciB0
bwo+IG9wdGltaXplIHN0YWNrIHVzYWdlIChwZXJoYXBzIHVua25vd2luZ2x5PyksIHNvIHRoaXMg
cGF0Y2gganVzdAo+IGZvbGxvd3Mgc3VpdC4KPgo+IEZpeGVzOiA1NTI5NmZkMjdjMGMgKCJsaWI6
IEFsbG93IGN1c3RvbSBDU1JzIGluIGNzcl9yZWFkX251bSgpIGFuZCBjc3Jfd3JpdGVfbnVtKCki
KQo+IFNpZ25lZC1vZmYtYnk6IEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwuY29tPgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlz
IHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IGluY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oIHwgMTIgKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9zYmkvcmlzY3ZfYXNtLmggYi9pbmNsdWRlL3NiaS9yaXNjdl9hc20uaAo+IGluZGV4IGVm
NDhkYzg5Li4wY2YzZmMzNyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9yaXNjdl9hc20uaAo+
ICsrKyBiL2luY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oCj4gQEAgLTgzLDcgKzgzLDcgQEAKPgo+ICAj
ZGVmaW5lIGNzcl9zd2FwKGNzciwgdmFsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gICAgICAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIF9fdiA9ICh1bnNpZ25lZCBsb25nKSh2YWwpOyAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgICAgICAgICAgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBfX3YgPSAodW5zaWduZWQgbG9u
ZykodmFsKTsgICAgICBcCj4gICAgICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fKCJj
c3JydyAlMCwgIiBfX0FTTV9TVFIoY3NyKSAiLCAlMSIgXAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6ICI9ciIoX192KSAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAicksiKF9fdikgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gQEAgLTExMSw3ICsxMTEsNyBAQAo+Cj4gICNkZWZpbmUgY3NyX3dy
aXRlKGNzciwgdmFsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
ICAgICAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBfX3YgPSAodW5zaWdu
ZWQgbG9uZykodmFsKTsgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICByZWdpc3RlciB1bnNp
Z25lZCBsb25nIF9fdiA9ICh1bnNpZ25lZCBsb25nKSh2YWwpOyBcCj4gICAgICAgICAgICAgICAg
IF9fYXNtX18gX192b2xhdGlsZV9fKCJjc3J3ICIgX19BU01fU1RSKGNzcikgIiwgJTAiIFwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICJySyIo
X192KSAgICAgICAgICAgICAgICAgICBcCj4gQEAgLTEyMCw3ICsxMjAsNyBAQAo+Cj4gICNkZWZp
bmUgY3NyX3JlYWRfc2V0KGNzciwgdmFsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgICAgICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgX192ID0gKHVuc2lnbmVkIGxvbmcpKHZhbCk7ICAgICAgICAgICAgICAgXAo+ICsgICAg
ICAgICAgICAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIF9fdiA9ICh1bnNpZ25lZCBsb25nKSh2
YWwpOyAgICAgIFwKPiAgICAgICAgICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18oImNzcnJz
ICUwLCAiIF9fQVNNX1NUUihjc3IpICIsICUxIiBcCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDogIj1yIihfX3YpICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICJySyIoX192KSAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiBAQCAtMTMwLDcgKzEzMCw3IEBACj4KPiAgI2RlZmluZSBjc3Jfc2V0KGNz
ciwgdmFsKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAg
ICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+IC0gICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIF9fdiA9ICh1bnNpZ25lZCBs
b25nKSh2YWwpOyAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIHJlZ2lzdGVyIHVuc2lnbmVk
IGxvbmcgX192ID0gKHVuc2lnbmVkIGxvbmcpKHZhbCk7IFwKPiAgICAgICAgICAgICAgICAgX19h
c21fXyBfX3ZvbGF0aWxlX18oImNzcnMgIiBfX0FTTV9TVFIoY3NyKSAiLCAlMCIgXAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogInJLIihfX3Yp
ICAgICAgICAgICAgICAgICAgIFwKPiBAQCAtMTM5LDcgKzEzOSw3IEBACj4KPiAgI2RlZmluZSBj
c3JfcmVhZF9jbGVhcihjc3IsIHZhbCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICAgICAgICAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBfX3YgPSAodW5zaWduZWQgbG9uZykodmFsKTsgICAgICAgICAgICAgICBcCj4gKyAgICAgICAg
ICAgICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgX192ID0gKHVuc2lnbmVkIGxvbmcpKHZhbCk7
ICAgICAgXAo+ICAgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygiY3NycmMgJTAs
ICIgX19BU01fU1RSKGNzcikgIiwgJTEiIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgOiAiPXIiKF9fdikgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogInJLIihfX3YpICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+IEBAIC0xNDksNyArMTQ5LDcgQEAKPgo+ICAjZGVmaW5lIGNzcl9jbGVhcihjc3Is
IHZhbCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAg
KHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gLSAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgX192ID0gKHVuc2lnbmVkIGxvbmcp
KHZhbCk7ICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgcmVnaXN0ZXIgdW5zaWduZWQgbG9u
ZyBfX3YgPSAodW5zaWduZWQgbG9uZykodmFsKTsgXAo+ICAgICAgICAgICAgICAgICBfX2FzbV9f
IF9fdm9sYXRpbGVfXygiY3NyYyAiIF9fQVNNX1NUUihjc3IpICIsICUwIiBcCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAicksiKF9fdikgICAg
ICAgICAgICAgICAgICAgXAo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5n
IGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
