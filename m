Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E248C5DF86
	for <opensbi@archiver.kernel.org>; Wed, 19 Aug 2026 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDgrDKrnJoV2AI4Ze8wZZgMCiPQqMH6tMlCVOufQw4s=; b=IHv5hGN2iCutuZ
	31zp+arK0OwwWRlLX8r7fk+LPy3RP2j5Fd6wQgb9uNWVYsQJbxAxGS/xkyainONYBCaHDjKnsTXol
	9mgCCug0OIBHEV6HTsFEGWeZtTy1ATF8fT+N35nqa10FJBPEVoLYrBq6YArMK0nOaUiZtO1S1zFKz
	MO3NmOKicCABpADeNbbincKwjHwb+4tCYjbpfexYcsUFKaFQoqDlup0zI3hpcbkl2PWer3sz8xKLQ
	k+yAV6lgbOKUdiYFLknnqgkROrKyC0iXiXydPYVc2a9NGs2PMMXm9zLq5DHapiZisa4J2psaBn1Eg
	CLYSocVgl7kU33UzaiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfr1-00000009oOZ-2Qmz;
	Wed, 19 Aug 2026 12:57:15 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfqx-00000009oNl-13ly
	for opensbi@lists.infradead.org;
	Wed, 19 Aug 2026 12:57:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-495437bb891so7758925e9.1
        for <opensbi@lists.infradead.org>; Wed, 19 Aug 2026 05:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787144229; cv=none;
        d=google.com; s=arc-20260327;
        b=LkZQAT5w7jE2rpJZah8NKGZWylZkHzsbN2isgG+t28z8vmbLcQQ05lfhnYoyAngVBb
         U2Kfc3fVmEG05DKxRI528J07aYI9DDkpJ4KtfroFbygUL3bdMmDVGJRlpYfINBbP465u
         p/JkywjSJ8VlBCQ6bcCcpuICsCL9l0+x/PCocrfEi5pPht7dKP42l4/rSnZKJFelNFXS
         dOQx5xp485zchakYlGER08yRJTIDhmIl/08nWNur7mRFHlbpmHzv9dBaEoqmNxbnuu3o
         j0zc+UDw10mr0kTARScUdPabzjllmXX54lznjx7cc3pwwVlG3bmjO9X+m0/HgsS7l+oB
         FIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7JRpAFS6zG6la47OjZ/GJG4HvMJnrgPoMwigknEFJ3A=;
        fh=eQRLnJNeHQBGvSQQ3K81dsZjCFpV01l3b0rpGkosk9o=;
        b=RSpcIjEGGx4hrk9TnaGmt3/W1VtTGoeWhkQ59RPvDNxTVumGqqFZnOFPDKIBRYmbAI
         dM321WoX3vXVwwz5buOsa/gdIPm2asFKePTi5cTymj7DrvIo3G9zRZlgEtVCFz25XDGV
         Mzw78IU/8id/hHk36xaY5O06hkac52DvSieayfQrDs2tiC1hIOXV6BvH5VGE71vivE5E
         hCFdwKZzYakpC3p3VV+DVsNodZJBQfUSURN/yVEKxHpHXi4S9H3kSCQjDbzd4mfB6BqD
         DqkXl1SMYqwD44Sbeip+2MPMhuqozsCNvP5hsNKFW4aqCO3dfu/rUjvMYspbxeuRWcBF
         RRPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787144229; x=1787749029; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7JRpAFS6zG6la47OjZ/GJG4HvMJnrgPoMwigknEFJ3A=;
        b=V5M73ihxZZ2wH4LfkbTyTHKXr2A8+ihqCEpKYWMRgpXji8WXL9Xd91StVLaG4dr0P5
         e9I8duMpgza/VkYSOn/DbQDQRXFySyWmJmiRZJT3SDObwHOrtt/ovmhaIAYV1uH98dWm
         D2bWLuC5KyIrLzFjxq0jimdfyTw6Z+bs9T+mun9RZ1kN/aoLO0MW+U3waNDy91meOdDc
         dlMMACf463JNaw+PW+33BZlDdeDopHRcYB8SfkykjSk6wfWP4TF9Op2CRIsuLrYmM4Sm
         syEbF5g6gBux69L0U2KGqvzQTTykpxnEOunoBbMt13C7r4j2Pt1D647He3ZEhDDylOyR
         kYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144229; x=1787749029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JRpAFS6zG6la47OjZ/GJG4HvMJnrgPoMwigknEFJ3A=;
        b=TgjQc72Ywm0Nf7l83Rnntw/l/ndfMJ76lhnC6PTX/oj1mSSL8ApUs/8pXvB9Uoc70t
         Vl5DrnGvaDbfzrUi9PYHMmgR2IMV5XSGMN9MA4KIEAi8LF0ebRiB6vS2HcXrHaZXiGXF
         RhYYEpcP2F9pIK+ZZUvKwoKVhHKGZivJvbQ3LYbYzzKjbMlVTallTELEmNxQzgeRrL+J
         mOt1NjJuz8F0j91rh10z5nVKrNhnTYHMBNOjH6ViSV+juIAxgiht5hkzVlagXDAq9eYg
         xoFKh28yIxCIjFUB57gAqtKH3lse6YM5tOBbYeC5x8axtFke8Qs/cxeiy2/K6UN6X207
         5lig==
X-Gm-Message-State: AOJu0YwgMHqQuTUNFGfq4lxeykHmVxrs/WYGy2itBuG05VUwxp/uyHJ5
	JzaZ35TG4kIvAlBe0WZBSOnkm9i62TTLky2Ai8I9PuX9gZK1Hi+E8g7O33+74mTZFdx9xpl9rAb
	i5OXj7tUvKsMBbMR8LpzGBkuRPdVQEWsKj1gWYXf2IwNpjfZmoJGSJOJZSQ==
X-Gm-Gg: AR+sD11xWta493yY1xE1TyKDADM2xy3PdeGMN2xPSCGFlnFncwFXCZD6zC4FnWdWJiO
	LaabYA7qeUSZNuKBBk1pbnITLFViKqmj63anm5fToplgJW+Kl80IOGtuaGV6o8QAy0FkPxO354j
	P1h5Y51Iq3IUo8KP6y5j0SjbxleIuFMbvMwp8JLH+nj6mRRJUjShHWoMFU4WG8E4F+Iu87FCXvs
	Qyx8TWUe3lmhCXNhQoQuTqpoOpN5JbWUxSL0DlfAuQx1tSsNFZ94h2f3ZEs1g/0fIwFDrLw5qOj
	j1Om3BC4jlCrjefGjehsBc/I64+q+CHYhHZ3TY5lkfFsOcoMOaSrnBcvtxdwrqeA3+W6zZVboRp
	XoaGqVXNF5fGp17f2fk6sawoU8ggfoM4XolqXLUPDuRhMKakb660ndHEue7S8Vbc=
X-Received: by 2002:a05:600c:4e88:b0:495:648c:a1 with SMTP id
 5b1f17b1804b1-499aa0b7b16mr73094335e9.3.1787144228318; Wed, 19 Aug 2026
 05:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260707033954.2054859-1-zong.li@sifive.com>
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Aug 2026 18:26:56 +0530
X-Gm-Features: AcwNN1VKxVPbIuaw2pyEh5dnpIEG9_fJhW2X7Yd9FDRCAxuD6AflmPt3vD1y0Vk
Message-ID: <CAAhSdy0ctLCb6AhbQaz-TY2Bb8uGC6ToCaeCsADUJCyR-2WtDQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] firmware: add FW_DYNAMIC_APPEND firmware type
To: Zong Li <zong.li@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_055711_335313_BB8E0FE8 
X-CRM114-Status: GOOD (  26.03  )
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

T24gVHVlLCBKdWwgNywgMjAyNiBhdCA5OjEw4oCvQU0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgYSBmb3VydGggT3BlblNCSSBmaXJtd2Fy
ZSB0eXBlLCBGV19EWU5BTUlDX0FQUEVORCwgbmV4dCB0bwo+IHRoZSBleGlzdGluZyBGV19EWU5B
TUlDLCBGV19KVU1QIGFuZCBGV19QQVlMT0FELgo+Cj4gTW90aXZhdGlvbgo+ID09PT09PT09PT0K
Pgo+IEZXX0RZTkFNSUMgcmVxdWlyZXMgdGhlIHByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgdG8gYnVp
bGQgYSBzdHJ1Y3QKPiBmd19keW5hbWljX2luZm8gaW4gbWVtb3J5IGFuZCBwYXNzIGl0cyBhZGRy
ZXNzIGluIGEyLiBTb21lIGJvb3Rpbmcgc3RhZ2VzCj4gY2Fubm90IGVhc2lseSBhbGxvY2F0ZSBh
bmQgcGFzcyBzdWNoIGEgc3RydWN0dXJlLCBidXQgdGhleSBjYW4gbG9hZCB0aGUKPiBPcGVuU0JJ
IGltYWdlIGFuZCBwYXRjaCBhIGZldyB3b3JkcyBhdCBhIGtub3duIGxvY2F0aW9uIGJlZm9yZSBq
dW1waW5nIHRvCj4gaXQuIEZXX0RZTkFNSUNfQVBQRU5EIHRhcmdldHMgZXhhY3RseSB0aGF0IGNh
c2U6IHRoZSBzdHJ1Y3QgZndfZHluYW1pY19pbmZvCj4gaXMgYXBwZW5kZWQgaW50byB0aGUgT3Bl
blNCSSBiaW5hcnkgYW5kIHBhdGNoZWQgaW4gcGxhY2UgYnkgdGhlIHByZXZpb3VzCj4gc3RhZ2Uu
IEZvciBleGFtcGxlLCB0aGUgcHJldmlvdXMgYm9vdCBzdGFnZSBydW5zIG9uIGEgZGVkaWNhdGVk
IGhhcnQuCj4gVGhlcmVmb3JlLCBpdCBjYW5ub3Qgc2V0IHVwIENTUnMgb2YgYW5vdGhlciBoYXJ0
IHRoYXQgcnVucyBPcGVuU0JJLgo+IFRoaXMgc2NlbmFyaW8gd2lsbCBvY2N1cnMgaW4gc2VydmVy
IHN5c3RlbXMgd2l0aCBzZWN1cmUgYm9vdC4KPgo+IEtleSBkZXNpZ24gcG9pbnRzCj4gPT09PT09
PT09PT09PT09PT0KPgo+ICAgLSBUaGUgYXBwZW5kZWQgc3RydWN0IGZ3X2R5bmFtaWNfaW5mbyBp
cyBwbGFjZWQgaW1tZWRpYXRlbHkgYmVmb3JlIC5ic3MuCj4gICAgIC5ic3MgaXMgTk9CSVRTIGFu
ZCBpcyBkcm9wcGVkIGJ5ICdvYmpjb3B5IC1PIGJpbmFyeScsIHNvIGEgc3RydWN0dXJlCj4gICAg
IGFmdGVyIGl0IHdvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBmbGF0IC5iaW4uIFBsYWNpbmcgaXQg
YmVmb3JlIC5ic3MKPiAgICAgbWFrZXMgaXQgdGhlIGxhc3QgUFJPR0JJVFMgY29udGVudCwgaS5l
LiBpdCBzaXRzIGF0IHRoZSB0YWlsIG9mIHRoZQo+ICAgICAuYmluIGFuZCBjYW4gYmUgbG9jYXRl
ZCBmcm9tIHRoZSBpbWFnZSBzaXplLiBUaGUgcHJldmlvdXMgYm9vdGluZwo+ICAgICB0YWdlIGNh
biB0aGVyZWZvcmUgZmluZCB0aGUgc3RydWN0dXJlIGF0Ogo+Cj4gICAgICAgICBsb2FkX2FkZHJl
c3MgKyBiaW5hcnlfZmlsZV9zaXplIC0gc2l6ZW9mKHN0cnVjdCBmd19keW5hbWljX2luZm8pCj4K
PiAgIC0gc3RydWN0IGZ3X2R5bmFtaWNfaW5mbyBnYWlucyBhIG5ldyAnYm9vdF9kdGInIGZpZWxk
IChpbmZvIHZlcnNpb24gMykKPiAgICAgdG8gY2FycnkgdGhlIERUQiBhZGRyZXNzLiBFeGlzdGlu
ZyBvZmZzZXRzIGFyZSB1bmNoYW5nZWQuCj4KPiAgIC0gVGhlIHByZXZpb3VzIGJvb3Rpbmcgc3Rh
Z2UgcGF0Y2hlcyBldmVyeSBmaWVsZCBhdCBydW50aW1lLiBUaGUKPiAgICAgcmVzZXJ2YXRpb24g
aXMgYSBLRUVQKCkgUFJPR0JJVFMgc2VjdGlvbiwgc28gdGhlIHplcm8taW5pdGlhbGlzZWQKPiAg
ICAgYnl0ZXMgc3RpbGwgbGFuZCBhdCB0aGUgdGFpbCBvZiB0aGUgLmJpbi4KPgo+ICAgLSBPbiB0
aGUgY29sZC1ib290IHBhdGggKGd1YXJkZWQgYnkgRldfRFlOQU1JQ19BUFBFTkQpLCBmd19iYXNl
LlMgY2FsbHMKPiAgICAgZndfZHluYW1pY19hcHBlbmRfYm9vdF9hcmdzKCkgaW4gZndfZHluYW1p
Y19hcHBlbmQuUy4gVGhlIGhlbHBlciBzZXRzCj4gICAgIGEwID0gbWhhcnRpZCwgYTIgPSAmYXBw
ZW5kZWQgc3RydWN0LCBhbmQgYTEgPSBib290X2R0YiwgYW5kIGNsZWFycyB0aGUKPiAgICAgcmVz
ZXJ2ZWQgYTMvYTQgdGhhdCBmd19wbGF0Zm9ybV9pbml0IGNvbnN1bWVzLiBPbmx5IGEwLWE0IGFy
ZSBoYW5kbGVkCj4gICAgIGhlcmUsIHRoZSByZW1haW5pbmcgR1BScyBhcmUgYWxyZWFkeSBjbGVh
cmVkIGJ5IHRoZSBleGlzdGluZyBfcmVzZXRfcmVncwo+ICAgICBsYXRlciBvbiB0aGUgY29sZCBw
YXRoLiBUaGUgYm9vdF9kdGIgbG9hZCBpcyBnYXRlZCBvbiBpbmZvIHZlcnNpb24gMywgc28KPiAg
ICAgYW4gb2xkZXIgbGF5b3V0IGxlYXZlcyBhMSA9IDAgaW5zdGVhZCBvZiByZWFkaW5nIHBhc3Qg
dGhlIHN0cnVjdC4KPgo+IEJhY2t3YXJkIGNvbXBhdGliaWxpdHkKPiA9PT09PT09PT09PT09PT09
PT09PT09Cj4KPiBBbGwgY2hhbmdlcyBmb3IgdGhlIGV4aXN0aW5nIHRocmVlIGZpcm13YXJlIHR5
cGVzIGFyZSBjb21waWxlZCBvdXQ6IHRoZQo+IGZ3X2Jhc2UuUyBmaXh1cCBhbmQgdGhlIC5md19k
eW5hbWljX2luZm8gb3V0cHV0IHNlY3Rpb24gYXJlIHVuZGVyCj4gI2lmZGVmIEZXX0RZTkFNSUNf
QVBQRU5ELCB3aGljaCBpcyBkZWZpbmVkIG9ubHkgYnkgZndfZHluYW1pY19hcHBlbmQuUyBhbmQK
PiBmd19keW5hbWljX2FwcGVuZC5lbGYubGRTLiBGV19EWU5BTUlDLCBGV19KVU1QIGFuZCBGV19Q
QVlMT0FEIGJpbmFyaWVzIGFyZQo+IGJ5dGUtZm9yLWJ5dGUgdW5jaGFuZ2VkLgo+Cj4gQnVpbGQK
PiA9PT09PQo+Cj4gICBtYWtlIFBMQVRGT1JNPTxwbGF0Zm9ybV9zdWJkaXI+IEZXX0RZTkFNSUNf
QVBQRU5EPXkKPgo+IE9uIHRoZSBnZW5lcmljIHBsYXRmb3JtIEZXX0RZTkFNSUNfQVBQRU5EPXkg
aXMgc2V0IGluCj4gcGxhdGZvcm0vZ2VuZXJpYy9vYmplY3RzLm1rLCBzbyBpdCBpcyBidWlsdCBi
eSBkZWZhdWx0Lgo+Cj4gWm9uZyBMaSAoNyk6Cj4gICBmaXJtd2FyZTogZndfZHluYW1pYzogYWRk
IGJvb3RfZHRiIGZpZWxkIHRvIHN0cnVjdCBmd19keW5hbWljX2luZm8KPiAgIGZpcm13YXJlOiBm
d19iYXNlLmxkUzogYWRkIC5md19keW5hbWljX2luZm8gb3V0cHV0IHNlY3Rpb24gYmVmb3JlIC5i
c3MKPiAgIGZpcm13YXJlOiBhZGQgZndfZHluYW1pY19hcHBlbmQgZmlybXdhcmUgdHlwZQo+ICAg
ZmlybXdhcmU6IGZ3X2Jhc2UuUzogY2FsbCBmd19keW5hbWljX2FwcGVuZF9ib290X2FyZ3Mgb24g
Y29sZCBib290Cj4gICBmaXJtd2FyZTogYnVpbGQgYW5kIGVuYWJsZSB0aGUgRldfRFlOQU1JQ19B
UFBFTkQgZmlybXdhcmUgdHlwZQo+ICAgZG9jczogZmlybXdhcmU6IGRvY3VtZW50IHRoZSBGV19E
WU5BTUlDX0FQUEVORCBmaXJtd2FyZSB0eXBlCj4gICBkb2NzOiBmaXJtd2FyZTogbGlzdCBGV19E
WU5BTUlDX0FQUEVORCBpbiBmdy5tZAoKSW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBuZXcgZmlybXdh
cmUgdHlwZSwgc2FtZSB0aGluZyBjYW4gYmUgYWNoaWV2ZWQgYnkKc2ltcGx5IGludHJvZHVjaW5n
IGEgZm9ybWF0dGVkIGhlYWRlciBmb3IgYWxsIE9wZW5TQkkgZmlybXdhcmUuCgpJZiB0aGUgcHJl
dmlvdXMgYm9vdGluZyBzdGFnZSBjYW5ub3QgcGFzcyBwYXJhbWV0ZXJzIGluIGEwLCBhMSwgYW5k
IGEyCnRoZW4gaXQgY2FuIHNpbXBseSBvdmVycmlkZSB0aGUgdmFsdWVzIG9mIGEwLCBhMSwgYW5k
IGEyIGJ5IHNldHRpbmcgZmllbGRzCmluIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyLgoKRm9yIGV4
YW1wbGUsIHdlIGNhbiBoYXZlIDEyOC1ieXRlIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyIGRlZmlu
ZWQKaW4gZndfYmFzZS5TIGFzIGZvbGxvd3M6CgpkaWZmIC0tZ2l0IGEvZmlybXdhcmUvZndfYmFz
ZS5TIGIvZmlybXdhcmUvZndfYmFzZS5TCmluZGV4IDBjNWM2NWMxLi4wZDYzZmUxZSAxMDA2NDQK
LS0tIGEvZmlybXdhcmUvZndfYmFzZS5TCisrKyBiL2Zpcm13YXJlL2Z3X2Jhc2UuUwpAQCAtNDQs
OCArNDQsNjQgQEAKICAuc2VjdGlvbiAuZW50cnksICJheCIsICVwcm9nYml0cwogIC5hbGlnbiAz
CiAgLmdsb2JsIF9zdGFydAorIC5nbG9ibCBfc3RhcnRfcmVhbAogIC5nbG9ibCBfc3RhcnRfd2Fy
bQogX3N0YXJ0OgorIC8qIE9wZW5TQkkgZmlybXdhcmUgaGVhZGVyICovCitfZndfaGVhZGVyX2p1
bXA6CisgLm9wdGlvbiBwdXNoCisgLm9wdGlvbiBub3J2YworIGogX3N0YXJ0X3JlYWwKKyAub3B0
aW9uIHBvcAorX2Z3X2hlYWRlcl9tYWdpYzoKKyAud29yZCAweDQ5NDI1MzRmIC8qIEFTQ0lJIHN0
cmluZyAiT1NCSSIgKi8KK19md19oZWFkZXJfdmVyc2lvbjoKKyAud29yZCAweDEKK19md19oZWFk
ZXJfeGxlbjoKKyAud29yZCBfX3Jpc2N2X3hsZW4KK19md19oZWFkZXJfc2l6ZToKKyAud29yZCAo
X2Z3X2VuZCAtIF9md19zdGFydCkKK19md19oZWFkZXJfZmxhZ3M6CisjZGVmaW5lIEZXX0hFQURF
Ul9GTEFHU19PVkVSUklERV9BMCAoMSA8PCAwKQorI2RlZmluZSBGV19IRUFERVJfRkxBR1NfT1ZF
UlJJREVfQTEgKDEgPDwgMSkKKyNkZWZpbmUgRldfSEVBREVSX0ZMQUdTX09WRVJSSURFX0EyICgx
IDw8IDIpCisgLndvcmQgMAorX2Z3X2hlYWRlcl9vdmVycmlkZV9hMDoKKyAuZHdvcmQgMAorX2Z3
X2hlYWRlcl9yZXNlcnZlZDA6CisgLmR3b3JkIDAKK19md19oZWFkZXJfb3ZlcnJpZGVfYTE6Cisg
LmR3b3JkIDAKK19md19oZWFkZXJfcmVzZXJ2ZWQxOgorIC5kd29yZCAwCitfZndfaGVhZGVyX292
ZXJyaWRlX2EyOgorIC5kd29yZCAwCitfZndfaGVhZGVyX3Jlc2VydmVkMjoKKyAuZHdvcmQgMAor
X2Z3X2hlYWRlcl9yZXNlcnZlZDoKKyAuZmlsbCA3LCA4LCAwCitfc3RhcnRfcmVhbDoKKyAvKiBD
aGVjayBhbmQgb3ZlcnJpZGUgYTAsIGExLCBhbmQgYTIgcmVnaXN0ZXJzICovCisgbGxhIHQwLCBf
ZndfaGVhZGVyX2ZsYWdzCisgbHcgdDAsICh0MCkKKyBsaSB0MSwgRldfSEVBREVSX0ZMQUdTX09W
RVJSSURFX0EwCisgYW5kIHQyLCB0MCwgdDEKKyBiZXEgdDIsIHplcm8sIF9za2lwX292ZXJyaWRl
X2EwCisgbGxhIHQyLCBfZndfaGVhZGVyX292ZXJyaWRlX2EwCisgUkVHX0wgYTAsICh0MikKK19z
a2lwX292ZXJyaWRlX2EwOgorIGxpIHQxLCBGV19IRUFERVJfRkxBR1NfT1ZFUlJJREVfQTEKKyBh
bmQgdDIsIHQwLCB0MQorIGJlcSB0MiwgemVybywgX3NraXBfb3ZlcnJpZGVfYTEKKyBsbGEgdDIs
IF9md19oZWFkZXJfb3ZlcnJpZGVfYTEKKyBSRUdfTCBhMSwgKHQyKQorX3NraXBfb3ZlcnJpZGVf
YTE6CisgbGkgdDEsIEZXX0hFQURFUl9GTEFHU19PVkVSUklERV9BMgorIGFuZCB0MiwgdDAsIHQx
CisgYmVxIHQyLCB6ZXJvLCBfc2tpcF9vdmVycmlkZV9hMgorIGxsYSB0MiwgX2Z3X2hlYWRlcl9v
dmVycmlkZV9hMgorIFJFR19MIGEyLCAodDIpCitfc2tpcF9vdmVycmlkZV9hMjoKICAvKiBGaW5k
IHByZWZlcnJlZCBib290IEhBUlQgaWQgKi8KICBNT1ZfM1IgczAsIGEwLCBzMSwgYTEsIHMyLCBh
MgogIGNhbGwgZndfYm9vdF9oYXJ0CgoKUGxlYXNlIG5vdGUgdGhhdCBPcGVuU0JJIGZpcm13YXJl
IGhlYWRlciBkZWZpbmVkIGFib3ZlIHNob3VsZAp3b3JrIGZvciBib3RoIFJWMzIgYW5kIFJWNjQg
YW5kIGluIHRoZSBmdXR1cmUgY2FuIGFsc28gYmUgZXh0ZW5kZWQKZm9yIFJWMTI4LgoKUmVnYXJk
cywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
