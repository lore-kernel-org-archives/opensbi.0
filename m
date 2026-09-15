Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657D0C88E73
	for <opensbi@archiver.kernel.org>; Tue, 15 Sep 2026 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bysjdGARZsA9nefXFnUBQM+TyEiSSWxWIhJq17/Wbk0=; b=Gj5siHT+VXtWX5ta3Vj3li7Rol
	lZlqNz/dr4JTUIdLQxwNe7H1nv3RW4Zpigep8lwFlQdeVvAFakluk+FDT6NavU9eV8XKFgkFc+4NC
	BkfIMJy/IuU/hNcGiwsQsAjxDxFoVDiLJii6+j3kFq/0hi52L2/YmI/2/sZjZQbFFW8qPtCBS46Qt
	4ytOP+6aY8k7OGeB3GONxcP+w7AmRhKuRSo0TfBW9g4Pl6kTiYYHGJUWqLBVlYfBxQ/JsnRGKRLHb
	B9P4aDcD4KEDTQdqIgpoRTORCNZiRmuROkp1NcqiSEpoJdXaaooMr8rdtD1LWnXYmHqvQZEdxDG7Z
	/XF/6LiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NtH-00000005XFs-04Sn;
	Tue, 15 Sep 2026 07:47:43 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NtE-00000005XEM-1XPe
	for opensbi@lists.infradead.org;
	Tue, 15 Sep 2026 07:47:41 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so5097788a12.0
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 00:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789458458; cv=none;
        d=google.com; s=arc-20260327;
        b=p5twy7wCzJbyQAXxU6veW59B1HpzOxIZv7Lcbxkxhk/gxNXANSymy0fhWfB1ONVmTb
         Vj0Brgf6ZPdPar8pdZGW8vtJEOmluUTwfWmdMwcfU+eBVq0aOfGGwNor0pwHSC3o1eyw
         rI3L90d16kO/s4Xp5SLDfxWq5pknW6HgQLblUs/QpZlcGtwmAA/vFWizxpsJ33zR341p
         sOH0hljghgkX0T5eNlSzI1CwcN5wXA1rSd0+LLjnyRKljQ6lBXQ+i1BY5DYHOiB5l0h6
         anP1cA3vAnfQsYggoFooph+mJfZRHQFcG3DWoV1VEQDNCe7993myeAo7u2XCND3pe2AI
         35FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0FJ4oFn57zhNCdA1Hl3l6HzO4fEfMNN9uK7OWzjZEuM=;
        fh=UN9te1fGQyWw+lt7ilMCftfngqqu7jRP5g80LhDZz4Q=;
        b=Q0vCeQxs03VnqRJACYinjcBTKnYTUupD9lDsuX5xS8Rw17E97L4R2W+ZceOR0K9E2v
         tQEGKwrH/fIEJOEtRMPwK4bmMRx3ylInECPiJ04jgU7BzD+34t6pEpiUkGaeY6nVeZoa
         Xv3WACXNXpQE7InIeHJAm6Sbw5Jv8X5jW0br+xY3p4/C8oSUxc7FZ6Q2EBw0ti98mex+
         KGYinmaj225I4H00Frns3aVhY3t+u96ApXpUbgaxfqmcyIMVPhdmELp55eqlPNrnzvx/
         v+x6IX7knBaHxvEs+/3+9ToCZKK9ZvynGBym18kmWRH3dfhy2EP0WUcMOdg+vvm2YbFs
         zYHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789458458; x=1790063258; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FJ4oFn57zhNCdA1Hl3l6HzO4fEfMNN9uK7OWzjZEuM=;
        b=hBWwUWBkVpGL3K9bWvoN+1XiwakchR398po0BitwKpk81d4DCkupBTWMjYDUHSBxc2
         6iUom1Jum2pkFJmlqpK/74VzZLir0Z7wPbY1LhFYr5m0yzpT7BwvfIva5U1Uy8YBGlaL
         tYVCqdTdXebh42O5mTZE4R+n3MxUvnlC4vluFVvt6VaMPitVxBkTid6+c2s3Na4LiBD5
         peyzF2cHgyyP27h20T+n0WNv+NMLkloRa1sYaNuZ+D4GGvVZEOdMdCe2CTMTiY8VmKpm
         +JiB+K1hQHumEw+KXx1NFWyoo6thsqjmqdQi0ndqOX5QdiHXqoyk+yVWd7WFmQaKW3bI
         E63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458458; x=1790063258;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0FJ4oFn57zhNCdA1Hl3l6HzO4fEfMNN9uK7OWzjZEuM=;
        b=EF7AvkWBOn8HDyERMF8O/XXmvmRnC6nUJAWEUGPkGIlelzdYwpYE+wCR9vp6Qv1gAM
         PWupqECZptOwoJZL6X+5c8ai8Z40OuzVeYBUn1tRF5ijLaz3SBavXkGwEhm4tdae85nu
         DR8pdUqVaTJQDEgShpFMNsxGYEJzAlDkA+6TjBiIoHz2zqSqoxLBKR3jlEB/iA1/ihc/
         M+85L8GU6BqiEu5Z/VfqmPpn95rk/7lXnZEOhQZOjmehaXcj6fh1guhHnRWZyZwBE5Cn
         lhYyGRxZn5OoNhaA9rbjEEOhCeyDKixV2OmxxhkiYQGZMm0H4+eMeY4GTfau/Je1AslO
         V2CA==
X-Gm-Message-State: AFuF++kgTHgHWhdkGXK9WNc0VltNwmikYT8r2z8k85qSlvBEibmKS1su
	090fZNb8KGLDXqo/Qgg4xnrU8WTn51KyKuf6NBaooUCSbWMndi4ru/dczAv1EIQuAhsNAQcb5h9
	jqB6GcrPxuJgDbLf2hppiS8bAXHsY1GXYcbvRaLVo4Mm2cwyJBT6roU2A+w==
X-Gm-Gg: AYBFou3iRpdR6WANQYU3E3XH7ImDQKBFZtppUbKTiXO8Mynn2M4uCVXgwPEiUkRxxXM
	yCrQh5WBZR9b8LlHWI7N/F2Ib0ixHD1MlPgOYluP9umZvkvD4TscLcVE9xdNuKFq+3Syyuem0Ox
	/YlK3C8eRqOfX7fzb1IrvkUaAnpT/hj7HTf1E13xCjm47zu/ej2BwcwdiUX93mukAJ0+dIJiwjh
	HGMNVcD6fGoNrBGzkfbbKNVt1L4Zej6EnZXv0ei3KbTPlmqdQPeAx9A8eNjxuvBdylVk1hgrn3N
	gJkemBwKCZt8McK6UE8EsK6QCJa9gphNaUnbKGcE816+xQCH8dN1hVDSEA==
X-Received: by 2002:a05:6402:4516:b0:6a9:b523:375b with SMTP id
 4fb4d7f45d1cf-6a9f61f8a22mr8399126a12.6.1789458458127; Tue, 15 Sep 2026
 00:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260901022211.2619560-1-zong.li@sifive.com>
In-Reply-To: <20260901022211.2619560-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 15 Sep 2026 15:47:26 +0800
X-Gm-Features: AcwNN1W-sle2a0mekbuSvMOpMXnv_D_3cCZPQ53JXT7rf353WuJc8LBKbw4EHPo
Message-ID: <CANXhq0pLe2F+TWCQEe_hDqKgQ7ZH+N_9LbL+S1WDmi4UTYVghw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support OpenSBI firmware header
To: opensbi@lists.infradead.org, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_004740_607423_8BE661BA 
X-CRM114-Status: GOOD (  21.89  )
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

T24gVHVlLCBTZXAgMSwgMjAyNiBhdCAxMDoyMuKAr0FNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBhZGRzIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVy
LiBUaGUgbW90aXZhdGlvbiBpcyB3aGVuIGEKPiBzeXN0ZW0gd2hlcmUgdGhlIHByZXZpb3VzIGJv
b3Rpbmcgc3RhZ2UgcnVucyBvbiBhIGRlZGljYXRlZCBib290Cj4gcHJvY2Vzc29yLCBpdCBjYW4g
bG9hZCBhbmQgcGF0Y2ggdGhlIE9wZW5TQkkgaW1hZ2UgaW4gRFJBTSBhbmQgdGhlbgo+IHJlbGVh
c2UgdGhlIGFwcGxpY2F0aW9uIGhhcnQgdGhhdCBydW5zIE9wZW5TQkksIGJ1dCBpdCBjYW4gbmV2
ZXIgZXhlY3V0ZQo+IG9uIHRoYXQgaGFydCBhbmQgdGhlcmVmb3JlIGNhbm5vdCBwbGFjZSBhbnl0
aGluZyBpbiBpdHMgcmVnaXN0ZXJzLCBzdWNoCj4gYXMgJGEwLCAkYTEgYW5kICRhMgo+Cj4gRXZl
cnkgT3BlblNCSSBmaXJtd2FyZSBpbWFnZSwgcmVnYXJkbGVzcyBvZiBpdHMgdHlwZSAoRldfRFlO
QU1JQywKPiBGV19KVU1QIG9yIEZXX1BBWUxPQUQpLCBzdGFydHMgd2l0aCBhIGZpeGVkIDEyOC1i
eXRlIGhlYWRlci4gVGhlIGhlYWRlcgo+IHNlcnZlcyB0d28gcHVycG9zZXM6Cj4KPiAxLiBpdCBs
ZXRzIHRoZSBwcmV2aW91cyBib290aW5nIHN0YWdlIHJlY29nbml6ZSBhbiBPcGVuU0JJIGZpcm13
YXJlCj4gICAgaW1hZ2UgYW5kIGZpbmQgb3V0IHdoYXQgaXQgd2FzIGJ1aWx0IGZvciwgYW5kCj4g
Mi4gaXQgZ2l2ZXMgdGhlIHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgYSB3ZWxsLWtub3duIHBsYWNl
IGluc2lkZSB0aGUKPiAgICBpbWFnZSB0byBoYW5kIG92ZXIgdGhlIGJvb3QgYXJndW1lbnRzIGJ5
IHBhdGNoaW5nIGEgZmV3IHdvcmRzLAo+ICAgIGluc3RlYWQgb2Ygc2V0dGluZyB1cCB0aGUgKmEw
KiwgKmExKiBhbmQgKmEyKiByZWdpc3RlcnMuCj4KPiBUaGlzIHNlcmllcyBhbHNvIHByb3ZpZGVz
IGEgZG9jdW1lbnQgJ2RvY3MvZmlybXdhcmUvZndfaGVhZGVyLm1kJyB0bwo+IGRlc2NyaWJlIHRo
ZSBsYXlvdXQgb2YgdGhlIDEyOC1ieXRlIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyLCB0aGUKPiBh
MC9hMS9hMiBvdmVycmlkZSBmbGFncywgd2hhdCBhIHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgaXMg
ZXhwZWN0ZWQgdG8gcHV0Cj4gaW4gZWFjaCByZWdpc3RlciwgYW5kIGFuIGV4YW1wbGUgb2YgaG93
IHRvIHBhdGNoIHRoZSBoZWFkZXIuCj4KPiBUaGFua3MgQW51cCBmb3IgZGlzY3Vzc2luZyBpdCBh
bmQgcHJvdmlkaW5nIHRoZSBpZGVhcwo+CgpIaSBBbnVwLApDb3VsZCBJIGtub3cgaWYgdGhpcyBw
YXRjaCBzZXQgbG9va3MgZ29vZCB0byB5b3U/IFRoYW5rcwoKPiBab25nIExpICgzKToKPiAgIGZp
cm13YXJlOiBmd19iYXNlLlM6IGFkZCBhIGZvcm1hdHRlZCBPcGVuU0JJIGZpcm13YXJlIGhlYWRl
cgo+ICAgZmlybXdhcmU6IGZ3X2Jhc2UuUzogb3ZlcnJpZGUgYTAsIGExIGFuZCBhMiBmcm9tIHRo
ZSBmaXJtd2FyZSBoZWFkZXIKPiAgIGRvY3M6IGZpcm13YXJlOiBkb2N1bWVudCB0aGUgT3BlblNC
SSBmaXJtd2FyZSBoZWFkZXIKPgo+ICBkb2NzL2Zpcm13YXJlL2Z3Lm1kICAgICAgICB8ICAgOSAr
KysKPiAgZG9jcy9maXJtd2FyZS9md19oZWFkZXIubWQgfCAxMjcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICBmaXJtd2FyZS9md19iYXNlLlMgICAgICAgICB8IDEwMCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDIzNiBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Zpcm13YXJlL2Z3X2hlYWRlci5t
ZAo+Cj4gLS0KPiAyLjQzLjcKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
