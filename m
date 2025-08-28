Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF432CA0FF2
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 05:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P13PMyIxe7pkfaGeuqxQ0MzmNPwbG7F1FkRWoveD2J8=; b=Hh2UpRHITMA9no
	3k1GkQtHsiAGiRspilLnGjTBcFYmWYJv2tbQqBEkV0ar6zw0/OokzlcDcqws6v5xiT06AorZiuQ0f
	XxMl9WI9w5xInA9cFTf+3W2TIcfO9Ga4YSQfWcXPfjXNrswF8MSoqEBumzG3eYRy1PyEy4mzmc3XR
	2er68Mml0LtHN59LuNceOzXGc08XIPqGJQQk0MJDA0Hs7m6NrKcChGs+f6q+QwyQvYW0zhSccJzdu
	msF9NbgPzqfT0NHStQZc2UmqmlPZ5Gl6sp5Q3S3xo5LC9edV6tkmUdrZIPakLg8D0qi/bMlsd8Y5I
	UTewIrxZF72appAoksWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urUob-00000000ICK-12do;
	Thu, 28 Aug 2025 05:04:49 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urUoY-00000000IBs-0DpM
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 05:04:47 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e9e0e38dcdso5956685ab.3
        for <opensbi@lists.infradead.org>; Wed, 27 Aug 2025 22:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756357485; x=1756962285; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP0wPyn+OM6kD+W5az4ISsEzqL3t9Iog4BMe0A3JrS8=;
        b=WUB6fQO2dl+jVzxKiKw45gA84X/ziuCJzhGUiLvj0cLdEp79yhb2Sh8YLmKKcLzbhx
         BLW3nloxeEzCrcT2l9bEDHoT9VeoLfWABPMnbYTK2aqbcwM15ZYQakvj3b7m8OSo9SF2
         eLdL7Yf4WVipPF2vqjvUK6eyDo1qb0Zs0BWLdDbctGrhuAi21Nb2c9RvDMW1CAH2w/ho
         DA1YxjTx44dENLEXcBv9tmnWS5g7MLyLw0EvnHYZDSndBhHWjkkR0qZiuANHvhmXFOQW
         0A7+JFnD2SIresEiayRTK7MN2BYm+USwdYBeaLjLq13IZtpaRtbQYShfnStn1k+3BPdW
         itKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756357485; x=1756962285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP0wPyn+OM6kD+W5az4ISsEzqL3t9Iog4BMe0A3JrS8=;
        b=m4+wmcNrz14T9qxnMDj0p1PWtmjFAZphNp+2JMV6rlx+W2QJsHurEy+e8ON+ZCtkQx
         ZMwAzI8a2F0fFUy1RylIgcUZ/rVVBAaakpTlo4mZ396g8UdORR84m6yYnEz3lhtusrNw
         6cabCdrGb9kadBihIhVd5O8WT2navfoUZe16fYYF19uTWSjcNx8cNW/N3Zs0aF5U5PYd
         ggP4qTQb4nn5ZLjqC6xJUNZDHtdpSKJnR7GFKvd4CABNLl2Ns7A3UEibua6ZMylw1Xu+
         sa9xvBvwmAZ6lKq43o6eDfNcHs+NGRfEU7AJnV0YU0HWyvFn7r8CDMYzIwPcV7MTtI2s
         92vQ==
X-Gm-Message-State: AOJu0YxPcuE/yEYMN6L85whgf3ZY9Nwt7RCHaeA/XaCaz6nTbCwqsp7n
	477QGTqdxHDmdVn9iB5OifpP0ABs/RtAGOL3J2+n5rjOsZ3gGUaN0R2+ftsfd4ReQbXQ55z4jyp
	5BjaAeYJkPMP/Tj7tqFg30Y+CPOo8rMc3jaIZLPP3ow==
X-Gm-Gg: ASbGncuUJi24F1TMiaNW4a6/Pp3A8NDTgh1gbZyE92IgCoJH1yjg3rg5tyy1X2cf1sI
	c5vHt/3wTA1toUgU7WGzCf+9inImDY9jiIPcM5zLHxj6Ic+qMuOO65AMbOtwZDuRre1dDO4dJ/k
	TONFFp9cLAIASSYt2ts6LXXOCm9LXDwATgMcTd8k5Eg74fH/oXxRE8BeEi9vvx6c5MdcrJokKe9
	OgWYCjjOa5F7h5KRx13ZYI5ZcxC0wPRGUR6SVJBTQi7PYd5vRc=
X-Google-Smtp-Source: AGHT+IEMV2qwyvaE2q2YDpl3YoEeE4zD3J2kwfoje/PHSEwbvXO/cQEF0Tlv8Anmt4bOcsZoVQ6eId+c5+hgtr6x248=
X-Received: by 2002:a05:6e02:1d86:b0:3f1:3420:616d with SMTP id
 e9e14a558f8ab-3f13420654dmr21580855ab.32.1756357485072; Wed, 27 Aug 2025
 22:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250728074334.372355-1-wxjstz@126.com>
In-Reply-To: <20250728074334.372355-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Aug 2025 10:34:34 +0530
X-Gm-Features: Ac12FXzjOLOSIiNZ6tre9zIYCkZTfwYlbcBCNcwmZTM3m8KXiLLeouG4jfaXU7A
Message-ID: <CAAhSdy14eek151=HMMuYOrMKXY4Zo9GD605m5XjXC1Dj36RwpQ@mail.gmail.com>
Subject: Re: [PATCH v2] Fix license to compatible BSD-2-Clause
To: Xiang W <wxjstz@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_220446_095083_8EEA33C3 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: Hui Min Mina Chou <minachou@andestech.com>, Jessica Clarke <jrtc27@jrtc27.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgMToxM+KAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IE9wZW5TQkkgaXMgYSBCU0QgcHJvamVjdC4gV2UgbmVlZCB0byBtb2RpZnkg
c29tZSBjb2RlcyB0byBjb21wYXRpYmxlCj4gd2l0aCBCU0QtMi1DbGF1c2UgbGljZW5zZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IFhpYW5nIFcgPHd4anN0ekAxMjYuY29tPgo+IFJldmlld2VkLWJ5OiBC
ZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1i
eTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0
byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IHYyIGNoYW5n
ZXM6Cj4gLSBmaXggdHlwbyBhbmQgcmV3b3JkCj4KPiBBbmRlcyBUZWNobm9sb2d5IGFncmVlcyB0
byBjaGFuZ2UgbGljZW5zZS4KPiBXZSBhbHNvIG5lZWQgdGhlIGNvbnNlbnQgb2YgUmVuZXNhcyBF
bGVjdHJvbmljcyBDb3JwLgo+Cj4gIC5lZGl0b3Jjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19wbWEuYyAgICAg
ICAgIHwgMiArLQo+ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5kZXMvYW5kZXMuaCAgICAg
fCAyICstCj4gIHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRlcy9hbmRlc19wbWEuaCB8IDIg
Ky0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9yZW5lc2FzL3J6Zml2ZS9yemZpdmUuYyAgIHwgMiArLQo+
ICA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS8uZWRpdG9yY29uZmlnIGIvLmVkaXRvcmNvbmZpZwo+IGluZGV4IGU2NmIxY2Ez
Li4yNmY5MDUzNCAxMDA2NDQKPiAtLS0gYS8uZWRpdG9yY29uZmlnCj4gKysrIGIvLmVkaXRvcmNv
bmZpZwo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gICMg
U2VlIGhlcmUgZm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGZvcm1hdCBhbmQgZWRpdG9y
IHN1cHBvcnQ6Cj4gICMgaHR0cHM6Ly9lZGl0b3Jjb25maWcub3JnLwo+Cj4gZGlmZiAtLWdpdCBh
L3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG1hLmMgYi9wbGF0Zm9ybS9nZW5lcmljL2Fu
ZGVzL2FuZGVzX3BtYS5jCj4gaW5kZXggMDllNWEzMGMuLmVlZWIxMTBlIDEwMDY0NAo+IC0tLSBh
L3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG1hLmMKPiArKysgYi9wbGF0Zm9ybS9nZW5l
cmljL2FuZGVzL2FuZGVzX3BtYS5jCj4gQEAgLTEsNCArMSw0IEBACj4gLS8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0Qt
Mi1DbGF1c2UKPiAgLyoKPiAgICogQ29weXJpZ2h0IChDKSAyMDIzIFJlbmVzYXMgRWxlY3Ryb25p
Y3MgQ29ycC4KPiAgICogQ29weXJpZ2h0IChjKSAyMDI0IEFuZGVzIFRlY2hub2xvZ3kgQ29ycG9y
YXRpb24KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL2FuZGVzL2FuZGVz
LmggYi9wbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5kZXMvYW5kZXMuaAo+IGluZGV4IDM0MDNh
NThiLi5iZmVkZjAzNCAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5k
ZXMvYW5kZXMuaAo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRlcy9hbmRlcy5o
Cj4gQEAgLTEsNCArMSw0IEBACj4gLS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UgKi8KPiAgLyoK
PiAgICogQ29weXJpZ2h0IChDKSAyMDI0IEFuZGVzIFRlY2hub2xvZ3kgQ29ycG9yYXRpb24KPiAg
ICovCj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRlcy9hbmRlc19w
bWEuaCBiL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9hbmRlcy9hbmRlc19wbWEuaAo+IGluZGV4
IGJlNjE0OTY0Li40YTY2ZTFiNiAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL2luY2x1
ZGUvYW5kZXMvYW5kZXNfcG1hLmgKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5k
ZXMvYW5kZXNfcG1hLmgKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAgKi8KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNs
YXVzZSAqLwo+ICAvKgo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjMgUmVuZXNhcyBFbGVjdHJvbmlj
cyBDb3JwLgo+ICAgKi8KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9yZW5lc2FzL3J6
Zml2ZS9yemZpdmUuYyBiL3BsYXRmb3JtL2dlbmVyaWMvcmVuZXNhcy9yemZpdmUvcnpmaXZlLmMK
PiBpbmRleCA0NGRiMzY3MS4uNmMzZGEwOTUgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJp
Yy9yZW5lc2FzL3J6Zml2ZS9yemZpdmUuYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvcmVuZXNh
cy9yemZpdmUvcnpmaXZlLmMKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNs
YXVzZQo+ICAvKgo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjIgUmVuZXNhcyBFbGVjdHJvbmljcyBD
b3JwLgo+ICAgKgo+IC0tCj4gMi40Ny4yCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
