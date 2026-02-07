Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732F6EE0AC6
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBQGEMuMaKEtvFrpgqW6Dm2MbmxOfJ3ekM8mLOSqNZg=; b=TGoroU5/kxB0kK
	l2CQ+hLfxVvX6Su0tyH4PbysXrOGxGkBDYFQLFDFKXSIEHMywMtFe3smWfLbVp//tGOsjI8l0AIZk
	T1Xgsp/xGbc14xm8gKQQjWnNRkrKSwTxPCOlGabgWVmuIJNKw7sdDiYAgTcNyehqkFUNehbvll2AE
	y15tQoLy95AUffy4DoRNIf8kO9Sp38ENZNi6tNpRPbhYKlf6LLCoWICgYA3zsmbYx3/Y0/34OOGUF
	f8QzZ4h6WoTfUteTYFISM/cS0sSOxFTqRhinKkHnvSy5z78vpuQzETQsgH3MZBLnszu3wg1RVqT2U
	N8uetspKbMn644Jt2WIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofEW-0000000CIU8-3qff;
	Sat, 07 Feb 2026 10:08:08 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofET-0000000CITl-2yWc
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:08:07 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-40974bf7781so2294210fac.0
        for <opensbi@lists.infradead.org>; Sat, 07 Feb 2026 02:08:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770458884; cv=none;
        d=google.com; s=arc-20240605;
        b=dIlPh2S2Zlyftyb1ybB8AtA2NT7lG/EUIYl9WcjLrO0kYarZBCQCkXHweqM1AprDV1
         Vlj+5PB/KhlSy/Ick/UnQnmeSIxpJihMCoQGon8y6iUIWQhgn8AnHm+VuaB4UdSGEI50
         A1dtiwgP+2ws8InZ+jM8mpxFX49fqBueIRvWL330416CqDlxH/qptuHpg1qW1yI76PTr
         pUQjz5pipQMckBMcndAzCZQo4AqZVA0PO2DCOKWCuJq32H8zMv+TVrHm+dwDdDHyqCCx
         Rfs7UFiW+3CoZkeXgkS9jX6jZv5bjiRMhiq0ZJfFXgSTBFvG4ul8Y5O5dx4rid1LiPMj
         OYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0bKkKl+HudTR6rxFpRcgugcJ4iGMqbet7BSX+hRE2y4=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=GUIKMpX22JojpbYLHFFz9j+B+oJzPoKlrvZiRY1SEgUzhaknPrBj1yrGlvGOzkkGAt
         gPcl/RXAPJzKHXccFqp+Mo4jVusqgZNhzqQj+E2rnsiXpoJjujkH8ZKw+HM7gVQQ7lBr
         w5LynCqTPzzPb/iobLoHUm0i9pG0q3NxNEH53sPz/WtgTJXc5EQZdLQ9G/BJeiNshqxk
         50dSpBRbXsq4Csq/Ib37ozGrEn43T4G9AIF1JxziY2FaGD9wPyGGVWcmS8JB2Bnkgr1U
         XBw0z6gGQ7Wu3K0EycjkUqC4Q6D1fh/u1nOtSjZdNXHW9wpMaEXb09Mr1dmw3V0ieLqJ
         X4uA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770458884; x=1771063684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bKkKl+HudTR6rxFpRcgugcJ4iGMqbet7BSX+hRE2y4=;
        b=3Y7amMHipOPFWzMIXbY6AtaHAI8YFtRKPhdfOGmp7zlPbJ3RGfMHTNeq3jqM+wBYNv
         TEapA4DOcjsepnnzfZI55Ctw+eOYHZdBliaVJUZg8wDT6NehjbZQxSM53F9mX5jnZANk
         BVdnTiwnCo/vK54SqlQjJEcr007Mbg6JHxJH0Cky84+NNOXTBcZDUkDtfs1vKTTvZXT4
         lbIqwE2iyQkXEn6/MIT5sL3LBKfG2Q7vyzZ1tLn4VPzWrgq6shT+S3ah9c+FYvAY1Fr0
         jCWgV8exY0RxrmVgHHW2TXAzOl0sc0JrxinuuFfLf47Wt7ECF/rX5buF0sXs5tXGLWGT
         uabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770458884; x=1771063684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0bKkKl+HudTR6rxFpRcgugcJ4iGMqbet7BSX+hRE2y4=;
        b=r5uywwHVMGMxf+mEa4uvrQoKKxJI8LJMj5ferLYxlfQ5Zs8+5E/4ZDztlvYZL9P1es
         NG5QeX6gtUjyMl9W+uoswDcZJHIu/N2fzHSU9t1gsk4nQpxa2inupO6GZfSQyS82+RGI
         xlDuxNaB5mu9KIB7GzKsdsrmABAtQYvnw5d6AEqQeb0g0GVelwJ//x/HQB3s604kh9Tc
         +tvGKSpCnG7wOTP0nzeUF4pt3wc1gsnGyAcDqlMtqMeQ9XqE1Bfqyk1RvSh5K9hGSWcY
         b7x6pLNoiBAPFwtAKx+Jge71XCDMJYDCZTrtTqT5iAYlQQcM7vv8R0ayEXkC/HHkKMcq
         rbxA==
X-Gm-Message-State: AOJu0YxCymlik7tacwx6muQsdiPNl4Qkty8X6+U/TLK7AVsXHFO9+WeJ
	oTJeZUBtDMU9+Xqw+NT8WWcC/nKBV/PFFtzSQvBh1wMc4fIEljZcXyqoZV1Cc9mv64T8MHo0MLT
	zwcamgTZXONPSZsxH8hwNadfZNX1ABNd7ZlKcdSxwaw==
X-Gm-Gg: AZuq6aKdE9FpLhyf05wXe7EqKZQ2pi92K+ieg6mu0bYe28l+WzxgIACuqg61Ckp5+ql
	pZbgmorNtFk9dZ4VbknezwNA+osuIwrhWD5y1h5IhlZloF/xRG9AF+KolyJEF2MiqHJ4Dh3Tetb
	OXRwU9sjFMjrb3pEJGox0oifdYxwG1dgrqhvBJ7+sZSnln2nrzosGRFnxOqRYX2i9+/QlU54FkH
	VxkJ1wuvKdF0mp2fMgS6LOncodc0+oS9+IHMjJKbDm8NUaaRFfj+D3/u58RlafUGA6MnlI1n8Kp
	EhLokdUM5yTgOYjvlFNysJ8LVifpd1SeGhpXXXZDaCaevYnN37DU/0kyKQ==
X-Received: by 2002:a05:6820:603:b0:66a:bd71:f058 with SMTP id
 006d021491bc7-66ba799bfacmr4988621eaf.28.1770458883604; Sat, 07 Feb 2026
 02:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20260202150207.1331811-1-raymondmaoca@gmail.com>
In-Reply-To: <20260202150207.1331811-1-raymondmaoca@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Feb 2026 15:37:52 +0530
X-Gm-Features: AZwV_QjrJKJ21vcXs96Hj7iPiYgFzbvjn7GHLp1TeMFEzo1JVq3pfVZaqMUCCUM
Message-ID: <CAAhSdy1VQp5RtgR+uK6Wv6+RTw0Ja3-Oa-YnR17--0jmerjOcQ@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/2] Introduce irqchip and VIRQ layer prototypes
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_020806_209820_7793789F 
X-CRM114-Status: GOOD (  17.06  )
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

T24gTW9uLCBGZWIgMiwgMjAyNiBhdCA4OjMy4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9j
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJp
c2NzdGFyLmNvbT4KPgo+IFRoaXMgUkZDIGludHJvZHVjZXMgaXJxY2hpcCBhYnN0cmFjdGlvbiBh
bmQgVklSUSBsYXllcnMgZm9yIEFQTElDCj4gd2lyZWQgaW50ZXJydXB0IHN1cHBvcnQgaW4gT3Bl
blNCSS4KPgo+IEluIHRoZSBjdXJyZW50IE9wZW5TQkkgaW1wbGVtZW50YXRpb24sIEFQTElDIHN1
cHBvcnQgcHJpbWFyaWx5IGZvY3VzZXMKPiBvbiBpbml0aWFsaXphdGlvbiBhbmQgZGVsZWdhdGlv
biwgd2hpbGUgZXh0ZXJuYWwgaW50ZXJydXB0IGhhbmRsaW5nCj4gZm9yIHdpcmVkIGludGVycnVw
dHMgcmVtYWlucyBsYXJnZWx5IHN0dWJiZWQuIEFzIGEgcmVzdWx0Ogo+IC0gVGhlcmUgaXMgbm8g
Z2VuZXJpYyBtZWNoYW5pc20gZm9yIE9wZW5TQkkgZHJpdmVycyBvciBwbGF0Zm9ybXMgdG8KPiAg
IHJlZ2lzdGVyIGhhbmRsZXJzIGZvciB3aXJlZCBpbnRlcnJ1cHQgbGluZXMuCj4gLSBJbnRlcnJ1
cHQgZGlzcGF0Y2ggcmVtYWlucyB0aWdodGx5IGNvdXBsZWQgdG8gc3BlY2lmaWMgaXJxY2hpcAo+
ICAgaW1wbGVtZW50YXRpb25zLgo+Cj4gVGhlIGdvYWwgaXMgdG8gaW50cm9kdWNlIGEgc21hbGws
IGV4dGVuc2libGUgYWJzdHJhY3Rpb24gZm9yIGlycWNoaXAKPiB0byBoaWRlIHRoZSBIVyBkZXRh
aWxzIGFuZCBwcm92aWRlIGFic3RyYWN0IG9wZXJhdGlvbnMgbGlrZSBpbnRlcnJ1cHQKPiBwcm92
aWRlciByZWdpc3RyYXRpb24sIGNsYWltL2NvbXBsZXRlL21hc2svdW5tYXNrIG9wZXJhdGlvbnMu
CgpXZSBkb24ndCBuZWVkIGNsYWltKCkgYW5kIGNvbXBsZXRlKCkgY2FsbGJhY2tzIGluc3RlYWQg
c2luZ2xlIGVvaSgpCmNhbGxiYWNrIGlzIHN1ZmZpY2llbnQgYmVjYXVzZSB0aGUgQVBMSUMgZHJp
dmVyIHdpbGwgaGF2ZSB0byBhbnl3YXkKcmVhZCB0aGUgQ0xBSU0gcmVnaXN0ZXIgdG8gZ2V0IHRo
ZSBoYXJkd2FyZSBpcnEgbnVtYmVyLgoKPgo+IFZJUlEgKFZpcnR1YWwgSVJRKSBsYXllciBpcyBv
biB0b3Agb2YgSU5UQywgcHJvdmlkaW5nIElSUSBzdGF0ZQo+IG1hbmFnZW1lbnQgdmlhIHBlci0o
ZG9tYWluLGhhcnQpIElSUSBwZW5kaW5nIHF1ZXVlLCB3aXRoIGNvdXJpZXIKPiBkaXNwYXRjaGlu
ZyBhbmQgaW50ZXJmYWNlIHRvIGVucXVldWUvcG9wL2NvbXBsZXRlIGFuIElSUSBhbmQgbWFwIGh3
aXJxCj4gdG8gdmlydHVhbCBJUlEgbnVtYmVyIHRvIGF2b2lkIGV4cG9zdXJlIG9mIGh3aXJxLgoK
VGhpbmtpbmcgYWJvdXQgdGhpcyBtb3JlLCBhIHNlcGFyYXRlIFZJUlEgbGF5ZXIgd2lsbCBjb25z
dW1lCnF1aXRlIGEgYml0IG9mIG1lbW9yeSBmb3IgbWFuYWdpbmcgdGhlIHZpcnR1YWwgSVJRIHNw
YWNlLgoKSW5zdGVhZCBvZiBhIFZJUlEgbGF5ZXIsIGVhY2ggaXJxY2hpcCBoYXZpbmcgaXRzIG93
biBIV0lSUSBzcGFjZQppcyBtdWNoIG1vcmUgZmxleGlibGUgYW5kIHNjYWxhYmxlLiBJIHNwZW50
IHBhc3QgMiBkYXlzIHRyeWluZyB0bwpjb21lLXVwIHdpdGggdGhpcyBhYnN0cmFjdGlvbiB3aGlj
aCBJIHdpbGwgcG9zdCBpbiBhIGZldyBtaW51dGVzLgoKSSBob3BlIHRoaXMgd2lsbCBzYXZlIHRp
bWUgaW4gcmV2aWV3cy4KCj4KPiBSYXltb25kIE1hbyAoMik6Cj4gICBsaWI6IHNiaTogaW50cm9k
dWNlIGFic3RyYWN0aW9uIGZvciB3aXJlZCBpbnRlcnJ1cHQgaGFuZGxpbmcKPiAgIGxpYjogc2Jp
OiBBZGQgVklSUSBpbnRlcnJ1cHQgYWJzdHJhY3Rpb24KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBN
b3ZlIElOVEMgdG8gaXJxY2hpcAo+IC0gTW92ZSBod2lycSBtYXBwaW5nIHRvIFZJUlEKPiAtIFJl
bW92ZSBnZXRfY2FwcyBhbmQgcGFzcyBpbiBtYXhfc3JjIGR1cmluZyBwcm92aWRlciByZWdpc3Ry
YXRpb24KPiAtIEFsbCBpcnFjaGlwIGludGVyZmFjZSB1c2UgaHdpcnEgYXMgcGFyYW1ldGVyCj4K
PiAgaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAuaCB8IDUyICsrKysrKysrKysrKysrKysrKysrKysK
PiAgaW5jbHVkZS9zYmkvc2JpX3ZpcnEuaCAgICB8IDkwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0MiBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NiaS9zYmlfdmlycS5oCj4KPiAtLQo+IDIuMjUu
MQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
