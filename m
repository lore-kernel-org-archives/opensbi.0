Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17F1CA0EFA
	for <opensbi@archiver.kernel.org>; Tue, 26 Aug 2025 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv6ZY8WbCNdYovl8JZROGcP6wbqyotWO+TIfM7jlWKY=; b=sBguopvzcdNgFU
	kZmVnyGqgCDGuq1z7rZ+F00xahjFgIX84A7Kjk4/KrByHlYxQMykqFZAdbibm/C3QT6P31CeeauQT
	b+INEhQ4vnmhO6xfiOXEfD++uX8iODWsUYPkcYCTgTyEXKRZa6o4Kt8ou+mPNMsAIl+tuDE8CcNDC
	saW1whaT4XtNUtHbSWmih1jE/zC9Rg0xJrv/ZWsZMNhWgjru+99TRih3j+6hMnTIzrxq3OqRbv+Hn
	j9iX+xUBvWGjvEoIkOJ+AUMmIB7oX8xWAUxsUjM//Rcpm/h4r9yROOIMrKtiACsX9LJ9IY2/63WeJ
	x8NZhQmM2kvrzhHobrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpM4-0000000B6AG-1pgg;
	Tue, 26 Aug 2025 08:48:36 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpEC-0000000B3mS-1FmI
	for opensbi@lists.infradead.org;
	Tue, 26 Aug 2025 08:40:29 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-886dd6e5c2dso157391239f.3
        for <opensbi@lists.infradead.org>; Tue, 26 Aug 2025 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756197627; x=1756802427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubPYOfROAndEmBXRLcGLgOYsqDqisnWF14YwH+w+8EY=;
        b=0SfoiXYo4lL7EFvhn9S1KnmTSIuezC/8cYurMKMFgsKyPTgSZwtWp6AZlytwuvpOSe
         K3Yfh1Wmgj9KFxv0Puv4oTSLWP4XRqZQKDR+cAd8waajLNwm7QoVxC9vooQTzR6dwkoj
         9gjKXLA+UoUqon4TAjmHfRa9N3c94e0swMFBMS5gZmcSg39ZMVX1Fmf9v0yoivRmnfJM
         Zle7fjWCeWUymO//hplWyF5OCxMuG3x0//ds6G3n8T1a+IuiG/JX7/b6cu1UZnB0E5H8
         B41/PTTa5Ro7x80nmtEfY2UTgu6rYEL2mNt68D/rkYRoRxcOzDHDwDbJaHjRkRYHPfmf
         Q3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197627; x=1756802427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubPYOfROAndEmBXRLcGLgOYsqDqisnWF14YwH+w+8EY=;
        b=l3DyRlXzntwvJf6SmFBjZRPmDg5mmQ2YVHg4QIz5mGR7t3YAtNdbkIOfWQ/V31/qIi
         IchtjnrbDWDXJms/ZNV35DfrVsXRSqWg6Bv5EKp/aM8rdbIP+7Ja1cXYa3Fg23woTi8+
         C2ajygSG6K0NosNxtSD9BW/AnvEK/pOpqx7LwhaYf6TJtbgbVLQPxnWc2DVcn3TcWb5L
         MFCwQfOkmOP67/KRu0cSsgfGvH/BkZrAdxezvn4vtHi0IMmooBDPpxHImzK1RuM+1QCZ
         A5bUV+qUJicFLE0ongM7jkNmKMJO20Z1cap8IBvPo7GTv3L0t++8G9F/r30G7zGEHZnH
         kCaQ==
X-Gm-Message-State: AOJu0YzvBHiGzMw6J4O2YFWqWTN1BCSIMIuYvzNyth5z8CSstxhsB2pb
	V8A5tluWxNKe0QLKXGWHlIFaW+n9vOBS+BPcJRy4W720URZGC6lp+iT7yE/vVRsTJnjd78j4xcy
	TXvxZtggie5+5L1+oakskl6WluNptNzmWgv/roqmNlw==
X-Gm-Gg: ASbGncvEuHV+3V/eyiwnrSdZVdU5VbgpZDpUJ8pxSkwikfGgo5Calplg8CMs3OxFH8t
	4R+XYZ3BTVrMRdCXvkY14R4WVOPTEPSjScicbaoCBE7Esm+IeDIfHUFx4JfjlD/B8jFjnZvPsUN
	6QbHahmt6amTYRL3riyBW4g5roLC6FNEOt/LPSWZHj+dIHtkuxobEOZaCfd6Bmf64QSf7rn8b+t
	AvvPVHQ
X-Google-Smtp-Source: AGHT+IFFbTXZrpWUgQDkOggpYMRfjqlJSdlUnj1Z3HZLPCr1lw4hLlthbGmKkNseT+gDB9gjkWhD5oJamXy9wi5QwTM=
X-Received: by 2002:a05:6e02:164d:b0:3e5:8169:e14 with SMTP id
 e9e14a558f8ab-3e921a5d17bmr70394605ab.12.1756197627291; Tue, 26 Aug 2025
 01:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250820033250.544-1-nick.hu@sifive.com> <20250820033250.544-7-nick.hu@sifive.com>
In-Reply-To: <20250820033250.544-7-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Aug 2025 14:10:15 +0530
X-Gm-Features: Ac12FXz4CAaUHSgRtguYOfgxkcJiyXiPfo_EwKUZt-Tnn3z7azW_XP8PjIhO7qc
Message-ID: <CAAhSdy30VWfob_xay4w34AAOD5TEfu5f--2D9knZ8r6kQfLQyw@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] lib: sbi: Add SiFive proprietary xsfcease
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_014028_336610_8FA1510F 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: vincent.chen@sifive.com, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgOTowM+KAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBVc2luZyBJU0Egc3RyaW5nICJ4c2ZjZWFzZSIgdG8gZGV0ZWN0IHRo
ZSBzdXBwb3J0IG9mIHRoZSBjdXN0b20KPiBpbnN0cnVjdGlvbiAiQ0VBU0UiLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBDeWFu
IFlhbmcgPGN5YW4ueWFuZ0BzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgaW5jbHVk
ZS9zYmkvc2JpX2hhcnQuaCB8IDIgKysKPiAgbGliL3NiaS9zYmlfaGFydC5jICAgICB8IDEgKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gaW5kZXggZmRjZjQw
MGEuLmZmNjgyZmI0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiArKysg
Yi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gQEAgLTgzLDYgKzgzLDggQEAgZW51bSBzYmlfaGFy
dF9leHRlbnNpb25zIHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9TU1NUQVRFRU4sCj4gICAgICAg
ICAvKiogSGFydCBoYXMgWHNmY2ZsdXNoZGxvbmUgZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklf
SEFSVF9FWFRfWFNJRklWRV9DRkxVU0hfRF9MMSwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBYc2Zj
ZWFzZSBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9YU0lGSVZFX0NFQVNFLAo+
Cj4gICAgICAgICAvKiogTWF4aW11bSBpbmRleCBvZiBIYXJ0IGV4dGVuc2lvbiAqLwo+ICAgICAg
ICAgU0JJX0hBUlRfRVhUX01BWCwKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIv
bGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggNDE2MGFkNmMuLjI1MTlmM2YwIDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC03
MTYsNiArNzE2LDcgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9oYXJ0X2V4
dFtdID0gewo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzc2N0ciwgU0JJX0hBUlRfRVhU
X1NTQ1RSKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3NzdGF0ZWVuLCBTQklfSEFS
VF9FWFRfU1NTVEFURUVOKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoeHNmY2ZsdXNo
ZGxvbmUsIFNCSV9IQVJUX0VYVF9YU0lGSVZFX0NGTFVTSF9EX0wxKSwKPiArICAgICAgIF9fU0JJ
X0hBUlRfRVhUX0RBVEEoeHNmY2Vhc2UsIFNCSV9IQVJUX0VYVF9YU0lGSVZFX0NFQVNFKSwKPiAg
fTsKPgo+ICBfU3RhdGljX2Fzc2VydChTQklfSEFSVF9FWFRfTUFYID09IGFycmF5X3NpemUoc2Jp
X2hhcnRfZXh0KSwKPiAtLQo+IDIuMTcuMQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
