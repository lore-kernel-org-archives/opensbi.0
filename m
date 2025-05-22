Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A47DC54E65
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dqvnIoxWZvGs4hHoaLP8gU/fRdl9vAOgf0d4Wmg/Yg=; b=G2Jn+7tmLPL8ZI
	wwt85Ea8gCh0GeOG8FYi8Ar4+5dk7srSHMBVzmJrkm3ZfVt5FRsgEd8cbIwhCdd1S+yFpqslA3wlF
	/ztFlek24ovFRf7+mzQFc/7HCsS1K3LZFhhNeLkhUp29bStq9QMPRPu8JBYGIs5NiXXlzl4/v0GBH
	5venB2PAJs89wLZWSryt7zJ5LXJ/W1UnK2NwNR8TBq135xI2UrrmnkLkjtRBejUUiN4A6+fxwcj+F
	2p1NdIoCiZyhK11MKzWdJZ04ecbSsijkfn/evphFx9zgR8xGIfNjxdZ+cA/bXMFUZXEjX6/smV3Je
	ubNqaZdmKm7jG9FuRIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICsR-000000029fA-2sjx;
	Thu, 22 May 2025 20:50:55 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICsP-000000029en-0XSJ
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 20:50:54 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-551fe540b74so3703748e87.0
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 13:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747947051; x=1748551851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnkZ7B8JyhC3Kg6stEyjQYb685F1k49TtvgnO7emTMI=;
        b=f8fuyibaEpulAC15RGLG4V5GkMjGRXt+LMd+NrmWiOISInSFCgTyF9liTu6dYikyP5
         AjpW+czStxcHkzNktaifDZjEt2YGkaZhSh6rzhqP+NC+7I2mlm8G1IsIZkR3hV7qV5hK
         IuvsQGFFvMRKe70AKyKsxe87OIDcqjnXcn0fASf0oyenU+HsYGx6gILmEUvijr4fZdFQ
         DsOKUU+r4MtMBP16eIlPR4fqo+NNu1a+QQIP+eEdoH1hIMMq/54UeRs4BMd7vZ++9lCa
         DfOOuIyhYRMkEI6/XA2rF5qCK/lMhkZXTay1Vfg5m3qZFUMTfHJ404g0IYEPa3QzL9kQ
         XsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947051; x=1748551851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnkZ7B8JyhC3Kg6stEyjQYb685F1k49TtvgnO7emTMI=;
        b=g+SxvSO3r94l3KKgt8Kflzug3sXkIfOe2AkgpoF/OcOojtsGHO+9wdJ1GpCKf+OuJQ
         4zriATNbU9Ce/U0qHRZhK42auPRdcH22qgfbETBiJZZcrkMO0z8gHn5dZ3lFLnxPMdvN
         oHH+lHte1pz1jRnz8tX48Zyi3GkxNAyev9aoJqZq4awo4v76PNzvqYcPiYETxDWLBdwm
         0UCCNPesWltOIeeJ60PUzgAo+AgDH0UniewAH77Zg8p7Su1zbyhi+9uagMXY4OmnSGtz
         E1Yq8pOJfTDquF7GLqS7AGUE/HkUj8fX+1jZurDWSYPN3tUGiwHOjnEkIQkKmbd2uTDC
         13xg==
X-Gm-Message-State: AOJu0YwLiG9kXvMi95UC2t6uUgEz6iDbvgqL5xcR6qmaAUF6eCqSOzZj
	ke2QRgKGtIY2ZeycbShr5oSPGd6LXR9+kAN7IYgL96LgHe5Lqnj1wllYCYS60OqN+QiTrOqEE+7
	5YzaN9Pn+vKqcHfv6Nd/kbsQCRMoeBv0=
X-Gm-Gg: ASbGncue7iiATzy2106N3Mo9/OxhaW4puIVldt6PbBFcrmj6AbcC4a4y2M/zlP4vI8N
	WgvMBBD6i8jZkeFKrsKwxf1IIdn8cOaeRrAk492dWe5MCh+vgUFkxVByW+ZIlFGcRUpfTjnuPz2
	batY5NiovoXNY+DS3OU2KOjqjw4dPcqP7EFA==
X-Google-Smtp-Source: AGHT+IE2gF9WEQALZgN3d3b6qTngIvlZqyd6NaQZpDNC9LVJa1Bsi1kwzQtOZxtLHHLI8LcAzApfkI6ENoqKq+J9uxQ=
X-Received: by 2002:a05:6512:230b:b0:549:903a:1bf with SMTP id
 2adb3069b0e04-550e9906dccmr7806858e87.48.1747947050877; Thu, 22 May 2025
 13:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250519215848.27569-4-cfu@mips.com> <CAAhSdy25aLofOE8gvc1xePKK2DFZp7h2RP9irUu4iJ_qMVaLUg@mail.gmail.com>
In-Reply-To: <CAAhSdy25aLofOE8gvc1xePKK2DFZp7h2RP9irUu4iJ_qMVaLUg@mail.gmail.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 22 May 2025 13:50:39 -0700
X-Gm-Features: AX0GCFvmuHF9TPTrtS6vtKZLoWDA_EgjIAY8f9Lv5ouUj3r-Wk0gvt5EAZ69uUk
Message-ID: <CAM1rFzEWWm1h2YjRw6Ed6HdT9Z0bvks5ZbFEyMoJveurtiS=Ng@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] platform: generic: mips: add an entry function
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_135053_171500_CE019A73 
X-CRM114-Status: GOOD (  12.13  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMTA6MjnigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIwLCAyMDI1IGF0IDM6MjnigK9BTSBD
aGFvLXlpbmcgRnUgPGljZWJlcmdmdUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBlbnRy
eSBmdW5jdGlvbiBpcyBtaW5pbXVtIGJvb3QgY29kZSBmb3IgaGFydHMgdG8gZXhlY3V0ZSBhZnRl
cgo+ID4gcmVzZXQsIG5taSwgY2FjaGUgZXJyb3IsIGFuZCBkZWJ1ZyBleGNlcHRpb24uCj4KPiBU
aGlzIGRvZXMgbm90IGJlbG9uZyBpbiBPcGVuU0JJIGJlY2F1c2UgaXQgaXMgdGhlIGpvYiBvZgo+
IHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgdG8ganVtcCBhdCB0aGUgcmlnaHQgZW50cnkgcG9pbnQg
aW4KPiBPcGVuU0JJLiBUaGUgcHJldmlvdXMgYm9vdGluZyBzdGFnZSBhbHNvIGhhcyB0aGUKPiBy
ZXNwb25zaWJpbGl0eSBvZiBwYXNzaW5nIHRoZSBEVEIvRkRUIGFkZHJlc3MgdG8gT3BlblNCSS4K
Pgo+IEFsbW9zdCBhbGwgUklTQy1WIHBsYXRmb3JtcyBoYXZlIHRoZWlyIG93biBlYXJseSBib290
Cj4gc3RhZ2Ugd2hpY2ggYm9vdHMgYmVmb3JlIE9wZW5TQkkuIFNvbWUgb2YgdGhlc2UgUklTQ1YK
PiBwbGF0Zm9ybXMgYWxzbyB1c2UgVS1Cb290IFNQTCBhcyB0aGVpciBlYXJseSBib290IHN0YWdl
Lgo+Cj4gUmVnYXJkcywKPiBBbnVwClllcywgSSB3aWxsIHJlbW92ZSB0aGlzIGZpbGUuIFRoYW5r
cyEKTk9URTogQW5kZXMgaGFzIGEgc2ltaWxhciBtZWNoYW5pc20gdG8gbGV0IGhhcnRzIGJvb3Qg
dG8gYSBuZXcgZW50cnkgZnVuY3Rpb24uCiAgICAgICAgLnNlY3Rpb24gLnRleHQsICJheCIsICVw
cm9nYml0cwogICAgICAgIC5hbGlnbiAzCiAgICAgICAgLmdsb2JhbCBfX2FlMzUwX2VuYWJsZV9j
b2hlcmVuY3lfd2FybWJvb3QKX19hZTM1MF9lbmFibGVfY29oZXJlbmN5X3dhcm1ib290OgogICAg
ICAgIGNhbGwgcmEsIF9fYWUzNTBfZW5hYmxlX2NvaGVyZW5jeQogICAgICAgIGogX3N0YXJ0X3dh
cm0KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
