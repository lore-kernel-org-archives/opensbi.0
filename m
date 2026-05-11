Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE7BCD37B5
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6+MXXOjoS+dqlbDHjPUQD+KVRN0NiennNz6kkgwLGs=; b=RkRfnwH5gYROGR
	8Ru3zp6XaVVvdbcm6GCDkGVfNxYTsN4dSJFcIzOUMJLjdtqvaau54QyIELLUdcJoVMfED+NYbaDnr
	DNGm/J5GxFPUfP5gN/2s5edljtxAhTjT1lrcQdcY4c9P79NTJ6B/1mY5sUzBI7JvMgNIkmnjDI6fS
	UwWTTz69FJ+cuXDD0bS0/gZ2Hx/rBWXNfLjiNbzXIo5bpBUwOhIykUffGVJWeJ1b1Q2gW/3jPQJpW
	hUsbKvZ3TF8dJSVkEiE93CCO7E2tDXwvWqj18CXjpE3W0ZlU6GM3tqLu97f8b9U01YYLF7cWWHGU7
	0Me9lhvruNdiEahIROVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLRs-0000000CfId-3LbU;
	Mon, 11 May 2026 07:53:08 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLRp-0000000CfH3-0YlG
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 07:53:06 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6948fb494a0so2137536eaf.2
        for <opensbi@lists.infradead.org>; Mon, 11 May 2026 00:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485984; cv=none;
        d=google.com; s=arc-20240605;
        b=JPFklJymI133+BoHmjiTG7lk50ebJpw3sdX+bDoKLcswZvgbzI4ebzMvD18estWSZX
         xOUdQQN+4ExTQeivLLgjnbt5hfh3AZkZkvXI7XXDlIqVXMyy34BzTPJJIIB3D8VuZkv6
         m7kW6AK1d6aDYfv/pfcJJdvFCbqftPwq+dtkefoJpQBQBLhoIJbIUIoAiYstfeWpLZWM
         bln0f9mG0EaHK8OKUrYymHVRhutRBtCIcPXIkM/xn0C0hXmWStg3vQqOdqmY+FN+jU4L
         d6b2Jft7NBBk8DEPpqROcpWwGQIxvZ0O43yAk/N07w71E3c3g8/xufFEukt2qDVP3SLH
         8QVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUtHPX79RQ4mvHTjRLrz1k8mq+wzXDb5rwIZd+RyW9o=;
        fh=hWSqxhDrXtiUHqQvJPdVlu3TdYeTR8ygHrqeYKGTfNY=;
        b=RlVlKKiqHxX5eVrzhF27dBu5D0cJ4hIRitz7zTfPG1fMBNTGP5TTYzxjHLN/c4BBp/
         GdrIZk/NtAwQwsAO0vN1a4knO94mmYAR6vv1Lg6UesIuVysbAkIM1qptpay1elHVrkyr
         PLuQgDLU1rdycpQdQA811urXdDsQ8O/gfgFEIy/SUZAH8DqSRMMJFa28qGvbyQr+ybZ1
         Qe9CKu6Fct722n1cxBejBtnAHKY8HHoIpHLbN8tIEww07a2ZK8lJcdcHUQoOq5VeXKDb
         rnqLd9FqO8bAx6kW8zSyzbuROV+XFwGLScf7ptkk0/xV4jWk9CjKduCvdTv353ol1QoC
         ceWA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778485984; x=1779090784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUtHPX79RQ4mvHTjRLrz1k8mq+wzXDb5rwIZd+RyW9o=;
        b=SbLl8Cpv0c24vbCb0hA9qecT/olEOoiSkmWes8ZV+0ievK6V3YFcD8M7F9jSpsup/y
         VE0D4EY818gf3NicewRh6BpX3DVOQGXurOXtC7hOl3fmSNS59wsiqxm6Lcwc1qtRAH/B
         rM3mwPeGELwh4yP0Cc+kAyFXgeEtOT9UBpbt7yGrpuUh1obAC70LERf2sEkZcghYm2KI
         kMapFW7u51S9QE3jnvGUIJZCH3JbHt3TLZjmZT2u2C3+14Cwl90oEs+1g7zs5HQv1Zfm
         DNyXva8gi1ZAiaHEpsBhRjr5n6alnsk9vb4oUCFPDyCaJu+NEHsOcFiFo2y6L4XsYj8q
         9bTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485984; x=1779090784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hUtHPX79RQ4mvHTjRLrz1k8mq+wzXDb5rwIZd+RyW9o=;
        b=sVnDPe1fY7Sq5yz8rpKIo8yz8R0VcC97hKaNw1ZL3zseIJ4GiMcvBu13gskbEaS/uy
         pLoMGMqXzKBXzjwoxkvp107PU54dVVTM/u92Qg78xHSuKBRlHHmwNEQ+fB0AiOxE3DtW
         lT6fec/lQI0qLX9prn0XBVW/OcUrwQbwGfoUlJ6A+xnvcQ5DEskIRb7+akE65Pc8HJ1t
         eV4aqgk+QUXFO501UtldNfKHWnfmyj9w0pr9c642nvKhQmVlec+n5m3xmjKYZt/Vq0ns
         BiUrwbpxLkxrT3A8E+1d26IET1Y4C7JS67ak2J4Pzg/UUI3ZNmOlfQTHYGbwcrYybxk/
         C0Qw==
X-Gm-Message-State: AOJu0Yx6KQdgRtEuCIaMKrSv0ftffmT6u8H+anynQW7gq8V0zNKdJCYP
	4AbbAtmlU5Ddb/nWX54z5v2Cu5l07BhYRRmg0nVzMRPAUdTWo7IwbgNhP20gLMo0iEHoj5XQUW2
	Ji6z2ZjijdC33ssU73g/0Hrs35moUJCJ/1U7z2WZqvQ==
X-Gm-Gg: Acq92OHJX5MlkZKO94H2HXk7rFJLdqCHpsQp6sY0yk9zkO2x2cxG3NhcdkcQkgH0Xdh
	hwlOG8pDvmuDaexTL9d7CgINyWnNmICvzzHBTLL9ytL5+HJyWVkxsp8YuvdhhmOM3TLXr+lh3SZ
	up6ySaa4mDdHIH9XrMVpDYPUUnv7zjXJw5xjlZHq43K5NLN1MxeFwJzxNWqQUwHnbwinbzlhBCG
	OJG9trxfdcLQvRthdHTsc9Hq5yT3W9sRbPqRG4M/jmD8ejrN2kjrgFVwTGj7xKnC5LFbzeNhKuH
	sbzN1RXsBgledHu9yyWn/EmvWrVmt8h5FgTGgcnY2AEUS4cDX+0EViBvcLX8eGvAb4ajYZHMtRW
	oGtldYiISs48c7ILuuJg395ZqnT816eEzlARQ
X-Received: by 2002:a05:6820:1897:b0:695:a86:91a1 with SMTP id
 006d021491bc7-69998ce5a2amr12973593eaf.24.1778485983869; Mon, 11 May 2026
 00:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-mcycle-fix-v1-1-1444e9fe5c32@kernel.org>
In-Reply-To: <20260324-mcycle-fix-v1-1-1444e9fe5c32@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 May 2026 13:22:52 +0530
X-Gm-Features: AVHnY4IpNqCcXjYYZ3WAwmnO0gd5eXHw24r-_BpXkT6kIvtTBTM3bt9d1l-eEkY
Message-ID: <CAAhSdy1FUMVpOAmTgdgyPwKRQ0Vepjoqh4NOq32kVUsYyT1jvw@mail.gmail.com>
Subject: Re: [PATCH] lib/sbi_pmu: Don't fallback to fixed counters when
 sscofpmf && !smcntrpmf
To: Michael Ellerman <mpe@kernel.org>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_005305_493912_0A0152B7 
X-CRM114-Status: GOOD (  27.80  )
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

T24gVHVlLCBNYXIgMjQsIDIwMjYgYXQgNTo1OeKAr1BNIE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEN1cnJlbnRseSB3aGVuIHNlYXJjaGluZyBmb3IgYSBoYXJk
d2FyZSBjb3VudGVyIGZvciBhbiBldmVudCwgaWYgbm8KPiBwcm9ncmFtbWFibGUgY291bnRlciBp
cyBhdmFpbGFibGUsIHRoZSBjb2RlIGZhbGxzIGJhY2sgdG8gdXNpbmcgYSBmaXhlZAo+IGNvdW50
ZXIgKG1jeWNsZS9taW5zdHJldCkgaWYgb25lIG1hdGNoZXMgdGhlIGV2ZW50Lgo+Cj4gSG93ZXZl
ciB0aGUgZmFsbGJhY2sgaXMgaW5jb3JyZWN0IHdoZW4gc3Njb2ZwbWYgaXMgcHJlc2VudCBidXQK
PiBzbWNudHJwbWYgaXMgbm90LiBUaGF0J3MgYmVjYXVzZSB3aXRoIHNzY29mcG1mLCBwcm9ncmFt
bWFibGUgY291bnRlcnMKPiBzdXBwb3J0IG1vZGUgZmlsdGVyaW5nLCBidXQgdGhlIGZpeGVkIGNv
dW50ZXJzIGRvIG5vdCAod2l0aG91dAo+IHNtY250cnBtZikuIEV2ZW4gaWYgdGhlIGNhbGxlciBk
aWRuJ3QgY29uZmlndXJlIG1vZGUgZmlsdGVyaW5nLCBieQo+IGRlZmF1bHQgcHJvZ3JhbW1hYmxl
IGNvdW50ZXJzIGRvbid0IGNvdW50IE0gbW9kZSB3aGVuIHNzY29mcG1mIGlzCj4gcHJlc2VudCwg
d2hlcmVhcyBtY3ljbGUvbWluc3RyZXQgZG8uCj4KPiBGaXggdGhlIGxvZ2ljIHRvIG5vdCBmYWxs
YmFjayB0byBhIGZpeGVkIGNvdW50ZXIgaWYgc3Njb2ZwbWYgaXMgcHJlc2VudAo+IGJ1dCBzbWNu
dHJwbWYgaXMgbm90Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGtl
cm5lbC5vcmc+CgpGaXhlcyB0YWcgaXMgbWlzc2luZyBidXQgSSB3aWxsIGFkZCB0aGlzIGF0IHRo
ZSB0aW1lIG9mIG1lcmdpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoK
VGhhbmtzLApBbnVwCgoKPiAtLS0KPiBIaSBmb2xrcywKPgo+IEkgbm90aWNlZCB0aGlzIHdoaWxl
IHRlc3RpbmcgTGludXggcGVyZiB3aXRoIG1vcmUgZXZlbnRzIHRoYW4KPiBwcm9ncmFtbWFibGUg
Y291bnRlcnMuCj4KPiBTb21ldGltZXMgY3ljbGVzIGdldHMgY291bnRlZCB1c2luZyBhIG1ocG1j
b3VudGVyLCBhbmQgc29tZXRpbWVzIHdpdGgKPiBtY3ljbGUsIGFuZCB0aGUgY3ljbGUgY291bnQg
ZGlmZmVycyBiZXR3ZWVuIHRoZSB0d28uCj4KPiBUaGUgY291bnQgZGlmZmVycyBiZWNhdXNlIG1j
eWNsZSBkb2Vzbid0IHN1cHBvcnQgZmlsdGVyaW5nIHdoZW4KPiBzbWNudHJwbWYgaXMgbm90IHBy
ZXNlbnQuCj4KPiBJdCBjYW4gYmUgcmVwcm9kdWNlZCBieSBydW5uaW5nIHBlcmYgc3RhdCBhbmQg
c3BlY2lmeWluZyBgY3ljbGVzOnVgIE4rMQo+IHRpbWVzIHdoZXJlIE4gaXMgdGhlIG51bWJlciBv
ZiBtaHBtY291bnRlcnMsIGVnOgo+Cj4gICAgICQgcGVyZiBzdGF0IC1lIGN5Y2xlczp1LGN5Y2xl
czp1LC4uLgo+ICAgICAuLi4KPiAgICAgICAgICAgICAgICAgMzkyODYwICAgICAgY3ljbGVzOnUK
PiAgICAgICAgICAgICAgIDYxMTAxMTIwICAgICAgY3ljbGVzOnUKPgo+IFRoZSBmaXJzdCBjeWNs
ZXMgZ290IGFuIG1ocG1jb3VudGVyIGFuZCBvbmx5IGNvdW50ZWQgdXNlcnNwYWNlIGN5Y2xlcy4K
PiBUaGUgc2Vjb25kIHVzZWQgbWN5Y2xlIGFuZCBjb3VudGVkIGV2ZXJ5dGhpbmcuCj4KPiBjaGVl
cnMKPiAtLS0KPiAgbGliL3NiaS9zYmlfcG11LmMgfCAxNyArKysrKysrKysrKystLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9wbXUuYyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gaW5kZXggYWUw
MGFkNTg0NGIxZmU5MmE4ZWViZmI2MTg5MDJhNWVlZjIxOGE5ZS4uOGE5MDIxZTJlNWJhYzJkNzFh
MGYwN2QzZjgxNjAwZmYzNzBlZTJmYyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9wbXUuYwo+
ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gQEAgLTgzMCwxMyArODMwLDIwIEBAIHN0YXRpYyBp
bnQgcG11X2N0cl9maW5kX2h3KHN0cnVjdCBzYmlfcG11X2hhcnRfc3RhdGUgKnBocywKPgo+ICAg
ICAgICAgaWYgKGN0cl9pZHggPT0gU0JJX0VOT1RTVVBQKSB7Cj4gICAgICAgICAgICAgICAgIC8q
Kgo+IC0gICAgICAgICAgICAgICAgKiBXZSBjYW4ndCBmaW5kIGFueSBwcm9ncmFtbWFibGUgY291
bnRlcnMgZm9yIGN5Y2xlL2luc3RyZXQuCj4gLSAgICAgICAgICAgICAgICAqIFJldHVybiB0aGUg
Zml4ZWQgY291bnRlciBhcyB0aGV5IGFyZSBtYW5kYXRvcnkgYW55d2F5cy4KPiArICAgICAgICAg
ICAgICAgICogV2UgY2FuJ3QgZmluZCBhIHByb2dyYW1tYWJsZSBjb3VudGVyLCBzZWUgaWYgd2Ug
Y2FuIHVzZSBhCj4gKyAgICAgICAgICAgICAgICAqIGZpeGVkIGNvdW50ZXIgaW5zdGVhZCBpZiBv
bmUgd2FzIGZvdW5kIGZvciB0aGlzIGV2ZW50Lgo+ICsgICAgICAgICAgICAgICAgKgo+ICsgICAg
ICAgICAgICAgICAgKiBJZiBzc2NvZnBtZiBpcyBwcmVzZW50IGJ1dCBzbWNudHJwbWYgaXMgbm90
LCB3ZSBjYW4ndAo+ICsgICAgICAgICAgICAgICAgKiBmYWxsYmFjayB0byBhIGZpeGVkIGNvdW50
ZXIsIGJlY2F1c2UgdGhlIGZpeGVkIGNvdW50ZXIKPiArICAgICAgICAgICAgICAgICogZG9lc24n
dCBzdXBwb3J0IGZpbHRlcmluZyB3aGVyZWFzIGEgcHJvZ3JhbW1hYmxlIGNvdW50ZXIKPiArICAg
ICAgICAgICAgICAgICogd291bGQuCj4gICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAg
ICAgICBpZiAoZml4ZWRfY3RyID49IDApCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHBtdV9maXhlZF9jdHJfdXBkYXRlX2luaGliaXRfYml0cyhmaXhlZF9jdHIsIGZsYWdzKTsKPiAt
ICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBpZiAoZml4ZWRfY3RyIDwgMCB8
fAo+ICsgICAgICAgICAgICAgICAgICAgKChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gs
IFNCSV9IQVJUX0VYVF9TU0NPRlBNRikgJiYKPiArICAgICAgICAgICAgICAgICAgICAgIXNiaV9o
YXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNQ05UUlBNRikpKSkKPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VGQUlMOwo+ICsKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIHBtdV9maXhlZF9jdHJfdXBkYXRlX2luaGliaXRfYml0cyhmaXhlZF9jdHIs
IGZsYWdzKTsKPiAgICAgICAgIH0KPiAgICAgICAgIHJldCA9IHBtdV91cGRhdGVfaHdfbWhwbWV2
ZW50KHRlbXAsIGN0cl9pZHgsIGZsYWdzLCBldmVudF9pZHgsIGRhdGEpOwo+Cj4KPiAtLS0KPiBi
YXNlLWNvbW1pdDogNDgxM2EyMDQyMDk2Yjc4NjA2NTU3NjFhYWQ5NzM3MjMyOTNhNTUyZQo+IGNo
YW5nZS1pZDogMjAyNjAzMjQtbWN5Y2xlLWZpeC0zZmM1NjgyZWVlOWMKPgo+Cj4gLS0KPiBvcGVu
c2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
