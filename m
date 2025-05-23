Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8977AC54ED0
	for <opensbi@archiver.kernel.org>; Fri, 23 May 2025 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DujyVMYzSXUyZ9D2YrHj2XWfNNO+ap4zUD/5kRAUrpQ=; b=f9eSwcddmHp6wV
	4wole8DWPhBSwewPkPRlihgSgU/oHY9Lwom0SdrUK6ErTo1QIgsvIozOJhHAPC/Br6LclUir4ZYy6
	XWjtAY1zXAaADUCo8h5RFM1OmAcZuorGPn72ZTLZq9UYp+aCvcTp2oYqWWeb0l/7RJM9rs+cRapyT
	RD7OB4bQxxIhDg1fAaeoAAwzxhrZSrIL9EnEm3lvZZqHOulV60fnEBFkxa5kPtpX1qC4iPzygZZMM
	d/tZjbhtWsQAekshlxDKzb49VRtwWkcLqB2SEYRnvInrGfoIzZt7hte57EHPvqnWIRWI0jZGopmHF
	is/1+e9sMun201n8/PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO35-00000003Lgz-2vwv;
	Fri, 23 May 2025 08:46:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO31-00000003LgF-3PkO
	for opensbi@lists.infradead.org;
	Fri, 23 May 2025 08:46:38 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7399838db7fso630120b3a.0
        for <opensbi@lists.infradead.org>; Fri, 23 May 2025 01:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747989995; x=1748594795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksUYukVitwoizhHaW9wpv8KQe7bwd2JPNI1iSN770VE=;
        b=EhyarJLnYh7b04BCJJqfWknsoX+2xfEbGaQYflnH2jZ7Jpmnqc9SYIoZicTa3MPwXE
         4vPO+cgoCNIWP4crcjXPUhRNj6bh2j7FbprsBvw6sZrOXWQRGogMN1Y1WgKr+Ps9Xynk
         SH9FOp9BWzuCl380wYDdTHZ+PtqYeAVxuB7bSt6FMU7lKd2DpwxzdBtoLmUnY5ZG3y/B
         nGmlZGnabr9T+lEVLqEKCDqF6rouemNWMx1bIVq758Om4yx/mN1z+F+6/fnGIViznRbG
         jqsgpTukVyvBKDuQV+L6o/PN+AjHC+1DJaHEUy8l+iqC/FnAwic+E8nfToq5uR4xheXG
         Nd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989995; x=1748594795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksUYukVitwoizhHaW9wpv8KQe7bwd2JPNI1iSN770VE=;
        b=CcELW+VcLHqqrrhnJYgwLlzi24YxsPEjr4SxQbAcQNOzRO/Az70bDikCnWft6eMx/O
         Vwqx8ckLfxxjyL9E1LHI3bwVDTg+T6YINkkBfTDPY2PxkRTs8QCl6TjRh6G5rWrwDRfq
         zoUQD3+icRkgd+tJX5/S8nChb+JsCGNeLI1xFqROcNcYLpFdd6nC7jDr1Abs2amPrt9B
         tdiJaBczaBub/NIOmfIXWYnFNHEGT1TeAjYV0MqYbwAcUd9DAvhiBYrT3vlSy7TcS6pf
         4IXqtOqi9TCIhlnaeKO35jriOiDjTg1Dd+8bSJjsjrtlzfZt42Y4Z0Xm1C+ugxln5eec
         XSEA==
X-Forwarded-Encrypted: i=1; AJvYcCVOlztvEcd/WK1NW3DaNfvz91d+9dd6zAlZwauHj6w1a7GXCUTtSK8TTqxbdJGbCxtDbPZHv3Wy@lists.infradead.org
X-Gm-Message-State: AOJu0YytS6kyEKFrDS6Q1CWjwu8UcdrvFb3OqCsz8H0KPV+AvkHEs4Ig
	hufwGN4G/TZvV790nTxmDuISse5ysAC1vlDxBIcRF0q/DQziJ86/v8ki0TARyyox0Z8=
X-Gm-Gg: ASbGncuZTs3Wklp+wy/evXqffXX9U1ybMrER+d+k6X3iAxaRw4j8MNxIwiodyaQv7iX
	wi838b422OdcJQzPVj1BOdcLXmzyDTzRj5S+XXXci9+EeZCuA0C2BJkcVLcc0wnMrqsqHgePlwl
	KgUDn3TmRdZOSI2F241VJZ5b7sasBmJytMF7o9svyCdSHKyKHf8QaELrbi/+uF9OeCfaueNksW0
	u4niNMctbV+hn3aZDg7jrVANx1BhFwzREdiYdefUWqrc+190vUBL8+MqpMol0JTMqyGERJcjbAl
	nA8GEKVDd+C9cHQGpH8VMonnmCZiFfdgXRWqQivprE1EOxFf4OfJ6FXJnD71QoMtLK81tgFo3cd
	XiRZcwCYq5LUz6RW4dFp2
X-Google-Smtp-Source: AGHT+IGKniW1Q+egQejjXLB6TcMpruGY75jdYEGNQIDGCdjbCt1U011y96o0WjEDKNDkcY8pyOLe/A==
X-Received: by 2002:a05:6a00:3cc1:b0:73d:f9d2:9c64 with SMTP id d2e1a72fcca58-745ece323edmr3719189b3a.10.1747989994785;
        Fri, 23 May 2025 01:46:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a987708asm12337108b3a.155.2025.05.23.01.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 01:46:34 -0700 (PDT)
Message-ID: <ce2b5f21-9124-4a5a-b33b-94564f5c78d5@rivosinc.com>
Date: Fri, 23 May 2025 10:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] lib: sbi: pmu: Rework SSE callbacks
To: Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20250519083950.739044-1-cleger@rivosinc.com>
 <c73f0d67-3988-4c26-bbca-eca32c65c942@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <c73f0d67-3988-4c26-bbca-eca32c65c942@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_014635_852211_DC233886 
X-CRM114-Status: GOOD (  22.13  )
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

CgpPbiAxOS8wNS8yMDI1IDIzOjU2LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiBIaSBDbMOpbWVu
dCwKPiAKPiBPbiAyMDI1LTA1LTE5IDM6MzkgQU0sIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4g
V2hpbGUgdGVzdGluZyB0aGUgUE1VIFNTRSBzdXBwb3J0IGluIExpbnV4LCBhIGZldyBwcm9ibGVt
IHdlcmUgc3BvdHRlZC4KPj4gVGhlIGZpcnN0IG9uZSB3YXMgZHVlIHRvIGludGVycnVwdHMgaGFw
cGluZyBkdXJpbmcgc29tZSBQTVUgY3JpdGljYWwKPj4gc2VjdGlvbnMuIEluZGVlZCwgdGhlIFBN
VSBjb3JlIGFjdHVhbGx5IGRpc2FibGUgaW50ZXJydXB0cyB3aGVuIGVudGVyaW5nCj4+IHRoZXNl
IHNlY3Rpb25zLiBIb3dldmVyLCB3aGlsZSB0aGlzIHdvcmtzIHdoZW4gaW50ZXJydXB0cyBhcmUg
dGFyZ2V0aW5nCj4+IHRoZSBTLW1vZGUsIHRoaXMgaXMgbm90IHRoZSBjYXNlIHdpdGggU1NFLiBG
aXhpbmcgdGhpcyByZXF1aXJlZCB0bwo+PiBpbXBsZW1lbnQgcG11X2Rpc2FibGUvZW5hYmxlKCkg
aW4gTGludXggWzFdLiBUaGVzZSB0d28gY2FsbGJhY2tzIG5vdwo+PiBjYWxsIHNzZV9ldmVudF9k
aXNhYmxlL2VuYWJsZSgpIHdoaWNoIG5vdyBqdXN0IG5lZWRzIHRvIHNldC9jbGVhcgo+PiBNSUUv
TUlQLiBTZWNvbmQgcHJvYmxlbSB3YXMgdGhhdCByZXBvcnRlZCBQTVUgZXZlbnRzIGNvdW50IHdl
cmUgcXVpdGUKPj4gbG93LiBUaGlzIHByb3ZlZCB0byBiZSBkdWUgdG8gc29tZSBpbnRlcnJ1cHRz
IGJlaW5nIGxvc2VkIHdoZW4KPj4gcmVlbmFibGluZyBTU0UgZXZlbnQuIFdlIHN0aWxsIG5lZWQg
dG8gY2xlYXIgdGhlIHBlbmRpbmcgUE1VIGludGVycnVwdHMKPj4gdXBvbiBkaXNhYmxpbmcgb3Ro
ZXJ3aXNlIHdlIG1pZ2h0IGdldCBzb21lIHNwdXJpb3VzIGludGVycnVwdHMgd2hlbgo+PiByZWVu
YWJsaW5nIGl0Lgo+IAo+IENvdWxkIHlvdSBjbGFyaWZ5IHdoYXQgY291bGQgY2F1c2Ugc3B1cmlv
dXMgaW50ZXJydXB0cyBoZXJlPyBEaXNhYmxpbmcgdGhlIFNTRQo+IGV2ZW50IHNob3VsZCBqdXN0
IHByZXZlbnQgaXQgZnJvbSBiZWluZyBkZWxpdmVyZWQgdG8gUy1tb2RlLCByaWdodD8gSXQgZG9l
c24ndAo+IGFmZmVjdCB0aGUgZXZlbnQncyBwZW5kaW5nIHN0YXR1cy4gTXkgcmVhZGluZyBvZiB0
aGUgcHJpdmlsZWdlZCBzcGVjIGlzIHRoYXQKPiBtaXAuTENPRklQIGlzIGVkZ2UtdHJpZ2dlcmVk
IGJ5IHRoZSBpbmRpdmlkdWFsIGhwbWNvdW50ZXIgT0YgYml0cy4gU28gaWYgYW55Cj4gY291bnRl
ciBpcyBjb3VudGluZywgYW5kIG1pcC5MQ09GSVAgaXMgY2xlYXJlZCB3aXRob3V0IGhhbmRpbmcg
dGhlIG92ZXJmbG93LAo+IFMtbW9kZSB3b3VsZCAoZXJyb25lb3VzbHkpIGxvc2UgYW4gb3ZlcmZs
b3cgZXZlbnQuIFRoaXMgY291bGQgaGFwcGVuIGlmIGZvcgo+IGV4YW1wbGUgYW4gb3ZlcmZsb3cg
b2NjdXJzIGFuZCBwbXVfc3NlX2Rpc2FibGUoKSB3YXMgY2FsbGVkIGJvdGggZnJvbSB3aXRoaW4g
dGhlCj4gU1NFIGhhbmRsZXIuCgpIaSBTYW11ZWwsCgpUaGF0J3MgYSBnb29kIHBvaW50IGFuZCBJ
IG11c3QgYWRtaXQgSSBiYXNlZCBteSBjb21wcmVoZW5zaW9uIG9mIHRoaXMgb24Kd2hhdCB0aGUg
TGludXggZHJpdmVyIHdhcyBkb2luZy4gaWU6IGl0IHN0b3BzIHRoZSBjb3VudGVycyBhbmQgdGhl
bgpjbGVhcnMgTUlQIChjZiB0aGlzIGNvbW1lbnQgZnJvbSByaXNjdl9zYmlfcG11LmMpCgovKgog
KiBPdmVyZmxvdyBpbnRlcnJ1cHQgcGVuZGluZyBiaXQgc2hvdWxkIG9ubHkgYmUgY2xlYXJlZCBh
ZnRlciBzdG9wcGluZwogKiBhbGwgdGhlIGNvdW50ZXJzIHRvIGF2b2lkIGFueSByYWNlIGNvbmRp
dGlvbi4KICovCgpTbyBpbiBTU0UsIGFmdGVyIGRpc2N1c3Npbmcgd2l0aCBBdGlzaCwgd2UgZGVj
aWRlZCB0byBjbGVhciBNSVAuTENPRklQCmluIGN0cl9zdG9wKCkgKHdoaWNoIG1ha2VzIHNlbnNl
IHRvIG1lKS4gUmVnYXJkaW5nIHRoZSBNSVAuTENPRklQCmNsZWFyaW5nIGluIHNiaV9zc2VfZGlz
YWJsZSgpLCBJIGFjdHVhbGx5IGFkZGVkIGl0IHNvIHRoYXQgd2UgZG8gbm90IGVuZAp1cCB3aXRo
IGEgc3B1cmlvdXMgSVJRIGFzIHdlbGwgcmlnaHQgYWZ0ZXIgZGlzYWJsaW5nIGl0LiBUaGlua2lu
ZyBhYm91dAppdCwgZXZlbiBpZiB3ZSBoYXZlIGFuIGludGVycnVwdCBhZnRlciB0aGF0LCB0aGUg
c2JpX3BtdV9zdG9wKCkgY29kZSBpbgpMaW51eCBpcyBzdG9wcGluZyBhbGwgdGhlIGNvdW50ZXJz
IGJ5IGNhbGxpbmcgdGhlIFNCSSBzbyB0aGF0IHNob3VsZApjbGVhciBNSVAgYXMgd2VsbC4gQnV0
IEknbGwgdGFrZSBhIGJldHRlciBsb29rIGF0IGl0IGp1c3QgdG8gYmUgc3VyZSBJJ20Kbm90IG1p
c3NpbmcgYW55dGhpbmcuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPiBJZiBteSB1bmRlcnN0YW5k
aW5nIGlzIGNvcnJlY3QsIHRvIG1hdGNoIHRoZSBlZGdlIGludGVycnVwdCBzZW1hbnRpY3MgKGNs
ZWFyCj4gTENPRklQIGJlZm9yZSBoYW5kbGluZywgYXMgbm90ZWQgaW4gdGhlIHByaXZpbGVnZWQg
c3BlYyksIEkgdGhpbmsgdGhlIG9ubHkgcGxhY2UKPiB0aGF0IHNob3VsZCBjbGVhciBtaXAuTENP
RklQIGlzIHNiaV9wbXVfb3ZmX2lycSgpLCBub3Qgc2JpX3BtdV9jdHJfc3RvcCgpIG9yCj4gcG11
X3NzZV9kaXNhYmxlKCkuCj4gCj4gUmVnYXJkcywKPiBTYW11ZWwKPiAKPj4gTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNTA1MTYxNTIzNTUuNTYwNDQ4LTEtY2xl
Z2VyQHJpdm9zaW5jLmNvbS8gWzFdCj4+Cj4+IENsw6ltZW50IEzDqWdlciAoMik6Cj4+ICAgbGli
OiBzYmk6IHBtdTogQWRkIFNTRSByZWdpc3Rlci91bnJlZ2lzdGVyKCkgY2FsbGJhY2tzCj4+ICAg
bGliOiBzYmk6IHBtdTogUmVtb3ZlIE1JUCBjbGVhcmluZyBmcm9tIHBtdV9zc2VfZW5hYmxlKCkK
Pj4KPj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMjUgKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4g
CgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
