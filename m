Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB9ECD98CE
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOvycMd9Abl3+eU0AQH1xZXhnTERjG4ZFvHzYqB/0CQ=; b=IoA97wneAyQ9PU
	KelZWZsZf8QdVno/L+rtIvlFqkyVMPD+YQzZspE+cYv3I1hd95ixUZH9/Y6NQu9Af3XgkxrSziWAV
	aUSA8u/GF6odev9kJ3cyBAd1KUNz6a/hONMjqmiP8IC8jCz0HrkolPJp7CXHd8H/Aike2ZMJhry74
	dYfti80zzG4v8PwC6MiQ5EwC78M1nJNWNKufjIUZx+vA+Por4536hNdocr3EueyayRK9RHMzqj6a8
	WKCc8704b4AVlfKtayTuU6iOeJrP7zaAunflbKw5j4jJPydfCqGkbpdTsQvRcoUdI4ACHM3zpk73c
	sh+iKKyBNjhizlRBxSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1QB-0000000AugR-20RC;
	Fri, 12 Jun 2026 12:55:39 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Q7-0000000Aufv-48aR
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 12:55:37 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e6db226e1fso687979a34.0
        for <opensbi@lists.infradead.org>; Fri, 12 Jun 2026 05:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781268934; cv=none;
        d=google.com; s=arc-20240605;
        b=bYyQTUL+ELLBfEqAbu7s97fE/I4x2HWD8BWqHuZ5SCqV2SCO3auSydoQWaHoL5UUKy
         ENGR7QENeF0BgFwbNi4W0+4sc2b933KifKhvEbOlRhP0J8kyN3GYw9VrrdbR0xKiF6/7
         X6pZdbneTO+7oklFtMdfGh6Hk2AOSfHweuAh3C7vNwlD04e9X8J7uzsZ++0DWFdXS2Uz
         vfblvY4Lp3s5r9xAGQznb5lYLPqWoLEeA2yn4MqzbCvPfyAAY3mGk4/HvHOOyM5uuaEZ
         lorABjdKYnRDAhjVBXVnyUGAI/d53pcVaNvV905i9cr8t4v90K2/GOjQEu+3tkphiiGF
         V7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aq0kzPWtEiTfxnUIEY4X56Oic0aOu7LLTMU+cuodc9k=;
        fh=eKJuLwe/Q3abxqiDCY82BKbySJb4gPVa1nOip41npJE=;
        b=U0gV+/cTjQA8YT0c/pdOpWpPSk5NwfPF9sPlXhKR4yEo2BF96oVp/FM+6mN6nYSguq
         +Gp9gmiK85bYuZ+8ID1WHsJFBPJdJpHBbIz7Y1VElxJtQ7s33J6ntedZqmvrc9DnR5oT
         sJ+J5dWv0nSPQm2a435r5iYsYXDWXWlYCabUv2yfkZ9VV435T6Z8TcTFzXPXA8HaubzC
         2AfigB7ps4OIGKAxW/oHE8KtW6s4G5BophRGFyfjDqbMPvCbtxJLcYhgV4VNSMGl9ovb
         eiDxsRBwtBbE18Lu5rQE9KCz2GNUloto0yujrWhblRbZzMdCXQXKC3ltSrdEsN0GtsiE
         D6gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781268934; x=1781873734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq0kzPWtEiTfxnUIEY4X56Oic0aOu7LLTMU+cuodc9k=;
        b=Fad2FirSCwZlot2V3H41ryquCTDuTFpzRLHYrqrJEw+ioCh8xXU2H55opqjGE4fpD4
         9Fas82htVhpcT7ppalEREbUU7y54KJXXiORpDZBRph5UaNHHPwQQxYn+4lKa9wWHHU3V
         nJxJYi2tdenWTwQuTP6W1gtI2nvsjwpYfml7Bc0l/i4yllF8kQNk2X4sA/+RN6o8+qy7
         1zwzEUR4rUgbIwERbphvH3lo5tBlfLtE5Z2i4KswZQ9uw9BX2hsK5v20rWdl69dQmtwu
         NHeqAGwnnC4zHXbJMU8BK/pPZSjxi/qNLX8dABpPPhlnzNWNc2RV5vLPFHAE1/2LNKjP
         IlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268934; x=1781873734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aq0kzPWtEiTfxnUIEY4X56Oic0aOu7LLTMU+cuodc9k=;
        b=TJrCq+8od6VXH7nTWH7dpnMqiVLSlZnQdNtx3/PEPpvT3Gvu2AqtaEzepUMJcIxFkc
         zQwLMA8EqR6p7wnX2pHjE5p87Q5/7iZlh7ML0Q+qpQgaiT6vEahus/uDS1F9Plm5kGZi
         vqv6+W8KtFd3MH8y42+LBfoOI2uxfTJgLw1J0JAVo2XWHmoQUkA0tqi/o/iNu2LSHMqA
         ajOq8u7VNpxxU7mZPjiBkAmqiLG+in+fyclv95riAeQgQFfo/JbRhS+fE8racGKkNdMF
         Sb1AcyNhguDrg4fxUqxT6bW0rWHmXIOitLd2jRsFuaS27hffk2zY/oXyHaHjkFog/7Mb
         gU5w==
X-Gm-Message-State: AOJu0YxXckDVp4USAK/xuFU0TVDCDb5Hs/ZA81wAeWDp6X8gppDmSbm+
	agxkcrXogYFUrZFn5NP6ednBJMzHx/iMws0AByezhYi4aGxtE6HsKgFBXPFRbNHAHT7ZFxRQIVZ
	gZRJOiBPtlt6dVxRZ1iI9eCvlA2Si9069LvjpUWMLEA==
X-Gm-Gg: Acq92OG9NCUIjRk92TJoXN/zyBal2E0IL4IC0huwJzA3aDJv3faz1frqSLGj18E5D9k
	aKo9dePdzpqUu+iMg7tWVUHXEa72amXZotUUCaCaLJUMVz6bPRnv0Oj6jhRB8CQ1KBG439SZNoz
	s3Mxfs0LDR7NX4freJEHC/o2Rl5ls2qjcmKkVo+YQvSSSnCKA1TsJCTBHxkxmU3EzkinJPDFL6Y
	zK3flN76ub8D2uoq8tObS1c/OcOR/i4RNLytoOZB+N/3wsuzGw6KgtWQfNaOkFmbm9F2UpSUYQZ
	2JIUDoT+j71yIvCr+fGE9py/h77OobdoBuRq/Qtf60cevFIJvcx0nbwQWrUxyBoCoyKghmCpW5T
	Bp00VfnEPAkhGmmjS9r3aDPF0ow==
X-Received: by 2002:a05:6808:f8e:b0:486:4912:fc6f with SMTP id
 5614622812f47-4872f4be48bmr1759041b6e.23.1781268934512; Fri, 12 Jun 2026
 05:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260519225014.244672-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260519225014.244672-1-evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Jun 2026 18:25:23 +0530
X-Gm-Features: AVVi8Ccnt40ounMuGzIW6uJ8iqOFWv0h4u4plVpVxVh-_ubRUB_PEx2TFTFPfN0
Message-ID: <CAAhSdy1_vrEdaAZ3NGcZGAEeYUYi1qAPMa4xL+_kTDHpX0erig@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Apply budget restriction when polling Zkr CSR
 state transition
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055536_040765_9EACB87A 
X-CRM114-Status: GOOD (  24.82  )
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgNDoyMOKAr0FNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFprciBhcmNoaXRlY3R1cmUgZG9lc24ndCBk
ZWZpbmUgYSB0aW1lIGxpbWl0IG9uIHN0YXRlIHRyYW5zaXRpb25zCj4gd2hpY2ggcmVzdWx0cyBp
biBoYW5naW5nIG9uIHVucmVzcG9uc2l2ZSBvciBldmVudC1kcml2ZW4gcGxhdGZvcm1zLgo+IFRv
IHByZXZlbnQgdGhpcywgd2UgbmVlZCB0byBsaW1pdCBwb2xsaW5nIGl0ZXJhdGlvbnMgYW5kIGZh
bGwgYmFjawo+IGluIGNhc2UgdGhlIGJ1ZGdldCBpcyBvdmVyLCBhbmQgc3RhY2sgZ3VhcmQga2Vl
cHMgaXRzIGluaXRpYWwgdmFsdWUuCj4gVGhlIGJ1ZGdldCBpcyBjb25maWd1cmFibGUgd2l0aCBD
T05GSUdfU0JJX0lOSVRfWktSX1BPTExfQlVER0VULAo+IGRlZmF1bHRpbmcgdG8gMTAwMCBpdGVy
YXRpb25zLgo+IFN1Y2Nlc3NmdWwgcmVhZHMgZG8gbm90IGNvbnN1bWUgYSB0cnkuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBFdmdlbnkgVm9ldm9kaW4gPGV2dm9ldm9kQHRlbnN0b3JyZW50LmNvbT4KPiAt
LS0KPiAgbGliL3NiaS9LY29uZmlnICAgIHwgMTIgKysrKysrKysrKysrCj4gIGxpYi9zYmkvc2Jp
X2luaXQuYyB8IDEyICsrKysrKysrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9LY29uZmlnIGIv
bGliL3NiaS9LY29uZmlnCj4gaW5kZXggYzZjYzA0YmMuLmExMWY3ODhjIDEwMDY0NAo+IC0tLSBh
L2xpYi9zYmkvS2NvbmZpZwo+ICsrKyBiL2xpYi9zYmkvS2NvbmZpZwo+IEBAIC02LDYgKzYsMTgg
QEAgY29uZmlnIENPTlNPTEVfRUFSTFlfQlVGRkVSX1NJWkUKPiAgICAgICAgIGludCAiRWFybHkg
Y29uc29sZSBidWZmZXIgc2l6ZSAoYnl0ZXMpIgo+ICAgICAgICAgZGVmYXVsdCAyNTYKPgo+ICtj
b25maWcgU0JJX0lOSVRfWktSX1BPTExfQlVER0VUCgpUaGUgU0JJX0lOSVRfIHByZWZpeCBpcyBu
b3QgbmVlZGVkIG90aGVyd2lzZSBsb29rcyBnb29kIHRvIG1lLgpJIHdpbGwgdGFrZSBjYXJlIG9m
IGl0IGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KCj4gKyAgICAgICBpbnQgIlpr
ciBzZWVkIHBvbGxpbmcgYnVkZ2V0IChpdGVyYXRpb25zKSIKPiArICAgICAgIGRlZmF1bHQgMTAw
MAo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBNYXhpbXVtIG51bWJlciBvZiBpdGVyYXRpb25z
IHRvIHBvbGwgQ1NSX1NFRUQgd2hlbiBpbml0aWFsaXppbmcKPiArICAgICAgICAgdGhlIHN0YWNr
IGd1YXJkIHZhcmlhYmxlLiBUaGUgWmtyIHNwZWNpZmljYXRpb24gZG9lc24ndCBkZWZpbmUKPiAr
ICAgICAgICAgYSB0aW1lIGxpbWl0IG9uIHRyYW5zaXRpb25pbmcgdG8gRVMxNiBiZXR3ZWVuIHBv
bGxzLCB3aGljaAo+ICsgICAgICAgICBtYWtlcyBpdCBpbXBvc3NpYmxlIHRvIHRlbGwgd2hldGhl
ciBlbnRyb3B5IGlzIGJlaW5nCj4gKyAgICAgICAgIGFjY3VtdWxhdGVkIHNsb3dseSBvciB0aGUg
ZW50cm9weSBzb3VyY2UgaXMgbm90IGZ1bmN0aW9uaW5nLgo+ICsgICAgICAgICBUaGlzIGFsc28g
bGltaXRzIHRoZSB3YWl0IHRpbWUgb24gc3lzdGVtcyB3aXRoIGFuIGV2ZW50LWRyaXZlbgo+ICsg
ICAgICAgICBlbnRyb3B5IHNvdXJjZS4gQSBzdWNjZXNzZnVsIHJlYWQgZG9lc24ndCBjb25zdW1l
IGEgdHJ5Lgo+ICsKPiAgY29uZmlnIFNCSV9FQ0FMTF9USU1FCj4gICAgICAgICBib29sICJUaW1l
ciBleHRlbnNpb24iCj4gICAgICAgICBkZWZhdWx0IHkKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9z
YmlfaW5pdC5jIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gaW5kZXggYjI0OGU3M2YuLjdhMGM0Zjc0
IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2luaXQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2lu
aXQuYwo+IEBAIC0yODAsMjAgKzI4MCwyNiBAQCBzdGF0aWMgdm9pZCBfX25vcmV0dXJuIGluaXRf
Y29sZGJvb3Qoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCB1MzIgaGFydGlkKQo+ICAgICAg
ICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1pLUikp
IHsKPiAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBndWFyZF92YWwgPSAwOwo+ICAgICAg
ICAgICAgICAgICBpbnQgY2h1bmtzID0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpIC8gc2l6ZW9mKHVp
bnQxNl90KTsKPiAtICAgICAgICAgICAgICAgYm9vbCByZXMgPSB0cnVlOwo+ICsgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgdHJpZXMgPSBDT05GSUdfU0JJX0lOSVRfWktSX1BPTExfQlVER0VU
Owo+ICsgICAgICAgICAgICAgICBib29sIHJlcyA9IGZhbHNlOwo+Cj4gLSAgICAgICAgICAgICAg
IHdoaWxlIChjaHVua3MpIHsKPiArICAgICAgICAgICAgICAgd2hpbGUgKGNodW5rcyAmJiB0cmll
cykgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2VlZCA9IGNzcl9z
d2FwKENTUl9TRUVELCAwKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IG9wc3QgPSBzZWVkICYgU0VFRF9PUFRTX01BU0s7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmVzID0gZmFsc2U7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAob3BzdCA9PSBTRUVE
X09QVFNfREVBRCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVzID0gZmFs
c2U7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG9wc3QgPT0gU0VF
RF9PUFRTX0VTMTYpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGd1YXJkX3Zh
bCA9IChndWFyZF92YWwgPDwgMTYpIHwgKHNlZWQgJiBTRUVEX0VOVFJPUFlfTUFTSyk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaHVua3MtLTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlcyA9IHRydWU7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiBTdWNjZXNzZnVsIHJlYWQgZG9lc24ndCBjb25zdW1lIGEgdHJ5ICovCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0cmllcysrOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHJpZXMtLTsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAg
ICAgICBpZiAocmVzKQo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxp
c3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVu
c2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
