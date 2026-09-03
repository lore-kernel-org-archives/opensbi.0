Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BC5C624D6
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 02:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RP02XD72Tiw4/iRKVkcr8czLaoY9QwPOPrQ1vQDWV4=; b=WPXiYQtEpAkzdJ
	Bzj25PgxbvAgcuCrFtMr/Ygp0ej69eJ9kAuB4hNOE07SnQ6EglXGlNUmSEv88xlQFr7eBR4S67GCc
	41HxYE8TkX4f8ONPQesxSAJoanXtVyAmIZYPk7bS3i02Vqb31OiVn+Pa08oEtPgqv9k3qrS5FXxjM
	jMBLaowH9KeGrb4a5IK2das93HsYX6e6ctydVbl1cJu1vEtMztK99mqlG5hapx/iFBMUcODfPvLt9
	cbA8MiOrEafHIV3o+xx6HoBge1g/vGmYmtyYPlT6HHXYtHeZO1wAHHMFMi1gX+hWpxJ5xgfuzL2su
	hyDACh56TyQ9WE9EhErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xJH-0000000GE6l-1fTJ;
	Thu, 03 Sep 2026 02:36:15 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xJF-0000000GE42-0z4q
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 02:36:14 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5c663437fe5so905653e0c.3
        for <opensbi@lists.infradead.org>; Wed, 02 Sep 2026 19:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788402972; cv=none;
        d=google.com; s=arc-20260327;
        b=srKUO86IERg6PO83joIN7qpP2ftBDc2o23Wwi6BaqEC/geOCiDAD338b833F2rm6mT
         EzRSa8Podto2NzuQ9bIjSFSNUjRUEnFn9TgisRnjqF7QdXsiZT9CZ77gxqS3M3VygCaZ
         HWgyByUs6i/C8yGxtyrPFLqq4R7buXIB/joYwsgKcM8c8EqQtWMsEdPyZVVNHSGk2aZ/
         UmKxCon9lt3dZp+Pq1ehMKNRDJNSAgvFZM8VYstFWf/YQgneL7mNkMddW/EUoYCsDmSX
         JiqUnVRM6kQGzo8eajD/2KhPsGyNDxYW32oZ9qR8aGO0/R48M/jUiMlKbFc7qUmb19/o
         27Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XP85jubgjQU/pouEQJLrnjxDA62vnWDdstr+HUlcaKo=;
        fh=CC8RNPHXnJgn5dOneo5I+Q+AFr9/kuoV9Q0WjY5+Rbw=;
        b=XkU8Ft4Y85YoX3wTB8ouSowE7p7R7w4WyKHar4tQfuD/+Z+ehKbhT/RLjsF2veIok9
         nsLG9s6DvWEJ3hTg86As/qZ7Pib5eZ1qWjc2kDpPE0NiFl+Ewt7RLOctDG4bZanO6cGC
         nZUUprNFddsZ6kZN481/MdJesyymCDpTQqIc8rm+rjgv3bMTlnX045ksH1VJQbpdGHJz
         6vzZzTdoq8io3dpMBIn8pjC9wMy+WrhAxdo8d4aNodH5qSE5SxF2Ix2MgQoZdm0I2IsS
         1BVmtxJ0ygtIUkV4xGCW2yhGDkNIW2XncNfYyApVweFJsN8X9oPybNW4SYT922CyS1lD
         pk+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788402972; x=1789007772; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP85jubgjQU/pouEQJLrnjxDA62vnWDdstr+HUlcaKo=;
        b=ihbxW1AUs2rJhLQEXRIzXItblmE1KWziWCPqf3zB/wvcMeq/+KatxjFx4NkFjc2G+x
         hYT2STpx3wmcoHrQ/9p4RReCKfVgUZ5DfkjwZsLwUC4myrTzd+ERLBevqWI1oTHGJVLr
         LcLuWExdDPU8Iq6C7Go1rkWvAcoWFUuhJJGXqhoM8V4ASusPersojI096Td06AYtx1Zt
         A/2nCIzic7k3QD1rlo6ZWt9pU2zWpgjjrN3XpnKcmkMz/u8K5KX7QtSbEa/R+rC1RJZx
         CqggbKQG10rd2oLaDcJ85rKxVprqSwcPoSPC01/OehWowpOreFD6ARjk1T19LZHlieTh
         26Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402972; x=1789007772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP85jubgjQU/pouEQJLrnjxDA62vnWDdstr+HUlcaKo=;
        b=VtrErUGmGR7qgdemslLfpacSuJtVyzjNa0SAVH2JUceZczXkxfajfOTW4P9/IAMTBc
         mlC4/pIGAyMGUTGuCffy7yW28dJ2BTtEOk48H1gMUIJR0mmGFpMZWwUQOiRvytGiIbnf
         kepJdpTgASvujc67QOuateZaB2bhcYtIJHzMld4n3/PBeFIhDZTrd5HKxn/zMDSR9G+k
         Pud7SIaWRvDgMF+GiJU8aV1rEupyjTo2GqOoazOdHDKH3O2AHX5gOxNC9Zl0roKwOmLW
         kBcGb2V9+MOJHgJiauqJBLrr0snFHhrV2fXRZnLIhe6UlmZDnIae9UgsOoec4t0gnz7B
         6vpQ==
X-Gm-Message-State: AFuF++lGopVAVePbCnoHuFDqyH0TE1CT5LmPY/MvPO8ANNdPer5tz+wH
	kr491buBxcVxx7WZzt95WPRv1iqGKzco5H99+KsvM7A6g3y5Al4pHBstYPR0pkXsziZN53I2rg9
	u2lBOAGekVU7l4/lokC+r8QY4xDqurZ27kvmghvonqw==
X-Gm-Gg: AYBFou0kwOKk9LhxeLSBFJjQiZd5ZfT0KPQl93eq3Vejj8MmKpIj2sTS2WD9VtZkB6P
	UOZ3+mfgFNZtzfay5IdEO2VTnGvR9YxNqWot6+y9dpWbazxziQnsN4XHgpNN4UsD9w0fd6Wog3V
	bmJY0DZJasGW91UApWrcbPUWs8bLZSq2B/R66uZ5trNXxTF7RpvsKx4GWwuDa/ZZCckjwkrTP04
	gfI+4t5Qeb7txsp0+s1Q1p9515cKVQPv41tYdGA/quyOog2cB/hm5P2xgjeqj/5NGs9BeaP700/
	odAn23SiQAI1flBkC5vvBk50FDaqGnRS0novZvYX7kk1Yyg=
X-Received: by 2002:a05:6122:e212:b0:5a1:fbbd:6bd0 with SMTP id
 71dfb90a1353d-5c7d27a7a58mr3523575e0c.5.1788402971847; Wed, 02 Sep 2026
 19:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
 <CACpYXwCiciQzQo99=f=_wioYb3kHHTZkQm_UAi6FCXYpbJmeog@mail.gmail.com> <20260902173312.3364721-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260902173312.3364721-1-evvoevod@tenstorrent.com>
From: Nia Su <nia.su@sifive.com>
Date: Thu, 3 Sep 2026 10:36:00 +0800
X-Gm-Features: AcwNN1UHiuMuGHOiENkJusnWdsCK9-5I5-zkbg0jRv6UXuqx9pmpc-KRflAX3X4
Message-ID: <CACpYXwA21hMrUcW_VxM2xQ10pR10qdF4B=JkZ24hjqe7DBLE0w@mail.gmail.com>
Subject: Re: [PATCH 0/2] lib: sbi: Fix Smrnmi/RNMI trap handling issues
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_193613_301720_17D1B86B 
X-CRM114-Status: GOOD (  12.66  )
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

T24gVGh1LCBTZXAgMywgMjAyNiBhdCAxOjMz4oCvQU0gRXZnZW55IFZvZXZvZGluIDxldnZvZXZv
ZEB0ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+Cj4gSnVzdCB0byBiZSBjbGVhciBhYm91dCB0aGUg
c3BsaXQgLSBteSBzdWdnZXN0aW9uIHdhcyB0byBrZWVwIHRoZSBjdXJyZW50IHZvaWQKPiByZXR1
cm4gdHlwZSBvZiBvcHMtPnNtcm5taV9oYW5kbGVyc19pbml0IGluIHBhdGNoIDEgYW5kIGNoYW5n
ZSBpdCB0byBpbnQgaW4gYQo+IHNlcGFyYXRlIHBhdGNoLCBzbyB0aGF0IGEgcGxhdGZvcm0gY2Fu
IGluZGljYXRlIHRoYXQgU21ybm1pIGhhbmRsZXJzCj4gaW5pdGlhbGl6YXRpb24gd2VudCB3cm9u
Zy4gVGhpcyB3aWxsIG1ha2UgYmFja3BvcnRpbmcgdG8gdjEuOSBlYXNpZXIgaWYgbmVlZGVkLgo+
IElzIHRoaXMgYWxpZ25lZCB3aXRoIHdoYXQgeW91IHdlcmUgZ29pbmcgdG8gcHJvY2VlZCB3aXRo
Pwo+Cj4gICBUaGFua3MsCj4gICBFdmdlbnkKClllcywgSSBmdWxseSB1bmRlcnN0YW5kIHlvdXIg
c3VnZ2VzdGlvbiwgYW5kIHRoaXMgaXMgYWxzbyBob3cgSSBwbGFuIHRvIHByb2NlZWQuCkkgd2ls
bCBzcGxpdCB0aGUgc2VyaWVzIGludG8gc2VwYXJhdGUgcGF0Y2hlczoKCjEuIFJlaW5pdGlhbGl6
ZSB0aGUgUk5NSSBhZnRlciBub24tcmV0ZW50aXZlIHN1c3BlbmQvcmVzdW1lLgoyLiBDaGFuZ2Ug
c21ybm1pX2hhbmRsZXJzX2luaXQgZnJvbSB2b2lkIHRvIGludC4KMy4gQWxsb3cgYSBOVUxMIGNh
bGxiYWNrIGFuZCByZXBvcnQgdGhlIFJOTUkgdmVjdG9yIG1vZGUgYXQgYm9vdC4KClRoaXMgbWF0
Y2hlcyB5b3VyIHByb3Bvc2FsIGFuZCBzaG91bGQgbWFrZSB0aGUgcGF0Y2hlcyBlYXNpZXIgdG8g
YmFja3BvcnQuClRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uCgpUaGFua3MsCk5pYQoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
