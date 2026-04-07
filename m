Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B57FEEF49
	for <opensbi@archiver.kernel.org>; Tue,  7 Apr 2026 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWHOJV/oW3lnFRo2p9GR1CTlpb5t6OIcd7vJJYve23Q=; b=doJQokzNBB5u0R
	2EMGnQoQZYRt2HkjedD8FoGLCRN69EpWCu1C9vjUXCc6JjN/H/xNalMmEs9iEPgVGntQ5HH8X5b3g
	HM7WBCfHFNtS+U28rVYB2ykzz6iU8f1p+ktG6qktJtgrfMKx6gkD3RfYfSyVhfRVd3dRJsDvmEvP+
	nSJlXLMZZbfkr16k9ipestyG0jBkkb1n1IPooMG9iEuRzmPeeTPnAPzjwjHUVBIqyCek1+0yn5Jqr
	28+t9KO/m64lN8JMuThpbD9zI+i9768vUySUVk5aMFbT5Bi5CTkO1z2q1FnJuxhb9Kw4kyeZ67DM+
	dIFbpnUESNkED0V4YpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7FH-00000006aXG-1HJ8;
	Tue, 07 Apr 2026 14:17:35 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7FE-00000006aWn-3LPr
	for opensbi@lists.infradead.org;
	Tue, 07 Apr 2026 14:17:33 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-953943f7a33so2200985241.0
        for <opensbi@lists.infradead.org>; Tue, 07 Apr 2026 07:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775571451; cv=none;
        d=google.com; s=arc-20240605;
        b=ZTeyQoIS2zCBaNJIINxnnjJlSJGQhml09o2bPZLhXCxHfBmTBjcK2CO34bAYIRnag7
         yXvda1RrJA3b5WDuSnFi1tVFToRkxePluccUXVJBBBnLE3Eas16FkcfTZ24VwKvV/E+q
         aaoJIvO49Y9mMiVrhMGZnbJEsUXdBQhtFRdqvbk2vgyyoiWNDzIvEpfT2uf/cwEmUZ9m
         OmWh7QzSULdi8RxYMdEV26FeyYUyy0pbOGiHCvHjTpxef8GVCWqi+kW9/oenhfVDRv19
         +n0WIkC2bg9DBH4cLwgfAxgddJLqbfSZ/R9yhYtp/KwJgyIdZdQzNs7u7y51MMe51zg5
         EscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rIVj+j4Sf2P2hW9uZCoQDthOPg1lcAj3tWSYzCh7UKY=;
        fh=7hrvX+z0GXvKojC+lOqXNVPPy/WSluYc9FmTovGrq5E=;
        b=MWrC6xaqt0JiEOAESlXRkbCOSFyRxN0YqeU2NvrZ31iwPvJiNu5Cq/nW1/MO3kWhO2
         3Sw8zab9p3nWNM1+LMHpvdbgaG7FlIJdkoLkrrqIStXaXc55DuiLBI+WuSJtwvJT88Kg
         3rtgHFLTEkqmoucHqfNx1a/TIO02SHB61GmP8f+BNVCKu9pBGIURhYOLIxiov39ih3cN
         vEEG+CC4Fbf+57W2hMUNTThE9iH0Zq/Jdz7ZE8tx+ZIcUi7xgDNW8MRHYb+wY+gvPh0/
         BZdgrHmDCjDaE38fWaslbMyvfKx9AHg1b88JK44beCtWvrymgzweKhzFG5aGcZDzKk/w
         n6Zw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775571451; x=1776176251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIVj+j4Sf2P2hW9uZCoQDthOPg1lcAj3tWSYzCh7UKY=;
        b=Es0uGw8aEyll4NYQXnp6DWMx6smhi2y7vHzv0vKowhMl/UMBJ95x+kvwIaPZi2Bf0d
         yeV8MFRbWIpPPrAvFbyYLTSPvE8b8FRt4lVf/W/a+qErv2Ivo7IXqsynJfjNk79bKbSK
         j7JcelZASuTA0eyjQquEIjokLsVr1An5dq9G8cGLWlVf4nY1ac59kICOeX6rSFV0Ym8S
         w2IAHcl23eggxxwXZRujICGnQuwO0bjF84Vc+BIKfyro+NRXFIgUaAQewg+AaZEmxWwe
         zQac/JMAp2l44QSdegRtVxxjgNOmRPcMDs0JHvejCezMBs65NW0OOE6tyM0Rapx82E4A
         w3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571451; x=1776176251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rIVj+j4Sf2P2hW9uZCoQDthOPg1lcAj3tWSYzCh7UKY=;
        b=VAAsJxDpYwviVtRS4cizEIisbO9h3Z5ATdTUJjM8XKQ12OGT06HDtqouwIoEED0EZP
         3HQKK38sgWyY/WIp8DQ7ttaB2V6gIjLzkrQU3PepGvKj1huq6QNxV5iNHVHPLdrgAaPV
         uI64qsj4pdk+zi1Z2y184900i+Mc4Ln2whd75R+tRHLSFlK3S8CvpuhmpD252wAo3SIR
         zWVDcxuGT3cFDG7nDimDE+n6cdS1MVV/YLbTv6LAQ/irLuF43vzQN96T6lkXhmSKQRjF
         1yJBWWFXEv6wSDhj2naljTQOfiqxexJT+/t9XDTkc/McDh1ISxZFTGR7bmOt0upmW8qt
         nBXg==
X-Forwarded-Encrypted: i=1; AJvYcCXVk98BwZwRFnaxODLH4W1YFXOk/pTMTs3E8vPXNrnZJH5dz3cXUCz1E8fcXqHiRaHxtuZ7kdbo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmt1r9Z5yQ6pX6zy/j4hgTvvDiVB91m9ke4HvSIkKdIfmr12lC
	L22zTRGY2iZDfTVm0q6j4FsGI+gbAtQDLjqkJru4jjbyyG6ngmPUPK9LZcoWjhz7I3ZwJisl1Dh
	BVeHnJ3P19z55uH/hIqVuG/8mo8SSUEffdAt32QrLDQ==
X-Gm-Gg: AeBDieuG/9/qrKBYX3pnTA1adjxp7SlqPwGUTv4GrWSZtf3IEpFNqoTE2PNRYYaMItI
	Vpyy1GeAIYqdnO4zVh2Z+GFB284cfDFEMw2uCxcZVWBaPwWIJEnGGTK2tL0infnUE6Bux0Gfth+
	1QQgVTY3imKSk+x/HXhqed4CKeoPIBIoSob4We8swIQaqde8Rl+zxwzlPKuXXfsyH6RGZUAhXLl
	74EejLI6YOfLy3EgqfBcKUNLoXmx/ubDUm3GmfFpn+XQrigjF+FyW3ZgSlHQGQyN8s0OK+y92MB
	9PcDekBaEA==
X-Received: by 2002:a05:6122:c9a:b0:56c:fe16:f54b with SMTP id
 71dfb90a1353d-56dab98ac50mr7701212e0c.11.1775571451379; Tue, 07 Apr 2026
 07:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
 <20260402171713.143368-1-evvoevod@tenstorrent.com> <CAMWQL2hHtqdgurYZ7O3UcWRE=F3m+7w1fSwqQMdgdw7=+Chxyw@mail.gmail.com>
In-Reply-To: <CAMWQL2hHtqdgurYZ7O3UcWRE=F3m+7w1fSwqQMdgdw7=+Chxyw@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 7 Apr 2026 22:17:20 +0800
X-Gm-Features: AQROBzB84Dm8EysIWARadTBLm-dToWxBLWi4CKWHiEh-XRak4bgXjxN189wdsho
Message-ID: <CAHh=Yk8OwrE2jQgAVfz=DY3u_jCmH2UQs-2m+7nVuvH6wNTOvg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add RISC-V Smrnmi extension support
To: Evgeny Voevodin <evvoevod@oss.tenstorrent.com>, opensbi <opensbi@lists.infradead.org>
Cc: npiggin@gmail.com, Anup Patel <anup@brainfault.org>, 
	Radim Krcmar <rkrcmar@qti.qualcomm.com>, atishp@rivosinc.com, zongli@sifive.com, 
	nickhu@sifive.com, samuelholland@sifive.com, yongxuanwang@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_071732_860234_9F68364F 
X-CRM114-Status: GOOD (  10.31  )
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

PiDlr4Tku7bogIXvvJogRXZnZW55IFZvZXZvZGluIDxldnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+
Cj4g5pel5pyf77yaMjAyNuW5tDTmnIgz5pelIOmAseS6lO+8jOS4iuWNiDE6MTcKPiDkuLvml6jv
vJpSZTogW1BBVENIIDAvN10gQWRkIFJJU0MtViBTbXJubWkgZXh0ZW5zaW9uIHN1cHBvcnQKPiDm
lLbku7bogIXvvJogPG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiDlia/mnKzvvJogPGV2
dm9ldm9kQHRlbnN0b3JyZW50LmNvbT4sIDx6b25nLmxpQHNpZml2ZS5jb20+LCA8bmljay5odUBz
aWZpdmUuY29tPiwgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+LCA8eW9uZ3h1YW4ud2FuZ0Bz
aWZpdmUuY29tPiwgPGFudXBAYnJhaW5mYXVsdC5vcmc+LCA8cmtyY21hckBxdGkucXVhbGNvbW0u
Y29tPiwgPGF0aXNocEByaXZvc2luYy5jb20+LCA8bnBpZ2dpbkBnbWFpbC5jb20+Cj4KPgo+IElu
IG9yZGVyIHRvIG1ha2UgaXQgbW92ZSBmYXN0ZXIsIHdvdWxkIGl0IGJlIG1vcmUgY29udmVuaWVu
dCBpZiBJIHNlbmQKPiBhIHBhdGNoIHNldCB3aGljaCBkb2Vzbid0IGRlcGVuZCBvbiBUZW5zdG9y
cmVudCBwbGF0Zm9ybSBhbmQgb25seSBoYXMKPiBnZW5lcmljIHBhcnQgb2YgdGhlIFNtcm5taSBz
dXBwb3J0PyBUZW5zdG9ycmVudCBwbGF0Zm9ybSBwYXJ0IGNhbiBiZQo+IHN1Ym1pdHRlZCBsYXRl
ciBhcyBhIHNlcGFyYXRlIHBhdGNoIHNldC4KSGkgRXZnZW55LAoKWWVzLCB0aGF0IHdvdWxkIGJl
IHZlcnkgY29udmVuaWVudCBhbmQgZGVmaW5pdGVseSB0aGUgYmVzdCBwYXRoIGZvcndhcmQuCgpQ
bGVhc2UgZ28gYWhlYWQgYW5kIHBvc3QgdGhlIGdlbmVyaWMgcGFydC4gSSB3aWxsIHJldmlldyBp
dCBjYXJlZnVsbHkKYW5kIHZhbGlkYXRlIGl0IG9uIG91ciBTaUZpdmUgaGFyZHdhcmUgb25jZSB5
b3Ugc2VuZCBpdCBvdXQuCgpJIG1heSBhbHNvIGhhdmUgc29tZSBzdWdnZXN0aW9ucyBiYXNlZCBv
biB0aGUgd29yayB3ZSBkaWQgaW4gb3VyIHNlcmllcy4KClRoYW5rcywKTnlsb24KCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
