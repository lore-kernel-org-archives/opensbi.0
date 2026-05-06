Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB4ECD342C
	for <opensbi@archiver.kernel.org>; Wed,  6 May 2026 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/A9ThmiDKwC4yhNhKuMfVwy+7p8GeObZBF3IybFrKg=; b=SJFgdT/mwMYVqM
	iGGW2eLVARRafMl8Vg6haM3dn5MjN53FIa37uJEmomlWFRwE5g0YaFeO1bHgO1JLyYEOAHvRKSFrH
	IfSsW0hLlFazW/6C7cX49A/dvQW+iysQV0eImEez7CbYFWTt9s2hXQV7yRlVDnROMs77raOrM8U9e
	l+2WyaEofdWxFYFjhb77jlSxJCro/BDeGueZnkaU0XrSg5ESvzfQg69fZ+W1MKCLoslNkzWoVS6zb
	+GAlXwUVGKewECVXCeNxopzfDRqCREW6r2+ewsiBTs8EXTZWNqvpyG2XJKutkcLyjlRTnYKhGOOwr
	eRMosdF+aSBaCJK/wYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdOM-000000017Qb-1duU;
	Wed, 06 May 2026 14:38:26 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdOK-000000017Q4-49lq
	for opensbi@lists.infradead.org;
	Wed, 06 May 2026 14:38:25 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6948d7ccfbbso2768605eaf.1
        for <opensbi@lists.infradead.org>; Wed, 06 May 2026 07:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778078303; cv=none;
        d=google.com; s=arc-20240605;
        b=GlE6WGQ+KwXzPJfE9k/w6uUABuTRoyRG0gaWHmy+ckKbt0bMwadcL7zoTu2QIjK0Mz
         tvFUo77osmgVZU9P/r902mjOu4I2L6EpuUEY/NX1uJdOl7V4niGS9YbwelLhtsX6vLmx
         dBpoPjD4c/kV6EKLLm5W/eh5PcDOBKV91VZI01N+c766A+Ix/XniHwi1cQn1Gs6LJp9Z
         hb/xM7w5QsJ3YMKVR/meZDhNNP7BsioewMyVwcQfFmFlk1cZf9ihZcraAz6w69AeNBhz
         G/9+e/FDqZtf2LF4b7Su+AtXIUjNcAHbTXNWHL2I5i6Sg5Ozi2c7fUs/BuECmfLg3IQo
         O0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axOOieFE6gd/AhcppxvjYib7AMtPuRxHOAYxO2covx4=;
        fh=ZAtPgNT/mWeTZ6vNEkZRyB0hM0YzwkpsSL1tZLHA+mM=;
        b=AO9t0cUhn9yUV6C3NtL4VSjJapnze2JcEzRxKaNkmD+TmLZMzxuY8xtzf1zazNISzu
         wXbYv2D9meQXqNzah3c/BqC/paOTowcAX7/G6u0ScMdsM9wKyhgf2Ykp41hLt2m2TE9+
         barikSQSG6DWxML0KLGiwh0yx/cLFkSwmATRqBfgP53aOmOrm6CjzZlrRiaXGW1J4+aD
         6EVIZ8jbIPhDJatCybgXq6pJ+p6vSGTEh9uRze+aKCcRizZD4AquqJ0GzVuoYTrHzW4B
         XSnpAjTtRAPTqyLHmY67MYIiVRBA1kBro2YFAnkZwJimbJUcBrtDSmsurQ+WnthHrF8J
         Z9+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778078303; x=1778683103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axOOieFE6gd/AhcppxvjYib7AMtPuRxHOAYxO2covx4=;
        b=ik2d15tRuXqYNcN3bheE5sKpbb7eogUAm1jhZOyG1sYznFPVyEyQgUxUyDYgDQyU7S
         wpbUt1ObYFuq3qFzG4Yrikej/Budq+P34LFRHqTEV6nqzQZpBP/cF4YdXX4NV2u/ZksB
         b2H4kq11wJPXPktFqh7W9H+fizyraOOie3s8tvSRK7TfA5eGStGThYAgGDRPRFe5qZ0N
         KnV3vd6LyG7KzcOnuc2huGTsS8JZ2BRnREMC0HC7roJGP6XfCxGX3Ja6MsNaPNsH0STZ
         PYPIsZtZcPED1NIaAQkuCN/U+uS1yTYEbuXHeMqjjE3I0HdhcvXwtfJJ4ltx38vfRV9Z
         PxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078303; x=1778683103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axOOieFE6gd/AhcppxvjYib7AMtPuRxHOAYxO2covx4=;
        b=L16vzOCCBXpgfXpfT2oO6Prz8azLBOWT/6fGP6+dCktFsrDW5A3R7rSOwijKTZgBFi
         nvOF0QOGWntZ77xfR8zQCjdhs9TLRyFL9mPmGlgvupQoGvhrO4MP6Dn8EPdVl8ETT8Xv
         o+6HXl6puhu7/CWI4vqCU7Qm2nWFFDvTupwiBXHEw3IyWdOZkAehuHeeOoivB5NYkag5
         FM/EvR+HtvNkudOHjlRLONONkxmqDMO0lDIeA/nM/KHg2dlN63n/sRA26LMvHVjWZx28
         sH16ckxlrSOiAoiNUhlCiAknXu1zPlGHz2yBL0yLHtsgmPcfn1xnAosaQNolVUfCXKze
         Agkw==
X-Gm-Message-State: AOJu0YzPu93ZyN5R9L5dQ5co9dCbyaRsTo+brCxFRcg7/vNu58Rq5RnR
	D7DqxfxC1PyIKP5YC7+gXt28GcYpZLQNTkxKScA2IQ8JM4EtQMYaFyCXeVQLWHfDZHXUu91uYCF
	J7utDHRo2p/4ujmQ4jXWIVD0YRv6mLSpQibo+98cWGxD2vQXwBt6dU06Rkw==
X-Gm-Gg: AeBDiesfqw7A2ExknFeiyufdJS1LNr1SfS/WHhLPD4uIg7MiQnRwHIsH6F2XVoB/cwq
	vyjdWTqthgaMuMpsw9FtO+qX80pg6QMzr2bYZoRU0YFHEa6uT9OXCz+oOh3esLMW6umLRYzYZa6
	e3gdR2lhGgwCNU1x57SwiPWVNai+6/lL3BC9PneyKSjG+SxXpAsozW+dqz0nm685a4sqEeaks05
	k8CePMsAACgmj7F5FQAWGKz50gabA0yun+AIV/azFQ6FzpFSKnwFP86/68PhYi5pZTkRCtvlXj9
	jWAJ9yQJl2hLKeOEPsX8ZqseIelq1LpyPyZ5pObpp5sbtjBog2y13VKxk4kAWvMWctn6Upbgp9c
	/s32ZPjOOihMXiGYDrliVo1yNMH1/wFMWYYonSLmkn4pV1jo=
X-Received: by 2002:a05:6820:61e:b0:696:248f:807a with SMTP id
 006d021491bc7-69998d3251emr1881861eaf.40.1778078303247; Wed, 06 May 2026
 07:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com>
 <20260501211627.3293126-5-evvoevod@tenstorrent.com> <CAAhSdy2CHgZ7cmrENKeJOenbcsgTVrQVNPFequqtmgufZ=1Epg@mail.gmail.com>
 <20260504164015.3775558-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260504164015.3775558-1-evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 May 2026 20:08:11 +0530
X-Gm-Features: AVHnY4KpIjwJKXVX5V1MlN2j-dAOrii2BW8CzcNzn3uhOxAJhdRTFxBnvbrprpI
Message-ID: <CAAhSdy2GUYS--zred2cetcC=6z00J5M+5ZkWZXGOyoNjCaHQ+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] lib: sbi: Create a spot to place Smrnmi detection
 before traps and after DT is ready
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_073825_171412_5A2608FA 
X-CRM114-Status: GOOD (  18.23  )
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

T24gTW9uLCBNYXkgNCwgMjAyNiBhdCAxMDoxMOKAr1BNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBUd28gY29uY2VybnMg
YWJvdXQgdGhlIHN1Z2dlc3RlZCBhcHByb2FjaC4KPgo+IDEpIEVuYWJsZW1lbnQgb2YgTk1JcyBi
ZWZvcmUgdGhlIHBsYXRmb3JtIGhhcyBzZXQgdXAgaXRzIE5NSSBoYW5kbGVyCj4gaW50cm9kdWNl
cyBhIHdpbmRvdyBvZiBwb3NzaWJsZSBoYW5nLiBXaGlsZSBOTUlFPTEsIHRoZSB0cmFwIGhhbmRs
ZXIgaXMKPiBub3QgZGVmaW5lZCwgc28gaWYgYW4gTk1JIGFycml2ZXMsIHRoZSB0cmFwIGp1bXBz
IHRvIG5vd2hlcmUuCj4KPiBUaGUgdjIgc2VyaWVzIGtlZXBzIE5NSUU9MCB1bnRpbCBzbXJubWlf
aGFuZGxlcnNfaW5pdCgpIGhhcyBpbnN0YWxsZWQKPiBib3RoIE5NSVZFQyBhbmQgdGhlIHJlZ3Vs
YXIgdHJhcCBlbnRyeSwgd2hpY2ggYXZvaWRzIHRoaXMgaG9sZS4KPgo+IE1vcmUgZ2VuZXJhbGx5
OiBvbiBTbXJubWktZW5hYmxlZCBwbGF0Zm9ybXMsIHRoZXJlIGlzIHJlYWxseSBubyB3YXkgdG8K
PiB1c2UgYW55IHRyYXAtYmFzZWQgbWVjaGFuaXNtIHVudGlsIHRoZSBwbGF0Zm9ybSBoYXMgc2V0
IGl0cyBOTUkgaGFuZGxlcnMuCj4gSG9sZGluZyBvZmYgdGhlbSB1bnRpbCBhZnRlciBhIGNhbGwg
dG8gdGhlIHBsYXRmb3JtJ3MKPiBzbXJubWlfaGFuZGxlcnNfaW5pdCgpIGlzIG1hbmRhdG9yeSB0
byBwcmV2ZW50IHBvc3NpYmxlIGhhbmdzLgo+Cj4gMikgQWJvdXQgdGhlIHN0YWNrIGNhbmFyeSBj
b25jZXJuIHdpdGggdGhlIEMtc2lkZSBfX3N0YWNrX2Noa19ndWFyZF9pbml0KCkuCj4KPiBUaGUg
ZGFuZ2VyIHBhdHRlcm4gImNhbmFyeSBhbHJlYWR5IHB1c2hlZCBvbiBzdGFjayIgb25seSB0cmln
Z2VycyBpZiBhCj4gZnVuY3Rpb24gY2FsbCB3aGljaCByZXR1cm5zIGlzIGN1cnJlbnRseSBvbiBz
dGFjaywgd2hpY2ggbWVhbnMKPiBfX3N0YWNrX2Noa19ndWFyZCB2YXJpYWJsZSB3aWxsIGJlIGNo
ZWNrZWQgYWdhaW5zdCBpdHMgdmFsdWUgb24gcHJvbG9ndWUuCj4gTmVpdGhlciBDIG5vciBhc20g
ZnVuY3Rpb25zIGN1cnJlbnRseSBvbiBzdGFjayByZXR1cm4gb3IgdXNlIGVwaWxvZ3VlCj4gY2hl
Y2sgb2YgX19zdGFja19jaGtfZ3VhcmQuIFRoZSBmdWxsIGNhbGwgY2hhaW4gdG8gX19zdGFja19j
aGtfZ3VhcmRfaW5pdCgpCj4gY29uc2lzdHMgb2Y6Cj4KPiAgIGFzbSBfc3RhcnQKPiAgICAtPiBz
YmlfaW5pdCgpICAgICAgICAgICAgICBfX25vcmV0dXJuCj4gICAgICAgLT4gaW5pdF9jb2xkYm9v
dCgpICAgICAgX19ub3JldHVybgo+ICAgICAgICAgIC0+IF9fc3RhY2tfY2hrX2d1YXJkX2luaXQo
KSAgICBhc20sIG5vIGNhbmFyeQo+Cj4gRXZlbiBpZiBhc20gc2lkZSBmYWxscyBiYWNrIHRvIGBy
ZXR1cm5gLCBpdCBpcyBzdGlsbCBgaiBfc3RhcnRfaGFuZ2AKPiB3aGljaCBhbHNvIGRvZXNuJ3Qg
Y2hlY2sgZXBpbG9ndWUuCj4KPiBDb3VsZCB5b3UgcmVjb25zaWRlciBwYXRjaCA0LzUgd2l0aCB0
aGlzIGNvbnRleHQ/Cj4KClNvdW5kcyBnb29kIGJ1dCBJIHN0aWxsIHJlcXVpcmUgc29tZSBjaGFu
Z2VzLgoKVGhpcyBwYXRjaCBuZWVkcyB0byBiZSBzcGxpdCBpbnRvIHR3byBwYXRjaGVzOgoxKSBU
aGUgZmlyc3QgcGF0Y2ggc2hvdWxkIG9ubHkgbW92ZSBzYmlfcGxhdGZvcm1fZXh0ZW5zaW9uc19p
bml0KCkKYmVmb3JlIHRyYXAtYmFzZWQgZmVhdHVyZSBkZXRlY3Rpb24KMikgVGhlIHNlY29uZCBw
YXRjaCBzaG91bGQgbW92ZSBaa3IgYmFzZWQgc3RhY2sgY2FuYXJ5CmluaXRpYWxpemF0aW9uIGlu
dG8gQyBjb2RlLiBObyBuZWVkIGZvciBwcmVzZXJ2aW5nIHRoZSBleGlzdGluZwpfX3N0YWNrX2No
a19ndWFyZF9pbml0KCkgaW50ZWFkIHdlIGNhbiBpbml0aWFsaXplIF9fc3RhY2tfY2hrX2d1YXJk
CnZhcmlhYmxlIGRpcmVjdGx5IGZyb20gaW5pdF9jb2xkYm9vdCgpCgpSZWdhcmRzLApBbnVwCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
