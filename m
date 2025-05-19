Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED690C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4iaZPd7eSAgQHn4Z0mVd+twAdUPFaSmVo0bZbPocwM=; b=lAUNbGUjEJaTjg
	i6gcfxPfkPpE0oKTchVIRH8gTSoF+E6IaCptVwLwPwVCMA/l9Fi+tUXMP3wW6wHvWZlVgs+7fczii
	SxWK//1aRhctwxe8okOsuDmw+lBGhTaaZFWKURn7ZHVK4dGsRsRe13D9mhbZOTxGY5Odk0s7vwjOz
	bqYaiqdgTTTxDTV6YbeIj0L/RRxkypaZuy4uvqzvbcLAO75fMfcD32C4fZIoP7RRk1ekKHwOuNQNk
	vJ2BQDjxO4siJI1ktBCXjXoOQWronvWCAyO+X3I0iqQXQtLNBU2/Jo1QFIY/MGSRR1zOpDe06Vd/W
	1X0gBIyZl2pMWNvj5DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Tc-0000000Afeq-00um;
	Mon, 19 May 2025 21:56:52 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8TZ-0000000Afdw-0Pkr
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:56:50 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3dc729471e3so4681805ab.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747691808; x=1748296608; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ogycOxZ8se8KGl7O80jjqgzLjikCx5ALUlA92T6Pqfg=;
        b=FIvgUgCFMbVbB6QqSMckkIwW+VAfivIWVAJVqz7q24mgIYG8Lq8NJ4TvUPsB/N8ZfW
         WRRSRW4n6IieFF7YDJ3RpOwyr6RPX/0V6dozezu1S9dU1G9ADhUwnNfCKM53zd270tIX
         QhdIwmZ81Jmow6Onol9LIOa689Hd4Xjfe2658INrfdZQrnWahcRdOsSKcq0Bw421ZeiC
         o1tz9mTO60MyN5Z80dShGFBOAv23xmuaW+ufRLSpMXU4Xx3ecfsd1UDLNnoBoZRJTPuF
         zsquob2uubOunV1X6y0GeEV/b4tzDlQIYTHCIGoKYIuNVbUq5sH/i10w55wW5fZn2fPM
         FWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691808; x=1748296608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogycOxZ8se8KGl7O80jjqgzLjikCx5ALUlA92T6Pqfg=;
        b=myRdJydrs/nyeq9dIsuNBl1Glq8SFJ2wp2Vj9t8Iol3Iwl6HpPRC2Ld7H/PUoyAN6T
         pcKqYEryDsuKAIIcZun8gAcyK4R6a04KVglRKaMG9UBjd5i4c0Dji51e296yyhyyRgUD
         g2nKTsFX3JoxWsv9LwV+WZ16XDMDpsBBbeFeFsqwYKz7pHoQVMW2Oz0u66zR/I6APaEK
         qst3Phf9fUMnN4t9P/Mmm9FlinIWWm8ohxtyUd9dQqsghDCOg6ygWgp9syaALWMWuIkp
         zWyyaCh2z7TNxxlA09RnhGGSbi78CklZeRgs0bqkuSv2BCQV1weFjKVAQtVtL5BfMCMf
         4Vug==
X-Forwarded-Encrypted: i=1; AJvYcCUQEnzaTeuPvM5FgrszgsAmPUGq5mjtqe0SO3ZPfsPv1X2RKaNSX3FUTfa5COQlUBITCc3QpBcd@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHqY+skz5D+/46PGl05//7CbDY3rG0cqFW3DZKDQbE29i3xs8
	EC5yZdy9EemN9/8ZKgQ3wD6eB/oy7DTYI7yoj/zBeQD8WJIHYUkLIbq83tAtJhCvlQ8ed0H8jvN
	hxLTv
X-Gm-Gg: ASbGncuJ16szOU9xBs8a2a2JPsdTcg57RrWcXuc7N+T4gQpncPysoF/GIPO7Q9Rz9d3
	AJ6kbGO3Yc0xt3WfcE8qJzQw6J330aRlziL3WP6TnTWxxnABRu+OFc0FSj4nYZ/CEbfuDqK4InU
	GCWC6HLbUOzQqAZup2ZE0qgM62Qjpl09b+4/RYOr6CV7e+mY4bMkYivWv7t8bBKCAImvBvq/5SL
	bVMfb5vNA32cCdb3h3V4sruYS4CbWfB70uBOYzfq2czT+r+JG+p8yJxRPrcA+HOmphtNrwTEnGH
	24u1fRyyWl+41gak+Ub2KMEHv+9P4LYOjFFWE9H/z1ySwWzYh10dZVhHoQos/D8WCts=
X-Google-Smtp-Source: AGHT+IEwW+F/0iuwEpt78Gnx6eIs5OqhAAfxo9+SdGVcaYWH5P6Yx66SSanCZTq8ut+h+GQauzsPNg==
X-Received: by 2002:a05:6e02:351d:b0:3d3:fbae:3978 with SMTP id e9e14a558f8ab-3db84306472mr142577445ab.9.1747691808073;
        Mon, 19 May 2025 14:56:48 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc669b21b8sm11057505ab.37.2025.05.19.14.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 14:56:47 -0700 (PDT)
Message-ID: <c73f0d67-3988-4c26-bbca-eca32c65c942@sifive.com>
Date: Mon, 19 May 2025 16:56:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] lib: sbi: pmu: Rework SSE callbacks
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250519083950.739044-1-cleger@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250519083950.739044-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145649_145081_F9442463 
X-CRM114-Status: GOOD (  14.25  )
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

SGkgQ2zDqW1lbnQsCgpPbiAyMDI1LTA1LTE5IDM6MzkgQU0sIENsw6ltZW50IEzDqWdlciB3cm90
ZToKPiBXaGlsZSB0ZXN0aW5nIHRoZSBQTVUgU1NFIHN1cHBvcnQgaW4gTGludXgsIGEgZmV3IHBy
b2JsZW0gd2VyZSBzcG90dGVkLgo+IFRoZSBmaXJzdCBvbmUgd2FzIGR1ZSB0byBpbnRlcnJ1cHRz
IGhhcHBpbmcgZHVyaW5nIHNvbWUgUE1VIGNyaXRpY2FsCj4gc2VjdGlvbnMuIEluZGVlZCwgdGhl
IFBNVSBjb3JlIGFjdHVhbGx5IGRpc2FibGUgaW50ZXJydXB0cyB3aGVuIGVudGVyaW5nCj4gdGhl
c2Ugc2VjdGlvbnMuIEhvd2V2ZXIsIHdoaWxlIHRoaXMgd29ya3Mgd2hlbiBpbnRlcnJ1cHRzIGFy
ZSB0YXJnZXRpbmcKPiB0aGUgUy1tb2RlLCB0aGlzIGlzIG5vdCB0aGUgY2FzZSB3aXRoIFNTRS4g
Rml4aW5nIHRoaXMgcmVxdWlyZWQgdG8KPiBpbXBsZW1lbnQgcG11X2Rpc2FibGUvZW5hYmxlKCkg
aW4gTGludXggWzFdLiBUaGVzZSB0d28gY2FsbGJhY2tzIG5vdwo+IGNhbGwgc3NlX2V2ZW50X2Rp
c2FibGUvZW5hYmxlKCkgd2hpY2ggbm93IGp1c3QgbmVlZHMgdG8gc2V0L2NsZWFyCj4gTUlFL01J
UC4gU2Vjb25kIHByb2JsZW0gd2FzIHRoYXQgcmVwb3J0ZWQgUE1VIGV2ZW50cyBjb3VudCB3ZXJl
IHF1aXRlCj4gbG93LiBUaGlzIHByb3ZlZCB0byBiZSBkdWUgdG8gc29tZSBpbnRlcnJ1cHRzIGJl
aW5nIGxvc2VkIHdoZW4KPiByZWVuYWJsaW5nIFNTRSBldmVudC4gV2Ugc3RpbGwgbmVlZCB0byBj
bGVhciB0aGUgcGVuZGluZyBQTVUgaW50ZXJydXB0cwo+IHVwb24gZGlzYWJsaW5nIG90aGVyd2lz
ZSB3ZSBtaWdodCBnZXQgc29tZSBzcHVyaW91cyBpbnRlcnJ1cHRzIHdoZW4KPiByZWVuYWJsaW5n
IGl0LgoKQ291bGQgeW91IGNsYXJpZnkgd2hhdCBjb3VsZCBjYXVzZSBzcHVyaW91cyBpbnRlcnJ1
cHRzIGhlcmU/IERpc2FibGluZyB0aGUgU1NFCmV2ZW50IHNob3VsZCBqdXN0IHByZXZlbnQgaXQg
ZnJvbSBiZWluZyBkZWxpdmVyZWQgdG8gUy1tb2RlLCByaWdodD8gSXQgZG9lc24ndAphZmZlY3Qg
dGhlIGV2ZW50J3MgcGVuZGluZyBzdGF0dXMuIE15IHJlYWRpbmcgb2YgdGhlIHByaXZpbGVnZWQg
c3BlYyBpcyB0aGF0Cm1pcC5MQ09GSVAgaXMgZWRnZS10cmlnZ2VyZWQgYnkgdGhlIGluZGl2aWR1
YWwgaHBtY291bnRlciBPRiBiaXRzLiBTbyBpZiBhbnkKY291bnRlciBpcyBjb3VudGluZywgYW5k
IG1pcC5MQ09GSVAgaXMgY2xlYXJlZCB3aXRob3V0IGhhbmRpbmcgdGhlIG92ZXJmbG93LApTLW1v
ZGUgd291bGQgKGVycm9uZW91c2x5KSBsb3NlIGFuIG92ZXJmbG93IGV2ZW50LiBUaGlzIGNvdWxk
IGhhcHBlbiBpZiBmb3IKZXhhbXBsZSBhbiBvdmVyZmxvdyBvY2N1cnMgYW5kIHBtdV9zc2VfZGlz
YWJsZSgpIHdhcyBjYWxsZWQgYm90aCBmcm9tIHdpdGhpbiB0aGUKU1NFIGhhbmRsZXIuCgpJZiBt
eSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHRvIG1hdGNoIHRoZSBlZGdlIGludGVycnVwdCBz
ZW1hbnRpY3MgKGNsZWFyCkxDT0ZJUCBiZWZvcmUgaGFuZGxpbmcsIGFzIG5vdGVkIGluIHRoZSBw
cml2aWxlZ2VkIHNwZWMpLCBJIHRoaW5rIHRoZSBvbmx5IHBsYWNlCnRoYXQgc2hvdWxkIGNsZWFy
IG1pcC5MQ09GSVAgaXMgc2JpX3BtdV9vdmZfaXJxKCksIG5vdCBzYmlfcG11X2N0cl9zdG9wKCkg
b3IKcG11X3NzZV9kaXNhYmxlKCkuCgpSZWdhcmRzLApTYW11ZWwKCj4gTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA1MTYxNTIzNTUuNTYwNDQ4LTEtY2xlZ2Vy
QHJpdm9zaW5jLmNvbS8gWzFdCj4gCj4gQ2zDqW1lbnQgTMOpZ2VyICgyKToKPiAgIGxpYjogc2Jp
OiBwbXU6IEFkZCBTU0UgcmVnaXN0ZXIvdW5yZWdpc3RlcigpIGNhbGxiYWNrcwo+ICAgbGliOiBz
Ymk6IHBtdTogUmVtb3ZlIE1JUCBjbGVhcmluZyBmcm9tIHBtdV9zc2VfZW5hYmxlKCkKPiAKPiAg
bGliL3NiaS9zYmlfcG11LmMgfCAyNSArKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAoKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
