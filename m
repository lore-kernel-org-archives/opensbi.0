Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0682CD37B6
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gccU2lVIysdXQ51EVoxseEKY4T+/Ozj1X8f3f1XBU8o=; b=GB1ybwiMQZq9sz
	jCON+A2Klok1TzsRASh5JzxksmO1Q4l1gLFXeM+8Kj9Xnh/TI++BI2uc8No6RWwLTSBb9YdbDMad6
	UfrzsPMdr+z0zYSe6tMOKc/BhfgMiixHSZ1UneM6wgdWJVHxIzIaqta1bhOxSqK26BOqJwd0GQp1I
	VHsiJs8cqob+ZzMZqMaxltXcH2XnFVOGn7ZfYcTjSgxHqfRxIN7qXpSaJqHodfiVwU7qPii3fhu6s
	GRArjlXKfyMzCUrSUi3lxBEaxC+ug85xFSknSuv/fL9UP9Y66aj0XQcTDpIYj8XNH4BxnFC6tiHqu
	VSKgN1fNyCp1bGUqBdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4TC-00000001ete-3CPi;
	Wed, 13 May 2026 07:57:30 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4T9-00000001et1-3BwG
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 07:57:29 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-694932346a1so2346951eaf.3
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 00:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778659046; cv=none;
        d=google.com; s=arc-20240605;
        b=ENrvrB0yCbK5JsCdwqMyjm8Q8yHpfrembR8C2Ym+oh65rChPbAJsgEAU0JCXP2rgWz
         TrMCxjaK/VTAP95B5i2kQainw1ll5iKSMZigejcO2PiPB9WML7cYt5d0G5LVH/N8jgBA
         6DvF5Dj9qkZsZ0YVauLOkYuyuiq3FhHoCN/s/JA2TrH/YMaA3Tknb2XijscTxseukCBW
         ePQgjg7vO72nR81WqorgcApjvYxW4I6yGFxuB4KVnBryyB/z41qWtoLDEM2VXHJ80h54
         OuI2Dig7XV6aNnOaPKhniZv842so2UiGsvRNe5gTre8tGn/PFynR42WvXTp3B/uWQLv9
         kQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CpSC4f5HAV5WG9wsozGH3cFD8HP/+DiW8rQJ+6wxQGU=;
        fh=j1MHADdFH8ZdZRPvION1rHJnLjx+RehZ8LEVMBQ6UBc=;
        b=EEMni1lViu/NOO6ID0PyLa2r1A9hFGaWCwt4+wbvY53KdwXUnkWUu9DS1C+coPiK8O
         x/WeW+mmUm0GyOb3dT3srn9ftyXUBuzJw4ry/vn0B4CJTqSAa+kB76sbkCVbh9xoZTOW
         BYoBSRW0cl/WE9vfUy1AWI7YSXT8R9psJn13v1ghrHByWEBbbEL6AWtBovslo5ibsHl1
         FACcwWQIbkIGV0y8vRC1enLChew5uS4ZsRvcfnz1r8xedPVh1en3rHPPQLRr4eTR8Nrt
         FIhwNMB2iZmUrtov+xby2w3Dck7bGgekwchhSqQuRYYOkn13dj/N4PGBtnyJMJimYt7Y
         aeeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778659046; x=1779263846; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpSC4f5HAV5WG9wsozGH3cFD8HP/+DiW8rQJ+6wxQGU=;
        b=TUMx+p7lcdRowxEBf1vSD55GWKwGwwK9szWBwes3zfMKpzKOxJUOWHWt30CpcAriqo
         e3pdafiRlpFw4Be1UkwoYXZesKqYry+vR+wlEceWBsee/iWnZDfjTWRTTYC0ptFDmxwB
         xwtZL2dhaZSU3UUJoqXTp89W/sjd6G4w2E7uLlrHscjcE63ACeKzjUxka02hY0r5Xhxc
         kmdAK4CEsD1AoZAvTMTKKk2jK3jPvEv//CNQhLe6Gi3dPZBtiycXjjcZwx+a42r+nnmv
         18mwyBxzSuDxx/s9KYVhKz0ORSgpKg+XjmbWfjjw7IbamesCU7PgEdN7UEe4iqvLqKjT
         lyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659046; x=1779263846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CpSC4f5HAV5WG9wsozGH3cFD8HP/+DiW8rQJ+6wxQGU=;
        b=EBrIR1HGZTSF55l00B7Md/lRMaNK/VoziJTA0E5uBXd07E+TC1CjJJThs5Feu4zTZF
         wLYS4NAwD2DS3kbjd+E6ofGBk9iFEB/BrjEOSF6Vk0fWxYfN9YO9g2UFg+ifsu762/rU
         dH4YB4+w3FJ1WWJYpMuiBluElyW6RFnVfy3yQ83f+aakZJS2rf5beZTYeD8PK692IUAV
         U3U4ZESPP5bcxqXdjVwSXQaIzsvyZg5njVw3/ndP1wsks9phf7xFu9S2WQJpiWjQTF3X
         mcxL7MwRwWjE7/kNyg0SwKTCGNwX0AM+KYm5wpcZo9POOifTV1wt8/LHZIvAPatiU+g1
         hYGw==
X-Forwarded-Encrypted: i=1; AFNElJ9PV0uhwW63zZhSL4QL1eHrPU8CXxstX8KHC+c0xDJWaGo92nkTiVwzzE6UrwOMrxSdKhcV/YKw@lists.infradead.org
X-Gm-Message-State: AOJu0YzSxWCv2FRClOpsRRZkI/zYt2rcRczn+kX7m7mumox6LcOvRJN7
	oLEFofuLz80QaiL4xRI1R4RF6ZxSuiKAzdl69yVEeJgP8dx0ezUFQUnGFtyWYtW9yCgvel2EunE
	gE50lvTJ7pvCCTfbA7j/EMLmkH3eASau590G0GyEoBQ==
X-Gm-Gg: Acq92OHz/R/KwFActL+/AnoCRRjkpTmG5mRwHZ25mw25Exd6GCGzVDAdLV45Af0KQUc
	fKRFrCcUjk0yFXP+a8oWibDYsTo5322RY3r6Bk8nUq98PaIjJ7KgQS6IkPkbKU6OgLqxl/giKgY
	Nh+4OyiWI8lYOftdXQ7ryzlT07m4iNSrqa/p0qW7YpXTFz9WxhWzRobR1O9v55FrNoNtc+ZYvjG
	6Ry7S3QM79GYe+2/N812lWr+qzVqwscuzvhUGU9nkRpu8ncL/Se/bei4bd9sCnr60LMxjxb89mP
	DbGPJ5+LhNfpT2hj1KVRUAVGc2gSHuUjcFai52s+zDf+T7uv4bjj4M+KMBtp6caXvfkZk7Ph3Zh
	R75CTVy5WDm4bIzL6rV/u/A5QlA==
X-Received: by 2002:a05:6820:81ce:b0:694:96ff:d4b with SMTP id
 006d021491bc7-69b78d8f437mr1200037eaf.26.1778659046551; Wed, 13 May 2026
 00:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260513071418.50957-1-dave.patel@riscstar.com> <20260513071418.50957-4-dave.patel@riscstar.com>
In-Reply-To: <20260513071418.50957-4-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 May 2026 13:27:15 +0530
X-Gm-Features: AVHnY4LrwHnVAmBdJsHR2gQtVHiu_qfiVwcLNK-sSYxYIQ5j-SZpto9HJfqCF3Q
Message-ID: <CAAhSdy10mKDQHczcHz-7JGaiYHVL=LOzOi+_=G=XNJhuX2y1Rg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_005727_813354_F94A512C 
X-CRM114-Status: GOOD (  25.43  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTI6NDTigK9QTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBUaGlzIHBhdGNoIGFkZHMgcHJvcGVyIHN1cHBvcnQgZm9yIHBlci1kb21haW4gZmxvYXRp
bmctcG9pbnQgKEZQKSBhbmQKPiB2ZWN0b3IgKFYpIGNvbnRleHRzIGluIHRoZSBkb21haW4gY29u
dGV4dCBzd2l0Y2ggbG9naWMuIEVhY2ggZG9tYWluCj4gbm93IG1haW50YWlucyBpdHMgb3duIEZQ
IGFuZCB2ZWN0b3Igc3RhdGUsIHdoaWNoIGlzIHNhdmVkIGFuZCByZXN0b3JlZAo+IGR1cmluZyBk
b21haW4gc3dpdGNoZXMuCj4KPiBDaGFuZ2VzIGluY2x1ZGU6Cj4KPiAtIEFkZGVkIGBmcF9jdHhg
IGFuZCBgdmVjX2N0eGAgbWVtYmVycyB0byBgc3RydWN0IGhhcnRfY29udGV4dGAuCj4gLSBJbnRy
b2R1Y2VkIGR5bmFtaWMgdmVjdG9yIHN0cnVjdCBhbGxvY2F0aW9uIGZvciB2bGVuYiBpbiAnc3Ry
dWN0IGhhcnRfY29udGV4dCcKPiAgIHRvIGFsbG9jYXRlIGFuZCBmcmVlIHBlci1kb21haW4gRlAg
YW5kIHZlY3RvciBjb250ZXh0Lgo+IC0gTW9kaWZpZWQgYHNiaV9kb21haW5fcmVnaXN0ZXIoKWAg
dG8gaW5pdGlhbGl6ZSBGUC9WZWN0b3IgY29udGV4dCBwZXIgZG9tYWluLgo+IC0gVXBkYXRlZCBg
c3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoKWAgdG8gc2F2ZS9yZXN0b3JlIEZQIGFuZCB2
ZWN0b3IKPiAgIGNvbnRleHRzIHNhZmVseToKPiAgICAgLSBFbnN1cmVzIEZTL1ZTIGZpZWxkcyBp
biBgbXN0YXR1c2AgYXJlIGVuYWJsZWQgKHNldCB0byBJbml0aWFsKSBvbmx5IGlmIE9mZi4KPiAt
IEFkZGVkIHJ1bnRpbWUgY2hlY2tzIGZvciBGUCBhbmQgdmVjdG9yIGV4dGVuc2lvbnMgd2hlcmUg
bmVlZGVkLgo+Cj4gVGhpcyBpbXByb3ZlcyBzdXBwb3J0IGZvciBtdWx0aS1kb21haW4gc3lzdGVt
cyB3aXRoIEZQIGFuZCBWZWN0b3IKPiBleHRlbnNpb25zLCBhbmQgcHJldmVudHMgY29ycnVwdGlv
biBvZiBGUC9WZWN0b3Igc3RhdGUgZHVyaW5nIGRvbWFpbgo+IHN3aXRjaGVzLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGlu
Y2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgfCAgMiArKwo+ICBsaWIvc2JpL3NiaV9kb21haW5f
Y29udGV4dC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlf
ZG9tYWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBpbmRleCA4ODJiNjJjMi4uMDVh
NWQ4NmMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gKysrIGIvaW5j
bHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTE2LDYgKzE2LDggQEAKPiAgI2luY2x1ZGUgPHNi
aS9zYmlfaGFydG1hc2suaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluX2NvbnRleHQuaD4K
PiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluX2RhdGEuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlf
dmVjdG9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2ZwLmg+Cj4KPiAgc3RydWN0IHNiaV9zY3Jh
dGNoOwo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgYi9saWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4gaW5kZXggMTU4ZjQ5OTAuLjVlMTgwNjk4IDEwMDY0
NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiArKysgYi9saWIvc2JpL3Ni
aV9kb21haW5fY29udGV4dC5jCj4gQEAgLTE4LDYgKzE4LDkgQEAKPiAgI2luY2x1ZGUgPHNiaS9z
YmlfZG9tYWluX2NvbnRleHQuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPiAg
I2luY2x1ZGUgPHNiaS9zYmlfdHJhcC5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV92ZWN0b3IuaD4K
PiArI2luY2x1ZGUgPHNiaS9zYmlfZnAuaD4KPiArCj4KPiAgLyoqIENvbnRleHQgcmVwcmVzZW50
YXRpb24gZm9yIGEgaGFydCB3aXRoaW4gYSBkb21haW4gKi8KPiAgc3RydWN0IGhhcnRfY29udGV4
dCB7Cj4gQEAgLTU1LDYgKzU4LDExIEBAIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+ICAgICAgICAg
c3RydWN0IGhhcnRfY29udGV4dCAqcHJldl9jdHg7Cj4gICAgICAgICAvKiogSXMgY29udGV4dCBp
bml0aWFsaXplZCBhbmQgcnVubmFibGUgKi8KPiAgICAgICAgIGJvb2wgaW5pdGlhbGl6ZWQ7Cj4g
Kwo+ICsgICAgICAgLyoqIGZsb2F0IGNvbnRleHQgc3RhdGUgKi8KPiArICAgICAgIHN0cnVjdCBz
YmlfZnBfY29udGV4dCBmcF9jdHg7Cj4gKyAgICAgICAvKiogdmVjdG9yIGNvbnRleHQgc3RhdGUg
Ki8KPiArICAgICAgIHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKnZlY19jdHg7Cj4gIH07Cj4K
PiAgc3RhdGljIHN0cnVjdCBzYmlfZG9tYWluX2RhdGEgZGNwcml2Owo+IEBAIC0xNDMsNiArMTUx
LDE1IEBAIHN0YXRpYyBpbnQgc3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoc3RydWN0IGhh
cnRfY29udGV4dCAqY3R4LAo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2Ny
YXRjaCwgU0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+ICAgICAgICAgICAgICAgICBjdHgtPnNybWNm
ZyAgICAgPSBjc3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5zcm1jZmcpOwo+Cj4gKyAgICAg
ICAvKiBNYWtlIHN1cmUgRlMgYW5kIFZTIGlzIG9uIGJlZm9yZSBjb250ZXh0IHN3aXRjaCAqLwo+
ICsgICAgICAgY3NyX3NldChDU1JfTVNUQVRVUywgTVNUQVRVU19GUyB8IE1TVEFUVVNfVlMpOwo+
ICsKPiArICAgICAgIC8qIEVhZ2VyIGNvbnRleHQgc3dpdGNoIEYgYW5kIFYgKi8KPiArICAgICAg
IHNiaV9mcF9zYXZlKCZjdHgtPmZwX2N0eCk7Cj4gKyAgICAgICBzYmlfZnBfcmVzdG9yZSgmZG9t
X2N0eC0+ZnBfY3R4KTsKPiArICAgICAgIHNiaV92ZWN0b3Jfc2F2ZShjdHgtPnZlY19jdHgpOwo+
ICsgICAgICAgc2JpX3ZlY3Rvcl9yZXN0b3JlKGRvbV9jdHgtPnZlY19jdHgpOwo+ICsKPiAgICAg
ICAgIC8qIFNhdmUgY3VycmVudCB0cmFwIHN0YXRlIGFuZCByZXN0b3JlIHRhcmdldCBkb21haW4n
cyB0cmFwIHN0YXRlICovCj4gICAgICAgICB0cmFwX2N0eCA9IHNiaV90cmFwX2dldF9jb250ZXh0
KHNjcmF0Y2gpOwo+ICAgICAgICAgc2JpX21lbWNweSgmY3R4LT50cmFwX2N0eCwgdHJhcF9jdHgs
IHNpemVvZigqdHJhcF9jdHgpKTsKPiBAQCAtMTcwLDYgKzE4NywxMCBAQCBzdGF0aWMgaW50IGhh
cnRfY29udGV4dF9pbml0KHUzMiBoYXJ0aW5kZXgpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBoYXJ0
X2NvbnRleHQgKmN0eDsKPiAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb207Cj4gKyAgICAg
ICB1bnNpZ25lZCBsb25nIHZsZW5iID0gdmVjdG9yX3ZsZW5iKCk7Cj4gKwo+ICsgICAgICAgLyog
Q2FsY3VsYXRlIHNpemU6IGJhc2Ugc3RydWN0ICsgMzIgcmVnaXN0ZXJzIG9mIHZsZW5iIHNpemUg
Ki8KPiArICAgICAgIHNpemVfdCB2ZWNfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qgc2JpX3ZlY3Rvcl9j
b250ZXh0KSArICgzMiAqIHZsZW5iKTsKCkNhbGwgdmVjdG9yX3ZsZW5iKCkgYW5kIGFsbG9jYXRl
IHZlY19jdHggb25seSB3aGVuCnVuZGVybHlpbmcgSEFSVCBoYXMgU0JJX0hBUlRfRVhUX1YuCgo+
Cj4gICAgICAgICBzYmlfZG9tYWluX2Zvcl9lYWNoKGRvbSkgewo+ICAgICAgICAgICAgICAgICBp
ZiAoIXNiaV9oYXJ0bWFza190ZXN0X2hhcnRpbmRleChoYXJ0aW5kZXgsCj4gQEAgLTE4MCw2ICsy
MDEsMTMgQEAgc3RhdGljIGludCBoYXJ0X2NvbnRleHRfaW5pdCh1MzIgaGFydGluZGV4KQo+ICAg
ICAgICAgICAgICAgICBpZiAoIWN0eCkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VOT01FTTsKPgo+ICsgICAgICAgICAgICAgICAvKiBBbGxvY2F0ZSB0aGUgdmVjdG9yIGNv
bnRleHQgcG9pbnRlciAqLwo+ICsgICAgICAgICAgICAgICBjdHgtPnZlY19jdHggPSBzYmlfemFs
bG9jKHZlY19zaXplKTsKPiArICAgICAgICAgICAgICAgaWYgKCFjdHgtPnZlY19jdHgpIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBzYmlfZnJlZShjdHgpOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiBTQklfRU5PTUVNOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICAgICAg
ICAgICAgICAgICAvKiBCaW5kIGNvbnRleHQgYW5kIGRvbWFpbiAqLwo+ICAgICAgICAgICAgICAg
ICBjdHgtPmRvbSA9IGRvbTsKPiAgICAgICAgICAgICAgICAgaGFydF9jb250ZXh0X3NldChkb20s
IGhhcnRpbmRleCwgY3R4KTsKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgpSZWdhcmRzLApBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
