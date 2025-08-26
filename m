Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C44CCA0FE9
	for <opensbi@archiver.kernel.org>; Tue, 26 Aug 2025 08:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZC2rnS0omA+4tOY9pcuzAN9IEtPBEWWsNaLGyJYxqY=; b=wfHe4DSXzrncvt
	8ZmaLpDXfPk3sNDQPsJGrSZPwkc1ZmIWSFDlNZBebTq2ca9Y6dYG1v6gKBIfxcfulU1UHFGHz5xQX
	HQYPvevFql0pnL9Ro9qUpJi3nAd9KUDDiRQQIRWY1wOUXLj9rV5couX70meIZXzTDM/Ugq07ZS5YQ
	e9EuNsBYcugSqjIMSesDZ7MtJmQ0L+qavP0lHuibILYrBFMU0AuvDybvDF6NrDVWAfWVekIjjcTQz
	QyZRssCOiR0SGJhLMfPghZbtSglPlC1YK9RxuSNP9dHYcJGV0jfU3+8l3N/WSmtlBtL1TQpvivPQr
	4pOBCrNFHH+elEdVsuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpM3-0000000B69c-2eM8;
	Tue, 26 Aug 2025 08:48:35 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpDt-0000000B3fI-2x46
	for opensbi@lists.infradead.org;
	Tue, 26 Aug 2025 08:40:10 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e9e0e38dcdso45754785ab.3
        for <opensbi@lists.infradead.org>; Tue, 26 Aug 2025 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756197608; x=1756802408; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/WE1+rYpwtSnHoEtrraHyASBFhhfdUCGWBg5bbLd98=;
        b=gfHqmlG5hnLvJFkueKmYQZmJZUF6d+OotHBMZexU9lhl6WBabCvjQxQcoWgr5S7gkY
         kt19J+UC3SYo3yoTMpAz/JpIV6ReizQCA4ygcNMOYlm6b6TTQde0JcYwQfvtYTi3zzUT
         OpI6MgZk/Mot2V9wixdWmPdY06ZGQWcV+jsYJ6RWRj419uKKKBBqFe/2y6C/ZyqADhzM
         YJ1aglcJW2LH4pPZEv/gmoFqplL3nsCngUO0H7pnIsPqVji0TuffNltUb4P+Gbhz7kzm
         OyLIFq648E9dhVaBCrPMVEQtLg1mZTIJBXFvEC9rlN+3uSzN3qtk2F1vXM8arnilvonZ
         /WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197608; x=1756802408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/WE1+rYpwtSnHoEtrraHyASBFhhfdUCGWBg5bbLd98=;
        b=N0FJtw5fbBMfUkZJGJBCUcMSlqDfI2F9rxaEz2p+E+XEowC7nDXITH6xnU06fwTuN7
         zWgdRiEyhFMmMEQFsV2VgEC3ROzWhkHDtANKzVPgmO8AHjM1ABLynYk4O3gb2UhAx8f0
         QmSmeZnf5Heoi2+uDLLeU55tdyHlJFRFEmXk6uxiRx7oM42eFZtJeJXMz6OSdcu2Ohmo
         u3MKrLjAjvpP1EpruznEBK7FwGn0hqEQ2TxFaeMCIIvJ7gdSc4nvFsn1I/x/wCmA72I2
         K2+OEz5xlgPDJNG9ss+8L12gVCNQy9J2vBO8Vjteaugx61lI/y/XtUDB+7v8GT/xuIY9
         Ma+Q==
X-Gm-Message-State: AOJu0Yyo/LiV0oYsQLqkl8BqVQQFU9KTGUnKUp68glRfO6SyLEVJMYKN
	jv0hRGxp2rQFX135vE6YWFcl5ICqxsY8/Qe/A+ZFWawvdVwH7XgqQmSgUaHjANAuQRhzFTCK8ZO
	vpYQVqBu5Tp3V4ChfRrdCBUSWGm9orKhRmP5nqnCfew==
X-Gm-Gg: ASbGncu0Ipi35P3Pl8R2e2ruiR4YtDAHh+wMeKv/FqsPti+yhI9mZfmo1sO8vFXpHr1
	aXYNupNzy6MH8mQHkTQfR9QBvyl27GUbkTwoReNeRTzt47cakTCJaKzzU2a5fVCmKUGqy0h6Fm8
	dAaCuHYXrf/ATf8N7ffUdSCZpOGVg4sehuGdn7/ZqZeCJrGwojOaW0Y6eXGA196Hbquvcos72yw
	YZCYiV9
X-Google-Smtp-Source: AGHT+IEKBcDaJPZ67nvfsJPfrLxq290IPALAuq/fHkS2DqjLg/hLVdnQs+nkjo6A8v1rsgj46Gymjs9sHDnKtoD+dNc=
X-Received: by 2002:a05:6e02:3c03:b0:3e8:78b5:6834 with SMTP id
 e9e14a558f8ab-3e91fc22a64mr219887325ab.2.1756197608451; Tue, 26 Aug 2025
 01:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250820033250.544-1-nick.hu@sifive.com> <20250820033250.544-6-nick.hu@sifive.com>
In-Reply-To: <20250820033250.544-6-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Aug 2025 14:09:56 +0530
X-Gm-Features: Ac12FXwEZlIsETlX-pbecbBEqPjC2q7ferAoVLqJeZ7jQH3Kxoix83LlLgrFEuA
Message-ID: <CAAhSdy33NgNSK4hS5rmjPko-m2hNyKPArGBpHEHacJez54dGfw@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] lib: sbi: Add SiFive proprietary xsfcflushdlone
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_014009_834118_EA7CA44D 
X-CRM114-Status: GOOD (  13.99  )
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
LmNvbT4gd3JvdGU6Cj4KPiBVc2luZyBJU0Egc3RyaW5nICJ4c2ZjZmx1c2hkbG9uZSIgdG8gZGV0
ZWN0IHRoZSBzdXBwb3J0IG9mIHRoZQo+IFNpRml2ZSBMMUQgY2FjaGUgZmx1c2ggY3VzdG9tIGlu
c3RydWN0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29t
Pgo+IFJldmlld2VkLWJ5OiBDeWFuIFlhbmcgPGN5YW4ueWFuZ0BzaWZpdmUuY29tPgoKTEdUTS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywK
QW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCB8IDIgKysKPiAgbGliL3NiaS9z
YmlfaGFydC5jICAgICB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlf
aGFydC5oCj4gaW5kZXggODJiMTlkY2YuLmZkY2Y0MDBhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0LmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gQEAgLTgxLDYg
KzgxLDggQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPiAgICAgICAgIFNCSV9IQVJUX0VY
VF9TU0NUUiwKPiAgICAgICAgIC8qKiBIQVJUIGhhcyBTc3N0YXRlZW4gZXh0ZW5zaW9uICoqLwo+
ICAgICAgICAgU0JJX0hBUlRfRVhUX1NTU1RBVEVFTiwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBY
c2ZjZmx1c2hkbG9uZSBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9YU0lGSVZF
X0NGTFVTSF9EX0wxLAo+Cj4gICAgICAgICAvKiogTWF4aW11bSBpbmRleCBvZiBIYXJ0IGV4dGVu
c2lvbiAqLwo+ICAgICAgICAgU0JJX0hBUlRfRVhUX01BWCwKPiBkaWZmIC0tZ2l0IGEvbGliL3Ni
aS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggNmEyZDdkNmYuLjQxNjBh
ZDZjIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2Jp
X2hhcnQuYwo+IEBAIC03MTUsNiArNzE1LDcgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2V4dF9k
YXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbWN0
ciwgU0JJX0hBUlRfRVhUX1NNQ1RSKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3Nj
dHIsIFNCSV9IQVJUX0VYVF9TU0NUUiksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNz
c3RhdGVlbiwgU0JJX0hBUlRfRVhUX1NTU1RBVEVFTiksCj4gKyAgICAgICBfX1NCSV9IQVJUX0VY
VF9EQVRBKHhzZmNmbHVzaGRsb25lLCBTQklfSEFSVF9FWFRfWFNJRklWRV9DRkxVU0hfRF9MMSks
Cj4gIH07Cj4KPiAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhUX01BWCA9PSBhcnJheV9zaXpl
KHNiaV9oYXJ0X2V4dCksCj4gLS0KPiAyLjE3LjEKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
