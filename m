Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3549DC3600B
	for <opensbi@archiver.kernel.org>; Thu, 27 Mar 2025 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8EjIFnj+dP5OlTMaeaHRmvYY9gOe7UU7vD564C94gQ=; b=0mj/zsLE5vfJxD
	my48PWYaczrEbtUeV58k7nltTvNlSbPRkMXDiJAd6kT5p/4euVOErzRLRSlEuqHDlQOBUx7+EG7uB
	hD/03P3SWuIlvtyP8GIpPI91AaFn8Z1KyF/hoTpyOnrH6OPyk2zJ1rb+8I+JHv6oxqIqtHqCzI2DG
	iaxGViE8FnCWp0hmqXAu42XBZZlCg0WnfRM9wnLyQg3GV5rbd5mrC5AfpXIQUThHxLY4XwxSFEB2G
	anFTHM+NSAEHBGTWtv7I0JaiBNMzh53G2In/HnZGWFk3dL6iVnFi/7BEEaQqnCCs00ea4dyetyvY4
	U0RtLs20FxqCgYpTT3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txp02-0000000BLAr-1jIp;
	Thu, 27 Mar 2025 15:18:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txosv-0000000BKHf-1twR
	for opensbi@lists.infradead.org;
	Thu, 27 Mar 2025 15:11:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-399676b7c41so614810f8f.3
        for <opensbi@lists.infradead.org>; Thu, 27 Mar 2025 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743088267; x=1743693067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kQbvuoiotBxz95KeKTYuubRqtxfUsesSUqie6e7wyk=;
        b=InD1sT44z3PrA2SWk5iTOVDQNcc7x5uwgs24wvdXqmhJahUzJM8JhPgAgLID+7pYCx
         rrm+jNpE71617z6qAZq3lb4clxrJe2gygNV6zyxijfit+pqTWnhUahIZHMTMVPH7REIA
         eGWZ81xEXPUMmy/ngAOuQ8GBgGP3CZ6OFL1yZ43v4bKVTOdqEBuferDB9ISy7HGRxxbL
         bq+JoMKy78qKF6j6yY3ErJ07rq6t4XmF6xyJdlCC5MBpQdKiQ5MKpPXpymfQfvQAo9ol
         mdASc+/HwuenrNPpsGoy7H5yp5Jy3tzpBUsrJAFZc7MvNStXvzSv8SmMMRssrtBZGN0i
         Tyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743088267; x=1743693067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kQbvuoiotBxz95KeKTYuubRqtxfUsesSUqie6e7wyk=;
        b=GamTHIgym8WnvQo3mBAzkw7WSWhdXrg1qC3NSSNwWX080RcRo5ROH/DEtqrv1HwfXQ
         Xboy0mYiJntJ926kglPyz2GijjzUsZ59DU3eY+VpxGLHvE9kDz9Rn9s9BZ8Dk4EM32aZ
         +D8pa+xnUSGMYoCO4Oe9qN8/0qYpnGoHuNMkrs1NNBbewRHFnM557iDrmGa/boZVm2Dd
         7+VL8hJAo3H8sx3zR1bkohtNKGOwuWOSvkNe1fXuwpFoO77jpF7uJT5Lef79FamPZzJO
         GlVd9ZLRTlqWoRKATybDSbcEmYeR1zQSrrFFS64p+xZwXO0M9of6SHSJ2VxJh2r7z/YE
         8szw==
X-Gm-Message-State: AOJu0Yyd0hUPv40/X3NA0XXX+GJsB+/07LoCzUqi7mwT6bL+nLHhetW2
	uik7wqo+qGtD3aGyXHSuwm+jSyGEBzVuyWOHrMXOL1YSwggZOXqsop0aPIBap9A=
X-Gm-Gg: ASbGncsEwkSLCqgsEVxrYciF48DZjEWvYFTILxMDXL/6kJAwodc6RXdoYfRRb/7dA00
	MnPOKxBU9TTUQ23WSGhXrBMHrT9EyjcLh5SQDzDcTlqSw0KSCZhBgKt1N2qDZmDyesOt0vKwtte
	cQNzeFTv0pYK94o3XtdWMKZu5ISY9bgj9z+wPLaxGNIYtNu8KS5N2RyMYp4n7u6E8R9xAxKU7ue
	YzLT86C9hzJ665WmGCbdZGanx70X7zJd9au5Oy5RMuHVbDTAEYmT856axlrgW7n+h6I4wNn3r4t
	dmmtrthYB3osLP+wei2/Nyp5YSDaYvB33Uqeof8gE2xaTK6QnqmaKJz1PaREBTwr3l/SyP38JT4
	h3DGG/Uq64WRixQ==
X-Google-Smtp-Source: AGHT+IH9lzI0JgsLUknucdtpQuCN/4FxMPrnahib8zdrgVx0gm7U+moigWMzrIbloLMPGP2UTIbytw==
X-Received: by 2002:a05:6000:2ca:b0:391:487f:282a with SMTP id ffacd0b85a97d-39ad178c955mr3296520f8f.50.1743088267103;
        Thu, 27 Mar 2025 08:11:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe966sm42396865e9.21.2025.03.27.08.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:11:06 -0700 (PDT)
Message-ID: <ade07998-528c-4561-bab8-a2cd1770f017@rivosinc.com>
Date: Thu, 27 Mar 2025 16:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] lib: sbi: sse: spec update and fixes
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
References: <20250325102615.1587953-1-cleger@rivosinc.com>
 <CAAhSdy1wSU1kpwjp4+GDz0oJEPdh=nhkxPnQ-tX5m4-y6SK_Yg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAAhSdy1wSU1kpwjp4+GDz0oJEPdh=nhkxPnQ-tX5m4-y6SK_Yg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_081109_739886_EB516DC2 
X-CRM114-Status: GOOD (  13.56  )
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

CgpPbiAyNy8wMy8yMDI1IDE1OjQ3LCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDI1
LCAyMDI1IGF0IDM6NTbigK9QTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBUaGUgU0JJIHNwZWNpZmljYXRpb24gYWRkZWQgYSBmZXcgbmV3IGV2ZW50
cyBhcyB3ZWxsIGFzIHNwZWNpZnlpbmcKPj4gc3NlX3dyaXRlX2F0dHJzKCkgaW52YWxpZCBhdHRy
aWJ1dGVzIGVycm9ycy4gQWxzbyBoYW5kbGUgbmV3IGZpZWxkcwo+PiB0byBiZSBzYXZlZCAoU1BF
TFAsIFNEVCkgdXBvbiBpbmplY3Rpb24uCj4+Cj4+IHYyOgo+PiAgLSBSZW1vdmUgc3VwZXJmbHVv
dXMgcGFyZW50aGVzaXMgYXJvdW5kIE1TVEFUVVMgdmFsdWVzCj4+ICAtIEZpeCB0eXBvIGluIGNv
bW1pdAo+PiAgLSBNb2RpZnkgY29tbWl0IHRoYXQgYWRkZWQgYSBuZXdsaW5lIHRvIGFjdHVhbGx5
IHJlbW92ZSB0aGUgcHJpbnRmCj4+ICAtIEFkZCBhIGNvbW1lbnQgcmVnYXJkaW5nIFNCSV9FREVO
SUVEIGJlaW5nIHJldHVybgo+Pgo+PiBDbMOpbWVudCBMw6lnZXIgKDcpOgo+PiAgIGxpYjogc2Jp
OiBzc2U6IFVwZGF0ZSBTU0UgZXZlbnQgaWRzCj4+ICAgbGliOiBzYmk6IHNzZTogUmVtb3ZlIHBy
aW50ZiBmcm9tIHNzYmlfc3NlX2V4aXQoKQo+PiAgIGxpYjogc2JpOiBzc2U6IFJldHVybiBTQklf
RURFTklFRCBmb3IgcmVhZCBvbmx5IHBhcmFtZXRlcnMuCj4+ICAgbGliOiBzYmk6IHNzZTogUmVu
YW1lIFNUQVRVUyogaW50ZXJydXB0ZWQgZmxhZ3MgdG8gU1NUQVRVUyoKPj4gICBsaWI6IHNiaTog
c3NlOiBSZW1vdmUgc3VwZXJmbHVvdXMgcGFyZW50aGVzaXMgYXJvdW5kIE1TVEFUVVNfKiB2YWx1
ZXMKPj4gICBsaWI6IHNiaTogc3NlOiBBZGQgc3VwcG9ydCBmb3IgU1NUQVRVUy5TUEVMUAo+PiAg
IGxpYjogc2JpOiBzc2U6IEFkZCBzdXBwb3J0IGZvciBTU1RBVFVTLlNEVAo+IAo+IEkgaGF2ZSB0
YWtlbiBjYXJlIG9mIHRoZSBjb21tZW50IG9uIFBBVENIMiBhdCB0aGUKPiB0aW1lIG9mIGFwcGx5
aW5nIHRoaXMgc2VyaWVzLgoKVGhhbmtzIEFudXAsCgpDbMOpbWVudAoKPiAKPiBBcHBsaWVkIHRo
aXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCj4gCj4gVGhhbmtzLAo+IEFudXAK
PiAKPj4KPj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggICAgICB8ICAzICstCj4+ICBp
bmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmggfCA1MCArKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQo+PiAgbGliL3NiaS9zYmlfcG11LmMgICAgICAgICAgICAgICAgIHwgIDQgKy0tCj4+
ICBsaWIvc2JpL3NiaV9zc2UuYyAgICAgICAgICAgICAgICAgfCA2MCArKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDMy
IGRlbGV0aW9ucygtKQo+Pgo+PiAtLQo+PiAyLjQ3LjIKPj4KPj4KPj4gLS0KPj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
