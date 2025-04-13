Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4541DC369AB
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0EeL2tNxZxsXJakI6rNtt8j+6Uvu99Gt4uCHbjPGpA=; b=KR8gFq83fdLLXO
	+qCS5OZYAKKU5eskxX4cUmUJcO1gUtV9mtT0vMhP/bxN/bjmhXRHu8LFZTUa+ZLiynCD+aVB3KNY6
	l/n4ralLFnzXbjunUgwRosICstMTPTyb08dPFHkGHfkQsGNYdNyEHIVSRXaAuUqlkERjz7QeJhHaF
	UeJLLUeLk+5CDKM/X8iZjpcQOo7PUtST7anaNVT60Po8ziwGMOPF9szPeleUQIPzjA2A1AomqgrOw
	/kay0SWmOiBTt2KFw8gjKGWBfDYrVCIckVKtWgtuD4GmKc+IWEVvGhKkqABZqIUsWdTxRR31Yx60g
	nrxl+3GPUS0061NizJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3l2M-0000000GaTo-38Nk;
	Sun, 13 Apr 2025 00:17:26 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3l2J-0000000GaTK-2mSu
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 00:17:25 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d45503af24so29989705ab.2
        for <opensbi@lists.infradead.org>; Sat, 12 Apr 2025 17:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1744503442; x=1745108242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/AUOWl2x4snolmVt9anXZ+b6ZkQjXyv2KFy6p0atsw=;
        b=O+f1UD/JppScEtTnTbRluhjzS+K2YikJTMpX3aWbBAy/9gpiv02y3colA8bhX/bboV
         ZTp7IhppkmL7AR4OUXiA3jIso+78zpGCi++ZKDPNKY9Yvu6nl7+nJ35T1M8lynUwu8Ry
         LPghJ1WsS10pnH3rxddigp24G09dZUhAO5mMnjhZG+jXprB0UDzL7rhMYFwEN+rtW6xU
         5qoP9NIL9ErEySqXkfYgNiwPU5xnb2rc+acbKNHfOV+1zCBhlMDpjhww5/wBb7UuSkx7
         H0VKxbtIKjNpKSEavBCCxlk0/N4L4ugVubNO4XVqR4J5dfMbfcXmLIt/R1Bg3ioQZxVK
         dEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744503442; x=1745108242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/AUOWl2x4snolmVt9anXZ+b6ZkQjXyv2KFy6p0atsw=;
        b=tPtdsy6Nr6CKxpIN2sjYjsi5xCIU5uxyX3bkd9W+eMq6FGZagzZjn6MCf1QD28XgPG
         DjGyaKf5rSrerGiOMRAjB8p+Xn2s1DhXdxel4aBpmKvxq2ioMQF2TOMptMgmxs9PnuNZ
         EMulCihyWFoIhkjvnq2JlLF+AtSJ0jAWzjHQPwsDmv8XgxJ8EuI672B0GmYAunBSSHSl
         DG4d1wRNLzOckeeS1EP93wmI66I1+mkJJx37k4Gfcvt0dF2bmdFc4Cs5XujtRS5HWgu7
         FxUxqc1uGPVwrOUik+TO6gn0ogb7wGZ1db9foI0TqvE5tbCKJSLMH2WMgdyAM81nPaM4
         jyRw==
X-Gm-Message-State: AOJu0YzPU7S4cRsCbWB1EC9/nt6YACB7JcOW92ypRXsBvaNk0JiFRbzx
	PEQaqIJ4t8ECjgDapW7HhRROtuBvVskq475ui0qH/14YSHjnpPy8pS7lAlA2uGd5GrKHsOlbYqP
	XEk1UsFF15n9KZ8QgH4PadPjhEgSoiYswsP5Dcg==
X-Gm-Gg: ASbGnctYnzq/OB6/O2oeFer8MYIC8WauQ0Juc/aRXM5UREUgR0KukubGJCQs9KoIByJ
	zZ9hASpYWjX430MqrC8f1dLZmq8mBtBoII432skJlG2xMC/TaK2yR9Lt2eDF7TqLrj1p111eOzN
	fMIqoKRe8XsRtiWYNzxz+63ChnFi7Zjl8XVvv1dtktKZnT2kz8x0+OBew=
X-Google-Smtp-Source: AGHT+IHPclchO3hp6Lg/tMMepCCBdb9ExJWEnqS8yA26naV6FmyLxQM8x85qeLxA1ddJ8APuwvIrgjKtquYpJaaA35g=
X-Received: by 2002:a05:6e02:6:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3d7ec225f03mr72250595ab.11.1744503441746; Sat, 12 Apr 2025
 17:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <d3efe4c5-d9cc-4664-a779-40fb5cafd427@sysgo.com> <20250305014729.3143535-1-samuel.holland@sifive.com>
In-Reply-To: <20250305014729.3143535-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 13 Apr 2025 05:47:10 +0530
X-Gm-Features: ATxdqUH3Vyxioy4hPX4FLGESudqJIFZ95_SQ8qH0zhbx37aRMTXzztlz8OMT32w
Message-ID: <CAAhSdy0EOHBpt=Y8PsejyXP_QzmEA_0mWsP7bgBJftGsOtMyuQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_trap: Add support for vectored interrupts
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org, Jan Reinhard <jan.reinhard@sysgo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_171723_969453_7E5476DF 
X-CRM114-Status: GOOD (  22.14  )
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

T24gV2VkLCBNYXIgNSwgMjAyNSBhdCA5OjI54oCvQU0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gV2hlbiByZWRpcmVjdGluZyBhbiBleGNlcHRp
b24gdG8gUy1tb2RlLCB0cmFuc2Zvcm0gdGhlICh2KXN0dmVjIENTUgo+IHZhbHVlIGFzIGRlc2Ny
aWJlZCBpbiB0aGUgcHJpdmlsZWdlZCBzcGVjIHRvIGRlcml2ZSB0aGUgUy1tb2RlIFBDLgo+IFNp
bmNlIE9wZW5TQkkgbmV2ZXIgcmVkaXJlY3RzIGludGVycnVwdHMsIG9ubHkgc3luY2hyb25vdXMg
ZXhjZXB0aW9ucywKPiB0aGUgb25seSBhY3Rpb24gbmVlZGVkIGlzIHRvIG1hc2sgb3V0IHRoZSAo
dilzdHZlYy5NT0RFIGZpZWxkLgo+Cj4gUmVwb3J0ZWQtYnk6IEphbiBSZWluaGFyZCA8amFuLnJl
aW5oYXJkQHN5c2dvLmNvbT4KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0
d2FyZS1zcmMvb3BlbnNiaS9pc3N1ZXMvMzkxCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpJIHRoaW5rIGl0IGlzIGJldHRlciB0byBo
YXZlIGV4cGxpY2l0IGNsZWFyaW5nIG9mIHRoZSBNT0RFCmJpdHMgYmVmb3JlIHNldHRpbmcgbWVw
Yy4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGll
ZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCgo+
IC0tLQo+IEhpIEphbiwKPgo+IFRoYW5rcyBmb3IgeW91ciBidWcgcmVwb3J0IGFuZCB0aGUgcGF0
Y2ghCj4KPiBPcGVuU0JJIHJlcXVpcmVzIHBhdGNoZXMgdG8gYmUgc2lnbmVkIG9mZiBpbiBhY2Nv
cmRhbmNlIHdpdGggdGhlCj4gRGV2ZWxvcGVyIENlcnRpZmljYXRlIG9mIE9yaWdpbiAoRENPKVsx
XSwgYW5kIHNlbnQgYXMgY29tcGxldGUgY29tbWl0cwo+IGFzIHdpdGggZ2l0IGZvcm1hdC1wYXRj
aC9naXQgc2VuZC1lbWFpbC4KPgo+IFNpbmNlIHRoZSBmaXggaXMgdHJpdmlhbCBub3cgdGhhdCB3
ZSBhcmUgYXdhcmUgb2YgdGhlIGJ1ZywgSSB0b29rIHRoZQo+IGxpYmVydHkgb2Ygc2VuZGluZyBh
IG1vcmUgY29tcGxldGUgcGF0Y2gsIHNvIHlvdSBkb24ndCBoYXZlIHRvIGRlYWwgd2l0aAo+IGEg
YnVuY2ggb2YgcHJvY2Vzc2VzIGp1c3QgdG8gZ2V0IHRoZSBidWcgZml4ZWQuIElmIHlvdSdkIHJh
dGhlciByZXNlbmQKPiB5b3VyIG93biBwYXRjaCBwZXIgdGhlIENvbnRyaWJ1dGlvbiBHdWlkZWxp
bmVzWzFdLCB0aGF0IGlzIGZpbmUgdG9vLgo+Cj4gUmVnYXJkcywKPiBTYW11ZWwKPgo+IFsxXTog
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL2Jsb2IvbWFzdGVy
L2RvY3MvY29udHJpYnV0aW5nLm1kCj4KPiAgaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCB8
IDIgKysKPiAgbGliL3NiaS9zYmlfdHJhcC5jICAgICAgICAgICB8IDQgKystLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oIGIvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2Rp
bmcuaAo+IGluZGV4IDAzYzY4YTU3Li4xODQ2ZDc1MCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3Ni
aS9yaXNjdl9lbmNvZGluZy5oCj4gKysrIGIvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+
IEBAIC04NSw2ICs4NSw4IEBACj4gICNkZWZpbmUgSFNUQVRVU19HVkEgICAgICAgICAgICAgICAg
ICAgIF9VTCgweDAwMDAwMDQwKQo+ICAjZGVmaW5lIEhTVEFUVVNfVlNCRSAgICAgICAgICAgICAg
ICAgICBfVUwoMHgwMDAwMDAyMCkKPgo+ICsjZGVmaW5lIE1UVkVDX01PREUgICAgICAgICAgICAg
ICAgICAgICBfVUwoMHgwMDAwMDAwMykKPiArCj4gICNkZWZpbmUgTUNBVVNFX0lSUV9NQVNLICAg
ICAgICAgICAgICAgICAgICAgICAgKF9VTCgxKSA8PCAoX19yaXNjdl94bGVuIC0gMSkpCj4KPiAg
I2RlZmluZSBJUlFfU19TT0ZUICAgICAgICAgICAgICAgICAgICAgMQo+IGRpZmYgLS1naXQgYS9s
aWIvc2JpL3NiaV90cmFwLmMgYi9saWIvc2JpL3NiaV90cmFwLmMKPiBpbmRleCBlNjNhNTYzYi4u
ZjQxZGI0ZDEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfdHJhcC5jCj4gKysrIGIvbGliL3Ni
aS9zYmlfdHJhcC5jCj4gQEAgLTE2OSw3ICsxNjksNyBAQCBpbnQgc2JpX3RyYXBfcmVkaXJlY3Qo
c3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MsCj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShD
U1JfVlNDQVVTRSwgdHJhcC0+Y2F1c2UpOwo+Cj4gICAgICAgICAgICAgICAgIC8qIFNldCBNRVBD
IHRvIFZTLW1vZGUgZXhjZXB0aW9uIHZlY3RvciBiYXNlICovCj4gLSAgICAgICAgICAgICAgIHJl
Z3MtPm1lcGMgPSBjc3JfcmVhZChDU1JfVlNUVkVDKTsKPiArICAgICAgICAgICAgICAgcmVncy0+
bWVwYyA9IGNzcl9yZWFkKENTUl9WU1RWRUMpICYgfk1UVkVDX01PREU7Cj4KPiAgICAgICAgICAg
ICAgICAgLyogU2V0IE1QUCB0byBWUy1tb2RlICovCj4gICAgICAgICAgICAgICAgIHJlZ3MtPm1z
dGF0dXMgJj0gfk1TVEFUVVNfTVBQOwo+IEBAIC0yMDQsNyArMjA0LDcgQEAgaW50IHNiaV90cmFw
X3JlZGlyZWN0KHN0cnVjdCBzYmlfdHJhcF9yZWdzICpyZWdzLAo+ICAgICAgICAgICAgICAgICBj
c3Jfd3JpdGUoQ1NSX1NDQVVTRSwgdHJhcC0+Y2F1c2UpOwo+Cj4gICAgICAgICAgICAgICAgIC8q
IFNldCBNRVBDIHRvIFMtbW9kZSBleGNlcHRpb24gdmVjdG9yIGJhc2UgKi8KPiAtICAgICAgICAg
ICAgICAgcmVncy0+bWVwYyA9IGNzcl9yZWFkKENTUl9TVFZFQyk7Cj4gKyAgICAgICAgICAgICAg
IHJlZ3MtPm1lcGMgPSBjc3JfcmVhZChDU1JfU1RWRUMpICYgfk1UVkVDX01PREU7Cj4KPiAgICAg
ICAgICAgICAgICAgLyogU2V0IE1QUCB0byBTLW1vZGUgKi8KPiAgICAgICAgICAgICAgICAgcmVn
cy0+bXN0YXR1cyAmPSB+TVNUQVRVU19NUFA7Cj4gLS0KPiAyLjQ3LjIKPgo+Cj4gLS0KPiBvcGVu
c2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
