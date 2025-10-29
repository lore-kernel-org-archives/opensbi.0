Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4292FCCF9E9
	for <opensbi@archiver.kernel.org>; Wed, 29 Oct 2025 03:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82jJ3fqvroVoz8NaaLxsjy46Bqh5N7Fwl4wCkUv+DCc=; b=puc5KZ8rPXIezG
	sGONCanC0sBfrBz/4hOkW9R0waPgYHwdasWLZZD18k7Er3/TiObKXjEo0N6GE6oYz74Euwarqadlv
	6zVddQvIH5dh7OZt7gmUq4ss3WmZVREJv+dTorwUmiSYLUvfSTtBru1XnNRQ2X1hua5Y23Y0KOPY7
	7CDUdeY6Oq+SzR/71K9no+9AQoK5Nm2LF5G3ozWuFaFmS7CXkt2jd08VyRS2EjjaBfgqS+pfDgV2l
	LPI6p6shQ38j7SHeqtrQJ1fqdgcWzu9sS6HxUiS/fj5IDWREq0ibE0QeTzECsJQuvKdXnuY1uC4yG
	vHudAU0BqJBXANZ9d5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDxDo-0000000H5Ay-026I;
	Wed, 29 Oct 2025 03:51:40 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDxDl-0000000H59p-2kI7
	for opensbi@lists.infradead.org;
	Wed, 29 Oct 2025 03:51:38 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-3d3116a5a26so2396073fac.3
        for <opensbi@lists.infradead.org>; Tue, 28 Oct 2025 20:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761709896; x=1762314696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VnaKLDqkjslrrGcedqtweU7h5vja8kdSQEEMGDD/GI=;
        b=pD1isFDClCbgDjXYL3IrX6zrQDpf6miJ+Bq5sBhPg0kT2Ku0ySK7txusofhX8GV3QM
         wa0yMkJMePA329TUGjUSj7q028I7D6OGC8XJJ7F0qIfCyesEcZl+pfosXXuG6aMy3kVG
         ZoDk4cWZr3MDG1lRYqifi6ZL2Q6jt5FMNh2iAYkae7NGg7yhww0iTRQ8b8ISYZ5TbdAf
         CeGT/vubZiIlAMnA5J0AvtJuqSZyTtOPnNyb1qaVt5JEpi67L02QmegUEPR68CvuZrYu
         Xwn7Ux3zziE51pgBI24Kb3/ohDo/ZXuP75SAqiLnBNvZSSFiy57DGx6nsmKcka7bRqCy
         SIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761709896; x=1762314696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VnaKLDqkjslrrGcedqtweU7h5vja8kdSQEEMGDD/GI=;
        b=dA9B9KTnxiryOz4Jw+QyFiAZJVNK7DU/LD69LVnypMr/HvM3lXs3BqGQDhjqQNk2yL
         aEshAX21iBtkjEoeaqOrZxsq8ExL3m4Aev2/mGCkruKHI/XCluRspH+5B4TXk+KrqCuu
         flkBRAEVTPGheQtCZipXqONElQRXVOYAAuB6ZlH0lyLL/vQ+KZXZ1mv5Uq4aztIb+MPo
         /+ZD7sJfHCIVCByxq+BO5tc3x4IqHaOoRi3TnWdHGyspJpHqorDw1/869zSHZIgXBEag
         lEKO/j35T64u3LPRPzPHawmfCWaP87fwxG1HrJUX0VpKYRjQgdp2RhDUH1LB5+oC8+Lo
         X4yA==
X-Forwarded-Encrypted: i=1; AJvYcCWq+puoPbH3jbcp1s5X+aOUCUR93RqXI7axKLA1GYBXsEzsb7vtepUBoGYklv8+psxQ4vLxzl65@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl18Q+l4+9rO2qv5NNGFj8GWQgcstmW62c4eoruj1mBnPTEvdk
	En0DmIl6TkqnXy+pBwQLEgr67ZLdzsZRtJPdxwwJ5DJx98YSL0AjMX46kl5dH0F0ebQqqErBEAo
	nNZ/stfZP6gjkx0X8hXy18vQRObGO1zSQXkEZLlBwxg==
X-Gm-Gg: ASbGncuUbaw6OZuZxSw8Deni9UUTniQyFVFpLHpUhZLXSdtQI5Fc5lI2DGFf8VHoxfy
	KIdVURl/V232Wnsd72gYN5+ZGCKHwkPLkhh7AKV8FinUxv4p8PZp70epiEqX94BsQD86qoEOwIL
	xtxuUj+2QliTEqNm7219gSkFpU5Rfosq+WQC9Rsjmy1c/TvhNheKT0Ii3ASFNqIfwNaEOtaHRBu
	7+dJUbCpRG7JJL/U/XdPX3iMvP+t/fT8g9oLk+P5JQ03E9CuqH08Sv3tOEQd39Suo0RlFkp/++E
	PUguJwdd9RDNX/s3mgiSHx2tJzvwQL9dxBB1J/qfMhn+bUeJSlO4Trn8yIrs/4lEH1AX1wr4fA0
	SpJcXQmxur0Wwv/xVthqP2795Dw75qslIB1c=
X-Google-Smtp-Source: AGHT+IFpPnGrPETKSUEORYhIKDHXnPe/5E6NxHgHYrj1nuqll8h5bB+J1bn3fLIpeiZbumtMe34vvAQB0YzcsrHALvw=
X-Received: by 2002:a05:6870:5491:b0:36c:abe0:83d3 with SMTP id
 586e51a60fabf-3d7487b19c5mr755303fac.39.1761709896578; Tue, 28 Oct 2025
 20:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251013153138.1574512-1-joshua.yeong@starfivetech.com> <20251013153138.1574512-3-joshua.yeong@starfivetech.com>
In-Reply-To: <20251013153138.1574512-3-joshua.yeong@starfivetech.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Wed, 29 Oct 2025 09:21:00 +0530
X-Gm-Features: AWmQ_blC-1M8YiTxPMZWNtGVrnLlnzRs-YjeDRhRgYQL1dFB-ugIWGflKj3vpGs
Message-ID: <CA+Oz1=b+V0jG09wqADVhzjAd9fbiqy7GjvTyrjbmwx9YLmbPzQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] lib: utils: Add MPXY RPMI mailbox driver for device power
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: atishp@atishpatra.org, opensbi@lists.infradead.org, 
	apatel@ventanamicro.com, leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_205137_697389_EA469133 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgOTowMuKAr1BNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIE1QWFkgUlBNSSBtYWlsYm94IGRy
aXZlciBmb3IgZGV2aWNlIHBvd2VyLgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIFllb25nIDxq
b3NodWEueWVvbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMv
bWFpbGJveC9ycG1pX21zZ3Byb3QuaCAgICB8IDQ1ICsrKysrKysrKysrKysrKysrCj4gIGxpYi91
dGlscy9tcHh5L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKwo+ICBsaWIvdXRp
bHMvbXB4eS9mZHRfbXB4eV9ycG1pX2RldmljZV9wb3dlci5jIHwgNTUgKysrKysrKysrKysrKysr
KysrKysrCj4gIGxpYi91dGlscy9tcHh5L29iamVjdHMubWsgICAgICAgICAgICAgICAgICAgfCAg
MyArKwo+ICBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgIHwgIDEg
Kwo+ICA1IGZpbGVzIGNoYW5nZWQsIDEwOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2RldmljZV9wb3dlci5jCj4KCkxHVE0K
ClJldmlld2VkLWJ5OiBSYWh1bCBQYXRoYWsgPHJwYXRoYWtAdmVudGFuYW1pY3JvLmNvbT4KCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
