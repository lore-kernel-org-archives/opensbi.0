Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61498D2CE17
	for <opensbi@archiver.kernel.org>; Sun,  7 Dec 2025 06:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgeB+BrSFapn+OW3Okp9SyOfxxeeqaIzZQlqP0xTqIg=; b=aR6otd1D3yd6rMvaw1XYwPtw5f
	LZCzRrnlWS1cXtstf8czCHDTDTVwEW3MnS7W9Zgyr+GFteYkSGtz5EL5mdBDqqqwZRkb3jBEEWs5O
	t8LZ8cET78uDXrKRb0x6i1LpC8xVSV/PaRRnPrwsQH9HGaPHxXaRgctdbyoXk78+deq35W+SjGJ5Z
	dhBtZnLjZnhAtBr8fpLU9RqpHFfgyEUrJ/TjKLvabFYoEFLWH5Ta5zpvS+on9G23tjFjNb+7dm/qq
	vTfwja1Ih+g2uhZXkspcUkuCG2hwy2f9+c06qNPZyIoc9M5p5GN3h2racBqVez1dx33oPkl9q3xpt
	bNrcGk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS7zC-0000000BWCe-3WCE;
	Sun, 07 Dec 2025 06:11:10 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS7z8-0000000BWC9-2IHK
	for opensbi@lists.infradead.org;
	Sun, 07 Dec 2025 06:11:09 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so4072740b3a.0
        for <opensbi@lists.infradead.org>; Sat, 06 Dec 2025 22:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765087862; x=1765692662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VQyiUGL02/yNZjdeeVKnwkNQMjmVxWMLW55iawBcMo=;
        b=KD8yZd1Gn2+xWWD0ZVJxkPps8p9fepU9H8kQDHkXKFqny2n/pJbkyDBsekYJt56kM0
         sMDxu8Kk006FF7yho5Lkg5dfAvB1do/an0L6Sb8X0ECKl3TD0zZ/xvbpoYOuesvHn4+j
         UX5CwF+JQAv2CJ7fx+3ZkFXe53JVt1L0+O1RUFulaUQv/mkYP9IzGqrE7myoyJhcZAhi
         61y5gTD+LxA3+MtTH7IAI5TKIu0iy95KcsxFfSKPbnB2RBBJVQv8CMa0/xpE1A4v7gFG
         GMFDMhjX8vq0536SLKCSE4K99iEV0Ch4yN/89+Kw0gbKhmDFOSsiNOaK295srpwsFVtT
         zECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765087862; x=1765692662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VQyiUGL02/yNZjdeeVKnwkNQMjmVxWMLW55iawBcMo=;
        b=uc/A/dFVSOsXZUEMFFUkYfUNjUswfZw0L3Blm/uav28kJJGKgcEQcMwwada3N5u8Be
         n0q5t/Ze3Ku0Uzc8DTYhYiZHm8ACVUm6FZomwGn/jUz1bUynjcjeaQimShdO7y98xU6J
         yktqBiFkIPx8yi8erThEzn58mMeMQOOZFvX1IT5evhU/ELa8LXmTXMagoZeavhdEcWD+
         QELwVekRynjmUfne4lZtmf6jWGz3B3ybuaSSNUelw5EaKiMiecI0IQay8hB3bkWCsaue
         cZLRHM5hYhg0Slf9FM7kXr2Yvr50y38zmYlhTgRjCoispWDoW9ID1kd5biezQ1CpwZcR
         w/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqlqfLuCBt/HgfPkp/Q7nbWKDXs/+MePWtv/f8xTNtRaCjghrJ8h83HakWyxe8w1wJQtaJj0Te@lists.infradead.org
X-Gm-Message-State: AOJu0YxxWrUvkLXOziburEtnG9iUeFT4jkfZ6NxE35iXuuKKcz7LMBFq
	+v+D52Wl8k4Phf3GGzirHLnAlm19rqXgNMPilF4mMgN1z23vJQ1BFKxt
X-Gm-Gg: ASbGncuN5iEptVNCCj2Bp84UWY/vwoB5ShGVv9dM66R/+RXP7rWLnvzgsBr6nYjQRkQ
	ubmNOxxCoejpprsV9gW3v02ThaSIqLoVzcYljwiDfi6p7q3NAWjtbum2zcrZfLsfazLDaqXOS2r
	+y7vgA2sy6DHCTXg9sjjLw8MAUy5SvPt0GedEi+4y4Yjr0MLSnBiF/tFDZAjyVWaEFrRR8CO+pr
	n3GZIBv6WYDcEy7+nG+7wj5nUXaZ228+2kQu5ZMoT6CmVBa1olt+OgB1uewCmJBoSrJfYWkZNLD
	Uw4D8HZX8wHjBpNYVx3j1bMbKxiaX/XFqP2O8LOQ+YI1eQPkiaVVLBvDAJy1OYpFGW3AXZiUJe+
	U6cU3Y+MBVlPXdetAtrDPc9xXaoStqNuitCsTYB8/7WRy/2E14n5Q7l/30s48FhxzVQFvbvkq6W
	tApA+qP9Um/OE6
X-Google-Smtp-Source: AGHT+IFi0Mt4tL1pH226HCTMu89Denxu6KJu1lbRn+80z+/mXsogkvAcKJIFJNkOW5FKue6a6MEXGA==
X-Received: by 2002:a05:6a00:929d:b0:7ab:8583:9cc7 with SMTP id d2e1a72fcca58-7e8c109b5f4mr3781854b3a.16.1765087861875;
        Sat, 06 Dec 2025 22:11:01 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae032ff8sm9445373b3a.31.2025.12.06.22.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 22:11:01 -0800 (PST)
Message-ID: <198651c8-9d0c-4199-8bc3-8e26f4320e7d@gmail.com>
Date: Sat, 6 Dec 2025 22:09:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] lib: sbi: give platform choice of using single
 memregion to cover OpenSBI
To: Yu-Chien Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org,
 ganboing@gmail.com
References: <20251120093440.4533-1-ganboing@gmail.com>
 <20251120093440.4533-3-ganboing@gmail.com>
 <aa81c0c1-9688-46f0-8254-cf39a61b5049@sifive.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <aa81c0c1-9688-46f0-8254-cf39a61b5049@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_221107_125383_BCD217DC 
X-CRM114-Status: GOOD (  18.37  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkgUGV0ZXIsCgpPbiAxMi8xLzI1IDAwOjExLCBZdS1DaGllbiBQZXRlciBMaW4gd3JvdGU6Cj4g
SGkgQm8sCj4gCj4gTWF5YmUgdXNlIGEgRlcgb3B0aW9uIHRvIGVuYWJsZSBzaW5nbGUgRlcgcmVn
aW9uIGF0IGNvbXBpbGUKPiBvciBydW50aW1lIG9wdGlvbnMuCj4gCj4gY29tcGlsZSB0aW1lIFsx
XToKPiBtYWtlIFBMQVRGT1JNPWdlbmVyaWMgRldfT1BUSU9OUz0weDQKPiAKPiBydW50aW1lIFsy
XToKPiBVc2UgZncgZHluYW1pYyBhbmQgcGFzcyAweDQgdmlhICgoc3RydWN0IGZ3X2R5bmFtaWNf
aW5mbyAqKSRhMiktPm9wdGlvbnMKPiAKCkkgY291bGQgYmUgd3JvbmcsIGJ1dCBJIGRvbid0IHRo
aW5rIGl0J3MgdGhlIHJpZ2h0IGFwcHJvYWNoLiBUaGUgc3RyYXRlZ3kKb2YgY292ZXJpbmcgT3Bl
blNCSSBpdHNlbGYgd2l0aCBzaW5nbGUgbWVtcmVnaW9uIGlzIHNvbWV0aGluZyBpbnRlcm5hbCB0
bwpPcGVuU0JJLCBhbmQgc2hvdWxkbid0IGJlIGFsbG93ZWQgdG8gYmUgY29udHJvbGxlZCBieSBw
cmV2aW91cyBzdGFnZSBib290LQpsb2FkZXIuIEV2ZW4gaWYgd2UgYWxsb3dzIGl0LCBwcmV2aW91
cyBzdGFnZSBib290bG9hZGVyIHdpbGwgbGlrZWx5IHN0aWxsCnVzZSBvcHRpb25zPTAsIGFuZCBl
eHBlY3QgaXQgdG8ganVzdCBib290LCBub3QgdG8gbWVudGlvbiBFSUM3NzAwIGRvZXNuJ3QKaGF2
ZSBhIHByZXZpb3VzIHN0YWdlIGJvb3Rsb2FkZXIuIChJdCBkaXJlY3RseSBib290cyB3aXRoIE9w
ZW5TQkkpIFRoaXMKbWVhbnMgd2UnbGwgaGF2ZSB0byBzcGVjaWZ5IGF0IGNvbXBpbGUgdGltZSwg
bm90IHNvIGRpZmZlcmVudCB0aGFuIG15CnByZXZpb3VzIHZlcnNpb24gdGhhdCBnb3QgTkFLJ2Vk
IGJ5IEFudXAuCgpCbwoKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNy
Yy9vcGVuc2JpL2Jsb2IvbWFzdGVyL2RvY3MvZmlybXdhcmUvZncubWQjb3B0aW9ucy1mb3Itb3Bl
bnNiaS1maXJtd2FyZS1iZWhhdmlvcnMKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNv
ZnR3YXJlLXNyYy9vcGVuc2JpL2Jsb2IvODI1ZDBlOTE4YTllNDFjYzU3MDk3YThjYjkxM2YyNjU1
MDY5OTkxMS9kb2NzL2Zpcm13YXJlL2Z3X2R5bmFtaWMubWQ/cGxhaW49MSNMMTAKPiAKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX3NjcmF0Y2guaCBiL2luY2x1ZGUvc2JpL3NiaV9zY3Jh
dGNoLmgKPiBpbmRleCBmMWI0MTU1ZC4uNGY0MGZlZGQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9z
Ymkvc2JpX3NjcmF0Y2guaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9zY3JhdGNoLmgKPiBAQCAt
MTE1LDYgKzExNSwxMyBAQCBlbnVtIHNiaV9zY3JhdGNoX29wdGlvbnMgewo+ICDCoCDCoCDCoCDC
oCBTQklfU0NSQVRDSF9OT19CT09UX1BSSU5UUyA9ICgxIDw8IDApLAo+ICDCoCDCoCDCoCDCoCAv
KiogRW5hYmxlIHJ1bnRpbWUgZGVidWcgcHJpbnRzICovCj4gIMKgIMKgIMKgIMKgIFNCSV9TQ1JB
VENIX0RFQlVHX1BSSU5UUyA9ICgxIDw8IDEpLAo+ICvCoCDCoCDCoCDCoC8qKgo+ICvCoCDCoCDC
oCDCoCAqIFVzZSBzaW5nbGUgUE1QIGVudHJ5IGNvdmVyaW5nIGVudGlyZSBmaXJtd2FyZSByZWdp
b24uCj4gK8KgIMKgIMKgIMKgICogU2F2ZXMgb25lIFBNUCBlbnRyeSBvbiBub24tU21lcG1wIHBs
YXRmb3JtcyBhdCB0aGUgY29zdAo+ICvCoCDCoCDCoCDCoCAqIG9mIGNvYXJzZXIgUE1QIGdyYW51
bGFyaXR5Lgo+ICvCoCDCoCDCoCDCoCAqIE5vdCBjb21wYXRpYmxlIHdpdGggU21lcG1wIChNLW1v
ZGUgUldYIGlzIG5vdCBzdXBwb3J0ZWQpLgo+ICvCoCDCoCDCoCDCoCAqLwo+ICvCoCDCoCDCoCDC
oFNCSV9TQ1JBVENIX1NJTkdMRV9GV19QTVAgPSAoMSA8PCAyKSwKPiAgwqB9Owo+IAo+ICDCoC8q
KiBHZXQgcG9pbnRlciB0byBzYmlfc2NyYXRjaCBmb3IgY3VycmVudCBIQVJUICovCj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBpbmRl
eCBkYTBmMDU1Ny4uMDIyMmNhOTMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluLmMK
PiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC05MDQsMTggKzkwNCwyNyBAQCBpbnQg
c2JpX2RvbWFpbl9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIGNvbGRfaGFy
dGlkKQo+ICDCoCDCoCDCoCDCoCByb290LnBvc3NpYmxlX2hhcnRzID0gcm9vdF9obWFzazsKPiAK
PiAgwqAgwqAgwqAgwqAgLyogUm9vdCBkb21haW4gZmlybXdhcmUgbWVtb3J5IHJlZ2lvbiAqLwo+
IC3CoCDCoCDCoCDCoHNiaV9kb21haW5fbWVtcmVnaW9uX2luaXQoc2NyYXRjaC0+Zndfc3RhcnQs
IHNjcmF0Y2gtPmZ3X3J3X29mZnNldCwKPiAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSB8Cj4g
LSBTQklfRE9NQUlOX01FTVJFR0lPTl9NX0VYRUNVVEFCTEUgfAo+IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBTQklfRE9NQUlOX01FTVJFR0lPTl9G
VyksCj4gLSDCoCZyb290X21lbXJlZ3Nbcm9vdF9tZW1yZWdzX2NvdW50KytdKTsKPiAtCj4gLcKg
IMKgIMKgIMKgc2JpX2RvbWFpbl9tZW1yZWdpb25faW5pdCgoc2NyYXRjaC0+Zndfc3RhcnQgKyBz
Y3JhdGNoLT5md19yd19vZmZzZXQpLAo+IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoChzY3JhdGNoLT5md19zaXplIC0gc2NyYXRjaC0+Zndfcndfb2Zm
c2V0KSwKPiAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSB8Cj4gLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNCSV9ET01BSU5fTUVNUkVHSU9OX01f
V1JJVEFCTEUgfAo+IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBTQklfRE9NQUlOX01FTVJFR0lPTl9GVyksCj4gLSDCoCZyb290X21lbXJlZ3Nbcm9v
dF9tZW1yZWdzX2NvdW50KytdKTsKPiArwqAgwqAgwqAgwqBpZiAoc2NyYXRjaC0+b3B0aW9ucyAm
IFNCSV9TQ1JBVENIX1NJTkdMRV9GV19QTVApIHsKPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
YmlfZG9tYWluX21lbXJlZ2lvbl9pbml0KHNjcmF0Y2gtPmZ3X3N0YXJ0LCBzY3JhdGNoLT5md19z
aXplLAo+ICsgwqAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSB8Cj4gKyBTQklfRE9N
QUlOX01FTVJFR0lPTl9NX1dSSVRBQkxFIHwKPiArIFNCSV9ET01BSU5fTUVNUkVHSU9OX01fRVhF
Q1VUQUJMRSB8Cj4gKyBTQklfRE9NQUlOX01FTVJFR0lPTl9GVyksCj4gKyDCoCZyb290X21lbXJl
Z3Nbcm9vdF9tZW1yZWdzX2NvdW50KytdKTsKPiArwqAgwqAgwqAgwqB9IGVsc2Ugewo+ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHNiaV9kb21haW5fbWVtcmVnaW9uX2luaXQoc2NyYXRjaC0+Zndf
c3RhcnQsIHNjcmF0Y2gtPmZ3X3J3X29mZnNldCwKPiArIMKgKFNCSV9ET01BSU5fTUVNUkVHSU9O
X01fUkVBREFCTEUgfAo+ICsgU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9FWEVDVVRBQkxFIHwKPiAr
IFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXKSwKPiArIMKgJnJvb3RfbWVtcmVnc1tyb290X21lbXJl
Z3NfY291bnQrK10pOwo+ICsKPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzYmlfZG9tYWluX21l
bXJlZ2lvbl9pbml0KChzY3JhdGNoLT5md19zdGFydCArIHNjcmF0Y2gtPmZ3X3J3X29mZnNldCks
Cj4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgKHNjcmF0Y2gtPmZ3X3NpemUgLSBzY3JhdGNoLT5md19yd19vZmZzZXQpLAo+ICsg
wqAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSB8Cj4gKyBTQklfRE9NQUlOX01FTVJF
R0lPTl9NX1dSSVRBQkxFIHwKPiArIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXKSwKPiArIMKgJnJv
b3RfbWVtcmVnc1tyb290X21lbXJlZ3NfY291bnQrK10pOwo+ICvCoCDCoCDCoCDCoH0KPiAKPiAg
wqAgwqAgwqAgwqAgcm9vdC5md19yZWdpb25faW5pdGVkID0gdHJ1ZTsKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gUGV0ZXIgTGluCj4gCj4gT24gMTEvMjAvMjUgNTozNCBQTSwgQm8gR2FuIHdyb3RlOgo+
PiAuLi4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
