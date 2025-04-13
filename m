Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC80C369B1
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9vWby7+qvtqLKW6Cm5wKFtJlHAQKWFD8+NgbxUGUIQ=; b=gFk+jSDczMPPMi
	1P8b6e/vHRYzF9/zqJDR8jOmh4SWD50wsGVzWnuTCiq2ZsH9JBvotEsvT1jYJTmXBgfk096GVXSOj
	+mJux0Wqvhmb+4SFuaHu914EnNVX7mZ58js7hW3f0bG0so32f6UIFh162Yya4SJ295hHOUJdcJg2k
	KKrfZbS9NngPHCP9UoEl6LFbhui09lBV1YIbQBQci5xNaX25Ena2/+O+abW4KhZhsvXwfwb9EiN7w
	6BO+7RqeYRoDZxALPFJz7pOlPkweCRaNtMdNuAM1LM4UjidSkFm6UTSfkSRHUDq2DQ8YRcaOEkeoz
	6H1lbViIqXSSprQcB/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u403j-0000000HMlp-2a74;
	Sun, 13 Apr 2025 16:19:51 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u403g-0000000HMkg-2oH8
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 16:19:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-549967c72bcso4687549e87.3
        for <opensbi@lists.infradead.org>; Sun, 13 Apr 2025 09:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744561186; x=1745165986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrD9fLjwuE6HcX1jzYukI3Hr90PnwfL3ZZXS1E1XVq0=;
        b=LYUg3jqsw7WtSg8dmr4zopoPDTXU98PgFwfdhzkVqlFfrl0fh24jlBARTdWV0DQ1Jw
         EK9uvpj1a6OKSsyHNM4aDIGeecLA10EqEjEqBRBl/YTdbIfEhRpP2AKG1q3ceaIhQbmW
         W8QunxKyrYk3wOK0MyF+4N8eVN6O3Ya/w3kODtVCXRtKVwXryj5RXIPLE7kzgUYD/eyA
         TYRYhPr0+9VZWXVQfkxp7+BZtOtNDgFIkO6pEZyO9+DTJBUchOvxZ5XlqMoV+SYVSyIV
         xxhHGIa4iclDLdmWRznTm+RdtfyoWfiEvtSPWWy72SGjony+Zcpbkz4VIJMrXmc3zq5x
         gRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561186; x=1745165986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrD9fLjwuE6HcX1jzYukI3Hr90PnwfL3ZZXS1E1XVq0=;
        b=DSlvXyuqcd9eoIpfet0lUH9pIqgBF1PW1PEvXmBoI2w/zOfeBKG7Xh9vGz1BVODw3m
         VLJgpRaNKM+7I2rLZLj6DYagjdA++tJqK7dRgnDLleKj4WfYkGRzw4rls/sqHAMDhfdJ
         LqsoS1U54LLB7iMa8C6mAA6KlTJAymN8/wKzQSccyUuG5ImdZYnYP7Roy1MJQvRxAaoN
         u5bKn81u+CnjoqAU3EvDWX20BbJx+qJ/7hzkPPTxYM6UPyMVuUUVkkZDhem75UDieHJA
         amK6zMopilui/YNMTPD/gqpI2qGPICqz9N35KFrvq7sWL9Mmu+ypthcnx2j/9r9YhWnm
         bzlw==
X-Gm-Message-State: AOJu0YyT/67NcRkAVacEOKf06iauOyg5jr0XKFsUg0K4t7kSncgM9y+y
	5c5wQYQ/xqiUEX0h1Cr5liE+6me03MVOMrgQ8zb4/ATkzPzCKo7gOjE4qN78/PRfQSb3G7BhqVI
	BW6hruddiq0GJWpz/ZU8Z5tFPH6p0pnNGXDlkJjDX9ets8iEJp8nXPw==
X-Gm-Gg: ASbGncvMVXui1e+IRoJ+RmyjmY0ripYabcqSDpBWtH7aX8mTHej82R08SRd6MUgf8vA
	QwJuK70DLhVaGx6io47dB1UtQ3219z501f2t494lpIRpYF/77R39ouATbWPYkFNPhttSphn3xrZ
	H4PSr8KipOxEwWhGjbte/uMVg=
X-Google-Smtp-Source: AGHT+IEswhOjFaQKhliqqId/fjP9ikdFHCWMNWCE+FpJgQXI0aSRfL5eWFF9JWAUFXSzrQAs5/fwF/gvx3pY4LOfFFI=
X-Received: by 2002:ac2:4e01:0:b0:549:7d70:52a9 with SMTP id
 2adb3069b0e04-54d452d7e3emr2709458e87.47.1744561185955; Sun, 13 Apr 2025
 09:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250313035755.3796610-1-samuel.holland@sifive.com>
In-Reply-To: <20250313035755.3796610-1-samuel.holland@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 13 Apr 2025 21:49:35 +0530
X-Gm-Features: ATxdqUFz2CIR_yXaYfQsqPnwVoVislArV1JWYNyxyGXHqXaKW75Gt5gkTYjA8_E
Message-ID: <CAK9=C2VSG_70WrdU7mTJXSnQgM8ZmD0qLYfisYtFuCE8dqaC5g@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Avoid repeated evaluation of shell commands
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_091948_710921_76B56642 
X-CRM114-Status: GOOD (  17.68  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgOToyOOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFJlY3Vyc2l2ZWx5IGV4cGFuZGVkIHZhcmlh
YmxlcyAoZGVmaW5lZCB3aXRoICc9JykgYXJlIGV4cGFuZGVkIGF0Cj4gZXZhbHVhdGlvbiB0aW1l
LiBUaGVzZSB2ZXJzaW9uIGluZm9ybWF0aW9uIHZhcmlhYmxlcyBhcmUgZXZhbHVhdGVkCj4gaW5z
aWRlIGEgcmVjaXBlIGFzIHBhcnQgb2YgR0VORkxBR1MuIEFzIGEgcmVzdWx0LCB0aGUgc2hlbGwg
Y29tbWFuZHMKPiBhcmUgZXhlY3V0ZWQgc2VwYXJhdGVseSBmb3IgZWFjaCBjb21waWxlciBpbnZv
Y2F0aW9uLiBDb252ZXJ0IHRoZQo+IHZlcnNpb24gaW5mb3JtYXRpb24gdmFyaWFibGVzIHRvIGJl
IHNpbXBseSBleHBhbmRlZCwgc28gdGhlIHNoZWxsCj4gY29tbWFuZHMgYXJlIGV4ZWN1dGVkIG9u
bHkgb25jZSwgYXQgTWFrZWZpbGUgZXZhbHVhdGlvbiB0aW1lLiBUaGlzCj4gc3BlZWRzIHVwIHRo
ZSBidWlsZCBieSBhcyBtdWNoIGFzIDc1JS4KPgo+IEEgc2VwYXJhdGUgY2hlY2sgaXMgbmVlZGVk
IHRvIG1haW50YWluIHRoZSBiZWhhdmlvciBvZiBwcmVmZXJyaW5nIHRoZQo+IHZhbHVlIG9mIE9Q
RU5TQklfQlVJTERfVElNRV9TVEFNUCBmcm9tIHRoZSBlbnZpcm9ubWVudC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKTEdUTS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0
aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0t
Cj4KPiAgTWFrZWZpbGUgfCAxNCArKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIv
TWFrZWZpbGUKPiBpbmRleCA0MTljZTY2Yi4uYzFhMTMwMzcgMTAwNjQ0Cj4gLS0tIGEvTWFrZWZp
bGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC05NCwxMSArOTQsMTEgQEAgT1BFTlNCSV9WRVJTSU9O
X01JTk9SPWBncmVwICJkZWZpbmUgT1BFTlNCSV9WRVJTSU9OX01JTk9SIiAkKGluY2x1ZGVfZGly
KS9zYmkvc2IKPiAgT1BFTlNCSV9WRVJTSU9OX0dJVD0KPgo+ICAjIERldGVjdCAnZ2l0JyBwcmVz
ZW5jZSBiZWZvcmUgaXNzdWluZyAnZ2l0JyBjb21tYW5kcwo+IC1HSVRfQVZBSUw9JChzaGVsbCBj
b21tYW5kIC12IGdpdCAyPiAvZGV2L251bGwpCj4gK0dJVF9BVkFJTCA6PSAkKHNoZWxsIGNvbW1h
bmQgLXYgZ2l0IDI+IC9kZXYvbnVsbCkKPiAgaWZuZXEgKCQoR0lUX0FWQUlMKSwpCj4gLUdJVF9E
SVI9JChzaGVsbCBnaXQgcmV2LXBhcnNlIC0tZ2l0LWRpciAyPiAvZGV2L251bGwpCj4gK0dJVF9E
SVIgOj0gJChzaGVsbCBnaXQgcmV2LXBhcnNlIC0tZ2l0LWRpciAyPiAvZGV2L251bGwpCj4gIGlm
bmVxICgkKEdJVF9ESVIpLCkKPiAtT1BFTlNCSV9WRVJTSU9OX0dJVD0kKHNoZWxsIGlmIFsgLWQg
JChHSVRfRElSKSBdOyB0aGVuIGdpdCBkZXNjcmliZSAyPiAvZGV2L251bGw7IGZpKQo+ICtPUEVO
U0JJX1ZFUlNJT05fR0lUIDo9ICQoc2hlbGwgaWYgWyAtZCAkKEdJVF9ESVIpIF07IHRoZW4gZ2l0
IGRlc2NyaWJlIDI+IC9kZXYvbnVsbDsgZmkpCj4gIGVuZGlmCj4gIGVuZGlmCj4KPiBAQCAtMjAy
LDE2ICsyMDIsMTggQEAgZW5kaWYKPiAgQlVJTERfSU5GTyA/PSBuCj4gIGlmZXEgKCQoQlVJTERf
SU5GTykseSkKPiAgT1BFTlNCSV9CVUlMRF9EQVRFX0ZNVCA9ICslWS0lbS0lZCAlSDolTTolUyAl
ego+ICtpZm5kZWYgT1BFTlNCSV9CVUlMRF9USU1FX1NUQU1QCj4gIGlmZGVmIFNPVVJDRV9EQVRF
X0VQT0NICj4gLSAgICAgICBPUEVOU0JJX0JVSUxEX1RJTUVfU1RBTVAgPz0gJChzaGVsbCBkYXRl
IC11IC1kICJAJChTT1VSQ0VfREFURV9FUE9DSCkiIFwKPiArICAgICAgIE9QRU5TQklfQlVJTERf
VElNRV9TVEFNUCA6PSAkKHNoZWxsIGRhdGUgLXUgLWQgIkAkKFNPVVJDRV9EQVRFX0VQT0NIKSIg
XAo+ICAgICAgICAgICAgICAgICAiJChPUEVOU0JJX0JVSUxEX0RBVEVfRk1UKSIgMj4vZGV2L251
bGwgfHwgXAo+ICAgICAgICAgICAgICAgICBkYXRlIC11IC1yICIkKFNPVVJDRV9EQVRFX0VQT0NI
KSIgXAo+ICAgICAgICAgICAgICAgICAiJChPUEVOU0JJX0JVSUxEX0RBVEVfRk1UKSIgMj4vZGV2
L251bGwgfHwgXAo+ICAgICAgICAgICAgICAgICBkYXRlIC11ICIkKE9QRU5TQklfQlVJTERfREFU
RV9GTVQpIikKPiAgZWxzZQo+IC0gICAgICAgT1BFTlNCSV9CVUlMRF9USU1FX1NUQU1QID89ICQo
c2hlbGwgZGF0ZSAiJChPUEVOU0JJX0JVSUxEX0RBVEVfRk1UKSIpCj4gKyAgICAgICBPUEVOU0JJ
X0JVSUxEX1RJTUVfU1RBTVAgOj0gJChzaGVsbCBkYXRlICIkKE9QRU5TQklfQlVJTERfREFURV9G
TVQpIikKPiAgZW5kaWYKPiAtT1BFTlNCSV9CVUlMRF9DT01QSUxFUl9WRVJTSU9OPSQoc2hlbGwg
JChDQykgLXYgMj4mMSB8IGdyZXAgJyB2ZXJzaW9uICcgfCBcCj4gK2VuZGlmCj4gK09QRU5TQklf
QlVJTERfQ09NUElMRVJfVkVSU0lPTiA6PSAkKHNoZWxsICQoQ0MpIC12IDI+JjEgfCBncmVwICcg
dmVyc2lvbiAnIHwgXAo+ICAgICAgICAgc2VkICdzL1tbOnNwYWNlOl1dKiQkLy8nKQo+ICBlbmRp
Zgo+Cj4gLS0KPiAyLjQ3LjIKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
