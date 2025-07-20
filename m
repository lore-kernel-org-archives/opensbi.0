Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA56C83F22
	for <opensbi@archiver.kernel.org>; Sun, 20 Jul 2025 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT/UdU1dzemtrWhaJGfwb9Jx6a3DA59wn1zjIcUS0a8=; b=l2m+BPHDZmR+1q
	1pJHfEDtbqrZHjIjp0fsAj2C3Y/l94vIiW/W29Z0rWxWeAqFeLk4B9ZfZi+bHyH5l50nJsw6ZEpvp
	oEc4AU/+5YUoHTRCcAS1uwSdvIbO696GpEgcwRkMBYPpwgKFE85nd5c2HwZnLDoyrSVHoYxN2jwRR
	KhD9w7rVq1mpUaynV/Mong/A/wiSY90MLOAPVolwoX2Xcgbs+mBTuxIyHSvIqh95mZJev2+qiG65V
	bMKJxPq9WTPHDwUt9FiUhZEDu+UvK+t2mARWtWhuYh7/0wwBhWhRrMwZbSfazdMKA9fdDuHhi8yHF
	E6tMmosKUe1yoXSTJAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVqv-0000000FRmb-3dZX;
	Sun, 20 Jul 2025 15:21:25 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVqt-0000000FRmE-0GNf
	for opensbi@lists.infradead.org;
	Sun, 20 Jul 2025 15:21:24 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3e28be470f1so16341735ab.0
        for <opensbi@lists.infradead.org>; Sun, 20 Jul 2025 08:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753024882; x=1753629682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6wUUHnruND53xifuCGIVKKaCktKfmh5qMQ8ShrbkZw=;
        b=VR3Zyd9JbzHREtsdtQoexZK6/X1RHtVxdl+v6omK46Y2dmXqclpE5xBq32pgtRPdb0
         2Kvqn5dXUT0Ff/CTzKT1d8l6er/BO9Z4fRINFj91Mbh6MkSZxyBPAtj/AUJZmH2RQW8H
         SJkGGhFXZ8r1FDPGhfVwUnL3K6upM6d953eVVB/lGo759Nvo+CatPoRVWTLZTFTClhF0
         3CAw6TCxrodJkZf1cywB6gQU9zp+SbL+V4+518bJq34Pmbai5WT4onX7V2hPzyM3uXyX
         b/nPJoltR6GWJroTAbpGSSoawllq8QvA4chs7N1GqpDZ2ruhqn9DglHoGmWciRxjg6ut
         Atgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753024882; x=1753629682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6wUUHnruND53xifuCGIVKKaCktKfmh5qMQ8ShrbkZw=;
        b=rIoWHZAGBOaNLoyB8nmgtKct2/4jkXuE55D3gqFT6NbpI3gq4iBu8l33JHQ1rXlR4s
         Qbb/bDvZiJ6yPxt2LJMYLm5NIs7DLIom3JkqgjGbCyAw+1ic72jBldsb3VGCvU1ATtxX
         2edvMyZVeDZy7mQlXFELon8KL0iVmoYLTghr6p7m2K1pOt8/hJ+8y7MQ62Zd784gq5js
         lJpEAbCy39SFTtrM/Qmgp+Tgh9JNNHx+zlE/qlEwnhEi3XIoTBwU6gFnDPowoqXNBFia
         13FijKThZy3Wx1+H1kscjfJtXIoOqOpi5CJK963641JOnXmFKS1Aqc+3hZUPQH8EEuUX
         NJFw==
X-Gm-Message-State: AOJu0YyG7yvaCLIbw5zYaT+c3rCDdkfJawdi0xlnulFHH+Wq3ZHDnKz3
	a0QxLBWW0dVvHJBbx3aiXZXokcH5P/hXrRQOAMaCxKFhISpqkStvwgm0iDbH8QFJRInsrlpyG8C
	Hn+GS3LN3kH173ssNvVICkhpbdNtZo6B8r23IvcEnwQ==
X-Gm-Gg: ASbGncv/pGftrcD3KfyoqEOm2oFf1jEgFOIxkZTyrC+KiZSCfHg9mY3V1wSRniC6UUM
	Eg5j9MCnfZUlDrOJVPy2A7mpq2U3gvHjr3ud8AriV3bHpXFbzg5VBGLWbrM0/774avlm6jz4ejQ
	aHZbl/84dIWdDKGrPC66lWOtzALBNsCzSehSyEnNGRQW8dkwPTAkAnHBGvb7BPnFmqUPIODw+68
	HQ3JxMJ
X-Google-Smtp-Source: AGHT+IEhvQx+R3XEufs2rVi6DtESa0w5w3tDx+p5j75rOuODAVG+nhNUaUgXwPbCqCfcGvqSwmfaQp5S7ms0k3uIAyM=
X-Received: by 2002:a05:6e02:308b:b0:3de:e74:be13 with SMTP id
 e9e14a558f8ab-3e2956b896dmr117136485ab.0.1753024882221; Sun, 20 Jul 2025
 08:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250624084210.229564-1-wxjstz@126.com>
In-Reply-To: <20250624084210.229564-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Jul 2025 20:51:11 +0530
X-Gm-Features: Ac12FXyq4RG_-pEcd8BDDKI1gqc8PZ18GrzoGNt7LxBCypkvF11eCcENiyKyke0
Message-ID: <CAAhSdy3BPdswtvkzREJrw=kx6ooq35NYfFcLunM3_T-6cigj1Q@mail.gmail.com>
Subject: Re: [PATCH] firmware: payload: test: Add SBI shutdown call after test message
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_082123_107101_71B8AE89 
X-CRM114-Status: GOOD (  13.58  )
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

T24gVHVlLCBKdW4gMjQsIDIwMjUgYXQgMjoxM+KAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFByZXZpb3VzbHksICdtYWtlIHJ1bicgd291bGQgaGFuZyBpbiBXRkkgYWZ0
ZXIgcHJpbnRpbmcgdGhlIHRlc3QgbWVzc2FnZS4KPiBUaGlzIGNvbW1pdCBhZGRzIGFuIFNCSSBl
Y2FsbCB0byBlbnN1cmUgUUVNVSBleGl0cyBjbGVhbmx5IGFmdGVyIHRoZSB0ZXN0Cj4gcGF5bG9h
ZCBydW5zLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgVyA8d3hqc3R6QDEyNi5jb20+Cj4gLS0t
Cj4gIGZpcm13YXJlL3BheWxvYWRzL3Rlc3RfbWFpbi5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUvcGF5bG9h
ZHMvdGVzdF9tYWluLmMgYi9maXJtd2FyZS9wYXlsb2Fkcy90ZXN0X21haW4uYwo+IGluZGV4IDE5
NGRiYmU2Li4wMjFiYzNiOCAxMDA2NDQKPiAtLS0gYS9maXJtd2FyZS9wYXlsb2Fkcy90ZXN0X21h
aW4uYwo+ICsrKyBiL2Zpcm13YXJlL3BheWxvYWRzL3Rlc3RfbWFpbi5jCj4gQEAgLTQ2LDYgKzQ2
LDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzYmlfZWNhbGxfY29uc29sZV9wdXRzKGNvbnN0IGNo
YXIgKnN0cikKPiAgICAgICAgICAgICAgICAgICBzYmlfc3RybGVuKHN0ciksICh1bnNpZ25lZCBs
b25nKXN0ciwgMCwgMCwgMCwgMCk7Cj4gIH0KPgo+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2JpX2Vj
YWxsX3NodXRkb3duKHZvaWQpCj4gK3sKPiArICAgICAgIHNiaV9lY2FsbChTQklfRVhUX1NSU1Qs
IFNCSV9FWFRfU1JTVF9SRVNFVCwKPiArICAgICAgICAgICAgICAgICBTQklfU1JTVF9SRVNFVF9U
WVBFX1NIVVRET1dOLCBTQklfU1JTVF9SRVNFVF9SRUFTT05fTk9ORSwKPiArICAgICAgICAgICAg
ICAgICAwLCAwLCAwLCAwKTsKPiArfQo+ICsKPiAgI2RlZmluZSB3ZmkoKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGRvIHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICBf
X2FzbV9fIF9fdm9sYXRpbGVfXygid2ZpIiA6OjogIm1lbW9yeSIpOyBcCj4gQEAgLTU0LDYgKzYx
LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHNiaV9lY2FsbF9jb25zb2xlX3B1dHMoY29uc3QgY2hh
ciAqc3RyKQo+ICB2b2lkIHRlc3RfbWFpbih1bnNpZ25lZCBsb25nIGEwLCB1bnNpZ25lZCBsb25n
IGExKQo+ICB7Cj4gICAgICAgICBzYmlfZWNhbGxfY29uc29sZV9wdXRzKCJcblRlc3QgcGF5bG9h
ZCBydW5uaW5nXG4iKTsKPiArICAgICAgIHNiaV9lY2FsbF9zaHV0ZG93bigpOwo+Cj4gICAgICAg
ICB3aGlsZSAoMSkKPiAgICAgICAgICAgICAgICAgd2ZpKCk7CgpEcm9wIHRoZSB3aGlsZSBsb29w
IGFuZCBhbHNvIHByaW50IGFuIGVycm9yIG1lc3NhZ2UKaWYgc2JpX2VjYWxsX3NodXRkb3duKCkg
ZmFpbHMuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
