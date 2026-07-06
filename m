Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46934C43458
	for <opensbi@archiver.kernel.org>; Mon,  6 Jul 2026 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVFECr1Ohh7qEG42xeDjqFnfV6HVjh4VWKVRWcisykQ=; b=ngdhboUNqn4nGf
	UZDiRxwGTZ7LWaC+fYyVbyFFMj+z29uRvumsVVwTo5zpafVe7Bs2mKuMTwxiD+2K/cQ4B1lamPo5q
	9nY0900sVJmagOARtSE5OpCXACTcqfysxLrFv+lzc+fBHgxuk7jQFCD5lneckDdEXDU8ktEj35oj6
	hejxKzBv+rWBHwV5ngpBSf3aDZ7U4jZ1MIa9arE5b+CghtZ4w8wpqq0qV7JWebTqpFv8NuIWzU2Jn
	9hwcGBYQaZkLIwDtRp5WhP/UUkboNzSbqR6ndBA3w7QoaKWqSDUJowXC8U39ZzTSpzO4pvKJQ0MTd
	SPmbVkRq2/ofb7PYd7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk39-0000000ChCy-3TIC;
	Mon, 06 Jul 2026 14:11:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk37-0000000ChBr-1LwO
	for opensbi@lists.infradead.org;
	Mon, 06 Jul 2026 14:11:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so16173985e9.0
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 07:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783347111; cv=none;
        d=google.com; s=arc-20260327;
        b=euhpaIk220H2Dhsbi5OV+WyGGCaijPEUjzCWMi9SZmb1VGf2+guP2sXtYdZqHOX9Kt
         /00qvi7qfssfa1Z41prYUbZ26Eb1dFIBeyWBmB7ndgIJT1ru4t9rR80h9+xV7NT/qG1A
         EN6nAxvlK3Vade2Z2IVq9wF0TDxUib7hmR/ReTr+KxPXZZEeHR2tukpgKG9TJG21FjFO
         de5kG5fgfPxqMxMoBMyhRgqQ1pJ5exnsVWdJ/JQNzsml8fbVK5COd3nJSGnycgPuUPyp
         +LanTtz1WaAgWgbrLE8fE0lTtYrCyG0F3iF29aiFJEWdq4ePA3HhkBNYoMhwdKkO0zfE
         w48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F5aQJ6gJrqRwB2wiafyzFHVZPWCOuKRBnIJLGEU6rS4=;
        fh=43Ugj1/EbUbrrVoh4r4JnWvxxUX41xXcVXo42le6xpc=;
        b=IU5XImbcojPgqXsNUfINSjM4isNgLutll7mMrqboZqh5S061TPsGnLpAK0ZMPwho8J
         iJ1AUD2e9jtQbFhZ+tCkzxoiPnPj9hi6jgKPHFOJUIdw/zagu5TyQgcno3dg0erl06Ab
         EBe3W4oL8Zp1cbwUGOyLvn3leACywZRjIfKQ/NdjQbDTXWbXJj1FJfj6izhgGh/9kTbn
         hCy3eBv/hrBimK3oUBOsHSgsiVYTK86/5reCd7hL+HDkcPKyEGFVB7c2GpbT+6OxFmZc
         eX9ofLmT5R0E53k5dK/Cjbt+uzjhk5L3Ouozlosw3+PAoHRbzx27htRvRMT/dMpJpa5i
         WKEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783347111; x=1783951911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F5aQJ6gJrqRwB2wiafyzFHVZPWCOuKRBnIJLGEU6rS4=;
        b=hJf6CXOUhmpSMWchnWpqlCFJvBLLRXuFuYcHjCfPM7JVY+6qTvqM9CSTijllqej0oH
         HSXPYnjDE4yhqAnPD5vtv1sgV1K1WWgUqbv18C/2t9E2nENR6pB9SMbelmPjFoy0d8GU
         S2sQ1DqQFH6BV2Kr3pvA4h9uD1xjoskcUuMT1XE4ODm4oXmL50JXhIVT1Fnl/2dyMCJR
         AdEt1l41K/P1W44nq37FenokeB6p5IZbYM0FYtkFH+ePIJSsewZKhNpv7R6qrrbUNq2T
         bBPq1koEi+L6vM9HT7vHquE64nst8FAROOfnWFG/BnBU0op1xvc/Z7TM9KZUh5+WzqUO
         e15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347111; x=1783951911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5aQJ6gJrqRwB2wiafyzFHVZPWCOuKRBnIJLGEU6rS4=;
        b=CpGlUaNHql5k+km6zRGZDhVoc+EvCdDzg6uU8RfHNtkC5LutQEpmw7QjR+jjxXVPvH
         zk63v09bxyF0VmCLKe0NzZQq9M1mr+sHVdQCWoz80JRVIcD+qUgkMFyYUTEx6b/npfzR
         A+KG8sgBy1VYeLLXZ9NXL16tXq+QU2pf8Q9svcX+fUzeia9DMkkzwKGkkQt0lb+nLrku
         biOYBHO/oudS4M2Rj8mKL64kaezEwmXUyojS7k8kP5XmB3lbfyLjwlW3D7AY520Y0Du8
         SZ70ihRK7NjLvtZ6g/d4ZXQ5WQ2RFbEKOifAMZBG4FCCq7WMJQmxUmSZsCcrWFUBw4ci
         Jr4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrTBLsVVNc2vkwdbrFRqFdsWgUcqWisgJoS0x8TBYkIpUvmmXk2P2Akqad9Xw9Nw9KyOQqxXFUP@lists.infradead.org
X-Gm-Message-State: AOJu0YwOoDM5o9TJ6SvlmKlBJw2y/saMj9HiKQJUQ0CQ0mBi1+SBD/vR
	VCUp1gI9SX981f7qfl99gMRnTGZFKsaaUuD9PalJj6sGUW8FQ5l92CAcXA6NwjOzDHyPqZbpfQE
	DY7ufikPjQ6nR5U0IpdECdsUJGBLLdVG7BKLf6N8Tog==
X-Gm-Gg: AfdE7ckKaifXmOjSGKljJC5wDVFx861JmVbwzzjVxmByqqMMOcF4F6dMJNaEyfLKaiD
	vOp68krsJgxII5TpKc/+MDyuRVrqTbLhxuT78/NUavVsgBr5X+8v5cbsIvzyx0bcPiKHSbkrUKv
	6a54K2cGmVQcptX1gquJCnwtY+1lFssZjti2Qz4VzbOO4YrPLBum9oyfn6bmdFJkMOMXE+2VVMx
	8lPkpBlw3Zh+dpjFyc65wdLCouRuh3SJ3BaDV9qzxhmU0Icbkrj4R3s5HjADjEeTcWQ4Zxuf3+G
	3/a9o0PvrRXPpXGTM2CISvijIAwbqooE1QyMDbCKauJOwf5IIXlM92NdyAu5zH4YDfhIQi/qCOo
	iW8MDM6X4rPqFThY9
X-Received: by 2002:a05:600c:3145:b0:490:e974:e006 with SMTP id
 5b1f17b1804b1-493df099f12mr8326375e9.29.1783347110436; Mon, 06 Jul 2026
 07:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn>
 <202508060106.57616maD072614@mse-db.zte.com.cn> <CAAhSdy2N0FQ4+3PR8ksYvi0CMc3m3Rt2Bsv+ABWWcXdWSMtXeQ@mail.gmail.com>
 <4b6afa21-f68e-4341-afed-e5d52beab77b@163.com> <CAAhSdy3H951_=J+FCR4nF_qiPfxsOmr438abuA28e5Cop+phrg@mail.gmail.com>
 <62b51e6c-7f01-48c5-b9c6-465bfc963831@canonical.com>
In-Reply-To: <62b51e6c-7f01-48c5-b9c6-465bfc963831@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Jul 2026 19:41:38 +0530
X-Gm-Features: AVVi8Ce5y2OXJyfEai17A5r9oFOB6cS2UzPfvZqNE-m8L-4tylxWr2GNws5jJQ0
Message-ID: <CAAhSdy0Om4n0g9BrqdZjukziSQwJoQR+8J3Su621v=h=6ZPrDw@mail.gmail.com>
Subject: Re: [PATCH 3/3] include: sbi: Lift the maximum harts to 1024
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: wu.fei9@sanechips.com.cn, opensbi@lists.infradead.org, 
	Wu Fei <atwufei@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_071153_626802_0F7EFFFB 
X-CRM114-Status: GOOD (  23.03  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCAzOjEy4oCvUE0gSGVpbnJpY2ggU2NodWNoYXJkdAo8aGVp
bnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IE9uIDEwLzkvMjUgMTU6
MjksIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCA5LCAyMDI1IGF0IDU6NTXigK9Q
TSBXdSBGZWkgPGF0d3VmZWlAMTYzLmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+IE9uIDkvMzAv
MjUgMTk6MzYsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgQXVnIDYsIDIwMjUgYXQg
NjozOeKAr0FNIDx3dS5mZWk5QHNhbmVjaGlwcy5jb20uY24+IHdyb3RlOgo+ID4+Pj4gSXQgaXMg
ZXhwZWN0ZWQgdG8gaGF2ZSByaXNjdiBzZXJ2ZXIgYm9hcmRzIHdpdGggbWFueSBjb3JlcyB2ZXJ5
IHNvb24uCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogV3UgRmVpIDx3dS5mZWk5QHNhbmVj
aGlwcy5jb20uY24+Cj4gPj4+PiAtLS0KPiA+Pj4+ICAgIGluY2x1ZGUvc2JpL3NiaV9oYXJ0bWFz
ay5oIHwgMiArLQo+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0
bWFzay5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmgKPiA+Pj4+IGluZGV4IDIwMGFiNmUu
LjJmOTRmMzkgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydG1hc2suaAo+
ID4+Pj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmgKPiA+Pj4+IEBAIC0yMCw3ICsy
MCw3IEBACj4gPj4+PiAgICAgKiBhbHNvIHJlcHJlc2VudHMgdGhlIG1heGltdW0gbnVtYmVyIG9m
IEhBUlQgaWRzIGdlbmVyaWMgT3BlblNCSQo+ID4+Pj4gICAgICogY2FuIGhhbmRsZS4KPiA+Pj4+
ICAgICAqLwo+ID4+Pj4gLSNkZWZpbmUgU0JJX0hBUlRNQVNLX01BWF9CSVRTICAgICAgICAgIDEy
OAo+ID4+Pj4gKyNkZWZpbmUgU0JJX0hBUlRNQVNLX01BWF9CSVRTICAgICAgICAgIDEwMjQKPiA+
Pj4gSW5zdGVhZCBvZiBtYWtpbmcgdGhpcyA4eCwgaXQgaXMgYmV0dGVyIHRvIG1vdmUgdG8gYSBt
b3JlIHJlYWxpc3RpYwo+ID4+PiBudW1iZXIgbGlrZSAyNTYgb3IgNTEyLiBOTyA/Cj4gPj4KPiA+
Pgo+ID4+IERvIHlvdSB0aGluayB3ZSBuZWVkIHRvIG1ha2UgdGhpcyBjb25maWd1cmFibGU/IEl0
IHNvdW5kcyBnb29kIHRvIG1ha2UKPiA+PiBpdCBsYXJnZXIgaWYgaXQncyBjb25maWd1cmFibGUs
Cj4gPj4KPiA+PiA1MTIgaXMgbm90IGVub3VnaCBzb29uZXIgb3IgbGF0ZXIgb24gc2VydmVycy4K
PiA+Cj4gPiBJIHdvdWxkIHJhdGhlciB3YWl0IGZvciBhIHJlYWwgcGxhdGZvcm0gd2l0aCA+IDEy
OCBDUFVzIHRvIHNob3ctdXAuIFNpbmNlCj4gPiBpdCBpcyBhIG9uZS1saW5lIGNoYW5nZSBhbmQg
d2UgY2FuIGRvIGl0IGFueSBkYXkuCj4gPgo+ID4gUmVnYXJkcywKPiA+IEFudXAKPgo+IFRoZSBM
aW51eCBrZXJuZWwgaGFzIHJhaXNlZCB0aGUgZGVmYXVsdCB0byAyNTYgQ1BVcyB3aXRoIGEgbWF4
aW11bQo+IGNvbmZpZ3VyYXRpb24gdmFsdWUgb2YgNTEyLiBTZWUKPiAwZmE3NDk3NzE5OTMgKCJy
aXNjdjogUmFpc2UgZGVmYXVsdCBOUl9DUFVTIGZvciA2NEJJVCB0byAyNTYiKQo+Cj4gU2hvdWxk
bid0IE9wZW5TQkkgbWF0Y2ggaXQgYW5kIGhhdmUgYSBjb25maWd1cmF0aW9uIHZhcmlhYmxlIHRo
YXQKPiBkZWZhdWx0cyB0byAyNTY/CgpJIGFncmVlLCB3ZSBzaG91bGQgbWF0Y2ggTGludXggZGVm
YXVsdCBhbmQgc2V0IFNCSV9IQVJUTUFTS19NQVhfQklUUyB0byAyNTYuCgpSZWdhcmRzLApBbnVw
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
