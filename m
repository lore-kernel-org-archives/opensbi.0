Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE73CAC5BE
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyaVUL/xcUW8UKECUUll0XddxT5NgUL2wz/+n+ckRlY=; b=wjJXKfoKYiyNPU
	BqQpgjOkV/LcdkKCZ6jiaHMggORIGJapPFVPWQUx3jmdo0TfixdJepQCaHEym6rbm3FmhG72Zu59M
	lfji/9hhakl255ezX7fk4SL/fvCESNXBTthR0Sjq4dy2+q7dAFNb4bOt1tHxBE1rtONGulmZWBNF9
	tle+TfrXGRuLBVgLkB/GxXxCkG+t+lKHeFBv01KfKRWxw4AP37virQ68HvIzZ5m7Ezmob9T13TdSj
	WBgDRryFELBDvXxK0FgGAy2M443F4T7vkXGGUag9/YbzYkgVaxQfHHZ05ck9oUQB3tRfdXMm2qPu4
	FFEXHITJCubeyFrK+5bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3c5U-00000005dMD-39S8;
	Tue, 30 Sep 2025 15:16:20 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3c5S-00000005dLm-2pHj
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 15:16:19 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-90926724bceso381651539f.1
        for <opensbi@lists.infradead.org>; Tue, 30 Sep 2025 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759245377; x=1759850177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZI1dcCrEZ+90vAWZTamkVloU0/0pCfpdQ9xjxfxxVwg=;
        b=R1rLL6dD1OWRpI17VPVnN94qiQWsSG5pRY3ceFrAjvgXPOxN62z2aEL67LzzcieyF/
         4vUJn73oL2adScOJdINdcC4Svd2dtYhaFthCsN6Riy/xWBJHhAofAeLBFbpqBxka/A7l
         vvV2H9fh/SMcz3GpXzgI0nypolXTGilEoqhbgPwCmz6p/2mOOJhufgmEMuwPfCb61cE9
         6XdFAoVhGqeIC/0OK6zb3akvgoUQbh//+jR5sikXRm2yQpZtsHknHY01MfOwySB76Dud
         HziHXuB7qLIGM8wrzTJai39ffnZSRAEWYcJCyZF/XylDmOFpHEzFvdxC2WSKq/SeQOsx
         87+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759245377; x=1759850177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI1dcCrEZ+90vAWZTamkVloU0/0pCfpdQ9xjxfxxVwg=;
        b=HMz/8uPn3KMygai7PMrhSW5yJFpnYOJ1ELFUtcxs9nucqDqxd9FtAMpwogaFlrsV69
         yHGi1fgxPZaAknIddFvuP015lKmbxzG2F3AtjxgwWUzSEWfENdVzykFy/fS10AprcCME
         RnvAoKjbL4lNlW1E0nnDv8GHU6+UaUGdal70QStZJbKk7BwcjfZqGJNgpmrkJkh5ZIg4
         8PHPApABRlYDIDyYN3aBpnzh1PaOw7VZpIcOzKfQ0d4PLWZItDRLbYKnKI1VWc+IVz5l
         OHgopY7FtMTQvtdoafEPI04a37EHGVYC4z0cNMfyjxKIlvj43sM/Cf5dGUi+Wpmp4sSd
         N8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcQAqUFctERpUs54J9amd33GYaDF481tmrnQbmUZzBJKchP8xJL1Q2HSdElcIVqG0JqkJddWJz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg/DPn6BKin61y5kyCcAeOB5LnwM5AzJwW3HKi65VyG53Q5Fco
	Femo7KP2uYal7nmsAzost72DIoBE0LHjuLGPF76o7O1Y/rly9+EGLJcW6VBQZ3+CAjb231Osq6E
	/ko9i1aLaQbC0r+Mc9SRybp26hTnIGlOpxerdOt+8ag==
X-Gm-Gg: ASbGncutWTOIFilrSOijdES09rYZW9/g/KG8UnL9oHVTwDwa0B5Lboy82lk9lSgslTE
	5V+Z5ajVm0jQpwZ5uos9wpQUdCuu2/db4rdD2gO6B/B7nLX6r72DrCq7iIscATZa7miHV0fD7Nq
	F2l8mI5I9VeMClbq3ofrn7EivcXV/z4uaw3wNYsONB/X7ksrMWUrqxqDFiD4yDP+17hF1nFgq+k
	TQ7p20U67TOJGYU/UeMW5J1q4B45ISabI3SGH22DFteSstM5CpsP9icUJBsYA==
X-Google-Smtp-Source: AGHT+IFIuUDQvHPAxfVOH/w5kl4NmH7V6+QFHWf3h6noWL1TNECy09FemEoiftUXVc5AexE8Col6l/67AONHqCraOYc=
X-Received: by 2002:a05:6e02:2593:b0:42d:8132:c739 with SMTP id
 e9e14a558f8ab-42d815a0e6amr3884735ab.2.1759245377288; Tue, 30 Sep 2025
 08:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250906053638.69671-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20250906053638.69671-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Sep 2025 20:46:06 +0530
X-Gm-Features: AS18NWDTFROmo8odJmAiDectnPzwzzvMfQCKm69WrgY26JOuHLbun9QcrZIu-b0
Message-ID: <CAAhSdy2Jr+EoW9AZooRDa12Kx9MSSaBaDXbJUoVym1qTt3r0-Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] platform: starfive: jh7110: Add starfive,jh7110s compatible
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Minda Chen <minda.chen@starfivetech.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_081618_795744_9CC88B69 
X-CRM114-Status: GOOD (  14.96  )
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

T24gU2F0LCBTZXAgNiwgMjAyNSBhdCAxMTowNuKAr0FNIEhlaW5yaWNoIFNjaHVjaGFyZHQKPGhl
aW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBIYWwgRmVu
ZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPgo+IEFkZCBzdXBwb3J0IGZvciBWaXNpb25G
aXZlIDIgTGl0ZSBib2FyZC4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9oYWwtZmVuZy9v
cGVuc2JpL2NvbW1pdC9iN2U0Njk3OWE0ZmViMjkzMDcwMDk0ODM1YmE0MDU4YjVlNTVkNzA3Cj4g
U2lnbmVkLW9mZi1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5v
bmljYWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpU
aGFua3MsCkFudXAKCj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvc3RhcmZpdmUvamg3MTEwLmMg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
cGxhdGZvcm0vZ2VuZXJpYy9zdGFyZml2ZS9qaDcxMTAuYyBiL3BsYXRmb3JtL2dlbmVyaWMvc3Rh
cmZpdmUvamg3MTEwLmMKPiBpbmRleCBkY2Q2MzA2Yi4uZGM5YTI4NjQgMTAwNjQ0Cj4gLS0tIGEv
cGxhdGZvcm0vZ2VuZXJpYy9zdGFyZml2ZS9qaDcxMTAuYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVy
aWMvc3RhcmZpdmUvamg3MTEwLmMKPiBAQCAtMzA4LDYgKzMwOCw3IEBAIHN0YXRpYyB2b2lkIHN0
YXJmaXZlX2poNzExMF9md19pbml0KHZvaWQgKmZkdCwgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAq
bWF0Y2gpCj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggc3RhcmZpdmVfamg3MTEw
X21hdGNoW10gPSB7Cj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMCIg
fSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEwcyIgfSwKPiAgICAg
ICAgIHsgfSwKPiAgfTsKPgo+IC0tCj4gMi41MS4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
