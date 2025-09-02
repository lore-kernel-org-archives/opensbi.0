Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A430CA0FFE
	for <opensbi@archiver.kernel.org>; Tue,  2 Sep 2025 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdTg+2KJRtyIhpOcBipPbDu5vARxxARgt2+OAnLiVxs=; b=m3WDlYIkaDas0+
	i62zB2f4zTI3+96zSWq3qiSIIVDydL4i0uUFJbDgu/o1WqFzAEkPuMto9rmpC3IPj1Q9nKrxRPi3c
	QM9sDBjEGiyROp2tOKkp8wqvnI3nZSmUdGppYRQojLenqLQee+VB2y3P2zhDX35YrOYdg+4Cq+xBE
	TuQn6WIGPQSyOfH1DCt4ddvZc2RdHtEI27W0Ag4ZcWsFTvrvkYb5d/OLGTSyN76hMfqgz5EFEsRiy
	sgp4oq+PZMnLwfSb6DEKg3eZe3Xg7fWFjLqFGGJVeYUA/crUN3QD6C4RBqPOHZBEAxJ0Bm9sknnO0
	3KbvpDaA/cUFDQ6tJ38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKJb-0000000FTeX-2maP;
	Tue, 02 Sep 2025 06:16:23 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKJZ-0000000FTdw-0hEq
	for opensbi@lists.infradead.org;
	Tue, 02 Sep 2025 06:16:22 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e721083e99so25942215ab.3
        for <opensbi@lists.infradead.org>; Mon, 01 Sep 2025 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756793780; x=1757398580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A63DWaiLJSo14XUHEc4j+BHsrcGePYGrMH6zvc/WKco=;
        b=xJ+MBKd5MeNvu0c8AKvKQSCzEuVEg3BeAjF1j7LeRmBvkRirMvV/P61b01AxbtmmLu
         iUr4x27BM47Ih/K19vQD5s/AVQ9JXnnzCJ/d1HTHCwM6NcjQfyF5se8JOCVNlIOz5L/p
         fbtXKGfEB4kGIwVQRiZ3qQtshlxG4Wwlsh591yau8UwG0mEDOSsIEFbKEVoimIzjau76
         CdgMg1wo7D8QnrBokRNAT894ztxHPXT2EGMmupOGDLUwwfscszGezHpsJQHlVDgGYDEI
         7rSLTHVF1LY8sIeXFXknWl1vIjH8Echu9guqSUKC2AS9cY310K8+Ru2e1lafB5oYlrKD
         PGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793780; x=1757398580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A63DWaiLJSo14XUHEc4j+BHsrcGePYGrMH6zvc/WKco=;
        b=tK0KXkA0z5oOVnUgn6gZ6H/HQOpyA3z4XvCq3iF3XFFYTBXvO0dEvzM9/toM0XX60G
         etbWMywMwRQbirY8XITWksBW40twxACW2KbNRw2obRjOrAJWfd7BB5nMKPkAmD8OmFT2
         nWFVfgBosT6uiT95feQi8Ce+BUJrHMhosAS40+qM7UB8zVzQMBaqi3NssLj9JC2Ap4mb
         K254mqdb2InZEqe9Gd53dAzWHsJ4wb/IqMjvwtsh8oMezegtoZ0Ch42X8GUCPNdg7RA9
         dpk6Syu4JqKSKrr//4IK5VlMOnuoeNwMiUYwkIt0z29SgC13JrGYGuYkumgfkPY8fuYV
         8FQQ==
X-Gm-Message-State: AOJu0YyHV+6cSVqUEp9luQokk9PhHHdHOl4bvvsJxweRBfYX7CxbRPpG
	qQZvMECDJmDorF1AEj933/a4m5GDp2Ael/zHV71iPny42ytSBRy7P0CzLJxAyFkbVZKuVrbd7JW
	cHo0xhEVocwI5ys6ityCeLSaDw/qpT3tA4ig4+xjaHYOHZ16iJXPd
X-Gm-Gg: ASbGncur3Zv+hSLaGe++3UMV1sHxWa20xwyFSbYjlmQfhcW/UEn7RyEHf81tQQpGbJf
	iQNRDnzit2lfezxWB8Zn0cvCt5C6//7Ccx+JXaaVKzwRigfje2K1mLoCowEYrrwFvOoFJmY0LtJ
	aYPnXrXGfl2amzjLNtjFvGmmWi7NdoL9xlBvZYYrZBU0Z3mRM80IRrALag1NOMHN3BKND7hHpjc
	mviPngRJHqS4vhRgCo4LoeJgAQdZKTlMQlKoVfU
X-Google-Smtp-Source: AGHT+IGp1txaZktUO2VZUWKHq6TDfh8t2Kw/aygbFYYwJ4Jsolv4+7lnVD46X6bCP3j1Olo5hxUk4FaY6dvscFYFlYQ=
X-Received: by 2002:a05:6e02:1545:b0:3ed:a4b6:55eb with SMTP id
 e9e14a558f8ab-3f4002875d8mr209173805ab.10.1756793780311; Mon, 01 Sep 2025
 23:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-cache-upstream-v5-0-af60a067f47a@sifive.com> <20250902-cache-upstream-v5-7-af60a067f47a@sifive.com>
In-Reply-To: <20250902-cache-upstream-v5-7-af60a067f47a@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Sep 2025 11:46:08 +0530
X-Gm-Features: Ac12FXyG6l44kOxcPgokvzm2ZilpML7zWMTlf2iZD2eF7vX-rvHME_1TifvJ9aw
Message-ID: <CAAhSdy21zHB+GD-rsRKySSB3mgx1Jc0uqHQnC7HwNZvR=wqxGg@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] lib: utils/ipi: Exposing the ACLINT IPI device
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org, Cyan Yang <cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_231621_378908_A8B9EB46 
X-CRM114-Status: GOOD (  16.25  )
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

T24gVHVlLCBTZXAgMiwgMjAyNSBhdCA3OjQ54oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IEV4cG9zaW5nIHRoZSBBQ0xJTlQgSVBJIGRldmljZSBzbyB0aGUgb3Ro
ZXIgZHJpdmVyIGNhbiBzZW5kIHRoZSBDTElOVAo+IElQSSBvbiB0aGUgcGxhdGZvcm0gd2l0aCBJ
TVNJQy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQ3lhbiBZYW5nIDxjeWFuLnlhbmdAc2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAK
Cj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2lwaS9hY2xpbnRfbXN3aS5oIHwgMSArCj4gIGxp
Yi91dGlscy9pcGkvYWNsaW50X21zd2kuYyAgICAgICAgIHwgNSArKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxz
L2lwaS9hY2xpbnRfbXN3aS5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvaXBpL2FjbGludF9tc3dpLmgK
PiBpbmRleCA0YjgyNDlmMjVlN2U5ZWU0YTA1M2FmNTRlOGM4YzAzZGFlODY3NGExLi4zMTEyMjhl
YjI3ZmFhZTA0MGY4YTYwM2EwODNmZjI4YzAzOGQ4ZjZjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
c2JpX3V0aWxzL2lwaS9hY2xpbnRfbXN3aS5oCj4gKysrIGIvaW5jbHVkZS9zYmlfdXRpbHMvaXBp
L2FjbGludF9tc3dpLmgKPiBAQCAtMjYsNiArMjYsNyBAQCBzdHJ1Y3QgYWNsaW50X21zd2lfZGF0
YSB7Cj4gICAgICAgICB1MzIgaGFydF9jb3VudDsKPiAgfTsKPgo+ICtzdHJ1Y3Qgc2JpX2lwaV9k
ZXZpY2UgKmFjbGludF9tc3dpX2dldCh2b2lkKTsKPiAgaW50IGFjbGludF9tc3dpX2NvbGRfaW5p
dChzdHJ1Y3QgYWNsaW50X21zd2lfZGF0YSAqbXN3aSk7Cj4KPiAgI2VuZGlmCj4gZGlmZiAtLWdp
dCBhL2xpYi91dGlscy9pcGkvYWNsaW50X21zd2kuYyBiL2xpYi91dGlscy9pcGkvYWNsaW50X21z
d2kuYwo+IGluZGV4IDllNTUwNzhhMGI5YjBmNDdhY2MwMDZkMzIzMjQwMmRhNjE0ODgyOGMuLmE0
MTczYjdjMjlkMDNkZmQ4ZGMzMTZhYjQyYTE2NmUwNWM3ZWI5YTggMTAwNjQ0Cj4gLS0tIGEvbGli
L3V0aWxzL2lwaS9hY2xpbnRfbXN3aS5jCj4gKysrIGIvbGliL3V0aWxzL2lwaS9hY2xpbnRfbXN3
aS5jCj4gQEAgLTY2LDYgKzY2LDExIEBAIHN0YXRpYyBzdHJ1Y3Qgc2JpX2lwaV9kZXZpY2UgYWNs
aW50X21zd2kgPSB7Cj4gICAgICAgICAuaXBpX2NsZWFyID0gbXN3aV9pcGlfY2xlYXIKPiAgfTsK
Pgo+ICtzdHJ1Y3Qgc2JpX2lwaV9kZXZpY2UgKmFjbGludF9tc3dpX2dldCh2b2lkKQo+ICt7Cj4g
KyAgICAgICByZXR1cm4gJmFjbGludF9tc3dpOwo+ICt9Cj4gKwo+ICBpbnQgYWNsaW50X21zd2lf
Y29sZF9pbml0KHN0cnVjdCBhY2xpbnRfbXN3aV9kYXRhICptc3dpKQo+ICB7Cj4gICAgICAgICB1
MzIgaTsKPgo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
