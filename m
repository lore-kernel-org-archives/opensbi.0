Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E01CD8CB2
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 23:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnP0Pg0jgz60trZUWfTXuL7NCkgf5iGnpwNDFJo9o4w=; b=HNb+Vx3Cm8sk0O
	GawBGh/WUlt9YpdNa0HoUmRGhxq99iTp7QYFTM740eK9+xCsIZbZwBu28tlPbMzQbfRQY4WhoEWti
	jOhv3jIQ21JF68NtE36ul+zIAviTKFAiIXdyS/dB86cargh37pgKm9p/vtTFYlfTO2/HfphujzKU8
	mPifdHFkgN0nLZ+u2HmcAsOkQU3EhPx9BB0NmQ2CRKLGt40S6kC554LdGK6ZtTAt23Ql0daSGaY/l
	v+Kbz8KM1peDsO3947+PDgUYzBJ/jC0sVDWkkhZYEk+TrrG4Hyu35i2aeBZcmr3T+3u3zW/d7+C4i
	1IsoClfUEm90qLsnPd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6Bu-00000006WUg-421h;
	Tue, 09 Jun 2026 23:49:06 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX6Bs-00000006WUK-1oeh
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 23:49:05 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-9157ec935c5so932721385a.2
        for <opensbi@lists.infradead.org>; Tue, 09 Jun 2026 16:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781048942; x=1781653742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lzm7VXoIRdEsP8ZXbrwsJr+NX7Ry+i8DbI6gt3bR1c=;
        b=alRfkLhT9AB081GjPI46WDq8AW2Si8AA3e6TK+36sHK4pC7FWLdEkZTIjYcPStGKkm
         FEvvRfxgxfQpi1xBE/iV71CDHrt5A9YJPT+Ba2dGT94FbGkXLeFl3elXJ/63DMOL8Qrv
         MU1m4Ng/MefY9dquwpZ/yGQQFRb3k4ge0bxrx39+nMK2OI4XCy8bolDd/2Ox39+gs3L2
         GL7hxH60YNIK9m+c1JilsaYKLHbofGSh6YHMMaQtsgGnDjIQR8ig0Ux/2INGaZLkDfPM
         l5t0w6vpY7xEBf/fdQm0rwq+j4JrtkyEq0s65QNvUshILo2eRX8KAwkOjTnJlZm7ldgR
         DuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781048942; x=1781653742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lzm7VXoIRdEsP8ZXbrwsJr+NX7Ry+i8DbI6gt3bR1c=;
        b=bTAqtOhq1ZhJ20i8rF2R530GoWrIEg2+OX1zYFbr6MoVnC4TtFvGciRjhQq363Tdj7
         ZRTFe1aqxc7+TD5IsG32Ki404pFKP3/NXPAnnegO8o0DwWaz7yRc/3zq5bX8CZYJa5m8
         ut/vtXzKyUfJ3aay9ogdyPxaSpQhFhQ+Kw27Zde3NCxdZ3YBkmX05zfwi2tDqqi1yeKL
         khnv3fnDQ3fAgAR9YjXtG2dRNnF8xYj0eUtVGa5iPUePAf/9SEJRc2b8xIPpmV7H2oUC
         vGrppduJsUUQBMtOC9gEpnOHx5zbzGChBzZ5n9hHzpw0mYVxE1OVd6b35zCwUCHmhHLH
         4BoQ==
X-Gm-Message-State: AOJu0YxiOKnKVmgydwqgbYSK5ew7/7L16pJM9/BtMQB1EuHaulWhi1Td
	/5LwdVj0dKlWpTJh8Z1LWTmqQlvQGHh2zJZmyRJYtMfNM1ZX9B2p+rMC
X-Gm-Gg: Acq92OEhkJH00dq+cfTsy4uEnTPll4CNxKnI7z9PCwQVbL9SmQ+WiEcUX5lq/dcVBLc
	zD+crOjmpN9JDbg+4wTH473TfXFtlMzyh8EAGpc9mqhEAal68p8anu20NOCujeG1Pkas0OOJJdn
	JBAjpH4K/0+ZPB6gYDdiCNjtWOgSSlm63WhVar/xA6D24f6AE6YEwheqUXFlwaLliSzYV4UNwCH
	IbDFL5F5rhAu5ReZQzQtoGVpGHRAcuQk1dSaMHP3Ph7c5RF5YUg0+IqxwEcNXQ7tsw/EhmHjI7+
	mKYbYlpRRkgn2GP0vbL8RyZ1RHekzLDAh7qI1E0UwUtsHq5sZFhGuVWXkz7Q7kWqS4YgxNhj2dT
	/A04cgAsaw9M3FUz8Kcf6M91wQnpiG4PBUE+PrsIeNO73AZc2tzn7qMGTH5I6nfPH0JQYh6yxDk
	GwNRAejM8W707bYCOdPl6MupQjUmzmbMSl14IdrNLQGK6k9cfGKaw86Gl+6Q==
X-Received: by 2002:a05:620a:3723:b0:915:c7ad:8bd2 with SMTP id af79cd13be357-915c7ad8e62mr2204359185a.30.1781048942458;
        Tue, 09 Jun 2026 16:49:02 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a381abfsm2303155085a.27.2026.06.09.16.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 16:49:01 -0700 (PDT)
Message-ID: <59dd9988-9015-4f57-bfe6-5d8ac03127ee@gmail.com>
Date: Tue, 9 Jun 2026 16:54:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Fixes for vector misaligned load/store handlers
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, wangruikang@iscas.ac.cn,
 dramforever@live.com, andrew.jones@oss.qualcomm.com, cleger@rivosinc.com,
 pjw@kernel.org
References: <20260609060024.706-1-ganboing@gmail.com>
 <CAEev2e-Gh5mtOPrcny8ZUHrLRg4160B5JPjDaMyrL_HWimEN7w@mail.gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <CAEev2e-Gh5mtOPrcny8ZUHrLRg4160B5JPjDaMyrL_HWimEN7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_164904_490221_D8288294 
X-CRM114-Status: GOOD (  27.27  )
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

SGkgQW5pcnVkaCwKCk9uIDYvOS8yNiAxNTowMiwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+
IEhpIEJvLAo+IAo+IE9uIFR1ZSwgSnVuIDksIDIwMjYgYXQgMTowMuKAr0FNIEJvIEdhbiA8Z2Fu
Ym9pbmdAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gUmUtdmlzaXQgdGhlIHZlY3RvciBtaXNhbGln
bmVkIGxvYWQvc3RvcmUgaGFuZGxlcnMgYW5kIGZpeDoKPj4KPj4gYS4gQXZvaWQgc3RhY2sgb3Zl
cmZsb3cgYnkgdXNpbmcgYSBzbWFsbCBzbGlkaW5nIG1hc2tbXSBidWZmZXIsCj4+ICAgICB0aHVz
IG9wdGltaXplcyBzdGFjayB1c2FnZSAqSU1QT1JUQU5UKiAoY29ycmVjdG5lc3MpLiBUaGVyZSdz
IG5vLQo+PiAgICAgbG9uZ2VyIGEgbmVlZCB0byBoYXZlIGEgcHJlLWRlZmluZWQgdmxlbiBtYXhp
bXVtLCBhbmQgd29ycnkgYWJvdXQKPj4gICAgIHdoZXRoZXIgdGhlIHN0YWNrIGNhbiBob2xkIHRo
ZSBtYXNrW10gdmFyaWFibGUuCj4+Cj4+IGIuIE1haW50YWluIHRoZSB2YWx1ZSBvZiB2c3RhcnQg
d2hlbiByZWRpcmVjdGluZyB1cHRyYXAuIChvcHRtaXphdGlvbikKPj4gICAgIEF2b2lkcyBkb2lu
ZyBkdXBsaWNhdGUgd29yayB3aGVuIHRoZSBpbnN0cnVjdGlvbiBnZXRzIHJlc3RhcnRlZC4KPj4K
Pj4gYy4gRXhwbGljaXRseSBzZXQgVlMgZGlydHkgaW4gKFYpU1NUQVRVUy4gKGNvcnJlY3RuZXNz
KSwgVlMgaW4KPj4gICAgIFZTU1RBVFVTIG11c3QgYmUgc2V0IGRpcnR5IGlmIGNvbWluZyBmcm9t
IFY9MS4KPj4KPj4gZC4gWmVybyBvdXQgdGluc3QgaW4gdXB0cmFwIGlmIG5vdCBndWVzdC1wYWdl
IGZhdWx0IChjb3JyZWN0bmVzcykuCj4+Cj4+IFRoaXMgaXMgYSBmb2xsb3cgdXAgcGF0Y2ggdG8g
WzFdIGFuZCBzaG91bGQgYmUgYXBwbGllZCBvbiB0b3AuCj4+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vcGVuc2JpL0NBRWV2MmVfVmcxbU1QNG1PS2FuRlhfRUdlVXpwY3pSY1dXKyt2QkJ1
TjFDZnlNMEJKd0BtYWlsLmdtYWlsLmNvbS9ULyN0Cj4+IC0tLQo+PiB2MjogRml4IHRoZSB3cm9u
ZyBQQVRDSCA0LzQgZ2VuZXJhdGVkIGluIHYxLgo+IAo+IFRlc3Rpbmcgb24gVGVuc3RvcnJlbnQg
QmxhY2tob2xlIHdpdGggU2lmaXZlIFgyODAgY29yZXMuCj4gCj4gQWZ0ZXIgYWRkaW5nIHNvbWUg
bG9nZ2luZyBsaWtlIHRoaXMsIEknbSBzdGlsbCBhYmxlIHRvIGJyZWFrIHRoZSBib290Cj4gKGxp
a2UgSSdkIHJlcG9ydGVkIG9uIHlvdXIgcHJldmlvdXMgcGF0Y2gpLiBGdWxsIGxvZ3MgaGVyZQo+
IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2FzcmluaXZhc2FuVFQvMTIwNjQ2Y2JiNzE5NGU3YjM1
MDU0MjhlYmVmYmRiMzAKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfdHJhcF92X2xkc3Qu
YyBiL2xpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMKPiBpbmRleCAwZjI5ZGNmOS4uMGY3M2MzMzkg
MTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfdHJhcF92X2xkc3QuYwo+ICsrKyBiL2xpYi9zYmkv
c2JpX3RyYXBfdl9sZHN0LmMKPiBAQCAtMTcsNiArMTcsNyBAQAo+ICAgI2luY2x1ZGUgPHNiaS9z
YmlfdHJhcC5oPgo+ICAgI2luY2x1ZGUgPHNiaS9zYmlfdW5wcml2Lmg+Cj4gICAjaW5jbHVkZSA8
c2JpL3NiaV92ZWN0b3IuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+IAo+ICAg
I2lmZGVmIE9QRU5TQklfQ0NfU1VQUE9SVF9WRUNUT1IKPiAKPiBAQCAtMTYzLDYgKzE2NCw4IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZAo+IHNiaV9taXNhbGlnbmVkX3ZfdGluc3RfZml4dXAoc3RydWN0
IHNiaV90cmFwX2luZm8gKnVwdHJhcCkKPiAKPiAgIGludCBzYmlfbWlzYWxpZ25lZF92X2xkX2Vt
dWxhdG9yKHVsb25nIGluc24sIHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCkKPiAgIHsK
PiArICAgICAgIHNiaV9wcmludGYoIiVzOiBpbnNuPTB4JWx4IG1lcGM9MHglbHggbXR2YWw9MHgl
bHhcbiIsCj4gKyAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBpbnNuLCB0Y250eC0+cmVncy5t
ZXBjLCB0Y250eC0+dHJhcC50dmFsKTsKPiAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfcmVncyAq
cmVncyA9ICZ0Y250eC0+cmVnczsKPiAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfaW5mbyB1cHRy
YXA7Cj4gICAgICAgICAgdWxvbmcgdmwgPSBjc3JfcmVhZChDU1JfVkwpOwo+IEBAIC0yNzYsNiAr
Mjc5LDggQEAgZG9uZToKPiAKPiAgIGludCBzYmlfbWlzYWxpZ25lZF92X3N0X2VtdWxhdG9yKHVs
b25nIGluc24sIHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCkKPiAgIHsKPiArICAgICAg
IHNiaV9wcmludGYoIiVzOiBpbnNuPTB4JWx4IG1lcGM9MHglbHggbXR2YWw9MHglbHhcbiIsCj4g
KyAgICAgICAgICAgICAgIF9fZnVuY19fLCBpbnNuLCB0Y250eC0+cmVncy5tZXBjLCB0Y250eC0+
dHJhcC50dmFsKTsKPiAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncyA9ICZ0Y250
eC0+cmVnczsKPiAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfaW5mbyB1cHRyYXA7Cj4gICAgICAg
ICAgdWxvbmcgdmwgPSBjc3JfcmVhZChDU1JfVkwpOwo+IAo+IElzIHRoaXMgZXhwZWN0ZWQ/IEFy
ZSB0aGUgbG9nZ2luZyBwcmludHMgY2F1c2luZyB0aGUgb3ZlcmZsb3c/Cj4gCj4gSWYgSSBkb24n
dCBoYXZlIHRoaXMgbG9nZ2luZyBwcmludHMgYWRkZWQsIEknbSBhYmxlIHRvIGJvb3QgZmluZSBp
bnRvCj4gbGludXguIEkgd2FzIGFibGUgdG8gZG8gdGhpcyB3aXRoIHlvdXIgbGFzdCBwYXRjaCwg
c28gdGhpcyBwYXRjaAo+IGRvZXNuJ3QgY2hhbmdlIG11Y2ggaW4gdGhhdCBhc3BlY3QuCj4gCgpB
cyBkaXNjdXNzZWQgaW4gdGhlIElSQyBETSwgaXQncyBtb3N0IGxpa2VseSBhIExpbnV4IHJhY2Ug
Y29uZGl0aW9uIGJ1Zy4KQWRkaW5nIHRoZSBwcmludHMgZGVsYXlzIHRoZSBwcm9iZSBmdW5jdGlv
biBzaWduaWZpY2FudGx5LCBhbmQgdGhlIHBhZ2UKY29udGFpbmluZyB0aGUgZnVuY3Rpb24sIG1h
cmtlZCBhcyBfX2luaXQsIGNhbiBiZSBjb25jdXJyZW50bHkgdW5tYXBwZWQKYW5kIGZyZWUnZCwg
dGh1cyB0cmlnZ2VyaW5nIGluc3RydWN0aW9uIHBhZ2UgZmF1bHQsIGNhdXNlPTB4Yy4gQ2FuIHlv
dQpjb25maXJtIHRoYXQgcmVtb3ZpbmcgX19pbml0IChhcyBhIGhhY2spIGZpeGVzIHRoZSBwcm9i
bGVtPyBMb29rcyBsaWtlCnlvdSd2ZSB0cmllZCBpdCBhbHJlYWR5IGFuZCB0aGUgaXNzdWUgc2Vl
bXMgdG8gYmUgZ29uZS4gQ2FuIHlvdSBjb25maXJtPwoKSXQgZGVmaW5pdGVseSB3YXJyYW50cyBh
IHByb3BlciBmaXggdG8gdXBzdHJlYW0gbGludXguIEl0IGNhbid0IHJlbHkgb24KdGltaW5nIHRv
IGF2b2lkIGEgY3Jhc2ggbGlrZSB0aGlzLgoKPj4KPj4gLS0tCj4+IEJvIEdhbiAoNCk6Cj4+ICAg
IGxpYjogc2JpOiBjb3NtZXRpYyBjaGFuZ2VzIHRvIHJlZHVjZSBpbmRlbnRhdGlvbgo+PiAgICBs
aWI6IHNiaTogUmV3b3JrIGFuZCBzcGxpdCBzYmlfbWlzYWxpZ25lZChfdilfdGluc3RfZml4dXAK
Pj4gICAgbGliOiBzYmk6IEFkZCB2YXJpYWJsZS1sZW5ndGggdW5wcml2aWxlZ2UgYWNjZXNzIGZ1
bmN0aW9ucwo+PiAgICBsaWI6IHNiaTogUmV3b3JrIG1pc2FsaWduZWQgdmVjdG9yIGxvYWQvc3Rv
cmUKPj4KPj4gICBpbmNsdWRlL3NiaS9zYmlfdHJhcF9sZHN0LmggfCAgIDMgLQo+PiAgIGluY2x1
ZGUvc2JpL3NiaV91bnByaXYuaCAgICB8ICAxNiArKysKPj4gICBpbmNsdWRlL3NiaS9zYmlfdmVj
dG9yLmggICAgfCAgIDYgKysKPj4gICBsaWIvc2JpL3NiaV90cmFwX2xkc3QuYyAgICAgfCAgNjYg
KysrKysrKy0tLS0tCj4+ICAgbGliL3NiaS9zYmlfdHJhcF92X2xkc3QuYyAgIHwgMjAxICsrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+PiAgIGxpYi9zYmkvc2JpX3VucHJpdi5j
ICAgICAgICB8ICA4OCArKysrKysrKysrKysrKy0tCj4+ICAgNiBmaWxlcyBjaGFuZ2VkLCAyNzAg
aW5zZXJ0aW9ucygrKSwgMTEwIGRlbGV0aW9ucygtKQo+Pgo+PiAtLQo+PiAyLjM0LjEKPj4KCkJv
CgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
