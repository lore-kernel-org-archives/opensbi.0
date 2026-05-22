Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C717BCD5BAF
	for <opensbi@archiver.kernel.org>; Fri, 22 May 2026 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8BPesZ4dxJ9uui6S8I96ZR2KdEK5phdXLFGHKzBR8w=; b=WdGEyymzpdaZX7
	vs0IEMDCt59+tSqbl/ThXrEJEm4Nr/Ct8agyWmJsbaVu8xBmSaSYISii0IJkkKDX2GeQ2XNscvGuK
	jXSxezsEOj3pGPamP/Uzqhwo2UznHRomMKfuYYOesAgyqrp9BDECNjZsA0MSFAN0vsRO+2l82kzV/
	/5lz44+aR2iZxB19JiHI4zwYj4ZUZow3/KpDB0x7rm1fBvo4w9+G7Pom0N5NPhiE9RPE97ljhP9ni
	oxnvGfrqzhbFSrdOtE2o6kMbU2k/tDT5VO/i5zK8p4VZD4tf6a7aMRJHZEqCrA35ZEDKt0IUOeJcV
	tmPwA9gS5I99k7FLrUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHyo-00000009o05-0yOX;
	Fri, 22 May 2026 04:59:26 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHyl-00000009nzV-31V0
	for opensbi@lists.infradead.org;
	Fri, 22 May 2026 04:59:25 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-69d7b0be378so412110eaf.0
        for <opensbi@lists.infradead.org>; Thu, 21 May 2026 21:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779425962; cv=none;
        d=google.com; s=arc-20240605;
        b=PdJgfLNOISDk4dlSTaf1uvs63KbX3r4+L/xhtJSFCBFcSvOE3ykoBzmQ4/kAht2LwV
         1xl2kTYwYCG5m1SyqmVUBVZIZMPHGK6aSfws0p5rQ/oOSFft8tca2fkkLr4VPZoNBmO+
         0Stcsf+ny9WzDYpUHPXE0rpSHwnK8mciXukfqt3ez1XU1ToO2kmnI2ce6DML6m1C6Ksw
         IAIyD68XWhlvz5iWAxgFHMT5M3i5nXBVdjK7O3+fEdgazi88R03dG8BoqiGhNyEfxZiI
         ZNGPlXBOLdWoP4oZIbNj3LSi/1ORh2fm09+nPJOP1HsXqDZPjKC22f66IXw8GsMt9oZ+
         T9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iNXPA+S59AFp7iSfIBxiDwy4lu+uWYqzBGGZNUNLaCc=;
        fh=0zT0KIhzoSwcNHB1qjkFnm3a0fIlWkoMaRsX5JMO/sA=;
        b=U6gQ4JLSQ3zHXCkPt1xXGdl8T/6Y1khPpk5xNWcit18IxvolPI/BQ4l4tyW5zH9uVd
         lhRBKINWBfdho1jqyb4NVv4eb41DhZBwnmnnYU9BSV/GoFDOpe5rYsejt4eq80FEDLIH
         LMrNDeeLjKHZC0lzCBuhOb0OGSMYPMnnl9XdsXbb7S7O1D4cbJYlyUJb6N96EZjrmaxn
         /jUdtPR18YnO6LoXAmafOVySwZZOoRQ55Y24S3Rp4UmVrPnC+lMOlqfrDOJOl9sTQvfo
         YNMQSmfrkO4E618l21/UPWdSKagsJB5nUherE/LskPKXhCsjvvGilJDbj5566cgWZ8a7
         /5OQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779425962; x=1780030762; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNXPA+S59AFp7iSfIBxiDwy4lu+uWYqzBGGZNUNLaCc=;
        b=YQNPQhaA/JDFsFEbvwTv+aR+eDRZAXRGzTA+RrfcisyAdQ/e+jlPus0NYyjFW/fKaA
         6oPj4LiirXSeexIVq/z+8rHKl6lntLZk1Kxj/s3VkXoQ2EHIivvE39ao2V4fjlwPVYmg
         GNOyfTizlOKzLb7/qo42WFEHcwptzIz7BV3D7KAk0jLwPEwtoZub9Uah8EMH+TYA2kaX
         +jIfRJhVAnzX7gcuil+ayYnFAi065O8xVKzHThAemFmVnizbGyS4/SQ2bMDDH/z7Llq6
         T2BoivYhbj7FUGy8EMrpJO4UH6dfC4yusrFHKgtBr6JCjdOi4RKm++cAdaqDDTGpNRXy
         8Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779425962; x=1780030762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNXPA+S59AFp7iSfIBxiDwy4lu+uWYqzBGGZNUNLaCc=;
        b=H8xgSNwtyDrK/yfMz6zjY4ty7FljvPkBG79xJO37M/oC7PXIsYrtd3Fk4+bcAIn/eZ
         EY9LkkoDlj8qwsZCecLVoSG/qzDx6CRbYYK8Q6f+nKX23+Tf5rJkD7ltlLVm5zdZb80W
         NfUE5WLJ9wKkFLs/3loz6xBZNuUiH09InEbCDT9RZsf/jlCFcpO5u/XHY0l60vFDXzql
         JXkJqAiy9PMAGPX/fNSkpwaaTCJ2qdQgv3ZlCv/3JWiLkhBecGODxmHBETyaPo+xZCqN
         TnTIwYSLZIHX7bEPsfcXoPI24CnX/mPwZC4JzazZsfGyDTBpdFAeEZfnqxKupN0P4ste
         fxmA==
X-Gm-Message-State: AOJu0YwisV29Kb/IHqWpPjwCXfX2FA08QJ2UzaIfTcgdwE+ajBgkPkAs
	1l3SBOsCR7rpBCsHFxrr9uHRZVYYC2Uzqm0lzRxW7jTaNHThkHODrvBKrHB8qWH9PaLFOnrDLkE
	X5vQhJxv5xJk0f36EuXRUM6UuAMmUWqmuloeq4C4+bg==
X-Gm-Gg: Acq92OHuupaZ5jq+onTNoT1cpATF3iKWY4H+/Am5mmU/y8WC5l6jP5r6XPoUnK6ii8I
	Sxzrtwg8zL4UkgzfyS4WZNxt3QGcxvx6km7DKxoCZziwQnDLdVX5NFg9uoj1ANlazEwXOv7M4Kj
	08L701XDYczoZ2g2pd1Lj+du2wTvMjEKLByJNHaN76iXKzJ32jr49lzVdkP4449YbOVhqrqxTOP
	EENYw+olIh/vsLmR1xJtOec68nrdRLc4+BsulEd9LIn12G+Z1bqEhHAl6Ru7AxNY/9/PTiotNiT
	KRi0RzwterOP9dABVBTSpKTlhO8sX2VOw7l6VtbBSqrK1cC6SPng0dK6hhqO4miP/poXJBQus/D
	1T0Bt5bv6wLbjjCZBE1i7V6cyzKagi8HwV9qIyQ==
X-Received: by 2002:a05:6820:1f04:b0:696:17a3:4673 with SMTP id
 006d021491bc7-69d7ece1281mr1147469eaf.50.1779425962282; Thu, 21 May 2026
 21:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260513224414.1078791-1-samuel.holland@sifive.com>
In-Reply-To: <20260513224414.1078791-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 May 2026 10:29:10 +0530
X-Gm-Features: AVHnY4I3gf13ZGdfi7Qm4M42NgxRRNRBd3lfSqysxyhWQV0BV8bur-Q9SR-bm3Y
Message-ID: <CAAhSdy3fLf5TcS22y3-ghFM=etW8oSjmEvWg7iT8kqBj-Mkfbg@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/reset: Remove unused match data
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_215924_016188_54FF35B5 
X-CRM114-Status: GOOD (  16.79  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgNDoxNOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFNvbWUgZHJpdmVycyBpbmhlcml0ZWQgRkRU
IG1hdGNoIGRhdGEgZnJvbSB0aGUgR1BJTy9zeXNjb24gcmVzZXQKPiBkcml2ZXJzLCBidXQgZG8g
bm90IHVzZSBpdCBmb3IgYW55dGhpbmcuIFJlbW92ZSBpdCB0byBhdm9pZCBjb25mdXNpb24uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNv
bT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
CkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApB
bnVwCgo+IC0tLQo+Cj4gIGxpYi91dGlscy9yZXNldC9mZHRfcmVzZXRfc2cyMDQyX2h3bW9uX21j
dS5jIHwgMiArLQo+ICBsaWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3NwYWNlbWl0X3AxLmMgICAg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9zZzIwNDJfaHdt
b25fbWN1LmMgYi9saWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3NnMjA0Ml9od21vbl9tY3UuYwo+
IGluZGV4IDk0YWM0MTYyLi5iYjE4MDI2OCAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvcmVzZXQv
ZmR0X3Jlc2V0X3NnMjA0Ml9od21vbl9tY3UuYwo+ICsrKyBiL2xpYi91dGlscy9yZXNldC9mZHRf
cmVzZXRfc2cyMDQyX2h3bW9uX21jdS5jCj4gQEAgLTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgaW50
IHNnMjA0Ml9tY3VfcmVzZXRfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+ICB9
Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggc2cyMDQyX21jdV9yZXNldF9tYXRj
aFtdID0gewo+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLWh3bW9uLW1j
dSIsIC5kYXRhID0gKHZvaWQgKil0cnVlfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAic29w
aGdvLHNnMjA0Mi1od21vbi1tY3UiIH0sCj4gICAgICAgICB7IH0sCj4gIH07Cj4KPiBkaWZmIC0t
Z2l0IGEvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9zcGFjZW1pdF9wMS5jIGIvbGliL3V0aWxz
L3Jlc2V0L2ZkdF9yZXNldF9zcGFjZW1pdF9wMS5jCj4gaW5kZXggNTMxMmU3NDEuLmQxNTNmNjhi
IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9yZXNldC9mZHRfcmVzZXRfc3BhY2VtaXRfcDEuYwo+
ICsrKyBiL2xpYi91dGlscy9yZXNldC9mZHRfcmVzZXRfc3BhY2VtaXRfcDEuYwo+IEBAIC0xMDIs
NyArMTAyLDcgQEAgc3RhdGljIGludCBwMV9yZXNldF9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50
IG5vZGVvZmYsCj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBwMV9yZXNl
dF9tYXRjaFtdID0gewo+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxwMSIsIC5k
YXRhID0gKHZvaWQgKil0cnVlIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInNwYWNlbWl0
LHAxIiB9LAo+ICAgICAgICAgeyB9LAo+ICB9Owo+Cj4gLS0KPiAyLjUyLjAKPgo+IGJhc2UtY29t
bWl0OiA3OWU2M2JjODM0OGRmMTI4MzViNWMyNjQxNDRlNTBkNDVhYmU3MmM4Cj4gYnJhbmNoOiB1
cC9jbGVhbnVwLXJlc2V0Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
