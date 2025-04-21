Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81614C369AB
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 04:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9sFVGV2S7hVAR2xBWDbODC0CdPy5CHaZmpIep2KohA=; b=LgXEV9Xanmi/xS
	+fDN9R5AFnanDwhlwIRlvqtLI0//wFz7Yobkwo2RY++dQLw11iRr5vh4epXuC18ztf4Pmq9mUEDHO
	QgCouCTtZ9JvAM2V4EHw5+QnO54g+bAvNmh87gq2kx7IGi0nd6HN3tJLjkSqKrIs7ut9cFfHUS3iP
	Prun/XYdFqoHD/kFsFhinD7z+SG9QLECfiSbRVv4v1sxVS9/5porDMUkv96rYjiMykzNbCaVjQ590
	7xqKEvwImXvFmtp+A6sRp8VaLlzO7Pw6k69ueW6xerRbtk3nLVyFWbLqrAwLQ0zJwLJDjbxzizqp1
	vSPIPojO8Y6mSx/ESHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ihS-00000003Z7Z-0EeU;
	Mon, 21 Apr 2025 04:24:06 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ihP-00000003Z70-1Pa3
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 04:24:04 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-85dac9729c3so287414839f.2
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 21:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745209442; x=1745814242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op61tVe0npFwU4ZLZs6M0QDUFIzjwo2EhO8h44tYVtI=;
        b=UOzgq1naH8qz4db/UydmEgi0359QakGzDo3cf2vAddVM8kFQXXxFJNcL04HIAPZc/Q
         rB7IDlSoh7clEu8SzgRS9aBa1x3I2NCK1urVy8nCgqxSYElUeCSksxYzWLD1YQtuGxUT
         D+CSIYinuxVaVuAZtDMeXPG/ZRZVFCVaMd1SkWRlqAOvamMclWqcYz/EQEZXS8pHyPTy
         hYO7FxpFEQei1VBt3Nbp+/eCGNWLK83veKa4mQNhuU+vCgz7/mtjVf3PbLv3d3DNIgyn
         3sL/JGQA1f7FHxIjxBWjgJA8I772gYTesSv9Nhr7vJQmf8DceFSKn/MxjP1UDGWWqe6d
         tF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745209442; x=1745814242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op61tVe0npFwU4ZLZs6M0QDUFIzjwo2EhO8h44tYVtI=;
        b=Q1XPwxtw7ByPUxD/Uyw10putyB+xhPRzrDKTNybLQpcBYlqqagXTEdQMAespHqny/S
         yU2CC7b+xqOxEJE3x11D3xtKtoGfLLoJAMGgAo4C44AGTh4GHq4l4fffkfnQSZUSHMEh
         yyVTGipn+o7QJAzztzLbpmBuldSVxR/RC+O60Q5dp4t3Kl1rHniN4MZlubDhCNMzR1Gh
         XKObm45H/e5Qmjso7bEJwbbBb/CwBzvxjiPI39uVUEvjjtw2lSf/qPZgE1m0jQuvrG+U
         MuqrncLO1DKjoaYj2tZQ8oIDijM2QJVlrE+/e0njNlsUtA2pQQYjvw/JtBrbd+a8X3yr
         ppAw==
X-Gm-Message-State: AOJu0YybYqAUn3YiaE7B8QoBgU5ixxxWZfj9QYfgrMpEdgIQy4Yn2Xrs
	lqiaFREXDSoXtMETW3Uc58N2ZSV8I4jkka+v7dnr0EJSmlLy438LdwbsqxaD2LqTFZBinRwvqt8
	nifbpXSrzt++92zc9rvCsBA3C4smTlu/EOSqwPtIWayGjWEKV
X-Gm-Gg: ASbGncsYyCDgO00nfenOUhyQpnSLBQCxR8PL5ClpXENtC0Wna8ZfTGs+ME6ijFY23wb
	9asE3SxEp4xu0vyMbDFoSKPrfsTFuJIy0rx6sv1PRSs9zaNtcDp+EKLkq2mkQ3G8SoRGihKPbbC
	xgyFThdXGj8s5Uda37ohaHIqpeY5RNK6hI/Q==
X-Google-Smtp-Source: AGHT+IF6jmGnQk4SyBh7BdplmaTuAbU+bK52YVAIZikZ2IIOZcCpw7Db5styRjVNf4XFXHKfg7msdI/8M9k9n3jII9s=
X-Received: by 2002:a05:6e02:1687:b0:3d3:e296:1c1c with SMTP id
 e9e14a558f8ab-3d88ed95b81mr76712185ab.9.1745209442268; Sun, 20 Apr 2025
 21:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250324154858.4147529-1-samuel.holland@sifive.com> <20250324154858.4147529-2-samuel.holland@sifive.com>
In-Reply-To: <20250324154858.4147529-2-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Apr 2025 09:53:49 +0530
X-Gm-Features: ATxdqUGkOG_Eqw5Tu3jr_9Z48lshkS7-AYfgzyE0nUHrMMd7rV98hb809Dum5bg
Message-ID: <CAAhSdy19WpVHsPNQDAx2zuJp5a-WvvZyOKH=fR3CpgeWEYkP7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] lib utils/fdt: Drop fdt_parse_max_enabled_hart_id()
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_212403_377063_B04A7204 
X-CRM114-Status: GOOD (  14.83  )
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

T24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgOToyMOKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgZnVuY3Rpb24gaXMgbm90IHVzZWQg
YW55d2hlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxh
bmRAc2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2luY2Ug
djEpCj4KPiAgaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaCB8ICAyIC0tCj4gIGxp
Yi91dGlscy9mZHQvZmR0X2hlbHBlci5jICAgICAgICAgfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oIGIvaW5jbHVkZS9zYmlf
dXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+IGluZGV4IGZmODMwMDI1Li5mOTRlNTM1ZiAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gKysrIGIvaW5jbHVk
ZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+IEBAIC01MSw4ICs1MSw2IEBAIGJvb2wgZmR0
X25vZGVfaXNfZW5hYmxlZChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmKTsKPgo+ICBpbnQg
ZmR0X3BhcnNlX2hhcnRfaWQoY29uc3Qgdm9pZCAqZmR0LCBpbnQgY3B1X29mZnNldCwgdTMyICpo
YXJ0aWQpOwo+Cj4gLWludCBmZHRfcGFyc2VfbWF4X2VuYWJsZWRfaGFydF9pZChjb25zdCB2b2lk
ICpmZHQsIHUzMiAqbWF4X2hhcnRpZCk7Cj4gLQo+ICBpbnQgZmR0X3BhcnNlX3RpbWViYXNlX2Zy
ZXF1ZW5jeShjb25zdCB2b2lkICpmZHQsIHVuc2lnbmVkIGxvbmcgKmZyZXEpOwo+Cj4gIGludCBm
ZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnMoY29uc3Qgdm9pZCAqZmR0LCB1bnNpZ25lZCBpbnQgaGFy
dGlkLAo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyBiL2xpYi91dGls
cy9mZHQvZmR0X2hlbHBlci5jCj4gaW5kZXggYmMzNTdiMmYuLjIzMmExNDU5IDEwMDY0NAo+IC0t
LSBhL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gKysrIGIvbGliL3V0aWxzL2ZkdC9mZHRf
aGVscGVyLmMKPiBAQCAtMjY1LDM3ICsyNjUsNiBAQCBpbnQgZmR0X3BhcnNlX2hhcnRfaWQoY29u
c3Qgdm9pZCAqZmR0LCBpbnQgY3B1X29mZnNldCwgdTMyICpoYXJ0aWQpCj4gICAgICAgICByZXR1
cm4gMDsKPiAgfQo+Cj4gLWludCBmZHRfcGFyc2VfbWF4X2VuYWJsZWRfaGFydF9pZChjb25zdCB2
b2lkICpmZHQsIHUzMiAqbWF4X2hhcnRpZCkKPiAtewo+IC0gICAgICAgdTMyIGhhcnRpZDsKPiAt
ICAgICAgIGludCBlcnIsIGNwdV9vZmZzZXQsIGNwdXNfb2Zmc2V0Owo+IC0KPiAtICAgICAgIGlm
ICghZmR0KQo+IC0gICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiAtICAgICAgIGlm
ICghbWF4X2hhcnRpZCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gLQo+IC0gICAgICAg
Km1heF9oYXJ0aWQgPSAwOwo+IC0KPiAtICAgICAgIGNwdXNfb2Zmc2V0ID0gZmR0X3BhdGhfb2Zm
c2V0KGZkdCwgIi9jcHVzIik7Cj4gLSAgICAgICBpZiAoY3B1c19vZmZzZXQgPCAwKQo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gY3B1c19vZmZzZXQ7Cj4gLQo+IC0gICAgICAgZmR0X2Zvcl9lYWNo
X3N1Ym5vZGUoY3B1X29mZnNldCwgZmR0LCBjcHVzX29mZnNldCkgewo+IC0gICAgICAgICAgICAg
ICBlcnIgPSBmZHRfcGFyc2VfaGFydF9pZChmZHQsIGNwdV9vZmZzZXQsICZoYXJ0aWQpOwo+IC0g
ICAgICAgICAgICAgICBpZiAoZXJyKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+IC0KPiAtICAgICAgICAgICAgICAgaWYgKCFmZHRfbm9kZV9pc19lbmFibGVkKGZkdCwgY3B1
X29mZnNldCkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLQo+IC0gICAg
ICAgICAgICAgICBpZiAoaGFydGlkID4gKm1heF9oYXJ0aWQpCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgKm1heF9oYXJ0aWQgPSBoYXJ0aWQ7Cj4gLSAgICAgICB9Cj4gLQo+IC0gICAgICAgcmV0
dXJuIDA7Cj4gLX0KPiAtCj4gIGludCBmZHRfcGFyc2VfdGltZWJhc2VfZnJlcXVlbmN5KGNvbnN0
IHZvaWQgKmZkdCwgdW5zaWduZWQgbG9uZyAqZnJlcSkKPiAgewo+ICAgICAgICAgY29uc3QgZmR0
MzJfdCAqdmFsOwo+IC0tCj4gMi40Ny4yCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
PiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
