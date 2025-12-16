Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2E5D609B6
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTEK2Qch3hqOjyPtUQZliCnt0qH0WocYuF5vLyryzps=; b=MGqVp9HTJhAqjC
	sxNq3634afz+hn0gnQlPjDdbXC9iIypF0pavrkmQzhAHDv5fTSJeQBILZhLLrX6h16a7+K34ffKnD
	PrUtbF0uU9U8FjqJljty1zVGhJQ9MeoOoRVj2VWsWbmF9HkQ6oDYMnk/k5azWQ+/jbVxmXA2dnHUv
	2f7sb8QujmiaSQCfR9rkgfoMBO9ChVuzr8nv2FwiP76aYueDlW5/wPOh8TVRrfT6LZk/Qkuwb/NjR
	0Qdglh3QTrTkfxsRb2dlF1YCTvKIrUpbOBUwbBDW68ANm+PxWVdwlUJrg0gZjd20Adyl1KI+0S4t8
	I3P7lJXygxNn0a17sY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXOz-00000005UKn-3Yfn;
	Tue, 16 Dec 2025 15:55:53 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXOx-00000005UJa-2bJg
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 15:55:52 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-455af5758fdso2617516b6e.1
        for <opensbi@lists.infradead.org>; Tue, 16 Dec 2025 07:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765900550; x=1766505350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSh9VGre1pDz2WmvBp8AoQsF9eflnOkB4zLJusNCpN4=;
        b=K5s6/0L6Go8sFOmLM93nqLFfrFwHVFnbKtxMnf/05bmLb1YTfofZIWLrnNpyyvpabq
         a3iUCX9ou4BxTjxEy7c+8DTl31cD97Mc92YkfsQIohqXKKPw0D+VquC3AaAQKthJ9dQt
         8AVly5Qe1yNhoB9qxJvDdzxKuHEp1IWcci8wOoAyKS4u4OI5wjx3hgxcTYj1IMulch36
         V2GqnNEQ9DmI0sdjlFR/mRUoPh2n0wQiB7CqGScZMgwvpI19+s3bXDImt0yhT78KxwJ4
         wJJiEICHQaogpl0NAYFpwKR4JV4VJdOxEF3MrDeNOlF6TfA6rv6tPZQ4HCZnUhEzJ9kw
         YhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765900550; x=1766505350;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSh9VGre1pDz2WmvBp8AoQsF9eflnOkB4zLJusNCpN4=;
        b=jHApbbNrh6A4vDHbc1XYdTcA/0P5cz22HXS8X9Puk1DIyf/MUgknId45efhttsOF8C
         5JPBuFztQQ6WS0QedHBtEovpk9Llrbl6fZxrohP5uA3TubTt3HUuqUclgIRXV66f3Rk2
         OmygD2kVKSA+c56u/KtbcjQHkcivYQAB5zINZ9DGCUF6cjquAIPDEf5tM9EanJ1uxw9q
         EfyoeGTaaaooKDd7yejjVDOqyCs9ouEPr3fX37d++z0TW/leu0t82GFSgakpLwKg1I3i
         UItJ+LsT23EqPG3neHN0AEwcKRCcWmvgNMQswFN1/rsqiQfdCmgxDxbZbWdGOt73OAjY
         DM9w==
X-Forwarded-Encrypted: i=1; AJvYcCXwTQf741K0AxxEWUILI6XGyPaOYXzHj+AVF2HJeNxELWUMi/ulN7T7jXnIaoH+FJHdA1Mp7oiu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/hA1x3eOHgG4XRDgo55xJSrM8ZKnY3JFwQnNZ3Att24JcH0Ew
	MEROj3sSkVYQP5aukaJBK5h7sKT8DXXXIMVddBCGTxhHTRurpfnzVqlryhiWvG3a3P8Qq2XL7DG
	evtTb
X-Gm-Gg: AY/fxX7AW9j/YHd1+GQN9wZWi1n6pOi7a7ZdcZITAG4BIcD/peWsnGMQjBMSfIYclZI
	3WzQTxS2/AHOv7ksSIQ/5EwOr4OaWjVBDFpKxMBZHlnt0shF3tde5TERt2Ahw/0plz+VRcfU4t+
	GwstcHpmxkEuRonk4zClc+DAYIiBwXkYPOCU0+tzyC3IfAGZBDDkKdW2YkSuLH9ZAvx1WbA93AR
	ZAGGAQCQ566nBDBLSNLrn7zza8Uvdk4zCp82RaPhjun9NZMvaykHY7tXOo4byaA4SNBwYnzXflA
	ivLBNbCymmqt1z2Opy2BTNvIhBht4ECxU81tOkWoHmiVEPxj6Ao3NmskiEfXpjZrew1uEhePW18
	Mx2rcUNutkAOnkvCuSfyR86baWAADmQGpVAgRWr08bSeYNBDy3kqqgY18Qjp8z0Tqw0CTiKWJYb
	YjHvrRZcuWfhGRQ2SIIp9TGjtiio05RBruTOW5k3o=
X-Google-Smtp-Source: AGHT+IHHiye5Gn8HZeyrS9PLSltkIWzfQ0O6sYy/idOXXDglgVNEe83eAJW4CQ2p0TXWtPfIaYikIA==
X-Received: by 2002:a05:6808:6618:b0:44f:946a:c9f1 with SMTP id 5614622812f47-455aca209d2mr6336553b6e.64.1765900549982;
        Tue, 16 Dec 2025 07:55:49 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598b46bf4sm1607175b6e.5.2025.12.16.07.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 07:55:49 -0800 (PST)
Message-ID: <bdfa024a-ad3d-47af-b629-ede7d4ecd607@sifive.com>
Date: Tue, 16 Dec 2025 09:55:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, opensbi@lists.infradead.org
References: <20251209053130.407935-1-apatel@ventanamicro.com>
 <CAAhSdy3wZ=ih970E1ZT9tW+=gz1gYbjMWELriHX1ya-pr40iUw@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAAhSdy3wZ=ih970E1ZT9tW+=gz1gYbjMWELriHX1ya-pr40iUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_075551_679897_EA75ECFF 
X-CRM114-Status: GOOD (  13.48  )
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

QW51cCwKCk9uIDIwMjUtMTItMTYgODo0NSBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUs
IERlYyA5LCAyMDI1IGF0IDExOjAx4oCvQU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+IHdyb3RlOgo+Pgo+PiBMZWF2aW5nIG5vIGVtcHR5IHNwYWNlIGluIHRoZSBGRFQgcGFz
c2VkIHRvIHRoZSBuZXh0IGJvb3Rpbmcgc3RhZ2UKPj4gY2F1c2VzIHRoZSBmb2xsb3dpbmcgVS1C
b290IGNyYXNoIG9uIFZlbnRhbmEgaW50ZXJuYWwgcGxhdGZvcm1zOgo+Pgo+PiBVbmhhbmRsZWQg
ZXhjZXB0aW9uOiBMb2FkIGFjY2VzcyBmYXVsdAo+PiBFUEM6IDAwMDAwMDAwZmZmYTYzNzIgUkE6
IDAwMDAwMDAwZmZmYTc0MTggVFZBTDogMDAwMTc0NjE3NDczMDA2OAo+PiBFUEM6IDAwMDAwMDAw
ODAyNDUzNzIgUkE6IDAwMDAwMDAwODAyNDY0MTggcmVsb2MgYWRqdXN0ZWQKPj4KPj4gU1A6ICAw
MDAwMDAwMGZlZjM4NDQwIEdQOiAgMDAwMDAwMDBmZWY0MGU2MCBUUDogIDAwMDAwMDAwMDAwMDAw
MDAKPj4gVDA6ICAwMDAwMDAwMGZlZjQwYTcwIFQxOiAgMDAwMDAwMDAwMDAwZmYwMCBUMjogIDAw
MDAwMDAwMDAwMDAwMDAKPj4gUzA6ICAwMDAwMDAwMGZmZmMxN2E4IFMxOiAgMDAwMDAwMDBmZWYz
OGQ0MCBBMDogIDczNzU3NDYxNzQ3MzAwNjgKPj4gQTE6ICAwMDAwMDAwMGZmZmMxN2E4IEEyOiAg
MDAwMDAwMDAwMDAwMDAxMCBBMzogIDAwMDAwMDAwMDAwMDAwMTAKPj4gQTQ6ICAwMDAwMDAwMDAw
MDAwMDAwIEE1OiAgMDAwMDAwMDBmZmZjMTdiOCBBNjogIDAwMDAwMDAwMDBmZjAwMDAKPj4gQTc6
ICAwMDAwMDAwMDAwMDBiMTAwIFMyOiAgMDAwMDAwMDAwMDAwMDAwMCBTMzogIDAwMDAwMDAwMDAw
MDAwMDEKPj4gUzQ6ICAwMDAwMDAwMGZlZjM4ZDQwIFM1OiAgNzM3NTc0NjE3NDczMDA2OCBTNjog
IDAwMDAwMDAwMDAwMDAwMDAKPj4gUzc6ICAwMDAwMDAwMGZlZjRlZWYwIFM4OiAgMDAwMDAwMDBm
ZWY0ZWY5MCBTOTogIDAwMDAwMDAwMDAwMDAwMDAKPj4gUzEwOiAwMDAwMDAwMDAwMDAwMDAwIFMx
MTogMDAwMDAwMDBmZWY0ZWZjMCBUMzogIDAwMDAwMDAwZmVmNDBlYTgKPj4gVDQ6ICAwMDAwMDAw
MDAwZmYwMDAwIFQ1OiAgMDAwMDAwMDBmZWY0MGE2MCBUNjogIDAwMDAwMDAwZmVmNDBhNmMKPj4K
Pj4gVG8gYWRkcmVzcyB0aGUgYWJvdmUgaXNzdWUsIGtlZXAgc29tZSBtaW5pbWFsIGVtcHR5IHNw
YWNlIGluIHRoZQo+PiBGRFQgaW5zdGVhZCBvZiBubyBlbXB0eSBzcGFjZS4KPj4KPj4gRml4ZXM6
IGJiZTlhMjMwNjBlOSAoInBsYXRmb3JtOiBnZW5lcmljOiBQYWNrIHRoZSBGRFQgYWZ0ZXIgYXBw
bHlpbmcgZml4dXBzIikKPj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Cj4gCj4gQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2Jp
IHJlcG8uCgpBZ2FpbiwgdGhpcyBwYXRjaCByZWludHJvZHVjZXMgdGhlIGJ1ZyB0aGF0IHdhcyBm
aXhlZCBieSB0aGUgIkZpeGVzOiIgY29tbWl0LgpZb3UgY2FuJ3QganVzdCBzYXkgInNvbWVib2R5
IHdpbGwgYWRkIHRoZSBtZW1zZXQoKSBzb21ld2hlcmUgbGF0ZXIiIGFuZCBpZ25vcmUKdGhlIGJ1
ZyB5b3UgYXJlIGludHJvZHVjaW5nLiBZb3UgbmVlZCB0byBhZGQgdGhlIG1lbXNldCgpICpub3cq
IGFsb25nIHdpdGggdGhlCmZkdF9vcGVuX2ludG8oKSBjYWxsLgoKUmVnYXJkcywKU2FtdWVsCgo+
PiAtLS0KPj4gQ2hhbmdlcyBzaW5jZSB2MjoKPj4gLSBGaXggY29tbWVudHMgaW4gZ2VuZXJpY19m
aW5hbF9pbml0KCkKPj4gQ2hhbmdlcyBzaW5jZSB2MToKPj4gLSBBZGQgS2NvbmZpZyBvcHRpb24g
Zm9yIGFtb3VudCBvZiBlbXB0eSBzcGFjZSBpbiBGRFQgd2l0aCBkZWZhdWx0Cj4+ICAgdmFsdWUg
YXMgNEtCCj4+IC0tLQo+PiAgcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgIHwgNSArKysrKwo+
PiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIHwgMyArKysKPj4gIDIgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL0tj
b25maWcgYi9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcKPj4gaW5kZXggMjViODg4NmIuLmIxODA4
MDEyIDEwMDY0NAo+PiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcKPj4gKysrIGIvcGxh
dGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4+IEBAIC0yMyw2ICsyMywxMSBAQCBjb25maWcgUExBVEZP
Uk1fR0VORVJJQ19NSU5PUl9WRVIKPj4gICAgICAgICByYW5nZSAwIDY1NTM1Cj4+ICAgICAgICAg
ZGVmYXVsdCAxCj4+Cj4+ICtjb25maWcgUExBVEZPUk1fR0VORVJJQ19GRFRfRU1QVFlfU1BBQ0UK
Pj4gKyAgICAgICBpbnQgIlBsYXRmb3JtIEZEVCBlbXB0eSBzcGFjZSAoS0IpIgo+PiArICAgICAg
IHJhbmdlIDAgMTAyNAo+PiArICAgICAgIGRlZmF1bHQgNAo+PiArCj4+ICBjb25maWcgUExBVEZP
Uk1fQUxMV0lOTkVSX0QxCj4+ICAgICAgICAgYm9vbCAiQWxsd2lubmVyIEQxIHN1cHBvcnQiCj4+
ICAgICAgICAgZGVwZW5kcyBvbiBGRFRfSVJRQ0hJUF9QTElDCj4+IGRpZmYgLS1naXQgYS9wbGF0
Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPj4g
aW5kZXggZTY2Zjk5ZmEuLjAxZmEwM2UwIDEwMDY0NAo+PiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmlj
L3BsYXRmb3JtLmMKPj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4+IEBAIC0y
NDUsNyArMjQ1LDEwIEBAIGludCBnZW5lcmljX2ZpbmFsX2luaXQoYm9vbCBjb2xkX2Jvb3QpCj4+
ICAgICAgICAgZmR0X2ZpeHVwcyhmZHQpOwo+PiAgICAgICAgIGZkdF9kb21haW5fZml4dXAoZmR0
KTsKPj4KPj4gKyAgICAgICAvKiBTZXQgdGhlIGVtcHR5IHNwYWNlIGluIEZEVCBiYXNlZCBvbiBr
Y29uZmlnIG9wdGlvbiAqLwo+PiAgICAgICAgIGZkdF9wYWNrKGZkdCk7Cj4+ICsgICAgICAgZmR0
X29wZW5faW50byhmZHQsIGZkdCwgZmR0X3RvdGFsc2l6ZShmZHQpICsKPj4gKyAgICAgICAgICAg
ICAgICAgICAgIENPTkZJR19QTEFURk9STV9HRU5FUklDX0ZEVF9FTVBUWV9TUEFDRSAqIDEwMjQp
Owo+Pgo+PiAgICAgICAgIHJldHVybiAwOwo+PiAgfQo+PiAtLQo+PiAyLjQzLjAKPj4KPiAKCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
