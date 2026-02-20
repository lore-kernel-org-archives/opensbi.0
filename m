Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B888FC55190
	for <opensbi@archiver.kernel.org>; Fri, 20 Feb 2026 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkzS0DhpXVSxfL0LkmeK+6heHUnmaEA/KEWOGsMuHJ8=; b=JP2c7jVxShe4qq
	p6C0oPQgRcnerElixBm2mMysqEHf2FrvurhYjaxWXrZiDlGlpSwgmpZVIMqGA0ygU4zN9xl/sArhZ
	TfLBXsha0LMGIXRFzpFg774Ihk5d0XgliQKX0FSkCkesUvxT41imgcdbscROsQDGg2qNajT2HESe6
	6IEGd+qO1pF2jzhK3RAPnOiw0nOJq1HoOACXxQZDN39/871dawEXaNLE4qHzlpXsPp6lJ5VTb7blu
	1RTYAKeNtW1Kcn8PzqyosOh97LR64zmmLlKxwJNsEUIMIiAcRK0ibOgsqu11bwRaYqAv/UNVifS8s
	Qb/IbFVoiWupe/Ew10JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOSQ-0000000ENio-0bVy;
	Fri, 20 Feb 2026 11:14:02 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtOSN-0000000ENgV-0b8f
	for opensbi@lists.infradead.org;
	Fri, 20 Feb 2026 11:14:00 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-45f015a3259so657581b6e.2
        for <opensbi@lists.infradead.org>; Fri, 20 Feb 2026 03:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771586038; cv=none;
        d=google.com; s=arc-20240605;
        b=lX3VSbdI3l+oOk4dGWlZUi0lHem8/vkWlTbwsFzPRPsLXGfU5rnvvLe9dRvy8Ykqut
         gWuFl45g46vv14cTfq5URRYwJi8RLxfeKd0XOvzKQFZlMC1pTRLYHOEGoDf/OIWI/63T
         uZffQMGFArS1BEZ5jhymXO+kuFznDqd6MuHQAeJ7w+KIt6RHJfq6oU0kEBfUoDjwvgEg
         0EIYU5gFYdQILZygruVafXdQj3JCKXHBisTFBkUZrXwGvFUzMyU4SlacUZOqvurCGBOs
         pFQOiprdtSQX3ja3qcqOF6vozsp/V2NnNNFtjWKkU6M7/K+MyaKk9sEswkeaOVz28mHY
         sx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iDrTLYtxVqo+mM/EvDY5jVWPMhg3s2+duuiqReGbjDM=;
        fh=tJk5vbIrIisWZfuzYj85815zP9FzroS2sAcdGFaCXjs=;
        b=Wt2qlo+mtNSnSuyVYVIcp/1XRoi4dylbHbxo1EwAgCdO33hsll5AO3f5TO6sLHqkM9
         evIWWeMHxTshiEcYnGdzQrVJbbVCU9yBblBMWtZz2jPMMZYTbTeQsCwzumiizACuSJOl
         2HP+lIt9Wy9qYfDy8Z6dzzNaL7+RzDAAH3eDJXYNlJnuGxvzuUInVcX9WCF3rK3kwe/D
         gK3maG4XXmkejy9lfdWpjYqUYjOFDAV4v9Do/OhFQ57hhnjel8f19DGqi+lXb9XgdLNc
         nV7xp5WDMGhVVk81I+SCHmm0JxuPNzuM2io6WbgGKH6aa2c/xZi8bH7R1KtuExQaTXtl
         oBFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1771586038; x=1772190838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDrTLYtxVqo+mM/EvDY5jVWPMhg3s2+duuiqReGbjDM=;
        b=H8fHLl4QSOQMV0TpE+zEY6+3FhAqMLGlHPW2n2iUZLoAGzaQIsfhs6tURtjIbuNbQE
         kSjK7PtBEuN59eKs7zuEs4G41egd1YdOJA6YPjCFnAqk7PNl1VyJ4II3ic8Fj+rfNs7W
         9p8qWxfhrIenZRGkiTU7vT5nRbXSHQIYaPLn7lWWl6XNCzXnJOF/bABQ25i4QAPNr2ec
         YIG9S0+ytJmNM99ov7olD0mH/XL/t2wjNVXKYusW+Be1EwndJFA/fGga4qNfkUhaf2MQ
         Za2zqZVnDMbSlJ+NFVyMmT4wTqJ9PCUlaybeq275fZ0vUumblBRzR6sEuD7P+HTF3KTX
         DEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771586038; x=1772190838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iDrTLYtxVqo+mM/EvDY5jVWPMhg3s2+duuiqReGbjDM=;
        b=qPxSizSS1j+hxaqPkEZEnLz4bDgxYMDMs/EVNc3SKIE/LFWn3tIOoaqaJ8BSnv6hRN
         kbQALcNVa576HAeC1OPeDJq3/REeBHJDT6Z3NDYQ55MEwJujnxySbHM0G633lvkwRhmL
         ItBsBjv18fO2sm+QIaQE9fHg0bPj8VvxSDxI3hNtGZ1EsFR6GtucK4sSfMn/ENUYFIbJ
         AmNzOMbvmY3EVgtsfhUy+sh6m8Ju/ousOhWEmrfNozYsj0y+YEEWD28TcAkpO0mebC0/
         p4hdrJnBw9bbtjAI2dpfE9OCMZXmWqZ3stMVkCvPe5W5rUm9HPvoa+QHVGjsIT32wE95
         gNXA==
X-Gm-Message-State: AOJu0YwF8COUULF+ujBZFkiUJRVLsFoziV1r9zs5vVUjfPvo42fXzX4+
	l/GBlc2pvf2nFGrhMeROKJ4mpmEbl5BLCALhHFkWZzXqYzU+Q4wtlmJudOF2BmUf1g+APNGB5gC
	TUribqHXE5t5NxSXCx95TdTTNxNt5NyViYmz4iBmPDfd+XNKjc8od
X-Gm-Gg: AZuq6aJT4ahObZ3OItEjXqZtngLi2eJpKTRJEzWbr1hHe03MkpQutFGt3EWBltti437
	9nM45fA2UIqCBp2DeSzCeZQ2rgZ8HHR6tx18BJdDN/vnL3Lu9eaP74GiD4uRlcabV0rKeALOJm2
	bJKEWRTCppkKl4WoWpSi+dY+VeezWY9DGyI7XxsMT+of1h3LaYmiN8VV9S4DF3b8m+wQG9WQavv
	qFpVUm7uZV103QHRJA31HizpC9SzOO/7WCYypiFVY6oNxXOTCU6tjTmNuzGdzYrrSp/qkoX0smE
	0jwOZlGi45oe4XnHZ3/gQMoLJPXcPOhVL8JyOKsG0mj++li0r5IcvMlRn6wr4Yn9SalMy48=
X-Received: by 2002:a05:6820:1c94:b0:661:cc1:50c0 with SMTP id
 006d021491bc7-67858ef3a2bmr10908372eaf.11.1771586037687; Fri, 20 Feb 2026
 03:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20260104051812.128496-1-wxjstz@126.com>
In-Reply-To: <20260104051812.128496-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Feb 2026 16:43:46 +0530
X-Gm-Features: AaiRm52MWGSF6-LpTnRlOibU5UGGq83FRSBzkzicEJpKA02ymjwhkkAFGpeZ7b0
Message-ID: <CAAhSdy1qA2F_fwvUw1MUMvNKfyeo1wdktOPabLoRoM306Zr1BQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] firmware: Initialize stack guard via Zkr
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_031359_857652_4E1BD226 
X-CRM114-Status: GOOD (  13.62  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCAxMDo0OOKAr0FNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFRyeSB0byBpbml0aWFsaXplIHN0YWNrIHByb3RlY3Rpb24gZ3VhcmQgdmlh
IHRoZSB6a3IgZXh0ZW5zaW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgVyA8d3hqc3R6QDEy
Ni5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5r
cywKQW51cAoKCj4gLS0tCj4gIGZpcm13YXJlL2Z3X2Jhc2UuUyAgICAgICAgICAgfCAyNCArKysr
KysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCB8IDEw
ICsrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZmlybXdhcmUvZndfYmFzZS5TIGIvZmlybXdhcmUvZndfYmFzZS5TCj4gaW5kZXgg
YmNlOWUyMjYuLjYzYmI0NDczIDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL2Z3X2Jhc2UuUwo+ICsr
KyBiL2Zpcm13YXJlL2Z3X2Jhc2UuUwo+IEBAIC0xMDcsNiArMTA3LDMwIEBAIF9ic3NfemVybzoK
PiAgICAgICAgIGFkZCAgICAgczQsIHM0LCBfX1NJWkVPRl9QT0lOVEVSX18KPiAgICAgICAgIGJs
dCAgICAgczQsIHM1LCBfYnNzX3plcm8KPgo+ICsgICAgICAgLyogVHJ5aW5nIHRvIGluaXRpYWxp
emUgdGhlIHN0YWNrIGd1YXJkIHZpYSB0aGUgWmtyIGV4dGVuc2lvbiAqLwo+ICsgICAgICAgbGxh
ICAgICB0MCwgX19zdGFja19jaGtfZ3VhcmRfZG9uZQo+ICsgICAgICAgY3NydyAgICBDU1JfTVRW
RUMsIHQwCj4gKyAgICAgICBsaSAgICAgIHQwLCAwCj4gKyAgICAgICBsaSAgICAgIHQzLCBTRUVE
X09QVFNfRVMxNgo+ICsgICAgICAgbGkgICAgICB0NCwgU0VFRF9FTlRST1BZX01BU0sKPiArICAg
ICAgIGxpICAgICAgdDUsIF9fU0laRU9GX1BPSU5URVJfXwo+ICtfX3N0YWNrX2Noa19ndWFyZF9s
b29wOgo+ICsgICAgICAgY3NycncgICB0MSwgQ1NSX1NFRUQsIHgwCj4gKyAgICAgICBsaSAgICAg
IHQyLCBTRUVEX09QVFNfTUFTSwo+ICsgICAgICAgYW5kICAgICB0MiwgdDIsIHQxCj4gKyAgICAg
ICBiZ3R1ICAgIHQyLCB0MywgX19zdGFja19jaGtfZ3VhcmRfZG9uZQo+ICsgICAgICAgYmx0dSAg
ICB0MiwgdDMsIF9fc3RhY2tfY2hrX2d1YXJkX2xvb3AKPiArICAgICAgIGFuZCAgICAgdDEsIHQx
LCB0NAo+ICsgICAgICAgc2xsaSAgICB0MCwgdDAsIDE2Cj4gKyAgICAgICBvciAgICAgIHQwLCB0
MCwgdDEKPiArICAgICAgIGFkZGkgICAgdDUsIHQ1LCAtMgo+ICsgICAgICAgYmd0eiAgICB0NSwg
X19zdGFja19jaGtfZ3VhcmRfbG9vcAo+ICsgICAgICAgbGxhICAgICB0MSwgX19zdGFja19jaGtf
Z3VhcmQKPiArICAgICAgIFJFR19TICAgdDAsIDAodDEpCj4gKyAgICAgICBqICAgICAgIF9fc3Rh
Y2tfY2hrX2d1YXJkX2RvbmUKPiArICAgICAgIC5hbGlnbiAzCj4gK19fc3RhY2tfY2hrX2d1YXJk
X2RvbmU6Cj4gKwo+ICAgICAgICAgLyogU2V0dXAgdGVtcG9yYXJ5IHRyYXAgaGFuZGxlciAqLwo+
ICAgICAgICAgbGxhICAgICBzNCwgX3N0YXJ0X2hhbmcKPiAgICAgICAgIGNzcncgICAgQ1NSX01U
VkVDLCBzNAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oIGIvaW5j
bHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+IGluZGV4IGI1YTRjZTgxLi4zYzFkNTI1NiAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gKysrIGIvaW5jbHVkZS9z
YmkvcmlzY3ZfZW5jb2RpbmcuaAo+IEBAIC0yNjEsNiArMjYxLDE2IEBACj4gICNkZWZpbmUgQ1NS
X0ZSTSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDIKPiAgI2RlZmluZSBDU1Jf
RkNTUiAgICAgICAgICAgICAgICAgICAgICAgMHgwMDMKPgo+ICsvKiBVc2VyIGVudHJvcHkgc291
cmNlICovCj4gKyNkZWZpbmUgQ1NSX1NFRUQgICAgICAgICAgICAgICAgICAgICAgIDB4MDE1Cj4g
KyNkZWZpbmUgU0VFRF9PUFRTX1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgMzAKPiArI2Rl
ZmluZSBTRUVEX09QVFNfTUFTSyAgICAgICAgICAgICAgICAgKF9VTCgzKSA8PCBTRUVEX09QVFNf
U0hJRlQpCj4gKyNkZWZpbmUgU0VFRF9PUFRTX0JJU1QgICAgICAgICAgICAgICAgIChfVUwoMCkg
PDwgU0VFRF9PUFRTX1NISUZUKQo+ICsjZGVmaW5lIFNFRURfT1BUU19XQUlUICAgICAgICAgICAg
ICAgICAoX1VMKDEpIDw8IFNFRURfT1BUU19TSElGVCkKPiArI2RlZmluZSBTRUVEX09QVFNfRVMx
NiAgICAgICAgICAgICAgICAgKF9VTCgyKSA8PCBTRUVEX09QVFNfU0hJRlQpCj4gKyNkZWZpbmUg
U0VFRF9PUFRTX0RFQUQgICAgICAgICAgICAgICAgIChfVUwoMykgPDwgU0VFRF9PUFRTX1NISUZU
KQo+ICsjZGVmaW5lIFNFRURfRU5UUk9QWV9NQVNLICAgICAgICAgICAgICAweGZmZmYKPiArCj4g
IC8qIFVzZXIgQ291bnRlcnMvVGltZXJzICovCj4gICNkZWZpbmUgQ1NSX0NZQ0xFICAgICAgICAg
ICAgICAgICAgICAgIDB4YzAwCj4gICNkZWZpbmUgQ1NSX1RJTUUgICAgICAgICAgICAgICAgICAg
ICAgIDB4YzAxCj4gLS0KPiAyLjQ3LjMKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
