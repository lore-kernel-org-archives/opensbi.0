Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBFBC369B2
	for <opensbi@archiver.kernel.org>; Mon, 14 Apr 2025 12:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulXkfYk6OPQzE3Ub1dkHqQVuGUM31FrnnANVP71SqDs=; b=wG8ZtbGPNfdQDb
	9+sKcrGSaIC5PdHTQs+k5Ip4ycbaSnPehYuMiGa9zVmUXRx7mYzT0h/EXVWbswEhbhtD7iiDWMh/L
	+CZHpxOF5cIJjCnwGnyNmt8M83WahQGupiXV+m28vCTMzjjcQGvom2wo1RhCXGxt+0LmBrJ/lwYBi
	xiAx3NNqsnNdmQ6boqXoH2UU3hQiYYSlw/KkpVRWWkCbPZL9EY8RwYNuWuoVqpQQ1+dbQ7UQ9YD5x
	E3mA7WfvwacHvk09pzumPtSFvsE28Ut7gcTw/ymICpZpszMealeUhcgtU3cucQZjOX04gDeHSFgKW
	df6+lY3JrUhn834CSSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4IyZ-00000001wxl-3HOC;
	Mon, 14 Apr 2025 12:31:47 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ix6-00000001wkf-0vxG
	for opensbi@lists.infradead.org;
	Mon, 14 Apr 2025 12:30:17 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d46aaf36a2so36393125ab.3
        for <opensbi@lists.infradead.org>; Mon, 14 Apr 2025 05:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1744633815; x=1745238615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLdtAcNsUWDA1HwCyKNxefLVi5ZFHNq6XQXB0gHMTNc=;
        b=sJaDNfGbPznCSp/TqwPEXFQmkSpsi8nJFXNubp+4lifymALcOUZZ4+7E4W3MFfQfGM
         RMhdbLA6PdXZAB9i6aYUNbweujh+Eck0VVMSK6jsKUE+5MsCVgga6PfwurwuPB3YJtA4
         yfd1em+mp33MRc8fHSjXvgMztauROUWr0bjb4drLtvjqo0B6eOA1VZ3ye3Iyhfkb5dUB
         HaZcayoo4+Qjw8+CrdSFdxJRVluudTH9Xm2WLGZZn0D7m7sgjxhjY+wQy7KV1e8domdK
         oP0AimDohgmOCxjTnTA3dkUbg82b8xXyBo+wdlYCmph/vGfJ9P9HVJ/i2iPFThaY9QK7
         e13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744633815; x=1745238615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLdtAcNsUWDA1HwCyKNxefLVi5ZFHNq6XQXB0gHMTNc=;
        b=k99uYW1zXu/ECvqdIBCWXo50vxF/euSVfC93r1aPrd25H31vZaF6Ki3G1XRCB+va25
         3wk5zbxNhuI1FT5/fXW2QfvCIcOMX/iIKRcIoFTKC5RKPvDY1ZyLQWa+yuZbCw/ct05c
         tPaPIlhc6JNpTNHHstZy4Fx/wbPstyeelXyJ76dX2PwjgXuvcRHavIigcWTIxwCIrnrm
         QTEMankRdurC1AG/4jZtOHNg/ZYdji6gjnDTdLt5pWU02XDLGmmXKK0qqvN/stKk95z0
         0TTo9CPylb2ymqN+OqcL2b14H6K2x1JucGPSBbUeErkDOBK2O2yLuxs3upurVHkwsPyH
         p8aA==
X-Gm-Message-State: AOJu0YyTkNdWBNBMtqAmA2hEi3JXsNky9cPVh+eDevN+uN34jKye/C5W
	VjV97tylQ5IGepKOjaWKhfwqiuF+OLfeOHZaTOUdia3AGkIYuQqq1W7DpgaPRh3K3ptwhshWcIT
	WbvXgoO7pH77wD/RoY/GuFxkmUbVWyApWrv6JgkRCE/vOzTth
X-Gm-Gg: ASbGncvIW4C5KfcdjGpO9OSnD5SzsbsAYGHLYHGPg6FgrFCQaP9dS/4/po0eUsG9bts
	mewOPeFTN5r13Ijhe1tAwZ6E9tegiCrxuCnzQfzAysU2ZYNbx77uSQ5NCxrRjGrET7mRKHpjbe0
	WC1JHCLI0ga39E0bH7rNnbxA==
X-Google-Smtp-Source: AGHT+IEe2100vVZRFElLct+pxU6Ad5gq//AxdLHnracTtViVfHKdEq0RvbrJ5MElvQtBV7TfQsmAotNeHowAhm6G1sw=
X-Received: by 2002:a05:6e02:1a0b:b0:3d1:92fc:fb45 with SMTP id
 e9e14a558f8ab-3d7ec1e9540mr118087235ab.5.1744633815136; Mon, 14 Apr 2025
 05:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250328084142.540807-1-ycliang@andestech.com>
In-Reply-To: <20250328084142.540807-1-ycliang@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Apr 2025 18:00:04 +0530
X-Gm-Features: ATxdqUHDtVgY2pnYMIDwDhDuEP24BgK8ecu8Xm5kMjBLUxAFA05khVvTiNW99fM
Message-ID: <CAAhSdy0zAzp=FU2EQ19T0SS-H9423H4ZbekTyqH9_-D4bnn0uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] lib: sbi: Allow programmable counters to monitor
 cycle/instret events for Andes PMU
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053016_263193_2B6665F0 
X-CRM114-Status: GOOD (  17.27  )
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

T24gRnJpLCBNYXIgMjgsIDIwMjUgYXQgMjoxMuKAr1BNIExlbyBZdS1DaGkgTGlhbmcgPHljbGlh
bmdAYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBSZWZlcmVuY2luZyBjb21taXQgMGMzMDRiNjYx
OTY1Cj4gKCJsaWI6IHNiaTogQWxsb3cgcHJvZ3JhbW1hYmxlIGNvdW50ZXJzIHRvIG1vbml0b3Ig
Y3ljbGUvaW5zdHJldCBldmVudHMiKQo+IHRvIHN1cHBvcnQgdGhpcyBmdW5jdGlvbmFsaXR5IGZv
ciBBbmRlcyBQTVUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMZW8gWXUtQ2hpIExpYW5nIDx5Y2xpYW5n
QGFuZGVzdGVjaC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9s
bGFuZEBzaWZpdmUuY29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2Jp
IHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gQ2hhbmdlIHNpbmNlIHYxOgo+ICAgICAgICAg
LSBNb2RpZnkgdGhlIGNvbW1lbnQKPiAtLS0KPiAgbGliL3NiaS9zYmlfcG11LmMgfCA3ICsrKyst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9wbXUuYyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gaW5k
ZXggYjllODQ1NDMuLjU3NTc5OWViIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4g
KysrIGIvbGliL3NiaS9zYmlfcG11LmMKPiBAQCAtNzE5LDEyICs3MTksMTMgQEAgc3RhdGljIGlu
dCBwbXVfY3RyX2ZpbmRfaHcoc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPgo+ICAgICAgICAgLyoqCj4gLSAgICAgICAg
KiBJZiBTc2NvZiBpcyBwcmVzZW50IHRyeSB0byBmaW5kIHRoZSBwcm9ncmFtbWFibGUgY291bnRl
ciBmb3IKPiAtICAgICAgICAqIGN5Y2xlL2luc3RyZXQgYXMgd2VsbC4KPiArICAgICAgICAqIElm
IFNzY29mcG1mIG9yIEFuZGVzIFBNVSBpcyBwcmVzZW50LCB0cnkgdG8gZmluZAo+ICsgICAgICAg
ICogdGhlIHByb2dyYW1tYWJsZSBjb3VudGVyIGZvciBjeWNsZS9pbnN0cmV0IGFzIHdlbGwuCj4g
ICAgICAgICAgKi8KPiAgICAgICAgIGZpeGVkX2N0ciA9IHBtdV9jdHJfZmluZF9maXhlZF9odyhl
dmVudF9pZHgpOwo+ICAgICAgICAgaWYgKGZpeGVkX2N0ciA+PSAwICYmCj4gLSAgICAgICAgICAg
IXNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTQ09GUE1GKSkK
PiArICAgICAgICAgICAhc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9F
WFRfU1NDT0ZQTUYpICYmCj4gKyAgICAgICAgICAgIXNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2Ny
YXRjaCwgU0JJX0hBUlRfRVhUX1hBTkRFU1BNVSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBw
bXVfZml4ZWRfY3RyX3VwZGF0ZV9pbmhpYml0X2JpdHMoZml4ZWRfY3RyLCBmbGFncyk7Cj4KPiAg
ICAgICAgIGlmIChzYmlfaGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJ
Vl9WRVJfMV8xMSkKPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0
Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
