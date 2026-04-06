Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B17DE64006
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 05:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cv+p/i3STHghD/2pnB9B8UlXhrIcORuJOy2dj2iCyk=; b=VpePfz7CdBzpLE
	B0yapSjTGnTCpgrqH4bxCRLsyXBb5O2nWnS5PhzPbPncQWfKhEFBLWSNhEQEHMjTy5oY6V0Y2Iupn
	zhfJ+lsLAea4+CE4KYok5sxpqCpBRwTxAkO7Ku0SuFY7aeH4mAAiZhO99qXoRo1i7tl8ICpXra3DM
	u7AmMiQ3RiuzNMtsI/bjZmg+GnDBW44SoprXy/dKqXp6JAoYR0vdYBSi0aMxE4R1QwKlGS2MfCR1A
	nutEZ2U/V21B6GircT8wiK60Px78uEZWARDguOQxfdWfRWl6Xg5CtS01zl7zmvLyg7DW0XHdbnUxA
	BgnIDJzTyUsBkSEi+/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9chh-00000004og8-072d;
	Mon, 06 Apr 2026 05:40:53 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9chd-00000004ofB-0IUu
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 05:40:52 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d7f09aa39fso4684348a34.0
        for <opensbi@lists.infradead.org>; Sun, 05 Apr 2026 22:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775454048; cv=none;
        d=google.com; s=arc-20240605;
        b=d1U9NMVUsNmZ8lyjHxK8FxDIUeLOs3txBsuxSTkWSjkKphov5JkPIU09ve7IrDoRl1
         5KFZDKzomXsybHkYvGIEwnz/Q61TLugvRjvW9lDRB7kuIIQ6MovH9rcRk7dSJHtzXMlN
         iU9UMAvAmlAmgBy13NPeXaRIN6VzEmGmWuO9ab3wDL8KAyySVAYH7CZNDf+Ao/YRx7Dj
         +Y37nqk+yggBGp5udr0spsoiEYhmPCsEFMsqj3vp5xy1sip/l/aNEahv16A6dmGMc9Eh
         vMUkFN2x6XrWLynzrarcVZ3wrEop+f0CGybOqLOj2u5UUli25nh3JitiDipyGxOrI5TD
         +23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CceoVtxyiR7u04V0X8BD2qTyWbwdcKBTCp2uidosCAk=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=WS5yuqA/rFd8+ZykDtHFt9kanjtZ6OANao099jmylsdA8olaeIdAarFrEO6bnQY879
         Yz3lnDoJ2o5Ry109VE9EPva78TJ71r1Dnvx9dDCH18f5LB5Rvsm10l3SWqoGikxJYb7+
         PArf+1ZcmG0nx4w4WBcObDPayVab4JQ0tn7r+xV4NyrEEyjZUTVkVCFgcWMS8sRTW2uY
         pgcTMyg5Da4KFk6I3cNFWpvWyMWeICQxiwY0D5TI2uwoZP1dP3KivSA+jl5NWlmrPv6u
         8v1KcO4foLzl1OJdZtytbFKs/kIJQb87zJjPX3LmmUc/9j3FL9HIgGETQR79X6Hb6hn5
         XJ6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775454048; x=1776058848; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CceoVtxyiR7u04V0X8BD2qTyWbwdcKBTCp2uidosCAk=;
        b=qeh9qr0ViVuBPwbntmUTuU6QGneEZXLWL/YEeszeVgfW/6FvzC6zJeRt7UedPrQ3s/
         tgVilsfbNxhjL3P95grYVBT1gCXddEn+4CfhRZHn7s3tuj5ToKSlI6yoE0FxmagckP4/
         n9Vzwpw56WfltEC2C3WQPnEN+EPaDMTSsFjTLwq4E90Knf6Z1/o6/BwN5pW0LQBHQfAf
         BY1+1DooNyj22V+RU5Lr7g7MEaS6HtKg+wF/SQwpzEtHr/Y8IDN8qE4argNVvNnK98+T
         rUhNZwFaTEbefotgoZFCSCuvmJDzQK6cdyUdR93Tz25xlmVuTMhtHOOgNS+wagiBxmyw
         iDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775454048; x=1776058848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CceoVtxyiR7u04V0X8BD2qTyWbwdcKBTCp2uidosCAk=;
        b=VuqaBQtG6JisfbiLUhclGgSpHtqs/TNcCvjscBE3ol5oKxvboxEqmGTnT0aFFDYZmG
         3zs2jxAB9t7OZPhQL22EyF+xlFrtaQ/f+zEJ9KOtgDfJMvVdg8Vem1zenXh56yFY9Qk6
         Gb25hcNJq26pD7IEtCCA/NolKJWbqObpPaGvfDmb/lW00DrueraRbOeHA2Dvfryb3mw6
         sBWpOm79TXHwaiq7o5gTn2pml12ngqafOK1dKK+myJcQHgahFTXqhjHN1ARnawIajk6v
         psreO0ansgjF2dmwKZGbqhCec2SB0sNtuui/1y0XJkDk55I9+e4BYDA3nBcZ0JQGdICZ
         bzxw==
X-Gm-Message-State: AOJu0Yz2YKw+ZVaxTlrb+0nUnzvKzbBfK4xWXETTYH8AV7biQ31hcYk9
	2l1LqYxXuzbo57M/XC6TOW3jvejDMV9+VK+IUqeUT3QzmMtdNGq1GvIVCYzl7jzIGvbicQb9CwE
	tuQtSDU0LqajImOwvbUsRfT1TbBahrkx13LtmTqBIFQ==
X-Gm-Gg: AeBDiet0qRG5wbg5/SqtWtOjB2klzVpWgFuQp6/8YxNkXGzdzy0g1B0el4mIqqojfJw
	1gV932XwQE7RteXXaAYZHgK1ZjFITAMDKdLiEMsXq2x8I+u0dbCqwmnR0q8bSumGX4i03/zi341
	aw3dLYL43XXXcexdRmZ3OvfvyH1bhV23gNE6Q8hoJzC88Wzwp1EGdxcLS+0doXEvTxxr12hdbln
	XbHelIuF8MSw51VeL8wY7lmwaaNfaJ0NhRKcayDNhA9FKwdgVzZXMj1gXrZ4fCDkjjodJh4ei2+
	BuO8iTnhffEYPsTGZmYWoJdhFO5qzPdUuwUvJyByuNEYjp7MVZxlJ2RQNEaxOInVYELm9pTYg2A
	vEktIBb8ZF7cbBtsSHLtON3iNDw==
X-Received: by 2002:a05:6820:2004:b0:682:644b:ba03 with SMTP id
 006d021491bc7-682644bbbaamr5943426eaf.16.1775454047971; Sun, 05 Apr 2026
 22:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260224031733.3817148-1-peter.lin@sifive.com> <20260224031733.3817148-3-peter.lin@sifive.com>
In-Reply-To: <20260224031733.3817148-3-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Apr 2026 11:10:36 +0530
X-Gm-Features: AQROBzCwq8oYX84acG0DhKxnYGLLOqHP26g3mcvr5_ShYSIG35am32lldeTYUOE
Message-ID: <CAAhSdy3bCFA9y8eBhjrPhFCOL-GDavDdDxjPdGOBuOfYs+Mhcw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] sifive_dev_platform: Set default MMIO region when
 SmePMP is enabled
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_224050_801975_44EDBED6 
X-CRM114-Status: GOOD (  21.18  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgODo0N+KAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gU2V0IGEgZGVmYXVsdCBNTUlPIHJlZ2lvbiB3
aXRoIGEgc2luZ2xlIFNtZVBNUCBlbnRyeSwgd2hpY2ggYWxsb3dzIHVzCj4gdG8gc2F2ZSBlbnRy
aWVzIGZvciBNLW1vZGUgb25seSBkZXZpY2VzLiBUaGUgZGVmYXVsdCBlbnRyeSBoYXMgTS0vUy1t
b2RlCj4gc2hhcmVkIHBlcm1pc3Npb24sIHNvIHN5c3RlbS1sZXZlbCByZXNvdXJjZSBwcm90ZWN0
aW9uLCBzdWNoIGFzIFJJU0MtVgo+IFdvcmxkIGV4dGVuc2lvbiBhbmQgV29ybGRHdWFyZCBjaGVj
a2VyLCB3aWxsIGJlIGludHJvZHVjZWQgdG8gcHJvdGVjdAo+IE0tbW9kZSBvbmx5IHJlZ2lvbiBh
Y2Nlc3MgZnJvbSBsb3dlciBwcml2aWxlZ2UgbW9kZXMuCj4KPiBSZXZpZXdlZC1ieTogR3JlZW50
aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8
em9uZy5saUBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8
cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvc2lmaXZlL3Np
Zml2ZV9kZXZfcGxhdGZvcm0uYyB8IDQ4ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmlj
L3NpZml2ZS9zaWZpdmVfZGV2X3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3NpZml2ZS9z
aWZpdmVfZGV2X3BsYXRmb3JtLmMKPiBpbmRleCBmYWNjMDQ0ZjEuLjk3OTllNWI4OCAxMDA2NDQK
PiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3NpZml2ZS9zaWZpdmVfZGV2X3BsYXRmb3JtLmMKPiAr
KysgYi9wbGF0Zm9ybS9nZW5lcmljL3NpZml2ZS9zaWZpdmVfZGV2X3BsYXRmb3JtLmMKPiBAQCAt
NSwxMCArNSw1OCBAQAo+ICAgKi8KPgo+ICAjaW5jbHVkZSA8cGxhdGZvcm1fb3ZlcnJpZGUuaD4K
PiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydC5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNo
Lmg+Cj4gKwo+ICsvKgo+ICsgKiBJbnN0ZWFkIG9mIGFsbG9jYXRpbmcgaW5kaXZpZHVhbCBQTVAg
ZW50cmllcyBmb3IgZWFjaCBNLW1vZGUKPiArICogTU1JTyBkcml2ZXIsIGNvbmZpZ3VyZSBTTUVQ
TVAgcmVnaW9ucyB0byBncmFudCBSL1cgcGVybWlzc2lvbgo+ICsgKiB0byBwZXJpcGhlcmFsIGFu
ZCBzeXN0ZW0gcG9ydHMgZm9yIGFsbCBwcml2aWxlZ2UgbW9kZXMuCj4gKyAqIEZpbmVyLWdyYWlu
ZWQgYWNjZXNzIGNvbnRyb2wgaXMgZW5mb3JjZWQgYnkgd2dDaGVja2VyIHJ1bGVzLgo+ICsgKi8K
PiArc3RhdGljIGludCBzaWZpdmVfc21lcG1wX3NldHVwKHZvaWQpCj4gK3sKPiArICAgICAgIHN0
cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCA9IHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpOwo+
ICsgICAgICAgaW50IHJjOwo+ICsKPiArICAgICAgIGlmICghc2JpX2hhcnRfaGFzX2V4dGVuc2lv
bihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01FUE1QKSkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gKwo+ICsgICAgICAgLyogUGVyaXBoZXJhbCBwb3J0IHJlZ2lvbjogMCB0byAyR2lCICov
Cj4gKyAgICAgICByYyA9IHNiaV9kb21haW5fcm9vdF9hZGRfbWVtcmFuZ2UoMHgwLCAweDgwMDAw
MDAwLCAweDgwMDAwMDAwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNCSV9ET01BSU5fTUVNUkVHSU9OX01NSU8gfAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFNCSV9ET01BSU5fTUVNUkVHSU9OX1NIQVJFRF9TVVJXX01SVyk7
Cj4gKyAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKPiArCj4gKyAg
ICAgICAvKiBTeXN0ZW0gcG9ydCByZWdpb246IDUxMkdpQiB0byAxVGlCICovCj4gKyAgICAgICBy
YyA9IHNiaV9kb21haW5fcm9vdF9hZGRfbWVtcmFuZ2UoMHg4MDAwMDAwMDAwLCAweDgwMDAwMDAw
MDAsIDB4ODAwMDAwMDAwMCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9NTUlPIHwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9TSEFSRURfU1VSV19NUlcp
Owo+ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7CgpUaGlzIGJy
ZWFrcyBjb21waWxhdGlvbiBvZiBnZW5lcmljIHBsYXRmb3JtIG9uIFJWMzIgYmVjYXVzZQphZGRy
ZXNzZXMgYXJlIGJleW9uZCAzMi1iaXQgc3BhY2UuIEkgaGF2ZSBwdXQgI2lmIGF0IHRoZSB0aW1l
Cm9mIG1lcmdpbmcuCgo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMg
aW50IHNpZml2ZV9lYXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+ICt7Cj4gKyAgICAgICBpbnQg
cmM7Cj4gKwo+ICsgICAgICAgaWYgKGNvbGRfYm9vdCkgewo+ICsgICAgICAgICAgICAgICByYyA9
IHNpZml2ZV9zbWVwbXBfc2V0dXAoKTsKPiArICAgICAgICAgICAgICAgaWYgKHJjKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBy
ZXR1cm4gZ2VuZXJpY19lYXJseV9pbml0KGNvbGRfYm9vdCk7Cj4gK30KPgo+ICBzdGF0aWMgaW50
IHNpZml2ZV9wbGF0Zm9ybV9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRj
aCkKPiAgewo+ICsgICAgICAgZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZWFybHlfaW5pdCA9IHNpZml2
ZV9lYXJseV9pbml0Owo+ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIuNDMu
Nwo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5r
cywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
