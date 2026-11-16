Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4644606A32F
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=keW8O/lc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Kl5atgTa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EH72hYYfR+zP3Pj97cUj1fBjCk/pZ0c8nW9lsatkzBo=; b=keW8O/lcdyOcw6M0EBMhHSNw/U
	bMs1HDlpjRkwynjCa0dTw846S50rZpxjVNB2RYZby3iC9KNvvOQFsh12gG3kPbpfjSFkxVwhH1OXR
	27UB0Mw5bhDaZVH77ayDMw7TCDoGrAFG7m2yNy9yVjl0W0WPnqqxND3NgYEe7le3QXsOMGx+hpC8/
	fWiVtUAAvIEIxnZhFjOVFzOK07QYAmyqDiy74rwl362phfbJn+gH9fLypUP08FmDe86fMQS+8kH/0
	JS723/9vO/AoM7gj3heL6jgQZUZ17AueIpy3RgxGadecXa9QLjiGfSRllVY7bEZB621aBC8QJ4eP6
	3F5JdkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwcx-00000002aMi-2K4x;
	Mon, 16 Nov 2026 13:20:07 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwcv-00000002aMK-1pwz
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 13:20:06 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3adef977ad9so30869251fa.1
        for <opensbi@lists.infradead.org>; Mon, 16 Nov 2026 05:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794835203; cv=none;
        d=google.com; s=arc-20260327;
        b=TFB2rW0KPbwEO5rcxLslPH+60jq+HhG0558qgCIcIpHGdZw9HvBUYp8zgqQmqHglWW
         QRQSXbsMGMtQrUSUE4Ms+VpCXNnyqWDmSVdFxr1p72aaFRi6HPm5Lx6obxueDdrU+lq6
         0Z2mp/O25Gdtbev9IS3xLyuLH0yO/HDwGDTJ1mqrKvkcW1mMDT09DVlFJ1HqXuG406et
         l6fK4CpCSQuMDG9faAob02sLDhBc5AarppN8fZ1M9aPGirkzr1xG/rIunB+Jl/9dJd4m
         qOFG7ER8q+F4NWzo5cNTjMT1rI0mAHG5l8QR4n0ihWbZmX+UBz8FcczU3PcY8/PcimZG
         /JVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCOU/37Xm3aRHdaaAPm9NFTuYXRhDnr3rd3Al56anqE=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=bg0oRIFOjo4sjJBl+RBDUxbuVDKajyuNRKR4yR1d7PPzEwd+vWWLiwJpp7T1I9ZBHy
         iTc5waMsuT1h9rQeyOCmO1mJz9SHX7KZLxfps1fHo0vqyyVz5K9stdz0ROz2/T0kVjin
         Zdag2nCQJQQ5LKMSWWSOYFTEwhI33RZNRy6sRHbAE08Qc+TwDysuJ56G7jzhfuSBnZZY
         D5S99/wCKImyg+eydNKENpzPG7irEABjl3LAwfy5KMG8wW6fL0N50mpC6Tu6E8bbWha2
         fs8/GkeeNDv3JBBuflX4rX5hZ707xXDLVBdhRI9kpkID2tYje1HI1YGLaWrmGU4MyHan
         cw5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794835203; x=1795440003; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCOU/37Xm3aRHdaaAPm9NFTuYXRhDnr3rd3Al56anqE=;
        b=Kl5atgTaRj0LsTkEiaqPJo6VVk8QsPzTx+ddg9o4oLWdbkKver3aN6Ma7UnfArHO79
         aEU3Cu98TN9eXm3ca+lGwHeTTMR6dxU0dOCzZgupcRVzPIoQvTQRSj4trDibJ54X6kvB
         SOZXJUCMAMrVjzqtakFo1YpQBDQn+ApqoRYjq/6Ed3yI75Y8LS8pIuuH5fJcBuqnqdO3
         hiWrd8QFyHfDJbk/Hy7ZpaweqTlL4yr+wacKo5ERKW1Mfl3r4FfATVMZzWgxePC3I/ZM
         0LFtQEPun47SAZb/JAMlLPHDE4ardQWQDDOWEy7936zY1WFXoTFS0AskhJmeGwft+zk6
         dFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835203; x=1795440003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCOU/37Xm3aRHdaaAPm9NFTuYXRhDnr3rd3Al56anqE=;
        b=foUbettSYzrH0I/KVZBxBqO15d1O5Y4xxBHO1b4ocxZglLYB/NclyxKrNj6AbiArDf
         Pd0itltRWyATudChXb5KHVc/EKTd2l7jIbtxLEGLQGmlOD/EIWQntIgolPY+d3nQVhcs
         ptZhyvP7wDFykEDjjZ1Tq/MbIHPNjE0znLx9dkFGTvDuyDu8KjlbPLfc3O8tixVslXQ9
         zDgXQmUzj5OYVVat6EOnFFWClSLGbOBljExQkkkA9eFJX9V5mJ6+nHa0rfTvJtJs2F5F
         nR1HC40tfKBhX71WfP5XYBd6kAskQYHU0ar2Ywd3V9tr2zo4F3rx/L8FsYVI/BFm1Alg
         X2ow==
X-Gm-Message-State: APuU4Z/WvrGLuRjFwcvPtAsoiCT+YSw8xJ7FkUSV1po5+zz/G8mZBg9T
	BKZ0JIPIx0lKUw0C4Cot2WHigSG+eUzNlmaxcRnuWMh37fAjA0etMSCYgSBUSG4INgzJv4eiwxJ
	CZcbQNAQyuo0jsknbzaetshjZdu5xE8DgNwtJf7qbdw==
X-Gm-Gg: AYBFou3NNyc2pVNP3ox3bdzXT8T99S4z88Y07L202uPNXgrJlPo5oBeDRTpF9W1gxIZ
	Hwaaa1Aw8+bo+uEizsmPPjJKfcWEjbnFHHBtZpszYoJPaz2XgBhFBimZMmWWQcjCmoSMbRSQv/x
	RCM5MQhj9f7Y5NqxgjLmgKsb27ghcFvfxBbjB57FinrfWjZ2vBK3rh/+iQ5AnG4xwEqWMjWiSFY
	fUH9Laj0BHR2VJcPNjJ6HUJp7Adcv7MMhYS2NIerTo2+E6rV02V9XmlmdMPclLl60sLo9c+BA2X
	YmB+z6BiGORCfVDP2KTqLp2VZdBtcALHzEMRqXCoKZISedtCqZB93ylivltrwpRSryfb6q433pa
	7yf9eBixlxno7pv0ejm7t/SY7Iff9PDinEExGXs0x6FEHa9jB6Alnkko8BzXSjT2lb7wF6Q0+Gv
	1Ux7bdEbyPL2Gs3CTiQm3UdRTfPY9AHnYXitiv+/plWPaN87DoQYLyitBv/zgsUnN2lL3HG7L1G
	21EVw==
X-Received: by 2002:a05:651c:1987:b0:3ab:4458:ba24 with SMTP id
 38308e7fff4ca-3ae2b52a6b6mr31789941fa.21.1794835203180; Mon, 16 Nov 2026
 05:20:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-5-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-5-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Nov 2026 18:49:50 +0530
X-Gm-Features: Aa3M54ro1wecKERetvb8dJYhk4HSWIe1i9-NcGDy5epzupiBz-FHQT5a0WgGfKI
Message-ID: <CAAhSdy2=JhtXg_h==eiet7nJ-VMaq7VCMgmVuha-uwQKkVEmMw@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052005_532826_09085E37 
X-CRM114-Status: GOOD (  17.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMzoyMOKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gTG9jayB0aGUgTS1tb2RlIFdvcmxkIElEICht
d2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5pdGlhbGl6YXRpb24KPiB0byBlbmZvcmNlIGltbXV0
YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlzaGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+Cj4g
T3BlblNCSSBkb2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBpdHNlbGY7IGl0IG9ubHkgc2V0
cyBNV0lEX0xPQ0sKPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJv
VCBzdGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiBhdCBYTEVOLTEgaXMgc3RpY2t5IGFuZCBtYWtl
cyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5mb3JjaW5nCj4gYSB0ZW1wb3JhbCBz
ZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBXb3JsZHMgc3BlY2lmaWNhdGlvbi4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+
Cj4gLS0tCj4gQ2hhbmdlcyB2NC0+djU6Cj4gLSBNb3ZlIHRoZSBNV0lEIGxvY2sgb3V0IG9mIHNi
aV9oYXJ0X3JlaW5pdCgpIGludG8gc213aWRfaGFydF9pbml0KCkKPiAtIERyb3AgUkItdGFncyBm
cm9tIE96YSBhbmQgQW51cAo+IC0tLQo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAxMiArKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCBkODZhYmYw
Ny4uYTcyMWJlZjQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGli
L3NiaS9zYmlfaGFydC5jCj4gQEAgLTQ2OSw2ICs0NjksMTYgQEAgc3RhdGljIGludCBoYXJ0X21o
cG1fZ2V0X2FsbG93ZWRfYml0cyh2b2lkKQo+ICAgICAgICAgcmV0dXJuIG51bV9iaXRzOwo+ICB9
Cj4KPiArc3RhdGljIHZvaWQgc213aWRfaGFydF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2Ny
YXRjaCkKPiArewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEFzc3VtZSBNV0lEIGlzIHJlc3Rv
cmVkIGJ5IHJvb3Qtb2YtdHJ1c3QgTS1tb2RlIGluIHByZXZpb3VzCj4gKyAgICAgICAgKiBzdGFn
ZS4gTG9jayBtd2lkIHNvIFJvVC1kZWZpbmVkIFdJRCByZW1haW5zIGltbXV0YWJsZS4KPiArICAg
ICAgICAqLwo+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJ
X0hBUlRfRVhUX1NNV0lEKSkKPiArICAgICAgICAgICAgICAgY3NyX3NldChDU1JfTVdJRCwgTVdJ
RF9MT0NLKTsKCklmIHBtd2lkIGlzIGF2YWlsYWJsZSB0aGVuIHdlIHNob3VsZCBzZXQgcG13aWQg
aW4gTVdJRCBDU1IKYmVmb3JlIGxvY2tpbmcgaXQuIFRoaXMgd2lsbCBoZWxwIHBsYXRmb3JtcyB3
aGVyZSBPcGVuU0JJIGJvb3RzCmZpcnN0IHdpdGhvdXQgYW55IHByaW9yIGJvb3Rpbmcgc3RhZ2Uu
CgpXaGF0IGRvIHlvdSB0aGluayA/Cgo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHNtcm5taV9oYXJ0
X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICB7Cj4gICAgICAgICBjb25zdCBz
dHJ1Y3Qgc2JpX3BsYXRmb3JtICpwbGF0Owo+IEBAIC03MjEsNiArNzMxLDggQEAgaW50IHNiaV9o
YXJ0X3JlaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gIHsKPiAgICAgICAgIGlu
dCByYzsKPgo+ICsgICAgICAgc213aWRfaGFydF9pbml0KHNjcmF0Y2gpOwo+ICsKPiAgICAgICAg
IHJjID0gc21ybm1pX2hhcnRfaW5pdChzY3JhdGNoKTsKPiAgICAgICAgIGlmIChyYykKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJjOwo+IC0tCj4gMi40My43Cj4KClJlZ2FyZHMsCkFudXAKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
