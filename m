Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9734AC44529
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 06:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7CCXqXVZhhx7Y+gJ1eTVAokK0pU9T3PviFyMxiNHY0=; b=Q4OM18N6X4jh22
	HtfmPL7SCaMXuszw5b7fJDAcdtMCnQrgvwI6B8RZgOGMQqwepOx5+Kpe6aIXbw1BaqFCD3fijYyqT
	DvmVLIrv2YEoQ5NWsRpNS1oHAbNgOJV745OTaNU0N9qKNDJpvsp1175RCaVc0tcnccSf5WDAnMjed
	YIDl5vw5gyz0ExW8poZG7l9kGdD09H6y93Xy+7oa2rLv/9nnLxAAqzXNUp/sDB1q23aWOylESdzPo
	rTyRAnBz7u0blQkGk7iPC1AjhHB9rtvBTUwlT/ED7aelNSrY2CtA4f6NU21WLz77vvxxRniXxWHBE
	BqqQh9eRRyl7poDTdWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm45R-00000008XKh-0Uxi;
	Tue, 21 Jul 2026 06:36:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm45O-00000008XJj-1ESc
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 06:36:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49558ce01afso18176735e9.1
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 23:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784615772; cv=none;
        d=google.com; s=arc-20260327;
        b=hq6lx1QkUzU8EwsKtS+bWHHKpwmlgL0n30oPxt8W6ye7kzhZ5fom1ZHJPyMvLFiNpI
         fo8NPS1G6Q6LKUm2zV7j+FblAVOBUKCKcgC2oXx02A/3FsUZVMJ35juodhFSUqAQFSj6
         mRd+EAWIaY2HsiyTkZjKv9C4vLOblIN88/X9DyjFG77K9MA3lfKSPH0q2ryoUZwA2Xsg
         CH5ebbHgOepdBzxyO5sb7yX27tbYH+bmzJoGcnuwjIq3/St5lVYXZPSBnV47ZUBtli4n
         sQ8CALS71KbYLxhOtBWnOj55k80iLGlS5aOynlfPPv9WRxhPb4C+PG8SxBDakYvDQkqS
         0EsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=If3KkV+oec3yUFY035LqDwXmKYKluv43MAU4onJlToQ=;
        fh=jWeQFgZbJzm9NRKOF0cWNwnzmPQGGXcmIgfuxR5zo90=;
        b=iABhz5aqJ+8MlyYEQPQ0pm3ceanuU9SvlikhWHyJOOHwcv0DZMbvgqjvkAkGliL2Ba
         hNQG/bz20s50B0Bsl7P31EMfj6F/23c5oPgCbhteMDqKj/7BvkrVw7jUSuvoRk0hH2b8
         Db2UWXFWX7qPfdpqfcZ8whtkxq7B+gWcm/8IBdsu6Md4H7WXGoN+RXrxYEfUEpvP9FZj
         M0q48JXswkPLZIEXe+y1owN4OtNquHbpoAf5npVVQ922UTL2BtuVTyLNep1Mqrv1EuXH
         9u0swLQeiC/EdXUFUK7VeKxCKigwUOASPQct4SkkO7YiSye8ucgst87UjynuP+c950br
         tLVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784615772; x=1785220572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=If3KkV+oec3yUFY035LqDwXmKYKluv43MAU4onJlToQ=;
        b=NvQ0MmFfS7P2Xbx6VQv7w4JEgbdVidFKrWHEQAZ3b4cR5/hii1OKhf0EBVnaiVH+ZZ
         0JXtpYYSVbQB2Hcw6sNQs05zWWk1E3GWj7hoVmuEt7pM8H5Kj9Oqd1NMq+ARJdF2WT8T
         HmBn0wzWszRU0ji6ngU9dnF1MBr7tC7xTAEKETwFfTX0jZCRwZ4Spkhf/dzCKn/lZ/2j
         tF9UkJu2Q1u+7fD6hH7CqUvAIdWnRVXyKaGgp2/oi5tnSA4C8pbGB4gri9i9g0q6rgK/
         cOixlWFCyMktJlVubaGkTO9zH8MJfy8HbcaAEIOzlI7fpHKm7+LypuCTI2FvIdLJ0bxh
         uMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615772; x=1785220572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=If3KkV+oec3yUFY035LqDwXmKYKluv43MAU4onJlToQ=;
        b=oNu44ACxJH0cff1jvdqOCotUaQtpTUKFkwJhSGL2PM2egJsAoiqmGlkeOFpsHW1Gzq
         KzsYNLVuI7kzDIVDhf3Y2BbMQzX+USBozZVKxqa/5b8i9vkRYEWCtJKqXTwsuHm1oTIM
         1qtOF9xBZYfVFVszCHgBxqH8Li1vvWCiRsqTxeebkJNJayAwOHekkE9zBhN/cC/Rs70o
         P9C1aWRExVr3kqIu45EcVzXMgyYeFYGmgVrh4JHi1xk09hELnSUEwdA8u5+gMnQMDdQX
         LAXqT+g/PybdueQNWpJ1H4RwplftXI8JswZY/CEfklbxK8w73bTzn/Mnyu5S7EVS1tBe
         4/KA==
X-Forwarded-Encrypted: i=1; AHgh+RooDesoQGyYm2Uo85c6QTtYdVxMiFg/O90AfPwoyuyMlSXKb4ZEBVUciDpZmcyIGXZaaTz69ubb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8cUG+EidRjTnqjEk5e3zup8ffjLI6PpZZ9PX3eBJ+ZMmPFRRz
	/IZwMEUsvFfWL3oy+hH+tciV/w+12dM3o4Npm6h2foT4EMIQNMFQcXs0adqeamP9G8V0laqXilg
	WEeTZctwv3VM9brm1tutoSQbsmNelNqcaipnuIR6PfA==
X-Gm-Gg: AfdE7ckb4skDRDQm+3nxHRZomRoKDAeLCvZDVg9DZoQdoAuY/ttvpbh8nI5a9I//E5L
	oxm3tJPrsmTH64zWWGwm+BdC9gMir7xlafQ6A4CXxl3iVp7sbzyLzIJq/Eo7HfmP5Ho4bqAhOjm
	PeJ9UBQ6Ofh6sJLRrOTGVyDdMuvlVSBQRJ7qb0ZBfCT19FkeVpUkzW+fapp5UPKdc0k6ca9zvM+
	k1MG+QhMY9D4TWt1F2EmCpvghCCKBYhrA+pkPobT771sf2QII9oTIr6vzas5RC9EioYwOhVdCa4
	QxDS3NnVCN+AJ5uOuuUWPw9lSID+IeEQ/DFHnG4iI3D2IMCDfwjoIJLqYDWdtkVg5raB7SEV/88
	a8ciRyA==
X-Received: by 2002:a05:600c:c04c:b0:495:63e4:3a91 with SMTP id
 5b1f17b1804b1-49563e43af2mr39795095e9.35.1784615772127; Mon, 20 Jul 2026
 23:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260613132129.2135128-1-anup.patel@oss.qualcomm.com> <20260613132129.2135128-2-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260613132129.2135128-2-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jul 2026 12:06:00 +0530
X-Gm-Features: AUfX_mxEalY1-pIZ816wK5tR7ksttk_dWb5Onlg0594hKk4RtUMolFBLhcyWpmY
Message-ID: <CAAhSdy2R1qDJd7uN8CuL3fBq2RDE_36UQAq31HpBmgnRq3HyLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib: sbi: Move trap delegation setup to sbi_trap.c
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Bo Gan <ganboing@gmail.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_233614_645481_D52F9F52 
X-CRM114-Status: GOOD (  22.29  )
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

T24gU2F0LCBKdW4gMTMsIDIwMjYgYXQgNjo1MeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHRoZSB0cmFwIGRlbGVnYXRp
b24gc2V0dXAgaXMgcGFydCBvZiBzYmlfaGFydC5jIGFuZAo+IGNhbGxlZCB2aWEgc2JpX2hhcnRf
aW5pdCgpIHdoZXJlYXMgdGhlIHBlci1oYXJ0IHRyYXAgKGFrYSBleGNlcHRpb24KPiBhbmQgaW50
ZXJydXB0KSBoYW5kbGluZyBpcyBwYXJ0IG9mIHNiaV90cmFwLmMuCj4KPiBNb3ZlIHRyYXAgZGVs
ZWdhdGlvbiBpbml0IHRvIHNiaV90cmFwLmMgYW5kIGNhbGwgaXQgdmlhIG5ldwo+IHNiaV90cmFw
X2luaXQoKSBmcm9tIGJvdGggY29sZCBib290IGFuZCB3YXJtIGJvb3QgcGF0aC4gVGhpcwo+IHdh
eSB0cmFwIGRlbGVnYXRpb24gc2V0dXAgaXMgaW4gc2FtZSBwbGFjZSBhcyB0cmFwIGhhbmRsaW5n
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0u
Y29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFu
a3MsCkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV90cmFwLmggfCAgMiArKwo+ICBsaWIv
c2JpL3NiaV9oYXJ0LmMgICAgIHwgNDYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgbGliL3NiaS9zYmlfaW5pdC5jICAgICB8ICA4ICsrKysrKysKPiAgbGliL3Ni
aS9zYmlfdHJhcC5jICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV90cmFwLmggYi9pbmNsdWRlL3Ni
aS9zYmlfdHJhcC5oCj4gaW5kZXggMDkxYTI0NDYuLjhkMmE2MzQ2IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvc2JpL3NiaV90cmFwLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfdHJhcC5oCj4gQEAg
LTI5MSw2ICsyOTEsOCBAQCBzdHJ1Y3Qgc2JpX3RyYXBfY29udGV4dCAqc2JpX3RyYXBfaGFuZGxl
cihzdHJ1Y3Qgc2JpX3RyYXBfY29udGV4dCAqdGNudHgpOwo+Cj4gIHN0cnVjdCBzYmlfdHJhcF9j
b250ZXh0ICpzYmlfdHJhcF9ybm1pX2hhbmRsZXIoc3RydWN0IHNiaV90cmFwX2NvbnRleHQgKnRj
bnR4KTsKPgo+ICtpbnQgc2JpX3RyYXBfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gs
IGJvb2wgY29sZF9ib290KTsKPiArCj4gICNlbmRpZgo+Cj4gICNlbmRpZgo+IGRpZmYgLS1naXQg
YS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCAyMTcxMzgx
Ni4uYmVlODg1NTcgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGli
L3NiaS9zYmlfaGFydC5jCj4gQEAgLTIxMSw0OCArMjExLDYgQEAgc3RhdGljIGludCBmcF9pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4K
PiAtc3RhdGljIGludCBkZWxlZ2F0ZV90cmFwcyhzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gp
Cj4gLXsKPiAtICAgICAgIGNvbnN0IHN0cnVjdCBzYmlfcGxhdGZvcm0gKnBsYXQgPSBzYmlfcGxh
dGZvcm1fcHRyKHNjcmF0Y2gpOwo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBpbnRlcnJ1cHRzLCBl
eGNlcHRpb25zOwo+IC0KPiAtICAgICAgIGlmICghbWlzYV9leHRlbnNpb24oJ1MnKSkKPiAtICAg
ICAgICAgICAgICAgLyogTm8gZGVsZWdhdGlvbiBwb3NzaWJsZSBhcyBtaWRlbGVnIGRvZXMgbm90
IGV4aXN0ICovCj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOwo+IC0KPiAtICAgICAgIC8qIFNl
bmQgTS1tb2RlIGludGVycnVwdHMgYW5kIG1vc3QgZXhjZXB0aW9ucyB0byBTLW1vZGUgKi8KPiAt
ICAgICAgIGludGVycnVwdHMgPSBNSVBfU1NJUCB8IE1JUF9TVElQIHwgTUlQX1NFSVA7Cj4gLSAg
ICAgICBpbnRlcnJ1cHRzIHw9IHNiaV9wbXVfaXJxX21hc2soKTsKPiAtCj4gLSAgICAgICBleGNl
cHRpb25zID0gKDFVIDw8IENBVVNFX01JU0FMSUdORURfRkVUQ0gpIHwgKDFVIDw8IENBVVNFX0JS
RUFLUE9JTlQpIHwKPiAtICAgICAgICAgICAgICAgICAgICAoMVUgPDwgQ0FVU0VfVVNFUl9FQ0FM
TCk7Cj4gLSAgICAgICBpZiAoc2JpX3BsYXRmb3JtX2hhc19tZmF1bHRzX2RlbGVnYXRpb24ocGxh
dCkpCj4gLSAgICAgICAgICAgICAgIGV4Y2VwdGlvbnMgfD0gKDFVIDw8IENBVVNFX0ZFVENIX1BB
R0VfRkFVTFQpIHwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgQ0FVU0Vf
TE9BRF9QQUdFX0ZBVUxUKSB8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDFVIDw8
IENBVVNFX1NUT1JFX1BBR0VfRkFVTFQpIHwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoMVUgPDwgQ0FVU0VfU1dfQ0hFQ0tfRVhDUCk7Cj4gLQo+IC0gICAgICAgLyoKPiAtICAgICAg
ICAqIElmIGh5cGVydmlzb3IgZXh0ZW5zaW9uIGF2YWlsYWJsZSB0aGVuIHdlIG9ubHkgaGFuZGxl
IGh5cGVydmlzb3IKPiAtICAgICAgICAqIGNhbGxzIChpLmUuIGVjYWxscyBmcm9tIEhTLW1vZGUp
IGluIE0tbW9kZS4KPiAtICAgICAgICAqCj4gLSAgICAgICAgKiBUaGUgSFMtbW9kZSB3aWxsIGFk
ZGl0aW9uYWxseSBoYW5kbGUgc3VwZXJ2aXNvciBjYWxscyAoaS5lLiBlY2FsbHMKPiAtICAgICAg
ICAqIGZyb20gVlMtbW9kZSksIEd1ZXN0IHBhZ2UgZmF1bHRzIGFuZCBWaXJ0dWFsIGludGVycnVw
dHMuCj4gLSAgICAgICAgKi8KPiAtICAgICAgIGlmIChtaXNhX2V4dGVuc2lvbignSCcpKSB7Cj4g
LSAgICAgICAgICAgICAgIGV4Y2VwdGlvbnMgfD0gKDFVIDw8IENBVVNFX1ZJUlRVQUxfU1VQRVJW
SVNPUl9FQ0FMTCk7Cj4gLSAgICAgICAgICAgICAgIGV4Y2VwdGlvbnMgfD0gKDFVIDw8IENBVVNF
X0ZFVENIX0dVRVNUX1BBR0VfRkFVTFQpOwo+IC0gICAgICAgICAgICAgICBleGNlcHRpb25zIHw9
ICgxVSA8PCBDQVVTRV9MT0FEX0dVRVNUX1BBR0VfRkFVTFQpOwo+IC0gICAgICAgICAgICAgICBl
eGNlcHRpb25zIHw9ICgxVSA8PCBDQVVTRV9WSVJUVUFMX0lOU1RfRkFVTFQpOwo+IC0gICAgICAg
ICAgICAgICBleGNlcHRpb25zIHw9ICgxVSA8PCBDQVVTRV9TVE9SRV9HVUVTVF9QQUdFX0ZBVUxU
KTsKPiAtICAgICAgIH0KPiAtCj4gLSAgICAgICBjc3Jfd3JpdGUoQ1NSX01JREVMRUcsIGludGVy
cnVwdHMpOwo+IC0gICAgICAgY3NyX3dyaXRlKENTUl9NRURFTEVHLCBleGNlcHRpb25zKTsKPiAt
Cj4gLSAgICAgICByZXR1cm4gMDsKPiAtfQo+IC0KPiAgdm9pZCBzYmlfaGFydF9kZWxlZ2F0aW9u
X2R1bXAoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNoYXIgKnByZWZpeCwgY29uc3QgY2hhciAqc3VmZml4KQo+ICB7Cj4g
QEAgLTc3MywxMCArNzMxLDYgQEAgaW50IHNiaV9oYXJ0X2luaXQoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoLCBib29sIGNvbGRfYm9vdCkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmM7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHJjID0gZGVsZWdhdGVfdHJhcHMoc2NyYXRj
aCk7Cj4gLSAgICAgICBpZiAocmMpCj4gLSAgICAgICAgICAgICAgIHJldHVybiByYzsKPiAtCj4g
ICAgICAgICByZXR1cm4gc2JpX2hhcnRfcmVpbml0KHNjcmF0Y2gpOwo+ICB9Cj4KPiBkaWZmIC0t
Z2l0IGEvbGliL3NiaS9zYmlfaW5pdC5jIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gaW5kZXggNjU4
ZmUzN2YuLjliYjFhMzdlIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2luaXQuYwo+ICsrKyBi
L2xpYi9zYmkvc2JpX2luaXQuYwo+IEBAIC0zMDksNiArMzA5LDEwIEBAIHN0YXRpYyB2b2lkIF9f
bm9yZXR1cm4gaW5pdF9jb2xkYm9vdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIHUzMiBo
YXJ0aWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgX19zdGFja19jaGtfZ3VhcmQgPSBndWFy
ZF92YWw7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIHJjID0gc2JpX3RyYXBfaW5pdChzY3JhdGNo
LCB0cnVlKTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFu
ZygpOwo+ICsKPiAgICAgICAgIHJjID0gc2JpX3RpbWVyX2luaXQoc2NyYXRjaCwgdHJ1ZSk7Cj4g
ICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsKPiBAQCAt
NDY2LDYgKzQ3MCwxMCBAQCBzdGF0aWMgdm9pZCBfX25vcmV0dXJuIGluaXRfd2FybV9zdGFydHVw
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAg
ICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+Cj4gKyAgICAgICByYyA9IHNiaV90cmFwX2luaXQo
c2NyYXRjaCwgZmFsc2UpOwo+ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICBzYmlf
aGFydF9oYW5nKCk7Cj4gKwo+ICAgICAgICAgcmMgPSBzYmlfdGltZXJfaW5pdChzY3JhdGNoLCBm
YWxzZSk7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hhbmco
KTsKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfdHJhcC5jIGIvbGliL3NiaS9zYmlfdHJhcC5j
Cj4gaW5kZXggMWU1NWI4ODUuLjE2Nzc0ZmQyIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3Ry
YXAuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX3RyYXAuYwo+IEBAIC00MTQsMyArNDE0LDUwIEBAIHN0
cnVjdCBzYmlfdHJhcF9jb250ZXh0ICpzYmlfdHJhcF9ybm1pX2hhbmRsZXIoc3RydWN0IHNiaV90
cmFwX2NvbnRleHQgKnRjbnR4KQo+ICAgICAgICAgLyogTmV2ZXIgcmV0dXJucyAqLwo+ICAgICAg
ICAgcmV0dXJuIHRjbnR4Owo+ICB9Cj4gKwo+ICtzdGF0aWMgaW50IGRlbGVnYXRlX3RyYXBzKHN0
cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiArewo+ICsgICAgICAgY29uc3Qgc3RydWN0IHNi
aV9wbGF0Zm9ybSAqcGxhdCA9IHNiaV9wbGF0Zm9ybV9wdHIoc2NyYXRjaCk7Cj4gKyAgICAgICB1
bnNpZ25lZCBsb25nIGludGVycnVwdHMsIGV4Y2VwdGlvbnM7Cj4gKwo+ICsgICAgICAgaWYgKCFt
aXNhX2V4dGVuc2lvbignUycpKQo+ICsgICAgICAgICAgICAgICAvKiBObyBkZWxlZ2F0aW9uIHBv
c3NpYmxlIGFzIG1pZGVsZWcgZG9lcyBub3QgZXhpc3QgKi8KPiArICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4gKwo+ICsgICAgICAgLyogU2VuZCBNLW1vZGUgaW50ZXJydXB0cyBhbmQgbW9zdCBl
eGNlcHRpb25zIHRvIFMtbW9kZSAqLwo+ICsgICAgICAgaW50ZXJydXB0cyA9IE1JUF9TU0lQIHwg
TUlQX1NUSVAgfCBNSVBfU0VJUDsKPiArICAgICAgIGludGVycnVwdHMgfD0gc2JpX3BtdV9pcnFf
bWFzaygpOwo+ICsKPiArICAgICAgIGV4Y2VwdGlvbnMgPSAoMVUgPDwgQ0FVU0VfTUlTQUxJR05F
RF9GRVRDSCkgfCAoMVUgPDwgQ0FVU0VfQlJFQUtQT0lOVCkgfAo+ICsgICAgICAgICAgICAgICAg
ICAgICgxVSA8PCBDQVVTRV9VU0VSX0VDQUxMKTsKPiArICAgICAgIGlmIChzYmlfcGxhdGZvcm1f
aGFzX21mYXVsdHNfZGVsZWdhdGlvbihwbGF0KSkKPiArICAgICAgICAgICAgICAgZXhjZXB0aW9u
cyB8PSAoMVUgPDwgQ0FVU0VfRkVUQ0hfUEFHRV9GQVVMVCkgfAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICgxVSA8PCBDQVVTRV9MT0FEX1BBR0VfRkFVTFQpIHwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoMVUgPDwgQ0FVU0VfU1RPUkVfUEFHRV9GQVVMVCkgfAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICgxVSA8PCBDQVVTRV9TV19DSEVDS19FWENQKTsK
PiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogSWYgaHlwZXJ2aXNvciBleHRlbnNpb24gYXZh
aWxhYmxlIHRoZW4gd2Ugb25seSBoYW5kbGUgaHlwZXJ2aXNvcgo+ICsgICAgICAgICogY2FsbHMg
KGkuZS4gZWNhbGxzIGZyb20gSFMtbW9kZSkgaW4gTS1tb2RlLgo+ICsgICAgICAgICoKPiArICAg
ICAgICAqIFRoZSBIUy1tb2RlIHdpbGwgYWRkaXRpb25hbGx5IGhhbmRsZSBzdXBlcnZpc29yIGNh
bGxzIChpLmUuIGVjYWxscwo+ICsgICAgICAgICogZnJvbSBWUy1tb2RlKSwgR3Vlc3QgcGFnZSBm
YXVsdHMgYW5kIFZpcnR1YWwgaW50ZXJydXB0cy4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYg
KG1pc2FfZXh0ZW5zaW9uKCdIJykpIHsKPiArICAgICAgICAgICAgICAgZXhjZXB0aW9ucyB8PSAo
MVUgPDwgQ0FVU0VfVklSVFVBTF9TVVBFUlZJU09SX0VDQUxMKTsKPiArICAgICAgICAgICAgICAg
ZXhjZXB0aW9ucyB8PSAoMVUgPDwgQ0FVU0VfRkVUQ0hfR1VFU1RfUEFHRV9GQVVMVCk7Cj4gKyAg
ICAgICAgICAgICAgIGV4Y2VwdGlvbnMgfD0gKDFVIDw8IENBVVNFX0xPQURfR1VFU1RfUEFHRV9G
QVVMVCk7Cj4gKyAgICAgICAgICAgICAgIGV4Y2VwdGlvbnMgfD0gKDFVIDw8IENBVVNFX1ZJUlRV
QUxfSU5TVF9GQVVMVCk7Cj4gKyAgICAgICAgICAgICAgIGV4Y2VwdGlvbnMgfD0gKDFVIDw8IENB
VVNFX1NUT1JFX0dVRVNUX1BBR0VfRkFVTFQpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGNz
cl93cml0ZShDU1JfTUlERUxFRywgaW50ZXJydXB0cyk7Cj4gKyAgICAgICBjc3Jfd3JpdGUoQ1NS
X01FREVMRUcsIGV4Y2VwdGlvbnMpOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+
ICtpbnQgc2JpX3RyYXBfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIGJvb2wgY29s
ZF9ib290KQo+ICt7Cj4gKyAgICAgICByZXR1cm4gZGVsZWdhdGVfdHJhcHMoc2NyYXRjaCk7Cj4g
K30KPiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
