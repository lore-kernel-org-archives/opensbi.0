Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EFDC369D5
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwdpRTEGFB7LlYwXT/Y3CLrKnkxpUzObdrERmW1IwCQ=; b=fVyM2CbNu5C+VC
	ItqY4ad69ZwWZGCR8LK8GHO0lG/DYInJ4ugl0HjMdAxCs68KnLJFSzVXddm8OqGaMWxeoM9/Oiwx4
	Q6bQae8V0Kilk4XCEurB1wm0piP072paCGqAFdthZWuJhcECnufarb+qpqtt+QLnR5aPTDN0RFyFp
	UUVTZ7XFxUILauTLj/j1zuU/wzekL7unmHeO1M7VNjCK5Pi5Bk1dJyZx2aDEEDEpibkxBuDza3qo7
	zuUtFzb9L/7/A2y7eYJLeti4BhbNAJ+rLAAdbkMR1VoCW5FjhdKpE2uqK8/RJSZEsdJFPLo3DaGCf
	tq7ahCoxHtktiWOSYMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OC6-00000006MWz-3Bir;
	Mon, 28 Apr 2025 13:06:46 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NaT-00000006BHk-0e2Q
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:27:54 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso123837039f.1
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843272; x=1746448072; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMjnoCKPT/78nlU6O2trFf5q/dcfWcpN6t4vWbCwDk0=;
        b=2FV7fElORZ7B7hSFm1U/AVgda6Rzpt/AFWQrhS001GWjZHYMmUzTT4uZS+6EPS44+J
         FjHmDevcSgo6+ZbpP4P/qZYqtg+DuYbWNDxyTHeqqxYw+0fSapnd/XWOOtwbM7GOpg5u
         gqgIhzs4TbY9lbksgh+2iLsX90bzbQ9v0AUmAuOWLq5HWsv2tqShTEJcYX/k3aiLWwsD
         dOSt+aONSnN1nnY7HcvOUnQhkCe+l1Imbdzw5lJHtZK1aewyN9y5ts+87U74lrDKGtiY
         PEihRCf2+MXAqTTrGr86fxaaN2+77jVCfb9wVr4f8dvOswsFzed2C9nHXspC6wKO8jLe
         /NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843272; x=1746448072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMjnoCKPT/78nlU6O2trFf5q/dcfWcpN6t4vWbCwDk0=;
        b=XbcCvvwWv6wLgK++sPB8IR9Dg3u+J487gmp4CD/vkGyU2ZjM0gly4pEFrNf0+RfZTB
         qYPjlHBOFcIyY9dyWtpGlXocXGKK/x1qTEkkf69q6VvPUpvzNk473ZNhivYQ4Iqy5hGu
         9BZeZxnYBrNjrMiWLWpgux1e+TNCn5nYrdP/pogdXgzjrwUwomghWxsxIx5/UD155Iqs
         THfEdZbYIPXfZ0PBT/l+0TrM5XHUZbRlkKFAhTdW38ZJvvwsIrgFzLfQYio9HUsFKk8D
         wcMGtlFpuDs1QCPoZ396VrKJRhdgVryDhbwilIrfJaFw9T3Eru2yq4ajRh/h0+jlVegW
         9Wew==
X-Gm-Message-State: AOJu0YwKWGkeE0pF4upmx6L56QZszf+HQos0F8buIGwux5HA0Ftq+oRr
	zlF77Jy27FnXZ8HRC3F0MkrZG6GSlTi82GDhYTq9PvQTFsOPmsrT9j6rrL+Fr0xPQw1tKOyps3a
	ucay8OfYSgvpmBN2sy6fyuQHvOTthRxJxLTED43qKeo4QciNf
X-Gm-Gg: ASbGnctqnC9k652TPpAANb9HYFC/16lGVGemlNjltDjnY9vB194E/WYXWkqizBHZWxd
	PBK1lHPmR+Mv/haq2hSKnBxOb+bnROoz1mqeCV951XgWsxfaL+F8QdR9vAqsvbeAlzfsuGEl3MR
	RrLTV5eLBpGbW6P+JoRjnnb6M=
X-Google-Smtp-Source: AGHT+IHAtpksuWdkA8AaaME7zEXI5fwkwILDj6aDzbACnvND/Q0v/Vk65zGSFIa++2zpcUzscmTf3tbSy3Ofrd7JyrI=
X-Received: by 2002:a05:6e02:160c:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3d93b47af0amr95399355ab.11.1745843272134; Mon, 28 Apr 2025
 05:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-5-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-5-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 17:57:41 +0530
X-Gm-Features: ATxdqUEB5oO0PV4UIG98Zfi3y6CSrBtJX7ZLvA0Dsb2vUNENqbka66aWvN1LZqg
Message-ID: <CAAhSdy12eCnf+gCm7C2uCTrPk46ESj-8DSZC5UM9WgT0q2SDYw@mail.gmail.com>
Subject: Re: [PATCH 3/8] lib: sbi_hart: reset hstatus
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_052753_195059_18358AEC 
X-CRM114-Status: GOOD (  16.66  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgNzowMOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IGhzdGF0dXMuSFUgbXVzdCBiZSBjbGVhcmVk
LCBiZWNhdXNlIFUtbW9kZSBjb3VsZCBvdGhlcndpc2UgdXNlIHRoZQo+IEhMUy9IU1YgaW5zdHJ1
Y3Rpb25zLiAgVGhpcyB3b3VsZCBhbGxvdyBVLW1vZGUgdG8gcmVhZCBwaHlzaWNhbCBtZW1vcnkK
PiBkaXJlY3RseSBpZiB2Z2F0cCBhbmQgdnNhdHAgd2FzIDAuCj4KPiBUaGUgcmVtYWluaW5nIGZp
ZWxkcyBkb24ndCBzZWVtIGxpa2UgYSBzZWN1cml0eSB2dWxuZXJhYmlsaXR5IG5vdywgYnV0Cj4g
Y2xlYXJpbmcgdGhlIHdob2xlIENTUiBpcyBub3QgYW4gaXNzdWUsIHNvIGRvIHRoYXQgYmUgc2Fm
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWlj
cm8uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfaGFydC5jIHwgMyArKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IDJkOWVlNjBmZDM2Yy4u
YjY2Yjg5ZjZiYzUxIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2hhcnQuYwo+IEBAIC04NSw2ICs4NSw5IEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNf
aW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gICNlbmRpZgo+ICAgICAgICAgfQo+
Cj4gKyAgICAgICBpZiAobWlzYV9leHRlbnNpb24oJ0gnKSkKPiArICAgICAgICAgICAgICAgY3Ny
X3dyaXRlKENTUl9IU1RBVFVTLCAwKTsKPiArCj4gICAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4
dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01TVEFURUVOKSkgewo+ICAgICAgICAgICAg
ICAgICBtc3RhdGVlbl92YWwgPSBjc3JfcmVhZDY0KENTUl9NU1RBVEVFTjApOwo+ICAgICAgICAg
ICAgICAgICBtc3RhdGVlbl92YWwgfD0gU01TVEFURUVOX1NUQVRFTjsKPiAtLQo+IDIuNDguMQo+
Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
